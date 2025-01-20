@interface SBSystemActionViewObstructionState
+ (id)emptyState;
+ (id)stateWithError:(uint64_t)a1;
+ (id)stateWithEvent:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (SBSystemActionViewObstructionState)initWithEvent:(id)a3 error:(id)a4;
@end

@implementation SBSystemActionViewObstructionState

- (SBSystemActionViewObstructionState)initWithEvent:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSystemActionViewObstructionState;
  v9 = [(SBSystemActionViewObstructionState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

+ (id)emptyState
{
  v0 = (void *)[objc_alloc((Class)self) initWithEvent:0 error:0];
  return v0;
}

+ (id)stateWithEvent:(uint64_t)a1
{
  id v2 = a2;
  v3 = (objc_class *)self;
  if (v2)
  {
    v4 = (void *)[[v3 alloc] initWithEvent:v2 error:0];

    return v4;
  }
  else
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"event != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[SBSystemActionViewObstructionState stateWithEvent:]();
    }
    [v6 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)stateWithError:(uint64_t)a1
{
  id v2 = a2;
  v3 = (objc_class *)self;
  if (v2)
  {
    v4 = (void *)[[v3 alloc] initWithEvent:0 error:v2];

    return v4;
  }
  else
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"error != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[SBSystemActionViewObstructionState stateWithError:]();
    }
    [v6 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSystemActionViewObstructionState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (BSEqualObjects()) {
      char v7 = BSEqualObjects();
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

+ (void)stateWithEvent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)stateWithError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end