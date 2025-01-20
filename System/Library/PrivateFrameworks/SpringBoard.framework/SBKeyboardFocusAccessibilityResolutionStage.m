@interface SBKeyboardFocusAccessibilityResolutionStage
- (SBKeyboardFocusAccessibilityResolutionDeelgate)delegate;
- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider;
- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5;
- (void)setDelegate:(id)a3;
- (void)setSceneProvider:(id)a3;
@end

@implementation SBKeyboardFocusAccessibilityResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  id v16 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v12 = [WeakRetained accessibilityKeyboardFocusOverrideTarget];
    if (v12)
    {
      v13 = [v16 auditHistory];
      v14 = [v16 keyboardFocusTarget];
      [v13 addItemWithFormat:@"-- SBKeyboardFocusAccessibilityResolutionStage overriding keyboard arbiter target (policy was %@, override is %@)", v14, v12];

      [v16 setKeyboardFocusTarget:v12];
      *a5 = 1;
    }
  }
  else
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"delegate != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusAccessibilityResolutionStage resolveKeyboardFocusPolicy:context:stop:](a2, (uint64_t)self, (uint64_t)v15);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneProvider);
  return (SBKeyboardFocusResolutionStageSceneProviding *)WeakRetained;
}

- (void)setSceneProvider:(id)a3
{
}

- (SBKeyboardFocusAccessibilityResolutionDeelgate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBKeyboardFocusAccessibilityResolutionDeelgate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneProvider);
}

- (void)resolveKeyboardFocusPolicy:(const char *)a1 context:(uint64_t)a2 stop:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBKeyboardFocusAccessibilityResolutionStage.m";
  __int16 v16 = 1024;
  int v17 = 28;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end