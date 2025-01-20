@interface WBSPasswordBreachPeriodicLookupActivity
- (WBSPasswordBreachPeriodicLookupActivity)init;
- (void)_activityDidTransitionToRunState:(id)a3;
- (void)_registerActivity;
- (void)_runActivityWithCompletionHandler:(id)a3;
@end

@implementation WBSPasswordBreachPeriodicLookupActivity

- (WBSPasswordBreachPeriodicLookupActivity)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSPasswordBreachPeriodicLookupActivity;
  v2 = [(WBSPasswordBreachPeriodicLookupActivity *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(WBSPasswordBreachPeriodicLookupActivity *)v2 _registerActivity];
    v4 = v3;
  }

  return v3;
}

- (void)_registerActivity
{
  v3 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_INFO, "Lookup activity checking in.", buf, 2u);
  }
  v4 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __60__WBSPasswordBreachPeriodicLookupActivity__registerActivity__block_invoke;
  handler[3] = &unk_1E5C9E7C8;
  handler[4] = self;
  xpc_activity_register("com.apple.Safari.PasswordBreachHelper.PeriodicLookupActivity", v4, handler);
}

void __60__WBSPasswordBreachPeriodicLookupActivity__registerActivity__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    if (xpc_activity_should_defer(v3))
    {
      v4 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Lookup activity transitioned to state Run, but criteria are no longer satisfied. Defering.", v13, 2u);
      }
      if (!xpc_activity_set_state(v3, 3))
      {
        v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          __60__WBSPasswordBreachPeriodicLookupActivity__registerActivity__block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) _activityDidTransitionToRunState:v3];
    }
  }
}

- (void)_activityDidTransitionToRunState:(id)a3
{
  v4 = (_xpc_activity_s *)a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Lookup activity transitioned to state Run.", buf, 2u);
  }
  uint64_t v6 = (void *)os_transaction_create();
  if (!xpc_activity_set_state(v4, 4))
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachPeriodicLookupActivity _activityDidTransitionToRunState:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__WBSPasswordBreachPeriodicLookupActivity__activityDidTransitionToRunState___block_invoke;
  v17[3] = &unk_1E5C8C920;
  v18 = v4;
  id v19 = v6;
  id v15 = v6;
  v16 = v4;
  [(WBSPasswordBreachPeriodicLookupActivity *)self _runActivityWithCompletionHandler:v17];
}

void __76__WBSPasswordBreachPeriodicLookupActivity__activityDidTransitionToRunState___block_invoke(uint64_t a1)
{
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    v1 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __76__WBSPasswordBreachPeriodicLookupActivity__activityDidTransitionToRunState___block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  uint64_t v9 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_INFO, "Lookup activity transitioned to state Done.", v10, 2u);
  }
}

- (void)_runActivityWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__WBSPasswordBreachPeriodicLookupActivity__runActivityWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E5C9E698;
  id v6 = v3;
  id v4 = v3;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:v5];
}

void __77__WBSPasswordBreachPeriodicLookupActivity__runActivityWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __77__WBSPasswordBreachPeriodicLookupActivity__runActivityWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E5C9E620;
    id v5 = *(id *)(a1 + 32);
    [a2 performNextSessionLookupIgnoringMinimumDelay:0 completionHandler:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

uint64_t __77__WBSPasswordBreachPeriodicLookupActivity__runActivityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__WBSPasswordBreachPeriodicLookupActivity__registerActivity__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_activityDidTransitionToRunState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __76__WBSPasswordBreachPeriodicLookupActivity__activityDidTransitionToRunState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end