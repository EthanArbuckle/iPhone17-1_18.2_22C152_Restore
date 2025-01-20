@interface BSUIProfileImageBox
- (Class)layoutClass;
- (UIColor)maskColor;
- (double)cornerRadius;
- (void)setCornerRadius:(double)a3;
- (void)setMaskColor:(id)a3;
@end

@implementation BSUIProfileImageBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIColor)maskColor
{
  return self->_maskColor;
}

- (void)setMaskColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end