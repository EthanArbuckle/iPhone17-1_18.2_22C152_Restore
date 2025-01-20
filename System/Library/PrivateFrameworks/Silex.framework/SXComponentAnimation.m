@interface SXComponentAnimation
- (Class)handlerClass;
- (int)transitionBehavior;
@end

@implementation SXComponentAnimation

- (int)transitionBehavior
{
  return [(SXComponentAnimation *)self userControllable] ^ 1;
}

- (Class)handlerClass
{
  return (Class)objc_opt_class();
}

@end