@interface SBScaleIconZoomAnimator
+ (BOOL)validateAnimationContainer:(id)a3 targetIcon:(id)a4;
- (BOOL)_forceSquareZoomDimension;
- (BOOL)fadesHomeScreen;
- (BOOL)shouldMatchMoveWithDock;
- (CGPoint)_referenceIconImageCenter;
- (CGPoint)_targetIconScaleForZoomFraction:(double)a3;
- (CGPoint)_zoomedIconCenter;
- (CGPoint)targetIconCenter;
- (CGPoint)zoomScaleDimension;
- (CGPoint)zoomedTargetIconCenter;
- (CGRect)_zoomedFrame;
- (NSMutableArray)animationCompletions;
- (SBIcon)targetIcon;
- (SBIconView)referenceIconView;
- (SBIconView)targetIconView;
- (SBReversibleLayerPropertyAnimator)homeScreenScaleAnimator;
- (SBReversibleLayerPropertyAnimator)targetIconScaleXAnimator;
- (SBReversibleLayerPropertyAnimator)targetIconScaleYAnimator;
- (SBScaleIconZoomAnimator)initWithAnimationContainer:(id)a3 targetIcon:(id)a4;
- (UIView)targetIconContainerView;
- (UIView)targetIconPositioningView;
- (double)_homeScreenScaleForZoomFraction:(double)a3;
- (double)_zoomedVisualAltitude;
- (double)maxHomeScreenZoomScale;
- (double)zoomScale;
- (unint64_t)_numberOfSignificantAnimations;
- (void)_applyIconGridFadeFraction:(double)a3;
- (void)_applyVisualAltitudeFraction:(double)a3;
- (void)_applyZoomFraction:(double)a3;
- (void)_cleanupAnimation;
- (void)_configureTargetIconPositioningView:(id)a3;
- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7;
- (void)_prepareAnimation;
- (void)_setAnimationFraction:(double)a3;
- (void)_setIconAlpha:(double)a3;
- (void)_setZoomScale:(CGPoint)a3;
- (void)setAnimationCompletions:(id)a3;
- (void)setHomeScreenScaleAnimator:(id)a3;
- (void)setTargetIconScaleXAnimator:(id)a3;
- (void)setTargetIconScaleYAnimator:(id)a3;
@end

@implementation SBScaleIconZoomAnimator

+ (BOOL)validateAnimationContainer:(id)a3 targetIcon:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    v9 = [v5 currentIconListView];
    uint64_t v10 = [v9 displayedIconViewForIcon:v7];
    if (v10)
    {
      v11 = (void *)v10;
      BOOL v8 = 1;
    }
    else
    {
      v11 = [v5 dockIconListView];
      v12 = [v11 displayedIconViewForIcon:v7];
      BOOL v8 = v12 != 0;
    }
  }

  return v8;
}

- (SBScaleIconZoomAnimator)initWithAnimationContainer:(id)a3 targetIcon:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBScaleIconZoomAnimator;
  BOOL v8 = [(SBIconZoomAnimator *)&v15 initWithAnimationContainer:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_targetIcon, a4);
    uint64_t v10 = [(SBIcon *)v9->_targetIcon nodeIdentifier];
    if (v10)
    {
      v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
      [(SBIconZoomAnimator *)v9 setCriticalIconNodeIdentifiers:v11];
    }
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    animationCompletions = v9->_animationCompletions;
    v9->_animationCompletions = v12;
  }
  return v9;
}

- (double)zoomScale
{
  double result = self->_zoomScaleDimension.x;
  if (result >= self->_zoomScaleDimension.y) {
    return self->_zoomScaleDimension.y;
  }
  return result;
}

- (double)maxHomeScreenZoomScale
{
  return 1.0;
}

- (UIView)targetIconContainerView
{
  v3 = [(SBIconAnimator *)self animationContainer];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 targetIconContainerView], (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = [(SBScaleIconZoomAnimator *)self defaultTargetIconContainerView];
  }

  return (UIView *)v4;
}

- (BOOL)fadesHomeScreen
{
  return 0;
}

- (BOOL)_forceSquareZoomDimension
{
  return 1;
}

- (void)_setZoomScale:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(SBScaleIconZoomAnimator *)self _forceSquareZoomDimension];
  if (x >= y) {
    double v7 = y;
  }
  else {
    double v7 = x;
  }
  if (v6) {
    double v8 = v7;
  }
  else {
    double v8 = x;
  }
  if (!v6) {
    double v7 = y;
  }
  self->_zoomScaleDimension.double x = v8;
  self->_zoomScaleDimension.double y = v7;
}

- (SBIconView)targetIconView
{
  targetIconView = self->_targetIconView;
  if (!targetIconView)
  {
    v4 = [(SBScaleIconZoomAnimator *)self referenceIconView];
    id v5 = [v4 matchingIconViewByAddingConfigurationOptions:12 removingConfigurationOptions:0];
    BOOL v6 = self->_targetIconView;
    self->_targetIconView = v5;

    targetIconView = self->_targetIconView;
  }
  return targetIconView;
}

- (SBIconView)referenceIconView
{
  return (SBIconView *)[(SBIconZoomAnimator *)self iconViewForIcon:self->_targetIcon];
}

- (BOOL)shouldMatchMoveWithDock
{
  return 0;
}

- (void)_prepareAnimation
{
  v3 = [(SBIconAnimator *)self animationContainer];
  if (objc_opt_respondsToSelector())
  {
    v4 = [(SBScaleIconZoomAnimator *)self targetIcon];
    [v3 prepareForAnimation:self withTargetIcon:v4];
  }
  v131.receiver = self;
  v131.super_class = (Class)SBScaleIconZoomAnimator;
  [(SBIconZoomAnimator *)&v131 _prepareAnimation];
  id v5 = [(SBScaleIconZoomAnimator *)self targetIconView];
  BOOL v6 = [(SBScaleIconZoomAnimator *)self referenceIconView];
  double v7 = [v5 labelView];
  [v7 removeFromSuperview];

  [v5 setLabelAccessoryHidden:1];
  [(SBScaleIconZoomAnimator *)self _zoomedFrame];
  double v9 = v8;
  double v11 = v10;
  [v5 iconImageVisibleSize];
  if (v12 <= 0.0) {
    double v14 = 1.0;
  }
  else {
    double v14 = v9 / v12;
  }
  if (v13 <= 0.0) {
    double v15 = 1.0;
  }
  else {
    double v15 = v11 / v13;
  }
  -[SBScaleIconZoomAnimator _setZoomScale:](self, "_setZoomScale:", v14, v15);
  v16 = [(SBIconAnimator *)self animationContainer];
  v17 = [v16 borrowScalingView];
  scalingView = self->_scalingView;
  self->_scalingView = v17;

  BOOL v19 = [(SBScaleIconZoomAnimator *)self shouldMatchMoveWithDock];
  v20 = [v6 layer];
  v21 = [v20 presentationLayer];

  v22 = [v6 superview];
  v23 = [v22 layer];
  v24 = [v23 presentationLayer];

  if (v21 && v19)
  {
    id v25 = v21;
  }
  else
  {
    id v25 = [v6 layer];
  }
  v26 = v25;
  if (v24) {
    BOOL v27 = v19;
  }
  else {
    BOOL v27 = 0;
  }
  v128 = v6;
  if (v27)
  {
    id v129 = v24;
  }
  else
  {
    v28 = [v6 superview];
    id v129 = [v28 layer];
  }
  int v29 = 0;
  if (v24) {
    BOOL v30 = v19;
  }
  else {
    BOOL v30 = 0;
  }
  v31 = v26;
  if (v21)
  {
    if (v30)
    {
      [v21 transform];
      BOOL v32 = CATransform3DIsIdentity(&v130);
      int v29 = !v32;
      v31 = v129;
      if (v32) {
        v31 = v26;
      }
    }
  }
  id v33 = v31;
  [v26 bounds];
  double v35 = v34;
  uint64_t v37 = v36;
  double v39 = v38;
  double v41 = v40;
  [v26 position];
  double v43 = v42;
  double v45 = v44;
  [(SBScaleIconZoomAnimator *)self _referenceIconImageCenter];
  double v48 = v46;
  double v49 = v47;
  double v126 = v41;
  double v120 = v35;
  double v121 = v39;
  uint64_t v118 = v37;
  if (v39 <= 0.0 || v41 <= 0.0)
  {
    double v51 = *MEMORY[0x1E4F1DAD8];
    double v53 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v50 = v39 * 0.5;
    double v52 = v41 * 0.5;
  }
  else
  {
    double v50 = v39 * 0.5;
    double v51 = v43 + v46 - v50;
    double v52 = v41 * 0.5;
    double v53 = v45 + v47 - v52;
  }
  v54 = [(UIView *)self->_scalingView layer];
  if (v29) {
    double v55 = v51;
  }
  else {
    double v55 = v48;
  }
  if (v29) {
    double v56 = v53;
  }
  else {
    double v56 = v49;
  }
  double v122 = v56;
  double v124 = v55;
  if (v29) {
    double v57 = v45 - v52;
  }
  else {
    double v57 = v119;
  }
  if (v29) {
    double v58 = v43 - v50;
  }
  else {
    double v58 = v120;
  }
  objc_msgSend(v33, "convertPoint:toLayer:", v54);
  double v60 = v59;
  double v62 = v61;

  [(UIView *)self->_scalingView frame];
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  [(UIView *)self->_scalingView bounds];
  if (v71 <= 0.0) {
    double v73 = 0.0;
  }
  else {
    double v73 = v60 / v71;
  }
  if (v72 <= 0.0) {
    double v74 = 0.0;
  }
  else {
    double v74 = v62 / v72;
  }
  v75 = [(UIView *)self->_scalingView layer];
  objc_msgSend(v75, "setAnchorPoint:", v73, v74);

  -[UIView setFrame:](self->_scalingView, "setFrame:", v64, v66, v68, v70);
  [v5 _visualAltitude];
  self->_naturalVisualAltitude = v76;
  v77 = [SBHTouchPassThroughView alloc];
  v78 = -[SBHTouchPassThroughView initWithFrame:](v77, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  targetIconPositioningView = self->_targetIconPositioningView;
  self->_targetIconPositioningView = v78;

  [(SBScaleIconZoomAnimator *)self _configureTargetIconPositioningView:self->_targetIconPositioningView];
  [(UIView *)self->_targetIconPositioningView addSubview:v5];
  v80 = [(UIView *)self->_targetIconPositioningView layer];
  objc_msgSend(v33, "convertRect:toLayer:", v80, v58, v57, v121, v126);
  double v82 = v81;
  double v84 = v83;
  double v86 = v85;
  double v88 = v87;

  objc_msgSend(v5, "setFrame:", v82, v84, v86, v88);
  v89 = self->_targetIconPositioningView;
  [(SBScaleIconZoomAnimator *)self _zoomedIconCenter];
  double v91 = v90;
  double v93 = v92;
  v94 = [(SBIconAnimator *)self referenceView];
  -[UIView convertPoint:fromView:](v89, "convertPoint:fromView:", v94, v91, v93);
  self->_zoomedTargetIconCenter.double x = v95;
  self->_zoomedTargetIconCenter.double y = v96;

  v97 = [(UIView *)self->_targetIconPositioningView layer];
  objc_msgSend(v33, "convertPoint:toLayer:", v97, v124, v122);
  self->_targetIconCenter.double x = v98;
  self->_targetIconCenter.double y = v99;

  double x = self->_zoomScaleDimension.x;
  double y = self->_zoomScaleDimension.y;
  double v102 = 1.0;
  double v103 = 1.0;
  if (x > 1.0) {
    double v103 = -(self->_zoomedTargetIconCenter.x - x * self->_targetIconCenter.x) / (x + -1.0);
  }
  if (y > 1.0) {
    double v102 = -(self->_zoomedTargetIconCenter.y - y * self->_targetIconCenter.y) / (y + -1.0);
  }
  [(UIView *)self->_targetIconPositioningView frame];
  double v125 = v105;
  double v127 = v104;
  double v123 = v106;
  double v108 = v107;
  [(UIView *)self->_targetIconPositioningView bounds];
  double v109 = v132.origin.x;
  double v110 = v132.origin.y;
  double width = v132.size.width;
  double height = v132.size.height;
  double v113 = CGRectGetWidth(v132);
  v133.origin.double x = v109;
  v133.origin.double y = v110;
  v133.size.double width = width;
  v133.size.double height = height;
  double v114 = CGRectGetHeight(v133);
  if (v113 <= 0.0) {
    double v115 = 0.0;
  }
  else {
    double v115 = v103 / v113;
  }
  if (v114 <= 0.0) {
    double v116 = 0.0;
  }
  else {
    double v116 = v102 / v114;
  }
  v117 = [(UIView *)self->_targetIconPositioningView layer];
  objc_msgSend(v117, "setAnchorPoint:", v115, v116);

  -[UIView setCenter:](self->_targetIconPositioningView, "setCenter:", v127 + v123 * v115, v125 + v108 * v116);
  -[UIView setBounds:](self->_targetIconPositioningView, "setBounds:", v109, v110, width, height);
}

- (void)_configureTargetIconPositioningView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBScaleIconZoomAnimator *)self targetIconContainerView];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");

  [v5 addSubview:self->_targetIconPositioningView];
}

- (void)_setAnimationFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBScaleIconZoomAnimator;
  -[SBIconZoomAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  [(SBScaleIconZoomAnimator *)self _applyZoomFraction:a3];
  [(SBScaleIconZoomAnimator *)self _applyVisualAltitudeFraction:a3];
  [(SBScaleIconZoomAnimator *)self _applyIconGridFadeFraction:a3];
}

- (void)_cleanupAnimation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(UIView *)self->_scalingView layer];
  objc_msgSend(v3, "setAnchorPoint:", 0.5, 0.5);

  id v4 = [(SBIconAnimator *)self animationContainer];
  [v4 returnScalingView];

  scalingView = self->_scalingView;
  self->_scalingView = 0;

  [(UIView *)self->_targetIconPositioningView removeFromSuperview];
  targetIconPositioningView = self->_targetIconPositioningView;
  self->_targetIconPositioningView = 0;

  targetIconView = self->_targetIconView;
  self->_targetIconView = 0;

  double v8 = [(SBScaleIconZoomAnimator *)self animationCompletions];
  double v9 = (void *)[v8 copy];

  if ([v9 count])
  {
    double v10 = [(SBScaleIconZoomAnimator *)self animationCompletions];
    [v10 removeAllObjects];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v15++) + 16))();
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
  [(SBReversibleLayerPropertyAnimator *)self->_homeScreenScaleAnimator invalidate];
  [(SBScaleIconZoomAnimator *)self setHomeScreenScaleAnimator:0];
  [(SBReversibleLayerPropertyAnimator *)self->_targetIconScaleXAnimator invalidate];
  [(SBScaleIconZoomAnimator *)self setTargetIconScaleXAnimator:0];
  [(SBReversibleLayerPropertyAnimator *)self->_targetIconScaleYAnimator invalidate];
  [(SBScaleIconZoomAnimator *)self setTargetIconScaleYAnimator:0];
  if ([(SBScaleIconZoomAnimator *)self fadesHomeScreen]) {
    [(SBScaleIconZoomAnimator *)self _setIconAlpha:1.0];
  }
  v16.receiver = self;
  v16.super_class = (Class)SBScaleIconZoomAnimator;
  [(SBIconZoomAnimator *)&v16 _cleanupAnimation];
}

- (unint64_t)_numberOfSignificantAnimations
{
  v3.receiver = self;
  v3.super_class = (Class)SBScaleIconZoomAnimator;
  return [(SBIconZoomAnimator *)&v3 _numberOfSignificantAnimations] + 3;
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a7;
  v64.receiver = self;
  v64.super_class = (Class)SBScaleIconZoomAnimator;
  [(SBIconZoomAnimator *)&v64 _performAnimationToFraction:v12 withCentralAnimationSettings:v8 delay:v13 alreadyAnimating:a3 sharedCompletion:a5];
  BOOL v53 = v8;
  if (v8) {
    uint64_t v14 = 6;
  }
  else {
    uint64_t v14 = 2;
  }
  if (v8) {
    a5 = 0.0;
  }
  uint64_t v15 = [v12 BSAnimationSettings];
  objc_super v16 = (void *)[v15 mutableCopy];
  [v16 delay];
  [v16 setDelay:a5 + v17];
  if (v13)
  {
    long long v18 = [(SBScaleIconZoomAnimator *)self animationCompletions];
    long long v19 = (void *)[v13 copy];
    long long v20 = _Block_copy(v19);
    [v18 addObject:v20];
  }
  double v55 = v13;
  v21 = [(SBScaleIconZoomAnimator *)self homeScreenScaleAnimator];

  uint64_t v22 = &off_1D81E4000;
  v54 = v16;
  if (v21)
  {
    v23 = [(SBScaleIconZoomAnimator *)self homeScreenScaleAnimator];
    [v23 reverse];

    v24 = [(SBScaleIconZoomAnimator *)self targetIconScaleXAnimator];
    [v24 reverse];

    id v25 = [(SBScaleIconZoomAnimator *)self targetIconScaleYAnimator];
    [v25 reverse];
  }
  else
  {
    uint64_t v51 = v14;
    double v52 = v15;
    v26 = dispatch_group_create();
    dispatch_group_enter(v26);
    [(SBScaleIconZoomAnimator *)self _homeScreenScaleForZoomFraction:a3];
    BOOL v27 = [(UIView *)self->_scalingView layer];
    v28 = [SBReversibleLayerPropertyAnimator alloc];
    int v29 = [v27 valueForKeyPath:@"transform.scale.xy"];
    [v29 doubleValue];
    double v50 = v27;
    BOOL v30 = -[SBReversibleLayerPropertyAnimator initWithLayer:keyPath:initialValue:targetValue:](v28, "initWithLayer:keyPath:initialValue:targetValue:", v27, @"transform.scale.xy");

    [(SBScaleIconZoomAnimator *)self setHomeScreenScaleAnimator:v30];
    dispatch_group_enter(v26);
    [(SBScaleIconZoomAnimator *)self _targetIconScaleForZoomFraction:a3];
    v31 = [(UIView *)self->_targetIconPositioningView layer];
    BOOL v32 = [SBReversibleLayerPropertyAnimator alloc];
    id v33 = [v31 valueForKeyPath:@"transform.scale.x"];
    [v33 doubleValue];
    double v34 = -[SBReversibleLayerPropertyAnimator initWithLayer:keyPath:initialValue:targetValue:](v32, "initWithLayer:keyPath:initialValue:targetValue:", v31, @"transform.scale.x");

    [(SBScaleIconZoomAnimator *)self setTargetIconScaleXAnimator:v34];
    dispatch_group_enter(v26);
    double v35 = [SBReversibleLayerPropertyAnimator alloc];
    uint64_t v36 = [v31 valueForKeyPath:@"transform.scale.y"];
    [v36 doubleValue];
    uint64_t v37 = -[SBReversibleLayerPropertyAnimator initWithLayer:keyPath:initialValue:targetValue:](v35, "initWithLayer:keyPath:initialValue:targetValue:", v31, @"transform.scale.y");

    [(SBScaleIconZoomAnimator *)self setTargetIconScaleYAnimator:v37];
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
    aBlock[3] = &unk_1E6AB0610;
    objc_copyWeak(&v62, &location);
    double v38 = v30;
    double v61 = v38;
    double v39 = _Block_copy(aBlock);
    dispatch_group_notify(v26, MEMORY[0x1E4F14428], v39);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2;
    v58[3] = &unk_1E6AACAB8;
    id v25 = v26;
    double v59 = v25;
    double v40 = _Block_copy(v58);
    [(SBReversibleLayerPropertyAnimator *)v38 animateWithSettings:v16 completion:v40];
    [(SBReversibleLayerPropertyAnimator *)v34 animateWithSettings:v16 completion:v40];
    [(SBReversibleLayerPropertyAnimator *)v37 animateWithSettings:v16 completion:v40];

    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);

    uint64_t v14 = v51;
    uint64_t v15 = v52;
    uint64_t v22 = &off_1D81E4000;
  }

  double v41 = v15;
  double v42 = [MEMORY[0x1E4F4F898] factoryWithSettings:v15];
  [v42 setAllowsAdditiveAnimations:1];
  v57[0] = MEMORY[0x1E4F143A8];
  uint64_t v43 = *((void *)v22 + 360);
  v57[1] = v43;
  v57[2] = __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3;
  v57[3] = &unk_1E6AAC838;
  v57[4] = self;
  *(double *)&v57[5] = a3;
  uint64_t v44 = v14;
  [MEMORY[0x1E4F4F898] animateWithFactory:v42 additionalDelay:v14 options:v57 actions:v55 completion:a5];
  double v45 = [(SBIconAnimator *)self settings];
  double v46 = [v45 iconGridFadeSettings];
  double v47 = [v46 BSAnimationSettings];
  double v48 = (void *)[v47 mutableCopy];

  if (v53) {
    [v48 setDelay:0.0];
  }
  double v49 = [MEMORY[0x1E4F4F898] factoryWithSettings:v48];
  if (!v53 || BSFloatIsZero()) {
    [v49 setAllowsAdditiveAnimations:1];
  }
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = v43;
  v56[2] = __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4;
  v56[3] = &unk_1E6AAC838;
  v56[4] = self;
  *(double *)&v56[5] = a3;
  [MEMORY[0x1E4F4F898] animateWithFactory:v49 additionalDelay:v44 options:v56 actions:v55 completion:a5];
}

void __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = [WeakRetained homeScreenScaleAnimator];
  LODWORD(v1) = [v3 isEqual:*(void *)(v1 + 32)];

  if (v1)
  {
    [WeakRetained setHomeScreenScaleAnimator:0];
    [WeakRetained setTargetIconScaleXAnimator:0];
    [WeakRetained setTargetIconScaleYAnimator:0];
    id v4 = [WeakRetained animationCompletions];
    objc_super v5 = (void *)[v4 copy];

    if ([v5 count])
    {
      BOOL v6 = [WeakRetained animationCompletions];
      [v6 removeAllObjects];

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
  }
}

void __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2(uint64_t a1)
{
}

uint64_t __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyVisualAltitudeFraction:*(double *)(a1 + 40)];
}

uint64_t __124__SBScaleIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyIconGridFadeFraction:*(double *)(a1 + 40)];
}

- (CGRect)_zoomedFrame
{
  v2 = [(SBIconAnimator *)self referenceView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGPoint)_zoomedIconCenter
{
  [(SBScaleIconZoomAnimator *)self _zoomedFrame];
  UIRectGetCenter();
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (double)_zoomedVisualAltitude
{
  return 0.0;
}

- (CGPoint)_referenceIconImageCenter
{
  double v2 = [(SBScaleIconZoomAnimator *)self referenceIconView];
  [v2 iconImageCenter];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)_setIconAlpha:(double)a3
{
  id v4 = [(SBIconAnimator *)self animationContainer];
  if (objc_opt_respondsToSelector()) {
    [v4 setContentAlpha:a3];
  }
}

- (void)_applyZoomFraction:(double)a3
{
  -[SBScaleIconZoomAnimator _homeScreenScaleForZoomFraction:](self, "_homeScreenScaleForZoomFraction:");
  CGFloat v6 = v5;
  if (BSFloatGreaterThanOrEqualToFloat())
  {
    scalingView = self->_scalingView;
    CGAffineTransformMakeScale(&v12, v6, v6);
    [(UIView *)scalingView setTransform:&v12];
  }
  [(SBScaleIconZoomAnimator *)self _targetIconScaleForZoomFraction:a3];
  targetIconPositioningView = self->_targetIconPositioningView;
  CGAffineTransformMakeScale(&v11, v9, v10);
  [(UIView *)targetIconPositioningView setTransform:&v11];
}

- (double)_homeScreenScaleForZoomFraction:(double)a3
{
  [(SBScaleIconZoomAnimator *)self maxHomeScreenZoomScale];
  double v5 = v4;
  int v6 = BSFloatGreaterThanFloat();
  double result = 1.0 - (1.0 - v5) * a3;
  if (!v6) {
    return 1.0;
  }
  return result;
}

- (CGPoint)_targetIconScaleForZoomFraction:(double)a3
{
  __asm { FMOV            V2.2D, #1.0 }
  float64x2_t v8 = vsubq_f64(_Q2, vmulq_n_f64(vsubq_f64(_Q2, (float64x2_t)self->_zoomScaleDimension), a3));
  double v9 = v8.f64[1];
  result.double x = v8.f64[0];
  result.double y = v9;
  return result;
}

- (void)_applyVisualAltitudeFraction:(double)a3
{
  double v5 = [(SBScaleIconZoomAnimator *)self targetIconView];
  int v6 = [v5 superview];
  [(SBScaleIconZoomAnimator *)self _zoomedVisualAltitude];
  double v8 = v7;
  double v9 = [v5 window];
  [v6 _convertVisualAltitude:v9 fromView:v8];
  double v11 = v10;

  [v5 _setVisualAltitude:self->_naturalVisualAltitude + (v11 - self->_naturalVisualAltitude) * a3];
  if (v5) {
    [v5 transform];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  if (!CGAffineTransformIsIdentity(&v14))
  {
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v13[0] = *MEMORY[0x1E4F1DAB8];
    v13[1] = v12;
    v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v5 setTransform:v13];
  }
}

- (void)_applyIconGridFadeFraction:(double)a3
{
  if ((BSFloatIsOne() & 1) != 0 || BSFloatIsZero())
  {
    double v5 = [(SBIconAnimator *)self settings];
    int v6 = [v5 fadesIconGrid];

    if (v6)
    {
      [(SBScaleIconZoomAnimator *)self _setIconAlpha:1.0 - a3];
    }
  }
}

- (SBReversibleLayerPropertyAnimator)homeScreenScaleAnimator
{
  return self->_homeScreenScaleAnimator;
}

- (void)setHomeScreenScaleAnimator:(id)a3
{
}

- (SBReversibleLayerPropertyAnimator)targetIconScaleXAnimator
{
  return self->_targetIconScaleXAnimator;
}

- (void)setTargetIconScaleXAnimator:(id)a3
{
}

- (SBReversibleLayerPropertyAnimator)targetIconScaleYAnimator
{
  return self->_targetIconScaleYAnimator;
}

- (void)setTargetIconScaleYAnimator:(id)a3
{
}

- (NSMutableArray)animationCompletions
{
  return self->_animationCompletions;
}

- (void)setAnimationCompletions:(id)a3
{
}

- (SBIcon)targetIcon
{
  return self->_targetIcon;
}

- (UIView)targetIconPositioningView
{
  return self->_targetIconPositioningView;
}

- (CGPoint)zoomScaleDimension
{
  double x = self->_zoomScaleDimension.x;
  double y = self->_zoomScaleDimension.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)zoomedTargetIconCenter
{
  double x = self->_zoomedTargetIconCenter.x;
  double y = self->_zoomedTargetIconCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)targetIconCenter
{
  double x = self->_targetIconCenter.x;
  double y = self->_targetIconCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIconPositioningView, 0);
  objc_storeStrong((id *)&self->_targetIcon, 0);
  objc_storeStrong((id *)&self->_animationCompletions, 0);
  objc_storeStrong((id *)&self->_targetIconScaleYAnimator, 0);
  objc_storeStrong((id *)&self->_targetIconScaleXAnimator, 0);
  objc_storeStrong((id *)&self->_homeScreenScaleAnimator, 0);
  objc_storeStrong((id *)&self->_targetIconView, 0);
  objc_storeStrong((id *)&self->_scalingView, 0);
}

@end