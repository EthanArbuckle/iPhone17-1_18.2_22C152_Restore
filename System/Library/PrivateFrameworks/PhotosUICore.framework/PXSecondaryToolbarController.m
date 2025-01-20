@interface PXSecondaryToolbarController
- (BOOL)isAtTop;
- (BOOL)isSecondaryToolbarVisible;
- (BOOL)isShowingGradient;
- (BOOL)legibilityGradientEnabled;
- (BOOL)shouldAlwaysBeConsideredVisibleForLayoutPurpose;
- (BOOL)stretched;
- (NSString)backdropGroupName;
- (PXScrollViewController)contentScrollViewController;
- (PXSecondaryToolbarActionHandler)actionHandler;
- (PXSecondaryToolbarController)init;
- (PXSecondaryToolbarController)initWithContainerView:(id)a3 styleGuideProvider:(id)a4;
- (PXSecondaryToolbarControllerUpdateDelegate)updateDelegate;
- (PXUpdater)updater;
- (UIEdgeInsets)containerViewAdditionalEdgeInsets;
- (UIEdgeInsets)containerViewAdditionalEdgeInsetsWhenVisible:(BOOL)a3;
- (UIEdgeInsets)padding;
- (UIView)containerView;
- (UIView)contentView;
- (UIView)leadingAccessoryView;
- (UIView)legibilityContainerView;
- (UIView)secondaryToolbar;
- (UIView)toolbarContainerView;
- (UIView)trailingAccessoryView;
- (double)alpha;
- (double)height;
- (void)_handleScheduledLegibilityGradientUpdate;
- (void)_invalidateAccessoryViewsLayout;
- (void)_invalidateContentLayout;
- (void)_invalidateLegibilityGradient;
- (void)_replaceAccessoryView:(id)a3 with:(id)a4;
- (void)_updateAccessoryViewsLayout;
- (void)_updateContentLayout;
- (void)_updateLegibilityGradient;
- (void)_updatePositioning;
- (void)_updateSecondaryToolbarLayout;
- (void)_updateViewOpacity;
- (void)invalidatePositioning;
- (void)invalidateSecondaryToolbarLayout;
- (void)invalidateViewOpacity;
- (void)removeFromContainerView;
- (void)setActionHandler:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setContentScrollViewController:(id)a3;
- (void)setContentView:(id)a3;
- (void)setHeight:(double)a3;
- (void)setIsAtTop:(BOOL)a3;
- (void)setIsShowingGradient:(BOOL)a3;
- (void)setLeadingAccessoryView:(id)a3;
- (void)setLegibilityContainerView:(id)a3;
- (void)setLegibilityGradientEnabled:(BOOL)a3;
- (void)setNeedsUpdate;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setShouldAlwaysBeConsideredVisibleForLayoutPurpose:(BOOL)a3;
- (void)setStretched:(BOOL)a3;
- (void)setTrailingAccessoryView:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)updateIfNeeded;
@end

@implementation PXSecondaryToolbarController

- (void)_updateViewOpacity
{
  [(PXSecondaryToolbarController *)self alpha];
  double v4 = v3;
  id v5 = [(PXSecondaryToolbarController *)self toolbarContainerView];
  [v5 setAlpha:v4];
}

- (double)alpha
{
  return self->_alpha;
}

- (void)_updateAccessoryViewsLayout
{
  [(PXSecondaryToolbarController *)self containerView];
  [(id)objc_claimAutoreleasedReturnValue() effectiveUserInterfaceLayoutDirection];
  double v3 = [(PXSecondaryToolbarController *)self secondaryToolbar];
  [v3 frame];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleGuideProvider);
  [WeakRetained secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:self];

  PXFloatApproximatelyEqualToFloat();
}

void __59__PXSecondaryToolbarController__updateAccessoryViewsLayout__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 72)) {
      PXRectEdgeFlippedHorizontally();
    }
    [v3 frame];
    PXRectEdgeAxis();
  }
}

- (void)_updateSecondaryToolbarLayout
{
  id v3 = [(PXSecondaryToolbarController *)self containerView];
  uint64_t v4 = [(PXSecondaryToolbarController *)self secondaryToolbar];
  [(PXSecondaryToolbarController *)self padding];
  [v3 safeAreaInsets];
  [v3 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v3 bringSubviewToFront:v4];
  [(PXSecondaryToolbarController *)self height];
  if ([(PXSecondaryToolbarController *)self isAtTop])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_styleGuideProvider);
    [WeakRetained secondaryToolbarControllerToolbarContentInsets:self];
  }
  else
  {
    v17.origin.x = v6;
    v17.origin.y = v8;
    v17.size.width = v10;
    v17.size.height = v12;
    CGRectGetMaxY(v17);
    [v3 layoutMargins];
    [(PXSecondaryToolbarController *)self height];
  }
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x4010000000;
  v14[3] = &unk_1AB5D584F;
  long long v15 = 0u;
  long long v16 = 0u;
  PXEdgeInsetsInsetRect();
}

- (UIView)secondaryToolbar
{
  return self->_secondaryToolbar;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (double)height
{
  return self->_height;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

void __61__PXSecondaryToolbarController__updateSecondaryToolbarLayout__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    [a2 frame];
    PXPointSubtract();
  }
}

- (UIView)trailingAccessoryView
{
  return self->_trailingAccessoryView;
}

- (UIView)leadingAccessoryView
{
  return self->_leadingAccessoryView;
}

- (UIView)toolbarContainerView
{
  return self->_toolbarContainerView;
}

void __61__PXSecondaryToolbarController__updateSecondaryToolbarLayout__block_invoke(uint64_t a1, void *a2, CGRectEdge a3)
{
  id v5 = a2;
  if (v5)
  {
    if (*(unsigned char *)(a1 + 112)) {
      PXRectEdgeFlippedHorizontally();
    }
    objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    memset(&slice, 0, sizeof(slice));
    memset(&v7, 0, sizeof(v7));
    CGRectDivide(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), &slice, &v7, v6, a3);
    CGRectGetMidX(slice);
    CGRectGetMidY(*(CGRect *)(a1 + 80));
    PXRectWithCenterAndSize();
  }
}

- (UIEdgeInsets)containerViewAdditionalEdgeInsetsWhenVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PXSecondaryToolbarController *)self updater];
  [v5 updateIfNeeded];

  double v6 = *MEMORY[0x1E4FB2848];
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (![(PXSecondaryToolbarController *)self isAtTop] && v3)
  {
    [(PXSecondaryToolbarController *)self padding];
    double v11 = v10;
    double v13 = v12;
    [(PXSecondaryToolbarController *)self height];
    double v9 = v13 + v14 + v11;
  }
  double v15 = v6;
  double v16 = v7;
  double v17 = v9;
  double v18 = v8;
  result.double right = v18;
  result.double bottom = v17;
  result.double left = v16;
  result.double top = v15;
  return result;
}

- (BOOL)isAtTop
{
  return self->_isAtTop;
}

- (void)_invalidateContentLayout
{
  id v2 = [(PXSecondaryToolbarController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateContentLayout];
}

- (BOOL)stretched
{
  return self->_stretched;
}

- (void)_updateContentLayout
{
  [(PXSecondaryToolbarController *)self contentView];
  objc_claimAutoreleasedReturnValue();
  BOOL v3 = [(PXSecondaryToolbarController *)self secondaryToolbar];
  [v3 bounds];

  PXRectGetCenter();
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)_invalidateAccessoryViewsLayout
{
  id v2 = [(PXSecondaryToolbarController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAccessoryViewsLayout];
}

- (void)updateIfNeeded
{
  if (self->_willUpdate)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PXSecondaryToolbarController.m", 136, @"Invalid parameter not satisfying: %@", @"!_willUpdate" object file lineNumber description];
  }
  self->_willUpdate = 1;
  [(PXSecondaryToolbarController *)self invalidateSecondaryToolbarLayout];
  self->_willUpdate = 0;
  id v5 = [(PXSecondaryToolbarController *)self updater];
  [v5 updateIfNeeded];
}

- (void)invalidateSecondaryToolbarLayout
{
  id v2 = [(PXSecondaryToolbarController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSecondaryToolbarLayout];
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    [(PXSecondaryToolbarController *)self invalidateViewOpacity];
  }
}

- (void)setLegibilityGradientEnabled:(BOOL)a3
{
  if (self->_legibilityGradientEnabled != a3)
  {
    self->_legibilityGradientEnabled = a3;
    [(PXSecondaryToolbarController *)self _updateLegibilityGradient];
  }
}

- (void)setContentView:(id)a3
{
  id v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    double v8 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    if (self->_contentView)
    {
      double v7 = [(PXSecondaryToolbarController *)self secondaryToolbar];
      [v7 addSubview:self->_contentView];
    }
    [(PXSecondaryToolbarController *)self _invalidateContentLayout];
    [(PXSecondaryToolbarController *)self invalidateSecondaryToolbarLayout];
    id v5 = v8;
  }
}

- (void)setContentScrollViewController:(id)a3
{
  id v5 = (PXScrollViewController *)a3;
  contentScrollViewController = self->_contentScrollViewController;
  if (contentScrollViewController != v5)
  {
    double v7 = v5;
    [(PXScrollViewController *)contentScrollViewController unregisterObserver:self];
    objc_storeStrong((id *)&self->_contentScrollViewController, a3);
    [(PXScrollViewController *)self->_contentScrollViewController registerObserver:self];
    [(PXSecondaryToolbarController *)self _updateLegibilityGradient];
    id v5 = v7;
  }
}

- (UIEdgeInsets)containerViewAdditionalEdgeInsets
{
  BOOL v3 = [(PXSecondaryToolbarController *)self isSecondaryToolbarVisible];
  [(PXSecondaryToolbarController *)self containerViewAdditionalEdgeInsetsWhenVisible:v3];
  result.double right = v7;
  result.double bottom = v6;
  result.double left = v5;
  result.double top = v4;
  return result;
}

- (BOOL)isSecondaryToolbarVisible
{
  BOOL v3 = [(PXSecondaryToolbarController *)self secondaryToolbar];
  [v3 alpha];
  BOOL v8 = v4 > 0.0
    && ([v3 isHidden] & 1) == 0
    && ([(PXSecondaryToolbarController *)self contentView],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5)
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_styleGuideProvider),
        char v7 = [WeakRetained secondaryToolbarControllerToolbarRenderedExternally:self],
        WeakRetained,
        (v7 & 1) != 0)
    || [(PXSecondaryToolbarController *)self shouldAlwaysBeConsideredVisibleForLayoutPurpose];

  return v8;
}

- (void)_invalidateLegibilityGradient
{
  if (!self->_hasScheduledGradientUpdate)
  {
    self->_hasScheduledGradientUpdate = 1;
    objc_initWeak(&location, self);
    objc_copyWeak(&v2, &location);
    px_perform_on_main_runloop();
  }
}

- (void)_updatePositioning
{
  p_styleGuideProvider = &self->_styleGuideProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleGuideProvider);
  [WeakRetained secondaryToolbarControllerToolbarSize:self];
  double v7 = v6;

  id v8 = objc_loadWeakRetained((id *)p_styleGuideProvider);
  uint64_t v9 = [v8 secondaryToolbarControllerToolbarPlacement:self];

  if (v9 == 1)
  {
    uint64_t v10 = 1;
LABEL_6:
    id v11 = objc_loadWeakRetained((id *)p_styleGuideProvider);
    [v11 secondaryToolbarControllerToolbarPadding:self];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    uint64_t v20 = 0;
    goto LABEL_8;
  }
  if (v9 != 3)
  {
    if (!v9)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"PXSecondaryToolbarController.m" lineNumber:272 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = 0;
  double v13 = *(double *)off_1E5DAAF10;
  double v15 = *((double *)off_1E5DAAF10 + 1);
  double v17 = *((double *)off_1E5DAAF10 + 2);
  double v19 = *((double *)off_1E5DAAF10 + 3);
  uint64_t v20 = 1;
LABEL_8:
  [(PXSecondaryToolbarController *)self setIsAtTop:v20];
  [(PXSecondaryToolbarController *)self setStretched:v10];
  [(PXSecondaryToolbarController *)self setHeight:v7];
  -[PXSecondaryToolbarController setPadding:](self, "setPadding:", v13, v15, v17, v19);
}

- (void)setStretched:(BOOL)a3
{
  if (self->_stretched != a3)
  {
    self->_stretched = a3;
    [(PXSecondaryToolbarController *)self invalidateSecondaryToolbarLayout];
  }
}

- (void)setIsAtTop:(BOOL)a3
{
  if (self->_isAtTop != a3)
  {
    self->_isAtTop = a3;
    [(PXSecondaryToolbarController *)self invalidateSecondaryToolbarLayout];
  }
}

- (void)setHeight:(double)a3
{
  if (self->_height != a3)
  {
    self->_height = a3;
    [(PXSecondaryToolbarController *)self invalidateSecondaryToolbarLayout];
  }
}

void __61__PXSecondaryToolbarController__invalidateLegibilityGradient__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleScheduledLegibilityGradientUpdate];
}

- (void)_updateLegibilityGradient
{
  BOOL v3 = [(PXSecondaryToolbarController *)self contentScrollViewController];
  [v3 constrainedVisibleRect];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 contentBounds];
  v46.origin.x = v12;
  v46.origin.y = v13;
  v46.size.width = v14;
  v46.size.height = v15;
  v45.origin.x = v5;
  v45.origin.y = v7;
  v45.size.width = v9;
  v45.size.height = v11;
  BOOL v16 = CGRectContainsRect(v45, v46);
  double v17 = [v3 scrollView];
  objc_msgSend(v17, "px_scrollDistanceFromEdge:", 3);
  double v19 = v18;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleGuideProvider);
  [WeakRetained secondaryToolbarControllerScrollableContentPadding:self];
  double v22 = v21;

  if ([(PXSecondaryToolbarController *)self legibilityGradientEnabled]
    && !v16
    && ([(PXSecondaryToolbarController *)self padding], v19 >= v22 + v23))
  {
    if (![(PXSecondaryToolbarController *)self isShowingGradient])
    {
      [(PXSecondaryToolbarController *)self setIsShowingGradient:1];
      if (!self->_gradientView)
      {
        id v26 = objc_alloc(MEMORY[0x1E4FB1838]);
        v27 = (UIView *)objc_msgSend(v26, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v28 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"PXSecondaryToolbarGradient");
        v29 = objc_msgSend(v28, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 0.0, 1.0, 0.0);

        [(UIView *)v27 setImage:v29];
        [(UIView *)v27 setAlpha:0.0];
        gradientView = self->_gradientView;
        self->_gradientView = v27;
        v31 = v27;

        v32 = [(PXSecondaryToolbarController *)self legibilityContainerView];
        [v32 addSubview:self->_gradientView];

        v33 = [(PXSecondaryToolbarController *)self containerView];
        v34 = [(PXSecondaryToolbarController *)self toolbarContainerView];
        [v33 bringSubviewToFront:v34];
      }
      v24 = (void *)MEMORY[0x1E4FB1EB0];
      uint64_t v40 = MEMORY[0x1E4F143A8];
      uint64_t v41 = 3221225472;
      v42 = __57__PXSecondaryToolbarController__updateLegibilityGradient__block_invoke;
      v43 = &unk_1E5DD36F8;
      v44 = self;
      v25 = &v40;
      goto LABEL_10;
    }
  }
  else if ([(PXSecondaryToolbarController *)self isShowingGradient])
  {
    [(PXSecondaryToolbarController *)self setIsShowingGradient:0];
    v24 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __57__PXSecondaryToolbarController__updateLegibilityGradient__block_invoke_2;
    v38 = &unk_1E5DD36F8;
    v39 = self;
    v25 = &v35;
LABEL_10:
    objc_msgSend(v24, "animateWithDuration:delay:options:animations:completion:", 4, v25, 0, 0.2, 0.0, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44);
    [(PXSecondaryToolbarController *)self invalidateSecondaryToolbarLayout];
  }
}

- (BOOL)legibilityGradientEnabled
{
  return self->_legibilityGradientEnabled;
}

- (BOOL)isShowingGradient
{
  return self->_isShowingGradient;
}

- (PXScrollViewController)contentScrollViewController
{
  return self->_contentScrollViewController;
}

- (void)_handleScheduledLegibilityGradientUpdate
{
  self->_hasScheduledGradientUpdate = 0;
  [(PXSecondaryToolbarController *)self _updateLegibilityGradient];
}

- (void)setNeedsUpdate
{
  if (!self->_willUpdate)
  {
    BOOL v3 = [(PXSecondaryToolbarController *)self containerView];
    [v3 setNeedsLayout];

    id v4 = [(PXSecondaryToolbarController *)self updateDelegate];
    [v4 secondaryToolbarControllerSetNeedsUpdate:self];
  }
}

- (PXSecondaryToolbarControllerUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  return (PXSecondaryToolbarControllerUpdateDelegate *)WeakRetained;
}

- (void)_replaceAccessoryView:(id)a3 with:(id)a4
{
  id v7 = a4;
  [a3 removeFromSuperview];
  if (v7)
  {
    double v6 = [(PXSecondaryToolbarController *)self toolbarContainerView];
    [v6 addSubview:v7];

    objc_msgSend(v7, "setHitTestDirectionalInsets:", -20.0, -20.0, -20.0, -20.0);
  }
  [(PXSecondaryToolbarController *)self invalidatePositioning];
  [(PXSecondaryToolbarController *)self invalidateSecondaryToolbarLayout];
  [(PXSecondaryToolbarController *)self invalidateViewOpacity];
}

- (void)invalidateViewOpacity
{
  id v2 = [(PXSecondaryToolbarController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateViewOpacity];
}

- (void)invalidatePositioning
{
  id v2 = [(PXSecondaryToolbarController *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePositioning];
}

- (PXSecondaryToolbarController)initWithContainerView:(id)a3 styleGuideProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXSecondaryToolbarController;
  CGFloat v9 = [(PXSecondaryToolbarController *)&v18 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_containerView, a3);
    objc_storeStrong((id *)&v10->_legibilityContainerView, a3);
    CGFloat v11 = objc_alloc_init(PXHitTestTransparentView);
    toolbarContainerView = v10->_toolbarContainerView;
    v10->_toolbarContainerView = &v11->super;

    [(UIView *)v10->_containerView addSubview:v10->_toolbarContainerView];
    objc_storeWeak((id *)&v10->_styleGuideProvider, v8);
    v10->_alpha = 1.0;
    uint64_t v13 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v10 needsUpdateSelector:sel_setNeedsUpdate];
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v13;

    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updatePositioning needsUpdate:1];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateSecondaryToolbarLayout needsUpdate:1];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateContentLayout needsUpdate:1];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateAccessoryViewsLayout needsUpdate:1];
    [(PXUpdater *)v10->_updater addUpdateSelector:sel__updateViewOpacity needsUpdate:1];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    secondaryToolbar = v10->_secondaryToolbar;
    v10->_secondaryToolbar = (UIView *)v15;

    [(UIView *)v10->_toolbarContainerView addSubview:v10->_secondaryToolbar];
  }

  return v10;
}

- (void)setLeadingAccessoryView:(id)a3
{
  CGFloat v5 = (UIView *)a3;
  leadingAccessoryView = self->_leadingAccessoryView;
  if (leadingAccessoryView != v5)
  {
    double v10 = v5;
    [(PXSecondaryToolbarController *)self _replaceAccessoryView:leadingAccessoryView with:v5];
    objc_storeStrong((id *)&self->_leadingAccessoryView, a3);
    id v7 = (void *)MEMORY[0x1E4FB1810];
    id v8 = [MEMORY[0x1E4FB1C20] capsuleShape];
    CGFloat v9 = [v7 styleWithShape:v8];
    [(UIView *)self->_leadingAccessoryView setHoverStyle:v9];

    CGFloat v5 = v10;
  }
}

- (void)setTrailingAccessoryView:(id)a3
{
  CGFloat v5 = (UIView *)a3;
  trailingAccessoryView = self->_trailingAccessoryView;
  if (trailingAccessoryView != v5)
  {
    double v10 = v5;
    [(PXSecondaryToolbarController *)self _replaceAccessoryView:trailingAccessoryView with:v5];
    objc_storeStrong((id *)&self->_trailingAccessoryView, a3);
    id v7 = (void *)MEMORY[0x1E4FB1810];
    id v8 = [MEMORY[0x1E4FB1C20] capsuleShape];
    CGFloat v9 = [v7 styleWithShape:v8];
    [(UIView *)self->_trailingAccessoryView setHoverStyle:v9];

    CGFloat v5 = v10;
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
}

- (void)setUpdateDelegate:(id)a3
{
}

- (void)setLegibilityContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryToolbar, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_contentScrollViewController, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_storeStrong((id *)&self->_trailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_toolbarContainerView, 0);
  objc_storeStrong((id *)&self->_legibilityContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_destroyWeak((id *)&self->_styleGuideProvider);
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void)setActionHandler:(id)a3
{
}

- (PXSecondaryToolbarActionHandler)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);
  return (PXSecondaryToolbarActionHandler *)WeakRetained;
}

- (void)setShouldAlwaysBeConsideredVisibleForLayoutPurpose:(BOOL)a3
{
  self->_shouldAlwaysBeConsideredVisibleForLayoutPurpose = a3;
}

- (BOOL)shouldAlwaysBeConsideredVisibleForLayoutPurpose
{
  return self->_shouldAlwaysBeConsideredVisibleForLayoutPurpose;
}

- (UIView)legibilityContainerView
{
  return self->_legibilityContainerView;
}

uint64_t __57__PXSecondaryToolbarController__updateLegibilityGradient__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:0.5];
}

uint64_t __57__PXSecondaryToolbarController__updateLegibilityGradient__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:0.0];
}

- (void)setBackdropGroupName:(id)a3
{
  id v8 = (NSString *)a3;
  id v4 = self->_backdropGroupName;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSString *)[(NSString *)v8 copy];
      backdropGroupName = self->_backdropGroupName;
      self->_backdropGroupName = v6;

      [(PXSecondaryToolbarController *)self backdropGroupNameDidChange];
    }
  }
}

- (void)setIsShowingGradient:(BOOL)a3
{
  if (self->_isShowingGradient != a3)
  {
    self->_isShowingGradient = a3;
    [(PXSecondaryToolbarController *)self isShowingGradientDidChange];
  }
}

- (void)removeFromContainerView
{
  BOOL v3 = [(PXSecondaryToolbarController *)self toolbarContainerView];
  [v3 removeFromSuperview];

  [(UIView *)self->_gradientView removeFromSuperview];
  gradientView = self->_gradientView;
  self->_gradientView = 0;
}

- (PXSecondaryToolbarController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSecondaryToolbarController.m", 42, @"%s is not available as initializer", "-[PXSecondaryToolbarController init]");

  abort();
}

@end