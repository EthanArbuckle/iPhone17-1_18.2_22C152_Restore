@interface ISUIScrollViewVitalityController
- (BOOL)canPerformVitality;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (ISUIScrollViewVitalityController)init;
- (UIScrollView)_scrollView;
- (id)visibilityOffsetHelper;
- (void)_reduceMotionDidChange:(id)a3;
- (void)_setScrollView:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation ISUIScrollViewVitalityController

- (id)visibilityOffsetHelper
{
  visibilityOffsetHelper = self->_visibilityOffsetHelper;
  if (!visibilityOffsetHelper)
  {
    v4 = objc_alloc_init(ISUIVisibilityOffsetHelper);
    v5 = self->_visibilityOffsetHelper;
    self->_visibilityOffsetHelper = v4;

    visibilityOffsetHelper = self->_visibilityOffsetHelper;
  }

  return visibilityOffsetHelper;
}

- (ISUIScrollViewVitalityController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ISUIScrollViewVitalityController;
  v2 = [(ISScrollViewVitalityController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__reduceMotionDidChange_ name:*MEMORY[0x1E4F43478] object:0];
  }
  return v2;
}

uint64_t __64__ISUIScrollViewVitalityController_scrollViewWillBeginDragging___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setScrolling:1];
  [*(id *)(a1 + 32) setDecelerating:0];
  [*(id *)(a1 + 32) setEstimatedScrollEndDate:0];
  v2 = *(void **)(a1 + 32);

  return [v2 setHasTargetContentOffset:0];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__scrollView);

  objc_storeStrong((id *)&self->_visibilityOffsetHelper, 0);
}

- (void)_setScrollView:(id)a3
{
}

- (UIScrollView)_scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scrollView);

  return (UIScrollView *)WeakRetained;
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 1;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__ISUIScrollViewVitalityController_scrollViewDidEndDecelerating___block_invoke;
  v3[3] = &unk_1E6BECD80;
  v3[4] = self;
  [(ISScrollViewVitalityController *)self performChanges:v3];
}

uint64_t __65__ISUIScrollViewVitalityController_scrollViewDidEndDecelerating___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setScrolling:0];
  v2 = *(void **)(a1 + 32);

  return [v2 setDecelerating:0];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  double v8 = 0.0;
  if (v4)
  {
    if (objc_msgSend(v6, "isPagingEnabled", 0.0))
    {
      v9 = [v7 valueForKey:@"_pagingFriction"];
      [v9 doubleValue];
      double v11 = v10;

      double v8 = v11 * 33.81 + -32.046;
    }
    else
    {
      double v8 = 0.6;
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__ISUIScrollViewVitalityController_scrollViewDidEndDragging_willDecelerate___block_invoke;
  v12[3] = &unk_1E6BECC90;
  v12[4] = self;
  *(double *)&v12[5] = v8;
  BOOL v13 = v4;
  [(ISScrollViewVitalityController *)self performChanges:v12];
}

uint64_t __76__ISUIScrollViewVitalityController_scrollViewDidEndDragging_willDecelerate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*(double *)(a1 + 40)];
  [v2 setEstimatedScrollEndDate:v3];

  BOOL v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    return [v4 setDecelerating:1];
  }
  else
  {
    return [v4 setScrolling:0];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__ISUIScrollViewVitalityController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke;
  v5[3] = &unk_1E6BECFC0;
  v5[4] = self;
  v5[5] = a5;
  [(ISScrollViewVitalityController *)self performChanges:v5];
}

uint64_t __95__ISUIScrollViewVitalityController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasTargetContentOffset:1];
  v2 = *(void **)(a1 + 32);
  v3 = *(double **)(a1 + 40);
  double v4 = *v3;
  double v5 = v3[1];

  return objc_msgSend(v2, "setTargetContentOffset:", v4, v5);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__ISUIScrollViewVitalityController_scrollViewWillBeginDragging___block_invoke;
  v3[3] = &unk_1E6BECD80;
  v3[4] = self;
  [(ISScrollViewVitalityController *)self performChanges:v3];
}

- (void)_reduceMotionDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__ISUIScrollViewVitalityController__reduceMotionDidChange___block_invoke;
  v3[3] = &unk_1E6BECD80;
  v3[4] = self;
  is_dispatch_on_main_queue(v3);
}

uint64_t __59__ISUIScrollViewVitalityController__reduceMotionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) canPerformVitalityDidChange];
}

- (BOOL)canPerformVitality
{
  v4.receiver = self;
  v4.super_class = (Class)ISUIScrollViewVitalityController;
  BOOL v2 = [(ISScrollViewVitalityController *)&v4 canPerformVitality];
  if (v2) {
    LOBYTE(v2) = !UIAccessibilityIsReduceMotionEnabled();
  }
  return v2;
}

@end