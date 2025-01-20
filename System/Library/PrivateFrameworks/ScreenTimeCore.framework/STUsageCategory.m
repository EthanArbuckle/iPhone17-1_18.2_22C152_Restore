@interface STUsageCategory
+ (id)applicationAndWebItemsExcludingSystemHiddenApplications:(id)a3;
+ (id)categoryItemsExcludingSystemCategories:(id)a3;
@end

@implementation STUsageCategory

+ (id)categoryItemsExcludingSystemCategories:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  v3 = [v20 valueForKeyPath:@"@distinctUnionOfObjects.identifier"];
  v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    uint64_t v8 = *MEMORY[0x1E4F58068];
    uint64_t v9 = *MEMORY[0x1E4F58050];
    uint64_t v10 = *MEMORY[0x1E4F58078];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v12 isEqualToString:v8] & 1) == 0
          && ([v12 isEqualToString:v9] & 1) == 0
          && ([v12 isEqualToString:v10] & 1) == 0)
        {
          v13 = [[STUsageDetailItem alloc] initWithType:3 identifier:v12 usageTrusted:1];
          v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"identifier", v12];
          v15 = [v20 filteredArrayUsingPredicate:v14];

          v16 = [v15 valueForKeyPath:@"@sum.totalTimeInSeconds"];
          [v16 floatValue];
          -[STUsageDetailItem setQuantity:](v13, "setQuantity:");

          [v19 addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  v17 = (void *)[v19 copy];
  return v17;
}

+ (id)applicationAndWebItemsExcludingSystemHiddenApplications:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v48 = objc_opt_new();
  id v4 = objc_opt_new();
  uint64_t v5 = [MEMORY[0x1E4F580A0] systemHiddenBundleIdentifiersForDeviceFamily:102];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v3;
  uint64_t v45 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v56;
    unint64_t v6 = 0x1E6BC6000uLL;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v56 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = v7;
        uint64_t v8 = *(void **)(*((void *)&v55 + 1) + 8 * v7);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v9 = [v8 timedItems];
        uint64_t v50 = [v9 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v50)
        {
          uint64_t v49 = *(void *)v52;
          v47 = v9;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v52 != v49) {
                objc_enumerationMutation(v9);
              }
              v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              v12 = [v11 bundleIdentifier];
              uint64_t v13 = [v11 usageTrusted];
              if (v12 && ([v5 containsObject:v12] & 1) == 0)
              {
                long long v23 = (void *)[objc_alloc(*(Class *)(v6 + 2976)) initWithIdentifier:v12 usageTrusted:v13];
                float v24 = (float)[v11 totalTimeInSeconds];
                id v25 = v23;
                id v17 = v48;
                uint64_t v26 = [v17 objectForKeyedSubscript:v25];
                if (v26)
                {
                  v18 = v26;
                  [(STUsageDetailItem *)v26 quantity];
                  *(float *)&double v28 = v27 + v24;
                  [(STUsageDetailItem *)v18 setQuantity:v28];
                }
                else
                {
                  v35 = [STUsageDetailItem alloc];
                  v36 = [v25 identifier];
                  v18 = -[STUsageDetailItem initWithType:identifier:usageTrusted:](v35, "initWithType:identifier:usageTrusted:", 1, v36, [v25 usageTrusted]);

                  *(float *)&double v37 = v24;
                  [(STUsageDetailItem *)v18 setQuantity:v37];
                  [v17 setObject:v18 forKeyedSubscript:v25];
                }
                v14 = v25;
              }
              else
              {
                v14 = [v11 domain];
                if (!v14) {
                  goto LABEL_23;
                }
                v15 = (void *)[objc_alloc(*(Class *)(v6 + 2976)) initWithIdentifier:v14 usageTrusted:v13];
                float v16 = (float)[v11 totalTimeInSeconds];
                id v17 = v15;
                v18 = v4;
                v19 = [(STUsageDetailItem *)v18 objectForKeyedSubscript:v17];
                if (v19)
                {
                  id v20 = v19;
                  [(STUsageDetailItem *)v19 quantity];
                  *(float *)&double v22 = v21 + v16;
                  [(STUsageDetailItem *)v20 setQuantity:v22];
                }
                else
                {
                  v29 = [STUsageDetailItem alloc];
                  [v17 identifier];
                  unint64_t v30 = v6;
                  v31 = v5;
                  v33 = v32 = v4;
                  id v20 = -[STUsageDetailItem initWithType:identifier:usageTrusted:](v29, "initWithType:identifier:usageTrusted:", 2, v33, [v17 usageTrusted]);

                  id v4 = v32;
                  uint64_t v5 = v31;
                  unint64_t v6 = v30;
                  uint64_t v9 = v47;
                  *(float *)&double v34 = v16;
                  [(STUsageDetailItem *)v20 setQuantity:v34];
                  [(STUsageDetailItem *)v18 setObject:v20 forKeyedSubscript:v17];
                }

                id v25 = v17;
              }

LABEL_23:
            }
            uint64_t v50 = [v9 countByEnumeratingWithState:&v51 objects:v59 count:16];
          }
          while (v50);
        }

        uint64_t v7 = v46 + 1;
      }
      while (v46 + 1 != v45);
      uint64_t v45 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v45);
  }

  [v48 allValues];
  v39 = v38 = v4;
  v40 = [v38 allValues];
  v41 = [v39 arrayByAddingObjectsFromArray:v40];

  return v41;
}

@end