@interface NSArray(UNSNotificationRecord)
- (uint64_t)uns_containsSimilarRecord:()UNSNotificationRecord;
@end

@implementation NSArray(UNSNotificationRecord)

- (uint64_t)uns_containsSimilarRecord:()UNSNotificationRecord
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v9, "isSimilar:", v4, (void)v11))
          {
            uint64_t v6 = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v6;
}

@end