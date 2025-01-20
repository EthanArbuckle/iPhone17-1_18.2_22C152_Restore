@interface MTBaseAlarmWidgetProvider
- (BOOL)bypassReloadForAlarm:(id)a3;
- (BOOL)bypassReloadForAlarms:(id)a3;
- (MTAlarmStorage)alarmStorage;
- (MTBaseAlarmWidgetProvider)initWithAlarmStorage:(id)a3;
- (NSDate)lastReloadRequestDate;
- (NSTimer)reloadTimer;
- (OS_dispatch_queue)serialQueue;
- (id)broadcastWidgetTimelineReload;
- (void)broadcastWidgetTimelineReload;
- (void)reloadTimeline;
- (void)setLastReloadRequestDate:(id)a3;
- (void)setReloadTimer:(id)a3;
- (void)source:(id)a3 didAddAlarms:(id)a4;
- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5;
- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5;
- (void)source:(id)a3 didRemoveAlarms:(id)a4;
- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5;
- (void)source:(id)a3 didUpdateAlarms:(id)a4;
@end

@implementation MTBaseAlarmWidgetProvider

- (MTBaseAlarmWidgetProvider)initWithAlarmStorage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTBaseAlarmWidgetProvider;
  v6 = [(MTBaseAlarmWidgetProvider *)&v12 init];
  v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
  }

  if (v6)
  {
    [v5 registerObserver:v6];
    objc_storeStrong((id *)&v6->_alarmStorage, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mobiletimerd.MTBaseAlarmWidgetProvider", v8);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v9;
  }
  return v6;
}

- (id)broadcastWidgetTimelineReload
{
  v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(MTBaseAlarmWidgetProvider *)(uint64_t)self broadcastWidgetTimelineReload];
  }

  v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.mobiletimerd.MTBaseAlarmWidgetProvider" code:1 userInfo:0];
  return v4;
}

- (void)reloadTimeline
{
  v3 = [(MTBaseAlarmWidgetProvider *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MTBaseAlarmWidgetProvider_reloadTimeline__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __43__MTBaseAlarmWidgetProvider_reloadTimeline__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) throttleTimelineReload];
  if ((result & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F1C9C8] now];
    [*(id *)(a1 + 32) setLastReloadRequestDate:v3];

    return (uint64_t)(id)[*(id *)(a1 + 32) broadcastWidgetTimelineReload];
  }
  return result;
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    dispatch_queue_t v9 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didAddAlarms", (uint8_t *)&v8, 0xCu);
  }

  BOOL v7 = [(MTBaseAlarmWidgetProvider *)self bypassReloadForAlarms:v5];
  if (!v7) {
    [(MTBaseAlarmWidgetProvider *)self reloadTimeline];
  }
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    dispatch_queue_t v9 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didRemoveAlarms", (uint8_t *)&v8, 0xCu);
  }

  BOOL v7 = [(MTBaseAlarmWidgetProvider *)self bypassReloadForAlarms:v5];
  if (!v7) {
    [(MTBaseAlarmWidgetProvider *)self reloadTimeline];
  }
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    int v8 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didDismissAlarm", (uint8_t *)&v7, 0xCu);
  }

  [(MTBaseAlarmWidgetProvider *)self reloadTimeline];
}

- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    int v8 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didFireAlarm", (uint8_t *)&v7, 0xCu);
  }

  [(MTBaseAlarmWidgetProvider *)self reloadTimeline];
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    int v8 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didSnoozeAlarm", (uint8_t *)&v7, 0xCu);
  }

  [(MTBaseAlarmWidgetProvider *)self reloadTimeline];
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    uint64_t v9 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didUpdateAlarms", (uint8_t *)&v8, 0xCu);
  }

  BOOL v7 = [(MTBaseAlarmWidgetProvider *)self bypassReloadForAlarms:v5];
  if (!v7) {
    [(MTBaseAlarmWidgetProvider *)self reloadTimeline];
  }
}

- (BOOL)bypassReloadForAlarms:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    id v5 = [v4 firstObject];
    BOOL v6 = [(MTBaseAlarmWidgetProvider *)self bypassReloadForAlarm:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)bypassReloadForAlarm:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 shouldBypassWidgetReload];
  if (v5)
  {
    BOOL v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [v4 alarmIDString];
      int v9 = 138543618;
      uint64_t v10 = self;
      __int16 v11 = 2114;
      objc_super v12 = v7;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: alarm %{public}@ requested widget reload bypass", (uint8_t *)&v9, 0x16u);
    }
  }

  return v5;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (NSTimer)reloadTimer
{
  return self->_reloadTimer;
}

- (void)setReloadTimer:(id)a3
{
}

- (NSDate)lastReloadRequestDate
{
  return self->_lastReloadRequestDate;
}

- (void)setLastReloadRequestDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReloadRequestDate, 0);
  objc_storeStrong((id *)&self->_reloadTimer, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)broadcastWidgetTimelineReload
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2082;
  int v5 = "-[MTBaseAlarmWidgetProvider broadcastWidgetTimelineReload]";
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "Subclass %{public}@ has not implemented %{public}s", (uint8_t *)&v2, 0x16u);
}

@end