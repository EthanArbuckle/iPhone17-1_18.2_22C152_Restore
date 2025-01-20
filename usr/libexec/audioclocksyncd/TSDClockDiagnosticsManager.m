@interface TSDClockDiagnosticsManager
- (BOOL)addNetworkPortWithService:(id)a3;
- (BOOL)addStatisticsWithIdentifier:(unint64_t)a3;
- (BOOL)removeNetworkPortWithService:(id)a3;
- (BOOL)removeStatisticsWithIdentifier:(unint64_t)a3;
- (TSDClockDiagnosticsManager)init;
- (void)dealloc;
- (void)didChangeASCapable:(BOOL)a3 forPort:(id)a4;
- (void)didChangeAdministrativeEnable:(BOOL)a3 forPort:(id)a4;
- (void)didSyncTimeoutWithMean:(int64_t)a3 median:(int64_t)a4 standardDeviation:(unint64_t)a5 minimum:(int64_t)a6 maximum:(int64_t)a7 numberOfSamples:(unsigned int)a8 forPort:(id)a9;
- (void)didTerminateServiceForPort:(id)a3;
- (void)didTimeoutOnMACLookupForPort:(id)a3;
@end

@implementation TSDClockDiagnosticsManager

- (TSDClockDiagnosticsManager)init
{
  v47.receiver = self;
  v47.super_class = (Class)TSDClockDiagnosticsManager;
  id v2 = [(TSDClockDiagnosticsManager *)&v47 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    if (*((void *)v2 + 3))
    {
      id v5 = objc_alloc_init((Class)NSMutableDictionary);
      v6 = (void *)*((void *)v2 + 4);
      *((void *)v2 + 4) = v5;

      if (*((void *)v2 + 4))
      {
        dispatch_queue_t v7 = dispatch_queue_create("com.apple.timesyncd.statistics", 0);
        v8 = (void *)*((void *)v2 + 1);
        *((void *)v2 + 1) = v7;

        v9 = *((void *)v2 + 1);
        if (v9)
        {
          dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, v9);
          v11 = (void *)*((void *)v2 + 2);
          *((void *)v2 + 2) = v10;

          if (*((void *)v2 + 2))
          {
            id v12 = [objc_alloc((Class)IOKNotificationPort) initOnDispatchQueue:*((void *)v2 + 1)];
            v13 = (void *)*((void *)v2 + 5);
            *((void *)v2 + 5) = v12;

            if (*((void *)v2 + 5))
            {
              objc_initWeak((id *)location, v2);
              v14 = +[IOKService serviceMatching:@"IOTimeSyncService"];
              uint64_t v15 = *((void *)v2 + 5);
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_100008AB8;
              v45[3] = &unk_10003C460;
              objc_copyWeak(&v46, (id *)location);
              uint64_t v16 = IOKMatchedNotification;
              uint64_t v17 = +[IOKService addNotificationOfType:IOKMatchedNotification forMatching:v14 usingNotificationPort:v15 error:0 withEnumerationBlock:v45];
              v18 = (void *)*((void *)v2 + 6);
              *((void *)v2 + 6) = v17;

              v19 = +[IOKService serviceMatching:@"IOTimeSyncService"];
              uint64_t v20 = *((void *)v2 + 5);
              v43[0] = _NSConcreteStackBlock;
              v43[1] = 3221225472;
              v43[2] = sub_100008D50;
              v43[3] = &unk_10003C460;
              objc_copyWeak(&v44, (id *)location);
              uint64_t v21 = IOKTerminatedNotification;
              uint64_t v22 = +[IOKService addNotificationOfType:IOKTerminatedNotification forMatching:v19 usingNotificationPort:v20 error:0 withEnumerationBlock:v43];
              v23 = (void *)*((void *)v2 + 7);
              *((void *)v2 + 7) = v22;

              v24 = +[IOKService serviceMatching:@"IOTimeSyncNetworkPort"];
              uint64_t v25 = *((void *)v2 + 5);
              v41[0] = _NSConcreteStackBlock;
              v41[1] = 3221225472;
              v41[2] = sub_100008FE8;
              v41[3] = &unk_10003C460;
              objc_copyWeak(&v42, (id *)location);
              uint64_t v26 = +[IOKService addNotificationOfType:v16 forMatching:v24 usingNotificationPort:v25 error:0 withEnumerationBlock:v41];
              v27 = (void *)*((void *)v2 + 8);
              *((void *)v2 + 8) = v26;

              v28 = +[IOKService serviceMatching:@"IOTimeSyncNetworkPort"];
              uint64_t v29 = *((void *)v2 + 5);
              v39[0] = _NSConcreteStackBlock;
              v39[1] = 3221225472;
              v39[2] = sub_1000091CC;
              v39[3] = &unk_10003C460;
              objc_copyWeak(&v40, (id *)location);
              uint64_t v30 = +[IOKService addNotificationOfType:v21 forMatching:v28 usingNotificationPort:v29 error:0 withEnumerationBlock:v39];
              v31 = (void *)*((void *)v2 + 9);
              *((void *)v2 + 9) = v30;

              v32 = *((void *)v2 + 2);
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472;
              handler[2] = sub_1000032AC;
              handler[3] = &unk_10003C488;
              objc_copyWeak(&v38, (id *)location);
              dispatch_source_set_event_handler(v32, handler);
              dispatch_source_set_timer(*((dispatch_source_t *)v2 + 2), 0, 0xDF8475800uLL, 0);
              dispatch_resume(*((dispatch_object_t *)v2 + 2));
              v33 = *((void *)v2 + 1);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000093B0;
              block[3] = &unk_10003C4B0;
              id v2 = v2;
              id v36 = v2;
              dispatch_async(v33, block);

              objc_destroyWeak(&v38);
              objc_destroyWeak(&v40);
              objc_destroyWeak(&v42);
              objc_destroyWeak(&v44);
              objc_destroyWeak(&v46);
              objc_destroyWeak((id *)location);
              return (TSDClockDiagnosticsManager *)v2;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)location = 136316418;
              *(void *)&location[4] = "_notificationPort != nil";
              __int16 v49 = 2048;
              uint64_t v50 = 0;
              __int16 v51 = 2048;
              uint64_t v52 = 0;
              __int16 v53 = 2080;
              v54 = &unk_100030E47;
              __int16 v55 = 2080;
              v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
              __int16 v57 = 1024;
              int v58 = 63;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136316418;
            *(void *)&location[4] = "_statisticsTimer != nil";
            __int16 v49 = 2048;
            uint64_t v50 = 0;
            __int16 v51 = 2048;
            uint64_t v52 = 0;
            __int16 v53 = 2080;
            v54 = &unk_100030E47;
            __int16 v55 = 2080;
            v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
            __int16 v57 = 1024;
            int v58 = 60;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136316418;
          *(void *)&location[4] = "_statisticsQueue != nil";
          __int16 v49 = 2048;
          uint64_t v50 = 0;
          __int16 v51 = 2048;
          uint64_t v52 = 0;
          __int16 v53 = 2080;
          v54 = &unk_100030E47;
          __int16 v55 = 2080;
          v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
          __int16 v57 = 1024;
          int v58 = 57;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136316418;
        *(void *)&location[4] = "_networkPorts != nil";
        __int16 v49 = 2048;
        uint64_t v50 = 0;
        __int16 v51 = 2048;
        uint64_t v52 = 0;
        __int16 v53 = 2080;
        v54 = &unk_100030E47;
        __int16 v55 = 2080;
        v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
        __int16 v57 = 1024;
        int v58 = 54;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136316418;
      *(void *)&location[4] = "_statistics != nil";
      __int16 v49 = 2048;
      uint64_t v50 = 0;
      __int16 v51 = 2048;
      uint64_t v52 = 0;
      __int16 v53 = 2080;
      v54 = &unk_100030E47;
      __int16 v55 = 2080;
      v56 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
      __int16 v57 = 1024;
      int v58 = 51;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", location, 0x3Au);
    }

    return 0;
  }
  return (TSDClockDiagnosticsManager *)v2;
}

- (BOOL)addStatisticsWithIdentifier:(unint64_t)a3
{
  id v5 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
  uint64_t v6 = [(NSMutableDictionary *)self->_statistics objectForKeyedSubscript:v5];
  if (!v6)
  {
    dispatch_queue_t v7 = [[TSDClockStatistics alloc] initWithClockIdentifier:a3];
    if (v7)
    {
      statistics = self->_statistics;
      if (statistics)
      {
        [(NSMutableDictionary *)statistics setObject:v7 forKeyedSubscript:v5];
        goto LABEL_6;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316418;
        id v12 = "_statistics != nil";
        __int16 v13 = 2048;
        uint64_t v14 = 0;
        __int16 v15 = 2048;
        uint64_t v16 = 0;
        __int16 v17 = 2080;
        v18 = &unk_100030E47;
        __int16 v19 = 2080;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
        __int16 v21 = 1024;
        int v22 = 190;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
      }
    }
    BOOL v9 = 0;
    goto LABEL_7;
  }
  dispatch_queue_t v7 = (TSDClockStatistics *)v6;
LABEL_6:
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (BOOL)removeStatisticsWithIdentifier:(unint64_t)a3
{
  v4 = +[NSNumber numberWithLongLong:a3];
  id v5 = [(NSMutableDictionary *)self->_statistics objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 finalizeClock];
    [(NSMutableDictionary *)self->_statistics removeObjectForKey:v4];
  }

  return v6 != 0;
}

- (BOOL)addNetworkPortWithService:(id)a3
{
  id v4 = a3;
  id v5 = +[TSDgPTPPort gPTPPortWithService:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    dispatch_queue_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%016llx", [v4 entryID]);
    v8 = [(NSMutableDictionary *)self->_networkPorts objectForKeyedSubscript:v7];

    if (!v8)
    {
      [(NSMutableDictionary *)self->_networkPorts setObject:v5 forKeyedSubscript:v7];
      [v5 addClient:self];
      [v5 registerAsyncCallbackError:0];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v11 = "[networkPort isKindOfClass:[TSDgPTPNetworkPort class]]";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      __int16 v17 = &unk_100030E47;
      __int16 v18 = 2080;
      __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
      __int16 v20 = 1024;
      int v21 = 228;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    dispatch_queue_t v7 = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)removeNetworkPortWithService:(id)a3
{
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0x%016llx", [a3 entryID]);
  id v5 = [(NSMutableDictionary *)self->_networkPorts objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_networkPorts objectForKeyedSubscript:v4];
    [v6 deregisterAsyncCallbackError:0];
    [v6 removeClient:self];
    [(NSMutableDictionary *)self->_networkPorts removeObjectForKey:v4];
  }
  return v5 != 0;
}

- (void)didChangeASCapable:(BOOL)a3 forPort:(id)a4
{
  BOOL v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = a4;
    id v7 = [v6 clockIdentifier];
    if (v5) {
      v8 = "YES";
    }
    else {
      v8 = "NO";
    }
    unsigned int v9 = [v6 portNumber];

    int v10 = 134218498;
    id v11 = v7;
    __int16 v12 = 2080;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    unsigned int v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: AS Capable %s on port %hu\n", (uint8_t *)&v10, 0x1Cu);
  }
}

- (void)didChangeAdministrativeEnable:(BOOL)a3 forPort:(id)a4
{
  BOOL v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = a4;
    id v7 = [v6 clockIdentifier];
    if (v5) {
      v8 = "YES";
    }
    else {
      v8 = "NO";
    }
    unsigned int v9 = [v6 portNumber];

    int v10 = 134218498;
    id v11 = v7;
    __int16 v12 = 2080;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    unsigned int v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Administrative Enabled %s on port %hu\n", (uint8_t *)&v10, 0x1Cu);
  }
}

- (void)didTimeoutOnMACLookupForPort:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = a3;
    id v5 = [v4 clockIdentifier];
    unsigned int v6 = [v4 portNumber];

    int v7 = 134218240;
    id v8 = v5;
    __int16 v9 = 1024;
    unsigned int v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: MAC lookup timeout on port %hu\n", (uint8_t *)&v7, 0x12u);
  }
}

- (void)didSyncTimeoutWithMean:(int64_t)a3 median:(int64_t)a4 standardDeviation:(unint64_t)a5 minimum:(int64_t)a6 maximum:(int64_t)a7 numberOfSamples:(unsigned int)a8 forPort:(id)a9
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = a9;
    id v16 = [v15 clockIdentifier];
    unsigned int v17 = [v15 portNumber];

    int v18 = 134219776;
    id v19 = v16;
    __int16 v20 = 1024;
    unsigned int v21 = v17;
    __int16 v22 = 2048;
    int64_t v23 = a3;
    __int16 v24 = 2048;
    int64_t v25 = a4;
    __int16 v26 = 2048;
    unint64_t v27 = a5;
    __int16 v28 = 2048;
    int64_t v29 = a6;
    __int16 v30 = 2048;
    int64_t v31 = a7;
    __int16 v32 = 1024;
    unsigned int v33 = a8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Sync timeout on port %hu with mean %llu median %llu stddev %llu min %llu max %llu num samples %u\n", (uint8_t *)&v18, 0x4Au);
  }
}

- (void)didTerminateServiceForPort:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = a3;
    id v5 = [v4 clockIdentifier];
    unsigned int v6 = [v4 portNumber];

    int v7 = 134218240;
    id v8 = v5;
    __int16 v9 = 1024;
    unsigned int v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "0x%016llx: Terminate for port %hu\n", (uint8_t *)&v7, 0x12u);
  }
}

- (void)dealloc
{
  statisticsTimer = self->_statisticsTimer;
  if (statisticsTimer) {
    dispatch_source_cancel((dispatch_source_t)statisticsTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDClockDiagnosticsManager;
  [(TSDClockDiagnosticsManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portDepatureNotification, 0);
  objc_storeStrong((id *)&self->_portArrivalNotification, 0);
  objc_storeStrong((id *)&self->_clockDepatureNotification, 0);
  objc_storeStrong((id *)&self->_clockArrivalNotification, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_networkPorts, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_statisticsTimer, 0);

  objc_storeStrong((id *)&self->_statisticsQueue, 0);
}

@end