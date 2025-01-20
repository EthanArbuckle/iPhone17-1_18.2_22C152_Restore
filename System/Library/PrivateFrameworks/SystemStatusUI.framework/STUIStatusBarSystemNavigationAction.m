@interface STUIStatusBarSystemNavigationAction
+ (id)_navigationActionForDestination:(unint64_t)a3;
+ (id)backNavigationAction;
+ (id)forwardNavigationAction;
- (unint64_t)destination;
- (void)setDestination:(unint64_t)a3;
@end

@implementation STUIStatusBarSystemNavigationAction

+ (id)backNavigationAction
{
  return (id)[a1 _navigationActionForDestination:0];
}

+ (id)_navigationActionForDestination:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__STUIStatusBarSystemNavigationAction__navigationActionForDestination___block_invoke;
  v5[3] = &__block_descriptor_40_e23_B16__0__STUIStatusBar_8l;
  v5[4] = a3;
  v3 = [a1 actionWithBlock:v5];
  return v3;
}

uint64_t __71__STUIStatusBarSystemNavigationAction__navigationActionForDestination___block_invoke(uint64_t a1)
{
  v2 = [(id)*MEMORY[0x1E4FB2608] _systemNavigationAction];
  uint64_t v3 = [v2 canSendResponse];
  if (v3) {
    [v2 sendResponseForDestination:*(void *)(a1 + 32)];
  }

  return v3;
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