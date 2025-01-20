@interface _UISceneShortcutItemBSActionsHandler
- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UISceneShortcutItemBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  char v45 = [(id)UIApp _appAdoptsUISceneLifecycle];
  v15 = [MEMORY[0x1E4F1CA80] set];
  v16 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"_UISceneShortcutItemBSActionsHandler.m", 67, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene self]]" object file lineNumber description];
  }
  id v18 = v13;
  if ([v14 isUISubclass]) {
    v19 = v14;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v21 = v11;
  id v22 = (id)[v21 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (!v22)
  {

    id v23 = 0;
    goto LABEL_25;
  }
  id v42 = v20;
  id v43 = v12;
  v44 = v18;
  id v23 = 0;
  v24 = 0;
  uint64_t v25 = *(void *)v49;
  do
  {
    for (i = 0; i != v22; i = (char *)i + 1)
    {
      if (*(void *)v49 != v25) {
        objc_enumerationMutation(v21);
      }
      v27 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      if ([v27 UIActionType] == 17)
      {
        [v15 addObject:v27];
        v47 = v24;
        __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v47, (uint64_t)v27);
        v28 = v47;

        v46 = v23;
        v29 = [v27 uiShortcutItem];
        __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v46, (uint64_t)v29);
        v30 = v46;

        id v23 = v30;
        v24 = v28;
      }
    }
    id v22 = (id)[v21 countByEnumeratingWithState:&v48 objects:v59 count:16];
  }
  while (v22);

  if (v24)
  {
    id v22 = v24;
    id v23 = v23;
    id v18 = v44;
    id v31 = v44;
    char v32 = [(id)UIApp _appAdoptsUISceneLifecycle];
    v33 = [v31 delegate];
    char v34 = objc_opt_respondsToSelector();

    v35 = [v31 delegate];
    if (v34)
    {
      v36 = [v23 anyObject];
      uint64_t v52 = MEMORY[0x1E4F143A8];
      uint64_t v53 = 3221225472;
      v54 = ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke;
      v55 = &unk_1E52DF270;
      char v58 = v32;
      id v56 = v22;
      id v57 = v31;
      [v35 windowScene:v57 performActionForShortcutItem:v36 completionHandler:&v52];
    }
    else
    {
      char v37 = objc_opt_respondsToSelector();

      if ((v37 & 1) == 0)
      {
LABEL_23:

        id v12 = v43;
        goto LABEL_24;
      }
      v35 = [v31 delegate];
      uint64_t v52 = MEMORY[0x1E4F143A8];
      uint64_t v53 = 3221225472;
      v54 = ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_3;
      v55 = &unk_1E52DF270;
      char v58 = v32;
      id v56 = v22;
      id v57 = v31;
      [v35 _canvas:v57 performActionForShortcutItems:v23 completionHandler:&v52];
    }

    id v18 = v44;
    goto LABEL_23;
  }
  id v22 = 0;
  id v12 = v43;
  id v18 = v44;
LABEL_24:
  id v20 = v42;
LABEL_25:
  if (v45)
  {
    v38 = [MEMORY[0x1E4F1CA80] setWithSet:v21];
    [v38 minusSet:v15];
    id v39 = (id)[v38 copy];
  }
  else
  {
    id v39 = v21;
  }

  return v39;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v24 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = v9;
  id v14 = 0;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v18, "UIActionType", v24) == 17)
        {
          v33 = v14;
          v19 = [v18 uiShortcutItem];
          __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v33, (uint64_t)v19);
          id v20 = v33;

          id v14 = v20;
        }
        else
        {
          char v32 = v12;
          __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v32, (uint64_t)v18);
          v19 = v12;
          id v12 = v32;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v15);
  }

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__46;
  v30 = __Block_byref_object_dispose__46;
  id v31 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111___UISceneShortcutItemBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_12;
  aBlock[3] = &unk_1E52DE488;
  aBlock[4] = &v26;
  id v21 = (void (**)(void *, void *, __CFString *))_Block_copy(aBlock);
  v21[2](v21, v14, @"_UISceneConnectionOptionsShortcutItemKey");
  id v22 = objc_alloc_init(_UISceneConnectionOptionsContext);
  [(_UISceneConnectionOptionsContext *)v22 setLaunchOptionsDictionary:v27[5]];
  [(_UISceneConnectionOptionsContext *)v22 setUnprocessedActions:v12];

  _Block_object_dispose(&v26, 8);
  return v22;
}

@end