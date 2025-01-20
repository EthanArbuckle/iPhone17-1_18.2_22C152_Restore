@interface UIDynamicAnimation
@end

@implementation UIDynamicAnimation

uint64_t __47___UIDynamicAnimation__updateAnimations_timer___block_invoke(uint64_t a1, unsigned char *a2)
{
  if ((a2[20] & 2) != 0) {
    return [a2 _completeWithFinished:1];
  }
  return result;
}

uint64_t __27___UIDynamicAnimation_init__block_invoke()
{
  uint64_t result = [_UIMainBundleIdentifier() isEqualToString:@"com.apple.Maps"];
  _MergedGlobals_1 = result;
  return result;
}

@end