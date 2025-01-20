@interface UNCLocalNotificationClient
- (UNCLocalNotificationClient)initWithNotificationRepository:(id)a3 pendingNotificationRepository:(id)a4 notificationScheduleRepository:(id)a5 locationMonitor:(id)a6 bundleIdentifier:(id)a7 queue:(id)a8;
- (id)_dateFormatter;
- (id)_lastLocalNotificationFireDate;
- (id)_pendingNotificationRecords;
- (id)_sanitizeNotificationRecords:(id)a3;
- (id)pendingNotificationRecords;
- (id)undeliveredNotificationRecords;
- (void)_fireNotification:(id)a3;
- (void)_invalidateNotificationRecordTimersAndRegionMonitors;
- (void)_invalidatePendingNotificationRecordRegionMonitors;
- (void)_invalidatePendingNotificationRecordTimers;
- (void)_queue_triggerDidFireForDate:(id)a3;
- (void)_queue_triggerDidFireForRegion:(id)a3;
- (void)_queue_triggerDidFireForTimer:(id)a3;
- (void)_setLastLocalNotificationFireDate:(id)a3;
- (void)_setMonitoredRegions:(id)a3;
- (void)_setPendingNotificationRecords:(id)a3;
- (void)_setRequestDateForPendingNotificationRecords:(id)a3;
- (void)_updateRegionMonitorsForPendingNotificationRecords:(id)a3;
- (void)_updateTimersAndRegionMonitorsForPendingNotificationRecords:(id)a3;
- (void)_updateTimersForPendingNotificationRecords:(id)a3;
- (void)addPendingNotificationRecords:(id)a3;
- (void)dealloc;
- (void)handleApplicationStateRestore;
- (void)handleLocaleChange;
- (void)handleSignificantTimeChange;
- (void)invalidate;
- (void)locationMonitor:(id)a3 triggerDidFireForRegion:(id)a4 forBundleIdentifier:(id)a5;
- (void)pendingNotificationRecords;
- (void)removeAllPendingNotificationRecords;
- (void)removePendingNotificationRecords:(id)a3;
- (void)removePendingNotificationRecordsWithIdentifiers:(id)a3;
- (void)setPendingNotificationRecords:(id)a3;
@end

@implementation UNCLocalNotificationClient

- (id)_dateFormatter
{
  if (_dateFormatter___once != -1) {
    dispatch_once(&_dateFormatter___once, &__block_literal_global_3);
  }
  v2 = (void *)_dateFormatter___dateFormatter;

  return v2;
}

uint64_t __44__UNCLocalNotificationClient__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_dateFormatter___dateFormatter;
  _dateFormatter___dateFormatter = (uint64_t)v0;

  v2 = (void *)_dateFormatter___dateFormatter;

  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss'.'SSS Z"];
}

- (UNCLocalNotificationClient)initWithNotificationRepository:(id)a3 pendingNotificationRepository:(id)a4 notificationScheduleRepository:(id)a5 locationMonitor:(id)a6 bundleIdentifier:(id)a7 queue:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = a8;
  dispatch_assert_queue_V2(v17);
  v26.receiver = self;
  v26.super_class = (Class)UNCLocalNotificationClient;
  v18 = [(UNCLocalNotificationClient *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_notificationRepository, a3);
    objc_storeStrong((id *)&v19->_notificationScheduleRepository, a5);
    objc_storeStrong((id *)&v19->_pendingNotificationRepository, a4);
    objc_storeStrong((id *)&v19->_locationMonitor, a6);
    [(UNCLocationMonitor *)v19->_locationMonitor addObserver:v19 forBundleIdentifier:v16];
    objc_storeStrong((id *)&v19->_bundleIdentifier, a7);
    objc_storeStrong((id *)&v19->_queue, a8);
    v20 = [(UNCLocalNotificationClient *)v19 _pendingNotificationRecords];
    v21 = [(UNCLocalNotificationClient *)v19 _sanitizeNotificationRecords:v20];
    [(UNCLocalNotificationClient *)v19 _updateTimersAndRegionMonitorsForPendingNotificationRecords:v21];
  }
  return v19;
}

- (void)dealloc
{
  [(UNCLocalNotificationClient *)self _invalidateNotificationRecordTimersAndRegionMonitors];
  [(UNCLocationMonitor *)self->_locationMonitor removeObserver:self forBundleIdentifier:self->_bundleIdentifier];
  v3.receiver = self;
  v3.super_class = (Class)UNCLocalNotificationClient;
  [(UNCLocalNotificationClient *)&v3 dealloc];
}

- (void)addPendingNotificationRecords:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (os_log_t *)MEMORY[0x263F1E040];
  v6 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v8 = v6;
    uint64_t v9 = [v4 count];
    v10 = [v4 valueForKey:@"identifier"];
    v11 = [v10 valueForKey:@"un_logDigest"];
    *(_DWORD *)buf = 138543874;
    v31 = bundleIdentifier;
    __int16 v32 = 2048;
    uint64_t v33 = v9;
    __int16 v34 = 2114;
    v35 = v11;
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Add %ld pending notifications: %{public}@", buf, 0x20u);
  }
  if (UNIsInternalInstall())
  {
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
      [(UNCLocalNotificationClient *)(uint64_t)self addPendingNotificationRecords:v12];
    }
  }
  v13 = [(UNCLocalNotificationClient *)self _pendingNotificationRecords];
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v13 count]) {
    [v14 addObjectsFromArray:v13];
  }
  id v23 = v13;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __60__UNCLocalNotificationClient_addPendingNotificationRecords___block_invoke;
        v24[3] = &unk_265567938;
        v24[4] = v20;
        v21 = [v14 indexesOfObjectsPassingTest:v24];
        if ([v21 count]) {
          [v14 removeObjectsAtIndexes:v21];
        }
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }

  v22 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-1.0];
  [(UNCLocalNotificationClient *)self _setLastLocalNotificationFireDate:v22];

  [(UNCLocalNotificationClient *)self _setRequestDateForPendingNotificationRecords:v15];
  [(UNCLocalNotificationClient *)self _setPendingNotificationRecords:v14];
}

uint64_t __60__UNCLocalNotificationClient_addPendingNotificationRecords___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)setPendingNotificationRecords:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = (os_log_t *)MEMORY[0x263F1E040];
  v6 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v8 = v6;
    uint64_t v9 = [v4 count];
    v10 = [v4 valueForKey:@"identifier"];
    v11 = [v10 valueForKey:@"un_logDigest"];
    int v14 = 138543874;
    id v15 = bundleIdentifier;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set %ld pending notifications: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  if (UNIsInternalInstall())
  {
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG)) {
      [(UNCLocalNotificationClient *)(uint64_t)self setPendingNotificationRecords:v12];
    }
  }
  [(UNCLocalNotificationClient *)self _setRequestDateForPendingNotificationRecords:v4];
  v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-1.0];
  [(UNCLocalNotificationClient *)self _setLastLocalNotificationFireDate:v13];

  [(UNCLocalNotificationClient *)self _setPendingNotificationRecords:v4];
}

- (void)removePendingNotificationRecordsWithIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    v7 = v5;
    uint64_t v8 = [v4 count];
    uint64_t v9 = [v4 valueForKey:@"un_logDigest"];
    *(_DWORD *)buf = 138543874;
    __int16 v16 = bundleIdentifier;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove %ld pending notifications by identifier: %{public}@", buf, 0x20u);
  }
  v10 = [(UNCPendingNotificationRepository *)self->_pendingNotificationRepository pendingNotificationRecordsForBundleIdentifier:self->_bundleIdentifier];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__UNCLocalNotificationClient_removePendingNotificationRecordsWithIdentifiers___block_invoke;
  v13[3] = &unk_265567960;
  id v14 = v4;
  id v11 = v4;
  v12 = objc_msgSend(v10, "bs_filter:", v13);
  [(UNCLocalNotificationClient *)self _setPendingNotificationRecords:v12];
}

uint64_t __78__UNCLocalNotificationClient_removePendingNotificationRecordsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)removePendingNotificationRecords:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = (NSObject **)MEMORY[0x263F1E040];
  v6 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    uint64_t v8 = v6;
    *(_DWORD *)buf = 138543618;
    long long v25 = bundleIdentifier;
    __int16 v26 = 2048;
    uint64_t v27 = [v4 count];
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove %ld pending notifications by match", buf, 0x16u);
  }
  uint64_t v9 = [(UNCPendingNotificationRepository *)self->_pendingNotificationRepository pendingNotificationRecordsForBundleIdentifier:self->_bundleIdentifier];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __63__UNCLocalNotificationClient_removePendingNotificationRecords___block_invoke;
  uint64_t v21 = &unk_265567988;
  id v10 = v4;
  id v22 = v10;
  id v23 = self;
  id v11 = objc_msgSend(v9, "bs_filter:", &v18);
  unint64_t v12 = objc_msgSend(v11, "count", v18, v19, v20, v21);
  uint64_t v13 = [v9 count];
  unint64_t v14 = v13 - [v10 count];
  id v15 = *v5;
  __int16 v16 = *v5;
  if (v12 <= v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543362;
      long long v25 = v17;
      _os_log_impl(&dword_2608DB000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove pending notifications succeeded", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    -[UNCLocalNotificationClient removePendingNotificationRecords:]((uint64_t *)&self->_bundleIdentifier, v15);
  }
  [(UNCLocalNotificationClient *)self _setPendingNotificationRecords:v11];
}

uint64_t __63__UNCLocalNotificationClient_removePendingNotificationRecords___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = objc_msgSend(*(id *)(a1 + 32), "uns_containsSimilarRecord:", v3);
  if (v4)
  {
    uint64_t v5 = (void *)*MEMORY[0x263F1E040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      v7 = v5;
      uint64_t v8 = [v3 identifier];
      uint64_t v9 = objc_msgSend(v8, "un_logDigest");
      int v11 = 138543618;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      unint64_t v14 = v9;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will remove notification %{public}@ by match", (uint8_t *)&v11, 0x16u);
    }
  }

  return v4 ^ 1u;
}

- (void)removeAllPendingNotificationRecords
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = *MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v5 = 138543362;
    uint64_t v6 = bundleIdentifier;
    _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove all pending notifications", (uint8_t *)&v5, 0xCu);
  }
  [(UNCLocalNotificationClient *)self _setPendingNotificationRecords:MEMORY[0x263EFFA68]];
}

- (id)pendingNotificationRecords
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(UNCLocalNotificationClient *)self _pendingNotificationRecords];
  int v4 = (os_log_t *)MEMORY[0x263F1E040];
  int v5 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    uint64_t v7 = v5;
    int v10 = 138543618;
    int v11 = bundleIdentifier;
    __int16 v12 = 2048;
    uint64_t v13 = [v3 count];
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Load pending %ld notifications", (uint8_t *)&v10, 0x16u);
  }
  if (UNIsInternalInstall())
  {
    os_log_t v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG)) {
      [(UNCLocalNotificationClient *)(uint64_t)self pendingNotificationRecords];
    }
  }

  return v3;
}

- (id)undeliveredNotificationRecords
{
  id v3 = [(UNCLocalNotificationClient *)self _pendingNotificationRecords];
  int v4 = v3;
  if (self->_lazy_pendingNotificationsAwaitingDelivery)
  {
    uint64_t v5 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:");

    int v4 = (void *)v5;
  }

  return v4;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);

  [(UNCLocalNotificationClient *)self _invalidateNotificationRecordTimersAndRegionMonitors];
}

- (void)handleApplicationStateRestore
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(UNCLocalNotificationClient *)self _pendingNotificationRecords];
  [(UNCLocalNotificationClient *)self _updateTimersAndRegionMonitorsForPendingNotificationRecords:v3];
}

- (void)handleLocaleChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_monitoringLocaleAndTimeChanges)
  {
    id v3 = [(UNCLocalNotificationClient *)self _pendingNotificationRecords];
    [(UNCLocalNotificationClient *)self _updateTimersForPendingNotificationRecords:v3];
  }
}

- (void)handleSignificantTimeChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_monitoringLocaleAndTimeChanges)
  {
    id v3 = [(UNCLocalNotificationClient *)self _pendingNotificationRecords];
    [(UNCLocalNotificationClient *)self _updateTimersForPendingNotificationRecords:v3];
  }
}

- (void)_setRequestDateForPendingNotificationRecords:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [MEMORY[0x263EFF910] date];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setRequestDate:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_setPendingNotificationRecords:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(UNCLocalNotificationClient *)self _sanitizeNotificationRecords:v4];
  uint64_t v6 = (void *)[v5 mutableCopy];
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__UNCLocalNotificationClient__setPendingNotificationRecords___block_invoke;
  v11[3] = &unk_2655679B0;
  v11[4] = &v12;
  [v6 enumerateObjectsUsingBlock:v11];
  unint64_t v7 = v13[3];
  if (v7 >= 0x15) {
    objc_msgSend(v6, "removeObjectsInRange:", 20, v7 - 20);
  }
  if ((unint64_t)[v6 count] >= 0x41) {
    objc_msgSend(v6, "removeObjectsInRange:", 0, objc_msgSend(v6, "count") - 64);
  }
  uint64_t v8 = (id)*MEMORY[0x263F1E040];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    uint64_t v10 = [v6 count];
    *(_DWORD *)buf = 138543618;
    __int16 v17 = bundleIdentifier;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Save pending %ld notifications to pending notification repository", buf, 0x16u);
  }

  [(UNCPendingNotificationRepository *)self->_pendingNotificationRepository setPendingNotificationRecords:v6 forBundleIdentifier:self->_bundleIdentifier];
  [(UNCLocalNotificationClient *)self _updateTimersAndRegionMonitorsForPendingNotificationRecords:v6];
  _Block_object_dispose(&v12, 8);
}

void __61__UNCLocalNotificationClient__setPendingNotificationRecords___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  uint64_t v6 = [a2 triggerType];
  int v7 = [v6 isEqualToString:@"Location"];

  if (v7)
  {
    char v8 = 0;
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    char v8 = 1;
  }
  *a4 = v8;
}

- (id)_pendingNotificationRecords
{
  return [(UNCPendingNotificationRepository *)self->_pendingNotificationRepository pendingNotificationRecordsForBundleIdentifier:self->_bundleIdentifier];
}

- (id)_sanitizeNotificationRecords:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38 = self;
  id v5 = [(UNCLocalNotificationClient *)self _lastLocalNotificationFireDate];
  id v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v40;
    *(void *)&long long v8 = 138543618;
    long long v35 = v8;
    id v36 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v13 = (*((void (**)(uint64_t, void *))UNSNotificationRecordToUNNotificationTrigger + 2))((uint64_t)UNSNotificationRecordToUNNotificationTrigger, v12);
        if (([v12 willNotifyUser] & 1) == 0)
        {
          uint64_t v14 = [v12 badge];
          uint64_t v15 = [v14 integerValue];

          if (!v15)
          {
            v30 = (void *)*MEMORY[0x263F1E040];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_19;
            }
            bundleIdentifier = v38->_bundleIdentifier;
            uint64_t v19 = v30;
            __int16 v32 = [v12 identifier];
            uint64_t v33 = objc_msgSend(v32, "un_logDigest");
            *(_DWORD *)buf = v35;
            v44 = bundleIdentifier;
            __int16 v45 = 2114;
            v46 = v33;
            _os_log_impl(&dword_2608DB000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Filtering out notification %{public}@ as it will not notify user on delivery", buf, 0x16u);

            goto LABEL_18;
          }
        }
        if ((objc_msgSend(v12, "triggerRepeats", v35) & 1) == 0)
        {
          __int16 v16 = [v12 date];

          if (v16)
          {
            __int16 v17 = (void *)*MEMORY[0x263F1E040];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_19;
            }
            __int16 v18 = v38->_bundleIdentifier;
            uint64_t v19 = v17;
            uint64_t v20 = [v12 identifier];
            uint64_t v21 = objc_msgSend(v20, "un_logDigest");
            id v22 = [v12 date];
            *(_DWORD *)buf = 138543874;
            v44 = v18;
            id v6 = v36;
            __int16 v45 = 2114;
            v46 = v21;
            __int16 v47 = 2114;
            v48 = v22;
            _os_log_impl(&dword_2608DB000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Expiring out non-repeating notification %{public}@ because it triggered at %{public}@", buf, 0x20u);

LABEL_18:
            goto LABEL_19;
          }
        }
        id v23 = [v12 requestDate];
        char v24 = [v13 willTriggerAfterDate:v5 withRequestedDate:v23];

        if (v24)
        {
          [v37 addObject:v12];
        }
        else
        {
          long long v25 = (void *)*MEMORY[0x263F1E040];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
          {
            __int16 v26 = v38->_bundleIdentifier;
            uint64_t v27 = v25;
            uint64_t v28 = [v12 identifier];
            v29 = objc_msgSend(v28, "un_logDigest");
            *(_DWORD *)buf = 138543874;
            v44 = v26;
            id v6 = v36;
            __int16 v45 = 2114;
            v46 = v29;
            __int16 v47 = 2114;
            v48 = v5;
            _os_log_impl(&dword_2608DB000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Expiring out notification %{public}@ because it won't trigger after %{public}@", buf, 0x20u);
          }
        }
LABEL_19:
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v9);
  }

  return v37;
}

- (void)_fireNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    uint64_t v7 = v5;
    long long v8 = [v4 identifier];
    uint64_t v9 = objc_msgSend(v8, "un_logDigest");
    uint64_t v10 = [(UNCLocalNotificationClient *)self _dateFormatter];
    long long v11 = [MEMORY[0x263EFF910] date];
    uint64_t v12 = [v10 stringFromDate:v11];
    *(_DWORD *)buf = 138543874;
    id v22 = bundleIdentifier;
    __int16 v23 = 2114;
    char v24 = v9;
    __int16 v25 = 2114;
    __int16 v26 = v12;
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deliver local notification %{public}@ at %{public}@", buf, 0x20u);
  }
  lazy_pendingNotificationsAwaitingDelivery = self->_lazy_pendingNotificationsAwaitingDelivery;
  if (!lazy_pendingNotificationsAwaitingDelivery)
  {
    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v15 = self->_lazy_pendingNotificationsAwaitingDelivery;
    self->_lazy_pendingNotificationsAwaitingDelivery = v14;

    lazy_pendingNotificationsAwaitingDelivery = self->_lazy_pendingNotificationsAwaitingDelivery;
  }
  [(NSMutableArray *)lazy_pendingNotificationsAwaitingDelivery addObject:v4];
  __int16 v17 = self->_bundleIdentifier;
  notificationRepository = self->_notificationRepository;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __48__UNCLocalNotificationClient__fireNotification___block_invoke;
  v19[3] = &unk_2655679D8;
  v19[4] = self;
  id v20 = v4;
  id v18 = v4;
  [(UNCNotificationRepository *)notificationRepository saveNotificationRecord:v18 shouldRepost:1 forBundleIdentifier:v17 withCompletionHandler:v19];
}

void __48__UNCLocalNotificationClient__fireNotification___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)*MEMORY[0x263F1E060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR)) {
      __48__UNCLocalNotificationClient__fireNotification___block_invoke_cold_1(a1, v5, (uint64_t)v4);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 64);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__UNCLocalNotificationClient__fireNotification___block_invoke_15;
  v8[3] = &unk_265567628;
  v8[4] = v6;
  id v9 = *(id *)(a1 + 40);
  dispatch_async(v7, v8);
}

uint64_t __48__UNCLocalNotificationClient__fireNotification___block_invoke_15(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)_updateTimersAndRegionMonitorsForPendingNotificationRecords:(id)a3
{
  id v4 = a3;
  [(UNCLocalNotificationClient *)self _updateTimersForPendingNotificationRecords:v4];
  [(UNCLocalNotificationClient *)self _updateRegionMonitorsForPendingNotificationRecords:v4];
}

- (void)_invalidateNotificationRecordTimersAndRegionMonitors
{
  [(UNCLocalNotificationClient *)self _invalidatePendingNotificationRecordTimers];

  [(UNCLocalNotificationClient *)self _invalidatePendingNotificationRecordRegionMonitors];
}

- (void)_queue_triggerDidFireForTimer:(id)a3
{
  v27[4] = *MEMORY[0x263EF8340];
  UNCPowerLogUserNotificationTriggerEvent((__CFString *)self->_bundleIdentifier, 1u);
  id v4 = [MEMORY[0x263EFF910] date];
  id v5 = (os_log_t *)MEMORY[0x263F1E040];
  uint64_t v6 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    long long v8 = v6;
    id v9 = [(UNCLocalNotificationClient *)self _dateFormatter];
    uint64_t v10 = [v9 stringFromDate:v4];
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = bundleIdentifier;
    __int16 v22 = 2114;
    __int16 v23 = v10;
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persistent timer fired at %{public}@", buf, 0x16u);
  }
  IOPMAssertionID AssertionID = 0;
  long long v11 = self->_bundleIdentifier;
  uint64_t v12 = [NSString stringWithFormat:@"com.apple.usernotifications.time.%@-%ld", v11, ++_queue_triggerDidFireForTimer__count];
  v26[0] = @"AssertType";
  v26[1] = @"AssertLevel";
  v27[0] = @"NoIdleSleepAssertion";
  v27[1] = &unk_270CE1238;
  v26[2] = @"AssertName";
  v26[3] = @"AssertionOnBehalfOfBundleID";
  long long v13 = self->_bundleIdentifier;
  v27[2] = v12;
  v27[3] = v13;
  CFDictionaryRef v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  IOReturn v15 = IOPMAssertionCreateWithProperties(v14, &AssertionID);
  if (v15)
  {
    IOReturn v16 = v15;
    __int16 v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      id v18 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v18;
      __int16 v22 = 2114;
      __int16 v23 = v12;
      __int16 v24 = 1024;
      IOReturn v25 = v16;
      _os_log_error_impl(&dword_2608DB000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to take power assertion %{public}@: %#x", buf, 0x1Cu);
    }
  }
  [(UNCLocalNotificationClient *)self _queue_triggerDidFireForDate:v4];
  if (AssertionID) {
    IOPMAssertionRelease(AssertionID);
  }
}

- (void)_queue_triggerDidFireForDate:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v66 = a3;
  id v4 = [(UNCLocalNotificationClient *)self _lastLocalNotificationFireDate];
  id v5 = (os_log_t *)MEMORY[0x263F1E040];
  uint64_t v6 = (void *)*MEMORY[0x263F1E040];
  v63 = v4;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    long long v8 = v6;
    id v9 = [(UNCLocalNotificationClient *)self _dateFormatter];
    uint64_t v10 = [v9 stringFromDate:v4];
    long long v11 = [(UNCLocalNotificationClient *)self _dateFormatter];
    uint64_t v12 = [v11 stringFromDate:v66];
    *(_DWORD *)buf = 138543874;
    os_log_t v78 = (os_log_t)bundleIdentifier;
    __int16 v79 = 2114;
    v80 = v10;
    __int16 v81 = 2114;
    v82 = v12;
    _os_log_impl(&dword_2608DB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Find notifications with current trigger date after last fire date %{public}@ and before %{public}@", buf, 0x20u);

    id v4 = v63;
    id v5 = (os_log_t *)MEMORY[0x263F1E040];
  }
  v64 = self;
  long long v13 = [(UNCLocalNotificationClient *)self _pendingNotificationRecords];
  id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obuint64_t j = v13;
  uint64_t v67 = [obj countByEnumeratingWithState:&v72 objects:v85 count:16];
  if (v67)
  {
    uint64_t v15 = *(void *)v73;
    *(void *)&long long v14 = 138543874;
    long long v52 = v14;
    uint64_t v62 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v73 != v15) {
          objc_enumerationMutation(obj);
        }
        __int16 v17 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        id v18 = (*((void (**)(uint64_t, void *))UNSNotificationRecordToUNNotificationTrigger + 2))((uint64_t)UNSNotificationRecordToUNNotificationTrigger, v17);
        uint64_t v19 = [v17 requestDate];
        id v20 = [v18 nextTriggerDateAfterLastTriggerDate:v4 withRequestedDate:v19];

        if (!v20)
        {
          os_log_t v31 = *v5;
          if (!os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_18;
          }
          os_log_t loga = (os_log_t)v64->_bundleIdentifier;
          v30 = v31;
          __int16 v32 = [v17 identifier];
          uint64_t v33 = objc_msgSend(v32, "un_logDigest");
          __int16 v34 = [(UNCLocalNotificationClient *)v64 _dateFormatter];
          long long v35 = [v17 requestDate];
          id v36 = [v34 stringFromDate:v35];
          *(_DWORD *)buf = v52;
          os_log_t v78 = loga;
          __int16 v79 = 2114;
          v80 = v33;
          __int16 v81 = 2114;
          v82 = v36;
          _os_log_impl(&dword_2608DB000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification %{public}@ requested at %{public}@ has no trigger date", buf, 0x20u);

          id v5 = (os_log_t *)MEMORY[0x263F1E040];
          uint64_t v15 = v62;

          id v4 = v63;
          goto LABEL_14;
        }
        uint64_t v21 = [v20 compare:v66];
        os_log_t v22 = *v5;
        BOOL v23 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
        if (v21 == 1)
        {
          if (!v23) {
            goto LABEL_18;
          }
          os_log_t v56 = (os_log_t)v64->_bundleIdentifier;
          log = v22;
          __int16 v24 = [v17 identifier];
          v54 = objc_msgSend(v24, "un_logDigest");
          IOReturn v25 = [(UNCLocalNotificationClient *)v64 _dateFormatter];
          __int16 v26 = [v17 requestDate];
          uint64_t v27 = [v25 stringFromDate:v26];
          uint64_t v28 = [(UNCLocalNotificationClient *)v64 _dateFormatter];
          v29 = [v28 stringFromDate:v20];
          *(_DWORD *)buf = 138544130;
          os_log_t v78 = v56;
          __int16 v79 = 2114;
          v80 = v54;
          __int16 v81 = 2114;
          v82 = v27;
          __int16 v83 = 2114;
          v84 = v29;
          v30 = log;
          _os_log_impl(&dword_2608DB000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification %{public}@ requested at %{public}@ has a late trigger date %{public}@", buf, 0x2Au);

          uint64_t v15 = v62;
          id v4 = v63;

          id v5 = (os_log_t *)MEMORY[0x263F1E040];
LABEL_14:

          goto LABEL_18;
        }
        if (v23)
        {
          v55 = v64->_bundleIdentifier;
          v57 = v22;
          os_log_t logb = [v17 identifier];
          v53 = [logb un_logDigest];
          id v37 = [(UNCLocalNotificationClient *)v64 _dateFormatter];
          v38 = [v17 requestDate];
          long long v39 = [v37 stringFromDate:v38];
          long long v40 = [(UNCLocalNotificationClient *)v64 _dateFormatter];
          long long v41 = [v40 stringFromDate:v20];
          *(_DWORD *)buf = 138544130;
          os_log_t v78 = (os_log_t)v55;
          __int16 v79 = 2114;
          v80 = v53;
          __int16 v81 = 2114;
          v82 = v39;
          __int16 v83 = 2114;
          v84 = v41;
          _os_log_impl(&dword_2608DB000, v57, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification %{public}@ requested at %{public}@ has a current trigger date %{public}@", buf, 0x2Au);

          uint64_t v15 = v62;
          id v5 = (os_log_t *)MEMORY[0x263F1E040];

          id v4 = v63;
        }
        objc_msgSend(v17, "setDate:", v20, v52);
        [v58 addObject:v17];
LABEL_18:
      }
      uint64_t v67 = [obj countByEnumeratingWithState:&v72 objects:v85 count:16];
    }
    while (v67);
  }

  id v42 = (id)[v58 sortedArrayUsingComparator:&__block_literal_global_40];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v43 = v58;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v69 != v46) {
          objc_enumerationMutation(v43);
        }
        -[UNCLocalNotificationClient _fireNotification:](v64, "_fireNotification:", *(void *)(*((void *)&v68 + 1) + 8 * j), v52);
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }
    while (v45);
  }

  id v48 = v4;
  v49 = [v43 lastObject];
  uint64_t v50 = [v49 date];

  id v51 = v48;
  if ([v48 compare:v50] == -1)
  {
    id v51 = v50;
  }
  -[UNCLocalNotificationClient _setLastLocalNotificationFireDate:](v64, "_setLastLocalNotificationFireDate:", v51, v52);
  [(UNCLocalNotificationClient *)v64 _setPendingNotificationRecords:obj];
}

uint64_t __59__UNCLocalNotificationClient__queue_triggerDidFireForDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 date];
  uint64_t v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_lastLocalNotificationFireDate
{
  id v3 = [(UNCNotificationScheduleRepository *)self->_notificationScheduleRepository scheduleForBundleIdentifier:self->_bundleIdentifier];
  id v4 = [v3 previousTriggerDate];
  if (v4)
  {
    id v5 = v4;
    [v4 timeIntervalSinceNow];
    if (v6 > 0.0)
    {
      uint64_t v7 = [MEMORY[0x263EFF910] date];

      [(UNCLocalNotificationClient *)self _setLastLocalNotificationFireDate:v7];
      id v5 = (void *)v7;
    }
  }
  else
  {
    id v5 = [MEMORY[0x263EFF910] distantPast];
  }

  return v5;
}

- (void)_setLastLocalNotificationFireDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(UNCNotificationSchedule);
  [(UNCNotificationSchedule *)v5 setPreviousTriggerDate:v4];

  [(UNCNotificationScheduleRepository *)self->_notificationScheduleRepository setSchedule:v5 forBundleIdentifier:self->_bundleIdentifier];
}

- (void)_invalidatePendingNotificationRecordTimers
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v6 = 138543362;
    uint64_t v7 = bundleIdentifier;
    _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidate persistent timer", (uint8_t *)&v6, 0xCu);
  }
  [(PCPersistentTimer *)self->_localNotificationTimer invalidate];
  localNotificationTimer = self->_localNotificationTimer;
  self->_localNotificationTimer = 0;
}

- (void)_updateTimersForPendingNotificationRecords:(id)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    uint64_t v7 = v5;
    uint64_t v8 = [v4 count];
    BOOL monitoringLocaleAndTimeChanges = self->_monitoringLocaleAndTimeChanges;
    *(_DWORD *)buf = 138543874;
    long long v74 = bundleIdentifier;
    __int16 v75 = 2048;
    uint64_t v76 = v8;
    __int16 v77 = 1024;
    LODWORD(v78) = monitoringLocaleAndTimeChanges;
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update timers for %ld pending notifications (monitoring: %d)", buf, 0x1Cu);
  }
  [(UNCLocalNotificationClient *)self _invalidatePendingNotificationRecordTimers];
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = v4;
  uint64_t v11 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
  v57 = self;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v70;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v70 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v69 + 1) + 8 * v14);
        if (([v15 willNotifyUser] & 1) != 0
          || ([v15 badge],
              IOReturn v16 = objc_claimAutoreleasedReturnValue(),
              uint64_t v17 = [v16 integerValue],
              v16,
              v17 >= 1))
        {
          [v10 addObject:v15];
        }
        else
        {
          id v18 = (void *)*MEMORY[0x263F1E040];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = v57->_bundleIdentifier;
            id v20 = v18;
            uint64_t v21 = [v15 identifier];
            os_log_t v22 = objc_msgSend(v21, "un_logDigest");
            *(_DWORD *)buf = 138543618;
            long long v74 = v19;
            self = v57;
            __int16 v75 = 2114;
            uint64_t v76 = (uint64_t)v22;
            _os_log_impl(&dword_2608DB000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not scheduling notification %{public}@ that does nothing when fired", buf, 0x16u);
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v23 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
      uint64_t v12 = v23;
    }
    while (v23);
  }

  __int16 v24 = [(UNCLocalNotificationClient *)self _lastLocalNotificationFireDate];
  IOReturn v25 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v26 = self->_bundleIdentifier;
    uint64_t v27 = v25;
    uint64_t v28 = [(UNCLocalNotificationClient *)self _dateFormatter];
    v29 = [v28 stringFromDate:v24];
    *(_DWORD *)buf = 138543618;
    long long v74 = v26;
    __int16 v75 = 2114;
    uint64_t v76 = (uint64_t)v29;
    _os_log_impl(&dword_2608DB000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Find next notification with current trigger date after last fire date %{public}@", buf, 0x16u);
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v30 = v10;
  uint64_t v64 = [v30 countByEnumeratingWithState:&v65 objects:v81 count:16];
  if (v64)
  {
    id v31 = 0;
    uint64_t v63 = *(void *)v66;
    id v54 = v30;
    v55 = v24;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v66 != v63) {
          objc_enumerationMutation(v30);
        }
        uint64_t v33 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        __int16 v34 = (*((void (**)(uint64_t, void *))UNSNotificationRecordToUNNotificationTrigger + 2))((uint64_t)UNSNotificationRecordToUNNotificationTrigger, v33);
        long long v35 = [v33 requestDate];
        id v36 = [v34 nextTriggerDateAfterLastTriggerDate:v24 withRequestedDate:v35];
        id v37 = (void *)*MEMORY[0x263F1E040];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
        {
          v59 = v57->_bundleIdentifier;
          log = v37;
          v61 = [v33 identifier];
          id v58 = objc_msgSend(v61, "un_logDigest");
          v38 = [(UNCLocalNotificationClient *)v57 _dateFormatter];
          long long v39 = [v33 requestDate];
          long long v40 = [v38 stringFromDate:v39];
          long long v41 = [(UNCLocalNotificationClient *)v57 _dateFormatter];
          [v41 stringFromDate:v36];
          id v42 = v62 = v31;
          *(_DWORD *)buf = 138544130;
          long long v74 = v59;
          __int16 v75 = 2114;
          uint64_t v76 = (uint64_t)v58;
          __int16 v77 = 2114;
          os_log_t v78 = v40;
          __int16 v79 = 2114;
          v80 = v42;
          _os_log_impl(&dword_2608DB000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification %{public}@ requested at %{public}@ has a trigger date %{public}@", buf, 0x2Au);

          id v30 = v54;
          __int16 v24 = v55;

          id v31 = v62;
        }
        if (v36)
        {
          if (v31)
          {
            uint64_t v43 = [v31 earlierDate:v36];

            id v31 = (id)v43;
          }
          else
          {
            id v31 = v36;
          }
        }
      }
      uint64_t v64 = [v30 countByEnumeratingWithState:&v65 objects:v81 count:16];
    }
    while (v64);

    self = v57;
    if (v31)
    {
      uint64_t v44 = (void *)*MEMORY[0x263F1E040];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = v57->_bundleIdentifier;
        uint64_t v46 = v44;
        __int16 v47 = [(UNCLocalNotificationClient *)v57 _dateFormatter];
        id v48 = [v47 stringFromDate:v31];
        *(_DWORD *)buf = 138543618;
        long long v74 = v45;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v48;
        _os_log_impl(&dword_2608DB000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling persistent timer for next local notification at %{public}@", buf, 0x16u);
      }
      uint64_t v49 = [objc_alloc(MEMORY[0x263F5D400]) initWithFireDate:v31 serviceIdentifier:v57->_bundleIdentifier target:v57 selector:sel__queue_triggerDidFireForTimer_ userInfo:0];
      localNotificationTimer = v57->_localNotificationTimer;
      v57->_localNotificationTimer = (PCPersistentTimer *)v49;

      [(PCPersistentTimer *)v57->_localNotificationTimer setMinimumEarlyFireProportion:1.0];
      BOOL v51 = 1;
      [(PCPersistentTimer *)v57->_localNotificationTimer setUserVisible:1];
      [(PCPersistentTimer *)v57->_localNotificationTimer scheduleInQueue:v57->_queue];
      goto LABEL_39;
    }
  }
  else
  {
  }
  long long v52 = *MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    v53 = self->_bundleIdentifier;
    *(_DWORD *)buf = 138543362;
    long long v74 = v53;
    _os_log_impl(&dword_2608DB000, v52, OS_LOG_TYPE_DEFAULT, "[%{public}@] No upcoming local notifications", buf, 0xCu);
  }
  BOOL v51 = 0;
  id v31 = 0;
LABEL_39:
  self->_BOOL monitoringLocaleAndTimeChanges = v51;
}

- (void)locationMonitor:(id)a3 triggerDidFireForRegion:(id)a4 forBundleIdentifier:(id)a5
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__UNCLocalNotificationClient_locationMonitor_triggerDidFireForRegion_forBundleIdentifier___block_invoke;
  v9[3] = &unk_265567628;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

uint64_t __90__UNCLocalNotificationClient_locationMonitor_triggerDidFireForRegion_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_triggerDidFireForRegion:", *(void *)(a1 + 40));
}

- (void)_queue_triggerDidFireForRegion:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  UNCPowerLogUserNotificationTriggerEvent((__CFString *)self->_bundleIdentifier, 2u);
  id v5 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    uint64_t v7 = v5;
    id v8 = [v4 identifier];
    id v9 = objc_msgSend(v8, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    id v48 = bundleIdentifier;
    __int16 v49 = 2114;
    uint64_t v50 = v9;
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Location region fired: region=%{public}@", buf, 0x16u);
  }
  BOOL v10 = [(UNCLocationMonitor *)self->_locationMonitor isBundleIdentifierAuthorizedForRegionMonitoring:self->_bundleIdentifier];
  uint64_t v33 = v4;
  long long v35 = [v4 identifier];
  id v34 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  __int16 v32 = self;
  [(UNCLocalNotificationClient *)self _pendingNotificationRecords];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        IOReturn v16 = [v15 triggerType];
        if ([v16 isEqualToString:@"Location"])
        {
          uint64_t v17 = [v15 triggerRegion];
          id v18 = [v17 identifier];
          int v19 = [v18 isEqual:v35];

          if (v19)
          {
            id v20 = [MEMORY[0x263EFF910] date];
            [v15 setDate:v20];

            [v34 addObject:v15];
          }
        }
        else
        {
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v12);
  }
  if ([v34 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v21 = v34;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
    uint64_t v23 = v32;
    if (v22)
    {
      uint64_t v24 = v22;
      uint64_t v25 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(v21);
          }
          if (v10) {
            [(UNCLocalNotificationClient *)v32 _fireNotification:*(void *)(*((void *)&v37 + 1) + 8 * j)];
          }
        }
        uint64_t v24 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v24);
    }

    uint64_t v27 = v33;
  }
  else
  {
    uint64_t v28 = (void *)*MEMORY[0x263F1E040];
    uint64_t v23 = self;
    uint64_t v27 = v33;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      id v30 = [v33 identifier];
      objc_msgSend(v30, "un_logDigest");
      id v31 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v48 = v31;
      _os_log_impl(&dword_2608DB000, v29, OS_LOG_TYPE_DEFAULT, "Region %{public}@ fired which isn't associated with a notification", buf, 0xCu);
    }
  }
  [(UNCLocalNotificationClient *)v23 _setPendingNotificationRecords:obj];
}

- (void)_invalidatePendingNotificationRecordRegionMonitors
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v5 = 138543362;
    id v6 = bundleIdentifier;
    _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidate region monitors", (uint8_t *)&v5, 0xCu);
  }
  [(UNCLocationMonitor *)self->_locationMonitor setMonitoredRegions:0 forBundleIdentifier:self->_bundleIdentifier withCompletionHandler:0];
}

- (void)_updateRegionMonitorsForPendingNotificationRecords:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    uint64_t v7 = v5;
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = bundleIdentifier;
    __int16 v24 = 2048;
    uint64_t v25 = [v4 count];
    _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update regions for %ld pending notifications", buf, 0x16u);
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "triggerType", (void)v17);
        if ([v15 isEqualToString:@"Location"])
        {
          IOReturn v16 = [v14 triggerRegion];

          if (!v16) {
            continue;
          }
          uint64_t v15 = [v14 triggerRegion];
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  [(UNCLocalNotificationClient *)self _setMonitoredRegions:v8];
}

- (void)_setMonitoredRegions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localNotificationTimer, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_lazy_pendingNotificationsAwaitingDelivery, 0);
  objc_storeStrong((id *)&self->_pendingNotificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationScheduleRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)addPendingNotificationRecords:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 8);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_2608DB000, a2, a3, "[%{public}@] Add pending notifications: notifications=%{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)setPendingNotificationRecords:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 8);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_2608DB000, a2, a3, "[%{public}@] Set pending notifications: notifications=%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)removePendingNotificationRecords:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Did not remove all expected pending notifications", (uint8_t *)&v3, 0xCu);
}

- (void)pendingNotificationRecords
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = a2;
  int v6 = 138543874;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = [a3 count];
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  _os_log_debug_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Load pending %ld notifications: notifications=%{public}@", (uint8_t *)&v6, 0x20u);
}

void __48__UNCLocalNotificationClient__fireNotification___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  int v6 = a2;
  uint64_t v7 = [v4 identifier];
  __int16 v8 = objc_msgSend(v7, "un_logDigest");
  int v9 = 138543874;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  _os_log_error_impl(&dword_2608DB000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Not delivering user visible local notification %{public}@ [ error=%{public}@ ]", (uint8_t *)&v9, 0x20u);
}

@end