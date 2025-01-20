@interface SBMutableKeyboardFocusPolicy
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAdvicePolicy:(int64_t)a3;
- (void)setCameraIsHosted:(BOOL)a3;
- (void)setKeyboardFocusTarget:(id)a3;
- (void)setShouldSuppressRemoteDeferring:(BOOL)a3;
- (void)setWindowSceneAncestor:(id)a3;
@end

@implementation SBMutableKeyboardFocusPolicy

- (void)setKeyboardFocusTarget:(id)a3
{
  id v7 = a3;
  if (v7 && (NSClassFromString(&cfstr_Sbkeyboardfocu_32.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:SBKeyboardFocusTargetClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBMutableKeyboardFocusPolicy *)a2 setKeyboardFocusTarget:(uint64_t)v6];
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->super._keyboardFocusTarget, a3);
      [(BSAuditHistory *)self->super._auditHistory addItemWithFormat:@"Updated Target: %@", v7];
    }
  }
}

- (void)setWindowSceneAncestor:(id)a3
{
  id obj = a3;
  p_sbWindowSceneAncestor = &self->super._sbWindowSceneAncestor;
  id WeakRetained = objc_loadWeakRetained((id *)p_sbWindowSceneAncestor);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_sbWindowSceneAncestor, obj);
    v6 = obj;
  }
}

- (void)setAdvicePolicy:(int64_t)a3
{
  if (self->super._selectionPolicy != a3)
  {
    self->super._selectionPolicy = a3;
    auditHistory = self->super._auditHistory;
    NSStringFromSBKeyboardFocusAdviceAcceptancePolicy(a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(BSAuditHistory *)auditHistory addItemWithFormat:@"Updated advice: %@", v4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SBKeyboardFocusPolicy alloc];
  return -[SBKeyboardFocusPolicy _initWithCopyOf:]((id *)&v4->super.isa, self);
}

- (void)setShouldSuppressRemoteDeferring:(BOOL)a3
{
  if (self->super._shouldSuppressRemoteDeferring != a3)
  {
    self->super._shouldSuppressRemoteDeferring = a3;
    auditHistory = self->super._auditHistory;
    id v4 = @"NO";
    if (a3) {
      id v4 = @"YES";
    }
    [(BSAuditHistory *)auditHistory addItemWithFormat:@"Updated should suppress remote deferring to %@", v4];
  }
}

- (void)setCameraIsHosted:(BOOL)a3
{
  self->super._cameraIsHosted = a3;
}

- (void)setKeyboardFocusTarget:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBKeyboardFocusPolicy.m";
  __int16 v16 = 1024;
  int v17 = 213;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end