@interface WBSWebExtensionUtilities
+ (BOOL)isProfileServerIDForDefaultProfile:(id)a3;
+ (BOOL)isTabIDValid:(double)a3;
+ (BOOL)isWindowIDValid:(double)a3;
+ (BOOL)validateContentsOfDictionary:(id)a3 requiredKeys:(id)a4 optionalKeys:(id)a5 keyToExpectedValueType:(id)a6 outExceptionString:(id *)a7;
+ (double)nextTabID;
+ (double)nextWindowID;
+ (double)storageSizeForKeyOrValue:(id)a3;
+ (double)storageSizeForKeysAndValues:(id)a3;
+ (id)serializeObjectToJSON:(id)a3;
+ (id)tabIDToTabPositionDictionaryForTabs:(id)a3;
@end

@implementation WBSWebExtensionUtilities

+ (BOOL)isProfileServerIDForDefaultProfile:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F984B8]];
}

+ (double)nextTabID
{
  double result = *(double *)&+[WBSWebExtensionUtilities nextTabID]::currentTabIDForWebExtension;
  do
    double result = result + 1.0;
  while (result == -1.0 || result == 0.0 || result == -100.0);
  +[WBSWebExtensionUtilities nextTabID]::currentTabIDForWebExtension = *(void *)&result;
  return result;
}

+ (double)nextWindowID
{
  double result = *(double *)&+[WBSWebExtensionUtilities nextWindowID]::currentWindowIDForWebExtension;
  do
    double result = result + 1.0;
  while (result == -1.0 || result == -2.0 || result == 0.0 || result == -100.0);
  +[WBSWebExtensionUtilities nextWindowID]::currentWindowIDForWebExtension = *(void *)&result;
  return result;
}

+ (BOOL)validateContentsOfDictionary:(id)a3 requiredKeys:(id)a4 optionalKeys:(id)a5 keyToExpectedValueType:(id)a6 outExceptionString:(id *)a7
{
  id v30 = a3;
  id v11 = a4;
  id v12 = a5;
  id v28 = a6;
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v11];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__32;
  v41 = __Block_byref_object_dispose__32;
  id v42 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __125__WBSWebExtensionUtilities_validateContentsOfDictionary_requiredKeys_optionalKeys_keyToExpectedValueType_outExceptionString___block_invoke;
  v31[3] = &unk_1E5E46C50;
  id v15 = v13;
  id v32 = v15;
  id v16 = v14;
  id v33 = v16;
  id v17 = v28;
  id v34 = v17;
  v36 = &v37;
  id v18 = v29;
  id v35 = v18;
  [v30 enumerateKeysAndObjectsUsingBlock:v31];
  uint64_t v19 = [v18 count];
  v20 = v38;
  if (v19 && !v38[5])
  {
    v21 = [v18 allObjects];
    v22 = [v21 componentsJoinedByString:@", "];

    uint64_t v23 = [NSString stringWithFormat:@"Missing required keys: %@.", v22, v28];
    v24 = (void *)v38[5];
    v38[5] = v23;

    v20 = v38;
  }
  v25 = (void *)v20[5];
  if (v25)
  {
    *a7 = v25;
    BOOL v26 = v38[5] == 0;
  }
  else
  {
    BOOL v26 = 1;
  }

  _Block_object_dispose(&v37, 8);
  return v26;
}

void __125__WBSWebExtensionUtilities_validateContentsOfDictionary_requiredKeys_optionalKeys_keyToExpectedValueType_outExceptionString___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (([*(id *)(a1 + 32) containsObject:v7] & 1) != 0
    || ([*(id *)(a1 + 40) containsObject:v7] & 1) != 0)
  {
    id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    uint64_t v39 = v11;
    if (v11)
    {
      id v12 = (objc_class *)[v11 firstObject];
      id v13 = v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
      id v15 = v14;

      if (v15)
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v41;
          id v38 = v8;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v41 != v18) {
                objc_enumerationMutation(v16);
              }
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                *a4 = 1;
                v21 = NSString;
                id v8 = v38;
                v22 = classToClassString(v12, 1);
                uint64_t v23 = (objc_class *)objc_opt_class();
                v24 = classToClassString(v23, 0);
                uint64_t v25 = [v21 stringWithFormat:@"Expected %@ in the array for '%@', found %@ instead.", v22, v7, v24, v15];
                uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
                v27 = *(void **)(v26 + 40);
                *(void *)(v26 + 40) = v25;

                goto LABEL_28;
              }
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
            id v8 = v38;
            if (v17) {
              continue;
            }
            break;
          }
        }

        goto LABEL_21;
      }
      *a4 = 1;
      uint64_t v28 = [NSString stringWithFormat:@"Expected an array for '%@'.", v7];
      uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
      id v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
LABEL_21:
        if ([*(id *)(a1 + 32) containsObject:v7]) {
          [*(id *)(a1 + 56) removeObject:v7];
        }
        goto LABEL_28;
      }
      *a4 = 1;
      v31 = NSString;
      id v32 = classToClassString((objc_class *)v9, 0);
      id v33 = (objc_class *)objc_opt_class();
      id v34 = classToClassString(v33, 0);
      uint64_t v35 = [v31 stringWithFormat:@"Expected %@ for '%@', found %@ instead.", v32, v7, v34];
      uint64_t v36 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v37 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v35;
    }
LABEL_28:

    goto LABEL_29;
  }
  v20 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v46 = v7;
    _os_log_impl(&dword_1ABB70000, v20, OS_LOG_TYPE_INFO, "Found unrecognized key (%{private}@), not specified in required or optional keys.", buf, 0xCu);
  }
LABEL_29:
}

+ (BOOL)isTabIDValid:(double)a3
{
  return a3 > -1.0;
}

+ (BOOL)isWindowIDValid:(double)a3
{
  return a3 >= -2.0 && a3 != -1.0;
}

+ (id)serializeObjectToJSON:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v10 = 0;
    v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v10];
    id v5 = v10;
    if (v5)
    {
      v6 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = objc_msgSend(v5, "safari_privacyPreservingDescription");
        +[WBSWebExtensionUtilities serializeObjectToJSON:]((uint64_t)v3, v7, buf, v6);
      }

      id v8 = 0;
    }
    else
    {
      id v8 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (double)storageSizeForKeyOrValue:(id)a3
{
  return (double)(unint64_t)[a3 lengthOfBytesUsingEncoding:4];
}

+ (double)storageSizeForKeysAndValues:(id)a3
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__WBSWebExtensionUtilities_storageSizeForKeysAndValues___block_invoke;
  v5[3] = &unk_1E5E46C78;
  v5[4] = &v6;
  v5[5] = a1;
  [a3 enumerateKeysAndObjectsUsingBlock:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __56__WBSWebExtensionUtilities_storageSizeForKeysAndValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  [(id)objc_opt_class() storageSizeForKeyOrValue:v9];
  double v7 = v6;
  [(id)objc_opt_class() storageSizeForKeyOrValue:v5];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7
                                                              + v8
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
}

+ (id)tabIDToTabPositionDictionaryForTabs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v14;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [[WBSWebExtensionTabPosition alloc] initWithTab:v8];
        id v10 = NSNumber;
        [v8 idForWebExtensions];
        id v11 = objc_msgSend(v10, "numberWithDouble:");
        [v3 setObject:v9 forKeyedSubscript:v11];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  uint64_t v12 = (void *)[v3 copy];
  return v12;
}

+ (void)serializeObjectToJSON:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138478083;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Error serializing %{private}@: %{public}@", buf, 0x16u);
}

@end