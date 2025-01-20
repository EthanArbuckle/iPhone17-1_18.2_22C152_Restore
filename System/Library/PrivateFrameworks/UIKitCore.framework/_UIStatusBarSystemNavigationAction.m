@interface _UIStatusBarSystemNavigationAction
+ (id)_navigationActionForDestination:(unint64_t)a3;
+ (id)backNavigationAction;
+ (id)forwardNavigationAction;
- (unint64_t)destination;
- (void)setDestination:(unint64_t)a3;
@end

@implementation _UIStatusBarSystemNavigationAction

+ (id)_navigationActionForDestination:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70___UIStatusBarSystemNavigationAction__navigationActionForDestination___block_invoke;
  v5[3] = &__block_descriptor_40_e22_B16__0___UIStatusBar_8l;
  v5[4] = a3;
  v3 = [a1 actionWithBlock:v5];
  return v3;
}

+ (id)backNavigationAction
{
  return (id)[a1 _navigationActionForDestination:0];
}

+ (id)forwardNavigationAction
{
  return (id)[a1 _navigationActionForDestination:1];
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

@end