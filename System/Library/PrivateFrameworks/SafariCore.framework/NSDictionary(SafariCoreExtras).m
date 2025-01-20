@interface NSDictionary(SafariCoreExtras)
+ (id)safari_dictionaryWithJSONData:()SafariCoreExtras options:;
+ (id)safari_dictionaryWithJSONOrPropertyListData:()SafariCoreExtras;
+ (id)safari_dictionaryWithObjectsInFastEnumerationCollection:()SafariCoreExtras groupedUsingBlock:;
+ (id)safari_dictionaryWithPropertyListData:()SafariCoreExtras options:;
+ (uint64_t)safari_dictionaryWithPropertyListData:()SafariCoreExtras;
- (BOOL)safari_containsEntryPassingTest:()SafariCoreExtras;
- (BOOL)safari_containsObject:()SafariCoreExtras;
- (id)_safari_sortedTupleArray;
- (id)safari_URLForKey:()SafariCoreExtras;
- (id)safari_UUIDForKey:()SafariCoreExtras;
- (id)safari_arrayContainingObjectsOfClass:()SafariCoreExtras forKey:;
- (id)safari_arrayForKey:()SafariCoreExtras;
- (id)safari_dataForKey:()SafariCoreExtras;
- (id)safari_dateForKey:()SafariCoreExtras;
- (id)safari_dictionaryByMergingWithDictionary:()SafariCoreExtras;
- (id)safari_dictionaryByRemovingNullObjects;
- (id)safari_dictionaryForKey:()SafariCoreExtras;
- (id)safari_dictionaryWithLowercaseKeys;
- (id)safari_diffWithDictionary:()SafariCoreExtras;
- (id)safari_jsonRepresentation;
- (id)safari_mapAndFilterKeysAndObjectsUsingBlock:()SafariCoreExtras;
- (id)safari_mapAndFilterKeysUsingBlock:()SafariCoreExtras;
- (id)safari_mapTableForKey:()SafariCoreExtras;
- (id)safari_mutableArrayForKey:()SafariCoreExtras;
- (id)safari_mutableDeepCopy;
- (id)safari_numberForKey:()SafariCoreExtras;
- (id)safari_setForKey:()SafariCoreExtras;
- (id)safari_setValuesFromDictionary:()SafariCoreExtras;
- (id)safari_stringForKey:()SafariCoreExtras;
- (id)safari_stringForKey:()SafariCoreExtras returningNilIfEmpty:;
- (id)safari_userActivityForKey:()SafariCoreExtras;
- (id)safari_valueOfEntryPassingTest:()SafariCoreExtras;
- (id)safari_valuesOfEntriesPassingTest:()SafariCoreExtras;
- (uint64_t)safari_BOOLForKey:()SafariCoreExtras;
@end

@implementation NSDictionary(SafariCoreExtras)

- (uint64_t)safari_BOOLForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "safari_numberForKey:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (id)safari_dictionaryForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_numberForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_arrayForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_stringForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

+ (id)safari_dictionaryWithPropertyListData:()SafariCoreExtras options:
{
  if (a3)
  {
    v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:a4 format:0 error:0];
    objc_opt_class();
    id v5 = 0;
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (uint64_t)safari_dictionaryWithPropertyListData:()SafariCoreExtras
{
  return objc_msgSend(a1, "safari_dictionaryWithPropertyListData:options:", a3, 0);
}

- (id)safari_mapAndFilterKeysAndObjectsUsingBlock:()SafariCoreExtras
{
  id v4 = a3;
  if ([a1 count])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__NSDictionary_SafariCoreExtras__safari_mapAndFilterKeysAndObjectsUsingBlock___block_invoke;
    v10[3] = &unk_1E615B4F8;
    id v12 = v4;
    id v6 = v5;
    id v11 = v6;
    [a1 enumerateKeysAndObjectsUsingBlock:v10];
    v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

- (id)safari_dateForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_URLForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_stringForKey:()SafariCoreExtras returningNilIfEmpty:
{
  id v5 = objc_msgSend(a1, "safari_stringForKey:");
  id v6 = v5;
  if (!a4 || (v7 = (void *)[v5 length]) != 0) {
    v7 = v6;
  }
  id v8 = v7;

  return v8;
}

- (id)safari_dataForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_mutableArrayForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_arrayContainingObjectsOfClass:()SafariCoreExtras forKey:
{
  id v5 = [a1 objectForKey:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__NSDictionary_SafariCoreExtras__safari_arrayContainingObjectsOfClass_forKey___block_invoke;
    v8[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v8[4] = a3;
    id v6 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)safari_UUIDForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_setForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_userActivityForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_dictionaryByMergingWithDictionary:()SafariCoreExtras
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    id v14 = a1;
LABEL_15:
    id v5 = v14;
    goto LABEL_16;
  }
  if (![a1 count])
  {
    id v14 = v4;
    goto LABEL_15;
  }
  id v5 = (void *)[a1 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [a1 objectForKeyedSubscript:v11];

        if (!v12)
        {
          v13 = [v4 objectForKeyedSubscript:v11];
          [v5 setObject:v13 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

LABEL_16:
  return v5;
}

- (id)safari_setValuesFromDictionary:()SafariCoreExtras
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    id v13 = a1;
LABEL_13:
    id v5 = v13;
    goto LABEL_14;
  }
  if (![a1 count])
  {
    id v13 = v4;
    goto LABEL_13;
  }
  id v5 = (void *)[a1 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v4 objectForKeyedSubscript:v11];
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

LABEL_14:
  return v5;
}

- (id)safari_dictionaryWithLowercaseKeys
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([a1 count])
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = objc_msgSend(a1, "allKeys", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = [a1 objectForKeyedSubscript:v8];
            v10 = [v8 lowercaseString];
            [v2 setObject:v9 forKeyedSubscript:v10];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v2;
}

- (id)safari_jsonRepresentation
{
  v1 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a1 options:0 error:0];
  if (v1) {
    uint64_t v2 = (void *)[[NSString alloc] initWithData:v1 encoding:4];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)safari_mapTableForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_mapAndFilterKeysUsingBlock:()SafariCoreExtras
{
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__NSDictionary_SafariCoreExtras__safari_mapAndFilterKeysUsingBlock___block_invoke;
    v10[3] = &unk_1E615B4F8;
    id v12 = v4;
    id v6 = v5;
    id v11 = v6;
    [a1 enumerateKeysAndObjectsUsingBlock:v10];
    uint64_t v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

- (id)_safari_sortedTupleArray
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [a1 allKeys];
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v18[0] = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [a1 objectForKeyedSubscript:(void)v14];
        v18[1] = v10;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
        [v2 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  id v12 = (void *)[v2 copy];
  return v12;
}

- (id)safari_diffWithDictionary:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safari_sortedTupleArray");
  uint64_t v6 = objc_msgSend(v4, "_safari_sortedTupleArray");

  uint64_t v7 = objc_msgSend(v5, "safari_diffWithArray:", v6);

  return v7;
}

- (id)safari_dictionaryByRemovingNullObjects
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  id v11 = __Block_byref_object_dispose__7;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__NSDictionary_SafariCoreExtras__safari_dictionaryByRemovingNullObjects__block_invoke;
  v6[3] = &unk_1E615B520;
  v6[4] = a1;
  v6[5] = &v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v6];
  id v2 = (void *)v8[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)[a1 copy];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)safari_containsObject:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__NSDictionary_SafariCoreExtras__safari_containsObject___block_invoke;
    v9[3] = &unk_1E615B548;
    id v10 = v4;
    uint64_t v6 = [a1 keysOfEntriesPassingTest:v9];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)safari_containsEntryPassingTest:()SafariCoreExtras
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__NSDictionary_SafariCoreExtras__safari_containsEntryPassingTest___block_invoke;
  v9[3] = &unk_1E615B570;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 keysOfEntriesPassingTest:v9];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

+ (id)safari_dictionaryWithJSONData:()SafariCoreExtras options:
{
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:a4 error:0];
    objc_opt_class();
    id v5 = 0;
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)safari_dictionaryWithJSONOrPropertyListData:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "safari_dictionaryWithJSONData:options:", v4, 0);
  if (!v5)
  {
    id v5 = objc_msgSend(a1, "safari_dictionaryWithPropertyListData:", v4);
  }

  return v5;
}

+ (id)safari_dictionaryWithObjectsInFastEnumerationCollection:()SafariCoreExtras groupedUsingBlock:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = v6[2](v6, v13);
        if (v14)
        {
          long long v15 = objc_msgSend(v7, "objectForKeyedSubscript:", v14, (void)v20);

          if (!v15)
          {
            id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v7 setObject:v16 forKeyedSubscript:v14];
          }
          long long v17 = [v7 objectForKeyedSubscript:v14];
          [v17 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  long long v18 = (void *)[v7 copy];
  return v18;
}

- (id)safari_mutableDeepCopy
{
  v1 = objc_msgSend(a1, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_20);
  id v2 = (void *)[v1 mutableCopy];

  return v2;
}

- (id)safari_valueOfEntryPassingTest:()SafariCoreExtras
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__NSDictionary_SafariCoreExtras__safari_valueOfEntryPassingTest___block_invoke;
  v10[3] = &unk_1E615B5B8;
  id v11 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 keysOfEntriesPassingTest:v10];
  id v7 = [v6 anyObject];
  id v8 = [a1 objectForKeyedSubscript:v7];

  return v8;
}

- (id)safari_valuesOfEntriesPassingTest:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __68__NSDictionary_SafariCoreExtras__safari_valuesOfEntriesPassingTest___block_invoke;
  uint64_t v13 = &unk_1E615B4F8;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:&v10];
  id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end