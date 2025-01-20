@interface UIResponderCrossSceneResponderChainEnabled
@end

@implementation UIResponderCrossSceneResponderChainEnabled

void ___UIResponderCrossSceneResponderChainEnabled_block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.goodnotesapp.x", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = _UIMainBundleIdentifier();
  if ([v2 containsObject:v0]) {
    char v1 = dyld_program_sdk_at_least();
  }
  else {
    char v1 = 1;
  }

  byte_1EB262471 = _os_feature_enabled_impl() & v1;
}

@end