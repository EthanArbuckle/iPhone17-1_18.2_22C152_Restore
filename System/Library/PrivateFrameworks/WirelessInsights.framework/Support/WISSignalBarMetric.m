@interface WISSignalBarMetric
+ (id)getSharedInstance;
- (BOOL)dataInitializationSuccessful;
- (NSMutableDictionary)contextStates;
- (TelephonyStateRelay)ctRelay;
- (WISSignalBarMetric)init;
- (dispatch_queue_s)queue;
- (id)signalStrengthInfoToString:(id)a3;
- (int64_t)plmnPartStringToInt:(id)a3 error:(id *)a4;
- (void)currentDataSimChanged:(id)a3;
- (void)handleUpdate:(id)a3 forKey:(int)a4 withState:(id)a5;
- (void)plmnChanged:(id)a3 plmn:(id)a4;
- (void)populateSubscriptionContextsInUse;
- (void)registrationStatusChanged:(id)a3 status:(id)a4;
- (void)setContextStates:(id)a3;
- (void)setCtRelay:(id)a3;
- (void)setDataInitializationSuccessful:(BOOL)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)subscriptionInfoDidChange;
@end

@implementation WISSignalBarMetric

- (void)handleUpdate:(id)a3 forKey:(int)a4 withState:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 1:
      [(WISSignalBarMetric *)self signalStrengthChanged:v9 info:v8];
      break;
    case 2:
      [(WISSignalBarMetric *)self plmnChanged:v9 plmn:v8];
      break;
    case 3:
      [(WISSignalBarMetric *)self currentDataSimChanged:v9];
      break;
    case 6:
      [(WISSignalBarMetric *)self subscriptionInfoDidChange];
      break;
    case 8:
      [(WISSignalBarMetric *)self registrationStatusChanged:v9 status:v8];
      break;
    default:
      break;
  }
}

+ (id)getSharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045780;
  block[3] = &unk_1001B5ED8;
  block[4] = a1;
  if (qword_1001D7C38 != -1) {
    dispatch_once(&qword_1001D7C38, block);
  }
  v2 = (void *)qword_1001D7C30;

  return v2;
}

- (WISSignalBarMetric)init
{
  v14.receiver = self;
  v14.super_class = (Class)WISSignalBarMetric;
  v2 = [(WISSignalBarMetric *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    [(WISSignalBarMetric *)v2 setContextStates:v3];

    [(WISSignalBarMetric *)v2 setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.SignalBarMonitor", 0)];
    v4 = +[TelephonyStateRelay sharedInstance];
    [(WISSignalBarMetric *)v2 setCtRelay:v4];

    v5 = [(WISSignalBarMetric *)v2 ctRelay];
    v6 = [v5 coreTelephonyClient];

    if (!v6 && os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
      sub_100142B08();
    }
    v7 = [(WISSignalBarMetric *)v2 ctRelay];
    objc_msgSend(v7, "addTelephonyStateDelegate:withQueue:", v2, -[WISSignalBarMetric queue](v2, "queue"));

    id v8 = [(WISSignalBarMetric *)v2 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100045994;
    block[3] = &unk_1001B5F28;
    id v9 = v2;
    v13 = v9;
    dispatch_async(v8, block);
    v10 = v9;
  }
  return v2;
}

- (id)signalStrengthInfoToString:(id)a3
{
  id v3 = [a3 bars];
  v4 = v3;
  if (v3) {
    [v3 stringValue];
  }
  else {
  v5 = +[NSString stringWithUTF8String:"UNKNOWN"];
  }

  return v5;
}

- (int64_t)plmnPartStringToInt:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = [v5 intValue];
  uint64_t v7 = v6;
  if (v6 <= 0)
  {
    id v8 = *(NSObject **)(qword_1001D8080 + 48);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100142B3C(v7, v8);
    }
    id v9 = +[NSMutableDictionary dictionary];
    [v9 setValue:@"PLMN part less than or equal to zero" forKey:NSLocalizedDescriptionKey];
    v10 = +[NSString stringWithUTF8String:"signalBarMonitor"];
    *a4 = +[NSError errorWithDomain:v10 code:0 userInfo:v9];

    uint64_t v7 = 0;
  }

  return v7;
}

- (void)populateSubscriptionContextsInUse
{
  v2 = [(WISSignalBarMetric *)self ctRelay];
  id v3 = [v2 coreTelephonyClient];
  id v109 = 0;
  v82 = [v3 getSubscriptionInfoWithError:&v109];
  id v4 = v109;

  if (!v4)
  {
    v89 = [v82 subscriptionsInUse];
    if (!v89)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
        sub_100142BB4();
      }
      id v4 = 0;
LABEL_86:

      goto LABEL_87;
    }
    id v5 = [(WISSignalBarMetric *)self ctRelay];
    int v6 = [v5 coreTelephonyClient];
    id v108 = 0;
    v80 = [v6 getCurrentDataSubscriptionContextSync:&v108];
    id v4 = v108;

    if (v4)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
      {
        [v4 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_100142DE4();
      }
LABEL_85:

      goto LABEL_86;
    }
    [(WISSignalBarMetric *)self setDataInitializationSuccessful:1];
    v76 = [v80 uuid];
    __uint64_t v75 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    id v85 = objc_alloc_init((Class)NSMutableArray);
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v7 = [(WISSignalBarMetric *)self contextStates];
    id obj = v7;
    id v8 = [v7 countByEnumeratingWithState:&v104 objects:v126 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v105;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v105 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          long long v100 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          id v12 = v89;
          id v13 = [v12 countByEnumeratingWithState:&v100 objects:v125 count:16];
          if (!v13)
          {
LABEL_26:

            [v85 addObject:v11];
            continue;
          }
          uint64_t v14 = *(void *)v101;
LABEL_18:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v101 != v14) {
              objc_enumerationMutation(v12);
            }
            v16 = *(void **)(*((void *)&v100 + 1) + 8 * v15);
            if (v16)
            {
              if ([*(id *)(*((void *)&v100 + 1) + 8 * v15) slotID])
              {
                v17 = [v16 uuid];
                unsigned __int8 v18 = [v11 isEqual:v17];

                if (v18) {
                  break;
                }
              }
            }
            if (v13 == (id)++v15)
            {
              id v13 = [v12 countByEnumeratingWithState:&v100 objects:v125 count:16];
              if (!v13) {
                goto LABEL_26;
              }
              goto LABEL_18;
            }
          }
        }
        uint64_t v7 = obj;
        id v8 = [obj countByEnumeratingWithState:&v104 objects:v126 count:16];
      }
      while (v8);
    }

    v19 = *(NSObject **)(qword_1001D8080 + 48);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100142D74((uint64_t)v85, v19, v20);
    }
    v21 = [(WISSignalBarMetric *)self contextStates];
    [v21 removeObjectsForKeys:v85];

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id obja = v89;
    id v22 = [obja countByEnumeratingWithState:&v96 objects:v124 count:16];
    if (!v22)
    {
      id v4 = 0;
      goto LABEL_84;
    }
    id v23 = 0;
    uint64_t v24 = *(void *)v97;
LABEL_34:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v97 != v24) {
        objc_enumerationMutation(obja);
      }
      v26 = *(void **)(*((void *)&v96 + 1) + 8 * v25);

      if (!v26 || ![v26 slotID]) {
        break;
      }
      v27 = [(WISSignalBarMetric *)self contextStates];
      v28 = [v26 uuid];
      v29 = [v27 objectForKey:v28];
      BOOL v30 = v29 == 0;

      BOOL v31 = os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG);
      if (!v30)
      {
        if (v31)
        {
          [v26 uuid];
          objc_claimAutoreleasedReturnValue();
          sub_100142D28();
        }
LABEL_44:
        id v23 = 0;
        goto LABEL_45;
      }
      if (v31)
      {
        [v26 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_100142CDC();
      }
      v32 = [(WISSignalBarMetric *)self ctRelay];
      v33 = [v32 coreTelephonyClient];
      id v95 = 0;
      v34 = [v33 getSignalStrengthInfo:v26 error:&v95];
      id v23 = v95;

      if (v23)
      {
        v35 = *(NSObject **)(qword_1001D8080 + 48);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v46 = [v26 uuid];
          v47 = [v23 localizedDescription];
          *(_DWORD *)buf = 138412546;
          v111 = v46;
          __int16 v112 = 2112;
          id v113 = v47;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "SignalBarMetric:Unable to fetch signal strength for context %@: %@", buf, 0x16u);
        }
        goto LABEL_45;
      }
      v36 = [(WISSignalBarMetric *)self signalStrengthInfoToString:v34];
      v37 = [(WISSignalBarMetric *)self ctRelay];
      v38 = [v37 coreTelephonyClient];
      id v94 = 0;
      id v84 = [v38 copyRegistrationDisplayStatus:v26 error:&v94];
      id v23 = v94;

      if (v23)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
        {
          [v23 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_100142C88();
        }

        goto LABEL_45;
      }
      v81 = [v84 registrationDisplayStatus];
      v39 = [(WISSignalBarMetric *)self ctRelay];
      v40 = [v39 coreTelephonyClient];
      id v93 = 0;
      id v83 = [v40 copyMobileCountryCode:v26 error:&v93];
      id v23 = v93;

      if (v23)
      {
        v41 = *(NSObject **)(qword_1001D8080 + 48);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = [v26 uuid];
          v43 = [v23 localizedDescription];
          *(_DWORD *)buf = 138412546;
          v111 = v42;
          __int16 v112 = 2112;
          id v113 = v43;
          _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "SignalBarMetric:Unable to fetch MCC for context %@: %@", buf, 0x16u);
        }
LABEL_63:

        goto LABEL_45;
      }
      id v92 = 0;
      int64_t v78 = [(WISSignalBarMetric *)self plmnPartStringToInt:v83 error:&v92];
      id v44 = v92;
      if (v44)
      {
        id v23 = v44;
        v45 = *(NSObject **)(qword_1001D8080 + 48);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v65 = [v26 uuid];
          v66 = [v23 localizedDescription];
          *(_DWORD *)buf = 138412546;
          v111 = v65;
          __int16 v112 = 2112;
          id v113 = v66;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "SignalBarMetric:Unable to convert MCC for context %@: %@", buf, 0x16u);
        }
        goto LABEL_63;
      }
      v48 = [(WISSignalBarMetric *)self ctRelay];
      v49 = [v48 coreTelephonyClient];
      id v91 = 0;
      id v77 = [v49 copyMobileNetworkCode:v26 error:&v91];
      id v23 = v91;

      if (v23)
      {
        v50 = *(NSObject **)(qword_1001D8080 + 48);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = [v26 uuid];
          v52 = [v23 localizedDescription];
          *(_DWORD *)buf = 138412546;
          v111 = v51;
          __int16 v112 = 2112;
          id v113 = v52;
          _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "SignalBarMetric:Unable to fetch MNC for context %@: %@", buf, 0x16u);
        }
      }
      else
      {
        id v90 = 0;
        int64_t v53 = [(WISSignalBarMetric *)self plmnPartStringToInt:v77 error:&v90];
        id v54 = v90;
        if (!v54)
        {
          v56 = [v26 uuid];
          id v57 = [v76 isEqual:v56];

          id v58 = [[ContextState alloc] init:v75 mnc:v53 mcc:v78 dataPreferred:v57 signalBarState:v36 registrationState:v81];
          if (v58)
          {
            v59 = [(WISSignalBarMetric *)self contextStates];
            v60 = [v26 uuid];
            [v59 setObject:v58 forKey:v60];

            v61 = *(NSObject **)(qword_1001D8080 + 48);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              v74 = v61;
              v79 = [v26 uuid];
              id v73 = [v58 startTime];
              id v72 = [v58 mnc];
              id v71 = [v58 mcc];
              if ([v58 dataPreferred]) {
                CFStringRef v62 = @"yes";
              }
              else {
                CFStringRef v62 = @"no";
              }
              v63 = [v58 signalBarState];
              v64 = [v58 registrationState];
              *(_DWORD *)buf = 138413826;
              v111 = v79;
              __int16 v112 = 2048;
              id v113 = v73;
              __int16 v114 = 2048;
              id v115 = v72;
              __int16 v116 = 2048;
              id v117 = v71;
              __int16 v118 = 2112;
              CFStringRef v119 = v62;
              __int16 v120 = 2112;
              v121 = v63;
              __int16 v122 = 2112;
              v123 = v64;
              _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "SignalBarMetric:#D Successfully initialized state for context %@: startTime %llu, MNC %ld, MCC %ld, dataPreferred %@, signalBarState %@, registrationState %@", buf, 0x48u);
            }
          }
          else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
          {
            [v26 uuid];
            objc_claimAutoreleasedReturnValue();
            sub_100142C34();
          }
          BOOL v67 = v58 == 0;

          id v23 = 0;
          id v4 = 0;
          if (v67) {
            goto LABEL_84;
          }
          goto LABEL_45;
        }
        id v23 = v54;
        v55 = *(NSObject **)(qword_1001D8080 + 48);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v68 = [v26 uuid];
          v69 = [v23 localizedDescription];
          *(_DWORD *)buf = 138412546;
          v111 = v68;
          __int16 v112 = 2112;
          id v113 = v69;
          _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "SignalBarMetric:Unable to convert MNC for context %@: %@", buf, 0x16u);
        }
      }

LABEL_45:
      if (v22 == (id)++v25)
      {
        id v70 = [obja countByEnumeratingWithState:&v96 objects:v124 count:16];
        id v22 = v70;
        id v4 = v23;
        if (!v70)
        {
LABEL_84:

          goto LABEL_85;
        }
        goto LABEL_34;
      }
    }
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      [v26 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_100142BE8();
    }
    goto LABEL_44;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
  {
    [v4 localizedDescription];
    objc_claimAutoreleasedReturnValue();
    sub_100142E28();
  }
LABEL_87:
}

- (void)subscriptionInfoDidChange
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_100142E6C();
  }
  [(WISSignalBarMetric *)self populateSubscriptionContextsInUse];
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (id v8 = [v6 slotID], v7) && v8)
  {
    uint64_t v9 = [(WISSignalBarMetric *)self signalStrengthInfoToString:v7];
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      v10 = [v6 uuid];
      v11 = [(WISSignalBarMetric *)self signalStrengthInfoToString:v7];
      sub_100142F68(v10, v11, (uint64_t)v26);
    }
    id v12 = [(WISSignalBarMetric *)self contextStates];
    id v13 = [v6 uuid];
    uint64_t v14 = [v12 objectForKey:v13];

    if (v14)
    {
      uint64_t v15 = [v14 signalBarState];
      unsigned int v16 = [v15 isEqualToString:v9];

      if (v16)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
        {
          [v6 uuid];
          objc_claimAutoreleasedReturnValue();
          sub_100142F24();
        }
      }
      else
      {
        __uint64_t v17 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
        if ([v14 dataPreferred] && (unint64_t)objc_msgSend(v14, "startTime") < v17)
        {
          id v18 = [v14 startTime];
          v19 = +[NSString stringWithUTF8String:"com.apple.Telephony.cellularSignalBarUsage"];
          uint64_t v20 = _NSConcreteStackBlock;
          uint64_t v21 = 3221225472;
          id v22 = sub_100046F08;
          id v23 = &unk_1001B68D0;
          id v24 = v14;
          unint64_t v25 = (v17 - (unint64_t)v18) / 0x3B9ACA00;
          sub_100005B9C(v19, &v20);
        }
        objc_msgSend(v14, "setSignalBarState:", v9, v20, v21, v22, v23);
        [v14 setStartTime:v17];
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      [v6 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_100142EE0();
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
  {
    sub_100142EAC();
  }
}

- (void)plmnChanged:(id)a3 plmn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(WISSignalBarMetric *)self contextStates];
    v10 = [v6 uuid];
    v11 = [v9 objectForKey:v10];

    if (v11)
    {
      id v12 = [v8 mnc];
      id v18 = 0;
      int64_t v13 = [(WISSignalBarMetric *)self plmnPartStringToInt:v12 error:&v18];
      id v14 = v18;

      if (v14)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
        {
          [v14 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_100143050();
        }
      }
      else
      {
        uint64_t v15 = [v8 mcc];
        id v17 = 0;
        int64_t v16 = [(WISSignalBarMetric *)self plmnPartStringToInt:v15 error:&v17];
        id v14 = v17;

        if (v14)
        {
          if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
          {
            [v14 localizedDescription];
            objc_claimAutoreleasedReturnValue();
            sub_10014300C();
          }
        }
        else
        {
          [v11 setMnc:v13];
          [v11 setMcc:v16];
          id v14 = 0;
        }
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
    {
      [v6 uuid];
      objc_claimAutoreleasedReturnValue();
      sub_100142FC8();
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
  {
    sub_100143094();
  }
}

- (void)registrationStatusChanged:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 slotID];
    if (v7)
    {
      if (v8)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
        {
          uint64_t v9 = [v6 uuid];
          sub_10014310C(v9, (uint64_t)v7, (uint64_t)v13);
        }
        v10 = [(WISSignalBarMetric *)self contextStates];
        v11 = [v6 uuid];
        id v12 = [v10 objectForKey:v11];

        if (v12)
        {
          [v12 setRegistrationState:v7];
        }
        else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
        {
          [v6 uuid];
          objc_claimAutoreleasedReturnValue();
          sub_1001430C8();
        }
      }
    }
  }
}

- (void)currentDataSimChanged:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 slotID])
  {
    unsigned __int8 v6 = [(WISSignalBarMetric *)self dataInitializationSuccessful];
    BOOL v7 = os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v7)
      {
        [v5 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_100143198();
      }
      id v8 = [(WISSignalBarMetric *)self contextStates];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100047858;
      v9[3] = &unk_1001B68F8;
      id v10 = v5;
      [v8 enumerateKeysAndObjectsUsingBlock:v9];
    }
    else
    {
      if (v7)
      {
        [v5 uuid];
        objc_claimAutoreleasedReturnValue();
        sub_1001431DC();
      }
      [(WISSignalBarMetric *)self populateSubscriptionContextsInUse];
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
  {
    sub_100143164();
  }
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

- (NSMutableDictionary)contextStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContextStates:(id)a3
{
}

- (BOOL)dataInitializationSuccessful
{
  return self->_dataInitializationSuccessful;
}

- (void)setDataInitializationSuccessful:(BOOL)a3
{
  self->_dataInitializationSuccessful = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextStates, 0);

  objc_storeStrong((id *)&self->_ctRelay, 0);
}

@end