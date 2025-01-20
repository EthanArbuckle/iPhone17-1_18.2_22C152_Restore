@interface NSAttributedString
@end

@implementation NSAttributedString

void __108__NSAttributedString_REMCRMergeableStringDocument_Hashtags__rem_enumerateHashtagInRange_options_usingBlock___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7 = a2;
  uint64_t v8 = objc_opt_class();
  v9 = REMDynamicCast(v8, (uint64_t)v7);
  if (v9)
  {
    v10 = [REMTTHashtag alloc];
    v11 = [v9 objectIdentifier];
    v12 = [(REMTTHashtag *)v10 initWithObjectIdentifier:v11];
  }
  else
  {
    if (v7)
    {
      v13 = +[REMLog crdt];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14.location = a3;
        v14.length = a4;
        __108__NSAttributedString_REMCRMergeableStringDocument_Hashtags__rem_enumerateHashtagInRange_options_usingBlock___block_invoke_cold_1((int)v7, v14);
      }
    }
    v12 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108__NSAttributedString_REMCRMergeableStringDocument_Hashtags__rem_enumerateHashtagInRange_options_usingBlock___block_invoke_cold_1(int a1, NSRange range)
{
  v2 = NSStringFromRange(range);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "Unexpected Class of TTREMHashtagAttributeName objects found in enumeration {value: %@, range: %@}", v5, v6, v7, v8, v9);
}

@end