@interface _UISceneSnapshotBSActionsHandler
- (BOOL)wantsAsyncSnapshot;
- (BOOL)wantsOwnAssertion;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UISceneSnapshotBSActionsHandler

- (BOOL)wantsOwnAssertion
{
  return 0;
}

- (BOOL)wantsAsyncSnapshot
{
  return 0;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 objectsPassingTest:&__block_literal_global_681];
  if ([v12 count] && objc_msgSend(v11, "_hostsWindows"))
  {
    id v13 = v11;
    BOOL v14 = [(_UISceneSnapshotBSActionsHandler *)self wantsOwnAssertion];
    BOOL v15 = [(_UISceneSnapshotBSActionsHandler *)self wantsAsyncSnapshot];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __98___UISceneSnapshotBSActionsHandler__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2;
    v22 = &unk_1E52DAD98;
    BOOL v26 = v14;
    id v23 = v10;
    id v24 = v13;
    id v25 = v12;
    BOOL v27 = v15;
    id v16 = v13;
    [v16 _enqueuePostSettingsUpdateResponseBlock:&v19 inPhase:0x1ED0EB300];
  }
  v17 = objc_msgSend(v9, "mutableCopy", v19, v20, v21, v22);
  [v17 minusSet:v12];

  return v17;
}

@end