@interface TUIAspectBox
- (Class)layoutClass;
- (double)aspectRatio;
- (void)setAspectRatio:(double)a3;
@end

@implementation TUIAspectBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

@end