@interface BYDaemonCloudSyncController
+ (id)sharedController;
- (BYDaemonCloudSyncController)init;
- (BYNotesSyncTask)notesSync;
- (NSMutableArray)delegates;
- (NSMutableArray)errors;
- (NSProgress)daemonProgress;
- (NSProgress)notesProgress;
- (NSProgress)progress;
- (OS_os_transaction)transaction;
- (void)addDelegate:(id)a3;
- (void)cancelDaemonSync;
- (void)cancelNotesSync;
- (void)cancelSync;
- (void)cloudKitSyncer:(id)a3 didFinishWithError:(id)a4;
- (void)cloudKitSyncer:(id)a3 didUpdateProgress:(double)a4;
- (void)cloudSyncProgressUpdate:(int64_t)a3 completedClients:(int64_t)a4 errors:(id)a5;
- (void)dealloc;
- (void)isSyncInProgress:(id)a3;
- (void)needsToSyncClasses:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeDelegate:(id)a3;
- (void)setDaemonProgress:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setErrors:(id)a3;
- (void)setNotesProgress:(id)a3;
- (void)setNotesSync:(id)a3;
- (void)setProgress:(id)a3;
- (void)setTransaction:(id)a3;
- (void)startDaemonSync;
- (void)startNotesSync;
- (void)startSync;
@end

@implementation BYDaemonCloudSyncController

+ (id)sharedController
{
  if (qword_100024DA8 != -1) {
    dispatch_once(&qword_100024DA8, &stru_10001CB58);
  }
  v2 = (void *)qword_100024DB0;
  return v2;
}

- (BYDaemonCloudSyncController)init
{
  v5.receiver = self;
  v5.super_class = (Class)BYDaemonCloudSyncController;
  v2 = [(BYDaemonCloudSyncController *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    [(BYDaemonCloudSyncController *)v2 setDelegates:v3];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [(BYDaemonCloudSyncController *)self progress];

  if (v3)
  {
    v4 = [(BYDaemonCloudSyncController *)self progress];
    [v4 removeObserver:self forKeyPath:@"fractionCompleted"];
  }
  v5.receiver = self;
  v5.super_class = (Class)BYDaemonCloudSyncController;
  [(BYDaemonCloudSyncController *)&v5 dealloc];
}

- (void)needsToSyncClasses:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 2);
  }
}

- (void)startSync
{
  uint64_t v3 = [(BYDaemonCloudSyncController *)self progress];
  if (v3
    && (v4 = (void *)v3,
        [(BYDaemonCloudSyncController *)self progress],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isFinished],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    v12 = _BYLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "A sync is already occurring; not starting a new one...",
        buf,
        2u);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v13 = [(BYDaemonCloudSyncController *)self delegates];
    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v17);
          v19 = [(BYDaemonCloudSyncController *)self progress];
          [v19 fractionCompleted];
          objc_msgSend(v18, "syncProgress:");

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v15);
    }
  }
  else
  {
    v7 = (void *)os_transaction_create();
    [(BYDaemonCloudSyncController *)self setTransaction:v7];

    id v8 = objc_alloc_init((Class)NSMutableArray);
    [(BYDaemonCloudSyncController *)self setErrors:v8];

    v9 = +[NSProgress progressWithTotalUnitCount:2];
    [(BYDaemonCloudSyncController *)self setProgress:v9];

    [(BYDaemonCloudSyncController *)self setDaemonProgress:0];
    v10 = [(BYDaemonCloudSyncController *)self progress];
    [v10 addObserver:self forKeyPath:@"fractionCompleted" options:0 context:0];

    v11 = _BYLoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting sync...", buf, 2u);
    }

    [(BYDaemonCloudSyncController *)self startNotesSync];
    [(BYDaemonCloudSyncController *)self startDaemonSync];
  }
}

- (void)cancelSync
{
  uint64_t v3 = [(BYDaemonCloudSyncController *)self progress];

  if (v3)
  {
    v4 = [(BYDaemonCloudSyncController *)self progress];
    unsigned int v5 = [v4 isFinished];

    unsigned __int8 v6 = _BYLoggingFacility();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        id v8 = "Current sync is already completed!";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping sync...", buf, 2u);
      }

      [(BYDaemonCloudSyncController *)self cancelNotesSync];
      [(BYDaemonCloudSyncController *)self cancelDaemonSync];
      [(BYDaemonCloudSyncController *)self setProgress:0];
      unsigned __int8 v6 = +[NSError errorWithDomain:BYCloudSyncErrorDomain code:1 userInfo:0];
      long long v21 = v6;
      v9 = +[NSArray arrayWithObjects:&v21 count:1];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v10 = [(BYDaemonCloudSyncController *)self delegates];
      id v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v15 + 1) + 8 * i) syncCompletedWithErrors:v9];
          }
          id v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v12);
      }

      [(BYDaemonCloudSyncController *)self setTransaction:0];
    }
  }
  else
  {
    unsigned __int8 v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v8 = "No sync currently running";
      goto LABEL_7;
    }
  }
}

- (void)isSyncInProgress:(id)a3
{
  if (a3)
  {
    unsigned int v5 = (void (**)(id, uint64_t))((char *)a3 + 16);
    id v6 = a3;
    id v9 = [(BYDaemonCloudSyncController *)self progress];
    if (v9)
    {
      uint64_t v3 = [(BYDaemonCloudSyncController *)self progress];
      uint64_t v7 = [v3 isFinished] ^ 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v8 = [(BYDaemonCloudSyncController *)self progress];
    [v8 fractionCompleted];
    (*v5)(v6, v7);

    if (v9) {
  }
    }
}

- (void)startNotesSync
{
  uint64_t v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting sync for notes...", v7, 2u);
  }

  v4 = [(BYDaemonCloudSyncController *)self progress];
  unsigned int v5 = +[NSProgress progressWithTotalUnitCount:1 parent:v4 pendingUnitCount:1];
  [(BYDaemonCloudSyncController *)self setNotesProgress:v5];

  id v6 = [[BYNotesSyncTask alloc] initAndStartSyncWithDelegate:self];
  [(BYDaemonCloudSyncController *)self setNotesSync:v6];
}

- (void)cancelNotesSync
{
  uint64_t v3 = [(BYDaemonCloudSyncController *)self notesSync];
  [v3 cancel];

  [(BYDaemonCloudSyncController *)self setNotesSync:0];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(BYDaemonCloudSyncController *)self delegates];
  [v5 addObject:v4];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(BYDaemonCloudSyncController *)self delegates];
  [v5 removeObject:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a4;
  id v8 = [(BYDaemonCloudSyncController *)self progress];

  if (v8 == v7)
  {
    id v9 = [(BYDaemonCloudSyncController *)self progress];
    unsigned int v10 = [v9 isFinished];

    id v11 = _BYLoggingFacility();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "iCloud sync has completed!", buf, 2u);
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v13 = [(BYDaemonCloudSyncController *)self delegates];
      id v14 = [v13 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v34;
        do
        {
          long long v17 = 0;
          do
          {
            if (*(void *)v34 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v17);
            v19 = [(BYDaemonCloudSyncController *)self errors];
            [v18 syncCompletedWithErrors:v19];

            long long v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v33 objects:v40 count:16];
        }
        while (v15);
      }

      [(BYDaemonCloudSyncController *)self setTransaction:0];
    }
    else
    {
      if (v12)
      {
        long long v20 = [(BYDaemonCloudSyncController *)self progress];
        [v20 fractionCompleted];
        *(_DWORD *)buf = 134217984;
        uint64_t v39 = v21;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "iCloud sync progress: %.2f", buf, 0xCu);
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v22 = [(BYDaemonCloudSyncController *)self delegates];
      id v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v30;
        do
        {
          v26 = 0;
          do
          {
            if (*(void *)v30 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v26);
            v28 = [(BYDaemonCloudSyncController *)self progress];
            [v28 fractionCompleted];
            objc_msgSend(v27, "syncProgress:");

            v26 = (char *)v26 + 1;
          }
          while (v24 != v26);
          id v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v24);
      }
    }
  }
}

- (void)cloudKitSyncer:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a4;
  id v7 = _BYLoggingFacility();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      char v9 = _BYIsInternalInstall();
      unsigned int v10 = v6;
      if ((v9 & 1) == 0)
      {
        id v4 = [v6 domain];
        unsigned int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v4, [v6 code]);
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to upload all notes: %{public}@", buf, 0xCu);
      if ((v9 & 1) == 0)
      {
      }
    }

    id v7 = [(BYDaemonCloudSyncController *)self errors];
    id v11 = +[NSError errorWithDomain:BYCloudSyncErrorDomain code:2 userInfo:0];
    [v7 addObject:v11];
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully uploaded all notes", buf, 2u);
  }

  BOOL v12 = [(BYDaemonCloudSyncController *)self notesProgress];
  id v13 = [v12 totalUnitCount];
  id v14 = [(BYDaemonCloudSyncController *)self notesProgress];
  [v14 setCompletedUnitCount:v13];
}

- (void)cloudKitSyncer:(id)a3 didUpdateProgress:(double)a4
{
  uint64_t v5 = (uint64_t)a4;
  id v6 = [(BYDaemonCloudSyncController *)self notesProgress];
  [v6 setCompletedUnitCount:v5];

  id v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [(BYDaemonCloudSyncController *)self notesProgress];
    [v8 fractionCompleted];
    int v10 = 134217984;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notes progress: %.2f", (uint8_t *)&v10, 0xCu);
  }
}

- (void)startDaemonSync
{
  v2 = [sub_10000E4FC() userContext];
  uint64_t v3 = [sub_10000E5E0() keyPathWithKey:@"/backup/userRequested"];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:v3];
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Daemon sync initiated", v5, 2u);
  }
}

- (void)cancelDaemonSync
{
  uint64_t v3 = [sub_10000E4FC() userContext];
  id v4 = [sub_10000E5E0() keyPathWithKey:@"/backup/userRequested"];
  [v3 setObject:&__kCFBooleanFalse forKeyedSubscript:v4];
  [(BYDaemonCloudSyncController *)self setDaemonProgress:0];
  uint64_t v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Daemon sync cancelled", v6, 2u);
  }
}

- (void)cloudSyncProgressUpdate:(int64_t)a3 completedClients:(int64_t)a4 errors:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(BYDaemonCloudSyncController *)self daemonProgress];

  if (a3 >= 1 && !v9)
  {
    int v10 = [(BYDaemonCloudSyncController *)self progress];
    uint64_t v11 = +[NSProgress progressWithTotalUnitCount:a3 parent:v10 pendingUnitCount:1];
    [(BYDaemonCloudSyncController *)self setDaemonProgress:v11];
  }
  id v12 = [v8 count];
  id v13 = _BYLoggingFacility();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v14) {
      goto LABEL_10;
    }
    int v21 = 134218754;
    int64_t v22 = a4;
    __int16 v23 = 2048;
    int64_t v24 = a3;
    __int16 v25 = 2048;
    id v26 = [v8 count];
    __int16 v27 = 2112;
    id v28 = v8;
    id v15 = "Daemon sync progress update %ld of %ld completed with %ld errors: %@";
    uint64_t v16 = v13;
    uint32_t v17 = 42;
  }
  else
  {
    if (!v14) {
      goto LABEL_10;
    }
    int v21 = 134218240;
    int64_t v22 = a4;
    __int16 v23 = 2048;
    int64_t v24 = a3;
    id v15 = "Daemon sync progress update %ld of %ld completed.";
    uint64_t v16 = v13;
    uint32_t v17 = 22;
  }
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v21, v17);
LABEL_10:

  if (a3 < 1)
  {
    long long v20 = [(BYDaemonCloudSyncController *)self progress];
    objc_msgSend(v20, "setCompletedUnitCount:", (char *)objc_msgSend(v20, "completedUnitCount") + 1);
    goto LABEL_15;
  }
  long long v18 = (char *)[v8 count] + a4;
  v19 = [(BYDaemonCloudSyncController *)self daemonProgress];
  [v19 setCompletedUnitCount:v18];

  if (v18 == (char *)a3 && [v8 count])
  {
    long long v20 = [(BYDaemonCloudSyncController *)self errors];
    [v20 addObjectsFromArray:v8];
LABEL_15:
  }
}

- (NSMutableArray)delegates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegates:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransaction:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProgress:(id)a3
{
}

- (NSMutableArray)errors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setErrors:(id)a3
{
}

- (BYNotesSyncTask)notesSync
{
  return (BYNotesSyncTask *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNotesSync:(id)a3
{
}

- (NSProgress)notesProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNotesProgress:(id)a3
{
}

- (NSProgress)daemonProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDaemonProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonProgress, 0);
  objc_storeStrong((id *)&self->_notesProgress, 0);
  objc_storeStrong((id *)&self->_notesSync, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end