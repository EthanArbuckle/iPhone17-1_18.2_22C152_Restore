@interface MOEventPatternDetectorFeatureExtractorEventDuration
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorFeatureExtractorEventDuration)init;
- (id)extractFeaturesFromEvents:(id)a3;
@end

@implementation MOEventPatternDetectorFeatureExtractorEventDuration

- (MOEventPatternDetectorFeatureExtractorEventDuration)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorEventDuration;
  v2 = [(MOEventPatternDetectorFeatureExtractorEventDuration *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3 = a3;
  id v31 = (id)objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v3;
  id v32 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v47;
    v4 = NSAssertionHandler_ptr;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v47 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v5;
        objc_super v6 = *(void **)(*((void *)&v46 + 1) + 8 * v5);
        v7 = objc_opt_new();
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v36 = v6;
        id v37 = [v36 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v37)
        {
          uint64_t v8 = *(void *)v43;
          uint64_t v34 = *(void *)v43;
          v35 = v7;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v43 != v8) {
                objc_enumerationMutation(v36);
              }
              v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              if ([v10 category] == (id)10)
              {
                long long v40 = 0u;
                long long v41 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                v11 = [v10 interactions];
                id v12 = [v11 countByEnumeratingWithState:&v38 objects:v50 count:16];
                if (v12)
                {
                  id v13 = v12;
                  v14 = v4;
                  uint64_t v15 = *(void *)v39;
                  double v16 = 0.0;
                  do
                  {
                    for (j = 0; j != v13; j = (char *)j + 1)
                    {
                      if (*(void *)v39 != v15) {
                        objc_enumerationMutation(v11);
                      }
                      v18 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
                      unint64_t v19 = (unint64_t)[v18 mechanism];
                      if (v19 <= 0x11 && ((1 << v19) & 0x31B01) != 0)
                      {
                        v21 = [v18 endDate];
                        v22 = [v18 startDate];
                        [v21 timeIntervalSinceDate:v22];
                        double v24 = v23;

                        double v16 = v16 + v24;
                      }
                    }
                    id v13 = [v11 countByEnumeratingWithState:&v38 objects:v50 count:16];
                  }
                  while (v13);
                  v4 = v14;
                  uint64_t v8 = v34;
                  v7 = v35;
                }
                else
                {
                  double v16 = 0.0;
                }
              }
              else
              {
                v11 = [v10 endDate];
                v25 = [v10 startDate];
                [v11 timeIntervalSinceDate:v25];
                double v16 = v26;
              }
              v27 = [v4[32] numberWithDouble:v16];
              [v7 addObject:v27];
            }
            id v37 = [v36 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }
          while (v37);
        }

        [v31 addObject:v7];
        uint64_t v5 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v32);
  }

  return v31;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end