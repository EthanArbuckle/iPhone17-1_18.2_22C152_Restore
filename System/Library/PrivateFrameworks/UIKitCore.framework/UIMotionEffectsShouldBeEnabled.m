@interface UIMotionEffectsShouldBeEnabled
@end

@implementation UIMotionEffectsShouldBeEnabled

void ___UIMotionEffectsShouldBeEnabled_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v0 = (id)[v1 addObserverForName:@"UIAccessibilityReduceMotionStatusDidChangeNotification" object:0 queue:0 usingBlock:&__block_literal_global_175];
}

void ___UIMotionEffectsShouldBeEnabled_block_invoke_2()
{
  _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache = -1;
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"_UIMotionEffectEngineEnabledDidChangeNotification" object:0];
}

@end