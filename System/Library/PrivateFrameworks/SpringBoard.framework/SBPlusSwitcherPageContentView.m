@interface SBPlusSwitcherPageContentView
- (BOOL)contentRequiresGroupOpacity;
- (BOOL)isActive;
- (BOOL)isVisible;
- (SBPlusSwitcherPageContentView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (int64_t)orientation;
- (unint64_t)maskedCorners;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation SBPlusSwitcherPageContentView

- (SBPlusSwitcherPageContentView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBPlusSwitcherPageContentView;
  v3 = -[SBPlusSwitcherPageContentView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:53 options:0];
    materialView = v3->_materialView;
    v3->_materialView = (MTMaterialView *)v4;

    [(SBPlusSwitcherPageContentView *)v3 addSubview:v3->_materialView];
    id v6 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v7 = (void *)MEMORY[0x1E4F42A80];
    v8 = [MEMORY[0x1E4F42A98] configurationWithPointSize:3 weight:34.0];
    v9 = [v7 systemImageNamed:@"plus" withConfiguration:v8];
    uint64_t v10 = [v6 initWithImage:v9];
    plusImageView = v3->_plusImageView;
    v3->_plusImageView = (UIImageView *)v10;

    v12 = [(MTMaterialView *)v3->_materialView visualStylingProviderForCategory:1];
    [v12 automaticallyUpdateView:v3->_plusImageView withStyle:1];

    [(SBPlusSwitcherPageContentView *)v3 addSubview:v3->_plusImageView];
    v13 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBPlusSwitcherPageContentView *)v3 setBackgroundColor:v13];
  }
  return v3;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SBPlusSwitcherPageContentView;
  [(SBPlusSwitcherPageContentView *)&v7 layoutSubviews];
  materialView = self->_materialView;
  [(SBPlusSwitcherPageContentView *)self bounds];
  -[MTMaterialView setFrame:](materialView, "setFrame:");
  [(UIImageView *)self->_plusImageView sizeToFit];
  plusImageView = self->_plusImageView;
  [(SBPlusSwitcherPageContentView *)self bounds];
  UIRectGetCenter();
  -[UIImageView setCenter:](plusImageView, "setCenter:");
  v5 = self->_plusImageView;
  CGAffineTransformMakeScale(&v6, 10.0, 10.0);
  [(UIImageView *)v5 setTransform:&v6];
}

- (void)setCornerRadius:(double)a3
{
}

- (void)setMaskedCorners:(unint64_t)a3
{
  id v4 = [(MTMaterialView *)self->_materialView layer];
  [v4 setMaskedCorners:a3];
}

- (unint64_t)maskedCorners
{
  v2 = [(MTMaterialView *)self->_materialView layer];
  unint64_t v3 = [v2 maskedCorners];

  return v3;
}

- (double)cornerRadius
{
  return self->cornerRadius;
}

- (int64_t)orientation
{
  return self->orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->orientation = a3;
}

- (BOOL)contentRequiresGroupOpacity
{
  return self->contentRequiresGroupOpacity;
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isVisible
{
  return self->visible;
}

- (void)setVisible:(BOOL)a3
{
  self->visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusImageView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end