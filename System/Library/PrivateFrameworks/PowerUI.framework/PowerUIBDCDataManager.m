@interface PowerUIBDCDataManager
+ (PowerUIBDCDataManager)sharedInstance;
- (BOOL)promptBDCToQueryState:(id)a3;
- (NSMutableArray)dataQueue;
- (OS_dispatch_semaphore)bdcCallbackSemaphore;
- (OS_os_log)log;
- (PowerUIBDCDataManager)init;
- (id)bdcSemaphoreToUse;
- (id)getBDCDataDictTemplate;
- (id)getNextBDCDataDict;
- (os_unfair_lock_s)bdcDataLock;
- (void)getNextBDCDataDict;
- (void)setBdcCallbackSemaphore:(id)a3;
- (void)setBdcDataLock:(os_unfair_lock_s)a3;
- (void)setDataQueue:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation PowerUIBDCDataManager

- (PowerUIBDCDataManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)PowerUIBDCDataManager;
  v2 = [(PowerUIBDCDataManager *)&v12 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerui.smartcharging", "bdcDataManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "BDCDataManager intializing...", v11, 2u);
    }
    v2->_bdcDataLock._os_unfair_lock_opaque = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    bdcCallbackSemaphore = v2->_bdcCallbackSemaphore;
    v2->_bdcCallbackSemaphore = (OS_dispatch_semaphore *)v6;

    uint64_t v8 = [MEMORY[0x263EFF980] array];
    dataQueue = v2->_dataQueue;
    v2->_dataQueue = (NSMutableArray *)v8;
  }
  return v2;
}

+ (PowerUIBDCDataManager)sharedInstance
{
  if (sharedInstance_once_1 != -1) {
    dispatch_once(&sharedInstance_once_1, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance_instance_1;
  return (PowerUIBDCDataManager *)v2;
}

void __39__PowerUIBDCDataManager_sharedInstance__block_invoke()
{
  if (!sharedInstance_instance_1)
  {
    sharedInstance_instance_1 = objc_alloc_init(PowerUIBDCDataManager);
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)promptBDCToQueryState:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_bdcDataLock);
  [(NSMutableArray *)self->_dataQueue addObject:v4];
  os_unfair_lock_unlock(&self->_bdcDataLock);
  v5 = [(PowerUIBDCDataManager *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_INFO, "Prompt BDC to record current state", buf, 2u);
  }

  notify_post((const char *)[@"com.apple.smartcharging.charging" UTF8String]);
  bdcCallbackSemaphore = self->_bdcCallbackSemaphore;
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  intptr_t v8 = dispatch_semaphore_wait(bdcCallbackSemaphore, v7);
  v9 = [(PowerUIBDCDataManager *)self log];
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PowerUIBDCDataManager promptBDCToQueryState:](v10);
    }

    os_unfair_lock_lock(&self->_bdcDataLock);
    if ([(NSMutableArray *)self->_dataQueue count]) {
      [(NSMutableArray *)self->_dataQueue removeObject:v4];
    }
    os_unfair_lock_unlock(&self->_bdcDataLock);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v12 = 0;
      _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_INFO, "BDC received current PowerUI state", v12, 2u);
    }
  }
  return v8 == 0;
}

- (id)bdcSemaphoreToUse
{
  return self->_bdcCallbackSemaphore;
}

- (id)getNextBDCDataDict
{
  p_bdcDataLock = &self->_bdcDataLock;
  os_unfair_lock_lock(&self->_bdcDataLock);
  if ([(NSMutableArray *)self->_dataQueue count])
  {
    id v4 = [(NSMutableArray *)self->_dataQueue objectAtIndex:0];
    [(NSMutableArray *)self->_dataQueue removeObjectAtIndex:0];
    os_unfair_lock_unlock(p_bdcDataLock);
  }
  else
  {
    os_unfair_lock_unlock(p_bdcDataLock);
    v5 = [(PowerUIBDCDataManager *)self log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PowerUIBDCDataManager getNextBDCDataDict](v5);
    }

    id v4 = [(PowerUIBDCDataManager *)self getBDCDataDictTemplate];
  }
  return v4;
}

- (id)getBDCDataDictTemplate
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:&unk_26D385A20 forKeyedSubscript:@"MessageVersion"];
  [v2 setObject:&unk_26D385A38 forKeyedSubscript:@"ChargingState"];
  [v2 setObject:&unk_26D385A38 forKeyedSubscript:@"InflowState"];
  [v2 setObject:&unk_26D385A38 forKeyedSubscript:@"ChargeLimit"];
  [v2 setObject:&unk_26D385A38 forKeyedSubscript:@"CheckPoint"];
  [v2 setObject:&unk_26D385A38 forKeyedSubscript:@"ModeOfOperation"];
  [v2 setObject:&unk_26D385A38 forKeyedSubscript:@"DecisionMaker"];
  return v2;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (os_unfair_lock_s)bdcDataLock
{
  return self->_bdcDataLock;
}

- (void)setBdcDataLock:(os_unfair_lock_s)a3
{
  self->_bdcDataLock = a3;
}

- (OS_dispatch_semaphore)bdcCallbackSemaphore
{
  return self->_bdcCallbackSemaphore;
}

- (void)setBdcCallbackSemaphore:(id)a3
{
}

- (NSMutableArray)dataQueue
{
  return self->_dataQueue;
}

- (void)setDataQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_bdcCallbackSemaphore, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)promptBDCToQueryState:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22135E000, log, OS_LOG_TYPE_ERROR, "BDC Error: BDC timed out calling back for PowerUI state", v1, 2u);
}

- (void)getNextBDCDataDict
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22135E000, log, OS_LOG_TYPE_ERROR, "Trying to access next BDC data dict, but none available", v1, 2u);
}

@end