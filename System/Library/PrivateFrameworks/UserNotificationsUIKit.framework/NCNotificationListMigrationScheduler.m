@interface NCNotificationListMigrationScheduler
- (NCNotificationListMigrationScheduler)initWithDelegate:(id)a3;
- (NCNotificationListMigrationSchedulerDelegate)delegate;
- (NSDate)currentlyScheduledDate;
- (NSDate)migrationDateForNotificationDigest;
- (NSDate)upcomingScheduledMigrationDate;
- (NSDateFormatter)dateFormatter;
- (NSMutableDictionary)migrationDatesForNotificationRequests;
- (NSMutableDictionary)migrationRequestCounterForNotificationRequests;
- (NSMutableSet)migratedTimeSensitiveNotificationRequests;
- (OS_dispatch_queue)scheduleTimerQueue;
- (PCPersistentTimer)scheduleTimer;
- (id)_nextScheduleDateForMigration;
- (id)_notificationRequestMatchingRequest:(id)a3;
- (void)_handleTimeOrLocaleChange:(id)a3;
- (void)_migrationTimerFiredForTimer:(id)a3;
- (void)_scheduleMigrationTimerForDate:(id)a3;
- (void)_sendDigestMigrationSignalIfNecessary;
- (void)_sendNotificationRequestMigrationSignalIfNecessary;
- (void)_updateMigrationScheduleTimer;
- (void)addMigratedTimeSensitiveNotificationRequests:(id)a3;
- (void)addMigrationForNotificationRequests:(id)a3 forDate:(id)a4;
- (void)removeMigratedTimeSensitiveNotificationRequests:(id)a3;
- (void)removeMigrationForNotificationRequest:(id)a3;
- (void)setCurrentlyScheduledDate:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMigratedTimeSensitiveNotificationRequests:(id)a3;
- (void)setMigrationDateForNotificationDigest:(id)a3;
- (void)setMigrationDatesForNotificationRequests:(id)a3;
- (void)setMigrationRequestCounterForNotificationRequests:(id)a3;
- (void)setScheduleTimer:(id)a3;
- (void)setScheduleTimerQueue:(id)a3;
@end

@implementation NCNotificationListMigrationScheduler

- (NCNotificationListMigrationScheduler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NCNotificationListMigrationScheduler;
  v5 = [(NCNotificationListMigrationScheduler *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.usernotifications.NCNotificationListMigrationSchedulerTimerQueue", v7);
    scheduleTimerQueue = v6->_scheduleTimerQueue;
    v6->_scheduleTimerQueue = (OS_dispatch_queue *)v8;

    v10 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v6->_dateFormatter;
    v6->_dateFormatter = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    migratedTimeSensitiveNotificationRequests = v6->_migratedTimeSensitiveNotificationRequests;
    v6->_migratedTimeSensitiveNotificationRequests = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    migrationRequestCounterForNotificationRequests = v6->_migrationRequestCounterForNotificationRequests;
    v6->_migrationRequestCounterForNotificationRequests = v14;

    v16 = v6->_dateFormatter;
    v17 = [MEMORY[0x1E4F1CA20] currentLocale];
    [(NSDateFormatter *)v16 setLocale:v17];

    [(NSDateFormatter *)v6->_dateFormatter setDateStyle:1];
    [(NSDateFormatter *)v6->_dateFormatter setTimeStyle:3];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v6 selector:sel__handleTimeOrLocaleChange_ name:*MEMORY[0x1E4FB2708] object:0];
    [v18 addObserver:v6 selector:sel__handleTimeOrLocaleChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v6;
}

- (void)addMigrationForNotificationRequests:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __84__NCNotificationListMigrationScheduler_addMigrationForNotificationRequests_forDate___block_invoke;
  v11 = &unk_1E6A92BA0;
  v12 = self;
  id v13 = v6;
  id v7 = v6;
  [a3 enumerateObjectsUsingBlock:&v8];
  [(NCNotificationListMigrationScheduler *)self _updateMigrationScheduleTimer];
}

void __84__NCNotificationListMigrationScheduler_addMigrationForNotificationRequests_forDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v5 = a1 + 32;
  id v4 = *(void **)(a1 + 32);
  if (!v4[2])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = *(void **)(*(void *)v5 + 16);
    *(void *)(*(void *)v5 + 16) = v6;

    id v4 = *(void **)v5;
  }
  uint64_t v8 = [v4 _notificationRequestMatchingRequest:v3];
  uint64_t v9 = *(void **)(*(void *)v5 + 16);
  v10 = (os_log_t *)MEMORY[0x1E4FB3778];
  if (v8)
  {
    id v11 = [v9 objectForKey:v8];
    v12 = [*(id *)(*(void *)v5 + 48) objectForKey:v8];
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    os_log_t v14 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      [v3 notificationIdentifier];
      id v65 = v11;
      v19 = v18 = v13;
      objc_super v20 = objc_msgSend(v19, "un_logDigest");
      *(_DWORD *)buf = 138543874;
      v70 = v17;
      __int16 v71 = 2114;
      v72 = v20;
      __int16 v73 = 1024;
      LODWORD(v74) = [v12 intValue];
      _os_log_impl(&dword_1D7C04000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ migration count for request %{public}@; count %d",
        buf,
        0x1Cu);

      id v13 = v18;
      id v11 = v65;

      v10 = (os_log_t *)MEMORY[0x1E4FB3778];
    }
    [*(id *)(*(void *)v5 + 48) removeObjectForKey:v8];
    v21 = *(void **)(*(void *)v5 + 48);
    v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "intValue") + 1);
    [v21 setObject:v22 forKey:v3];

    if ((int)[v12 intValue] >= 1)
    {
      os_log_t v23 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        v27 = [v3 notificationIdentifier];
        v28 = objc_msgSend(v27, "un_logDigest");
        [*(id *)(*(void *)v5 + 40) stringFromDate:v13];
        v66 = v8;
        id v29 = v3;
        v30 = v12;
        id v31 = v11;
        v33 = v32 = v13;
        *(_DWORD *)buf = 138543874;
        v70 = v26;
        __int16 v71 = 2114;
        v72 = v28;
        __int16 v73 = 2112;
        v74 = v33;
        _os_log_impl(&dword_1D7C04000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ reach force migration count for request %{public}@; schedule migration for current date %@",
          buf,
          0x20u);

        id v13 = v32;
        id v11 = v31;
        v12 = v30;
        id v3 = v29;
        uint64_t v8 = v66;
      }
      [*(id *)(*(void *)v5 + 16) removeObjectForKey:v8];
      [*(id *)(*(void *)v5 + 16) setObject:v13 forKey:v3];
      v34 = v13;
LABEL_26:
      id v64 = v34;

      goto LABEL_27;
    }
    v43 = [v11 earlierDate:*(void *)(a1 + 40)];
    v44 = v43;
    if (v43 == *(void **)(a1 + 40))
    {
    }
    else
    {
      id v45 = [v11 earlierDate:v13];

      if (v45 != v11)
      {
        os_log_t v46 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          v47 = v46;
          v48 = (objc_class *)objc_opt_class();
          v49 = NSStringFromClass(v48);
          v50 = [v3 notificationIdentifier];
          v51 = objc_msgSend(v50, "un_logDigest");
          [*(id *)(*(void *)v5 + 40) stringFromDate:v11];
          v67 = v8;
          id v52 = v3;
          v53 = v12;
          id v54 = v11;
          v56 = v55 = v13;
          *(_DWORD *)buf = 138543874;
          v70 = v49;
          __int16 v71 = 2114;
          v72 = v51;
          __int16 v73 = 2112;
          v74 = v56;
          _os_log_impl(&dword_1D7C04000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ has the earliest migration date for request %{public}@ for date %@", buf, 0x20u);

          id v13 = v55;
          id v11 = v54;
          v12 = v53;
          id v3 = v52;
          uint64_t v8 = v67;

          v10 = (os_log_t *)MEMORY[0x1E4FB3778];
        }

        goto LABEL_11;
      }
    }
    os_log_t v57 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      v59 = (objc_class *)objc_opt_class();
      v60 = NSStringFromClass(v59);
      v61 = [v3 notificationIdentifier];
      objc_msgSend(v61, "un_logDigest");
      v62 = v68 = v13;
      v63 = [*(id *)(*(void *)v5 + 40) stringFromDate:v11];
      *(_DWORD *)buf = 138543874;
      v70 = v60;
      __int16 v71 = 2114;
      v72 = v62;
      __int16 v73 = 2112;
      v74 = v63;
      _os_log_impl(&dword_1D7C04000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ set for earlier migration date for request %{public}@ for date %@", buf, 0x20u);

      id v13 = v68;
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v8];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(a1 + 40) forKey:v3];
    v34 = *(void **)(a1 + 40);
    goto LABEL_26;
  }
  [v9 setObject:*(void *)(a1 + 40) forKey:v3];
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:&unk_1F2F843A0 forKey:v3];
  id v11 = *(id *)(a1 + 40);
LABEL_11:
  os_log_t v35 = *v10;
  v36 = *v10;
  if (v11)
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v35;
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      v40 = [v3 notificationIdentifier];
      v41 = objc_msgSend(v40, "un_logDigest");
      v42 = [*(id *)(*(void *)v5 + 40) stringFromDate:v11];
      *(_DWORD *)buf = 138543874;
      v70 = v39;
      __int16 v71 = 2114;
      v72 = v41;
      __int16 v73 = 2112;
      v74 = v42;
      _os_log_impl(&dword_1D7C04000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ adding migration for request %{public}@ for date %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    __84__NCNotificationListMigrationScheduler_addMigrationForNotificationRequests_forDate___block_invoke_cold_1(v5, v35, v3);
  }
LABEL_27:
}

- (void)removeMigrationForNotificationRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NCNotificationListMigrationScheduler *)self _notificationRequestMatchingRequest:v4];
  if (v5)
  {
    id v6 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      v10 = [v4 notificationIdentifier];
      id v11 = objc_msgSend(v10, "un_logDigest");
      int v14 = 138543618;
      v15 = v9;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ removing scheduled migration for request %{public}@", (uint8_t *)&v14, 0x16u);
    }
    [(NSMutableDictionary *)self->_migrationRequestCounterForNotificationRequests removeObjectForKey:v5];
    v12 = [(NSMutableDictionary *)self->_migrationDatesForNotificationRequests objectForKey:v5];
    [(NSMutableDictionary *)self->_migrationDatesForNotificationRequests removeObjectForKey:v5];
    if (![(NSMutableDictionary *)self->_migrationDatesForNotificationRequests count])
    {
      migrationDatesForNotificationRequests = self->_migrationDatesForNotificationRequests;
      self->_migrationDatesForNotificationRequests = 0;
    }
    if ([v12 isEqualToDate:self->_currentlyScheduledDate]) {
      [(NCNotificationListMigrationScheduler *)self _updateMigrationScheduleTimer];
    }
  }
}

- (void)setMigrationDateForNotificationDigest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(NCNotificationListMigrationScheduler *)self migrationDateForNotificationDigest];
  if (([v6 isEqualToDate:v5] & 1) == 0)
  {
    if (!v5
      || ([v5 earlierDate:v6], id v7 = (id)objc_claimAutoreleasedReturnValue(), v7, v7 == v5))
    {
      uint64_t v8 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v8;
        v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        v12 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v5];
        int v13 = 138543618;
        int v14 = v11;
        __int16 v15 = 2112;
        __int16 v16 = v12;
        _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling migration for digest at %@", (uint8_t *)&v13, 0x16u);
      }
      objc_storeStrong((id *)&self->_migrationDateForNotificationDigest, a3);
      [(NCNotificationListMigrationScheduler *)self _updateMigrationScheduleTimer];
    }
  }
}

- (NSDate)upcomingScheduledMigrationDate
{
  v2 = (void *)[(NSDate *)self->_currentlyScheduledDate copy];

  return (NSDate *)v2;
}

- (void)addMigratedTimeSensitiveNotificationRequests:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 interruptionLevel] == 2)
  {
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = [v4 notificationIdentifier];
      v10 = objc_msgSend(v9, "un_logDigest");
      int v11 = 138543618;
      v12 = v8;
      __int16 v13 = 2114;
      int v14 = v10;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ add MigratedTimeSensitiveNotificationRequests %{public}@", (uint8_t *)&v11, 0x16u);
    }
    [(NSMutableSet *)self->_migratedTimeSensitiveNotificationRequests addObject:v4];
  }
}

- (void)removeMigratedTimeSensitiveNotificationRequests:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 interruptionLevel] == 2)
  {
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = [v4 notificationIdentifier];
      v10 = objc_msgSend(v9, "un_logDigest");
      int v11 = 138543618;
      v12 = v8;
      __int16 v13 = 2114;
      int v14 = v10;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ remove MigratedTimeSensitiveNotificationRequests %{public}@", (uint8_t *)&v11, 0x16u);
    }
    [(NSMutableSet *)self->_migratedTimeSensitiveNotificationRequests removeObject:v4];
  }
}

- (id)_notificationRequestMatchingRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_migrationDatesForNotificationRequests allKeys];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__NCNotificationListMigrationScheduler__notificationRequestMatchingRequest___block_invoke;
  v10[3] = &unk_1E6A92790;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [v5 objectAtIndex:v7];
  }

  return v8;
}

uint64_t __76__NCNotificationListMigrationScheduler__notificationRequestMatchingRequest___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 1;
  }
  else {
    return objc_msgSend(a2, "matchesRequest:");
  }
}

- (void)_updateMigrationScheduleTimer
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(NCNotificationListMigrationScheduler *)self _nextScheduleDateForMigration];
  if ([(NSDate *)self->_currentlyScheduledDate isEqualToDate:v3])
  {
    id v4 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      uint64_t v8 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:self->_currentlyScheduledDate];
      int v20 = 138543618;
      v21 = v7;
      __int16 v22 = 2112;
      os_log_t v23 = v8;
      _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ already scheduled migration schedule timer for date %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_currentlyScheduledDate, v3);
    currentlyScheduledDate = self->_currentlyScheduledDate;
    v10 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
    if (currentlyScheduledDate)
    {
      if (v11)
      {
        v12 = v10;
        __int16 v13 = (objc_class *)objc_opt_class();
        int v14 = NSStringFromClass(v13);
        uint64_t v15 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v3];
        int v20 = 138543618;
        v21 = v14;
        __int16 v22 = 2112;
        os_log_t v23 = v15;
        _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ updating scheduled migration timer to fire at date %@", (uint8_t *)&v20, 0x16u);
      }
      [(NCNotificationListMigrationScheduler *)self _scheduleMigrationTimerForDate:self->_currentlyScheduledDate];
    }
    else
    {
      if (v11)
      {
        __int16 v16 = v10;
        uint64_t v17 = (objc_class *)objc_opt_class();
        uint64_t v18 = NSStringFromClass(v17);
        int v20 = 138543362;
        v21 = v18;
        _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing scheduled migration timer since there are no more migrations left", (uint8_t *)&v20, 0xCu);
      }
      [(PCPersistentTimer *)self->_scheduleTimer invalidate];
      scheduleTimer = self->_scheduleTimer;
      self->_scheduleTimer = 0;

      [(NCNotificationListMigrationScheduler *)self _sendDigestMigrationSignalIfNecessary];
      [(NCNotificationListMigrationScheduler *)self _sendNotificationRequestMigrationSignalIfNecessary];
    }
  }
}

- (void)_scheduleMigrationTimerForDate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  scheduleTimer = self->_scheduleTimer;
  if (scheduleTimer)
  {
    [(PCPersistentTimer *)scheduleTimer invalidate];
    id v6 = self->_scheduleTimer;
    self->_scheduleTimer = 0;
  }
  [v4 timeIntervalSinceNow];
  if (v7 <= 0.0)
  {
    __int16 v16 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      [(NCNotificationListMigrationScheduler *)v16 _scheduleMigrationTimerForDate:(uint64_t)v4];
    }
  }
  else
  {
    uint64_t v8 = (PCPersistentTimer *)[objc_alloc(MEMORY[0x1E4F89D38]) initWithFireDate:v4 serviceIdentifier:@"com.apple.usernotifications.listMigrationSchedulerTimer" target:self selector:sel__migrationTimerFiredForTimer_ userInfo:0];
    uint64_t v9 = self->_scheduleTimer;
    self->_scheduleTimer = v8;

    [(PCPersistentTimer *)self->_scheduleTimer setMinimumEarlyFireProportion:1.0];
    [(PCPersistentTimer *)self->_scheduleTimer setUserVisible:1];
    [(PCPersistentTimer *)self->_scheduleTimer scheduleInQueue:self->_scheduleTimerQueue];
    v10 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = v10;
      v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      int v14 = self->_scheduleTimer;
      uint64_t v15 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v4];
      int v17 = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      int v20 = v14;
      __int16 v21 = 2112;
      __int16 v22 = v15;
      _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled migration timer %@ for date %@", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (id)_nextScheduleDateForMigration
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  [(NSDate *)self->_migrationDateForNotificationDigest timeIntervalSinceNow];
  if (v3 <= 0.0) {
    migrationDateForNotificationDigest = 0;
  }
  else {
    migrationDateForNotificationDigest = self->_migrationDateForNotificationDigest;
  }
  id v29 = migrationDateForNotificationDigest;
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__8;
  __int16 v22 = __Block_byref_object_dispose__8;
  id v23 = 0;
  migrationDatesForNotificationRequests = self->_migrationDatesForNotificationRequests;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__NCNotificationListMigrationScheduler__nextScheduleDateForMigration__block_invoke;
  v17[3] = &unk_1E6A93C90;
  v17[5] = &v24;
  v17[6] = &v18;
  v17[4] = self;
  [(NSMutableDictionary *)migrationDatesForNotificationRequests enumerateKeysAndObjectsUsingBlock:v17];
  if (v19[5])
  {
    id v6 = (id)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [(id)v19[5] notificationIdentifier];
      objc_msgSend(v9, "un_logDigest");
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v11 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v25[5]];
      *(_DWORD *)buf = 138543874;
      id v31 = v8;
      __int16 v32 = 2114;
      id v33 = v10;
      __int16 v34 = 2112;
      os_log_t v35 = v11;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ next scheduled migration timer for request %{public}@ for date %@", buf, 0x20u);
    }
  }
  else
  {
    if (!v25[5]) {
      goto LABEL_11;
    }
    id v6 = (id)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      int v14 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v25[5]];
      *(_DWORD *)buf = 138543618;
      id v31 = v13;
      __int16 v32 = 2112;
      id v33 = v14;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ next scheduled migration timer for digest for date %@", buf, 0x16u);
    }
  }

LABEL_11:
  uint64_t v15 = [(id)v25[5] dateByAddingTimeInterval:5.0];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v15;
}

void __69__NCNotificationListMigrationScheduler__nextScheduleDateForMigration__block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (!*(void *)(*(void *)(a1[5] + 8) + 40)
    || (objc_msgSend(v7, "earlierDate:"), uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9 == v8))
  {
    [v8 timeIntervalSinceNow];
    if (v10 <= 0.0)
    {
      BOOL v11 = [MEMORY[0x1E4F1C9C8] now];
      v12 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        log = v12;
        id v13 = (objc_class *)objc_opt_class();
        __int16 v21 = NSStringFromClass(v13);
        int v14 = [v6 notificationIdentifier];
        uint64_t v15 = objc_msgSend(v14, "un_logDigest");
        __int16 v16 = [*(id *)(a1[4] + 40) stringFromDate:v8];
        int v17 = [*(id *)(a1[4] + 40) stringFromDate:v11];
        *(_DWORD *)buf = 138544130;
        uint64_t v24 = v21;
        __int16 v25 = 2114;
        uint64_t v26 = v15;
        __int16 v27 = 2114;
        v28 = v16;
        __int16 v29 = 2114;
        v30 = v17;
        _os_log_impl(&dword_1D7C04000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ has earlier migration for request %{public}@ for date %{public}@; set to schedule to currentDate %{public}@",
          buf,
          0x2Au);
      }
      uint64_t v18 = *(void *)(a1[5] + 8);
      __int16 v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v11;
      id v20 = v11;

      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
  }
}

- (void)_migrationTimerFiredForTimer:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__NCNotificationListMigrationScheduler__migrationTimerFiredForTimer___block_invoke;
  block[3] = &unk_1E6A91BB0;
  block[4] = self;
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

uint64_t __69__NCNotificationListMigrationScheduler__migrationTimerFiredForTimer___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendDigestMigrationSignalIfNecessary];
  [*(id *)(a1 + 32) _sendNotificationRequestMigrationSignalIfNecessary];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateMigrationScheduleTimer];
}

- (void)_sendDigestMigrationSignalIfNecessary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = self->_migrationDateForNotificationDigest;
  id v4 = v3;
  if (v3)
  {
    [(NSDate *)v3 timeIntervalSinceNow];
    if (v5 < 0.0)
    {
      id v6 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v6;
        id v8 = (objc_class *)objc_opt_class();
        uint64_t v9 = NSStringFromClass(v8);
        double v10 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v4];
        int v12 = 138543618;
        id v13 = v9;
        __int16 v14 = 2112;
        uint64_t v15 = v10;
        _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ sending signal for digest migration for scheduled date %@", (uint8_t *)&v12, 0x16u);
      }
      BOOL v11 = [(NCNotificationListMigrationScheduler *)self delegate];
      [v11 notificationListMigrationSchedulerRequestsMigratingNotificationDigest:self];
    }
  }
}

- (void)_sendNotificationRequestMigrationSignalIfNecessary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  migrationDatesForNotificationRequests = self->_migrationDatesForNotificationRequests;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__NCNotificationListMigrationScheduler__sendNotificationRequestMigrationSignalIfNecessary__block_invoke;
  v8[3] = &unk_1E6A93CB8;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  [(NSMutableDictionary *)migrationDatesForNotificationRequests enumerateKeysAndObjectsUsingBlock:v8];
  if ([v5 count])
  {
    id v6 = [(NCNotificationListMigrationScheduler *)self delegate];
    [v6 notificationListMigrationScheduler:self requestsMigratingNotificationRequests:v5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__NCNotificationListMigrationScheduler__sendNotificationRequestMigrationSignalIfNecessary__block_invoke_19;
    v7[3] = &unk_1E6A91B18;
    v7[4] = self;
    [v5 enumerateObjectsUsingBlock:v7];
  }
}

void __90__NCNotificationListMigrationScheduler__sendNotificationRequestMigrationSignalIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [v6 timeIntervalSinceNow];
  if (v7 < 0.0)
  {
    id v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      double v10 = (objc_class *)objc_opt_class();
      BOOL v11 = NSStringFromClass(v10);
      int v12 = [v5 notificationIdentifier];
      id v13 = objc_msgSend(v12, "un_logDigest");
      __int16 v14 = [*(id *)(*(void *)(a1 + 32) + 40) stringFromDate:v6];
      int v15 = 138543874;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ sending signal for migration for request %{public}@ for scheduled date %@", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 40) addObject:v5];
  }
}

uint64_t __90__NCNotificationListMigrationScheduler__sendNotificationRequestMigrationSignalIfNecessary__block_invoke_19(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addMigratedTimeSensitiveNotificationRequests:a2];
}

- (void)_handleTimeOrLocaleChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = a3;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    double v10 = [v7 name];

    int v11 = 138543618;
    int v12 = v9;
    __int16 v13 = 2112;
    __int16 v14 = v10;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ updating migration on time or locale change for notification %@", (uint8_t *)&v11, 0x16u);
  }
  [(NCNotificationListMigrationScheduler *)self _sendDigestMigrationSignalIfNecessary];
  [(NCNotificationListMigrationScheduler *)self _sendNotificationRequestMigrationSignalIfNecessary];
  [(NCNotificationListMigrationScheduler *)self _updateMigrationScheduleTimer];
}

- (NSDate)migrationDateForNotificationDigest
{
  return self->_migrationDateForNotificationDigest;
}

- (NSMutableDictionary)migrationDatesForNotificationRequests
{
  return self->_migrationDatesForNotificationRequests;
}

- (void)setMigrationDatesForNotificationRequests:(id)a3
{
}

- (NSMutableSet)migratedTimeSensitiveNotificationRequests
{
  return self->_migratedTimeSensitiveNotificationRequests;
}

- (void)setMigratedTimeSensitiveNotificationRequests:(id)a3
{
}

- (NCNotificationListMigrationSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListMigrationSchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSMutableDictionary)migrationRequestCounterForNotificationRequests
{
  return self->_migrationRequestCounterForNotificationRequests;
}

- (void)setMigrationRequestCounterForNotificationRequests:(id)a3
{
}

- (NSDate)currentlyScheduledDate
{
  return self->_currentlyScheduledDate;
}

- (void)setCurrentlyScheduledDate:(id)a3
{
}

- (PCPersistentTimer)scheduleTimer
{
  return self->_scheduleTimer;
}

- (void)setScheduleTimer:(id)a3
{
}

- (OS_dispatch_queue)scheduleTimerQueue
{
  return self->_scheduleTimerQueue;
}

- (void)setScheduleTimerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleTimerQueue, 0);
  objc_storeStrong((id *)&self->_scheduleTimer, 0);
  objc_storeStrong((id *)&self->_currentlyScheduledDate, 0);
  objc_storeStrong((id *)&self->_migrationRequestCounterForNotificationRequests, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_migratedTimeSensitiveNotificationRequests, 0);
  objc_storeStrong((id *)&self->_migrationDatesForNotificationRequests, 0);

  objc_storeStrong((id *)&self->_migrationDateForNotificationDigest, 0);
}

void __84__NCNotificationListMigrationScheduler_addMigrationForNotificationRequests_forDate___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [a3 notificationIdentifier];
  id v8 = objc_msgSend(v7, "un_logDigest");
  int v9 = 138543618;
  double v10 = v6;
  __int16 v11 = 2114;
  int v12 = v8;
  _os_log_error_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_ERROR, "%{public}@ no migration date found for request %{public}@", (uint8_t *)&v9, 0x16u);
}

- (void)_scheduleMigrationTimerForDate:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = [*(id *)(a2 + 40) stringFromDate:a3];
  int v9 = 138543618;
  double v10 = v7;
  __int16 v11 = 2112;
  int v12 = v8;
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "%{public}@ attempting to schedule migration timer for a date in the past %@", (uint8_t *)&v9, 0x16u);
}

@end