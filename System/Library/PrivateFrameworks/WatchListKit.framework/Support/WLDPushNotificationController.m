@interface WLDPushNotificationController
- (AMSMetrics)metricsController;
- (BOOL)pushPaylod:(id)a3 shouldUpdateBadgeForBundleIdentifier:(id)a4 badgeIdentifier:(id)a5 enabled:(BOOL)a6;
- (WLDPushNotificationController)init;
- (id)_portNameForEnvironmentName:(id)a3;
- (void)_augmentCustomEventInfo:(id)a3;
- (void)_loadURLBagWithCompletionHandler:(id)a3;
- (void)_postNotificationToUser:(id)a3 title:(id)a4 body:(id)a5 options:(id)a6;
- (void)_postNotificationWithPayload:(id)a3;
- (void)_registerOpportunisticTopics;
- (void)_reportBulletinMetrics:(id)a3;
- (void)_reportMercuryMetrics:(id)a3;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)handleAction:(id)a3;
- (void)registerOpportunisticTopics;
@end

@implementation WLDPushNotificationController

- (WLDPushNotificationController)init
{
  v10.receiver = self;
  v10.super_class = (Class)WLDPushNotificationController;
  v2 = [(WLDPushNotificationController *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingOpportunisticTopics = v2->_pendingOpportunisticTopics;
    v2->_pendingOpportunisticTopics = v3;

    v5 = (WLKNotificationCenter *)objc_alloc_init((Class)WLKNotificationCenter);
    notifCenter = v2->_notifCenter;
    v2->_notifCenter = v5;

    [(WLKNotificationCenter *)v2->_notifCenter setDelegate:v2];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __37__WLDPushNotificationController_init__block_invoke;
    v8[3] = &unk_100045508;
    v9 = v2;
    [(WLDPushNotificationController *)v9 _loadURLBagWithCompletionHandler:v8];
  }
  return v2;
}

void __37__WLDPushNotificationController_init__block_invoke(uint64_t a1)
{
  v2 = WLDDispatchQueue();
  dispatch_assert_queue_V2(v2);

  v3 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    v46 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Push environment: %@", buf, 0xCu);
  }

  id v5 = objc_alloc((Class)APSConnection);
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[2];
  v8 = [v6 _portNameForEnvironmentName:v7];
  v9 = WLDDispatchQueue();
  id v10 = [v5 initWithEnvironmentName:v7 namedDelegatePort:v8 queue:v9];
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 8);
  *(void *)(v11 + 8) = v10;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
  v13 = [*(id *)(*(void *)(a1 + 32) + 8) publicToken];
  v14 = [v13 base64EncodedStringWithOptions:0];

  if ([v14 length])
  {
    v15 = +[WLKSettingsStore sharedSettings];
    [v15 setPushToken:v14];
  }
  v16 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = +[ACAccountStore ams_sharedAccountStore];
    v18 = objc_msgSend(v17, "ams_activeiTunesAccount");
    v19 = objc_msgSend(v18, "ams_DSID");
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138412802;
    v46 = v14;
    __int16 v47 = 2112;
    v48 = v19;
    __int16 v49 = 2112;
    uint64_t v50 = v20;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Push token: %@, DSID: %@, connection: %@", buf, 0x20u);
  }
  v44[0] = @"com.apple.watchList";
  v44[1] = @"com.apple.tv.favoriteTeams";
  v21 = +[NSArray arrayWithObjects:v44 count:2];
  [*(id *)(*(void *)(a1 + 32) + 8) _setEnabledTopics:v21];
  if ([*(id *)(*(void *)(a1 + 32) + 32) count]) {
    [*(id *)(a1 + 32) _registerOpportunisticTopics];
  }
  id v22 = objc_alloc((Class)AMSMetrics);
  v23 = WLKTVAppBundleID();
  v24 = +[AMSBag wlk_defaultBag];
  id v25 = [v22 initWithContainerID:v23 bag:v24];
  uint64_t v26 = *(void *)(a1 + 32);
  v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;

  id v28 = [objc_alloc((Class)AMSPushConfiguration) initWithEnabledActionTypes:0];
  [v28 setUserNotificationExtensionId:@"com.apple.tv-default"];
  id v29 = objc_alloc((Class)AMSPushHandler);
  v30 = +[AMSBag wlk_defaultBag];
  id v31 = [v29 initWithConfiguration:v28 bag:v30];
  uint64_t v32 = *(void *)(a1 + 32);
  v33 = *(void **)(v32 + 64);
  *(void *)(v32 + 64) = v31;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDelegate:");
  v34 = objc_alloc_init(WLDMercuryPushHandler);
  uint64_t v35 = *(void *)(a1 + 32);
  v36 = *(void **)(v35 + 72);
  *(void *)(v35 + 72) = v34;

  v37 = objc_alloc_init(WLDUTSPushHandler);
  uint64_t v38 = *(void *)(a1 + 32);
  v39 = *(void **)(v38 + 56);
  *(void *)(v38 + 56) = v37;

  [*(id *)(*(void *)(a1 + 32) + 56) setMetricsController:*(void *)(*(void *)(a1 + 32) + 40)];
  v40 = objc_alloc_init(WLDSportsLiveActivityPushHandler);
  uint64_t v41 = *(void *)(a1 + 32);
  v42 = *(void **)(v41 + 80);
  *(void *)(v41 + 80) = v40;

  v43 = +[WLKBadgingUtilities sharedUtilities];
  [v43 migrateToNewBadgingSystemIfNeeded];
}

- (void)dealloc
{
  [(APSConnection *)self->_connection setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WLDPushNotificationController;
  [(WLDPushNotificationController *)&v3 dealloc];
}

- (void)registerOpportunisticTopics
{
  objc_super v3 = WLDDispatchQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__WLDPushNotificationController_registerOpportunisticTopics__block_invoke;
  block[3] = &unk_100045508;
  block[4] = self;
  dispatch_async(v3, block);
}

id __60__WLDPushNotificationController_registerOpportunisticTopics__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v3 = WLKPushNotificationsLogObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Handling request to register opportunistic topics", buf, 2u);
    }

    return [*(id *)(a1 + 32) _registerOpportunisticTopics];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Deferring request to register opportunistic topics", v6, 2u);
    }

    return [*(id *)(*(void *)(a1 + 32) + 32) addObject:@"com.apple.tv.upnext"];
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  v6 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - didReceivePublicToken: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v7 = [(APSConnection *)self->_connection publicToken];
  v8 = [v7 base64EncodedStringWithOptions:0];

  if ([v8 length])
  {
    v9 = +[WLKSettingsStore sharedSettings];
    [v9 setPushToken:v8];
  }
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__2;
  v53 = __Block_byref_object_dispose__2;
  id v54 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDPushNotificationController.didReceiveMessageForTopic"];
  id v11 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Received push notification: %@", buf, 0xCu);
  }

  if (![v9 isEqualToString:@"com.apple.watchList"])
  {
    if ([v9 isEqualToString:@"com.apple.tv.upnext"])
    {
      if (![(WLDUTSPushHandler *)self->_utsPushHandler shouldHandleNotification:v10])
      {
        id v28 = WLKPushNotificationsLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v9;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Notification is unhandled: %@", buf, 0xCu);
        }
        goto LABEL_54;
      }
    }
    else
    {
      if (![v9 isEqualToString:@"com.apple.tv.favoriteTeams"])
      {
        id v29 = WLKPushNotificationsLogObject();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v9;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Ignoring unknown topic: %@", buf, 0xCu);
        }

        v30 = (void *)v50[5];
        v50[5] = 0;

        goto LABEL_61;
      }
      if (![(WLDUTSPushHandler *)self->_utsPushHandler shouldHandleNotification:v10])
      {
        id v28 = WLKPushNotificationsLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v9;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Notification is unhandled: %@", buf, 0xCu);
        }
        goto LABEL_54;
      }
    }
    [(WLDUTSPushHandler *)self->_utsPushHandler handleNotification:v10];
LABEL_55:
    uint64_t v38 = (void *)v50[5];
    v50[5] = 0;

    goto LABEL_61;
  }
  int64_t v12 = +[WLDPushParsing actionTypeForNotification:v10];
  int64_t v13 = v12;
  if (v12 == 31 || v12 == 21)
  {
    v14 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = +[NSNumber numberWithInteger:v13];
      *(_DWORD *)buf = 138412290;
      id v56 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Received sync request of type: %@", buf, 0xCu);
    }
    v16 = +[WLDPushParsing accountIdentifierForNotification:v10];
    v17 = +[ACAccountStore ams_sharedAccountStore];
    v18 = objc_msgSend(v17, "ams_activeiTunesAccount");
    v19 = objc_msgSend(v18, "ams_DSID");
    unsigned int v20 = [v16 isEqual:v19];

    if (v20)
    {
      if (v13 == 31)
      {
        v36 = WLKPushNotificationsLogObject();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Processing subscriptions sync request", buf, 2u);
        }

        id v22 = +[WLDSubscriptionStore sharedInstance];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = __79__WLDPushNotificationController_connection_didReceiveMessageForTopic_userInfo___block_invoke_43;
        v47[3] = &unk_100044D40;
        v47[4] = &v49;
        [v22 fetchSubscriptionData:1 callerProcessID:getpid() completion:v47];
      }
      else
      {
        if (v13 != 21)
        {
LABEL_49:

          goto LABEL_61;
        }
        v21 = WLKPushNotificationsLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Processing settings sync request", buf, 2u);
        }

        id v22 = +[WLKSettingsStore sharedSettings];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = __79__WLDPushNotificationController_connection_didReceiveMessageForTopic_userInfo___block_invoke;
        v48[3] = &unk_100044B08;
        v48[4] = &v49;
        [v22 synchronize:1 completion:v48];
      }
    }
    else
    {
      v27 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - accountIdentifer missing or mismatched", buf, 2u);
      }

      id v22 = (void *)v50[5];
      v50[5] = 0;
    }

    goto LABEL_49;
  }
  if ([(AMSPushHandler *)self->_amsPushHandler shouldHandleNotification:v10])
  {
    v23 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v9;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - AMS wants to handle notification: %@", buf, 0xCu);
    }

    v24 = [v10 objectForKeyedSubscript:@"aps"];
    id v25 = [v24 objectForKeyedSubscript:@"_ss"];
    BOOL v26 = v25 == 0;

    if (!v26)
    {
      [(AMSPushHandler *)self->_amsPushHandler handleNotification:v10];
      goto LABEL_55;
    }
    id v28 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[WLDPushNotificationController connection:didReceiveMessageForTopic:userInfo:](v28);
    }
LABEL_54:

    goto LABEL_55;
  }
  if ([(WLDMercuryPushHandler *)self->_mercuryPushHandler shouldHandleNotification:v10])
  {
    id v31 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v9;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Handling mercury notification: %@", buf, 0xCu);
    }

    uint64_t v32 = objc_msgSend(v10, "wlk_dictionaryForKey:", @"aps");
    v33 = objc_msgSend(v32, "wlk_dictionaryForKey:", @"payload");
    v34 = [v33 objectForKey:@"metrics"];
    if (v34) {
      [(WLDPushNotificationController *)self _reportMercuryMetrics:v34];
    }
    if [(WLKNotificationCenter *)self->_notifCenter isCategoryEnabledByUser:4]&& ([(WLKNotificationCenter *)self->_notifCenter isCategoryBadgeSettingEnabledByUser:4])
    {
      uint64_t v35 = 1;
    }
    else
    {
      v39 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - User has disabled Marketing notifs. Skip badging.", buf, 2u);
      }

      uint64_t v35 = 0;
    }
    [(WLDMercuryPushHandler *)self->_mercuryPushHandler handleNotification:v10 shouldBadge:v35];
    v40 = (void *)v50[5];
    v50[5] = 0;
  }
  else if ([(WLDSportsLiveActivityPushHandler *)self->_sportsLiveActivityPushHandler shouldHandleNotification:v10])
  {
    objc_initWeak((id *)buf, self);
    sportsLiveActivityPushHandler = self->_sportsLiveActivityPushHandler;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = __79__WLDPushNotificationController_connection_didReceiveMessageForTopic_userInfo___block_invoke_48;
    v43[3] = &unk_100045860;
    objc_copyWeak(&v46, (id *)buf);
    id v44 = v10;
    v45 = &v49;
    [(WLDSportsLiveActivityPushHandler *)sportsLiveActivityPushHandler handleNotification:v44 completion:v43];

    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v41 = objc_msgSend(v10, "wlk_dictionaryForKey:", @"payload");
    [(WLDPushNotificationController *)self _postNotificationWithPayload:v41];
    v42 = (void *)v50[5];
    v50[5] = 0;
  }
LABEL_61:
  _Block_object_dispose(&v49, 8);
}

void __79__WLDPushNotificationController_connection_didReceiveMessageForTopic_userInfo___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 description];
  }
  else
  {
    uint64_t v7 = &stru_100047980;
  }
  id v8 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if (a2) {
      CFStringRef v9 = @"YES";
    }
    int v12 = 138412546;
    CFStringRef v13 = v9;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Completed WLK settings sync with success:%@ %@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void __79__WLDPushNotificationController_connection_didReceiveMessageForTopic_userInfo___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 description];
  }
  else
  {
    id v8 = &stru_100047980;
  }
  CFStringRef v9 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"YES";
    if (!v5) {
      CFStringRef v10 = @"NO";
    }
    int v13 = 138412546;
    CFStringRef v14 = v10;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Completed WLK subscription sync with success:%@ %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

void __79__WLDPushNotificationController_connection_didReceiveMessageForTopic_userInfo___block_invoke_48(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2)
  {
    BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "wlk_dictionaryForKey:", @"payload");
    [WeakRetained _postNotificationWithPayload:v4];
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

- (void)handleAction:(id)a3
{
  id v8 = a3;
  id v4 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDPushNotificationController.handleAction"];
  uint64_t v5 = [v8 objectForKey:WLKNotificationsOnActionKeyReason];
  id v6 = [v8 objectForKey:WLKNotificationsKeyActionMetrics];
  if (v6 && [v5 isEqual:WLKNotificationsOnActionKeyReasonActivation]) {
    [(WLDPushNotificationController *)self _reportBulletinMetrics:v6];
  }
  uint64_t v7 = objc_msgSend(v8, "wlk_stringForKey:", @"identifier");
  if ([v5 isEqual:WLKNotificationsOnActionKeyReasonSession]) {
    [(WLDSportsLiveActivityPushHandler *)self->_sportsLiveActivityPushHandler createLiveActivityForCanonicalId:v7 supplementaryData:0 completion:&__block_literal_global_10];
  }
}

- (BOOL)pushPaylod:(id)a3 shouldUpdateBadgeForBundleIdentifier:(id)a4 badgeIdentifier:(id)a5 enabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = a5;
  if (([(WLKNotificationCenter *)self->_notifCenter isCategoryEnabledByUser:4] & 1) == 0)
  {
    CFStringRef v9 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - AMSPushHandler -- badging is disabled in settings", (uint8_t *)&v14, 2u);
    }
    goto LABEL_13;
  }
  if (v6)
  {
    if (+[WLKBadgingUtilities addBadgeIdentifier:v8])
    {
      CFStringRef v9 = +[WLKBadgingUtilities currentBadgeNumber];
      CFStringRef v10 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        __int16 v15 = v9;
        uint64_t v11 = "WLDPushNotificationController - AMSPushHandler badge -- new badging number:%@";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else if (+[WLKBadgingUtilities removeBadgeIdentifier:v8])
  {
    CFStringRef v9 = +[WLKBadgingUtilities currentBadgeNumber];
    CFStringRef v10 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      __int16 v15 = v9;
      uint64_t v11 = "WLDPushNotificationController - AMSPushHandler unbadge -- new badging number:%@";
      goto LABEL_11;
    }
LABEL_12:

    int v12 = +[WLKNotificationCenter defaultCenter];
    [v12 setBadgeNumber:v9 withCompletionHandler:0];

LABEL_13:
  }

  return 0;
}

- (void)_registerOpportunisticTopics
{
  objc_super v3 = WLDDispatchQueue();
  dispatch_assert_queue_V2(v3);

  id v4 = [(APSConnection *)self->_connection opportunisticTopics];
  if (([v4 containsObject:@"com.apple.tv.upnext"] & 1) == 0)
  {
    uint64_t v5 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      CFStringRef v9 = @"com.apple.tv.upnext";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Registering opportunistic topic: %@", (uint8_t *)&v8, 0xCu);
    }

    connection = self->_connection;
    uint64_t v7 = +[NSArray arrayWithObject:@"com.apple.tv.upnext"];
    [(APSConnection *)connection _setOpportunisticTopics:v7];

    [(NSMutableArray *)self->_pendingOpportunisticTopics removeObject:@"com.apple.tv.upnext"];
  }
}

- (void)_augmentCustomEventInfo:(id)a3
{
  id v21 = a3;
  objc_super v3 = +[WLKSettingsStore sharedSettings];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 optedIn]);
  [v21 setObject:v4 forKey:@"gac"];

  uint64_t v5 = [v3 consentedBrands];
  BOOL v6 = [v5 componentsJoinedByString:@","];
  [v21 setObject:v6 forKey:@"cbids"];

  uint64_t v7 = [v3 deniedBrands];
  int v8 = [v7 componentsJoinedByString:@","];
  [v21 setObject:v8 forKey:@"dbids"];

  CFStringRef v9 = +[WLKAppLibrary defaultAppLibrary];
  CFStringRef v10 = [v9 installedAppBundleIdentifiers];
  uint64_t v11 = [v10 componentsJoinedByString:@","];
  [v21 setObject:v11 forKey:@"ibids"];

  int v12 = [v9 subscribedAppBundleIdentifiers];
  int v13 = [v12 componentsJoinedByString:@","];
  [v21 setObject:v13 forKey:@"sbids"];

  int v14 = +[WLKStoredConfigurationManager sharedInstance];
  __int16 v15 = [v14 storedConfiguration];

  v16 = [v15 vppaState];
  if (v16) {
    [v21 setObject:v16 forKey:@"vppaState"];
  }
  v17 = WLKTVAppBundleID();
  [v21 setObject:v17 forKey:@"app"];

  v18 = +[TVAppBag app];
  v19 = [v18 dictionaryForKey:kBagKeyMetrics];

  if (v19)
  {
    unsigned int v20 = [v19 valueForKey:@"metricsBase"];
    if (v20) {
      [v21 addEntriesFromDictionary:v20];
    }
  }
}

- (void)_reportBulletinMetrics:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v4 count])
    {
      BOOL v6 = 0;
      goto LABEL_8;
    }
    id v16 = v4;
    id v5 = +[NSArray arrayWithObjects:&v16 count:1];
  }
  BOOL v6 = v5;
LABEL_8:
  id v7 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  int v8 = dispatch_get_global_queue(0, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __56__WLDPushNotificationController__reportBulletinMetrics___block_invoke;
  v11[3] = &unk_100045348;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __56__WLDPushNotificationController__reportBulletinMetrics___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v16 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDPushNotificationController._reportBulletinMetrics"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v19 = a1;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v18 = *(void *)v22;
    do
    {
      id v4 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v4);
        id v6 = [objc_alloc((Class)AMSMetricsEvent) initWithTopic:@"xp_amp_notifications"];
        id v7 = objc_alloc((Class)UNUserNotificationCenter);
        int v8 = WLKTVAppBundleID();
        id v9 = [v7 initWithBundleIdentifier:v8];

        id v10 = [v9 notificationSettingsForTopics];
        uint64_t v11 = [v9 notificationSettings];
        id v12 = [objc_alloc((Class)WLKPushNotificationMetricsManager) initWithNotificationSettings:v11 notificationSettingsForTopic:v10];
        id v13 = [v12 displayCriteria];
        [WeakRetained _augmentCustomEventInfo:v13];
        [v13 addEntriesFromDictionary:v5];
        [v6 addPropertiesWithDictionary:v13];
        [*(id *)(v19 + 40) addObject:v6];

        id v4 = (char *)v4 + 1;
      }
      while (v3 != v4);
      id v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v3);
  }

  uint64_t v14 = *(void *)(v19 + 40);
  __int16 v15 = [WeakRetained metricsController];
  +[WLDMetricsUtilities sendMetricsEvents:v14 metricsController:v15];
}

- (void)_reportMercuryMetrics:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v4 count])
    {
      id v6 = 0;
      goto LABEL_8;
    }
    id v15 = v4;
    id v5 = +[NSArray arrayWithObjects:&v15 count:1];
  }
  id v6 = v5;
LABEL_8:
  id v7 = objc_alloc_init((Class)NSMutableArray);
  int v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __55__WLDPushNotificationController__reportMercuryMetrics___block_invoke;
  block[3] = &unk_1000458A8;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __55__WLDPushNotificationController__reportMercuryMetrics___block_invoke(uint64_t a1)
{
  id v13 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDPushNotificationController._reportMercuryMetrics"];
  uint64_t v14 = a1;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v6);
        id v8 = objc_msgSend(objc_alloc((Class)AMSMetricsEvent), "initWithTopic:", @"xp_amp_notifications", v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [v7 objectForKey:@"eventVersion"];
          if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            id v10 = WLKPushNotificationsLogObject();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - eventVersion: value is invalid.", buf, 2u);
            }
          }
          else
          {
            [v8 addPropertiesWithDictionary:v7];
            [*(id *)(v14 + 40) addObject:v8];
          }
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  uint64_t v11 = *(void *)(v14 + 40);
  id v12 = [*(id *)(v14 + 48) metricsController];
  +[WLDMetricsUtilities sendMetricsEvents:v11 metricsController:v12];
}

- (void)_postNotificationWithPayload:(id)a3
{
  id v87 = a3;
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__2;
  v116 = __Block_byref_object_dispose__2;
  id v117 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDPushNotificationController._postNotificationWithPayload"];
  v80 = objc_msgSend(v87, "wlk_numberForKey:", @"interruptionLevel");
  v78 = objc_msgSend(v87, "wlk_stringForKey:", @"entityId");
  v85 = objc_msgSend(v87, "wlk_stringForKey:", @"coalescingId");
  v81 = objc_msgSend(v87, "wlk_stringForKey:", WLKNotificationsKeyType);
  v77 = (void *)MGCopyAnswer();
  v79 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v81 isEqualToString:@"gameStartWithFollow"] & (objc_msgSend(v77, "isEqualToString:", @"iPad") ^ 1));
  id v3 = objc_msgSend(v87, "wlk_dictionaryForKey:", @"localizedTitle");
  v83 = WLKPlatformStringFromDictionary(v3);

  int has_internal_content = os_variant_has_internal_content();
  uint64_t v5 = v87;
  if (has_internal_content)
  {
    id v6 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v78;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v85;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Canonical ID: %@ Coalescing ID: %@", buf, 0x16u);
    }

    uint64_t v5 = v87;
  }
  id v7 = objc_msgSend(v5, "wlk_dictionaryForKey:", @"localizedText");
  v82 = WLKPlatformStringFromDictionary(v7);

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v8 setObject:&off_100049BF0 forKey:WLKNotificationsKeySource];
  objc_msgSend(v8, "wlk_setObjectUnlessNil:forKey:", v80, WLKNotificationsKeyInterruptionLevel);
  v86 = v8;
  uint64_t v9 = objc_msgSend(v87, "wlk_stringForKey:", @"threadId");
  objc_msgSend(v8, "wlk_setObjectUnlessNil:forKey:", v9, WLKNotificationsKeyThreadID);
  v76 = (void *)v9;
  uint64_t v10 = objc_msgSend(v87, "wlk_dateFromMillisecondsSince1970ForKey:", @"displayEndTime");
  objc_msgSend(v8, "wlk_setObjectUnlessNil:forKey:", v10, WLKNotificationsKeyExpirationDate);
  v75 = (void *)v10;
  v84 = [v87 objectForKey:@"metrics"];
  objc_msgSend(v8, "wlk_setObjectUnlessNil:forKey:", v84, WLKNotificationsKeyMetrics);
  objc_msgSend(v8, "wlk_setObjectUnlessNil:forKey:", v79, WLKNotificationsKeyIsSession);
  uint64_t v11 = +[WLKAppLibrary defaultAppLibrary];
  v93 = [v11 allAppBundleIdentifiers];

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v12 = objc_msgSend(v87, "wlk_arrayForKey:", @"actions");
  id v13 = [v12 countByEnumeratingWithState:&v108 objects:v123 count:16];
  id obj = v12;
  if (v13)
  {
    id v88 = 0;
    id v89 = 0;
    v90 = 0;
    v91 = 0;
    uint64_t v14 = *(void *)v109;
    while (1)
    {
      id v15 = 0;
      do
      {
        if (*(void *)v109 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v108 + 1) + 8 * (void)v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v17 = objc_msgSend(v16, "wlk_numberForKey:", @"isTvAppAction");
          unsigned int v18 = [v17 BOOLValue];

          long long v19 = objc_msgSend(v16, "wlk_stringForKey:", @"type");
          if (([v19 isEqualToString:@"LiveActivityAutostart"] & 1) == 0)
          {
            if (v91) {
              unsigned int v20 = 0;
            }
            else {
              unsigned int v20 = v18;
            }
            if (v20)
            {
LABEL_16:
              long long v21 = objc_msgSend(v16, "wlk_dictionaryForKey:", @"clientActionDeepLinks");
              long long v22 = WLKPlatformStringFromDictionary(v21);
              uint64_t v23 = objc_msgSend(v21, "wlk_stringForKey:", @"Universal");
              long long v24 = (void *)v23;
              if (v20)
              {
                id v25 = (void *)v23;
                if (v23 || (id v25 = v22) != 0)
                {
                  v91 = +[NSURL URLWithString:v25];
                }
                else
                {
                  v91 = 0;
                }
                uint64_t v26 = objc_msgSend(v16, "wlk_dictionaryForKey:", @"metrics");
                v27 = v89;
                id v89 = (id)v26;
LABEL_42:
              }
              else if (!v90 && v22)
              {
                v90 = +[NSURL URLWithString:v22];
                uint64_t v41 = objc_msgSend(v16, "wlk_dictionaryForKey:", @"metrics");
                v27 = v88;
                id v88 = (id)v41;
                goto LABEL_42;
              }
              if (v90) {
                BOOL v42 = v91 == 0;
              }
              else {
                BOOL v42 = 1;
              }
              int v43 = v42;

              if (!v43)
              {

                v45 = obj;
                goto LABEL_61;
              }
            }
            else if (!v90)
            {
              id v28 = objc_msgSend(v16, "wlk_arrayForKey:", @"bundleIds");
              if (![v28 count])
              {
                id v29 = objc_msgSend(v16, "wlk_stringForKey:", @"brandId");
                v30 = +[WLKChannelUtilities sharedInstance];
                id v31 = [v30 channelForID:v29];

                uint64_t v32 = [v31 appBundleIDs];

                id v28 = (void *)v32;
              }
              long long v106 = 0u;
              long long v107 = 0u;
              long long v104 = 0u;
              long long v105 = 0u;
              id v33 = v28;
              id v34 = [v33 countByEnumeratingWithState:&v104 objects:v122 count:16];
              if (v34)
              {
                uint64_t v35 = *(void *)v105;
                while (2)
                {
                  for (i = 0; i != v34; i = (char *)i + 1)
                  {
                    if (*(void *)v105 != v35) {
                      objc_enumerationMutation(v33);
                    }
                    if ([v93 containsObject:*(void *)(*((void *)&v104 + 1) + 8 * i)])
                    {

                      goto LABEL_16;
                    }
                  }
                  id v34 = [v33 countByEnumeratingWithState:&v104 objects:v122 count:16];
                  if (v34) {
                    continue;
                  }
                  break;
                }
              }

              v37 = WLKPushNotificationsLogObject();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v33;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Not inspecting action for bundleIDs: %@ because none are installed.", buf, 0xCu);
              }

              if (os_variant_has_internal_content())
              {
                uint64_t v38 = WLKPushNotificationsLogObject();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  v39 = +[WLKAppLibrary defaultAppLibrary];
                  v40 = [v39 dictionaryRepresentation];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v40;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - App library: %@", buf, 0xCu);
                }
              }

              v90 = 0;
            }
          }
        }
        id v15 = (char *)v15 + 1;
      }
      while (v15 != v13);
      id v44 = [obj countByEnumeratingWithState:&v108 objects:v123 count:16];
      id v13 = v44;
      if (!v44)
      {

        if (v90) {
          goto LABEL_62;
        }
        goto LABEL_60;
      }
    }
  }

  id v88 = 0;
  id v89 = 0;
  v91 = 0;
LABEL_60:
  id v46 = v91;
  id v47 = v89;
  v45 = v88;
  id v88 = v47;
  id v89 = v47;
  v90 = v46;
  v91 = v46;
LABEL_61:

LABEL_62:
  objc_msgSend(v86, "wlk_setObjectUnlessNil:forKey:", v90, WLKNotificationsKeyActionURL);
  objc_msgSend(v86, "wlk_setObjectUnlessNil:forKey:", v88, WLKNotificationsKeyActionMetrics);
  v48 = objc_msgSend(v87, "wlk_stringForKey:", @"settingType");
  if ([v48 isEqual:@"Explicit"])
  {
    int v49 = 0;
    uint64_t v50 = 1;
  }
  else if ([v48 isEqual:@"Implicit"])
  {
    int v49 = 0;
    uint64_t v50 = 2;
  }
  else
  {
    unsigned int v51 = [v48 isEqual:@"Marketing"];
    int v49 = v51 ^ 1;
    if (v51) {
      uint64_t v50 = 4;
    }
    else {
      uint64_t v50 = 0;
    }
  }
  v52 = +[NSNumber numberWithInteger:v50];
  [v86 setObject:v52 forKey:WLKNotificationsKeyCategory];

  v53 = objc_msgSend(v87, "wlk_numberForKey:", @"hasScore");
  unsigned int v54 = [v53 BOOLValue];

  id v55 = [v85 length];
  BOOL v56 = v55 != 0;
  if (!v55)
  {
    v57 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Payload lacks an identifier.", buf, 2u);
    }
  }
  if (![v83 length])
  {
    v58 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Payload lacks a title.", buf, 2u);
    }

    BOOL v56 = 0;
  }
  if (![v82 length])
  {
    v59 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Payload lacks a message.", buf, 2u);
    }

    BOOL v56 = 0;
  }
  if (v90)
  {
    if (!v54) {
      goto LABEL_93;
    }
    goto LABEL_87;
  }
  v60 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Payload lacks an action.", buf, 2u);
  }

  BOOL v56 = 0;
  if (v54)
  {
LABEL_87:
    v61 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Payload has a score.", buf, 2u);
    }

    v62 = +[WLKSystemPreferencesStore sharedPreferences];
    unsigned __int8 v63 = [v62 sportsScoreSpoilersAllowed];

    if ((v63 & 1) == 0)
    {
      v64 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - User has sports scores disabled", buf, 2u);
      }

      BOOL v56 = 0;
    }
  }
LABEL_93:
  if (+[WLDSportsLiveActivityPushHandler shouldSuppressNotification:v87])
  {
    v65 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Sports notification suppression is currently active for the event", buf, 2u);
    }

    BOOL v56 = 0;
  }
  if (_os_feature_enabled_impl()
    && (objc_msgSend(v87, "wlk_BOOLForKey:defaultValue:", @"isOnTv", 1) & 1) == 0)
  {
    v66 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Sports notification suppresed - Not available on TV", buf, 2u);
    }

    BOOL v56 = 0;
  }
  if ((v49 & (os_variant_has_internal_content() ^ 1)) == 1)
  {
    v67 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Payload lacks a known category type.", buf, 2u);
    }

    BOOL v56 = 0;
  }
  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x2020000000;
  v68 = (unsigned int (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  v121 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke;
    v125 = &unk_100045970;
    v126 = &v118;
    __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke((uint64_t)buf);
    v68 = (unsigned int (*)(void))v119[3];
  }
  _Block_object_dispose(&v118, 8);
  if (!v68)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  if (v68())
  {
    v69 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Buddy/OOB has not completed. Will drop notification", buf, 2u);
    }

    goto LABEL_116;
  }
  if (!v56)
  {
LABEL_116:
    v72 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Discarding notification with inappropriate payload.", buf, 2u);
    }

    v71 = (void *)v113[5];
    v113[5] = 0;
    goto LABEL_119;
  }
  if (objc_msgSend(v87, "wlk_BOOLForKey:defaultValue:", @"suppressIfTunedIn", 0))
  {
    v70 = +[WLDPlaybackManager sharedManager];
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = __62__WLDPushNotificationController__postNotificationWithPayload___block_invoke;
    v94[3] = &unk_1000458F8;
    id v95 = v78;
    id v96 = v84;
    v97 = self;
    id v98 = v90;
    id v99 = v85;
    id v100 = v83;
    id v101 = v82;
    id v102 = v86;
    v103 = &v112;
    [v70 fetchDecoratedNowPlayingSummaries:v94];

    v71 = v95;
LABEL_119:

    goto LABEL_120;
  }
  v73 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v90;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Will enqueue notification with action URL: %@", buf, 0xCu);
  }

  if (v84) {
    [(WLDPushNotificationController *)self _reportBulletinMetrics:v84];
  }
  [(WLDPushNotificationController *)self _postNotificationToUser:v85 title:v83 body:v82 options:v86];
LABEL_120:

  _Block_object_dispose(&v112, 8);
}

void __62__WLDPushNotificationController__postNotificationWithPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[NSMutableArray array];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __62__WLDPushNotificationController__postNotificationWithPayload___block_invoke_2;
  v12[3] = &unk_1000458D0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v5 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Now Playing Canonicals: %@", buf, 0xCu);
  }

  if ([v4 containsObject:*(void *)(a1 + 32)])
  {
    id v6 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Discarding notification for current game %@", buf, 0xCu);
    }
  }
  else
  {
    if (*(void *)(a1 + 40)) {
      objc_msgSend(*(id *)(a1 + 48), "_reportBulletinMetrics:");
    }
    id v8 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Will enqueue notification with action URL: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 48) _postNotificationToUser:*(void *)(a1 + 64) title:*(void *)(a1 + 72) body:*(void *)(a1 + 80) options:*(void *)(a1 + 88)];
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void __62__WLDPushNotificationController__postNotificationWithPayload___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 canonicalID];
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)_postNotificationToUser:(id)a3 title:(id)a4 body:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc((Class)UNUserNotificationCenter);
  id v15 = WLKTVAppBundleID();
  id v16 = [v14 initWithBundleIdentifier:v15];

  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __76__WLDPushNotificationController__postNotificationToUser_title_body_options___block_invoke;
  v21[3] = &unk_100045920;
  objc_copyWeak(&v26, &location);
  id v17 = v10;
  id v22 = v17;
  id v18 = v11;
  id v23 = v18;
  id v19 = v12;
  id v24 = v19;
  id v20 = v13;
  id v25 = v20;
  [v16 getNotificationSettingsWithCompletionHandler:v21];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __76__WLDPushNotificationController__postNotificationToUser_title_body_options___block_invoke(void *a1, void *a2)
{
  id v3 = (id *)(a1 + 8);
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  NSLog(@"notification authorization status:%ld.", [v4 authorizationStatus]);
  id v6 = [v4 authorizationStatus];

  if (v6 == (id)2)
  {
    if (WeakRetained)
    {
      [WeakRetained[6] post:a1[4] title:a1[5] body:a1[6] options:a1[7]];
    }
    else
    {
      id v7 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Push notification controller is nil. Notification not posted.", buf, 2u);
      }
    }
  }
}

- (void)_loadURLBagWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__2;
  v16[4] = __Block_byref_object_dispose__2;
  id v17 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDPushNotificationController._loadURLBagWithCompletionHandler"];
  uint64_t v5 = +[TVAppBag app];
  id v6 = [v5 stringForKey:kBagKeyPushNotificationsEnvironment];

  id v7 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WLDPushNotificationController - Configuration: %@", buf, 0xCu);
  }

  id v8 = WLDDispatchQueue();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __66__WLDPushNotificationController__loadURLBagWithCompletionHandler___block_invoke;
  v11[3] = &unk_100045948;
  id v12 = v6;
  id v13 = self;
  id v14 = v4;
  id v15 = v16;
  id v9 = v4;
  id v10 = v6;
  dispatch_async(v8, v11);

  _Block_object_dispose(v16, 8);
}

void __66__WLDPushNotificationController__loadURLBagWithCompletionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2)
  {
    id v3 = [v2 copy];
    uint64_t v4 = a1[5];
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;
  }
  else
  {
    uint64_t v6 = a1[5];
    id v7 = APSEnvironmentProduction;
    uint64_t v5 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v7;
  }

  id obj = (id)CFPreferencesCopyAppValue(@"APSEnvironment", @"com.apple.WatchListKit");
  if ([obj length]) {
    objc_storeStrong((id *)(a1[5] + 16), obj);
  }
  uint64_t v8 = a1[6];
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

- (id)_portNameForEnvironmentName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:APSEnvironmentProduction])
  {
    CFStringRef v4 = @"com.apple.aps.watchlistd";
  }
  else if ([v3 isEqualToString:APSEnvironmentDevelopment])
  {
    CFStringRef v4 = @"com.apple.aps.watchlistd.dev";
  }
  else if ([v3 isEqualToString:APSEnvironmentDemo])
  {
    CFStringRef v4 = @"com.apple.aps.watchlistd.demo";
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return (id)v4;
}

- (AMSMetrics)metricsController
{
  return self->_metricsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsLiveActivityPushHandler, 0);
  objc_storeStrong((id *)&self->_mercuryPushHandler, 0);
  objc_storeStrong((id *)&self->_amsPushHandler, 0);
  objc_storeStrong((id *)&self->_utsPushHandler, 0);
  objc_storeStrong((id *)&self->_notifCenter, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_pendingOpportunisticTopics, 0);
  objc_storeStrong((id *)&self->_validTopics, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)connection:(os_log_t)log didReceiveMessageForTopic:userInfo:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "WLDPushNotificationController - Suppressing AMS/Mercury notification. Payload lacks subsection", v1, 2u);
}

@end