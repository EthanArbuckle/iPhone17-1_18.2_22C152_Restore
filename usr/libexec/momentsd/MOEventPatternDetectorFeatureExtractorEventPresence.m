@interface MOEventPatternDetectorFeatureExtractorEventPresence
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorFeatureExtractorEventPresence)init;
- (id)extractFeaturesFromEvents:(id)a3;
@end

@implementation MOEventPatternDetectorFeatureExtractorEventPresence

- (MOEventPatternDetectorFeatureExtractorEventPresence)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorEventPresence;
  v2 = [(MOEventPatternDetectorFeatureExtractorEventPresence *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_opt_new();
        if (objc_msgSend(v10, "count", (void)v14))
        {
          unint64_t v12 = 0;
          do
          {
            [v11 addObject:&off_1002F4DF0];
            ++v12;
          }
          while ((unint64_t)[v10 count] > v12);
        }
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end