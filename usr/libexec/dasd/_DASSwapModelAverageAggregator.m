@interface _DASSwapModelAverageAggregator
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (id)scoresForAllApplicationsAtDate:(id)a3;
@end

@implementation _DASSwapModelAverageAggregator

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  id v39 = a3;
  v5 = [(_DASSwapModelAbstractAggregator *)self algorithms];
  id v6 = [v5 count];

  if (!v6) {
    goto LABEL_4;
  }
  if (v6 == (id)1)
  {
    v7 = [(_DASSwapModelAbstractAggregator *)self algorithms];
    v8 = [v7 firstObject];
    id v6 = [v8 scoresForAllApplicationsAtDate:v39];

LABEL_4:
    v9 = v4;
    goto LABEL_23;
  }
  context = v4;
  v10 = +[NSMutableSet set];
  v11 = +[NSMutableArray array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v12 = [(_DASSwapModelAbstractAggregator *)self algorithms];
  id v13 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v19 = [v17 scoresForAllApplicationsAtDate:v39];
        [v11 addObject:v19];
        v20 = [v19 allKeys];
        [v10 addObjectsFromArray:v20];
      }
      id v14 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v14);
  }

  v21 = +[NSMutableDictionary dictionary];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v10;
  id v22 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v41;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
        v27 = [v11 objectAtIndexedSubscript:0];
        v28 = [v27 objectForKeyedSubscript:v26];
        [v28 doubleValue];
        double v30 = v29;

        for (uint64_t k = 1; (id)k != v6; ++k)
        {
          v32 = [v11 objectAtIndexedSubscript:k];
          v33 = [v32 objectForKeyedSubscript:v26];
          [v33 doubleValue];
          double v30 = v30 + v34;
        }
        v35 = +[NSNumber numberWithDouble:v30 / (double)(unint64_t)v6];
        [v21 setObject:v35 forKeyedSubscript:v26];
      }
      id v23 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v23);
  }

  id v6 = [v21 copy];
  v9 = context;
LABEL_23:

  return v6;
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_DASSwapModelAbstractAggregator *)self algorithms];
  id v9 = [v8 count];

  if (v9)
  {
    if (v9 == (id)1)
    {
      v10 = [(_DASSwapModelAbstractAggregator *)self algorithms];
      v11 = [v10 firstObject];
      [v11 scoreForApplication:v6 atDate:v7];
      double v13 = v12;
    }
    else
    {
      id v14 = [(_DASSwapModelAbstractAggregator *)self algorithms];
      uint64_t v15 = [v14 objectAtIndexedSubscript:0];
      [v15 scoreForApplication:v6 atDate:v7];
      double v17 = v16;

      for (uint64_t i = 1; (id)i != v9; ++i)
      {
        v19 = [(_DASSwapModelAbstractAggregator *)self algorithms];
        v20 = [v19 objectAtIndexedSubscript:i];
        [v20 scoreForApplication:v6 atDate:v7];
        double v17 = v17 + v21;
      }
      double v13 = v17 / (double)(unint64_t)v9;
    }
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

@end