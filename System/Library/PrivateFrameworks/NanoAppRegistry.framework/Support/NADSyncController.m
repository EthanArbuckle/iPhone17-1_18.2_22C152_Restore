@interface NADSyncController
- (BOOL)canCoordinatePairedSyncSessionForDevice:(id)a3;
- (BOOL)needToCoordinatePairedSyncSessionForDevice:(id)a3;
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)shouldStartSyncSession:(id)a3 error:(id *)a4;
- (BOOL)shouldStartSyncSessionForReunionSync:(id)a3 error:(id *)a4;
- (NADApplicationStore)applicationStore;
- (NADSyncController)initWithApplicationStore:(id)a3;
- (NADSyncSession)syncSession;
- (NSLock)timerLock;
- (OS_dispatch_queue)pairedSyncWatchdogQueue;
- (OS_dispatch_source)pairedSyncWatchdogTimer;
- (PSYSyncCoordinator)pairedSyncCoordinator;
- (SYService)service;
- (void)cancelWatchdogTimer;
- (void)completeSessionWorkWithPairedSyncSuccess:(BOOL)a3 error:(id)a4 notifyAssistant:(BOOL)a5;
- (void)lock_cancelWatchdogTimer;
- (void)pairedSyncWatchdogTimerFired;
- (void)performBlockWithWatchdogTimerLock:(id)a3;
- (void)scheduleWatchdogTimer;
- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5;
- (void)setPairedSyncCoordinator:(id)a3;
- (void)setPairedSyncWatchdogQueue:(id)a3;
- (void)setPairedSyncWatchdogTimer:(id)a3;
- (void)setService:(id)a3;
- (void)setSyncSession:(id)a3;
- (void)setTimerLock:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncSessionDidUpdateProgress:(id)a3;
@end

@implementation NADSyncController

- (NADSyncController)initWithApplicationStore:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)NADSyncController;
  v6 = [(NADSyncController *)&v35 init];
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init((Class)NSLock);
    timerLock = v6->_timerLock;
    v6->_timerLock = v7;

    dispatch_queue_t v9 = dispatch_queue_create("nanoappregistry.pairedsyncwatchdog", 0);
    pairedSyncWatchdogQueue = v6->_pairedSyncWatchdogQueue;
    v6->_pairedSyncWatchdogQueue = (OS_dispatch_queue *)v9;

    v11 = (SYService *)[objc_alloc((Class)SYService) initWithService:@"com.apple.private.alloy.appregistrysync" priority:-20 asMasterStore:0 options:0];
    service = v6->_service;
    v6->_service = v11;

    [(SYService *)v6->_service setDelegate:v6 queue:0];
    v13 = nar_sync_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v6->_service;
      *(_DWORD *)buf = 138412290;
      v37 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Initialized sync service: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_applicationStore, a3);
    id v33 = 0;
    id v34 = 0;
    id v32 = 0;
    [v5 getAllApplications:&v34 UUID:&v33 sequenceNumber:&v32 includeHidden:1];
    id v15 = v34;
    unint64_t v16 = (unint64_t)v33;
    unint64_t v17 = (unint64_t)v32;
    v18 = nar_sync_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [(id)v16 UUIDString];
      v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 count]);
      *(_DWORD *)buf = 138413058;
      v37 = (SYService *)v5;
      __int16 v38 = 2112;
      v39 = v19;
      __int16 v40 = 2112;
      unint64_t v41 = v17;
      __int16 v42 = 2112;
      v43 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "NADSyncController initialized with application store: %@; UUID=%@; sequenceNumber=%@; applicationCount=%@",
        buf,
        0x2Au);
    }
    uint64_t v21 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.nanoappregistry"];
    pairedSyncCoordinator = v6->_pairedSyncCoordinator;
    v6->_pairedSyncCoordinator = (PSYSyncCoordinator *)v21;

    [(PSYSyncCoordinator *)v6->_pairedSyncCoordinator setDelegate:v6];
    v23 = v6->_service;
    id v31 = 0;
    unsigned __int8 v24 = [(SYService *)v23 resume:&v31];
    id v25 = v31;
    if ((v24 & 1) == 0)
    {
      v26 = nar_sync_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10000F898((uint64_t)v25, v26, v27);
      }
    }
    if (![v15 count] || v16 && v17)
    {
      if ([v15 count] || !(v16 | v17)) {
        goto LABEL_22;
      }
      v28 = nar_sync_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10000F7B8();
      }

      [(NADApplicationStore *)v6->_applicationStore performTransactionWithBlock:&stru_100018648];
    }
    else
    {
      v29 = nar_sync_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10000F828();
      }
    }
    [(SYService *)v6->_service setNeedsResetSync];
LABEL_22:
  }
  return v6;
}

- (void)completeSessionWorkWithPairedSyncSuccess:(BOOL)a3 error:(id)a4 notifyAssistant:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  dispatch_queue_t v9 = [(NADSyncController *)self pairedSyncCoordinator];
  v10 = [v9 activeSyncSession];

  if (v6)
  {
    [v10 syncDidComplete];
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    [v10 syncDidFailWithError:v8];
    if (!v5) {
      goto LABEL_8;
    }
  }
  uint64_t v11 = notify_post("com.apple.assistant.sync_data_changed");
  v12 = nar_sync_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = +[NSNumber numberWithUnsignedInt:v11];
    int v14 = 138412290;
    id v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Sync store did update.  Posted changed notification for Siri with status %@", (uint8_t *)&v14, 0xCu);
  }
LABEL_8:
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = nar_sync_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "service:startSession:error", buf, 2u);
  }

  [(NADSyncController *)self cancelWatchdogTimer];
  if ([(NADSyncController *)self shouldStartSyncSession:v7 error:a5])
  {
    dispatch_queue_t v9 = [(NADSyncController *)self syncSession];

    if (!v9)
    {
      v22 = [(NADSyncController *)self applicationStore];
      v23 = [v22 beginTransaction];

      unsigned __int8 v24 = [[NADSyncSession alloc] initWithSession:v7 transaction:v23];
      [(NADSyncSession *)v24 setDelegate:self];
      [(NADSyncController *)self setSyncSession:v24];

      BOOL v20 = 1;
      goto LABEL_15;
    }
    v10 = [v7 identifier];
    uint64_t v11 = [(NADSyncController *)self syncSession];
    v12 = [v11 session];
    v13 = [v12 identifier];
    int v14 = +[NSString stringWithFormat:@"NADSyncController received startSession with id %@ while already in a session for %@.", v10, v13];

    id v15 = nar_sync_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000F908(v7, self, v15);
    }

    +[NSException raise:NSInternalInconsistencyException, @"%@", v14 format];
  }
  else
  {
    unint64_t v16 = nar_sync_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000F9EC((uint64_t *)a5, v16, v17);
    }

    v18 = [*a5 domain];
    if ([v18 isEqual:@"NARSyncErrorDomain"]) {
      BOOL v19 = [*a5 code] == (id)1;
    }
    else {
      BOOL v19 = 0;
    }

    [(NADSyncController *)self completeSessionWorkWithPairedSyncSuccess:v19 error:*a5 notifyAssistant:v19];
  }
  BOOL v20 = 0;
LABEL_15:

  return v20;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_queue_t v9 = nar_sync_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "service:sessionEnded:error:", v15, 2u);
  }

  if (v7)
  {
    v10 = [(NADSyncController *)self syncSession];
    uint64_t v11 = v10;
    if (!v10)
    {
      v13 = nar_sync_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10000FAA4(v7, v13);
      }
      goto LABEL_12;
    }
    id v12 = [v10 session];

    if (v12 != v7)
    {
      v13 = nar_sync_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10000FBDC(v7, v11, v13);
      }
LABEL_12:

      goto LABEL_18;
    }
    if (([v11 isComplete] & 1) == 0)
    {
      int v14 = nar_sync_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10000FB34(v11, v14);
      }
    }
    [(NADSyncController *)self setSyncSession:0];
    [(NADSyncController *)self completeSessionWorkWithPairedSyncSuccess:v8 == 0 error:v8 notifyAssistant:v8 == 0];
  }
  else
  {
    uint64_t v11 = nar_sync_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000FA60(v11);
    }
  }
LABEL_18:
}

- (void)syncSessionDidUpdateProgress:(id)a3
{
  v4 = [a3 progress];
  BOOL v5 = nar_sync_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000FCA8(v4, v5);
  }

  BOOL v6 = [(NADSyncController *)self pairedSyncCoordinator];
  id v7 = [v6 activeSyncSession];
  [v4 fractionCompleted];
  objc_msgSend(v7, "reportProgress:");
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 pairedDevice];
  unsigned __int8 v7 = [(NADSyncController *)self canCoordinatePairedSyncSessionForDevice:v6];

  if ((v7 & 1) == 0)
  {
    v13 = nar_sync_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Completing PSYServiceSyncSession immediately because the remote device doesn't support PairedSync", (uint8_t *)&v14, 2u);
    }

    goto LABEL_12;
  }
  id v8 = [v5 pairedDevice];
  unsigned __int8 v9 = [(NADSyncController *)self needToCoordinatePairedSyncSessionForDevice:v8];

  v10 = nar_sync_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) == 0)
  {
    if (v11)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Completing PSYServiceSyncSession immediately because the remote device doesn't need NanoAppRegistry PairedSync", (uint8_t *)&v14, 2u);
    }

LABEL_12:
    [v5 syncDidComplete];
    goto LABEL_13;
  }
  if (v11)
  {
    int v14 = 138412290;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PairedSync - beginSyncSession: %@", (uint8_t *)&v14, 0xCu);
  }

  [(NADSyncController *)self scheduleWatchdogTimer];
  id v12 = [(NADSyncController *)self service];
  [v12 setNeedsResetSync];

LABEL_13:
}

- (BOOL)canCoordinatePairedSyncSessionForDevice:(id)a3
{
  uint64_t v3 = NRWatchOSVersionForRemoteDevice();

  return _NRVersionIsGreaterThanOrEqual(v3, 131584);
}

- (BOOL)needToCoordinatePairedSyncSessionForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5 ^ 1;
}

- (BOOL)shouldStartSyncSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(NADSyncController *)self pairedSyncCoordinator];
  id v8 = [v7 syncRestriction];

  if (v8 == (id)1)
  {
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"PairedSync restriction is set to limit push";
    unsigned __int8 v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    +[NSError errorWithDomain:@"NARSyncErrorDomain" code:2 userInfo:v9];
    char v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = [(NADSyncController *)self pairedSyncCoordinator];
    unsigned __int8 v9 = [v11 activeSyncSession];

    if (v9
      && [v9 syncSessionType] == (id)1
      && ![(NADSyncController *)self shouldStartSyncSessionForReunionSync:v6 error:a4])
    {
      char v10 = 0;
    }
    else
    {
      id v12 = [v9 pairedDevice];
      id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
      unsigned int v14 = [v12 supportsCapability:v13];

      if (v14)
      {
        id v15 = [v12 pairingID];
        unint64_t v16 = +[NSString stringWithFormat:@"Paired device %@ supports standalone apps, NanoAppRegistry sync is not required", v15];

        uint64_t v17 = nar_sync_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

        NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
        uint64_t v21 = v16;
        v18 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        *a4 = +[NSError errorWithDomain:@"NARSyncErrorDomain" code:1 userInfo:v18];
      }
      else
      {
        unint64_t v16 = nar_sync_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Returning YES for shouldStartSyncSession for paired device %@", buf, 0xCu);
        }
      }

      char v10 = v14 ^ 1;
    }
  }

  return v10;
}

- (BOOL)shouldStartSyncSessionForReunionSync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [v6 sessionMetadata];
  id v8 = [v7 count];

  if (!v8)
  {
    BOOL v15 = 1;
    goto LABEL_19;
  }
  unsigned __int8 v9 = [v6 sessionMetadata];
  char v10 = [v9 objectForKeyedSubscript:@"UUIDString"];
  uint64_t v11 = [v9 objectForKeyedSubscript:@"sequenceNumber"];
  id v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13 || ![v6 isResetSync])
  {
    BOOL v15 = 1;
    goto LABEL_17;
  }
  applicationStore = self->_applicationStore;
  id v26 = 0;
  id v27 = 0;
  id v25 = 0;
  BOOL v15 = 1;
  [(NADApplicationStore *)applicationStore getAllApplications:&v27 UUID:&v26 sequenceNumber:&v25 includeHidden:1];
  id v16 = v27;
  id v17 = v26;
  id v18 = v25;
  BOOL v19 = [v17 UUIDString];
  if ([v10 isEqual:v19] && objc_msgSend(v12, "isEqual:", v18))
  {
    id v20 = [v16 count];

    if (!v20)
    {
      BOOL v15 = 1;
      goto LABEL_15;
    }
    uint64_t v21 = nar_sync_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Metadata matches existing store", buf, 2u);
    }

    if (!a4)
    {
      BOOL v15 = 0;
      goto LABEL_15;
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Sync metadata matches receiver. UUID: %@; sequenceNumber: %@",
      v10,
    BOOL v19 = v12);
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    v29 = v19;
    v22 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    *a4 = +[NSError errorWithDomain:@"NARSyncErrorDomain" code:1 userInfo:v22];

    BOOL v15 = 0;
  }

LABEL_15:
LABEL_17:

LABEL_19:
  return v15;
}

- (void)pairedSyncWatchdogTimerFired
{
  id v3 = nar_sync_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000FDC0(v3);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000092CC;
  v4[3] = &unk_100018598;
  v4[4] = self;
  [(NADSyncController *)self performBlockWithWatchdogTimerLock:v4];
}

- (void)cancelWatchdogTimer
{
  id v3 = nar_sync_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancelling watchdog timer", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009488;
  v4[3] = &unk_100018598;
  v4[4] = self;
  [(NADSyncController *)self performBlockWithWatchdogTimerLock:v4];
}

- (void)lock_cancelWatchdogTimer
{
  id v3 = [(NADSyncController *)self pairedSyncWatchdogTimer];

  if (v3)
  {
    id v4 = [(NADSyncController *)self pairedSyncWatchdogTimer];
    dispatch_source_cancel(v4);

    [(NADSyncController *)self setPairedSyncWatchdogTimer:0];
  }
}

- (void)scheduleWatchdogTimer
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000956C;
  v2[3] = &unk_100018598;
  v2[4] = self;
  [(NADSyncController *)self performBlockWithWatchdogTimerLock:v2];
}

- (void)performBlockWithWatchdogTimerLock:(id)a3
{
  id v4 = (void (**)(void))a3;
  unsigned __int8 v5 = [(NADSyncController *)self timerLock];
  [v5 lock];

  v4[2](v4);
  id v6 = [(NADSyncController *)self timerLock];
  [v6 unlock];
}

- (NADApplicationStore)applicationStore
{
  return self->_applicationStore;
}

- (NADSyncSession)syncSession
{
  return self->_syncSession;
}

- (void)setSyncSession:(id)a3
{
}

- (SYService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (PSYSyncCoordinator)pairedSyncCoordinator
{
  return self->_pairedSyncCoordinator;
}

- (void)setPairedSyncCoordinator:(id)a3
{
}

- (NSLock)timerLock
{
  return self->_timerLock;
}

- (void)setTimerLock:(id)a3
{
}

- (OS_dispatch_queue)pairedSyncWatchdogQueue
{
  return self->_pairedSyncWatchdogQueue;
}

- (void)setPairedSyncWatchdogQueue:(id)a3
{
}

- (OS_dispatch_source)pairedSyncWatchdogTimer
{
  return self->_pairedSyncWatchdogTimer;
}

- (void)setPairedSyncWatchdogTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSyncWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_pairedSyncWatchdogQueue, 0);
  objc_storeStrong((id *)&self->_timerLock, 0);
  objc_storeStrong((id *)&self->_pairedSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_syncSession, 0);

  objc_storeStrong((id *)&self->_applicationStore, 0);
}

@end