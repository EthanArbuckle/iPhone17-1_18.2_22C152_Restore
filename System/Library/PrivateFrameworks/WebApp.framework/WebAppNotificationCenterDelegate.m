@interface WebAppNotificationCenterDelegate
+ (id)sharedDelegate;
- (WebAppNotificationCenterDelegate)init;
- (void)addWebAppViewController:(id)a3;
- (void)removeWebAppViewController:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WebAppNotificationCenterDelegate

+ (id)sharedDelegate
{
  if (sharedDelegate_onceToken != -1) {
    dispatch_once(&sharedDelegate_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedDelegate_sharedDelegate;

  return v2;
}

void __50__WebAppNotificationCenterDelegate_sharedDelegate__block_invoke()
{
  v0 = objc_alloc_init(WebAppNotificationCenterDelegate);
  v1 = (void *)sharedDelegate_sharedDelegate;
  sharedDelegate_sharedDelegate = (uint64_t)v0;

  uint64_t v2 = sharedDelegate_sharedDelegate;
  id v3 = [MEMORY[0x263F1DFB0] currentNotificationCenter];
  [v3 setDelegate:v2];
}

- (WebAppNotificationCenterDelegate)init
{
  v7.receiver = self;
  v7.super_class = (Class)WebAppNotificationCenterDelegate;
  uint64_t v2 = [(WebAppNotificationCenterDelegate *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    webAppViewControllers = v2->_webAppViewControllers;
    v2->_webAppViewControllers = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)addWebAppViewController:(id)a3
{
  webAppViewControllers = self->_webAppViewControllers;
  id v4 = a3;
  id v6 = [v4 webClip];
  v5 = [v6 identifier];
  [(NSMutableDictionary *)webAppViewControllers setObject:v4 forKeyedSubscript:v5];
}

- (void)removeWebAppViewController:(id)a3
{
  id v9 = a3;
  id v4 = [v9 webClip];
  v5 = [v4 identifier];

  if (v5)
  {
    webAppViewControllers = self->_webAppViewControllers;
    objc_super v7 = [v9 webClip];
    v8 = [v7 identifier];
    [(NSMutableDictionary *)webAppViewControllers setObject:0 forKeyedSubscript:v8];
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = (void (**)(void))a5;
  id v9 = [v7 actionIdentifier];
  char v10 = [v9 isEqualToString:*MEMORY[0x263F1E0C8]];

  if (v10)
  {
    webAppViewControllers = self->_webAppViewControllers;
    v12 = [v7 notification];
    v13 = [v12 request];
    v14 = [v13 content];
    v15 = [v14 targetContentIdentifier];
    v16 = [(NSMutableDictionary *)webAppViewControllers objectForKeyedSubscript:v15];

    if (v16)
    {
      v17 = [v7 notification];
      v18 = [v17 request];
      v19 = [v18 content];
      v20 = [v19 userInfo];
      [v16 notificationActivated:v20];
    }
    else
    {
      v17 = viewServiceLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        v8[2](v8);
        goto LABEL_11;
      }
      v18 = [v7 notification];
      v19 = [v18 request];
      v20 = [v19 content];
      v23 = [v20 targetContentIdentifier];
      int v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_23D520000, v17, OS_LOG_TYPE_INFO, "Received UNNotificationResponse for WebClip %{public}@, but cannot find associated WebAppViewController", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_10;
  }
  v21 = viewServiceLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = [v7 actionIdentifier];
    int v24 = 138412290;
    v25 = v22;
    _os_log_impl(&dword_23D520000, v21, OS_LOG_TYPE_INFO, "Received UNNotificationResponse that was not for the default action: %@", (uint8_t *)&v24, 0xCu);
  }
  v8[2](v8);
LABEL_11:
}

- (void).cxx_destruct
{
}

@end