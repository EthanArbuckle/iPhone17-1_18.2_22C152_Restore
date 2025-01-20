@interface UIKeyboardLayoutAlignmentView
@end

@implementation UIKeyboardLayoutAlignmentView

uint64_t __76___UIKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateConstraintsToMatchKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __76___UIKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76___UIKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_3;
  v5[3] = &unk_1E52DB330;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  +[UIView animateWithDuration:v3 delay:v5 options:0 animations:v2 completion:0.0];
}

void __76___UIKeyboardLayoutAlignmentView__updateConstraintsForKeyboardNotification___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) superview];
  [v2 layoutIfNeeded];
}

@end