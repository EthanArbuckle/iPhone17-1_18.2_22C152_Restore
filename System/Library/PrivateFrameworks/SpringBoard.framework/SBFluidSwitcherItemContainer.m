@interface SBFluidSwitcherItemContainer
+ (Class)layerClass;
+ (double)preferredRestingVisibleMarginForBounds:(CGRect)a3;
- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4;
- (BOOL)_scrollViewShouldPanGestureTryToBegin:(id)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)appSwitcherPageView:(id)a3 shouldBeginPointerInteractionAtLocation:(CGPoint)a4 window:(id)a5;
- (BOOL)clipsToUnobscuredMargin;
- (BOOL)contentViewBlocksTouches;
- (BOOL)contentViewHasSceneOverlay;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isActive;
- (BOOL)isDeceleratingTowardsKillZone;
- (BOOL)isDraggable;
- (BOOL)isDragging;
- (BOOL)isEligibleForContentDragSpringLoading;
- (BOOL)isFocusable;
- (BOOL)isHighlightedFromCursorHover;
- (BOOL)isHighlightedFromDirectTouch;
- (BOOL)isKillable;
- (BOOL)isLifted;
- (BOOL)isOccludedInContinuousExposeStage;
- (BOOL)isPointerInteractionEnabled;
- (BOOL)isPreferredPointerLockStatusSuppressed;
- (BOOL)isResizingAllowed;
- (BOOL)isRubberbandable;
- (BOOL)isSelectable;
- (BOOL)isVisible;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)positionAnimationsBeginFromModelState;
- (BOOL)shouldApplyMeshWarp;
- (BOOL)shouldScaleOverlayToFillBounds;
- (BOOL)shouldUseBackgroundWallpaperTreatment;
- (BOOL)shouldUseWallpaperGradientTreatment;
- (BOOL)supportsSwitcherDragAndDrop;
- (BOOL)suppressesHighlightEffect;
- (BOOL)transformAnimationsAreLegacyCounterRotations;
- (CAMeshTransform)meshTransform;
- (CGPoint)_CGPointFromScalarBasedOnKillAxis:(double)a3;
- (CGPoint)_contentOffsetAtRest;
- (CGPoint)_contentOffsetForKillingProgress:(double)a3;
- (CGPoint)meshWarpCollapsedTargetPosition;
- (CGPoint)meshWarpExpandedSourcePosition;
- (CGPoint)pageViewAnchorPoint;
- (CGPoint)pageViewOffset;
- (CGRect)_frameForPageView;
- (CGRect)_frameForPageViewWithFullPresentedSize:(CGSize)a3;
- (CGRect)_frameForScrollView;
- (CGRect)_frameForScrollViewWithFullPresentedSize:(CGSize)a3;
- (CGRect)effectivePageViewPresentationFrame;
- (CGSize)_CGSizeFromLengthBasedOnKillAxis:(double)a3;
- (CGSize)_contentSizeForScrollView;
- (CGSize)sizeForContainingSpace;
- (NSString)description;
- (SBAffordancePresenceController)affordancePresenceController;
- (SBAppLayout)appLayout;
- (SBAppSwitcherPageContentView)contentView;
- (SBDragPreviewShadowParameters)initialDiffuseShadowParameters;
- (SBDragPreviewShadowParameters)initialRimShadowParameters;
- (SBFluidSwitcherItemContainer)initWithCoder:(id)a3;
- (SBFluidSwitcherItemContainer)initWithFrame:(CGRect)a3;
- (SBFluidSwitcherItemContainer)initWithFrame:(CGRect)a3 appLayout:(id)a4 delegate:(id)a5 active:(BOOL)a6 windowScene:(id)a7;
- (SBFluidSwitcherItemContainerDelegate)delegate;
- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributes;
- (UIRectCornerRadii)contentCornerRadii;
- (UIView)contentOverlay;
- (double)_CGPointXOrYBasedOnKillAxis:(CGPoint)a3;
- (double)_CGSizeWidthOrHeightBasedOnKillAxis:(CGSize)a3;
- (double)_inverseScaleTransformFactor;
- (double)_killingProgressForContentOffset:(CGPoint)a3;
- (double)_scaleForHighlightFromCursorHover;
- (double)_scaleForHighlightFromDirectTouch;
- (double)blurViewIconScale;
- (double)contentAlpha;
- (double)contentPageViewScale;
- (double)currentStatusBarHeight;
- (double)dimmingAlpha;
- (double)effectivePageViewPresentationCornerRadius;
- (double)killingProgress;
- (double)lighteningAlpha;
- (double)minimumTranslationForKillingContainer;
- (double)pointerInteractionHitTestPadding;
- (double)shadowAlpha;
- (double)shadowOffset;
- (double)unobscuredMargin;
- (double)wallpaperOverlayAlpha;
- (id)_createScrollView;
- (id)_pageView;
- (id)_springLoadingEffectTargetView;
- (id)containerViewForBlurContentView;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)focusEffect;
- (id)initialCornerRadiusConfiguration;
- (id)initialDiffuseShadowFilters;
- (id)initialRimShadowFilters;
- (id)layer;
- (int64_t)shadowStyle;
- (int64_t)tintStyle;
- (unint64_t)allowedTouchResizeCorners;
- (unint64_t)killAxis;
- (unint64_t)maskedCorners;
- (unint64_t)pointerIsHoveringOverEdge;
- (void)_addPageView;
- (void)_ensureSubviewOrder;
- (void)_handleHoverGesture:(id)a3;
- (void)_handlePageViewTap:(id)a3;
- (void)_handleSelectionHighlightGesture:(id)a3;
- (void)_notifyDelegateScrollViewDidChange;
- (void)_resetKillProgressScrollState;
- (void)_returnKeyPressed:(id)a3;
- (void)_updateAccessibilityIdentifier;
- (void)_updateForPointerHoveringOverEdge:(unint64_t)a3;
- (void)_updateKillScrollViewEnabled;
- (void)_updatePageViewContentClippingFrame;
- (void)_updatePageViewContentViewClipping;
- (void)_updateShadowVisibility;
- (void)_updateTransformForCurrentHighlight;
- (void)affordancePresenceController:(id)a3 didChangeToPresence:(int64_t)a4;
- (void)appSwitcherPageView:(id)a3 pointerIsHoveringOverEdge:(unint64_t)a4;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)gestureRecognizerTransitionedToFailed:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActive:(BOOL)a3;
- (void)setAllowedTouchResizeCorners:(unint64_t)a3;
- (void)setAppLayout:(id)a3;
- (void)setBlurViewIconScale:(double)a3;
- (void)setBlurred:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8;
- (void)setClipsToUnobscuredMargin:(BOOL)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentCornerRadii:(UIRectCornerRadii)a3;
- (void)setContentOverlay:(id)a3;
- (void)setContentOverlay:(id)a3 animated:(BOOL)a4;
- (void)setContentPageViewScale:(double)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewBlocksTouches:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingAlpha:(double)a3;
- (void)setDraggable:(BOOL)a3;
- (void)setDragging:(BOOL)a3;
- (void)setEligibleForContentDragSpringLoading:(BOOL)a3;
- (void)setFocusable:(BOOL)a3;
- (void)setHighlightedFromCursorHover:(BOOL)a3;
- (void)setHighlightedFromDirectTouch:(BOOL)a3;
- (void)setHoveringOverEdge:(unint64_t)a3;
- (void)setKillAxis:(unint64_t)a3;
- (void)setKillable:(BOOL)a3;
- (void)setLifted:(BOOL)a3;
- (void)setLighteningAlpha:(double)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setMeshTransform:(id)a3;
- (void)setMeshWarpCollapsedTargetPosition:(CGPoint)a3;
- (void)setMeshWarpExpandedSourcePosition:(CGPoint)a3;
- (void)setMinimumTranslationForKillingContainer:(double)a3;
- (void)setOccludedInContinuousExposeStage:(BOOL)a3;
- (void)setPageViewAnchorPoint:(CGPoint)a3;
- (void)setPageViewOffset:(CGPoint)a3;
- (void)setPointerInteractionEnabled:(BOOL)a3;
- (void)setPointerInteractionHitTestPadding:(double)a3;
- (void)setPositionAnimationsBeginFromModelState:(BOOL)a3;
- (void)setPreferredPointerLockStatusSuppressed:(BOOL)a3;
- (void)setResizingAllowed:(BOOL)a3;
- (void)setRubberbandable:(BOOL)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setShadowOffset:(double)a3;
- (void)setShadowStyle:(int64_t)a3;
- (void)setShouldApplyMeshWarp:(BOOL)a3;
- (void)setShouldScaleOverlayToFillBounds:(BOOL)a3;
- (void)setShouldUseBackgroundWallpaperTreatment:(BOOL)a3;
- (void)setShouldUseWallpaperGradientTreatment:(BOOL)a3;
- (void)setSizeForContainingSpace:(CGSize)a3;
- (void)setSupportsSwitcherDragAndDrop:(BOOL)a3;
- (void)setSuppressesHighlightEffect:(BOOL)a3;
- (void)setTintStyle:(int64_t)a3;
- (void)setTransformAnimationsAreLegacyCounterRotations:(BOOL)a3;
- (void)setUnobscuredMargin:(double)a3;
- (void)setVisible:(BOOL)a3;
- (void)setWallpaperGradientAttributes:(SBSwitcherWallpaperGradientAttributes)a3;
- (void)setWallpaperOverlayAlpha:(double)a3;
@end

@implementation SBFluidSwitcherItemContainer

- (void)setShouldScaleOverlayToFillBounds:(BOOL)a3
{
  if (self->_shouldScaleOverlayToFillBounds != a3)
  {
    self->_shouldScaleOverlayToFillBounds = a3;
    -[SBAppSwitcherPageView setShouldScaleOverlayToFillBounds:](self->_pageView, "setShouldScaleOverlayToFillBounds:");
  }
}

- (void)setUnobscuredMargin:(double)a3
{
  if (self->_unobscuredMargin != a3)
  {
    v5 = [(SBFluidSwitcherItemContainer *)self layer];
    char v6 = [v5 shouldRasterize];

    if (v6)
    {
      if (self->_unobscuredMargin < a3)
      {
        double v7 = a3 + a3;
        [(SBFluidSwitcherItemContainer *)self bounds];
        CGFloat Width = CGRectGetWidth(v10);
        if (v7 < Width) {
          CGFloat Width = v7;
        }
        self->_unobscuredMargin = Width;
        [(SBFluidSwitcherItemContainer *)self _updatePageViewContentClippingFrame];
        [(SBFluidSwitcherItemContainer *)self setNeedsDisplay];
      }
    }
    else
    {
      self->_unobscuredMargin = a3;
      [(SBFluidSwitcherItemContainer *)self _updatePageViewContentClippingFrame];
    }
  }
}

- (void)setSuppressesHighlightEffect:(BOOL)a3
{
  self->_suppressesHighlightEffect = a3;
}

- (void)setSelectable:(BOOL)a3
{
  if (self->_preferredPointerLockStatusSuppressed) {
    a3 = 1;
  }
  self->_selectable = a3;
}

- (void)setRubberbandable:(BOOL)a3
{
  if (self->_rubberbandable != a3)
  {
    self->_rubberbandable = a3;
    [(SBFluidSwitcherItemContainer *)self _updateKillScrollViewEnabled];
  }
}

- (void)setKillable:(BOOL)a3
{
  if (self->_killable != a3)
  {
    self->_killable = a3;
    [(SBFluidSwitcherItemContainer *)self _updateKillScrollViewEnabled];
    if (!a3) {
      [(SBFluidSwitcherItemContainer *)self _resetKillProgressScrollState];
    }
    [(SBFluidSwitcherItemContainer *)self setNeedsLayout];
  }
}

- (void)setKillAxis:(unint64_t)a3
{
  if (self->_killAxis != a3)
  {
    self->_killAxis = a3;
    [(SBFluidSwitcherItemContainer *)self setNeedsLayout];
    [(SBFluidSwitcherItemContainer *)self layoutIfNeeded];
    [(SBFluidSwitcherItemContainer *)self _resetKillProgressScrollState];
  }
}

- (void)setFocusable:(BOOL)a3
{
  if (self->_focusable != a3)
  {
    if (self->_focusable) {
      [(SBFluidSwitcherItemContainer *)self resignFirstResponder];
    }
    self->_focusable = a3;
  }
}

- (void)setEligibleForContentDragSpringLoading:(BOOL)a3
{
  self->_eligibleForContentDragSpringLoading = a3;
}

- (void)setClipsToUnobscuredMargin:(BOOL)a3
{
  if (self->_clipsToUnobscuredMargin != a3)
  {
    self->_clipsToUnobscuredMargin = a3;
    [(SBFluidSwitcherItemContainer *)self _updatePageViewContentViewClipping];
    [(SBFluidSwitcherItemContainer *)self _updatePageViewContentClippingFrame];
  }
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    BOOL v3 = a3;
    self->_visible = a3;
    if (a3)
    {
      [(SBFluidSwitcherItemContainer *)self _resetKillProgressScrollState];
      self->_sentKillRequest = 0;
    }
    else
    {
      [(SBFluidSwitcherItemContainer *)self setHighlightedFromDirectTouch:0];
    }
    pageView = self->_pageView;
    [(SBAppSwitcherPageView *)pageView setVisible:v3];
  }
}

- (void)setWallpaperGradientAttributes:(SBSwitcherWallpaperGradientAttributes)a3
{
}

- (void)setTransformAnimationsAreLegacyCounterRotations:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBFluidSwitcherItemContainer *)self layer];
  [v4 setTransformAnimationsAreLegacyCounterRotations:v3];
}

- (void)setPositionAnimationsBeginFromModelState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBFluidSwitcherItemContainer *)self layer];
  [v4 setPositionAnimationsBeginFromModelState:v3];
}

- (void)setShouldUseWallpaperGradientTreatment:(BOOL)a3
{
}

- (void)setWallpaperOverlayAlpha:(double)a3
{
}

- (void)setTintStyle:(int64_t)a3
{
}

- (void)setShouldUseBackgroundWallpaperTreatment:(BOOL)a3
{
}

- (void)setShadowStyle:(int64_t)a3
{
}

- (void)setShadowOffset:(double)a3
{
}

- (void)setShadowAlpha:(double)a3
{
}

- (void)setResizingAllowed:(BOOL)a3
{
}

- (void)setPointerInteractionHitTestPadding:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_pointerInteractionHitTestPadding = a3;
    pageView = self->_pageView;
    [(SBAppSwitcherPageView *)pageView setPointerInteractionHitTestPadding:a3];
  }
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  if (self->_pointerInteractionEnabled != a3)
  {
    self->_pointerInteractionEnabled = a3;
    [(SBFluidSwitcherItemContainer *)self _updateTransformForCurrentHighlight];
  }
}

- (void)setOccludedInContinuousExposeStage:(BOOL)a3
{
}

- (void)setLighteningAlpha:(double)a3
{
}

- (void)setDimmingAlpha:(double)a3
{
}

- (void)setAllowedTouchResizeCorners:(unint64_t)a3
{
}

- (void)setContentViewBlocksTouches:(BOOL)a3
{
  if (self->_preferredPointerLockStatusSuppressed) {
    *(void *)&a3 = 1;
  }
  else {
    BOOL v3 = a3;
  }
  [(SBAppSwitcherPageView *)self->_pageView setBlocksTouches:a3];
}

- (id)layer
{
  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherItemContainer;
  v2 = [(SBFluidSwitcherItemContainer *)&v4 layer];
  return v2;
}

- (SBAppSwitcherPageContentView)contentView
{
  return [(SBAppSwitcherPageView *)self->_pageView view];
}

- (UIView)contentOverlay
{
  return [(SBAppSwitcherPageView *)self->_pageView overlay];
}

- (void)setSupportsSwitcherDragAndDrop:(BOOL)a3
{
  self->_supportsSwitcherDragAndDrop = a3;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    -[SBAppSwitcherPageView setMaskedCorners:](self->_pageView, "setMaskedCorners:");
  }
}

- (void)setDraggable:(BOOL)a3
{
  if (self->_draggable != a3) {
    self->_draggable = a3;
  }
}

- (void)setBlurred:(BOOL)a3 duration:(double)a4 blurDelay:(double)a5 iconViewScale:(double)a6 began:(id)a7 completion:(id)a8
{
  BOOL v11 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v13 = (void (**)(void))a7;
  v14 = (void (**)(void))a8;
  if (self->_blurred != v11)
  {
    self->_blurred = v11;
    if (v13) {
      v13[2](v13);
    }
    v15 = [MEMORY[0x1E4F4F898] factoryWithDuration:a4];
    if (self->_blurred)
    {
      if (!self->_blurView)
      {
        v20 = [(SBAppLayout *)self->_appLayout allItems];
        v21 = [v20 firstObject];
        v22 = [v21 bundleIdentifier];

        v23 = [(SBAppSwitcherPageView *)self->_pageView overlay];
        v24 = v23;
        if (v23)
        {
          id v25 = v23;
        }
        else
        {
          id v25 = [(SBAppSwitcherPageView *)self->_pageView view];
        }
        v26 = v25;

        v27 = [SBApplicationBlurContentView alloc];
        [(SBAppSwitcherPageView *)self->_pageView frame];
        v28 = -[SBApplicationBlurContentView initWithFrame:bundleIdentifier:targetViewToBlur:initialIconScale:](v27, "initWithFrame:bundleIdentifier:targetViewToBlur:initialIconScale:", v22, v26);
        blurView = self->_blurView;
        self->_blurView = v28;

        [(SBApplicationBlurContentView *)self->_blurView setBlurDelay:a5];
        [(SBApplicationBlurContentView *)self->_blurView setClipsToBounds:1];
        v30 = [(SBApplicationBlurContentView *)self->_blurView layer];
        [v30 setAllowsGroupOpacity:1];

        [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView addSubview:self->_blurView];
        double topLeft = self->_contentCornerRadii.topLeft;
        double topRight = self->_contentCornerRadii.topRight;
        long long v44 = *(_OWORD *)&self->_contentCornerRadii.bottomLeft;
        for (uint64_t i = 8; i != 32; i += 8)
        {
          if (topLeft < *(double *)&v42[i]) {
            double topLeft = *(double *)&v42[i];
          }
        }
        [(SBApplicationBlurContentView *)self->_blurView _setContinuousCornerRadius:topLeft];
        [(SBFluidSwitcherItemContainer *)self setNeedsLayout];
        v33 = self->_blurView;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke;
        v40[3] = &unk_1E6AF6828;
        v40[4] = self;
        v41 = v14;
        [(SBApplicationBlurContentView *)v33 generateAndAnimateToBlurredSnapshotWithAnimationFactory:v15 completion:v40];

        goto LABEL_20;
      }
      v16 = (void *)MEMORY[0x1E4F4F898];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_2;
      v39[3] = &unk_1E6AF4AC0;
      v39[4] = self;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_3;
      v37[3] = &unk_1E6AF5AA0;
      v37[4] = self;
      v38 = v14;
      [v16 animateWithFactory:v15 options:4 actions:v39 completion:v37];
      v17 = v38;
    }
    else
    {
      v18 = [(SBAppSwitcherPageView *)self->_pageView overlay];
      [v18 setHidden:0];

      if (!self->_blurView)
      {
        if (v14) {
          v14[2](v14);
        }
        goto LABEL_20;
      }
      v19 = (void *)MEMORY[0x1E4F4F898];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_4;
      v36[3] = &unk_1E6AF4AC0;
      v36[4] = self;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_5;
      v34[3] = &unk_1E6AF5AA0;
      v34[4] = self;
      v35 = v14;
      [v19 animateWithFactory:v15 options:4 actions:v36 completion:v34];
      v17 = v35;
    }

LABEL_20:
  }
}

- (void)setSizeForContainingSpace:(CGSize)a3
{
  self->_sizeForContainingSpace = a3;
}

- (void)setPageViewOffset:(CGPoint)a3
{
  if (a3.x != self->_pageViewOffset.x || a3.y != self->_pageViewOffset.y)
  {
    self->_pageViewOffset = a3;
    [(SBFluidSwitcherItemContainer *)self setNeedsLayout];
  }
}

- (void)setPageViewAnchorPoint:(CGPoint)a3
{
  p_pageViewAnchorPoint = &self->_pageViewAnchorPoint;
  if (a3.x != self->_pageViewAnchorPoint.x || a3.y != self->_pageViewAnchorPoint.y)
  {
    p_pageViewAnchorPoint->x = a3.x;
    self->_pageViewAnchorPoint.y = a3.y;
    char v6 = [(SBAppSwitcherPageView *)self->_pageView layer];
    objc_msgSend(v6, "setAnchorPoint:", p_pageViewAnchorPoint->x, p_pageViewAnchorPoint->y);

    [(SBFluidSwitcherItemContainer *)self setNeedsLayout];
  }
}

- (void)setMinimumTranslationForKillingContainer:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_minimumTranslationForKillingContainer = a3;
    [(SBFluidSwitcherItemContainer *)self setNeedsLayout];
  }
}

- (void)setContentPageViewScale:(double)a3
{
  if (self->_contentPageViewScale != a3)
  {
    self->_contentPageViewScale = a3;
    -[SBAppSwitcherPageView setSwitcherCardScale:](self->_pageView, "setSwitcherCardScale:");
    [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView setVelocityScaleFactor:self->_killScrollViewInitialVelocityScaleFactor * self->_contentPageViewScale];
    [(SBFluidSwitcherItemContainer *)self setNeedsLayout];
    [(SBFluidSwitcherItemContainer *)self layoutIfNeeded];
  }
}

- (void)setBlurViewIconScale:(double)a3
{
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"zPosition"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFluidSwitcherItemContainer;
    BOOL v5 = [(SBFluidSwitcherItemContainer *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (SBAffordancePresenceController)affordancePresenceController
{
  return self->_affordancePresenceController;
}

- (void)setContentCornerRadii:(UIRectCornerRadii)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_contentCornerRadiuint64_t i = &self->_contentCornerRadii;
  if (a3.topLeft != self->_contentCornerRadii.topLeft
    || a3.bottomLeft != self->_contentCornerRadii.bottomLeft
    || a3.bottomRight != self->_contentCornerRadii.bottomRight
    || a3.topRight != self->_contentCornerRadii.topRight)
  {
    p_contentCornerRadii->double topLeft = a3.topLeft;
    self->_contentCornerRadii.bottomLeft = a3.bottomLeft;
    self->_contentCornerRadii.bottomRight = a3.bottomRight;
    self->_contentCornerRadii.double topRight = a3.topRight;
    -[SBAppSwitcherPageView setCornerRadii:](self->_pageView, "setCornerRadii:");
    double topLeft = p_contentCornerRadii->topLeft;
    double topRight = p_contentCornerRadii->topRight;
    long long v13 = *(_OWORD *)&p_contentCornerRadii->bottomLeft;
    for (uint64_t i = 8; i != 32; i += 8)
    {
      if (topLeft < *(double *)&v11[i]) {
        double topLeft = *(double *)&v11[i];
      }
    }
    [(SBApplicationBlurContentView *)self->_blurView _setContinuousCornerRadius:topLeft];
    iconOverlayView = self->_iconOverlayView;
    [(SBFluidSwitcherIconOverlayView *)iconOverlayView setCornerRadius:topLeft];
  }
}

- (double)currentStatusBarHeight
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained currentStatusBarHeightOfContainer:self];
  double v5 = v4;

  return v5;
}

- (CGRect)_frameForPageViewWithFullPresentedSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  char v6 = [(SBFluidSwitcherItemContainer *)self delegate];
  [v6 frameForPageViewOfContainer:self fullyPresented:0];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1 && self->_killAxis == 1)
  {
    [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView contentSize];
    double v16 = v15;
    [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView bounds];
    double v18 = v8 + v16 - v17;
  }
  else
  {
    [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView bounds];
    -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", v19, v20);
    double v22 = v21;
    -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", width, height);
    [(SBFluidSwitcherItemContainer *)self _CGPointFromScalarBasedOnKillAxis:v22 - v23];
    double v18 = v24;
    double v10 = v25;
  }

  double v26 = v18;
  double v27 = v10;
  double v28 = v12;
  double v29 = v14;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)SBFluidSwitcherItemContainer;
  [(SBFTouchPassThroughClippingView *)&v36 layoutSubviews];
  BOOL v3 = [(SBFluidSwitcherItemContainer *)self delegate];
  [v3 frameForPageViewOfContainer:self fullyPresented:1];
  double v5 = v4;
  double v7 = v6;
  -[SBFluidSwitcherItemContainer _frameForScrollViewWithFullPresentedSize:](self, "_frameForScrollViewWithFullPresentedSize:", v4, v6);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView frame];
  v38.origin.x = v9;
  v38.origin.y = v11;
  v38.size.double width = v13;
  v38.size.double height = v15;
  if (!CGRectEqualToRect(v37, v38)) {
    -[SBFluidSwitcherTouchPassThroughScrollView setFrame:](self->_killScrollView, "setFrame:", v9, v11, v13, v15);
  }
  [(SBFluidSwitcherItemContainer *)self _contentSizeForScrollView];
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView contentSize];
  if ((BSSizeEqualToSize() & 1) == 0)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __46__SBFluidSwitcherItemContainer_layoutSubviews__block_invoke;
    v35[3] = &unk_1E6AF4AE8;
    v35[4] = self;
    v35[5] = v17;
    v35[6] = v19;
    double v20 = (void (**)(void))MEMORY[0x1D948C7A0](v35);
    if ([MEMORY[0x1E4F42FF0] _isInRetargetableAnimationBlock])
    {
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v20];
    }
    else if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
    {
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v20];
    }
    else
    {
      v20[2](v20);
    }
  }
  -[SBFluidSwitcherItemContainer _frameForPageViewWithFullPresentedSize:](self, "_frameForPageViewWithFullPresentedSize:", v5, v7);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  pageView = self->_pageView;
  SBRectWithSize();
  -[SBAppSwitcherPageView setBounds:](pageView, "setBounds:");
  UIRectGetCenter();
  -[SBAppSwitcherPageView setCenter:](self->_pageView, "setCenter:", v30 + v26 * (self->_pageViewAnchorPoint.x + -0.5) + self->_pageViewOffset.x, v31 + v28 * (self->_pageViewAnchorPoint.y + -0.5) + self->_pageViewOffset.y);
  -[SBAppSwitcherPageView setOrientation:](self->_pageView, "setOrientation:", [v3 switcherInterfaceOrientation]);
  -[SBAppSwitcherPageView setOverlayViewSize:](self->_pageView, "setOverlayViewSize:", v5, v7);
  -[SBAppSwitcherPageView setFullyPresentedSize:](self->_pageView, "setFullyPresentedSize:", v5, v7);
  blurView = self->_blurView;
  if (blurView)
  {
    [(SBAppSwitcherPageView *)self->_pageView bounds];
    -[SBApplicationBlurContentView setBounds:](blurView, "setBounds:");
    v33 = self->_blurView;
    [(SBAppSwitcherPageView *)self->_pageView center];
    -[SBApplicationBlurContentView setCenter:](v33, "setCenter:");
  }
  [(SBFluidSwitcherItemContainer *)self _updatePageViewContentClippingFrame];
  iconOverlayView = self->_iconOverlayView;
  if (iconOverlayView) {
    -[BSUIOrientationTransformWrapperView setFrame:](iconOverlayView, "setFrame:", v22, v24, v26, v28);
  }
  [(SBFluidSwitcherItemContainer *)self _ensureSubviewOrder];
}

- (SBFluidSwitcherItemContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherItemContainerDelegate *)WeakRetained;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void)_updatePageViewContentClippingFrame
{
  [(SBAppSwitcherPageView *)self->_pageView bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  if (self->_clipsToUnobscuredMargin)
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      [(SBFluidSwitcherItemContainer *)self _frameForPageView];
      double v11 = v10;
      double unobscuredMargin = self->_unobscuredMargin;
      double v5 = v11 - unobscuredMargin;
    }
    else
    {
      double unobscuredMargin = self->_unobscuredMargin;
    }
  }
  pageView = self->_pageView;
  -[SBAppSwitcherPageView setContentClippingFrame:](pageView, "setContentClippingFrame:", v5, v7, unobscuredMargin, v9);
}

- (CGRect)_frameForScrollViewWithFullPresentedSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  SBRectWithSize();
  -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", v6, v7);
  [(SBFluidSwitcherItemContainer *)self _CGSizeFromLengthBasedOnKillAxis:v8 * 0.5];
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] != 1 || self->_killAxis != 1)
  {
    -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", width, height);
    [(SBFluidSwitcherItemContainer *)self _CGPointFromScalarBasedOnKillAxis:v9 * 0.5];
  }
  SBScreenScale();
  BSRectRoundForScale();
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (double)_CGSizeWidthOrHeightBasedOnKillAxis:(CGSize)a3
{
  if (!self->_killAxis) {
    a3.double width = a3.height;
  }
  return a3.width;
}

- (CGPoint)_CGPointFromScalarBasedOnKillAxis:(double)a3
{
  unint64_t killAxis = self->_killAxis;
  double v4 = 0.0;
  if (killAxis) {
    double v5 = a3;
  }
  else {
    double v5 = 0.0;
  }
  if (!killAxis) {
    double v4 = a3;
  }
  double v6 = v5;
  result.y = v4;
  result.x = v6;
  return result;
}

- (void)_ensureSubviewOrder
{
  [(SBFTouchPassThroughClippingView *)self bringSubviewToFront:self->_killScrollView];
  killScrollView = self->_killScrollView;
  iconOverlayView = self->_iconOverlayView;
  [(SBFluidSwitcherTouchPassThroughScrollView *)killScrollView bringSubviewToFront:iconOverlayView];
}

- (CGSize)_contentSizeForScrollView
{
  [(SBFluidSwitcherItemContainer *)self contentPageViewScale];
  if (self->_killable && (double v4 = v3, BSFloatGreaterThanFloat()))
  {
    double v5 = self->_minimumTranslationForKillingContainer / v4;
    [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView bounds];
    -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", v6, v7);
    double v9 = v5 + v8 + v5 + v8;
    [(SBFluidSwitcherItemContainer *)self _CGSizeFromLengthBasedOnKillAxis:v9];
  }
  else
  {
    [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView bounds];
    double v13 = v12;
    [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView bounds];
    double v11 = v14 + 1.0;
    double v10 = v13;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (double)contentPageViewScale
{
  return self->_contentPageViewScale;
}

- (CGSize)_CGSizeFromLengthBasedOnKillAxis:(double)a3
{
  unint64_t killAxis = self->_killAxis;
  double v4 = 0.0;
  if (killAxis) {
    double v5 = a3;
  }
  else {
    double v5 = 0.0;
  }
  if (!killAxis) {
    double v4 = a3;
  }
  double v6 = v5;
  result.double height = v4;
  result.double width = v6;
  return result;
}

- (id)_pageView
{
  return self->_pageView;
}

- (void)setMeshTransform:(id)a3
{
  if ((unint64_t)a3 | (unint64_t)self->_meshTransform)
  {
    self->_meshTransform = (CAMeshTransform *)a3;
    id v4 = a3;
    id v5 = [(SBFluidSwitcherItemContainer *)self layer];
    [v5 setValue:self->_meshTransform forKey:@"meshTransform"];
  }
}

- (void)setContentOverlay:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = a3 != 0;
  id v7 = a3;
  [(SBFTouchPassThroughClippingView *)self setHitTestsSubviewsOutsideBounds:v6];
  [(SBHitTestExtendedView *)self->_pageView setHitTestsSubviewsOutsideBounds:[(SBFTouchPassThroughClippingView *)self hitTestsSubviewsOutsideBounds]];
  [(SBAppSwitcherPageView *)self->_pageView setOverlay:v7 animated:v4];
}

- (void)setAppLayout:(id)a3
{
  id v5 = (SBAppLayout *)a3;
  if (self->_appLayout != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_appLayout, a3);
    [(SBFluidSwitcherItemContainer *)self setNeedsLayout];
    [(SBFluidSwitcherItemContainer *)self _updateAccessibilityIdentifier];
    id v5 = v6;
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    if (a3)
    {
      [(SBFluidSwitcherItemContainer *)self _resetKillProgressScrollState];
      [(SBFluidSwitcherItemContainer *)self _updateShadowVisibility];
      objc_initWeak(&location, self);
      id v5 = (void *)*MEMORY[0x1E4F43630];
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      double v8 = __42__SBFluidSwitcherItemContainer_setActive___block_invoke;
      double v9 = &unk_1E6AF4B10;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v5, "sb_performBlockAfterCATransactionSynchronizedCommit:", &v6);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    -[SBAppSwitcherPageView setActive:](self->_pageView, "setActive:", v3, v6, v7, v8, v9);
  }
}

- (void)_resetKillProgressScrollState
{
  [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView _stopScrollingAndZoomingAnimations];
  killScrollView = self->_killScrollView;
  [(SBFluidSwitcherItemContainer *)self _contentOffsetAtRest];
  -[SBFluidSwitcherTouchPassThroughScrollView setContentOffset:](killScrollView, "setContentOffset:");
  pageView = self->_pageView;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(SBAppSwitcherPageView *)pageView setTransform:v6];
}

- (CGPoint)_contentOffsetAtRest
{
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1 && self->_killAxis == 1)
  {
    [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView contentSize];
    [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView bounds];
    SBScreenScale();
    BSFloatRoundForScale();
    double v4 = 0.0;
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_updateShadowVisibility
{
  id v3 = [(SBAppSwitcherPageView *)self->_pageView _shadowView];
  [v3 setHidden:self->_dragging];
}

- (void)_updateAccessibilityIdentifier
{
  appLayout = self->_appLayout;
  if (appLayout)
  {
    id v8 = [(SBAppLayout *)appLayout itemForLayoutRole:1];
    double v4 = NSString;
    long long v5 = [v8 bundleIdentifier];
    uint64_t v6 = [v8 uniqueIdentifier];
    uint64_t v7 = [v4 stringWithFormat:@"card:%@:%@", v5, v6];
    [(SBFluidSwitcherItemContainer *)self setAccessibilityIdentifier:v7];
  }
  else
  {
    [(SBFluidSwitcherItemContainer *)self setAccessibilityIdentifier:0];
  }
}

void __42__SBFluidSwitcherItemContainer_setActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[680] = 1;
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SBFluidSwitcherItemContainer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherItemContainer.m" lineNumber:193 description:@"Override initWithFrame:delegate: instead"];

  return -[SBFluidSwitcherItemContainer initWithFrame:appLayout:delegate:active:windowScene:](self, "initWithFrame:appLayout:delegate:active:windowScene:", 0, 0, 0, 0, x, y, width, height);
}

- (SBFluidSwitcherItemContainer)initWithCoder:(id)a3
{
  long long v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherItemContainer.m" lineNumber:199 description:@"Override initWithFrame:delegate: instead"];

  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  return -[SBFluidSwitcherItemContainer initWithFrame:appLayout:delegate:active:windowScene:](self, "initWithFrame:appLayout:delegate:active:windowScene:", 0, 0, 0, 0, v6, v7, v8, v9);
}

- (SBFluidSwitcherItemContainer)initWithFrame:(CGRect)a3 appLayout:(id)a4 delegate:(id)a5 active:(BOOL)a6 windowScene:(id)a7
{
  BOOL v8 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  if (!v18)
  {
    CGRect v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"SBFluidSwitcherItemContainer.m", 205, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v39.receiver = self;
  v39.super_class = (Class)SBFluidSwitcherItemContainer;
  double v20 = -[SBFTouchPassThroughClippingView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  double v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_appLayout, a4);
    uint64_t v22 = +[SBAppSwitcherDomain rootSettings];
    settings = v21->_settings;
    v21->_settings = (SBAppSwitcherSettings *)v22;

    uint64_t v24 = +[SBMedusaDomain rootSettings];
    medusaSettings = v21->_medusaSettings;
    v21->_medusaSettings = (SBMedusaSettings *)v24;

    v21->_contentPageViewScale = 1.0;
    v40.origin.double x = x;
    v40.origin.double y = y;
    v40.size.double width = width;
    v40.size.double height = height;
    v21->_double unobscuredMargin = CGRectGetWidth(v40);
    objc_storeWeak((id *)&v21->_delegate, v18);
    uint64_t v26 = [(SBFluidSwitcherItemContainer *)v21 _createScrollView];
    killScrollView = v21->_killScrollView;
    v21->_killScrollView = (SBFluidSwitcherTouchPassThroughScrollView *)v26;

    [(SBFluidSwitcherTouchPassThroughScrollView *)v21->_killScrollView velocityScaleFactor];
    v21->_killScrollViewInitialVelocityScaleFactor = v28;
    [(SBFTouchPassThroughClippingView *)v21 addSubview:v21->_killScrollView];
    [(SBFluidSwitcherItemContainer *)v21 _addPageView];
    [(SBFluidSwitcherItemContainer *)v21 setActive:v8];
    double v29 = [(SBFluidSwitcherItemContainer *)v21 layer];
    double v30 = [(SBFluidSwitcherItemContainer *)v21 traitCollection];
    [v30 displayScale];
    objc_msgSend(v29, "setRasterizationScale:");

    [(SBFluidSwitcherItemContainer *)v21 _setSafeAreaInsetsFrozen:1];
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v21 action:sel__handleHoverGesture_];
    hoverGestureRecognizer = v21->_hoverGestureRecognizer;
    v21->_hoverGestureRecognizer = (UIHoverGestureRecognizer *)v31;

    [(SBFluidSwitcherItemContainer *)v21 addGestureRecognizer:v21->_hoverGestureRecognizer];
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F42998]) initWithDelegate:v21];
    dragInteraction = v21->_dragInteraction;
    v21->_dragInteraction = (UIDragInteraction *)v33;

    [(SBFluidSwitcherItemContainer *)v21 addInteraction:v21->_dragInteraction];
    [(SBFluidSwitcherItemContainer *)v21 _updateAccessibilityIdentifier];
    -[SBFluidSwitcherItemContainer setPageViewAnchorPoint:](v21, "setPageViewAnchorPoint:", 0.5, 0.5);
    [(SBFluidSwitcherItemContainer *)v21 _updateKillScrollViewEnabled];
    v35 = [[SBAffordancePresenceController alloc] initWithDelegate:v21 windowScene:v19];
    affordancePresenceController = v21->_affordancePresenceController;
    v21->_affordancePresenceController = v35;
  }
  return v21;
}

- (id)_createScrollView
{
  [(SBFluidSwitcherItemContainer *)self _frameForScrollView];
  double v7 = -[SBFluidSwitcherTouchPassThroughScrollView initWithFrame:]([SBFluidSwitcherTouchPassThroughScrollView alloc], "initWithFrame:", v3, v4, v5, v6);
  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 setBounces:1];
  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 setPagingEnabled:1];
  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 setShowsHorizontalScrollIndicator:0];
  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 setShowsVerticalScrollIndicator:0];
  BOOL v8 = [MEMORY[0x1E4F428B8] clearColor];
  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 setBackgroundColor:v8];

  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 setDelegate:self];
  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 setClipsToBounds:0];
  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 _setAutoScrollEnabled:0];
  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 setTracksImmediatelyWhileDecelerating:0];
  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 _setSupportsPointerDragScrolling:1];
  double v9 = [(SBFluidSwitcherTouchPassThroughScrollView *)v7 panGestureRecognizer];
  [v9 setAllowedScrollTypesMask:2];

  [(SBFluidSwitcherTouchPassThroughScrollView *)v7 setAlwaysBounceVertical:1];
  return v7;
}

- (void)_addPageView
{
  id v18 = [(SBFluidSwitcherItemContainer *)self delegate];
  [v18 frameForPageViewOfContainer:self fullyPresented:1];
  SBRectWithSize();
  double v7 = -[SBAppSwitcherPageView initWithFrame:]([SBAppSwitcherPageView alloc], "initWithFrame:", v3, v4, v5, v6);
  pageView = self->_pageView;
  self->_pageView = v7;

  [(SBAppSwitcherPageView *)self->_pageView setSwitcherCardScale:self->_contentPageViewScale];
  [(SBAppSwitcherPageView *)self->_pageView setShouldClipContentView:self->_clipsToUnobscuredMargin];
  -[SBAppSwitcherPageView setCornerRadii:](self->_pageView, "setCornerRadii:", self->_contentCornerRadii.topLeft, self->_contentCornerRadii.bottomLeft, self->_contentCornerRadii.bottomRight, self->_contentCornerRadii.topRight);
  [(SBAppSwitcherPageView *)self->_pageView setShouldScaleOverlayToFillBounds:self->_shouldScaleOverlayToFillBounds];
  [(SBAppSwitcherPageView *)self->_pageView setDelegate:self];
  [(SBAppSwitcherPageView *)self->_pageView setMaskedCorners:self->_maskedCorners];
  [(SBAppSwitcherPageView *)self->_pageView setPointerInteractionHitTestPadding:self->_pointerInteractionHitTestPadding];
  double v9 = [(SBAppSwitcherPageView *)self->_pageView layer];
  objc_msgSend(v9, "setAnchorPoint:", self->_pageViewAnchorPoint.x, self->_pageViewAnchorPoint.y);

  [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView addSubview:self->_pageView];
  id v10 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__handleSelectionHighlightGesture_];
  selectionHighlightGestureRecognizer = self->_selectionHighlightGestureRecognizer;
  self->_selectionHighlightGestureRecognizer = v10;

  [(UILongPressGestureRecognizer *)self->_selectionHighlightGestureRecognizer setDelegate:self];
  [(UILongPressGestureRecognizer *)self->_selectionHighlightGestureRecognizer setMinimumPressDuration:0.12];
  [(UILongPressGestureRecognizer *)self->_selectionHighlightGestureRecognizer _setKeepTouchesOnContinuation:1];
  [(SBFluidSwitcherItemContainer *)self addGestureRecognizer:self->_selectionHighlightGestureRecognizer];
  double v12 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__handlePageViewPressDown_];
  pressDownGestureRecognizer = self->_pressDownGestureRecognizer;
  self->_pressDownGestureRecognizer = v12;

  [(UILongPressGestureRecognizer *)self->_pressDownGestureRecognizer setMinimumPressDuration:0.0];
  [(UILongPressGestureRecognizer *)self->_pressDownGestureRecognizer setDelegate:self];
  [(SBFluidSwitcherItemContainer *)self addGestureRecognizer:self->_pressDownGestureRecognizer];
  double v14 = [[SBFailureNotifyingTapGestureRecognizer alloc] initWithTarget:self action:sel__handlePageViewTap_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v14;

  [(SBFailureNotifyingTapGestureRecognizer *)self->_tapGestureRecognizer setAllowableMovement:10.0];
  [(SBFailureNotifyingTapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
  [(SBFailureNotifyingTapGestureRecognizer *)self->_tapGestureRecognizer _setKeepTouchesOnContinuation:1];
  [(SBFluidSwitcherItemContainer *)self addGestureRecognizer:self->_tapGestureRecognizer];
  uint64_t v16 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handlePageViewTap_];
  doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
  self->_doubleTapGestureRecognizer = v16;

  [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setNumberOfTapsRequired:2];
  [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setDelaysTouchesEnded:0];
  [(SBFluidSwitcherItemContainer *)self addGestureRecognizer:self->_doubleTapGestureRecognizer];
  [(SBFluidSwitcherItemContainer *)self setNeedsLayout];
  [(SBFluidSwitcherItemContainer *)self layoutIfNeeded];
}

- (void)prepareForReuse
{
  if (self->_active)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherItemContainer.m" lineNumber:304 description:@"Can't recycle active view"];
  }
  self->_animatingPageViewScale = 0;
  [(SBFluidSwitcherItemContainer *)self setHighlightedFromDirectTouch:0];
  [(SBFluidSwitcherItemContainer *)self setHighlightedFromCursorHover:0];
  [(SBFluidSwitcherItemContainer *)self setLifted:0];
  [(SBFluidSwitcherItemContainer *)self setContentOverlay:0];
  [(SBFluidSwitcherItemContainer *)self setContentViewBlocksTouches:1];
  [(SBFluidSwitcherItemContainer *)self setRubberbandable:0];
  [(SBFluidSwitcherItemContainer *)self setKillable:0];
  [(SBFluidSwitcherItemContainer *)self setFocusable:0];
  [(SBFluidSwitcherItemContainer *)self setDraggable:0];
  [(SBFluidSwitcherItemContainer *)self setSuppressesHighlightEffect:0];
  -[SBFluidSwitcherItemContainer setPageViewAnchorPoint:](self, "setPageViewAnchorPoint:", 0.5, 0.5);
  -[SBFluidSwitcherItemContainer setPageViewOffset:](self, "setPageViewOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(SBFluidSwitcherItemContainer *)self setPreferredPointerLockStatusSuppressed:0];
  [(SBFluidSwitcherItemContainer *)self setAllowedTouchResizeCorners:0];
  [(SBFluidSwitcherItemContainer *)self _updateForPointerHoveringOverEdge:0];
  self->_sentKillRequest = 0;
  [(SBAppSwitcherPageView *)self->_pageView setAlpha:1.0];
  self->_dragging = 0;
  [(SBFluidSwitcherItemContainer *)self _updateShadowVisibility];
  double v3 = [(SBFluidSwitcherItemContainer *)self contentView];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(SBFluidSwitcherItemContainer *)self contentView];
    [v5 prepareForReuse];
  }
  [(SBFluidSwitcherItemContainer *)self setUserInteractionEnabled:1];
  [(UIHoverGestureRecognizer *)self->_hoverGestureRecognizer setEnabled:0];
  [(UIHoverGestureRecognizer *)self->_hoverGestureRecognizer setEnabled:1];
  [(SBFluidSwitcherItemContainer *)self setAppLayout:0];
  self->_hasPageViewBeenCommitted = 0;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherItemContainer;
  double v3 = [(SBFluidSwitcherItemContainer *)&v7 description];
  char v4 = [(SBAppLayout *)self->_appLayout succinctDescription];
  double v5 = [v3 stringByAppendingFormat:@" appLayout: %@", v4];

  return (NSString *)v5;
}

+ (double)preferredRestingVisibleMarginForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  +[SBFluidSwitcherItemContainerHeaderView distanceFromBoundingLeadingEdgeToIconTrailingEdge];
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CGRectGetWidth(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRectGetHeight(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetWidth(v11);
  SBScreenScale();
  BSFloatRoundForScale();
  return result;
}

- (BOOL)contentViewBlocksTouches
{
  return [(SBAppSwitcherPageView *)self->_pageView blocksTouches];
}

- (void)setPreferredPointerLockStatusSuppressed:(BOOL)a3
{
  if (self->_preferredPointerLockStatusSuppressed != a3)
  {
    self->_preferredPointerLockStatusSuppressed = a3;
    [(SBFluidSwitcherItemContainer *)self setContentViewBlocksTouches:[(SBFluidSwitcherItemContainer *)self contentViewBlocksTouches]];
    BOOL selectable = self->_selectable;
    [(SBFluidSwitcherItemContainer *)self setSelectable:selectable];
  }
}

- (void)setContentOverlay:(id)a3
{
}

- (double)blurViewIconScale
{
  [(SBApplicationBlurContentView *)self->_blurView iconViewScale];
  return result;
}

uint64_t __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 640))
  {
    double v3 = [*(id *)(v2 + 488) overlay];
    [v3 setHidden:1];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 632) setAlpha:1.0];
}

uint64_t __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 640))
  {
    double v3 = [*(id *)(v2 + 488) overlay];
    [v3 setHidden:1];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 632) setAlpha:0.0];
}

uint64_t __93__SBFluidSwitcherItemContainer_setBlurred_duration_blurDelay_iconViewScale_began_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 640))
  {
    [*(id *)(v2 + 632) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    char v4 = *(void **)(v3 + 632);
    *(void *)(v3 + 632) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (double)contentAlpha
{
  [(SBAppSwitcherPageView *)self->_pageView contentAlpha];
  return result;
}

- (void)_updatePageViewContentViewClipping
{
  pageView = self->_pageView;
  BOOL v4 = self->_clipsToUnobscuredMargin
    && !self->_highlightedFromDirectTouch
    && !self->_lifted
    && !self->_highlightedFromCursorHover
    && !self->_animatingPageViewScale;
  [(SBAppSwitcherPageView *)pageView setShouldClipContentView:v4];
}

- (double)dimmingAlpha
{
  [(SBAppSwitcherPageView *)self->_pageView dimmingAlpha];
  return result;
}

- (double)wallpaperOverlayAlpha
{
  [(SBAppSwitcherPageView *)self->_pageView wallpaperOverlayAlpha];
  return result;
}

- (double)lighteningAlpha
{
  [(SBAppSwitcherPageView *)self->_pageView lighteningAlpha];
  return result;
}

- (void)_updateKillScrollViewEnabled
{
  killScrollView = self->_killScrollView;
  BOOL v4 = [(SBFluidSwitcherItemContainer *)self isKillable]
    || [(SBFluidSwitcherItemContainer *)self isRubberbandable];
  [(SBFluidSwitcherTouchPassThroughScrollView *)killScrollView setScrollEnabled:v4];
}

- (double)killingProgress
{
  [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView contentOffset];
  -[SBFluidSwitcherItemContainer _killingProgressForContentOffset:](self, "_killingProgressForContentOffset:");
  return result;
}

- (double)effectivePageViewPresentationCornerRadius
{
  uint64_t v2 = [(SBAppSwitcherPageView *)self->_pageView layer];
  uint64_t v3 = [v2 presentationLayer];
  [v3 cornerRadius];
  double v5 = v4;

  return v5;
}

- (CGRect)effectivePageViewPresentationFrame
{
  uint64_t v3 = [(SBAppSwitcherPageView *)self->_pageView layer];
  double v4 = v3;
  if (self->_hasPageViewBeenCommitted)
  {
    id v5 = [v3 presentationLayer];
  }
  else
  {
    id v5 = v3;
  }
  double v6 = v5;
  BOOL hasPageViewBeenCommitted = self->_hasPageViewBeenCommitted;
  BOOL v8 = [(SBFluidSwitcherItemContainer *)self layer];
  CGRect v9 = v8;
  if (hasPageViewBeenCommitted)
  {
    uint64_t v10 = [v8 presentationLayer];

    CGRect v9 = (void *)v10;
  }
  [v6 bounds];
  objc_msgSend(v6, "convertRect:toLayer:", v9);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (double)_killingProgressForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double minimumTranslationForKillingContainer = self->_minimumTranslationForKillingContainer;
  [(SBFluidSwitcherItemContainer *)self contentPageViewScale];
  double v8 = v7;
  -[SBFluidSwitcherItemContainer _CGPointXOrYBasedOnKillAxis:](self, "_CGPointXOrYBasedOnKillAxis:", x, y);
  double v10 = v9;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1 && self->_killAxis == 1)
  {
    [(SBFluidSwitcherItemContainer *)self _contentOffsetAtRest];
    double v10 = v11 - v10;
  }
  [(SBAppSwitcherPageView *)self->_pageView size];
  -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:");
  return v10 / (minimumTranslationForKillingContainer / v8 + v12);
}

- (CGPoint)_contentOffsetForKillingProgress:(double)a3
{
  double minimumTranslationForKillingContainer = self->_minimumTranslationForKillingContainer;
  [(SBFluidSwitcherItemContainer *)self contentPageViewScale];
  double v7 = minimumTranslationForKillingContainer / v6;
  -[SBFluidSwitcherItemContainer _CGSizeWidthOrHeightBasedOnKillAxis:](self, "_CGSizeWidthOrHeightBasedOnKillAxis:", self->_sizeForContainingSpace.width, self->_sizeForContainingSpace.height);
  double v9 = (v7 + v8) * a3;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1 && self->_killAxis == 1)
  {
    [(SBFluidSwitcherItemContainer *)self _contentOffsetAtRest];
    double v9 = v10 - v9;
  }
  [(SBFluidSwitcherItemContainer *)self _CGPointFromScalarBasedOnKillAxis:v9];
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (double)shadowAlpha
{
  [(SBAppSwitcherPageView *)self->_pageView shadowAlpha];
  return result;
}

- (double)shadowOffset
{
  [(SBAppSwitcherPageView *)self->_pageView shadowOffset];
  return result;
}

- (int64_t)shadowStyle
{
  return [(SBAppSwitcherPageView *)self->_pageView shadowStyle];
}

- (void)setContentView:(id)a3
{
}

- (BOOL)contentViewHasSceneOverlay
{
  uint64_t v2 = [(SBFluidSwitcherItemContainer *)self contentView];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 hasSceneOverlayView];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isOccludedInContinuousExposeStage
{
  return [(SBAppSwitcherPageView *)self->_pageView isOccludedInContinuousExposeStage];
}

- (unint64_t)allowedTouchResizeCorners
{
  return [(SBAppSwitcherPageView *)self->_pageView allowedTouchResizeCorners];
}

- (BOOL)shouldUseBackgroundWallpaperTreatment
{
  return [(SBAppSwitcherPageView *)self->_pageView needsBackgroundWallpaperTreatment];
}

- (BOOL)isDeceleratingTowardsKillZone
{
  int v3 = [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView isDecelerating];
  if (v3)
  {
    [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView _pageDecelerationTarget];
    double v5 = v4;
    double v7 = v6;
    [(SBFluidSwitcherItemContainer *)self _contentOffsetAtRest];
    LOBYTE(v3) = v7 != v9 || v5 != v8;
  }
  return v3;
}

- (BOOL)positionAnimationsBeginFromModelState
{
  uint64_t v2 = [(SBFluidSwitcherItemContainer *)self layer];
  char v3 = [v2 positionAnimationsBeginFromModelState];

  return v3;
}

- (BOOL)transformAnimationsAreLegacyCounterRotations
{
  uint64_t v2 = [(SBFluidSwitcherItemContainer *)self layer];
  char v3 = [v2 transformAnimationsAreLegacyCounterRotations];

  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SBFluidSwitcherItemContainer;
  if (-[SBFluidSwitcherItemContainer pointInside:withEvent:](&v26, sel_pointInside_withEvent_, v7, x, y)) {
    goto LABEL_3;
  }
  double v8 = *MEMORY[0x1E4F437F8];
  double v9 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  [(SBFluidSwitcherItemContainer *)self bounds];
  v30.origin.double x = v10 + -5.0;
  v30.origin.double y = v8 + v11;
  v30.size.CGFloat width = v12 + 10.0;
  v30.size.CGFloat height = v13 - (v8 + v9);
  v29.double x = x;
  v29.double y = y;
  if (CGRectContainsPoint(v30, v29))
  {
LABEL_3:
    BOOL v14 = 1;
  }
  else if ([(SBFTouchPassThroughClippingView *)self hitTestsSubviewsOutsideBounds])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v16 = [(SBFluidSwitcherItemContainer *)self subviews];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          -[SBFluidSwitcherItemContainer convertPoint:toView:](self, "convertPoint:toView:", v21, x, y);
          if (objc_msgSend(v21, "pointInside:withEvent:", v7))
          {
            BOOL v14 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_17:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __46__SBFluidSwitcherItemContainer_layoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 464));
  [WeakRetained containerWillBeginAnimatingHighlight:*(void *)(a1 + 32) scale:*(unsigned __int8 *)(*(void *)(a1 + 32) + 697) isTracking:1.0];
  char v3 = *(void **)(*(void *)(a1 + 32) + 488);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v22[0] = *MEMORY[0x1E4F1DAB8];
  v22[1] = v4;
  v22[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v22];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 472), "setContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_CGSizeWidthOrHeightBasedOnKillAxis:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v6 = v5;
  id v7 = *(id **)(a1 + 32);
  [v7[59] bounds];
  objc_msgSend(v7, "_CGSizeWidthOrHeightBasedOnKillAxis:", v8, v9);
  double v11 = *(void **)(a1 + 32);
  double v12 = (void *)v11[59];
  objc_msgSend(v11, "_CGSizeFromLengthBasedOnKillAxis:", fmax(-(v10 - v6 * 0.5), 0.0));
  objc_msgSend(v12, "_setInterpageSpacing:");
  int v13 = [*(id *)(*(void *)(a1 + 32) + 472) isDecelerating];
  uint64_t v14 = *(void *)(a1 + 32);
  if (v13)
  {
    [(id)v14 _contentOffsetForKillingProgress:*(double *)(v14 + 648)];
    double v16 = v15;
    double v18 = v17;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 472), "_setPageDecelerationTarget:");
    objc_msgSend(*(id *)(a1 + 32), "_killingProgressForContentOffset:", v16, v18);
    *(void *)(*(void *)(a1 + 32) + 648) = v19;
  }
  else if (([*(id *)(v14 + 472) isDragging] & 1) == 0 {
         && ([*(id *)(*(void *)(a1 + 32) + 472) isTracking] & 1) == 0)
  }
  {
    double v20 = *(void **)(a1 + 32);
    double v21 = (void *)v20[59];
    [v20 _contentOffsetAtRest];
    objc_msgSend(v21, "setContentOffset:");
  }
  [WeakRetained containerDidEndAnimatingHighlight:*(void *)(a1 + 32) scale:1.0];
}

- (CGRect)_frameForScrollView
{
  char v3 = [(SBFluidSwitcherItemContainer *)self delegate];
  [v3 frameForPageViewOfContainer:self fullyPresented:1];
  -[SBFluidSwitcherItemContainer _frameForScrollViewWithFullPresentedSize:](self, "_frameForScrollViewWithFullPresentedSize:", v4, v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)_frameForPageView
{
  char v3 = [(SBFluidSwitcherItemContainer *)self delegate];
  [v3 frameForPageViewOfContainer:self fullyPresented:1];
  -[SBFluidSwitcherItemContainer _frameForPageViewWithFullPresentedSize:](self, "_frameForPageViewWithFullPresentedSize:", v4, v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)affordancePresenceController:(id)a3 didChangeToPresence:(int64_t)a4
{
  [(SBAppSwitcherPageView *)self->_pageView setResizeGrabbersVisible:a4 == 0];
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_draggable
    && ([(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView isDecelerating] & 1) == 0)
  {
    double v9 = [(SBFluidSwitcherItemContainer *)self appLayout];
    double v10 = [v9 itemForLayoutRole:1];
    double v11 = [v10 bundleIdentifier];
    id v12 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    [v12 registerDataRepresentationForTypeIdentifier:*MEMORY[0x1E4FA6E60] visibility:3 loadHandler:&__block_literal_global_145];
    if (self->_supportsSwitcherDragAndDrop) {
      uint64_t v13 = 11;
    }
    else {
      uint64_t v13 = 12;
    }
    double v14 = (void *)[objc_alloc(MEMORY[0x1E4FA6998]) initWithUniqueIdentifier:v11 withLaunchActions:0 startLocation:v13];
    double v15 = [v10 uniqueIdentifier];
    [v14 setDraggedSceneIdentifier:v15];

    [v14 setSourceLocal:1];
    [v14 setLaunchURL:0];
    [v14 setUserActivity:0];
    double v16 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v12];
    objc_msgSend(v16, "sbh_setAppDragLocalContext:", v14);
    v18[0] = v16;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    double v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

uint64_t __73__SBFluidSwitcherItemContainer_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void (**a2)(void, void, void))
{
  char v3 = (void *)MEMORY[0x1E4F1C9B8];
  double v4 = a2;
  double v5 = [v3 data];
  ((void (**)(void, void *, void))a2)[2](v4, v5, 0);

  return 0;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v34 = a4;
  id v6 = [(UIView *)self _sbWindowScene];
  id v7 = [v6 homeScreenController];
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 iconManager];
  }
  else
  {
    double v10 = +[SBIconController sharedInstance];
    double v9 = [v10 iconManager];
  }
  double v11 = [v9 iconModel];
  v32 = [(SBFluidSwitcherItemContainer *)self appLayout];
  uint64_t v31 = [v32 itemForLayoutRole:1];
  id v12 = [v31 bundleIdentifier];
  uint64_t v33 = v11;
  uint64_t v13 = [v11 leafIconForIdentifier:v12];
  double v14 = (void *)[objc_alloc(MEMORY[0x1E4FA6430]) initWithConfigurationOptions:6];
  [v14 setLocation:*MEMORY[0x1E4FA66D0]];
  double v15 = [v9 listLayoutProvider];
  [v14 setListLayoutProvider:v15];

  [v14 setDelegate:v9];
  [v14 setIcon:v13];
  [v14 setEnabled:0];
  pageView = self->_pageView;
  if (pageView)
  {
    [(SBAppSwitcherPageView *)pageView transform];
    double v17 = *(double *)&v37;
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    double v17 = 0.0;
  }
  double v18 = [[SBAppPlatterDragPreview alloc] initWithReferenceIconView:v14 sourceView:self->_pageView sourceViewScale:v17 * self->_contentPageViewScale];
  [(SBAppPlatterDragPreview *)v18 setMode:2];
  [(SBFluidSwitcherItemContainer *)self bounds];
  -[SBAppPlatterDragPreview setAnchorPoint:](v18, "setAnchorPoint:", self->_highlightTapDownLocation.x / v19 + 0.0, self->_highlightTapDownLocation.y / v20 + 0.0);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __78__SBFluidSwitcherItemContainer_dragInteraction_previewForLiftingItem_session___block_invoke;
  v35[3] = &unk_1E6B00CD8;
  id v36 = v9;
  id v21 = v9;
  [(SBAppPlatterDragPreview *)v18 setCleanUpHandler:v35];
  long long v22 = [v21 iconDragManager];
  [v22 addPlatterViewToMedusaDragOffscreenWindow:v18 forWindowScene:v6];

  [(SBFluidSwitcherItemContainer *)self bounds];
  UIRectGetCenter();
  double v24 = v23;
  double v26 = v25;
  double v27 = [(SBAppPlatterDragPreview *)v18 window];
  -[SBFluidSwitcherItemContainer convertPoint:toView:](self, "convertPoint:toView:", v27, v24, v26);
  -[SBAppPlatterDragPreview setCenter:](v18, "setCenter:");

  [(SBAppPlatterDragPreview *)v18 setDragState:1];
  [(SBAppPlatterDragPreview *)v18 setAlpha:0.0];
  [(SBAppPlatterDragPreview *)v18 layoutIfNeeded];
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F42ED0]) initWithView:v18];
  objc_msgSend(v28, "set_springboardPlatterStyle:", 1);
  CGPoint v29 = objc_msgSend(v34, "sbh_appDragLocalContext");

  [v29 setPortaledPreview:v18];
  return v28;
}

void __78__SBFluidSwitcherItemContainer_dragInteraction_previewForLiftingItem_session___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 iconDragManager];
  [v4 removePlatterViewFromMedusaDragOffscreenWindow:v3];
}

- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  UITapGestureRecognizer *returnKeyGestureRecognizer;
  id v11;
  uint64_t vars8;

  double v11 = a3;
  double v5 = [(SBFluidSwitcherItemContainer *)self delegate];
  id v6 = [v11 nextFocusedItem];

  if (v6 == self)
  {
    [v5 container:self didBecomeFocused:1];
    double v9 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__returnKeyPressed_];
    returnKeyGestureRecognizer = self->_returnKeyGestureRecognizer;
    self->_returnKeyGestureRecognizer = v9;

    [(UITapGestureRecognizer *)self->_returnKeyGestureRecognizer setAllowedPressTypes:&unk_1F3347D60];
    [(SBFluidSwitcherItemContainer *)self addGestureRecognizer:self->_returnKeyGestureRecognizer];
  }
  else
  {
    id v7 = [v11 previouslyFocusedItem];

    if (v7 == self)
    {
      [v5 container:self didBecomeFocused:0];
      [(SBFluidSwitcherItemContainer *)self removeGestureRecognizer:self->_returnKeyGestureRecognizer];
      double v8 = self->_returnKeyGestureRecognizer;
      self->_returnKeyGestureRecognizer = 0;
    }
  }
}

- (id)focusEffect
{
  return 0;
}

- (void)_returnKeyPressed:(id)a3
{
  id v5 = a3;
  if ([(SBFluidSwitcherItemContainer *)self isFocusable]
    && [(SBFluidSwitcherItemContainer *)self isSelectable])
  {
    id v4 = [(SBFluidSwitcherItemContainer *)self delegate];
    objc_msgSend(v4, "didSelectContainer:modifierFlags:", self, objc_msgSend(v5, "modifierFlags"));
  }
}

- (double)_CGPointXOrYBasedOnKillAxis:(CGPoint)a3
{
  if (!self->_killAxis) {
    a3.double x = a3.y;
  }
  return a3.x;
}

- (double)_inverseScaleTransformFactor
{
  [(SBFluidSwitcherItemContainer *)self contentPageViewScale];
  char IsZero = BSFloatIsZero();
  double result = 1.0;
  if ((IsZero & 1) == 0)
  {
    [(SBFluidSwitcherItemContainer *)self contentPageViewScale];
    return 1.0 / v5;
  }
  return result;
}

- (id)_springLoadingEffectTargetView
{
  id v3 = [(SBAppSwitcherPageView *)self->_pageView overlay];
  if (v3) {
    [(SBAppSwitcherPageView *)self->_pageView overlay];
  }
  else {
  id v4 = [(SBFluidSwitcherItemContainer *)self contentView];
  }

  return v4;
}

- (void)_handlePageViewTap:(id)a3
{
  id v5 = a3;
  if ([(SBFluidSwitcherItemContainer *)self isSelectable])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didSelectContainer:modifierFlags:", self, objc_msgSend(v5, "modifierFlags"));
  }
}

- (void)_handleSelectionHighlightGesture:(id)a3
{
  id v9 = a3;
  if ([v9 state] == 1)
  {
    id v4 = [(SBFluidSwitcherItemContainer *)self delegate];
    uint64_t v5 = [v4 canSelectContainer:self numberOfTaps:1];

    [v9 locationInView:self];
    self->_highlightTapDownLocation.double x = v6;
    self->_highlightTapDownLocation.double y = v7;
    goto LABEL_9;
  }
  if ([v9 state] != 3 && objc_msgSend(v9, "state") != 4)
  {
    if ([v9 state] == 2)
    {
      uint64_t v5 = [(SBFluidSwitcherItemContainer *)self isHighlightedFromDirectTouch];
      goto LABEL_9;
    }
    [v9 state];
  }
  uint64_t v5 = 0;
LABEL_9:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "containerSelectionStateChanged:toState:hover:pencilHover:", self, objc_msgSend(v9, "state"), 0, 0);

  [(SBFluidSwitcherItemContainer *)self setHighlightedFromDirectTouch:v5];
}

- (void)setHighlightedFromDirectTouch:(BOOL)a3
{
  if (self->_highlightedFromDirectTouch != a3)
  {
    self->_highlightedFromDirectTouch = a3;
    [(SBFluidSwitcherItemContainer *)self _updateTransformForCurrentHighlight];
  }
}

- (void)setHighlightedFromCursorHover:(BOOL)a3
{
  if (self->_highlightedFromCursorHover != a3)
  {
    self->_highlightedFromCursorHover = a3;
    [(SBFluidSwitcherItemContainer *)self _updateTransformForCurrentHighlight];
  }
}

- (void)setLifted:(BOOL)a3
{
  if (self->_lifted != a3)
  {
    self->_lifted = a3;
    [(SBFluidSwitcherItemContainer *)self _updateTransformForCurrentHighlight];
  }
}

- (void)_updateTransformForCurrentHighlight
{
  CGFloat v3 = 1.0;
  if (self->_suppressesHighlightEffect) {
    goto LABEL_2;
  }
  if (self->_highlightedFromCursorHover
    && self->_pointerInteractionEnabled
    && ([(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView isDragging] & 1) == 0)
  {
    [(SBFluidSwitcherItemContainer *)self _scaleForHighlightFromCursorHover];
    CGFloat v3 = v6;
    uint64_t v4 = 1;
  }
  else
  {
    if (!self->_highlightedFromDirectTouch && !self->_lifted)
    {
LABEL_2:
      uint64_t v4 = 0;
      goto LABEL_10;
    }
    [(SBFluidSwitcherItemContainer *)self _scaleForHighlightFromDirectTouch];
    CGFloat v3 = v5;
    uint64_t v4 = 2;
  }
LABEL_10:
  if (v4 != [(SBAppSwitcherPageView *)self->_pageView highlightType])
  {
    memset(&v13, 0, sizeof(v13));
    CGAffineTransformMakeScale(&v13, v3, v3);
    self->_animatingPageViewScale = 1;
    [(SBFluidSwitcherItemContainer *)self _updatePageViewContentViewClipping];
    CGFloat v7 = [(SBAppSwitcherSettings *)self->_settings animationSettings];
    double v8 = [v7 appSelectionSquishSettings];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__SBFluidSwitcherItemContainer__updateTransformForCurrentHighlight__block_invoke;
    v10[3] = &unk_1E6AFA478;
    v10[4] = self;
    *(CGFloat *)&v10[5] = v3;
    CGAffineTransform v11 = v13;
    uint64_t v12 = v4;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__SBFluidSwitcherItemContainer__updateTransformForCurrentHighlight__block_invoke_2;
    v9[3] = &unk_1E6AF50E8;
    v9[4] = self;
    *(CGFloat *)&v9[5] = v3;
    objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v8, 3, v10, v9);
  }
}

uint64_t __67__SBFluidSwitcherItemContainer__updateTransformForCurrentHighlight__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 464));
  [WeakRetained containerWillBeginAnimatingHighlight:*(void *)(a1 + 32) scale:*(unsigned __int8 *)(*(void *)(a1 + 32) + 697) isTracking:*(double *)(a1 + 40)];

  CGFloat v3 = *(void **)(*(void *)(a1 + 32) + 488);
  long long v4 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 80);
  [v3 setTransform:v6];
  return [*(id *)(*(void *)(a1 + 32) + 488) setHighlightType:*(void *)(a1 + 96)];
}

void __67__SBFluidSwitcherItemContainer__updateTransformForCurrentHighlight__block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 464));
  [WeakRetained containerDidEndAnimatingHighlight:*(void *)(a1 + 32) scale:*(double *)(a1 + 40)];

  if ((a3 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 624) = 0;
    double v6 = *(void **)(a1 + 32);
    [v6 _updatePageViewContentViewClipping];
  }
}

- (double)_scaleForHighlightFromDirectTouch
{
  if (SBReduceMotion()) {
    return 1.0;
  }
  if ([(SBFluidSwitcherItemContainer *)self shadowStyle] == 2)
  {
    medusaSettings = self->_medusaSettings;
    [(SBMedusaSettings *)medusaSettings floatingAppCardScaleWhileTouched];
  }
  else
  {
    settings = self->_settings;
    [(SBAppSwitcherSettings *)settings switcherCardScaleWhileTouched];
  }
  return result;
}

- (double)_scaleForHighlightFromCursorHover
{
  if (SBReduceMotion()) {
    return 1.0;
  }
  if ([(SBFluidSwitcherItemContainer *)self shadowStyle] == 2)
  {
    medusaSettings = self->_medusaSettings;
    [(SBMedusaSettings *)medusaSettings floatingAppCardScaleWhileCursorHovered];
  }
  else
  {
    settings = self->_settings;
    [(SBAppSwitcherSettings *)settings switcherCardScaleWhileCursorHovered];
  }
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  long long v4 = (UITapGestureRecognizer *)a3;
  if ([(SBAppSwitcherPageView *)self->_pageView blocksTouches])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ([(UILongPressGestureRecognizer *)self->_pressDownGestureRecognizer state]) {
      BOOL v6 = [(UILongPressGestureRecognizer *)self->_pressDownGestureRecognizer state] != 5;
    }
    else {
      BOOL v6 = 0;
    }
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (tapGestureRecognizer == (SBFailureNotifyingTapGestureRecognizer *)v4 && !v6)
    {
      char v7 = 0;
      goto LABEL_21;
    }
    if (tapGestureRecognizer != (SBFailureNotifyingTapGestureRecognizer *)v4)
    {
      doubleTapGestureRecognizer = v4;
      if (self->_doubleTapGestureRecognizer == v4) {
        goto LABEL_17;
      }
      if ((UITapGestureRecognizer *)self->_pressDownGestureRecognizer != v4)
      {
        doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
        if ((UITapGestureRecognizer *)self->_selectionHighlightGestureRecognizer != v4)
        {
          char v7 = 1;
LABEL_21:

          goto LABEL_22;
        }
LABEL_17:
        if (doubleTapGestureRecognizer == v4) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = 1;
        }
        char v7 = [WeakRetained canSelectContainer:self numberOfTaps:v11];
        goto LABEL_21;
      }
    }
    doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
    goto LABEL_17;
  }
  char v7 = 0;
LABEL_22:

  return v7;
}

- (void)gestureRecognizerTransitionedToFailed:(id)a3
{
  if (self->_tapGestureRecognizer == a3)
  {
    [(UILongPressGestureRecognizer *)self->_selectionHighlightGestureRecognizer setEnabled:0];
    selectionHighlightGestureRecognizer = self->_selectionHighlightGestureRecognizer;
    [(UILongPressGestureRecognizer *)selectionHighlightGestureRecognizer setEnabled:1];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  long long v4 = (SBFluidSwitcherTouchPassThroughScrollView *)a3;
  if (self->_killScrollView == v4)
  {
    char v7 = v4;
    double v5 = [(SBFluidSwitcherTouchPassThroughScrollView *)v4 window];

    long long v4 = v7;
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [(SBFluidSwitcherItemContainer *)self killingProgress];
      if (BSFloatGreaterThanOrEqualToFloat() && self->_killable && !self->_sentKillRequest)
      {
        self->_sentKillRequest = 1;
        [(SBFluidSwitcherItemContainer *)self _notifyDelegateScrollViewDidChange];
        [WeakRetained killContainer:self forReason:1];
      }
      else
      {
        [(SBFluidSwitcherItemContainer *)self _notifyDelegateScrollViewDidChange];
      }
      [MEMORY[0x1E4F39CF8] setLowLatency:0];
      [(SBFluidSwitcherItemContainer *)self setHighlightedFromDirectTouch:[(SBFluidSwitcherTouchPassThroughScrollView *)v7 isTracking]];

      long long v4 = v7;
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (self->_killScrollView == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained containerWillBeginSwipingToKill:self];

    [(SBFluidSwitcherItemContainer *)self setNeedsLayout];
    [(SBFluidSwitcherItemContainer *)self layoutIfNeeded];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (self->_killScrollView == a3)
  {
    objc_msgSend(a3, "contentOffset", a4.x, a4.y);
    if (!self->_killAxis) {
      double v7 = v8;
    }
    if (v7 >= 62.0)
    {
      double x = a5->x;
      double y = a5->y;
    }
    else
    {
      [(SBFluidSwitcherItemContainer *)self _contentOffsetAtRest];
      a5->double x = x;
      a5->double y = y;
    }
    -[SBFluidSwitcherItemContainer _killingProgressForContentOffset:](self, "_killingProgressForContentOffset:", x, y);
    if (v11 >= 1.0)
    {
      double v12 = a5->x;
      double v13 = a5->y;
    }
    else
    {
      [(SBFluidSwitcherItemContainer *)self _contentOffsetAtRest];
      a5->double x = v12;
      a5->double y = v13;
    }
    -[SBFluidSwitcherItemContainer _killingProgressForContentOffset:](self, "_killingProgressForContentOffset:", v12, v13);
    self->_killProgressForCurrentDecelerationTarget = v14;
    [(SBFluidSwitcherItemContainer *)self _notifyDelegateScrollViewDidChange];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (self->_killScrollView == a3) {
    [(SBFluidSwitcherItemContainer *)self _notifyDelegateScrollViewDidChange];
  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  if (self->_killScrollView == a3) {
    [(SBFluidSwitcherItemContainer *)self _notifyDelegateScrollViewDidChange];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_killScrollView == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained containerDidEndSwipingToKill:self];

    [(SBFluidSwitcherItemContainer *)self _notifyDelegateScrollViewDidChange];
  }
}

- (void)_notifyDelegateScrollViewDidChange
{
  if (self->_sentKillRequest
    || ![(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView isDragging])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(SBFluidSwitcherTouchPassThroughScrollView *)self->_killScrollView isDecelerating] ^ 1;
  }
  [(SBFluidSwitcherItemContainer *)self killingProgress];
  -[SBFluidSwitcherItemContainer _contentOffsetForKillingProgress:](self, "_contentOffsetForKillingProgress:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(SBFluidSwitcherItemContainer *)self killingProgress];
  objc_msgSend(WeakRetained, "scrollViewKillingProgressUpdated:translation:isDragging:decelerationTargetProgress:forContainer:", v3, self);
}

- (BOOL)_scrollViewShouldPanGestureTryToBegin:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 panGestureRecognizer];
  [v5 translationInView:v4];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  unint64_t killAxis = self->_killAxis;
  if (killAxis) {
    double v11 = v7;
  }
  else {
    double v11 = v9;
  }
  BOOL v13 = 0;
  if ((BSFloatIsZero() & 1) == 0)
  {
    double v12 = killAxis ? v9 : v7;
    if (fabs(v12 / v11) <= 0.5) {
      BOOL v13 = 1;
    }
  }
  double v14 = SBLogAppSwitcher();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      double v15 = @"Allow";
    }
    else {
      double v15 = @"Don't allow";
    }
    v23.double x = v7;
    v23.double y = v9;
    double v16 = NSStringFromPoint(v23);
    int v18 = 138543618;
    double v19 = v15;
    __int16 v20 = 2114;
    id v21 = v16;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ panning in scroll view [translation: %{public}@", (uint8_t *)&v18, 0x16u);
  }
  return v13;
}

- (void)_handleHoverGesture:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 _activeEventOfType:11];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v6 = objc_msgSend(v5, "allTouches", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) type] == 2)
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v10 = [v4 state];
  if ((unint64_t)(v10 - 3) < 2)
  {
    uint64_t v11 = 0;
LABEL_15:
    [(SBFluidSwitcherItemContainer *)self setHighlightedFromCursorHover:v11];
    goto LABEL_16;
  }
  if (v10 == 1)
  {
    uint64_t v11 = 1;
    goto LABEL_15;
  }
LABEL_16:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "containerSelectionStateChanged:toState:hover:pencilHover:", self, objc_msgSend(v4, "state"), 1, v7);
}

- (id)initialCornerRadiusConfiguration
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F4F700]) initWithTopLeft:self->_contentCornerRadii.topLeft bottomLeft:self->_contentCornerRadii.bottomLeft bottomRight:self->_contentCornerRadii.bottomRight topRight:self->_contentCornerRadii.topRight];
  return v2;
}

- (SBDragPreviewShadowParameters)initialDiffuseShadowParameters
{
  uint64_t v3 = [(SBAppSwitcherPageView *)self->_pageView _shadowView];
  id v4 = [v3 _diffuseShadowView];
  double v5 = [v4 layer];

  if (v5)
  {
    [v5 shadowOpacity];
    [v5 shadowRadius];
    [v5 shadowOffset];
  }

  return result;
}

- (SBDragPreviewShadowParameters)initialRimShadowParameters
{
  uint64_t v3 = [(SBAppSwitcherPageView *)self->_pageView _shadowView];
  id v4 = [v3 _rimShadowView];
  double v5 = [v4 layer];

  if (v5)
  {
    [v5 shadowOpacity];
    [v5 shadowRadius];
    [v5 shadowOffset];
  }

  return result;
}

- (id)initialDiffuseShadowFilters
{
  uint64_t v2 = [(SBAppSwitcherPageView *)self->_pageView _shadowView];
  uint64_t v3 = [v2 _diffuseShadowView];
  id v4 = [v3 layer];
  double v5 = [v4 filters];

  return v5;
}

- (id)initialRimShadowFilters
{
  uint64_t v2 = [(SBAppSwitcherPageView *)self->_pageView _shadowView];
  uint64_t v3 = [v2 _rimShadowView];
  id v4 = [v3 layer];
  double v5 = [v4 filters];

  return v5;
}

- (id)containerViewForBlurContentView
{
  return [(SBAppSwitcherPageView *)self->_pageView _overlayClippingView];
}

- (void)setDragging:(BOOL)a3
{
  if (self->_dragging != a3)
  {
    self->_dragging = a3;
    [(SBFluidSwitcherItemContainer *)self _updateShadowVisibility];
  }
}

- (void)_updateForPointerHoveringOverEdge:(unint64_t)a3
{
  if (self->_hoveringOverEdge != a3)
  {
    self->_hoveringOverEdge = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = WeakRetained;
    if (self->_hoveringOverEdge) {
      [WeakRetained pointerBeganResizingItemContainer:self];
    }
    else {
      [WeakRetained pointerEndedResizingItemContainer:self];
    }
  }
}

- (void)appSwitcherPageView:(id)a3 pointerIsHoveringOverEdge:(unint64_t)a4
{
}

- (BOOL)appSwitcherPageView:(id)a3 shouldBeginPointerInteractionAtLocation:(CGPoint)a4 window:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "hitTestedToTopAffordance:window:ofItemContainer:", v8, self, x, y)) {
    LOBYTE(v10) = 0;
  }
  else {
    int v10 = objc_msgSend(WeakRetained, "hitTestedToFloatingElement:window:ofItemContainer:", v8, self, x, y) ^ 1;
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
}

- (UIRectCornerRadii)contentCornerRadii
{
  double topLeft = self->_contentCornerRadii.topLeft;
  double bottomLeft = self->_contentCornerRadii.bottomLeft;
  double bottomRight = self->_contentCornerRadii.bottomRight;
  double topRight = self->_contentCornerRadii.topRight;
  result.double topRight = topRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topLeft = topLeft;
  return result;
}

- (double)unobscuredMargin
{
  return self->_unobscuredMargin;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (CAMeshTransform)meshTransform
{
  return self->_meshTransform;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (CGSize)sizeForContainingSpace
{
  double width = self->_sizeForContainingSpace.width;
  double height = self->_sizeForContainingSpace.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)clipsToUnobscuredMargin
{
  return self->_clipsToUnobscuredMargin;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (unint64_t)killAxis
{
  return self->_killAxis;
}

- (BOOL)isKillable
{
  return self->_killable;
}

- (BOOL)isRubberbandable
{
  return self->_rubberbandable;
}

- (BOOL)isFocusable
{
  return self->_focusable;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (BOOL)isEligibleForContentDragSpringLoading
{
  return self->_eligibleForContentDragSpringLoading;
}

- (BOOL)isLifted
{
  return self->_lifted;
}

- (BOOL)suppressesHighlightEffect
{
  return self->_suppressesHighlightEffect;
}

- (BOOL)supportsSwitcherDragAndDrop
{
  return self->_supportsSwitcherDragAndDrop;
}

- (double)minimumTranslationForKillingContainer
{
  return self->_minimumTranslationForKillingContainer;
}

- (BOOL)shouldScaleOverlayToFillBounds
{
  return self->_shouldScaleOverlayToFillBounds;
}

- (BOOL)shouldUseWallpaperGradientTreatment
{
  return self->_shouldUseWallpaperGradientTreatment;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributes
{
  double leadingAlpha = self->_wallpaperGradientAttributes.leadingAlpha;
  double trailingAlpha = self->_wallpaperGradientAttributes.trailingAlpha;
  result.double trailingAlpha = trailingAlpha;
  result.double leadingAlpha = leadingAlpha;
  return result;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (CGPoint)pageViewAnchorPoint
{
  double x = self->_pageViewAnchorPoint.x;
  double y = self->_pageViewAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)pageViewOffset
{
  double x = self->_pageViewOffset.x;
  double y = self->_pageViewOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)isResizingAllowed
{
  return self->_resizingAllowed;
}

- (BOOL)isHighlightedFromDirectTouch
{
  return self->_highlightedFromDirectTouch;
}

- (BOOL)isHighlightedFromCursorHover
{
  return self->_highlightedFromCursorHover;
}

- (BOOL)isPointerInteractionEnabled
{
  return self->_pointerInteractionEnabled;
}

- (double)pointerInteractionHitTestPadding
{
  return self->_pointerInteractionHitTestPadding;
}

- (unint64_t)pointerIsHoveringOverEdge
{
  return self->_hoveringOverEdge;
}

- (void)setHoveringOverEdge:(unint64_t)a3
{
  self->_hoveringOverEdge = a3;
}

- (CGPoint)meshWarpCollapsedTargetPosition
{
  double x = self->_meshWarpCollapsedTargetPosition.x;
  double y = self->_meshWarpCollapsedTargetPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMeshWarpCollapsedTargetPosition:(CGPoint)a3
{
  self->_meshWarpCollapsedTargetPosition = a3;
}

- (CGPoint)meshWarpExpandedSourcePosition
{
  double x = self->_meshWarpExpandedSourcePosition.x;
  double y = self->_meshWarpExpandedSourcePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMeshWarpExpandedSourcePosition:(CGPoint)a3
{
  self->_meshWarpExpandedSourcePosition = a3;
}

- (BOOL)shouldApplyMeshWarp
{
  return self->_shouldApplyMeshWarp;
}

- (void)setShouldApplyMeshWarp:(BOOL)a3
{
  self->_shouldApplyMeshWarp = a3;
}

- (BOOL)isPreferredPointerLockStatusSuppressed
{
  return self->_preferredPointerLockStatusSuppressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affordancePresenceController, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_returnKeyGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_squishSettings, 0);
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionHighlightGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pressDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_iconOverlayView, 0);
  objc_storeStrong((id *)&self->_pageView, 0);
  objc_storeStrong((id *)&self->_killScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end