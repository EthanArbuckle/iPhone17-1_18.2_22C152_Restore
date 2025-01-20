@interface FMCongestionModel
- (BOOL)isCongestionPredictionEnabledInCurrentCountry;
- (FMBasebandMetricsController)fmBasebandMetricsController;
- (FMCongestionModel)initWithFMCoreData:(id)a3;
- (FMCongestionModel)initWithFMCoreData:(id)a3 withQueueName:(const char *)a4;
- (void)_handleCellMonitorUpdate:(id)a3 info:(id)a4;
- (void)_handleIncomingMetric:(id)a3 withPayload:(id)a4;
- (void)_handleRegulatoryDomainEstimateUpdate:(id)a3;
- (void)_initializeStateForContext:(id)a3 atTime:(id)a4;
- (void)_updateStateForContext:(id)a3 atTime:(id)a4 withExistingState:(id)a5;
- (void)dealloc;
- (void)sendCongestionPredictionEventWithCongestionArea:(id)a3 isDataContext:(BOOL)a4;
- (void)sendCongestionPredictionEventWithPrediction:(id)a3 isDataContext:(BOOL)a4;
- (void)sendFedMobilityPredictionEventWithPredictionCorrect:(BOOL)a3 seenCount:(int)a4;
- (void)sendRLGSPredictionEventForCell:(id)a3;
- (void)setFmBasebandMetricsController:(id)a3;
- (void)setIsCongestionPredictionEnabledInCurrentCountry:(BOOL)a3;
@end

@implementation FMCongestionModel

- (void)_handleIncomingMetric:(id)a3 withPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FMCongestionModel *)self isCongestionPredictionEnabledInCurrentCountry])
  {
    if (v7)
    {
      v8 = +[FMBasebandMetricsController extractFMCongestionMetricFrom:v7];
      v9 = *(NSObject **)(qword_1001D8080 + 136);
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_100140870();
        }
        v10 = +[NSDate now];
        v11 = [(FMModel *)self contextUUIDToStateMap];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10000EA6C;
        v14[3] = &unk_1001B5C70;
        id v15 = v8;
        v16 = self;
        id v12 = v10;
        id v17 = v12;
        [v11 enumerateKeysAndObjectsUsingBlock:v14];
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        sub_100140830();
      }
    }
    else
    {
      v13 = *(NSObject **)(qword_1001D8080 + 136);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FederatedMobility[FMCongestionModel]:#N Received null metric: %@", buf, 0xCu);
      }
    }
  }
}

- (void)sendRLGSPredictionEventForCell:(id)a3
{
  id v48 = a3;
  pthread_mutex_lock(&stru_1001D6738);
  uint64_t v5 = xmmword_1001D6778;
  if (!(void)xmmword_1001D6778)
  {
    sub_10006C024(&v63);
    long long v6 = v63;
    long long v63 = 0uLL;
    id v7 = (std::__shared_weak_count *)*((void *)&xmmword_1001D6778 + 1);
    xmmword_1001D6778 = v6;
    if (v7)
    {
      sub_10000B678(v7);
      if (*((void *)&v63 + 1)) {
        sub_10000B678(*((std::__shared_weak_count **)&v63 + 1));
      }
    }
    uint64_t v5 = xmmword_1001D6778;
  }
  v8 = (std::__shared_weak_count *)*((void *)&xmmword_1001D6778 + 1);
  if (*((void *)&xmmword_1001D6778 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_1001D6778 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&stru_1001D6738);
  char v9 = sub_10001ECD4(v5);
  if (v8) {
    sub_10000B678(v8);
  }
  if (v9)
  {
    v10 = [(FMModel *)self fmCoreData];
    v11 = [v10 getPreviouslyStoredMatchingFMCongestionCell:v48];

    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100140974();
    }
    v47 = v11;
    uint64_t v12 = [v48 dlBottleneckScoreAsString];
    v43 = (void *)v12;
    uint64_t v13 = [v48 ulBottleneckScoreAsString];
    v41 = (void *)v13;
    if (v11)
    {
      v14 = [v11 dlBottleneckScoreAsString];
      id v15 = [v11 ulBottleneckScoreAsString];
      v16 = v14;
      id v17 = [v14 isEqualToString:v12];
      v18 = v15;
      id v19 = [v15 isEqualToString:v13];
      uint64_t v20 = +[NSNumber numberWithBool:v17];
      v11 = +[NSNumber numberWithBool:v19];
      v42 = +[NSNumber numberWithBool:v17 & v19];
      uint64_t v45 = v20;
      v3 = [v47 congestionMetric];
      v21 = (void *)v45;
      if ([v3 dataStallIndicatorAVS])
      {
        BOOL v44 = 1;
        goto LABEL_20;
      }
    }
    else
    {
      v42 = 0;
      v21 = 0;
      v18 = 0;
      v16 = 0;
    }
    v22 = [v48 congestionMetric];
    unsigned int v23 = [v22 dataStallIndicatorAVS];
    BOOL v44 = v23 != 0;

    if (!v47)
    {
      BOOL v44 = v23 != 0;
      goto LABEL_23;
    }
LABEL_20:

    v3 = [v47 congestionMetric];
    if ([v3 dataStallIndicatorUL])
    {
      BOOL v24 = 1;
      goto LABEL_24;
    }
LABEL_23:
    v25 = [v48 congestionMetric];
    unsigned int v26 = [v25 dataStallIndicatorUL];
    BOOL v24 = v26 != 0;

    if (!v47)
    {
      BOOL v24 = v26 != 0;
      goto LABEL_27;
    }
LABEL_24:

    v3 = [v47 congestionMetric];
    if ([v3 isSubway])
    {
      BOOL v27 = 1;
      goto LABEL_28;
    }
LABEL_27:
    v28 = [v48 congestionMetric];
    BOOL v27 = [v28 isSubway] != 0;

    if (!v47)
    {
LABEL_29:
      v46 = v21;
      v29 = [v48 congestionMetric];
      unsigned int v30 = [v29 psPref];
      v31 = [v48 congestionMetric];
      BOOL v32 = v30 == [v31 subsId];

      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10001D92C;
      v49[3] = &unk_1001B5CE0;
      id v50 = v48;
      id v33 = v16;
      id v51 = v33;
      id v34 = v43;
      id v52 = v34;
      id v35 = v46;
      id v53 = v35;
      id v36 = v18;
      id v54 = v36;
      id v37 = v41;
      id v55 = v37;
      id v38 = v11;
      id v56 = v38;
      BOOL v59 = v44;
      BOOL v60 = v24;
      BOOL v61 = v27;
      BOOL v62 = v32;
      id v39 = v42;
      id v57 = v39;
      id v40 = v47;
      id v58 = v40;
      sub_100005B9C(@"com.apple.Telephony.cellularCongestionInfoValidation", v49);

      goto LABEL_30;
    }
LABEL_28:

    goto LABEL_29;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_1001409F8();
  }
LABEL_30:
}

- (void)_handleCellMonitorUpdate:(id)a3 info:(id)a4
{
  id v70 = a3;
  id v71 = a4;
  v72 = self;
  if ([(FMCongestionModel *)self isCongestionPredictionEnabledInCurrentCountry])
  {
    if (v71)
    {
      long long v6 = [(FMModel *)self contextUUIDToStateMap];
      id v7 = [v6 objectForKey:v70];

      if (v7)
      {
        v64 = +[WISTelephonyUtils getServingCellInfoFromArray:v71];
        v8 = +[NSDate now];
        char v9 = [v7 subscriptionID];
        id v95 = 0;
        v66 = +[FMCoreTelephonyController cellInfoToFMCongestionCell:v64 atTime:v8 inSlot:v9 error:&v95];
        id v65 = v95;

        if (v65 || !v66)
        {
          uint64_t v12 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v13 = [v65 localizedDescription];
            sub_1001406F8((uint64_t)v70, v13, buf, v12);
          }
        }
        else
        {
          v10 = [v7 prevCells];
          long long v63 = [v10 lastObject];

          if (v63 && [v63 isEqual:v66])
          {
            v11 = [v66 timestamp];
            [v63 setTimestamp:v11];
          }
          else
          {
            v14 = [v7 prevCells];
            BOOL v15 = (unint64_t)[v14 count] > 1;

            if (v15)
            {
              v16 = [v7 prevCells];
              id v17 = [v7 prevCells];
              v73 = objc_msgSend(v16, "objectAtIndexedSubscript:", (char *)objc_msgSend(v17, "count") - 2);
            }
            else
            {
              v73 = 0;
            }
            v18 = [v7 prevCells];
            [v18 addObject:v66];

            id v19 = +[FMConfiguration sharedInstance];
            uint64_t v20 = (char *)[v19 congestionPrevCellsInDatabase];
            v21 = [v7 prevCells];
            +[FMUtil removeFirstElementsForCapacity:v20 + 2 fromArray:v21];

            long long v93 = 0u;
            long long v94 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            v22 = [v7 congestionPredictions];
            id v23 = [v22 countByEnumeratingWithState:&v91 objects:v98 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v92;
              do
              {
                for (i = 0; i != v23; i = (char *)i + 1)
                {
                  if (*(void *)v92 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  unsigned int v26 = *(void **)(*((void *)&v91 + 1) + 8 * i);
                  if (![v26 state]) {
                    [v26 activate];
                  }
                }
                id v23 = [v22 countByEnumeratingWithState:&v91 objects:v98 count:16];
              }
              while (v23);
            }

            BOOL v61 = +[NSDate now];
            BOOL v27 = [(FMModel *)v72 fmCoreData];
            v28 = [v7 subscriptionID];
            v29 = [v7 prevCells];
            BOOL v62 = [v27 getCongestionPredictionsForSubscriptionID:v28 andPrevCells:v29 atTime:v61];

            if (v62)
            {
              long long v89 = 0u;
              long long v90 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              id v30 = v62;
              id v31 = [v30 countByEnumeratingWithState:&v87 objects:v97 count:16];
              if (v31)
              {
                uint64_t v32 = *(void *)v88;
                do
                {
                  for (j = 0; j != v31; j = (char *)j + 1)
                  {
                    if (*(void *)v88 != v32) {
                      objc_enumerationMutation(v30);
                    }
                    id v34 = *(void **)(*((void *)&v87 + 1) + 8 * (void)j);
                    id v35 = *(NSObject **)(qword_1001D8080 + 136);
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v100 = v34;
                      _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMCongestionModel]:#D Received congestion prediction: %@", buf, 0xCu);
                    }
                    id v36 = [v7 congestionPredictions];
                    [v36 addObject:v34];
                  }
                  id v31 = [v30 countByEnumeratingWithState:&v87 objects:v97 count:16];
                }
                while (v31);
              }
            }
            id v37 = *(NSObject **)(qword_1001D8080 + 136);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v100 = v70;
              __int16 v101 = 2112;
              v102 = v66;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "FederatedMobility[FMCongestionModel]:#I Cell Monitor Update for context %@: %@", buf, 0x16u);
            }
            if (v73
              && ([v73 congestionMetric], (id v38 = objc_claimAutoreleasedReturnValue()) != 0)
              && (unsigned int v39 = [v73 isCongested], v38, !v39))
            {
              id v40 = [v73 congestionMetric];
              unsigned int v68 = [v40 psPref];
              v41 = [v73 congestionMetric];
              unsigned int v42 = [v41 subsId];
              BOOL v60 = v68 == v42;

              id v69 = objc_alloc_init((Class)NSMutableArray);
              long long v85 = 0u;
              long long v86 = 0u;
              long long v84 = 0u;
              long long v83 = 0u;
              v43 = [v7 congestionPredictions];
              id v44 = [v43 countByEnumeratingWithState:&v83 objects:v96 count:16];
              if (v44)
              {
                char v67 = 0;
                uint64_t v45 = *(void *)v84;
                do
                {
                  for (k = 0; k != v44; k = (char *)k + 1)
                  {
                    if (*(void *)v84 != v45) {
                      objc_enumerationMutation(v43);
                    }
                    v47 = *(void **)(*((void *)&v83 + 1) + 8 * (void)k);
                    if ([v47 state] == 1)
                    {
                      id v48 = [v47 actualGoodCells];
                      [v48 addObject:v73];

                      v49 = [v47 actualGoodCells];
                      unint64_t v50 = (unint64_t)[v49 count];
                      id v51 = +[FMConfiguration sharedInstance];
                      LOBYTE(v50) = v50 < (unint64_t)[v51 congestionGoodCellsInDatabase];

                      if ((v50 & 1) == 0)
                      {
                        [v69 addObject:v47];
                        [v47 end];
                        [(FMCongestionModel *)v72 sendCongestionPredictionEventWithPrediction:v47 isDataContext:v68 == v42];
                        char v67 = 1;
                      }
                    }
                  }
                  id v44 = [v43 countByEnumeratingWithState:&v83 objects:v96 count:16];
                }
                while (v44);
              }
              else
              {
                char v67 = 0;
              }

              id v52 = [v7 congestionPredictions];
              [v52 removeObjectsInArray:v69];

              id v53 = objc_alloc_init((Class)NSMutableArray);
              id v54 = objc_alloc_init((Class)NSMutableArray);
              id v55 = [v7 activeCongestionAreas];
              v78[0] = _NSConcreteStackBlock;
              v78[1] = 3221225472;
              v78[2] = sub_100020554;
              v78[3] = &unk_1001B5BF8;
              id v79 = v61;
              id v80 = v73;
              id v56 = v53;
              id v81 = v56;
              id v57 = v54;
              id v82 = v57;
              [v55 enumerateObjectsUsingBlock:v78];

              id v58 = [v7 activeCongestionAreas];
              [v58 removeObjectsInArray:v56];

              BOOL v59 = [v7 activeCongestionAreas];
              [v59 removeObjectsInArray:v57];

              v74[0] = _NSConcreteStackBlock;
              v74[1] = 3221225472;
              v74[2] = sub_100020680;
              v74[3] = &unk_1001B5C20;
              char v76 = v67 & 1;
              v74[4] = v72;
              BOOL v77 = v60;
              id v75 = v7;
              [v56 enumerateObjectsUsingBlock:v74];
            }
            else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
            {
              sub_100140690();
            }

            v11 = v73;
          }
        }
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
      {
        sub_100140628();
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
    {
      sub_1001405C0();
    }
  }
}

- (BOOL)isCongestionPredictionEnabledInCurrentCountry
{
  return self->_isCongestionPredictionEnabledInCurrentCountry;
}

- (FMCongestionModel)initWithFMCoreData:(id)a3
{
  return [(FMCongestionModel *)self initWithFMCoreData:a3 withQueueName:"com.apple.wirelessinsightsd.FederatedMobility.FMCongestionModel"];
}

- (FMCongestionModel)initWithFMCoreData:(id)a3 withQueueName:(const char *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMCongestionModel;
  id v7 = [(FMModel *)&v18 initWithFMCoreData:v6 withQueueName:a4];
  v8 = v7;
  if (v7)
  {
    char v9 = [(FMModel *)v7 fmRegulatoryDomainController];
    v10 = [v9 getCurrentEstimates];
    [(FMCongestionModel *)v8 _handleRegulatoryDomainEstimateUpdate:v10];

    v11 = [FMBasebandMetricsController alloc];
    v19[0] = @"com.apple.Telephony.testCongestionInfo";
    v19[1] = @"com.apple.Baseband.cellularCongestionInfo";
    uint64_t v12 = +[NSArray arrayWithObjects:v19 count:2];
    uint64_t v13 = [(FMBasebandMetricsController *)v11 initWithFMModel:v8 withSubscribedMetrics:v12];
    [(FMCongestionModel *)v8 setFmBasebandMetricsController:v13];

    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100140440();
    }
    v14 = [(FMModel *)v8 fmCoreTelephonyController];
    BOOL v15 = [v14 getSubscriptionContextsInUse];
    [(FMModel *)v8 populateSubscriptionContextsInUse:v15];

    v16 = v8;
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_100140400();
  }

  return v8;
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100140474();
  }
  v3.receiver = self;
  v3.super_class = (Class)FMCongestionModel;
  [(FMModel *)&v3 dealloc];
}

- (void)_initializeStateForContext:(id)a3 atTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    char v9 = [v6 uuid];
    sub_100140510(v9, v15, v8);
  }
  v10 = [FMCongestionContextState alloc];
  v11 = [v6 subscriptionID];
  uint64_t v12 = [(FMCongestionContextState *)v10 initWithStartTime:v7 subscriptionID:v11];

  if (v12)
  {
    uint64_t v13 = [(FMModel *)self contextUUIDToStateMap];
    v14 = [v6 uuid];
    [v13 setObject:v12 forKey:v14];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_1001404A8();
  }
}

- (void)_updateStateForContext:(id)a3 atTime:(id)a4 withExistingState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v8 uuid];
    sub_100140568(v12, v16, v11);
  }
  uint64_t v13 = [v10 subscriptionID];
  v14 = [v8 subscriptionID];
  unsigned __int8 v15 = [v13 isEqualToNumber:v14];

  if ((v15 & 1) == 0) {
    [(FMCongestionModel *)self _initializeStateForContext:v8 atTime:v9];
  }
}

- (void)_handleRegulatoryDomainEstimateUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[FMConfiguration sharedInstance];
  id v6 = [v5 congestionPredictionEnabledCountries];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002098C;
  v10[3] = &unk_1001B5C98;
  id v7 = v6;
  id v11 = v7;
  id v8 = [v4 indexOfObjectPassingTest:v10];
  id v9 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v8 != (id)0x7FFFFFFFFFFFFFFFLL;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FederatedMobility[FMCongestionModel]:#I Congestion prediction enabled in current country: %{BOOL}d", buf, 8u);
  }
  [(FMCongestionModel *)self setIsCongestionPredictionEnabledInCurrentCountry:v8 != (id)0x7FFFFFFFFFFFFFFFLL];
}

- (void)sendFedMobilityPredictionEventWithPredictionCorrect:(BOOL)a3 seenCount:(int)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020A10;
  v4[3] = &unk_1001B5CB8;
  BOOL v6 = a3;
  int v5 = a4;
  sub_100005B9C(@"com.apple.Telephony.fedMobilityPredictions", v4);
}

- (void)sendCongestionPredictionEventWithPrediction:(id)a3 isDataContext:(BOOL)a4
{
  id v5 = a3;
  if ([v5 state] == 2)
  {
    BOOL v6 = [v5 predictedGoodCells];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100020F38;
    v35[3] = &unk_1001B5D08;
    id v7 = v5;
    id v36 = v7;
    id v8 = [v6 indexesOfObjectsPassingTest:v35];
    id v9 = [v8 count];

    id v10 = [v7 predictedBadCells];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100020FAC;
    v33[3] = &unk_1001B5D08;
    id v11 = v7;
    id v34 = v11;
    uint64_t v12 = [v10 indexesOfObjectsPassingTest:v33];
    id v13 = [v12 count];

    v14 = [v11 predictedGoodCells];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100021020;
    v31[3] = &unk_1001B5D08;
    id v15 = v11;
    id v32 = v15;
    v16 = [v14 indexesOfObjectsPassingTest:v31];
    id v17 = [v16 count];

    objc_super v18 = [v15 predictedBadCells];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100021094;
    v29[3] = &unk_1001B5D08;
    id v19 = v15;
    id v30 = v19;
    uint64_t v20 = [v18 indexesOfObjectsPassingTest:v29];
    id v21 = [v20 count];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100021108;
    v22[3] = &unk_1001B5D30;
    id v23 = v19;
    id v24 = v9;
    id v25 = v13;
    id v26 = v17;
    id v27 = v21;
    BOOL v28 = a4;
    sub_100005B9C(@"com.apple.Telephony.fedMobilityCongestionPredictions", v22);
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_100140A2C();
  }
}

- (void)sendCongestionPredictionEventWithCongestionArea:(id)a3 isDataContext:(BOOL)a4
{
  id v5 = a3;
  if ([v5 curState] == 2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100021A04;
    v6[3] = &unk_1001B5D58;
    id v7 = v5;
    BOOL v8 = a4;
    sub_100005B9C(@"com.apple.Telephony.fedMobilityCongestionPredictions", v6);
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_100140A94();
  }
}

- (FMBasebandMetricsController)fmBasebandMetricsController
{
  return (FMBasebandMetricsController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFmBasebandMetricsController:(id)a3
{
}

- (void)setIsCongestionPredictionEnabledInCurrentCountry:(BOOL)a3
{
  self->_isCongestionPredictionEnabledInCurrentCountry = a3;
}

- (void).cxx_destruct
{
}

@end