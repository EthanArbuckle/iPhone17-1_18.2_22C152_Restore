@interface NSObject(NPHIdleTime)
+ (uint64_t)performBlockAtIdle:()NPHIdleTime;
+ (void)NPHRequestIdleTimeNotification;
+ (void)_NPHIdleTimeNotification:()NPHIdleTime;
@end

@implementation NSObject(NPHIdleTime)

+ (uint64_t)performBlockAtIdle:()NPHIdleTime
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "+[NSObject(NPHIdleTime) performBlockAtIdle:]";
    _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__NSObject_NPHIdleTime__performBlockAtIdle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (performBlockAtIdle__onceToken != -1) {
    dispatch_once(&performBlockAtIdle__onceToken, block);
  }
  v6 = (void *)sIdleBlocks;
  v7 = (void *)[v4 copy];

  [v6 addObject:v7];
  return [a1 NPHRequestIdleTimeNotification];
}

+ (void)NPHRequestIdleTimeNotification
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = nph_general_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "+[NSObject(NPHIdleTime) NPHRequestIdleTimeNotification]";
    _os_log_impl(&dword_234652000, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }

  v1 = [MEMORY[0x263F089F8] notificationWithName:@"NPHIdleNotification" object:0];
  v2 = [MEMORY[0x263F08A10] defaultQueue];
  [v2 enqueueNotification:v1 postingStyle:1];
}

+ (void)_NPHIdleTimeNotification:()NPHIdleTime
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = nph_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "+[NSObject(NPHIdleTime) _NPHIdleTimeNotification:]";
    __int16 v10 = 2048;
    uint64_t v11 = [(id)sIdleBlocks count];
    _os_log_impl(&dword_234652000, v2, OS_LOG_TYPE_DEFAULT, "%s sIdleBlocks.count:%lu", (uint8_t *)&v8, 0x16u);
  }

  int v3 = [(id)sIdleBlocks firstObject];
  if (v3)
  {
    id v4 = [MEMORY[0x263EFF910] date];
    v3[2](v3);
    [v4 timeIntervalSinceNow];
    double v6 = v5 * -1000.0;
    if (v5 * -1000.0 > 100.0)
    {
      v7 = nph_general_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        v9 = "+[NSObject(NPHIdleTime) _NPHIdleTimeNotification:]";
        __int16 v10 = 2048;
        uint64_t v11 = *(void *)&v6;
        _os_log_impl(&dword_234652000, v7, OS_LOG_TYPE_DEFAULT, "******* %s BLOCKING MAIN THREAD: %f", (uint8_t *)&v8, 0x16u);
      }
    }
    [(id)sIdleBlocks removeObjectAtIndex:0];
    if ([(id)sIdleBlocks count]) {
      [a1 NPHRequestIdleTimeNotification];
    }
  }
}

@end