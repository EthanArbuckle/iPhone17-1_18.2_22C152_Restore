@interface SPApplicationMetadataUpdater
+ (id)metadataFilePath;
+ (id)metadataFilePathOld;
+ (id)metadataTokenPath;
+ (id)sharedInstance;
- (BOOL)incrementDataValues:(double *)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5 byProportion:(double)a6;
- (BOOL)migrateDataIfNecessaryFromOlderFormatFile:(id)a3 newFormatFile:(id)a4;
- (NSCalendar)calendar;
- (NSMutableDictionary)lookupDict;
- (SPApplicationMetadataUpdater)init;
- (id)appMetadata;
- (id)computeAppLaunchesFromTime:(double)a3 toTime:(double)a4 yesterday:(double)a5;
- (void)setCalendar:(id)a3;
- (void)setLookupDict:(id)a3;
- (void)update;
- (void)updateApplicationMetadataWithFilePath:(id)a3 currentDate:(id)a4 legacyPath:(id)a5;
- (void)updateMetadata:(_app_metadata *)a3 lastUpdatedTime:(double)a4 nowTime:(double)a5;
- (void)updateWithCompletionHandler:(id)a3 clean:(BOOL)a4 activity:(id)a5;
@end

@implementation SPApplicationMetadataUpdater

+ (id)sharedInstance
{
  if (qword_1000A8E80 != -1) {
    dispatch_once(&qword_1000A8E80, &stru_100092E60);
  }
  v2 = (void *)qword_1000A8E78;

  return v2;
}

+ (id)metadataFilePathOld
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"/Library/Spotlight/applications.plist"];

  return v3;
}

+ (id)metadataFilePath
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"/Library/Spotlight/applications.mdplist"];

  return v3;
}

+ (id)metadataTokenPath
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"/Library/Spotlight/applications_processing"];

  return v3;
}

- (SPApplicationMetadataUpdater)init
{
  v8.receiver = self;
  v8.super_class = (Class)SPApplicationMetadataUpdater;
  v2 = [(SPApplicationMetadataUpdater *)&v8 init];
  if (v2)
  {
    v3 = +[NSCalendar currentCalendar];
    [(SPApplicationMetadataUpdater *)v2 setCalendar:v3];

    v4 = objc_opt_new();
    [(SPApplicationMetadataUpdater *)v2 setLookupDict:v4];
  }
  v5 = SPLogForSPLogCategoryDefault();
  os_log_type_t v6 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "com.apple.searchd.updateRanking";
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Registering XPC activity:%s", buf, 0xCu);
  }

  xpc_activity_register("com.apple.searchd.updateRanking", XPC_ACTIVITY_CHECK_IN, &stru_100092EA0);
  return v2;
}

- (void)update
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(id)objc_opt_class() metadataTokenPath];
  v4 = [(id)objc_opt_class() metadataFilePathOld];
  v5 = [(id)objc_opt_class() metadataFilePath];
  id v6 = v3;
  int v7 = open((const char *)[v6 UTF8String], 1, 384);
  if (v7 == -1)
  {
    id v16 = v6;
    int v17 = open((const char *)[v16 UTF8String], 513, 384);
    if (v17 == -1)
    {
      v19 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100065078(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    else
    {
      v18 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
      [(SPApplicationMetadataUpdater *)v2 updateApplicationMetadataWithFilePath:v5 currentDate:v18 legacyPath:v4];

      close(v17);
      unlink((const char *)[v16 UTF8String]);
    }
  }
  else
  {
    objc_super v8 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000650B0(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    unlink((const char *)[v4 UTF8String]);
    unlink((const char *)[v5 UTF8String]);
    unlink((const char *)[v6 UTF8String]);
    close(v7);
  }

  objc_sync_exit(v2);
}

- (void)updateWithCompletionHandler:(id)a3 clean:(BOOL)a4 activity:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(SPApplicationMetadataUpdater *)self update];
  uint64_t v10 = dispatch_group_create();
  uint64_t v11 = +[SPApplicationIndexer sharedIndexer];
  [v11 updateApplications:v10 appBundleArray:0 clean:v6 activity:v9];

  uint64_t v12 = +[SPCoreSpotlightContactsUpdater sharedInstance];
  [v12 updateContactCounts:v10];

  uint64_t v13 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000280AC;
  block[3] = &unk_100092EC8;
  id v16 = v8;
  id v14 = v8;
  dispatch_group_notify(v10, v13, block);
}

- (BOOL)migrateDataIfNecessaryFromOlderFormatFile:(id)a3 newFormatFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = +[NSFileManager defaultManager];
  if (![v7 fileExistsAtPath:v5])
  {
LABEL_5:
    LOBYTE(v8) = 1;
    goto LABEL_15;
  }
  if ([v7 fileExistsAtPath:v6])
  {
    if ([v7 fileExistsAtPath:v5]) {
      [v7 removeItemAtPath:v5 error:0];
    }
    goto LABEL_5;
  }
  id v9 = [v7 attributesOfItemAtPath:v5 error:0];
  id v10 = [v9 fileSize];

  if ((unint64_t)v10 <= 0x12) {
    size_t v11 = 18;
  }
  else {
    size_t v11 = (size_t)v10;
  }
  uint64_t v12 = (char *)malloc_type_calloc(1uLL, v11, 0x8334797AuLL);
  uint64_t v13 = +[NSDictionary dictionaryWithContentsOfFile:v5];
  strcpy(v12 + 8, "10.4.1");
  id v14 = [v13 objectForKeyedSubscript:@"lastUpdated"];
  [v14 timeIntervalSinceReferenceDate];
  *(void *)uint64_t v12 = v15;

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002833C;
  v19[3] = &unk_100092EF0;
  v19[4] = &v24;
  v19[5] = &v20;
  v19[6] = v12 + 18;
  v19[7] = v11;
  [v13 enumerateKeysAndObjectsUsingBlock:v19];
  if (*((unsigned char *)v21 + 24))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    id v16 = objc_alloc((Class)NSData);
    id v17 = [v16 initWithBytesNoCopy:v12 length:v25[3] + 18 freeWhenDone:1];
    unsigned int v8 = [v17 writeToFile:v6 atomically:1];
    if (v8) {
      [v7 removeItemAtPath:v5 error:0];
    }
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

LABEL_15:
  return v8;
}

- (id)appMetadata
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = +[NSFileManager defaultManager];
  v4 = [(id)objc_opt_class() metadataFilePath];
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = objc_alloc((Class)NSData);
    int v7 = [(id)objc_opt_class() metadataFilePath];
    id v8 = [v6 initWithContentsOfFile:v7];

    v43 = v8;
    if ((unint64_t)[v8 length] >= 0x12)
    {
      v45 = objc_opt_new();
      id v44 = v8;
      id v10 = (const char *)[v44 bytes];
      if (!strcmp(v10 + 8, "10.4.1"))
      {
        size_t v11 = (double *)(v10 + 18);
        while (1)
        {
          if ((char *)v11 >= (char *)[v44 length] + (unint64_t)v10)
          {
            id v9 = v45;
            goto LABEL_22;
          }
          double v12 = 0.0;
          for (uint64_t i = 5; i != 18; ++i)
            double v12 = v12 + v11[i];
          double v15 = v11[2];
          double v14 = v11[3];
          double v16 = v11[4];
          id v17 = objc_alloc((Class)NSArray);
          v18 = +[NSNumber numberWithDouble:*v11];
          v19 = +[NSNumber numberWithDouble:v11[2]];
          double v20 = v14 + v15;
          uint64_t v21 = +[NSNumber numberWithDouble:v20];
          double v22 = v16 + v20;
          char v23 = +[NSNumber numberWithDouble:v22];
          uint64_t v24 = +[NSNumber numberWithDouble:v12 + v22];
          id v25 = objc_msgSend(v17, "initWithObjects:", v18, v19, v21, v23, v24, 0, v43);

          uint64_t v26 = *((__int16 *)v11 + 72);
          if ((unsigned __int16)(*((_WORD *)v11 + 72) - 0x7FFF) <= 0x8002u) {
            break;
          }
          id v27 = [objc_alloc((Class)NSString) initWithBytes:(char *)v11 + 146 length:*((__int16 *)v11 + 72) - 1 encoding:4];
          if (![v27 length])
          {
            v35 = SPLogForSPLogCategoryDefault();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              sub_100065154((unsigned __int16)v26, v35, v36, v37, v38, v39, v40, v41);
            }

            getpid();
            SimulateCrash();

            goto LABEL_20;
          }
          [v45 setObject:v25 forKey:v27];
          size_t v11 = (double *)((char *)v11 + *((__int16 *)v11 + 72) + 146);
        }
        v28 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_1000650E8(v26, v28, v29, v30, v31, v32, v33, v34);
        }

        getpid();
        SimulateCrash();
LABEL_20:
      }
      id v9 = 0;
LABEL_22:
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  objc_sync_exit(v2);

  return v9;
}

- (void)updateApplicationMetadataWithFilePath:(id)a3 currentDate:(id)a4 legacyPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  size_t v11 = +[NSFileManager defaultManager];
  if (![(SPApplicationMetadataUpdater *)self migrateDataIfNecessaryFromOlderFormatFile:v10 newFormatFile:v8])
  {
    [v11 removeItemAtPath:v10 error:0];
    double v15 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000652CC(v15, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_14;
  }
  double v12 = [(SPApplicationMetadataUpdater *)self lookupDict];
  [v12 removeAllObjects];

  [v9 timeIntervalSinceReferenceDate];
  double v14 = v13;
  if ([v11 fileExistsAtPath:v8])
  {
    double v15 = [objc_alloc((Class)NSMutableData) initWithContentsOfFile:v8];
    double v16 = (char *)[v15 mutableBytes];
    if (!v16 || (id v17 = v16, (unint64_t)[v15 length] < 0x12) || strcmp(v17 + 8, "10.4.1"))
    {
      v18 = +[NSFileManager defaultManager];
      [v18 removeItemAtPath:v8 error:0];

LABEL_14:
      goto LABEL_15;
    }
    id v77 = v9;
    double v31 = *(double *)v17;
    *(double *)id v17 = v14;
    if ((unint64_t)[v15 length] >= 0x13)
    {
      unint64_t v42 = 18;
      while (1)
      {
        v43 = &v17[v42];
        long long v44 = *(_OWORD *)&v17[v42 + 16];
        *(_OWORD *)buf = *(_OWORD *)&v17[v42];
        long long v82 = v44;
        long long v45 = *(_OWORD *)&v17[v42 + 32];
        long long v46 = *(_OWORD *)&v17[v42 + 48];
        long long v47 = *(_OWORD *)&v17[v42 + 64];
        long long v86 = *(_OWORD *)&v17[v42 + 80];
        long long v84 = v46;
        long long v85 = v47;
        long long v83 = v45;
        long long v48 = *(_OWORD *)&v17[v42 + 96];
        long long v49 = *(_OWORD *)&v17[v42 + 112];
        long long v50 = *(_OWORD *)&v17[v42 + 128];
        unsigned __int16 v90 = *(_WORD *)&v17[v42 + 144];
        long long v88 = v49;
        long long v89 = v50;
        long long v87 = v48;
        [(SPApplicationMetadataUpdater *)self updateMetadata:buf lastUpdatedTime:v31 nowTime:v14];
        long long v51 = v82;
        *(_OWORD *)v43 = *(_OWORD *)buf;
        *((_OWORD *)v43 + 1) = v51;
        long long v52 = v83;
        long long v53 = v84;
        long long v54 = v86;
        *((_OWORD *)v43 + 4) = v85;
        *((_OWORD *)v43 + 5) = v54;
        *((_OWORD *)v43 + 2) = v52;
        *((_OWORD *)v43 + 3) = v53;
        long long v55 = v87;
        long long v56 = v88;
        long long v57 = v89;
        *((_WORD *)v43 + 72) = v90;
        *((_OWORD *)v43 + 7) = v56;
        *((_OWORD *)v43 + 8) = v57;
        *((_OWORD *)v43 + 6) = v55;
        uint64_t v58 = v90;
        if ((unsigned __int16)(v90 - 0x7FFF) <= 0x8002u) {
          break;
        }
        id v59 = [objc_alloc((Class)NSString) initWithBytes:v43 + 146 length:v90 - 1 encoding:4];
        if (!v59)
        {
          v67 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
            sub_100065230(v15, v42, v67);
          }
          goto LABEL_26;
        }
        v60 = v59;
        +[NSNumber numberWithLongLong:v42];
        unint64_t v75 = v42;
        id v61 = v8;
        id v62 = v10;
        v63 = v11;
        v65 = v64 = v17;
        v66 = [(SPApplicationMetadataUpdater *)self lookupDict];
        [v66 setObject:v65 forKeyedSubscript:v60];

        id v17 = v64;
        size_t v11 = v63;
        id v10 = v62;
        id v8 = v61;

        unint64_t v42 = v75 + v58 + 146;
        if (v42 >= (unint64_t)[v15 length]) {
          goto LABEL_21;
        }
      }
      v67 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        sub_1000651C0(v58, v67, v68, v69, v70, v71, v72, v73);
      }
LABEL_26:
      id v9 = v77;

      [v11 removeItemAtPath:v8 error:0];
      goto LABEL_14;
    }
LABEL_21:
    id v9 = v77;
LABEL_11:
    uint64_t v32 = objc_opt_new();
    [v32 setDay:-1];
    uint64_t v33 = [(SPApplicationMetadataUpdater *)self calendar];
    id v76 = v9;
    uint64_t v34 = [v33 dateByAddingComponents:v32 toDate:v9 options:0];

    v74 = v34;
    [v34 timeIntervalSinceReferenceDate];
    uint64_t v36 = [(SPApplicationMetadataUpdater *)self computeAppLaunchesFromTime:v31 toTime:v14 yesterday:v35];
    uint64_t v37 = objc_opt_new();
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_100028F60;
    v78[3] = &unk_100092F18;
    v78[4] = self;
    double v15 = v15;
    v79 = v15;
    id v38 = v37;
    id v80 = v38;
    [v36 enumerateKeysAndObjectsUsingBlock:v78];
    uint64_t v39 = [(SPApplicationMetadataUpdater *)self lookupDict];
    [v39 removeAllObjects];

    [v15 appendData:v38];
    [v15 writeToFile:v8 atomically:1];
    uint64_t v40 = SPLogForSPLogCategoryDefault();
    os_log_type_t v41 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v40, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "updated app metadata with launches %@", buf, 0xCu);
    }

    id v9 = v76;
    goto LABEL_14;
  }
  uint64_t v26 = (char *)malloc_type_calloc(1uLL, 0x12uLL, 0x1000040B88D2812uLL);
  if (v26)
  {
    strcpy(v26 + 8, "10.4.1");
    *(double *)uint64_t v26 = v14;
    double v15 = [objc_alloc((Class)NSMutableData) initWithBytesNoCopy:v26 length:18 freeWhenDone:1];
    id v27 = objc_opt_new();
    [v27 setWeekOfMonth:-1];
    v28 = [(SPApplicationMetadataUpdater *)self calendar];
    uint64_t v29 = [v28 dateByAddingComponents:v27 toDate:v9 options:0];
    [v29 timeIntervalSinceReferenceDate];
    double v31 = v30;

    goto LABEL_11;
  }
LABEL_15:
}

- (BOOL)incrementDataValues:(double *)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5 byProportion:(double)a6
{
  if (a5 <= a4)
  {
    char v6 = 0;
  }
  else
  {
    char v6 = 0;
    int v7 = &a3[a5];
    id v8 = &a3[a5 - 1];
    do
    {
      --a5;
      double v9 = *v8;
      *int v7 = *v7 + *v8 * a6;
      --v7;
      *v8-- = v9 - v9 * a6;
      v6 |= v9 != 0.0;
    }
    while (a5 > a4);
  }
  return v6 & 1;
}

- (void)updateMetadata:(_app_metadata *)a3 lastUpdatedTime:(double)a4 nowTime:(double)a5
{
  double v7 = a5 - a4;
  double var1 = a3->var1;
  double v9 = (a5 - var1) / 604800.0;
  BOOL v10 = var1 <= 0.0;
  double v11 = 0.0;
  if (!v10) {
    double v11 = v9;
  }
  if (v7 / 604800.0 >= v11) {
    double v11 = v7 / 604800.0;
  }
  double v12 = (double)(int)v11 * 0.25;
  if (v12 > 1.0) {
    double v12 = 1.0;
  }
  if (v12 > 0.0
    && -[SPApplicationMetadataUpdater incrementDataValues:fromIndex:toIndex:byProportion:](self, "incrementDataValues:fromIndex:toIndex:byProportion:", a3->var2, 2, 15))
  {
    a3->double var1 = a5;
  }
  if (v7 / 86400.0 / 7.0 <= 1.0) {
    double v13 = v7 / 86400.0 / 7.0;
  }
  else {
    double v13 = 1.0;
  }
  double v14 = a3->var2[1];
  double v15 = v13 * v14;
  if (v15 > 0.0)
  {
    double v16 = v15 + a3->var2[2];
    double v14 = v14 - v15;
    a3->var2[1] = v14;
    a3->var2[2] = v16;
  }
  double v17 = a3->var2[0];
  if (v17 > 0.0)
  {
    a3->var2[1] = v17 + v14;
    a3->var2[0] = 0.0;
  }
}

- (id)computeAppLaunchesFromTime:(double)a3 toTime:(double)a4 yesterday:(double)a5
{
  double v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a4];
  double v9 = SPLogForSPLogCategoryDefault();
  os_log_type_t v10 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v9, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_DWORD *)buf = 138412546;
    v65 = v7;
    __int16 v66 = 2112;
    v67 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "fetching app launches from %@ to %@", buf, 0x16u);
  }

  double v11 = +[_DKKnowledgeStore knowledgeStore];
  id v12 = objc_alloc_init((Class)_DKEventQuery);
  double v13 = +[_DKSystemEventStreams appInFocusStream];
  v63 = v13;
  double v14 = +[NSArray arrayWithObjects:&v63 count:1];
  [v12 setEventStreams:v14];

  double v15 = +[_DKQuery startDateSortDescriptorAscending:0];
  id v62 = v15;
  double v16 = +[NSArray arrayWithObjects:&v62 count:1];
  [v12 setSortDescriptors:v16];

  [v12 setReadMetadata:1];
  double v17 = +[_DKQuery predicateForEventsWithStartInDateRangeFrom:v7 to:v8];
  [v12 setPredicate:v17];

  id v60 = 0;
  v18 = [v11 executeQuery:v12 error:&v60];
  id v19 = v60;
  if (v19)
  {
    uint64_t v20 = &__NSDictionary0__struct;
  }
  else
  {
    id v52 = v12;
    long long v53 = v11;
    long long v54 = v8;
    long long v55 = v7;
    uint64_t v20 = objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v51 = v18;
    id v21 = v18;
    id v22 = [v21 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v23; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v57 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          id v27 = objc_msgSend(v26, "stringValue", v51);
          v28 = [v26 metadata];
          id v29 = [v28 count];

          if (v29)
          {
            double v30 = [v26 metadata];
            double v31 = +[_DKApplicationMetadataKey extensionContainingBundleIdentifier];
            uint64_t v32 = [v30 objectForKey:v31];

            id v33 = [v32 length];
            BOOL v34 = v33 != 0;
            if (v33)
            {
              id v35 = v32;

              id v27 = v35;
            }
          }
          else
          {
            BOOL v34 = 0;
          }
          id v36 = [v20 objectForKey:v27];
          if (!v36)
          {
            id v36 = [&off_100099158 mutableCopy];
            [v20 setObject:v36 forKey:v27];
          }
          uint64_t v37 = [v26 startDate];
          [v37 timeIntervalSinceReferenceDate];
          double v39 = v38;

          if (!v34)
          {
            if (v39 <= a5)
            {
              uint64_t v40 = [v36 objectAtIndexedSubscript:1];
              os_log_type_t v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v40 unsignedIntegerValue] + 1);
              unint64_t v42 = v36;
              v43 = v41;
              uint64_t v44 = 1;
            }
            else
            {
              uint64_t v40 = [v36 objectAtIndexedSubscript:0];
              os_log_type_t v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v40 unsignedIntegerValue] + 1);
              unint64_t v42 = v36;
              v43 = v41;
              uint64_t v44 = 0;
            }
            [v42 setObject:v43 atIndexedSubscript:v44];
          }
          long long v45 = [v36 objectAtIndexedSubscript:2];
          [v45 doubleValue];
          double v47 = v46;

          if (v47 == 0.0 || v39 < v47)
          {
            long long v49 = +[NSNumber numberWithDouble:v39];
            [v36 setObject:v49 atIndexedSubscript:2];
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v23);
    }

    id v8 = v54;
    double v7 = v55;
    id v12 = v52;
    double v11 = v53;
    v18 = v51;
    id v19 = 0;
  }

  return v20;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (NSMutableDictionary)lookupDict
{
  return self->_lookupDict;
}

- (void)setLookupDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupDict, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end