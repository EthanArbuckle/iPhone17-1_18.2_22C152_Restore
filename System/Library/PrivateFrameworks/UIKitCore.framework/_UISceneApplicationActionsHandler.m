@interface _UISceneApplicationActionsHandler
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UISceneApplicationActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v12 isUISubclass]) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  v14 = +[_UISceneLifecycleMultiplexer sharedInstance];
  if ([v14 lifecycleWantsUnnecessaryDelayForSceneDelivery]
    && ([v14 activatedOnce] & 1) == 0)
  {
    v15 = (void *)UIApp;
    v16 = [(id)UIApp _workspace];
    [v15 workspace:v16 didReceiveActions:v9];
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99___UISceneApplicationActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke;
    v19[3] = &unk_1E52DCB30;
    id v20 = v9;
    id v21 = v10;
    id v22 = v13;
    [v11 _enqueuePostSettingsUpdateResponseBlock:v19 inPhase:0x1ED0EB2E0];
  }
  v17 = [MEMORY[0x1E4F1CAD0] set];

  return v17;
}

@end