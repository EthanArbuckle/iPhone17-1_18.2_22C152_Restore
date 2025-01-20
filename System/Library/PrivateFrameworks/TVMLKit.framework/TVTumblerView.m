@interface TVTumblerView
@end

@implementation TVTumblerView

uint64_t __32___TVTumblerView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  v2 = [*(id *)(a1 + 48) arrowLeading];
  if ([*(id *)(a1 + 48) focusedItemIndex] <= 0) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];

  v4 = [*(id *)(a1 + 48) arrowTrailing];
  if ([*(id *)(a1 + 48) focusedItemIndex] >= *(void *)(a1 + 120) - 1) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [v4 setAlpha:v5];

  v6 = *(void **)(a1 + 48);
  return [v6 performSelector:sel__enableMove withObject:0 afterDelay:0.1];
}

uint64_t __32___TVTumblerView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) focusedItemIndex] != *(void *)(a1 + 48)) {
    [*(id *)(a1 + 32) _markItemViewForReuse:*(void *)(a1 + 40)];
  }
  uint64_t result = [*(id *)(a1 + 32) unfocusedItemIndex];
  if (result == *(void *)(a1 + 48))
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 setUnfocusedItemIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  return result;
}

void __40___TVTumblerView__markItemViewForReuse___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

@end