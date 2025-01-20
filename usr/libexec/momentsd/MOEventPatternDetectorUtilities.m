@interface MOEventPatternDetectorUtilities
+ (id)getHomeVisitChunksForStandardDay:(id)a3;
@end

@implementation MOEventPatternDetectorUtilities

+ (id)getHomeVisitChunksForStandardDay:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = +[NSCalendar currentCalendar];
    v5 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v3;
    id obj = v3;
    id v32 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v32)
    {
      uint64_t v30 = *(void *)v36;
      v31 = v4;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v36 != v30) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v35 + 1) + 8 * v6);
          v8 = [v7 startDate];
          v9 = [v7 endDate];
          v10 = [v4 components:28 fromDate:v8];
          [v10 setHour:3];
          v11 = [v4 dateFromComponents:v10];
          v33 = v10;
          uint64_t v34 = v6;
          if ([v8 isOnOrAfter:v11])
          {
            v12 = [v4 dateFromComponents:v10];
            uint64_t v13 = [v12 dateByAddingTimeInterval:86400.0];

            v11 = (void *)v13;
          }
          if ([v8 isBeforeDate:v9])
          {
            v14 = 0;
            v15 = v8;
            v16 = v11;
            do
            {
              if ([v15 isBeforeDate:v16]
                && [v9 isOnOrAfter:v16])
              {
                id v17 = [v16 dateByAddingTimeInterval:-1.0];
              }
              else
              {
                id v17 = v9;
              }
              v18 = v17;

              v19 = [MOEvent alloc];
              v20 = [v7 eventIdentifier];
              v21 = [v7 creationDate];
              v22 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v19, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v20, v15, v18, v21, [v7 provider], [v7 category]);

              v23 = [v7 expirationDate];
              [(MOEvent *)v22 setExpirationDate:v23];

              [v5 addObject:v22];
              v8 = [v18 dateByAddingTimeInterval:1.0];

              v11 = [v16 dateByAddingTimeInterval:86400.0];

              v15 = v8;
              v16 = v11;
              v14 = v18;
            }
            while (([v8 isBeforeDate:v9] & 1) != 0);
          }
          else
          {
            v18 = 0;
          }

          uint64_t v6 = v34 + 1;
          v4 = v31;
        }
        while ((id)(v34 + 1) != v32);
        id v32 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v32);
    }

    id v24 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
    id v39 = v24;
    v25 = +[NSArray arrayWithObjects:&v39 count:1];
    v26 = [v5 sortedArrayUsingDescriptors:v25];

    id v3 = v28;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end