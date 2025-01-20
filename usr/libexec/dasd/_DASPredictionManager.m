@interface _DASPredictionManager
+ (BOOL)predictionNeedsUpdating:(id)a3 atDate:(id)a4 lastUpdatedAt:(id)a5;
+ (id)cacheDetailsForPredictionWithKey:(id)a3;
+ (id)currentPredictions;
+ (id)getValuesForPrediction:(id)a3 tillEndDate:(id)a4 withIntervals:(double)a5;
+ (id)lowLikelihoodPeriodEndForPredictionWithKey:(id)a3;
+ (id)lowLikelihoodPeriodStartForPredictionWithKey:(id)a3;
+ (id)predictionForKey:(id)a3;
+ (id)predictionGenerationQueue;
+ (id)sharedKnowledgeStore;
+ (id)sharedPredictor;
+ (void)asyncDo:(id)a3;
+ (void)initialize;
+ (void)setPrediction:(id)a3 forKey:(id)a4;
@end

@implementation _DASPredictionManager

+ (BOOL)predictionNeedsUpdating:(id)a3 atDate:(id)a4 lastUpdatedAt:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    [v8 timeIntervalSinceDate:v9];
    if (v10 >= 900.0)
    {
      [v8 timeIntervalSinceDate:v9];
      unsigned __int8 v11 = 1;
      if (v7 && v12 <= 10800.0) {
        unsigned __int8 v11 = [v7 isUnavailable];
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

+ (void)asyncDo:(id)a3
{
  id v3 = a3;
  v4 = (void *)os_transaction_create();
  v6 = [(id)objc_opt_class() predictionGenerationQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000104C8;
  v9[3] = &unk_100176C30;
  id v7 = v4;
  id v10 = v7;
  id v8 = v3;
  id v11 = v8;
  dispatch_async(v6, v9);
}

+ (id)predictionGenerationQueue
{
  if (qword_1001C4190 != -1) {
    dispatch_once(&qword_1001C4190, &stru_100176C08);
  }
  v2 = (void *)qword_1001C4198;

  return v2;
}

+ (id)sharedKnowledgeStore
{
  if (qword_1001C4178 != -1) {
    dispatch_once(&qword_1001C4178, &stru_100176BE8);
  }
  v2 = (void *)qword_1001C4180;

  return v2;
}

+ (id)sharedPredictor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078F74;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4188 != -1) {
    dispatch_once(&qword_1001C4188, block);
  }
  v2 = (void *)qword_1001C4170;

  return v2;
}

+ (void)initialize
{
  if (qword_1001C41A0 != -1) {
    dispatch_once(&qword_1001C41A0, &stru_100176C50);
  }
}

+ (id)currentPredictions
{
  id v2 = (id)qword_1001C4160;
  objc_sync_enter(v2);
  id v3 = [(id)qword_1001C4160 copy];
  objc_sync_exit(v2);

  return v3;
}

+ (void)setPrediction:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v7 = (id)qword_1001C4160;
  objc_sync_enter(v7);
  [(id)qword_1001C4160 setObject:v9 forKeyedSubscript:v5];
  objc_sync_exit(v7);

  id v8 = (id)qword_1001C4168;
  objc_sync_enter(v8);
  [(id)qword_1001C4168 removeObjectForKey:v5];
  objc_sync_exit(v8);
}

+ (id)cacheDetailsForPredictionWithKey:(id)a3
{
  id v33 = a3;
  id v3 = +[_DASPredictionManager predictionForKey:](_DASPredictionManager, "predictionForKey:");
  v34 = [v3 startDate];
  if (!v3) {
    goto LABEL_5;
  }
  v4 = [v3 startDate];
  [v4 timeIntervalSinceNow];
  if (v5 > 604800.0)
  {

LABEL_5:
    id v9 = 0;
    goto LABEL_6;
  }
  v6 = [v3 endDate];
  [v6 timeIntervalSinceNow];
  double v8 = v7;

  if (v8 > 604800.0) {
    goto LABEL_5;
  }
  id v11 = +[NSMutableArray arrayWithObject:v34];
  double v12 = [v3 transitionDates];
  [v11 addObjectsFromArray:v12];

  if ([v11 count] == (id)1)
  {
    v13 = 0;
    v14 = 0;
    v35 = 0;
    id v9 = &__NSDictionary0__struct;
    goto LABEL_32;
  }
  v15 = 0;
  v35 = 0;
  v14 = 0;
  v13 = 0;
  double v16 = 0.0;
  double v17 = 0.0;
  do
  {
    v18 = [v11 objectAtIndexedSubscript:v15];
    v19 = [v11 objectAtIndexedSubscript:++v15];
    v20 = [v3 valueAtDate:v18];
    [v20 doubleValue];
    if (v21 < 0.05)
    {
      [v19 timeIntervalSinceDate:v18];
      double v16 = v16 + v22;
      v23 = v18;
      v24 = v35;
      if (v14) {
        goto LABEL_21;
      }
LABEL_20:
      id v26 = v18;
      v14 = v23;
      v35 = v24;
      goto LABEL_21;
    }
    if (v14)
    {
      if (v16 > v17)
      {
        id v25 = v14;

        v13 = v25;
        double v17 = v16;
      }

      double v16 = 0.0;
    }
    v23 = 0;
    v14 = 0;
    v24 = v18;
    if (!v35) {
      goto LABEL_20;
    }
LABEL_21:
  }
  while (v15 < (char *)[v11 count] - 1);
  BOOL v27 = v16 <= 0.0 || v35 == 0;
  if (v27 || ([v35 timeIntervalSinceDate:v34], double v29 = v16 + v28, v29 <= v17))
  {
    double v29 = v17;
  }
  else
  {
    id v30 = v14;

    v13 = v30;
  }
  id v9 = &__NSDictionary0__struct;
  if (v29 >= 7200.0 && v13)
  {
    v36[0] = @"periodStart";
    v36[1] = @"periodEnd";
    v37[0] = v13;
    v31 = [v13 dateByAddingTimeInterval:v29];
    v37[1] = v31;
    id v9 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
LABEL_32:
  id v32 = (id)qword_1001C4168;
  objc_sync_enter(v32);
  [(id)qword_1001C4168 setObject:v9 forKeyedSubscript:v33];
  objc_sync_exit(v32);

LABEL_6:

  return v9;
}

+ (id)lowLikelihoodPeriodStartForPredictionWithKey:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_1001C4168;
  objc_sync_enter(v4);
  double v5 = [(id)qword_1001C4168 objectForKeyedSubscript:v3];
  v6 = v5;
  if (v5)
  {
    double v7 = [v5 objectForKeyedSubscript:@"periodStart"];
  }
  else
  {
    double v7 = 0;
  }

  objc_sync_exit(v4);
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = [(id)objc_opt_class() cacheDetailsForPredictionWithKey:v3];
    id v8 = [v9 objectForKeyedSubscript:@"periodStart"];
  }

  return v8;
}

+ (id)lowLikelihoodPeriodEndForPredictionWithKey:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_1001C4168;
  objc_sync_enter(v4);
  double v5 = [(id)qword_1001C4168 objectForKeyedSubscript:v3];
  v6 = v5;
  if (v5)
  {
    double v7 = [v5 objectForKeyedSubscript:@"periodEnd"];
  }
  else
  {
    double v7 = 0;
  }

  objc_sync_exit(v4);
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = [(id)objc_opt_class() cacheDetailsForPredictionWithKey:v3];
    id v8 = [v9 objectForKeyedSubscript:@"periodEnd"];
  }

  return v8;
}

+ (id)predictionForKey:(id)a3
{
  id v3 = a3;
  id v5 = (id)qword_1001C4160;
  objc_sync_enter(v5);
  v6 = [(id)qword_1001C4160 objectForKeyedSubscript:v3];
  objc_sync_exit(v5);

  return v6;
}

+ (id)getValuesForPrediction:(id)a3 tillEndDate:(id)a4 withIntervals:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSDate date];
  [v9 timeIntervalSinceDate:v8];
  if (v10 >= 0.0) {
    goto LABEL_3;
  }
  [v8 timeIntervalSinceDate:v9];
  if (v11 > 86400.0) {
    goto LABEL_3;
  }
  id v14 = [v7 startDate];
  [v8 timeIntervalSinceDate:v14];
  if (v15 <= 0.0)
  {
    double v12 = 0;
  }
  else
  {
    double v16 = [v7 endDate];
    [v16 timeIntervalSinceDate:v9];
    double v18 = v17;

    if (v18 <= 0.0)
    {
LABEL_3:
      double v12 = 0;
      goto LABEL_4;
    }
    double v12 = +[NSMutableArray array];
    id v19 = v9;
    id v20 = v8;
    double v21 = [v7 startDate];
    [v21 timeIntervalSinceDate:v19];
    double v23 = v22;

    if (v23 <= 0.0)
    {
      unint64_t v24 = 0;
    }
    else
    {
      unint64_t v24 = (unint64_t)(v23 / a5);
      if (v24)
      {
        for (uint64_t i = 0; i != v24; ++i)
          [v12 setObject:&off_100186FD0 atIndexedSubscript:i];
      }
      uint64_t v26 = [v7 startDate];

      id v19 = (id)v26;
    }
    BOOL v27 = [v7 endDate];
    [v20 timeIntervalSinceDate:v27];
    double v29 = v28;

    id v30 = v20;
    if (v29 > 0.0)
    {
      id v30 = [v7 endDate];
    }
    [v30 timeIntervalSinceDate:v19];
    double v32 = v31;
    id v14 = v19;
    unint64_t v33 = (unint64_t)(v32 / a5);
    v44 = v30;
    v34 = v14;
    if (v24 < v33)
    {
      do
      {
        v35 = v34;
        v36 = [v7 valueAtDate:v34];
        [v12 setObject:v36 atIndexedSubscript:v24];

        v34 = [v35 dateByAddingTimeInterval:a5];

        ++v24;
      }
      while (v33 != v24);
      unint64_t v24 = (unint64_t)(v32 / a5);
    }
    v37 = [v7 endDate];
    [v20 timeIntervalSinceDate:v37];
    double v39 = v38;

    if (v39 > 0.0)
    {
      v40 = [v7 endDate];
      [v20 timeIntervalSinceDate:v40];
      double v42 = v41;

      unint64_t v43 = (unint64_t)(v42 / a5);
      if (v24 < v43)
      {
        do
          [v12 setObject:&off_100186FD0 atIndexedSubscript:v24++];
        while (v43 != v24);
      }
    }
  }
LABEL_4:

  return v12;
}

@end