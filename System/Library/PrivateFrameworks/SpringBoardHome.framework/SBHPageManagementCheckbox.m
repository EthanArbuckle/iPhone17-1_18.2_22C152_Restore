@interface SBHPageManagementCheckbox
- (CALayer)deselectedMask;
- (CGSize)intrinsicContentSize;
- (SBHPageManagementCheckbox)initWithFrame:(CGRect)a3;
- (SBHPageManagementCheckbox)initWithFrame:(CGRect)a3 checkboxDiameter:(double)a4 backgroundView:(id)a5;
- (UIImageView)customImageView;
- (UIView)backgroundView;
- (UIView)highlightView;
- (double)checkboxDiameter;
- (double)effectiveHighlightAlpha;
- (double)effectiveImageAlpha;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)updateDeselectedMaskState;
@end

@implementation SBHPageManagementCheckbox

- (SBHPageManagementCheckbox)initWithFrame:(CGRect)a3 checkboxDiameter:(double)a4 backgroundView:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SBHPageManagementCheckbox;
  v13 = -[SBHPageManagementCheckbox initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_checkboxDiameter = a4;
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    highlightView = v14->_highlightView;
    v14->_highlightView = v15;

    v17 = v14->_highlightView;
    v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.431372549 alpha:1.0];
    [(UIView *)v17 setBackgroundColor:v18];

    [(UIView *)v14->_highlightView setAlpha:0.0];
    [(UIView *)v14->_highlightView _setCornerRadius:a4 * 0.5];
    v19 = [(UIView *)v14->_highlightView layer];
    [v19 setCompositingFilter:*MEMORY[0x1E4F3A018]];

    [(UIView *)v14->_highlightView bs_setHitTestingDisabled:1];
    [(SBHPageManagementCheckbox *)v14 insertSubview:v14->_highlightView atIndex:1];
    if (v12)
    {
      objc_storeStrong((id *)&v14->_backgroundView, a5);
      [(SBHPageManagementCheckbox *)v14 insertSubview:v12 atIndex:0];
      [v12 _setCornerRadius:a4 * 0.5];
    }
    v20 = [MEMORY[0x1E4FB1830] configurationWithWeight:6];
    v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v20];
    v22 = [MEMORY[0x1E4FB1618] whiteColor];
    v23 = [v21 imageWithTintColor:v22 renderingMode:1];

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v23];
    customImageView = v14->_customImageView;
    v14->_customImageView = (UIImageView *)v24;

    [(UIImageView *)v14->_customImageView setAlpha:0.0];
    [(SBHPageManagementCheckbox *)v14 addSubview:v14->_customImageView];
    v26 = [(SBHPageManagementCheckbox *)v14 layer];
    [v26 setAllowsGroupBlending:0];

    [(SBHPageManagementCheckbox *)v14 setAccessibilityIdentifier:@"toggle page hidden checkbox"];
  }

  return v14;
}

- (SBHPageManagementCheckbox)initWithFrame:(CGRect)a3
{
  return -[SBHPageManagementCheckbox initWithFrame:checkboxDiameter:backgroundView:](self, "initWithFrame:checkboxDiameter:backgroundView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 10.0);
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)SBHPageManagementCheckbox;
  [(SBHPageManagementCheckbox *)&v29 layoutSubviews];
  [(SBHPageManagementCheckbox *)self sendSubviewToBack:self->_highlightView];
  if (self->_backgroundView) {
    -[SBHPageManagementCheckbox sendSubviewToBack:](self, "sendSubviewToBack:");
  }
  int v3 = [(SBHPageManagementCheckbox *)self isEnabled];
  [(SBHPageManagementCheckbox *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(SBHPageManagementCheckbox *)self configuration];
  [v12 contentInsets];
  double v17 = SBHDirectionalEdgeInsetsInsetRect([(SBHPageManagementCheckbox *)self effectiveUserInterfaceLayoutDirection], v5, v7, v9, v11, v13, v14, v15, v16);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  -[UIView setFrame:](self->_backgroundView, "setFrame:", v17, v19, v21, v23);
  -[UIView setFrame:](self->_highlightView, "setFrame:", v17, v19, v21, v23);
  [(SBHPageManagementCheckbox *)self effectiveHighlightAlpha];
  -[UIView setAlpha:](self->_highlightView, "setAlpha:");
  [(SBHPageManagementCheckbox *)self updateDeselectedMaskState];
  uint64_t v24 = [(SBHPageManagementCheckbox *)self customImageView];
  [(SBHPageManagementCheckbox *)self effectiveImageAlpha];
  double v26 = v25;
  UIRectGetCenter();
  objc_msgSend(v24, "setCenter:");
  [v24 alpha];
  if (v26 != v27) {
    [v24 setAlpha:v26];
  }
  double v28 = 0.5;
  if (v3) {
    double v28 = 1.0;
  }
  [(UIView *)self->_backgroundView setAlpha:v28];
}

- (double)effectiveImageAlpha
{
  int v3 = [(SBHPageManagementCheckbox *)self isEnabled];
  int v4 = [(SBHPageManagementCheckbox *)self isSelected];
  double result = 0.5;
  if (v3 | v4 ^ 1) {
    double result = 0.0;
  }
  if ((v3 & v4) != 0) {
    return 1.0;
  }
  return result;
}

- (double)effectiveHighlightAlpha
{
  int v3 = [(SBHPageManagementCheckbox *)self isSelected];
  int v4 = [(SBHPageManagementCheckbox *)self isHighlighted];
  double v5 = [(SBHPageManagementCheckbox *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  if (v6 == 2) {
    int v7 = v3;
  }
  else {
    int v7 = 1;
  }
  double result = 0.85;
  if ((v4 & (v6 == 2)) == 0) {
    double result = 0.5;
  }
  double v9 = 0.35;
  if (v7) {
    double v9 = 0.0;
  }
  if (!v4) {
    return v9;
  }
  return result;
}

- (CALayer)deselectedMask
{
  deselectedMask = self->_deselectedMask;
  if (!deselectedMask)
  {
    [(SBHPageManagementCheckbox *)self checkboxDiameter];
    double v5 = v4;
    Mutable = CGPathCreateMutable();
    v11.origin.double x = 0.0;
    v11.origin.double y = 0.0;
    v11.size.double width = v5;
    v11.size.double height = v5;
    CGPathAddEllipseInRect(Mutable, 0, v11);
    v12.origin.double x = 0.0;
    v12.origin.double y = 0.0;
    v12.size.double width = v5;
    v12.size.double height = v5;
    CGRect v13 = CGRectInset(v12, 3.0, 3.0);
    CGPathAddEllipseInRect(Mutable, 0, v13);
    int v7 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    -[CALayer setBounds:](v7, "setBounds:", 0.0, 0.0, v5, v5);
    -[CALayer setPosition:](v7, "setPosition:", v5 * 0.5, v5 * 0.5);
    [(CALayer *)v7 setPath:Mutable];
    [(CALayer *)v7 setFillRule:*MEMORY[0x1E4F39FB8]];
    CGPathRelease(Mutable);
    double v8 = self->_deselectedMask;
    self->_deselectedMask = v7;

    deselectedMask = self->_deselectedMask;
  }
  return deselectedMask;
}

- (void)updateDeselectedMaskState
{
  if ([(SBHPageManagementCheckbox *)self isSelected])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(SBHPageManagementCheckbox *)self deselectedMask];
  }
  int v3 = [(SBHPageManagementCheckbox *)self layer];
  [v3 setMask:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBHPageManagementCheckbox;
  -[SBHPageManagementCheckbox setHighlighted:](&v6, sel_setHighlighted_);
  if (v3)
  {
    [(UIView *)self->_highlightView setAlpha:0.5];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__SBHPageManagementCheckbox_setHighlighted___block_invoke;
    v5[3] = &unk_1E6AAC810;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v5 options:0 animations:0.2 completion:0.0];
  }
}

uint64_t __44__SBHPageManagementCheckbox_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 768) setAlpha:0.0];
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBHPageManagementCheckbox;
  [(SBHPageManagementCheckbox *)&v20 setSelected:a3];
  objc_super v6 = [(SBHPageManagementCheckbox *)self customImageView];
  [(SBHPageManagementCheckbox *)self effectiveImageAlpha];
  double v8 = v7;
  [(SBHPageManagementCheckbox *)self effectiveHighlightAlpha];
  double v10 = v9;
  if (v4)
  {
    CGRect v11 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __50__SBHPageManagementCheckbox_setSelected_animated___block_invoke;
    double v15 = &unk_1E6AAE228;
    id v16 = v6;
    double v17 = self;
    double v18 = v8;
    double v19 = v10;
    [v11 animateWithDuration:2 delay:&v12 options:0 animations:0.2 completion:0.0];
    [(SBHPageManagementCheckbox *)self updateDeselectedMaskState];
  }
  else
  {
    [v6 setAlpha:v8];
    [(UIView *)self->_highlightView setAlpha:v10];
    [(SBHPageManagementCheckbox *)self updateDeselectedMaskState];
  }
}

uint64_t __50__SBHPageManagementCheckbox_setSelected_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  v2 = *(void **)(*(void *)(a1 + 40) + 768);
  double v3 = *(double *)(a1 + 56);
  return [v2 setAlpha:v3];
}

- (CGSize)intrinsicContentSize
{
  [(SBHPageManagementCheckbox *)self checkboxDiameter];
  double v3 = v2;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SBHPageManagementCheckbox;
  [(SBHPageManagementCheckbox *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(SBHPageManagementCheckbox *)self effectiveHighlightAlpha];
  -[UIView setAlpha:](self->_highlightView, "setAlpha:");
}

- (double)checkboxDiameter
{
  return self->_checkboxDiameter;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (UIImageView)customImageView
{
  return self->_customImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customImageView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_deselectedMask, 0);
}

@end