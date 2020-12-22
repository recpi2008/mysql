-- тип инструмента (акции, облигации, золото и т.д) №1
DROP TABLE IF EXISTS type_instruments;
CREATE TABLE type_instruments (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Индификатор строки",
name VARCHAR(255) NOT NULL COMMENT "Тип инструмента",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Тип финансового инструмента";

-- сам фин.инструмент №2
DROP TABLE IF EXISTS instruments;
CREATE TABLE instruments (
id SERIAL PRIMARY KEY COMMENT "Индификатор строки",
name VARCHAR(255) NOT NULL COMMENT "Имя инструмента",
ticker VARCHAR(255) COMMENT "Краткое имя инструмента",
type_instrument_id INT UNSIGNED NOT NULL COMMENT "Тип инструмента",
country_id INT UNSIGNED NOT NULL COMMENT "Страна инструмента",
market_id INT UNSIGNED COMMENT "Индификатор рынка",
exchange_id INT UNSIGNED NOT NULL  COMMENT "Индификатор биржы",
description TEXT COMMENT 'Описание инструмента',
stock_id BIGINT UNSIGNED COMMENT "Текущиe котировки",
calendar_event_id BIGINT UNSIGNED COMMENT 'Календарь событий',
news_id BIGINT UNSIGNED  COMMENT 'Новости по инструменту',
technical_analysis_id BIGINT UNSIGNED COMMENT "Технический анализ",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Финансовый инструмент";

-- котировки №3
DROP TABLE IF EXISTS stocks;
CREATE TABLE stocks (
id SERIAL COMMENT "Индификатор строки",
instrument_id BIGINT UNSIGNED NOT NULL COMMENT "Текущий инструмент",
open_price DECIMAL (11,2) COMMENT 'Цена открытия',
high_price DECIMAL (11,2) COMMENT 'Максимальная цена',
low_price DECIMAL (11,2) COMMENT 'Минимальная цена',
close_price DECIMAL (11,2) COMMENT 'Цена закрытия',
volume DECIMAL (11,2) COMMENT 'Объем',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
PRIMARY KEY (id, instrument_id) COMMENT "Составной первичный ключ"
) COMMENT "Котировки";


-- технический анализ №4
DROP TABLE IF EXISTS technical_analyzes;
CREATE TABLE technical_analyzes (
id SERIAL PRIMARY KEY COMMENT "Индификатор строки",
indicator_id INT UNSIGNED NOT NULL COMMENT "Текущий индикатор",
period_id INT UNSIGNED NOT NULL COMMENT "Текущий период",
recommendation_id INT UNSIGNED NOT NULL COMMENT "Текущая рекомендация",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Технический анализ";


-- индикаторы тех.анализа №5
DROP TABLE IF EXISTS indicators;
CREATE TABLE indicators (
id INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY COMMENT "Индификатор строки",
name VARCHAR(255) NOT NULL COMMENT "Имя индикатора",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Индикаторы";

-- периоды для рекомендаций №6
DROP TABLE IF EXISTS periods;
CREATE TABLE periods (
id INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY COMMENT "Индификатор строки",
name VARCHAR(255) NOT NULL COMMENT "Имя периода",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Периоды";


-- статусы рекомендаций №7
DROP TABLE IF EXISTS recommendations;
CREATE TABLE recommendations (
id INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY COMMENT "Индификатор строки",
name VARCHAR(255) NOT NULL COMMENT "Статус рекомендации",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Статусы рекомендации";


-- календарь событий №8
DROP TABLE IF EXISTS calendar_events;
CREATE TABLE calendar_events (
id SERIAL PRIMARY KEY COMMENT "Индификатор строки",
description_event TEXT COMMENT 'Описание события',
comment_even TEXT COMMENT 'Коментарий события',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Календарь событий";

-- новости №9
DROP TABLE IF EXISTS news;
CREATE TABLE news (
id SERIAL PRIMARY KEY COMMENT "Индификатор строки",
description_news TEXT COMMENT 'Описание новости',
status_news_id INT UNSIGNED NOT NULL COMMENT 'Статус новости',
author_news_id INT UNSIGNED NOT NULL COMMENT 'Автор публикации',
resource_news_id INT UNSIGNED NOT NULL COMMENT 'Источник публикации',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Новости по инструменту";

-- Статус новости №10
DROP TABLE IF EXISTS status_news;
CREATE TABLE status_news (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Индификатор строки",
name VARCHAR(255) NOT NULL COMMENT "Статус новости",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Статус новости";

-- источник новости №11
DROP TABLE IF EXISTS resource_news;
CREATE TABLE resource_news (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Индификатор строки",
resource_name VARCHAR(255) NOT NULL COMMENT "Название ресурса",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Источник новости";


-- Список бирж №12
DROP TABLE IF EXISTS exchange_lists;
CREATE TABLE exchange_lists (
id INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY COMMENT "Индификатор строки",
name VARCHAR (100) NOT NULL COMMENT "Название биржи",
short_name VARCHAR(100) NOT NULL COMMENT "Короткое название биржи",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Список бирж";


-- инфо о пользователе №14
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки", 
  email VARCHAR(100) NOT NULL UNIQUE COMMENT "Почта",
  phone VARCHAR(100) NOT NULL UNIQUE COMMENT "Телефон",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи"; 

-- профиль позьзователя №15
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY COMMENT "Ссылка на пользователя", 
  first_name VARCHAR(100) NOT NULL COMMENT "Имя пользователя",
  last_name VARCHAR(100) NOT NULL COMMENT "Фамилия пользователя",
  patronymic VARCHAR(100) COMMENT "Фамилия пользователя",
  gender_id INT UNSIGNED NOT NULL COMMENT "Пол",
  birthday DATE COMMENT "Дата рождения",
  photo_passport VARCHAR(100) COMMENT "Ссылка на фотографию паспорта",
  city_id INT UNSIGNED COMMENT "Город проживания",
  country_id  INT UNSIGNED COMMENT "Страна проживания",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Профили";

-- список полов №16
DROP TABLE IF EXISTS genders;
CREATE TABLE genders (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL COMMENT "пол", 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Список полов";


-- список стран №17
DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  short_name VARCHAR(100) NOT NULL COMMENT "Короткое название cтраны",
  name VARCHAR(100) NOT NULL COMMENT "Название cтраны",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Список стран";

-- список городов №18
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(100) NOT NULL COMMENT "Название города", 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Список городов";

-- тин счета №19
DROP TABLE IF EXISTS type_accounts;
CREATE TABLE type_accounts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Индикатор строки", 
  name_account VARCHAR(100) NOT NULL COMMENT "Имя (тип) счета", 
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Тип счета";

-- промежуточна таблица связь пользователя и счета №20
DROP TABLE IF EXISTS users_accounts;
CREATE TABLE users_accounts (
   user_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя", 
  type_account_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип счета",
  balance DECIMAL (11,1) COMMENT 'Баланс счета',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  PRIMARY KEY (user_id, type_account_id) COMMENT "Составной первичный ключ"
) COMMENT "Таблица счетов пользователя";

-- позиция пользователя в сделке (short or long) №21
DROP TABLE IF EXISTS positions;
CREATE TABLE positions (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name_position VARCHAR(100) NOT NULL COMMENT "Имя позиции",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Позиции по инструменту";


-- сделки пользователя №22
DROP TABLE IF EXISTS users_instruments;
CREATE TABLE users_instruments (
  user_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя", 
  instrument_id BIGINT UNSIGNED COMMENT 'Инструмент',
  buy_price DECIMAL (11,1) COMMENT 'Цена открытия сделки',
sell_price DECIMAL (11,1) COMMENT 'Цена закрытия сделки',
volume INT UNSIGNED COMMENT 'Объем',
position_id INT UNSIGNED COMMENT 'Позиция',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  PRIMARY KEY (user_id, instrument_id) COMMENT "Составной первичный ключ"
) COMMENT "Инструменты пользователя";



-- календарь выпуска ipo (первичное публичное размещение) №23
DROP TABLE IF EXISTS calendar_ipos;
CREATE TABLE calendar_ipos (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Индификатор строки", 
name_ipo VARCHAR(255) NOT NULL COMMENT "Имя ipo",
ticker VARCHAR(255) NOT NULL COMMENT "Краткое имя",
photo_ipo VARCHAR(255) NOT NULL COMMENT "Путь к файлу фото ipo",
date_placement DATE COMMENT "Дата размещения",
starting_price DECIMAL (11,2) COMMENT 'Начальная цена диапазона цены размещения',
final_price DECIMAL (11,2) COMMENT 'Конечная цена диапазона цены размещения',
description TEXT COMMENT 'Описание инструмента',
prospectus VARCHAR(255) NOT NULL COMMENT "Путь к файлу Проспект эмиссии",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Календарь ipo"; 

-- отношение пользователя с ipo №24
DROP TABLE IF EXISTS ipos_users;
CREATE TABLE ipos_users (
  calendar_ipo_id INT UNSIGNED NOT NULL COMMENT "Ссылка на ipo",
  user_id BIGINT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  status_request_id INT UNSIGNED NOT NULL COMMENT "Статус запроса к ipo",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки",
  PRIMARY KEY (calendar_ipo_id, user_id) COMMENT "Составной первичный ключ"
) COMMENT "связь между пользователями и его запросом ipo";

-- статус ipo №25
DROP TABLE IF EXISTS status_requests;
CREATE TABLE status_requests (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Индификатор строки",
status_ipo VARCHAR(100) NOT NULL COMMENT "Статус ipo"
) COMMENT "Статусы ipo";

-- Список рынков №26
DROP TABLE IF EXISTS markets;
CREATE TABLE markets (
id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY COMMENT "Индификатор строки",
market_name VARCHAR (100) NOT NULL COMMENT "Название рынка",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Список бирж";

-- автор публикации №27
DROP TABLE IF EXISTS author_news;
CREATE TABLE author_news (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Индификатор строки",
first_name VARCHAR(255) NOT NULL COMMENT "Автор",
last_name VARCHAR(255) NOT NULL COMMENT "Автор",
resource_id INT UNSIGNED NOT NULL COMMENT "Индификатор ресурса",
created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Источник новости";

