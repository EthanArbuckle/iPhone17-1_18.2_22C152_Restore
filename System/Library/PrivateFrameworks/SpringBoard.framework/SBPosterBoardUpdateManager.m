@interface SBPosterBoardUpdateManager
+ (SBPosterBoardUpdateManager)sharedInstance;
- (BOOL)_isXPCActivity:(int64_t)a3;
- (SBPosterBoardUpdateManager)init;
- (id)_criteriaForUpdate:(int64_t)a3;
- (id)_xpcActivityNameForUpdate:(int64_t)a3;
- (void)_noteApplicationsChanged:(id)a3;
- (void)_notifyDidFinishUpdate:(int64_t)a3 error:(id)a4;
- (void)_notifyWillBeginUpdate:(int64_t)a3;
- (void)_registerForWork:(int64_t)a3;
- (void)_unregisterForWork:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)executeUpdate:(int64_t)a3;
- (void)removeObserver:(id)a3;
@end

@implementation SBPosterBoardUpdateManager

+ (SBPosterBoardUpdateManager)sharedInstance
{
  if (sharedInstance_onceToken_28 != -1) {
    dispatch_once(&sharedInstance_onceToken_28, &__block_literal_global_200);
  }
  v2 = (void *)sharedInstance_sharedInstance_3;
  return (SBPosterBoardUpdateManager *)v2;
}

void __44__SBPosterBoardUpdateManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = v0;
}

- (SBPosterBoardUpdateManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBPosterBoardUpdateManager;
  v2 = [(SBPosterBoardUpdateManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SBPosterBoardUpdateManager *)v2 _registerForWork:0];
    [(SBPosterBoardUpdateManager *)v3 _registerForWork:1];
    [(SBPosterBoardUpdateManager *)v3 _registerForWork:2];
  }
  return v3;
}

- (void)dealloc
{
  [(SBPosterBoardUpdateManager *)self _unregisterForWork:0];
  [(SBPosterBoardUpdateManager *)self _unregisterForWork:1];
  [(SBPosterBoardUpdateManager *)self _unregisterForWork:2];
  v3.receiver = self;
  v3.super_class = (Class)SBPosterBoardUpdateManager;
  [(SBPosterBoardUpdateManager *)&v3 dealloc];
}

- (void)executeUpdate:(int64_t)a3
{
  objc_super v5 = [MEMORY[0x1E4FA5F80] sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SBPosterBoardUpdateManager_executeUpdate___block_invoke;
  v6[3] = &unk_1E6AF4A70;
  v6[4] = self;
  v6[5] = a3;
  [v5 performAfterFirstUnlockSinceBootUsingBlock:v6];
}

void __44__SBPosterBoardUpdateManager_executeUpdate___block_invoke(uint64_t *a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__67;
  v14 = __Block_byref_object_dispose__67;
  id v15 = objc_alloc_init(MEMORY[0x1E4F92380]);
  [(id)a1[4] _notifyWillBeginUpdate:a1[5]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  uint64_t v2 = a1[5];
  a1 += 5;
  v9[2] = __44__SBPosterBoardUpdateManager_executeUpdate___block_invoke_5;
  v9[3] = &unk_1E6B04A38;
  v9[4] = *(a1 - 1);
  v9[5] = &v10;
  v9[6] = v2;
  objc_super v3 = (void (**)(void, void))MEMORY[0x1D948C7A0](v9);
  uint64_t v4 = *a1;
  if (*a1 == 2)
  {
    if (objc_opt_respondsToSelector())
    {
      [(id)v11[5] notifyPosterBoardOfApplicationUpdatesWithCompletion:v3];
      goto LABEL_11;
    }
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28588];
    v19[0] = @"SBPosterBoardUpdateAppInstallOrUninstall is not implemented.  Please update PosterBoard.";
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v7 = [v8 errorWithDomain:@"SBPosterBoardUpdateManagerErrorDomain" code:3328 userInfo:v6];
    ((void (**)(void, void *))v3)[2](v3, v7);
LABEL_10:

    goto LABEL_11;
  }
  if (v4 == 1)
  {
    [(id)v11[5] overnightUpdateWithCompletion:v3];
    goto LABEL_11;
  }
  if (v4)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v17 = @"Specified invalid SBPosterBoardUpdate";
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v7 = [v5 errorWithDomain:@"SBPosterBoardUpdateManagerErrorDomain" code:3328 userInfo:v6];
    ((void (**)(void, void *))v3)[2](v3, v7);
    goto LABEL_10;
  }
  [(id)v11[5] prewarmWithCompletion:v3];
LABEL_11:

  _Block_object_dispose(&v10, 8);
}

void __44__SBPosterBoardUpdateManager_executeUpdate___block_invoke_5(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _notifyDidFinishUpdate:*(void *)(a1 + 48) error:a2];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (BOOL)_isXPCActivity:(int64_t)a3
{
  return a3 != 2;
}

- (id)_xpcActivityNameForUpdate:(int64_t)a3
{
  if (!-[SBPosterBoardUpdateManager _isXPCActivity:](self, "_isXPCActivity:"))
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[self _isXPCActivity:update]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBPosterBoardUpdateManager _xpcActivityNameForUpdate:](a2);
    }
    goto LABEL_11;
  }
  if (a3 != 1)
  {
    if (!a3) {
      return @"com.apple.springboard.posterboardupdate.prewarm";
    }
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown update type: %ld", a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBPosterBoardUpdateManager _xpcActivityNameForUpdate:](a2);
    }
LABEL_11:
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8B1B21CLL);
  }
  return @"com.apple.springboard.posterboardupdate.overnight";
}

- (id)_criteriaForUpdate:(int64_t)a3
{
  if (-[SBPosterBoardUpdateManager _isXPCActivity:](self, "_isXPCActivity:"))
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    v6 = v5;
    if (a3 == 1)
    {
      BOOL v11 = 0;
      v8 = (const char **)MEMORY[0x1E4F142A8];
      BOOL v7 = 1;
      v9 = (int64_t *)MEMORY[0x1E4F141E8];
      uint64_t v10 = (const char **)MEMORY[0x1E4F14170];
      double v12 = 600.0;
    }
    else
    {
      if (a3)
      {
LABEL_7:
        xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
        xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14320], 1);
        xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x1E4F141C0], "PosterBoardUpdate");
        xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E4F141B8], 1);
        xpc_object_t objects = xpc_string_create("com.apple.PosterBoard");
        xpc_object_t v13 = xpc_array_create(&objects, 1uLL);
        xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x1E4F14240], v13);
        xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x1E4F14198], v13);
        xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14250], 1);
        xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14188], 1);

        return v6;
      }
      BOOL v7 = 0;
      v8 = (const char **)MEMORY[0x1E4F14350];
      v9 = (int64_t *)MEMORY[0x1E4F14220];
      uint64_t v10 = (const char **)MEMORY[0x1E4F141A8];
      BOOL v11 = 1;
      double v12 = 300.0;
    }
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14138], v11);
    xpc_dictionary_set_int64(v6, *v10, *v9);
    xpc_dictionary_set_double(v6, (const char *)*MEMORY[0x1E4F141A0], v12);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F142F8], v7);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E4F14340], v7);
    xpc_dictionary_set_BOOL(v6, *v8, 1);
    goto LABEL_7;
  }
  id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[self _isXPCActivity:update]"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBPosterBoardUpdateManager _criteriaForUpdate:](a2);
  }
  [v15 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)_registerForWork:(int64_t)a3
{
  if (-[SBPosterBoardUpdateManager _isXPCActivity:](self, "_isXPCActivity:"))
  {
    id v5 = [(SBPosterBoardUpdateManager *)self _xpcActivityNameForUpdate:a3];
    v6 = (const char *)[v5 UTF8String];
    BOOL v7 = (void *)*MEMORY[0x1E4F14158];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __47__SBPosterBoardUpdateManager__registerForWork___block_invoke;
    handler[3] = &unk_1E6B04A60;
    handler[4] = self;
    handler[5] = a3;
    xpc_activity_register(v6, v7, handler);
  }
  else if (a3 == 2)
  {
    id v8 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v8 addObserver:self selector:sel__noteApplicationsChanged_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v8 addObserver:self selector:sel__noteApplicationsChanged_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  }
}

void __47__SBPosterBoardUpdateManager__registerForWork___block_invoke(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    [*(id *)(a1 + 32) executeUpdate:*(void *)(a1 + 40)];
  }
  else if (!state)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _criteriaForUpdate:*(void *)(a1 + 40)];
    xpc_activity_set_criteria(activity, v4);
  }
}

- (void)_unregisterForWork:(int64_t)a3
{
  if (-[SBPosterBoardUpdateManager _isXPCActivity:](self, "_isXPCActivity:"))
  {
    id v5 = [(SBPosterBoardUpdateManager *)self _xpcActivityNameForUpdate:a3];
    xpc_activity_unregister((const char *)[v5 UTF8String]);
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 removeObserver:self name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v5 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  }
}

- (void)_noteApplicationsChanged:(id)a3
{
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  observers = v4->_observers;
  if (!observers)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    BOOL v7 = v4->_observers;
    v4->_observers = (NSHashTable *)v6;

    observers = v4->_observers;
  }
  [(NSHashTable *)observers addObject:v8];
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)_notifyWillBeginUpdate:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)[(NSHashTable *)v4->_observers copy];
  objc_sync_exit(v4);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "updateManager:willBeginUpdate:", v4, a3, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidFinishUpdate:(int64_t)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = (void *)[(NSHashTable *)v7->_observers copy];
  objc_sync_exit(v7);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "updateManager:didFinishUpdate:error:", v7, a3, v6, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
}

- (void)_xpcActivityNameForUpdate:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_xpcActivityNameForUpdate:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_criteriaForUpdate:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end