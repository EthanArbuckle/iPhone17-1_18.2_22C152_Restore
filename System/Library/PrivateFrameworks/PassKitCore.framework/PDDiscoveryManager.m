@interface PDDiscoveryManager
- (BOOL)_shouldReprocessForTransaction:(id)a3 previousTransactionProcessingDate:(id)a4;
- (BOOL)loadDialogRequestsForPlacement:(id)a3 completion:(id)a4;
- (BOOL)rulesNeedLocation;
- (BOOL)rulesNeedPlacemark;
- (CLLocation)latestValidLocation;
- (CLPlacemark)latestValidPlacemark;
- (NSSet)identifiersOfCompletedDiscoveryItems;
- (NSSet)identifiersOfDismissedDiscoveryItems;
- (NSSet)identifiersOfExpandedDiscoveryItems;
- (NSSet)identifiersOfTappedDiscoveryItems;
- (PDDiscoveryManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 ruleManager:(id)a5 accountManager:(id)a6 applyManager:(id)a7 peerPaymentWebServiceCoordinator:(id)a8 transitNotificationService:(id)a9 userNotificationManager:(id)a10 transactionProcessor:(id)a11 pushNotificationManager:(id)a12 notificationStreamManager:(id)a13 deviceEnvironmentStore:(id)a14 delegate:(id)a15;
- (id)_deleteMessagesBundle;
- (id)_discoveryArticleLayoutFromBundleForDiscoveryItem:(id)a3 error:(id *)a4;
- (id)_discoveryMessageManifestFromBundle:(id)a3 withError:(id *)a4;
- (id)_filterDiscoveryItemsForOSAndHardwareVersion:(id)a3;
- (id)_filterDiscoveryObjectsForOSAndHardwareVersion:(id)a3;
- (id)_filterEngagementMessagesForOSAndHardwareVersion:(id)a3;
- (id)_filterEngagementMessagesForViewCount:(id)a3;
- (id)_filterItemsForViewCount:(id)a3;
- (id)_filterNotificationsForOSAndHardwareVersion:(id)a3;
- (id)_filterRulesForOSVersion:(id)a3;
- (id)createCurrentNotificationRegistrationState;
- (id)pushNotificationTopics;
- (int64_t)_currentMessagesBundleVersion;
- (void)_articleLayoutForDiscoveryItem:(id)a3 completion:(id)a4;
- (void)_callDelegateWithLayoutsForUpdatedDiscoveryItemsAndMessages;
- (void)_cleanArticleLayoutsDirectories;
- (void)_executeWithLock:(id)a3;
- (void)_fetchAndWriteBundleForDiscoveryItem:(id)a3 completion:(id)a4;
- (void)_fetchAndWriteBundleFromRemoteBundleURL:(id)a3 toLocalBundleURL:(id)a4 processTempBundle:(id)a5 completion:(id)a6;
- (void)_fetchDiscoverManifestWithCompletion:(id)a3;
- (void)_lock_startLocationQueryTimeoutIfNecessary;
- (void)_paymentWebServiceContextChanged;
- (void)_processDiscoveryManifest:(id)a3 completion:(id)a4;
- (void)_processUpdatedNotifications;
- (void)_putLatestValidLocationAndNotify:(id)a3;
- (void)_putLatestValidPlacemarkAndNotify:(id)a3;
- (void)_queue_activeDialogRequestSourcedDiscoveryItems:(id)a3;
- (void)_queue_evaluateRulesAndForceBadgeCountUpdate:(BOOL)a3 completion:(id)a4;
- (void)_queue_insertDiscoveryNotificationsIfNecessary;
- (void)_queue_performNextProcessingDiscoveryObjects;
- (void)_queue_performProcessingDiscoveryObjectsShouldForceBadgeCountUpdate:(BOOL)a3 withCompletionBlocks:(id)a4 finalCompletion:(id)a5;
- (void)_queue_processDiscoveryItemsAndMessagesShouldForceBadgeCountUpdate:(BOOL)a3 completion:(id)a4;
- (void)_queue_processDiscoveryManifest:(id)a3 completion:(id)a4;
- (void)_queue_processDownloadedMessagesManifest:(id)a3;
- (void)_queue_processExistingDiscoveryUserNotifications:(id)a3;
- (void)_queue_restoreDiscoveryEngagementMessageStatusFromDefaultsIfNecessaryWithServerMessages:(id)a3;
- (void)_queue_restoreDiscoveryItemStatusFromDefaultsIfNecessaryWithServerItems:(id)a3;
- (void)_queue_restoreDiscoveryNotificationStatusFromDefaultsIfNecessaryWithServerNotifications:(id)a3;
- (void)_queue_scheduleTaskForNextAction;
- (void)_queue_shouldUpdateDiscoveryManifestWithCompletion:(id)a3;
- (void)_queue_updateDiscoveryEngagementMessageStatusDefaults;
- (void)_queue_updateDiscoveryItemStatusDefaults;
- (void)_queue_updateDiscoveryNotificationsStatusDefaults;
- (void)_queue_updateDiscoveryNotificationsStatusDefaultsForUpdatedNotifications:(id)a3;
- (void)_queue_updateWithServerDiscoveryItems:(id)a3;
- (void)_queue_updateWithServerEngagementMessages:(id)a3;
- (void)_queue_updateWithServerNotifications:(id)a3;
- (void)_scheduleDayChangedEvent;
- (void)_shouldUpdateDiscoveryManifestWithCompletion:(id)a3;
- (void)_startup;
- (void)_updateDiscoveryEngagementMessageStatusDefaultsForUpdatedMessages:(id)a3;
- (void)_updateDiscoveryItemStatusDefaultsForUpdatedItems:(id)a3;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 didUpdatePromotions:(id)a4 oldPromotions:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 scheduledPaymentsChangedForAccountIdentifier:(id)a4;
- (void)applyManager:(id)a3 didAddApplication:(id)a4;
- (void)applyManager:(id)a3 didRemoveApplication:(id)a4;
- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5;
- (void)applyPushNotificationToken:(id)a3;
- (void)beginReporingDiscoveryAnalytics;
- (void)completedDiscoveryItemCTA;
- (void)currentLocaleChanged;
- (void)dealloc;
- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4;
- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4;
- (void)discoveryArticleLayoutsWithCompletion:(id)a3;
- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5;
- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4;
- (void)discoveryItemsWithCompletion:(id)a3;
- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5;
- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5;
- (void)dismissedDiscoveryItems:(id)a3;
- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3;
- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8;
- (void)endReporingDiscoveryAnalytics;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)environmentStore:(id)a3 storedEnvironment:(id)a4 differsFromCurrent:(id)a5 commitBlock:(id)a6;
- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7;
- (void)expressPassConfigurationsChanged;
- (void)familyCircleChanged;
- (void)fetchLatestValidLocation:(id)a3;
- (void)fetchLatestValidPlacemark:(id)a3;
- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5;
- (void)fetchWelcomeCardCount:(id)a3;
- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4;
- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)manifestAllowsMiniCardsWithCompletion:(id)a3;
- (void)passAdded:(id)a3;
- (void)passRemoved:(id)a3;
- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3;
- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3;
- (void)processLocationUpdate;
- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3;
- (void)removedAllDiscoveryItems;
- (void)setRulesNeedLocation:(BOOL)a3;
- (void)setRulesNeedPlacemark:(BOOL)a3;
- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)transitNotificationService:(id)a3 didAddDCINotificationForMarket:(id)a4;
- (void)transitNotificationService:(id)a3 didAddOpenLoopUpgradeNotificationForMarket:(id)a4;
- (void)transitNotificationService:(id)a3 didAddRenotifyNotificationForMarket:(id)a4;
- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5;
- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5;
- (void)updateDiscoveryManifestWithCompletion:(id)a3;
- (void)updateMonitoringRequiringLocation:(BOOL)a3 andPlacemarks:(BOOL)a4;
@end

@implementation PDDiscoveryManager

- (void)_queue_processDiscoveryItemsAndMessagesShouldForceBadgeCountUpdate:(BOOL)a3 completion:(id)a4
{
  if (self->_forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects) {
    a3 = 1;
  }
  self->_forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects = a3;
  pendingProcessingDiscoveryObjectsBlocks = self->_pendingProcessingDiscoveryObjectsBlocks;
  id v7 = objc_retainBlock(a4);
  [(NSMutableArray *)pendingProcessingDiscoveryObjectsBlocks addObject:v7];

  [(PDDiscoveryManager *)self _queue_performNextProcessingDiscoveryObjects];
}

- (void)processDiscoveryItemsAndMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007CE8;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)discoveryArticleLayoutsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000E9E8;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, v7);
  }
}

- (void)dismissedDiscoveryItems:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007AA4;
    v7[3] = &unk_10072E598;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, v7);
  }
}

- (id)_filterItemsForViewCount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "maxViewCount", (void)v14);
        if (!v11 || (uint64_t)[v10 viewCount] <= (uint64_t)v11) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];
  return v12;
}

- (void)_queue_performNextProcessingDiscoveryObjects
{
  if (!self->_isEvaluatingRules)
  {
    if ([(NSMutableArray *)self->_pendingProcessingDiscoveryObjectsBlocks count])
    {
      id v3 = [(NSMutableArray *)self->_pendingProcessingDiscoveryObjectsBlocks copy];
      [(NSMutableArray *)self->_pendingProcessingDiscoveryObjectsBlocks removeAllObjects];
      BOOL forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects = self->_forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects;
      self->_BOOL forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects = 0;
      objc_initWeak(&location, self);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10046892C;
      v6[3] = &unk_100736940;
      v6[4] = self;
      objc_copyWeak(&v7, &location);
      id v5 = objc_retainBlock(v6);
      self->_isEvaluatingRules = 1;
      [(PDDiscoveryManager *)self _queue_performProcessingDiscoveryObjectsShouldForceBadgeCountUpdate:forceUpdateBadgeCountOnNextProcessingOfDiscoveryObjects withCompletionBlocks:v3 finalCompletion:v5];

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_queue_activeDialogRequestSourcedDiscoveryItems:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100020E08;
  v18[4] = sub_1000211F8;
  id v19 = [objc_alloc((Class)NSMutableString) initWithString:@"fetching discovery cards from AMS"];
  id v5 = objc_alloc((Class)AMSEngagementPlacementInfo);
  id v6 = [v5 initWithPlacement:PKEngagementPassesPlacement context:0];
  [v6 setSupportsMultipleMessages:1];
  id v7 = objc_alloc((Class)AMSEngagementMessageEvent);
  id v20 = v6;
  uint64_t v8 = +[NSArray arrayWithObjects:&v20 count:1];
  id v9 = [v7 initWithServiceType:PKEngagementWalletService placementInfo:v8];

  if (([(AMSPromise *)self->_discoveryMessagesPromise isTimedOut] & 1) == 0
    && (![(AMSPromise *)self->_discoveryMessagesPromise isFinished]
     || ([(AMSPromise *)self->_discoveryMessagesPromise isCancelled] & 1) == 0))
  {
    [(AMSPromise *)self->_discoveryMessagesPromise cancel];
  }
  uint64_t v10 = [(AMSEngagement *)self->_AMPEngagement enqueueMessageEvent:v9];
  discoveryMessagesPromise = self->_discoveryMessagesPromise;
  p_discoveryMessagesPromise = &self->_discoveryMessagesPromise;
  *p_discoveryMessagesPromise = (AMSPromise *)v10;

  v13 = *p_discoveryMessagesPromise;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10046A32C;
  v15[3] = &unk_1007532A0;
  long long v17 = v18;
  id v14 = v4;
  id v16 = v14;
  [(AMSPromise *)v13 addFinishBlock:v15];

  _Block_object_dispose(v18, 8);
}

- (void)_queue_performProcessingDiscoveryObjectsShouldForceBadgeCountUpdate:(BOOL)a3 withCompletionBlocks:(id)a4 finalCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100469E4C;
  v25[3] = &unk_10073D508;
  id v10 = v8;
  id v26 = v10;
  id v11 = v9;
  id v27 = v11;
  id v12 = objc_retainBlock(v25);
  id v13 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_100020E08;
  v23[4] = sub_1000211F8;
  id v24 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000A9C8;
  v22[3] = &unk_100730D50;
  v22[4] = self;
  v22[5] = v23;
  [v13 addOperation:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10046A154;
  v20[3] = &unk_100753278;
  BOOL v21 = a3;
  v20[4] = self;
  v20[5] = v23;
  [v13 addOperation:v20];
  id v14 = +[NSNull null];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10046A310;
  v17[3] = &unk_10072E660;
  long long v15 = v12;
  id v18 = v15;
  id v19 = v23;
  id v16 = [v13 evaluateWithInput:v14 completion:v17];

  _Block_object_dispose(v23, 8);
}

- (void)manifestAllowsMiniCardsWithCompletion:(id)a3
{
}

- (void)beginReporingDiscoveryAnalytics
{
}

- (PDDiscoveryManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 ruleManager:(id)a5 accountManager:(id)a6 applyManager:(id)a7 peerPaymentWebServiceCoordinator:(id)a8 transitNotificationService:(id)a9 userNotificationManager:(id)a10 transactionProcessor:(id)a11 pushNotificationManager:(id)a12 notificationStreamManager:(id)a13 deviceEnvironmentStore:(id)a14 delegate:(id)a15
{
  id v89 = a3;
  id v88 = a4;
  id v73 = a5;
  id v87 = a5;
  id v74 = a6;
  id v86 = a6;
  id v75 = a7;
  id v85 = a7;
  id v76 = a8;
  id v84 = a8;
  id v83 = a9;
  id v82 = a10;
  id v81 = a11;
  id v80 = a12;
  id v20 = v89;
  id v79 = a13;
  id v78 = a14;
  id v21 = a15;
  v90.receiver = self;
  v90.super_class = (Class)PDDiscoveryManager;
  v22 = [(PDDiscoveryManager *)&v90 init];
  if (v22)
  {
    v22[200] = PKSharedCacheGetBoolForKey();
    v22[201] = PKSharedCacheGetBoolForKey();
    id v23 = objc_alloc_init((Class)NSMutableArray);
    id v24 = (void *)*((void *)v22 + 26);
    *((void *)v22 + 26) = v23;

    id v25 = objc_alloc_init((Class)NSMutableArray);
    id v26 = (void *)*((void *)v22 + 27);
    *((void *)v22 + 27) = v25;

    *((_DWORD *)v22 + 58) = 0;
    objc_storeStrong((id *)v22 + 1, a3);
    objc_storeStrong((id *)v22 + 2, a4);
    [*((id *)v22 + 2) registerObserver:v22];
    id v27 = objc_alloc((Class)CLLocationManager);
    v28 = PKPassKitCoreBundle();
    v29 = [v28 bundlePath];
    v30 = PDDefaultQueue();
    id v31 = [v27 initWithEffectiveBundlePath:v29 delegate:v22 onQueue:v30];
    v32 = (void *)*((void *)v22 + 22);
    *((void *)v22 + 22) = v31;

    [*((id *)v22 + 22) setDesiredAccuracy:500.0];
    if (v22[200] || v22[201])
    {
      if (PKLocationServicesEnabled())
      {
        v22[202] = 1;
        [*((id *)v22 + 22) startMonitoringSignificantLocationChanges];
      }
    }
    id v33 = objc_alloc_init((Class)CLGeocoder);
    v34 = (void *)*((void *)v22 + 23);
    *((void *)v22 + 23) = v33;

    uint64_t v35 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
    v36 = (void *)*((void *)v22 + 24);
    *((void *)v22 + 24) = v35;

    objc_storeStrong((id *)v22 + 3, v73);
    objc_storeStrong((id *)v22 + 4, v74);
    [*((id *)v22 + 4) registerObserver:v22];
    objc_storeStrong((id *)v22 + 5, v75);
    [*((id *)v22 + 5) registerObserver:v22];
    objc_storeStrong((id *)v22 + 6, v76);
    [*((id *)v22 + 6) registerObserver:v22];
    objc_storeStrong((id *)v22 + 7, a9);
    [*((id *)v22 + 7) registerObserver:v22];
    objc_storeStrong((id *)v22 + 8, a10);
    objc_storeStrong((id *)v22 + 9, a11);
    [*((id *)v22 + 9) registerObserver:v22];
    objc_storeStrong((id *)v22 + 10, a12);
    [*((id *)v22 + 10) registerConsumer:v22];
    v37 = objc_alloc_init(PDDiscoveryAnalytics);
    v38 = (void *)*((void *)v22 + 11);
    *((void *)v22 + 11) = v37;

    objc_storeStrong((id *)v22 + 12, a14);
    id v39 = objc_alloc((Class)NSSet);
    v91[0] = AMSPushActionTypeBadging;
    v91[1] = AMSPushActionTypeGenericNotification;
    v91[2] = AMSPushActionTypeRichNotification;
    v40 = +[NSArray arrayWithObjects:v91 count:3];
    id v41 = [v39 initWithArray:v40];

    id v42 = [objc_alloc((Class)AMSPushConfiguration) initWithEnabledActionTypes:v41];
    [v42 setUserNotificationExtensionId:@"asd-notification-default"];
    +[AMSMetrics disableBackgroundMetrics];
    v43 = +[AMSMediaTask bagSubProfile];
    v44 = +[AMSMediaTask bagSubProfileVersion];
    v45 = +[AMSBag bagForProfile:v43 profileVersion:v44];

    id v46 = [objc_alloc((Class)AMSPushHandler) initWithConfiguration:v42 bag:v45];
    v47 = (void *)*((void *)v22 + 13);
    *((void *)v22 + 13) = v46;

    id v48 = [objc_alloc((Class)AMSEngagement) initWithBag:v45];
    v49 = (void *)*((void *)v22 + 14);
    *((void *)v22 + 14) = v48;

    uint64_t v50 = PKEngagementWalletService;
    [*((id *)v22 + 14) addObserver:v22 placement:PKEngagementAppleCashDashboardPlacement serviceType:PKEngagementWalletService];
    [*((id *)v22 + 14) addObserver:v22 placement:PKEngagementAppleCardDashboardPlacement serviceType:v50];
    [*((id *)v22 + 14) addObserver:v22 placement:PKEngagementPayLaterDashboardPlacement serviceType:v50];
    [*((id *)v22 + 14) addObserver:v22 placement:PKEngagementSavingsDashboardPlacement serviceType:v50];
    [*((id *)v22 + 14) addObserver:v22 placement:PKEngagementPassesPlacement serviceType:v50];
    id v51 = objc_alloc_init((Class)NSMutableDictionary);
    v52 = (void *)*((void *)v22 + 17);
    *((void *)v22 + 17) = v51;

    id v53 = objc_alloc_init((Class)NSMutableDictionary);
    v54 = (void *)*((void *)v22 + 18);
    *((void *)v22 + 18) = v53;

    objc_storeStrong((id *)v22 + 15, a13);
    [*((id *)v22 + 15) registerConsumer:v22];
    objc_storeWeak((id *)v22 + 19, v21);
    v55 = [*((id *)v22 + 2) sharedWebServiceContext];
    v56 = [v55 configuration];
    v57 = PKCurrentRegion();
    uint64_t v58 = [v56 discoveryManifestURLForRegion:v57];
    v59 = (void *)*((void *)v22 + 30);
    *((void *)v22 + 30) = v58;

    *(_WORD *)(v22 + 249) = 0;
    id v60 = objc_alloc_init((Class)NSMutableArray);
    v61 = (void *)*((void *)v22 + 32);
    *((void *)v22 + 32) = v60;

    v62 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v63 = dispatch_queue_create("com.apple.passd.discoverymanager.work", v62);
    v64 = (void *)*((void *)v22 + 33);
    *((void *)v22 + 33) = v63;

    dispatch_queue_t v65 = dispatch_queue_create("com.apple.passd.discoverymanager.reply", v62);
    v66 = (void *)*((void *)v22 + 34);
    *((void *)v22 + 34) = v65;

    *((void *)v22 + 35) = -1;
    v67 = [*((id *)v22 + 1) discoveryItems];
    v22[288] = [v67 count] == 0;

    v68 = [*((id *)v22 + 1) engagementMessages];
    v22[289] = [v68 count] == 0;

    v69 = [*((id *)v22 + 1) discoveryNotifications];
    v22[290] = [v69 count] == 0;

    v70 = (void *)*((void *)v22 + 37);
    *((void *)v22 + 37) = 0;

    PDScheduledActivityClientRegister();
    [*((id *)v22 + 12) registerClient:v22 withIdentifier:0];
    [v22 _scheduleDayChangedEvent];
    [v22 _startup];

    id v20 = v89;
  }

  return (PDDiscoveryManager *)v22;
}

- (void)dealloc
{
  [(PDAccountManager *)self->_accountManager unregisterObserver:self];
  [(PDApplyManager *)self->_applyManager unregisterObserver:self];
  [(PDPeerPaymentWebServiceCoordinator *)self->_peerPaymentWebServiceCoordinator unregisterObserver:self];
  [(PDTransitNotificationService *)self->_transitNotificationService unregisterObserver:self];
  [(PDPaymentTransactionProcessor *)self->_paymentTransactionProcessor unregisterObserver:self];
  [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator unregisterObserver:self];
  PDScheduledActivityClientRemove();
  v3.receiver = self;
  v3.super_class = (Class)PDDiscoveryManager;
  [(PDDiscoveryManager *)&v3 dealloc];
}

- (void)setRulesNeedLocation:(BOOL)a3
{
  if (self->_rulesNeedLocation != a3)
  {
    BOOL v3 = a3;
    self->_rulesNeedLocation = a3;
    PKSharedCacheSetBoolForKey();
    BOOL rulesNeedPlacemark = self->_rulesNeedPlacemark;
    [(PDDiscoveryManager *)self updateMonitoringRequiringLocation:v3 andPlacemarks:rulesNeedPlacemark];
  }
}

- (void)setRulesNeedPlacemark:(BOOL)a3
{
  if (self->_rulesNeedPlacemark != a3)
  {
    BOOL v3 = a3;
    self->_BOOL rulesNeedPlacemark = a3;
    PKSharedCacheSetBoolForKey();
    BOOL rulesNeedLocation = self->_rulesNeedLocation;
    [(PDDiscoveryManager *)self updateMonitoringRequiringLocation:rulesNeedLocation andPlacemarks:v3];
  }
}

- (void)updateMonitoringRequiringLocation:(BOOL)a3 andPlacemarks:(BOOL)a4
{
  BOOL rulesNeedPlacemark = self->_rulesNeedPlacemark;
  self->_BOOL rulesNeedLocation = a3;
  self->_BOOL rulesNeedPlacemark = a4;
  if (self->_isMonitoringSignificantLocationChanges == (a3 || a4))
  {
    if (rulesNeedPlacemark != a4)
    {
      [(PDDiscoveryManager *)self processLocationUpdate];
    }
  }
  else if (a3 || a4)
  {
    if (PKLocationServicesEnabled())
    {
      self->_isMonitoringSignificantLocationChanges = 1;
      locationManager = self->_locationManager;
      [(CLLocationManager *)locationManager startMonitoringSignificantLocationChanges];
    }
  }
  else
  {
    [(CLLocationManager *)self->_locationManager stopMonitoringSignificantLocationChanges];
    self->_isMonitoringSignificantLocationChanges = 0;
  }
}

- (NSSet)identifiersOfExpandedDiscoveryItems
{
  return [(PDDiscoveryAnalytics *)self->_analytics identifiersOfExpandedDiscoveryItems];
}

- (NSSet)identifiersOfDismissedDiscoveryItems
{
  return [(PDDiscoveryAnalytics *)self->_analytics identifiersOfDismissedDiscoveryItems];
}

- (NSSet)identifiersOfTappedDiscoveryItems
{
  return [(PDDiscoveryAnalytics *)self->_analytics identifiersOfTappedDiscoveryItems];
}

- (NSSet)identifiersOfCompletedDiscoveryItems
{
  return [(PDDiscoveryAnalytics *)self->_analytics identifiersOfCompletedDiscoveryItems];
}

- (void)_startup
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10045E9FC;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_paymentWebServiceContextChanged
{
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(PDNotificationStreamRegistrationState);
  if (!PKPassbookIsCurrentlyDeletedByUser())
  {
    id v3 = objc_alloc((Class)NSSet);
    id v4 = objc_msgSend(v3, "initWithObjects:", PDDarwinNotificationFamilyCircleChanged, 0);
    [(PDNotificationStreamRegistrationState *)v2 setNotificationNames:v4 forStream:0];
  }
  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v6 = a3;
  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10045F200;
  v9[3] = &unk_10072E198;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(workQueue, v9);
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  id v7 = a5;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AMS engagement:didUpdateRequest:placement:service:type: received", buf, 2u);
  }

  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10045F3D8;
  v11[3] = &unk_10072E198;
  id v12 = v7;
  id v13 = self;
  id v10 = v7;
  dispatch_async(workQueue, v11);
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v5 = a5;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AMS engagement:handleDialogRequest:completion: recevied", v7, 2u);
  }

  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  id v5 = a5;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AMS engagement:handleEngagementRequest:completion recevied", v7, 2u);
  }

  (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
}

- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3
{
}

- (void)discoveryArticleLayoutForItemWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10045FB8C;
    block[3] = &unk_10072E9D8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)discoveryEngagementMessagesForPassUniqueIdentifier:(id)a3 active:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    workQueue = self->_workQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100460640;
    v11[3] = &unk_100731AD8;
    void v11[4] = self;
    id v12 = v8;
    unint64_t v14 = a4;
    id v13 = v9;
    dispatch_async(workQueue, v11);
  }
}

- (void)dialogRequestsForPlacement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100461070;
  block[3] = &unk_1007315D8;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)dismissDialogRequestWithIdentifier:(id)a3 forPlacement:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004612C4;
  v15[3] = &unk_100730578;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (BOOL)loadDialogRequestsForPlacement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_dialogRequestPromisesByPlacement objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "already fetching AMSEngagementMessageRequests", buf, 2u);
    }
  }
  else
  {
    id v9 = [objc_alloc((Class)AMSEngagementPlacementInfo) initWithPlacement:v6 context:0];
    [v9 setSupportsMultipleMessages:1];
    id v10 = objc_alloc((Class)AMSEngagementMessageEvent);
    v30 = v9;
    id v11 = +[NSArray arrayWithObjects:&v30 count:1];
    id v12 = [v10 initWithServiceType:PKEngagementWalletService placementInfo:v11];

    id v13 = PKLogFacilityTypeGetObject();
    id v14 = (char *)os_signpost_id_generate(v13);
    long long v15 = v13;
    id v16 = v15;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "com.apple.passkit.dashboard.message-fetch", "", buf, 2u);
    }

    id v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "fetching AMSEngagementMessageRequests for placement %{public}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v18 = [(AMSEngagement *)self->_AMPEngagement enqueueMessageEvent:v12];
    [(NSMutableDictionary *)self->_dialogRequestPromisesByPlacement setObject:v18 forKeyedSubscript:v6];

    id v19 = [(NSMutableDictionary *)self->_dialogRequestPromisesByPlacement objectForKeyedSubscript:v6];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1004617DC;
    v22[3] = &unk_100753030;
    id v23 = v6;
    id v20 = v16;
    v27[1] = v14;
    id v24 = v20;
    id v25 = self;
    objc_copyWeak(v27, (id *)buf);
    id v26 = v7;
    [v19 addFinishBlock:v22];

    objc_destroyWeak(v27);
    objc_destroyWeak((id *)buf);
  }
  return v8 == 0;
}

- (void)updateDiscoveryEngagementMessageWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100461F78;
  v13[3] = &unk_100731AD8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, v13);
}

- (void)updateDiscoveryItemWithIdentifier:(id)a3 forAction:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10046226C;
  v13[3] = &unk_100731AD8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, v13);
}

- (void)displayedDiscoveryEngagementMessageWithIdentifier:(id)a3
{
  id v5 = [(PDDatabaseManager *)self->_databaseManager engagementMessageWithIdentifier:a3];
  [v5 incrementViewCount];
  id v4 = [(PDDatabaseManager *)self->_databaseManager updateEngagementMessage:v5];
  [(PDDiscoveryAnalytics *)self->_analytics displayedEngagementMessage:v5];
}

- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  databaseManager = self->_databaseManager;
  id v15 = a3;
  id v18 = [(PDDatabaseManager *)databaseManager discoveryItemWithIdentifier:v15];
  [(PDDiscoveryAnalytics *)self->_analytics displayedDiscoveryItemWithIdentifier:v15 isWelcomeCard:v12 afterSwipingToCard:v11 multipleStoryCardsAvailable:v10 callToAction:a7 cardSize:a8];

  if (!v12)
  {
    [v18 incrementViewCount];
    id v16 = [(PDDatabaseManager *)self->_databaseManager updateDiscoveryItem:v18];
    uint64_t v17 = (uint64_t)[v18 maxViewCount];
    if ([v18 shouldBadge])
    {
      if (v17 <= 0) {
        uint64_t v17 = 5;
      }
      if ((uint64_t)[v18 viewCount] < v17) {
        [(PDUserNotificationManager *)self->_userNotificationManager updateWalletBadgeCount];
      }
    }
  }
}

- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7
{
}

- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5
{
}

- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004626BC;
  v8[3] = &unk_100753058;
  id v9 = self;
  id v10 = a4;
  int64_t v11 = a3;
  int64_t v12 = a5;
  id v7 = v10;
  [(PDDiscoveryManager *)v9 updateDiscoveryItemWithIdentifier:v7 forAction:2 completion:v8];
}

- (void)completedDiscoveryItemCTA
{
  databaseManager = self->_databaseManager;
  id v4 = [(PDDiscoveryAnalytics *)self->_analytics lastTappedCTAItemIdentifier];
  id v6 = [(PDDatabaseManager *)databaseManager discoveryItemWithIdentifier:v4];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained defaultDiscoveryManager:self completedCTAForItem:v6];
  }
  [(PDDiscoveryAnalytics *)self->_analytics completedDiscoveryItemCTA];
}

- (void)removedAllDiscoveryItems
{
}

- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100462810;
  v6[3] = &unk_100750E78;
  id v7 = self;
  id v8 = a3;
  unint64_t v9 = a4;
  id v5 = v8;
  [(PDDiscoveryManager *)v7 discoveryArticleLayoutsWithCompletion:v6];
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5
{
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5
{
}

- (void)endReporingDiscoveryAnalytics
{
}

- (void)fetchWelcomeCardCount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1004629D4;
    v7[3] = &unk_1007422F8;
    v7[4] = self;
    id v8 = v4;
    [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v7];
  }
}

- (void)environmentStore:(id)a3 storedEnvironment:(id)a4 differsFromCurrent:(id)a5 commitBlock:(id)a6
{
  unint64_t v9 = (void (**)(void))a6;
  if ([a5 localeDiffersFromEnvironment:a4]) {
    [(PDDiscoveryManager *)self currentLocaleChanged];
  }
  v9[2]();
}

- (void)passAdded:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received pass added event", buf, 2u);
  }

  +[PKEngagementEventTrigger firePassAddedEvent];
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100462CB4;
  v8[3] = &unk_10072E198;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(workQueue, v8);
}

- (void)passRemoved:(id)a3
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received pass removed event", v4, 2u);
  }

  +[PKEngagementEventTrigger firePassRemovedEvent];
}

- (void)expressPassConfigurationsChanged
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Express pass configs changed", v3, 2u);
  }

  +[PKEngagementEventTrigger fireExpressPassInfoChangedEvent];
}

- (void)familyCircleChanged
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Family circle changed", v3, 2u);
  }

  +[PKEngagementEventTrigger fireFamilyCircleChangedEvent];
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100463384;
  v15[3] = &unk_100730198;
  id v16 = v9;
  id v17 = v10;
  id v18 = self;
  id v19 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(workQueue, v15);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Discovery location Manager error received: %@", (uint8_t *)&v10, 0xCu);
  }

  if (![v6 code])
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v10 = 138412546;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Location Manager %@ unable to retreve location, will retry.", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Discovery location authorization updated: %@", (uint8_t *)&v6, 0xCu);
  }

  if (PKLocationServicesEnabled())
  {
    if (self->_rulesNeedLocation || self->_rulesNeedPlacemark)
    {
      self->_isMonitoringSignificantLocationChanges = 1;
      [(CLLocationManager *)self->_locationManager startMonitoringSignificantLocationChanges];
    }
  }
  else
  {
    [(CLLocationManager *)self->_locationManager stopMonitoringSignificantLocationChanges];
    self->_isMonitoringSignificantLocationChanges = 0;
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 lastObject];
  os_unfair_lock_lock(&self->_lock);
  latestValidLocation = self->_latestValidLocation;
  os_unfair_lock_unlock(&self->_lock);
  [v8 horizontalAccuracy];
  if (v10 < 0.0)
  {
    BOOL v11 = 0;
    if (!latestValidLocation) {
      goto LABEL_6;
    }
LABEL_5:
    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  [v8 horizontalAccuracy];
  BOOL v11 = v12 <= 500.0;
  if (latestValidLocation) {
    goto LABEL_5;
  }
LABEL_6:
  id v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [v8 horizontalAccuracy];
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Discovery manager got location with accuracy: %f", buf, 0xCu);
  }

  [(PDDiscoveryManager *)self _putLatestValidLocationAndNotify:v8];
  if (self->_rulesNeedPlacemark)
  {
    objc_initWeak((id *)buf, self);
    geocoder = self->_geocoder;
    geocodingLocale = self->_geocodingLocale;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100463BB4;
    v17[3] = &unk_1007530A8;
    objc_copyWeak(&v18, (id *)buf);
    void v17[4] = self;
    [(CLGeocoder *)geocoder reverseGeocodeLocation:v8 preferredLocale:geocodingLocale completionHandler:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
LABEL_10:
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 coordinate];
  double v9 = v8;
  double v11 = v10;
  [(CLLocation *)self->_latestValidLocation coordinate];
  double v13 = v12;
  double v15 = v14;
  [v7 horizontalAccuracy];
  double v17 = v16;
  id v18 = [v7 departureDate];
  [v18 timeIntervalSinceNow];
  double v20 = v19;

  if (v20 <= 0.0)
  {
    double v23 = -v20;
  }
  else
  {
    id v21 = [v7 arrivalDate];
    [v21 timeIntervalSinceNow];
    double v23 = -v22;
  }
  v33.latitude = v9;
  v33.longitude = v11;
  if (CLLocationCoordinate2DIsValid(v33))
  {
    BOOL v24 = v9 == v13 || v11 == v15;
    if (!v24 && v17 >= 0.0 && v17 <= 500.0 && v23 <= 3600.0)
    {
      id v25 = objc_alloc((Class)CLLocation);
      id v26 = +[NSDate now];
      id v27 = objc_msgSend(v25, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v26, v9, v11, 0.0, v17, -1.0);

      [(PDDiscoveryManager *)self _putLatestValidLocationAndNotify:v27];
      if (self->_rulesNeedPlacemark)
      {
        objc_initWeak(&location, self);
        geocoder = self->_geocoder;
        geocodingLocale = self->_geocodingLocale;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100463F54;
        v30[3] = &unk_1007530A8;
        objc_copyWeak(&v31, &location);
        v30[4] = self;
        [(CLGeocoder *)geocoder reverseGeocodeLocation:v27 preferredLocale:geocodingLocale completionHandler:v30];
        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)processLocationUpdate
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received location update event", v3, 2u);
  }

  +[PKEngagementEventTrigger fireLocationChangedEvent];
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received account added event", v5, 2u);
  }

  +[PKEngagementEventTrigger fireAccountAddedEvent];
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v17 = a4;
  id v6 = a5;
  +[PKEngagementEventTrigger fireAccountUpdatedEvent];
  id v7 = [v6 creditDetails];
  double v8 = [v7 accountSummary];

  double v9 = [v17 creditDetails];
  double v10 = [v9 accountSummary];

  if (v8 && v10 && [v6 state] == (id)1 && objc_msgSend(v17, "state") == (id)1)
  {
    double v11 = [v8 creditLimit];
    uint64_t v12 = [v10 creditLimit];
    double v13 = (void *)v12;
    if (v11 && v12 && [v11 compare:v12] == (id)-1) {
      +[PKEngagementEventTrigger fireDefaultCreditAccountCreditLimitIncreasedEvent];
    }
    double v14 = [v8 currentBalance];
    if (objc_msgSend(v14, "pk_isPositiveNumber"))
    {
      double v15 = [v10 currentBalance];
      unsigned int v16 = objc_msgSend(v15, "pk_isZeroNumber");

      if (v16) {
        +[PKEngagementEventTrigger fireDefaultCreditAccountBalancePaidInFullEvent];
      }
    }
    else
    {
    }
  }
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received account removed event", v5, 2u);
  }

  +[PKEngagementEventTrigger fireAccountRemovedEvent];
}

- (void)accountManager:(id)a3 didUpdatePromotions:(id)a4 oldPromotions:(id)a5 accountIdentifier:(id)a6
{
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  unint64_t v12 = (unint64_t)a5;
  id v13 = a6;
  if (!(v11 | v12)
    || v11
    && v12
    && (id v14 = [objc_alloc((Class)NSSet) initWithArray:v12],
        id v15 = [objc_alloc((Class)NSSet) initWithArray:v11],
        char v16 = PKEqualObjects(),
        v15,
        v14,
        (v16 & 1) != 0))
  {
    id v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not reprocessing discovery items since no change to account promotions was detected", v19, 2u);
    }
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Reprocessing discovery items after account promotions changed", buf, 2u);
    }

    [(PDDiscoveryManager *)self processDiscoveryItemsAndMessagesWithCompletion:&stru_1007530C8];
  }
}

- (void)accountManager:(id)a3 scheduledPaymentsChangedForAccountIdentifier:(id)a4
{
}

- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  double v8 = [v6 currentBalance];
  double v9 = [v8 amount];
  id v10 = [v7 currentBalance];
  unint64_t v11 = [v10 amount];
  if (![v9 compare:v11])
  {

    goto LABEL_6;
  }
  unint64_t v12 = [v6 currentBalance];
  id v13 = [v12 amount];
  id v14 = +[NSDecimalNumber zero];
  if ([v13 compare:v14])
  {
    [v7 currentBalance];
    id v15 = v24 = v6;
    [v15 amount];
    double v23 = v8;
    v17 = id v16 = v7;
    id v18 = +[NSDecimalNumber zero];
    id v22 = [v17 compare:v18];

    id v7 = v16;
    id v6 = v24;

    if (!v22) {
      goto LABEL_10;
    }
LABEL_6:
    id v19 = [v6 state];
    if (v19 == [v7 state])
    {
      id v20 = [v6 stage];
      if (v20 == [v7 stage]) {
        goto LABEL_13;
      }
    }
    goto LABEL_10;
  }

LABEL_10:
  id v21 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received peer payment account updated event", buf, 2u);
  }

  +[PKEngagementEventTrigger firePeerPaymentAccountUpdatedEvent];
LABEL_13:
}

- (void)applyManager:(id)a3 didAddApplication:(id)a4
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received application added event", v5, 2u);
  }

  +[PKEngagementEventTrigger fireFeatureApplicationAddedEvent];
}

- (void)applyManager:(id)a3 didRemoveApplication:(id)a4
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received application removed event", v5, 2u);
  }

  +[PKEngagementEventTrigger fireFeatureApplicationRemovedEvent];
}

- (void)applyManager:(id)a3 didUpdateApplication:(id)a4 oldApplication:(id)a5
{
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received application updated event", v6, 2u);
  }

  +[PKEngagementEventTrigger fireFeatureApplicationUpdatedEvent];
}

- (void)transitNotificationService:(id)a3 didAddDCINotificationForMarket:(id)a4
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received DCI-notification-for-market added event", v5, 2u);
  }

  +[PKEngagementEventTrigger fireDCINotificationForMarketAddedEvent];
}

- (void)transitNotificationService:(id)a3 didAddOpenLoopUpgradeNotificationForMarket:(id)a4
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received open-loop-upgrade-notification added event", v5, 2u);
  }

  +[PKEngagementEventTrigger fireOpenLoopUpgradeNotificationForMarketAddedEvent];
}

- (void)transitNotificationService:(id)a3 didAddRenotifyNotificationForMarket:(id)a4
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received renotify-notification-for-market added event", v5, 2u);
  }

  +[PKEngagementEventTrigger fireRenotifyNotificationForMarketAddedEvent];
}

- (BOOL)_shouldReprocessForTransaction:(id)a3 previousTransactionProcessingDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 updateReasonIsInitialDownload] & 1) != 0
    || ![v5 fullyProcessed])
  {
    unsigned __int8 v7 = 0;
    if (!v6) {
      goto LABEL_4;
    }
LABEL_6:
    id v9 = objc_alloc_init((Class)NSDate);
    [v9 timeIntervalSinceDate:v6];
    double v11 = v10;

    BOOL v8 = v11 >= 3600.0;
    goto LABEL_7;
  }
  unsigned __int8 v7 = +[PDUserEvaluationEnvironment isTransactionRelevant:v5];
  if (v6) {
    goto LABEL_6;
  }
LABEL_4:
  BOOL v8 = 1;
LABEL_7:
  BOOL v12 = v7 & v8;

  return v12;
}

- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v5 = a3;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100464C38;
  v8[3] = &unk_10072E198;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(workQueue, v8);
}

- (void)currentLocaleChanged
{
  +[PKEngagementEventTrigger fireCurrentLocaleChangedEvent];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100464D6C;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v23 = a4;
  if ([v6 isEqualToString:@"PDDiscoveryManagerSignificantTimeChangeScheduledActivityIdentifier"])
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Running significant time change activity", buf, 2u);
    }

    PDScheduledActivityRemove();
    +[PKEngagementEventTrigger fireDayChangedEvent];
    [(PDDiscoveryManager *)self _scheduleDayChangedEvent];
  }
  else
  {
    unsigned int v8 = [v6 isEqualToString:@"PDDiscoveryManagerUpdateNotificationsActivity"];
    if ((v8 & 1) == 0)
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v32 = (id)objc_opt_class();
        __int16 v33 = 2112;
        id v34 = v6;
        id v10 = v32;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Unknown scheduled activity identifier: %@", buf, 0x16u);
      }
    }
    if (self->_isEvaluatingRules) {
      unsigned int v11 = 0;
    }
    else {
      unsigned int v11 = v8;
    }
    objc_initWeak((id *)buf, self);
    BOOL v12 = +[NSDate date];
    id v13 = +[NSDate dateWithTimeInterval:v12 sinceDate:60.0];

    id v14 = [(PDDatabaseManager *)self->_databaseManager discoveryNotificationsRequiringInsertionForDate:v13];
    id v15 = v14;
    if (v11 && [v14 count])
    {
      id v16 = objc_alloc_init((Class)NSMutableSet);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v17 = v15;
      id v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v27;
        do
        {
          id v20 = 0;
          do
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(v17);
            }
            id v21 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)v20) ruleIdentifier];
            [v16 addObject:v21];

            id v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v18);
      }

      self->_isEvaluatingRules = 1;
      ruleManager = self->_ruleManager;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100465248;
      v24[3] = &unk_100753110;
      objc_copyWeak(&v25, (id *)buf);
      v24[4] = self;
      [(PDRuleManager *)ruleManager evaluateRulesWithIdentifiers:v16 completion:v24];
      objc_destroyWeak(&v25);
    }
    else
    {
      [(PDDiscoveryManager *)self _queue_scheduleTaskForNextAction];
    }

    objc_destroyWeak((id *)buf);
  }
}

- (void)_scheduleDayChangedEvent
{
  v2 = PDScheduledActivityGetCriteria();
  if (!v2)
  {
    id v3 = +[NSDate dateWithTimeIntervalSinceNow:(double)arc4random_uniform(0x5460u) + 86400.0];
    id v4 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:v3];
    [v4 setRequireNetworkConnectivity:1];
    [v4 setReason:@"PDDiscoveryManager significant time change"];
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 debugDescription];
      int v7 = 138412290;
      unsigned int v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "passd scheduling signficant time change activity: %@", (uint8_t *)&v7, 0xCu);
    }
    PDScheduledActivityRegister();
    goto LABEL_7;
  }
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 debugDescription];
    int v7 = 138412290;
    unsigned int v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Signifcant time change already scheduled: %@", (uint8_t *)&v7, 0xCu);
LABEL_7:
  }
}

- (void)fetchUserProperties:(id)a3 withParameters:(id)a4 completion:(id)a5
{
}

- (void)fetchLatestValidLocation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v10 = 0;
    unsigned int v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_100020E08;
    id v14 = sub_1000211F8;
    id v15 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100465744;
    v7[3] = &unk_100751988;
    v7[4] = self;
    id v9 = &v10;
    id v6 = (void (**)(void))v4;
    id v8 = v6;
    [(PDDiscoveryManager *)self _executeWithLock:v7];
    if (v11[5]) {
      v6[2](v6);
    }

    _Block_object_dispose(&v10, 8);
  }
}

- (void)fetchLatestValidPlacemark:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v10 = 0;
    unsigned int v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_100020E08;
    id v14 = sub_1000211F8;
    id v15 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100465908;
    v7[3] = &unk_100751988;
    v7[4] = self;
    id v9 = &v10;
    id v6 = (void (**)(void))v4;
    id v8 = v6;
    [(PDDiscoveryManager *)self _executeWithLock:v7];
    if (v11[5]) {
      v6[2](v6);
    }

    _Block_object_dispose(&v10, 8);
  }
}

- (void)_putLatestValidLocationAndNotify:(id)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100020E08;
  id v20 = sub_1000211F8;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100465B88;
  v12[3] = &unk_100739568;
  id v13 = self;
  id v3 = a3;
  id v14 = v3;
  id v15 = &v16;
  [(PDDiscoveryManager *)v13 _executeWithLock:v12];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v17[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      int v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
        int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v22 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)_putLatestValidPlacemarkAndNotify:(id)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100020E08;
  id v20 = sub_1000211F8;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100465DD8;
  v12[3] = &unk_100739568;
  id v13 = self;
  id v3 = a3;
  id v14 = v3;
  id v15 = &v16;
  [(PDDiscoveryManager *)v13 _executeWithLock:v12];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v17[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      int v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
        int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v22 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)_executeWithLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_startLocationQueryTimeoutIfNecessary
{
  if (!self->_locationTimer)
  {
    objc_initWeak(&location, self);
    id v3 = PDDefaultQueue();
    id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    locationTimer = self->_locationTimer;
    self->_locationTimer = v4;

    uint64_t v6 = self->_locationTimer;
    dispatch_time_t v7 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    long long v8 = self->_locationTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100465FD0;
    handler[3] = &unk_10072E288;
    objc_copyWeak(&v10, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume((dispatch_object_t)self->_locationTimer);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (id)pushNotificationTopics
{
  return +[NSSet setWithObject:@"com.apple.pay.engagement"];
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  if (-[AMSPushHandler shouldHandleNotification:](self->_pushNotificationHandler, "shouldHandleNotification:"))[(AMSPushHandler *)self->_pushNotificationHandler handleNotification:v5]; {
}
  }

- (void)applyPushNotificationToken:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received push token %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateDiscoveryManifestWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1004665DC;
  v4[3] = &unk_10073D508;
  int v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PDDiscoveryManager *)v5 _shouldUpdateDiscoveryManifestWithCompletion:v4];
}

- (void)discoveryItemsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100466740;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)insertDiscoveryItems:(id)a3 discoveryArticleLayouts:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004668FC;
  v15[3] = &unk_100730578;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(workQueue, v15);
}

- (void)insertDiscoveryEngagementMessages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100466B6C;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)removeDiscoveryMessageWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100466D28;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)removeDiscoveryUserNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100466E70;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)fireEngagementEventNamed:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100467250;
  v11[3] = &unk_10072FDC8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, v11);
}

- (void)_shouldUpdateDiscoveryManifestWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004673AC;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_queue_shouldUpdateDiscoveryManifestWithCompletion:(id)a3
{
  id v4 = a3;
  if (off_100807498())
  {
    BOOL isUpdatingDiscoveryManifest = self->_isUpdatingDiscoveryManifest;
    id v6 = PKLogFacilityTypeGetObject();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (isUpdatingDiscoveryManifest)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Already updating Discovery Manifest...", buf, 2u);
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating Discovery Manifest...", buf, 2u);
      }

      self->_BOOL isUpdatingDiscoveryManifest = 1;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100467580;
      v10[3] = &unk_10073D508;
      v10[4] = self;
      id v11 = v4;
      [(PDDiscoveryManager *)self _fetchDiscoverManifestWithCompletion:v10];
    }
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Buddy has not yet completed. Will fetch discovery manifest afterwards.", buf, 2u);
    }

    id v9 = +[NSError errorWithDomain:PKDiscoveryErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
}

- (void)_fetchDiscoverManifestWithCompletion:(id)a3
{
  id v4 = a3;
  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004677B0;
  v7[3] = &unk_1007422F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v7];
}

- (void)_processDiscoveryManifest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100467A74;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)_queue_processDownloadedMessagesManifest:(id)a3
{
  id v4 = a3;
  id v7 = [v4 notifications];
  int v5 = [(PDDiscoveryManager *)self _filterNotificationsForOSAndHardwareVersion:v7];
  [(PDDiscoveryManager *)self _queue_updateWithServerNotifications:v5];
  id v6 = [v4 version];

  self->_currentMessagesBundleVersion = (int64_t)v6;
}

- (void)_queue_processDiscoveryManifest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  databaseManager = self->_databaseManager;
  id v8 = a3;
  BOOL v9 = [(PDDatabaseManager *)databaseManager activeDiscoveryItemRequiringBadgeExistsForRelevantDate:0];
  id v10 = [v8 rules];
  id v11 = [(PDDiscoveryManager *)self _filterRulesForOSVersion:v10];

  ruleManager = self->_ruleManager;
  id v13 = +[NSSet setWithArray:v11];
  [(PDRuleManager *)ruleManager updateWithRules:v13];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100467E40;
  v30[3] = &unk_10073D508;
  v30[4] = self;
  id v14 = v6;
  id v31 = v14;
  id v15 = objc_retainBlock(v30);
  id v16 = [v8 messagesMetadata];

  if (v16)
  {
    uint64_t v17 = [(PDDiscoveryManager *)self _currentMessagesBundleVersion];
    if (v17 >= (uint64_t)[v16 version])
    {
      *(_WORD *)&self->_shouldRestoreDiscoveryItemsStatusFromDefaults = 0;
      self->_shouldRestoreNotificationsStatusFromDefaults = 0;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100467EB4;
      v26[3] = &unk_1007378B8;
      long long v27 = v15;
      [(PDDiscoveryManager *)self _queue_processDiscoveryItemsAndMessagesShouldForceBadgeCountUpdate:v9 completion:v26];
      id v20 = v27;
    }
    else
    {
      id v18 = [v16 messagesBundleURL];
      uint64_t v19 = sub_100467EC4();
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100467F5C;
      v25[3] = &unk_100753188;
      void v25[4] = self;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100467FD0;
      v22[3] = &unk_1007531B0;
      void v22[4] = self;
      BOOL v24 = v9;
      id v23 = v15;
      [(PDDiscoveryManager *)self _fetchAndWriteBundleFromRemoteBundleURL:v18 toLocalBundleURL:v19 processTempBundle:v25 completion:v22];

      id v20 = v23;
    }
  }
  else
  {
    id v21 = [(PDDiscoveryManager *)self _deleteMessagesBundle];
    [(PDDiscoveryManager *)self _queue_updateWithServerEngagementMessages:0];
    [(PDDiscoveryManager *)self _queue_updateWithServerNotifications:0];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100467EA4;
    v28[3] = &unk_1007378B8;
    id v29 = v14;
    [(PDDiscoveryManager *)self _queue_processDiscoveryItemsAndMessagesShouldForceBadgeCountUpdate:v9 completion:v28];
    id v20 = v29;
  }
}

- (void)_processUpdatedNotifications
{
  objc_initWeak(&location, self);
  userNotificationManager = self->_userNotificationManager;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1004681D8;
  v4[3] = &unk_1007531D8;
  void v4[4] = self;
  objc_copyWeak(&v5, &location);
  [(PDUserNotificationManager *)userNotificationManager userNotificationsOfType:27 completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_callDelegateWithLayoutsForUpdatedDiscoveryItemsAndMessages
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004684E4;
  v6[3] = &unk_10072FC20;
  void v6[4] = self;
  [(PDDiscoveryManager *)self discoveryArticleLayoutsWithCompletion:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    replyQueue = self->_replyQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1004685F8;
    v5[3] = &unk_10072E1E8;
    v5[4] = self;
    dispatch_async(replyQueue, v5);
  }
}

- (int64_t)_currentMessagesBundleVersion
{
  int64_t currentMessagesBundleVersion = self->_currentMessagesBundleVersion;
  if (currentMessagesBundleVersion < 0)
  {
    id v4 = sub_100460A80();
    id v9 = 0;
    id v5 = [(PDDiscoveryManager *)self _discoveryMessageManifestFromBundle:v4 withError:&v9];
    id v6 = v9;

    if (v5)
    {
      if (v6)
      {
        id v7 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v11 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to load messages manifest bundle with error: %@", buf, 0xCu);
        }
      }
      else
      {
        self->_int64_t currentMessagesBundleVersion = (int64_t)[v5 version];
      }
    }

    int64_t currentMessagesBundleVersion = self->_currentMessagesBundleVersion;
  }
  return currentMessagesBundleVersion;
}

- (void)_queue_updateWithServerDiscoveryItems:(id)a3
{
  id v7 = a3;
  if (self->_shouldRestoreDiscoveryItemsStatusFromDefaults)
  {
    id v4 = [(PDDatabaseManager *)self->_databaseManager discoveryItems];
    id v5 = [v4 count];

    if (!v5) {
      [(PDDiscoveryManager *)self _queue_restoreDiscoveryItemStatusFromDefaultsIfNecessaryWithServerItems:v7];
    }
    self->_shouldRestoreDiscoveryItemsStatusFromDefaults = 0;
  }
  id v6 = [(PDDatabaseManager *)self->_databaseManager updateDiscoveryItemsWithRemoteItems:v7];
}

- (void)_queue_updateWithServerEngagementMessages:(id)a3
{
  id v7 = a3;
  if (self->_shouldRestoreDiscoveryMessagesStatusFromDefaults)
  {
    id v4 = [(PDDatabaseManager *)self->_databaseManager engagementMessages];
    id v5 = [v4 count];

    if (!v5) {
      [(PDDiscoveryManager *)self _queue_restoreDiscoveryEngagementMessageStatusFromDefaultsIfNecessaryWithServerMessages:v7];
    }
    self->_shouldRestoreDiscoveryMessagesStatusFromDefaults = 0;
  }
  id v6 = [(PDDatabaseManager *)self->_databaseManager updateEngagementMessagesWithRemoteMessages:v7];
}

- (void)_queue_updateWithServerNotifications:(id)a3
{
  id v7 = a3;
  if (self->_shouldRestoreNotificationsStatusFromDefaults)
  {
    id v4 = [(PDDatabaseManager *)self->_databaseManager discoveryNotifications];
    id v5 = [v4 count];

    if (!v5) {
      [(PDDiscoveryManager *)self _queue_restoreDiscoveryNotificationStatusFromDefaultsIfNecessaryWithServerNotifications:v7];
    }
    self->_shouldRestoreNotificationsStatusFromDefaults = 0;
  }
  id v6 = [(PDDatabaseManager *)self->_databaseManager updateDiscoveryNotificationsWithRemoteNotifications:v7];
}

- (void)_queue_processExistingDiscoveryUserNotifications:(id)a3
{
  id v4 = a3;
  id v23 = sub_100460A80();
  id v25 = self;
  long long v27 = [(PDDatabaseManager *)self->_databaseManager discoveryNotificationsThatAreNotExpiredForDate:0 active:0 delivered:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = v4;
  id v28 = [v5 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v28)
  {
    char v22 = 0;
    uint64_t v26 = *(void *)v35;
    id obj = v5;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v8 = [v7 notificationIdentifier];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v9 = v27;
        id v10 = [v9 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v10)
        {
          id v29 = v7;
          uint64_t v11 = *(void *)v31;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v31 != v11) {
                objc_enumerationMutation(v9);
              }
              id v13 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
              id v14 = +[PDDiscoveryUserNotification notificationIdentifierForDiscoveryNotification:v13];
              unsigned int v15 = [v14 isEqualToString:v8];

              if (v15)
              {
                id v10 = v13;
                goto LABEL_16;
              }
            }
            id v10 = [v9 countByEnumeratingWithState:&v30 objects:v42 count:16];
            if (v10) {
              continue;
            }
            break;
          }
LABEL_16:
          id v7 = v29;
        }

        unsigned int v16 = [v7 isActive];
        char v17 = v16;
        if (v10)
        {
          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v18 = v7;
              uint64_t v19 = [v18 discoveryNotification];
              [v10 localizeWithBundle:v23];
              if (([v19 isEqualForDisplayToNotification:v10] & 1) == 0)
              {
                [v18 setDiscoveryNotification:v10];
                [(PDUserNotificationManager *)v25->_userNotificationManager insertUserNotification:v18];
              }
            }
            else
            {
              id v18 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v39 = v25;
                __int16 v40 = 2112;
                id v41 = v7;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: Found user notification that wasn't a discovery notification: %@", buf, 0x16u);
              }
            }
          }
          else if (([v10 isTerminalStatus] & 1) == 0)
          {
            [v10 setStatus:4];
            id v20 = [(PDDatabaseManager *)v25->_databaseManager insertOrUpdateDiscoveryNotification:v10];
            char v22 = 1;
          }
          if (([v10 isDelivered] & 1) == 0)
          {
            id v21 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v39 = v25;
              __int16 v40 = 2112;
              id v41 = v10;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@: Found user notification that wasn't delivered: %@", buf, 0x16u);
            }
          }
        }
        if ((v17 & 1) == 0) {
          [(PDUserNotificationManager *)v25->_userNotificationManager removeUserNotification:v7];
        }
      }
      id v5 = obj;
      id v28 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v28);

    if (v22) {
      [(PDDiscoveryManager *)v25 _queue_updateDiscoveryNotificationsStatusDefaults];
    }
  }
  else
  {
  }
}

- (void)_queue_insertDiscoveryNotificationsIfNecessary
{
  unsigned int v16 = +[NSDate now];
  id v3 = +[NSDate dateWithTimeInterval:v16 sinceDate:60.0];
  id v4 = [(PDDatabaseManager *)self->_databaseManager discoveryNotificationsRequiringInsertionForDate:v3];
  id v5 = v4;
  if (v4)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = v4;
    char v7 = 0;
    char v8 = 0;
    id v9 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v35;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v12 passQualifier] == (id)1) {
            char v8 = 1;
          }
          else {
            v7 |= [v12 passQualifier] == (id)2;
          }
        }
        id v9 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v9);
    }

    objc_initWeak(&location, self);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = sub_100020E08;
    v31[4] = sub_1000211F8;
    id v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_100020E08;
    v29[4] = sub_1000211F8;
    id v30 = 0;
    id v13 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    if (v8)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      id v27[2] = sub_1004692C4;
      v27[3] = &unk_100743A48;
      objc_copyWeak(&v28, &location);
      v27[4] = v31;
      [v13 addOperation:v27];
      objc_destroyWeak(&v28);
    }
    if (v7)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10046956C;
      v25[3] = &unk_100743A48;
      objc_copyWeak(&v26, &location);
      void v25[4] = v29;
      [v13 addOperation:v25];
      objc_destroyWeak(&v26);
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100469814;
    v19[3] = &unk_100753250;
    objc_copyWeak(&v24, &location);
    char v22 = v31;
    id v23 = v29;
    id v20 = v6;
    id v21 = self;
    [v13 addOperation:v19];
    id v14 = +[NSNull null];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100469B04;
    v17[3] = &unk_100730990;
    objc_copyWeak(&v18, &location);
    id v15 = [v13 evaluateWithInput:v14 completion:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v24);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);

    objc_destroyWeak(&location);
  }
}

- (void)_queue_scheduleTaskForNextAction
{
  databaseManager = self->_databaseManager;
  id v4 = +[NSDate date];
  id v5 = [(PDDatabaseManager *)databaseManager nextRelevantDiscoveryNotificationForDate:v4];

  if (v5)
  {
    id v6 = [v5 scheduledDeliveryDate];
    char v7 = +[NSDate now];
    id v8 = [v6 compare:v7];

    if (v8 == (id)1)
    {
      id v9 = [v6 dateByAddingTimeInterval:-30.0];

      uint64_t v10 = v9;
      id v6 = v10;
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        unsigned int v16 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Next scheduled delivery date is in the past. Scheduling for 10m out to let things clean up.", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v10 = +[NSDate dateWithTimeIntervalSinceNow:600.0];
    }
    uint64_t v11 = v10;
    id v13 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:v10];
    PDScheduledActivityRegister();
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      unsigned int v16 = self;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Scheduled task for next action for: %@", (uint8_t *)&v15, 0x16u);
    }

LABEL_13:
    goto LABEL_14;
  }
  if (PDScheduledActivityExists())
  {
    PDScheduledActivityRemove();
    uint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      unsigned int v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Removing scheduled activity because there is no notification scheduled", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_queue_evaluateRulesAndForceBadgeCountUpdate:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v8 = +[NSDate now];
  [(PDDatabaseManager *)self->_databaseManager discoveryNotificationsThatAreNotExpiredForDate:v8 active:0 delivered:2];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v12) ruleIdentifier];
        if (v13) {
          [v7 addObject:v13];
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  objc_initWeak(&location, self);
  ruleManager = self->_ruleManager;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10046A85C;
  v16[3] = &unk_1007532F0;
  v16[4] = self;
  objc_copyWeak(&v18, &location);
  BOOL v19 = a3;
  id v15 = v6;
  id v17 = v15;
  [(PDRuleManager *)ruleManager evaluateRulesWithIdentifiers:v7 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_articleLayoutForDiscoveryItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  if (sub_1004604E0(v6))
  {
    id v15 = 0;
    id v8 = [(PDDiscoveryManager *)self _discoveryArticleLayoutFromBundleForDiscoveryItem:v6 error:&v15];
    id v9 = v15;
    if (v8)
    {
      id v10 = [v8 version];
      if ((uint64_t)v10 >= (uint64_t)[v6 version])
      {
        v7[2](v7, v8, v9);

        goto LABEL_6;
      }
    }
    uint64_t v11 = +[NSFileManager defaultManager];
    id v12 = sub_10046ACDC(v6);
    [v11 removeItemAtURL:v12 error:0];
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10046AD8C;
  v13[3] = &unk_100753318;
  v13[4] = self;
  id v14 = v7;
  [(PDDiscoveryManager *)self _fetchAndWriteBundleForDiscoveryItem:v6 completion:v13];

LABEL_6:
}

- (void)_fetchAndWriteBundleForDiscoveryItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 layoutBundleURL];
  id v9 = sub_10046ACDC(v6);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10046AF80;
  v12[3] = &unk_10073D058;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(PDDiscoveryManager *)self _fetchAndWriteBundleFromRemoteBundleURL:v8 toLocalBundleURL:v9 processTempBundle:0 completion:v12];
}

- (void)_fetchAndWriteBundleFromRemoteBundleURL:(id)a3 toLocalBundleURL:(id)a4 processTempBundle:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10046B12C;
  v19[3] = &unk_100753390;
  id v20 = v10;
  long long v21 = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v19];
}

- (id)_filterRulesForOSVersion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = +[PKOSVersionRequirement fromDeviceVersion];
  id v6 = PKDeviceClass();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "osVersionRequirementRange", (void)v17);
        id v14 = v13;
        if (!v13 || [v13 versionMeetsRequirements:v5 deviceClass:v6]) {
          [v4 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v15 = [v4 copy];
  return v15;
}

- (id)_filterDiscoveryItemsForOSAndHardwareVersion:(id)a3
{
  return [(PDDiscoveryManager *)self _filterDiscoveryObjectsForOSAndHardwareVersion:a3];
}

- (id)_filterEngagementMessagesForOSAndHardwareVersion:(id)a3
{
  return [(PDDiscoveryManager *)self _filterDiscoveryObjectsForOSAndHardwareVersion:a3];
}

- (id)_filterNotificationsForOSAndHardwareVersion:(id)a3
{
  return [(PDDiscoveryManager *)self _filterDiscoveryObjectsForOSAndHardwareVersion:a3];
}

- (id)_filterDiscoveryObjectsForOSAndHardwareVersion:(id)a3
{
  id v3 = a3;
  id v19 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = +[PKOSVersionRequirement fromDeviceVersion];
  id v4 = +[PKDeviceVersion fromCurrentDeviceVersion];
  id v5 = PKDeviceClass();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v10);
        id v12 = [v11 osVersionRange];
        id v13 = v12;
        BOOL v14 = v12 && ![v12 versionMeetsRequirements:v20 deviceClass:v5];
        id v15 = [v11 hardwareVersionRange];
        id v16 = v15;
        if (v15)
        {
          if ((v14 | [v15 matchesDeviceVersion:v4] ^ 1)) {
            goto LABEL_13;
          }
LABEL_12:
          [v19 addObject:v11];
          goto LABEL_13;
        }
        if (!v14) {
          goto LABEL_12;
        }
LABEL_13:

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v17 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v8 = v17;
    }
    while (v17);
  }

  return v19;
}

- (id)_filterEngagementMessagesForViewCount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "maxViewCount", (void)v15);
        if (v11) {
          uint64_t v12 = (uint64_t)v11;
        }
        else {
          uint64_t v12 = 5;
        }
        if ((uint64_t)[v10 viewCount] <= v12 || objc_msgSend(v10, "type") == (id)3) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];
  return v13;
}

- (id)_discoveryArticleLayoutFromBundleForDiscoveryItem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v17 = 0;
  id v6 = objc_alloc((Class)NSBundle);
  id v7 = sub_10046ACDC(v5);
  id v8 = [v6 initWithURL:v7];

  uint64_t v9 = [v8 URLForResource:@"layout" withExtension:@"json"];

  if (!v9)
  {
    +[NSError errorWithDomain:PKDiscoveryErrorDomain code:3 userInfo:0];
    id v11 = 0;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  uint64_t v10 = +[NSData dataWithContentsOfURL:v9 options:0 error:&v17];
  id v11 = 0;
  if (!v17)
  {
    uint64_t v12 = +[NSJSONSerialization JSONObjectWithData:v10 options:0 error:&v17];
    id v11 = 0;
    if (!v17)
    {
      id v11 = [objc_alloc((Class)PKDiscoveryArticleLayout) initWithDictionary:v12];
      if (!v11)
      {
        id v17 = +[NSError errorWithDomain:PKDiscoveryErrorDomain code:4 userInfo:0];
      }
    }
  }
  if (v17)
  {
LABEL_10:
    id v13 = +[NSFileManager defaultManager];
    BOOL v14 = sub_10046ACDC(v5);
    long long v15 = [v14 path];
    [v13 removeItemAtPath:v15 error:0];

    if (a4) {
      *a4 = v17;
    }
  }
LABEL_13:

  return v11;
}

- (id)_discoveryMessageManifestFromBundle:(id)a3 withError:(id *)a4
{
  id v12 = 0;
  id v6 = [a3 URLForResource:@"messages" withExtension:@"json"];
  if (!v6)
  {
    +[NSError errorWithDomain:PKDiscoveryErrorDomain code:3 userInfo:0];
    id v8 = 0;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  id v7 = +[NSData dataWithContentsOfURL:v6 options:0 error:&v12];
  id v8 = 0;
  if (!v12)
  {
    uint64_t v9 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v12];
    id v8 = 0;
    if (!v12) {
      id v8 = [objc_alloc((Class)PKDiscoveryMessagesManifest) initWithDictionary:v9];
    }
  }
  if (v12)
  {
LABEL_9:
    id v10 = [(PDDiscoveryManager *)self _deleteMessagesBundle];
    if (a4) {
      *a4 = v12;
    }
  }
LABEL_11:

  return v8;
}

- (id)_deleteMessagesBundle
{
  id v3 = +[NSFileManager defaultManager];
  self->_int64_t currentMessagesBundleVersion = -1;
  id v4 = sub_100467EC4();
  id v5 = [v4 path];

  if ([v3 fileExistsAtPath:v5])
  {
    id v9 = 0;
    [v3 removeItemAtPath:v5 error:&v9];
    id v6 = v9;
    if (v6)
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error deleting messages bundle: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_cleanArticleLayoutsDirectories
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046C17C;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_queue_restoreDiscoveryItemStatusFromDefaultsIfNecessaryWithServerItems:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 dictionaryForKey:@"PDDiscoveryItemStatus"];
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "restoring from userDefaults for discovery items: %@", buf, 0xCu);
  }

  if ([v6 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10046C6D8;
    v10[3] = &unk_100753420;
    id v11 = v6;
    id v8 = objc_msgSend(v4, "pk_createArrayBySafelyApplyingBlock:", v10);
    if ([v8 count])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "restoring status of discovery items: %@", buf, 0xCu);
      }

      id v9 = [(PDDatabaseManager *)self->_databaseManager setDiscoveryItems:v8];
    }
  }
}

- (void)_queue_updateDiscoveryItemStatusDefaults
{
  id v3 = [(PDDatabaseManager *)self->_databaseManager discoveryItems];
  [(PDDiscoveryManager *)self _updateDiscoveryItemStatusDefaultsForUpdatedItems:v3];
}

- (void)_updateDiscoveryItemStatusDefaultsForUpdatedItems:(id)a3
{
  id v4 = a3;
  if (self->_shouldRestoreDiscoveryItemsStatusFromDefaults)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ignoring update to Discovery Items defaults because they haven't been restored yet", buf, 2u);
    }
  }
  else
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
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
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "isTerminalStatus", (void)v15))
          {
            id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 status]);
            BOOL v14 = [v12 identifier];
            [v6 setObject:v13 forKeyedSubscript:v14];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    [v5 setObject:v6 forKey:@"PDDiscoveryItemStatus"];
  }
}

- (void)_queue_restoreDiscoveryEngagementMessageStatusFromDefaultsIfNecessaryWithServerMessages:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 dictionaryForKey:@"PDDiscoveryEngagementMessageStatus"];
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "restoring from userDefaults for discovery message: %@", buf, 0xCu);
  }

  if ([(PDDiscoveryManager *)v6 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10046CB90;
    v10[3] = &unk_100753448;
    id v11 = v6;
    id v8 = objc_msgSend(v4, "pk_createArrayBySafelyApplyingBlock:", v10);
    if ([v8 count])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = self;
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Restoring status of discovery messages: %@", buf, 0x16u);
      }

      id v9 = [(PDDatabaseManager *)self->_databaseManager updateEngagementMessages:v8];
    }
  }
}

- (void)_queue_updateDiscoveryEngagementMessageStatusDefaults
{
  id v3 = [(PDDatabaseManager *)self->_databaseManager engagementMessages];
  [(PDDiscoveryManager *)self _updateDiscoveryEngagementMessageStatusDefaultsForUpdatedMessages:v3];
}

- (void)_updateDiscoveryEngagementMessageStatusDefaultsForUpdatedMessages:(id)a3
{
  id v4 = a3;
  if (self->_shouldRestoreDiscoveryMessagesStatusFromDefaults)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ignoring update to Discovery Messages defaults because they haven't been restored yet", buf, 2u);
    }
  }
  else
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
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
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "isTerminalStatus", (void)v15))
          {
            id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 status]);
            __int16 v14 = [v12 identifier];
            [v6 setObject:v13 forKeyedSubscript:v14];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    [v5 setObject:v6 forKey:@"PDDiscoveryEngagementMessageStatus"];
  }
}

- (void)_queue_restoreDiscoveryNotificationStatusFromDefaultsIfNecessaryWithServerNotifications:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 dictionaryForKey:@"PDDiscoveryNotificationsStatus"];
  if ([v6 count])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10046CFF0;
    v10[3] = &unk_100753470;
    id v11 = v6;
    id v7 = objc_msgSend(v4, "pk_createArrayBySafelyApplyingBlock:", v10);
    if ([v7 count])
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "restoring status of discovery notifications %@", buf, 0xCu);
      }

      id v9 = [(PDDatabaseManager *)self->_databaseManager updateDiscoveryNotifications:v7];
    }
  }
}

- (void)_queue_updateDiscoveryNotificationsStatusDefaults
{
  id v3 = [(PDDatabaseManager *)self->_databaseManager discoveryNotifications];
  [(PDDiscoveryManager *)self _queue_updateDiscoveryNotificationsStatusDefaultsForUpdatedNotifications:v3];
}

- (void)_queue_updateDiscoveryNotificationsStatusDefaultsForUpdatedNotifications:(id)a3
{
  id v4 = a3;
  if (self->_shouldRestoreNotificationsStatusFromDefaults)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ignoring update to Discovery Notification defaults because they haven't been restored yet", buf, 2u);
    }
  }
  else
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
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
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "isTerminalStatus", (void)v15))
          {
            id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 status]);
            __int16 v14 = [v12 identifier];
            [v6 setObject:v13 forKeyedSubscript:v14];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    [v5 setObject:v6 forKey:@"PDDiscoveryNotificationsStatus"];
  }
}

- (CLLocation)latestValidLocation
{
  return self->_latestValidLocation;
}

- (CLPlacemark)latestValidPlacemark
{
  return self->_latestValidPlacemark;
}

- (BOOL)rulesNeedLocation
{
  return self->_rulesNeedLocation;
}

- (BOOL)rulesNeedPlacemark
{
  return self->_rulesNeedPlacemark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementMessageOverrides, 0);
  objc_storeStrong((id *)&self->_discoveryArticleLayoutOverrides, 0);
  objc_storeStrong((id *)&self->_lastProcessForTransactionUpdateDate, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_pendingProcessingDiscoveryObjectsBlocks, 0);
  objc_storeStrong((id *)&self->_discoveryManifestURL, 0);
  objc_storeStrong((id *)&self->_locationTimer, 0);
  objc_storeStrong((id *)&self->_pendingLatestValidPlacemarkCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingLatestValidLocationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_geocodingLocale, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_latestValidPlacemark, 0);
  objc_storeStrong((id *)&self->_latestValidLocation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dialogRequestPromisesByPlacement, 0);
  objc_storeStrong((id *)&self->_dialogRequestsByPlacement, 0);
  objc_storeStrong((id *)&self->_discoveryMessagesPromise, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
  objc_storeStrong((id *)&self->_AMPEngagement, 0);
  objc_storeStrong((id *)&self->_pushNotificationHandler, 0);
  objc_storeStrong((id *)&self->_deviceEnvironmentStore, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_paymentTransactionProcessor, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_transitNotificationService, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_applyManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_ruleManager, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end