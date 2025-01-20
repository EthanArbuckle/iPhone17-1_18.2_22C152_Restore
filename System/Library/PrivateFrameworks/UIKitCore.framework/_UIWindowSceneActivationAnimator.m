@interface _UIWindowSceneActivationAnimator
- (BOOL)animateWithSourcePreview:(id)a3 velocity:(double)a4;
- (BOOL)deparented;
- (BOOL)isDeallocating;
- (CAMatchMoveAnimation)incomingSceneAnchorAnimation;
- (CGRect)expectedFrame;
- (NSMutableArray)alongsideAnimations;
- (NSMutableArray)alongsideCompletions;
- (UIRectCornerRadii)expectedCornerRadii;
- (UIView)deparentingPortalAlphaSourceView;
- (UIView)deparentingWrapper;
- (UIView)morphContainerView;
- (UIWindowSceneActivationConfiguration)configuration;
- (_UIPortalView)incomingScenePortalView;
- (_UIWindowSceneActivationAnimator)initWithConfiguration:(id)a3;
- (double)_startingShadowIntensity;
- (id)_previewForIncomingScenePortal;
- (id)_sourceViewContainer;
- (int64_t)_preferredCollapsedShadowStyle;
- (int64_t)state;
- (void)_cleanUp;
- (void)_performAllAlongsideAnimations:(id)a3;
- (void)_performAllAlongsideCompletions;
- (void)_sendBSAction:(id)a3;
- (void)_sendCompletionActionCallingAlongsideCompletions:(BOOL)a3;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)deparent;
- (void)prewarmWithCompletion:(id)a3;
- (void)reparent;
- (void)setConfiguration:(id)a3;
- (void)setDeparented:(BOOL)a3;
- (void)setDeparentingPortalAlphaSourceView:(id)a3;
- (void)setDeparentingWrapper:(id)a3;
- (void)setExpectedCornerRadii:(UIRectCornerRadii)a3;
- (void)setExpectedFrame:(CGRect)a3;
- (void)setIncomingSceneAnchorAnimation:(id)a3;
- (void)setIncomingScenePortalView:(id)a3;
- (void)setIsDeallocating:(BOOL)a3;
- (void)setMorphContainerView:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _UIWindowSceneActivationAnimator

- (_UIWindowSceneActivationAnimator)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowSceneActivationAnimator;
  v5 = [(_UIWindowSceneActivationAnimator *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIWindowSceneActivationAnimator *)v5 setConfiguration:v4];
  }

  return v6;
}

- (void)dealloc
{
  [(_UIWindowSceneActivationAnimator *)self setIsDeallocating:1];
  [(_UIWindowSceneActivationAnimator *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSceneActivationAnimator;
  [(_UIWindowSceneActivationAnimator *)&v3 dealloc];
}

- (void)prewarmWithCompletion:(id)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49 = [(_UIWindowSceneActivationAnimator *)self _sourceViewContainer];
  v5 = [UIView alloc];
  [v49 bounds];
  v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
  [(UIView *)v6 setAutoresizesSubviews:1];
  v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2C0]];
  v54[0] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  v9 = [(UIView *)v6 layer];
  [v9 setFilters:v8];

  v10 = [(UIView *)v6 layer];
  [v10 setValue:&unk_1ED3F20D8 forKeyPath:@"filters.opacityPair.inputAmount"];

  [(_UIWindowSceneActivationAnimator *)self setDeparentingWrapper:v6];
  v11 = [UIView alloc];
  v12 = [(_UIWindowSceneActivationAnimator *)self deparentingWrapper];
  [v12 bounds];
  v13 = -[UIView initWithFrame:](v11, "initWithFrame:");

  [(UIView *)v13 setAutoresizingMask:18];
  v14 = [(_UIWindowSceneActivationAnimator *)self deparentingWrapper];
  [v14 addSubview:v13];

  [(_UIWindowSceneActivationAnimator *)self setMorphContainerView:v13];
  v15 = [(_UIWindowSceneActivationAnimator *)self deparentingWrapper];
  [v49 addSubview:v15];

  v16 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  [(UIView *)v16 setUserInteractionEnabled:0];
  [(UIView *)v16 setAlpha:0.0];
  [v49 addSubview:v16];
  [(_UIWindowSceneActivationAnimator *)self setDeparentingPortalAlphaSourceView:v16];

  v17 = -[_UIPortalView initWithFrame:]([_UIPortalView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  v18 = +[UIColor systemBackgroundColor];
  [(UIView *)v17 setBackgroundColor:v18];

  [(_UIPortalView *)v17 setName:@"_UIWindowSceneActivation.scene"];
  [(_UIPortalView *)v17 setAllowsHitTesting:1];
  [(_UIPortalView *)v17 setHidesSourceView:1];
  [(_UIWindowSceneActivationAnimator *)self setIncomingScenePortalView:v17];

  v19 = [(_UIWindowSceneActivationAnimator *)self configuration];
  v20 = [v19 options];

  unsigned int v45 = [v20 _effectivelyWantsProminence];
  unsigned int v48 = [v20 _effectivelyWantsFullscreen];
  v21 = [v20 requestingScene];
  v47 = [v21 session];

  if (v47)
  {
    v46 = [v47 persistentIdentifier];
  }
  else
  {
    v46 = 0;
  }
  v22 = [v49 _window];
  if (v48) {
    double v23 = _UISheetSize(v22, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  else {
    double v23 = _UISheetSize(v22, 1, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  double v25 = v23;
  double v26 = v24;

  v27 = [v49 _window];
  v28 = [v27 screen];

  [v28 bounds];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  v37 = [v28 coordinateSpace];
  v38 = [v28 fixedCoordinateSpace];
  objc_msgSend(v37, "convertRect:toCoordinateSpace:", v38, round(v30 + v34 * 0.5 - v25 * 0.5), round(v32 + v36 * 0.5 - v26 * 0.5), v25, v26);
  -[_UIWindowSceneActivationAnimator setExpectedFrame:](self, "setExpectedFrame:");

  -[_UIWindowSceneActivationAnimator setExpectedCornerRadii:](self, "setExpectedCornerRadii:", 10.0, 10.0, 10.0, 10.0);
  v39 = [v20 _interactionIdentifier];
  if (!v39)
  {
    v40 = [MEMORY[0x1E4F29128] UUID];
    v39 = [v40 UUIDString];

    [v20 _setInteractionIdentifier:v39];
  }
  objc_initWeak(&location, self);
  v41 = [(_UIWindowSceneActivationAnimator *)self morphContainerView];
  v42 = [(_UIWindowSceneActivationAnimator *)self deparentingPortalAlphaSourceView];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __58___UIWindowSceneActivationAnimator_prewarmWithCompletion___block_invoke;
  v50[3] = &unk_1E52FD290;
  objc_copyWeak(&v52, &location);
  id v43 = v4;
  id v51 = v43;
  v44 = +[_UIWindowSceneActivationPrewarmAction actionWithMorphContainer:v41 alphaSource:v42 sourceIdentifier:v46 interactionIdentifier:v39 requestCenterSlot:v45 requestFullscreen:v48 responseHandler:v50];

  [(_UIWindowSceneActivationAnimator *)self _sendBSAction:v44];
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

- (BOOL)animateWithSourcePreview:(id)a3 velocity:(double)a4
{
  id v6 = a3;
  int64_t v7 = [(_UIWindowSceneActivationAnimator *)self state];
  if (v7 == 2)
  {
    [(_UIWindowSceneActivationAnimator *)self cancel];
  }
  else
  {
    objc_super v8 = [v6 target];
    v9 = [v8 container];
    v10 = [(_UIWindowSceneActivationAnimator *)self morphContainerView];
    v11 = [v10 layer];
    v12 = [(_UIWindowSceneActivationAnimator *)self incomingSceneAnchorAnimation];
    [v11 addAnimation:v12 forKey:@"_UIWindowSceneActivationAnimator.incomingScene.matchPosition"];

    v13 = [v10 window];
    [(_UIWindowSceneActivationAnimator *)self expectedFrame];
    objc_msgSend(v13, "_convertRectFromSceneReferenceSpace:");
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    v22 = [v10 superview];
    uint64_t v23 = [v10 window];
    objc_msgSend(v22, "convertRect:fromView:", v23, v15, v17, v19, v21);
    objc_msgSend(v10, "setFrame:");

    double v24 = [(_UIWindowSceneActivationAnimator *)self deparentingWrapper];
    LOBYTE(v23) = [v9 isDescendantOfView:v24];

    if ((v23 & 1) == 0)
    {
      double v25 = [v6 view];
      double v26 = [v25 superview];

      v27 = [(_UIWindowSceneActivationAnimator *)self deparentingWrapper];
      if (v26 == v9)
      {
        v28 = [v6 view];
        [v9 insertSubview:v27 aboveSubview:v28];
      }
      else
      {
        [v9 addSubview:v27];
      }
    }
    double v29 = objc_opt_new();
    [v29 setAllowsUserInteractionInExpandedPreview:1];
    [(_UIWindowSceneActivationAnimator *)self expectedCornerRadii];
    objc_msgSend(v29, "setOverrideExpandedCornerRadius:");
    [(_UIWindowSceneActivationAnimator *)self _startingShadowIntensity];
    objc_msgSend(v29, "setCollapsedShadowIntensity:");
    [v29 setAllowsElasticMorph:1];
    [v29 setPreferredMorphingAxis:1];
    [v29 setHidesCollapsedSourceView:0];
    [v29 setCollapsedPreview:v6];
    double v30 = [(_UIWindowSceneActivationAnimator *)self _previewForIncomingScenePortal];
    [v29 setExpandedPreview:v30];

    objc_msgSend(v29, "setCollapsedShadowStyle:", -[_UIWindowSceneActivationAnimator _preferredCollapsedShadowStyle](self, "_preferredCollapsedShadowStyle"));
    [v29 setExpandedShadowStyle:3];
    [v10 addSubview:v29];
    [v8 center];
    double v32 = v31;
    double v34 = v33;
    [v6 size];
    double v36 = v35;
    double v38 = v37;
    v39 = [v29 superview];
    objc_msgSend(v9, "convertRect:toView:", v39, 0.0, 0.0, v36, v38);
    objc_msgSend(v29, "setFrame:");

    v40 = [v29 superview];
    objc_msgSend(v9, "convertPoint:toView:", v40, v32, v34);
    double v42 = v41;
    double v44 = v43;

    if (-[UIView _subviewsNeedAxisFlipping](v9))
    {
      unsigned int v45 = [v29 superview];
      [v45 bounds];
      double v42 = CGRectGetWidth(v89) - v42;
    }
    objc_msgSend(v29, "setCenter:", v42, v44);
    int64_t v69 = v7;
    if (v8)
    {
      [v8 transform];
    }
    else
    {
      long long v87 = 0u;
      long long v88 = 0u;
      long long v86 = 0u;
    }
    v85[0] = v86;
    v85[1] = v87;
    v85[2] = v88;
    [v29 setTransform:v85];
    [v29 setNeedsLayout];
    [v29 layoutIfNeeded];
    [v10 bounds];
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v54 = v46 + v50 * 0.5;
    double v55 = v48 + v52 * 0.5;
    if (fabs(a4) >= 2.22044605e-16)
    {
      v56 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
      [v56 pinchEndPlatterVelocityMultiplier];
      double v58 = v57;

      [v29 center];
      v84[0] = v58 * (v54 - v59);
      v84[1] = v58 * (v55 - v60);
      v61 = [MEMORY[0x1E4F29238] valueWithBytes:v84 objCType:"{CGPoint=dd}"];
      [v29 _setVelocity:v61 forKey:@"position"];

      v83[0] = 0;
      v83[1] = 0;
      *(double *)&v83[2] = v58 * a4;
      *(double *)&v83[3] = v58 * a4;
      v62 = [MEMORY[0x1E4F29238] valueWithBytes:v83 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      [v29 _setVelocity:v62 forKey:@"bounds"];
    }
    v63 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
    v64 = [v63 morph];
    v65 = [v64 springAnimationBehavior];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __70___UIWindowSceneActivationAnimator_animateWithSourcePreview_velocity___block_invoke;
    v71[3] = &unk_1E52FD2B8;
    double v74 = v54;
    double v75 = v55;
    double v76 = v47;
    double v77 = v49;
    double v78 = v51;
    double v79 = v53;
    long long v66 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v80 = *MEMORY[0x1E4F1DAB8];
    long long v81 = v66;
    long long v82 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    id v72 = v29;
    v73 = self;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __70___UIWindowSceneActivationAnimator_animateWithSourcePreview_velocity___block_invoke_2;
    v70[3] = &unk_1E52DA9D0;
    v70[4] = self;
    id v67 = v29;
    +[UIView _animateUsingSpringBehavior:v65 tracking:0 animations:v71 completion:v70];

    [(_UIWindowSceneActivationAnimator *)self deparent];
    int64_t v7 = v69;
  }

  return v7 != 2;
}

- (void)deparent
{
}

- (void)reparent
{
}

- (void)cancel
{
  int64_t v3 = [(_UIWindowSceneActivationAnimator *)self state];
  if ((unint64_t)(v3 - 1) <= 1)
  {
    int64_t v4 = v3;
    [(_UIWindowSceneActivationAnimator *)self setState:3];
    [(_UIWindowSceneActivationAnimator *)self reparent];
    if (v4 == 1)
    {
      [(_UIWindowSceneActivationAnimator *)self _sendCompletionActionCallingAlongsideCompletions:0];
    }
    else
    {
      [(_UIWindowSceneActivationAnimator *)self _cleanUp];
    }
  }
}

- (void)addAnimations:(id)a3
{
  id v4 = a3;
  alongsideAnimations = self->_alongsideAnimations;
  aBlock = v4;
  if (!alongsideAnimations)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    int64_t v7 = self->_alongsideAnimations;
    self->_alongsideAnimations = v6;

    id v4 = aBlock;
    alongsideAnimations = self->_alongsideAnimations;
  }
  objc_super v8 = _Block_copy(v4);
  [(NSMutableArray *)alongsideAnimations addObject:v8];
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  alongsideCompletions = self->_alongsideCompletions;
  aBlock = v4;
  if (!alongsideCompletions)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    int64_t v7 = self->_alongsideCompletions;
    self->_alongsideCompletions = v6;

    id v4 = aBlock;
    alongsideCompletions = self->_alongsideCompletions;
  }
  objc_super v8 = _Block_copy(v4);
  [(NSMutableArray *)alongsideCompletions addObject:v8];
}

- (void)setDeparented:(BOOL)a3
{
  if (self->_deparented != a3)
  {
    self->_deparented = a3;
    id v4 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.2];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50___UIWindowSceneActivationAnimator_setDeparented___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView _animateUsingSpringBehavior:v4 tracking:0 animations:v5 completion:0];
  }
}

- (id)_sourceViewContainer
{
  v2 = [(_UIWindowSceneActivationAnimator *)self configuration];
  int64_t v3 = [v2 preview];
  id v4 = [v3 target];
  v5 = [v4 container];

  return v5;
}

- (id)_previewForIncomingScenePortal
{
  int64_t v3 = [UIPreviewTarget alloc];
  id v4 = [(_UIWindowSceneActivationAnimator *)self _sourceViewContainer];
  v5 = -[UIPreviewTarget initWithContainer:center:](v3, "initWithContainer:center:", v4, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  id v6 = objc_opt_new();
  int64_t v7 = [(_UIWindowSceneActivationAnimator *)self incomingScenePortalView];
  objc_super v8 = [v7 backgroundColor];
  [v6 setBackgroundColor:v8];

  v9 = [UITargetedPreview alloc];
  v10 = [(_UIWindowSceneActivationAnimator *)self incomingScenePortalView];
  v11 = [(UITargetedPreview *)v9 initWithView:v10 parameters:v6 target:v5];

  return v11;
}

- (void)_sendCompletionActionCallingAlongsideCompletions:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UIWindowSceneActivationAnimator *)self setState:3];
  v5 = [(_UIWindowSceneActivationAnimator *)self configuration];
  id v6 = [v5 options];
  int64_t v7 = [v6 _interactionIdentifier];

  if ([(_UIWindowSceneActivationAnimator *)self isDeallocating])
  {
    [(_UIWindowSceneActivationAnimator *)self _cleanUp];
    if (v3) {
      [(_UIWindowSceneActivationAnimator *)self _performAllAlongsideCompletions];
    }
    objc_super v8 = (uint64_t *)&__block_literal_global_362;
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __85___UIWindowSceneActivationAnimator__sendCompletionActionCallingAlongsideCompletions___block_invoke_2;
    v13 = &unk_1E52FD2E0;
    double v14 = self;
    LOBYTE(v15) = v3;
    objc_super v8 = &v10;
  }
  v9 = +[_UIWindowSceneActivationCleanupAction actionWithInteractionIdentifier:responseHandler:](_UIWindowSceneActivationCleanupAction, "actionWithInteractionIdentifier:responseHandler:", v7, v8, v10, v11, v12, v13, v14, v15);
  [(_UIWindowSceneActivationAnimator *)self _sendBSAction:v9];
}

- (void)_cleanUp
{
  BOOL v3 = [(_UIWindowSceneActivationAnimator *)self deparentingWrapper];

  if (v3)
  {
    id v4 = [(_UIWindowSceneActivationAnimator *)self deparentingWrapper];
    [v4 removeFromSuperview];

    [(_UIWindowSceneActivationAnimator *)self setDeparentingWrapper:0];
    [(_UIWindowSceneActivationAnimator *)self setMorphContainerView:0];
    [(_UIWindowSceneActivationAnimator *)self setIncomingScenePortalView:0];
    v5 = [(_UIWindowSceneActivationAnimator *)self deparentingPortalAlphaSourceView];
    [v5 removeFromSuperview];

    [(_UIWindowSceneActivationAnimator *)self setDeparentingPortalAlphaSourceView:0];
    [(_UIWindowSceneActivationAnimator *)self setState:4];
  }
}

- (void)_performAllAlongsideAnimations:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(_UIWindowSceneActivationAnimator *)self alongsideAnimations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;
}

- (void)_performAllAlongsideCompletions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(_UIWindowSceneActivationAnimator *)self alongsideCompletions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  alongsideCompletions = self->_alongsideCompletions;
  self->_alongsideCompletions = 0;
}

- (void)_sendBSAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIWindowSceneActivationAnimator *)self _sourceViewContainer];
  uint64_t v6 = [v5 _window];
  uint64_t v7 = [v6 windowScene];
  id v9 = [v7 _FBSScene];

  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];

  [v9 sendActions:v8];
}

- (double)_startingShadowIntensity
{
  v2 = [(_UIWindowSceneActivationAnimator *)self configuration];
  uint64_t v3 = [v2 _animationSource];

  if (v3 == 2)
  {
    uint64_t v5 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
    [v5 pinchPlatterMaxShadowIntensity];
    double v7 = v6;

    return v7;
  }
  else
  {
    double result = 0.0;
    if (v3 == 1) {
      return 1.0;
    }
  }
  return result;
}

- (int64_t)_preferredCollapsedShadowStyle
{
  v2 = [(_UIWindowSceneActivationAnimator *)self configuration];
  uint64_t v3 = [v2 _animationSource];

  if (v3 == 2) {
    return 1;
  }
  else {
    return 2 * (v3 == 1);
  }
}

- (UIWindowSceneActivationConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (_UIPortalView)incomingScenePortalView
{
  return self->_incomingScenePortalView;
}

- (void)setIncomingScenePortalView:(id)a3
{
}

- (UIView)morphContainerView
{
  return self->_morphContainerView;
}

- (void)setMorphContainerView:(id)a3
{
}

- (UIView)deparentingWrapper
{
  return self->_deparentingWrapper;
}

- (void)setDeparentingWrapper:(id)a3
{
}

- (UIView)deparentingPortalAlphaSourceView
{
  return self->_deparentingPortalAlphaSourceView;
}

- (void)setDeparentingPortalAlphaSourceView:(id)a3
{
}

- (CGRect)expectedFrame
{
  double x = self->_expectedFrame.origin.x;
  double y = self->_expectedFrame.origin.y;
  double width = self->_expectedFrame.size.width;
  double height = self->_expectedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setExpectedFrame:(CGRect)a3
{
  self->_expectedFrame = a3;
}

- (UIRectCornerRadii)expectedCornerRadii
{
  double topLeft = self->_expectedCornerRadii.topLeft;
  double bottomLeft = self->_expectedCornerRadii.bottomLeft;
  double bottomRight = self->_expectedCornerRadii.bottomRight;
  double topRight = self->_expectedCornerRadii.topRight;
  result.double topRight = topRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topLeft = topLeft;
  return result;
}

- (void)setExpectedCornerRadii:(UIRectCornerRadii)a3
{
  self->_expectedCornerRadii = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSMutableArray)alongsideAnimations
{
  return self->_alongsideAnimations;
}

- (NSMutableArray)alongsideCompletions
{
  return self->_alongsideCompletions;
}

- (CAMatchMoveAnimation)incomingSceneAnchorAnimation
{
  return self->_incomingSceneAnchorAnimation;
}

- (void)setIncomingSceneAnchorAnimation:(id)a3
{
}

- (BOOL)deparented
{
  return self->_deparented;
}

- (BOOL)isDeallocating
{
  return self->_isDeallocating;
}

- (void)setIsDeallocating:(BOOL)a3
{
  self->_isDeallocating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingSceneAnchorAnimation, 0);
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);
  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
  objc_storeStrong((id *)&self->_deparentingPortalAlphaSourceView, 0);
  objc_storeStrong((id *)&self->_deparentingWrapper, 0);
  objc_storeStrong((id *)&self->_morphContainerView, 0);
  objc_storeStrong((id *)&self->_incomingScenePortalView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end