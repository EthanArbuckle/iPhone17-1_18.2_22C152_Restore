@interface SBKeyboardFocusCoalitionPolicyEnforcer
- (SBKeyboardFocusCoalitionPolicyEnforcer)init;
- (void)enforce:(id)a3;
- (void)invalidate;
- (void)stopEnforcing;
@end

@implementation SBKeyboardFocusCoalitionPolicyEnforcer

- (void)enforce:(id)a3
{
  id v5 = a3;
  enforcer = self->_enforcer;
  if (enforcer)
  {
    id v8 = v5;
    [(SBKeyboardFocusPolicyEnforcer *)enforcer enforce:v5];
  }
  else
  {
    v7 = [NSString stringWithFormat:@"can't enforce an invalidated enforcer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBKeyboardFocusCoalitionPolicyEnforcer *)a2 enforce:(uint64_t)v7];
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (SBKeyboardFocusCoalitionPolicyEnforcer)init
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)SBKeyboardFocusCoalitionPolicyEnforcer;
  v2 = [(SBKeyboardFocusCoalitionPolicyEnforcer *)&v15 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F4F358]);
    v4 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    [v3 setEnvironment:v4];

    id v5 = +[SBHIDEventDispatchController symbolicDeferringTokenForKeyboardFocus];
    [v3 setToken:v5];

    v6 = [[_SBKeyboardFocusCoalitionPolicyEnforcer alloc] initWithDeferringRulePredicate:v3 deferringRuleReason:@"SB incoming to root scene (symbol)" debugName:@"SBKeyboardFocusPolicyEnforcer-Coalition-Symbolic"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F4F358]);
    id v8 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    [v7 setEnvironment:v8];

    v9 = [[_SBKeyboardFocusCoalitionPolicyEnforcer alloc] initWithDeferringRulePredicate:v7 deferringRuleReason:@"SB incoming to root scene" debugName:@"SBKeyboardFocusPolicyEnforcer-Coalition"];
    v10 = [SBKeyboardFocusPolicyEnforcerPipeline alloc];
    v16[0] = v9;
    v16[1] = v6;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v12 = [(SBKeyboardFocusPolicyEnforcerPipeline *)v10 initWithEnforcers:v11];

    enforcer = v2->_enforcer;
    v2->_enforcer = (SBKeyboardFocusPolicyEnforcer *)v12;
  }
  return v2;
}

- (void)stopEnforcing
{
}

- (void)invalidate
{
  [(SBKeyboardFocusPolicyEnforcer *)self->_enforcer invalidate];
  enforcer = self->_enforcer;
  self->_enforcer = 0;
}

- (void).cxx_destruct
{
}

- (void)enforce:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  objc_super v15 = @"SBKeyboardFocusCoalitionPolicyEnforcer.m";
  __int16 v16 = 1024;
  int v17 = 55;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end