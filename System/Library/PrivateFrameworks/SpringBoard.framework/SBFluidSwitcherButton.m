@interface SBFluidSwitcherButton
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSString)backdropGroupName;
- (SBFluidSwitcherButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)extendedEdgeInsets;
- (UIImage)image;
- (id)_backgroundMaterialView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)buttonStyle;
- (void)_addHighlightViewIfNecessary;
- (void)_configureBackgroundViewIfNecessaryForStyle:(int64_t)a3;
- (void)_configureGlyphImageViewIfNecessaryForStyle:(int64_t)a3;
- (void)_configureXPlusDViewIfNecessaryForStyle:(int64_t)a3;
- (void)_invalidateBackgroundView;
- (void)_invalidateXPlusDView;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setBackdropGroupName:(id)a3;
- (void)setButtonStyle:(int64_t)a3;
- (void)setExtendedEdgeInsets:(UIEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
@end

@implementation SBFluidSwitcherButton

- (SBFluidSwitcherButton)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBFluidSwitcherButton;
  v3 = -[SBFluidSwitcherButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    glyphImageView = v3->_glyphImageView;
    v3->_glyphImageView = (UIImageView *)v5;

    [(UIImageView *)v3->_glyphImageView setContentMode:4];
    [(SBFluidSwitcherButton *)v3 addSubview:v3->_glyphImageView];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v3];
    [(SBFluidSwitcherButton *)v3 addInteraction:v7];
  }
  return v3;
}

- (void)setImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [(UIImageView *)self->_glyphImageView setImage:*p_image];
    [(UIImageView *)self->_glyphImageView sizeToFit];
    [(UIImageView *)self->_xPlusDView setImage:*p_image];
    [(SBFluidSwitcherButton *)self setNeedsLayout];
    uint64_t v5 = v7;
  }
}

- (void)setBackdropGroupName:(id)a3
{
  p_backdropGroupName = &self->_backdropGroupName;
  id v7 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backdropGroupName, a3);
    v6 = [(SBFluidSwitcherButton *)self _backgroundMaterialView];
    [v6 setGroupNameBase:*p_backdropGroupName];
  }
}

- (void)setButtonStyle:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBFluidSwitcherButton.m", 114, @"Invalid parameter not satisfying: %@", @"(buttonStyle == SBSwitcherPlusButtonStyleVibrant) || (buttonStyle == SBSwitcherPlusButtonStyleMuted)" object file lineNumber description];
  }
  if (self->_buttonStyle != a3)
  {
    self->_buttonStyle = a3;
    [(SBFluidSwitcherButton *)self _invalidateBackgroundView];
    [(SBFluidSwitcherButton *)self _invalidateXPlusDView];
    [(SBFluidSwitcherButton *)self setNeedsLayout];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBFluidSwitcherButton *)self bounds];
  double top = self->_extendedEdgeInsets.top;
  double left = self->_extendedEdgeInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_extendedEdgeInsets.right);
  double v16 = v15 - (top + self->_extendedEdgeInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;
  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SBFluidSwitcherButton;
  [(SBFluidSwitcherButton *)&v19 layoutSubviews];
  [(SBFluidSwitcherButton *)self _configureGlyphImageViewIfNecessaryForStyle:self->_buttonStyle];
  [(SBFluidSwitcherButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIImageView *)self->_glyphImageView frame];
  UIRectCenteredIntegralRectScale();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(UIImageView *)self->_glyphImageView setFrame:0];
  [(SBFluidSwitcherButton *)self _configureXPlusDViewIfNecessaryForStyle:self->_buttonStyle];
  -[UIImageView setFrame:](self->_xPlusDView, "setFrame:", v12, v14, v16, v18);
  [(SBFluidSwitcherButton *)self _setContinuousCornerRadius:v10 * 0.5];
  [(SBFluidSwitcherButton *)self _configureBackgroundViewIfNecessaryForStyle:self->_buttonStyle];
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:v10 * 0.5];
  -[UIView setFrame:](self->_highlightView, "setFrame:", v4, v6, v8, v10);
  [(UIView *)self->_highlightView _setContinuousCornerRadius:v10 * 0.5];
}

- (void)didMoveToSuperview
{
  double v3 = [(SBFluidSwitcherButton *)self superview];

  if (v3)
  {
    id v5 = [(SBFluidSwitcherButton *)self _backgroundMaterialView];
    double v4 = [v5 visualStylingProviderForCategory:2];
    [v4 automaticallyUpdateView:self->_glyphImageView withStyle:0];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SBFluidSwitcherButton *)self isHighlighted];
  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherButton;
  [(SBFluidSwitcherButton *)&v7 setHighlighted:v3];
  if (v5 != v3)
  {
    [(SBFluidSwitcherButton *)self _addHighlightViewIfNecessary];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__SBFluidSwitcherButton_setHighlighted___block_invoke;
    v6[3] = &unk_1E6AF4AC0;
    v6[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0x20000 delay:v6 options:0 animations:0.19 completion:0.0];
  }
}

uint64_t __40__SBFluidSwitcherButton_setHighlighted___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[60];
  int v3 = [v1 isHighlighted];
  double v4 = 0.466666667;
  if (!v3) {
    double v4 = 0.0;
  }
  return [v2 setAlpha:v4];
}

- (void)_addHighlightViewIfNecessary
{
  if (!self->_highlightView)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __53__SBFluidSwitcherButton__addHighlightViewIfNecessary__block_invoke;
    v2[3] = &unk_1E6AF4AC0;
    v2[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v2];
  }
}

uint64_t __53__SBFluidSwitcherButton__addHighlightViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 480);
  *(void *)(v3 + 480) = v2;

  int v5 = *(void **)(*(void *)(a1 + 32) + 480);
  double v6 = [MEMORY[0x1E4F428B8] whiteColor];
  [v5 setBackgroundColor:v6];

  [*(id *)(*(void *)(a1 + 32) + 480) setAlpha:0.0];
  objc_super v7 = [*(id *)(*(void *)(a1 + 32) + 480) layer];
  [v7 setCompositingFilter:*MEMORY[0x1E4F3A308]];

  [*(id *)(a1 + 32) insertSubview:*(void *)(*(void *)(a1 + 32) + 480) aboveSubview:*(void *)(*(void *)(a1 + 32) + 456)];
  double v8 = *(void **)(a1 + 32);
  return [v8 layoutIfNeeded];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  int v5 = [v4 view];
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1)
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v4 numberOfTapsRequired];

  if (v6 != 1)
  {
LABEL_7:
    BOOL v7 = 1;
    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  uint64_t v6 = (void *)MEMORY[0x1E4F42CB0];
  id v7 = a5;
  [(SBFluidSwitcherButton *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 identifier];

  double v17 = objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
  uint64_t v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v5 setBackgroundColor:v6];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self parameters:v5];
  double v8 = [MEMORY[0x1E4F42CA8] effectWithPreview:v7];
  double v9 = [MEMORY[0x1E4F42CC0] styleWithEffect:v8 shape:0];

  return v9;
}

- (id)_backgroundMaterialView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    backgroundView = self->_backgroundView;
  }
  else {
    backgroundView = 0;
  }
  return backgroundView;
}

- (void)_invalidateBackgroundView
{
  if (self->_backgroundView)
  {
    uint64_t v3 = [(SBFluidSwitcherButton *)self _backgroundMaterialView];
    id v4 = [v3 visualStylingProviderForCategory:2];
    [v4 stopAutomaticallyUpdatingView:self->_glyphImageView];

    [(UIView *)self->_backgroundView removeFromSuperview];
    backgroundView = self->_backgroundView;
    self->_backgroundView = 0;
  }
}

- (void)_configureBackgroundViewIfNecessaryForStyle:(int64_t)a3
{
  p_backgroundView = (id *)&self->_backgroundView;
  if (!self->_backgroundView)
  {
    if (a3 == 1)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
      id v9 = *p_backgroundView;
      id *p_backgroundView = v8;

      id v10 = *p_backgroundView;
      double v11 = [MEMORY[0x1E4F428B8] tertiarySystemFillColor];
      [v10 setBackgroundColor:v11];

      [*p_backgroundView setUserInteractionEnabled:0];
    }
    else if (!a3)
    {
      id v5 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:52];
      objc_storeStrong(p_backgroundView, v5);
      [v5 setGroupNameBase:self->_backdropGroupName];
      uint64_t v6 = [(SBFluidSwitcherButton *)self superview];

      if (v6)
      {
        id v7 = [v5 visualStylingProviderForCategory:2];
        [v7 automaticallyUpdateView:self->_glyphImageView withStyle:0];
      }
    }
    id v12 = *p_backgroundView;
    [(SBFluidSwitcherButton *)self insertSubview:v12 atIndex:0];
  }
}

- (void)_invalidateXPlusDView
{
  xPlusDView = self->_xPlusDView;
  if (xPlusDView)
  {
    [(UIImageView *)xPlusDView removeFromSuperview];
    id v4 = self->_xPlusDView;
    self->_xPlusDView = 0;
  }
}

- (void)_configureXPlusDViewIfNecessaryForStyle:(int64_t)a3
{
  if (!a3 && !self->_xPlusDView)
  {
    id v4 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:self->_image];
    xPlusDView = self->_xPlusDView;
    self->_xPlusDView = v4;

    [(UIImageView *)self->_xPlusDView setContentMode:4];
    uint64_t v6 = [(UIImageView *)self->_xPlusDView layer];
    id v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    [v6 setCompositingFilter:v7];

    [(UIImageView *)self->_xPlusDView setAlpha:0.3];
    id v8 = self->_xPlusDView;
    [(SBFluidSwitcherButton *)self addSubview:v8];
  }
}

- (void)_configureGlyphImageViewIfNecessaryForStyle:(int64_t)a3
{
  glyphImageView = self->_glyphImageView;
  if (a3 == 1)
  {
    id v6 = [(UIImageView *)glyphImageView tintColor];
    id v5 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    if ((BSEqualObjects() & 1) == 0) {
      [(UIImageView *)self->_glyphImageView setTintColor:v5];
    }
  }
  else
  {
    [(UIImageView *)glyphImageView setTintColor:0];
  }
}

- (UIImage)image
{
  return self->_image;
}

- (UIEdgeInsets)extendedEdgeInsets
{
  double top = self->_extendedEdgeInsets.top;
  double left = self->_extendedEdgeInsets.left;
  double bottom = self->_extendedEdgeInsets.bottom;
  double right = self->_extendedEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setExtendedEdgeInsets:(UIEdgeInsets)a3
{
  self->_extendedEdgeInsets = a3;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_xPlusDView, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end