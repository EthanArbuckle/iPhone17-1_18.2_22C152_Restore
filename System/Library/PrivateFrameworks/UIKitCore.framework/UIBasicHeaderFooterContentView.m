@interface UIBasicHeaderFooterContentView
@end

@implementation UIBasicHeaderFooterContentView

uint64_t __57___UIBasicHeaderFooterContentView_initWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

uint64_t __49___UIBasicHeaderFooterContentView_initWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

void __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = 2;
    if (!a2) {
      uint64_t v4 = 1;
    }
    id v5 = *(id *)((char *)WeakRetained + OBJC_IVAR____UIBasicHeaderFooterContentView__configuration[v4]);
    if (WeakRetained[54] != v5)
    {
      v6 = (char *)WeakRetained;
      -[_UIBasicHeaderFooterContentView _applyConfiguration:](WeakRetained, v5);
      WeakRetained = (id *)v6;
    }
  }
}

void __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke_2(uint64_t a1)
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

uint64_t __52___UIBasicHeaderFooterContentView_setConfiguration___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationCompletedWithPosition:");
}

@end