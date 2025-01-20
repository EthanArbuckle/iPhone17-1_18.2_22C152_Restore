@interface OBContentView
- (BOOL)_colorIsDefault:(id)a3;
- (BOOL)aboveHeaderLayout;
- (BOOL)customizedBackgroundColor;
- (OBContentView)initWithFrame:(CGRect)a3;
- (OBContentView)initWithFrame:(CGRect)a3 aboveHeaderLayout:(BOOL)a4;
- (UIColor)darkColor;
- (UIColor)lightColor;
- (UIView)bleedView;
- (id)_defaultColorForCurrentTraitCollection;
- (void)setAboveHeaderLayout:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBleedView:(id)a3;
- (void)setCustomizedBackgroundColor:(BOOL)a3;
- (void)setDarkColor:(id)a3;
- (void)setLightColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OBContentView

- (OBContentView)initWithFrame:(CGRect)a3 aboveHeaderLayout:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)OBContentView;
  v5 = -[OBContentView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_aboveHeaderLayout = v4;
    v5->_customizedBackgroundColor = 0;
    if (v4)
    {
      v7 = [(OBContentView *)v5 _defaultColorForCurrentTraitCollection];
      v9.receiver = v6;
      v9.super_class = (Class)OBContentView;
      [(OBContentView *)&v9 setBackgroundColor:v7];
    }
  }
  return v6;
}

- (OBContentView)initWithFrame:(CGRect)a3
{
  return -[OBContentView initWithFrame:aboveHeaderLayout:](self, "initWithFrame:aboveHeaderLayout:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  [(OBContentView *)self setCustomizedBackgroundColor:1];
  v6.receiver = self;
  v6.super_class = (Class)OBContentView;
  [(OBContentView *)&v6 setBackgroundColor:v4];
  v5 = [(OBContentView *)self bleedView];
  [v5 setBackgroundColor:v4];
}

- (void)setBleedView:(id)a3
{
  p_bleedView = &self->_bleedView;
  objc_storeWeak((id *)&self->_bleedView, a3);
  id v6 = [(OBContentView *)self backgroundColor];
  id WeakRetained = objc_loadWeakRetained((id *)p_bleedView);
  [WeakRetained setBackgroundColor:v6];
}

- (UIColor)darkColor
{
  darkColor = self->_darkColor;
  if (!darkColor)
  {
    id v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    v5 = self->_darkColor;
    self->_darkColor = v4;

    darkColor = self->_darkColor;
  }
  return darkColor;
}

- (UIColor)lightColor
{
  lightColor = self->_lightColor;
  if (!lightColor)
  {
    id v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.843137255 green:0.843137255 blue:0.843137255 alpha:1.0];
    v5 = self->_lightColor;
    self->_lightColor = v4;

    lightColor = self->_lightColor;
  }
  return lightColor;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OBContentView;
  [(OBContentView *)&v8 traitCollectionDidChange:a3];
  if (![(OBContentView *)self customizedBackgroundColor])
  {
    if ([(OBContentView *)self aboveHeaderLayout])
    {
      id v4 = [(OBContentView *)self _defaultColorForCurrentTraitCollection];
      v7.receiver = self;
      v7.super_class = (Class)OBContentView;
      [(OBContentView *)&v7 setBackgroundColor:v4];

      v5 = [(OBContentView *)self _defaultColorForCurrentTraitCollection];
      id v6 = [(OBContentView *)self bleedView];
      [v6 setBackgroundColor:v5];
    }
  }
}

- (id)_defaultColorForCurrentTraitCollection
{
  v3 = [(OBContentView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2) {
    [(OBContentView *)self darkColor];
  }
  else {
  v5 = [(OBContentView *)self lightColor];
  }
  return v5;
}

- (BOOL)_colorIsDefault:(id)a3
{
  id v4 = a3;
  v5 = (CGColor *)[v4 CGColor];
  id v6 = [(OBContentView *)self darkColor];
  LOBYTE(v5) = CGColorEqualToColor(v5, (CGColorRef)[v6 CGColor]);

  id v7 = v4;
  objc_super v8 = (CGColor *)[v7 CGColor];

  id v9 = [(OBContentView *)self lightColor];
  LOBYTE(v7) = CGColorEqualToColor(v8, (CGColorRef)[v9 CGColor]);

  return v5 | v7;
}

- (UIView)bleedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bleedView);
  return (UIView *)WeakRetained;
}

- (void)setLightColor:(id)a3
{
}

- (void)setDarkColor:(id)a3
{
}

- (BOOL)aboveHeaderLayout
{
  return self->_aboveHeaderLayout;
}

- (void)setAboveHeaderLayout:(BOOL)a3
{
  self->_aboveHeaderLayout = a3;
}

- (BOOL)customizedBackgroundColor
{
  return self->_customizedBackgroundColor;
}

- (void)setCustomizedBackgroundColor:(BOOL)a3
{
  self->_customizedBackgroundColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkColor, 0);
  objc_storeStrong((id *)&self->_lightColor, 0);
  objc_destroyWeak((id *)&self->_bleedView);
}

@end