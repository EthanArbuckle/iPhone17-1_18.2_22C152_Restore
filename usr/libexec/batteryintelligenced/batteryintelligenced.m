void sub_100001EBC(id a1)
{
  uint64_t vars8;

  qword_1000395C0 = objc_alloc_init(BatteryAlgorithmsInit);

  _objc_release_x1();
}

void sub_100002694(uint64_t a1)
{
  v2 = +[NSSet setWithArray:&off_100033310];
  id v3 = objc_alloc((Class)PPSTimeSeriesRequest);
  v4 = +[NSPredicate predicateWithFormat:@"(subsystem == 'BatteryDataCollection' AND category == 'BDC_SBC')"];
  id v5 = [v3 initWithMetrics:v2 predicate:v4 timeFilter:0 limitCount:105120 offsetCount:0];

  v102 = +[NSMutableArray array];
  if (v5)
  {
    id v109 = 0;
    v6 = PerfPowerServicesGetData();
    v90 = v6;
    id v93 = 0;
    if (v93)
    {
      v7 = qword_1000395D0;
      if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v113 = v93;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error from PPSGetData %@", buf, 0xCu);
      }
      id v8 = +[NSNull null];
    }
    else
    {
      id v88 = v5;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id obj = v6;
      id v10 = [obj countByEnumeratingWithState:&v105 objects:buf count:16];
      if (v10)
      {
        id v11 = v10;
        id v99 = *(id *)v106;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(id *)v106 != v99) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v105 + 1) + 8 * i);
            v14 = [v13 metricKeysAndValues:v88];
            v15 = +[NSMutableDictionary dictionary];
            v16 = [v14 objectForKeyedSubscript:@"Voltage"];
            [v15 setObject:v16 forKeyedSubscript:@"Voltage"];

            v17 = [v14 objectForKeyedSubscript:@"Amperage"];
            [v15 setObject:v17 forKeyedSubscript:@"Amperage"];

            v18 = [v14 objectForKeyedSubscript:@"PresentDOD0"];
            [v15 setObject:v18 forKeyedSubscript:@"PresentDOD0"];

            v19 = [v14 objectForKeyedSubscript:@"VirtualTemperature"];
            [v15 setObject:v19 forKeyedSubscript:@"VirtualTemperature"];

            [v13 epochTimestamp];
            v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v15 setObject:v20 forKeyedSubscript:@"Timestamp"];

            uint64_t v21 = qword_1000395E0;
            if (*(double *)&qword_1000395E0 == 0.0)
            {
              [v13 epochTimestamp:*(double *)&qword_1000395E0];
              qword_1000395E0 = v21;
            }
            [v102 addObject:v15, *(double *)&v21];
          }
          id v11 = [obj countByEnumeratingWithState:&v105 objects:buf count:16];
        }
        while (v11);
      }

      id v8 = v102;
      id v5 = v88;
    }
  }
  else
  {
    v9 = qword_1000395D0;
    if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to allocated PPS request object", buf, 2u);
    }
    id v8 = +[NSNull null];
  }

  uint64_t v22 = *(void *)(a1 + 32);
  v23 = *(void **)(v22 + 24);
  *(void *)(v22 + 24) = v8;

  uint64_t v24 = +[NSSet setWithArray:&off_100033328];
  id v25 = objc_alloc((Class)PPSTimeSeriesRequest);
  v26 = +[NSPredicate predicateWithFormat:@"(subsystem == 'BatteryDataCollection' AND category == 'BDC_OBC')"];
  v27 = +[NSDate now];
  v28 = [v27 dateByAddingTimeInterval:-31536000.0];
  id v29 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v28 endDate:v27];

  v30 = (void *)v24;
  id v31 = [v25 initWithMetrics:v24 predicate:v26 timeFilter:v29 limitCount:3000 offsetCount:0];

  v103 = +[NSMutableArray array];
  if (v31)
  {
    id v109 = 0;
    v32 = PerfPowerServicesGetData();
    id v33 = v109;
    id v100 = v33;
    if (v33)
    {
      id v34 = v33;
      v35 = qword_1000395D0;
      if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v113 = v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Error from PPSGetData %@", buf, 0xCu);
      }
      id v36 = +[NSNull null];
      v37 = &AnalyticsSendEventLazy_ptr;
    }
    else
    {
      id v94 = v31;
      id obja = (id)v24;
      v91 = v32;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v39 = v32;
      id v40 = [v39 countByEnumeratingWithState:&v105 objects:buf count:16];
      if (v40)
      {
        id v41 = v40;
        unsigned int v42 = 0;
        uint64_t v43 = *(void *)v106;
        do
        {
          v44 = 0;
          unsigned int v45 = v42;
          do
          {
            if (*(void *)v106 != v43) {
              objc_enumerationMutation(v39);
            }
            v46 = *(void **)(*((void *)&v105 + 1) + 8 * (void)v44);
            v47 = [v46 metricKeysAndValues:v88];
            v48 = [v47 objectForKeyedSubscript:@"VacVoltageLimit"];
            unsigned int v42 = [v48 intValue];

            if (v45 != v42)
            {
              v49 = +[NSMutableDictionary dictionary];
              v50 = [v47 objectForKeyedSubscript:@"VacVoltageLimit"];
              [v49 setObject:v50 forKeyedSubscript:@"VacVoltageLimit"];

              [v46 epochTimestamp];
              v51 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              [v49 setObject:v51 forKeyedSubscript:@"Timestamp"];

              [v103 addObject:v49];
            }

            v44 = (char *)v44 + 1;
            unsigned int v45 = v42;
          }
          while (v41 != v44);
          id v41 = [v39 countByEnumeratingWithState:&v105 objects:buf count:16];
        }
        while (v41);
      }

      id v36 = v103;
      v32 = v91;
      v37 = &AnalyticsSendEventLazy_ptr;
      id v31 = v94;
      v30 = obja;
    }
  }
  else
  {
    v38 = qword_1000395D0;
    if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Failed to allocated PPS request object", buf, 2u);
    }
    id v36 = +[NSNull null];
    v37 = &AnalyticsSendEventLazy_ptr;
  }

  uint64_t v52 = *(void *)(a1 + 32);
  v53 = *(void **)(v52 + 32);
  *(void *)(v52 + 32) = v36;

  v54 = [v37[155] setWithArray:&off_100033340];
  if (*(double *)&qword_1000395E0 == 0.0)
  {
    v55 = qword_1000395D0;
    if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "We need a valid SBC data timestamp to proceed", buf, 2u);
    }
    id v56 = +[NSNull null];
  }
  else
  {
    id objb = v54;
    id v57 = objc_alloc((Class)PPSTimeSeriesRequest);
    v58 = +[NSPredicate predicateWithFormat:@"(subsystem == 'BatteryDataCollection' AND category == 'BDC_Daily')"];
    v59 = +[NSDate dateWithTimeIntervalSince1970:*(double *)&qword_1000395E0];
    v60 = +[NSDate dateWithTimeInterval:v59 sinceDate:604800.0];
    v61 = +[NSDate dateWithTimeInterval:v59 sinceDate:-604800.0];
    id v62 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v61 endDate:v60];

    v63 = v57;
    v54 = objb;
    id v64 = [v63 initWithMetrics:objb predicate:v58 timeFilter:v62 limitCount:50 offsetCount:0];

    v104 = +[NSMutableArray array];
    if (v64)
    {
      id v109 = 0;
      v65 = PerfPowerServicesGetData();
      id v66 = v109;
      if (v66)
      {
        v67 = qword_1000395D0;
        if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v113 = v66;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Error from PPSGetData %@", buf, 0xCu);
        }
        id v56 = +[NSNull null];
      }
      else
      {
        uint64_t v89 = a1;
        v92 = v65;
        id v95 = v64;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v101 = v65;
        id v69 = [v101 countByEnumeratingWithState:&v105 objects:buf count:16];
        if (v69)
        {
          id v70 = v69;
          uint64_t v71 = *(void *)v106;
          do
          {
            for (j = 0; j != v70; j = (char *)j + 1)
            {
              if (*(void *)v106 != v71) {
                objc_enumerationMutation(v101);
              }
              v73 = *(void **)(*((void *)&v105 + 1) + 8 * (void)j);
              v74 = +[NSMutableDictionary dictionary];
              v75 = [v73 metricKeysAndValues];
              v76 = [v75 objectForKeyedSubscript:@"TimeAtHighSoc"];
              [v74 setObject:v76 forKeyedSubscript:@"TimeAtHighSoc"];

              v77 = [v75 objectForKeyedSubscript:@"CycleCount"];
              [v74 setObject:v77 forKeyedSubscript:@"CycleCount"];

              [v73 epochTimestamp];
              v78 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              [v74 setObject:v78 forKeyedSubscript:@"Timestamp"];

              [v104 addObject:v74];
            }
            id v70 = [v101 countByEnumeratingWithState:&v105 objects:buf count:16];
          }
          while (v70);
        }

        id v56 = v104;
        a1 = v89;
        v65 = v92;
        id v64 = v95;
        v54 = objb;
        id v66 = 0;
      }
    }
    else
    {
      v68 = qword_1000395D0;
      if (os_log_type_enabled((os_log_t)qword_1000395D0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Failed to allocated PPS request object", buf, 2u);
      }
      id v56 = +[NSNull null];
    }
  }
  uint64_t v79 = *(void *)(a1 + 32);
  v80 = *(void **)(v79 + 40);
  *(void *)(v79 + 40) = v56;

  v110[0] = @"sbcStreamData";
  v81 = [*(id *)(a1 + 32) sbcData];
  v111[0] = v81;
  v110[1] = @"obcStreamData";
  v82 = [*(id *)(a1 + 32) obcData];
  v111[1] = v82;
  v110[2] = @"dailyStreamData";
  v83 = [*(id *)(a1 + 32) dailyData];
  v111[2] = v83;
  v110[3] = @"smcData";
  v84 = [*(id *)(a1 + 32) smcKeys];
  v111[3] = v84;
  uint64_t v85 = +[NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:4];
  uint64_t v86 = *(void *)(a1 + 32);
  v87 = *(void **)(v86 + 64);
  *(void *)(v86 + 64) = v85;
}

uint64_t sub_100003440(uint64_t a1)
{
  qword_1000395E8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100004F20(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004F4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_100004F68()
{
  return v0;
}

uint64_t sub_100005014(uint64_t a1)
{
  qword_1000395F8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000062E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006300(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_1000063C8(uint64_t a1)
{
  qword_100039610 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10000805C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_10000869C(uint64_t a1)
{
  qword_100039620 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

int64_t sub_10000A02C(id a1, NSURL *a2, NSURL *a3)
{
  id v9 = 0;
  v4 = a3;
  [(NSURL *)a2 getResourceValue:&v9 forKey:NSURLCreationDateKey error:0];
  uint64_t v8 = 0;
  id v5 = v9;
  [(NSURL *)v4 getResourceValue:&v8 forKey:NSURLCreationDateKey error:0];

  id v6 = [v5 compare:v8];
  return (int64_t)v6;
}

id sub_10000B068(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  id v10 = v8;
  id v11 = +[NSPredicate predicateWithFormat:@"(subsystem == 'BatteryIntelligence' AND category == 'BatteryHealthDelta' AND model_name == %@ AND prediction_duration == %@)", v7, a3];
  if (v9)
  {
    v12 = +[NSPredicate predicateWithFormat:@"prediction_output_name == %@ ", v9];
    v26[0] = v11;
    v26[1] = v12;
    v13 = +[NSArray arrayWithObjects:v26 count:2];
    uint64_t v14 = +[NSCompoundPredicate andPredicateWithSubpredicates:v13];

    id v11 = (void *)v14;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100020044();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v15 = [v10 startDate];
    v16 = [v10 endDate];
    *(_DWORD *)buf = 138412546;
    v23 = v15;
    __int16 v24 = 2112;
    id v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Fetching past predictions in range %@ - %@", buf, 0x16u);
  }
  id v17 = [objc_alloc((Class)PPSTimeSeriesRequest) initWithMetrics:0 predicate:v11 timeFilter:v10 limitCount:100 offsetCount:0];
  if (!v17)
  {
    v20 = 0;
    goto LABEL_23;
  }
  v18 = PerfPowerServicesGetData();
  id v19 = 0;
  if (v19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001FFD4();
    }
LABEL_21:
    v20 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001FF64();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_10001FEF0(v18);
    if (!v18)
    {
LABEL_19:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10001FE1C((uint64_t)v7, v10);
      }
      goto LABEL_21;
    }
  }
  else if (!v18)
  {
    goto LABEL_19;
  }
  if (![v18 count]) {
    goto LABEL_19;
  }
  v20 = [v18 array];
LABEL_22:

LABEL_23:

  return v20;
}

uint64_t sub_10000C080()
{
  qword_100039638 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10000C520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C53C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);

  if (v3 && v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    id v6 = [v5 log];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000201C4((uint64_t)v3, v6);
    }
  }
  objc_destroyWeak(&to);
}

void sub_10000C5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void start()
{
  if (_set_user_dir_suffix())
  {
    unsigned int v0 = +[BIMGUtility isiPhone];
    uint64_t v2 = sub_100016A74("main");
    id v3 = (void *)qword_100039650;
    qword_100039650 = v2;

    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000306F8);
    int v4 = _os_feature_enabled_impl();
    byte_100039659 = v4;
    id v5 = qword_100039650;
    if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_INFO))
    {
      if (v4) {
        id v6 = "Enabled";
      }
      else {
        id v6 = "Disabled";
      }
      *(_DWORD *)buf = 136315138;
      v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "FF: AllTasks %s", buf, 0xCu);
    }
    int v7 = _os_feature_enabled_impl();
    byte_10003965A = v7;
    id v8 = qword_100039650;
    if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_INFO))
    {
      if (v7) {
        id v9 = "Enabled";
      }
      else {
        id v9 = "Disabled";
      }
      *(_DWORD *)buf = 136315138;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "FF: AppleSoftGaugingAllAlgorithms %s", buf, 0xCu);
    }
    int v10 = _os_feature_enabled_impl();
    byte_10003965B = v10;
    id v11 = qword_100039650;
    if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_INFO))
    {
      if (v10) {
        v12 = "Enabled";
      }
      else {
        v12 = "Disabled";
      }
      *(_DWORD *)buf = 136315138;
      v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "FF: BatteryHealthForecastModel %s", buf, 0xCu);
    }
    int v13 = _os_feature_enabled_impl();
    byte_10003965C = v13;
    uint64_t v14 = qword_100039650;
    if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_INFO))
    {
      if (v13) {
        v15 = "Enabled";
      }
      else {
        v15 = "Disabled";
      }
      *(_DWORD *)buf = 136315138;
      v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "FF: OCVDriftModel %s", buf, 0xCu);
    }
    int v16 = _os_feature_enabled_impl();
    byte_100039658 = v16;
    id v17 = qword_100039650;
    if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_INFO))
    {
      if (v16) {
        v18 = "Enabled";
      }
      else {
        v18 = "Disabled";
      }
      *(_DWORD *)buf = 136315138;
      v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "FF: TimeTo80EstimatorModel %s", buf, 0xCu);
    }
    xpc_set_event_stream_handler("com.apple.alarm", (dispatch_queue_t)&_dispatch_main_q, &stru_100030718);

    int v19 = byte_100039658;
    int v20 = byte_100039659;
    uint64_t v21 = +[TimeTo80Listener sharedInstance];
    uint64_t v22 = v21;
    if (v0 && v19 && v20) {
      [v21 setupConnectionListenerForTT80];
    }
    else {
      [v21 deregisterFromContextStoreNotification];
    }

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000F1E4;
    handler[3] = &unk_100030738;
    char v25 = v0;
    xpc_activity_register("com.apple.batteryintelligenced.dailytask", XPC_ACTIVITY_CHECK_IN, handler);
    CFRunLoopRun();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v23 = *__error();
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v23;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to set tmp dir suffix: %{darwin.errno}d", buf, 8u);
  }
  exit(1);
}

void sub_10000EF94(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = +[BIXPCAlarm getNameForEvent:v2];
    int v4 = qword_100039650;
    if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      CFStringRef v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC alarm triggered for %@", (uint8_t *)&v10, 0xCu);
    }
    if ([(__CFString *)v3 isEqualToString:@"tt80RunAtPlugin"])
    {
      +[BIXPCAlarm handleAlarmForEvent:v2];
      id v5 = qword_100039650;
      if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        CFStringRef v11 = @"tt80RunAtPlugin";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Acknowledged %@", (uint8_t *)&v10, 0xCu);
      }
      id v6 = +[TimeTo80Listener sharedInstance];
      [v6 runTT80ModelwithParams:&off_100033B38 andSetupNextAlarm:1];
    }
    if ([(__CFString *)v3 isEqualToString:@"tt80RunDuringChargingSession"])
    {
      +[BIXPCAlarm handleAlarmForEvent:v2];
      int v7 = qword_100039650;
      if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        CFStringRef v11 = @"tt80RunDuringChargingSession";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Acknowledged %@", (uint8_t *)&v10, 0xCu);
      }
      id v8 = +[TimeTo80Listener sharedInstance];
      [v8 runTT80ModelwithParams:&off_100033B60 andSetupNextAlarm:0];
    }
  }
  else
  {
    id v9 = qword_100039650;
    if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "xpc_object event is nil", (uint8_t *)&v10, 2u);
    }
  }
}

void sub_10000F1E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    id v9 = qword_100039650;
    if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activity run!", v24, 2u);
    }
    if (*(unsigned char *)(a1 + 32))
    {
      if (!byte_100039659)
      {
        id v6 = qword_100039650;
        if (!os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        __int16 v27 = 0;
        int v7 = "All tasks disabled!";
        id v8 = (uint8_t *)&v27;
        goto LABEL_5;
      }
      if (byte_10003965B)
      {
        int v10 = +[NSUserDefaults standardUserDefaults];
        if (!v10)
        {
          CFStringRef v11 = qword_100039650;
          if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_ERROR)) {
            sub_1000206F4(v11);
          }
        }
        v12 = +[NSString stringWithUTF8String:"OverrideParams"];
        int v13 = [v10 objectForKey:v12];

        uint64_t v14 = +[CombinedHealthSequencePredictor sharedPredictor];
        [v14 predictAndRecordWithParams:v13];

        v15 = +[HealthStateEstimationPredictor sharedPredictor];
        [v15 predictAndRecordWithParams:v13];
      }
      if (byte_10003965C)
      {
        int v16 = +[NSUserDefaults standardUserDefaults];
        if (!v16)
        {
          id v17 = qword_100039650;
          if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_ERROR)) {
            sub_1000206F4(v17);
          }
        }
        v18 = +[NSString stringWithUTF8String:"OverrideParams"];
        int v19 = [v16 objectForKey:v18];

        int v20 = +[OcvDriftEstimator sharedPredictor];
        [v20 predictAndRecordWithParams:v19];
      }
      if (byte_10003965A)
      {
        uint64_t v21 = qword_100039650;
        if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "ASG enabled!", v26, 2u);
        }
        sub_100014600();
      }
    }
    else
    {
      uint64_t v22 = qword_100039650;
      if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Unregistering activity since this is not an iPhone!", v23, 2u);
      }
      xpc_activity_unregister("com.apple.batteryintelligenced.dailytask");
    }
  }
  else if (!state)
  {
    id v6 = qword_100039650;
    if (os_log_type_enabled((os_log_t)qword_100039650, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v7 = "Activity check-in!";
      id v8 = buf;
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
LABEL_29:
}

void sub_10000F564(id a1)
{
  qword_100039660 = objc_alloc_init(BIFeatures);

  _objc_release_x1();
}

NSString *__cdecl sub_10000F800(id a1, NSNumber *a2)
{
  uint64_t v2 = a2;
  if ([(NSNumber *)v2 unsignedIntValue] <= 0x63) {
    uint64_t v3 = 10 * ([(NSNumber *)v2 unsignedIntValue] / 0xA);
  }
  else {
    uint64_t v3 = 90;
  }
  int v4 = +[NSNumber numberWithUnsignedInt:v3];
  id v5 = +[NSString stringWithFormat:@"%@s", v4];

  return (NSString *)v5;
}

NSString *__cdecl sub_10000F8B8(id a1, NSNumber *a2)
{
  [(NSNumber *)a2 floatValue];
  float v3 = v2 / 100.0;
  if (v3 <= 20.0)
  {
    int v4 = @"LT20t";
  }
  else if (v3 <= 40.0)
  {
    unsigned int v5 = 2 * (float)(v3 * 0.5);
    float v6 = floorf(v3);
    if ((int)v6) {
      unsigned int v7 = 2 * (float)(v3 * 0.5);
    }
    else {
      unsigned int v7 = v5 - 2;
    }
    if (v6 == v3) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = v5;
    }
    id v9 = +[NSNumber numberWithUnsignedInt:v8];
    int v4 = +[NSString stringWithFormat:@"%@t", v9];
  }
  else
  {
    int v4 = @"GT40t";
  }

  return (NSString *)v4;
}

NSString *__cdecl sub_10000F9A0(id a1, NSNumber *a2)
{
  [(NSNumber *)a2 floatValue];
  if (v2 <= -0.5)
  {
    float v3 = @"LT-5c";
  }
  else if (v2 <= 0.5)
  {
    unsigned int v4 = vcvtps_s32_f32((float)(v2 + -0.1) * 10.0);
    float v5 = v2 * 10.0;
    BOOL v7 = floorf(v5) == v5 && v4 == (int)v5;
    float v3 = +[NSString stringWithFormat:@"%d%c", v4 - v7, 99];
  }
  else
  {
    float v3 = @"GT5c";
  }

  return (NSString *)v3;
}

id sub_10000FC70(uint64_t a1)
{
  float v2 = +[BDCSchema sharedBDCSchema];
  dword_100039678 = [v2 columnIndexForColumnName:@"timestamp" atVersion:*(void *)(a1 + 32)];

  id v3 = objc_alloc_init((Class)NSDateFormatter);
  unsigned int v4 = (void *)qword_100039680;
  qword_100039680 = (uint64_t)v3;

  float v5 = (void *)qword_100039680;

  return [v5 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

void sub_100010E70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 288), 8);
  _Unwind_Resume(a1);
}

void sub_100010EB4(uint64_t a1)
{
  bzero(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(void *)(a1 + 40));
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + v2 + 4) = 0x80000000;
      *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + v2 + 8) = 0x7FFFFFFF;
      ++v3;
      v2 += 20;
    }
    while (v3 < *(unsigned int *)(a1 + 48));
  }
}

uint64_t sub_100011084(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011094(uint64_t a1)
{
}

uint64_t sub_10001109C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(a1 + 32) _copyHistogramsOfTypes:*(void *)(a1 + 40) withBinners:*(void *)(a1 + 48) withParams:*(void *)(a1 + 56)];

  return _objc_release_x1();
}

void sub_100011ACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_DEBUG)) {
    sub_100020CC8();
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v4 = v3;
  id v56 = [v4 countByEnumeratingWithState:&v70 objects:v78 count:16];
  id v6 = 0;
  if (v56)
  {
    uint64_t v55 = *(void *)v71;
    *(void *)&long long v5 = 67109376;
    long long v53 = v5;
    id v54 = v4;
    do
    {
      for (i = 0; i != v56; i = (char *)i + 1)
      {
        if (*(void *)v71 != v55) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        id v9 = [v4 objectForKeyedSubscript:v8, v53];
        int v10 = [v9 objectForKeyedSubscript:@"NumSegments"];

        if ([v10 unsignedIntValue] >= 0x31)
        {
          CFStringRef v11 = *(NSObject **)(*(void *)(a1 + 32) + 8);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v49 = v11;
            unsigned int v50 = [v10 unsignedIntValue];
            *(_DWORD *)buf = v53;
            *(_DWORD *)v77 = v50;
            *(_WORD *)&v77[4] = 1024;
            *(_DWORD *)&v77[6] = 48;
            _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Skipping NULL segments. Recevied %u, threshold %u ", buf, 0xEu);
          }
          int v10 = &off_1000339A0;
        }
        id v57 = v10;
        if ([v8 isEqualToString:@"uisoc"])
        {
          v12 = *(void **)(a1 + 40);
          int v13 = [v4 objectForKeyedSubscript:v8];
          uint64_t v14 = [v13 objectForKeyedSubscript:@"PrevSegmentVal"];
          v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v10 unsignedIntValue] - 1);
          id v69 = v6;
          unsigned __int8 v16 = [v12 insertValue:v14 thisManyTimes:v15 error:&v69];
          id v17 = v69;

          if (v16)
          {
            v18 = *(void **)(a1 + 40);
            int v19 = [v4 objectForKeyedSubscript:v8];
            int v20 = [v19 objectForKeyedSubscript:@"CurrSegmentVal"];
            id v68 = v17;
            LOBYTE(v18) = [v18 insertValue:v20 error:&v68];
            id v6 = v68;

            id v4 = v54;
            id v17 = v6;
            if (v18) {
              goto LABEL_53;
            }
          }
          else
          {
          }
          id v34 = *(NSObject **)(*(void *)(a1 + 32) + 8);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v77 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to add uisoc %@", buf, 0xCu);
          }
          id v6 = v17;
        }
        else
        {
          if ([v8 isEqualToString:@"temp"])
          {
            uint64_t v21 = [v4 objectForKeyedSubscript:v8];
            id v22 = [v21 mutableCopy];

            if ([v10 unsignedIntValue] >= 5)
            {
              int v23 = *(NSObject **)(*(void *)(a1 + 32) + 8);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                v51 = v23;
                unsigned int v52 = [v10 unsignedIntValue];
                *(_DWORD *)buf = v53;
                *(_DWORD *)v77 = v52;
                *(_WORD *)&v77[4] = 1024;
                *(_DWORD *)&v77[6] = 4;
                _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Skipping NULL temperature segments. Received %u, threshold %u ", buf, 0xEu);
              }
              [v22 setObject:&off_1000339A0 forKeyedSubscript:@"NumSegments"];
            }
            __int16 v24 = sub_100012244(v22);
            long long v64 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v25 = v24;
            id v26 = [v25 countByEnumeratingWithState:&v64 objects:v75 count:16];
            if (v26)
            {
              id v27 = v26;
              uint64_t v28 = *(void *)v65;
              while (2)
              {
                id v29 = 0;
                v30 = v6;
                do
                {
                  if (*(void *)v65 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v64 + 1) + 8 * (void)v29);
                  v32 = *(void **)(a1 + 48);
                  id v63 = v30;
                  unsigned __int8 v33 = [v32 insertValue:v31 error:&v63];
                  id v6 = v63;

                  if ((v33 & 1) == 0)
                  {
                    v46 = *(NSObject **)(*(void *)(a1 + 32) + 8);
                    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v77 = v6;
                      _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Failed to add temp %@", buf, 0xCu);
                    }
                    goto LABEL_46;
                  }
                  id v29 = (char *)v29 + 1;
                  v30 = v6;
                }
                while (v27 != v29);
                id v27 = [v25 countByEnumeratingWithState:&v64 objects:v75 count:16];
                if (v27) {
                  continue;
                }
                break;
              }
            }
LABEL_46:

LABEL_52:
            id v4 = v54;
            goto LABEL_53;
          }
          if ([v8 isEqualToString:@"amperage"])
          {
            v35 = [v4 objectForKeyedSubscript:v8];
            id v36 = sub_100012244(v35);

            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            id v22 = v36;
            id v37 = [v22 countByEnumeratingWithState:&v59 objects:v74 count:16];
            if (v37)
            {
              id v38 = v37;
              uint64_t v39 = *(void *)v60;
              while (2)
              {
                id v40 = 0;
                id v41 = v6;
                do
                {
                  if (*(void *)v60 != v39) {
                    objc_enumerationMutation(v22);
                  }
                  [*(id *)(*((void *)&v59 + 1) + 8 * (void)v40) floatValue];
                  unsigned int v42 = *(void **)(a1 + 56);
                  *(float *)&double v44 = v43 / (float)*(unsigned int *)(a1 + 64);
                  unsigned int v45 = +[NSNumber numberWithFloat:v44];
                  id v58 = v41;
                  LOBYTE(v42) = [v42 insertValue:v45 error:&v58];
                  id v6 = v58;

                  if ((v42 & 1) == 0)
                  {
                    v48 = *(NSObject **)(*(void *)(a1 + 32) + 8);
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v77 = v6;
                      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to add c-rate %@", buf, 0xCu);
                    }
                    goto LABEL_51;
                  }
                  id v40 = (char *)v40 + 1;
                  id v41 = v6;
                }
                while (v38 != v40);
                id v38 = [v22 countByEnumeratingWithState:&v59 objects:v74 count:16];
                if (v38) {
                  continue;
                }
                break;
              }
            }
LABEL_51:

            goto LABEL_52;
          }
          v47 = *(NSObject **)(*(void *)(a1 + 32) + 8);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v77 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Unknown key %@ in resampled callback", buf, 0xCu);
          }
        }
LABEL_53:
      }
      id v56 = [v4 countByEnumeratingWithState:&v70 objects:v78 count:16];
    }
    while (v56);
  }
}

id sub_100012244(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableArray);
  id v3 = [v1 objectForKeyedSubscript:@"NumSegments"];
  unsigned int v4 = [v3 intValue];

  if (v4 == 1)
  {
    long long v5 = [v1 objectForKeyedSubscript:@"CurrSegmentVal"];
    [v2 addObject:v5];
  }
  else
  {
    id v6 = [v1 objectForKeyedSubscript:@"PrevSegmentVal"];
    [v6 floatValue];
    float v8 = v7;

    id v9 = [v1 objectForKeyedSubscript:@"CurrSegmentVal"];
    [v9 floatValue];
    float v11 = v10;

    *(float *)&double v12 = v11 - v8;
    if (v11 < v8) {
      *(float *)&double v12 = v8 - v11;
    }
    float v13 = *(float *)&v12 / (float)v4;
    if (v11 >= v8) {
      float v14 = v13;
    }
    else {
      float v14 = -v13;
    }
    if (v4)
    {
      for (unsigned int i = 1; i <= v4; ++i)
      {
        *(float *)&double v12 = v8 + (float)((float)i * v14);
        unsigned __int8 v16 = +[NSNumber numberWithFloat:v12];
        [v2 addObject:v16];
      }
    }
  }

  return v2;
}

void sub_100014444(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *sub_10001445C(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_100014484(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

BOOL sub_10001449C(id a1)
{
  return MGIsDeviceOneOfType();
}

void sub_100014600()
{
  os_log_t v0 = os_log_create("com.apple.batteryintelligence", "BatteryAlgorithmsHelper");
  id v1 = (void *)qword_100039690;
  qword_100039690 = (uint64_t)v0;

  CFStringRef v155 = @"algorithmName";
  CFStringRef v156 = @"SampleAlgorithm";
  id v2 = +[NSDictionary dictionaryWithObjects:&v156 forKeys:&v155 count:1];
  v157[0] = v2;
  v154[0] = @"OnDeviceACAM";
  v153[0] = @"algorithmName";
  v153[1] = @"algorithmTargetEnBlock";
  id v3 = objc_retainBlock(off_100039558);
  v154[1] = v3;
  unsigned int v4 = +[NSDictionary dictionaryWithObjects:v154 forKeys:v153 count:2];
  v157[1] = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:v157 count:2];

  if (!qword_100039688 || ![(id)qword_100039688 count])
  {
    uint64_t v6 = +[NSMutableArray array];
    float v7 = (void *)qword_100039688;
    qword_100039688 = v6;
  }
  id obj = v5;
  if ((byte_100039699 & 1) == 0)
  {
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id v8 = [obj countByEnumeratingWithState:&v158 objects:v164 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v159;
      do
      {
        for (unsigned int i = 0; i != v9; unsigned int i = (char *)i + 1)
        {
          if (*(void *)v159 != v10) {
            objc_enumerationMutation(obj);
          }
          double v12 = *(void **)(*((void *)&v158 + 1) + 8 * i);
          uint64_t v13 = [v12 objectForKeyedSubscript:@"algorithmTargetEnBlock"];
          float v14 = (void *)v13;
          if (v13 && (*(unsigned int (**)(uint64_t))(v13 + 16))(v13))
          {
            byte_100039698 = 1;
            v15 = [v12 objectForKeyedSubscript:@"algorithmName"];
            unsigned __int8 v16 = objc_alloc_init(BatteryAlgorithmsRunner);
            id v17 = +[NSMutableDictionary dictionary];
            [v17 setObject:v16 forKeyedSubscript:@"algorithmObject"];
            [v17 setObject:v15 forKeyedSubscript:@"algorithmName"];
            [(id)qword_100039688 addObject:v17];
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v158 objects:v164 count:16];
      }
      while (v9);
    }
    byte_100039699 = 1;
  }
  if (byte_100039698 == 1)
  {

    goto LABEL_20;
  }
  v18 = qword_100039690;
  if (!os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
  {
    v121 = obj;
LABEL_130:

    goto LABEL_131;
  }
  *(_WORD *)buf = 0;
  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "None of the Algorithms are enabled", buf, 2u);
  int v19 = byte_100039698;

  if (v19 == 1)
  {
LABEL_20:
    int v20 = sub_100016A68();
    uint64_t v21 = [v20 stringByAppendingFormat:@"%@%@", @"/", @"com.apple.batteryintelligence.batteryalgorithms"];
    id v22 = +[NSFileManager defaultManager];
    *(void *)v164 = 0;
    unsigned __int8 v23 = [v22 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:v164];
    id v24 = *(id *)v164;

    if (v23)
    {
    }
    else
    {
      id v25 = qword_100039690;
      if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_ERROR)) {
        sub_1000207E4((uint64_t)v21, (uint64_t)v24, v25);
      }

      id v26 = qword_100039690;
      if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_ERROR)) {
        sub_100021580((uint64_t)v21, v26);
      }
    }

    v126 = +[BatteryAlgorithmsInit sharedInstance];
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id v139 = (id)qword_100039688;
    id v27 = [v139 countByEnumeratingWithState:&v143 objects:v152 count:16];
    if (v27)
    {
      id v28 = v27;
      CFStringRef v29 = @"algorithmName";
      uint64_t v30 = *(void *)v144;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v144 != v30) {
            objc_enumerationMutation(v139);
          }
          v32 = *(void **)(*((void *)&v143 + 1) + 8 * (void)j);
          unsigned __int8 v33 = [v32 objectForKeyedSubscript:v29];
          id v34 = qword_100039690;
          if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v164 = 138412290;
            *(void *)&v164[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[%@] Algorithm found", v164, 0xCu);
          }
          v35 = [v32 objectForKeyedSubscript:@"algorithmObject"];
          if ([v35 initDone])
          {
            uint64_t v36 = qword_100039690;
            if (!os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_48;
            }
            *(_DWORD *)v164 = 138412290;
            *(void *)&v164[4] = v33;
            id v37 = v36;
            id v38 = "[%@] Init done already. Skipping init";
LABEL_47:
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v38, v164, 0xCu);
            goto LABEL_48;
          }
          CFStringRef v39 = v29;
          [v35 setAlgorithmClassName:v33];
          id v40 = +[NSString stringWithFormat:@"AppleSoftGauging%@", v33];
          [v40 UTF8String];
          uint64_t v41 = _os_feature_enabled_impl();

          [v35 setFeatureFlagEn:v41];
          LOBYTE(v41) = [v35 featureFlagEn];
          unsigned int v42 = qword_100039690;
          BOOL v43 = os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT);
          if ((v41 & 1) == 0)
          {
            CFStringRef v29 = v39;
            if (!v43) {
              goto LABEL_48;
            }
            *(_DWORD *)v164 = 138412290;
            *(void *)&v164[4] = v33;
            id v37 = v42;
            id v38 = "Feature Disabled for %@. Move on";
            goto LABEL_47;
          }
          if (v43)
          {
            *(_DWORD *)v164 = 138412290;
            *(void *)&v164[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "[%@] Algorithm is enabled", v164, 0xCu);
          }
          double v44 = [v35 algoStateData];
          unsigned int v45 = [v126 preInitData];
          [v45 setObject:v44 forKeyedSubscript:@"savedAlgoState"];

          v46 = qword_100039690;
          if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v164 = 138412290;
            *(void *)&v164[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[%@] Call Algorithm init", v164, 0xCu);
          }
          v47 = [v126 preInitData];
          [v35 algoRunnerInitWithData:v47];

          CFStringRef v29 = v39;
          if ([v35 freshInitRequested])
          {
            v48 = qword_100039690;
            if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v164 = 138412290;
              *(void *)&v164[4] = v33;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[%@] Fresh init needed", v164, 0xCu);
            }
            [v126 fullInitDataRead];
            v49 = [v126 fullInitData];
            [v35 algoRunnerFreshInitWithData:v49];
          }
LABEL_48:
        }
        id v28 = [v139 countByEnumeratingWithState:&v143 objects:v152 count:16];
      }
      while (v28);
    }

    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v124 = (id)qword_100039688;
    id v133 = [v124 countByEnumeratingWithState:&v147 objects:&v158 count:16];
    if (v133)
    {
      uint64_t v132 = *(void *)v148;
      do
      {
        unsigned int v50 = 0;
        do
        {
          if (*(void *)v148 != v132) {
            objc_enumerationMutation(v124);
          }
          v51 = [*(id *)(*((void *)&v147 + 1) + 8 * (void)v50) objectForKeyedSubscript:@"algorithmObject"];
          unsigned int v52 = (void *)qword_100039690;
          if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
          {
            long long v53 = v52;
            id v54 = [v51 AlgorithmClassName];
            *(_DWORD *)v164 = 138412290;
            *(void *)&v164[4] = v54;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "[%@] Attempt to run", v164, 0xCu);
          }
          if (([v51 featureFlagEn] & 1) == 0)
          {
            long long v66 = (void *)qword_100039690;
            if (!os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_122;
            }
            long long v67 = v66;
            id v68 = [v51 AlgorithmClassName];
            *(_DWORD *)v164 = 138412290;
            *(void *)&v164[4] = v68;
            id v69 = v67;
            long long v70 = "[%@] Feature Flag disabled. Skipping";
LABEL_65:
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, v70, v164, 0xCu);

            goto LABEL_122;
          }
          if (([v51 initDone] & 1) == 0)
          {
            long long v71 = (void *)qword_100039690;
            if (!os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_122;
            }
            long long v67 = v71;
            id v68 = [v51 AlgorithmClassName];
            *(_DWORD *)v164 = 138412290;
            *(void *)&v164[4] = v68;
            id v69 = v67;
            long long v70 = "[%@] Init is still pending. Skipping";
            goto LABEL_65;
          }
          id v55 = v51;
          id v56 = +[NSDate now];
          id v57 = [v55 runMetaData];
          id v58 = [v57 objectForKey:@"LastRunDate"];

          long long v59 = sub_100016ECC();
          long long v60 = v59;
          v127 = v50;
          v125 = v51;
          v134 = v55;
          v136 = v56;
          if (v59)
          {
            id v140 = [v59 objectForKey:@"BatteryData"];
            v137 = [v60 objectForKey:@"ChargerData"];
            long long v61 = [v140 objectForKey:@"LifetimeData"];
            long long v62 = [v60 objectForKey:@"CycleCount"];
            id v63 = [v61 objectForKey:@"TotalOperatingTime"];
            long long v64 = [v137 objectForKey:@"VacVoltageLimit"];
            long long v65 = [v61 objectForKey:@"TimeAtHighSoc"];
            *(void *)buf = @"VacVoltageLimit";
            *(void *)&buf[8] = @"CycleCount";
            *(void *)&long long v166 = @"TimeAtHighSoc";
            *(void *)v164 = v64;
            *(void *)&v164[8] = v62;
            *((void *)&v166 + 1) = @"TotalOperatingTime";
            *(void *)&v164[16] = v65;
            *(void *)&v164[24] = v63;
            v128 = +[NSDictionary dictionaryWithObjects:v164 forKeys:buf count:4];

            id v55 = v134;
            id v56 = v136;
          }
          else
          {
            v128 = 0;
          }

          if (!v58)
          {
            id v58 = [v56 dateByAddingTimeInterval:-2592000.0];
            long long v72 = qword_100039690;
            if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v164 = 0;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "We could not determine when was the last time we ran, pick last 30 days", v164, 2u);
            }
          }
          long long v73 = qword_100039690;
          if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v164 = 138412290;
            *(void *)&v164[4] = v58;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Last time we ran till [%@]", v164, 0xCu);
          }
          id v74 = v58;
          if ([v56 compare:v74] == (id)-1)
          {
            v110 = qword_100039690;
            if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v164 = 138412546;
              *(void *)&v164[4] = v74;
              *(_WORD *)&v164[12] = 2112;
              *(void *)&v164[14] = v56;
              _os_log_error_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_ERROR, "dateFrom [%@] is greater than today [%@]. Cannot Continue", v164, 0x16u);
            }
            int v111 = -84;
            v112 = v74;
          }
          else
          {
            v75 = [v74 dateByAddingTimeInterval:86400.0];
            if ([v56 compare:v75] == (id)-1)
            {
              v76 = qword_100039690;
              if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v164 = 138412546;
                *(void *)&v164[4] = v75;
                *(_WORD *)&v164[12] = 2112;
                *(void *)&v164[14] = v56;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "dateTill [%@] >= today [%@]. Truncate", v164, 0x16u);
              }
              id v77 = v56;

              v75 = v77;
            }
            v78 = qword_100039690;
            if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v164 = 138412546;
              *(void *)&v164[4] = v74;
              *(_WORD *)&v164[12] = 2112;
              *(void *)&v164[14] = v56;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Total data to process [%@] to [%@]", v164, 0x16u);
            }
            id v122 = v74;
            if ([v56 compare:v74] == (id)1)
            {
              int v135 = 0;
              id v142 = v74;
              while (1)
              {
                uint64_t v79 = qword_100039690;
                if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v164 = 67109634;
                  *(_DWORD *)&v164[4] = v135;
                  *(_WORD *)&v164[8] = 2112;
                  v80 = v142;
                  *(void *)&v164[10] = v142;
                  *(_WORD *)&v164[18] = 2112;
                  *(void *)&v164[20] = v75;
                  _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Running chunk #%d from [%@] to [%@]", v164, 0x1Cu);
                  ++v135;
                }
                else
                {
                  v80 = v142;
                }
                id v81 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v80 endDate:v75];
                v82 = +[NSSet setWithArray:&off_1000334A8];
                id v83 = objc_alloc((Class)PPSTimeSeriesRequest);
                v84 = +[NSPredicate predicateWithFormat:@"(subsystem == 'BatteryDataCollection' AND category == 'BDC_AMA' AND (AlgoTemperature >= 0 OR AlgoTemperature < 0))"];
                id v85 = [v83 initWithMetrics:v82 predicate:v84 timeFilter:v81 limitCount:86400 offsetCount:0];

                uint64_t v86 = +[NSMutableArray array];
                id v141 = v75;
                if (v85)
                {
                  id v151 = 0;
                  v87 = PerfPowerServicesGetData();
                  id v138 = v151;
                  if (v138)
                  {
                    id v88 = +[NSNull null];
                  }
                  else
                  {
                    id v130 = v85;
                    id v131 = v81;
                    long long v167 = 0u;
                    long long v168 = 0u;
                    *(_OWORD *)buf = 0u;
                    long long v166 = 0u;
                    v129 = v87;
                    id v89 = v87;
                    id v90 = [v89 countByEnumeratingWithState:buf objects:v164 count:16];
                    if (v90)
                    {
                      id v91 = v90;
                      uint64_t v92 = *(void *)v166;
                      do
                      {
                        for (k = 0; k != v91; k = (char *)k + 1)
                        {
                          if (*(void *)v166 != v92) {
                            objc_enumerationMutation(v89);
                          }
                          id v94 = *(void **)(*(void *)&buf[8] + 8 * (void)k);
                          id v95 = [v94 metricKeysAndValues];
                          v96 = +[NSMutableDictionary dictionary];
                          v97 = [v95 objectForKeyedSubscript:@"Voltage"];
                          [v96 setObject:v97 forKeyedSubscript:@"Voltage"];

                          v98 = [v95 objectForKeyedSubscript:@"InstantAmperage"];
                          [v96 setObject:v98 forKeyedSubscript:@"InstantAmperage"];

                          id v99 = [v95 objectForKeyedSubscript:@"PresentDOD"];
                          [v96 setObject:v99 forKeyedSubscript:@"PresentDOD"];

                          id v100 = [v95 objectForKeyedSubscript:@"VirtualTemperature"];
                          [v96 setObject:v100 forKeyedSubscript:@"VirtualTemperature"];

                          [v94 epochTimestamp];
                          id v101 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
                          [v96 setObject:v101 forKeyedSubscript:@"Timestamp"];

                          [v86 addObject:v96];
                        }
                        id v91 = [v89 countByEnumeratingWithState:buf objects:v164 count:16];
                      }
                      while (v91);
                    }

                    id v88 = v86;
                    unsigned int v50 = v127;
                    id v55 = v134;
                    id v81 = v131;
                    v80 = v142;
                    v87 = v129;
                    id v85 = v130;
                  }
                }
                else
                {
                  id v88 = +[NSNull null];
                }

                v102 = v81;
                id v56 = v136;
                if (!v88) {
                  goto LABEL_103;
                }
                v103 = +[NSNull null];
                if ([v88 isEqual:v103]) {
                  goto LABEL_102;
                }
                id v104 = [v88 count];

                if (v104) {
                  break;
                }
LABEL_103:
                long long v106 = [v55 runMetaData];
                [v106 setValue:v141 forKey:@"LastRunDate"];

                id v74 = [v80 dateByAddingTimeInterval:86400.0];

                long long v107 = [v141 dateByAddingTimeInterval:86400.0];

                if ([v136 compare:v107] != (id)1)
                {
                  long long v108 = qword_100039690;
                  if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v164 = 138412546;
                    *(void *)&v164[4] = v107;
                    *(_WORD *)&v164[12] = 2112;
                    *(void *)&v164[14] = v136;
                    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "dateTill [%@] is > than today [%@]. Truncate", v164, 0x16u);
                  }
                  id v109 = v136;

                  long long v107 = v109;
                }

                id v142 = v74;
                v75 = v107;
                if ([v136 compare:v74] != (id)1) {
                  goto LABEL_113;
                }
              }
              v162[0] = @"amaStreamData";
              v162[1] = @"smcData";
              v163[0] = v88;
              v163[1] = v128;
              v103 = +[NSDictionary dictionaryWithObjects:v163 forKeys:v162 count:2];
              unsigned int v105 = [v55 algoRunnerExecuteWithData:v103];
              if (v105)
              {
                int v111 = v105;
                v119 = qword_100039690;
                if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v164 = 67109120;
                  *(_DWORD *)&v164[4] = v111;
                  _os_log_error_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, "Unable to execute run function %d", v164, 8u);
                }

                long long v107 = v141;
                goto LABEL_114;
              }
              id v55 = v134;
LABEL_102:

              goto LABEL_103;
            }
            long long v107 = v75;
LABEL_113:
            v102 = [v55 runMetaData];
            [v102 setValue:v107 forKey:@"LastRunDate"];
            int v111 = 0;
            id v142 = v74;
LABEL_114:

            id v74 = v122;
            v51 = v125;
            v112 = v142;
          }

          if (!v111)
          {
            id v113 = qword_100039690;
            if (os_log_type_enabled((os_log_t)qword_100039690, OS_LOG_TYPE_DEFAULT))
            {
              v114 = v113;
              v115 = v134;
              v116 = [v134 AlgorithmClassName];
              *(_DWORD *)v164 = 138412290;
              *(void *)&v164[4] = v116;
              _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "[%@] Done running", v164, 0xCu);

              id v113 = qword_100039690;
            }
            else
            {
              v115 = v134;
            }
            if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
            {
              v117 = v113;
              v118 = [v115 AlgorithmClassName];
              *(_DWORD *)v164 = 138412290;
              *(void *)&v164[4] = v118;
              _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "[%@] Calling output ", v164, 0xCu);
            }
            [v115 algoRunnerStoreOutput];
          }
LABEL_122:

          unsigned int v50 = (char *)v50 + 1;
        }
        while (v50 != v133);
        id v120 = [v124 countByEnumeratingWithState:&v147 objects:&v158 count:16];
        id v133 = v120;
      }
      while (v120);
    }

    v121 = v126;
    goto LABEL_130;
  }
LABEL_131:
}

uint64_t sub_100015B40(uint64_t a1)
{
  qword_1000396A0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

CFStringRef sub_100016A5C()
{
  return @"/var/db/Battery/BDC";
}

CFStringRef sub_100016A68()
{
  return @"/var/db/Battery/BI";
}

char *sub_100016A74(char *category)
{
  if (category)
  {
    category = (char *)os_log_create("com.apple.batteryintelligence", category);
    uint64_t v1 = vars8;
  }
  return category;
}

NSDate *sub_100016AAC(void *a1, unsigned int a2)
{
  [a1 timeIntervalSince1970];
  double v4 = floor(v3 / (float)a2) * (double)a2;

  return +[NSDate dateWithTimeIntervalSince1970:v4];
}

id sub_100016B04(unint64_t a1)
{
  if (a1 < 0x14 && ((0xC07FFu >> a1) & 1) != 0)
  {
    uint64_t v1 = [@"/var/db/Battery/BI" stringByAppendingFormat:@"%@%@", @"/", *(&off_100030AE8 + a1)];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021820();
    }
    uint64_t v1 = 0;
  }

  return v1;
}

id sub_100016BAC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[NSURL fileURLWithPath:v4 isDirectory:0];
  uint64_t v6 = +[NSFileManager defaultManager];
  if ([v6 fileExistsAtPath:v4])
  {
    id v13 = 0;
    unsigned __int8 v7 = [v6 removeItemAtURL:v5 error:&v13];
    id v8 = v13;
    if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021900();
    }
  }
  else
  {
    id v8 = 0;
  }
  id v12 = v8;
  id v9 = [v3 writeToURL:v5 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100021890();
  }

  return v9;
}

id sub_100016CF0(void *a1, unint64_t a2)
{
  id v3 = a1;
  id v4 = sub_100016B04(a2);
  if (v4)
  {
    id v5 = sub_100016BAC(v3, v4);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021970();
    }
    id v5 = 0;
  }

  return v5;
}

uint64_t sub_100016D78()
{
  if (qword_1000396C0 != -1) {
    dispatch_once(&qword_1000396C0, &stru_100030AA8);
  }
  return byte_1000396B8;
}

void sub_100016DBC(id a1)
{
  byte_1000396B8 = _os_feature_enabled_impl();
}

id sub_100016DEC(void *a1)
{
  id v1 = a1;
  id v2 = +[NSURL fileURLWithPath:v1 isDirectory:0];
  id v7 = 0;
  id v3 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v2 error:&v7];
  id v4 = v7;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000219E0();
    }
    id v5 = 0;
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

CFDictionaryRef sub_100016ECC()
{
  kern_return_t v1;
  BOOL v2;
  CFDictionaryRef v3;
  CFMutableDictionaryRef properties;
  uint64_t vars8;

  properties = 0;
  io_service_t MatchingService = dword_1000396F8;
  if (dword_1000396F8)
  {
LABEL_2:
    id v1 = IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0);
    if (properties) {
      id v2 = v1 == 0;
    }
    else {
      id v2 = 0;
    }
    if (v2) {
      id v3 = properties;
    }
    else {
      id v3 = 0;
    }
    goto LABEL_8;
  }
  id v3 = IOServiceMatching("IOPMPowerSource");
  if (v3)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
    dword_1000396F8 = MatchingService;
    if (MatchingService) {
      goto LABEL_2;
    }
    id v3 = 0;
  }
LABEL_8:

  return v3;
}

id sub_100016F6C()
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  id result = (id)sub_100016FE4(@"BatteryData", TypeID);
  if (result)
  {
    id v2 = result;
    id v3 = [result objectForKeyedSubscript:@"Qmax"];
    id v4 = [v3 firstObject];
    id v5 = [v4 unsignedIntValue];

    return v5;
  }
  return result;
}

const void *sub_100016FE4(void *a1, uint64_t a2)
{
  id v3 = a1;
  CFDictionaryRef v4 = IOServiceMatching("AppleSmartBattery");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (MatchingService)
  {
    io_object_t v6 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, v3, kCFAllocatorDefault, 0);
    id v8 = CFProperty;
    if (CFProperty && CFGetTypeID(CFProperty) == a2) {
      goto LABEL_7;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100021A98();
      if (!v8) {
        goto LABEL_7;
      }
    }
    else if (!v8)
    {
LABEL_7:
      IOObjectRelease(v6);
      goto LABEL_8;
    }
    CFRelease(v8);
    id v8 = 0;
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100021A50();
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

uint64_t sub_1000170F4()
{
  return 0;
}

id sub_10001712C()
{
  CFTypeID TypeID = CFNumberGetTypeID();
  id result = (id)sub_100016FE4(@"NominalChargeCapacity", TypeID);
  if (result)
  {
    id v2 = result;
    id v3 = [result unsignedIntValue];

    return v3;
  }
  return result;
}

id sub_100017174()
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  id v1 = (void *)sub_100016FE4(@"BatteryData", TypeID);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  id v3 = [v1 objectForKeyedSubscript:@"WeightedRa"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 unsignedIntValue];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v3 firstObject];
      id v4 = [v5 unsignedIntValue];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100021B28();
      }
      id v4 = 0;
    }
  }

  return v4;
}

uint64_t sub_100017268()
{
  if (qword_1000396D0 != -1) {
    dispatch_once(&qword_1000396D0, &stru_100030AC8);
  }
  return dword_1000396C8;
}

void sub_1000172AC(id a1)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  id v2 = (void *)sub_100016FE4(@"DesignCapacity", TypeID);
  if (v2)
  {
    id v3 = v2;
    dword_1000396C8 = [v2 unsignedIntValue];
  }
}

uint64_t sub_100017310()
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  id v1 = (void *)sub_100016FE4(@"BatteryData", TypeID);
  if (v1)
  {
    id v2 = v1;
    id v3 = [v1 objectForKeyedSubscript:@"LifetimeData"];
    id v4 = [v3 objectForKeyedSubscript:@"TotalOperatingTime"];

    dword_1000396D8 = [v4 unsignedIntValue];
  }
  return dword_1000396D8;
}

uint64_t sub_100017398()
{
  CFTypeID TypeID = CFNumberGetTypeID();
  id v1 = (void *)sub_100016FE4(@"CycleCount", TypeID);
  if (v1)
  {
    id v2 = v1;
    dword_1000396DC = [v1 unsignedIntValue];
  }
  return dword_1000396DC;
}

uint64_t sub_1000173E4()
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  id v1 = (void *)sub_100016FE4(@"BatteryData", TypeID);
  if (v1)
  {
    id v2 = v1;
    id v3 = [v1 objectForKeyedSubscript:@"AlgoChemID"];
    dword_1000396E0 = [v3 unsignedIntValue];
  }
  return dword_1000396E0;
}

uint64_t sub_100017450()
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  id v1 = (void *)sub_100016FE4(@"BatteryData", TypeID);
  if (v1)
  {
    id v2 = v1;
    id v3 = [v1 objectForKeyedSubscript:@"LifetimeData"];
    id v4 = [v3 objectForKeyedSubscript:@"MaximumTemperature"];

    word_1000396E4 = (unsigned __int16)[v4 unsignedIntValue];
  }
  return (unsigned __int16)word_1000396E4;
}

BOOL sub_1000174D8(_WORD *a1, unsigned __int8 *a2)
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    io_object_t v6 = sub_100016FE4(@"Serial", TypeID);
    if (v6)
    {
      id v7 = v6;
      int v8 = IOPSGetYearAndWeekOfManufactureFromBatterySerial();
      BOOL v2 = v8 != 0;
      CFRelease(v7);
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100021C40();
        }
        id v9 = [0 substringWithRange:0, 1];
        id v10 = [0 substringWithRange:1, 2];
        v18 = v9;
        unsigned __int16 v11 = (unsigned __int16)[v9 integerValue];
        unsigned __int8 v12 = [v10 integerValue];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100021BB0(v12, v11);
        }
        id v13 = +[NSCalendar currentCalendar];
        float v14 = +[NSDate now];
        unsigned __int16 v15 = (unsigned __int16)[v13 component:4 fromDate:v14];

        if (v11 <= v15 % 0xAu) {
          __int16 v16 = v15 - v15 % 0xAu;
        }
        else {
          __int16 v16 = v15 - v15 % 0xAu - 10;
        }
        *a1 = v16 + v11;
        *a2 = v12;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100021CBC();
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

id sub_1000176D0(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  if (v1 && [v1 count])
  {
    id v3 = [v2 sortedArrayUsingSelector:"compare:"];
    id v4 = [v3 objectAtIndex:(((unint64_t)objc_msgSend(v2, "count") - 1) >> 1)];
  }
  else
  {
    id v4 = +[NSNull null];
  }

  return v4;
}

id sub_100017778(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  if (v1 && [v1 count])
  {
    id v3 = [v2 sortedArrayUsingSelector:"compare:"];
    id v4 = [v3 lastObject];
  }
  else
  {
    id v4 = +[NSNull null];
  }

  return v4;
}

id sub_10001780C(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  if (v1 && [v1 count])
  {
    id v3 = [v2 sortedArrayUsingSelector:"compare:"];
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = +[NSNull null];
  }

  return v4;
}

id sub_1000178A0(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[NSCalendar currentCalendar];
  id v12 = 0;
  [v5 rangeOfUnit:16 startDate:&v12 interval:0 forDate:v4];

  id v6 = v12;
  id v11 = 0;
  [v5 rangeOfUnit:16 startDate:&v11 interval:0 forDate:v3];

  id v7 = v11;
  int v8 = [v5 components:16 fromDate:v6 toDate:v7 options:0];
  id v9 = [v8 day];

  return v9;
}

id sub_100017990(void *a1)
{
  id v1 = a1;
  if (qword_1000396D0 != -1) {
    dispatch_once(&qword_1000396D0, &stru_100030AC8);
  }
  unsigned int v2 = dword_1000396C8;
  if ([v1 isEqualToString:@"nccp"])
  {
    unsigned int v3 = sub_10001712C();
LABEL_7:
    *(float *)&double v4 = (float)v3 / (float)v2;
LABEL_8:
    id v5 = +[NSNumber numberWithFloat:v4];
    goto LABEL_9;
  }
  if ([v1 isEqualToString:@"qmaxp"])
  {
    unsigned int v3 = sub_100016F6C();
    goto LABEL_7;
  }
  if ([v1 isEqualToString:@"wra"])
  {
    *(float *)&double v4 = (float)sub_100017174();
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100021D04();
  }
  id v5 = 0;
LABEL_9:

  return v5;
}

uint64_t sub_100017B44(uint64_t a1)
{
  qword_1000396E8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_10001812C(void *a1)
{
  id v1 = a1;
  unsigned int v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 pathForResource:v1 ofType:@"mlmodelc"];

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021D74();
    }
    goto LABEL_13;
  }
  double v4 = +[NSURL fileURLWithPath:v3];
  id v5 = +[MLModel modelWithContentsOfURL:v4 error:0];

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021DE4();
    }
    goto LABEL_13;
  }
  id v6 = [v5 modelDescription];
  id v7 = [v6 metadata];

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021E54();
    }
LABEL_12:

LABEL_13:
    id v17 = 0;
    goto LABEL_17;
  }
  int v8 = [v5 modelDescription];
  id v9 = [v8 metadata];
  id v10 = [v9 objectForKeyedSubscript:MLModelVersionStringKey];

  id v11 = [v5 modelDescription];
  id v12 = [v11 predictedFeatureName];

  id v13 = [v5 modelDescription];
  float v14 = v13;
  if (!v12)
  {
    v18 = [v13 outputDescriptionsByName];

    if (v18)
    {
      float v14 = [v5 modelDescription];
      unsigned __int16 v15 = [v14 outputDescriptionsByName];
      id v16 = [v15 allKeys];
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100021EC4();
    }

    goto LABEL_12;
  }
  unsigned __int16 v15 = [v13 predictedFeatureName];
  id v16 = [v15 copy];
LABEL_16:
  int v19 = v16;

  v21[0] = @"mlModel";
  v21[1] = @"version";
  v22[0] = v5;
  v22[1] = v10;
  v21[2] = @"predictedFeatureNames";
  v22[2] = v19;
  id v17 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

LABEL_17:

  return v17;
}

uint64_t sub_10001840C()
{
  return _PLQueryRegistered(1, @"XPCCacheFlush", 0);
}

void sub_100018438(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_100018454(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v2 = (uint64_t)[v1 integerValue];
      if (v2 < 101)
      {
        if ((v2 & 0x8000000000000000) == 0)
        {
          if (v2) {
            uint64_t v3 = v2 - (v2 - 1) % 0xAu + 4;
          }
          else {
            uint64_t v3 = 5;
          }
          double v4 = +[NSNumber numberWithInteger:v3];
          goto LABEL_12;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100021FA4();
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100021F34();
      }
    }
  }
  double v4 = 0;
LABEL_12:

  return v4;
}

id sub_100018554(uint64_t a1, double a2)
{
  if (a1)
  {
    uint64_t v2 = +[NSNumber numberWithInteger:(uint64_t)(floor(a2 / (double)(60 * a1)) * (double)a1)];
  }
  else
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_100022014(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_100018628(id a1)
{
  qword_100039700 = objc_alloc_init(TimeTo80Listener);

  _objc_release_x1();
}

void sub_100018940(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) collectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018A1C;
  block[3] = &unk_100030BB0;
  id v11 = v5;
  id v12 = v6;
  uint64_t v13 = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, block);
}

void sub_100018A1C(uint64_t a1)
{
  uint64_t v2 = (void *)os_transaction_create();
  BOOL v3 = qword_100039710;
  if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEBUG)) {
    sub_10002208C(a1, v3);
  }
  if ([*(id *)(a1 + 48) canComputeCoreAnalyticsMetrics])
  {
    [*(id *)(a1 + 48) computeAndSendCoreAnalyticsMetrics];
    [(id)qword_100039718 setBool:1 forKey:@"caMetricsComputed"];
  }
}

void sub_100019CCC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019CF0()
{
  uint64_t state64 = 0;
  int out_token = 0;
  notify_register_check("com.apple.system.powersources.timeremaining", &out_token);
  if (notify_is_valid_token(out_token))
  {
    notify_get_state(out_token, &state64);
    notify_cancel(out_token);
    return BYTE2(state64) & 1;
  }
  else
  {
    uint64_t v1 = qword_100039710;
    BOOL v2 = os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (v2)
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Invalid registration token for kIOPSNotifyTimeRemaining", v3, 2u);
      return 0;
    }
  }
  return result;
}

void sub_100019DA4(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 1)
  {
    +[BIXPCAlarm setAlarmWithName:@"tt80RunAtPlugin" withClock:4 afterSeconds:1 wakeUpAP:10.0];
    uint64_t v4 = qword_100039710;
    if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)float v14 = 134218242;
      *(void *)&v14[4] = 0x4024000000000000;
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = @"tt80RunAtPlugin";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Alarm set after %g seconds for %@!", v14, 0x16u);
    }
    id v5 = (void *)qword_100039718;
    id v6 = +[NSNumber numberWithUnsignedChar:a2];
    [v5 setObject:v6 forKey:@"LastConnectedState"];

    *(void *)float v14 = 0;
    *(void *)&v14[8] = 0;
    clock_gettime(_CLOCK_MONOTONIC_RAW, (timespec *)v14);
    uint64_t v7 = (void *)qword_100039718;
    id v8 = +[NSNumber numberWithLongLong:*(void *)v14];
    [v7 setObject:v8 forKey:@"monotonicPluginTimeInSeconds"];

    [(id)qword_100039718 setBool:0 forKey:@"caMetricsComputed"];
  }
  else
  {
    +[BIXPCAlarm deleteAlarmWithName:@"tt80RunAtPlugin"];
    +[BIXPCAlarm deleteAlarmWithName:@"tt80RunDuringChargingSession"];
    id v9 = qword_100039710;
    if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)float v14 = 138412546;
      *(void *)&v14[4] = @"tt80RunAtPlugin";
      *(_WORD *)&v14[12] = 2112;
      *(void *)&v14[14] = @"tt80RunDuringChargingSession";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Deleted alarms: %@ and %@.", v14, 0x16u);
    }
    uint64_t v10 = (void *)qword_100039718;
    id v11 = +[NSNumber numberWithUnsignedChar:a2];
    [v10 setObject:v11 forKey:@"LastConnectedState"];

    int v12 = sub_1000170F4();
    if ((v12 & 0xFFFFFFFC) == 0x4C && [*(id *)(a1 + 32) canComputeCoreAnalyticsMetrics])
    {
      [*(id *)(a1 + 32) computeAndSendCoreAnalyticsMetrics];
    }
    else
    {
      uint64_t v13 = qword_100039710;
      if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEBUG)) {
        sub_100022324(v12, v13);
      }
    }
  }
}

void sub_10001A034(uint64_t a1)
{
  BOOL v2 = (void *)os_transaction_create();
  if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEBUG)) {
    sub_10002239C();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001A0AC(uint64_t a1)
{
  BOOL v2 = (void *)os_transaction_create();
  int v3 = sub_100019CF0();
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v3 != *(unsigned __int8 *)(v4 + 24))
  {
    *(unsigned char *)(v4 + 24) = v3;
    id v5 = qword_100039710;
    if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connected state changed to %u", (uint8_t *)v7, 8u);
    }
    if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEBUG)) {
      sub_1000223DC();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10001A284(uint64_t a1)
{
  BOOL v2 = (void *)os_transaction_create();
  uint64_t v3 = sub_100019CF0();
  unsigned int v4 = sub_1000170F4();
  unsigned int v5 = v4;
  int v6 = qword_100039710;
  if (v3 && v4 < 0x4C)
  {
    if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Running TT80 inference!", (uint8_t *)&v13, 2u);
    }
    uint64_t v7 = +[TimeTo80Estimator sharedPredictor];
    [v7 predictAndRecordWithParams:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) postNotificationForChargeTimeEstimateUpdate];
    if (*(unsigned char *)(a1 + 48))
    {
      +[BIXPCAlarm setAlarmWithName:@"tt80RunDuringChargingSession" withClock:4 afterSeconds:1 wakeUpAP:420.0];
      id v8 = qword_100039710;
      if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_INFO))
      {
        int v13 = 134218242;
        *(void *)float v14 = 0x407A400000000000;
        *(_WORD *)&v14[8] = 2112;
        CFStringRef v15 = @"tt80RunDuringChargingSession";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Alarm set after %g seconds for %@!", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109376;
      *(_DWORD *)float v14 = v3 == 0;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = v5 > 0x4B;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Aborting inference: %u %u", (uint8_t *)&v13, 0xEu);
    }
    id v9 = [(id)qword_100039718 objectForKey:@"LastConnectedState"];
    if ([v9 unsignedIntValue] != v3)
    {
      uint64_t v10 = qword_100039710;
      if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 67109120;
        *(_DWORD *)float v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Connected state changed during inference time to %u", (uint8_t *)&v13, 8u);
      }
      id v11 = (void *)qword_100039718;
      int v12 = +[NSNumber numberWithUnsignedChar:v3];
      [v11 setObject:v12 forKey:@"LastConnectedState"];
    }
  }
}

id sub_10001A9D0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10001B068(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[ocv_drift_model alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10001B330(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    int v6 = [ocv_drift_modelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"Prediction"];
    id v8 = [v7 multiArrayValue];
    id v9 = [(ocv_drift_modelOutput *)v6 initWithPrediction:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void (**)(uint64_t, void, ocv_drift_modelOutput *))(v10 + 16);
    id v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_10001B508(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    int v6 = [ocv_drift_modelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"Prediction"];
    id v8 = [v7 multiArrayValue];
    id v9 = [(ocv_drift_modelOutput *)v6 initWithPrediction:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void (**)(uint64_t, void, ocv_drift_modelOutput *))(v10 + 16);
    id v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_10001C138(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[nccp_wra_qmaxp_seq_model alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10001C4EC(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  if (v21)
  {
    id v20 = a3;
    id v5 = [nccp_wra_qmaxp_seq_modelOutput alloc];
    int v19 = [v21 featureValueForName:@"nccp_wra_qmaxp_q10_forecast"];
    int v6 = [v19 multiArrayValue];
    uint64_t v7 = [v21 featureValueForName:@"nccp_wra_qmaxp_q25_forecast"];
    id v8 = [v7 multiArrayValue];
    id v9 = [v21 featureValueForName:@"nccp_wra_qmaxp_q50_forecast"];
    uint64_t v10 = [v9 multiArrayValue];
    id v11 = [v21 featureValueForName:@"nccp_wra_qmaxp_q75_forecast"];
    id v12 = [v11 multiArrayValue];
    [v21 featureValueForName:@"nccp_wra_qmaxp_q90_forecast"];
    int v13 = v18 = a1;
    float v14 = [v13 multiArrayValue];
    CFStringRef v15 = [(nccp_wra_qmaxp_seq_modelOutput *)v5 initWithNccp_wra_qmaxp_q10_forecast:v6 nccp_wra_qmaxp_q25_forecast:v8 nccp_wra_qmaxp_q50_forecast:v10 nccp_wra_qmaxp_q75_forecast:v12 nccp_wra_qmaxp_q90_forecast:v14];

    (*(void (**)(void))(*(void *)(v18 + 32) + 16))();
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void (**)(uint64_t, void, nccp_wra_qmaxp_seq_modelOutput *))(v16 + 16);
    CFStringRef v15 = a3;
    v17(v16, 0, v15);
  }
}

void sub_10001C7A4(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  if (v21)
  {
    id v20 = a3;
    id v5 = [nccp_wra_qmaxp_seq_modelOutput alloc];
    int v19 = [v21 featureValueForName:@"nccp_wra_qmaxp_q10_forecast"];
    int v6 = [v19 multiArrayValue];
    uint64_t v7 = [v21 featureValueForName:@"nccp_wra_qmaxp_q25_forecast"];
    id v8 = [v7 multiArrayValue];
    id v9 = [v21 featureValueForName:@"nccp_wra_qmaxp_q50_forecast"];
    uint64_t v10 = [v9 multiArrayValue];
    id v11 = [v21 featureValueForName:@"nccp_wra_qmaxp_q75_forecast"];
    id v12 = [v11 multiArrayValue];
    [v21 featureValueForName:@"nccp_wra_qmaxp_q90_forecast"];
    int v13 = v18 = a1;
    float v14 = [v13 multiArrayValue];
    CFStringRef v15 = [(nccp_wra_qmaxp_seq_modelOutput *)v5 initWithNccp_wra_qmaxp_q10_forecast:v6 nccp_wra_qmaxp_q25_forecast:v8 nccp_wra_qmaxp_q50_forecast:v10 nccp_wra_qmaxp_q75_forecast:v12 nccp_wra_qmaxp_q90_forecast:v14];

    (*(void (**)(void))(*(void *)(v18 + 32) + 16))();
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = *(void (**)(uint64_t, void, nccp_wra_qmaxp_seq_modelOutput *))(v16 + 16);
    CFStringRef v15 = a3;
    v17(v16, 0, v15);
  }
}

void sub_10001D320(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[tt80_lstm_regression alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10001D5E8(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    int v6 = [tt80_lstm_regressionOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"tt80_prediction_in_hrs"];
    id v8 = [v7 multiArrayValue];
    id v9 = [(tt80_lstm_regressionOutput *)v6 initWithTt80_prediction_in_hrs:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void (**)(uint64_t, void, tt80_lstm_regressionOutput *))(v10 + 16);
    id v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_10001D7C0(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    int v6 = [tt80_lstm_regressionOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"tt80_prediction_in_hrs"];
    id v8 = [v7 multiArrayValue];
    id v9 = [(tt80_lstm_regressionOutput *)v6 initWithTt80_prediction_in_hrs:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void (**)(uint64_t, void, tt80_lstm_regressionOutput *))(v10 + 16);
    id v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_10001E204(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[state_estimation_model alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10001E4CC(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    int v6 = [state_estimation_modelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"health_state_estimation"];
    id v8 = [v7 multiArrayValue];
    id v9 = [(state_estimation_modelOutput *)v6 initWithHealth_state_estimation:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void (**)(uint64_t, void, state_estimation_modelOutput *))(v10 + 16);
    id v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_10001E6A4(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    int v6 = [state_estimation_modelOutput alloc];
    uint64_t v7 = [v12 featureValueForName:@"health_state_estimation"];
    id v8 = [v7 multiArrayValue];
    id v9 = [(state_estimation_modelOutput *)v6 initWithHealth_state_estimation:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void (**)(uint64_t, void, state_estimation_modelOutput *))(v10 + 16);
    id v9 = a3;
    v11(v10, 0, v9);
  }
}

void sub_10001E9F4()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Super init failed for BatteryAlgoInputs", v0, 2u);
}

void sub_10001EA3C()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Super init failed", v0, 2u);
}

void sub_10001EA84(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100004F68() name];
  sub_100004F40();
  sub_100004F20((void *)&_mh_execute_header, v4, v5, "Asset path for %@ not found", v6, v7, v8, v9, v10);
}

void sub_10001EB14(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100004F68() name];
  sub_100004F40();
  sub_100004F20((void *)&_mh_execute_header, v4, v5, "ML model file for %@ not found", v6, v7, v8, v9, v10);
}

void sub_10001EBA4(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100004F68() name];
  sub_100004F40();
  sub_100004F20((void *)&_mh_execute_header, v4, v5, "Failed at reading predicted feature name for %@", v6, v7, v8, v9, v10);
}

void sub_10001EC34(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100004F68() name];
  sub_100004F40();
  sub_100004F20((void *)&_mh_execute_header, v4, v5, "Failed at reading metadata for %@", v6, v7, v8, v9, v10);
}

void sub_10001ECC4()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, v0, v1, "Using updated params during inference: %@", v2, v3, v4, v5, v6);
}

void sub_10001ED2C()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, v0, v1, "Recieved params for inference: %@", v2, v3, v4, v5, v6);
}

void sub_10001ED94(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = [a2 name];
  sub_100004F40();
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not get model predictions for %@ for %@", v7, 0x16u);
}

void sub_10001EE50(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Nil params.", v1, 2u);
}

void sub_10001EE94()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, v0, v1, "Missing %@ key in params dictionary", v2, v3, v4, v5, v6);
}

void sub_10001EEFC(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 objectForKey:@"health_metric"];
  sub_100004F40();
  sub_100004F20((void *)&_mh_execute_header, v5, v6, "Unable to get current value for metric: %@", v7, v8, v9, v10, v11);
}

void sub_10001EF98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001EFD4()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Failed to create Global FeatureGen", v2, v3, v4, v5, v6);
}

void sub_10001F008()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Failed to get health history.", v2, v3, v4, v5, v6);
}

void sub_10001F03C()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Failed to get usage history.", v2, v3, v4, v5, v6);
}

void sub_10001F070()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, v0, v1, "Unable to get health features for unknown model type: %@.", v2, v3, v4, v5, v6);
}

void sub_10001F0D8(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = qword_100039608;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Last feature gen date %@", (uint8_t *)&v1, 0xCu);
}

void sub_10001F15C()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, v0, v1, "Unknown modelName: %@", v2, v3, v4, v5, v6);
}

void sub_10001F1C4()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Error while copying input features.", v2, v3, v4, v5, v6);
}

void sub_10001F1F8()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, v0, v1, "Error while creating feature provider: %@", v2, v3, v4, v5, v6);
}

void sub_10001F260()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Error while running inference.", v2, v3, v4, v5, v6);
}

void sub_10001F294()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, v0, v1, "Error while copying input features: %@", v2, v3, v4, v5, v6);
}

void sub_10001F2FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F334()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, v0, v1, "Error in running inference: %@", v2, v3, v4, v5, v6);
}

void sub_10001F39C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001F3D4(void *a1, void *a2)
{
  id v3 = a1;
  [a2 integerValue];
  sub_10000805C((void *)&_mh_execute_header, v4, v5, "Not enough history to make prediction; only received %d rows",
    v6,
    v7,
    v8,
    v9,
    0);
}

void sub_10001F460(void *a1, void *a2)
{
  id v3 = a1;
  [a2 integerValue];
  sub_10000805C((void *)&_mh_execute_header, v4, v5, "Not enough history to make prediction; after processing now have %d valid rows",
    v6,
    v7,
    v8,
    v9,
    0);
}

void sub_10001F4EC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Encountered error parsing PPS event. Continuing to next event.", buf, 2u);
}

void sub_10001F52C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skipping current event due to at least one missing value.", buf, 2u);
}

void sub_10001F56C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 lastObject];
  sub_100004F40();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Most-recent one: %@", v5, 0xCu);
}

void sub_10001F610()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, v0, v1, "Error from PPSGetData %@", v2, v3, v4, v5, v6);
}

void sub_10001F678(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to load experiment identifiers. Returning nil.", v1, 2u);
}

void sub_10001F6BC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to load from null path.", v1, 2u);
}

void sub_10001F700(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to load model from %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10001F788(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Loading compiled model from %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001F800(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Request to load model from path: %@ ", (uint8_t *)&v2, 0xCu);
}

void sub_10001F878(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Comparing against current gauge values for CA logging.", buf, 2u);
}

void sub_10001F8B8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Logging PPS data for current health state prediction (t=0 days).", buf, 2u);
}

void sub_10001F8F8()
{
  sub_100004F40();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to get current value for metric: %@", v1, 0xCu);
}

void sub_10001F96C()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, v0, v1, "Failed to enumerate files %@", v2, v3, v4, v5, v6);
}

void sub_10001F9D4(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 absoluteURL];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Found %@", a1, 0xCu);
}

void sub_10001FA58()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Nil _startDate or _endDate", v2, v3, v4, v5, v6);
}

void sub_10001FA8C()
{
  sub_10000631C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Iteration ended", v1, 2u);
}

void sub_10001FACC()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Failed to allocate PPS request object", v2, v3, v4, v5, v6);
}

void sub_10001FB00(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "No data for this range", buf, 2u);
}

void sub_10001FB40()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Currently only BDC_SBC stream is supported", v2, v3, v4, v5, v6);
}

void sub_10001FB74()
{
  sub_100004F40();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "File %@ Row count %u", v2, 0x12u);
}

void sub_10001FBF8()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Failed to allocated PPS request object", v2, v3, v4, v5, v6);
}

void sub_10001FC2C()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Currently only BDC_Daily and BDC_SBC streams are supported", v2, v3, v4, v5, v6);
}

void sub_10001FC60()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "CSVs unsupported.", v2, v3, v4, v5, v6);
}

void sub_10001FC94()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Median not found. Nothing to log to CA", v2, v3, v4, v5, v6);
}

void sub_10001FCC8()
{
  sub_100004F40();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Array %@ Median %@", v2, 0x16u);
}

void sub_10001FD4C()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, v0, v1, "Response %@", v2, v3, v4, v5, v6);
}

void sub_10001FDB4()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, v0, v1, "Predicate %@", v2, v3, v4, v5, v6);
}

void sub_10001FE1C(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 startDate];
  uint64_t v5 = [a2 endDate];
  int v6 = 138412802;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint8_t v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Past prediction not found for %@. From %@ to %@.", (uint8_t *)&v6, 0x20u);
}

void sub_10001FEF0(void *a1)
{
  [a1 count];
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, &_os_log_default, v1, "Length of response %lu", v2, v3, v4, v5, v6);
}

void sub_10001FF64()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, &_os_log_default, v0, "Response %@", v1, v2, v3, v4, v5);
}

void sub_10001FFD4()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v0, "Error from PPSGetData %@", v1, v2, v3, v4, v5);
}

void sub_100020044()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, &_os_log_default, v0, "Predicate %@", v1, v2, v3, v4, v5);
}

void sub_1000200B4()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Nil labelgen", v2, v3, v4, v5, v6);
}

void sub_1000200E8()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "_histogram alloc failed", v2, v3, v4, v5, v6);
}

void sub_10002011C()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Total count of histogram more than max count capacity", v2, v3, v4, v5, v6);
}

void sub_100020150()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Total count exceeds max histogram capacity.", v2, v3, v4, v5, v6);
}

void sub_100020184()
{
  sub_10000631C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Total value count 0", v1, 2u);
}

void sub_1000201C4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Posted notification with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002023C()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Super init failed for BatteryAlgorithmsRunner", v0, 2u);
}

void sub_100020284(uint8_t *a1, void *a2, unsigned int *a3, NSObject *a4)
{
  unsigned int v7 = [a2 intValue];
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Feature dimension cannot be negative, but found %d, skipping..", a1, 8u);
}

void sub_1000202F0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid input shape. Dimension %lu has size: %@ which is invalid.", (uint8_t *)&v3, 0x16u);
}

void sub_100020378()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, v0, v1, "Invalid input shape. Dimension 0 (batch dimension) is expected to be 1, but has size: %@.", v2, v3, v4, v5, v6);
}

void sub_1000203E0(void *a1, NSObject *a2)
{
  [a1 count];
  sub_100004F40();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Expected inputShape to have 3 dimensions, but got: %lu", v3, 0xCu);
}

void sub_100020468(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
}

void sub_1000204AC()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, v0, v1, "Missing feature name for dimension %lu in featureNames dictionary.", v2, v3, v4, v5, v6);
}

void sub_100020514(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Processing multiarray with # features = %i", (uint8_t *)v2, 8u);
}

void sub_10002058C(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Processing multiarray with numTimeSteps = %i, # features = %i", (uint8_t *)v3, 0xEu);
}

void sub_100020614(void *a1, uint64_t a2, NSObject *a3)
{
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  id v7 = [a1 count];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Can't create subarray starting at startIndex %lu when there are only %lu elements in the full arrays.", (uint8_t *)&v4, 0x16u);
}

void sub_1000206B0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
}

void sub_1000206F4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to alloc defaults", v1, 2u);
}

void sub_100020738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000207B0()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Failed to create sampler queue", v2, v3, v4, v5, v6);
}

void sub_1000207E4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create dir at %@ with err %@", (uint8_t *)&v3, 0x16u);
}

void sub_10002086C()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Unsupported class type for entry", v2, v3, v4, v5, v6);
}

void sub_1000208A0()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Empty runningCount argument", v2, v3, v4, v5, v6);
}

void sub_1000208D4()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Empty columnNames argument", v2, v3, v4, v5, v6);
}

void sub_100020908()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Empty version argument", v2, v3, v4, v5, v6);
}

void sub_10002093C()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, v0, v1, "PPSEvent %@", v2, v3, v4, v5, v6);
}

void sub_1000209A4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  object_getClassName(a2);
  sub_100004F40();
  sub_100014484((void *)&_mh_execute_header, v3, v4, "Unsupported class type for entry %s", v5);
}

void sub_100020A34()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Count of aggregationTypes does not match count of columnNames", v2, v3, v4, v5, v6);
}

void sub_100020A68()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Empty enumerator object passed in.", v2, v3, v4, v5, v6);
}

void sub_100020A9C()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Failed to get max column index for SBC stream", v2, v3, v4, v5, v6);
}

void sub_100020AD0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_100014484((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to allocate DataSumAndCount array for %lu elements", (uint8_t *)a1);
}

void sub_100020B10(unsigned char *a1, unsigned char *a2)
{
  sub_10001445C(a1, a2);
  sub_100014444((void *)&_mh_execute_header, v2, (uint64_t)v2, "Skipping row due to unexpected format.", v3);
}

void sub_100020B40()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Nil argument", v2, v3, v4, v5, v6);
}

void sub_100020B74()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Start date after end date", v2, v3, v4, v5, v6);
}

void sub_100020BA8()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Could not get design capacity.", v2, v3, v4, v5, v6);
}

void sub_100020BDC()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Nil enumerator for bdc_sbc stream", v2, v3, v4, v5, v6);
}

void sub_100020C10()
{
  sub_10000631C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Resampling BDC_SBC data", v1, 2u);
}

void sub_100020C50(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Design capacity %u", (uint8_t *)v2, 8u);
}

void sub_100020CC8()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, v0, v1, "Returned dict %@", v2, v3, v4, v5, v6);
}

void sub_100020D30()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Could not fetch year and week of manufacture", v2, v3, v4, v5, v6);
}

void sub_100020D64()
{
  sub_100004F40();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Encountered missing value for %@. Filling with default value: %ld.", v2, 0x16u);
}

void sub_100020DE8()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Nil enumerator for BDC_SBC stream", v2, v3, v4, v5, v6);
}

void sub_100020E1C()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "No data returned from getBDCDataFromStartDate for BDC_SBC stream", v2, v3, v4, v5, v6);
}

void sub_100020E50()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Encountered error getting timestamp from first PPS event. Unable to compute timeSinceLastReadingMins feature.", v2, v3, v4, v5, v6);
}

void sub_100020E84()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Encountered error trying to generate subarrays from arrays that exceed the max size.", v2, v3, v4, v5, v6);
}

void sub_100020EB8()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Encountered error trying to generate the multiArray for usage history input.", v2, v3, v4, v5, v6);
}

void sub_100020EEC()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, v0, v1, "Multiarray generated from VITQ values has shape: %@", v2, v3, v4, v5, v6);
}

void sub_100020F54(unsigned char *a1, unsigned char *a2)
{
  sub_10001445C(a1, a2);
  sub_100014444((void *)&_mh_execute_header, v2, (uint64_t)v2, "Encountered error parsing PPS event. Continuing to next event.", v3);
}

void sub_100020F84(unsigned char *a1, unsigned char *a2)
{
  sub_10001445C(a1, a2);
  sub_100014444((void *)&_mh_execute_header, v2, (uint64_t)v2, "Encountered error getting timestamp from PPS event. Unable to compute timeSinceLastReadingMins feature. Continuing to next event.", v3);
}

void sub_100020FB4(unsigned char *a1, unsigned char *a2)
{
  sub_10001445C(a1, a2);
  sub_100014444((void *)&_mh_execute_header, v2, (uint64_t)v2, "Skipping current event due to at least one missing value.", v3);
}

void sub_100020FE4()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Encountered error getting timestamp from first PPS event. Unable to compute timeSinceLastReadingDays feature.", v2, v3, v4, v5, v6);
}

void sub_100021018()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Encountered error parsing PPS event.", v2, v3, v4, v5, v6);
}

void sub_10002104C()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Encountered error getting timestamp from PPS event. Unable to compute timeSinceLastReadingDays feature.", v2, v3, v4, v5, v6);
}

void sub_100021080(unsigned char *a1, unsigned char *a2)
{
  sub_10001445C(a1, a2);
  sub_100014444((void *)&_mh_execute_header, v2, (uint64_t)v2, "Could not get age from manufacture date.", v3);
}

void sub_1000210B0()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Health history start date cannot be later than history end date.", v2, v3, v4, v5, v6);
}

void sub_1000210E4()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Nil enumerator for BDC_Daily stream", v2, v3, v4, v5, v6);
}

void sub_100021118()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Could not get DesignCapacity", v2, v3, v4, v5, v6);
}

void sub_10002114C()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Could not get manufacture date.", v2, v3, v4, v5, v6);
}

void sub_100021180()
{
  sub_100004F40();
  sub_100014484((void *)&_mh_execute_header, v0, v1, "No data returned from getBDCDataFromStartDate for BDC_Daily stream: %@", v2);
}

void sub_1000211EC()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Encountered error trying to generate subarrays from arrays that exceed the max size.", v2, v3, v4, v5, v6);
}

void sub_100021220()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Encountered error trying to generate the multiArray for daily history input.", v2, v3, v4, v5, v6);
}

void sub_100021254(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 allKeys];
  sub_10001446C();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Multiarray generated from %@ has shape: %@", v5, 0x16u);
}

void sub_100021304()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, v0, v1, "featureArrays: %@ ", v2, v3, v4, v5, v6);
}

void sub_10002136C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 count];
  sub_100004F40();
  sub_100014484((void *)&_mh_execute_header, v3, v4, "At least one of NCCpValues/WRaValues/QMaxpValues/cycleCountValues/ageValues had zero values added after iterating through allData (allData size= %lu)", v5);
}

void sub_1000213FC()
{
  sub_100004F40();
  sub_100004F4C((void *)&_mh_execute_header, v0, v1, "allArrays: %@ ", v2, v3, v4, v5, v6);
}

void sub_100021464(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 count];
  sub_10001446C();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "allData (count = %lu) \n %@", v4, 0x16u);
}

void sub_1000214FC()
{
  sub_100004F40();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Using device manufactureDate: %@ to compute age. Using designCapacity: %u to compute nccp/qmaxp.", v2, 0x12u);
}

void sub_100021580(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to create folder %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000215F8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to create input features", v1, 2u);
}

void sub_10002163C()
{
  sub_100004F40();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error while creating feature provider: %@", v1, 0xCu);
}

void sub_1000216B0()
{
  sub_100004F40();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error in model predictions: %@", v1, 0xCu);
}

void sub_100021724()
{
  sub_100004F40();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "OCV model input dict: %@", v1, 0xCu);
}

void sub_100021798(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "xpc_dictionary_create return nil. XPC alarm not set. ", v1, 2u);
}

void sub_1000217DC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Incorrect alarm clock type.  XPC alarm not set.", v1, 2u);
}

void sub_100021820()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v0, "Unknown BIFeatureType %lu", v1, v2, v3, v4, v5);
}

void sub_100021890()
{
  sub_100018420();
  sub_100018438((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to write to file %@ with error %@", v1, v2, v3, v4, v5);
}

void sub_100021900()
{
  sub_100018420();
  sub_100018438((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to remove %@ with error %@", v1, v2, v3, v4, v5);
}

void sub_100021970()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to get file path for type %ld", v1, v2, v3, v4, v5);
}

void sub_1000219E0()
{
  sub_100018420();
  sub_100018438((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to read %@ with error %@", v1, v2, v3, v4, v5);
}

void sub_100021A50()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "No match for AppleSmartBattery IOService.", v0, 2u);
}

void sub_100021A98()
{
  sub_100004F40();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "For key %@ Value of type %lu. Expected type %lu ", v2, 0x20u);
}

void sub_100021B28()
{
  objc_opt_class();
  sub_100004F40();
  id v1 = v0;
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v2, "Unexpected wRa type %@", v3, v4, v5, v6, v7);
}

void sub_100021BB0(unsigned __int8 a1, int a2)
{
  v2[0] = 67109376;
  v2[1] = a2;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Year digit %u Week digits %u", (uint8_t *)v2, 0xEu);
}

void sub_100021C40()
{
  sub_100004F40();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Fetched yww from IOKit: %@", v0, 0xCu);
}

void sub_100021CBC()
{
  *(_WORD *)id v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to get year and week from IOPSGetYearAndWeekOfManufactureFromBatterySerial", v0, 2u);
}

void sub_100021D04()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v0, "Invalid metric name: %@. Supported metric names are 'nccp', 'qmaxp', and 'wra'", v1, v2, v3, v4, v5);
}

void sub_100021D74()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v0, "Asset path for %@ not found", v1, v2, v3, v4, v5);
}

void sub_100021DE4()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v0, "ML model file for %@ not found", v1, v2, v3, v4, v5);
}

void sub_100021E54()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v0, "Failed at reading metadata for %@", v1, v2, v3, v4, v5);
}

void sub_100021EC4()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v0, "Failed at reading predicted feature name for %@", v1, v2, v3, v4, v5);
}

void sub_100021F34()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v0, "SOC value of %zd is > 100", v1, v2, v3, v4, v5);
}

void sub_100021FA4()
{
  sub_100004F40();
  sub_100006300((void *)&_mh_execute_header, &_os_log_default, v0, "SOC value of %zd is < 0", v1, v2, v3, v4, v5);
}

void sub_100022014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100022050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002208C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Registration info within CD context store handler: %@, %@", (uint8_t *)&v4, 0x16u);
}

void sub_100022114()
{
  sub_100004F40();
  __int16 v2 = 2048;
  uint64_t v3 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Cannot compute core analytics metrics as we do not know plugin time:\ncurrentMonotonicTimeInSeconds - %llu\npluginMonotonicTimeInSeconds - %llu", v1, 0x16u);
}

void sub_100022194()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Failed to allocated PPS request object", v2, v3, v4, v5, v6);
}

void sub_1000221C8()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Unable to compute the CA metrics as SMC data is not available.", v2, v3, v4, v5, v6);
}

void sub_1000221FC()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Unable to compute the CA metrics as we did not receive a response from PPS.", v2, v3, v4, v5, v6);
}

void sub_100022230()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "modelID is null. Not computing CA metrics.", v2, v3, v4, v5, v6);
}

void sub_100022264()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Context store or context store registration not set!", v2, v3, v4, v5, v6);
}

void sub_100022298(int a1, NSObject *a2)
{
  v2[0] = 67109378;
  v2[1] = a1;
  __int16 v3 = 2080;
  uint64_t v4 = "com.apple.system.powersources.source";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error %d registering for %s notification", (uint8_t *)v2, 0x12u);
}

void sub_100022324(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Not computing CA metrics at plugout. UI SOC at plugout: %d", (uint8_t *)v2, 8u);
}

void sub_10002239C()
{
  sub_10000631C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Setting/deleting TT80 alarm depending on current state at the start of listener.", v1, 2u);
}

void sub_1000223DC()
{
  sub_10000631C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Setting/deleting TT80 alarm depending on current state when we get notified while the daemon is running.", v1, 2u);
}

void sub_10002241C()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Nil payload. Nothing to send to PPS.", v2, v3, v4, v5, v6);
}

void sub_100022450()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "PPS request object not found. Unable to send data to powerlog.", v2, v3, v4, v5, v6);
}

void sub_100022484(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Could not create ppsId for %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000224FC()
{
  sub_10000631C();
  sub_1000062E4((void *)&_mh_execute_header, v0, v1, "Nil payload. Nothing to send to CA.", v2, v3, v4, v5, v6);
}

void sub_100022530()
{
  sub_10000631C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Updating payload for CA with trial parameters.", v1, 2u);
}

void sub_100022570()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load ocv_drift_model.mlmodelc in the bundle resource", v0, 2u);
}

void sub_1000225B8()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load nccp_wra_qmaxp_seq_model.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100022600()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load tt80_lstm_regression.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100022648()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load state_estimation_model.mlmodelc in the bundle resource", v0, 2u);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

uint64_t IOPSGetBatteryHealthState()
{
  return _IOPSGetBatteryHealthState();
}

uint64_t IOPSGetPercentRemaining()
{
  return _IOPSGetPercentRemaining();
}

uint64_t IOPSGetYearAndWeekOfManufactureFromBatterySerial()
{
  return _IOPSGetYearAndWeekOfManufactureFromBatterySerial();
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t MGIsDeviceOneOfType()
{
  return _MGIsDeviceOneOfType();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return _PPSCreateTelemetryIdentifier();
}

uint64_t PPSSendTelemetry()
{
  return _PPSSendTelemetry();
}

uint64_t PerfPowerServicesGetData()
{
  return _PerfPowerServicesGetData();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_AlgorithmClassName(void *a1, const char *a2, ...)
{
  return [a1 AlgorithmClassName];
}

id objc_msgSend_Input(void *a1, const char *a2, ...)
{
  return [a1 Input];
}

id objc_msgSend_Prediction(void *a1, const char *a2, ...)
{
  return [a1 Prediction];
}

id objc_msgSend_URLOfModelInThisBundle(void *a1, const char *a2, ...)
{
  return [a1 URLOfModelInThisBundle];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__copyFeatures(void *a1, const char *a2, ...)
{
  return [a1 _copyFeatures];
}

id objc_msgSend_absoluteURL(void *a1, const char *a2, ...)
{
  return [a1 absoluteURL];
}

id objc_msgSend_algoDescription(void *a1, const char *a2, ...)
{
  return [a1 algoDescription];
}

id objc_msgSend_algoRunnerStoreOutput(void *a1, const char *a2, ...)
{
  return [a1 algoRunnerStoreOutput];
}

id objc_msgSend_algoStateData(void *a1, const char *a2, ...)
{
  return [a1 algoStateData];
}

id objc_msgSend_algorithmObject(void *a1, const char *a2, ...)
{
  return [a1 algorithmObject];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_battData(void *a1, const char *a2, ...)
{
  return [a1 battData];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_canComputeCoreAnalyticsMetrics(void *a1, const char *a2, ...)
{
  return [a1 canComputeCoreAnalyticsMetrics];
}

id objc_msgSend_collectionQueue(void *a1, const char *a2, ...)
{
  return [a1 collectionQueue];
}

id objc_msgSend_computeAndSendCoreAnalyticsMetrics(void *a1, const char *a2, ...)
{
  return [a1 computeAndSendCoreAnalyticsMetrics];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextStoreRegistration(void *a1, const char *a2, ...)
{
  return [a1 contextStoreRegistration];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyHistogramWithNormalizedCounts(void *a1, const char *a2, ...)
{
  return [a1 copyHistogramWithNormalizedCounts];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_dailyData(void *a1, const char *a2, ...)
{
  return [a1 dailyData];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return [a1 deploymentId];
}

id objc_msgSend_deregisterFromContextStoreNotification(void *a1, const char *a2, ...)
{
  return [a1 deregisterFromContextStoreNotification];
}

id objc_msgSend_deviceState(void *a1, const char *a2, ...)
{
  return [a1 deviceState];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_directoryValue(void *a1, const char *a2, ...)
{
  return [a1 directoryValue];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_epochTimestamp(void *a1, const char *a2, ...)
{
  return [a1 epochTimestamp];
}

id objc_msgSend_eventCA(void *a1, const char *a2, ...)
{
  return [a1 eventCA];
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return [a1 experimentId];
}

id objc_msgSend_experimentIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 experimentIdentifiers];
}

id objc_msgSend_featureFlagEn(void *a1, const char *a2, ...)
{
  return [a1 featureFlagEn];
}

id objc_msgSend_featureGen(void *a1, const char *a2, ...)
{
  return [a1 featureGen];
}

id objc_msgSend_featureNames(void *a1, const char *a2, ...)
{
  return [a1 featureNames];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstWeekday(void *a1, const char *a2, ...)
{
  return [a1 firstWeekday];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_freshInitNeeded(void *a1, const char *a2, ...)
{
  return [a1 freshInitNeeded];
}

id objc_msgSend_freshInitRequested(void *a1, const char *a2, ...)
{
  return [a1 freshInitRequested];
}

id objc_msgSend_fullInitData(void *a1, const char *a2, ...)
{
  return [a1 fullInitData];
}

id objc_msgSend_fullInitDataRead(void *a1, const char *a2, ...)
{
  return [a1 fullInitDataRead];
}

id objc_msgSend_getDeviceManufactureDate(void *a1, const char *a2, ...)
{
  return [a1 getDeviceManufactureDate];
}

id objc_msgSend_getDeviceModel(void *a1, const char *a2, ...)
{
  return [a1 getDeviceModel];
}

id objc_msgSend_getModelID(void *a1, const char *a2, ...)
{
  return [a1 getModelID];
}

id objc_msgSend_initDone(void *a1, const char *a2, ...)
{
  return [a1 initDone];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isiPhone(void *a1, const char *a2, ...)
{
  return [a1 isiPhone];
}

id objc_msgSend_keyPathForBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 keyPathForBatteryLevel];
}

id objc_msgSend_keyPathForBatteryStateDataDictionary(void *a1, const char *a2, ...)
{
  return [a1 keyPathForBatteryStateDataDictionary];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_metaFilePath(void *a1, const char *a2, ...)
{
  return [a1 metaFilePath];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metricKeysAndValues(void *a1, const char *a2, ...)
{
  return [a1 metricKeysAndValues];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_modelDescription(void *a1, const char *a2, ...)
{
  return [a1 modelDescription];
}

id objc_msgSend_multiArrayValue(void *a1, const char *a2, ...)
{
  return [a1 multiArrayValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_obcData(void *a1, const char *a2, ...)
{
  return [a1 obcData];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return [a1 output];
}

id objc_msgSend_outputDescriptionsByName(void *a1, const char *a2, ...)
{
  return [a1 outputDescriptionsByName];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_postNotificationForChargeTimeEstimateUpdate(void *a1, const char *a2, ...)
{
  return [a1 postNotificationForChargeTimeEstimateUpdate];
}

id objc_msgSend_preInitData(void *a1, const char *a2, ...)
{
  return [a1 preInitData];
}

id objc_msgSend_predictedFeatureName(void *a1, const char *a2, ...)
{
  return [a1 predictedFeatureName];
}

id objc_msgSend_predictedFeatureNames(void *a1, const char *a2, ...)
{
  return [a1 predictedFeatureNames];
}

id objc_msgSend_runMetaData(void *a1, const char *a2, ...)
{
  return [a1 runMetaData];
}

id objc_msgSend_sbcData(void *a1, const char *a2, ...)
{
  return [a1 sbcData];
}

id objc_msgSend_setUpContextStoreRegistration(void *a1, const char *a2, ...)
{
  return [a1 setUpContextStoreRegistration];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_setupConnectionListenerForTT80(void *a1, const char *a2, ...)
{
  return [a1 setupConnectionListenerForTT80];
}

id objc_msgSend_shape(void *a1, const char *a2, ...)
{
  return [a1 shape];
}

id objc_msgSend_sharedBDCSchema(void *a1, const char *a2, ...)
{
  return [a1 sharedBDCSchema];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPredictor(void *a1, const char *a2, ...)
{
  return [a1 sharedPredictor];
}

id objc_msgSend_smcKeys(void *a1, const char *a2, ...)
{
  return [a1 smcKeys];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_stateFilePath(void *a1, const char *a2, ...)
{
  return [a1 stateFilePath];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_trackingId(void *a1, const char *a2, ...)
{
  return [a1 trackingId];
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return [a1 treatmentId];
}

id objc_msgSend_tt80EstimatorModel(void *a1, const char *a2, ...)
{
  return [a1 tt80EstimatorModel];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return [a1 userContext];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:x0 error:x1];
}