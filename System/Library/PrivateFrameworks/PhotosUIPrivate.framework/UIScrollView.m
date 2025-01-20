@interface UIScrollView
@end

@implementation UIScrollView

uint64_t __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pu_beginPageSwipeTest:", *(void *)(a1 + 40));
}

uint64_t __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pu_incrementForPageSwipeTest:dt:stop:", *(void *)(a1 + 40), a2);
}

uint64_t __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pu_endPageSwipeTest:", *(void *)(a1 + 40));
}

uint64_t __77__UIScrollView_PhotosUI__pu_ppt_scrollToContentOffset_withCompletionHandler___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  [*(id *)(a1 + 32) contentOffset];
  double v7 = v6;
  double v8 = (*(double (**)(void))(*(void *)(a1 + 40) + 16))();
  double v9 = (*(double (**)(double, double, double))(*(void *)(a1 + 40) + 16))(v7, *(double *)(a1 + 56) * a3, *(double *)(a1 + 72));
  PXPointRoundToPixel();
  [*(id *)(a1 + 32) contentOffset];
  PXPointRoundToPixel();
  uint64_t result = PXPointApproximatelyEqualToPoint();
  if (result)
  {
    *a2 = 1;
  }
  else
  {
    v11 = *(void **)(a1 + 32);
    return objc_msgSend(v11, "setContentOffset:animated:", 0, v8, v9);
  }
  return result;
}

double __77__UIScrollView_PhotosUI__pu_ppt_scrollToContentOffset_withCompletionHandler___block_invoke(double a1, double a2, double a3)
{
  PXFloatSign();
  double v7 = v6;
  PXFloatSign();
  if (v7 == v8)
  {
    a1 = a1 + a2;
    PXFloatSign();
    double v10 = v9;
    PXFloatSign();
    if (v10 != v11) {
      return a3;
    }
  }
  return a1;
}

@end