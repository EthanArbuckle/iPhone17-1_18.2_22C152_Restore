@interface SBSpringBoardOutboundFocusResolutionStage
- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider;
- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5;
- (void)setSceneProvider:(id)a3;
@end

@implementation SBSpringBoardOutboundFocusResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 auditHistory];
  [v9 addItemWithFormat:@"-- SBSpringBoardOutboundFocusResolutionStage --"];

  LODWORD(v9) = [v8 isScreenDim];
  if (v9 && ![v7 advicePolicy])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneProvider);
    v11 = [WeakRetained springBoardSceneFocusTarget];

    [v7 setKeyboardFocusTarget:v11];
    v12 = [v7 auditHistory];
    [v12 addItemWithFormat:@"rejecting policy: screen is dim -- deferring to SB"];

    v13 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "policy: outbound rule not allowed -- deferring to SB", v14, 2u);
    }

    [v7 setShouldSuppressRemoteDeferring:1];
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

- (void).cxx_destruct
{
}

@end