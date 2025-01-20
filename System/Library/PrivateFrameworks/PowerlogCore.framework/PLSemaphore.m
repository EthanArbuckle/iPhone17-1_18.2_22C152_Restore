@interface PLSemaphore
+ (id)sharedSemaphoreForKey:(id)a3;
- (BOOL)isActive;
- (NSCondition)pendingObjectsLock;
- (NSMutableSet)interestedObjects;
- (NSMutableSet)pendingDoneObjects;
- (NSString)key;
- (PLSemaphore)initWithKey:(id)a3;
- (double)timeout;
- (void)setInterestedObjects:(id)a3;
- (void)setKey:(id)a3;
- (void)setPendingDoneObjects:(id)a3;
- (void)setPendingObjectsLock:(id)a3;
- (void)setTimeout:(double)a3;
- (void)signalDoneByObject:(id)a3;
- (void)signalInterestByObject:(id)a3;
- (void)signalNonInterestByObject:(id)a3;
- (void)signalStartListening;
- (void)waitWithBlock:(id)a3;
- (void)waitWithBlockSync:(id)a3;
@end

@implementation PLSemaphore

+ (id)sharedSemaphoreForKey:(id)a3
{
  id v3 = a3;
  if (sharedSemaphoreForKey__onceToken != -1) {
    dispatch_once(&sharedSemaphoreForKey__onceToken, &__block_literal_global_10);
  }
  id v4 = (id)sharedSemaphoreForKey___sharedSemaphores;
  objc_sync_enter(v4);
  v5 = [(id)sharedSemaphoreForKey___sharedSemaphores objectForKeyedSubscript:v3];

  if (!v5)
  {
    v6 = [[PLSemaphore alloc] initWithKey:v3];
    [(id)sharedSemaphoreForKey___sharedSemaphores setObject:v6 forKeyedSubscript:v3];
  }
  v7 = [(id)sharedSemaphoreForKey___sharedSemaphores objectForKeyedSubscript:v3];
  objc_sync_exit(v4);

  return v7;
}

uint64_t __37__PLSemaphore_sharedSemaphoreForKey___block_invoke()
{
  sharedSemaphoreForKey___sharedSemaphores = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (PLSemaphore)initWithKey:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLSemaphore;
  v6 = [(PLSemaphore *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_key, a3);
    v7->_timeout = 3.0;
    uint64_t v8 = objc_opt_new();
    interestedObjects = v7->_interestedObjects;
    v7->_interestedObjects = (NSMutableSet *)v8;

    uint64_t v10 = objc_opt_new();
    pendingDoneObjects = v7->_pendingDoneObjects;
    v7->_pendingDoneObjects = (NSMutableSet *)v10;

    v12 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
    pendingObjectsLock = v7->_pendingObjectsLock;
    v7->_pendingObjectsLock = v12;
  }
  return v7;
}

- (BOOL)isActive
{
  [(NSCondition *)self->_pendingObjectsLock lock];
  id v3 = [(PLSemaphore *)self pendingDoneObjects];
  BOOL v4 = [v3 count] != 0;

  [(NSCondition *)self->_pendingObjectsLock unlock];
  return v4;
}

- (void)signalInterestByObject:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(PLSemaphore *)self interestedObjects];
  objc_sync_enter(v4);
  id v5 = [(PLSemaphore *)self interestedObjects];
  [v5 addObject:v7];

  objc_sync_exit(v4);
  [(NSCondition *)self->_pendingObjectsLock lock];
  v6 = [(PLSemaphore *)self pendingDoneObjects];
  [v6 addObject:v7];

  [(NSCondition *)self->_pendingObjectsLock unlock];
}

- (void)signalNonInterestByObject:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(PLSemaphore *)self interestedObjects];
  objc_sync_enter(v4);
  id v5 = [(PLSemaphore *)self interestedObjects];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)signalDoneByObject:(id)a3
{
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__PLSemaphore_signalDoneByObject___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (signalDoneByObject__defaultOnce != -1) {
      dispatch_once(&signalDoneByObject__defaultOnce, block);
    }
    if (signalDoneByObject__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"done signaled by %@", v4];
      id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m"];
      uint64_t v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLSemaphore signalDoneByObject:]"];
      +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:80];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  [(NSCondition *)self->_pendingObjectsLock lock];
  v11 = [(PLSemaphore *)self pendingDoneObjects];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __34__PLSemaphore_signalDoneByObject___block_invoke_26;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v13;
      if (signalDoneByObject__defaultOnce_24 != -1) {
        dispatch_once(&signalDoneByObject__defaultOnce_24, v35);
      }
      if (signalDoneByObject__classDebugEnabled_25)
      {
        v14 = [NSString stringWithFormat:@"removed %@ from pendingDoneObjects", v4];
        objc_super v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m"];
        v16 = [v15 lastPathComponent];
        v17 = [NSString stringWithUTF8String:"-[PLSemaphore signalDoneByObject:]"];
        +[PLCoreStorage logMessage:v14 fromFile:v16 fromFunction:v17 fromLineNumber:83];

        v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    v19 = [(PLSemaphore *)self pendingDoneObjects];
    [v19 removeObject:v4];

    v20 = [(PLSemaphore *)self pendingDoneObjects];
    uint64_t v21 = [v20 count];

    if (!v21)
    {
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v22 = objc_opt_class();
        uint64_t v30 = MEMORY[0x1E4F143A8];
        uint64_t v31 = 3221225472;
        v32 = __34__PLSemaphore_signalDoneByObject___block_invoke_32;
        v33 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v34 = v22;
        if (signalDoneByObject__defaultOnce_30 != -1) {
          dispatch_once(&signalDoneByObject__defaultOnce_30, &v30);
        }
        if (signalDoneByObject__classDebugEnabled_31)
        {
          v23 = NSString;
          v24 = [(PLSemaphore *)self key];
          v25 = [v23 stringWithFormat:@"PLSemaphore %@ signalDone!", v24, v30, v31, v32, v33, v34];

          v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m"];
          v27 = [v26 lastPathComponent];
          v28 = [NSString stringWithUTF8String:"-[PLSemaphore signalDoneByObject:]"];
          +[PLCoreStorage logMessage:v25 fromFile:v27 fromFunction:v28 fromLineNumber:87];

          v29 = PLLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
          }
        }
      }
      [(NSCondition *)self->_pendingObjectsLock signal];
    }
  }
  [(NSCondition *)self->_pendingObjectsLock unlock];
}

BOOL __34__PLSemaphore_signalDoneByObject___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  signalDoneByObject__classDebugEnabled = result;
  return result;
}

BOOL __34__PLSemaphore_signalDoneByObject___block_invoke_26(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  signalDoneByObject__classDebugEnabled_25 = result;
  return result;
}

BOOL __34__PLSemaphore_signalDoneByObject___block_invoke_32(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  signalDoneByObject__classDebugEnabled_31 = result;
  return result;
}

- (void)signalStartListening
{
  [(NSCondition *)self->_pendingObjectsLock lock];
  id v3 = [(PLSemaphore *)self pendingDoneObjects];
  id v4 = [(PLSemaphore *)self interestedObjects];
  [v3 unionSet:v4];

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    objc_super v15 = __35__PLSemaphore_signalStartListening__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v17 = v5;
    if (signalStartListening_defaultOnce != -1) {
      dispatch_once(&signalStartListening_defaultOnce, &block);
    }
    if (signalStartListening_classDebugEnabled)
    {
      id v6 = NSString;
      id v7 = [(PLSemaphore *)self pendingDoneObjects];
      uint64_t v8 = [v6 stringWithFormat:@"Start Listening for %@", v7, block, v14, v15, v16, v17];

      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m"];
      uint64_t v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLSemaphore signalStartListening]"];
      +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:97];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  [(NSCondition *)self->_pendingObjectsLock unlock];
}

BOOL __35__PLSemaphore_signalStartListening__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  signalStartListening_classDebugEnabled = result;
  return result;
}

- (void)waitWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PLSemaphore_waitWithBlock___block_invoke;
  v7[3] = &unk_1E6253C90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __29__PLSemaphore_waitWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitWithBlockSync:*(void *)(a1 + 40)];
}

- (void)waitWithBlockSync:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  [(NSCondition *)self->_pendingObjectsLock lock];
  uint64_t v5 = [(PLSemaphore *)self pendingDoneObjects];
  uint64_t v6 = [v5 count];

  id v7 = &off_1BBE12000;
  if (v6)
  {
    v29 = v4;
    do
    {
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v8 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __33__PLSemaphore_waitWithBlockSync___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v8;
        if (waitWithBlockSync__defaultOnce != -1) {
          dispatch_once(&waitWithBlockSync__defaultOnce, block);
        }
        if (waitWithBlockSync__classDebugEnabled)
        {
          v9 = [NSString stringWithFormat:@"waiting for signal to be done"];
          uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m"];
          v11 = [v10 lastPathComponent];
          uint64_t v12 = [NSString stringWithUTF8String:"-[PLSemaphore waitWithBlockSync:]"];
          +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:111];

          uint64_t v13 = PLLogCommon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v9;
            _os_log_debug_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9C8];
      [(PLSemaphore *)self timeout];
      objc_super v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceNow:");
      BOOL v16 = [(NSCondition *)self->_pendingObjectsLock waitUntilDate:v15];

      uint64_t v17 = [(PLSemaphore *)self pendingDoneObjects];
      uint64_t v18 = [v17 count];
    }
    while (v18 && v16);
    BOOL v19 = !v16;
    id v4 = v29;
    id v7 = &off_1BBE12000;
  }
  else
  {
    BOOL v19 = 0;
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v20 = objc_opt_class();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = *((void *)v7 + 11);
    v30[2] = __33__PLSemaphore_waitWithBlockSync___block_invoke_45;
    v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v30[4] = v20;
    if (waitWithBlockSync__defaultOnce_43 != -1) {
      dispatch_once(&waitWithBlockSync__defaultOnce_43, v30);
    }
    if (waitWithBlockSync__classDebugEnabled_44)
    {
      uint64_t v21 = NSString;
      uint64_t v22 = [(PLSemaphore *)self key];
      v23 = [(PLSemaphore *)self pendingDoneObjects];
      v24 = [v21 stringWithFormat:@"PLSemaphore %@ ended! timedOut=%d pendingDoneObjects=%@", v22, v19, v23];

      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSemaphore.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLSemaphore waitWithBlockSync:]"];
      +[PLCoreStorage logMessage:v24 fromFile:v26 fromFunction:v27 fromLineNumber:117];

      v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  [(NSCondition *)self->_pendingObjectsLock unlock];
  v4[2](v4);
}

BOOL __33__PLSemaphore_waitWithBlockSync___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  waitWithBlockSync__classDebugEnabled = result;
  return result;
}

BOOL __33__PLSemaphore_waitWithBlockSync___block_invoke_45(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  waitWithBlockSync__classDebugEnabled_44 = result;
  return result;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSMutableSet)interestedObjects
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInterestedObjects:(id)a3
{
}

- (NSMutableSet)pendingDoneObjects
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingDoneObjects:(id)a3
{
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKey:(id)a3
{
}

- (NSCondition)pendingObjectsLock
{
  return (NSCondition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPendingObjectsLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingObjectsLock, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_pendingDoneObjects, 0);
  objc_storeStrong((id *)&self->_interestedObjects, 0);
}

@end