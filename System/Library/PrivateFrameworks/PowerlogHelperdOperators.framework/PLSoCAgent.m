@interface PLSoCAgent
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionLifetimeServoStats;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (PLSoCAgent)init;
- (id)requestLTSStats;
- (void)logEventPointLifetimeServoStats:(id)a3;
- (void)registerForTaskingEndNotification;
- (void)registerForTaskingStartNotification;
- (void)requestLTSStats;
- (void)taskingEndNotificationReceived:(id)a3;
- (void)taskingStartNotificationReceived:(id)a3;
@end

@implementation PLSoCAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSoCAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"LifetimeServoStats";
  objc_super v2 = [a1 entryEventPointDefinitionLifetimeServoStats];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointDefinitionLifetimeServoStats
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4012338;
  v14[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"VTBucket";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"VTCount";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLSoCAgent)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLSoCAgent;
  uint64_t v2 = [(PLAgent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PLSoCAgent *)v2 registerForTaskingStartNotification];
  }
  return v3;
}

- (void)registerForTaskingStartNotification
{
  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel_taskingStartNotificationReceived_ name:*MEMORY[0x1E4F92DC0] object:0];
  }
}

- (void)registerForTaskingEndNotification
{
  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel_taskingEndNotificationReceived_ name:*MEMORY[0x1E4F92DB0] object:0];
  }
}

- (void)taskingStartNotificationReceived:(id)a3
{
  v4 = PLLogSoC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_DEFAULT, "Received tasking start notification", buf, 2u);
  }

  objc_super v5 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PLSoCAgent_taskingStartNotificationReceived___block_invoke;
  block[3] = &unk_1E6E47848;
  block[4] = self;
  dispatch_async(v5, block);
}

void __47__PLSoCAgent_taskingStartNotificationReceived___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) requestLTSStats];
  id v3 = PLLogSoC();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __47__PLSoCAgent_taskingStartNotificationReceived___block_invoke_cold_2((uint64_t)v2, v4);
    }

    [*(id *)(a1 + 32) logEventPointLifetimeServoStats:v2];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __47__PLSoCAgent_taskingStartNotificationReceived___block_invoke_cold_1();
    }
  }
}

- (void)taskingEndNotificationReceived:(id)a3
{
  v4 = PLLogSoC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_DEFAULT, "Received tasking end notification", buf, 2u);
  }

  objc_super v5 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PLSoCAgent_taskingEndNotificationReceived___block_invoke;
  block[3] = &unk_1E6E47848;
  block[4] = self;
  dispatch_async(v5, block);
}

void __45__PLSoCAgent_taskingEndNotificationReceived___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) requestLTSStats];
  id v3 = PLLogSoC();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __47__PLSoCAgent_taskingStartNotificationReceived___block_invoke_cold_2((uint64_t)v2, v4);
    }

    [*(id *)(a1 + 32) logEventPointLifetimeServoStats:v2];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __47__PLSoCAgent_taskingStartNotificationReceived___block_invoke_cold_1();
    }
  }
}

- (id)requestLTSStats
{
  mach_service = xpc_connection_create_mach_service("com.apple.powerdatad", MEMORY[0x1E4F14428], 0);
  id v3 = mach_service;
  if (!mach_service)
  {
    v6 = PLLogSoC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PLSoCAgent requestLTSStats]();
    }
    goto LABEL_12;
  }
  v4 = (void *)MEMORY[0x1E4F14428];
  xpc_connection_set_target_queue(mach_service, MEMORY[0x1E4F14428]);

  xpc_connection_set_event_handler(v3, &__block_literal_global_32);
  xpc_connection_resume(v3);
  objc_super v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5)
  {
    v6 = PLLogSoC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PLSoCAgent requestLTSStats]();
    }
LABEL_12:
    v10 = 0;
    goto LABEL_19;
  }
  v6 = v5;
  xpc_dictionary_set_BOOL(v5, "LTSStats", 1);
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v3, v6);
  v8 = v7;
  if (v7)
  {
    if (MEMORY[0x1E4E7F750](v7) == MEMORY[0x1E4F14590])
    {
      v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    }
    else
    {
      v9 = PLLogSoC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PLSoCAgent requestLTSStats].cold.4();
      }

      v10 = 0;
    }
    xpc_connection_cancel(v3);
  }
  else
  {
    v11 = PLLogSoC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PLSoCAgent requestLTSStats]();
    }

    v10 = 0;
  }

LABEL_19:
  return v10;
}

- (void)logEventPointLifetimeServoStats:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 now];
  xpc_object_t v7 = [v6 convertFromSystemToMonotonic];

  v8 = [v5 objectForKeyedSubscript:@"LTSStats"];

  v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"LifetimeServoStats"];
  v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __46__PLSoCAgent_logEventPointLifetimeServoStats___block_invoke;
  v18 = &unk_1E6E48BD8;
  id v11 = v9;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  [v8 enumerateKeysAndObjectsUsingBlock:&v15];
  if (objc_msgSend(v13, "count", v15, v16, v17, v18))
  {
    id v22 = v11;
    v23[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [(PLOperator *)self logEntries:v14 withGroupID:v11];
  }
}

void __46__PLSoCAgent_logEventPointLifetimeServoStats___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PLSoCAgent_logEventPointLifetimeServoStats___block_invoke_2;
  v7[3] = &unk_1E6E4A540;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = v5;
  id v11 = a1[6];
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __46__PLSoCAgent_logEventPointLifetimeServoStats___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F929D0];
  id v6 = a3;
  id v7 = a2;
  id v12 = (id)[[v5 alloc] initWithEntryKey:*(void *)(a1 + 32) withDate:*(void *)(a1 + 40)];
  id v8 = [NSString stringWithFormat:@"%@_%@", *(void *)(a1 + 48), v7];

  [v12 setObject:v8 forKeyedSubscript:@"VTBucket"];
  id v9 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v10 = [v6 unsignedLongLongValue];

  id v11 = [v9 numberWithUnsignedLongLong:v10];
  [v12 setObject:v11 forKeyedSubscript:@"VTCount"];

  [*(id *)(a1 + 56) addObject:v12];
}

void __47__PLSoCAgent_taskingStartNotificationReceived___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "LTSStats are unavailable", v2, v3, v4, v5, v6);
}

void __47__PLSoCAgent_taskingStartNotificationReceived___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "Got callback for PLSoCAgent_EventPoint_LifetimeServoStats: %@", (uint8_t *)&v2, 0xCu);
}

- (void)requestLTSStats
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Received an error in response", v2, v3, v4, v5, v6);
}

@end