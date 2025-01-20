@interface MLDClientImportServiceSession
- (MLDClientImportServiceSession)initWithConnection:(id)a3;
- (void)_addItems:(id)a3;
- (void)_adjustProgressForIncomingOperationCount:(unint64_t)a3;
- (void)_beginSessionWithConfiguration:(id)a3;
- (void)_endSessionCommittingChanges:(id)a3;
- (void)_removeItems:(id)a3;
- (void)_reportProgress;
- (void)_startImportThread;
- (void)_updateItems:(id)a3;
- (void)addItems:(id)a3 completion:(id)a4;
- (void)beginSessionWithConfiguration:(id)a3 completion:(id)a4;
- (void)cancelSessionWithCompletion:(id)a3;
- (void)endSessionWithCompletion:(id)a3;
- (void)removeItems:(id)a3 completion:(id)a4;
- (void)stop;
- (void)updateItems:(id)a3 completion:(id)a4;
@end

@implementation MLDClientImportServiceSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importSessionRunLoop, 0);
  objc_storeStrong((id *)&self->_currentResult, 0);
  objc_storeStrong((id *)&self->_importSession, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_importSessionThread, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)_reportProgress
{
  unint64_t completedOperationCount = self->_completedOperationCount;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * completedOperationCount, 1) <= 0x1999999999999999uLL)
  {
    unint64_t totalOperationCount = self->_totalOperationCount;
    xpcConnection = self->_xpcConnection;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100018F70;
    v7[3] = &unk_10002D818;
    v7[4] = self;
    v5 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v7];
    *(float *)&double v6 = (float)completedOperationCount / (float)totalOperationCount;
    [v5 sessionDidUpdateProgress:v6];
  }
}

- (void)_adjustProgressForIncomingOperationCount:(unint64_t)a3
{
  unint64_t v3 = self->_completedOperationCount + a3;
  if (v3 > self->_totalOperationCount) {
    self->_unint64_t totalOperationCount = v3;
  }
}

- (void)_removeItems:(id)a3
{
  id v4 = a3;
  v19 = v4;
  if (self->_importSession)
  {
    -[MLDClientImportServiceSession _adjustProgressForIncomingOperationCount:](self, "_adjustProgressForIncomingOperationCount:", [v4 count]);
    v20 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v19 count]);
    long long v27 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    id v5 = v19;
    id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          importSession = self->_importSession;
          id v23 = 0;
          unsigned int v11 = [(ML3ClientImportServiceSession *)importSession removeTrack:v9 persistentID:&v23];
          id v12 = v23;
          self->_success = v11;
          if (v11)
          {
            [v20 setObject:v12 forKey:v9];
          }
          else
          {
            v13 = os_log_create("com.apple.amp.medialibraryd", "Default");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v30 = self;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove track", buf, 0xCu);
            }

            xpcConnection = self->_xpcConnection;
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_100019430;
            v22[3] = &unk_10002D818;
            v22[4] = self;
            v15 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v22];
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_100019508;
            v21[3] = &unk_10002D840;
            v21[4] = self;
            [v15 sessionFailedToUpdateItem:v9 completion:v21];
          }
          if (!self->_success)
          {

            goto LABEL_17;
          }
          ++self->_completedOperationCount;
          [(MLDClientImportServiceSession *)self _reportProgress];
        }
        id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    v16 = (ML3ClientImportResult *)[objc_alloc((Class)ML3ClientImportResult) initWithSuccess:self->_success resultingDatabasePersistentIDs:v20];
    currentResult = self->_currentResult;
    self->_currentResult = v16;
  }
  else
  {
    v18 = os_log_create("com.apple.amp.medialibraryd", "Default");
    v20 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@ removeItems called without an active import session", buf, 0xCu);
    }
  }
}

- (void)_updateItems:(id)a3
{
  id v4 = a3;
  v19 = v4;
  if (self->_importSession)
  {
    -[MLDClientImportServiceSession _adjustProgressForIncomingOperationCount:](self, "_adjustProgressForIncomingOperationCount:", [v4 count]);
    v20 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v19 count]);
    long long v27 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    id v5 = v19;
    id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          importSession = self->_importSession;
          id v23 = 0;
          unsigned int v11 = [(ML3ClientImportServiceSession *)importSession updateTrack:v9 persistentID:&v23];
          id v12 = v23;
          self->_success = v11;
          if (v11)
          {
            [v20 setObject:v12 forKey:v9];
          }
          else
          {
            v13 = os_log_create("com.apple.amp.medialibraryd", "Default");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v30 = self;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update track", buf, 0xCu);
            }

            xpcConnection = self->_xpcConnection;
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_1000199C0;
            v22[3] = &unk_10002D818;
            v22[4] = self;
            v15 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v22];
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_100019A98;
            v21[3] = &unk_10002D840;
            v21[4] = self;
            [v15 sessionFailedToUpdateItem:v9 completion:v21];
          }
          if (!self->_success)
          {

            goto LABEL_17;
          }
          ++self->_completedOperationCount;
          [(MLDClientImportServiceSession *)self _reportProgress];
        }
        id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    v16 = (ML3ClientImportResult *)[objc_alloc((Class)ML3ClientImportResult) initWithSuccess:self->_success resultingDatabasePersistentIDs:v20];
    currentResult = self->_currentResult;
    self->_currentResult = v16;
  }
  else
  {
    v18 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@ updateItems called without an active import session", buf, 0xCu);
    }

    self->_success = 0;
  }
}

- (void)_addItems:(id)a3
{
  id v4 = a3;
  v19 = v4;
  if (self->_importSession)
  {
    -[MLDClientImportServiceSession _adjustProgressForIncomingOperationCount:](self, "_adjustProgressForIncomingOperationCount:", [v4 count]);
    v20 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v19 count]);
    long long v27 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    id v5 = v19;
    id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          importSession = self->_importSession;
          id v23 = 0;
          unsigned int v11 = [(ML3ClientImportServiceSession *)importSession addTrack:v9 persistentID:&v23];
          id v12 = v23;
          self->_success = v11;
          if (v11)
          {
            [v20 setObject:v12 forKey:v9];
          }
          else
          {
            v13 = os_log_create("com.apple.amp.medialibraryd", "Default");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v30 = self;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to add track", buf, 0xCu);
            }

            xpcConnection = self->_xpcConnection;
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_100019F50;
            v22[3] = &unk_10002D818;
            v22[4] = self;
            v15 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:v22];
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_10001A028;
            v21[3] = &unk_10002D840;
            v21[4] = self;
            [v15 sessionFailedToAddItem:v9 completion:v21];
          }
          if (!self->_success)
          {

            goto LABEL_17;
          }
          ++self->_completedOperationCount;
          [(MLDClientImportServiceSession *)self _reportProgress];
        }
        id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    v16 = (ML3ClientImportResult *)[objc_alloc((Class)ML3ClientImportResult) initWithSuccess:self->_success resultingDatabasePersistentIDs:v20];
    currentResult = self->_currentResult;
    self->_currentResult = v16;
  }
  else
  {
    v18 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@ addItems called without an active import session", buf, 0xCu);
    }

    self->_success = 0;
  }
}

- (void)_endSessionCommittingChanges:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 BOOLValue];
  if (self->_importSession)
  {
    id v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      __int16 v18 = 1024;
      LODWORD(v19) = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Finishing import session. shouldCommit=%{BOOL}u", buf, 0x12u);
    }

    if (v5)
    {
      unsigned __int8 v7 = [(ML3ClientImportServiceSession *)self->_importSession finish];
      self->_success = v7;
      if (v7)
      {
        uint64_t v5 = 1;
      }
      else
      {
        v8 = os_log_create("com.apple.amp.medialibraryd", "Default");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v17 = self;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to finish import session", buf, 0xCu);
        }

        uint64_t v5 = 0;
      }
    }
    importSession = self->_importSession;
    self->_importSession = 0;
  }
  if (self->_transaction)
  {
    v10 = +[MLDMediaLibraryService sharedInstance];
    unsigned int v11 = [(ML3ActiveTransaction *)self->_transaction identifier];
    id v15 = 0;
    unsigned __int8 v12 = [v10 endTransaction:v11 shouldCommit:v5 error:&v15];
    id v13 = v15;
    self->_success = v12;

    if ((v12 & 1) == 0)
    {
      v14 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v17 = self;
        __int16 v18 = 2114;
        id v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to end transaction. err=%{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_beginSessionWithConfiguration:(id)a3
{
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting import session", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_configuration, a3);
  self->_unint64_t totalOperationCount = (unint64_t)[(ML3ClientImportSessionConfiguration *)self->_configuration operationCount];
  id v7 = objc_alloc((Class)MLTransactionContext);
  v8 = [v5 privacyContext];
  uint64_t v9 = [v5 libraryPath];
  id v10 = [v7 initWithPrivacyContext:v8 path:v9 priorityLevel:1 options:0];

  unsigned int v11 = +[MLDMediaLibraryService sharedInstance];
  id v23 = 0;
  unsigned __int8 v12 = [v11 beginTransactionForDatabaseWithContext:v10 error:&v23];
  id v13 = v23;
  transaction = self->_transaction;
  self->_transaction = v12;

  if (self->_transaction)
  {
    id v15 = objc_alloc((Class)ML3ClientImportServiceSession);
    v16 = [(ML3ActiveTransaction *)self->_transaction library];
    v17 = [(ML3ActiveTransaction *)self->_transaction connection];
    __int16 v18 = (ML3ClientImportServiceSession *)[v15 initWithLibrary:v16 connection:v17 configuration:self->_configuration];
    importSession = self->_importSession;
    self->_importSession = v18;

    unsigned __int8 v20 = [(ML3ClientImportServiceSession *)self->_importSession begin];
    self->_success = v20;
    if ((v20 & 1) == 0)
    {
      v21 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v25 = self;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to begin import session", buf, 0xCu);
      }

      [(MLDClientImportServiceSession *)self _endSessionCommittingChanges:&__kCFBooleanFalse];
    }
  }
  else
  {
    v22 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      long long v25 = self;
      __int16 v26 = 2114;
      id v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to start transaction. err=%{public}@", buf, 0x16u);
    }

    self->_success = 0;
  }
}

- (void)_startImportThread
{
  unint64_t v3 = +[NSRunLoop currentRunLoop];
  importSessionRunLoop = self->_importSessionRunLoop;
  self->_importSessionRunLoop = v3;

  while (self->_active)
  {
    id v5 = self->_importSessionRunLoop;
    id v6 = +[NSDate distantFuture];
    [(NSRunLoop *)v5 runMode:NSDefaultRunLoopMode beforeDate:v6];
  }
}

- (void)removeItems:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, ML3ClientImportResult *, void *))a4;
  [(MLDClientImportServiceSession *)self performSelector:"_removeItems:" onThread:self->_importSessionThread withObject:v10 waitUntilDone:1];
  currentResult = self->_currentResult;
  BOOL success = self->_success;
  if (self->_success)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = +[NSError ml_errorWithCode:0 description:@"failed to remove import items"];
  }
  v6[2](v6, currentResult, v9);
  if (!success) {
}
  }

- (void)updateItems:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, ML3ClientImportResult *, void *))a4;
  [(MLDClientImportServiceSession *)self performSelector:"_updateItems:" onThread:self->_importSessionThread withObject:v10 waitUntilDone:1];
  currentResult = self->_currentResult;
  BOOL success = self->_success;
  if (self->_success)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = +[NSError ml_errorWithCode:0 description:@"failed to update import items"];
  }
  v6[2](v6, currentResult, v9);
  if (!success) {
}
  }

- (void)addItems:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, ML3ClientImportResult *, void *))a4;
  [(MLDClientImportServiceSession *)self performSelector:"_addItems:" onThread:self->_importSessionThread withObject:v10 waitUntilDone:1];
  currentResult = self->_currentResult;
  BOOL success = self->_success;
  if (self->_success)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = +[NSError ml_errorWithCode:0 description:@"failed to add import items"];
  }
  v6[2](v6, currentResult, v9);
  if (!success) {
}
  }

- (void)cancelSessionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  [(MLDClientImportServiceSession *)self performSelector:"_endSessionCommittingChanges:" onThread:self->_importSessionThread withObject:&__kCFBooleanFalse waitUntilDone:1];
  v4[2](v4, 0);
}

- (void)endSessionWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  [(MLDClientImportServiceSession *)self performSelector:"_endSessionCommittingChanges:" onThread:self->_importSessionThread withObject:&__kCFBooleanTrue waitUntilDone:1];
  BOOL success = self->_success;
  if (self->_success)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[NSError ml_errorWithCode:0 description:@"failed to commit import session"];
  }
  v6[2](v6, v5);
  if (!success) {
}
  }

- (void)beginSessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void *))a4;
  [(MLDClientImportServiceSession *)self performSelector:"_beginSessionWithConfiguration:" onThread:self->_importSessionThread withObject:v9 waitUntilDone:1];
  BOOL success = self->_success;
  if (self->_success)
  {
    v8 = 0;
  }
  else
  {
    v8 = +[NSError ml_errorWithCode:0 description:@"failed to start import session"];
  }
  v6[2](v6, v8);
  if (!success) {
}
  }

- (void)stop
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001AD20;
  v2[3] = &unk_10002D818;
  v2[4] = self;
  [(MLDClientImportServiceSession *)self cancelSessionWithCompletion:v2];
}

- (MLDClientImportServiceSession)initWithConnection:(id)a3
{
  id v5 = a3;
  id v6 = [(MLDClientImportServiceSession *)self init];
  id v7 = v6;
  if (v6)
  {
    v6->_active = 1;
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v8 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:v7 selector:"_startImportThread" object:0];
    importSessionThread = v7->_importSessionThread;
    v7->_importSessionThread = v8;

    [(NSThread *)v7->_importSessionThread setQualityOfService:25];
    [(NSThread *)v7->_importSessionThread start];
  }

  return v7;
}

@end