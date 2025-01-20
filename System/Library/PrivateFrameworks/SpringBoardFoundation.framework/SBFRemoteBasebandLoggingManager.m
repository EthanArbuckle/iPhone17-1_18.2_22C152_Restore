@interface SBFRemoteBasebandLoggingManager
+ (id)sharedInstance;
- (BOOL)isLogCollectionEnabled;
- (CellularLogging)cellularLogging;
- (NSHashTable)observers;
- (SBFRemoteBasebandLoggingManager)init;
- (void)_notifyObservers;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCellularLogging:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation SBFRemoteBasebandLoggingManager

- (SBFRemoteBasebandLoggingManager)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SBFRemoteBasebandLoggingManager;
  v2 = [(SBFRemoteBasebandLoggingManager *)&v14 init];
  if (v2)
  {
    if (CellularLoggingLibraryCore())
    {
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2050000000;
      v3 = (void *)getCellularLoggingClass_softClass;
      uint64_t v18 = getCellularLoggingClass_softClass;
      if (!getCellularLoggingClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCellularLoggingClass_block_invoke;
        v20 = &unk_1E548C938;
        v21 = &v15;
        __getCellularLoggingClass_block_invoke((uint64_t)buf);
        v3 = (void *)v16[3];
      }
      v4 = v3;
      _Block_object_dispose(&v15, 8);
      v5 = (CellularLogging *)objc_alloc_init(v4);
      cellularLogging = v2->_cellularLogging;
      v2->_cellularLogging = v5;

      v7 = SBLogCellularLogCollection();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v2->_cellularLogging;
        int v9 = [(CellularLogging *)v8 isLoggingStarted];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v9;
        _os_log_impl(&dword_18B52E000, v7, OS_LOG_TYPE_DEFAULT, "SBFRemoteBasebandLoggingManager %p initialized, log collection status is %{BOOL}d", buf, 0x12u);
      }
    }
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:2];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v10;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)SBFHandleRemoteBasebandLoggingStatusChanged, @"com.apple.CarrierCellularLogging.state", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_manager;
  return v2;
}

uint64_t __49__SBFRemoteBasebandLoggingManager_sharedInstance__block_invoke()
{
  sharedInstance_manager = objc_alloc_init(SBFRemoteBasebandLoggingManager);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)isLogCollectionEnabled
{
  return [(CellularLogging *)self->_cellularLogging isLoggingStarted];
}

- (void)_notifyObservers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBFRemoteBasebandLoggingManager *)self isLogCollectionEnabled];
  v4 = SBLogCellularLogCollection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v16 = v3;
    _os_log_impl(&dword_18B52E000, v4, OS_LOG_TYPE_DEFAULT, "Remote Baseband Log Collection Status changed to %{BOOL}d, notifying observers", buf, 8u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(SBFRemoteBasebandLoggingManager *)self observers];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) remoteBasebandLogCollectionStateDidChange:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFRemoteBasebandLoggingManager *)self observers];
  [v5 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFRemoteBasebandLoggingManager *)self observers];
  [v5 removeObject:v4];
}

- (CellularLogging)cellularLogging
{
  return self->_cellularLogging;
}

- (void)setCellularLogging:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cellularLogging, 0);
}

@end