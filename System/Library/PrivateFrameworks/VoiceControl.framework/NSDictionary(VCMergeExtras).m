@interface NSDictionary(VCMergeExtras)
- (id)dictionaryByMergingEntriesFromDictionary:()VCMergeExtras;
@end

@implementation NSDictionary(VCMergeExtras)

- (id)dictionaryByMergingEntriesFromDictionary:()VCMergeExtras
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (id)objc_opt_new();
    v6 = objc_opt_new();
    v7 = [a1 allKeys];
    [v6 addObjectsFromArray:v7];

    v8 = [v4 allKeys];
    [v6 addObjectsFromArray:v8];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (!v10) {
      goto LABEL_33;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v43;
    id v35 = v4;
    uint64_t v36 = *(void *)v43;
    v33 = a1;
    v34 = v5;
    id v32 = v9;
    while (1)
    {
      uint64_t v13 = 0;
      uint64_t v37 = v11;
      do
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v42 + 1) + 8 * v13);
        v15 = objc_msgSend(a1, "objectForKeyedSubscript:", v14, v32, v33);
        v16 = [v4 objectForKeyedSubscript:v14];
        if (!v16) {
          goto LABEL_29;
        }
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [v15 setByAddingObjectsFromSet:v16];
            goto LABEL_11;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = v16;
            v22 = (void *)[v15 mutableCopy];
            [v22 unionOrderedSet:v21];

            uint64_t v11 = v37;
            [v5 setObject:v22 forKeyedSubscript:v14];

            uint64_t v12 = v36;
            goto LABEL_31;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = v16;
            v24 = (void *)[v15 mutableCopy];
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id v25 = v23;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v39;
              do
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v39 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v38 + 1) + 8 * i);
                  if (([v24 containsObject:v30] & 1) == 0) {
                    [v24 addObject:v30];
                  }
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
              }
              while (v27);
            }

            id v5 = v34;
            [v34 setObject:v24 forKeyedSubscript:v14];

            id v4 = v35;
            uint64_t v12 = v36;
            id v9 = v32;
            a1 = v33;
            goto LABEL_12;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [v15 dictionaryByMergingEntriesFromDictionary:v16];
LABEL_11:
            v18 = (void *)v17;
            [v5 setObject:v17 forKeyedSubscript:v14];

LABEL_12:
            uint64_t v11 = v37;
            goto LABEL_31;
          }
LABEL_29:
          v19 = v5;
          v20 = v15;
          goto LABEL_30;
        }
        v19 = v5;
        v20 = v16;
LABEL_30:
        [v19 setObject:v20 forKeyedSubscript:v14];
LABEL_31:

        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (!v11)
      {
LABEL_33:

        goto LABEL_35;
      }
    }
  }
  id v5 = a1;
LABEL_35:

  return v5;
}

@end