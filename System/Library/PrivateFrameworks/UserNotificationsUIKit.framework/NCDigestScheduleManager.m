@interface NCDigestScheduleManager
- (NCDigestInfo)previouslyScheduledDigestInfo;
- (NCDigestInfo)upcomingScheduledDigestInfo;
- (NCDigestScheduleManager)init;
- (NSArray)digestScheduleTimes;
- (NSHashTable)observers;
- (NSMutableSet)digestInfos;
- (OS_dispatch_queue)digestScheduleTimerQueue;
- (PCPersistentTimer)digestScheduleTimer;
- (id)_currentScheduleTimes;
- (id)_scheduleDateFromScheduleTime:(id)a3;
- (void)_handleTimeOrLocaleChange:(id)a3;
- (void)_publishDigestInfo:(id)a3 withUpcomingDigestInfo:(id)a4;
- (void)_publishRevokeUpcomingDigest:(id)a3;
- (void)_publishToAllObservers:(id)a3;
- (void)_publishUpcomingDigestInfo:(id)a3;
- (void)_scheduleTimerFiredForTimer:(id)a3;
- (void)_scheduleTimerForDigestInfo:(id)a3;
- (void)_updateDigestInfosForScheduleTimes:(id)a3;
- (void)_updateUpcomingScheduledDigestInfo;
- (void)addObserver:(id)a3;
- (void)invalidateScheduledTimer;
- (void)invalidateScheduledTimerSendCancel:(BOOL)a3;
- (void)removeObserver:(id)a3;
- (void)setDigestInfos:(id)a3;
- (void)setDigestScheduleTimer:(id)a3;
- (void)setDigestScheduleTimerQueue:(id)a3;
- (void)setDigestScheduleTimes:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPreviouslyScheduledDigestInfo:(id)a3;
- (void)setUpcomingScheduledDigestInfo:(id)a3;
@end

@implementation NCDigestScheduleManager

- (NCDigestScheduleManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NCDigestScheduleManager;
  v2 = [(NCDigestScheduleManager *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.usernotifications.ScheduledDeliveryTimerQueue", v3);
    digestScheduleTimerQueue = v2->_digestScheduleTimerQueue;
    v2->_digestScheduleTimerQueue = (OS_dispatch_queue *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__handleTimeOrLocaleChange_ name:*MEMORY[0x1E4FB2708] object:0];
    [v6 addObserver:v2 selector:sel__handleTimeOrLocaleChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v2;
}

- (void)setDigestScheduleTimes:(id)a3
{
  id v5 = a3;
  if (![(NSArray *)self->_digestScheduleTimes isEqualToArray:v5])
  {
    v6 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Updating notification digest schedule times", v7, 2u);
    }
    objc_storeStrong((id *)&self->_digestScheduleTimes, a3);
    -[NCDigestScheduleManager invalidateScheduledTimerSendCancel:](self, "invalidateScheduledTimerSendCancel:", [v5 count] == 0);
    [(NCDigestScheduleManager *)self _updateDigestInfosForScheduleTimes:v5];
  }
}

- (void)invalidateScheduledTimer
{
}

- (void)invalidateScheduledTimerSendCancel:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = *MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    digestScheduleTimer = self->_digestScheduleTimer;
    int v10 = 138543362;
    v11 = digestScheduleTimer;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating scheduled notification digest timer %{public}@", (uint8_t *)&v10, 0xCu);
  }
  v7 = [(NCDigestScheduleManager *)self upcomingScheduledDigestInfo];
  digestInfos = self->_digestInfos;
  self->_digestInfos = 0;

  [(PCPersistentTimer *)self->_digestScheduleTimer invalidate];
  v9 = self->_digestScheduleTimer;
  self->_digestScheduleTimer = 0;

  if (v3) {
    [(NCDigestScheduleManager *)self _publishRevokeUpcomingDigest:v7];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)_publishToAllObservers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  id v5 = (void *)[(NSHashTable *)self->_observers copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_publishDigestInfo:(id)a3 withUpcomingDigestInfo:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "Publishing scheduled notification digest [info=%{public}@] \t upcoming digest [date=%{public}@]", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__NCDigestScheduleManager__publishDigestInfo_withUpcomingDigestInfo___block_invoke;
  v11[3] = &unk_1E6A95120;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NCDigestScheduleManager *)self _publishToAllObservers:v11];
}

uint64_t __69__NCDigestScheduleManager__publishDigestInfo_withUpcomingDigestInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 publishScheduledDigest:*(void *)(a1 + 32) upcomingDigest:*(void *)(a1 + 40)];
}

- (void)_publishUpcomingDigestInfo:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "Publishing upcoming notification digest [info=%{public}@]", buf, 0xCu);
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__NCDigestScheduleManager__publishUpcomingDigestInfo___block_invoke;
    v6[3] = &unk_1E6A95148;
    id v7 = v4;
    [(NCDigestScheduleManager *)self _publishToAllObservers:v6];
  }
}

uint64_t __54__NCDigestScheduleManager__publishUpcomingDigestInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 publishUpcomingDigest:*(void *)(a1 + 32)];
}

- (void)_publishRevokeUpcomingDigest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__NCDigestScheduleManager__publishRevokeUpcomingDigest___block_invoke;
  v6[3] = &unk_1E6A95148;
  id v7 = v4;
  id v5 = v4;
  [(NCDigestScheduleManager *)self _publishToAllObservers:v6];
}

uint64_t __56__NCDigestScheduleManager__publishRevokeUpcomingDigest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 revokeUpcomingDigest:*(void *)(a1 + 32)];
}

- (void)_updateDigestInfosForScheduleTimes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    if (!self->_digestInfos)
    {
      id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      digestInfos = self->_digestInfos;
      self->_digestInfos = v5;
    }
    upcomingScheduledDigestInfo = self->_upcomingScheduledDigestInfo;
    self->_upcomingScheduledDigestInfo = 0;

    previouslyScheduledDigestInfo = self->_previouslyScheduledDigestInfo;
    self->_previouslyScheduledDigestInfo = 0;

    id v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = [v4 sortedArrayUsingComparator:&__block_literal_global_41];
    uint64_t v11 = [v10 count];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__NCDigestScheduleManager__updateDigestInfosForScheduleTimes___block_invoke_2;
    v23[3] = &unk_1E6A95170;
    v23[4] = self;
    uint64_t v25 = v11;
    id v12 = v9;
    id v24 = v12;
    [v10 enumerateObjectsUsingBlock:v23];
    id v13 = (void *)[(NCDigestInfo *)self->_previouslyScheduledDigestInfo mutableCopy];
    long long v14 = [v13 scheduleDate];
    id v15 = [v14 dateByAddingTimeInterval:-86400.0];
    [v13 setScheduleDate:v15];

    __int16 v16 = (NCDigestInfo *)[v13 copy];
    id v17 = self->_previouslyScheduledDigestInfo;
    self->_previouslyScheduledDigestInfo = v16;

    uint64_t v18 = (os_log_t *)MEMORY[0x1E4FB3778];
    v19 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_upcomingScheduledDigestInfo;
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1D7C04000, v19, OS_LOG_TYPE_DEFAULT, "Updated upcoming digest info: %{public}@", buf, 0xCu);
    }
    v21 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_previouslyScheduledDigestInfo;
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_1D7C04000, v21, OS_LOG_TYPE_DEFAULT, "Updated previously scheduled digest info: %{public}@", buf, 0xCu);
    }
    [(NCDigestScheduleManager *)self _publishUpcomingDigestInfo:self->_upcomingScheduledDigestInfo];
    [(NCDigestScheduleManager *)self _scheduleTimerForDigestInfo:self->_upcomingScheduledDigestInfo];
  }
}

uint64_t __62__NCDigestScheduleManager__updateDigestInfosForScheduleTimes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 hour];
  if (v6 <= [v5 hour])
  {
    uint64_t v8 = [v4 hour];
    uint64_t v7 = -1;
    if (v8 == [v5 hour])
    {
      uint64_t v9 = [v4 minute];
      if (v9 >= [v5 minute]) {
        uint64_t v7 = 1;
      }
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

void __62__NCDigestScheduleManager__updateDigestInfosForScheduleTimes___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)a1[4];
  id v6 = a2;
  uint64_t v7 = [v5 _scheduleDateFromScheduleTime:v6];
  uint64_t v8 = objc_alloc_init(NCMutableDigestInfo);
  [(NCMutableDigestInfo *)v8 setScheduleTime:v6];

  [(NCMutableDigestInfo *)v8 setScheduleDate:v7];
  id v9 = v7;
  if (objc_msgSend(v9, "nc_isMorning"))
  {
    uint64_t v10 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v11 = v10;
    id v12 = @"NOTIFICATION_SUMMARY_SECTION_TITLE_MORNING";
  }
  else if (objc_msgSend(v9, "nc_isAfternoon"))
  {
    uint64_t v10 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v11 = v10;
    id v12 = @"NOTIFICATION_SUMMARY_SECTION_TITLE_AFTERNOON";
  }
  else if (objc_msgSend(v9, "nc_isEvening"))
  {
    uint64_t v10 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v11 = v10;
    id v12 = @"NOTIFICATION_SUMMARY_SECTION_TITLE_EVENING";
  }
  else
  {
    int v37 = objc_msgSend(v9, "nc_isNight");
    uint64_t v10 = NCUserNotificationsUIKitFrameworkBundle();
    uint64_t v11 = v10;
    if (v37) {
      id v12 = @"NOTIFICATION_SUMMARY_SECTION_TITLE_NIGHT";
    }
    else {
      id v12 = @"NOTIFICATION_SUMMARY_SECTION_TITLE_OVERNIGHT";
    }
  }
  id v13 = [v10 localizedStringForKey:v12 value:&stru_1F2F516F8 table:0];

  [(NCMutableDigestInfo *)v8 setTitleString:v13];
  id v14 = v9;
  if (objc_msgSend(v14, "nc_isMorning"))
  {
    id v15 = NCUserNotificationsUIKitFrameworkBundle();
    __int16 v16 = v15;
    id v17 = @"NOTIFICATION_SUMMARY_HEADER_MORNING";
  }
  else if (objc_msgSend(v14, "nc_isAfternoon"))
  {
    id v15 = NCUserNotificationsUIKitFrameworkBundle();
    __int16 v16 = v15;
    id v17 = @"NOTIFICATION_SUMMARY_HEADER_AFTERNOON";
  }
  else if (objc_msgSend(v14, "nc_isEvening"))
  {
    id v15 = NCUserNotificationsUIKitFrameworkBundle();
    __int16 v16 = v15;
    id v17 = @"NOTIFICATION_SUMMARY_HEADER_EVENING";
  }
  else
  {
    int v38 = objc_msgSend(v14, "nc_isNight");
    id v15 = NCUserNotificationsUIKitFrameworkBundle();
    __int16 v16 = v15;
    if (v38) {
      id v17 = @"NOTIFICATION_SUMMARY_HEADER_NIGHT";
    }
    else {
      id v17 = @"NOTIFICATION_SUMMARY_HEADER_OVERNIGHT";
    }
  }
  uint64_t v18 = [v15 localizedStringForKey:v17 value:&stru_1F2F516F8 table:0];

  [(NCMutableDigestInfo *)v8 setHeaderString:v18];
  unint64_t v19 = a1[6];
  if (a3 || v19 <= 1)
  {
    BOOL v21 = v19 > 1;
    unint64_t v22 = v19 - 1;
    unsigned int v23 = v21;
    uint64_t v24 = 2 * v23;
    if (v22 == a3) {
      uint64_t v20 = v24;
    }
    else {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 1;
  }
  [(NCMutableDigestInfo *)v8 setDeliveryOrder:v20];
  [*(id *)(a1[4] + 48) addObject:v8];
  uint64_t v25 = *MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    int v39 = 138543362;
    v40 = v8;
    _os_log_impl(&dword_1D7C04000, v25, OS_LOG_TYPE_DEFAULT, "Added notification digest [info=%{public}@]", (uint8_t *)&v39, 0xCu);
  }
  [v14 timeIntervalSinceDate:a1[5]];
  double v27 = v26;
  uint64_t v28 = a1[4];
  v29 = *(void **)(v28 + 16);
  if (v29)
  {
    v30 = [v29 scheduleDate];
    [v30 timeIntervalSinceDate:a1[5]];
    double v32 = v31;

    uint64_t v28 = a1[4];
  }
  else
  {
    double v32 = 2147483650.0;
  }
  if (v27 < v32)
  {
    objc_storeStrong((id *)(v28 + 16), v8);
    uint64_t v28 = a1[4];
  }
  v33 = *(void **)(v28 + 24);
  if (v33)
  {
    v34 = [v33 scheduleDate];
    [v34 timeIntervalSinceDate:a1[5]];
    double v36 = v35;
  }
  else
  {
    double v36 = -2147483650.0;
  }
  if (v27 > v36) {
    objc_storeStrong((id *)(a1[4] + 24), v8);
  }
}

- (void)_updateUpcomingScheduledDigestInfo
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__15;
  id v15 = __Block_byref_object_dispose__15;
  id v16 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0x41DFFFFFFFC00000;
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  digestInfos = self->_digestInfos;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__NCDigestScheduleManager__updateUpcomingScheduledDigestInfo__block_invoke;
  v6[3] = &unk_1E6A95198;
  void v6[4] = self;
  id v5 = v3;
  id v7 = v5;
  uint64_t v8 = v10;
  id v9 = &v11;
  [(NSMutableSet *)digestInfos enumerateObjectsUsingBlock:v6];
  objc_storeStrong((id *)&self->_upcomingScheduledDigestInfo, (id)v12[5]);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
}

void __61__NCDigestScheduleManager__updateUpcomingScheduledDigestInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v15 = v3;
  id v5 = [v3 scheduleTime];
  id v6 = [v4 _scheduleDateFromScheduleTime:v5];

  [*(id *)(a1 + 40) timeIntervalSinceDate:v6];
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  else {
    double v8 = -v7;
  }
  if (v8 < *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && ([*(id *)(a1 + 40) isEqualToDate:v6] & 1) == 0)
  {
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
    id v9 = (void *)[v15 mutableCopy];
    uint64_t v10 = [v9 scheduleDate];
    char v11 = [v6 isEqualToDate:v10];

    if ((v11 & 1) == 0) {
      [v9 setScheduleDate:v6];
    }
    uint64_t v12 = [v9 copy];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (void)_scheduleTimerFiredForTimer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = *MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = v4;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Notification digest scheduled timer %{public}@ fired for digest info [%{public}@]", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NCDigestScheduleManager__scheduleTimerFiredForTimer___block_invoke;
  v8[3] = &unk_1E6A92FE0;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __55__NCDigestScheduleManager__scheduleTimerFiredForTimer___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)[*(id *)(a1 + 32) copy];
  [WeakRetained setPreviouslyScheduledDigestInfo:v3];

  [WeakRetained _updateUpcomingScheduledDigestInfo];
  id v4 = (os_log_t *)MEMORY[0x1E4FB3778];
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [WeakRetained upcomingScheduledDigestInfo];
    int v14 = 138543362;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Updated upcoming digest info: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  os_log_t v8 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [WeakRetained previouslyScheduledDigestInfo];
    int v14 = 138543362;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "Updated previously scheduled digest info: %{public}@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [WeakRetained upcomingScheduledDigestInfo];
  [WeakRetained _publishDigestInfo:v11 withUpcomingDigestInfo:v12];

  __int16 v13 = [WeakRetained upcomingScheduledDigestInfo];
  [WeakRetained _scheduleTimerForDigestInfo:v13];
}

- (void)_handleTimeOrLocaleChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [a3 name];
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Updating notification digest schedule infos on time or locale change for notification %{public}@", (uint8_t *)&v9, 0xCu);
  }
  os_log_t v8 = [(NCDigestScheduleManager *)self _currentScheduleTimes];
  [(NCDigestScheduleManager *)self invalidateScheduledTimerSendCancel:v8 == 0];
  [(NCDigestScheduleManager *)self _updateDigestInfosForScheduleTimes:v8];
}

- (id)_scheduleDateFromScheduleTime:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v5 components:28 fromDate:v6];
  os_log_t v8 = (void *)[v7 copy];
  objc_msgSend(v8, "setHour:", objc_msgSend(v4, "hour"));
  uint64_t v9 = [v4 minute];

  [v8 setMinute:v9];
  [v8 setSecond:0];
  [v8 setNanosecond:0];
  id v10 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v8 setTimeZone:v10];

  uint64_t v11 = [v5 dateFromComponents:v8];
  [v11 timeIntervalSinceDate:v6];
  if (v12 < 10.0)
  {
    uint64_t v13 = [v11 dateByAddingTimeInterval:86400.0];

    uint64_t v11 = (void *)v13;
  }

  return v11;
}

- (id)_currentScheduleTimes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  digestInfos = self->_digestInfos;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__NCDigestScheduleManager__currentScheduleTimes__block_invoke;
  v7[3] = &unk_1E6A951C0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableSet *)digestInfos enumerateObjectsUsingBlock:v7];

  return v5;
}

void __48__NCDigestScheduleManager__currentScheduleTimes__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 scheduleTime];
  id v3 = (void *)[v4 copy];
  [v2 addObject:v3];
}

- (void)_scheduleTimerForDigestInfo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 scheduleDate];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    id v8 = [v6 earlierDate:v7];

    uint64_t v9 = (os_log_t *)MEMORY[0x1E4FB3778];
    if (v8 == v6)
    {
      id v10 = *MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
        -[NCDigestScheduleManager _scheduleTimerForDigestInfo:]((uint64_t)v6, v10);
      }
      uint64_t v11 = [v6 dateByAddingTimeInterval:86400.0];

      double v12 = (void *)[v5 copy];
      [v12 setScheduleDate:v11];
      uint64_t v13 = [v12 copy];

      id v6 = (void *)v11;
      id v5 = (void *)v13;
    }
    int v14 = (PCPersistentTimer *)[objc_alloc(MEMORY[0x1E4F89D38]) initWithFireDate:v6 serviceIdentifier:@"com.apple.usernotifications.scheduledDelivery" target:self selector:sel__scheduleTimerFiredForTimer_ userInfo:v5];
    digestScheduleTimer = self->_digestScheduleTimer;
    self->_digestScheduleTimer = v14;

    [(PCPersistentTimer *)self->_digestScheduleTimer setMinimumEarlyFireProportion:1.0];
    [(PCPersistentTimer *)self->_digestScheduleTimer setUserVisible:1];
    [(PCPersistentTimer *)self->_digestScheduleTimer scheduleInQueue:self->_digestScheduleTimerQueue];
    uint64_t v16 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = self->_digestScheduleTimer;
      int v18 = 138543618;
      unint64_t v19 = v17;
      __int16 v20 = 2114;
      BOOL v21 = v5;
      _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "Scheduled persistent timer %{public}@ for notification digest [info=%{public}@]", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (NSArray)digestScheduleTimes
{
  return self->_digestScheduleTimes;
}

- (NCDigestInfo)upcomingScheduledDigestInfo
{
  return self->_upcomingScheduledDigestInfo;
}

- (void)setUpcomingScheduledDigestInfo:(id)a3
{
}

- (NCDigestInfo)previouslyScheduledDigestInfo
{
  return self->_previouslyScheduledDigestInfo;
}

- (void)setPreviouslyScheduledDigestInfo:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (PCPersistentTimer)digestScheduleTimer
{
  return self->_digestScheduleTimer;
}

- (void)setDigestScheduleTimer:(id)a3
{
}

- (NSMutableSet)digestInfos
{
  return self->_digestInfos;
}

- (void)setDigestInfos:(id)a3
{
}

- (OS_dispatch_queue)digestScheduleTimerQueue
{
  return self->_digestScheduleTimerQueue;
}

- (void)setDigestScheduleTimerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestScheduleTimerQueue, 0);
  objc_storeStrong((id *)&self->_digestInfos, 0);
  objc_storeStrong((id *)&self->_digestScheduleTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_previouslyScheduledDigestInfo, 0);
  objc_storeStrong((id *)&self->_upcomingScheduledDigestInfo, 0);

  objc_storeStrong((id *)&self->_digestScheduleTimes, 0);
}

- (void)_scheduleTimerForDigestInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_ERROR, "Schedule fire date for persistent timer is before current time! [fireDate=%{public}@]", (uint8_t *)&v2, 0xCu);
}

@end