@interface NWKUIAQISegmentView
- (BOOL)isActive;
- (NWKUIAQISegmentView)initWithColor:(id)a3 active:(BOOL)a4 mode:(unint64_t)a5;
- (UIColor)color;
- (unint64_t)mode;
- (void)layoutSubviews;
@end

@implementation NWKUIAQISegmentView

- (NWKUIAQISegmentView)initWithColor:(id)a3 active:(BOOL)a4 mode:(unint64_t)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NWKUIAQISegmentView;
  v10 = -[NWKUIAQISegmentView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_color, a3);
    v11->_active = v6;
    v11->_mode = a5;
    double v12 = 0.3;
    if (v6) {
      double v12 = 1.0;
    }
    [(NWKUIAQISegmentView *)v11 setAlpha:v12];
    uint64_t v13 = 15;
    uint64_t v14 = 3;
    if (a5 == 2) {
      uint64_t v13 = 3;
    }
    if (a5) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = 12;
    }
    id v16 = objc_alloc_init(MEMORY[0x263F157E8]);
    objc_msgSend(v16, "setAnchorPoint:", 0.0, 0.0);
    id v17 = v9;
    objc_msgSend(v16, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));
    uint64_t v18 = *MEMORY[0x263F15A20];
    [v16 setCornerCurve:*MEMORY[0x263F15A20]];
    [v16 setCornerRadius:2.0];
    [v16 setMaskedCorners:v15];
    v19 = [(NWKUIAQISegmentView *)v11 layer];
    [v19 addSublayer:v16];

    objc_storeStrong((id *)&v11->_bodyLayer, v16);
    if (a5)
    {
      if (a5 == 1)
      {
LABEL_15:

        goto LABEL_16;
      }
      if (a5 == 2) {
        uint64_t v14 = 12;
      }
      else {
        uint64_t v14 = 0;
      }
    }
    v20 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    -[CALayer setAnchorPoint:](v20, "setAnchorPoint:", 0.0, 0.0);
    -[CALayer setBackgroundColor:](v20, "setBackgroundColor:", [v17 CGColor]);
    [(CALayer *)v20 setCornerCurve:v18];
    [(CALayer *)v20 setMaskedCorners:v14];
    v21 = [(NWKUIAQISegmentView *)v11 layer];
    [v21 addSublayer:v20];

    capLayer = v11->_capLayer;
    v11->_capLayer = v20;

    goto LABEL_15;
  }
LABEL_16:

  return v11;
}

- (void)layoutSubviews
{
  [(NWKUIAQISegmentView *)self bounds];
  double x = v22.origin.x;
  double y = v22.origin.y;
  double width = v22.size.width;
  double height = v22.size.height;
  CGFloat v7 = CGRectGetWidth(v22);
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  CGFloat v8 = CGRectGetHeight(v23);
  if (v8 != self->_lastLayoutHeight)
  {
    self->_lastLayoutHeight = v8;
    double v9 = floor(v8 * 0.75 + v8 * 0.75 + 0.5) * 0.5;
    unint64_t v10 = [(NWKUIAQISegmentView *)self mode];
    double v20 = v7;
    double v18 = v9;
    if (v10 == 2)
    {
      double v11 = v8 - v9;
      double v12 = 0.0;
      double v13 = 0.0;
    }
    else
    {
      double v11 = height;
      CGFloat v7 = width;
      double v12 = y;
      double v13 = x;
      if (!v10)
      {
        double v11 = v8 - v9;
        double v13 = 0.0;
        CGFloat v7 = v20;
        double v12 = v9;
      }
    }
    double v19 = v11;
    double v14 = v7;
    double v15 = v12;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    -[CALayer setFrame:](self->_bodyLayer, "setFrame:", v13, v15, v14, v19);
    [MEMORY[0x263F158F8] commit];
    if (self->_capLayer)
    {
      unint64_t v16 = [(NWKUIAQISegmentView *)self mode];
      if (v16 == 2)
      {
        double height = v18;
        double y = v8 - v18;
        double x = 0.0;
        double width = v20;
      }
      else if (!v16)
      {
        double x = 0.0;
        double y = 0.0;
        double width = v20;
        double height = v18;
      }
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      [(CALayer *)self->_capLayer setCornerRadius:v20 * 0.5];
      -[CALayer setFrame:](self->_capLayer, "setFrame:", x, y, width, height);
      id v17 = (void *)MEMORY[0x263F158F8];
      [v17 commit];
    }
  }
}

- (UIColor)color
{
  return (UIColor *)objc_getProperty(self, a2, 440, 1);
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_capLayer, 0);
  objc_storeStrong((id *)&self->_bodyLayer, 0);
}

@end