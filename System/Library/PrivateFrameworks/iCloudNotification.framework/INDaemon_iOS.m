@interface INDaemon_iOS
- (BOOL)_unsafe_isLegacyDeviceStorageLevelNotificationEnabled;
- (INDaemon_iOS)init;
- (INDelayedOfferFailsafeActivity)delayedOfferFailsafeActivity;
- (id)accountPushNotificationHandlerForEventType:(id)a3;
- (id)pushTopics;
- (void)_configureXPCEventStreamHandler;
- (void)_handleDeviceDidPairEvent;
- (void)_handleDeviceDidSetupNotification:(id)a3;
- (void)_handleDeviceNameChangeEvent;
- (void)_handleLanguageChangedEvent;
- (void)_loadPushNotificationHandlers;
- (void)_unsafe_handlePhotosOptimizeStateChangedEvent;
- (void)_unsafe_handlePhotosiCPLStateChangedEvent;
- (void)_unsafe_handleSimulateVFSAlmostFullEvent;
- (void)_unsafe_handleSimulateVFSNotFullEvent;
- (void)_unsafe_handleVFSFallBelowLowDisk;
- (void)_unsafe_handleVFSFallBelowNearLowDisk;
- (void)_unsafe_handleVFSFallBelowVeryLowDisk;
- (void)_unsafe_handleVFSRiseAboveDesiredDisk;
- (void)_unsafe_handleVFSRiseAboveLowDisk;
- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3;
- (void)calculateExtraQuotaNeededToSyncForAccountWithID:(id)a3 isAccountFull:(BOOL)a4 completion:(id)a5;
- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4;
- (void)getCacheDataForLink:(id)a3 completion:(id)a4;
- (void)handleICloudQuotaPush:(id)a3;
- (void)iCloudServerOfferForAccountWithID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4;
- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4;
- (void)remoteFreshmintFlowCompletedWithSuccess:(BOOL)a3 error:(id)a4;
- (void)renewCredentialsWithCompletion:(id)a3;
- (void)setDelayedOfferFailsafeActivity:(id)a3;
- (void)start;
- (void)startDelayedOfferFailsafeActivityWithDelaySecs:(int64_t)a3 completion:(id)a4;
- (void)stopDelayedOfferFailsafeActivityWithCompletion:(id)a3;
@end

@implementation INDaemon_iOS

- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, void))a4;
  if (sub_100003D34())
  {
    switch(a3)
    {
      case 0:
        [(INDaemon_iOS *)self _unsafe_handleVFSRiseAboveDesiredDisk];
        break;
      case 1:
        [(INDaemon_iOS *)self _unsafe_handleVFSFallBelowNearLowDisk];
        break;
      case 2:
        [(INDaemon_iOS *)self _unsafe_handleVFSFallBelowLowDisk];
        break;
      case 3:
        [(INDaemon_iOS *)self _unsafe_handleVFSFallBelowVeryLowDisk];
        break;
      case 6:
        [(INDaemon_iOS *)self _unsafe_handleVFSRiseAboveLowDisk];
        break;
      default:
        v7 = _INLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10002B108();
        }

        goto LABEL_10;
    }
    v6[2](v6, 1, 0);
  }
  else
  {
LABEL_10:
    v8 = INCreateError();
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v8);
  }
}

- (void)_unsafe_handleVFSRiseAboveLowDisk
{
  v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disk space improved to low level. Removing Storage Management alert.", v5, 2u);
  }

  v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 stopDirectingToStorageManagement];

  [(INDaemon *)self _unsafe_icqReconsiderOffersWithReason:ICQFetchOffersReasonRiseAboveLowDisk reuseLocalOffers:1];
}

- (INDaemon_iOS)init
{
  v7.receiver = self;
  v7.super_class = (Class)INDaemon_iOS;
  v2 = [(INDaemon *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(INDaemon_iOS *)v2 _loadPushNotificationHandlers];
    v4 = objc_alloc_init(INDelayedOfferFailsafeActivity);
    [(INDaemon_iOS *)v3 setDelayedOfferFailsafeActivity:v4];

    +[NRPairedDeviceRegistry sharedInstance];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"_handleDeviceDidSetupNotification:" name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];
  }
  return v3;
}

- (void)start
{
  if (![(INDaemon *)self isRunning])
  {
    v4.receiver = self;
    v4.super_class = (Class)INDaemon_iOS;
    [(INDaemon *)&v4 start];
    v3 = _INLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10002AEDC();
    }

    [(INDaemon_iOS *)self _configureXPCEventStreamHandler];
  }
}

- (void)_configureXPCEventStreamHandler
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000195C4;
  handler[3] = &unk_1000417B8;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001989C;
  v3[3] = &unk_1000417B8;
  v3[4] = self;
  xpc_set_event_stream_handler("com.apple.dispatch.vfs", (dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_handleDeviceNameChangeEvent
{
  v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device name has changed.", buf, 2u);
  }

  objc_super v4 = [(INDaemon *)self accountStore];
  v5 = objc_msgSend(v4, "aa_appleAccounts");

  if ([v5 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v12 = _INLogSystem();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v19 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Checking if new registration for account %@ is warranted...", buf, 0xCu);
          }

          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100019E64;
          v13[3] = &unk_100041520;
          v13[4] = v11;
          [(INDaemon *)self registerForPushNotificationsWithAccount:v11 reason:4 completion:v13];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v6 = _INLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No iCloud accounts found, so there's nothing to do.", buf, 2u);
    }
  }
}

- (void)_handleDeviceDidPairEvent
{
  v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "devicedidpair get fired, no action performed!", v3, 2u);
  }
}

- (void)_handleDeviceDidSetupNotification:(id)a3
{
  objc_super v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "New paired device!", buf, 2u);
  }

  v5 = [(INDaemon *)self accountStore];
  v6 = objc_msgSend(v5, "aa_appleAccounts");

  if ([v6 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v13 = _INLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v20 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Checking if new registration for account %@ is warranted...", buf, 0xCu);
          }

          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_10001A218;
          v14[3] = &unk_100041520;
          v14[4] = v12;
          [(INDaemon *)self registerForPushNotificationsWithAccount:v12 reason:6 completion:v14];
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v7 = _INLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No iCloud accounts found, so there's nothing to do.", buf, 2u);
    }
  }
}

- (void)_handleLanguageChangedEvent
{
  v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Language has changed, clearing cached offers", v4, 2u);
  }

  v3 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v3 teardownCachedOffers];

  if (objc_opt_respondsToSelector()) {
    +[CSFFeatureManager revalidateCFU];
  }
}

- (void)_loadPushNotificationHandlers
{
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = [INVerifyTermsPushHandler alloc];
  objc_super v4 = [(INDaemon *)self accountStore];
  v5 = [(INVerifyTermsPushHandler *)v3 initWithAccountStore:v4];

  [v12 setObject:v5 forKeyedSubscript:@"t_needs_agree"];
  [v12 setObject:v5 forKeyedSubscript:@"t_did_agree"];
  v6 = (NSDictionary *)[v12 copy];
  accountPushNotificationHandlersByEventType = self->_accountPushNotificationHandlersByEventType;
  self->_accountPushNotificationHandlersByEventType = v6;

  id v8 = [INAccountEventPushHandler alloc];
  id v9 = [(INDaemon *)self accountStore];
  uint64_t v10 = [(INAccountEventPushHandler *)v8 initWithAccountStore:v9];
  accountDefaultEventPushNotificationHandler = self->_accountDefaultEventPushNotificationHandler;
  self->_accountDefaultEventPushNotificationHandler = v10;
}

- (id)accountPushNotificationHandlerForEventType:(id)a3
{
  objc_super v4 = [(NSDictionary *)self->_accountPushNotificationHandlersByEventType objectForKeyedSubscript:a3];
  accountDefaultEventPushNotificationHandler = v4;
  if (!v4)
  {
    v6 = _INLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002AFAC();
    }

    accountDefaultEventPushNotificationHandler = self->_accountDefaultEventPushNotificationHandler;
  }
  id v7 = accountDefaultEventPushNotificationHandler;

  return v7;
}

- (id)pushTopics
{
  CFStringRef v6 = @"com.me.setupservice";
  v2 = +[NSArray arrayWithObjects:&v6 count:1];
  id v3 = [v2 mutableCopy];

  if (sub_100003D34()) {
    [v3 addObject:@"com.icloud.quota"];
  }
  id v4 = [v3 copy];

  return v4;
}

- (void)handleICloudQuotaPush:(id)a3
{
  id v4 = a3;
  v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = [v4 userInfo];
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "> Handling iCloudQuota push message: %@", buf, 0xCu);
  }
  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"category"];

  if ([v8 isEqualToString:@"oobe"])
  {
    id v9 = [v4 userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"eventDetails"];

    uint64_t v11 = [v10 objectForKeyedSubscript:@"subCategory"];
    if (![v11 isEqualToString:@"prebuddy"])
    {
LABEL_20:

      goto LABEL_21;
    }
    id v12 = [v10 objectForKeyedSubscript:@"action"];
    v13 = [v10 objectForKeyedSubscript:@"additionalInfo"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v15 = [v10 objectForKeyedSubscript:@"additionalInfo"];
    }
    else
    {
      long long v15 = 0;
    }
    long long v16 = _INLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [v4 userInfo];
      *(_DWORD *)buf = 138412546;
      v24 = v12;
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Handling iCloudQuota OOBE Prebuddy %@ push notification: %@", buf, 0x16u);
    }
    if ([v12 isEqualToString:@"start"])
    {
      long long v18 = +[MBPrebuddyManager sharedManager];
      [v18 signalPrebuddy:v15];
    }
    else if ([v12 isEqualToString:@"cancel"])
    {
      long long v18 = +[MBPrebuddyManager sharedManager];
      [v18 cancelPrebuddy];
    }
    else
    {
      if (![v12 isEqualToString:@"delete"])
      {
        if (![v12 isEqualToString:@"restore"])
        {
          if ([v12 isEqualToString:@"purchase"])
          {
            long long v18 = objc_alloc_init((Class)MBManager);
            id v22 = 0;
            [v18 exitMegaBackupMode:&v22];
            id v19 = v22;
            if (v19)
            {
              uint64_t v20 = _INLogSystem();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                sub_10002AFE0(v19, v20);
              }
            }
          }
          else
          {
            long long v18 = _INLogSystem();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_10002B074();
            }
          }
          goto LABEL_19;
        }
        +[DKFollowUp postFollowUp];
      }
      long long v18 = +[MBPrebuddyManager sharedManager];
      [v18 prebuddyBackupDeleted:v15];
    }
LABEL_19:

    goto LABEL_20;
  }
  v21.receiver = self;
  v21.super_class = (Class)INDaemon_iOS;
  [(INDaemon *)&v21 handleICloudQuotaPush:v4];
LABEL_21:
}

- (void)iCloudServerOfferForAccountWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = _INLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received offer request for account %@ over XPC.", (uint8_t *)&v19, 0xCu);
  }

  if ((sub_100003D34() & 1) != 0
    && v8
    && ([(INDaemon *)self accountStore],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v12 accountWithIdentifier:v8],
        v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    long long v14 = [v13 accountType];
    long long v15 = [v14 identifier];
    unsigned __int8 v16 = [v15 isEqualToString:ACAccountTypeIdentifierAppleAccount];

    if (v16)
    {
      long long v17 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
      if (!v17) {
        sub_10002B0DC();
      }

      long long v18 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
      [v18 daemonOfferDictionaryForAccount:v13 options:v9 completion:v10];
    }
    else
    {
      long long v18 = INCreateError();
      v10[2](v10, 0, v18);
    }
  }
  else
  {
    v13 = INCreateError();
    v10[2](v10, 0, v13);
  }
}

- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _INLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "presenting freshmint flow with context %@", buf, 0xCu);
  }

  if (sub_100003D34())
  {
    id v9 = objc_retainBlock(v7);
    id freshmintCompletion = self->_freshmintCompletion;
    self->_id freshmintCompletion = v9;

    uint64_t v11 = (ICQRemotePresentationManager *)[objc_alloc((Class)ICQRemotePresentationManager) initWithRemoteContext:v6];
    presentationManager = self->_presentationManager;
    self->_presentationManager = v11;

    objc_initWeak((id *)buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001AE74;
    v18[3] = &unk_1000417E0;
    objc_copyWeak(&v19, (id *)buf);
    [(ICQRemotePresentationManager *)self->_presentationManager setPresentationWasInvalidated:v18];
    v13 = self->_presentationManager;
    long long v14 = [(INDaemon *)self listener];
    long long v15 = [v14 endpoint];
    unsigned __int8 v16 = [v15 _endpoint];
    [(ICQRemotePresentationManager *)v13 presentHiddenFreshmintFlowWithEndpoint:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    long long v17 = INCreateError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);
  }
}

- (void)remoteFreshmintFlowCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _INLogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v8) {
      goto LABEL_7;
    }
    LOWORD(v14) = 0;
    id v9 = "remoteFreshmintFlowCompletedWithSuccess: YES";
    uint64_t v10 = v7;
    uint32_t v11 = 2;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    int v14 = 138412290;
    id v15 = v6;
    id v9 = "remoteFreshmintFlowCompletedWithSuccess: NO (user possibly canceled) with error: %@";
    uint64_t v10 = v7;
    uint32_t v11 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
LABEL_7:

  id freshmintCompletion = (void (**)(id, BOOL, id))self->_freshmintCompletion;
  if (freshmintCompletion) {
    freshmintCompletion[2](freshmintCompletion, v4, v6);
  }
  presentationManager = self->_presentationManager;
  self->_presentationManager = 0;
}

- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AppLaunch detected for Bundle: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = +[NSDate now];
  +[_ICQHelperFunctions appLaunchLinkTrackerSetLastShownDate:v5 forBundleID:v3];
}

- (void)getCacheDataForLink:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _INLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking for Cached content for Link: %@", (uint8_t *)&v8, 0xCu);
  }

  [v5 getCachedContentWithCompletion:v6];
}

- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  id v6 = a3;
  int v7 = sub_100003D34();
  int v8 = _INLogSystem();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Adding common headers to request", (uint8_t *)v13, 2u);
    }

    id v10 = [v6 mutableCopy];
    uint32_t v11 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
    [v11 addCommonHeadersToRequest:v10];

    uint64_t v12 = [v10 allHTTPHeaderFields];
    v5[2](v5, v12);

    id v5 = (void (**)(id, uint64_t))v12;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002B1A4();
    }

    id v10 = [v6 allHTTPHeaderFields];

    v5[2](v5, (uint64_t)v10);
  }
}

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v3 = a3;
  int v4 = sub_100003D34();
  id v5 = _INLogSystem();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10002B1D8(v6);
    }

    int v7 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
    [v7 renewCredentialsWithCompletion:v3];

    id v3 = v7;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002B25C();
    }

    (*((void (**)(id, uint64_t, void))v3 + 2))(v3, 2, 0);
  }
}

- (void)_unsafe_handlePhotosiCPLStateChangedEvent
{
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Photos iCPL state changed.", v4, 2u);
  }

  [(INDaemon *)self _unsafe_icqReconsiderOffersWithReason:ICQFetchOffersReasonICPLStateChanged reuseLocalOffers:0];
}

- (void)_unsafe_handlePhotosOptimizeStateChangedEvent
{
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Photos optimize state changed.", v4, 2u);
  }

  [(INDaemon *)self _unsafe_icqReconsiderOffersWithReason:ICQFetchOffersReasonPhotosOptimizeStateChanged reuseLocalOffers:0];
}

- (void)_unsafe_handleVFSFallBelowVeryLowDisk
{
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disk space fell below very low level. Using Storage Management alert.", v5, 2u);
  }

  int v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 startDirectingToStorageManagement];

  [(INDaemon *)self _unsafe_icqReconsiderOffersWithReason:ICQFetchOffersReasonFallBelowVeryLowDisk reuseLocalOffers:1];
}

- (void)_unsafe_handleVFSFallBelowLowDisk
{
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disk space fell below low level.", v4, 2u);
  }

  [(INDaemon *)self _unsafe_icqReconsiderOffersWithReason:ICQFetchOffersReasonFallBelowLowDisk reuseLocalOffers:1];
}

- (void)_unsafe_handleVFSFallBelowNearLowDisk
{
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disk space fell below near low level.", v4, 2u);
  }

  [(INDaemon *)self _unsafe_icqUpdateOfferForButtonId:@"deviceFull"];
  [(INDaemon *)self _unsafe_icqReconsiderOffersWithReason:ICQFetchOffersReasonFallBelowNearLowDisk reuseLocalOffers:1];
}

- (void)_unsafe_handleVFSRiseAboveDesiredDisk
{
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disk space improved to desired level.", v5, 2u);
  }

  [(INDaemon *)self _unsafe_icqUpdateOfferForButtonId:@"sufficient"];
  int v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 stopDirectingToStorageManagement];

  [(INDaemon *)self _unsafe_icqReconsiderOffersWithReason:ICQFetchOffersReasonRiseAboveDesiredDisk reuseLocalOffers:1];
}

- (void)_unsafe_handleSimulateVFSAlmostFullEvent
{
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Simulated VFS almost full event.", v5, 2u);
  }

  int v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 setSimulatedDeviceStorageAlmostFull:1];

  [(INDaemon *)self _unsafe_icqReconsiderOffers];
}

- (void)_unsafe_handleSimulateVFSNotFullEvent
{
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Simulated VFS not full event.", v5, 2u);
  }

  int v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 setSimulatedDeviceStorageAlmostFull:0];

  [(INDaemon *)self _unsafe_icqReconsiderOffers];
}

- (BOOL)_unsafe_isLegacyDeviceStorageLevelNotificationEnabled
{
  v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  unsigned __int8 v3 = [v2 isLegacyDeviceStorageLevelNotificationEnabled];

  return v3;
}

- (void)startDelayedOfferFailsafeActivityWithDelaySecs:(int64_t)a3 completion:(id)a4
{
  int v7 = (void (**)(id, void))a4;
  id v6 = [(INDaemon_iOS *)self delayedOfferFailsafeActivity];
  [v6 startActivityWithDelaySecs:a3];

  v7[2](v7, 0);
}

- (void)stopDelayedOfferFailsafeActivityWithCompletion:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  int v4 = [(INDaemon_iOS *)self delayedOfferFailsafeActivity];
  [v4 stopActivity];

  v5[2](v5, 0);
}

- (void)calculateExtraQuotaNeededToSyncForAccountWithID:(id)a3 isAccountFull:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = _INLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint32_t v11 = "-[INDaemon_iOS calculateExtraQuotaNeededToSyncForAccountWithID:isAccountFull:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  +[ICQDaemonPlanRecommendation calculateExtraQuotaNeededToSyncForAccountWithID:v8 isAccountFull:v5 completion:v7];
}

- (INDelayedOfferFailsafeActivity)delayedOfferFailsafeActivity
{
  return self->_delayedOfferFailsafeActivity;
}

- (void)setDelayedOfferFailsafeActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedOfferFailsafeActivity, 0);
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_storeStrong(&self->_freshmintCompletion, 0);
  objc_storeStrong((id *)&self->_accountDefaultEventPushNotificationHandler, 0);
  objc_storeStrong((id *)&self->_accountPushNotificationHandlersByEventType, 0);
}

@end