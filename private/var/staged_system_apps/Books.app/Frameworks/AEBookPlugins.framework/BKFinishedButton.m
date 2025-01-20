@interface BKFinishedButton
- (BKFinishedButton)initWithCoder:(id)a3;
- (BKFinishedButton)initWithFrame:(CGRect)a3;
- (UIColor)frameColor;
- (double)frameWidth;
- (void)setFrameColor:(id)a3;
- (void)setFrameWidth:(double)a3;
@end

@implementation BKFinishedButton

- (BKFinishedButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKFinishedButton;
  v3 = -[BKFinishedButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(BKFinishedButton *)v3 setClipsToBounds:1];
  }
  return v4;
}

- (BKFinishedButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKFinishedButton;
  v3 = [(BKFinishedButton *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(BKFinishedButton *)v3 setClipsToBounds:1];
  }
  return v4;
}

- (void)setFrameWidth:(double)a3
{
  if (self->_frameWidth != a3)
  {
    self->_frameWidth = a3;
    [(BKFinishedButton *)self frameWidth];
    double v5 = v4;
    id v6 = [(BKFinishedButton *)self layer];
    [v6 setBorderWidth:v5];
  }
}

- (void)setFrameColor:(id)a3
{
  v7 = (UIColor *)a3;
  if (self->_frameColor != v7)
  {
    objc_storeStrong((id *)&self->_frameColor, a3);
    double v5 = [(UIColor *)v7 CGColor];
    id v6 = [(BKFinishedButton *)self layer];
    [v6 setBorderColor:v5];
  }
}

- (double)frameWidth
{
  return self->_frameWidth;
}

- (UIColor)frameColor
{
  return self->_frameColor;
}

- (void).cxx_destruct
{
}

@end