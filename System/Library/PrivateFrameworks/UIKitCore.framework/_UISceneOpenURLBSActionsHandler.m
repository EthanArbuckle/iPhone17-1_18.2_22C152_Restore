@interface _UISceneOpenURLBSActionsHandler
- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UISceneOpenURLBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)UIApp;
  id v11 = a6;
  char v12 = [v10 _appAdoptsUISceneLifecycle];
  v13 = [v9 session];
  v19 = 0;
  v14 = _UISceneOpenURLContextsFromActionsSessionAndTransitionContext(v8, v13, v11, &v19);

  v15 = v19;
  if (v14) {
    _UISceneSendOpenURLActionCallbackForScene(v14, v9);
  }
  if (v12)
  {
    v16 = [MEMORY[0x1E4F1CA80] setWithSet:v8];
    [v16 minusSet:v15];
    id v17 = (id)[v16 copy];
  }
  else
  {
    id v17 = v8;
  }

  return v17;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v24 = a4;
  id v9 = a5;
  id v10 = a6;
  if ([v10 isUISubclass])
  {
    id v11 = objc_msgSend(v10, "payload", v24);
  }
  else
  {
    id v11 = 0;
  }
  v41 = 0;
  v25 = v9;
  v26 = v10;
  v28 = _UISceneOpenURLContextsFromActionsSessionAndTransitionContext(v29, v9, v10, &v41);
  v27 = v41;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__213;
  v39 = __Block_byref_object_dispose__213;
  id v40 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106___UISceneOpenURLBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke;
  aBlock[3] = &unk_1E52DE488;
  aBlock[4] = &v35;
  char v12 = (void (**)(void *, void *, __CFString *))_Block_copy(aBlock);
  v12[2](v12, v28, @"_UISceneConnectionOptionsURLContextKey");
  v43[0] = @"UIApplicationLaunchOptionsSourceApplicationKey";
  v43[1] = @"UIApplicationLaunchOptionsAppLinkOpenStrategyChangedKey";
  v44[0] = @"_UISceneConnectionOptionsSourceApplicationKey";
  v44[1] = @"_UISceneConnectionOptionsAppLinkOpenStrategyChangedKey";
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v18 = objc_msgSend(v11, "objectForKey:", v17, v24, v25, v26);
        if (v18)
        {
          v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v18];
          v20 = [v13 objectForKeyedSubscript:v17];
          v12[2](v12, v19, v20);
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v14);
  }

  v21 = objc_alloc_init(_UISceneConnectionOptionsContext);
  [(_UISceneConnectionOptionsContext *)v21 setLaunchOptionsDictionary:v36[5]];
  v22 = [MEMORY[0x1E4F1CA80] setWithSet:v29];
  [v22 minusSet:v27];
  [(_UISceneConnectionOptionsContext *)v21 setUnprocessedActions:v22];

  _Block_object_dispose(&v35, 8);
  return v21;
}

@end