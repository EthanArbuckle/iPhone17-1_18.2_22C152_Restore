@interface SBHWidgetInsertionRippleIconAnimator
- (BOOL)keepsJumpingIconAboveListViewAsLongAsPossible;
- (CGPoint)_centerOfIconViewAssumingCenteredAnchorPoint:(id)a3;
- (SBHWidgetInsertionRippleIconAnimator)initWithIconListView:(id)a3 widgetIcon:(id)a4 referenceLayout:(id)a5 referenceIconView:(id)a6 additionalIconListView:(id)a7 preludeBlock:(id)a8;
- (void)_createPortalViewsForIconViews;
- (void)_createPortalViewsForIconViewsInIconListView:(id)a3 dropIconListView:(id)a4 withPortalContainerView:(id)a5 widgetIconCenter:(CGPoint)a6;
- (void)_displayLinkFired:(id)a3;
- (void)_finishRippleAnimation;
- (void)_finishRippleAnimationEarlyForIconView:(id)a3;
- (void)_layoutRippleIconViews;
- (void)_performJumpAnimationWithCompletion:(id)a3;
- (void)_performWidgetIconScaleOvershootAnimation;
- (void)_playImpactHapticAfterDelay:(double)a3;
- (void)_reparentPortalViewIntoIconListViewAfterDelay:(double)a3;
- (void)_reparentPortalViewIntoIconListViewNow;
- (void)_startRippleAnimationNow;
- (void)_startRippleAnimationWithDelay:(double)a3;
- (void)animateWithCompletion:(id)a3;
- (void)setKeepsJumpingIconAboveListViewAsLongAsPossible:(BOOL)a3;
@end

@implementation SBHWidgetInsertionRippleIconAnimator

- (SBHWidgetInsertionRippleIconAnimator)initWithIconListView:(id)a3 widgetIcon:(id)a4 referenceLayout:(id)a5 referenceIconView:(id)a6 additionalIconListView:(id)a7 preludeBlock:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id obj = a6;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v64.receiver = self;
  v64.super_class = (Class)SBHWidgetInsertionRippleIconAnimator;
  v21 = [(SBHWidgetInsertionRippleIconAnimator *)&v64 init];
  if (v21)
  {
    v59 = v18;
    v22 = [v15 gridCellInfo];
    unint64_t v63 = [v22 numberOfUsedColumns];
    v57 = v22;
    uint64_t v23 = [v22 numberOfUsedRows];
    id v60 = v16;
    id v62 = v17;
    v58 = v20;
    if (v19)
    {
      v24 = [v19 model];
      if ([v24 numberOfIcons])
      {
        unsigned __int16 v25 = [v24 gridSize];
        unint64_t v26 = v63;
        if (v63 <= v25) {
          unint64_t v26 = v25;
        }
        unint64_t v63 = v26;
        unint64_t v27 = [v24 gridSize] >> 16;
        uint64_t v28 = SBIconCoordinateMake(0, v27);
        objc_msgSend(v19, "centerForIconCoordinate:", v28, v29);
        objc_msgSend(v15, "convertPoint:fromView:", v19);
        objc_msgSend(v15, "fractionalCoordinateAtPoint:");
        unint64_t v31 = vcvtpd_u64_f64(v30);
        if (v23 + v27 <= v31) {
          uint64_t v23 = v31;
        }
        else {
          v23 += v27;
        }
        [v19 frame];
        double v33 = v32;
        [v15 frame];
        if (v33 < v34) {
          v21->_rowOffset = v27;
        }
        id v16 = v60;
      }
      else
      {

        v24 = 0;
      }

      id v17 = v62;
    }
    v35 = SBHIconListLayoutIconGridSizeClassSizes(v17, [v15 orientation]);
    v36 = [v16 gridSizeClass];
    unsigned int v37 = [v35 gridSizeForGridSizeClass:v36] >> 16;

    v21->_widgetIconSizeIsLarge = v37 >= [v35 gridSizeForGridSizeClass:@"SBHIconGridSizeClassLarge"] >> 16;
    v38 = [v15 iconLocation];
    int v39 = [v38 isEqualToString:@"SBIconLocationStackConfiguration"];

    if (v39)
    {
      BOOL v40 = 0;
      BOOL v41 = !v21->_widgetIconSizeIsLarge;
      uint64_t v42 = 8;
    }
    else
    {
      v43 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v44 = [v43 userInterfaceIdiom];

      BOOL v41 = (v44 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      BOOL v40 = v41;
      uint64_t v42 = 2;
    }
    if (v41) {
      uint64_t v45 = 4;
    }
    else {
      uint64_t v45 = v42;
    }
    v46 = [[SBHRippleSimulation alloc] initWithRows:v23 columns:v63 resolution:v45 style:v40];
    rippleSimulation = v21->_rippleSimulation;
    v21->_rippleSimulation = v46;

    objc_storeStrong((id *)&v21->_iconListView, a3);
    objc_storeStrong((id *)&v21->_widgetIcon, a4);
    objc_storeStrong((id *)&v21->_additionalIconListView, a7);
    v21->_startedAnimation = 0;
    objc_storeStrong((id *)&v21->_referenceIconView, obj);
    v48 = [v15 window];
    id v18 = v59;
    objc_msgSend(v59, "convertPoint:toView:", v48, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    v21->_referenceIconViewOriginInWindow.x = v49;
    v21->_referenceIconViewOriginInWindow.y = v50;

    v51 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v52 = [v51 widgetSettings];
    settings = v21->_settings;
    v21->_settings = (SBHWidgetSettings *)v52;

    id v20 = v58;
    uint64_t v54 = [v58 copy];
    id preludeBlock = v21->_preludeBlock;
    v21->_id preludeBlock = (id)v54;

    id v16 = v60;
    id v17 = v62;
  }

  return v21;
}

- (void)animateWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_startedAnimation)
  {
    id v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_startedAnimation == NO"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBHWidgetInsertionRippleIconAnimator animateWithCompletion:](a2);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8037990);
  }
  v6 = v5;
  id preludeBlock = (void (**)(void))self->_preludeBlock;
  if (preludeBlock) {
    preludeBlock[2]();
  }
  self->_startedAnimation = 1;
  v8 = _Block_copy(v6);
  id animationCompletion = self->_animationCompletion;
  self->_id animationCompletion = v8;

  v10 = self->_iconListView;
  [(SBIconListView *)v10 layoutIconsIfNeededWithAnimationType:1 options:0];
  v11 = [(SBIconListView *)v10 iconViewForIcon:self->_widgetIcon];
  widgetIconView = self->_widgetIconView;
  self->_widgetIconView = v11;

  v13 = SBLogWidgets();
  if (os_signpost_enabled(v13))
  {
    v14 = [(SBWidgetIcon *)self->_widgetIcon activeWidget];
    *(_DWORD *)buf = 138543362;
    id v20 = v14;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_RIPPLE_ANIMATION", "activeWidget=%{public, name=activeWidget}@", buf, 0xCu);
  }
  [(SBHWidgetSettings *)self->_settings dropInsertionImpactDelay];
  if (self->_referenceIconView)
  {
    [(SBHWidgetInsertionRippleIconAnimator *)self _performJumpAnimationWithCompletion:0];
    [(SBHWidgetSettings *)self->_settings animatedInsertionImpactDelay];
    double v17 = v16;
  }
  else
  {
    double v17 = v15;
    [(SBHWidgetInsertionRippleIconAnimator *)self _performWidgetIconScaleOvershootAnimation];
  }
  [(SBHWidgetInsertionRippleIconAnimator *)self _playImpactHapticAfterDelay:v17];
  [(SBHWidgetInsertionRippleIconAnimator *)self _startRippleAnimationWithDelay:v17];
}

- (void)_performWidgetIconScaleOvershootAnimation
{
  [(SBHWidgetSettings *)self->_settings dropInsertionImpactScale];
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, v3, v3);
  v4 = (void *)MEMORY[0x1E4FB1EB0];
  [(SBHWidgetSettings *)self->_settings dropInsertionSlamDuration];
  double v6 = v5;
  [(SBHWidgetSettings *)self->_settings dropInsertionSlamDelay];
  double v8 = v7;
  [(SBHWidgetSettings *)self->_settings dropInsertionSlamDampingRatio];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  CGAffineTransform v18 = v19;
  v17[2] = __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke;
  v17[3] = &unk_1E6AAFE30;
  v17[4] = self;
  [v4 animateWithDuration:0 delay:v17 usingSpringWithDamping:0 initialSpringVelocity:v6 options:v8 animations:v9 completion:0.0];
  v10 = (void *)MEMORY[0x1E4FB1EB0];
  [(SBHWidgetSettings *)self->_settings dropInsertionScaleResetDuration];
  double v12 = v11;
  [(SBHWidgetSettings *)self->_settings dropInsertionScaleResetDelay];
  double v14 = v13;
  [(SBHWidgetSettings *)self->_settings dropInsertionScaleResetDampingRatio];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_3;
  v16[3] = &unk_1E6AAC810;
  v16[4] = self;
  [v10 animateWithDuration:0 delay:v16 usingSpringWithDamping:0 initialSpringVelocity:v12 options:v14 animations:v15 completion:0.0];
}

uint64_t __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_2;
  v5[3] = &unk_1E6AAFE30;
  v5[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v5, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
}

uint64_t __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 48);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_3(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_4;
  _OWORD v4[3] = &unk_1E6AAC810;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __81__SBHWidgetInsertionRippleIconAnimator__performWidgetIconScaleOvershootAnimation__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 48);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (CGPoint)_centerOfIconViewAssumingCenteredAnchorPoint:(id)a3
{
  id v3 = a3;
  v4 = [v3 layer];
  [v4 anchorPoint];
  double v6 = v5;
  double v8 = v7;

  [v3 bounds];
  double v10 = v9;
  double v12 = v11;
  [v3 center];
  double v14 = v13;
  double v16 = v15;

  double v17 = 0.5 - v6;
  double v18 = 0.5 - v8;
  if (BSFloatIsZero()) {
    double v19 = v14;
  }
  else {
    double v19 = v14 + v17 * v10;
  }
  if (BSFloatIsZero()) {
    double v20 = v16;
  }
  else {
    double v20 = v16 + v18 * v12;
  }
  double v21 = v19;
  result.y = v20;
  result.x = v21;
  return result;
}

- (void)_createPortalViewsForIconViewsInIconListView:(id)a3 dropIconListView:(id)a4 withPortalContainerView:(id)a5 widgetIconCenter:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __143__SBHWidgetInsertionRippleIconAnimator__createPortalViewsForIconViewsInIconListView_dropIconListView_withPortalContainerView_widgetIconCenter___block_invoke;
  v17[3] = &unk_1E6AB00B0;
  v17[4] = self;
  id v18 = v11;
  CGFloat v21 = x;
  CGFloat v22 = y;
  id v19 = v12;
  id v20 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  [v16 enumerateIconViewsUsingBlock:v17];
}

void __143__SBHWidgetInsertionRippleIconAnimator__createPortalViewsForIconViewsInIconListView_dropIconListView_withPortalContainerView_widgetIconCenter___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 icon];
  char v4 = [v3 isEqual:*(void *)(*(void *)(a1 + 32) + 40)];

  if ((v4 & 1) == 0)
  {
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB2248]) initWithSourceView:v14];
    [*(id *)(a1 + 32) _centerOfIconViewAssumingCenteredAnchorPoint:v14];
    double v8 = *(void **)(a1 + 48);
    if (*(void **)(a1 + 40) != v8) {
      objc_msgSend(v8, "convertPoint:fromView:");
    }
    objc_msgSend(v5, "setCenter:", v6 - *(double *)(a1 + 64), v7 - *(double *)(a1 + 72));
    [v5 setHidesSourceView:1];
    [v5 setMatchesTransform:1];
    [v5 setAllowsBackdropGroups:1];
    [*(id *)(a1 + 56) addSubview:v5];
    [v14 addObserver:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 88) setObject:v5 forKey:v14];
    [v14 center];
    double v10 = *(void **)(a1 + 40);
    double v9 = *(void **)(a1 + 48);
    if (v10 != v9)
    {
      objc_msgSend(v9, "convertPoint:fromView:");
      double v10 = *(void **)(a1 + 48);
    }
    objc_msgSend(v10, "fractionalCoordinateAtPoint:");
    id v11 = *(void **)(*(void *)(a1 + 32) + 96);
    id v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:");
    id v13 = [v14 icon];
    [v11 setObject:v12 forKey:v13];
  }
}

- (void)_createPortalViewsForIconViews
{
  id v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  portalViewsForIconViews = self->_portalViewsForIconViews;
  self->_portalViewsForIconViews = v3;

  double v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  gridCoordinateForIcons = self->_gridCoordinateForIcons;
  self->_gridCoordinateForIcons = v5;

  double v7 = self->_iconListView;
  [(SBHWidgetInsertionRippleIconAnimator *)self _centerOfIconViewAssumingCenteredAnchorPoint:self->_widgetIconView];
  double v9 = v8;
  double v11 = v10;
  id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v13 = *MEMORY[0x1E4F1DB28];
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v17 = (UIView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], v14, v15, v16);
  rippleIconsPortalContainerView = self->_rippleIconsPortalContainerView;
  self->_rippleIconsPortalContainerView = v17;

  -[UIView setCenter:](self->_rippleIconsPortalContainerView, "setCenter:", v9, v11);
  [(SBIconListView *)v7 addSubview:self->_rippleIconsPortalContainerView];
  id v19 = [(UIView *)self->_rippleIconsPortalContainerView layer];
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v36 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v39 = v36;
  long long v40 = v35;
  long long v34 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v41 = v34;
  uint64_t v20 = *(void *)(MEMORY[0x1E4F39B10] + 80);
  long long v32 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v33 = *MEMORY[0x1E4F39B10];
  long long v37 = *MEMORY[0x1E4F39B10];
  long long v38 = v32;
  uint64_t v42 = v20;
  unint64_t v43 = 0xBF58904FD503744BLL;
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v44 = v31;
  long long v45 = v30;
  [v19 setSublayerTransform:&v37];

  -[SBHWidgetInsertionRippleIconAnimator _createPortalViewsForIconViewsInIconListView:dropIconListView:withPortalContainerView:widgetIconCenter:](self, "_createPortalViewsForIconViewsInIconListView:dropIconListView:withPortalContainerView:widgetIconCenter:", v7, v7, self->_rippleIconsPortalContainerView, v9, v11);
  additionalIconListView = self->_additionalIconListView;
  if (additionalIconListView)
  {
    CGFloat v22 = additionalIconListView;
    -[SBIconListView convertPoint:fromView:](v22, "convertPoint:fromView:", v7, v9, v11);
    double v24 = v23;
    double v26 = v25;
    unint64_t v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v13, v14, v15, v16);
    rippleIconsPortalContainerViewForAdditionalIconListView = self->_rippleIconsPortalContainerViewForAdditionalIconListView;
    self->_rippleIconsPortalContainerViewForAdditionalIconListView = v27;

    -[UIView setCenter:](self->_rippleIconsPortalContainerViewForAdditionalIconListView, "setCenter:", v24, v26);
    [(SBIconListView *)v22 addSubview:self->_rippleIconsPortalContainerViewForAdditionalIconListView];
    uint64_t v29 = [(UIView *)self->_rippleIconsPortalContainerViewForAdditionalIconListView layer];
    long long v39 = v36;
    long long v40 = v35;
    long long v41 = v34;
    long long v37 = v33;
    long long v38 = v32;
    uint64_t v42 = v20;
    unint64_t v43 = 0xBF58904FD503744BLL;
    long long v44 = v31;
    long long v45 = v30;
    [v29 setSublayerTransform:&v37];

    -[SBHWidgetInsertionRippleIconAnimator _createPortalViewsForIconViewsInIconListView:dropIconListView:withPortalContainerView:widgetIconCenter:](self, "_createPortalViewsForIconViewsInIconListView:dropIconListView:withPortalContainerView:widgetIconCenter:", v22, v7, self->_rippleIconsPortalContainerViewForAdditionalIconListView, v9, v11);
  }
}

- (void)_startRippleAnimationWithDelay:(double)a3
{
  UIAnimationDragCoefficient();
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * a3 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SBHWidgetInsertionRippleIconAnimator__startRippleAnimationWithDelay___block_invoke;
  block[3] = &unk_1E6AAC810;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __71__SBHWidgetInsertionRippleIconAnimator__startRippleAnimationWithDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startRippleAnimationNow];
}

- (void)_startRippleAnimationNow
{
  [(CADisplayLink *)self->_displayLink invalidate];
  id v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFired_];
  displayLink = self->_displayLink;
  self->_displayLink = v3;

  float v5 = self->_displayLink;
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CADisplayLink setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", *(double *)&v10.minimum, *(double *)&v10.maximum, *(double *)&v10.preferred);
  [(CADisplayLink *)self->_displayLink setHighFrameRateReason:1114119];
  dispatch_time_t v6 = self->_displayLink;
  double v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

  [(SBHWidgetInsertionRippleIconAnimator *)self _createPortalViewsForIconViews];
  [(SBIconView *)self->_widgetIconView center];
  -[SBIconListView fractionalCoordinateAtPoint:](self->_iconListView, "fractionalCoordinateAtPoint:");
  rippleSimulation = self->_rippleSimulation;
  -[SBHRippleSimulation createRippleAtGridCoordinate:strength:](rippleSimulation, "createRippleAtGridCoordinate:strength:");
}

- (void)_finishRippleAnimationEarlyForIconView:(id)a3
{
  char v4 = (SBIconView *)a3;
  if (self->_widgetIconView != v4)
  {
    float v5 = [(NSMapTable *)self->_portalViewsForIconViews objectForKey:v4];
    [(NSMapTable *)self->_portalViewsForIconViews removeObjectForKey:v4];
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  float v5 = self->_widgetIconPortalView;
  widgetIconPortalView = self->_widgetIconPortalView;
  self->_widgetIconPortalView = 0;

  if (v5)
  {
LABEL_3:
    [(_UIPortalView *)v5 setSourceView:0];
    [(_UIPortalView *)v5 removeFromSuperview];
  }
LABEL_4:
  dispatch_time_t v6 = SBLogWidgets();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)double v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_RIPPLE_ANIMATION", "EndedEarly=YES isAnimation=YES ", v8, 2u);
  }
}

- (void)_finishRippleAnimation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  [(SBIconView *)self->_widgetIconView removeObserver:self];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  char v4 = [(NSMapTable *)self->_portalViewsForIconViews objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v9 setSourceView:0];
        [v9 removeFromSuperview];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  CAFrameRateRange v10 = [(NSMapTable *)self->_portalViewsForIconViews keyEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * j) removeObserver:self];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v12);
  }

  [(NSMapTable *)self->_portalViewsForIconViews removeAllObjects];
  portalViewsForIconViews = self->_portalViewsForIconViews;
  self->_portalViewsForIconViews = 0;

  [(NSMapTable *)self->_gridCoordinateForIcons removeAllObjects];
  gridCoordinateForIcons = self->_gridCoordinateForIcons;
  self->_gridCoordinateForIcons = 0;

  [(UIView *)self->_rippleIconsPortalContainerView removeFromSuperview];
  rippleIconsPortalContainerView = self->_rippleIconsPortalContainerView;
  self->_rippleIconsPortalContainerView = 0;

  [(UIView *)self->_rippleIconsPortalContainerViewForAdditionalIconListView removeFromSuperview];
  rippleIconsPortalContainerViewForAdditionalIconListView = self->_rippleIconsPortalContainerViewForAdditionalIconListView;
  self->_rippleIconsPortalContainerViewForAdditionalIconListView = 0;

  [(UIView *)self->_portalContainerView removeFromSuperview];
  portalContainerView = self->_portalContainerView;
  self->_portalContainerView = 0;

  uint64_t v20 = SBLogWidgets();
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)CGFloat v22 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_RIPPLE_ANIMATION", " isAnimation=YES ", v22, 2u);
  }

  id animationCompletion = (void (**)(id, uint64_t))self->_animationCompletion;
  if (animationCompletion) {
    animationCompletion[2](animationCompletion, 1);
  }
}

- (void)_layoutRippleIconViews
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = self->_iconListView;
  char v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];
  objc_msgSend(v4, "bs_safeAddObject:", self->_additionalIconListView);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        CAFrameRateRange v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __62__SBHWidgetInsertionRippleIconAnimator__layoutRippleIconViews__block_invoke;
        v11[3] = &unk_1E6AAEB78;
        v11[4] = self;
        [v10 enumerateIconViewsUsingBlock:v11];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void __62__SBHWidgetInsertionRippleIconAnimator__layoutRippleIconViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKey:v3];
  if (v4)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 96);
    uint64_t v6 = [v3 icon];
    uint64_t v7 = [v5 objectForKey:v6];
    [v7 CGPointValue];
    double v9 = v8;
    double v11 = v10;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "zPositionForGridCoordinate:", v9, v11);
    double v13 = v12;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v14 = *(void **)(*(void *)(a1 + 32) + 136);
    if (v14) {
      objc_msgSend(v14, "transformForGridCoordinate:", v9, v11);
    }
    long long v15 = [v4 layer];
    [v15 setZPosition:v13];

    double v16 = [v4 layer];
    v17[4] = v22;
    void v17[5] = v23;
    v17[6] = v24;
    v17[7] = v25;
    v17[0] = v18;
    v17[1] = v19;
    v17[2] = v20;
    v17[3] = v21;
    [v16 setTransform:v17];
  }
}

- (void)_displayLinkFired:(id)a3
{
  rippleSimulation = self->_rippleSimulation;
  [a3 duration];
  -[SBHRippleSimulation step:](rippleSimulation, "step:");
  [(SBHWidgetInsertionRippleIconAnimator *)self _layoutRippleIconViews];
  if ([(SBHRippleSimulation *)self->_rippleSimulation isSettled])
  {
    [(SBHWidgetInsertionRippleIconAnimator *)self _finishRippleAnimation];
  }
}

- (void)_performJumpAnimationWithCompletion:(id)a3
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_referenceIconView)
  {
    v57 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_referenceIconView != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBHWidgetInsertionRippleIconAnimator _performJumpAnimationWithCompletion:](a2);
    }
    [v57 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D80392DCLL);
  }
  if (!self->_widgetIconView)
  {
    v58 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_widgetIconView != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBHWidgetInsertionRippleIconAnimator _performJumpAnimationWithCompletion:](a2);
    }
    [v58 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8039340);
  }
  v59 = v5;
  uint64_t v6 = dispatch_group_create();
  [(SBIconView *)self->_referenceIconView setHidden:1];
  BOOL v7 = [(SBIconView *)self->_referenceIconView allowsLabelArea];
  double v8 = 0.0;
  if (v7) {
    [(SBIconView *)self->_referenceIconView iconLabelAlpha];
  }
  [(SBIconView *)self->_widgetIconView setIconLabelAlpha:v8];
  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v10 = [(SBIconListView *)self->_iconListView window];
  [v10 bounds];
  double v11 = (UIView *)objc_msgSend(v9, "initWithFrame:");
  portalContainerView = self->_portalContainerView;
  self->_portalContainerView = v11;

  [(UIView *)self->_portalContainerView bs_setHitTestingDisabled:1];
  double v13 = [(SBIconListView *)self->_iconListView window];
  [v13 addSubview:self->_portalContainerView];

  long long v14 = (_UIPortalView *)[objc_alloc(MEMORY[0x1E4FB2248]) initWithSourceView:self->_widgetIconView];
  widgetIconPortalView = self->_widgetIconPortalView;
  self->_widgetIconPortalView = v14;

  [(_UIPortalView *)self->_widgetIconPortalView setHidesSourceView:1];
  [(_UIPortalView *)self->_widgetIconPortalView setMatchesTransform:1];
  [(_UIPortalView *)self->_widgetIconPortalView setAllowsBackdropGroups:1];
  [(SBIconView *)self->_widgetIconView addObserver:self];
  [(SBIconView *)self->_widgetIconView bounds];
  -[_UIPortalView setCenter:](self->_widgetIconPortalView, "setCenter:", self->_referenceIconViewOriginInWindow.x + v16 * 0.5, self->_referenceIconViewOriginInWindow.y + v17 * 0.5);
  [(UIView *)self->_portalContainerView addSubview:self->_widgetIconPortalView];
  long long v18 = [MEMORY[0x1E4F39C00] animation];
  long long v19 = [(SBIconListView *)self->_iconListView layer];
  [v18 setSourceLayer:v19];

  [v18 setDuration:INFINITY];
  [v18 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v18 setRemovedOnCompletion:0];
  [v18 setAppliesY:1];
  [v18 setAppliesX:1];
  long long v20 = self->_portalContainerView;
  [(UIView *)v20 bounds];
  UIRectGetCenter();
  -[UIView convertPoint:toView:](v20, "convertPoint:toView:", self->_iconListView);
  long long v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:");
  v78[0] = v21;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:1];
  [v18 setSourcePoints:v22];

  [(UIView *)self->_portalContainerView addAnimation:v18 forKey:@"SBHWidgetInsertionRippleIconAnimatorMatchMove"];
  LODWORD(v21) = [(SBHWidgetInsertionRippleIconAnimator *)self keepsJumpingIconAboveListViewAsLongAsPossible];
  long long v23 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v24 = [v23 userInterfaceIdiom];

  double v25 = 0.2;
  if (v21) {
    double v25 = 0.4;
  }
  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v25 = 0.5;
  }
  [(SBHWidgetInsertionRippleIconAnimator *)self _reparentPortalViewIntoIconListViewAfterDelay:v25];
  dispatch_group_enter(v6);
  long long v26 = (void *)MEMORY[0x1E4FB1EB0];
  [(SBHWidgetSettings *)self->_settings animatedInsertionPositionDuration];
  double v28 = v27;
  [(SBHWidgetSettings *)self->_settings animatedInsertionPositionDampingRatio];
  double v30 = v29;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke;
  v77[3] = &unk_1E6AAC810;
  v77[4] = self;
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_3;
  v75[3] = &unk_1E6AACAB8;
  long long v31 = v6;
  v76 = v31;
  [v26 animateWithDuration:0 delay:v77 usingSpringWithDamping:v75 initialSpringVelocity:v28 options:0.0 animations:v30 completion:0.0];
  [(SBHWidgetSettings *)self->_settings animatedInsertionJumpScale];
  memset(&v74, 0, sizeof(v74));
  CGAffineTransformMakeScale(&v74, v32, v32);
  dispatch_group_enter(v31);
  uint64_t v33 = (void *)MEMORY[0x1E4FB1EB0];
  [(SBHWidgetSettings *)self->_settings animatedInsertionJumpDuration];
  double v35 = v34;
  [(SBHWidgetSettings *)self->_settings animatedInsertionJumpDampingRatio];
  double v37 = v36;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  CGAffineTransform v73 = v74;
  v72[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_4;
  v72[3] = &unk_1E6AAFE30;
  v72[4] = self;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_6;
  v70[3] = &unk_1E6AACAB8;
  long long v38 = v31;
  v71 = v38;
  [v33 animateWithDuration:0 delay:v72 usingSpringWithDamping:v70 initialSpringVelocity:v35 options:0.0 animations:v37 completion:0.0];
  [(SBHWidgetSettings *)self->_settings animatedInsertionImpactScale];
  CGAffineTransformMakeScale(&v69, v39, v39);
  CGAffineTransform v74 = v69;
  dispatch_group_enter(v38);
  long long v40 = (void *)MEMORY[0x1E4FB1EB0];
  [(SBHWidgetSettings *)self->_settings animatedInsertionSlamDuration];
  double v42 = v41;
  [(SBHWidgetSettings *)self->_settings animatedInsertionSlamDelay];
  double v44 = v43;
  [(SBHWidgetSettings *)self->_settings animatedInsertionSlamDampingRatio];
  double v46 = v45;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  CGAffineTransform v68 = v74;
  v67[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_7;
  v67[3] = &unk_1E6AAFE30;
  v67[4] = self;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_9;
  v65[3] = &unk_1E6AACAB8;
  v47 = v38;
  v66 = v47;
  [v40 animateWithDuration:0 delay:v67 usingSpringWithDamping:v65 initialSpringVelocity:v42 options:v44 animations:v46 completion:0.0];
  dispatch_group_enter(v47);
  v48 = (void *)MEMORY[0x1E4FB1EB0];
  [(SBHWidgetSettings *)self->_settings animatedInsertionScaleResetDuration];
  double v50 = v49;
  [(SBHWidgetSettings *)self->_settings animatedInsertionScaleResetDelay];
  double v52 = v51;
  [(SBHWidgetSettings *)self->_settings animatedInsertionScaleResetDampingRatio];
  double v54 = v53;
  unint64_t v63 = v47;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_10;
  v64[3] = &unk_1E6AAC810;
  v64[4] = self;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_12;
  v62[3] = &unk_1E6AACAB8;
  v55 = v47;
  [v48 animateWithDuration:0 delay:v64 usingSpringWithDamping:v62 initialSpringVelocity:v50 options:v52 animations:v54 completion:0.0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_13;
  block[3] = &unk_1E6AAD4C8;
  id v61 = v59;
  id v56 = v59;
  dispatch_group_notify(v55, MEMORY[0x1E4F14428], block);
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_2;
  _OWORD v4[3] = &unk_1E6AAC810;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  long long v2 = [*(id *)(*(void *)(a1 + 32) + 112) superview];
  [*(id *)(*(void *)(a1 + 32) + 48) bounds];
  UIRectGetCenter();
  objc_msgSend(v2, "convertPoint:fromView:", *(void *)(*(void *)(a1 + 32) + 48));
  double v4 = v3;
  double v6 = v5;

  BOOL v7 = *(void **)(*(void *)(a1 + 32) + 112);
  return objc_msgSend(v7, "setCenter:", v4, v6);
}

void __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_3(uint64_t a1)
{
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_4(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_5;
  v5[3] = &unk_1E6AAFE30;
  v5[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v5, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 112);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

void __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_6(uint64_t a1)
{
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_7(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_8;
  v5[3] = &unk_1E6AAFE30;
  v5[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v5, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_8(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 112);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

void __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_9(uint64_t a1)
{
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_10(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_11;
  _OWORD v4[3] = &unk_1E6AAC810;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114119, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_11(uint64_t a1)
{
  long long v2 = *(void **)(*(void *)(a1 + 32) + 112);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return [*(id *)(*(void *)(a1 + 32) + 48) setIconLabelAlpha:1.0];
}

void __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_12(uint64_t a1)
{
}

uint64_t __76__SBHWidgetInsertionRippleIconAnimator__performJumpAnimationWithCompletion___block_invoke_13(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_reparentPortalViewIntoIconListViewAfterDelay:(double)a3
{
  UIAnimationDragCoefficient();
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * a3 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__SBHWidgetInsertionRippleIconAnimator__reparentPortalViewIntoIconListViewAfterDelay___block_invoke;
  block[3] = &unk_1E6AAC810;
  void block[4] = self;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __86__SBHWidgetInsertionRippleIconAnimator__reparentPortalViewIntoIconListViewAfterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reparentPortalViewIntoIconListViewNow];
}

- (void)_reparentPortalViewIntoIconListViewNow
{
  portalContainerView = self->_portalContainerView;
  [(UIView *)portalContainerView bounds];
  -[UIView convertRect:toView:](portalContainerView, "convertRect:toView:", self->_iconListView);
  -[UIView setFrame:](self->_portalContainerView, "setFrame:");
  iconListView = self->_iconListView;
  float v5 = self->_portalContainerView;
  [(SBIconListView *)iconListView addSubview:v5];
}

- (void)_playImpactHapticAfterDelay:(double)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FB1840]);
  float v5 = [MEMORY[0x1E4FB2190] softConfiguration];
  dispatch_time_t v6 = (void *)[v4 initWithConfiguration:v5];

  [v6 prepare];
  UIAnimationDragCoefficient();
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * a3 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SBHWidgetInsertionRippleIconAnimator__playImpactHapticAfterDelay___block_invoke;
  block[3] = &unk_1E6AAC810;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
}

uint64_t __68__SBHWidgetInsertionRippleIconAnimator__playImpactHapticAfterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) impactOccurred];
}

- (BOOL)keepsJumpingIconAboveListViewAsLongAsPossible
{
  return self->_keepsJumpingIconAboveListViewAsLongAsPossible;
}

- (void)setKeepsJumpingIconAboveListViewAsLongAsPossible:(BOOL)a3
{
  self->_keepsJumpingIconAboveListViewAsLongAsPossible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preludeBlock, 0);
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_rippleSimulation, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_widgetIconPortalView, 0);
  objc_storeStrong((id *)&self->_portalContainerView, 0);
  objc_storeStrong((id *)&self->_gridCoordinateForIcons, 0);
  objc_storeStrong((id *)&self->_portalViewsForIconViews, 0);
  objc_storeStrong((id *)&self->_rippleIconsPortalContainerViewForAdditionalIconListView, 0);
  objc_storeStrong((id *)&self->_rippleIconsPortalContainerView, 0);
  objc_storeStrong((id *)&self->_additionalIconListView, 0);
  objc_storeStrong((id *)&self->_widgetIconView, 0);
  objc_storeStrong((id *)&self->_widgetIcon, 0);
  objc_storeStrong((id *)&self->_referenceIconView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
}

- (void)animateWithCompletion:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  long long v2 = (objc_class *)objc_opt_class();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1D7F0A000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_performJumpAnimationWithCompletion:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  long long v2 = (objc_class *)objc_opt_class();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1D7F0A000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_performJumpAnimationWithCompletion:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  long long v2 = (objc_class *)objc_opt_class();
  long long v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1D7F0A000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end