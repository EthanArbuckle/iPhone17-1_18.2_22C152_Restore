@interface UITextFloatingCursorSession
@end

@implementation UITextFloatingCursorSession

uint64_t __69___UITextFloatingCursorSession_updateWithPoint_inContainer_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __69___UITextFloatingCursorSession_updateWithPoint_inContainer_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained _setCursorFadedHiddenForFloatingCursor:0 animated:0];

  v5 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v5 removeFromSuperview];
}

void __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke_2(uint64_t a1)
{
  id v11 = [*(id *)(*(void *)(a1 + 32) + 32) superview];
  [*(id *)(a1 + 40) frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = [*(id *)(a1 + 40) superview];
  objc_msgSend(v11, "convertRect:fromView:", v10, v3, v5, v7, v9);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setFrame:");
}

uint64_t __52___UITextFloatingCursorSession__invalidateAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end