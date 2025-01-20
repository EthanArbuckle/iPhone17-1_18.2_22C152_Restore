@interface UIViewCreateMotionEffectEngineIfNecessary
@end

@implementation UIViewCreateMotionEffectEngineIfNecessary

void ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 userInfo];
  id v5 = [v2 objectForKeyedSubscript:@"_UIApplicationDeactivationReasonUserInfoKey"];

  v3 = v5;
  if (v5)
  {
    BOOL v4 = [v5 integerValue] == 3;
    v3 = v5;
    if (v4)
    {
      +[UIView _endSuspendingMotionEffectsForReason:@"switcher"];
      v3 = v5;
    }
  }
}

void ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 userInfo];
  id v5 = [v2 objectForKeyedSubscript:@"_UIApplicationDeactivationReasonUserInfoKey"];

  v3 = v5;
  if (v5)
  {
    BOOL v4 = [v5 integerValue] == 3;
    v3 = v5;
    if (v4)
    {
      +[UIView animateWithDuration:&__block_literal_global_3748 animations:0.25];
      +[UIView _beginSuspendingMotionEffectsForReason:@"switcher"];
      v3 = v5;
    }
  }
}

void ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)_motionEffectEngine;
  id v3 = a2;
  uint64_t v4 = [v2 _targetInterfaceOrientation];
  id v5 = [v3 userInfo];

  v6 = [v5 objectForKeyedSubscript:@"UIWindowNewOrientationUserInfoKey"];
  uint64_t v7 = [v6 integerValue];

  if (v4 != v7)
  {
    +[UIView _recenterMotionEffects];
  }
}

uint64_t ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_3()
{
  return +[UIView _recenterMotionEffects];
}

uint64_t ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_5()
{
  return +[UIView _recenterMotionEffects];
}

void ___UIViewCreateMotionEffectEngineIfNecessary_block_invoke_7()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"_UIMotionEffectsEnabledDidChangeNotification" object:0];
}

@end