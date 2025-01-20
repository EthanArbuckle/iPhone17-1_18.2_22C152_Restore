@interface UIScreenIsCapturedValueOverride
@end

@implementation UIScreenIsCapturedValueOverride

void ___UIScreenIsCapturedValueOverride_block_invoke()
{
  v0 = _UIKitUserDefaults();
  id obj = [v0 objectForKey:@"UIScreenIsCapturedValue"];

  if (objc_opt_respondsToSelector()) {
    objc_storeStrong((id *)&qword_1EB25C650, obj);
  }
}

@end