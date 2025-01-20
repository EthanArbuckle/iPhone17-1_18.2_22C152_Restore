@interface UIResponderTargetForAction
@end

@implementation UIResponderTargetForAction

uint64_t ___UIResponderTargetForAction_Recursive_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  if (objc_opt_respondsToSelector()) {
    char v8 = [v7 canPerformAction:a3 withSender:v6];
  }
  else {
    char v8 = objc_opt_respondsToSelector();
  }
  char v9 = v8;

  return v9 & 1;
}

@end