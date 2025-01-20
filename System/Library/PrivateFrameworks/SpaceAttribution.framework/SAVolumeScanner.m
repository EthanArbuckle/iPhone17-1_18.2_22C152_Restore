@interface SAVolumeScanner
+ (BOOL)shouldForceTelemetry;
+ (void)disableAppSizerResultsFiltering;
+ (void)setAppSizerResultsFilteringToDefault;
+ (void)setForceTelemetry;
- (BOOL)appSizerInProgress;
- (BOOL)extendedDirStatsEnabled;
- (BOOL)fullVolumeScanFromPath:(id)a3 withPathList:(id)a4 error:(id *)a5;
- (BOOL)isSoftwareUpdateInProgressTvOS;
- (BOOL)isSoftwareUpdateInProgressWatchOS;
- (BOOL)isSoftwareUpdateInProgressiOS;
- (BOOL)knownApp;
- (NSDate)startTime;
- (NSFileManager)fileManager;
- (NSMutableDictionary)dirKeyCacheList;
- (NSMutableDictionary)tagMap;
- (NSSet)knownAppName;
- (OS_dispatch_queue)rerunQue;
- (SAAppPathList)appPathList;
- (SAAppSizerResults)appSizerResults;
- (SAPathList)pathList;
- (SAPurgeableRecords)purgeableRecords;
- (SATelemetryManager)telemetryManager;
- (SAVolumeScanner)init;
- (unint64_t)addSoftwareUpdateBundle;
- (unint64_t)analyzeDirEntry:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6;
- (unint64_t)analyzeDirExit:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6;
- (unint64_t)analyzeFile:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6;
- (unint64_t)childrenInsideKnown;
- (unint64_t)dataVolumeSizeUsed;
- (unint64_t)getSUVolumeUsedSpace;
- (unint64_t)knownAppByteCount;
- (unint64_t)othersByteCount;
- (unint64_t)scanOptions;
- (unint64_t)softwareUpdateVolumeUsedSpace;
- (unint64_t)systemVolumeUsedSpace;
- (unint64_t)totalHiddenAppSize;
- (unint64_t)totalPurgeableDataSize;
- (unint64_t)totalVisibleAppSize;
- (unsigned)runAppSizerWithAsyncBlocksNum:(int)a3 withRunMode:(unint64_t)a4 withActivity:(id)a5 withScanOptions:(unint64_t)a6 error:(id *)a7;
- (void)calculateDiskUsedAndCapacity;
- (void)calculateSystemDataSize;
- (void)checkForSizesOverflow;
- (void)processPurgeableAttributionTags;
- (void)scanURLs:(id)a3 withSizer:(id)a4;
- (void)setAppPathList:(id)a3;
- (void)setAppSizerInProgress:(BOOL)a3;
- (void)setAppSizerMaxRerunTimeout:(unsigned int)a3;
- (void)setAppSizerResults:(id)a3;
- (void)setChildrenInsideKnown:(unint64_t)a3;
- (void)setDataVolumeSizeUsed:(unint64_t)a3;
- (void)setDirKeyCacheList:(id)a3;
- (void)setExtendedDirStatsEnabled:(BOOL)a3;
- (void)setFileManager:(id)a3;
- (void)setKnownApp:(BOOL)a3;
- (void)setKnownAppByteCount:(unint64_t)a3;
- (void)setKnownAppName:(id)a3;
- (void)setOthersByteCount:(unint64_t)a3;
- (void)setPathList:(id)a3;
- (void)setPurgeableRecords:(id)a3;
- (void)setRerunQue:(id)a3;
- (void)setScanOptions:(unint64_t)a3;
- (void)setSoftwareUpdateVolumeUsedSpace:(unint64_t)a3;
- (void)setStartTime:(id)a3;
- (void)setSystemVolumeUsedSpace:(unint64_t)a3;
- (void)setTagMap:(id)a3;
- (void)setTelemetryManager:(id)a3;
- (void)setTotalHiddenAppSize:(unint64_t)a3;
- (void)setTotalPurgeableDataSize:(unint64_t)a3;
- (void)setTotalVisibleAppSize:(unint64_t)a3;
- (void)updateAppSizerResultsWithSUPurgeableUrgencySizes;
@end

@implementation SAVolumeScanner

- (SAVolumeScanner)init
{
  v14.receiver = self;
  v14.super_class = (Class)SAVolumeScanner;
  v2 = [(SAVolumeScanner *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_scanOptions = 0;
    v2->_knownApp = 0;
    v2->_othersByteCount = 0;
    v2->_knownAppByteCount = 0;
    knownAppName = v2->_knownAppName;
    v2->_childrenInsideKnown = 0;
    v2->_knownAppName = 0;

    uint64_t v5 = objc_opt_new();
    fileManager = v3->_fileManager;
    v3->_fileManager = (NSFileManager *)v5;

    v3->_appSizerInProgress = 0;
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    rerunQue = v3->_rerunQue;
    v3->_rerunQue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[NSDate now];
    startTime = v3->_startTime;
    v3->_startTime = (NSDate *)v9;

    v3->_extendedDirStatsEnabled = 0;
    uint64_t v11 = objc_opt_new();
    tagMap = v3->_tagMap;
    v3->_tagMap = (NSMutableDictionary *)v11;

    *(_OWORD *)&v3->_softwareUpdateVolumeUsedSpace = 0u;
    *(_OWORD *)&v3->_totalPurgeableDataSize = 0u;
    *(_OWORD *)&v3->_totalVisibleAppSize = 0u;
  }
  return v3;
}

- (void)scanURLs:(id)a3 withSizer:(id)a4
{
  id v5 = a3;
  id v38 = a4;
  v6 = objc_opt_new();
  v41 = objc_opt_new();
  uint64_t v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100030EE8(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  id v15 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v15)
  {
    id v16 = v15;
    id v17 = 0;
    uint64_t v18 = *(void *)v43;
    do
    {
      v19 = 0;
      v20 = v17;
      do
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v19);
        v23 = [v21 path];
        v24 = [v41 getItemSizeAtPath:v23];

        id v17 = +[SAURLSize newWithSize:mayBePartOfCloneChain:](SAURLSize, "newWithSize:mayBePartOfCloneChain:", [v24 dataSize], (uint64_t)objc_msgSend(v24, "cloneSize") > 0);
        [v6 addURL:v21 withSizeInfo:v17];
        if ((self->_scanOptions & 2) != 0) {
          [v38 callHandlerWithResults:v6 error:0];
        }
        v25 = SALog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v26 = [v21 path];
          id v37 = [v24 dataSize];
          id v27 = [v24 cloneSize];
          id v28 = [v24 purgeableSize];
          *(_DWORD *)buf = 136316162;
          v47 = "-[SAVolumeScanner scanURLs:withSizer:]";
          __int16 v48 = 2112;
          v49 = v26;
          __int16 v50 = 2048;
          id v51 = v37;
          __int16 v52 = 2048;
          id v53 = v27;
          __int16 v54 = 2048;
          id v55 = v28;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s path %@, data %llu, clone %llu, purge %llu", buf, 0x34u);
        }
        v19 = (char *)v19 + 1;
        v20 = v17;
      }
      while (v16 != v19);
      id v16 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
    }
    while (v16);
  }
  if (self->_scanOptions) {
    [v38 callHandlerWithResults:v6 error:0];
  }
  v29 = SALog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_100030E70(v29, v30, v31, v32, v33, v34, v35, v36);
  }
}

- (BOOL)fullVolumeScanFromPath:(id)a3 withPathList:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = SALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100030F60(v9);
  }

  uint64_t v10 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100015AE0;
  v20 = &unk_10004CC08;
  v21 = self;
  id v12 = v7;
  id v22 = v12;
  id v13 = v10;
  id v23 = v13;
  [v11 traverseWithPath:v8 options:15 completionHandler:&v17];

  uint64_t v14 = [@"com.apple.fakeapp.SystemData" description];
  id v15 = +[NSSet setWithObject:v14];

  -[SAAppSizerResults updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:](self->_appSizerResults, "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", v15, 0, self->_othersByteCount, 0, 0, 0, 0, 0, 0, v17, v18, v19, v20, v21);
  [v11 debugLogStatistics];
  [v13 print];
  [v13 updateTimestamp];
  [v13 setStatus:0];
  if (self->_scanOptions) {
    +[SACallbackManager callAppSizeHandlersWithResults:v13 error:0];
  }

  return 1;
}

- (BOOL)isSoftwareUpdateInProgressiOS
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  id v3 = [objc_alloc((Class)SUManagerClient) initWithDelegate:0];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_100015CF8;
  uint64_t v11 = &unk_10004CC30;
  id v13 = &v14;
  v4 = v2;
  id v12 = v4;
  [v3 downloadAndInstallState:&v8];
  dispatch_time_t v5 = dispatch_time(0, 4000000000);
  dispatch_group_wait(v4, v5);
  objc_msgSend(v3, "invalidate", v8, v9, v10, v11);
  char v6 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v6;
}

- (BOOL)isSoftwareUpdateInProgressWatchOS
{
  return 0;
}

- (BOOL)isSoftwareUpdateInProgressTvOS
{
  return 0;
}

- (void)updateAppSizerResultsWithSUPurgeableUrgencySizes
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [&off_10004FC88 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      char v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(&off_10004FC88);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v6);
        bzero(&v22, 0x878uLL);
        id v8 = v7;
        statfs((const char *)[v8 fileSystemRepresentation], &v22);
        uint64_t v9 = [(SAVolumeScanner *)self dirKeyCacheList];
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];

        uint64_t v11 = [(SAVolumeScanner *)self purgeableRecords];
        id v12 = [v11 SUPurgeableUrgencyData];
        id v13 = [v12 objectForKeyedSubscript:v8];

        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000161D0;
        v15[3] = &unk_10004CC58;
        id v16 = v10;
        char v17 = self;
        id v14 = v10;
        [v13 enumerateKeysAndObjectsUsingBlock:v15];

        char v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [&off_10004FC88 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)checkForSizesOverflow
{
  id v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "START: App Sizer Check For Sizes OverFlow", buf, 2u);
  }

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  [(SAVolumeScanner *)self setTotalVisibleAppSize:0];
  id v4 = [(SAVolumeScanner *)self appSizerResults];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000166C0;
  v15[3] = &unk_10004CC80;
  void v15[4] = self;
  v15[5] = &v28;
  v15[6] = &v24;
  v15[7] = &v20;
  v15[8] = &v16;
  [v4 enumerateAppsDataUsingBlock:v15];

  unint64_t v5 = v21[3];
  if (v5 > [(SAVolumeScanner *)self totalHiddenAppSize])
  {
    char v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000310FC((uint64_t)v40, v21[3], [(SAVolumeScanner *)self totalHiddenAppSize], v6);
    }
  }
  id v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v25[3];
    unint64_t v9 = [(SAVolumeScanner *)self totalVisibleAppSize];
    unint64_t v10 = [(SAVolumeScanner *)self totalHiddenAppSize];
    uint64_t v11 = v21[3];
    *(_DWORD *)buf = 134218752;
    uint64_t v33 = v8;
    __int16 v34 = 2048;
    unint64_t v35 = v9;
    __int16 v36 = 2048;
    unint64_t v37 = v10;
    __int16 v38 = 2048;
    uint64_t v39 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "totalAppSize = %llu, totalVisibleAppSize = %llu, totalHiddenAppSize = %llu, unreportedSize = %llu", buf, 0x2Au);
  }

  id v12 = SALog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v29[3];
    unint64_t v14 = v17[3];
    *(_DWORD *)buf = 134218240;
    uint64_t v33 = v13;
    __int16 v34 = 2048;
    unint64_t v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "totalVisibleAppCount = %llu, unreportedIncidents = %llu", buf, 0x16u);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

- (void)calculateDiskUsedAndCapacity
{
  id v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "START: App Sizer Calculate DiskUsed And diskCapacity", (uint8_t *)&v24, 2u);
  }

  id v4 = [(SAVolumeScanner *)self appSizerResults];
  -[SAVolumeScanner setTotalPurgeableDataSize:](self, "setTotalPurgeableDataSize:", [v4 totalCDAvailable]);

  unint64_t v5 = SALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = [(SAVolumeScanner *)self appSizerResults];
    id v7 = [v6 totalCDAvailable];
    uint64_t v8 = [(SAVolumeScanner *)self appSizerResults];
    id v9 = [v8 totalPurgeableClones];
    int v24 = 134218240;
    id v25 = v7;
    __int16 v26 = 2048;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "App Sizer totalCDAvailable:%llu purgeableClonesSize: %llu", (uint8_t *)&v24, 0x16u);
  }
  unint64_t v10 = [(SAVolumeScanner *)self appSizerResults];
  [v10 initDiskUsedAndCapacity];

  uint64_t v11 = [(SAVolumeScanner *)self telemetryManager];
  id v12 = [(SAVolumeScanner *)self appSizerResults];
  objc_msgSend(v11, "updateTotalsInfo:totalPurgeable:", objc_msgSend(v12, "diskUsed"), -[SAVolumeScanner totalPurgeableDataSize](self, "totalPurgeableDataSize"));

  uint64_t v13 = SALog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v14 = [(SAVolumeScanner *)self appSizerResults];
    id v15 = [v14 diskUsed];
    uint64_t v16 = [(SAVolumeScanner *)self appSizerResults];
    id v17 = [v16 diskCapacity];
    unint64_t v18 = [(SAVolumeScanner *)self totalPurgeableDataSize];
    int v24 = 134218496;
    id v25 = v15;
    __int16 v26 = 2048;
    id v27 = v17;
    __int16 v28 = 2048;
    unint64_t v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "App Sizer diskUsed:%llu diskCapacity:%llu totalPurgeableDataSize:%llu", (uint8_t *)&v24, 0x20u);
  }
  uint64_t v19 = [(SAVolumeScanner *)self appSizerResults];
  id v20 = [v19 diskUsed];
  unint64_t v21 = [(SAVolumeScanner *)self totalPurgeableDataSize];

  if ((unint64_t)v20 < v21)
  {
    uint64_t v22 = SALog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10003122C(self);
    }

    [(SAVolumeScanner *)self setTotalPurgeableDataSize:0];
  }
  uint64_t v23 = [(SAVolumeScanner *)self appSizerResults];
  objc_msgSend(v23, "setDiskUsed:", (unsigned char *)objc_msgSend(v23, "diskUsed")- (unsigned char *)-[SAVolumeScanner totalPurgeableDataSize](self, "totalPurgeableDataSize"));
}

- (void)calculateSystemDataSize
{
  id v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v37) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "START: App Sizer Calculate 'System Data' Size", (uint8_t *)&v37, 2u);
  }

  id v4 = [(SAVolumeScanner *)self appSizerResults];
  unint64_t v5 = (char *)[v4 diskUsed];
  unint64_t v6 = [(SAVolumeScanner *)self totalVisibleAppSize];
  id v7 = (char *)[(SAVolumeScanner *)self softwareUpdateVolumeUsedSpace] + v6;
  uint64_t v8 = (char *)[(SAVolumeScanner *)self systemVolumeUsedSpace] + (void)v7;

  if (v5 < v8)
  {
    unint64_t v9 = [(SAVolumeScanner *)self totalVisibleAppSize];
    unint64_t v10 = [(SAVolumeScanner *)self softwareUpdateVolumeUsedSpace];
    unint64_t v11 = [(SAVolumeScanner *)self systemVolumeUsedSpace];
    id v12 = [(SAVolumeScanner *)self appSizerResults];
    unint64_t v13 = v9 + v10 + v11 - (void)[v12 diskUsed] + 0x40000000;

    if (v13 <= [(SAVolumeScanner *)self totalPurgeableDataSize])
    {
      id v15 = (char *)[(SAVolumeScanner *)self totalPurgeableDataSize] - v13;
      uint64_t v16 = [(SAVolumeScanner *)self appSizerResults];
      objc_msgSend(v16, "setDiskUsed:", (char *)objc_msgSend(v16, "diskUsed") + v13);

      [(SAVolumeScanner *)self setTotalPurgeableDataSize:v15];
      unint64_t v14 = SALog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000313C8(self);
      }
    }
    else
    {
      unint64_t v14 = SALog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10003133C(self);
      }
    }
  }
  unint64_t v17 = [(SAVolumeScanner *)self dataVolumeSizeUsed];
  unint64_t v18 = v17 - [(SAVolumeScanner *)self totalVisibleAppSize];
  uint64_t v19 = [(SAVolumeScanner *)self appSizerResults];
  id v20 = [v19 diskUsed];
  unint64_t v21 = [(SAVolumeScanner *)self totalVisibleAppSize];
  unint64_t v22 = [(SAVolumeScanner *)self softwareUpdateVolumeUsedSpace];
  unint64_t v23 = v20 - ((unsigned char *)[(SAVolumeScanner *)self systemVolumeUsedSpace] + v21 + v22);

  if ((v23 & 0x8000000000000000) != 0)
  {
    int v24 = SALog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000312D4();
    }

    unint64_t v23 = 0x40000000;
  }
  if (v18 <= v23) {
    unint64_t v25 = v23;
  }
  else {
    unint64_t v25 = v18;
  }
  if (v18 >= v23) {
    unint64_t v26 = v23;
  }
  else {
    unint64_t v26 = v18;
  }
  id v27 = (void *)(v25 - v26);
  if (v25 - v26 >= 0x20000001)
  {
    __int16 v28 = SALog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v37 = 134218496;
      id v38 = v27;
      __int16 v39 = 2048;
      unint64_t v40 = v18;
      __int16 v41 = 2048;
      unint64_t v42 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Large System data size gap (%llu). calculatedSystemDataFormula1 (%llu) calculatedSystemDataFormula2 (%llu)", (uint8_t *)&v37, 0x20u);
    }
  }
  unint64_t v29 = +[NSSet setWithObject:@"com.apple.fakeapp.SystemData"];
  uint64_t v30 = [(SAVolumeScanner *)self appSizerResults];
  uint64_t v31 = [v30 appsDataInternal];
  uint64_t v32 = [v31 objectForKeyedSubscript:@"com.apple.fakeapp.SystemData"];

  if (!v32) {
    uint64_t v32 = objc_opt_new();
  }
  [v32 setDataSize:v23];
  [v32 setFixedSize:0];
  uint64_t v33 = SALog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = [v32 dataSize];
    int v37 = 134217984;
    id v38 = v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "systemData = %llu", (uint8_t *)&v37, 0xCu);
  }

  unint64_t v35 = [(SAVolumeScanner *)self appSizerResults];
  [v35 setAppSet:v29 withAppSize:v32];

  __int16 v36 = [(SAVolumeScanner *)self telemetryManager];
  objc_msgSend(v36, "setSystemDataSize:", objc_msgSend(v32, "dataSize"));
}

- (unint64_t)getSUVolumeUsedSpace
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000173C4;
  v4[3] = &unk_10004CCA8;
  v4[4] = &v5;
  +[SASupport getVolSizeFromAttrList:completionHandler:](SASupport, "getVolSizeFromAttrList:completionHandler:", [@"/private/var/MobileSoftwareUpdate" fileSystemRepresentation], v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)addSoftwareUpdateBundle
{
  id v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "START: App Sizer Calculate Software Update Volume Size", (uint8_t *)&v13, 2u);
  }

  id v4 = [(SAVolumeScanner *)self telemetryManager];
  [v4 startTimeForTimeInfoEntry:10];

  LODWORD(v4) = [(SAVolumeScanner *)self isSoftwareUpdateInProgressiOS];
  uint64_t v5 = [(SAVolumeScanner *)self telemetryManager];
  [v5 stopTimeForTimeInfoEntry:10];

  if (v4)
  {
    unint64_t v6 = [(SAVolumeScanner *)self getSUVolumeUsedSpace];
    uint64_t v7 = +[NSSet setWithObject:@"com.apple.fakeapp.SoftwareUpdate"];
    uint64_t v8 = objc_opt_new();
    [v8 setDataSize:v6];
    unint64_t v9 = [(SAVolumeScanner *)self appSizerResults];
    [v9 updateAppSet:v7 withAppSize:v8];

    unint64_t v10 = [(SAVolumeScanner *)self telemetryManager];
    [v10 addValue:v6 forAppInfoEntry:22 forBundleSet:v7];

    unint64_t v11 = SALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      unint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "softwareUpdateVolumeUsedSpace %llu", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Software Update is not in progress", (uint8_t *)&v13, 2u);
    }
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)processPurgeableAttributionTags
{
  id v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "START: App Sizer Purgeable Attribution Tagging", buf, 2u);
  }

  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  *(void *)buf = 0;
  unint64_t v21 = buf;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = sub_10001460C;
  int v24 = sub_10001461C;
  id v25 = 0;
  id v4 = [(SAVolumeScanner *)self purgeableRecords];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100017A0C;
  v19[3] = &unk_10004CCD0;
  v19[4] = &v30;
  v19[5] = &v26;
  v19[6] = buf;
  [v4 processAttributionTagsPurgeableWithReply:v19];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [&off_10004FCA0 countByEnumeratingWithState:&v15 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(&off_10004FCA0);
        }
        uint64_t v8 = [*((id *)v21 + 5) objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * (void)v7)];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100017A34;
        v14[3] = &unk_10004CCF8;
        v14[4] = self;
        [v8 enumerateKeysAndObjectsUsingBlock:v14];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [&off_10004FCA0 countByEnumeratingWithState:&v15 objects:v38 count:16];
    }
    while (v5);
  }
  unint64_t v9 = [(SAVolumeScanner *)self telemetryManager];
  [v9 setValue:v31[3] forTimeInfoEntry:9];

  unint64_t v10 = [(SAVolumeScanner *)self telemetryManager];
  [v10 setValue:v27[3] forTotalsInfoEntry:3];

  unint64_t v11 = SALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = v31[3] / 0xF4240uLL;
    uint64_t v13 = v27[3];
    *(_DWORD *)id v34 = 134218240;
    unint64_t v35 = v12;
    __int16 v36 = 2048;
    uint64_t v37 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Completed processing purgeable attribution tags (timeElapsed: %llu) (tagsCount: %llu)", v34, 0x16u);
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
}

- (unsigned)runAppSizerWithAsyncBlocksNum:(int)a3 withRunMode:(unint64_t)a4 withActivity:(id)a5 withScanOptions:(unint64_t)a6 error:(id *)a7
{
  id v171 = a5;
  v253[0] = 0;
  v253[1] = v253;
  v253[2] = 0x3032000000;
  v253[3] = sub_10001460C;
  v253[4] = sub_10001461C;
  id v254 = 0;
  uint64_t v249 = 0;
  v250 = &v249;
  uint64_t v251 = 0x2020000000;
  char v252 = 0;
  uint64_t v8 = SALog();
  unint64_t v178 = a6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "START: App Sizer", buf, 2u);
  }

  if ((a6 & 0x10) == 0)
  {
    unint64_t v9 = +[NSDate now];
    startTime = self->_startTime;
    self->_startTime = v9;
  }
  if (v171)
  {
    unint64_t v11 = SALog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    unint64_t v12 = "App Sizer: Daily Activity";
  }
  else
  {
    unint64_t v11 = SALog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    unint64_t v12 = "App Sizer: User Initiated";
  }
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
LABEL_11:

  uint64_t v13 = +[SAAppSizerScan appSizerScan];
  v248[0] = _NSConcreteStackBlock;
  v248[1] = 3221225472;
  v248[2] = sub_100019CDC;
  v248[3] = &unk_10004CD20;
  v248[5] = &v249;
  v248[4] = self;
  [v13 initiatePathsScanWithBlocksNum:a3 withRunMode:a4 withActivity:v171 scanOptions:a6 withReplyBlock:v248];
  v166 = v13;
  LODWORD(v13) = *((unsigned __int8 *)v250 + 24);
  if (v13 == 2)
  {
    [v166 resetState:a4];
    LODWORD(v13) = *((unsigned __int8 *)v250 + 24);
  }
  if (!v13)
  {
    LODWORD(v13) = [v166 shouldDefer:a4 activity:v171];
    if (v13)
    {
      [v166 resetState:a4];
      long long v15 = SALog();
      v163 = v15;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "App Sizer Deferred", buf, 2u);
      }
      id v172 = 0;
      goto LABEL_158;
    }
    long long v16 = [v166 pathList];
    [(SAVolumeScanner *)self setPathList:v16];

    v163 = +[NSArray arrayWithObjects:@"/private/var", @"/private/var/mobile", 0];
    long long v17 = [v166 dirKeyCacheList];
    [(SAVolumeScanner *)self setDirKeyCacheList:v17];

    if ((a6 & 0x4000) != 0)
    {
      long long v18 = SALog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "START: App Sizer SU Purgeable Processing", buf, 2u);
      }

      id v19 = +[SAPurgeableRecords newWithActivity:v171 withRunMode:a4];
      [(SAVolumeScanner *)self setPurgeableRecords:v19];

      id v20 = [(SAVolumeScanner *)self purgeableRecords];
      unint64_t v21 = [(SAVolumeScanner *)self pathList];
      uint64_t v22 = [(SAVolumeScanner *)self dirKeyCacheList];
      [v20 asyncStartProcessingSUPurgeableUrgencyFilesUsingPathList:v21 andDirKeyCacheList:v22];
    }
    unint64_t v23 = SALog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "START: App Sizer Calculate Fixed Sizes", buf, 2u);
    }

    int v24 = [v166 appPathList];
    id v25 = [v24 appPathList];
    id v26 = [v25 copy];

    group = dispatch_group_create();
    v169 = dispatch_get_global_queue(2, 0);
    id v27 = [(SAVolumeScanner *)self telemetryManager];
    [v27 startTimeForTimeInfoEntry:5];

    uint64_t v28 = objc_opt_new();
    uint64_t v29 = [v166 appPathList];
    [(SAVolumeScanner *)self setAppPathList:v29];

    uint64_t v30 = [(SAVolumeScanner *)self appSizerResults];
    uint64_t v31 = [v30 appsDataInternal];
    v162 = [v31 allKeys];

    uint64_t v32 = +[SAUtilities splitArray:v162 into:4];
    for (int i = 0; i != 4; ++i)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100019D54;
      block[3] = &unk_10004CD48;
      id v168 = v32;
      id v242 = v168;
      int v247 = i;
      id v167 = v26;
      id v243 = v167;
      id v172 = v28;
      id v244 = v172;
      v245 = self;
      unint64_t v246 = v178;
      dispatch_group_async(group, v169, block);
    }
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    id v34 = [(SAVolumeScanner *)self telemetryManager];
    [v34 stopTimeForTimeInfoEntry:5];

    if ((v178 & 4) != 0) {
      [v172 debugLogStatistics];
    }
    LODWORD(v13) = [v166 shouldDefer:a4 activity:v171];
    if (v13)
    {
      [v166 resetState:a4];
      unint64_t v35 = SALog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "App Sizer Deferred", buf, 2u);
      }

      __int16 v36 = [(SAVolumeScanner *)self purgeableRecords];
      [v36 waitForProcessingSUPurgeableUrgencyFiles];

      goto LABEL_157;
    }
    uint64_t v37 = [(SAVolumeScanner *)self telemetryManager];
    unint64_t v38 = (unint64_t)[v37 getValueForDirStatsTotalsInfoEntry:2];

    __int16 v39 = [(SAVolumeScanner *)self telemetryManager];
    id v40 = [v39 getValueForDirStatsTotalsInfoEntry:3];

    __int16 v41 = [(SAVolumeScanner *)self telemetryManager];
    unint64_t v42 = (uint64_t (*)(uint64_t, uint64_t))[v41 getValueForDirStatsTotalsInfoEntry:4];

    long long v43 = [(SAVolumeScanner *)self telemetryManager];
    id v44 = [v43 getValueForDirStatsTotalsInfoEntry:5];

    long long v45 = [(SAVolumeScanner *)self telemetryManager];
    id v46 = [v45 getValueForDirStatsTotalsInfoEntry:6];

    v47 = SALog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219008;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v40;
      *(_WORD *)&buf[22] = 2048;
      v269 = v42;
      *(_WORD *)v270 = 2048;
      *(void *)&v270[2] = v44;
      *(_WORD *)&v270[10] = 2048;
      *(void *)&v270[12] = v46;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Extended dir-stats : numOfPaths %llu, numOfPathsDirStatEnabled %llu, numOfPathsDirStatUsed %llu,  numOfPathsDirStatFailed %llu, numOfPathsDirStatSkipped %llu", buf, 0x34u);
    }

    if ((char *)((char *)v42 + (void)v46) > (char *)(v38 >> 1))
    {
      __int16 v48 = SALog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Extended dir-stats enabled on half of valid paths, enable attribution tagging", buf, 2u);
      }

      +[SAAttributionTag enableAttributionTagging:1];
      v49 = [(SAVolumeScanner *)self telemetryManager];
      [v49 startTimeForTimeInfoEntry:4];

      __int16 v50 = SALog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        sub_1000315F8(v50);
      }

      long long v239 = 0u;
      long long v240 = 0u;
      long long v237 = 0u;
      long long v238 = 0u;
      id obj = v163;
      id v51 = [obj countByEnumeratingWithState:&v237 objects:v267 count:16];
      if (v51)
      {
        uint64_t v52 = *(void *)v238;
        do
        {
          for (j = 0; j != v51; j = (char *)j + 1)
          {
            if (*(void *)v238 != v52) {
              objc_enumerationMutation(obj);
            }
            uint64_t v54 = *(void *)(*((void *)&v237 + 1) + 8 * (void)j);
            *(void *)buf = 0;
            *(void *)&uint8_t buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v269 = sub_10001460C;
            *(void *)v270 = sub_10001461C;
            *(void *)&v270[8] = objc_opt_new();
            v236[0] = _NSConcreteStackBlock;
            v236[1] = 3221225472;
            v236[2] = sub_10001A5A8;
            v236[3] = &unk_10004CD70;
            v236[4] = v54;
            v236[5] = self;
            v236[8] = v178;
            v236[6] = v253;
            v236[7] = buf;
            +[SAAttributionTag processAttributionTagsForVol:v54 withBlock:v236];
            if ((v178 & 0x40) != 0)
            {
              id v55 = [(SAVolumeScanner *)self appSizerResults];
              v56 = [v55 attributionTags];

              objc_sync_enter(v56);
              v57 = [(SAVolumeScanner *)self appSizerResults];
              v58 = [v57 attributionTags];
              [v58 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:v54];

              objc_sync_exit(v56);
            }
            _Block_object_dispose(buf, 8);
          }
          id v51 = [obj countByEnumeratingWithState:&v237 objects:v267 count:16];
        }
        while (v51);
      }

      v59 = [(SAVolumeScanner *)self telemetryManager];
      [v59 stopTimeForTimeInfoEntry:4];
    }
    v60 = SALog();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "START: App Sizer Clone Mapper", buf, 2u);
    }

    v61 = [(SAVolumeScanner *)self telemetryManager];
    [v61 startTimeForTimeInfoEntry:8];

    uint64_t v232 = 0;
    v233 = &v232;
    uint64_t v234 = 0x2020000000;
    uint64_t v235 = 0;
    long long v228 = 0u;
    long long v229 = 0u;
    long long v230 = 0u;
    long long v231 = 0u;
    id v173 = v163;
    id v62 = [v173 countByEnumeratingWithState:&v228 objects:v266 count:16];
    if (v62)
    {
      id obja = *(id *)v229;
      do
      {
        for (k = 0; k != v62; k = (char *)k + 1)
        {
          if (*(id *)v229 != obja) {
            objc_enumerationMutation(v173);
          }
          uint64_t v64 = *(void *)(*((void *)&v228 + 1) + 8 * (void)k);
          v65 = [(SAVolumeScanner *)self dirKeyCacheList];
          v66 = [v65 objectForKeyedSubscript:v64];

          v67 = [(SAVolumeScanner *)self pathList];
          v68 = [(SAVolumeScanner *)self appSizerResults];
          v69 = [v68 appSizeBreakdownList];
          v226[0] = _NSConcreteStackBlock;
          v226[1] = 3221225472;
          v226[2] = sub_10001A990;
          v226[3] = &unk_10004CDC0;
          v226[4] = v64;
          v226[5] = self;
          v226[6] = v253;
          v226[7] = &v232;
          char v227 = (unsigned __int16)(v178 & 0x100) >> 8;
          +[SACloneTreeWalker processCloneMapOnVol:v64 pathList:v67 appSizeBreakdownList:v69 dirKeyCache:v66 collectClonesPaths:(v178 & 0x100) != 0 reply:v226];
        }
        id v62 = [v173 countByEnumeratingWithState:&v228 objects:v266 count:16];
      }
      while (v62);
    }

    v70 = SALog();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v71 = v233[3];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v71;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "CloneTreeWalker: totalClonesSize = %llu", buf, 0xCu);
    }

    v72 = [(SAVolumeScanner *)self telemetryManager];
    [v72 stopTimeForTimeInfoEntry:8];

    v73 = SALog();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "START: App Sizer Get Purgeable Information", buf, 2u);
    }

    v74 = [(SAVolumeScanner *)self appSizerResults];
    v225[0] = _NSConcreteStackBlock;
    v225[1] = 3221225472;
    v225[2] = sub_10001AF28;
    v225[3] = &unk_10004CDE8;
    v225[4] = self;
    [v74 enumerateAppsDataUsingBlock:v225];

    v75 = [(SAVolumeScanner *)self appPathList];
    v76 = [v75 appPathList];
    v224[0] = _NSConcreteStackBlock;
    v224[1] = 3221225472;
    v224[2] = sub_10001B290;
    v224[3] = &unk_10004C840;
    v224[4] = self;
    [v76 enumerateKeysAndObjectsUsingBlock:v224];

    v77 = SALog();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "START: App Sizer Calculate System Volume Size", buf, 2u);
    }

    id objb = (id)objc_opt_new();
    objc_initWeak(&location, self);
    v221[0] = _NSConcreteStackBlock;
    v221[1] = 3221225472;
    v221[2] = sub_10001B59C;
    v221[3] = &unk_10004CE38;
    objc_copyWeak(&v222, &location);
    [objb computeSizeOfSystemVolume:v221];
    v78 = SALog();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "START: App Sizer Calculate Data And User Volumes Size:", buf, 2u);
    }

    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v269 = sub_10001460C;
    *(void *)v270 = sub_10001461C;
    *(void *)&v270[8] = 0;
    uint64_t v215 = 0;
    v216 = &v215;
    uint64_t v217 = 0x3032000000;
    v218 = sub_10001460C;
    v219 = sub_10001461C;
    id v220 = 0;
    uint64_t v209 = 0;
    v210 = &v209;
    uint64_t v211 = 0x3032000000;
    v212 = sub_10001460C;
    v213 = sub_10001461C;
    id v214 = 0;
    v207[0] = 0;
    v207[1] = v207;
    v207[2] = 0x3032000000;
    v207[3] = sub_10001460C;
    v207[4] = sub_10001461C;
    id v208 = 0;
    uint64_t v203 = 0;
    v204 = &v203;
    uint64_t v205 = 0x2020000000;
    char v206 = 1;
    v79 = objc_opt_new();
    [v79 enter];
    v80 = +[NSURL fileURLWithPath:@"/private/var/mobile"];
    v197[0] = _NSConcreteStackBlock;
    v197[1] = 3221225472;
    v197[2] = sub_10001B77C;
    v197[3] = &unk_10004CE60;
    v199 = &v209;
    v197[4] = self;
    v200 = v207;
    v201 = &v215;
    v202 = &v203;
    id v174 = v79;
    id v198 = v174;
    [objb getPurgeableInfo:v80 options:1 reply:v197];

    objc_msgSend(v174, "wait:", dispatch_time(0, 60000000000));
    if (*((unsigned char *)v204 + 24))
    {
      uint64_t v81 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:60 userInfo:0];
      v82 = (void *)v216[5];
      v216[5] = v81;
    }
    if (v216[5])
    {
      v83 = SALog();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v84 = [(id)v216[5] description];
        sub_1000315A8(v84, (uint64_t)v265, v83);
      }
    }
    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    v85 = +[NSArray arrayWithObjects:@"/private/var/mobile", @"/private/var", 0];
    id v86 = [v85 countByEnumeratingWithState:&v193 objects:v264 count:16];
    if (v86)
    {
      uint64_t v87 = *(void *)v194;
      do
      {
        for (m = 0; m != v86; m = (char *)m + 1)
        {
          if (*(void *)v194 != v87) {
            objc_enumerationMutation(v85);
          }
          uint64_t v89 = *(void *)(*((void *)&v193 + 1) + 8 * (void)m);
          v90 = +[NSURL fileURLWithPath:v89];
          v192[0] = _NSConcreteStackBlock;
          v192[1] = 3221225472;
          v192[2] = sub_10001BD5C;
          v192[3] = &unk_10004CE88;
          v192[4] = self;
          v192[5] = v89;
          v192[6] = buf;
          [objb computeSizeOfVolumeAtURL:v90 options:1 completionHandler:v192];
        }
        id v86 = [v85 countByEnumeratingWithState:&v193 objects:v264 count:16];
      }
      while (v86);
    }

    -[SAVolumeScanner setDataVolumeSizeUsed:](self, "setDataVolumeSizeUsed:", (unsigned char *)-[SAVolumeScanner dataVolumeSizeUsed](self, "dataVolumeSizeUsed")- (unsigned char *)[(id)v210[5] longLongValue]);
    v91 = SALog();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v159 = [(SAVolumeScanner *)self dataVolumeSizeUsed];
      v160 = [(SAVolumeScanner *)self appSizerResults];
      id v161 = [v160 totalCDAvailable];
      *(_DWORD *)v258 = 134218496;
      double v259 = 0.0;
      __int16 v260 = 2048;
      unint64_t v261 = v159;
      __int16 v262 = 2048;
      id v263 = v161;
      _os_log_debug_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, "data volume sizes: dataVolumeSizeCapacity %llu, dataVolumeSizeUsed %llu, totalCDAvailable %llu", v258, 0x20u);
    }
    v191[0] = _NSConcreteStackBlock;
    v191[1] = 3221225472;
    v191[2] = sub_10001BE08;
    v191[3] = &unk_10004CEB0;
    v191[4] = self;
    +[SAUtilities getFileSize:@"/private/var/.overprovisioning_file" reply:v191];
    [(SAVolumeScanner *)self setSoftwareUpdateVolumeUsedSpace:[(SAVolumeScanner *)self addSoftwareUpdateBundle]];
    if ((byte_10005AAC0 & 1) == 0)
    {
      v92 = SALog();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v258 = 0;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "START: postProcessFiltering", v258, 2u);
      }

      v93 = [(SAVolumeScanner *)self appSizerResults];
      v94 = [(SAVolumeScanner *)self appPathList];
      -[SAVolumeScanner setTotalHiddenAppSize:](self, "setTotalHiddenAppSize:", [v93 postProcessFilteringWithAppPathList:v94]);
    }
    v95 = SALog();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v258 = 0;
      _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "START: Add vendor-name", v258, 2u);
    }

    v96 = [(SAVolumeScanner *)self appSizerResults];
    v190[0] = _NSConcreteStackBlock;
    v190[1] = 3221225472;
    v190[2] = sub_10001BEA4;
    v190[3] = &unk_10004CDE8;
    v190[4] = self;
    [v96 enumerateAppsDataUsingBlock:v190];

    if ((byte_10005AAC0 & 1) == 0)
    {
      v97 = SALog();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v258 = 0;
        _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "START: postProcessMerging", v258, 2u);
      }

      v98 = [(SAVolumeScanner *)self appSizerResults];
      [v98 postProcessMerging];

      v99 = SALog();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v258 = 0;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "START: zeroSizeAppsFiltering", v258, 2u);
      }

      v100 = [(SAVolumeScanner *)self appSizerResults];
      [v100 zeroSizeAppsFiltering];
    }
    v101 = SALog();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v258 = 0;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "START: billLLMsToSystemOn", v258, 2u);
    }

    v102 = [(SAVolumeScanner *)self appSizerResults];
    v103 = [(SAVolumeScanner *)self telemetryManager];
    +[SALLMList billLLMsToSystemOn:v102 andTelemetry:v103];

    v104 = [(SAVolumeScanner *)self appSizerResults];
    v105 = [v104 appsDataInternal];
    v106 = [v105 objectForKeyedSubscript:@"com.apple.fakeapp.System"];

    if (v106)
    {
      -[SAVolumeScanner setSystemVolumeUsedSpace:](self, "setSystemVolumeUsedSpace:", [v106 dataSize]);
    }
    else
    {
      v107 = SALog();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
        sub_100031564(v107);
      }
    }
    v108 = [(SAVolumeScanner *)self telemetryManager];
    objc_msgSend(v108, "addValue:forTotalsInfoEntry:", -[SAVolumeScanner systemVolumeUsedSpace](self, "systemVolumeUsedSpace"), 17);

    [(SAVolumeScanner *)self checkForSizesOverflow];
    [(SAVolumeScanner *)self calculateDiskUsedAndCapacity];
    [(SAVolumeScanner *)self calculateSystemDataSize];
    v109 = [(SAVolumeScanner *)self appSizerResults];
    [v109 updateTimestamp];

    __int16 v110 = v178;
    if ((v178 & 2) != 0)
    {
      v111 = SALog();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v258 = 0;
        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Calling Handlers with intermittent results", v258, 2u);
      }

      v112 = [(SAVolumeScanner *)self appSizerResults];
      [v112 populateAppsData];

      v113 = [(SAVolumeScanner *)self appSizerResults];
      +[SACallbackManager callAppSizeHandlersWithResults:v113 error:0];

      __int16 v110 = v178;
    }
    if ((v110 & 0x80) != 0)
    {
      v114 = +[SASupport getFSPurgeableDataOnVolumes:&off_10004FCB8];
      v115 = [(SAVolumeScanner *)self appSizerResults];
      [v115 setFSPurgeableData:v114];

      __int16 v110 = v178;
    }
    if ((v110 & 4) != 0)
    {
      v116 = [(SAVolumeScanner *)self appSizerResults];
      [v116 print];

      __int16 v110 = v178;
    }
    if ((v110 & 0x4000) != 0)
    {
      v117 = [(SAVolumeScanner *)self purgeableRecords];
      LODWORD(v13) = [v117 waitForProcessingSUPurgeableUrgencyFiles];

      if (v13)
      {
        [v166 resetState:a4];
LABEL_156:

        _Block_object_dispose(&v203, 8);
        _Block_object_dispose(v207, 8);

        _Block_object_dispose(&v209, 8);
        _Block_object_dispose(&v215, 8);

        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v222);
        objc_destroyWeak(&location);

        _Block_object_dispose(&v232, 8);
LABEL_157:

LABEL_158:
        unint64_t v14 = v172;
        goto LABEL_159;
      }
      v118 = SALog();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v258 = 0;
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "End: App Sizer SU Purgeable Processing", v258, 2u);
      }

      [(SAVolumeScanner *)self updateAppSizerResultsWithSUPurgeableUrgencySizes];
      [(SAVolumeScanner *)self checkForSizesOverflow];
      [(SAVolumeScanner *)self calculateSystemDataSize];
    }
    if ((v178 & 8) != 0)
    {
      v119 = [(SAVolumeScanner *)self telemetryManager];
      v120 = [v119 dictionaryDescription];
      v121 = [(SAVolumeScanner *)self appSizerResults];
      [v121 setReportedTelemetry:v120];
    }
    v122 = [(SAVolumeScanner *)self appSizerResults];
    v123 = [v122 appSizeBreakdownList];

    if (v123)
    {
      v124 = [(SAVolumeScanner *)self appSizerResults];
      v125 = [v124 appSizeBreakdownList];
      v126 = [v125 generateDictionary];
      v127 = [(SAVolumeScanner *)self appSizerResults];
      [v127 setAppsInfo:v126];
    }
    v128 = [(SAVolumeScanner *)self appSizerResults];
    [v128 populateAppsData];

    v129 = [(SAVolumeScanner *)self appSizerResults];
    [v129 setStatus:0];

    [v166 resetState:a4];
    if (v178)
    {
      v130 = SALog();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v258 = 0;
        _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "START: App Sizer Calling Handlers", v258, 2u);
      }

      v131 = [(SAVolumeScanner *)self appSizerResults];
      +[SACallbackManager callAppSizeHandlersWithResults:v131 error:0];
    }
    v132 = SALog();
    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v258 = 0;
      _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "END: App Sizer", v258, 2u);
    }

    v133 = [(SAVolumeScanner *)self telemetryManager];
    [v133 stopTimeForTimeInfoEntry:6];

    v134 = [(SAVolumeScanner *)self telemetryManager];
    v135 = [(SAVolumeScanner *)self appPathList];
    [v134 updateSAFOptionWithPathsList:v135];

    __int16 v136 = v178;
    if ((v178 & 0x200) != 0)
    {
      if (os_variant_has_internal_ui()
        && +[SATelemetryManager shouldSendTelemetry:v171 != 0])
      {
        [(SAVolumeScanner *)self processPurgeableAttributionTags];
      }
      v137 = [(SAVolumeScanner *)self telemetryManager];
      [v137 sendTelemetry:v171 != 0];

      __int16 v136 = v178;
    }
    if ((v136 & 0x800) != 0)
    {
      v138 = SALog();
      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v258 = 0;
        _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "START: Speculative Download Analytics", v258, 2u);
      }

      long long v188 = 0u;
      long long v189 = 0u;
      long long v186 = 0u;
      long long v187 = 0u;
      id v139 = [&off_10004FCD0 countByEnumeratingWithState:&v186 objects:v257 count:16];
      if (v139)
      {
        uint64_t v140 = *(void *)v187;
        while (2)
        {
          for (n = 0; n != v139; n = (char *)n + 1)
          {
            if (*(void *)v187 != v140) {
              objc_enumerationMutation(&off_10004FCD0);
            }
            uint64_t v142 = *(void *)(*((void *)&v186 + 1) + 8 * (void)n);
            LODWORD(v13) = [v166 shouldDefer:a4 activity:v171];
            if (v13)
            {
              [v166 resetState:a4];
              v155 = SALog();
              if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v258 = 0;
                _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEFAULT, "App Sizer Deferred before SDA", v258, 2u);
              }
              goto LABEL_155;
            }
            v143 = [(SAVolumeScanner *)self dirKeyCacheList];
            v144 = [v143 objectForKeyedSubscript:v142];

            v145 = objc_opt_new();
            [v145 setOptions:1];
            v146 = [(SAVolumeScanner *)self pathList];
            [v145 analyzeVolPath:v142 pathList:v146 dirKeyCache:v144 appSizerResults:self->_appSizerResults];
          }
          id v139 = [&off_10004FCD0 countByEnumeratingWithState:&v186 objects:v257 count:16];
          if (v139) {
            continue;
          }
          break;
        }
      }
      v147 = SALog();
      if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v258 = 0;
        _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "END: Speculative Download Analytics", v258, 2u);
      }

      __int16 v136 = v178;
    }
    if ((v136 & 0x1000) != 0)
    {
      int v148 = +[SACallbackManager handlersCount];
      LOBYTE(v13) = 5;
      if (a4 == 2 && v148 >= 1)
      {
        [(NSDate *)self->_startTime timeIntervalSinceNow];
        double v150 = v149;
        v151 = SALog();
        double v152 = -v150;
        if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v258 = 134218240;
          double v259 = v152;
          __int16 v260 = 1024;
          LODWORD(v261) = dword_10005A8E0;
          _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_DEFAULT, "App Sizer timeSinceStart is %f, timeout is %u", v258, 0x12u);
        }

        LODWORD(v153) = dword_10005A8E0;
        if (v152 <= (double)v153)
        {
          uint64_t v13 = +[SACallbackManager activeHandlers];
          atomic_fetch_add(&dword_10005AAC4, 1u);
          dispatch_time_t v156 = dispatch_time(0, 60000000000);
          rerunQue = self->_rerunQue;
          v180[0] = _NSConcreteStackBlock;
          v180[1] = 3221225472;
          v180[2] = sub_10001BF80;
          v180[3] = &unk_10004CED8;
          v155 = v13;
          v181 = v155;
          v182 = self;
          int v185 = a3;
          id v183 = v171;
          unint64_t v184 = v178;
          dispatch_after(v156, rerunQue, v180);

          LOBYTE(v13) = 5;
        }
        else
        {
          NSErrorUserInfoKey v255 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v256 = @"SAF Exhaustion";
          v154 = +[NSDictionary dictionaryWithObjects:&v256 forKeys:&v255 count:1];
          v155 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4610 userInfo:v154];

          +[SACallbackManager callAppSizeHandlersWithResults:0 error:v155];
          LOBYTE(v13) = 3;
        }
LABEL_155:
      }
    }
    else
    {
      LOBYTE(v13) = 5;
    }
    goto LABEL_156;
  }
  unint64_t v14 = 0;
LABEL_159:

  _Block_object_dispose(&v249, 8);
  _Block_object_dispose(v253, 8);

  return v13;
}

- (unint64_t)analyzeFile:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6
{
  uint64_t v7 = +[SATraverse getFileSize:](SATraverse, "getFileSize:", a3, a4, a5, a6);
  id v8 = [v7 dataSize];
  uint64_t v9 = 48;
  if (!self->_knownApp) {
    uint64_t v9 = 40;
  }
  *(Class *)((char *)&self->super.isa + v9) = (Class)(*(char **)((char *)&self->super.isa + v9) + (unint64_t)v8);

  return 0;
}

- (unint64_t)analyzeDirEntry:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6
{
  if (self->_knownApp)
  {
    ++self->_childrenInsideKnown;
  }
  else
  {
    id v8 = a4;
    uint64_t v9 = +[NSURL fileURLWithPath:a3 isDirectory:1];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001C1CC;
    v11[3] = &unk_10004CF00;
    v11[4] = self;
    [v8 getAppsSetForURL:v9 completionHandler:v11];
  }
  return 0;
}

- (unint64_t)analyzeDirExit:(id)a3 forPathList:(id)a4 andResults:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_knownApp)
  {
    unint64_t v14 = self->_childrenInsideKnown - 1;
    self->_childrenInsideKnown = v14;
    if (!v14)
    {
      self->_knownApp = 0;
      unint64_t knownAppByteCount = self->_knownAppByteCount;
      if (knownAppByteCount) {
        [v12 updateAppSet:self->_knownAppName fixedSize:0 dataSize:knownAppByteCount cloneSize:0 purgeableSize:0 FSPurgeableSize:0 physicalSize:0 appCacheSize:0 CDPluginSize:0];
      }
      if ((self->_scanOptions & 2) != 0)
      {
        [v12 updateTimestamp];
        +[SACallbackManager callAppSizeHandlersWithResults:v12 error:0];
      }
    }
  }

  return 0;
}

- (void)setAppSizerMaxRerunTimeout:(unsigned int)a3
{
  dword_10005A8E0 = a3;
}

+ (void)setAppSizerResultsFilteringToDefault
{
  byte_10005AAC0 = 0;
}

+ (void)disableAppSizerResultsFiltering
{
  byte_10005AAC0 = 1;
}

+ (void)setForceTelemetry
{
  unint64_t v2 = SALog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "+[SAVolumeScanner setForceTelemetry]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: set to TRUE", (uint8_t *)&v3, 0xCu);
  }

  byte_10005AAC8 = 1;
}

+ (BOOL)shouldForceTelemetry
{
  int v2 = byte_10005AAC8;
  byte_10005AAC8 = 0;
  if (v2 == 1)
  {
    int v3 = SALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "+[SAVolumeScanner shouldForceTelemetry]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: forceTelemetry", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2;
}

- (unint64_t)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(unint64_t)a3
{
  self->_scanOptions = a3;
}

- (SAAppSizerResults)appSizerResults
{
  return (SAAppSizerResults *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppSizerResults:(id)a3
{
}

- (SATelemetryManager)telemetryManager
{
  return (SATelemetryManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTelemetryManager:(id)a3
{
}

- (BOOL)extendedDirStatsEnabled
{
  return self->_extendedDirStatsEnabled;
}

- (void)setExtendedDirStatsEnabled:(BOOL)a3
{
  self->_extendedDirStatsEnabled = a3;
}

- (BOOL)appSizerInProgress
{
  return self->_appSizerInProgress;
}

- (void)setAppSizerInProgress:(BOOL)a3
{
  self->_appSizerInProgress = a3;
}

- (unint64_t)othersByteCount
{
  return self->_othersByteCount;
}

- (void)setOthersByteCount:(unint64_t)a3
{
  self->_othersByteCount = a3;
}

- (BOOL)knownApp
{
  return self->_knownApp;
}

- (void)setKnownApp:(BOOL)a3
{
  self->_knownApp = a3;
}

- (unint64_t)knownAppByteCount
{
  return self->_knownAppByteCount;
}

- (void)setKnownAppByteCount:(unint64_t)a3
{
  self->_unint64_t knownAppByteCount = a3;
}

- (unint64_t)childrenInsideKnown
{
  return self->_childrenInsideKnown;
}

- (void)setChildrenInsideKnown:(unint64_t)a3
{
  self->_childrenInsideKnown = a3;
}

- (NSSet)knownAppName
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setKnownAppName:(id)a3
{
}

- (NSFileManager)fileManager
{
  return (NSFileManager *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFileManager:(id)a3
{
}

- (OS_dispatch_queue)rerunQue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRerunQue:(id)a3
{
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStartTime:(id)a3
{
}

- (NSMutableDictionary)tagMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTagMap:(id)a3
{
}

- (unint64_t)totalVisibleAppSize
{
  return self->_totalVisibleAppSize;
}

- (void)setTotalVisibleAppSize:(unint64_t)a3
{
  self->_totalVisibleAppSize = a3;
}

- (unint64_t)totalHiddenAppSize
{
  return self->_totalHiddenAppSize;
}

- (void)setTotalHiddenAppSize:(unint64_t)a3
{
  self->_totalHiddenAppSize = a3;
}

- (unint64_t)totalPurgeableDataSize
{
  return self->_totalPurgeableDataSize;
}

- (void)setTotalPurgeableDataSize:(unint64_t)a3
{
  self->_totalPurgeableDataSize = a3;
}

- (unint64_t)dataVolumeSizeUsed
{
  return self->_dataVolumeSizeUsed;
}

- (void)setDataVolumeSizeUsed:(unint64_t)a3
{
  self->_dataVolumeSizeUsed = a3;
}

- (unint64_t)softwareUpdateVolumeUsedSpace
{
  return self->_softwareUpdateVolumeUsedSpace;
}

- (void)setSoftwareUpdateVolumeUsedSpace:(unint64_t)a3
{
  self->_softwareUpdateVolumeUsedSpace = a3;
}

- (unint64_t)systemVolumeUsedSpace
{
  return self->_systemVolumeUsedSpace;
}

- (void)setSystemVolumeUsedSpace:(unint64_t)a3
{
  self->_systemVolumeUsedSpace = a3;
}

- (SAAppPathList)appPathList
{
  return (SAAppPathList *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAppPathList:(id)a3
{
}

- (NSMutableDictionary)dirKeyCacheList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDirKeyCacheList:(id)a3
{
}

- (SAPathList)pathList
{
  return (SAPathList *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPathList:(id)a3
{
}

- (SAPurgeableRecords)purgeableRecords
{
  return (SAPurgeableRecords *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPurgeableRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeableRecords, 0);
  objc_storeStrong((id *)&self->_pathList, 0);
  objc_storeStrong((id *)&self->_dirKeyCacheList, 0);
  objc_storeStrong((id *)&self->_appPathList, 0);
  objc_storeStrong((id *)&self->_tagMap, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_rerunQue, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_knownAppName, 0);
  objc_storeStrong((id *)&self->_telemetryManager, 0);
  objc_storeStrong((id *)&self->_appSizerResults, 0);
}

@end