@interface SBMutableKeyboardFocusCoalitionPreferences
- (void)setLockReasons:(id)a3;
- (void)setPolicy:(id)a3;
@end

@implementation SBMutableKeyboardFocusCoalitionPreferences

- (void)setPolicy:(id)a3
{
  id v15 = a3;
  if (!v15)
  {
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v6 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"policy", v8];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMutableKeyboardFocusCoalitionPreferences setPolicy:]();
    }
LABEL_13:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8647CE0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = NSString;
    v11 = (objc_class *)[v15 classForCoder];
    if (!v11) {
      v11 = (objc_class *)objc_opt_class();
    }
    v12 = NSStringFromClass(v11);
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v9 = [v10 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"policy", v12, v14];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMutableKeyboardFocusCoalitionPreferences setPolicy:]();
    }
    goto LABEL_13;
  }

  v4 = (SBKeyboardFocusPolicy *)[v15 copy];
  policy = self->super._policy;
  self->super._policy = v4;
}

- (void)setLockReasons:(id)a3
{
  id v12 = a3;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = NSString;
    v7 = (objc_class *)[v12 classForCoder];
    if (!v7) {
      v7 = (objc_class *)objc_opt_class();
    }
    v8 = NSStringFromClass(v7);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [v6 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"lockReasons", v8, v10];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMutableKeyboardFocusCoalitionPreferences setLockReasons:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v4 = (NSSet *)[v12 copy];
    lockReasons = self->super._lockReasons;
    self->super._lockReasons = v4;
  }
}

- (void)setPolicy:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setLockReasons:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end