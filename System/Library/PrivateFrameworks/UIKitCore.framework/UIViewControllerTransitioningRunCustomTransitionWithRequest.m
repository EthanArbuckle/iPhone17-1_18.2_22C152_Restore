@interface UIViewControllerTransitioningRunCustomTransitionWithRequest
@end

@implementation UIViewControllerTransitioningRunCustomTransitionWithRequest

void ___UIViewControllerTransitioningRunCustomTransitionWithRequest_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___UIViewControllerTransitioningRunCustomTransitionWithRequest_block_invoke_3;
  v4[3] = &unk_1E52EA588;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  char v11 = *(unsigned char *)(a1 + 96);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 88);
  +[UIKeyboardSceneDelegate _pinInputViewsForKeyboardSceneDelegate:v2 onBehalfOfResponder:v3 duringBlock:v4];
}

uint64_t ___UIViewControllerTransitioningRunCustomTransitionWithRequest_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) handoffData];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      id v6 = *(void **)(a1 + 32);
      id v7 = *(id *)(a1 + 40);
      id v8 = [v6 handoffData];
      [v7 willBeginAfterPreemptionWithContext:v5 data:v8];
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 56) startInteractiveTransition:v9];
  }
  else {
    [*(id *)(a1 + 40) animateTransition:v9];
  }
  if (objc_opt_respondsToSelector())
  {
    id v10 = [*(id *)(a1 + 40) interruptibleAnimatorForTransition:*(void *)(a1 + 48)];

    if (v10)
    {
      if (!*(unsigned char *)(a1 + 80)) {
        [*(id *)(a1 + 48) _setInteractiveUpdateHandler:*(void *)(a1 + 64)];
      }
      [*(id *)(a1 + 48) _setInterruptible:1];
    }
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  return result;
}

uint64_t ___UIViewControllerTransitioningRunCustomTransitionWithRequest_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDisableAlongsideView:1];
  uint64_t v2 = *(void **)(a1 + 40);
  return objc_msgSend(v2, "__runAlongsideAnimations");
}

@end