@interface UIConfigurationIdentifierForColorTransformer
@end

@implementation UIConfigurationIdentifierForColorTransformer

void ___UIConfigurationIdentifierForColorTransformer_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:1282];
  v1 = (void *)_MergedGlobals_1041;
  _MergedGlobals_1041 = v0;

  for (uint64_t i = 2; i != 29; ++i)
  {
    v3 = _UIConfigurationColorTransformerForIdentifier(i);
    if (os_variant_has_internal_diagnostics())
    {
      if (!v3)
      {
        v4 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v7 = i;
          _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "Missing color transformer for identifier: %ld", buf, 0xCu);
        }
      }
    }
    else if (!v3)
    {
      v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260570) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v7 = i;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Missing color transformer for identifier: %ld", buf, 0xCu);
      }
    }
    NSMapInsert((NSMapTable *)_MergedGlobals_1041, v3, (const void *)i);
  }
}

@end