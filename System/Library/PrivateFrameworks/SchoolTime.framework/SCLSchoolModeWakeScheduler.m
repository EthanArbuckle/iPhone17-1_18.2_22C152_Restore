@interface SCLSchoolModeWakeScheduler
- (void)cancelWake;
- (void)scheduleWakeForDate:(id)a3;
@end

@implementation SCLSchoolModeWakeScheduler

- (void)scheduleWakeForDate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:v4];
  uint64_t v6 = v5;

  v7 = scl_framework_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "com.apple.schooltime.wake.activity";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_22B7B4000, v7, OS_LOG_TYPE_DEFAULT, "Registering xpc activity %s for %@", buf, 0x16u);
  }

  v8 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __50__SCLSchoolModeWakeScheduler_scheduleWakeForDate___block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = v6;
  xpc_activity_register("com.apple.schooltime.wake.activity", v8, handler);
}

void __50__SCLSchoolModeWakeScheduler_scheduleWakeForDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  uint64_t v5 = scl_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = (const char *)v3;
    __int16 v14 = 2048;
    xpc_activity_state_t v15 = state;
    _os_log_impl(&dword_22B7B4000, v5, OS_LOG_TYPE_INFO, "registered & received xpc activity %@ with state %ld", (uint8_t *)&v12, 0x16u);
  }

  if (!xpc_activity_get_state(v3))
  {
    v10 = scl_framework_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      xpc_activity_state_t v11 = *(void *)(a1 + 32);
      int v12 = 136315394;
      id v13 = "com.apple.schooltime.wake.activity";
      __int16 v14 = 2048;
      xpc_activity_state_t v15 = v11;
      _os_log_impl(&dword_22B7B4000, v10, OS_LOG_TYPE_INFO, "%s checked in, setting criteria wake interval %f", (uint8_t *)&v12, 0x16u);
    }

    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x263EF81A0], (uint64_t)*(double *)(a1 + 32));
    xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x263EF81C0], 1);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x263EF82A0], 0);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x263EF82E8], 1);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x263EF8180], 1);
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x263EF82D8], 0);
    xpc_activity_set_criteria(v3, v8);
    goto LABEL_17;
  }
  if (xpc_activity_should_defer(v3))
  {
    BOOL v6 = xpc_activity_set_state(v3, 3);
    v7 = scl_framework_log();
    v8 = v7;
    if (!v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __50__SCLSchoolModeWakeScheduler_scheduleWakeForDate___block_invoke_cold_1(v8);
      }
      goto LABEL_17;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      id v13 = "com.apple.schooltime.wake.activity";
      v9 = "%s deferred";
LABEL_14:
      _os_log_impl(&dword_22B7B4000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, 0xCu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (xpc_activity_get_state(v3) == 2)
  {
    v8 = scl_framework_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      id v13 = "com.apple.schooltime.wake.activity";
      v9 = "%s asked to run";
      goto LABEL_14;
    }
LABEL_17:
  }
}

- (void)cancelWake
{
}

void __50__SCLSchoolModeWakeScheduler_scheduleWakeForDate___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "com.apple.schooltime.wake.activity";
  _os_log_error_impl(&dword_22B7B4000, log, OS_LOG_TYPE_ERROR, "xpc_activity_set_state(%s, XPC_ACTIVITY_STATE_DEFER) failed", (uint8_t *)&v1, 0xCu);
}

@end