@interface NMSMusicCatalogRecommendationsUpdater
+ ($76119E9FC4E615FCD2412858B276E5B9)_configurationWithBag:(SEL)a3;
+ (double)_nextUpdateDelayAfterDate:(id)a3 configuration:(id *)a4;
+ (double)_stalenessIntervalWithBag:(id)a3;
+ (void)_clearLastUpdatedDateIfNeeded;
- (BOOL)_needsInitialContentUpdate;
- (NMSMusicCatalogRecommendationsUpdater)init;
- (id)updateHandlerBlock;
- (void)_handlePairedDeviceRegistryDeviceDidPairNotification:(id)a3;
- (void)_handlePrivacyAcknowledgementDidChangeForIdentifier:(id)a3 isPrivacyAcknowledgementRequired:(BOOL)a4;
- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_performNextUpdateWithScheduler:(id)a3 completionHandler:(id)a4;
- (void)_performNextUpdateWithScheduler:(id)a3 urlBag:(id)a4 completionHandler:(id)a5;
- (void)_scheduleNextUpdateIfNeeded;
- (void)_scheduleNextUpdateWithBag:(id)a3;
- (void)beginAutomaticContentUpdating;
- (void)endAutomaticContentUpdating;
- (void)setUpdateHandlerBlock:(id)a3;
@end

@implementation NMSMusicCatalogRecommendationsUpdater

- (NMSMusicCatalogRecommendationsUpdater)init
{
  v12.receiver = self;
  v12.super_class = (Class)NMSMusicCatalogRecommendationsUpdater;
  v2 = [(NMSMusicCatalogRecommendationsUpdater *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.NanoMusicSync.NMSMusicCatalogRecommendationsUpdater", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263F57730] sharedInstance];
    pairedDeviceRegistry = v2->_pairedDeviceRegistry;
    v2->_pairedDeviceRegistry = (NRPairedDeviceRegistry *)v5;

    uint64_t v7 = +[NMSSubscriptionManager sharedManager];
    subscriptionManager = v2->_subscriptionManager;
    v2->_subscriptionManager = (NMSSubscriptionManager *)v7;

    uint64_t v9 = [MEMORY[0x263F89270] sharedPrivacyInfo];
    privacyInfo = v2->_privacyInfo;
    v2->_privacyInfo = (ICPrivacyInfo *)v9;
  }
  return v2;
}

- (void)beginAutomaticContentUpdating
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__NMSMusicCatalogRecommendationsUpdater_beginAutomaticContentUpdating__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __70__NMSMusicCatalogRecommendationsUpdater_beginAutomaticContentUpdating__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__handlePairedDeviceRegistryDeviceDidPairNotification_ name:*MEMORY[0x263F576A8] object:*(void *)(*(void *)(a1 + 32) + 16)];

  dispatch_queue_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel__handleSubscriptionStatusDidChangeNotification_ name:@"NMSSubscriptionStatusDidChangeNotification" object:*(void *)(*(void *)(a1 + 32) + 24)];

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  uint64_t v6 = *MEMORY[0x263F88F78];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__NMSMusicCatalogRecommendationsUpdater_beginAutomaticContentUpdating__block_invoke_2;
  v11[3] = &unk_264634BE8;
  v11[4] = v4;
  uint64_t v7 = [v5 beginObservingPrivacyAcknowledgementForIdentifier:v6 handler:v11];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return [*(id *)(a1 + 32) _scheduleNextUpdateIfNeeded];
}

uint64_t __70__NMSMusicCatalogRecommendationsUpdater_beginAutomaticContentUpdating__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handlePrivacyAcknowledgementDidChangeForIdentifier:a2 isPrivacyAcknowledgementRequired:a3];
}

- (void)endAutomaticContentUpdating
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__NMSMusicCatalogRecommendationsUpdater_endAutomaticContentUpdating__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(queue, block);
}

void __68__NMSMusicCatalogRecommendationsUpdater_endAutomaticContentUpdating__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x263F576A8] object:*(void *)(*(void *)(a1 + 32) + 16)];

  dispatch_queue_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:*(void *)(a1 + 32) name:@"NMSSubscriptionStatusDidChangeNotification" object:*(void *)(*(void *)(a1 + 32) + 24)];

  [*(id *)(*(void *)(a1 + 32) + 32) endObservingPrivacyAcknowledgementForIdentifier:*MEMORY[0x263F88F78] withToken:*(void *)(*(void *)(a1 + 32) + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = 0;
}

- (void)_handlePairedDeviceRegistryDeviceDidPairNotification:(id)a3
{
  uint64_t v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Received device did pair notification.", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__NMSMusicCatalogRecommendationsUpdater__handlePairedDeviceRegistryDeviceDidPairNotification___block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __94__NMSMusicCatalogRecommendationsUpdater__handlePairedDeviceRegistryDeviceDidPairNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNextUpdateIfNeeded];
}

- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3
{
  uint64_t v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Received subscription did change notification.", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__NMSMusicCatalogRecommendationsUpdater__handleSubscriptionStatusDidChangeNotification___block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __88__NMSMusicCatalogRecommendationsUpdater__handleSubscriptionStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNextUpdateIfNeeded];
}

- (void)_handlePrivacyAcknowledgementDidChangeForIdentifier:(id)a3 isPrivacyAcknowledgementRequired:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = NMLogForCategory(5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = v6;
    __int16 v12 = 2048;
    BOOL v13 = v4;
    _os_log_impl(&dword_2228FD000, v7, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Received privacy acknowledgement did change for %@, isPrivacyAcknowledgementRequired: %ld.", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __126__NMSMusicCatalogRecommendationsUpdater__handlePrivacyAcknowledgementDidChangeForIdentifier_isPrivacyAcknowledgementRequired___block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __126__NMSMusicCatalogRecommendationsUpdater__handlePrivacyAcknowledgementDidChangeForIdentifier_isPrivacyAcknowledgementRequired___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNextUpdateIfNeeded];
}

- (void)_scheduleNextUpdateIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_updateScheduler)
  {
    dispatch_queue_t v3 = NMLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Invalidating previously scheduled update.", (uint8_t *)buf, 2u);
    }

    [(NSBackgroundActivityScheduler *)self->_updateScheduler invalidate];
    updateScheduler = self->_updateScheduler;
    self->_updateScheduler = 0;
  }
  if (([(NRPairedDeviceRegistry *)self->_pairedDeviceRegistry isPaired] & 1) == 0)
  {
    uint64_t v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      uint64_t v9 = "[Recommendation] (Music) (Catalog) Device is not paired, won't schedule next update.";
LABEL_15:
      _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)buf, 2u);
    }
LABEL_16:

    [(id)objc_opt_class() _clearLastUpdatedDateIfNeeded];
    return;
  }
  if (![(NMSSubscriptionManager *)self->_subscriptionManager hasCapability:1])
  {
    uint64_t v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      uint64_t v9 = "[Recommendation] (Music) (Catalog) Account does not have full catalog playback capability, won't schedule next update.";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  int v5 = [(ICPrivacyInfo *)self->_privacyInfo privacyAcknowledgementRequiredForMusic];
  id v6 = NMLogForCategory(5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Privacy acknowledgement is required for Music, won't schedule next update.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Will get bag to determine next update window...", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v10 = objc_alloc(MEMORY[0x263F89360]);
    id v11 = [MEMORY[0x263F893C0] activeAccount];
    __int16 v12 = (void *)[v10 initWithIdentity:v11];

    BOOL v13 = [MEMORY[0x263F893A0] sharedBagProvider];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke;
    v14[3] = &unk_264634C10;
    objc_copyWeak(&v15, buf);
    [v13 getBagForRequestContext:v12 withCompletionHandler:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

void __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v15 = WeakRetained;
  if (WeakRetained)
  {
    v16 = WeakRetained[1];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke_24;
    v17[3] = &unk_264634388;
    v17[4] = WeakRetained;
    id v18 = v5;
    dispatch_async(v16, v17);
  }
}

uint64_t __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNextUpdateWithBag:*(void *)(a1 + 40)];
}

- (void)_scheduleNextUpdateWithBag:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)[objc_alloc(MEMORY[0x263F086C0]) initWithIdentifier:@"com.apple.NanoMusicSync.NMSMusicCatalogRecommendationsUpdater"];
  long long v39 = 0uLL;
  uint64_t v40 = 0;
  id v6 = objc_opt_class();
  if (v6)
  {
    [v6 _configurationWithBag:v4];
  }
  else
  {
    long long v39 = 0uLL;
    uint64_t v40 = 0;
  }
  BOOL v7 = +[NMSyncDefaults sharedDefaults];
  uint64_t v8 = [v7 catalogRecommendationsLastUpdateDate];

  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    *(_OWORD *)buf = v39;
    *(void *)&uint8_t buf[16] = v40;
    [v9 _nextUpdateDelayAfterDate:v8 configuration:buf];
    double v11 = v10;
    BOOL v12 = v10 > 0.0;
    uint64_t v13 = NMLogForCategory(5);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v8;
        _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Last updated date is %@, will schedule next update for later.", buf, 0xCu);
      }

      [v5 setInterval:(double)(86400 * v39)];
      [v5 setDelay:v11];
      [v5 setTolerance:1800.0];
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v8;
        _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Last updated date is %@, will schedule next update for now.", buf, 0xCu);
      }
    }
  }
  else
  {
    id v15 = NMLogForCategory(5);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v15, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Last updated date not found, will schedule next update for now at a higher priority.", buf, 2u);
    }

    [v5 setQualityOfService:17];
  }
  if (self->_retryAttempt)
  {
    v16 = NMLogForCategory(5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t retryAttempt = self->_retryAttempt;
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = retryAttempt;
      _os_log_impl(&dword_2228FD000, v16, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Will schedule retry attempt: %lu.", buf, 0xCu);
    }

    unint64_t v18 = self->_retryAttempt;
    unint64_t v19 = [&unk_26D51CEC0 count];
    if (v18 >= v19) {
      unint64_t v20 = v19;
    }
    else {
      unint64_t v20 = v18;
    }
    v21 = [&unk_26D51CEA8 objectAtIndexedSubscript:v20 - 1];
    [v21 doubleValue];
    double v23 = v22;
    [v5 delay];
    [v5 setDelay:v24 + v23 * 60.0];

    [v5 setInterval:(double)(86400 * v39)];
    [v5 setTolerance:60.0];
  }
  v25 = NMLogForCategory(5);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (void *)MEMORY[0x263EFF910];
    [v5 delay];
    v27 = objc_msgSend(v26, "dateWithTimeIntervalSinceNow:");
    [v5 delay];
    uint64_t v29 = v28;
    [v5 tolerance];
    double v31 = v30;
    [v5 interval];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v27;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2048;
    double v42 = v31 / 60.0;
    __int16 v43 = 2048;
    uint64_t v44 = v32;
    _os_log_impl(&dword_2228FD000, v25, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Scheduling next update for %@ (in %f seconds) +/-%f minutes, interval: %f.", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateWithBag___block_invoke;
  v36[3] = &unk_264634C38;
  objc_copyWeak(&v38, (id *)buf);
  v33 = v5;
  v37 = v33;
  [(NSBackgroundActivityScheduler *)v33 scheduleWithBlock:v36];
  updateScheduler = self->_updateScheduler;
  self->_updateScheduler = v33;
  v35 = v33;

  objc_destroyWeak(&v38);
  objc_destroyWeak((id *)buf);
}

void __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateWithBag___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateWithBag___block_invoke_2;
    block[3] = &unk_264633C68;
    block[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v6, block);
  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }
}

uint64_t __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateWithBag___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextUpdateWithScheduler:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

+ ($76119E9FC4E615FCD2412858B276E5B9)_configurationWithBag:(SEL)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = v5;
  *(_OWORD *)&retstr->var0 = xmmword_2229506C0;
  retstr->var1.length = 235;
  if (v5)
  {
    BOOL v7 = [v5 numberForBagKey:@"forYouFetchMinutesStart"];
    id v8 = [v6 numberForBagKey:@"forYouFetchMinutesEnd"];
    id v9 = NMLogForCategory(5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412546;
      v26 = v7;
      __int16 v27 = 2112;
      uint64_t v28 = v8;
      _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Next update window from bag is: %@ - %@", (uint8_t *)&v25, 0x16u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v7 intValue] & 0x80000000) == 0
      && (int)[v8 intValue] <= 1439
      && (int v10 = [v8 intValue], v10 > (int)objc_msgSend(v7, "intValue")))
    {
      NSUInteger v11 = (int)[v7 intValue];
      int v12 = [v8 intValue];
      int v13 = [v7 intValue];
      retstr->var1.location = v11;
      retstr->var1.length = v12 - v13;
    }
    else
    {
      BOOL v14 = NMLogForCategory(5);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[NMSMusicCatalogRecommendationsUpdater _configurationWithBag:](v14);
      }
    }
  }
  id v15 = (void *)CFPreferencesCopyAppValue(@"debugForYouFetchConfigEnabled", @"com.apple.NanoMusicSync");
  if ([v15 BOOLValue])
  {
    v16 = (void *)CFPreferencesCopyAppValue(@"debugForYouFetchMinutesStart", @"com.apple.NanoMusicSync");
    v17 = (void *)CFPreferencesCopyAppValue(@"debugForYouFetchMinutesEnd", @"com.apple.NanoMusicSync");
    unint64_t v18 = NMLogForCategory(5);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412546;
      v26 = v16;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) (DebugOverrides) Update window from defaults is: %@ - %@", (uint8_t *)&v25, 0x16u);
    }

    NSUInteger v19 = (int)[v16 intValue];
    int v20 = [v17 intValue];
    int v21 = [v16 intValue];
    retstr->var1.location = v19;
    retstr->var1.length = v20 - v21;
    double v22 = (void *)CFPreferencesCopyAppValue(@"debugForYouFetchDaysFrequency", @"com.apple.NanoMusicSync");
    if (v22)
    {
      double v23 = NMLogForCategory(5);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412290;
        v26 = v22;
        _os_log_impl(&dword_2228FD000, v23, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) (DebugOverrides) Update interval from defaults is: %@ days.", (uint8_t *)&v25, 0xCu);
      }

      retstr->var0 = [v22 integerValue];
    }
  }
  return result;
}

+ (double)_nextUpdateDelayAfterDate:(id)a3 configuration:(id *)a4
{
  id v5 = (objc_class *)MEMORY[0x263EFF918];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setDay:a4->var0];
  id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v9 = [v8 dateByAddingComponents:v7 toDate:v6 options:2];

  int v10 = [v8 components:2097180 fromDate:v9];
  NSUInteger location = a4->var1.location;
  int64_t v12 = location + arc4random_uniform(a4->var1.length);
  [v10 setHour:v12 / 60];
  [v10 setMinute:v12 % 60];
  int v13 = [v8 dateFromComponents:v10];
  [v13 timeIntervalSinceNow];
  double v15 = v14;

  return v15;
}

- (BOOL)_needsInitialContentUpdate
{
  v2 = +[NMSyncDefaults sharedDefaults];
  id v3 = [v2 catalogRecommendationsLastUpdateDate];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)_performNextUpdateWithScheduler:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([(NRPairedDeviceRegistry *)self->_pairedDeviceRegistry isPaired] & 1) == 0)
  {
    id v9 = NMLogForCategory(5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      double v15 = "[Recommendation] (Music) (Catalog) Device is not paired, won't perform next update.";
LABEL_10:
      _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)buf, 2u);
    }
LABEL_11:

    [(id)objc_opt_class() _clearLastUpdatedDateIfNeeded];
    v7[2](v7, 1);
    goto LABEL_12;
  }
  BOOL v8 = [(NMSSubscriptionManager *)self->_subscriptionManager hasCapability:1];
  id v9 = NMLogForCategory(5);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      LOWORD(buf[0]) = 0;
      double v15 = "[Recommendation] (Music) (Catalog) Account does not have full catalog playback capability, won't perform next update.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v10)
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Will get bag to determine current staleness period...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v11 = objc_alloc(MEMORY[0x263F89360]);
  int64_t v12 = [MEMORY[0x263F893C0] activeAccount];
  int v13 = (void *)[v11 initWithIdentity:v12];

  double v14 = [MEMORY[0x263F893A0] sharedBagProvider];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke;
  v16[3] = &unk_264634C60;
  objc_copyWeak(&v19, buf);
  id v17 = v6;
  unint64_t v18 = v7;
  [v14 getBagForRequestContext:v13 withCompletionHandler:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(buf);
LABEL_12:
}

void __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  double v15 = WeakRetained;
  if (WeakRetained)
  {
    v16 = WeakRetained[1];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke_63;
    v17[3] = &unk_264634790;
    v17[4] = WeakRetained;
    id v18 = a1[4];
    id v19 = v5;
    id v20 = a1[5];
    dispatch_async(v16, v17);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

uint64_t __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke_63(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextUpdateWithScheduler:*(void *)(a1 + 40) urlBag:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_performNextUpdateWithScheduler:(id)a3 urlBag:(id)a4 completionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v8 shouldDefer])
  {
    uint64_t v11 = NMLogForCategory(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v11, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Background task asked to defer, won't perform next update.", buf, 2u);
    }

    v10[2](v10, 2);
    goto LABEL_16;
  }
  [(id)objc_opt_class() _stalenessIntervalWithBag:v9];
  if (v12 < 0.0)
  {
    uint64_t v13 = NMLogForCategory(5);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Bag indicates to never fetch, won't perform next update.", buf, 2u);
    }
LABEL_8:

    v10[2](v10, 1);
    double v14 = [MEMORY[0x263EFF910] date];
    double v15 = +[NMSyncDefaults sharedDefaults];
    [v15 setCatalogRecommendationsLastUpdateDate:v14];

    [(NMSMusicCatalogRecommendationsUpdater *)self _scheduleNextUpdateIfNeeded];
    goto LABEL_16;
  }
  double v16 = v12;
  id v17 = [[NMSAppActivityStatus alloc] initWithBundleID:@"com.apple.NanoMusic"];
  BOOL v18 = [(NMSAppActivityStatus *)v17 isAppContentDormantWithInterval:v16];

  uint64_t v13 = NMLogForCategory(5);
  BOOL v19 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v19)
    {
      *(_DWORD *)buf = 134217984;
      double v25 = v16;
      _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) App is considered content dormant for staleness interval: %f, won't perform next update.", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (v19)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Performing catalog recommendations request...", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  id v20 = objc_alloc_init(NMSMusicRecommendationsRequest);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke;
  v21[3] = &unk_264634C88;
  objc_copyWeak(&v23, (id *)buf);
  double v22 = v10;
  [(NMSMusicRecommendationsRequest *)v20 performWithResponseHandler:v21];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
LABEL_16:
}

void __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = NMLogForCategory(5);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v5;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Finished performing catalog recommendations request: %@", buf, 0xCu);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  double v16 = WeakRetained;
  if (WeakRetained)
  {
    id v17 = WeakRetained[1];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke_69;
    v18[3] = &unk_264634790;
    id v19 = v6;
    id v20 = v16;
    id v21 = v5;
    id v22 = *(id *)(a1 + 32);
    dispatch_async(v17, v18);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke_69(void *a1)
{
  if (!a1[4])
  {
    uint64_t v2 = *(void *)(a1[5] + 64);
    if (v2) {
      (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[6]);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();
  uint64_t v3 = a1[5];
  if (a1[4])
  {
    ++*(void *)(v3 + 56);
  }
  else
  {
    *(void *)(v3 + 56) = 0;
    BOOL v4 = [MEMORY[0x263EFF910] date];
    id v5 = +[NMSyncDefaults sharedDefaults];
    [v5 setCatalogRecommendationsLastUpdateDate:v4];
  }
  id v6 = (void *)a1[5];

  return [v6 _scheduleNextUpdateIfNeeded];
}

+ (double)_stalenessIntervalWithBag:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 numberForBagKey:@"forYouFetchDaysTillStale"];
    id v6 = NMLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Update staleness period from bag is: %@ days", (uint8_t *)&v16, 0xCu);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 doubleValue];
      double v8 = v7 * 24.0 * 60.0 * 60.0;
    }
    else
    {
      uint64_t v9 = NMLogForCategory(5);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[NMSMusicCatalogRecommendationsUpdater _stalenessIntervalWithBag:](v9);
      }

      double v8 = 1209600.0;
    }
  }
  else
  {
    double v8 = 1209600.0;
  }
  uint64_t v10 = (void *)CFPreferencesCopyAppValue(@"debugForYouFetchConfigEnabled", @"com.apple.NanoMusicSync");
  if ([v10 BOOLValue])
  {
    uint64_t v11 = (void *)CFPreferencesCopyAppValue(@"debugForYouFetchMinutesTillStale", @"com.apple.NanoMusicSync");
    [v11 doubleValue];
    double v13 = v12;
    uint64_t v14 = NMLogForCategory(5);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_2228FD000, v14, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) (DebugOverrides) Update staleness period from defaults is: %@ minutes", (uint8_t *)&v16, 0xCu);
    }
    double v8 = v13 * 60.0;
  }
  return v8;
}

+ (void)_clearLastUpdatedDateIfNeeded
{
  uint64_t v2 = +[NMSyncDefaults sharedDefaults];
  id v3 = [v2 catalogRecommendationsLastUpdateDate];

  if (v3)
  {
    BOOL v4 = NMLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Music) (Catalog) Clearing last updated date.", v6, 2u);
    }

    id v5 = +[NMSyncDefaults sharedDefaults];
    [v5 setCatalogRecommendationsLastUpdateDate:0];
  }
}

- (id)updateHandlerBlock
{
  return self->_updateHandlerBlock;
}

- (void)setUpdateHandlerBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandlerBlock, 0);
  objc_storeStrong((id *)&self->_updateScheduler, 0);
  objc_storeStrong((id *)&self->_privacyObservationToken, 0);
  objc_storeStrong((id *)&self->_privacyInfo, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __68__NMSMusicCatalogRecommendationsUpdater__scheduleNextUpdateIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_configurationWithBag:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2228FD000, log, OS_LOG_TYPE_ERROR, "[Recommendation] (Music) (Catalog) Invalid update window from bag, will fall back to use predefined values.", v1, 2u);
}

void __91__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __98__NMSMusicCatalogRecommendationsUpdater__performNextUpdateWithScheduler_urlBag_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_stalenessIntervalWithBag:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2228FD000, log, OS_LOG_TYPE_ERROR, "[Recommendation] (Music) (Catalog) Invalid update staleness period from bag, will fall back to use predefined values.", v1, 2u);
}

@end