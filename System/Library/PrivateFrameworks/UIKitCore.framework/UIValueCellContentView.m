@interface UIValueCellContentView
@end

@implementation UIValueCellContentView

uint64_t __49___UIValueCellContentView_initWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

uint64_t __41___UIValueCellContentView_initWithCoder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConfiguration:*(void *)(a1 + 40)];
}

void __44___UIValueCellContentView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = 2;
    if (!a2) {
      uint64_t v4 = 1;
    }
    id v5 = *(id *)((char *)WeakRetained + OBJC_IVAR____UIValueCellContentView__configuration[v4]);
    if (WeakRetained[54] != v5)
    {
      v6 = (char *)WeakRetained;
      -[_UIValueCellContentView _applyConfiguration:](WeakRetained, v5);
      WeakRetained = (id *)v6;
    }
  }
}

void __44___UIValueCellContentView_setConfiguration___block_invoke_2(uint64_t a1)
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

uint64_t __44___UIValueCellContentView_setConfiguration___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationCompletedWithPosition:");
}

uint64_t __92___UIValueCellContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40) == 1) {
    [*(id *)(a1 + 32) setNumberOfLines:2];
  }
  double v2 = *(double *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "setBounds:", 0.0, 0.0, v2, 99999.0);
}

void __92___UIValueCellContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumberOfLines:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 88)
    || ([*(id *)(a1 + 40) _isInLayoutSubviews] & 1) == 0
    && ([*(id *)(a1 + 40) layer],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 needsLayout],
        v10,
        (v11 & 1) == 0))
  {
    [*(id *)(a1 + 40) bounds];
    if (v3 != *MEMORY[0x1E4F1DB30] || v2 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      double v5 = *(double *)(a1 + 56);
      double v6 = *(double *)(a1 + 64);
      double v7 = *(double *)(a1 + 72);
      double v8 = *(double *)(a1 + 80);
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v9, "setBounds:", v5, v6, v7, v8);
    }
  }
}

@end