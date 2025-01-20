@interface INDaemon
+ (id)sharedInstance;
- (ACAccountStore)accountStore;
- (APSConnection)apsConnection;
- (BOOL)_isFirstLaunchAfterBoot;
- (BOOL)_isFirstLaunchAfterBootMacOS;
- (BOOL)_isFirstLaunchAfterBootiOS;
- (BOOL)hasCheckedForFirstLaunch;
- (BOOL)isRunning;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)reconsideringOffers;
- (INActivity)freshmintActivity;
- (INActivity)hearbeatActivity;
- (INDaemon)init;
- (INRegistrar)registrar;
- (INRegistrationDigestCache)registrationDigestCache;
- (NSArray)pushTopics;
- (NSMutableSet)accountsToReconsiderAfterReboot;
- (NSString)activeAPSEnvironment;
- (NSXPCListener)listener;
- (id)_currentBootSessionUUID;
- (id)accountPushNotificationHandlerForEventType:(id)a3;
- (id)familyPushNotificationHandlerForEventType:(id)a3;
- (id)freshmintObserverObject;
- (id)pushToken;
- (id)quotaPushNotificationHandlerForEventType:(id)a3;
- (void)_cleanUpIfNoAccountsAreLeftOtherThanAccount:(id)a3;
- (void)_disablePushTopics;
- (void)_enablePushTopics;
- (void)_ensureDesiredAPSEnvironmentIsInUseWithCompletion:(id)a3;
- (void)_handleGMSAvailabilityChange;
- (void)_handleModelCatalogChange;
- (void)_handleOSEligibilityChange;
- (void)_initiateAPSConnectionWithCompletion:(id)a3;
- (void)_performHeartbeatRegistration;
- (void)_performLoggedOutHeartbeatRegistrationIfNeeded;
- (void)_planForRegistrationTTL:(unint64_t)a3 account:(id)a4;
- (void)_registrationDigestCacheDidBecomeAvailable:(id)a3;
- (void)_stopHeartbeat;
- (void)_unregisterAccount:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4;
- (void)_unregisterAccount:(id)a3 fromiCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5;
- (void)_unsafe_ensureFreshmintActivityValidity;
- (void)_unsafe_icqReconsiderOffers;
- (void)_unsafe_icqReconsiderOffersWithReason:(id)a3;
- (void)_unsafe_icqReconsiderOffersWithReason:(id)a3 reuseLocalOffers:(BOOL)a4;
- (void)_unsafe_icqReconsiderOffersWithReason:(id)a3 reuseLocalOffers:(BOOL)a4 completion:(id)a5;
- (void)_unsafe_icqUpdateOfferForButtonId:(id)a3;
- (void)_unsafe_performFreshmintRefreshHeartBeat;
- (void)_unsafe_performFreshmintRefreshWithReason:(id)a3;
- (void)_validateEnabledTopics;
- (void)_validateRegistrationStateIfFirstLaunch;
- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3;
- (void)calculateExtraQuotaNeededToSyncForAccountWithID:(id)a3 isAccountFull:(BOOL)a4 completion:(id)a5;
- (void)clearAllRegistrationDigestsWithCompletion:(id)a3;
- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)diagnosticReportWithCompletion:(id)a3;
- (void)displayDelayedOfferWithContext:(id)a3 completion:(id)a4;
- (void)fetchAppsSyncingToiCloudDriveForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchBackupInfoForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchCompletedAndDismissedRecommendationsForAltDSID:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)fetchRecommendationsForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchRecommendationsRulesetForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchStorageAppsForAltDSID:(id)a3 completion:(id)a4;
- (void)fetchStorageByApp:(id)a3 forAltDSID:(id)a4 completion:(id)a5;
- (void)fetchStorageSummaryForAltDSID:(id)a3 completion:(id)a4;
- (void)handleICloudQuotaPush:(id)a3;
- (void)handlePushRegistrationWithAccount:(id)a3 reason:(unint64_t)a4;
- (void)handlePushUnregistrationWithAccount:(id)a3 completion:(id)a4;
- (void)iCloudServerOfferForAccountWithID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4;
- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4;
- (void)registerAccountWithID:(id)a3 foriCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5;
- (void)registerDeviceForLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4;
- (void)registerForPushNotificationsWithAccount:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)remoteFreshmintFlowCompletedWithSuccess:(BOOL)a3 error:(id)a4;
- (void)renewCredentialsWithCompletion:(id)a3;
- (void)sendStatusForRecommendationsWithAltDSID:(id)a3 configuration:(id)a4 params:(id)a5 completion:(id)a6;
- (void)sendStatusForRecommendationsWithAltDSID:(id)a3 configuration:(id)a4 status:(id)a5 recommendationIdentifiers:(id)a6 storageRecovered:(id)a7 completion:(id)a8;
- (void)sendTipDismissedNetworkRequestForAltDSID:(id)a3 tip:(id)a4 completion:(id)a5;
- (void)sendTipDisplayedNetworkRequestForAltDSID:(id)a3 tip:(id)a4 completion:(id)a5;
- (void)setAccountStore:(id)a3;
- (void)setAccountsToReconsiderAfterReboot:(id)a3;
- (void)setActiveAPSEnvironment:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setFreshmintActivity:(id)a3;
- (void)setFreshmintObserverObject:(id)a3;
- (void)setHasCheckedForFirstLaunch:(BOOL)a3;
- (void)setHearbeatActivity:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setListener:(id)a3;
- (void)setReconsideringOffers:(BOOL)a3;
- (void)setRegistrar:(id)a3;
- (void)setRegistrationDigestCache:(id)a3;
- (void)start;
- (void)startDelayedOfferFailsafeActivityWithDelaySecs:(int64_t)a3 completion:(id)a4;
- (void)stopDelayedOfferFailsafeActivityWithCompletion:(id)a3;
- (void)teardownOffersForAccount:(id)a3 withCompletion:(id)a4;
- (void)unregisterAccountWithID:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4;
- (void)unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4;
- (void)updateOfferForAccountWithID:(id)a3 offerId:(id)a4 buttonId:(id)a5 info:(id)a6 completion:(id)a7;
@end

@implementation INDaemon

- (void)_unsafe_icqReconsiderOffersWithReason:(id)a3 reuseLocalOffers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[UMUserPersona currentPersona];
  unsigned __int8 v8 = [v7 isEnterprisePersona];

  if (v8)
  {
    v9 = _INLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002AA20();
    }
  }
  else
  {
    [(INDaemon *)self _unsafe_icqReconsiderOffersWithReason:v6 reuseLocalOffers:v4 completion:0];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New connection request received.", buf, 2u);
  }

  v7 = [v5 valueForEntitlement:@"com.apple.private.ind.client"];
  unsigned __int8 v8 = [v7 BOOLValue];

  if (v8)
  {
    [v5 setExportedObject:self];
    v9 = +[INDaemonInterface XPCInterface];
    [v5 setExportedInterface:v9];

    [v5 setInterruptionHandler:&stru_100041540];
    [v5 setInvalidationHandler:&stru_100041540];
    [v5 resume];
  }
  else
  {
    v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "INDaemon: incoming connection denied for lacking entitlement.", v12, 2u);
    }
  }
  return v8;
}

- (void)_unsafe_icqReconsiderOffersWithReason:(id)a3 reuseLocalOffers:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(INDaemon *)self reconsideringOffers])
  {
    v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Already reconsidering offers -- skipping", buf, 2u);
    }
  }
  else
  {
    v11 = (void *)os_transaction_create();
    [(INDaemon *)self setReconsideringOffers:1];
    v12 = _INLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Reconsidering iCloud offers for reason: %@.", buf, 0xCu);
    }

    v13 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100003B28;
    v14[3] = &unk_100041718;
    id v15 = v11;
    id v16 = v9;
    v14[4] = self;
    v10 = v11;
    [v13 reconsiderOffersWithReason:v8 reuseLocalOffers:v6 completion:v14];
  }
}

- (void)_unsafe_ensureFreshmintActivityValidity
{
  v3 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  id v5 = [v3 soonestOfferOrStubExpirationDate];

  freshmintActivity = self->_freshmintActivity;
  if (v5) {
    [(INActivity *)freshmintActivity ensureNextActivityWillOccurBeforeDate:v5];
  }
  else {
    [(INActivity *)freshmintActivity stop];
  }
}

- (BOOL)reconsideringOffers
{
  return self->_reconsideringOffers;
}

- (void)setReconsideringOffers:(BOOL)a3
{
  self->_reconsideringOffers = a3;
}

+ (id)sharedInstance
{
  if (qword_10004E490 != -1) {
    dispatch_once(&qword_10004E490, &stru_100041300);
  }
  v2 = (void *)qword_10004E488;
  return v2;
}

- (INDaemon)init
{
  v34.receiver = self;
  v34.super_class = (Class)INDaemon;
  v2 = [(INDaemon *)&v34 init];
  if (v2)
  {
    uint64_t v3 = +[AARemoteServer sharedServerWithNoUrlCache];
    aaSharedRemoteServer = v2->_aaSharedRemoteServer;
    v2->_aaSharedRemoteServer = (AARemoteServer *)v3;

    uint64_t v5 = +[ACAccountStore defaultStore];
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v5;

    uint64_t v7 = +[INRegistrationDigestCache sharedInstance];
    registrationDigestCache = v2->_registrationDigestCache;
    v2->_registrationDigestCache = (INRegistrationDigestCache *)v7;

    id v9 = objc_alloc_init(INRegistrar);
    registrar = v2->_registrar;
    v2->_registrar = v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_registrationDigestCacheDidBecomeAvailable:" name:@"INRegistrationDigestCacheDidBecomeAvailable" object:v2->_registrationDigestCache];

    v12 = [[INActivity alloc] initWithTarget:v2 action:"_performHeartbeatRegistration"];
    hearbeatActivity = v2->_hearbeatActivity;
    v2->_hearbeatActivity = v12;

    [(INActivity *)v2->_hearbeatActivity setActivityID:off_10004E0E8];
    [(INActivity *)v2->_hearbeatActivity setActivityNextFireDateKey:INNextHeartbeatDateKey];
    [(INActivity *)v2->_hearbeatActivity checkIn];
    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    accountsToReconsiderAfterReboot = v2->_accountsToReconsiderAfterReboot;
    v2->_accountsToReconsiderAfterReboot = v14;

    id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.ind.aps-connection-delegate", v17);
    apsConnectionDelegateQueue = v2->_apsConnectionDelegateQueue;
    v2->_apsConnectionDelegateQueue = (OS_dispatch_queue *)v18;

    if (qword_10004E480 != -1) {
      dispatch_once(&qword_10004E480, &stru_1000412E0);
    }
    if (byte_10004E478)
    {
      v20 = [[INActivity alloc] initWithTarget:v2 action:"_unsafe_performFreshmintRefreshHeartBeat"];
      freshmintActivity = v2->_freshmintActivity;
      v2->_freshmintActivity = v20;

      [(INActivity *)v2->_freshmintActivity setActivityID:off_10004E0F0];
      [(INActivity *)v2->_freshmintActivity setActivityNextFireDateKey:INNextFreshmintRefreshDateKey];
      v22 = +[NSNotificationCenter defaultCenter];
      uint64_t v23 = _ICQDaemonOfferPersistedNotificationName;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000041E0;
      v32[3] = &unk_100041328;
      v24 = v2;
      v33 = v24;
      uint64_t v25 = [v22 addObserverForName:v23 object:0 queue:0 usingBlock:v32];
      id freshmintObserverObject = v24->_freshmintObserverObject;
      v24->_id freshmintObserverObject = (id)v25;
    }
    id v27 = objc_alloc_init((Class)NSMutableDictionary);
    v28 = [[INQuotaCleanupPushHandler alloc] initWithAccountStore:v2->_accountStore];
    [v27 setObject:v28 forKeyedSubscript:@"cleanup"];

    v29 = (NSDictionary *)[v27 copy];
    quotaPushNotificationHandlersByEventType = v2->_quotaPushNotificationHandlersByEventType;
    v2->_quotaPushNotificationHandlersByEventType = v29;
  }
  return v2;
}

- (void)start
{
  if (!self->_isRunning)
  {
    uint64_t v3 = _INLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000297E8();
    }

    id v4 = objc_alloc((Class)NSXPCListener);
    uint64_t v5 = (NSXPCListener *)[v4 initWithMachServiceName:INDaemonMachServiceName];
    listener = self->_listener;
    self->_listener = v5;

    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener resume];
    self->_isRunning = 1;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100010D18;
    v8[3] = &unk_100040EC8;
    v8[4] = self;
    [(INDaemon *)self _initiateAPSConnectionWithCompletion:v8];
    uint64_t v7 = [(INDaemon *)self freshmintActivity];
    [v7 checkIn];
  }
}

- (void)dealloc
{
  uint64_t v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002981C();
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  listener = self->_listener;
  if (listener)
  {
    [(NSXPCListener *)listener setDelegate:0];
    [(NSXPCListener *)self->_listener invalidate];
  }
  [(APSConnection *)self->_apsConnection setDelegate:0];
  [(APSConnection *)self->_apsConnection shutdown];
  if (self->_freshmintObserverObject)
  {
    BOOL v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self->_freshmintObserverObject];
  }
  v7.receiver = self;
  v7.super_class = (Class)INDaemon;
  [(INDaemon *)&v7 dealloc];
}

- (void)registerForPushNotificationsWithAccount:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010F20;
  v12[3] = &unk_1000413F0;
  objc_copyWeak(v16, &location);
  id v10 = v9;
  id v15 = v10;
  id v11 = v8;
  v16[1] = (id)a4;
  id v13 = v11;
  v14 = self;
  [(INDaemon *)self _ensureDesiredAPSEnvironmentIsInUseWithCompletion:v12];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)_planForRegistrationTTL:(unint64_t)a3 account:(id)a4
{
  id v6 = a4;
  objc_super v7 = _INLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100029BF8();
  }

  if (a3)
  {
    id v8 = +[NSDate dateWithTimeIntervalSinceNow:(double)a3];
    if (v6)
    {
      objc_msgSend(v6, "in_setRegistrationExpirationDate:", v8);
      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      accountStore = self->_accountStore;
      id v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      id v15 = sub_100011A6C;
      id v16 = &unk_100041418;
      id v17 = v6;
      dispatch_semaphore_t v18 = v9;
      id v11 = v9;
      [(ACAccountStore *)accountStore saveAccount:v17 withDataclassActions:0 doVerify:0 completion:&v13];
      dispatch_time_t v12 = dispatch_time(0, 300000000000);
      dispatch_semaphore_wait(v11, v12);
    }
    else
    {
      +[LoggedOutPushCache registeredDeviceWithExpirationDate:v8];
    }
    -[INActivity ensureNextActivityWillOccurBeforeDate:](self->_hearbeatActivity, "ensureNextActivityWillOccurBeforeDate:", v8, v13, v14, v15, v16);
  }
}

- (void)_unregisterAccount:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4
{
}

- (void)_unregisterAccount:(id)a3 fromiCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011C24;
  v12[3] = &unk_100041490;
  objc_copyWeak(v15, &location);
  id v10 = v9;
  id v14 = v10;
  id v11 = v8;
  id v13 = v11;
  v15[1] = (id)a4;
  [(INDaemon *)self _ensureDesiredAPSEnvironmentIsInUseWithCompletion:v12];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (void)_cleanUpIfNoAccountsAreLeftOtherThanAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100029DFC();
  }

  [(ACAccountStore *)self->_accountStore aa_appleAccounts];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    while (2)
    {
      id v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v10) identifier];
        dispatch_time_t v12 = [v4 identifier];

        if (v11 != v12)
        {

          id v14 = _INLogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "We have remaining iCloud accounts. Not cleaning up.", buf, 2u);
          }

          goto LABEL_17;
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v13 = _INLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No remaining iCloud accounts. Turning off APS topics and heartbeat.", buf, 2u);
  }

  [(INDaemon *)self _disablePushTopics];
  [(INActivity *)self->_hearbeatActivity stop];
LABEL_17:
  id v15 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
  id v16 = objc_msgSend(v15, "aa_altDSID");
  id v17 = objc_msgSend(v4, "aa_altDSID");
  if ([v16 isEqualToString:v17])
  {

LABEL_20:
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100012334;
    v19[3] = &unk_1000414D8;
    v19[4] = self;
    +[CSFFeatureManager deviceHasAnyTicket:v19];
    goto LABEL_21;
  }
  dispatch_semaphore_t v18 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];

  if (!v18) {
    goto LABEL_20;
  }
LABEL_21:
}

- (void)handlePushUnregistrationWithAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = _INLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling push un-registration.", v10, 2u);
  }

  if (qword_10004E480 != -1) {
    dispatch_once(&qword_10004E480, &stru_1000412E0);
  }
  if (!byte_10004E478)
  {
    v7[2](v7);
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v9 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v9 teardownOffersForAccount:v6 completion:v7];

  if (!v6)
  {
LABEL_7:
    [(INDaemon *)self _stopHeartbeat];
    +[LoggedOutPushCache unregisteredDevice];
  }
LABEL_8:
}

- (void)handlePushRegistrationWithAccount:(id)a3 reason:(unint64_t)a4
{
  id v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling push registration.", v8, 2u);
  }

  if (qword_10004E480 != -1) {
    dispatch_once(&qword_10004E480, &stru_1000412E0);
  }
  if (byte_10004E478)
  {
    id v7 = +[INHelperFunctions fetchOfferReasonWithRegistrationReason:a4];
    [(INDaemon *)self _unsafe_performFreshmintRefreshWithReason:v7];
  }
}

- (void)_registrationDigestCacheDidBecomeAvailable:(id)a3
{
  id v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100029E30();
  }

  [(INDaemon *)self _validateRegistrationStateIfFirstLaunch];
}

- (void)_validateRegistrationStateIfFirstLaunch
{
  v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100029ECC();
  }

  if ([(INDaemon *)self _isFirstLaunchAfterBoot])
  {
    id v14 = [(ACAccountStore *)self->_accountStore aa_appleAccounts];
    if (![v14 count])
    {
      if (+[LoggedOutPushCache wasDeviceRegistered])
      {
        [(INDaemon *)self registerForPushNotificationsWithAccount:0 reason:5 completion:&stru_1000414F8];
      }
      else
      {
        uint64_t v5 = _INLogSystem();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          sub_100029E64();
        }
      }
    }
    if (+[INRegistrationDigestCache isAvailable])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      obj = v14;
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v20;
        do
        {
          id v8 = 0;
          do
          {
            if (*(void *)v20 != v7) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v8);
            id v10 = self;
            objc_sync_enter(v10);
            id v11 = objc_msgSend(v9, "aa_altDSID");
            if (v11)
            {
              dispatch_time_t v12 = [(INDaemon *)v10 accountsToReconsiderAfterReboot];
              [v12 addObject:v11];
            }
            objc_sync_exit(v10);

            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_1000129DC;
            v18[3] = &unk_100041520;
            v18[4] = v9;
            [(INDaemon *)v10 registerForPushNotificationsWithAccount:v9 reason:5 completion:v18];
            id v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v6);
      }
      id v13 = obj;
    }
    else
    {
      id v13 = _INLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "INRegistrationDigestCache is not available. Skipping FLAB registration validation!", buf, 2u);
      }
    }

    id v4 = v14;
  }
  else
  {
    uint64_t v3 = _INLogSystem();
    id v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      sub_100029E98();
      id v4 = v3;
    }
  }
}

- (BOOL)_isFirstLaunchAfterBoot
{
  BOOL v2 = [(INDaemon *)self _isFirstLaunchAfterBootiOS];
  uint64_t v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 136315394;
    uint64_t v7 = "-[INDaemon _isFirstLaunchAfterBoot]";
    __int16 v8 = 2112;
    CFStringRef v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  return v2;
}

- (BOOL)_isFirstLaunchAfterBootiOS
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  if (v2->_hasCheckedForFirstLaunch) {
    goto LABEL_4;
  }
  uint64_t v3 = sem_open("ind.boot_check", 0);
  v2->_hasCheckedForFirstLaunch = 1;
  if (v3 != (sem_t *)-1)
  {
    sem_close(v3);
LABEL_4:
    BOOL v4 = 0;
    goto LABEL_5;
  }
  int v6 = sem_open("ind.boot_check", 512, 256, 0);
  if (v6 == (sem_t *)-1)
  {
    uint64_t v7 = _INLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = __error();
      CFStringRef v9 = strerror(*v8);
      *(_DWORD *)buf = 136315394;
      id v11 = "ind.boot_check";
      __int16 v12 = 2080;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to create FLAB semaphore %s: %s", buf, 0x16u);
    }
  }
  else
  {
    sem_close(v6);
  }
  BOOL v4 = 1;
LABEL_5:
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)_isFirstLaunchAfterBootMacOS
{
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  BOOL v4 = [v3 stringForKey:@"com.apple.iCloudNotification.sessionUUID"];

  uint64_t v5 = [(INDaemon *)self _currentBootSessionUUID];
  int v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    __int16 v12 = v4;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Saved session UUID: %@, current session UUID: %@", (uint8_t *)&v11, 0x16u);
  }

  unsigned __int8 v7 = [v4 isEqualToString:v5];
  if ((v7 & 1) == 0)
  {
    __int16 v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setObject:v5 forKey:@"com.apple.iCloudNotification.sessionUUID"];

    CFStringRef v9 = _INLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      __int16 v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updated saved session UUID to: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return v7 ^ 1;
}

- (id)_currentBootSessionUUID
{
  size_t size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  BOOL v2 = malloc_type_malloc(size, 0x8C60CB2AuLL);
  sysctlbyname("kern.bootsessionuuid", v2, &size, 0, 0);
  uint64_t v3 = +[NSString stringWithUTF8String:v2];
  free(v2);
  return v3;
}

- (void)_handleOSEligibilityChange
{
  BOOL v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received os_eligibility change. Revalidating CFU.", v3, 2u);
  }

  +[CSFFeatureManager revalidateCFU];
}

- (void)_handleGMSAvailabilityChange
{
  BOOL v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received GMS Availability change. Revalidating CFU.", v3, 2u);
  }

  +[CSFFeatureManager revalidateCFU];
}

- (void)_handleModelCatalogChange
{
  BOOL v2 = _INLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Handling model catalog change notification.", v3, 2u);
  }

  +[CSFFeatureManager postCFUIfEligible];
}

- (void)_performHeartbeatRegistration
{
  uint64_t v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Thump thump!", buf, 2u);
  }

  BOOL v4 = [(ACAccountStore *)self->_accountStore aa_appleAccounts];
  id v33 = objc_alloc_init((Class)NSMutableArray);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v6)
  {
    id v7 = v6;
    v31 = self;
    __int16 v8 = 0;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        __int16 v12 = objc_msgSend(v11, "in_registrationExpirationDate");
        if (v12)
        {
          __int16 v13 = v8;
          id v14 = +[NSDate date];
          id v15 = [v12 compare:v14];

          if (v15 == (id)1)
          {
            __int16 v8 = v13;
            if (!v13 || [v13 compare:v12] == (id)1)
            {
              id v16 = _INLogSystem();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v12;
                _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Updating soonest expiration date to %@", buf, 0xCu);
              }

              id v17 = v12;
              __int16 v8 = v17;
            }
          }
          else
          {
            long long v19 = _INLogSystem();
            __int16 v8 = v13;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v11;
              _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Adding account %@ to expired registration list.", buf, 0xCu);
            }

            [v33 addObject:v11];
          }
        }
        else
        {
          dispatch_semaphore_t v18 = _INLogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v11;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "No registration expiration date found for account %@.", buf, 0xCu);
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v7);

    self = v31;
    if (v8) {
      [(INActivity *)v31->_hearbeatActivity ensureNextActivityWillOccurBeforeDate:v8];
    }
  }
  else
  {

    __int16 v8 = 0;
  }
  if ([(INActivity *)self->_hearbeatActivity setActivityState:4])
  {
    v30 = v8;
    long long v20 = os_transaction_create();
    long long v21 = dispatch_group_create();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v33;
    id v22 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v39;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
          id v27 = _INLogSystem();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Forcing registration for account %@", buf, 0xCu);
          }

          dispatch_group_enter(v21);
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_100013638;
          v35[3] = &unk_100041418;
          v36 = v20;
          v37 = v21;
          [(INDaemon *)self registerForPushNotificationsWithAccount:v26 reason:0 completion:v35];
        }
        id v23 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v23);
    }

    v28 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013708;
    block[3] = &unk_100040EC8;
    block[4] = self;
    dispatch_group_notify(v21, v28, block);

    __int16 v8 = v30;
  }
  else
  {
    long long v20 = _INLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100029F00();
    }
  }

  v29 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];

  if (!v29) {
    [(INDaemon *)self _performLoggedOutHeartbeatRegistrationIfNeeded];
  }
}

- (void)_performLoggedOutHeartbeatRegistrationIfNeeded
{
  if (+[LoggedOutPushCache wasDeviceRegistered])
  {
    uint64_t v3 = +[LoggedOutPushCache expirationDate];
    [(INActivity *)self->_hearbeatActivity ensureNextActivityWillOccurBeforeDate:v3];
    if ([(INActivity *)self->_hearbeatActivity setActivityState:4])
    {
      BOOL v4 = (void *)os_transaction_create();
      id v5 = dispatch_group_create();
      id v6 = _INLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Forcing logged-out push registration for device", buf, 2u);
      }

      dispatch_group_enter(v5);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100013960;
      v12[3] = &unk_100041418;
      id v13 = v4;
      id v14 = v5;
      id v7 = v5;
      __int16 v8 = v4;
      [(INDaemon *)self registerForPushNotificationsWithAccount:0 reason:0 completion:v12];
      uint64_t v9 = dispatch_get_global_queue(21, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100013A30;
      block[3] = &unk_100040EC8;
      block[4] = self;
      dispatch_group_notify(v7, v9, block);
    }
    else
    {
      __int16 v8 = _INLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100029F00();
      }
    }
  }
  else
  {
    id v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No iCloud accounts found, and device wasn't registered for logged-out push, so there's nothing to do.", buf, 2u);
    }

    [(INDaemon *)self _stopHeartbeat];
  }
}

- (void)registerAccountWithID:(id)a3 foriCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  id v10 = _INLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v8;
    __int16 v19 = 2080;
    long long v20 = "-[INDaemon registerAccountWithID:foriCloudNotificationsWithReason:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received registration request for account %@ over XPC. %s", (uint8_t *)&v17, 0x16u);
  }

  if (v8
    && ([(ACAccountStore *)self->_accountStore accountWithIdentifier:v8],
        (int v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    __int16 v12 = v11;
    id v13 = [v11 accountType];
    id v14 = [v13 identifier];
    unsigned __int8 v15 = [v14 isEqualToString:ACAccountTypeIdentifierAppleAccount];

    if (v15)
    {
      [(INDaemon *)self registerForPushNotificationsWithAccount:v12 reason:a4 completion:v9];
    }
    else
    {
      id v16 = INCreateError();
      v9[2](v9, 0, v16);
    }
  }
  else
  {
    __int16 v12 = INCreateError();
    v9[2](v9, 0, v12);
  }
}

- (void)registerDeviceForLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = _INLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[INDaemon registerDeviceForLoggedOutiCloudNotificationsWithReason:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received logged-out push registration request over XPC. %s", (uint8_t *)&v8, 0xCu);
  }

  [(INDaemon *)self registerForPushNotificationsWithAccount:0 reason:a3 completion:v6];
}

- (void)unregisterAccountWithID:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = _INLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 2080;
    id v23 = "-[INDaemon unregisterAccountWithID:fromiCloudNotificationsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received unregistration request for account %@ over XPC. %s", buf, 0x16u);
  }

  if (!v6) {
    goto LABEL_9;
  }
  id v9 = [(ACAccountStore *)self->_accountStore accountWithIdentifier:v6];
  id v10 = _INLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100029FD0();
  }

  if (v9)
  {
    int v11 = [v9 accountType];
    __int16 v12 = [v11 identifier];
    unsigned __int8 v13 = [v12 isEqualToString:ACAccountTypeIdentifierAppleAccount];

    if (v13)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100013FD4;
      v17[3] = &unk_100041440;
      v17[4] = self;
      id v18 = v9;
      id v19 = v7;
      id v9 = v9;
      [(INDaemon *)self _unregisterAccount:v9 fromiCloudNotificationsWithCompletion:v17];
    }
    else
    {
      unsigned __int8 v15 = _INLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100029F68();
      }

      id v16 = INCreateError();
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
    }
  }
  else
  {
LABEL_9:
    id v14 = _INLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100029F34();
    }

    INCreateError();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

- (void)unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = _INLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v12 = "-[INDaemon unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received logged-out push unregistration request over XPC. %s", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000141E4;
  v9[3] = &unk_100041590;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(INDaemon *)self _unregisterAccount:0 fromiCloudNotificationsWithReason:a3 completion:v9];
}

- (void)teardownOffersForAccount:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _INLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2080;
    __int16 v12 = "-[INDaemon teardownOffersForAccount:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received teardown offers request for account %@ over XPC. %s", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v8 teardownOffersForAccount:v5 completion:v6];
}

- (void)clearAllRegistrationDigestsWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002A038();
  }

  id v6 = [(ACAccountStore *)self->_accountStore aa_appleAccounts];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (!v7) {
    goto LABEL_14;
  }
  id v8 = v7;
  id v16 = v4;
  id v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    __int16 v11 = 0;
    __int16 v12 = v9;
    do
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v11);
      id v14 = _INLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing registration digest for account: %@", buf, 0xCu);
      }

      registrationDigestCache = self->_registrationDigestCache;
      id v17 = v12;
      [(INRegistrationDigestCache *)registrationDigestCache removeRegistrationDigestForAccount:v13 withError:&v17];
      id v9 = v17;

      __int16 v11 = (char *)v11 + 1;
      __int16 v12 = v9;
    }
    while (v8 != v11);
    id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  }
  while (v8);
  BOOL v4 = v16;
  if (v9)
  {
    ((void (**)(id, uint64_t, id))v16)[2](v16, 0, v9);
  }
  else
  {
LABEL_14:
    v4[2](v4, 1, 0);
  }
}

- (void)diagnosticReportWithCompletion:(id)a3
{
  __int16 v11 = (void (**)(id, id, void))a3;
  id v4 = objc_alloc_init((Class)INDiagnosticReport);
  [v4 setDisabled:0];
  [v4 setPushEnvironment:self->_activeAPSEnvironment];
  id v5 = [(APSConnection *)self->_apsConnection publicToken];
  id v6 = [v5 description];
  [v4 setPushToken:v6];

  id v7 = [(APSConnection *)self->_apsConnection enabledTopics];
  [v4 setPushTopics:v7];

  id v8 = +[INManagedDefaults sharedInstance];
  id v9 = [v8 valueForManagedDefault:INNextHeartbeatDateKey];

  if (v9)
  {
    [v9 doubleValue];
    uint64_t v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v4 setNextHeartbeatDate:v10];
  }
  v11[2](v11, v4, 0);
}

- (void)iCloudServerOfferForAccountWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  id v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Subclass must override if they support freshmint.", v8, 2u);
  }

  id v7 = INCreateError();
  v5[2](v5, 0, v7);
}

- (void)updateOfferForAccountWithID:(id)a3 offerId:(id)a4 buttonId:(id)a5 info:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, void *))a7;
  id v17 = _INLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10002A06C();
  }

  if (v12
    && ([(INDaemon *)self accountStore],
        long long v18 = objc_claimAutoreleasedReturnValue(),
        [v18 accountWithIdentifier:v12],
        long long v19 = objc_claimAutoreleasedReturnValue(),
        v18,
        v19))
  {
    long long v20 = [v19 accountType];
    long long v21 = [v20 identifier];
    unsigned __int8 v22 = [v21 isEqualToString:ACAccountTypeIdentifierAppleAccount];

    if (v22)
    {
      uint64_t v23 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
      [v23 updateOfferForAccount:v19 offerId:v13 buttonId:v14 info:v15 completion:v16];
    }
    else
    {
      uint64_t v23 = INCreateError();
      v16[2](v16, 0, v23);
    }
  }
  else
  {
    long long v19 = INCreateError();
    v16[2](v16, 0, v19);
  }
}

- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Subclass must override if they support freshmint.", v7, 2u);
  }

  id v6 = INCreateError();
  v4[2](v4, 0, v6);
}

- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Subclass must override if they support freshmint.", v7, 2u);
  }

  id v6 = INCreateError();
  v4[2](v4, 0, v6);
}

- (void)remoteFreshmintFlowCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  id v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Subclass must override if they support freshmint.", v5, 2u);
  }
}

- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3
{
  uint64_t v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Subclass must override if they support freshmint.", v4, 2u);
  }
}

- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4
{
  id v4 = (void (**)(id, void))a4;
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Subclass must override if they support freshmint.", v6, 2u);
  }

  v4[2](v4, 0);
}

- (void)renewCredentialsWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t, void))a3;
  id v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Subclass must override if they support freshmint.", v5, 2u);
  }

  v3[2](v3, 2, 0);
}

- (void)fetchStorageSummaryForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v6];
  if (v8)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = sub_100014E20;
    long long v19 = sub_100014E30;
    long long v20 = [[INCloudNetworkController alloc] initWithAccount:v8];
    id v9 = (void *)v16[5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100014E38;
    v12[3] = &unk_1000415B8;
    id v13 = v7;
    id v14 = &v15;
    [v9 cloudStorageSummary:v12];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    uint64_t v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002A0A0();
    }

    __int16 v11 = INCreateError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)fetchStorageAppsForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v6];
  if (v8)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = sub_100014E20;
    long long v19 = sub_100014E30;
    long long v20 = [[INCloudNetworkController alloc] initWithAccount:v8];
    id v9 = (void *)v16[5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000150B0;
    v12[3] = &unk_1000415E0;
    id v13 = v7;
    id v14 = &v15;
    [v9 cloudStorageApps:v12];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    uint64_t v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002A0A0();
    }

    __int16 v11 = INCreateError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)fetchStorageByApp:(id)a3 forAltDSID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v9];
  if (v11)
  {
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    long long v21 = sub_100014E20;
    unsigned __int8 v22 = sub_100014E30;
    uint64_t v23 = [[INCloudNetworkController alloc] initWithAccount:v11];
    id v12 = (void *)v19[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    id v15[2] = sub_10001533C;
    v15[3] = &unk_100041608;
    id v16 = v10;
    uint64_t v17 = &v18;
    [v12 appCloudStorageForBundleId:v8 completion:v15];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002A0A0();
    }

    id v14 = INCreateError();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)fetchBackupInfoForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v6];
  if (v8)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = sub_100014E20;
    long long v19 = sub_100014E30;
    uint64_t v20 = [[INCloudNetworkController alloc] initWithAccount:v8];
    id v9 = (void *)v16[5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000155B4;
    v12[3] = &unk_100041630;
    id v13 = v7;
    id v14 = &v15;
    [v9 fetchBackupInfoWithCompletion:v12];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002A0A0();
    }

    __int16 v11 = INCreateError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)sendTipDisplayedNetworkRequestForAltDSID:(id)a3 tip:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v8];
  if (v11)
  {
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    long long v21 = sub_100014E20;
    unsigned __int8 v22 = sub_100014E30;
    uint64_t v23 = [[INCloudNetworkController alloc] initWithAccount:v11];
    id v12 = (void *)v19[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    id v15[2] = sub_10001583C;
    v15[3] = &unk_100041658;
    id v16 = v10;
    uint64_t v17 = &v18;
    [v12 displayedNetworkRequestForTip:v9 completion:v15];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002A2A8();
    }

    id v14 = INCreateError();
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)sendTipDismissedNetworkRequestForAltDSID:(id)a3 tip:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v8];
  if (v11)
  {
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    long long v21 = sub_100014E20;
    unsigned __int8 v22 = sub_100014E30;
    uint64_t v23 = [[INCloudNetworkController alloc] initWithAccount:v11];
    id v12 = (void *)v19[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    id v15[2] = sub_100015AA0;
    v15[3] = &unk_100041658;
    id v16 = v10;
    uint64_t v17 = &v18;
    [v12 dismissedNetworkRequestForTip:v9 completion:v15];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002A378();
    }

    id v14 = INCreateError();
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)fetchAppsSyncingToiCloudDriveForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v6];
  if (v8)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = sub_100014E20;
    long long v19 = sub_100014E30;
    uint64_t v20 = [[INCloudNetworkController alloc] initWithAccount:v8];
    id v9 = (void *)v16[5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100015CF4;
    v12[3] = &unk_100041680;
    id v13 = v7;
    id v14 = &v15;
    [v9 fetchAppsSyncingToDrive:v12];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002A448();
    }

    __int16 v11 = INCreateError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (id)accountPushNotificationHandlerForEventType:(id)a3
{
  uint64_t v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10002A518();
  }

  return 0;
}

- (id)familyPushNotificationHandlerForEventType:(id)a3
{
  uint64_t v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10002A518();
  }

  return 0;
}

- (id)quotaPushNotificationHandlerForEventType:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_quotaPushNotificationHandlersByEventType objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = _INLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No quota push handler found for event type: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

- (void)handleICloudQuotaPush:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"category"];

  unsigned int v6 = [v5 isEqualToString:@"cloudsubscriptionfeatures"];
  id v7 = _INLogSystem();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v3 userInfo];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling CloudSubscriptionFeatures plan change notification: %@", buf, 0xCu);
    }
    id v10 = [v3 userInfo];
    +[CSFFeatureManager processPushNotificationDictionary:v10];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002A54C(v3);
    }

    __int16 v11 = (void *)os_transaction_create();
    id v12 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
    id v13 = [v3 userInfo];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = nullsub_2;
    v14[3] = &unk_100040EC8;
    id v15 = v11;
    id v10 = v11;
    [v12 processPushNotificationDictionary:v13 completion:v14];
  }
}

- (id)pushToken
{
  return [(APSConnection *)self->_apsConnection publicToken];
}

- (void)_initiateAPSConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  aaSharedRemoteServer = self->_aaSharedRemoteServer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000161D8;
  v7[3] = &unk_1000416A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AARemoteServer *)aaSharedRemoteServer configurationWithCompletion:v7];
}

- (void)_ensureDesiredAPSEnvironmentIsInUseWithCompletion:(id)a3
{
  id v4 = a3;
  aaSharedRemoteServer = self->_aaSharedRemoteServer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000164DC;
  v7[3] = &unk_1000416D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AARemoteServer *)aaSharedRemoteServer configurationWithCompletion:v7];
}

- (void)_validateEnabledTopics
{
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002A7E8();
  }

  id v4 = [(INDaemon *)self accountStore];
  id v5 = objc_msgSend(v4, "aa_appleAccounts");

  if ([v5 count])
  {
    [(INDaemon *)self _enablePushTopics];
  }
  else
  {
    id v6 = [(APSConnection *)self->_apsConnection enabledTopics];
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = _INLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We have stale APS enabled topics. Clearing...", v10, 2u);
      }

      [(INDaemon *)self _disablePushTopics];
    }
  }
  id v9 = _INLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002A7B4();
  }
}

- (void)_enablePushTopics
{
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002A81C(self);
  }

  id v4 = [(INDaemon *)self pushTopics];
  [(APSConnection *)self->_apsConnection _setEnabledTopics:v4];
}

- (void)_disablePushTopics
{
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received new public token from APS.", buf, 2u);
  }

  id v6 = [(ACAccountStore *)self->_accountStore aa_appleAccounts];
  if ([v6 count])
  {
    unsigned int v7 = +[INRegistrationDigestCache isAvailable];
    id v8 = _INLogSystem();
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10002A8A0();
      }

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = v6;
      id v10 = (char *)[v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v10)
      {
        __int16 v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            -[INDaemon registerForPushNotificationsWithAccount:reason:completion:](self, "registerForPushNotificationsWithAccount:reason:completion:");
          }
          __int16 v11 = (char *)[v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v11);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ignoring new push token from APS because the registration cache is unavailable right now.", buf, 2u);
    }
  }
  else if (+[LoggedOutPushCache wasDeviceRegistered])
  {
    [(INDaemon *)self registerForPushNotificationsWithAccount:0 reason:7 completion:&stru_1000416F0];
  }
  else
  {
    id v14 = _INLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Ignoring new push token from APS because we don't have an iCloud account right now, and logged-out pushes are not needed.", buf, 2u);
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [v5 topic];
    id v8 = [v5 userInfo];
    int v21 = 138412546;
    unsigned __int8 v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received new incoming message from APS. %@ - %@", (uint8_t *)&v21, 0x16u);
  }
  id v9 = [(APSConnection *)self->_apsConnection enabledTopics];
  id v10 = [v5 topic];
  unsigned __int8 v11 = [v9 containsObject:v10];

  if (v11)
  {
    uint64_t v12 = [v5 userInfo];
    id v13 = [v12 objectForKeyedSubscript:@"event"];

    id v14 = [v5 topic];
    unsigned int v15 = [v14 isEqualToString:@"com.me.setupservice"];

    if (v15)
    {
      long long v16 = [(INDaemon *)self accountPushNotificationHandlerForEventType:v13];
      long long v17 = v16;
    }
    else
    {
      long long v19 = [v5 topic];
      unsigned int v20 = [v19 isEqualToString:@"com.icloud.quota"];

      if (!v20)
      {
        long long v17 = _INLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10002A8D4(v5, v17);
        }
        goto LABEL_14;
      }
      long long v16 = [(INDaemon *)self quotaPushNotificationHandlerForEventType:v13];
      long long v17 = v16;
      if (!v16)
      {
        [(INDaemon *)self handleICloudQuotaPush:v5];
        goto LABEL_14;
      }
    }
    [v16 handleIncomingPushNotification:v5];
LABEL_14:

    goto LABEL_15;
  }
  id v13 = _INLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    long long v18 = [v5 topic];
    int v21 = 138412290;
    unsigned __int8 v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Ignoring push because the topic %@ is not enabled.", (uint8_t *)&v21, 0xCu);
  }
LABEL_15:
}

- (void)_stopHeartbeat
{
  [(INDaemon *)self _disablePushTopics];
  [(INActivity *)self->_hearbeatActivity stop];
  id v4 = +[INManagedDefaults sharedInstance];
  id v3 = [(INActivity *)self->_hearbeatActivity activityNextFireDateKey];
  [v4 setValue:0 forManagedDefault:v3];
}

- (void)displayDelayedOfferWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = _INLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002A9B8();
  }

  id v8 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v8 displayDelayedOfferWithContext:v5 completion:v6];

  id v9 = _INLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10002A984();
  }
}

- (void)_unsafe_performFreshmintRefreshHeartBeat
{
}

- (void)_unsafe_performFreshmintRefreshWithReason:(id)a3
{
  id v4 = a3;
  id v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Thump thump - Fresh!", v6, 2u);
  }

  [(INDaemon *)self _unsafe_icqReconsiderOffersWithReason:v4];
}

- (void)_unsafe_icqReconsiderOffers
{
}

- (void)_unsafe_icqReconsiderOffersWithReason:(id)a3
{
}

- (void)_unsafe_icqUpdateOfferForButtonId:(id)a3
{
  id v4 = a3;
  id v5 = [(INDaemon *)self accountStore];
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");

  unsigned int v7 = (void *)os_transaction_create();
  id v8 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = nullsub_3;
  v10[3] = &unk_100041520;
  id v11 = v7;
  id v9 = v7;
  [v8 updateOfferForAccount:v6 offerId:0 buttonId:v4 info:0 completion:v10];
}

- (void)startDelayedOfferFailsafeActivityWithDelaySecs:(int64_t)a3 completion:(id)a4
{
  id v4 = (void (**)(id, id))a4;
  INCreateErrorWithMessage();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);
}

- (void)stopDelayedOfferFailsafeActivityWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  INCreateErrorWithMessage();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4);
}

- (void)calculateExtraQuotaNeededToSyncForAccountWithID:(id)a3 isAccountFull:(BOOL)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Method %s not supported in this platform.", "-[INDaemon calculateExtraQuotaNeededToSyncForAccountWithID:isAccountFull:completion:]");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = INCreateErrorWithMessage();
  v5[2](v5, 0, v6);
}

- (void)fetchRecommendationsForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v6];
  if (v8)
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = sub_100014E20;
    long long v19 = sub_100014E30;
    unsigned int v20 = [[INCloudNetworkController alloc] initWithAccount:v8];
    id v9 = (void *)v16[5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000176E0;
    v12[3] = &unk_100041740;
    id v13 = v7;
    id v14 = &v15;
    [v9 fetchServerRecommendations:v12];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002AA54();
    }

    id v11 = INCreateError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)fetchRecommendationsRulesetForAltDSID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v6];
  if (v8)
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = sub_100014E20;
    long long v19 = sub_100014E30;
    unsigned int v20 = [[INCloudNetworkController alloc] initWithAccount:v8];
    id v9 = (void *)v16[5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100017958;
    v12[3] = &unk_100041768;
    id v13 = v7;
    id v14 = &v15;
    [v9 fetchRecommendationRules:v12];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v10 = _INLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002AB24();
    }

    id v11 = INCreateError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)fetchCompletedAndDismissedRecommendationsForAltDSID:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v8];
  if (v11)
  {
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    int v21 = sub_100014E20;
    unsigned __int8 v22 = sub_100014E30;
    __int16 v23 = [[INCloudNetworkController alloc] initWithAccount:v11];
    uint64_t v12 = (void *)v19[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    id v15[2] = sub_100017BE4;
    v15[3] = &unk_100041740;
    id v16 = v10;
    uint64_t v17 = &v18;
    [v12 fetchCompletedAndDismissedRecommendationsWithConfiguration:v9 completion:v15];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002ABF4();
    }

    id v14 = INCreateError();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)sendStatusForRecommendationsWithAltDSID:(id)a3 configuration:(id)a4 status:(id)a5 recommendationIdentifiers:(id)a6 storageRecovered:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v21 = objc_alloc_init((Class)NSMutableDictionary);
  [v21 setObject:v17 forKeyedSubscript:@"action"];

  [v21 setObject:v16 forKeyedSubscript:@"recommendationIdentifiers"];
  [v21 setObject:v15 forKeyedSubscript:@"storageRecovered"];

  id v20 = [v21 copy];
  [(INDaemon *)self sendStatusForRecommendationsWithAltDSID:v19 configuration:v18 params:v20 completion:v14];
}

- (void)sendStatusForRecommendationsWithAltDSID:(id)a3 configuration:(id)a4 params:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ACAccountStore *)self->_accountStore aa_appleAccountWithAltDSID:v10];
  id v15 = [v12 objectForKeyedSubscript:@"action"];
  if (v14)
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = sub_100014E20;
    id v27 = sub_100014E30;
    v28 = [[INCloudNetworkController alloc] initWithAccount:v14];
    id v16 = (void *)v24[5];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100017FE4;
    v19[3] = &unk_100041790;
    id v20 = v15;
    id v21 = v13;
    unsigned __int8 v22 = &v23;
    [v16 sendStatusForRecommendationWithConfiguration:v11 params:v12 completion:v19];

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v17 = _INLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002ACC4();
    }

    id v18 = INCreateError();
    (*((void (**)(id, void *))v13 + 2))(v13, v18);
  }
}

- (INActivity)freshmintActivity
{
  return self->_freshmintActivity;
}

- (void)setFreshmintActivity:(id)a3
{
}

- (id)freshmintObserverObject
{
  return self->_freshmintObserverObject;
}

- (void)setFreshmintObserverObject:(id)a3
{
}

- (NSMutableSet)accountsToReconsiderAfterReboot
{
  return self->_accountsToReconsiderAfterReboot;
}

- (void)setAccountsToReconsiderAfterReboot:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (INActivity)hearbeatActivity
{
  return self->_hearbeatActivity;
}

- (void)setHearbeatActivity:(id)a3
{
}

- (INRegistrar)registrar
{
  return self->_registrar;
}

- (void)setRegistrar:(id)a3
{
}

- (INRegistrationDigestCache)registrationDigestCache
{
  return self->_registrationDigestCache;
}

- (void)setRegistrationDigestCache:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (BOOL)hasCheckedForFirstLaunch
{
  return self->_hasCheckedForFirstLaunch;
}

- (void)setHasCheckedForFirstLaunch:(BOOL)a3
{
  self->_hasCheckedForFirstLaunch = a3;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (NSString)activeAPSEnvironment
{
  return self->_activeAPSEnvironment;
}

- (void)setActiveAPSEnvironment:(id)a3
{
}

- (NSArray)pushTopics
{
  return self->_pushTopics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushTopics, 0);
  objc_storeStrong((id *)&self->_activeAPSEnvironment, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_registrationDigestCache, 0);
  objc_storeStrong((id *)&self->_registrar, 0);
  objc_storeStrong((id *)&self->_hearbeatActivity, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accountsToReconsiderAfterReboot, 0);
  objc_storeStrong(&self->_freshmintObserverObject, 0);
  objc_storeStrong((id *)&self->_freshmintActivity, 0);
  objc_storeStrong((id *)&self->_aaSharedRemoteServer, 0);
  objc_storeStrong((id *)&self->_apsConnectionDelegateQueue, 0);
  objc_storeStrong((id *)&self->_quotaPushNotificationHandlersByEventType, 0);
}

@end