@interface SBAppSwitcherTransientOverlayPageContentView
- (BOOL)contentRequiresGroupOpacity;
- (BOOL)isActive;
- (BOOL)isVisible;
- (SBAppLayout)appLayout;
- (SBAppSwitcherTransientOverlayPageContentView)initWithFrame:(CGRect)a3 appLayout:(id)a4;
- (SBAppSwitcherTransientOverlayPageContentViewDelegate)delegate;
- (UIView)contentView;
- (double)cornerRadius;
- (int64_t)contentOrientation;
- (int64_t)orientation;
- (unint64_t)maskedCorners;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setContentOrientation:(int64_t)a3;
- (void)setContentView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation SBAppSwitcherTransientOverlayPageContentView

- (SBAppSwitcherTransientOverlayPageContentView)initWithFrame:(CGRect)a3 appLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBAppSwitcherTransientOverlayPageContentView;
  v10 = -[SBAppSwitcherTransientOverlayPageContentView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    appLayout = v10->_appLayout;
    v10->_appLayout = (SBAppLayout *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F4F8D0]);
    [(SBAppSwitcherTransientOverlayPageContentView *)v10 bounds];
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:");
    contentWrapperView = v10->_contentWrapperView;
    v10->_contentWrapperView = (BSUIOrientationTransformWrapperView *)v14;

    [(BSUIOrientationTransformWrapperView *)v10->_contentWrapperView setClipsToBounds:1];
    [(SBAppSwitcherTransientOverlayPageContentView *)v10 addSubview:v10->_contentWrapperView];
  }

  return v10;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBAppSwitcherTransientOverlayPageContentView;
  [(SBAppSwitcherTransientOverlayPageContentView *)&v3 layoutSubviews];
  [(SBAppSwitcherTransientOverlayPageContentView *)self bounds];
  -[BSUIOrientationTransformWrapperView setFrame:](self->_contentWrapperView, "setFrame:");
}

- (BOOL)contentRequiresGroupOpacity
{
  return 0;
}

- (double)cornerRadius
{
  [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView _continuousCornerRadius];
  return result;
}

- (int64_t)contentOrientation
{
  return [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView contentOrientation];
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setContentOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_contentWrapperView, "setContainerOrientation:");
    id v4 = [(SBAppSwitcherTransientOverlayPageContentView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 appSwitcherTransientOverlayPageContentViewDidChangeContainerOrientation:self];
    }
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    id v4 = [(SBAppSwitcherTransientOverlayPageContentView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 appSwitcherTransientOverlayPageContentViewDidChangeActive:self];
    }
  }
}

- (void)setCornerRadius:(double)a3
{
}

- (void)setMaskedCorners:(unint64_t)a3
{
  id v4 = [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView layer];
  [v4 setMaskedCorners:a3];
}

- (unint64_t)maskedCorners
{
  v2 = [(BSUIOrientationTransformWrapperView *)self->_contentWrapperView layer];
  unint64_t v3 = [v2 maskedCorners];

  return v3;
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  v8 = v5;
  if (contentView != v5)
  {
    if ([(UIView *)contentView isDescendantOfView:self]) {
      [(UIView *)*p_contentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    if (*p_contentView)
    {
      -[BSUIOrientationTransformWrapperView addContentView:](self->_contentWrapperView, "addContentView:");
      [(SBAppSwitcherTransientOverlayPageContentView *)self setNeedsLayout];
    }
  }
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (SBAppSwitcherTransientOverlayPageContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAppSwitcherTransientOverlayPageContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
}

@end