@interface SBMainWorkspaceTransaction
- (SBMainWorkspaceTransaction)initWithTransitionRequest:(id)a3;
- (void)_didComplete;
@end

@implementation SBMainWorkspaceTransaction

- (void)_didComplete
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (![(SBMainWorkspaceTransaction *)self _isRootTransaction]) {
    goto LABEL_35;
  }
  unint64_t v3 = 0x1E4FA8000uLL;
  v4 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  int v5 = [v4 isEnabled];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v6 setObject:@"SBMainWorkspaceTransaction" forKeyedSubscript:@"LogSource"];
    v50 = @"VisibleUI";
  }
  else
  {
    v50 = 0;
    v6 = 0;
  }
  v7 = [(SBWorkspaceTransaction *)self windowScene];
  v8 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v51 = [v8 activeInterfaceOrientation];

  v9 = +[SBCoverSheetPresentationManager sharedInstance];
  char v10 = [v9 isVisible];

  if ((v10 & 1) == 0)
  {
    int IsActive = SBWorkspaceSpringBoardIsActive();
    v49 = v7;
    v13 = [v7 switcherController];
    v14 = [v13 layoutState];
    uint64_t v15 = [v14 unlockedEnvironmentMode];

    if (IsActive)
    {
      if (v15 != 2)
      {
        v11 = @"HomeScreen";
LABEL_26:
        v7 = v49;
        goto LABEL_29;
      }
      uint64_t v16 = [v13 interfaceOrientation];
      v7 = v49;
      if (!v5)
      {
        v11 = @"AppSwitcher";
LABEL_29:

        goto LABEL_30;
      }
      v17 = [NSNumber numberWithInteger:v16];
      [v6 setObject:v17 forKeyedSubscript:@"SwitcherInterfaceOrientation"];
      v11 = @"AppSwitcher";
    }
    else
    {
      if (v15 == 2)
      {
        uint64_t v18 = [v13 interfaceOrientation];
        if (!v5)
        {
          v11 = @"AppSwitcher";
          goto LABEL_26;
        }
        v17 = [NSNumber numberWithInteger:v18];
        [v6 setObject:v17 forKeyedSubscript:@"SwitcherInterfaceOrientation"];
        v11 = @"AppSwitcher";
      }
      else
      {
        v19 = [v13 layoutState];
        v20 = [v19 elementWithRole:1];
        v21 = [v20 workspaceEntity];
        v22 = [v21 deviceApplicationSceneEntity];
        v23 = [v22 sceneHandle];

        v24 = [v23 application];
        uint64_t v25 = [v24 bundleIdentifier];
        v26 = (void *)v25;
        v27 = @"Unknown";
        if (v25) {
          v27 = (__CFString *)v25;
        }
        v11 = v27;

        v17 = v23;
        uint64_t v28 = [v23 currentInterfaceOrientation];
        if (v5)
        {
          v47 = v17;
          v29 = [NSNumber numberWithInteger:v28];
          [v6 setObject:v29 forKeyedSubscript:@"AppInterfaceOrientation"];

          v48 = v13;
          v30 = [v13 layoutStateStudyLogData];
          [v6 addEntriesFromDictionary:v30];

          v31 = [(SBWorkspaceTransaction *)self transitionRequest];
          v32 = [v31 workspace];
          v33 = [v32 pipCoordinator];

          unint64_t v34 = 0;
          char v35 = 1;
          do
          {
            char v36 = v35;
            v37 = [v33 controllerForType:v34];
            if ([v37 isPictureInPictureWindowVisibleOnWindowScene:0])
            {
              v38 = SBStringFromSBPIPContentType(v34);
              [v6 setObject:@"Visible" forKeyedSubscript:v38];
            }
            char v35 = 0;
            unint64_t v34 = 1;
          }
          while ((v36 & 1) != 0);

          unint64_t v3 = 0x1E4FA8000;
          v13 = v48;
          v7 = v49;
          v17 = v47;
          goto LABEL_28;
        }
      }
      v7 = v49;
    }
LABEL_28:

    goto LABEL_29;
  }
  v11 = @"CoverSheet";
LABEL_30:
  v39 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    v40 = BSInterfaceOrientationDescription();
    v41 = BSInterfaceOrientationDescription();
    BSInterfaceOrientationDescription();
    v43 = v42 = v7;
    *(_DWORD *)buf = 138413058;
    v56 = v11;
    __int16 v57 = 2112;
    v58 = v40;
    __int16 v59 = 2112;
    v60 = v41;
    __int16 v61 = 2112;
    v62 = v43;
    _os_log_impl(&dword_1D85BA000, v39, OS_LOG_TYPE_INFO, "Visible UI change seen by Main Workspace Transaction: transition to %@ (SB interface orientation: %@, switcher interface orientation: %@,  app interface orientation: %@)", buf, 0x2Au);

    v7 = v42;
  }

  if (v5)
  {
    v44 = [NSNumber numberWithInteger:v51];
    [v6 setObject:v44 forKeyedSubscript:@"SBInterfaceOrientation"];

    [v6 setObject:v11 forKeyedSubscript:v50];
    v45 = [*(id *)(v3 + 2720) sharedInstance];
    v53 = @"VisibleUIChanged";
    v54 = v6;
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    [v45 log:v46];
  }
LABEL_35:
  v52.receiver = self;
  v52.super_class = (Class)SBMainWorkspaceTransaction;
  [(SBWorkspaceTransaction *)&v52 _didComplete];
}

- (SBMainWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainWorkspaceTransaction;
  return [(SBWorkspaceTransaction *)&v4 initWithTransitionRequest:a3];
}

@end