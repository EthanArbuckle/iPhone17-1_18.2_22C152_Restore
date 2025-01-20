@interface RTLocationOfInterest(RTExtensions)
+ (id)locationsOfInterestFromLearnedLocationsOfInterest:()RTExtensions;
+ (uint64_t)routineModeFromLearnedLocationMode:()RTExtensions;
+ (uint64_t)typeFromPlaceType:()RTExtensions;
+ (unint64_t)typeSourceFromPlaceTypeSource:()RTExtensions;
- (id)initWithLearnedLocationOfInterest:()RTExtensions;
@end

@implementation RTLocationOfInterest(RTExtensions)

+ (id)locationsOfInterestFromLearnedLocationsOfInterest:()RTExtensions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v3 count]];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v12 = objc_alloc(MEMORY[0x1E4F5CE10]);
          v13 = [v12 initWithLearnedLocationOfInterest:v11];
          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)initWithLearnedLocationOfInterest:()RTExtensions
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v33 = a1;
    id v6 = [v4 visits];

    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v8 = [v5 visits];
      id v6 = [v7 arrayWithCapacity:[v8 count]];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v9 = [v5 visits];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = (void *)[objc_alloc(MEMORY[0x1E4F5CE28]) initWithLearnedVisit:*(void *)(*((void *)&v34 + 1) + 8 * i)];
            if (v14) {
              [v6 addObject:v14];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v11);
      }
    }
    v32 = [v5 location];
    long long v15 = [v32 location];
    v31 = [v5 location];
    [v31 confidence];
    double v17 = v16;
    long long v18 = [v5 identifier];
    v19 = (void *)MEMORY[0x1E4F5CE10];
    v30 = [v5 place];
    uint64_t v29 = [v19 typeFromPlaceType:[v30 type]];
    uint64_t v20 = (void *)MEMORY[0x1E4F5CE10];
    v21 = [v5 place];
    uint64_t v22 = [v20 typeSourceFromPlaceTypeSource:[v21 typeSource]];
    v23 = [v5 place];
    v24 = [v23 customLabel];
    v25 = [v5 place];
    v26 = [v25 mapItem];
    a1 = (id)[v33 initWithLocation:v15 confidence:v18 identifier:v29 type:v22 typeSource:v6 visits:v24 customLabel:v17 mapItem:v26];

    id v27 = a1;
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

+ (uint64_t)routineModeFromLearnedLocationMode:()RTExtensions
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (uint64_t)typeFromPlaceType:()RTExtensions
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return -1;
  }
  else {
    return a3 - 1;
  }
}

+ (unint64_t)typeSourceFromPlaceTypeSource:()RTExtensions
{
  return (__rbit32(a3) >> 30) & 0xFFFFFFFFFFFFFFCFLL | (16 * ((a3 >> 2) & 3));
}

@end