@interface SBFluidSwitcherSpaceOverlayAccessoryView
- (BOOL)drawsFocusIndicator;
- (BOOL)drawsFooter;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)uniqueIconsOnly;
- (BOOL)wantsPointerInteractions;
- (CGPoint)contentViewOffset;
- (NSArray)titleItems;
- (SBFluidSwitcherSpaceOverlayAccessoryView)initWithDelegate:(id)a3;
- (SBFluidSwitcherSpaceOverlayAccessoryViewDelegate)delegate;
- (SBHomeGrabberRotationView)homeGrabberView;
- (SBSwitcherShelfViewController)shelfViewController;
- (double)_inverseContentScale;
- (double)contentScale;
- (double)contentViewScale;
- (double)cornerRadius;
- (double)iconHitTestOutset;
- (double)titleAndIconOpacity;
- (double)titleOpacity;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)footerStyle;
- (unint64_t)iconAlignment;
- (unint64_t)maskedCorners;
- (unint64_t)multiWindowIndicatorRoleMask;
- (void)_configureDebugBorder;
- (void)_updateContentViewLayout;
- (void)_updateFocusIndicator;
- (void)_updateFooterAnimated:(BOOL)a3;
- (void)_updateFooterVisibility;
- (void)configureOverlayForIconZoomWithView:(id)a3 crossfadeViews:(id)a4;
- (void)dealloc;
- (void)itemContainerFooterView:(id)a3 didSelectTitleItem:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)removeIconOverlay;
- (void)setContentScale:(double)a3;
- (void)setContentViewOffset:(CGPoint)a3;
- (void)setContentViewScale:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDrawsFocusIndicator:(BOOL)a3;
- (void)setDrawsFooter:(BOOL)a3;
- (void)setFooterStyle:(unint64_t)a3;
- (void)setHomeGrabberView:(id)a3;
- (void)setIconAlignment:(unint64_t)a3;
- (void)setIconHitTestOutset:(double)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setMultiWindowIndicatorRoleMask:(unint64_t)a3;
- (void)setShelfViewController:(id)a3;
- (void)setTitleAndIconOpacity:(double)a3;
- (void)setTitleItems:(id)a3;
- (void)setTitleItems:(id)a3 animated:(BOOL)a4;
- (void)setTitleOpacity:(double)a3;
- (void)setUniqueIconsOnly:(BOOL)a3;
- (void)setWantsPointerInteractions:(BOOL)a3;
@end

@implementation SBFluidSwitcherSpaceOverlayAccessoryView

- (void)setWantsPointerInteractions:(BOOL)a3
{
  self->_wantsPointerInteractions = a3;
  -[SBFluidSwitcherItemContainerFooterView setWantsIconPointerInteractions:](self->_footerView, "setWantsIconPointerInteractions:");
}

- (void)setIconHitTestOutset:(double)a3
{
  self->_iconHitTestOutset = a3;
  -[SBFluidSwitcherItemContainerFooterView setIconHitTestOutset:](self->_footerView, "setIconHitTestOutset:");
}

- (void)setDrawsFooter:(BOOL)a3
{
  if (self->_drawsFooter != a3)
  {
    self->_drawsFooter = a3;
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self _updateFooterVisibility];
  }
}

- (void)setDrawsFocusIndicator:(BOOL)a3
{
  if (self->_drawsFocusIndicator != a3)
  {
    self->_drawsFocusIndicator = a3;
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self _updateFocusIndicator];
  }
}

- (void)setHomeGrabberView:(id)a3
{
  v5 = (SBHomeGrabberRotationView *)a3;
  homeGrabberView = self->_homeGrabberView;
  if (homeGrabberView != v5)
  {
    if (homeGrabberView) {
      [(SBHomeGrabberRotationView *)homeGrabberView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_homeGrabberView, a3);
    if (self->_homeGrabberView) {
      -[SBFTouchPassThroughView addSubview:](self->_contentView, "addSubview:");
    }
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self setNeedsLayout];
    if ([MEMORY[0x1E4F42FF0] _isInRetargetableAnimationBlock])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __63__SBFluidSwitcherSpaceOverlayAccessoryView_setHomeGrabberView___block_invoke;
      v7[3] = &unk_1E6AF4AC0;
      v7[4] = self;
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v7];
    }
    else
    {
      [(SBFluidSwitcherSpaceOverlayAccessoryView *)self layoutIfNeeded];
    }
  }
}

- (void)setMaskedCorners:(unint64_t)a3
{
  self->_maskedCorners = a3;
}

- (void)setTitleOpacity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_titleOpacity = a3;
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self _updateFooterAnimated:1];
  }
}

- (void)setContentViewOffset:(CGPoint)a3
{
  if (a3.x != self->_contentViewOffset.x || a3.y != self->_contentViewOffset.y)
  {
    self->_contentViewOffset = a3;
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self _updateContentViewLayout];
  }
}

- (SBHomeGrabberRotationView)homeGrabberView
{
  return self->_homeGrabberView;
}

- (void)setUniqueIconsOnly:(BOOL)a3
{
  self->_uniqueIconsOnly = a3;
  -[SBFluidSwitcherItemContainerFooterView setUniqueIconsOnly:](self->_footerView, "setUniqueIconsOnly:");
}

- (void)setIconAlignment:(unint64_t)a3
{
  self->_iconAlignment = a3;
  -[SBFluidSwitcherItemContainerFooterView setIconAlignment:](self->_footerView, "setIconAlignment:");
}

- (void)setFooterStyle:(unint64_t)a3
{
  if (self->_footerStyle != a3)
  {
    self->_footerStyle = a3;
    -[SBFluidSwitcherItemContainerFooterView setFooterStyle:](self->_footerView, "setFooterStyle:");
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self setNeedsLayout];
  }
}

- (void)setContentScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentScale = a3;
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  [(SBFTouchPassThroughClippingView *)&v26 layoutSubviews];
  [(SBFluidSwitcherSpaceOverlayAccessoryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SBFluidSwitcherSpaceOverlayAccessoryView *)self traitCollection];
  [v11 displayScale];

  [(SBFluidSwitcherSpaceOverlayAccessoryView *)self _updateContentViewLayout];
  homeGrabberView = self->_homeGrabberView;
  if (homeGrabberView) {
    -[SBHomeGrabberRotationView setFrame:](homeGrabberView, "setFrame:", v4, v6, v8, v10);
  }
  focusIndicatorLayer = self->_focusIndicatorLayer;
  if (focusIndicatorLayer)
  {
    -[CAShapeLayer setFrame:](focusIndicatorLayer, "setFrame:", v4, v6, v8, v10);
    v14 = self->_focusIndicatorLayer;
    objc_msgSend(MEMORY[0x1E4F427D0], "_bezierPathWithPillRect:cornerRadius:", v4, v6, v8, v10, self->_cornerRadius);
    id v15 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](v14, "setPath:", [v15 CGPath]);
  }
  if (self->_footerView)
  {
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self _inverseContentScale];
    CGFloat v17 = v16;
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    CGRectGetWidth(v27);
    [(SBFluidSwitcherItemContainerFooterView *)self->_footerView intrinsicContentSize];
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    CGRectGetMidX(v28);
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    CGRectGetMaxY(v29);
    UIRectIntegralWithScale();
    -[SBFluidSwitcherItemContainerFooterView sb_setBoundsAndPositionFromFrame:](self->_footerView, "sb_setBoundsAndPositionFromFrame:");
    footerView = self->_footerView;
    CGAffineTransformMakeScale(&v25, v17, v17);
    [(SBFluidSwitcherItemContainerFooterView *)footerView setTransform:&v25];
  }
  iconOverlayView = self->_iconOverlayView;
  if (iconOverlayView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained overlayAccessoryViewFrameForIconOverlayView:self fullPresented:0];
    -[BSUIOrientationTransformWrapperView setFrame:](iconOverlayView, "setFrame:");

    v21 = self->_iconOverlayView;
    if (v21) {
      [(SBFluidSwitcherIconOverlayView *)v21 setCornerRadius:self->_cornerRadius];
    }
  }
  if (self->_footerView) {
    -[SBFTouchPassThroughView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
  }
  shelfViewController = self->_shelfViewController;
  if (shelfViewController)
  {
    contentView = self->_contentView;
    v24 = [(SBSwitcherShelfViewController *)shelfViewController view];
    [(SBFTouchPassThroughView *)contentView bringSubviewToFront:v24];
  }
  if (self->_homeGrabberView) {
    -[SBFTouchPassThroughView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
  }
  if (self->_iconOverlayView) {
    -[SBFTouchPassThroughView bringSubviewToFront:](self->_contentView, "bringSubviewToFront:");
  }
}

- (void)_updateContentViewLayout
{
  [(SBFluidSwitcherSpaceOverlayAccessoryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  UIRectGetCenter();
  double v12 = v11 + self->_contentViewOffset.x;
  double v14 = v13 + self->_contentViewOffset.y;
  -[SBFTouchPassThroughView setBounds:](self->_contentView, "setBounds:", v4, v6, v8, v10);
  contentView = self->_contentView;
  -[SBFTouchPassThroughView setCenter:](contentView, "setCenter:", v12, v14);
}

- (void)setTitleAndIconOpacity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_titleAndIconOpacity = a3;
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self _updateFooterAnimated:1];
  }
}

- (void)setCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  -[SBFTouchPassThroughClippingView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerRadius = a3;
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self setNeedsLayout];
  }
}

- (void)configureOverlayForIconZoomWithView:(id)a3 crossfadeViews:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  double v7 = [(SBFluidSwitcherSpaceOverlayAccessoryView *)self delegate];
  BOOL v8 = 1;
  [v7 overlayAccessoryViewFrameForIconOverlayView:self fullPresented:1];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [v7 overlayAccessoryViewHomeScreenInterfaceOrientation:self];
  uint64_t v18 = [v7 overlayAccessoryViewSwitcherInterfaceOrientation:self];
  v19 = [(SBFluidSwitcherIconOverlayView *)self->_iconOverlayView iconView];
  int v20 = [v19 hasSameOriginatingIconAsForIconZoomingView:v26];

  iconOverlayView = self->_iconOverlayView;
  if (!iconOverlayView) {
    int v20 = 0;
  }
  [(SBFluidSwitcherIconOverlayView *)iconOverlayView crossfadeViewFrame];
  v29.origin.x = v10;
  v29.origin.y = v12;
  v29.size.width = v14;
  v29.size.height = v16;
  BOOL v22 = CGRectEqualToRect(v28, v29);
  if ([(BSUIOrientationTransformWrapperView *)self->_iconOverlayView contentOrientation] == v17) {
    BOOL v8 = [(BSUIOrientationTransformWrapperView *)self->_iconOverlayView containerOrientation] != v18;
  }
  if (v26 && (v20 & v22 ^ 1 | v8) == 1)
  {
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self removeIconOverlay];
    v23 = -[SBFluidSwitcherIconOverlayView initWithIconView:crossfadeViews:crossfadeViewFrame:contentOrientation:containerOrientation:]([SBFluidSwitcherIconOverlayView alloc], "initWithIconView:crossfadeViews:crossfadeViewFrame:contentOrientation:containerOrientation:", v26, v6, v17, v18, v10, v12, v14, v16);
    v24 = self->_iconOverlayView;
    self->_iconOverlayView = v23;

    [(SBFTouchPassThroughView *)self->_contentView addSubview:self->_iconOverlayView];
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self setNeedsLayout];
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self layoutIfNeeded];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained overlayAccessoryView:self didUpdateShowingIconOverlay:1];
  }
}

- (void)removeIconOverlay
{
  iconOverlayView = self->_iconOverlayView;
  if (iconOverlayView)
  {
    [(SBFluidSwitcherIconOverlayView *)iconOverlayView invalidate];
    [(SBFluidSwitcherIconOverlayView *)self->_iconOverlayView removeFromSuperview];
    double v4 = self->_iconOverlayView;
    self->_iconOverlayView = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained overlayAccessoryView:self didUpdateShowingIconOverlay:0];
  }
}

- (SBFluidSwitcherSpaceOverlayAccessoryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherSpaceOverlayAccessoryViewDelegate *)WeakRetained;
}

- (void)setTitleItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSArray *)a3;
  titleItems = self->_titleItems;
  if (titleItems != v6)
  {
    double v11 = v6;
    char v8 = [(NSArray *)titleItems isEqual:v6];
    id v6 = v11;
    if ((v8 & 1) == 0)
    {
      double v9 = (NSArray *)[(NSArray *)v11 copy];
      double v10 = self->_titleItems;
      self->_titleItems = v9;

      [(SBFluidSwitcherSpaceOverlayAccessoryView *)self _updateFooterAnimated:v4];
      id v6 = v11;
    }
  }
}

- (SBFluidSwitcherSpaceOverlayAccessoryView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v9 = -[SBFTouchPassThroughClippingView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  double v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v4);
    uint64_t v11 = +[SBAppSwitcherDomain rootSettings];
    settings = v10->_settings;
    v10->_settings = (SBAppSwitcherSettings *)v11;

    v10->_titleAndIconOpacity = 1.0;
    v10->_titleOpacity = 1.0;
    v10->_contentViewScale = 1.0;
    v10->_footerStyle = 0;
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v5, v6, v7, v8);
    contentView = v10->_contentView;
    v10->_contentView = (SBFTouchPassThroughView *)v13;

    double v15 = v10->_contentView;
    double v16 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBFTouchPassThroughView *)v15 setBackgroundColor:v16];

    [(SBFTouchPassThroughClippingView *)v10 addSubview:v10->_contentView];
  }

  return v10;
}

- (void)dealloc
{
  [(SBFluidSwitcherSpaceOverlayAccessoryView *)self prepareForReuse];
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  [(SBFluidSwitcherSpaceOverlayAccessoryView *)&v3 dealloc];
}

- (void)setTitleItems:(id)a3
{
}

uint64_t __63__SBFluidSwitcherSpaceOverlayAccessoryView_setHomeGrabberView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setShelfViewController:(id)a3
{
  double v5 = (SBSwitcherShelfViewController *)a3;
  shelfViewController = self->_shelfViewController;
  if (shelfViewController != v5)
  {
    double v12 = v5;
    double v7 = shelfViewController;
    double v8 = v7;
    if (v7)
    {
      double v9 = [(SBSwitcherShelfViewController *)v7 view];
      [v9 removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_shelfViewController, a3);
    contentView = self->_contentView;
    uint64_t v11 = [(SBSwitcherShelfViewController *)self->_shelfViewController view];
    [(SBFTouchPassThroughView *)contentView addSubview:v11];

    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self setNeedsLayout];
    double v5 = v12;
  }
}

- (void)setContentViewScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentViewScale = a3;
    contentView = self->_contentView;
    CGAffineTransformMakeScale(&v6, a3, a3);
    [(SBFTouchPassThroughView *)contentView setTransform:&v6];
  }
}

- (void)prepareForReuse
{
  homeGrabberView = self->_homeGrabberView;
  if (homeGrabberView)
  {
    [(SBHomeGrabberRotationView *)homeGrabberView removeFromSuperview];
    id v4 = self->_homeGrabberView;
    self->_homeGrabberView = 0;
  }
  shelfViewController = self->_shelfViewController;
  if (shelfViewController)
  {
    CGAffineTransform v6 = [(SBSwitcherShelfViewController *)shelfViewController view];
    [v6 removeFromSuperview];

    double v7 = self->_shelfViewController;
    self->_shelfViewController = 0;
  }
  if (self->_footerView)
  {
    self->_drawsFooter = 0;
    [(SBFluidSwitcherItemContainerFooterView *)self->_footerView removeFromSuperview];
    footerView = self->_footerView;
    self->_footerView = 0;
  }
  if (self->_iconOverlayView) {
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self removeIconOverlay];
  }
  if (self->_wantsPointerInteractions)
  {
    [(SBFluidSwitcherSpaceOverlayAccessoryView *)self setWantsPointerInteractions:0];
  }
}

- (void)itemContainerFooterView:(id)a3 didSelectTitleItem:(id)a4
{
  NSUInteger v5 = [(NSArray *)self->_titleItems indexOfObject:a4];
  switch(v5)
  {
    case 0uLL:
      goto LABEL_4;
    case 1uLL:
      CGAffineTransform v6 = &SBLayoutRoleSide;
      goto LABEL_6;
    case 0x7FFFFFFFFFFFFFFFuLL:
LABEL_4:
      CGAffineTransform v6 = &SBLayoutRolePrimary;
LABEL_6:
      uint64_t v7 = *v6;
      goto LABEL_8;
  }
  uint64_t v7 = v5 + 3;
LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained overlayAccessoryView:self didSelectHeaderForRole:v7];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  if (-[SBFluidSwitcherSpaceOverlayAccessoryView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y))
  {
    char v8 = 1;
  }
  else
  {
    footerView = self->_footerView;
    if (footerView
      && ([(SBFluidSwitcherItemContainerFooterView *)footerView alpha], BSFloatGreaterThanFloat()))
    {
      double v10 = self->_footerView;
      -[SBFluidSwitcherSpaceOverlayAccessoryView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
      char v8 = -[SBFluidSwitcherItemContainerFooterView pointInside:withEvent:](v10, "pointInside:withEvent:", v7);
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBFluidSwitcherSpaceOverlayAccessoryView;
  char v8 = -[SBFTouchPassThroughView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  if (v8
    || (footerView = self->_footerView) != 0
    && ([(SBFluidSwitcherItemContainerFooterView *)footerView alpha], BSFloatGreaterThanFloat())
    && (uint64_t v11 = self->_footerView,
        -[SBFluidSwitcherSpaceOverlayAccessoryView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y),
        -[SBFTouchPassThroughView hitTest:withEvent:](v11, "hitTest:withEvent:", v7),
        (char v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_updateFocusIndicator
{
  BOOL drawsFocusIndicator = self->_drawsFocusIndicator;
  focusIndicatorLayer = self->_focusIndicatorLayer;
  [(SBFluidSwitcherSpaceOverlayAccessoryView *)self _inverseContentScale];
  double v6 = v5;
  int IsZero = BSFloatIsZero();
  double v8 = v6 + v6;
  double v9 = 0.0;
  if (IsZero) {
    double v10 = 0.0;
  }
  else {
    double v10 = v8;
  }
  id v11 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v12 = [v11 CGColor];

  if (drawsFocusIndicator)
  {
    if (!focusIndicatorLayer)
    {
      [(SBFluidSwitcherSpaceOverlayAccessoryView *)self bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      BOOL v22 = self->_focusIndicatorLayer;
      self->_focusIndicatorLayer = v21;

      [(CAShapeLayer *)self->_focusIndicatorLayer setFillColor:v12];
      -[CAShapeLayer setFrame:](self->_focusIndicatorLayer, "setFrame:", v14, v16, v18, v20);
      [(CAShapeLayer *)self->_focusIndicatorLayer setLineWidth:0.0];
      v23 = self->_focusIndicatorLayer;
      objc_msgSend(MEMORY[0x1E4F427D0], "_bezierPathWithPillRect:cornerRadius:", v14, v16, v18, v20, self->_cornerRadius);
      id v24 = objc_claimAutoreleasedReturnValue();
      -[CAShapeLayer setPath:](v23, "setPath:", [v24 CGPath]);

      CGAffineTransform v25 = self->_focusIndicatorLayer;
      id v26 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      -[CAShapeLayer setStrokeColor:](v25, "setStrokeColor:", [v26 CGColor]);

      CGRect v27 = [(SBFTouchPassThroughView *)self->_contentView layer];
      [v27 addSublayer:self->_focusIndicatorLayer];

      [(SBFluidSwitcherSpaceOverlayAccessoryView *)self setNeedsLayout];
    }
    double v9 = v10;
  }
  CGRect v28 = self->_focusIndicatorLayer;
  [(CAShapeLayer *)v28 setLineWidth:v9];
}

- (void)_updateFooterVisibility
{
  BOOL v3 = ![(SBAppSwitcherSettings *)self->_settings shouldSimplifyForOptions:8]
    && self->_drawsFooter;
  footerView = self->_footerView;
  if (v3 || !footerView)
  {
    if (footerView) {
      BOOL v3 = 0;
    }
    if (v3)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __67__SBFluidSwitcherSpaceOverlayAccessoryView__updateFooterVisibility__block_invoke;
      v6[3] = &unk_1E6AF4AC0;
      v6[4] = self;
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v6];
    }
  }
  else
  {
    [(SBFluidSwitcherItemContainerFooterView *)footerView removeFromSuperview];
    double v5 = self->_footerView;
    self->_footerView = 0;
  }
}

uint64_t __67__SBFluidSwitcherSpaceOverlayAccessoryView__updateFooterVisibility__block_invoke(uint64_t a1)
{
  v2 = [SBFluidSwitcherItemContainerFooterView alloc];
  uint64_t v3 = -[SBFluidSwitcherItemContainerFooterView initWithFrame:delegate:](v2, "initWithFrame:delegate:", *(void *)(a1 + 32), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 480);
  *(void *)(v4 + 480) = v3;

  [*(id *)(*(void *)(a1 + 32) + 480) setIconAlignment:*(void *)(*(void *)(a1 + 32) + 568)];
  [*(id *)(*(void *)(a1 + 32) + 480) setFooterStyle:*(void *)(*(void *)(a1 + 32) + 592)];
  [*(id *)(*(void *)(a1 + 32) + 480) setUniqueIconsOnly:*(unsigned __int8 *)(*(void *)(a1 + 32) + 513)];
  double v6 = [*(id *)(*(void *)(a1 + 32) + 480) layer];
  objc_msgSend(v6, "setAnchorPoint:", 0.5, 0.0);

  [*(id *)(*(void *)(a1 + 32) + 464) insertSubview:*(void *)(*(void *)(a1 + 32) + 480) atIndex:0];
  [*(id *)(a1 + 32) _updateFooterAnimated:0];
  [*(id *)(a1 + 32) setNeedsLayout];
  id v7 = *(void **)(a1 + 32);
  return [v7 layoutIfNeeded];
}

- (void)_updateFooterAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBFluidSwitcherItemContainerFooterView *)self->_footerView setAlpha:self->_titleAndIconOpacity];
  [(SBFluidSwitcherItemContainerFooterView *)self->_footerView setTextAlpha:self->_titleOpacity];
  footerView = self->_footerView;
  titleItems = self->_titleItems;
  [(SBFluidSwitcherItemContainerFooterView *)footerView setTitleItems:titleItems animated:v3];
}

- (double)_inverseContentScale
{
  char IsZero = BSFloatIsZero();
  double result = 1.0;
  if ((IsZero & 1) == 0) {
    return 1.0 / self->_contentScale;
  }
  return result;
}

- (void)_configureDebugBorder
{
  v14[7] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F428B8] systemRedColor];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F428B8], "systemBlueColor", v3);
  v14[1] = v4;
  double v5 = [MEMORY[0x1E4F428B8] systemYellowColor];
  v14[2] = v5;
  double v6 = [MEMORY[0x1E4F428B8] systemMintColor];
  v14[3] = v6;
  id v7 = [MEMORY[0x1E4F428B8] systemPurpleColor];
  v14[4] = v7;
  double v8 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  v14[5] = v8;
  double v9 = [MEMORY[0x1E4F428B8] systemIndigoColor];
  v14[6] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:7];

  id v11 = objc_msgSend(v10, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v10, "count"));
  uint64_t v12 = [(SBFluidSwitcherSpaceOverlayAccessoryView *)self layer];
  objc_msgSend(v12, "setBorderColor:", objc_msgSend(v11, "cgColor"));

  double v13 = [(SBFluidSwitcherSpaceOverlayAccessoryView *)self layer];
  [v13 setBorderWidth:8.0];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (BOOL)drawsFocusIndicator
{
  return self->_drawsFocusIndicator;
}

- (BOOL)drawsFooter
{
  return self->_drawsFooter;
}

- (BOOL)uniqueIconsOnly
{
  return self->_uniqueIconsOnly;
}

- (BOOL)wantsPointerInteractions
{
  return self->_wantsPointerInteractions;
}

- (double)iconHitTestOutset
{
  return self->_iconHitTestOutset;
}

- (unint64_t)iconAlignment
{
  return self->_iconAlignment;
}

- (double)titleAndIconOpacity
{
  return self->_titleAndIconOpacity;
}

- (double)titleOpacity
{
  return self->_titleOpacity;
}

- (unint64_t)footerStyle
{
  return self->_footerStyle;
}

- (unint64_t)multiWindowIndicatorRoleMask
{
  return self->_multiWindowIndicatorRoleMask;
}

- (void)setMultiWindowIndicatorRoleMask:(unint64_t)a3
{
  self->_multiWindowIndicatorRoleMask = a3;
}

- (NSArray)titleItems
{
  return self->_titleItems;
}

- (SBSwitcherShelfViewController)shelfViewController
{
  return self->_shelfViewController;
}

- (double)contentViewScale
{
  return self->_contentViewScale;
}

- (CGPoint)contentViewOffset
{
  double x = self->_contentViewOffset.x;
  double y = self->_contentViewOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfViewController, 0);
  objc_storeStrong((id *)&self->_titleItems, 0);
  objc_storeStrong((id *)&self->_homeGrabberView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconOverlayView, 0);
  objc_storeStrong((id *)&self->_focusIndicatorLayer, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end