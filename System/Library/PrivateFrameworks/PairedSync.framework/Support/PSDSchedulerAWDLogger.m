@interface PSDSchedulerAWDLogger
+ (BOOL)supportsSecureCoding;
+ (id)defaultLogger;
- (OS_dispatch_queue)queue;
- (PSDSchedulerAWDLogger)init;
- (PSDSchedulerAWDLogger)initWithCoder:(id)a3;
- (PSDSchedulerAWDSessionState)sessionState;
- (id)AWDKeyForActivityIdentifier:(id)a3;
- (void)accumulateStatisticsForSegment:(id)a3;
- (void)bookmarkCurrentStatistics:(id)a3;
- (void)clearSessionState;
- (void)encodeWithCoder:(id)a3;
- (void)initialize;
- (void)logAWDDurationsForSync;
- (void)saveSessionState;
- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4;
- (void)scheduler:(id)a3 willStartSyncSession:(id)a4;
- (void)setQueue:(id)a3;
- (void)setSessionState:(id)a3;
@end

@implementation PSDSchedulerAWDLogger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultLogger
{
  if (qword_1000384A8 != -1) {
    dispatch_once(&qword_1000384A8, &stru_10002C950);
  }
  v2 = (void *)qword_1000384A0;

  return v2;
}

- (void)initialize
{
  v3 = objc_alloc_init(PSDSchedulerAWDSessionState);
  sessionState = self->_sessionState;
  self->_sessionState = v3;

  v5 = +[NSMutableDictionary dictionary];
  cumulativeStatisticsCollections = self->_cumulativeStatisticsCollections;
  self->_cumulativeStatisticsCollections = v5;

  v7 = +[NSMutableDictionary dictionary];
  segmentStartingStatisticsCollections = self->_segmentStartingStatisticsCollections;
  self->_segmentStartingStatisticsCollections = v7;

  v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.PairedSync.awdLoggingQueue", v11);
  queue = self->_queue;
  self->_queue = v9;
}

- (PSDSchedulerAWDLogger)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSDSchedulerAWDLogger;
  v2 = [(PSDSchedulerAWDLogger *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PSDSchedulerAWDLogger *)v2 initialize];
  }
  return v3;
}

- (PSDSchedulerAWDLogger)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PSDSchedulerAWDLogger;
  objc_super v5 = [(PSDSchedulerAWDLogger *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionState"];
    sessionState = v5->_sessionState;
    v5->_sessionState = (PSDSchedulerAWDSessionState *)v6;

    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    v8 = +[NSArray arrayWithObjects:v36 count:3];
    v9 = +[NSSet setWithArray:v8];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"cumulativeStatisticsCollections"];
    v11 = (NSMutableDictionary *)[v10 mutableCopy];
    cumulativeStatisticsCollections = v5->_cumulativeStatisticsCollections;
    v5->_cumulativeStatisticsCollections = v11;

    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v35[2] = objc_opt_class();
    v13 = +[NSArray arrayWithObjects:v35 count:3];
    v14 = +[NSSet setWithArray:v13];
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"segmentStartingStatisticsCollections"];
    v16 = (NSMutableDictionary *)[v15 mutableCopy];
    segmentStartingStatisticsCollections = v5->_segmentStartingStatisticsCollections;
    v5->_segmentStartingStatisticsCollections = v16;

    if (v5->_cumulativeStatisticsCollections && v5->_sessionState && v5->_segmentStartingStatisticsCollections)
    {
      v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v19 = dispatch_queue_create("com.apple.PairedSync.awdLoggingQueue", v18);
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v19;
    }
    else
    {
      v21 = psd_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (v22)
      {
        v23 = psd_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v26 = v5->_segmentStartingStatisticsCollections;
          v25 = v5->_sessionState;
          v27 = v5->_cumulativeStatisticsCollections;
          *(_DWORD *)buf = 134218496;
          v30 = v27;
          __int16 v31 = 2048;
          v32 = v25;
          __int16 v33 = 2048;
          v34 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed unarchiving PSDSchedulerAWDLogger %p %p %p", buf, 0x20u);
        }
      }
      [(PSDSchedulerAWDLogger *)v5 initialize];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionState = self->_sessionState;
  id v5 = a3;
  [v5 encodeObject:sessionState forKey:@"sessionState"];
  [v5 encodeObject:self->_cumulativeStatisticsCollections forKey:@"cumulativeStatisticsCollections"];
  [v5 encodeObject:self->_segmentStartingStatisticsCollections forKey:@"segmentStartingStatisticsCollections"];
}

- (void)scheduler:(id)a3 willStartSyncSession:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000081B0;
  v8[3] = &unk_10002C8B8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008328;
  v8[3] = &unk_10002C8B8;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)saveSessionState
{
  v3 = +[PSDFileManager defaultManager];
  id v4 = [v3 storageURL];
  id v5 = [v4 URLByAppendingPathComponent:@"AWDLogger.dat"];

  uint64_t v6 = [v5 path];
  LOBYTE(self) = +[NSKeyedArchiver secureArchiveRootObject:self toFile:v6];

  if ((self & 1) == 0)
  {
    id v7 = psd_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      id v9 = psd_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10001C478(v9);
      }
    }
  }
}

- (void)clearSessionState
{
  v3 = +[PSDFileManager defaultManager];
  id v4 = [v3 storageURL];
  id v5 = [v4 URLByAppendingPathComponent:@"AWDLogger.dat"];

  uint64_t v6 = +[NSFileManager defaultManager];
  id v12 = 0;
  unsigned __int8 v7 = [v6 removeItemAtURL:v5 error:&v12];
  id v8 = v12;

  if ((v7 & 1) == 0)
  {
    id v9 = psd_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      v11 = psd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10001C4BC(v8, v11);
      }
    }
  }
  [(PSDSchedulerAWDLogger *)self initialize];
}

- (void)logAWDDurationsForSync
{
  v2 = [(PSDSchedulerAWDLogger *)self sessionState];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v32 = [v3 pathForResource:@"activity-service" ofType:@"plist"];

  __int16 v31 = +[NSData dataWithContentsOfFile:v32];
  v30 = +[NSPropertyListSerialization propertyListWithData:v31 options:0 format:0 error:0];
  id v4 = [v30 objectForKeyedSubscript:@"activity-service"];
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = sub_10000909C;
  v70 = sub_1000090AC;
  id v71 = 0;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1000090B4;
  v61[3] = &unk_10002CA18;
  id v62 = v2;
  v65 = &v66;
  id v5 = v4;
  id v63 = v5;
  v64 = self;
  id v29 = v62;
  [v62 enumerateActivityNamesWithBlock:v61];
  uint64_t v6 = +[NSMutableSet set];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unsigned __int8 v7 = +[PSDIDSServiceStatisticsCollection knownChannelNames];
  id v8 = [v7 countByEnumeratingWithState:&v57 objects:v75 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v58;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v58 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [(NSMutableDictionary *)self->_cumulativeStatisticsCollections objectForKeyedSubscript:*(void *)(*((void *)&v57 + 1) + 8 * i)];
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_10000998C;
        v55[3] = &unk_10002CA40;
        id v56 = v6;
        [v11 enumerateServiceStatisticsWithBlock:v55];
      }
      id v8 = [v7 countByEnumeratingWithState:&v57 objects:v75 count:16];
    }
    while (v8);
  }

  v37 = +[NSMutableSet set];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v5;
  id v12 = [obj countByEnumeratingWithState:&v51 objects:v74 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v52;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v51 + 1) + 8 * (void)j)];
        if (v15) {
          [v37 addObjectsFromArray:v15];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v51 objects:v74 count:16];
    }
    while (v12);
  }

  [v6 minusSet:v37];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v33 = v6;
  id v35 = [v33 countByEnumeratingWithState:&v47 objects:v73 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v48;
    do
    {
      for (k = 0; k != v35; k = (char *)k + 1)
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(v33);
        }
        uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * (void)k);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v17 = +[PSDIDSServiceStatisticsCollection knownChannelNames];
        uint64_t v18 = 0;
        id v19 = [v17 countByEnumeratingWithState:&v43 objects:v72 count:16];
        if (v19)
        {
          uint64_t v40 = 0;
          id v41 = v17;
          uint64_t v39 = 0;
          uint64_t v20 = 0;
          uint64_t v21 = *(void *)v44;
          do
          {
            for (m = 0; m != v19; m = (char *)m + 1)
            {
              if (*(void *)v44 != v21) {
                objc_enumerationMutation(v41);
              }
              v23 = *(void **)(*((void *)&v43 + 1) + 8 * (void)m);
              v24 = [(NSMutableDictionary *)self->_cumulativeStatisticsCollections objectForKeyedSubscript:v23];
              v25 = [v24 statisticsForServiceName:v16];
              id v26 = [v25 deliveredMessageCount];
              if ([v23 isEqualToString:@"syncMessagesStats"])
              {
                v18 += (uint64_t)[v25 bytes];
              }
              else if ([v23 isEqualToString:@"defaultMessagesStats"])
              {
                v40 += (uint64_t)[v25 bytes];
              }
              else if ([v23 isEqualToString:@"urgentMessagesStats"])
              {
                v39 += (uint64_t)[v25 bytes];
              }

              v20 += (uint64_t)v26;
            }
            v17 = v41;
            id v19 = [v41 countByEnumeratingWithState:&v43 objects:v72 count:16];
          }
          while (v19);
        }
        else
        {
          LODWORD(v40) = 0;
          LODWORD(v39) = 0;
          uint64_t v20 = 0;
        }

        v27 = [@"service-" stringByAppendingString:v16];
        LOBYTE(v28) = 0;
        +[AWDPairedSyncSyncReport submitWithActivityName:syncDuration:timeoutCount:syncErrorCode:syncType:recordCount:syncByteCount:defaultByteCount:urgentByteCount:sawADropout:](AWDPairedSyncSyncReport, "submitWithActivityName:syncDuration:timeoutCount:syncErrorCode:syncType:recordCount:syncByteCount:defaultByteCount:urgentByteCount:sawADropout:", v27, 0, 0, [(id)v67[5] integerValue], v20, v18, 0.0, __PAIR64__(v39, v40), v28);
      }
      id v35 = [v33 countByEnumeratingWithState:&v47 objects:v73 count:16];
    }
    while (v35);
  }

  _Block_object_dispose(&v66, 8);
}

- (id)AWDKeyForActivityIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"pairedsync.%@", a3];
}

- (void)bookmarkCurrentStatistics:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = +[PSDIDSServiceStatisticsCollection knownChannelNames];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v4 objectForKeyedSubscript:v10];
        id v12 = +[PSDIDSServiceStatisticsCollection statisticsCollectionWithChannelName:v10 statisticsDictionary:v11];
        [(NSMutableDictionary *)self->_segmentStartingStatisticsCollections setObject:v12 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)accumulateStatisticsForSegment:(id)a3
{
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = +[PSDIDSServiceStatisticsCollection knownChannelNames];
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v17 = *(void *)v28;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v8 = [v4 objectForKeyedSubscript:v7];
        uint64_t v9 = +[PSDIDSServiceStatisticsCollection statisticsCollectionWithChannelName:v7 statisticsDictionary:v8];

        uint64_t v10 = [(NSMutableDictionary *)self->_segmentStartingStatisticsCollections objectForKeyedSubscript:v7];
        v11 = [(NSMutableDictionary *)self->_cumulativeStatisticsCollections objectForKeyedSubscript:v7];
        id v12 = +[PSDIDSServiceStatisticsCollection statisticsCollectionWithChannelName:v7 statisticsDictionary:0];
        uint64_t v23 = 0;
        v24 = &v23;
        uint64_t v25 = 0x2020000000;
        char v26 = 0;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100009E44;
        v18[3] = &unk_10002CA68;
        BOOL v22 = &v23;
        id v13 = v10;
        id v19 = v13;
        id v14 = v11;
        id v20 = v14;
        id v15 = v12;
        id v21 = v15;
        [v9 enumerateServiceStatisticsWithBlock:v18];
        if (*((unsigned char *)v24 + 24)) {
          [(PSDSchedulerAWDLogger *)self bookmarkCurrentStatistics:v4];
        }
        else {
          [(NSMutableDictionary *)self->_cumulativeStatisticsCollections setObject:v15 forKeyedSubscript:v7];
        }

        _Block_object_dispose(&v23, 8);
      }
      id v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }
}

- (PSDSchedulerAWDSessionState)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_segmentStartingStatisticsCollections, 0);

  objc_storeStrong((id *)&self->_cumulativeStatisticsCollections, 0);
}

@end