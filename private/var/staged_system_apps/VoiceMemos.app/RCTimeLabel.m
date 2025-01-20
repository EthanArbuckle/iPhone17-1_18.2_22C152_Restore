@interface RCTimeLabel
- (BOOL)usesIntrinsicHeightSetting;
- (CGSize)intrinsicContentSize;
- (double)intrinsicHeight;
- (double)labelYOffset;
- (void)drawTextInRect:(CGRect)a3;
- (void)setIntrinsicHeight:(double)a3;
- (void)setLabelYOffset:(double)a3;
- (void)setUsesIntrinsicHeightSetting:(BOOL)a3;
@end

@implementation RCTimeLabel

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)RCTimeLabel;
  [(RCTimeLabel *)&v10 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  if ([(RCTimeLabel *)self usesIntrinsicHeightSetting])
  {
    [(RCTimeLabel *)self intrinsicHeight];
    double v6 = v7;
  }
  double v8 = v4;
  double v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)usesIntrinsicHeightSetting
{
  return self->usesIntrinsicHeightSetting;
}

- (double)intrinsicHeight
{
  return self->_intrinsicHeight;
}

- (void)setUsesIntrinsicHeightSetting:(BOOL)a3
{
  self->usesIntrinsicHeightSetting = a3;
}

- (void)setLabelYOffset:(double)a3
{
  self->_labelYOffset = a3;
}

- (void)setIntrinsicHeight:(double)a3
{
  self->_intrinsicHeight = a3;
  [(RCTimeLabel *)self invalidateIntrinsicContentSize];
}

- (double)labelYOffset
{
  return self->_labelYOffset;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(RCTimeLabel *)self labelYOffset];
  v9.receiver = self;
  v9.super_class = (Class)RCTimeLabel;
  -[RCTimeLabel drawTextInRect:](&v9, "drawTextInRect:", x, y - v8, width, height);
}

@end