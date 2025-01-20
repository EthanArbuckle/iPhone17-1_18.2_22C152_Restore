@interface WFXPCActivityScheduler
+ (id)activatedSchedulerWithActivityIdentifier:(id)a3 checkInHandler:(id)a4 runHandler:(id)a5;
+ (id)activatedSchedulerWithActivityIdentifier:(id)a3 runHandler:(id)a4;
- (NSString)activityIdentifier;
- (WFXPCActivityScheduler)initWithActivityIdentifier:(id)a3;
- (_xpc_activity_eligibility_changed_handler_s)lock_eligibilityChangedHandler;
- (os_unfair_lock_s)lock;
- (void)addEligibilityChangedHandler:(id)a3 toActivity:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)removeEligibilityChangedHandlerIfNeeded;
- (void)scheduleWithCheckInHandler:(id)a3 runHandler:(id)a4;
- (void)scheduleWithRunHandler:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLock_eligibilityChangedHandler:(_xpc_activity_eligibility_changed_handler_s *)a3;
@end

@implementation WFXPCActivityScheduler

- (void).cxx_destruct
{
}

- (void)setLock_eligibilityChangedHandler:(_xpc_activity_eligibility_changed_handler_s *)a3
{
  self->_lock_eligibilityChangedHandler = a3;
}

- (_xpc_activity_eligibility_changed_handler_s)lock_eligibilityChangedHandler
{
  return self->_lock_eligibilityChangedHandler;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)removeEligibilityChangedHandlerIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__WFXPCActivityScheduler_removeEligibilityChangedHandlerIfNeeded__block_invoke;
  aBlock[3] = &unk_1E65420F0;
  aBlock[4] = self;
  v4 = (void (**)(void))_Block_copy(aBlock);
  if ([(WFXPCActivityScheduler *)self lock_eligibilityChangedHandler])
  {
    v5 = getWFGeneralLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(WFXPCActivityScheduler *)self activityIdentifier];
      *(_DWORD *)buf = 136315394;
      v9 = "-[WFXPCActivityScheduler removeEligibilityChangedHandlerIfNeeded]";
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Removing eligibility changed handler for activity: %@", buf, 0x16u);
    }
    xpc_activity_remove_eligibility_changed_handler();
    [(WFXPCActivityScheduler *)self setLock_eligibilityChangedHandler:0];
  }
  v4[2](v4);
}

void __65__WFXPCActivityScheduler_removeEligibilityChangedHandlerIfNeeded__block_invoke(uint64_t a1)
{
}

- (void)addEligibilityChangedHandler:(id)a3 toActivity:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__WFXPCActivityScheduler_addEligibilityChangedHandler_toActivity___block_invoke;
  aBlock[3] = &unk_1E65420F0;
  aBlock[4] = self;
  v8 = (void (**)(void))_Block_copy(aBlock);
  v9 = [(WFXPCActivityScheduler *)self activityIdentifier];
  if ([(WFXPCActivityScheduler *)self lock_eligibilityChangedHandler])
  {
    __int16 v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFXPCActivityScheduler addEligibilityChangedHandler:toActivity:]";
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_FAULT, "%s Eligibility changed handler already set for activity %@", buf, 0x16u);
    }
  }
  else
  {
    v11 = getWFGeneralLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFXPCActivityScheduler addEligibilityChangedHandler:toActivity:]";
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_INFO, "%s Setting up eligibility changed handler for activity %@", buf, 0x16u);
    }

    [(WFXPCActivityScheduler *)self setLock_eligibilityChangedHandler:xpc_activity_add_eligibility_changed_handler()];
  }

  v8[2](v8);
}

void __66__WFXPCActivityScheduler_addEligibilityChangedHandler_toActivity___block_invoke(uint64_t a1)
{
}

- (void)scheduleWithRunHandler:(id)a3
{
}

- (void)scheduleWithCheckInHandler:(id)a3 runHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFXPCActivityScheduler *)self activityIdentifier];
  v9 = (const char *)[v8 UTF8String];
  __int16 v10 = (void *)*MEMORY[0x1E4F14158];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke;
  v14[3] = &unk_1E6541C90;
  id v15 = v8;
  v16 = self;
  id v17 = v6;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  xpc_activity_register(v9, v10, v14);
}

void __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    v5 = (void *(*)(uint64_t, uint64_t))state;
    if (!state)
    {
      id v6 = getWFGeneralLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Checkin for XPC activity %@", buf, 0x16u);
      }

      uint64_t v8 = *(void *)(a1 + 48);
      if (v8) {
        (*(void (**)(uint64_t, _xpc_activity_s *))(v8 + 16))(v8, v3);
      }
      goto LABEL_19;
    }
    id v13 = getWFGeneralLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      v24 = v5;
      _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_ERROR, "%s Unexpected state of %@ XPC activity: %ld", buf, 0x20u);
    }
LABEL_18:

    goto LABEL_19;
  }
  v9 = getWFGeneralLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s Starting to run XPC activity %@", buf, 0x16u);
  }

  if (!xpc_activity_set_state(v3, 4))
  {
    id v13 = getWFGeneralLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = [*(id *)(a1 + 40) activityIdentifier];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_ERROR, "%s Failed to set %@ XPC activity state to continue", buf, 0x16u);
    }
    goto LABEL_18;
  }
  objc_initWeak(&location, v3);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v24 = __Block_byref_object_copy__6702;
  v25 = __Block_byref_object_dispose__6703;
  uint64_t v11 = *(void *)(a1 + 56);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke_9;
  v19[3] = &unk_1E6541C40;
  v19[4] = *(void *)(a1 + 40);
  objc_copyWeak(&v21, &location);
  id v20 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, _xpc_activity_s *, void *))(v11 + 16))(v11, v3, v19);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  if (xpc_activity_get_state(v3) != 5)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke_11;
    v16[3] = &unk_1E6541C68;
    id v12 = *(void **)(a1 + 40);
    id v17 = *(id *)(a1 + 32);
    id v18 = buf;
    [v12 addEligibilityChangedHandler:v16 toActivity:v3];
  }
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
LABEL_19:
}

void __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) removeEligibilityChangedHandlerIfNeeded];
  WeakRetained = (_xpc_activity_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      id v15 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
      uint64_t v10 = "%s xpcActivity is nil in completion handler, the activity has likely been deferred";
      uint64_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 12;
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  BOOL should_defer = xpc_activity_should_defer(WeakRetained);
  v5 = getWFGeneralLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v14 = 136315650;
    id v15 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 1024;
    LODWORD(v19) = should_defer;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s XPC activity %@ finished, shouldDefer = %d", (uint8_t *)&v14, 0x1Cu);
  }

  if (should_defer) {
    xpc_activity_state_t v7 = 3;
  }
  else {
    xpc_activity_state_t v7 = 5;
  }
  if (!xpc_activity_set_state(v3, v7))
  {
    uint64_t v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v14 = 136315650;
      id v15 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2048;
      xpc_activity_state_t v19 = v7;
      uint64_t v10 = "%s Failed to set %@ XPC activity state to %ld";
      uint64_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_12:
      _os_log_impl(&dword_1C7D7E000, v11, v12, v10, (uint8_t *)&v14, v13);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:
}

void __64__WFXPCActivityScheduler_scheduleWithCheckInHandler_runHandler___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    v4 = getWFGeneralLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v12 = 136315394;
      uint32_t v13 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s XPC activity %@ should defer", (uint8_t *)&v12, 0x16u);
    }

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v6 = getWFGeneralLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v12 = 136315394;
        uint32_t v13 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
        __int16 v14 = 2112;
        uint64_t v15 = v7;
        _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Calling should defer handler for XPC activity %@", (uint8_t *)&v12, 0x16u);
      }

      (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0;
    }
    if (xpc_activity_get_state(v3) != 3 && !xpc_activity_set_state(v3, 3))
    {
      uint64_t v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = 136315394;
        uint32_t v13 = "-[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:]_block_invoke";
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Failed to set %@ XPC activity state to deferred", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)invalidate
{
  [(WFXPCActivityScheduler *)self removeEligibilityChangedHandlerIfNeeded];
  id v3 = [(WFXPCActivityScheduler *)self activityIdentifier];
  xpc_activity_unregister((const char *)[v3 UTF8String]);
}

- (void)dealloc
{
  [(WFXPCActivityScheduler *)self removeEligibilityChangedHandlerIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)WFXPCActivityScheduler;
  [(WFXPCActivityScheduler *)&v3 dealloc];
}

- (WFXPCActivityScheduler)initWithActivityIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFXPCActivityScheduler.m", 27, @"Invalid parameter not satisfying: %@", @"activityIdentifier" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFXPCActivityScheduler;
  uint64_t v6 = [(WFXPCActivityScheduler *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [v5 copy];
    activityIdentifier = v7->_activityIdentifier;
    v7->_activityIdentifier = (NSString *)v8;

    uint64_t v10 = v7;
  }

  return v7;
}

+ (id)activatedSchedulerWithActivityIdentifier:(id)a3 runHandler:(id)a4
{
  return (id)[a1 activatedSchedulerWithActivityIdentifier:a3 checkInHandler:0 runHandler:a4];
}

+ (id)activatedSchedulerWithActivityIdentifier:(id)a3 checkInHandler:(id)a4 runHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithActivityIdentifier:v10];

  [v11 scheduleWithCheckInHandler:v9 runHandler:v8];
  return v11;
}

@end