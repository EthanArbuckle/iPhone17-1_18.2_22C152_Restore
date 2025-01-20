@interface NPKPassUserNotificationFactory
- (NPKPassUserNotificationFactory)init;
- (NPKPassUserNotificationFactory)initWithDataSource:(id)a3;
- (NPKPassUserNotificationFactoryDataSource)dataSource;
- (id)passNotificationWithType:(unint64_t)a3 passUniqueID:(id)a4;
- (void)setDataSource:(id)a3;
@end

@implementation NPKPassUserNotificationFactory

- (NPKPassUserNotificationFactory)init
{
  return [(NPKPassUserNotificationFactory *)self initWithDataSource:0];
}

- (NPKPassUserNotificationFactory)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NPKPassUserNotificationFactory;
  v5 = [(NPKPassUserNotificationFactory *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (id)passNotificationWithType:(unint64_t)a3 passUniqueID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [(NPKPassUserNotificationFactory *)self dataSource];
  objc_super v8 = [(NPKUserNotificationExpressModeEnabled *)v7 passWithUniqueID:v6];

  if (v8)
  {
    if (a3 < 2)
    {
      v9 = [NPKUserNotificationExpressModeEnabled alloc];
      v10 = v8;
      uint64_t v11 = 0;
    }
    else if (a3 == 2)
    {
      v9 = [NPKUserNotificationExpressModeEnabled alloc];
      v10 = v8;
      uint64_t v11 = 1;
    }
    else
    {
      if (a3 != 3) {
        goto LABEL_14;
      }
      v9 = [NPKUserNotificationExpressModeEnabled alloc];
      v10 = v8;
      uint64_t v11 = 2;
    }
    v7 = [(NPKUserNotificationExpressModeEnabled *)v9 initWithPass:v10 expressNotificationType:v11];
  }
  else
  {
    v12 = pk_General_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = pk_General_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Warning: Fail to find pass for notification with uniqueID:%@", (uint8_t *)&v16, 0xCu);
      }
    }
    v7 = 0;
  }
LABEL_14:

  return v7;
}

- (NPKPassUserNotificationFactoryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
  }
  else
  {
    id v4 = [MEMORY[0x263F5BF80] sharedInstance];
  }
  v5 = v4;

  return (NPKPassUserNotificationFactoryDataSource *)v5;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end