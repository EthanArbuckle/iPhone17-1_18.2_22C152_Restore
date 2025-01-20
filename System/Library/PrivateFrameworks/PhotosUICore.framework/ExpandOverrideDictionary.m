@interface ExpandOverrideDictionary
@end

@implementation ExpandOverrideDictionary

void ___ExpandOverrideDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 componentsSeparatedByString:@"::"];
  if ((unint64_t)[v7 count] <= 1)
  {
    v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Override key path is invalid: \"%@\"", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_22;
  }
  v8 = *(id *)(a1 + 32);
  if (![v7 count]) {
    goto LABEL_22;
  }
  uint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = [v7 count] - 1;
    v11 = [v7 objectAtIndexedSubscript:v9];
    v12 = [v8 objectForKeyedSubscript:v11];
    if (v12) {
      break;
    }
    if (v9 != v10)
    {
      v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v8 setObject:v13 forKeyedSubscript:v11];
      goto LABEL_13;
    }
    [v8 setObject:v6 forKeyedSubscript:v11];
LABEL_14:

    if (++v9 >= (unint64_t)[v7 count]) {
      goto LABEL_22;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = PLUIGetLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    int v16 = 138412290;
    id v17 = v5;
    v15 = "Override key path would step on an already overridden value: \"%@\"";
    goto LABEL_20;
  }
  if (v9 != v10)
  {
    v13 = v12;
LABEL_13:

    v8 = v13;
    goto LABEL_14;
  }
  v14 = PLUIGetLog();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    goto LABEL_21;
  }
  int v16 = 138412290;
  id v17 = v5;
  v15 = "Override key path specifies a value that already has overriden child keys: \"%@\"";
LABEL_20:
  _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v16, 0xCu);
LABEL_21:

LABEL_22:
}

@end