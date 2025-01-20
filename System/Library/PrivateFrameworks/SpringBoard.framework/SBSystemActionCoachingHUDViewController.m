@interface SBSystemActionCoachingHUDViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)coachingLabelTextNeedsUpdate;
- (BOOL)definesAnimatedDismissal;
- (BOOL)isAttached;
- (BOOL)isCoachingLabelOccluded;
- (BOOL)isHUDAttached;
- (BOOL)isRotating;
- (BOOL)shouldLayoutForButtonHints;
- (NSArray)physicalButtonSceneTargets;
- (SBHUDAttachmentDelegate)attachmentDelegate;
- (SBUIAnimationPropertyAnimator)_makeViewControllerTransitionAnimationController;
- (__CFString)_coachingLabelText;
- (double)_coachingLabelWrapperViewAlpha;
- (double)_coachingLabelWrapperViewSize;
- (double)_ringerButtonFrame;
- (double)_xTranslationTransformForCurrentState;
- (id)_accessibilityCoachingLabelTextForConfiguredAction:(void *)a1;
- (id)_animationSettingsForTransitionFromState:(uint64_t)a3 toState:;
- (id)_cameraCoachingLabelText;
- (id)_controlCoachingLabelTextForAction:(void *)a1;
- (id)_flashlightCoachingLabelText;
- (id)_focusCoachingLabelText;
- (id)_makeCoachingButton;
- (id)_makeCoachingLabel;
- (id)_makeCoachingLabelWrapperView;
- (id)_makeContentView;
- (id)_makeDimmingView;
- (id)_makeGaussianBlurFilter;
- (id)_musicRecognitionCoachingLabelText;
- (id)_silentModeCoachingLabelText;
- (id)_translateCoachingLabelText;
- (id)_voiceMemosCoachingLabelText;
- (id)delegate;
- (id)initWithRingerControl:(void *)a3 activityManager:(void *)a4 applicationController:(void *)a5 doNotDisturbStateMonitor:(void *)a6 flashlightActivityManager:;
- (id)setDelegate:(id *)result;
- (int64_t)triggerButton;
- (uint64_t)_layoutCoachingContentView;
- (uint64_t)_layoutDimmingView;
- (uint64_t)_updateContentVisibilityAssertion;
- (uint64_t)action;
- (uint64_t)activityManager;
- (uint64_t)applicationController;
- (uint64_t)coachingButton;
- (uint64_t)coachingContentView;
- (uint64_t)coachingLabel;
- (uint64_t)coachingLabelOrientation;
- (uint64_t)coachingLabelWrapperView;
- (uint64_t)contentView;
- (uint64_t)contentVisibilityAssertion;
- (uint64_t)dimmingView;
- (uint64_t)doNotDisturbStateMonitor;
- (uint64_t)flashlightActivityManager;
- (uint64_t)liveRenderingAssertion;
- (uint64_t)ringerControl;
- (uint64_t)setCoachingLabelOrientation:(uint64_t)result;
- (uint64_t)settings;
- (uint64_t)state;
- (uint64_t)stateTransitionAnimationCount;
- (uint64_t)systemApertureFrames;
- (unint64_t)attachmentIgnoredOrientations;
- (void)_canFitTextInCoachingLabel:(void *)a1;
- (void)_layoutCoachingButton;
- (void)_layoutCoachingLabel;
- (void)_layoutCoachingLabelWrapperView;
- (void)_setNeedsUpdateCoachingLabelText;
- (void)_shortcutCoachingLabelTextForConfiguredAction:(void *)a1;
- (void)_updateCoachingButtonLayer:(uint64_t)a1;
- (void)_updateCoachingLabelOccluded;
- (void)_updateCoachingLabelTextIfNeeded;
- (void)_updateLiveRenderingAssertionIfNeeded;
- (void)controlSystemAction:(id)a3 propertiesDidChange:(id)a4;
- (void)dismissAnimatedWithCompletion:(id)a3;
- (void)setAction:(id *)a1;
- (void)setAttachmentDelegate:(id)a3;
- (void)setIsAttached:(uint64_t)a1;
- (void)setPositionOffset:(CGPoint)a3;
- (void)setShouldLayoutForButtonHints:(uint64_t)a1;
- (void)setSystemApertureFrames:(uint64_t)a1;
- (void)transitionToState:(int)a3 animated:(void *)a4 completion:;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBSystemActionCoachingHUDViewController

- (id)initWithRingerControl:(void *)a3 activityManager:(void *)a4 applicationController:(void *)a5 doNotDisturbStateMonitor:(void *)a6 flashlightActivityManager:
{
  id v12 = a2;
  id v29 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  v28 = v12;
  if (a1)
  {
    if (!v12)
    {
      v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"ringerControl != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:]();
      }
      [v23 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8C23E28);
    }
    if (!v29)
    {
      v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"activityManager != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:]();
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8C23E90);
    }
    if (!v13)
    {
      v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"applicationController != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:]();
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8C23EF8);
    }
    if (!v14)
    {
      v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"doNotDisturbStateMonitor != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:].cold.4();
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8C23F60);
    }
    if (!v15)
    {
      v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"flashlightActivityManager != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSystemActionCoachingHUDViewController initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:].cold.5();
      }
      [v27 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8C23FC8);
    }
    v30.receiver = a1;
    v30.super_class = (Class)SBSystemActionCoachingHUDViewController;
    v17 = (id *)objc_msgSendSuper2(&v30, sel_initWithNibName_bundle_, 0, 0);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 130, a2);
      objc_storeStrong(v18 + 131, a3);
      objc_storeStrong(v18 + 132, a4);
      objc_storeStrong(v18 + 133, a5);
      objc_storeStrong(v18 + 134, a6);
      v19 = +[SBSystemActionDomain rootSettings];
      uint64_t v20 = [v19 coachingSettings];
      id v21 = v18[135];
      v18[135] = (id)v20;

      *((unsigned char *)v18 + 1000) = 0;
      v18[129] = 0;
      v18[138] = 0;
      *((unsigned char *)v18 + 1001) = 0;
      v18[139] = (id)1;
      [v18 setTransitioningDelegate:v18];
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)setAction:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = a1[127];
    if (v5 != v4)
    {
      v9 = v4;
      v6 = [v5 controlAction];
      -[SBControlSystemAction removeObserver:]((uint64_t)v6, (uint64_t)a1);

      [a1[136] invalidate];
      id v7 = a1[136];
      a1[136] = 0;

      objc_storeStrong(a1 + 127, a2);
      v8 = [v9 controlAction];
      -[SBControlSystemAction addObserver:]((uint64_t)v8, a1);

      -[SBSystemActionCoachingHUDViewController _updateContentVisibilityAssertion]((uint64_t)a1);
      -[SBSystemActionCoachingHUDViewController _setNeedsUpdateCoachingLabelText](a1);
      id v4 = v9;
    }
  }
}

- (uint64_t)_updateContentVisibilityAssertion
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = [*(id *)(result + 1016) controlAction];
  if (v2)
  {
    v3 = *(void **)(v1 + 1088);
    if (*(void *)(v1 + 1032))
    {
      if (!v3)
      {
        uint64_t v4 = -[SBControlSystemAction acquireContentVisibilityAssertionForReason:](v2, @"Coaching HUD");
        id v5 = *(void **)(v1 + 1088);
        *(void *)(v1 + 1088) = v4;
LABEL_8:
      }
    }
    else if (v3)
    {
      [v3 invalidate];
      id v5 = *(void **)(v1 + 1088);
      *(void *)(v1 + 1088) = 0;
      goto LABEL_8;
    }
  }
  return MEMORY[0x1F4181820]();
}

- (void)_setNeedsUpdateCoachingLabelText
{
  if (a1)
  {
    a1[1001] = 1;
    id v1 = [a1 viewIfLoaded];
    [v1 setNeedsLayout];
  }
}

- (void)setSystemApertureFrames:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    char v4 = BSEqualArrays();
    id v3 = v7;
    if ((v4 & 1) == 0)
    {
      uint64_t v5 = [v7 copy];
      v6 = *(void **)(a1 + 1024);
      *(void *)(a1 + 1024) = v5;

      -[SBSystemActionCoachingHUDViewController _updateCoachingLabelOccluded](a1);
      id v3 = v7;
    }
  }
}

- (void)_updateCoachingLabelOccluded
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = *(id *)(a1 + 1024);
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) CGRectValue];
          v33.origin.CGFloat x = v11;
          v33.origin.CGFloat y = v12;
          v33.size.CGFloat width = v13;
          v33.size.CGFloat height = v14;
          v29.origin.CGFloat x = x;
          v29.origin.CGFloat y = y;
          v29.size.CGFloat width = width;
          v29.size.CGFloat height = height;
          CGRect v30 = CGRectUnion(v29, v33);
          CGFloat x = v30.origin.x;
          CGFloat y = v30.origin.y;
          CGFloat width = v30.size.width;
          CGFloat height = v30.size.height;
        }
        uint64_t v8 = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    if (CGRectIsNull(v31))
    {
      int v15 = 0;
    }
    else
    {
      v16 = [(id)a1 view];
      v17 = *(void **)(a1 + 1160);
      [v17 bounds];
      objc_msgSend(v17, "convertRect:toView:", v16);
      objc_msgSend(v16, "convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:");
      v34.origin.CGFloat x = v18;
      v34.origin.CGFloat y = v19;
      v34.size.CGFloat width = v20;
      v34.size.CGFloat height = v21;
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      int v15 = CGRectIntersectsRect(v32, v34);
    }
    if (*(unsigned __int8 *)(a1 + 1002) != v15)
    {
      *(unsigned char *)(a1 + 1002) = v15;
      if ([(id)a1 isViewLoaded])
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __71__SBSystemActionCoachingHUDViewController__updateCoachingLabelOccluded__block_invoke;
        v22[3] = &unk_1E6AF4AC0;
        v22[4] = a1;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v22 animations:0.2];
      }
    }
  }
}

- (void)transitionToState:(int)a3 animated:(void *)a4 completion:
{
  id v7 = a4;
  if (a1)
  {
    uint64_t v8 = -[SBSystemActionCoachingHUDViewController _animationSettingsForTransitionFromState:toState:]((id *)a1, *(void *)(a1 + 1032), a2);
    if (a3) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1008));
    uint64_t v11 = *(void *)(a1 + 1032);
    *(void *)(a1 + 1032) = a2;
    ++*(void *)(a1 + 1104);
    -[SBSystemActionCoachingHUDViewController _updateCoachingLabelTextIfNeeded](a1);
    -[SBSystemActionCoachingHUDViewController _updateContentVisibilityAssertion](a1);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained systemActionCoachingHUDViewController:a1 didBeginTransitionToState:a2];
    }
    if (a2 && !v11) {
      -[SBSystemActionCoachingHUDViewController setIsAttached:](a1, 1);
    }
    CGFloat v12 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__SBSystemActionCoachingHUDViewController_transitionToState_animated_completion___block_invoke;
    v18[3] = &unk_1E6AF4A70;
    v18[4] = a1;
    v18[5] = a2;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__SBSystemActionCoachingHUDViewController_transitionToState_animated_completion___block_invoke_343;
    v14[3] = &unk_1E6B08248;
    uint64_t v17 = a2;
    v14[4] = a1;
    id v15 = WeakRetained;
    id v16 = v7;
    id v13 = WeakRetained;
    objc_msgSend(v12, "sb_animateWithSettings:mode:animations:completion:", v8, v9, v18, v14);
  }
}

- (id)_animationSettingsForTransitionFromState:(uint64_t)a3 toState:
{
  if (a1)
  {
    if (a3 == 2)
    {
      a1 = [a1[135] expansionSettings];
    }
    else if (a3 == 1)
    {
      id v3 = a1[135];
      if (a2 == 2) {
        [v3 contractionSettings];
      }
      else {
      a1 = [v3 presentationSettings];
      }
    }
    else if (a3)
    {
      a1 = 0;
    }
    else
    {
      a1 = [a1[135] dismissalSettings];
    }
  }
  return a1;
}

- (void)_updateCoachingLabelTextIfNeeded
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 1001))
    {
      id v2 = [(id)a1 viewIfLoaded];
      id v3 = [v2 window];

      if (v3)
      {
        if (*(void *)(a1 + 1032) || !*(void *)(a1 + 1104))
        {
          -[SBSystemActionCoachingHUDViewController _coachingLabelText]((id *)a1);
          id v4 = (id)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 1160) setText:v4];
          *(unsigned char *)(a1 + 1001) = 0;
        }
      }
    }
  }
}

- (void)setIsAttached:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 1004) != a2)
  {
    *(unsigned char *)(a1 + 1004) = a2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 976));
    [WeakRetained updateAttachmentStateForHUDViewController:a1];
  }
}

void __81__SBSystemActionCoachingHUDViewController_transitionToState_animated_completion___block_invoke(uint64_t a1)
{
  -[SBSystemActionCoachingHUDViewController _layoutCoachingContentView](*(void *)(a1 + 32));
  -[SBSystemActionCoachingHUDViewController _layoutCoachingButton](*(void **)(a1 + 32));
  -[SBSystemActionCoachingHUDViewController _layoutCoachingLabelWrapperView](*(void **)(a1 + 32));
  -[SBSystemActionCoachingHUDViewController _layoutCoachingLabel](*(id **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  if ((unint64_t)(v2 - 1) >= 2)
  {
    if (v2) {
      return;
    }
    double v11 = 0.0;
    [*(id *)(*(void *)(a1 + 32) + 1128) setAlpha:0.0];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 1136);
    [*(id *)(v12 + 1120) bounds];
    objc_msgSend(v13, "setFrame:");
    CGFloat v14 = [*(id *)(*(void *)(a1 + 32) + 1144) layer];
    [v14 setShadowOpacity:0.0];

    uint64_t v15 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v15 + 1002) && (unint64_t)(*(void *)(v15 + 1032) - 1) <= 1)
    {
      if (*(unsigned char *)(v15 + 1000)) {
        double v11 = 0.0;
      }
      else {
        double v11 = 1.0;
      }
    }
    [*(id *)(v15 + 1152) setAlpha:v11];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1152) layer];
    v10 = &unk_1F3348C98;
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 1128);
    [*(id *)(v3 + 1080) dimmingAlpha];
    objc_msgSend(v4, "setAlpha:");
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 1144) layer];
    [*(id *)(*(void *)(a1 + 32) + 1080) coachingButtonShadowOpacity];
    *(float *)&double v6 = v6;
    [v5 setShadowOpacity:v6];

    uint64_t v7 = *(void *)(a1 + 32);
    double v8 = 0.0;
    if (!*(unsigned char *)(v7 + 1002) && (unint64_t)(*(void *)(v7 + 1032) - 1) <= 1 && !*(unsigned char *)(v7 + 1000)) {
      double v8 = 1.0;
    }
    [*(id *)(v7 + 1152) setAlpha:v8];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 1152) layer];
    v10 = &unk_1F3348CA8;
  }
  id v16 = v9;
  [v9 setValue:v10 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (uint64_t)_layoutCoachingContentView
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 1120) bounds];
    uint64_t v2 = *(void **)(v1 + 1136);
    UIRectGetCenter();
    objc_msgSend(v2, "setCenter:");
    uint64_t v3 = *(void **)(v1 + 1136);
    BSRectWithSize();
    return objc_msgSend(v3, "setBounds:");
  }
  return result;
}

- (void)_layoutCoachingButton
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result traitCollection];
    [v2 displayScale];

    double v3 = -[SBSystemActionCoachingHUDViewController _ringerButtonFrame](v1);
    CGFloat y = v14.origin.y;
    CGFloat width = v14.size.width;
    CGFloat height = v14.size.height;
    v14.origin.CGFloat x = v3;
    CGRectGetHeight(v14);
    v15.origin.CGFloat x = v3;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    CGRectGetMinY(v15);
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    [(SBSystemActionCoachingHUDViewController *)(uint64_t)v1 _xTranslationTransformForCurrentState];
    uint64_t v7 = (void *)v1[143];
    UIRectGetCenter();
    objc_msgSend(v7, "setCenter:");
    double v8 = (void *)v1[143];
    BSRectWithSize();
    objc_msgSend(v8, "setBounds:");
    uint64_t v9 = (void *)v1[143];
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    return (void *)[v9 setTransform:v10];
  }
  return result;
}

- (void)_layoutCoachingLabelWrapperView
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    uint64_t v2 = [result traitCollection];
    [v2 displayScale];

    -[SBSystemActionCoachingHUDViewController _ringerButtonFrame]((void *)v1);
    double v3 = -[SBSystemActionCoachingHUDViewController _coachingLabelWrapperViewSize]((void *)v1);
    if (v3 >= v4) {
      double v5 = v3;
    }
    else {
      double v5 = v4;
    }
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    memset(&v24, 0, sizeof(v24));
    unint64_t v6 = *(void *)(v1 + 1032);
    CGFloat v7 = 0.0;
    if (v6 <= 2) {
      CGFloat v7 = dbl_1D8FD2708[v6];
    }
    CGAffineTransformMakeScale(&v24, v7, v7);
    memset(&v23, 0, sizeof(v23));
    [(SBSystemActionCoachingHUDViewController *)v1 _xTranslationTransformForCurrentState];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v22.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v22.c = v8;
    *(_OWORD *)&v22.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&t1.a = *(_OWORD *)&v22.a;
    *(_OWORD *)&t1.c = v8;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&v22.tx;
    CGAffineTransform t2 = v24;
    CGAffineTransformConcat(&v22, &t1, &t2);
    CGAffineTransform t2 = v22;
    CGAffineTransform v20 = v23;
    CGAffineTransformConcat(&t1, &t2, &v20);
    *(_OWORD *)&v22.tCGFloat x = *(_OWORD *)&t1.tx;
    UIRectGetCenter();
    double v10 = v9;
    double v12 = v11;
    long long v13 = [*(id *)(v1 + 1152) layer];
    [v13 anchorPoint];
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(*(id *)(v1 + 1152), "setCenter:", v10 + (v15 + -0.5) * v5, v12 + (v17 + -0.5) * v5);
    CGFloat v18 = *(void **)(v1 + 1152);
    BSRectWithSize();
    objc_msgSend(v18, "setBounds:");
    CGFloat v19 = *(void **)(v1 + 1152);
    CGAffineTransform v24 = t1;
    return (void *)[v19 setTransform:&v24];
  }
  return result;
}

- (void)_layoutCoachingLabel
{
  if (a1)
  {
    uint64_t v2 = [a1 traitCollection];
    [v2 displayScale];

    [a1[144] bounds];
    [a1[145] sizeThatFits:-[SBSystemActionCoachingHUDViewController _coachingLabelWrapperViewSize](a1)];
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    memset(&v24, 0, sizeof(v24));
    SBFTransformFromOrientationToOrientation();
    memset(&v23, 0, sizeof(v23));
    BSFloatRoundForScale();
    CGAffineTransformMakeTranslation(&v23, v11, 0.0);
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&t1.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&t1.c = v12;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransform t2 = v24;
    CGAffineTransformConcat(&v20, &t1, &t2);
    long long v21 = *(_OWORD *)&v20.a;
    long long v22 = *(_OWORD *)&v20.c;
    CGAffineTransform t1 = v20;
    CGAffineTransform t2 = v23;
    CGAffineTransformConcat(&v20, &t1, &t2);
    long long v21 = *(_OWORD *)&v20.a;
    tCGFloat x = v20.tx;
    tCGFloat y = v20.ty;
    CGAffineTransform v24 = v20;
    v25.origin.CGFloat x = v4;
    v25.origin.CGFloat y = v6;
    v25.size.CGFloat width = v8;
    v25.size.CGFloat height = v10;
    CGRectApplyAffineTransform(v25, &v24);
    UIRectGetCenter();
    SBUnintegralizedRectCenteredAboutPoint();
    BSPointRoundForScale();
    id v13 = a1[145];
    UIRectGetCenter();
    objc_msgSend(v13, "setCenter:");
    id v14 = a1[145];
    BSRectWithSize();
    objc_msgSend(v14, "setBounds:");
    id v15 = a1[145];
    *(_OWORD *)&v24.a = *(_OWORD *)&v20.a;
    *(_OWORD *)&v24.c = *(_OWORD *)&v20.c;
    v24.tCGFloat x = tx;
    v24.tCGFloat y = ty;
    [v15 setTransform:&v24];
    -[SBSystemActionCoachingHUDViewController _updateCoachingLabelOccluded]((uint64_t)a1);
  }
}

- (double)_coachingLabelWrapperViewAlpha
{
  double result = 0.0;
  if (a1 && !*(unsigned char *)(a1 + 1002) && (unint64_t)(*(void *)(a1 + 1032) - 1) <= 1 && !*(unsigned char *)(a1 + 1000)) {
    return 1.0;
  }
  return result;
}

uint64_t __81__SBSystemActionCoachingHUDViewController_transitionToState_animated_completion___block_invoke_343(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 1104);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 1104) || (uint64_t v3 = *(void *)(v2 + 1032), v3 != *(void *)(a1 + 56)))
  {
    uint64_t v4 = 0;
  }
  else
  {
    if (!v3) {
      -[SBSystemActionCoachingHUDViewController setIsAttached:](v2, 0);
    }
    uint64_t v4 = 1;
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 40) systemActionCoachingHUDViewController:*(void *)(a1 + 32) didEndTransitionToState:*(void *)(a1 + 56) completed:v4];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    CGFloat v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)SBSystemActionCoachingHUDViewController;
  [(SBSystemActionCoachingHUDViewController *)&v17 viewDidLoad];
  uint64_t v3 = [(SBOrientationTransformWrapperViewController *)self view];
  [v3 setCounterTransformView:1];
  objc_msgSend(v3, "bs_setHitTestingDisabled:", 1);
  -[SBSystemActionCoachingHUDViewController _makeContentView](self);
  uint64_t v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v4;

  [v3 addContentView:self->_contentView];
  -[SBSystemActionCoachingHUDViewController _makeDimmingView]((uint64_t)self);
  CGFloat v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  dimmingView = self->_dimmingView;
  self->_dimmingView = v6;

  [(UIView *)self->_contentView addSubview:self->_dimmingView];
  id v8 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(UIView *)self->_contentView bounds];
  double v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
  coachingContentView = self->_coachingContentView;
  self->_coachingContentView = v9;

  [(UIView *)self->_contentView addSubview:self->_coachingContentView];
  -[SBSystemActionCoachingHUDViewController _makeCoachingButton]((uint64_t)self);
  CGFloat v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  coachingButton = self->_coachingButton;
  self->_coachingButton = v11;

  [(UIView *)self->_coachingContentView addSubview:self->_coachingButton];
  -[SBSystemActionCoachingHUDViewController _makeCoachingLabelWrapperView]((uint64_t)self);
  id v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  coachingLabelWrapperView = self->_coachingLabelWrapperView;
  self->_coachingLabelWrapperView = v13;

  [(UIView *)self->_coachingContentView addSubview:self->_coachingLabelWrapperView];
  -[SBSystemActionCoachingHUDViewController _makeCoachingLabel]((uint64_t)self);
  id v15 = (UILabel *)objc_claimAutoreleasedReturnValue();
  coachingLabel = self->_coachingLabel;
  self->_coachingLabel = v15;

  [(UIView *)self->_coachingLabelWrapperView addSubview:self->_coachingLabel];
}

- (id)_makeContentView
{
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F42FF0]);
    a1 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_makeDimmingView
{
  if (a1)
  {
    id v1 = objc_alloc(MEMORY[0x1E4F42FF0]);
    id v2 = objc_msgSend(v1, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v2 setAlpha:0.0];
    uint64_t v3 = [MEMORY[0x1E4F428B8] blackColor];
    [v2 setBackgroundColor:v3];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)_makeCoachingButton
{
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v3 setAccessibilityIdentifier:@"system-action-coaching-button"];
    uint64_t v4 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [v3 setBackgroundColor:v4];

    double v5 = [v3 layer];
    [v5 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    double v6 = 2.5;
    if (!*(unsigned char *)(a1 + 1003)) {
      double v6 = 5.0;
    }
    [v5 setCornerRadius:v6];
    id v7 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v5, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [v5 setShadowOpacity:0.0];
    [v5 setShadowPathIsBounds:1];
    [*(id *)(a1 + 1080) coachingButtonShadowRadius];
    objc_msgSend(v5, "setShadowRadius:");
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)_makeCoachingLabelWrapperView
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v4 = v3;
    double v5 = 0.0;
    if (!*(unsigned char *)(a1 + 1002) && (unint64_t)(*(void *)(a1 + 1032) - 1) <= 1 && !*(unsigned char *)(a1 + 1000)) {
      double v5 = 1.0;
    }
    [v3 setAlpha:v5];
    double v6 = [v4 layer];
    objc_msgSend(v6, "setAnchorPoint:", 0.0, 0.5);
    id v7 = -[SBSystemActionCoachingHUDViewController _makeGaussianBlurFilter](a1);
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v6 setFilters:v8];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)_makeCoachingLabel
{
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v3 setAccessibilityIdentifier:@"system-action-coaching-label"];
    uint64_t v4 = [MEMORY[0x1E4F42A30] systemFontOfSize:19.0 weight:*MEMORY[0x1E4F43928]];
    [v3 setFont:v4];

    [v3 setNumberOfLines:0];
    double v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [v3 setTextColor:v5];

    double v6 = [v3 layer];
    id v7 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v6, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [*(id *)(a1 + 1080) coachingLabelShadowOpacity];
    *(float *)&double v8 = v8;
    [v6 setShadowOpacity:v8];
    [*(id *)(a1 + 1080) coachingLabelShadowRadius];
    objc_msgSend(v6, "setShadowRadius:");
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBSystemActionCoachingHUDViewController;
  [(SBSystemActionCoachingHUDViewController *)&v8 viewIsAppearing:a3];
  uint64_t v4 = [(SBOrientationTransformWrapperViewController *)self view];
  double v5 = [v4 window];
  int64_t v6 = [v5 interfaceOrientation];

  [v4 setContainerOrientation:v6];
  [v4 setContentOrientation:1];
  if (self && self->_coachingLabelOrientation != v6)
  {
    self->_coachingLabelOrientation = v6;
    if ((unint64_t)(v6 - 3) < 2) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 4;
    }
    [(UILabel *)self->_coachingLabel setTextAlignment:v7];
  }
  -[SBSystemActionCoachingHUDViewController _updateLiveRenderingAssertionIfNeeded]((id *)&self->super.super.super.super.isa);
  -[SBSystemActionCoachingHUDViewController transitionToState:animated:completion:]((uint64_t)self, 0, 0, 0);
}

- (uint64_t)setCoachingLabelOrientation:(uint64_t)result
{
  if (result && *(void *)(result + 1112) != a2)
  {
    *(void *)(result + 1112) = a2;
    if ((unint64_t)(a2 - 3) < 2) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = 4;
    }
    return [*(id *)(result + 1160) setTextAlignment:v2];
  }
  return result;
}

- (void)_updateLiveRenderingAssertionIfNeeded
{
  v19[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1 view];
    uint64_t v3 = [v2 window];
    uint64_t v4 = [v3 windowScene];

    if (v4) {
      BOOL v5 = [a1 _appearState] != 0;
    }
    else {
      BOOL v5 = 0;
    }
    id v6 = a1[137];
    if (v6)
    {
      char v7 = [a1[137] isAcquired];
      if (!v5) {
        goto LABEL_11;
      }
    }
    else
    {
      char v7 = 0;
      if (!v5) {
        goto LABEL_11;
      }
    }
    if ((v7 & 1) == 0)
    {
      [a1[137] invalidate];
      objc_super v8 = (void *)MEMORY[0x1E4F4F4C0];
      double v9 = (objc_class *)objc_opt_class();
      CGFloat v10 = NSStringFromClass(v9);
      CGFloat v11 = [MEMORY[0x1E4F4F528] requestLiveUpdatingForScene:v4];
      long long v12 = objc_msgSend(MEMORY[0x1E4F4F530], "requestUnrestrictedFramerateForScene:", v4, v11);
      v19[1] = v12;
      id v13 = [MEMORY[0x1E4F4F540] ignoreWhenBacklightInactivates];
      v19[2] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
      uint64_t v15 = [v8 acquireWithExplanation:v10 observer:0 attributes:v14];
      id v16 = a1[137];
      a1[137] = (id)v15;

LABEL_16:
      return;
    }
LABEL_11:
    if (v6) {
      char v17 = v5;
    }
    else {
      char v17 = 1;
    }
    if ((v17 & 1) == 0)
    {
      [a1[137] invalidate];
      id v18 = a1[137];
      a1[137] = 0;
    }
    goto LABEL_16;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSystemActionCoachingHUDViewController;
  [(SBSystemActionCoachingHUDViewController *)&v4 viewDidDisappear:a3];
  -[SBSystemActionCoachingHUDViewController _updateLiveRenderingAssertionIfNeeded]((id *)&self->super.super.super.super.isa);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemActionCoachingHUDViewController;
  [(SBSystemActionCoachingHUDViewController *)&v3 viewDidLayoutSubviews];
  -[SBSystemActionCoachingHUDViewController _updateCoachingLabelTextIfNeeded]((uint64_t)self);
  -[SBSystemActionCoachingHUDViewController _layoutDimmingView]((uint64_t)self);
  -[SBSystemActionCoachingHUDViewController _layoutCoachingContentView]((uint64_t)self);
  -[SBSystemActionCoachingHUDViewController _layoutCoachingButton](self);
  -[SBSystemActionCoachingHUDViewController _layoutCoachingLabelWrapperView](self);
  -[SBSystemActionCoachingHUDViewController _layoutCoachingLabel]((id *)&self->super.super.super.super.isa);
}

- (uint64_t)_layoutDimmingView
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 1120) bounds];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    CGFloat v10 = *(void **)(v1 + 1128);
    UIRectGetCenter();
    objc_msgSend(v10, "setCenter:");
    CGFloat v11 = *(void **)(v1 + 1128);
    return objc_msgSend(v11, "setBounds:", v3, v5, v7, v9);
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)SBSystemActionCoachingHUDViewController;
  id v7 = a4;
  -[SBSystemActionCoachingHUDViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  self->_rotating = 1;
  double v8 = SBFWindowForViewControllerTransition();
  uint64_t v9 = [v8 _toWindowOrientation];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_1E6AF4AC0;
  v12[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v12 animations:0.2];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v11[3] = &unk_1E6B08270;
  v11[4] = self;
  v11[5] = v9;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  _OWORD v10[3] = &unk_1E6B003A8;
  v10[4] = self;
  v10[5] = v9;
  v10[6] = 0x3FC999999999999ALL;
  [v7 animateAlongsideTransition:v11 completion:v10];
}

uint64_t __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 0.0;
  if (!*(unsigned char *)(v1 + 1002) && (unint64_t)(*(void *)(v1 + 1032) - 1) <= 1 && !*(unsigned char *)(v1 + 1000)) {
    double v2 = 1.0;
  }
  return [*(id *)(v1 + 1152) setAlpha:v2];
}

void __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setContainerOrientation:*(void *)(a1 + 40)];
}

uint64_t __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(double *a1)
{
  *(unsigned char *)(*((void *)a1 + 4) + 1000) = 0;
  uint64_t v2 = *((void *)a1 + 4);
  if (v2)
  {
    uint64_t v3 = *((void *)a1 + 5);
    if (*(void *)(v2 + 1112) != v3)
    {
      *(void *)(v2 + 1112) = v3;
      if ((unint64_t)(v3 - 3) < 2) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = 4;
      }
      [*(id *)(v2 + 1160) setTextAlignment:v4];
      uint64_t v2 = *((void *)a1 + 4);
    }
  }
  -[SBSystemActionCoachingHUDViewController _layoutCoachingLabel]((id *)v2);
  double v5 = a1[6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v7[3] = &unk_1E6AF4AC0;
  *(double *)&v7[4] = a1[4];
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:v5];
}

uint64_t __94__SBSystemActionCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 0.0;
  if (!*(unsigned char *)(v1 + 1002) && (unint64_t)(*(void *)(v1 + 1032) - 1) <= 1 && !*(unsigned char *)(v1 + 1000)) {
    double v2 = 1.0;
  }
  return [*(id *)(v1 + 1152) setAlpha:v2];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSArray)physicalButtonSceneTargets
{
  return 0;
}

- (BOOL)definesAnimatedDismissal
{
  return 1;
}

- (void)dismissAnimatedWithCompletion:(id)a3
{
}

- (void)setAttachmentDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_attachmentDelegate, obj);
    -[SBSystemActionCoachingHUDViewController setShouldLayoutForButtonHints:]((uint64_t)self, obj != 0);
  }
}

- (void)setShouldLayoutForButtonHints:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 1003) != a2)
    {
      *(unsigned char *)(a1 + 1003) = a2;
      uint64_t v3 = *(void **)(a1 + 1144);
      if (v3)
      {
        uint64_t v4 = [v3 layer];
        id v6 = v4;
        double v5 = 2.5;
        if (!*(unsigned char *)(a1 + 1003)) {
          double v5 = 5.0;
        }
        [v4 setCornerRadius:v5];
      }
    }
  }
}

- (int64_t)triggerButton
{
  return 8;
}

- (unint64_t)attachmentIgnoredOrientations
{
  return 0;
}

- (BOOL)isHUDAttached
{
  return self->_isAttached;
}

- (void)setPositionOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(SBOrientationTransformWrapperViewController *)self view];
  uint64_t v7 = [v6 containerOrientation];

  unint64_t v8 = v7 - 3;
  if (v7 == 2) {
    double v9 = -x;
  }
  else {
    double v9 = x;
  }
  if (v8 >= 2) {
    double v10 = y;
  }
  else {
    double v10 = x;
  }
  if (v8 < 2) {
    double v9 = y;
  }
  if (self->_positionOffset.x != v9 || self->_positionOffset.y != v10)
  {
    self->_positionOffset.double x = v9;
    self->_positionOffset.double y = v10;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__SBSystemActionCoachingHUDViewController_setPositionOffset___block_invoke;
    v12[3] = &unk_1E6AF4AC0;
    v12[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v12];
  }
}

uint64_t __61__SBSystemActionCoachingHUDViewController_setPositionOffset___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(void **)(v1 + 1136);
  CGAffineTransformMakeTranslation(&v4, *(CGFloat *)(v1 + 984), *(CGFloat *)(v1 + 992));
  return [v2 setTransform:&v4];
}

- (void)controlSystemAction:(id)a3 propertiesDidChange:(id)a4
{
  id v6 = a3;
  uint64_t v7 = -[SBHomeScreenConfigurationServer connections]((uint64_t)a4);
  unint64_t v8 = -[SBControlSystemAction properties]((uint64_t)v6);

  double v9 = -[SBHomeScreenConfigurationServer connections]((uint64_t)v8);
  char v10 = BSEqualStrings();

  if ((v10 & 1) == 0)
  {
    -[SBSystemActionCoachingHUDViewController _setNeedsUpdateCoachingLabelText](self);
  }
}

- (SBUIAnimationPropertyAnimator)_makeViewControllerTransitionAnimationController
{
  if (a1)
  {
    a1 = [[SBUIAnimationPropertyAnimator alloc] initWithPropertyAnimatorGenerator:&__block_literal_global_267];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_updateCoachingButtonLayer:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = 2.5;
    if (!*(unsigned char *)(a1 + 1003)) {
      double v4 = 5.0;
    }
    id v5 = v3;
    [v3 setCornerRadius:v4];
    id v3 = v5;
  }
}

- (id)_makeGaussianBlurFilter
{
  if (a1)
  {
    uint64_t v1 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v1 setName:@"gaussianBlur"];
    [v1 setValue:@"default" forKey:*MEMORY[0x1E4F3A1D0]];
    [v1 setValue:@"default" forKey:*MEMORY[0x1E4F3A1A8]];
    [v1 setValue:&unk_1F3348C98 forKey:*MEMORY[0x1E4F3A1D8]];
    uint64_t v2 = MEMORY[0x1E4F1CC28];
    [v1 setValue:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F3A1B8]];
    [v1 setValue:v2 forKey:*MEMORY[0x1E4F3A1A0]];
  }
  else
  {
    uint64_t v1 = 0;
  }
  return v1;
}

id __91__SBSystemActionCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F43008]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __91__SBSystemActionCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_2;
  _OWORD v10[3] = &unk_1E6AF4AC0;
  id v4 = v2;
  id v11 = v4;
  id v5 = (void *)[v3 initWithDuration:3 curve:v10 animations:0.001];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__SBSystemActionCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_3;
  v8[3] = &unk_1E6AF8788;
  id v9 = v4;
  id v6 = v4;
  [v5 addCompletion:v8];

  return v5;
}

void __91__SBSystemActionCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v8 = [*(id *)(a1 + 32) viewControllerForKey:*MEMORY[0x1E4F43EC0]];
  id v2 = [*(id *)(a1 + 32) viewControllerForKey:*MEMORY[0x1E4F43EB0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v8 view];
    id v4 = [*(id *)(a1 + 32) containerView];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");

    id v5 = [*(id *)(a1 + 32) containerView];
    id v6 = [v8 view];
    [v5 addSubview:v6];
  }
  uint64_t v7 = [v2 view];
  [v7 removeFromSuperview];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __91__SBSystemActionCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (__CFString)_coachingLabelText
{
  uint64_t v1 = (__CFString *)a1;
  if (a1)
  {
    id v2 = [a1[127] configuredAction];
    id v3 = [v2 sectionIdentifier];
    if ([v3 isEqualToString:@"SilentMode"])
    {
      uint64_t v4 = -[SBSystemActionCoachingHUDViewController _silentModeCoachingLabelText]((uint64_t)v1);
    }
    else if ([v3 isEqualToString:@"Focus"])
    {
      uint64_t v4 = -[SBSystemActionCoachingHUDViewController _focusCoachingLabelText]((uint64_t)v1);
    }
    else
    {
      if ([v3 isEqualToString:@"Camera"]) {
        goto LABEL_7;
      }
      if ([v3 isEqualToString:@"VoiceMemos"])
      {
        uint64_t v4 = -[SBSystemActionCoachingHUDViewController _voiceMemosCoachingLabelText]((uint64_t)v1);
        goto LABEL_23;
      }
      if ([v3 isEqualToString:@"Flashlight"])
      {
        uint64_t v4 = -[SBSystemActionCoachingHUDViewController _flashlightCoachingLabelText]((uint64_t)v1);
        goto LABEL_23;
      }
      if ([v3 isEqualToString:@"Accessibility"])
      {
        uint64_t v4 = -[SBSystemActionCoachingHUDViewController _accessibilityCoachingLabelTextForConfiguredAction:](v1, v2);
        goto LABEL_23;
      }
      if ([v3 isEqualToString:@"Translate"])
      {
        uint64_t v4 = -[SBSystemActionCoachingHUDViewController _translateCoachingLabelText]((uint64_t)v1);
        goto LABEL_23;
      }
      if ([v3 isEqualToString:@"Magnifier"])
      {
LABEL_7:
        uint64_t v4 = -[SBSystemActionCoachingHUDViewController _cameraCoachingLabelText]((uint64_t)v1);
      }
      else if ([v3 isEqualToString:@"MusicRecognition"])
      {
        uint64_t v4 = -[SBSystemActionCoachingHUDViewController _musicRecognitionCoachingLabelText]((uint64_t)v1);
      }
      else
      {
        if ([v3 isEqualToString:@"Controls"])
        {
          id v5 = [(id)v1[31].length controlAction];
          -[SBSystemActionCoachingHUDViewController _controlCoachingLabelTextForAction:](v1, v5);
          uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_24:
          goto LABEL_25;
        }
        if (![v3 isEqualToString:@"Shortcuts"])
        {
          uint64_t v1 = &stru_1F3084718;
          goto LABEL_24;
        }
        uint64_t v4 = -[SBSystemActionCoachingHUDViewController _shortcutCoachingLabelTextForConfiguredAction:](v1, v2);
      }
    }
LABEL_23:
    uint64_t v1 = (__CFString *)v4;
    goto LABEL_24;
  }
LABEL_25:
  return v1;
}

- (double)_xTranslationTransformForCurrentState
{
  if (a1)
  {
    unint64_t v2 = *(void *)(a1 + 1032);
    if (*(unsigned char *)(a1 + 1003))
    {
      double v3 = 0.0;
      if (v2 == 2) {
        double v3 = 2.0;
      }
      if (!v2) {
        double v3 = -13.0;
      }
    }
    else
    {
      double v3 = 0.0;
      if (v2 <= 2) {
        double v3 = dbl_1D8FD2720[v2];
      }
    }
    CGAffineTransformMakeTranslation((CGAffineTransform *)a2, v3, 0.0);
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
  return result;
}

- (double)_ringerButtonFrame
{
  if (!a1) {
    return 0.0;
  }
  unint64_t v2 = +[SBButtonBezelGeometryInfo buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel];
  double v3 = [a1 view];
  [v2 buttonHWRectForButton:8 inView:v3];
  double v5 = v4;

  return v5;
}

- (double)_coachingLabelWrapperViewSize
{
  if (!a1) {
    return 0.0;
  }
  unint64_t v2 = [a1 traitCollection];
  [v2 displayScale];

  double v3 = [a1 view];
  double v4 = [v3 window];
  [v4 interfaceOrientation];

  double v5 = [a1 view];
  [v5 safeAreaInsets];

  v7.origin.double x = -[SBSystemActionCoachingHUDViewController _ringerButtonFrame](a1);
  CGRectGetMidY(v7);
  BSFloatRoundForScale();
  return result;
}

- (uint64_t)systemApertureFrames
{
  if (result) {
    return *(void *)(result + 1024);
  }
  return result;
}

uint64_t __71__SBSystemActionCoachingHUDViewController__updateCoachingLabelOccluded__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 0.0;
  if (!*(unsigned char *)(v1 + 1002) && (unint64_t)(*(void *)(v1 + 1032) - 1) <= 1 && !*(unsigned char *)(v1 + 1000)) {
    double v2 = 1.0;
  }
  return [*(id *)(v1 + 1152) setAlpha:v2];
}

- (id)_silentModeCoachingLabelText
{
  if (a1)
  {
    int v1 = -[SBRingerControl isRingerMuted](*(void *)(a1 + 1040));
    double v2 = [MEMORY[0x1E4F28B50] mainBundle];
    double v3 = v2;
    if (v1) {
      double v4 = @"SYSTEM_ACTION_COACHING_RING";
    }
    else {
      double v4 = @"SYSTEM_ACTION_COACHING_SILENT";
    }
    double v5 = [v2 localizedStringForKey:v4 value:&stru_1F3084718 table:@"SpringBoard"];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)_focusCoachingLabelText
{
  if (a1)
  {
    double v2 = [*(id *)(a1 + 1016) configuredAction];
    double v3 = objc_msgSend(v2, "sb_configuredIntentAction");
    double v4 = -[WFConfiguredStaccatoIntentAction sb_focusModeIdentifier](v3);

    if ([v4 isEqualToString:*MEMORY[0x1E4FA6960]])
    {
      double v5 = [MEMORY[0x1E4F28B50] mainBundle];
      id v6 = [v5 localizedStringForKey:@"SYSTEM_ACTION_COACHING_SHOW_FOCUS_LIST" value:&stru_1F3084718 table:@"SpringBoard"];
    }
    else
    {
      double v5 = [*(id *)(a1 + 1064) state];
      CGRect v7 = [v5 activeModeIdentifier];
      if ([v5 isActive]) {
        BOOL v8 = v7 == 0;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8 || ![v4 isEqualToString:v7])
      {
        id v9 = [MEMORY[0x1E4F28B50] mainBundle];
        char v10 = v9;
        id v11 = @"SYSTEM_ACTION_COACHING_TURN_ON";
      }
      else
      {
        id v9 = [MEMORY[0x1E4F28B50] mainBundle];
        char v10 = v9;
        id v11 = @"SYSTEM_ACTION_COACHING_TURN_OFF";
      }
      id v6 = [v9 localizedStringForKey:v11 value:&stru_1F3084718 table:@"SpringBoard"];
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_cameraCoachingLabelText
{
  if (a1)
  {
    int v1 = [MEMORY[0x1E4F28B50] mainBundle];
    double v2 = [v1 localizedStringForKey:@"SYSTEM_ACTION_COACHING_OPEN" value:&stru_1F3084718 table:@"SpringBoard"];
  }
  else
  {
    double v2 = 0;
  }
  return v2;
}

- (id)_voiceMemosCoachingLabelText
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v1 = objc_msgSend(*(id *)(a1 + 1048), "activities", 0);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v30;
LABEL_4:
      uint64_t v5 = 0;
      while (1)
      {
        if (*(void *)v30 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v29 + 1) + 8 * v5);
        CGRect v7 = [v6 descriptor];
        BOOL v8 = [v7 platterTargetBundleIdentifier];
        int v9 = [v8 isEqualToString:@"com.apple.VoiceMemos"];

        if (v9)
        {
          char v10 = [v6 contentUpdate];
          id v11 = [v10 content];
          long long v12 = [v11 contentData];

          if (v12) {
            break;
          }
        }
        if (v3 == ++v5)
        {
          uint64_t v3 = [v1 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v3) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      objc_super v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v12 options:0 error:0];
      uint64_t v14 = objc_opt_class();
      id v15 = v13;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }
      }
      else
      {
        id v16 = 0;
      }
      id v17 = v16;

      id v18 = [v17 objectForKey:@"isRecording"];

      uint64_t v19 = objc_opt_class();
      id v20 = v18;
      if (v19)
      {
        if (objc_opt_isKindOfClass()) {
          long long v21 = v20;
        }
        else {
          long long v21 = 0;
        }
      }
      else
      {
        long long v21 = 0;
      }
      id v22 = v21;

      char v23 = [v22 BOOLValue];
      if (v23)
      {
        CGAffineTransform v24 = [MEMORY[0x1E4F28B50] mainBundle];
        CGRect v25 = v24;
        long long v26 = @"SYSTEM_ACTION_COACHING_STOP";
        goto LABEL_25;
      }
    }
    else
    {
LABEL_11:
    }
    CGAffineTransform v24 = [MEMORY[0x1E4F28B50] mainBundle];
    CGRect v25 = v24;
    long long v26 = @"SYSTEM_ACTION_COACHING_RECORD";
LABEL_25:
    v27 = [v24 localizedStringForKey:v26 value:&stru_1F3084718 table:@"SpringBoard"];
  }
  else
  {
    v27 = 0;
  }
  return v27;
}

- (id)_flashlightCoachingLabelText
{
  if (a1)
  {
    BOOL v1 = -[SBFlashlightActivityManager isFlashlightOn](*(void *)(a1 + 1072));
    uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v3 = v2;
    if (v1) {
      uint64_t v4 = @"SYSTEM_ACTION_COACHING_TURN_OFF";
    }
    else {
      uint64_t v4 = @"SYSTEM_ACTION_COACHING_TURN_ON";
    }
    uint64_t v5 = [v2 localizedStringForKey:v4 value:&stru_1F3084718 table:@"SpringBoard"];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)_accessibilityCoachingLabelTextForConfiguredAction:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = objc_msgSend(a2, "sb_configuredIntentAction");
    uint64_t v5 = -[WFConfiguredStaccatoIntentAction sb_accessibilityTripleClickState](v4);
    if (v5 == (void *)2)
    {
      objc_super v13 = [MEMORY[0x1E4F28B50] mainBundle];
      CGRect v7 = v13;
      uint64_t v14 = @"SYSTEM_ACTION_COACHING_TURN_ON";
    }
    else
    {
      if (v5 != (void *)1)
      {
        if (v5)
        {
LABEL_13:

          goto LABEL_14;
        }
        id v6 = [v4 templateParameterValues];
        CGRect v7 = [v6 objectForKey:*MEMORY[0x1E4F49048]];

        BOOL v8 = NSString;
        int v9 = [MEMORY[0x1E4F28B50] mainBundle];
        char v10 = [v9 localizedStringForKey:@"SYSTEM_ACTION_COACHING_ACCESSIBILITY_FORMAT" value:&stru_1F3084718 table:@"SpringBoard"];
        id v11 = [v7 localizedTitle];
        long long v12 = objc_msgSend(v8, "stringWithFormat:", v10, v11);

        if (-[SBSystemActionCoachingHUDViewController _canFitTextInCoachingLabel:](a1, v12))
        {
          id v2 = v12;
        }
        else
        {
          id v15 = [MEMORY[0x1E4F28B50] mainBundle];
          id v2 = [v15 localizedStringForKey:@"SYSTEM_ACTION_COACHING_ACCESSIBILITY_FALLBACK" value:&stru_1F3084718 table:@"SpringBoard"];
        }
LABEL_12:

        goto LABEL_13;
      }
      objc_super v13 = [MEMORY[0x1E4F28B50] mainBundle];
      CGRect v7 = v13;
      uint64_t v14 = @"SYSTEM_ACTION_COACHING_TURN_OFF";
    }
    id v2 = [v13 localizedStringForKey:v14 value:&stru_1F3084718 table:@"SpringBoard"];
    goto LABEL_12;
  }
  id v2 = 0;
LABEL_14:
  return v2;
}

- (id)_translateCoachingLabelText
{
  if (a1)
  {
    BOOL v1 = [MEMORY[0x1E4F28B50] mainBundle];
    id v2 = [v1 localizedStringForKey:@"SYSTEM_ACTION_COACHING_TRANSLATE" value:&stru_1F3084718 table:@"SpringBoard"];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)_musicRecognitionCoachingLabelText
{
  if (a1)
  {
    BOOL v1 = [MEMORY[0x1E4F28B50] mainBundle];
    id v2 = [v1 localizedStringForKey:@"SYSTEM_ACTION_COACHING_MUSIC_RECOGNITION" value:&stru_1F3084718 table:@"SpringBoard"];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)_controlCoachingLabelTextForAction:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = -[SBControlSystemAction properties]((uint64_t)v3);
    id v6 = -[SBHomeScreenConfigurationServer connections]((uint64_t)v5);
    uint64_t v7 = -[SBCameraHardwareButton allCameraShutterButtonPIDs]((uint64_t)v5);
    if (v6)
    {
      uint64_t v8 = v7;
    }
    else
    {
      int v9 = [v4 configuredAction];
      char v10 = [v9 associatedBundleIdentifier];

      id v11 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v10 allowPlaceholder:1 error:0];
      long long v12 = [v11 localizedName];
      objc_super v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [v11 localizedShortName];
      }
      id v6 = v14;

      uint64_t v8 = 0;
    }
    if (![v6 length]) {
      goto LABEL_17;
    }
    if (v8 == 1)
    {
      id v15 = NSString;
      id v16 = [MEMORY[0x1E4F28B50] mainBundle];
      id v17 = v16;
      id v18 = @"SYSTEM_ACTION_COACHING_CONTROL_VERB_FORMAT";
    }
    else
    {
      if (v8)
      {
        id v20 = 0;
        goto LABEL_15;
      }
      id v15 = NSString;
      id v16 = [MEMORY[0x1E4F28B50] mainBundle];
      id v17 = v16;
      id v18 = @"SYSTEM_ACTION_COACHING_CONTROL_DEFAULT_FORMAT";
    }
    uint64_t v19 = [v16 localizedStringForKey:v18 value:&stru_1F3084718 table:@"SpringBoard"];
    id v20 = objc_msgSend(v15, "stringWithFormat:", v19, v6);

LABEL_15:
    if (-[SBSystemActionCoachingHUDViewController _canFitTextInCoachingLabel:](a1, v20))
    {
LABEL_18:

      goto LABEL_19;
    }

LABEL_17:
    long long v21 = [MEMORY[0x1E4F28B50] mainBundle];
    id v20 = [v21 localizedStringForKey:@"SYSTEM_ACTION_COACHING_CONTROL_FALLBACK" value:&stru_1F3084718 table:@"SpringBoard"];

    goto LABEL_18;
  }
  id v20 = 0;
LABEL_19:

  return v20;
}

- (void)_shortcutCoachingLabelTextForConfiguredAction:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 identifier];
    int v6 = [v5 isEqualToString:@"is.workflow.actions.openapp"];

    if (v6)
    {
      uint64_t v7 = (void *)a1[132];
      uint64_t v8 = [v4 associatedBundleIdentifier];
      int v9 = [v7 applicationWithBundleIdentifier:v8];

      if (v9)
      {
        char v10 = NSString;
        id v11 = [MEMORY[0x1E4F28B50] mainBundle];
        long long v12 = [v11 localizedStringForKey:@"SYSTEM_ACTION_COACHING_OPEN_APP_FORMAT" value:&stru_1F3084718 table:@"SpringBoard"];
        objc_super v13 = [v9 displayName];
        objc_msgSend(v10, "stringWithFormat:", v12, v13);
        id v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 && -[SBSystemActionCoachingHUDViewController _canFitTextInCoachingLabel:](a1, v14))
        {
          id v15 = v14;
          id v14 = v15;
LABEL_10:
          a1 = v15;
LABEL_13:

          goto LABEL_14;
        }
      }
      else
      {
        id v14 = 0;
      }
      id v20 = [MEMORY[0x1E4F28B50] mainBundle];
      a1 = [v20 localizedStringForKey:@"SYSTEM_ACTION_COACHING_OPEN_APP_FALLBACK" value:&stru_1F3084718 table:@"SpringBoard"];

      goto LABEL_13;
    }
    id v16 = NSString;
    id v17 = [MEMORY[0x1E4F28B50] mainBundle];
    id v18 = [v17 localizedStringForKey:@"SYSTEM_ACTION_COACHING_SHORTCUT_FORMAT" value:&stru_1F3084718 table:@"SpringBoard"];
    uint64_t v19 = [v4 name];
    objc_msgSend(v16, "stringWithFormat:", v18, v19);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (-[SBSystemActionCoachingHUDViewController _canFitTextInCoachingLabel:](a1, v14))
    {
      id v14 = v14;
      a1 = v14;
LABEL_14:

      goto LABEL_15;
    }
    int v9 = [MEMORY[0x1E4F28B50] mainBundle];
    id v15 = [v9 localizedStringForKey:@"SYSTEM_ACTION_COACHING_SHORTCUT_FALLBACK" value:&stru_1F3084718 table:@"SpringBoard"];
    goto LABEL_10;
  }
LABEL_15:

  return a1;
}

- (void)_canFitTextInCoachingLabel:(void *)a1
{
  id v2 = a1;
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v8 = *MEMORY[0x1E4F42508];
    id v3 = (void *)a1[145];
    id v4 = a2;
    uint64_t v5 = [v3 font];
    v9[0] = v5;
    int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 3, v6, 0, 1.79769313e308, 1.79769313e308);
    -[SBSystemActionCoachingHUDViewController _coachingLabelWrapperViewSize](v2);
    if (BSFloatLessThanOrEqualToFloat()) {
      id v2 = (void *)BSFloatLessThanOrEqualToFloat();
    }
    else {
      id v2 = 0;
    }
  }
  return v2;
}

- (SBHUDAttachmentDelegate)attachmentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentDelegate);
  return (SBHUDAttachmentDelegate *)WeakRetained;
}

- (id)delegate
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 126);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)setDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 126, a2);
  }
  return result;
}

- (uint64_t)action
{
  if (result) {
    return *(void *)(result + 1016);
  }
  return result;
}

- (uint64_t)state
{
  if (result) {
    return *(void *)(result + 1032);
  }
  return result;
}

- (uint64_t)ringerControl
{
  if (result) {
    return *(void *)(result + 1040);
  }
  return result;
}

- (uint64_t)activityManager
{
  if (result) {
    return *(void *)(result + 1048);
  }
  return result;
}

- (uint64_t)applicationController
{
  if (result) {
    return *(void *)(result + 1056);
  }
  return result;
}

- (uint64_t)doNotDisturbStateMonitor
{
  if (result) {
    return *(void *)(result + 1064);
  }
  return result;
}

- (uint64_t)flashlightActivityManager
{
  if (result) {
    return *(void *)(result + 1072);
  }
  return result;
}

- (uint64_t)settings
{
  if (result) {
    return *(void *)(result + 1080);
  }
  return result;
}

- (uint64_t)contentVisibilityAssertion
{
  if (result) {
    return *(void *)(result + 1088);
  }
  return result;
}

- (uint64_t)liveRenderingAssertion
{
  if (result) {
    return *(void *)(result + 1096);
  }
  return result;
}

- (BOOL)isRotating
{
  if (result) {
    return *(unsigned char *)(result + 1000) != 0;
  }
  return result;
}

- (uint64_t)stateTransitionAnimationCount
{
  if (result) {
    return *(void *)(result + 1104);
  }
  return result;
}

- (BOOL)coachingLabelTextNeedsUpdate
{
  if (result) {
    return *(unsigned char *)(result + 1001) != 0;
  }
  return result;
}

- (uint64_t)coachingLabelOrientation
{
  if (result) {
    return *(void *)(result + 1112);
  }
  return result;
}

- (BOOL)isCoachingLabelOccluded
{
  if (result) {
    return *(unsigned char *)(result + 1002) != 0;
  }
  return result;
}

- (uint64_t)contentView
{
  if (result) {
    return *(void *)(result + 1120);
  }
  return result;
}

- (uint64_t)dimmingView
{
  if (result) {
    return *(void *)(result + 1128);
  }
  return result;
}

- (uint64_t)coachingContentView
{
  if (result) {
    return *(void *)(result + 1136);
  }
  return result;
}

- (uint64_t)coachingButton
{
  if (result) {
    return *(void *)(result + 1144);
  }
  return result;
}

- (uint64_t)coachingLabelWrapperView
{
  if (result) {
    return *(void *)(result + 1152);
  }
  return result;
}

- (uint64_t)coachingLabel
{
  if (result) {
    return *(void *)(result + 1160);
  }
  return result;
}

- (BOOL)shouldLayoutForButtonHints
{
  if (result) {
    return *(unsigned char *)(result + 1003) != 0;
  }
  return result;
}

- (BOOL)isAttached
{
  if (result) {
    return *(unsigned char *)(result + 1004) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coachingLabel, 0);
  objc_storeStrong((id *)&self->_coachingLabelWrapperView, 0);
  objc_storeStrong((id *)&self->_coachingButton, 0);
  objc_storeStrong((id *)&self->_coachingContentView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_contentVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_flashlightActivityManager, 0);
  objc_storeStrong((id *)&self->_doNotDisturbStateMonitor, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_ringerControl, 0);
  objc_storeStrong((id *)&self->_systemApertureFrames, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_attachmentDelegate);
}

- (void)initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRingerControl:activityManager:applicationController:doNotDisturbStateMonitor:flashlightActivityManager:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end