@interface MTAlarmSyncDataModel
+ (id)defaultBlock;
- (BOOL)isFromOtherDevice;
- (MTAlarmStorage)alarmStorage;
- (MTAlarmSyncDataModel)initWithAlarmStorage:(id)a3 syncMetrics:(id)a4;
- (MTAlarmSyncDataModel)initWithAlarmStorage:(id)a3 syncMetrics:(id)a4 syncServiceManagerBlock:(id)a5 serializer:(id)a6 serialQueue:(id)a7;
- (MTMetrics)syncMetrics;
- (MTSyncServiceManager)syncServiceManager;
- (NAScheduler)serializer;
- (OS_dispatch_queue)serialQueue;
- (id)dataFileName;
- (id)gatherDiagnostics;
- (id)sourceIdentifier;
- (void)_performAction:(id)a3;
- (void)_performDismiss:(id)a3;
- (void)_performSnooze:(id)a3;
- (void)_setupSyncManagerWithBlock:(id)a3;
- (void)applyChange:(id)a3;
- (void)printDiagnostics;
- (void)setAlarmStorage:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSyncMetrics:(id)a3;
- (void)setSyncServiceManager:(id)a3;
- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5;
- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5;
- (void)startSyncServices;
- (void)stopSyncServices;
@end

@implementation MTAlarmSyncDataModel

- (MTAlarmSyncDataModel)initWithAlarmStorage:(id)a3 syncMetrics:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)+[MTScheduler defaultPriority], -1);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.MTAlarmSyncDataModel", v8);
  v10 = [MEMORY[0x1E4F7A0F0] schedulerWithDispatchQueue:v9];
  v11 = [(id)objc_opt_class() defaultBlock];
  v12 = [(MTAlarmSyncDataModel *)self initWithAlarmStorage:v7 syncMetrics:v6 syncServiceManagerBlock:v11 serializer:v10 serialQueue:v9];

  return v12;
}

- (MTAlarmSyncDataModel)initWithAlarmStorage:(id)a3 syncMetrics:(id)a4 syncServiceManagerBlock:(id)a5 serializer:(id)a6 serialQueue:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MTAlarmSyncDataModel;
  v17 = [(MTAlarmSyncDataModel *)&v21 init];
  if (v17)
  {
    v18 = MTLogForCategory(6);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_19CC95000, v18, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v17->_alarmStorage, a3);
    objc_storeStrong((id *)&v17->_serialQueue, a7);
    objc_storeStrong((id *)&v17->_serializer, a6);
    objc_storeStrong((id *)&v17->_syncMetrics, a4);
    [(MTAlarmSyncDataModel *)v17 _setupSyncManagerWithBlock:v14];
  }

  return v17;
}

+ (id)defaultBlock
{
  return &__block_literal_global_6;
}

MTSyncServiceManager *__36__MTAlarmSyncDataModel_defaultBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (+[MTCompanionSyncStatusProvider deviceSupportsSyncing])
  {
    v3 = objc_alloc_init(MTCompanionSyncStatusProvider);
    v4 = [[MTCompanionSyncService alloc] initWithSyncStatusProvider:v3];
    v5 = [MTSyncServiceManager alloc];
    id v6 = [v2 syncMetrics];
    id v7 = [(MTSyncServiceManager *)v5 initWithSyncService:v4 syncStatusProvider:v3 syncDataModel:v2 syncMetrics:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_setupSyncManagerWithBlock:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  (*((void (**)(id, MTAlarmSyncDataModel *))a3 + 2))(a3, self);
  v4 = (MTSyncServiceManager *)objc_claimAutoreleasedReturnValue();
  syncServiceManager = self->_syncServiceManager;
  self->_syncServiceManager = v4;

  if (self->_syncServiceManager)
  {
    alarmStorage = self->_alarmStorage;
    [(MTAlarmStorage *)alarmStorage registerObserver:self];
  }
  else
  {
    id v7 = MTLogForCategory(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      dispatch_queue_t v9 = self;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ has no sync manager.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)startSyncServices
{
}

- (void)stopSyncServices
{
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isSleepAlarm])
  {
    dispatch_queue_t v9 = [v7 sourceIdentifier];
    uint64_t v10 = [(MTAlarmSyncDataModel *)self sourceIdentifier];
    char v11 = [v9 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      serializer = self->_serializer;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __61__MTAlarmSyncDataModel_source_didDismissAlarm_dismissAction___block_invoke;
      v13[3] = &unk_1E5915000;
      v13[4] = self;
      id v14 = v8;
      [(NAScheduler *)serializer performBlock:v13];
    }
  }
}

void __61__MTAlarmSyncDataModel_source_didDismissAlarm_dismissAction___block_invoke(uint64_t a1)
{
  id v2 = MTNewChildActivityForName(8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__MTAlarmSyncDataModel_source_didDismissAlarm_dismissAction___block_invoke_2;
  v4[3] = &unk_1E5915000;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  os_activity_apply(v2, v4);
}

void __61__MTAlarmSyncDataModel_source_didDismissAlarm_dismissAction___block_invoke_2(uint64_t a1)
{
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmSyncDataModel - Syncing Alarm Dismiss", v8, 2u);
  }

  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v4 = [*(id *)(a1 + 40) alarmIDString];
  id v5 = [*(id *)(a1 + 40) dismissedDate];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = +[MTSyncDismiss syncDismissOfObjectWithIdentifier:v4 dismissDate:v5 date:v6];
  [v3 syncChange:v7];
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isSleepAlarm])
  {
    dispatch_queue_t v9 = [v7 sourceIdentifier];
    uint64_t v10 = [(MTAlarmSyncDataModel *)self sourceIdentifier];
    char v11 = [v9 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      serializer = self->_serializer;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __59__MTAlarmSyncDataModel_source_didSnoozeAlarm_snoozeAction___block_invoke;
      v13[3] = &unk_1E5915000;
      v13[4] = self;
      id v14 = v8;
      [(NAScheduler *)serializer performBlock:v13];
    }
  }
}

void __59__MTAlarmSyncDataModel_source_didSnoozeAlarm_snoozeAction___block_invoke(uint64_t a1)
{
  id v2 = MTNewChildActivityForName(9);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__MTAlarmSyncDataModel_source_didSnoozeAlarm_snoozeAction___block_invoke_2;
  v4[3] = &unk_1E5915000;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  os_activity_apply(v2, v4);
}

void __59__MTAlarmSyncDataModel_source_didSnoozeAlarm_snoozeAction___block_invoke_2(uint64_t a1)
{
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmSyncDataModel - Syncing Alarm Snooze", v8, 2u);
  }

  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v4 = [*(id *)(a1 + 40) alarmIDString];
  id v5 = [*(id *)(a1 + 40) snoozeFireDate];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = +[MTSyncSnooze syncSnoozeOfObjectWithIdentifier:v4 snoozeDate:v5 date:v6];
  [v3 syncChange:v7];
}

- (id)dataFileName
{
  return @"AlarmSync.data";
}

- (void)applyChange:(id)a3
{
  id v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__MTAlarmSyncDataModel_applyChange___block_invoke;
  v7[3] = &unk_1E5915000;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  [(NAScheduler *)serializer performBlock:v7];
}

uint64_t __36__MTAlarmSyncDataModel_applyChange___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) syncType];
  if (!result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    return [v3 _performAction:v4];
  }
  return result;
}

- (void)_performAction:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ performing action %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MTAlarmSyncDataModel *)self _performDismiss:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(MTAlarmSyncDataModel *)self _performSnooze:v4];
    }
  }
}

- (void)_performDismiss:(id)a3
{
  id v4 = a3;
  id v5 = MTNewChildActivityForName(8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MTAlarmSyncDataModel__performDismiss___block_invoke;
  v7[3] = &unk_1E5915000;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __40__MTAlarmSyncDataModel__performDismiss___block_invoke(uint64_t a1)
{
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmSyncDataModel - Applying Alarm Dismiss", v6, 2u);
  }

  v3 = [*(id *)(a1 + 32) alarmStorage];
  id v4 = [*(id *)(a1 + 40) syncIdentifier];
  id v5 = [*(id *)(a1 + 40) dismissDate];
  [v3 dismissAlarmWithIdentifier:v4 dismissDate:v5 dismissAction:5 withCompletion:0 source:*(void *)(a1 + 32)];
}

- (void)_performSnooze:(id)a3
{
  id v4 = a3;
  id v5 = MTNewChildActivityForName(9);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MTAlarmSyncDataModel__performSnooze___block_invoke;
  v7[3] = &unk_1E5915000;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

void __39__MTAlarmSyncDataModel__performSnooze___block_invoke(uint64_t a1)
{
  id v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTAlarmSyncDataModel - Applying Alarm Snooze", v6, 2u);
  }

  v3 = [*(id *)(a1 + 32) alarmStorage];
  id v4 = [*(id *)(a1 + 40) syncIdentifier];
  id v5 = [*(id *)(a1 + 40) snoozeDate];
  [v3 snoozeAlarmWithIdentifier:v4 snoozeDate:v5 snoozeAction:2 withCompletion:0 source:*(void *)(a1 + 32)];
}

- (id)sourceIdentifier
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isFromOtherDevice
{
  return 1;
}

- (void)printDiagnostics
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = objc_opt_class();
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----%{public}@-----", (uint8_t *)&v7, 0xCu);
  }

  id v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(MTAlarmSyncDataModel *)self syncServiceManager];
    int v7 = 138543362;
    uint64_t v8 = (uint64_t)v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "Alarm Sync Manager: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(MTAlarmSyncDataModel *)self syncServiceManager];
  [v6 printDiagnostics];
}

- (id)gatherDiagnostics
{
  v3 = objc_opt_new();
  id v4 = [(MTAlarmSyncDataModel *)self syncServiceManager];
  uint64_t v5 = [v4 description];
  [v3 setObject:v5 forKeyedSubscript:@"Alarm Sync Managers"];

  id v6 = [(MTAlarmSyncDataModel *)self syncServiceManager];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    int v7 = [(MTAlarmSyncDataModel *)self syncServiceManager];
    uint64_t v8 = [v7 gatherDiagnostics];
    [v3 addEntriesFromDictionary:v8];
  }
  return v3;
}

- (MTSyncServiceManager)syncServiceManager
{
  return self->_syncServiceManager;
}

- (void)setSyncServiceManager:(id)a3
{
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (MTMetrics)syncMetrics
{
  return self->_syncMetrics;
}

- (void)setSyncMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncMetrics, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_syncServiceManager, 0);
}

@end