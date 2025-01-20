@interface BYDeviceMigrationManager
+ (id)createDeviceTransferTask:(id)a3;
- (BOOL)_hasAssertions;
- (BOOL)isComplete;
- (BOOL)isMigrating;
- (BOOL)requiresProcessAssertion;
- (BOOL)takeAssertions;
- (BOOL)willMigrate;
- (BYDeviceMigrationManager)initWithFileTranferSession:(id)a3;
- (MBDeviceTransferConnectionInfo)connectionInfo;
- (MBDeviceTransferProgress)progressInfo;
- (MBDeviceTransferTask)deviceTransferTask;
- (NSError)error;
- (NSHashTable)delegates;
- (OS_dispatch_queue)migrationQueue;
- (OS_voucher)clientVoucher;
- (RBSAssertion)processAssertion;
- (RPFileTransferSession)fileTransferSession;
- (__MKBAssertion)acquireDeviceLockAssertion;
- (__MKBAssertion)deviceLockAssertion;
- (double)durationOfRestore;
- (double)durationOfTransfer;
- (int)passcodeChangeNotificationToken;
- (int64_t)cancellationCause;
- (unint64_t)bytesTransferred;
- (unint64_t)filesTransferred;
- (void)_reacquireDeviceLockAssertion;
- (void)addDelegate:(id)a3;
- (void)cancelWithCause:(int64_t)a3;
- (void)dealloc;
- (void)releaseAssertions;
- (void)removeDelegate:(id)a3;
- (void)restartDeviceTransferTask:(id)a3;
- (void)setBytesTransferred:(unint64_t)a3;
- (void)setCancellationCause:(int64_t)a3;
- (void)setClientVoucher:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setConnectionInfo:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setDeviceLockAssertion:(__MKBAssertion *)a3;
- (void)setDeviceTransferTask:(id)a3;
- (void)setDurationOfRestore:(double)a3;
- (void)setDurationOfTransfer:(double)a3;
- (void)setError:(id)a3;
- (void)setFileTransferSession:(id)a3;
- (void)setFilesTransferred:(unint64_t)a3;
- (void)setMigrating:(BOOL)a3;
- (void)setMigrationQueue:(id)a3;
- (void)setPasscodeChangeNotificationToken:(int)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setProgressInfo:(id)a3;
- (void)setWillMigrate:(BOOL)a3;
- (void)start;
- (void)takeAssertions;
@end

@implementation BYDeviceMigrationManager

- (BYDeviceMigrationManager)initWithFileTranferSession:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BYDeviceMigrationManager;
  v6 = [(BYDeviceMigrationManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileTransferSession, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("Device Migration Queue", 0);
    migrationQueue = v7->_migrationQueue;
    v7->_migrationQueue = (OS_dispatch_queue *)v10;

    *(_OWORD *)&v7->_bytesTransferred = 0u;
    *(_OWORD *)&v7->_durationOfTransfer = 0u;
  }

  return v7;
}

- (void)dealloc
{
  if ([(BYDeviceMigrationManager *)self deviceLockAssertion]) {
    CFRelease([(BYDeviceMigrationManager *)self deviceLockAssertion]);
  }
  v3.receiver = self;
  v3.super_class = (Class)BYDeviceMigrationManager;
  [(BYDeviceMigrationManager *)&v3 dealloc];
}

- (void)start
{
  objc_super v3 = [(BYDeviceMigrationManager *)self migrationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__BYDeviceMigrationManager_start__block_invoke;
  block[3] = &unk_1E5D2BA60;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __33__BYDeviceMigrationManager_start__block_invoke(uint64_t a1)
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Preparing for device to device migration...", (uint8_t *)buf, 2u);
  }

  [*(id *)(a1 + 32) takeAssertions];
  objc_super v3 = objc_opt_class();
  v4 = [*(id *)(a1 + 32) fileTransferSession];
  id v5 = [v3 createDeviceTransferTask:v4];
  [*(id *)(a1 + 32) setDeviceTransferTask:v5];

  v6 = [*(id *)(a1 + 32) migrationQueue];
  v7 = [*(id *)(a1 + 32) deviceTransferTask];
  [v7 setQueue:v6];

  objc_initWeak(buf, *(id *)(a1 + 32));
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __33__BYDeviceMigrationManager_start__block_invoke_4;
  v17[3] = &unk_1E5D2C848;
  objc_copyWeak(&v18, buf);
  uint64_t v8 = [*(id *)(a1 + 32) deviceTransferTask];
  [v8 setConnectionInfoHandler:v17];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __33__BYDeviceMigrationManager_start__block_invoke_6;
  v15[3] = &unk_1E5D2C870;
  objc_copyWeak(&v16, buf);
  v9 = [*(id *)(a1 + 32) deviceTransferTask];
  [v9 setProgressHandler:v15];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __33__BYDeviceMigrationManager_start__block_invoke_2;
  v13[3] = &unk_1E5D2C898;
  objc_copyWeak(&v14, buf);
  dispatch_queue_t v10 = [*(id *)(a1 + 32) deviceTransferTask];
  [v10 setCompletionHandler:v13];

  v11 = _BYLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1A7DED000, v11, OS_LOG_TYPE_DEFAULT, "Starting device to device migration...", v12, 2u);
  }

  [*(id *)(a1 + 32) setMigrating:1];
  [*(id *)(a1 + 32) setComplete:0];
  [*(id *)(a1 + 32) startDeviceTransferTask];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);
}

void __33__BYDeviceMigrationManager_start__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v18 = [v3 connectionState];
    __int16 v19 = 2048;
    uint64_t v20 = [v3 connectionType];
    _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Migration connection information updated (state: %ld, type: %ld)", buf, 0x16u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = objc_msgSend(WeakRetained, "delegates", 0);
  v7 = [v6 allObjects];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) deviceMigrationManager:WeakRetained didChangeConnectionInformation:v3];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [WeakRetained setConnectionInfo:v3];
}

void __33__BYDeviceMigrationManager_start__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = objc_msgSend(WeakRetained, "delegates", 0);
  v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v10++) deviceMigrationManager:WeakRetained didUpdateProgress:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  [WeakRetained setProgressInfo:v3];
  [v3 progress];
  if (v11 > 0.0)
  {
    objc_msgSend(WeakRetained, "setBytesTransferred:", objc_msgSend(v3, "bytesTransferred"));
    objc_msgSend(WeakRetained, "setFilesTransferred:", objc_msgSend(v3, "filesTransferred"));
    uint64_t v12 = [v3 fileTransferStartDate];
    if (v12)
    {
      long long v13 = (void *)v12;
      long long v14 = [v3 restoreStartDate];

      if (v14)
      {
        long long v15 = [v3 restoreStartDate];
        id v16 = [v3 fileTransferStartDate];
        [v15 timeIntervalSinceDate:v16];
        objc_msgSend(WeakRetained, "setDurationOfTransfer:");

        v17 = [v3 restoreStartDate];
        [v17 timeIntervalSinceNow];
        [WeakRetained setDurationOfRestore:-v18];
      }
    }
  }
}

void __33__BYDeviceMigrationManager_start__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setError:v3];
  id v5 = _BYLoggingFacility();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __33__BYDeviceMigrationManager_start__block_invoke_2_cold_1((uint64_t)v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Migration completed successfully!", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = objc_msgSend(WeakRetained, "delegates", 0);
  uint64_t v8 = [v7 allObjects];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) deviceMigrationManager:WeakRetained didCompleteWithError:v3];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }

  [WeakRetained didCompleteWithError:v3];
  [WeakRetained releaseAssertions];
  [WeakRetained setMigrating:0];
  [WeakRetained setComplete:1];
}

- (void)cancelWithCause:(int64_t)a3
{
  id v5 = [(BYDeviceMigrationManager *)self migrationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__BYDeviceMigrationManager_cancelWithCause___block_invoke;
  v6[3] = &unk_1E5D2C8C0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

uint64_t __44__BYDeviceMigrationManager_cancelWithCause___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setWillMigrate:0];
  uint64_t result = [*(id *)(a1 + 32) isMigrating];
  if (result)
  {
    id v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling device to device migration with cancellation cause: %ld...", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) releaseAssertions];
    [*(id *)(a1 + 32) cancelDeviceTransferTask];
    [*(id *)(a1 + 32) setMigrating:0];
    [*(id *)(a1 + 32) setCancellationCause:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setError:0];
    return [*(id *)(a1 + 32) didCancel];
  }
  return result;
}

- (void)restartDeviceTransferTask:(id)a3
{
  id v4 = a3;
  int v5 = [(BYDeviceMigrationManager *)self migrationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke;
  v7[3] = &unk_1E5D2C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke(uint64_t a1)
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Restarting transfer task...", (uint8_t *)buf, 2u);
  }

  [*(id *)(a1 + 32) setFileTransferSession:*(void *)(a1 + 40)];
  objc_initWeak(buf, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke_10;
  v4[3] = &unk_1E5D2C898;
  objc_copyWeak(&v5, buf);
  id v3 = [*(id *)(a1 + 32) deviceTransferTask];
  [v3 setCompletionHandler:v4];

  [*(id *)(a1 + 32) cancelDeviceTransferTask];
  [*(id *)(a1 + 32) startDeviceTransferTask];
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:@"MBErrorDomain"])
    {
      uint64_t v6 = [v3 code];

      if (v6 == 202) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke_10_cold_1((uint64_t)v3, v7);
    }
  }
LABEL_9:
  [WeakRetained setDeviceTransferTask:0];
  [WeakRetained start];
}

- (BOOL)willMigrate
{
  return self->_willMigrate || [(BYDeviceMigrationManager *)self isMigrating];
}

+ (id)createDeviceTransferTask:(id)a3
{
  return 0;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(BYDeviceMigrationManager *)self migrationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__BYDeviceMigrationManager_addDelegate___block_invoke;
  v7[3] = &unk_1E5D2C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__BYDeviceMigrationManager_addDelegate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegates];
  [v2 addObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) connectionInfo];

  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    id v6 = [v5 connectionInfo];
    [v4 deviceMigrationManager:v5 didChangeConnectionInformation:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 32) progressInfo];

  if (v7)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    uint64_t v10 = [v9 progressInfo];
    [v8 deviceMigrationManager:v9 didUpdateProgress:v10];
  }
  if ([*(id *)(a1 + 32) isComplete])
  {
    uint64_t v13 = a1 + 32;
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void **)(v13 + 8);
    id v14 = [v11 error];
    [v12 deviceMigrationManager:v11 didCompleteWithError:v14];
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(BYDeviceMigrationManager *)self migrationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__BYDeviceMigrationManager_removeDelegate___block_invoke;
  v7[3] = &unk_1E5D2C5A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__BYDeviceMigrationManager_removeDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegates];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (BOOL)_hasAssertions
{
  id v3 = [(BYDeviceMigrationManager *)self processAssertion];
  if (v3) {
    BOOL v4 = [(BYDeviceMigrationManager *)self deviceLockAssertion] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)requiresProcessAssertion
{
  return 1;
}

- (BOOL)takeAssertions
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(BYDeviceMigrationManager *)self migrationQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)voucher_copy();
  [(BYDeviceMigrationManager *)self setClientVoucher:v4];

  if (![(BYDeviceMigrationManager *)self requiresProcessAssertion])
  {
LABEL_6:
    [(BYDeviceMigrationManager *)self setDeviceLockAssertion:[(BYDeviceMigrationManager *)self acquireDeviceLockAssertion]];
    long long v16 = (const char *)[(id)*MEMORY[0x1E4F741D8] cStringUsingEncoding:4];
    v17 = [(BYDeviceMigrationManager *)self migrationQueue];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__BYDeviceMigrationManager_takeAssertions__block_invoke;
    handler[3] = &unk_1E5D2C8E8;
    handler[4] = self;
    uint32_t v18 = notify_register_dispatch(v16, &self->_passcodeChangeNotificationToken, v17, handler);

    if (v18)
    {
      uint64_t v19 = _BYLoggingFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        [(BYDeviceMigrationManager *)v18 takeAssertions];
      }

      [(BYDeviceMigrationManager *)self setPasscodeChangeNotificationToken:0xFFFFFFFFLL];
    }
    return 1;
  }
  id v5 = [(BYDeviceMigrationManager *)self processAssertion];
  [v5 invalidate];

  id v6 = objc_alloc(MEMORY[0x1E4F96318]);
  uint64_t v7 = [MEMORY[0x1E4F96478] targetWithPid:getpid()];
  id v8 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.purplebuddy" name:@"Update"];
  v28[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  uint64_t v10 = (void *)[v6 initWithExplanation:@"Device-to-Device Migration" target:v7 attributes:v9];
  [(BYDeviceMigrationManager *)self setProcessAssertion:v10];

  uint64_t v11 = [(BYDeviceMigrationManager *)self processAssertion];
  id v25 = 0;
  uint64_t v12 = [v11 acquireWithError:&v25];
  id v13 = v25;

  id v14 = _BYLoggingFacility();
  long long v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v15, OS_LOG_TYPE_DEFAULT, "Process lock assertion successfully taken during migration", buf, 2u);
    }

    goto LABEL_6;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v21 = 0;
      long long v22 = v13;
    }
    else if (v13)
    {
      v23 = NSString;
      uint64_t v12 = [v13 domain];
      long long v22 = [v23 stringWithFormat:@"<Error domain: %@, code %ld>", v12, objc_msgSend(v13, "code")];
      int v21 = 1;
    }
    else
    {
      int v21 = 0;
      long long v22 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v27 = v22;
    _os_log_error_impl(&dword_1A7DED000, v15, OS_LOG_TYPE_ERROR, "Failed to take process assertion during migration: %{public}@", buf, 0xCu);
    if (v21)
    {
    }
  }

  [(BYDeviceMigrationManager *)self releaseAssertions];
  return 0;
}

uint64_t __42__BYDeviceMigrationManager_takeAssertions__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reacquireDeviceLockAssertion];
}

- (__MKBAssertion)acquireDeviceLockAssertion
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"MKBAssertionKey";
  v10[0] = @"RestoreFromBackup";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v3 = (__MKBAssertion *)MKBDeviceLockAssertion();
  BOOL v4 = _BYLoggingFacility();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Device lock assertion successfully taken during migration", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      _BYIsInternalInstall();
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = 0;
      _os_log_error_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_ERROR, "Failed to take device lock assertion during migration - %{public}@", buf, 0xCu);
    }

    CFRelease(0);
  }

  return v3;
}

- (void)releaseAssertions
{
  id v3 = [(BYDeviceMigrationManager *)self migrationQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(BYDeviceMigrationManager *)self processAssertion];

  if (v4)
  {
    id v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Releasing process assertion", buf, 2u);
    }

    id v6 = [(BYDeviceMigrationManager *)self processAssertion];
    [v6 invalidate];

    [(BYDeviceMigrationManager *)self setProcessAssertion:0];
  }
  if ([(BYDeviceMigrationManager *)self deviceLockAssertion])
  {
    uint64_t v7 = _BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Releasing device lock assertion taken during restore", v8, 2u);
    }

    CFRelease([(BYDeviceMigrationManager *)self deviceLockAssertion]);
    [(BYDeviceMigrationManager *)self setDeviceLockAssertion:0];
  }
  if ([(BYDeviceMigrationManager *)self passcodeChangeNotificationToken] != -1)
  {
    notify_cancel([(BYDeviceMigrationManager *)self passcodeChangeNotificationToken]);
    [(BYDeviceMigrationManager *)self setPasscodeChangeNotificationToken:0xFFFFFFFFLL];
  }
  [(BYDeviceMigrationManager *)self setClientVoucher:0];
}

- (void)_reacquireDeviceLockAssertion
{
  if ([(BYDeviceMigrationManager *)self _hasAssertions])
  {
    id v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Requiring device lock assertion as passcode changed...", v4, 2u);
    }

    if ([(BYDeviceMigrationManager *)self deviceLockAssertion]) {
      CFRelease([(BYDeviceMigrationManager *)self deviceLockAssertion]);
    }
    [(BYDeviceMigrationManager *)self setDeviceLockAssertion:[(BYDeviceMigrationManager *)self acquireDeviceLockAssertion]];
  }
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void)setWillMigrate:(BOOL)a3
{
  self->_willMigrate = a3;
}

- (BOOL)isMigrating
{
  return self->_migrating;
}

- (void)setMigrating:(BOOL)a3
{
  self->_migrating = a3;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (RPFileTransferSession)fileTransferSession
{
  return self->_fileTransferSession;
}

- (void)setFileTransferSession:(id)a3
{
}

- (MBDeviceTransferTask)deviceTransferTask
{
  return self->_deviceTransferTask;
}

- (void)setDeviceTransferTask:(id)a3
{
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (__MKBAssertion)deviceLockAssertion
{
  return self->_deviceLockAssertion;
}

- (void)setDeviceLockAssertion:(__MKBAssertion *)a3
{
  self->_deviceLockAssertion = a3;
}

- (int)passcodeChangeNotificationToken
{
  return self->_passcodeChangeNotificationToken;
}

- (void)setPasscodeChangeNotificationToken:(int)a3
{
  self->_passcodeChangeNotificationToken = a3;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (MBDeviceTransferConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (void)setConnectionInfo:(id)a3
{
}

- (MBDeviceTransferProgress)progressInfo
{
  return self->_progressInfo;
}

- (void)setProgressInfo:(id)a3
{
}

- (unint64_t)bytesTransferred
{
  return self->_bytesTransferred;
}

- (void)setBytesTransferred:(unint64_t)a3
{
  self->_bytesTransferred = a3;
}

- (unint64_t)filesTransferred
{
  return self->_filesTransferred;
}

- (void)setFilesTransferred:(unint64_t)a3
{
  self->_filesTransferred = a3;
}

- (double)durationOfTransfer
{
  return self->_durationOfTransfer;
}

- (void)setDurationOfTransfer:(double)a3
{
  self->_durationOfTransfer = a3;
}

- (double)durationOfRestore
{
  return self->_durationOfRestore;
}

- (void)setDurationOfRestore:(double)a3
{
  self->_durationOfRestore = a3;
}

- (int64_t)cancellationCause
{
  return self->_cancellationCause;
}

- (void)setCancellationCause:(int64_t)a3
{
  self->_cancellationCause = a3;
}

- (OS_dispatch_queue)migrationQueue
{
  return self->_migrationQueue;
}

- (void)setMigrationQueue:(id)a3
{
}

- (OS_voucher)clientVoucher
{
  return self->_clientVoucher;
}

- (void)setClientVoucher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVoucher, 0);
  objc_storeStrong((id *)&self->_migrationQueue, 0);
  objc_storeStrong((id *)&self->_progressInfo, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_deviceTransferTask, 0);
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

void __33__BYDeviceMigrationManager_start__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Migration completed with error: %@", (uint8_t *)&v2, 0xCu);
}

void __54__BYDeviceMigrationManager_restartDeviceTransferTask___block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Migration completed with non-cancel error during restart: %@", (uint8_t *)&v2, 0xCu);
}

- (void)takeAssertions
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Failed to register for passcode change notification to refresh device lock assertion: %d", (uint8_t *)v2, 8u);
}

@end