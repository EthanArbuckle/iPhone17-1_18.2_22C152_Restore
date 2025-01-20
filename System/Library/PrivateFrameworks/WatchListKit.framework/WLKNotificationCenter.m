@interface WLKNotificationCenter
+ (id)defaultCenter;
- (BOOL)isCategoryBadgeSettingEnabledByUser:(int64_t)a3;
- (BOOL)isCategoryEnabledByUser:(int64_t)a3;
- (WLKNotificationCenter)init;
- (WLKNotificationCenterDelegate)delegate;
- (void)post:(id)a3 title:(id)a4 body:(id)a5 options:(id)a6;
- (void)setBadgeNumber:(id)a3 withCompletionHandler:(id)a4;
- (void)setBadgeString:(id)a3 withCompletionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation WLKNotificationCenter

- (void)setDelegate:(id)a3
{
}

- (void)setBadgeNumber:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (([v7 integerValue] & 0x8000000000000000) == 0) {
    [(WLKNotificationsImpl *)self->_impl setBadgeNumber:v7 withCompletionHandler:v6];
  }
}

uint64_t __38__WLKNotificationCenter_defaultCenter__block_invoke()
{
  defaultCenter__singleton = objc_alloc_init(WLKNotificationCenter);

  return MEMORY[0x1F41817F8]();
}

- (WLKNotificationCenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)WLKNotificationCenter;
  v2 = [(WLKNotificationCenter *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(WLKNotificationsImpl_iOS);
    impl = v2->_impl;
    v2->_impl = (WLKNotificationsImpl *)v3;
  }
  return v2;
}

+ (id)defaultCenter
{
  if (defaultCenter_onceToken != -1) {
    dispatch_once(&defaultCenter_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)defaultCenter__singleton;

  return v2;
}

- (void)post:(id)a3 title:(id)a4 body:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 length])
  {
    v14 = [v13 objectForKeyedSubscript:@"expirationDate"];
    v15 = [MEMORY[0x1E4F1C9C8] date];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 compare:v14] == 1)
    {
      NSLog(&cfstr_Wlknotificatio_0.isa);
    }
    else
    {
      impl = self->_impl;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __49__WLKNotificationCenter_post_title_body_options___block_invoke;
      v17[3] = &unk_1E620AD08;
      v17[4] = self;
      id v18 = v10;
      id v19 = v11;
      id v20 = v12;
      id v21 = v13;
      [(WLKNotificationsImpl *)impl getNotificationSettings:v17];
    }
  }
  else
  {
    NSLog(&cfstr_Wlknotificatio.isa);
  }
}

void __49__WLKNotificationCenter_post_title_body_options___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_Unusernotifica.isa, [v3 authorizationStatus]);
  uint64_t v4 = [v3 authorizationStatus];

  if (v4 == 2)
  {
    uint64_t v5 = a1[5];
    objc_super v6 = *(void **)(a1[4] + 8);
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    uint64_t v9 = a1[8];
    [v6 post:v5 title:v7 body:v8 options:v9];
  }
}

- (void)setBadgeString:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (![v7 length] || objc_msgSend(v7, "isEqualToString:", @" ")) {
    [(WLKNotificationsImpl *)self->_impl setBadgeString:v7 withCompletionHandler:v6];
  }
}

- (BOOL)isCategoryEnabledByUser:(int64_t)a3
{
  return [(WLKNotificationsImpl *)self->_impl isCategoryEnabledByUser:a3];
}

- (BOOL)isCategoryBadgeSettingEnabledByUser:(int64_t)a3
{
  return [(WLKNotificationsImpl *)self->_impl isCategoryBadgeSettingEnabledByUser:a3];
}

- (WLKNotificationCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WLKNotificationCenterDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_impl, 0);
}

@end