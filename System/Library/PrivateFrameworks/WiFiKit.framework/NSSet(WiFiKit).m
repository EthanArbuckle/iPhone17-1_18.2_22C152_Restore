@interface NSSet(WiFiKit)
- (id)hiddenNetworkProfiles;
- (id)hs20Networks;
- (id)logStringWithScanRecords;
- (id)scanRecordWithSSID:()WiFiKit;
@end

@implementation NSSet(WiFiKit)

- (id)hs20Networks
{
  v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"isHotspot20 == YES"];
  v3 = [a1 filteredSetUsingPredicate:v2];

  return v3;
}

- (id)scanRecordWithSSID:()WiFiKit
{
  v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"ssid == %@", a3];
  v5 = [a1 filteredSetUsingPredicate:v4];

  if (v5)
  {
    v6 = [v5 anyObject];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)hiddenNetworkProfiles
{
  v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"isHidden == YES"];
  v3 = [a1 filteredSetUsingPredicate:v2];

  return v3;
}

- (id)logStringWithScanRecords
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F089D8] string];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v16 = a1;
  v3 = [a1 allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          uint64_t v11 = [v10 ssid];
          if (v11) {
            v12 = (__CFString *)v11;
          }
          else {
            v12 = @"NULL";
          }
          uint64_t v13 = [v10 channel];

          if (v13) {
            v14 = (void *)v13;
          }
          else {
            v14 = &unk_26D9E2128;
          }
          [v2 appendFormat:@"%@ (%d)", v12, objc_msgSend(v14, "intValue")];
          if (++v6 < (unint64_t)[v16 count]) {
            [v2 appendString:@", "];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  return v2;
}

@end