@interface WFCompactPlatterSashView
+ (id)font;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (UILabel)label;
- (UIVisualEffectView)visualEffectView;
- (WFCompactAppearanceProvider)appearanceProvider;
- (WFCompactPlatterSashView)initWithFrame:(CGRect)a3;
- (WFIcon)icon;
- (WFIconHostingView)iconView;
- (double)contentBaseline;
- (void)layoutSubviews;
- (void)setAppearanceProvider:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation WFCompactPlatterSashView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (void)setIconView:(id)a3
{
}

- (WFIconHostingView)iconView
{
  return self->_iconView;
}

- (void)setLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (WFIcon)icon
{
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (void)setIcon:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_icon, a3);
  iconView = self->_iconView;
  if (!iconView)
  {
    v6 = (WFIconHostingView *)objc_msgSend(objc_alloc(MEMORY[0x263F879A8]), "initWithIcon:size:", v8, 20.0, 20.0);
    v7 = self->_iconView;
    self->_iconView = v6;

    [(WFCompactPlatterSashView *)self addSubview:self->_iconView];
    [(WFCompactPlatterSashView *)self setNeedsLayout];
    iconView = self->_iconView;
  }
  [(WFIconHostingView *)iconView setIcon:v8];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  title = self->_title;
  self->_title = v4;

  [(UILabel *)self->_label setText:v6];
}

- (void)setAppearanceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProvider, a3);
  id v5 = a3;
  id v7 = [(WFCompactPlatterSashView *)self label];
  id v6 = [(WFCompactPlatterSashView *)self iconView];
  [v5 configurePlatterSashView:v7 iconView:v6];
}

- (double)contentBaseline
{
  [(WFIconHostingView *)self->_iconView iconSize];
  double v3 = v2 + 10.0;
  v4 = [(id)objc_opt_class() font];
  [v4 _scaledValueForValue:15.0];
  double v6 = v5 + 10.0;

  if (v3 >= v6) {
    return v3;
  }
  else {
    return v6;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(WFIconHostingView *)self->_iconView iconSize];
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width - (v5 + 18.0), 1.79769313e308);
  double v7 = v6;
  [(WFIconHostingView *)self->_iconView iconSize];
  if (v8 + 18.0 >= v7) {
    double v9 = v8 + 18.0;
  }
  else {
    double v9 = v7;
  }
  double v10 = width;
  result.height = v9;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)WFCompactPlatterSashView;
  [(WFCompactPlatterSashView *)&v26 layoutSubviews];
  [(WFCompactPlatterSashView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(WFIconHostingView *)self->_iconView iconSize];
  CGFloat rect = v11;
  [(WFIconHostingView *)self->_iconView iconSize];
  double v13 = v12;
  double v14 = 22.0;
  if ([(WFCompactPlatterSashView *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.double width = v8;
    v27.size.height = v10;
    double Width = CGRectGetWidth(v27);
    [(WFIconHostingView *)self->_iconView iconSize];
    double v14 = Width - v16 + -18.0;
  }
  CGFloat v17 = v8;
  [(UILabel *)self->_label intrinsicContentSize];
  double v19 = v18;
  v28.origin.y = 18.0;
  v28.origin.x = v14;
  v28.size.double width = rect;
  v28.size.height = v13;
  double MaxX = CGRectGetMaxX(v28);
  if ([(WFCompactPlatterSashView *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.double width = v17;
    v29.size.height = v10;
    CGFloat v21 = CGRectGetWidth(v29) - v19;
    [(WFIconHostingView *)self->_iconView iconSize];
    double v23 = v21 - v22 + -18.0 + -8.0;
  }
  else
  {
    double v23 = MaxX + 8.0;
  }
  [(WFIconHostingView *)self->_iconView setFrame:v14];
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:", v23, (24.0 - v13) * -0.5 + 18.0, v19, 24.0);
  label = self->_label;
  [(UIVisualEffectView *)self->_visualEffectView bounds];
  -[UILabel setFrame:](label, "setFrame:");
}

- (WFCompactPlatterSashView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)WFCompactPlatterSashView;
  double v3 = -[WFCompactPlatterSashView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v4 = v3;
  if (v3)
  {
    double v5 = [(WFCompactPlatterSashView *)v3 layer];
    [v5 setAllowsGroupBlending:0];

    id v6 = objc_alloc(MEMORY[0x263F828E0]);
    double v7 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    CGFloat v8 = [MEMORY[0x263F825C8] labelColor];
    double v9 = [v8 colorWithAlphaComponent:0.5];
    [(UILabel *)v7 setTextColor:v9];

    CGFloat v10 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v7 setBackgroundColor:v10];

    double v11 = [(id)objc_opt_class() font];
    [(UILabel *)v7 setFont:v11];

    label = v4->_label;
    v4->_label = v7;
    double v13 = v7;

    double v14 = [MEMORY[0x263F824D8] effectWithStyle:8];
    v15 = [MEMORY[0x263F82DF0] effectForBlurEffect:v14 style:1];
    double v16 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v15];
    CGFloat v17 = [(UIVisualEffectView *)v16 contentView];
    [v17 addSubview:v13];

    visualEffectView = v4->_visualEffectView;
    v4->_visualEffectView = v16;
    double v19 = v16;

    [(WFCompactPlatterSashView *)v4 addSubview:v19];
    v20 = v4;
  }
  return v4;
}

+ (id)font
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v15 = *MEMORY[0x263F81850];
  double v2 = [NSNumber numberWithDouble:*MEMORY[0x263F81840]];
  v16[0] = v2;
  double v3 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

  uint64_t v4 = *MEMORY[0x263F835F0];
  uint64_t v5 = *MEMORY[0x263F817A0];
  v13[0] = *MEMORY[0x263F81798];
  v13[1] = v5;
  v14[0] = v4;
  v14[1] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  double v7 = (void *)[objc_alloc(MEMORY[0x263F81720]) initWithFontAttributes:v6];
  CGFloat v8 = [MEMORY[0x263F82770] defaultMetrics];
  [v8 scaledValueForValue:15.0];
  double v10 = round(v9);

  double v11 = objc_msgSend(MEMORY[0x263F81708], "fontWithDescriptor:size:", v7, fmin(fmax(v10, 15.0), 22.0));

  return v11;
}

@end