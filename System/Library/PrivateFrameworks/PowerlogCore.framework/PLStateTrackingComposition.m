@interface PLStateTrackingComposition
+ (id)sharedInstance;
+ (void)registerState:(Class)a3;
- (BOOL)stateChanged:(unint64_t)a3;
- (NSDate)systemStateChangeTime;
- (NSMutableArray)stateChangeNotifications;
- (NSMutableDictionary)entryKeyToStateMap;
- (NSMutableDictionary)executeBlockCache;
- (NSMutableDictionary)stateIDToStateMap;
- (OS_dispatch_queue)workQueue;
- (PLStateTrackingComposition)init;
- (id)getCurrState:(unint64_t)a3;
- (id)getLastState:(unint64_t)a3;
- (id)getState:(unint64_t)a3 beforeDate:(id)a4;
- (id)getStateBeforeSystemStateChange:(unint64_t)a3;
- (id)getStateChangeTime:(unint64_t)a3;
- (unint64_t)stateChangeMask;
- (void)handleStateChange:(id)a3;
- (void)initializeState;
- (void)registerForListeners;
- (void)registerForStates:(unint64_t)a3 withOperator:(id)a4 withBlock:(id)a5;
- (void)setEntryKeyToStateMap:(id)a3;
- (void)setExecuteBlockCache:(id)a3;
- (void)setStateChangeMask:(unint64_t)a3;
- (void)setStateChangeNotifications:(id)a3;
- (void)setStateIDToStateMap:(id)a3;
- (void)setSystemStateChangeTime:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)triggerBlocks;
@end

@implementation PLStateTrackingComposition

- (id)getState:(unint64_t)a3 beforeDate:(id)a4
{
  id v6 = a4;
  v7 = [(PLStateTrackingComposition *)self stateIDToStateMap];
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    v10 = [v9 stateChangeTime];

    if (v10)
    {
      v11 = [v9 stateChangeTime];
      [v6 timeIntervalSinceDate:v11];
      double v13 = v12;

      v14 = PLLogCommon();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (v13 <= 0.0)
      {
        if (v15) {
          -[PLStateTrackingComposition getState:beforeDate:](v9);
        }

        uint64_t v16 = [v9 lastValue];
      }
      else
      {
        if (v15) {
          -[PLStateTrackingComposition getState:beforeDate:](v9);
        }

        uint64_t v16 = [v9 currValue];
      }
      v10 = (void *)v16;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSMutableDictionary)stateIDToStateMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

uint64_t __50__PLStateTrackingComposition_registerForListeners__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleStateChange:a2];
}

- (void)handleStateChange:(id)a3
{
  v4 = [a3 objectForKey:@"entry"];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 entryKey];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = [v5 entryDate];

      if (v8)
      {
        [(PLStateTrackingComposition *)self setStateChangeMask:0];
        v9 = [(PLStateTrackingComposition *)self entryKeyToStateMap];
        v10 = [v5 entryKey];
        v11 = [v9 objectForKeyedSubscript:v10];
        uint64_t v12 = MEMORY[0x1E4F143A8];
        uint64_t v13 = 3221225472;
        v14 = __48__PLStateTrackingComposition_handleStateChange___block_invoke;
        BOOL v15 = &unk_1E6255C78;
        id v16 = v5;
        v17 = self;
        [v11 enumerateObjectsUsingBlock:&v12];

        if ([(PLStateTrackingComposition *)self stateChangeMask]) {
          [(PLStateTrackingComposition *)self triggerBlocks];
        }
      }
    }
  }
}

- (unint64_t)stateChangeMask
{
  return self->_stateChangeMask;
}

- (void)setStateChangeMask:(unint64_t)a3
{
  self->_stateChangeMask = a3;
}

- (NSMutableDictionary)entryKeyToStateMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

void __48__PLStateTrackingComposition_handleStateChange___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 updateWithEntry:*(void *)(a1 + 32)])
  {
    objc_msgSend(*(id *)(a1 + 40), "setStateChangeMask:", objc_msgSend(*(id *)(a1 + 40), "stateChangeMask") | objc_msgSend(v6, "stateId"));
    v3 = [*(id *)(a1 + 40) systemStateChangeTime];
    v4 = [v6 stateChangeTime];
    v5 = [v3 laterDate:v4];
    [*(id *)(a1 + 40) setSystemStateChangeTime:v5];
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_49);
  }
  v2 = (void *)sharedInstance_instance_3;
  return v2;
}

uint64_t __44__PLStateTrackingComposition_sharedInstance__block_invoke()
{
  sharedInstance_instance_3 = objc_alloc_init(PLStateTrackingComposition);
  return MEMORY[0x1F41817F8]();
}

- (PLStateTrackingComposition)init
{
  v19.receiver = self;
  v19.super_class = (Class)PLStateTrackingComposition;
  v2 = [(PLStateTrackingComposition *)&v19 init];
  if (v2)
  {
    uint64_t v3 = +[PLUtilities workQueueForClass:objc_opt_class()];
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    executeBlockCache = v2->_executeBlockCache;
    v2->_executeBlockCache = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stateChangeNotifications = v2->_stateChangeNotifications;
    v2->_stateChangeNotifications = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    stateIDToStateMap = v2->_stateIDToStateMap;
    v2->_stateIDToStateMap = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    entryKeyToStateMap = v2->_entryKeyToStateMap;
    v2->_entryKeyToStateMap = v11;

    v2->_stateChangeMask = 0;
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] distantPast];
    systemStateChangeTime = v2->_systemStateChangeTime;
    v2->_systemStateChangeTime = (NSDate *)v13;

    BOOL v15 = [(PLStateTrackingComposition *)v2 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__PLStateTrackingComposition_init__block_invoke;
    block[3] = &unk_1E62538C8;
    v18 = v2;
    dispatch_async_and_wait(v15, block);
  }
  return v2;
}

uint64_t __34__PLStateTrackingComposition_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) initializeState];
  v2 = *(void **)(a1 + 32);
  return [v2 registerForListeners];
}

+ (void)registerState:(Class)a3
{
  v4 = (void *)_registeredStates;
  if (!_registeredStates)
  {
    uint64_t v5 = objc_opt_new();
    id v6 = (void *)_registeredStates;
    _registeredStates = v5;

    v4 = (void *)_registeredStates;
  }
  [v4 addObject:a3];
}

- (void)initializeState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PLStateTrackingComposition_initializeState__block_invoke;
  v2[3] = &unk_1E6255C00;
  v2[4] = self;
  [(id)_registeredStates enumerateObjectsUsingBlock:v2];
}

void __45__PLStateTrackingComposition_initializeState__block_invoke(uint64_t a1, objc_class *a2)
{
  id v14 = objc_alloc_init(a2);
  if (v14)
  {
    uint64_t v3 = [*(id *)(a1 + 32) stateIDToStateMap];
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "stateId"));
    [v3 setObject:v14 forKey:v4];

    uint64_t v5 = [*(id *)(a1 + 32) entryKeyToStateMap];
    id v6 = [v14 entryKey];
    v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v9 = [*(id *)(a1 + 32) entryKeyToStateMap];
      v10 = [v14 entryKey];
      [v9 setObject:v8 forKeyedSubscript:v10];
    }
    v11 = [*(id *)(a1 + 32) entryKeyToStateMap];
    uint64_t v12 = [v14 entryKey];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
    [v13 addObject:v14];
  }
}

- (void)registerForListeners
{
  uint64_t v3 = [(PLStateTrackingComposition *)self entryKeyToStateMap];
  v4 = [v3 allKeys];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PLStateTrackingComposition_registerForListeners__block_invoke;
  v5[3] = &unk_1E6255990;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __50__PLStateTrackingComposition_registerForListeners__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [PLEntryNotificationOperatorComposition alloc];
  uint64_t v5 = [*(id *)(a1 + 32) workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PLStateTrackingComposition_registerForListeners__block_invoke_2;
  v8[3] = &unk_1E6253970;
  v8[4] = *(void *)(a1 + 32);
  id v6 = [(PLEntryNotificationOperatorComposition *)v4 initWithWorkQueue:v5 forEntryKey:v3 withBlock:v8];

  v7 = [*(id *)(a1 + 32) stateChangeNotifications];
  [v7 addObject:v6];
}

- (void)registerForStates:(unint64_t)a3 withOperator:(id)a4 withBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((a3 & 0x80) == 0)
  {
    v10 = [(PLStateTrackingComposition *)self workQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__PLStateTrackingComposition_registerForStates_withOperator_withBlock___block_invoke;
    v11[3] = &unk_1E6255C28;
    v11[4] = self;
    unint64_t v14 = a3;
    id v12 = v8;
    id v13 = v9;
    dispatch_async_and_wait(v10, v11);
  }
}

void __71__PLStateTrackingComposition_registerForStates_withOperator_withBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) executeBlockCache];
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v4 = [v2 objectForKey:v3];

  if (!v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) executeBlockCache];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    [v5 setObject:v6 forKey:v7];
  }
  id v8 = [OperatorTask alloc];
  id v9 = [*(id *)(a1 + 40) workQueue];
  id v13 = [(OperatorTask *)v8 initWithQueue:v9 withBlock:*(void *)(a1 + 48)];

  v10 = [*(id *)(a1 + 32) executeBlockCache];
  v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  id v12 = [v10 objectForKeyedSubscript:v11];
  [v12 addObject:v13];
}

- (void)triggerBlocks
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Scheduled all agent blocks", v1, 2u);
}

void __43__PLStateTrackingComposition_triggerBlocks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedIntegerValue];
  if (([*(id *)(a1 + 32) stateChangeMask] & v3) != 0)
  {
    v4 = [*(id *)(a1 + 32) executeBlockCache];
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:v3];
    id v6 = [v4 objectForKeyedSubscript:v5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__PLStateTrackingComposition_triggerBlocks__block_invoke_2;
    v7[3] = &unk_1E6255C50;
    id v8 = *(id *)(a1 + 40);
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

void __43__PLStateTrackingComposition_triggerBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  uint64_t v5 = [v3 operatorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PLStateTrackingComposition_triggerBlocks__block_invoke_3;
  block[3] = &unk_1E62538C8;
  id v8 = v3;
  id v6 = v3;
  dispatch_group_async(v4, v5, block);
}

void __43__PLStateTrackingComposition_triggerBlocks__block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) operatorBlock];
  v1[2]();
}

- (BOOL)stateChanged:(unint64_t)a3
{
  return ([(PLStateTrackingComposition *)self stateChangeMask] & a3) != 0;
}

- (id)getStateChangeTime:(unint64_t)a3
{
  v4 = [(PLStateTrackingComposition *)self stateIDToStateMap];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [v6 stateChangeTime];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getLastState:(unint64_t)a3
{
  v4 = [(PLStateTrackingComposition *)self stateIDToStateMap];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [v6 lastValue];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getCurrState:(unint64_t)a3
{
  v4 = [(PLStateTrackingComposition *)self stateIDToStateMap];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [v6 currValue];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getStateBeforeSystemStateChange:(unint64_t)a3
{
  uint64_t v5 = [(PLStateTrackingComposition *)self stateIDToStateMap];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    if ([(PLStateTrackingComposition *)self stateChanged:a3]) {
      [v7 lastValue];
    }
    else {
    id v8 = [v7 currValue];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (NSMutableDictionary)executeBlockCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExecuteBlockCache:(id)a3
{
}

- (NSMutableArray)stateChangeNotifications
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStateChangeNotifications:(id)a3
{
}

- (NSDate)systemStateChangeTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSystemStateChangeTime:(id)a3
{
}

- (void)setStateIDToStateMap:(id)a3
{
}

- (void)setEntryKeyToStateMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryKeyToStateMap, 0);
  objc_storeStrong((id *)&self->_stateIDToStateMap, 0);
  objc_storeStrong((id *)&self->_systemStateChangeTime, 0);
  objc_storeStrong((id *)&self->_stateChangeNotifications, 0);
  objc_storeStrong((id *)&self->_executeBlockCache, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)getState:(void *)a1 beforeDate:.cold.1(void *a1)
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  v4 = [a1 currValue];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_13(&dword_1BBD2F000, v5, v6, "State: %@ Current Value: %@", v7, v8, v9, v10, v11);
}

- (void)getState:(void *)a1 beforeDate:.cold.2(void *a1)
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  v4 = [a1 lastValue];
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_13(&dword_1BBD2F000, v5, v6, "State: %@ Last Value: %@", v7, v8, v9, v10, v11);
}

@end