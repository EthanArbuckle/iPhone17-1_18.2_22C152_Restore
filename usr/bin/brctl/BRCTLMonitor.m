@interface BRCTLMonitor
- (BOOL)isGlobal;
- (BRCTLMonitor)init;
- (NSProgress)progressObserved;
- (NSString)previousDescription;
- (id)_prettyDescriptionFromError:(id)a3;
- (int)scopes;
- (void)_checkIfQueryShouldStop:(id)a3;
- (void)dealloc;
- (void)monitorGlobalActivity;
- (void)monitorQuery:(id)a3 rootPath:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)parseOption:(int)a3 arg:(const char *)a4;
- (void)setPreviousDescription:(id)a3;
- (void)setProgressObserved:(id)a3;
- (void)setScopes:(int)a3;
@end

@implementation BRCTLMonitor

- (BRCTLMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)BRCTLMonitor;
  result = [(BRCTLMonitor *)&v3 init];
  if (result) {
    result->_scopes = 7;
  }
  return result;
}

- (void)dealloc
{
  +[NSProgress _removeSubscriber:self];
  v3.receiver = self;
  v3.super_class = (Class)BRCTLMonitor;
  [(BRCTLMonitor *)&v3 dealloc];
}

- (void)parseOption:(int)a3 arg:(const char *)a4
{
  if (a3 > 111)
  {
    switch(a3)
    {
      case 'p':
        self->_isStaticGathering = 1;
        break;
      case 't':
        if (a4)
        {
          self->_requestedTime = +[NSNumber numberWithInt:atoi(a4)];
          _objc_release_x1();
        }
        else
        {
          requestedTime = self->_requestedTime;
          self->_requestedTime = 0;
        }
        break;
      case 'w':
        self->_waitForAllUploaded = 1;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 'S':
        if (!strcasecmp(a4, "docs")) {
          self->_scopes = 1;
        }
        if (!strcasecmp(a4, "data")) {
          self->_scopes = 2;
        }
        if (!strcasecmp(a4, "ext")) {
          self->_scopes = 4;
        }
        break;
      case 'g':
        self->_isGlobal = 1;
        break;
      case 'i':
        self->_incremental = 1;
        break;
    }
  }
}

- (void)monitorGlobalActivity
{
  puts("monitoring global activity...");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007624;
  v7[3] = &unk_100024F48;
  v7[4] = self;
  objc_super v3 = objc_retainBlock(v7);
  v4 = +[BRDaemonConnection mobileDocumentsURL];
  id v5 = +[NSProgress _addSubscriberForFileURL:v4 withPublishingHandler:v3];

  while (1)
  {
    v6 = +[NSRunLoop mainRunLoop];
    [v6 run];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v11;
    v14 = [(BRCTLMonitor *)self progressObserved];
    unsigned int v15 = [v13 isEqual:v14];

    if (v15)
    {
      v16 = +[NSMutableString string];
      v17 = +[NSMutableArray array];
      v18 = [v13 localizedAdditionalDescription];
      id v19 = [v18 length];

      [v13 localizedDescription];
      if (v19) {
        v20 = {;
      }
        v21 = [v13 localizedAdditionalDescription];
        v22 = +[NSString stringWithFormat:@"%@ (%@)", v20, v21];
      }
      else {
        v22 = {;
      }
      }
      id v23 = v22;
      id v24 = [v23 UTF8String];
      [v13 fractionCompleted];
      [v16 appendFormat:@"%-45s %5.1f%% ", v24, v25 * 100.0];

      v26 = [v13 userInfo];
      v27 = [v26 objectForKeyedSubscript:NSProgressFileTotalCountKey];
      [v16 appendFormat:@"[fileCount: %@] ", v27];

      if ([v13 isFinished]) {
        [v17 addObject:@"finished"];
      }
      if ([v13 isIndeterminate]) {
        [v17 addObject:@"indeterminate"];
      }
      if ([v13 isCancelled]) {
        [v17 addObject:@"cancelled"];
      }
      if ([v13 isPaused]) {
        [v17 addObject:@"paused"];
      }
      if ([v17 count])
      {
        v28 = [v17 componentsJoinedByString:@", "];
        v29 = +[NSString stringWithFormat:@"[%@]", v28];
      }
      else
      {
        v29 = &stru_100026380;
      }
      v30 = v29;
      [v16 appendFormat:@"%-25s ", -[__CFString UTF8String](v30, "UTF8String")];
      v31 = [(BRCTLMonitor *)self previousDescription];
      unsigned int v32 = [v31 isEqualToString:v16];

      if (v32)
      {
        [v16 length];
        [v10 UTF8String];
        printf("%*s (%s)\n");
      }
      else
      {
        [v16 UTF8String];
        [v10 UTF8String];
        printf("%s (%s)\n");
      }
      [(BRCTLMonitor *)self setPreviousDescription:v16];
    }
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)BRCTLMonitor;
    [(BRCTLMonitor *)&v33 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (id)_prettyDescriptionFromError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:NSCocoaErrorDomain];

  if (!v5) {
    goto LABEL_6;
  }
  if ([v3 code] == (id)4354)
  {
    v6 = @"pending-quota";
    goto LABEL_7;
  }
  if ([v3 code] == (id)4355)
  {
    v6 = @"offline";
  }
  else
  {
LABEL_6:
    v6 = [v3 description];
  }
LABEL_7:

  return v6;
}

- (void)_checkIfQueryShouldStop:(id)a3
{
  id v4 = a3;
  unsigned int v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100016C7C((uint64_t)v5, v6);
  }

  v7 = +[NSDate date];
  [v7 timeIntervalSinceDate:self->_startDate];
  double v9 = v8;

  if (self->_allUploaded && self->_waitForAllUploaded && self->_gatheringFinished)
  {
    int v10 = 0;
    id v11 = "Stopping the query because all items are now uploaded";
LABEL_10:
    puts(v11);
    [(NSMetadataQuery *)self->_currentWatchedQuery stopQuery];
    [v4 invalidate];
    exit(v10);
  }
  if (v9 > (double)[(NSNumber *)self->_requestedTime unsignedLongLongValue])
  {
    int v10 = 1;
    id v11 = "Stopping the query since the specified time has elapsed";
    goto LABEL_10;
  }
}

- (void)monitorQuery:(id)a3 rootPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)BRCTermDumper) initWithFd:1 forceColor:0];
  id v10 = objc_alloc_init((Class)NSOperationQueue);
  [v10 setMaxConcurrentOperationCount:1];
  [v7 _setExternalDocumentsBundleIdentifier:0];
  [v7 setOperationQueue:v10];
  objc_storeStrong((id *)&self->_currentWatchedQuery, a3);
  v41[0] = NSMetadataUbiquitousItemDownloadingStatusNotDownloaded;
  v41[1] = NSMetadataUbiquitousItemDownloadingStatusDownloaded;
  v42[0] = @"not downloaded";
  v42[1] = @"server edit to download";
  id v11 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
  v39[0] = NSMetadataUbiquitousSharedItemPermissionsReadOnly;
  v39[1] = NSMetadataUbiquitousSharedItemPermissionsReadWrite;
  v40[0] = @"r";
  v40[1] = @"rw";
  id v12 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  id v13 = +[NSDate date];
  startDate = self->_startDate;
  self->_startDate = v13;

  id v15 = v8;
  id v16 = [v15 fileSystemRepresentation];
  BRCPrettyPrintBitmap();
  id v17 = objc_claimAutoreleasedReturnValue();
  [v9 write:@"observing in %s for the %s scope(s)\n", v16, [v17 UTF8String]];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100008260;
  v34[3] = &unk_100024F70;
  id v18 = v7;
  v34[4] = v18;
  id v19 = v9;
  v34[5] = v19;
  v34[6] = self;
  v34[7] = v15;
  v34[8] = v11;
  v34[9] = v12;
  v20 = objc_retainBlock(v34);
  v21 = +[NSNotificationCenter defaultCenter];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000090A0;
  v33[3] = &unk_100024F98;
  v22 = v20;
  v33[4] = v22;
  id v23 = [v21 addObserverForName:NSMetadataQueryDidUpdateNotification object:v18 queue:v10 usingBlock:v33];

  id v24 = +[NSNotificationCenter defaultCenter];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100009100;
  v32[3] = &unk_100024FC0;
  v32[4] = self;
  v32[6] = v22;
  v32[5] = v19;
  id v25 = [v24 addObserverForName:NSMetadataQueryDidFinishGatheringNotification object:v18 queue:v10 usingBlock:v32];

  if (![v18 startQuery]) {
    errx(1, "can't start query");
  }
  while (1)
  {
    if (self->_requestedTime)
    {
      v26 = brc_bread_crumbs();
      v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        requestedTime = self->_requestedTime;
        *(_DWORD *)buf = 138412546;
        v36 = requestedTime;
        __int16 v37 = 2112;
        v38 = v26;
        _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] The user has requested to run the query for %@%@", buf, 0x16u);
      }
    }
    else if (!self->_waitForAllUploaded)
    {
      goto LABEL_8;
    }
    v28 = +[NSTimer timerWithTimeInterval:self target:"_checkIfQueryShouldStop:" selector:0 userInfo:1 repeats:1.0];
    v29 = +[NSRunLoop mainRunLoop];
    [v29 addTimer:v28 forMode:NSRunLoopCommonModes];

LABEL_8:
    v30 = +[NSRunLoop mainRunLoop];
    [v30 run];
  }
}

- (int)scopes
{
  return self->_scopes;
}

- (void)setScopes:(int)a3
{
  self->_scopes = a3;
}

- (BOOL)isGlobal
{
  return self->_isGlobal;
}

- (NSProgress)progressObserved
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressObserved);

  return (NSProgress *)WeakRetained;
}

- (void)setProgressObserved:(id)a3
{
}

- (NSString)previousDescription
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPreviousDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousDescription, 0);
  objc_destroyWeak((id *)&self->_progressObserved);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_currentWatchedQuery, 0);

  objc_storeStrong((id *)&self->_requestedTime, 0);
}

@end