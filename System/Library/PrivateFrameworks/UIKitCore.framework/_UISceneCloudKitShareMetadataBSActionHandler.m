@interface _UISceneCloudKitShareMetadataBSActionHandler
- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UISceneCloudKitShareMetadataBSActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v41 = a4;
  id v12 = a5;
  id v40 = a6;
  char v13 = [(id)UIApp _appAdoptsUISceneLifecycle];
  v14 = [MEMORY[0x1E4F1CA80] set];
  v15 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"_UISceneCloudKitShareMetadataBSActionHandler.m", 30, @"Invalid parameter not satisfying: %@", @"[uiScene isKindOfClass:[UIWindowScene self]]" object file lineNumber description];
  }
  id v17 = v12;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    char v39 = v13;
    v21 = 0;
    uint64_t v22 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ([v24 UIActionType] == 23)
        {
          [v14 addObject:v24];
          v25 = [v24 shareMetadata];
          if (v21)
          {
            [v21 addObject:v25];
            id v26 = v21;
          }
          else
          {
            id v26 = [MEMORY[0x1E4F1CA80] setWithObject:v25];
          }
          id v27 = v26;

          v21 = v27;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v20);

    if (!v21)
    {
      v34 = 0;
      if (v39) {
        goto LABEL_21;
      }
      goto LABEL_23;
    }
    id v28 = v21;
    id v29 = v17;
    v30 = [v29 delegate];
    char v31 = objc_opt_respondsToSelector();

    char v13 = v39;
    if (v31)
    {
      v32 = [v29 delegate];
      v33 = [v28 anyObject];
      [v32 windowScene:v29 userDidAcceptCloudKitShareWithMetadata:v33];
    }
    v34 = v28;
  }
  else
  {
    v34 = 0;
    id v28 = v18;
  }

  if (v13)
  {
LABEL_21:
    v35 = [MEMORY[0x1E4F1CA80] setWithSet:v18];
    [v35 minusSet:v14];
    id v36 = (id)[v35 copy];

    goto LABEL_24;
  }
LABEL_23:
  id v36 = v18;
LABEL_24:

  return v36;
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
  v14 = 0;
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
        if (objc_msgSend(v18, "UIActionType", v24) == 23)
        {
          v33 = v14;
          uint64_t v19 = [v18 shareMetadata];
          __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v33, (uint64_t)v19);
          uint64_t v20 = v33;

          v14 = v20;
        }
        else
        {
          v32 = v12;
          __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v32, (uint64_t)v18);
          uint64_t v19 = v12;
          id v12 = v32;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v15);
  }

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__17;
  v30 = __Block_byref_object_dispose__17;
  id v31 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_12;
  aBlock[3] = &unk_1E52DE488;
  aBlock[4] = &v26;
  v21 = (void (**)(void *, void *, __CFString *))_Block_copy(aBlock);
  v21[2](v21, v14, @"_UISceneConnectionOptionsCloudKitShareMetadataKey");
  uint64_t v22 = objc_alloc_init(_UISceneConnectionOptionsContext);
  [(_UISceneConnectionOptionsContext *)v22 setLaunchOptionsDictionary:v27[5]];
  [(_UISceneConnectionOptionsContext *)v22 setUnprocessedActions:v12];

  _Block_object_dispose(&v26, 8);
  return v22;
}

@end