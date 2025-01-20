@interface WISOOSRecoveryMetric
+ (id)getSharedInstance;
- (BOOL)insertOrMoveObject:(id)a3 InMutableOrderedSet:(id)a4 WithSizeLimit:(unint64_t)a5;
- (BOOL)isAirplaneModeActive;
- (BOOL)isContextMapInitialized;
- (NSMutableDictionary)contextUUIDToStateMap;
- (TelephonyStateRelay)ctRelay;
- (WISOOSRecoveryMetric)init;
- (dispatch_queue_s)queue;
- (id)extractCellInfo:(id)a3 error:(id *)a4;
- (id)findContextsToDelete:(id)a3;
- (void)airplaneModeStatusChanged:(BOOL)a3;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)currentDataSimChanged:(id)a3;
- (void)handleCompletedOutOfServiceEventWithState:(id)a3 atTime:(unint64_t)a4;
- (void)handleUpdate:(id)a3 forKey:(int)a4 withState:(id)a5;
- (void)initializeStateForContext:(id)a3 isDataContext:(BOOL)a4;
- (void)populateSubscriptionContextsInUse;
- (void)registrationStatusChanged:(id)a3 status:(id)a4;
- (void)setContextUUIDToStateMap:(id)a3;
- (void)setCtRelay:(id)a3;
- (void)setIsAirplaneModeActive:(BOOL)a3;
- (void)setIsContextMapInitialized:(BOOL)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation WISOOSRecoveryMetric

- (void)handleUpdate:(id)a3 forKey:(int)a4 withState:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  v9 = v8;
  switch(a4)
  {
    case 0:
      [(WISOOSRecoveryMetric *)self cellMonitorUpdate:v10 info:v8];
      break;
    case 3:
      [(WISOOSRecoveryMetric *)self currentDataSimChanged:v10];
      break;
    case 6:
      [(WISOOSRecoveryMetric *)self subscriptionInfoDidChange];
      break;
    case 7:
      -[WISOOSRecoveryMetric airplaneModeStatusChanged:](self, "airplaneModeStatusChanged:", [v8 BOOLValue]);
      break;
    case 8:
      [(WISOOSRecoveryMetric *)self registrationStatusChanged:v10 status:v8];
      break;
    default:
      break;
  }
}

- (id)extractCellInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[WISTelephonyUtils getServingCellInfo:v5];
  v7 = +[WISTelephonyUtils getBandFromCellInfo:v6 error:a4];
  id v8 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorCellRadioAccessTechnology expectedClass:objc_opt_class() error:a4];
  if (v8)
  {
    v9 = +[WISTelephonyUtils getRATFromCellMonitorString:v8];
  }
  else
  {
    v9 = 0;
  }
  if (+[WISTelephonyUtils isLteRat:v8])
  {
    id v25 = 0;
    id v10 = +[WISTelephonyUtils extractCellInfoValue:v6 key:kCTCellMonitorDeploymentType expectedClass:objc_opt_class() error:&v25];
    id v11 = v25;
    if (!v11 && v10)
    {
      if (([v10 isEqualToNumber:&off_1001C3A90] & 1) != 0
        || ([v10 isEqualToNumber:&off_1001C3AA8] & 1) != 0)
      {
        id v11 = 0;
      }
      else
      {
        uint64_t v23 = +[NSString stringWithUTF8String:"NR_NSA"];

        v12 = +[WISTelephonyUtils getMAVNRNSANeighborCellInfo:v5];
        id v24 = 0;
        v13 = +[WISTelephonyUtils getBandFromCellInfo:v12 error:&v24];
        id v11 = v24;
        if (!v11 && v13)
        {
          id v22 = v13;

          v7 = v22;
        }

        v9 = (void *)v23;
      }
    }
  }
  v14 = +[WISTelephonyUtils getLacOrTacFromCellInfo:error:](WISTelephonyUtils, "getLacOrTacFromCellInfo:error:", v6, a4, v22);
  uint64_t v15 = +[WISTelephonyUtils getGciFromCellInfo:v6 error:a4];
  v16 = (void *)v15;
  id v17 = *a4;
  if (!*a4 && v9 && v7 && v14 && v15)
  {
    v18 = [[OOSRecoveryMetricCellInfo alloc] initWithTimestamp:clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) rat:v9 tacOrLac:v14 gci:v15 band:v7];
  }
  else
  {
    v19 = *(NSObject **)(qword_1001D8080 + 48);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = [v17 localizedDescription];
      *(_DWORD *)buf = 138413570;
      v27 = v21;
      __int16 v28 = 2048;
      v29 = v6;
      __int16 v30 = 2048;
      v31 = v9;
      __int16 v32 = 2048;
      v33 = v7;
      __int16 v34 = 2048;
      v35 = v14;
      __int16 v36 = 2048;
      v37 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "OOSRecoveryMetric:#D Cell info extraction failed. Error %@, servingCellInfo %p, rat %p, band %p, tacOrLac %p, gci %p", buf, 0x3Eu);
    }
    v18 = 0;
  }

  return v18;
}

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = +[WISTelephonyUtils isValidContext:v6];
  if (v7) {
    unsigned __int8 v9 = v8;
  }
  else {
    unsigned __int8 v9 = 0;
  }
  if (v9)
  {
    id v10 = [(WISOOSRecoveryMetric *)self contextUUIDToStateMap];
    id v11 = [v6 uuid];
    v12 = [v10 objectForKey:v11];

    if (v12)
    {
      id v18 = 0;
      v13 = [(WISOOSRecoveryMetric *)self extractCellInfo:v7 error:&v18];
      id v14 = v18;
      if (v14 || !v13)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
        {
          [v6 uuid];
          objc_claimAutoreleasedReturnValue();
          [v14 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_100149044();
        }
      }
      else
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
        {
          [v6 uuid];
          objc_claimAutoreleasedReturnValue();
          sub_100149000();
        }
        [v12 setCellInfo:v13];
        if (![(WISOOSRecoveryMetric *)self isAirplaneModeActive])
        {
          uint64_t v15 = [v12 oosStart];
          if (v15)
          {
            v16 = [v12 registrationState];
            unsigned int v17 = +[WISTelephonyUtils isRegistrationDisplayStatusInService:v16];

            if (v17)
            {
              if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
              {
                [v6 uuid];
                objc_claimAutoreleasedReturnValue();
                sub_100148EE8();
              }
              [(WISOOSRecoveryMetric *)self handleCompletedOutOfServiceEventWithState:v12 atTime:clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW)];
            }
          }
        }
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      [v6 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_100148FBC();
    }
  }
}

- (NSMutableDictionary)contextUUIDToStateMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isAirplaneModeActive
{
  return self->_isAirplaneModeActive;
}

+ (id)getSharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B696C;
  block[3] = &unk_1001B5ED8;
  block[4] = a1;
  if (qword_1001D7E68 != -1) {
    dispatch_once(&qword_1001D7E68, block);
  }
  v2 = (void *)qword_1001D7E60;

  return v2;
}

- (WISOOSRecoveryMetric)init
{
  v10.receiver = self;
  v10.super_class = (Class)WISOOSRecoveryMetric;
  v2 = [(WISOOSRecoveryMetric *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    [(WISOOSRecoveryMetric *)v2 setContextUUIDToStateMap:v3];

    [(WISOOSRecoveryMetric *)v2 setIsContextMapInitialized:0];
    [(WISOOSRecoveryMetric *)v2 setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.OOSRecoveryMetric", 0)];
    v4 = [(WISOOSRecoveryMetric *)v2 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B6AEC;
    block[3] = &unk_1001B5F28;
    id v5 = v2;
    unsigned __int8 v9 = v5;
    dispatch_async(v4, block);
    id v6 = v5;
  }
  return v2;
}

- (void)populateSubscriptionContextsInUse
{
  id v3 = [(WISOOSRecoveryMetric *)self ctRelay];
  v4 = [v3 coreTelephonyClient];
  id v33 = 0;
  id v25 = [v4 getSubscriptionInfoWithError:&v33];
  id v26 = v33;

  if (v26)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
    {
      [v26 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100148B6C();
    }
  }
  else
  {
    id v5 = [v25 subscriptionsInUse];
    id v24 = +[WISTelephonyUtils sanitizedSubscriptions:v5];

    if (v24)
    {
      id v6 = [(WISOOSRecoveryMetric *)self ctRelay];
      id v7 = [v6 coreTelephonyClient];
      id v32 = 0;
      uint64_t v23 = [v7 getCurrentDataSubscriptionContextSync:&v32];
      id v26 = v32;

      if (v26)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
        {
          [v26 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_100148B28();
        }
      }
      else
      {
        [(WISOOSRecoveryMetric *)self setIsContextMapInitialized:1];
        v27 = [v23 uuid];
        v21 = [(WISOOSRecoveryMetric *)self findContextsToDelete:v24];
        unsigned __int8 v8 = *(NSObject **)(qword_1001D8080 + 48);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          sub_100148ADC((uint64_t)v35, (uint64_t)[v21 count], (uint64_t)objc_msgSend(v24, "count"), v8);
        }
        unsigned __int8 v9 = [(WISOOSRecoveryMetric *)self contextUUIDToStateMap];
        [v9 removeObjectsForKeys:v22];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v10 = v24;
        id v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v29;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v15 = [(WISOOSRecoveryMetric *)self contextUUIDToStateMap];
              v16 = [v14 uuid];
              unsigned int v17 = [v15 objectForKey:v16];
              BOOL v18 = v17 == 0;

              BOOL v19 = os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG);
              if (v18)
              {
                if (v19)
                {
                  [v14 uuid];
                  objc_claimAutoreleasedReturnValue();
                  sub_100148A3C();
                }
                v20 = [v14 uuid];
                -[WISOOSRecoveryMetric initializeStateForContext:isDataContext:](self, "initializeStateForContext:isDataContext:", v14, [v27 isEqual:v20]);
              }
              else if (v19)
              {
                [v14 uuid];
                objc_claimAutoreleasedReturnValue();
                sub_100148A8C();
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
          }
          while (v11);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
        sub_1001489FC();
      }
      id v26 = 0;
    }
  }
}

- (void)initializeStateForContext:(id)a3 isDataContext:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(WISOOSRecoveryMetric *)self ctRelay];
  unsigned __int8 v8 = [v7 coreTelephonyClient];
  id v18 = 0;
  id v9 = [v8 copyRegistrationDisplayStatus:v6 error:&v18];
  id v10 = v18;

  if (v10)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
    {
      [v10 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100148BB0();
    }
  }
  else
  {
    id v11 = [(WISOOSRecoveryMetric *)self ctRelay];
    uint64_t v12 = [v11 coreTelephonyClient];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B72EC;
    v13[3] = &unk_1001BAD00;
    id v14 = v6;
    uint64_t v15 = self;
    BOOL v17 = a4;
    id v16 = v9;
    [v12 copyCellInfo:v14 completion:v13];
  }
}

- (void)subscriptionInfoDidChange
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_100148D60();
  }
  [(WISOOSRecoveryMetric *)self populateSubscriptionContextsInUse];
}

- (void)registrationStatusChanged:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[WISTelephonyUtils isValidContext:v6])
  {
    if (v7)
    {
      unsigned __int8 v8 = [(WISOOSRecoveryMetric *)self contextUUIDToStateMap];
      id v9 = [v6 uuid];
      id v10 = [v8 objectForKey:v9];

      if (!v10)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
        {
          [v6 uuid];
          objc_claimAutoreleasedReturnValue();
          sub_100148DD8();
        }
        goto LABEL_35;
      }
      id v11 = [v10 registrationState];
      unsigned int v12 = [v11 isEqualToString:v7];

      BOOL v13 = os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG);
      if (v12)
      {
        if (v13)
        {
          [v6 uuid];
          objc_claimAutoreleasedReturnValue();
          sub_100148E1C();
        }
        goto LABEL_35;
      }
      if (v13)
      {
        id v14 = [v6 uuid];
        sub_100148F2C(v14, (uint64_t)v7, (uint64_t)v31);
      }
      if ([(WISOOSRecoveryMetric *)self isAirplaneModeActive]) {
        goto LABEL_34;
      }
      __uint64_t v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      id v16 = [v10 registrationState];
      if (+[WISTelephonyUtils isRegistrationDisplayStatusInService:](WISTelephonyUtils, "isRegistrationDisplayStatusInService:", v16)&& +[WISTelephonyUtils isRegistrationDisplayStatusOutOfService:v7])
      {
        BOOL v17 = [v10 oosStart];
        BOOL v18 = v17 == 0;

        if (v18)
        {
          if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
          {
            [v6 uuid];
            objc_claimAutoreleasedReturnValue();
            sub_100148E60();
          }
          BOOL v19 = [OOSRecoveryMetricOOSStartState alloc];
          v20 = [v10 registrationState];
          v21 = [v10 cellInfo];
          id v22 = [(OOSRecoveryMetricOOSStartState *)v19 initWithTimestamp:v15 registrationState:v20 cellInfo:v21];
          [v10 setOosStart:v22];

          goto LABEL_34;
        }
      }
      else
      {
      }
      if (!+[WISTelephonyUtils isRegistrationDisplayStatusInService:](WISTelephonyUtils, "isRegistrationDisplayStatusInService:", v7)|| ([v10 oosStart], uint64_t v23 = objc_claimAutoreleasedReturnValue(), v24 = v23 == 0, v23, v24))
      {
LABEL_34:
        [v10 setRegistrationState:v7];
LABEL_35:

        goto LABEL_36;
      }
      id v25 = [v10 cellInfo];
      if (v25)
      {
        id v26 = [v10 cellInfo];
        if ((unint64_t)[v26 timestamp] < v15)
        {
          long long v30 = [v10 cellInfo];
          if (v15 - (unint64_t)[v30 timestamp] < 0x28FA6AE00)
          {
            long long v29 = [v10 oosStart];
            id v27 = [v29 timestamp];
            long long v28 = [v10 cellInfo];
            LODWORD(v27) = v27 < [v28 timestamp];

            if (v27)
            {
              if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
              {
                [v6 uuid];
                objc_claimAutoreleasedReturnValue();
                sub_100148EE8();
              }
              [v10 setRegistrationState:v7];
              [(WISOOSRecoveryMetric *)self handleCompletedOutOfServiceEventWithState:v10 atTime:v15];
              goto LABEL_34;
            }
            goto LABEL_32;
          }
        }
      }
LABEL_32:
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
      {
        [v6 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_100148EA4();
      }
      goto LABEL_34;
    }
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
    {
      [v6 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_100148D94();
    }
  }
LABEL_36:
}

- (void)currentDataSimChanged:(id)a3
{
  id v4 = a3;
  if (+[WISTelephonyUtils isValidContext:v4])
  {
    unsigned __int8 v5 = [(WISOOSRecoveryMetric *)self isContextMapInitialized];
    id v6 = *(NSObject **)(qword_1001D8080 + 48);
    if (v5)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
      {
        [v4 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_100148F78();
      }
      id v7 = [(WISOOSRecoveryMetric *)self contextUUIDToStateMap];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000B7F2C;
      v9[3] = &unk_1001BAD28;
      id v10 = v4;
      [v7 enumerateKeysAndObjectsUsingBlock:v9];
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v8 = [v4 uuid];
        *(_DWORD *)buf = 138412290;
        unsigned int v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "OOSRecoveryMetric:#I Current data context changed to %@, but we did not successfully initialize. Running initialization", buf, 0xCu);
      }
      [(WISOOSRecoveryMetric *)self populateSubscriptionContextsInUse];
    }
  }
}

- (void)airplaneModeStatusChanged:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(WISOOSRecoveryMetric *)self isAirplaneModeActive];
  id v6 = *(NSObject **)(qword_1001D8080 + 48);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == v3)
  {
    if (v7) {
      sub_100149120();
    }
  }
  else
  {
    if (v7) {
      sub_100149098(v3, v6, v8);
    }
    [(WISOOSRecoveryMetric *)self setIsAirplaneModeActive:v3];
    id v9 = [(WISOOSRecoveryMetric *)self contextUUIDToStateMap];
    [v9 enumerateKeysAndObjectsUsingBlock:&stru_1001BAD68];
  }
}

- (void)handleCompletedOutOfServiceEventWithState:(id)a3 atTime:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 cellInfo];
  if (v6)
  {
    BOOL v7 = [v5 oosStart];
    uint64_t v8 = [v7 cellInfo];
    if (v8)
    {
      id v9 = [v5 oosStart];
      id v10 = [v9 timestamp];

      if ((unint64_t)v10 <= a4)
      {
        id v11 = [v5 oosStart];
        id v12 = [v11 timestamp];

        v77[0] = @"dataContext";
        v65 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isDataContext]);
        v78[0] = v65;
        v77[1] = @"duration";
        v64 = +[NSNumber numberWithUnsignedLongLong:(a4 - (unint64_t)v12) / 0x3B9ACA00];
        v78[1] = v64;
        v77[2] = @"sameRAT";
        v66 = [v5 oosStart];
        v63 = [v66 cellInfo];
        v73 = [v63 rat];
        v67 = [v5 cellInfo];
        v68 = [v67 rat];
        v60 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v73, "isEqualToString:"));
        v78[2] = v60;
        v77[3] = @"sameTAC";
        v59 = [v5 oosStart];
        v58 = [v59 cellInfo];
        v72 = [v58 tacOrLac];
        v61 = [v5 cellInfo];
        v62 = [v61 tacOrLac];
        v55 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v72, "isEqualToNumber:"));
        v78[3] = v55;
        v77[4] = @"sameCell";
        v54 = [v5 oosStart];
        v53 = [v54 cellInfo];
        v71 = [v53 gci];
        v56 = [v5 cellInfo];
        v57 = [v56 gci];
        v49 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v71, "isEqualToString:"));
        v78[4] = v49;
        v77[5] = @"knownOOSTAC";
        v70 = [v5 knownOosTacs];
        v50 = [v5 oosStart];
        v51 = [v50 cellInfo];
        v52 = [v51 tacOrLac];
        v45 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v70, "containsObject:"));
        v78[5] = v45;
        v77[6] = @"knownOOSCell";
        v69 = [v5 knownOosGcis];
        v46 = [v5 oosStart];
        v47 = [v46 cellInfo];
        v48 = [v47 gci];
        v44 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v69, "containsObject:"));
        v78[6] = v44;
        v77[7] = @"ratBefore";
        v43 = [v5 oosStart];
        v42 = [v43 cellInfo];
        v41 = [v42 rat];
        v78[7] = v41;
        v77[8] = @"ratAfter";
        v40 = [v5 cellInfo];
        v39 = [v40 rat];
        v78[8] = v39;
        v77[9] = @"registrationStateBefore";
        v38 = [v5 oosStart];
        v37 = [v38 registrationState];
        __int16 v36 = +[WISTelephonyUtils getShortenedRegistrationStateString:](WISTelephonyUtils, "getShortenedRegistrationStateString:");
        v78[9] = v36;
        v77[10] = @"registrationStateAfter";
        BOOL v13 = [v5 registrationState];
        id v14 = +[WISTelephonyUtils getShortenedRegistrationStateString:v13];
        v78[10] = v14;
        v77[11] = @"bandBefore";
        __uint64_t v15 = [v5 oosStart];
        id v16 = [v15 cellInfo];
        BOOL v17 = [v16 band];
        v78[11] = v17;
        v77[12] = @"bandAfter";
        BOOL v18 = [v5 cellInfo];
        BOOL v19 = [v18 band];
        v78[12] = v19;
        v77[13] = @"oosTACCacheFull";
        v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 knownOosTacsSizeLimited]);
        v78[13] = v20;
        v77[14] = @"oosCellCacheFull";
        v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 knownOosGcisSizeLimited]);
        v78[14] = v21;
        v35 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:15];

        id v22 = +[NSString stringWithUTF8String:"com.apple.Telephony.cellularOutOfService"];
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472;
        v75[2] = sub_1000B8D10;
        v75[3] = &unk_1001B5EB8;
        id v23 = v35;
        id v76 = v23;
        sub_100005B9C(v22, v75);

        BOOL v24 = [v5 oosStart];
        id v25 = [v24 cellInfo];
        id v26 = [v25 tacOrLac];
        id v27 = [v5 knownOosTacs];
        LODWORD(v16) = [(WISOOSRecoveryMetric *)self insertOrMoveObject:v26 InMutableOrderedSet:v27 WithSizeLimit:25];

        if (v16) {
          [v5 setKnownOosTacsSizeLimited:1];
        }
        long long v28 = [v5 oosStart];
        long long v29 = [v28 cellInfo];
        long long v30 = [v29 gci];
        long long v31 = [v5 knownOosGcis];
        unsigned int v32 = [(WISOOSRecoveryMetric *)self insertOrMoveObject:v30 InMutableOrderedSet:v31 WithSizeLimit:25];

        if (v32) {
          [v5 setKnownOosGcisSizeLimited:1];
        }
        id v33 = *(NSObject **)(qword_1001D8080 + 48);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_100149188((uint64_t)v5, v33, v34);
        }
        [v5 setOosStart:0];

        goto LABEL_15;
      }
    }
    else
    {
    }
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_100149154();
  }
  [v5 setOosStart:0];
LABEL_15:
}

- (BOOL)insertOrMoveObject:(id)a3 InMutableOrderedSet:(id)a4 WithSizeLimit:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 indexOfObject:v7];
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [v8 addObject:v7];
    char v10 = 0;
    while ((unint64_t)[v8 count] > a5)
    {
      char v10 = 1;
      [v8 removeObjectAtIndex:0];
    }
  }
  else
  {
    id v11 = +[NSIndexSet indexSetWithIndex:v9];
    objc_msgSend(v8, "moveObjectsAtIndexes:toIndex:", v11, (char *)objc_msgSend(v8, "count") - 1);

    char v10 = 0;
  }

  return v10 & 1;
}

- (id)findContextsToDelete:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        char v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) uuid];
        [v5 addObject:v10];
      }
      id v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = [(WISOOSRecoveryMetric *)self contextUUIDToStateMap];
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
        if (([v5 containsObject:v16] & 1) == 0) {
          [v11 addObject:v16];
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }

  id v17 = [v11 copy];

  return v17;
}

- (TelephonyStateRelay)ctRelay
{
  return (TelephonyStateRelay *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCtRelay:(id)a3
{
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (void)setQueue:(dispatch_queue_s *)a3
{
  self->_queue = a3;
}

- (void)setContextUUIDToStateMap:(id)a3
{
}

- (BOOL)isContextMapInitialized
{
  return self->_isContextMapInitialized;
}

- (void)setIsContextMapInitialized:(BOOL)a3
{
  self->_isContextMapInitialized = a3;
}

- (void)setIsAirplaneModeActive:(BOOL)a3
{
  self->_isAirplaneModeActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextUUIDToStateMap, 0);

  objc_storeStrong((id *)&self->_ctRelay, 0);
}

@end