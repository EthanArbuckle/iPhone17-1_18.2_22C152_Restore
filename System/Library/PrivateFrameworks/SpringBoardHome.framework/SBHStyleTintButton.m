@interface SBHStyleTintButton
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (SBHStyleTintButton)initWithFrame:(CGRect)a3;
- (SBHStyleTintButton)initWithImage:(id)a3;
- (UIImage)image;
- (id)_symbolConfigurationForTraitCollection:(id)a3;
- (void)_updateFilters;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)sizeToFit;
@end

@implementation SBHStyleTintButton

- (SBHStyleTintButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHStyleTintButton;
  v3 = -[SBHStyleTintButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    SBHStyleTintButtonSharedInit(v3);
  }
  return v4;
}

- (SBHStyleTintButton)initWithImage:(id)a3
{
  id v4 = a3;
  [v4 size];
  BSRectWithSize();
  v8.receiver = self;
  v8.super_class = (Class)SBHStyleTintButton;
  v5 = -[SBHStyleTintButton initWithFrame:](&v8, sel_initWithFrame_);
  objc_super v6 = v5;
  if (v5)
  {
    SBHStyleTintButtonSharedInit(v5);
    [(UIImageView *)v6->_tintButtonImageView setImage:v4];
  }

  return v6;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBHStyleTintButton;
  [(SBHStyleTintButton *)&v4 layoutSubviews];
  tintButtonImageView = self->_tintButtonImageView;
  [(SBHStyleTintButton *)self bounds];
  -[UIImageView setFrame:](tintButtonImageView, "setFrame:");
}

- (UIImage)image
{
  return [(UIImageView *)self->_tintButtonImageView image];
}

- (void)setImage:(id)a3
{
  [(UIImageView *)self->_tintButtonImageView setImage:a3];
  [(SBHStyleTintButton *)self invalidateIntrinsicContentSize];
  [(SBHStyleTintButton *)self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBHStyleTintButton;
  -[SBHStyleTintButton setHighlighted:](&v5, sel_setHighlighted_);
  SBHUIViewAnimateHighlight(self->_tintButtonImageView, v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIImageView sizeThatFits:](self->_tintButtonImageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)sizeToFit
{
  [(UIImageView *)self->_tintButtonImageView sizeToFit];
  [(SBHStyleTintButton *)self setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  [(UIImageView *)self->_tintButtonImageView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  -[UIImageView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_tintButtonImageView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_updateFilters
{
  id v9 = [(SBHStyleTintButton *)self traitCollection];
  tintButtonImageView = self->_tintButtonImageView;
  double v4 = [(SBHStyleTintButton *)self _symbolConfigurationForTraitCollection:v9];
  [(UIImageView *)tintButtonImageView setSymbolConfiguration:v4];

  if (v9)
  {
    uint64_t v5 = [v9 userInterfaceStyle];
    double v6 = (void *)MEMORY[0x1E4F3A2E0];
    if (v5 != 1) {
      double v6 = (void *)MEMORY[0x1E4F3A2E8];
    }
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4F3A2E0];
  }
  v7 = [MEMORY[0x1E4F39BC0] filterWithType:*v6];
  objc_super v8 = [(UIImageView *)self->_tintButtonImageView layer];
  [v8 setCompositingFilter:v7];
}

- (id)_symbolConfigurationForTraitCollection:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = v3;
  if (v3 && [v3 userInterfaceStyle] != 1)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] blackColor];
  }
  double v6 = v5;
  v7 = [v5 colorWithAlphaComponent:0.54];

  objc_super v8 = (void *)MEMORY[0x1E4FB1830];
  v14[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v10 = [v8 configurationWithPaletteColors:v9];

  v11 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  v12 = [v10 configurationByApplyingConfiguration:v11];

  return v12;
}

- (void).cxx_destruct
{
}

@end