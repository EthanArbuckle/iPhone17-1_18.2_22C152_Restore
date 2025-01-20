@interface SBUISwitcherAnimationController
- (BOOL)_isInterruptible;
- (BOOL)isInterruptible;
- (BOOL)isReasonableMomentToInterrupt;
- (BOOL)shouldResignActiveForAnimation;
- (NSObject)activityToken;
- (SBSwitcherContentViewControlling)contentViewController;
- (SBUISwitcherAnimationController)initWithWorkspaceTransitionRequest:(id)a3 contentViewController:(id)a4 childAnimationControllers:(id)a5 animationBlock:(id)a6;
- (id)_layoutState;
- (id)_previousLayoutState;
- (id)_windowScene;
- (id)animationBlock;
- (id)animationSettings;
- (void)_addSignpostsAndBeginAnimationTrackingForAnimationStart;
- (void)_addSignpostsAndEndAnimationTrackingForAnimationEnd;
- (void)_didComplete;
- (void)_setInterruptible:(BOOL)a3;
- (void)_startAnimation;
- (void)_updatePPTsForAnimationEnd;
- (void)_updatePPTsForAnimationStart;
- (void)animationControllerDidFinishAnimation:(id)a3;
- (void)setActivityToken:(id)a3;
- (void)setAnimationBlock:(id)a3;
- (void)setContentViewController:(id)a3;
@end

@implementation SBUISwitcherAnimationController

- (id)animationSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  v3 = [WeakRetained defaultTransitionAnimationSettings];

  return v3;
}

- (SBUISwitcherAnimationController)initWithWorkspaceTransitionRequest:(id)a3 contentViewController:(id)a4 childAnimationControllers:(id)a5 animationBlock:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_15:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SBUISwitcherAnimationController.m", 50, @"Invalid parameter not satisfying: %@", @"contentViewController" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"SBUISwitcherAnimationController.m", 49, @"Invalid parameter not satisfying: %@", @"workspaceTransitionRequest" object file lineNumber description];

  if (!v12) {
    goto LABEL_15;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_16:
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"SBUISwitcherAnimationController.m", 51, @"Invalid parameter not satisfying: %@", @"animationBlock" object file lineNumber description];

LABEL_4:
  v33.receiver = self;
  v33.super_class = (Class)SBUISwitcherAnimationController;
  v15 = [(SBUIWorkspaceAnimationController *)&v33 initWithWorkspaceTransitionRequest:v11];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_contentViewController, v12);
    uint64_t v17 = MEMORY[0x1D948C7A0](v14);
    id animationBlock = v16->_animationBlock;
    v16->_id animationBlock = (id)v17;

    *(&v16->_interruptible + 6) = 1;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v13;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          [v24 addObserver:v16];
          [(SBUIAnimationController *)v16 addCoordinatingChildTransaction:v24 withSchedulingPolicy:0];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v21);
    }

    [(SBUIAnimationController *)v16 addObserver:v16];
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityToken, 0);
  objc_storeStrong(&self->_animationBlock, 0);
  objc_destroyWeak((id *)&self->_contentViewController);
}

- (void)animationControllerDidFinishAnimation:(id)a3
{
  if (self == a3)
  {
    [(SBUISwitcherAnimationController *)self _addSignpostsAndEndAnimationTrackingForAnimationEnd];
    [(SBUISwitcherAnimationController *)self _updatePPTsForAnimationEnd];
  }
}

- (void)_updatePPTsForAnimationEnd
{
  v2 = (id *)MEMORY[0x1E4F43630];
  if (![(id)*MEMORY[0x1E4F43630] isRunningTest]) {
    return;
  }
  uint64_t v3 = @"AppOpen";
  int v4 = [*v2 isRunningTest:@"AppOpen"];
  id v5 = *v2;
  if (v4) {
    goto LABEL_3;
  }
  uint64_t v3 = @"AppClose";
  int v7 = [v5 isRunningTest:@"AppClose"];
  id v5 = *v2;
  if (v7) {
    goto LABEL_5;
  }
  uint64_t v3 = @"AppOpenInFolder";
  int v8 = [v5 isRunningTest:@"AppOpenInFolder"];
  id v5 = *v2;
  if (v8)
  {
LABEL_3:
    v6 = @"AppOpenAnimation";
LABEL_6:
    [v5 finishedSubTest:v6 forTest:v3];
    return;
  }
  uint64_t v3 = @"AppCloseInFolder";
  int v9 = [v5 isRunningTest:@"AppCloseInFolder"];
  id v5 = *v2;
  if (v9) {
    goto LABEL_5;
  }
  uint64_t v3 = @"AppOpenCenterZoom";
  int v10 = [v5 isRunningTest:@"AppOpenCenterZoom"];
  id v5 = *v2;
  if (v10)
  {
    v6 = @"AppOpenCenterZoomAnimation";
    goto LABEL_6;
  }
  uint64_t v3 = @"AppCloseCenterZoom";
  int v11 = [v5 isRunningTest:@"AppCloseCenterZoom"];
  id v5 = *v2;
  if (v11)
  {
    v6 = @"AppCloseCenterZoomAnimation";
    goto LABEL_6;
  }
  uint64_t v3 = @"AppOpenInScreenTime";
  int v12 = [v5 isRunningTest:@"AppOpenInScreenTime"];
  id v5 = *v2;
  if (v12) {
    goto LABEL_3;
  }
  uint64_t v3 = @"AppCloseInScreenTime";
  int v13 = [v5 isRunningTest:@"AppCloseInScreenTime"];
  id v5 = *v2;
  if (v13)
  {
LABEL_5:
    v6 = @"AppCloseAnimation";
    goto LABEL_6;
  }
  if (([v5 isRunningTest:@"AppSliderBringup"] & 1) != 0
    || ([*v2 isRunningTest:@"AppSliderBringupRotated"] & 1) != 0
    || ([*v2 isRunningTest:@"AppSliderBringupOverApp"] & 1) != 0
    || ([*v2 isRunningTest:@"AppSliderBringupOverAppRotated"] & 1) != 0
    || ([*v2 isRunningTest:@"AppSliderBringupOverAppInScreenTime"] & 1) != 0
    || [*v2 isRunningTest:@"AppSliderBringupOverAppInScreenTimeRotated"])
  {
    id v14 = +[SBApplicationTestingManager sharedInstance];
    id v19 = [v14 currentTestName];

    [*v2 finishedSubTest:@"AppSliderBringupAnimation" forTest:v19];
    id v15 = *v2;
LABEL_24:
    [v15 finishedTest:v19];
LABEL_25:

    return;
  }
  if (([*v2 isRunningTest:@"AppSliderDismiss"] & 1) != 0
    || [*v2 isRunningTest:@"AppSliderDismissRotated"])
  {
    v16 = +[SBApplicationTestingManager sharedInstance];
    id v19 = [v16 currentTestName];

    [(id)SBApp finishedSubTest:@"animation" forTest:v19];
    id v15 = (id)SBApp;
    goto LABEL_24;
  }
  if (([*v2 isRunningTest:@"AppSliderDismissOverApp"] & 1) != 0
    || ([*v2 isRunningTest:@"AppSliderDismissOverAppRotated"] & 1) != 0
    || ([*v2 isRunningTest:@"AppSliderDismissOverAppInScreenTime"] & 1) != 0
    || [*v2 isRunningTest:@"AppSliderDismissOverAppInScreenTimeRotated"])
  {
    uint64_t v17 = +[SBApplicationTestingManager sharedInstance];
    id v19 = [v17 currentTestName];

    [(id)SBApp finishedSubTest:@"animation" forTest:v19];
    [(id)SBApp finishedTest:v19];
    SBWorkspaceSuspendActiveDisplay();
    goto LABEL_25;
  }
  if ([(id)SBApp isRunningTest:@"AppSliderTapContinuityBanner"])
  {
    id v18 = *v2;
    [v18 finishedTest:@"AppSliderTapContinuityBanner"];
  }
}

- (void)_addSignpostsAndEndAnimationTrackingForAnimationEnd
{
  uint64_t v3 = [(SBUISwitcherAnimationController *)self _layoutState];
  int v4 = [(SBUISwitcherAnimationController *)self _previousLayoutState];
  if ([v4 unlockedEnvironmentMode] == 1)
  {
    if ([v3 unlockedEnvironmentMode] != 3)
    {
      if ([v3 unlockedEnvironmentMode] != 2) {
        goto LABEL_28;
      }
      id v5 = SBLogTelemetrySignposts();
      if (!os_signpost_enabled(v5)) {
        goto LABEL_27;
      }
      __int16 v16 = 0;
      v6 = "SB_HOME_TO_SWITCHER_ANIMATION";
      int v7 = (uint8_t *)&v16;
      goto LABEL_26;
    }
    id v5 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v5))
    {
      __int16 v17 = 0;
      v6 = "SB_HOME_TO_APP_ANIMATION";
      int v7 = (uint8_t *)&v17;
LABEL_26:
      _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v6, " enableTelemetry=YES  isAnimation=YES ", v7, 2u);
    }
  }
  else if ([v4 unlockedEnvironmentMode] == 2)
  {
    if ([v3 unlockedEnvironmentMode] != 3)
    {
      if ([v3 unlockedEnvironmentMode] != 1) {
        goto LABEL_28;
      }
      id v5 = SBLogTelemetrySignposts();
      if (!os_signpost_enabled(v5)) {
        goto LABEL_27;
      }
      __int16 v14 = 0;
      v6 = "SB_SWITCHER_TO_HOME_ANIMATION";
      int v7 = (uint8_t *)&v14;
      goto LABEL_26;
    }
    id v5 = SBLogTelemetrySignposts();
    if (os_signpost_enabled(v5))
    {
      __int16 v15 = 0;
      v6 = "SB_SWITCHER_TO_APP_ANIMATION";
      int v7 = (uint8_t *)&v15;
      goto LABEL_26;
    }
  }
  else
  {
    if ([v4 unlockedEnvironmentMode] != 3) {
      goto LABEL_28;
    }
    if ([v3 unlockedEnvironmentMode] == 1)
    {
      id v5 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_APP_TO_HOME_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
      }
      goto LABEL_27;
    }
    if ([v3 unlockedEnvironmentMode] == 3)
    {
      id v5 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v5))
      {
        __int16 v12 = 0;
        v6 = "SB_APP_TO_APP_ANIMATION";
        int v7 = (uint8_t *)&v12;
        goto LABEL_26;
      }
    }
    else
    {
      if ([v3 unlockedEnvironmentMode] != 2) {
        goto LABEL_28;
      }
      id v5 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v5))
      {
        LOWORD(v11) = 0;
        v6 = "SB_APP_TO_SWITCHER_ANIMATION";
        int v7 = (uint8_t *)&v11;
        goto LABEL_26;
      }
    }
  }
LABEL_27:

  kdebug_trace();
LABEL_28:
  int v8 = [(SBUISwitcherAnimationController *)self activityToken];

  if (v8)
  {
    if (([(SBUISwitcherAnimationController *)self isInterrupted] & 1) == 0)
    {
      int v9 = [MEMORY[0x1E4F28F80] processInfo];
      int v10 = [(SBUISwitcherAnimationController *)self activityToken];
      [v9 endActivity:v10];
    }
    [(SBUISwitcherAnimationController *)self setActivityToken:0];
  }
}

- (NSObject)activityToken
{
  return self->_activityToken;
}

- (void)_didComplete
{
  id animationBlock = self->_animationBlock;
  self->_id animationBlock = 0;

  if (([(SBUISwitcherAnimationController *)self isInterrupted] & 1) == 0)
  {
    int v4 = [(SBUIWorkspaceAnimationController *)self workspaceTransitionRequest];
    id v5 = [(SBUISwitcherAnimationController *)self _layoutState];
    uint64_t v6 = [v5 unlockedEnvironmentMode];
    uint64_t v7 = [v5 unlockedEnvironmentMode];
    uint64_t v8 = [v4 source];
    BOOL v9 = v6 == 1 && v8 == 15;
    if (v9 || v7 != 3) {
      goto LABEL_26;
    }
    int v10 = [(SBUISwitcherAnimationController *)self _windowScene];
    uint64_t v11 = +[SBIconController sharedInstance];
    __int16 v12 = [v10 homeScreenController];
    int v13 = [v12 iconManager];
    __int16 v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v11 iconManager];
    }
    __int16 v16 = v15;

    [v16 presentHomeScreenIconsAnimated:0];
    __int16 v17 = [(SBUISwitcherAnimationController *)self _previousLayoutState];
    uint64_t v18 = [v17 unlockedEnvironmentMode];
    BOOL v20 = [v4 source] == 2 && v18 == 1;
    if (v12)
    {
      if ([v12 isTodayOverlaySpotlightVisible])
      {
LABEL_18:
        uint64_t v21 = v12;
LABEL_24:
        [v21 dismissTodayOverlayAnimated:0];
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
    }
    else if ([v11 isTodayOverlaySpotlightVisible])
    {
      goto LABEL_23;
    }
    if (!v20 || ![v16 isOverlayTodayViewVisible]) {
      goto LABEL_25;
    }
    if (v12) {
      goto LABEL_18;
    }
LABEL_23:
    uint64_t v21 = v11;
    goto LABEL_24;
  }
LABEL_27:
  v22.receiver = self;
  v22.super_class = (Class)SBUISwitcherAnimationController;
  [(SBUISwitcherAnimationController *)&v22 _didComplete];
}

- (void)_addSignpostsAndBeginAnimationTrackingForAnimationStart
{
  uint64_t v3 = [(SBUISwitcherAnimationController *)self _layoutState];
  int v4 = [(SBUISwitcherAnimationController *)self _previousLayoutState];
  if ([v4 unlockedEnvironmentMode] == 1)
  {
    if ([v3 unlockedEnvironmentMode] == 3)
    {
      id v5 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_TO_APP_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
      }
      uint64_t v6 = @"HomeToApp";
    }
    else
    {
      if ([v3 unlockedEnvironmentMode] != 2) {
        goto LABEL_36;
      }
      id v5 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)__int16 v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_TO_SWITCHER_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v16, 2u);
      }
      uint64_t v6 = @"HomeToSwitcher";
    }
  }
  else if ([v4 unlockedEnvironmentMode] == 2)
  {
    if ([v3 unlockedEnvironmentMode] == 3)
    {
      id v5 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)id v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_SWITCHER_TO_APP_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v15, 2u);
      }
      uint64_t v6 = @"SwitcherToApp";
    }
    else
    {
      if ([v3 unlockedEnvironmentMode] != 1) {
        goto LABEL_36;
      }
      id v5 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)__int16 v14 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_SWITCHER_TO_HOME_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v14, 2u);
      }
      uint64_t v6 = @"SwitcherToHome";
    }
  }
  else
  {
    if ([v4 unlockedEnvironmentMode] != 3) {
      goto LABEL_36;
    }
    if ([v3 unlockedEnvironmentMode] == 1)
    {
      id v5 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)int v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_APP_TO_HOME_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v13, 2u);
      }
      uint64_t v6 = @"AppToHome";
    }
    else if ([v3 unlockedEnvironmentMode] == 3)
    {
      id v5 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)__int16 v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_APP_TO_APP_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v12, 2u);
      }
      uint64_t v6 = @"AppToApp";
    }
    else
    {
      if ([v3 unlockedEnvironmentMode] != 2) {
        goto LABEL_36;
      }
      id v5 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_APP_TO_SWITCHER_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
      }
      uint64_t v6 = @"AppToSwitcher";
    }
  }

  kdebug_trace();
  if ([(SBUIAnimationController *)self isInteractive]) {
    uint64_t v7 = @"-Dragging";
  }
  else {
    uint64_t v7 = @"-Animating";
  }
  uint64_t v8 = [(__CFString *)v6 stringByAppendingString:v7];
  BOOL v9 = [MEMORY[0x1E4F28F80] processInfo];
  int v10 = [v9 beginActivityWithOptions:0x200000000000 reason:v8];
  [(SBUISwitcherAnimationController *)self setActivityToken:v10];

LABEL_36:
}

- (id)_previousLayoutState
{
  v2 = [(SBUIWorkspaceAnimationController *)self workspaceTransitionRequest];
  uint64_t v3 = [v2 applicationContext];
  int v4 = [v3 previousLayoutState];

  return v4;
}

- (void)_startAnimation
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBUISwitcherAnimationController had to enable UIView animations because they were disabled", v1, 2u);
}

- (id)_layoutState
{
  v2 = [(SBUIWorkspaceAnimationController *)self workspaceTransitionRequest];
  uint64_t v3 = [v2 applicationContext];
  int v4 = [v3 layoutState];

  return v4;
}

- (id)_windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  if (objc_opt_respondsToSelector())
  {
    int v4 = [WeakRetained _sbWindowScene];
  }
  else
  {
    id v5 = [(id)SBApp windowSceneManager];
    uint64_t v6 = [(SBUIWorkspaceAnimationController *)self workspaceTransitionRequest];
    uint64_t v7 = [v6 displayIdentity];
    int v4 = [v5 windowSceneForDisplayIdentity:v7];
  }
  return v4;
}

- (void)_updatePPTsForAnimationStart
{
  v2 = (id *)MEMORY[0x1E4F43630];
  if ([(id)*MEMORY[0x1E4F43630] isRunningTest])
  {
    int v3 = [*v2 isRunningTest:@"AppOpen"];
    id v4 = *v2;
    if (v3)
    {
      [v4 finishedSubTest:@"workspaceActivate" forTest:@"AppOpen"];
      id v5 = *v2;
      uint64_t v6 = &__block_literal_global_51;
    }
    else
    {
      int v7 = [v4 isRunningTest:@"AppClose"];
      id v8 = *v2;
      if (v7)
      {
        [v8 finishedSubTest:@"workspaceDeactivate" forTest:@"AppClose"];
        id v5 = *v2;
        uint64_t v6 = &__block_literal_global_48;
      }
      else
      {
        int v9 = [v8 isRunningTest:@"AppOpenInFolder"];
        id v10 = *v2;
        if (v9)
        {
          [v10 finishedSubTest:@"workspaceActivate" forTest:@"AppOpenInFolder"];
          id v5 = *v2;
          uint64_t v6 = &__block_literal_global_50;
        }
        else
        {
          int v11 = [v10 isRunningTest:@"AppCloseInFolder"];
          id v12 = *v2;
          if (v11)
          {
            [v12 finishedSubTest:@"workspaceDeactivate" forTest:@"AppCloseInFolder"];
            id v5 = *v2;
            uint64_t v6 = &__block_literal_global_52;
          }
          else
          {
            int v13 = [v12 isRunningTest:@"AppOpenCenterZoom"];
            id v14 = *v2;
            if (v13)
            {
              [v14 finishedSubTest:@"workspaceActivate" forTest:@"AppOpenCenterZoom"];
              id v5 = *v2;
              uint64_t v6 = &__block_literal_global_54;
            }
            else
            {
              int v15 = [v14 isRunningTest:@"AppCloseCenterZoom"];
              id v16 = *v2;
              if (v15)
              {
                [v16 finishedSubTest:@"workspaceDeactivate" forTest:@"AppCloseCenterZoom"];
                id v5 = *v2;
                uint64_t v6 = &__block_literal_global_56;
              }
              else
              {
                int v17 = [v16 isRunningTest:@"AppOpenInScreenTime"];
                id v18 = *v2;
                if (v17)
                {
                  [v18 finishedSubTest:@"workspaceActivate" forTest:@"AppOpenInScreenTime"];
                  id v5 = *v2;
                  uint64_t v6 = &__block_literal_global_58;
                }
                else
                {
                  int v19 = [v18 isRunningTest:@"AppCloseInScreenTime"];
                  id v20 = *v2;
                  if (!v19)
                  {
                    if (([v20 isRunningTest:@"AppSliderBringup"] & 1) != 0
                      || ([*v2 isRunningTest:@"AppSliderBringupRotated"] & 1) != 0
                      || ([*v2 isRunningTest:@"AppSliderBringupOverApp"] & 1) != 0
                      || ([*v2 isRunningTest:@"AppSliderBringupOverAppRotated"] & 1) != 0
                      || ([*v2 isRunningTest:@"AppSliderBringupOverAppInScreenTime"] & 1) != 0
                      || [*v2 isRunningTest:@"AppSliderBringupOverAppInScreenTimeRotated"])
                    {
                      uint64_t v21 = +[SBApplicationTestingManager sharedInstance];
                      objc_super v22 = [v21 currentTestName];

                      id v23 = *v2;
                      v31[0] = MEMORY[0x1E4F143A8];
                      v31[1] = 3221225472;
                      v31[2] = __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_9;
                      v31[3] = &unk_1E6AF4AC0;
                      long long v32 = v22;
                      id v24 = v22;
                      [v23 installCACommitCompletionBlock:v31];
                      v25 = v32;
                    }
                    else
                    {
                      if (([(id)SBApp isRunningTest:@"AppSliderDismiss"] & 1) == 0
                        && ([(id)SBApp isRunningTest:@"AppSliderDismissRotated"] & 1) == 0
                        && ([(id)SBApp isRunningTest:@"AppSliderDismissOverApp"] & 1) == 0
                        && ([(id)SBApp isRunningTest:@"AppSliderDismissOverAppRotated"] & 1) == 0
                        && ([(id)SBApp isRunningTest:@"AppSliderDismissOverAppInScreenTime"] & 1) == 0
                        && ![(id)SBApp isRunningTest:@"AppSliderDismissOverAppInScreenTimeRotated"])
                      {
                        return;
                      }
                      v26 = +[SBApplicationTestingManager sharedInstance];
                      v27 = [v26 currentTestName];

                      id v28 = *v2;
                      v29[0] = MEMORY[0x1E4F143A8];
                      v29[1] = 3221225472;
                      v29[2] = __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_10;
                      v29[3] = &unk_1E6AF4AC0;
                      long long v30 = v27;
                      id v24 = v27;
                      [v28 installCACommitCompletionBlock:v29];
                      v25 = v30;
                    }

                    return;
                  }
                  [v20 finishedSubTest:@"workspaceDeactivate" forTest:@"AppCloseInScreenTime"];
                  id v5 = *v2;
                  uint64_t v6 = &__block_literal_global_60_0;
                }
              }
            }
          }
        }
      }
    }
    [v5 installCACommitCompletionBlock:v6];
  }
}

- (void)setActivityToken:(id)a3
{
}

- (BOOL)isReasonableMomentToInterrupt
{
  return 1;
}

- (BOOL)isInterruptible
{
  v6.receiver = self;
  v6.super_class = (Class)SBUISwitcherAnimationController;
  if (![(SBUISwitcherAnimationController *)&v6 isInterruptible]
    || ![(SBUISwitcherAnimationController *)self _isInterruptible])
  {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  char v4 = [WeakRetained canInterruptActiveTransition];

  return v4;
}

- (BOOL)shouldResignActiveForAnimation
{
  return 0;
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenAnimation" forTest:@"AppOpen"];
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_2()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseAnimation" forTest:@"AppClose"];
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_3()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenAnimation" forTest:@"AppOpenInFolder"];
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_4()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseAnimation" forTest:@"AppCloseInFolder"];
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_5()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenCenterZoomAnimation" forTest:@"AppOpenCenterZoom"];
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_6()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseCenterZoomAnimation" forTest:@"AppCloseCenterZoom"];
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_7()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppOpenAnimation" forTest:@"AppOpenInScreenTime"];
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_8()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"AppCloseAnimation" forTest:@"AppCloseInScreenTime"];
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_9(uint64_t a1)
{
  v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  int v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 startedSubTest:@"AppSliderBringupAnimation" forTest:v4];
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_10(uint64_t a1)
{
  v2 = (void **)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  int v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 startedSubTest:@"animation" forTest:v4];
}

- (BOOL)_isInterruptible
{
  return *(&self->_interruptible + 6);
}

- (void)_setInterruptible:(BOOL)a3
{
  *(&self->_interruptible + 6) = a3;
}

- (SBSwitcherContentViewControlling)contentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  return (SBSwitcherContentViewControlling *)WeakRetained;
}

- (void)setContentViewController:(id)a3
{
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (void)setAnimationBlock:(id)a3
{
}

@end