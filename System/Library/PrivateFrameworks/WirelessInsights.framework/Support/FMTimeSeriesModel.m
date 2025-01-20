@interface FMTimeSeriesModel
- (BOOL)isAirplaneModeActive;
- (FMBasebandMetricsController)fmBasebandMetricsController;
- (FMCoreLocationController)fmCoreLocationController;
- (FMTimeSeriesModel)initWithFMCoreData:(id)a3;
- (id)trimEventsAndCopyForState:(id)a3 basedOnTimestamp:(unint64_t)a4;
- (void)_handleAirplaneModeActiveChanged:(BOOL)a3;
- (void)_handleCellMonitorUpdate:(id)a3 info:(id)a4;
- (void)_handleIncomingMetric:(id)a3 withPayload:(id)a4;
- (void)_handleRegistrationStatusChanged:(id)a3 registrationStatus:(id)a4;
- (void)_handleSignalStrengthChanged:(id)a3 bars:(id)a4;
- (void)_handleVisitEnded:(id)a3;
- (void)_handleVisitStarted:(id)a3;
- (void)_initializeStateForContext:(id)a3 atTime:(id)a4;
- (void)_updateStateForContext:(id)a3 atTime:(id)a4 withExistingState:(id)a5;
- (void)addEvent:(id)a3 toState:(id)a4;
- (void)dealloc;
- (void)endAnomaly:(id)a3 forState:(id)a4;
- (void)maybeFetchPredictionsForAllStates;
- (void)maybeFetchPredictionsForState:(id)a3;
- (void)removeActivePredictionsOlderThanThresholdFromState:(id)a3 atCurrentTimestamp:(unint64_t)a4;
- (void)removeEventsOutsideTimeWindowFromState:(id)a3 basedOnTimestamp:(unint64_t)a4;
- (void)setFmBasebandMetricsController:(id)a3;
- (void)setFmCoreLocationController:(id)a3;
- (void)setIsAirplaneModeActive:(BOOL)a3;
- (void)startAnomaly:(id)a3 forState:(id)a4;
- (void)storeAndSendTelemetryForFinishedPrediction:(id)a3;
- (void)visit:(id)a3 started:(BOOL)a4;
@end

@implementation FMTimeSeriesModel

- (FMTimeSeriesModel)initWithFMCoreData:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMTimeSeriesModel;
  v5 = [(FMModel *)&v15 initWithFMCoreData:v4 withQueueName:"com.apple.wirelessinsightsd.FederatedMobility.FMTimeSeriesModel"];
  if (v5)
  {
    v6 = [FMBasebandMetricsController alloc];
    v16[0] = @"com.apple.Telephony.testCongestionInfo";
    v16[1] = @"com.apple.Baseband.cellularCongestionInfo";
    v7 = +[NSArray arrayWithObjects:v16 count:2];
    v8 = [(FMBasebandMetricsController *)v6 initWithFMModel:v5 withSubscribedMetrics:v7];
    [(FMTimeSeriesModel *)v5 setFmBasebandMetricsController:v8];

    v9 = [[FMCoreLocationController alloc] initWithFMModel:v5];
    [(FMTimeSeriesModel *)v5 setFmCoreLocationController:v9];

    v10 = [(FMModel *)v5 fmCoreTelephonyController];
    -[FMTimeSeriesModel setIsAirplaneModeActive:](v5, "setIsAirplaneModeActive:", [v10 isAirplaneModeActive]);

    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100141B24();
    }
    v11 = [(FMModel *)v5 fmCoreTelephonyController];
    v12 = [v11 getSubscriptionContextsInUse];
    [(FMModel *)v5 populateSubscriptionContextsInUse:v12];

    v13 = v5;
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_100141AF0();
  }

  return v5;
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100141B58();
  }
  v3.receiver = self;
  v3.super_class = (Class)FMTimeSeriesModel;
  [(FMModel *)&v3 dealloc];
}

- (void)_initializeStateForContext:(id)a3 atTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    v8 = [v6 uuid];
    v9 = [v6 plmn];
    sub_100141C74(v8, v9, (uint64_t)&v18);
  }
  v10 = [v6 plmn];
  BOOL v11 = v10 == 0;

  if (v11)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_100141B8C();
    }
  }
  else
  {
    v12 = [FMTimeSeriesContextState alloc];
    v13 = [v6 subscriptionID];
    v14 = [v6 plmn];
    objc_super v15 = [(FMTimeSeriesContextState *)v12 initWithStartTime:v7 subscriptionID:v13 homePLMN:v14];

    if (v15)
    {
      v16 = [(FMModel *)self contextUUIDToStateMap];
      v17 = [v6 uuid];
      [v16 setObject:v15 forKey:v17];
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
    {
      sub_100141C00();
    }
  }
}

- (void)_updateStateForContext:(id)a3 atTime:(id)a4 withExistingState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = [v8 uuid];
    sub_100141CD4(v12, (uint64_t)&v18, v11);
  }
  v13 = [v10 subscriptionID];
  v14 = [v8 subscriptionID];
  if ([v13 isEqualToNumber:v14])
  {
    objc_super v15 = [v10 homePLMN];
    v16 = [v8 plmn];
    unsigned __int8 v17 = [v15 isEqualToString:v16];

    if (v17) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  [(FMTimeSeriesModel *)self _initializeStateForContext:v8 atTime:v9];
LABEL_8:
}

- (void)_handleAirplaneModeActiveChanged:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100141D20(v3, v5);
  }
  [(FMTimeSeriesModel *)self setIsAirplaneModeActive:v3];
}

- (void)_handleCellMonitorUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(FMModel *)self contextUUIDToStateMap];
    id v9 = [v8 objectForKey:v6];

    if (v9)
    {
      v27 = +[NSDate now];
      __uint64_t v25 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      v26 = +[WISTelephonyUtils getServingCellInfoFromArray:v7];
      id v10 = [v9 subscriptionID];
      id v28 = 0;
      BOOL v11 = +[FMCoreTelephonyController cellInfoToFMServingCell:v26 atTime:v27 inSlot:v10 error:&v28];
      id v12 = v28;

      if (v12 || !v11)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
        {
          v19 = [v12 localizedDescription];
          sub_100141E6C((uint64_t)v6, v19, (uint64_t)buf);
        }
      }
      else
      {
        v13 = [v9 cellChanges];
        v14 = [v13 lastObject];
        objc_super v15 = [v14 toCell];

        v16 = [v9 cellChanges];
        unsigned __int8 v17 = [[FMCellChange alloc] initWithTime:v27 andTimestamp:v25 andCell:v11];
        [v16 addObject:v17];

        if (v15 && ![v15 isEqual:v11])
        {
          v20 = [v9 cellChanges];
          +[FMUtil removeFirstElementsForCapacity:2 fromArray:v20];

          v21 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v30 = v6;
            __int16 v31 = 2112;
            v32 = v11;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "FederatedMobility[FMTimeSeriesModel]:#I Cell Monitor Update for context %@: %@", buf, 0x16u);
          }
          v22 = [FMTSEventCellChanged alloc];
          uint64_t v18 = [v15 gci];
          v23 = [v11 gci];
          v24 = [(FMTSEventCellChanged *)v22 initWithTimestamp:v25 fromCellGCI:v18 toCellGCI:v23];
          [(FMTimeSeriesModel *)self addEvent:v24 toState:v9];
        }
        else
        {
          uint64_t v18 = [v11 timestamp];
          [v15 updateTimestampTo:v18];
        }
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
    {
      sub_100141E04();
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    sub_100141D9C();
  }
}

- (void)_handleRegistrationStatusChanged:(id)a3 registrationStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(FMModel *)self contextUUIDToStateMap];
    id v9 = [v8 objectForKey:v6];

    BOOL v10 = os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v10) {
        sub_100141F94();
      }
      BOOL v11 = [v9 curRegistrationState];
      [v9 setCurRegistrationState:v7];
      if (v11 && ([v11 isEqualToString:v7] & 1) == 0)
      {
        v19 = +[NSDate now];
        __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        if ([(FMTimeSeriesModel *)self isAirplaneModeActive])
        {
          if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
            sub_100141F2C();
          }
        }
        else
        {
          if (+[WISTelephonyUtils isRegistrationDisplayStatusInService:](WISTelephonyUtils, "isRegistrationDisplayStatusInService:", v11)&& +[WISTelephonyUtils isRegistrationDisplayStatusOutOfService:v7])
          {
            v14 = [FMTSAnomalyOutOfService alloc];
            objc_super v15 = [(FMTimeSeriesModel *)self trimEventsAndCopyForState:v9 basedOnTimestamp:v12];
            v16 = [(FMTSAnomaly *)v14 initWithTime:v19 timestamp:v12 events:v15];

            [(FMTimeSeriesModel *)self startAnomaly:v16 forState:v9];
          }
          if (+[WISTelephonyUtils isRegistrationDisplayStatusOutOfService:](WISTelephonyUtils, "isRegistrationDisplayStatusOutOfService:", v11)&& +[WISTelephonyUtils isRegistrationDisplayStatusInService:v7])
          {
            unsigned __int8 v17 = [v9 activeAnomalies];
            uint64_t v18 = [v17 objectForKey:&off_1001C3820];

            if (v18)
            {
              [v18 endAtTimestamp:v12];
              [(FMTimeSeriesModel *)self endAnomaly:v18 forState:v9];
            }
            else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
            {
              sub_100141F60();
            }
          }
        }
      }
    }
    else if (v10)
    {
      sub_100141EC4();
    }
  }
  else
  {
    v13 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FederatedMobility[FMTimeSeriesModel]:#I Received nil display status change for context %@", buf, 0xCu);
    }
  }
}

- (void)_handleSignalStrengthChanged:(id)a3 bars:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(FMModel *)self contextUUIDToStateMap];
    id v9 = [v8 objectForKey:v6];

    if (!v9)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_100141E04();
      }
      goto LABEL_19;
    }
    __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    BOOL v11 = +[NSDate now];
    __uint64_t v12 = [v9 curSignalStrengthBars];
    [v9 setCurSignalStrengthBars:v7];
    if (!v12 || ([v12 isEqualToNumber:v7] & 1) != 0)
    {
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    if ((int)[v12 intValue] < 2 || (int)objc_msgSend(v7, "intValue") > 1)
    {
      if ((int)[v12 intValue] > 1 || (int)objc_msgSend(v7, "intValue") < 2) {
        goto LABEL_17;
      }
      v16 = [v9 activeAnomalies];
      objc_super v15 = [v16 objectForKey:&off_1001C3838];

      if (v15)
      {
        [(FMTSAnomaly *)v15 endAtTimestamp:v10];
        [(FMTimeSeriesModel *)self endAnomaly:v15 forState:v9];
      }
    }
    else
    {
      v13 = [FMTSAnomalyLowSignalStrength alloc];
      v14 = [(FMTimeSeriesModel *)self trimEventsAndCopyForState:v9 basedOnTimestamp:v10];
      objc_super v15 = [(FMTSAnomaly *)v13 initWithTime:v11 timestamp:v10 events:v14];

      [(FMTimeSeriesModel *)self startAnomaly:v15 forState:v9];
    }

LABEL_17:
    unsigned __int8 v17 = [[FMTSEventSignalStrengthChanged alloc] initWithTimestamp:v10 fromBars:v12 toBars:v7];
    [(FMTimeSeriesModel *)self addEvent:v17 toState:v9];

    goto LABEL_18;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100142018();
  }
LABEL_20:
}

- (void)_handleIncomingMetric:(id)a3 withPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[FMBasebandMetricsController extractFMCongestionMetricFrom:v7];
    id v9 = *(NSObject **)(qword_1001D8080 + 136);
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FederatedMobility[FMTimeSeriesModel]:#I Received congestion metric: %@", buf, 0xCu);
      }
      __uint64_t v10 = [(FMModel *)self contextUUIDToStateMap];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100033D28;
      v12[3] = &unk_1001B66C0;
      id v13 = v8;
      v14 = self;
      [v10 enumerateKeysAndObjectsUsingBlock:v12];
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_100142080();
    }
  }
  else
  {
    BOOL v11 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FederatedMobility[FMTimeSeriesModel]:#N Received null metric: %@", buf, 0xCu);
    }
  }
}

- (void)_handleVisitStarted:(id)a3
{
}

- (void)_handleVisitEnded:(id)a3
{
}

- (id)trimEventsAndCopyForState:(id)a3 basedOnTimestamp:(unint64_t)a4
{
  id v6 = a3;
  [(FMTimeSeriesModel *)self removeEventsOutsideTimeWindowFromState:v6 basedOnTimestamp:a4];
  id v7 = [v6 events];
  id v8 = [v7 copy];

  return v8;
}

- (void)visit:(id)a3 started:(BOOL)a4
{
  id v6 = a3;
  __uint64_t v7 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v8 = [(FMModel *)self contextUUIDToStateMap];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003420C;
  v10[3] = &unk_1001B66E8;
  BOOL v14 = a4;
  __uint64_t v13 = v7;
  id v9 = v6;
  id v11 = v9;
  __uint64_t v12 = self;
  [v8 enumerateKeysAndObjectsUsingBlock:v10];
}

- (void)addEvent:(id)a3 toState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 subscriptionID];
    int v11 = 138412546;
    __uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "FederatedMobility[FMTimeSeriesModel]:#I Adding event to state %@: %@", (uint8_t *)&v11, 0x16u);
  }
  __uint64_t v10 = [v7 events];
  [v10 addObject:v6];

  -[FMTimeSeriesModel removeEventsOutsideTimeWindowFromState:basedOnTimestamp:](self, "removeEventsOutsideTimeWindowFromState:basedOnTimestamp:", v7, [v6 timestamp]);
  objc_msgSend(v7, "setEventsLastChangedTimestamp:", objc_msgSend(v6, "timestamp"));
  [(FMTimeSeriesModel *)self maybeFetchPredictionsForState:v7];
}

- (void)startAnomaly:(id)a3 forState:(id)a4
{
  id v5 = a3;
  id v20 = a4;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_1001421B8();
  }
  id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 type]);
  id v7 = [v20 activeAnomalies];
  id v8 = [v7 objectForKey:v6];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    __uint64_t v10 = [v20 activePredictions];
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      __uint64_t v12 = 0;
      uint64_t v13 = *(void *)v22;
      unint64_t v14 = -1;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unsigned int v17 = [v16 predictedAnomalyType];
          if (v17 == [v5 type]
            && ([v16 didAnomalyHappen] & 1) == 0
            && (unint64_t)[v16 predictedStartTimestamp] < v14)
          {
            unint64_t v14 = (unint64_t)[v16 predictedStartTimestamp];
            id v18 = v16;

            __uint64_t v12 = v18;
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);

      if (v12)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
          sub_1001420E8();
        }
        objc_msgSend(v12, "predictedAnomalyStartedAtTimestamp:", objc_msgSend(v5, "startTimestamp"));
      }
    }
    else
    {

      __uint64_t v12 = 0;
    }
    v19 = [v20 activeAnomalies];
    [v19 setObject:v5 forKey:v6];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    sub_100142150();
  }
}

- (void)endAnomaly:(id)a3 forState:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100142220();
  }
  v27 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 type]);
  id v7 = [v28 activeAnomalies];
  [v7 removeObjectForKey:v27];

  id v8 = [(FMModel *)self fmCoreData];
  BOOL v9 = [v28 homePLMN];
  [v8 storeAnomaly:v6 forHomePLMN:v9];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  __uint64_t v10 = [v28 activePredictions];
  id v11 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v11)
  {
    __uint64_t v12 = 0;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        unsigned int v16 = [v15 predictedAnomalyType];
        if (v16 == [v6 type] && objc_msgSend(v15, "didAnomalyHappen"))
        {
          id v17 = v15;

          __uint64_t v12 = v17;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v11);

    if (v12)
    {
      id v18 = [v28 activePredictions];
      [v18 removeObjectIdenticalTo:v12];

      objc_msgSend(v12, "predictedAnomalyEndedAtTimestamp:", objc_msgSend(v6, "endTimestamp"));
      [(FMTimeSeriesModel *)self storeAndSendTelemetryForFinishedPrediction:v12];
      uint64_t v19 = 1;
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
  else
  {

    uint64_t v19 = 0;
    __uint64_t v12 = 0;
  }
  v35[0] = @"anomaly_type";
  id v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 type]);
  v36[0] = v20;
  v35[1] = @"duration";
  long long v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 duration]);
  v36[1] = v21;
  v35[2] = @"num_events";
  long long v22 = [v6 events];
  long long v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 count]);
  v36[2] = v23;
  v35[3] = @"was_anomaly_predicted";
  long long v24 = +[NSNumber numberWithBool:v19];
  v36[3] = v24;
  __uint64_t v25 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100034CA0;
  v29[3] = &unk_1001B5EB8;
  id v30 = v25;
  id v26 = v25;
  sub_100005B9C(@"com.apple.Telephony.fedMobilityTimeSeriesPerAnomalyStats", v29);
}

- (void)removeEventsOutsideTimeWindowFromState:(id)a3 basedOnTimestamp:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[FMConfiguration sharedInstance];
  unint64_t v7 = 1000000000 * (void)[v6 FMTSWindowSizeInDatabaseSeconds];

  BOOL v8 = a4 >= v7;
  unint64_t v9 = a4 - v7;
  if (v8)
  {
    __uint64_t v10 = [v5 events];
    id v11 = [v5 events];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100034E18;
    v13[3] = &unk_1001B6708;
    v13[4] = v9;
    __uint64_t v12 = [v11 indexesOfObjectsPassingTest:v13];
    [v10 removeObjectsAtIndexes:v12];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    sub_100142288();
  }
}

- (void)maybeFetchPredictionsForState:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100142388();
  }
  __uint64_t v4 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v5 = [v3 lastPredictionsTimestamp];
  if (v5 <= [v3 eventsLastChangedTimestamp])
  {
    id v8 = [v3 lastPredictionsTimestamp];
    unint64_t v9 = +[FMConfiguration sharedInstance];
    __uint64_t v32 = v4;
    BOOL v10 = (v4 - (unint64_t)v8) / 0x3B9ACA00 < (unint64_t)[v9 FMTSPredictionMinTimeBetweenPredictionsSeconds];

    if (v10)
    {
      id v11 = *(NSObject **)(qword_1001D8080 + 136);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        __uint64_t v12 = [v3 homePLMN];
        sub_100142308(v12, (uint64_t)buf, v11);
      }
    }
    else
    {
      [(FMTimeSeriesModel *)self removeEventsOutsideTimeWindowFromState:v3 basedOnTimestamp:v32];
      uint64_t v13 = [(FMModel *)self fmCoreData];
      unint64_t v14 = [v3 homePLMN];
      objc_super v15 = [v3 events];
      id v16 = [v15 copy];
      long long v31 = [v13 getAnomalyPredictionsForHomePLMN:v14 andEvents:v16 atCurrentTimestamp:v32];

      if (v31)
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        obunint64_t j = v31;
        id v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v36;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v36 != v18) {
                objc_enumerationMutation(obj);
              }
              uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * i);
              long long v21 = *(NSObject **)(qword_1001D8080 + 136);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v41 = v20;
                _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMTimeSeriesModel]:#D Received new prediction: %@", buf, 0xCu);
              }
              for (unint64_t j = 0; ; ++j)
              {
                long long v23 = [v3 activePredictions];
                BOOL v24 = j < (unint64_t)[v23 count];

                if (!v24) {
                  break;
                }
                __uint64_t v25 = [v3 activePredictions];
                id v26 = [v25 objectAtIndexedSubscript:j];
                unsigned int v27 = [v26 isEqualToPrediction:v20];

                if (v27)
                {
                  id v28 = *(NSObject **)(qword_1001D8080 + 136);
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v41 = v20;
                    _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMTimeSeriesModel]:#D Superseeding prediction for %@", buf, 0xCu);
                  }
                  v29 = [v3 activePredictions];
                  [v29 removeObjectAtIndex:j];

                  break;
                }
              }
            }
            id v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
          }
          while (v17);
        }

        id v30 = [v3 activePredictions];
        [v30 addObjectsFromArray:obj];

        [v3 setMostRecentPredictions:obj];
        [v3 setLastPredictionsTimestamp:v32];
        [(FMTimeSeriesModel *)self removeActivePredictionsOlderThanThresholdFromState:v3 atCurrentTimestamp:v32];
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
      {
        sub_100142354();
      }
    }
  }
  else
  {
    id v6 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v7 = [v3 homePLMN];
      sub_1001422BC(v7, (uint64_t)buf, v6);
    }
  }
}

- (void)maybeFetchPredictionsForAllStates
{
  id v3 = [(FMModel *)self contextUUIDToStateMap];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000353F0;
  v4[3] = &unk_1001B6730;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)removeActivePredictionsOlderThanThresholdFromState:(id)a3 atCurrentTimestamp:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = +[FMConfiguration sharedInstance];
  unint64_t v8 = 1000000000 * (void)[v7 FMTSWindowSizeMaxTimeUntilPredictedAnomalySeconds];

  unint64_t v9 = a4 - v8;
  if (a4 >= v8)
  {
    id v10 = objc_alloc_init((Class)NSMutableArray);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = [v6 activePredictions];
    id v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v27;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_super v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ((unint64_t)[v15 predictedStartTimestamp] < v9) {
            [v10 addObject:v15];
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v12);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v10;
    id v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v23;
      do
      {
        for (unint64_t j = 0; j != v17; unint64_t j = (char *)j + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
          long long v21 = objc_msgSend(v6, "activePredictions", (void)v22);
          [v21 removeObjectIdenticalTo:v20];

          [(FMTimeSeriesModel *)self storeAndSendTelemetryForFinishedPrediction:v20];
        }
        id v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
  {
    sub_1001423BC();
  }
}

- (void)storeAndSendTelemetryForFinishedPrediction:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_1001423F0();
  }
  id v5 = [(FMModel *)self fmCoreData];
  [v5 storePrediction:v4];

  if ([v4 didAnomalyHappen])
  {
    unsigned int v25 = [v4 predictedDuration];
    unsigned int v6 = [v4 actualDuration];
    unsigned int v7 = [v4 predictedDuration];
    unsigned int v8 = [v4 actualDuration];
    unsigned int v9 = [v4 predictedDuration];
    unsigned int v10 = [v4 actualDuration];
    if ((int)(v10 + v9) < 0 != __OFADD__(v10, v9)) {
      int v11 = v10 + v9 + 1;
    }
    else {
      int v11 = v10 + v9;
    }
    unsigned int v12 = [v4 predictedTimeUntilAnomaly];
    unsigned int v13 = [v4 actualTimeUntilAnomaly];
    unsigned int v14 = [v4 predictedTimeUntilAnomaly];
    unsigned int v15 = [v4 actualTimeUntilAnomaly];
    unsigned int v16 = [v4 predictedTimeUntilAnomaly];
    unsigned int v17 = [v4 actualTimeUntilAnomaly];
    int v18 = v25 - v6;
    double v19 = fabs((double)(int)(v7 - v8)) / (double)(v11 >> 1) * 100.0;
    int v20 = v12 - v13;
    double v21 = fabs((double)(int)(v14 - v15));
    int v22 = v17 + v16;
    if ((int)(v17 + v16) < 0 != __OFADD__(v17, v16)) {
      ++v22;
    }
    double v23 = v21 / (double)(v22 >> 1) * 100.0;
  }
  else
  {
    double v19 = -1.0;
    int v18 = -1;
    int v20 = -1;
    double v23 = -1.0;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000358FC;
  v26[3] = &unk_1001B6758;
  id v24 = v4;
  id v27 = v24;
  int v30 = v18;
  int v31 = v20;
  double v28 = v19;
  double v29 = v23;
  sub_100005B9C(@"com.apple.Telephony.fedMobilityTimeSeriesPerPredictionStats", v26);
}

- (FMBasebandMetricsController)fmBasebandMetricsController
{
  return (FMBasebandMetricsController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFmBasebandMetricsController:(id)a3
{
}

- (FMCoreLocationController)fmCoreLocationController
{
  return (FMCoreLocationController *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFmCoreLocationController:(id)a3
{
}

- (BOOL)isAirplaneModeActive
{
  return self->_isAirplaneModeActive;
}

- (void)setIsAirplaneModeActive:(BOOL)a3
{
  self->_isAirplaneModeActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmCoreLocationController, 0);

  objc_storeStrong((id *)&self->_fmBasebandMetricsController, 0);
}

@end