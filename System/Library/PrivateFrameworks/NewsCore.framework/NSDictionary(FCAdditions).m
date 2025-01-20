@interface NSDictionary(FCAdditions)
+ (id)fc_dictionary:()FCAdditions;
+ (id)fc_dictionaryByAddingEntriesFromDictionary:()FCAdditions toDictionary:;
+ (id)fc_dictionaryFromArray:()FCAdditions keyBlock:valueBlock:;
+ (id)fc_dictionaryFromJSON:()FCAdditions error:;
+ (id)fc_dictionaryWithKeys:()FCAdditions allowingNil:valueBlock:;
+ (id)fc_dictionaryWithKeys:()FCAdditions valueWithIndexBlock:;
+ (id)fc_dictionaryWithObjects:()FCAdditions keyBlock:;
+ (uint64_t)fc_dictionaryFromJSON:()FCAdditions;
+ (uint64_t)fc_dictionaryWithKeys:()FCAdditions valueBlock:;
- (id)fc_arrayByTransformingWithKeyAndValueBlock:()FCAdditions;
- (id)fc_deepCopy;
- (id)fc_dictionaryByMergingDictionary:()FCAdditions withValueCombiner:;
- (id)fc_dictionaryByRemovingObjectForKey:()FCAdditions;
- (id)fc_dictionaryBySwappingValuesAndKeys;
- (id)fc_dictionaryByTransformingKeysWithBlock:()FCAdditions;
- (id)fc_dictionaryByTransformingKeysWithKeyAndValueBlock:()FCAdditions;
- (id)fc_dictionaryByTransformingValuesWithBlock:()FCAdditions;
- (id)fc_dictionaryByTransformingValuesWithKeyAndValueBlock:()FCAdditions;
- (id)fc_jsonEncodableDictionaryWithObjectHandler:()FCAdditions arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:;
- (id)fc_jsonString;
- (id)fc_jsonStringWithObjectHandler:()FCAdditions arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:;
- (id)fc_jsonStringWithOmittedUnsupportedDataTypes;
- (id)fc_safeObjectForKey:()FCAdditions;
- (id)fc_sortedEntriesWithKeyBlock:()FCAdditions;
- (id)fc_subdictionaryForKeys:()FCAdditions;
- (id)fc_subdictionaryWithCopiesForKeys:()FCAdditions;
- (id)fr_descriptionWithKeyComparator:()FCAdditions;
- (id)nf_mutableObjectsForKeysWithoutMarker:()FCAdditions;
- (uint64_t)fc_jsonEncodableDictionary;
@end

@implementation NSDictionary(FCAdditions)

+ (id)fc_dictionary:()FCAdditions
{
  v3 = a3;
  v4 = objc_opt_new();
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = (void *)[v4 copy];
  v6 = v5;
  if (!v5) {
    v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v7 = v5;

  return v7;
}

+ (id)fc_dictionaryFromArray:()FCAdditions keyBlock:valueBlock:
{
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  id v9 = a3;
  v10 = objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", a5);
  v11 = objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", v8);

  v12 = [v7 dictionaryWithObjects:v10 forKeys:v11];

  return v12;
}

- (id)fc_dictionaryByTransformingKeysWithBlock:()FCAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transformBlock");
    *(_DWORD *)buf = 136315906;
    v16 = "-[NSDictionary(FCAdditions) fc_dictionaryByTransformingKeysWithBlock:]";
    __int16 v17 = 2080;
    v18 = "NSDictionary+FCAdditions.m";
    __int16 v19 = 1024;
    int v20 = 68;
    __int16 v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__NSDictionary_FCAdditions__fc_dictionaryByTransformingKeysWithBlock___block_invoke;
  v12[3] = &unk_1E5B59100;
  id v14 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)nf_mutableObjectsForKeysWithoutMarker:()FCAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)fc_dictionaryFromJSON:()FCAdditions error:
{
  v5 = [a3 dataUsingEncoding:4];
  if (v5)
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:a4];
    uint64_t v8 = FCCheckedDynamicCast(v6, (uint64_t)v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)fc_dictionaryWithKeys:()FCAdditions allowingNil:valueBlock:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "valueBlock");
    *(_DWORD *)buf = 136315906;
    v28 = "+[NSDictionary(FCAdditions) fc_dictionaryWithKeys:allowingNil:valueBlock:]";
    __int16 v29 = 2080;
    v30 = "NSDictionary+FCAdditions.m";
    __int16 v31 = 1024;
    int v32 = 161;
    __int16 v33 = 2114;
    v34 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    long long v13 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = v8[2](v8, v15);
        __int16 v17 = (void *)v16;
        if ((a4 & 1) != 0 || v16)
        {
          if (v16) {
            [v21 setObject:v16 forKeyedSubscript:v15];
          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "value");
          *(_DWORD *)buf = 136315906;
          v28 = "+[NSDictionary(FCAdditions) fc_dictionaryWithKeys:allowingNil:valueBlock:]";
          __int16 v29 = 2080;
          v30 = "NSDictionary+FCAdditions.m";
          __int16 v31 = 1024;
          int v32 = 170;
          __int16 v33 = 2114;
          v34 = v18;
          _os_log_error_impl(&dword_1A460D000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  return v21;
}

+ (id)fc_dictionaryByAddingEntriesFromDictionary:()FCAdditions toDictionary:
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 dictionary];
  [v8 addEntriesFromDictionary:v6];

  [v8 addEntriesFromDictionary:v7];
  return v8;
}

- (id)fc_subdictionaryForKeys:()FCAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
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
        uint64_t v12 = objc_msgSend(a1, "objectForKeyedSubscript:", v11, (void)v14);
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

- (id)fc_safeObjectForKey:()FCAdditions
{
  if (a3)
  {
    id v4 = objc_msgSend(a1, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (uint64_t)fc_dictionaryFromJSON:()FCAdditions
{
  return objc_msgSend(a1, "fc_dictionaryFromJSON:error:", a3, 0);
}

- (id)fc_dictionaryByTransformingKeysWithKeyAndValueBlock:()FCAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transformBlock");
    *(_DWORD *)buf = 136315906;
    long long v16 = "-[NSDictionary(FCAdditions) fc_dictionaryByTransformingKeysWithKeyAndValueBlock:]";
    __int16 v17 = 2080;
    uint64_t v18 = "NSDictionary+FCAdditions.m";
    __int16 v19 = 1024;
    int v20 = 53;
    __int16 v21 = 2114;
    long long v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__NSDictionary_FCAdditions__fc_dictionaryByTransformingKeysWithKeyAndValueBlock___block_invoke;
  v12[3] = &unk_1E5B59100;
  id v14 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)fc_sortedEntriesWithKeyBlock:()FCAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transformBlock");
    *(_DWORD *)buf = 136315906;
    long long v16 = "-[NSDictionary(FCAdditions) fc_sortedEntriesWithKeyBlock:]";
    __int16 v17 = 2080;
    uint64_t v18 = "NSDictionary+FCAdditions.m";
    __int16 v19 = 1024;
    int v20 = 83;
    __int16 v21 = 2114;
    long long v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__NSDictionary_FCAdditions__fc_sortedEntriesWithKeyBlock___block_invoke;
  v12[3] = &unk_1E5B59100;
  id v14 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)fc_dictionaryByTransformingValuesWithKeyAndValueBlock:()FCAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transformBlock");
    *(_DWORD *)buf = 136315906;
    long long v16 = "-[NSDictionary(FCAdditions) fc_dictionaryByTransformingValuesWithKeyAndValueBlock:]";
    __int16 v17 = 2080;
    uint64_t v18 = "NSDictionary+FCAdditions.m";
    __int16 v19 = 1024;
    int v20 = 106;
    __int16 v21 = 2114;
    long long v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__NSDictionary_FCAdditions__fc_dictionaryByTransformingValuesWithKeyAndValueBlock___block_invoke;
  v12[3] = &unk_1E5B59100;
  id v14 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)fc_dictionaryByTransformingValuesWithBlock:()FCAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transformBlock");
    *(_DWORD *)buf = 136315906;
    long long v16 = "-[NSDictionary(FCAdditions) fc_dictionaryByTransformingValuesWithBlock:]";
    __int16 v17 = 2080;
    uint64_t v18 = "NSDictionary+FCAdditions.m";
    __int16 v19 = 1024;
    int v20 = 121;
    __int16 v21 = 2114;
    long long v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__NSDictionary_FCAdditions__fc_dictionaryByTransformingValuesWithBlock___block_invoke;
  v12[3] = &unk_1E5B59100;
  id v14 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)fc_dictionaryByRemovingObjectForKey:()FCAdditions
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 removeObjectForKey:v4];

  return v5;
}

+ (id)fc_dictionaryWithObjects:()FCAdditions keyBlock:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "keyBlock");
    *(_DWORD *)buf = 136315906;
    long long v25 = "+[NSDictionary(FCAdditions) fc_dictionaryWithObjects:keyBlock:]";
    __int16 v26 = 2080;
    v27 = "NSDictionary+FCAdditions.m";
    __int16 v28 = 1024;
    int v29 = 143;
    __int16 v30 = 2114;
    __int16 v31 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    uint64_t v12 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = v6[2](v6, v14);
        if (v15)
        {
          [v7 setObject:v14 forKeyedSubscript:v15];
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          long long v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "key");
          *(_DWORD *)buf = 136315906;
          long long v25 = "+[NSDictionary(FCAdditions) fc_dictionaryWithObjects:keyBlock:]";
          __int16 v26 = 2080;
          v27 = "NSDictionary+FCAdditions.m";
          __int16 v28 = 1024;
          int v29 = 149;
          __int16 v30 = 2114;
          __int16 v31 = v16;
          _os_log_error_impl(&dword_1A460D000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (uint64_t)fc_dictionaryWithKeys:()FCAdditions valueBlock:
{
  return objc_msgSend(a1, "fc_dictionaryWithKeys:allowingNil:valueBlock:", a3, 0, a4);
}

+ (id)fc_dictionaryWithKeys:()FCAdditions valueWithIndexBlock:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "valueWithIndexBlock");
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "+[NSDictionary(FCAdditions) fc_dictionaryWithKeys:valueWithIndexBlock:]";
    __int16 v19 = 2080;
    long long v20 = "NSDictionary+FCAdditions.m";
    __int16 v21 = 1024;
    int v22 = 190;
    __int16 v23 = 2114;
    long long v24 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__NSDictionary_FCAdditions__fc_dictionaryWithKeys_valueWithIndexBlock___block_invoke;
  v14[3] = &unk_1E5B58590;
  id v16 = v6;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v14];
  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

- (id)fc_subdictionaryWithCopiesForKeys:()FCAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
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
        uint64_t v12 = objc_msgSend(a1, "objectForKeyedSubscript:", v11, (void)v15);
        id v13 = (void *)[v12 copy];

        if (v13) {
          [v5 setObject:v13 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)fc_deepCopy
{
  v2 = [a1 allKeys];
  uint64_t v3 = objc_msgSend(a1, "fc_subdictionaryWithCopiesForKeys:", v2);

  return v3;
}

- (id)fc_dictionaryBySwappingValuesAndKeys
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, (void)v11);
        [v2 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)fr_descriptionWithKeyComparator:()FCAdditions
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28E78];
  id v5 = a3;
  uint64_t v6 = [v4 stringWithString:@"{\n"];
  uint64_t v7 = [a1 allKeys];
  uint64_t v8 = [v7 sortedArrayUsingComparator:v5];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  long long v14 = __61__NSDictionary_FCAdditions__fr_descriptionWithKeyComparator___block_invoke;
  long long v15 = &unk_1E5B54E38;
  id v16 = v6;
  long long v17 = a1;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:&v12];

  objc_msgSend(v9, "appendString:", @"}", v12, v13, v14, v15);
  uint64_t v10 = (void *)[v9 copy];

  return v10;
}

- (id)fc_jsonStringWithOmittedUnsupportedDataTypes
{
  objc_opt_class();
  v2 = fc_JSONEncodableObjectWithObjectHandlers(a1, 0, 0, 0, 0);
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = objc_msgSend(v4, "fc_jsonString");

  return v5;
}

- (id)fc_jsonEncodableDictionaryWithObjectHandler:()FCAdditions arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  objc_opt_class();
  long long v14 = fc_JSONEncodableObjectWithObjectHandlers(a1, v13, v12, v11, v10);

  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      long long v15 = v14;
    }
    else {
      long long v15 = 0;
    }
  }
  else
  {
    long long v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (uint64_t)fc_jsonEncodableDictionary
{
  return objc_msgSend(a1, "fc_jsonEncodableDictionaryWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:", 0, 0, 0, 0);
}

- (id)fc_jsonStringWithObjectHandler:()FCAdditions arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:
{
  v1 = objc_msgSend(a1, "fc_jsonEncodableDictionaryWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:");
  v2 = objc_msgSend(v1, "fc_jsonString");

  return v2;
}

- (id)fc_jsonString
{
  uint64_t v4 = 0;
  v1 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a1 options:0 error:&v4];
  if (v1) {
    v2 = (void *)[[NSString alloc] initWithData:v1 encoding:4];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)fc_dictionaryByMergingDictionary:()FCAdditions withValueCombiner:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__NSDictionary_FCAdditions__fc_dictionaryByMergingDictionary_withValueCombiner___block_invoke;
  v13[3] = &unk_1E5B59150;
  v13[4] = a1;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = objc_msgSend(v8, "fc_dictionary:", v13);

  return v11;
}

- (id)fc_arrayByTransformingWithKeyAndValueBlock:()FCAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__NSDictionary_FCAdditions__fc_arrayByTransformingWithKeyAndValueBlock___block_invoke;
  v11[3] = &unk_1E5B59178;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v6;

  return v9;
}

@end