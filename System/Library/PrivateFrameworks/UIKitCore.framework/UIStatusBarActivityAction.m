@interface UIStatusBarActivityAction
@end

@implementation UIStatusBarActivityAction

uint64_t __62___UIStatusBarActivityAction_actionForBackgroundActivityType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(a1 + 32);
  if (v4 > 0x25) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_186B9D038[v4];
  }
  if (([(id)UIApp handleDoubleHeightStatusBarTapWithStyleOverride:v5] & 1) == 0)
  {
    v6 = [[UIHandleStatusBarTapAction alloc] initWithStatusBarStyle:0 andStatusBarStyleOverride:v5];
    v7 = [v3 window];
    v8 = -[UIWindow _fbsScene](v7);
    v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    [v8 sendActions:v9];
  }
  return 1;
}

@end