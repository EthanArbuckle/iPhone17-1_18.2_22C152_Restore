@interface UIFenceTask
@end

@implementation UIFenceTask

void __20___UIFenceTask_init__block_invoke(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0 && os_variant_has_internal_diagnostics())
  {
    v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Fence", &_block_invoke___s_category_14) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "_UIFenceTask:%llu failed to acquire underlying assertion", (uint8_t *)&v5, 0xCu);
    }
  }
}

@end