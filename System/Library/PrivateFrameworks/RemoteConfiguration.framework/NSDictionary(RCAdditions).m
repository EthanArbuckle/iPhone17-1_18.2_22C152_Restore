@interface NSDictionary(RCAdditions)
+ (id)rc_dictionaryFromData:()RCAdditions error:;
+ (id)rc_dictionaryFromJSON:()RCAdditions error:;
+ (uint64_t)rc_dictionaryFromJSON:()RCAdditions;
- (id)rc_dictionaryByTransformingKeysWithKeyAndValueBlock:()RCAdditions;
- (id)rc_dictionaryByTransformingValuesWithKeyAndValueBlock:()RCAdditions;
- (id)rc_subdictionaryForKeys:()RCAdditions;
@end

@implementation NSDictionary(RCAdditions)

- (id)rc_subdictionaryForKeys:()RCAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(a1, "objectForKeyedSubscript:", v11, (void)v14);
        if (v12) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)rc_dictionaryByTransformingValuesWithKeyAndValueBlock:()RCAdditions
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSDictionary(RCAdditions) rc_dictionaryByTransformingValuesWithKeyAndValueBlock:]();
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__NSDictionary_RCAdditions__rc_dictionaryByTransformingValuesWithKeyAndValueBlock___block_invoke;
  v11[3] = &unk_1E5B76DE8;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v6;

  return v9;
}

+ (id)rc_dictionaryFromData:()RCAdditions error:
{
  if (a3)
  {
    id v5 = a3;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:a4];

    uint64_t v8 = RCCheckedDynamicCast(v6, (uint64_t)v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)rc_dictionaryFromJSON:()RCAdditions error:
{
  id v5 = [a3 dataUsingEncoding:4];
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:a4];
    uint64_t v8 = RCCheckedDynamicCast(v6, (uint64_t)v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (uint64_t)rc_dictionaryFromJSON:()RCAdditions
{
  return objc_msgSend(a1, "rc_dictionaryFromJSON:error:", a3, 0);
}

- (id)rc_dictionaryByTransformingKeysWithKeyAndValueBlock:()RCAdditions
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSDictionary(RCAdditions) rc_dictionaryByTransformingKeysWithKeyAndValueBlock:]();
  }
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__NSDictionary_RCAdditions__rc_dictionaryByTransformingKeysWithKeyAndValueBlock___block_invoke;
  v11[3] = &unk_1E5B76DE8;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v6;

  return v9;
}

- (void)rc_dictionaryByTransformingKeysWithKeyAndValueBlock:()RCAdditions .cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"transformBlock", v6, 2u);
}

- (void)rc_dictionaryByTransformingValuesWithKeyAndValueBlock:()RCAdditions .cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"transformBlock", v6, 2u);
}

@end