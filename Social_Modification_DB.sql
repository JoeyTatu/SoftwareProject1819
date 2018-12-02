DROP SCHEMA IF EXISTS soc;
CREATE SCHEMA soc;
USE soc;

CREATE TABLE User(
	user_id INT AUTO_INCREMENT NOT NULL,
    user_name VARCHAR(255),
    profile_pic BLOB,
    email VARCHAR(255) NOT NULL,
    encrypted_password BLOB,
    date_of_birth DATE NOT NULL,
    city VARCHAR(255),
    country VARCHAR(255),
    facebook_connected BOOLEAN NOT NULL,
    facebook_id INT,
    PRIMARY KEY (user_id)
	);
    
CREATE TABLE Album(
	album_id INT AUTO_INCREMENT NOT NULL,
    album_name VARCHAR(255) NOT NULL,
    no_of_files INT NOT NULL,
    user_id INT NOT NULL,
    link VARCHAR(255),
    PRIMARY KEY (album_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
    );
    
Create Table Media(
	media_id INT AUTO_INCREMENT NOT NULL,
    description VARCHAR(50),
    file_type ENUM("jpg", "jpeg", "png", "gif","avi","3gp", "mp4") NOT NULL,
    file BLOB,
    user_id INT NOT NULL,
    album_id INT NOT NULL,
    link VARCHAR(255) NOT NULL,
    PRIMARY KEY (media_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
    );
    
CREATE TABLE Message(
	message_id INT AUTO_INCREMENT NOT NULL,
    user1 INT NOT NULL,
    user2 INT NOT NULL,
    message VARCHAR(255) NOT NULL,
    created DATETIME NOT NULL,
    PRIMARY KEY (message_id),
    FOREIGN KEY (user1) REFERENCES User(user_id),
	FOREIGN KEY (user2) REFERENCES User(user_id)
    );
    
CREATE TABLE Group_Chat(
	group_chat_session_key INT NOT NULL,
    user_id INT NOT NULL,
    login_date_time DATETIME NOT NULL,
    url VARCHAR(255) NOT NULL,
    PRIMARY KEY (group_chat_session_key),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
    );
    
CREATE TABLE Chatbot(
	chatbot_session_id INT NOT NULL,
    user_id INT NOT NULL,
    predefined_messages VARCHAR(255),
    search_terms_received VARCHAR(255),
    return_article BOOLEAN NOT NULL,
    return_article_link VARCHAR(255),
    PRIMARY KEY (chatbot_session_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
    );
    
CREATE TABLE Shop(
	shop_id INT AUTO_INCREMENT NOT NULL,
    shop_name VARCHAR(255),
    shop_address VARCHAR(255),
    shop_city VARCHAR(255),
    shop_phone VARCHAR(20),
    average_rating DOUBLE NOT NULL,
    PRIMARY KEY (shop_id)
    );
    
CREATE TABLE Shop_Review(
	review_id INT AUTO_INCREMENT NOT NULL,
    user_id INT NOT NULL,
    rating INT(2),
    comment VARCHAR(255),
    shop_id INT NOT NULL,
    PRIMARY KEY (review_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (shop_id) REFERENCES Shop(shop_id)
    );

    
    
    