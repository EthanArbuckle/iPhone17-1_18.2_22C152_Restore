@interface SXParallaxFadeScene
- (BOOL)userControllable;
- (Class)handlerClass;
@end

@implementation SXParallaxFadeScene

- (Class)handlerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)userControllable
{
  return 1;
}

@end