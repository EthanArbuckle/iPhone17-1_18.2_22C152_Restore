@interface MLDMediaLibraryService
+ (id)sharedInstance;
- (BOOL)_isMediaPath:(id)a3 selector:(SEL)a4 resolvedPath:(id *)a5;
- (BOOL)_platformSupportsSiriIndexing;
- (BOOL)_platformSupportsSpotlightIndexing;
- (BOOL)_shouldAcceptConnectionForMediaLibraryService:(id)a3;
- (BOOL)_validateTransactionIdentifier:(id)a3 forClient:(id)a4;
- (BOOL)endTransaction:(id)a3 shouldCommit:(BOOL)a4 error:(id *)a5;
- (BOOL)isDatabaseLocked;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MLDMediaLibraryService)init;
- (id)_XPCListenerForService:(int64_t)a3;
- (id)_allMediaLibraries;
- (id)_clientForConnection:(id)a3;
- (id)_currentXPCClient;
- (id)_deviceSharedLibraryPath;
- (id)_generateSecurityScopedURLWrapperForItemPid:(unint64_t)a3 withLibrary:(id)a4 error:(id *)a5;
- (id)_init;
- (id)_mediaLibraryForPath:(id)a3;
- (id)_stateDump;
- (id)beginTransactionForDatabaseWithContext:(id)a3 error:(id *)a4;
- (int64_t)_MLDSupportedServiceForXPCListener:(id)a3;
- (int64_t)currentLockReason;
- (void)_disconnectLibraries:(id)a3;
- (void)_handleDebugSignal;
- (void)_handleLibraryDidChangeNotification:(id)a3;
- (void)_handleXPCDisconnect:(id)a3;
- (void)_idleTimerFired:(id)a3;
- (void)_logPrivacyAccessWithTransactionIdentifier:(id)a3;
- (void)_performDiagnosticWithReason:(id)a3;
- (void)_performMaintenanceOnDatabaseAtPath:(id)a3 withActivity:(id)a4 completion:(id)a5;
- (void)_reconnectLibraries:(id)a3;
- (void)_registerForLibraryDidChangeNotifications;
- (void)_registerTransactionInfo:(id)a3 forIdentitifer:(id)a4;
- (void)_resetIdleTimer;
- (void)_setupActivityHandlers;
- (void)_setupCacheDeleteController;
- (void)_setupNotifyEventHandlers;
- (void)_setupSignalHandler;
- (void)_startIdleTimer;
- (void)_stopIdleTimer;
- (void)_tearDownLibraryDidChangeNotifications;
- (void)_tearDownSignalHandler;
- (void)_unregisterServiceOriginatedTransactionWithConnection:(id)a3;
- (void)_unregisterTransactionInfoForIdentifier:(id)a3;
- (void)_updateMultiUserPurgeabilityForPrimaryLibraryPath:(id)a3;
- (void)_updateSiriIndexForNotification:(id)a3;
- (void)_updateSiriIndexMetadataForLibraryAtPath:(id)a3 completion:(id)a4;
- (void)_updateSpotlightIndexForNotification:(id)a3;
- (void)_validateDatabaseAtPath:(id)a3 byTruncatingFirst:(BOOL)a4 withCompletion:(id)a5;
- (void)_validateDatabaseAtPath:(id)a3 forConnection:(id)a4 byTruncatingFirst:(BOOL)a5 withCompletion:(id)a6;
- (void)_writeDiagnosticToDisk:(id)a3;
- (void)attemptDatabaseFileRecoveryAtPath:(id)a3 withCompletionHandler:(id)a4;
- (void)beginTransactionForDatabaseWithContext:(id)a3 completionHandler:(id)a4;
- (void)cancelImportOperation:(unint64_t)a3 completionHandler:(id)a4;
- (void)checkIntegrityOfDatabaseAtPath:(id)a3 repairFaults:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)emergencyDisconnectWithCompletion:(id)a3;
- (void)endTransaction:(id)a3 shouldCommit:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)executeQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 withCompletionHandler:(id)a7;
- (void)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 withCompletionHandler:(id)a6;
- (void)faultForQuery:(id)a3 fromClientBundleID:(id)a4 onTrustError:(id)a5;
- (void)getClientImportServiceListenerEndpointWithCompletion:(id)a3;
- (void)getLanguageResourcesWithCompletion:(id)a3;
- (void)getMediaLibraryResourcesServiceListenerEndpointWithCompletion:(id)a3;
- (void)library:(id)a3 didBeginDatabaseTransactionWithConnection:(id)a4;
- (void)library:(id)a3 didCommitDatabaseTransactionWithConnection:(id)a4;
- (void)library:(id)a3 didRollbackDatabaseTransactionWithConnection:(id)a4;
- (void)lockDatabaseForReason:(int64_t)a3 withCompletion:(id)a4;
- (void)mediaLibraryWriter:(id)a3 terminatedTransaction:(id)a4 withError:(id)a5;
- (void)performDatabaseOperation:(unint64_t)a3 withAttributes:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)performDatabasePathChange:(id)a3 completion:(id)a4;
- (void)performDiagnosticWithCompletionHandler:(id)a3;
- (void)performImport:(id)a3 fromSource:(unint64_t)a4 withUUID:(id)a5 completionHandler:(id)a6;
- (void)performMaintenanceTasksForDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4;
- (void)recreateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4;
- (void)securityScopedURLWrapperForItemPid:(unint64_t)a3 withDatabasePath:(id)a4 completionHandler:(id)a5;
- (void)setCurrentLockReason:(int64_t)a3;
- (void)setDatabaseLocked:(BOOL)a3;
- (void)setOptions:(id)a3 withCompletionHandler:(id)a4;
- (void)start;
- (void)unlockDatabaseWithCompletion:(id)a3;
- (void)updateSiriIndexMetadataForAllLibrariesWithCompletion:(id)a3;
- (void)updateSpotlightIndexForBundleID:(id)a3 withCompletion:(id)a4;
- (void)updateSpotlightIndexMetadataForItemsWithIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5;
- (void)validateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation MLDMediaLibraryService

- (int64_t)_MLDSupportedServiceForXPCListener:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007B10;
  v6[3] = &unk_10002D5F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  memset(buf, 0, 32);
  int v9 = TCCAccessCheckAuditToken();
  uint64_t v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
  os_log_t v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = [v8 processIdentifier];
      v13 = "Refusing connection from pid: %d, TCC not granted";
      v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
      uint32_t v16 = 8;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
    }
LABEL_13:

    BOOL v12 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Received request from listener %{public}@ for connection %{public}@", buf, 0x20u);
  }

  if ((id)[(MLDMediaLibraryService *)self _MLDSupportedServiceForXPCListener:v6] != (id)1)
  {
    os_log_t v11 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v6;
      v13 = "%{public}@ Ignoring connection %{public}@ from listener %{public}@";
      v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 32;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  BOOL v12 = [(MLDMediaLibraryService *)self _shouldAcceptConnectionForMediaLibraryService:v8];
LABEL_14:

  return v12;
}

- (void)getLanguageResourcesWithCompletion:(id)a3
{
  if (a3)
  {
    int64_t v4 = (void (**)(id, void *, void))a3;
    v5 = +[NSXPCConnection currentConnection];
    id v6 = v5;
    if (v5)
    {
      [v5 auditToken];
      id v7 = MSVBundleIDForAuditToken();
    }
    else
    {
      v8 = +[NSBundle mainBundle];
      id v7 = [v8 bundleIdentifier];
    }
    int v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received language resources request from %{public}@", buf, 0xCu);
    }

    [(MLDMediaLibraryService *)self _resetIdleTimer];
    uint64_t v10 = +[ML3LanguageResourceManager sharedResourceManager];
    os_log_t v11 = [v10 resources];
    v4[2](v4, v11, 0);
  }
}

- (void)endTransaction:(id)a3 shouldCommit:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = (void (**)(id, id, id))a5;
  uint64_t v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v11 = +[NSXPCConnection currentConnection];
    *(_DWORD *)buf = 138543362;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Received end transaction request on client connection: %{public}@", buf, 0xCu);
  }
  writer = self->_writer;
  id v15 = 0;
  id v13 = [(ML3MediaLibraryWriter *)writer endTransaction:v8 shouldCommit:v6 error:&v15];
  id v14 = v15;
  if (v9) {
    v9[2](v9, v13, v14);
  }
  [(MLDMediaLibraryService *)self _unregisterTransactionInfoForIdentifier:v8];
}

- (void)_unregisterTransactionInfoForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000059FC;
    v7[3] = &unk_10002D8A8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(serialQueue, v7);
  }
}

- (BOOL)_shouldAcceptConnectionForMediaLibraryService:(id)a3
{
  id v4 = a3;
  [v4 setExportedObject:self];
  v5 = +[MLMediaLibraryServiceInterface serviceInterface];
  [v4 setExportedInterface:v5];

  BOOL v6 = +[MLMediaLibraryServiceInterface clientInterface];
  [v4 setRemoteObjectInterface:v6];

  [v4 setDelegate:self];
  objc_msgSend(v4, "ml_setValid:", 1);
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000141C8;
  v20[3] = &unk_10002D4B8;
  objc_copyWeak(&v21, &from);
  objc_copyWeak(&v22, &location);
  [v4 setInvalidationHandler:v20];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint32_t v16 = sub_1000142B0;
  v17 = &unk_10002D4B8;
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &location);
  [v4 setInterruptionHandler:&v14];
  id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = self;
    __int16 v27 = 2114;
    id v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Listener accepted new connection %{public}@", buf, 0x16u);
  }

  id v8 = objc_alloc((Class)ML3Client);
  id v9 = objc_msgSend(v8, "initWithConnection:", v4, v14, v15, v16, v17);
  p_xpcLock = &self->_xpcLock;
  os_unfair_lock_lock(&self->_xpcLock);
  xpcClients = self->_xpcClients;
  BOOL v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 processIdentifier]);
  [(NSMutableDictionary *)xpcClients setObject:v9 forKey:v12];

  os_unfair_lock_unlock(p_xpcLock);
  [v4 resume];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (void)faultForQuery:(id)a3 fromClientBundleID:(id)a4 onTrustError:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"action"];
  id v11 = [v10 integerValue];

  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100010EC4;
    v13[3] = &unk_10002D7F0;
    id v14 = v7;
    id v16 = v11;
    id v15 = v8;
    BOOL v12 = objc_retainBlock(v13);
    sub_100011024((uint64_t)v12);
  }
}

- (void)_logPrivacyAccessWithTransactionIdentifier:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005AF0;
  v7[3] = &unk_10002D8A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_validateDatabaseAtPath:(id)a3 forConnection:(id)a4 byTruncatingFirst:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  if (v10)
  {
    pid_t v13 = [v10 processIdentifier];
    [v10 auditToken];
    id v14 = MSVBundleIDForAuditToken();
  }
  else
  {
    pid_t v13 = getpid();
    id v15 = +[NSBundle mainBundle];
    id v14 = [v15 bundleIdentifier];
  }
  id v16 = objc_alloc((Class)MSVXPCTransaction);
  v17 = +[NSString stringWithFormat:@"Validation request from %@ (%ld) for library at path: %@", v14, v13, v12];
  id v18 = [v16 initWithName:v17];

  [v18 beginTransaction];
  id v19 = [(MLDMediaLibraryService *)self _mediaLibraryForPath:v12];

  validationController = self->_validationController;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100006030;
  v23[3] = &unk_10002D780;
  id v24 = v18;
  id v25 = v11;
  id v21 = v18;
  id v22 = v11;
  [(MLDDatabaseValidationController *)validationController validateMusicLibrary:v19 shouldTruncateDatabase:v7 completion:v23];
}

- (id)_mediaLibraryForPath:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.medialibraryd", "Default_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mediaLibraries = self->_mediaLibraries;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2114;
    id v15 = (uint64_t (*)(uint64_t, uint64_t))mediaLibraries;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Path: %{public}@, _mediaLibraries=%{public}@", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v15 = sub_100012BEC;
  id v16 = sub_100012BFC;
  id v17 = 0;
  if (v4)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004C58;
    block[3] = &unk_10002D620;
    pid_t v13 = buf;
    block[4] = self;
    id v12 = v4;
    dispatch_sync(serialQueue, block);

    id v8 = *(void **)(*(void *)&buf[8] + 40);
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;
  _Block_object_dispose(buf, 8);

  return v9;
}

- (void)beginTransactionForDatabaseWithContext:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 path];
  id v10 = [v7 priorityLevel];
  id v11 = [v7 options];
  id v12 = [(MLDMediaLibraryService *)self _currentXPCClient];
  pid_t v13 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Received begin transaction request on client: %{public}@", buf, 0xCu);
  }

  id v41 = 0;
  unsigned __int8 v14 = [(MLDMediaLibraryService *)self _isMediaPath:v9 selector:a2 resolvedPath:&v41];
  id v15 = v41;
  id v16 = v15;
  if (v14)
  {
    if (v8)
    {
      if (v15)
      {
        uint64_t v17 = +[NSString stringWithFormat:@"Database transaction for library at path: %@", v15];
        id v29 = v11;
        if ((v11 & 2) != 0)
        {
          v30 = 0;
        }
        else
        {
          [(MLDTaskAssertion *)v12 processID];
          id v28 = ML3ProcessHandleFromPID();
          if ([v28 isDaemon])
          {
            id v18 = os_log_create("com.apple.amp.medialibraryd", "Service");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v12;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Skipping taking task assertion for daemon client process %{public}@", buf, 0xCu);
            }
            v30 = 0;
          }
          else
          {
            v31 = [MLDTaskAssertion alloc];
            __int16 v27 = +[NSString stringWithFormat:@"Finish Task Assertion, %@", v17];
            unsigned int v26 = [(MLDTaskAssertion *)v12 processID];
            v20 = [(MLDTaskAssertion *)v12 bundleID];
            v30 = [(MLDTaskAssertion *)v31 initWithName:v27 pid:v26 bundleID:v20];

            id v18 = os_log_create("com.apple.amp.medialibraryd", "Service");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v30;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Taking task assertion %{public}@", buf, 0xCu);
            }
          }
        }
        id v21 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v17];
        [v21 beginTransaction];
        if (v10 && [(ML3DatabaseImportManager *)self->_importManager operationsCount])
        {
          id v22 = os_log_create("com.apple.amp.medialibraryd", "Service");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Suspending current import operations for higher priority client transaction.", buf, 2u);
          }

          [(ML3DatabaseImportManager *)self->_importManager suspendImportOperations];
          [(MLDMediaLibraryService *)self _startIdleTimer];
        }
        else
        {
          [(MLDMediaLibraryService *)self _resetIdleTimer];
        }
        v23 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Validating database before starting transaction", buf, 2u);
        }

        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100006078;
        v32[3] = &unk_10002D238;
        v32[4] = self;
        id v33 = v16;
        v34 = v12;
        id v39 = v29;
        SEL v40 = a2;
        id v38 = v8;
        id v35 = v21;
        v36 = v30;
        id v37 = v7;
        id v24 = v30;
        id v25 = v21;
        [(MLDMediaLibraryService *)self validateDatabaseAtPath:v33 withCompletionHandler:v32];
      }
      else
      {
        uint64_t v17 = +[ML3MediaLibraryWriter writerErrorWithCode:200 description:@"No database path provided to start the transaction."];
        (*((void (**)(id, void, uint64_t))v8 + 2))(v8, 0, v17);
      }
      goto LABEL_30;
    }
    uint64_t v17 = (uint64_t)os_log_create("com.apple.amp.medialibraryd", "Default");
    if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
LABEL_30:

      goto LABEL_31;
    }
    id v19 = [(MLDTaskAssertion *)v12 bundleID];
    *(_DWORD *)buf = 138543362;
    v43 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_ERROR, "Warning: %{public}@ attempted to begin a transaction without a completion handler. MLWriter will deadlock without a way to give identifier back to client.", buf, 0xCu);
LABEL_15:

    goto LABEL_30;
  }
  if (v8)
  {
    uint64_t v17 = (uint64_t)objc_retainBlock(v8);
    id v19 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:195935908 userInfo:0];
    (*(void (**)(uint64_t, void, MLDTaskAssertion *, void))(v17 + 16))(v17, 0, v19, 0);
    goto LABEL_15;
  }
LABEL_31:
}

- (void)_resetIdleTimer
{
  if (self->_idleTimer)
  {
    v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Resetting idle timer", v6, 2u);
    }

    idleTimer = self->_idleTimer;
    v5 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
    [(NSTimer *)idleTimer setFireDate:v5];
  }
}

- (BOOL)_isMediaPath:(id)a3 selector:(SEL)a4 resolvedPath:(id *)a5
{
  id v9 = a3;
  if (!a5)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2, self, @"MLDMediaLibraryService.m", 1831, @"Invalid parameter not satisfying: %@", @"resolvedPath" object file lineNumber description];
  }
  id v10 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
  if ([v9 isEqualToString:v10])
  {
    id v11 = v9;
    *a5 = v11;
    BOOL v12 = 1;
  }
  else
  {
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    pid_t v13 = +[ML3MusicLibrary allLibraryContainerPaths];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000113CC;
    v24[3] = &unk_10002D7C8;
    id v14 = v9;
    id v25 = v14;
    unsigned int v26 = &v27;
    [v13 enumerateObjectsUsingBlock:v24];

    if (*((unsigned char *)v28 + 24))
    {
      id v11 = v14;
      *a5 = v11;
      BOOL v12 = 1;
    }
    else
    {
      id v15 = objc_msgSend(v14, "msv_stringByResolvingRealPath");

      id v11 = v15;
      *a5 = v11;
      id v16 = +[ML3MusicLibrary mediaFolderPath];
      uint64_t v17 = objc_msgSend(v16, "msv_stringByResolvingRealPath");

      if ([v11 hasPrefix:v17]
        && ([v11 hasSuffix:@"iTunes_Control/iTunes/MediaLibrary.sqlitedb"] & 1) != 0
        || [(MLDDatabaseValidationController *)self->_validationController isValidatedPath:v11])
      {
        BOOL v12 = 1;
      }
      else
      {
        id v18 = [(MLDMediaLibraryService *)self _currentXPCClient];
        id v19 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          NSStringFromSelector(a4);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          id v21 = [v18 bundleID];
          *(_DWORD *)buf = 138543874;
          id v32 = v20;
          __int16 v33 = 2114;
          v34 = v21;
          __int16 v35 = 2114;
          id v36 = v11;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "%{public}@: not opening database [invalid path] bundleID=%{public}@ path=%{public}@", buf, 0x20u);
        }
        BOOL v12 = 0;
      }
    }
    _Block_object_dispose(&v27, 8);
  }

  return v12;
}

- (void)validateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received database validation request on client connection: %{public}@ - path: %{public}@", buf, 0x16u);
  }

  id v15 = 0;
  unsigned __int8 v11 = [(MLDMediaLibraryService *)self _isMediaPath:v7 selector:a2 resolvedPath:&v15];
  id v12 = v15;
  if (v11)
  {
    [(MLDMediaLibraryService *)self _validateDatabaseAtPath:v12 forConnection:v9 byTruncatingFirst:0 withCompletion:v8];
  }
  else if (v8)
  {
    id v13 = objc_retainBlock(v8);
    id v14 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:195935908 userInfo:0];
    (*((void (**)(id, void, void *, void))v13 + 2))(v13, 0, v14, 0);
  }
}

- (void)executeUpdate:(id)a3 withParameters:(id)a4 onTransaction:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v15 = +[NSXPCConnection currentConnection];
    *(_DWORD *)buf = 138543362;
    id v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Received database update request on client connection: %{public}@", buf, 0xCu);
  }
  id v16 = [(MLDMediaLibraryService *)self _currentXPCClient];
  if ([(MLDMediaLibraryService *)self _validateTransactionIdentifier:v12 forClient:v16])
  {
    [(MLDMediaLibraryService *)self _resetIdleTimer];
    uint64_t v17 = [(MLDMediaLibraryService *)self _currentXPCClient];
    __int16 v18 = [v17 bundleID];

    writerUpdateQueue = self->_writerUpdateQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000555C;
    v21[3] = &unk_10002D2B0;
    v21[4] = self;
    id v22 = v12;
    id v23 = v10;
    id v24 = v11;
    id v25 = v18;
    id v26 = v13;
    id v20 = v18;
    dispatch_async(writerUpdateQueue, v21);
  }
  else
  {
    id v20 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:2002 userInfo:0];
    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v20);
  }
}

- (id)_currentXPCClient
{
  v3 = +[NSXPCConnection currentConnection];
  if (v3) {
    [(MLDMediaLibraryService *)self _clientForConnection:v3];
  }
  else {
  id v4 = +[ML3Client daemonClient];
  }

  return v4;
}

- (id)_clientForConnection:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 processIdentifier];
  if (v5 == getpid())
  {
    id v6 = +[ML3Client daemonClient];
  }
  else
  {
    os_unfair_lock_lock(&self->_xpcLock);
    id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 processIdentifier]);
    id v6 = [(NSMutableDictionary *)self->_xpcClients objectForKey:v7];
    if (!v6)
    {
      id v6 = [objc_alloc((Class)ML3Client) initWithConnection:v4];
      [(NSMutableDictionary *)self->_xpcClients setObject:v6 forKey:v7];
    }
    os_unfair_lock_unlock(&self->_xpcLock);
  }

  return v6;
}

- (BOOL)_validateTransactionIdentifier:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (!v6) {
    goto LABEL_4;
  }
  serialQueue = self->_serialQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000700C;
  v12[3] = &unk_10002D758;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  dispatch_sync(serialQueue, v12);

  if (*((unsigned char *)v17 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
LABEL_4:
    id v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v6;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to validate transaction %{public}@ for client %{public}@", buf, 0x16u);
    }

    BOOL v9 = *((unsigned char *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (void)_unregisterServiceOriginatedTransactionWithConnection:(id)a3
{
  id v7 = [a3 currentTransactionID];
  id v4 = -[ML3MediaLibraryWriter _transactionForIdentifier:](self->_writer, "_transactionForIdentifier:");
  unsigned int v5 = v4;
  if (v4)
  {
    id v6 = [v4 client];

    if (!v6) {
      [(ML3MediaLibraryWriter *)self->_writer _unregisterTransaction:v5];
    }
  }
}

- (void)library:(id)a3 didBeginDatabaseTransactionWithConnection:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v6 currentTransactionID];
  id v8 = [(ML3MediaLibraryWriter *)self->_writer _transactionForIdentifier:v7];
  if (!v8)
  {
    id v8 = [objc_alloc((Class)ML3ActiveTransaction) initWithLibrary:v9 connection:v6 client:0];
    [v8 setTerminable:0];
    [(ML3MediaLibraryWriter *)self->_writer _registerTransaction:v8];
  }
}

- (void)_registerTransactionInfo:(id)a3 forIdentitifer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000592C;
    block[3] = &unk_10002D4E0;
    block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_sync(serialQueue, block);
  }
}

- (void)library:(id)a3 didCommitDatabaseTransactionWithConnection:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionInfoForID, 0);
  objc_storeStrong((id *)&self->_deviceSharedLibraryPath, 0);
  objc_storeStrong((id *)&self->_mediaLibraries, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_spotlightIndexCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_signalDispatchSource, 0);
  objc_storeStrong((id *)&self->_musicAppAssociator, 0);
  objc_storeStrong((id *)&self->_databaseRecoveryCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_databaseRecoveryOperationQueue, 0);
  objc_storeStrong((id *)&self->_maintenanceTasksOperationQueue, 0);
  objc_storeStrong((id *)&self->_validationController, 0);
  objc_storeStrong((id *)&self->_cacheDeleteController, 0);
  objc_storeStrong((id *)&self->_importManager, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_xpcClients, 0);
  objc_storeStrong((id *)&self->_xpcListeners, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_writerUpdateQueue, 0);
  objc_storeStrong((id *)&self->_writerBeginTransactionQueue, 0);
  objc_storeStrong((id *)&self->_spotlightIndexQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (id)_generateSecurityScopedURLWrapperForItemPid:(unint64_t)a3 withLibrary:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [objc_alloc((Class)ML3Track) initWithPersistentID:a3 inLibrary:v8];
  id v10 = [v9 valueForProperty:ML3TrackPropertyFilePath];
  id v11 = v10;
  if (v10 && [v10 length])
  {
    id v12 = [v8 mediaFolderPathByAppendingPathComponent:v11];
    id v13 = +[NSURL fileURLWithPath:v12];

    id v14 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:v13 readonly:1];
    id v15 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543875;
      uint64_t v18 = self;
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      __int16 v21 = 2113;
      id v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ generated wrapper for item pid: %llu. wrapper=%{private}@", buf, 0x20u);
    }
  }
  else
  {
    +[NSError msv_errorWithDomain:MLMusicLibraryErrorDomain, 1, @"Could not find relative path for item pid %llu", a3 code debugDescription];
    id v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)_updateSiriIndexMetadataForLibraryAtPath:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = a3;
  if ([(MLDMediaLibraryService *)self _platformSupportsSiriIndexing])
  {
    v10[0] = MLDatabaseOperationOptionDatabasePathKey;
    v10[1] = MLDatabaseOperationOptionPriorityLevelKey;
    v11[0] = v7;
    v11[1] = &off_10002EE18;
    v10[2] = MLDatabaseOperationOptionReadOnlyKey;
    v10[3] = MLDatabaseOperationOptionEnqueueSerially;
    v11[2] = &__kCFBooleanTrue;
    v11[3] = &__kCFBooleanTrue;
    id v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

    [(MLDMediaLibraryService *)self performDatabaseOperation:8 withAttributes:&__NSDictionary0__struct options:v8 completionHandler:v6];
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@ updateSiriIndexMetadata called on unsupported platform.", buf, 0xCu);
    }

    id v8 = +[NSError errorWithDomain:MLMusicLibraryErrorDomain code:10 userInfo:0];

    v6[2](v6, 0, v8);
  }
}

- (BOOL)_platformSupportsSiriIndexing
{
  if (qword_100035020 != -1) {
    dispatch_once(&qword_100035020, &stru_10002D7A0);
  }
  if (!MSVDeviceIsWatch()) {
    return 1;
  }
  uint64_t v2 = qword_100035018;
  v3 = MSVGetDeviceHardwarePlatform();
  LOBYTE(v2) = [(id)v2 containsObject:v3];

  return v2 ^ 1;
}

- (BOOL)_platformSupportsSpotlightIndexing
{
  return 1;
}

- (void)_validateDatabaseAtPath:(id)a3 byTruncatingFirst:(BOOL)a4 withCompletion:(id)a5
{
}

- (void)_performMaintenanceOnDatabaseAtPath:(id)a3 withActivity:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Maintenance] Maintenance activity triggered.", buf, 2u);
  }

  if (v8)
  {
    id v12 = v8;
  }
  else
  {
    id v12 = [(MLDMediaLibraryService *)self _deviceSharedLibraryPath];
  }
  id v13 = v12;
  id v14 = [(MLDMediaLibraryService *)self _mediaLibraryForPath:v12];
  id v15 = [objc_alloc((Class)ML3MaintenanceTasksOperation) initWithLibrary:v14 activity:v10];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001169C;
  v18[3] = &unk_10002D730;
  v18[4] = self;
  id v19 = v14;
  id v20 = v9;
  id v16 = v9;
  id v17 = v14;
  [v15 setCompletionBlock:v18];
  [(NSOperationQueue *)self->_maintenanceTasksOperationQueue addOperation:v15];
}

- (void)_stopIdleTimer
{
  if (self->_idleTimer)
  {
    v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)unsigned int v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Stopping media library service idle timer.", v5, 2u);
    }

    [(NSTimer *)self->_idleTimer invalidate];
    idleTimer = self->_idleTimer;
    self->_idleTimer = 0;
  }
}

- (void)_idleTimerFired:(id)a3
{
  if ([(ML3DatabaseImportManager *)self->_importManager suspendedOperationsCount]
    || [(ML3DatabaseImportManager *)self->_importManager isSuspended])
  {
    id v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Media library service has suspended import operations. Attempting to resume.", buf, 2u);
    }

    [(ML3DatabaseImportManager *)self->_importManager resumeSuspendedImportOperations];
  }
  else if (![(ML3DatabaseImportManager *)self->_importManager operationsCount])
  {
    unsigned int v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MediaLibraryService's idle timer is stopping.", v6, 2u);
    }

    [(MLDMediaLibraryService *)self _stopIdleTimer];
  }
}

- (void)_startIdleTimer
{
  v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Starting media library service idle timer.", v9, 2u);
  }

  if (self->_idleTimer) {
    [(MLDMediaLibraryService *)self _stopIdleTimer];
  }
  id v4 = objc_alloc((Class)NSTimer);
  unsigned int v5 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
  id v6 = (NSTimer *)[v4 initWithFireDate:v5 interval:self target:"_idleTimerFired:" selector:0 userInfo:1 repeats:5.0];
  idleTimer = self->_idleTimer;
  self->_idleTimer = v6;

  id v8 = +[NSRunLoop mainRunLoop];
  [v8 addTimer:self->_idleTimer forMode:NSDefaultRunLoopMode];
}

- (void)_tearDownLibraryDidChangeNotifications
{
  if ([(MLDMediaLibraryService *)self _platformSupportsSpotlightIndexing]
    || [(MLDMediaLibraryService *)self _platformSupportsSiriIndexing])
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:ML3MusicLibraryContentsDidChangeNotification object:0];

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:ML3MusicLibraryNonContentsPropertiesDidChangeNotification object:0];
  }
}

- (void)_updateSpotlightIndexForNotification:(id)a3
{
  id v4 = a3;
  if ([(MLDMediaLibraryService *)self _platformSupportsSpotlightIndexing])
  {
    spotlightIndexQueue = self->_spotlightIndexQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100011C40;
    v6[3] = &unk_10002D8A8;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(spotlightIndexQueue, v6);
  }
}

- (void)_updateSiriIndexForNotification:(id)a3
{
  id v8 = a3;
  id v4 = [v8 name];
  unsigned int v5 = [v4 isEqualToString:ML3MusicLibraryContentsDidChangeNotification];

  if (v5)
  {
    id v6 = [v8 object];
    id v7 = [v6 databasePath];
    [(MLDMediaLibraryService *)self _updateSiriIndexMetadataForLibraryAtPath:v7 completion:&stru_10002D6C8];
  }
}

- (void)_updateMultiUserPurgeabilityForPrimaryLibraryPath:(id)a3
{
  id v3 = a3;
  id v4 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138477827;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_updateMultiUserPurgeabilityForPrimaryLibraryPath %{private}@", (uint8_t *)&v6, 0xCu);
  }

  unsigned int v5 = +[ML3MusicLibrary allLibraries];
  [v5 enumerateObjectsUsingBlock:&stru_10002D688];
}

- (void)_handleLibraryDidChangeNotification:(id)a3
{
  id v4 = a3;
  if ([(MLDMediaLibraryService *)self _platformSupportsSpotlightIndexing]) {
    [(MLDMediaLibraryService *)self _updateSpotlightIndexForNotification:v4];
  }
  if ([(MLDMediaLibraryService *)self _platformSupportsSiriIndexing]) {
    [(MLDMediaLibraryService *)self _updateSiriIndexForNotification:v4];
  }
}

- (void)_registerForLibraryDidChangeNotifications
{
  if ([(MLDMediaLibraryService *)self _platformSupportsSpotlightIndexing]
    || [(MLDMediaLibraryService *)self _platformSupportsSiriIndexing])
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_handleLibraryDidChangeNotification:" name:ML3MusicLibraryContentsDidChangeNotification object:0];

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_handleLibraryDidChangeNotification:" name:ML3MusicLibraryNonContentsPropertiesDidChangeNotification object:0];
  }
  if (MSVDeviceSupportsMultipleLibraries())
  {
    id v5 = +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy];
    [v5 addAccountChangeObserver:self];
  }
}

- (void)_writeDiagnosticToDisk:(id)a3
{
  id v3 = a3;
  id v4 = +[ML3MusicLibrary pathForResourceFileOrFolder:24];
  id v5 = +[NSFileManager defaultManager];
  if (([v5 fileExistsAtPath:v4 isDirectory:0] & 1) == 0) {
    [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  id v7 = +[NSString stringWithFormat:@"MediaLibraryDiagnostic_%f.log", v6];
  id v8 = [v4 stringByAppendingPathComponent:v7];
  unsigned int v9 = [v3 writeToFile:v8 error:0];

  id v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      id v12 = "Saved diagnostic information to %{public}@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }
  }
  else if (v11)
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    id v12 = "Failed to save diagnostic information to path: %{public}@";
    goto LABEL_8;
  }
}

- (void)_performDiagnosticWithReason:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Collecting diagnostic information...", (uint8_t *)&v9, 2u);
  }

  uint64_t v6 = [(MLDDiagnostic *)[MLDMutableDiagnostic alloc] initWithReason:v4];
  [(MLDMediaLibraryService *)self collectDiagnostic:v6];
  [(MLDMediaLibraryService *)self _writeDiagnosticToDisk:v6];
  id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(MLDDiagnostic *)v6 description];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)_handleDebugSignal
{
  id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** Received debug signal. Collecting diagnostic information...", v4, 2u);
  }

  [(MLDMediaLibraryService *)self _performDiagnosticWithReason:@"Debug Signal"];
}

- (void)_tearDownSignalHandler
{
}

- (void)_setupSignalHandler
{
  id v3 = dispatch_get_global_queue(0, 0);
  id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, v3);
  signalDispatchSource = self->_signalDispatchSource;
  self->_signalDispatchSource = v4;

  objc_initWeak(&location, self);
  uint64_t v6 = self->_signalDispatchSource;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001292C;
  v7[3] = &unk_10002D648;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_signalDispatchSource);
  signal(30, (void (__cdecl *)(int))1);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleXPCDisconnect:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ml_setValid:", 0);
  id v5 = [(MLDMediaLibraryService *)self _clientForConnection:v4];

  if (v5)
  {
    [(ML3DatabaseImportManager *)self->_importManager cancelImportOperationsOriginatingFromClient:v5];
    writerUpdateQueue = self->_writerUpdateQueue;
    BOOL v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_100012A98;
    id v14 = &unk_10002D8A8;
    id v15 = self;
    id v7 = v5;
    id v16 = v7;
    dispatch_async(writerUpdateQueue, &v11);
    p_xpcLock = &self->_xpcLock;
    os_unfair_lock_lock(&self->_xpcLock);
    xpcClients = self->_xpcClients;
    id v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "processID", v11, v12, v13, v14, v15));
    [(NSMutableDictionary *)xpcClients removeObjectForKey:v10];

    os_unfair_lock_unlock(p_xpcLock);
  }
}

- (id)_deviceSharedLibraryPath
{
  uint64_t v2 = +[ML3MusicLibraryResourcesManager sharedManager];
  id v3 = [v2 pathForResourceFileOrFolder:15];

  return v3;
}

- (id)_allMediaLibraries
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_100012BEC;
  id v10 = sub_100012BFC;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012C04;
  v5[3] = &unk_10002D5F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_XPCListenerForService:(int64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100012BEC;
  id v11 = sub_100012BFC;
  id v12 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012D60;
  v6[3] = &unk_10002D5A8;
  void v6[6] = a3;
  v6[7] = a2;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_setupCacheDeleteController
{
  id v3 = +[ML3MusicLibrary allLibraries];
  serialQueue = self->_serialQueue;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1000130F8;
  id v12 = &unk_10002D8A8;
  id v13 = v3;
  id v14 = self;
  id v5 = v3;
  dispatch_sync(serialQueue, &v9);
  uint64_t v6 = [MLDCacheDeleteController alloc];
  uint64_t v7 = -[MLDCacheDeleteController initWithLibraries:](v6, "initWithLibraries:", v5, v9, v10, v11, v12);
  cacheDeleteController = self->_cacheDeleteController;
  self->_cacheDeleteController = v7;
}

- (void)_setupActivityHandlers
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100013350;
  handler[3] = &unk_10002D558;
  handler[4] = self;
  xpc_activity_register("com.apple.medialibraryd.maintainence", v3, handler);
}

- (void)_setupNotifyEventHandlers
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000134EC;
  handler[3] = &unk_10002D558;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (void)_reconnectLibraries:(id)a3
{
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 databasePath];
          *(_DWORD *)buf = 138543362;
          id v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unlock: reconnecting to library at path %{public}@", buf, 0xCu);
        }
        [v8 reconnectToDatabase];
        id v11 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v8 databasePath];
          *(_DWORD *)buf = 138543362;
          id v19 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unlock: unlocking connection pool for library at path %{public}@", buf, 0xCu);
        }
        id v13 = [v8 connectionPool];
        [v13 unlock];
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)_disconnectLibraries:(id)a3
{
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 databasePath];
          *(_DWORD *)buf = 138543362;
          id v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Lock: locking connection pool for library at %{public}@", buf, 0xCu);
        }
        id v11 = [v8 connectionPool];
        [v11 lock];

        id v12 = os_log_create("com.apple.amp.medialibraryd", "Service");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [v8 databasePath];
          *(_DWORD *)buf = 138543362;
          id v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Lock: closing all database connections for library at %{public}@", buf, 0xCu);
        }
        long long v14 = [v8 connectionPool];
        [v14 _closeAllConnectionsAndWaitForBusyConnections:0];
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
}

- (int64_t)currentLockReason
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013AA4;
  v5[3] = &unk_10002D5F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCurrentLockReason:(int64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013B2C;
  v4[3] = &unk_10002D530;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (BOOL)isDatabaseLocked
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013BE4;
  v5[3] = &unk_10002D5F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setDatabaseLocked:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013C70;
  v4[3] = &unk_10002D508;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(serialQueue, v4);
}

- (void)start
{
  char v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  xpcClients = self->_xpcClients;
  self->_xpcClients = v3;

  id v7 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"Keep-alive for MediaLibraryService initialization"];
  [v7 beginTransaction];
  BOOL v5 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
  [v7 endTransactionOnDate:v5];

  [(MLDMediaLibraryService *)self _setupNotifyEventHandlers];
  [(MLDMediaLibraryService *)self _setupActivityHandlers];
  [(MLDMediaLibraryService *)self _setupCacheDeleteController];
  id v6 = [(MLDMediaLibraryService *)self _XPCListenerForService:1];
}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  if (MSVDeviceSupportsMultipleLibraries()) {
    [(MLDMediaLibraryService *)self _updateMultiUserPurgeabilityForPrimaryLibraryPath:v7];
  }
  v6[2](v6, 1, 0);
}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_xpcLock);
  BOOL v5 = [(NSMutableDictionary *)self->_xpcClients allValues];
  os_unfair_lock_unlock(&self->_xpcLock);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013EC4;
  block[3] = &unk_10002D4E0;
  id v10 = v4;
  id v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)mediaLibraryWriter:(id)a3 terminatedTransaction:(id)a4 withError:(id)a5
{
  id v12 = a5;
  id v7 = a4;
  id v8 = [v7 client];
  char v9 = [v8 connection];

  id v10 = [v7 identifier];

  if (v9)
  {
    id v11 = [v9 remoteObjectProxy];
    [v11 serviceTerminatedTransactionWithIdentifier:v10 error:v12];
  }
  [(MLDMediaLibraryService *)self _unregisterTransactionInfoForIdentifier:v10];
}

- (void)library:(id)a3 didRollbackDatabaseTransactionWithConnection:(id)a4
{
}

- (void)securityScopedURLWrapperForItemPid:(unint64_t)a3 withDatabasePath:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)ML3MusicLibrary) initWithPath:v9];

  id v11 = +[NSXPCConnection currentConnection];
  id v12 = [v11 valueForEntitlement:@"com.apple.medialibrary.media-access"];
  unsigned int v13 = [v12 BOOLValue];

  if (v13)
  {
    id v22 = 0;
    long long v14 = [(MLDMediaLibraryService *)self _generateSecurityScopedURLWrapperForItemPid:a3 withLibrary:v10 error:&v22];
    id v15 = v22;
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  long long v16 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@ securityScopedURLWrapperForItemPid client missing entitlement.", buf, 0xCu);
  }

  id v15 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:2001 userInfo:0];
  long long v14 = 0;
  if (v8)
  {
LABEL_7:
    callbackQueue = self->_callbackQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000145C8;
    v18[3] = &unk_10002D730;
    id v19 = v14;
    id v21 = v8;
    id v20 = v15;
    dispatch_async(callbackQueue, v18);
  }
LABEL_8:
}

- (void)getClientImportServiceListenerEndpointWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  BOOL v5 = [(MLDMediaLibraryService *)self _XPCListenerForService:3];
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = os_log_create("com.apple.amp.medialibraryd", "MultiUser");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543362;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@ - Unable to get an anonymous listener for ClientImportSessionService - This usually indicates an attempt to access medialibraryd without the proper entitlements.", (uint8_t *)&v9, 0xCu);
    }

    id v6 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:2000 userInfo:&off_10002EEF8];
  }
  id v8 = [v5 endpoint];
  v4[2](v4, v8, v6);
}

- (void)getMediaLibraryResourcesServiceListenerEndpointWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  BOOL v5 = [(MLDMediaLibraryService *)self _XPCListenerForService:2];
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = os_log_create("com.apple.amp.medialibraryd", "MultiUser");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543362;
      id v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@ - Unable to get an anonymous listener for MediaLibraryResourcesService - This usually indicates an attempt to access medialibraryd without the proper entitlements.", (uint8_t *)&v9, 0xCu);
    }

    id v6 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:2000 userInfo:&off_10002EED0];
  }
  id v8 = [v5 endpoint];
  v4[2](v4, v8, v6);
}

- (void)performMaintenanceTasksForDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a4;
  id v11 = 0;
  LOBYTE(a2) = [(MLDMediaLibraryService *)self _isMediaPath:a3 selector:a2 resolvedPath:&v11];
  id v8 = v11;
  if (a2)
  {
    [(MLDMediaLibraryService *)self _performMaintenanceOnDatabaseAtPath:v8 withActivity:0 completion:v7];
  }
  else if (v7)
  {
    id v9 = objc_retainBlock(v7);
    id v10 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:195935908 userInfo:0];
    (*((void (**)(id, void, void *, void))v9 + 2))(v9, 0, v10, 0);
  }
}

- (void)updateSiriIndexMetadataForAllLibrariesWithCompletion:(id)a3
{
  id v18 = a3;
  id v19 = [(MLDMediaLibraryService *)self _currentXPCClient];
  id v4 = [v19 connection];

  if (v4)
  {
    BOOL v5 = [v19 connection];
    id v6 = v5;
    if (v5) {
      [v5 auditToken];
    }
    else {
      memset(v34, 0, 32);
    }
    +[ML3DatabasePrivacyContext logDatabasePrivacyAccessWithAuditToken:v34];
  }
  id v7 = dispatch_group_create();
  id v8 = +[ML3MusicLibrary allLibraries];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2810000000;
  v32[3] = &unk_100029D09;
  int v33 = 0;
  id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        unsigned int v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        dispatch_group_enter(v7);
        long long v14 = [v13 databasePath];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100014D54;
        v24[3] = &unk_10002D490;
        uint64_t v27 = v32;
        id v25 = v9;
        id v26 = v7;
        [(MLDMediaLibraryService *)self _updateSiriIndexMetadataForLibraryAtPath:v14 completion:v24];
      }
      id v10 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v10);
  }

  callbackQueue = self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014DD0;
  block[3] = &unk_10002D468;
  id v22 = v9;
  id v23 = v18;
  id v16 = v9;
  id v17 = v18;
  dispatch_group_notify(v7, callbackQueue, block);

  _Block_object_dispose(v32, 8);
}

- (void)updateSpotlightIndexMetadataForItemsWithIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if ([(MLDMediaLibraryService *)self _platformSupportsSpotlightIndexing])
  {
    if ([&off_10002EDD0 containsObject:v9])
    {
      id v11 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v9 allowPlaceholder:1 error:0];
      id v12 = [v11 applicationState];
      unsigned __int8 v13 = [v12 isValid];

      if (v13)
      {
        if (!v8 || [v8 count])
        {
          long long v14 = os_log_create("com.apple.amp.medialibraryd", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v37 = v9;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Received valid request to update spotlight index for bundle ID %{public}@", buf, 0xCu);
          }

          uint64_t v34 = MLDatabaseOperationAttributeBundleIDKey;
          id v35 = v9;
          id v15 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          id v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

          if (v8) {
            [v16 setValue:v8 forKey:MLDatabaseOperationAttributeEntityURLsArrayKey];
          }
          if ([v9 isEqualToString:ML3BundleIDMusic]) {
            [v16 setValue:self->_musicAppAssociator forKey:MLDatabaseOperationAttributeSpotlightIndexAppEntityAssociatorKey];
          }
          v32[0] = MLDatabaseOperationOptionDatabasePathKey;
          id v17 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
          v33[0] = v17;
          v33[1] = &off_10002EE18;
          v32[1] = MLDatabaseOperationOptionPriorityLevelKey;
          v32[2] = MLDatabaseOperationOptionReadOnlyKey;
          v32[3] = MLDatabaseOperationOptionEnqueueSerially;
          v33[2] = &__kCFBooleanTrue;
          v33[3] = &__kCFBooleanTrue;
          id v18 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];

          id v19 = [(MLDMediaLibraryService *)self _currentXPCClient];
          id v20 = [v19 connection];

          if (v20)
          {
            id v21 = [v19 connection];
            id v22 = v21;
            if (v21)
            {
              [v21 auditToken];
            }
            else
            {
              long long v30 = 0u;
              long long v31 = 0u;
            }
            +[ML3DatabasePrivacyContext logDatabasePrivacyAccessWithAuditToken:&v30];
          }
          -[MLDMediaLibraryService performDatabaseOperation:withAttributes:options:completionHandler:](self, "performDatabaseOperation:withAttributes:options:completionHandler:", 4, v16, v18, v10, v30, v31);

          goto LABEL_34;
        }
        if (v10)
        {
          long long v29 = sub_10000B210();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v37 = v9;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Failed to process request to update spotlight index for bundle ID %{public}@ – searchable items identifiers array has zero entries", buf, 0xCu);
          }

          uint64_t v27 = &off_10002EEA8;
          uint64_t v28 = 1002;
LABEL_26:
          id v16 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:v28 userInfo:v27];
          v10[2](v10, 0, v16);
LABEL_34:
        }
      }
      else if (v10)
      {
        id v26 = os_log_create("com.apple.amp.medialibraryd", "Default");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Failed to process request to update spotlight index – removed system app", buf, 2u);
        }

        uint64_t v27 = &off_10002EE80;
        uint64_t v28 = 1003;
        goto LABEL_26;
      }
LABEL_35:

      goto LABEL_36;
    }
    if (v10)
    {
      id v25 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Failed to process request to update spotlight index – invalid bundle id", buf, 2u);
      }

      id v23 = &off_10002EE58;
      uint64_t v24 = 1001;
      goto LABEL_21;
    }
  }
  else if (v10)
  {
    id v23 = &off_10002EE30;
    uint64_t v24 = 1010;
LABEL_21:
    id v11 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:v24 userInfo:v23];
    v10[2](v10, 0, v11);
    goto LABEL_35;
  }
LABEL_36:
}

- (void)updateSpotlightIndexForBundleID:(id)a3 withCompletion:(id)a4
{
}

- (void)unlockDatabaseWithCompletion:(id)a3
{
  id v4 = a3;
  writerUpdateQueue = self->_writerUpdateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015410;
  v7[3] = &unk_10002D468;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(writerUpdateQueue, v7);
}

- (void)lockDatabaseForReason:(int64_t)a3 withCompletion:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MLDMediaLibraryService.m", 778, @"Invalid parameter not satisfying: %@", @"reason != MLServiceLockReasonNone" object file lineNumber description];
  }
  writerUpdateQueue = self->_writerUpdateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015874;
  block[3] = &unk_10002D440;
  id v12 = v7;
  int64_t v13 = a3;
  void block[4] = self;
  id v9 = v7;
  dispatch_barrier_async(writerUpdateQueue, block);
}

- (void)cancelImportOperation:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cancelling operations for import source %lu", buf, 0xCu);
  }

  importManager = self->_importManager;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100015E4C;
  v10[3] = &unk_10002D3F0;
  id v11 = v6;
  id v9 = v6;
  [(ML3DatabaseImportManager *)importManager cancelImportOperationsForSource:a3 withCompletionHandler:v10];
}

- (void)performImport:(id)a3 fromSource:(unint64_t)a4 withUUID:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(MLDMediaLibraryService *)self _currentXPCClient];
  id v15 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Received import command from client: %{public}@", buf, 0xCu);
  }

  id v16 = [v11 libraryPath];
  id v33 = 0;
  unsigned __int8 v17 = [(MLDMediaLibraryService *)self _isMediaPath:v16 selector:a2 resolvedPath:&v33];
  id v18 = v33;
  if (v17)
  {
    id v19 = objc_alloc((Class)MSVXPCTransaction);
    id v20 = +[NSString stringWithFormat:@"Database import into library at path: %@", v18];
    id v21 = [v19 initWithName:v20];

    [v21 beginTransaction];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100016124;
    v24[3] = &unk_10002D3C8;
    id v25 = v11;
    id v26 = self;
    id v27 = v18;
    id v28 = v14;
    unint64_t v32 = a4;
    id v29 = v12;
    id v30 = v21;
    id v31 = v13;
    id v22 = v21;
    [(MLDMediaLibraryService *)self validateDatabaseAtPath:v27 withCompletionHandler:v24];

    id v23 = v25;
LABEL_7:

    goto LABEL_8;
  }
  if (v13)
  {
    id v22 = objc_retainBlock(v13);
    id v23 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:195935908 userInfo:0];
    (*((void (**)(id, void, void *, void))v22 + 2))(v22, 0, v23, 0);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)setOptions:(id)a3 withCompletionHandler:(id)a4
{
  id v4 = (void (**)(id, uint64_t, void))a4;
  BOOL v5 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = +[NSXPCConnection currentConnection];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Received set options command from client connection: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"Setting media library options."];
  [v7 beginTransaction];
  if (v4) {
    v4[2](v4, 1, 0);
  }
  [v7 endTransaction];
}

- (void)performDatabaseOperation:(unint64_t)a3 withAttributes:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(MLDMediaLibraryService *)self _currentXPCClient];
  id v15 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unint64_t v59 = (unint64_t)v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received database operation request on client: %{public}@", buf, 0xCu);
  }

  id v16 = objc_alloc((Class)MSVXPCTransaction);
  unint64_t v41 = a3;
  unsigned __int8 v17 = +[NSString stringWithFormat:@"Database operation of type %lu", a3];
  id v18 = [v16 initWithName:v17];

  v42 = v18;
  [v18 beginTransaction];
  id v19 = [v12 objectForKey:MLDatabaseOperationOptionPriorityLevelKey];
  if (v19)
  {
    id v20 = [v12 objectForKey:MLDatabaseOperationOptionReadOnlyKey];
    unsigned __int8 v21 = [v20 BOOLValue];

    id v22 = [v19 unsignedIntegerValue];
    if ((v21 & 1) == 0 && v22 && [(ML3DatabaseImportManager *)self->_importManager operationsCount])
    {
      id v23 = os_log_create("com.apple.amp.medialibraryd", "Service");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Suspending current import operations for higher priority database operation.", buf, 2u);
      }

      [(ML3DatabaseImportManager *)self->_importManager suspendImportOperations];
      [(MLDMediaLibraryService *)self _startIdleTimer];
    }
  }
  [(MLDMediaLibraryService *)self _resetIdleTimer];
  uint64_t v24 = [v12 objectForKey:MLDatabaseOperationOptionDatabasePathKey];
  id v57 = 0;
  unsigned __int8 v25 = [(MLDMediaLibraryService *)self _isMediaPath:v24 selector:a2 resolvedPath:&v57];
  id v26 = v57;
  id v27 = v26;
  if (v25)
  {
    id v38 = v19;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100016ADC;
    v49[3] = &unk_10002D328;
    v49[4] = self;
    id v28 = v26;
    id v50 = v28;
    unint64_t v56 = v41;
    id v51 = v11;
    id v29 = v12;
    id v52 = v29;
    id v39 = v14;
    id v30 = v14;
    id v53 = v30;
    id v40 = v13;
    id v31 = v13;
    id v55 = v31;
    id v54 = v42;
    unint64_t v32 = objc_retainBlock(v49);
    id v33 = [v29 objectForKey:MLDatabaseOperationOptionTransactionIdentifierKey];
    if (v33)
    {
      dispatch_async((dispatch_queue_t)self->_writerUpdateQueue, v32);
    }
    else
    {
      id v37 = v11;
      id v36 = os_log_create("com.apple.amp.medialibraryd", "Service");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v59 = v41;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Validating database before performing operation of type %lu", buf, 0xCu);
      }

      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100016BE8;
      v43[3] = &unk_10002D350;
      unint64_t v48 = v41;
      id v44 = v30;
      v45 = self;
      v46 = v32;
      id v47 = v31;
      [(MLDMediaLibraryService *)self validateDatabaseAtPath:v28 withCompletionHandler:v43];

      id v11 = v37;
    }
    id v19 = v38;

    long long v14 = v39;
    id v13 = v40;
  }
  else if (v13)
  {
    id v34 = objc_retainBlock(v13);
    id v35 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:195935908 userInfo:0];
    (*((void (**)(id, void, void *, void))v34 + 2))(v34, 0, v35, 0);
  }
}

- (BOOL)endTransaction:(id)a3 shouldCommit:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v8;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Ending transaction %{public}@. shouldCommit=%{BOOL}u", buf, 0x12u);
  }

  writer = self->_writer;
  id v14 = 0;
  unsigned __int8 v11 = [(ML3MediaLibraryWriter *)writer endTransaction:v8 shouldCommit:v6 error:&v14];
  id v12 = v14;
  [(MLDMediaLibraryService *)self _unregisterTransactionInfoForIdentifier:v8];
  if (a5) {
    *a5 = v12;
  }

  return v11;
}

- (void)executeQuery:(id)a3 withParameters:(id)a4 options:(id)a5 onTransaction:(id)a6 withCompletionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int16 v17 = +[NSXPCConnection currentConnection];
  BOOL v18 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Received database query request on client connection: %{public}@", buf, 0xCu);
  }

  id v19 = [(MLDMediaLibraryService *)self _currentXPCClient];
  if ([(MLDMediaLibraryService *)self _validateTransactionIdentifier:v15 forClient:v19])
  {
    [(MLDMediaLibraryService *)self _resetIdleTimer];
    if (v16)
    {
      id v20 = [(MLDMediaLibraryService *)self _currentXPCClient];
      unsigned __int8 v21 = [v20 bundleID];

      writerUpdateQueue = self->_writerUpdateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100017324;
      block[3] = &unk_10002D2D8;
      void block[4] = self;
      id v26 = v15;
      id v27 = v12;
      id v28 = v13;
      id v29 = v14;
      id v30 = v21;
      id v31 = v16;
      id v23 = v21;
      dispatch_async(writerUpdateQueue, block);
    }
    else
    {
      id v23 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v19 bundleID];
        *(_DWORD *)buf = 138543362;
        id v33 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Warning: %{public}@ attempted to execute query without completion handler. Results will be thrown in the bit bucket without a way to give them to the client.", buf, 0xCu);
      }
    }
  }
  else
  {
    id v23 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:2002 userInfo:0];
    (*((void (**)(id, void, NSObject *))v16 + 2))(v16, 0, v23);
  }
}

- (id)beginTransactionForDatabaseWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  unsigned __int8 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100012BEC;
  uint64_t v24 = sub_100012BFC;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = sub_100012BEC;
  BOOL v18 = sub_100012BFC;
  id v19 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000175F8;
  v10[3] = &unk_10002D260;
  id v12 = &v14;
  id v13 = &v20;
  void v10[4] = self;
  id v7 = dispatch_semaphore_create(0);
  unsigned __int8 v11 = v7;
  [(MLDMediaLibraryService *)self beginTransactionForDatabaseWithContext:v6 completionHandler:v10];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (void)recreateDatabaseAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[NSXPCConnection currentConnection];
  id v10 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received database recreation request on client connection: %{public}@", buf, 0xCu);
  }

  id v16 = 0;
  unsigned __int8 v11 = [(MLDMediaLibraryService *)self _isMediaPath:v8 selector:a2 resolvedPath:&v16];

  id v12 = v16;
  if (v11)
  {
    [(MLDMediaLibraryService *)self _performDiagnosticWithReason:@"Database Reinitialization"];
    id v13 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Enqueueing recreation operation...", buf, 2u);
    }

    [(MLDMediaLibraryService *)self _validateDatabaseAtPath:v12 forConnection:v9 byTruncatingFirst:1 withCompletion:v7];
  }
  else if (v7)
  {
    id v14 = objc_retainBlock(v7);
    id v15 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:195935908 userInfo:0];
    (*((void (**)(id, void, void *, void))v14 + 2))(v14, 0, v15, 0);
  }
}

- (void)performDiagnosticWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  BOOL v5 = +[NSXPCConnection currentConnection];
  id v6 = [v5 valueForEntitlement:@"com.apple.medialibraryd.diagnostic"];
  if _NSIsNSNumber() && ([v6 BOOLValue])
  {
    id v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(Service API) Collecting diagnostic information...", (uint8_t *)v11, 2u);
    }

    id v8 = [(MLDDiagnostic *)[MLDMutableDiagnostic alloc] initWithReason:@"MediaLibraryService API"];
    [(MLDMediaLibraryService *)self collectDiagnostic:v8];
    id v9 = [(MLDDiagnostic *)v8 description];
    v4[2](v4, v9, 0);
  }
  else
  {
    id v10 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:2001 userInfo:0];
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v10);
  }
}

- (void)checkIntegrityOfDatabaseAtPath:(id)a3 repairFaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  unsigned __int8 v11 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = +[NSXPCConnection currentConnection];
    *(_DWORD *)buf = 138543618;
    id v26 = v12;
    __int16 v27 = 2114;
    id v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received request to perform database integrity check from client connection: %{public}@. path=%{public}@", buf, 0x16u);
  }
  id v24 = 0;
  unsigned __int8 v13 = [(MLDMediaLibraryService *)self _isMediaPath:v9 selector:a2 resolvedPath:&v24];
  id v14 = v24;
  if (v13)
  {
    id v15 = objc_alloc((Class)MSVXPCTransaction);
    id v16 = +[NSString stringWithFormat:@"Database recovery at path: %@", v14];
    id v17 = [v15 initWithName:v16];

    [v17 beginTransaction];
    BOOL v18 = [[MLDDatabaseIntegrityCheckOperation alloc] initWithDatabasePath:v14 repairFaults:v6];
    objc_initWeak((id *)buf, v18);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100017F14;
    v20[3] = &unk_10002D1E8;
    objc_copyWeak(&v23, (id *)buf);
    id v22 = v10;
    id v19 = v17;
    id v21 = v19;
    [(MLDDatabaseIntegrityCheckOperation *)v18 setCompletionBlock:v20];
    [(NSOperationQueue *)self->_databaseRecoveryOperationQueue addOperation:v18];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    id v19 = objc_retainBlock(v10);
    BOOL v18 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:195935908 userInfo:0];
    (*((void (**)(id, void, MLDDatabaseIntegrityCheckOperation *, void))v19 + 2))(v19, 0, v18, 0);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)attemptDatabaseFileRecoveryAtPath:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = +[NSXPCConnection currentConnection];
    *(_DWORD *)buf = 138543362;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received request to attempt database recovery from client connection: %{public}@", buf, 0xCu);
  }
  id v23 = 0;
  unsigned __int8 v11 = [(MLDMediaLibraryService *)self _isMediaPath:v8 selector:a2 resolvedPath:&v23];

  id v12 = v23;
  if (v11)
  {
    id v13 = objc_alloc((Class)MSVXPCTransaction);
    id v14 = +[NSString stringWithFormat:@"Database recovery at path: %@", v12];
    id v15 = [v13 initWithName:v14];

    [v15 beginTransaction];
    [(MLDMediaLibraryService *)self _performDiagnosticWithReason:@"Database File Recovery"];
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018280;
    block[3] = &unk_10002D1C0;
    void block[4] = self;
    id v22 = v7;
    id v20 = v15;
    id v21 = v12;
    id v17 = v15;
    dispatch_async(serialQueue, block);

LABEL_7:
    goto LABEL_8;
  }
  if (v7)
  {
    id v17 = objc_retainBlock(v7);
    BOOL v18 = +[NSError errorWithDomain:@"MLDMediaLibraryServiceErrorDomain" code:195935908 userInfo:0];
    (*((void (**)(id, void, void *, void))v17 + 2))(v17, 0, v18, 0);

    goto LABEL_7;
  }
LABEL_8:
}

- (void)dealloc
{
  [(MLDMediaLibraryService *)self _tearDownLibraryDidChangeNotifications];
  [(MLDMediaLibraryService *)self _tearDownSignalHandler];
  [(MLDMediaLibraryService *)self _stopIdleTimer];
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018700;
  block[3] = &unk_10002D170;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
  MSVLogRemoveStateHandler();
  v4.receiver = self;
  v4.super_class = (Class)MLDMediaLibraryService;
  [(MLDMediaLibraryService *)&v4 dealloc];
}

- (id)_stateDump
{
  char v3 = [(MLDDiagnostic *)[MLDMutableDiagnostic alloc] initWithReason:@"OS_STATE_API_REQUEST"];
  [(MLDMediaLibraryService *)self collectDiagnostic:v3];
  objc_super v4 = [(MLDDiagnostic *)v3 dictionaryRepresentation];

  return v4;
}

- (id)_init
{
  v37.receiver = self;
  v37.super_class = (Class)MLDMediaLibraryService;
  uint64_t v2 = [(MLDMediaLibraryService *)&v37 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.medialibraryd.MediaLibraryService.SerialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.medialibraryd.MediaLibraryService.SpotlightIndexQueue", 0);
    spotlightIndexQueue = v2->_spotlightIndexQueue;
    v2->_spotlightIndexQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.medialibraryd.MLMediaLibraryWriterBeginTransactionQueue", 0);
    writerBeginTransactionQueue = v2->_writerBeginTransactionQueue;
    v2->_writerBeginTransactionQueue = (OS_dispatch_queue *)v7;

    id v9 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.medialibraryd.MLMediaLibraryWriterUpdateQueue", v9);
    writerUpdateQueue = v2->_writerUpdateQueue;
    v2->_writerUpdateQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.medialibraryd.MLMediaLibraryCallbackQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v12;

    v2->_xpcLock._os_unfair_lock_opaque = 0;
    id v14 = (ML3MediaLibraryWriter *)objc_alloc_init((Class)ML3MediaLibraryWriter);
    writer = v2->_writer;
    v2->_writer = v14;

    [(ML3MediaLibraryWriter *)v2->_writer setDelegate:v2];
    id v16 = (ML3DatabaseImportManager *)objc_alloc_init((Class)ML3DatabaseImportManager);
    importManager = v2->_importManager;
    v2->_importManager = v16;

    BOOL v18 = objc_alloc_init(MLDDatabaseValidationController);
    validationController = v2->_validationController;
    v2->_validationController = v18;

    id v20 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    maintenanceTasksOperationQueue = v2->_maintenanceTasksOperationQueue;
    v2->_maintenanceTasksOperationQueue = v20;

    [(NSOperationQueue *)v2->_maintenanceTasksOperationQueue setName:@"com.apple.medialibraryd.MaintenanceOperationQueue"];
    [(NSOperationQueue *)v2->_maintenanceTasksOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_maintenanceTasksOperationQueue setQualityOfService:17];
    id v22 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    databaseRecoveryOperationQueue = v2->_databaseRecoveryOperationQueue;
    v2->_databaseRecoveryOperationQueue = v22;

    [(NSOperationQueue *)v2->_databaseRecoveryOperationQueue setQualityOfService:25];
    [(NSOperationQueue *)v2->_databaseRecoveryOperationQueue setName:@"com.apple.medialibraryd.DatabaseRecoveryOperationQueue"];
    [(NSOperationQueue *)v2->_databaseRecoveryOperationQueue setMaxConcurrentOperationCount:1];
    id v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    databaseRecoveryCompletionHandlers = v2->_databaseRecoveryCompletionHandlers;
    v2->_databaseRecoveryCompletionHandlers = v24;

    id v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mediaLibraries = v2->_mediaLibraries;
    v2->_mediaLibraries = v26;

    id v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    xpcListeners = v2->_xpcListeners;
    v2->_xpcListeners = v28;

    id v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactionInfoForID = v2->_transactionInfoForID;
    v2->_transactionInfoForID = v30;

    unint64_t v32 = objc_alloc_init(_TtC13medialibraryd41MLDSpotlightIndexMusicAppEntityAssociator);
    musicAppAssociator = v2->_musicAppAssociator;
    v2->_musicAppAssociator = v32;

    [(MLDMediaLibraryService *)v2 _registerForLibraryDidChangeNotifications];
    [(MLDMediaLibraryService *)v2 _setupSignalHandler];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100018ACC;
    v35[3] = &unk_10002D108;
    id v36 = v2;
    v36->_stateHandle = sub_100018ACC((uint64_t)v35);
  }
  return v2;
}

- (MLDMediaLibraryService)init
{
  return 0;
}

+ (id)sharedInstance
{
  if (qword_100035010 != -1) {
    dispatch_once(&qword_100035010, &stru_10002D0B8);
  }
  uint64_t v2 = (void *)qword_100035008;

  return v2;
}

@end