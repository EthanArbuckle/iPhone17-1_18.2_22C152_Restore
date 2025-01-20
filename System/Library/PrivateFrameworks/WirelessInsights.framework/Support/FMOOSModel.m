@interface FMOOSModel
- (BOOL)isAirplaneModeActive;
- (BOOL)isInCrowdsourcedDisabledCountry;
- (BOOL)isLocationAuthorized;
- (FMCoreLocationController)fmCoreLocationController;
- (FMCoreRoutineController)fmCoreRoutineController;
- (FMLocation)curLocation;
- (FMLocation)curVisit;
- (FMOOSModel)initWithFMCoreData:(id)a3;
- (FMOOSModel)initWithFMCoreData:(id)a3 withQueueName:(const char *)a4;
- (NSMutableArray)prevVisits;
- (id)getCoreTelephonyRATStringFromEnum:(int)a3;
- (int)getOOSInsightRATFromString:(id)a3;
- (void)_handleAirplaneModeActiveChanged:(BOOL)a3;
- (void)_handleCellMonitorUpdate:(id)a3 info:(id)a4;
- (void)_handleLocationAuthorizationUpdate:(int)a3;
- (void)_handleLocationUpdate:(id)a3;
- (void)_handleRegistrationStatusChanged:(id)a3 registrationStatus:(id)a4;
- (void)_handleRegulatoryDomainEstimateUpdate:(id)a3;
- (void)_handleSignificantLocationsCleared;
- (void)_handleVisitEnded:(id)a3;
- (void)_handleVisitStarted:(id)a3;
- (void)_initializeStateForContext:(id)a3 atTime:(id)a4;
- (void)_updateStateForContext:(id)a3 atTime:(id)a4 withExistingState:(id)a5;
- (void)backInServiceWithSubscriptionID:(id)a3 isDataContext:(BOOL)a4 afterDuration:(double)a5 fromEntry:(id)a6 withNextCell:(id)a7 withRegistrationState:(id)a8 previousCrowdsourcedPrediction:(id)a9 withPredictionSuppressionReason:(unsigned int)a10;
- (void)dealloc;
- (void)fetchAndSendCrowdsourcedOOSInsightsPerTileForState:(id)a3 atLocation:(id)a4 withReason:(id)a5;
- (void)fetchAndSendOnDeviceLearningsForState:(id)a3 withContext:(id)a4;
- (void)sendOutOfServicePredictionEventWithClientPrediction:(id)a3 withSuppressionReason:(unsigned int)a4 didDeviceGoOutOfService:(BOOL)a5;
- (void)setCurLocation:(id)a3;
- (void)setCurVisit:(id)a3;
- (void)setFmCoreLocationController:(id)a3;
- (void)setFmCoreRoutineController:(id)a3;
- (void)setIsAirplaneModeActive:(BOOL)a3;
- (void)setIsInCrowdsourcedDisabledCountry:(BOOL)a3;
- (void)setIsLocationAuthorized:(BOOL)a3;
- (void)setPrevVisits:(id)a3;
@end

@implementation FMOOSModel

- (void)fetchAndSendOnDeviceLearningsForState:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v93 = a4;
  v92 = v6;
  v7 = [v6 oosAreaEntry];

  if (!v7)
  {
    v8 = [v6 clientPrediction];
    -[FMOOSModel sendOutOfServicePredictionEventWithClientPrediction:withSuppressionReason:didDeviceGoOutOfService:](self, "sendOutOfServicePredictionEventWithClientPrediction:withSuppressionReason:didDeviceGoOutOfService:", v8, [v6 predictionSuppressionReason], 0);

    [v6 setClientPrediction:0];
    [v6 setPredictionSuppressionReason:0];
    v91 = +[NSDate now];
    v9 = [(FMModel *)self fmCoreData];
    v10 = [(FMOOSModel *)self prevVisits];
    v11 = [v10 lastObject];
    v12 = [(FMOOSModel *)self curVisit];
    v13 = [v6 subscriptionID];
    v14 = [v92 prevCells];
    v15 = [(FMOOSModel *)self curLocation];
    v16 = +[FMOOSPredictor getOutOfServiceRecoveryPredictionWithFMCoreData:v9 prevVisit:v11 curVisit:v12 subscriptionID:v13 prevCells:v14 startTime:v91 entryLocation:v15];

    v95 = v16;
    if (v16 && ([v16 firstObject], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v90 = v17;
      v18 = [v17 cells];
      v19 = [v18 firstObject];

      if (v19)
      {
        v20 = [v19 subscriptionID];
        id v21 = [v20 unsignedIntegerValue];

        v22 = *(NSObject **)(qword_1001D8080 + 136);
        if ((unint64_t)v21 < 2)
        {
          v89 = v19;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v93;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = [v16 count];
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Received Recovery Predictions for context %@: %lu", buf, 0x16u);
          }
          for (unint64_t i = 0; ; unint64_t i = v94)
          {
            id v25 = [v95 count];
            v26 = *(NSObject **)(qword_1001D8080 + 136);
            BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
            if (i >= (unint64_t)v25) {
              break;
            }
            if (v27)
            {
              id v28 = [v95 count];
              v29 = [v95 objectAtIndexedSubscript:i];
              v30 = [v29 cells];
              id v31 = [v30 count];
              v32 = [v95 objectAtIndexedSubscript:i];
              v33 = [v32 durations];
              id v34 = [v33 count];
              *(_DWORD *)buf = 138413314;
              *(void *)&buf[4] = v93;
              *(_WORD *)&buf[12] = 2048;
              unint64_t v94 = i + 1;
              *(void *)&buf[14] = i + 1;
              __int16 v97 = 2048;
              unint64_t v98 = (unint64_t)v28;
              __int16 v99 = 2048;
              unint64_t v100 = (unint64_t)v31;
              __int16 v101 = 2048;
              id v102 = v34;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Prediction[%@][%lu/%lu] has %lu cells and %lu durations", buf, 0x34u);
            }
            else
            {
              unint64_t v94 = i + 1;
            }
            unint64_t v35 = 0;
            while (1)
            {
              v36 = [v95 objectAtIndexedSubscript:i];
              v37 = [v36 durations];
              BOOL v38 = v35 < (unint64_t)[v37 count];

              if (!v38) {
                break;
              }
              v39 = *(NSObject **)(qword_1001D8080 + 136);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                id v40 = [v95 count];
                v41 = [v95 objectAtIndexedSubscript:i];
                v42 = [v41 durations];
                id v43 = [v42 count];
                v44 = [v95 objectAtIndexedSubscript:i];
                v45 = [v44 durations];
                v46 = [v45 objectAtIndexedSubscript:v35];
                ++v35;
                *(_DWORD *)buf = 138413570;
                *(void *)&buf[4] = v93;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v94;
                __int16 v97 = 2048;
                unint64_t v98 = (unint64_t)v40;
                __int16 v99 = 2048;
                unint64_t v100 = v35;
                __int16 v101 = 2048;
                id v102 = v43;
                __int16 v103 = 2112;
                id v104 = v46;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Prediction[%@][%lu/%lu] Duration[%lu/%lu]: %@", buf, 0x3Eu);
              }
              else
              {
                ++v35;
              }
            }
            unint64_t v47 = 0;
            while (1)
            {
              v48 = [v95 objectAtIndexedSubscript:i];
              v49 = [v48 cells];
              BOOL v50 = v47 < (unint64_t)[v49 count];

              if (!v50) {
                break;
              }
              v51 = *(NSObject **)(qword_1001D8080 + 136);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                id v52 = [v95 count];
                v53 = [v95 objectAtIndexedSubscript:i];
                v54 = [v53 cells];
                id v55 = [v54 count];
                v56 = [v95 objectAtIndexedSubscript:i];
                v57 = [v56 cells];
                v58 = [v57 objectAtIndexedSubscript:v47];
                ++v47;
                *(_DWORD *)buf = 138413570;
                *(void *)&buf[4] = v93;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v94;
                __int16 v97 = 2048;
                unint64_t v98 = (unint64_t)v52;
                __int16 v99 = 2048;
                unint64_t v100 = v47;
                __int16 v101 = 2048;
                id v102 = v55;
                __int16 v103 = 2112;
                id v104 = v58;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Prediction[%@][%lu/%lu] Cell[%lu/%lu]: %@", buf, 0x3Eu);
              }
              else
              {
                ++v47;
              }
            }
          }
          if (v27)
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v93;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Passing OOS recovery predictions for context %@ to clients", buf, 0xCu);
          }
          v59 = [v90 durations];
          v60 = +[FMConfiguration sharedInstance];
          v61 = +[FMOOSPredictor getElementFromSortedArray:forPercentile:](FMOOSPredictor, "getElementFromSortedArray:forPercentile:", v59, [v60 onDeviceDurationPredictionPercentile]);

          if (v61)
          {
            [v61 doubleValue];
            double v63 = v62;
            v64 = +[FMConfiguration sharedInstance];
            unsigned int v65 = [v64 sendOOSPredictionsToBaseband];

            signed int v66 = [v90 seenCount];
            v67 = +[FMConfiguration sharedInstance];
            BOOL v68 = (uint64_t)[v67 OOSMinSeenCountForSendingPrediction] > v66;

            if (v68) {
              int v69 = v65 ^ 1 | 2;
            }
            else {
              int v69 = v65 ^ 1;
            }
            v70 = +[FMConfiguration sharedInstance];
            BOOL v71 = v63 < (double)(unint64_t)[v70 minPredictedDurationSeconds];

            if (v71) {
              int v72 = v69 | 8;
            }
            else {
              int v72 = v69;
            }
            v73 = +[FMConfiguration sharedInstance];
            [v73 sendOnDevicePredictionLikelihood];
            unsigned int v75 = +[FMUtil randomlyFalseWithLikelihood:v74];

            if (v75) {
              int v76 = v72 | 4;
            }
            else {
              int v76 = v72;
            }
            v77 = *(NSObject **)(qword_1001D8080 + 136);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v76;
              _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "FederatedMobility[FMOOSModel]:#D On-device prediction suppression reason: %u", buf, 8u);
              v77 = *(NSObject **)(qword_1001D8080 + 136);
            }
            if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
            {
              if (v76) {
                CFStringRef v78 = @"no";
              }
              else {
                CFStringRef v78 = @"yes";
              }
              v79 = [v90 durations];
              id v80 = +[FMOOSPredictor getElementFromSortedArray:v79 forPercentile:25];
              v81 = [v90 durations];
              id v82 = +[FMOOSPredictor getElementFromSortedArray:v81 forPercentile:50];
              v83 = [v90 durations];
              v84 = +[FMOOSPredictor getElementFromSortedArray:v83 forPercentile:75];
              *(_DWORD *)buf = 138413826;
              *(void *)&buf[4] = v89;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = llround(v63);
              __int16 v97 = 2048;
              unint64_t v98 = llround(v63 + 30.0);
              __int16 v99 = 2112;
              unint64_t v100 = (unint64_t)v78;
              __int16 v101 = 2112;
              id v102 = v80;
              __int16 v103 = 2112;
              id v104 = v82;
              __int16 v105 = 2112;
              v106 = v84;
              _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Final prediction: Cell %@, duration %ld, validDuration %ld, sendPrediction: %@, p25duration: %@, p50duration: %@, p75duration: %@", buf, 0x48u);
            }
            v85 = [FMOOSClientPrediction alloc];
            v86 = [v90 cells];
            v87 = -[FMOOSClientPrediction initWithPredictedCell:nextCells:oosAreaSeenCount:predictedOOSDuration:validPredictionDuration:isSent:](v85, "initWithPredictedCell:nextCells:oosAreaSeenCount:predictedOOSDuration:validPredictionDuration:isSent:", v89, v86, [v90 seenCount], v76 == 0, v63, v63 + 30.0);
            [v92 setClientPrediction:v87];

            objc_msgSend(v92, "setPredictionSuppressionReason:", objc_msgSend(v92, "predictionSuppressionReason") | v76);
            if (!v76) {
              operator new();
            }
            v88 = *(NSObject **)(qword_1001D8080 + 136);
            if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Prediction does not fulfill sending criteria, skipping", buf, 2u);
            }
          }
          else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
          {
            sub_100145D44();
          }

          v19 = v89;
        }
        else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          sub_100145848();
        }
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v90 = 0;
    }
    v23 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I No OOS recovery predictions available for new cell", buf, 2u);
    }
    v19 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100145D78();
  }
LABEL_15:
}

- (void)_handleCellMonitorUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(FMModel *)self contextUUIDToStateMap];
    v9 = [v8 objectForKey:v6];

    if (!v9)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_100145BD8();
      }
      goto LABEL_30;
    }
    id v43 = +[WISTelephonyUtils getServingCellInfoFromArray:v7];
    v10 = +[NSDate now];
    v11 = [v9 subscriptionID];
    id v44 = 0;
    v42 = +[FMCoreTelephonyController cellInfoToFMServingCell:v43 atTime:v10 inSlot:v11 error:&v44];
    id v12 = v44;

    if (v12)
    {
      v13 = *(NSObject **)(qword_1001D8080 + 136);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = [v12 localizedDescription];
        sub_100145CDC((uint64_t)v6, v14, buf, v13);
      }
      goto LABEL_29;
    }
    if (!v42)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_100145C40();
      }
      goto LABEL_29;
    }
    v15 = [v9 oosAreaEntry];
    if (v15)
    {
      v16 = [v9 registrationState];
      unsigned int v17 = +[WISTelephonyUtils isRegistrationDisplayStatusInService:v16];

      if (v17)
      {
        v18 = *(NSObject **)(qword_1001D8080 + 136);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v46 = v6;
          __int16 v47 = 2112;
          v48 = v42;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Device no longer OOS with context %@ according to registration display state and cell monitor with next cell %@", buf, 0x16u);
        }
        id v40 = [v9 subscriptionID];
        v39 = [(FMModel *)self fmCoreTelephonyController];
        unsigned int v38 = [v39 isDataContextUuid:v6];
        v41 = +[NSDate now];
        v37 = [v9 oosAreaEntry];
        v19 = [v37 timestamp];
        objc_msgSend(v41, "timeIntervalSinceDate:");
        double v21 = v20;
        v22 = [v9 oosAreaEntry];
        v23 = [v9 registrationState];
        v24 = [v9 previousCrowdsourcedOOSInsights];
        LODWORD(v36) = [v9 predictionSuppressionReason];
        [(FMOOSModel *)self backInServiceWithSubscriptionID:v40 isDataContext:v38 afterDuration:v22 fromEntry:v42 withNextCell:v23 withRegistrationState:v24 previousCrowdsourcedPrediction:v21 withPredictionSuppressionReason:v36];

        [v9 setOosAreaEntry:0];
        [v9 setPreviousCrowdsourcedOOSInsights:0];
        [v9 setPredictionSuppressionReason:0];
      }
    }
    id v25 = [v9 prevCells];
    v26 = [v25 lastObject];

    if (v26 && [v26 isEqual:v42])
    {
      BOOL v27 = [v42 timestamp];
      [v26 updateTimestampTo:v27];

      id v28 = [v9 clientPrediction];
      BOOL v29 = v28 == 0;

      if (!v29)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
          sub_100145CA8();
        }
LABEL_26:

LABEL_29:
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      v30 = [v9 prevCells];
      [v30 addObject:v42];

      id v31 = +[FMConfiguration sharedInstance];
      id v32 = [v31 OOSPrevCellsInMemory];
      v33 = [v9 prevCells];
      +[FMUtil removeFirstElementsForCapacity:v32 fromArray:v33];
    }
    id v34 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      unsigned int v35 = [(FMOOSModel *)self isLocationAuthorized];
      *(_DWORD *)buf = 138412802;
      id v46 = v6;
      __int16 v47 = 2112;
      v48 = v42;
      __int16 v49 = 1024;
      unsigned int v50 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Cell Monitor Update for context %@: %@, isLocationAuthorized: %{BOOL}d", buf, 0x1Cu);
    }
    if ([(FMOOSModel *)self isLocationAuthorized]) {
      [(FMOOSModel *)self fetchAndSendOnDeviceLearningsForState:v9 withContext:v6];
    }
    goto LABEL_26;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100145B70();
  }
LABEL_31:
}

- (BOOL)isLocationAuthorized
{
  return self->_isLocationAuthorized;
}

- (void)sendOutOfServicePredictionEventWithClientPrediction:(id)a3 withSuppressionReason:(unsigned int)a4 didDeviceGoOutOfService:(BOOL)a5
{
  __int16 v6 = a4;
  id v7 = a3;
  if (v7 && (v6 & 0xFFFB) == 0)
  {
    v8 = +[NSString stringWithUTF8String:"com.apple.Telephony.fedMobilityPredictions"];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100077C80;
    v9[3] = &unk_1001B5D58;
    BOOL v11 = a5;
    id v10 = v7;
    sub_100005B9C(v8, v9);
  }
}

- (NSMutableArray)prevVisits
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (FMLocation)curVisit
{
  return (FMLocation *)objc_getProperty(self, a2, 88, 1);
}

- (FMLocation)curLocation
{
  return (FMLocation *)objc_getProperty(self, a2, 96, 1);
}

- (FMOOSModel)initWithFMCoreData:(id)a3
{
  return [(FMOOSModel *)self initWithFMCoreData:a3 withQueueName:"com.apple.wirelessinsightsd.FederatedMobility.FMOOSModel"];
}

- (FMOOSModel)initWithFMCoreData:(id)a3 withQueueName:(const char *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMOOSModel;
  id v7 = [(FMModel *)&v19 initWithFMCoreData:v6 withQueueName:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [(FMModel *)v7 fmRegulatoryDomainController];
    id v10 = [v9 getCurrentEstimates];
    [(FMOOSModel *)v8 _handleRegulatoryDomainEstimateUpdate:v10];

    id v11 = objc_alloc_init((Class)NSMutableArray);
    [(FMOOSModel *)v8 setPrevVisits:v11];

    [(FMOOSModel *)v8 setCurVisit:0];
    [(FMOOSModel *)v8 setCurLocation:0];
    [(FMOOSModel *)v8 setIsLocationAuthorized:0];
    id v12 = [(FMModel *)v8 fmCoreTelephonyController];
    -[FMOOSModel setIsAirplaneModeActive:](v8, "setIsAirplaneModeActive:", [v12 isAirplaneModeActive]);

    v13 = [[FMCoreLocationController alloc] initWithFMModel:v8];
    [(FMOOSModel *)v8 setFmCoreLocationController:v13];

    v14 = [[FMCoreRoutineController alloc] initWithFMModel:v8];
    [(FMOOSModel *)v8 setFmCoreRoutineController:v14];

    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_1001455D8();
    }
    v15 = [(FMModel *)v8 fmCoreTelephonyController];
    v16 = [v15 getSubscriptionContextsInUse];
    [(FMModel *)v8 populateSubscriptionContextsInUse:v16];

    unsigned int v17 = v8;
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_1001455A4();
  }

  return v8;
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_10014560C();
  }
  v3.receiver = self;
  v3.super_class = (Class)FMOOSModel;
  [(FMModel *)&v3 dealloc];
}

- (void)_initializeStateForContext:(id)a3 atTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v6 uuid];
    sub_1001456B4(v9, v18, v8);
  }
  id v10 = [(FMModel *)self fmCoreTelephonyController];
  id v11 = [v6 uuid];
  id v12 = [v10 getRegistrationStatus:v11];

  v13 = [FMOOSContextState alloc];
  v14 = [v6 subscriptionID];
  v15 = [(FMOOSContextState *)v13 initWithStartTime:v7 subscriptionID:v14 registrationState:v12];

  if (v15)
  {
    v16 = [(FMModel *)self contextUUIDToStateMap];
    unsigned int v17 = [v6 uuid];
    [v16 setObject:v15 forKey:v17];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR))
  {
    sub_100145640();
  }
}

- (void)_updateStateForContext:(id)a3 atTime:(id)a4 withExistingState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v8 uuid];
    sub_10014570C(v12, v16, v11);
  }
  v13 = [v10 subscriptionID];
  v14 = [v8 subscriptionID];
  unsigned __int8 v15 = [v13 isEqualToNumber:v14];

  if ((v15 & 1) == 0) {
    [(FMOOSModel *)self _initializeStateForContext:v8 atTime:v9];
  }
}

- (void)_handleAirplaneModeActiveChanged:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100145764(v3, v5);
  }
  [(FMOOSModel *)self setIsAirplaneModeActive:v3];
  id v6 = [(FMModel *)self contextUUIDToStateMap];
  [v6 enumerateKeysAndObjectsUsingBlock:&stru_1001B86C8];
}

- (void)fetchAndSendCrowdsourcedOOSInsightsPerTileForState:(id)a3 atLocation:(id)a4 withReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[FMConfiguration sharedInstance];
  unsigned int v12 = [v11 disableCrowdsourcedLearnings];

  if (v12)
  {
    v13 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Crowdsourced OOS learnings: Crowdsourced learnings disabled as per config, aborting", buf, 2u);
    }
    unsigned int v12 = 0x10000;
  }
  unsigned int v14 = [(FMOOSModel *)self isInCrowdsourcedDisabledCountry];
  uint64_t v15 = qword_1001D8080;
  if (v14)
  {
    v16 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Crowdsourced OOS learnings: Crowdsourced learnings disabled in the current country, aborting", buf, 2u);
      uint64_t v15 = qword_1001D8080;
    }
    v12 |= 0x40000u;
  }
  unsigned int v17 = *(NSObject **)(v15 + 136);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v39) = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Crowdsourced OOS learnings: Suppression reason %u", buf, 8u);
  }
  objc_msgSend(v8, "setPredictionSuppressionReason:", objc_msgSend(v8, "predictionSuppressionReason") | v12);
  if (([v8 predictionSuppressionReason] & 0xFFFD0000) != 0)
  {
    v18 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      objc_super v19 = "FederatedMobility[FMOOSModel]:#I Crowdsourced OOS learnings: Not sending crowdsourced learning because they "
            "are being suppressed for this OOS";
LABEL_14:
      double v20 = v18;
      uint32_t v21 = 2;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
    }
  }
  else
  {
    if (!v9)
    {
      v18 = *(NSObject **)(qword_1001D8080 + 136);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      objc_super v19 = "FederatedMobility[FMOOSModel]:#I Crowdsourced OOS learnings: Cannot fetch Crowdsourced predictions without l"
            "ocation information, aborting";
      goto LABEL_14;
    }
    [v9 accuracy];
    double v23 = v22;
    v24 = +[FMConfiguration sharedInstance];
    BOOL v25 = v23 < (double)(unint64_t)[v24 LocationHorizontalAccuracyThreshold];

    v26 = *(NSObject **)(qword_1001D8080 + 136);
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
    if (!v25)
    {
      if (!v27) {
        goto LABEL_25;
      }
      [v9 accuracy];
      *(_DWORD *)buf = 134217984;
      uint64_t v39 = v33;
      objc_super v19 = "FederatedMobility[FMOOSModel]:#I Not sending Crowdsourced prediction: horizontal accuracy %f is more than threshold";
      double v20 = v26;
      uint32_t v21 = 12;
      goto LABEL_15;
    }
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Crowdsourced OOS learnings: Inside fetchAndSendCrowdsourcedOOSInsightsPerTile", buf, 2u);
    }
    [v9 latitude];
    double v29 = v28;
    [v9 longitude];
    double v31 = v30;
    id v32 = [(FMModel *)self _queue];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100073A3C;
    v34[3] = &unk_1001B86F0;
    id v35 = v8;
    id v36 = v9;
    id v37 = v10;
    +[FMGEOServicesHandler getCellularCoverageTileConfigurationAtLatitude:v32 longitude:v37 queue:v34 reason:v29 responseBlock:v31];
  }
LABEL_25:
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
    if (!v9)
    {
      if (v10) {
        sub_100145918();
      }
      goto LABEL_52;
    }
    if (v10) {
      sub_100145AEC();
    }
    id v11 = [v9 registrationState];
    [v9 setRegistrationState:v7];
    if ([(FMOOSModel *)self isAirplaneModeActive])
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_100145980();
      }
      goto LABEL_51;
    }
    if (+[WISTelephonyUtils isRegistrationDisplayStatusInService:](WISTelephonyUtils, "isRegistrationDisplayStatusInService:", v11)&& +[WISTelephonyUtils isRegistrationDisplayStatusOutOfService:v7])
    {
      v13 = *(NSObject **)(qword_1001D8080 + 136);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v73 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Device went OOS with context %@", buf, 0xCu);
      }
      unsigned int v14 = [v9 oosAreaEntry];
      BOOL v15 = v14 == 0;

      if (v15)
      {
        BOOL v71 = [(FMOOSModel *)self curLocation];
        double v28 = [v9 clientPrediction];
        if (v28
          && ([v9 clientPrediction],
              double v29 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v30 = [v29 isSent],
              v29,
              v28,
              (v30 & 1) != 0))
        {
          int v58 = 1;
        }
        else
        {
          double v31 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I On-device prediction not sent, sending Crowdsourced OOS learnings", buf, 2u);
          }
          [(FMOOSModel *)self fetchAndSendCrowdsourcedOOSInsightsPerTileForState:v9 atLocation:v71 withReason:@"OutOfService"];
          int v58 = 0;
        }
        double v62 = [v9 prevCells];
        v61 = [v9 prevCells];
        id v66 = [v61 count];
        v60 = +[FMConfiguration sharedInstance];
        id v63 = [v60 OOSPrevCellsInDatabase];
        if (v66 <= v63)
        {
          int64_t v68 = 0;
        }
        else
        {
          v57 = [v9 prevCells];
          id v32 = [v57 count];
          v56 = +[FMConfiguration sharedInstance];
          int64_t v68 = v32 - (unsigned char *)[v56 OOSPrevCellsInDatabase];
        }
        v59 = [v9 prevCells];
        id v33 = [v59 count];
        id v34 = +[FMConfiguration sharedInstance];
        if (v33 >= [v34 OOSPrevCellsInDatabase])
        {
          id v35 = +[FMConfiguration sharedInstance];
          id v36 = [v35 OOSPrevCellsInDatabase];
        }
        else
        {
          id v35 = [v9 prevCells];
          id v36 = [v35 count];
        }
        int v69 = objc_msgSend(v62, "subarrayWithRange:", v68, v36);

        if (v66 > v63)
        {
        }
        id v37 = [(FMOOSModel *)self prevVisits];
        unsigned int v38 = [v37 lastObject];

        uint64_t v39 = [(FMOOSModel *)self curVisit];
        id v40 = +[NSDate now];
        v41 = *(NSObject **)(qword_1001D8080 + 136);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          [v40 timeIntervalSince1970];
          *(_DWORD *)buf = 134218754;
          id v73 = v42;
          __int16 v74 = 1024;
          *(_DWORD *)unsigned int v75 = v58;
          *(_WORD *)&v75[4] = 1024;
          *(_DWORD *)&v75[6] = v58 ^ 1;
          __int16 v76 = 2112;
          v77 = v69;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Device went OOS at time %f. On-device prediction sent %{BOOL}d => Crowdsourced predictions required %{BOOL}d. Last cells before %@", buf, 0x22u);
        }
        double v43 = sub_10009F310();
        id v44 = [FMOOSAreaEntry alloc];
        v45 = [v9 clientPrediction];
        id v46 = [(FMOOSAreaEntry *)v44 init:v40 prevVisit:v38 curVisit:v39 entryLocation:v71 prevCells:v69 registrationState:v11 batteryLevel:v43 clientPrediction:v45];
        [v9 setOosAreaEntry:v46];

        __int16 v47 = [v9 clientPrediction];
        -[FMOOSModel sendOutOfServicePredictionEventWithClientPrediction:withSuppressionReason:didDeviceGoOutOfService:](self, "sendOutOfServicePredictionEventWithClientPrediction:withSuppressionReason:didDeviceGoOutOfService:", v47, [v9 predictionSuppressionReason], 1);

        [v9 setClientPrediction:0];
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
      {
        sub_1001459B4();
      }
      goto LABEL_51;
    }
    if (!+[WISTelephonyUtils isRegistrationDisplayStatusOutOfService:](WISTelephonyUtils, "isRegistrationDisplayStatusOutOfService:", v11)|| !+[WISTelephonyUtils isRegistrationDisplayStatusInService:v7])
    {
LABEL_51:

LABEL_52:
      goto LABEL_53;
    }
    v16 = [v9 oosAreaEntry];
    BOOL v17 = v16 == 0;

    v18 = *(NSObject **)(qword_1001D8080 + 136);
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100145A1C();
      }
      [v9 setPreviousCrowdsourcedOOSInsights:0];
      [v9 setPredictionSuppressionReason:0];
      goto LABEL_51;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v73 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Device no longer OOS with context %@ according to registration display state", buf, 0xCu);
    }
    v70 = +[NSDate now];
    objc_super v19 = [v9 oosAreaEntry];
    double v20 = [v19 timestamp];
    [v70 timeIntervalSinceDate:v20];
    double v22 = v21;

    double v23 = +[FMConfiguration sharedInstance];
    unsigned int v65 = objc_msgSend(v70, "dateByAddingTimeInterval:", (double)-(uint64_t)objc_msgSend(v23, "OOSMaxSecondsSinceCellSeenBeforeInService"));

    v24 = [v9 prevCells];
    v67 = [v24 lastObject];

    if (v67)
    {
      BOOL v25 = [v9 oosAreaEntry];
      v26 = [v25 timestamp];
      BOOL v27 = [v67 timestamp];
      if ([v26 compare:v27] == (id)-1)
      {
        v48 = [v67 timestamp];
        BOOL v64 = [v65 compare:v48] == (id)-1;

        if (v64)
        {
          __int16 v49 = *(NSObject **)(qword_1001D8080 + 136);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v73 = v6;
            __int16 v74 = 2112;
            *(void *)unsigned int v75 = v67;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Device back in service with context %@ and next cell %@", buf, 0x16u);
          }
          unsigned int v50 = [v9 subscriptionID];
          v51 = [(FMModel *)self fmCoreTelephonyController];
          id v52 = [v51 isDataContextUuid:v6];
          v53 = [v9 oosAreaEntry];
          v54 = [v9 previousCrowdsourcedOOSInsights];
          LODWORD(v55) = [v9 predictionSuppressionReason];
          [(FMOOSModel *)self backInServiceWithSubscriptionID:v50 isDataContext:v52 afterDuration:v53 fromEntry:v67 withNextCell:v7 withRegistrationState:v54 previousCrowdsourcedPrediction:v22 withPredictionSuppressionReason:v55];

          [v9 setOosAreaEntry:0];
          [v9 setPreviousCrowdsourcedOOSInsights:0];
          [v9 setPredictionSuppressionReason:0];
          goto LABEL_50;
        }
      }
      else
      {
      }
    }
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100145A84();
    }
LABEL_50:

    goto LABEL_51;
  }
  unsigned int v12 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v73 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Received nil display status change for context %@", buf, 0xCu);
  }
LABEL_53:
}

- (int)getOOSInsightRATFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kCTCellMonitorRadioAccessTechnologyGSM])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:kCTCellMonitorRadioAccessTechnologyUTRAN])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:kCTCellMonitorRadioAccessTechnologyCDMA1x])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:kCTCellMonitorRadioAccessTechnologyCDMAEVDO])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:kCTCellMonitorRadioAccessTechnologyCDMAHybrid])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:kCTCellMonitorRadioAccessTechnologyLTE])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:kCTCellMonitorRadioAccessTechnologyUTRAN2])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:kCTCellMonitorRadioAccessTechnologyNR])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_handleLocationAuthorizationUpdate:(int)a3
{
  [(FMOOSModel *)self setIsLocationAuthorized:(a3 - 3) < 2];
  v5 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 67109120;
    int v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I _handleLocationAuthorizationUpdate locationAuthorizationStatus: %d", (uint8_t *)&v7, 8u);
    v5 = *(NSObject **)(qword_1001D8080 + 136);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int v6 = [(FMOOSModel *)self isLocationAuthorized];
    int v7 = 67109120;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I _handleLocationAuthorizationUpdate isLocationAuthorized: %d", (uint8_t *)&v7, 8u);
  }
}

- (void)_handleLocationUpdate:(id)a3
{
  id v4 = a3;
  [(FMOOSModel *)self setCurLocation:v4];
  if (![(FMOOSModel *)self isAirplaneModeActive])
  {
    v5 = [(FMModel *)self contextUUIDToStateMap];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100075944;
    v6[3] = &unk_1001B8718;
    id v7 = v4;
    int v8 = self;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

- (void)_handleVisitStarted:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100145E14();
  }
  [(FMOOSModel *)self setCurVisit:v4];
  if ([(FMOOSModel *)self isLocationAuthorized])
  {
    v5 = [(FMModel *)self fmCoreData];
    [v5 updateOutOfServiceAreasWithNextVisit:v4];
  }
}

- (void)_handleVisitEnded:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100145E48();
  }
  [(FMOOSModel *)self setCurVisit:0];
  v5 = [(FMOOSModel *)self prevVisits];
  [v5 addObject:v4];

  unsigned int v6 = +[FMConfiguration sharedInstance];
  id v7 = [v6 OOSPrevCellsInMemory];
  int v8 = [(FMOOSModel *)self prevVisits];
  +[FMUtil removeFirstElementsForCapacity:v7 fromArray:v8];
}

- (void)_handleSignificantLocationsCleared
{
  id v3 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Received notification from CoreRoutine that significant locations have been deleted, resetting database", v5, 2u);
  }
  id v4 = [(FMModel *)self fmCoreData];
  [v4 clearDatabase];
}

- (void)_handleRegulatoryDomainEstimateUpdate:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = +[FMConfiguration sharedInstance];
    unsigned int v6 = [v5 crowdsourcedDisabledCountries];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100076254;
    v11[3] = &unk_1001B5C98;
    id v7 = v6;
    id v12 = v7;
    id v8 = [v4 indexOfObjectPassingTest:v11];
    id v9 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v14 = v8 != (id)0x7FFFFFFFFFFFFFFFLL;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Crowdsourced learnings disabled in current country: %{BOOL}d", buf, 8u);
    }
    [(FMOOSModel *)self setIsInCrowdsourcedDisabledCountry:v8 != (id)0x7FFFFFFFFFFFFFFFLL];
  }
  else
  {
    BOOL v10 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I No regulatory domain estimates available", buf, 2u);
    }
    [(FMOOSModel *)self setIsInCrowdsourcedDisabledCountry:1];
  }
}

- (id)getCoreTelephonyRATStringFromEnum:(int)a3
{
  if (a3 <= 8) {
    self = (FMOOSModel *)*(id *)*(&off_1001B8760 + a3);
  }
  return self;
}

- (void)backInServiceWithSubscriptionID:(id)a3 isDataContext:(BOOL)a4 afterDuration:(double)a5 fromEntry:(id)a6 withNextCell:(id)a7 withRegistrationState:(id)a8 previousCrowdsourcedPrediction:(id)a9 withPredictionSuppressionReason:(unsigned int)a10
{
  BOOL v15 = a4;
  id v141 = a3;
  id v16 = a6;
  id v147 = a7;
  id v137 = a8;
  id v146 = a9;
  BOOL v17 = +[FMConfiguration sharedInstance];
  double v18 = (double)(unint64_t)[v17 OOSMinOOSAreaDurationSeconds];

  if (v18 <= a5)
  {
    double v27 = sub_10009F310();
    double v28 = [v16 prevCells];
    uint64_t v29 = [v28 lastObject];

    v131 = (void *)v29;
    if (!v29)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
        sub_100145EEC();
      }
      goto LABEL_123;
    }
    unsigned __int8 v30 = [v16 clientPrediction];
    BOOL v32 = (a10 & 0xFFFB) == 0 && v30 != 0;
    BOOL v148 = v32;

    BOOL v34 = (a10 & 0xFFFD0000) == 0 && v146 != 0;
    BOOL v133 = v34;
    id v35 = [v16 clientPrediction];
    if (v35)
    {
      id v36 = [v16 clientPrediction];
      unsigned int v37 = [v36 isSent];
    }
    else
    {
      unsigned int v37 = 0;
    }

    if (v146) {
      unsigned int v38 = [v146 isSent];
    }
    else {
      unsigned int v38 = 0;
    }
    if (v148)
    {
      uint64_t v39 = [v16 clientPrediction];
      id v136 = [v39 predictedRecoveryCell];

      id v40 = [v16 clientPrediction];
      [v40 predictedOOSDuration];
      double v42 = v41;

      double v43 = vabdd_f64(v42, a5) / ((v42 + a5) * 0.5) * 100.0;
    }
    else
    {
      id v136 = 0;
      double v43 = -1.0;
      double v42 = 0.0;
    }
    id v44 = [v147 mcc];
    v45 = [v147 mnc];
    v128 = +[WISTelephonyUtils getPLMNFromMCC:v44 AndMNC:v45];

    id v46 = [v147 radioAccessTechnology];
    v127 = +[WISTelephonyUtils getRATFromCellMonitorString:v46];

    v129 = [v147 arfcnOrUarfcn];
    v130 = [v147 bandInfo];
    unsigned int v118 = v37;
    unsigned int v111 = v38;
    if ((!v148 | v38))
    {
      if (!v133)
      {
        uint64_t v57 = 0;
        v143 = 0;
        v144 = 0;
        v126 = 0;
        v134 = 0;
        v139 = 0;
        v140 = 0;
        v142 = 0;
        v145 = 0;
        uint64_t v58 = 0;
        int v121 = 1;
        BOOL v124 = 1;
        int v122 = 1;
        BOOL v125 = 1;
        BOOL v123 = 1;
LABEL_45:
        if (v136)
        {
          uint64_t v59 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v136 isEqual:v131]);
        }
        else
        {
          uint64_t v59 = 0;
        }
        v182[0] = v130;
        v155[0] = @"bandAfter";
        v155[1] = @"bandPredicted";
        uint64_t v60 = (uint64_t)v139;
        v115 = (void *)v59;
        v116 = (void *)v57;
        v132 = (void *)v58;
        if (v125)
        {
          uint64_t v60 = +[NSNull null];
        }
        v95 = (void *)v60;
        v182[1] = v60;
        v155[2] = @"bandMatched";
        uint64_t v61 = (uint64_t)v144;
        if (!v144)
        {
          uint64_t v61 = +[NSNull null];
        }
        v92 = (void *)v61;
        v182[2] = v61;
        v155[3] = @"batteryCapacityChange";
        [v16 batteryLevel];
        v109 = +[NSNumber numberWithLongLong:llround(v27 - v62)];
        v182[3] = v109;
        v155[4] = @"dataContext";
        v108 = +[NSNumber numberWithBool:v15];
        v182[4] = v108;
        v155[5] = @"duration";
        v107 = +[NSNumber numberWithLongLong:llround(a5)];
        v182[5] = v107;
        v155[6] = @"durationPredicted";
        if (v148)
        {
          v106 = +[NSNumber numberWithLongLong:llround(v42)];
          v183 = v106;
          CFStringRef v156 = @"durationPredictionError";
          __int16 v105 = +[NSNumber numberWithLongLong:llround(v42 - a5)];
          v184 = v105;
          CFStringRef v157 = @"durationPredictionErrorPercent";
          +[NSNumber numberWithDouble:v43];
        }
        else
        {
          v106 = +[NSNull null];
          v183 = v106;
          CFStringRef v156 = @"durationPredictionError";
          __int16 v105 = +[NSNull null];
          v184 = v105;
          CFStringRef v157 = @"durationPredictionErrorPercent";
          +[NSNull null];
        v120 = };
        v185 = v120;
        v186 = v129;
        CFStringRef v158 = @"frequencyAfter";
        CFStringRef v159 = @"frequencyPredicted";
        uint64_t v63 = (uint64_t)v140;
        if (v124)
        {
          uint64_t v63 = +[NSNull null];
        }
        unint64_t v94 = (void *)v63;
        uint64_t v187 = v63;
        CFStringRef v160 = @"frequencyMatched";
        uint64_t v64 = (uint64_t)v145;
        if (!v145)
        {
          uint64_t v64 = +[NSNull null];
        }
        v91 = (void *)v64;
        uint64_t v188 = v64;
        CFStringRef v161 = @"geoInputAccuracyEnteringOOS";
        v114 = [v16 entryLocation];
        if (v114)
        {
          v110 = [v16 entryLocation];
          [v110 accuracy];
          uint64_t v65 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        }
        else
        {
          uint64_t v65 = +[NSNull null];
          v110 = (void *)v65;
        }
        __int16 v97 = (void *)v65;
        uint64_t v189 = v65;
        CFStringRef v162 = @"geoInputAgeEnteringOOS";
        v117 = [v16 entryLocation];
        if (v117)
        {
          v113 = [v16 timestamp];
          v88 = [v16 entryLocation];
          v89 = [v88 timestamp];
          objc_msgSend(v113, "timeIntervalSinceDate:");
          uint64_t v66 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        }
        else
        {
          uint64_t v66 = +[NSNull null];
          v113 = (void *)v66;
        }
        uint64_t v190 = v66;
        CFStringRef v163 = @"insightAvailable";
        v96 = (void *)v66;
        id v104 = +[NSNumber numberWithBool:v133 | v148];
        v191 = v104;
        CFStringRef v164 = @"insightSent";
        __int16 v103 = +[NSNumber numberWithBool:v118 | v111];
        v192 = v103;
        CFStringRef v165 = @"knownOOSArea";
        id v102 = [v16 clientPrediction];
        __int16 v101 = +[NSNumber numberWithBool:v102 != 0];
        v193 = v101;
        CFStringRef v166 = @"learningType";
        if (v122)
        {
          v126 = +[NSNull null];
        }
        v194 = v126;
        CFStringRef v167 = @"learntOOSArea";
        unint64_t v100 = +[NSNumber numberWithBool:v148];
        v195 = v100;
        CFStringRef v168 = @"outOfServiceRate";
        if (v133)
        {
          __int16 v99 = [v146 lastOosRate];
          v196 = v99;
          CFStringRef v169 = @"minOutOfServiceRate";
          unint64_t v98 = [v146 minOosRate];
          v197 = v98;
          CFStringRef v170 = @"maxOutOfServiceRate";
          [v146 maxOosRate];
        }
        else
        {
          __int16 v99 = +[NSNull null];
          v196 = v99;
          CFStringRef v169 = @"minOutOfServiceRate";
          unint64_t v98 = +[NSNull null];
          v197 = v98;
          CFStringRef v170 = @"maxOutOfServiceRate";
          +[NSNull null];
        v119 = };
        v198 = v119;
        v199 = v128;
        CFStringRef v171 = @"plmnAfter";
        CFStringRef v172 = @"plmnPredicted";
        uint64_t v67 = (uint64_t)v134;
        if (v123)
        {
          uint64_t v67 = +[NSNull null];
        }
        id v93 = (void *)v67;
        uint64_t v200 = v67;
        CFStringRef v173 = @"plmnMatched";
        uint64_t v68 = v57;
        if (!v57)
        {
          uint64_t v68 = +[NSNull null];
        }
        v90 = (void *)v68;
        uint64_t v201 = v68;
        CFStringRef v174 = @"predictionSuppressionReason";
        int v69 = +[NSNumber numberWithUnsignedInt:a10];
        v202 = v69;
        v203 = v127;
        CFStringRef v175 = @"ratAfter";
        CFStringRef v176 = @"ratAfterKnown";
        v70 = v143;
        if (!v143)
        {
          v70 = +[NSNull null];
        }
        v204 = v70;
        CFStringRef v177 = @"ratPredicted";
        BOOL v71 = v142;
        if (v121)
        {
          BOOL v71 = +[NSNull null];
        }
        v205 = v71;
        CFStringRef v178 = @"ratMatched";
        int v72 = v132;
        if (!v132)
        {
          int v72 = +[NSNull null];
        }
        v206 = v72;
        CFStringRef v179 = @"validDuration";
        if (v148)
        {
          id v73 = [v16 clientPrediction];
          [v73 validPredictionDuration];
          __int16 v74 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        }
        else
        {
          __int16 v74 = +[NSNull null];
          id v73 = v74;
        }
        v207 = v74;
        CFStringRef v180 = @"sameCellBeforeAndPredicted";
        unsigned int v75 = (void *)v59;
        if (!v59)
        {
          unsigned int v75 = +[NSNull null];
        }
        v208 = v75;
        CFStringRef v181 = @"seenCount";
        if (v148)
        {
          __int16 v76 = [v16 clientPrediction];
          v77 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v76 oosAreaSeenCount]);
        }
        else
        {
          v77 = +[NSNull null];
          __int16 v76 = v77;
        }
        v209 = v77;
        v112 = +[NSDictionary dictionaryWithObjects:v182 forKeys:v155 count:33];
        if (v148) {

        }
        if (!v115) {
        if (v148)
        }

        if (!v132) {
        if (v121)
        }

        if (!v143) {
        if (!v116)
        }

        if (v123) {
        if (v122)
        }

        if (v117)
        {
        }
        if (v114) {

        }
        if (!v145) {
        if (v124)
        }

        if (!v144) {
        if (v125)
        }

        CFStringRef v78 = *(NSObject **)(qword_1001D8080 + 136);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v154 = v112;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "FederatedMobility[FMOOSModel]:#I Sending CA event with payload: %@", buf, 0xCu);
        }
        v79 = +[NSString stringWithUTF8String:"com.apple.Telephony.fedMobilityOutOfServiceRecoveryPredictions"];
        v149[0] = _NSConcreteStackBlock;
        v149[1] = 3221225472;
        v149[2] = sub_100077C78;
        v149[3] = &unk_1001B5EB8;
        id v80 = v112;
        id v150 = v80;
        sub_100005B9C(v79, v149);

        if ([(FMOOSModel *)self isLocationAuthorized])
        {
          v81 = [(FMModel *)self fmCoreData];
          id v82 = [v16 timestamp];
          v83 = [v16 prevVisit];
          v84 = [v16 curVisit];
          v85 = [v16 prevCells];
          v86 = [v16 entryLocation];
          v87 = [(FMOOSModel *)self curLocation];
          [v81 leftOutOfServiceArea:v82 startTime:v83 prevVisit:v84 curVisit:v141 subscriptionID:v85 prevCells:v147 nextCell:a5 entryLocation:v86 exitLocation:v87];
        }
LABEL_123:

        goto LABEL_124;
      }
      __int16 v47 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v146 mcc]);
      v48 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v146 mnc]);
      v134 = +[WISTelephonyUtils getPLMNFromMCC:v47 AndMNC:v48];

      uint64_t v138 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v146 band]);
      v140 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v146 arfcn]);
      __int16 v49 = -[FMOOSModel getCoreTelephonyRATStringFromEnum:](self, "getCoreTelephonyRATStringFromEnum:", [v146 rat]);
      v142 = +[WISTelephonyUtils getRATFromCellMonitorString:v49];

      v143 = 0;
      v126 = @"crowdsourced";
      uint64_t v50 = v138;
    }
    else
    {
      v51 = [v136 mcc];
      id v52 = [v136 mnc];
      v134 = +[WISTelephonyUtils getPLMNFromMCC:v51 AndMNC:v52];

      uint64_t v50 = [v136 bandInfo];
      uint64_t v53 = [v136 arfcnOrUarfcn];
      v54 = [v136 radioAccessTechnology];
      v142 = +[WISTelephonyUtils getRATFromCellMonitorString:v54];

      uint64_t v55 = [v16 clientPrediction];
      v56 = [v55 nextCells];
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472;
      v151[2] = sub_100077BF8;
      v151[3] = &unk_1001B8740;
      id v152 = v147;
      v143 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v56 indexOfObjectPassingTest:v151] != (id)0x7FFFFFFFFFFFFFFFLL);

      v126 = @"on-device";
      v140 = (void *)v53;
    }
    BOOL v125 = v50 == 0;
    v139 = (void *)v50;
    if (v50)
    {
      v144 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v130 isEqualToNumber:v50]);
    }
    else
    {
      v144 = 0;
    }
    BOOL v124 = v140 == 0;
    if (v140)
    {
      v145 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v129, "isEqualToNumber:"));
    }
    else
    {
      v145 = 0;
    }
    BOOL v123 = v134 == 0;
    if (v134)
    {
      uint64_t v57 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v128, "isEqualToString:"));
    }
    else
    {
      uint64_t v57 = 0;
    }
    if (v142)
    {
      +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v127, "isEqualToString:"));
      int v121 = 0;
      uint64_t v58 = v122 = 0;
    }
    else
    {
      int v122 = 0;
      v142 = 0;
      uint64_t v58 = 0;
      int v121 = 1;
    }
    goto LABEL_45;
  }
  objc_super v19 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100145E7C(v19, v20, v21, v22, v23, v24, v25, v26);
  }
LABEL_124:
}

- (FMCoreLocationController)fmCoreLocationController
{
  return (FMCoreLocationController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFmCoreLocationController:(id)a3
{
}

- (FMCoreRoutineController)fmCoreRoutineController
{
  return (FMCoreRoutineController *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFmCoreRoutineController:(id)a3
{
}

- (void)setPrevVisits:(id)a3
{
}

- (void)setIsLocationAuthorized:(BOOL)a3
{
  self->_isLocationAuthorized = a3;
}

- (void)setCurVisit:(id)a3
{
}

- (void)setCurLocation:(id)a3
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

- (BOOL)isInCrowdsourcedDisabledCountry
{
  return self->_isInCrowdsourcedDisabledCountry;
}

- (void)setIsInCrowdsourcedDisabledCountry:(BOOL)a3
{
  self->_isInCrowdsourcedDisabledCountry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curLocation, 0);
  objc_storeStrong((id *)&self->_curVisit, 0);
  objc_storeStrong((id *)&self->_prevVisits, 0);
  objc_storeStrong((id *)&self->_fmCoreRoutineController, 0);

  objc_storeStrong((id *)&self->_fmCoreLocationController, 0);
}

@end