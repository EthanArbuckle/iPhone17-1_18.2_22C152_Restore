@interface MOEventPatternDetectorFeatureExtractorContactFrequency
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorFeatureExtractorContactFrequency)init;
- (id)extractFeaturesFromEvents:(id)a3;
@end

@implementation MOEventPatternDetectorFeatureExtractorContactFrequency

- (MOEventPatternDetectorFeatureExtractorContactFrequency)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorContactFrequency;
  v2 = [(MOEventPatternDetectorFeatureExtractorContactFrequency *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3 = a3;
  id v23 = (id)objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  id v24 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v37;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        v5 = *(void **)(*((void *)&v36 + 1) + 8 * v4);
        v27 = objc_opt_new();
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v26 = v5;
        id v6 = [v26 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v33;
          do
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v33 != v8) {
                objc_enumerationMutation(v26);
              }
              v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              long long v28 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              v11 = [v10 interactions];
              id v12 = [v11 countByEnumeratingWithState:&v28 objects:v40 count:16];
              if (v12)
              {
                id v13 = v12;
                uint64_t v14 = 0;
                uint64_t v15 = *(void *)v29;
                do
                {
                  for (j = 0; j != v13; j = (char *)j + 1)
                  {
                    if (*(void *)v29 != v15) {
                      objc_enumerationMutation(v11);
                    }
                    unint64_t v17 = (unint64_t)[*(id *)(*((void *)&v28 + 1) + 8 * (void)j) mechanism];
                    if (v17 <= 0x11 && ((1 << v17) & 0x33B1F) != 0) {
                      uint64_t v14 = (v14 + 1);
                    }
                  }
                  id v13 = [v11 countByEnumeratingWithState:&v28 objects:v40 count:16];
                }
                while (v13);
              }
              else
              {
                uint64_t v14 = 0;
              }

              v19 = +[NSNumber numberWithInt:v14];
              [v27 addObject:v19];
            }
            id v7 = [v26 countByEnumeratingWithState:&v32 objects:v41 count:16];
          }
          while (v7);
        }

        [v23 addObject:v27];
        uint64_t v4 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      id v24 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v24);
  }

  return v23;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end