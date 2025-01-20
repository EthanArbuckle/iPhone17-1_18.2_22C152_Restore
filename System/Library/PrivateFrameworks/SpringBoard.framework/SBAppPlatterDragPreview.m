@interface SBAppPlatterDragPreview
- (BOOL)_effectiveIconAllowsLabelArea;
- (BOOL)_effectiveIconCanShowCloseBox;
- (BOOL)_effectiveIconCanShowResizeHandle;
- (BOOL)_effectiveIconIsHighlighted;
- (BOOL)_isDragging;
- (BOOL)iconAllowsAccessory;
- (BOOL)iconAllowsLabelArea;
- (BOOL)iconCanShowCloseBox;
- (BOOL)iconCanShowResizeHandle;
- (BOOL)iconInitiallyShowingCloseBox;
- (BOOL)iconInitiallyShowingResizeHandle;
- (BOOL)iconIsEditing;
- (BOOL)iconIsHighlighted;
- (BOOL)isAnimatingPlatterViewAlpha;
- (BOOL)isDelayingCleanup;
- (BOOL)isFlocked;
- (BSCornerRadiusConfiguration)cornerRadiusConfiguration;
- (CGPoint)_effectiveIconContainerCenter;
- (CGPoint)anchorPoint;
- (CGRect)_effectiveIconViewFrame;
- (CGRect)_effectivePlatterFrame;
- (CGSize)platterSize;
- (NSArray)diffuseShadowFilters;
- (NSArray)rimShadowFilters;
- (SBAppPlatterDragPreview)initWithReferenceIconView:(id)a3 sourceView:(id)a4;
- (SBAppPlatterDragPreview)initWithReferenceIconView:(id)a3 sourceView:(id)a4 sourceViewScale:(double)a5;
- (SBApplicationBlurContentView)platterView;
- (SBDragPreviewShadowParameters)diffuseShadowParameters;
- (SBDragPreviewShadowParameters)rimShadowParameters;
- (SBIcon)icon;
- (UIView)sourceView;
- (double)_blurContentViewIconViewCenterYOffset;
- (double)_effectiveCornerRadius;
- (double)_effectiveIconAccessoryAlpha;
- (double)_effectiveIconContentScale;
- (double)iconContentScale;
- (double)iconDragAlpha;
- (double)rotation;
- (double)sourceViewScale;
- (id)_effectiveCornerRadiusConfiguration;
- (id)cleanUpHandler;
- (id)delayCleanUpForReason:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)platterViewAlphaAnimationCompletionBlock;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)anchorPointAdjustmentContainerView;
- (uint64_t)captureOnlyBackgroundView;
- (uint64_t)cornerMaskingView;
- (uint64_t)customIconImageViewController;
- (uint64_t)diffuseShadowView;
- (uint64_t)iconContainerView;
- (uint64_t)iconView;
- (uint64_t)referenceIconView;
- (uint64_t)rimShadowView;
- (uint64_t)setDelayingCleanup:(uint64_t)result;
- (uint64_t)setIconInitiallyShowingCloseBox:(uint64_t)result;
- (uint64_t)setIconInitiallyShowingResizeHandle:(uint64_t)result;
- (uint64_t)setIconIsHighlighted:(uint64_t)result;
- (uint64_t)sourcePortalView;
- (uint64_t)unclippedSourceContainerView;
- (unint64_t)_effectiveMode;
- (unint64_t)dragState;
- (unint64_t)mode;
- (void)_configureIconViewWithReferenceIconView:(id)a3;
- (void)_getIconAlpha:(double *)a3 platterAlpha:(double *)a4;
- (void)_matchMoveView:(id)a3 toContainerView:(id)a4;
- (void)_removeDelayCleanupAssertion:(id)a3;
- (void)_setSourcePortalViewHidden:(BOOL)a3;
- (void)_updateContainerViewPositionForAnchorPoint;
- (void)_updateIconViewComponentVisibility;
- (void)_updateShadowView;
- (void)_updateShowDebugIconBorderWithColor:(id)a3;
- (void)_updateSubviewVisibility;
- (void)configurePlatterForSceneHandle:(id)a3 withTargetView:(id)a4 completion:(id)a5;
- (void)draggingSourceDroppedWithOperation:(unint64_t)a3;
- (void)handleCleanup;
- (void)invalidateSourceView;
- (void)layoutSubviews;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setAnchorPointAdjustmentContainerView:(uint64_t)a1;
- (void)setCaptureOnlyBackgroundView:(uint64_t)a1;
- (void)setCleanUpHandler:(id)a3;
- (void)setCornerMaskingView:(uint64_t)a1;
- (void)setCornerRadiusConfiguration:(id)a3;
- (void)setCustomIconImageViewController:(uint64_t)a1;
- (void)setDiffuseShadowFilters:(id)a3;
- (void)setDiffuseShadowParameters:(SBDragPreviewShadowParameters *)a3;
- (void)setDiffuseShadowView:(uint64_t)a1;
- (void)setDragState:(unint64_t)a3;
- (void)setFlocked:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconAllowsAccessory:(BOOL)a3;
- (void)setIconAllowsLabelArea:(BOOL)a3;
- (void)setIconCanShowCloseBox:(BOOL)a3;
- (void)setIconCanShowResizeHandle:(BOOL)a3;
- (void)setIconContainerView:(uint64_t)a1;
- (void)setIconContentScale:(double)a3;
- (void)setIconIsEditing:(BOOL)a3;
- (void)setIconIsEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIconView:(uint64_t)a1;
- (void)setIconViewCustomIconImageViewController:(id)a3;
- (void)setIconViewDelegate:(id)a3;
- (void)setIconViewListLayoutProvider:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPlatterSize:(CGSize)a3;
- (void)setPlatterView:(uint64_t)a1;
- (void)setPlatterViewAlphaAnimationCompletionBlock:(id)a3;
- (void)setReferenceIconView:(uint64_t)a1;
- (void)setRimShadowFilters:(id)a3;
- (void)setRimShadowParameters:(SBDragPreviewShadowParameters *)a3;
- (void)setRimShadowView:(uint64_t)a1;
- (void)setRotation:(double)a3;
- (void)setSourcePortalView:(uint64_t)a1;
- (void)setSourceView:(uint64_t)a1;
- (void)setSourceViewScale:(double)a3;
- (void)setUnclippedSourceContainerView:(uint64_t)a1;
- (void)updateDestinationIconLocation:(id)a3 allowsLabelArea:(BOOL)a4 animated:(BOOL)a5;
- (void)updateSourceView:(id)a3;
@end

@implementation SBAppPlatterDragPreview

- (SBAppPlatterDragPreview)initWithReferenceIconView:(id)a3 sourceView:(id)a4
{
  return [(SBAppPlatterDragPreview *)self initWithReferenceIconView:a3 sourceView:a4 sourceViewScale:1.0];
}

- (SBAppPlatterDragPreview)initWithReferenceIconView:(id)a3 sourceView:(id)a4 sourceViewScale:(double)a5
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2, self, @"SBAppPlatterDragPreview.m", 92, @"Invalid parameter not satisfying: %@", @"referenceIconView != nil" object file lineNumber description];
  }
  [v10 iconImageInfo];
  SBRectWithSize();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [v11 frame];
  double v58 = a5;
  SBTransformedRectWithScale();
  double v20 = v19;
  double v21 = v17;
  double v22 = v15;
  double v23 = v13;
  if (v11)
  {
    SBRectWithSize();
    double v23 = v24;
    double v22 = v25;
    double v21 = v26;
    double v20 = v27;
  }
  v60.receiver = self;
  v60.super_class = (Class)SBAppPlatterDragPreview;
  v28 = -[SBAppPlatterDragPreview initWithFrame:](&v60, sel_initWithFrame_, v23, v22, v21, v20);
  v29 = (SBAppPlatterDragPreview *)v28;
  if (v28)
  {
    __asm { FMOV            V0.2D, #0.5 }
    *(_OWORD *)(v28 + 648) = _Q0;
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v23, v22, v21, v20);
    [(SBAppPlatterDragPreview *)v29 addSubview:v35];
    p_anchorPointAdjustmentContainerView = (id *)&v29->_anchorPointAdjustmentContainerView;
    objc_storeStrong((id *)&v29->_anchorPointAdjustmentContainerView, v35);
    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v13, v15, v17, v19);
    v38 = [v37 layer];
    [v38 setAllowsGroupOpacity:1];

    [v37 setClipsToBounds:0];
    [v10 iconImageInfo];
    [v37 _setContinuousCornerRadius:v39];
    [(UIView *)v29->_anchorPointAdjustmentContainerView addSubview:v37];
    objc_storeStrong((id *)&v29->_iconContainerView, v37);
    v29->_mode = 2 * (v11 != 0);
    objc_storeStrong((id *)&v29->_referenceIconView, a3);
    v29->_sourceViewScale = v58;
    v29->_iconAllowsLabelArea = [v10 allowsLabelArea];
    v29->_iconAllowsAccessory = [v10 allowsAccessoryView];
    v29->_iconIsHighlighted = [v10 isHighlighted];
    v29->_iconCanShowCloseBox = [v10 canShowCloseBox];
    v29->_iconCanShowResizeHandle = [v10 canShowResizeHandle];
    [v10 iconContentScale];
    v29->_iconContentScale = v40;
    v29->_iconInitiallyShowingCloseBox = [v10 shouldShowCloseBox];
    v29->_iconInitiallyShowingResizeHandle = [v10 shouldShowResizeHandle];
    v41 = [(SBAppPlatterDragPreview *)v29 layer];
    [v41 setAllowsGroupOpacity:1];

    SBScreenDisplayCornerRadius();
    if (BSFloatIsZero())
    {
      uint64_t v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v23, v22, v21, v20);
      cornerMaskingView = v29->_cornerMaskingView;
      v29->_cornerMaskingView = (UIView *)v42;

      v44 = [(UIView *)v29->_cornerMaskingView layer];
      [v44 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    }
    else
    {
      v45 = -[SBAsymmetricalCornerRadiusWrapperView initWithFrame:]([SBAsymmetricalCornerRadiusWrapperView alloc], "initWithFrame:", v23, v22, v21, v20);
      v44 = v29->_cornerMaskingView;
      v29->_cornerMaskingView = &v45->super.super;
    }

    [(UIView *)v29->_cornerMaskingView setClipsToBounds:1];
    [*p_anchorPointAdjustmentContainerView insertSubview:v29->_cornerMaskingView atIndex:0];
    uint64_t v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6058]), "initWithFrame:", v23, v22, v21, v20);
    rimShadowView = v29->_rimShadowView;
    v29->_rimShadowView = (SBFView *)v46;

    [(SBFView *)v29->_rimShadowView setAnimatedLayerProperties:&unk_1F3347E08];
    v48 = [(SBFView *)v29->_rimShadowView layer];
    [v48 setShadowPathIsBounds:1];

    [*p_anchorPointAdjustmentContainerView insertSubview:v29->_rimShadowView atIndex:0];
    uint64_t v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6058]), "initWithFrame:", v23, v22, v21, v20);
    diffuseShadowView = v29->_diffuseShadowView;
    v29->_diffuseShadowView = (SBFView *)v49;

    [(SBFView *)v29->_diffuseShadowView setAnimatedLayerProperties:&unk_1F3347E20];
    v51 = [(SBFView *)v29->_diffuseShadowView layer];
    [v51 setShadowPathIsBounds:1];

    [*p_anchorPointAdjustmentContainerView insertSubview:v29->_diffuseShadowView atIndex:0];
    [(SBAppPlatterDragPreview *)v29 updateSourceView:v11];
    v52 = [v10 icon];
    char v53 = [v52 isWidgetIcon];

    if (![(SBAppPlatterDragPreview *)v29 _effectiveMode] && (v53 & 1) == 0)
    {
      v54 = [v10 listLayoutProvider];
      v55 = [v54 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];

      [v55 iconImageInfo];
      CGAffineTransformMakeScale(&v59, 1.1, 1.1);
      SBRectWithSize();
      -[SBAppPlatterDragPreview setFrame:](v29, "setFrame:");
    }
    [(SBAppPlatterDragPreview *)v29 setNeedsLayout];
    [(SBAppPlatterDragPreview *)v29 layoutIfNeeded];
  }
  return v29;
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(SBAppPlatterDragPreview *)self setNeedsLayout];
  }
}

- (void)_matchMoveView:(id)a3 toContainerView:(id)a4
{
  v5 = (void *)MEMORY[0x1E4FA5E88];
  id v6 = a3;
  id v8 = [v5 matchMoveAnimationForPinningToView:a4];
  v7 = [v6 layer];

  [v7 addAnimation:v8 forKey:@"MatchMove-SBAppPlatterDragPreview"];
}

- (void)updateSourceView:(id)a3
{
  v5 = (UIView *)a3;
  v35 = v5;
  if (!self->_sourcePortalView)
  {
    id v6 = [SBPortalView alloc];
    [(UIView *)self->_cornerMaskingView bounds];
    v7 = -[SBPortalView initWithFrame:](v6, "initWithFrame:");
    sourcePortalView = self->_sourcePortalView;
    self->_sourcePortalView = v7;

    [(SBPortalView *)self->_sourcePortalView setHidesSourceView:1];
    [(SBPortalView *)self->_sourcePortalView setAllowsBackdropGroups:1];
    uint64_t v9 = objc_opt_class();
    id v10 = SBSafeCast(v9, self->_cornerMaskingView);
    id v11 = v10;
    if (v10)
    {
      [v10 addContentView:self->_sourcePortalView];
      [v11 bringContentViewToFront:self->_platterView];
    }
    else
    {
      [(UIView *)self->_cornerMaskingView addSubview:self->_sourcePortalView];
      [(UIView *)self->_cornerMaskingView bringSubviewToFront:self->_platterView];
    }
    [(SBAppPlatterDragPreview *)self _matchMoveView:self->_sourcePortalView toContainerView:self->_cornerMaskingView];

    v5 = v35;
  }
  [(UIView *)v5 frame];
  SBRectWithSize();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  p_sourceView = &self->_sourceView;
  sourceView = self->_sourceView;
  double v22 = v35;
  if (sourceView != v35)
  {
    double v23 = sourceView;
    if (v23)
    {
      double v24 = [(UIView *)*p_sourceView superview];
      unclippedSourceContainerView = self->_unclippedSourceContainerView;

      if (v24 == unclippedSourceContainerView) {
        [(UIView *)*p_sourceView removeFromSuperview];
      }
      [(SBPortalView *)self->_sourcePortalView setSourceView:0];
    }
    objc_storeStrong((id *)&self->_sourceView, a3);
    double v26 = [(UIView *)*p_sourceView superview];

    if (v26)
    {
      double v27 = self->_sourcePortalView;
      v28 = [MEMORY[0x1E4F428B8] clearColor];
      [(SBPortalView *)v27 setBackgroundColor:v28];

      [(SBPortalView *)self->_sourcePortalView setSourceView:*p_sourceView];
      [(SBPortalView *)self->_sourcePortalView setHidesSourceView:1];
    }
    else
    {
      v29 = self->_unclippedSourceContainerView;
      if (!v29)
      {
        v30 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v13, v15, v17, v19);
        v31 = self->_unclippedSourceContainerView;
        self->_unclippedSourceContainerView = v30;

        [(UIView *)self->_anchorPointAdjustmentContainerView insertSubview:self->_unclippedSourceContainerView aboveSubview:self->_cornerMaskingView];
        [(SBAppPlatterDragPreview *)self _matchMoveView:self->_unclippedSourceContainerView toContainerView:self->_cornerMaskingView];
        v29 = self->_unclippedSourceContainerView;
      }
      [(UIView *)v29 addSubview:*p_sourceView];
      v32 = *p_sourceView;
      [(UIView *)self->_unclippedSourceContainerView bounds];
      UIRectGetCenter();
      -[UIView setCenter:](v32, "setCenter:");
      [(UIView *)*p_sourceView alpha];
      if (BSFloatIsOne())
      {
        v33 = self->_sourcePortalView;
        v34 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
        [(SBPortalView *)v33 setBackgroundColor:v34];
      }
    }

    double v22 = *p_sourceView;
  }
  [(UIView *)v22 _removeAllRetargetableAnimations:1];
  -[SBPortalView setBounds:](self->_sourcePortalView, "setBounds:", v13, v15, v17, v19);
  -[UIView setBounds:](self->_unclippedSourceContainerView, "setBounds:", v13, v15, v17, v19);
}

- (void)invalidateSourceView
{
  [(SBPortalView *)self->_sourcePortalView setSourceView:0];
  v3 = [(UIView *)self->_sourceView superview];
  unclippedSourceContainerView = self->_unclippedSourceContainerView;

  if (v3 == unclippedSourceContainerView) {
    [(UIView *)self->_sourceView removeFromSuperview];
  }
  sourceView = self->_sourceView;
  self->_sourceView = 0;
}

- (BOOL)isAnimatingPlatterViewAlpha
{
  return self->_platterViewAlphaAnimationCount != 0;
}

- (void)configurePlatterForSceneHandle:(id)a3 withTargetView:(id)a4 completion:(id)a5
{
  id v8 = a5;
  self->_isBlurredPlatterReady = 0;
  self->_hasAnimatedToBlurredPlatter = 0;
  id v9 = a4;
  id v10 = [a3 application];
  id v11 = [v10 bundleIdentifier];

  double v12 = [SBApplicationBlurContentView alloc];
  [v9 bounds];
  double v13 = -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:](v12, "initWithFrame:bundleIdentifier:targetViewToBlur:", v11, v9);

  platterView = self->_platterView;
  self->_platterView = v13;

  double v15 = [(SBApplicationBlurContentView *)self->_platterView iconView];
  double v16 = [v15 imageView];
  [v16 setHidden:1];

  [(SBApplicationBlurContentView *)self->_platterView bs_setHitTestingDisabled:1];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  double v26 = __84__SBAppPlatterDragPreview_configurePlatterForSceneHandle_withTargetView_completion___block_invoke;
  double v27 = &unk_1E6AF6828;
  v28 = self;
  id v17 = v8;
  id v29 = v17;
  double v18 = (void *)MEMORY[0x1D948C7A0](&v24);
  if (self->_mode != 2
    || ([(UIView *)self->_sourceView superview],
        double v19 = (UIView *)objc_claimAutoreleasedReturnValue(),
        unclippedSourceContainerView = self->_unclippedSourceContainerView,
        v19,
        v19 == unclippedSourceContainerView))
  {
    -[SBApplicationBlurContentView generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:](self->_platterView, "generateAndAnimateToBlurredSnapshotWithAnimationFactory:completion:", 0, v18, v24, v25, v26, v27, v28);
    self->_hasAnimatedToBlurredPlatter = 1;
  }
  else
  {
    [(SBApplicationBlurContentView *)self->_platterView generateBlurredSnapshotWithCompletion:v18];
  }
  uint64_t v21 = objc_opt_class();
  double v22 = SBSafeCast(v21, self->_cornerMaskingView);
  double v23 = v22;
  if (v22) {
    [v22 addContentView:self->_platterView];
  }
  else {
    [(UIView *)self->_cornerMaskingView addSubview:self->_platterView];
  }
  [(SBAppPlatterDragPreview *)self setNeedsLayout];
  [(SBAppPlatterDragPreview *)self layoutIfNeeded];
}

uint64_t __84__SBAppPlatterDragPreview_configurePlatterForSceneHandle_withTargetView_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 496);
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  [v2 setBackgroundColor:v3];

  *(unsigned char *)(*(void *)(a1 + 32) + 408) = 1;
  v4 = (void *)MEMORY[0x1E4F42FF0];
  v5 = +[SBMedusaDomain rootSettings];
  id v6 = [v5 platterAnimationSettings];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__SBAppPlatterDragPreview_configurePlatterForSceneHandle_withTargetView_completion___block_invoke_2;
  v8[3] = &unk_1E6AF4AC0;
  v8[4] = *(void *)(a1 + 32);
  [v4 _animateUsingSpringBehavior:v6 tracking:0 animations:v8 completion:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __84__SBAppPlatterDragPreview_configurePlatterForSceneHandle_withTargetView_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)setPlatterSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  p_platterSize = &self->_platterSize;
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    p_platterSize->CGFloat width = width;
    p_platterSize->CGFloat height = height;
    [(SBAppPlatterDragPreview *)self setNeedsLayout];
  }
}

- (void)setDiffuseShadowParameters:(SBDragPreviewShadowParameters *)a3
{
  CGFloat v7 = v6;
  CGFloat v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_diffuseShadowParameters = &self->_diffuseShadowParameters;
  if ((SBDragPreviewShadowParametersEqualToShadowParameters() & 1) == 0)
  {
    p_diffuseShadowParameters->shadowOpacity = v10;
    p_diffuseShadowParameters->shadowRadius = v9;
    p_diffuseShadowParameters->shadowOffset.CGFloat width = v8;
    p_diffuseShadowParameters->shadowOffset.CGFloat height = v7;
    [(SBAppPlatterDragPreview *)self setNeedsLayout];
  }
}

- (void)setRimShadowParameters:(SBDragPreviewShadowParameters *)a3
{
  CGFloat v7 = v6;
  CGFloat v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_rimShadowParameters = &self->_rimShadowParameters;
  if ((SBDragPreviewShadowParametersEqualToShadowParameters() & 1) == 0)
  {
    p_rimShadowParameters->shadowOpacity = v10;
    p_rimShadowParameters->shadowRadius = v9;
    p_rimShadowParameters->shadowOffset.CGFloat width = v8;
    p_rimShadowParameters->shadowOffset.CGFloat height = v7;
    [(SBAppPlatterDragPreview *)self setNeedsLayout];
  }
}

- (void)setDiffuseShadowFilters:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_diffuseShadowFilters, "isEqualToArray:"))
  {
    double v4 = (NSArray *)[v6 copy];
    diffuseShadowFilters = self->_diffuseShadowFilters;
    self->_diffuseShadowFilters = v4;

    [(SBAppPlatterDragPreview *)self setNeedsLayout];
  }
}

- (void)setRimShadowFilters:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_rimShadowFilters, "isEqualToArray:"))
  {
    double v4 = (NSArray *)[v6 copy];
    rimShadowFilters = self->_rimShadowFilters;
    self->_rimShadowFilters = v4;

    [(SBAppPlatterDragPreview *)self setNeedsLayout];
  }
}

- (void)setCornerRadiusConfiguration:(id)a3
{
  id v5 = a3;
  if ((-[BSCornerRadiusConfiguration isEqual:](self->_cornerRadiusConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cornerRadiusConfiguration, a3);
    [(SBAppPlatterDragPreview *)self setNeedsLayout];
  }
}

- (SBIcon)icon
{
  return (SBIcon *)[(SBIconView *)self->_iconView icon];
}

- (void)setIcon:(id)a3
{
}

- (void)setDragState:(unint64_t)a3
{
  if (self->_dragState != a3)
  {
    if (a3 < 2 || self->_iconView) {
      goto LABEL_6;
    }
    if (self->_referenceIconView)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __40__SBAppPlatterDragPreview_setDragState___block_invoke;
      v8[3] = &unk_1E6AF4AC0;
      v8[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v8];
      referenceIconView = self->_referenceIconView;
      self->_referenceIconView = 0;

LABEL_6:
      self->_dragState = a3;
      [(SBAppPlatterDragPreview *)self setNeedsLayout];
      [(SBAppPlatterDragPreview *)self layoutIfNeeded];
      return;
    }
    CGFloat v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_referenceIconView != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBAppPlatterDragPreview *)a2 setDragState:(uint64_t)v7];
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __40__SBAppPlatterDragPreview_setDragState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 544) customIconImageViewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    double v4 = [*(id *)(*(void *)(a1 + 32) + 544) customIconImageViewController];
    [v4 setShowingContextMenu:0];
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[68];
  return [v5 _configureIconViewWithReferenceIconView:v6];
}

- (void)setFlocked:(BOOL)a3
{
  if (self->_flocked != a3)
  {
    self->_flocked = a3;
    [(SBAppPlatterDragPreview *)self setNeedsLayout];
  }
}

- (void)updateDestinationIconLocation:(id)a3 allowsLabelArea:(BOOL)a4 animated:(BOOL)a5
{
  id v8 = a3;
  double v9 = [(SBIconView *)self->_iconView location];
  char v10 = [v9 isEqual:v8];

  if ((v10 & 1) == 0)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __82__SBAppPlatterDragPreview_updateDestinationIconLocation_allowsLabelArea_animated___block_invoke;
    v23[3] = &unk_1E6AFDD40;
    v23[4] = self;
    id v24 = v8;
    BOOL v25 = a5;
    BOOL v26 = a4;
    uint64_t v11 = MEMORY[0x1D948C7A0](v23);
    double v12 = (void *)v11;
    if (a5)
    {
      double v13 = [(SBIconView *)self->_iconView startForbiddingAccessoryUpdatesWithReason:@"dragPlatterUpdatingLocation" animated:1];
      double v14 = (void *)MEMORY[0x1E4F43008];
      double v15 = *MEMORY[0x1E4FA6710];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      double v20 = __82__SBAppPlatterDragPreview_updateDestinationIconLocation_allowsLabelArea_animated___block_invoke_2;
      uint64_t v21 = &unk_1E6AF8788;
      id v22 = v13;
      id v16 = v13;
      id v17 = [v14 runningPropertyAnimatorWithDuration:2 delay:v12 options:&v18 animations:v15 completion:0.0];
      objc_msgSend(v17, "startAnimation", v18, v19, v20, v21);
    }
    else
    {
      (*(void (**)(uint64_t))(v11 + 16))(v11);
    }
  }
}

uint64_t __82__SBAppPlatterDragPreview_updateDestinationIconLocation_allowsLabelArea_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 552) setLocation:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  *(unsigned char *)(*(void *)(a1 + 32) + 434) = *(unsigned char *)(a1 + 49);
  [*(id *)(a1 + 32) _updateIconViewComponentVisibility];
  [*(id *)(*(void *)(a1 + 32) + 552) iconImageInfo];
  double v24 = v2;
  SBRectWithSize();
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  uint64_t v11 = *(id **)(a1 + 32);
  if (v11[60])
  {
    [v11[60] frame];
    SBRectWithSize();
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    uint64_t v11 = *(id **)(a1 + 32);
  }
  else
  {
    double v13 = v3;
    double v15 = v4;
    double v17 = v5;
    double v19 = v6;
  }
  [v11 _removeAllRetargetableAnimations:1];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v13, v15, v17, v19);
  [*(id *)(*(void *)(a1 + 32) + 576) _removeAllRetargetableAnimations:1];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 576), "sb_setBoundsAndPositionFromFrame:", v13, v15, v17, v19);
  [*(id *)(*(void *)(a1 + 32) + 584) _removeAllRetargetableAnimations:1];
  [*(id *)(*(void *)(a1 + 32) + 584) _setContinuousCornerRadius:v24];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 584), "sb_setBoundsAndPositionFromFrame:", v7, v8, v9, v10);
  [*(id *)(*(void *)(a1 + 32) + 592) _removeAllRetargetableAnimations:1];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 592), "sb_setBoundsAndPositionFromFrame:", v13, v15, v17, v19);
  [*(id *)(*(void *)(a1 + 32) + 624) _removeAllRetargetableAnimations:1];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 624), "sb_setBoundsAndPositionFromFrame:", v13, v15, v17, v19);
  [*(id *)(*(void *)(a1 + 32) + 616) _removeAllRetargetableAnimations:1];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 616), "sb_setBoundsAndPositionFromFrame:", v13, v15, v17, v19);
  double v20 = *(void **)(a1 + 32);
  uint64_t v21 = [MEMORY[0x1E4F428B8] magentaColor];
  [v20 _updateShowDebugIconBorderWithColor:v21];

  [*(id *)(a1 + 32) setNeedsLayout];
  id v22 = *(void **)(a1 + 32);
  return [v22 layoutIfNeeded];
}

uint64_t __82__SBAppPlatterDragPreview_updateDestinationIconLocation_allowsLabelArea_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_configureIconViewWithReferenceIconView:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConfigurationOptions:4];
  [v5 setCustomIconImageViewControllerPriority:3];
  double v6 = [v5 borrowIconImageView];
  [v4 configureMatchingIconView:v5];
  if (self) {
    customIconImageViewController = self->_customIconImageViewController;
  }
  else {
    customIconImageViewController = 0;
  }
  double v8 = customIconImageViewController;
  [v5 setOverrideCustomIconImageViewController:v8];
  [v6 invalidate];
  if (!v8)
  {
    double v8 = [v5 customIconImageViewController];
  }
  if (objc_opt_respondsToSelector()) {
    [(SBIconViewCustomImageViewControlling *)v8 setShowsSnapshotWhenDeactivated:1];
  }
  objc_msgSend(v5, "setEditing:", objc_msgSend(v4, "isEditing"));
  double v9 = [v4 accessibilityTintColor];
  [v5 setAccessibilityTintColor:v9];

  [v5 setAllowsEditingAnimation:0];
  [v5 setIconContentScalingEnabled:0];
  objc_msgSend(v5, "bs_setHitTestingDisabled:", 1);
  [v5 sizeToFit];
  objc_storeStrong((id *)&self->_iconView, v5);
  [(SBAppPlatterDragPreview *)self _effectiveIconViewFrame];
  objc_msgSend(v5, "setFrame:");
  [v5 layoutIfNeeded];
  [(SBAppPlatterDragPreview *)self _updateIconViewComponentVisibility];
  double v14 = 1.0;
  [(SBAppPlatterDragPreview *)self _getIconAlpha:&v14 platterAlpha:0];
  [v5 setAlpha:v14];
  [(UIView *)self->_iconContainerView addSubview:v5];
  double v10 = [v5 backgroundViewGroupNameBase];

  if (v10)
  {
    uint64_t v11 = (UIView *)[v5 newCaptureOnlyBackgroundView];
    [v5 frame];
    -[UIView setFrame:](v11, "setFrame:");
    [(UIView *)self->_iconContainerView addSubview:v11];
    [(UIView *)self->_iconContainerView sendSubviewToBack:v11];
    captureOnlyBackgroundView = self->_captureOnlyBackgroundView;
    self->_captureOnlyBackgroundView = v11;
  }
  double v13 = [MEMORY[0x1E4F428B8] redColor];
  [(SBAppPlatterDragPreview *)self _updateShowDebugIconBorderWithColor:v13];
}

- (uint64_t)customIconImageViewController
{
  if (result) {
    return *(void *)(result + 568);
  }
  return result;
}

- (void)_updateShowDebugIconBorderWithColor:(id)a3
{
  id v14 = a3;
  id v4 = [MEMORY[0x1E4FA6270] rootSettings];
  double v5 = [v4 iconEditingSettings];
  int v6 = [v5 showDragPlatterIconBorder];

  if (v6)
  {
    double v7 = [(SBIconView *)self->_iconView _iconImageView];
    [(SBIconView *)self->_iconView iconImageInfo];
    [v7 _setContinuousCornerRadius:v8];

    double v9 = [(SBIconView *)self->_iconView _iconImageView];
    double v10 = [v9 layer];
    uint64_t v11 = v14;
    if (!v14)
    {
      uint64_t v11 = [MEMORY[0x1E4F428B8] redColor];
    }
    objc_msgSend(v10, "setBorderColor:", objc_msgSend(v11, "CGColor"));
    if (!v14) {

    }
    double v12 = [(SBIconView *)self->_iconView _iconImageView];
    double v13 = [v12 layer];
    [v13 setBorderWidth:4.0];
  }
}

- (void)setIconAllowsLabelArea:(BOOL)a3
{
  if (self->_iconAllowsLabelArea != a3)
  {
    self->_iconAllowsLabelArea = a3;
    [(SBAppPlatterDragPreview *)self _updateIconViewComponentVisibility];
  }
}

- (void)setIconAllowsAccessory:(BOOL)a3
{
  if (self->_iconAllowsAccessory != a3)
  {
    self->_iconAllowsAccessory = a3;
    [(SBAppPlatterDragPreview *)self _updateIconViewComponentVisibility];
  }
}

- (void)setIconCanShowCloseBox:(BOOL)a3
{
  if (self->_iconCanShowCloseBox != a3)
  {
    self->_iconCanShowCloseBox = a3;
    [(SBAppPlatterDragPreview *)self _updateIconViewComponentVisibility];
  }
}

- (void)setIconCanShowResizeHandle:(BOOL)a3
{
  if (self->_iconCanShowResizeHandle != a3)
  {
    self->_iconCanShowResizeHandle = a3;
    [(SBAppPlatterDragPreview *)self _updateIconViewComponentVisibility];
  }
}

- (void)setIconContentScale:(double)a3
{
  if (self->_iconContentScale != a3)
  {
    self->_iconContentScale = a3;
    [(SBAppPlatterDragPreview *)self setNeedsLayout];
  }
}

- (BOOL)iconIsEditing
{
  return [(SBIconView *)self->_iconView isEditing];
}

- (void)setIconIsEditing:(BOOL)a3
{
}

- (void)setIconIsEditing:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)handleCleanup
{
  if (self) {
    self->_delayingCleanup = 0;
  }
  [(SBIconView *)self->_iconView setIcon:0];
  [(UIView *)self->_captureOnlyBackgroundView removeFromSuperview];
  captureOnlyBackgroundView = self->_captureOnlyBackgroundView;
  self->_captureOnlyBackgroundView = 0;

  cleanUpHandler = (void (**)(id, SBAppPlatterDragPreview *))self->_cleanUpHandler;
  if (cleanUpHandler)
  {
    cleanUpHandler[2](cleanUpHandler, self);
    id v5 = self->_cleanUpHandler;
    self->_cleanUpHandler = 0;
  }
  if (self->_sourcePortalView)
  {
    [(SBAppPlatterDragPreview *)self invalidateSourceView];
    [(SBPortalView *)self->_sourcePortalView removeFromSuperview];
    sourcePortalView = self->_sourcePortalView;
    self->_sourcePortalView = 0;
  }
}

- (uint64_t)setDelayingCleanup:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 440) = a2;
  }
  return result;
}

- (id)delayCleanUpForReason:(id)a3
{
  id v4 = a3;
  if (!self->_cleanupDelayAssertions)
  {
    id v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    cleanupDelayAssertions = self->_cleanupDelayAssertions;
    self->_cleanupDelayAssertions = v5;
  }
  double v7 = [[SBAppPlatterDragPreviewDelayCleanupAssertion alloc] initWithDragPreview:self reason:v4];
  [(NSHashTable *)self->_cleanupDelayAssertions addObject:v7];

  return v7;
}

- (void)_removeDelayCleanupAssertion:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_cleanupDelayAssertions, "containsObject:"))
  {
    [(NSHashTable *)self->_cleanupDelayAssertions removeObject:v4];
    if (![(NSHashTable *)self->_cleanupDelayAssertions count] && self->_delayingCleanup) {
      [(SBAppPlatterDragPreview *)self handleCleanup];
    }
  }
}

- (BOOL)isDelayingCleanup
{
  if (result) {
    return *(unsigned char *)(result + 440) != 0;
  }
  return result;
}

- (void)draggingSourceDroppedWithOperation:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBAppPlatterDragPreview_draggingSourceDroppedWithOperation___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
  if (!a3)
  {
    int v6 = self->_iconView;
    double v7 = [(SBIconView *)v6 customIconImageViewController];

    if (v7)
    {
      double v8 = SBLogIconDragging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v13 = v6;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Drop cancelled; replacing platter of icon image view controller with snapshot: %@",
          buf,
          0xCu);
      }

      double v9 = [(SBIconView *)v6 snapshotView];
      double v10 = [(SBIconView *)v6 superview];
      [v10 addSubview:v9];

      [(SBIconView *)v6 frame];
      objc_msgSend(v9, "setFrame:");
      [(SBIconView *)v6 setIcon:0];
    }
  }
}

unsigned char *__62__SBAppPlatterDragPreview_draggingSourceDroppedWithOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 424) count];
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (v2)
  {
    if (result) {
      result[440] = 1;
    }
  }
  else
  {
    return (unsigned char *)[result handleCleanup];
  }
  return result;
}

- (void)setIconViewDelegate:(id)a3
{
  if (self) {
    self = (SBAppPlatterDragPreview *)self->_iconView;
  }
  [(SBAppPlatterDragPreview *)self setDelegate:a3];
}

- (uint64_t)iconView
{
  if (result) {
    return *(void *)(result + 552);
  }
  return result;
}

- (void)setIconViewListLayoutProvider:(id)a3
{
  if (self) {
    self = (SBAppPlatterDragPreview *)self->_iconView;
  }
  [(SBAppPlatterDragPreview *)self setListLayoutProvider:a3];
}

- (void)setIconViewCustomIconImageViewController:(id)a3
{
  id v5 = a3;
  -[SBAppPlatterDragPreview setCustomIconImageViewController:]((uint64_t)self, v5);
  if (self) {
    iconView = self->_iconView;
  }
  else {
    iconView = 0;
  }
  [(SBIconView *)iconView setOverrideCustomIconImageViewController:v5];
}

- (void)setCustomIconImageViewController:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 568), a2);
  }
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)SBAppPlatterDragPreview;
  [(SBAppPlatterDragPreview *)&v23 layoutSubviews];
  [(SBAppPlatterDragPreview *)self _effectiveIconContentScale];
  iconContainerView = self->_iconContainerView;
  CGAffineTransformMakeScale(&v22, v4, v4);
  [(UIView *)iconContainerView setTransform:&v22];
  [(SBAppPlatterDragPreview *)self _effectiveIconViewFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[SBIconView setFrame:](self->_iconView, "setFrame:");
  -[UIView setFrame:](self->_captureOnlyBackgroundView, "setFrame:", v6, v8, v10, v12);
  double v13 = self->_iconContainerView;
  [(SBAppPlatterDragPreview *)self _effectiveIconContainerCenter];
  -[UIView setCenter:](v13, "setCenter:");
  [(SBAppPlatterDragPreview *)self _effectivePlatterFrame];
  -[UIView setFrame:](self->_cornerMaskingView, "setFrame:");
  platterView = self->_platterView;
  SBRectWithSize();
  -[SBApplicationBlurContentView setFrame:](platterView, "setFrame:");
  sourcePortalView = self->_sourcePortalView;
  [(UIView *)self->_sourceView frame];
  SBRectWithSize();
  -[SBPortalView setBounds:](sourcePortalView, "setBounds:");
  double v16 = self->_sourcePortalView;
  SBRectWithSize();
  UIRectGetCenter();
  -[SBPortalView setCenter:](v16, "setCenter:");
  unclippedSourceContainerView = self->_unclippedSourceContainerView;
  [(SBPortalView *)self->_sourcePortalView bounds];
  -[UIView setBounds:](unclippedSourceContainerView, "setBounds:");
  double v18 = self->_unclippedSourceContainerView;
  [(UIView *)self->_cornerMaskingView center];
  -[UIView setCenter:](v18, "setCenter:");
  uint64_t v19 = objc_opt_class();
  double v20 = SBSafeCast(v19, self->_cornerMaskingView);
  if (v20)
  {
    uint64_t v21 = [(SBAppPlatterDragPreview *)self _effectiveCornerRadiusConfiguration];
    [v20 setCornerRadiusConfiguration:v21];
  }
  else
  {
    uint64_t v21 = [(UIView *)self->_cornerMaskingView layer];
    [(SBAppPlatterDragPreview *)self _effectiveCornerRadius];
    objc_msgSend(v21, "setCornerRadius:");
  }

  [(SBAppPlatterDragPreview *)self _updateSubviewVisibility];
  [(SBAppPlatterDragPreview *)self _updateIconViewComponentVisibility];
  [(SBAppPlatterDragPreview *)self _updateShadowView];
  [(SBAppPlatterDragPreview *)self _updateContainerViewPositionForAnchorPoint];
}

- (void)_updateContainerViewPositionForAnchorPoint
{
  if (self->_dragState == 3)
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    double x = self->_anchorPoint.x;
    double y = self->_anchorPoint.y;
    [(SBAppPlatterDragPreview *)self _effectivePlatterFrame];
    double v8 = v7;
    double v10 = v9;
    [(SBAppPlatterDragPreview *)self bounds];
    double v3 = (x + x + -1.0) * ((v11 - v8) * 0.5);
    double v4 = (y + y + -1.0) * ((v12 - v10) * 0.5);
  }
  [(SBAppPlatterDragPreview *)self bounds];
  UIRectGetCenter();
  -[UIView setCenter:](self->_anchorPointAdjustmentContainerView, "setCenter:", v3 + v13, v4 + v14);
  anchorPointAdjustmentContainerView = self->_anchorPointAdjustmentContainerView;
  [(SBAppPlatterDragPreview *)self bounds];
  -[UIView setBounds:](anchorPointAdjustmentContainerView, "setBounds:");
  double v16 = self->_anchorPointAdjustmentContainerView;
  CGAffineTransformMakeRotation(&v17, self->_rotation);
  [(UIView *)v16 setTransform:&v17];
}

- (BOOL)_isDragging
{
  return self->_dragState > 1;
}

- (unint64_t)_effectiveMode
{
  unint64_t mode = self->_mode;
  if (mode == 1)
  {
    if (self->_isBlurredPlatterReady) {
      return 1;
    }
    else {
      return 2 * (self->_sourceView != 0);
    }
  }
  return mode;
}

- (void)_updateShadowView
{
  shadowOpacitdouble y = self->_diffuseShadowParameters.shadowOpacity;
  double shadowRadius = self->_diffuseShadowParameters.shadowRadius;
  CGFloat width = self->_diffuseShadowParameters.shadowOffset.width;
  CGFloat height = self->_diffuseShadowParameters.shadowOffset.height;
  double v8 = self->_rimShadowParameters.shadowOpacity;
  double v7 = self->_rimShadowParameters.shadowRadius;
  CGFloat v9 = self->_rimShadowParameters.shadowOffset.width;
  CGFloat v10 = self->_rimShadowParameters.shadowOffset.height;
  double v39 = self->_diffuseShadowFilters;
  double v11 = self->_rimShadowFilters;
  if (self->_mode)
  {
    double v37 = v9;
    double v38 = height;
    double v35 = width;
    double v36 = v10;
    double v12 = v8;
    [(SBAppPlatterDragPreview *)self _effectivePlatterFrame];
  }
  else
  {
    unint64_t dragState = self->_dragState;
    if (dragState <= 4)
    {
      if (dragState == 2)
      {
        double shadowRadius = 14.0;
        CGFloat width = 0.0;
        CGFloat height = 10.0;
        shadowOpacitdouble y = 0.225;
      }
      else
      {
        CGFloat width = *MEMORY[0x1E4F1DB30];
        CGFloat height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        double shadowRadius = 0.0;
        shadowOpacitdouble y = 0.0;
      }
    }
    double v37 = *MEMORY[0x1E4F1DB30];
    double v38 = height;
    double v35 = width;
    double v36 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

    double v39 = 0;
    double v11 = 0;
    double v12 = 0.0;
    [(SBAppPlatterDragPreview *)self _effectivePlatterFrame];
  }
  double v18 = v13;
  double v19 = v14;
  double v20 = v15;
  double v21 = v16;
  [(SBAppPlatterDragPreview *)self _effectiveCornerRadius];
  double v23 = v22;
  -[SBFView setFrame:](self->_diffuseShadowView, "setFrame:", v18, v19, v20, v21);
  -[SBFView setFrame:](self->_rimShadowView, "setFrame:", v18, v19, v20, v21);
  [(SBFView *)self->_diffuseShadowView _setContinuousCornerRadius:v23];
  [(SBFView *)self->_rimShadowView _setContinuousCornerRadius:v23];
  double v24 = [(SBFView *)self->_diffuseShadowView layer];
  *(float *)&double v25 = shadowOpacity;
  [v24 setShadowOpacity:v25];

  BOOL v26 = [(SBFView *)self->_diffuseShadowView layer];
  [v26 setShadowRadius:shadowRadius];

  double v27 = [(SBFView *)self->_diffuseShadowView layer];
  objc_msgSend(v27, "setShadowOffset:", v35, v38);

  v28 = [(SBFView *)self->_rimShadowView layer];
  *(float *)&double v29 = v12;
  [v28 setShadowOpacity:v29];

  v30 = [(SBFView *)self->_rimShadowView layer];
  [v30 setShadowRadius:v34];

  v31 = [(SBFView *)self->_rimShadowView layer];
  objc_msgSend(v31, "setShadowOffset:", v37, v36);

  v32 = [(SBFView *)self->_diffuseShadowView layer];
  [v32 setFilters:v39];

  v33 = [(SBFView *)self->_rimShadowView layer];
  [v33 setFilters:v11];
}

- (void)_getIconAlpha:(double *)a3 platterAlpha:(double *)a4
{
  unint64_t v7 = [(SBAppPlatterDragPreview *)self _effectiveMode];
  if (v7 == 2)
  {
    double v10 = 0.0;
    goto LABEL_7;
  }
  double v8 = 1.0;
  if (v7)
  {
    double v10 = 1.0;
    goto LABEL_9;
  }
  unint64_t dragState = self->_dragState;
  double v10 = 0.0;
  if (dragState >= 3)
  {
    if (dragState != 4) {
      goto LABEL_9;
    }
LABEL_7:
    double v8 = 0.0;
    goto LABEL_9;
  }
  if (![(SBAppPlatterDragPreview *)self isFlocked])
  {
    [(SBAppPlatterDragPreview *)self iconDragAlpha];
    double v8 = v11;
  }
LABEL_9:
  if (a3) {
    *a3 = v8;
  }
  if (a4) {
    *a4 = v10;
  }
}

- (double)iconDragAlpha
{
  if (self) {
    self = (SBAppPlatterDragPreview *)self->_iconView;
  }
  uint64_t v2 = [(SBAppPlatterDragPreview *)self icon];
  double v3 = [v2 gridSizeClass];
  double v4 = v3;
  double v5 = 0.5;
  if (v3 != (void *)*MEMORY[0x1E4FA6538] && (objc_msgSend(v3, "isEqualToString:") & 1) == 0)
  {
    [MEMORY[0x1E4FA6430] iconLiftAlpha];
    double v5 = v6;
  }

  return v5;
}

- (void)_updateSubviewVisibility
{
  double v16 = 1.0;
  double v17 = 1.0;
  [(SBAppPlatterDragPreview *)self _getIconAlpha:&v17 platterAlpha:&v16];
  if ([(SBAppPlatterDragPreview *)self _effectiveMode] == 1 && !self->_hasAnimatedToBlurredPlatter)
  {
    double v8 = [MEMORY[0x1E4F4F898] factoryWithDuration:0.25];
    [(SBApplicationBlurContentView *)self->_platterView animateToBlurredSnapshotWithFactory:v8 completion:0];
    int v3 = 1;
    self->_hasAnimatedToBlurredPlatter = 1;
  }
  else
  {
    int v3 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke;
  v15[3] = &unk_1E6B01D00;
  v15[4] = self;
  double v4 = (uint64_t (**)(void, double))MEMORY[0x1D948C7A0](v15);
  double v5 = 1.0 - v16;
  if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
    [v6 setDampingRatio:1.0];
    [v6 setResponse:0.25];
    if (v3)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_2;
      v14[3] = &unk_1E6AF4A70;
      v14[4] = self;
      *(double *)&v14[5] = v16;
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v14];
      [(SBAppPlatterDragPreview *)self _setSourcePortalViewHidden:v4[2](v4, v16)];
    }
    else
    {
      if (!self->_platterViewAlphaAnimationCount)
      {
        [(SBApplicationBlurContentView *)self->_platterView alpha];
        if ((BSFloatEqualToFloat() & 1) == 0) {
          [(SBAppPlatterDragPreview *)self _setSourcePortalViewHidden:0];
        }
      }
      ++self->_platterViewAlphaAnimationCount;
      unint64_t v7 = (void *)MEMORY[0x1E4F42FF0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_3;
      v13[3] = &unk_1E6AF4A70;
      v13[4] = self;
      *(double *)&v13[5] = v16;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_4;
      v10[3] = &unk_1E6AF5268;
      v10[4] = self;
      double v11 = v4;
      double v12 = v16;
      [v7 _animateUsingSpringBehavior:v6 tracking:0 animations:v13 completion:v10];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_5;
    v9[3] = &unk_1E6B012E0;
    v9[4] = self;
    *(double *)&v9[5] = v17;
    *(double *)&v9[6] = v16;
    *(double *)&v9[7] = v5;
    [MEMORY[0x1E4F42FF0] _animateUsingSpringBehavior:v6 tracking:0 animations:v9 completion:0];
  }
  else
  {
    [(SBIconView *)self->_iconView setAlpha:v17];
    [(SBApplicationBlurContentView *)self->_platterView setAlpha:v16];
    [(UIView *)self->_unclippedSourceContainerView setAlpha:v5];
    [(SBAppPlatterDragPreview *)self _setSourcePortalViewHidden:v4[2](v4, v16)];
  }
}

uint64_t __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) _isDragging]) {
    return 0;
  }
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 480) superview];
  if (v2 == *(void **)(*(void *)(a1 + 32) + 608)) {
    uint64_t IsOne = 0;
  }
  else {
    uint64_t IsOne = BSFloatIsOne();
  }

  return IsOne;
}

uint64_t __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:*(double *)(a1 + 40)];
}

void __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_4(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 416);
  v1 = *(void **)(a1 + 32);
  if (!v1[52])
  {
    [v1 _setSourcePortalViewHidden:(*(uint64_t (**)(double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 48))];
    double v5 = (void (**)(void))MEMORY[0x1D948C7A0](*(void *)(*(void *)(a1 + 32) + 504));
    if (v5) {
      v5[2]();
    }
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(void **)(v3 + 504);
    *(void *)(v3 + 504) = 0;
  }
}

uint64_t __51__SBAppPlatterDragPreview__updateSubviewVisibility__block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 552) setAlpha:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:*(double *)(a1 + 48)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 608);
  double v3 = *(double *)(a1 + 56);
  return [v2 setAlpha:v3];
}

- (void)_setSourcePortalViewHidden:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__SBAppPlatterDragPreview__setSourcePortalViewHidden___block_invoke;
  v3[3] = &unk_1E6AF5D38;
  v3[4] = self;
  BOOL v4 = a3;
  [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v3];
}

uint64_t __54__SBAppPlatterDragPreview__setSourcePortalViewHidden___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 600) setAlpha:v1];
}

- (double)_effectiveIconContentScale
{
  unint64_t v3 = [(SBAppPlatterDragPreview *)self _effectiveMode];
  double result = 1.0;
  if (!v3)
  {
    unint64_t dragState = self->_dragState;
    if (dragState >= 3)
    {
      if (dragState == 3)
      {
        return self->_iconContentScale;
      }
      else if (dragState == 4)
      {
        return 3.0;
      }
    }
    else
    {
      return self->_iconContentScale * 1.1;
    }
  }
  return result;
}

- (double)_blurContentViewIconViewCenterYOffset
{
  unint64_t v3 = [(SBApplicationBlurContentView *)self->_platterView iconView];
  [(UIView *)self->_iconContainerView bounds];
  double v5 = v4;
  [v3 bounds];
  double v7 = (v5 - v6) * 0.5;

  return v7;
}

- (CGPoint)_effectiveIconContainerCenter
{
  [(SBAppPlatterDragPreview *)self bounds];
  UIRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  if (self->_sourceView || [(SBAppPlatterDragPreview *)self _effectiveMode] && self->_dragState == 3)
  {
    [(SBAppPlatterDragPreview *)self _blurContentViewIconViewCenterYOffset];
    double v6 = v6 + v7;
  }
  double v8 = v4;
  double v9 = v6;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGRect)_effectiveIconViewFrame
{
  [(UIView *)self->_iconContainerView bounds];
  [(SBIconView *)self->_iconView bounds];
  SBRectWithSize();
  UIRectCenteredXInRect();
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_effectivePlatterFrame
{
  unint64_t v3 = [(SBAppPlatterDragPreview *)self _effectiveMode];
  unint64_t v4 = v3;
  if (v3 == 2)
  {
    [(UIView *)self->_sourceView frame];
    CGAffineTransformMakeScale(&v20, self->_sourceViewScale, self->_sourceViewScale);
  }
  else if (!v3)
  {
    iconView = self->_iconView;
    if (!iconView) {
      iconView = self->_referenceIconView;
    }
    [(SBIconView *)iconView iconImageFrame];
    [(SBAppPlatterDragPreview *)self _effectiveIconContentScale];
    CGAffineTransformMakeScale(&v21, v6, v6);
  }
  SBRectWithSize();
  [(SBAppPlatterDragPreview *)self bounds];
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (v4 && !self->_sourceView && self->_dragState != 3)
  {
    [(SBAppPlatterDragPreview *)self _blurContentViewIconViewCenterYOffset];
    double v10 = v10 - v15;
  }
  double v16 = v8;
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (id)_effectiveCornerRadiusConfiguration
{
  unint64_t v3 = [(SBAppPlatterDragPreview *)self _effectiveMode];
  if (v3 - 1 >= 2)
  {
    if (v3)
    {
      unint64_t v4 = 0;
    }
    else
    {
      iconView = self->_iconView;
      if (!iconView) {
        iconView = self->_referenceIconView;
      }
      [(SBIconView *)iconView iconImageInfo];
      double v7 = v6;
      [(SBAppPlatterDragPreview *)self _effectiveIconContentScale];
      unint64_t v4 = (BSCornerRadiusConfiguration *)[objc_alloc(MEMORY[0x1E4F4F700]) initWithCornerRadius:v7 * v8];
    }
  }
  else
  {
    unint64_t v4 = self->_cornerRadiusConfiguration;
  }
  return v4;
}

- (double)_effectiveCornerRadius
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SBAppPlatterDragPreview *)self _effectiveCornerRadiusConfiguration];
  [v2 topLeft];
  double v4 = v3;
  [v2 topRight];
  uint64_t v11 = v5;
  [v2 bottomLeft];
  uint64_t v12 = v6;
  [v2 bottomRight];
  uint64_t v13 = v7;
  for (uint64_t i = 8; i != 32; i += 8)
  {
    if (v4 < *(double *)&v10[i]) {
      double v4 = *(double *)&v10[i];
    }
  }

  return v4;
}

- (void)_updateIconViewComponentVisibility
{
  if (self) {
    iconView = self->_iconView;
  }
  else {
    iconView = 0;
  }
  double v10 = iconView;
  [(SBAppPlatterDragPreview *)self _effectiveIconAccessoryAlpha];
  double v5 = v4;
  if ([(SBAppPlatterDragPreview *)self _effectiveIconAllowsLabelArea]) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  BOOL v7 = [(SBAppPlatterDragPreview *)self _effectiveIconIsHighlighted];
  BOOL v8 = [(SBAppPlatterDragPreview *)self _effectiveIconCanShowCloseBox];
  BOOL v9 = [(SBAppPlatterDragPreview *)self _effectiveIconCanShowResizeHandle];
  [(SBIconView *)v10 setIconAccessoryAlpha:v5];
  [(SBIconView *)v10 setIconLabelAlpha:v6];
  [(SBIconView *)v10 setHighlighted:v7];
  [(SBIconView *)v10 setAllowsCloseBox:v8];
  [(SBIconView *)v10 setAllowsResizeHandle:v9];
}

- (double)_effectiveIconAccessoryAlpha
{
  unint64_t v3 = [(SBAppPlatterDragPreview *)self _effectiveMode];
  double result = 0.0;
  if (!v3)
  {
    unint64_t dragState = self->_dragState;
    if (dragState >= 3)
    {
      if (dragState == 3)
      {
        if (!self->_iconAllowsAccessory) {
          return result;
        }
        return 1.0;
      }
      if (dragState != 4) {
        return result;
      }
    }
    if (!self->_iconAllowsAccessory || self->_flocked) {
      return result;
    }
    return 1.0;
  }
  return result;
}

- (BOOL)_effectiveIconAllowsLabelArea
{
  if ([(SBAppPlatterDragPreview *)self _effectiveMode]) {
    return 0;
  }
  unint64_t dragState = self->_dragState;
  if (dragState < 2)
  {
LABEL_6:
    if (self->_iconAllowsLabelArea) {
      return !self->_flocked;
    }
    return 0;
  }
  if (dragState != 3)
  {
    if (dragState != 4) {
      return 0;
    }
    goto LABEL_6;
  }
  return self->_iconAllowsLabelArea;
}

- (BOOL)_effectiveIconIsHighlighted
{
  return ![(SBAppPlatterDragPreview *)self _effectiveMode]
      && !self->_dragState
      && self->_iconIsHighlighted;
}

- (BOOL)_effectiveIconCanShowCloseBox
{
  if ([(SBAppPlatterDragPreview *)self _effectiveMode]) {
    return 0;
  }
  unint64_t dragState = self->_dragState;
  if (dragState >= 2)
  {
    if (dragState != 3) {
      return 0;
    }
    uint64_t v5 = 436;
  }
  else
  {
    uint64_t v5 = 438;
  }
  if (!*((unsigned char *)&self->super.super.super.isa + v5)) {
    return 0;
  }
  return !self->_flocked;
}

- (BOOL)_effectiveIconCanShowResizeHandle
{
  if ([(SBAppPlatterDragPreview *)self _effectiveMode]) {
    return 0;
  }
  unint64_t dragState = self->_dragState;
  if (dragState >= 2)
  {
    if (dragState != 3) {
      return 0;
    }
    uint64_t v5 = 433;
  }
  else
  {
    uint64_t v5 = 439;
  }
  if (!*((unsigned char *)&self->super.super.super.isa + v5)) {
    return 0;
  }
  return !self->_flocked;
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBAppPlatterDragPreview *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(SBAppPlatterDragPreview *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v4 = [(SBAppPlatterDragPreview *)self succinctDescriptionBuilder];
  unint64_t v5 = [(SBAppPlatterDragPreview *)self mode];
  double v6 = @"SBAppPlatterDragPreviewModeIcon";
  if (v5 == 2) {
    double v6 = @"SBAppPlatterDragPreviewModeSourceView";
  }
  if (v5 == 1) {
    BOOL v7 = @"SBAppPlatterDragPreviewModePlatter";
  }
  else {
    BOOL v7 = v6;
  }
  id v8 = (id)[v4 appendObject:v7 withName:@"mode"];
  unint64_t v9 = [(SBAppPlatterDragPreview *)self dragState];
  if (v9 > 4) {
    double v10 = 0;
  }
  else {
    double v10 = off_1E6B01D20[v9];
  }
  id v11 = (id)[v4 appendObject:v10 withName:@"dragState"];
  [(SBAppPlatterDragPreview *)self platterSize];
  id v12 = (id)objc_msgSend(v4, "appendSize:withName:", @"platterSize");
  [(SBAppPlatterDragPreview *)self sourceViewScale];
  id v13 = (id)objc_msgSend(v4, "appendFloat:withName:", @"sourceViewScale");
  [(SBAppPlatterDragPreview *)self rotation];
  id v14 = (id)objc_msgSend(v4, "appendFloat:withName:", @"rotation");
  return v4;
}

- (unint64_t)dragState
{
  return self->_dragState;
}

- (BOOL)isFlocked
{
  return self->_flocked;
}

- (BOOL)iconCanShowResizeHandle
{
  return self->_iconCanShowResizeHandle;
}

- (BOOL)iconAllowsLabelArea
{
  return self->_iconAllowsLabelArea;
}

- (BOOL)iconAllowsAccessory
{
  return self->_iconAllowsAccessory;
}

- (BOOL)iconCanShowCloseBox
{
  return self->_iconCanShowCloseBox;
}

- (double)iconContentScale
{
  return self->_iconContentScale;
}

- (id)cleanUpHandler
{
  return self->_cleanUpHandler;
}

- (void)setCleanUpHandler:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 480), a2);
  }
}

- (double)sourceViewScale
{
  return self->_sourceViewScale;
}

- (void)setSourceViewScale:(double)a3
{
  self->_sourceViewScale = a3;
}

- (SBApplicationBlurContentView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 496), a2);
  }
}

- (id)platterViewAlphaAnimationCompletionBlock
{
  return self->_platterViewAlphaAnimationCompletionBlock;
}

- (void)setPlatterViewAlphaAnimationCompletionBlock:(id)a3
{
}

- (CGSize)platterSize
{
  double width = self->_platterSize.width;
  double height = self->_platterSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SBDragPreviewShadowParameters)diffuseShadowParameters
{
  return self;
}

- (SBDragPreviewShadowParameters)rimShadowParameters
{
  return self;
}

- (NSArray)diffuseShadowFilters
{
  return self->_diffuseShadowFilters;
}

- (NSArray)rimShadowFilters
{
  return self->_rimShadowFilters;
}

- (BSCornerRadiusConfiguration)cornerRadiusConfiguration
{
  return self->_cornerRadiusConfiguration;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (uint64_t)referenceIconView
{
  if (result) {
    return *(void *)(result + 544);
  }
  return result;
}

- (void)setReferenceIconView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 544), a2);
  }
}

- (void)setIconView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 552), a2);
  }
}

- (uint64_t)captureOnlyBackgroundView
{
  if (result) {
    return *(void *)(result + 560);
  }
  return result;
}

- (void)setCaptureOnlyBackgroundView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 560), a2);
  }
}

- (BOOL)iconIsHighlighted
{
  if (result) {
    return *(unsigned char *)(result + 437) != 0;
  }
  return result;
}

- (uint64_t)setIconIsHighlighted:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 437) = a2;
  }
  return result;
}

- (BOOL)iconInitiallyShowingCloseBox
{
  if (result) {
    return *(unsigned char *)(result + 438) != 0;
  }
  return result;
}

- (uint64_t)setIconInitiallyShowingCloseBox:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 438) = a2;
  }
  return result;
}

- (BOOL)iconInitiallyShowingResizeHandle
{
  if (result) {
    return *(unsigned char *)(result + 439) != 0;
  }
  return result;
}

- (uint64_t)setIconInitiallyShowingResizeHandle:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 439) = a2;
  }
  return result;
}

- (uint64_t)anchorPointAdjustmentContainerView
{
  if (result) {
    return *(void *)(result + 576);
  }
  return result;
}

- (void)setAnchorPointAdjustmentContainerView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 576), a2);
  }
}

- (uint64_t)iconContainerView
{
  if (result) {
    return *(void *)(result + 584);
  }
  return result;
}

- (void)setIconContainerView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 584), a2);
  }
}

- (uint64_t)cornerMaskingView
{
  if (result) {
    return *(void *)(result + 592);
  }
  return result;
}

- (void)setCornerMaskingView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 592), a2);
  }
}

- (uint64_t)sourcePortalView
{
  if (result) {
    return *(void *)(result + 600);
  }
  return result;
}

- (void)setSourcePortalView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 600), a2);
  }
}

- (uint64_t)unclippedSourceContainerView
{
  if (result) {
    return *(void *)(result + 608);
  }
  return result;
}

- (void)setUnclippedSourceContainerView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 608), a2);
  }
}

- (uint64_t)diffuseShadowView
{
  if (result) {
    return *(void *)(result + 616);
  }
  return result;
}

- (void)setDiffuseShadowView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 616), a2);
  }
}

- (uint64_t)rimShadowView
{
  if (result) {
    return *(void *)(result + 624);
  }
  return result;
}

- (void)setRimShadowView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 624), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rimShadowView, 0);
  objc_storeStrong((id *)&self->_diffuseShadowView, 0);
  objc_storeStrong((id *)&self->_unclippedSourceContainerView, 0);
  objc_storeStrong((id *)&self->_sourcePortalView, 0);
  objc_storeStrong((id *)&self->_cornerMaskingView, 0);
  objc_storeStrong((id *)&self->_iconContainerView, 0);
  objc_storeStrong((id *)&self->_anchorPointAdjustmentContainerView, 0);
  objc_storeStrong((id *)&self->_customIconImageViewController, 0);
  objc_storeStrong((id *)&self->_captureOnlyBackgroundView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_referenceIconView, 0);
  objc_storeStrong((id *)&self->_cornerRadiusConfiguration, 0);
  objc_storeStrong((id *)&self->_rimShadowFilters, 0);
  objc_storeStrong((id *)&self->_diffuseShadowFilters, 0);
  objc_storeStrong(&self->_platterViewAlphaAnimationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong(&self->_cleanUpHandler, 0);
  objc_storeStrong((id *)&self->_cleanupDelayAssertions, 0);
}

- (void)setDragState:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = NSStringFromSelector(a1);
  double v6 = (objc_class *)objc_opt_class();
  BOOL v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  unint64_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  double v15 = @"SBAppPlatterDragPreview.m";
  __int16 v16 = 1024;
  int v17 = 381;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end