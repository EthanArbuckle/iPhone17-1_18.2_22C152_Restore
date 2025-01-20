@interface UINavigationControllerHasBugWhenPositioningBarsExclusivelyWithSafeArea
@end

@implementation UINavigationControllerHasBugWhenPositioningBarsExclusivelyWithSafeArea

void ___UINavigationControllerHasBugWhenPositioningBarsExclusivelyWithSafeArea_block_invoke()
{
  int v0 = dyld_program_sdk_at_least();
  byte_1EB25A819 = v0 ^ 1;
  if (((v0 ^ 1) & 1) == 0)
  {
    _UIMainBundleIdentifier();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    if ([v1 isEqualToString:@"com.apple.springboard"]) {
      byte_1EB25A819 = 1;
    }
    else {
      qword_1EB25A8F8 = (uint64_t)NSClassFromString(&cfstr_Punavigationco.isa);
    }
  }
}

@end