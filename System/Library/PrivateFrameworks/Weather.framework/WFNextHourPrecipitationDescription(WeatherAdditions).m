@interface WFNextHourPrecipitationDescription(WeatherAdditions)
- (id)dictionaryRepresentation;
- (uint64_t)initWithDictionary:()WeatherAdditions;
@end

@implementation WFNextHourPrecipitationDescription(WeatherAdditions)

- (uint64_t)initWithDictionary:()WeatherAdditions
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKey:0x26DAE1670];
  unint64_t v5 = [v4 unsignedIntegerValue];

  if (v5)
  {
    v21 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v5];
  }
  else
  {
    v21 = 0;
  }
  v20 = [v3 objectForKey:0x26DAE1690];
  v19 = [v3 objectForKey:0x26DAE16B0];
  v6 = [v3 objectForKey:0x26DAE16D0];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v14 = [v8 objectForKey:v13];
        unint64_t v15 = [v14 unsignedIntegerValue];

        if (v15) {
          [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v15];
        }
        else {
        v16 = [MEMORY[0x263EFF910] distantPast];
        }
        [v7 setObject:v16 forKey:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  uint64_t v17 = [a1 initWithShortTemplate:v20 longTemplate:v19 parameters:v7 validUntil:v21];
  return v17;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = objc_msgSend(a1, "parameters", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v9 = [a1 parameters];
        uint64_t v10 = [v9 objectForKey:v8];

        uint64_t v11 = NSNumber;
        [v10 timeIntervalSince1970];
        v12 = objc_msgSend(v11, "numberWithDouble:");
        [v2 setObject:v12 forKey:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }

  v26[0] = 0x26DAE1690;
  uint64_t v13 = [a1 shortTemplate];
  v26[1] = 0x26DAE16B0;
  v27[0] = v13;
  v14 = [a1 longTemplate];
  v27[1] = v14;
  unint64_t v15 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  v16 = (void *)[v15 mutableCopy];

  uint64_t v17 = [a1 validUntil];

  if (v17)
  {
    v18 = NSNumber;
    v19 = [a1 validUntil];
    [v19 timeIntervalSince1970];
    v20 = objc_msgSend(v18, "numberWithDouble:");
    [v16 setObject:v20 forKey:0x26DAE1670];
  }
  if ([v2 count]) {
    [v16 setObject:v2 forKey:0x26DAE16D0];
  }

  return v16;
}

@end