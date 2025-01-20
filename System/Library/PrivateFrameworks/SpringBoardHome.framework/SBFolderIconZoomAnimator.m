@interface SBFolderIconZoomAnimator
- (BOOL)_forceSquareZoomDimension;
- (BOOL)isAnimatingInFloatingDock;
- (BOOL)shouldMatchMoveWithDock;
- (CGRect)_zoomedFrame;
- (SBFFluidBehaviorSettings)dockAnimationSettings;
- (SBFolderIconZoomAnimator)initWithAnimationContainer:(id)a3 innerFolderController:(id)a4 folderIcon:(id)a5;
- (SBHSearchPresenting)searchPresenter;
- (SBIconView)targetIconView;
- (SBSearchGesture)searchGesture;
- (id)defaultTargetIconContainerView;
- (unint64_t)_numberOfSignificantAnimations;
- (void)_cleanupAnimation;
- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7;
- (void)_prepareAnimation;
- (void)_setAnimationFraction:(double)a3;
- (void)_setupCounterDockMatchMoveAnimationWithOffset:(double)a3 layer:(id)a4 additive:(BOOL)a5;
- (void)_setupMatchMoveAnimation;
- (void)_setupMatchMoveWithDock;
- (void)_setupMatchMoveWithDockWithTargetIconCenter:(CGPoint)a3 targetIconAnchor:(CGPoint)a4;
- (void)_updateDockMatchMoveWithFraction:(double)a3;
- (void)_visuallyCompleteAnimationImmediately;
- (void)dealloc;
- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4;
- (void)setDockAnimationSettings:(id)a3;
- (void)setIsAnimatingInFloatingDock:(BOOL)a3;
- (void)setSearchGesture:(id)a3;
- (void)setSearchPresenter:(id)a3;
@end

@implementation SBFolderIconZoomAnimator

- (SBFolderIconZoomAnimator)initWithAnimationContainer:(id)a3 innerFolderController:(id)a4 folderIcon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBFolderIconZoomAnimator;
  v10 = [(SBScaleIconZoomAnimator *)&v17 initWithAnimationContainer:v8 targetIcon:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_innerFolderController, a4);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = [v8 searchGesture];
      searchGesture = v11->_searchGesture;
      v11->_searchGesture = (SBSearchGesture *)v12;

      [(SBSearchGesture *)v11->_searchGesture addObserver:v11];
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v8 searchPresenter];
      searchPresenter = v11->_searchPresenter;
      v11->_searchPresenter = (SBHSearchPresenting *)v14;

      [(SBHSearchPresenting *)v11->_searchPresenter addSearchPresenterObserver:v11];
    }
  }

  return v11;
}

- (void)dealloc
{
  [(SBSearchGesture *)self->_searchGesture removeObserver:self];
  [(SBHSearchPresenting *)self->_searchPresenter removeSearchPresenterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBFolderIconZoomAnimator;
  [(SBIconZoomAnimator *)&v3 dealloc];
}

- (id)defaultTargetIconContainerView
{
  return (id)[(SBFolderController *)self->_innerFolderController view];
}

- (SBIconView)targetIconView
{
  v7.receiver = self;
  v7.super_class = (Class)SBFolderIconZoomAnimator;
  objc_super v3 = [(SBScaleIconZoomAnimator *)&v7 targetIconView];
  v4 = [(SBScaleIconZoomAnimator *)self referenceIconView];
  uint64_t v5 = [v4 visibleMiniIconListIndex];
  if ([v3 visibleMiniIconListIndex] != v5) {
    [v3 scrollToTopOfPage:v5 animated:0];
  }
  [v4 iconContentScale];
  objc_msgSend(v3, "setIconContentScale:");

  return (SBIconView *)v3;
}

- (BOOL)shouldMatchMoveWithDock
{
  return self->_isAnimatingInFloatingDock;
}

- (void)_prepareAnimation
{
  objc_super v3 = [(SBFolderController *)self->_innerFolderController contentView];
  v4 = self;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }
  objc_storeStrong((id *)&self->_innerFolderView, v5);

  v13.receiver = self;
  v13.super_class = (Class)SBFolderIconZoomAnimator;
  [(SBScaleIconZoomAnimator *)&v13 _prepareAnimation];
  v6 = [(SBFolderIconZoomAnimator *)self targetIconView];
  objc_msgSend(v6, "prepareToCrossfadeWithFloatyFolderView:allowFolderInteraction:", self->_innerFolderView, -[SBFolderController isOpen](self->_innerFolderController, "isOpen"));
  [v6 setIconGridImageAlpha:0.0];
  objc_super v7 = [_SBInnerFolderIconZoomAnimator alloc];
  innerFolderController = self->_innerFolderController;
  [(SBScaleIconZoomAnimator *)self zoomScaleDimension];
  id v9 = -[_SBInnerFolderIconZoomAnimator initWithFolderController:iconView:iconZoomScaleDimension:](v7, "initWithFolderController:iconView:iconZoomScaleDimension:", innerFolderController, v6);
  innerZoomAnimator = self->_innerZoomAnimator;
  self->_innerZoomAnimator = v9;

  v11 = self->_innerZoomAnimator;
  uint64_t v12 = [(SBIconAnimator *)self settings];
  [(SBIconAnimator *)v11 setSettings:v12];

  [(SBIconAnimator *)self->_innerZoomAnimator prepare];
}

- (void)_updateDockMatchMoveWithFraction:(double)a3
{
  if (BSFloatIsZero())
  {
    [(SBFolderIconZoomAnimator *)self _setupMatchMoveWithDock];
  }
  else
  {
    v4 = [(SBScaleIconZoomAnimator *)self targetIconPositioningView];
    id v25 = [v4 layer];

    uint64_t v5 = [v25 animationForKey:@"SBDockIconZoomDownMatchMoveKey"];

    v6 = v25;
    if (v5)
    {
      [v25 removeAnimationForKey:@"SBDockIconZoomDownMatchMoveKey"];
      objc_super v7 = [(SBScaleIconZoomAnimator *)self referenceIconView];
      id v8 = [v7 layer];

      uint64_t v9 = [v8 presentationLayer];
      v10 = (void *)v9;
      if (v9) {
        v11 = (void *)v9;
      }
      else {
        v11 = v8;
      }
      id v12 = v11;

      [(SBScaleIconZoomAnimator *)self _referenceIconImageCenter];
      double v14 = v13;
      double v16 = v15;
      objc_super v17 = [(SBScaleIconZoomAnimator *)self targetIconContainerView];
      v18 = [v17 layer];
      objc_msgSend(v12, "convertPoint:toLayer:", v18, v14, v16);
      double v20 = v19;

      [(SBScaleIconZoomAnimator *)self targetIconCenter];
      double v22 = v21 - v20;
      if ((BSFloatIsZero() & 1) == 0)
      {
        v23 = [(SBScaleIconZoomAnimator *)self targetIconPositioningView];
        v24 = [v23 layer];
        [(SBFolderIconZoomAnimator *)self _setupCounterDockMatchMoveAnimationWithOffset:v24 layer:0 additive:v22];
      }
      v6 = v25;
    }
  }
}

- (void)_setupMatchMoveWithDock
{
  id v18 = [(SBScaleIconZoomAnimator *)self targetIconContainerView];
  [(SBScaleIconZoomAnimator *)self targetIconCenter];
  double v4 = v3;
  double v6 = v5;
  [(SBScaleIconZoomAnimator *)self zoomedTargetIconCenter];
  double v8 = v7;
  double v10 = v9;
  [(SBScaleIconZoomAnimator *)self zoomScaleDimension];
  double v12 = _SBScaleIconZoomAnimatorCameraPositionToScaleModelPointToTargetPoint(v4, v6, v8, v10, v11);
  double v14 = v13;
  [v18 bounds];
  double v16 = v12 / v15;
  [v18 bounds];
  -[SBFolderIconZoomAnimator _setupMatchMoveWithDockWithTargetIconCenter:targetIconAnchor:](self, "_setupMatchMoveWithDockWithTargetIconCenter:targetIconAnchor:", v4, v6, v16, v14 / v17);
}

- (void)_setupMatchMoveWithDockWithTargetIconCenter:(CGPoint)a3 targetIconAnchor:(CGPoint)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  double v5 = [(SBScaleIconZoomAnimator *)self referenceIconView];
  double v6 = [(SBScaleIconZoomAnimator *)self targetIconPositioningView];
  double v7 = [v5 location];
  int v8 = SBIconLocationGroupContainsLocation(@"SBIconLocationGroupDock", v7);

  if (v8) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    double v10 = [v5 layer];
    double v11 = [v6 layer];
    double v12 = [MEMORY[0x1E4F39C00] animation];
    [v12 setSourceLayer:v10];
    [v12 setDuration:INFINITY];
    [v12 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v12 setRemovedOnCompletion:0];
    [v12 setAppliesY:1];
    [v12 setAppliesX:1];
    double v13 = [(SBScaleIconZoomAnimator *)self targetIconContainerView];
    uint64_t v14 = [v10 presentationLayer];
    double v15 = (void *)v14;
    if (v14) {
      double v16 = (void *)v14;
    }
    else {
      double v16 = v10;
    }
    id v17 = v16;

    [(SBScaleIconZoomAnimator *)self _referenceIconImageCenter];
    double v19 = v18;
    double v21 = v20;
    double v22 = [v13 layer];
    objc_msgSend(v17, "convertPoint:toLayer:", v22, v19, v21);
    double v24 = v23;
    double v26 = v25;

    [v5 bounds];
    double v28 = v24 + v27 * -0.5;
    [v13 bounds];
    double v30 = v28 + v29 * -0.5;
    [v5 bounds];
    double v32 = v26 + v31 * -0.5;
    [v13 bounds];
    double v34 = v32 + v33 * -0.5;
    [v11 anchorPoint];
    double v36 = v35;
    double v38 = v37;
    [v13 bounds];
    double v40 = -(v30 - v39 * (v36 + -0.5));
    [v13 bounds];
    double v42 = -(v34 - v41 * (v38 + -0.5));
    [(SBScaleIconZoomAnimator *)self targetIconCenter];
    double v44 = v43 - v26;
    v46 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v40 - (v45 - v24), v42 - v44);
    v49[0] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    [v12 setSourcePoints:v47];

    v48 = [v11 animationForKey:@"SBDockIconZoomDownMatchMoveKey"];

    if (v48) {
      [v11 removeAnimationForKey:@"SBDockIconZoomDownMatchMoveKey"];
    }
    [v11 addAnimation:v12 forKey:@"SBDockIconZoomDownMatchMoveKey"];
    if ((BSFloatIsZero() & 1) == 0) {
      [(SBFolderIconZoomAnimator *)self _setupCounterDockMatchMoveAnimationWithOffset:v11 layer:1 additive:v44];
    }
  }
}

- (SBFFluidBehaviorSettings)dockAnimationSettings
{
  dockAnimationSettings = self->_dockAnimationSettings;
  if (dockAnimationSettings) {
    double v3 = dockAnimationSettings;
  }
  else {
    double v3 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E4FA5F08]);
  }
  return v3;
}

- (void)_setupCounterDockMatchMoveAnimationWithOffset:(double)a3 layer:(id)a4 additive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  BOOL v9 = [(SBFolderIconZoomAnimator *)self dockAnimationSettings];
  [v9 dampingRatio];
  [v9 response];
  convertDampingRatioAndResponseToTensionAndFriction();
  double v10 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.y"];
  [v10 setMass:1.0];
  [v10 setStiffness:0.0];
  [v10 setDamping:0.0];
  [v10 settlingDuration];
  objc_msgSend(v10, "setDuration:");
  [v10 setRemovedOnCompletion:1];
  double v11 = NSNumber;
  if (v5)
  {
    double v12 = [NSNumber numberWithDouble:a3];
    [v10 setFromValue:v12];

    [v10 setToValue:&unk_1F300ED28];
    [v10 setAdditive:1];
  }
  else
  {
    [v8 position];
    uint64_t v14 = [v11 numberWithDouble:v13 - a3];
    [v10 setFromValue:v14];
  }
  double v15 = [v8 animationForKey:@"SBDockIconZoomDownCounterSnapKey"];

  if (v15) {
    [v8 removeAnimationForKey:@"SBDockIconZoomDownCounterSnapKey"];
  }
  [v8 addAnimation:v10 forKey:@"SBDockIconZoomDownCounterSnapKey"];
}

- (void)_setupMatchMoveAnimation
{
  v19[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(SBIconAnimator *)self animationContainer];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(SBFolderIconZoomAnimator *)self targetIconView];
    BOOL v5 = [v3 matchMoveSourceViewForIconView:v4];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F39C00]);
      [v6 setDuration:INFINITY];
      [v6 setFillMode:*MEMORY[0x1E4F39FA0]];
      [v6 setRemovedOnCompletion:0];
      [v6 setAppliesY:0];
      double v7 = [v5 layer];
      [v6 setSourceLayer:v7];

      id v8 = [v5 window];
      BOOL v9 = [v5 window];
      [v9 bounds];
      objc_msgSend(v8, "convertPoint:toView:", v5, v10 * 0.5, 0.0);
      double v12 = v11;
      double v14 = v13;

      double v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v12, v14);
      v19[0] = v15;
      double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [v6 setSourcePoints:v16];

      id v17 = [(SBFolderIconZoomAnimator *)self defaultTargetIconContainerView];
      double v18 = [v17 layer];
      [v18 addAnimation:v6 forKey:@"SBFolderSourceViewTrackingMatchMoveAnimation"];
    }
  }
}

- (void)_setAnimationFraction:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBFolderIconZoomAnimator;
  -[SBScaleIconZoomAnimator _setAnimationFraction:](&v6, sel__setAnimationFraction_);
  BOOL v5 = [(SBFolderIconZoomAnimator *)self targetIconView];
  [v5 setFloatyFolderCrossfadeFraction:a3];

  [(SBIconAnimator *)self->_innerZoomAnimator setFraction:1.0 - a3];
}

- (void)_cleanupAnimation
{
  double v3 = [(SBFolderIconZoomAnimator *)self targetIconView];
  [v3 cleanupAfterFloatyFolderCrossfade];
  [v3 setIconGridImageAlpha:1.0];
  [(SBIconAnimator *)self->_innerZoomAnimator cleanup];
  innerZoomAnimator = self->_innerZoomAnimator;
  self->_innerZoomAnimator = 0;

  BOOL v5 = [(SBFolderIconZoomAnimator *)self searchGesture];
  [v5 removeObserver:self];

  [(SBFolderIconZoomAnimator *)self setSearchGesture:0];
  objc_super v6 = [(SBFolderIconZoomAnimator *)self defaultTargetIconContainerView];
  double v7 = [v6 layer];
  [v7 removeAnimationForKey:@"SBFolderSourceViewTrackingMatchMoveAnimation"];

  v8.receiver = self;
  v8.super_class = (Class)SBFolderIconZoomAnimator;
  [(SBScaleIconZoomAnimator *)&v8 _cleanupAnimation];
}

- (unint64_t)_numberOfSignificantAnimations
{
  v3.receiver = self;
  v3.super_class = (Class)SBFolderIconZoomAnimator;
  return [(SBScaleIconZoomAnimator *)&v3 _numberOfSignificantAnimations] + 2;
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  BOOL v7 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBFolderIconZoomAnimator;
  id v12 = a7;
  [(SBScaleIconZoomAnimator *)&v22 _performAnimationToFraction:a4 withCentralAnimationSettings:v7 delay:v12 alreadyAnimating:a3 sharedCompletion:a5];
  if (BSFloatIsZero()) {
    [(SBFolderIconZoomAnimator *)self _setupMatchMoveAnimation];
  }
  if (BSFloatIsOne())
  {
    double v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"SBIconZoomExpansionAnimationWillBeginNotification" object:self];
  }
  if ([(SBFolderIconZoomAnimator *)self shouldMatchMoveWithDock]) {
    [(SBFolderIconZoomAnimator *)self _updateDockMatchMoveWithFraction:a3];
  }
  double v14 = [(SBIconAnimator *)self settings];
  double v15 = v14;
  if (v7) {
    uint64_t v16 = 6;
  }
  else {
    uint64_t v16 = 2;
  }
  id v17 = (void *)MEMORY[0x1E4F4F898];
  double v18 = [v14 effectiveCrossfadeAnimationSettings];
  double v19 = [v18 BSAnimationSettings];
  double v20 = [v17 factoryWithSettings:v19];

  [v20 setAllowsAdditiveAnimations:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __125__SBFolderIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
  v21[3] = &unk_1E6AAC838;
  v21[4] = self;
  *(double *)&v21[5] = a3;
  [MEMORY[0x1E4F4F898] animateWithFactory:v20 additionalDelay:v16 options:v21 actions:v12 completion:a5];
  [(SBIconAnimator *)self->_innerZoomAnimator animateToFraction:v12 afterDelay:1.0 - a3 withCompletion:a5];
}

void __125__SBFolderIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) targetIconView];
  [v2 setFloatyFolderCrossfadeFraction:*(double *)(a1 + 40)];
}

- (CGRect)_zoomedFrame
{
  [(SBFolderView *)self->_innerFolderView scalingViewFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_forceSquareZoomDimension
{
  return 0;
}

- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4
{
  if (a4) {
    [(SBFolderIconZoomAnimator *)self _visuallyCompleteAnimationImmediately];
  }
}

- (void)_visuallyCompleteAnimationImmediately
{
  double v3 = [(SBFolderIconZoomAnimator *)self targetIconView];
  [v3 setHidden:1];

  id v4 = [(SBScaleIconZoomAnimator *)self referenceIconView];
  [v4 setAllIconElementsButLabelHidden:0];
}

- (BOOL)isAnimatingInFloatingDock
{
  return self->_isAnimatingInFloatingDock;
}

- (void)setIsAnimatingInFloatingDock:(BOOL)a3
{
  self->_isAnimatingInFloatingDock = a3;
}

- (void)setDockAnimationSettings:(id)a3
{
}

- (SBSearchGesture)searchGesture
{
  return self->_searchGesture;
}

- (void)setSearchGesture:(id)a3
{
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (void)setSearchPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_storeStrong((id *)&self->_dockAnimationSettings, 0);
  objc_storeStrong((id *)&self->_innerZoomAnimator, 0);
  objc_storeStrong((id *)&self->_innerFolderView, 0);
  objc_storeStrong((id *)&self->_innerFolderController, 0);
}

@end