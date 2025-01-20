@interface SBSystemUISceneResolutionStage
- (SBKeyboardFocusResolutionStageSceneProviding)sceneProvider;
- (SBSystemUISceneResolutionStageDelegate)delegate;
- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5;
- (void)setDelegate:(id)a3;
- (void)setSceneProvider:(id)a3;
@end

@implementation SBSystemUISceneResolutionStage

- (void)resolveKeyboardFocusPolicy:(id)a3 context:(id)a4 stop:(BOOL *)a5
{
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = [v14 keyboardFocusTarget];
  id v9 = objc_loadWeakRetained((id *)&self->_sceneProvider);
  v10 = [v9 sceneForFocusTarget:v8];

  v11 = [v14 auditHistory];
  [v11 addItemWithFormat:@"-- SBSystemUISceneResolutionStage --"];

  v12 = [WeakRetained systemUISceneRequestingFocus];
  if (v12 && [v10 isEqual:v12])
  {
    v13 = [v14 auditHistory];
    [v13 addItemWithFormat:@"policy: high priority scene"];

    *a5 = 1;
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

- (SBSystemUISceneResolutionStageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSystemUISceneResolutionStageDelegate *)WeakRetained;
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