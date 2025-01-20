@interface _DASPredictionUtilites
+ (id)computeAccuraciesFromSortedPredictions:(id)a3 andObservations:(id)a4 withEqualityOperator:(id)a5;
@end

@implementation _DASPredictionUtilites

+ (id)computeAccuraciesFromSortedPredictions:(id)a3 andObservations:(id)a4 withEqualityOperator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(_DASPredictionAccuracy);
  if ([v7 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v8;
    id obj = v8;
    id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v11) {
      goto LABEL_20;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v14);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100024D6C;
        v22[3] = &unk_100175838;
        id v16 = v9;
        v22[4] = v15;
        id v23 = v16;
        id v17 = [v7 indexOfObjectPassingTest:v22];
        if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (!v17)
          {
            [(_DASPredictionAccuracy *)v10 setTop1Hits:[(_DASPredictionAccuracy *)v10 top1Hits] + 1];
LABEL_11:
            [(_DASPredictionAccuracy *)v10 setTop3Hits:[(_DASPredictionAccuracy *)v10 top3Hits] + 1];
LABEL_12:
            [(_DASPredictionAccuracy *)v10 setTop5Hits:[(_DASPredictionAccuracy *)v10 top5Hits] + 1];
LABEL_13:
            [(_DASPredictionAccuracy *)v10 setTop10Hits:[(_DASPredictionAccuracy *)v10 top10Hits] + 1];
            goto LABEL_14;
          }
          if ((unint64_t)v17 <= 2) {
            goto LABEL_11;
          }
          if ((unint64_t)v17 <= 4) {
            goto LABEL_12;
          }
          if ((unint64_t)v17 <= 9) {
            goto LABEL_13;
          }
        }
LABEL_14:

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v18 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v12 = v18;
      if (!v18)
      {
LABEL_20:

        [(_DASPredictionAccuracy *)v10 setTotalPredictionIntervals:[(_DASPredictionAccuracy *)v10 totalPredictionIntervals] + 1];
        id v8 = v20;
        break;
      }
    }
  }

  return v10;
}

@end