@interface _DASMetricRecorder
+ (id)batchingQueue;
+ (id)metricQueue;
+ (id)readPredictionData;
+ (void)aggregateAndPostCAEvents:(id)a3;
+ (void)incrementOccurrencesForKey:(id)a3 byCount:(int64_t)a4;
+ (void)incrementOccurrencesForKeys:(id)a3 byCounts:(id)a4;
+ (void)recordOccurrenceForKey:(id)a3;
+ (void)savePredictionData:(id)a3;
@end

@implementation _DASMetricRecorder

+ (void)incrementOccurrencesForKey:(id)a3 byCount:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 batchingQueue];
  v10[0] = @"key";
  v10[1] = @"value";
  v11[0] = v6;
  v8 = +[NSNumber numberWithLongLong:a4];
  v11[1] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [v7 addWorkItem:v9];
}

+ (id)batchingQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D9B4;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4280 != -1) {
    dispatch_once(&qword_1001C4280, block);
  }
  v2 = (void *)qword_1001C4288;

  return v2;
}

+ (id)metricQueue
{
  if (qword_1001C4270 != -1) {
    dispatch_once(&qword_1001C4270, &stru_100177388);
  }
  v2 = (void *)qword_1001C4278;

  return v2;
}

+ (void)recordOccurrenceForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 batchingQueue];
  v7[0] = @"key";
  v7[1] = @"value";
  v8[0] = v4;
  v8[1] = &off_1001871C8;
  id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  [v5 addWorkItem:v6];
}

+ (void)incrementOccurrencesForKeys:(id)a3 byCounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v8 == [v7 count])
  {
    v9 = (char *)[v6 count];
    if (v9)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
      {
        v12 = [a1 batchingQueue];
        v16[0] = @"key";
        v13 = [v6 objectAtIndexedSubscript:i];
        v16[1] = @"value";
        v17[0] = v13;
        v14 = [v7 objectAtIndexedSubscript:i];
        v17[1] = v14;
        v15 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
        [v12 addWorkItem:v15];
      }
    }
  }
}

+ (void)aggregateAndPostCAEvents:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v10 = [v9 objectForKeyedSubscript:@"key"];
        v11 = [v4 objectForKeyedSubscript:v10];
        unsigned int v12 = [v11 intValue];

        v13 = [v9 objectForKeyedSubscript:v10];
        uint64_t v14 = [v13 intValue] + v12;

        v15 = +[NSNumber numberWithInt:v14];
        [v4 setObject:v15 forKeyedSubscript:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v4;
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [v16 objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * (void)j)];
        [v21 intValue];

        AnalyticsSendEventLazy();
      }
      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }
}

+ (void)savePredictionData:(id)a3
{
  id v3 = a3;
  id v5 = +[_CDClientContext userContext];
  id v4 = +[_CDContextualKeyPath keyPathWithKey:@"/system/activityPrediction"];
  [v5 setObject:v3 forKeyedSubscript:v4];
}

+ (id)readPredictionData
{
  v2 = +[_CDClientContext userContext];
  id v3 = +[_CDContextualKeyPath keyPathWithKey:@"/system/activityPrediction"];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

@end