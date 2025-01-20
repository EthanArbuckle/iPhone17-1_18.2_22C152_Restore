@interface SHTimeAndPlaceServerResponseParser
+ (id)regionAffinityGroupsFromServerData:(id)a3 error:(id *)a4;
@end

@implementation SHTimeAndPlaceServerResponseParser

+ (id)regionAffinityGroupsFromServerData:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v55 = 0;
  v5 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v55];
  id v6 = v55;
  v7 = v6;
  if (v5)
  {
    id v34 = v6;
    v42 = [v5 objectForKeyedSubscript:@"geoHash"];
    v8 = [MEMORY[0x263EFF980] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v35 = v5;
    obuint64_t j = [v5 objectForKeyedSubscript:@"geoHashTrackPools"];
    uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v52;
      uint64_t v9 = *MEMORY[0x263F177A8];
      v36 = v8;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v52 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = v10;
          v11 = *(void **)(*((void *)&v51 + 1) + 8 * v10);
          v12 = [v11 objectForKeyedSubscript:@"trackPool"];
          v13 = [[SHAffinityGroup alloc] initWithType:1 cohesionLevel:1];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v14 = v12;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v59 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v48 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                v20 = (void *)MEMORY[0x263F17788];
                uint64_t v57 = v9;
                uint64_t v58 = v19;
                v21 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
                v22 = [v20 mediaItemWithProperties:v21];

                [(SHAffinityGroup *)v13 appendMediaItem:v22];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v59 count:16];
            }
            while (v16);
          }

          v23 = [v11 objectForKeyedSubscript:@"geoHashSuffixes"];
          v24 = [MEMORY[0x263EFF980] array];
          if ([v23 count])
          {
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            v25 = v23;
            uint64_t v26 = [(SHRegion *)v25 countByEnumeratingWithState:&v43 objects:v56 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              v38 = v23;
              uint64_t v28 = *(void *)v44;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v44 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = [NSString stringWithFormat:@"%@%@", v42, *(void *)(*((void *)&v43 + 1) + 8 * j)];
                  v31 = [[SHRegion alloc] initWithGeohash:v30];
                  [v24 addObject:v31];
                }
                uint64_t v27 = [(SHRegion *)v25 countByEnumeratingWithState:&v43 objects:v56 count:16];
              }
              while (v27);
              v8 = v36;
              v23 = v38;
            }
          }
          else
          {
            v25 = [[SHRegion alloc] initWithGeohash:v42];
            [v24 addObject:v25];
          }

          v32 = [[SHTimeAndPlaceAffinityGroup alloc] initWithRegions:v24 affinityGroup:v13];
          [v8 addObject:v32];

          uint64_t v10 = v41 + 1;
        }
        while (v41 + 1 != v40);
        uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v40);
    }

    v7 = v34;
    v5 = v35;
  }
  else if (a4)
  {
    +[SHInsightsError errorWithCode:200 underlyingError:v6];
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end