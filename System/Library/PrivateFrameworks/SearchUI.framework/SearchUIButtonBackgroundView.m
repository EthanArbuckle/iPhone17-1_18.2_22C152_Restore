@interface SearchUIButtonBackgroundView
- (BOOL)useHierarchicalColorRendering;
- (UIColor)color;
- (void)setColor:(id)a3;
- (void)setUseHierarchicalColorRendering:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
@end

@implementation SearchUIButtonBackgroundView

- (void)setColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_color = &self->_color;
  if (self->_color != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_color, a3);
    p_color = (UIColor **)[(SearchUIButtonBackgroundView *)self tlk_updateWithCurrentAppearance];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_color, v5);
}

- (void)setUseHierarchicalColorRendering:(BOOL)a3
{
  if (self->_useHierarchicalColorRendering != a3)
  {
    self->_useHierarchicalColorRendering = a3;
    [(SearchUIButtonBackgroundView *)self tlk_updateWithCurrentAppearance];
  }
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIButtonBackgroundView;
  [(TLKProminenceView *)&v12 tlk_updateForAppearance:v4];
  v5 = [(SearchUIButtonBackgroundView *)self color];

  if (v5) {
    [v4 disableAppearanceForView:self];
  }
  v6 = [(SearchUIButtonBackgroundView *)self color];
  BOOL v7 = [(SearchUIButtonBackgroundView *)self useHierarchicalColorRendering];
  double v8 = 0.15;
  if (!v7) {
    double v8 = 1.0;
  }
  v9 = [v6 colorWithAlphaComponent:v8];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    if ([v4 isVibrant]) {
      [v4 quaternaryColor];
    }
    else {
    id v10 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    }
  }
  v11 = v10;
  [(SearchUIButtonBackgroundView *)self setBackgroundColor:v10];
}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)useHierarchicalColorRendering
{
  return self->_useHierarchicalColorRendering;
}

- (void).cxx_destruct
{
}

@end