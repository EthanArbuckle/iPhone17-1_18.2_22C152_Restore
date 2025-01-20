@interface NCBulletinNotificationSource
- (BBObserver)observer;
- (BBSettingsGateway)settingsGateway;
- (DNDEventBehaviorResolutionService)eventBehaviorResolutionService;
- (NCBulletinNotificationSource)init;
- (NCBulletinNotificationSource)initWithDispatcher:(id)a3;
- (NCBulletinNotificationSource)initWithDispatcher:(id)a3 observer:(id)a4 queue:(id)a5;
- (NCNotificationDispatcher)dispatcher;
- (NSMutableDictionary)bulletinFeeds;
- (NSMutableDictionary)bulletinsToUUIDs;
- (NSMutableDictionary)sectionInfoById;
- (NSMutableDictionary)uuidsToRequests;
- (id)_alertOptionsWithBehavior:(id)a3;
- (id)_bulletinsPerSectionIdForNotificationRequests:(id)a3;
- (id)_bulletinsToClearPerSectionIdForNotificationRequests:(id)a3 removingDestinations:(id)a4;
- (id)_queue_sectionInfoForBulletin:(id)a3;
- (id)_removalRequestForBulletin:(id)a3 observer:(id)a4 feed:(unint64_t)a5;
- (id)_requestUUIDForBulletinPublisherMatchID:(id)a3;
- (id)_updatedRequestWithAlertOptions:(id)a3;
- (id)dispatcher:(id)a3 notificationRequestForUUID:(id)a4;
- (unint64_t)_updateFeedForCoverSheetDestination:(unint64_t)a3 storedFeed:(unint64_t)a4;
- (void)_applicationIconChanged:(id)a3;
- (void)_modifySectionIdentifier:(id)a3 handler:(id)a4;
- (void)_withdrawRequestFromUI:(id)a3;
- (void)dealloc;
- (void)dispatcher:(id)a3 didExecuteAction:(id)a4 forNotificationRequest:(id)a5;
- (void)dispatcher:(id)a3 requestsClearingNotificationRequests:(id)a4;
- (void)dispatcher:(id)a3 requestsClearingNotificationRequests:(id)a4 fromDestinations:(id)a5;
- (void)dispatcher:(id)a3 requestsClearingNotificationRequestsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6;
- (void)dispatcher:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4;
- (void)dispatcher:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)dispatcher:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)dispatcher:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)dispatcher:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)dispatcher:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)dispatcher:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7;
- (void)dispatcher:(id)a3 setNotificationSystemSettings:(id)a4;
- (void)dispatcher:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)dispatcher:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7;
- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 noteBulletinsLoadedForSectionID:(id)a4;
- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4;
- (void)observer:(id)a3 removeBulletin:(id)a4;
- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 removeSection:(id)a4;
- (void)observer:(id)a3 updateGlobalSettings:(id)a4;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)setBulletinFeeds:(id)a3;
- (void)setBulletinsToUUIDs:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setEventBehaviorResolutionService:(id)a3;
- (void)setObserver:(id)a3;
- (void)setSectionInfoById:(id)a3;
- (void)setSettingsGateway:(id)a3;
- (void)setUuidsToRequests:(id)a3;
@end

@implementation NCBulletinNotificationSource

- (NCBulletinNotificationSource)init
{
  return 0;
}

- (NCBulletinNotificationSource)initWithDispatcher:(id)a3
{
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.UserNotificationsUI.BulletinNotificationSource", v5);

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50CC8]) initWithQueue:v7 calloutQueue:v7];
  v9 = [(NCBulletinNotificationSource *)self initWithDispatcher:v6 observer:v8 queue:v7];

  return v9;
}

- (NCBulletinNotificationSource)initWithDispatcher:(id)a3 observer:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)NCBulletinNotificationSource;
  v12 = [(NCBulletinNotificationSource *)&v33 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a5);
    objc_storeStrong((id *)&v13->_observer, a4);
    [(BBObserver *)v13->_observer setObserverFeed:0xFFFFLL];
    [(BBObserver *)v13->_observer setDelegate:v13];
    objc_storeStrong((id *)&v13->_dispatcher, a3);
    [(NCNotificationDispatcher *)v13->_dispatcher addDispatcherSourceDelegate:v13];
    uint64_t v14 = objc_opt_new();
    sectionInfoById = v13->_sectionInfoById;
    v13->_sectionInfoById = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    bulletinFeeds = v13->_bulletinFeeds;
    v13->_bulletinFeeds = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    bulletinsToUUIDs = v13->_bulletinsToUUIDs;
    v13->_bulletinsToUUIDs = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_opt_new();
    uuidsToRequests = v13->_uuidsToRequests;
    v13->_uuidsToRequests = (NSMutableDictionary *)v20;

    uint64_t v22 = [MEMORY[0x1E4F5F5D8] serviceForClientIdentifier:@"com.apple.springboard.NCBulletinNotificationSource"];
    eventBehaviorResolutionService = v13->_eventBehaviorResolutionService;
    v13->_eventBehaviorResolutionService = (DNDEventBehaviorResolutionService *)v22;

    id v24 = (id)[MEMORY[0x1E4F44778] sharedInstance];
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F50CE8]) initWithQueue:v13->_queue];
    settingsGateway = v13->_settingsGateway;
    v13->_settingsGateway = (BBSettingsGateway *)v25;

    queue = v13->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__NCBulletinNotificationSource_initWithDispatcher_observer_queue___block_invoke;
    block[3] = &unk_1E6A91BB0;
    v28 = v13;
    v32 = v28;
    dispatch_async(queue, block);
    v29 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v29 addObserver:v28 selector:sel__applicationIconChanged_ name:@"com.apple.LaunchServices.applicationIconChanged" object:0];
  }
  return v13;
}

void __66__NCBulletinNotificationSource_initWithDispatcher_observer_queue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) settingsGateway];
  BOOL v3 = [v2 effectiveGlobalScheduledDeliverySetting] == 2;

  v4 = [*(id *)(a1 + 32) settingsGateway];
  BOOL v5 = [v4 effectiveGlobalScheduledDeliverySetting] == -1;

  id v6 = [*(id *)(a1 + 32) settingsGateway];
  BOOL v7 = [v6 effectiveGlobalScheduledDeliveryShowNextSummarySetting] == 2;

  v8 = [*(id *)(a1 + 32) settingsGateway];
  id v9 = [v8 effectiveGlobalScheduledDeliveryTimes];

  id v10 = (void *)MEMORY[0x1E4FB3808];
  id v11 = [*(id *)(a1 + 32) settingsGateway];
  uint64_t v12 = objc_msgSend(v10, "listDisplayStyleSettingForBBNotificationListDisplayStyleSetting:", objc_msgSend(v11, "effectiveGlobalNotificationListDisplayStyleSetting"));

  v13 = [*(id *)(a1 + 32) settingsGateway];
  BOOL v14 = [v13 effectiveGlobalHighlightsSetting] == 2;

  v15 = [MEMORY[0x1E4FB3808] notificationSystemSettingsForScheduledDeliveryEnabled:v3 scheduledDeliveryUninitialized:v5 scheduledDeliveryShowNextSummary:v7 scheduledDeliveryTimes:v9 listDisplayStyleSetting:v12 highlightsEnabled:v14];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__NCBulletinNotificationSource_initWithDispatcher_observer_queue___block_invoke_2;
  v17[3] = &unk_1E6A91A68;
  id v18 = *(id *)(a1 + 32);
  id v19 = v15;
  id v16 = v15;
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

void __66__NCBulletinNotificationSource_initWithDispatcher_observer_queue___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dispatcher];
  [v2 updateNotificationSystemSettings:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(BBObserver *)self->_observer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NCBulletinNotificationSource;
  [(NCBulletinNotificationSource *)&v3 dealloc];
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v46 = a7;
  queue = self->_queue;
  id v14 = a3;
  dispatch_assert_queue_V2(queue);
  v15 = [v12 publisherMatchID];
  id v16 = (void *)*MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    uint64_t v20 = objc_msgSend(v15, "un_logDigest");
    v21 = [v12 sectionID];
    *(_DWORD *)buf = 138544130;
    v55 = v19;
    __int16 v56 = 2114;
    v57 = v20;
    __int16 v58 = 2048;
    unint64_t v59 = a5;
    __int16 v60 = 2114;
    v61 = v21;
    _os_log_impl(&dword_1D7C04000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ adding bulletin %{public}@ for feed %lu in section %{public}@", buf, 0x2Au);
  }
  uint64_t v22 = [(NCBulletinNotificationSource *)self bulletinFeeds];
  v23 = [v22 objectForKey:v15];

  v48 = v15;
  if (v15)
  {
    id v24 = [(NCBulletinNotificationSource *)self bulletinFeeds];
    uint64_t v25 = [v24 objectForKey:v15];

    a5 = -[NCBulletinNotificationSource _updateFeedForCoverSheetDestination:storedFeed:](self, "_updateFeedForCoverSheetDestination:storedFeed:", a5, [v25 unsignedIntegerValue]);
    if (v25)
    {
      v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "unsignedIntegerValue") | a5);
    }
    else
    {
      v26 = [NSNumber numberWithUnsignedInteger:a5];
    }
    v27 = [(NCBulletinNotificationSource *)self bulletinFeeds];
    v28 = [v12 publisherMatchID];
    [v27 setObject:v26 forKey:v28];
  }
  v29 = [(NCBulletinNotificationSource *)self _queue_sectionInfoForBulletin:v12];
  v30 = [v12 publisherMatchID];
  v31 = [(NCBulletinNotificationSource *)self _requestUUIDForBulletinPublisherMatchID:v30];

  BOOL v32 = v8;
  objc_super v33 = [MEMORY[0x1E4FB37F0] notificationRequestForBulletin:v12 observer:v14 sectionInfo:v29 feed:a5 playLightsAndSirens:v8 uuid:v31];

  v34 = [v33 requestDestinations];
  uint64_t v35 = [v34 count];

  if (v35) {
    [(NSMutableDictionary *)self->_uuidsToRequests setObject:v33 forKey:v31];
  }
  v36 = [(NCBulletinNotificationSource *)self _updatedRequestWithAlertOptions:v33];

  BOOL v37 = v32;
  if ((a5 & 0x80B) != 0)
  {
    if (v23)
    {
      v38 = +[NCNotificationEventTracker sharedInstance];
      [v38 modifiedNotificationRequest:v36];
    }
    else
    {
      BOOL v39 = (a5 & 0xA) != 0;
      v38 = [MEMORY[0x1E4FB3800] notificationSectionSettingsForBBSectionInfo:v29];
      v40 = +[NCNotificationEventTracker sharedInstance];
      BOOL v41 = v39;
      BOOL v37 = v32;
      [v40 receivedNotification:v36 withProminence:v41 sectionSettings:v38];
    }
  }
  v42 = [(NCBulletinNotificationSource *)self dispatcher];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__NCBulletinNotificationSource_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke;
  block[3] = &unk_1E6A95218;
  id v50 = v42;
  id v51 = v36;
  id v52 = v47;
  BOOL v53 = v37;
  id v43 = v47;
  id v44 = v36;
  id v45 = v42;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __91__NCBulletinNotificationSource_observer_addBulletin_forFeed_playLightsAndSirens_withReply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) postNotificationWithRequest:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5
{
  queue = self->_queue;
  id v9 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2(queue);
  [(NCBulletinNotificationSource *)self observer:v10 addBulletin:v9 forFeed:a5 playLightsAndSirens:1 withReply:0];
}

- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = [v9 publisherMatchID];
  id v11 = (os_log_t *)MEMORY[0x1E4FB3760];
  id v12 = (void *)*MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    id v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    id v16 = objc_msgSend(v10, "un_logDigest");
    *(_DWORD *)buf = 138543874;
    v38 = v15;
    __int16 v39 = 2114;
    v40 = v16;
    __int16 v41 = 2048;
    unint64_t v42 = a5;
    _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying bulletin %{public}@ for feed %lu", buf, 0x20u);
  }
  v17 = [(NCBulletinNotificationSource *)self bulletinFeeds];
  id v18 = [v17 objectForKey:v10];

  if (v10 && v18)
  {
    id v19 = [(NCBulletinNotificationSource *)self bulletinFeeds];
    uint64_t v20 = [v9 publisherMatchID];
    v21 = [v19 objectForKey:v20];

    if (v21) {
      a5 &= [v21 unsignedIntegerValue];
    }
    unint64_t v22 = -[NCBulletinNotificationSource _updateFeedForCoverSheetDestination:storedFeed:](self, "_updateFeedForCoverSheetDestination:storedFeed:", a5, [v21 unsignedIntegerValue]);
    v23 = [(NCBulletinNotificationSource *)self _queue_sectionInfoForBulletin:v9];
    id v24 = [v9 publisherMatchID];
    uint64_t v25 = [(NCBulletinNotificationSource *)self _requestUUIDForBulletinPublisherMatchID:v24];

    v26 = [MEMORY[0x1E4FB37F0] notificationRequestForBulletin:v9 observer:v8 sectionInfo:v23 feed:v22 uuid:v25];
    [(NSMutableDictionary *)self->_uuidsToRequests setObject:v26 forKey:v25];
    v27 = [(NCBulletinNotificationSource *)self _updatedRequestWithAlertOptions:v26];

    v28 = [(NCBulletinNotificationSource *)self dispatcher];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __64__NCBulletinNotificationSource_observer_modifyBulletin_forFeed___block_invoke;
    v34[3] = &unk_1E6A91A68;
    id v35 = v28;
    id v36 = v27;
    id v29 = v27;
    id v30 = v28;
    dispatch_async(MEMORY[0x1E4F14428], v34);
  }
  else
  {
    os_log_t v31 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v32 = v31;
      objc_super v33 = objc_msgSend(v10, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      v38 = v33;
      _os_log_impl(&dword_1D7C04000, v32, OS_LOG_TYPE_DEFAULT, "Bulletin %{public}@ was not found and can't be modified", buf, 0xCu);
    }
  }
}

uint64_t __64__NCBulletinNotificationSource_observer_modifyBulletin_forFeed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) modifyNotificationWithRequest:*(void *)(a1 + 40)];
}

- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = [v9 publisherMatchID];
  id v11 = (os_log_t *)MEMORY[0x1E4FB3760];
  id v12 = (void *)*MEMORY[0x1E4FB3760];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    id v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    id v16 = objc_msgSend(v10, "un_logDigest");
    int v37 = 138543874;
    v38 = v15;
    __int16 v39 = 2114;
    v40 = v16;
    __int16 v41 = 2048;
    unint64_t v42 = a5;
    _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ removing bulletin %{public}@ for feed %lu", (uint8_t *)&v37, 0x20u);
  }
  v17 = [(NCBulletinNotificationSource *)self bulletinFeeds];
  id v18 = [v17 objectForKey:v10];

  if (v10 && v18)
  {
    id v19 = [(NCBulletinNotificationSource *)self bulletinFeeds];
    uint64_t v20 = [v9 publisherMatchID];
    v21 = [v19 objectForKey:v20];
    uint64_t v22 = [v21 unsignedIntegerValue];

    unint64_t v23 = v22 & ~a5;
    id v24 = [(NCBulletinNotificationSource *)self bulletinFeeds];
    uint64_t v25 = v24;
    if (v23)
    {
      v26 = [NSNumber numberWithUnsignedInteger:v22 & ~a5];
      v27 = [v9 publisherMatchID];
      [v25 setObject:v26 forKey:v27];
    }
    else
    {
      [v24 removeObjectForKey:v10];
    }

    BOOL v32 = [v9 publisherMatchID];
    os_log_t v31 = [(NCBulletinNotificationSource *)self _requestUUIDForBulletinPublisherMatchID:v32];

    objc_super v33 = [(NCBulletinNotificationSource *)self _removalRequestForBulletin:v9 observer:v8 feed:a5];
    [(NCBulletinNotificationSource *)self _withdrawRequestFromUI:v33];
    if (!v23)
    {
      bulletinsToUUIDs = self->_bulletinsToUUIDs;
      id v35 = [v9 publisherMatchID];
      [(NSMutableDictionary *)bulletinsToUUIDs removeObjectForKey:v35];

      if (v31) {
        [(NSMutableDictionary *)self->_uuidsToRequests removeObjectForKey:v31];
      }
      id v36 = +[NCNotificationEventTracker sharedInstance];
      [v36 removedNotificationRequest:v33];
    }
  }
  else
  {
    os_log_t v28 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = v28;
      id v30 = objc_msgSend(v10, "un_logDigest");
      int v37 = 138543362;
      v38 = v30;
      _os_log_impl(&dword_1D7C04000, v29, OS_LOG_TYPE_DEFAULT, "Bulletin %{public}@ was already removed!", (uint8_t *)&v37, 0xCu);
    }
    os_log_t v31 = [(NCBulletinNotificationSource *)self _removalRequestForBulletin:v9 observer:v8 feed:65023];
    [(NCBulletinNotificationSource *)self _withdrawRequestFromUI:v31];
  }
}

- (id)_removalRequestForBulletin:(id)a3 observer:(id)a4 feed:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NCBulletinNotificationSource *)self _queue_sectionInfoForBulletin:v9];
  id v11 = [v9 publisherMatchID];
  id v12 = [(NCBulletinNotificationSource *)self _requestUUIDForBulletinPublisherMatchID:v11];

  v13 = [MEMORY[0x1E4FB37F0] notificationRequestForBulletin:v9 observer:v8 sectionInfo:v10 feed:a5 uuid:v12];

  id v14 = [(NCBulletinNotificationSource *)self _updatedRequestWithAlertOptions:v13];

  return v14;
}

- (void)_withdrawRequestFromUI:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCBulletinNotificationSource *)self dispatcher];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NCBulletinNotificationSource__withdrawRequestFromUI___block_invoke;
  v8[3] = &unk_1E6A91A68;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __55__NCBulletinNotificationSource__withdrawRequestFromUI___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) withdrawNotificationWithRequest:*(void *)(a1 + 40)];
}

- (void)observer:(id)a3 removeBulletin:(id)a4
{
  queue = self->_queue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(queue);
  [(NCBulletinNotificationSource *)self observer:v8 removeBulletin:v7 forFeed:65023];
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = [v5 sectionID];
  id v7 = [(NCBulletinNotificationSource *)self sectionInfoById];
  if ([v5 hasEnabledSettings]) {
    [v7 setObject:v5 forKeyedSubscript:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
  id v8 = [MEMORY[0x1E4FB3800] notificationSectionSettingsForBBSectionInfo:v5];
  id v9 = [(NCBulletinNotificationSource *)self dispatcher];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__NCBulletinNotificationSource_observer_updateSectionInfo___block_invoke;
  v12[3] = &unk_1E6A91A68;
  id v13 = v9;
  id v14 = v8;
  id v10 = v8;
  id v11 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __59__NCBulletinNotificationSource_observer_updateSectionInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNotificationSectionSettings:*(void *)(a1 + 40)];
}

- (void)observer:(id)a3 removeSection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = [(NCBulletinNotificationSource *)self dispatcher];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__NCBulletinNotificationSource_observer_removeSection___block_invoke;
  v9[3] = &unk_1E6A91A68;
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __55__NCBulletinNotificationSource_observer_removeSection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeNotificationSectionWithIdentifier:*(void *)(a1 + 40)];
}

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__NCBulletinNotificationSource_observer_noteServerConnectionStateChanged___block_invoke;
    v7[3] = &unk_1E6A95240;
    v7[4] = self;
    id v8 = v6;
    [v8 getSectionInfoWithCompletion:v7];
  }
}

void __74__NCBulletinNotificationSource_observer_noteServerConnectionStateChanged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) observer:*(void *)(a1 + 40) updateSectionInfo:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [*(id *)(a1 + 40) requestNoticesBulletinsForAllSections];
}

- (void)observer:(id)a3 noteBulletinsLoadedForSectionID:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__NCBulletinNotificationSource_observer_noteBulletinsLoadedForSectionID___block_invoke;
  v7[3] = &unk_1E6A91A68;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __73__NCBulletinNotificationSource_observer_noteBulletinsLoadedForSectionID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dispatcher];
  [v2 notificationsLoadedForSectionIdentifier:*(void *)(a1 + 40)];
}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2(queue);
  uint64_t v7 = [MEMORY[0x1E4FB3808] notificationSystemSettingsForBBGlobalSettings:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__NCBulletinNotificationSource_observer_updateGlobalSettings___block_invoke;
  v9[3] = &unk_1E6A91A68;
  void v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __62__NCBulletinNotificationSource_observer_updateGlobalSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dispatcher];
  [v2 updateNotificationSystemSettings:*(void *)(a1 + 40)];
}

- (void)dispatcher:(id)a3 requestsClearingNotificationRequests:(id)a4
{
  id v5 = [(NCBulletinNotificationSource *)self _bulletinsPerSectionIdForNotificationRequests:a4];
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequests___block_invoke;
  block[3] = &unk_1E6A92FE0;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __80__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequests___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained observer];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = [*(id *)(a1 + 32) objectForKey:v9];
        [v3 clearBulletins:v10 inSection:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)dispatcher:(id)a3 requestsClearingNotificationRequests:(id)a4 fromDestinations:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(NCBulletinNotificationSource *)self _bulletinsPerSectionIdForNotificationRequests:v8];
  id v10 = [(NCBulletinNotificationSource *)self _bulletinsToClearPerSectionIdForNotificationRequests:v8 removingDestinations:v7];

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequests_fromDestinations___block_invoke;
  block[3] = &unk_1E6A935E0;
  objc_copyWeak(&v19, &location);
  id v16 = v7;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __97__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequests_fromDestinations___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v3 = [WeakRetained observer];

  if (([a1[4] containsObject:@"BulletinDestinationLockScreen"] & 1) != 0
    || [a1[4] containsObject:@"BulletinDestinationCoverSheet"])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v4 = [a1[5] allKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v10 = [a1[5] objectForKey:v9];
          [v3 removeBulletins:v10 inSection:v9 fromFeed:8];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v11 = objc_msgSend(a1[6], "allKeys", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * j);
          id v17 = [a1[6] objectForKey:v16];
          [v3 clearBulletins:v17 inSection:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v13);
    }
  }
}

- (void)dispatcher:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequestsInSections___block_invoke;
  block[3] = &unk_1E6A91F48;
  id v9 = v5;
  id v7 = v5;
  objc_copyWeak(&v10, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __90__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequestsInSections___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = (id *)(a1 + 40);
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained(v6);
        id v10 = objc_msgSend(WeakRetained, "observer", (void)v11);

        [v10 clearSection:v8];
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)dispatcher:(id)a3 requestsClearingNotificationRequestsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequestsFromDate_toDate_inSections___block_invoke;
  block[3] = &unk_1E6A935E0;
  objc_copyWeak(&v20, &location);
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(queue, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __106__NCBulletinNotificationSource_dispatcher_requestsClearingNotificationRequestsFromDate_toDate_inSections___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained observer];

  [v3 clearBulletinsFromDate:*(void *)(a1 + 32) toDate:*(void *)(a1 + 40) inSections:*(void *)(a1 + 48)];
}

- (void)dispatcher:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__NCBulletinNotificationSource_dispatcher_setAllowsNotifications_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  BOOL v6 = a4;
  [(NCBulletinNotificationSource *)self _modifySectionIdentifier:a5 handler:v5];
}

uint64_t __87__NCBulletinNotificationSource_dispatcher_setAllowsNotifications_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [a2 setAuthorizationStatus:v2];
}

- (void)dispatcher:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__NCBulletinNotificationSource_dispatcher_setDeliverQuietly_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  BOOL v6 = a4;
  [(NCBulletinNotificationSource *)self _modifySectionIdentifier:a5 handler:v5];
}

uint64_t __82__NCBulletinNotificationSource_dispatcher_setDeliverQuietly_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deliverQuietly:*(unsigned __int8 *)(a1 + 32)];
}

- (void)dispatcher:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__NCBulletinNotificationSource_dispatcher_setMuted_untilDate_forSectionIdentifier_threadIdentifier___block_invoke;
  v15[3] = &unk_1E6A95288;
  BOOL v18 = a4;
  id v16 = v12;
  id v17 = v11;
  id v13 = v11;
  id v14 = v12;
  [(NCBulletinNotificationSource *)self _modifySectionIdentifier:a6 handler:v15];
}

void __100__NCBulletinNotificationSource_dispatcher_setMuted_untilDate_forSectionIdentifier_threadIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    if (v4) {
      [v3 muteThreadIdentifier:v4 untilDate:*(void *)(a1 + 40)];
    }
    else {
      [v3 muteSectionUntilDate:*(void *)(a1 + 40)];
    }
  }
  else if (v4)
  {
    objc_msgSend(v3, "unmuteThreadIdentifier:");
  }
  else
  {
    [v3 unmuteSection];
  }
}

- (void)dispatcher:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__NCBulletinNotificationSource_dispatcher_setAllowsCriticalAlerts_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  BOOL v6 = a4;
  [(NCBulletinNotificationSource *)self _modifySectionIdentifier:a5 handler:v5];
}

uint64_t __88__NCBulletinNotificationSource_dispatcher_setAllowsCriticalAlerts_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  return [a2 setCriticalAlertSetting:v2];
}

- (void)dispatcher:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__NCBulletinNotificationSource_dispatcher_setAllowsTimeSensitive_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  BOOL v6 = a4;
  [(NCBulletinNotificationSource *)self _modifySectionIdentifier:a5 handler:v5];
}

void __87__NCBulletinNotificationSource_dispatcher_setAllowsTimeSensitive_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  id v3 = a2;
  [v3 setTimeSensitiveSetting:v2];
  [v3 setUserConfiguredTimeSensitiveSetting:1];
}

- (void)dispatcher:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__NCBulletinNotificationSource_dispatcher_setAllowsDirectMessages_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  BOOL v6 = a4;
  [(NCBulletinNotificationSource *)self _modifySectionIdentifier:a5 handler:v5];
}

void __88__NCBulletinNotificationSource_dispatcher_setAllowsDirectMessages_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  id v3 = a2;
  [v3 setDirectMessagesSetting:v2];
  [v3 setUserConfiguredDirectMessagesSetting:1];
}

- (void)dispatcher:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__NCBulletinNotificationSource_dispatcher_setScheduledDelivery_forSectionIdentifier___block_invoke;
  v5[3] = &__block_descriptor_33_e23_v16__0__BBSectionInfo_8l;
  BOOL v6 = a4;
  [(NCBulletinNotificationSource *)self _modifySectionIdentifier:a5 handler:v5];
}

void __85__NCBulletinNotificationSource_dispatcher_setScheduledDelivery_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  id v3 = a2;
  [v3 setScheduledDeliverySetting:v2];
  [v3 makeAuthorizationPermanent];
}

- (void)dispatcher:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5
{
  id v7 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__NCBulletinNotificationSource_dispatcher_setSystemScheduledDeliveryEnabled_scheduledDeliveryTimes___block_invoke;
  v10[3] = &unk_1E6A952B0;
  objc_copyWeak(&v12, &location);
  BOOL v13 = a4;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __100__NCBulletinNotificationSource_dispatcher_setSystemScheduledDeliveryEnabled_scheduledDeliveryTimes___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained settingsGateway];

  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [v4 setEffectiveGlobalScheduledDeliverySetting:v3];
  [v4 setEffectiveGlobalScheduledDeliveryTimes:*(void *)(a1 + 32)];
}

- (void)dispatcher:(id)a3 setNotificationSystemSettings:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__NCBulletinNotificationSource_dispatcher_setNotificationSystemSettings___block_invoke;
  block[3] = &unk_1E6A92FE0;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __73__NCBulletinNotificationSource_dispatcher_setNotificationSystemSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained settingsGateway];

  if ([*(id *)(a1 + 32) isScheduledDeliveryEnabled]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [v5 setEffectiveGlobalScheduledDeliverySetting:v3];
  id v4 = [*(id *)(a1 + 32) scheduledDeliveryTimes];
  [v5 setEffectiveGlobalScheduledDeliveryTimes:v4];
  objc_msgSend(v5, "setEffectiveGlobalNotificationListDisplayStyleSetting:", objc_msgSend(MEMORY[0x1E4FB3808], "bbListDisplayStyleSettingForNCNotificationListDisplayStyleSetting:", objc_msgSend(*(id *)(a1 + 32), "listDisplayStyleSetting")));
}

- (void)dispatcher:(id)a3 didExecuteAction:(id)a4 forNotificationRequest:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v9 = +[NCNotificationEventTracker sharedInstance];
  uint64_t v8 = [v7 identifier];

  [v9 executedActionWithIdentifier:v8 forNotificationRequest:v6];
}

- (id)dispatcher:(id)a3 notificationRequestForUUID:(id)a4
{
  if (a4)
  {
    id v5 = [(NSMutableDictionary *)self->_uuidsToRequests objectForKey:a4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_requestUUIDForBulletinPublisherMatchID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_bulletinsToUUIDs objectForKey:v4];
    if (!v5)
    {
      id v5 = objc_opt_new();
      [(NSMutableDictionary *)self->_bulletinsToUUIDs setObject:v5 forKey:v4];
    }
  }
  else
  {
    id v6 = (void *)*MEMORY[0x1E4FB3760];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_ERROR)) {
      -[NCBulletinNotificationSource _requestUUIDForBulletinPublisherMatchID:](v6);
    }
    id v5 = objc_opt_new();
  }

  return v5;
}

- (void)_modifySectionIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__NCBulletinNotificationSource__modifySectionIdentifier_handler___block_invoke;
  v11[3] = &unk_1E6A949B0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __65__NCBulletinNotificationSource__modifySectionIdentifier_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained settingsGateway];

  uint64_t v3 = [v5 sectionInfoForSectionID:*(void *)(a1 + 32)];
  id v4 = (void *)[v3 copy];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [v5 setSectionInfo:v4 forSectionID:*(void *)(a1 + 32)];
}

- (void)_applicationIconChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:@"CFBundleIdentifier"];
    if (v6)
    {
      id v7 = *MEMORY[0x1E4FB3760];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_DEBUG)) {
        -[NCBulletinNotificationSource _applicationIconChanged:]((uint64_t)v6, v7);
      }
      objc_initWeak(&location, self);
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__NCBulletinNotificationSource__applicationIconChanged___block_invoke;
      block[3] = &unk_1E6A92FE0;
      objc_copyWeak(&v11, &location);
      id v10 = v6;
      dispatch_async(queue, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __56__NCBulletinNotificationSource__applicationIconChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained observer];

  [v3 requestNoticesBulletinsForSectionID:*(void *)(a1 + 32)];
}

- (id)_queue_sectionInfoForBulletin:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(NCBulletinNotificationSource *)self sectionInfoById];
  id v7 = [v5 sectionID];

  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)_bulletinsPerSectionIdForNotificationRequests:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "sectionIdentifier", (void)v15);
        id v12 = [v4 objectForKey:v11];
        if (!v12)
        {
          id v12 = objc_opt_new();
          [v4 setObject:v12 forKey:v11];
        }
        id v13 = [v10 bulletin];
        objc_msgSend(v12, "bs_safeAddObject:", v13);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_bulletinsToClearPerSectionIdForNotificationRequests:(id)a3 removingDestinations:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [v12 sectionIdentifier];
        id v14 = [v7 objectForKey:v13];
        long long v15 = [v12 requestDestinations];
        long long v16 = (void *)[v15 mutableCopy];

        [v16 minusSet:v6];
        if (([v16 containsObject:@"BulletinDestinationLockScreen"] & 1) == 0
          && ([v16 containsObject:@"BulletinDestinationNotificationCenter"] & 1) == 0)
        {
          if (!v14)
          {
            id v14 = objc_opt_new();
            [v7 setObject:v14 forKey:v13];
          }
          long long v17 = [v12 bulletin];
          objc_msgSend(v14, "bs_safeAddObject:", v17);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v7;
}

- (unint64_t)_updateFeedForCoverSheetDestination:(unint64_t)a3 storedFeed:(unint64_t)a4
{
  BOOL v4 = (a4 & 8) == 0 || (a3 & 1) == 0;
  unint64_t v5 = a3 | 8;
  if (v4) {
    unint64_t v5 = a3;
  }
  return v5 | a4 & ((v5 & 8) != 0);
}

- (id)_updatedRequestWithAlertOptions:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 eventBehavior];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(DNDEventBehaviorResolutionService *)self->_eventBehaviorResolutionService nc_behaviorForNotificationRequest:v4];
  }
  uint64_t v8 = v7;

  uint64_t v9 = [(NCBulletinNotificationSource *)self _alertOptionsWithBehavior:v8];
  uint64_t v10 = (void *)[v4 mutableCopy];
  [v10 setAlertOptions:v9];
  id v11 = (void *)[v10 copy];

  return v11;
}

- (id)_alertOptionsWithBehavior:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FB37A8]);
  uint64_t v5 = [v3 interruptionSuppression];
  if ((unint64_t)(v5 - 1) >= 2)
  {
    [v4 setSuppression:0];
    uint64_t v9 = [v3 intelligentBehavior];
    if ((unint64_t)(v9 - 1) >= 3) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v9;
    }
    [v4 setIntelligentBehavior:v10];
    unint64_t v11 = [v3 resolutionReason] - 13;
    if (v11 > 6) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = qword_1D7D95F90[v11];
    }
  }
  else
  {
    [v4 setSuppression:v5];
    uint64_t v6 = [v3 intelligentBehavior];
    if ((unint64_t)(v6 - 1) >= 3) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v6;
    }
    [v4 setIntelligentBehavior:v7];
    uint64_t v8 = 0;
  }
  [v4 setReason:v8];
  id v12 = [v3 activeModeUUID];
  [v4 setActiveModeUUID:v12];

  id v13 = (void *)[v4 copy];

  return v13;
}

- (BBObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (BBSettingsGateway)settingsGateway
{
  return self->_settingsGateway;
}

- (void)setSettingsGateway:(id)a3
{
}

- (NCNotificationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
}

- (NSMutableDictionary)sectionInfoById
{
  return self->_sectionInfoById;
}

- (void)setSectionInfoById:(id)a3
{
}

- (NSMutableDictionary)bulletinFeeds
{
  return self->_bulletinFeeds;
}

- (void)setBulletinFeeds:(id)a3
{
}

- (NSMutableDictionary)bulletinsToUUIDs
{
  return self->_bulletinsToUUIDs;
}

- (void)setBulletinsToUUIDs:(id)a3
{
}

- (NSMutableDictionary)uuidsToRequests
{
  return self->_uuidsToRequests;
}

- (void)setUuidsToRequests:(id)a3
{
}

- (DNDEventBehaviorResolutionService)eventBehaviorResolutionService
{
  return self->_eventBehaviorResolutionService;
}

- (void)setEventBehaviorResolutionService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBehaviorResolutionService, 0);
  objc_storeStrong((id *)&self->_uuidsToRequests, 0);
  objc_storeStrong((id *)&self->_bulletinsToUUIDs, 0);
  objc_storeStrong((id *)&self->_bulletinFeeds, 0);
  objc_storeStrong((id *)&self->_sectionInfoById, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_observer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_requestUUIDForBulletinPublisherMatchID:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D7C04000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Requested uuid for bulletin without a publisherMatchID", (uint8_t *)&v4, 0xCu);
}

- (void)_applicationIconChanged:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_DEBUG, "App icon changed for section %{public}@. Requesting repost of notifications for this section.", (uint8_t *)&v2, 0xCu);
}

@end