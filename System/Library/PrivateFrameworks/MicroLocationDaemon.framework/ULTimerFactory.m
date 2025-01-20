@interface ULTimerFactory
+ (id)_instance;
+ (id)timerOnPrimaryQueueWithInterval:(double)a3 repeats:(BOOL)a4 block:(id)a5;
+ (id)timerWithQueue:(id)a3 Interval:(double)a4 repeats:(BOOL)a5 block:(id)a6;
+ (void)setPrimaryQueue:(id)a3;
- (OS_dispatch_queue)primaryQueue;
- (void)setPrimaryQueue:(id)a3;
@end

@implementation ULTimerFactory

+ (id)_instance
{
  if (_instance_onceToken != -1) {
    dispatch_once(&_instance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_instance_instance;
  return v2;
}

void __27__ULTimerFactory__instance__block_invoke()
{
  v0 = objc_alloc_init(ULTimerFactory);
  v1 = (void *)_instance_instance;
  _instance_instance = (uint64_t)v0;
}

+ (id)timerOnPrimaryQueueWithInterval:(double)a3 repeats:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = +[ULTimerFactory _instance];
  v10 = [v9 primaryQueue];

  if ([MEMORY[0x263F55810] isRunningInXCTestEnvironment]) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    if (v10) {
      goto LABEL_8;
    }
    +[ULTimerFactory timerOnPrimaryQueueWithInterval:repeats:block:]();
  }
  v10 = (void *)MEMORY[0x263EF83A0];
  id v12 = MEMORY[0x263EF83A0];
LABEL_8:
  v13 = [a1 timerWithQueue:v10 Interval:v5 repeats:v8 block:a3];

  return v13;
}

+ (id)timerWithQueue:(id)a3 Interval:(double)a4 repeats:(BOOL)a5 block:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a3;
  BOOL v11 = [[ULTimer alloc] initWithInterval:v6 repeats:v10 queue:v9 block:a4];

  return v11;
}

- (OS_dispatch_queue)primaryQueue
{
  return self->_primaryQueue;
}

- (void)setPrimaryQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)setPrimaryQueue:(id)a3
{
  id v7 = a3;
  v3 = +[ULTimerFactory _instance];
  id v4 = [v3 primaryQueue];

  if (([MEMORY[0x263F55810] isRunningInXCTestEnvironment] & 1) == 0 && v4 && v4 != v7) {
    +[ULTimerFactory(queueSetter) setPrimaryQueue:]();
  }
  BOOL v6 = +[ULTimerFactory _instance];
  [v6 setPrimaryQueue:v7];
}

+ (uint64_t)timerOnPrimaryQueueWithInterval:repeats:block:.cold.1()
{
  v0 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_25631F000, v1, v2, "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to create a timer on global queue without queue being set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, v22, v23, v24, v25, v26);
  }

  id v7 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_signpost_enabled(v7))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_25631F000, v8, v9, v10, "#ULTimerFactory, Trying to create a timer on global queue without queue being set", "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to create a timer on global queue without queue being set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11, v12, v22, v23, v24, v25, v26);
  }

  v13 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_25631F000, v14, v15, "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to create a timer on global queue without queue being set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v16, v17, v18, v19, v22, v23, v24, v25, v26);
  }

  uint64_t v20 = abort_report_np();
  return +[ULTimerFactory(queueSetter) setPrimaryQueue:](v20);
}

@end