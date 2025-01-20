@interface UIDragStatisticLogItemsInDragByType
@end

@implementation UIDragStatisticLogItemsInDragByType

void ___UIDragStatisticLogItemsInDragByType_block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v2;
  uint64_t v40 = [v2 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v40)
  {
    id v34 = v3;
    unint64_t v49 = 0;
    unint64_t v50 = 0;
    unint64_t v51 = 0;
    unint64_t v4 = 0;
    unint64_t v47 = 0;
    unint64_t v48 = 0;
    unint64_t v5 = 0;
    v6 = 0;
    uint64_t v39 = *(void *)v64;
    uint64_t v7 = *MEMORY[0x1E4F44470];
    uint64_t v8 = *MEMORY[0x1E4F44400];
    uint64_t v9 = *MEMORY[0x1E4F444F8];
    uint64_t v58 = *MEMORY[0x1E4F44450];
    uint64_t v55 = *MEMORY[0x1E4F443C8];
    uint64_t v54 = *MEMORY[0x1E4F44468];
    uint64_t v53 = *MEMORY[0x1E4F44350];
    uint64_t v52 = *MEMORY[0x1E4F444A0];
    uint64_t v41 = *MEMORY[0x1E4F444A8];
    uint64_t v38 = *MEMORY[0x1E4F443F0];
    uint64_t v36 = *MEMORY[0x1E4F443C0];
    uint64_t v35 = *MEMORY[0x1E4F44538];
    uint64_t v56 = *MEMORY[0x1E4F444F8];
    uint64_t v57 = *MEMORY[0x1E4F44400];
    do
    {
      uint64_t v10 = 0;
      do
      {
        v44 = v6;
        if (*(void *)v64 != v39) {
          objc_enumerationMutation(obj);
        }
        unint64_t v45 = v5;
        unint64_t v46 = v4;
        uint64_t v43 = v10;
        v11 = [*(id *)(*((void *)&v63 + 1) + 8 * v10) itemProvider];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        v12 = [v11 registeredTypeIdentifiers];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v59 objects:v67 count:16];
        v42 = v11;
        if (v13)
        {
          uint64_t v14 = v13;
          unint64_t v15 = 0;
          uint64_t v16 = *(void *)v60;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v60 != v16) {
                objc_enumerationMutation(v12);
              }
              v18 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:*(void *)(*((void *)&v59 + 1) + 8 * v17) allowUndeclared:1];
              if ([v18 conformsToType:v7])
              {
                uint64_t v19 = 1;
              }
              else if ([v18 conformsToType:v8])
              {
                uint64_t v19 = 16;
              }
              else if ([v18 conformsToType:v9])
              {
                uint64_t v19 = 8;
              }
              else if ([v18 conformsToType:v58])
              {
                uint64_t v19 = 4;
              }
              else
              {
                v20 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:@"com.apple.uikit.useractivity" allowUndeclared:1];
                char v21 = [v18 conformsToType:v20];

                if (v21)
                {
                  uint64_t v19 = 64;
                  uint64_t v9 = v56;
                  uint64_t v8 = v57;
                }
                else
                {
                  uint64_t v9 = v56;
                  if ([v18 conformsToType:v55])
                  {
                    uint64_t v19 = 32;
                    uint64_t v8 = v57;
                  }
                  else
                  {
                    uint64_t v8 = v57;
                    if (([v18 conformsToType:v54] & 1) != 0
                      || ([v18 conformsToType:v53] & 1) != 0)
                    {
                      uint64_t v19 = 32;
                    }
                    else if (([v18 conformsToType:v52] & 1) != 0 {
                           || ([v18 conformsToType:v41] & 1) != 0
                    }
                           || ([v18 conformsToType:v38] & 1) != 0
                           || ([v18 conformsToType:v36] & 1) != 0
                           || ([v18 conformsToType:v35] & 1) != 0)
                    {
                      uint64_t v19 = 2;
                    }
                    else
                    {
                      v22 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:@"com.apple.uikit.attributedstring" allowUndeclared:1];
                      int v23 = [v18 conformsToType:v22];

                      BOOL v24 = v23 == 0;
                      uint64_t v9 = v56;
                      uint64_t v8 = v57;
                      uint64_t v19 = 2;
                      if (v24) {
                        uint64_t v19 = 128;
                      }
                    }
                  }
                }
              }
              v15 |= v19;

              ++v17;
            }
            while (v14 != v17);
            uint64_t v25 = [v12 countByEnumeratingWithState:&v59 objects:v67 count:16];
            uint64_t v14 = v25;
          }
          while (v25);
        }
        else
        {
          unint64_t v15 = 0;
        }

        v6 = &v44[v15 & 1];
        v47 += (v15 >> 1) & 1;
        unint64_t v5 = ((v15 >> 2) & 1) + v45;
        v48 += (v15 >> 3) & 1;
        v49 += (v15 >> 4) & 1;
        v50 += (v15 >> 5) & 1;
        v51 += (v15 >> 6) & 1;
        unint64_t v4 = ((v15 >> 7) & 1) + v46;

        uint64_t v10 = v43 + 1;
      }
      while (v43 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v40);
    id v3 = v34;
    if (v6)
    {
      v6 = [NSString stringWithFormat:@"%@.%@", v34, @"plainTextType"];
      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:v6 forKey:(double)(unint64_t)&v44[v15 & 1]];
    }
    if (v47)
    {
      uint64_t v26 = [NSString stringWithFormat:@"%@.%@", v34, @"richTextType"];

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:v26 forKey:(double)v47];
      v6 = (char *)v26;
      unint64_t v5 = ((v15 >> 2) & 1) + v45;
    }
    if (v5)
    {
      [NSString stringWithFormat:@"%@.%@", v34, @"PDFType"];
      v28 = unint64_t v27 = v5;

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:v28 forKey:(double)v27];
      v6 = (char *)v28;
    }
    if (v48)
    {
      uint64_t v29 = [NSString stringWithFormat:@"%@.%@", v34, @"URLType"];

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:v29 forKey:(double)v48];
      v6 = (char *)v29;
    }
    if (v49)
    {
      uint64_t v30 = [NSString stringWithFormat:@"%@.%@", v34, @"imageType"];

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:v30 forKey:(double)v49];
      v6 = (char *)v30;
    }
    if (v50)
    {
      uint64_t v31 = [NSString stringWithFormat:@"%@.%@", v34, @"folderType"];

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:v31 forKey:(double)v50];
      v6 = (char *)v31;
    }
    if (v51)
    {
      uint64_t v32 = [NSString stringWithFormat:@"%@.%@", v34, @"userActivityType"];

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:v32 forKey:(double)v51];
      v6 = (char *)v32;
    }
    if (v4)
    {
      uint64_t v33 = [NSString stringWithFormat:@"%@.%@", v34, @"customType"];

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:v33 forKey:(double)v4];
      v6 = (char *)v33;
    }
  }
  else
  {
    v6 = 0;
  }
}

@end