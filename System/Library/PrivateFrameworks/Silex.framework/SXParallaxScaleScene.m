@interface SXParallaxScaleScene
- (BOOL)userControllable;
- (Class)handlerClass;
@end

@implementation SXParallaxScaleScene

- (Class)handlerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)userControllable
{
  return 1;
}

@end