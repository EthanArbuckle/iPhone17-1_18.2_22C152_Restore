@interface SBCrossfadeIconZoomAnimator
- (BOOL)fadesHomeScreen;
- (BOOL)masksCorners;
- (BOOL)performsTrueCrossfade;
- (CGPoint)_zoomedIconCenter;
- (CGRect)_zoomedFrame;
- (SBCrossfadeIconZoomAnimator)initWithFolderController:(id)a3 crossfadeView:(id)a4 icon:(id)a5;
- (double)_appSnapshotCornerRadiusForFraction:(double)a3;
- (double)maxHomeScreenZoomScale;
- (unint64_t)_numberOfSignificantAnimations;
- (void)_cleanupAnimation;
- (void)_cleanupZoom;
- (void)_delayedForRotation;
- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7;
- (void)_prepareAnimation;
- (void)_setAnimationFraction:(double)a3;
- (void)setMasksCorners:(BOOL)a3;
- (void)setPerformsTrueCrossfade:(BOOL)a3;
@end

@implementation SBCrossfadeIconZoomAnimator

- (SBCrossfadeIconZoomAnimator)initWithFolderController:(id)a3 crossfadeView:(id)a4 icon:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBCrossfadeIconZoomAnimator;
  v10 = [(SBScaleIconZoomAnimator *)&v13 initWithAnimationContainer:a3 targetIcon:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_crossfadeView, a4);
    [(SBCrossfadeIconZoomAnimator *)v11 _assertCrossfadeViewSizeIfNecessary];
    if ([(SBIconAnimator *)v11 _isDelayedForRotation]) {
      [(SBCrossfadeIconZoomAnimator *)v11 _delayedForRotation];
    }
  }

  return v11;
}

- (double)maxHomeScreenZoomScale
{
  return 3.0;
}

- (BOOL)fadesHomeScreen
{
  return 1;
}

- (void)_delayedForRotation
{
  [(UIView *)self->_crossfadeView setHidden:1];
  id v4 = [(SBIconAnimator *)self animationContainer];
  v3 = [v4 animationWindow];
  [v3 addSubview:self->_crossfadeView];
}

- (void)_prepareAnimation
{
  [(SBCrossfadeIconZoomAnimator *)self _assertCrossfadeViewSizeIfNecessary];
  [(UIView *)self->_crossfadeView setHidden:0];
  v24.receiver = self;
  v24.super_class = (Class)SBCrossfadeIconZoomAnimator;
  [(SBScaleIconZoomAnimator *)&v24 _prepareAnimation];
  [(SBCrossfadeIconZoomAnimator *)self _zoomedIconCenter];
  double v4 = v3;
  double v6 = v5;
  [(SBScaleIconZoomAnimator *)self zoomScale];
  double v8 = v7;
  [(SBCrossfadeIconZoomAnimator *)self _zoomedFrame];
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [(SBScaleIconZoomAnimator *)self targetIconView];
  [v13 iconImageVisibleSize];
  double v15 = v14;
  double v17 = v16;

  double v18 = v8 * v15;
  double v19 = v8 * v17;
  double v20 = 0.5;
  double v21 = 0.5;
  if ((SBFFloatEqualsFloat() & 1) == 0 && v10 > v18) {
    double v21 = (v4 + v18 * -0.5) / (v10 - v18);
  }
  if ((SBFFloatEqualsFloat() & 1) == 0 && v12 > v19) {
    double v20 = (v6 + v19 * -0.5) / (v12 - v19);
  }
  v22 = [(SBScaleIconZoomAnimator *)self targetIconView];
  if ([(SBCrossfadeIconZoomAnimator *)self performsTrueCrossfade]) {
    uint64_t v23 = 3;
  }
  else {
    uint64_t v23 = 1;
  }
  objc_msgSend(v22, "prepareToCrossfadeImageWithView:anchorPoint:options:", self->_crossfadeView, v23, v21, v20);
}

- (void)_setAnimationFraction:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBCrossfadeIconZoomAnimator;
  -[SBScaleIconZoomAnimator _setAnimationFraction:](&v6, sel__setAnimationFraction_);
  double v5 = [(SBScaleIconZoomAnimator *)self targetIconView];
  [v5 setCrossfadeFraction:a3];
  [(SBCrossfadeIconZoomAnimator *)self _appSnapshotCornerRadiusForFraction:a3];
  objc_msgSend(v5, "setCrossfadeCornerRadius:");
  [v5 setMorphFraction:a3];
}

- (void)_cleanupZoom
{
  double v3 = [(SBScaleIconZoomAnimator *)self targetIcon];
  double v4 = [(SBIconZoomAnimator *)self iconViewForIcon:v3];

  [v4 setIconImageAlpha:0.0];
  v5.receiver = self;
  v5.super_class = (Class)SBCrossfadeIconZoomAnimator;
  [(SBIconZoomAnimator *)&v5 _cleanupZoom];
}

- (void)_cleanupAnimation
{
  double v3 = [(SBScaleIconZoomAnimator *)self targetIcon];
  double v4 = [(SBIconZoomAnimator *)self iconViewForIcon:v3];

  [v4 setIconImageAlpha:1.0];
  [v4 cleanupAfterCrossfade];
  objc_super v5 = [(SBScaleIconZoomAnimator *)self targetIcon];
  objc_super v6 = [(SBIconZoomAnimator *)self iconViewForIcon:v5];
  [v6 setHidden:0];

  v7.receiver = self;
  v7.super_class = (Class)SBCrossfadeIconZoomAnimator;
  [(SBScaleIconZoomAnimator *)&v7 _cleanupAnimation];
}

- (unint64_t)_numberOfSignificantAnimations
{
  v3.receiver = self;
  v3.super_class = (Class)SBCrossfadeIconZoomAnimator;
  return [(SBScaleIconZoomAnimator *)&v3 _numberOfSignificantAnimations] + 2;
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  v40.receiver = self;
  v40.super_class = (Class)SBCrossfadeIconZoomAnimator;
  [(SBScaleIconZoomAnimator *)&v40 _performAnimationToFraction:a4 withCentralAnimationSettings:v7 delay:v12 alreadyAnimating:a3 sharedCompletion:a5];
  if (BSFloatIsZero())
  {
    objc_super v13 = [(SBIconAnimator *)self backgroundDarkeningView];
    double v14 = (void *)MEMORY[0x1E4FB1EB0];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
    v38[3] = &unk_1E6AAC810;
    id v39 = v13;
    id v15 = v13;
    [v14 animateWithDuration:0 delay:v38 options:0 animations:0.25 completion:a5];
  }
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    id v34 = v12;
    double v16 = [(SBIconAnimator *)self settings];
    double v17 = v16;
    if (v7) {
      uint64_t v18 = 6;
    }
    else {
      uint64_t v18 = 2;
    }
    double v19 = [v16 crossfadeSettings];
    double v20 = [v19 BSAnimationSettings];
    double v21 = (void *)[v20 mutableCopy];

    v22 = [v17 appSnapshotCornerRadiusSettings];
    uint64_t v23 = [v22 BSAnimationSettings];
    objc_super v24 = (void *)[v23 mutableCopy];

    v25 = [v17 effectiveMorphAnimationSettings];
    v26 = [v25 BSAnimationSettings];
    v27 = (void *)[v26 mutableCopy];

    if (v7)
    {
      [v21 setDelay:0.0];
      [v24 setDelay:0.0];
      [v27 setDelay:0.0];
    }
    v35 = v21;
    v28 = [MEMORY[0x1E4F4F898] factoryWithSettings:v21];
    v33 = v24;
    v29 = [MEMORY[0x1E4F4F898] factoryWithSettings:v24];
    v30 = [MEMORY[0x1E4F4F898] factoryWithSettings:v27];
    if (!v7 || BSFloatIsZero())
    {
      [v28 setAllowsAdditiveAnimations:1];
      [v29 setAllowsAdditiveAnimations:1];
      [v30 setAllowsAdditiveAnimations:1];
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2;
    v37[3] = &unk_1E6AAC838;
    v37[4] = self;
    *(double *)&v37[5] = a3;
    uint64_t v31 = v18;
    uint64_t v32 = v18;
    id v12 = v34;
    [MEMORY[0x1E4F4F898] animateWithFactory:v28 additionalDelay:v32 options:v37 actions:v34 completion:a5];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3;
    v36[3] = &unk_1E6AAC838;
    v36[4] = self;
    *(double *)&v36[5] = a3;
    [MEMORY[0x1E4F4F898] animateWithFactory:v30 additionalDelay:v31 options:v36 actions:v34 completion:a5];
  }
}

uint64_t __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) targetIconView];
  [v2 setCrossfadeFraction:*(double *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) targetIconView];
  [*(id *)(a1 + 32) _appSnapshotCornerRadiusForFraction:*(double *)(a1 + 40)];
  objc_msgSend(v3, "setCrossfadeCornerRadius:");
}

void __128__SBCrossfadeIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) targetIconView];
  [v2 setMorphFraction:*(double *)(a1 + 40)];
}

- (CGRect)_zoomedFrame
{
  [(UIView *)self->_crossfadeView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)_zoomedIconCenter
{
  double v3 = [(SBScaleIconZoomAnimator *)self targetIconView];
  [(SBScaleIconZoomAnimator *)self zoomScale];
  double v5 = v4;
  [(SBCrossfadeIconZoomAnimator *)self _zoomedFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v3 iconImageCenter];
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = [(SBIconAnimator *)self referenceView];
  objc_msgSend(v3, "convertPoint:toView:", v18, v15, v17);
  double v20 = v19;
  double v22 = v21;

  [v3 iconImageVisibleSize];
  double v24 = v5 * v23;
  double v37 = v5 * v25;
  v39.origin.x = v7;
  v39.origin.y = v9;
  v39.size.width = v11;
  v39.size.height = v13;
  double v26 = v24 * 0.5;
  double v27 = CGRectGetMinX(v39) + v24 * 0.5;
  v40.origin.x = v7;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.height = v13;
  double v28 = CGRectGetMaxX(v40) - v26;
  if (v27 >= v20) {
    double v29 = v27;
  }
  else {
    double v29 = v20;
  }
  if (v28 <= v29) {
    double v30 = v28;
  }
  else {
    double v30 = v29;
  }
  v41.origin.x = v7;
  v41.origin.y = v9;
  v41.size.width = v11;
  v41.size.height = v13;
  double v31 = v37 * 0.5 + CGRectGetMinY(v41);
  v42.origin.x = v7;
  v42.origin.y = v9;
  v42.size.width = v11;
  v42.size.height = v13;
  double v32 = CGRectGetMaxY(v42) - v37 * 0.5;
  if (v31 >= v22) {
    double v33 = v31;
  }
  else {
    double v33 = v22;
  }
  if (v32 <= v33) {
    double v34 = v32;
  }
  else {
    double v34 = v33;
  }

  double v35 = v30;
  double v36 = v34;
  result.y = v36;
  result.x = v35;
  return result;
}

- (double)_appSnapshotCornerRadiusForFraction:(double)a3
{
  double v4 = [(SBScaleIconZoomAnimator *)self targetIconView];
  [v4 iconImageInfo];
  double v6 = (1.0 - a3) * v5;

  return v6;
}

- (BOOL)performsTrueCrossfade
{
  return self->_performsTrueCrossfade;
}

- (void)setPerformsTrueCrossfade:(BOOL)a3
{
  self->_performsTrueCrossfade = a3;
}

- (BOOL)masksCorners
{
  return self->_masksCorners;
}

- (void)setMasksCorners:(BOOL)a3
{
  self->_masksCorners = a3;
}

- (void).cxx_destruct
{
}

@end