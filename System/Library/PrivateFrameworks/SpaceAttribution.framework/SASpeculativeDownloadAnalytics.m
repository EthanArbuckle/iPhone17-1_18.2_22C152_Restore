@interface SASpeculativeDownloadAnalytics
+ (BOOL)isBundleIdInHierarchy:(id)a3;
+ (BOOL)shouldSendTelemetry;
+ (id)SDTelResidencyKeysTranslationTable;
+ (id)SDTelStateKeysTranslationTable;
+ (id)SDTelUrgencyKeysTranslationTable;
+ (id)SDTelVolumeKeysTranslationTable;
+ (id)getLastSentTelemetryDate;
+ (void)sendTelemetry:(id)a3 withHistogramMatrix:(id)a4;
+ (void)updateLastSentTelemetryDate;
- (NSString)SdaStateFilePath;
- (unint64_t)Options;
- (void)analyzeVolPath:(id)a3 pathList:(id)a4 dirKeyCache:(id)a5 appSizerResults:(id)a6;
- (void)setOptions:(unint64_t)a3;
- (void)setSdaStateFilePath:(id)a3;
@end

@implementation SASpeculativeDownloadAnalytics

+ (BOOL)isBundleIdInHierarchy:(id)a3
{
  id v3 = a3;
  if (qword_10005AB08 != -1) {
    dispatch_once(&qword_10005AB08, &stru_10004D0D0);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)qword_10005AB00;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "hasPrefix:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v5;
}

- (void)analyzeVolPath:(id)a3 pathList:(id)a4 dirKeyCache:(id)a5 appSizerResults:(id)a6
{
  id v10 = a3;
  id v42 = a4;
  id v11 = a5;
  id v41 = a6;
  long long v12 = SALog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Start SDA for %@", buf, 0xCu);
  }

  id v13 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
  v14 = +[SDAState loadFromFileAtPath:self->_SdaStateFilePath];
  v15 = [v14 lastEventIdPerVol];
  v16 = [v15 objectForKey:v10];

  if (v16)
  {
    FSEventStreamEventId sinceWhen = (FSEventStreamEventId)[v16 unsignedLongLongValue];
    v40 = objc_opt_new();
    memset(&__src, 0, 512);
    id v17 = v10;
    if (statfs((const char *)[v17 UTF8String], &__src))
    {
      int v18 = *__error();
      v19 = SALog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100032538(v18, v19);
      }
    }
    else
    {
      dev_t deviceToWatch = __src.f_fsid.val[0];
      __int16 v49 = 0;
      if (fsctl(__src.f_mntonname, 0x40024A6CuLL, &v49, 1u))
      {
        int v23 = *__error();
        v24 = SALog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100032494(v23, v24);
        }
      }
      else
      {
        switch(v49)
        {
          case 2:
            int v25 = 1;
            break;
          case 64:
            int v25 = 2;
            break;
          case 576:
            int v25 = 3;
            break;
          default:
            int v25 = 0;
            break;
        }
        *(_OWORD *)buf = 0u;
        memset(v52, 0, 496);
        id v36 = v40;
        *(void *)buf = v36;
        *(void *)&buf[8] = &sinceWhen;
        memcpy(v52, &__src, sizeof(v52));
        int v53 = v25;
        id v54 = v11;
        id v55 = v42;
        id v35 = v13;
        id v56 = v35;
        char v57 = 0;
        context.version = 0;
        memset(&context.retain, 0, 24);
        context.info = buf;
        values = @"/.activity";
        CFArrayRef pathsToWatchRelativeToDevice = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
        FSEventStreamEventId CurrentEventId = FSEventsGetCurrentEventId();
        FSEventStreamEventId v27 = sinceWhen;
        if (sinceWhen >= CurrentEventId) {
          FSEventStreamEventId v27 = CurrentEventId;
        }
        FSEventStreamEventId sinceWhen = v27;
        v28 = SALog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_100032454();
        }

        v29 = FSEventStreamCreateRelativeToDevice(kCFAllocatorDefault, (FSEventStreamCallback)sub_10001FEE0, &context, deviceToWatch, pathsToWatchRelativeToDevice, sinceWhen, 0.0, 0x10u);
        deviceToWatcha = dispatch_queue_create("fse que", 0);
        FSEventStreamSetDispatchQueue(v29, deviceToWatcha);
        if (FSEventStreamStart(v29))
        {
          [v35 lockWhenCondition:1];
          FSEventStreamStop(v29);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100020E68;
          block[3] = &unk_10004D0F8;
          v46 = v29;
          v30 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
          v45 = v30;
          dispatch_async(deviceToWatcha, block);
          [v30 lockWhenCondition:1];
          CFRelease(pathsToWatchRelativeToDevice);
          CFRelease(values);
          v31 = SALog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            sub_1000323C8((uint64_t *)&sinceWhen, (uint64_t)v17, v31);
          }

          FSEventStreamEventId v32 = sinceWhen;
          v33 = +[NSDate date];
          [v14 updateEventId:v32 andDate:v33 forVolPath:v17];

          if (self->_Options) {
            [v36 print];
          }
          v34 = SALog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v43 = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "SDA: Send telemetry", v43, 2u);
          }

          +[SASpeculativeDownloadAnalytics sendTelemetry:v41 withHistogramMatrix:v36];
        }
        else
        {
          v30 = SALog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_100032360();
          }
        }

        sub_100020EF0((uint64_t)buf);
      }
    }
  }
  else
  {
    v20 = SALog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Initial run. Set initial lastEventId and abort.", buf, 2u);
    }

    FSEventStreamEventId v21 = FSEventsGetCurrentEventId();
    v22 = +[NSDate date];
    [v14 updateEventId:v21 andDate:v22 forVolPath:v10];
  }
}

+ (void)sendTelemetry:(id)a3 withHistogramMatrix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = +[SASpeculativeDownloadAnalytics SDTelVolumeKeysTranslationTable];
  long long v9 = +[SASpeculativeDownloadAnalytics SDTelStateKeysTranslationTable];
  id v10 = +[SASpeculativeDownloadAnalytics SDTelUrgencyKeysTranslationTable];
  +[SASpeculativeDownloadAnalytics SDTelResidencyKeysTranslationTable];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000210B8;
  v17[3] = &unk_10004D148;
  id v18 = v7;
  id v19 = v5;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v23;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v5;
  id v16 = v7;
  [v6 enumerateBundleHistogram:v17];
}

+ (id)SDTelVolumeKeysTranslationTable
{
  if (qword_10005AB18 != -1) {
    dispatch_once(&qword_10005AB18, &stru_10004D168);
  }
  v2 = (void *)qword_10005AB10;
  return v2;
}

+ (id)SDTelStateKeysTranslationTable
{
  if (qword_10005AB28 != -1) {
    dispatch_once(&qword_10005AB28, &stru_10004D188);
  }
  v2 = (void *)qword_10005AB20;
  return v2;
}

+ (id)SDTelUrgencyKeysTranslationTable
{
  if (qword_10005AB38 != -1) {
    dispatch_once(&qword_10005AB38, &stru_10004D1A8);
  }
  v2 = (void *)qword_10005AB30;
  return v2;
}

+ (id)SDTelResidencyKeysTranslationTable
{
  if (qword_10005AB48 != -1) {
    dispatch_once(&qword_10005AB48, &stru_10004D1C8);
  }
  v2 = (void *)qword_10005AB40;
  return v2;
}

+ (void)updateLastSentTelemetryDate
{
  id v2 = +[NSDate date];
  +[SARunTimeDataManager setRunTimeDataObject:v2 forKey:@"lastSpeculativeDownloadSentTelemetryDate"];
}

+ (id)getLastSentTelemetryDate
{
  return +[SARunTimeDataManager runTimeDataObjectForKey:@"lastSpeculativeDownloadSentTelemetryDate"];
}

+ (BOOL)shouldSendTelemetry
{
  id v2 = +[SASpeculativeDownloadAnalytics getLastSentTelemetryDate];
  if (v2)
  {
    id v3 = +[NSDate date];
    [v3 timeIntervalSinceDate:v2];
    BOOL v5 = v4 >= 86400.0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (NSString)SdaStateFilePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSdaStateFilePath:(id)a3
{
}

- (unint64_t)Options
{
  return self->_Options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_Options = a3;
}

- (void).cxx_destruct
{
}

@end