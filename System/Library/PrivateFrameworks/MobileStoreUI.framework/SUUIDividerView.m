@interface SUUIDividerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)dividerSize;
- (int64_t)dividerOrientation;
- (void)setDividerColor:(id)a3;
- (void)setDividerOrientation:(int64_t)a3;
- (void)setDividerSize:(double)a3;
@end

@implementation SUUIDividerView

- (void)setDividerColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIDividerView;
  [(SUUIDividerView *)&v3 setBackgroundColor:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t dividerOrientation = self->_dividerOrientation;
  double dividerSize = self->_dividerSize;
  v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 scale];
  double v9 = 1.0 / v8;

  if (dividerSize >= 0.00000011920929) {
    double v10 = dividerSize;
  }
  else {
    double v10 = width;
  }
  if (dividerSize >= 0.00000011920929) {
    double v11 = dividerSize;
  }
  else {
    double v11 = height;
  }
  if (dividerOrientation) {
    double v10 = v9;
  }
  else {
    double v11 = v9;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (int64_t)dividerOrientation
{
  return self->_dividerOrientation;
}

- (void)setDividerOrientation:(int64_t)a3
{
  self->_int64_t dividerOrientation = a3;
}

- (double)dividerSize
{
  return self->_dividerSize;
}

- (void)setDividerSize:(double)a3
{
  self->_double dividerSize = a3;
}

@end