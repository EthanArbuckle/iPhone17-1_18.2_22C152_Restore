@interface TPSDaemon
- (BOOL)_appXPCConnectionContainsConnection:(id)a3;
- (BOOL)_assistantXPCConnectionContainsConnection:(id)a3;
- (BOOL)_discoverabilityXPCConnectionContainsConnection:(id)a3;
- (BOOL)canCheckForNewTipNotification:(id)a3;
- (BOOL)contentUpdatePostProcessingContentPackage:(id)a3 shouldUpdateNotification:(BOOL)a4 shouldDeferBlock:(id)a5 error:(id)a6;
- (BOOL)isContentIneligibleDueToViewOnOtherDevices:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)multiuserModeOn;
- (BOOL)setupCompleted;
- (BOOL)tipsAppInstalled;
- (BOOL)tipsInValidState;
- (NSMutableSet)appConnections;
- (NSMutableSet)assistantConnections;
- (NSMutableSet)discoverabilityConnections;
- (NSString)notificationTimingDarwinKey;
- (NSURLSession)tipsFeedURLSession;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)appConnectionQueue;
- (OS_dispatch_queue)assistantConnectionQueue;
- (OS_dispatch_queue)discoverabilityConnectionQueue;
- (TPSDaemon)init;
- (TPSDiscoverabilityController)discoverabilityController;
- (TPSFullTipUsageEventManager)usageEventManager;
- (TPSNotificationController)notificationController;
- (TPSTipStatusController)tipStatusController;
- (TPSTipsManager)tipsManager;
- (TPSWelcome)welcome;
- (id)_errorForHintIneligibleReason:(int64_t)a3 contentID:(id)a4;
- (id)analyticsExperiment;
- (id)bundleIDForIdentifier:(id)a3;
- (id)contextForIdentifier:(id)a3;
- (id)contextualInfoForIdentifier:(id)a3;
- (id)contextualInfoMap;
- (id)correlationIDForIdentifier:(id)a3;
- (id)currentExperimentWithDiscoverabilityController:(id)a3;
- (id)deliveryInfoVersion;
- (id)displayTypeForIdentifier:(id)a3;
- (id)experimentCampID;
- (id)experimentCampIDStringForCamp:(int64_t)a3;
- (id)experimentID;
- (id)miniTipMetadataForContent:(id)a3 bundleID:(id)a4 context:(id)a5;
- (id)shouldDeferBlockForXPCActivity:(id)a3;
- (id)tipStatusForIdentifier:(id)a3;
- (id)xpcActivitySetStateBlockForIdentifier:(id)a3;
- (int64_t)displayStatusCheckForHintIneligibleReasonWithContent:(id)a3 context:(id)a4 bypassExperiment:(BOOL)a5;
- (int64_t)statusCheckForHintIneligibleReasonWithContentID:(id)a3;
- (unint64_t)hintDisplayedCountForIdentifier:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)_addAppXPCConnection:(id)a3;
- (void)_addAssistantXPCConnection:(id)a3;
- (void)_addDiscoverabilityXPCConnection:(id)a3;
- (void)_removeAppXPCConnection:(id)a3;
- (void)_removeAssistantXPCConnection:(id)a3;
- (void)_removeDiscoverabilityXPCConnection:(id)a3;
- (void)appRemovalCleanupIfNeeded;
- (void)availableUserGuideIdentifiersWithReply:(id)a3;
- (void)cancelLegacyBackgroundTaskIfNeeded;
- (void)cancelQueryWithIdentifier:(id)a3;
- (void)contentForVariant:(id)a3 completionHandler:(id)a4;
- (void)contentViewedForIdentifier:(id)a3;
- (void)contentWithCompletionHandler:(id)a3;
- (void)contentWithContentIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)donateContentRetrieved:(id)a3 bundleID:(id)a4 context:(id)a5 error:(id)a6;
- (void)donateHintIneligibleReason:(int64_t)a3 contentID:(id)a4 bundleID:(id)a5 context:(id)a6;
- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4;
- (void)fetchDocumentWithIdentifier:(id)a3 reply:(id)a4;
- (void)findMatchingResultIdFromContexts:(id)a3 reply:(id)a4;
- (void)handleDeviceFirstUnlockNotification;
- (void)handleLanguageDidChangeNotification;
- (void)hintDismissedForIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6;
- (void)hintDisplayedForIdentifier:(id)a3 correlationID:(id)a4 context:(id)a5;
- (void)immediateNotificationForIdentifiers:(id)a3;
- (void)indexContentPackage:(id)a3;
- (void)initialize;
- (void)logAnalyticsEvent:(id)a3;
- (void)logAnalyticsEvents:(id)a3;
- (void)logDaemonActiveEventWithReason:(id)a3;
- (void)notificationController:(id)a3 markIdentifier:(id)a4 type:(int64_t)a5 ineligibleWithReason:(int64_t)a6;
- (void)notificationController:(id)a3 registrableEventReceivedForDocumentIdentifier:(id)a4;
- (void)performQuery:(id)a3 completion:(id)a4;
- (void)personalizationFailedForContentID:(id)a3 bundleID:(id)a4 context:(id)a5;
- (void)prepareForNotifications;
- (void)processAppInteractedByUser;
- (void)registerDarwinNotification:(id)a3;
- (void)registerForMobileKeyBagLockStatusNotify;
- (void)registerForNotificationTimingDarwinNotification;
- (void)registerImmediateNotifications;
- (void)registerXPCEventHandlers;
- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)reloadAppGroupDefaults;
- (void)removeNotificationForIdentifier:(id)a3;
- (void)resetAllDataIfNeeded;
- (void)resetBasicDefaults;
- (void)restartTrackingForContentIdentifiers:(id)a3;
- (void)setAppConnectionQueue:(id)a3;
- (void)setAppConnections:(id)a3;
- (void)setAssistantConnectionQueue:(id)a3;
- (void)setAssistantConnections:(id)a3;
- (void)setDiscoverabilityConnectionQueue:(id)a3;
- (void)setDiscoverabilityConnections:(id)a3;
- (void)setDiscoverabilityController:(id)a3;
- (void)setNotificationController:(id)a3;
- (void)setTipStatusController:(id)a3;
- (void)setTipsFeedURLSession:(id)a3;
- (void)setTipsManager:(id)a3;
- (void)setUsageEventManager:(id)a3;
- (void)setWelcome:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)showNewTipNotification;
- (void)tipsAppActive;
- (void)tipsManager:(id)a3 contextualEligibilityWithTipIdentifiers:(id)a4 tipsDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 experimentCampChangesToAll:(BOOL)a7;
- (void)tipsManager:(id)a3 eligibilityCompletedWithTipIdentifiers:(id)a4 contextualTipIdentifiers:(id)a5 tipsDeliveryInfoMap:(id)a6 deliveryInfoMap:(id)a7;
- (void)tipsManagerContentUpdateOverrideCompleted:(id)a3 contentPackage:(id)a4 shouldUpdateNotification:(BOOL)a5 error:(id)a6;
- (void)unregisterDarwinNotification:(id)a3;
- (void)unregisterImmediateNotifications;
- (void)updateContentFromOrigin:(BOOL)a3 contextualEligibility:(BOOL)a4 widgetEligibility:(BOOL)a5 notificationEligibility:(BOOL)a6 preferredNotificationIdentifiers:(id)a7 shouldDeferBlock:(id)a8 completionHandler:(id)a9;
- (void)updateContentWithActivity:(id)a3 identifier:(id)a4 preferredNotificationIdentifiers:(id)a5 multiuserModeOn:(BOOL)a6 contextualEligibility:(BOOL)a7 widgetEligibility:(BOOL)a8 notificationEligibility:(BOOL)a9;
- (void)updateNotificationStatus;
- (void)userGuideMapWithCompletionHandler:(id)a3;
- (void)validateAndPrepareContentForDisplay:(id)a3 bundleID:(id)a4 context:(id)a5 skipUsageCheck:(BOOL)a6 completionHandler:(id)a7;
- (void)welcome:(id)a3 contentAvailableRemotelyWithCompletionHandler:(id)a4;
- (void)welcome:(id)a3 notifyWelcomeDocument:(id)a4;
@end

@implementation TPSDaemon

- (void)logDaemonActiveEventWithReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = atomic_load(byte_1000261B0);
    if (v5)
    {
      v6 = +[TPSAnalyticsEventDaemonActive eventWithReason:v4 alreadyRunning:self->_alreadyRunning];
      [v6 log];

      self->_alreadyRunning = 1;
    }
  }

  _objc_release_x1();
}

- (void)contentWithCompletionHandler:(id)a3
{
  id v6 = a3;
  id v4 = [(TPSDaemon *)self tipsManager];
  uint64_t v5 = [v4 hasWidgetDocument] ^ 1;

  [(TPSDaemon *)self updateContentFromOrigin:0 contextualEligibility:0 widgetEligibility:v5 notificationEligibility:0 preferredNotificationIdentifiers:0 shouldDeferBlock:0 completionHandler:v6];
}

- (id)deliveryInfoVersion
{
  v3 = [(TPSDaemon *)self tipsManager];

  if (v3)
  {
    id v4 = [(TPSDaemon *)self tipsManager];
    uint64_t v5 = [v4 rulesVersion];
  }
  else
  {
    uint64_t v5 = +[TPSTipsManager rulesVersion];
  }

  return v5;
}

- (TPSTipsManager)tipsManager
{
  return self->_tipsManager;
}

- (void)reloadAppGroupDefaults
{
  v3 = +[TPSCommonDefines sharedInstance];
  id v4 = [v3 reloadAppGroupDefaults];

  uint64_t v5 = +[TPSCommonDefines sharedInstance];
  id v6 = [v5 tipStatusController];
  tipStatusController = self->_tipStatusController;
  self->_tipStatusController = v6;

  v9 = self->_tipStatusController;
  discoverabilityController = self->_discoverabilityController;

  [(TPSDiscoverabilityController *)discoverabilityController setTipStatusController:v9];
}

- (void)tipsAppActive
{
  v3 = +[TPSLogger daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100014914();
  }

  [(TPSDaemon *)self reloadAppGroupDefaults];
  [(TPSDaemon *)self processAppInteractedByUser];
  id v4 = [(TPSDaemon *)self notificationController];
  [v4 clearNotificationCache];

  uint64_t v5 = [(TPSDaemon *)self notificationController];
  [v5 clearNotificationCount];
}

- (TPSNotificationController)notificationController
{
  return self->_notificationController;
}

- (void)processAppInteractedByUser
{
  v3 = +[TPSLogger daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User launched the app", v9, 2u);
  }

  if ([(TPSWelcome *)self->_welcome stopWelcomeNotification])
  {
    id v4 = [(TPSDaemon *)self notificationController];
    uint64_t v5 = [v4 notificationCache];
    id v6 = [v5 collectionIdentifier];

    v7 = +[TPSCommonDefines sharedInstance];
    [v7 notifiedCollection:v6];
  }
  v8 = [(TPSDaemon *)self notificationTimingDarwinKey];
  [(TPSDaemon *)self unregisterDarwinNotification:v8];
}

- (BOOL)_appXPCConnectionContainsConnection:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14[0] = &v13;
  v14[1] = 0x2020000000;
  char v15 = 0;
  appConnectionQueue = self->_appConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005714;
  block[3] = &unk_100020CE0;
  v12 = &v13;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(appConnectionQueue, block);
  v7 = +[TPSLogger default];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10001482C((uint64_t)v14, v7);
  }

  char v8 = *(unsigned char *)(v14[0] + 24);
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)_addAppXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  appConnectionQueue = self->_appConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003D50;
  block[3] = &unk_100020D08;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(appConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)tipsAppInstalled
{
  v3 = +[TPSCommonDefines clientBundleIdentifier];
  unsigned __int8 v4 = +[TPSCommonDefines isAppValidWithBundleIdentifier:v3];

  return v4 & ![(TPSDaemon *)self multiuserModeOn];
}

- (BOOL)multiuserModeOn
{
  v2 = +[UMUserManager sharedManager];
  if ([v2 isMultiUser])
  {
    v3 = +[UMUserManager sharedManager];
    unsigned __int8 v4 = [v3 currentUser];
    BOOL v5 = [v4 userType] == (id)1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)tipsManager:(id)a3 eligibilityCompletedWithTipIdentifiers:(id)a4 contextualTipIdentifiers:(id)a5 tipsDeliveryInfoMap:(id)a6 deliveryInfoMap:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v16 = +[NSMutableSet setWithSet:a4];
  [v16 minusSet:v13];

  v14 = [(TPSDaemon *)self usageEventManager];
  char v15 = [v16 allObjects];
  [v14 updateContextualInfoForIdentifiers:v15 tipsDeliveryInfoMap:v12 deliveryInfoMap:v11];
}

- (void)unregisterDarwinNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(TPSDaemon *)self notificationTimingDarwinKey];
    unsigned int v6 = [v4 isEqualToString:v5];

    if (v6) {
      self->_notificationTimingDarwinNotificationRegistered = 0;
    }
    id v7 = v4;
    [v7 cStringUsingEncoding:4];
    xpc_set_event();
    id v8 = +[TPSLogger daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unregister for %@.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)updateContentFromOrigin:(BOOL)a3 contextualEligibility:(BOOL)a4 widgetEligibility:(BOOL)a5 notificationEligibility:(BOOL)a6 preferredNotificationIdentifiers:(id)a7 shouldDeferBlock:(id)a8 completionHandler:(id)a9
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v15 = a7;
  id v16 = (unsigned int (**)(void))a8;
  id v17 = a9;
  if (!v16 || !v16[2](v16))
  {
    v19 = [(TPSDaemon *)self notificationController];
    unsigned int v20 = [v19 isNotificationSettingValid] ^ 1;

    unsigned int v21 = [(TPSDaemon *)self tipsAppInstalled];
    unsigned int v22 = v21;
    if ((v20 & 1) != 0 || (v21 & 1) == 0)
    {
      if (v10)
      {
        v26 = +[TPSLogger daemon];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          unsigned int v31 = v20;
          __int16 v32 = 1024;
          unsigned int v33 = v22;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Skip checking notification. Notification disabled %d Tips app installed %d", buf, 0xEu);
        }
      }
      v25 = [(TPSDaemon *)self notificationController];
      [v25 clearNotificationCache];
    }
    else
    {
      if (!v10)
      {
LABEL_16:
        v27 = [(TPSDaemon *)self tipsManager];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100003BB4;
        v28[3] = &unk_100020C18;
        v28[4] = self;
        id v29 = v17;
        [v27 contentFromOrigin:v13 processTipKitContent:v12 contextualEligibility:v12 widgetEligibility:v11 notificationEligibility:v10 preferredNotificationIdentifiers:v15 shouldDeferBlock:v16 completionHandler:v28];

        goto LABEL_17;
      }
      v23 = [(TPSDaemon *)self welcome];
      unsigned int v24 = [v23 shouldShowWelcomeNotification];

      if (!v24)
      {
        BOOL v10 = 1;
        goto LABEL_16;
      }
      v25 = +[TPSLogger daemon];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Skip checking notification. Welcome notification in progress", buf, 2u);
      }
    }

    BOOL v10 = 0;
    goto LABEL_16;
  }
  v18 = +[NSError errorWithDomain:TPSTipsManagerErrorDomain code:4 userInfo:0];
  (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v18);

LABEL_17:
}

- (void)indexContentPackage:(id)a3
{
  id v3 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100005704;
  v16[4] = sub_1000094D4;
  id v17 = +[TPSOSTransaction transactionWithName:@"com.apple.tips.index-content-package"];
  id v4 = objc_alloc((Class)TPSAsyncBlockOperation);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_100004808;
  v14[3] = &unk_100020C68;
  id v5 = v3;
  id v15 = v5;
  id v6 = [v4 initWithAsyncBlock:v14];
  id v7 = objc_alloc((Class)TPSAsyncBlockOperation);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009598;
  v12[3] = &unk_100020C68;
  id v8 = v5;
  id v13 = v8;
  id v9 = [v7 initWithAsyncBlock:v12];
  id v10 = objc_alloc_init((Class)NSOperationQueue);
  [v10 setName:@"com.apple.tips.index-content-package"];
  [v10 setMaxConcurrentOperationCount:1];
  [v10 setSuspended:1];
  [v6 setName:@"indexTipsOperation"];
  [v10 addOperation:v6];
  [v9 setName:@"indexUserGuideOperation"];
  [v10 addOperation:v9];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009758;
  v11[3] = &unk_100020C90;
  v11[4] = v16;
  [v10 addBarrierBlock:v11];
  [v10 setSuspended:0];

  _Block_object_dispose(v16, 8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  unsigned __int8 v9 = atomic_load(byte_1000261B0);
  if (v9)
  {
    unsigned int v31 = [v7 valueForEntitlement:@"com.apple.tipsd.access"];
    v30 = [v8 valueForEntitlement:@"com.apple.tipsd.tips-app-access"];
    BOOL v11 = [v8 valueForEntitlement:@"com.apple.private.tipsd.discoverability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v12 = [v31 BOOLValue];
    }
    else {
      unsigned int v12 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v13 = [v30 BOOLValue];
    }
    else {
      unsigned int v13 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v14 = [v11 BOOLValue];
    }
    else {
      unsigned int v14 = 0;
    }
    id v15 = [v8 serviceName];
    unsigned int v16 = [v15 isEqualToString:@"com.apple.tipsd.assistant"];

    id v17 = +[TPSLogger daemon];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v44 = v8;
      __int16 v45 = 1024;
      unsigned int v46 = v12;
      __int16 v47 = 1024;
      unsigned int v48 = v13;
      __int16 v49 = 1024;
      unsigned int v50 = v14;
      __int16 v51 = 1024;
      unsigned int v52 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "New connection coming in: %@, standardAccess %d, appAccess %d, discoverability access %d, device expert access %d", buf, 0x24u);
    }

    if (v16)
    {
      v18 = [v8 valueForEntitlement:@"com.apple.private.tipsd.assistant"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 BOOLValue])
      {
        if ([(TPSDaemon *)self _assistantXPCConnectionContainsConnection:v8])
        {
          id v19 = 0;
        }
        else
        {
          v25 = +[NSXPCInterface assistantSupportInterface];
          [v8 setExportedInterface:v25];

          [v8 setExportedObject:self];
          id v19 = TPSAnalyticsDaemonActiveReasonAssistantConnection;
          [(TPSDaemon *)self _addAssistantXPCConnection:v8];
          objc_initWeak(&location, self);
          objc_initWeak(&from, v8);
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_10000AB3C;
          v38[3] = &unk_100020D30;
          objc_copyWeak(&v39, &location);
          objc_copyWeak(&v40, &from);
          [v8 setInvalidationHandler:v38];
          v26 = +[TPSLogger daemon];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v8;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Device Expert connection established. %@", buf, 0xCu);
          }

          objc_destroyWeak(&v40);
          objc_destroyWeak(&v39);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
        }

        goto LABEL_43;
      }

LABEL_32:
      [v8 setInterruptionHandler:&stru_100020D90];
      unsigned int v24 = +[TPSLogger daemon];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Connection denied %@.", buf, 0xCu);
      }

      BOOL v10 = 0;
      id v19 = 0;
      goto LABEL_46;
    }
    if ((v12 | v13) == 1)
    {
      if (![(TPSDaemon *)self tipsAppInstalled]) {
        goto LABEL_32;
      }
      unsigned int v20 = TPSXPCServerInterface();
      [v8 setExportedInterface:v20];

      [v8 setExportedObject:self];
      if (v13)
      {
        if (![(TPSDaemon *)self _appXPCConnectionContainsConnection:v8])
        {
          id v19 = TPSAnalyticsDaemonActiveReasonTipsAppConnection;
          [(TPSDaemon *)self _addAppXPCConnection:v8];
          objc_initWeak(&location, self);
          objc_initWeak(&from, v8);
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10000ABDC;
          v35[3] = &unk_100020D30;
          objc_copyWeak(&v36, &location);
          objc_copyWeak(&v37, &from);
          [v8 setInvalidationHandler:v35];
          unsigned int v21 = +[TPSLogger daemon];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v8;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "App connection established. %@", buf, 0xCu);
          }

          objc_destroyWeak(&v37);
          objc_destroyWeak(&v36);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
          goto LABEL_43;
        }
      }
      else
      {
        [v8 setInvalidationHandler:&stru_100020D70];
        v27 = +[TPSLogger daemon];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          sub_1000148E0();
        }
      }
    }
    else
    {
      if (!v14) {
        goto LABEL_32;
      }
      if (![(TPSDaemon *)self _discoverabilityXPCConnectionContainsConnection:v8])
      {
        unsigned int v22 = TPSMiniTipContentManagerServiceInterfaceServerInterface();
        [v8 setExportedInterface:v22];

        [v8 setExportedObject:self];
        id v19 = TPSAnalyticsDaemonActiveReasonTipKitConnection;
        [(TPSDaemon *)self _addDiscoverabilityXPCConnection:v8];
        objc_initWeak(&location, self);
        objc_initWeak(&from, v8);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10000ACEC;
        v32[3] = &unk_100020D30;
        objc_copyWeak(&v33, &location);
        objc_copyWeak(&v34, &from);
        [v8 setInvalidationHandler:v32];
        v23 = +[TPSLogger daemon];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v8;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Discoverability connection established. %@", buf, 0xCu);
        }

        objc_destroyWeak(&v34);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
        goto LABEL_43;
      }
    }
    id v19 = 0;
LABEL_43:
    [v8 setInterruptionHandler:&stru_100020D90];
    v28 = +[TPSLogger daemon];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "xpc connection resume", buf, 2u);
    }

    [v8 resume];
    BOOL v10 = 1;
LABEL_46:
    [(TPSDaemon *)self logDaemonActiveEventWithReason:v19];

    goto LABEL_47;
  }
  BOOL v10 = 0;
LABEL_47:

  return v10;
}

- (TPSFullTipUsageEventManager)usageEventManager
{
  return self->_usageEventManager;
}

- (NSString)notificationTimingDarwinKey
{
  return self->_notificationTimingDarwinKey;
}

- (NSMutableSet)appConnections
{
  return self->_appConnections;
}

- (TPSDaemon)init
{
  v41.receiver = self;
  v41.super_class = (Class)TPSDaemon;
  v2 = [(TPSDaemon *)&v41 init];
  if (v2)
  {
    +[TPSPersonaUtilities _adoptPersonaForContainerLookupIfNeeded];
    id v3 = +[TPSURLSessionHandler sharedInstance];
    [v3 setExcludeCachingDataTypes:0];

    id v4 = +[TPSURLSessionHandler sharedInstance];
    [v4 setDelegate:v2];
    id v5 = +[TPSURLSessionManager defaultManager];
    [v5 setDelegate:v4];

    id v6 = +[TPSURLSessionManager defaultManager];
    [v6 setDefaultSessionDelegate:v4];

    id v7 = (TPSAnalyticsDataProvider *)[objc_alloc((Class)TPSAnalyticsDataProvider) initWithDataSource:v2];
    analyticsDataProvider = v2->_analyticsDataProvider;
    v2->_analyticsDataProvider = v7;

    unsigned __int8 v9 = v2->_analyticsDataProvider;
    BOOL v10 = +[TPSAnalyticsEventController sharedInstance];
    [v10 setDataProvider:v9];

    if (+[TPSCommonDefines isInternalDevice])
    {
      BOOL v11 = +[TPSURLSessionACAuthContext defaultContext];
      id v12 = [v11 copy];

      [v12 setInteractivityMode:TPSURLSessionAuthInteractivitySilentOnly];
      id v13 = [objc_alloc((Class)TPSURLSessionACAuthHandler) initWithAuthenticationContext:v12];
      unsigned int v14 = +[TPSURLSessionManager defaultManager];
      [v14 setAuthenticationHandler:v13];
    }
    id v15 = +[TPSLogger daemon];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Tips Daemon Starting.", buf, 2u);
    }

    if (MKBDeviceFormattedForContentProtection())
    {
      atomic_store((int)MKBDeviceUnlockedSinceBoot() > 0, byte_1000261B0);
    }
    else
    {
      unsigned int v16 = +[TPSLogger daemon];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DeviceFormattedForContentProtection not needed", buf, 2u);
      }
    }
    uint64_t v17 = +[TPSNotificationController displayDarwinNotificationKey];
    notificationTimingDarwinKey = v2->_notificationTimingDarwinKey;
    v2->_notificationTimingDarwinKey = (NSString *)v17;

    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.tipsd.discoverabilityConnectionQueue", v19);
    discoverabilityConnectionQueue = v2->_discoverabilityConnectionQueue;
    v2->_discoverabilityConnectionQueue = (OS_dispatch_queue *)v20;

    unsigned int v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.tipsd.appConnectionQueue", v22);
    appConnectionQueue = v2->_appConnectionQueue;
    v2->_appConnectionQueue = (OS_dispatch_queue *)v23;

    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.tipsd.assistantConnectionQueue", v25);
    assistantConnectionQueue = v2->_assistantConnectionQueue;
    v2->_assistantConnectionQueue = (OS_dispatch_queue *)v26;

    uint64_t v28 = +[NSMutableSet set];
    discoverabilityConnections = v2->_discoverabilityConnections;
    v2->_discoverabilityConnections = (NSMutableSet *)v28;

    uint64_t v30 = +[NSMutableSet set];
    appConnections = v2->_appConnections;
    v2->_appConnections = (NSMutableSet *)v30;

    uint64_t v32 = +[NSMutableSet set];
    assistantConnections = v2->_assistantConnections;
    v2->_assistantConnections = (NSMutableSet *)v32;

    if ([(TPSDaemon *)v2 multiuserModeOn])
    {
      id v34 = +[TPSLogger daemon];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "EDU mode on", buf, 2u);
      }
    }
    else
    {
      unsigned __int8 v35 = atomic_load(byte_1000261B0);
      if (v35)
      {
        [(TPSDaemon *)v2 initialize];
      }
      else if ([(TPSDaemon *)v2 setupCompleted])
      {
        id v36 = +[TPSLogger daemon];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "User has not perform first unlock", buf, 2u);
        }

        [(TPSDaemon *)v2 registerForMobileKeyBagLockStatusNotify];
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006D38;
    block[3] = &unk_100020A70;
    id v39 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v2;
}

- (void)initialize
{
  if (!self->_initialized)
  {
    unsigned __int8 v2 = atomic_load(byte_1000261B0);
    if (v2)
    {
      self->_initialized = 1;
      [(TPSDaemon *)self resetAllDataIfNeeded];
      id v4 = +[TPSBluetoothChecker sharedInstance];
      id v5 = +[TPSCommonDefines sharedInstance];
      id v6 = [v5 tipStatusController];
      tipStatusController = self->_tipStatusController;
      self->_tipStatusController = v6;

      id v8 = (TPSTipsManager *)[objc_alloc((Class)TPSTipsManager) initWithTipStatusController:self->_tipStatusController];
      tipsManager = self->_tipsManager;
      self->_tipsManager = v8;

      [(TPSTipsManager *)self->_tipsManager setDelegate:self];
      BOOL v10 = (TPSDiscoverabilityController *)[objc_alloc((Class)TPSDiscoverabilityController) initWithTipStatusController:self->_tipStatusController];
      discoverabilityController = self->_discoverabilityController;
      self->_discoverabilityController = v10;

      [(TPSDiscoverabilityController *)self->_discoverabilityController setDelegate:self];
      id v12 = (TPSFullTipUsageEventManager *)objc_alloc_init((Class)TPSFullTipUsageEventManager);
      usageEventManager = self->_usageEventManager;
      self->_usageEventManager = v12;

      unsigned int v14 = +[TPSLogger daemon];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [(TPSTipStatusController *)self->_tipStatusController debugDescription];
        int v37 = 138412290;
        v38 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Tips status controller %@", (uint8_t *)&v37, 0xCu);
      }
      unsigned int v16 = +[TPSLogger daemon];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [(TPSDiscoverabilityController *)self->_discoverabilityController debugDescription];
        int v37 = 138412290;
        v38 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "discoverability controller %@", (uint8_t *)&v37, 0xCu);
      }
      v18 = [(TPSTipStatusController *)self->_tipStatusController tipStatusMap];
      if (![v18 count])
      {
        id v19 = objc_alloc((Class)TPSAnalyticsProcessingController);
        dispatch_queue_t v20 = [v18 allValues];
        unsigned int v21 = [(TPSDaemon *)self contextualInfoMap];
        unsigned int v22 = [(TPSDiscoverabilityController *)self->_discoverabilityController eventsHistoryController];
        dispatch_queue_t v23 = [v22 contextualEventsForIdentifiers];
        unsigned int v24 = [(TPSTipsManager *)self->_tipsManager experiment];
        id v25 = [v19 initWithAllTipStatus:v20 contextualInfoMap:v21 eventHistoryMap:v23 experiment:v24];

        [v25 resetAnalytics];
      }
      [(TPSDaemon *)self cancelLegacyBackgroundTaskIfNeeded];
      unsigned int v26 = [(TPSDaemon *)self tipsInValidState];
      v27 = +[TPSLogger daemon];
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v26)
      {
        if (v28)
        {
          LOWORD(v37) = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Tips app is in a valid state.", (uint8_t *)&v37, 2u);
        }

        id v29 = (TPSNotificationController *)objc_alloc_init((Class)TPSNotificationController);
        notificationController = self->_notificationController;
        self->_notificationController = v29;

        [(TPSNotificationController *)self->_notificationController setDelegate:self];
        [(TPSTipsManager *)self->_tipsManager setNotificationController:self->_notificationController];
        unsigned int v31 = [[TPSWelcome alloc] initWithDelegate:self tipsManager:self->_tipsManager notificationController:self->_notificationController];
        welcome = self->_welcome;
        self->_welcome = v31;

        [(TPSWelcome *)self->_welcome reconnectWelcomeIfNeeded:1];
        [(TPSDaemon *)self registerImmediateNotifications];
        id v33 = [(TPSDaemon *)self notificationTimingDarwinKey];

        if (v33)
        {
          id v34 = [(TPSDaemon *)self notificationController];
          unsigned __int8 v35 = [v34 notificationCache];

          id v36 = [(TPSDaemon *)self notificationTimingDarwinKey];
          if (v35) {
            [(TPSDaemon *)self registerDarwinNotification:v36];
          }
          else {
            [(TPSDaemon *)self unregisterDarwinNotification:v36];
          }
        }
        if ([(TPSDaemon *)self setupCompleted]) {
          [(TPSDaemon *)self unregisterDarwinNotification:BYSetupAssistantExitedDarwinNotification];
        }
        else {
          [(TPSDaemon *)self registerDarwinNotification:BYSetupAssistantExitedDarwinNotification];
        }
      }
      else
      {
        if (v28)
        {
          LOWORD(v37) = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Tips app is not in a valid state, skip registration for notifications.", (uint8_t *)&v37, 2u);
        }
      }
      [(TPSTipsManager *)self->_tipsManager updateContentIfOverrideImmediately:0];
      [(TPSDaemon *)self appRemovalCleanupIfNeeded];
    }
  }
}

- (void)registerForMobileKeyBagLockStatusNotify
{
  objc_initWeak(&location, self);
  unsigned __int8 v2 = atomic_load(byte_1000261B0);
  if ((v2 & 1) == 0)
  {
    int out_token = -1;
    id v3 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    id v4 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000072BC;
    handler[3] = &unk_100020A98;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

- (id)xpcActivitySetStateBlockForIdentifier:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007460;
  v6[3] = &unk_100020AC0;
  id v7 = a3;
  id v3 = v7;
  id v4 = objc_retainBlock(v6);

  return v4;
}

- (id)shouldDeferBlockForXPCActivity:(id)a3
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007708;
  v6[3] = &unk_100020AE8;
  id v7 = a3;
  id v8 = v9;
  id v3 = v7;
  id v4 = objc_retainBlock(v6);

  _Block_object_dispose(v9, 8);

  return v4;
}

- (void)updateContentWithActivity:(id)a3 identifier:(id)a4 preferredNotificationIdentifiers:(id)a5 multiuserModeOn:(BOOL)a6 contextualEligibility:(BOOL)a7 widgetEligibility:(BOOL)a8 notificationEligibility:(BOOL)a9
{
  BOOL v24 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = +[TPSLogger daemon];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Update content with event %@.", buf, 0xCu);
  }

  v18 = [(TPSDaemon *)self shouldDeferBlockForXPCActivity:v14];
  id v19 = [(TPSDaemon *)self xpcActivitySetStateBlockForIdentifier:v15];
  int v20 = v18[2](v18);
  if (((v20 | v10) & 1) != 0
    || (unsigned __int8 v21 = atomic_load(byte_1000261B0), (v21 & 1) == 0)
    || ![(TPSDaemon *)self setupCompleted])
  {
    unsigned int v22 = +[TPSLogger daemon];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v23 = atomic_load(byte_1000261B0);
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)uint64_t v32 = v20;
      *(_WORD *)&void v32[4] = 1024;
      *(_DWORD *)&v32[6] = v10;
      __int16 v33 = 1024;
      int v34 = v23 & 1;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Update content skipped. deferBlock %d, multiuserModeOn %d, deviceUnlockedSinceBoot %d", buf, 0x14u);
    }

    goto LABEL_11;
  }
  if (!((unsigned int (*)(void, id, uint64_t))v19[2])(v19, v14, 4))
  {
LABEL_11:
    ((void (**)(void, id, uint64_t))v19)[2](v19, v14, 5);
    goto LABEL_12;
  }
  objc_initWeak((id *)buf, self);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100007A70;
  v25[3] = &unk_100020B10;
  objc_copyWeak(&v29, (id *)buf);
  BOOL v30 = a9;
  v27 = v18;
  BOOL v28 = v19;
  id v26 = v14;
  [(TPSDaemon *)self updateContentFromOrigin:1 contextualEligibility:v9 widgetEligibility:v24 notificationEligibility:a9 preferredNotificationIdentifiers:v16 shouldDeferBlock:v27 completionHandler:v25];

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
LABEL_12:
}

- (BOOL)contentUpdatePostProcessingContentPackage:(id)a3 shouldUpdateNotification:(BOOL)a4 shouldDeferBlock:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  BOOL v11 = (uint64_t (**)(void))a5;
  id v12 = a6;
  id v13 = [v12 domain];
  if ([v13 isEqualToString:TPSTipsManagerErrorDomain]) {
    BOOL v14 = [v12 code] == (id)4;
  }
  else {
    BOOL v14 = 0;
  }

  if (v14 || !v8 || ([(TPSDaemon *)self updateNotificationStatus], !v11))
  {
    if (!v14) {
      goto LABEL_8;
    }
LABEL_12:
    BOOL v19 = 1;
    goto LABEL_13;
  }
  if (v11[2](v11)) {
    goto LABEL_12;
  }
LABEL_8:
  id v15 = [(TPSDaemon *)self welcome];
  unsigned __int8 v16 = [v15 isReminderCompleted];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = [(TPSDaemon *)self tipsManager];
    id v18 = [v17 welcomeDocumentFromContentPackage:v10];
  }
  BOOL v19 = 0;
LABEL_13:

  return v19;
}

- (void)registerXPCEventHandlers
{
  unsigned __int8 v3 = [(TPSDaemon *)self multiuserModeOn];
  objc_initWeak(&location, self);
  id v4 = (const char *)[@"com.apple.tipsd.postInstall-utility" UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100007FA8;
  handler[3] = &unk_100020B38;
  objc_copyWeak(&v22, &location);
  void handler[4] = self;
  unsigned __int8 v23 = v3;
  xpc_activity_register(v4, XPC_ACTIVITY_CHECK_IN, handler);
  id v5 = (const char *)[@"com.apple.tipsd.update-content" UTF8String];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100008194;
  v18[3] = &unk_100020B60;
  objc_copyWeak(&v19, &location);
  unsigned __int8 v20 = v3;
  xpc_activity_register(v5, XPC_ACTIVITY_CHECK_IN, v18);
  id v6 = (const char *)[@"com.apple.tipsd.analytics-maintenance" UTF8String];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008240;
  v15[3] = &unk_100020B60;
  objc_copyWeak(&v16, &location);
  unsigned __int8 v17 = v3;
  xpc_activity_register(v6, XPC_ACTIVITY_CHECK_IN, v15);
  id v7 = (const char *)kNSURLSessionLaunchOnDemandNotificationName;
  id v8 = &_dispatch_main_q;
  xpc_set_event_stream_handler(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_100020BA0);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000084D0;
  v12[3] = &unk_100020B60;
  objc_copyWeak(&v13, &location);
  unsigned __int8 v14 = v3;
  xpc_set_event_stream_handler("com.apple.coreduetcontext.client_event_stream", (dispatch_queue_t)&_dispatch_main_q, v12);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008684;
  void v9[3] = &unk_100020B38;
  objc_copyWeak(&v10, &location);
  unsigned __int8 v11 = v3;
  v9[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (BOOL)tipsInValidState
{
  if (![(TPSDaemon *)self setupCompleted])
  {
    unsigned __int8 v3 = +[TPSCommonDefines clientBundleIdentifier];
    unsigned int v4 = +[TPSCommonDefines isAppRestrictedWithBundleIdentifier:v3];

    if (!v4) {
      return 1;
    }
  }

  return [(TPSDaemon *)self tipsAppInstalled];
}

- (BOOL)setupCompleted
{
  int HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun();
  int v3 = BYSetupAssistantNeedsToRun();
  unsigned int v4 = +[TPSLogger daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = HasCompletedInitialRun;
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy setup completed: %d, buddy needs to run %d", (uint8_t *)v6, 0xEu);
  }

  return HasCompletedInitialRun & (v3 ^ 1);
}

- (void)registerForNotificationTimingDarwinNotification
{
  if (self->_notificationTimingDarwinNotificationRegistered)
  {
    unsigned __int8 v2 = +[TPSLogger daemon];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Already registered for lock screen.", buf, 2u);
    }
  }
  else
  {
    self->_notificationTimingDarwinNotificationRegistered = 1;
    id v4 = [(TPSDaemon *)self notificationTimingDarwinKey];
    [(TPSDaemon *)self registerDarwinNotification:v4];
  }
}

- (void)registerDarwinNotification:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = (const char *)[v5 cStringUsingEncoding:4];
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "Notification", v6);
    xpc_set_event();
    int v8 = +[TPSLogger daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Register for %@.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)registerImmediateNotifications
{
  if ((+[TPSTipsManager needImmediateNotificationForType:](TPSTipsManager, "needImmediateNotificationForType:", 0) & 1) != 0|| +[TPSTipsManager needImmediateNotificationForType:1])
  {
    [(TPSDaemon *)self registerDarwinNotification:@"com.apple.bluetooth.pairing"];
  }
  else
  {
    [(TPSDaemon *)self unregisterDarwinNotification:@"com.apple.bluetooth.pairing"];
  }
  TPSHMManagerSpeakersConfiguredChangedNotificationString();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (+[TPSTipsManager needImmediateNotificationForType:2])[(TPSDaemon *)self registerDarwinNotification:v3]; {
  else
  }
    [(TPSDaemon *)self unregisterDarwinNotification:v3];
}

- (void)unregisterImmediateNotifications
{
  TPSHMManagerSpeakersConfiguredChangedNotificationString();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(TPSDaemon *)self unregisterDarwinNotification:v3];
  [(TPSDaemon *)self unregisterDarwinNotification:@"com.apple.bluetooth.pairing"];
}

- (void)prepareForNotifications
{
  id v3 = [(TPSDaemon *)self notificationTimingDarwinKey];

  if (v3)
  {
    [(TPSDaemon *)self registerForNotificationTimingDarwinNotification];
  }
  else
  {
    [(TPSDaemon *)self showNewTipNotification];
  }
}

- (void)updateNotificationStatus
{
  id v3 = [(TPSDaemon *)self notificationController];
  id v4 = [v3 notificationCache];

  if (v4)
  {
    if (+[TPSNotificationController supportsRemoteIcon])
    {
      id v5 = [(TPSDaemon *)self notificationController];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      _DWORD v6[2] = sub_100008FE8;
      v6[3] = &unk_100020BC8;
      id v7 = v4;
      int v8 = self;
      [v5 fetchNotificationAssetIfNeededCompletionHandler:v6];
    }
    else
    {
      [(TPSDaemon *)self prepareForNotifications];
    }
  }
}

- (void)showNewTipNotification
{
  id v3 = +[TPSLogger daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Show new tip notification.", (uint8_t *)buf, 2u);
  }

  if ([(TPSDaemon *)self tipsAppInstalled])
  {
    objc_initWeak(buf, self);
    id v4 = [(TPSDaemon *)self notificationController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_10000923C;
    v6[3] = &unk_100020BF0;
    objc_copyWeak(&v7, buf);
    [v4 showNotificationWithCompletionHandler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
  else
  {
    id v5 = [(TPSDaemon *)self notificationController];
    [v5 clearNotificationCache];
  }
}

- (void)cancelLegacyBackgroundTaskIfNeeded
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  if (([v3 BOOLForKey:@"TPSDidCancelLegacyBackgroundTask"] & 1) == 0)
  {
    id v4 = +[TPSLogger daemon];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancelling legacy discretionary background task", v10, 2u);
    }

    id v5 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.apple.tipsd.checkNewTips"];
    id v6 = +[TPSCommonDefines clientBundleIdentifier];
    [v5 set_sourceApplicationBundleIdentifier:v6];

    [v5 setHTTPCookieStorage:0];
    [v5 setDiscretionary:1];
    id v7 = +[NSOperationQueue mainQueue];
    int v8 = +[NSURLSession sessionWithConfiguration:v5 delegate:self delegateQueue:v7];
    [(TPSDaemon *)self setTipsFeedURLSession:v8];

    int v9 = [(TPSDaemon *)self tipsFeedURLSession];
    [v9 invalidateAndCancel];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  uint64_t v9 = TPSAnalyticsDaemonActiveReasonContentCheck;
  id v10 = (void (**)(id, id))a6;
  [(TPSDaemon *)self logDaemonActiveEventWithReason:v9];
  unsigned __int8 v11 = +[TPSLogger daemon];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000145C8(v8, v11);
  }

  v10[2](v10, v8);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5 = a3;
  id v6 = [(TPSDaemon *)self tipsFeedURLSession];

  if (v6 == v5)
  {
    id v7 = +[TPSLogger daemon];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cleaned up legacy discretionary background task", v9, 2u);
    }

    id v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setBool:1 forKey:@"TPSDidCancelLegacyBackgroundTask"];
    [v8 synchronize];
    [(TPSDaemon *)self setTipsFeedURLSession:0];
  }
}

- (void)resetAllDataIfNeeded
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v25 = [v3 stringForKey:@"TPSLastMajorVersion"];
  id v4 = +[TPSCommonDefines sharedInstance];
  id v5 = [v4 majorVersion];

  unsigned int v6 = [v25 isEqualToString:v5];
  id v7 = +[TPSLogger daemon];
  int v8 = v6 ^ 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v6 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Should reset due to version change: %d", buf, 8u);
  }

  uint64_t v9 = (void *)MGCopyAnswer();
  id v10 = [v9 componentsSeparatedByString:@"."];
  if ((unint64_t)[v10 count] < 2)
  {
    id v12 = 0;
  }
  else
  {
    unsigned __int8 v11 = [v10 objectAtIndexedSubscript:1];
    id v12 = [v11 integerValue];
  }
  id v13 = +[TPSLogger daemon];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000147A8();
  }

  if ((unint64_t)[v10 count] < 2 || v12)
  {
    id v19 = +[TPSLogger daemon];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100014774();
    }

    [v3 removeObjectForKey:@"TPSNeedsResetOnMajorGM"];
  }
  else
  {
    unsigned int v14 = [v3 BOOLForKey:@"TPSNeedsResetOnMajorGM"];
    unsigned int v15 = +[TPSUserTypesValidation isBetaBuild];
    id v16 = +[TPSLogger daemon];
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15)
    {
      if (v17) {
        sub_100014690(v14, v16);
      }

      if ((v14 & 1) == 0)
      {
        *(void *)buf = 0;
        BOOL v28 = buf;
        uint64_t v29 = 0x2020000000;
        char v30 = 1;
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100009F60;
        v26[3] = &unk_100020CB8;
        v26[4] = buf;
        [v10 enumerateObjectsUsingBlock:v26];
        if (v28[24])
        {
          id v18 = +[TPSLogger daemon];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            sub_10001465C();
          }

          [v3 setBool:1 forKey:@"TPSNeedsResetOnMajorGM"];
        }
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
      if (v17) {
        sub_100014740();
      }

      if (v14)
      {
        BOOL v24 = +[TPSLogger daemon];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          sub_10001470C();
        }

        [v3 removeObjectForKey:@"TPSNeedsResetOnMajorGM"];
        int v8 = 1;
      }
    }
  }
  [v3 synchronize];
  unsigned __int8 v20 = +[TPSLogger daemon];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Should reset %d", buf, 8u);
  }

  if (v8)
  {
    [v3 setObject:v5 forKey:@"TPSLastMajorVersion"];
    [v3 synchronize];
    unsigned __int8 v21 = [(TPSDaemon *)self notificationTimingDarwinKey];
    [(TPSDaemon *)self unregisterDarwinNotification:v21];

    [(TPSDaemon *)self resetBasicDefaults];
    +[TPSWelcome resetWelcomeNotifications];
    +[TPSDataMigrator performMigrationIfNeeded];
    +[TPSTipsManager removeExperimentCache];
    +[TPSTipsManager removeWelcomeDocumentCache];
    +[TPSTipsManager removeWidgetUpdateDate];
    +[TPSNotificationController removeNotificationCache];
    +[TPSNotificationController removeAssetCacheDirectory];
    +[TPSDiscoverabilityController removeContextualInfoCache];
    id v22 = +[NSDate date];
    unsigned __int8 v23 = +[TPSCommonDefines sharedInstance];
    [v23 setLastMajorVersionUpdateDate:v22];
  }
  +[TPSDataMigrator revertTipStatusArchivalIfNeeded];
}

- (void)resetBasicDefaults
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObjectForKey:TPSWidgetShownDocuments];
  [v4 removeObjectForKey:@"TPSWidgetShownTips"];
  [v4 removeObjectForKey:@"TPSFeedLastModified"];
  [v4 removeObjectForKey:@"onPause"];
  [v4 removeObjectForKey:@"TPSPastCollectionIdentifiers"];
  [v4 removeObjectForKey:@"TPSPendingCollectionActivationForIdentifier"];
  [v4 removeObjectForKey:@"TPSWaitingToShowNewTipNotification"];
  [v4 removeObjectForKey:@"TPSPreferredLanguageForCurrentRequest"];
  [v4 removeObjectForKey:@"TPSNotificationsIgnoreCount"];
  [v4 removeObjectForKey:@"TPSFeedDoNotNotify"];
  [v4 removeObjectForKey:@"TPSPendingNotificationTip"];
  [v4 removeObjectForKey:@"TPSPendingCollectionActivationNotificationTips"];
  [v4 removeObjectForKey:@"TPSInvalidTargetedTipIDs"];
  [v4 removeObjectForKey:@"TPSNotificationQuietPeriodEndTime"];
  [v4 removeObjectForKey:@"TPSPendingNotifiedTipIDs"];
  [v4 removeObjectForKey:@"kTipsdNotifiedTipsIDs"];
  [v4 removeObjectForKey:@"TPSDLastPublishedNotificationID"];
  [v4 removeObjectForKey:@"TPSDLastPublisherBulletinID"];
  [v4 removeObjectForKey:@"TipsdUserLaunchesAppAfterNotifications"];
  [v4 removeObjectForKey:@"TPSViewedTipIdentifiers"];
  [v4 removeObjectForKey:@"TPSPendingNotificationTipText"];
  [v4 removeObjectForKey:@"TPSPendingNotificationTipID"];
  [v4 removeObjectForKey:@"TipsdFeedLastNotifiedTipId"];
  [v4 removeObjectForKey:@"TipsdRegisteredForNotificationKey"];
  [v4 removeObjectForKey:@"TipsdWaitingToShowNotification"];
  [v4 removeObjectForKey:@"TipsdWelcomeNotificationNaggingState"];
  [v4 removeObjectForKey:@"validPairedDevices"];
  [v4 removeObjectForKey:@"TPSOfflineLastProcessedRemoteContentIdentifier"];
  [v4 removeObjectForKey:@"TPSOfflineLastProcessedLocalContentIdentifier"];
  [v4 removeObjectForKey:@"TPSOfflineContentMap"];
  [v4 synchronize];
  if ([(TPSDaemon *)self setupCompleted]) {
    id v3 = +[TPSCommonDefines sharedInstance];
  }
}

- (BOOL)_assistantXPCConnectionContainsConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  assistantConnectionQueue = self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A300;
  block[3] = &unk_100020CE0;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(assistantConnectionQueue, block);
  LOBYTE(assistantConnectionQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)assistantConnectionQueue;
}

- (void)_addAssistantXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  assistantConnectionQueue = self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A430;
  block[3] = &unk_100020D08;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(assistantConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeAssistantXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  assistantConnectionQueue = self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A560;
  block[3] = &unk_100020D08;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(assistantConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_discoverabilityXPCConnectionContainsConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  assistantConnectionQueue = self->_assistantConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A6CC;
  block[3] = &unk_100020CE0;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(assistantConnectionQueue, block);
  LOBYTE(assistantConnectionQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)assistantConnectionQueue;
}

- (void)_addDiscoverabilityXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  discoverabilityConnectionQueue = self->_discoverabilityConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A7FC;
  block[3] = &unk_100020D08;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(discoverabilityConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeDiscoverabilityXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  discoverabilityConnectionQueue = self->_discoverabilityConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A92C;
  block[3] = &unk_100020D08;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(discoverabilityConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_removeAppXPCConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  appConnectionQueue = self->_appConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AA9C;
  block[3] = &unk_100020D08;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(appConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)appRemovalCleanupIfNeeded
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  BOOL v4 = [(TPSDaemon *)self tipsAppInstalled];
  if (v4)
  {
LABEL_6:
    [v3 setBool:v4 forKey:@"TPSTipsAppInstalled"];
    [v3 synchronize];
    goto LABEL_7;
  }
  if ([v3 BOOLForKey:@"TPSTipsAppInstalled"])
  {
    id v5 = +[TPSLogger daemon];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "app removal clean up", v8, 2u);
    }

    [(TPSDaemon *)self unregisterImmediateNotifications];
    id v6 = +[TPSAnalyticsEventAppDeleted event];
    [v6 log];

    [(TPSDaemon *)self resetBasicDefaults];
    id v7 = [(TPSDaemon *)self notificationController];
    [v7 removeAllNotifications];

    goto LABEL_6;
  }
LABEL_7:
}

- (void)contentViewedForIdentifier:(id)a3
{
}

- (void)removeNotificationForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSDaemon *)self notificationController];
  [v5 removeNotificationWithIdentifier:v4];
}

- (void)hintDisplayedForIdentifier:(id)a3 correlationID:(id)a4 context:(id)a5
{
  discoverabilityController = self->_discoverabilityController;
  id v8 = a4;
  id v12 = a3;
  [(TPSDiscoverabilityController *)discoverabilityController addHintDisplayedForIdentifier:v12 context:a5];
  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = v12;
  }
  id v10 = v9;
  uint64_t v11 = +[TPSCloudController sharedInstance];
  [v11 hintDisplayedForContentID:v10];
}

- (void)hintDismissedForIdentifier:(id)a3 bundleID:(id)a4 context:(id)a5 reason:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((unint64_t)(a6 - 6) > 4) {
    uint64_t v13 = (id *)&TPSAnalyticsDismissTypeUnknown;
  }
  else {
    uint64_t v13 = (id *)*(&off_100020F00 + a6 - 6);
  }
  id v14 = *v13;
  [(TPSDiscoverabilityController *)self->_discoverabilityController updateHintDismissedForIdentifier:v10 dismissType:v14 context:v12];
  if ([(TPSTipStatusController *)self->_tipStatusController isHintInelgibileForIdentifier:v10])
  {
    unsigned int v15 = +[TPSLogger discoverability];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v10;
      id v16 = "Hint already marked as ineligible for %@";
      BOOL v17 = v15;
      uint32_t v18 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, v18);
    }
  }
  else
  {
    discoverabilityController = self->_discoverabilityController;
    id v25 = v10;
    unsigned __int8 v20 = +[NSArray arrayWithObjects:&v25 count:1];
    [(TPSDiscoverabilityController *)discoverabilityController markHintIneligibleForIdentifiers:v20 bundleID:v11 context:v12 reason:a6];

    unsigned int v15 = +[TPSLogger discoverability];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v14;
      id v16 = "Hint %@ marked ineligible with dismissType %@";
      BOOL v17 = v15;
      uint32_t v18 = 22;
      goto LABEL_9;
    }
  }
}

- (void)restartTrackingForContentIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = +[TPSLogger discoverability];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restartTrackingForContentIdentifiers %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(TPSDaemon *)self discoverabilityController];
  [v6 restartTriggerTrackingIfNotDisplayedForIdentifiers:v4];
}

- (void)logAnalyticsEvent:(id)a3
{
  uint64_t v4 = TPSAnalyticsDaemonActiveReasonRealTimeAnalytics;
  id v5 = a3;
  [(TPSDaemon *)self logDaemonActiveEventWithReason:v4];
  id v6 = +[TPSAnalyticsEventController sharedInstance];
  [v6 logAnalyticsEvent:v5];
}

- (void)logAnalyticsEvents:(id)a3
{
  uint64_t v4 = TPSAnalyticsDaemonActiveReasonRealTimeAnalytics;
  id v5 = a3;
  [(TPSDaemon *)self logDaemonActiveEventWithReason:v4];
  id v6 = +[TPSAnalyticsEventController sharedInstance];
  [v6 logAnalyticsEvents:v5];
}

- (void)handleLanguageDidChangeNotification
{
  [(TPSDaemon *)self logDaemonActiveEventWithReason:TPSAnalyticsDaemonActiveReasonLanguageChange];
  if ([(TPSDaemon *)self setupCompleted])
  {
    id v3 = +[TPSCommonDefines sharedInstance];
    uint64_t v4 = +[NSLocale tps_userLanguageCode];
    id v5 = [v3 userLanguage];
    id v6 = +[TPSLogger daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received language did change notification. New language: %@, current language: %@", buf, 0x16u);
    }

    if ([v4 isEqualToString:v5])
    {
      int v7 = +[TPSLogger daemon];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Current user language has not change, skip.", buf, 2u);
      }
    }
    else
    {
      [v3 clearDataCache];
      [v3 setUserLanguage:v4];
      +[TPSTipsManager removeWelcomeDocumentCache];
      id v9 = [(TPSDaemon *)self notificationController];
      [v9 clearNotificationCache];

      +[TPSNotificationController removeAssetCacheDirectory];
      id v10 = [(TPSDaemon *)self notificationTimingDarwinKey];
      [(TPSDaemon *)self unregisterDarwinNotification:v10];

      [(TPSDaemon *)self updateContentFromOrigin:1 contextualEligibility:1 widgetEligibility:1 notificationEligibility:0 preferredNotificationIdentifiers:0 shouldDeferBlock:0 completionHandler:&stru_100020DD0];
    }
  }
  else
  {
    id v8 = +[TPSLogger daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User is still in set up, exit.", buf, 2u);
    }

    xpc_transaction_exit_clean();
  }
}

- (void)handleDeviceFirstUnlockNotification
{
  [(TPSDaemon *)self logDaemonActiveEventWithReason:TPSAnalyticsDaemonActiveReasonFirstUnlock];
  if ([(TPSDaemon *)self setupCompleted])
  {
    [(TPSDaemon *)self updateContentFromOrigin:1 contextualEligibility:1 widgetEligibility:0 notificationEligibility:0 preferredNotificationIdentifiers:0 shouldDeferBlock:0 completionHandler:&stru_100020DF0];
  }
  else
  {
    id v3 = +[TPSLogger daemon];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User is still in set up, exit.", buf, 2u);
    }

    xpc_transaction_exit_clean();
  }
}

- (void)immediateNotificationForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = +[TPSLogger daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 description];
    *(_DWORD *)buf = 138412290;
    int v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Request immediate notification for %@", buf, 0xCu);
  }
  if ([v4 count])
  {
    int v7 = [(TPSDaemon *)self notificationController];
    id v8 = [v7 notificationCache];
    id v9 = (char *)[v8 type];

    if ([(TPSDaemon *)self tipsAppInstalled] && (unint64_t)(v9 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_initWeak((id *)buf, self);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000BBC0;
      v17[3] = &unk_100020E18;
      objc_copyWeak(&v19, (id *)buf);
      id v18 = v4;
      [(TPSDaemon *)self updateContentFromOrigin:0 contextualEligibility:0 widgetEligibility:0 notificationEligibility:1 preferredNotificationIdentifiers:v18 shouldDeferBlock:0 completionHandler:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v10 = [(TPSDaemon *)self notificationController];
      id v11 = [v10 notificationCache];
      id v12 = [v11 collectionIdentifier];
      unsigned __int8 v13 = [v4 containsObject:v12];

      if ((v13 & 1) == 0)
      {
        id v14 = +[TPSCommonDefines sharedInstance];
        unsigned int v15 = +[NSSet setWithArray:v4];
        [v14 activatedCollections:v15];

        id v16 = +[TPSLogger daemon];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skipping immediate collection notification", buf, 2u);
        }
      }
    }
  }
}

- (void)userGuideMapWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[TPSLogger daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrieve user guide map.", (uint8_t *)buf, 2u);
  }

  id v6 = [(TPSDaemon *)self tipsManager];
  int v7 = [v6 lastFetchedLanguage];
  id v8 = +[NSLocale tps_userLanguageCode];
  unsigned int v9 = [v7 isEqualToString:v8];

  id v10 = [(TPSDaemon *)self tipsManager];
  id v11 = v10;
  if (!v9)
  {
    [v10 clearCachedUserGuides];
LABEL_9:

    objc_initWeak(buf, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000C050;
    v13[3] = &unk_100020E40;
    objc_copyWeak(&v15, buf);
    id v14 = v4;
    [(TPSDaemon *)self updateContentFromOrigin:0 contextualEligibility:0 widgetEligibility:0 notificationEligibility:0 preferredNotificationIdentifiers:0 shouldDeferBlock:0 completionHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
    goto LABEL_10;
  }
  id v12 = [v10 cachedUserGuideMap];

  if (!v12 || ![v12 count])
  {
    id v11 = v12;
    goto LABEL_9;
  }
  (*((void (**)(id, void *, void))v4 + 2))(v4, v12, 0);

LABEL_10:
}

- (void)contentForVariant:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TPSDaemon *)self tipsManager];
  id v15 = v6;
  unsigned int v9 = +[NSArray arrayWithObjects:&v15 count:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C2A4;
  v12[3] = &unk_100020E68;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 contentForVariantIdentifiers:v9 completionHandler:v12];
}

- (void)fetchAssetsWithAssetsConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[TPSLogger daemon];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100014A6C();
  }

  id v8 = objc_alloc_init((Class)NSOperationQueue);
  [v8 setSuspended:1];
  unsigned int v9 = [v5 cacheIdentifierForType:0];
  id v10 = +[TPSContentURLController assetPathFromAssetConfiguration:v5 type:0];
  if ([v9 length] && objc_msgSend(v10, "length")) {
    id v11 = [objc_alloc((Class)TPSAssetsDownloadOperation) initWithAssetIdentifier:v9 assetURLPath:v10];
  }
  else {
    id v11 = 0;
  }
  id v12 = [v5 cacheIdentifierForType:1];
  id v13 = +[TPSContentURLController assetPathFromAssetConfiguration:v5 type:1];
  if ([v12 length] && objc_msgSend(v13, "length")) {
    id v14 = [objc_alloc((Class)TPSAssetsDownloadOperation) initWithAssetIdentifier:v12 assetURLPath:v13];
  }
  else {
    id v14 = 0;
  }
  unsigned __int8 v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  id v22 = sub_10000C68C;
  __int16 v23 = &unk_100020E90;
  id v15 = v11;
  id v24 = v15;
  id v16 = v14;
  id v25 = v16;
  id v26 = v5;
  id v27 = v6;
  id v17 = v6;
  id v18 = v5;
  id v19 = +[NSBlockOperation blockOperationWithBlock:&v20];
  if (v15)
  {
    [v8 addOperation:v15, v20, v21, v22, v23, v24, v25, v26, v27];
    [v19 addDependency:v15];
  }
  if (v16)
  {
    [v8 addOperation:v16];
    [v19 addDependency:v16];
  }
  [v8 addOperation:v19, v20, v21, v22, v23];
  [v8 setSuspended:0];
}

- (BOOL)isContentIneligibleDueToViewOnOtherDevices:(id)a3
{
  id v3 = [(TPSTipStatusController *)self->_tipStatusController statusForIdentifier:a3];
  if ([v3 isHintDisplayed]) {
    unsigned __int8 v4 = 0;
  }
  else {
    unsigned __int8 v4 = [v3 isHintDisplayedOnCloudDevices];
  }

  return v4;
}

- (int64_t)statusCheckForHintIneligibleReasonWithContentID:(id)a3
{
  id v4 = a3;
  int64_t v5 = (int64_t)[(TPSTipStatusController *)self->_tipStatusController hintInelgibileReasonForIdentifier:v4];
  if ((v5 & 0xFFFFFFFFFFFFFFF7) == 0)
  {
    unsigned __int8 v6 = [(TPSTipStatusController *)self->_tipStatusController isPreconditionMatchedForIdentifier:v4];
    discoverabilityController = self->_discoverabilityController;
    if (v6)
    {
      if (([(TPSDiscoverabilityController *)discoverabilityController isContextualInfoExistForIdentifier:v4] & 1) == 0)goto LABEL_10; {
      if ([(TPSDaemon *)self isContentIneligibleDueToViewOnOtherDevices:v4])
      }
      {
        if (!+[TPSDefaultsManager ignoreCloud])
        {
          int64_t v5 = 5;
          goto LABEL_12;
        }
        id v8 = +[TPSLogger daemon];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138412290;
          id v11 = v4;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Overriding ineligibility due to content %@ already seen on other devices", (uint8_t *)&v10, 0xCu);
        }
      }
      if ([(TPSTipsManager *)self->_tipsManager contextualTipsInactive])
      {
LABEL_10:
        [(TPSDiscoverabilityController *)self->_discoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:v4];
        int64_t v5 = 4;
      }
    }
    else
    {
      [(TPSDiscoverabilityController *)discoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:v4];
      int64_t v5 = 15;
    }
  }
LABEL_12:

  return v5;
}

- (int64_t)displayStatusCheckForHintIneligibleReasonWithContent:(id)a3 context:(id)a4 bypassExperiment:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = +[NSLocale tps_userLanguageCode];
  id v11 = [v8 userLanguageCode];
  id v12 = [v8 identifier];
  id v13 = +[TPSLogger daemon];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Checking language changes for %@", buf, 0xCu);
  }

  if (v10 && ([v10 isEqualToString:v11] & 1) != 0)
  {
    if ([(TPSDiscoverabilityController *)self->_discoverabilityController isContentHintDisplayMaxDisplayedCountExceededForIdentifier:v12])
    {
      [(TPSDiscoverabilityController *)self->_discoverabilityController updateHintDismissedForIdentifier:v12 dismissType:TPSAnalyticsDismissTypeHintMaxDisplayedCountExceeded context:v9];
      int64_t v14 = 20;
    }
    else
    {
      BOOL v23 = v5;
      id v16 = +[TPSLogger daemon];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Checking preconditions for %@", buf, 0xCu);
      }

      id v17 = [(TPSDaemon *)self tipsManager];
      id v18 = [v8 preconditions];
      unsigned int v19 = [v17 isPreconditionValidForIdentifier:v12 preconditionDictionary:v18];

      if (v19) {
        int64_t v14 = 0;
      }
      else {
        int64_t v14 = 15;
      }
      if (!v23 && v19)
      {
        unsigned __int8 v20 = +[TPSLogger daemon];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v12;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Checking experiment camp for %@", buf, 0xCu);
        }

        uint64_t v21 = [(TPSDaemon *)self tipsManager];
        unsigned int v22 = [v21 isContentIdentifierHoldoutCamp:v12];

        if (v22)
        {
          [(TPSDiscoverabilityController *)self->_discoverabilityController updateHintWouldHaveBeenDisplayedForIdentifier:v12 context:v9];
          int64_t v14 = 22;
        }
        else
        {
          int64_t v14 = 0;
        }
      }
    }
  }
  else
  {
    [(TPSDiscoverabilityController *)self->_discoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:v12];
    int64_t v14 = 11;
  }

  return v14;
}

- (void)donateHintIneligibleReason:(int64_t)a3 contentID:(id)a4 bundleID:(id)a5 context:(id)a6
{
  discoverabilityController = self->_discoverabilityController;
  id v20 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  int64_t v14 = +[NSArray arrayWithObjects:&v20 count:1];
  -[TPSDiscoverabilityController markHintIneligibleForIdentifiers:bundleID:context:reason:](discoverabilityController, "markHintIneligibleForIdentifiers:bundleID:context:reason:", v14, v12, v11, a3, v20);

  id v15 = objc_alloc((Class)TPSAnalyticsEventTipNotDisplayed);
  id v16 = [(TPSDiscoverabilityController *)self->_discoverabilityController tipStatusController];
  id v17 = [v16 correlationIdentifierForIdentifier:v13];
  id v18 = [v15 initWithTipID:v13 correlationID:v17 bundleID:v12 reason:a3 context:v11 date:0];

  unsigned int v19 = +[TPSAnalyticsEventController sharedInstance];

  [v19 logAnalyticsEvent:v18];
}

- (void)personalizationFailedForContentID:(id)a3 bundleID:(id)a4 context:(id)a5
{
  discoverabilityController = self->_discoverabilityController;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [(TPSDiscoverabilityController *)discoverabilityController restartTriggerTrackingIfNotDisplayedForIdentifier:v11];
  [(TPSDaemon *)self donateHintIneligibleReason:21 contentID:v11 bundleID:v10 context:v9];
}

- (void)validateAndPrepareContentForDisplay:(id)a3 bundleID:(id)a4 context:(id)a5 skipUsageCheck:(BOOL)a6 completionHandler:(id)a7
{
  id v7 = a7;
  id v8 = +[TPSLogger daemon];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "validateAndPrepareContentForDisplay", v9, 2u);
  }

  (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
}

- (id)miniTipMetadataForContent:(id)a3 bundleID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v42 = a4;
  id v9 = a5;
  id v10 = [v8 identifier];
  id v11 = [v8 miniContent];
  id v12 = [v11 bodyText];
  if (v12)
  {

    goto LABEL_4;
  }
  id v13 = [v11 bodyContent];

  if (v13)
  {
LABEL_4:
    int64_t v14 = +[NSLocale tps_userLanguageCode];
    id v15 = [v8 language];
    if ([v15 length])
    {
      id v16 = [v8 language];
      unsigned int v17 = [v16 isEqualToString:v14];

      if (v17)
      {
        id v18 = 0;
        uint64_t v19 = TPSTipsManagerErrorDomain;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
    }
    id v20 = +[TPSLogger discoverability];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v8 language];
      *(_DWORD *)buf = 138412546;
      unsigned int v46 = v21;
      __int16 v47 = 2112;
      unsigned int v48 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Content language code (%@) does not match user preferred language (%@)", buf, 0x16u);
    }
    uint64_t v19 = TPSTipsManagerErrorDomain;
    id v18 = +[NSError errorWithDomain:TPSTipsManagerErrorDomain code:3 userInfo:0];
    goto LABEL_11;
  }
  id v39 = +[TPSLogger discoverability];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Content does not contain body text", buf, 2u);
  }

  if (v11) {
    BOOL v40 = v8 == 0;
  }
  else {
    BOOL v40 = 0;
  }
  if (v40) {
    uint64_t v41 = 2;
  }
  else {
    uint64_t v41 = 1;
  }
  uint64_t v19 = TPSTipsManagerErrorDomain;
  id v18 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", TPSTipsManagerErrorDomain, v41, 0, v42);
LABEL_12:
  unsigned int v22 = [objc_alloc((Class)TPSMiniTipMetadata) initWithContent:v8];
  [v22 setError:v18];
  BOOL v23 = [v18 domain];
  unsigned int v24 = [v23 isEqualToString:v19];

  if (v24)
  {
    id v25 = [v18 code];
    uint64_t v26 = 13;
    if (v25 != (id)3) {
      uint64_t v26 = 1;
    }
    if (v25 == (id)2) {
      uint64_t v27 = 14;
    }
    else {
      uint64_t v27 = v26;
    }
    BOOL v28 = [(TPSDaemon *)self discoverabilityController];
    [v28 restartTriggerTrackingIfNotDisplayedForIdentifier:v10];

    uint64_t v29 = [(TPSDaemon *)self discoverabilityController];
    v44 = v10;
    char v30 = +[NSArray arrayWithObjects:&v44 count:1];
    [v29 markHintIneligibleForIdentifiers:v30 bundleID:v43 context:v9 reason:v27];
  }
  if (v18
    || [v8 isLocalContent]
    && (int64_t v33 = [(TPSDaemon *)self displayStatusCheckForHintIneligibleReasonWithContent:v8 context:v9 bypassExperiment:1], (v33 & 0xFFFFFFFFFFFFFFF7) != 0)&& ([(TPSDaemon *)self _errorForHintIneligibleReason:v33 contentID:v10], v18 = objc_claimAutoreleasedReturnValue(), [(TPSDaemon *)self donateHintIneligibleReason:21 contentID:v10 bundleID:v43 context:v9],
        v18))
  {
    unsigned int v31 = +[TPSLogger daemon];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v46 = v18;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Mini tip is not valid due to %@", buf, 0xCu);
    }
  }
  else
  {
    int v34 = [(TPSDaemon *)self tipStatusController];
    unsigned __int8 v35 = [v34 userInfoForIdentifier:v10];
    [v22 setUserInfo:v35];

    id v36 = [(TPSDaemon *)self discoverabilityController];
    -[NSObject setCustomizationID:](v22, "setCustomizationID:", [v36 customizationIDForContentID:v10]);

    int v37 = [(TPSDaemon *)self discoverabilityController];
    v38 = [v37 monitoringEventsForContentID:v10];
    [v22 setMonitoringEvents:v38];

    id v18 = +[TPSLogger daemon];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v46 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Mini tip metadata %@", buf, 0xCu);
    }
  }

  return v22;
}

- (void)donateContentRetrieved:(id)a3 bundleID:(id)a4 context:(id)a5 error:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a6)
  {
    id v12 = a6;
    id v13 = [v12 domain];
    id v14 = [v12 code];

    a6 = +[NSString stringWithFormat:@"%@: %ld", v13, v14];
  }
  id v15 = [(TPSDaemon *)self tipStatusController];
  id v16 = [v15 correlationIdentifierForIdentifier:v18];
  unsigned int v17 = +[TPSAnalyticsEventContentRetrieved eventWithTipID:v18 correlationID:v16 bundleID:v10 context:v11 serviceError:a6];
  [v17 log];
}

- (void)contentWithContentIdentifiers:(id)a3 bundleID:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v25 = a6;
  id v13 = +[TPSLogger discoverability];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fetching for content %@", buf, 0xCu);
  }

  unsigned int v24 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  uint64_t v27 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v10;
  id v14 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v36;
    uint64_t v26 = kTPSMiniTipContentManagerServiceInterfaceErrorDomain;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        int64_t v18 = [(TPSDaemon *)self statusCheckForHintIneligibleReasonWithContentID:v17];
        if ((v18 & 0xFFFFFFFFFFFFFFF7) != 0)
        {
          uint64_t v19 = [(TPSDaemon *)self _errorForHintIneligibleReason:v18 contentID:v17];
          [(TPSDaemon *)self donateContentRetrieved:v17 bundleID:v11 context:v12 error:v19];
        }
        else
        {
          uint64_t v19 = [(TPSTipStatusController *)self->_tipStatusController variantIdentifierForIdentifier:v17];
          if (v19)
          {
            [v27 addObject:v19];
          }
          else
          {
            NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
            CFStringRef v40 = @"Invalid Content ID";
            id v20 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
            uint64_t v21 = +[NSError errorWithDomain:v26 code:5 userInfo:v20];

            [(TPSDaemon *)self donateContentRetrieved:v17 bundleID:v11 context:v12 error:v21];
          }
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v14);
  }

  if ([v27 count])
  {
    objc_initWeak((id *)buf, self);
    unsigned int v22 = [(TPSDaemon *)self tipsManager];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000D988;
    v29[3] = &unk_100020EB8;
    objc_copyWeak(&v34, (id *)buf);
    v29[4] = self;
    id v30 = v11;
    id v31 = v12;
    id v32 = v24;
    id v33 = v25;
    [v22 contentForVariantIdentifiers:v27 completionHandler:v29];

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }
  else if (v24)
  {
    id v23 = [v24 copy];
    (*((void (**)(id, id, void))v25 + 2))(v25, v23, 0);
  }
  else
  {
    (*((void (**)(void))v25 + 2))();
  }
}

- (id)_errorForHintIneligibleReason:(int64_t)a3 contentID:(id)a4
{
  id v5 = a4;
  if (!v5)
  {
    uint64_t v12 = kTPSMiniTipContentManagerServiceInterfaceErrorDomain;
    id v7 = @"Invalid Content ID";
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    CFStringRef v18 = @"Invalid Content ID";
    id v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v10 = v12;
    uint64_t v11 = 1;
    goto LABEL_5;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFF7) != 0)
  {
    unsigned __int8 v6 = +[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:a3];
    id v7 = +[NSString stringWithFormat:@"Content (%@) ineligible due to reason: %@", v5, v6];

    uint64_t v8 = kTPSMiniTipContentManagerServiceInterfaceErrorDomain;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    id v16 = v7;
    id v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v10 = v8;
    uint64_t v11 = 2;
LABEL_5:
    id v13 = +[NSError errorWithDomain:v10 code:v11 userInfo:v9];

    goto LABEL_7;
  }
  id v13 = 0;
  id v7 = 0;
LABEL_7:

  return v13;
}

- (void)welcome:(id)a3 contentAvailableRemotelyWithCompletionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000DDC0;
  v5[3] = &unk_100020C18;
  unsigned __int8 v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(TPSDaemon *)v6 updateContentFromOrigin:1 contextualEligibility:0 widgetEligibility:1 notificationEligibility:0 preferredNotificationIdentifiers:0 shouldDeferBlock:0 completionHandler:v5];
}

- (void)welcome:(id)a3 notifyWelcomeDocument:(id)a4
{
  id v8 = a4;
  id v5 = [(TPSDaemon *)self notificationController];
  unsigned __int8 v6 = [v8 identifier];
  id v7 = [v5 updateNotificationCacheWithCollectionIdentifier:v6 document:v8 type:1 extensionPayload:0];

  [(TPSDaemon *)self updateNotificationStatus];
}

- (id)contextualInfoMap
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  id v4 = [(TPSDaemon *)self usageEventManager];
  id v5 = [v4 contextualInfoMap];
  id v6 = [v3 initWithDictionary:v5];

  discoverabilityController = self->_discoverabilityController;
  if (!discoverabilityController) {
    discoverabilityController = (TPSDiscoverabilityController *)TPSDiscoverabilityController;
  }
  id v8 = [(TPSDiscoverabilityController *)discoverabilityController contextualInfoMap];
  [v6 addEntriesFromDictionary:v8];
  id v9 = [v6 copy];

  return v9;
}

- (id)analyticsExperiment
{
  id v3 = [(TPSDaemon *)self tipsManager];

  if (v3)
  {
    id v4 = [(TPSDaemon *)self tipsManager];
    id v5 = [v4 experiment];
  }
  else
  {
    id v5 = +[TPSTipsManager experiment];
  }

  return v5;
}

- (id)tipStatusForIdentifier:(id)a3
{
  return [(TPSTipStatusController *)self->_tipStatusController statusForIdentifier:a3];
}

- (id)contextualInfoForIdentifier:(id)a3
{
  discoverabilityController = self->_discoverabilityController;
  if (discoverabilityController)
  {
    id v4 = a3;
    id v5 = [(TPSDiscoverabilityController *)discoverabilityController contextualInfoForIdentifier:v4];
  }
  else
  {
    id v6 = a3;
    id v4 = +[TPSDiscoverabilityController contextualInfoMap];
    id v5 = [v4 objectForKeyedSubscript:v6];
  }

  return v5;
}

- (id)displayTypeForIdentifier:(id)a3
{
  id v3 = [(TPSDaemon *)self tipStatusForIdentifier:a3];
  id v4 = +[TPSAnalyticsCommonDefines displayTypeStringForDisplayType:](TPSAnalyticsCommonDefines, "displayTypeStringForDisplayType:", [v3 displayType]);

  return v4;
}

- (id)experimentCampID
{
  id v3 = [(TPSDaemon *)self analyticsExperiment];
  id v4 = -[TPSDaemon experimentCampIDStringForCamp:](self, "experimentCampIDStringForCamp:", [v3 camp]);

  return v4;
}

- (id)experimentID
{
  unsigned __int8 v2 = [(TPSDaemon *)self analyticsExperiment];
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v2 identifier]);

  return v3;
}

- (id)experimentCampIDStringForCamp:(int64_t)a3
{
  return +[TPSAnalyticsCommonDefines experimentCampIDStringForCamp:a3];
}

- (id)bundleIDForIdentifier:(id)a3
{
  id v3 = [(TPSDaemon *)self contextualInfoForIdentifier:a3];
  id v4 = [v3 displayBundleID];

  return v4;
}

- (id)correlationIDForIdentifier:(id)a3
{
  return [(TPSTipStatusController *)self->_tipStatusController correlationIdentifierForIdentifier:a3];
}

- (id)contextForIdentifier:(id)a3
{
  id v3 = [(TPSDaemon *)self tipStatusForIdentifier:a3];
  id v4 = [v3 lastDisplayContext];

  return v4;
}

- (unint64_t)hintDisplayedCountForIdentifier:(id)a3
{
  id v3 = [(TPSDaemon *)self tipStatusForIdentifier:a3];
  id v4 = [v3 hintDisplayedDates];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (void)tipsManager:(id)a3 contextualEligibilityWithTipIdentifiers:(id)a4 tipsDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 experimentCampChangesToAll:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(TPSDaemon *)self discoverabilityController];
  [v14 contextualEligibilityWithTipIdentifiers:v13 tipsDeliveryInfoMap:v12 deliveryInfoMap:v11 experimentCampChangesToAll:v7];
}

- (void)tipsManagerContentUpdateOverrideCompleted:(id)a3 contentPackage:(id)a4 shouldUpdateNotification:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v9 = a6;
  if (v10) {
    [(TPSDaemon *)self indexContentPackage:v10];
  }
  [(TPSDaemon *)self contentUpdatePostProcessingContentPackage:v10 shouldUpdateNotification:v7 shouldDeferBlock:0 error:v9];
}

- (BOOL)canCheckForNewTipNotification:(id)a3
{
  id v3 = [(TPSDaemon *)self welcome];
  char v4 = [v3 shouldShowWelcomeNotification] ^ 1;

  return v4;
}

- (id)currentExperimentWithDiscoverabilityController:(id)a3
{
  id v3 = [(TPSDaemon *)self tipsManager];
  char v4 = [v3 experiment];

  return v4;
}

- (void)notificationController:(id)a3 markIdentifier:(id)a4 type:(int64_t)a5 ineligibleWithReason:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (a5 == 2)
  {
    id v14 = +[TPSCommonDefines sharedInstance];
    [v14 notifiedCollection:v11];

    id v12 = [(TPSDaemon *)self discoverabilityController];
    NSErrorUserInfoKey v15 = [v12 tipStatusController];
    id v16 = [v15 correlationIdentifierForIdentifier:v11];
    NSErrorUserInfoKey v17 = +[TPSAnalyticsEventContentIneligible eventWithTipID:v11 correlationID:v16 bundleID:0 context:0 displayType:0 reason:a6 date:0];
    [v17 log];

    goto LABEL_5;
  }
  if (a5 == 1)
  {
    id v12 = [(TPSDaemon *)self discoverabilityController];
    id v18 = v11;
    id v13 = +[NSArray arrayWithObjects:&v18 count:1];
    [v12 markHintIneligibleForIdentifiers:v13 context:0 reason:a6];

LABEL_5:
  }
}

- (void)notificationController:(id)a3 registrableEventReceivedForDocumentIdentifier:(id)a4
{
  id v5 = a4;
  if ([v5 length])
  {
    id v7 = v5;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [(TPSDaemon *)self immediateNotificationForIdentifiers:v6];
  }
}

- (void)performQuery:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[TPSSearchQueryManager shared];
  [v7 performQuery:v6 completion:v5];
}

- (void)cancelQueryWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[TPSSearchQueryManager shared];
  [v4 cancelQueryWithIdentifier:v3];
}

- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[TPSLogger indexing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "reindex all searchableItems request from extension", v7, 2u);
  }

  id v6 = [(TPSDaemon *)self tipsManager];
  [v6 reindexAllSearchableItemsWithCompletionHandler:v4];
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TPSLogger indexing];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 134217984;
    id v11 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "reindex reindexSearchableItemsWithIdentifiers request from extension: %lu", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(TPSDaemon *)self tipsManager];
  [v9 reindexSearchableItemsWithIdentifiers:v6 completionHandler:v7];
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[TPSLogger indexing];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "delete all searchableItems request from extension", v7, 2u);
  }

  id v6 = [(TPSDaemon *)self tipsManager];
  [v6 deleteAllSearchableItemsWithCompletionHandler:v4];
}

- (void)setTipsManager:(id)a3
{
}

- (OS_dispatch_queue)discoverabilityConnectionQueue
{
  return self->_discoverabilityConnectionQueue;
}

- (void)setDiscoverabilityConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)appConnectionQueue
{
  return self->_appConnectionQueue;
}

- (void)setAppConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)assistantConnectionQueue
{
  return self->_assistantConnectionQueue;
}

- (void)setAssistantConnectionQueue:(id)a3
{
}

- (NSURLSession)tipsFeedURLSession
{
  return self->_tipsFeedURLSession;
}

- (void)setTipsFeedURLSession:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSMutableSet)discoverabilityConnections
{
  return self->_discoverabilityConnections;
}

- (void)setDiscoverabilityConnections:(id)a3
{
}

- (void)setAppConnections:(id)a3
{
}

- (NSMutableSet)assistantConnections
{
  return self->_assistantConnections;
}

- (void)setAssistantConnections:(id)a3
{
}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (void)setTipStatusController:(id)a3
{
}

- (TPSDiscoverabilityController)discoverabilityController
{
  return self->_discoverabilityController;
}

- (void)setDiscoverabilityController:(id)a3
{
}

- (void)setNotificationController:(id)a3
{
}

- (void)setUsageEventManager:(id)a3
{
}

- (TPSWelcome)welcome
{
  return self->_welcome;
}

- (void)setWelcome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_welcome, 0);
  objc_storeStrong((id *)&self->_usageEventManager, 0);
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_discoverabilityController, 0);
  objc_storeStrong((id *)&self->_tipStatusController, 0);
  objc_storeStrong((id *)&self->_assistantConnections, 0);
  objc_storeStrong((id *)&self->_appConnections, 0);
  objc_storeStrong((id *)&self->_discoverabilityConnections, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_tipsFeedURLSession, 0);
  objc_storeStrong((id *)&self->_assistantConnectionQueue, 0);
  objc_storeStrong((id *)&self->_appConnectionQueue, 0);
  objc_storeStrong((id *)&self->_discoverabilityConnectionQueue, 0);
  objc_storeStrong((id *)&self->_notificationTimingDarwinKey, 0);
  objc_storeStrong((id *)&self->_tipsManager, 0);

  objc_storeStrong((id *)&self->_analyticsDataProvider, 0);
}

- (void)findMatchingResultIdFromContexts:(id)a3 reply:(id)a4
{
  id v5 = _Block_copy(a4);
  type metadata accessor for ResultContext();
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  id v7 = self;
  sub_1000135E4(v6, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)availableUserGuideIdentifiersWithReply:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_100013964((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)fetchDocumentWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v6 = sub_10000F758(&qword_1000267C0);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = _Block_copy(a4);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  NSErrorUserInfoKey v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  void v15[4] = self;
  v15[5] = sub_1000133B8;
  v15[6] = v13;
  v15[7] = v10;
  v15[8] = v12;
  id v16 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100011674((uint64_t)v8, (uint64_t)&unk_1000267E8, (uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end