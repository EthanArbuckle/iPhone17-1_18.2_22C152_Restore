@interface UITabBarController(PXPPTSupport)
- (void)_switchToBarBarItem:()PXPPTSupport completionHandler:;
- (void)ppt_runTabSwitchingTestWithName:()PXPPTSupport options:delegate:completionHandler:;
@end

@implementation UITabBarController(PXPPTSupport)

- (void)_switchToBarBarItem:()PXPPTSupport completionHandler:
{
  id v10 = a4;
  v5 = (void *)MEMORY[0x1E4FB1438];
  id v6 = a3;
  v7 = [v5 sharedApplication];
  if (v10) {
    [v7 installCACommitCompletionBlock:v10];
  }
  uint64_t v8 = [v6 action];
  v9 = [v6 target];
  [v7 sendAction:v8 to:v9 from:v6 forEvent:0];
}

- (void)ppt_runTabSwitchingTestWithName:()PXPPTSupport options:delegate:completionHandler:
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6) {
    v13 = a6;
  }
  else {
    v13 = &__block_literal_global_194529;
  }
  v14 = (void (**)(void *, void))_Block_copy(v13);
  v15 = [a1 selectedViewController];
  v16 = [v15 tabBarItem];

  if (v16)
  {
    v17 = [a1 viewControllers];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v19 = [v11 objectForKeyedSubscript:@"tab"];
    v20 = v19;
    if (!v19)
    {
      [v12 failedTest:v10 withFailureFormat:@"No tab specified"];
      v14[2](v14, 0);
LABEL_35:

      goto LABEL_36;
    }
    v46 = v14;
    v47 = v12;
    v45 = v17;
    if ([v19 isEqualToString:@"all"])
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v21 = v17;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v59 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = [*(id *)(*((void *)&v58 + 1) + 8 * i) tabBarItem];
            [v18 addObject:v26];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v23);
      }

      [v18 removeObject:v16];
      [v18 insertObject:v16 atIndex:0];
      [v18 addObject:v16];
    }
    else
    {
      id v43 = v11;
      id v44 = v10;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v28 = v17;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (!v29)
      {
LABEL_28:

LABEL_32:
        id v12 = v47;
        id v10 = v44;
        [v47 failedTest:v44, @"Couldn't find tab bar item for tab “%@”", v20 withFailureFormat];
        v14 = v46;
        v46[2](v46, 0);
        id v11 = v43;
LABEL_34:
        v17 = v45;
        goto LABEL_35;
      }
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v55;
LABEL_22:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v55 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = [*(id *)(*((void *)&v54 + 1) + 8 * v32) tabBarItem];
        v34 = [v33 title];
        uint64_t v35 = [v34 caseInsensitiveCompare:v20];

        if (!v35) {
          break;
        }

        if (v30 == ++v32)
        {
          uint64_t v30 = [v28 countByEnumeratingWithState:&v54 objects:v63 count:16];
          if (v30) {
            goto LABEL_22;
          }
          goto LABEL_28;
        }
      }

      if (!v33) {
        goto LABEL_32;
      }
      id v11 = v43;
      id v10 = v44;
      v14 = v46;
      id v12 = v47;
      if (v16 != v33)
      {
        [v18 addObject:v16];
        [v18 addObject:v33];

        goto LABEL_16;
      }
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v36 = v28;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v62 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v51;
        while (2)
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v51 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = [*(id *)(*((void *)&v50 + 1) + 8 * j) tabBarItem];
            if ((void *)v41 != v16)
            {
              v42 = (void *)v41;
              [v18 addObject:v41];

              goto LABEL_47;
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v50 objects:v62 count:16];
          if (v38) {
            continue;
          }
          break;
        }
      }
LABEL_47:

      [v18 addObject:v16];
    }
    v14 = v46;
    id v12 = v47;
LABEL_16:
    if ([v18 count])
    {
      v27 = [v11 objectForKeyedSubscript:@"iterations"];
      [v27 integerValue];

      [v12 startedTest:v10];
      v18;
      id v48 = v12;
      id v49 = v10;
      v16;
      v48;
      v49;
      v14;
      PXIterateAsynchronously();
    }
    [v12 failedTest:v10 withFailureFormat:@"couldn't find tab bar items to cycle through"];
    v14[2](v14, 0);
    goto LABEL_34;
  }
  [v12 failedTest:v10 withFailureFormat:@"Couldn't find initially selected tab bar item"];
  v14[2](v14, 0);
LABEL_36:
}

@end