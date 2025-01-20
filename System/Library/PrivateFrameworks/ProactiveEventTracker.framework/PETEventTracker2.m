@interface PETEventTracker2
+ (double)roundToSigFigs:(double)a3 sigFigs:(unint64_t)a4;
+ (id)_writeMessage:(id)a3 objCClassName:(id)a4;
+ (id)defaultRootDir;
+ (id)formattedTextForAggregatedMessage:(id)a3;
+ (id)formattedTextForUnaggregatedMessage:(id)a3 messageGroup:(id)a4 config:(id)a5;
+ (id)sharedInstance;
+ (unsigned)typeIdForMessageName:(id)a3;
- (BOOL)isAsyncEnabled;
- (BOOL)isTesting;
- (NSMutableDictionary)storeCache;
- (NSString)logStoresDir;
- (NSString)rootDir;
- (PETAggregateState)aggregateState;
- (PETConfig)config;
- (PETEventTracker2)initWithAsyncEnabled:(BOOL)a3;
- (PETEventTracker2)initWithRootDir:(id)a3 config:(id)a4;
- (double)_roundToSigFigs:(double)a3 forRawMessage:(id)a4;
- (id)_getLogStore:(id)a3;
- (id)initForTestingWithRootDir:(id)a3;
- (void)_dispatchAsyncForLogging:(id)a3 txnName:(const char *)a4;
- (void)_init;
- (void)_initWithRootDir:(id)a3 config:(id)a4;
- (void)_logMessage:(id)a3 subGroup:(id)a4;
- (void)_logMessageData:(id)a3 objcClassName:(id)a4 subGroup:(id)a5;
- (void)_runBlockWithRBSAssertion:(id)a3;
- (void)_trackDistributionForMessage:(id)a3 value:(double)a4;
- (void)_trackScalarForMessage:(id)a3 count:(int)a4 overwrite:(BOOL)a5;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)assertionWillInvalidate:(id)a3;
- (void)clearLogStores;
- (void)enumerateAggregatedMessagesWithBlock:(id)a3 clearStore:(BOOL)a4;
- (void)enumerateMessageGroups:(id)a3;
- (void)enumerateMessagesWithBlock:(id)a3 clearStore:(BOOL)a4;
- (void)enumerateMessagesWithBlock:(id)a3 messageGroup:(id)a4 clearStore:(BOOL)a5;
- (void)logMessage:(id)a3;
- (void)logMessage:(id)a3 subGroup:(id)a4;
- (void)logMessageData:(id)a3 objcClassName:(id)a4 subGroup:(id)a5;
- (void)setConfig:(id)a3;
- (void)setIsAsyncEnabled:(BOOL)a3;
- (void)setIsTesting:(BOOL)a3;
- (void)setLogStoresDir:(id)a3;
- (void)setRootDir:(id)a3;
- (void)setStoreCache:(id)a3;
- (void)setTestingEnvironment;
- (void)trackDistributionForMessage:(id)a3 value:(double)a4;
- (void)trackScalarForMessage:(id)a3;
- (void)trackScalarForMessage:(id)a3 count:(int)a4;
- (void)trackScalarForMessage:(id)a3 updateCount:(int)a4;
@end

@implementation PETEventTracker2

uint64_t __46__PETEventTracker2__runBlockWithRBSAssertion___block_invoke(uint64_t a1)
{
  while (1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 128));
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v2 + 120))
    {
      v3 = *(void **)(v2 + 112);
      if (v3) {
        break;
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 128));
    [MEMORY[0x1E4F29060] sleepForTimeInterval:1.0];
  }
  [v3 invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = 0;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Runningboard assertion has been invalidated", v7, 2u);
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 128));
}

- (void)trackDistributionForMessage:(id)a3 value:(double)a4
{
  id v6 = a3;
  v7 = v6;
  if (self->_isAsyncEnabled)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PETEventTracker2_trackDistributionForMessage_value___block_invoke;
    v12[3] = &unk_1E56C4250;
    v12[4] = self;
    id v13 = v6;
    double v14 = a4;
    [(PETEventTracker2 *)self _dispatchAsyncForLogging:v12 txnName:"com.apple.proactive.eventtracker.trackDistribution"];
  }
  else
  {
    v8 = (void *)MEMORY[0x192FD4890]();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PETEventTracker2_trackDistributionForMessage_value___block_invoke_2;
    v9[3] = &unk_1E56C4250;
    v9[4] = self;
    id v10 = v7;
    double v11 = a4;
    [(PETEventTracker2 *)self _runBlockWithRBSAssertion:v9];
  }
}

uint64_t __53__PETEventTracker2__dispatchAsyncForLogging_txnName___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _runBlockWithRBSAssertion:*(void *)(a1 + 48)];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 32));
  --*(_DWORD *)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = (pthread_mutex_t *)(*(void *)(a1 + 32) + 32);

  return pthread_mutex_unlock(v2);
}

- (void)_runBlockWithRBSAssertion:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  v5 = v4;
  if (self->_inited)
  {
    if (self->_isProcessManagedByRBS)
    {
      pthread_mutex_lock(&self->_rbsAssertionLock);
      rbsAssertion = self->_rbsAssertion;
      if (rbsAssertion) {
        goto LABEL_14;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Requesting Runningboard assertion", buf, 2u);
      }
      v7 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskUninterruptable"];
      id v8 = objc_alloc(MEMORY[0x1E4F96318]);
      rbsTarget = self->_rbsTarget;
      v22[0] = v7;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      double v11 = (RBSAssertion *)[v8 initWithExplanation:@"ProactiveEventTracker" target:rbsTarget attributes:v10];
      v12 = self->_rbsAssertion;
      self->_rbsAssertion = v11;

      id v13 = self->_rbsAssertion;
      id v19 = 0;
      LODWORD(rbsTarget) = [(RBSAssertion *)v13 acquireWithError:&v19];
      id v14 = v19;
      if (rbsTarget)
      {
        self->_rbsShouldInvalidate = 0;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Runningboard assertion has been acquired", buf, 2u);
        }
        dispatch_time_t v15 = dispatch_time(0, 1000000000);
        v16 = dispatch_queue_create("com.apple.proactive.eventtracker.rbsAssertionCheck", 0);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __46__PETEventTracker2__runBlockWithRBSAssertion___block_invoke;
        v18[3] = &unk_1E56C41D8;
        v18[4] = self;
        dispatch_after(v15, v16, v18);
      }
      else
      {
        v17 = self->_rbsAssertion;
        self->_rbsAssertion = 0;

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v14;
          _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to acquire the RunningBoard assertion: %@", buf, 0xCu);
        }
      }

      rbsAssertion = self->_rbsAssertion;
      if (rbsAssertion)
      {
LABEL_14:
        [(RBSAssertion *)rbsAssertion addObserver:self];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Running logging block", buf, 2u);
        }
        v5[2](v5);
        if (!self->_rbsShouldInvalidate)
        {
          self->_rbsShouldInvalidate = 1;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Setting Runningboard assertion to be invalidated", buf, 2u);
          }
        }
      }
      else
      {
        AnalyticsSendEvent();
      }
      pthread_mutex_unlock(&self->_rbsAssertionLock);
    }
    else
    {
      v4[2](v4);
    }
  }
}

uint64_t __48__PETEventTracker2_trackScalarForMessage_count___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trackScalarForMessage:*(void *)(a1 + 40) count:*(unsigned int *)(a1 + 48) overwrite:0];
}

- (void)_trackScalarForMessage:(id)a3 count:(int)a4 overwrite:(BOOL)a5
{
  if (self->_inited)
  {
    BOOL v5 = a5;
    id v8 = a3;
    id v21 = (id)objc_opt_new();
    [v21 setType:1];
    [v21 setDatestamp:_getDatestamp()];
    v9 = [v8 data];
    id v10 = (objc_class *)objc_opt_class();

    double v11 = NSStringFromClass(v10);
    v12 = +[PETEventTracker2 _writeMessage:v9 objCClassName:v11];
    [v21 setRawMessage:v12];

    id v13 = [v21 rawMessage];

    id v14 = v21;
    if (v13)
    {
      dispatch_time_t v15 = [v21 data];
      v16 = [(PETEventTracker2 *)self aggregateState];
      double v17 = (double)a4;
      id v18 = v15;
      uint64_t v19 = [v18 bytes];
      uint64_t v20 = (unsigned __int16)[v18 length];
      if (v5) {
        [v16 updateCounterTo:v19 forKey:v20 keyLength:v17];
      }
      else {
        [v16 incrementCounterBy:v19 forKey:v20 keyLength:v17];
      }

      id v14 = v21;
    }
  }
}

- (PETAggregateState)aggregateState
{
  return self->_aggregateState;
}

+ (id)_writeMessage:(id)a3 objCClassName:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[PETEventTracker2 typeIdForMessageName:v6];
  if ((unint64_t)[v5 length] <= 0x100000)
  {
    id v10 = objc_opt_new();
    [v10 setTypeId:v7];
    [v10 setRawBytes:v5];
    [v10 setName:v6];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v15 = v6;
      __int16 v16 = 2048;
      uint64_t v17 = [v5 length];
      __int16 v18 = 1024;
      int v19 = 0x100000;
      _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dropping large message %@ with length %lu. max length: %ul", buf, 0x1Cu);
    }
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "length", @"name", @"size", v6));
    v13[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:2];
    AnalyticsSendEvent();

    id v10 = 0;
  }

  return v10;
}

+ (unsigned)typeIdForMessageName:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (const char *)[a3 UTF8String];
  CC_LONG v4 = strlen(v3);
  CC_MD5(v3, v4, md);
  return bswap32(*(unsigned int *)md);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1603 != -1) {
    dispatch_once(&sharedInstance_onceToken_1603, &__block_literal_global_1604);
  }
  uint64_t v2 = (void *)sharedInstance_instance_1605;

  return v2;
}

- (void)trackScalarForMessage:(id)a3 count:(int)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_isAsyncEnabled)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__PETEventTracker2_trackScalarForMessage_count___block_invoke;
    v12[3] = &unk_1E56C4228;
    v12[4] = self;
    id v13 = v6;
    int v14 = a4;
    [(PETEventTracker2 *)self _dispatchAsyncForLogging:v12 txnName:"com.apple.proactive.eventtracker.trackScalar"];
  }
  else
  {
    id v8 = (void *)MEMORY[0x192FD4890]();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__PETEventTracker2_trackScalarForMessage_count___block_invoke_2;
    v9[3] = &unk_1E56C4228;
    v9[4] = self;
    id v10 = v7;
    int v11 = a4;
    [(PETEventTracker2 *)self _runBlockWithRBSAssertion:v9];
  }
}

- (void)_dispatchAsyncForLogging:(id)a3 txnName:(const char *)a4
{
  id v5 = a3;
  pthread_mutex_lock(&self->_loggingQueueLock);
  int loggingQueueSize = self->_loggingQueueSize;
  if (loggingQueueSize < 1024)
  {
    self->_int loggingQueueSize = loggingQueueSize + 1;
    pthread_mutex_unlock(&self->_loggingQueueLock);
    uint64_t v7 = (void *)os_transaction_create();
    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PETEventTracker2__dispatchAsyncForLogging_txnName___block_invoke;
    block[3] = &unk_1E56C4200;
    block[4] = self;
    id v11 = v7;
    id v12 = v5;
    id v9 = v7;
    dispatch_async(loggingQueue, block);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "dropping message due to exceeding the logging queue limit", buf, 2u);
    }
    AnalyticsSendEvent();
    pthread_mutex_unlock(&self->_loggingQueueLock);
  }
}

uint64_t __54__PETEventTracker2_trackDistributionForMessage_value___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trackDistributionForMessage:*(void *)(a1 + 40) value:*(double *)(a1 + 48)];
}

- (void)_trackDistributionForMessage:(id)a3 value:(double)a4
{
  if (self->_inited)
  {
    id v6 = a3;
    id v27 = (id)objc_opt_new();
    [v27 setType:2];
    [v27 setDatestamp:_getDatestamp()];
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = [v6 data];
    id v10 = (objc_class *)objc_opt_class();

    id v11 = NSStringFromClass(v10);
    id v12 = +[PETEventTracker2 _writeMessage:v9 objCClassName:v11];
    [v27 setRawMessage:v12];

    id v13 = [v27 rawMessage];

    if (v13)
    {
      int v14 = [v27 data];
      id v15 = [(PETEventTracker2 *)self aggregateState];
      id v16 = v14;
      objc_msgSend(v15, "updateDistributionWithValue:forKey:keyLength:maxSampleSize:", objc_msgSend(v16, "bytes"), (unsigned __int16)objc_msgSend(v16, "length"), 1, a4);

      uint64_t v17 = [(PETEventTracker2 *)self config];
      __int16 v18 = [v17 bucketsForMessageName:v8];

      if (v18)
      {
        [v27 setType:3];
        int v19 = [v18 sortedArrayUsingSelector:sel_compare_];
        uint64_t v20 = [NSNumber numberWithDouble:a4];
        unint64_t v21 = objc_msgSend(v19, "indexOfObject:inSortedRange:options:usingComparator:", v20, 0, objc_msgSend(v19, "count"), 1280, &__block_literal_global_381);

        if (v21 >= [v19 count])
        {
          double v24 = INFINITY;
        }
        else
        {
          v22 = [v19 objectAtIndexedSubscript:v21];
          [v22 doubleValue];
          double v24 = v23;
        }
        [v27 setBucket:v24];
        v25 = [v27 data];

        v26 = [(PETEventTracker2 *)self aggregateState];
        id v16 = v25;
        objc_msgSend(v26, "incrementCounterBy:forKey:keyLength:", objc_msgSend(v16, "bytes"), (unsigned __int16)objc_msgSend(v16, "length"), 1.0);
      }
    }
  }
}

- (PETConfig)config
{
  return (PETConfig *)objc_getProperty(self, a2, 216, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCache, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_logStoresDir, 0);
  objc_storeStrong((id *)&self->_rootDir, 0);
  objc_storeStrong((id *)&self->_rbsAssertion, 0);
  objc_storeStrong((id *)&self->_rbsTarget, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);

  objc_storeStrong((id *)&self->_aggregateState, 0);
}

- (void)setStoreCache:(id)a3
{
}

- (NSMutableDictionary)storeCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setConfig:(id)a3
{
}

- (void)setLogStoresDir:(id)a3
{
}

- (NSString)logStoresDir
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRootDir:(id)a3
{
}

- (NSString)rootDir
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setIsAsyncEnabled:(BOOL)a3
{
  self->_isAsyncEnabled = a3;
}

- (BOOL)isAsyncEnabled
{
  return self->_isAsyncEnabled;
}

- (void)setIsTesting:(BOOL)a3
{
  self->_isTesting = a3;
}

- (BOOL)isTesting
{
  return self->_isTesting;
}

- (void)clearLogStores
{
  if (self->_inited)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __34__PETEventTracker2_clearLogStores__block_invoke;
    v2[3] = &unk_1E56C4390;
    v2[4] = self;
    [(PETEventTracker2 *)self enumerateMessageGroups:v2];
  }
}

void __34__PETEventTracker2_clearLogStores__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _getLogStore:a2];
  [v2 clear];
}

- (void)setTestingEnvironment
{
}

- (void)enumerateAggregatedMessagesWithBlock:(id)a3 clearStore:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_inited)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__PETEventTracker2_enumerateAggregatedMessagesWithBlock_clearStore___block_invoke;
    v19[3] = &unk_1E56C4340;
    v19[4] = self;
    id v8 = v6;
    id v20 = v8;
    id v9 = (void *)MEMORY[0x192FD4A60](v19);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __68__PETEventTracker2_enumerateAggregatedMessagesWithBlock_clearStore___block_invoke_174;
    id v16 = &unk_1E56C4368;
    uint64_t v17 = self;
    id v18 = v8;
    id v10 = (void *)MEMORY[0x192FD4A60](&v13);
    id v11 = [(PETEventTracker2 *)self aggregateState];
    id v12 = v11;
    if (v4) {
      [v11 enumerateAndResetCounters:v9 distributions:v10];
    }
    else {
      [v11 enumerateCounters:v9 distributions:v10];
    }
  }
}

void __68__PETEventTracker2_enumerateAggregatedMessagesWithBlock_clearStore___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, double a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x192FD4890]();
  id v9 = objc_opt_new();
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a2 length:a3];
  id v11 = [[PETAggregationKey alloc] initWithData:v10];
  id v12 = [(PETAggregationKey *)v11 rawMessage];
  uint64_t v13 = [v12 name];

  if (v13)
  {
    [v9 setKey:v11];
    uint64_t v14 = *(void **)(a1 + 32);
    id v15 = [(PETAggregationKey *)v11 rawMessage];
    [v14 _roundToSigFigs:v15 forRawMessage:a4];
    [v9 setCount:v16];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v11;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Message name is nil in raw message: %@", (uint8_t *)&v17, 0xCu);
    }
    AnalyticsSendEvent();
  }
}

void __68__PETEventTracker2_enumerateAggregatedMessagesWithBlock_clearStore___block_invoke_174(uint64_t a1, uint64_t a2, unsigned int a3, double a4, double a5, double a6, double a7, uint64_t a8, unsigned int a9)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v17 = (void *)MEMORY[0x192FD4890]();
  id v18 = objc_opt_new();
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a2 length:a3];
  id v20 = [[PETAggregationKey alloc] initWithData:v19];
  unint64_t v21 = [(PETAggregationKey *)v20 rawMessage];
  v22 = [v21 name];

  if (v22)
  {
    [v18 setKey:v20];
    double v23 = *(void **)(a1 + 32);
    double v24 = (double)a9;
    v25 = [(PETAggregationKey *)v20 rawMessage];
    [v23 _roundToSigFigs:v25 forRawMessage:v24];
    [v18 setCount:v26];

    id v27 = objc_opt_new();
    v28 = *(void **)(a1 + 32);
    v29 = [(PETAggregationKey *)v20 rawMessage];
    [v28 _roundToSigFigs:v29 forRawMessage:a6];
    objc_msgSend(v27, "setMin:");

    v30 = *(void **)(a1 + 32);
    v31 = [(PETAggregationKey *)v20 rawMessage];
    [v30 _roundToSigFigs:v31 forRawMessage:a7];
    objc_msgSend(v27, "setMax:");

    v32 = *(void **)(a1 + 32);
    v33 = [(PETAggregationKey *)v20 rawMessage];
    [v32 _roundToSigFigs:v33 forRawMessage:a4];
    objc_msgSend(v27, "setMean:");

    v34 = *(void **)(a1 + 32);
    v35 = [(PETAggregationKey *)v20 rawMessage];
    [v34 _roundToSigFigs:v35 forRawMessage:a5];
    objc_msgSend(v27, "setVariance:");

    [v18 setDistribution:v27];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v36 = 138412290;
      v37 = v20;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Message name is nil in raw message: %@", (uint8_t *)&v36, 0xCu);
    }
    AnalyticsSendEvent();
  }
}

- (double)_roundToSigFigs:(double)a3 forRawMessage:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PETEventTracker2 *)self config];
  id v8 = [v6 name];

  uint64_t v9 = [v7 sigFigsForMessageName:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    return a3;
  }
  id v11 = objc_opt_class();

  [v11 roundToSigFigs:v9 sigFigs:a3];
  return result;
}

- (void)enumerateMessagesWithBlock:(id)a3 messageGroup:(id)a4 clearStore:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (self->_inited)
  {
    uint64_t v9 = [(PETEventTracker2 *)self _getLogStore:a4];
    if (v9)
    {
      if (v5)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        void v13[2] = __71__PETEventTracker2_enumerateMessagesWithBlock_messageGroup_clearStore___block_invoke;
        v13[3] = &unk_1E56C4318;
        id v10 = &v14;
        id v14 = v8;
        [v9 enumerateAndClearItemsWithBlock:v13];
      }
      else
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __71__PETEventTracker2_enumerateMessagesWithBlock_messageGroup_clearStore___block_invoke_2;
        v11[3] = &unk_1E56C4318;
        id v10 = &v12;
        id v12 = v8;
        [v9 enumerateItemsWithBlock:v11];
      }
    }
  }
}

void __71__PETEventTracker2_enumerateMessagesWithBlock_messageGroup_clearStore___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)MEMORY[0x192FD4890]();
  BOOL v4 = [[PETRawMessage alloc] initWithData:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__PETEventTracker2_enumerateMessagesWithBlock_messageGroup_clearStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)MEMORY[0x192FD4890]();
  BOOL v4 = [[PETRawMessage alloc] initWithData:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateMessagesWithBlock:(id)a3 clearStore:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_inited)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__PETEventTracker2_enumerateMessagesWithBlock_clearStore___block_invoke;
    v8[3] = &unk_1E56C42F0;
    v8[4] = self;
    id v9 = v6;
    BOOL v10 = a4;
    [(PETEventTracker2 *)self enumerateMessageGroups:v8];
  }
}

void __58__PETEventTracker2_enumerateMessagesWithBlock_clearStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PETEventTracker2_enumerateMessagesWithBlock_clearStore___block_invoke_2;
  v8[3] = &unk_1E56C42C8;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v5;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  id v7 = v3;
  [v4 enumerateMessagesWithBlock:v8 messageGroup:v7 clearStore:v6];
}

uint64_t __58__PETEventTracker2_enumerateMessagesWithBlock_clearStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void)enumerateMessageGroups:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void))a3;
  if (self->_inited)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    logStoresDir = self->_logStoresDir;
    id v19 = 0;
    id v7 = [v5 contentsOfDirectoryAtPath:logStoresDir error:&v19];
    id v8 = v19;

    if (v7)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i));
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v11);
      }
    }
    else
    {
      unint64_t v21 = @"code";
      objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v22[0] = v9;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      AnalyticsSendEvent();
    }
  }
}

- (void)_logMessage:(id)a3 subGroup:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v7 data];

  [(PETEventTracker2 *)self _logMessageData:v9 objcClassName:v10 subGroup:v6];
}

- (void)_logMessageData:(id)a3 objcClassName:(id)a4 subGroup:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_inited)
  {
    id v10 = [(PETEventTracker2 *)self config];
    uint64_t v11 = [v10 groupForMessageName:v8];

    uint64_t v12 = (void *)MEMORY[0x192FD4890]();
    if (v9)
    {
      uint64_t v13 = [NSString stringWithFormat:@"%@-%@", v11, v9];

      uint64_t v11 = (void *)v13;
    }
    id v14 = [(PETEventTracker2 *)self _getLogStore:v11];
    if (v14)
    {
      long long v15 = +[PETEventTracker2 _writeMessage:v18 objCClassName:v8];
      long long v16 = v15;
      if (v15)
      {
        long long v17 = [v15 data];
        [v14 log:v17];
      }
    }
  }
}

- (id)_getLogStore:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_storeCache objectForKey:v4];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = [(NSString *)self->_logStoresDir stringByAppendingPathComponent:v4];
    id v8 = [(PETEventTracker2 *)self config];
    uint64_t v9 = [v8 samplingLimitForMessageGroup:v4];

    id v10 = [[PETReservoirSamplingLog alloc] initWithPath:v7 limit:v9];
    if (v10)
    {
      [(NSMutableDictionary *)self->_storeCache setValue:v10 forKey:v4];
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v12 = [v11 attributesOfItemAtPath:v7 error:0];
      unint64_t v13 = [v12 fileSize];

      if (v13 > 0xA00000)
      {
        [(PETReservoirSamplingLog *)v10 clear];
        v16[0] = @"type";
        v16[1] = @"msg_group";
        v17[0] = &unk_1EE090A88;
        v17[1] = v4;
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
        AnalyticsSendEvent();
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v4;
        _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create store for unaggregated message group: %@", buf, 0xCu);
      }
      v18[0] = @"reason";
      v18[1] = @"msg_group";
      v19[0] = @"init_log_store";
      v19[1] = v4;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      AnalyticsSendEvent();
    }

    id v6 = v10;
  }

  return v6;
}

- (void)logMessageData:(id)a3 objcClassName:(id)a4 subGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_isAsyncEnabled)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __58__PETEventTracker2_logMessageData_objcClassName_subGroup___block_invoke;
    v16[3] = &unk_1E56C42A0;
    v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    [(PETEventTracker2 *)self _dispatchAsyncForLogging:v16 txnName:"com.apple.proactive.eventtracker.logMessageData"];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x192FD4890]();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__PETEventTracker2_logMessageData_objcClassName_subGroup___block_invoke_2;
    v12[3] = &unk_1E56C42A0;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    [(PETEventTracker2 *)self _runBlockWithRBSAssertion:v12];
  }
}

uint64_t __58__PETEventTracker2_logMessageData_objcClassName_subGroup___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logMessageData:*(void *)(a1 + 40) objcClassName:*(void *)(a1 + 48) subGroup:*(void *)(a1 + 56)];
}

uint64_t __58__PETEventTracker2_logMessageData_objcClassName_subGroup___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logMessageData:*(void *)(a1 + 40) objcClassName:*(void *)(a1 + 48) subGroup:*(void *)(a1 + 56)];
}

- (void)logMessage:(id)a3 subGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isAsyncEnabled)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __40__PETEventTracker2_logMessage_subGroup___block_invoke;
    v12[3] = &unk_1E56C4278;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    [(PETEventTracker2 *)self _dispatchAsyncForLogging:v12 txnName:"com.apple.proactive.eventtracker.logMessage"];
  }
  else
  {
    id v8 = (void *)MEMORY[0x192FD4890]();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__PETEventTracker2_logMessage_subGroup___block_invoke_2;
    v9[3] = &unk_1E56C4278;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [(PETEventTracker2 *)self _runBlockWithRBSAssertion:v9];
  }
}

uint64_t __40__PETEventTracker2_logMessage_subGroup___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logMessage:*(void *)(a1 + 40) subGroup:*(void *)(a1 + 48)];
}

uint64_t __40__PETEventTracker2_logMessage_subGroup___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logMessage:*(void *)(a1 + 40) subGroup:*(void *)(a1 + 48)];
}

- (void)logMessage:(id)a3
{
}

uint64_t __54__PETEventTracker2_trackDistributionForMessage_value___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trackDistributionForMessage:*(void *)(a1 + 40) value:*(double *)(a1 + 48)];
}

- (void)trackScalarForMessage:(id)a3 updateCount:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_isAsyncEnabled)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PETEventTracker2_trackScalarForMessage_updateCount___block_invoke;
    v12[3] = &unk_1E56C4228;
    v12[4] = self;
    id v13 = v6;
    int v14 = a4;
    [(PETEventTracker2 *)self _dispatchAsyncForLogging:v12 txnName:"com.apple.proactive.eventtracker.trackScalar"];
  }
  else
  {
    id v8 = (void *)MEMORY[0x192FD4890]();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PETEventTracker2_trackScalarForMessage_updateCount___block_invoke_2;
    v9[3] = &unk_1E56C4228;
    v9[4] = self;
    id v10 = v7;
    int v11 = a4;
    [(PETEventTracker2 *)self _runBlockWithRBSAssertion:v9];
  }
}

uint64_t __54__PETEventTracker2_trackScalarForMessage_updateCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trackScalarForMessage:*(void *)(a1 + 40) count:*(unsigned int *)(a1 + 48) overwrite:1];
}

uint64_t __54__PETEventTracker2_trackScalarForMessage_updateCount___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trackScalarForMessage:*(void *)(a1 + 40) count:*(unsigned int *)(a1 + 48) overwrite:1];
}

uint64_t __48__PETEventTracker2_trackScalarForMessage_count___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _trackScalarForMessage:*(void *)(a1 + 40) count:*(unsigned int *)(a1 + 48) overwrite:0];
}

- (void)trackScalarForMessage:(id)a3
{
}

- (void)assertionWillInvalidate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Runningboard assertion (%@) will be invalidated soon. Force unlocking all store files...", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(NSMutableDictionary *)self->_storeCache allValues];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) unlock];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Runningboard assertion (%@) was invalidated unexpectedly with error %@", buf, 0x16u);
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code", @"error_code"));
  long long v10 = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  AnalyticsSendEvent();
}

- (void)_initWithRootDir:(id)a3 config:(id)a4
{
  id v5 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_rootDir, v5);
  objc_storeStrong((id *)&self->_config, a4);
  uint64_t v9 = [v7 stringByAppendingPathComponent:@"log_stores"];
  logStoresDir = self->_logStoresDir;
  self->_logStoresDir = v9;

  long long v11 = (NSMutableDictionary *)objc_opt_new();
  storeCache = self->_storeCache;
  self->_storeCache = v11;

  __int16 v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  rootDir = self->_rootDir;
  id v36 = 0;
  LOBYTE(v5) = [v13 createDirectoryAtPath:rootDir withIntermediateDirectories:1 attributes:0 error:&v36];
  uint64_t v15 = (__CFString *)v36;

  if (v5)
  {
    id v16 = [(NSString *)self->_rootDir stringByAppendingPathComponent:@"aggr_state"];
    uint64_t v17 = [[PETAggregateState alloc] initWithPath:v16];
    aggregateState = self->_aggregateState;
    self->_aggregateState = v17;

    if (self->_aggregateState)
    {
      id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v20 = [v19 attributesOfItemAtPath:v16 error:0];
      unint64_t v21 = [v20 fileSize];

      if (v21 > 0xA00000)
      {
        [(PETAggregateState *)self->_aggregateState reset];
        AnalyticsSendEvent();
      }
      uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      double v23 = self->_logStoresDir;
      v35 = v15;
      char v24 = [v22 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:0 error:&v35];
      v25 = v35;

      if (v24)
      {
        double v26 = [MEMORY[0x1E4F28F80] processInfo];
        uint64_t v27 = [v26 processIdentifier];

        v28 = [MEMORY[0x1E4F96478] targetWithPid:v27];
        rbsTarget = self->_rbsTarget;
        self->_rbsTarget = v28;

        pthread_mutex_init(&self->_rbsAssertionLock, 0);
        v30 = [MEMORY[0x1E4F963E8] currentProcess];
        self->_isProcessManagedByRBS = [v30 isManaged];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          if (self->_isProcessManagedByRBS) {
            v31 = @"YES";
          }
          else {
            v31 = @"NO";
          }
          *(_DWORD *)buf = 138412290;
          v42 = v31;
          _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "_isProcessManagedByRBS: %@", buf, 0xCu);
        }
        self->_inited = 1;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v25;
          _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create log stores dir: %@", buf, 0xCu);
        }
        v37[0] = @"reason";
        v37[1] = @"code";
        v38[0] = &unk_1EE090A88;
        v33 = objc_msgSend(NSNumber, "numberWithInteger:", -[__CFString code](v25, "code"));
        v38[1] = v33;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
        AnalyticsSendEvent();
      }
      uint64_t v15 = v25;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create store for aggregate state", buf, 2u);
      }
      AnalyticsSendEvent();
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v15;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create root dir: %@", buf, 0xCu);
    }
    v39[0] = @"reason";
    v39[1] = @"code";
    v40[0] = &unk_1EE090A88;
    id v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[__CFString code](v15, "code"));
    v40[1] = v16;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    AnalyticsSendEvent();
  }
}

- (PETEventTracker2)initWithRootDir:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PETEventTracker2;
  id v8 = [(PETEventTracker2 *)&v13 init];
  uint64_t v9 = v8;
  if (v8
    && (v8->_isAsyncEnabled = 0,
        [(PETEventTracker2 *)v8 _initWithRootDir:v6 config:v7],
        !v9->_inited))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to initialize PETEventTracker2.", v12, 2u);
    }
    long long v10 = 0;
  }
  else
  {
    long long v10 = v9;
  }

  return v10;
}

- (id)initForTestingWithRootDir:(id)a3
{
  id v4 = a3;
  id v5 = [[PETConfig alloc] initWithDictionary:&unk_1EE090C20];
  if (v5)
  {
    self = [(PETEventTracker2 *)self initWithRootDir:v4 config:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_init
{
  v12[2] = *MEMORY[0x1E4F143B8];
  self->_isTesting = 0;
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  id v4 = [v3 processName];

  if ([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.proactive.eventtracker" logHandle:0])
  {
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v5 pathForResource:@"pet_config" ofType:@"bin"];

    if (v6)
    {
      id v7 = [[PETConfig alloc] initWithFile:v6];
      if (v7)
      {
        id v8 = +[PETEventTracker2 defaultRootDir];
        if (v8)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            int v9 = 138412290;
            long long v10 = v8;
            _os_log_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Initializing PETEventTracker2 with root dir: %@", (uint8_t *)&v9, 0xCu);
          }
          [(PETEventTracker2 *)self _initWithRootDir:v8 config:v7];
        }
        else
        {
          AnalyticsSendEvent();
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          LOWORD(v9) = 0;
          _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to initialize PETEventTracker2 due to corrupted config", (uint8_t *)&v9, 2u);
        }
        AnalyticsSendEvent();
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to initialize PETEventTracker2 due to missing config", (uint8_t *)&v9, 2u);
      }
      AnalyticsSendEvent();
      id v6 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "The process calling PET2 doesn't have the correct entitlement (com.apple.proactive.eventtracker)", (uint8_t *)&v9, 2u);
    }
    v11[0] = @"reason";
    v11[1] = @"process";
    v12[0] = &unk_1EE090A28;
    v12[1] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    AnalyticsSendEvent();
  }
}

- (PETEventTracker2)initWithAsyncEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PETEventTracker2;
  id v4 = [(PETEventTracker2 *)&v16 init];
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  v4->_isAsyncEnabled = v3;
  if (v3)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v8 = dispatch_queue_create("PETEventTracker2", v7);
    loggingQueue = v5->_loggingQueue;
    v5->_loggingQueue = (OS_dispatch_queue *)v8;

    v5->_int loggingQueueSize = 0;
    pthread_mutex_init(&v5->_loggingQueueLock, 0);
    long long v10 = v5->_loggingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PETEventTracker2_initWithAsyncEnabled___block_invoke;
    block[3] = &unk_1E56C41D8;
    uint64_t v15 = v5;
    dispatch_async(v10, block);

LABEL_5:
    long long v11 = v5;
    goto LABEL_6;
  }
  [(PETEventTracker2 *)v4 _init];
  if (v5->_inited) {
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = 0;
    _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to initialize PETEventTracker2.", (uint8_t *)&v13, 2u);
  }
  long long v11 = 0;
LABEL_6:

  return v11;
}

void __41__PETEventTracker2_initWithAsyncEnabled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _init];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 96) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v2 = 0;
    _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to initialize PETEventTracker2.", v2, 2u);
  }
}

+ (id)formattedTextForUnaggregatedMessage:(id)a3 messageGroup:(id)a4 config:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  long long v10 = objc_opt_new();
  [v10 appendFormat:@"Message Group: %@\n", v8];

  long long v11 = [v9 name];
  [v10 appendFormat:@"Message Name: %@\n", v11];

  objc_msgSend(v10, "appendFormat:", @"Message Type: %08x\n", objc_msgSend(v9, "typeId"));
  id v12 = [v9 name];
  __int16 v13 = [v7 nestedFieldsForMessageName:v12];

  id v14 = [PETProtobufRawDecodedMessage alloc];
  uint64_t v15 = [v9 rawBytes];

  objc_super v16 = [(PETProtobufRawDecodedMessage *)v14 initWithData:v15 nestedFields:v13];
  [v10 appendFormat:@"Message Body:\n"];
  uint64_t v17 = [(PETProtobufRawDecodedMessage *)v16 formattedText];
  [v10 appendFormat:@"%@", v17];

  return v10;
}

+ (id)formattedTextForAggregatedMessage:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 key];
  int v6 = [v5 datestamp];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v8 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:(double)(86400 * v6)];
  [v7 setTimeZone:v8];
  [v7 setDateFormat:@"yyyy-MM-dd"];
  long long v10 = [v7 stringFromDate:v9];

  [v4 appendFormat:@"UTC Date: %@\n", v10];
  long long v11 = [v3 key];
  id v12 = [v11 rawMessage];
  __int16 v13 = [v12 name];
  [v4 appendFormat:@"Message Name: %@\n", v13];

  id v14 = [v3 key];
  uint64_t v15 = [v14 rawMessage];
  objc_msgSend(v4, "appendFormat:", @"Message Type: %08x\n", objc_msgSend(v15, "typeId"));

  objc_super v16 = [v3 key];
  uint64_t v17 = [v16 type];

  id v18 = [v3 key];
  id v19 = [v18 typeAsString:v17];
  [v4 appendFormat:@"Aggregation Type: %@\n", v19];

  objc_msgSend(v4, "appendFormat:", @"Count: %u\n", objc_msgSend(v3, "count"));
  if (v17 == 3)
  {
    double v26 = [v3 key];
    [v26 bucket];
    objc_msgSend(v4, "appendFormat:", @"Bucket: %f\n", v28);
  }
  else
  {
    if (v17 != 2) {
      goto LABEL_6;
    }
    id v20 = [v3 distribution];
    [v20 min];
    objc_msgSend(v4, "appendFormat:", @"Min: %f\n", v21);

    uint64_t v22 = [v3 distribution];
    [v22 max];
    objc_msgSend(v4, "appendFormat:", @"Max: %f\n", v23);

    char v24 = [v3 distribution];
    [v24 mean];
    objc_msgSend(v4, "appendFormat:", @"Mean: %f\n", v25);

    double v26 = [v3 distribution];
    [v26 variance];
    objc_msgSend(v4, "appendFormat:", @"Variance: %f\n", v27);
  }

LABEL_6:
  v29 = [PETProtobufRawDecodedMessage alloc];
  v30 = [v3 key];
  v31 = [v30 rawMessage];
  v32 = [v31 rawBytes];
  v33 = [(PETProtobufRawDecodedMessage *)v29 initWithData:v32];

  [v4 appendFormat:@"Message Body:\n"];
  v34 = [(PETProtobufRawDecodedMessage *)v33 formattedText];
  [v4 appendFormat:@"%@", v34];

  return v4;
}

+ (double)roundToSigFigs:(double)a3 sigFigs:(unint64_t)a4
{
  double v4 = a3;
  BOOL v5 = a3 < 0.0;
  if (a3 != 0.0)
  {
    int v6 = a4;
    double v7 = -a3;
    if (!v5) {
      double v7 = v4;
    }
    double v8 = log10(v7);
    double v9 = __exp10((double)(int)(v6 - vcvtpd_s64_f64(v8)));
    return (double)(uint64_t)round(v9 * v4) / v9;
  }
  return v4;
}

+ (id)defaultRootDir
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  *__error() = 0;
  uid_t v2 = getuid();
  id v3 = getpwuid(v2);
  if (v3 && v3->pw_dir)
  {
    double v4 = objc_msgSend(NSString, "stringWithUTF8String:");
    BOOL v5 = [v4 stringByAppendingPathComponent:@"Library/Caches"];
    int v6 = [v5 stringByAppendingPathComponent:@"com.apple.proactive.eventtracker"];

    goto LABEL_9;
  }
  int v7 = *__error();
  BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v8)
    {
      int v9 = *__error();
      long long v10 = __error();
      long long v11 = strerror(*v10);
      v16[0] = 67109378;
      v16[1] = v9;
      __int16 v17 = 2080;
      id v18 = v11;
      id v12 = MEMORY[0x1E4F14500];
      __int16 v13 = "Failed to get user passwd entry: [%i] %s";
      uint32_t v14 = 18;
LABEL_13:
      _os_log_error_impl(&dword_190C01000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)v16, v14);
    }
  }
  else if (v8)
  {
    LOWORD(v16[0]) = 0;
    id v12 = MEMORY[0x1E4F14500];
    __int16 v13 = "User passwd entry or home directory is not found";
    uint32_t v14 = 2;
    goto LABEL_13;
  }
  int v6 = 0;
LABEL_9:

  return v6;
}

void __34__PETEventTracker2_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192FD4890]();
  v1 = [[PETEventTracker2 alloc] initWithAsyncEnabled:1];
  uid_t v2 = (void *)sharedInstance_instance_1605;
  sharedInstance_instance_1605 = (uint64_t)v1;
}

@end