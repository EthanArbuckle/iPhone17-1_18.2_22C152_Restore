@interface WLKNotificationsImpl_iOS
+ (id)_JSONDictForResponse:(id)a3;
+ (unint64_t)_interruptionLevelForNumber:(id)a3;
- (BOOL)isCategoryBadgeSettingEnabledByUser:(int64_t)a3;
- (BOOL)isCategoryEnabledByUser:(int64_t)a3;
- (BOOL)topicsAreInitialized;
- (NSMutableSet)notificationTopics;
- (WLKNotificationCenterDelegate)delegate;
- (WLKNotificationsImpl_iOS)init;
- (id)_displayNameForSubsectionID:(id)a3;
- (id)_notificationCenter;
- (id)_topicIdentifierForCategory:(int64_t)a3;
- (unint64_t)_authOptions;
- (void)_accountChangedNotification:(id)a3;
- (void)_fetchTopics:(id)a3;
- (void)_initializeTopics;
- (void)_networkReachabilityDidChangeNotification:(id)a3;
- (void)_storeFrontChangedNotification:(id)a3;
- (void)dealloc;
- (void)getNotificationSettings:(id)a3;
- (void)post:(id)a3 title:(id)a4 body:(id)a5 options:(id)a6;
- (void)setBadgeNumber:(id)a3 withCompletionHandler:(id)a4;
- (void)setBadgeString:(id)a3 withCompletionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNotificationTopics:(id)a3;
- (void)setTopicsAreInitialized:(BOOL)a3;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
- (void)userNotificationCenter:(id)a3 didOpenApplicationForResponse:(id)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WLKNotificationsImpl_iOS

- (void)setBadgeNumber:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(WLKNotificationsImpl_iOS *)self _notificationCenter];
  uint64_t v8 = [v7 longValue];

  [v9 setBadgeCount:v8 withCompletionHandler:v6];
}

- (id)_displayNameForSubsectionID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"com.apple.tv.bulletins.explicit"])
  {
    char v4 = _os_feature_enabled_impl();
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
    id v6 = v5;
    if (v4) {
      id v7 = @"CONTINUE_WATCHING";
    }
    else {
      id v7 = @"SPORTS_IN_UP_NEXT";
    }
    goto LABEL_9;
  }
  if ([v3 isEqual:@"com.apple.tv.bulletins.implicit"])
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
    id v6 = v5;
    id v7 = @"FEATURED_SPORTS_AND_EVENTS";
LABEL_9:
    uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_1F13BCF18 table:@"WatchListKit"];

    goto LABEL_10;
  }
  if ([v3 isEqual:@"com.apple.tv.bulletins.marketing"])
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
    id v6 = v5;
    id v7 = @"MARKETING_PUSH_NOTIFICATIONS";
    goto LABEL_9;
  }
  uint64_t v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)_authOptions
{
  return 7;
}

- (NSMutableSet)notificationTopics
{
  return self->_notificationTopics;
}

- (void)setNotificationTopics:(id)a3
{
}

- (BOOL)topicsAreInitialized
{
  return self->_topicsAreInitialized;
}

- (WLKNotificationsImpl_iOS)init
{
  v6.receiver = self;
  v6.super_class = (Class)WLKNotificationsImpl_iOS;
  v2 = [(WLKNotificationsImpl_iOS *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    id v4 = [(WLKNotificationsImpl_iOS *)v2 _notificationCenter];
    [(WLKNotificationsImpl_iOS *)v3 setTopicsAreInitialized:0];
    [(WLKNotificationsImpl_iOS *)v3 _initializeTopics];
  }
  return v3;
}

- (void)setTopicsAreInitialized:(BOOL)a3
{
  self->_topicsAreInitialized = a3;
}

- (void)_initializeTopics
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__WLKNotificationsImpl_iOS__initializeTopics__block_invoke;
  v2[3] = &unk_1E620B9D8;
  v2[4] = self;
  [(WLKNotificationsImpl_iOS *)self _fetchTopics:v2];
}

- (void)_fetchTopics:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__7;
  v19[4] = __Block_byref_object_dispose__7;
  id v20 = 0;
  objc_initWeak(&location, self);
  id v7 = [(WLKNotificationsImpl_iOS *)self _notificationCenter];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__WLKNotificationsImpl_iOS__fetchTopics___block_invoke;
  v11[3] = &unk_1E620BA50;
  objc_copyWeak(&v17, &location);
  v15 = v21;
  v16 = v19;
  id v8 = v6;
  id v12 = v8;
  id v9 = v4;
  id v14 = v9;
  id v10 = v5;
  id v13 = v10;
  [v7 getNotificationSettingsForTopicsWithCompletionHandler:v11];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(v21, 8);
}

- (id)_notificationCenter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WLKNotificationsImpl_iOS__notificationCenter__block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  if (_notificationCenter_onceToken_0 != -1) {
    dispatch_once(&_notificationCenter_onceToken_0, block);
  }
  return (id)_notificationCenter__center_0;
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WLKNotificationsImpl_iOS;
  [(WLKNotificationsImpl_iOS *)&v4 dealloc];
}

- (void)post:(id)a3 title:(id)a4 body:(id)a5 options:(id)a6
{
  id v34 = a6;
  id v10 = (objc_class *)MEMORY[0x1E4F445B0];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  v15 = [v34 objectForKeyedSubscript:@"interruptionLevel"];
  if (v15) {
    uint64_t v16 = [(id)objc_opt_class() _interruptionLevelForNumber:v15];
  }
  else {
    uint64_t v16 = 1;
  }
  id v17 = [v34 objectForKeyedSubscript:@"sound"];
  if ([v17 isEqualToString:@"silent"])
  {
    v18 = 0;
  }
  else
  {
    v18 = [MEMORY[0x1E4F44640] defaultSound];
  }
  objc_msgSend(v14, "setInterruptionLevel:", v16, v13);
  [v14 setTitle:v12];

  [v14 setBody:v11];
  v19 = [v34 objectForKeyedSubscript:@"threadID"];
  [v14 setThreadIdentifier:v19];

  [v14 setSound:v18];
  id v20 = [v34 objectForKeyedSubscript:@"expirationDate"];
  [v14 setExpirationDate:v20];

  if (objc_msgSend(v34, "wlk_BOOLForKey:defaultValue:", @"isSession", 0)) {
    [v14 setCategoryIdentifier:@"SESSION"];
  }
  v21 = [v34 objectForKeyedSubscript:@"actionURL"];
  if (v21) {
    [v14 setDefaultActionURL:v21];
  }
  v22 = [v34 objectForKeyedSubscript:@"category"];
  uint64_t v23 = [v22 integerValue];

  v24 = [(WLKNotificationsImpl_iOS *)self _topicIdentifierForCategory:v23];
  if (v24)
  {
    v25 = [MEMORY[0x1E4F1CAD0] setWithObject:v24];
    [v14 setTopicIdentifiers:v25];
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v27 = [v34 objectForKeyedSubscript:@"actionMetrics"];

  if (v27)
  {
    v28 = [v34 objectForKeyedSubscript:@"actionMetrics"];
    [v26 setObject:v28 forKey:@"actionMetrics"];
  }
  v29 = [v34 objectForKeyedSubscript:@"bannerOnly"];

  if (v29)
  {
    v30 = [v34 objectForKeyedSubscript:@"bannerOnly"];
    [v26 setObject:v30 forKey:@"bannerOnly"];
  }
  [v14 setUserInfo:v26];
  v31 = [MEMORY[0x1E4F44628] requestWithIdentifier:v33 content:v14 trigger:0];

  v32 = [(WLKNotificationsImpl_iOS *)self _notificationCenter];
  [v32 addNotificationRequest:v31 withCompletionHandler:&__block_literal_global_40];
}

- (void)setBadgeString:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WLKNotificationsImpl_iOS *)self _notificationCenter];
  [v8 setBadgeString:v7 withCompletionHandler:v6];
}

- (BOOL)isCategoryEnabledByUser:(int64_t)a3
{
  v5 = [(WLKNotificationsImpl_iOS *)self _notificationCenter];
  id v6 = [v5 notificationSettingsForTopics];

  id v7 = [(WLKNotificationsImpl_iOS *)self _topicIdentifierForCategory:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  LOBYTE(v7) = [v8 authorizationStatus] == 2;
  return (char)v7;
}

- (BOOL)isCategoryBadgeSettingEnabledByUser:(int64_t)a3
{
  v5 = [(WLKNotificationsImpl_iOS *)self _notificationCenter];
  id v6 = [v5 notificationSettingsForTopics];

  id v7 = [(WLKNotificationsImpl_iOS *)self _topicIdentifierForCategory:a3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  LOBYTE(v7) = [v8 badgeSetting] == 2;
  return (char)v7;
}

- (void)getNotificationSettings:(id)a3
{
  id v4 = a3;
  v5 = [(WLKNotificationsImpl_iOS *)self _notificationCenter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WLKNotificationsImpl_iOS_getNotificationSettings___block_invoke;
  v7[3] = &unk_1E620B9B0;
  id v8 = v4;
  id v6 = v4;
  [v5 getNotificationSettingsWithCompletionHandler:v7];
}

- (id)_topicIdentifierForCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return off_1E620BA70[a3 - 1];
  }
}

+ (unint64_t)_interruptionLevelForNumber:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 intValue];
    if (v5 >= 4) {
      unint64_t v6 = 1;
    }
    else {
      unint64_t v6 = v5;
    }
  }
  else
  {
    unint64_t v6 = 1;
  }

  return v6;
}

- (void)_networkReachabilityDidChangeNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(WLKNotificationsImpl_iOS *)v5 topicsAreInitialized];
  objc_sync_exit(v5);

  if (!v6)
  {
    id v7 = +[WLKReachabilityMonitor sharedInstance];
    int v8 = [v7 isNetworkReachable];

    if (v8)
    {
      id v9 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - reachability changed, will refresh topics", v10, 2u);
      }

      [(WLKNotificationsImpl_iOS *)v5 _initializeTopics];
    }
  }
}

- (void)_accountChangedNotification:(id)a3
{
  id v4 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Account changed, will refresh topics", buf, 2u);
  }

  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WLKNotificationsImpl_iOS__accountChangedNotification___block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

- (void)_storeFrontChangedNotification:(id)a3
{
  id v4 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - Storefront changed, will refresh topics", buf, 2u);
  }

  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WLKNotificationsImpl_iOS__storeFrontChangedNotification___block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void (**)(id, uint64_t))a5;
  int v8 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - willPresentNotification. %@", (uint8_t *)&v14, 0xCu);
  }

  id v9 = [v6 request];
  id v10 = [v9 content];
  id v11 = [v10 userInfo];

  id v12 = [v11 objectForKey:@"bannerOnly"];
  LODWORD(v10) = [v12 BOOLValue];

  if (v10) {
    uint64_t v13 = 16;
  }
  else {
    uint64_t v13 = 27;
  }
  v7[2](v7, v13);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = (void (**)(void))a5;
  id v9 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v7;
    _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - didReceiveNotificationResponse. %@", buf, 0xCu);
  }

  if ([MEMORY[0x1E4F4DE98] shouldHandleNotificationResponse:v7])
  {
    id v10 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - didReceiveNotificationResponse will be handled by AMS", buf, 2u);
    }

    id v11 = (void *)MEMORY[0x1E4F4DE98];
    id v12 = objc_msgSend(MEMORY[0x1E4F4DBD8], "wlk_defaultBag");
    uint64_t v13 = [v11 handleNotificationResponse:v7 bag:v12];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __104__WLKNotificationsImpl_iOS_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
    v15[3] = &unk_1E620A368;
    uint64_t v16 = v8;
    [v13 addFinishBlock:v15];
  }
  else
  {
    uint64_t v13 = [(id)objc_opt_class() _JSONDictForResponse:v7];
    int v14 = [(WLKNotificationsImpl_iOS *)self delegate];
    [v14 handleAction:v13];

    v8[2](v8);
  }
}

- (void)userNotificationCenter:(id)a3 didOpenApplicationForResponse:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - didOpenApplicationForResponse. %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(id)objc_opt_class() _JSONDictForResponse:v5];
  int v8 = [(WLKNotificationsImpl_iOS *)self delegate];
  [v8 handleAction:v7];
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKNotificationsImpl - didChangeSettings. %@", (uint8_t *)&v11, 0xCu);
  }

  int v8 = (void *)MEMORY[0x1E4F4DE98];
  int v9 = objc_msgSend(MEMORY[0x1E4F4DBD8], "wlk_defaultBag");
  id v10 = (id)[v8 notificationCenter:v5 didChangeSettings:v6 bag:v9];
}

+ (id)_JSONDictForResponse:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [v3 actionIdentifier];
  if ([v5 isEqualToString:*MEMORY[0x1E4F446D0]])
  {
    id v6 = WLKNotificationsOnActionKeyReasonActivation;
  }
  else
  {
    if (![v5 isEqualToString:*MEMORY[0x1E4F446E0]]) {
      goto LABEL_6;
    }
    id v6 = WLKNotificationsOnActionKeyReasonDismissed;
  }
  [v4 setObject:*v6 forKey:@"reason"];
LABEL_6:
  id v7 = [v3 notification];
  int v8 = [v7 request];

  int v9 = [v8 content];
  id v10 = [v8 identifier];
  objc_msgSend(v4, "wlk_setObjectUnlessNil:forKey:", v10, @"identifier");

  int v11 = [v9 title];
  objc_msgSend(v4, "wlk_setObjectUnlessNil:forKey:", v11, @"title");

  id v12 = [v9 body];
  objc_msgSend(v4, "wlk_setObjectUnlessNil:forKey:", v12, @"body");

  uint64_t v13 = [v9 userInfo];
  int v14 = [v13 objectForKey:@"actionMetrics"];
  objc_msgSend(v4, "wlk_setObjectUnlessNil:forKey:", v14, @"actionMetrics");

  return v4;
}

- (WLKNotificationCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (WLKNotificationCenterDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationTopics, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end