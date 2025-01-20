@interface _DASDataCollectionTasks
+ (BOOL)convertBiomeStream:(id)a3 toKnowledgeStoreStream:(id)a4;
+ (BOOL)generateCRFile;
+ (BOOL)shouldExcludeEvent:(id)a3;
+ (char)writeExperiments:(id)a3 atFileName:(id)a4 withTask:(id)a5;
+ (double)computeUsageCorrelationBetweenAirPodsAMPStreamsWithStore:(id)a3;
+ (id)experimentsToWrite;
+ (id)fuzzedDateFromDate:(id)a3 forStreamName:(id)a4;
+ (id)handleForFilename:(id)a3;
+ (id)metadataWitDisallowedKeysRemoveForMedatata:(id)a3 forStreamName:(id)a4;
+ (id)processEvents:(id)a3;
+ (id)writeExperiment:(id)a3 withStreams:(id)a4 toFileHandle:(id)a5 withLastWrittenInfo:(id)a6;
+ (id)writeStream:(id)a3 toFileHandle:(id)a4 withEventPredicate:(id)a5 withStore:(id)a6;
+ (int)boundedDurationFromDuration:(double)a3;
+ (unint64_t)writeToFileWithContextDictionary:(id)a3;
+ (void)addCurrentStateToEvents:(id)a3 forEventStream:(id)a4;
+ (void)convertFocusModeStream:(id)a3 toKnowledgeStoreStream:(id)a4;
+ (void)deleteConvertedStreams;
+ (void)deleteEventsFromStream:(id)a3;
+ (void)extendJSONArrayWithAnotherArray:(id)a3 toFileHandler:(id)a4 isPreviouslyEmpty:(BOOL)a5;
+ (void)generateUsageVectorRepresentationWithStreamAUsage:(id)a3 streamBUsage:(id)a4 outputRepresentationA:(id)a5 outputRepresentationB:(id)a6;
+ (void)loadParameters;
+ (void)registerForDataCollectionTestNotification;
+ (void)replaceJSONDataWithNull:(id)a3 atWriteHandle:(id)a4;
+ (void)reportAnalyticsForActivity:(id)a3;
+ (void)reportBackgroundAppRefreshAnalytics:(id)a3;
+ (void)reportDataOnExperiments:(id)a3;
+ (void)reportWakeAnalytics:(id)a3;
+ (void)schedule;
+ (void)scheduleDASTelemetryActivities;
+ (void)submitSystemTask:(id)a3;
@end

@implementation _DASDataCollectionTasks

+ (void)loadParameters
{
  v2 = OSAGetDATaskingValue();
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v2 doubleValue];
      qword_1001C2E30 = v3;
    }
  }
  v4 = OSAGetDATaskingValue();
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 doubleValue];
      qword_1001C2E38 = v5;
    }
  }
  v6 = OSAGetDATaskingValue();
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      qword_1001C2E40 = v7;
    }
  }
  v8 = OSAGetDATaskingValue();
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      qword_1001C2E48 = v9;
    }
  }
  v10 = OSAGetDATaskingValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    dword_1001C2E50 = [v10 unsignedIntValue];
  }
  v43 = v8;
  v44 = v6;
  v45 = v4;
  v46 = v2;
  v11 = OSAGetDATaskingValue();
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      qword_1001C2E58 = (uint64_t)[v11 integerValue];
    }
  }
  v42 = v11;
  v12 = +[_DKSystemEventStreams bluetoothIsConnectedStream];
  v13 = [v12 name];
  v53[0] = v13;
  v53[1] = @"/dasd/focus";
  v54[0] = &off_100187078;
  v54[1] = &off_100187090;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
  v15 = (void *)qword_1001C4220;
  qword_1001C4220 = v14;

  v16 = +[_DKSystemEventStreams bluetoothIsConnectedStream];
  v17 = [v16 name];
  v51 = v17;
  v52 = &off_1001870A8;
  uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  v19 = (void *)qword_1001C4228;
  qword_1001C4228 = v18;

  v20 = +[_DKSystemEventStreams bluetoothIsConnectedStream];
  v21 = [v20 name];
  v49[0] = v21;
  v22 = +[_DKBluetoothMetadataKey name];
  v48[0] = v22;
  v23 = +[_DKBluetoothMetadataKey address];
  v48[1] = v23;
  v24 = +[_DKBluetoothMetadataKey isAppleAudioDevice];
  v48[2] = v24;
  v25 = +[NSArray arrayWithObjects:v48 count:3];
  v49[1] = @"/clock/alarm";
  v50[0] = v25;
  v26 = +[_DKAlarmMetadataKey alarmID];
  v47[0] = v26;
  v27 = +[_DKAlarmMetadataKey isSleep];
  v47[1] = v27;
  v28 = +[NSArray arrayWithObjects:v47 count:2];
  v50[1] = v28;
  uint64_t v29 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
  v30 = (void *)qword_1001C4230;
  qword_1001C4230 = v29;

  id v31 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.datacollectiontasks"];
  v32 = [v31 objectForKey:@"dateOfChoosing"];
  v33 = v32;
  if (v32)
  {
    [v32 doubleValue];
    v34 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    v35 = +[NSDate now];
    [v35 timeIntervalSinceDate:v34];
    double v37 = v36;

    v39 = v43;
    v38 = v44;
    v40 = v10;
    if (v37 > 86400.0) {
      [v31 setObject:&off_1001870C0 forKey:@"chosenForSubmission"];
    }

    v41 = v45;
  }
  else
  {
    [v31 setObject:&off_1001870C0 forKey:@"chosenForSubmission"];
    v38 = v44;
    v41 = v45;
    v40 = v10;
    v39 = v43;
  }
}

+ (id)handleForFilename:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  if (([v4 fileExistsAtPath:v3] & 1) != 0
    || (uint64_t v5 = 0, [v4 createFileAtPath:v3 contents:0 attributes:0]))
  {
    uint64_t v5 = +[NSFileHandle fileHandleForUpdatingAtPath:v3];
    [v5 truncateFileAtOffset:0];
  }

  return v5;
}

+ (id)experimentsToWrite
{
  uint64_t v2 = +[NSMutableDictionary dictionary];
  id v3 = (void *)qword_1001C4238;
  qword_1001C4238 = v2;

  [(id)qword_1001C4238 setObject:&off_100187B40 forKeyedSubscript:@"dasdDataCollection"];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = (void *)qword_1001C4240;
  qword_1001C4240 = (uint64_t)v4;

  v6 = +[_DKEventStream eventStreamWithName:@"/dasd/activityprofile"];
  v103 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v103 count:1];
  [(id)qword_1001C4240 setObject:v7 forKeyedSubscript:@"activityprofiling"];

  id v83 = +[_DKSystemEventStreams deviceActivityLevelStream];
  v102[0] = v83;
  v81 = +[_DKSystemEventStreams deviceBatteryPercentageStream];
  v102[1] = v81;
  v79 = +[_DKSystemEventStreams deviceIsPluggedInStream];
  v102[2] = v79;
  v78 = +[_DKSystemEventStreams doNotDisturbStream];
  v102[3] = v78;
  v76 = +[_DKEventStream eventStreamWithName:@"/charging/smartTopOffCheckpoint"];
  v102[4] = v76;
  v75 = +[_DKEventStream eventStreamWithName:@"/charging/accessoryChargingEvents"];
  v102[5] = v75;
  v8 = +[_DKEventStream eventStreamWithName:@"/dasd/controlEffort"];
  v102[6] = v8;
  uint64_t v9 = +[_DKEventStream eventStreamWithName:@"/system/TLC"];
  v102[7] = v9;
  v10 = +[_DKEventStream eventStreamWithName:@"/clock/alarm"];
  v102[8] = v10;
  v11 = +[_DKSystemEventStreams deviceLowPowerModeStream];
  v102[9] = v11;
  v12 = +[_DKSystemEventStreams deviceIsLockedImputedStream];
  v102[10] = v12;
  v13 = +[_DKSystemEventStreams defaultPairedDeviceNearbyStream];
  v102[11] = v13;
  uint64_t v14 = +[_DKSystemEventStreams motionStream];
  v102[12] = v14;
  v15 = +[_DKSystemEventStreams bluetoothIsConnectedStream];
  v102[13] = v15;
  v16 = +[NSArray arrayWithObjects:v102 count:14];
  [(id)qword_1001C4240 setObject:v16 forKeyedSubscript:@"dasdDataCollection"];

  id v69 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.datacollectiontasks"];
  id v17 = [v69 integerForKey:@"chosenForSubmission"];
  if (v17 == (id)2)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000F9B38();
    }
    goto LABEL_19;
  }
  if (v17 == (id)1)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000F9B04();
    }
    if (byte_1001C4250 != 1) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  if (v17)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_ERROR)) {
      sub_1000F9AC4();
    }
LABEL_19:
    uint64_t v19 = 0;
    goto LABEL_20;
  }
  if (+[_DASConfig isInternalBuild]) {
    uint32_t v18 = 7;
  }
  else {
    uint32_t v18 = dword_1001C2E50;
  }
  uint64_t v19 = arc4random_uniform(v18);
  if (v19 == 1) {
    v20 = &off_1001870D8;
  }
  else {
    v20 = &off_1001870F0;
  }
  [v69 setObject:v20 forKey:@"chosenForSubmission"];
  +[NSDate timeIntervalSinceReferenceDate];
  v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v69 setObject:v21 forKey:@"dateOfChoosing"];

LABEL_20:
  if (byte_1001C4250)
  {
LABEL_21:
    v22 = qword_1001C4248;
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Forcing device to be picked for data collection", buf, 2u);
    }
    goto LABEL_24;
  }
  if (v19 == 1)
  {
LABEL_24:
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_1000864D8;
    v93[3] = &unk_100177030;
    v93[4] = a1;
    [(id)qword_1001C4238 enumerateKeysAndObjectsUsingBlock:v93];
    int v82 = 1;
    uint64_t v19 = 1;
    goto LABEL_25;
  }
  int v82 = 0;
LABEL_25:
  id v71 = objc_alloc_init((Class)NSMutableDictionary);
  v23 = qword_1001C4248;
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
    sub_1000F9A4C(v23, v24, v25, v26, v27, v28, v29, v30);
  }
  id v31 = qword_1001C4248;
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
    sub_1000F99E0(v19, v31, v32, v33, v34, v35, v36, v37);
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = (id)qword_1001C4240;
  id v73 = [obj countByEnumeratingWithState:&v89 objects:v101 count:16];
  if (v73)
  {
    uint64_t v72 = *(void *)v90;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v90 != v72)
        {
          uint64_t v39 = v38;
          objc_enumerationMutation(obj);
          uint64_t v38 = v39;
        }
        uint64_t v74 = v38;
        uint64_t v77 = *(void *)(*((void *)&v89 + 1) + 8 * v38);
        v40 = [qword_1001C4240 objectForKey:x0];
        id v41 = objc_alloc_init((Class)NSMutableArray);
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v84 = v40;
        id v42 = [v84 countByEnumeratingWithState:&v85 objects:v100 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v86;
          do
          {
            for (i = 0; i != v42; i = (char *)i + 1)
            {
              if (*(void *)v86 != v43) {
                objc_enumerationMutation(v84);
              }
              v45 = *(void **)(*((void *)&v85 + 1) + 8 * i);
              v46 = (void *)qword_1001C4228;
              v47 = [v45 name];
              v48 = [v46 objectForKeyedSubscript:v47];

              if (v48)
              {
                uint32_t v49 = arc4random_uniform((uint32_t)[v48 unsignedIntValue]);
                if ((uint64_t)[v48 integerValue] >= 2 && v49 == 1)
                {
                  if (byte_1001C4250 == 1) {
                    goto LABEL_51;
                  }
                }
                else
                {
                  id v51 = [v48 integerValue];
                  if ((byte_1001C4250 & 1) == 0)
                  {
                    if (v51 != (id)1) {
                      goto LABEL_60;
                    }
                    goto LABEL_53;
                  }
LABEL_51:
                  v55 = (void *)qword_1001C4248;
                  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_INFO))
                  {
                    v56 = v55;
                    v57 = [v45 name];
                    *(_DWORD *)buf = 138412290;
                    v95 = v57;
                    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Forcing stream collection %@", buf, 0xCu);
                  }
                }
LABEL_53:
                v58 = [v45 name];
                v59 = +[_DKSystemEventStreams bluetoothIsConnectedStream];
                v60 = [v59 name];
                unsigned int v61 = [v58 isEqualToString:v60];

                if (v61
                  && (v62 = objc_opt_class(),
                      +[_DKKnowledgeStore knowledgeStore],
                      v63 = objc_claimAutoreleasedReturnValue(),
                      [v62 computeUsageCorrelationBetweenAirPodsAMPStreamsWithStore:v63],
                      double v65 = v64,
                      v63,
                      v65 > *(double *)&qword_1001C2E40))
                {
                  v66 = (id)qword_1001C4248;
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                  {
                    v67 = [v45 name];
                    sub_1000F998C(v67, v98, &v99, v66);
                  }
                }
                else
                {
                  [v41 addObject:v45];
                  v52 = (void *)qword_1001C4248;
                  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_49;
                  }
                }
                goto LABEL_60;
              }
              if (v82)
              {
                [v41 addObject:v45];
                v52 = (void *)qword_1001C4248;
                if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG))
                {
LABEL_49:
                  v53 = v52;
                  v54 = [v45 name];
                  *(_DWORD *)buf = 138412546;
                  v95 = v54;
                  __int16 v96 = 2112;
                  uint64_t v97 = v77;
                  _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "experimentsToWrite: Added stream: %@ to experiment %@", buf, 0x16u);
                }
              }
LABEL_60:
            }
            id v42 = [v84 countByEnumeratingWithState:&v85 objects:v100 count:16];
          }
          while (v42);
        }

        if ([v41 count]) {
          [v71 setObject:v41 forKeyedSubscript:v77];
        }

        uint64_t v38 = v74 + 1;
      }
      while ((id)(v74 + 1) != v73);
      id v73 = [obj countByEnumeratingWithState:&v89 objects:v101 count:16];
    }
    while (v73);
  }

  return v71;
}

+ (char)writeExperiments:(id)a3 atFileName:(id)a4 withTask:(id)a5
{
  id v73 = a3;
  id v8 = a4;
  id v74 = a5;
  id v80 = a1;
  id v71 = v8;
  id v84 = [a1 handleForFilename:v8];
  if (v84)
  {
    v70 = [@"[" dataUsingEncoding:4];
    [v84 writeData:v70];
    id v69 = [@"{" dataUsingEncoding:4];
    [v84 writeData:v69];
    v75 = [@"," dataUsingEncoding:4];
    v103[4] = &v104;
    uint64_t v104 = 0;
    v105 = &v104;
    uint64_t v106 = 0x2020000000;
    char v107 = 0;
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_10008721C;
    v103[3] = &unk_100175628;
    [v74 setExpirationHandler:v103];
    id v72 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.datacollectiontasks"];
    uint64_t v9 = [v72 objectForKey:@"lastWritten"];
    id v10 = [v9 mutableCopy];
    v11 = (void *)qword_1001C4258;
    qword_1001C4258 = (uint64_t)v10;

    uint64_t v12 = qword_1001C4258;
    v13 = qword_1001C4248;
    BOOL v14 = os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v115 = qword_1001C4258;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Last written info found: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Last written info not found, proceeding", buf, 2u);
      }
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      v16 = (void *)qword_1001C4258;
      qword_1001C4258 = (uint64_t)v15;
    }
    v81 = +[NSMutableArray array];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id obj = v73;
    id v17 = [obj countByEnumeratingWithState:&v99 objects:v119 count:16];
    if (v17)
    {
      uint64_t v85 = 0;
      uint64_t v78 = *(void *)v100;
      *(void *)&long long v18 = 138412290;
      long long v68 = v18;
      while (2)
      {
        id v76 = v17;
        for (i = 0; i != v76; i = (char *)i + 1)
        {
          if (*(void *)v100 != v78) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v99 + 1) + 8 * i);
          v21 = [obj objectForKeyedSubscript:v20];
          v22 = [v80 writeExperiment:v20 withStreams:v21 toFileHandle:v84 withLastWrittenInfo:qword_1001C4258];

          [v81 addObjectsFromArray:v22];
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v23 = v22;
          id v24 = [v23 countByEnumeratingWithState:&v95 objects:v118 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v96;
            while (2)
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v96 != v25) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v27 = *(void **)(*((void *)&v95 + 1) + 8 * (void)j);
                uint64_t v28 = [v27 objectForKeyedSubscript:@"writeState" v68];
                if (v28)
                {
                  uint64_t v29 = [v27 objectForKeyedSubscript:@"writeState"];
                  BOOL v30 = [v29 unsignedIntValue] == 0;

                  if (v30)
                  {

                    uint64_t v32 = +[NSDate date];
                    [(id)qword_1001C4258 setObject:v32 forKeyedSubscript:v20];
                    uint64_t v33 = qword_1001C4248;
                    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v115 = v20;
                      __int16 v116 = 2112;
                      uint64_t v117 = qword_1001C4258;
                      _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Wrote experiment %@, updating lastWrittenInfo : %@", buf, 0x16u);
                    }
                    if ((v85 & 0x8000000000000000) == 0) {
                      [v84 writeData:v75];
                    }

                    ++v85;
                    goto LABEL_32;
                  }
                }
              }
              id v24 = [v23 countByEnumeratingWithState:&v95 objects:v118 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }

          id v31 = qword_1001C4248;
          if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v68;
            uint64_t v115 = v20;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Couldn't write experiment %@", buf, 0xCu);
          }
LABEL_32:

          if (*((unsigned char *)v105 + 24))
          {
            if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
              sub_1000F9D90();
            }
            goto LABEL_39;
          }
        }
        id v17 = [obj countByEnumeratingWithState:&v99 objects:v119 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v85 = 0;
    }
LABEL_39:

    if (*((unsigned char *)v105 + 24) || !v85)
    {
      [v84 truncateFileAtOffset:0, v68];
      [v84 closeFile];
      if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
        sub_1000F9C2C();
      }
      if (!*((unsigned char *)v105 + 24)) {
        [v72 setObject:&off_1001870C0 forKey:@"chosenForSubmission"];
      }
      LOBYTE(v85) = 0;
    }
    else
    {
      [v80 replaceJSONDataWithNull:v75 atWriteHandle:v84];
      uint64_t v34 = [@"}," dataUsingEncoding:4];
      [v84 writeData:v34];
      v79 = (void *)v34;
      uint64_t v35 = +[NSJSONSerialization dataWithJSONObject:&off_100187B68 options:0 error:0];
      [v84 writeData:v35];
      uint64_t v77 = (void *)v35;
      id obja = [@"]" dataUsingEncoding:4];
      [v84 writeData:obja];
      uint64_t v36 = [@"\n" dataUsingEncoding:4];
      [v84 writeData:v36];

      [v84 closeFile];
      [v72 setObject:&off_1001870C0 forKey:@"chosenForSubmission"];
      uint64_t v37 = objc_opt_class();
      CFStringRef v112 = @"context";
      v113 = v81;
      uint64_t v38 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
      unint64_t v39 = (unint64_t)[v37 writeToFileWithContextDictionary:v38];

      BOOL v40 = os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG);
      if ((v39 & 0xFFFFFFFFFFFFFFFELL) == 0x50)
      {
        if (v40) {
          sub_1000F9D28();
        }
        id v41 = qword_1001C4248;
        if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
          sub_1000F9CB0(v41, v42, v43, v44, v45, v46, v47, v48);
        }
        [v72 setObject:qword_1001C4258 forKey:@"lastWritten" v68];
        uint32_t v49 = (id)qword_1001C4248;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v50 = [v72 objectForKey:@"lastWritten"];
          sub_1000F9C60(v50, (uint64_t)buf, v49);
        }
      }
      else
      {
        if (v40) {
          sub_1000F9D5C();
        }
        LOBYTE(v85) = 0;
      }
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v51 = v81;
      id v52 = [v51 countByEnumeratingWithState:&v91 objects:v111 count:16];
      if (v52)
      {
        uint64_t v53 = *(void *)v92;
        do
        {
          for (k = 0; k != v52; k = (char *)k + 1)
          {
            if (*(void *)v92 != v53) {
              objc_enumerationMutation(v51);
            }
            v55 = *(void **)(*((void *)&v91 + 1) + 8 * (void)k);
            v56 = [v55 valueForKey:@"writeState" inState:v68];
            BOOL v57 = [v56 integerValue] == 0;

            if (v57)
            {
              v58 = +[NSNumber numberWithUnsignedInteger:v39];
              [v55 setObject:v58 forKeyedSubscript:@"writeState"];
            }
          }
          id v52 = [v51 countByEnumeratingWithState:&v91 objects:v111 count:16];
        }
        while (v52);
      }

      v59 = +[NSMutableDictionary dictionary];
      [v59 setObject:@"METAINFO" forKeyedSubscript:@"streamName"];
      [v59 setObject:@"METAINFO" forKeyedSubscript:@"experimentName"];
      v60 = +[NSNumber numberWithUnsignedInteger:v39];
      [v59 setObject:v60 forKeyedSubscript:@"writeState"];

      [v51 addObject:v59];
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v61 = v51;
      id v62 = [v61 countByEnumeratingWithState:&v87 objects:v110 count:16];
      if (v62)
      {
        uint64_t v63 = *(void *)v88;
        do
        {
          for (m = 0; m != v62; m = (char *)m + 1)
          {
            if (*(void *)v88 != v63) {
              objc_enumerationMutation(v61);
            }
            uint64_t v65 = *(void *)(*((void *)&v87 + 1) + 8 * (void)m);
            v66 = qword_1001C4248;
            if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v108 = 138412290;
              uint64_t v109 = v65;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "sending stream analytics to CA: %@", v108, 0xCu);
            }
            AnalyticsSendEventLazy();
          }
          id v62 = [v61 countByEnumeratingWithState:&v87 objects:v110 count:16];
        }
        while (v62);
      }
    }
    _Block_object_dispose(&v104, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_ERROR)) {
      sub_1000F9BEC();
    }
    LOBYTE(v85) = 0;
  }

  return v85;
}

+ (id)writeExperiment:(id)a3 withStreams:(id)a4 toFileHandle:(id)a5 withLastWrittenInfo:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v80 = +[_DKKnowledgeStore knowledgeStore];
  id v83 = +[NSMutableArray array];
  v81 = +[_DKQuery predicateForEventsWithMinimumDuration:0.0];
  int v82 = v9;
  uint64_t v14 = [v12 objectForKeyedSubscript:v9];
  id v15 = (id)v14;
  id v72 = v13;
  if (byte_1001C4250 == 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000F9FF8();
    }
  }
  else if (v14)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA094();
    }
    v16 = +[NSDate date];
    [v16 timeIntervalSinceDate:v15];
    if (v17 >= (double)(86400 * qword_1001C2E58))
    {
      long long v18 = +[_DKQuery predicateForEventsWithStartDateAfter:v15];
      v104[0] = v18;
      v104[1] = v81;
      uint64_t v19 = +[NSArray arrayWithObjects:v104 count:2];
      uint64_t v20 = +[NSCompoundPredicate andPredicateWithSubpredicates:v19];

      v21 = &qword_1001C4000;
      v81 = (void *)v20;
      v13 = v72;
      goto LABEL_19;
    }
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA060();
    }
    id v52 = v83;
    id v60 = v83;
    goto LABEL_61;
  }
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
    sub_1000F9F90();
  }
  v22 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:1];
  v103 = v22;
  id v23 = +[NSArray arrayWithObjects:&v103 count:1];
  v16 = +[_DKEventQuery eventQueryWithPredicate:v81 eventStreams:v10 offset:0 limit:1 sortDescriptors:v23];

  id v92 = 0;
  uint64_t v19 = [v80 executeQuery:v16 error:&v92];
  id v15 = v92;
  if (v15 || ![v19 count])
  {
    id v24 = (void *)qword_1001C4248;
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_ERROR))
    {
      uint64_t v63 = v24;
      id v64 = [v19 count];
      *(_DWORD *)buf = 138412802;
      long long v94 = v16;
      __int16 v95 = 2112;
      id v96 = v15;
      __int16 v97 = 2048;
      id v98 = v64;
      _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "writeExperiment: query for oldest event %@ failed with err: %@ and event count %lu", buf, 0x20u);
    }
  }
  else
  {
    v54 = v19;
    v55 = [v19 firstObject];
    v56 = [v55 startDate];
    [v56 timeIntervalSinceNow];
    double v58 = v57;

    if (*(double *)&qword_1001C2E30 * 24.0 * 3600.0 < -v58)
    {
      uint64_t v19 = v54;
      v13 = v72;
      if (byte_1001C4250 != 1)
      {
        long long v18 = v16;
        v16 = 0;
        id v15 = 0;
        v21 = &qword_1001C4000;
        goto LABEL_19;
      }
LABEL_16:
      v21 = &qword_1001C4000;
      if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
        sub_1000F9EA8();
      }
      long long v18 = v16;
      v16 = v15;
      id v15 = 0;
LABEL_19:

      v16 = +[NSString stringWithFormat:@"\"%@\":{", v82];
      uint64_t v66 = [v16 dataUsingEncoding:4];
      [v11 writeData:];
      id v76 = [@"," dataUsingEncoding:4];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v25 = v10;
      id v26 = [v25 countByEnumeratingWithState:&v84 objects:v101 count:16];
      if (v26)
      {
        id v27 = v26;
        v67 = v16;
        id v68 = v12;
        id v65 = v15;
        id v70 = v10;
        uint64_t v77 = 0;
        uint64_t v28 = *(void *)v85;
        id v73 = v11;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v85 != v28) {
              objc_enumerationMutation(v25);
            }
            BOOL v30 = *(void **)(*((void *)&v84 + 1) + 8 * i);
            uint64_t v32 = [a1 writeStream:v30 toFileHandle:v11 withEventPredicate:v81 withStore:v80];
            [v32 setObject:v82 forKeyedSubscript:@"experimentName"];
            uint64_t v33 = v21[73];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              log = v33;
              id v74 = [v30 name];
              unint64_t v39 = [v32 objectForKeyedSubscript:@"writeState"];
              BOOL v40 = [v32 objectForKeyedSubscript:@"numberOfWrittenEvents"];
              *(_DWORD *)buf = 138413058;
              long long v94 = v82;
              __int16 v95 = 2112;
              id v96 = v74;
              __int16 v97 = 2112;
              id v98 = v39;
              __int16 v99 = 2112;
              long long v100 = v40;
              _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "writeExperiment: %@ : stream %@ written status: %@ written events: %@", buf, 0x2Au);

              id v11 = v73;
            }
            [v83 addObject:v32];
            uint64_t v34 = [v32 objectForKeyedSubscript:@"writeState"];
            unsigned int v35 = [v34 unsignedIntValue];

            if (v35)
            {
              v21 = &qword_1001C4000;
              uint64_t v36 = (void *)qword_1001C4248;
              if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v37 = v36;
                uint64_t v38 = [v30 name];
                *(_DWORD *)buf = 138412546;
                long long v94 = v82;
                __int16 v95 = 2112;
                id v96 = v38;
                _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "writeExperiment: %@ : stream %@ wasn't written", buf, 0x16u);

                v21 = &qword_1001C4000;
              }
            }
            else
            {
              v21 = &qword_1001C4000;
              if (v77 == -1)
              {
                uint64_t v77 = 0;
              }
              else
              {
                ++v77;
                [v11 writeData:v76];
              }
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v84 objects:v101 count:16];
        }
        while (v27);

        id v12 = v68;
        id v10 = v70;
        v13 = v72;
        id v15 = v65;
        v16 = v67;
        if (v77)
        {
          [a1 replaceJSONDataWithNull:v76 atWriteHandle:v11];
          id v41 = [@"}" dataUsingEncoding:4];
          [v11 writeData:v41];
          if (os_log_type_enabled((os_log_t)v21[73], OS_LOG_TYPE_DEBUG)) {
            sub_1000F9E2C();
          }

          uint64_t v42 = (void *)v66;
LABEL_57:
          id v52 = v83;
          id v59 = v83;

          goto LABEL_61;
        }
      }
      else
      {
      }
      uint64_t v42 = (void *)v66;
      [a1 replaceJSONDataWithNull:v66 atWriteHandle:v11];
      if (os_log_type_enabled((os_log_t)v21[73], OS_LOG_TYPE_DEBUG)) {
        sub_1000F9DC4();
      }
      goto LABEL_57;
    }
    id v62 = (void *)qword_1001C4248;
    uint64_t v19 = v54;
    v13 = v72;
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000F9EDC(v62, v19);
    }
  }
  if (byte_1001C4250) {
    goto LABEL_16;
  }
  id v69 = v12;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v71 = v10;
  id obja = v10;
  id v43 = [obja countByEnumeratingWithState:&v88 objects:v102 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v89;
    do
    {
      for (j = 0; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v89 != v45) {
          objc_enumerationMutation(obja);
        }
        uint64_t v47 = *(void **)(*((void *)&v88 + 1) + 8 * (void)j);
        uint64_t v48 = +[NSMutableDictionary dictionary];
        [v48 setObject:v82 forKeyedSubscript:@"experimentName"];
        uint32_t v49 = [v47 name];
        [v48 setObject:v49 forKeyedSubscript:@"streamName"];

        v50 = +[NSNumber numberWithBool:0];
        [v48 setObject:v50 forKeyedSubscript:@"enoughHistory"];

        id v51 = &off_100187120;
        if (!v15)
        {
          if (objc_msgSend(v19, "count", &off_100187120)) {
            id v51 = &off_100187138;
          }
          else {
            id v51 = &off_100187120;
          }
        }
        [v48 setObject:v51 forKeyedSubscript:@"writeState"];
        [v48 setObject:&off_100187150 forKeyedSubscript:@"numberOfWrittenEvents"];
        [v83 addObject:v48];
      }
      id v44 = [obja countByEnumeratingWithState:&v88 objects:v102 count:16];
    }
    while (v44);
  }

  id v52 = v83;
  id v53 = v83;

  id v12 = v69;
  id v10 = v71;
  v13 = v72;
LABEL_61:

  return v52;
}

+ (void)addCurrentStateToEvents:(id)a3 forEventStream:(id)a4
{
  id v32 = a3;
  id v5 = a4;
  v6 = +[_CDClientContext userContext];
  uint64_t v7 = +[NSMutableDictionary dictionary];
  id v8 = +[_CDContextQueries keyPathForInUseStatus];
  id v9 = +[_DKSystemEventStreams deviceActivityLevelStream];
  id v10 = [v9 name];
  [v7 setObject:v8 forKeyedSubscript:v10];

  id v11 = +[_CDContextQueries keyPathForPluginStatus];
  id v12 = +[_DKSystemEventStreams deviceIsPluggedInStream];
  v13 = [v12 name];
  [v7 setObject:v11 forKeyedSubscript:v13];

  uint64_t v14 = +[_CDContextQueries keyPathForBatteryLevel];
  id v15 = +[_DKSystemEventStreams deviceBatteryPercentageStream];
  v16 = [v15 name];
  [v7 setObject:v14 forKeyedSubscript:v16];

  double v17 = +[_CDContextQueries keyPathForDoNotDisturbStatus];
  long long v18 = +[_DKSystemEventStreams doNotDisturbStream];
  uint64_t v19 = [v18 name];
  [v7 setObject:v17 forKeyedSubscript:v19];

  uint64_t v20 = +[_CDContextualKeyPath keyPathWithKey:@"/charging/topOffCheckpoint"];
  [v7 setObject:v20 forKeyedSubscript:@"/charging/smartTopOffCheckpoint"];

  v21 = [v5 name];
  v22 = [v7 objectForKeyedSubscript:v21];

  if (v22)
  {
    id v23 = [v5 name];
    id v24 = [v7 objectForKeyedSubscript:v23];

    id v25 = +[NSDate date];
    id v26 = [v32 lastObject];
    id v27 = v26;
    if (v26) {
      [v26 endDate];
    }
    else {
    uint64_t v28 = [v25 dateByAddingTimeInterval:-2592000.0];
    }
    uint64_t v29 = [v6 objectForKeyedSubscript:v24];
    id v30 = [v29 integerValue];

    id v31 = +[_DKEvent eventWithStream:v5 startDate:v28 endDate:v25 categoryIntegerValue:v30 metadata:0];
    if (v31) {
      [v32 addObject:v31];
    }
  }
}

+ (id)writeStream:(id)a3 toFileHandle:(id)a4 withEventPredicate:(id)a5 withStore:(id)a6
{
  id v9 = a3;
  id v70 = a4;
  id v10 = a5;
  id v67 = a6;
  id v11 = +[NSMutableDictionary dictionary];
  id v12 = [v9 name];
  [v11 setObject:v12 forKeyedSubscript:@"streamName"];

  [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:@"enoughHistory"];
  [v11 setObject:&off_100187168 forKeyedSubscript:@"writeState"];
  [v11 setObject:&off_100187150 forKeyedSubscript:@"numberOfWrittenEvents"];
  v13 = [v9 name];
  uint64_t v14 = +[_DKSystemEventStreams deviceActivityLevelStream];
  id v15 = [v14 name];
  unsigned int v16 = [v13 isEqualToString:v15];

  if (v16)
  {
    double v17 = +[NSPredicate predicateWithFormat:@"value.integerValue != 0"];
    v93[0] = v17;
    v93[1] = v10;
    long long v18 = +[NSArray arrayWithObjects:v93 count:2];
    uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v18];

    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA15C();
    }
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v20 = [v9 name];
  v21 = +[_DKSystemEventStreams deviceIsLockedImputedStream];
  v22 = [v21 name];
  unsigned int v23 = [v20 isEqualToString:v22];

  if (v23)
  {
    double v17 = +[NSPredicate predicateWithFormat:@"value.integerValue != 0"];
    v92[0] = v17;
    v92[1] = v10;
    id v24 = +[NSArray arrayWithObjects:v92 count:2];
    uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v24];

    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA1FC();
    }
    goto LABEL_19;
  }
  id v25 = [v9 name];
  id v26 = +[_DKSystemEventStreams deviceLowPowerModeStream];
  id v27 = [v26 name];
  unsigned int v28 = [v25 isEqualToString:v27];

  if (v28)
  {
    double v17 = +[NSPredicate predicateWithFormat:@"value.integerValue != 0"];
    v91[0] = v17;
    v91[1] = v10;
    uint64_t v29 = +[NSArray arrayWithObjects:v91 count:2];
    uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v29];

    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA29C();
    }
    goto LABEL_19;
  }
  id v30 = [v9 name];
  id v31 = +[_DKSystemEventStreams defaultPairedDeviceNearbyStream];
  id v32 = [v31 name];
  unsigned int v33 = [v30 isEqualToString:v32];

  if (v33)
  {
    double v17 = +[NSPredicate predicateWithFormat:@"value.integerValue != 1"];
    v90[0] = v17;
    v90[1] = v10;
    uint64_t v34 = +[NSArray arrayWithObjects:v90 count:2];
    uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v34];

    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA33C();
    }
    goto LABEL_19;
  }
  unsigned int v35 = [v9 name];
  unsigned int v36 = [v35 isEqualToString:@"/system/TLC"];

  if (v36)
  {
    double v17 = +[NSPredicate predicateWithFormat:@"value.integerValue != 0"];
    v89[0] = v17;
    v89[1] = v10;
    uint64_t v37 = +[NSArray arrayWithObjects:v89 count:2];
    uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v37];

    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA3DC();
    }
    goto LABEL_19;
  }
  uint64_t v38 = [v9 name];
  unint64_t v39 = +[_DKSystemEventStreams motionStream];
  BOOL v40 = [v39 name];
  unsigned int v41 = [v38 isEqualToString:v40];

  if (v41)
  {
    double v17 = +[NSPredicate predicateWithFormat:@"value.integerValue != 1"];
    v88[0] = v17;
    v88[1] = v10;
    uint64_t v42 = +[NSArray arrayWithObjects:v88 count:2];
    uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v42];

    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA47C();
    }
    goto LABEL_19;
  }
  uint64_t v19 = v10;
LABEL_20:
  id v43 = [v9 name];
  id v69 = +[NSString stringWithFormat:@"\"%@\":[]", v43];

  id v44 = [v69 dataUsingEncoding:4];
  [v70 writeData:v44];
  id v45 = objc_alloc((Class)BMDKEventStream);
  uint64_t v46 = [v9 name];
  id v47 = [v45 initWithDKStreamIdentifier:v46 contentProtection:NSFileProtectionCompleteUntilFirstUserAuthentication];

  uint64_t v48 = [v47 publisherFromStartTime:0.0];
  uint32_t v49 = [v48 mapWithTransform:&stru_100177070];

  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_100088A0C;
  v85[3] = &unk_100177098;
  id v50 = v19;
  id v86 = v50;
  id v51 = [v49 filterWithIsIncluded:v85];

  id v52 = objc_alloc((Class)BPSCountWindowAssigner);
  id v53 = [objc_alloc((Class)BPSAggregator) initWithAccumulator:&__NSArray0__struct closure:&stru_1001770D8];
  id v54 = [v52 initWithCapacity:128 aggregator:v53];
  v55 = [v51 windowWithAssigner:v54];
  v56 = [v55 mapWithTransform:&stru_100177118];

  uint64_t v81 = 0;
  int v82 = &v81;
  uint64_t v83 = 0x2020000000;
  uint64_t v84 = 0;
  uint64_t v77 = 0;
  uint64_t v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 0;
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100088A2C;
  v71[3] = &unk_100177160;
  v75 = &v81;
  id v76 = a1;
  id v74 = &v77;
  id v57 = v70;
  id v72 = v57;
  id v58 = v9;
  id v73 = v58;
  id v59 = [v56 sinkWithCompletion:&stru_100177138 receiveInput:v71];
  id v60 = +[NSNumber numberWithUnsignedLongLong:v82[3]];
  [v11 setObject:v60 forKeyedSubscript:@"numberOfWrittenEvents"];

  if (v82[3])
  {
    id v61 = (id)qword_1001C4248;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      id v62 = +[NSNumber numberWithUnsignedLongLong:v82[3]];
      uint64_t v63 = [v58 name];
      sub_1000FA104(v62, v63, (uint64_t)v87);
    }

    [v11 setObject:&off_100187180 forKeyedSubscript:@"writeState"];
  }
  else
  {
    if (v78[3]) {
      [v11 setObject:&off_100187198 forKeyedSubscript:@"writeState"];
    }
    [a1 replaceJSONDataWithNull:v44 atWriteHandle:v57];
  }
  id v64 = v11;

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  return v64;
}

+ (void)replaceJSONDataWithNull:(id)a3 atWriteHandle:(id)a4
{
  id v5 = a4;
  v6 = [a3 length];
  uint64_t v7 = +[NSMutableData data];
  char v10 = 0;
  if (v6)
  {
    id v8 = v6;
    do
    {
      [v7 appendBytes:&v10 length:1];
      --v8;
    }
    while (v8);
  }
  id v9 = (char *)((unsigned char *)[v5 offsetInFile] - v6);
  [v5 seekToFileOffset:v9];
  [v5 writeData:v7];
  [v5 seekToFileOffset:v9];
}

+ (void)extendJSONArrayWithAnotherArray:(id)a3 toFileHandler:(id)a4 isPreviouslyEmpty:(BOOL)a5
{
  id v11 = a4;
  id v7 = a3;
  id v8 = [@"," dataUsingEncoding:4];
  [v11 seekToFileOffset:[v11 offsetInFile] - 1];
  id v9 = [v11 readDataOfLength:1];
  [v11 seekToFileOffset:((char *)[v11 offsetInFile]) - 1];
  if (!a5) {
    [v11 writeData:v8];
  }
  char v10 = [v7 subdataWithRange:1, (char *)[v7 length] - 2];

  [v11 writeData:v10];
  [v11 writeData:v9];
}

+ (id)fuzzedDateFromDate:(id)a3 forStreamName:(id)a4
{
  id v5 = a3;
  v6 = [(id)qword_1001C4220 objectForKeyedSubscript:a4];
  id v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = *(double *)&qword_1001C2E38;
  }
  [v5 timeIntervalSince1970];
  id v11 = +[NSDate dateWithTimeIntervalSince1970:v9 * floor(v10 / v9)];

  return v11;
}

+ (id)metadataWitDisallowedKeysRemoveForMedatata:(id)a3 forStreamName:(id)a4
{
  id v5 = a3;
  v6 = [(id)qword_1001C4230 objectForKeyedSubscript:a4];
  if ([v6 count])
  {
    id v7 = [v5 mutableCopy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 removeObjectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15];
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    id v13 = [v7 copy];
  }
  else
  {
    id v13 = v5;
  }

  return v13;
}

+ (BOOL)shouldExcludeEvent:(id)a3
{
  id v3 = a3;
  if ([v3 integerValue] == (id)8)
  {
    id v4 = [v3 stream];
    id v5 = +[_DKSystemEventStreams deviceActivityLevelStream];
    if ([v4 isEqual:v5])
    {
      v6 = [v3 endDate];
      id v7 = [v3 startDate];
      [v6 timeIntervalSinceDate:v7];
      double v9 = v8;

      if (v9 <= 1.0)
      {
        LOBYTE(v10) = 1;
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  uint64_t v11 = [v3 stream];
  id v12 = +[_DKSystemEventStreams bluetoothIsConnectedStream];
  if ([v11 isEqual:v12])
  {
    id v13 = [v3 metadata];
    uint64_t v14 = +[_DKBluetoothMetadataKey isAppleAudioDevice];
    long long v15 = [v13 objectForKeyedSubscript:v14];
    unsigned int v10 = [v15 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

LABEL_10:
  return v10;
}

+ (id)processEvents:(id)a3
{
  id v3 = a3;
  id v72 = objc_alloc_init((Class)NSMutableArray);
  if (!+[_DASConfig isInternalBuild]) {
    goto LABEL_13;
  }
  id v4 = [v3 firstObject];
  id v5 = [v4 stream];
  v6 = +[_DKSystemEventStreams deviceIsPluggedInStream];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    [v3 sortUsingComparator:&stru_1001771A0];
    double v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v9 = v3;
    id v10 = [v9 countByEnumeratingWithState:&v82 objects:v94 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v83;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v83 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          uint64_t v14 = objc_opt_new();
          long long v15 = [v13 startDate];
          long long v16 = [v13 endDate];
          id v17 = [v14 initWithStartDate:v15 endDate:v16];

          [v8 addObject:v17];
        }
        id v10 = [v9 countByEnumeratingWithState:&v82 objects:v94 count:16];
      }
      while (v10);
    }

    uint64_t v87 = 0;
    long long v88 = &v87;
    uint64_t v89 = 0x2050000000;
    long long v18 = (void *)qword_1001C4260;
    uint64_t v90 = qword_1001C4260;
    if (!qword_1001C4260)
    {
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472;
      v86[2] = sub_10008D6CC;
      v86[3] = &unk_100175628;
      v86[4] = &v87;
      sub_10008D6CC((uint64_t)v86);
      long long v18 = (void *)v88[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v87, 8);
    id v70 = [v19 loIAtBeginningAndEndOfIntervals:v8];
  }
  else
  {
LABEL_13:
    id v70 = 0;
  }
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v3;
  id v75 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
  if (v75)
  {
    uint64_t v71 = 0;
    uint64_t v74 = *(void *)v79;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v79 != v74) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v78 + 1) + 8 * (void)v20);
        if (([(id)objc_opt_class() shouldExcludeEvent:v21] & 1) == 0)
        {
          unsigned int v23 = [v21 stream];
          id v24 = [v23 name];

          id v25 = objc_opt_class();
          id v26 = [v21 startDate];
          uint64_t v77 = [v25 fuzzedDateFromDate:v26 forStreamName:v24];

          id v27 = objc_opt_class();
          unsigned int v28 = [v21 endDate];
          id v76 = [v27 fuzzedDateFromDate:v28 forStreamName:v24];

          v91[0] = @"start";
          uint64_t v29 = [v21 timeZone];
          [v77 timeIntervalSince1970WithTimeZoneOffset:[v29 secondsFromGMT]];
          id v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v92[0] = v30;
          v91[1] = @"end";
          id v31 = [v21 timeZone];
          [v76 timeIntervalSince1970WithTimeZoneOffset:[v31 secondsFromGMT]];
          id v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          void v91[2] = @"stream";
          v92[1] = v32;
          void v92[2] = v24;
          unsigned int v33 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:3];
          id v34 = [v33 mutableCopy];

          unsigned int v35 = [v21 stream];
          unsigned int v36 = +[_DKSystemEventStreams nextEventForTopOffProtectionStream];
          LODWORD(v30) = [v35 isEqual:v36];

          if (v30)
          {
            [v21 doubleValue];
            double v38 = v37;
            unint64_t v39 = [v21 timeZone];
            BOOL v40 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v38 + (double)(uint64_t)[v39 secondsFromGMT]);
            [v34 setObject:v40 forKeyedSubscript:@"value"];

LABEL_39:
            goto LABEL_40;
          }
          unsigned int v41 = [v21 stream];
          uint64_t v42 = +[_DKSystemEventStreams nextEventForTopOffProtectionStream];
          unsigned int v43 = [v41 isEqual:v42];

          if (v43)
          {
            [v21 doubleValue];
            uint64_t v44 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          }
          else
          {
            id v45 = [v21 stream];
            uint64_t v46 = [v45 name];
            unsigned int v47 = [v46 isEqual:@"/dasd/activityprofile"];

            if (v47) {
              [v21 stringValue];
            }
            else {
            uint64_t v44 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v21 integerValue]);
            }
          }
          uint64_t v48 = (void *)v44;
          [v34 setObject:v44 forKeyedSubscript:@"value"];

          uint32_t v49 = [v21 metadata];

          if (v49)
          {
            id v50 = objc_opt_class();
            id v51 = [v21 metadata];
            id v52 = [v50 metadataWitDisallowedKeysRemoveForMedatata:v51 forStreamName:v24];

            id v53 = [v21 stream];
            id v54 = [v53 name];
            LODWORD(v51) = [v54 isEqual:@"/dasd/activityprofile"];

            if (v51)
            {
              v55 = [v52 objectForKeyedSubscript:@"metadata"];
              BOOL v56 = v55 == 0;

              if (!v56)
              {
                uint64_t v57 = [v52 objectForKeyedSubscript:@"metadata"];

                id v58 = 0;
                id v52 = (void *)v57;
                goto LABEL_37;
              }
LABEL_36:
              id v58 = 0;
            }
            else
            {
              if (!+[_DASConfig isInternalBuild]) {
                goto LABEL_36;
              }
              id v59 = [obj firstObject];
              id v60 = [v59 stream];
              id v61 = +[_DKSystemEventStreams deviceIsPluggedInStream];
              unsigned int v62 = [v60 isEqual:v61];

              if (!v62) {
                goto LABEL_36;
              }
              id v63 = [v52 mutableCopy];
              id v64 = [v70 objectAtIndexedSubscript:v71];

              if (v64)
              {
                id v65 = [v70 objectAtIndexedSubscript:v71];
                uint64_t v66 = [v65 objectForKeyedSubscript:@"loi"];
                [v63 setObject:v66 forKeyedSubscript:@"loi"];
              }
              else
              {
                [v63 setObject:&stru_100179948 forKeyedSubscript:@"loi"];
              }
              id v58 = v63;

              ++v71;
              id v52 = v58;
            }
LABEL_37:
            [v34 addEntriesFromDictionary:v52];
          }
          [v72 addObject:v34];
          goto LABEL_39;
        }
LABEL_40:
        uint64_t v20 = (char *)v20 + 1;
      }
      while (v75 != v20);
      id v67 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
      id v75 = v67;
    }
    while (v67);
  }

  id v68 = (void *)qword_1001C4248;
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
    sub_1000FA5DC(v68, v72);
  }

  return v72;
}

+ (unint64_t)writeToFileWithContextDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[_DASTrialManager sharedInstance];
  id v5 = [v4 factorWithName:off_1001C2E28];
  v6 = v5;
  if (v5 && ([v5 doubleValue], v7 > 0.0) && (objc_msgSend(v6, "doubleValue"), v8 < 100.0))
  {
    [v6 doubleValue];
    unsigned int v10 = v9;
    uint64_t v11 = qword_1001C4248;
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA884(v10, v11);
    }
  }
  else
  {
    id v12 = qword_1001C4248;
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA810(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    unsigned int v10 = 10;
  }
  uint32_t v20 = arc4random_uniform(v10);
  if (byte_1001C4250 == 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA740();
    }
    if (byte_1001C4250)
    {
      id v21 = 0;
      goto LABEL_22;
    }
LABEL_21:
    int v25 = DRSubmitLog();
    id v21 = 0;
    if (!v25)
    {
      id v26 = (void *)qword_1001C4248;
      if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
        sub_1000FA6A4(v26, v21);
      }
      unint64_t v24 = 85;
      goto LABEL_28;
    }
LABEL_22:
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA670();
    }
    unint64_t v24 = 80;
LABEL_28:

    goto LABEL_29;
  }
  if (!v20) {
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
    sub_1000FA7DC();
  }
  unsigned int v22 = [(id)objc_opt_class() generateCRFile];
  BOOL v23 = os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG);
  if (v22)
  {
    if (v23) {
      sub_1000FA774();
    }
    unint64_t v24 = 81;
  }
  else
  {
    if (v23) {
      sub_1000FA7A8();
    }
    unint64_t v24 = 86;
  }
LABEL_29:

  return v24;
}

+ (BOOL)generateCRFile
{
  memset(&v34, 0, sizeof(v34));
  if (stat((const char *)[@"/var/mobile/Library/DuetActivityScheduler/dasd_data.json" UTF8String], &v34)|| (off_t st_size = v34.st_size, v34.st_size <= 0))
  {
    double v9 = qword_1001C4248;
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA90C(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_9;
  }
  int v3 = open((const char *)[@"/var/mobile/Library/DuetActivityScheduler/dasd_data.json" UTF8String], 0);
  if (v3 < 0)
  {
LABEL_9:
    unlink((const char *)[@"/var/mobile/Library/DuetActivityScheduler/dasd_data.json" UTF8String]);
LABEL_10:
    LOBYTE(v8) = 0;
    return v8;
  }
  int v4 = v3;
  id v5 = mmap(0, st_size, 1, 1, v3, 0);
  if (!v5)
  {
    uint64_t v17 = qword_1001C4248;
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000FA984(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    close(v4);
    goto LABEL_9;
  }
  v6 = v5;
  char v7 = OSAWriteLogForSubmission();
  munmap(v6, st_size);
  close(v4);
  if ((v7 & 1) == 0)
  {
    int v25 = qword_1001C4248;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG);
    if (!v8) {
      return v8;
    }
    sub_1000FA9FC(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_10;
  }
  LOBYTE(v8) = 1;
  return v8;
}

+ (void)generateUsageVectorRepresentationWithStreamAUsage:(id)a3 streamBUsage:(id)a4 outputRepresentationA:(id)a5 outputRepresentationB:(id)a6
{
  id v55 = a3;
  id v9 = a4;
  id v49 = a5;
  id v10 = a6;
  uint64_t v11 = +[NSDate distantPast];
  id v52 = v9;
  if ([v55 count])
  {
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    uint64_t v14 = 0;
    BOOL v56 = v10;
    while (v13 < (unint64_t)objc_msgSend(v9, "count", v49))
    {
      id v51 = v14;
      uint64_t v15 = [v55 objectAtIndexedSubscript:v12];
      uint64_t v16 = [v9 objectAtIndexedSubscript:v13];
      uint64_t v17 = [v15 startDate];
      uint64_t v18 = [v16 startDate];
      uint64_t v19 = [v17 earlierDate:v18];

      [v11 timeIntervalSinceDate:v19];
      id v53 = v19;
      if (v20 < 0.0)
      {
        id v21 = v19;

        uint64_t v11 = v21;
      }
      uint64_t v22 = [v15 endDate];
      uint64_t v23 = [v16 endDate];
      uint64_t v24 = [v22 earlierDate:v23];

      do
      {
        int v25 = v11;
        if ([v15 containsDate:v11]) {
          uint64_t v26 = &off_100187108;
        }
        else {
          uint64_t v26 = &off_100187150;
        }
        [v49 addObject:v26];
        if ([v16 containsDate:v11]) {
          uint64_t v27 = &off_100187108;
        }
        else {
          uint64_t v27 = &off_100187150;
        }
        [v56 addObject:v27];
        uint64_t v11 = [v11 dateByAddingTimeInterval:300.0];

        uint64_t v28 = [v15 endDate];
        [v11 timeIntervalSinceDate:v28];
        double v30 = v29;

        if (v30 >= 0.0) {
          ++v12;
        }
        uint64_t v31 = [v16 endDate];
        [v11 timeIntervalSinceDate:v31];
        double v33 = v32;

        if (v33 >= 0.0) {
          ++v13;
        }
        [v11 timeIntervalSinceDate:v24];
      }
      while (v34 < 0.0);

      uint64_t v14 = v24;
      id v9 = v52;
      id v10 = v56;
      if (v12 >= (unint64_t)[v55 count]) {
        goto LABEL_22;
      }
    }
    uint64_t v24 = v14;
  }
  else
  {
    uint64_t v24 = 0;
    unint64_t v13 = 0;
    unint64_t v12 = 0;
  }
LABEL_22:
  if (v12 >= (unint64_t)objc_msgSend(v55, "count", v49))
  {
    unsigned int v36 = v50;
  }
  else
  {
    unsigned int v35 = v55;
    unsigned int v36 = v50;
    do
    {
      id v54 = v24;
      double v37 = [v35 objectAtIndexedSubscript:v12];
      double v38 = [v37 startDate];
      uint64_t v39 = [v11 laterDate:v38];

      uint64_t v57 = v37;
      uint64_t v24 = [v37 endDate];

      uint64_t v11 = (void *)v39;
      do
      {
        BOOL v40 = v11;
        [v50 addObject:&off_100187108];
        [v10 addObject:&off_100187150];
        uint64_t v11 = [v11 dateByAddingTimeInterval:300.0];

        [v11 timeIntervalSinceDate:v24];
      }
      while (v41 < 0.0);
      ++v12;

      BOOL v42 = v12 >= (unint64_t)[v55 count];
      unsigned int v35 = v55;
    }
    while (!v42);
  }
  for (i = v52; v13 < (unint64_t)[v52 count]; i = v52)
  {
    id v58 = v24;
    uint64_t v44 = [i objectAtIndexedSubscript:v13];
    id v45 = [v44 startDate];
    uint64_t v46 = [v11 laterDate:v45];

    uint64_t v24 = [v44 endDate];

    uint64_t v11 = (void *)v46;
    do
    {
      unsigned int v47 = v11;
      [v36 addObject:&off_100187150];
      [v10 addObject:&off_100187108];
      uint64_t v11 = [v11 dateByAddingTimeInterval:300.0];

      [v11 timeIntervalSinceDate:v24];
    }
    while (v48 < 0.0);
    ++v13;
  }
}

+ (void)convertFocusModeStream:(id)a3 toKnowledgeStoreStream:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (uint64_t)+[BMPublicStreamUtilities streamForStreamIdentifier:v5];
  if (v7 && v7 < 40)
  {
    id v8 = [objc_alloc((Class)BMStoreStream) initWithPublicStream:v7];
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    id v9 = +[NSMutableArray array];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = sub_10008A7F8;
    v28[4] = sub_10008A808;
    id v29 = 0;
    id v10 = +[_DKEventStream eventStreamWithName:v6];
    uint64_t v11 = +[_DKKnowledgeStore knowledgeStore];
    unint64_t v12 = [v8 publisherFromStartTime:0.0];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10008A810;
    v23[3] = &unk_1001771E8;
    id v24 = v11;
    id v25 = v9;
    id v26 = v5;
    uint64_t v27 = v30;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10008A890;
    v17[3] = &unk_100177210;
    id v21 = v30;
    uint64_t v22 = v28;
    id v13 = v10;
    id v18 = v13;
    id v14 = v25;
    id v19 = v14;
    id v15 = v24;
    id v20 = v15;
    id v16 = [v12 sinkWithCompletion:v23 receiveInput:v17];

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);
  }
  else if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_ERROR))
  {
    sub_1000FAA74();
  }
}

+ (BOOL)convertBiomeStream:(id)a3 toKnowledgeStoreStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 isEqualToString:@"UserFocusComputedMode"];
  if (v8)
  {
    [a1 deleteEventsFromStream:v7];
    [a1 convertFocusModeStream:v6 toKnowledgeStoreStream:v7];
  }

  return v8;
}

+ (void)deleteConvertedStreams
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10008ABE4;
  v2[3] = &unk_100177030;
  v2[4] = a1;
  [(id)qword_1001C4238 enumerateKeysAndObjectsUsingBlock:v2];
}

+ (void)deleteEventsFromStream:(id)a3
{
  id v3 = a3;
  unint64_t v12 = (void *)os_transaction_create();
  int v4 = +[_DKKnowledgeStore knowledgeStore];
  while (1)
  {
    id v6 = +[NSPredicate predicateWithValue:1];
    id v7 = +[_DKEventStream eventStreamWithName:v3];
    id v13 = v7;
    unsigned int v8 = +[NSArray arrayWithObjects:&v13 count:1];
    id v9 = +[_DKEventQuery eventQueryWithPredicate:v6 eventStreams:v8 offset:0 limit:32 sortDescriptors:0];

    id v10 = [v4 executeQuery:v9 error:0];
    if (![v10 count]) {
      break;
    }
    [v4 deleteObjects:v10 error:0];
  }
}

+ (void)submitSystemTask:(id)a3
{
  id v3 = a3;
  int v4 = +[BGSystemTaskScheduler sharedScheduler];
  id v5 = [v3 identifier];
  id v6 = [v4 taskRequestForIdentifier:v5];

  if (!v6)
  {
    id v10 = +[BGSystemTaskScheduler sharedScheduler];
    id v12 = 0;
    uint64_t v11 = [v10 submitTaskRequest:v3 error:&v12];
    unsigned int v8 = v12;

    if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_ERROR)) {
      sub_1000FAB64();
    }
    goto LABEL_7;
  }
  id v7 = (void *)qword_1001C4248;
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = v7;
    id v9 = [v3 identifier];
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ task request already exists, backing out of resubmission", buf, 0xCu);

LABEL_7:
  }
}

+ (void)registerForDataCollectionTestNotification
{
  if (+[_DASConfig isInternalBuild])
  {
    int out_token = 0;
    id v3 = dispatch_get_global_queue(0, 0);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10008B040;
    v4[3] = &unk_100177250;
    v4[4] = a1;
    notify_register_dispatch("com.apple.dasd.dataCollectionTasks.testModeRun", &out_token, v3, v4);
  }
}

+ (void)schedule
{
  id v3 = +[BGSystemTaskScheduler sharedScheduler];
  uint64_t v4 = +[_DASDaemonLogger logForCategory:@"dataCollection"];
  id v5 = (void *)qword_1001C4248;
  qword_1001C4248 = v4;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10008B758;
  v22[3] = &unk_100177270;
  v22[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dataCollection" usingQueue:0 launchHandler:v22];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008B7B0;
  v21[3] = &unk_100177270;
  v21[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.analyticsReporting" usingQueue:0 launchHandler:v21];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10008B808;
  v20[3] = &unk_100177270;
  v20[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicBackgroundAppRefreshReporting" usingQueue:0 launchHandler:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10008B860;
  v19[3] = &unk_100177270;
  v19[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicBasic" usingQueue:0 launchHandler:v19];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008B8C8;
  v18[3] = &unk_100177270;
  v18[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicNetworking" usingQueue:0 launchHandler:v18];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008B930;
  v17[3] = &unk_100177270;
  void v17[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicPlugin" usingQueue:0 launchHandler:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008B998;
  v16[3] = &unk_100177270;
  v16[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicPluginWiFi" usingQueue:0 launchHandler:v16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008BA00;
  v15[3] = &unk_100177270;
  v15[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicInactivity" usingQueue:0 launchHandler:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008BA68;
  v14[3] = &unk_100177270;
  v14[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicInactivityPlugin" usingQueue:0 launchHandler:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008BAD0;
  v13[3] = &unk_100177270;
  v13[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicInactivityPluginWiFi" usingQueue:0 launchHandler:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008BB38;
  v12[3] = &unk_100177270;
  v12[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicUtilityBasic" usingQueue:0 launchHandler:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008BBA0;
  v11[3] = &unk_100177270;
  v11[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicUtilityNetworking" usingQueue:0 launchHandler:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008BC08;
  v10[3] = &unk_100177270;
  v10[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicUtilityPlugin" usingQueue:0 launchHandler:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008BC70;
  v9[3] = &unk_100177270;
  v9[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicUtilityPluginWiFi" usingQueue:0 launchHandler:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008BCD8;
  v8[3] = &unk_100177270;
  v8[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicUtilityInactivity" usingQueue:0 launchHandler:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008BD40;
  v7[3] = &unk_100177270;
  v7[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicUtilityInactivityPlugin" usingQueue:0 launchHandler:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008BDA8;
  v6[3] = &unk_100177270;
  v6[4] = a1;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.dailyPeriodicUtilityInactivityPluginWiFi" usingQueue:0 launchHandler:v6];
  [a1 scheduleDASTelemetryActivities];
}

+ (void)scheduleDASTelemetryActivities
{
  id v2 = +[_DASDataCollectionSUTask taskWithName:@"com.apple.dasd.dataCollectiontask.dummyAutoSU" intervalDuration:qword_1001C4248 withLogger:900.0];
  id v3 = +[_DASPolicyDataCollection sharedInstance];
  [v3 scheduleTelemetry];
}

+ (void)reportDataOnExperiments:(id)a3
{
  id v4 = a3;
  id v5 = qword_1001C4248;
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "schedule: Running data collection background task", v16, 2u);
  }
  [(id)objc_opt_class() loadParameters];
  id v6 = [(id)objc_opt_class() experimentsToWrite];
  id v7 = [v6 count];
  unsigned int v8 = qword_1001C4248;
  BOOL v9 = os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)id v16 = 138412290;
      *(void *)&v16[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "schedule: attempting to write experiments: %@", v16, 0xCu);
    }
    int v10 = [a1 writeExperiments:v6 atFileName:@"/var/mobile/Library/DuetActivityScheduler/dasd_data.json" withTask:v4];
    uint64_t v11 = qword_1001C4248;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_INFO);
    if (v10 < 1)
    {
      if (v12)
      {
        *(_WORD *)id v16 = 0;
        id v13 = "schedule: didn't write any experiment to crash reporter (CR)";
        id v14 = v11;
        uint32_t v15 = 2;
        goto LABEL_13;
      }
    }
    else if (v12)
    {
      *(_DWORD *)id v16 = 134218242;
      *(void *)&v16[4] = v10;
      *(_WORD *)&v16[12] = 2112;
      *(void *)&v16[14] = @"/var/mobile/Library/DuetActivityScheduler/dasd_data.json";
      id v13 = "schedule: wrote %lld experiments to crash reporter (CR) and %@";
      id v14 = v11;
      uint32_t v15 = 22;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, v16, v15);
    }
    [a1 deleteConvertedStreams:*(_OWORD *)v16, *(void *)&v16[16]];
    goto LABEL_15;
  }
  if (v9)
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "schedule: no experiments to write post sampling", v16, 2u);
  }
LABEL_15:
}

+ (void)reportBackgroundAppRefreshAnalytics:(id)a3
{
  id v17 = a3;
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
    sub_1000FAD14();
  }
  id v3 = +[_DASBARMetricRecorder sharedInstance];
  id v4 = [v3 fetchLatestBARMetric];

  id v5 = [v4 objectForKeyedSubscript:@"BgRefreshSubmissionCount"];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"BgRefreshSubmissionCount"];
  }
  else
  {
    id v6 = &off_100187150;
  }

  id v7 = [v4 objectForKeyedSubscript:@"BgRefreshCompletionCount"];
  if (v7)
  {
    unsigned int v8 = [v4 objectForKeyedSubscript:@"BgRefreshCompletionCount"];
  }
  else
  {
    unsigned int v8 = &off_100187150;
  }

  BOOL v9 = [v4 objectForKeyedSubscript:@"PushLaunchSubmissionCount"];
  if (v9)
  {
    int v10 = [v4 objectForKeyedSubscript:@"PushLaunchSubmissionCount"];
  }
  else
  {
    int v10 = &off_100187150;
  }

  uint64_t v11 = [v4 objectForKeyedSubscript:@"PushLaunchCompletionCount"];
  if (v11)
  {
    BOOL v12 = [v4 objectForKeyedSubscript:@"PushLaunchCompletionCount"];
  }
  else
  {
    BOOL v12 = &off_100187150;
  }

  v22[0] = @"BgRefreshSubmissionCount";
  v22[1] = @"BgRefreshCompletionCount";
  v23[0] = v6;
  v23[1] = v8;
  v22[2] = @"PushLaunchSubmissionCount";
  v22[3] = @"PushLaunchCompletionCount";
  v23[2] = v10;
  v23[3] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
  id v14 = qword_1001C4248;
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "sending BackgroundAppRefreshActivity analytics to CA: %@", buf, 0xCu);
  }
  id v19 = v13;
  id v15 = v13;
  AnalyticsSendEventLazy();
  id v16 = +[_DASBARMetricRecorder sharedInstance];
  [v16 resetBARMetric];
}

+ (void)reportWakeAnalytics:(id)a3
{
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
    sub_1000FAD48();
  }
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.appResume"];
  [v3 BOOLForKey:@"BGAppKillDemo"];
  AnalyticsSendEventLazy();
}

+ (int)boundedDurationFromDuration:(double)a3
{
  if (a3 < 1.0) {
    return 0;
  }
  double v4 = a3 / 60.0;
  if (v4 <= 5.0) {
    return 5;
  }
  if (v4 <= 15.0) {
    return 15;
  }
  if (v4 <= 30.0) {
    return 30;
  }
  if (v4 <= 60.0) {
    return 60;
  }
  if (v4 <= 120.0) {
    return 120;
  }
  if (v4 <= 240.0) {
    return 240;
  }
  if (v4 <= 480.0) {
    return 480;
  }
  if (v4 <= 720.0) {
    return 720;
  }
  if (v4 <= 1440.0) {
    return 1440;
  }
  if (v4 <= 2880.0) {
    return 2880;
  }
  if (v4 <= 10080.0) {
    return 10080;
  }
  return 20160;
}

+ (void)reportAnalyticsForActivity:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    context = v4;
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.dailyPeriodic"];
    id v6 = +[NSDate now];
    [v6 timeIntervalSinceReferenceDate];
    double v8 = v7;

    BOOL v9 = [v5 objectForKey:v3];
    int v10 = v9;
    if (v9)
    {
      [v9 doubleValue];
      double v12 = floor((v8 - v11) / 3600.0);
      if (v12 > 2.0) {
        double v12 = 100.0;
      }
    }
    else
    {
      double v12 = 0.0;
    }
    id v13 = +[NSNumber numberWithDouble:v8];
    [v5 setObject:v13 forKey:v3];

    id v14 = +[_CDClientContext userContext];
    id v15 = +[_CDContextQueries keyPathForBatteryLevel];
    id v16 = [v14 objectForKeyedSubscript:v15];

    uint64_t v31 = v5;
    if (v16)
    {
      [v16 doubleValue];
      id v18 = +[NSNumber numberWithInt:10 * vcvtmd_s64_f64(v17 / 10.0)];
    }
    else
    {
      id v18 = 0;
    }
    id v19 = +[_CDContextQueries keyPathForPluginStatus];
    id v20 = [v14 objectForKeyedSubscript:v19];

    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[_CDNetworkContext wifiQuality:v14]);
    id v21 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[_CDNetworkContext cellQuality:v14]);
    uint64_t v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    v36[0] = v3;
    v35[0] = @"Name";
    v35[1] = @"HoursSinceLastRun";
    if (v10)
    {
      uint64_t v23 = +[NSNumber numberWithDouble:v12];
    }
    else
    {
      uint64_t v23 = &off_1001871B0;
    }
    if (v18) {
      id v24 = v18;
    }
    else {
      id v24 = &off_1001871B0;
    }
    v36[1] = v23;
    v36[2] = v24;
    v35[2] = @"BatteryLevel";
    v35[3] = @"PluginStatus";
    if (v20) {
      id v25 = v20;
    }
    else {
      id v25 = &off_1001871B0;
    }
    if (v21) {
      id v26 = v21;
    }
    else {
      id v26 = &off_1001871B0;
    }
    v36[3] = v25;
    v36[4] = v26;
    v35[4] = @"WiFiQuality";
    v35[5] = @"CellQuality";
    if (v22) {
      uint64_t v27 = v22;
    }
    else {
      uint64_t v27 = &off_1001871B0;
    }
    v36[5] = v27;
    uint64_t v28 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:6];
    if (v10) {

    }
    id v29 = qword_1001C4248;
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v34 = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Reporting: %@", buf, 0xCu);
    }
    id v30 = v28;
    AnalyticsSendEventLazy();

    double v4 = context;
  }
}

+ (double)computeUsageCorrelationBetweenAirPodsAMPStreamsWithStore:(id)a3
{
  id v118 = a3;
  v119 = +[NSMutableArray array];
  v111 = +[NSMutableArray array];
  uint64_t v3 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:1];
  double v4 = +[_DKNowPlayingMetadataKey playing];
  id v5 = +[_DKEventQuery predicateForObjectsWithMetadataKey:v4 andIntegerValue:1];
  v138[0] = v5;
  id v6 = +[_DKQuery predicateForEventsWithStringValue:@"com.apple.Music"];
  v137[0] = v6;
  double v7 = +[_DKQuery predicateForEventsWithStringValue:@"com.apple.tv"];
  v137[1] = v7;
  double v8 = +[NSArray arrayWithObjects:v137 count:2];
  BOOL v9 = +[NSCompoundPredicate orPredicateWithSubpredicates:v8];
  v138[1] = v9;
  int v10 = +[NSArray arrayWithObjects:v138 count:2];
  uint64_t v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];

  double v12 = +[_DKSystemEventStreams nowPlayingStream];
  v136 = v12;
  id v13 = +[NSArray arrayWithObjects:&v136 count:1];
  v113 = (void *)v3;
  uint64_t v135 = v3;
  id v14 = +[NSArray arrayWithObjects:&v135 count:1];
  v120 = (void *)v11;
  id v15 = +[_DKEventQuery eventQueryWithPredicate:v11 eventStreams:v13 offset:0 limit:0 sortDescriptors:v14];

  [v15 setResultType:2];
  id v129 = 0;
  __int16 v116 = v15;
  id v16 = [v118 executeQuery:v15 error:&v129];
  id v114 = v129;
  if (v114)
  {
    double v17 = +[_DASDaemonLogger logForCategory:@"dataCollection"];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000FAE88();
    }
  }
  else if ([v16 count])
  {
    unint64_t v18 = 0;
    do
    {
      id v19 = [v16 objectAtIndexedSubscript:v18];
      id v20 = [v19 startDate];
      [v20 timeIntervalSince1970];
      uint64_t v22 = +[NSDate dateWithTimeIntervalSince1970:floor(v21 / 300.0) * 300.0];

      uint64_t v23 = [v16 objectAtIndexedSubscript:v18];
      id v24 = [v23 endDate];
      [v24 timeIntervalSince1970];
      id v26 = +[NSDate dateWithTimeIntervalSince1970:floor(v25 / 300.0) * 300.0];

      if (++v18 < (unint64_t)[v16 count])
      {
        while (1)
        {
          uint64_t v27 = [v16 objectAtIndexedSubscript:v18];
          uint64_t v28 = [v27 startDate];
          [v28 timeIntervalSince1970];
          id v30 = +[NSDate dateWithTimeIntervalSince1970:floor(v29 / 300.0) * 300.0];

          [v30 timeIntervalSinceDate:v26];
          if (v31 >= 5.0) {
            break;
          }
          double v32 = [v16 objectAtIndexedSubscript:v18];
          double v33 = [v32 endDate];
          [v33 timeIntervalSince1970];
          unsigned int v35 = +[NSDate dateWithTimeIntervalSince1970:floor(v34 / 300.0) * 300.0];

          ++v18;
          id v26 = v35;
          if (v18 >= (unint64_t)[v16 count]) {
            goto LABEL_13;
          }
        }
      }
      unsigned int v35 = v26;
LABEL_13:
      id v36 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v22 endDate:v35];
      [v119 addObject:v36];
    }
    while (v18 < (unint64_t)[v16 count]);
  }

  if (v114)
  {
    double v37 = 1.79769313e308;
    double v38 = v111;
  }
  else
  {
    uint64_t v39 = +[_DASDaemonLogger logForCategory:@"dataCollection"];
    double v38 = v111;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      sub_1000FAEF0();
    }

    double v40 = (double)(unint64_t)[v119 count];
    if (*(double *)&qword_1001C2E48 <= v40)
    {
      CFStringRef v112 = +[_DKQuery predicateForEventsWithIntegerValue:1];
      BOOL v42 = +[NSMutableArray array];
      uint64_t v43 = 0;
      char contexta = 0;
      v121 = v42;
      do
      {
        uint64_t v44 = +[_DKSystemEventStreams bluetoothIsConnectedStream];
        v134 = v44;
        id v45 = +[NSArray arrayWithObjects:&v134 count:1];
        v133 = v113;
        uint64_t v46 = +[NSArray arrayWithObjects:&v133 count:1];
        unsigned int v47 = +[_DKEventQuery eventQueryWithPredicate:v112 eventStreams:v45 offset:v43 limit:256 sortDescriptors:v46];

        id v128 = 0;
        double v48 = [v118 executeQuery:v47 error:&v128];
        id v49 = v128;
        if (v49)
        {
          char v107 = v49;
          v108 = +[_DASDaemonLogger logForCategory:@"dataCollection"];
          double v38 = v111;
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
            sub_1000FAE88();
          }

          double v37 = 1.79769313e308;
          goto LABEL_62;
        }
        uint64_t v115 = v47;
        uint64_t v117 = v43;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v50 = v48;
        id v51 = [v50 countByEnumeratingWithState:&v124 objects:v132 count:16];
        if (v51)
        {
          id v52 = v51;
          uint64_t v53 = *(void *)v125;
          do
          {
            for (i = 0; i != v52; i = (char *)i + 1)
            {
              if (*(void *)v125 != v53) {
                objc_enumerationMutation(v50);
              }
              id v55 = *(void **)(*((void *)&v124 + 1) + 8 * i);
              BOOL v56 = [v55 metadata];
              uint64_t v57 = +[_DKBluetoothMetadataKey isAppleAudioDevice];
              id v58 = [v56 objectForKeyedSubscript:v57];
              unsigned int v59 = [v58 BOOLValue];

              if (v59)
              {
                id v60 = [v55 metadata];
                id v61 = +[_DKBluetoothMetadataKey productID];
                unsigned int v62 = [v60 objectForKeyedSubscript:v61];
                id v63 = (char *)[v62 unsignedIntegerValue];

                if ((unint64_t)(v63 - 8194) <= 0x22
                  && ((1 << (v63 - 2)) & 0x452863001) != 0)
                {
                  id v65 = objc_alloc((Class)NSDateInterval);
                  uint64_t v66 = [v55 startDate];
                  [v66 timeIntervalSince1970];
                  id v68 = +[NSDate dateWithTimeIntervalSince1970:floor(v67 / 300.0) * 300.0];
                  id v69 = [v55 endDate];
                  [v69 timeIntervalSince1970];
                  uint64_t v71 = +[NSDate dateWithTimeIntervalSince1970:floor(v70 / 300.0) * 300.0];
                  id v72 = [v65 initWithStartDate:v68 endDate:v71];
                  [v121 addObject:v72];
                }
                char contexta = 1;
              }
            }
            id v52 = [v50 countByEnumeratingWithState:&v124 objects:v132 count:16];
          }
          while (v52);
        }

        id v73 = [v50 count];
        uint64_t v43 = v117 + 256;
        BOOL v42 = v121;
      }
      while (v73 == (id)256);
      double v38 = v111;
      if ([v121 count])
      {
        unint64_t v74 = 0;
        do
        {
          id v75 = [v121 objectAtIndexedSubscript:v74];
          id v76 = [v75 startDate];
          [v76 timeIntervalSince1970];
          long long v78 = +[NSDate dateWithTimeIntervalSince1970:floor(v77 / 300.0) * 300.0];

          long long v79 = [v121 objectAtIndexedSubscript:v74];
          long long v80 = [v79 endDate];
          [v80 timeIntervalSince1970];
          long long v82 = +[NSDate dateWithTimeIntervalSince1970:floor(v81 / 300.0) * 300.0];

          if (++v74 < (unint64_t)[v121 count])
          {
            while (1)
            {
              long long v83 = [v121 objectAtIndexedSubscript:v74];
              long long v84 = [v83 startDate];
              [v84 timeIntervalSince1970];
              id v86 = +[NSDate dateWithTimeIntervalSince1970:floor(v85 / 300.0) * 300.0];

              [v86 timeIntervalSinceDate:v82];
              if (v87 >= 5.0) {
                break;
              }
              long long v88 = [v121 objectAtIndexedSubscript:v74];
              uint64_t v89 = [v88 endDate];
              [v89 timeIntervalSince1970];
              long long v91 = +[NSDate dateWithTimeIntervalSince1970:floor(v90 / 300.0) * 300.0];

              ++v74;
              long long v82 = v91;
              if (v74 >= (unint64_t)[v121 count]) {
                goto LABEL_47;
              }
            }
          }
          long long v91 = v82;
LABEL_47:
          id v92 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v78 endDate:v91];
          [v111 addObject:v92];
        }
        while (v74 < (unint64_t)[v121 count]);
      }

      if ([v111 count])
      {
        long long v93 = +[_DASDaemonLogger logForCategory:@"dataCollection"];
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG)) {
          sub_1000FAE20();
        }

        long long v94 = +[NSMutableArray array];
        __int16 v95 = +[NSMutableArray array];
        [(id)objc_opt_class() generateUsageVectorRepresentationWithStreamAUsage:v119 streamBUsage:v111 outputRepresentationA:v94 outputRepresentationB:v95];
        double v37 = 1.0;
        if (([v94 isEqual:v95] & 1) == 0)
        {
          [v94 cooccurrencesWith:v95];
          double v37 = v96;
          __int16 v97 = +[_DASDaemonLogger logForCategory:@"dataCollection"];
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG)) {
            sub_1000FADB0(v97, v98, v99, v100, v101, v102, v103, v104);
          }

          CFStringRef v130 = @"Correlation";
          v105 = +[NSNumber numberWithDouble:v37];
          v131 = v105;
          uint64_t v106 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
          AnalyticsSendEvent();
        }
      }
      else if (contexta)
      {
        double v37 = 0.0;
      }
      else
      {
        double v37 = 1.79769313e308;
      }
    }
    else
    {
      double v41 = +[_DASDaemonLogger logForCategory:@"dataCollection", v40, *(double *)&qword_1001C2E48];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        sub_1000FAD7C();
      }

      double v37 = 0.0;
    }
  }
LABEL_62:

  return v37;
}

@end