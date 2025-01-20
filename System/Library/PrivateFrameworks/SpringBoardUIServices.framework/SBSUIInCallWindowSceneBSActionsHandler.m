@interface SBSUIInCallWindowSceneBSActionsHandler
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation SBSUIInCallWindowSceneBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)[v9 mutableCopy];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_45;
  }
  id v32 = v12;
  id v33 = v10;
  id v14 = v11;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v34 = v9;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v16)
  {
    uint64_t v35 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_25;
  }
  uint64_t v17 = v16;
  uint64_t v35 = 0;
  v18 = 0;
  v19 = 0;
  uint64_t v20 = *(void *)v41;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v41 != v20) {
        objc_enumerationMutation(v15);
      }
      uint64_t v22 = *(void *)(*((void *)&v40 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v18)
        {
          v23 = v18;
        }
        else
        {
          v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          v18 = v23;
        }
LABEL_19:
        [v23 addObject:v22];
        goto LABEL_20;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v19)
        {
          v23 = v19;
        }
        else
        {
          v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          v19 = v23;
        }
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BYTE4(v35) = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        LOBYTE(v35) = 1;
      }
LABEL_20:
      [v13 removeObject:v22];
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
  }
  while (v17);
LABEL_25:

  if ([v18 count]) {
    [v14 _handleHardwareButtonEventSceneActions:v18];
  }
  if ([v19 count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v24 = v19;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v24);
          }
          [v14 _handleDeviceLockAction:*(void *)(*((void *)&v36 + 1) + 8 * j)];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v26);
    }
  }
  id v10 = v33;
  id v9 = v34;
  if ((v35 & 0x100000000) != 0)
  {
    v29 = [v14 delegate];
    if (objc_opt_respondsToSelector()) {
      [v29 inCallWindowSceneHandleShowingNoticeForRevealingSystemControls:v14];
    }
  }
  if (v35)
  {
    v30 = [v14 delegate];
    if (objc_opt_respondsToSelector()) {
      [v30 inCallWindowSceneHandleSilenceRingtone:v14];
    }
  }
  id v12 = v32;
LABEL_45:

  return v13;
}

@end