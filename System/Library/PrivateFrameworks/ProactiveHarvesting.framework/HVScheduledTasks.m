@interface HVScheduledTasks
+ (id)sharedInstance;
+ (void)delayedBudgetedContentAvailable;
+ (void)registerScheduledTasks;
- (HVScheduledTasks)init;
- (void)_delayedBudgetedContentAvailable;
- (void)_registerHarvestTaskWithMinimumLevelOfService:(uint64_t)a1;
@end

@implementation HVScheduledTasks

- (HVScheduledTasks)init
{
  v7.receiver = self;
  v7.super_class = (Class)HVScheduledTasks;
  v2 = [(HVScheduledTasks *)&v7 init];
  v3 = v2;
  if (v2)
  {
    -[HVScheduledTasks _registerHarvestTaskWithMinimumLevelOfService:]((uint64_t)v2, 1);
    v4 = (void *)*MEMORY[0x263EF8188];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __40__HVScheduledTasks__registerCleanupTask__block_invoke;
    handler[3] = &unk_2647D5E78;
    handler[4] = v3;
    handler[5] = sel__registerCleanupTask;
    xpc_activity_register("com.apple.proactive.ProactiveHarvesting.Cleanup", v4, handler);
    v5 = hv_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_INFO, "HVScheduledTasks: registered task Cleanup", buf, 2u);
    }

    atomic_store(0, (unsigned __int8 *)&v3->_delayedBudgetedTaskScheduled);
    -[HVScheduledTasks _delayedBudgetedContentAvailable]((uint64_t)v3);
  }
  return v3;
}

- (void)_registerHarvestTaskWithMinimumLevelOfService:(uint64_t)a1
{
  char v2 = a2;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2 == 2)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF82A0], 0);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x263EF81D8], 0);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x263EF81A0], 0);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x263EF81C0], 900);
    xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF8180], 1);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x263EF8198], 1);
    xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x263EF81D0], "com.apple.proactive.ProactiveHarvesting");
    xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x263EF81C8], 1uLL);
    v5 = @"Harvest.DelayedBudgeted";
  }
  else if (a2 == 1)
  {
    xpc_object_t v4 = (id)*MEMORY[0x263EF8188];
    v5 = @"Harvest.PeriodicBackground";
  }
  else
  {
    xpc_object_t v4 = 0;
    v5 = 0;
  }
  id v6 = (id) [[NSString alloc] initWithFormat:@"%@.%@", @"com.apple.proactive.ProactiveHarvesting", v5];
  objc_super v7 = (const char *)[v6 UTF8String];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke;
  handler[3] = &unk_2647D5E00;
  char v13 = v2;
  uint64_t v11 = a1;
  v12 = sel__registerHarvestTaskWithMinimumLevelOfService_;
  v10 = v5;
  xpc_activity_register(v7, v4, handler);
  v8 = hv_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_226C41000, v8, OS_LOG_TYPE_INFO, "HVScheduledTasks: registered task %@", buf, 0xCu);
  }
}

- (void)_delayedBudgetedContentAvailable
{
  if (a1)
  {
    char v2 = hv_default_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226C41000, v2, OS_LOG_TYPE_INFO, "HVScheduledTasks: periodicBudgetContentAvailable", buf, 2u);
    }

    if ((atomic_exchange((atomic_uchar *volatile)(a1 + 8), 1u) & 1) == 0)
    {
      v3 = hv_default_log_handle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)xpc_object_t v4 = 0;
        _os_log_impl(&dword_226C41000, v3, OS_LOG_TYPE_INFO, "HVScheduledTasks: periodicBudgetContentAvailable: Re-registering CTS job", v4, 2u);
      }

      -[HVScheduledTasks _registerHarvestTaskWithMinimumLevelOfService:](a1, 2);
    }
  }
}

void __40__HVScheduledTasks__registerCleanupTask__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3))
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __40__HVScheduledTasks__registerCleanupTask__block_invoke_2;
    v26[3] = &unk_2647D5E28;
    v28 = &v29;
    id v4 = v3;
    id v27 = v4;
    v5 = (void *)MEMORY[0x22A6669E0](v26);
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __40__HVScheduledTasks__registerCleanupTask__block_invoke_33;
    v23 = &unk_2647D5E50;
    id v6 = v5;
    id v24 = v6;
    v25 = &v29;
    objc_super v7 = (void (**)(void))MEMORY[0x22A6669E0](&v20);
    uint64_t v8 = self;
    +[HVNotifications _postNotificationWithName:](v8, "com.apple.proactive.ProactiveHarvesting.scheduledTask.started");
    v9 = hv_scheduled_task_signpost_handle();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    uint64_t v11 = hv_scheduled_task_signpost_handle();
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226C41000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Cleanup", (const char *)&unk_226C8F18B, buf, 2u);
    }

    v7[2](v7);
    char v13 = hv_scheduled_task_signpost_handle();
    v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      int v15 = *((unsigned __int8 *)v30 + 24);
      *(_DWORD *)buf = 67109120;
      int v34 = v15;
      _os_signpost_emit_with_name_impl(&dword_226C41000, v14, OS_SIGNPOST_INTERVAL_END, v10, "Cleanup", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
    }

    if (*((unsigned char *)v30 + 24))
    {
      uint64_t v16 = self;
      v17 = "com.apple.proactive.ProactiveHarvesting.scheduledTask.deferred";
    }
    else
    {
      uint64_t v16 = self;
      v17 = "com.apple.proactive.ProactiveHarvesting.scheduledTask.completed";
    }
    +[HVNotifications _postNotificationWithName:](v16, v17);
    if (*((unsigned char *)v30 + 24))
    {
      if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
      {
        v19 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v20, v21, v22, v23);
        [v19 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"HVScheduledTasks.m" lineNumber:232 description:@"HVScheduledTasks unexpected failure of deferral"];
      }
      v18 = hv_default_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226C41000, v18, OS_LOG_TYPE_DEFAULT, "HVScheduledTasks: Cleanup: deferred", buf, 2u);
      }
    }
    _Block_object_dispose(&v29, 8);
  }
}

uint64_t __40__HVScheduledTasks__registerCleanupTask__block_invoke_2(uint64_t a1)
{
  char v2 = hv_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_226C41000, v2, OS_LOG_TYPE_DEBUG, "HVScheduledTasks: Cleanup: deferral check", v5, 2u);
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    goto LABEL_6;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_6:
    uint64_t result = 0;
    *(unsigned char *)(v3 + 24) = 1;
    return result;
  }
  return 1;
}

void __40__HVScheduledTasks__registerCleanupTask__block_invoke_33(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v2 = +[HVQueues defaultQueues];
  id v8 = 0;
  int v3 = [v2 cleanupWithError:&v8 shouldContinueBlock:*(void *)(a1 + 32)];
  id v4 = v8;

  LODWORD(v2) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v5 = hv_default_log_handle();
  id v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v7 = "HVScheduledTasks: Cleanup: deferring";
LABEL_7:
      _os_log_impl(&dword_226C41000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v7 = "HVScheduledTasks: Cleanup: completed successfully";
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_error_impl(&dword_226C41000, v6, OS_LOG_TYPE_ERROR, "HVScheduledTasks: Cleanup: failed: %@", buf, 0xCu);
  }
}

void __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3))
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke_2;
    v26[3] = &unk_2647D5DB0;
    id v27 = *(id *)(a1 + 32);
    uint64_t v29 = &v30;
    id v4 = v3;
    id v28 = v4;
    v5 = (void *)MEMORY[0x22A6669E0](v26);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke_23;
    v21[3] = &unk_2647D5DD8;
    char v25 = *(unsigned char *)(a1 + 56);
    id v6 = v5;
    id v23 = v6;
    id v24 = &v30;
    id v22 = *(id *)(a1 + 32);
    objc_super v7 = (void (**)(void))MEMORY[0x22A6669E0](v21);
    uint64_t v8 = self;
    +[HVNotifications _postNotificationWithName:](v8, "com.apple.proactive.ProactiveHarvesting.scheduledTask.started");
    v9 = hv_scheduled_task_signpost_handle();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    uint64_t v11 = hv_scheduled_task_signpost_handle();
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_226C41000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Harvest", (const char *)&unk_226C8F18B, buf, 2u);
    }

    v7[2](v7);
    char v13 = hv_scheduled_task_signpost_handle();
    v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      int v15 = *((unsigned __int8 *)v31 + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v15;
      _os_signpost_emit_with_name_impl(&dword_226C41000, v14, OS_SIGNPOST_INTERVAL_END, v10, "Harvest", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
    }

    if (*((unsigned char *)v31 + 24))
    {
      uint64_t v16 = self;
      v17 = "com.apple.proactive.ProactiveHarvesting.scheduledTask.deferred";
    }
    else
    {
      uint64_t v16 = self;
      v17 = "com.apple.proactive.ProactiveHarvesting.scheduledTask.completed";
    }
    +[HVNotifications _postNotificationWithName:](v16, v17);
    if (*((unsigned char *)v31 + 24))
    {
      if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
      {
        uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
        [v20 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"HVScheduledTasks.m" lineNumber:188 description:@"HVScheduledTasks unexpected failure of deferral"];
      }
      v18 = hv_default_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v19;
        _os_log_impl(&dword_226C41000, v18, OS_LOG_TYPE_DEFAULT, "HVScheduledTasks: %@: deferred", buf, 0xCu);
      }
    }
    else
    {
      atomic_store(0, (unsigned __int8 *)(*(void *)(a1 + 40) + 8));
    }

    _Block_object_dispose(&v30, 8);
  }
}

uint64_t __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v2 = hv_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_debug_impl(&dword_226C41000, v2, OS_LOG_TYPE_DEBUG, "HVScheduledTasks: %@: deferral check", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    goto LABEL_6;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 40)))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
LABEL_6:
    uint64_t result = 0;
    *(unsigned char *)(v3 + 24) = 1;
    return result;
  }
  return 1;
}

void __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke_23(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v2 = +[HVConsumerCoordinator defaultCoordinator];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  id v13 = 0;
  int v4 = [v2 harvestContentWithMinimumLevelOfService:v3 ignoringDiscretionaryPowerBudget:0 error:&v13 shouldContinueBlock:*(void *)(a1 + 40)];
  id v5 = v13;

  int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v7 = hv_default_log_handle();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      os_signpost_id_t v10 = "HVScheduledTasks: %@: deferring";
LABEL_7:
      _os_log_impl(&dword_226C41000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    }
  }
  else if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v11;
      os_signpost_id_t v10 = "HVScheduledTasks: %@: completed successfully";
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_error_impl(&dword_226C41000, v8, OS_LOG_TYPE_ERROR, "HVScheduledTasks: %@: failed: %@", buf, 0x16u);
  }
}

+ (void)delayedBudgetedContentAvailable
{
  +[HVScheduledTasks sharedInstance]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HVScheduledTasks _delayedBudgetedContentAvailable]((uint64_t)v2);
}

+ (id)sharedInstance
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HVScheduledTasks_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, block);
  }
  v1 = (void *)sharedInstance__pasExprOnceResult_2532;

  return v1;
}

void __34__HVScheduledTasks_sharedInstance__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)sharedInstance__pasExprOnceResult_2532;
  sharedInstance__pasExprOnceResult_2532 = v1;
}

+ (void)registerScheduledTasks
{
  id v2 = +[HVScheduledTasks sharedInstance]();
}

@end