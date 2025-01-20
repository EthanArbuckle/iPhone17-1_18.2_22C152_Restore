@interface NSString(MobileSafariFrameworkExtras)
+ (id)safari_listOfLinksForTabs:()MobileSafariFrameworkExtras;
- (uint64_t)safari_isConfigProfileMIMEType;
@end

@implementation NSString(MobileSafariFrameworkExtras)

+ (id)safari_listOfLinksForTabs:()MobileSafariFrameworkExtras
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([MEMORY[0x1E4FB60A0] linkCountForTabs:v3])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      v9 = &stru_1EDA07C28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) url];
          v12 = v11;
          if (v11)
          {
            v13 = [v11 absoluteString];
            [v4 appendFormat:@"%@%@", v9, v13];

            v9 = @"\n";
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    v14 = (void *)[v4 copy];
    id v3 = v16;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)safari_isConfigProfileMIMEType
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", 0);
  id v3 = [v2 acceptedMIMETypes];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![a1 caseInsensitiveCompare:*(void *)(*((void *)&v10 + 1) + 8 * v7)])
        {
          uint64_t v8 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

@end