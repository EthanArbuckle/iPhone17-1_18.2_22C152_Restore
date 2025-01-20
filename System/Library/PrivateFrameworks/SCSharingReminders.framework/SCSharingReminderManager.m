@interface SCSharingReminderManager
- (BOOL)cacheHasDueReminders;
- (BOOL)isWithinDeliveryWindow:(id)a3;
- (NSMutableSet)notificationsToRequest;
- (OS_dispatch_queue)workQueue;
- (SCArchivingService)archiverService;
- (SCLockdownService)wifiSyncService;
- (SCSharingReminderCache)sharingReminderCache;
- (SCSharingReminderManager)init;
- (SCSharingReminderManager)initWithCache:(id)a3 notificationService:(id)a4;
- (SCUNNotificationService)userNotificationService;
- (id)notificationDeliveryKey;
- (id)reminderForPairedComputer:(id)a3 delay:(double)a4;
- (id)validRemindersDueBy:(id)a3;
- (void)archiveCache:(id)a3 completion:(id)a4;
- (void)checkNotificationAvailabilityWithCompletion:(id)a3;
- (void)fetchStatusWithCompletion:(id)a3;
- (void)getNeededNotificationsWithCompletion:(id)a3;
- (void)handleNotificationAction:(id)a3;
- (void)handleNotificationEventWithName:(id)a3;
- (void)handleSignals:(id)a3 completion:(id)a4;
- (void)handleWifiSyncNotificationEventWithName:(id)a3;
- (void)loadOrMakeCache;
- (void)postDueSharingReminders;
- (void)postWifiSyncNotificationWithCompletion:(id)a3;
- (void)resetFeatureWithCompletion:(id)a3;
- (void)setArchiverService:(id)a3;
- (void)setNotificationsToRequest:(id)a3;
- (void)setReminderDelays:(id)a3 completion:(id)a4;
- (void)setSharingReminderCache:(id)a3;
- (void)setStatus:(id *)a3 completion:(id)a4;
- (void)setUserNotificationService:(id)a3;
- (void)setWifiSyncService:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userOpenedSafetyCheckWithCompletion:(id)a3;
- (void)validateCacheWithCompletion:(id)a3;
@end

@implementation SCSharingReminderManager

- (SCSharingReminderManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SCSharingReminderManager;
  v2 = [(SCSharingReminderManager *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.safetycheckd.SCSharingReminderManager", 0);
    [(SCSharingReminderManager *)v2 setWorkQueue:v3];

    v4 = objc_alloc_init(SCArchivingService);
    [(SCSharingReminderManager *)v2 setArchiverService:v4];

    v5 = [[SCUNNotificationService alloc] initWithDelegate:v2];
    [(SCSharingReminderManager *)v2 setUserNotificationService:v5];

    v6 = objc_alloc_init(SCLockdownService);
    [(SCSharingReminderManager *)v2 setWifiSyncService:v6];

    v7 = [MEMORY[0x263EFF9C0] set];
    [(SCSharingReminderManager *)v2 setNotificationsToRequest:v7];

    [(SCSharingReminderManager *)v2 loadOrMakeCache];
  }
  return v2;
}

- (SCSharingReminderManager)initWithCache:(id)a3 notificationService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCSharingReminderManager;
  v8 = [(SCSharingReminderManager *)&v14 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.safetycheckd.SCSharingReminderManager", 0);
    [(SCSharingReminderManager *)v8 setWorkQueue:v9];

    [(SCSharingReminderManager *)v8 setSharingReminderCache:v6];
    [(SCSharingReminderManager *)v8 setUserNotificationService:v7];
    v10 = objc_alloc_init(SCArchivingService);
    [(SCSharingReminderManager *)v8 setArchiverService:v10];

    v11 = objc_alloc_init(SCLockdownService);
    [(SCSharingReminderManager *)v8 setWifiSyncService:v11];

    v12 = [MEMORY[0x263EFF9C0] set];
    [(SCSharingReminderManager *)v8 setNotificationsToRequest:v12];

    [(SCSharingReminderManager *)v8 archiveCache:v6 completion:0];
  }

  return v8;
}

- (void)loadOrMakeCache
{
  dispatch_queue_t v3 = [(SCSharingReminderManager *)self archiverService];
  uint64_t v4 = objc_opt_class();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__SCSharingReminderManager_loadOrMakeCache__block_invoke;
  v5[3] = &unk_265496C60;
  v5[4] = self;
  [v3 getObjectOfClass:v4 atKey:@"SharingReminderCache" completion:v5];
}

void __43__SCSharingReminderManager_loadOrMakeCache__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    id v7 = SCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_25B654000, v7, OS_LOG_TYPE_DEFAULT, "\"Error [%@] retrieving cache. Creating new cache and saving it-- this shouldn't happen again!\"", (uint8_t *)&v11, 0xCu);
    }

    v8 = objc_opt_new();
    [*(id *)(a1 + 32) setSharingReminderCache:v8];

    dispatch_queue_t v9 = *(void **)(a1 + 32);
    v10 = [v9 sharingReminderCache];
    [v9 archiveCache:v10 completion:0];
  }
  else
  {
    [*(id *)(a1 + 32) setSharingReminderCache:a2];
  }
}

- (void)getNeededNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(SCSharingReminderManager *)self cacheHasDueReminders]
    && ([(SCSharingReminderManager *)self notificationsToRequest],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [(SCSharingReminderManager *)self notificationDeliveryKey],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 containsObject:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65__SCSharingReminderManager_getNeededNotificationsWithCompletion___block_invoke;
    v10[3] = &unk_265496C88;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [(SCSharingReminderManager *)self checkNotificationAvailabilityWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = [(SCSharingReminderManager *)self notificationsToRequest];
    dispatch_queue_t v9 = [v8 allObjects];
    (*((void (**)(id, void *, void))v4 + 2))(v4, v9, 0);
  }
}

void __65__SCSharingReminderManager_getNeededNotificationsWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained && a2)
  {
    char v7 = [WeakRetained notificationsToRequest];
    v8 = [v6 notificationDeliveryKey];
    [v7 addObject:v8];

    uint64_t v9 = *(void *)(a1 + 32);
    v10 = [v6 notificationsToRequest];
    id v11 = [v10 allObjects];
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v11, v12);
  }
}

- (void)handleNotificationEventWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(SCSharingReminderManager *)self notificationDeliveryKey];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__SCSharingReminderManager_handleNotificationEventWithName___block_invoke;
    v11[3] = &unk_265496CB0;
    objc_copyWeak(&v12, &location);
    [(SCSharingReminderManager *)self checkNotificationAvailabilityWithCompletion:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    char v7 = [(SCSharingReminderManager *)self wifiSyncService];
    v8 = [v7 interestedNotifications];
    int v9 = [v8 containsObject:v4];

    if (v9)
    {
      [(SCSharingReminderManager *)self handleWifiSyncNotificationEventWithName:v4];
    }
    else
    {
      v10 = SCLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SCSharingReminderManager handleNotificationEventWithName:]();
      }
    }
  }
}

void __60__SCSharingReminderManager_handleNotificationEventWithName___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      v8 = SCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = @"N";
        if (a2) {
          int v9 = @"Y";
        }
        int v10 = 138412546;
        id v11 = v9;
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl(&dword_25B654000, v8, OS_LOG_TYPE_INFO, "\"Skipping posting because of notification availability %@ and/or error %@\"", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      [WeakRetained postDueSharingReminders];
    }
  }
}

- (void)handleWifiSyncNotificationEventWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(SCSharingReminderManager *)self wifiSyncService];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke;
  v6[3] = &unk_265496D28;
  v6[4] = self;
  [v5 hostForIdentifier:v4 completion:v6];
}

void __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) sharingReminderCache];
    id v5 = [v4 ignoredIdentifiersForType:@"com.apple.safetycheckd.wifi"];

    if (v5
      && ([v3 lockdownFrameworkKey],
          int v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v5 containsObject:v6],
          v6,
          v7))
    {
      v8 = SCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v3;
        _os_log_impl(&dword_25B654000, v8, OS_LOG_TYPE_INFO, "\"Ignoring WiFi Sync activity with host %@\"", buf, 0xCu);
      }
    }
    else
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      int v9 = [*(id *)(a1 + 32) archiverService];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_14;
      v10[3] = &unk_265496D00;
      objc_copyWeak(&v12, (id *)buf);
      void v10[4] = *(void *)(a1 + 32);
      id v11 = v3;
      [v9 getIntAtKey:3 completion:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      int v7 = SCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_14_cold_1();
      }
    }
    else
    {
      v8 = +[SCSharingReminderKVStoreValue defaultForKey:3];
      uint64_t v9 = [v8 integerValue];

      if (v9 == a2)
      {
        do
        {
          a2 += arc4random_uniform(0x4D59u) + 1800;
          int v10 = *(void **)(a1 + 32);
          id v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)a2];
          LOBYTE(v10) = [v10 isWithinDeliveryWindow:v11];
        }
        while ((v10 & 1) == 0);
      }
      else
      {
        id v12 = SCLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v23 = a2;
          _os_log_impl(&dword_25B654000, v12, OS_LOG_TYPE_INFO, "\"Skipping time randomization for FeatureControlling value %ld\"", buf, 0xCu);
        }
      }
      double v13 = (double)a2;
      int v7 = [WeakRetained reminderForPairedComputer:*(void *)(a1 + 40) delay:(double)a2];
      id v14 = [WeakRetained sharingReminderCache];
      v21 = v7;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
      [v14 addSharingReminders:v15];

      v16 = [WeakRetained sharingReminderCache];
      [WeakRetained archiveCache:v16 completion:0];

      v17 = +[SCSharingReminderDeliveryTask taskRequestScheduledAfter:v13];
      v18 = SCLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = (uint64_t)v17;
        _os_log_impl(&dword_25B654000, v18, OS_LOG_TYPE_INFO, "\"Submitting task request %@ for reminder delivery\"", buf, 0xCu);
      }

      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_20;
      v19[3] = &unk_265496CD8;
      id v20 = 0;
      +[SCUtils submitTaskRequest:v17 completion:v19];
    }
  }
}

void __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_20(uint64_t a1, int a2)
{
  if (!a2 || *(void *)(a1 + 32))
  {
    id v3 = SCLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_20_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (id)reminderForPairedComputer:(id)a3 delay:(double)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 deviceName];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [v5 deviceName];
  }
  else
  {
    uint64_t v9 = [v5 marketingName];
    int v10 = [v9 isEqualToString:@"Windows PC"];

    if (v10) {
      uint64_t v8 = @"Windows PC";
    }
    else {
      uint64_t v8 = &stru_270900CD0;
    }
  }
  id v11 = [SCSharingReminder alloc];
  id v12 = [v5 lockdownFrameworkKey];
  double v13 = [(SCSharingReminder *)v11 initWithIdentifier:v12 displayName:v8 type:@"com.apple.safetycheckd.wifi" deliverAfter:a4];

  return v13;
}

- (void)postDueSharingReminders
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_25B654000, v0, v1, "\"SharingReminderManager could not form a request: %@ from the given sharing reminders: %@\"");
}

void __51__SCSharingReminderManager_postDueSharingReminders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      uint64_t v6 = SCLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __51__SCSharingReminderManager_postDueSharingReminders__block_invoke_cold_1();
      }
    }
    else
    {
      uint64_t v7 = [WeakRetained notificationsToRequest];
      uint64_t v8 = [v5 notificationDeliveryKey];
      [v7 removeObject:v8];

      uint64_t v9 = [v5 notificationDeliveryKey];
      +[SCUtils unregisterDarwinNotification:v9];

      int v10 = [v5 sharingReminderCache];
      [v10 removeSharingReminders:*(void *)(a1 + 32) wereDelivered:1];

      uint64_t v6 = [v5 sharingReminderCache];
      [v5 archiveCache:v6 completion:0];
    }
  }
}

- (void)postWifiSyncNotificationWithCompletion:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[SCSharingReminder alloc] initWithIdentifier:@"id" displayName:@"Windows PC" type:@"com.apple.safetycheckd.wifi" deliverAfter:0.0];
  uint64_t v6 = [(SCSharingReminderManager *)self userNotificationService];
  v13[0] = v5;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  uint64_t v8 = [v6 toUNNotificationRequest:v7];

  if (v8)
  {
    uint64_t v9 = [(SCSharingReminderManager *)self userNotificationService];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __67__SCSharingReminderManager_postWifiSyncNotificationWithCompletion___block_invoke;
    v11[3] = &unk_265496D78;
    id v12 = v4;
    [v9 addNotificationRequest:v8 withCompletionHandler:v11];

    int v10 = v12;
  }
  else
  {
    int v10 = SCLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SCSharingReminderManager postWifiSyncNotificationWithCompletion:]((uint64_t)v5, v10);
    }
  }
}

uint64_t __67__SCSharingReminderManager_postWifiSyncNotificationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

- (void)checkNotificationAvailabilityWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(SCSharingReminderManager *)self cacheHasDueReminders]
    && ([MEMORY[0x263EFF910] now],
        id v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = [(SCSharingReminderManager *)self isWithinDeliveryWindow:v5],
        v5,
        v6))
  {
    objc_initWeak(&location, self);
    uint64_t v7 = [(SCSharingReminderManager *)self archiverService];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke;
    v8[3] = &unk_265496DC8;
    objc_copyWeak(&v10, &location);
    v8[4] = self;
    id v9 = v4;
    [v7 getIntAtKey:0 completion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      uint64_t v7 = SCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_cold_1();
      }

      uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      id v9 = [WeakRetained sharingReminderCache];
      [v9 consecutiveNotificationCount];

      id v10 = [v6 sharingReminderCache];
      id v11 = [v10 lastFiredDate];

      if (v11)
      {
        id v12 = [v6 archiverService];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_37;
        v14[3] = &unk_265496DA0;
        id v13 = *(id *)(a1 + 40);
        v14[5] = v6;
        id v15 = v13;
        v14[4] = *(void *)(a1 + 32);
        [v12 getIntAtKey:1 completion:v14];

        goto LABEL_9;
      }
      uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v8();
  }
LABEL_9:
}

void __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_37(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = SCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_37_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    double v7 = (double)a2;
    uint64_t v8 = [*(id *)(a1 + 32) sharingReminderCache];
    long double v9 = exp2((double)[v8 consecutiveNotificationCount]) * v7;

    id v10 = [*(id *)(a1 + 40) sharingReminderCache];
    id v11 = [v10 lastFiredDate];
    id v12 = [v11 dateByAddingTimeInterval:(double)v9];

    id v13 = [MEMORY[0x263EFF910] now];
    id v14 = [v12 earlierDate:v13];
    [v14 isEqualToDate:v12];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)validRemindersDueBy:(id)a3
{
  id v4 = a3;
  id v5 = [(SCSharingReminderManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SCSharingReminderManager_validRemindersDueBy___block_invoke;
  block[3] = &unk_265496E10;
  block[4] = self;
  dispatch_sync(v5, block);

  BOOL v6 = [(SCSharingReminderManager *)self sharingReminderCache];
  double v7 = [v6 remindersDueBy:v4];

  return v7;
}

uint64_t __48__SCSharingReminderManager_validRemindersDueBy___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) validateCacheWithCompletion:&__block_literal_global_0];
}

void __48__SCSharingReminderManager_validRemindersDueBy___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    id v5 = SCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = @"Unknown";
      if (v4) {
        BOOL v6 = v4;
      }
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_error_impl(&dword_25B654000, v5, OS_LOG_TYPE_ERROR, "\"Error validating cache, error: %@\"", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)validateCacheWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  BOOL v6 = [(SCSharingReminderManager *)self wifiSyncService];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__SCSharingReminderManager_validateCacheWithCompletion___block_invoke;
  v9[3] = &unk_265496E38;
  v9[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 fetchWifiSyncIdentifiersWithCompletion:v9];
}

void __56__SCSharingReminderManager_validateCacheWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = [*(id *)(a1 + 32) sharingReminderCache];
  id v5 = [v4 scheduledReminders];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v27 = *(void *)v31;
    v28 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v11 = [v10 type];
        int v12 = [v11 isEqualToString:@"com.apple.safetycheckd.wifi"];

        if (!v12)
        {
          id v13 = SCLogger();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            __56__SCSharingReminderManager_validateCacheWithCompletion___block_invoke_cold_1((uint64_t)v36, (uint64_t)v10);
          }
LABEL_13:

LABEL_14:
          [*(id *)(a1 + 40) addObject:v10];
          continue;
        }
        if (!_os_feature_enabled_impl()) {
          goto LABEL_14;
        }
        id v13 = [v10 identifier];
        if (![v3 containsObject:v13]) {
          goto LABEL_13;
        }
        id v14 = [*(id *)(a1 + 32) sharingReminderCache];
        id v15 = [v10 type];
        [v14 ignoredIdentifiersForType:v15];
        v17 = id v16 = v3;
        [v10 identifier];
        uint64_t v18 = v7;
        id v20 = v19 = a1;
        char v29 = [v17 containsObject:v20];

        a1 = v19;
        uint64_t v7 = v18;

        id v3 = v16;
        uint64_t v8 = v27;

        id v5 = v28;
        if (v29) {
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v7);
  }

  if ([*(id *)(a1 + 40) count])
  {
    v21 = SCLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v22;
      _os_log_impl(&dword_25B654000, v21, OS_LOG_TYPE_INFO, "\"Removing reminders after validation check: %@\"", buf, 0xCu);
    }

    uint64_t v23 = [*(id *)(a1 + 32) sharingReminderCache];
    uint64_t v24 = [*(id *)(a1 + 40) allObjects];
    [v23 removeSharingReminders:v24 wereDelivered:0];

    v25 = *(void **)(a1 + 32);
    v26 = [v25 sharingReminderCache];
    [v25 archiveCache:v26 completion:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)archiveCache:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SCSharingReminderManager *)self archiverService];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__SCSharingReminderManager_archiveCache_completion___block_invoke;
  v11[3] = &unk_265496E60;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 setObject:v10 atKey:@"SharingReminderCache" completion:v11];
}

void __52__SCSharingReminderManager_archiveCache_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v6 = SCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__SCSharingReminderManager_archiveCache_completion___block_invoke_cold_1();
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (id)notificationDeliveryKey
{
  return @"com.apple.springboard.lockNotificationListEmptyAtScreenOn";
}

- (BOOL)isWithinDeliveryWindow:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [MEMORY[0x263EFFA18] systemTimeZone];
  uint64_t v7 = [v5 componentsInTimeZone:v6 fromDate:v4];

  LOBYTE(v5) = (unint64_t)([v7 hour] - 9) < 9;
  return (char)v5;
}

- (BOOL)cacheHasDueReminders
{
  id v3 = [MEMORY[0x263EFF910] now];
  id v4 = [(SCSharingReminderManager *)self validRemindersDueBy:v3];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(void))a5;
  id v9 = [v7 notification];
  id v10 = [v9 request];
  id v11 = [v10 content];
  id v12 = [v11 categoryIdentifier];

  if ([v12 hasPrefix:@"scsharingreminders"])
  {
    id v13 = [v7 actionIdentifier];
    [(SCSharingReminderManager *)self handleNotificationAction:v13];

    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v14 = SCLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SCSharingReminderManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]();
  }

  if (v8) {
LABEL_7:
  }
    v8[2](v8);
LABEL_8:
}

- (void)handleNotificationAction:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F1E0D0]])
  {
    BOOL v5 = [(SCSharingReminderManager *)self sharingReminderCache];
    [v5 incrementNotificationCount];
LABEL_5:

    id v6 = [(SCSharingReminderManager *)self sharingReminderCache];
    [(SCSharingReminderManager *)self archiveCache:v6 completion:0];

    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F1E0C8]])
  {
    BOOL v5 = [(SCSharingReminderManager *)self sharingReminderCache];
    [v5 resetNotificationCount];
    goto LABEL_5;
  }
  id v7 = SCLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[SCSharingReminderManager handleNotificationAction:]();
  }

LABEL_9:
}

- (void)userOpenedSafetyCheckWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SCSharingReminderManager *)self sharingReminderCache];
  [v5 resetNotificationCount];

  objc_initWeak(&location, self);
  id v6 = [(SCSharingReminderManager *)self archiverService];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__SCSharingReminderManager_userOpenedSafetyCheckWithCompletion___block_invoke;
  v8[3] = &unk_265496E88;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v6 getIntAtKey:2 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __64__SCSharingReminderManager_userOpenedSafetyCheckWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (v5)
  {
    uint64_t v8 = SCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __64__SCSharingReminderManager_userOpenedSafetyCheckWithCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v9 = [WeakRetained sharingReminderCache];
    [v9 deliverGeneralSharingReminderAfter:(double)a2];

    id v10 = [v7 sharingReminderCache];
    [v7 archiveCache:v10 completion:*(void *)(a1 + 32)];
  }
}

- (void)handleSignals:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v22 = a4;
  id v6 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v12 = [v11 signalType];
        int v13 = [v12 isEqualToString:@"userAcknowledgedShare"];

        id v14 = SCLogger();
        id v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = v11;
            _os_log_impl(&dword_25B654000, v15, OS_LOG_TYPE_INFO, "\"Ignoring future reminders for %@ and removing any existing ones\"", buf, 0xCu);
          }

          id v16 = [(SCSharingReminderManager *)self sharingReminderCache];
          v17 = [v11 sharingIdentifier];
          long long v33 = v17;
          uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
          uint64_t v19 = [v11 sharingType];
          [v16 addIgnoredIdentifiers:v18 withType:v19];
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[SCSharingReminderManager handleSignals:completion:]((uint64_t)v32, (uint64_t)v11);
          }

          id v16 = +[SCDaemonError errorWithCode:4];
          [v6 addObject:v16];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v8);
  }

  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __53__SCSharingReminderManager_handleSignals_completion___block_invoke;
  v24[3] = &unk_265496EB0;
  objc_copyWeak(&v27, (id *)buf);
  id v20 = v6;
  id v25 = v20;
  id v21 = v22;
  id v26 = v21;
  [(SCSharingReminderManager *)self validateCacheWithCompletion:v24];

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

void __53__SCSharingReminderManager_handleSignals_completion___block_invoke(id *a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5 || !a2)
  {
    uint64_t v8 = SCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __53__SCSharingReminderManager_handleSignals_completion___block_invoke_cold_1(v8);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v7 = [WeakRetained sharingReminderCache];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__SCSharingReminderManager_handleSignals_completion___block_invoke_2;
    v9[3] = &unk_265496E60;
    id v10 = a1[4];
    id v11 = a1[5];
    [WeakRetained archiveCache:v7 completion:v9];
  }
}

void __53__SCSharingReminderManager_handleSignals_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  if ([*(id *)(a1 + 32) count])
  {
    id v4 = +[SCDaemonError errorWithCode:2 underlyingErrors:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(void, BOOL, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4 == 0, v4);
}

- (void)fetchStatusWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(SCSharingReminderManager *)self archiverService];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke;
  v7[3] = &unk_265496F50;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 getValueAtKey:0 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained archiverService];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_2;
    v7[3] = &unk_265496F28;
    void v7[4] = v5;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    [v6 getValueAtKey:1 completion:v7];
  }
}

void __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = [v4 archiverService];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_3;
    v7[3] = &unk_265496F00;
    id v6 = *(void **)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    [v5 getValueAtKey:2 completion:v7];
  }
}

void __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = [v4 archiverService];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_4;
    v7[3] = &unk_265496ED8;
    id v6 = *(void **)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    id v9 = *(id *)(a1 + 48);
    id v10 = v3;
    id v11 = *(id *)(a1 + 56);
    [v5 getValueAtKey:3 completion:v7];
  }
}

void __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = [v7 sharingReminderCache];
    id v9 = v8;
    if (v8)
    {
      [v8 toCacheState];
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
    }

    uint64_t v22 = 0;
    LOBYTE(v20) = [*(id *)(a1 + 40) integerValue];
    *(void *)&long long v20 = v20;
    *((void *)&v20 + 1) = [*(id *)(a1 + 48) integerValue];
    *(void *)&long long v21 = [*(id *)(a1 + 56) integerValue];
    *((void *)&v21 + 1) = [v5 integerValue];
    char v10 = v26;
    LOBYTE(v22) = v26;
    id v23 = *((id *)&v26 + 1);
    id v24 = (id)v27;
    id v25 = *((id *)&v27 + 1);
    uint64_t v11 = *(void *)(a1 + 64);
    v15[0] = v20;
    v15[1] = v21;
    char v16 = v10;
    id v12 = v23;
    id v17 = v12;
    id v13 = v24;
    id v18 = v13;
    id v14 = v25;
    id v19 = v14;
    (*(void (**)(uint64_t, _OWORD *))(v11 + 16))(v11, v15);
  }
}

- (void)resetFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  configWithGlobalDefaults(&v16);
  id v5 = objc_opt_new();
  id v6 = v5;
  if (v5)
  {
    [v5 toCacheState];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }

  v11[0] = v16;
  v11[1] = v17;
  char v12 = v18;
  id v7 = *((id *)&v18 + 1);
  id v13 = v7;
  id v8 = (id)v19;
  id v14 = v8;
  id v9 = *((id *)&v19 + 1);
  id v15 = v9;
  if (self)
  {
    [(SCSharingReminderManager *)self setStatus:v11 completion:v4];
  }
  else
  {
    char v10 = v9;
  }
}

- (void)setStatus:(id *)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [[SCSharingReminderKVStoreValue alloc] initWithIntegerValue:a3->var0.var0];
  long long v27 = [[SCSharingReminderKVStoreValue alloc] initWithIntegerValue:a3->var0.var1];
  id v8 = [[SCSharingReminderKVStoreValue alloc] initWithIntegerValue:a3->var0.var3];
  long long v26 = [[SCSharingReminderKVStoreValue alloc] initWithIntegerValue:a3->var0.var2];
  objc_initWeak(location, self);
  id v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  char v10 = [(SCSharingReminderManager *)self archiverService];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __49__SCSharingReminderManager_setStatus_completion___block_invoke;
  v45[3] = &unk_265496F78;
  objc_copyWeak(&v48, location);
  id v11 = v6;
  id v47 = v11;
  char v12 = v9;
  v46 = v12;
  [v10 setValue:v7 atKey:0 completion:v45];
  id v25 = v7;

  dispatch_group_enter(v12);
  id v13 = [(SCSharingReminderManager *)self archiverService];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __49__SCSharingReminderManager_setStatus_completion___block_invoke_55;
  v41[3] = &unk_265496F78;
  objc_copyWeak(&v44, location);
  id v14 = v11;
  id v43 = v14;
  id v15 = v12;
  v42 = v15;
  [v13 setValue:v27 atKey:1 completion:v41];

  dispatch_group_enter(v15);
  long long v16 = [(SCSharingReminderManager *)self archiverService];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __49__SCSharingReminderManager_setStatus_completion___block_invoke_56;
  v37[3] = &unk_265496F78;
  objc_copyWeak(&v40, location);
  id v17 = v14;
  id v39 = v17;
  long long v18 = v15;
  uint64_t v38 = v18;
  [v16 setValue:v26 atKey:2 completion:v37];

  dispatch_group_enter(v18);
  long long v19 = [(SCSharingReminderManager *)self archiverService];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __49__SCSharingReminderManager_setStatus_completion___block_invoke_57;
  v33[3] = &unk_265496F78;
  objc_copyWeak(&v36, location);
  id v20 = v17;
  id v35 = v20;
  long long v21 = v18;
  v34 = v21;
  [v19 setValue:v8 atKey:3 completion:v33];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3254779904;
  block[2] = __49__SCSharingReminderManager_setStatus_completion___block_invoke_58;
  block[3] = &unk_270900AA0;
  long long v22 = *(_OWORD *)&a3->var0.var0;
  long long v23 = *(_OWORD *)&a3->var0.var2;
  a3 = ($FD6C089DBE29D0470B3336F97308C734 *)((char *)a3 + 32);
  long long v30 = v22;
  long long v31 = v23;
  __copy_constructor_8_8_t0w1_s8_s16_s24((uint64_t)v32, (uint64_t)a3);
  block[4] = self;
  id v29 = v20;
  id v24 = v20;
  dispatch_group_notify(v21, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v40);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v48);

  objc_destroyWeak(location);
  __destructor_8_s8_s16_s24((uint64_t)a3);
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v7 = SCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_cold_1();
      }

      uint64_t v8 = *(void *)(a1 + 40);
      v11[0] = v5;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      char v10 = +[SCDaemonError errorWithCode:2 underlyingErrors:v9];
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v7 = SCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_55_cold_1();
      }

      uint64_t v8 = *(void *)(a1 + 40);
      v11[0] = v5;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      char v10 = +[SCDaemonError errorWithCode:2 underlyingErrors:v9];
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v7 = SCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_56_cold_1();
      }

      uint64_t v8 = *(void *)(a1 + 40);
      v11[0] = v5;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      char v10 = +[SCDaemonError errorWithCode:2 underlyingErrors:v9];
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v7 = SCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_57_cold_1();
      }

      uint64_t v8 = *(void *)(a1 + 40);
      v11[0] = v5;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      char v10 = +[SCDaemonError errorWithCode:2 underlyingErrors:v9];
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_58(uint64_t a1)
{
  v2 = SCSharingReminderCache;
  __copy_constructor_8_8_t0w1_s8_s16_s24((uint64_t)v3, a1 + 80);
  if (SCSharingReminderCache)
  {
    v2 = +[SCSharingReminderCache cacheWithState:v3];
  }
  else
  {
  }
  [*(id *)(a1 + 32) setSharingReminderCache:v2];
  [*(id *)(a1 + 32) archiveCache:v2 completion:*(void *)(a1 + 40)];
}

- (void)setReminderDelays:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [SCSharingReminderKVStoreValue alloc];
  id v9 = [v6 objectAtIndexedSubscript:0];
  char v10 = -[SCSharingReminderKVStoreValue initWithIntegerValue:](v8, "initWithIntegerValue:", [v9 longLongValue]);

  id v11 = [SCSharingReminderKVStoreValue alloc];
  char v12 = [v6 objectAtIndexedSubscript:1];
  long long v28 = -[SCSharingReminderKVStoreValue initWithIntegerValue:](v11, "initWithIntegerValue:", [v12 longLongValue]);

  id v13 = [SCSharingReminderKVStoreValue alloc];
  long long v27 = v6;
  id v14 = [v6 objectAtIndexedSubscript:2];
  id v15 = -[SCSharingReminderKVStoreValue initWithIntegerValue:](v13, "initWithIntegerValue:", [v14 longLongValue]);

  objc_initWeak(location, self);
  long long v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  id v17 = [(SCSharingReminderManager *)self archiverService];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke;
  v39[3] = &unk_265496F78;
  objc_copyWeak(&v42, location);
  id v18 = v7;
  id v41 = v18;
  long long v19 = v16;
  id v40 = v19;
  [v17 setValue:v10 atKey:1 completion:v39];

  dispatch_group_enter(v19);
  id v20 = [(SCSharingReminderManager *)self archiverService];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_59;
  v35[3] = &unk_265496F78;
  objc_copyWeak(&v38, location);
  id v21 = v18;
  id v37 = v21;
  long long v22 = v19;
  id v36 = v22;
  [v20 setValue:v28 atKey:2 completion:v35];

  dispatch_group_enter(v22);
  long long v23 = [(SCSharingReminderManager *)self archiverService];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_60;
  v31[3] = &unk_265496F78;
  objc_copyWeak(&v34, location);
  id v24 = v21;
  id v33 = v24;
  id v25 = v22;
  long long v32 = v25;
  [v23 setValue:v15 atKey:3 completion:v31];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_61;
  block[3] = &unk_265496FA0;
  id v30 = v24;
  id v26 = v24;
  dispatch_group_notify(v25, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v42);
  objc_destroyWeak(location);
}

void __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v7 = SCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_cold_1();
      }

      uint64_t v8 = *(void *)(a1 + 40);
      v11[0] = v5;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      char v10 = +[SCDaemonError errorWithCode:2 underlyingErrors:v9];
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v7 = SCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_56_cold_1();
      }

      uint64_t v8 = *(void *)(a1 + 40);
      v11[0] = v5;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      char v10 = +[SCDaemonError errorWithCode:2 underlyingErrors:v9];
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_60(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v7 = SCLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_57_cold_1();
      }

      uint64_t v8 = *(void *)(a1 + 40);
      v11[0] = v5;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
      char v10 = +[SCDaemonError errorWithCode:2 underlyingErrors:v9];
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

uint64_t __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SCSharingReminderCache)sharingReminderCache
{
  return self->_sharingReminderCache;
}

- (void)setSharingReminderCache:(id)a3
{
}

- (SCArchivingService)archiverService
{
  return self->_archiverService;
}

- (void)setArchiverService:(id)a3
{
}

- (SCUNNotificationService)userNotificationService
{
  return self->_userNotificationService;
}

- (void)setUserNotificationService:(id)a3
{
}

- (SCLockdownService)wifiSyncService
{
  return self->_wifiSyncService;
}

- (void)setWifiSyncService:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSMutableSet)notificationsToRequest
{
  return self->_notificationsToRequest;
}

- (void)setNotificationsToRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsToRequest, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_wifiSyncService, 0);
  objc_storeStrong((id *)&self->_userNotificationService, 0);
  objc_storeStrong((id *)&self->_archiverService, 0);
  objc_storeStrong((id *)&self->_sharingReminderCache, 0);
}

- (void)handleNotificationEventWithName:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Received unrecognized notification event: %@, doing nothing\"", v2, v3, v4, v5, v6);
}

void __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_14_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Could not fetch delay, so could not schedule reminder. Error: %@\"", v2, v3, v4, v5, v6);
}

void __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_20_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__SCSharingReminderManager_postDueSharingReminders__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Error posting notification: %@\"", v2, v3, v4, v5, v6);
}

- (void)postWifiSyncNotificationWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_25B654000, a2, OS_LOG_TYPE_ERROR, "\"SharingReminderManager could not form a request: %@ for a reminder with type: %@\"", (uint8_t *)&v2, 0x16u);
}

void __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Couldn't check notif status. Max count error: %@\"", v2, v3, v4, v5, v6);
}

void __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Couldn't fetch backstop interval length. Error: %@\"", v2, v3, v4, v5, v6);
}

void __56__SCSharingReminderManager_validateCacheWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "type");
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_4(&dword_25B654000, v5, v6, "\"Cannot validate cache against unrecognized type: %@\"");
}

void __52__SCSharingReminderManager_archiveCache_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_25B654000, v0, v1, "\"Archiving error: %@. Failed to archive cache: %@\"");
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Unknown notification category identifier: %@\"", v2, v3, v4, v5, v6);
}

- (void)handleNotificationAction:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Unknown notification action identifier: %@\"", v2, v3, v4, v5, v6);
}

void __64__SCSharingReminderManager_userOpenedSafetyCheckWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_25B654000, v0, v1, "\"Error retrieving general time interval after SC use: %@\"", v2, v3, v4, v5, v6);
}

- (void)handleSignals:(uint64_t)a1 completion:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_5(a1, a2), "signalType");
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_4(&dword_25B654000, v5, v6, "\"Received unrecognized sharing reminder signal type: %@\"");
}

void __53__SCSharingReminderManager_handleSignals_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_25B654000, log, OS_LOG_TYPE_ERROR, "\"Cache validation failed, returning error...\"", v1, 2u);
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25B654000, v0, v1, "\"Error setting maximum notification count: %@ %s\"");
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25B654000, v0, v1, "\"Error setting backstop length: %@ %s\"");
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_56_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25B654000, v0, v1, "\"Error setting general time interval: %@ %s\"");
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_57_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25B654000, v0, v1, "\"Error setting short time interval: %@ %s\"");
}

void __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_25B654000, v0, v1, "\"Error setting backstop delay: %@ %s\"");
}

@end