@interface TADominantUserActivity
+ ($82EDB067EE6F192B39F18594CC8676AD)getDominantUserActivityInfoInDateInterval:(id)a3 store:(id)a4;
+ (id)getCumulativeUserActivityTimeInDateInterval:(id)a3 store:(id)a4;
@end

@implementation TADominantUserActivity

+ (id)getCumulativeUserActivityTimeInDateInterval:(id)a3 store:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v43 = v6;
  v8 = [v6 eventBuffer];
  v9 = [v8 getAllTAEventsOf:objc_opt_class()];
  v10 = (void *)[v9 mutableCopy];

  v11 = [TAUserActivity alloc];
  v12 = [MEMORY[0x263EFF910] distantPast];
  v13 = [(TAUserActivity *)v11 initWithActivityType:0 date:v12];
  [v10 insertObject:v13 atIndex:0];

  v14 = [v10 lastObject];
  v15 = [TAUserActivity alloc];
  v42 = v14;
  uint64_t v16 = [v14 activityType];
  v17 = [MEMORY[0x263EFF910] distantFuture];
  v18 = [(TAUserActivity *)v15 initWithActivityType:v16 date:v17];
  [v10 addObject:v18];

  if ((unint64_t)[v10 count] >= 2)
  {
    for (unint64_t i = 1; [v10 count] > i; ++i)
    {
      v20 = (void *)MEMORY[0x263F08798];
      v21 = [v10 objectAtIndexedSubscript:i - 1];
      v22 = [v21 date];
      v23 = [v10 objectAtIndexedSubscript:i];
      v24 = [v23 date];
      v25 = [v20 createIntervalSafelyWithStartDate:v22 endDate:v24];

      v26 = [v10 objectAtIndexedSubscript:i - 1];
      uint64_t v27 = [v26 activityType];

      v28 = [v25 startDate];
      if ([v5 containsDate:v28])
      {
        v29 = [v25 endDate];
        int v30 = [v5 containsDate:v29];

        if (v30)
        {
          [v25 duration];
          double v32 = v31;
LABEL_9:
          v35 = NSNumber;
          v36 = [NSNumber numberWithUnsignedInteger:v27];
          v37 = [v7 objectForKeyedSubscript:v36];
          [v37 doubleValue];
          v39 = [v35 numberWithDouble:v32 + v38];
          v40 = [NSNumber numberWithUnsignedInteger:v27];
          [v7 setObject:v39 forKeyedSubscript:v40];

          goto LABEL_10;
        }
      }
      else
      {
      }
      if ([v5 intersectsDateInterval:v25])
      {
        v33 = [v5 intersectionWithDateInterval:v25];
        [v33 duration];
        double v32 = v34;

        goto LABEL_9;
      }
LABEL_10:
    }
  }

  return v7;
}

+ ($82EDB067EE6F192B39F18594CC8676AD)getDominantUserActivityInfoInDateInterval:(id)a3 store:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v4 = +[TADominantUserActivity getCumulativeUserActivityTimeInDateInterval:a3 store:a4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = [v4 objectForKeyedSubscript:v11];
        [v12 doubleValue];
        double v14 = v13;

        if (v14 > v9)
        {
          uint64_t v7 = [v11 integerValue];
          v15 = [v4 objectForKeyedSubscript:v11];
          [v15 doubleValue];
          double v9 = v16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    double v9 = 0.0;
  }

  double v17 = v9;
  unint64_t v18 = v7;
  result.var1 = v17;
  result.var0 = v18;
  return result;
}

@end