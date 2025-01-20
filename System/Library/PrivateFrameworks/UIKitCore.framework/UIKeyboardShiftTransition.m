@interface UIKeyboardShiftTransition
- (double)nonInteractiveDuration;
- (void)runNonInteractivelyWithCompletion:(id)a3;
@end

@implementation UIKeyboardShiftTransition

- (double)nonInteractiveDuration
{
  return 0.05;
}

- (void)runNonInteractivelyWithCompletion:(id)a3
{
  id v4 = a3;
  [(UIKeyboardShiftTransition *)self nonInteractiveDuration];
  double v6 = v5;
  id v9 = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__UIKeyboardShiftTransition_runNonInteractivelyWithCompletion___block_invoke;
  v10[3] = &unk_1E52D9F70;
  v10[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__UIKeyboardShiftTransition_runNonInteractivelyWithCompletion___block_invoke_2;
  v8[3] = &unk_1E52D9FE8;
  id v7 = v4;
  +[UIView animateWithDuration:50331712 delay:v10 options:v8 animations:v6 completion:0.0];
}

uint64_t __63__UIKeyboardShiftTransition_runNonInteractivelyWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) setAlpha:0.0];
}

uint64_t __63__UIKeyboardShiftTransition_runNonInteractivelyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end