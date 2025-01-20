@interface W5NetUsageManager
+ (void)copyPeriodicNetUsageToDir:(id)a3 uuid:(id)a4;
+ (void)writeProcNetUsage:(id)a3 ToFile:(id)a4;
- (W5NetUsageManager)init;
- (id)_getCurrentUsage;
- (id)_getProcNetUsageWithName:(id)a3 inUsageData:(id)a4;
- (id)calculateUsageDelta:(id)a3;
- (void)recordUsageToDate:(id)a3;
- (void)startPeriodicUsageMonitor:(double)a3 maxEntries:(unint64_t)a4 uuid:(id)a5;
- (void)stopPeriodicUsageMonitor:(id)a3;
@end

@implementation W5NetUsageManager

- (W5NetUsageManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)W5NetUsageManager;
  v2 = [(W5NetUsageManager *)&v18 init];
  if (objc_opt_class() && objc_opt_class())
  {
    id v3 = objc_alloc((Class)AnalyticsWorkspace);
    v4 = (W5NetUsageManager *)[v3 initWorkspaceWithService:kSymptomAnalyticsServiceEndpoint];
    if (v4
      && (v5 = (UsageFeed *)[objc_alloc((Class)UsageFeed) initWithWorkspace:v4],
          usageFeed = v2->_usageFeed,
          v2->_usageFeed = v5,
          usageFeed,
          v2->_usageFeed))
    {
      v7 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
      usageSnaphots = v2->_usageSnaphots;
      v2->_usageSnaphots = v7;

      v9 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
      periodicUsageFiles = v2->_periodicUsageFiles;
      v2->_periodicUsageFiles = v9;

      v11 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
      periodicBufferHead = v2->_periodicBufferHead;
      v2->_periodicBufferHead = v11;

      v13 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
      netUsageTimer = v2->_netUsageTimer;
      v2->_netUsageTimer = v13;

      p_super = sub_10009756C();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315650;
        v20 = "-[W5NetUsageManager init]";
        __int16 v21 = 2080;
        v22 = "W5NetUsageManager.m";
        __int16 v23 = 1024;
        int v24 = 72;
        _os_log_send_and_compose_impl();
      }
    }
    else
    {
      p_super = &v4->super;
      v4 = v2;
      v2 = 0;
    }
    v16 = v2;

    v2 = v4;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_getCurrentUsage
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  objc_super v18 = sub_1000102C8;
  int v19 = sub_1000102D8;
  id v20 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  usageFeed = self->_usageFeed;
  v27[0] = kSymptomAnalyticsServiceRefreshUsage;
  v27[1] = kSymptomAnalyticsServiceExtensionUsage;
  v28[0] = &__kCFBooleanTrue;
  v28[1] = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  uint64_t v6 = kUsageProcessProcName;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000102E0;
  v12[3] = &unk_1000DD3A8;
  v14 = &v15;
  v7 = v3;
  v13 = v7;
  LOBYTE(usageFeed) = [(UsageFeed *)usageFeed usageToDateWithOptionsFor:0 nameKind:v6 options:v5 reply:v12];

  if ((usageFeed & 1) == 0)
  {
    v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = (uint64_t)"-[W5NetUsageManager _getCurrentUsage]";
      __int16 v23 = 2080;
      int v24 = "W5NetUsageManager.m";
      __int16 v25 = 1024;
      int v26 = 104;
      _os_log_send_and_compose_impl();
    }
  }
  dispatch_time_t v9 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v7, v9) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v22 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)recordUsageToDate:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_usageSnaphots objectForKey:v4];

  if (!v5)
  {
    uint64_t v6 = +[NSMutableArray array];
    [(NSMutableDictionary *)self->_usageSnaphots setObject:v6 forKeyedSubscript:v4];
  }
  v7 = [(NSMutableDictionary *)self->_usageSnaphots objectForKeyedSubscript:v4];
  id v8 = [v7 count];

  if ((unint64_t)v8 <= 1)
  {
    dispatch_time_t v9 = [(W5NetUsageManager *)self _getCurrentUsage];
    id v10 = +[NSDate date];
    id v11 = [[W5WiFiNetUsageRecord alloc] init:v10 usageData:v9];
    if (v9)
    {
      v12 = sub_10009756C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        [v9 count];
        _os_log_send_and_compose_impl();
      }

      v13 = [(NSMutableDictionary *)self->_usageSnaphots objectForKeyedSubscript:v4];
      [v13 addObject:v11];
    }
  }
}

- (void)startPeriodicUsageMonitor:(double)a3 maxEntries:(unint64_t)a4 uuid:(id)a5
{
  id v8 = a5;
  dispatch_time_t v9 = [(NSMutableDictionary *)self->_netUsageTimer objectForKey:v8];

  if (v9)
  {
    id v10 = sub_10009756C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315906;
      v32 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]";
      __int16 v33 = 2080;
      v34 = "W5NetUsageManager.m";
      __int16 v35 = 1024;
      int v36 = 133;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_send_and_compose_impl();
    }

    id v11 = [(NSMutableDictionary *)self->_netUsageTimer objectForKeyedSubscript:v8];
    [v11 invalidate];
  }
  id v12 = objc_alloc((Class)NSURL);
  v13 = [v8 UUIDString];
  v14 = +[NSString stringWithFormat:@"/tmp/com.apple.wifivelocity/%@/netusage", v13];
  id v15 = [v12 initFileURLWithPath:v14];

  v16 = +[NSFileManager defaultManager];
  id v30 = 0;
  unsigned int v17 = [v16 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v30];
  id v18 = v30;

  int v19 = sub_10009756C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 136316418;
    v32 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]";
    __int16 v33 = 2080;
    v34 = "W5NetUsageManager.m";
    __int16 v35 = 1024;
    int v36 = 144;
    __int16 v37 = 2112;
    id v38 = v15;
    __int16 v39 = 1024;
    unsigned int v40 = v17;
    __int16 v41 = 2112;
    id v42 = v18;
    _os_log_send_and_compose_impl();
  }

  id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a4];
  [(NSMutableDictionary *)self->_periodicUsageFiles setObject:v20 forKeyedSubscript:v8];

  __int16 v21 = +[NSNumber numberWithUnsignedInteger:0];
  [(NSMutableDictionary *)self->_periodicBufferHead setObject:v21 forKeyedSubscript:v8];

  uint64_t v22 = sub_10009756C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 136315906;
    v32 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]";
    __int16 v33 = 2080;
    v34 = "W5NetUsageManager.m";
    __int16 v35 = 1024;
    int v36 = 149;
    __int16 v37 = 2112;
    id v38 = v8;
    _os_log_send_and_compose_impl();
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010AD4;
  block[3] = &unk_1000DD3F8;
  block[4] = self;
  id v26 = v8;
  double v28 = a3;
  id v27 = v15;
  unint64_t v29 = a4;
  id v23 = v15;
  id v24 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stopPeriodicUsageMonitor:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_netUsageTimer objectForKey:v4];

  if (v5)
  {
    uint64_t v6 = sub_10009756C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    v7 = [(NSMutableDictionary *)self->_netUsageTimer objectForKeyedSubscript:v4];
    [v7 invalidate];

    [(NSMutableDictionary *)self->_netUsageTimer removeObjectForKey:v4];
    id v8 = [(NSMutableDictionary *)self->_periodicUsageFiles objectForKeyedSubscript:v4];
    [v8 removeAllObjects];

    [(NSMutableDictionary *)self->_periodicUsageFiles removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_periodicBufferHead removeObjectForKey:v4];
  }
}

- (id)_getProcNetUsageWithName:(id)a3 inUsageData:(id)a4
{
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 objectForKey:@"procName" v16];
        unsigned __int8 v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)calculateUsageDelta:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_usageSnaphots objectForKey:v4];

  if (!v5)
  {
    id v27 = sub_10009756C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v42 = 136315906;
      v43 = "-[W5NetUsageManager calculateUsageDelta:]";
      __int16 v44 = 2080;
      v45 = "W5NetUsageManager.m";
      __int16 v46 = 1024;
      int v47 = 214;
      __int16 v48 = 2112;
      id v49 = v4;
      _os_log_send_and_compose_impl();
    }

    goto LABEL_21;
  }
  id v6 = [(NSMutableDictionary *)self->_usageSnaphots objectForKeyedSubscript:v4];
  id v7 = [v6 count];

  if (v7 != (id)2)
  {
    unint64_t v29 = sub_10009756C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [(NSMutableDictionary *)self->_usageSnaphots objectForKeyedSubscript:v4];
      v43 = "-[W5NetUsageManager calculateUsageDelta:]";
      __int16 v44 = 2080;
      int v42 = 136316162;
      v45 = "W5NetUsageManager.m";
      __int16 v46 = 1024;
      int v47 = 220;
      __int16 v48 = 2048;
      id v49 = [v30 count];
      __int16 v50 = 2112;
      id v51 = v4;
      _os_log_send_and_compose_impl();
    }
LABEL_21:
    id v33 = 0;
    goto LABEL_22;
  }
  id v33 = objc_alloc_init((Class)NSMutableArray);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v8 = [(NSMutableDictionary *)self->_usageSnaphots objectForKeyedSubscript:v4];
  uint64_t v9 = [v8 objectAtIndex:1];
  id v10 = [v9 usageData];

  id obj = v10;
  id v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v32 = *(void *)v38;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v15 = [v14 objectForKey:@"procName"];
        id v16 = v4;
        long long v17 = [(NSMutableDictionary *)self->_usageSnaphots objectForKeyedSubscript:v4];
        long long v18 = [v17 objectAtIndex:0];
        long long v19 = [v18 usageData];
        id v20 = self;
        __int16 v21 = [(W5NetUsageManager *)self _getProcNetUsageWithName:v15 inUsageData:v19];

        if (v21)
        {
          id v22 = objc_alloc_init((Class)NSMutableDictionary);
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_100011918;
          v34[3] = &unk_1000DD420;
          v34[4] = v14;
          id v35 = v21;
          id v36 = v22;
          id v23 = v22;
          [v14 enumerateKeysAndObjectsUsingBlock:v34];
          [v33 addObject:v23];
        }
        else
        {
          id v23 = [v14 copy];
          [v33 addObject:v23];
        }

        id v4 = v16;
        self = v20;
      }
      id v12 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v12);
  }

  id v24 = sub_10009756C();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [v33 count];
    v43 = "-[W5NetUsageManager calculateUsageDelta:]";
    __int16 v44 = 2080;
    int v42 = 136316162;
    v45 = "W5NetUsageManager.m";
    __int16 v46 = 1024;
    int v47 = 249;
    __int16 v48 = 2048;
    id v49 = v25;
    __int16 v50 = 2112;
    id v51 = v4;
    _os_log_send_and_compose_impl();
  }

  id v26 = sub_10009756C();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = 136315906;
    v43 = "-[W5NetUsageManager calculateUsageDelta:]";
    __int16 v44 = 2080;
    v45 = "W5NetUsageManager.m";
    __int16 v46 = 1024;
    int v47 = 251;
    __int16 v48 = 2112;
    id v49 = v4;
    _os_log_send_and_compose_impl();
  }

  [(NSMutableDictionary *)self->_usageSnaphots removeObjectForKey:v4];
LABEL_22:

  return v33;
}

+ (void)copyPeriodicNetUsageToDir:(id)a3 uuid:(id)a4
{
  id v35 = a3;
  id v5 = a4;
  id v6 = objc_alloc((Class)NSURL);
  id v7 = [v5 UUIDString];
  id v8 = +[NSString stringWithFormat:@"/tmp/com.apple.wifivelocity/%@/netusage", v7];
  id v9 = [v6 initFileURLWithPath:v8];

  id v10 = +[NSFileManager defaultManager];
  id v42 = 0;
  id v11 = [v10 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:0 options:4 error:&v42];
  id v12 = v42;

  unsigned __int8 v13 = sub_10009756C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v11 count];
    int v43 = 136315906;
    __int16 v44 = "+[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:]";
    __int16 v45 = 2080;
    __int16 v46 = "W5NetUsageManager.m";
    __int16 v47 = 1024;
    int v48 = 268;
    __int16 v49 = 2048;
    id v50 = v14;
    LODWORD(v31) = 38;
    id v30 = &v43;
    _os_log_send_and_compose_impl();
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v11;
  id v15 = [obj countByEnumeratingWithState:&v38 objects:v55 count:16];
  if (v15)
  {
    id v16 = v15;
    id v32 = v9;
    id v33 = v5;
    long long v17 = 0;
    uint64_t v18 = *(void *)v39;
    do
    {
      long long v19 = 0;
      id v20 = v12;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(obj);
        }
        __int16 v21 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v19);
        id v22 = [v21 lastPathComponent:v30, v31];
        id v23 = [v35 URLByAppendingPathComponent:v22];

        id v24 = +[NSFileManager defaultManager];
        id v37 = v20;
        unsigned int v25 = [v24 copyItemAtURL:v21 toURL:v23 error:&v37];
        id v12 = v37;

        id v26 = sub_10009756C();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int v43 = 136316674;
          __int16 v44 = "+[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:]";
          __int16 v45 = 2080;
          __int16 v46 = "W5NetUsageManager.m";
          __int16 v47 = 1024;
          int v48 = 274;
          __int16 v49 = 2112;
          id v50 = v21;
          __int16 v51 = 2112;
          *(void *)v52 = v23;
          *(_WORD *)&v52[8] = 1024;
          *(_DWORD *)&v52[10] = v25;
          __int16 v53 = 2112;
          id v54 = v12;
          LODWORD(v31) = 64;
          id v30 = &v43;
          _os_log_send_and_compose_impl();
        }

        v17 += v25;
        long long v19 = (char *)v19 + 1;
        id v20 = v12;
      }
      while (v16 != v19);
      id v16 = [obj countByEnumeratingWithState:&v38 objects:v55 count:16];
    }
    while (v16);
    id v9 = v32;
    id v5 = v33;
  }
  else
  {
    long long v17 = 0;
    unsigned int v25 = 0;
  }

  if (v17 == [obj count])
  {
    id v27 = +[NSFileManager defaultManager];
    id v36 = v12;
    [v27 removeItemAtURL:v9 error:&v36];
    id v28 = v36;

    unint64_t v29 = sub_10009756C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = 136316418;
      __int16 v44 = "+[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:]";
      __int16 v45 = 2080;
      __int16 v46 = "W5NetUsageManager.m";
      __int16 v47 = 1024;
      int v48 = 281;
      __int16 v49 = 2112;
      id v50 = v9;
      __int16 v51 = 1024;
      *(_DWORD *)v52 = v25;
      *(_WORD *)&v52[4] = 2112;
      *(void *)&v52[6] = v28;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    id v28 = v12;
  }
}

+ (void)writeProcNetUsage:(id)a3 ToFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v17 = "+[W5NetUsageManager writeProcNetUsage:ToFile:]";
    __int16 v18 = 2080;
    int v16 = 136316162;
    long long v19 = "W5NetUsageManager.m";
    __int16 v20 = 1024;
    int v21 = 287;
    __int16 v22 = 2048;
    id v23 = [v5 count];
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_send_and_compose_impl();
  }

  if ([v5 count])
  {
    +[NSMutableString string];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000121A4;
    v14[3] = &unk_1000DD448;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v8;
    [v5 enumerateObjectsUsingBlock:v14];
    id v9 = +[NSFileManager defaultManager];
    id v10 = [v6 path];
    id v11 = [v8 dataUsingEncoding:4];
    unsigned int v12 = [v9 createFileAtPath:v10 contents:v11 attributes:0];

    if (v12)
    {
      unsigned __int8 v13 = sub_10009756C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315906;
        long long v17 = "+[W5NetUsageManager writeProcNetUsage:ToFile:]";
        __int16 v18 = 2080;
        long long v19 = "W5NetUsageManager.m";
        __int16 v20 = 1024;
        int v21 = 303;
        __int16 v22 = 2114;
        id v23 = v6;
        _os_log_send_and_compose_impl();
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netUsageTimer, 0);
  objc_storeStrong((id *)&self->_periodicBufferHead, 0);
  objc_storeStrong((id *)&self->_periodicUsageFiles, 0);
  objc_storeStrong((id *)&self->_usageSnaphots, 0);

  objc_storeStrong((id *)&self->_usageFeed, 0);
}

@end