@interface TPSInclusivityCondition
- (id)_valuesFromValueTypeArray:(id)a3;
- (id)_valuesFromValuesArray:(id)a3;
@end

@implementation TPSInclusivityCondition

- (id)_valuesFromValuesArray:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = [(TPSCondition *)self valueType];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [(TPSInclusivityCondition *)self _valuesFromValueTypeArray:v5];
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __50__TPSInclusivityCondition__valuesFromValuesArray___block_invoke;
    v15 = &unk_1E6E6BB38;
    v16 = self;
    id v10 = v6;
    id v17 = v10;
    [v5 enumerateObjectsUsingBlock:&v12];

    v9 = objc_msgSend(v10, "copy", v12, v13, v14, v15, v16);
  }

  return v9;
}

- (id)_valuesFromValueTypeArray:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = [(TPSCondition *)self valueType];
  int v7 = [v6 isEqualToString:@"include"];

  if (v7)
  {
    id v8 = v4;
    id v9 = 0;
  }
  else
  {
    id v10 = [(TPSCondition *)self valueType];
    int v11 = [v10 isEqualToString:@"exclude"];

    if (v11)
    {
      id v9 = v4;
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4FAF480] targeting];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[TPSInclusivityCondition _valuesFromValueTypeArray:](self, v12);
      }

      id v9 = 0;
    }
    id v8 = 0;
  }
  uint64_t v13 = [[TPSInclusivityInfo alloc] initWithTargetValues:v8 excludeValues:v9];
  [v5 addObject:v13];
  v14 = (void *)[v5 copy];

  return v14;
}

void __50__TPSInclusivityCondition__valuesFromValuesArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 TPSSafeArrayForKey:@"include"];
    id v5 = [v3 TPSSafeArrayForKey:@"exclude"];
  }
  else
  {
    v6 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __50__TPSInclusivityCondition__valuesFromValuesArray___block_invoke_cold_1((uint64_t)v3, a1, v6);
    }

    id v5 = 0;
    id v4 = 0;
  }
  int v7 = [[TPSInclusivityInfo alloc] initWithTargetValues:v4 excludeValues:v5];
  [*(id *)(a1 + 40) addObject:v7];
}

- (void)_valuesFromValueTypeArray:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 valueType];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1E4492000, a2, OS_LOG_TYPE_ERROR, "Unknown value type for include/exclude: %@", (uint8_t *)&v4, 0xCu);
}

void __50__TPSInclusivityCondition__valuesFromValuesArray___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = objc_opt_class();
  id v5 = v4;
  int v7 = 138412546;
  id v8 = v4;
  __int16 v9 = 2112;
  id v10 = (id)objc_opt_class();
  id v6 = v10;
  _os_log_error_impl(&dword_1E4492000, a3, OS_LOG_TYPE_ERROR, "Unexpected value element type (%@) for condition: %@", (uint8_t *)&v7, 0x16u);
}

@end