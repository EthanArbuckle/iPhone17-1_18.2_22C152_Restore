@interface UISafelyGetOrientationMask
@end

@implementation UISafelyGetOrientationMask

void ___UISafelyGetOrientationMask_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("General", &__LaunchTestName_block_invoke___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = [v3 reason];
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: An exception was thrown while evaluating supported interface orientations. UIViewController.supportedInterfaceOrientations should always return a UIInterfaceOrientationMask. Suppressed exception: \"%{public}@\"", (uint8_t *)&v6, 0xCu);
  }
}

@end