 /* ALTER TABLE table_name DROP FOREIGN KEY constraint_name;*/

-- Таблица instruments
DESC type_instruments;
DESC instruments;

ALTER TABLE instruments
  ADD CONSTRAINT instruments_type_instrument_id_fk 
    FOREIGN KEY (type_instrument_id) REFERENCES type_instruments(id)
      ON DELETE CASCADE;
     
DESC countries;
ALTER TABLE instruments
  ADD CONSTRAINT instruments_country_id_fk 
    FOREIGN KEY (country_id) REFERENCES countries(id)
      ON DELETE CASCADE;
     
DESC exchange_lists;
ALTER TABLE instruments
  ADD CONSTRAINT instruments_exchange_id_fk 
    FOREIGN KEY (exchange_id) REFERENCES exchange_lists(id)
      ON DELETE CASCADE;
    
DESC stocks;
ALTER TABLE instruments
  ADD CONSTRAINT instruments_stock_id_fk 
    FOREIGN KEY (stock_id) REFERENCES stocks(id)
      ON DELETE SET DEFAULT; 
     
DESC calendar_events;
ALTER TABLE instruments
  ADD CONSTRAINT instruments_calendar_event_id_fk 
    FOREIGN KEY (calendar_event_id) REFERENCES calendar_events(id)
      ON DELETE SET NULL; 
     
DESC news; 
ALTER TABLE instruments
  ADD CONSTRAINT instruments_news_id_fk 
    FOREIGN KEY (news_id) REFERENCES news(id)
      ON DELETE SET NULL; 

     
DESC technical_analyzes;
ALTER TABLE instruments
  ADD CONSTRAINT instruments_technical_analysis_id_fk 
    FOREIGN KEY (technical_analysis_id) REFERENCES technical_analyzes(id)
      ON DELETE SET NULL; 
     
ALTER TABLE instruments
  ADD CONSTRAINT instruments_market_id_fk 
    FOREIGN KEY (market_id) REFERENCES markets(id)
      ON DELETE SET NULL; 
 
 -- Таблица news
 DESC news;
   
 ALTER TABLE news
  ADD CONSTRAINT news_status_news_id_fk 
    FOREIGN KEY (status_news_id) REFERENCES status_news(id);  
   
 ALTER TABLE news
  ADD CONSTRAINT news_author_news_id_fk 
    FOREIGN KEY (author_news_id) REFERENCES author_news(id);    
  
DESC resource_news;
ALTER TABLE news
  ADD CONSTRAINT news_resource_news_id_fk 
    FOREIGN KEY (resource_news_id) REFERENCES resource_news(id);   
   
-- Таблица technical_analyzes
DESC technical_analyzes;  
DESC indicators;
DESC periods;
DESC recommendations;   
   
ALTER TABLE technical_analyzes
  ADD CONSTRAINT technical_analyzes_indicator_id_fk 
    FOREIGN KEY (indicator_id) REFERENCES indicators(id);   
   
ALTER TABLE technical_analyzes
  ADD CONSTRAINT technical_analyzes_period_id_fk 
    FOREIGN KEY (period_id) REFERENCES periods(id);  
   
ALTER TABLE technical_analyzes
  ADD CONSTRAINT technical_analyzes_recommendation_id_fk 
    FOREIGN KEY (recommendation_id) REFERENCES recommendations(id); 
   
-- Таблица ipos_users
DESC ipos_users;

ALTER TABLE ipos_users
  ADD CONSTRAINT ipos_users_calendar_ipo_id_fk 
    FOREIGN KEY (calendar_ipo_id) REFERENCES calendar_ipos(id); 
   
ALTER TABLE ipos_users
  ADD CONSTRAINT ipos_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id); 
      
ALTER TABLE ipos_users
  ADD CONSTRAINT ipos_users_status_request_id_fk 
    FOREIGN KEY (status_request_id) REFERENCES status_requests(id);    

 DESC status_requests;  
   
 -- Таблица profiles
 DESC profiles;

 ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);       
   
DESC cities;
DESC countries;
   
 ALTER TABLE profiles
  ADD CONSTRAINT profiles_city_id_fk 
    FOREIGN KEY (city_id) REFERENCES cities(id);   
   
 ALTER TABLE profiles
  ADD CONSTRAINT profiles_country_id_fk 
    FOREIGN KEY (country_id) REFERENCES countries(id);   
   
ALTER TABLE profiles
  ADD CONSTRAINT profiles_gender_id_fk 
    FOREIGN KEY (gender_id) REFERENCES genders(id);    
   
-- Таблица users_instruments
DESC users_instruments;
DESC users;
DESC instruments;

ALTER TABLE users_instruments
  ADD CONSTRAINT users_instruments_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
   
 ALTER TABLE users_instruments  
ADD CONSTRAINT users_instruments_instrument_id_fk 
FOREIGN KEY (instrument_id) REFERENCES instruments(id);  

ALTER TABLE users_instruments  
ADD CONSTRAINT users_instruments_position_id_fk 
FOREIGN KEY (position_id) REFERENCES positions(id);

-- Таблица users_accounts
DESC users_accounts;
DESC type_accounts;

ALTER TABLE users_accounts  
ADD CONSTRAINT users_accounts_user_id_fk 
FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE users_accounts  
ADD CONSTRAINT users_accounts_type_account_id_fk 
FOREIGN KEY (type_account_id) REFERENCES type_accounts(id);









