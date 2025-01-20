@interface UIFocusMapSnapshot
@end

@implementation UIFocusMapSnapshot

void __45___UIFocusMapSnapshot_addRegionsInContainer___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &_UIInternalPreference_FocusEnvironmentUseLegacyIsFocusedOrContainsFocusLogic_block_invoke___s_category_0)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "%@.\nSuppressing subsequent logging of this error.", (uint8_t *)&v4, 0xCu);
  }
}

@end