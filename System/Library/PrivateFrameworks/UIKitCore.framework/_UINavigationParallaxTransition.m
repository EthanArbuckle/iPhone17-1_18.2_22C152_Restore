@interface _UINavigationParallaxTransition
+ (double)defaultSlidingTransitionDuration;
+ (void)setDefaultSlidingTransitionDuration:(double)a3;
- (BOOL)_shouldReverseLayoutDirection;
- (BOOL)_shouldUseInterruptibleAnimatorWithTraitCollection:(id)a3;
- (BOOL)clipUnderlapWhileTransitioning;
- (BOOL)shouldPreemptWithContext:(id)a3;
- (UIColor)overrideDimmingColor;
- (UIView)clipUnderView;
- (UIView)containerFromView;
- (UIView)containerToView;
- (UIView)fromOverlayView;
- (UIView)toOverlayView;
- (UIViewControllerContextTransitioning)transitionContext;
- (_UINavigationInteractiveTransitionBase)interactionController;
- (_UINavigationParallaxTransition)initWithCurrentOperation:(int64_t)a3;
- (_UIParallaxDimmingView)borderDimmingView;
- (_UIParallaxDimmingView)contentDimmingView;
- (_UIViewControllerAnimatedTransitionHandoffData)preemptionHandoffData;
- (double)gapBetweenViews;
- (double)parallaxOffset;
- (double)transitionDuration:(id)a3;
- (double)transitionGap;
- (id)_animateOrCreatePropertyAnimatorForTransition:(id)a3;
- (id)interruptibleAnimatorForTransition:(id)a3;
- (id)preemptWithContext:(id)a3;
- (id)resizedFromContainerView;
- (id)resizedToContainerView;
- (id)shadowContainerForKeyboardTransition:(id)a3;
- (int64_t)operation;
- (int64_t)transitionStyle;
- (void)_animationWillEnd:(id)a3 didComplete:(BOOL)a4;
- (void)_setShouldReverseLayoutDirection:(BOOL)a3;
- (void)_stopTransitionImmediately;
- (void)animateKeyboard:(id)a3;
- (void)animatePreemptionSnapshotsWithContext:(id)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)completeKeyboard:(id)a3;
- (void)prepareToAnimateKeyboard:(id)a3;
- (void)resizeShadow:(id)a3;
- (void)setBorderDimmingView:(id)a3;
- (void)setClipUnderView:(id)a3;
- (void)setClipUnderlapWhileTransitioning:(BOOL)a3;
- (void)setContainerFromView:(id)a3;
- (void)setContainerToView:(id)a3;
- (void)setContentDimmingView:(id)a3;
- (void)setFromOverlayView:(id)a3;
- (void)setInteractionController:(id)a3;
- (void)setOperation:(int64_t)a3;
- (void)setOverrideDimmingColor:(id)a3;
- (void)setPreemptionHandoffData:(id)a3;
- (void)setToOverlayView:(id)a3;
- (void)setTransitionContext:(id)a3;
- (void)setTransitionGap:(double)a3;
- (void)setTransitionStyle:(int64_t)a3;
- (void)willBeginAfterPreemptionWithContext:(id)a3 data:(id)a4;
@end

@implementation _UINavigationParallaxTransition

- (void)_setShouldReverseLayoutDirection:(BOOL)a3
{
  self->__shouldReverseLayoutDirection = a3;
}

- (_UINavigationParallaxTransition)initWithCurrentOperation:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UINavigationParallaxTransition;
  v4 = [(_UINavigationParallaxTransition *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_operation = a3;
    v4->__shouldReverseLayoutDirection = [(id)UIApp userInterfaceLayoutDirection] == 1;
    v6 = objc_alloc_init(_UIParallaxOverlayView);
    fromOverlayView = v5->_fromOverlayView;
    v5->_fromOverlayView = &v6->super;

    v8 = objc_alloc_init(_UIParallaxOverlayView);
    toOverlayView = v5->_toOverlayView;
    v5->_toOverlayView = &v8->super;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toOverlayView, 0);
  objc_storeStrong((id *)&self->_fromOverlayView, 0);
  objc_storeStrong((id *)&self->_preemptionHandoffData, 0);
  objc_storeStrong((id *)&self->_overrideDimmingColor, 0);
  objc_storeStrong((id *)&self->_clipUnderView, 0);
  objc_storeStrong((id *)&self->_containerToView, 0);
  objc_storeStrong((id *)&self->_containerFromView, 0);
  objc_storeStrong((id *)&self->_contentDimmingView, 0);
  objc_storeStrong((id *)&self->_borderDimmingView, 0);
  objc_destroyWeak((id *)&self->_interactionController);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_keyboardLayoutGuideTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_currentTrackingAnimatorsAnimationsUUID, 0);
  objc_storeStrong((id *)&self->_currentRunningAnimationsUUID, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
}

- (id)resizedToContainerView
{
  v3 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:self];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v5 = [v3 containerView];

  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      objc_super v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Container view is expected to be populated at this point", buf, 2u);
      }
    }
  }
  else if (!v5)
  {
    v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &resizedToContainerView___s_category) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Container view is expected to be populated at this point", v13, 2u);
    }
  }
  v6 = [v3 containerView];
  [v6 frame];

  [(UIView *)self->_containerToView frame];
  double v8 = v7;
  [(UIView *)self->_containerToView frame];
  [(UIView *)self->_toOverlayView setFrame:v8];
  v9 = self->_toOverlayView;

  return v9;
}

- (id)resizedFromContainerView
{
  v3 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:self];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v5 = [v3 containerView];

  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      objc_super v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Container view is expected to be populated at this point", buf, 2u);
      }
    }
  }
  else if (!v5)
  {
    v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &resizedFromContainerView___s_category) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Container view is expected to be populated at this point", v13, 2u);
    }
  }
  v6 = [v3 containerView];
  [v6 frame];

  [(UIView *)self->_containerFromView frame];
  double v8 = v7;
  [(UIView *)self->_containerFromView frame];
  [(UIView *)self->_fromOverlayView setFrame:v8];
  v9 = self->_fromOverlayView;

  return v9;
}

+ (void)setDefaultSlidingTransitionDuration:(double)a3
{
  defaultSlidingTransitionDuration = *(void *)&a3;
}

+ (double)defaultSlidingTransitionDuration
{
  return *(double *)&defaultSlidingTransitionDuration;
}

- (double)transitionDuration:(id)a3
{
  return *(double *)&defaultSlidingTransitionDuration;
}

- (void)animationEnded:(BOOL)a3
{
  preemptionHandoffData = self->_preemptionHandoffData;
  self->_preemptionHandoffData = 0;

  v5 = [(_UINavigationParallaxTransition *)self interactionController];
  [v5 _resetInteractionController];

  [(UIView *)self->_fromOverlayView removeFromSuperview];
  toOverlayView = self->_toOverlayView;
  [(UIView *)toOverlayView removeFromSuperview];
}

- (double)gapBetweenViews
{
  if (self->_transitionStyle) {
    return self->_transitionGap;
  }
  else {
    return 0.0;
  }
}

- (double)parallaxOffset
{
  v3 = [(UIViewControllerContextTransitioning *)self->_transitionContext containerView];
  [v3 bounds];
  double v5 = 0.7;
  if (self->_transitionStyle) {
    double v5 = 0.0;
  }
  double v6 = round(v4 * v5);

  return v6;
}

- (BOOL)_shouldUseInterruptibleAnimatorWithTraitCollection:(id)a3
{
  return +[UIView _interruptibleParallaxTransitionsEnabledWithTraitCollection:]((uint64_t)UIView, a3);
}

- (void)animatePreemptionSnapshotsWithContext:(id)a3
{
  id v4 = a3;
  if (self->_preemptionHandoffData)
  {
    double v5 = [(UIViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:@"UITransitionContextFromViewController"];
    double v6 = [(UIViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:@"UITransitionContextToViewController"];
    double v7 = [(_UIViewControllerAnimatedTransitionHandoffData *)self->_preemptionHandoffData fromViewControllerHandoffData];
    double v8 = [v7 viewController];

    if (v8 == v5 || v8 == v6) {
      goto LABEL_15;
    }
    v10 = [(_UIViewControllerAnimatedTransitionHandoffData *)self->_preemptionHandoffData fromViewControllerHandoffData];
    objc_super v11 = [v10 snapshot];

    if (!v11)
    {
LABEL_14:

LABEL_15:
      goto LABEL_16;
    }
    v12 = [(_UIViewControllerAnimatedTransitionHandoffData *)self->_preemptionHandoffData fromViewControllerHandoffData];
    v13 = [v12 containerView];

    v14 = [v13 contentView];
    [v14 addSubview:v11];

    BOOL v15 = [(_UIViewControllerAnimatedTransitionHandoffData *)self->_preemptionHandoffData isPush];
    int64_t operation = self->_operation;
    v17 = [v4 containerView];
    v18 = v17;
    if (v15)
    {
      if (operation == 1)
      {
        [v17 insertSubview:v13 atIndex:0];
LABEL_13:

        v19 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.35];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __73___UINavigationParallaxTransition_animatePreemptionSnapshotsWithContext___block_invoke;
        v23[3] = &unk_1E52D9F98;
        id v24 = v13;
        v25 = self;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __73___UINavigationParallaxTransition_animatePreemptionSnapshotsWithContext___block_invoke_2;
        v21[3] = &unk_1E52DA9D0;
        id v22 = v24;
        id v20 = v24;
        +[UIView _animateUsingSpringBehavior:v19 tracking:0 animations:v23 completion:v21];

        goto LABEL_14;
      }
    }
    else if (operation == 1)
    {
      [v17 insertSubview:v13 belowSubview:self->_containerToView];
      goto LABEL_13;
    }
    [v17 addSubview:v13];
    goto LABEL_13;
  }
LABEL_16:
}

- (void)animateTransition:(id)a3
{
  v3 = [(_UINavigationParallaxTransition *)self _animateOrCreatePropertyAnimatorForTransition:a3];
  if (v3)
  {
    id v4 = v3;
    [v3 startAnimation];
    v3 = v4;
  }
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  id v4 = a3;
  double v5 = [v4 containerView];
  double v6 = [v5 traitCollection];
  BOOL v7 = [(_UINavigationParallaxTransition *)self _shouldUseInterruptibleAnimatorWithTraitCollection:v6];

  if (v7)
  {
    double v8 = [(_UINavigationParallaxTransition *)self _animateOrCreatePropertyAnimatorForTransition:v4];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)_animateOrCreatePropertyAnimatorForTransition:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  propertyAnimator = self->_propertyAnimator;
  if (propertyAnimator)
  {
    BOOL v7 = propertyAnimator;
    goto LABEL_44;
  }
  id v91 = v4;
  id v8 = v4;
  [(_UINavigationParallaxTransition *)self setTransitionContext:v8];
  v9 = [(UIViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:@"UITransitionContextFromViewController"];
  v10 = [(UIViewControllerContextTransitioning *)self->_transitionContext viewControllerForKey:@"UITransitionContextToViewController"];
  v92 = v8;
  objc_super v11 = [v8 containerView];
  v12 = [v11 traitCollection];
  BOOL v13 = +[UIView _fluidParallaxTransitionsEnabledWithTraitCollection:]((uint64_t)UIView, v12);

  if (v13)
  {
    v14 = [(_UINavigationParallaxTransition *)self preemptionHandoffData];
    BOOL v15 = [v14 handoffDataForViewController:v9];

    v16 = [(_UINavigationParallaxTransition *)self preemptionHandoffData];
    v17 = [v16 handoffDataForViewController:v10];

    v18 = [v15 containerView];
    v19 = v18;
    if (v18) {
      id v20 = v18;
    }
    else {
      id v20 = objc_alloc_init(_UIParallaxTransitionCardView);
    }
    p_super = &v20->super;

    v26 = [v17 containerView];
    v27 = v26;
    if (v26) {
      v28 = v26;
    }
    else {
      v28 = objc_alloc_init(_UIParallaxTransitionCardView);
    }
    v29 = &v28->super;

    containerFromView = self->_containerFromView;
    self->_containerFromView = p_super;
    v31 = p_super;

    containerToView = self->_containerToView;
    self->_containerToView = v29;
    v33 = v29;

    v96 = [(UIView *)v31 contentView];

    v94 = [(UIView *)v33 contentView];
  }
  else
  {
    v21 = objc_alloc_init(UIView);
    id v22 = self->_containerFromView;
    self->_containerFromView = v21;

    v23 = objc_alloc_init(UIView);
    id v24 = self->_containerToView;
    self->_containerToView = v23;

    v96 = self->_containerFromView;
    v94 = self->_containerToView;
    v17 = 0;
    BOOL v15 = 0;
  }
  v34 = [(UIViewControllerContextTransitioning *)self->_transitionContext viewForKey:@"UITransitionContextToView"];
  v35 = v34;
  if (v34)
  {
    id v36 = v34;
  }
  else
  {
    id v36 = [v10 view];
  }
  v37 = v36;

  v38 = [(UIViewControllerContextTransitioning *)self->_transitionContext viewForKey:@"UITransitionContextFromView"];
  v39 = v38;
  if (v38)
  {
    id v40 = v38;
  }
  else
  {
    id v40 = [v9 view];
  }
  v41 = v40;
  v98 = v17;

  v187[0] = 0;
  v187[1] = v187;
  v187[2] = 0x3032000000;
  v187[3] = __Block_byref_object_copy__64;
  v187[4] = __Block_byref_object_dispose__64;
  id v188 = 0;
  v185[0] = 0;
  v185[1] = v185;
  v185[2] = 0x3032000000;
  v185[3] = __Block_byref_object_copy__64;
  v185[4] = __Block_byref_object_dispose__64;
  id v186 = 0;
  v42 = [(UIViewControllerContextTransitioning *)self->_transitionContext containerView];
  v43 = v15;
  v182[0] = 0;
  v182[1] = v182;
  v182[2] = 0x4010000000;
  v182[3] = &unk_186D7DBA7;
  long long v183 = 0u;
  long long v184 = 0u;
  v179[0] = 0;
  v179[1] = v179;
  v179[2] = 0x4010000000;
  v179[3] = &unk_186D7DBA7;
  long long v180 = 0u;
  long long v181 = 0u;
  v176[0] = 0;
  v176[1] = v176;
  v176[2] = 0x4010000000;
  v176[3] = &unk_186D7DBA7;
  long long v177 = 0u;
  long long v178 = 0u;
  v173[0] = 0;
  v173[1] = v173;
  v173[2] = 0x4010000000;
  v173[3] = &unk_186D7DBA7;
  long long v174 = 0u;
  long long v175 = 0u;
  v170[0] = 0;
  v170[1] = v170;
  v170[2] = 0x4010000000;
  v170[3] = &unk_186D7DBA7;
  long long v171 = 0u;
  long long v172 = 0u;
  v167[0] = 0;
  v167[1] = v167;
  v167[2] = 0x4010000000;
  v167[3] = &unk_186D7DBA7;
  long long v168 = 0u;
  long long v169 = 0u;
  v166[0] = 0;
  v166[1] = v166;
  v166[2] = 0x2020000000;
  v166[3] = 0;
  v163[0] = 0;
  v163[1] = v163;
  v163[2] = 0x4010000000;
  v163[3] = &unk_186D7DBA7;
  long long v164 = 0u;
  long long v165 = 0u;
  v160[0] = 0;
  v160[1] = v160;
  v160[2] = 0x4010000000;
  v160[3] = &unk_186D7DBA7;
  long long v161 = 0u;
  long long v162 = 0u;
  v159[0] = 0;
  v159[1] = v159;
  v159[2] = 0x2020000000;
  v159[3] = 0;
  v158[0] = 0;
  v158[1] = v158;
  v158[2] = 0x2020000000;
  v158[3] = 0;
  v157[0] = 0;
  v157[1] = v157;
  v157[2] = 0x2020000000;
  v157[3] = 0;
  v156[0] = 0;
  v156[1] = v156;
  v156[2] = 0x2020000000;
  v156[3] = 0;
  BOOL v44 = [(_UINavigationParallaxTransition *)self _shouldReverseLayoutDirection];
  [(UIView *)self->_containerToView setBackgroundColor:0];
  [(UIView *)self->_containerFromView setBackgroundColor:0];
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke;
  v128[3] = &unk_1E52EA8C0;
  id v45 = v9;
  id v129 = v45;
  id v46 = v10;
  id v130 = v46;
  v131 = self;
  v139 = v163;
  id v47 = v41;
  id v132 = v47;
  v140 = v160;
  id v48 = v37;
  id v133 = v48;
  v141 = v176;
  id v49 = v42;
  id v134 = v49;
  v142 = v179;
  BOOL v154 = v44;
  v143 = v166;
  v144 = v173;
  v145 = v182;
  id v90 = v43;
  id v135 = v90;
  id v99 = v98;
  id v136 = v99;
  v146 = v159;
  v147 = v158;
  v148 = v157;
  v149 = v156;
  v150 = v187;
  v151 = v185;
  v95 = v94;
  v137 = v95;
  char v155 = 0;
  v97 = v96;
  v138 = v97;
  v152 = v170;
  v153 = v167;
  v50 = [v49 _window];
  v51 = [v50 windowScene];
  +[UIView _performBlockDelayingTriggeringResponderEvents:forScene:]((uint64_t)UIView, v128, v51);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_3;
  aBlock[3] = &unk_1E52EA8E8;
  aBlock[4] = self;
  v125 = v179;
  v126 = v173;
  v127 = v167;
  id v52 = v46;
  id v124 = v52;
  v53 = _Block_copy(aBlock);
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_5;
  v113[3] = &unk_1E52EA910;
  id v54 = v92;
  id v114 = v54;
  id v88 = v47;
  id v115 = v88;
  v121 = v163;
  id v55 = v48;
  id v116 = v55;
  v122 = v160;
  id v93 = v45;
  id v117 = v93;
  id v89 = v52;
  id v118 = v89;
  id v56 = v49;
  id v119 = v56;
  v120 = self;
  v57 = _Block_copy(v113);
  if ([v54 isInteractive]) {
    uint64_t v58 = 3;
  }
  else {
    uint64_t v58 = [v54 _completionCurve];
  }
  v59 = [v54 containerView];
  v60 = [v59 traitCollection];
  BOOL v61 = [(_UINavigationParallaxTransition *)self _shouldUseInterruptibleAnimatorWithTraitCollection:v60];

  if (!v61)
  {
    if ([v54 _allowUserInteraction]) {
      uint64_t v67 = (v58 << 16) | 2;
    }
    else {
      uint64_t v67 = v58 << 16;
    }
    if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
    {
      BOOL v68 = +[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled];
      if (!v68)
      {
        id v69 = +[UIViewPropertyAnimator _startTrackingAnimations];
        +[UIViewPropertyAnimator _setTrackedAnimationsUserInteractionEnabled:](UIViewPropertyAnimator, "_setTrackedAnimationsUserInteractionEnabled:", [v54 _allowUserInteraction]);
      }
      v70 = +[UIViewPropertyAnimator _currentTrackedAnimationsUUID];
      currentTrackingAnimatorsAnimationsUUID = self->_currentTrackingAnimatorsAnimationsUUID;
      self->_currentTrackingAnimatorsAnimationsUUID = v70;
    }
    else
    {
      BOOL v68 = +[UIView _isAnimationTracking];
      v72 = +[UIView _startAnimationTracking];
      currentTrackingAnimatorsAnimationsUUID = self->_currentRunningAnimationsUUID;
      self->_currentRunningAnimationsUUID = v72;
    }

    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_13;
    v102[3] = &unk_1E52EA9B0;
    v102[4] = self;
    id v103 = v54;
    uint64_t v104 = v67;
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_15;
    v100[3] = &unk_1E52E45A0;
    v100[4] = self;
    id v101 = v57;
    +[UIView conditionallyAnimate:1 withAnimation:v102 layout:v53 completion:v100];
    if (!v68)
    {
      if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled])
      {
        +[UIViewPropertyAnimator _finishTrackingAnimations];
      }
      else
      {
        +[UIView _finishAnimationTracking];
      }
    }

    v85 = v103;
    goto LABEL_42;
  }
  v62 = [v54 containerView];
  v63 = [v62 traitCollection];
  BOOL v64 = +[UIView _fluidParallaxTransitionsEnabledWithTraitCollection:]((uint64_t)UIView, v63);

  if (v64)
  {
    if ([(_UIViewControllerAnimatedTransitionHandoffData *)self->_preemptionHandoffData isPush]
      && self->_operation == 2)
    {
      uint64_t v65 = [(_UIViewControllerAnimatedTransitionHandoffData *)self->_preemptionHandoffData progressValue];
      uint64_t v66 = 1;
    }
    else
    {
      uint64_t v65 = 0;
      uint64_t v66 = 0;
    }
    [(_UINavigationParallaxTransition *)self transitionDuration:v54];
    v77 = +[UIView _makeHybridPropertyAnimatorWithDuration:progressValue:progressValueReversed:progressValueUpdateReason:springAnimationBehavior:](UIView, "_makeHybridPropertyAnimatorWithDuration:progressValue:progressValueReversed:progressValueUpdateReason:springAnimationBehavior:", v65, v66, 1048616, 0);
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_7;
    v112[3] = &unk_1E52EA960;
    v112[4] = self;
    v112[5] = v182;
    v112[6] = v179;
    v112[7] = v176;
    v112[8] = v173;
    v112[9] = v170;
    v112[10] = v167;
    v112[11] = v159;
    v112[12] = v158;
    v112[13] = v157;
    v112[14] = v156;
    [v77 addInProcessProgressAnimations:v112];
    v87 = (void *)v65;
    v78 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
    v79 = +[UIColor clearColor];
    [(UIView *)v78 setBackgroundColor:v79];

    v80 = [v54 containerView];
    [v80 insertSubview:v78 atIndex:0];

    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_9;
    v110[3] = &unk_1E52D9F70;
    v81 = v78;
    v111 = v81;
    [v77 addAnimations:v110];
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_11;
    v107[3] = &unk_1E52EA988;
    v82 = v81;
    v108 = v82;
    id v109 = v57;
    [v77 addCompletion:v107];
    v83 = self->_propertyAnimator;
    self->_propertyAnimator = (UIViewImplicitlyAnimating *)v77;
    id v84 = v77;

    v85 = v87;
LABEL_42:

    goto LABEL_43;
  }
  v73 = [UIViewPropertyAnimator alloc];
  [(_UINavigationParallaxTransition *)self transitionDuration:v54];
  v74 = -[UIViewPropertyAnimator initWithDuration:curve:animations:](v73, "initWithDuration:curve:animations:", v58, 0);
  -[UIViewPropertyAnimator setUserInteractionEnabled:](v74, "setUserInteractionEnabled:", [v54 _allowUserInteraction]);
  [(UIViewPropertyAnimator *)v74 setScrubsLinearly:0];
  [(UIViewPropertyAnimator *)v74 _setShouldLayoutSubviews:0];
  [(UIViewPropertyAnimator *)v74 _setShouldBeginFromCurrentState:0];
  [(UIViewPropertyAnimator *)v74 addAnimations:v53];
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_12;
  v105[3] = &unk_1E52E5E20;
  id v106 = v57;
  [(UIViewPropertyAnimator *)v74 addCompletion:v105];
  v75 = self->_propertyAnimator;
  self->_propertyAnimator = (UIViewImplicitlyAnimating *)v74;
  v76 = v74;

LABEL_43:
  -[_UINavigationParallaxTransition animatePreemptionSnapshotsWithContext:](self, "animatePreemptionSnapshotsWithContext:", v54, v87);
  BOOL v7 = self->_propertyAnimator;

  _Block_object_dispose(v156, 8);
  _Block_object_dispose(v157, 8);
  _Block_object_dispose(v158, 8);
  _Block_object_dispose(v159, 8);
  _Block_object_dispose(v160, 8);
  _Block_object_dispose(v163, 8);
  _Block_object_dispose(v166, 8);
  _Block_object_dispose(v167, 8);
  _Block_object_dispose(v170, 8);
  _Block_object_dispose(v173, 8);
  _Block_object_dispose(v176, 8);
  _Block_object_dispose(v179, 8);
  _Block_object_dispose(v182, 8);

  _Block_object_dispose(v185, 8);
  _Block_object_dispose(v187, 8);

  double v5 = v91;
LABEL_44:

  return v7;
}

- (void)_animationWillEnd:(id)a3 didComplete:(BOOL)a4
{
  propertyAnimator = self->_propertyAnimator;
  self->_propertyAnimator = 0;
}

- (id)shadowContainerForKeyboardTransition:(id)a3
{
  if (self->_operation == 2) {
    [a3 toKeyboard];
  }
  else {
  v3 = [a3 fromKeyboard];
  }
  id v4 = [v3 superview];

  return v4;
}

- (void)resizeShadow:(id)a3
{
  id v13 = a3;
  [v13 frame];
  double v5 = v4;
  double v6 = [v13 superview];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;

  BOOL v11 = [(_UINavigationParallaxTransition *)self _shouldReverseLayoutDirection];
  double v12 = v8 - v5;
  if (v11) {
    double v12 = 0.0;
  }
  objc_msgSend(v13, "setFrame:", v12, 0.0, v5, v10);
}

- (void)prepareToAnimateKeyboard:(id)a3
{
  id v83 = a3;
  [v83 fromKeyboardFrame];
  double v81 = v4;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v83 toKeyboardFrame];
  double v12 = v11;
  double v80 = v13;
  double v15 = v14;
  double v82 = v16;
  BOOL v17 = [(_UINavigationParallaxTransition *)self _shouldReverseLayoutDirection];
  BOOL v18 = v17;
  double v19 = -v15;
  if (v17) {
    double v20 = v15;
  }
  else {
    double v20 = -v15;
  }
  if (!v17) {
    double v19 = v15;
  }
  if (self->_operation == 2) {
    double v19 = v20;
  }
  double v21 = v12 + v19;
  id v22 = [UIView alloc];
  v23 = [v83 fromKeyboard];
  [v23 frame];
  id v24 = -[UIView initWithFrame:](v22, "initWithFrame:");

  v25 = [v83 fromKeyboard];
  v26 = [v25 superview];
  [v26 addSubview:v24];

  v27 = [v83 fromKeyboard];
  [(UIView *)v24 addSubview:v27];

  v28 = [v83 fromKeyboard];
  objc_msgSend(v28, "setFrameOrigin:", 0.0, 0.0);

  v29 = [UIView alloc];
  v30 = [v83 toKeyboard];
  [v30 frame];
  v31 = -[UIView initWithFrame:](v29, "initWithFrame:");

  v32 = [v83 toKeyboard];
  v33 = [v32 superview];
  [v33 addSubview:v31];

  v34 = [v83 toKeyboard];
  [(UIView *)v31 addSubview:v34];

  v35 = [v83 toKeyboard];
  objc_msgSend(v35, "setFrameOrigin:", 0.0, 0.0);

  [(UIView *)v31 bounds];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v78 = v42;
  int64_t operation = self->_operation;
  BOOL v44 = [v83 fromKeyboard];
  id v45 = v44;
  double v79 = v39;
  if (operation == 2)
  {
    if (!v44
      || ([v83 toKeyboard],
          id v46 = objc_claimAutoreleasedReturnValue(),
          v46,
          v45,
          v46))
    {
      id v47 = [v83 toKeyboard];

      if (v47)
      {
        double v77 = 1.0;
        [(_UINavigationParallaxTransition *)self parallaxOffset];
        double v48 = v6;
        double v50 = v49;
        [(_UINavigationParallaxTransition *)self gapBetweenViews];
        double v52 = v50 - v51;
        double v6 = v48;
        double v53 = -0.0;
        if (v18) {
          double v54 = v52;
        }
        else {
          double v54 = -0.0;
        }
        double v37 = v37 + v54;
        if (!v18) {
          double v53 = v52;
        }
        double v21 = v21 + v53;
        if (v18 && v52 > 0.0) {
          double v55 = v52;
        }
        else {
          double v55 = 0.0;
        }
        double v41 = v41 - v55;
        double v15 = v15 - fmax(v52, 0.0);
        [(UIView *)v31 setClipsToBounds:1];
        goto LABEL_28;
      }
    }
    double v56 = 1.0;
LABEL_27:
    double v77 = v56;
LABEL_28:
    uint64_t v58 = v83;
    double v59 = v80;
    goto LABEL_29;
  }

  if (v45)
  {
    [(UIView *)v24 setClipsToBounds:1];
LABEL_26:
    double v56 = 0.0;
    goto LABEL_27;
  }
  v57 = [v83 fromKeyboard];
  if (v57)
  {

    goto LABEL_26;
  }
  BOOL v68 = [v83 toKeyboard];

  double v59 = v80;
  if (v68)
  {
    double v77 = 0.0;
    [(_UINavigationParallaxTransition *)self gapBetweenViews];
    double v70 = v37 + v69;
    double v71 = v21 + v69;
    if (v18) {
      double v37 = v70;
    }
    else {
      double v21 = v71;
    }
  }
  else
  {
    double v77 = 0.0;
  }
  uint64_t v58 = v83;
LABEL_29:
  v60 = [v58 mainContext];
  BOOL v61 = [v60 containerView];
  v62 = [v61 window];

  if (![v62 isTrackingKeyboard]) {
    goto LABEL_44;
  }
  uint64_t v63 = [v83 fromKeyboard];
  if (v63)
  {
    BOOL v64 = (void *)v63;
    uint64_t v65 = [v83 toKeyboard];

    if (!v65)
    {
      int64_t v66 = self->_operation;
      if (v66 == 1)
      {
        uint64_t v67 = 4;
LABEL_42:
        [v62 moveKeyboardLayoutGuideOverEdge:v67 layoutViews:1];
        goto LABEL_43;
      }
      if (v66 == 2)
      {
        if (v18) {
          uint64_t v67 = 2;
        }
        else {
          uint64_t v67 = 8;
        }
        goto LABEL_42;
      }
    }
  }
LABEL_43:
  v72 = [v62 _obtainKeyboardLayoutGuideTransitionAssertionForReason:@"UINavigationController parallax transition"];
  keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
  self->_keyboardLayoutGuideTransitionAssertion = v72;

LABEL_44:
  -[UIView setFrame:](v24, "setFrame:", v81, v6, v8, v10);
  -[UIView setFrame:](v31, "setFrame:", v21, v59, v15, v82);
  if (v18) {
    -[UIView setBounds:](v31, "setBounds:", v37, v79, v41, v78);
  }
  if (!self->_transitionStyle)
  {
    v74 = [(_UINavigationParallaxTransition *)self shadowContainerForKeyboardTransition:v83];
    if (v74)
    {
      v75 = [[_UIVerticalEdgeShadowView alloc] initWithWidth:2 edge:9.0];
      [(UIView *)v75 setOpaque:0];
      [(UIView *)v75 setAlpha:v77];
      v76 = [v74 subviews];
      objc_msgSend(v74, "insertSubview:atIndex:", v75, objc_msgSend(v76, "count"));

      [(_UINavigationParallaxTransition *)self resizeShadow:v75];
    }
  }
}

- (void)animateKeyboard:(id)a3
{
  id v85 = a3;
  double v4 = -[_UINavigationParallaxTransition shadowContainerForKeyboardTransition:](self, "shadowContainerForKeyboardTransition:");
  double v5 = [v4 subviews];
  double v6 = [v5 lastObject];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    double v6 = 0;
  }
  BOOL v7 = [(_UINavigationParallaxTransition *)self _shouldReverseLayoutDirection];
  [v85 fromKeyboardFrame];
  double v81 = v11;
  double v82 = v10;
  double v12 = v9;
  double v13 = -v9;
  if (v7)
  {
    double v9 = -v9;
    double v13 = v12;
  }
  if (self->_operation == 2) {
    double v13 = v9;
  }
  double v14 = v8 + v13;
  double v15 = [v85 fromKeyboard];
  double v16 = [v15 superview];
  [v16 bounds];
  double v83 = v18;
  double v84 = v17;
  double v78 = v20;
  double v79 = v19;

  [v85 toKeyboardFrame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [v85 toKeyboard];
  v30 = [v29 superview];
  [v30 bounds];
  double v80 = v31;
  double v76 = v33;
  double v77 = v32;
  double v35 = v34;

  if (self->_operation == 2)
  {
    [v6 setAlpha:0.0];
    uint64_t v36 = [v85 fromKeyboard];
    if (v36
      && (double v37 = (void *)v36,
          [v85 toKeyboard],
          double v38 = objc_claimAutoreleasedReturnValue(),
          v38,
          v37,
          !v38))
    {
      [(_UINavigationParallaxTransition *)self gapBetweenViews];
      double v63 = v84;
      double v65 = v84 + v64;
      double v66 = v14 + v64;
      if (v7) {
        double v63 = v65;
      }
      double v84 = v63;
      if (!v7) {
        double v14 = v66;
      }
    }
    else
    {
      double v39 = [v85 toKeyboard];

      if (v39 && v7)
      {
        [(_UINavigationParallaxTransition *)self parallaxOffset];
        double v75 = v22;
        double v40 = v24;
        double v41 = v26;
        double v42 = v28;
        double v44 = v43;
        [(_UINavigationParallaxTransition *)self gapBetweenViews];
        double v46 = v44 - v45;
        double v28 = v42;
        double v26 = v41;
        double v24 = v40;
        double v22 = v75;
        double v35 = v35 + v46;
        double v80 = 0.0;
      }
    }
  }
  else
  {
    [v6 setAlpha:1.0];
    id v47 = [v85 fromKeyboard];

    if (v47)
    {
      [(_UINavigationParallaxTransition *)self parallaxOffset];
      double v48 = v22;
      double v49 = v24;
      double v50 = v26;
      double v51 = v28;
      double v53 = v52;
      [(_UINavigationParallaxTransition *)self gapBetweenViews];
      double v55 = v53 - v54;
      double v28 = v51;
      double v26 = v50;
      double v24 = v49;
      double v22 = v48;
      double v56 = -0.0;
      if (v7) {
        double v57 = v55;
      }
      else {
        double v57 = -0.0;
      }
      double v58 = v84 + v57;
      if (!v7) {
        double v56 = v55;
      }
      double v14 = v14 + v56;
      double v59 = 0.0;
      if (v7) {
        double v59 = v55;
      }
      double v60 = v83;
      double v61 = v83 - v59;
      if (v55 > 0.0) {
        double v60 = v61;
      }
      double v83 = v60;
      double v84 = v58;
      if (v55 > 0.0) {
        double v12 = v12 - v55;
      }
    }
    else
    {
      v62 = [v85 fromKeyboard];
      if (!v62)
      {
        [v85 toKeyboard];
      }
    }
  }
  uint64_t v67 = [v85 fromKeyboard];
  BOOL v68 = [v67 superview];
  objc_msgSend(v68, "setFrame:", v14, v82, v12, v81);

  if (v7)
  {
    double v69 = [v85 fromKeyboard];
    double v70 = [v69 superview];
    objc_msgSend(v70, "setBounds:", v84, v79, v83, v78);

    double v71 = [v85 toKeyboard];
    v72 = [v71 superview];
    objc_msgSend(v72, "setFrame:", v22, v24, v26, v28);

    v73 = [v85 toKeyboard];
    v74 = [v73 superview];
    objc_msgSend(v74, "setBounds:", v80, v77, v35, v76);
  }
  else
  {
    v73 = [v85 toKeyboard];
    v74 = [v73 superview];
    objc_msgSend(v74, "setFrame:", v22, v24, v26, v28);
  }

  [(_UINavigationParallaxTransition *)self resizeShadow:v6];
}

- (void)completeKeyboard:(id)a3
{
  id v10 = a3;
  keyboardLayoutGuideTransitionAssertion = self->_keyboardLayoutGuideTransitionAssertion;
  if (keyboardLayoutGuideTransitionAssertion)
  {
    [(_UIInvalidatable *)keyboardLayoutGuideTransitionAssertion _invalidate];
    double v5 = self->_keyboardLayoutGuideTransitionAssertion;
    self->_keyboardLayoutGuideTransitionAssertion = 0;
  }
  double v6 = [v10 fromKeyboard];
  BOOL v7 = [v6 superview];
  [v7 removeFromSuperview];

  double v8 = [v10 toKeyboard];
  double v9 = [v8 superview];
  [v9 removeFromSuperview];
}

- (void)_stopTransitionImmediately
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  propertyAnimator = self->_propertyAnimator;
  if (propertyAnimator)
  {
    [(UIViewImplicitlyAnimating *)propertyAnimator stopAnimation:0];
    double v4 = self->_propertyAnimator;
    [(UIViewImplicitlyAnimating *)v4 finishAnimationAtPosition:0];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    double v6 = [(_UINavigationParallaxTransition *)self interactionController];
    BOOL v7 = v6;
    if (v6)
    {
      double v8 = [v6 _parent];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v9 = [v8 navigationBar];
        id v10 = [v9 _animationIds];

        if (v10) {
          [v5 addObjectsFromArray:v10];
        }
      }
      [v7 cancelInteractiveTransition];
    }
    if (self->_currentTrackingAnimatorsAnimationsUUID) {
      objc_msgSend(v5, "addObject:");
    }
    double v19 = v7;
    if (self->_currentRunningAnimationsUUID) {
      [v5 addObject:v7];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if (+[UIViewPropertyAnimator _containsAnimatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_containsAnimatorForTrackedAnimationsUUID:", v16, v19))
          {
            double v17 = +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:v16];
            [v17 stopAnimation:0];
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __61___UINavigationParallaxTransition__stopTransitionImmediately__block_invoke;
            v20[3] = &unk_1E52D9F70;
            id v21 = v17;
            id v18 = v17;
            +[UIViewController _performWithoutDeferringTransitions:v20];
          }
          else
          {
            +[UIView _stopAnimationWithUUID:v16];
            +[UIView _finalizeStoppedAnimationWithUUID:v16 reverseAnimation:0 state:0 performCompletionsImmediately:1];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_int64_t operation = a3;
}

- (UIViewControllerContextTransitioning)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
}

- (_UINavigationInteractiveTransitionBase)interactionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionController);
  return (_UINavigationInteractiveTransitionBase *)WeakRetained;
}

- (void)setInteractionController:(id)a3
{
}

- (_UIParallaxDimmingView)borderDimmingView
{
  return self->_borderDimmingView;
}

- (void)setBorderDimmingView:(id)a3
{
}

- (_UIParallaxDimmingView)contentDimmingView
{
  return self->_contentDimmingView;
}

- (void)setContentDimmingView:(id)a3
{
}

- (UIView)containerFromView
{
  return self->_containerFromView;
}

- (void)setContainerFromView:(id)a3
{
}

- (UIView)containerToView
{
  return self->_containerToView;
}

- (void)setContainerToView:(id)a3
{
}

- (UIView)clipUnderView
{
  return self->_clipUnderView;
}

- (void)setClipUnderView:(id)a3
{
}

- (BOOL)clipUnderlapWhileTransitioning
{
  return self->_clipUnderlapWhileTransitioning;
}

- (void)setClipUnderlapWhileTransitioning:(BOOL)a3
{
  self->_clipUnderlapWhileTransitioning = a3;
}

- (int64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (void)setTransitionStyle:(int64_t)a3
{
  self->_transitionStyle = a3;
}

- (double)transitionGap
{
  return self->_transitionGap;
}

- (void)setTransitionGap:(double)a3
{
  self->_transitionGap = a3;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return self->__shouldReverseLayoutDirection;
}

- (UIColor)overrideDimmingColor
{
  return self->_overrideDimmingColor;
}

- (void)setOverrideDimmingColor:(id)a3
{
}

- (_UIViewControllerAnimatedTransitionHandoffData)preemptionHandoffData
{
  return self->_preemptionHandoffData;
}

- (void)setPreemptionHandoffData:(id)a3
{
}

- (UIView)fromOverlayView
{
  return self->_fromOverlayView;
}

- (void)setFromOverlayView:(id)a3
{
}

- (UIView)toOverlayView
{
  return self->_toOverlayView;
}

- (void)setToOverlayView:(id)a3
{
}

- (BOOL)shouldPreemptWithContext:(id)a3
{
  v3 = [a3 containerView];
  double v4 = [v3 traitCollection];
  BOOL v5 = +[UIView _fluidParallaxTransitionsEnabledWithTraitCollection:]((uint64_t)UIView, v4);

  return v5;
}

- (id)preemptWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 viewControllerForKey:@"UITransitionContextFromViewController"];
  double v6 = [v4 viewControllerForKey:@"UITransitionContextToViewController"];

  int64_t operation = self->_operation;
  [(_UIParallaxDimmingView *)self->_contentDimmingView presentationDimmingAmount];
  if (operation == 2) {
    double v9 = v8;
  }
  else {
    double v9 = 0.0;
  }
  if (operation == 2) {
    double v10 = 0.0;
  }
  else {
    double v10 = v8;
  }
  id v11 = [_UIViewControllerAnimatedTransitionViewControllerHandoffData alloc];
  containerFromView = self->_containerFromView;
  uint64_t v13 = [(UIView *)containerFromView snapshotViewAfterScreenUpdates:0];
  uint64_t v14 = [(UIView *)self->_containerFromView layer];
  double v15 = [v14 presentationLayer];
  [v15 frame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(UIView *)self->_containerFromView frame];
  double v28 = v27;
  double v29 = 1.0;
  if (self->_operation != 2) {
    double v29 = 0.0;
  }
  v30 = -[_UIViewControllerAnimatedTransitionViewControllerHandoffData initWithViewController:containerView:snapshot:frame:targetFrame:dimmingAmount:targetDimmingAmount:](v11, "initWithViewController:containerView:snapshot:frame:targetFrame:dimmingAmount:targetDimmingAmount:", v5, containerFromView, v13, v17, v19, v21, v23, v28, v24, v25, v26, *(void *)&v10, *(void *)&v29);

  double v31 = [_UIViewControllerAnimatedTransitionViewControllerHandoffData alloc];
  containerToView = self->_containerToView;
  double v33 = [(UIView *)containerToView layer];
  double v34 = [v33 presentationLayer];
  [v34 frame];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  [(UIView *)self->_containerToView frame];
  id v47 = -[_UIViewControllerAnimatedTransitionViewControllerHandoffData initWithViewController:containerView:snapshot:frame:targetFrame:dimmingAmount:targetDimmingAmount:](v31, "initWithViewController:containerView:snapshot:frame:targetFrame:dimmingAmount:targetDimmingAmount:", v6, containerToView, 0, v36, v38, v40, v42, v43, v44, v45, v46, *(void *)&v9, 0);

  double v48 = 0;
  if (objc_opt_respondsToSelector())
  {
    double v48 = [(UIViewImplicitlyAnimating *)self->_propertyAnimator progressValue];
  }
  [(_UINavigationParallaxTransition *)self _stopTransitionImmediately];
  double v49 = [[_UIViewControllerAnimatedTransitionHandoffData alloc] initWithFromViewControllerHandoffData:v30 toViewControllerHandoffData:v47 progressValue:v48 isPush:self->_operation == 1];

  return v49;
}

- (void)willBeginAfterPreemptionWithContext:(id)a3 data:(id)a4
{
}

@end