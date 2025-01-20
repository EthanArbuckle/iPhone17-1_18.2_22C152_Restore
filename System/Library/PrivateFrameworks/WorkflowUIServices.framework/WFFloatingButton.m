@interface WFFloatingButton
+ (Class)layerClass;
- (CGSize)intrinsicContentSize;
- (WFFloatingButton)initWithConfiguration:(id)a3;
- (WFFloatingButton)initWithConfiguration:(id)a3 frame:(CGRect)a4;
- (WFFloatingButton)initWithFrame:(CGRect)a3;
- (WFGradient)gradient;
- (void)applyConfiguration:(id)a3;
- (void)setGradient:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFFloatingButton

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFFloatingButton;
  [(WFFloatingButton *)&v6 traitCollectionDidChange:a3];
  v4 = [(WFFloatingButton *)self layer];
  v5 = [(WFFloatingButton *)self traitCollection];
  [v4 setTraitCollection:v5];
}

- (CGSize)intrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)WFFloatingButton;
  [(WFFloatingButton *)&v4 intrinsicContentSize];
  if (v3 < 36.0) {
    double v3 = 36.0;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)applyConfiguration:(id)a3
{
  id v15 = a3;
  [v15 titleFontSize];
  double v5 = v4;
  int v6 = [v15 boldTitle];
  if (v5 != 0.0 || v6 != 0)
  {
    int v8 = v6;
    if (v5 == 0.0)
    {
      v9 = [(WFFloatingButton *)self titleLabel];
      v10 = [v9 font];
      [v10 pointSize];
      double v5 = v11;
    }
    if (v8) {
      [MEMORY[0x263F81708] boldSystemFontOfSize:v5];
    }
    else {
    v12 = [MEMORY[0x263F81708] systemFontOfSize:v5];
    }
    v13 = [(WFFloatingButton *)self titleLabel];
    [v13 setFont:v12];
  }
  v14 = [(WFFloatingButton *)self layer];
  [v14 applyConfiguration:v15];
}

- (void)setGradient:(id)a3
{
  id v4 = a3;
  id v5 = [(WFFloatingButton *)self layer];
  [v5 setGradient:v4];
}

- (WFGradient)gradient
{
  double v2 = [(WFFloatingButton *)self layer];
  double v3 = [v2 gradient];

  return (WFGradient *)v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFFloatingButton;
  -[WFFloatingButton setHighlighted:](&v6, sel_setHighlighted_);
  id v5 = [(WFFloatingButton *)self layer];
  [v5 setPressed:v3];
}

- (WFFloatingButton)initWithConfiguration:(id)a3
{
  return -[WFFloatingButton initWithConfiguration:frame:](self, "initWithConfiguration:frame:", a3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (WFFloatingButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v8 = objc_opt_new();
  v9 = -[WFFloatingButton initWithConfiguration:frame:](self, "initWithConfiguration:frame:", v8, x, y, width, height);

  return v9;
}

- (WFFloatingButton)initWithConfiguration:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFFloatingButton;
  v10 = -[WFFloatingButton initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  double v11 = v10;
  if (v10)
  {
    [(WFFloatingButton *)v10 setAdjustsImageWhenHighlighted:0];
    v12 = [MEMORY[0x263F825C8] whiteColor];
    [(WFFloatingButton *)v11 setTintColor:v12];

    -[WFFloatingButton setContentEdgeInsets:](v11, "setContentEdgeInsets:", 0.0, 20.0, 0.0, 20.0);
    v13 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    v14 = [(WFFloatingButton *)v11 titleLabel];
    [v14 setFont:v13];

    [(WFFloatingButton *)v11 applyConfiguration:v9];
    id v15 = [(WFFloatingButton *)v11 layer];
    v16 = [(WFFloatingButton *)v11 traitCollection];
    [v15 setTraitCollection:v16];

    v17 = v11;
  }

  return v11;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end