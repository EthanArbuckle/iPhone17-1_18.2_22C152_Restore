@interface MOEventPatternDetectorFeatureExtractorADPDCounts
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorFeatureExtractorADPDCounts)init;
- (id)extractFeaturesFromEvents:(id)a3;
@end

@implementation MOEventPatternDetectorFeatureExtractorADPDCounts

- (MOEventPatternDetectorFeatureExtractorADPDCounts)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorADPDCounts;
  v2 = [(MOEventPatternDetectorFeatureExtractorADPDCounts *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3 = a3;
  id v25 = (id)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v8 = objc_opt_new();
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v9 = v7;
        id v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v27;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
              v15 = [v14 pCount];
              unsigned int v16 = [v15 intValue];

              if ((v16 & 0x80000000) == 0)
              {
                v17 = [v14 pCount];
                [v8 addObject:v17];
              }
              v18 = [v14 densityScore];
              [v18 doubleValue];
              double v20 = v19;

              if (v20 >= 0.0)
              {
                v21 = [v14 densityScore];
                [v8 addObject:v21];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v11);
        }

        [v25 addObject:v8];
      }
      id v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v5);
  }

  return v25;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end