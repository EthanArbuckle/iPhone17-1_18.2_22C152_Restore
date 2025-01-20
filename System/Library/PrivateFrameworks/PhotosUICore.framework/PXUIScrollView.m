@interface PXUIScrollView
@end

@implementation PXUIScrollView

void __48___PXUIScrollView_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v2, "px_cancelScrollGesture");
  }
}

uint64_t __68___PXUIScrollView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _isFocusFastScrolling];
  v3 = *(void **)(a1 + 32);
  return [v3 setIsFocusFastScrolling:v2];
}

void __37___PXUIScrollView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  v3 = [v16 _outermostLayer];
  [v3 zPosition];
  if (v4 == 0.0)
  {
    v5 = [v16 layer];
    [v5 zPosition];
    double v7 = v6;
  }
  else
  {
    double v7 = v4;
  }

  v8 = v16;
  if (v7 > *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    int v9 = [v16 isUserInteractionEnabled];
    v8 = v16;
    if (v9)
    {
      objc_msgSend(v16, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
      double v11 = v10;
      double v13 = v12;
      int v14 = objc_msgSend(v16, "pointInside:withEvent:", *(void *)(a1 + 40));
      v8 = v16;
      if (v14)
      {
        v15 = objc_msgSend(v16, "hitTest:withEvent:", *(void *)(a1 + 40), v11, v13);
        if (v15)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v15);
          *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
        }

        v8 = v16;
      }
    }
  }
}

@end