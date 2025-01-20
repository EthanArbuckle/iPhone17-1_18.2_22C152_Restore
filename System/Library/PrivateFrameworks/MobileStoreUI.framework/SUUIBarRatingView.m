@interface SUUIBarRatingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIBarRatingView)initWithFrame:(CGRect)a3;
- (float)ratingValue;
- (int64_t)barRatingStyle;
- (int64_t)numberOfBars;
- (void)drawRect:(CGRect)a3;
- (void)setBarRatingStyle:(int64_t)a3;
- (void)setNumberOfBars:(int64_t)a3;
- (void)setRatingValue:(float)a3;
@end

@implementation SUUIBarRatingView

- (SUUIBarRatingView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIBarRatingView;
  result = -[SUUIBarRatingView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_numberOfBars = 11;
  }
  return result;
}

- (void)setBarRatingStyle:(int64_t)a3
{
  if (self->_barRatingStyle != a3)
  {
    self->_barRatingStyle = a3;
    [(SUUIBarRatingView *)self setNeedsDisplay];
  }
}

- (void)setNumberOfBars:(int64_t)a3
{
  if (self->_numberOfBars != a3)
  {
    self->_numberOfBars = a3;
    [(SUUIBarRatingView *)self setNeedsDisplay];
  }
}

- (void)setRatingValue:(float)a3
{
  if (self->_ratingValue != a3)
  {
    self->_ratingValue = a3;
    [(SUUIBarRatingView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  id v18 = [(SUUIBarRatingView *)self tintColor];
  objc_super v4 = [v18 colorWithAlphaComponent:0.15];
  v5 = [v18 colorWithAlphaComponent:0.45];
  int64_t numberOfBars = self->_numberOfBars;
  float v7 = ceilf(self->_ratingValue * (float)numberOfBars);
  if (v7 > (float)numberOfBars) {
    float v7 = (float)numberOfBars;
  }
  if (numberOfBars >= 1)
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t)v7;
    double v10 = 0.0;
    do
    {
      if (v8 >= v9) {
        v11 = v4;
      }
      else {
        v11 = v5;
      }
      [v11 set];
      int64_t barRatingStyle = self->_barRatingStyle;
      if (barRatingStyle) {
        double v13 = 1.0;
      }
      else {
        double v13 = 3.0;
      }
      if (barRatingStyle) {
        double v14 = 13.0;
      }
      else {
        double v14 = 10.0;
      }
      uint64_t v15 = 0;
      double v16 = v10;
      double v17 = v13;
      UIRectFillUsingBlendMode(*(CGRect *)(&v14 - 3), kCGBlendModeNormal);
      double v10 = v10 + v13 + 1.0;
      ++v8;
    }
    while (v8 < self->_numberOfBars);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t numberOfBars = self->_numberOfBars;
  double v4 = (double)numberOfBars;
  int64_t barRatingStyle = self->_barRatingStyle;
  uint64_t v6 = numberOfBars - 1;
  double v7 = 1.0;
  if (!barRatingStyle) {
    double v7 = 3.0;
  }
  double v8 = (float)v6 + v4 * v7;
  double v9 = 13.0;
  if (!barRatingStyle) {
    double v9 = 10.0;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)barRatingStyle
{
  return self->_barRatingStyle;
}

- (int64_t)numberOfBars
{
  return self->_numberOfBars;
}

- (float)ratingValue
{
  return self->_ratingValue;
}

@end