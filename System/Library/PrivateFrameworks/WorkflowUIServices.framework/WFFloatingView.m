@interface WFFloatingView
+ (Class)layerClass;
- (BOOL)isPressed;
- (WFFloatingView)initWithConfiguration:(id)a3;
- (WFFloatingView)initWithConfiguration:(id)a3 frame:(CGRect)a4;
- (WFFloatingView)initWithFrame:(CGRect)a3;
- (WFGradient)gradient;
- (void)applyConfiguration:(id)a3;
- (void)setGradient:(id)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFFloatingView

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFFloatingView;
  [(WFFloatingView *)&v6 traitCollectionDidChange:a3];
  v4 = [(WFFloatingView *)self layer];
  v5 = [(WFFloatingView *)self traitCollection];
  [v4 setTraitCollection:v5];
}

- (void)applyConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(WFFloatingView *)self layer];
  [v5 applyConfiguration:v4];
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(WFFloatingView *)self layer];
  [v6 setPressed:v5 animated:v4];
}

- (void)setPressed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFFloatingView *)self layer];
  [v4 setPressed:v3];
}

- (BOOL)isPressed
{
  v2 = [(WFFloatingView *)self layer];
  char v3 = [v2 isPressed];

  return v3;
}

- (void)setGradient:(id)a3
{
  id v4 = a3;
  id v5 = [(WFFloatingView *)self layer];
  [v5 setGradient:v4];
}

- (WFGradient)gradient
{
  v2 = [(WFFloatingView *)self layer];
  char v3 = [v2 gradient];

  return (WFGradient *)v3;
}

- (WFFloatingView)initWithConfiguration:(id)a3
{
  return -[WFFloatingView initWithConfiguration:frame:](self, "initWithConfiguration:frame:", a3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (WFFloatingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_opt_new();
  v9 = -[WFFloatingView initWithConfiguration:frame:](self, "initWithConfiguration:frame:", v8, x, y, width, height);

  return v9;
}

- (WFFloatingView)initWithConfiguration:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFFloatingView;
  v10 = -[WFFloatingView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(WFFloatingView *)v10 applyConfiguration:v9];
    v12 = [(WFFloatingView *)v11 layer];
    v13 = [(WFFloatingView *)v11 traitCollection];
    [v12 setTraitCollection:v13];

    v14 = v11;
  }

  return v11;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end