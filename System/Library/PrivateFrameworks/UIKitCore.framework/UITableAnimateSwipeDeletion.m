@interface UITableAnimateSwipeDeletion
@end

@implementation UITableAnimateSwipeDeletion

void ___UITableAnimateSwipeDeletion_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 <= 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = objc_msgSend(NSString, "stringWithUTF8String:", "NSSet<UIViewPropertyAnimator *> *_UITableAnimateSwipeDeletion(__strong id<UITable_RowDataSource>, NSIndexPath *__strong, UITableViewCell *__strong, UIView *__strong, UISwipeOccurrence *__strong, UIColor *__strong, void (^__strong)(BOOL), void (^__strong)(BOOL))_block_invoke");
    [v16 handleFailureInFunction:v17 file:@"_UITableShared.m" lineNumber:241 description:@"deleteAnimationsRunning is less than or equal to 0 while entering a completion handler. It seems like the initial animation count is incorrect. This is a UIKit bug."];

    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = *(void *)(v4 + 24);
  }
  *(void *)(v4 + 24) = v5 - 1;
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [*(id *)(a1 + 32) setAutoresizesSubviews:1];
    [*(id *)(a1 + 32) _setSkipsLayout:0];
    [*(id *)(a1 + 32) setHidden:1];
    [*(id *)(a1 + 40) frame];
    objc_msgSend(*(id *)(a1 + 48), "convertRect:toView:", 0);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = *(void *)(a1 + 56);
    if (v14) {
      (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, a2 == 0);
    }
    [*(id *)(a1 + 48) layoutIfNeeded];
    objc_msgSend(*(id *)(a1 + 48), "convertRect:fromView:", 0, v7, v9, v11, v13);
    objc_msgSend(*(id *)(a1 + 40), "setFrame:");
    [*(id *)(a1 + 32) _setDeleteAnimationInProgress:0];
    v15 = *(void **)(a1 + 48);
    [v15 setUserInteractionEnabled:1];
  }
}

uint64_t ___UITableAnimateSwipeDeletion_block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v2 = *(double *)(a1 + 80);
  double v3 = *(double *)(a1 + 88);
  double v4 = *(double *)(a1 + 96);
  double v5 = *(double *)(a1 + 104);
  double v6 = *(void **)(a1 + 40);
  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

uint64_t ___UITableAnimateSwipeDeletion_block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setHeight:*(void *)(a1 + 40) forRowAtIndexPath:1 usingPresentationValues:0.0];
  [*(id *)(a1 + 48) layoutIfNeeded];
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  double v2 = *(double *)(a1 + 104);
  double v3 = *(double *)(a1 + 112);
  double v4 = *(double *)(a1 + 120);
  double v5 = *(double *)(a1 + 128);
  double v6 = *(void **)(a1 + 64);
  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

uint64_t ___UITableAnimateSwipeDeletion_block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(double *)(a1 + 48) - *(double *)(a1 + 72);
  double v3 = *(double *)(a1 + 56) + *(double *)(a1 + 56);
  double v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "setFrame:", 0.0, v2, v3);
}

void ___UITableAnimateSwipeDeletion_block_invoke_5(uint64_t a1, uint64_t a2)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___UITableAnimateSwipeDeletion_block_invoke_6;
  aBlock[3] = &unk_1E52E45A0;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  double v4 = _Block_copy(aBlock);
  double v5 = v4;
  if (a2)
  {
    (*((void (**)(void *, void))v4 + 2))(v4, 0);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = ___UITableAnimateSwipeDeletion_block_invoke_7;
    v6[3] = &unk_1E52D9F70;
    id v7 = *(id *)(a1 + 32);
    +[UIView animateWithDuration:2 delay:v6 usingSpringWithDamping:v5 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:0.0];
  }
}

uint64_t ___UITableAnimateSwipeDeletion_block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t ___UITableAnimateSwipeDeletion_block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

@end