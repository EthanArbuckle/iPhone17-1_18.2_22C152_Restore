@interface _UISceneUserActivityBSActionsHandler
- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UISceneUserActivityBSActionsHandler

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_alloc_init(_UISceneConnectionOptionsContext);
  [(_UISceneConnectionOptionsContext *)v13 setUnprocessedActions:v9];
  v33 = v13;
  [(_UISceneConnectionOptionsContext *)v13 setLaunchOptionsDictionary:MEMORY[0x1E4F1CC08]];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v31 = v11;
    id v32 = v10;
    v34 = 0;
    v17 = 0;
    uint64_t v18 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v20, "UIActionType", v31, v32) == 6)
        {
          if ([v12 isUISubclass])
          {
            v21 = [v12 payload];
            v22 = [v21 objectForKeyedSubscript:@"UIApplicationLaunchOptionsSourceApplicationKey"];
          }
          else
          {
            v22 = 0;
          }
          v23 = [v12 originatingProcess];
          v24 = +[_UICanvasUserActivityManager _activityContinuationDictionaryWithAction:v20 sourceApplication:v22 originatingProcess:v23];

          if (v24)
          {
            if (v17)
            {
              [v17 addObject:v24];
            }
            else
            {
              v17 = [MEMORY[0x1E4F1CA80] setWithObject:v24];
              v39[0] = @"UICanvasConnectionOptionsUserActivityDictionariesKey";
              v39[1] = @"_UISceneConnectionOptionsUserActivityDictionariesKey";
              v40[0] = v17;
              v40[1] = v17;
              v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
              [(_UISceneConnectionOptionsContext *)v33 setLaunchOptionsDictionary:v25];
            }
            v26 = [v24 objectForKey:@"UICanvasConnectionOptionsUserActivityKey"];

            if (v26)
            {
              v27 = v34;
              if (!v34) {
                v27 = (void *)[v14 mutableCopy];
              }
              v34 = v27;
              [v27 removeObject:v20];
            }
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v16);

    if (v34)
    {
      v28 = (void *)[v34 copy];
      [(_UISceneConnectionOptionsContext *)v33 setUnprocessedActions:v28];

      v29 = v34;
      id v11 = v31;
      id v10 = v32;
      goto LABEL_26;
    }
    id v11 = v31;
    id v10 = v32;
  }
  else
  {

    v17 = 0;
  }
  [(_UISceneConnectionOptionsContext *)v33 setUnprocessedActions:v14];
  v29 = 0;
LABEL_26:

  return v33;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  if (!self->_canvasUserActivityManager)
  {
    uint64_t v15 = +[_UICanvasUserActivityManager _userActivityManagerForScene:v12];
    canvasUserActivityManager = self->_canvasUserActivityManager;
    self->_canvasUserActivityManager = v15;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
  v19 = v17;
  if (!v18) {
    goto LABEL_25;
  }
  uint64_t v20 = v18;
  uint64_t v21 = *(void *)v38;
  while (2)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v38 != v21) {
        objc_enumerationMutation(v17);
      }
      v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      if ([v23 UIActionType] == 6)
      {
        if ([v13 isUISubclass])
        {
          v24 = [v13 payload];
          v25 = [v24 objectForKeyedSubscript:@"UIApplicationLaunchOptionsSourceApplicationKey"];
        }
        else
        {
          v25 = 0;
        }
        v26 = [v13 originatingProcess];
        v27 = +[_UICanvasUserActivityManager _activityContinuationDictionaryWithAction:v23 sourceApplication:v25 originatingProcess:v26];

        if (!v27) {
          goto LABEL_24;
        }
        if ([(id)UIApp _appAdoptsUISceneLifecycle]) {
          goto LABEL_19;
        }
        v28 = [v12 delegate];
        if (objc_opt_respondsToSelector())
        {
          [v12 delegate];
          v29 = id v36 = v11;
          int v35 = [v29 _handleUserActivityForCanvas:v12];

          id v11 = v36;
          if (v35)
          {
LABEL_19:
            v30 = self->_canvasUserActivityManager;
            if (!v30)
            {
LABEL_24:
              v33 = (void *)[v17 mutableCopy];
              [v33 removeObject:v23];
              v19 = (void *)[v33 copy];

              goto LABEL_25;
            }
            id v31 = [(_UICanvasUserActivityManager *)v30 _activityContinuationManager];
            uint64_t v32 = [v12 activationState] == 2;
LABEL_23:
            [v31 handleActivityContinuation:v27 isSuspended:v32];

            goto LABEL_24;
          }
        }
        else
        {
        }
        id v31 = [(id)UIApp _getActivityContinuationManager];
        uint64_t v32 = [(id)UIApp isSuspended];
        goto LABEL_23;
      }
    }
    uint64_t v20 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v20) {
      continue;
    }
    break;
  }
  v19 = v17;
LABEL_25:

  return v19;
}

- (void).cxx_destruct
{
}

@end