@interface SBFluidSwitcherSpaceUnderlayAccessoryView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5;
- (CGPoint)contentViewOffset;
- (CGPoint)resizeGrabberCenter;
- (CGRect)resizeGrabberBounds;
- (NSArray)titleItems;
- (SBFluidSwitcherSpaceUnderlayAccessoryView)initWithDelegate:(id)a3 systemPointerInteractionManager:(id)a4;
- (SBFluidSwitcherSpaceUnderlayAccessoryViewDelegate)delegate;
- (UIBezierPath)shadowPath;
- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3;
- (double)backgroundOpacity;
- (double)contentScale;
- (double)contentViewScale;
- (double)cornerRadius;
- (double)headerOpacity;
- (double)keyboardHeight;
- (double)resizeGrabberOpacity;
- (double)shadowAlpha;
- (double)shadowOffset;
- (double)titleOpacity;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)styleForRegion:(id)a3 forView:(id)a4;
- (int64_t)shadowStyle;
- (unint64_t)maskedCorners;
- (void)_configureDebugBorder;
- (void)_updateBackgroundView;
- (void)_updateBackgroundViewVisibility;
- (void)_updateContentView;
- (void)_updateHeaderAnimated:(BOOL)a3;
- (void)_updateResizeGrabber;
- (void)_updateResizeGrabberVisibility;
- (void)_updateShadowView;
- (void)_updateShadowVisibility;
- (void)dealloc;
- (void)itemContainerHeaderView:(id)a3 didSelectTitleItem:(id)a4;
- (void)layoutSubviews;
- (void)setBackgroundOpacity:(double)a3;
- (void)setContentScale:(double)a3;
- (void)setContentViewOffset:(CGPoint)a3;
- (void)setContentViewScale:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setHeaderOpacity:(double)a3 updateMode:(int64_t)a4 settings:(id)a5 completion:(id)a6;
- (void)setKeyboardHeight:(double)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setResizeGrabberBounds:(CGRect)a3;
- (void)setResizeGrabberCenter:(CGPoint)a3;
- (void)setResizeGrabberOpacity:(double)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setShadowOffset:(double)a3;
- (void)setShadowPath:(id)a3;
- (void)setShadowStyle:(int64_t)a3;
- (void)setTitleItems:(id)a3 animated:(BOOL)a4;
- (void)setTitleOpacity:(double)a3;
@end

@implementation SBFluidSwitcherSpaceUnderlayAccessoryView

- (void)setHeaderOpacity:(double)a3 updateMode:(int64_t)a4 settings:(id)a5 completion:(id)a6
{
  id v10 = a5;
  v11 = (void (**)(id, uint64_t, void))a6;
  if (BSFloatEqualToFloat())
  {
    if (v11) {
      v11[2](v11, 1, 0);
    }
  }
  else
  {
    self->_headerOpacity = a3;
    char IsZero = BSFloatIsZero();
    headerView = self->_headerView;
    if (IsZero)
    {
      if (headerView)
      {
        objc_initWeak(&location, self);
        v14 = (void *)MEMORY[0x1E4F42FF0];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_3;
        v18[3] = &unk_1E6AF4AC0;
        v18[4] = self;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_4;
        v15[3] = &unk_1E6AFA798;
        objc_copyWeak(&v17, &location);
        v16 = v11;
        objc_msgSend(v14, "sb_animateWithSettings:mode:animations:completion:", v10, a4, v18, v15);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      if (!headerView)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke;
        v21[3] = &unk_1E6AF4AC0;
        v21[4] = self;
        [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v21];
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_2;
      v20[3] = &unk_1E6AF4AC0;
      v20[4] = self;
      objc_msgSend(MEMORY[0x1E4F42FF0], "sb_animateWithSettings:mode:animations:completion:", v10, a4, v20, v11);
    }
  }
}

- (void)setShadowStyle:(int64_t)a3
{
  if (self->_shadowStyle != a3)
  {
    self->_shadowStyle = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateShadowView];
  }
}

- (void)setShadowOffset:(double)a3
{
  if (self->_shadowOffset != a3)
  {
    self->_shadowOffset = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateShadowView];
  }
}

- (void)setShadowAlpha:(double)a3
{
  if (self->_shadowAlpha != a3)
  {
    self->_shadowAlpha = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateShadowView];
  }
}

- (void)setBackgroundOpacity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_backgroundOpacity = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateBackgroundView];
  }
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateBackgroundView];
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateShadowView];
  }
}

- (void)setTitleOpacity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_titleOpacity = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateHeaderAnimated:0];
  }
}

- (void)setResizeGrabberCenter:(CGPoint)a3
{
  if (a3.x != self->_resizeGrabberCenter.x || a3.y != self->_resizeGrabberCenter.y)
  {
    self->_resizeGrabberCenter = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateResizeGrabber];
  }
}

- (void)setResizeGrabberBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_resizeGrabberBounds = &self->_resizeGrabberBounds;
  if (!CGRectEqualToRect(a3, self->_resizeGrabberBounds))
  {
    p_resizeGrabberBounds->origin.CGFloat x = x;
    p_resizeGrabberBounds->origin.CGFloat y = y;
    p_resizeGrabberBounds->size.CGFloat width = width;
    p_resizeGrabberBounds->size.CGFloat height = height;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateResizeGrabber];
  }
}

- (void)setContentViewOffset:(CGPoint)a3
{
  if (a3.x != self->_contentViewOffset.x || a3.y != self->_contentViewOffset.y)
  {
    self->_contentViewOffset = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self setNeedsLayout];
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self layoutIfNeeded];
  }
}

- (void)_updateResizeGrabber
{
  -[SBSeparatorView setBounds:](self->_resizeGrabber, "setBounds:", self->_resizeGrabberBounds.origin.x, self->_resizeGrabberBounds.origin.y, self->_resizeGrabberBounds.size.width, self->_resizeGrabberBounds.size.height);
  -[SBSeparatorView setCenter:](self->_resizeGrabber, "setCenter:", self->_resizeGrabberCenter.x, self->_resizeGrabberCenter.y);
  [(SBSeparatorView *)self->_resizeGrabber setAlpha:self->_resizeGrabberOpacity];
  [(SBSeparatorView *)self->_resizeGrabber setKeyboardHeight:self->_keyboardHeight];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
  v3 = [(SBSeparatorView *)self->_resizeGrabber nubView];
  if (BSFloatIsZero() & 1) != 0 || ([WeakRetained isViewRegistered:v3])
  {
    if (BSFloatIsZero() && [WeakRetained isViewRegistered:v3]) {
      [WeakRetained unregisterView:v3];
    }
  }
  else
  {
    [WeakRetained registerView:v3 delegate:self];
  }
}

- (void)setContentScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentScale = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateShadowView];
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self setNeedsLayout];
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self layoutIfNeeded];
  }
}

- (void)setKeyboardHeight:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_keyboardHeight = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateResizeGrabber];
  }
}

- (void)setCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  -[SBFTouchPassThroughClippingView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerRadius = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateBackgroundView];
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateShadowView];
  }
}

- (void)_updateBackgroundView
{
  [(UIView *)self->_backgroundView setAlpha:self->_backgroundOpacity];
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:self->_cornerRadius];
  id v3 = [(UIView *)self->_backgroundView layer];
  [v3 setMaskedCorners:self->_maskedCorners];
}

- (void)_updateShadowView
{
  [(SBAppSwitcherPageShadowView *)self->_shadowView setStyle:self->_shadowStyle];
  [(SBAppSwitcherPageShadowView *)self->_shadowView setAlpha:self->_shadowAlpha];
  [(SBAppSwitcherPageShadowView *)self->_shadowView setShadowOffset:self->_shadowOffset];
  [(SBAppSwitcherPageShadowView *)self->_shadowView setShadowPath:self->_shadowPath];
  [(SBAppSwitcherPageShadowView *)self->_shadowView _setContinuousCornerRadius:self->_cornerRadius];
  id v3 = [(SBAppSwitcherPageShadowView *)self->_shadowView layer];
  [v3 setMaskedCorners:self->_maskedCorners];

  shadowView = self->_shadowView;
  double contentScale = self->_contentScale;
  [(SBAppSwitcherPageShadowView *)shadowView setSwitcherCardScale:contentScale];
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  [(SBFTouchPassThroughClippingView *)&v28 layoutSubviews];
  [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SBFTouchPassThroughView setBounds:](self->_contentView, "setBounds:");
  UIRectGetCenter();
  -[SBFTouchPassThroughView setCenter:](self->_contentView, "setCenter:", v11 + self->_contentViewOffset.x, v12 + self->_contentViewOffset.y);
  int IsZero = BSFloatIsZero();
  double v14 = 1.0;
  if (!IsZero) {
    double v14 = 1.0 / self->_contentScale;
  }
  CGFloat v26 = v14;
  v29.origin.CGFloat x = v4;
  v29.origin.CGFloat y = v6;
  v29.size.CGFloat width = v8;
  v29.size.CGFloat height = v10;
  CGRectGetWidth(v29);
  v15 = [(SBFluidSwitcherItemContainerHeaderView *)self->_headerView layer];
  [v15 anchorPoint];

  [(SBFluidSwitcherItemContainerHeaderView *)self->_headerView preferredHeaderHeight];
  v30.origin.CGFloat x = v4;
  v30.origin.CGFloat y = v6;
  v30.size.CGFloat width = v8;
  v30.size.CGFloat height = v10;
  CGRectGetMinX(v30);
  v31.origin.CGFloat x = v4;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v8;
  v31.size.CGFloat height = v10;
  CGRectGetMinY(v31);
  v16 = [MEMORY[0x1E4F42D90] mainScreen];
  [v16 scale];
  UIRectIntegralWithScale();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  -[SBFluidSwitcherItemContainerHeaderView sb_setBoundsAndPositionFromFrame:](self->_headerView, "sb_setBoundsAndPositionFromFrame:", v18, v20, v22, v24);
  headerView = self->_headerView;
  CGAffineTransformMakeScale(&v27, v26, v26);
  [(SBFluidSwitcherItemContainerHeaderView *)headerView setTransform:&v27];
  -[UIView sb_setBoundsAndPositionFromFrame:](self->_backgroundView, "sb_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
  -[SBAppSwitcherPageShadowView sb_setBoundsAndPositionFromFrame:](self->_shadowView, "sb_setBoundsAndPositionFromFrame:", v4, v6, v8, v10);
  [(SBFTouchPassThroughView *)self->_contentView bringSubviewToFront:self->_shadowView];
  [(SBFTouchPassThroughView *)self->_contentView bringSubviewToFront:self->_backgroundView];
  [(SBFTouchPassThroughView *)self->_contentView bringSubviewToFront:self->_resizeGrabber];
  [(SBFTouchPassThroughView *)self->_contentView bringSubviewToFront:self->_headerView];
}

- (void)setResizeGrabberOpacity:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_resizeGrabberOpacitCGFloat y = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateResizeGrabber];
  }
}

- (void)setTitleItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    double v6 = (NSArray *)[v8 copy];
    titleItems = self->_titleItems;
    self->_titleItems = v6;

    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateHeaderAnimated:v4];
  }
}

- (SBFluidSwitcherSpaceUnderlayAccessoryView)initWithDelegate:(id)a3 systemPointerInteractionManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  double v8 = *MEMORY[0x1E4F1DB28];
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v12 = -[SBFTouchPassThroughClippingView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v6);
    uint64_t v14 = +[SBAppSwitcherDomain rootSettings];
    settings = v13->_settings;
    v13->_settings = (SBAppSwitcherSettings *)v14;

    objc_storeWeak((id *)&v13->_systemPointerInteractionManager, v7);
    v13->_titleOpacitCGFloat y = 1.0;
    v13->_backgroundOpacitCGFloat y = 0.0;
    v13->_shadowStyle = 1;
    v13->_contentViewScale = 1.0;
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v8, v9, v10, v11);
    contentView = v13->_contentView;
    v13->_contentView = (SBFTouchPassThroughView *)v16;

    double v18 = v13->_contentView;
    double v19 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBFTouchPassThroughView *)v18 setBackgroundColor:v19];

    [(SBFTouchPassThroughClippingView *)v13 addSubview:v13->_contentView];
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)v13 _updateBackgroundViewVisibility];
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)v13 _updateShadowVisibility];
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)v13 _updateResizeGrabberVisibility];
  }

  return v13;
}

- (void)dealloc
{
  [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self prepareForReuse];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
  BOOL v4 = [(SBSeparatorView *)self->_resizeGrabber nubView];
  [WeakRetained unregisterView:v4];

  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  [(SBFluidSwitcherSpaceUnderlayAccessoryView *)&v5 dealloc];
}

uint64_t __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke(uint64_t a1)
{
  v2 = [SBFluidSwitcherItemContainerHeaderView alloc];
  uint64_t v3 = -[SBFluidSwitcherItemContainerHeaderView initWithFrame:delegate:](v2, "initWithFrame:delegate:", *(void *)(a1 + 32), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(v4 + 488);
  *(void *)(v4 + 488) = v3;

  [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:0.0];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 488) layer];
  uint64_t v7 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  double v8 = 1.0;
  if (v7 != 1) {
    double v8 = 0.0;
  }
  objc_msgSend(v6, "setAnchorPoint:", v8, 0.0);

  [*(id *)(*(void *)(a1 + 32) + 464) addSubview:*(void *)(*(void *)(a1 + 32) + 488)];
  [*(id *)(a1 + 32) _updateHeaderAnimated:0];
  [*(id *)(a1 + 32) setNeedsLayout];
  double v9 = *(void **)(a1 + 32);
  return [v9 layoutIfNeeded];
}

uint64_t __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:*(double *)(*(void *)(a1 + 32) + 576)];
}

uint64_t __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:0.0];
}

void __93__SBFluidSwitcherSpaceUnderlayAccessoryView_setHeaderOpacity_updateMode_settings_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  --setHeaderOpacity_updateMode_settings_completion__staticHeaderOpacityAnimations;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  double v12 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[61] alpha];
    int IsZero = BSFloatIsZero();
    uint64_t v7 = v12;
    if (IsZero && setHeaderOpacity_updateMode_settings_completion__staticHeaderOpacityAnimations == 0)
    {
      [v12[61] removeFromSuperview];
      id v10 = v12[61];
      v12[61] = 0;

      uint64_t v7 = v12;
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, a2, a3);
    uint64_t v7 = v12;
  }
}

- (void)setShadowPath:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_shadowPath] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shadowPath, a3);
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateShadowView];
  }
}

- (void)setContentViewScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentViewScale = a3;
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateContentView];
  }
}

- (void)itemContainerHeaderView:(id)a3 didSelectTitleItem:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = &SBLayoutRolePrimary;
    if ([(NSArray *)self->_titleItems count] >= 2)
    {
      id v8 = [(NSArray *)self->_titleItems objectAtIndex:1];

      if (v8 == v6) {
        uint64_t v7 = &SBLayoutRoleSide;
      }
    }
    uint64_t v9 = *v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained underlayAccessoryView:self didSelectHeaderForRole:v9];
  }
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  id v7 = a5;
  if ([a3 _isPencilInitiated])
  {
    char isKindOfClass = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ([WeakRetained underlayAccessoryViewShouldBeginPointerInteraction:self])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  return isKindOfClass & 1;
}

- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3
{
  double v3 = -20.0;
  double v4 = -20.0;
  double v5 = -20.0;
  double v6 = -20.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  id v4 = a4;
  uint64_t v5 = objc_opt_class();
  double v6 = SBSafeCast(v5, v4);

  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:v6];
    id v8 = [MEMORY[0x1E4F42C90] effectWithPreview:v7];
    [v6 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = +[SBMedusaDomain rootSettings];
    [v17 medusaSeparatorCursorEdgeInsets];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    v30.origin.CGFloat x = v10 + v21;
    v30.origin.CGFloat y = v12 + v19;
    v30.size.CGFloat width = v14 - (v21 + v25);
    v30.size.CGFloat height = v16 - (v19 + v23);
    CGFloat v26 = objc_msgSend(MEMORY[0x1E4F42CB8], "shapeWithRoundedRect:cornerRadius:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height, CGRectGetHeight(v30) * 0.5);
    CGAffineTransform v27 = [MEMORY[0x1E4F42CC0] styleWithEffect:v8 shape:v26];
  }
  else
  {
    CGAffineTransform v27 = 0;
  }

  return v27;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  if (-[SBFluidSwitcherSpaceUnderlayAccessoryView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    char v8 = 1;
  }
  else
  {
    [(SBFluidSwitcherItemContainerHeaderView *)self->_headerView alpha];
    if (BSFloatGreaterThanFloat())
    {
      headerView = self->_headerView;
      -[SBFluidSwitcherSpaceUnderlayAccessoryView convertPoint:toView:](self, "convertPoint:toView:", headerView, x, y);
      char v8 = -[SBFluidSwitcherItemContainerHeaderView pointInside:withEvent:](headerView, "pointInside:withEvent:", v7);
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
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherSpaceUnderlayAccessoryView;
  char v8 = -[SBFTouchPassThroughView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  if (v8
    || ([(SBFluidSwitcherItemContainerHeaderView *)self->_headerView alpha],
        BSFloatGreaterThanFloat())
    && (headerView = self->_headerView,
        -[SBFluidSwitcherSpaceUnderlayAccessoryView convertPoint:toView:](self, "convertPoint:toView:", headerView, x, y), -[SBFluidSwitcherItemContainerHeaderView hitTest:withEvent:](headerView, "hitTest:withEvent:", v7), (char v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_updateBackgroundViewVisibility
{
  if (!self->_backgroundView)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __76__SBFluidSwitcherSpaceUnderlayAccessoryView__updateBackgroundViewVisibility__block_invoke;
    v2[3] = &unk_1E6AF4AC0;
    v2[4] = self;
    [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v2];
  }
}

uint64_t __76__SBFluidSwitcherSpaceUnderlayAccessoryView__updateBackgroundViewVisibility__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [*(id *)(a1 + 32) bounds];
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:");
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 504);
  *(void *)(v4 + 504) = v3;

  double v6 = *(void **)(*(void *)(a1 + 32) + 504);
  id v7 = [MEMORY[0x1E4F428B8] blackColor];
  [v6 setBackgroundColor:v7];

  [*(id *)(a1 + 32) _updateBackgroundView];
  [*(id *)(*(void *)(a1 + 32) + 464) addSubview:*(void *)(*(void *)(a1 + 32) + 504)];
  [*(id *)(a1 + 32) setNeedsLayout];
  char v8 = *(void **)(a1 + 32);
  return [v8 layoutIfNeeded];
}

- (void)_updateShadowVisibility
{
  BOOL v3 = [(SBAppSwitcherSettings *)self->_settings shouldSimplifyForOptions:32];
  shadowView = self->_shadowView;
  if (v3)
  {
    if (shadowView)
    {
      [(SBAppSwitcherPageShadowView *)shadowView removeFromSuperview];
      uint64_t v5 = self->_shadowView;
      self->_shadowView = 0;
    }
  }
  else if (!shadowView)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__SBFluidSwitcherSpaceUnderlayAccessoryView__updateShadowVisibility__block_invoke;
    v6[3] = &unk_1E6AF4AC0;
    v6[4] = self;
    [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v6];
  }
}

uint64_t __68__SBFluidSwitcherSpaceUnderlayAccessoryView__updateShadowVisibility__block_invoke(uint64_t a1)
{
  id v2 = [SBAppSwitcherPageShadowView alloc];
  [*(id *)(a1 + 32) bounds];
  uint64_t v3 = -[SBAppSwitcherPageShadowView initWithFrame:style:](v2, "initWithFrame:style:", *(void *)(*(void *)(a1 + 32) + 624));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 512);
  *(void *)(v4 + 512) = v3;

  [*(id *)(a1 + 32) _updateShadowView];
  [*(id *)(*(void *)(a1 + 32) + 464) addSubview:*(void *)(*(void *)(a1 + 32) + 512)];
  [*(id *)(a1 + 32) setNeedsLayout];
  double v6 = *(void **)(a1 + 32);
  return [v6 layoutIfNeeded];
}

- (void)_updateResizeGrabberVisibility
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2 || self->_resizeGrabber) {
      return;
    }
    goto LABEL_7;
  }
  id v9 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v9 userInterfaceIdiom] == 1)
  {
    resizeGrabber = self->_resizeGrabber;

    if (resizeGrabber) {
      return;
    }
LABEL_7:
    uint64_t v4 = [SBSeparatorView alloc];
    uint64_t v5 = -[SBSeparatorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->_resizeGrabber;
    self->_resizeGrabber = v5;

    [(SBSeparatorView *)self->_resizeGrabber setAccessibilityIdentifier:@"SideAppDivider"];
    [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self _updateResizeGrabber];
    contentView = self->_contentView;
    char v8 = self->_resizeGrabber;
    [(SBFTouchPassThroughView *)contentView addSubview:v8];
    return;
  }
}

- (void)_updateContentView
{
  contentView = self->_contentView;
  CGAffineTransformMakeScale(&v3, self->_contentViewScale, self->_contentViewScale);
  [(SBFTouchPassThroughView *)contentView setTransform:&v3];
}

- (void)_updateHeaderAnimated:(BOOL)a3
{
  -[SBFluidSwitcherItemContainerHeaderView setTextAlpha:](self->_headerView, "setTextAlpha:", a3, self->_titleOpacity);
  headerView = self->_headerView;
  titleItems = self->_titleItems;
  [(SBFluidSwitcherItemContainerHeaderView *)headerView setTitleItems:titleItems animated:0];
}

- (void)_configureDebugBorder
{
  v14[7] = *MEMORY[0x1E4F143B8];
  CGAffineTransform v3 = [MEMORY[0x1E4F428B8] systemRedColor];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F428B8], "systemBlueColor", v3);
  v14[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F428B8] systemYellowColor];
  v14[2] = v5;
  double v6 = [MEMORY[0x1E4F428B8] systemMintColor];
  v14[3] = v6;
  id v7 = [MEMORY[0x1E4F428B8] systemPurpleColor];
  v14[4] = v7;
  char v8 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  v14[5] = v8;
  id v9 = [MEMORY[0x1E4F428B8] systemIndigoColor];
  v14[6] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:7];

  objc_super v11 = objc_msgSend(v10, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v10, "count"));
  objc_super v12 = [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self layer];
  objc_msgSend(v12, "setBorderColor:", objc_msgSend(v11, "cgColor"));

  double v13 = [(SBFluidSwitcherSpaceUnderlayAccessoryView *)self layer];
  [v13 setBorderWidth:8.0];
}

- (SBFluidSwitcherSpaceUnderlayAccessoryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherSpaceUnderlayAccessoryViewDelegate *)WeakRetained;
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

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (double)headerOpacity
{
  return self->_headerOpacity;
}

- (double)titleOpacity
{
  return self->_titleOpacity;
}

- (NSArray)titleItems
{
  return self->_titleItems;
}

- (double)backgroundOpacity
{
  return self->_backgroundOpacity;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (double)shadowOffset
{
  return self->_shadowOffset;
}

- (int64_t)shadowStyle
{
  return self->_shadowStyle;
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (double)resizeGrabberOpacity
{
  return self->_resizeGrabberOpacity;
}

- (CGRect)resizeGrabberBounds
{
  double x = self->_resizeGrabberBounds.origin.x;
  double y = self->_resizeGrabberBounds.origin.y;
  double width = self->_resizeGrabberBounds.size.width;
  double height = self->_resizeGrabberBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)resizeGrabberCenter
{
  double x = self->_resizeGrabberCenter.x;
  double y = self->_resizeGrabberCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
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
  objc_storeStrong((id *)&self->_shadowPath, 0);
  objc_storeStrong((id *)&self->_titleItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resizeGrabber, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_systemPointerInteractionManager);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end