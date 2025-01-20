@interface FMOOSPredictor
+ (id)getElementFromSortedArray:(id)a3 forPercentile:(unint64_t)a4;
+ (id)getOutOfServiceRecoveryPredictionWithFMCoreData:(id)a3 prevVisit:(id)a4 curVisit:(id)a5 subscriptionID:(id)a6 prevCells:(id)a7 startTime:(id)a8 entryLocation:(id)a9;
+ (id)outOfServiceAreaToFMOOSRecoveryPredictionsWithContext:(id)a3 WithOutOfServiceArea:(id)a4 FromTimestamp:(id)a5;
@end

@implementation FMOOSPredictor

+ (id)getOutOfServiceRecoveryPredictionWithFMCoreData:(id)a3 prevVisit:(id)a4 curVisit:(id)a5 subscriptionID:(id)a6 prevCells:(id)a7 startTime:(id)a8 entryLocation:(id)a9
{
  id v36 = a3;
  id v32 = a4;
  id v35 = a5;
  id v34 = a6;
  id v15 = a7;
  id v33 = a8;
  id v16 = [v15 count];
  v17 = +[FMConfiguration sharedInstance];
  id v18 = [v17 OOSPrevCellsInDatabase];
  id v31 = a1;
  if (v16 <= v18)
  {
    int64_t v19 = 0;
  }
  else
  {
    a8 = [v15 count];
    v30 = +[FMConfiguration sharedInstance];
    int64_t v19 = (unsigned char *)a8 - (unsigned char *)[v30 OOSPrevCellsInDatabase];
  }
  id v20 = [v15 count];
  v21 = +[FMConfiguration sharedInstance];
  id v22 = [v21 OOSPrevCellsInDatabase];
  if (v20 >= v22)
  {
    a8 = +[FMConfiguration sharedInstance];
    id v23 = [a8 OOSPrevCellsInDatabase];
  }
  else
  {
    id v23 = [v15 count];
  }
  v24 = objc_msgSend(v15, "subarrayWithRange:", v19, v23);
  if (v20 >= v22) {

  }
  if (v16 > v18) {
  v25 = [v36 getNewBackgroundContext];
  }
  if (v25)
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = sub_10006AEC0;
    v51 = sub_10006AED0;
    id v52 = 0;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_1001452A8();
    }
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000C9A0;
    v37[3] = &unk_1001B7BE0;
    id v38 = v36;
    id v39 = v33;
    v26 = v32;
    id v40 = v32;
    id v41 = v25;
    id v42 = v35;
    id v43 = v24;
    v45 = &v47;
    id v44 = v34;
    id v46 = v31;
    [v41 performBlockAndWait:v37];
    v27 = (void *)v48[5];
    if (v27) {
      id v28 = [v27 copy];
    }
    else {
      id v28 = 0;
    }

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_100145268();
    }
    id v28 = 0;
    v26 = v32;
  }

  return v28;
}

+ (id)outOfServiceAreaToFMOOSRecoveryPredictionsWithContext:(id)a3 WithOutOfServiceArea:(id)a4 FromTimestamp:(id)a5
{
  id v6 = a4;
  id v47 = a5;
  id v42 = v6;
  v7 = [v6 durations];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = objc_alloc((Class)NSMutableArray);
    v10 = [v42 durations];
    v11 = [v10 array];
    id v12 = [v9 initWithArray:v11];

    [v12 sortUsingComparator:&stru_1001B7C20];
    id v48 = objc_alloc_init((Class)NSMutableArray);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = v12;
    id v13 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v60;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v60 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(*((void *)&v59 + 1) + 8 * i) seconds]);
          [v48 addObject:v16];
        }
        id v13 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v13);
    }

    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10006B8FC;
    v57[3] = &unk_1001B7C88;
    v58 = &stru_1001B7C60;
    id v41 = objc_retainBlock(v57);
    v17 = +[FMConfiguration sharedInstance];
    [v17 selectPredictedCellBasedOnSeenCountLikelihood];
    unsigned int v19 = +[FMUtil randomlyTrueWithLikelihood:v18];

    id v20 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_10014545C(v19, v20);
    }
    v21 = [v42 nextCells];
    id v22 = [v21 allObjects];
    id v23 = v22;
    if (v19) {
      v24 = v41;
    }
    else {
      v24 = &stru_1001B7C60;
    }
    id v40 = [v22 sortedArrayUsingComparator:v24];

    id v45 = objc_alloc_init((Class)NSMutableArray);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v43 = v40;
    id v25 = [v43 countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v25)
    {
      uint64_t v46 = *(void *)v54;
      do
      {
        id v49 = v25;
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(void *)v54 != v46) {
            objc_enumerationMutation(v43);
          }
          v27 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
          id v28 = [FMServingCell alloc];
          v51 = [v27 subscriptionID];
          id v52 = [v27 radioAccessTechnology];
          v50 = [v27 cellID];
          v29 = [v27 mnc];
          v30 = [v27 mcc];
          id v31 = [v27 bandInfo];
          id v32 = [v27 tacOrLac];
          id v33 = [v27 arfcnOrUarfcn];
          id v34 = [v27 bandwidth];
          id v35 = [v27 pci];
          id v36 = [v27 deploymentType];
          id v37 = [(FMServingCell *)v28 init:v47 subscriptionID:v51 radioAccessTechnology:v52 cellID:v50 mnc:v29 mcc:v30 bandInfo:v31 tacOrLac:v32 arfcnOrUarfcn:v33 bandwidth:v34 pci:v35 deploymentType:v36];

          if (v37) {
            [v45 addObject:v37];
          }
        }
        id v25 = [v43 countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v25);
    }

    id v38 = -[FMOOSRecoveryPrediction init:seenCount:cells:]([FMOOSRecoveryPrediction alloc], "init:seenCount:cells:", v48, [v42 seenCount], v45);
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100145428();
    }
    id v38 = 0;
  }

  return v38;
}

+ (id)getElementFromSortedArray:(id)a3 forPercentile:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 count])
  {
    if (!a4)
    {
      uint64_t v7 = [v6 firstObject];
      goto LABEL_7;
    }
    if (a4 >= 0x65)
    {
      uint64_t v7 = [v6 lastObject];
LABEL_7:
      id v8 = (void *)v7;
      goto LABEL_16;
    }
    double v9 = (double)((unint64_t)[v6 count] - 1) / (100.0 / (double)a4);
    if (fabs(fmod(v9, 1.0) + -0.5) >= 2.22044605e-16)
    {
      unint64_t v17 = llround(v9);
      if ((v17 & 0x8000000000000000) == 0 && v17 < (unint64_t)[v6 count])
      {
        uint64_t v7 = [v6 objectAtIndexedSubscript:v17];
        goto LABEL_7;
      }
    }
    else
    {
      unint64_t v10 = llround(floor(v9));
      if ((v10 & 0x8000000000000000) == 0)
      {
        unint64_t v11 = v10 + 1;
        if (v10 + 1 < (unint64_t)[v6 count])
        {
          id v12 = [v6 objectAtIndexedSubscript:v10];
          [v12 doubleValue];
          double v14 = v13;
          id v15 = [v6 objectAtIndexedSubscript:v11];
          [v15 doubleValue];
          id v8 = +[NSNumber numberWithDouble:(v14 + v16) * 0.5];

          goto LABEL_16;
        }
      }
    }
  }
  id v8 = 0;
LABEL_16:

  return v8;
}

@end