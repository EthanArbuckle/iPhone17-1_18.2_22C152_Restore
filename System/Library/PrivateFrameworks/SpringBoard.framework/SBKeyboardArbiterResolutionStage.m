@interface SBKeyboardArbiterResolutionStage
- (SBKeyboardArbiterResolutionStageDelegate)delegate;
- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider;
- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5;
- (void)setDelegate:(id)a3;
- (void)setSceneProvider:(id)a3;
@end

@implementation SBKeyboardArbiterResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  id v23 = a3;
  id v8 = a4;
  v9 = [v23 auditHistory];
  [v9 addItemWithFormat:@"-- SBKeyboardArbiterResolutionStage --"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v12 = [v23 keyboardFocusTarget];
    v13 = [v12 sceneIdentityToken];
    char v14 = [v11 shouldPreventFocusForSceneWithIdentityToken:v13];

    if (v14)
    {
      v15 = [v23 auditHistory];
      [v15 addItemWithFormat:@"preventFocusForTarget, falling back to caches"];

      v16 = [v11 mostRecentKeyboardArbiterSuggestedTarget];
      char v17 = [v12 isEqual:v16];
    }
    else
    {
      if (v12)
      {
LABEL_11:

        return;
      }
      v16 = [v11 mostRecentKeyboardArbiterSuggestedTarget];
      char v17 = 0;
    }
    v18 = [v23 auditHistory];
    v19 = v18;
    if (!v16 || (v17 & 1) != 0)
    {
      [v18 addItemWithFormat:@"no keyboard arbiter suggestion, falling back to SB scene"];

      id v20 = objc_loadWeakRetained((id *)&self->_sceneProvider);
      v21 = [v20 springBoardSceneFocusTarget];
      [v23 setKeyboardFocusTarget:v21];
    }
    else
    {
      [v18 addItemWithFormat:@"no keyboard arbiter suggestion, falling back to MRU suggestion"];

      [v23 setKeyboardFocusTarget:v16];
    }
    [v23 setAdvicePolicy:2];

    goto LABEL_11;
  }
  v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"delegate != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBKeyboardArbiterResolutionStage resolveKeyboardFocusPolicy:context:stop:](a2, (uint64_t)self, (uint64_t)v22);
  }
  [v22 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneProvider);
  return (SBKeyboardFocusResolutionStageSceneProviding *)WeakRetained;
}

- (void)setSceneProvider:(id)a3
{
}

- (SBKeyboardArbiterResolutionStageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBKeyboardArbiterResolutionStageDelegate *)WeakRetained;
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
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBKeyboardArbiterResolutionStage.m";
  __int16 v16 = 1024;
  int v17 = 30;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end