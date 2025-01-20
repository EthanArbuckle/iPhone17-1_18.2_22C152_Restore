@interface _UISceneHostingSheetPresentationClientComponent
- (UISheetPresentationController)_localSheetPresentationController;
- (void)_setLocalSheetPresentationController:(id)a3;
- (void)_sheetGrabberDidTriggerPrimaryAction;
- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5;
- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6;
- (void)_sheetInteractionDraggingDidEnd;
- (void)_sheetPresentationControllerClientConfigurationDidChange:(id)a3;
- (void)applySheetConfigurationToLocalPresentationControllerWithTransitionContext:(id)a3;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
@end

@implementation _UISceneHostingSheetPresentationClientComponent

- (void)_setLocalSheetPresentationController:(id)a3
{
  p_localSheetPresentationController = &self->_localSheetPresentationController;
  id v5 = a3;
  objc_storeWeak((id *)p_localSheetPresentationController, v5);
  [v5 _setClientRemotePresentationDelegate:self];

  [(_UISceneHostingSheetPresentationClientComponent *)self applySheetConfigurationToLocalPresentationControllerWithTransitionContext:0];
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v8 = a4;
  id v5 = [v8 settingsDiff];
  int v6 = [v5 containsProperty:sel_sheetConfiguration];

  if (v6)
  {
    v7 = [v8 transitionContext];
    [(_UISceneHostingSheetPresentationClientComponent *)self applySheetConfigurationToLocalPresentationControllerWithTransitionContext:v7];
  }
}

- (void)applySheetConfigurationToLocalPresentationControllerWithTransitionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneComponent *)self scene];
  int v6 = [v5 settings];
  v7 = [v6 sheetConfiguration];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_localSheetPresentationController);
  v9 = WeakRetained;
  if (v7 && WeakRetained)
  {
    v10 = [WeakRetained containerView];
    v11 = [v10 window];

    [v11 layoutIfNeeded];
    [v9 _setConfiguration:v7];
    v12 = [v4 animationSettings];
    if (v12)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __125___UISceneHostingSheetPresentationClientComponent_applySheetConfigurationToLocalPresentationControllerWithTransitionContext___block_invoke;
      v13[3] = &unk_1E52D9F70;
      id v14 = v11;
      +[UIView _animateWithAnimationSettings:v12 animations:v13 completion:0];
    }
    else
    {
      [v11 layoutIfNeeded];
    }
  }
}

- (void)_sheetPresentationControllerClientConfigurationDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneComponent *)self clientScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __108___UISceneHostingSheetPresentationClientComponent__sheetPresentationControllerClientConfigurationDidChange___block_invoke;
  v7[3] = &unk_1E530F398;
  id v8 = v4;
  id v6 = v4;
  [v5 updateClientSettings:v7];
}

- (void)_sheetGrabberDidTriggerPrimaryAction
{
  id v5 = [(FBSSceneComponent *)self scene];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = +[_UISceneHostingSheetPresentationActionToHost actionForSheetGrabberDidTriggerPrimaryAction];
  id v4 = [v2 setWithObject:v3];
  [v5 sendPrivateActions:v4];
}

- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  BOOL v7 = a4;
  id v12 = [(FBSSceneComponent *)self scene];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v10 = +[_UISceneHostingSheetPresentationActionToHost actionForSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:](_UISceneHostingSheetPresentationActionToHost, "actionForSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", v7, a3, x, y);
  v11 = [v9 setWithObject:v10];
  [v12 sendPrivateActions:v11];
}

- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  id v15 = [(FBSSceneComponent *)self scene];
  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = +[_UISceneHostingSheetPresentationActionToHost actionForSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:](_UISceneHostingSheetPresentationActionToHost, "actionForSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", v7, v6, v11, v10, x, y);
  id v14 = [v12 setWithObject:v13];
  [v15 sendPrivateActions:v14];
}

- (void)_sheetInteractionDraggingDidEnd
{
  id v5 = [(FBSSceneComponent *)self scene];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = +[_UISceneHostingSheetPresentationActionToHost actionForSheetInteractionDraggingDidEnd];
  id v4 = [v2 setWithObject:v3];
  [v5 sendPrivateActions:v4];
}

- (UISheetPresentationController)_localSheetPresentationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localSheetPresentationController);
  return (UISheetPresentationController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end