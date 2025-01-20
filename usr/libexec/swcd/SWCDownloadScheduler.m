@interface SWCDownloadScheduler
+ (id)new;
- (BOOL)isEnabled;
- (SWCDatabase)database;
- (SWCDownloadScheduler)init;
- (SWCDownloadScheduler)initWithDownloader:(id)a3 database:(id)a4;
- (SWCDownloader)downloader;
- (id)_init;
- (id)_updateableEntries;
- (void)_performUpdateWithActivity:(id)a3;
- (void)_performUpdatesWithTransaction:(id)a3;
- (void)_scheduleUpdateTimer;
- (void)setEnabled:(BOOL)a3;
- (void)update;
@end

@implementation SWCDownloadScheduler

- (SWCDownloadScheduler)initWithDownloader:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWCDownloadScheduler;
  v9 = [(SWCDownloadScheduler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_downloader, a3);
    objc_storeStrong((id *)&v10->_database, a4);
    v10->_enabled = 1;
  }

  return v10;
}

+ (id)new
{
}

- (SWCDownloadScheduler)init
{
}

- (void)update
{
  id v3 = (id)os_transaction_create();
  -[SWCDownloadScheduler _performUpdatesWithTransaction:](self, "_performUpdatesWithTransaction:");
}

- (SWCDownloader)downloader
{
  return (SWCDownloader *)objc_getProperty(self, a2, 16, 1);
}

- (SWCDatabase)database
{
  return (SWCDatabase *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_downloader, 0);
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)SWCDownloadScheduler;
  v2 = [(SWCDownloadScheduler *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(SWCDownloadScheduler *)v2 _scheduleUpdateTimer];
  }
  return v3;
}

- (void)_scheduleUpdateTimer
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 3600);
    xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_string(v4, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION_DOWNLOAD);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000161C4;
    handler[3] = &unk_100034DA0;
    handler[4] = self;
    xpc_activity_register("com.apple.SharedWebCredentials.recheck", v4, handler);
  }
}

- (void)_performUpdateWithActivity:(id)a3
{
  v4 = (_xpc_activity_s *)a3;
  objc_super v5 = (void *)os_transaction_create();
  xpc_activity_state_t state = xpc_activity_get_state(v4);
  if (qword_10003B260 != -1) {
    dispatch_once(&qword_10003B260, &stru_100034DE8);
  }
  id v7 = qword_10003B258;
  if (os_log_type_enabled((os_log_t)qword_10003B258, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v16 = state;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Update activity state: %lli", buf, 0xCu);
    if (state == 2)
    {
      if (qword_10003B260 != -1) {
        dispatch_once(&qword_10003B260, &stru_100034DE8);
      }
      goto LABEL_8;
    }
    if (qword_10003B260 != -1) {
      dispatch_once(&qword_10003B260, &stru_100034DE8);
    }
  }
  else if (state == 2)
  {
LABEL_8:
    id v8 = qword_10003B258;
    if (os_log_type_enabled((os_log_t)qword_10003B258, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing SWC update.", buf, 2u);
    }
    if (xpc_activity_set_state(v4, 4))
    {
      v9 = +[SWCDatabase queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100016550;
      block[3] = &unk_100034DC8;
      block[4] = self;
      id v13 = v5;
      v14 = v4;
      dispatch_async(v9, block);
    }
    else
    {
      if (qword_10003B260 != -1) {
        dispatch_once(&qword_10003B260, &stru_100034DE8);
      }
      v11 = qword_10003B258;
      if (os_log_type_enabled((os_log_t)qword_10003B258, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Continue activity state failed; downloads will not proceed at this time.",
          buf,
          2u);
      }
    }
    goto LABEL_20;
  }
  v10 = qword_10003B258;
  if (os_log_type_enabled((os_log_t)qword_10003B258, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v16 = state;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Activity block was fired with state %lli; not running now.",
      buf,
      0xCu);
  }
LABEL_20:
}

- (id)_updateableEntries
{
  id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  v4 = +[NSDate date];
  database = self->_database;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_1000166BC;
  v14 = &unk_100034CE0;
  id v6 = v4;
  id v15 = v6;
  id v7 = v3;
  id v16 = v7;
  [(SWCDatabase *)database enumerateEntriesWithBlock:&v11];
  if (!objc_msgSend(v7, "count", v11, v12, v13, v14))
  {

    id v7 = 0;
  }
  id v8 = v16;
  id v9 = v7;

  return v9;
}

- (void)_performUpdatesWithTransaction:(id)a3
{
  if ([(SWCDownloadScheduler *)self isEnabled])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v4 = [(SWCDownloadScheduler *)self _updateableEntries];
    id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v18;
      *(void *)&long long v6 = 138412290;
      long long v16 = v6;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v8);
          if (objc_msgSend(v9, "needsFirstDownload", v16))
          {
            downloader = self->_downloader;
            v11 = [v9 domain];
            uint64_t v12 = [v9 applicationIdentifier];
            [(SWCDownloader *)downloader downloadAASAFileForDomain:v11 applicationIdentifier:v12 completionHandler:0];
          }
          else
          {
            if (qword_10003B260 != -1) {
              dispatch_once(&qword_10003B260, &stru_100034DE8);
            }
            id v13 = qword_10003B258;
            if (os_log_type_enabled((os_log_t)qword_10003B258, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v16;
              v22 = v9;
              _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Updating entry %@", buf, 0xCu);
            }
            v14 = self->_downloader;
            v11 = [v9 domain];
            uint64_t v12 = [v9 applicationIdentifier];
            [(SWCDownloader *)v14 updateAASAFileForDomain:v11 applicationIdentifier:v12 completionHandler:0];
          }

          id v8 = (char *)v8 + 1;
        }
        while (v5 != v8);
        id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v5);
    }
  }
  else
  {
    if (qword_10003B260 != -1) {
      dispatch_once(&qword_10003B260, &stru_100034DE8);
    }
    id v15 = qword_10003B258;
    if (os_log_type_enabled((os_log_t)qword_10003B258, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Ignoring call to schedule downloads because the scheduler is disabled", buf, 2u);
    }
  }
}

@end