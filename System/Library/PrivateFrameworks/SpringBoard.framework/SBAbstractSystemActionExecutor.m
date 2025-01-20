@interface SBAbstractSystemActionExecutor
- (BOOL)_canBeExecuted;
- (BOOL)_isExecuting;
- (BOOL)_requiresAuthenticationAtLeastOnceSinceBootBeforeExecution;
- (SBAbstractSystemActionExecutor)initWithSystemAction:(id)a3;
- (SBSystemAction)systemAction;
- (double)executionEndTime;
- (double)executionStartTime;
- (id)_beginInteractiveExecutionWithContext:(id)a3 executionHandler:(id)a4 error:(id *)a5;
- (id)_previewWithCoordinator:(id)a3;
- (id)executeWithContext:(id)a3 executionHandler:(id)a4 completion:(id)a5;
- (id)previewWithCoordinator:(id)a3;
- (unint64_t)executionGeneration;
- (void)_cancelPreviewing;
- (void)_finishExecutingWithResult:(id)a3;
- (void)cancelPreviewing;
@end

@implementation SBAbstractSystemActionExecutor

- (SBAbstractSystemActionExecutor)initWithSystemAction:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"systemAction != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBAbstractSystemActionExecutor initWithSystemAction:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_12:
    JUMPOUT(0x1D8CB067CLL);
  }
  v6 = v5;
  v12.receiver = self;
  v12.super_class = (Class)SBAbstractSystemActionExecutor;
  v7 = [(SBAbstractSystemActionExecutor *)&v12 init];
  v8 = objc_opt_class();
  if ([v8 isEqual:objc_opt_class()])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%@ cannot be instantiated concretely; use a subclass.",
    v11 = objc_opt_class());
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBAbstractSystemActionExecutor initWithSystemAction:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_12;
  }
  if (v7) {
    objc_storeStrong((id *)&v7->_systemAction, a3);
  }

  return v7;
}

- (id)previewWithCoordinator:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBAbstractSystemActionExecutor *)self canBeExecuted])
  {
    v8 = [NSString stringWithFormat:@"%@ cannot preview an inexecutable action", self];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBAbstractSystemActionExecutor previewWithCoordinator:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8CB0848);
  }
  id v5 = [(SBAbstractSystemActionExecutor *)self _previewWithCoordinator:v4];
  if (v5)
  {
    v6 = SBLogSystemActionPreviewing();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      __int16 v11 = 2114;
      objc_super v12 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ encountered an error while previewing action: %{public}@", buf, 0x16u);
    }
  }
  return v5;
}

- (void)cancelPreviewing
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (id)executeWithContext:(id)a3 executionHandler:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(SBAbstractSystemActionExecutor *)self canBeExecuted])
  {
    v21 = [NSString stringWithFormat:@"%@ cannot execute an inexecutable action", self];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBAbstractSystemActionExecutor executeWithContext:executionHandler:completion:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8CB0B20);
  }
  ++self->_executionGeneration;
  executionCompletions = self->_executionCompletions;
  if (!executionCompletions)
  {
    objc_super v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = self->_executionCompletions;
    self->_executionCompletions = v12;

    executionCompletions = self->_executionCompletions;
  }
  v14 = (void *)[v10 copy];
  v15 = (void *)MEMORY[0x1D948C7A0]();
  [(NSMutableArray *)executionCompletions addObject:v15];

  if (self->_executionStartTime == 0.0)
  {
    BSContinuousMachTimeNow();
    self->_executionStartTime = v16;
  }
  id v23 = 0;
  v17 = [(SBAbstractSystemActionExecutor *)self _beginInteractiveExecutionWithContext:v8 executionHandler:v9 error:&v23];
  id v18 = v23;
  if (!v17)
  {
    if ([(SBAbstractSystemActionExecutor *)self isExecuting])
    {
      v22 = [NSString stringWithFormat:@"Failed execution of %@ should not be executing", self];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBAbstractSystemActionExecutor executeWithContext:executionHandler:completion:]();
      }
      [v22 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8CB0B7CLL);
    }
    v19 = SBLogSystemActionExecution();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      __int16 v26 = 2114;
      id v27 = v18;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ will finish executing without beginning due to error: %{public}@", buf, 0x16u);
    }

    [(SBAbstractSystemActionExecutor *)self _finishExecutingWithResult:v18];
  }

  return v17;
}

- (void)_finishExecutingWithResult:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_executionEndTime == 0.0)
  {
    BSContinuousMachTimeNow();
    self->_executionEndTime = v5;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = self->_executionCompletions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    executionCompletions = self->_executionCompletions;
    self->_executionCompletions = 0;
  }
}

- (SBSystemAction)systemAction
{
  return self->_systemAction;
}

- (unint64_t)executionGeneration
{
  return self->_executionGeneration;
}

- (double)executionStartTime
{
  return self->_executionStartTime;
}

- (double)executionEndTime
{
  return self->_executionEndTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAction, 0);
  objc_storeStrong((id *)&self->_executionCompletions, 0);
}

- (BOOL)_canBeExecuted
{
  return 0;
}

- (BOOL)_isExecuting
{
  return 0;
}

- (BOOL)_requiresAuthenticationAtLeastOnceSinceBootBeforeExecution
{
  return 0;
}

- (id)_previewWithCoordinator:(id)a3
{
  return 0;
}

- (void)_cancelPreviewing
{
  OUTLINED_FUNCTION_9();
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (id)_beginInteractiveExecutionWithContext:(id)a3 executionHandler:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)initWithSystemAction:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSystemAction:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)previewWithCoordinator:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)executeWithContext:executionHandler:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)executeWithContext:executionHandler:completion:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end