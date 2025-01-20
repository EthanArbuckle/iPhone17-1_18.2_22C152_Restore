@interface _UIBacklightUISceneEnvironmentActionHandler
- (_UIBacklightUISceneEnvironmentActionHandler)init;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UIBacklightUISceneEnvironmentActionHandler

- (void).cxx_destruct
{
}

- (_UIBacklightUISceneEnvironmentActionHandler)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UIBacklightUISceneEnvironmentActionHandler;
  v2 = [(_UIBacklightUISceneEnvironmentActionHandler *)&v7 init];
  if (v2)
  {
    v3 = bls_scenes_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v2;
      _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "create BLSBacklightUISceneEnvironmentActionHandler:%@", buf, 0xCu);
    }

    v4 = (BLSBacklightFBSSceneEnvironmentActionHandler *)objc_alloc_init(MEMORY[0x1E4F4F4F0]);
    fbsSceneEnvironmentDiffAction = v2->_fbsSceneEnvironmentDiffAction;
    v2->_fbsSceneEnvironmentDiffAction = v4;
  }
  return v2;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  return (id)[(BLSBacklightFBSSceneEnvironmentActionHandler *)self->_fbsSceneEnvironmentDiffAction respondToActions:a3 forFBSScene:a4 fromTransitionContext:a6];
}

@end