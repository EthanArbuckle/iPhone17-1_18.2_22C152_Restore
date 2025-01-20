@interface SHTimeAndPlaceAffinityGroup
- (NSArray)regions;
- (NSDictionary)geohashKeyedRegions;
- (SHAffinityGroup)affinityGroup;
- (SHTimeAndPlaceAffinityGroup)initWithRegions:(id)a3 affinityGroup:(id)a4;
- (id)regionsForGeohash:(id)a3;
@end

@implementation SHTimeAndPlaceAffinityGroup

- (SHTimeAndPlaceAffinityGroup)initWithRegions:(id)a3 affinityGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHTimeAndPlaceAffinityGroup;
  v9 = [(SHTimeAndPlaceAffinityGroup *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_regions, a3);
    objc_storeStrong((id *)&v10->_affinityGroup, a4);
  }

  return v10;
}

- (NSDictionary)geohashKeyedRegions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  geohashKeyedRegions = self->_geohashKeyedRegions;
  if (!geohashKeyedRegions)
  {
    v4 = (void *)MEMORY[0x263EFF9A0];
    v5 = [(SHTimeAndPlaceAffinityGroup *)self regions];
    v6 = objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [(SHTimeAndPlaceAffinityGroup *)self regions];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = [v12 geohash];

          if (v13)
          {
            v14 = [v12 geohash];
            [v6 setObject:v12 forKeyedSubscript:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    v15 = (NSDictionary *)[v6 copy];
    v16 = self->_geohashKeyedRegions;
    self->_geohashKeyedRegions = v15;

    geohashKeyedRegions = self->_geohashKeyedRegions;
  }
  return geohashKeyedRegions;
}

- (id)regionsForGeohash:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v6 = [(SHTimeAndPlaceAffinityGroup *)self regions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_super v12 = [v11 geohash];
        int v13 = [v12 hasPrefix:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  if (![v5 count] && objc_msgSend(v4, "length"))
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    while (1)
    {
      long long v18 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") + v16);
      long long v19 = [(SHTimeAndPlaceAffinityGroup *)self geohashKeyedRegions];
      long long v20 = [v19 objectForKeyedSubscript:v18];

      if (v20) {
        break;
      }

      ++v17;
      --v16;
      if (v17 == [v4 length]) {
        goto LABEL_11;
      }
    }
    [v5 addObject:v20];
  }
LABEL_11:
  v14 = (void *)[v5 copy];

  return v14;
}

- (NSArray)regions
{
  return self->_regions;
}

- (SHAffinityGroup)affinityGroup
{
  return self->_affinityGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affinityGroup, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_geohashKeyedRegions, 0);
}

@end