@interface BannerContentSpacerView
- (BannerContentSpacerView)initWithFrame:(CGRect)a3;
- (double)minLength;
- (id)accessibilityIdentifier;
- (int64_t)axis;
- (void)setAxis:(int64_t)a3;
- (void)setMinLength:(double)a3;
@end

@implementation BannerContentSpacerView

- (BannerContentSpacerView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BannerContentSpacerView;
  result = -[BannerContentSpacerView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_axis = -1;
  }
  return result;
}

- (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (double)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(double)a3
{
  self->_minLength = a3;
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

@end