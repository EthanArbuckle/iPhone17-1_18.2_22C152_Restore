@interface SESAlarm
+ (BOOL)isAlarmSet:(id)a3;
+ (BOOL)registerAlarm:(id)a3 handler:(id)a4;
+ (id)sharedObject;
+ (void)clearAlarm:(id)a3;
+ (void)deregisterAlarm:(id)a3;
+ (void)kickoff;
+ (void)setAlarm:(id)a3 secondsFromNow:(double)a4;
- (SESAlarm)init;
- (void)_handleAlarmFired:(id)a3;
@end

@implementation SESAlarm

+ (id)sharedObject
{
  if (sharedObject_onceToken != -1) {
    dispatch_once(&sharedObject_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedObject_sharedObject;

  return v2;
}

uint64_t __24__SESAlarm_sharedObject__block_invoke()
{
  sharedObject_sharedObject = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (SESAlarm)init
{
  v15.receiver = self;
  v15.super_class = (Class)SESAlarm;
  v2 = [(SESAlarm *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.seserviced.alarm", v4);
    queue = v2->queue;
    v2->queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    registered = v2->registered;
    v2->registered = (NSMapTable *)v7;

    uint64_t v9 = objc_opt_new();
    pendingAlarms = v2->pendingAlarms;
    v2->pendingAlarms = (NSMutableSet *)v9;

    v11 = v2->queue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __16__SESAlarm_init__block_invoke;
    handler[3] = &unk_2655D6478;
    v14 = v2;
    xpc_set_event_stream_handler("com.apple.alarm", v11, handler);
  }
  return v2;
}

uint64_t __16__SESAlarm_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlarmFired:a2];
}

+ (void)kickoff
{
  id v2 = +[SESAlarm sharedObject];
}

- (void)_handleAlarmFired:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  queue = self->queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x263EF86C8]);

  if (string)
  {
    uint64_t v7 = [NSString stringWithUTF8String:string];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
      [v9 UTF8String];
      xpc_set_event();
      v10 = [(NSMapTable *)self->registered objectForKey:v9];
      v11 = SESDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412546;
        id v13 = v9;
        __int16 v14 = 1024;
        BOOL v15 = v10 == 0;
        _os_log_impl(&dword_263826000, v11, OS_LOG_TYPE_INFO, "Handling alarm %@ pended %d", (uint8_t *)&v12, 0x12u);
      }

      if (v10) {
        [v10 onAlarm:v9];
      }
      else {
        [(NSMutableSet *)self->pendingAlarms addObject:v9];
      }
    }
  }
}

+ (BOOL)registerAlarm:(id)a3 handler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v7 = +[SESAlarm sharedObject];
  dispatch_assert_queue_not_V2(v7[1]);
  v8 = v7[1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __34__SESAlarm_registerAlarm_handler___block_invoke;
  v16[3] = &unk_2655D64A0;
  id v9 = v7;
  v17 = v9;
  id v10 = v6;
  id v18 = v10;
  id v11 = v5;
  id v19 = v11;
  v20 = &v21;
  dispatch_sync(v8, v16);
  int v12 = SESDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = *((unsigned __int8 *)v22 + 24);
    *(_DWORD *)buf = 138412546;
    id v26 = v11;
    __int16 v27 = 1024;
    int v28 = v13;
    _os_log_impl(&dword_263826000, v12, OS_LOG_TYPE_INFO, "Registered alarm %@ wasPending %d", buf, 0x12u);
  }

  BOOL v14 = *((unsigned char *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  return v14;
}

uint64_t __34__SESAlarm_registerAlarm_handler___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
  uint64_t result = [*(id *)(a1[4] + 24) containsObject:a1[6]];
  if (result)
  {
    uint64_t result = [*(id *)(a1[4] + 24) removeObject:a1[6]];
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  return result;
}

+ (void)deregisterAlarm:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[SESAlarm sharedObject];
  dispatch_assert_queue_not_V2(v4[1]);
  id v5 = v4[1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28__SESAlarm_deregisterAlarm___block_invoke;
  v9[3] = &unk_2655D64C8;
  id v6 = v3;
  id v10 = v6;
  id v11 = v4;
  uint64_t v7 = v4;
  dispatch_sync(v5, v9);
  v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_263826000, v8, OS_LOG_TYPE_INFO, "Deregistered alarm %@", buf, 0xCu);
  }
}

uint64_t __28__SESAlarm_deregisterAlarm___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  xpc_set_event();
  [*(id *)(*(void *)(a1 + 40) + 16) removeObjectForKey:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 24);

  return [v3 removeObject:v2];
}

+ (void)clearAlarm:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[SESAlarm sharedObject];
  dispatch_assert_queue_not_V2(v4[1]);
  id v5 = v4[1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __23__SESAlarm_clearAlarm___block_invoke;
  v9[3] = &unk_2655D64C8;
  id v6 = v3;
  id v10 = v6;
  id v11 = v4;
  uint64_t v7 = v4;
  dispatch_sync(v5, v9);
  v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_263826000, v8, OS_LOG_TYPE_INFO, "Cleared alarm %@", buf, 0xCu);
  }
}

uint64_t __23__SESAlarm_clearAlarm___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  xpc_set_event();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 24);

  return [v3 removeObject:v2];
}

+ (void)setAlarm:(id)a3 secondsFromNow:(double)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[SESAlarm sharedObject];
  dispatch_assert_queue_not_V2(v6[1]);
  uint64_t v7 = v6[1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__SESAlarm_setAlarm_secondsFromNow___block_invoke;
  v10[3] = &unk_2655D64F0;
  double v12 = a4;
  id v8 = v5;
  id v11 = v8;
  dispatch_sync(v7, v10);
  id v9 = SESDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = (uint64_t)a4;
    _os_log_impl(&dword_263826000, v9, OS_LOG_TYPE_INFO, "Event %@ scheduled in %lld seconds", buf, 0x16u);
  }
}

void __36__SESAlarm_setAlarm_secondsFromNow___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF910] date];
  [v2 timeIntervalSince1970];
  uint64_t v4 = (uint64_t)(v3 + *(double *)(a1 + 40));

  id v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v5, "Date", 1000000000 * v4);
  [*(id *)(a1 + 32) UTF8String];
  xpc_set_event();
}

+ (BOOL)isAlarmSet:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SESAlarm sharedObject];
  dispatch_assert_queue_not_V2(v4[1]);
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = v4[1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __23__SESAlarm_isAlarmSet___block_invoke;
  v8[3] = &unk_2655D6518;
  id v9 = v3;
  id v10 = &v11;
  id v6 = v3;
  dispatch_sync(v5, v8);
  LOBYTE(v5) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

void __23__SESAlarm_isAlarmSet___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  uint64_t v2 = (void *)xpc_copy_event();
  if (v2)
  {
    id v5 = v2;
    BOOL v3 = xpc_dictionary_get_count(v2) == 0;
    uint64_t v2 = v5;
    char v4 = !v3;
  }
  else
  {
    char v4 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pendingAlarms, 0);
  objc_storeStrong((id *)&self->registered, 0);

  objc_storeStrong((id *)&self->queue, 0);
}

@end