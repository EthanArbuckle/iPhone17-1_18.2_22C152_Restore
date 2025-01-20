@interface WTTextPlaceholderController
@end

@implementation WTTextPlaceholderController

void __95___WTTextPlaceholderController__insertPlaceholderAndBeginShimmerWithCaretRect_placeholderSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;
    id v6 = v3;

    objc_msgSend(*(id *)(a1 + 32), "_beginShowingShimmerHighlightsWithCaretRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __95___WTTextPlaceholderController__insertPlaceholderAndBeginShimmerWithCaretRect_placeholderSize___block_invoke_2;
    v9[3] = &unk_26558E780;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v3;
    long long v7 = *(_OWORD *)(a1 + 56);
    long long v11 = *(_OWORD *)(a1 + 40);
    long long v12 = v7;
    id v8 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

uint64_t __95___WTTextPlaceholderController__insertPlaceholderAndBeginShimmerWithCaretRect_placeholderSize___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);

  return objc_msgSend(v2, "_beginShowingShimmerHighlightsWithCaretRect:", v3, v4, v5, v6);
}

void __79___WTTextPlaceholderController__visualRectsForRects_containerBounds_caretRect___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  BOOL v7 = [v5 count] - 1 == a3;
  double v8 = *(double *)(a1 + 80);
  [*(id *)(a1 + 40) _widthRatioForIteration:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) isFinal:v7];
  double v10 = v8 * v9;
  [v6 rect];
  double MinX = CGRectGetMinX(v24);
  [v6 rect];
  double MinY = CGRectGetMinY(v25);
  [v6 rect];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  double Height = CGRectGetHeight(v26);
  if (*(void *)(a1 + 96) == 1) {
    double MinX = *(double *)(a1 + 80) - v10;
  }
  v22 = *(void **)(a1 + 48);
  v23 = +[WTTextSelectionRect rectWithRect:](WTTextSelectionRect, "rectWithRect:", MinX, MinY + 1.5, v10, Height + -1.5 + -1.5);
  [v22 addObject:v23];

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

uint64_t __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  BOOL v7 = WeakRetained;
  if (WeakRetained[2])
  {
    objc_msgSend(WeakRetained[1], "removeTextPlaceholder:");
    id v4 = v7[2];
    v7[2] = 0;

    double v3 = v7;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id *))(v5 + 16))(v5, v3);
  }

  return MEMORY[0x270F9A758]();
}

void __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke_2(uint64_t a1)
{
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  uint64_t v4 = WeakRetained[2];
  if (v4)
  {
    uint64_t v5 = (void *)WeakRetained[1];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke_3;
    v8[3] = &unk_26558E690;
    v8[4] = WeakRetained;
    id v9 = *(id *)(a1 + 32);
    [v5 removeTextPlaceholder:v4 willInsertText:v6 completionHandler:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

void __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke_3(uint64_t a1)
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    double v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;

    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke_4;
    v7[3] = &unk_26558E690;
    uint64_t v6 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

uint64_t __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __75___WTTextPlaceholderController_endPlaceholderAndWillInsertText_completion___block_invoke_5(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = (void *)WeakRetained[2];
  id v5 = WeakRetained;
  WeakRetained[2] = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

void __75___WTTextPlaceholderController__endShowingShimmerHighlightsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)*((void *)WeakRetained + 8);
  *((void *)WeakRetained + 8) = 0;

  [*((id *)WeakRetained + 3) removeFromSuperview];
  double v3 = (void *)*((void *)WeakRetained + 3);
  *((void *)WeakRetained + 3) = 0;

  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 18);
  uint64_t v4 = (void *)[*((id *)WeakRetained + 6) copy];
  [*((id *)WeakRetained + 6) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 18);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end