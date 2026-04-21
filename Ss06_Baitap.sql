CREATE DATABASE basb;
USE basb;

CREATE TABLE categories(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE posts(
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    cat_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories(category_name)
VALUES('Công nghệ'),
	  ('Đời sống'),
	  ('Giáo dục'),
	  ('Thể thao'),
	  ('Ẩm thực');
       
INSERT INTO posts(title, cat_id)
VALUES('Lộ diện iPhone 18', 1),
	  ('AI thay đổi thế giới', 1),
	  ('Cách nấu phở ngon', 2),
      ('Mẹo học tiếng Anh', 3),
      ('Bài viết không có danh mục 1', NULL),
      ('Bài viết không có danh mục 2', NULL);
      
SELECT
    p.post_id,
    p.title,
    p.content,
    p.cat_id AS category_id,
    c.category_name
FROM posts p
INNER JOIN categories c
ON p.cat_id = c.category_id;

SELECT
    p.post_id,
    p.title,
    p.content,
    p.cat_id AS category_id,
    c.category_name AS 'Tên danhh mục'
FROM posts p
LEFT JOIN categories c
ON p.cat_id = c.category_id;

SELECT *
FROM posts p
RIGHT JOIN categories c
ON p.cat_id = c.cat_id;

SELECT
    p.post_id,
    p.title,
    p.content,
    p.cat_id AS category_id,
    c.category_name
FROM posts p
WHERE p.cat_id IS NULL;

SELECT c.*
FROM categories c
LEFT JOIN posts p
ON c.category_id = p.cat_id
WHERE p.post_id IS NULL;

SELECT 
    c.category_name,
    COUNT(p.post_id) AS total_posts
FROM categories c
LEFT JOIN posts p
ON c.category_id = p.cat_id
GROUP BY c.category_id, c.category_name;

SELECT 
    p.post_id,
    p.title,
    c.category_name
FROM posts p
INNER JOIN categories c
ON p.cat_id = c.category_id
WHERE c.category_name = '%Công nghệ%';