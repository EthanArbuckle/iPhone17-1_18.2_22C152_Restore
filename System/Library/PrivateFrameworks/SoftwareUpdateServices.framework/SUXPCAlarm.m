@interface SUXPCAlarm
- (SUXPCAlarm)init;
- (void)cancelAlarm:(id)a3;
- (void)cancelInstallAlertAlarm;
- (void)scheduleAlarm:(id)a3 date:(id)a4;
- (void)scheduleInstallAlertAlarm:(id)a3;
@end

@implementation SUXPCAlarm

- (SUXPCAlarm)init
{
  v8.receiver = self;
  v8.super_class = (Class)SUXPCAlarm;
  v2 = [(SUXPCAlarm *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SUCSScheduler);
    csScheduler = v2->_csScheduler;
    v2->_csScheduler = v3;

    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __18__SUXPCAlarm_init__block_invoke;
    handler[3] = &unk_26447DB98;
    v7 = v2;
    xpc_set_event_stream_handler("com.apple.alarm", MEMORY[0x263EF83A0], handler);
  }
  return v2;
}

uint64_t __18__SUXPCAlarm_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  SULogInfo(@"Handling wakeup alarm", v4, v5, v6, v7, v8, v9, v10, v28);
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86C8]);

  if (!string) {
    SULogInfo(@"No event name", v12, v13, v14, v15, v16, v17, v18, v29);
  }
  uint64_t result = strcmp(string, (const char *)[@"installAlertAlarmName" UTF8String]);
  if (!result)
  {
    SULogInfo(@"Registering ContextStore Predicates", v20, v21, v22, v23, v24, v25, v26, v29);
    v27 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v27 registerInstallAlertConditionsWithHandler:&__block_literal_global_10];
  }
  return result;
}

uint64_t __18__SUXPCAlarm_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"ContextStore reports ready for installation UI", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 1;
}

- (void)scheduleInstallAlertAlarm:(id)a3
{
}

- (void)cancelInstallAlertAlarm
{
  [(SUXPCAlarm *)self cancelAlarm:@"installAlertAlarmName"];
  csScheduler = self->_csScheduler;

  [(SUCSScheduler *)csScheduler unregisterInstallationAlertAction];
}

- (void)scheduleAlarm:(id)a3 date:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  SULogInfo(@"Scheduling alarm: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  [v5 timeIntervalSince1970];
  double v15 = v14;

  id v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v17, "Date", (uint64_t)(v15 * 1000000000.0));
  id v16 = v6;
  [v16 UTF8String];

  xpc_set_event();
}

- (void)cancelAlarm:(id)a3
{
  id v3 = a3;
  SULogInfo(@"Canceling alarm: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  id v11 = v3;
  [v11 UTF8String];

  xpc_set_event();
}

- (void).cxx_destruct
{
}

@end