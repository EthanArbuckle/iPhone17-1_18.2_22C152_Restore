@interface SBAppSwitcherPageView
- (BOOL)_supportsAsymmetricalCornerRadii;
- (BOOL)areResizeGrabbersVisible;
- (BOOL)blocksTouches;
- (BOOL)isActive;
- (BOOL)isOccludedInContinuousExposeStage;
- (BOOL)isResizingAllowed;
- (BOOL)isVisible;
- (BOOL)needsBackgroundWallpaperTreatment;
- (BOOL)needsWallpaperGradientTreatment;
- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5;
- (BOOL)shouldClipContentView;
- (BOOL)shouldScaleOverlayToFillBounds;
- (CGRect)_contentViewFrame;
- (CGRect)contentClippingFrame;
- (CGSize)fullyPresentedSize;
- (CGSize)overlayViewSize;
- (SBAppSwitcherPageContentView)view;
- (SBAppSwitcherPageShadowView)_shadowView;
- (SBAppSwitcherPageView)initWithFrame:(CGRect)a3;
- (SBAppSwitcherPageViewDelegate)delegate;
- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributes;
- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3;
- (UIRectCornerRadii)cornerRadii;
- (UIView)_overlayClippingView;
- (UIView)overlay;
- (double)contentAlpha;
- (double)dimmingAlpha;
- (double)lighteningAlpha;
- (double)overlayAlpha;
- (double)pointerInteractionHitTestPadding;
- (double)shadowAlpha;
- (double)shadowOffset;
- (double)switcherCardScale;
- (double)wallpaperOverlayAlpha;
- (id)regionAtLocation:(CGPoint)a3 forView:(id)a4;
- (id)styleForRegion:(id)a3 forView:(id)a4;
- (int64_t)orientation;
- (int64_t)shadowStyle;
- (int64_t)tintStyle;
- (unint64_t)allowedTouchResizeCorners;
- (unint64_t)highlightType;
- (unint64_t)maskedCorners;
- (void)_addContentView:(id)a3;
- (void)_createOrDestroyWallpaperGradientView;
- (void)_createOrDestroyWallpaperOverlayView;
- (void)_layoutOverlayView;
- (void)_orderSubviews;
- (void)_updateCornerRadius;
- (void)_updateDimmingViewAlpha;
- (void)_updateEffectOverlayViews;
- (void)_updateGrabberVisibilities;
- (void)_updateShadowPresence;
- (void)_updateTintStyle;
- (void)_updateTintViewAlpha;
- (void)_updateWallpaperGradientAttributes;
- (void)_updateWallpaperOverlayAlpha;
- (void)invalidate;
- (void)layoutSubviews;
- (void)pointerWillExitRegion;
- (void)setActive:(BOOL)a3;
- (void)setAllowedTouchResizeCorners:(unint64_t)a3;
- (void)setBlocksTouches:(BOOL)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentClippingFrame:(CGRect)a3;
- (void)setCornerRadii:(UIRectCornerRadii)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingAlpha:(double)a3;
- (void)setFullyPresentedSize:(CGSize)a3;
- (void)setHighlightType:(unint64_t)a3;
- (void)setLighteningAlpha:(double)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setNeedsBackgroundWallpaperTreatment:(BOOL)a3;
- (void)setNeedsWallpaperGradientTreatment:(BOOL)a3;
- (void)setOccludedInContinuousExposeStage:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOverlay:(id)a3;
- (void)setOverlay:(id)a3 animated:(BOOL)a4;
- (void)setOverlayAlpha:(double)a3;
- (void)setOverlayViewSize:(CGSize)a3;
- (void)setPointerInteractionHitTestPadding:(double)a3;
- (void)setResizeGrabbersVisible:(BOOL)a3;
- (void)setResizingAllowed:(BOOL)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setShadowOffset:(double)a3;
- (void)setShadowStyle:(int64_t)a3;
- (void)setShouldClipContentView:(BOOL)a3;
- (void)setShouldScaleOverlayToFillBounds:(BOOL)a3;
- (void)setSwitcherCardScale:(double)a3;
- (void)setTintStyle:(int64_t)a3;
- (void)setView:(id)a3;
- (void)setView:(id)a3 animated:(BOOL)a4;
- (void)setVisible:(BOOL)a3;
- (void)setWallpaperGradientAttributes:(SBSwitcherWallpaperGradientAttributes)a3;
- (void)setWallpaperOverlayAlpha:(double)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SBAppSwitcherPageView

- (void)setNeedsWallpaperGradientTreatment:(BOOL)a3
{
  if (self->_needsWallpaperGradientTreatment != a3)
  {
    self->_needsWallpaperGradientTreatment = a3;
    [(SBAppSwitcherPageView *)self _createOrDestroyWallpaperGradientView];
  }
}

- (void)setWallpaperOverlayAlpha:(double)a3
{
  if (self->_wallpaperOverlayAlpha != a3)
  {
    self->_wallpaperOverlayAlpha = a3;
    [(SBAppSwitcherPageView *)self _updateWallpaperOverlayAlpha];
  }
}

- (void)setTintStyle:(int64_t)a3
{
  if (self->_tintStyle != a3)
  {
    self->_tintStyle = a3;
    [(SBAppSwitcherPageView *)self _updateTintStyle];
  }
}

- (void)setShadowStyle:(int64_t)a3
{
  if (self->_shadowStyle != a3)
  {
    self->_shadowStyle = a3;
    -[SBAppSwitcherPageShadowView setStyle:](self->_shadowView, "setStyle:");
  }
}

- (void)setShadowOffset:(double)a3
{
  if (self->_shadowOffset != a3)
  {
    self->_shadowOffset = a3;
    -[SBAppSwitcherPageShadowView setShadowOffset:](self->_shadowView, "setShadowOffset:");
  }
}

- (void)setShadowAlpha:(double)a3
{
  if (self->_shadowAlpha != a3)
  {
    self->_shadowAlpha = a3;
    -[SBAppSwitcherPageShadowView setAlpha:](self->_shadowView, "setAlpha:");
  }
}

- (void)setResizingAllowed:(BOOL)a3
{
  if (self->_resizingAllowed != a3) {
    self->_resizingAllowed = a3;
  }
}

- (void)setOccludedInContinuousExposeStage:(BOOL)a3
{
  if (self->_occludedInContinuousExposeStage != a3) {
    self->_occludedInContinuousExposeStage = a3;
  }
}

- (void)setNeedsBackgroundWallpaperTreatment:(BOOL)a3
{
  if (self->_needsBackgroundWallpaperTreatment != a3)
  {
    self->_needsBackgroundWallpaperTreatment = a3;
    [(SBAppSwitcherPageView *)self _createOrDestroyWallpaperOverlayView];
  }
}

- (void)setLighteningAlpha:(double)a3
{
  if (self->_lighteningAlpha != a3)
  {
    self->_lighteningAlpha = a3;
    [(SBAppSwitcherPageView *)self _updateTintViewAlpha];
  }
}

- (void)setDimmingAlpha:(double)a3
{
  if (self->_dimmingAlpha != a3)
  {
    self->_dimmingAlpha = a3;
    [(SBAppSwitcherPageView *)self _updateDimmingViewAlpha];
  }
}

- (void)setAllowedTouchResizeCorners:(unint64_t)a3
{
  self->_allowedTouchResizeCorners = a3;
  [(SBAppSwitcherPageView *)self _updateGrabberVisibilities];
}

- (void)setBlocksTouches:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIView *)self->_hitTestBlocker layer];
  [v5 setAllowsHitTesting:v3];

  hitTestBlocker = self->_hitTestBlocker;
  [(UIView *)hitTestBlocker setUserInteractionEnabled:v3];
}

- (void)_updateGrabberVisibilities
{
  if (self->_resizeGrabbersVisible)
  {
    unint64_t allowedTouchResizeCorners = self->_allowedTouchResizeCorners;
    topLeftResizeGrabberPillView = self->_topLeftResizeGrabberPillView;
    if (allowedTouchResizeCorners) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.0;
    }
    [(SBAppResizeGrabberView *)topLeftResizeGrabberPillView setAlpha:v5];
    if ((allowedTouchResizeCorners & 2) != 0) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
    [(SBAppResizeGrabberView *)self->_topRightResizeGrabberPillView setAlpha:v6];
    if ((allowedTouchResizeCorners & 4) != 0) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    [(SBAppResizeGrabberView *)self->_bottomLeftResizeGrabberPillView setAlpha:v7];
    bottomRightResizeGrabberPillView = self->_bottomRightResizeGrabberPillView;
    if ((allowedTouchResizeCorners & 8) != 0) {
      double v9 = 1.0;
    }
    else {
      double v9 = 0.0;
    }
  }
  else
  {
    [(SBAppResizeGrabberView *)self->_topLeftResizeGrabberPillView setAlpha:0.0];
    [(SBAppResizeGrabberView *)self->_topRightResizeGrabberPillView setAlpha:0.0];
    [(SBAppResizeGrabberView *)self->_bottomLeftResizeGrabberPillView setAlpha:0.0];
    bottomRightResizeGrabberPillView = self->_bottomRightResizeGrabberPillView;
    double v9 = 0.0;
  }
  [(SBAppResizeGrabberView *)bottomRightResizeGrabberPillView setAlpha:v9];
}

- (SBAppSwitcherPageContentView)view
{
  return self->_view;
}

- (UIView)overlay
{
  return self->_overlayView;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    [(SBAppSwitcherPageView *)self _updateCornerRadius];
  }
}

- (void)setWallpaperGradientAttributes:(SBSwitcherWallpaperGradientAttributes)a3
{
  double trailingAlpha = a3.trailingAlpha;
  double leadingAlpha = a3.leadingAlpha;
  p_wallpaperGradientAttributes = &self->_wallpaperGradientAttributes;
  if ((SBSwitcherWallpaperGradientAttributesEqual() & 1) == 0)
  {
    p_wallpaperGradientAttributes->double leadingAlpha = leadingAlpha;
    p_wallpaperGradientAttributes->double trailingAlpha = trailingAlpha;
    [(SBAppSwitcherPageView *)self _updateWallpaperGradientAttributes];
  }
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBAppSwitcherPageView *)self view];
  [v4 setVisible:v3];
}

- (void)setCornerRadii:(UIRectCornerRadii)a3
{
  if (a3.topLeft != self->_cornerRadii.topLeft
    || a3.bottomLeft != self->_cornerRadii.bottomLeft
    || a3.bottomRight != self->_cornerRadii.bottomRight
    || a3.topRight != self->_cornerRadii.topRight)
  {
    self->_cornerRadii = a3;
    [(SBAppSwitcherPageView *)self _updateCornerRadius];
  }
}

- (void)_updateCornerRadius
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_cornerRadiuint64_t i = &self->_cornerRadii;
  long long v5 = *(_OWORD *)&self->_cornerRadii.topLeft;
  long long v4 = *(_OWORD *)&self->_cornerRadii.bottomRight;
  v46[0] = v5;
  v46[1] = v4;
  for (uint64_t i = 8; i != 32; i += 8)
  {
    if (*(double *)&v5 < *(double *)((char *)v46 + i)) {
      *(void *)&long long v5 = *(void *)((char *)v46 + i);
    }
  }
  double v45 = *(double *)&v5;
  id v44 = (id)[objc_alloc(MEMORY[0x1E4F4F700]) initWithTopLeft:self->_cornerRadii.topLeft bottomLeft:self->_cornerRadii.bottomLeft bottomRight:self->_cornerRadii.bottomRight topRight:self->_cornerRadii.topRight];
  if ([(SBAppSwitcherPageView *)self _supportsAsymmetricalCornerRadii]
    && ([v44 isCongruent] & 1) == 0)
  {
    contentContainerView = self->_contentContainerView;
    uint64_t v13 = objc_opt_class();
    v14 = contentContainerView;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    v25 = v15;

    [(UIView *)v25 setCornerRadiusConfiguration:v44];
    v26 = self->_contentContainerView;
    uint64_t v27 = objc_opt_class();
    v28 = v26;
    if (v27)
    {
      if (objc_opt_isKindOfClass()) {
        v29 = v28;
      }
      else {
        v29 = 0;
      }
    }
    else
    {
      v29 = 0;
    }
    v30 = v29;

    [(UIView *)v30 setMaskedCorners:self->_maskedCorners];
    v31 = [(SBAppSwitcherPageView *)self view];
    [v31 setMaskedCorners:0];

    v23 = [(SBAppSwitcherPageView *)self view];
    double v24 = 0.0;
    [v23 setCornerRadius:0.0];
  }
  else
  {
    if ([(SBAppSwitcherPageView *)self _supportsAsymmetricalCornerRadii])
    {
      double v7 = (void *)[objc_alloc(MEMORY[0x1E4F4F700]) initWithCornerRadius:0.0];
      v8 = self->_contentContainerView;
      uint64_t v9 = objc_opt_class();
      v10 = v8;
      if (v9)
      {
        if (objc_opt_isKindOfClass()) {
          v11 = v10;
        }
        else {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
      v16 = v11;

      [(UIView *)v16 setCornerRadiusConfiguration:v7];
      v17 = self->_contentContainerView;
      uint64_t v18 = objc_opt_class();
      v19 = v17;
      if (v18)
      {
        if (objc_opt_isKindOfClass()) {
          v20 = v19;
        }
        else {
          v20 = 0;
        }
      }
      else
      {
        v20 = 0;
      }
      v21 = v20;

      [(UIView *)v21 setMaskedCorners:self->_maskedCorners];
    }
    else
    {
      double v7 = [(UIView *)self->_contentContainerView layer];
      [v7 setMaskedCorners:self->_maskedCorners];
    }

    v22 = [(SBAppSwitcherPageView *)self view];
    [v22 setMaskedCorners:self->_maskedCorners];

    v23 = [(SBAppSwitcherPageView *)self view];
    [v23 setCornerRadius:v45];
    double v24 = v45;
  }

  [(UIView *)self->_dimmingView _setContinuousCornerRadius:v24];
  [(SBWallpaperEffectView *)self->_wallpaperOverlayView _setContinuousCornerRadius:v24];
  [(_UIBackdropView *)self->_wallpaperGradientView _setContinuousCornerRadius:v24];
  [(UIView *)self->_tintView _setContinuousCornerRadius:v24];
  [(UIView *)self->_overlayClippingView _setContinuousCornerRadius:v24];
  [(SBAppSwitcherPageShadowView *)self->_shadowView _setContinuousCornerRadius:v45];
  v32 = [(SBAppSwitcherPageShadowView *)self->_shadowView layer];
  [v32 setMaskedCorners:self->_maskedCorners];

  v33 = [(UIView *)self->_overlayClippingView layer];
  [v33 setMaskedCorners:self->_maskedCorners];

  if (self->_shouldClipContentView)
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      uint64_t v34 = 10;
    }
    else {
      uint64_t v34 = 5;
    }
    v35 = [(UIView *)self->_dimmingView layer];
    [v35 setMaskedCorners:v34];

    v36 = [(SBWallpaperEffectView *)self->_wallpaperOverlayView layer];
    [v36 setMaskedCorners:v34];

    v37 = [(SBAppSwitcherWallpaperGradientView *)self->_wallpaperGradientView layer];
    [v37 setMaskedCorners:v34];

    v38 = [(UIView *)self->_tintView layer];
    v39 = v38;
    unint64_t maskedCorners = v34;
  }
  else
  {
    v41 = [(UIView *)self->_dimmingView layer];
    [v41 setMaskedCorners:self->_maskedCorners];

    v42 = [(SBWallpaperEffectView *)self->_wallpaperOverlayView layer];
    [v42 setMaskedCorners:self->_maskedCorners];

    v43 = [(SBAppSwitcherWallpaperGradientView *)self->_wallpaperGradientView layer];
    [v43 setMaskedCorners:self->_maskedCorners];

    v38 = [(UIView *)self->_tintView layer];
    v39 = v38;
    unint64_t maskedCorners = self->_maskedCorners;
  }
  [v38 setMaskedCorners:maskedCorners];

  [(SBAppResizeGrabberView *)self->_topLeftResizeGrabberPillView setCornerRadius:p_cornerRadii->topLeft];
  [(SBAppResizeGrabberView *)self->_topRightResizeGrabberPillView setCornerRadius:p_cornerRadii->topRight];
  [(SBAppResizeGrabberView *)self->_bottomLeftResizeGrabberPillView setCornerRadius:p_cornerRadii->bottomLeft];
  [(SBAppResizeGrabberView *)self->_bottomRightResizeGrabberPillView setCornerRadius:p_cornerRadii->bottomRight];
}

- (BOOL)_supportsAsymmetricalCornerRadii
{
  if (__sb__runningInSpringBoard()) {
    return SBFEffectiveDeviceClass() == 2;
  }
  BOOL v3 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v2 = [v3 userInterfaceIdiom] == 1;

  return v2;
}

- (void)setOverlay:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  overlayView = self->_overlayView;
  if (overlayView != v7)
  {
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v20[0] = *MEMORY[0x1E4F1DAB8];
    v20[1] = v10;
    v20[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIView *)overlayView setTransform:v20];
    v11 = *p_overlayView;
    objc_storeStrong((id *)&self->_overlayView, a3);
    if (*p_overlayView)
    {
      -[UIView addSubview:](self->_overlayClippingView, "addSubview:");
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __45__SBAppSwitcherPageView_setOverlay_animated___block_invoke;
      v19[3] = &unk_1E6AF4AC0;
      v19[4] = self;
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v19];
    }
    double v12 = 0.0;
    if (v4)
    {
      uint64_t v13 = [(SBAppSwitcherPageContentView *)self->_view layer];
      objc_msgSend(v13, "setAllowsGroupOpacity:", -[SBAppSwitcherPageContentView contentRequiresGroupOpacity](self->_view, "contentRequiresGroupOpacity"));

      double v12 = 0.35;
    }
    v14 = (void *)MEMORY[0x1E4F42FF0];
    v17 = v11;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__SBAppSwitcherPageView_setOverlay_animated___block_invoke_2;
    v18[3] = &unk_1E6AF4AC0;
    v18[4] = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __45__SBAppSwitcherPageView_setOverlay_animated___block_invoke_3;
    v16[3] = &unk_1E6AF4A98;
    v16[4] = self;
    v15 = v11;
    [v14 animateWithDuration:v18 animations:v16 completion:v12];
  }
}

uint64_t __45__SBAppSwitcherPageView_setOverlay_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutOverlayView];
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 472);
  return [v2 layoutIfNeeded];
}

- (void)layoutSubviews
{
  [(SBAppSwitcherPageView *)self _orderSubviews];
  [(SBAppSwitcherPageView *)self bounds];
  double v4 = v3;
  double v40 = v6;
  double v41 = v5;
  double v39 = v7;
  [(SBAppSwitcherPageView *)self _contentViewFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v38 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  if (!self->_shouldClipContentView)
  {
    SBRectWithSize();
    double v9 = v19;
    double v16 = v20;
    double v17 = v21;
    double v18 = v22;
  }
  [(UIView *)self->_hitTestBlocker alpha];
  int v23 = SBFloatGreaterThanFloat();
  double v24 = v16;
  double v25 = v18;
  if (v23)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained currentStatusBarHeight];
    double v37 = v4;
    double v28 = v27;

    double v24 = v16 + v28;
    double v25 = v18 - v28;
    double v4 = v37;
  }
  -[UIView setFrame:](self->_hitTestBlocker, "setFrame:", v9, v24, v17, v25);
  -[UIView setFrame:](self->_viewClippingView, "setFrame:", v9, v16, v17, v18);
  -[UIView setFrame:](self->_contentContainerView, "setFrame:", v4, v41, v40, v39);
  -[UIView setFrame:](self->_dimmingView, "setFrame:", v38, v11, v13, v15);
  -[UIView setFrame:](self->_tintView, "setFrame:", v38, v11, v13, v15);
  -[SBWallpaperEffectView setFrame:](self->_wallpaperOverlayView, "setFrame:", v38, v11, v13, v15);
  -[SBAppSwitcherWallpaperGradientView setFrame:](self->_wallpaperGradientView, "setFrame:", v38, v11, v13, v15);
  view = self->_view;
  uint64_t v30 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  double v31 = v13 - v40;
  if (v30 != 1) {
    double v31 = 0.0;
  }
  -[SBAppSwitcherPageContentView setFrame:](view, "setFrame:", v31, 0.0, v40, v39);
  -[UIView setFrame:](self->_overlayClippingView, "setFrame:", v38, v11, v13, v15);
  [(SBAppSwitcherPageView *)self _layoutOverlayView];
  topLeftResizeGrabberPillView = self->_topLeftResizeGrabberPillView;
  if (topLeftResizeGrabberPillView)
  {
    -[SBAppResizeGrabberView frameInContentRect:](topLeftResizeGrabberPillView, "frameInContentRect:", v38, v11, v13, v15);
    -[SBAppResizeGrabberView sb_setBoundsAndPositionFromFrame:](self->_topLeftResizeGrabberPillView, "sb_setBoundsAndPositionFromFrame:");
  }
  topRightResizeGrabberPillView = self->_topRightResizeGrabberPillView;
  if (topRightResizeGrabberPillView)
  {
    -[SBAppResizeGrabberView frameInContentRect:](topRightResizeGrabberPillView, "frameInContentRect:", v38, v11, v13, v15);
    -[SBAppResizeGrabberView sb_setBoundsAndPositionFromFrame:](self->_topRightResizeGrabberPillView, "sb_setBoundsAndPositionFromFrame:");
  }
  bottomLeftResizeGrabberPillView = self->_bottomLeftResizeGrabberPillView;
  if (bottomLeftResizeGrabberPillView)
  {
    -[SBAppResizeGrabberView frameInContentRect:](bottomLeftResizeGrabberPillView, "frameInContentRect:", v38, v11, v13, v15);
    -[SBAppResizeGrabberView sb_setBoundsAndPositionFromFrame:](self->_bottomLeftResizeGrabberPillView, "sb_setBoundsAndPositionFromFrame:");
  }
  bottomRightResizeGrabberPillView = self->_bottomRightResizeGrabberPillView;
  if (bottomRightResizeGrabberPillView)
  {
    -[SBAppResizeGrabberView frameInContentRect:](bottomRightResizeGrabberPillView, "frameInContentRect:", v38, v11, v13, v15);
    -[SBAppResizeGrabberView sb_setBoundsAndPositionFromFrame:](self->_bottomRightResizeGrabberPillView, "sb_setBoundsAndPositionFromFrame:");
  }
  shadowView = self->_shadowView;
  -[SBAppSwitcherPageShadowView setFrame:](shadowView, "setFrame:", v4, v41, v40, v39);
}

- (void)_layoutOverlayView
{
  if (self->_shouldClipContentView)
  {
    double width = self->_contentClippingFrame.size.width;
    double height = self->_contentClippingFrame.size.height;
  }
  else
  {
    [(SBAppSwitcherPageView *)self bounds];
    double width = v5;
    double height = v6;
  }
  SBRectWithSize();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  UIRectGetCenter();
  double v16 = v15;
  double v18 = v17;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v24.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v24.c = v19;
  *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (self->_shouldScaleOverlayToFillBounds)
  {
    [(UIView *)self->_overlayClippingView bounds];
    UIRectGetCenter();
    double v16 = v20;
    double v18 = v21;
    CGAffineTransformMakeScale(&v24, width / v12, height / v14);
  }
  -[UIView setBounds:](self->_overlayView, "setBounds:", v8, v10, v12, v14);
  -[UIView setCenter:](self->_overlayView, "setCenter:", v16, v18);
  overlayView = self->_overlayView;
  CGAffineTransform v23 = v24;
  [(UIView *)overlayView setTransform:&v23];
}

- (CGRect)_contentViewFrame
{
  if (self->_shouldClipContentView)
  {
    double x = self->_contentClippingFrame.origin.x;
    double y = self->_contentClippingFrame.origin.y;
    double width = self->_contentClippingFrame.size.width;
    double height = self->_contentClippingFrame.size.height;
  }
  else
  {
    [(SBAppSwitcherPageView *)self bounds];
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOverlayViewSize:(CGSize)a3
{
  if (self->_overlayViewSize.width != a3.width || self->_overlayViewSize.height != a3.height)
  {
    self->_overlayViewSize = a3;
    [(SBAppSwitcherPageView *)self setNeedsLayout];
  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    double v4 = [(SBAppSwitcherPageView *)self view];
    [v4 setOrientation:self->_orientation];

    [(SBAppSwitcherPageView *)self setNeedsLayout];
  }
}

- (void)setFullyPresentedSize:(CGSize)a3
{
  if (self->_fullyPresentedSize.width != a3.width || self->_fullyPresentedSize.height != a3.height)
  {
    self->_fullyPresentedSize = a3;
    [(SBAppSwitcherPageView *)self setNeedsLayout];
  }
}

- (void)setContentClippingFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentClippingFrame = &self->_contentClippingFrame;
  if (!CGRectEqualToRect(self->_contentClippingFrame, a3))
  {
    p_contentClippingFrame->origin.CGFloat x = x;
    p_contentClippingFrame->origin.CGFloat y = y;
    p_contentClippingFrame->size.CGFloat width = width;
    p_contentClippingFrame->size.CGFloat height = height;
    [(SBAppSwitcherPageView *)self setNeedsLayout];
    [(SBAppSwitcherPageView *)self layoutIfNeeded];
  }
}

- (void)_orderSubviews
{
  [(SBAppSwitcherPageView *)self bringSubviewToFront:self->_shadowView];
  [(SBAppSwitcherPageView *)self bringSubviewToFront:self->_contentContainerView];
  [(SBAppSwitcherPageView *)self bringSubviewToFront:self->_topLeftResizeGrabberPillView];
  [(SBAppSwitcherPageView *)self bringSubviewToFront:self->_topRightResizeGrabberPillView];
  [(SBAppSwitcherPageView *)self bringSubviewToFront:self->_bottomLeftResizeGrabberPillView];
  [(SBAppSwitcherPageView *)self bringSubviewToFront:self->_bottomRightResizeGrabberPillView];
  [(SBAppSwitcherPageView *)self bringSubviewToFront:self->_pointerHitTestBlocker];
  contentContainerView = self->_contentContainerView;
  uint64_t v4 = objc_opt_class();
  double v5 = contentContainerView;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  double v7 = v6;

  double v8 = [(UIView *)v7 contentViews];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(UIView *)self->_contentContainerView subviews];
  }
  id v19 = v10;

  double v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  double v12 = v11;
  if (self->_overlayClippingView) {
    objc_msgSend(v11, "addObject:");
  }
  if (self->_viewClippingView) {
    objc_msgSend(v12, "addObject:");
  }
  if (self->_topLeftResizeGrabberPillView) {
    objc_msgSend(v12, "addObject:");
  }
  if (self->_topRightResizeGrabberPillView) {
    objc_msgSend(v12, "addObject:");
  }
  if (self->_bottomLeftResizeGrabberPillView) {
    objc_msgSend(v12, "addObject:");
  }
  if (self->_bottomRightResizeGrabberPillView) {
    objc_msgSend(v12, "addObject:");
  }
  if (self->_tintView) {
    objc_msgSend(v12, "addObject:");
  }
  if (self->_dimmingView) {
    objc_msgSend(v12, "addObject:");
  }
  if (self->_wallpaperOverlayView) {
    objc_msgSend(v12, "addObject:");
  }
  if (self->_wallpaperGradientView) {
    objc_msgSend(v12, "addObject:");
  }
  if (self->_hitTestBlocker) {
    objc_msgSend(v12, "addObject:");
  }
  if (([v19 isEqual:v12] & 1) == 0)
  {
    BOOL v13 = [(SBAppSwitcherPageView *)self _supportsAsymmetricalCornerRadii];
    double v14 = self->_contentContainerView;
    if (v13)
    {
      uint64_t v15 = objc_opt_class();
      double v16 = v14;
      if (v15)
      {
        if (objc_opt_isKindOfClass()) {
          double v17 = v16;
        }
        else {
          double v17 = 0;
        }
      }
      else
      {
        double v17 = 0;
      }
      double v18 = v17;

      [(UIView *)v18 bringContentViewToFront:self->_overlayClippingView];
      [(UIView *)v18 bringContentViewToFront:self->_viewClippingView];
      [(UIView *)v18 bringContentViewToFront:self->_tintView];
      [(UIView *)v18 bringContentViewToFront:self->_dimmingView];
      [(UIView *)v18 bringContentViewToFront:self->_wallpaperOverlayView];
      [(UIView *)v18 bringContentViewToFront:self->_wallpaperGradientView];
      [(UIView *)v18 bringContentViewToFront:self->_hitTestBlocker];
    }
    else
    {
      [(UIView *)self->_contentContainerView bringSubviewToFront:self->_overlayClippingView];
      [(UIView *)self->_contentContainerView bringSubviewToFront:self->_viewClippingView];
      [(UIView *)self->_contentContainerView bringSubviewToFront:self->_tintView];
      [(UIView *)self->_contentContainerView bringSubviewToFront:self->_dimmingView];
      [(UIView *)self->_contentContainerView bringSubviewToFront:self->_wallpaperOverlayView];
      [(UIView *)self->_contentContainerView bringSubviewToFront:self->_wallpaperGradientView];
      [(UIView *)self->_contentContainerView bringSubviewToFront:self->_hitTestBlocker];
    }
  }
}

void *__45__SBAppSwitcherPageView_setOverlay_animated___block_invoke_3(uint64_t a1)
{
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 456) layer];
  [v2 setAllowsGroupOpacity:0];

  CGRect result = *(void **)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void **)(v4 + 472) != result)
    {
      CGRect result = (void *)[result isDescendantOfView:*(void *)(v4 + 464)];
      if (result)
      {
        double v5 = *(void **)(a1 + 40);
        return (void *)[v5 removeFromSuperview];
      }
    }
  }
  return result;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBAppSwitcherPageView *)self view];
  [v4 setActive:v3];
}

- (SBAppSwitcherPageShadowView)_shadowView
{
  return self->_shadowView;
}

uint64_t __45__SBAppSwitcherPageView_setOverlay_animated___block_invoke_2(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  double v3 = 0.0;
  if (!v2[59]) {
    double v3 = 1.0;
  }
  [v2 setContentAlpha:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 448);
  BOOL v6 = *(void *)(v4 + 472) != 0;
  return objc_msgSend(v5, "bs_setHitTestingDisabled:", v6);
}

- (void)setContentAlpha:(double)a3
{
}

- (SBAppSwitcherPageView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  v51.receiver = self;
  v51.super_class = (Class)SBAppSwitcherPageView;
  double v5 = -[SBHitTestExtendedView initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    uint64_t v6 = +[SBAppSwitcherDomain rootSettings];
    double v7 = (void *)*((void *)v5 + 69);
    *((void *)v5 + 69) = v6;

    double v8 = [MEMORY[0x1E4F428B8] clearColor];
    [v5 setBackgroundColor:v8];

    [v5 setHitTestsSubviewsOutsideBounds:0];
    int v9 = [v5 _supportsAsymmetricalCornerRadii];
    id v10 = (_OWORD *)MEMORY[0x1E4F1DB28];
    if (v9)
    {
      double v11 = -[SBAsymmetricalCornerRadiusWrapperView initWithFrame:]([SBAsymmetricalCornerRadiusWrapperView alloc], "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v12 = (void *)*((void *)v5 + 64);
      *((void *)v5 + 64) = v11;

      [*((id *)v5 + 64) setClipsToBounds:1];
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      double v14 = (void *)*((void *)v5 + 64);
      *((void *)v5 + 64) = v13;
    }
    [v5 addSubview:*((void *)v5 + 64)];
    id v15 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    double v16 = (void *)*((void *)v5 + 52);
    *((void *)v5 + 52) = v15;

    double v17 = (void *)*((void *)v5 + 52);
    double v18 = [MEMORY[0x1E4F428B8] clearColor];
    [v17 setBackgroundColor:v18];

    id v19 = [*((id *)v5 + 52) layer];
    [v19 setHitTestsAsOpaque:1];

    double v20 = [*((id *)v5 + 52) layer];
    [v20 setAllowsHitTesting:1];

    [v5 _addContentView:*((void *)v5 + 52)];
    id v21 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    double v22 = (void *)*((void *)v5 + 53);
    *((void *)v5 + 53) = v21;

    CGAffineTransform v23 = (void *)*((void *)v5 + 53);
    CGAffineTransform v24 = [MEMORY[0x1E4F428B8] blackColor];
    [v23 setBackgroundColor:v24];

    [*((id *)v5 + 53) setClipsToBounds:1];
    double v25 = [*((id *)v5 + 53) layer];
    [v25 setAllowsHitTesting:0];

    [v5 _addContentView:*((void *)v5 + 53)];
    id v26 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    double v27 = (void *)*((void *)v5 + 55);
    *((void *)v5 + 55) = v26;

    double v28 = (void *)*((void *)v5 + 55);
    v29 = [MEMORY[0x1E4F428B8] whiteColor];
    [v28 setBackgroundColor:v29];

    uint64_t v30 = [*((id *)v5 + 55) layer];
    [v30 setAllowsHitTesting:0];

    [*((id *)v5 + 55) setClipsToBounds:1];
    *((void *)v5 + 93) = 0;
    [v5 _updateTintStyle];
    [v5 _addContentView:*((void *)v5 + 55)];
    long long v31 = v10[1];
    *(_OWORD *)(v5 + 808) = *v10;
    *(_OWORD *)(v5 + 824) = v31;
    *((CGFloat *)v5 + 95) = width;
    *((CGFloat *)v5 + 96) = height;
    id v32 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v33 = (void *)*((void *)v5 + 56);
    *((void *)v5 + 56) = v32;

    [*((id *)v5 + 56) setClipsToBounds:1];
    [v5 _addContentView:*((void *)v5 + 56)];
    uint64_t v34 = objc_alloc_init(SBHitTestExtendedView);
    v35 = (void *)*((void *)v5 + 58);
    *((void *)v5 + 58) = v34;

    [*((id *)v5 + 58) setClipsToBounds:1];
    [v5 _addContentView:*((void *)v5 + 58)];
    [v5 _updateShadowPresence];
    [v5 setShadowStyle:1];
    [v5 setShadowAlpha:1.0];
    [v5 _updateEffectOverlayViews];
    [v5 _updateCornerRadius];
    [v5 setResizeGrabbersVisible:1];
    if (SBFIsChamoisWindowingUIAvailable())
    {
      v36 = [[SBAppResizeGrabberView alloc] initWithCorner:0];
      double v37 = (void *)*((void *)v5 + 72);
      *((void *)v5 + 72) = v36;

      [v5 addSubview:*((void *)v5 + 72)];
      double v38 = [[SBAppResizeGrabberView alloc] initWithCorner:1];
      double v39 = (void *)*((void *)v5 + 73);
      *((void *)v5 + 73) = v38;

      [v5 addSubview:*((void *)v5 + 73)];
      double v40 = [[SBAppResizeGrabberView alloc] initWithCorner:2];
      double v41 = (void *)*((void *)v5 + 74);
      *((void *)v5 + 74) = v40;

      [v5 addSubview:*((void *)v5 + 74)];
      v42 = [[SBAppResizeGrabberView alloc] initWithCorner:3];
      v43 = (void *)*((void *)v5 + 75);
      *((void *)v5 + 75) = v42;

      [v5 addSubview:*((void *)v5 + 75)];
      id v44 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      double v45 = (void *)*((void *)v5 + 82);
      *((void *)v5 + 82) = v44;

      v46 = (void *)*((void *)v5 + 82);
      uint64_t v47 = [MEMORY[0x1E4F428B8] clearColor];
      [v46 setBackgroundColor:v47];

      v48 = [*((id *)v5 + 82) layer];
      [v48 setHitTestsAsOpaque:1];

      v49 = [*((id *)v5 + 82) layer];
      [v49 setAllowsHitTesting:1];

      [v5 addSubview:*((void *)v5 + 82)];
    }
    [*((id *)v5 + 69) addKeyObserver:v5];
  }
  return (SBAppSwitcherPageView *)v5;
}

- (void)_addContentView:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(SBAppSwitcherPageView *)self _supportsAsymmetricalCornerRadii];
  contentContainerView = self->_contentContainerView;
  if (v4)
  {
    uint64_t v6 = objc_opt_class();
    double v7 = contentContainerView;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        double v8 = v7;
      }
      else {
        double v8 = 0;
      }
    }
    else
    {
      double v8 = 0;
    }
    int v9 = v8;

    [(UIView *)v9 addContentView:v10];
  }
  else
  {
    [(UIView *)contentContainerView addSubview:v10];
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v8 = a3;
  if (SBFIsChamoisWindowingUIAvailable())
  {
    BOOL v4 = [(UIView *)self _sbWindowScene];
    double v5 = [v4 systemPointerInteractionManager];

    uint64_t v6 = [v8 _sbWindowScene];
    double v7 = [v6 systemPointerInteractionManager];

    if (v5 != v7)
    {
      [v5 unregisterView:self];
      [v7 registerView:self delegate:self];
      objc_storeWeak((id *)&self->_systemPointerInteractionManager, v7);
    }
  }
}

- (void)setView:(id)a3 animated:(BOOL)a4
{
  double v7 = (SBAppSwitcherPageContentView *)a3;
  id v8 = v7;
  view = self->_view;
  if (view != v7)
  {
    if (a4)
    {
      id v10 = view;
      objc_storeStrong((id *)&self->_view, a3);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __42__SBAppSwitcherPageView_setView_animated___block_invoke_2;
      v17[3] = &unk_1E6AF4AC0;
      v17[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v17];
      double v11 = (void *)MEMORY[0x1E4F42FF0];
      id v15 = v10;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __42__SBAppSwitcherPageView_setView_animated___block_invoke_3;
      v16[3] = &unk_1E6AF4AC0;
      v16[4] = self;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __42__SBAppSwitcherPageView_setView_animated___block_invoke_4;
      v14[3] = &unk_1E6AF5350;
      double v12 = v10;
      [v11 animateWithDuration:v16 animations:v14 completion:0.35];
    }
    else
    {
      id v13 = (void *)MEMORY[0x1E4F42FF0];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __42__SBAppSwitcherPageView_setView_animated___block_invoke;
      v18[3] = &unk_1E6AF5290;
      v18[4] = self;
      id v19 = v7;
      [v13 performWithoutAnimation:v18];
    }
  }
}

void __42__SBAppSwitcherPageView_setView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) removeFromSuperview];
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 456);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 456), *(id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 456))
  {
    objc_msgSend(*(id *)(v4 + 448), "addSubview:");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setOrientation:", objc_msgSend(*(id *)(a1 + 32), "orientation"));
    [*(id *)(a1 + 32) _updateCornerRadius];
    [*(id *)(a1 + 32) setNeedsLayout];
    [*(id *)(a1 + 32) layoutIfNeeded];
  }
}

uint64_t __42__SBAppSwitcherPageView_setView_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 448) addSubview:*(void *)(*(void *)(a1 + 32) + 456)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setOrientation:", objc_msgSend(*(id *)(a1 + 32), "orientation"));
  [*(id *)(a1 + 32) _updateCornerRadius];
  [*(id *)(a1 + 32) setNeedsLayout];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __42__SBAppSwitcherPageView_setView_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:1.0];
}

uint64_t __42__SBAppSwitcherPageView_setView_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  BOOL v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

- (void)_updateTintStyle
{
  id v9 = +[SBAppSwitcherDomain rootSettings];
  switch(self->_tintStyle)
  {
    case 0:
    case 3:
      p_tintView = &self->_tintView;
      tintView = self->_tintView;
      double v5 = [MEMORY[0x1E4F428B8] clearColor];
      [(UIView *)tintView setBackgroundColor:v5];
      double v6 = 0.0;
      goto LABEL_7;
    case 1:
      p_tintView = &self->_tintView;
      double v7 = self->_tintView;
      double v5 = [MEMORY[0x1E4F428B8] systemBlackColor];
      [v9 tintStyleDimmingAlphaInFocusForLightMode];
      goto LABEL_6;
    case 2:
      p_tintView = &self->_tintView;
      double v7 = self->_tintView;
      double v5 = [MEMORY[0x1E4F428B8] systemGray2Color];
      [v9 tintStyleDimmingAlphaInFocusForDarkMode];
      goto LABEL_6;
    case 4:
      p_tintView = &self->_tintView;
      double v7 = self->_tintView;
      double v5 = [MEMORY[0x1E4F428B8] systemGrayColor];
      [v9 tintStyleDimmingAlphaUnFocusForDarkMode];
LABEL_6:
      id v8 = objc_msgSend(v5, "colorWithAlphaComponent:");
      [(UIView *)v7 setBackgroundColor:v8];

      double v6 = 1.0;
LABEL_7:

      [(UIView *)*p_tintView setAlpha:v6];
      break;
    default:
      break;
  }
}

- (void)setView:(id)a3
{
}

- (BOOL)isActive
{
  BOOL v2 = [(SBAppSwitcherPageView *)self view];
  char v3 = [v2 isActive];

  return v3;
}

- (BOOL)isVisible
{
  BOOL v2 = [(SBAppSwitcherPageView *)self view];
  char v3 = [v2 isVisible];

  return v3;
}

- (BOOL)isOccludedInContinuousExposeStage
{
  return self->_occludedInContinuousExposeStage;
}

- (void)setResizeGrabbersVisible:(BOOL)a3
{
  self->_resizeGrabbersVisible = a3;
  [(SBAppSwitcherPageView *)self _updateGrabberVisibilities];
}

- (BOOL)isResizingAllowed
{
  return self->_resizingAllowed;
}

- (BOOL)blocksTouches
{
  char v3 = [(UIView *)self->_hitTestBlocker layer];
  if ([v3 hitTestsAsOpaque]) {
    BOOL v4 = [(UIView *)self->_hitTestBlocker isUserInteractionEnabled];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setOverlay:(id)a3
{
}

- (void)setOverlayAlpha:(double)a3
{
}

- (double)overlayAlpha
{
  [(UIView *)self->_overlayView alpha];
  return result;
}

- (double)contentAlpha
{
  [(SBAppSwitcherPageContentView *)self->_view alpha];
  return result;
}

- (void)setHighlightType:(unint64_t)a3
{
  if (self->_highlightType != a3)
  {
    self->_highlightType = a3;
    -[SBAppSwitcherPageShadowView setHighlightType:](self->_shadowView, "setHighlightType:");
  }
}

- (void)setShouldClipContentView:(BOOL)a3
{
  if (self->_shouldClipContentView != a3)
  {
    self->_shouldClipContentView = a3;
    [(SBAppSwitcherPageView *)self _updateCornerRadius];
    [(SBAppSwitcherPageView *)self setNeedsLayout];
    [(SBAppSwitcherPageView *)self layoutIfNeeded];
  }
}

- (void)setSwitcherCardScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_switcherCardScale = a3;
    shadowView = self->_shadowView;
    [(SBAppSwitcherPageShadowView *)shadowView setSwitcherCardScale:a3];
  }
}

- (void)setShouldScaleOverlayToFillBounds:(BOOL)a3
{
  if (self->_shouldScaleOverlayToFillBounds != a3)
  {
    self->_shouldScaleOverlayToFillBounds = a3;
    [(SBAppSwitcherPageView *)self setNeedsLayout];
  }
}

- (void)invalidate
{
  char v3 = [(SBAppSwitcherPageView *)self view];
  [v3 invalidate];

  [(SBAppSwitcherPageView *)self setView:0];
  [(SBAppSwitcherPageView *)self pointerWillExitRegion];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
  [WeakRetained unregisterView:self];

  objc_storeWeak((id *)&self->_systemPointerInteractionManager, 0);
}

- (void)_updateDimmingViewAlpha
{
}

- (void)_updateTintViewAlpha
{
}

- (void)_updateWallpaperOverlayAlpha
{
}

- (void)_updateWallpaperGradientAttributes
{
  -[SBAppSwitcherWallpaperGradientView setAttributes:](self->_wallpaperGradientView, "setAttributes:", self->_wallpaperGradientAttributes.leadingAlpha, self->_wallpaperGradientAttributes.trailingAlpha);
  if (!BSFloatIsZero() || (IsZero = BSFloatIsZero(), double v4 = 0.0, (IsZero & 1) == 0)) {
    double v4 = 1.0;
  }
  wallpaperGradientView = self->_wallpaperGradientView;
  [(SBAppSwitcherWallpaperGradientView *)wallpaperGradientView setAlpha:v4];
}

- (void)_updateShadowPresence
{
  BOOL v3 = [(SBAppSwitcherSettings *)self->_settings shouldSimplifyForOptions:32];
  shadowView = self->_shadowView;
  if (v3)
  {
    if (shadowView)
    {
      [(SBAppSwitcherPageShadowView *)shadowView removeFromSuperview];
      double v5 = self->_shadowView;
      self->_shadowView = 0;
    }
  }
  else if (!shadowView)
  {
    double v6 = [SBAppSwitcherPageShadowView alloc];
    [(SBAppSwitcherPageView *)self bounds];
    double v7 = -[SBAppSwitcherPageShadowView initWithFrame:style:](v6, "initWithFrame:style:", self->_shadowStyle);
    id v8 = self->_shadowView;
    self->_shadowView = v7;

    id v9 = self->_shadowView;
    [(SBAppSwitcherPageView *)self addSubview:v9];
  }
}

- (void)_updateEffectOverlayViews
{
  [(SBAppSwitcherPageView *)self _updateDimmingViewAlpha];
  [(SBAppSwitcherPageView *)self _updateTintViewAlpha];
  [(SBAppSwitcherPageView *)self _updateWallpaperOverlayAlpha];
  [(SBAppSwitcherPageView *)self _updateWallpaperGradientAttributes];
}

- (void)_createOrDestroyWallpaperOverlayView
{
  if (!self->_needsBackgroundWallpaperTreatment
    || !self->_wallpaperOverlayView
    && (v5[0] = MEMORY[0x1E4F143A8],
        v5[1] = 3221225472,
        v5[2] = __61__SBAppSwitcherPageView__createOrDestroyWallpaperOverlayView__block_invoke,
        _OWORD v5[3] = &unk_1E6AF4AC0,
        v5[4] = self,
        [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v5],
        !self->_needsBackgroundWallpaperTreatment))
  {
    wallpaperOverlayView = self->_wallpaperOverlayView;
    if (wallpaperOverlayView)
    {
      [(SBWallpaperEffectView *)wallpaperOverlayView removeFromSuperview];
      double v4 = self->_wallpaperOverlayView;
      self->_wallpaperOverlayView = 0;
    }
  }
}

uint64_t __61__SBAppSwitcherPageView__createOrDestroyWallpaperOverlayView__block_invoke(uint64_t a1)
{
  BOOL v2 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 432);
  *(void *)(v3 + 432) = v2;

  double v5 = *(void **)(a1 + 32);
  double v6 = (void *)v5[54];
  [v5 _contentViewFrame];
  objc_msgSend(v6, "setFrame:");
  [*(id *)(*(void *)(a1 + 32) + 432) setStyle:14];
  double v7 = [*(id *)(*(void *)(a1 + 32) + 432) layer];
  [v7 setAllowsHitTesting:0];

  [*(id *)(*(void *)(a1 + 32) + 432) setClipsToBounds:1];
  [*(id *)(a1 + 32) _addContentView:*(void *)(*(void *)(a1 + 32) + 432)];
  [*(id *)(a1 + 32) _updateWallpaperOverlayAlpha];
  id v8 = *(void **)(a1 + 32);
  return [v8 _updateCornerRadius];
}

- (void)_createOrDestroyWallpaperGradientView
{
  BOOL needsWallpaperGradientTreatment = self->_needsWallpaperGradientTreatment;
  wallpaperGradientView = self->_wallpaperGradientView;
  if (needsWallpaperGradientTreatment)
  {
    if (!wallpaperGradientView)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __62__SBAppSwitcherPageView__createOrDestroyWallpaperGradientView__block_invoke;
      v6[3] = &unk_1E6AF4AC0;
      v6[4] = self;
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v6];
    }
  }
  else if (wallpaperGradientView)
  {
    [(SBAppSwitcherWallpaperGradientView *)wallpaperGradientView removeFromSuperview];
    double v5 = self->_wallpaperGradientView;
    self->_wallpaperGradientView = 0;
  }
}

void __62__SBAppSwitcherPageView__createOrDestroyWallpaperGradientView__block_invoke(uint64_t a1)
{
  BOOL v2 = [[SBAppSwitcherWallpaperGradientView alloc] initWithPrivateStyle:-2];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 568);
  *(void *)(v3 + 568) = v2;

  id v5 = [*(id *)(*(void *)(a1 + 32) + 568) inputSettings];
  [v5 setScale:0.1];
  [v5 setBlurRadius:50.0];
  [v5 setBackdropVisible:1];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 568), "bs_setHitTestingDisabled:", 1);
  [*(id *)(*(void *)(a1 + 32) + 568) setGroupName:@"AppSwitcherWallpaperGradient"];
  [*(id *)(a1 + 32) _addContentView:*(void *)(*(void *)(a1 + 32) + 568)];
  [*(id *)(a1 + 32) _updateWallpaperGradientAttributes];
  [*(id *)(a1 + 32) _updateCornerRadius];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBAppSwitcherPageView;
  id v4 = a3;
  [(SBAppSwitcherPageView *)&v8 traitCollectionDidChange:v4];
  id v5 = [(SBAppSwitcherPageView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(SBAppSwitcherPageView *)self _updateEffectOverlayViews];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_settings == a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__SBAppSwitcherPageView_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __53__SBAppSwitcherPageView_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateShadowPresence];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _updateEffectOverlayViews];
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t v37 = 0;
  CGPoint v9 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGPoint v35 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v36 = v10;
  if (!self->_resizingAllowed) {
    goto LABEL_6;
  }
  if (self->_occludedInContinuousExposeStage) {
    goto LABEL_6;
  }
  CGSize v33 = v10;
  CGPoint v34 = v9;
  double v11 = [(SBAppSwitcherPageView *)self window];
  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = [(SBAppSwitcherPageView *)self window];
  int v17 = objc_msgSend(WeakRetained, "appSwitcherPageView:shouldBeginPointerInteractionAtLocation:window:", self, v16, v13, v15);

  CGSize v10 = v33;
  CGPoint v9 = v34;
  if (!v17) {
    goto LABEL_6;
  }
  [(SBAppSwitcherPageView *)self _contentViewFrame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [(SBAppSwitcherSettings *)self->_settings liveResizePointerInteractionRegionInnerLength];
  double v27 = v26;
  [(SBAppSwitcherSettings *)self->_settings liveResizePointerInteractionRegionOuterLength];
  BOOL v29 = +[SBEdgeResizeSystemPointerInteractionHelper shouldBeginPointerInteractionAtLocation:frame:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerLengthOfInteractionRegion:occupiedCorners:hoveringOverEdge:pointerRegion:](SBEdgeResizeSystemPointerInteractionHelper, "shouldBeginPointerInteractionAtLocation:frame:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerLengthOfInteractionRegion:occupiedCorners:hoveringOverEdge:pointerRegion:", [(SBAppSwitcherPageView *)self allowedTouchResizeCorners], &v37, &v35, x, y, v19, v21, v23, v25, v27, v28, 0x4039000000000000);
  CGSize v10 = v33;
  CGPoint v9 = v34;
  if (v29)
  {
    self->_hoveringOverEdge = v37;
    CGSize v30 = v36;
    self->_pointerRegion.origin = v35;
    self->_pointerRegion.size = v30;
    BOOL v31 = 1;
  }
  else
  {
LABEL_6:
    BOOL v31 = 0;
    self->_hoveringOverEdge = 0;
    self->_pointerRegion.origin = v9;
    self->_pointerRegion.size = v10;
  }
  [WeakRetained appSwitcherPageView:self pointerIsHoveringOverEdge:self->_hoveringOverEdge];

  return v31;
}

- (void)pointerWillExitRegion
{
  uint64_t v3 = MEMORY[0x1E4F1DB28];
  -[UIView setFrame:](self->_pointerHitTestBlocker, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  CGSize v4 = *(CGSize *)(v3 + 16);
  self->_pointerRegion.origin = *(CGPoint *)v3;
  self->_pointerRegion.size = v4;
  self->_hoveringOverEdge = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained appSwitcherPageView:self pointerIsHoveringOverEdge:self->_hoveringOverEdge];
}

- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3
{
  UIEdgeInsetsMakeWithEdges();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)regionAtLocation:(CGPoint)a3 forView:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F42CB0];
  p_pointerRegion = &self->_pointerRegion;
  uint64_t v7 = (objc_class *)objc_opt_class();
  objc_super v8 = NSStringFromClass(v7);
  CGPoint v9 = objc_msgSend(v5, "regionWithRect:identifier:", v8, p_pointerRegion->origin.x, p_pointerRegion->origin.y, p_pointerRegion->size.width, p_pointerRegion->size.height);

  objc_msgSend(v9, "setLatchingAxes:", +[SBEdgeResizeSystemPointerInteractionHelper latchingAxesForHoveredEdge:](SBEdgeResizeSystemPointerInteractionHelper, "latchingAxesForHoveredEdge:", self->_hoveringOverEdge));
  return v9;
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  pointerHitTestBlocker = self->_pointerHitTestBlocker;
  [a3 rect];
  -[UIView setFrame:](pointerHitTestBlocker, "setFrame:");
  unint64_t hoveringOverEdge = self->_hoveringOverEdge;
  [(SBAppSwitcherSettings *)self->_settings liveResizePointerInteractionRegionInnerLength];
  double v8 = v7;
  [(SBAppSwitcherSettings *)self->_settings liveResizePointerInteractionRegionOuterLength];
  CGSize v10 = +[SBEdgeResizeSystemPointerInteractionHelper fancyResizePointerShapeHoveringOverEdge:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerRadii:](SBEdgeResizeSystemPointerInteractionHelper, "fancyResizePointerShapeHoveringOverEdge:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerRadii:", hoveringOverEdge, v8, v9, self->_cornerRadii.topLeft, self->_cornerRadii.bottomLeft, self->_cornerRadii.bottomRight, self->_cornerRadii.topRight);
  unint64_t v11 = +[SBEdgeResizeSystemPointerInteractionHelper latchingAxesForHoveredEdge:self->_hoveringOverEdge];
  double v12 = [MEMORY[0x1E4F42CC0] styleWithShape:v10 constrainedAxes:v11];

  return v12;
}

- (int64_t)shadowStyle
{
  return self->_shadowStyle;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (double)shadowOffset
{
  return self->_shadowOffset;
}

- (UIRectCornerRadii)cornerRadii
{
  double topLeft = self->_cornerRadii.topLeft;
  double bottomLeft = self->_cornerRadii.bottomLeft;
  double bottomRight = self->_cornerRadii.bottomRight;
  double topRight = self->_cornerRadii.topRight;
  result.double topRight = topRight;
  result.double bottomRight = bottomRight;
  result.double bottomLeft = bottomLeft;
  result.double topLeft = topLeft;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)highlightType
{
  return self->_highlightType;
}

- (BOOL)shouldClipContentView
{
  return self->_shouldClipContentView;
}

- (CGRect)contentClippingFrame
{
  double x = self->_contentClippingFrame.origin.x;
  double y = self->_contentClippingFrame.origin.y;
  double width = self->_contentClippingFrame.size.width;
  double height = self->_contentClippingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)overlayViewSize
{
  double width = self->_overlayViewSize.width;
  double height = self->_overlayViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)fullyPresentedSize
{
  double width = self->_fullyPresentedSize.width;
  double height = self->_fullyPresentedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)switcherCardScale
{
  return self->_switcherCardScale;
}

- (BOOL)shouldScaleOverlayToFillBounds
{
  return self->_shouldScaleOverlayToFillBounds;
}

- (UIView)_overlayClippingView
{
  return self->_overlayClippingView;
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (double)pointerInteractionHitTestPadding
{
  return self->_pointerInteractionHitTestPadding;
}

- (void)setPointerInteractionHitTestPadding:(double)a3
{
  self->_pointerInteractionHitTestPadding = a3;
}

- (BOOL)needsBackgroundWallpaperTreatment
{
  return self->_needsBackgroundWallpaperTreatment;
}

- (double)wallpaperOverlayAlpha
{
  return self->_wallpaperOverlayAlpha;
}

- (double)lighteningAlpha
{
  return self->_lighteningAlpha;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (BOOL)needsWallpaperGradientTreatment
{
  return self->_needsWallpaperGradientTreatment;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributes
{
  double leadingAlpha = self->_wallpaperGradientAttributes.leadingAlpha;
  double trailingAlpha = self->_wallpaperGradientAttributes.trailingAlpha;
  result.double trailingAlpha = trailingAlpha;
  result.double leadingAlpha = leadingAlpha;
  return result;
}

- (BOOL)areResizeGrabbersVisible
{
  return self->_resizeGrabbersVisible;
}

- (unint64_t)allowedTouchResizeCorners
{
  return self->_allowedTouchResizeCorners;
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (SBAppSwitcherPageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAppSwitcherPageViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_systemPointerInteractionManager);
  objc_storeStrong((id *)&self->_pointerHitTestBlocker, 0);
  objc_storeStrong((id *)&self->_bottomRightResizeGrabberPillView, 0);
  objc_storeStrong((id *)&self->_bottomLeftResizeGrabberPillView, 0);
  objc_storeStrong((id *)&self->_topRightResizeGrabberPillView, 0);
  objc_storeStrong((id *)&self->_topLeftResizeGrabberPillView, 0);
  objc_storeStrong((id *)&self->_wallpaperGradientView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_overlayClippingView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_viewClippingView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_wallpaperOverlayView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_hitTestBlocker, 0);
}

@end