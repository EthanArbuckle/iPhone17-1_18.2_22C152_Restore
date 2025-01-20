@interface MOTrendBundlerPredicateWorkoutTypePattern
- (BOOL)configure:(id)a3;
- (MOTrendBundlerPredicateWorkoutTypePattern)init;
- (id)filterEvents:(id)a3;
@end

@implementation MOTrendBundlerPredicateWorkoutTypePattern

- (MOTrendBundlerPredicateWorkoutTypePattern)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOTrendBundlerPredicateWorkoutTypePattern;
  v2 = [(MOTrendBundlerPredicateWorkoutTypePattern *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)filterEvents:(id)a3
{
  id v3 = a3;
  id v52 = (id)objc_opt_new();
  v4 = objc_opt_new();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v76 objects:v84 count:16];
  v46 = v4;
  if (v5)
  {
    id v6 = v5;
    id v58 = *(id *)v77;
    CFStringRef v45 = @"kEventPatternTrendSlope";
    do
    {
      v7 = 0;
      id v49 = v6;
      do
      {
        if (*(id *)v77 != v58) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v7);
        id v9 = [v8 category:v45];
        if (v9 == (id)2
          && ([v8 patterns],
              v62 = objc_claimAutoreleasedReturnValue(),
              [v62 objectForKeyedSubscript:@"kEventPatternType"],
              v60 = objc_claimAutoreleasedReturnValue(),
              [v60 intValue] == 1))
        {
          v55 = [v8 patterns];
          id v53 = [v55 objectForKeyedSubscript:@"kEventPatternTrendFeatureType"];
          if ([v53 intValue] == 1)
          {
            v10 = [v8 patterns];
            v11 = [v10 objectForKeyedSubscript:v45];
            [v11 doubleValue];
            v47 = v11;
            v48 = v10;
            if (v12 > 0.0)
            {

              goto LABEL_22;
            }
            if ([v8 category] != (id)2)
            {

              goto LABEL_24;
            }
            int v13 = 1;
            int v14 = 1;
            goto LABEL_13;
          }
          int v13 = 1;
        }
        else
        {
          int v13 = 0;
        }
        int v14 = 0;
        unsigned int v15 = 0;
        if ([v8 category] != (id)2) {
          goto LABEL_16;
        }
LABEL_13:
        v16 = [v8 patterns];
        v17 = [v16 objectForKeyedSubscript:@"kEventPatternType"];
        if ([v17 intValue] == 2)
        {
          v18 = [v8 patterns];
          v19 = [v18 objectForKeyedSubscript:@"kEventPatternRoutineStartingRoutine"];
          unsigned int v15 = [v19 BOOLValue];

          v4 = v46;
          if ((v14 & 1) == 0) {
            goto LABEL_15;
          }
        }
        else
        {

          unsigned int v15 = 0;
          if (!v14)
          {
LABEL_15:
            id v6 = v49;
LABEL_16:
            if (!v13) {
              goto LABEL_18;
            }
LABEL_17:

            goto LABEL_18;
          }
        }

        id v6 = v49;
        if (v13) {
          goto LABEL_17;
        }
LABEL_18:
        if (v9 == (id)2)
        {

          if ((v15 & 1) == 0) {
            goto LABEL_24;
          }
        }
        else if (!v15)
        {
          goto LABEL_24;
        }
LABEL_22:
        v20 = [v8 patterns];
        v21 = [v20 objectForKey:@"kEventPatternOverallWorkoutType"];

        if (v21) {
          [v4 addObject:v8];
        }
LABEL_24:
        v7 = (char *)v7 + 1;
      }
      while (v6 != v7);
      id v22 = [obj countByEnumeratingWithState:&v76 objects:v84 count:16];
      id v6 = v22;
    }
    while (v22);
  }

  if ([v4 count])
  {
    v23 = objc_opt_new();
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v59 = v4;
    id v24 = [v59 countByEnumeratingWithState:&v72 objects:v83 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v73;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v73 != v26) {
            objc_enumerationMutation(v59);
          }
          v28 = [*(id *)(*((void *)&v72 + 1) + 8 * i) patterns];
          v29 = [v28 objectForKeyedSubscript:@"kEventPatternOverallWorkoutType"];
          [v23 addObject:v29];
        }
        id v25 = [v59 countByEnumeratingWithState:&v72 objects:v83 count:16];
      }
      while (v25);
    }

    v50 = v23;
    [v23 valueForKeyPath:@"@distinctUnionOfObjects.self"];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v54 = (id)objc_claimAutoreleasedReturnValue();
    id v57 = [v54 countByEnumeratingWithState:&v68 objects:v82 count:16];
    if (v57)
    {
      uint64_t v56 = *(void *)v69;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v69 != v56) {
            objc_enumerationMutation(v54);
          }
          uint64_t v61 = v30;
          uint64_t v31 = *(void *)(*((void *)&v68 + 1) + 8 * v30);
          v63 = objc_opt_new();
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v32 = v59;
          id v33 = [v32 countByEnumeratingWithState:&v64 objects:v81 count:16];
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = *(void *)v65;
            do
            {
              for (j = 0; j != v34; j = (char *)j + 1)
              {
                if (*(void *)v65 != v35) {
                  objc_enumerationMutation(v32);
                }
                v37 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
                v38 = [v37 patterns];
                v39 = [v38 objectForKeyedSubscript:@"kEventPatternOverallWorkoutType"];
                unsigned int v40 = [v39 isEqualToString:v31];

                if (v40) {
                  [v63 addObject:v37];
                }
              }
              id v34 = [v32 countByEnumeratingWithState:&v64 objects:v81 count:16];
            }
            while (v34);
          }

          id v41 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
          id v80 = v41;
          v42 = +[NSArray arrayWithObjects:&v80 count:1];
          v43 = [v63 sortedArrayUsingDescriptors:v42];

          [v52 addObject:v43];
          uint64_t v30 = v61 + 1;
        }
        while ((id)(v61 + 1) != v57);
        id v57 = [v54 countByEnumeratingWithState:&v68 objects:v82 count:16];
      }
      while (v57);
    }

    v4 = v46;
  }

  return v52;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end