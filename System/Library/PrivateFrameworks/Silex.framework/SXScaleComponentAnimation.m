@interface SXScaleComponentAnimation
- (Class)handlerClass;
@end

@implementation SXScaleComponentAnimation

- (Class)handlerClass
{
  return (Class)objc_opt_class();
}

@end