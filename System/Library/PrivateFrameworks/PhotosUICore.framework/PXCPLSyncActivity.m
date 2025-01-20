@interface PXCPLSyncActivity
+ (PXCPLSyncActivity)sharedInstance;
- (BOOL)isSyncing;
- (PXCPLSyncActivity)init;
- (id)_init;
- (id)description;
- (void)_queue_subscribeToSyncProgress;
- (void)_setSyncProgress:(id)a3;
- (void)_setSyncProgressState:(unint64_t)a3;
- (void)_unsubscribeFromSyncProgress;
- (void)_updateIsSyncing;
- (void)_updateSyncProgressState;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setIsSyncing:(BOOL)a3;
@end

@implementation PXCPLSyncActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncProgress, 0);
  objc_storeStrong(&self->_syncProgressSubscriber, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (BOOL)isSyncing
{
  return self->_isSyncing;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_CPLSyncProgressStateObservationContext == a6)
  {
    [(PXCPLSyncActivity *)self _updateSyncProgressState];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXCPLSyncActivity;
    -[PXCPLSyncActivity observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_updateSyncProgressState
{
  v3 = [(NSProgress *)self->_syncProgress userInfo];
  v4 = getCPLSyncProgressStateKey();
  id v5 = [v3 objectForKeyedSubscript:v4];

  -[PXCPLSyncActivity _setSyncProgressState:](self, "_setSyncProgressState:", [v5 unsignedIntegerValue]);
}

- (void)_updateIsSyncing
{
  if (self->_syncProgress) {
    BOOL v2 = self->_syncProgressState - 1 < 3;
  }
  else {
    BOOL v2 = 0;
  }
  [(PXCPLSyncActivity *)self setIsSyncing:v2];
}

- (void)_unsubscribeFromSyncProgress
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = PLUserStatusGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    v10 = self;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Unsubscribe from sync progress", (uint8_t *)&v9, 0xCu);
  }

  if (self->_syncProgressSubscriber)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v5 = v4;
    [MEMORY[0x1E4F28F90] _removeSubscriber:self->_syncProgressSubscriber];
    objc_super v6 = PLUserStatusGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      int v9 = 138543618;
      v10 = self;
      __int16 v11 = 2048;
      double v12 = v7 - v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Unsubscribed in: %f s", (uint8_t *)&v9, 0x16u);
    }

    id syncProgressSubscriber = self->_syncProgressSubscriber;
    self->_id syncProgressSubscriber = 0;
  }
}

- (void)_queue_subscribeToSyncProgress
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_syncProgressSubscriber)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXCPLSyncActivity.m", 145, @"Invalid parameter not satisfying: %@", @"!_syncProgressSubscriber" object file lineNumber description];
  }
  double v4 = PLUserStatusGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Subscribe to sync progress", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXCPLSyncActivity__queue_subscribeToSyncProgress__block_invoke;
  aBlock[3] = &unk_1E5DBA9F0;
  objc_copyWeak(&v21, &location);
  double v5 = _Block_copy(aBlock);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v7 = v6;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  v8 = (id *)getCPLLibraryIdentifierSystemLibrarySymbolLoc_ptr;
  uint64_t v26 = getCPLLibraryIdentifierSystemLibrarySymbolLoc_ptr;
  if (!getCPLLibraryIdentifierSystemLibrarySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCPLLibraryIdentifierSystemLibrarySymbolLoc_block_invoke;
    v28 = &unk_1E5DD2B08;
    v29 = &v23;
    int v9 = CloudPhotoLibraryLibrary();
    v10 = dlsym(v9, "CPLLibraryIdentifierSystemLibrary");
    *(void *)(v29[1] + 24) = v10;
    getCPLLibraryIdentifierSystemLibrarySymbolLoc_ptr = *(void *)(v29[1] + 24);
    v8 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v8)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [NSString stringWithUTF8String:"NSString *getCPLLibraryIdentifierSystemLibrary(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"PXCPLSyncActivity.m", 23, @"%s", dlerror());

    __break(1u);
  }
  id v11 = *v8;
  double v12 = [@"com.apple.cpl." stringByAppendingString:v11];

  uint64_t v13 = [MEMORY[0x1E4F28F90] _addSubscriberForCategory:v12 usingPublishingHandler:v5];
  id syncProgressSubscriber = self->_syncProgressSubscriber;
  self->_id syncProgressSubscriber = v13;

  v15 = PLUserStatusGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v16 - v7;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Subscribed in: %f s", buf, 0x16u);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

id __51__PXCPLSyncActivity__queue_subscribeToSyncProgress__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = PLUserStatusGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138543362;
    id v14 = WeakRetained;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ Sync progress provided", buf, 0xCu);
  }
  double v6 = (id *)(a1 + 32);
  id v7 = objc_loadWeakRetained(v6);
  [v7 _setSyncProgress:v3];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXCPLSyncActivity__queue_subscribeToSyncProgress__block_invoke_25;
  aBlock[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v12, v6);
  v8 = _Block_copy(aBlock);
  int v9 = _Block_copy(v8);

  objc_destroyWeak(&v12);
  return v9;
}

void __51__PXCPLSyncActivity__queue_subscribeToSyncProgress__block_invoke_25(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v2 = PLUserStatusGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138543362;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ Sync progress cleared", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 _setSyncProgress:0];
}

- (void)_setSyncProgressState:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_syncProgressState != a3)
  {
    self->_unint64_t syncProgressState = a3;
    id v4 = PLUserStatusGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      unint64_t syncProgressState = self->_syncProgressState;
      if (syncProgressState > 4) {
        id v6 = 0;
      }
      else {
        id v6 = off_1E5DBAA28[syncProgressState];
      }
      int v7 = 138543618;
      v8 = self;
      __int16 v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ Sync progress state changed:\"%@\"", (uint8_t *)&v7, 0x16u);
    }

    [(PXCPLSyncActivity *)self _updateIsSyncing];
  }
}

- (void)_setSyncProgress:(id)a3
{
  id v11 = a3;
  int v5 = NSString;
  id v6 = NSStringFromSelector(sel_userInfo);
  int v7 = getCPLSyncProgressStateKey();
  v8 = [v5 stringWithFormat:@"%@.%@", v6, v7];

  p_syncProgress = &self->_syncProgress;
  syncProgress = self->_syncProgress;
  if (syncProgress) {
    [(NSProgress *)syncProgress removeObserver:self forKeyPath:v8 context:_CPLSyncProgressStateObservationContext];
  }
  objc_storeStrong((id *)&self->_syncProgress, a3);
  if (*p_syncProgress) {
    [(NSProgress *)*p_syncProgress addObserver:self forKeyPath:v8 options:4 context:_CPLSyncProgressStateObservationContext];
  }
  else {
    [(PXCPLSyncActivity *)self _updateIsSyncing];
  }
}

- (void)setIsSyncing:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_isSyncing != v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34__PXCPLSyncActivity_setIsSyncing___block_invoke;
    v5[3] = &unk_1E5DCEB78;
    v5[4] = self;
    BOOL v6 = v3;
    [(PXCPLSyncActivity *)self performChanges:v5];
  }
}

uint64_t __34__PXCPLSyncActivity_setIsSyncing___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 128) = *(unsigned char *)(a1 + 40);
  BOOL v2 = PLUserStatusGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Syncing state changed", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) signalChange:1];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p, syncing:%d>", objc_opt_class(), self, self->_isSyncing];
}

- (void)dealloc
{
  [(PXCPLSyncActivity *)self _unsubscribeFromSyncProgress];
  v3.receiver = self;
  v3.super_class = (Class)PXCPLSyncActivity;
  [(PXCPLSyncActivity *)&v3 dealloc];
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)PXCPLSyncActivity;
  BOOL v2 = [(PXCPLSyncActivity *)&v12 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.photos.pxcplsyncactivity", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v2);
    uint64_t v6 = v2->_serialQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __26__PXCPLSyncActivity__init__block_invoke;
    v9[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v10, &location);
    dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_UTILITY, 0, v9);
    dispatch_async(v6, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__PXCPLSyncActivity__init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_subscribeToSyncProgress");
}

- (PXCPLSyncActivity)init
{
  dispatch_queue_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCPLSyncActivity.m", 74, @"%s is not available as initializer", "-[PXCPLSyncActivity init]");

  abort();
}

+ (PXCPLSyncActivity)sharedInstance
{
  if (sharedInstance_predicate != -1) {
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_109859);
  }
  BOOL v2 = (void *)sharedInstance__sharedInstance;
  return (PXCPLSyncActivity *)v2;
}

void __35__PXCPLSyncActivity_sharedInstance__block_invoke()
{
  id v0 = [[PXCPLSyncActivity alloc] _init];
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;
}

@end