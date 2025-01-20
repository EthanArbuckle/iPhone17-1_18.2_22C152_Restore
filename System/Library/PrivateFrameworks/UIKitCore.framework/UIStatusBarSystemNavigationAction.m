@interface UIStatusBarSystemNavigationAction
@end

@implementation UIStatusBarSystemNavigationAction

uint64_t __70___UIStatusBarSystemNavigationAction__navigationActionForDestination___block_invoke(uint64_t a1)
{
  v2 = [(id)UIApp _systemNavigationAction];
  uint64_t v3 = [v2 canSendResponse];
  if (v3) {
    [v2 sendResponseForDestination:*(void *)(a1 + 32)];
  }

  return v3;
}

@end