@interface SBCenterIconZoomAnimator
- (BOOL)animatingIcons;
- (BSInvalidatable)iconListViewOverridingLayoutDelegateAssertion;
- (CGPoint)cameraPosition;
- (CGPoint)iconListView:(id)a3 centerForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedCenter:(CGPoint)a6;
- (CGPoint)iconListView:(id)a3 originForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedOrigin:(CGPoint)a6;
- (SBCenterIconZoomAnimator)initWithFolderController:(id)a3;
- (SBDockOffscreenFractionModifying)dockOffscreenFractionModifier;
- (UIView)zoomView;
- (double)_iconZoomDelay;
- (double)_zPositionForView:(id)a3 center:(CGPoint)a4 andFraction:(double)a5;
- (double)centerCol;
- (double)centerRow;
- (id)_animationFactoryForDock;
- (id)_animationFactoryForFolderView;
- (id)_animationFactoryForIcon:(id)a3;
- (unint64_t)_numberOfSignificantAnimations;
- (void)_calculateCenters;
- (void)_calculateCentersAndCameraPosition;
- (void)_cleanupAnimation;
- (void)_cleanupAnimationIncludingDock:(BOOL)a3;
- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7;
- (void)_positionView:(id)a3 forIcon:(id)a4;
- (void)_prepareAnimation;
- (void)_setAnimationFraction:(double)a3;
- (void)_setAnimationFraction:(double)a3 withCenter:(CGPoint)a4;
- (void)_updateDockForFraction:(double)a3;
- (void)iconList:(id)a3 didAddIcon:(id)a4;
- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)setDockOffscreenFractionModifier:(id)a3;
- (void)setIconListViewOverridingLayoutDelegateAssertion:(id)a3;
@end

@implementation SBCenterIconZoomAnimator

- (SBCenterIconZoomAnimator)initWithFolderController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBCenterIconZoomAnimator;
  result = [(SBIconZoomAnimator *)&v4 initWithAnimationContainer:a3];
  if (result) {
    result->_iconZoomedZ = 0.0;
  }
  return result;
}

- (void)_prepareAnimation
{
  v39.receiver = self;
  v39.super_class = (Class)SBCenterIconZoomAnimator;
  [(SBIconZoomAnimator *)&v39 _prepareAnimation];
  self->_iconZoomedZ = SBHZPositionForScale(80.0, -0.00333333333);
  v3 = [(SBCenterIconZoomAnimator *)self folderController];
  objc_super v4 = [v3 innerFolderController];
  if (v4)
  {
    v5 = [v3 view];
    folderView = self->_folderView;
    self->_folderView = v5;
  }
  v7 = [(SBIconZoomAnimator *)self iconListView];
  v8 = [v7 addOverridingLayoutDelegate:self reason:@"CenterIconZoom"];
  [(SBCenterIconZoomAnimator *)self setIconListViewOverridingLayoutDelegateAssertion:v8];

  v9 = [v7 model];
  [v9 addListObserver:self];

  v10 = [SBHTouchPassThroughView alloc];
  [v7 bounds];
  v11 = -[SBHTouchPassThroughView initWithFrame:](v10, "initWithFrame:");
  zoomView = self->_zoomView;
  self->_zoomView = v11;

  [v7 addSubview:self->_zoomView];
  v13 = [(UIView *)self->_zoomView layer];
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v34[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v34[3] = v14;
  v34[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  uint64_t v15 = *(void *)(MEMORY[0x1E4F39B10] + 80);
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v34[0] = *MEMORY[0x1E4F39B10];
  v34[1] = v16;
  uint64_t v35 = v15;
  unint64_t v36 = 0xBF6B4E81B4E81B4FLL;
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v37 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v38 = v17;
  [v13 setSublayerTransform:v34];

  [(SBCenterIconZoomAnimator *)self _calculateCentersAndCameraPosition];
  [(UIView *)self->_zoomView frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [(UIView *)self->_zoomView bounds];
  double v28 = 0.5;
  double v29 = 0.5;
  if (v26 != 0.0) {
    double v29 = self->_cameraPosition.x / v26;
  }
  if (v27 != 0.0) {
    double v28 = self->_cameraPosition.y / v27;
  }
  v30 = [(UIView *)self->_zoomView layer];
  objc_msgSend(v30, "setAnchorPoint:", v29, v28);

  -[UIView setFrame:](self->_zoomView, "setFrame:", v19, v21, v23, v25);
  v31 = [(SBCenterIconZoomAnimator *)self folderController];
  v32 = [v31 beginModifyingDockOffscreenFractionForReason:@"SBCenterIconZoomDockFractionAnimatorReason"];

  [(SBCenterIconZoomAnimator *)self setDockOffscreenFractionModifier:v32];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __45__SBCenterIconZoomAnimator__prepareAnimation__block_invoke;
  v33[3] = &unk_1E6AAE280;
  v33[4] = self;
  [(SBIconZoomAnimator *)self enumerateIconsAndIconViewsWithHandler:v33];
  self->_animatingIcons = 1;
}

void __45__SBCenterIconZoomAnimator__prepareAnimation__block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    v7 = *(void **)(*(void *)(a1 + 32) + 152);
    id v8 = a3;
    id v9 = a2;
    [v7 addSubview:v8];
    [*(id *)(a1 + 32) _positionView:v8 forIcon:v9];
  }
}

- (void)_setAnimationFraction:(double)a3
{
}

- (void)_setAnimationFraction:(double)a3 withCenter:(CGPoint)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBCenterIconZoomAnimator__setAnimationFraction_withCenter___block_invoke;
  v6[3] = &unk_1E6AAE2A8;
  v6[4] = self;
  CGPoint v7 = a4;
  double v8 = a3;
  [(SBIconZoomAnimator *)self enumerateIconsAndIconViewsWithHandler:v6];
  [(UIView *)self->_folderView setAlpha:1.0 - a3];
  [(SBCenterIconZoomAnimator *)self _updateDockForFraction:a3];
}

void __61__SBCenterIconZoomAnimator__setAnimationFraction_withCenter___block_invoke(double *a1, uint64_t a2, void *a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    v6 = (void *)*((void *)a1 + 4);
    double v8 = a1[6];
    double v7 = a1[7];
    double v9 = a1[5];
    id v10 = a3;
    objc_msgSend(v6, "_zPositionForView:center:andFraction:", v10, v9, v8, v7);
    double v12 = v11;
    id v13 = [v10 layer];

    [v13 setZPosition:v12 * *(double *)(*((void *)a1 + 4) + 168)];
  }
}

- (void)_updateDockForFraction:(double)a3
{
  id v4 = [(SBCenterIconZoomAnimator *)self dockOffscreenFractionModifier];
  [v4 setDockOffscreenFraction:a3];
}

- (double)_zPositionForView:(id)a3 center:(CGPoint)a4 andFraction:(double)a5
{
  return a5;
}

- (void)_cleanupAnimation
{
  [(SBCenterIconZoomAnimator *)self _cleanupAnimationIncludingDock:1];
  v3.receiver = self;
  v3.super_class = (Class)SBCenterIconZoomAnimator;
  [(SBIconZoomAnimator *)&v3 _cleanupAnimation];
}

- (void)_cleanupAnimationIncludingDock:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SBIconZoomAnimator *)self iconListView];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__SBCenterIconZoomAnimator__cleanupAnimationIncludingDock___block_invoke;
  v10[3] = &unk_1E6AAE280;
  id v6 = v5;
  id v11 = v6;
  [(SBIconZoomAnimator *)self enumerateIconsAndIconViewsWithHandler:v10];
  double v7 = [(SBCenterIconZoomAnimator *)self iconListViewOverridingLayoutDelegateAssertion];
  [v7 invalidate];

  [(SBCenterIconZoomAnimator *)self setIconListViewOverridingLayoutDelegateAssertion:0];
  [(UIView *)self->_zoomView removeFromSuperview];
  zoomView = self->_zoomView;
  self->_zoomView = 0;

  if (v3)
  {
    double v9 = [(SBCenterIconZoomAnimator *)self dockOffscreenFractionModifier];
    [v9 invalidate];

    [(SBCenterIconZoomAnimator *)self setDockOffscreenFractionModifier:0];
  }
  self->_animatingIcons = 0;
}

void __59__SBCenterIconZoomAnimator__cleanupAnimationIncludingDock___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v10 = a2;
  id v7 = a3;
  double v8 = [v7 layer];
  [v8 setZPosition:0.0];

  if ((a4 & 1) == 0)
  {
    id v9 = [*(id *)(a1 + 32) displayedIconViewForIcon:v10];

    if (v9 == v7) {
      [*(id *)(a1 + 32) addSubview:v7];
    }
  }
}

- (unint64_t)_numberOfSignificantAnimations
{
  v8.receiver = self;
  v8.super_class = (Class)SBCenterIconZoomAnimator;
  BOOL v3 = [(SBIconZoomAnimator *)&v8 _numberOfSignificantAnimations];
  id v4 = &v3[[(SBIconZoomAnimator *)self listIconCount]];
  v5 = [(SBCenterIconZoomAnimator *)self folderController];
  unint64_t v6 = (unint64_t)&v4[[v5 hasDock]];

  return v6;
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  v31.receiver = self;
  v31.super_class = (Class)SBCenterIconZoomAnimator;
  [(SBIconZoomAnimator *)&v31 _performAnimationToFraction:a4 withCentralAnimationSettings:v7 delay:v12 alreadyAnimating:a3 sharedCompletion:a5];
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    [(SBCenterIconZoomAnimator *)self _iconZoomDelay];
    double v14 = v13 + a5;
    if (v7) {
      double v15 = 0.0;
    }
    else {
      double v15 = v14;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
    v26[3] = &unk_1E6AAE2D0;
    v26[4] = self;
    double v28 = v15;
    if (v7) {
      uint64_t v16 = 6;
    }
    else {
      uint64_t v16 = 2;
    }
    uint64_t v29 = v16;
    double v30 = a3;
    id v17 = v12;
    id v27 = v17;
    [(SBIconZoomAnimator *)self enumerateIconsAndIconViewsWithHandler:v26];
    double v18 = [(SBCenterIconZoomAnimator *)self folderController];
    int v19 = [v18 hasDock];

    if (v19)
    {
      double v20 = (void *)MEMORY[0x1E4F4F898];
      double v21 = [(SBCenterIconZoomAnimator *)self _animationFactoryForDock];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3;
      v25[3] = &unk_1E6AAC838;
      v25[4] = self;
      *(double *)&v25[5] = a3;
      [v20 animateWithFactory:v21 additionalDelay:v16 options:v25 actions:v17 completion:v15];
    }
    if (self->_folderView)
    {
      double v22 = (void *)MEMORY[0x1E4F4F898];
      double v23 = [(SBCenterIconZoomAnimator *)self _animationFactoryForFolderView];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4;
      v24[3] = &unk_1E6AAC838;
      v24[4] = self;
      *(double *)&v24[5] = a3;
      [v22 animateWithFactory:v23 additionalDelay:v16 options:v24 actions:v15];
    }
  }
}

void __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id v7 = a3;
  if ((a4 & 1) == 0)
  {
    objc_super v8 = (void *)MEMORY[0x1E4F4F898];
    id v9 = [*(id *)(a1 + 32) _animationFactoryForIcon:a2];
    double v10 = *(double *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2;
    v15[3] = &unk_1E6AADF50;
    id v12 = v7;
    uint64_t v18 = *(void *)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v16 = v12;
    uint64_t v17 = v14;
    [v8 animateWithFactory:v9 additionalDelay:v11 options:v15 actions:v13 completion:v10];
  }
}

void __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 setZPosition:*(double *)(a1 + 48) * *(double *)(*(void *)(a1 + 40) + 168)];
}

void __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dockOffscreenFractionModifier];
  [v2 setDockOffscreenFraction:*(double *)(a1 + 40)];
}

uint64_t __125__SBCenterIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) setAlpha:1.0 - *(double *)(a1 + 40)];
}

- (double)_iconZoomDelay
{
  return 0.0;
}

- (CGPoint)iconListView:(id)a3 originForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedOrigin:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v9 = a3;
  id v10 = [(SBIconZoomAnimator *)self iconListView];

  if (v10 == v9)
  {
    -[UIView convertPoint:fromView:](self->_zoomView, "convertPoint:fromView:", v9, x, y);
    double x = v11;
    double y = v12;
  }

  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)iconListView:(id)a3 centerForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedCenter:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v9 = a3;
  id v10 = [(SBIconZoomAnimator *)self iconListView];

  if (v10 == v9)
  {
    -[UIView convertPoint:fromView:](self->_zoomView, "convertPoint:fromView:", v9, x, y);
    double x = v11;
    double y = v12;
  }

  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [(SBIconZoomAnimator *)self iconListView];
  id v8 = [v7 model];

  if (v8 == v6)
  {
    id v9 = [(SBIconZoomAnimator *)self iconViewForIcon:v10];
    [(SBCenterIconZoomAnimator *)self _positionView:v9 forIcon:v10];
  }
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v11 = a5;
  id v7 = a3;
  id v8 = [(SBIconZoomAnimator *)self iconListView];
  id v9 = [v8 model];

  if (v9 == v7)
  {
    id v10 = [(SBIconZoomAnimator *)self iconViewForIcon:v11];
    [(SBCenterIconZoomAnimator *)self _positionView:v10 forIcon:v11];
  }
}

- (void)_positionView:(id)a3 forIcon:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(SBIconZoomAnimator *)self iconListView];
  [v7 centerForIcon:v6];
  double v9 = v8;
  double v11 = v10;

  -[UIView convertPoint:fromView:](self->_zoomView, "convertPoint:fromView:", v7, v9, v11);
  objc_msgSend(v12, "setCenter:");
}

- (id)_animationFactoryForIcon:(id)a3
{
  id v4 = a3;
  v5 = [(SBIconAnimator *)self settings];
  id v6 = [v5 centralAnimationSettings];
  if ([v5 distanceEffect])
  {
    id v7 = [(SBIconZoomAnimator *)self iconListView];
    uint64_t v8 = [v7 coordinateForIcon:v4];
    uint64_t v10 = v9;

    if (SBIconCoordinateIsNotFound(v8, v10)) {
      unint64_t v11 = 0;
    }
    else {
      unint64_t v11 = (unint64_t)(floor(vabdd_f64((double)v10, self->_centerRow))
    }
                             + floor(vabdd_f64((double)v8, self->_centerCol)));
    [v6 mass];
    double v13 = v12;
    [v5 firstHopIncrement];
    if (v11)
    {
      double v15 = v14;
      if (v14 > 0.0)
      {
        unint64_t v16 = 1;
        do
        {
          double v13 = v13 + v15 * (double)[v5 distanceEffect];
          [v5 hopIncrementAcceleration];
          if (v16 >= v11) {
            break;
          }
          double v15 = v15 + v17;
          ++v16;
        }
        while (v15 > 0.0);
      }
    }
    if (v13 < 0.1) {
      double v13 = 0.1;
    }
    [v6 mass];
    if (v13 != v18)
    {
      int v19 = (void *)[v6 copy];

      [v19 setMass:v13];
      id v6 = v19;
    }
  }
  double v20 = (void *)MEMORY[0x1E4F4F898];
  double v21 = [v6 BSAnimationSettings];
  double v22 = [v20 factoryWithSettings:v21];

  [v22 setAllowsAdditiveAnimations:1];
  return v22;
}

- (id)_animationFactoryForDock
{
  id v2 = [(SBIconAnimator *)self settings];
  BOOL v3 = [v2 centralAnimationSettings];
  [v2 dockMass];
  double v5 = v4;
  [v3 mass];
  if (v6 != v5)
  {
    id v7 = (void *)[v3 copy];

    [v7 setMass:v5];
    BOOL v3 = v7;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F4F898];
  uint64_t v9 = [v3 BSAnimationSettings];
  uint64_t v10 = [v8 factoryWithSettings:v9];

  [v10 setAllowsAdditiveAnimations:1];
  return v10;
}

- (id)_animationFactoryForFolderView
{
  id v2 = (void *)MEMORY[0x1E4F4F898];
  BOOL v3 = [(SBIconAnimator *)self settings];
  double v4 = [v3 centralAnimationSettings];
  double v5 = [v4 BSAnimationSettings];
  double v6 = [v2 factoryWithSettings:v5];

  [v6 setAllowsAdditiveAnimations:1];
  return v6;
}

- (void)_calculateCenters
{
  id v30 = [(SBIconZoomAnimator *)self iconListView];
  unint64_t v3 = [v30 iconColumnsForCurrentOrientation];
  unint64_t v4 = [v30 iconRowsForCurrentOrientation];
  double v5 = [(SBIconAnimator *)self settings];
  int v6 = [v5 preferCenterOfIconGrid];

  if (v6)
  {
    if (v3) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.5;
    }
    self->_centerCol = v7 + (double)(v3 >> 1);
    double v8 = (double)(v4 >> 1);
    uint64_t v9 = 176;
    double v10 = v8 + 1.0;
    double v11 = v8 + 0.5;
    if (v4) {
      double v12 = v10;
    }
    else {
      double v12 = v11;
    }
  }
  else
  {
    double v13 = [v30 window];
    [v13 center];
    double v15 = v14;
    double v17 = v16;

    double v18 = [v30 window];
    objc_msgSend(v30, "convertPoint:fromView:", v18, v15, v17);
    double v20 = v19;
    double v22 = v21;

    objc_msgSend(v30, "fractionalCoordinateAtPoint:", v20, v22);
    double v12 = round(v23 + v23) * 0.5;
    char v24 = BSFloatEqualToFloat();
    double v25 = [(SBIconAnimator *)self settings];
    [v25 centerRowCoordinate];
    if (v24)
    {
      self->_double centerRow = floor(v26) + 0.5;

      if (__sb__runningInSpringBoard())
      {
        BOOL v27 = SBFEffectiveDeviceClass() == 2;
      }
      else
      {
        double v28 = [MEMORY[0x1E4FB16C8] currentDevice];
        BOOL v27 = [v28 userInterfaceIdiom] == 1;
      }
      if (v27) {
        double v12 = v12 + -0.25;
      }
    }
    else
    {
      self->_double centerRow = v26;
    }
    uint64_t v9 = 184;
  }
  *(double *)((char *)&self->super.super.super.isa + v9) = v12;
  double centerRow = self->_centerRow;
  if (centerRow >= (double)v4)
  {
    do
      double centerRow = centerRow + -1.0;
    while (centerRow >= (double)v4);
    self->_double centerRow = centerRow;
  }
}

- (void)_calculateCentersAndCameraPosition
{
  id v20 = [(SBIconZoomAnimator *)self iconListView];
  [(SBCenterIconZoomAnimator *)self _calculateCenters];
  uint64_t v3 = vcvtmd_s64_f64(self->_centerCol);
  if (v3 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  objc_msgSend(v20, "centerForIconCoordinate:", v4, 1);
  double v6 = v5;
  uint64_t v7 = vcvtpd_s64_f64(self->_centerCol);
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  objc_msgSend(v20, "centerForIconCoordinate:", v8, 1);
  double v10 = (v6 + v9) * 0.5;
  uint64_t v11 = vcvtmd_s64_f64(self->_centerRow);
  if (v11 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v11;
  }
  objc_msgSend(v20, "centerForIconCoordinate:", 1, v12);
  double v14 = v13;
  uint64_t v15 = vcvtpd_s64_f64(self->_centerRow);
  if (v15 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v15;
  }
  objc_msgSend(v20, "centerForIconCoordinate:", 1, v16);
  objc_msgSend(v20, "convertPoint:toView:", self->_zoomView, v10, (v14 + v17) * 0.5);
  self->_cameraPosition.double x = v18;
  self->_cameraPosition.double y = v19;
}

- (SBDockOffscreenFractionModifying)dockOffscreenFractionModifier
{
  return self->_dockOffscreenFractionModifier;
}

- (void)setDockOffscreenFractionModifier:(id)a3
{
}

- (BSInvalidatable)iconListViewOverridingLayoutDelegateAssertion
{
  return self->_iconListViewOverridingLayoutDelegateAssertion;
}

- (void)setIconListViewOverridingLayoutDelegateAssertion:(id)a3
{
}

- (UIView)zoomView
{
  return self->_zoomView;
}

- (CGPoint)cameraPosition
{
  double x = self->_cameraPosition.x;
  double y = self->_cameraPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)centerRow
{
  return self->_centerRow;
}

- (double)centerCol
{
  return self->_centerCol;
}

- (BOOL)animatingIcons
{
  return self->_animatingIcons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconListViewOverridingLayoutDelegateAssertion, 0);
  objc_storeStrong((id *)&self->_dockOffscreenFractionModifier, 0);
  objc_storeStrong((id *)&self->_folderView, 0);
  objc_storeStrong((id *)&self->_zoomView, 0);
}

@end