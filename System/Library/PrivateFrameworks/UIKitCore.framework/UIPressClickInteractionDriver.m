@interface UIPressClickInteractionDriver
@end

@implementation UIPressClickInteractionDriver

void __54___UIPressClickInteractionDriver__handlePressGesture___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    v9 = *(void **)(a1 + 32);
    [v9 cancelInteraction];
  }
  else if (!a2)
  {
    v3 = [*(id *)(a1 + 32) delegate];
    [v3 clickDriver:*(void *)(a1 + 32) didPerformEvent:0];

    v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      v6 = [*(id *)(a1 + 32) delegate];
      [v6 clickDriver:*(void *)(a1 + 32) didUpdateHighlightProgress:1.0];
    }
    v7 = [*(id *)(a1 + 32) delegate];
    [v7 clickDriver:*(void *)(a1 + 32) didPerformEvent:1];

    v8 = [*(id *)(a1 + 32) delegate];
    [v8 clickDriver:*(void *)(a1 + 32) didPerformEvent:2];

    id v10 = [*(id *)(a1 + 32) delegate];
    [v10 clickDriver:*(void *)(a1 + 32) didPerformEvent:3];
  }
}

@end