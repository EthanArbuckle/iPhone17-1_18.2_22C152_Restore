@interface UIScrollView(PhotosUI)
- (double)pu_displayFrameForRect:()PhotosUI;
- (id)_pu_pptScrollHelper;
- (uint64_t)pu_isPerformingScrollTest;
- (void)_pu_beginPageSwipeTest:()PhotosUI;
- (void)_pu_endPageSwipeTest:()PhotosUI;
- (void)_pu_incrementForPageSwipeTest:()PhotosUI dt:stop:;
- (void)_pu_setPPTScrollHelper:()PhotosUI;
- (void)pu_ppt_performPageSwipeTest:()PhotosUI iterations:numberOfPages:scrollAxis:;
- (void)pu_ppt_scrollToContentOffset:()PhotosUI withCompletionHandler:;
@end

@implementation UIScrollView(PhotosUI)

- (void)_pu_endPageSwipeTest:()PhotosUI
{
  v3 = (void *)MEMORY[0x1E4FB1438];
  id v4 = a3;
  id v6 = [v3 sharedApplication];
  v5 = [v4 testName];

  [v6 finishedTest:v5];
}

- (void)_pu_incrementForPageSwipeTest:()PhotosUI dt:stop:
{
  id v9 = a3;
  uint64_t v10 = [v9 currentPage];
  uint64_t v11 = [v9 currentDirection];
  [v9 currentPageSwipeProgress];
  double v13 = fmin(a5 / 0.75, 0.05) + v12;
  if (v13 >= 1.0)
  {
    v10 += v11;
    if (v11 < 1)
    {
      BOOL v14 = 0;
      double v13 = 0.0;
      if (v11 && !v10)
      {
        uint64_t v15 = [v9 currentIteration] + 1;
        [v9 setCurrentIteration:v15];
        BOOL v14 = v15 >= [v9 numberOfIterations];
        uint64_t v11 = 1;
      }
    }
    else
    {
      BOOL v14 = 0;
      if (v10 == [v9 numberOfPages]) {
        uint64_t v11 = -1;
      }
      double v13 = 0.0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  [v9 setCurrentPageSwipeProgress:v13];
  [v9 setCurrentDirection:v11];
  [v9 setCurrentPage:v10];
  uint64_t v16 = [v9 currentState];
  uint64_t v17 = v16;
  if (v13 < 0.1) {
    goto LABEL_15;
  }
  if (v13 < 0.3)
  {
    uint64_t v18 = 1;
    goto LABEL_16;
  }
  if (v13 >= 0.9) {
LABEL_15:
  }
    uint64_t v18 = 0;
  else {
    uint64_t v18 = 2;
  }
LABEL_16:
  if (v18 != v16)
  {
    [v9 setCurrentState:v18];
    v19 = [a1 delegate];
    if (v18)
    {
      if (v18 == 2)
      {
        if (v17 != 1)
        {
          v38 = [MEMORY[0x1E4F28B00] currentHandler];
          [v38 handleFailureInMethod:a2, a1, @"UIScrollView+PhotosUI.m", 229, @"Invalid parameter not satisfying: %@", @"oldState == PUScrollViewPageSwipeStateDragging" object file lineNumber description];
        }
        if (objc_opt_respondsToSelector())
        {
          long long v39 = *MEMORY[0x1E4F1DAD8];
          objc_msgSend(v19, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a1, &v39, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
        }
        if (objc_opt_respondsToSelector()) {
          [v19 scrollViewDidEndDragging:a1 willDecelerate:1];
        }
        if (objc_opt_respondsToSelector()) {
          [v19 scrollViewWillBeginDecelerating:a1];
        }
      }
      else
      {
        if (v17)
        {
          v36 = [MEMORY[0x1E4F28B00] currentHandler];
          [v36 handleFailureInMethod:a2, a1, @"UIScrollView+PhotosUI.m", 223, @"Invalid parameter not satisfying: %@", @"oldState == PUScrollViewPageSwipeStateIdle" object file lineNumber description];
        }
        if (objc_opt_respondsToSelector()) {
          [v19 scrollViewWillBeginDragging:a1];
        }
      }
    }
    else
    {
      if (v17 != 2)
      {
        v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:a2, a1, @"UIScrollView+PhotosUI.m", 242, @"Invalid parameter not satisfying: %@", @"oldState == PUScrollViewPageSwipeStateDecelerating" object file lineNumber description];
      }
      if (objc_opt_respondsToSelector()) {
        [v19 scrollViewDidEndDecelerating:a1];
      }
    }
  }
  [v9 originContentOffset];
  double v21 = v20;
  double v23 = v22;
  double v24 = (v13 + -0.2) / 0.6;
  if (v24 < 0.0) {
    double v24 = 0.0;
  }
  if (v24 >= 1.0) {
    double v25 = 1.57079633;
  }
  else {
    double v25 = v24 * 1.57079633;
  }
  double v26 = (double)v10 + sin(v25) * (double)v11;
  uint64_t v27 = [v9 scrollAxis];
  [a1 bounds];
  if (v27 == 1)
  {
    double Width = CGRectGetWidth(*(CGRect *)&v28);
    [a1 _interpageSpacing];
    double v21 = v21 + v26 * (Width + v33);
  }
  else
  {
    double Height = CGRectGetHeight(*(CGRect *)&v28);
    [a1 _interpageSpacing];
    double v23 = v23 + v26 * (Height + v35);
  }
  objc_msgSend(a1, "setContentOffset:animated:", 0, v21, v23);
  if (v14) {
    *a4 = 1;
  }
}

- (void)_pu_beginPageSwipeTest:()PhotosUI
{
  id v4 = a3;
  [a1 contentOffset];
  objc_msgSend(v4, "setOriginContentOffset:");
  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  v5 = [v4 testName];

  [v6 startedTest:v5];
}

- (void)pu_ppt_performPageSwipeTest:()PhotosUI iterations:numberOfPages:scrollAxis:
{
  id v11 = a3;
  if ((unint64_t)(a6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"UIScrollView+PhotosUI.m", 136, @"Invalid parameter not satisfying: %@", @"scrollAxis == UIAxisHorizontal || scrollAxis == UIAxisVertical" object file lineNumber description];
  }
  if (a5 <= 0)
  {
    uint64_t v15 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v15 failedTest:v11];
  }
  else
  {
    double v12 = objc_alloc_init(_PUScrollViewPageSwipeTestContext);
    [(_PUScrollViewPageSwipeTestContext *)v12 setTestName:v11];
    [(_PUScrollViewPageSwipeTestContext *)v12 setNumberOfPages:a5];
    [(_PUScrollViewPageSwipeTestContext *)v12 setNumberOfIterations:a4];
    [(_PUScrollViewPageSwipeTestContext *)v12 setScrollAxis:a6];
    double v13 = [[_PUScrollViewPPTScrollHelper alloc] initWithScrollView:a1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke;
    v21[3] = &unk_1E5F2ECC8;
    v21[4] = a1;
    double v22 = v12;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke_2;
    v19[3] = &unk_1E5F2EB78;
    v19[4] = a1;
    double v20 = v22;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__UIScrollView_PhotosUI__pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis___block_invoke_3;
    v17[3] = &unk_1E5F2ECC8;
    v17[4] = a1;
    uint64_t v18 = v20;
    BOOL v14 = v20;
    [(_PUScrollViewPPTScrollHelper *)v13 scrollWithStartHandler:v21 incrementHandler:v19 completionHandler:v17];
  }
}

- (void)pu_ppt_scrollToContentOffset:()PhotosUI withCompletionHandler:
{
  id v8 = a5;
  [a1 contentOffset];
  PXPointSubtract();
  PXFloatSign();
  double v10 = v9 * 1000.0;
  PXFloatSign();
  double v12 = v11 * 1000.0;
  double v13 = [[_PUScrollViewPPTScrollHelper alloc] initWithScrollView:a1];
  BOOL v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v14 scale];
  uint64_t v16 = v15;

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__UIScrollView_PhotosUI__pu_ppt_scrollToContentOffset_withCompletionHandler___block_invoke_2;
  v17[3] = &unk_1E5F2EB50;
  v17[4] = a1;
  id v18 = &__block_literal_global_104122;
  double v19 = v10;
  double v20 = v12;
  double v21 = a2;
  double v22 = a3;
  uint64_t v23 = v16;
  [(_PUScrollViewPPTScrollHelper *)v13 scrollWithStartHandler:0 incrementHandler:v17 completionHandler:v8];
}

- (void)_pu_setPPTScrollHelper:()PhotosUI
{
}

- (id)_pu_pptScrollHelper
{
  return objc_getAssociatedObject(a1, (const void *)PUScrollViewPPTScrollHelperAssociationKey);
}

- (uint64_t)pu_isPerformingScrollTest
{
  v2 = [a1 scrollTestParameters];

  if (v2) {
    return 1;
  }
  id v4 = objc_msgSend(a1, "_pu_pptScrollHelper");
  BOOL v3 = v4 != 0;

  return v3;
}

- (double)pu_displayFrameForRect:()PhotosUI
{
  [a1 contentOffset];
  double v10 = -v9;
  double v12 = -v11;
  double v13 = a2;
  double v14 = a3;
  double v15 = a4;
  double v16 = a5;
  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v13, v10, v12);
  return result;
}

@end