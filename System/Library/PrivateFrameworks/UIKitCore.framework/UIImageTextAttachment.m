@interface UIImageTextAttachment
@end

@implementation UIImageTextAttachment

id __90___UIImageTextAttachment__imageAdaptedForTextAtIndex_withAttributes_inContainer_sizeOnly___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v3 = [*(id *)(a1 + 32) _colorForFlattening];
    if (!v3)
    {
      v4 = *(void **)(a1 + 40);
      if (v4) {
        [v4 objectForKeyedSubscript:*(void *)off_1E52D2048];
      }
      else {
      id v3 = [*(id *)(a1 + 48) _deriveAttribute:*(void *)off_1E52D2048 inStorage:*(void *)(a1 + 56) atIndex:*(void *)(a1 + 64)];
      }
    }
  }
  return v3;
}

id __90___UIImageTextAttachment__imageAdaptedForTextAtIndex_withAttributes_inContainer_sizeOnly___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) textContentManager];
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  if (os_variant_has_internal_diagnostics())
  {
    if (!v5)
    {
      v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v9 = 138412546;
        uint64_t v10 = 0;
        __int16 v11 = 2080;
        v12 = "NSTextContentStorage";
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "%@ is of unexpected class (expected class %s)", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else if (!v5)
  {
    v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_block_invoke___s_category_8) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412546;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      v12 = "NSTextContentStorage";
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "%@ is of unexpected class (expected class %s)", (uint8_t *)&v9, 0x16u);
    }
  }
  return v5;
}

@end