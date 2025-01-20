@interface UIViewControllerKeyboardAnimationStyle
@end

@implementation UIViewControllerKeyboardAnimationStyle

void __59___UIViewControllerKeyboardAnimationStyle_initWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  [*(id *)(a1 + 32) setIsAnimationCompleting:1];
  v5 = [*(id *)(a1 + 32) previousCompleteHandler];

  if (v5)
  {
    v6 = [*(id *)(a1 + 32) previousCompleteHandler];
    ((void (**)(void, id, uint64_t))v6)[2](v6, v7, a3);
  }
  else
  {
    [v7 _setWillCompleteHandler:0];
  }
}

uint64_t __111___UIViewControllerKeyboardAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchAnimation:*(void *)(a1 + 48) afterStarted:*(void *)(a1 + 56) completion:*(void *)(a1 + 64) forHost:*(void *)(a1 + 40) fromCurrentPosition:*(unsigned __int8 *)(a1 + 72)];
}

uint64_t __112___UIViewControllerKeyboardAnimationStyle__launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __112___UIViewControllerKeyboardAnimationStyle__launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 isCancelled]) {
    [*(id *)(a1 + 32) setInteractivelyCancelled:1];
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

@end