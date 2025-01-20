@interface NSSet(MRAVReconnaissanceSessionAdditions)
- (uint64_t)mr_containsObjectUsingWeakMatching:()MRAVReconnaissanceSessionAdditions;
@end

@implementation NSSet(MRAVReconnaissanceSessionAdditions)

- (uint64_t)mr_containsObjectUsingWeakMatching:()MRAVReconnaissanceSessionAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [a1 allObjects];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v10;
            unint64_t v12 = objc_msgSend(v11, "length", (void)v18);
            id v13 = v12 >= [v5 length] ? v5 : v11;
            id v14 = v13 == v11 ? v5 : v11;
            id v15 = v13;
            char v16 = [v14 containsString:v15];

            if (v16)
            {
              uint64_t v7 = 1;
              goto LABEL_20;
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_20:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end