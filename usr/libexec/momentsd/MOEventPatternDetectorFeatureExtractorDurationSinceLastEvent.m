@interface MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent)init;
- (id)extractFeaturesFromEvents:(id)a3;
@end

@implementation MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent

- (MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent;
  v2 = [(MOEventPatternDetectorFeatureExtractorDurationSinceLastEvent *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)extractFeaturesFromEvents:(id)a3
{
  id v3 = a3;
  id v18 = (id)objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v21;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_super v6 = objc_opt_new();
        if ([v5 count])
        {
          unint64_t v7 = 0;
          do
          {
            if (v7)
            {
              v8 = [v5 objectAtIndex:v7 - 1];
              v9 = [v5 objectAtIndex:v7];
              v10 = [v9 startDate];
              v11 = [v8 endDate];
              [v10 timeIntervalSinceDate:v11];
              double v13 = v12;

              v14 = +[NSNumber numberWithDouble:v13];
              [v6 addObject:v14];
            }
            else
            {
              [v6 addObject:&off_1002F5630];
            }
            ++v7;
          }
          while ((unint64_t)[v5 count] > v7);
        }
        [v18 addObject:v6];
      }
      id v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v19);
  }

  return v18;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end