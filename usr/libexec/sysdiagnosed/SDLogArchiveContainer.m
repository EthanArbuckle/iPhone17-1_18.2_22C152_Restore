@interface SDLogArchiveContainer
+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withTargetArchive:(id)a6 withDelegate:(id)a7;
+ (id)getWallTimeFromMetadata:(id)a3;
- (BOOL)execute;
- (BOOL)setLogArchiveUnit:(id)a3;
- (NSMutableDictionary)durationMetrics;
- (SDArchive)archive;
- (SDLogArchiveUnit)unit;
- (double)timeout;
- (void)addMetricsFromInfoPlist:(id)a3 forBook:(id)a4 withCurrentTime:(unint64_t)a5;
- (void)applyContainerOverride:(id)a3;
- (void)extractMetricsFromInfoPlist:(int)a3;
- (void)setArchive:(id)a3;
- (void)setDurationMetrics:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUnit:(id)a3;
@end

@implementation SDLogArchiveContainer

+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withTargetArchive:(id)a6 withDelegate:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = [objc_alloc((Class)a1) initWithName:v15 andDestination:v12 withDelegate:v14];

  if (v16)
  {
    [v16 setTimeout:a5];
    [v16 setDestination:v12];
    [v16 setArchive:v13];
    v17 = objc_opt_new();
    [v16 setDurationMetrics:v17];
  }

  return v16;
}

- (BOOL)setLogArchiveUnit:(id)a3
{
  return 1;
}

+ (id)getWallTimeFromMetadata:(id)a3
{
  v3 = [a3 objectForKey:@"OldestTimeRef"];
  v4 = [v3 objectForKey:@"WallTime"];

  return v4;
}

- (void)addMetricsFromInfoPlist:(id)a3 forBook:(id)a4 withCurrentTime:(unint64_t)a5
{
  id v24 = a3;
  id v8 = a4;
  v9 = [v8 stringByAppendingString:@"Metadata"];
  v10 = objc_opt_class();
  v11 = [v24 objectForKey:v9];
  id v12 = [v10 getWallTimeFromMetadata:v11];

  id v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a5 - (unint64_t)[v12 unsignedLongLongValue] / 0x3B9ACA00);
  id v14 = v8;
  if ([v14 isEqualToString:@"Persist"])
  {
    id v15 = (id *)&metricPersistLookback;
  }
  else if ([v14 isEqualToString:@"Special"])
  {
    id v15 = (id *)&metricSpecialLookback;
  }
  else
  {
    id v16 = v14;
    if (![v14 isEqualToString:@"Signpost"]) {
      goto LABEL_9;
    }
    id v15 = (id *)&metricSignpostLookback;
  }
  id v16 = *v15;

  if (!v16) {
    goto LABEL_10;
  }
  v17 = [(SDLogArchiveContainer *)self durationMetrics];
  [v17 setObject:v13 forKeyedSubscript:v16];

LABEL_9:
LABEL_10:
  v18 = [v14 stringByAppendingString:@"SizeLimit"];
  id v19 = v14;
  if ([v19 isEqualToString:@"Persist"])
  {
    v20 = (id *)&metricPersistSize;
  }
  else if ([v19 isEqualToString:@"Special"])
  {
    v20 = (id *)&metricSpecialSize;
  }
  else
  {
    id v21 = v19;
    if (![v19 isEqualToString:@"Signpost"]) {
      goto LABEL_18;
    }
    v20 = (id *)&metricSignpostSize;
  }
  id v21 = *v20;

  if (!v21) {
    goto LABEL_19;
  }
  v22 = [v24 objectForKey:v18];
  v23 = [(SDLogArchiveContainer *)self durationMetrics];
  [v23 setObject:v22 forKeyedSubscript:v21];

LABEL_18:
LABEL_19:
}

- (void)extractMetricsFromInfoPlist:(int)a3
{
  id v4 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:*(void *)&a3];
  v5 = v4;
  if (v4)
  {
    id v23 = 0;
    v6 = [v4 readDataUpToLength:0x400000 error:&v23];
    id v7 = v23;
    if (v7)
    {
      id v8 = v7;
      v9 = sub_10002820C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000635D4();
      }

      v10 = +[SDResourceManager sharedResourceManager];
      [v10 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Could not read the log archive Info plist: %@", v8 category msg];

      sub_1000321DC(v5);
    }
    else
    {
      id v22 = 0;
      id v12 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v22];
      id v13 = v22;
      id v8 = v13;
      if (v12) {
        BOOL v14 = v13 == 0;
      }
      else {
        BOOL v14 = 0;
      }
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v15 = v12;
        id v16 = +[NSDate now];
        [v16 timeIntervalSince1970];
        unint64_t v18 = (unint64_t)v17;

        [(SDLogArchiveContainer *)self addMetricsFromInfoPlist:v15 forBook:@"Persist" withCurrentTime:v18];
        [(SDLogArchiveContainer *)self addMetricsFromInfoPlist:v15 forBook:@"Special" withCurrentTime:v18];
        [(SDLogArchiveContainer *)self addMetricsFromInfoPlist:v15 forBook:@"Signpost" withCurrentTime:v18];
        id v19 = sub_10002820C();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_100063490(self, v19);
        }

        sub_1000321DC(v5);
      }
      else
      {
        v20 = sub_10002820C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100063428();
        }

        id v21 = +[SDResourceManager sharedResourceManager];
        [v21 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Could not create a plist object from the file: %@", v8 category msg];

        sub_1000321DC(v5);
      }
    }
  }
  else
  {
    v11 = sub_10002820C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000633E4(v11);
    }

    id v8 = +[SDResourceManager sharedResourceManager];
    [v8 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Could not intialize a file handle from Info plist fd."];
  }
}

- (BOOL)execute
{
  [(SDContainer *)self updateContainerWithOverride];
  if (![(SDContainer *)self evaluateCollectionFlags]) {
    return 0;
  }
  v3 = [(SDLogArchiveContainer *)self unit];
  id v4 = [v3 archive_arguments];

  if (v4)
  {
    uint64_t v5 = [v4 valueForKey:@"filename"];
    if (v5) {
      v6 = (__CFString *)v5;
    }
    else {
      v6 = @"system_logs.logarchive";
    }
    id v7 = [(SDContainer *)self destination];
    id v8 = [v7 stringByAppendingPathComponent:v6];

    v9 = [(SDContainer *)self destination];
    v10 = [v9 stringByAppendingPathComponent:@"oslog_archive_error.log"];

    id v11 = v8;
    if (mkdir((const char *)[v11 fileSystemRepresentation], 0x1FFu))
    {
      BOOL v12 = 0;
    }
    else
    {
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_100032970;
      v64[3] = &unk_10009DB50;
      v43 = fopen((const char *)[v10 fileSystemRepresentation], "wx");
      v64[4] = v43;
      v44 = objc_retainBlock(v64);
      id v13 = v11;
      int v45 = sub_100056710((const char *)[v13 fileSystemRepresentation], 0);
      if (v45 == -1)
      {
        int v19 = *__error();
        v20 = sub_10002820C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_1000636AC((uint64_t)v13, v19, v20);
        }

        id v21 = +[SDResourceManager sharedResourceManager];
        [v21 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to open log archive %@: %s", v13, strerror(v19) category msg];

        BOOL v12 = 0;
      }
      else
      {
        BOOL v14 = getenv("SUDO_UID");
        id v15 = getenv("SUDO_GID");
        int v16 = 0;
        if (v14)
        {
          double v17 = v15;
          int v18 = 0;
          if (v15)
          {
            int v16 = strtoul(v14, 0, 10);
            int v18 = strtoul(v17, 0, 10);
          }
        }
        else
        {
          int v18 = 0;
        }
        v62[0] = 0;
        v62[1] = v62;
        v62[2] = 0x2020000000;
        char v63 = 0;
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100032A38;
        v53[3] = &unk_10009DBA0;
        id v54 = v13;
        v58 = v62;
        id v22 = v44;
        int v59 = v45;
        int v60 = v16;
        int v61 = v18;
        id v57 = v22;
        v55 = self;
        v56 = v6;
        id v23 = objc_retainBlock(v53);
        id v24 = sub_10002820C();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v4;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Trigger logarchive with following parameters: %@", (uint8_t *)&buf, 0xCu);
        }

        v25 = +[SDResourceManager sharedResourceManager];
        [v25 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Trigger logarchive with following parameters: %@", v4 category msg];

        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v68 = 0x2020000000;
        int v69 = -1;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100033280;
        block[3] = &unk_10009DBC8;
        id v42 = (id)os_transaction_create();
        id v48 = v42;
        p_long long buf = &buf;
        id v49 = v4;
        v50 = v22;
        v41 = v23;
        id v51 = v41;
        dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        v27 = dispatch_get_global_queue(0, 0);
        dispatch_async(v27, v26);

        [(SDLogArchiveContainer *)self timeout];
        dispatch_time_t v29 = dispatch_time(0, (uint64_t)(v28 * 1000000000.0));
        if (dispatch_block_wait(v26, v29))
        {
          v30 = sub_10002820C();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            [(SDLogArchiveContainer *)self timeout];
            *(_DWORD *)v65 = 134217984;
            uint64_t v66 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "OSLogCreateArchive did not return in %f seconds", v65, 0xCu);
          }

          v32 = +[SDResourceManager sharedResourceManager];
          [(SDLogArchiveContainer *)self timeout];
          [v32 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"OSLogCreateArchive did not return in %f seconds" v33];

          v34 = [(SDLogArchiveContainer *)self archive];
          if (v34)
          {
            v35 = [(SDLogArchiveContainer *)self archive];
            v36 = [v35 tarQueue];
            BOOL v37 = v36 == 0;

            if (!v37)
            {
              v38 = [(SDLogArchiveContainer *)self archive];
              v39 = [v38 tarQueue];
              v46[0] = _NSConcreteStackBlock;
              v46[1] = 3221225472;
              v46[2] = sub_1000332B8;
              v46[3] = &unk_10009D7B0;
              v46[4] = v62;
              dispatch_sync(v39, v46);
            }
          }
          dispatch_block_cancel(v26);
          if (v43) {
            fputs("OSLogCreateArchive timed out\n", v43);
          }
        }
        fclose(v43);
        close(v45);
        BOOL v12 = *(_DWORD *)(*((void *)&buf + 1) + 24) == 0;

        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(v62, 8);
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)applyContainerOverride:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"timeout"];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [v4 objectForKeyedSubscript:@"timeout"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v9 = [v4 objectForKeyedSubscript:@"timeout"];
      v10 = sub_10002820C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        [v9 doubleValue];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Logarchive timeout set to %fl seconds", buf, 0xCu);
      }

      BOOL v12 = +[SDResourceManager sharedResourceManager];
      [v9 doubleValue];
      [v12 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"Logarchive timeout set to %fl seconds" v13];

      [v9 doubleValue];
      [(SDLogArchiveContainer *)self setTimeout:"setTimeout:"];
    }
  }
  BOOL v14 = [(SDLogArchiveContainer *)self unit];

  if (v4 && v14)
  {
    id v15 = [(SDLogArchiveContainer *)self unit];
    [v15 logArchiveOverride:v4];
  }
}

- (SDLogArchiveUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (SDArchive)archive
{
  return self->_archive;
}

- (void)setArchive:(id)a3
{
}

- (NSMutableDictionary)durationMetrics
{
  return self->_durationMetrics;
}

- (void)setDurationMetrics:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationMetrics, 0);
  objc_storeStrong((id *)&self->_archive, 0);

  objc_storeStrong((id *)&self->_unit, 0);
}

@end