@interface UIStatusBarLockItem
@end

@implementation UIStatusBarLockItem

void __50___UIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50___UIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke_2;
    v5[3] = &unk_1E52EC0A8;
    v5[4] = *(void *)(a1 + 32);
    v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v5 block:1.0];
    [*(id *)(a1 + 32) setLockDisappearanceTimer:v3];
  }
  else
  {
    [*(id *)(a1 + 32) setShowsLock:0];
    id v4 = [*(id *)(a1 + 32) statusBar];
    [v4 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
  }
}

void __50___UIStatusBarLockItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowsLock:0];
  id v2 = [*(id *)(a1 + 32) statusBar];
  [v2 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
}

void __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v8 = [*(id *)(a1 + 32) statusBar];
  v9 = [v8 styleAttributes];
  uint64_t v10 = [v9 effectiveLayoutDirection];

  [v6 absoluteFrame];
  double x = v35.origin.x;
  double y = v35.origin.y;
  double width = v35.size.width;
  double height = v35.size.height;
  BOOL v15 = v10 == 1;
  double v16 = CGRectGetWidth(v35) * 0.5;
  double v17 = -v16;
  if (v10 == 1) {
    double v17 = v16;
  }
  double v18 = x + v17;
  [v6 setFloating:1];
  objc_msgSend(v6, "setAbsoluteFrame:", v18, y, width, height);
  uint64_t v19 = *(void *)(a1 + 32);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_2;
  v29[3] = &unk_1E52DA520;
  id v30 = v6;
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_3;
  v27 = &unk_1E52D9FE8;
  id v28 = v7;
  id v20 = v7;
  id v21 = v6;
  +[UIView _animateWithDuration:0 delay:v19 options:v29 factory:&v24 animations:0.91 completion:0.0];
  v22 = objc_msgSend(*(id *)(a1 + 32), "stringView", v24, v25, v26, v27);
  [v22 setExpandsFromLeftToRight:v15];

  v23 = [*(id *)(a1 + 32) stringView];
  [v23 animateCompletionBlock:0];
}

uint64_t __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(a1 + 32);
  return [v2 setFloating:0];
}

uint64_t __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  [v6 absoluteFrame];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  if (!CGRectEqualToRect(v19, *(CGRect *)(a1 + 40)))
  {
    [v6 setFloating:1];
    objc_msgSend(v6, "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    uint64_t v12 = *(void *)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_5;
    v13[3] = &unk_1E52DA520;
    id v14 = v6;
    CGFloat v15 = x;
    CGFloat v16 = y;
    CGFloat v17 = width;
    CGFloat v18 = height;
    +[UIView _animateWithDuration:0 delay:v12 options:v13 factory:v7 animations:0.91 completion:0.0];
  }
}

uint64_t __70___UIStatusBarLockItem_additionAnimationForDisplayItemWithIdentifier___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAbsoluteFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(a1 + 32);
  return [v2 setFloating:0];
}

@end