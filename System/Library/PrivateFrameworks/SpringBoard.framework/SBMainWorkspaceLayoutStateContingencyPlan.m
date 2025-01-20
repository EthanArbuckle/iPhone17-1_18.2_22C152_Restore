@interface SBMainWorkspaceLayoutStateContingencyPlan
- (id)transitionContextForLayoutContext:(id)a3 failedEntities:(id)a4;
- (id)transitionContextToUndoTransitionContext:(id)a3;
@end

@implementation SBMainWorkspaceLayoutStateContingencyPlan

- (id)transitionContextForLayoutContext:(id)a3 failedEntities:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 layoutState];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v78 objects:v83 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v79;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v79 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = [*(id *)(*((void *)&v78 + 1) + 8 * v12) uniqueIdentifier];
      v14 = [v7 elementWithIdentifier:v13];

      if (v14) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v78 objects:v83 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    v15 = +[SBWorkspaceTransitionContext context];
    [v15 setAnimationDisabled:1];
    v16 = [v5 displayIdentity];
    if (objc_msgSend(v16, "sb_displayWindowingMode") != 1)
    {
      v26 = +[SBWorkspaceEntity entity];
      [v15 setEntity:v26 forLayoutRole:1];
LABEL_48:

      goto LABEL_49;
    }
    v68 = v8;
    v17 = [(id)SBApp windowSceneManager];
    v18 = [v17 windowSceneForDisplayIdentity:v16];

    v19 = [v18 switcherController];
    v66 = v7;
    id v67 = v5;
    v64 = v18;
    v65 = v16;
    v63 = v19;
    if ([v7 unlockedEnvironmentMode] == 2)
    {
      [v15 setRequestedUnlockedEnvironmentMode:2];
      v20 = v68;
      if (([v19 isChamoisWindowingUIEnabled] & 1) == 0)
      {
        objc_msgSend(v7, "elementWithRole:");
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "elementWithRole:");
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v68, "bs_map:", &__block_literal_global_10_3);
        v24 = [v21 uniqueIdentifier];
        char v25 = [v23 containsObject:v24];

        if (v25) {
          +[SBWorkspaceEntity entity];
        }
        else {
        v32 = [v21 workspaceEntity];
        }
        [v15 setEntity:v32 forLayoutRole:1];

        if (v22
          && ([v22 uniqueIdentifier],
              v33 = objc_claimAutoreleasedReturnValue(),
              char v34 = [v23 containsObject:v33],
              v33,
              (v34 & 1) == 0))
        {
          v35 = [v22 workspaceEntity];
          v60 = [v21 uniqueIdentifier];
          int v61 = [v23 containsObject:v60];

          if (v61)
          {
            [v15 setEntity:v35 forLayoutRole:1];
            v62 = +[SBWorkspaceEntity entity];
            [v15 setEntity:v62 forLayoutRole:2];

            goto LABEL_29;
          }
        }
        else
        {
          v35 = +[SBWorkspaceEntity entity];
        }
        [v15 setEntity:v35 forLayoutRole:2];
LABEL_29:

        v20 = v68;
        goto LABEL_30;
      }
    }
    else
    {
      v20 = v68;
      if (![v19 isChamoisWindowingUIEnabled])
      {
        id v21 = +[SBWorkspaceEntity entity];
        id v22 = +[SBSetupManager sharedInstance];
        if ([v22 isInSetupMode] && objc_msgSend(v22, "updateInSetupMode"))
        {
          v29 = [v68 objectsPassingTest:&__block_literal_global_7_7];
          v30 = [v29 anyObject];

          if (v30)
          {
            id v31 = v30;

            id v21 = v31;
          }

          v20 = v68;
        }
        [v15 setEntity:v21 forLayoutRole:1];
        v23 = +[SBWorkspaceEntity entity];
        [v15 setEntity:v23 forLayoutRole:2];
        goto LABEL_30;
      }
    }
    v27 = objc_msgSend(v20, "bs_compactMap:", &__block_literal_global_368);
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __94__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextForLayoutContext_failedEntities___block_invoke_2;
    v74[3] = &unk_1E6B00330;
    id v75 = v7;
    id v76 = v27;
    id v77 = v28;
    id v22 = v28;
    v20 = v68;
    id v21 = v27;
    SBLayoutRoleEnumerateValidRoles(v74);
    [v15 setEntities:v22 withPolicy:0 centerEntity:0 floatingEntity:0];

    v23 = v75;
LABEL_30:

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v36 = v20;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v70 objects:v82 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v71;
      do
      {
        uint64_t v40 = 0;
        uint64_t v69 = v38;
        do
        {
          if (*(void *)v71 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v70 + 1) + 8 * v40);
          if ([v41 isApplicationSceneEntity])
          {
            v42 = [v41 application];
            if ((unint64_t)[v42 failedLaunchCount] > 1) {
              goto LABEL_38;
            }
            [(id)SBApp privacyPreflightController];
            uint64_t v43 = v39;
            v45 = id v44 = v36;
            [v42 info];
            v47 = v46 = v15;
            v48 = [v47 applicationIdentity];
            int v49 = [v45 requiresPreflightForApplication:v48];

            v15 = v46;
            id v36 = v44;
            uint64_t v39 = v43;
            uint64_t v38 = v69;
            if (v49)
            {
LABEL_38:
              v50 = [[SBWorkspaceEntityRemovalContext alloc] initWithAnimationStyle:0 removalActionType:1];
              [v15 setRemovalContext:v50 forEntity:v41];
            }
          }
          ++v40;
        }
        while (v38 != v40);
        uint64_t v38 = [v36 countByEnumeratingWithState:&v70 objects:v82 count:16];
      }
      while (v38);
    }

    v7 = v66;
    v26 = v64;
    if ([v36 count] == 1)
    {
      v51 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
      v52 = [v51 currentLayoutState];

      v53 = [v36 anyObject];
      v54 = [v53 uniqueIdentifier];
      [v52 elementWithIdentifier:v54];
      v56 = v55 = v15;
      uint64_t v57 = [v56 layoutRole];

      v15 = v55;
      if (v57 == 3)
      {
        [v55 setEntity:0 forLayoutRole:1];
        [v55 setEntity:0 forLayoutRole:2];
        v58 = +[SBWorkspaceEntity entity];
        [v55 setEntity:v58 forLayoutRole:3];

        if ([v66 isFloatingSwitcherVisible]) {
          [v55 setRequestedFloatingSwitcherVisible:1];
        }
      }
    }
    id v5 = v67;
    id v8 = v68;
    v16 = v65;
    goto LABEL_48;
  }
LABEL_9:
  v15 = 0;
  v16 = v8;
LABEL_49:

  return v15;
}

uint64_t __94__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextForLayoutContext_failedEntities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

void __94__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextForLayoutContext_failedEntities___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (SBLayoutRoleIsValidForSplitView(a2))
  {
    v4 = [*(id *)(a1 + 32) elementWithRole:a2];
    if (v4)
    {
      id v5 = *(void **)(a1 + 40);
      id v9 = v4;
      id v6 = [v4 uniqueIdentifier];
      LOBYTE(v5) = [v5 containsObject:v6];

      v4 = v9;
      if ((v5 & 1) == 0)
      {
        v7 = *(void **)(a1 + 48);
        id v8 = [v9 workspaceEntity];
        [v7 addObject:v8];

        v4 = v9;
      }
    }
  }
}

uint64_t __94__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextForLayoutContext_failedEntities___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 applicationSceneEntity];
  v3 = [v2 application];
  v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v4 isEqualToString:@"com.apple.purplebuddy"];

  return v5;
}

uint64_t __94__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextForLayoutContext_failedEntities___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (id)transitionContextToUndoTransitionContext:(id)a3
{
  id v3 = a3;
  v4 = +[SBWorkspaceTransitionContext context];
  [v4 setAnimationDisabled:1];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __86__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextToUndoTransitionContext___block_invoke;
  v14 = &unk_1E6B002B8;
  id v15 = v3;
  id v5 = v4;
  id v16 = v5;
  id v6 = v3;
  SBLayoutRoleEnumerateValidRoles(&v11);
  v7 = objc_msgSend(v6, "previousLayoutState", v11, v12, v13, v14);
  objc_msgSend(v5, "setInterfaceOrientation:", objc_msgSend(v7, "interfaceOrientation"));

  id v8 = v16;
  id v9 = v5;

  return v9;
}

void __86__SBMainWorkspaceLayoutStateContingencyPlan_transitionContextToUndoTransitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) previousEntityForLayoutRole:a2];
  v4 = [*(id *)(a1 + 32) entityForLayoutRole:a2];
  if (v8)
  {
    if ([v8 isHomeScreenEntity]) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5) {
      goto LABEL_10;
    }
  }
  else if (!v4)
  {
LABEL_10:
    [*(id *)(a1 + 40) setEntity:v8 forLayoutRole:a2];
    goto LABEL_12;
  }
  if ([v4 isHomeScreenEntity]) {
    goto LABEL_10;
  }
  id v6 = *(void **)(a1 + 40);
  v7 = +[SBWorkspaceEntity entity];
  [v6 setEntity:v7 forLayoutRole:a2];

LABEL_12:
}

@end