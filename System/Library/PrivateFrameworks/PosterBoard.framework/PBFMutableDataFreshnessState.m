@interface PBFMutableDataFreshnessState
- (PBFMutableDataFreshnessState)init;
- (void)track:(id)a3;
@end

@implementation PBFMutableDataFreshnessState

- (PBFMutableDataFreshnessState)init
{
  v3 = [MEMORY[0x1E4F1CAD0] set];
  v6.receiver = self;
  v6.super_class = (Class)PBFMutableDataFreshnessState;
  v4 = [(PBFDataFreshnessState *)&v6 initWithFreshnessProvider:v3];

  return v4;
}

- (void)track:(id)a3
{
  id v11 = a3;
  NSClassFromString(&cfstr_Pbfdatacompone_3.isa);
  if (!v11)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFMutableDataFreshnessState track:]();
    }
LABEL_14:
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B4928);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFDataComponentObjectEntityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFMutableDataFreshnessState track:]();
    }
    goto LABEL_14;
  }

  v4 = [(PBFDataFreshnessState *)self freshnessProviders];
  v5 = (void *)[v4 mutableCopy];
  objc_super v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;

  [v8 addObject:v11];
  v9 = (void *)[v8 copy];
  [(PBFDataFreshnessState *)self setFreshnessProviders:v9];
}

- (void)track:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end