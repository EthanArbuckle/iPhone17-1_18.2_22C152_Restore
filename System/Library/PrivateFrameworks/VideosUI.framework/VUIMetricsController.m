@interface VUIMetricsController
+ (id)_baseToVPAFMapping;
+ (id)sharedInstance;
- (BOOL)_isSiri;
- (BOOL)isInDebugMode;
- (BOOL)perfEventPublishingEnabled;
- (BOOL)shouldFlushMetrics;
- (BOOL)shouldPostAppLaunchData;
- (NSDictionary)baseFields;
- (NSDictionary)baseFieldsForVPAF;
- (NSDictionary)cachedEnterEvent;
- (NSDictionary)cachedOpenUrlData;
- (NSDictionary)iTunesVPAF;
- (NSDictionary)lastEventData;
- (NSDictionary)profileSelectorPageMetrics;
- (NSDictionary)sidebarPageMetrics;
- (NSDictionary)tabBarPageMetrics;
- (NSHashTable)savedRecentEvents;
- (NSMutableArray)cachedGroupEvents;
- (NSMutableArray)cachedUnifiedMessagingImpressions;
- (NSString)currentTabIdentifier;
- (NSString)exitEventDestinationUrl;
- (NSString)lastEventType;
- (NSString)lastTabIdentifier;
- (OS_dispatch_queue)metricsDataDispatchSQ;
- (VUIMetricsController)init;
- (VUIMetricsLocalRecorder)localMetricsRecorder;
- (VUIMetricsPageEventData)gdprCachedPageEvent;
- (VUIMetricsPageEventData)lastRecordedPageEventData;
- (VUIScopedBackgroundTask)backgroundTask;
- (id)_createDataAddingBaseAndPageFieldsToEventData:(id)a3 forEventType:(id)a4;
- (id)_getCurrentMetricsTopic;
- (id)_getLocationAuthorizationStatus;
- (id)_processPageFields:(id)a3 forEventType:(id)a4;
- (id)createEventTime;
- (id)extractPageMetricsFromEventData:(id)a3;
- (id)getBasePerfData:(BOOL)a3;
- (id)getMetricsEnhancedBuyParams:(id)a3;
- (id)getMetricsOverlayForBundleOffer;
- (id)getMetricsOverlayForWebContainer;
- (id)getRecentEventsForDebuggerUI;
- (id)iTunesLibraryPlaybackMediaMetricsForAdamID:(id)a3 mediaType:(id)a4;
- (void)_handleGroupActivitiesSessionStateChange:(id)a3;
- (void)_handleServerConfigChange:(id)a3;
- (void)_handleTabBarChange:(id)a3;
- (void)_handleWLKAppLibChange:(id)a3;
- (void)_handleWLKLocationManagerChange:(id)a3;
- (void)_handleWLKSettingsDidChange:(id)a3;
- (void)_initializeBaseFields;
- (void)_recordEnter:(id)a3;
- (void)_recordEvent:(id)a3 withEventData:(id)a4;
- (void)_recordEventWithJet:(id)a3 withEventData:(id)a4;
- (void)_recordExit:(id)a3;
- (void)_removeBaseFieldsForKeys:(id)a3;
- (void)_saveRecentEvents:(id)a3;
- (void)_setGDPRConsentStatus:(BOOL)a3;
- (void)_updateBaseFieldsWithData:(id)a3;
- (void)cacheUMImpression:(id)a3;
- (void)flushMetrics;
- (void)forceGDPRConsentStatus:(BOOL)a3;
- (void)recordAppBecameActive;
- (void)recordAppLaunched;
- (void)recordAppWillBackground;
- (void)recordAppWillTerminate;
- (void)recordClick:(id)a3;
- (void)recordDialog:(id)a3;
- (void)recordImpressions:(id)a3;
- (void)recordLog:(id)a3;
- (void)recordMedia:(id)a3;
- (void)recordOpenUrlLaunchWithExtURL:(id)a3 andOptions:(id)a4;
- (void)recordPage:(id)a3;
- (void)recordPageChange:(id)a3;
- (void)recordPerfEvent:(id)a3;
- (void)recordRawEvent:(id)a3;
- (void)recordSearch:(id)a3;
- (void)registerForBaseFieldChanges;
- (void)setBackgroundTask:(id)a3;
- (void)setBaseFields:(id)a3;
- (void)setCachedEnterEvent:(id)a3;
- (void)setCachedGroupEvents:(id)a3;
- (void)setCachedOpenUrlData:(id)a3;
- (void)setCachedUnifiedMessagingImpressions:(id)a3;
- (void)setExitEventDestinationUrl:(id)a3;
- (void)setGdprCachedPageEvent:(id)a3;
- (void)setIsInDebugMode:(BOOL)a3;
- (void)setLastEventData:(id)a3;
- (void)setLastEventType:(id)a3;
- (void)setLastRecordedPageEventData:(id)a3;
- (void)setLastTabIdentifier:(id)a3;
- (void)setLocalMetricsRecorder:(id)a3;
- (void)setMetricsDataDispatchSQ:(id)a3;
- (void)setSavedRecentEvents:(id)a3;
- (void)setShouldFlushMetrics:(BOOL)a3;
- (void)setShouldPostAppLaunchData:(BOOL)a3;
- (void)setupMetricsController;
- (void)updateGDPRConsentStatus;
@end

@implementation VUIMetricsController

- (void)recordPerfEvent:(id)a3
{
  id v4 = a3;
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__VUIMetricsController_recordPerfEvent___block_invoke;
  v7[3] = &unk_1E6DF3F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(metricsDataDispatchSQ, v7);
}

void __38__VUIMetricsController_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = VUISignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MetricsController.Init", "", buf, 2u);
  }

  id v3 = objc_alloc_init(*(Class *)(a1 + 32));
  id v4 = (void *)sharedInstance_sharedInstance_498;
  sharedInstance_sharedInstance_498 = (uint64_t)v3;

  v5 = VUISignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MetricsController.Init", "", v6, 2u);
  }
}

- (VUIMetricsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)VUIMetricsController;
  v2 = [(VUIMetricsController *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(VUIMetricsController *)v2 setupMetricsController];
  }
  return v3;
}

- (void)setupMetricsController
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self->_isAppJustLaunched = 1;
  *(_WORD *)&self->_shouldRecordEnter = 1;
  id v3 = (const char *)VUIMetrics_serialQueueLabel;
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  objc_super v5 = (OS_dispatch_queue *)dispatch_queue_create(v3, v4);
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  self->_metricsDataDispatchSQ = v5;

  self->_isInternalBuild = os_variant_has_internal_content();
  v7 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:0 capacity:30];
  savedRecentEvents = self->_savedRecentEvents;
  self->_savedRecentEvents = v7;

  v9 = [VUIMetricsLocalRecorder alloc];
  v10 = +[VUIMetricsDiskManager sharedInstance];
  v11 = [(VUIMetricsLocalRecorder *)v9 initWithStorageManager:v10];
  localMetricsRecorder = self->_localMetricsRecorder;
  self->_localMetricsRecorder = v11;

  self->_BOOL isGDPRConsented = [MEMORY[0x1E4F4DBA8] acknowledgementNeededForPrivacyIdentifier:@"com.apple.onboarding.tvapp"] ^ 1;
  v13 = VUIDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    BOOL isGDPRConsented = self->_isGDPRConsented;
    *(_DWORD *)buf = 67109120;
    BOOL v22 = isGDPRConsented;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_INFO, "VUIMetricsController: setupMetricsController; GDPR Consented=%d",
      buf,
      8u);
  }

  dispatch_async((dispatch_queue_t)self->_metricsDataDispatchSQ, &__block_literal_global_125);
  v15 = [MEMORY[0x1E4F1CA48] array];
  cachedGroupEvents = self->_cachedGroupEvents;
  self->_cachedGroupEvents = v15;

  v17 = (NSMutableArray *)objc_opt_new();
  cachedUnifiedMessagingImpressions = self->_cachedUnifiedMessagingImpressions;
  self->_cachedUnifiedMessagingImpressions = v17;

  v19 = self->_metricsDataDispatchSQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VUIMetricsController_setupMetricsController__block_invoke_2;
  block[3] = &unk_1E6DF3D58;
  block[4] = self;
  dispatch_async(v19, block);
  [(VUIMetricsController *)self registerForBaseFieldChanges];
}

- (void)registerForBaseFieldChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleTabBarChange_ name:@"TVAppRootViewControllerCurrentNavigationControllerDidChangeNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__handleServerConfigChange_ name:*MEMORY[0x1E4FB5208] object:0];

  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__handleWLKSettingsDidChange_ name:*MEMORY[0x1E4FB52A8] object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__handleWLKAppLibChange_ name:*MEMORY[0x1E4FB51E0] object:0];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__handleWLKLocationManagerChange_ name:*MEMORY[0x1E4FB5250] object:0];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__handleGroupActivitiesSessionStateChange_ name:@"GroupActivitiesSessionStateDidChangeNotification" object:0];
}

- (void)_handleTabBarChange:(id)a3
{
  id v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKey:@"VUIMetricsTabBarItemNotificationKey"];

  if ([v5 length])
  {
    objc_storeStrong((id *)&self->_currentTabIdentifier, v5);
    metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__VUIMetricsController__handleTabBarChange___block_invoke;
    v7[3] = &unk_1E6DF3F68;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(metricsDataDispatchSQ, v7);
  }
}

void __44__VUIMetricsController__handleTabBarChange___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = @"pageContext";
  v5[0] = v1;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 _updateBaseFieldsWithData:v3];
}

void __51__VUIMetricsController__recordEvent_withEventData___block_invoke(id *a1)
{
  if ([a1[4] isEqualToString:@"page"])
  {
    v2 = objc_msgSend(a1[5], "vui_stringForKey:", @"pageContext");
    if (([v2 isEqualToString:@"tab"] & 1) == 0)
    {
      id v3 = objc_msgSend(a1[5], "vui_stringForKey:", @"pageContext");
      if ([v3 isEqualToString:@"tabBar"])
      {
      }
      else
      {
        id v4 = objc_msgSend(a1[5], "vui_stringForKey:", @"pageType");
        char v5 = [v4 isEqualToString:@"PreRoll"];

        if (v5) {
          goto LABEL_8;
        }
        v2 = +[VUIMetricsPageEventData createWithMetricsData:a1[5]];
        [a1[6] setLastRecordedPageEventData:v2];
      }
    }
  }
LABEL_8:
  id v8 = [a1[6] _createDataAddingBaseAndPageFieldsToEventData:a1[5] forEventType:a1[4]];
  if ([a1[4] isEqualToString:@"pageRender"])
  {
    id v6 = [MEMORY[0x1E4FB3C80] sharedInstance];
    int v7 = [v6 pagePerformanceEnabled];

    if (v7) {
      [*((id *)a1[6] + 16) recordPagePerfRenderEventWithVuiDictionary:v8];
    }
  }
  else
  {
    [a1[6] _recordEventWithJet:a1[4] withEventData:v8];
  }
}

- (void)_recordEventWithJet:(id)a3 withEventData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_isGDPRConsented)
  {
    v9 = @"xp_amp_tv_unidentified";
    goto LABEL_9;
  }
  if (![v6 isEqualToString:@"pageRender"])
  {
    if ([v6 isEqualToString:@"log"]) {
      v9 = @"xp_amp_tv_log";
    }
    else {
      v9 = @"xp_amp_tv_main";
    }
LABEL_9:
    id v8 = [(VUIMetricsController *)self lastRecordedPageEventData];
    v10 = objc_msgSend(v7, "vui_stringForKey:", @"pageType");
    if ([v10 isEqualToString:@"PreRoll"])
    {
    }
    else
    {
      v11 = objc_msgSend(v7, "vui_stringForKey:", @"pageType");
      int v12 = [v11 isEqualToString:@"MediaPlayer"];

      if (!v12)
      {
        v17 = objc_msgSend(v7, "vui_stringForKey:", @"pageType");
        int v18 = [v17 isEqualToString:@"Tab"];

        if (v18)
        {
          uint64_t v13 = [(VUIMetricsController *)self sidebarPageMetrics];
        }
        else
        {
          v19 = objc_msgSend(v7, "vui_stringForKey:", @"pageType");
          int v20 = [v19 isEqualToString:@"TabBar"];

          if (v20)
          {
            uint64_t v13 = [(VUIMetricsController *)self tabBarPageMetrics];
          }
          else
          {
            v21 = objc_msgSend(v7, "vui_stringForKey:", @"pageType");
            int v22 = [v21 isEqualToString:@"ProfileSelector"];

            if (!v22)
            {
              if (v8)
              {
                uint64_t v23 = [v8 generateMetricsDataDictionary];
                v14 = [(VUIMetricsController *)self _processPageFields:v23 forEventType:v6];
              }
              else
              {
                v14 = (void *)MEMORY[0x1E4F1CC08];
              }
              goto LABEL_14;
            }
            uint64_t v13 = [(VUIMetricsController *)self profileSelectorPageMetrics];
          }
        }
LABEL_13:
        v14 = (void *)v13;
LABEL_14:
        v15 = +[VUIMetricsJetEngine sharedInstance];
        v16 = [v15 recordEventWithTopic:v9 eventType:v6 eventData:v7 pageData:v14];

        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke;
        v24[3] = &unk_1E6DF83C8;
        v24[4] = self;
        [v16 addFinishBlock:v24];

        goto LABEL_15;
      }
    }
    uint64_t v13 = [(VUIMetricsController *)self extractPageMetricsFromEventData:v7];
    goto LABEL_13;
  }
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "Tried to publish render event to Jet which should be handled by PageRenderMetricsPresenter. Ignoring.", buf, 2u);
  }
LABEL_15:
}

- (VUIMetricsPageEventData)lastRecordedPageEventData
{
  return self->_lastRecordedPageEventData;
}

- (id)_processPageFields:(id)a3 forEventType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 isEqualToString:@"enter"] & 1) != 0
    || [v6 isEqualToString:@"exit"])
  {
    id v7 = [v5 objectForKey:@"sharedContent"];

    if (v7)
    {
      id v8 = (void *)[v5 mutableCopy];
      [v8 removeObjectForKey:@"sharedContent"];
      uint64_t v9 = [v8 copy];

      id v5 = (id)v9;
    }
  }

  return v5;
}

- (id)_createDataAddingBaseAndPageFieldsToEventData:(id)a3 forEventType:(id)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = v6;
  if (v5) {
    [v6 addEntriesFromDictionary:v5];
  }
  if (self->_baseFields) {
    objc_msgSend(v7, "addEntriesFromDictionary:");
  }
  id v8 = objc_msgSend(v5, "vui_stringForKey:", @"pageContext");
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v11 = [(VUIMetricsPageEventData *)self->_lastRecordedPageEventData eventData];
    objc_msgSend(v11, "vui_stringForKey:", @"pageContext");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![v10 length])
  {
    if ([(VUIMetricsController *)self _isSiri])
    {
      int v12 = @"siri";
    }
    else
    {
      uint64_t v13 = [(VUIMetricsController *)self baseFields];
      uint64_t v14 = [v13 objectForKey:@"pageContext"];

      v15 = &stru_1F3E921E0;
      if (v14) {
        v15 = (__CFString *)v14;
      }
      int v12 = v15;

      id v10 = (id)v14;
    }

    id v10 = v12;
  }
  [v7 setObject:v10 forKey:@"pageContext"];
  v16 = objc_msgSend(v5, "vui_dictionaryForKey:", @"pageDetails");
  if ([v16 count]) {
    [v7 setObject:v16 forKey:@"pageDetails"];
  }
  v17 = [v5 objectForKey:@"resourceRevNum"];

  if (!v17)
  {
    int v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v19 = [v18 stringForKey:@"jsVersion"];

    objc_msgSend(v7, "vui_setObjectIfNotNil:forKey:", v19, @"resourceRevNum");
  }

  return v7;
}

- (BOOL)_isSiri
{
  return 0;
}

- (void)_recordEvent:(id)a3 withEventData:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(VUIMetricsController *)self isInDebugMode])
  {
    id v8 = [(VUIMetricsController *)self baseFields];
    int v9 = objc_msgSend(v8, "vui_BOOLForKey:defaultValue:", @"sharedActivity", 0);

    id v10 = [(VUIMetricsController *)self baseFields];
    v11 = objc_msgSend(v10, "vui_numberForKey:", @"sharedActivityDevicesCurrent");
    uint64_t v12 = [v11 integerValue];

    if (v12) {
      int v13 = 0;
    }
    else {
      int v13 = v9;
    }
    if (v13 == 1)
    {
      uint64_t v14 = (VUIScopedBackgroundTask *)[v7 mutableCopy];
      v15 = [(VUIMetricsController *)self createEventTime];
      [(VUIScopedBackgroundTask *)v14 setValue:v15 forKey:@"eventTime"];
      v16 = VUIDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v27 = v6;
        __int16 v28 = 2112;
        v29 = v15;
        _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_INFO, "VUIMetricsController: caching %@ event with timestamp %@  until shared activity data is available", buf, 0x16u);
      }

      v17 = self;
      objc_sync_enter(v17);
      int v18 = [[VUICachedMetricsEvent alloc] initWithEventType:v6 eventData:v7];
      v19 = [(VUIMetricsController *)v17 cachedGroupEvents];
      [v19 addObject:v18];

      objc_sync_exit(v17);
    }
    else
    {
      if (([v6 isEqualToString:@"pageRender"] & 1) == 0
        && ([v6 isEqualToString:@"log"] & 1) == 0)
      {
        [(VUIMetricsController *)self setLastEventType:v6];
        [(VUIMetricsController *)self setLastEventData:v7];
      }
      int v20 = [(VUIMetricsController *)self currentTabIdentifier];
      [(VUIMetricsController *)self setLastTabIdentifier:v20];

      uint64_t v14 = [[VUIScopedBackgroundTask alloc] initWithIdentifier:@"VUIMetricsBackgroundTask" expirationHandler:0];
      [(VUIMetricsController *)self setBackgroundTask:v14];
      metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__VUIMetricsController__recordEvent_withEventData___block_invoke;
      block[3] = &unk_1E6DF45D8;
      id v23 = v6;
      id v24 = v7;
      v25 = self;
      dispatch_async(metricsDataDispatchSQ, block);

      v15 = v23;
    }
  }
}

- (NSString)currentTabIdentifier
{
  return self->_currentTabIdentifier;
}

- (void)_updateBaseFieldsWithData:(id)a3
{
  id v8 = a3;
  id v4 = [(VUIMetricsController *)self baseFields];

  if (!v4) {
    [(VUIMetricsController *)self _initializeBaseFields];
  }
  id v5 = [(VUIMetricsController *)self baseFields];
  id v6 = (void *)[v5 mutableCopy];

  if (v8) {
    [v6 addEntriesFromDictionary:v8];
  }
  id v7 = (void *)[v6 copy];
  [(VUIMetricsController *)self setBaseFields:v7];
}

- (NSDictionary)baseFields
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_baseFields;
  objc_sync_exit(v2);

  return v3;
}

- (void)setBaseFields:(id)a3
{
  id v4 = (NSDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  baseFields = obj->_baseFields;
  obj->_baseFields = v4;

  objc_sync_exit(obj);
}

- (void)setLastTabIdentifier:(id)a3
{
}

- (BOOL)isInDebugMode
{
  return self->_isInDebugMode;
}

- (void)setBackgroundTask:(id)a3
{
}

- (void)setLastEventType:(id)a3
{
}

- (void)setLastEventData:(id)a3
{
}

- (void)_recordEnter:(id)a3
{
  if (self->_shouldRecordEnter)
  {
    [(VUIMetricsController *)self _recordEvent:@"enter" withEventData:a3];
    *(_WORD *)&self->_shouldRecordEnter = 256;
    self->_isAppJustLaunched = 0;
  }
}

void __40__VUIMetricsController_recordPerfEvent___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    id v7 = (id)[*(id *)(a1 + 40) mutableCopy];
    v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "shouldPostAppLaunchData"));
    [v7 setValue:v2 forKey:@"isAppLaunch"];

    if ([*(id *)(a1 + 32) shouldPostAppLaunchData])
    {
      [*(id *)(a1 + 32) setShouldPostAppLaunchData:0];
      id v3 = *(id *)(a1 + 32);
      objc_sync_enter(v3);
      id v4 = +[VUIPerfMetricsAppLaunchController sharedInstance];
      id v5 = [v4 appLaunchData];
      [v7 addEntriesFromDictionary:v5];

      objc_sync_exit(v3);
    }
    [*(id *)(a1 + 32) _recordEvent:@"pageRender" withEventData:v7];
  }
  else
  {
    id v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "No perf event - GDPR not consented", buf, 2u);
    }
  }
}

- (BOOL)shouldPostAppLaunchData
{
  return self->_shouldPostAppLaunchData;
}

- (id)getBasePerfData:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v5 = +[VUIPerfMetricsAppLaunchController sharedInstance];
    id v6 = [v5 appLaunchData];
    id v7 = (void *)[v6 mutableCopy];
  }
  else
  {
    id v7 = objc_opt_new();
  }
  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  [v7 setValue:v8 forKey:@"isAppLaunch"];

  int v9 = [(VUIMetricsController *)self _createDataAddingBaseAndPageFieldsToEventData:v7 forEventType:@"pageRender"];

  return v9;
}

- (void)setShouldPostAppLaunchData:(BOOL)a3
{
  self->_shouldPostAppLaunchData = a3;
}

uint64_t __46__VUIMetricsController_setupMetricsController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeBaseFields];
}

- (void)_initializeBaseFields
{
  BOOL v3 = [MEMORY[0x1E4FB5158] sharedSettings];
  id v4 = [MEMORY[0x1E4FB51A8] currentEnvironment];
  id v5 = [v4 entitlements];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__26;
  uint64_t v30 = __Block_byref_object_dispose__26;
  v31 = @"unknown";
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = +[VUIFeaturesConfiguration sharedInstance];
  int v9 = [v8 launchConfig];
  int v10 = [v9 useConfigCacheIgnoreExpiry];

  v11 = [MEMORY[0x1E4FB5088] sharedInstance];
  if (v10) {
    uint64_t v12 = 5;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  int v22 = __45__VUIMetricsController__initializeBaseFields__block_invoke;
  id v23 = &unk_1E6DFB268;
  v25 = &v26;
  int v13 = v7;
  id v24 = v13;
  [v11 fetchConfigurationWithOptions:0 cachePolicy:v12 queryParameters:0 completion:&v20];

  uint64_t v14 = objc_msgSend(v3, "consentedBrands", v20, v21, v22, v23);
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v14, @"cbids");

  v15 = [v3 deniedBrands];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v15, @"dbids");

  v16 = [v5 objectForKey:@"Installed"];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v16, @"ibids");

  v17 = [v5 objectForKey:@"Subscribed"];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v17, @"sbids");

  int v18 = [(VUIMetricsController *)self _getLocationAuthorizationStatus];
  [v6 setObject:v18 forKey:@"locationAuthorization"];

  dispatch_time_t v19 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v13, v19);
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v27[5], @"vppaState");
  [v6 setObject:MEMORY[0x1E4F1CC28] forKey:@"sharedActivity"];
  [(VUIMetricsController *)self setBaseFields:v6];

  _Block_object_dispose(&v26, 8);
}

- (void)_handleWLKLocationManagerChange:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v10 = @"locationAuthorization";
  id v4 = [(VUIMetricsController *)self _getLocationAuthorizationStatus];
  v11[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VUIMetricsController__handleWLKLocationManagerChange___block_invoke;
  block[3] = &unk_1E6DF3F68;
  void block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(metricsDataDispatchSQ, block);
}

- (id)_getLocationAuthorizationStatus
{
  v2 = [MEMORY[0x1E4FB50C8] defaultLocationManager];
  uint64_t v3 = [v2 authorizationStatus];

  id v4 = @"undetermined";
  if (v3 == 1) {
    id v4 = @"approved";
  }
  if (v3) {
    return v4;
  }
  else {
    return @"denied";
  }
}

uint64_t __56__VUIMetricsController__handleWLKLocationManagerChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBaseFieldsWithData:*(void *)(a1 + 40)];
}

- (void)recordAppBecameActive
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL isAppJustLaunched = self->_isAppJustLaunched;
    *(_DWORD *)buf = 67109120;
    BOOL v12 = isAppJustLaunched;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUIMetricsController: recordAppBecameActive _isAppJustLaunched=%hhd", buf, 8u);
  }

  if (self->_isAppJustDeepLinkOpened)
  {
    self->_isAppJustDeepLinkOpened = 0;
  }
  else
  {
    if (self->_isAppJustLaunched) {
      id v5 = @"launch";
    }
    else {
      id v5 = @"taskSwitch";
    }
    id v9 = @"type";
    int v10 = v5;
    id v6 = (void *)MEMORY[0x1E4F1C9E8];
    id v7 = v5;
    id v8 = [v6 dictionaryWithObjects:&v10 forKeys:&v9 count:1];

    -[VUIMetricsController _recordEnter:](self, "_recordEnter:", v8, v9, v10);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VUIMetricsController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_once_497 != -1) {
    dispatch_once(&sharedInstance_once_497, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_498;
  return v2;
}

- (BOOL)perfEventPublishingEnabled
{
  return self->_isGDPRConsented;
}

- (void)recordPage:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isGDPRConsented || [(VUIMetricsController *)self _isSiri])
  {
    id v5 = [(VUIMetricsController *)self lastEventType];
    int v6 = [v5 isEqualToString:@"page"];

    if (!v6)
    {
LABEL_12:
      id v8 = [v4 generateMetricsDataDictionary];
      [(VUIMetricsController *)self _recordEvent:@"page" withEventData:v8];
LABEL_13:

      goto LABEL_14;
    }
    id v7 = [(VUIMetricsController *)self lastEventData];
    id v8 = [v7 objectForKey:@"pageId"];

    id v9 = [(VUIMetricsController *)self lastEventData];
    int v10 = [v9 objectForKey:@"pageType"];

    v11 = [(VUIMetricsController *)self lastTabIdentifier];
    BOOL v12 = [(VUIMetricsController *)self lastEventData];
    uint64_t v13 = [v12 objectForKey:@"searchTerm"];

    uint64_t v14 = [v4 eventData];
    uint64_t v15 = [v14 objectForKey:@"searchTerm"];

    if (v15 | v13) {
      int v16 = [(id)v15 isEqualToString:v13] ^ 1;
    }
    else {
      int v16 = 0;
    }
    v17 = [v4 pageId];
    if ([v17 isEqualToString:v8])
    {
      int v18 = [v4 pageType];
      if (([v18 isEqualToString:v10] ^ 1 | v16) != 1)
      {
        [(VUIMetricsController *)self currentTabIdentifier];
        uint64_t v21 = v8;
        int v22 = v10;
        v24 = id v23 = v11;
        int v26 = [v23 isEqualToString:v24];

        v11 = v23;
        int v10 = v22;
        id v8 = v21;

        if (v26)
        {
          v25 = VUIDefaultLogObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v28 = v21;
            __int16 v29 = 2112;
            uint64_t v30 = v10;
            _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_INFO, "VUIMetricsController: Discarding duplicate page event pageId=%@ pageType=%@", buf, 0x16u);
          }

          goto LABEL_13;
        }
        goto LABEL_11;
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  dispatch_time_t v19 = VUIDefaultLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = [v4 pageId];
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v20;
    _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_INFO, "VUIMetricsController: caching page event until GDPR acceptance pageType:%@", buf, 0xCu);
  }
  [(VUIMetricsController *)self setGdprCachedPageEvent:v4];
LABEL_14:
}

- (NSDictionary)lastEventData
{
  return self->_lastEventData;
}

- (NSString)lastEventType
{
  return self->_lastEventType;
}

- (void)setLastRecordedPageEventData:(id)a3
{
  id v11 = a3;
  id v4 = [v11 pageId];
  id v5 = [v11 pageType];
  if ([(__CFString *)v4 length] || [(__CFString *)v5 length])
  {
    int v6 = [v11 eventData];
    if (v4) {
      id v7 = v4;
    }
    else {
      id v7 = &stru_1F3E921E0;
    }
    if (v5) {
      id v8 = v5;
    }
    else {
      id v8 = &stru_1F3E921E0;
    }
    id v9 = +[VUIMetricsPageEventData createWithPageId:v7 andPageType:v8 andEventData:v6];
    lastRecordedPageEventData = self->_lastRecordedPageEventData;
    self->_lastRecordedPageEventData = v9;
  }
}

- (NSString)lastTabIdentifier
{
  return self->_lastTabIdentifier;
}

id __46__VUIMetricsController_setupMetricsController__block_invoke()
{
  return +[VUIMetricsJetEngine sharedInstance];
}

void __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke_525;
    v11[3] = &unk_1E6DF3F68;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    BOOL v12 = v9;
    uint64_t v13 = v10;
    dispatch_async(v8, v11);
    id v7 = v12;
  }
}

void __45__VUIMetricsController__initializeBaseFields__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "WLK fetch error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = [a2 vppaStatusString];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_saveRecentEvents:(id)a3
{
  v103[55] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_isInternalBuild)
  {
    id v6 = [v4 objectForKey:@"eventType"];
    if ([v6 isEqualToString:@"pageRender"])
    {
      uint64_t v7 = [MEMORY[0x1E4FB3C80] sharedInstance];
      int v8 = [v7 metricsPageRenderLoggingEnabled];

      if (!v8) {
        goto LABEL_68;
      }
    }
    else
    {
    }
    [(NSHashTable *)self->_savedRecentEvents addObject:v5];
    id v9 = [MEMORY[0x1E4FB3C80] sharedInstance];
    int v10 = [v9 metricsExpandedLoggingEnabled];

    if (v10)
    {
      id v88 = 0;
      id v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:1 error:&v88];
      uint64_t v12 = v88;
      if (v11)
      {
        uint64_t v13 = [[NSString alloc] initWithData:v11 encoding:4];
        uint64_t v14 = VUIDefaultLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = [v5 objectForKeyedSubscript:@"eventType"];
          int v16 = [v15 uppercaseString];
          *(_DWORD *)buf = 138412546;
          v90 = v16;
          __int16 v91 = 2112;
          v92 = v13;
          _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_INFO, "========== %@ Metrics Event ========== (all fields):%@", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v13 = VUIDefaultLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v90 = v5;
          __int16 v91 = 2112;
          v92 = v12;
          _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_INFO, "VUIMetricsController: Unserializable event data: [%@] error:[%@]", buf, 0x16u);
        }
      }
LABEL_67:

      goto LABEL_68;
    }
    v17 = [MEMORY[0x1E4FB3C80] sharedInstance];
    int v18 = [v17 metricsLoggingEnabled];

    if (v18)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
      id v11 = [v12 objectForKeyedSubscript:@"eventType"];
      v103[0] = @"eventType";
      v103[1] = @"dbids";
      v103[2] = @"storeFront";
      v103[3] = @"capacityDataAvailable";
      v103[4] = @"osVersion";
      v103[5] = @"clientCorrelationKey";
      v103[6] = @"connection";
      v103[7] = @"capacityDisk";
      v103[8] = @"clientId";
      v103[9] = @"eventTime";
      v103[10] = @"capacitySystem";
      v103[11] = @"baseVersion";
      v103[12] = @"platformName";
      v103[13] = @"xpPostFrequency";
      v103[14] = @"ibids";
      v103[15] = @"hardwareFamily";
      v103[16] = @"hardwareModel";
      v103[17] = @"os";
      v103[18] = @"app";
      v103[19] = @"pixelRatio";
      v103[20] = @"windowOuterHeight";
      v103[21] = @"timezoneOffset";
      v103[22] = @"environment";
      v103[23] = @"isSignedIn";
      v103[24] = @"screenWidth";
      v103[25] = @"resourceRevNum";
      v103[26] = @"capacityData";
      v103[27] = @"screenHeight";
      v103[28] = @"environmentBuild";
      v103[29] = @"xpSendMethod";
      v103[30] = @"eventVersion";
      v103[31] = @"appVersion";
      v103[32] = @"sbids";
      v103[33] = @"capacitySystemAvailable";
      v103[34] = @"windowOuterWidth";
      v103[35] = @"utsc";
      v103[36] = @"clientEventId";
      v103[37] = @"osBuildNumber";
      v103[38] = @"environmentDataCenter";
      v103[39] = @"storeFrontHeader";
      v103[40] = @"userType";
      v103[41] = @"xpDelegatesInfo";
      v103[42] = @"userAgent";
      v103[43] = @"platformId";
      v103[44] = @"language";
      v103[45] = @"cbids";
      v103[46] = @"osLanguages";
      v103[47] = @"xpViewableThreshold";
      v103[48] = @"xpViewablePercentage";
      v103[49] = @"dsId";
      v103[50] = @"locationAuthorization";
      v103[51] = @"vppaState";
      v103[52] = @"page";
      v103[53] = @"pageHistory";
      v103[54] = @"topic";
      uint64_t v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:55];
      if (([v11 isEqualToString:@"click"] & 1) != 0
        || [v11 isEqualToString:@"impressions"])
      {
        dispatch_time_t v19 = [v12 objectForKeyedSubscript:@"impressions"];
        v70 = v12;
        v71 = v5;
        v68 = v19;
        v69 = v11;
        if ([v19 count])
        {
          v78 = objc_opt_new();
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          obuint64_t j = v19;
          uint64_t v20 = [obj countByEnumeratingWithState:&v84 objects:v102 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v76 = *(void *)v85;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v85 != v76) {
                  objc_enumerationMutation(obj);
                }
                id v23 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                v100[0] = @"id";
                uint64_t v24 = objc_msgSend(v23, "objectForKey:");
                v25 = (void *)v24;
                if (v24) {
                  int v26 = (__CFString *)v24;
                }
                else {
                  int v26 = &stru_1F3E921E0;
                }
                v101[0] = v26;
                v100[1] = @"name";
                uint64_t v27 = objc_msgSend(v23, "objectForKey:");
                uint64_t v28 = (void *)v27;
                if (v27) {
                  __int16 v29 = (__CFString *)v27;
                }
                else {
                  __int16 v29 = &stru_1F3E921E0;
                }
                v101[1] = v29;
                v100[2] = @"impressionType";
                uint64_t v30 = [v23 objectForKey:@"impressionType"];
                uint64_t v31 = (void *)v30;
                if (v30) {
                  v32 = (__CFString *)v30;
                }
                else {
                  v32 = &stru_1F3E921E0;
                }
                v101[2] = v32;
                v100[3] = @"impressionIndex";
                uint64_t v33 = [v23 objectForKey:@"impressionIndex"];
                v34 = (void *)v33;
                if (v33) {
                  v35 = (__CFString *)v33;
                }
                else {
                  v35 = &stru_1F3E921E0;
                }
                v101[3] = v35;
                v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:4];

                [v78 addObject:v36];
              }
              uint64_t v21 = [obj countByEnumeratingWithState:&v84 objects:v102 count:16];
            }
            while (v21);
          }

          [v12 removeObjectsForKeys:&unk_1F3F3E438];
          [v12 setObject:v78 forKey:@"impressions (ABRIDGED)"];
          objc_msgSend(NSString, "stringWithFormat:", @"<<Impressions count: %lu>>", objc_msgSend(obj, "count"));
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue();

          id v5 = v71;
          dispatch_time_t v19 = v68;
          id v11 = v69;
        }
        else
        {
          v73 = &stru_1F3E921E0;
        }
        v37 = [v12 objectForKeyedSubscript:@"location"];
        if ([v37 count])
        {
          v79 = objc_opt_new();
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          id obja = v37;
          uint64_t v38 = [obja countByEnumeratingWithState:&v80 objects:v99 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v77 = *(void *)v81;
            do
            {
              for (uint64_t j = 0; j != v39; ++j)
              {
                if (*(void *)v81 != v77) {
                  objc_enumerationMutation(obja);
                }
                v41 = *(void **)(*((void *)&v80 + 1) + 8 * j);
                v97[0] = @"id";
                uint64_t v42 = objc_msgSend(v41, "objectForKey:");
                v43 = (void *)v42;
                if (v42) {
                  v44 = (__CFString *)v42;
                }
                else {
                  v44 = &stru_1F3E921E0;
                }
                v98[0] = v44;
                v97[1] = @"name";
                uint64_t v45 = objc_msgSend(v41, "objectForKey:");
                v46 = (void *)v45;
                if (v45) {
                  v47 = (__CFString *)v45;
                }
                else {
                  v47 = &stru_1F3E921E0;
                }
                v98[1] = v47;
                v97[2] = @"locationType";
                uint64_t v48 = [v41 objectForKey:@"locationType"];
                v49 = (void *)v48;
                if (v48) {
                  v50 = (__CFString *)v48;
                }
                else {
                  v50 = &stru_1F3E921E0;
                }
                v98[2] = v50;
                v97[3] = @"locationPosition";
                uint64_t v51 = [v41 objectForKey:@"locationPosition"];
                v52 = (void *)v51;
                if (v51) {
                  v53 = (__CFString *)v51;
                }
                else {
                  v53 = &stru_1F3E921E0;
                }
                v98[3] = v53;
                v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:4];

                [v79 addObject:v54];
              }
              uint64_t v39 = [obja countByEnumeratingWithState:&v80 objects:v99 count:16];
            }
            while (v39);
          }

          uint64_t v12 = v70;
          [v70 removeObjectsForKeys:&unk_1F3F3E450];
          [v70 setObject:v79 forKey:@"location (ABRIDGED)"];

          id v5 = v71;
          dispatch_time_t v19 = v68;
          id v11 = v69;
        }
      }
      else
      {
        v73 = &stru_1F3E921E0;
      }
      v55 = [v12 objectForKey:@"sharedActivity"];
      char v56 = [v55 BOOLValue];

      if ((v56 & 1) == 0) {
        [v12 removeObjectsForKeys:&unk_1F3F3E468];
      }
      v57 = [v5 allKeys];
      v58 = [v5 allKeys];
      v59 = [v58 indexesOfObjectsPassingTest:&__block_literal_global_722];
      v60 = [v57 objectsAtIndexes:v59];

      v61 = [v5 allKeys];
      v62 = [v5 allKeys];
      v63 = [v62 indexesOfObjectsPassingTest:&__block_literal_global_733];
      v64 = [v61 objectsAtIndexes:v63];

      uint64_t v13 = v72;
      [v12 removeObjectsForKeys:v72];
      [v12 removeObjectsForKeys:v64];
      v65 = [v5 dictionaryWithValuesForKeys:v64];
      [v12 removeObjectsForKeys:v60];
      v66 = VUIDefaultLogObject();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        v67 = [v11 uppercaseString];
        *(_DWORD *)buf = 138413058;
        v90 = v67;
        __int16 v91 = 2112;
        v92 = v12;
        __int16 v93 = 2112;
        v94 = v65;
        __int16 v95 = 2112;
        v96 = v73;
        _os_log_impl(&dword_1E2BD7000, v66, OS_LOG_TYPE_INFO, "========== %@ Metrics Event ========== (limited fields):%@ %@ %@", buf, 0x2Au);
      }
      goto LABEL_67;
    }
  }
LABEL_68:
}

- (id)iTunesLibraryPlaybackMediaMetricsForAdamID:(id)a3 mediaType:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[VUIFeaturesConfiguration sharedInstance];
  int v8 = [v7 nowPlayingConfig];
  int v9 = [v8 allowQOSReportingForiTunesLibraryPlayback];

  int v10 = 0;
  if (v5 && v9)
  {
    if (([v5 isEqualToNumber:&unk_1F3F3D280] & 1) == 0 && objc_msgSend(v6, "length"))
    {
      if (([v6 isEqualToString:*MEMORY[0x1E4FAA1E8]] & 1) != 0
        || ([v6 isEqualToString:*MEMORY[0x1E4FAA1F8]] & 1) != 0)
      {
        id v11 = @"movie";
LABEL_8:
        uint64_t v12 = [NSString stringWithFormat:@"a=%@:s=%@:e=%@", v5, *MEMORY[0x1E4FB5200], v11];
        v14[0] = @"MediaIdentifier";
        v14[1] = @"iTunesServiceMonitoringKey";
        v15[0] = v12;
        v15[1] = MEMORY[0x1E4F1CC38];
        int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

        goto LABEL_12;
      }
      if ([v6 isEqualToString:*MEMORY[0x1E4FAA200]])
      {
        id v11 = @"episode";
        goto LABEL_8;
      }
    }
    int v10 = 0;
  }
LABEL_12:

  return v10;
}

- (id)_getCurrentMetricsTopic
{
  if (self->_isGDPRConsented) {
    return @"xp_amp_tv_main";
  }
  else {
    return @"xp_amp_tv_unidentified";
  }
}

- (void)recordAppLaunched
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUIMetricsController: recordAppLaunched", v5, 2u);
  }

  id v6 = @"type";
  v7[0] = @"launch";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(VUIMetricsController *)self _recordEnter:v4];
}

- (void)recordOpenUrlLaunchWithExtURL:(id)a3 andOptions:(id)a4
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  self->_isAppJustDeepLinkOpened = 1;
  if (self->_isAppJustLaunched) {
    int v8 = @"linkedLaunch";
  }
  else {
    int v8 = @"linkedTaskSwitch";
  }
  int v9 = v8;
  int v10 = [v7 objectForKey:*MEMORY[0x1E4FB26E8]];
  if (!v10)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
    uint64_t v12 = +[VUIInterfaceFactory sharedInstance];
    uint64_t v13 = [v12 openURLHandler];
    int v10 = [v13 queryParameterStringfromURL:v11 parameter:@"refApp"];

    if (v10) {
      uint64_t v14 = v10;
    }
  }
  uint64_t v15 = objc_msgSend(v7, "vui_dictionaryForKey:", *MEMORY[0x1E4FB26D8]);
  objc_msgSend(v15, "vui_stringForKey:", *MEMORY[0x1E4F22370]);
  int v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v17 = @"navigate";
  if (!v6) {
    v17 = @"default";
  }
  int v18 = v17;
  if (([(__CFString *)v6 containsString:@"?play"] & 1) != 0
    || [(__CFString *)v6 containsString:@"action=play"])
  {

    int v18 = @"play";
  }
  if (v10) {
    dispatch_time_t v19 = v10;
  }
  else {
    dispatch_time_t v19 = &stru_1F3E921E0;
  }
  v30[0] = @"refApp";
  v30[1] = @"extRefUrl";
  if (v16) {
    uint64_t v20 = v16;
  }
  else {
    uint64_t v20 = &stru_1F3E921E0;
  }
  v31[0] = v19;
  v31[1] = v20;
  v30[2] = @"openUrl";
  if (v6) {
    uint64_t v21 = v6;
  }
  else {
    uint64_t v21 = &stru_1F3E921E0;
  }
  v31[2] = v21;
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
  [(VUIMetricsController *)self setCachedOpenUrlData:v22];

  id v23 = (void *)MEMORY[0x1E4F1CA60];
  v28[0] = @"type";
  v28[1] = @"actionType";
  v29[0] = v9;
  v29[1] = v18;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  v25 = [v23 dictionaryWithDictionary:v24];

  int v26 = [(VUIMetricsController *)self cachedOpenUrlData];
  [v25 addEntriesFromDictionary:v26];

  uint64_t v27 = (void *)[v25 copy];
  [(VUIMetricsController *)self _recordEnter:v27];
}

- (void)recordAppWillTerminate
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"type";
  v5[0] = @"quit";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(VUIMetricsController *)self _recordExit:v3];
}

- (void)recordAppWillBackground
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"type";
  v7[1] = @"destinationUrl";
  v8[0] = @"taskSwitch";
  uint64_t v3 = [(VUIMetricsController *)self exitEventDestinationUrl];
  id v4 = (void *)v3;
  id v5 = &stru_1F3E921E0;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  v8[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [(VUIMetricsController *)self _recordExit:v6];

  [(VUIMetricsController *)self setExitEventDestinationUrl:0];
}

- (void)_recordExit:(id)a3
{
  if (self->_shouldRecordExit)
  {
    *(_WORD *)&self->_shouldRecordEnter = 1;
    id v4 = a3;
    [(VUIMetricsController *)self setShouldFlushMetrics:1];
    [(VUIMetricsController *)self _recordEvent:@"exit" withEventData:v4];
  }
}

- (void)recordPageChange:(id)a3
{
  id v4 = [a3 generateMetricsDataDictionary];
  [(VUIMetricsController *)self _recordEvent:@"pageChange" withEventData:v4];
}

- (void)recordDialog:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIMetricsController *)self lastEventType];
  int v6 = [v5 isEqualToString:@"dialog"];

  if (!v6) {
    goto LABEL_8;
  }
  id v7 = [v4 objectForKey:@"dialogId"];
  int v8 = [v4 objectForKey:@"dialogType"];
  int v9 = [(VUIMetricsController *)self lastEventData];
  int v10 = [v9 objectForKey:@"dialogId"];

  id v11 = [(VUIMetricsController *)self lastEventData];
  uint64_t v12 = [v11 objectForKey:@"dialogType"];

  if (![v7 isEqualToString:v10]
    || ![v8 isEqualToString:v12])
  {

LABEL_8:
    [(VUIMetricsController *)self _recordEvent:@"dialog" withEventData:v4];
    goto LABEL_9;
  }
  uint64_t v13 = VUIDefaultLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_INFO, "VUIMetricsController: Discarding duplicate dialog event dialogId=%@ dialogType=%@", (uint8_t *)&v14, 0x16u);
  }

LABEL_9:
}

- (void)recordClick:(id)a3
{
}

- (void)recordImpressions:(id)a3
{
  id v4 = a3;
  if (self->_isGDPRConsented)
  {
    [(VUIMetricsController *)self setShouldFlushMetrics:0];
    id v5 = objc_msgSend(v4, "vui_arrayForKey:", @"impressions");
    int v6 = v5;
    if (v5 && [v5 count])
    {
      id v7 = [(VUIMetricsController *)self cachedUnifiedMessagingImpressions];
      int v8 = [v7 copy];

      if (v8 && [v8 count])
      {
        int v9 = objc_opt_new();
        [v9 addObjectsFromArray:v6];
        [v9 addObjectsFromArray:v8];
        [(NSMutableArray *)self->_cachedUnifiedMessagingImpressions removeAllObjects];
        int v10 = VUIDefaultLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v14 = 0;
          _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_INFO, "VUIMetricsController: adding cached Unified Messaging impressions to impressions event", v14, 2u);
        }

        id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
        uint64_t v12 = (void *)[v9 copy];
        [v11 setValue:v12 forKey:@"impressions"];

        uint64_t v13 = (void *)[v11 copy];
        [(VUIMetricsController *)self _recordEvent:@"impressions" withEventData:v13];
      }
      else
      {
        [(VUIMetricsController *)self _recordEvent:@"impressions" withEventData:v4];
      }
    }
    else
    {
      int v8 = VUIDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, "VUIMetricsController: no impressions found for recordImpressions", buf, 2u);
      }
    }
  }
}

- (void)recordMedia:(id)a3
{
  if (self->_isGDPRConsented) {
    [(VUIMetricsController *)self _recordEvent:@"media" withEventData:a3];
  }
}

- (void)recordSearch:(id)a3
{
}

- (void)recordRawEvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"eventType"];
  int v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "VUIMetricsController: received raw event type:[%@]", (uint8_t *)&v7, 0xCu);
  }

  [(VUIMetricsController *)self _recordEvent:v5 withEventData:v4];
}

uint64_t __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke_525(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_saveRecentEvents:");
  }
  v2 = *(void **)(a1 + 40);
  return [v2 setBackgroundTask:0];
}

- (void)recordLog:(id)a3
{
  id v4 = a3;
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __34__VUIMetricsController_recordLog___block_invoke;
  v7[3] = &unk_1E6DF3F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(metricsDataDispatchSQ, v7);
}

void __34__VUIMetricsController_recordLog___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[11])
  {
    id v6 = [v2 _createDataAddingBaseAndPageFieldsToEventData:*(void *)(a1 + 40) forEventType:@"log"];
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
    [v3 setObject:@"log" forKey:@"eventType"];
    [v3 removeObjectForKey:@"cbids"];
    [v3 removeObjectForKey:@"dbids"];
    [v3 removeObjectForKey:@"ibids"];
    [v3 removeObjectForKey:@"sbids"];
    id v4 = (void *)[v3 copy];
    [*(id *)(a1 + 32) _recordEventWithJet:@"log" withEventData:v4];
  }
  else
  {
    id v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "No log event - GDPR not consented", buf, 2u);
    }
  }
}

- (id)createEventTime
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSince1970];
  double v4 = v3 * 1000.0;

  id v5 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v5 numberWithLong:(uint64_t)v4];
}

- (NSDictionary)sidebarPageMetrics
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"pageId";
  v4[1] = @"pageType";
  v5[0] = @"Tab";
  v5[1] = @"Tab";
  v4[2] = @"pageContext";
  void v5[2] = @"tab";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return (NSDictionary *)v2;
}

- (NSDictionary)tabBarPageMetrics
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"pageId";
  v4[1] = @"pageType";
  v5[0] = @"TabBar";
  v5[1] = @"TabBar";
  v4[2] = @"pageContext";
  void v5[2] = @"tabBar";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return (NSDictionary *)v2;
}

- (NSDictionary)profileSelectorPageMetrics
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"pageId";
  v4[1] = @"pageType";
  v5[0] = @"ProfileSelector";
  v5[1] = @"ProfileSelector";
  v4[2] = @"pageContext";
  void v5[2] = @"tab";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return (NSDictionary *)v2;
}

- (id)extractPageMetricsFromEventData:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "vui_stringForKey:", @"pageId");
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_1F3E921E0;
  }
  int v7 = v6;

  uint64_t v8 = objc_msgSend(v3, "vui_stringForKey:", @"pageType");
  uint64_t v9 = (void *)v8;
  if (v8) {
    int v10 = (__CFString *)v8;
  }
  else {
    int v10 = &stru_1F3E921E0;
  }
  id v11 = v10;

  objc_msgSend(v3, "vui_stringForKey:", @"pageContext");
  uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = &stru_1F3E921E0;
  }
  int v14 = v13;

  v17[0] = @"pageId";
  v17[1] = @"pageType";
  v18[0] = v7;
  v18[1] = v11;
  v17[2] = @"pageContext";
  v18[2] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  return v15;
}

- (void)forceGDPRConsentStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "GDPR forced status: %d", (uint8_t *)v6, 8u);
  }

  [(VUIMetricsController *)self _setGDPRConsentStatus:v3];
}

- (void)updateGDPRConsentStatus
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F4DBA8] acknowledgementNeededForPrivacyIdentifier:@"com.apple.onboarding.tvapp"] ^ 1;
  uint64_t v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "GDPR update: consented %d", (uint8_t *)v5, 8u);
  }

  [(VUIMetricsController *)self _setGDPRConsentStatus:v3];
}

- (void)_setGDPRConsentStatus:(BOOL)a3
{
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__VUIMetricsController__setGDPRConsentStatus___block_invoke;
  void v4[3] = &unk_1E6DF51F0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(metricsDataDispatchSQ, v4);
}

void __46__VUIMetricsController__setGDPRConsentStatus___block_invoke(uint64_t a1)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 11);
  *(unsigned char *)(v2 + 11) = *(unsigned char *)(a1 + 40);
  BOOL v4 = +[VUIUtilities isTVApp];
  BOOL v5 = *(unsigned char **)(a1 + 32);
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5[11] == 0;
  }
  if (!v6 && v4)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
    v20[0] = @"eventType";
    v20[1] = @"type";
    v21[0] = @"account";
    v21[1] = @"consentGranted";
    v20[2] = @"consentType";
    v21[2] = @"GDPR";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    int v10 = [v8 dictionaryWithDictionary:v9];

    id v11 = [*(id *)(a1 + 32) cachedOpenUrlData];

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 32) cachedOpenUrlData];
      [v10 addEntriesFromDictionary:v12];

      [*(id *)(a1 + 32) setCachedOpenUrlData:0];
    }
    uint64_t v13 = *(void **)(a1 + 32);
    int v14 = (void *)[v10 copy];
    [v13 _recordEvent:@"account" withEventData:v14];

    uint64_t v15 = [*(id *)(a1 + 32) gdprCachedPageEvent];
    if (v15)
    {
      [*(id *)(a1 + 32) recordPage:v15];
      [*(id *)(a1 + 32) setGdprCachedPageEvent:0];
    }

    BOOL v5 = *(unsigned char **)(a1 + 32);
  }
  __int16 v16 = [v5 baseFields];
  v17 = (void *)[v16 mutableCopy];

  uint64_t v18 = *(void **)(a1 + 32);
  dispatch_time_t v19 = (void *)[v17 copy];
  [v18 setBaseFields:v19];

  [*(id *)(a1 + 32) _updateBaseFieldsWithData:0];
}

- (void)flushMetrics
{
  id v2 = +[VUIMetricsJetEngine sharedInstance];
  [v2 flushMetrics];
}

- (void)_removeBaseFieldsForKeys:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(VUIMetricsController *)self baseFields];
  BOOL v5 = (void *)[v4 mutableCopy];

  if (v7) {
    [v5 removeObjectsForKeys:v7];
  }
  BOOL v6 = (void *)[v5 copy];
  [(VUIMetricsController *)self setBaseFields:v6];
}

- (void)_handleServerConfigChange:(id)a3
{
  BOOL v4 = [a3 object];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v6 = [v4 objectForKey:@"vppaState"];
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v6, @"vppaState");

  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__VUIMetricsController__handleServerConfigChange___block_invoke;
  v9[3] = &unk_1E6DF3F68;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(metricsDataDispatchSQ, v9);
}

uint64_t __50__VUIMetricsController__handleServerConfigChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBaseFieldsWithData:*(void *)(a1 + 40)];
}

- (void)_handleWLKSettingsDidChange:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4FB5158], "sharedSettings", a3);
  v12[0] = @"cbids";
  id v5 = [v4 consentedBrands];
  v13[0] = v5;
  v12[1] = @"dbids";
  BOOL v6 = [v4 deniedBrands];
  v13[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VUIMetricsController__handleWLKSettingsDidChange___block_invoke;
  block[3] = &unk_1E6DF3F68;
  void block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(metricsDataDispatchSQ, block);
}

uint64_t __52__VUIMetricsController__handleWLKSettingsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBaseFieldsWithData:*(void *)(a1 + 40)];
}

- (void)_handleWLKAppLibChange:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4FB51A8], "currentEnvironment", a3);
  id v5 = [v4 entitlements];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = [v5 objectForKey:@"Installed"];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v7, @"ibids");

  id v8 = [v5 objectForKey:@"Subscribed"];
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v8, @"sbids");

  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __47__VUIMetricsController__handleWLKAppLibChange___block_invoke;
  v11[3] = &unk_1E6DF3F68;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(metricsDataDispatchSQ, v11);
}

uint64_t __47__VUIMetricsController__handleWLKAppLibChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBaseFieldsWithData:*(void *)(a1 + 40)];
}

- (void)_handleGroupActivitiesSessionStateChange:(id)a3
{
  id v4 = a3;
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __65__VUIMetricsController__handleGroupActivitiesSessionStateChange___block_invoke;
  v7[3] = &unk_1E6DF3F68;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(metricsDataDispatchSQ, v7);
}

void __65__VUIMetricsController__handleGroupActivitiesSessionStateChange___block_invoke(uint64_t a1)
{
  v27[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  int v3 = *(void **)(a1 + 40);
  v27[0] = @"sharedActivity";
  v27[1] = @"sharedActivityDevicesCurrent";
  v27[2] = @"sharedActivityDevicesMax";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  [v3 _removeBaseFieldsForKeys:v4];

  dispatch_time_t v19 = (void *)v2;
  [*(id *)(a1 + 40) _updateBaseFieldsWithData:v2];
  id v5 = [*(id *)(a1 + 40) cachedGroupEvents];
  id v6 = (void *)[v5 copy];

  id v7 = [*(id *)(a1 + 40) cachedGroupEvents];
  [v7 removeAllObjects];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v14 = VUIDefaultLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = [v13 eventType];
          *(_DWORD *)buf = 138412290;
          v25 = v15;
          _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_INFO, "VUIMetricsController: recording cached %@ event", buf, 0xCu);
        }
        __int16 v16 = *(void **)(a1 + 40);
        v17 = [v13 eventType];
        uint64_t v18 = [v13 eventData];
        [v16 _recordEvent:v17 withEventData:v18];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v10);
  }
}

uint64_t __42__VUIMetricsController__saveRecentEvents___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 hasPrefix:@"data.uts"] & 1) != 0
    || ([v2 hasPrefix:@"data.search"] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 hasPrefix:@"reco_"];
  }

  return v3;
}

uint64_t __42__VUIMetricsController__saveRecentEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 hasPrefix:@"page"]
    || ([v2 isEqualToString:@"page"] & 1) != 0
    || [v2 isEqualToString:@"pageHistory"])
  {
    uint64_t v3 = [v2 isEqualToString:@"searchTerm"];
  }
  else
  {
    uint64_t v3 = 1;
  }

  return v3;
}

- (id)getRecentEventsForDebuggerUI
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__26;
  uint64_t v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  metricsDataDispatchSQ = self->_metricsDataDispatchSQ;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __52__VUIMetricsController_getRecentEventsForDebuggerUI__block_invoke;
  v5[3] = &unk_1E6DF4B00;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(metricsDataDispatchSQ, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__VUIMetricsController_getRecentEventsForDebuggerUI__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)getMetricsEnhancedBuyParams:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28E78];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithString:v5];

  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v8 = [v7 bundleIdentifier];
  [v6 appendFormat:@"&mtApp=%@", v8];

  uint64_t v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v10 = [v9 systemVersion];
  [v6 appendFormat:@"&mtOsVersion=%@", v10];

  lastRecordedPageEventData = self->_lastRecordedPageEventData;
  if (lastRecordedPageEventData)
  {
    id v12 = [(VUIMetricsPageEventData *)lastRecordedPageEventData pageId];
    [v6 appendFormat:@"&mtPageId=%@", v12];

    uint64_t v13 = [(VUIMetricsPageEventData *)self->_lastRecordedPageEventData pageType];
    [v6 appendFormat:@"&mtPageType=%@", v13];
  }
  int v14 = [(VUIMetricsController *)self baseFields];
  uint64_t v15 = [v14 objectForKey:@"pageContext"];

  if (v15) {
    [v6 appendFormat:@"&mtPageContext=%@", v15];
  }
  uint64_t v16 = [MEMORY[0x1E4FB3CE8] stringValueForKey:@"BuildVersion"];
  v17 = (void *)v16;
  if (v16) {
    [v6 appendFormat:@"&mtOsBuildNumber=%@", v16];
  }
  uint64_t v18 = [(VUIMetricsController *)self _getCurrentMetricsTopic];
  [v6 appendFormat:@"&mtTopic=%@", v18];

  dispatch_time_t v19 = [MEMORY[0x1E4F29128] UUID];
  long long v20 = [v19 UUIDString];
  [v6 appendFormat:@"&mtRequestId=%@", v20];

  long long v21 = [MEMORY[0x1E4F1C9C8] date];
  [v21 timeIntervalSince1970];
  objc_msgSend(v6, "appendFormat:", @"&mtEventTime=%lf", v22 * 1000.0);

  long long v23 = (void *)[v6 copy];
  return v23;
}

- (id)getMetricsOverlayForBundleOffer
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VUIMetricsController *)self _getCurrentMetricsTopic];
  id v4 = +[VUIAuthenticationManager DSID];
  id v5 = [(VUIMetricsController *)self baseFields];
  uint64_t v6 = [v5 objectForKey:@"pageContext"];

  id v7 = &stru_1F3E921E0;
  v11[0] = @"pageContext";
  v11[1] = @"dsId";
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = &stru_1F3E921E0;
  }
  if (v4) {
    id v7 = v4;
  }
  v12[0] = v8;
  v12[1] = v7;
  void v11[2] = @"topic";
  void v12[2] = v3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (id)getMetricsOverlayForWebContainer
{
  v16[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(VUIMetricsController *)self _getCurrentMetricsTopic];
  uint64_t v3 = +[VUIAuthenticationManager DSID];
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 bundleIdentifier];

  uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v6 infoDictionary];

  uint64_t v8 = [v7 objectForKey:@"CFBundleShortVersionString"];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = &stru_1F3E921E0;
  if (v5) {
    id v11 = v5;
  }
  else {
    id v11 = &stru_1F3E921E0;
  }
  v15[0] = @"app";
  v15[1] = @"appVersion";
  if (v8) {
    id v12 = (__CFString *)v8;
  }
  else {
    id v12 = &stru_1F3E921E0;
  }
  v16[0] = v11;
  v16[1] = v12;
  if (v3) {
    uint64_t v10 = v3;
  }
  v15[2] = @"dsId";
  void v15[3] = @"topic";
  v16[2] = v10;
  v16[3] = v2;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  return v13;
}

- (void)cacheUMImpression:(id)a3
{
}

- (void)setIsInDebugMode:(BOOL)a3
{
  self->_isInDebugMode = a3;
}

- (NSDictionary)cachedOpenUrlData
{
  return self->_cachedOpenUrlData;
}

- (void)setCachedOpenUrlData:(id)a3
{
}

- (BOOL)shouldFlushMetrics
{
  return self->_shouldFlushMetrics;
}

- (void)setShouldFlushMetrics:(BOOL)a3
{
  self->_shouldFlushMetrics = a3;
}

- (NSString)exitEventDestinationUrl
{
  return self->_exitEventDestinationUrl;
}

- (void)setExitEventDestinationUrl:(id)a3
{
}

- (OS_dispatch_queue)metricsDataDispatchSQ
{
  return self->_metricsDataDispatchSQ;
}

- (void)setMetricsDataDispatchSQ:(id)a3
{
}

- (VUIMetricsPageEventData)gdprCachedPageEvent
{
  return self->_gdprCachedPageEvent;
}

- (void)setGdprCachedPageEvent:(id)a3
{
}

- (NSDictionary)cachedEnterEvent
{
  return self->_cachedEnterEvent;
}

- (void)setCachedEnterEvent:(id)a3
{
}

- (NSMutableArray)cachedGroupEvents
{
  return self->_cachedGroupEvents;
}

- (void)setCachedGroupEvents:(id)a3
{
}

- (NSHashTable)savedRecentEvents
{
  return self->_savedRecentEvents;
}

- (void)setSavedRecentEvents:(id)a3
{
}

- (VUIMetricsLocalRecorder)localMetricsRecorder
{
  return self->_localMetricsRecorder;
}

- (void)setLocalMetricsRecorder:(id)a3
{
}

- (NSMutableArray)cachedUnifiedMessagingImpressions
{
  return self->_cachedUnifiedMessagingImpressions;
}

- (void)setCachedUnifiedMessagingImpressions:(id)a3
{
}

- (VUIScopedBackgroundTask)backgroundTask
{
  return self->_backgroundTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTask, 0);
  objc_storeStrong((id *)&self->_cachedUnifiedMessagingImpressions, 0);
  objc_storeStrong((id *)&self->_localMetricsRecorder, 0);
  objc_storeStrong((id *)&self->_lastTabIdentifier, 0);
  objc_storeStrong((id *)&self->_lastEventData, 0);
  objc_storeStrong((id *)&self->_lastEventType, 0);
  objc_storeStrong((id *)&self->_savedRecentEvents, 0);
  objc_storeStrong((id *)&self->_cachedGroupEvents, 0);
  objc_storeStrong((id *)&self->_cachedEnterEvent, 0);
  objc_storeStrong((id *)&self->_gdprCachedPageEvent, 0);
  objc_storeStrong((id *)&self->_metricsDataDispatchSQ, 0);
  objc_storeStrong((id *)&self->_exitEventDestinationUrl, 0);
  objc_storeStrong((id *)&self->_lastRecordedPageEventData, 0);
  objc_storeStrong((id *)&self->_currentTabIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedOpenUrlData, 0);
  objc_storeStrong((id *)&self->_baseFields, 0);
}

+ (id)_baseToVPAFMapping
{
  if (_baseToVPAFMapping_onceToken != -1) {
    dispatch_once(&_baseToVPAFMapping_onceToken, &__block_literal_global_147);
  }
  uint64_t v2 = (void *)_baseToVPAFMapping__map;
  return v2;
}

void __48__VUIMetricsController_VPAF___baseToVPAFMapping__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"mvpdMonthsActive";
  v2[1] = @"mvpdPartner";
  v3[0] = @"mvpdMonthsActive";
  v3[1] = @"mvpdPartner";
  v2[2] = @"pageContext";
  v2[3] = @"sharedActivity";
  v3[2] = @"tabId";
  v3[3] = @"sharedActivity";
  v2[4] = @"sharedActivityDevicesCurrent";
  v2[5] = @"sharedActivityDevicesMax";
  v3[4] = @"sharedActivityDevicesCurrent";
  v3[5] = @"sharedActivityDevicesMax";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  uint64_t v1 = (void *)_baseToVPAFMapping__map;
  _baseToVPAFMapping__map = v0;
}

- (NSDictionary)baseFieldsForVPAF
{
  uint64_t v2 = [(VUIMetricsController *)self baseFields];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(id)objc_opt_class() _baseToVPAFMapping];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __47__VUIMetricsController_VPAF__baseFieldsForVPAF__block_invoke;
  id v12 = &unk_1E6DFC840;
  id v13 = v4;
  id v5 = v3;
  id v14 = v5;
  id v6 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:&v9];
  if (objc_msgSend(v5, "count", v9, v10, v11, v12)) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return (NSDictionary *)v7;
}

void __47__VUIMetricsController_VPAF__baseFieldsForVPAF__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v6 forKey:v5];
  }
}

- (NSDictionary)iTunesVPAF
{
  return 0;
}

void __58__VUIMetricsController__recordEventWithJet_withEventData___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIMetricsController: Metrics error: %@", (uint8_t *)&v2, 0xCu);
}

@end