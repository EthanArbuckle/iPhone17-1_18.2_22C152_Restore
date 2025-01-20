@interface UIBasicCellContentView
@end

@implementation UIBasicCellContentView

uint64_t __49___UIBasicCellContentView_initWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

uint64_t __41___UIBasicCellContentView_initWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

void __44___UIBasicCellContentView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = 3;
    if (!a2) {
      uint64_t v4 = 1;
    }
    id v5 = *(id *)((char *)WeakRetained + OBJC_IVAR____UIBasicCellContentView__configuration[v4]);
    if (WeakRetained[55] != v5)
    {
      v6 = (char *)WeakRetained;
      -[_UIBasicCellContentView _applyConfiguration:](WeakRetained, v5);
      WeakRetained = (id *)v6;
    }
  }
}

void __44___UIBasicCellContentView_setConfiguration___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[52];
    WeakRetained[52] = 0;

    v2 = (void *)WeakRetained[51];
    WeakRetained[51] = 0;
  }
}

uint64_t __44___UIBasicCellContentView_setConfiguration___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationCompletedWithPosition:");
}

uint64_t __47___UIBasicCellContentView_becomeFirstResponder__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

@end