@interface ABSContactsSource
- (ABSContactsSource)initWithKeys:(id)a3 store:(id)a4;
- (BOOL)isReset;
- (CNContactStore)store;
- (NSArray)keysToFetch;
- (NSData)historyAnchor;
- (ct_green_tea_logger_s)gtLogger;
- (double)progress;
- (void)dealloc;
- (void)setGtLogger:(ct_green_tea_logger_s *)a3;
- (void)setHistoryAnchor:(id)a3;
- (void)setKeysToFetch:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation ABSContactsSource

- (ABSContactsSource)initWithKeys:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ABSContactsSource;
  v8 = [(ABSContactsSource *)&v10 init];
  if (v8)
  {
    if (!v6)
    {
      v11 = CNContactIdentifierKey;
      id v6 = +[NSArray arrayWithObjects:&v11 count:1];
    }
    [(ABSContactsSource *)v8 setKeysToFetch:v6];
    [(ABSContactsSource *)v8 setGtLogger:ct_green_tea_logger_create()];
    [(ABSContactsSource *)v8 setStore:v7];
  }

  return v8;
}

- (void)dealloc
{
  [(ABSContactsSource *)self gtLogger];
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ABSContactsSource;
  [(ABSContactsSource *)&v3 dealloc];
}

- (double)progress
{
  return 0.0;
}

- (BOOL)isReset
{
  return 0;
}

- (ct_green_tea_logger_s)gtLogger
{
  return self->_gtLogger;
}

- (void)setGtLogger:(ct_green_tea_logger_s *)a3
{
  self->_gtLogger = a3;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (void)setKeysToFetch:(id)a3
{
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSData)historyAnchor
{
  return self->_historyAnchor;
}

- (void)setHistoryAnchor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyAnchor, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_keysToFetch, 0);
}

@end