@interface _DASPPSDataManager
+ (id)sharedInstance;
- (BOOL)sendDataToPPS:(id)a3 ppsID:(PPSTelemetryIdentifier *)a4;
- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5;
- (NSMutableDictionary)mediaanalysisProgressMapping;
- (NSMutableDictionary)ppsIDMapping;
- (OS_os_log)log;
- (PPSTelemetryIdentifier)ppsIDForSubsystem:(id)a3 category:(id)a4;
- (_DASPPSDataManager)init;
- (id)filterTimeSeriesByFeatureCodes:(id)a3 timeSeries:(id)a4;
- (id)filterTimeSeriesByTaskIdentifiers:(id)a3 timeSeries:(id)a4;
- (id)filterTimeSeriesByTimeFilter:(id)a3 timeSeries:(id)a4;
- (id)getPPSData:(id)a3 filepath:(id)a4 error:(id *)a5;
- (id)getPPSHistogram:(id)a3 category:(id)a4 valueFilter:(id)a5 dimensions:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9;
- (id)getPPSTimeIntervalSet:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9;
- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9;
- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 limitCount:(unint64_t)a8 offsetCount:(unint64_t)a9 filepath:(id)a10 error:(id *)a11;
- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 limitCount:(unint64_t)a8 offsetCount:(unint64_t)a9 readDirection:(unint64_t)a10 filepath:(id)a11 error:(id *)a12;
- (id)getTaskDependencyGraphs:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)loadBuddyData:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)loadConfig:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)loadFeatureCheckpoints:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (id)loadIntensiveTaskBlockingReasons:(id)a3 metrics:(id)a4 filepath:(id)a5;
- (id)loadTaskBlockingReasons:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (id)loadTaskCheckpoints:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (id)loadTaskDependencies:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (id)loadTaskDependencyGraph:(id)a3 timeFilter:(id)a4 filepath:(id)a5;
- (id)loadTaskProgress:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (id)loadTasksForFeatures:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6;
- (void)setLog:(id)a3;
- (void)setMediaanalysisProgressMapping:(id)a3;
- (void)setPpsIDMapping:(id)a3;
@end

@implementation _DASPPSDataManager

- (BOOL)sendDataToPPS:(id)a3 ppsID:(PPSTelemetryIdentifier *)a4
{
  id v6 = a3;
  if (!v6)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000F5BA0(log, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_10;
  }
  v7 = self->_log;
  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_1000F5BD8(v7, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_10:
    BOOL v8 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000F5C10((uint64_t)v6, v7);
  }
  PPSSendTelemetry();
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (PPSTelemetryIdentifier)ppsIDForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(_DASPPSDataManager *)self ppsIDMapping];
  objc_sync_enter(v8);
  v9 = +[NSString stringWithFormat:@"%@-%@", v6, v7];
  uint64_t v10 = [(_DASPPSDataManager *)self ppsIDMapping];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  uint64_t v24 = 0;
  if (v11)
  {
    [v11 getValue:&v24 size:8];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Creating PPS ID for %@", buf, 0xCu);
    }
    uint64_t v24 = PPSCreateTelemetryIdentifier();
    if (v24)
    {
      uint64_t v11 = +[NSValue value:&v24 withObjCType:"^{PPSTelemetryIdentifier=}"];
      uint64_t v13 = [(_DASPPSDataManager *)self ppsIDMapping];
      [v13 setObject:v11 forKeyedSubscript:v9];
    }
    else
    {
      uint64_t v14 = self->_log;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        sub_1000F5AF0(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      uint64_t v11 = 0;
    }
  }
  uint64_t v22 = (PPSTelemetryIdentifier *)v24;

  objc_sync_exit(v8);
  return v22;
}

- (NSMutableDictionary)ppsIDMapping
{
  return self->_ppsIDMapping;
}

- (BOOL)sendDataToPPS:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v8 = a3;
  LOBYTE(a5) = [(_DASPPSDataManager *)self sendDataToPPS:v8 ppsID:[(_DASPPSDataManager *)self ppsIDForSubsystem:a4 category:a5]];

  return (char)a5;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050748;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3DE8 != -1) {
    dispatch_once(&qword_1001C3DE8, block);
  }
  v2 = (void *)qword_1001C3DE0;

  return v2;
}

- (_DASPPSDataManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)_DASPPSDataManager;
  v2 = [(_DASPPSDataManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[_DASDaemonLogger logForCategory:@"ppsDataManager"];
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    ppsIDMapping = v2->_ppsIDMapping;
    v2->_ppsIDMapping = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    mediaanalysisProgressMapping = v2->_mediaanalysisProgressMapping;
    v2->_mediaanalysisProgressMapping = (NSMutableDictionary *)v7;

    [(NSMutableDictionary *)v2->_mediaanalysisProgressMapping setObject:@"com.apple.mediaanalysisd.photos.face" forKeyedSubscript:@"FaceAnalysis"];
    [(NSMutableDictionary *)v2->_mediaanalysisProgressMapping setObject:@"com.apple.mediaanalysisd.photos.scene" forKeyedSubscript:@"SceneAnalysis"];
    [(NSMutableDictionary *)v2->_mediaanalysisProgressMapping setObject:@"com.apple.mediaanalysisd.photos.full" forKeyedSubscript:@"MediaAnalysis"];
    [(NSMutableDictionary *)v2->_mediaanalysisProgressMapping setObject:@"com.apple.mediaanalysisd.photos.visualsearch" forKeyedSubscript:@"VisualSearchAnalysis"];
    [(NSMutableDictionary *)v2->_mediaanalysisProgressMapping setObject:@"com.apple.mediaanalysisd.photos.ocr" forKeyedSubscript:@"OCRAnalysis"];
    [(NSMutableDictionary *)v2->_mediaanalysisProgressMapping setObject:@"com.apple.mediaanalysisd.photos.pec" forKeyedSubscript:@"PECAnalysis"];
  }
  return v2;
}

- (id)filterTimeSeriesByTaskIdentifiers:(id)a3 timeSeries:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = +[NSPredicate predicateWithFormat:@"SELF.TaskName IN %@", v5];
    id v8 = [v6 array];
    v9 = [v8 filteredArrayUsingPredicate:v7];

    id v10 = [objc_alloc((Class)sub_10005085C()) initWithEvents:v9];
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

- (id)filterTimeSeriesByFeatureCodes:(id)a3 timeSeries:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = +[NSPredicate predicateWithFormat:@"SELF.FeatureCode IN %@", v5];
    id v8 = [v6 array];
    v9 = [v8 filteredArrayUsingPredicate:v7];

    id v10 = [objc_alloc((Class)sub_10005085C()) initWithEvents:v9];
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

- (id)filterTimeSeriesByTimeFilter:(id)a3 timeSeries:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    id v7 = a3;
    id v8 = [v7 startDate];
    [v8 timeIntervalSince1970];
    uint64_t v10 = v9;

    uint64_t v11 = [v7 endDate];

    [v11 timeIntervalSince1970];
    uint64_t v13 = v12;

    uint64_t v14 = +[NSPredicate predicateWithFormat:@"@epochTimestamp >= %lf AND @epochTimestamp <= %lf", v10, v13];
    uint64_t v15 = [v6 array];
    uint64_t v16 = [v15 filteredArrayUsingPredicate:v14];

    id v17 = [objc_alloc((Class)sub_10005085C()) initWithEvents:v16];
  }
  else
  {
    id v17 = v5;
  }

  return v17;
}

- (id)getTaskDependencyGraphs:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id obj = a3;
  id v6 = -[_DASPPSDataManager loadTaskDependencies:metrics:timeFilter:filepath:](self, "loadTaskDependencies:metrics:timeFilter:filepath:");
  v41 = +[NSMutableDictionary dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v36 = v6;
  id v7 = [v6 array];
  id v8 = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v51;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v13 = [v12 metricKeysAndValues];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"TaskName"];

        uint64_t v15 = [v12 metricKeysAndValues];
        uint64_t v16 = [v15 objectForKeyedSubscript:@"ProducedResultIdentifiers"];

        id v17 = [v12 metricKeysAndValues];
        uint64_t v18 = [v17 objectForKeyedSubscript:@"DependencyIdentifiers"];

        uint64_t v19 = [[_DASTaskDependencies alloc] initWithProducedResultIdentifiers:v16 dependencyIdentifiers:v18];
        [v41 setObject:v19 forKeyedSubscript:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v9);
  }

  id v40 = +[NSMutableDictionary dictionary];
  v39 = +[NSMutableArray array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obja = obj;
  id v20 = [obja countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v47;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(obja);
        }
        uint64_t v24 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v25 = v39;
        id v26 = [v25 countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v43;
LABEL_15:
          uint64_t v29 = 0;
          while (1)
          {
            if (*(void *)v43 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v42 + 1) + 8 * v29);
            v31 = [0 nodeForTaskIdentifier:v24];

            if (v31) {
              break;
            }
            if (v27 == (id)++v29)
            {
              id v27 = [v25 countByEnumeratingWithState:&v42 objects:v54 count:16];
              if (v27) {
                goto LABEL_15;
              }
              goto LABEL_21;
            }
          }
          id v32 = v30;

          if (v32) {
            goto LABEL_24;
          }
        }
        else
        {
LABEL_21:
        }
        v33 = [_DASTaskDependencyGraph alloc];
        v34 = [(_DASTaskDependencyGraph *)v33 constructTaskDependencyGraphForTask:v24 dependencyDataMap:v41];

        [v25 addObject:v34];
        id v32 = 0;
LABEL_24:
        [v40 setObject:v32 forKeyedSubscript:v24];
      }
      id v21 = [obja countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v21);
  }

  return v40;
}

- (id)getPPSData:(id)a3 filepath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  log = v10->_log;
  BOOL v12 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting PPS Data from provided filepath", buf, 2u);
    }
    id v29 = 0;
    unsigned int v13 = [v9 checkResourceIsReachableAndReturnError:&v29];
    id v14 = v29;
    if (v13)
    {
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2050000000;
      uint64_t v15 = (void *)qword_1001C3E00;
      v38 = (void *)qword_1001C3E00;
      if (!qword_1001C3E00)
      {
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v31 = 3221225472;
        id v32 = sub_1000534DC;
        v33 = &unk_100175628;
        v34 = &v35;
        sub_1000534DC((uint64_t)buf);
        uint64_t v15 = (void *)v36[3];
      }
      uint64_t v16 = v15;
      _Block_object_dispose(&v35, 8);
      id v17 = [[v16 alloc] initWithFilepath:v9];
      id v28 = v14;
      uint64_t v18 = [v17 dataForRequest:v8 withError:&v28];
      id v19 = v28;

      id v14 = v19;
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Getting on-device PPS Data", buf, 2u);
    }
    id v27 = 0;
    id v20 = v8;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    id v21 = (void (*)(id, id *))off_1001C3E08;
    v38 = off_1001C3E08;
    if (!off_1001C3E08)
    {
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v31 = 3221225472;
      id v32 = sub_100053534;
      v33 = &unk_100175628;
      v34 = &v35;
      uint64_t v22 = (void *)sub_100053368();
      uint64_t v23 = dlsym(v22, "PerfPowerServicesGetData");
      *(void *)(v34[1] + 24) = v23;
      off_1001C3E08 = *(_UNKNOWN **)(v34[1] + 24);
      id v21 = (void (*)(id, id *))v36[3];
    }
    _Block_object_dispose(&v35, 8);
    if (!v21)
    {
      dlerror();
      id result = (id)abort_report_np();
      __break(1u);
      return result;
    }
    uint64_t v18 = v21(v20, &v27);

    id v14 = v27;
  }
  objc_sync_exit(v10);

  if (!v14)
  {
    id v25 = v18;
    goto LABEL_22;
  }
  uint64_t v24 = v10->_log;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    sub_1000F5B28((uint64_t)v14, v24);
    if (a5) {
      goto LABEL_18;
    }
LABEL_21:
    id v25 = 0;
    goto LABEL_22;
  }
  if (!a5) {
    goto LABEL_21;
  }
LABEL_18:
  id v25 = 0;
  *a5 = v14;
LABEL_22:

  return v25;
}

- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 138413314;
    id v27 = v15;
    __int16 v28 = 2112;
    id v29 = v16;
    __int16 v30 = 2112;
    id v31 = v17;
    __int16 v32 = 2112;
    id v33 = v18;
    __int16 v34 = 2112;
    id v35 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Getting PPSTimeSeries for subsystem: %@ category: %@ with valueFilter: %@ & metrics: %@ & timeFilter:%@", (uint8_t *)&v26, 0x34u);
  }
  uint64_t v22 = sub_100051448(v15, v16, v17);
  id v23 = [objc_alloc((Class)sub_1000515A4()) initWithMetrics:v18 predicate:v22 timeFilter:v19];
  uint64_t v24 = [(_DASPPSDataManager *)self getPPSData:v23 filepath:v20 error:a9];

  return v24;
}

- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 limitCount:(unint64_t)a8 offsetCount:(unint64_t)a9 filepath:(id)a10 error:(id *)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    id v29 = v16;
    __int16 v30 = 2112;
    id v31 = v17;
    __int16 v32 = 2112;
    id v33 = v18;
    __int16 v34 = 2112;
    id v35 = v19;
    __int16 v36 = 2112;
    id v37 = v20;
    __int16 v38 = 2048;
    unint64_t v39 = a8;
    __int16 v40 = 2048;
    unint64_t v41 = a9;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Getting PPSTimeSeries for subsystem: %@ category: %@ with valueFilter: %@ & metrics: %@ & timeFilter:%@ & limitCount:%lu & offsetCount:%lu", buf, 0x48u);
  }
  id v23 = sub_100051448(v16, v17, v18);
  id v24 = [objc_alloc((Class)sub_1000515A4()) initWithMetrics:v19 predicate:v23 timeFilter:v20 limitCount:a8 offsetCount:a9];
  id v25 = [(_DASPPSDataManager *)self getPPSData:v24 filepath:v21 error:a11];

  return v25;
}

- (id)getPPSTimeSeries:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 limitCount:(unint64_t)a8 offsetCount:(unint64_t)a9 readDirection:(unint64_t)a10 filepath:(id)a11 error:(id *)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a11;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414082;
    id v30 = v17;
    __int16 v31 = 2112;
    id v32 = v18;
    __int16 v33 = 2112;
    id v34 = v19;
    __int16 v35 = 2112;
    id v36 = v20;
    __int16 v37 = 2112;
    id v38 = v21;
    __int16 v39 = 2048;
    unint64_t v40 = a8;
    __int16 v41 = 2048;
    unint64_t v42 = a9;
    __int16 v43 = 2048;
    unint64_t v44 = a10;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Getting PPSTimeSeries for subsystem: %@ category: %@ with valueFilter: %@ & metrics: %@ & timeFilter:%@ & limitCount:%lu & offsetCount:%lu & readDirection: %lu", buf, 0x52u);
  }
  id v24 = sub_100051448(v17, v18, v19);
  id v25 = [objc_alloc((Class)sub_1000515A4()) initWithMetrics:v20 predicate:v24 timeFilter:v21 limitCount:a8 offsetCount:a9 readDirection:a10];
  int v26 = [(_DASPPSDataManager *)self getPPSData:v25 filepath:v22 error:a12];

  return v26;
}

- (id)getPPSHistogram:(id)a3 category:(id)a4 valueFilter:(id)a5 dimensions:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    id v34 = v17;
    *(_WORD *)__int16 v35 = 2112;
    *(void *)&v35[2] = v18;
    __int16 v36 = 2112;
    id v37 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Getting PPSHistogram for subsystem: %@ category: %@ with valueFilter: %@ dimensions: %@ timeFilter: %@", buf, 0x34u);
  }
  id v22 = sub_100051448(v15, v16, v17);
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v23 = (void *)qword_1001C3E20;
  uint64_t v32 = qword_1001C3E20;
  if (!qword_1001C3E20)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10005362C;
    id v34 = &unk_100175628;
    *(void *)__int16 v35 = &v29;
    sub_10005362C((uint64_t)buf);
    id v23 = (void *)v30[3];
  }
  id v24 = v23;
  _Block_object_dispose(&v29, 8);
  id v25 = [v24 alloc];
  id v26 = [v25 initWithDimensions:v18 predicate:v22 timeFilter:v19];
  id v27 = [(_DASPPSDataManager *)self getPPSData:v26 filepath:v20 error:a9];

  return v27;
}

- (id)getPPSTimeIntervalSet:(id)a3 category:(id)a4 valueFilter:(id)a5 metrics:(id)a6 timeFilter:(id)a7 filepath:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    id v34 = v17;
    *(_WORD *)__int16 v35 = 2112;
    *(void *)&v35[2] = v18;
    __int16 v36 = 2112;
    id v37 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Getting PPSTimeIntervalSet for subsystem: %@ category: %@ with valueFilter: %@ metrics: %@ timeFilter: %@", buf, 0x34u);
  }
  id v22 = sub_100051448(v15, v16, v17);
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v23 = (void *)qword_1001C3E28;
  uint64_t v32 = qword_1001C3E28;
  if (!qword_1001C3E28)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100053684;
    id v34 = &unk_100175628;
    *(void *)__int16 v35 = &v29;
    sub_100053684((uint64_t)buf);
    id v23 = (void *)v30[3];
  }
  id v24 = v23;
  _Block_object_dispose(&v29, 8);
  id v25 = [v24 alloc];
  id v26 = [v25 initWithMetrics:v18 predicate:v22 timeFilter:v19];
  id v27 = [(_DASPPSDataManager *)self getPPSData:v26 filepath:v20 error:a9];

  return v27;
}

- (id)loadTaskCheckpoints:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting task checkpoints for %@ with metrics: %@ & timeFilter: %@", buf, 0x20u);
  }
  id v15 = [(_DASPPSDataManager *)self getPPSTimeSeries:@"BackgroundProcessing" category:@"TaskCheckpoint" valueFilter:0 metrics:v11 timeFilter:0 filepath:v13 error:0];
  id v16 = [(_DASPPSDataManager *)self filterTimeSeriesByTimeFilter:v12 timeSeries:v15];

  id v17 = [(_DASPPSDataManager *)self filterTimeSeriesByTaskIdentifiers:v10 timeSeries:v16];

  return v17;
}

- (id)loadTaskBlockingReasons:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting task blocking reasons for %@ with metrics: %@ & timeFilter: %@", buf, 0x20u);
  }
  id v15 = [(_DASPPSDataManager *)self getPPSTimeSeries:@"BackgroundProcessing" category:@"TaskBlockingPolicies" valueFilter:0 metrics:v11 timeFilter:0 filepath:v13 error:0];
  id v16 = [(_DASPPSDataManager *)self filterTimeSeriesByTimeFilter:v12 timeSeries:v15];

  id v17 = [(_DASPPSDataManager *)self filterTimeSeriesByTaskIdentifiers:v10 timeSeries:v16];

  return v17;
}

- (id)loadIntensiveTaskBlockingReasons:(id)a3 metrics:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting intensive task blocking reasons with metrics: %@ & timeFilter: %@", buf, 0x16u);
  }
  id v12 = [(_DASPPSDataManager *)self getPPSTimeSeries:@"BackgroundProcessing" category:@"IntensiveTasksBlockingPolicies" valueFilter:0 metrics:v9 timeFilter:0 filepath:v10 error:0];
  id v13 = [(_DASPPSDataManager *)self filterTimeSeriesByTimeFilter:v8 timeSeries:v12];

  return v13;
}

- (id)loadFeatureCheckpoints:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting feature checkpoints for %@ with metrics: %@", buf, 0x16u);
  }
  id v15 = [(_DASPPSDataManager *)self getPPSTimeSeries:@"BackgroundProcessing" category:@"FeatureCheckpoint" valueFilter:0 metrics:v11 timeFilter:0 filepath:v13 error:0];
  id v16 = [(_DASPPSDataManager *)self filterTimeSeriesByTimeFilter:v12 timeSeries:v15];

  __int16 v17 = [(_DASPPSDataManager *)self filterTimeSeriesByFeatureCodes:v10 timeSeries:v16];

  return v17;
}

- (id)loadConfig:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting Config with metrics: %@ & timeFilter: %@", buf, 0x16u);
  }
  id v12 = [(_DASPPSDataManager *)self getPPSTimeSeries:@"BackgroundProcessing" category:@"Config" valueFilter:0 metrics:v8 timeFilter:0 filepath:v10 error:0];
  id v13 = [(_DASPPSDataManager *)self filterTimeSeriesByTimeFilter:v9 timeSeries:v12];

  return v13;
}

- (id)loadTaskProgress:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v40 = a5;
  id v39 = a6;
  __int16 v41 = self;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v61 = v40;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting task progress for %@ with metrics: %@ & timeFilter: %@", buf, 0x20u);
  }
  __int16 v36 = v11;
  id v13 = [(_DASPPSDataManager *)self getPPSTimeSeries:@"BackgroundProcessing" category:@"TaskWorkload" valueFilter:0 metrics:v11 timeFilter:0 filepath:v39 error:0];
  id v38 = [(_DASPPSDataManager *)self filterTimeSeriesByTimeFilter:v40 timeSeries:v13];

  unint64_t v42 = +[NSMutableSet setWithSet:v10];
  id v14 = [(_DASPPSDataManager *)self mediaanalysisProgressMapping];
  id v15 = [v14 allValues];
  long long v45 = +[NSSet setWithArray:v15];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v10;
  id v16 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v51;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(obj);
        }
        if ([v45 containsObject:*(void *)(*((void *)&v50 + 1) + 8 * i)]) {
          [v42 addObject:@"com.apple.mediaanalysisd.progress"];
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v16);
  }

  id v37 = [(_DASPPSDataManager *)self filterTimeSeriesByTaskIdentifiers:v42 timeSeries:v38];
  id v19 = +[NSMutableArray array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v43 = [v37 array];
  id v20 = [v43 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v47;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v47 != v21) {
          objc_enumerationMutation(v43);
        }
        __int16 v23 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
        [v23 epochTimestamp];
        [v23 monotonicTimestamp];
        id v24 = [v23 metricKeysAndValues];
        id v25 = +[NSMutableDictionary dictionaryWithDictionary:v24];

        id v26 = [v25 objectForKeyedSubscript:@"TaskName"];
        unsigned int v27 = [v26 isEqualToString:@"com.apple.mediaanalysisd.progress"];

        if (v27)
        {
          __int16 v28 = [(_DASPPSDataManager *)v41 mediaanalysisProgressMapping];
          uint64_t v29 = [v25 objectForKeyedSubscript:@"SubCategory"];
          id v30 = [v28 objectForKeyedSubscript:v29];
          [v25 setObject:v30 forKeyedSubscript:@"TaskName"];
        }
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x2050000000;
        uint64_t v31 = (void *)qword_1001C3E30;
        uint64_t v57 = qword_1001C3E30;
        if (!qword_1001C3E30)
        {
          *(void *)buf = _NSConcreteStackBlock;
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&buf[16] = sub_1000536DC;
          v61 = &unk_100175628;
          v62 = &v54;
          sub_1000536DC((uint64_t)buf);
          uint64_t v31 = (void *)v55[3];
        }
        id v32 = v31;
        _Block_object_dispose(&v54, 8);
        [v23 monotonicTimestamp];
        __int16 v33 = [v32 eventWithMonotonicTimestamp:v25 timeOffset:0 dictionary:0];
        [v19 addObject:v33];
      }
      id v20 = [v43 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v20);
  }

  id v34 = [objc_alloc((Class)sub_10005085C()) initWithEvents:v19];

  return v34;
}

- (id)loadTasksForFeatures:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting tasks for Feature Codes: %@ with metrics: %@ & timeFilter: %@", buf, 0x20u);
  }
  id v15 = [(_DASPPSDataManager *)self getPPSTimeSeries:@"BackgroundProcessing" category:@"TaskFeatureCodes" valueFilter:0 metrics:v11 timeFilter:0 filepath:v13 error:0];
  id v16 = [(_DASPPSDataManager *)self filterTimeSeriesByTimeFilter:v12 timeSeries:v15];

  return v16;
}

- (id)loadTaskDependencies:(id)a3 metrics:(id)a4 timeFilter:(id)a5 filepath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting dependencies for tasks: %@ with metrics: %@ & timeFilter: %@", buf, 0x20u);
  }
  id v15 = [(_DASPPSDataManager *)self getPPSTimeSeries:@"BackgroundProcessing" category:@"TaskDependencies" valueFilter:0 metrics:v11 timeFilter:0 filepath:v13 error:0];
  id v16 = [(_DASPPSDataManager *)self filterTimeSeriesByTimeFilter:v12 timeSeries:v15];

  uint64_t v17 = [(_DASPPSDataManager *)self filterTimeSeriesByTaskIdentifiers:v10 timeSeries:v16];

  return v17;
}

- (id)loadTaskDependencyGraph:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v35 = 0;
  id v10 = [(_DASPPSDataManager *)self getPPSTimeSeries:@"BackgroundProcessing" category:@"TaskDependencies" valueFilter:0 metrics:0 timeFilter:0 filepath:a5 error:&v35];
  id v11 = v35;
  if (v11)
  {
    id v12 = 0;
  }
  else
  {
    id v29 = v9;
    id v30 = v8;
    id v13 = [(_DASPPSDataManager *)self filterTimeSeriesByTimeFilter:v9 timeSeries:v10];

    id v14 = +[NSMutableDictionary dictionary];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = v13;
    id v15 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v10);
          }
          id v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v20 = [v19 metricKeysAndValues];
          __int16 v21 = [v20 objectForKeyedSubscript:@"TaskName"];

          if (v21)
          {
            id v22 = [v19 metricKeysAndValues];
            __int16 v23 = [v22 objectForKeyedSubscript:@"ProducedResultIdentifiers"];

            id v24 = [v19 metricKeysAndValues];
            id v25 = [v24 objectForKeyedSubscript:@"DependencyIdentifiers"];

            id v26 = [[_DASTaskDependencies alloc] initWithProducedResultIdentifiers:v23 dependencyIdentifiers:v25];
            [v14 setObject:v26 forKeyedSubscript:v21];
          }
        }
        id v16 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v16);
    }

    unsigned int v27 = [_DASTaskDependencyGraph alloc];
    id v8 = v30;
    id v12 = [(_DASTaskDependencyGraph *)v27 constructTaskDependencyGraphForTask:v30 dependencyDataMap:v14];

    id v11 = 0;
    id v9 = v29;
  }

  return v12;
}

- (id)loadBuddyData:(id)a3 timeFilter:(id)a4 filepath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Getting Buddy Data with metrics: %@ & timeFilter: %@", buf, 0x16u);
  }
  id v12 = [(_DASPPSDataManager *)self getPPSTimeSeries:@"BackgroundProcessing" category:@"BuddyData" valueFilter:0 metrics:v8 timeFilter:0 filepath:v10 error:0];
  id v13 = [(_DASPPSDataManager *)self filterTimeSeriesByTimeFilter:v9 timeSeries:v12];

  return v13;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void)setPpsIDMapping:(id)a3
{
}

- (NSMutableDictionary)mediaanalysisProgressMapping
{
  return self->_mediaanalysisProgressMapping;
}

- (void)setMediaanalysisProgressMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaanalysisProgressMapping, 0);
  objc_storeStrong((id *)&self->_ppsIDMapping, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end