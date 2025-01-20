@interface TFLogConfiguration
+ (id)defaultConfiguration;
- (NSString)category;
- (NSString)subsystem;
- (OS_dispatch_queue)internalLoggerAccessQueue;
- (OS_os_log)generatedLogger;
- (OS_os_log)internalLogger;
- (TFLogConfiguration)initWithSubsystem:(id)a3 category:(id)a4;
- (void)setInternalLogger:(id)a3;
@end

@implementation TFLogConfiguration

- (TFLogConfiguration)initWithSubsystem:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TFLogConfiguration;
  v9 = [(TFLogConfiguration *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subsystem, a3);
    objc_storeStrong((id *)&v10->_category, a4);
    internalLogger = v10->_internalLogger;
    v10->_internalLogger = 0;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.TestFlightCore.TFLogConfiguration", MEMORY[0x263EF83A8]);
    internalLoggerAccessQueue = v10->_internalLoggerAccessQueue;
    v10->_internalLoggerAccessQueue = (OS_dispatch_queue *)v12;
  }
  return v10;
}

+ (id)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1) {
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)defaultConfiguration_configuration;

  return v2;
}

uint64_t __42__TFLogConfiguration_defaultConfiguration__block_invoke()
{
  defaultConfiguration_configuration = [[TFLogConfiguration alloc] initWithSubsystem:@"com.apple.TestFlightCore" category:@"default"];

  return MEMORY[0x270F9A758]();
}

- (OS_os_log)generatedLogger
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  v3 = [(TFLogConfiguration *)self internalLoggerAccessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__TFLogConfiguration_generatedLogger__block_invoke;
  block[3] = &unk_26468E930;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v3, block);

  v4 = (void *)v11[5];
  if (!v4)
  {
    v5 = [(TFLogConfiguration *)self internalLoggerAccessQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__TFLogConfiguration_generatedLogger__block_invoke_2;
    v8[3] = &unk_26468E930;
    v8[4] = self;
    v8[5] = &v10;
    dispatch_barrier_sync(v5, v8);

    v4 = (void *)v11[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v10, 8);

  return (OS_os_log *)v6;
}

uint64_t __37__TFLogConfiguration_generatedLogger__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) internalLogger];

  return MEMORY[0x270F9A758]();
}

void __37__TFLogConfiguration_generatedLogger__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalLogger];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = [*(id *)(a1 + 32) subsystem];
    id v6 = (const char *)[v5 UTF8String];
    id v7 = [*(id *)(a1 + 32) category];
    os_log_t v8 = os_log_create(v6, (const char *)[v7 UTF8String]);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v11 setInternalLogger:v12];
  }
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (OS_os_log)internalLogger
{
  return self->_internalLogger;
}

- (void)setInternalLogger:(id)a3
{
}

- (OS_dispatch_queue)internalLoggerAccessQueue
{
  return self->_internalLoggerAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalLoggerAccessQueue, 0);
  objc_storeStrong((id *)&self->_internalLogger, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end