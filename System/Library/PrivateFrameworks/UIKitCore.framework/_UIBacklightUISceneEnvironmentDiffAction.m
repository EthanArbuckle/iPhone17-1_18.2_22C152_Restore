@interface _UIBacklightUISceneEnvironmentDiffAction
- (_UIBacklightUISceneEnvironmentDiffAction)init;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)performChangesWithTransitionContext:(id)a3 environmentDelta:(id)a4 performActionsBlock:(id)a5;
@end

@implementation _UIBacklightUISceneEnvironmentDiffAction

- (_UIBacklightUISceneEnvironmentDiffAction)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UIBacklightUISceneEnvironmentDiffAction;
  v2 = [(_UIBacklightUISceneEnvironmentDiffAction *)&v7 init];
  if (v2)
  {
    v3 = bls_scenes_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v2;
      _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "create BLSBacklightUISceneEnvironmentDiffAction:%@", buf, 0xCu);
    }

    v4 = (BLSBacklightFBSSceneEnvironmentDiffAction *)objc_alloc_init(MEMORY[0x1E4F4F4F8]);
    fbsSceneEnvironmentDiffAction = v2->_fbsSceneEnvironmentDiffAction;
    v2->_fbsSceneEnvironmentDiffAction = v4;

    [(BLSBacklightFBSSceneEnvironmentDiffAction *)v2->_fbsSceneEnvironmentDiffAction setDelegate:v2];
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
}

- (void)performChangesWithTransitionContext:(id)a3 environmentDelta:(id)a4 performActionsBlock:(id)a5
{
  char v6 = (char)a4;
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __117___UIBacklightUISceneEnvironmentDiffAction_performChangesWithTransitionContext_environmentDelta_performActionsBlock___block_invoke;
  v11[3] = &unk_1E5304F68;
  id v12 = v7;
  id v13 = v8;
  char v14 = v6;
  id v9 = v7;
  id v10 = v8;
  _UISceneSettingsDiffActionPerformChangesWithTransitionContextAndCompletion(v9, v11, 0);
}

@end