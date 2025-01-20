@interface SAAppSizerScan
+ (id)appSizerScan;
- (BOOL)scanInProgress;
- (BOOL)shouldContinueScanning;
- (NSLock)pathScanLock;
- (NSMutableDictionary)dirKeyCacheList;
- (OS_os_transaction)scanOSTransaction;
- (SAAppPathList)appPathList;
- (SAAppSizerResults)appSizerResults;
- (SAAppSizerScan)init;
- (SAPathList)pathList;
- (unint64_t)runMode;
- (unsigned)shouldDefer:(unint64_t)a3 activity:(id)a4;
- (unsigned)shouldInitiatePathsScan:(unint64_t)a3 withActivity:(id)a4;
- (unsigned)waitForScan:(id)a3 mode:(unint64_t)a4 activity:(id)a5;
- (void)initiatePathsScanWithBlocksNum:(int)a3 withRunMode:(unint64_t)a4 withActivity:(id)a5 scanOptions:(unint64_t)a6 withReplyBlock:(id)a7;
- (void)resetState:(unint64_t)a3;
- (void)scanPathsWithRunMode:(unint64_t)a3 activity:(id)a4 scanOptions:(unint64_t)a5 reply:(id)a6;
- (void)setAppPathList:(id)a3;
- (void)setAppSizerResults:(id)a3;
- (void)setPathList:(id)a3;
- (void)setPathScanLock:(id)a3;
- (void)setRunMode:(unint64_t)a3;
- (void)setScanInProgress:(BOOL)a3;
- (void)setScanOSTransaction:(id)a3;
- (void)setShouldContinueScanning:(BOOL)a3;
@end

@implementation SAAppSizerScan

- (SAAppSizerScan)init
{
  v10.receiver = self;
  v10.super_class = (Class)SAAppSizerScan;
  v2 = [(SAAppSizerScan *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_runMode = 0;
    *(_WORD *)&v2->_shouldContinueScanning = 1;
    uint64_t v4 = objc_opt_new();
    pathScanLock = v3->_pathScanLock;
    v3->_pathScanLock = (NSLock *)v4;

    uint64_t v6 = os_transaction_create();
    scanOSTransaction = v3->_scanOSTransaction;
    v3->_scanOSTransaction = (OS_os_transaction *)v6;

    dirKeyCacheList = v3->_dirKeyCacheList;
    v3->_dirKeyCacheList = 0;
  }
  return v3;
}

- (void)resetState:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_runMode == a3)
  {
    appSizerResults = obj->_appSizerResults;
    obj->_runMode = 0;
    obj->_appSizerResults = 0;
    *(_WORD *)&obj->_shouldContinueScanning = 1;

    appPathList = obj->_appPathList;
    obj->_appPathList = 0;

    pathList = obj->_pathList;
    obj->_pathList = 0;

    scanOSTransaction = obj->_scanOSTransaction;
    obj->_scanOSTransaction = 0;

    dirKeyCacheList = obj->_dirKeyCacheList;
    obj->_dirKeyCacheList = 0;
  }
  objc_sync_exit(obj);
}

- (NSMutableDictionary)dirKeyCacheList
{
  dirKeyCacheList = self->_dirKeyCacheList;
  if (!dirKeyCacheList)
  {
    uint64_t v4 = +[NSArray arrayWithObjects:@"/private/var", @"/private/var/mobile", 0];
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_dirKeyCacheList;
    self->_dirKeyCacheList = v5;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
          v13 = +[NSMutableDictionary dictionaryWithCapacity:100];
          [(NSMutableDictionary *)self->_dirKeyCacheList setObject:v13 forKey:v12];

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    dirKeyCacheList = self->_dirKeyCacheList;
  }
  return dirKeyCacheList;
}

+ (id)appSizerScan
{
  if (qword_10005AAB8 != -1) {
    dispatch_once(&qword_10005AAB8, &stru_10004CB68);
  }
  v2 = (void *)qword_10005AAB0;
  return v2;
}

- (unsigned)shouldInitiatePathsScan:(unint64_t)a3 withActivity:(id)a4
{
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  if (v7->_scanInProgress)
  {
    if (a3 == 2 && v7->_runMode == 1)
    {
      id v8 = SALog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315394;
        long long v16 = "-[SAAppSizerScan shouldInitiatePathsScan:withActivity:]";
        __int16 v17 = 2048;
        *(void *)long long v18 = 2;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Updating runMode to %lu", (uint8_t *)&v15, 0x16u);
      }

      unsigned __int8 v9 = 0;
      v7->_unint64_t runMode = 2;
    }
    else
    {
      v13 = SALog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315138;
        long long v16 = "-[SAAppSizerScan shouldInitiatePathsScan:withActivity:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s App sizer is already running. Rejecting the thread", (uint8_t *)&v15, 0xCu);
      }

      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    uint64_t v10 = SALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL scanInProgress = v7->_scanInProgress;
      unint64_t runMode = v7->_runMode;
      int v15 = 136315906;
      long long v16 = "-[SAAppSizerScan shouldInitiatePathsScan:withActivity:]";
      __int16 v17 = 1024;
      *(_DWORD *)long long v18 = scanInProgress;
      *(_WORD *)&v18[4] = 2048;
      *(void *)&v18[6] = a3;
      __int16 v19 = 2048;
      unint64_t v20 = runMode;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Initiating paths scan. scanInProgress: %d mode: %lu runMode: %lu", (uint8_t *)&v15, 0x26u);
    }

    unsigned __int8 v9 = 0;
    v7->_unint64_t runMode = a3;
    v7->_BOOL scanInProgress = 1;
  }
  objc_sync_exit(v7);

  return v9;
}

- (unsigned)shouldDefer:(unint64_t)a3 activity:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 != 1) {
    goto LABEL_11;
  }
  if (![v5 shouldDefer])
  {
    unsigned __int8 v9 = +[SAAppSizerScan appSizerScan];
    id v10 = [v9 runMode];

    if (v10 == (id)2)
    {
      id v7 = SALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        v13 = "-[SAAppSizerScan shouldDefer:activity:]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s mode was updated to non-defer, deferring app sizer", (uint8_t *)&v12, 0xCu);
      }
      unsigned __int8 v8 = 4;
      goto LABEL_10;
    }
LABEL_11:
    unsigned __int8 v8 = 0;
    goto LABEL_12;
  }
  id v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[SAAppSizerScan shouldDefer:activity:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s app sizer is requested to defer", (uint8_t *)&v12, 0xCu);
  }
  unsigned __int8 v8 = 2;
LABEL_10:

  [v6 setShouldStop:1];
LABEL_12:

  return v8;
}

- (void)scanPathsWithRunMode:(unint64_t)a3 activity:(id)a4 scanOptions:(unint64_t)a5 reply:(id)a6
{
  unint64_t v33 = a3;
  id v40 = a4;
  id v36 = a6;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_10001460C;
  v57 = sub_10001461C;
  id v58 = 0;
  v39 = dispatch_group_create();
  v38 = dispatch_get_global_queue(2, 0);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 1;
  if ((os_variant_has_internal_ui() & 1) != 0
    || +[SATelemetryManager shouldSendTelemetry:v40 != 0])
  {
    id v8 = +[SATelemetryManager newWithSAFOptions:](SATelemetryManager, "newWithSAFOptions:", 1, v33);
  }
  else
  {
    id v8 = 0;
  }
  objc_msgSend(v8, "startTimeForTimeInfoEntry:", 6, v33);
  [(NSLock *)self->_pathScanLock lock];
  unsigned __int8 v9 = SALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "START: App Sizer Importing Paths", buf, 2u);
  }

  [v8 startTimeForTimeInfoEntry:7];
  id v10 = objc_opt_new();
  v11 = [(SAAppSizerScan *)self dirKeyCacheList];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100014624;
  v48[3] = &unk_10004CB90;
  v48[4] = self;
  v48[5] = &v49;
  [v10 defaultListWithSAActivity:v40 dirKeyCacheList:v11 reply:v48];

  [v8 stopTimeForTimeInfoEntry:7];
  if (*((unsigned char *)v50 + 24))
  {
    [(NSLock *)self->_pathScanLock unlock];
    (*((void (**)(id, uint64_t, void, void))v36 + 2))(v36, 2, 0, 0);
    v35 = 0;
  }
  else
  {
    int v12 = (SAPathList *)objc_opt_new();
    pathList = self->_pathList;
    self->_pathList = v12;

    v14 = (SAAppSizerResults *)objc_opt_new();
    appSizerResults = self->_appSizerResults;
    self->_appSizerResults = v14;

    if ((a5 & 0x2000) != 0) {
      [(SAAppSizerResults *)self->_appSizerResults enableAppSizeBreakdown];
    }
    uint64_t v16 = [(SAAppSizerScan *)self shouldDefer:v34 activity:v40];
    if (v16)
    {
      [(SAAppSizerScan *)self resetState:v34];
      [(NSLock *)self->_pathScanLock unlock];
      (*((void (**)(id, uint64_t, void, void))v36 + 2))(v36, v16, 0, 0);
      v35 = 0;
    }
    else
    {
      if ((a5 & 0x400) != 0)
      {
        __int16 v17 = [(SAAppPathList *)self->_appPathList appPathList];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100014680;
        v47[3] = &unk_10004C840;
        v47[4] = self;
        [v17 enumerateKeysAndObjectsUsingBlock:v47];
      }
      long long v18 = SALog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "START: App Sizer Update Paths List", buf, 2u);
      }

      [(SAPathList *)self->_pathList updateWithAppPathList:self->_appPathList];
      __int16 v19 = [(SAPathList *)self->_pathList pathToBundlesSet];
      v35 = [v19 allKeys];

      int v20 = (int)[v35 count] / 1000;
      if (v20 <= 4) {
        uint64_t v21 = 4;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = +[SAUtilities splitArray:v35 into:v21];
      v23 = (void *)v54[5];
      v54[5] = v22;

      uint64_t v24 = [(SAAppSizerScan *)self shouldDefer:v34 activity:v40];
      if (v24)
      {
        [(SAAppSizerScan *)self resetState:v34];
        [(NSLock *)self->_pathScanLock unlock];
        v25 = 0;
        id v26 = 0;
      }
      else
      {
        v27 = SALog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v28 = [v35 count];
          *(_DWORD *)buf = 67109376;
          unsigned int v60 = v28;
          __int16 v61 = 1024;
          int v62 = v21;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "START: App Sizer Scanning Paths. Number Of Paths: (%d), Number of threads: (%d)", buf, 0xEu);
        }

        [v8 startTimeForTimeInfoEntry:3];
        int v29 = 0;
        do
        {
          v30 = objc_opt_new();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000147C8;
          block[3] = &unk_10004CBE0;
          v44 = &v53;
          int v46 = v29;
          block[4] = self;
          id v42 = v30;
          id v26 = v8;
          id v43 = v26;
          unint64_t v45 = a5;
          id v31 = v30;
          dispatch_group_async(v39, v38, block);

          ++v29;
        }
        while (v21 != v29);
        uint64_t v24 = [(SAAppSizerScan *)self waitForScan:v39 mode:v34 activity:v40];
        [(NSLock *)self->_pathScanLock unlock];
        if (v24)
        {
          v32 = SALog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v60 = v24;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Stopped: App Sizer Scanning Paths Stopped With Result (%d)", buf, 8u);
          }
        }
        else
        {
          [v26 stopTimeForTimeInfoEntry:3];
        }
        v25 = self->_appSizerResults;
      }
      (*((void (**)(id, uint64_t, SAAppSizerResults *, id))v36 + 2))(v36, v24, v25, v26);
    }
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
}

- (unsigned)waitForScan:(id)a3 mode:(unint64_t)a4 activity:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = SALog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315138;
    v27 = "-[SAAppSizerScan waitForScan:mode:activity:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Waiting for scan to complete", (uint8_t *)&v26, 0xCu);
  }

  if (a4 == 2)
  {
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
LABEL_10:
    unsigned __int8 v14 = 0;
  }
  else if (a4 == 1)
  {
    while (1)
    {
      dispatch_time_t v11 = dispatch_time(0, 2000000000);
      intptr_t v12 = dispatch_group_wait(v8, v11);
      unsigned int v13 = [(SAAppSizerScan *)self shouldDefer:1 activity:v9];
      if (v13) {
        break;
      }
      if (self->_runMode == 2)
      {
        uint64_t v22 = SALog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136315138;
          v27 = "-[SAAppSizerScan waitForScan:mode:activity:]";
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Activity interrupted, stopping", (uint8_t *)&v26, 0xCu);
        }
        unsigned __int8 v14 = 4;
        goto LABEL_19;
      }
      if (!v12) {
        goto LABEL_10;
      }
    }
    unsigned __int8 v14 = v13;
    uint64_t v22 = SALog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315138;
      v27 = "-[SAAppSizerScan waitForScan:mode:activity:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Activity should defer, stopping", (uint8_t *)&v26, 0xCu);
    }
LABEL_19:

    v23 = self;
    objc_sync_enter(v23);
    v23->_shouldContinueScanning = 0;
    objc_sync_exit(v23);

    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v24 = v23;
    objc_sync_enter(v24);
    v23->_shouldContinueScanning = 1;
    objc_sync_exit(v24);
  }
  else
  {
    int v15 = SALog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100030D88((uint64_t)self, v15, v16, v17, v18, v19, v20, v21);
    }

    unsigned __int8 v14 = 3;
  }

  return v14;
}

- (void)initiatePathsScanWithBlocksNum:(int)a3 withRunMode:(unint64_t)a4 withActivity:(id)a5 scanOptions:(unint64_t)a6 withReplyBlock:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  if (a4 != 1 || v11)
  {
    if ([(SAAppSizerScan *)self shouldInitiatePathsScan:a4 withActivity:v11]) {
      (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, 1, 0, 0);
    }
    else {
      [(SAAppSizerScan *)self scanPathsWithRunMode:a4 activity:v11 scanOptions:a6 reply:v12];
    }
  }
  else
  {
    unsigned int v13 = SALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100030DF8(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, 3, 0, 0);
  }
}

- (unint64_t)runMode
{
  return self->_runMode;
}

- (void)setRunMode:(unint64_t)a3
{
  self->_unint64_t runMode = a3;
}

- (BOOL)shouldContinueScanning
{
  return self->_shouldContinueScanning;
}

- (void)setShouldContinueScanning:(BOOL)a3
{
  self->_shouldContinueScanning = a3;
}

- (BOOL)scanInProgress
{
  return self->_scanInProgress;
}

- (void)setScanInProgress:(BOOL)a3
{
  self->_BOOL scanInProgress = a3;
}

- (SAAppSizerResults)appSizerResults
{
  return (SAAppSizerResults *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppSizerResults:(id)a3
{
}

- (SAAppPathList)appPathList
{
  return (SAAppPathList *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAppPathList:(id)a3
{
}

- (SAPathList)pathList
{
  return (SAPathList *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPathList:(id)a3
{
}

- (NSLock)pathScanLock
{
  return (NSLock *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPathScanLock:(id)a3
{
}

- (OS_os_transaction)scanOSTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 64, 1);
}

- (void)setScanOSTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanOSTransaction, 0);
  objc_storeStrong((id *)&self->_pathScanLock, 0);
  objc_storeStrong((id *)&self->_pathList, 0);
  objc_storeStrong((id *)&self->_appPathList, 0);
  objc_storeStrong((id *)&self->_appSizerResults, 0);
  objc_storeStrong((id *)&self->_dirKeyCacheList, 0);
}

@end