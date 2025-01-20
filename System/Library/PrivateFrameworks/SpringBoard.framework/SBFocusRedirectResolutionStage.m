@interface SBFocusRedirectResolutionStage
- (SBFocusRedirectResolutionStageDelegate)delegate;
- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider;
- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5;
- (void)setDelegate:(id)a3;
- (void)setSceneProvider:(id)a3;
@end

@implementation SBFocusRedirectResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = [v6 auditHistory];
  [v8 addItemWithFormat:@"-- SBFocusRedirectResolutionStage --"];

  v9 = [v6 keyboardFocusTarget];
  v10 = [WeakRetained keyboardFocusRedirectionForTarget:v9];

  if (v10)
  {
    v11 = [v10 toToken];
    v12 = +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v11, [v10 toProcessIdentifier]);

    [v6 setKeyboardFocusTarget:v12];
    [v6 setShouldSuppressRemoteDeferring:1];
    v13 = [v6 auditHistory];
    v14 = [v10 reason];
    [v13 addItemWithFormat:@"target REDIRECTION reason:%@", v14];

    v15 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v10 reason];
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      __int16 v19 = 2114;
      v20 = v16;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "policy: REDIRECTION target:%{public}@ reason: %{public}@", buf, 0x16u);
    }
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

- (SBFocusRedirectResolutionStageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFocusRedirectResolutionStageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneProvider);
}

@end