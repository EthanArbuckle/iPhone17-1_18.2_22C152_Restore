@interface WFCircularImageView
- (BOOL)hasBorder;
- (BOOL)isCircular;
- (WFCircularImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setCircular:(BOOL)a3;
- (void)setHasBorder:(BOOL)a3;
@end

@implementation WFCircularImageView

- (void)setHasBorder:(BOOL)a3
{
  self->_hasBorder = a3;
}

- (BOOL)hasBorder
{
  return self->_hasBorder;
}

- (void)setCircular:(BOOL)a3
{
  self->_circular = a3;
}

- (BOOL)isCircular
{
  return self->_circular;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)WFCircularImageView;
  [(WFCircularImageView *)&v10 layoutSubviews];
  double v3 = 5.0;
  if ([(WFCircularImageView *)self isCircular])
  {
    [(WFCircularImageView *)self bounds];
    double v3 = v4 * 0.5;
  }
  v5 = [(WFCircularImageView *)self layer];
  [v5 setCornerRadius:v3];

  double v6 = 0.0;
  if ([(WFCircularImageView *)self isCircular] && [(WFCircularImageView *)self hasBorder])
  {
    v5 = [MEMORY[0x263F82B60] mainScreen];
    [v5 scale];
    int v7 = 1;
    double v6 = 1.0 / v8;
  }
  else
  {
    int v7 = 0;
  }
  v9 = [(WFCircularImageView *)self layer];
  [v9 setBorderWidth:v6];

  if (v7) {
}
  }

- (WFCircularImageView)initWithFrame:(CGRect)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)WFCircularImageView;
  double v3 = -[WFCircularImageView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(WFCircularImageView *)v3 setClipsToBounds:1];
    [(WFCircularImageView *)v4 setContentMode:2];
    id v5 = [MEMORY[0x263F825C8] separatorColor];
    uint64_t v6 = [v5 CGColor];
    int v7 = [(WFCircularImageView *)v4 layer];
    [v7 setBorderColor:v6];

    double v8 = (void *)MEMORY[0x263F08938];
    v9 = [(WFCircularImageView *)v4 widthAnchor];
    objc_super v10 = [(WFCircularImageView *)v4 heightAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v16[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v8 activateConstraints:v12];

    v13 = v4;
  }

  return v4;
}

@end