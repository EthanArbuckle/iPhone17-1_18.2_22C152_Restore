@interface _UISceneUserNotificationsBSActionsHandler
- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation _UISceneUserNotificationsBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [MEMORY[0x1E4F1CA80] set];
  if (([(id)UIApp _appAdoptsUICanvasLifecycle] & 1) != 0
    || [(id)UIApp _appAdoptsUISceneLifecycle])
  {
    id v55 = v12;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      v17 = 0;
      uint64_t v18 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v70 != v18) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          if ([v20 UIActionType] == 26)
          {
            [v13 addObject:v20];
            if (v17)
            {
              [v17 addObject:v20];
              id v21 = v17;
            }
            else
            {
              id v21 = [MEMORY[0x1E4F1CA80] setWithObject:v20];
            }
            id v22 = v21;

            v17 = v22;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v69 objects:v80 count:16];
      }
      while (v16);
    }
    else
    {
      v17 = 0;
    }

    if ([v13 count] && v17)
    {
      id v53 = v10;
      id v54 = v9;
      id v23 = v17;
      id v52 = v11;
      id v24 = v11;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id obj = v23;
      uint64_t v25 = [v23 countByEnumeratingWithState:&v76 objects:v81 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v77;
        unint64_t v28 = 0x1E4F44000uLL;
        uint64_t v56 = *(void *)v77;
        id v57 = v24;
        v59 = v13;
        do
        {
          uint64_t v29 = 0;
          uint64_t v58 = v26;
          do
          {
            if (*(void *)v77 != v27) {
              objc_enumerationMutation(obj);
            }
            v30 = *(void **)(*((void *)&v76 + 1) + 8 * v29);
            v31 = objc_msgSend(*(id *)(v28 + 1664), "currentNotificationCenter", v52);
            v32 = [v31 delegate];
            if (objc_opt_respondsToSelector())
            {
              id v33 = [v30 response];
              if (v33)
              {
                v63 = v30;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v65 = (void *)MEMORY[0x1E4F44668];
                  v67 = [v33 notification];
                  uint64_t v34 = [v33 actionIdentifier];
                  uint64_t v35 = [v33 originIdentifier];
                  uint64_t v61 = [v33 targetConnectionEndpoint];
                  v36 = [v24 session];
                  v37 = [v36 persistentIdentifier];
                  v38 = [v33 userText];
                  v39 = v65;
                  v64 = (void *)v35;
                  v66 = (void *)v34;
                  uint64_t v40 = v35;
                  v41 = (void *)v61;
                  v42 = [v39 responseWithNotification:v67 actionIdentifier:v34 originIdentifier:v40 targetConnectionEndpoint:v61 targetSceneIdentifier:v37 userText:v38];
                }
                else
                {
                  v68 = (void *)MEMORY[0x1E4F44630];
                  uint64_t v43 = [v33 notification];
                  uint64_t v44 = [v33 actionIdentifier];
                  uint64_t v45 = [v33 originIdentifier];
                  uint64_t v62 = [v33 targetConnectionEndpoint];
                  v36 = [v24 session];
                  v37 = [v36 persistentIdentifier];
                  v46 = v68;
                  v66 = (void *)v44;
                  v67 = (void *)v43;
                  v64 = (void *)v45;
                  uint64_t v47 = v45;
                  v41 = (void *)v62;
                  v42 = [v46 responseWithNotification:v43 actionIdentifier:v44 originIdentifier:v47 targetConnectionEndpoint:v62 targetSceneIdentifier:v37];
                  v38 = v33;
                }

                uint64_t v27 = v56;
                id v24 = v57;
                uint64_t v26 = v58;
                v30 = v63;
              }
              else
              {
                v42 = 0;
              }
              v73[0] = MEMORY[0x1E4F143A8];
              v73[1] = 3221225472;
              v73[2] = ___UISceneSendNotificationResponseActionCallbackForScene_block_invoke;
              v73[3] = &unk_1E52D9F98;
              id v74 = v24;
              v75 = v30;
              v48 = _UIAutologgingVoidBlock(@"Warning: UNUserNotificationCenter delegate received call to -userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler: but the completion handler was never called.", v73);
              [v32 userNotificationCenter:v31 didReceiveNotificationResponse:v42 withCompletionHandler:v48];

              v13 = v59;
              unint64_t v28 = 0x1E4F44000;
            }

            ++v29;
          }
          while (v26 != v29);
          uint64_t v26 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
        }
        while (v26);
      }

      id v10 = v53;
      id v9 = v54;
      id v11 = v52;
    }

    id v12 = v55;
  }
  v49 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:", v9, v52);
  [v49 minusSet:v13];
  v50 = (void *)[v49 copy];

  return v50;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v26 = a4;
  id v27 = a5;
  id v28 = a6;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v11 = v9;
  id v12 = 0;
  v13 = 0;
  uint64_t v14 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v40;
    do
    {
      uint64_t v16 = 0;
      v17 = v12;
      uint64_t v18 = v10;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v11);
        }
        v19 = *(void **)(*((void *)&v39 + 1) + 8 * v16);
        if ([v19 UIActionType] == 26)
        {
          id v12 = v19;

          if ([v12 isDefaultAction])
          {
            v20 = [v12 response];
            v38 = v13;
            __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(&v38, (uint64_t)v20);
            id v21 = v38;

            v13 = v21;
          }
          v37 = v18;
          id v22 = &v37;
        }
        else
        {
          v36 = v18;
          id v22 = &v36;
          id v12 = v17;
        }
        __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(v22, (uint64_t)v19);
        id v10 = *v22;

        ++v16;
        v17 = v12;
        uint64_t v18 = v10;
      }
      while (v14 != v16);
      uint64_t v14 = [v11 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v14);
  }

  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__20;
  uint64_t v34 = __Block_byref_object_dispose__20;
  id v35 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116___UISceneUserNotificationsBSActionsHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_3;
  aBlock[3] = &unk_1E52DE488;
  aBlock[4] = &v30;
  id v23 = (void (**)(void *, void *, __CFString *))_Block_copy(aBlock);
  v23[2](v23, v13, @"_UISceneConnectionOptionsNotificationResponsesKey");
  id v24 = objc_alloc_init(_UISceneConnectionOptionsContext);
  [(_UISceneConnectionOptionsContext *)v24 setLaunchOptionsDictionary:v31[5]];
  [(_UISceneConnectionOptionsContext *)v24 setUnprocessedActions:v10];

  _Block_object_dispose(&v30, 8);
  return v24;
}

@end