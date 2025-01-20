@interface WFNextHourPrecipitation(NWCPrecipitation)
- (id)conditionsForDate:()NWCPrecipitation;
- (uint64_t)isRelevantForDate:()NWCPrecipitation;
@end

@implementation WFNextHourPrecipitation(NWCPrecipitation)

- (id)conditionsForDate:()NWCPrecipitation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = objc_msgSend(a1, "conditions", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 validUntil];
        if (v12)
        {
          v13 = (void *)v12;
          v14 = [v11 validUntil];
          uint64_t v15 = [v14 compare:v4];

          if (v15 != 1) {
            continue;
          }
        }
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)isRelevantForDate:()NWCPrecipitation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [a1 conditions];
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  v6 = 0;
  if (v5)
  {
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v6;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        unint64_t v11 = [v10 type];
        uint64_t v12 = [v10 validUntil];
        if (v12)
        {
          v13 = [v10 validUntil];
          [v13 timeIntervalSinceDate:v4];
          BOOL v15 = v14 > 0.0;
        }
        else
        {
          BOOL v15 = 1;
        }

        if (v11 >= 2 && v15)
        {
          [v9 timeIntervalSinceDate:v4];
          uint64_t v5 = v16 <= 3000.0;
          v6 = v9;
          goto LABEL_15;
        }
        v6 = [v10 validUntil];

        ++v8;
        uint64_t v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v5;
}

@end