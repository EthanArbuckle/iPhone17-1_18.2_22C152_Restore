@interface STStorageProgressView
- (STStorageProgressView)initWithFrame:(CGRect)a3;
- (double)percent;
- (void)drawRect:(CGRect)a3;
- (void)setPercent:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateColors;
@end

@implementation STStorageProgressView

- (STStorageProgressView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STStorageProgressView;
  v3 = -[STStorageProgressView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(STStorageProgressView *)v3 setBackgroundColor:v4];

    [(STStorageProgressView *)v3 updateColors];
  }
  return v3;
}

- (void)updateColors
{
  v3 = [(STStorageProgressView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 2) {
    [MEMORY[0x263F1C550] systemDarkGrayColor];
  }
  else {
  v5 = [MEMORY[0x263F1C550] systemLightMidGrayColor];
  }
  objc_storeStrong((id *)&self->_grayColor, v5);

  if (v4 == 2) {
    [MEMORY[0x263F1C550] systemDarkLightMidGrayColor];
  }
  else {
  id v6 = [MEMORY[0x263F1C550] systemBlueColor];
  }
  objc_storeStrong((id *)&self->_blueColor, v6);
}

- (void)setPercent:(double)a3
{
  if (self->_percent != a3)
  {
    self->_percent = a3;
    [(STStorageProgressView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  [(STStorageProgressView *)self bounds];
  CGRect v20 = CGRectInset(v19, 2.0, 2.0);
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  double percent = self->_percent;
  if (percent > 0.0 && percent < 1.0)
  {
    double v13 = floor(height * 0.5);
    double v14 = x + width - v13;
    double v15 = y + v13;
    double v16 = percent * 6.28318531 + -1.57079633;
    v17 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v14, v15, v13);
    [v17 setLineWidth:4.0];
    [(UIColor *)self->_blueColor setStroke];
    [v17 stroke];
    v11 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v14, v15, v13, v16, 4.71238898);

    [v11 setLineWidth:4.0];
    v12 = &OBJC_IVAR___STStorageProgressView__grayColor;
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", x, y, width, height);
    [v11 setLineWidth:4.0];
    v12 = &OBJC_IVAR___STStorageProgressView__grayColor;
    if (self->_percent > 0.0) {
      v12 = &OBJC_IVAR___STStorageProgressView__blueColor;
    }
  }
  [*(id *)((char *)&self->super.super.super.isa + *v12) setStroke];
  [v11 stroke];

  UIGraphicsPopContext();
}

- (double)percent
{
  return self->_percent;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STStorageProgressView;
  [(STStorageProgressView *)&v4 traitCollectionDidChange:a3];
  [(STStorageProgressView *)self updateColors];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blueColor, 0);

  objc_storeStrong((id *)&self->_grayColor, 0);
}

@end