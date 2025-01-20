@interface UIDatePickerContainerViewController
@end

@implementation UIDatePickerContainerViewController

void __64___UIDatePickerContainerViewController_keyboardFrameWillChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentation];
  v3 = [v2 platterView];

  if (v3 && [v3 isUserInteractionEnabled])
  {
    [*(id *)(a1 + 32) keyboardAdjustmentOffset];
    double v5 = v4;
    [v3 frame];
    CGRect v22 = CGRectOffset(v21, 0.0, -v5);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
    v10 = [*(id *)(a1 + 32) presentation];
    v11 = [v10 activeDatePicker];
    v12 = [v11 _style];

    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), v24))
    {
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      CGRect v23 = CGRectIntersection(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), v25);
      CGRectGetHeight(v23);
      [v12 overlayPlatterDefaultMargin];
    }
    UIRoundToViewScale(v3);
    double v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "setKeyboardAdjustmentOffset:");
    if (v14 != v5)
    {
      double v15 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __64___UIDatePickerContainerViewController_keyboardFrameWillChange___block_invoke_2;
      v17[3] = &unk_1E52DD178;
      id v18 = v3;
      double v19 = v5;
      double v20 = v14;
      +[UIView animateWithDuration:v16 delay:v17 options:0 animations:v15 completion:0.0];
    }
  }
}

uint64_t __64___UIDatePickerContainerViewController_keyboardFrameWillChange___block_invoke_2(uint64_t a1)
{
  memset(&v9, 0, sizeof(v9));
  v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 transform];
  }
  CGFloat v3 = -*(double *)(a1 + 40);
  CGAffineTransform v7 = v9;
  CGAffineTransformTranslate(&v8, &v7, 0.0, v3);
  CGAffineTransform v9 = v8;
  double v4 = *(double *)(a1 + 48);
  if (v4 != 0.0)
  {
    CGAffineTransform v7 = v9;
    CGAffineTransformTranslate(&v8, &v7, 0.0, v4);
    CGAffineTransform v9 = v8;
  }
  CGAffineTransform v6 = v9;
  return [*(id *)(a1 + 32) setTransform:&v6];
}

@end