@interface MOTrendBundlerPredicateContactTypeTrend
- (BOOL)configure:(id)a3;
- (MOTrendBundlerPredicateContactTypeTrend)init;
- (id)filterEvents:(id)a3;
@end

@implementation MOTrendBundlerPredicateContactTypeTrend

- (MOTrendBundlerPredicateContactTypeTrend)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOTrendBundlerPredicateContactTypeTrend;
  v2 = [(MOTrendBundlerPredicateContactTypeTrend *)&v6 init];
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
  v46 = objc_opt_new();
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v72 objects:v80 count:16];
  id v48 = v4;
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v73;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v73 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        if (objc_msgSend(v9, "category", v46) == (id)10)
        {
          v10 = [v9 patterns];
          v11 = [v10 objectForKeyedSubscript:@"kEventPatternType"];
          if ([v11 intValue] != 1)
          {

            continue;
          }
          v12 = [v9 patterns];
          v13 = [v12 objectForKeyedSubscript:@"kEventPatternTrendFeatureType"];
          unsigned int v14 = [v13 intValue];
          if (v14 == 1
            || ([v9 patterns],
                v53 = objc_claimAutoreleasedReturnValue(),
                [v53 objectForKeyedSubscript:@"kEventPatternTrendFeatureType"],
                v50 = objc_claimAutoreleasedReturnValue(),
                [v50 intValue] == 2))
          {
            v15 = [v9 patterns];
            [v15 objectForKeyedSubscript:@"kEventPatternTrendSlope"];
            v57 = v10;
            unsigned int obja = v14;
            v16 = v13;
            v17 = v12;
            id v18 = v6;
            v20 = uint64_t v19 = v7;
            [v20 doubleValue];
            BOOL v22 = v21 > 0.0;

            uint64_t v7 = v19;
            id v6 = v18;
            v12 = v17;
            v13 = v16;

            id v4 = v48;
            v10 = v57;
            if (obja == 1)
            {
LABEL_15:

              if (v22) {
                [v46 addObject:v9];
              }
              continue;
            }
          }
          else
          {
            BOOL v22 = 0;
          }

          goto LABEL_15;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v72 objects:v80 count:16];
    }
    while (v6);
  }

  v23 = v46;
  if ([v46 count])
  {
    v24 = objc_opt_new();
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v46;
    id v25 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v69;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v69 != v27) {
            objc_enumerationMutation(obj);
          }
          v29 = [*(id *)(*((void *)&v68 + 1) + 8 * (void)j) patterns:v46];
          v30 = [v29 objectForKeyedSubscript:@"kEventPatternInteractionScoredContactIdentifier"];
          [v24 addObject:v30];
        }
        id v26 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
      }
      while (v26);
    }

    v47 = v24;
    [v24 valueForKeyPath:@"@distinctUnionOfObjects.self"];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    id v54 = [v49 countByEnumeratingWithState:&v64 objects:v78 count:16];
    if (v54)
    {
      uint64_t v51 = *(void *)v65;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v65 != v51) {
            objc_enumerationMutation(v49);
          }
          uint64_t v58 = v31;
          uint64_t v32 = *(void *)(*((void *)&v64 + 1) + 8 * v31);
          v59 = objc_opt_new();
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v33 = obj;
          id v34 = [v33 countByEnumeratingWithState:&v60 objects:v77 count:16];
          if (v34)
          {
            id v35 = v34;
            uint64_t v36 = *(void *)v61;
            do
            {
              for (k = 0; k != v35; k = (char *)k + 1)
              {
                if (*(void *)v61 != v36) {
                  objc_enumerationMutation(v33);
                }
                v38 = *(void **)(*((void *)&v60 + 1) + 8 * (void)k);
                v39 = [v38 patterns:v46];
                v40 = [v39 objectForKeyedSubscript:@"kEventPatternInteractionScoredContactIdentifier"];
                unsigned int v41 = [v40 isEqualToString:v32];

                if (v41) {
                  [v59 addObject:v38];
                }
              }
              id v35 = [v33 countByEnumeratingWithState:&v60 objects:v77 count:16];
            }
            while (v35);
          }

          id v42 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:0];
          id v76 = v42;
          v43 = +[NSArray arrayWithObjects:&v76 count:1];
          v44 = [v59 sortedArrayUsingDescriptors:v43];

          [v52 addObject:v44];
          uint64_t v31 = v58 + 1;
        }
        while ((id)(v58 + 1) != v54);
        id v54 = [v49 countByEnumeratingWithState:&v64 objects:v78 count:16];
      }
      while (v54);
    }

    v23 = v46;
    id v4 = v48;
  }

  return v52;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end