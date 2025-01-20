@interface SXFadeComponentAnimation
- (Class)handlerClass;
- (int)transitionBehavior;
@end

@implementation SXFadeComponentAnimation

- (int)transitionBehavior
{
  return 1;
}

- (Class)handlerClass
{
  return (Class)objc_opt_class();
}

@end