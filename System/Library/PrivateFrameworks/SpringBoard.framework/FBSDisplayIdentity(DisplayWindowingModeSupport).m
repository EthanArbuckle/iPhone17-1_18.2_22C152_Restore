@interface FBSDisplayIdentity(DisplayWindowingModeSupport)
- (uint64_t)sb_displayWindowingMode;
@end

@implementation FBSDisplayIdentity(DisplayWindowingModeSupport)

- (uint64_t)sb_displayWindowingMode
{
  return [(id)SBApp windowingModeForDisplay:a1];
}

@end