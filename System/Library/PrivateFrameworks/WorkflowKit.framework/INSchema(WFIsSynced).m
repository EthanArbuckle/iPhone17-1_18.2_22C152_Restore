@interface INSchema(WFIsSynced)
- (uint64_t)isSyncedFromOtherDevice;
@end

@implementation INSchema(WFIsSynced)

- (uint64_t)isSyncedFromOtherDevice
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  NSSelectorFromString(&cfstr_Definitionfile.isa);
  if (objc_opt_respondsToSelector())
  {
    v2 = [a1 valueForKey:@"_definitionFileURLs"];
  }
  else
  {
    v2 = 0;
  }
  if ([v2 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = v2;
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
          if (!WFIsSyncedIntentDefinitionURL(*(void **)(*((void *)&v10 + 1) + 8 * v7)))
          {
            uint64_t v8 = 0;
            goto LABEL_15;
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
    uint64_t v8 = 1;
LABEL_15:
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end