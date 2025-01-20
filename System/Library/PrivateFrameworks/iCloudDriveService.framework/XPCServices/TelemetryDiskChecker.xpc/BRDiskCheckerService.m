@interface BRDiskCheckerService
+ (void)initialize;
- (BOOL)_isActiveJobsInDB:(id)a3 inZones:(id)a4;
- (BRDiskCheckerService)init;
- (id)_setupDatabaseConnectionFromURL:(id)a3 error:(id *)a4;
- (void)cancelTreeConsistencyCheck;
- (void)checkRecursiveChildItemCountFromURLWrapper:(id)a3 qualityOfService:(int64_t)a4 reply:(id)a5;
- (void)checkTreeConsistencyWithDatabaseURL:(id)a3 rootURLWrappers:(id)a4 fileChecksumRatePerThousand:(unsigned int)a5 packageChecksumRatePerThousand:(unsigned int)a6 maxEventsCount:(unsigned int)a7 forZoneRowIDs:(id)a8 reply:(id)a9;
- (void)pauseTreeConsistencyCheck;
- (void)resumeTreeConsistencyCheckWithReply:(id)a3;
@end

@implementation BRDiskCheckerService

+ (void)initialize
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)qword_100015958;
  qword_100015958 = v2;

  brc_block_remember_persona = (uint64_t (*)(void))sub_100005F68;
  brc_activity_block_remember_persona = sub_100006070;
}

- (BRDiskCheckerService)init
{
  v8.receiver = self;
  v8.super_class = (Class)BRDiskCheckerService;
  uint64_t v2 = [(BRDiskCheckerService *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    childCountQueue = v2->_childCountQueue;
    v2->_childCountQueue = v3;

    [(NSOperationQueue *)v2->_childCountQueue setMaxConcurrentOperationCount:1];
    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    treeCheckQueue = v2->_treeCheckQueue;
    v2->_treeCheckQueue = v5;

    [(NSOperationQueue *)v2->_treeCheckQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (void)checkRecursiveChildItemCountFromURLWrapper:(id)a3 qualityOfService:(int64_t)a4 reply:(id)a5
{
  id v8 = a5;
  v9 = [a3 url];
  [v9 startAccessingSecurityScopedResource];
  v10 = [[BRDiskCheckerCountDocumentsOperation alloc] initWithFileURL:v9];
  [(BRDiskCheckerCountDocumentsOperation *)v10 setQualityOfService:a4];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100006310;
  v16 = &unk_1000104F8;
  id v17 = v9;
  id v18 = v8;
  id v11 = v8;
  id v12 = v9;
  [(BRDiskCheckerCountDocumentsOperation *)v10 setCountFolderShareItemsCompletionBlock:&v13];
  -[NSOperationQueue addOperation:](self->_childCountQueue, "addOperation:", v10, v13, v14, v15, v16);
}

- (void)checkTreeConsistencyWithDatabaseURL:(id)a3 rootURLWrappers:(id)a4 fileChecksumRatePerThousand:(unsigned int)a5 packageChecksumRatePerThousand:(unsigned int)a6 maxEventsCount:(unsigned int)a7 forZoneRowIDs:(id)a8 reply:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  id v30 = 0;
  v19 = [(BRDiskCheckerService *)self _setupDatabaseConnectionFromURL:v15 error:&v30];
  id v20 = v30;
  if (v19)
  {
    if ([(BRDiskCheckerService *)self _isActiveJobsInDB:v19 inZones:v17])
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Not checking telemetry because we have active jobs%@", buf, 0xCu);
      }

      v23 = +[NSError brc_errorItemChanged];
      (*((void (**)(id, void, void, void *))v18 + 2))(v18, 0, 0, v23);
    }
    else
    {
      v24 = [[BRDiskCheckerValidateTreeConsistencyOperation alloc] initWithDatabase:v19 rootURLWrappers:v16 fileChecksumRatePerThousand:v12 packageChecksumRatePerThousand:v11 maxEventCount:v10];
      objc_initWeak((id *)buf, v24);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000669C;
      v26[3] = &unk_100010548;
      objc_copyWeak(&v29, (id *)buf);
      id v28 = v18;
      id v27 = v19;
      [(BRDiskCheckerValidateTreeConsistencyOperation *)v24 setCheckTelemetryCompletionBlock:v26];
      id v25 = (id)qword_100015958;
      objc_sync_enter(v25);
      [(id)qword_100015958 addObject:v24];
      objc_sync_exit(v25);

      [(NSOperationQueue *)self->_treeCheckQueue addOperation:v24];
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    (*((void (**)(id, void, void, id))v18 + 2))(v18, 0, 0, v20);
  }
}

- (void)pauseTreeConsistencyCheck
{
  id obj = (id)qword_100015958;
  objc_sync_enter(obj);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)qword_100015958;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v5);
        v7 = brc_bread_crumbs();
        id v8 = brc_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Pausing consistency checker%@", buf, 0xCu);
        }

        [v6 pause];
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v3);
  }

  objc_sync_exit(obj);
}

- (void)resumeTreeConsistencyCheckWithReply:(id)a3
{
  long long v12 = (void (**)(id, void))a3;
  id obj = (id)qword_100015958;
  objc_sync_enter(obj);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)qword_100015958;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v6);
        id v8 = brc_bread_crumbs();
        v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Resuming the consistency checker%@", buf, 0xCu);
        }

        [v7 resume];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v4);
  }

  if ([(id)qword_100015958 count])
  {
    v12[2](v12, 0);
  }
  else
  {
    long long v10 = +[NSError brc_errorItemNotFound:@"operation"];
    ((void (**)(id, void *))v12)[2](v12, v10);
  }
  objc_sync_exit(obj);
}

- (void)cancelTreeConsistencyCheck
{
  id v2 = (id)qword_100015958;
  objc_sync_enter(v2);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = (id)qword_100015958;
  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "cancel", (void)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (id)_setupDatabaseConnectionFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 URLByAppendingPathComponent:@"client.db"];
  long long v7 = [v5 URLByAppendingPathComponent:@"server.db"];

  long long v8 = brc_bread_crumbs();
  long long v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100009930(v6, (uint64_t)v8, v9);
  }

  id v10 = [objc_alloc((Class)BRCPQLConnection) initWithLabel:@"telemetry-connection" dbCorruptionHandler:&stru_100010588];
  id v24 = 0;
  unsigned __int8 v11 = [v10 openAtURL:v6 withFlags:1 error:&v24];
  id v12 = v24;
  if ((v11 & 1) == 0)
  {
    id v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v26 = v6;
      __int16 v27 = 2112;
      id v28 = v12;
      __int16 v29 = 2112;
      id v30 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v18, (os_log_type_t)0x90u, "[ERROR] error opening db at url %@: %@%@", buf, 0x20u);
    }

    if (!a4)
    {
      id v16 = 0;
      goto LABEL_18;
    }
    v19 = v12;
    goto LABEL_14;
  }
  long long v13 = [v7 path];
  id v23 = v12;
  unsigned __int8 v14 = [v10 attachDBAtPath:v13 as:@"server" error:&v23];
  id v15 = v23;

  if ((v14 & 1) == 0)
  {
    id v20 = brc_bread_crumbs();
    v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138413058;
      v26 = v7;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v15;
      __int16 v31 = 2112;
      v32 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v21, (os_log_type_t)0x90u, "[ERROR] error attaching db at url %@ to db %@: %@%@", buf, 0x2Au);
    }

    objc_msgSend(v10, "brc_close");
    if (!a4)
    {
      id v16 = 0;
      goto LABEL_17;
    }
    v19 = v15;
LABEL_14:
    id v12 = v19;
    id v16 = 0;
    *a4 = v12;
    goto LABEL_18;
  }
  id v16 = v10;
LABEL_17:
  id v12 = v15;
LABEL_18:

  return v16;
}

- (BOOL)_isActiveJobsInDB:(id)a3 inZones:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    [v5 useSerialQueue];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100007490;
    v11[3] = &unk_1000105B0;
    id v12 = v6;
    id v13 = v5;
    p_long long buf = &buf;
    [v13 performWithFlags:1 action:v11];
    BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    long long v8 = brc_bread_crumbs();
    long long v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] no active jobs in nil (why?) db%@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treeCheckQueue, 0);
  objc_storeStrong((id *)&self->_childCountQueue, 0);
}

@end