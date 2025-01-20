@interface BLSBacklightFBSSceneEnvironment(UIKit)
- (_UIBacklightNullEnvironment)initWithScene:()UIKit;
- (id)_actionRespondersForScene:()UIKit;
- (id)_scene;
- (id)_settingsDiffActionsForScene:()UIKit;
- (void)_setScene:()UIKit;
@end

@implementation BLSBacklightFBSSceneEnvironment(UIKit)

- (id)_settingsDiffActionsForScene:()UIKit
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = bls_scenes_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1853B0000, v0, OS_LOG_TYPE_DEBUG, "BLSBacklightFBSSceneEnvironment (BacklightUIServices) _settingsDiffActionsForScene", v4, 2u);
  }

  v1 = objc_alloc_init(_UIBacklightUISceneEnvironmentDiffAction);
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v2;
}

- (id)_actionRespondersForScene:()UIKit
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = bls_scenes_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1853B0000, v0, OS_LOG_TYPE_DEBUG, "BLSBacklightFBSSceneEnvironment (BacklightUIServices) _actionRespondersForScene", v4, 2u);
  }

  v1 = objc_alloc_init(_UIBacklightUISceneEnvironmentActionHandler);
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v2;
}

- (void)_setScene:()UIKit
{
  id v8 = [a3 _FBSScene];
  if (v8)
  {
    id v5 = [a1 _FBSScene];

    if (v8 != v5)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [a1 _FBSScene];
      [v6 handleFailureInMethod:a2, a1, @"BLSBacklightFBSSceneEnvironment+UIKit.m", 74, @"unexpectedly scene changed from %@ to %@", v7, v8 object file lineNumber description];
    }
  }
  [a1 _setFBSScene:v8];
}

- (_UIBacklightNullEnvironment)initWithScene:()UIKit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 _FBSScene];
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__BLSBacklightFBSSceneEnvironment_UIKit__initWithScene___block_invoke;
    v10[3] = &unk_1E5304F40;
    v11 = v4;
    id v12 = a1;
    id v13 = v5;
    v6 = [v13 backlightSceneEnvironmentWithCreationBlock:v10];

    v7 = v11;
  }
  else
  {
    v6 = [[_UIBacklightNullEnvironment alloc] initWithScene:v4];
    v7 = bls_scenes_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v4 debugDescription];
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_INFO, "created environment:%@ scene:%@ which has nil FBSScene - this environment will not non-functional", buf, 0x16u);
    }
  }

  return v6;
}

- (id)_scene
{
  v1 = [a1 _FBSScene];
  v2 = +[UIScene _sceneForFBSScene:v1];

  return v2;
}

@end