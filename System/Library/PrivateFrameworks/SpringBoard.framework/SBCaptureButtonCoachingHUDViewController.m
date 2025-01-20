@interface SBCaptureButtonCoachingHUDViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)coachingLabelTextNeedsUpdate;
- (BOOL)definesAnimatedDismissal;
- (BOOL)isAttached;
- (BOOL)isHUDAttached;
- (BOOL)isRotating;
- (NSArray)physicalButtonSceneTargets;
- (SBCaptureButtonCoachingHUDButtonHighlight)_makeCoachingButtonHighlight;
- (SBCaptureButtonCoachingHUDGlyphView)_makeGlyphView;
- (SBCaptureButtonCoachingHUDLabel)_makeCoachingLabel;
- (SBCaptureButtonCoachingHUDLabelWrapperView)_makeCoachingLabelWrapperView;
- (SBCaptureButtonCoachingHUDViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBCaptureButtonCoachingHUDViewControllerDelegate)delegate;
- (SBHUDAttachmentDelegate)attachmentDelegate;
- (SBUIAnimationPropertyAnimator)_makeViewControllerTransitionAnimationController;
- (double)_captureButtonFrame;
- (double)_viewContentAlphaForCurrentState;
- (double)_xTranslationTransformForCurrentState;
- (id)_animationSettingsForTransitionFromState:(uint64_t)a3 toState:;
- (id)_layoutCoachingButtonHighlight;
- (id)_layoutCoachingLabel;
- (id)_layoutGlyphView;
- (id)_makeGaussianBlurFilter;
- (int64_t)state;
- (int64_t)triggerButton;
- (uint64_t)_layoutCoachingContentView;
- (uint64_t)_layoutDimmingView;
- (uint64_t)_layoutTempBackdropView;
- (uint64_t)coachingButtonHighlightView;
- (uint64_t)coachingContentView;
- (uint64_t)coachingLabel;
- (uint64_t)coachingLabelOrientation;
- (uint64_t)coachingLabelWrapperView;
- (uint64_t)coachingText;
- (uint64_t)contentView;
- (uint64_t)dimmingView;
- (uint64_t)glyphLandscapeState;
- (uint64_t)glyphPackageName;
- (uint64_t)glyphView;
- (uint64_t)liveRenderingAssertion;
- (uint64_t)setCoachingLabelOrientation:(uint64_t)result;
- (uint64_t)settings;
- (uint64_t)stateTransitionAnimationCount;
- (uint64_t)tempBackdropLayer;
- (unint64_t)attachmentIgnoredOrientations;
- (void)_coachingLabelWrapperViewSize;
- (void)_layoutCoachingLabelWrapperView;
- (void)_pauseAndResetLayer:(uint64_t)a1;
- (void)_playTimingOnLayerTree:(uint64_t)a1;
- (void)_resetAndPauseTimingOnLayerTree:(uint64_t)a1;
- (void)_resetGlyphViewToState:(uint64_t)a1;
- (void)_resumeLayer:(uint64_t)a1;
- (void)_updateCoachingLabelTextIfNeeded;
- (void)_updateLiveRenderingAssertionIfNeeded;
- (void)dismissAnimatedWithCompletion:(id)a3;
- (void)setAttachmentDelegate:(id)a3;
- (void)setCoachingText:(id)a3 glyphPackageName:(id)a4 glyphLandscapeState:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setIsAttached:(uint64_t)a1;
- (void)setPositionOffset:(CGPoint)a3;
- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBCaptureButtonCoachingHUDViewController

- (SBCaptureButtonCoachingHUDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  v4 = [(SBCaptureButtonCoachingHUDViewController *)&v10 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_rotating = 0;
    v4->_stateTransitionAnimationCount = 0;
    v4->_state = 0;
    v6 = +[SBSystemActionDomain rootSettings];
    uint64_t v7 = [v6 coachingSettings];
    settings = v5->_settings;
    v5->_settings = (SBSystemActionCoachingSettings *)v7;

    v5->_coachingLabelTextNeedsUpdate = 1;
    v5->_coachingLabelOrientation = 1;
    [(SBCaptureButtonCoachingHUDViewController *)v5 setTransitioningDelegate:v5];
  }
  return v5;
}

- (void)setCoachingText:(id)a3 glyphPackageName:(id)a4 glyphLandscapeState:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  objc_super v10 = (NSString *)[a3 copy];
  coachingText = self->_coachingText;
  self->_coachingText = v10;

  v12 = (NSString *)[v9 copy];
  glyphPackageName = self->_glyphPackageName;
  self->_glyphPackageName = v12;

  v14 = (NSString *)[v8 copy];
  glyphLandscapeState = self->_glyphLandscapeState;
  self->_glyphLandscapeState = v14;

  self->_coachingLabelTextNeedsUpdate = 1;
  id v16 = [(SBCaptureButtonCoachingHUDViewController *)self viewIfLoaded];
  [v16 setNeedsLayout];
}

- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = -[SBCaptureButtonCoachingHUDViewController _animationSettingsForTransitionFromState:toState:]((id *)&self->super.super.super.super.isa, self->_state, a3);
  if (a3 && !self->_state)
  {
    if ((unint64_t)(self->_coachingLabelOrientation - 3) > 1) {
      glyphLandscapeState = 0;
    }
    else {
      glyphLandscapeState = self->_glyphLandscapeState;
    }
    -[SBCaptureButtonCoachingHUDViewController _resetGlyphViewToState:]((uint64_t)self, glyphLandscapeState);
    dispatch_time_t v11 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
    v12 = [(SBOrientationTransformWrapperViewController *)self view];
    [v12 setNeedsLayout];

    v13 = [(SBOrientationTransformWrapperViewController *)self view];
    [v13 layoutIfNeeded];

    -[SBCaptureButtonCoachingHUDViewController setIsAttached:]((uint64_t)self, 1);
  }
  if (v5) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 2;
  }
  self->_state = a3;
  ++self->_stateTransitionAnimationCount;
  -[SBCaptureButtonCoachingHUDViewController _updateCoachingLabelTextIfNeeded]((uint64_t)self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained captureButtonCoachingHUDViewController:self didBeginTransitionToState:a3];

  id v16 = (void *)MEMORY[0x1E4F42FF0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke_2;
  v21[3] = &unk_1E6AF4A70;
  v21[4] = self;
  v21[5] = a3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke_28;
  v18[3] = &unk_1E6AF5268;
  id v19 = v8;
  int64_t v20 = a3;
  v18[4] = self;
  id v17 = v8;
  objc_msgSend(v16, "sb_animateWithSettings:mode:animations:completion:", v9, v14, v21, v18);
}

- (id)_animationSettingsForTransitionFromState:(uint64_t)a3 toState:
{
  if (a1)
  {
    if (a3 == 2)
    {
      a1 = [a1[128] expansionSettings];
    }
    else if (a3 == 1)
    {
      id v3 = a1[128];
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
      a1 = [a1[128] dismissalSettings];
    }
  }
  return a1;
}

- (void)_resetGlyphViewToState:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(void **)(a1 + 1104);
    id v4 = a2;
    [v3 setState:0 animated:0];
    [*(id *)(a1 + 1104) removeFromSuperview];
    BOOL v5 = *(void **)(a1 + 1104);
    *(void *)(a1 + 1104) = 0;

    uint64_t v6 = -[SBCaptureButtonCoachingHUDViewController _makeGlyphView]((SBCaptureButtonCoachingHUDGlyphView *)a1);
    uint64_t v7 = *(void **)(a1 + 1104);
    *(void *)(a1 + 1104) = v6;

    [*(id *)(a1 + 1120) addSubview:*(void *)(a1 + 1104)];
    -[SBCaptureButtonCoachingHUDViewController _layoutGlyphView]((id *)a1);
    [*(id *)(a1 + 1104) setState:v4 animated:0];

    id v8 = [*(id *)(a1 + 1104) layer];
    -[SBCaptureButtonCoachingHUDViewController _resetAndPauseTimingOnLayerTree:](a1, v8);
  }
}

void __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(v1 + 1104) layer];
  -[SBCaptureButtonCoachingHUDViewController _playTimingOnLayerTree:](v1, v2);
}

- (void)_playTimingOnLayerTree:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    -[SBCaptureButtonCoachingHUDViewController _resumeLayer:](a1, v3);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v5 = objc_msgSend(v4, "sublayers", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[SBCaptureButtonCoachingHUDViewController _playTimingOnLayerTree:](a1, *(void *)(*((void *)&v10 + 1) + 8 * i));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setIsAttached:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 1002) != a2)
  {
    *(unsigned char *)(a1 + 1002) = a2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 976));
    [WeakRetained updateAttachmentStateForHUDViewController:a1];
  }
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
        if (*(void *)(a1 + 1016) || !*(void *)(a1 + 1040))
        {
          [*(id *)(a1 + 1128) setText:*(void *)(a1 + 1048)];
          *(unsigned char *)(a1 + 1001) = 0;
        }
      }
    }
  }
}

void __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke_2(uint64_t a1)
{
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingContentView](*(void *)(a1 + 32));
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingButtonHighlight](*(id **)(a1 + 32));
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingLabelWrapperView](*(void **)(a1 + 32));
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingLabel](*(id **)(a1 + 32));
  -[SBCaptureButtonCoachingHUDViewController _layoutGlyphView](*(id **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 0.0;
  if (v2 && (unint64_t)(*(void *)(v2 + 1016) - 1) <= 1)
  {
    if (*(unsigned char *)(v2 + 1000)) {
      double v3 = 0.0;
    }
    else {
      double v3 = 1.0;
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4) {
      return;
    }
    [*(id *)(v2 + 1088) setAlpha:0.0];
    uint64_t v9 = *(void *)(a1 + 32);
    long long v10 = *(void **)(v9 + 1096);
    [*(id *)(v9 + 1080) bounds];
    objc_msgSend(v10, "setFrame:");
    [*(id *)(*(void *)(a1 + 32) + 1096) setAlpha:v3];
    [*(id *)(*(void *)(a1 + 32) + 1120) setAlpha:v3];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1096) layer];
    uint64_t v7 = v6;
    uint64_t v8 = &unk_1F3348D18;
  }
  else
  {
    BOOL v5 = *(void **)(v2 + 1088);
    [*(id *)(v2 + 1024) dimmingAlpha];
    objc_msgSend(v5, "setAlpha:");
    [*(id *)(*(void *)(a1 + 32) + 1096) setAlpha:v3];
    [*(id *)(*(void *)(a1 + 32) + 1120) setAlpha:v3];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1096) layer];
    uint64_t v7 = v6;
    uint64_t v8 = &unk_1F3348D28;
  }
  [v6 setValue:v8 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  id v12 = [*(id *)(*(void *)(a1 + 32) + 1112) layer];
  *(float *)&double v11 = v3;
  [v12 setShadowOpacity:v11];
}

- (uint64_t)_layoutCoachingContentView
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 1080) bounds];
    uint64_t v2 = *(void **)(v1 + 1096);
    UIRectGetCenter();
    objc_msgSend(v2, "setCenter:");
    double v3 = *(void **)(v1 + 1096);
    BSRectWithSize();
    return objc_msgSend(v3, "setBounds:");
  }
  return result;
}

- (id)_layoutCoachingButtonHighlight
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result traitCollection];
    [v2 displayScale];

    double v3 = -[SBCaptureButtonCoachingHUDViewController _captureButtonFrame](v1);
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    [v1[135] bounds];
    v17.origin.x = v3;
    v17.origin.y = v5;
    v17.size.width = v7;
    v17.size.height = v9;
    CGRectGetHeight(v17);
    v18.origin.x = v3;
    v18.origin.y = v5;
    v18.size.width = v7;
    v18.size.height = v9;
    CGRectGetMinY(v18);
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    memset(&v16, 0, sizeof(v16));
    id v10 = v1[127];
    double v11 = 0.0;
    if (v10 == (id)2) {
      double v11 = -2.0;
    }
    if (!v10) {
      double v11 = -3.0;
    }
    CGAffineTransformMakeTranslation(&v16, v11, 0.0);
    id v12 = v1[139];
    UIRectGetCenter();
    objc_msgSend(v12, "setCenter:");
    id v13 = v1[139];
    BSRectWithSize();
    objc_msgSend(v13, "setBounds:");
    id v14 = v1[139];
    CGAffineTransform v15 = v16;
    return (id *)[v14 setTransform:&v15];
  }
  return result;
}

- (void)_layoutCoachingLabelWrapperView
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result traitCollection];
    [v2 displayScale];

    -[SBCaptureButtonCoachingHUDViewController _captureButtonFrame](v1);
    -[SBCaptureButtonCoachingHUDViewController _coachingLabelWrapperViewSize](v1);
    double v4 = v3;
    double v6 = v5;
    [*((id *)v1 + 135) bounds];
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    memset(&v26, 0, sizeof(v26));
    unint64_t v7 = *((void *)v1 + 127);
    CGFloat v8 = 0.0;
    if (v7 <= 2) {
      CGFloat v8 = dbl_1D8FD2CC8[v7];
    }
    CGAffineTransformMakeScale(&v26, v8, v8);
    memset(&v25, 0, sizeof(v25));
    double v9 = -2.0;
    if (v7 != 2) {
      double v9 = 0.0;
    }
    if (!v7) {
      double v9 = -3.0;
    }
    CGAffineTransformMakeTranslation(&v25, v9, 0.0);
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v24.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v24.c = v10;
    *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&t1.a = *(_OWORD *)&v24.a;
    *(_OWORD *)&t1.c = v10;
    *(_OWORD *)&t1.tx = *(_OWORD *)&v24.tx;
    CGAffineTransform t2 = v26;
    CGAffineTransformConcat(&v24, &t1, &t2);
    CGAffineTransform t2 = v24;
    CGAffineTransform v22 = v25;
    CGAffineTransformConcat(&t1, &t2, &v22);
    *(_OWORD *)&v24.tx = *(_OWORD *)&t1.tx;
    UIRectGetCenter();
    double v12 = v11;
    double v14 = v13;
    CGAffineTransform v15 = [*((id *)v1 + 140) layer];
    [v15 anchorPoint];
    double v17 = v16;
    double v19 = v18;

    objc_msgSend(*((id *)v1 + 140), "setCenter:", v12 + (v17 + -0.5) * v4, v14 + (v19 + -0.5) * v6);
    int64_t v20 = (void *)*((void *)v1 + 140);
    BSRectWithSize();
    objc_msgSend(v20, "setBounds:");
    v21 = (void *)*((void *)v1 + 140);
    CGAffineTransform v26 = t1;
    return (void *)[v21 setTransform:&v26];
  }
  return result;
}

- (id)_layoutCoachingLabel
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result traitCollection];
    [v2 displayScale];

    [v1[140] bounds];
    id v3 = v1[141];
    -[SBCaptureButtonCoachingHUDViewController _coachingLabelWrapperViewSize](v1);
    objc_msgSend(v3, "sizeThatFits:");
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    memset(&v26, 0, sizeof(v26));
    SBFTransformFromOrientationToOrientation();
    memset(&v25, 0, sizeof(v25));
    BSFloatRoundForScale();
    CGAffineTransformMakeTranslation(&v25, v12, 0.0);
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&t1.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&t1.c = v13;
    *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransform t2 = v26;
    CGAffineTransformConcat(&v22, &t1, &t2);
    long long v23 = *(_OWORD *)&v22.a;
    long long v24 = *(_OWORD *)&v22.c;
    CGAffineTransform t1 = v22;
    CGAffineTransform t2 = v25;
    CGAffineTransformConcat(&v22, &t1, &t2);
    long long v23 = *(_OWORD *)&v22.a;
    CGFloat tx = v22.tx;
    CGFloat ty = v22.ty;
    CGAffineTransform v26 = v22;
    v27.origin.x = v5;
    v27.origin.y = v7;
    v27.size.width = v9;
    v27.size.height = v11;
    CGRectApplyAffineTransform(v27, &v26);
    UIRectGetCenter();
    SBUnintegralizedRectCenteredAboutPoint();
    BSPointRoundForScale();
    id v14 = v1[141];
    UIRectGetCenter();
    objc_msgSend(v14, "setCenter:");
    id v15 = v1[141];
    BSRectWithSize();
    objc_msgSend(v15, "setBounds:");
    id v16 = v1[141];
    *(_OWORD *)&v26.a = *(_OWORD *)&v22.a;
    *(_OWORD *)&v26.c = *(_OWORD *)&v22.c;
    v26.CGFloat tx = tx;
    v26.CGFloat ty = ty;
    [v16 setTransform:&v26];
    if ((char *)v1[134] - 3 < (char *)2) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    return (id *)[v1[141] setTextAlignment:v17];
  }
  return result;
}

- (id)_layoutGlyphView
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result traitCollection];
    [v2 displayScale];

    [v1[140] bounds];
    [v1[141] bounds];
    [v1[141] bounds];
    id v4 = v1[134];
    if (v4 != (id)4 && v4 != (id)3) {
      objc_msgSend(v1[141], "bounds", (v3 + -40.0) * 0.5);
    }
    UIRectIntegralWithScale();
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    memset(&v26, 0, sizeof(v26));
    SBFTransformFromOrientationToOrientation();
    memset(&v25, 0, sizeof(v25));
    BSFloatRoundForScale();
    CGAffineTransformMakeTranslation(&v25, v13, 0.0);
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&t1.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&t1.c = v14;
    *(_OWORD *)&t1.CGFloat tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransform t2 = v26;
    CGAffineTransformConcat(&v22, &t1, &t2);
    long long v23 = *(_OWORD *)&v22.a;
    long long v24 = *(_OWORD *)&v22.c;
    CGAffineTransform t1 = v22;
    CGAffineTransform t2 = v25;
    CGAffineTransformConcat(&v22, &t1, &t2);
    long long v23 = *(_OWORD *)&v22.a;
    CGFloat tx = v22.tx;
    CGFloat ty = v22.ty;
    CGAffineTransform v26 = v22;
    v27.origin.x = v6;
    v27.origin.y = v8;
    v27.size.width = v10;
    v27.size.height = v12;
    CGRectApplyAffineTransform(v27, &v26);
    UIRectGetCenter();
    SBUnintegralizedRectCenteredAboutPoint();
    BSPointRoundForScale();
    id v15 = v1[138];
    UIRectGetCenter();
    objc_msgSend(v15, "setCenter:");
    id v16 = v1[138];
    BSRectWithSize();
    objc_msgSend(v16, "setBounds:");
    id v17 = v1[138];
    *(_OWORD *)&v26.a = *(_OWORD *)&v22.a;
    *(_OWORD *)&v26.c = *(_OWORD *)&v22.c;
    v26.CGFloat tx = tx;
    v26.CGFloat ty = ty;
    return (id *)[v17 setTransform:&v26];
  }
  return result;
}

- (double)_viewContentAlphaForCurrentState
{
  double result = 0.0;
  if (a1 && (unint64_t)(*(void *)(a1 + 1016) - 1) <= 1 && !*(unsigned char *)(a1 + 1000)) {
    return 1.0;
  }
  return result;
}

uint64_t __82__SBCaptureButtonCoachingHUDViewController_transitionToState_animated_completion___block_invoke_28(void *a1)
{
  --*(void *)(a1[4] + 1040);
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 1040))
  {
    uint64_t v3 = *(void *)(v2 + 1016);
    if (v3 == a1[6] && !v3) {
      -[SBCaptureButtonCoachingHUDViewController setIsAttached:](v2, 0);
    }
  }
  uint64_t result = a1[5];
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)viewDidLoad
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  [(SBCaptureButtonCoachingHUDViewController *)&v24 viewDidLoad];
  uint64_t v3 = [(SBOrientationTransformWrapperViewController *)self view];
  [v3 setCounterTransformView:1];
  objc_msgSend(v3, "bs_setHitTestingDisabled:", 1);
  -[SBSystemActionCoachingHUDViewController _makeContentView](self);
  id v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v4;

  [v3 addContentView:self->_contentView];
  CGFloat v6 = objc_alloc_init(_SBCaptureButtonCoachingBackdropLayer_Temp_134941860);
  tempBackdropLayer = self->_tempBackdropLayer;
  self->_tempBackdropLayer = v6;

  [(UIView *)self->_contentView addSubview:self->_tempBackdropLayer];
  -[SBSystemActionCoachingHUDViewController _makeDimmingView]((uint64_t)self);
  CGFloat v8 = (UIView *)objc_claimAutoreleasedReturnValue();
  dimmingView = self->_dimmingView;
  self->_dimmingView = v8;

  [(UIView *)self->_contentView addSubview:self->_dimmingView];
  id v10 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(UIView *)self->_contentView bounds];
  double v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
  coachingContentView = self->_coachingContentView;
  self->_coachingContentView = v11;

  CGFloat v13 = [(UIView *)self->_coachingContentView layer];
  long long v14 = -[SBCaptureButtonCoachingHUDViewController _makeGaussianBlurFilter]((uint64_t)self);
  v25[0] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v13 setFilters:v15];

  [(UIView *)self->_contentView addSubview:self->_coachingContentView];
  -[SBCaptureButtonCoachingHUDViewController _makeCoachingButtonHighlight]((uint64_t)self);
  id v16 = (SBCaptureButtonCoachingHUDButtonHighlight *)objc_claimAutoreleasedReturnValue();
  coachingButtonHighlightView = self->_coachingButtonHighlightView;
  self->_coachingButtonHighlightView = v16;

  [(UIView *)self->_coachingContentView addSubview:self->_coachingButtonHighlightView];
  -[SBCaptureButtonCoachingHUDViewController _makeCoachingLabelWrapperView]((uint64_t)self);
  double v18 = (SBCaptureButtonCoachingHUDLabelWrapperView *)objc_claimAutoreleasedReturnValue();
  coachingLabelWrapperView = self->_coachingLabelWrapperView;
  self->_coachingLabelWrapperView = v18;

  [(UIView *)self->_coachingContentView addSubview:self->_coachingLabelWrapperView];
  -[SBCaptureButtonCoachingHUDViewController _makeCoachingLabel]((uint64_t)self);
  int64_t v20 = (SBCaptureButtonCoachingHUDLabel *)objc_claimAutoreleasedReturnValue();
  coachingLabel = self->_coachingLabel;
  self->_coachingLabel = v20;

  [(SBCaptureButtonCoachingHUDLabelWrapperView *)self->_coachingLabelWrapperView addSubview:self->_coachingLabel];
  -[SBCaptureButtonCoachingHUDViewController _makeGlyphView]((SBCaptureButtonCoachingHUDGlyphView *)self);
  CGAffineTransform v22 = (SBCaptureButtonCoachingHUDGlyphView *)objc_claimAutoreleasedReturnValue();
  glyphView = self->_glyphView;
  self->_glyphView = v22;

  [(SBCaptureButtonCoachingHUDLabelWrapperView *)self->_coachingLabelWrapperView addSubview:self->_glyphView];
}

- (id)_makeGaussianBlurFilter
{
  if (a1)
  {
    uint64_t v1 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v1 setName:@"gaussianBlur"];
    [v1 setValue:@"default" forKey:*MEMORY[0x1E4F3A1D0]];
    [v1 setValue:@"default" forKey:*MEMORY[0x1E4F3A1A8]];
    [v1 setValue:&unk_1F3348D18 forKey:*MEMORY[0x1E4F3A1D8]];
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

- (SBCaptureButtonCoachingHUDButtonHighlight)_makeCoachingButtonHighlight
{
  if (a1)
  {
    uint64_t v2 = [SBCaptureButtonCoachingHUDButtonHighlight alloc];
    uint64_t v3 = -[SBCaptureButtonCoachingHUDButtonHighlight initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(SBCaptureButtonCoachingHUDButtonHighlight *)v3 setAccessibilityIdentifier:@"capture-button-coaching-button"];
    id v4 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(SBCaptureButtonCoachingHUDButtonHighlight *)v3 setBackgroundColor:v4];

    double v5 = [(SBCaptureButtonCoachingHUDButtonHighlight *)v3 layer];
    [v5 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    id v6 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v5, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [v5 setShadowOpacity:0.0];
    [v5 setShadowPathIsBounds:1];
    [*(id *)(a1 + 1024) coachingButtonShadowRadius];
    objc_msgSend(v5, "setShadowRadius:");
    [v5 setCornerRadius:2.5];
    objc_msgSend(v5, "setAnchorPoint:", 1.0, 0.5);
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (SBCaptureButtonCoachingHUDLabelWrapperView)_makeCoachingLabelWrapperView
{
  if (a1)
  {
    uint64_t v2 = [SBCaptureButtonCoachingHUDLabelWrapperView alloc];
    uint64_t v3 = -[SBCaptureButtonCoachingHUDLabelWrapperView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v4 = v3;
    double v5 = 0.0;
    if ((unint64_t)(*(void *)(a1 + 1016) - 1) <= 1 && !*(unsigned char *)(a1 + 1000)) {
      double v5 = 1.0;
    }
    [(SBCaptureButtonCoachingHUDLabelWrapperView *)v3 setAlpha:v5];
    id v6 = [(SBCaptureButtonCoachingHUDLabelWrapperView *)v4 layer];
    objc_msgSend(v6, "setAnchorPoint:", 1.0, 0.5);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (SBCaptureButtonCoachingHUDLabel)_makeCoachingLabel
{
  if (a1)
  {
    uint64_t v2 = [SBCaptureButtonCoachingHUDLabel alloc];
    uint64_t v3 = -[SBCaptureButtonCoachingHUDLabel initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(SBCaptureButtonCoachingHUDLabel *)v3 setAccessibilityIdentifier:@"capture-button-coaching-label"];
    id v4 = [MEMORY[0x1E4F42A30] systemFontOfSize:19.0 weight:*MEMORY[0x1E4F43928]];
    [(SBCaptureButtonCoachingHUDLabel *)v3 setFont:v4];

    [(SBCaptureButtonCoachingHUDLabel *)v3 setNumberOfLines:0];
    [(SBCaptureButtonCoachingHUDLabel *)v3 setTextAlignment:2];
    double v5 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(SBCaptureButtonCoachingHUDLabel *)v3 setTextColor:v5];

    id v6 = [(SBCaptureButtonCoachingHUDLabel *)v3 layer];
    id v7 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v6, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [*(id *)(a1 + 1024) coachingLabelShadowOpacity];
    *(float *)&double v8 = v8;
    [v6 setShadowOpacity:v8];
    [*(id *)(a1 + 1024) coachingLabelShadowRadius];
    objc_msgSend(v6, "setShadowRadius:");
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (SBCaptureButtonCoachingHUDGlyphView)_makeGlyphView
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (*(void *)&a1[2].super.super._viewFlags)
    {
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v3 = [v2 URLForResource:*(void *)&v1[2].super.super._viewFlags withExtension:@"ca"];

      uint64_t v1 = [(BSUICAPackageView *)[SBCaptureButtonCoachingHUDGlyphView alloc] initWithURL:v3];
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  [(SBCaptureButtonCoachingHUDViewController *)&v8 viewIsAppearing:a3];
  id v4 = [(SBOrientationTransformWrapperViewController *)self view];
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
    [(SBCaptureButtonCoachingHUDLabel *)self->_coachingLabel setTextAlignment:v7];
  }
  -[SBCaptureButtonCoachingHUDViewController _updateLiveRenderingAssertionIfNeeded]((id *)&self->super.super.super.super.isa);
  [(SBCaptureButtonCoachingHUDViewController *)self transitionToState:0 animated:0 completion:0];
}

- (uint64_t)setCoachingLabelOrientation:(uint64_t)result
{
  if (result && *(void *)(result + 1072) != a2)
  {
    *(void *)(result + 1072) = a2;
    if ((unint64_t)(a2 - 3) < 2) {
      uint64_t v2 = 1;
    }
    else {
      uint64_t v2 = 4;
    }
    return [*(id *)(result + 1128) setTextAlignment:v2];
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
    id v4 = [v3 windowScene];

    if (v4) {
      BOOL v5 = [a1 _appearState] != 0;
    }
    else {
      BOOL v5 = 0;
    }
    id v6 = a1[129];
    if (v6)
    {
      char v7 = [a1[129] isAcquired];
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
      [a1[129] invalidate];
      objc_super v8 = (void *)MEMORY[0x1E4F4F4C0];
      double v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      double v11 = [MEMORY[0x1E4F4F528] requestLiveUpdatingForScene:v4];
      CGFloat v12 = objc_msgSend(MEMORY[0x1E4F4F530], "requestUnrestrictedFramerateForScene:", v4, v11);
      v19[1] = v12;
      CGFloat v13 = [MEMORY[0x1E4F4F540] ignoreWhenBacklightInactivates];
      v19[2] = v13;
      long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
      uint64_t v15 = [v8 acquireWithExplanation:v10 observer:0 attributes:v14];
      id v16 = a1[129];
      a1[129] = (id)v15;

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
      [a1[129] invalidate];
      id v18 = a1[129];
      a1[129] = 0;
    }
    goto LABEL_16;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  [(SBCaptureButtonCoachingHUDViewController *)&v4 viewDidDisappear:a3];
  -[SBCaptureButtonCoachingHUDViewController _updateLiveRenderingAssertionIfNeeded]((id *)&self->super.super.super.super.isa);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  [(SBCaptureButtonCoachingHUDViewController *)&v3 viewDidLayoutSubviews];
  -[SBCaptureButtonCoachingHUDViewController _updateCoachingLabelTextIfNeeded]((uint64_t)self);
  -[SBCaptureButtonCoachingHUDViewController _layoutTempBackdropView]((uint64_t)self);
  -[SBCaptureButtonCoachingHUDViewController _layoutDimmingView]((uint64_t)self);
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingContentView]((uint64_t)self);
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingButtonHighlight]((id *)&self->super.super.super.super.isa);
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingLabelWrapperView](self);
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingLabel]((id *)&self->super.super.super.super.isa);
  -[SBCaptureButtonCoachingHUDViewController _layoutGlyphView]((id *)&self->super.super.super.super.isa);
}

- (uint64_t)_layoutTempBackdropView
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 1080) bounds];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    id v10 = *(void **)(v1 + 1136);
    UIRectGetCenter();
    objc_msgSend(v10, "setCenter:");
    double v11 = *(void **)(v1 + 1136);
    return objc_msgSend(v11, "setBounds:", v3, v5, v7, v9);
  }
  return result;
}

- (uint64_t)_layoutDimmingView
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 1080) bounds];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    id v10 = *(void **)(v1 + 1088);
    UIRectGetCenter();
    objc_msgSend(v10, "setCenter:");
    double v11 = *(void **)(v1 + 1088);
    return objc_msgSend(v11, "setBounds:", v3, v5, v7, v9);
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)SBCaptureButtonCoachingHUDViewController;
  id v7 = a4;
  -[SBCaptureButtonCoachingHUDViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained captureButtonCoachingHUDViewControllerWillRotate:self];

  self->_rotating = 1;
  double v9 = SBFWindowForViewControllerTransition();
  uint64_t v10 = [v9 _toWindowOrientation];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E6AF4AC0;
  v13[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v13 animations:0.2];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_1E6B08270;
  v12[4] = self;
  v12[5] = v10;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v11[3] = &unk_1E6B003A8;
  v11[4] = self;
  v11[5] = v10;
  v11[6] = 0x3FC999999999999ALL;
  [v7 animateAlongsideTransition:v12 completion:v11];
}

uint64_t __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 0.0;
  if ((unint64_t)(*(void *)(v1 + 1016) - 1) <= 1 && !*(unsigned char *)(v1 + 1000)) {
    double v2 = 1.0;
  }
  return [*(id *)(v1 + 1096) setAlpha:v2];
}

void __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setContainerOrientation:*(void *)(a1 + 40)];
}

uint64_t __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1000) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if ((unint64_t)(*(void *)(a1 + 40) - 3) > 1) {
    double v3 = 0;
  }
  else {
    double v3 = *(void **)(v2 + 1064);
  }
  -[SBCaptureButtonCoachingHUDViewController _resetGlyphViewToState:](v2, v3);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (*(void *)(v4 + 1072) != v5)
    {
      *(void *)(v4 + 1072) = v5;
      if ((unint64_t)(v5 - 3) < 2) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = 4;
      }
      [*(id *)(v4 + 1128) setTextAlignment:v6];
      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  -[SBCaptureButtonCoachingHUDViewController _layoutCoachingLabel]((id *)v4);
  id v7 = [*(id *)(a1 + 32) view];
  [v7 setNeedsLayout];

  double v8 = [*(id *)(a1 + 32) view];
  [v8 layoutIfNeeded];

  double v9 = *(double *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v11[3] = &unk_1E6AF4AC0;
  v11[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v11 animations:v9];
}

void __95__SBCaptureButtonCoachingHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 0.0;
  if ((unint64_t)(*(void *)(v2 + 1016) - 1) <= 1 && !*(unsigned char *)(v2 + 1000)) {
    double v3 = 1.0;
  }
  [*(id *)(v2 + 1096) setAlpha:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(v4 + 1104) layer];
  -[SBCaptureButtonCoachingHUDViewController _playTimingOnLayerTree:](v4, v5);
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

- (int64_t)triggerButton
{
  return 9;
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
  if (self->_positionOffset.x != a3.x || self->_positionOffset.y != a3.y)
  {
    self->_positionOffset = a3;
    coachingContentView = self->_coachingContentView;
    CGAffineTransformMakeTranslation(&v5, -a3.x, -a3.y);
    [(UIView *)coachingContentView setTransform:&v5];
  }
}

- (SBUIAnimationPropertyAnimator)_makeViewControllerTransitionAnimationController
{
  if (a1)
  {
    a1 = [[SBUIAnimationPropertyAnimator alloc] initWithPropertyAnimatorGenerator:&__block_literal_global_318];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_resetAndPauseTimingOnLayerTree:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && v3)
  {
    -[SBCaptureButtonCoachingHUDViewController _pauseAndResetLayer:](a1, v3);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    CGAffineTransform v5 = objc_msgSend(v4, "sublayers", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[SBCaptureButtonCoachingHUDViewController _resetAndPauseTimingOnLayerTree:](a1, *(void *)(*((void *)&v10 + 1) + 8 * i));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_pauseAndResetLayer:(uint64_t)a1
{
  if (a1)
  {
    id v4 = a2;
    [v4 convertTime:0 fromLayer:CACurrentMediaTime()];
    double v3 = v2;
    [v4 setSpeed:0.0];
    [v4 setTimeOffset:v3];
    [v4 setTimeOffset:0.0];
  }
}

- (void)_resumeLayer:(uint64_t)a1
{
  if (a1)
  {
    id v5 = a2;
    [v5 timeOffset];
    double v3 = v2;
    LODWORD(v2) = 1.0;
    [v5 setSpeed:v2];
    [v5 setTimeOffset:0.0];
    [v5 setBeginTime:0.0];
    [v5 convertTime:0 fromLayer:CACurrentMediaTime()];
    [v5 setBeginTime:v4 - v3];
  }
}

id __92__SBCaptureButtonCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F43008]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__SBCaptureButtonCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_2;
  v10[3] = &unk_1E6AF4AC0;
  id v4 = v2;
  id v11 = v4;
  id v5 = (void *)[v3 initWithDuration:3 curve:v10 animations:0.001];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__SBCaptureButtonCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_3;
  v8[3] = &unk_1E6AF8788;
  id v9 = v4;
  id v6 = v4;
  [v5 addCompletion:v8];

  return v5;
}

void __92__SBCaptureButtonCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_2(uint64_t a1)
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

uint64_t __92__SBCaptureButtonCoachingHUDViewController__makeViewControllerTransitionAnimationController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (double)_xTranslationTransformForCurrentState
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 1016);
    double v3 = 0.0;
    if (v2 == 2) {
      double v3 = -2.0;
    }
    if (!v2) {
      double v3 = -3.0;
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

- (double)_captureButtonFrame
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = [a1 view];
  double v3 = [v2 window];
  id v4 = [v3 windowScene];

  if (!v4) {
    return *MEMORY[0x1E4F1DB28];
  }
  id v5 = +[SBButtonBezelGeometryInfo buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel];
  id v6 = [a1 view];
  [v5 buttonHWRectForButton:9 inView:v6];
  double v8 = v7;

  return v8;
}

- (void)_coachingLabelWrapperViewSize
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result traitCollection];
    [v2 displayScale];

    double v3 = [v1 view];
    id v4 = [v3 window];
    uint64_t v5 = [v4 interfaceOrientation];

    id v6 = [v1 view];
    [v6 safeAreaInsets];

    double v7 = [v1 view];
    [v7 frame];

    double v8 = [v1 view];
    [v8 frame];
    if ((unint64_t)(v5 - 1) <= 1) {
      -[SBCaptureButtonCoachingHUDViewController _captureButtonFrame](v1);
    }

    BSFloatRoundForScale();
    return (void *)BSFloatRoundForScale();
  }
  return result;
}

- (SBHUDAttachmentDelegate)attachmentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentDelegate);
  return (SBHUDAttachmentDelegate *)WeakRetained;
}

- (void)setAttachmentDelegate:(id)a3
{
}

- (SBCaptureButtonCoachingHUDViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBCaptureButtonCoachingHUDViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (uint64_t)settings
{
  if (result) {
    return *(void *)(result + 1024);
  }
  return result;
}

- (uint64_t)liveRenderingAssertion
{
  if (result) {
    return *(void *)(result + 1032);
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
    return *(void *)(result + 1040);
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

- (uint64_t)coachingText
{
  if (result) {
    return *(void *)(result + 1048);
  }
  return result;
}

- (uint64_t)glyphPackageName
{
  if (result) {
    return *(void *)(result + 1056);
  }
  return result;
}

- (uint64_t)glyphLandscapeState
{
  if (result) {
    return *(void *)(result + 1064);
  }
  return result;
}

- (uint64_t)coachingLabelOrientation
{
  if (result) {
    return *(void *)(result + 1072);
  }
  return result;
}

- (uint64_t)contentView
{
  if (result) {
    return *(void *)(result + 1080);
  }
  return result;
}

- (uint64_t)dimmingView
{
  if (result) {
    return *(void *)(result + 1088);
  }
  return result;
}

- (uint64_t)coachingContentView
{
  if (result) {
    return *(void *)(result + 1096);
  }
  return result;
}

- (uint64_t)glyphView
{
  if (result) {
    return *(void *)(result + 1104);
  }
  return result;
}

- (uint64_t)coachingButtonHighlightView
{
  if (result) {
    return *(void *)(result + 1112);
  }
  return result;
}

- (uint64_t)coachingLabelWrapperView
{
  if (result) {
    return *(void *)(result + 1120);
  }
  return result;
}

- (uint64_t)coachingLabel
{
  if (result) {
    return *(void *)(result + 1128);
  }
  return result;
}

- (uint64_t)tempBackdropLayer
{
  if (result) {
    return *(void *)(result + 1136);
  }
  return result;
}

- (BOOL)isAttached
{
  if (result) {
    return *(unsigned char *)(result + 1002) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempBackdropLayer, 0);
  objc_storeStrong((id *)&self->_coachingLabel, 0);
  objc_storeStrong((id *)&self->_coachingLabelWrapperView, 0);
  objc_storeStrong((id *)&self->_coachingButtonHighlightView, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_coachingContentView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_glyphLandscapeState, 0);
  objc_storeStrong((id *)&self->_glyphPackageName, 0);
  objc_storeStrong((id *)&self->_coachingText, 0);
  objc_storeStrong((id *)&self->_liveRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_attachmentDelegate);
}

@end