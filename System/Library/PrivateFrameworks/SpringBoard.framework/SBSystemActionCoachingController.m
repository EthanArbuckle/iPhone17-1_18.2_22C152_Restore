@interface SBSystemActionCoachingController
- (id)initWithHUDController:(void *)a3 ringerControl:(void *)a4 activityManager:(void *)a5 applicationController:(void *)a6 doNotDisturbStateMonitor:(void *)a7 flashlightActivityManager:(void *)a8 bannerManager:;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (uint64_t)_canPresentCoachingForAction:(uint64_t)a1;
- (void)_acquireBannerWindowLevelAssertion;
- (void)_backlightLevelChanged:(id)a3;
- (void)_dismissCoaching;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_invalidateBannerWindowLevelAssertion;
- (void)_startObservingSignalsToDismissIfNeeded;
- (void)_stopObservingSignalsToDismissIfNeeded;
- (void)_systemApertureLayoutChanged:(id)a3;
- (void)dealloc;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)systemActionCoachingHUDViewController:(id)a3 didBeginTransitionToState:(int64_t)a4;
- (void)systemActionPreviewCoordinator:(id)a3 didBeginPreview:(id)a4 forAction:(id)a5;
- (void)systemActionPreviewCoordinator:(id)a3 didEndPreview:(id)a4 forAction:(id)a5 withResult:(unint64_t)a6;
- (void)systemActionPreviewCoordinator:(id)a3 didInvalidateExpansionOfPreview:(id)a4 forAction:(id)a5 withResult:(unint64_t)a6;
@end

@implementation SBSystemActionCoachingController

- (id)initWithHUDController:(void *)a3 ringerControl:(void *)a4 activityManager:(void *)a5 applicationController:(void *)a6 doNotDisturbStateMonitor:(void *)a7 flashlightActivityManager:(void *)a8 bannerManager:
{
  id v16 = a2;
  id v41 = a3;
  id v40 = a4;
  id v39 = a5;
  id v38 = a6;
  id v37 = a7;
  id v17 = a8;
  v18 = v17;
  v36 = v16;
  if (a1)
  {
    if (!v16)
    {
      v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"HUDController != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:]();
      }
      [v29 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E4748);
    }
    if (!v41)
    {
      v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"ringerControl != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:]();
      }
      [v30 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E47B0);
    }
    if (!v40)
    {
      v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"activityManager != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:]();
      }
      [v31 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E4818);
    }
    if (!v39)
    {
      v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"applicationController != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.4();
      }
      [v32 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E4880);
    }
    if (!v38)
    {
      v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"doNotDisturbStateMonitor != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.5();
      }
      [v33 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E48E8);
    }
    if (!v37)
    {
      v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"flashlightActivityManager != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.6();
      }
      [v34 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E4950);
    }
    if (!v17)
    {
      v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"bannerManager != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingController initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:].cold.7();
      }
      [v35 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E49B8);
    }
    v42.receiver = a1;
    v42.super_class = (Class)SBSystemActionCoachingController;
    v19 = (id *)objc_msgSendSuper2(&v42, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 2, a2);
      objc_storeStrong(v20 + 3, a3);
      objc_storeStrong(v20 + 4, a4);
      objc_storeStrong(v20 + 5, a5);
      objc_storeStrong(v20 + 6, a6);
      objc_storeStrong(v20 + 7, a7);
      objc_storeStrong(v20 + 8, a8);
      v21 = +[SBSystemActionDomain rootSettings];
      uint64_t v22 = [v21 coachingSettings];
      id v23 = v20[9];
      v20[9] = (id)v22;

      [v20[9] addKeyObserver:v20];
      v24 = [v20[9] policyClassName];
      id v25 = objc_alloc_init(NSClassFromString(v24));
      id v26 = v20[10];
      v20[10] = v25;

      v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v27 addObserver:v20 selector:sel__systemApertureLayoutChanged_ name:@"SBSystemApertureLayoutDidChangeNotification" object:0];
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  -[SBSystemActionCoachingController _stopObservingSignalsToDismissIfNeeded]((uint64_t)self);
  -[SBSystemActionCoachingController _invalidateBannerWindowLevelAssertion]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionCoachingController;
  [(SBSystemActionCoachingController *)&v3 dealloc];
}

- (void)_stopObservingSignalsToDismissIfNeeded
{
  if (a1 && *(void *)(a1 + 96))
  {
    v2 = [*(id *)(a1 + 16) windowScene];
    objc_super v3 = [v2 systemGestureManager];
    [v3 removeGestureRecognizer:*(void *)(a1 + 96)];

    v4 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:a1 name:*MEMORY[0x1E4FA7A18] object:0];
    [v5 removeObserver:a1 name:*MEMORY[0x1E4FA7AE0] object:0];
  }
}

- (void)_invalidateBannerWindowLevelAssertion
{
  if (a1)
  {
    v2 = *(void **)(a1 + 104);
    if (v2)
    {
      [v2 invalidate];
      objc_super v3 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = 0;
    }
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_settings == a3 && [a4 isEqualToString:@"policyClassName"])
  {
    v7 = [(SBSystemActionCoachingSettings *)self->_settings policyClassName];
    id v5 = (SBSystemActionCoachingPolicy *)objc_alloc_init(NSClassFromString(v7));
    policy = self->_policy;
    self->_policy = v5;
  }
}

- (void)systemActionCoachingHUDViewController:(id)a3 didBeginTransitionToState:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (a4) {
      goto LABEL_6;
    }
    id v7 = v6;
    -[SBSystemActionCoachingController _stopObservingSignalsToDismissIfNeeded]((uint64_t)self);
    -[SBSystemActionCoachingController _invalidateBannerWindowLevelAssertion]((uint64_t)self);
  }
  else
  {
    id v7 = v6;
    -[SBSystemActionCoachingController _startObservingSignalsToDismissIfNeeded]((uint64_t)self);
    -[SBSystemActionCoachingController _acquireBannerWindowLevelAssertion]((uint64_t)self);
  }
  id v6 = v7;
LABEL_6:
}

- (void)_startObservingSignalsToDismissIfNeeded
{
  if (a1 && !*(void *)(a1 + 96))
  {
    v2 = objc_alloc_init(SBFailingSystemGestureRecognizer);
    [(SBFailingSystemGestureRecognizer *)v2 setDelegate:a1];
    objc_super v3 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v2;
    v4 = v2;

    id v5 = [*(id *)(a1 + 16) windowScene];
    id v6 = [v5 systemGestureManager];
    [v6 addGestureRecognizer:*(void *)(a1 + 96) withType:135];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:a1 selector:sel__backlightLevelChanged_ name:*MEMORY[0x1E4FA7A18] object:0];
    [v7 addObserver:a1 selector:sel__volumeButtonPressed_ name:*MEMORY[0x1E4FA7AE0] object:0];
  }
}

- (void)_acquireBannerWindowLevelAssertion
{
  if (a1 && !*(void *)(a1 + 104))
  {
    v2 = *(void **)(a1 + 64);
    double v3 = *MEMORY[0x1E4F43958] + 1.0;
    id v6 = [*(id *)(a1 + 16) windowScene];
    uint64_t v4 = [v2 acquireWindowLevelAssertionWithPriority:1 windowLevel:v6 windowScene:@"Coaching HUD Presentation" reason:v3];
    id v5 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v4;
  }
}

- (void)systemActionPreviewCoordinator:(id)a3 didBeginPreview:(id)a4 forAction:(id)a5
{
  [(SBSystemActionCoachingPolicy *)self->_policy noteDidBeginPreview:a4 forAction:a5];
  id v7 = [(SBHUDController *)self->_HUDController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7190]];
  id v6 = [v7 HUDViewController];
  if (-[SBSystemActionCoachingHUDViewController state]((uint64_t)v6) == 1) {
    -[SBSystemActionCoachingHUDViewController transitionToState:animated:completion:]((uint64_t)v6, 2, 1, 0);
  }
}

- (void)systemActionPreviewCoordinator:(id)a3 didInvalidateExpansionOfPreview:(id)a4 forAction:(id)a5 withResult:(unint64_t)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  [(SBSystemActionCoachingPolicy *)self->_policy noteDidInvalidateExpansionOfPreview:a4 forAction:v9 withResult:a6];
  if (a6)
  {
    uint64_t v10 = *MEMORY[0x1E4FA7190];
    v11 = [(SBHUDController *)self->_HUDController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7190]];
    v12 = [v11 HUDViewController];
    if ([(SBSystemActionCoachingPolicy *)self->_policy wantsCoachingPresentedForAction:v9])
    {
      if ((-[SBSystemActionCoachingController _canPresentCoachingForAction:]((uint64_t)self, v9) & 1) == 0)
      {
        v14 = SBLogSystemActionCoaching();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138543618;
          id v16 = self;
          __int16 v17 = 2114;
          id v18 = v9;
          _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Delegate denied presentation of coaching for action %{public}@", (uint8_t *)&v15, 0x16u);
        }

        goto LABEL_13;
      }
      if (!v11)
      {
        v13 = -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:]([SBSystemActionCoachingHUDViewController alloc], self->_ringerControl, self->_activityManager, self->_applicationController, self->_doNotDisturbStateMonitor, self->_flashlightActivityManager);

        -[SBSystemActionCoachingHUDViewController setDelegate:](v13, self);
        -[SBSystemActionCoachingHUDViewController setSystemApertureFrames:]((uint64_t)v13, self->_systemApertureFrames);
        v11 = [(SBHUDController *)self->_HUDController HUDSessionForViewController:v13 identifier:v10];
        v12 = v13;
      }
      -[SBSystemActionCoachingHUDViewController setAction:]((id *)v12, v9);
      [v11 presentWithDismissalInterval:0 animated:60.0];
    }
    else if (-[SBSystemActionCoachingHUDViewController state]((uint64_t)v12) != 2)
    {
LABEL_13:

      goto LABEL_14;
    }
    -[SBSystemActionCoachingHUDViewController transitionToState:animated:completion:]((uint64_t)v12, 1, 1, 0);
    goto LABEL_13;
  }
  -[SBSystemActionCoachingController _dismissCoaching]((uint64_t)self);
LABEL_14:
}

- (void)_dismissCoaching
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 16) knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7190]];
    v2 = [v1 HUDViewController];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__SBSystemActionCoachingController__dismissCoaching__block_invoke;
    v4[3] = &unk_1E6AF5350;
    id v5 = v1;
    id v3 = v1;
    -[SBSystemActionCoachingHUDViewController transitionToState:animated:completion:]((uint64_t)v2, 0, 1, v4);
  }
}

- (uint64_t)_canPresentCoachingForAction:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v5 = WeakRetained;
    if (WeakRetained) {
      a1 = [WeakRetained systemActionCoachingController:a1 canPresentCoachingForAction:v3];
    }
    else {
      a1 = 1;
    }
  }
  return a1;
}

- (void)systemActionPreviewCoordinator:(id)a3 didEndPreview:(id)a4 forAction:(id)a5 withResult:(unint64_t)a6
{
  policy = self->_policy;
  id v9 = a5;
  [(SBSystemActionCoachingPolicy *)policy noteDidEndPreview:a4 forAction:v9];
  LODWORD(a4) = [(SBSystemActionCoachingPolicy *)self->_policy wantsCoachingDismissedForAction:v9];

  if (a4)
  {
    -[SBSystemActionCoachingController _dismissCoaching]((uint64_t)self);
  }
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  if (self->_dismissGestureRecognizer == a3)
  {
    uint64_t v4 = [(SBHUDController *)self->_HUDController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7190]];
    id v5 = [v4 HUDViewController];
    id v3 = [v5 view];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (self->_dismissGestureRecognizer == a3) {
    -[SBSystemActionCoachingController _dismissCoaching]((uint64_t)self);
  }
}

uint64_t __52__SBSystemActionCoachingController__dismissCoaching__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) dismiss];
  }
  return result;
}

- (void)_backlightLevelChanged:(id)a3
{
  id v13 = [a3 userInfo];
  uint64_t v4 = [v13 objectForKey:*MEMORY[0x1E4FA7A08]];
  uint64_t v5 = [v4 integerValue];

  id v6 = [v13 objectForKey:*MEMORY[0x1E4FA7A28]];
  [v6 floatValue];
  float v8 = v7;

  id v9 = [v13 objectForKey:*MEMORY[0x1E4FA7A20]];
  [v9 floatValue];
  float v11 = v10;

  if (v5 == 3 && v11 > v8) {
    -[SBSystemActionCoachingController _dismissCoaching]((uint64_t)self);
  }
}

- (void)_systemApertureLayoutChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"SBSystemApertureFrames"];
  id obj = (id)[v5 copy];

  objc_storeStrong((id *)&self->_systemApertureFrames, obj);
  id v6 = [(SBHUDController *)self->_HUDController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA7190]];
  float v7 = v6;
  if (v6)
  {
    float v8 = [v6 HUDViewController];
    -[SBSystemActionCoachingHUDViewController setSystemApertureFrames:]((uint64_t)v8, obj);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_systemApertureFrames, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_flashlightActivityManager, 0);
  objc_storeStrong((id *)&self->_doNotDisturbStateMonitor, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_ringerControl, 0);
  objc_storeStrong((id *)&self->_HUDController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithHUDController:ringerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:bannerManager:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end