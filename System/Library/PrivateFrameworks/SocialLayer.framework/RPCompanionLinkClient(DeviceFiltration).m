@interface RPCompanionLinkClient(DeviceFiltration)
- (id)sl_phoneAndPadDevices;
@end

@implementation RPCompanionLinkClient(DeviceFiltration)

- (id)sl_phoneAndPadDevices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [a1 activeDevices];
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = [v7 model];
        if ([v8 rangeOfString:@"iPad"] != 0x7FFFFFFFFFFFFFFFLL)
        {

LABEL_10:
          [v2 addObject:v7];
          continue;
        }
        v9 = [v7 model];
        uint64_t v10 = [v9 rangeOfString:@"iPhone"];

        if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_10;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  v11 = (void *)[v2 copy];
  return v11;
}

@end