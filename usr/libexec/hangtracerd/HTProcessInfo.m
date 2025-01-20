@interface HTProcessInfo
+ (BOOL)isAnyThirdPartyDeveloperProcessForeground;
+ (BOOL)shouldSaveFenceHangLogs;
+ (id)displayStateArray;
+ (id)processForPid:(int)a3;
+ (id)recentAppsDict;
+ (id)startWatchingPid:(int)a3 sharedMem:(void *)a4 length:(unint64_t)a5 bundleID:(const char *)a6;
+ (unint64_t)getEarliestPendingHangStartTime:(unint64_t)a3;
+ (void)addDisplayStateChangeEvent:(DisplayStateChangeEvent)a3;
+ (void)checkForHUDTimeouts:(unint64_t)a3;
+ (void)checkForHangTimeouts:(unint64_t)a3;
+ (void)initialize;
+ (void)recordFenceHang:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 reportedTime:(unint64_t)a6 blownFenceId:(unint64_t)a7 saveTailspin:(BOOL)a8 subtype:(int64_t)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 captureMicroHang:(BOOL)a11;
+ (void)stopWatchingAllPids;
+ (void)stopWatchingPid:(int)a3;
- (BOOL)checkShouldSaveHangLogs;
- (BOOL)isDeveloperApp;
- (BOOL)isInForeground;
- (BOOL)isThirdPartyDevSupportModeHang;
- (BOOL)shouldDisplayNonFenceHangToHUD;
- (BOOL)startTimeWithinMS:(unint64_t)a3 ofCurrentTime:(unint64_t)a4;
- (HTProcessInfo)initWithPid:(int)a3 sharedMem:(void *)a4 length:(unint64_t)a5 bundleID:(const char *)a6;
- (id)checkEventsForTimeouts:(unint64_t)a3 withType:(int64_t)a4;
- (id)description;
- (id)getApplicationByBundleId:(id)a3;
- (unint64_t)getHangStartTime:(unint64_t)a3;
- (void)checkEventsForHUDUpdate:(unint64_t)a3;
- (void)dealloc;
- (void)recordHang:(id)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 saveTailspin:(BOOL)a7 subtype:(int64_t)a8 userActionData:(id)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 captureMicroHang:(BOOL)a11;
@end

@implementation HTProcessInfo

+ (void)initialize
{
  qword_1000642A8 = (uint64_t)objc_alloc_init((Class)NSMutableArray);

  _objc_release_x1();
}

+ (void)addDisplayStateChangeEvent:(DisplayStateChangeEvent)a3
{
  int v3 = dword_100064350;
  *((DisplayStateChangeEvent *)&unk_1000642B0 + dword_100064350) = a3;
  dword_100064350 = (v3 + 1) % 0xAu;
}

+ (void)checkForHangTimeouts:(unint64_t)a3
{
  os_unfair_lock_lock(&stru_100064354);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)qword_1000642A8;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) checkEventsForTimeouts:a3 withType:2];
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  os_unfair_lock_unlock(&stru_100064354);
  if (v10)
  {
    v11 = sub_100027DEC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [v10 serviceName];
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Hang for service name %@ timed out, recording", buf, 0xCu);
    }
    [v10 recordHang];
  }
}

- (unint64_t)getHangStartTime:(unint64_t)a3
{
  shmem_region = self->shmem_region;
  if (!shmem_region->var1) {
    return -1;
  }
  unint64_t v6 = 0;
  unint64_t v7 = -1;
  uint64_t v8 = 380;
  do
  {
    if (!atomic_load((unsigned int *)((char *)shmem_region + v8 - 348)) && !*((unsigned char *)&shmem_region->var0 + v8))
    {
      unint64_t v10 = *(void *)((char *)shmem_region + v8 - 372);
      if (a3 > v10 && sub_10002A984(a3 - v10) > 250.0)
      {
        int v11 = sub_10001C3AC(self->pid);
        if (v10 >= v7) {
          int v12 = 1;
        }
        else {
          int v12 = v11;
        }
        if (!v12) {
          unint64_t v7 = v10;
        }
      }
    }
    ++v6;
    shmem_region = self->shmem_region;
    v8 += 384;
  }
  while (v6 < shmem_region->var1);
  return v7;
}

+ (unint64_t)getEarliestPendingHangStartTime:(unint64_t)a3
{
  os_unfair_lock_lock(&stru_100064354);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = (id)qword_1000642A8;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v21;
    unint64_t v9 = -1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 getHangStartTime:a3];
        if ((unint64_t)v12 < v9)
        {
          unint64_t v13 = (unint64_t)v12;
          uint64_t v14 = v11[3];
          double v15 = sub_10002A984(a3 - (void)v12);
          uint64_t v16 = +[NSString stringWithFormat:@"detected pending hang in %@, duration %.2f ms", v14, *(void *)&v15, (void)v20];

          unint64_t v9 = v13;
          unint64_t v7 = (void *)v16;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
    unint64_t v9 = -1;
  }

  os_unfair_lock_unlock(&stru_100064354);
  if (v7)
  {
    v17 = sub_100027DEC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "getEarliestPendingHangStartTime: %@", buf, 0xCu);
    }
  }
  if (v9 == -1) {
    unint64_t v18 = 0;
  }
  else {
    unint64_t v18 = v9;
  }

  return v18;
}

+ (void)checkForHUDTimeouts:(unint64_t)a3
{
  os_unfair_lock_lock(&stru_100064354);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)qword_1000642A8;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) checkEventsForHUDUpdate:a3, (void)v9];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&stru_100064354);
}

+ (void)stopWatchingPid:(int)a3
{
  os_unfair_lock_lock(&stru_100064354);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)qword_1000642A8;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (*(_DWORD *)(*(void *)(*((void *)&v9 + 1) + 8 * i) + 56) == a3)
        {
          [(id)qword_1000642A8 removeObject:(void)v9];
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(&stru_100064354);
}

+ (void)stopWatchingAllPids
{
  os_unfair_lock_lock(&stru_100064354);
  [(id)qword_1000642A8 removeAllObjects];

  os_unfair_lock_unlock(&stru_100064354);
}

+ (id)processForPid:(int)a3
{
  os_unfair_lock_lock(&stru_100064354);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)qword_1000642A8;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(_DWORD **)(*((void *)&v12 + 1) + 8 * i);
        if (v9[14] == a3)
        {
          long long v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  long long v10 = 0;
LABEL_11:

  os_unfair_lock_unlock(&stru_100064354);

  return v10;
}

+ (id)startWatchingPid:(int)a3 sharedMem:(void *)a4 length:(unint64_t)a5 bundleID:(const char *)a6
{
  uint64_t v9 = *(void *)&a3;
  uint64_t v10 = +[HTProcessInfo processForPid:](HTProcessInfo, "processForPid:");
  if (v10)
  {
    long long v11 = (HTProcessInfo *)v10;
    long long v12 = sub_100027DEC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "WARNING: %{public}@ was already being watched.", (uint8_t *)&v16, 0xCu);
    }

    long long v13 = 0;
  }
  else
  {
    long long v14 = [[HTProcessInfo alloc] initWithPid:v9 sharedMem:a4 length:a5 bundleID:a6];
    if (v14)
    {
      os_unfair_lock_lock(&stru_100064354);
      [(id)qword_1000642A8 addObject:v14];
      os_unfair_lock_unlock(&stru_100064354);
    }
    long long v11 = v14;
    long long v13 = v11;
  }

  return v13;
}

+ (BOOL)shouldSaveFenceHangLogs
{
  v2 = +[HTPrefs sharedPrefs];
  unsigned __int8 v3 = [v2 isInternal];

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    os_unfair_lock_lock(&stru_100064354);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = (id)qword_1000642A8;
    id v4 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v8 = *(unsigned char **)(*((void *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v8, "isInForeground", (void)v10) && v8[72])
          {
            LOBYTE(v4) = 1;
            goto LABEL_14;
          }
        }
        id v4 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    os_unfair_lock_unlock(&stru_100064354);
  }
  return (char)v4;
}

+ (BOOL)isAnyThirdPartyDeveloperProcessForeground
{
  os_unfair_lock_lock(&stru_100064354);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = (id)qword_1000642A8;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isInForeground", (void)v8)
          && ([v6 isDeveloperApp] & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  os_unfair_lock_unlock(&stru_100064354);
  return (char)v3;
}

- (BOOL)isInForeground
{
  id v3 = [(NSString *)self->processBundleID UTF8String];
  if (v3)
  {
    uint64_t v4 = v3;
    NSUInteger v5 = [(NSString *)self->processBundleID lengthOfBytesUsingEncoding:4];
    shmem_region = self->shmem_region;
    uint64_t var1 = shmem_region->var1;
    if (var1)
    {
      size_t v8 = v5;
      var12 = shmem_region->var2[0].var12;
      while (strncmp(v4, var12, v8))
      {
        var12 += 384;
        if (!--var1) {
          goto LABEL_6;
        }
      }
      unsigned int v10 = atomic_load((unsigned int *)var12 - 23);
      LOBYTE(v3) = v10 == 0;
    }
    else
    {
LABEL_6:
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (HTProcessInfo)initWithPid:(int)a3 sharedMem:(void *)a4 length:(unint64_t)a5 bundleID:(const char *)a6
{
  long long v11 = sub_10001B604();
  if (!v11)
  {
    int v16 = sub_100027DEC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = a3;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unable to identify process name of pid %d", buf, 8u);
    }

    goto LABEL_26;
  }
  if (a5 >> 3 <= 0x204)
  {
    long long v12 = sub_100027DEC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v43 = a5;
      __int16 v44 = 2048;
      uint64_t v45 = 4136;
      long long v13 = "Shared memory region smaller than expected: %zu < %zu";
      long long v14 = v12;
      uint32_t v15 = 22;
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (*(_DWORD *)a4 != 7)
  {
    long long v12 = sub_100027DEC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = *(_DWORD *)a4;
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = v28;
      long long v13 = "Client is not vending the current protocol version: %u";
      long long v14 = v12;
      uint32_t v15 = 8;
      goto LABEL_24;
    }
LABEL_25:

    munmap(a4, a5);
LABEL_26:
    v29 = 0;
    goto LABEL_27;
  }
  v41.receiver = self;
  v41.super_class = (Class)HTProcessInfo;
  v17 = [(HTProcessInfo *)&v41 init];
  unint64_t v18 = v17;
  if (v17)
  {
    v17->int pid = a3;
    v17->shmem_length = a5;
    v17->shmem_region = ($2B3B0A3DA3984196B2606D1DEBF62EFC *)a4;
    objc_storeStrong((id *)&v17->processPath, v11);
    uint64_t v19 = [(NSString *)v18->processPath lastPathComponent];
    long long v20 = (void *)v19;
    if (v19) {
      long long v21 = (__CFString *)v19;
    }
    else {
      long long v21 = @"[Unknown]";
    }
    objc_storeStrong((id *)&v18->processName, v21);

    uint64_t v22 = +[NSString stringWithUTF8String:a6];
    processBundleID = v18->processBundleID;
    v18->processBundleID = (NSString *)v22;

    id v24 = [(NSString *)v18->processBundleID rangeOfString:@"com.apple." options:1];
    if (v25) {
      BOOL v26 = v24 == 0;
    }
    else {
      BOOL v26 = 0;
    }
    char v27 = v26;
    v18->isFirstPartyApp = v27;
    if (v26) {
      char v31 = sub_100019BD8(v18->processBundleID);
    }
    else {
      char v31 = 0;
    }
    v18->shouldDisableProcess = v31;
    v18->shouldSaveHangLogs = [(HTProcessInfo *)v18 checkShouldSaveHangLogs];
    dispatch_source_t v32 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a3, 0x80000000uLL, (dispatch_queue_t)qword_100064560);
    appExitSource = v18->appExitSource;
    v18->appExitSource = (OS_dispatch_source *)v32;

    v34 = v18->appExitSource;
    if (v34)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10001DA04;
      v39[3] = &unk_100051D18;
      int v40 = a3;
      v39[4] = v18;
      dispatch_source_set_event_handler(v34, v39);
      dispatch_resume((dispatch_object_t)v18->appExitSource);
    }
    else
    {
      v35 = sub_100027DEC();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = a3;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Unable to setup up dispatch source to monitor PROC_EXIT for new proc %u", buf, 8u);
      }
    }
    v36 = sub_100027DEC();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      unint64_t processPath = (unint64_t)v18->processPath;
      int pid = v18->pid;
      *(_DWORD *)buf = 138543618;
      unint64_t v43 = processPath;
      __int16 v44 = 1024;
      LODWORD(v45) = pid;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "New proc: %{public}@(%u)", buf, 0x12u);
    }
  }
  self = v18;
  v29 = self;
LABEL_27:

  return v29;
}

- (BOOL)isThirdPartyDevSupportModeHang
{
  id v3 = +[HTPrefs sharedPrefs];
  if ([v3 thirdPartyDevHangHUDEnabled]) {
    BOOL v4 = [(HTProcessInfo *)self isDeveloperApp];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)checkEventsForTimeouts:(unint64_t)a3 withType:(int64_t)a4
{
  shmem_region = self->shmem_region;
  if (!shmem_region->var1) {
    goto LABEL_11;
  }
  unint64_t v9 = 0;
  double v10 = (double)a3;
  uint64_t v11 = 380;
  while (1)
  {
    if (!atomic_load((unsigned int *)((char *)shmem_region + v11 - 348)))
    {
      unint64_t v13 = *(void *)((char *)shmem_region + v11 - 372);
      double v14 = sub_10002A984((unint64_t)(v10 - (double)v13));
      double v15 = v14;
      if (a4 == 2)
      {
        BOOL v4 = +[HTPrefs sharedPrefs];
        double v16 = (double)(unint64_t)[v4 runloopHangTimeoutDurationMSec];

        if (v15 <= v16) {
          goto LABEL_10;
        }
      }
      else if (a4 != 8 || v14 <= 250.0)
      {
        goto LABEL_10;
      }
      if ((sub_10002C0B4(v13, a3, (uint64_t)self->shmem_region->var3, 0) & 1) == 0) {
        break;
      }
    }
LABEL_10:
    ++v9;
    shmem_region = self->shmem_region;
    v11 += 384;
    if (v9 >= shmem_region->var1) {
      goto LABEL_11;
    }
  }
  *(void *)((char *)shmem_region + v11 - 372) = -1;
  if (*((unsigned char *)&shmem_region->var0 + v11))
  {
    *((unsigned char *)&shmem_region->var0 + v11) = 0;
    uint64_t v19 = sub_100027DEC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      sub_10001C680(a4);
      long long v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      processBundleID = self->processBundleID;
      *(_DWORD *)buf = 138543874;
      v64 = v20;
      __int16 v65 = 2114;
      double v66 = *(double *)&processBundleID;
      __int16 v67 = 2048;
      unint64_t v68 = v13;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Hang %{public}@ detected for bundleid %{public}@ for already reported user switched away hang, startTime %llu", buf, 0x20u);
    }
    goto LABEL_11;
  }
  if (!sub_10001C3AC(self->pid)) {
    goto LABEL_27;
  }
  int v22 = strncmp((const char *)shmem_region + v11 - 256, "com.apple.HangTracer.HangTracerTests.testbundleid", 0x100uLL);
  BOOL v4 = sub_100027DEC();
  BOOL v23 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (v23)
    {
      sub_10001C680(a4);
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v29;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Hang %{public}@ detected: xctest with debugger attached will still be tracked as non-debugger hang", buf, 0xCu);
    }
LABEL_27:
    if (a4 == 2)
    {
      v30 = (char *)shmem_region + v11;
      kdebug_trace();
      char v31 = v30 - 320;
      +[NSString stringWithFormat:@"com.apple.ht_always_on.%s.%@", v30 - 320, self->processBundleID];
      j__ADClientPushValueForDistributionKey();
      dispatch_source_t v32 = self->processBundleID;
      v33 = sub_10001C1AC();
      sub_10001C244(@"Timed Out Runloop Hang", v32, v13, a3, v33);

      AnalyticsSendEventLazy();
      v34 = sub_100027DEC();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        sub_10001C680(2uLL);
        v35 = (NSString *)objc_claimAutoreleasedReturnValue();
        v36 = self->processBundleID;
        v37 = +[HTPrefs sharedPrefs];
        id v38 = [v37 runloopHangTimeoutDurationMSec];
        *(_DWORD *)buf = 138543874;
        v64 = v35;
        __int16 v65 = 2114;
        double v66 = *(double *)&v36;
        char v31 = v30 - 320;
        __int16 v67 = 2048;
        unint64_t v68 = (unint64_t)v38;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Hang %{public}@ detected, %{public}@ hang is over timeout threshold of %llu exceeded => capturing hang log", buf, 0x20u);
      }
      v39 = [HTTimeoutHangInfo alloc];
      int v40 = +[NSString stringWithUTF8String:v31];
      uint64_t v41 = *(void *)(v30 - 332);
      BOOL v42 = *(v30 - 344) != 0;
      LOBYTE(v60) = 0;
      LOBYTE(v58) = [(HTProcessInfo *)self isThirdPartyDevSupportModeHang];
      v17 = [(HTTimeoutHangInfo *)v39 initWithServiceName:v40 threadID:v41 startTime:v13 endTime:a3 saveTailspin:v42 subType:2 userActionData:0 isThirdPartyDevSupportModeHang:v58 processInfo:self captureMicroHang:v60];

      goto LABEL_49;
    }
    +[NSString stringWithFormat:@"com.apple.ht_app_exit_hang.%s.%s", (char *)shmem_region + v11 - 320, (char *)shmem_region + v11 - 256];
    j__ADClientPushValueForDistributionKey();
    unint64_t v43 = (char *)shmem_region + v11 - 342;
    int v44 = *v43;
    if (!*v43) {
      goto LABEL_37;
    }
    BOOL v4 = +[HTPrefs sharedPrefs];
    if (v15 > (double)(unint64_t)[v4 runloopHangDurationThresholdMSec])
    {

LABEL_40:
      v47 = sub_100027DEC();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v48 = @"first party";
        BOOL isFirstPartyApp = self->isFirstPartyApp;
        if (!self->isFirstPartyApp) {
          CFStringRef v48 = @"third party";
        }
        double v61 = *(double *)&v48;
        v62 = self->processBundleID;
        v50 = +[HTPrefs sharedPrefs];
        v51 = v50;
        if (isFirstPartyApp) {
          id v52 = [v50 runloopHangDurationThresholdMSec];
        }
        else {
          id v52 = [v50 runloopHangThirdPartyDurationThresholdMSec];
        }
        *(_DWORD *)buf = 138543874;
        v64 = v62;
        __int16 v65 = 2112;
        double v66 = v61;
        __int16 v67 = 2048;
        unint64_t v68 = (unint64_t)v52;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Hang on App Exit detected, %{public}@ hang is over %@ log threshold of %llu exceeded => capturing hang log", buf, 0x20u);
      }
      v53 = [HTTimeoutHangInfo alloc];
      v54 = +[NSString stringWithUTF8String:(char *)shmem_region + v11 - 320];
      v55 = (char *)shmem_region + v11;
      uint64_t v56 = *(void *)((char *)shmem_region + v11 - 332);
      BOOL v57 = *(v55 - 344) != 0;
      LOBYTE(v60) = 0;
      LOBYTE(v59) = [(HTProcessInfo *)self isThirdPartyDevSupportModeHang];
      v17 = [(HTTimeoutHangInfo *)v53 initWithServiceName:v54 threadID:v56 startTime:v13 endTime:a3 saveTailspin:v57 subType:8 userActionData:0 isThirdPartyDevSupportModeHang:v59 processInfo:self captureMicroHang:v60];

      j__ADClientAddValueForScalarKey();
      goto LABEL_49;
    }
    if (*v43)
    {
    }
    else
    {
LABEL_37:
      uint64_t v45 = +[HTPrefs sharedPrefs];
      double v46 = (double)(unint64_t)[v45 runloopHangThirdPartyDurationThresholdMSec];

      if (v44) {
      if (v15 > v46)
      }
        goto LABEL_40;
    }
    AnalyticsSendEventLazy();
    v17 = 0;
LABEL_49:
    j__ADClientAddValueForScalarKey();
    goto LABEL_12;
  }
  if (v23)
  {
    sub_10001C680(a4);
    id v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v64 = v24;
    __int16 v65 = 2048;
    double v66 = v15 / 1000.0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Hang %{public}@ detected: %.2fs (debugger attached, not reporting)", buf, 0x16u);
  }
  uint64_t v25 = sub_10001C680(a4);
  +[NSString stringWithFormat:@"com.apple.ht_debugger_attached.%@.%s", v25, (char *)shmem_region + v11 - 256];
  j__ADClientPushValueForDistributionKey();

  AnalyticsSendEventLazy();
  BOOL v26 = sub_10001C680(a4);
  char v27 = self->processBundleID;
  int v28 = sub_10001C1AC();
  sub_10001C244(v26, v27, v13, a3, v28);

LABEL_11:
  v17 = 0;
LABEL_12:

  return v17;
}

- (void)checkEventsForHUDUpdate:(unint64_t)a3
{
  if ([(HTProcessInfo *)self shouldDisplayNonFenceHangToHUD])
  {
    shmem_region = self->shmem_region;
    if (shmem_region->var1)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        size_t v8 = (char *)shmem_region + v6 * 384;
        unint64_t v9 = (uint64_t *)&shmem_region->var2[v6];
        double v10 = 0.0;
        if (sub_10001C8CC(a3, (uint64_t)v9, &v10)) {
          sub_100026CE8((uint64_t)(v8 + 124), a3, *v9, 0x7FFFFFFFFFFFFFFFLL, 0, 0, v10);
        }
        ++v7;
        shmem_region = self->shmem_region;
        ++v6;
      }
      while (v7 < shmem_region->var1);
    }
  }
}

+ (id)displayStateArray
{
  id v2 = +[NSMutableArray array];
  unint64_t v3 = dword_100064350;
  int v4 = 10;
  do
  {
    NSUInteger v5 = (char *)&unk_1000642B0 + 16 * v3;
    uint64_t v6 = *(void *)v5;
    if (*(void *)v5)
    {
      uint64_t v7 = *((unsigned int *)v5 + 2);
      size_t v8 = sub_100027DEC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v13 = v6;
        __int16 v14 = 1024;
        int v15 = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "timestamp: %llu, status: %d", buf, 0x12u);
      }

      unint64_t v9 = +[NSNumber numberWithUnsignedLongLong:v6];
      [v2 addObject:v9];

      double v10 = +[NSNumber numberWithInt:v7];
      [v2 addObject:v10];
    }
    unint64_t v3 = (v3 + 1) % 0xA;
    --v4;
  }
  while (v4);

  return v2;
}

+ (id)recentAppsDict
{
  id v2 = sub_100027DEC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100032470(v2);
  }

  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v4 = mach_absolute_time();
  os_unfair_lock_lock(&stru_100064354);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)qword_1000642A8;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if ([(id)v10 startTimeWithinMS:10000 ofCurrentTime:v4])
        {
          uint64_t v11 = *(void *)(v10 + 32);
          long long v12 = +[NSString stringWithFormat:@"%i", *(unsigned int *)(v10 + 56)];
          [v3 setObject:v11 forKeyedSubscript:v12];

          uint64_t v13 = sub_100027DEC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            int v14 = *(_DWORD *)(v10 + 56);
            uint64_t v15 = *(void *)(v10 + 32);
            *(_DWORD *)buf = 67109378;
            int v22 = v14;
            __int16 v23 = 2112;
            uint64_t v24 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Found Recent App: pid=%i path=%@", buf, 0x12u);
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&stru_100064354);

  return v3;
}

- (BOOL)startTimeWithinMS:(unint64_t)a3 ofCurrentTime:(unint64_t)a4
{
  shmem_region = self->shmem_region;
  if (!shmem_region->var1) {
    return 0;
  }
  unint64_t v7 = 0;
  BOOL v8 = 0;
  double v9 = (double)a3;
  uint64_t v10 = 380;
  do
  {
    if (!*((unsigned char *)&shmem_region->var0 + v10)
      && sub_10002A984(a4 - *(void *)((char *)shmem_region + v10 - 372)) < v9)
    {
      BOOL v8 = 1;
    }
    ++v7;
    shmem_region = self->shmem_region;
    v10 += 384;
  }
  while (v7 < shmem_region->var1);
  return v8;
}

- (void)recordHang:(id)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 saveTailspin:(BOOL)a7 subtype:(int64_t)a8 userActionData:(id)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 captureMicroHang:(BOOL)a11
{
  BOOL v13 = a7;
  id v68 = a3;
  id v67 = a9;
  double v17 = sub_10002A984(a6 - a5);
  BOOL isFirstPartyApp = self->isFirstPartyApp;
  if (self->isFirstPartyApp)
  {
    uint64_t v11 = +[HTPrefs sharedPrefs];
    if (v17 > (double)(unint64_t)[v11 runloopHangDurationThresholdMSec])
    {
      BOOL v19 = 1;
LABEL_8:

      goto LABEL_9;
    }
    if (self->isFirstPartyApp)
    {
      BOOL v19 = 0;
      goto LABEL_8;
    }
  }
  long long v20 = +[HTPrefs sharedPrefs];
  BOOL v19 = v17 > (double)(unint64_t)[v20 runloopHangThirdPartyDurationThresholdMSec];

  if (isFirstPartyApp) {
    goto LABEL_8;
  }
LABEL_9:
  if (a8 != 9 && (v19 || a11))
  {
    long long v21 = sub_100027DEC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      processName = self->processName;
      __int16 v23 = sub_10001C680(a8);
      uint64_t v24 = +[HTPrefs sharedPrefs];
      *(_DWORD *)buf = 138544386;
      unint64_t v70 = (unint64_t)processName;
      __int16 v71 = 2048;
      double v72 = v17 / 1000.0;
      __int16 v73 = 2114;
      id v74 = v68;
      __int16 v75 = 2114;
      v76 = v23;
      __int16 v77 = 2048;
      double v78 = (double)(unint64_t)[v24 runloopHangDurationThresholdMSec] / 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Hang detected %.2fs (%{public}@, %{public}@) duration > capture threshold %.2fs after accounting for assertion overlaps", buf, 0x34u);
    }
    if (a8 == 10)
    {
      uint64_t v25 = sub_100027DEC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v26 = sub_10001C680(0xAuLL);
        *(_DWORD *)buf = 134218242;
        unint64_t v70 = a6;
        __int16 v71 = 2114;
        double v72 = *(double *)&v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "hang endTime  %llu for hangsubType %{public}@", buf, 0x16u);
      }
    }
    AnalyticsSendEventLazy();
    if (a8 != 8)
    {
      +[NSString stringWithFormat:@"com.apple.hangtracer.%@.%@", v68, self->processBundleID];
      j__ADClientPushValueForDistributionKey();
      char v27 = sub_10001C680(a8);
      processBundleID = self->processBundleID;
      v29 = sub_10001C114();
      sub_10001C244(v27, processBundleID, a5, a6, v29);
    }
    unsigned __int8 v30 = [(HTProcessInfo *)self shouldDisplayNonFenceHangToHUD];
    if (v13)
    {
      char v31 = +[HTPrefs sharedPrefs];
      unsigned int v32 = [v31 htTailspinEnabled];

      if (!v32)
      {
        CFStringRef v48 = sub_100027DEC();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = self->processName;
          *(_DWORD *)buf = 138543362;
          unint64_t v70 = (unint64_t)v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: HangTracer tailspin support is disabled, not saving a report!", buf, 0xCu);
        }

        char v37 = 0;
        uint64_t v38 = 5;
        goto LABEL_47;
      }
      if (!self->shouldSaveHangLogs)
      {
        v50 = sub_100027DEC();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          v51 = self->processName;
          *(_DWORD *)buf = 138543362;
          unint64_t v70 = (unint64_t)v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: Tried to save tailspin, but shouldSaveHangLogs said NO", buf, 0xCu);
        }

        char v37 = 0;
        uint64_t v38 = 4;
        goto LABEL_47;
      }
      if (!sub_10002BCB8())
      {
        id v52 = sub_100027DEC();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = self->processName;
          *(_DWORD *)buf = 138543362;
          unint64_t v70 = (unint64_t)v53;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}@: Tried to save tailspin, but tailspin support is not present on this device!", buf, 0xCu);
        }

        char v37 = 0;
        uint64_t v38 = 3;
        goto LABEL_47;
      }
      if (+[HTTailspin hasAppExceededGeneratedLogsCountForDuration:self->processName procName:self->isFirstPartyApp isFirstPartyApp:v17])
      {
        v33 = sub_100027DEC();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = self->processName;
          v35 = +[HTPrefs sharedPrefs];
          unsigned int v36 = [v35 runLoopHangPerPeriodLogLimit];
          *(_DWORD *)buf = 138543618;
          unint64_t v70 = (unint64_t)v34;
          __int16 v71 = 1024;
          LODWORD(v72) = v36;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ hit its Generated Log limit of %u for this reporting period. Not saving a report!", buf, 0x12u);
        }
        j__ADClientAddValueForScalarKey();
        +[NSString stringWithFormat:@"com.apple.hangtracer.HTLogsMissedDueToProcessLimit.%@", self->processName];
        j__ADClientAddValueForScalarKey();
        char v37 = 0;
        uint64_t v38 = 2;
        goto LABEL_47;
      }
      if (+[HTTailspin hasExceededDailyLimit:self->isFirstPartyApp isFirstPartyApp:v17])
      {
        uint64_t v38 = 1;
        j__ADClientAddValueForScalarKey();
        +[NSString stringWithFormat:@"com.apple.hangtracer.HTLogsMissedDueToGlobalLimit.%@", self->processName];
        j__ADClientAddValueForScalarKey();
        char v37 = 0;
        goto LABEL_47;
      }
      char v37 = 1;
    }
    else
    {
      char v37 = 0;
    }
    uint64_t v38 = 11;
LABEL_47:
    char v54 = v30 ^ 1;
    if (a8 == 10) {
      char v54 = 1;
    }
    if ((v54 & 1) == 0)
    {
      v55 = [(NSString *)self->processBundleID UTF8String];
      uint64_t v56 = mach_absolute_time();
      sub_100026CE8((uint64_t)v55, v56, a5, a6, v37, a8 == 2, v17);
    }
    if (v37)
    {
      uint64_t v41 = v68;
      BOOL v57 = +[NSString stringWithFormat:@"%@-%@: timeout %.0fms", v68, self->processName, *(void *)&v17];
      uint64_t v58 = [HTHangInfo alloc];
      uint64_t pid = self->pid;
      BOOL v60 = self->isFirstPartyApp;
      double v61 = self->processName;
      unint64_t processPath = self->processPath;
      v47 = v67;
      BYTE2(v65) = v30;
      BYTE1(v65) = a10;
      LOBYTE(v65) = v60;
      v63 = -[HTHangInfo initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:](v58, "initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:", pid, a4, a5, a6, a6, 0, a8, v65, v68, v57, v61, processPath, v67);
      +[HTHangInfo addHang:v63];
      +[HTHangInfo getHangWaitTimeout];
      if (v64 <= 0.0) {
        +[HTTailspin collectTailspinAndUpdateTelemtry];
      }
      else {
        sub_10000F7D0(v64);
      }
    }
    else
    {
      +[HTTailspin notifyHTTailSpinResult:0 failReason:v38 hangSubType:a8 htBugType:sub_10001C6F8(self->isFirstPartyApp, a10, v17)];
      v47 = v67;
      uint64_t v41 = v68;
    }
    goto LABEL_57;
  }
  v39 = +[HTHangInfo allHangs];
  id v40 = [v39 count];

  uint64_t v41 = v68;
  if (v40)
  {
    +[HTHangInfo getHangWaitTimeout];
    if (v42 <= 0.0) {
      +[HTTailspin collectTailspinAndUpdateTelemtry];
    }
    else {
      sub_10000F7D0(v42);
    }
  }
  unint64_t v43 = sub_100027DEC();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    int v44 = self->processName;
    uint64_t v45 = sub_10001C680(a8);
    double v46 = +[HTPrefs sharedPrefs];
    *(_DWORD *)buf = 138544386;
    unint64_t v70 = (unint64_t)v44;
    __int16 v71 = 2048;
    double v72 = v17 / 1000.0;
    __int16 v73 = 2114;
    id v74 = v68;
    __int16 v75 = 2114;
    v76 = v45;
    __int16 v77 = 2048;
    double v78 = (double)(unint64_t)[v46 runloopHangDurationThresholdMSec] / 1000.0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: Hang detected %.2fs (%{public}@, %{public}@) duration < capture threshold %.2fs after accounting for assertion overlaps, not capturing tailspin for it", buf, 0x34u);
  }
  v47 = v67;
LABEL_57:
}

+ (void)recordFenceHang:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 reportedTime:(unint64_t)a6 blownFenceId:(unint64_t)a7 saveTailspin:(BOOL)a8 subtype:(int64_t)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 captureMicroHang:(BOOL)a11
{
  id v15 = a3;
  double v16 = sub_10002A984(a5 - a4);
  double v17 = +[HTPrefs sharedPrefs];
  id v18 = [v17 runloopHangDurationThresholdMSec];

  if (a9 != 9 && (v16 > (double)(unint64_t)v18 || a11))
  {
    int v22 = sub_100027DEC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      double v36 = v16 / 1000.0;
      __int16 v37 = 2114;
      id v38 = v15;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Fence-hang: Hang detected %.2fs (%{public}@) > capture threshold", buf, 0x16u);
    }

    j__ADClientAddValueForScalarKey();
    __int16 v23 = +[HTPrefs sharedPrefs];
    unsigned int v24 = [v23 shouldDisplayFenceHangToHUD];

    if (v24)
    {
      double v25 = sub_10002A984(a5 - a4 - 24000000);
      uint64_t v26 = mach_absolute_time();
      sub_100026CE8((uint64_t)"Fence Hang", v26, a4 + 12000000, a5 - 12000000, 1, a9 == 2, v25);
    }
    char v27 = +[HTPrefs sharedPrefs];
    unsigned int v28 = [v27 htTailspinEnabled];

    if (v28)
    {
      if (+[HTProcessInfo shouldSaveFenceHangLogs])
      {
        if (sub_10002BCB8())
        {
          if (!+[HTTailspin hasExceededDailyFenceLogLimit])
          {
            char v31 = +[NSString stringWithFormat:@"%@-%@: timeout %.0fms", v15, @"AppTBD", *(void *)&v16];
            BYTE2(v34) = v24;
            BYTE1(v34) = a10;
            LOBYTE(v34) = 0;
            unsigned int v32 = -[HTHangInfo initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:]([HTHangInfo alloc], "initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:", 0, 0, a4, a5, a6, a7, a9, v34, v15, v31, @"AppTBD", &stru_100053108, 0);
            +[HTHangInfo addHang:v32];
            +[HTHangInfo getHangWaitTimeout];
            if (v33 <= 0.0) {
              +[HTTailspin collectTailspinAndUpdateTelemtry];
            }
            else {
              sub_10000F7D0(v33);
            }

            goto LABEL_24;
          }
          uint64_t v29 = 1;
        }
        else
        {
          uint64_t v29 = 3;
        }
      }
      else
      {
        uint64_t v29 = 14;
      }
    }
    else
    {
      uint64_t v29 = 5;
    }
    +[HTTailspin notifyHTTailSpinResult:0 failReason:v29 hangSubType:a9 htBugType:0];
    goto LABEL_24;
  }
  BOOL v19 = +[HTHangInfo allHangs];
  id v20 = [v19 count];

  if (v20)
  {
    +[HTHangInfo getHangWaitTimeout];
    if (v21 <= 0.0) {
      +[HTTailspin collectTailspinAndUpdateTelemtry];
    }
    else {
      sub_10000F7D0(v21);
    }
  }
  unsigned __int8 v30 = sub_100027DEC();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    double v36 = v16 / 1000.0;
    __int16 v37 = 2114;
    id v38 = v15;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Fence-hang: Hang detected %.2fs (%{public}@), duration < capture threshold after accounting for assertion overlaps, not capturing tailspin for it", buf, 0x16u);
  }

LABEL_24:
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@(%d)", self->processName, self->pid];
}

- (void)dealloc
{
  id v3 = sub_100027DEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000324B4((uint64_t)self, v3);
  }

  shmem_region = self->shmem_region;
  if (shmem_region)
  {
    munmap(shmem_region, self->shmem_length);
    self->shmem_region = 0;
  }
  appExitSource = self->appExitSource;
  if (appExitSource) {
    dispatch_source_cancel(appExitSource);
  }
  v6.receiver = self;
  v6.super_class = (Class)HTProcessInfo;
  [(HTProcessInfo *)&v6 dealloc];
}

- (id)getApplicationByBundleId:(id)a3
{
  appInfo = self->appInfo;
  if (!appInfo)
  {
    id v5 = sub_100027DEC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100032530((uint64_t)self, v5);
    }

    id v6 = objc_alloc((Class)LSApplicationRecord);
    processBundleID = self->processBundleID;
    id v15 = 0;
    BOOL v8 = (LSApplicationRecord *)[v6 initWithBundleIdentifier:processBundleID allowPlaceholder:0 error:&v15];
    id v9 = v15;
    uint64_t v10 = self->appInfo;
    self->appInfo = v8;

    if (v9)
    {
      uint64_t v11 = sub_100027DEC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        long long v12 = self->processBundleID;
        *(_DWORD *)buf = 138543618;
        double v17 = v12;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "There was an error querying the LS database for bundle id %{public}@: %@", buf, 0x16u);
      }

      BOOL v13 = self->appInfo;
      self->appInfo = 0;
    }
    appInfo = self->appInfo;
  }

  return appInfo;
}

- (BOOL)isDeveloperApp
{
  if (self->isFirstPartyApp) {
    return 0;
  }
  uint64_t v4 = +[HTPrefs sharedPrefs];
  unsigned __int8 v5 = [v4 thirdPartyIncludeNonDevelopmentApps];

  if (v5) {
    return 1;
  }
  id v6 = [(HTProcessInfo *)self getApplicationByBundleId:self->processBundleID];
  unsigned __int8 v7 = [v6 isProfileValidated];

  return v7;
}

- (BOOL)checkShouldSaveHangLogs
{
  if (self->shouldDisableProcess)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    uint64_t v4 = +[HTPrefs sharedPrefs];
    unsigned __int8 v5 = [v4 isInternal];

    if (v5)
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      id v6 = +[HTPrefs sharedPrefs];
      id v12 = 0;
      unsigned __int8 v7 = [v6 getHighestPrioritySettingValue:@"HangTracerEnabled" matchingSelector:"BOOLValue" contextPrefixOut:&v12];
      id v8 = v12;

      if (v7)
      {
        if ([v8 isEqualToString:@"HTThirdPartyDevSupport"]
          && ![(HTProcessInfo *)self isDeveloperApp])
        {
          LOBYTE(v2) = 0;
        }
        else
        {
          LOBYTE(v2) = [v7 BOOLValue];
        }
      }
      else
      {
        id v9 = +[HTPrefs sharedPrefs];
        unsigned int v2 = [v9 hangtracerDaemonEnabled];

        uint64_t v10 = sub_100027DEC();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v14 = v2;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No overriden settings found to be enabling or disabling hangtracing. Using default of %{BOOL}d.", buf, 8u);
        }
      }
    }
  }
  return v2;
}

- (BOOL)shouldDisplayNonFenceHangToHUD
{
  id v3 = +[HTPrefs sharedPrefs];
  if ([v3 isInternal])
  {
    uint64_t v4 = +[HTPrefs sharedPrefs];
    unsigned int v5 = [v4 hudEnabled];

    if (v5) {
      return !self->shouldDisableProcess;
    }
  }
  else
  {
  }
  unsigned __int8 v7 = +[HTPrefs sharedPrefs];
  unsigned int v8 = [v7 thirdPartyDevHangHUDEnabled];

  return v8 && [(HTProcessInfo *)self isDeveloperApp];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->appInfo, 0);
  objc_storeStrong((id *)&self->appExitSource, 0);
  objc_storeStrong((id *)&self->processBundleID, 0);
  objc_storeStrong((id *)&self->processPath, 0);

  objc_storeStrong((id *)&self->processName, 0);
}

@end