@interface RMTimedDispatch
+ (id)timedDispatchAfterInterval:(double)a3 completionBlock:(id)a4;
- (BOOL)complete;
- (NSString)timerID;
- (id)initAfterInterval:(double)a3 completionBlock:(id)a4;
- (id)timerCompletionBlock;
- (void)cancel;
- (void)setComplete:(BOOL)a3;
- (void)setTimerCompletionBlock:(id)a3;
- (void)setTimerID:(id)a3;
@end

@implementation RMTimedDispatch

+ (id)timedDispatchAfterInterval:(double)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = [[RMTimedDispatch alloc] initAfterInterval:v5 completionBlock:a3];

  return v6;
}

- (id)initAfterInterval:(double)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)RMTimedDispatch;
  v7 = [(RMTimedDispatch *)&v25 init];
  if (v7)
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v8 UUIDString];
    timerID = v7->_timerID;
    v7->_timerID = (NSString *)v9;

    v7->_complete = 0;
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke;
    v22 = &unk_2646DD2C0;
    v11 = v7;
    v23 = v11;
    id v24 = v6;
    dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v19);
    id timerCompletionBlock = v11->_timerCompletionBlock;
    v11->_id timerCompletionBlock = v12;

    v14 = +[RMLog timeddispatch];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[RMTimedDispatch initAfterInterval:completionBlock:](v11, v14, a3);
    }

    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    if (timedDispatchQueue_onceToken != -1) {
      dispatch_once(&timedDispatchQueue_onceToken, &__block_literal_global_40);
    }
    v16 = (id)timedDispatchQueue_queue;
    v17 = [(RMTimedDispatch *)v11 timerCompletionBlock];
    dispatch_after(v15, v16, v17);
  }
  return v7;
}

void __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) timerID];

  v4 = +[RMLog timeddispatch];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke_cold_2(v2);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setComplete:1];
    [*(id *)(a1 + 32) setTimerCompletionBlock:0];
  }
  else
  {
    if (v5) {
      __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke_cold_1(v4);
    }
  }
}

- (void)cancel
{
  v1 = [a1 timerID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_6(&dword_224784000, v2, v3, "Timed dispatch cancelled: %{public}@", v4, v5, v6, v7, v8);
}

- (NSString)timerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimerID:(id)a3
{
}

- (BOOL)complete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (id)timerCompletionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setTimerCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timerCompletionBlock, 0);

  objc_storeStrong((id *)&self->_timerID, 0);
}

- (void)initAfterInterval:(double)a3 completionBlock:.cold.1(void *a1, NSObject *a2, double a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 timerID];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2048;
  double v8 = a3;
  _os_log_debug_impl(&dword_224784000, a2, OS_LOG_TYPE_DEBUG, "Timed dispatch starting: %{public}@ interval: %f", v6, 0x16u);
}

void __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_224784000, log, OS_LOG_TYPE_DEBUG, "Timed dispatch cancelled", v1, 2u);
}

void __53__RMTimedDispatch_initAfterInterval_completionBlock___block_invoke_cold_2(id *a1)
{
  v1 = [*a1 timerID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_6(&dword_224784000, v2, v3, "Timed dispatch executing: %{public}@", v4, v5, v6, v7, v8);
}

@end