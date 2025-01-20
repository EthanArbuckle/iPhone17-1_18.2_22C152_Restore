@interface MTAlarmManagerExportedObject
- (MTAlarmManager)alarmManager;
- (MTAlarmManagerExportedObject)initWithAlarmManager:(id)a3;
- (void)_didReceiveAlarmServerReadyNotification:(id)a3;
- (void)alarmDismissed:(id)a3;
- (void)alarmFired:(id)a3;
- (void)alarmSnoozed:(id)a3;
- (void)alarmsAdded:(id)a3;
- (void)alarmsRemoved:(id)a3;
- (void)alarmsUpdated:(id)a3;
- (void)dealloc;
- (void)nextAlarmChanged:(id)a3;
@end

@implementation MTAlarmManagerExportedObject

- (MTAlarmManagerExportedObject)initWithAlarmManager:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTAlarmManagerExportedObject;
  v5 = [(MTAlarmManagerExportedObject *)&v9 init];
  if (v5)
  {
    v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_alarmManager, v4);
    v7 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v7 addObserver:v5 selector:sel__didReceiveAlarmServerReadyNotification_ name:@"com.apple.MTAlarmServer.ready" object:0];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self name:@"com.apple.MTAlarmServer.ready" object:0];

  v5.receiver = self;
  v5.super_class = (Class)MTAlarmManagerExportedObject;
  [(MTAlarmManagerExportedObject *)&v5 dealloc];
}

- (void)_didReceiveAlarmServerReadyNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [(MTAlarmManagerExportedObject *)self alarmManager];
  objc_super v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTAlarmServerReadyNotification", buf, 0xCu);
  }

  if (v4)
  {
    v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v4;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTAlarmServerReadyNotification, posting MTAlarmManagerStateReset", buf, 0xCu);
    }

    v7 = [(MTAlarmManagerExportedObject *)v4 cache];
    [v7 markNeedsUpdate];

    uint64_t v8 = [(MTAlarmManagerExportedObject *)v4 notificationCenter];
    objc_super v9 = [v8 mtNotifiyingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MTAlarmManagerExportedObject__didReceiveAlarmServerReadyNotification___block_invoke;
    block[3] = &unk_1E59150A8;
    v11 = v4;
    dispatch_async(v9, block);
  }
}

void __72__MTAlarmManagerExportedObject__didReceiveAlarmServerReadyNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notificationCenter];
  [v2 postNotificationName:@"MTAlarmManagerStateReset" object:*(void *)(a1 + 32)];
}

- (void)alarmsAdded:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(MTAlarmManagerExportedObject *)self alarmManager];
  if (v5)
  {
    v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 valueForKey:@"alarmID"];
      *(_DWORD *)buf = 138543618;
      v15 = v5;
      __int16 v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarms added: %{public}@", buf, 0x16u);
    }
    uint64_t v8 = [v5 cache];
    [v8 markNeedsUpdate];

    objc_super v9 = [v5 notificationCenter];
    v10 = [v9 mtNotifiyingQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__MTAlarmManagerExportedObject_alarmsAdded___block_invoke;
    v11[3] = &unk_1E5915000;
    id v12 = v4;
    id v13 = v5;
    dispatch_async(v10, v11);
  }
}

void __44__MTAlarmManagerExportedObject_alarmsAdded___block_invoke(uint64_t a1)
{
  kdebug_trace();
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Added", v7, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:@"Alarms"];
  }
  else
  {
    id v4 = 0;
  }
  objc_super v5 = [*(id *)(a1 + 40) notificationCenter];
  [v5 postNotificationName:@"MTAlarmManagerAlarmsAdded" object:*(void *)(a1 + 40) userInfo:v4];

  v6 = [*(id *)(a1 + 40) notificationCenter];
  [v6 postNotificationName:@"MTAlarmManagerAlarmsChanged" object:*(void *)(a1 + 40) userInfo:v4];
}

- (void)alarmsUpdated:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(MTAlarmManagerExportedObject *)self alarmManager];
  if (v5)
  {
    v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 valueForKey:@"alarmID"];
      *(_DWORD *)buf = 138543618;
      v15 = v5;
      __int16 v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarms updated: %{public}@", buf, 0x16u);
    }
    uint64_t v8 = [v5 cache];
    [v8 markNeedsUpdate];

    objc_super v9 = [v5 notificationCenter];
    v10 = [v9 mtNotifiyingQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__MTAlarmManagerExportedObject_alarmsUpdated___block_invoke;
    v11[3] = &unk_1E5915000;
    id v12 = v4;
    id v13 = v5;
    dispatch_async(v10, v11);
  }
}

void __46__MTAlarmManagerExportedObject_alarmsUpdated___block_invoke(uint64_t a1)
{
  kdebug_trace();
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Updated", v7, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:@"Alarms"];
  }
  else
  {
    id v4 = 0;
  }
  objc_super v5 = [*(id *)(a1 + 40) notificationCenter];
  [v5 postNotificationName:@"MTAlarmManagerAlarmsUpdated" object:*(void *)(a1 + 40) userInfo:v4];

  v6 = [*(id *)(a1 + 40) notificationCenter];
  [v6 postNotificationName:@"MTAlarmManagerAlarmsChanged" object:*(void *)(a1 + 40) userInfo:v4];
}

- (void)alarmsRemoved:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(MTAlarmManagerExportedObject *)self alarmManager];
  if (v5)
  {
    v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 valueForKey:@"alarmID"];
      *(_DWORD *)buf = 138543618;
      v15 = v5;
      __int16 v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarms removed: %{public}@", buf, 0x16u);
    }
    uint64_t v8 = [v5 cache];
    [v8 markNeedsUpdate];

    objc_super v9 = [v5 notificationCenter];
    v10 = [v9 mtNotifiyingQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__MTAlarmManagerExportedObject_alarmsRemoved___block_invoke;
    v11[3] = &unk_1E5915000;
    id v12 = v4;
    id v13 = v5;
    dispatch_async(v10, v11);
  }
}

void __46__MTAlarmManagerExportedObject_alarmsRemoved___block_invoke(uint64_t a1)
{
  kdebug_trace();
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Removed", v7, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:@"Alarms"];
  }
  else
  {
    id v4 = 0;
  }
  objc_super v5 = [*(id *)(a1 + 40) notificationCenter];
  [v5 postNotificationName:@"MTAlarmManagerAlarmsRemoved" object:*(void *)(a1 + 40) userInfo:v4];

  v6 = [*(id *)(a1 + 40) notificationCenter];
  [v6 postNotificationName:@"MTAlarmManagerAlarmsChanged" object:*(void *)(a1 + 40) userInfo:v4];
}

- (void)alarmSnoozed:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(MTAlarmManagerExportedObject *)self alarmManager];
  if (v5)
  {
    v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v5;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarm snoozed: %{public}@", buf, 0x16u);
    }

    v7 = [v5 cache];
    [v7 markNeedsUpdate];

    uint64_t v8 = [v5 notificationCenter];
    objc_super v9 = [v8 mtNotifiyingQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__MTAlarmManagerExportedObject_alarmSnoozed___block_invoke;
    v10[3] = &unk_1E5915000;
    id v11 = v4;
    id v12 = v5;
    dispatch_async(v9, v10);
  }
}

void __45__MTAlarmManagerExportedObject_alarmSnoozed___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Snoozed", v9, 2u);
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
    v10[0] = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    objc_super v5 = [v3 dictionaryWithObject:v4 forKey:@"Alarms"];

    v6 = [*(id *)(a1 + 40) notificationCenter];
    [v6 postNotificationName:@"MTAlarmManagerAlarmsUpdated" object:*(void *)(a1 + 40) userInfo:v5];

    v7 = [*(id *)(a1 + 40) notificationCenter];
    [v7 postNotificationName:@"MTAlarmManagerAlarmsChanged" object:*(void *)(a1 + 40) userInfo:v5];

    uint64_t v8 = [*(id *)(a1 + 40) notificationCenter];
    [v8 postNotificationName:@"MTAlarmManagerFiringAlarmChanged" object:*(void *)(a1 + 40) userInfo:v5];
  }
}

- (void)alarmFired:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(MTAlarmManagerExportedObject *)self alarmManager];
  if (v5)
  {
    v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v5;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarm fired: %{public}@", buf, 0x16u);
    }

    v7 = [v5 cache];
    [v7 markNeedsUpdate];

    uint64_t v8 = [v5 notificationCenter];
    objc_super v9 = [v8 mtNotifiyingQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __43__MTAlarmManagerExportedObject_alarmFired___block_invoke;
    v10[3] = &unk_1E5915000;
    id v11 = v4;
    id v12 = v5;
    dispatch_async(v9, v10);
  }
}

void __43__MTAlarmManagerExportedObject_alarmFired___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Fired", v8, 2u);
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
    v9[0] = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    objc_super v5 = [v3 dictionaryWithObject:v4 forKey:@"Alarms"];

    v6 = [*(id *)(a1 + 40) notificationCenter];
    [v6 postNotificationName:@"MTAlarmManagerAlarmFired" object:*(void *)(a1 + 40) userInfo:v5];

    v7 = [*(id *)(a1 + 40) notificationCenter];
    [v7 postNotificationName:@"MTAlarmManagerFiringAlarmChanged" object:*(void *)(a1 + 40) userInfo:v5];
  }
}

- (void)alarmDismissed:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(MTAlarmManagerExportedObject *)self alarmManager];
  if (v5)
  {
    v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v5;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarm dismissed: %{public}@", buf, 0x16u);
    }

    v7 = [v5 cache];
    [v7 markNeedsUpdate];

    uint64_t v8 = [v5 notificationCenter];
    objc_super v9 = [v8 mtNotifiyingQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __47__MTAlarmManagerExportedObject_alarmDismissed___block_invoke;
    v10[3] = &unk_1E5915000;
    id v11 = v4;
    id v12 = v5;
    dispatch_async(v9, v10);
  }
}

void __47__MTAlarmManagerExportedObject_alarmDismissed___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Alarm Dismissed", v8, 2u);
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
    v9[0] = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    objc_super v5 = [v3 dictionaryWithObject:v4 forKey:@"Alarms"];

    v6 = [*(id *)(a1 + 40) notificationCenter];
    [v6 postNotificationName:@"MTAlarmManagerFiringAlarmDismissed" object:*(void *)(a1 + 40) userInfo:v5];

    v7 = [*(id *)(a1 + 40) notificationCenter];
    [v7 postNotificationName:@"MTAlarmManagerFiringAlarmChanged" object:*(void *)(a1 + 40) userInfo:v5];
  }
}

- (void)nextAlarmChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(MTAlarmManagerExportedObject *)self alarmManager];
  if (v5)
  {
    v6 = MTLogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v5;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notifying next alarm changed: %{public}@", buf, 0x16u);
    }

    v7 = [v5 cache];
    [v7 markNeedsUpdate];

    uint64_t v8 = [v5 notificationCenter];
    objc_super v9 = [v8 mtNotifiyingQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __49__MTAlarmManagerExportedObject_nextAlarmChanged___block_invoke;
    v10[3] = &unk_1E5915000;
    id v11 = v4;
    id v12 = v5;
    dispatch_async(v9, v10);
  }
}

void __49__MTAlarmManagerExportedObject_nextAlarmChanged___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmManager - Next Alarm Changed", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:@"NextAlarm"];
  }
  else
  {
    id v4 = 0;
  }
  objc_super v5 = [*(id *)(a1 + 40) notificationCenter];
  [v5 postNotificationName:@"MTAlarmManagerNextAlarmChanged" object:*(void *)(a1 + 40) userInfo:v4];

  v6 = MTLogForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v7;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ notified next alarm changed: %{public}@", buf, 0x16u);
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = *(void *)(a1 + 32);
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v10 = [v8 dictionaryWithObject:v9 forKey:@"Alarms"];

    id v11 = [*(id *)(a1 + 40) notificationCenter];
    [v11 postNotificationName:@"MTAlarmManagerAlarmsChanged" object:*(void *)(a1 + 40) userInfo:v10];

    id v12 = MTLogForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ notified alarms changed: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v10 = v4;
  }
}

- (MTAlarmManager)alarmManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alarmManager);
  return (MTAlarmManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end