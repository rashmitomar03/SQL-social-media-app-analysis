# 01 .Find the 5 oldest users of the instagram from the database.
select username ,created_at from users 
order by created_at 
limit 5 ; 

# 02 . Find the users who has never posted a single photo on instagram .
select username from users 
left join photos on photos.user_id = users.id
where photos.image_url is null 
order by users.username;

#03 Identify the winner of the contest and provide their details to the team .

select likes.photo_id,users.username ,count(likes.user_id) as count_of_likes 
from likes
inner join photos on likes.photo_id=photos.id
inner join users on photos.user_id =users.id
group by likes.photo_id,users.username 
order by count_of_likes desc;

#04. identify and suggest the top 5 most commonly used hastags on the platforms.

select t.tag_name, count(p.photo_id) as ht from photo_tags p inner join tags t on t .id = p.tag_id
group by t.tag_name 
order by ht desc; 

# 05 what day of the week do most users register on ? provide an insighton when to schedule an ad campaign .

 select * from photos ,users;
 select date_format((created_at), '%W') as d,count(username) from users group by 1 order by 2 desc;
 
 # 06 provide how many times does average users posts on instagram . also .provide the total number of photos 
 # on instagram / total number of users 
 
select * from photos , users ; 
with base as
 select u.id as userid , count (p.id) as photoid from users u left join photos p on p.user_id = u.id
 group by u.id)
 select sum (photo.id) as totalphotos , count(userid) as total_users, sum (photoid)/count(user id ) as photoperuser
 from base ;
 
 # 07 provide data on users ( bots) who have liked every single photo on the site ( since any normal user would 
 # not be able to do this 
 
 select * from users, likes ;
 with base as ( 
 select u .username , count(1.photo.id) as likess 1 inner join users u on u.id = 1.user_id
 group by u.username )
 select username , likess from base where likess = ( select count(*) from photos) order by username ; 
 