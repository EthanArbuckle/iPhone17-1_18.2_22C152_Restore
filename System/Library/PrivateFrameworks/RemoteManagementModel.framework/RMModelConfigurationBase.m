@interface RMModelConfigurationBase
+ (BOOL)usesKeychainAssets;
+ (id)assetTypes;
+ (id)combineArrayAppend:(id)a3 other:(id)a4;
+ (id)combineBooleanAnd:(id)a3 other:(id)a4;
+ (id)combineBooleanOr:(id)a3 other:(id)a4;
+ (id)combineDictionary:(id)a3 other:(id)a4;
+ (id)combineEnumFirst:(id)a3 other:(id)a4 enums:(id)a5;
+ (id)combineEnumLast:(id)a3 other:(id)a4 enums:(id)a5;
+ (id)combineFirst:(id)a3 other:(id)a4;
+ (id)combineMergeDictionary:(id)a3 other:(id)a4;
+ (id)combineNumberMax:(id)a3 other:(id)a4;
+ (id)combineNumberMin:(id)a3 other:(id)a4;
+ (id)combineSetIntersection:(id)a3 other:(id)a4;
+ (id)combineSetUnion:(id)a3 other:(id)a4;
- (id)assetReferences;
- (id)assetReferencesFromKeyPaths:(id)a3 payloadObject:(id)a4;
- (id)declarationClassType;
- (void)_addAssetReference:(id)a3 identifier:(id)a4 keyPath:(id)a5 result:(id)a6 processedIdentifiers:(id)a7;
- (void)_walkObject:(id)a3 keyPath:(id)a4 assetReference:(id)a5 result:(id)a6 processedIdentifiers:(id)a7;
@end

@implementation RMModelConfigurationBase

- (id)declarationClassType
{
  return @"configuration";
}

+ (BOOL)usesKeychainAssets
{
  if (usesKeychainAssets_onceToken != -1) {
    dispatch_once(&usesKeychainAssets_onceToken, &__block_literal_global_11);
  }
  v3 = (void *)usesKeychainAssets_keychainTypes;
  v4 = [a1 assetTypes];
  LOBYTE(v3) = [v3 intersectsSet:v4];

  return (char)v3;
}

uint64_t __46__RMModelConfigurationBase_usesKeychainAssets__block_invoke()
{
  usesKeychainAssets_keychainTypes = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BDAE0];
  return MEMORY[0x270F9A758]();
}

+ (id)assetTypes
{
  v2 = objc_opt_new();
  return v2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)assetReferencesFromKeyPaths:(id)a3 payloadObject:(id)a4
{
  v19 = self;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v22 = a4;
  v21 = objc_opt_new();
  v20 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "keyPath", v19);
        v13 = [v12 componentsSeparatedByString:@"."];

        v14 = [v13 firstObject];
        int v15 = [v14 isEqualToString:@"$"];

        if (v15)
        {
          v16 = objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
          [(RMModelConfigurationBase *)v19 _walkObject:v22 keyPath:v16 assetReference:v11 result:v21 processedIdentifiers:v20];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  v17 = (void *)[v21 copy];
  return v17;
}

- (void)_walkObject:(id)a3 keyPath:(id)a4 assetReference:(id)a5 result:(id)a6 processedIdentifiers:(id)a7
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v17 = [v13 firstObject];
    v18 = [v12 valueForKey:v17];

    if ([v13 count] == 1)
    {
      if (v18)
      {
        v19 = [v13 objectAtIndexedSubscript:0];
        [(RMModelConfigurationBase *)self _addAssetReference:v14 identifier:v18 keyPath:v19 result:v15 processedIdentifiers:v16];
LABEL_8:
      }
    }
    else if (v18)
    {
      v19 = objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
      [(RMModelConfigurationBase *)self _walkObject:v18 keyPath:v19 assetReference:v14 result:v15 processedIdentifiers:v16];
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v13 firstObject],
        v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = [v20 isEqualToString:@"*"],
        v20,
        v21))
  {
    if ([v13 count] == 1)
    {
      id v22 = v13;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v35 = v12;
      id obj = v12;
      uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v43;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v43 != v25) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v42 + 1) + 8 * v26);
            uint64_t v28 = objc_msgSend(v22, "objectAtIndexedSubscript:", 0, v35);
            [(RMModelConfigurationBase *)self _addAssetReference:v14 identifier:v27 keyPath:v28 result:v15 processedIdentifiers:v16];

            ++v26;
          }
          while (v24 != v26);
          uint64_t v24 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v24);
      }

      id v12 = v35;
      id v13 = v22;
    }
    else
    {
      id obja = v13;
      v29 = objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v30 = v12;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v39;
        do
        {
          uint64_t v34 = 0;
          do
          {
            if (*(void *)v39 != v33) {
              objc_enumerationMutation(v30);
            }
            [(RMModelConfigurationBase *)self _walkObject:*(void *)(*((void *)&v38 + 1) + 8 * v34++) keyPath:v29 assetReference:v14 result:v15 processedIdentifiers:v16];
          }
          while (v32 != v34);
          uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v32);
      }

      id v13 = obja;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[RMModelConfigurationBase _walkObject:keyPath:assetReference:result:processedIdentifiers:](v14);
  }
LABEL_10:
}

- (void)_addAssetReference:(id)a3 identifier:(id)a4 keyPath:(id)a5 result:(id)a6 processedIdentifiers:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v15 containsObject:v12] & 1) == 0)
    {
      id v16 = [RMModelAssetReference alloc];
      v17 = [v11 assetTypes];
      v18 = [(RMModelAssetReference *)v16 initWithIdentifier:v12 assetTypes:v17];
      [v14 addObject:v18];

      [v15 addObject:v12];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[RMModelConfigurationBase _addAssetReference:identifier:keyPath:result:processedIdentifiers:](v11);
  }
}

+ (id)combineBooleanOr:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    if (v6)
    {
      uint64_t v8 = NSNumber;
      if ([v5 BOOLValue]) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = [v7 BOOLValue];
      }
      id v10 = [v8 numberWithBool:v9];
    }
    else
    {
      id v10 = v5;
    }
  }
  else
  {
    id v10 = v6;
  }
  id v11 = v10;

  return v11;
}

+ (id)combineBooleanAnd:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    if (v6)
    {
      uint64_t v8 = NSNumber;
      if ([v5 BOOLValue]) {
        uint64_t v9 = [v7 BOOLValue];
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = [v8 numberWithBool:v9];
    }
    else
    {
      id v10 = v5;
    }
  }
  else
  {
    id v10 = v6;
  }
  id v11 = v10;

  return v11;
}

+ (id)combineNumberMin:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v8 = v6;
  if (v5)
  {
    uint64_t v8 = v5;
    if (v6)
    {
      if ([v5 compare:v6] == -1) {
        uint64_t v8 = v5;
      }
      else {
        uint64_t v8 = v7;
      }
    }
  }
  id v9 = v8;

  return v9;
}

+ (id)combineNumberMax:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v8 = v6;
  if (v5)
  {
    uint64_t v8 = v5;
    if (v6)
    {
      if ([v5 compare:v6] == 1) {
        uint64_t v8 = v5;
      }
      else {
        uint64_t v8 = v7;
      }
    }
  }
  id v9 = v8;

  return v9;
}

+ (id)combineEnumFirst:(id)a3 other:(id)a4 enums:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7)
  {
    if (!v8
      || (unint64_t v11 = [v9 indexOfObject:v7],
          unint64_t v12 = [v10 indexOfObject:v8],
          v12 == 0x7FFFFFFFFFFFFFFFLL))
    {
      id v13 = v7;
      goto LABEL_7;
    }
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v11 >= v12) {
        unint64_t v16 = v12;
      }
      else {
        unint64_t v16 = v11;
      }
      id v13 = [v10 objectAtIndexedSubscript:v16];
      goto LABEL_7;
    }
  }
  id v13 = v8;
LABEL_7:
  id v14 = v13;

  return v14;
}

+ (id)combineEnumLast:(id)a3 other:(id)a4 enums:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7)
  {
    if (!v8
      || (unint64_t v11 = [v9 indexOfObject:v7],
          unint64_t v12 = [v10 indexOfObject:v8],
          v12 == 0x7FFFFFFFFFFFFFFFLL))
    {
      id v13 = v7;
      goto LABEL_7;
    }
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v11 <= v12) {
        unint64_t v16 = v12;
      }
      else {
        unint64_t v16 = v11;
      }
      id v13 = [v10 objectAtIndexedSubscript:v16];
      goto LABEL_7;
    }
  }
  id v13 = v8;
LABEL_7:
  id v14 = v13;

  return v14;
}

+ (id)combineFirst:(id)a3 other:(id)a4
{
  if (a3) {
    return a3;
  }
  else {
    return a4;
  }
}

+ (id)combineArrayAppend:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      id v8 = [v5 arrayByAddingObjectsFromArray:v6];
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    id v8 = v6;
  }
  id v9 = v8;

  return v9;
}

+ (id)combineSetUnion:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      id v8 = [MEMORY[0x263EFF9C0] setWithArray:v5];
      id v9 = [MEMORY[0x263EFFA08] setWithArray:v7];
      [v8 unionSet:v9];
      id v10 = [v8 allObjects];

      goto LABEL_7;
    }
    id v11 = v5;
  }
  else
  {
    id v11 = v6;
  }
  id v10 = v11;
LABEL_7:

  return v10;
}

+ (id)combineSetIntersection:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      id v8 = [MEMORY[0x263EFF9C0] setWithArray:v5];
      id v9 = [MEMORY[0x263EFFA08] setWithArray:v7];
      [v8 intersectSet:v9];
      id v10 = [v8 allObjects];

      goto LABEL_7;
    }
    id v11 = v5;
  }
  else
  {
    id v11 = v6;
  }
  id v10 = v11;
LABEL_7:

  return v10;
}

+ (id)combineDictionary:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6) {
      [v5 combineWithOther:v6];
    }
    id v8 = v5;
  }
  else
  {
    id v8 = (id)[v6 copyWithZone:0];
  }
  id v9 = v8;

  return v9;
}

+ (id)combineMergeDictionary:(id)a3 other:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v19 = (id)[v6 copyWithZone:0];
LABEL_19:
    v18 = v19;
    goto LABEL_20;
  }
  if (!v6)
  {
    id v19 = v5;
    goto LABEL_19;
  }
  id v22 = v5;
  id v8 = (void *)[v5 mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v21 = v7;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v15 = objc_msgSend(v8, "objectForKeyedSubscript:", v14, v21);
        uint64_t v16 = [v9 objectForKeyedSubscript:v14];
        v17 = (void *)v16;
        if (v15)
        {
          if (v16 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v15 combineWithOther:v17];
          }
        }
        else
        {
          [v8 setObject:v16 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  v18 = (void *)[v8 copy];
  id v7 = v21;
  id v5 = v22;
LABEL_20:

  return v18;
}

- (void)_walkObject:(void *)a1 keyPath:assetReference:result:processedIdentifiers:.cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1 = [a1 keyPath];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Asset reference key path failed: %{public}@ at %{public}@", v2, 0x16u);
}

- (void)_addAssetReference:(void *)a1 identifier:keyPath:result:processedIdentifiers:.cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1 = [a1 keyPath];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_25AF84000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Asset reference key wrong type: %{public}@ at %{public}@", v2, 0x16u);
}

@end