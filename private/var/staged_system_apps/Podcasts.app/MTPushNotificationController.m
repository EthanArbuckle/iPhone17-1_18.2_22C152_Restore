@interface MTPushNotificationController
+ (BOOL)shouldProcessNotification:(id)a3;
+ (BOOL)shouldSyncFeedUpdateForNotification:(id)a3;
+ (BOOL)shouldSyncSubscriptionsForNotification:(id)a3;
+ (BOOL)shouldSyncUppForNotification:(id)a3;
+ (id)storeIdFromFeedUpdateNotification:(id)a3;
+ (id)triggeredByFromFeedUpdateNotification:(id)a3;
- (AMSPushHandler)marketingPushHandler;
- (BOOL)alreadyRegisteredWithActiveDsid;
- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5;
- (BOOL)shouldShowAnnouncementNotification:(id)a3;
- (MTPushNotificationController)init;
- (MZKeyValueStoreController)keyValueStoreController;
- (OS_dispatch_queue)workQueue;
- (int)subscriptionState;
- (void)_registerPushNotifications;
- (void)_setupMarketingPushHandlerWithBag:(id)a3;
- (void)_unregisterPushNotifications;
- (void)dealloc;
- (void)didChangeStoreAccount:(id)a3;
- (void)didFailToRegisterWithError:(id)a3;
- (void)didRegisterWithToken:(id)a3;
- (void)executeAction:(id)a3 using:(id)a4 andToken:(id)a5;
- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5;
- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4;
- (void)processAnnouncementNotification:(id)a3;
- (void)registerPushNotifications;
- (void)setKeyValueStoreController:(id)a3;
- (void)setKeyValueStoreControllerForUrl:(id)a3;
- (void)setMarketingPushHandler:(id)a3;
- (void)setSubscriptionState:(int)a3;
- (void)setWorkQueue:(id)a3;
- (void)unregisterPushNotifications;
@end

@implementation MTPushNotificationController

- (void)registerPushNotifications
{
  v2 = self;
  objc_sync_enter(v2);
  switch([(MTPushNotificationController *)v2 subscriptionState])
  {
    case 0:
      goto LABEL_13;
    case 1:
      v3 = _MTLogCategoryCloudSync();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      __int16 v11 = 0;
      v4 = "Registering for APNS. Early return";
      v5 = (uint8_t *)&v11;
      goto LABEL_16;
    case 2:
      v3 = _MTLogCategoryCloudSync();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      __int16 v14 = 0;
      v4 = "Registered for APNS. Early return";
      v5 = (uint8_t *)&v14;
      goto LABEL_16;
    case 3:
      v6 = +[MTAccountController sharedInstance];
      v7 = [v6 activeAccount];

      if (v7)
      {
        v8 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "User is now signed in, re-registering for APNS.", buf, 2u);
        }

        [(MTPushNotificationController *)v2 unregisterPushNotifications];
LABEL_13:
        [(MTPushNotificationController *)v2 setSubscriptionState:1];
        [(MTPushNotificationController *)v2 _registerPushNotifications];
      }
      else
      {
        v3 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          v4 = "Registered for APNS with no account. Early return";
          v5 = v12;
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
        }
LABEL_17:
      }
LABEL_18:
      objc_sync_exit(v2);

      return;
    case 4:
      v9 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to complete APNS unregistration. Reason: interrupted by registration request.", v10, 2u);
      }

      goto LABEL_13;
    default:
      goto LABEL_18;
  }
}

- (void)_registerPushNotifications
{
  v3 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering push notification with RemoteNotification", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FEE0;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (MTPushNotificationController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTPushNotificationController;
  v2 = [(MTPushNotificationController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(MTPushNotificationController *)v2 setSubscriptionState:0];
    v4 = +[IMURLBag sharedInstance];
    [(MTPushNotificationController *)v3 _setupMarketingPushHandlerWithBag:v4];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"didChangeStoreAccount:" name:ACDAccountStoreDidChangeNotification object:0];

    dispatch_queue_t v6 = dispatch_queue_create("MTPushNotificationController", 0);
    [(MTPushNotificationController *)v3 setWorkQueue:v6];
  }
  return v3;
}

- (void)_setupMarketingPushHandlerWithBag:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc_init((Class)AMSPushConfiguration);
  v5 = +[NSSet set];
  [v7 setEnabledActionTypes:v5];

  [v7 setUserNotificationExtensionId:@"com.apple.podcasts.announcement"];
  id v6 = [objc_alloc((Class)AMSPushHandler) initWithConfiguration:v7 bag:v4];

  [(MTPushNotificationController *)self setMarketingPushHandler:v6];
}

- (void)didRegisterWithToken:(id)a3
{
  id v4 = a3;
  v5 = +[MTAccountController sharedInstance];
  id v6 = [v5 activeAccount];

  if (v6)
  {
    objc_initWeak(location, self);
    id v7 = +[IMURLBag sharedInstance];
    objc_super v8 = [v7 pushNotificationRegistration];
    v9 = [(MTPushNotificationController *)self workQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001024AC;
    v11[3] = &unk_100551778;
    objc_copyWeak(&v13, location);
    id v12 = v4;
    [v8 asyncValueOnQueue:v9 withCompletion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  else
  {
    v10 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "No account, not proceeding with bookkeeper push registration", (uint8_t *)location, 2u);
    }

    [(MTPushNotificationController *)self setSubscriptionState:3];
  }
}

- (int)subscriptionState
{
  return self->_subscriptionState;
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setSubscriptionState:(int)a3
{
  self->_subscriptionState = a3;
}

- (void)setMarketingPushHandler:(id)a3
{
}

- (void)unregisterPushNotifications
{
  v2 = self;
  objc_sync_enter(v2);
  switch([(MTPushNotificationController *)v2 subscriptionState])
  {
    case 0:
      v3 = _MTLogCategoryCloudSync();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
      __int16 v9 = 0;
      id v4 = "Unregistered from APNS. Early return";
      v5 = (uint8_t *)&v9;
      goto LABEL_6;
    case 1:
      id v6 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to complete APNS registration. Reason: interrupted by unregistration request.", v7, 2u);
      }

      goto LABEL_11;
    case 2:
    case 3:
LABEL_11:
      [(MTPushNotificationController *)v2 setSubscriptionState:4];
      [(MTPushNotificationController *)v2 _unregisterPushNotifications];
      break;
    case 4:
      v3 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v4 = "Unregistering from APNS. Early return";
        v5 = buf;
LABEL_6:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
      }
LABEL_7:

      break;
    default:
      break;
  }
  objc_sync_exit(v2);
}

- (void)_unregisterPushNotifications
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100101FF4;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didChangeStoreAccount:(id)a3
{
  id v4 = a3;
  if (![(MTPushNotificationController *)self alreadyRegisteredWithActiveDsid]
    && +[MTAccountController iTunesAccountDidChangeForACAccountNotification:v4])
  {
    v5 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "iTunes account changed. Unregister and attempt to register device token.", v6, 2u);
    }

    [(MTPushNotificationController *)self unregisterPushNotifications];
    [(MTPushNotificationController *)self registerPushNotifications];
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTPushNotificationController;
  [(MTPushNotificationController *)&v4 dealloc];
}

- (BOOL)alreadyRegisteredWithActiveDsid
{
  if ([(MTPushNotificationController *)self subscriptionState] != 2) {
    return 0;
  }
  v2 = +[MTAccountController sharedInstance];
  v3 = [v2 activeDsid];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setKeyValueStoreControllerForUrl:(id)a3
{
  id v13 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  v5 = [(MTPushNotificationController *)v4 keyValueStoreController];
  id v6 = [v5 defaultSetURL];
  id v7 = [v6 absoluteString];
  objc_super v8 = [v13 absoluteString];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    v10 = [MZKeyValueStoreController alloc];
    __int16 v11 = [(MZKeyValueStoreController *)v10 initWithDomain:kPodcastsBookkeeperPodcastsDomain baseURLForGETAll:v13 baseURLForPUTAll:v13];
    [(MTPushNotificationController *)v4 setKeyValueStoreController:v11];

    id v12 = [(MTPushNotificationController *)v4 keyValueStoreController];
    [v12 setDelegate:v4];
  }
  objc_sync_exit(v4);
}

- (void)executeAction:(id)a3 using:(id)a4 andToken:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  [(MTPushNotificationController *)self setKeyValueStoreControllerForUrl:v8];
  id v10 = [objc_alloc((Class)_TtC18PodcastsFoundation23PushSubscriptionRequest) initWithEndpointURL:v8 action:v14 apnsToken:v9];
  __int16 v11 = self;
  objc_sync_enter(v11);
  id v12 = [(MTPushNotificationController *)v11 keyValueStoreController];
  id v13 = [v12 scheduleApnSubscriptionTransactionWithPushSubscriptionRequest:v10];

  objc_sync_exit(v11);
}

- (void)didFailToRegisterWithError:(id)a3
{
  id v4 = a3;
  v5 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to complete APNS registration. Reason: %@.", (uint8_t *)&v7, 0xCu);
  }

  id v6 = self;
  objc_sync_enter(v6);
  if ([(MTPushNotificationController *)v6 subscriptionState] == 1) {
    [(MTPushNotificationController *)v6 setSubscriptionState:0];
  }
  objc_sync_exit(v6);
}

+ (BOOL)shouldProcessNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dsid];
  v5 = +[MTAccountController sharedInstance];
  id v6 = [v5 activeDsid];

  unsigned int v7 = 0;
  if (v4 && v6) {
    unsigned int v7 = [v4 isEqualToNumber:v6];
  }
  id v8 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v3 domain];
    uint64_t v10 = [v3 domainVersion];
    __int16 v11 = (void *)v10;
    int v14 = 138413314;
    CFStringRef v12 = @"NO";
    v15 = v4;
    if (v7) {
      CFStringRef v12 = @"YES";
    }
    __int16 v16 = 2112;
    v17 = v6;
    __int16 v18 = 2112;
    v19 = v9;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    CFStringRef v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Push] Received APNS notification for DSID = %@, currentDsid = %@, domain = %@, version = %@, will process = %@", (uint8_t *)&v14, 0x34u);
  }
  return v7;
}

+ (BOOL)shouldSyncSubscriptionsForNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:kPodcastsBookkeeperPodcastsDomain];

  if (v5)
  {
    id v6 = [v3 domainVersion];
    unsigned int v7 = [v6 stringValue];

    id v8 = +[SyncKeysRepository shared];
    id v9 = [v8 podcastsDomainVersion];

    if (v7) {
      unsigned int v5 = [v7 isEqualToString:v9] ^ 1;
    }
    else {
      unsigned int v5 = 1;
    }
    uint64_t v10 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [v3 domain];
      CFStringRef v12 = @"SKIP";
      int v14 = 138413058;
      v15 = v11;
      if (v5) {
        CFStringRef v12 = @"PROCESS";
      }
      __int16 v16 = 2112;
      v17 = v7;
      __int16 v18 = 2112;
      v19 = v9;
      __int16 v20 = 2112;
      CFStringRef v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Push] Notification for domain %@, remote version = %@, local version = %@ --> %@", (uint8_t *)&v14, 0x2Au);
    }
  }

  return v5;
}

+ (BOOL)shouldSyncUppForNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:kPodcastsBookkeeperUppDomain];

  if (v5)
  {
    id v6 = [v3 domainVersion];
    unsigned int v7 = [v6 stringValue];

    id v8 = +[MTUniversalPlaybackPositionTransactionContext UPPDomainVersion];
    if (v7) {
      unsigned int v5 = [v7 isEqualToString:v8] ^ 1;
    }
    else {
      unsigned int v5 = 1;
    }
    id v9 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v3 domain];
      CFStringRef v11 = @"SKIP";
      int v13 = 138413058;
      int v14 = v10;
      if (v5) {
        CFStringRef v11 = @"PROCESS";
      }
      __int16 v15 = 2112;
      __int16 v16 = v7;
      __int16 v17 = 2112;
      __int16 v18 = v8;
      __int16 v19 = 2112;
      CFStringRef v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Push] Notification for domain %@, remote version = %@, local version = %@ --> %@", (uint8_t *)&v13, 0x2Au);
    }
  }

  return v5;
}

+ (BOOL)shouldSyncFeedUpdateForNotification:(id)a3
{
  id v3 = [a3 type];
  unsigned __int8 v4 = [v3 isEqualToString:kPodcastsPushNotificationTypeFeedUpdate];

  return v4;
}

+ (id)storeIdFromFeedUpdateNotification:(id)a3
{
  return [a3 storeId];
}

+ (id)triggeredByFromFeedUpdateNotification:(id)a3
{
  return _[a3 triggeredBy];
}

- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 action];
  if ([v8 isEqualToString:kPodcastsPushNotificationRegisterValue])
  {
    id v9 = self;
    objc_sync_enter(v9);
    if ([(MTPushNotificationController *)v9 subscriptionState] != 1)
    {
      objc_sync_exit(v9);
      goto LABEL_9;
    }
    [(MTPushNotificationController *)v9 setSubscriptionState:2];
    objc_sync_exit(v9);

    _MTLogCategoryCloudSync();
    id v9 = (MTPushNotificationController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = 0;
      uint64_t v10 = "[Push] Registered for APNS.";
      CFStringRef v11 = (uint8_t *)&v15;
      CFStringRef v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v10, v11, 2u);
    }
  }
  else
  {
    _MTLogCategoryCloudSync();
    id v9 = (MTPushNotificationController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = 0;
      uint64_t v10 = "[Push] Could not find a valid action for APNS registration transaction.";
      CFStringRef v11 = (uint8_t *)&v14;
      CFStringRef v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5
{
  id v5 = a5;
  id v6 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[Push] APNS registration transaction failed with error %@. Will retry.", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[Push] APNS registration transaction was canceled with error %@.", (uint8_t *)&v14, 0xCu);
  }

  CFStringRef v12 = [v9 action];
  if ([v12 isEqualToString:kPodcastsPushNotificationRegisterValue])
  {
    os_log_type_t v13 = self;
    objc_sync_enter(v13);
    if ([(MTPushNotificationController *)v13 subscriptionState] == 1) {
      [(MTPushNotificationController *)v13 setSubscriptionState:0];
    }
    objc_sync_exit(v13);
  }
  else
  {
    _MTLogCategoryCloudSync();
    os_log_type_t v13 = (MTPushNotificationController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_ERROR, "[Push] Could not find a valid action for APNS registration transaction.", (uint8_t *)&v14, 2u);
    }
  }
}

- (BOOL)shouldShowAnnouncementNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPushNotificationController *)self marketingPushHandler];
  unsigned __int8 v6 = [v5 shouldHandleNotification:v4];

  return v6;
}

- (void)processAnnouncementNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPushNotificationController *)self marketingPushHandler];
  [v5 handleNotification:v4];
}

- (AMSPushHandler)marketingPushHandler
{
  return self->_marketingPushHandler;
}

- (MZKeyValueStoreController)keyValueStoreController
{
  return self->_keyValueStoreController;
}

- (void)setKeyValueStoreController:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_keyValueStoreController, 0);

  objc_storeStrong((id *)&self->_marketingPushHandler, 0);
}

@end