@interface MTCoalescableWorkController
+ (id)_uniqueGenericIdentifier;
+ (id)controllerWithQosClass:(unsigned int)a3 identifier:(id)a4;
- (BOOL)verboseDebugLoggingEnabled;
- (MTCoalescableWorkController)initWithWorkQueue:(id)a3 identifier:(id)a4;
- (MTCoalescableWorkManifest)activeWorkManifest;
- (MTCoalescableWorkManifest)pendingWorkManifest;
- (NSString)identifier;
- (OS_dispatch_queue)workQueue;
- (id)description;
- (unsigned)qosClass;
- (void)_onWorkQueuePerformActiveWorkBlock;
- (void)_syncScheduleStartActiveWork:(id)a3 completion:(id)a4;
- (void)_syncScheduleUpdatePendingWork:(id)a3 completion:(id)a4;
- (void)schedule:(id)a3;
- (void)schedule:(id)a3 completion:(id)a4;
- (void)setActiveWorkManifest:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPendingWorkManifest:(id)a3;
- (void)setQosClass:(unsigned int)a3;
- (void)setVerboseDebugLoggingEnabled:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MTCoalescableWorkController

+ (id)controllerWithQosClass:(unsigned int)a3 identifier:(id)a4
{
  id v6 = a4;
  if (![v6 length])
  {
    uint64_t v7 = [a1 _uniqueGenericIdentifier];

    id v6 = (id)v7;
  }
  id v8 = v6;
  v9 = (const char *)[v8 UTF8String];
  v10 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, 0);
  dispatch_queue_t v11 = dispatch_queue_create(v9, v10);

  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWorkQueue:v11 identifier:v8];
  return v12;
}

- (MTCoalescableWorkController)initWithWorkQueue:(id)a3 identifier:(id)a4
{
  dispatch_queue_t v6 = (dispatch_queue_t)a3;
  id v7 = a4;
  if ([v7 length])
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = [(id)objc_opt_class() _uniqueGenericIdentifier];

    id v7 = (id)v11;
    if (v6) {
      goto LABEL_3;
    }
  }
  v12 = (const char *)[v7 UTF8String];
  v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v6 = dispatch_queue_create(v12, v13);

LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)MTCoalescableWorkController;
  id v8 = [(MTCoalescableWorkController *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, v7);
    objc_storeStrong((id *)&v9->_workQueue, v6);
  }

  return v9;
}

uint64_t __71__MTCoalescableWorkController__syncScheduleStartActiveWork_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWorkQueuePerformActiveWorkBlock];
}

- (void)_onWorkQueuePerformActiveWorkBlock
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MTCoalescableWorkController *)v2 activeWorkManifest];
  objc_sync_exit(v2);

  if (v3)
  {
    v4 = (void *)MEMORY[0x1AD11A870]();
    if ([(MTCoalescableWorkController *)v2 verboseDebugLoggingEnabled])
    {
      v5 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v2;
        _os_log_impl(&dword_1AC9D5000, v5, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] performing work. [ctl=%@]", buf, 0xCu);
      }
    }
    dispatch_queue_t v6 = [v3 workBlock];
    v6[2]();

    if ([(MTCoalescableWorkController *)v2 verboseDebugLoggingEnabled])
    {
      id v7 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v2;
        _os_log_impl(&dword_1AC9D5000, v7, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] firing completions. [ctl=%@]", buf, 0xCu);
      }
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = [v3 completions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v11++) + 16))();
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v9);
    }

    v12 = v2;
    objc_sync_enter(v12);
    v13 = [(MTCoalescableWorkController *)v12 pendingWorkManifest];
    [(MTCoalescableWorkController *)v12 setActiveWorkManifest:v13];

    [(MTCoalescableWorkController *)v12 setPendingWorkManifest:0];
    objc_super v14 = [(MTCoalescableWorkController *)v12 activeWorkManifest];

    if ([(MTCoalescableWorkController *)v12 verboseDebugLoggingEnabled])
    {
      v15 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [(MTCoalescableWorkController *)v12 activeWorkManifest];
        *(_DWORD *)buf = 138412546;
        v24 = v16;
        __int16 v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_1AC9D5000, v15, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] clearing active manifest, newActive = %@. [ctl=%@]", buf, 0x16u);
      }
    }
    objc_sync_exit(v12);

    if (v14)
    {
      v17 = [(MTCoalescableWorkController *)v12 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__MTCoalescableWorkController__onWorkQueuePerformActiveWorkBlock__block_invoke;
      block[3] = &unk_1E5E611F0;
      block[4] = v12;
      dispatch_async(v17, block);
    }
  }
}

- (void)schedule:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    id v7 = self;
    objc_sync_enter(v7);
    id v8 = [(MTCoalescableWorkController *)v7 activeWorkManifest];

    if (v8) {
      [(MTCoalescableWorkController *)v7 _syncScheduleUpdatePendingWork:v9 completion:v6];
    }
    else {
      [(MTCoalescableWorkController *)v7 _syncScheduleStartActiveWork:v9 completion:v6];
    }
    objc_sync_exit(v7);
  }
}

- (MTCoalescableWorkManifest)activeWorkManifest
{
  return self->_activeWorkManifest;
}

- (void)_syncScheduleStartActiveWork:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if ([(MTCoalescableWorkController *)self verboseDebugLoggingEnabled])
  {
    id v8 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_1AC9D5000, v8, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] schedule; setting active manifest; will run block. [ctl=%@]",
        buf,
        0xCu);
    }
  }
  id v9 = [[MTCoalescableWorkManifest alloc] initWithWorkBlock:v7 completion:v6];

  [(MTCoalescableWorkController *)self setActiveWorkManifest:v9];
  uint64_t v10 = [(MTCoalescableWorkController *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MTCoalescableWorkController__syncScheduleStartActiveWork_completion___block_invoke;
  block[3] = &unk_1E5E611F0;
  block[4] = self;
  dispatch_async(v10, block);
}

- (BOOL)verboseDebugLoggingEnabled
{
  return self->_verboseDebugLoggingEnabled;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setActiveWorkManifest:(id)a3
{
}

- (void)setPendingWorkManifest:(id)a3
{
}

- (void)schedule:(id)a3
{
}

- (MTCoalescableWorkManifest)pendingWorkManifest
{
  return self->_pendingWorkManifest;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = NSString;
  v10.receiver = v2;
  v10.super_class = (Class)MTCoalescableWorkController;
  v4 = [(MTCoalescableWorkController *)&v10 description];
  v5 = [(MTCoalescableWorkController *)v2 identifier];
  id v6 = [(MTCoalescableWorkController *)v2 activeWorkManifest];
  id v7 = [(MTCoalescableWorkController *)v2 pendingWorkManifest];
  id v8 = [v3 stringWithFormat:@"%@: id = %@, active = %@, pending = %@", v4, v5, v6, v7];

  objc_sync_exit(v2);
  return v8;
}

+ (id)_uniqueGenericIdentifier
{
  v2 = NSString;
  v3 = NSStringFromClass((Class)a1);
  v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [v4 UUIDString];
  id v6 = [v2 stringWithFormat:@"%@.%@", v3, v5];

  return v6;
}

- (void)_syncScheduleUpdatePendingWork:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTCoalescableWorkController *)self pendingWorkManifest];
  BOOL v9 = [(MTCoalescableWorkController *)self verboseDebugLoggingEnabled];
  if (v8)
  {
    if (v9)
    {
      objc_super v10 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        v17 = self;
        _os_log_impl(&dword_1AC9D5000, v10, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] schedule; replacing pending manifest. [ctl=%@]",
          (uint8_t *)&v16,
          0xCu);
      }
    }
    uint64_t v11 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(MTCoalescableWorkController *)self identifier];
      int v16 = 138412290;
      v17 = v12;
      _os_log_impl(&dword_1AC9D5000, v11, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWorkController] %@ dropped and replaced work-block with newer item", (uint8_t *)&v16, 0xCu);
    }
    v13 = [v8 manifestByReplacingWorkBlock:v7 appendingCompletion:v6];
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        v17 = self;
        _os_log_impl(&dword_1AC9D5000, v14, OS_LOG_TYPE_DEFAULT, "[MTCoalescableWork] schedule; creating pending manifest. [ctl=%@]",
          (uint8_t *)&v16,
          0xCu);
      }
    }
    v13 = [[MTCoalescableWorkManifest alloc] initWithWorkBlock:v7 completion:v6];
  }
  v15 = v13;

  [(MTCoalescableWorkController *)self setPendingWorkManifest:v15];
}

uint64_t __65__MTCoalescableWorkController__onWorkQueuePerformActiveWorkBlock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWorkQueuePerformActiveWorkBlock];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setVerboseDebugLoggingEnabled:(BOOL)a3
{
  self->_verboseDebugLoggingEnabled = a3;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (void)setQosClass:(unsigned int)a3
{
  self->_qosClass = a3;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWorkManifest, 0);
  objc_storeStrong((id *)&self->_activeWorkManifest, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end