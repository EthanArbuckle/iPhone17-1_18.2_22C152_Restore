@interface MBTargetDeviceTransferEngine
- (BOOL)_checkFreeDiskSpace:(unint64_t)a3 preflightInfo:(id)a4 error:(id *)a5;
- (BOOL)_handleCompletionWithError:(id *)a3;
- (BOOL)_handleTimeout:(BOOL)a3 error:(id *)a4;
- (BOOL)_removeDirectory:(id)a3 error:(id *)a4;
- (BOOL)_requestBackupWithSourceInfo:(id)a3 preflightInfo:(id)a4 error:(id *)a5;
- (BOOL)_restoreKeychainWithKeychainTransferResponse:(id)a3 error:(id *)a4;
- (BOOL)_restoreWithSourceInfo:(id)a3 error:(id *)a4;
- (BOOL)_setUpFileTransferSessionWithError:(id *)a3;
- (BOOL)_waitForControlConnectionWithBlock:(id)a3;
- (BOOL)cancel;
- (BOOL)isFinished;
- (MBConnection)connection;
- (MBDeviceLockAssertion)deviceLockAssertion;
- (MBDeviceTransferKeychain)peerKeychainInfo;
- (MBDeviceTransferLocalDrive)transferLocalDrive;
- (MBDeviceTransferPreflight)peerPreflightInfo;
- (MBDeviceTransferProgressModel)progressModel;
- (MBPeerInitResponse)peerInitResponse;
- (MBPeerKeychainTransferResponse)peerKeychainTransferResponse;
- (MBPeerPreflightResponse)peerPreflightResponse;
- (MBPeerTransferDrive)transferDrive;
- (MBPowerAssertion)powerAssertion;
- (MBServiceManagerDeviceTransferDelegate)delegate;
- (MBTargetDeviceTransferEngine)initWithSessionInfo:(id)a3;
- (NSDate)fileTransferEndDate;
- (NSDate)fileTransferStartDate;
- (NSDate)preflightStartDate;
- (NSDate)restoreStartDate;
- (NSError)completionError;
- (OS_dispatch_group)progressGroup;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)sessionQueue;
- (OS_dispatch_semaphore)connectSemaphore;
- (OS_dispatch_semaphore)requestBackupSemaphore;
- (OS_dispatch_semaphore)requestInitSemaphore;
- (OS_dispatch_semaphore)requestKeychainSemaphore;
- (OS_dispatch_semaphore)requestPreflightSemaphore;
- (OS_dispatch_source)disconnectTimer;
- (OS_os_transaction)transaction;
- (RPFileTransferSession)fileTransferSession;
- (__CFString)chargeToken;
- (double)startTime;
- (id)_perform:(id)a3;
- (id)_requestInitWithError:(id *)a3;
- (id)_requestKeychainWithSourceInfo:(id)a3 error:(id *)a4;
- (id)_requestPreflightWithSourceInfo:(id)a3 error:(id *)a4;
- (id)_restoreEngineWithSourceInfo:(id)a3;
- (id)completionHandler;
- (id)engineModeString;
- (id)persona;
- (int)engineType;
- (int64_t)connectionType;
- (unint64_t)lastRestoreProgressPercentage;
- (unint64_t)preflightDuration;
- (void)_cancelDisconnectTimer;
- (void)_disableInfraWiFi;
- (void)_enableInfraWiFi;
- (void)_finishWithError:(id)a3;
- (void)_handleFileTransferSessionProgress:(id)a3;
- (void)_saveDeviceTransferInfo;
- (void)_sendDoneMessageWithError:(id)a3;
- (void)_sendRestoreProgressMessageWithPercentage:(unint64_t)a3;
- (void)_signalControlConnectionStarted;
- (void)_start;
- (void)_startDisconnectTimer;
- (void)_startTrackingPeerConnectionStatus;
- (void)_stopTrackingPeerConnectionStatus;
- (void)dealloc;
- (void)progressUpdatedWithPercentage:(double)a3 size:(unint64_t)a4;
- (void)setChargeToken:(__CFString *)a3;
- (void)setCompletionError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConnectSemaphore:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceLockAssertion:(id)a3;
- (void)setDisconnectTimer:(id)a3;
- (void)setFileTransferEndDate:(id)a3;
- (void)setFileTransferSession:(id)a3;
- (void)setFileTransferStartDate:(id)a3;
- (void)setLastRestoreProgressPercentage:(unint64_t)a3;
- (void)setPeerInitResponse:(id)a3;
- (void)setPeerKeychainInfo:(id)a3;
- (void)setPeerKeychainTransferResponse:(id)a3;
- (void)setPeerPreflightInfo:(id)a3;
- (void)setPeerPreflightResponse:(id)a3;
- (void)setPowerAssertion:(id)a3;
- (void)setPreflightDuration:(unint64_t)a3;
- (void)setPreflightStartDate:(id)a3;
- (void)setProgressGroup:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestBackupSemaphore:(id)a3;
- (void)setRequestInitSemaphore:(id)a3;
- (void)setRequestKeychainSemaphore:(id)a3;
- (void)setRequestPreflightSemaphore:(id)a3;
- (void)setRestoreStartDate:(id)a3;
- (void)setSessionQueue:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTransaction:(id)a3;
- (void)start;
- (void)startDataTransferWithPreflightInfo:(id)a3 completion:(id)a4;
- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completion:(id)a4;
- (void)startKeychainDataTransferWithCompletion:(id)a3;
- (void)startKeychainTransferWithCompletion:(id)a3;
- (void)startPreflightWithCompletion:(id)a3;
- (void)updatedTotalProgress:(id)a3;
@end

@implementation MBTargetDeviceTransferEngine

- (MBTargetDeviceTransferEngine)initWithSessionInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBTargetDeviceTransferEngine initWithSessionInfo:]", "MBTargetDeviceTransferEngine.m", 89, "sessionInfo");
  }
  v5 = v4;
  uint64_t v6 = [v4 fileTransferSession];
  if (!v6) {
    __assert_rtn("-[MBTargetDeviceTransferEngine initWithSessionInfo:]", "MBTargetDeviceTransferEngine.m", 91, "fileTransferSession");
  }
  v7 = (void *)v6;
  v8 = +[MBDriveSettingsContext defaultSettingsContext];
  v50.receiver = self;
  v50.super_class = (Class)MBTargetDeviceTransferEngine;
  v9 = [(MBEngine *)&v50 initWithSettingsContext:v8 debugContext:0 domainManager:0];
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    Name = class_getName(v10);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v14 = dispatch_queue_create(Name, v13);
    [(MBTargetDeviceTransferEngine *)v9 setQueue:v14];

    v15 = (objc_class *)objc_opt_class();
    v16 = class_getName(v15);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v19 = dispatch_queue_create(v16, v18);
    [(MBTargetDeviceTransferEngine *)v9 setSessionQueue:v19];

    v20 = (objc_class *)objc_opt_class();
    class_getName(v20);
    v21 = (void *)os_transaction_create();
    [(MBTargetDeviceTransferEngine *)v9 setTransaction:v21];

    [(MBTargetDeviceTransferEngine *)v9 setFileTransferSession:v7];
    v22 = [@"/var/mobile/Library/Caches/Backup/DT" stringByAppendingString:@"/"];
    v23 = [v22 stringByStandardizingPath];

    v24 = +[NSURL fileURLWithPath:v23 isDirectory:1];
    v25 = [[MBPeerTransferDrive alloc] initWithRootURL:v24 fileTransferSession:v7 uploadBatchSize:128 concurrentUploadBatchCount:1 concurrentOpenBatchCount:1];
    transferDrive = v9->_transferDrive;
    v9->_transferDrive = v25;

    v27 = [[MBDeviceTransferLocalDrive alloc] initWithPath:@"/var/mobile/Library/Caches/Backup/DT"];
    transferLocalDrive = v9->_transferLocalDrive;
    v9->_transferLocalDrive = v27;

    v29 = [MBDeviceTransferProgressModel alloc];
    v30 = objc_opt_new();
    v31 = [(MBDeviceTransferProgressModel *)v29 initWithEstimator:v30];
    progressModel = v9->_progressModel;
    v9->_progressModel = v31;

    v33 = [(MBTargetDeviceTransferEngine *)v9 progressModel];
    [v33 setDelegate:v9];

    dispatch_group_t v34 = dispatch_group_create();
    progressGroup = v9->_progressGroup;
    v9->_progressGroup = (OS_dispatch_group *)v34;

    v9->_lastRestoreProgressPercentage = -1;
    v36 = [[MBPowerAssertion alloc] initWithName:@"D2D" timeout:0.0];
    [(MBTargetDeviceTransferEngine *)v9 setPowerAssertion:v36];

    id v49 = 0;
    uint64_t v37 = +[MBPersona personalPersonaWithError:&v49];
    id v38 = v49;
    personalPersona = v9->_personalPersona;
    v9->_personalPersona = (MBPersona *)v37;

    if (!v9->_personalPersona)
    {
      v47 = +[NSAssertionHandler currentHandler];
      v48 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MBTargetDeviceTransferEngine initWithSessionInfo:]");
      [v47 handleFailureInFunction:v48, @"MBTargetDeviceTransferEngine.m", 114, @"Unable to obtain personal persona: %@", v38 file lineNumber description];
    }
    uint64_t v40 = objc_opt_class();
    +[MBPeerMessenger registerRequestClass:v40 responseClass:objc_opt_class() forTask:@"MBPeerTaskInit"];
    uint64_t v41 = objc_opt_class();
    +[MBPeerMessenger registerRequestClass:v41 responseClass:objc_opt_class() forTask:@"MBPeerTaskTransfer"];
    uint64_t v42 = objc_opt_class();
    +[MBPeerMessenger registerRequestClass:v42 responseClass:objc_opt_class() forTask:@"MBPeerTaskDone"];
    uint64_t v43 = objc_opt_class();
    +[MBPeerMessenger registerRequestClass:v43 responseClass:objc_opt_class() forTask:@"MBPeerTaskKeychain"];
    uint64_t v44 = objc_opt_class();
    +[MBPeerMessenger registerRequestClass:v44 responseClass:objc_opt_class() forTask:@"MBPeerTaskPreflight"];
    uint64_t v45 = objc_opt_class();
    +[MBPeerMessenger registerRequestClass:v45 responseClass:objc_opt_class() forTask:@"MBPeerTaskRestoreProgress"];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(MBTargetDeviceTransferEngine *)self transferDrive];
  [v3 stopListeningForFileTransfers];

  v4.receiver = self;
  v4.super_class = (Class)MBTargetDeviceTransferEngine;
  [(MBTargetDeviceTransferEngine *)&v4 dealloc];
}

- (id)persona
{
  return self->_personalPersona;
}

- (int)engineType
{
  return 4;
}

- (id)engineModeString
{
  return @"D2D";
}

- (void)_finishWithError:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if (atomic_exchange((atomic_uchar *volatile)&v6->_finished, 1u))
  {
    objc_sync_exit(v6);
  }
  else
  {
    if (![(MBEngine *)v6 isCanceled]
      || (+[MBError errorWithCode:202 format:@"Canceled"],
          (id v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v7 = v5;
    }
    [(MBTargetDeviceTransferEngine *)v6 setCompletionError:v7];
    objc_sync_exit(v6);

    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finishing %@", buf, 0xCu);
      uint64_t v29 = objc_opt_class();
      _MBLog();
    }

    [(MBTargetDeviceTransferEngine *)v6 startTime];
    double v9 = 0.0;
    if (v10 > 0.0)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v12 = v11;
      [(MBTargetDeviceTransferEngine *)v6 startTime];
      double v9 = v12 - v13;
    }
    dispatch_queue_t v14 = [(MBTargetDeviceTransferEngine *)v6 transaction];
    [(MBTargetDeviceTransferEngine *)v6 setTransaction:0];
    v15 = [(MBTargetDeviceTransferEngine *)v6 deviceLockAssertion];
    [(MBTargetDeviceTransferEngine *)v6 setDeviceLockAssertion:0];
    [v15 drop];

    v16 = [(MBTargetDeviceTransferEngine *)v6 powerAssertion];
    [(MBTargetDeviceTransferEngine *)v6 setPowerAssertion:0];
    [(MBTargetDeviceTransferEngine *)v6 _stopTrackingPeerConnectionStatus];
    v17 = [(MBTargetDeviceTransferEngine *)v6 sessionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012C328;
    block[3] = &unk_100411128;
    block[4] = v6;
    dispatch_async(v17, block);

    v18 = [(MBTargetDeviceTransferEngine *)v6 transferLocalDrive];
    [v18 invalidate];

    dispatch_queue_t v19 = [(MBTargetDeviceTransferEngine *)v6 transferDrive];
    [v19 invalidate];

    if ((id)[(MBTargetDeviceTransferEngine *)v6 connectionType] == (id)1
      && [(MBTargetDeviceTransferEngine *)v6 chargeToken])
    {
      [(MBTargetDeviceTransferEngine *)v6 chargeToken];
      MBCancelChargeLimit();
      [(MBTargetDeviceTransferEngine *)v6 setChargeToken:0];
    }
    v20 = [(MBTargetDeviceTransferEngine *)v6 progressGroup];
    v21 = dispatch_get_global_queue(17, 0);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10012C330;
    v35[3] = &unk_1004110B0;
    id v22 = v7;
    id v36 = v22;
    uint64_t v37 = v6;
    dispatch_group_async(v20, v21, v35);

    v23 = +[MBDaemon sharedDaemon];
    [v23 holdWorkAssertion:a2];

    v24 = [(MBTargetDeviceTransferEngine *)v6 progressGroup];
    v25 = [(MBTargetDeviceTransferEngine *)v6 sessionQueue];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10012C4FC;
    v30[3] = &unk_100412AD8;
    v30[4] = v6;
    id v31 = v22;
    double v34 = v9;
    id v32 = v16;
    id v33 = v14;
    id v26 = v14;
    id v27 = v16;
    id v28 = v22;
    dispatch_group_notify(v24, v25, v30);
  }
}

- (BOOL)_handleCompletionWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _handleCompletionWithError:]", "MBTargetDeviceTransferEngine.m", 223, "error");
  }
  if ([(MBEngine *)self isCanceled])
  {
    id v5 = +[MBError errorWithCode:202 format:@"Canceled"];
    if (v5) {
LABEL_4:
    }
      *a3 = v5;
  }
  else
  {
    id v7 = self;
    objc_sync_enter(v7);
    if ([(MBTargetDeviceTransferEngine *)v7 isFinished])
    {
      id v5 = [(MBTargetDeviceTransferEngine *)v7 completionError];
      if (!v5)
      {
        id v5 = +[MBError errorWithCode:1 format:@"Invalid state (finished)"];
      }
    }
    else
    {
      id v5 = 0;
    }
    objc_sync_exit(v7);

    if (v5) {
      goto LABEL_4;
    }
  }

  return v5 == 0;
}

- (BOOL)isFinished
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

- (BOOL)cancel
{
  v16.receiver = self;
  v16.super_class = (Class)MBTargetDeviceTransferEngine;
  BOOL v3 = [(MBEngine *)&v16 cancel];
  if (!v3)
  {
    objc_super v4 = [(MBTargetDeviceTransferEngine *)self transferLocalDrive];
    [v4 invalidate];

    id v5 = [(MBTargetDeviceTransferEngine *)self transferDrive];
    [v5 invalidate];

    uint64_t v6 = [(MBTargetDeviceTransferEngine *)self requestBackupSemaphore];
    if (v6)
    {
      id v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Signaling backup request semaphore", v15, 2u);
        _MBLog();
      }

      dispatch_semaphore_signal(v6);
    }
    v8 = [(MBTargetDeviceTransferEngine *)self requestKeychainSemaphore];

    if (v8)
    {
      double v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Signaling keychain transfer request semaphore", v15, 2u);
        _MBLog();
      }

      dispatch_semaphore_signal(v8);
    }
    double v10 = [(MBTargetDeviceTransferEngine *)self requestPreflightSemaphore];

    if (v10)
    {
      double v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Signaling keychain preflight request semaphore", v15, 2u);
        _MBLog();
      }

      dispatch_semaphore_signal(v10);
    }
    double v12 = [(MBTargetDeviceTransferEngine *)self requestInitSemaphore];

    if (v12)
    {
      double v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Signaling init request semaphore", v15, 2u);
        _MBLog();
      }

      dispatch_semaphore_signal(v12);
    }
    [(MBTargetDeviceTransferEngine *)self _signalControlConnectionStarted];
    [(MBTargetDeviceTransferEngine *)self _finishWithError:0];
  }
  return v3;
}

- (id)_perform:(id)a3
{
  objc_super v4 = (uint64_t (**)(id, id *))a3;
  if ([(MBEngine *)self isCanceled])
  {
    uint64_t v6 = +[MBError errorWithCode:202 format:@"Canceled"];
  }
  else
  {
    id v10 = 0;
    char v7 = v4[2](v4, &v10);
    id v8 = v10;
    uint64_t v6 = v8;
    if ((v7 & 1) == 0 && !v8) {
      __assert_rtn("-[MBTargetDeviceTransferEngine _perform:]", "MBTargetDeviceTransferEngine.m", 284, "result || error");
    }
  }

  return v6;
}

- (void)_startDisconnectTimer
{
  BOOL v3 = [(MBTargetDeviceTransferEngine *)self sessionQueue];
  dispatch_assert_queue_V2(v3);

  [(MBTargetDeviceTransferEngine *)self _cancelDisconnectTimer];
  if (![(MBTargetDeviceTransferEngine *)self isFinished])
  {
    objc_super v4 = [(MBTargetDeviceTransferEngine *)self sessionQueue];
    id v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);

    dispatch_time_t v6 = dispatch_walltime(0, 1800000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10012CE2C;
    handler[3] = &unk_100413770;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v5, handler);
    [(MBTargetDeviceTransferEngine *)self setDisconnectTimer:v5];
    dispatch_resume(v5);
    char v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v12 = 1800;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Started the disconnect timer (%ds)", buf, 8u);
      _MBLog();
    }

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelDisconnectTimer
{
  BOOL v3 = [(MBTargetDeviceTransferEngine *)self sessionQueue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = [(MBTargetDeviceTransferEngine *)self disconnectTimer];
  if (v4)
  {
    [(MBTargetDeviceTransferEngine *)self setDisconnectTimer:0];
    dispatch_source_cancel(v4);
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceled the disconnect timer", v6, 2u);
      _MBLog();
    }
  }
}

- (void)_signalControlConnectionStarted
{
  unsigned __int8 v2 = [(MBTargetDeviceTransferEngine *)self connectSemaphore];
  if (v2)
  {
    BOOL v3 = v2;
    dispatch_semaphore_signal(v2);
    unsigned __int8 v2 = v3;
  }
}

- (BOOL)_waitForControlConnectionWithBlock:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  id v5 = dispatch_semaphore_create(0);
  [(MBTargetDeviceTransferEngine *)self setConnectSemaphore:v5];
  v4[2](v4);

  dispatch_time_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = 1800;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Waiting for up to %ds to allow a control connection to show up", buf, 8u);
    uint64_t v10 = 1800;
    _MBLog();
  }

  dispatch_time_t v7 = dispatch_time(0, 1800000000000);
  BOOL v8 = dispatch_semaphore_wait(v5, v7) == 0;
  -[MBTargetDeviceTransferEngine setConnectSemaphore:](self, "setConnectSemaphore:", 0, v10);

  return v8;
}

- (void)_startTrackingPeerConnectionStatus
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_trackPeerConnectionStatus, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    objc_super v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      p_peerConnected = &self->_peerConnected;
      unsigned __int8 v6 = atomic_load((unsigned __int8 *)p_peerConnected);
      *(_DWORD *)buf = 67109120;
      int v8 = v6 & 1;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Started tracking the peer connection status (%d)", buf, 8u);
      atomic_load((unsigned __int8 *)p_peerConnected);
      _MBLog();
    }
  }
}

- (void)_stopTrackingPeerConnectionStatus
{
  int v2 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_trackPeerConnectionStatus, (unsigned __int8 *)&v2, 0);
  if (v2 == 1)
  {
    objc_super v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      p_peerConnected = &self->_peerConnected;
      unsigned __int8 v6 = atomic_load((unsigned __int8 *)p_peerConnected);
      *(_DWORD *)buf = 67109120;
      int v8 = v6 & 1;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopped tracking the peer connection status (%d)", buf, 8u);
      atomic_load((unsigned __int8 *)p_peerConnected);
      _MBLog();
    }
  }
}

- (void)_handleFileTransferSessionProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(MBTargetDeviceTransferEngine *)self sessionQueue];
  dispatch_assert_queue_V2(v5);

  if (![(MBTargetDeviceTransferEngine *)self isFinished])
  {
    unsigned __int8 v6 = [(MBTargetDeviceTransferEngine *)self delegate];
    -[MBTargetDeviceTransferEngine setConnectionType:](self, "setConnectionType:", +[MBDeviceTransferConnectionInfo connectionTypeFromLinkType:](MBDeviceTransferConnectionInfo, "connectionTypeFromLinkType:", [v4 linkType]));
    if ([v4 type] != 10)
    {
      if ([v4 type] != 11)
      {
LABEL_21:

        goto LABEL_22;
      }
      dispatch_time_t v7 = objc_opt_new();
      [v7 setConnectionState:2];
      objc_msgSend(v7, "setConnectionType:", -[MBTargetDeviceTransferEngine connectionType](self, "connectionType"));
      unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_trackPeerConnectionStatus);
      if (v11)
      {
        atomic_store(0, (unsigned __int8 *)&self->_peerConnected);
        [(MBTargetDeviceTransferEngine *)self _startDisconnectTimer];
        int v12 = [(MBTargetDeviceTransferEngine *)self connection];
        [v6 connection:v12 didUpdateDeviceTransferConnectionInfo:v7];
      }
LABEL_20:

      goto LABEL_21;
    }
    atomic_store(1u, (unsigned __int8 *)&self->_peerConnectedOnce);
    [(MBTargetDeviceTransferEngine *)self _cancelDisconnectTimer];
    dispatch_time_t v7 = objc_opt_new();
    [v7 setConnectionState:1];
    objc_msgSend(v7, "setConnectionType:", -[MBTargetDeviceTransferEngine connectionType](self, "connectionType"));
    if ((id)[(MBTargetDeviceTransferEngine *)self connectionType] == (id)1)
    {
      uint64_t v8 = MBSetChargeLimit();
      id v9 = MBGetDefaultLog();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          *(_DWORD *)buf = 67109120;
          int v18 = 25;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Set charge limit to %d", buf, 8u);
          uint64_t v16 = 25;
          _MBLog();
        }

        [(MBTargetDeviceTransferEngine *)self setChargeToken:v8];
      }
      else
      {
        if (v10)
        {
          *(_DWORD *)buf = 67109120;
          int v18 = 25;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to set charge limit to %d", buf, 8u);
          uint64_t v16 = 25;
          _MBLog();
        }
      }
    }
    unsigned __int8 v13 = atomic_load((unsigned __int8 *)&self->_trackPeerConnectionStatus);
    if (v13)
    {
      atomic_store(1u, (unsigned __int8 *)&self->_peerConnected);
    }
    else
    {
      char v14 = 0;
      atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_peerConnected, (unsigned __int8 *)&v14, 1u);
      if (v14) {
        goto LABEL_19;
      }
    }
    v15 = [(MBTargetDeviceTransferEngine *)self connection];
    [v6 connection:v15 didUpdateDeviceTransferConnectionInfo:v7];

LABEL_19:
    [(MBTargetDeviceTransferEngine *)self _signalControlConnectionStarted];
    goto LABEL_20;
  }
LABEL_22:
}

- (BOOL)_setUpFileTransferSessionWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _setUpFileTransferSessionWithError:]", "MBTargetDeviceTransferEngine.m", 397, "error");
  }
  id v5 = [(MBTargetDeviceTransferEngine *)self fileTransferSession];
  if (!v5) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _setUpFileTransferSessionWithError:]", "MBTargetDeviceTransferEngine.m", 399, "fileTransferSession");
  }
  unsigned __int8 v6 = [(MBTargetDeviceTransferEngine *)self transferDrive];
  if (!v6) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _setUpFileTransferSessionWithError:]", "MBTargetDeviceTransferEngine.m", 401, "transferDrive");
  }
  dispatch_time_t v7 = +[MBBehaviorOptions sharedOptions];
  uint64_t v8 = [(MBTargetDeviceTransferEngine *)self sessionQueue];
  [v5 setDispatchQueue:v8];

  objc_msgSend(v5, "setFlags:", objc_msgSend(v5, "flags") | 3);
  if ([v7 d2dTransferUSBOnly])
  {
    objc_msgSend(v5, "setFlags:", objc_msgSend(v5, "flags") | 0x30);
    objc_msgSend(v5, "setFlags:", (unint64_t)objc_msgSend(v5, "flags") & 0xFFFFFFF3);
  }
  if (([v7 d2dTransferUseCompression] & 1) == 0) {
    objc_msgSend(v5, "setFlags:", (unint64_t)objc_msgSend(v5, "flags") & 0xFFFFFEFF);
  }
  id v9 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Caches/Backup/RFReceiveTemp" isDirectory:1];
  [v5 setTemporaryDirectoryURL:v9];

  BOOL v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting up the FT session: %@", buf, 0xCu);
    _MBLog();
  }

  objc_initWeak((id *)buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10012DA50;
  v19[3] = &unk_100413DF8;
  objc_copyWeak(&v20, (id *)buf);
  [v5 setCompletionHandler:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10012DB40;
  v17[3] = &unk_100413E20;
  objc_copyWeak(&v18, (id *)buf);
  [v5 setProgressHandler:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10012DC54;
  v16[3] = &unk_100413E48;
  v16[4] = self;
  +[MBPeerMessenger registerRequestHandler:v16 forTask:@"MBPeerTaskDone" session:v5];
  [(MBTargetDeviceTransferEngine *)self _startTrackingPeerConnectionStatus];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10012DE14;
  v14[3] = &unk_100411128;
  id v11 = v6;
  id v15 = v11;
  BOOL v12 = [(MBTargetDeviceTransferEngine *)self _waitForControlConnectionWithBlock:v14];
  if (!v12)
  {
    *a3 = +[MBError errorWithCode:15 format:@"Timed out"];
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

  return v12;
}

- (void)_disableInfraWiFi
{
  BOOL v3 = +[MBBehaviorOptions sharedOptions];
  unsigned int v4 = [v3 d2dTransferUSBOnly];

  if (v4)
  {
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not disabling infra WiFi in USB-only mode", buf, 2u);
      _MBLog();
    }
  }
  else
  {
    unsigned __int8 v6 = [(MBTargetDeviceTransferEngine *)self fileTransferSession];
    if (!v6) {
      __assert_rtn("-[MBTargetDeviceTransferEngine _disableInfraWiFi]", "MBTargetDeviceTransferEngine.m", 464, "fileTransferSession");
    }
    id v5 = v6;
    [v6 setFlags:[v6 flags] | 4];
    dispatch_time_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v9 = [v5 flags];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Disabled infra WiFi, flags:0x%x", buf, 8u);
      [v5 flags];
      _MBLog();
    }
  }
}

- (void)_enableInfraWiFi
{
  BOOL v3 = +[MBBehaviorOptions sharedOptions];
  unsigned int v4 = [v3 d2dTransferUSBOnly];

  if (v4)
  {
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not enabling infra WiFi in USB-only mode", buf, 2u);
      _MBLog();
    }
  }
  else
  {
    unsigned __int8 v6 = [(MBTargetDeviceTransferEngine *)self fileTransferSession];
    if (!v6) {
      __assert_rtn("-[MBTargetDeviceTransferEngine _enableInfraWiFi]", "MBTargetDeviceTransferEngine.m", 475, "fileTransferSession");
    }
    id v5 = v6;
    [v6 setFlags:(unint64_t)[v6 flags] & 0xFFFFFFFB];
    dispatch_time_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v9 = [v5 flags];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enabled infra WiFi, flags:0x%x", buf, 8u);
      [v5 flags];
      _MBLog();
    }
  }
}

- (BOOL)_checkFreeDiskSpace:(unint64_t)a3 preflightInfo:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (!v7) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _checkFreeDiskSpace:preflightInfo:error:]", "MBTargetDeviceTransferEngine.m", 482, "preflightInfo");
  }
  if (!a5) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _checkFreeDiskSpace:preflightInfo:error:]", "MBTargetDeviceTransferEngine.m", 483, "error");
  }
  uint64_t v8 = v7;
  unsigned int v9 = (char *)[v7 sourceDeviceDataSize] + 0x1C0000000;
  if ((unint64_t)v9 > a3)
  {
    BOOL v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      char v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = 0x1C0000000;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Insufficient free disk space - totalSize:%llu, reservedSize:%llu, freeDiskSpace:%llu", buf, 0x20u);
      _MBLog();
    }

    id v11 = +[MBError errorWithCode:106 format:@"Insufficient free disk space"];
    *a5 = v11;
    if (!v11) {
      __assert_rtn("-[MBTargetDeviceTransferEngine _checkFreeDiskSpace:preflightInfo:error:]", "MBTargetDeviceTransferEngine.m", 493, "result || *error");
    }
  }

  return (unint64_t)v9 <= a3;
}

- (void)startPreflightWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBTargetDeviceTransferEngine startPreflightWithCompletion:]", "MBTargetDeviceTransferEngine.m", 498, "completion");
  }
  id v5 = v4;
  uint64_t v6 = MBFreeDiskSpace();
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting preflight (freeDiskSpace:%llu)", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10012E5E4;
  id v26 = sub_10012E5F4;
  id v27 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10012E5E4;
  v21[4] = sub_10012E5F4;
  id v22 = 0;
  uint64_t v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  unsigned int v9 = [(MBTargetDeviceTransferEngine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012E5FC;
  block[3] = &unk_1004129C0;
  block[4] = self;
  unint64_t v18 = v8;
  p_long long buf = &buf;
  id v20 = v21;
  BOOL v10 = v8;
  dispatch_async(v9, block);

  id v11 = dispatch_get_global_queue(17, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10012E888;
  v13[3] = &unk_100413F38;
  __int16 v15 = v21;
  uint64_t v16 = &buf;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  dispatch_group_notify(v10, v11, v13);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)startKeychainTransferWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBTargetDeviceTransferEngine startKeychainTransferWithCompletion:]", "MBTargetDeviceTransferEngine.m", 586, "completion");
  }
  id v5 = v4;
  uint64_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting keychain transfer", buf, 2u);
    _MBLog();
  }

  *(void *)long long buf = 0;
  dispatch_queue_t v19 = buf;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10012E5E4;
  id v22 = sub_10012E5F4;
  id v23 = 0;
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  uint64_t v8 = [(MBTargetDeviceTransferEngine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012F100;
  block[3] = &unk_100413240;
  uint64_t v16 = v7;
  __int16 v17 = buf;
  block[4] = self;
  unsigned int v9 = v7;
  dispatch_async(v8, block);

  BOOL v10 = dispatch_get_global_queue(17, 0);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10012F47C;
  v12[3] = &unk_100413EE8;
  id v13 = v5;
  id v14 = buf;
  id v11 = v5;
  dispatch_group_notify(v9, v10, v12);

  _Block_object_dispose(buf, 8);
}

- (void)startKeychainDataTransferWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBTargetDeviceTransferEngine startKeychainDataTransferWithCompletion:]", "MBTargetDeviceTransferEngine.m", 639, "completion");
  }
  id v5 = v4;
  uint64_t v6 = MBFreeDiskSpace();
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting keychain data transfer (freeDiskSpace:%llu)", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10012E5E4;
  id v26 = sub_10012E5F4;
  id v27 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10012E5E4;
  v21[4] = sub_10012E5F4;
  id v22 = 0;
  uint64_t v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  unsigned int v9 = [(MBTargetDeviceTransferEngine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012F8C8;
  block[3] = &unk_1004129C0;
  block[4] = self;
  unint64_t v18 = v8;
  p_long long buf = &buf;
  uint64_t v20 = v21;
  BOOL v10 = v8;
  dispatch_async(v9, block);

  id v11 = dispatch_get_global_queue(17, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10012FB50;
  v13[3] = &unk_100413F38;
  __int16 v15 = v21;
  uint64_t v16 = &buf;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  dispatch_group_notify(v10, v11, v13);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBTargetDeviceTransferEngine startKeychainDataImportWithKeychainInfo:completion:]", "MBTargetDeviceTransferEngine.m", 689, "keychainInfo");
  }
  uint64_t v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBTargetDeviceTransferEngine startKeychainDataImportWithKeychainInfo:completion:]", "MBTargetDeviceTransferEngine.m", 690, "completion");
  }
  uint64_t v9 = MBFreeDiskSpace();
  BOOL v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting keychain data import (freeDiskSpace:%llu)", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_10012E5E4;
  id v27 = sub_10012E5F4;
  id v28 = 0;
  id v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  id v12 = [(MBTargetDeviceTransferEngine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100130060;
  block[3] = &unk_100413F88;
  block[4] = self;
  v21 = v11;
  id v22 = v6;
  p_long long buf = &buf;
  id v13 = v6;
  id v14 = v11;
  dispatch_async(v12, block);

  __int16 v15 = dispatch_get_global_queue(17, 0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100130404;
  v17[3] = &unk_100413EE8;
  id v18 = v8;
  dispatch_queue_t v19 = &buf;
  id v16 = v8;
  dispatch_group_notify(v14, v15, v17);

  _Block_object_dispose(&buf, 8);
}

- (void)startDataTransferWithPreflightInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBTargetDeviceTransferEngine startDataTransferWithPreflightInfo:completion:]", "MBTargetDeviceTransferEngine.m", 747, "preflightInfo");
  }
  uint64_t v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBTargetDeviceTransferEngine startDataTransferWithPreflightInfo:completion:]", "MBTargetDeviceTransferEngine.m", 748, "completion");
  }
  uint64_t v9 = MBFreeDiskSpace();
  BOOL v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting data transfer (freeDiskSpace:%llu)", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_10012E5E4;
  id v28 = sub_10012E5F4;
  id v29 = 0;
  id v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  id v12 = [(MBTargetDeviceTransferEngine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100130878;
  block[3] = &unk_100413FD8;
  block[4] = self;
  v21 = v11;
  id v22 = v6;
  p_long long buf = &buf;
  uint64_t v24 = v9;
  id v13 = v6;
  id v14 = v11;
  dispatch_async(v12, block);

  __int16 v15 = dispatch_get_global_queue(17, 0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100130D0C;
  v17[3] = &unk_100414000;
  id v18 = v8;
  dispatch_queue_t v19 = &buf;
  void v17[4] = self;
  id v16 = v8;
  dispatch_group_notify(v14, v15, v17);

  _Block_object_dispose(&buf, 8);
}

- (BOOL)_removeDirectory:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!a4) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _removeDirectory:error:]", "MBTargetDeviceTransferEngine.m", 829, "error");
  }
  id v6 = v5;
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    __int16 v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing %@", buf, 0xCu);
    _MBLog();
  }

  uint64_t v8 = +[NSFileManager defaultManager];
  unsigned __int8 v9 = [v8 removeItemAtPath:v6 error:a4];

  if (v9) {
    goto LABEL_7;
  }
  BOOL v10 = [*a4 domain];
  if ([v10 isEqualToString:NSCocoaErrorDomain])
  {
    id v11 = [*a4 code];

    if (v11 == (id)4)
    {
LABEL_7:
      BOOL v12 = 1;
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = *a4;
    *(_DWORD *)long long buf = 138412546;
    __int16 v17 = v6;
    __int16 v18 = 2112;
    id v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to remove the directory at %@: %@", buf, 0x16u);
    _MBLog();
  }

  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (void)_start
{
  BOOL v3 = [(MBTargetDeviceTransferEngine *)self queue];
  dispatch_assert_queue_V2(v3);

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100131524;
  v33[3] = &unk_100411478;
  v33[4] = self;
  uint64_t v4 = [(MBTargetDeviceTransferEngine *)self _perform:v33];
  if (!v4)
  {
    id v6 = [(MBTargetDeviceTransferEngine *)self persona];
    id v7 = [v6 userRestoreDirectory];
    id v32 = 0;
    unsigned __int8 v8 = [(MBTargetDeviceTransferEngine *)self _removeDirectory:v7 error:&v32];
    id v5 = v32;

    if (v8)
    {
      unsigned __int8 v9 = [v6 userIncompleteRestoreDirectory];
      id v31 = v5;
      unsigned __int8 v10 = [(MBTargetDeviceTransferEngine *)self _removeDirectory:v9 error:&v31];
      id v11 = v31;

      if ((v10 & 1) == 0)
      {
LABEL_13:
        [(MBTargetDeviceTransferEngine *)self _finishWithError:v11];
        id v5 = v11;
        goto LABEL_15;
      }
      BOOL v12 = [(MBTargetDeviceTransferEngine *)self persona];
      unsigned int v13 = [v12 shouldRestoreToSharedVolume];

      if (!v13) {
        goto LABEL_8;
      }
      id v14 = [v6 sharedRestoreDirectory];
      id v30 = v11;
      unsigned __int8 v15 = [(MBTargetDeviceTransferEngine *)self _removeDirectory:v14 error:&v30];
      id v5 = v30;

      if (v15)
      {
        id v16 = [v6 sharedIncompleteRestoreDirectory];
        id v29 = v5;
        unsigned __int8 v17 = [(MBTargetDeviceTransferEngine *)self _removeDirectory:v16 error:&v29];
        id v11 = v29;

        if (v17)
        {
LABEL_8:
          uint64_t v18 = [(MBTargetDeviceTransferEngine *)self transferDrive];
          [(id)v18 cleanUpReceivedFilesDirectory];

          id v28 = v11;
          LOBYTE(v18) = [(MBTargetDeviceTransferEngine *)self _setUpFileTransferSessionWithError:&v28];
          id v19 = v28;

          if (v18)
          {
            uint64_t v20 = [(MBTargetDeviceTransferEngine *)self progressModel];
            [v20 updateTotalProgressWithPhaseProgress:1 phase:0.0];

            uint64_t v22 = 0;
            id v23 = &v22;
            uint64_t v24 = 0x3032000000;
            uint64_t v25 = sub_10012E5E4;
            uint64_t v26 = sub_10012E5F4;
            id v27 = 0;
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_1001315A4;
            v21[3] = &unk_100413EC0;
            v21[4] = self;
            void v21[5] = &v22;
            id v5 = [(MBTargetDeviceTransferEngine *)self _perform:v21];

            [(MBTargetDeviceTransferEngine *)self setPeerInitResponse:v23[5]];
            if (v5) {
              [(MBTargetDeviceTransferEngine *)self _finishWithError:v5];
            }
            _Block_object_dispose(&v22, 8);
          }
          else
          {
            [(MBTargetDeviceTransferEngine *)self _finishWithError:v19];
            id v5 = v19;
          }
          goto LABEL_15;
        }
        goto LABEL_13;
      }
    }
    [(MBTargetDeviceTransferEngine *)self _finishWithError:v5];
LABEL_15:

    goto LABEL_16;
  }
  id v5 = (id)v4;
  [(MBTargetDeviceTransferEngine *)self _finishWithError:v4];
LABEL_16:
}

- (void)start
{
  BOOL v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = objc_opt_class();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "========== %@ starting", buf, 0xCu);
    objc_opt_class();
    _MBLog();
  }

  MBLogDeviceProperties();
  +[NSDate timeIntervalSinceReferenceDate];
  -[MBTargetDeviceTransferEngine setStartTime:](self, "setStartTime:");
  uint64_t v4 = [(MBTargetDeviceTransferEngine *)self powerAssertion];
  [v4 hold];

  id v5 = [(MBTargetDeviceTransferEngine *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013175C;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_async(v5, block);
}

- (BOOL)_handleTimeout:(BOOL)a3 error:(id *)a4
{
  if (!a4) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _handleTimeout:error:]", "MBTargetDeviceTransferEngine.m", 923, "error");
  }
  BOOL v5 = a3;
  if ([(MBEngine *)self isCanceled])
  {
    CFStringRef v6 = @"Canceled";
    uint64_t v7 = 202;
  }
  else
  {
    if (!v5) {
      return 1;
    }
    CFStringRef v6 = @"Timed out";
    uint64_t v7 = 15;
  }
  uint64_t v8 = +[MBError errorWithCode:v7 format:v6];
  if (v8)
  {
    id v9 = v8;
    *a4 = v9;

    return 0;
  }
  return 1;
}

- (id)_requestInitWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestInitWithError:]", "MBTargetDeviceTransferEngine.m", 942, "error");
  }
  BOOL v5 = [(MBTargetDeviceTransferEngine *)self fileTransferSession];
  if (!v5) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestInitWithError:]", "MBTargetDeviceTransferEngine.m", 944, "fileTransferSession");
  }
  CFStringRef v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending the init request to the source", buf, 2u);
    _MBLog();
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  [(MBTargetDeviceTransferEngine *)self setRequestInitSemaphore:v7];
  if ([(MBEngine *)self isCanceled]
    && ![(MBTargetDeviceTransferEngine *)self _handleTimeout:0 error:a3])
  {
    id v18 = 0;
    goto LABEL_34;
  }
  *(void *)long long buf = 0;
  v52 = buf;
  uint64_t v53 = 0x3032000000;
  v54 = sub_10012E5E4;
  v55 = sub_10012E5F4;
  id v56 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_10012E5E4;
  id v49 = sub_10012E5F4;
  id v50 = 0;
  uint64_t v40 = MBDeviceUDID_Legacy();
  v39 = MBDeviceName();
  id v38 = MBDeviceClass();
  uint64_t v8 = MBBuildVersion();
  id v9 = MBProductVersion();
  unsigned __int8 v10 = [[MBPeerInitRequest alloc] initWithTargetDeviceUDID:v40 deviceName:v39 deviceClass:v38 buildVersion:v8 productVersion:v9];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100131F5C;
  v41[3] = &unk_100414028;
  uint64_t v43 = &v45;
  uint64_t v44 = buf;
  id v11 = v7;
  uint64_t v42 = v11;
  +[MBPeerMessenger sendRequest:v10 session:v5 responseHandler:v41];
  dispatch_time_t v12 = dispatch_time(0, 3600000000000);
  intptr_t v13 = dispatch_semaphore_wait(v11, v12);
  [(MBTargetDeviceTransferEngine *)self setRequestInitSemaphore:0];
  if ([(MBTargetDeviceTransferEngine *)self _handleTimeout:v13 != 0 error:a3])
  {
    if (*((void *)v52 + 5))
    {
      id v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v15 = v14;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = objc_opt_class();
          uint64_t v17 = *((void *)v52 + 5);
          *(_DWORD *)v57 = 138412546;
          uint64_t v58 = v16;
          __int16 v59 = 2112;
          uint64_t v60 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Request %@ failed: %@", v57, 0x16u);
        }

        objc_opt_class();
        _MBLog();
      }

      id v18 = 0;
      *a3 = *((id *)v52 + 5);
      goto LABEL_33;
    }
    id v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = v46[5];
      *(_DWORD *)v57 = 138412290;
      uint64_t v58 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received init response: %@", v57, 0xCu);
      uint64_t v35 = v46[5];
      _MBLog();
    }

    v21 = [(id)v46[5] sourceProtocolVersion];
    if (!v21) {
      __assert_rtn("-[MBTargetDeviceTransferEngine _requestInitWithError:]", "MBTargetDeviceTransferEngine.m", 982, "sourceProtocolVersion");
    }
    uint64_t v22 = [(id)v46[5] sourceProductVersion];
    if (!v22) {
      __assert_rtn("-[MBTargetDeviceTransferEngine _requestInitWithError:]", "MBTargetDeviceTransferEngine.m", 984, "sourceProductVersion");
    }
    uint64_t v37 = [(id)v46[5] sourceRequiredProductVersion];
    uint64_t v23 = [(id)v46[5] sourceDeviceClass];
    id v36 = (void *)v22;
    if (!v23) {
      __assert_rtn("-[MBTargetDeviceTransferEngine _requestInitWithError:]", "MBTargetDeviceTransferEngine.m", 987, "sourceDeviceClass");
    }
    uint64_t v24 = (void *)v23;
    if ((unint64_t)[v21 unsignedLongValue] <= 1)
    {
      uint64_t v26 = MBProductVersion();
      int v27 = MBIsRestoreCompatible();

      if (v27)
      {
        id v28 = MBDeviceClass();
        unsigned __int8 v29 = [v24 isEqualToString:v28];

        if (v29)
        {
          id v30 = 0;
LABEL_32:
          id v18 = (id)v46[5];

          goto LABEL_33;
        }
        CFStringRef v25 = @"Cross-device data transfer is not supported";
        uint64_t v31 = 1;
LABEL_28:
        +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v31, v25, v35);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          id v32 = (void *)v46[5];
          v46[5] = 0;

          id v30 = v30;
          *a3 = v30;
          id v33 = MBGetDefaultLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v57 = 138412290;
            uint64_t v58 = (uint64_t)v30;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to handshake with the source: %@", v57, 0xCu);
            _MBLog();
          }
        }
        goto LABEL_32;
      }
      CFStringRef v25 = @"Incompatible product version";
    }
    else
    {
      CFStringRef v25 = @"Incompatible protocol version";
    }
    uint64_t v31 = 203;
    goto LABEL_28;
  }
  id v18 = 0;
LABEL_33:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(buf, 8);

LABEL_34:
  return v18;
}

- (id)_requestPreflightWithSourceInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestPreflightWithSourceInfo:error:]", "MBTargetDeviceTransferEngine.m", 1008, "sourceInfo");
  }
  if (!a4) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestPreflightWithSourceInfo:error:]", "MBTargetDeviceTransferEngine.m", 1009, "error");
  }
  dispatch_semaphore_t v7 = v6;
  uint64_t v8 = [(MBTargetDeviceTransferEngine *)self fileTransferSession];
  if (!v8) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestPreflightWithSourceInfo:error:]", "MBTargetDeviceTransferEngine.m", 1011, "fileTransferSession");
  }
  id v9 = +[NSDate date];
  [(MBTargetDeviceTransferEngine *)self setPreflightStartDate:v9];

  [(MBTargetDeviceTransferEngine *)self setPreflightDuration:0];
  __uint64_t v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  id v11 = [(MBTargetDeviceTransferEngine *)self progressModel];
  [v11 updateTotalProgressWithPhaseProgress:2 phase:0.0];

  dispatch_time_t v12 = [v7 sourceDeviceName];
  intptr_t v13 = [v7 sourceDeviceUDID];
  id v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting to preflight on \"%@\" (%@)", buf, 0x16u);
    int v27 = v12;
    id v28 = v13;
    _MBLog();
  }

  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  [(MBTargetDeviceTransferEngine *)self setRequestPreflightSemaphore:v15];
  if ([(MBEngine *)self isCanceled]
    && ![(MBTargetDeviceTransferEngine *)self _handleTimeout:0 error:a4])
  {
    id v24 = 0;
  }
  else
  {
    __uint64_t v29 = v10;
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v45 = sub_10012E5E4;
    v46 = sub_10012E5F4;
    id v47 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    uint64_t v37 = sub_10012E5E4;
    id v38 = sub_10012E5F4;
    id v39 = 0;
    uint64_t v16 = [[MBPeerPreflightRequest alloc] initWithFreeDiskSpace:MBFreeDiskSpace() purgeSize:0];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1001325BC;
    v30[3] = &unk_100414050;
    id v32 = &v34;
    id v33 = buf;
    uint64_t v17 = v15;
    uint64_t v31 = v17;
    +[MBPeerMessenger sendRequest:v16 session:v8 responseHandler:v30];
    dispatch_time_t v18 = dispatch_time(0, 604800000000000);
    intptr_t v19 = dispatch_semaphore_wait(v17, v18);
    [(MBTargetDeviceTransferEngine *)self setRequestPreflightSemaphore:0];
    if (-[MBTargetDeviceTransferEngine _handleTimeout:error:](self, "_handleTimeout:error:", v19 != 0, a4, v27, v28))
    {
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        uint64_t v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = objc_opt_class();
            uint64_t v23 = *(void **)(*(void *)&buf[8] + 40);
            *(_DWORD *)uint64_t v40 = 138412546;
            uint64_t v41 = v22;
            __int16 v42 = 2112;
            uint64_t v43 = v23;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Request %@ failed: %@", v40, 0x16u);
          }

          objc_opt_class();
          _MBLog();
        }

        id v24 = 0;
        *a4 = *(id *)(*(void *)&buf[8] + 40);
      }
      else
      {
        [(MBTargetDeviceTransferEngine *)self setPreflightDuration:(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - v29) / 0x3B9ACA00];
        CFStringRef v25 = MBGetDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v40 = 138412546;
          uint64_t v41 = (uint64_t)v12;
          __int16 v42 = 2112;
          uint64_t v43 = v13;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Finished preflighting on \"%@\" (%@)", v40, 0x16u);
          _MBLog();
        }

        id v24 = (id)v35[5];
      }
    }
    else
    {
      id v24 = 0;
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(buf, 8);
  }
  return v24;
}

- (id)_requestKeychainWithSourceInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestKeychainWithSourceInfo:error:]", "MBTargetDeviceTransferEngine.m", 1057, "sourceInfo");
  }
  if (!a4) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestKeychainWithSourceInfo:error:]", "MBTargetDeviceTransferEngine.m", 1058, "error");
  }
  dispatch_semaphore_t v7 = v6;
  uint64_t v8 = [(MBTargetDeviceTransferEngine *)self fileTransferSession];
  if (!v8) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestKeychainWithSourceInfo:error:]", "MBTargetDeviceTransferEngine.m", 1060, "fileTransferSession");
  }
  id v9 = [v7 sourceDeviceName];
  __uint64_t v10 = [v7 sourceDeviceUDID];
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting to transfer the keychain data from \"%@\" (%@)", buf, 0x16u);
    CFStringRef v25 = v9;
    uint64_t v26 = v10;
    _MBLog();
  }

  dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
  -[MBTargetDeviceTransferEngine setRequestKeychainSemaphore:](self, "setRequestKeychainSemaphore:");
  if ([(MBEngine *)self isCanceled]
    && ![(MBTargetDeviceTransferEngine *)self _handleTimeout:0 error:a4])
  {
    id v22 = 0;
  }
  else
  {
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v43 = sub_10012E5E4;
    uint64_t v44 = sub_10012E5F4;
    id v45 = 0;
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000;
    uint64_t v35 = sub_10012E5E4;
    uint64_t v36 = sub_10012E5F4;
    id v37 = 0;
    dispatch_time_t v12 = a4;
    uint64_t v13 = objc_opt_new();
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100132B88;
    v28[3] = &unk_100414078;
    id v30 = &v32;
    uint64_t v31 = buf;
    id v14 = v27;
    __uint64_t v29 = v14;
    dispatch_semaphore_t v15 = (void *)v13;
    +[MBPeerMessenger sendRequest:v13 session:v8 responseHandler:v28];
    dispatch_time_t v16 = dispatch_time(0, 3600000000000);
    intptr_t v17 = dispatch_semaphore_wait(v14, v16);
    [(MBTargetDeviceTransferEngine *)self setRequestKeychainSemaphore:0];
    if (-[MBTargetDeviceTransferEngine _handleTimeout:error:](self, "_handleTimeout:error:", v17 != 0, v12, v25, v26))
    {
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        dispatch_time_t v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          intptr_t v19 = v18;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = objc_opt_class();
            v21 = *(void **)(*(void *)&buf[8] + 40);
            *(_DWORD *)id v38 = 138412546;
            uint64_t v39 = v20;
            __int16 v40 = 2112;
            uint64_t v41 = v21;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Request %@ failed: %@", v38, 0x16u);
          }

          objc_opt_class();
          _MBLog();
        }

        id v22 = 0;
        id *v12 = *(id *)(*(void *)&buf[8] + 40);
      }
      else
      {
        uint64_t v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v38 = 138412546;
          uint64_t v39 = (uint64_t)v9;
          __int16 v40 = 2112;
          uint64_t v41 = v10;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Finished transferring the keychain data from \"%@\" (%@)", v38, 0x16u);
          _MBLog();
        }

        id v22 = (id)v33[5];
      }
    }
    else
    {
      id v22 = 0;
    }

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(buf, 8);
  }
  return v22;
}

- (BOOL)_restoreKeychainWithKeychainTransferResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _restoreKeychainWithKeychainTransferResponse:error:]", "MBTargetDeviceTransferEngine.m", 1099, "keybagTransferResponse");
  }
  if (!a4) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _restoreKeychainWithKeychainTransferResponse:error:]", "MBTargetDeviceTransferEngine.m", 1100, "error");
  }
  dispatch_semaphore_t v7 = v6;
  uint64_t v8 = [v6 keychainFileName];
  id v9 = [v7 keybagData];
  __uint64_t v10 = [v7 passwordData];
  id v11 = [(MBTargetDeviceTransferEngine *)self transferDrive];
  dispatch_time_t v12 = [v11 fullURLForDriveRelativePath:v8];
  uint64_t v13 = [v12 path];

  if (!v13)
  {
    CFStringRef v27 = @"nil keychain file path";
LABEL_23:
    +[MBError errorWithCode:1 format:v27];
    BOOL v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (!v9)
  {
    CFStringRef v27 = @"nil keybag data";
    goto LABEL_23;
  }
  if (!v10)
  {
    CFStringRef v27 = @"nil password data";
    goto LABEL_23;
  }
  id v14 = +[NSFileManager defaultManager];
  id v34 = 0;
  dispatch_semaphore_t v15 = [v14 attributesOfItemAtPath:v13 error:&v34];
  id v16 = v34;

  uint64_t v31 = v15;
  if (v15)
  {
    id v30 = [v15 objectForKeyedSubscript:NSFileSize];
    intptr_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v30 unsignedLongLongValue];
      id v19 = [v9 length];
      *(_DWORD *)long long buf = 138412802;
      uint64_t v36 = v13;
      __int16 v37 = 2048;
      id v38 = v18;
      __int16 v39 = 2048;
      id v40 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Restoring the keychain from %@ (size:%llu, keybagData.length:%ld)", buf, 0x20u);
      [v30 unsignedLongLongValue];
      [v9 length];
      _MBLog();
    }

    id v33 = v16;
    BOOL v20 = RestoreKeychainFromDisk(v13, (uint64_t)v9, (uint64_t)v10, &v33);
    id v21 = v33;

    if (!v20)
    {
      id v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v36 = v13;
        __int16 v37 = 2112;
        id v38 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to restore the keychain from %@: %@", buf, 0x16u);
        _MBLog();
      }

      *a4 = v21;
    }
    uint64_t v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Removing the keychain temporary file at %@", buf, 0xCu);
      _MBLog();
    }

    id v24 = +[NSFileManager defaultManager];
    id v32 = v21;
    unsigned __int8 v25 = [v24 removeItemAtPath:v13 error:&v32];
    id v16 = v32;

    if ((v25 & 1) == 0)
    {
      uint64_t v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v36 = v13;
        __int16 v37 = 2112;
        id v38 = v16;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to remove the keychain temporary file at %@: %@", buf, 0x16u);
        _MBLog();
      }
    }
  }
  else
  {
    id v28 = MBGetDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v36 = v13;
      __int16 v37 = 2112;
      id v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to fetch the attributes for %@: %@", buf, 0x16u);
      _MBLog();
    }

    +[MBError errorWithCode:1 error:v16 format:@"Failed to fetch the attributes for the keychain temporary file"];
    BOOL v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_28:
  return v20;
}

- (BOOL)_requestBackupWithSourceInfo:(id)a3 preflightInfo:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestBackupWithSourceInfo:preflightInfo:error:]", "MBTargetDeviceTransferEngine.m", 1145, "sourceInfo");
  }
  __uint64_t v10 = v9;
  if (!v9) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestBackupWithSourceInfo:preflightInfo:error:]", "MBTargetDeviceTransferEngine.m", 1146, "preflightInfo");
  }
  if (!a5) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestBackupWithSourceInfo:preflightInfo:error:]", "MBTargetDeviceTransferEngine.m", 1147, "error");
  }
  id v40 = [(MBTargetDeviceTransferEngine *)self fileTransferSession];
  if (!v40) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _requestBackupWithSourceInfo:preflightInfo:error:]", "MBTargetDeviceTransferEngine.m", 1149, "fileTransferSession");
  }
  id v11 = +[NSDate date];
  [(MBTargetDeviceTransferEngine *)self setFileTransferStartDate:v11];
  dispatch_time_t v12 = [(MBTargetDeviceTransferEngine *)self progressModel];
  [v12 setFileTransferStartDate:v11];

  uint64_t v13 = [(MBTargetDeviceTransferEngine *)self progressModel];
  [v13 updateTotalProgressWithPhaseProgress:3 phase:0.0];

  unint64_t v37 = (unint64_t)[v10 sourceDeviceDataSize];
  __int16 v39 = [v8 sourceDeviceName];
  *(double *)&id v38 = [v8 sourceDeviceUDID];
  +[NSDate timeIntervalSinceReferenceDate];
  double v15 = v14;
  id v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218498;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 2112;
    v54 = v38;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Starting to transfer data (%llu) from \"%@\" (%@)", buf, 0x20u);
    _MBLog();
  }

  objc_initWeak(&location, self);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1001338B4;
  v44[3] = &unk_1004140A0;
  objc_copyWeak(&v45, &location);
  intptr_t v17 = [(MBTargetDeviceTransferEngine *)self transferDrive];
  [v17 setReceiveProgressHandler:v44];

  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  [(MBTargetDeviceTransferEngine *)self setRequestBackupSemaphore:v18];
  if ([(MBEngine *)self isCanceled]
    && ![(MBTargetDeviceTransferEngine *)self _handleTimeout:0 error:a5])
  {
    BOOL v30 = 0;
  }
  else
  {
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v54 = sub_10012E5E4;
    v55 = sub_10012E5F4;
    id v56 = 0;
    id v19 = MBDeviceUDID_Legacy();
    BOOL v20 = +[NSNumber numberWithUnsignedLongLong:MBFreeDiskSpace()];
    id v21 = [[MBPeerTransferRequest alloc] initWithTargetDeviceUDID:v19 freeDiskSpace:v20];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100133958;
    v41[3] = &unk_1004140C8;
    uint64_t v43 = buf;
    id v22 = v18;
    __int16 v42 = v22;
    +[MBPeerMessenger sendRequest:v21 session:v40 responseHandler:v41];
    dispatch_time_t v23 = dispatch_time(0, 604800000000000);
    intptr_t v24 = dispatch_semaphore_wait(v22, v23);
    [(MBTargetDeviceTransferEngine *)self setRequestBackupSemaphore:0];
    unsigned __int8 v25 = [(MBTargetDeviceTransferEngine *)self transferDrive];
    [v25 setReceiveProgressHandler:0];

    if ([(MBTargetDeviceTransferEngine *)self _handleTimeout:v24 != 0 error:a5])
    {
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        uint64_t v26 = MBGetDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          CFStringRef v27 = v26;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = objc_opt_class();
            double v29 = *(double *)(*(void *)&buf[8] + 40);
            *(_DWORD *)id v47 = 138412546;
            unint64_t v48 = v28;
            __int16 v49 = 2112;
            double v50 = v29;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Request %@ failed: %@", v47, 0x16u);
          }

          objc_opt_class();
          _MBLog();
        }

        BOOL v30 = 0;
        *a5 = *(id *)(*(void *)&buf[8] + 40);
      }
      else
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v32 = v31;
        id v33 = MBGetDefaultLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v47 = 138412546;
          unint64_t v48 = (unint64_t)v39;
          __int16 v49 = 2112;
          double v50 = *(double *)&v38;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Finished transferring data from \"%@\" (%@)", v47, 0x16u);
          _MBLog();
        }

        id v34 = MBGetDefaultLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v47 = 134218496;
          unint64_t v48 = v37;
          __int16 v49 = 2048;
          double v50 = v32 - v15;
          __int16 v51 = 2048;
          double v52 = (double)(v37 >> 20) / (v32 - v15);
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Total bytes transferred: %llu. Total time spent on transferring: %f. Average throughput: %.2f", v47, 0x20u);
          _MBLog();
        }

        uint64_t v35 = +[NSDate date];
        [(MBTargetDeviceTransferEngine *)self setFileTransferEndDate:v35];

        BOOL v30 = 1;
      }
    }
    else
    {
      BOOL v30 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

  return v30;
}

- (void)_saveDeviceTransferInfo
{
  BOOL v3 = objc_opt_new();
  uint64_t v4 = MBBuildVersion();
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"BuildVersion"];
  }
  CFStringRef v27 = (void *)v4;
  BOOL v5 = +[NSNumber numberWithInteger:[(MBTargetDeviceTransferEngine *)self connectionType]];
  [v3 setObject:v5 forKeyedSubscript:@"ConnectionType"];

  id v6 = [(MBTargetDeviceTransferEngine *)self peerInitResponse];
  dispatch_semaphore_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 sourceDeviceUDID];
    if (v8) {
      [v3 setObject:v8 forKeyedSubscript:@"SourceDeviceUDID"];
    }
    id v9 = [v7 sourceProtocolVersion];
    if (v9) {
      [v3 setObject:v9 forKeyedSubscript:@"SourceDeviceProtocolVersion"];
    }
    __uint64_t v10 = [v7 sourceBuildVersion];
    if (v10) {
      [v3 setObject:v10 forKeyedSubscript:@"SourceDeviceBuildVersion"];
    }
  }
  id v11 = [(MBTargetDeviceTransferEngine *)self progressModel];
  dispatch_time_t v12 = [v11 progressInfo];

  if (v12)
  {
    uint64_t v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 bytesTransferred]);
    [v3 setObject:v13 forKeyedSubscript:@"BytesTransferred"];

    double v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 filesTransferred]);
    [v3 setObject:v14 forKeyedSubscript:@"FilesTransferred"];
  }
  double v15 = [(MBTargetDeviceTransferEngine *)self preflightStartDate];
  unint64_t v16 = [(MBTargetDeviceTransferEngine *)self preflightDuration];
  if (v16)
  {
    intptr_t v17 = +[NSNumber numberWithUnsignedLongLong:v16];
    [v3 setObject:v17 forKeyedSubscript:@"PreflightDuration"];
  }
  if (v15) {
    [v3 setObject:v15 forKeyedSubscript:@"PreflightStartDate"];
  }
  dispatch_semaphore_t v18 = [(MBTargetDeviceTransferEngine *)self fileTransferStartDate];
  id v19 = [(MBTargetDeviceTransferEngine *)self fileTransferEndDate];
  BOOL v20 = v19;
  if (v18 && v19)
  {
    [v19 timeIntervalSinceDate:v18];
    uint64_t v22 = (uint64_t)v21;
    [v3 setObject:v18 forKeyedSubscript:@"FileTransferStartDate"];
    dispatch_time_t v23 = +[NSNumber numberWithLongLong:v22];
    [v3 setObject:v23 forKeyedSubscript:@"FileTransferDuration"];
  }
  intptr_t v24 = [(MBTargetDeviceTransferEngine *)self restoreStartDate];
  if (v24) {
    [v3 setObject:v24 forKeyedSubscript:@"RestoreStartDate"];
  }
  unsigned __int8 v25 = +[MBPersona personalPersonaWithError:0];
  [v25 setPreferencesValue:v3 forKey:@"DeviceTransferInfo"];
  uint64_t v26 = MBGetDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    CFStringRef v29 = @"DeviceTransferInfo";
    __int16 v30 = 2112;
    double v31 = v3;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Saved \"%{public}@\": %@", buf, 0x16u);
    _MBLog();
  }
}

- (BOOL)_restoreWithSourceInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _restoreWithSourceInfo:error:]", "MBTargetDeviceTransferEngine.m", 1253, "sourceInfo");
  }
  if (!a4) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _restoreWithSourceInfo:error:]", "MBTargetDeviceTransferEngine.m", 1254, "error");
  }
  dispatch_semaphore_t v7 = v6;
  id v8 = [v6 sourceDeviceName];
  id v9 = [v7 sourceDeviceUDID];
  __uint64_t v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v19 = v8;
    __int16 v20 = 2112;
    double v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting to restore data from \"%@\" (%@)", buf, 0x16u);
    _MBLog();
  }

  id v11 = +[NSDate date];
  [(MBTargetDeviceTransferEngine *)self setRestoreStartDate:v11];
  dispatch_time_t v12 = [(MBTargetDeviceTransferEngine *)self progressModel];
  [v12 setRestoreStartDate:v11];

  [(MBTargetDeviceTransferEngine *)self progressUpdatedWithPercentage:0 size:0.0];
  [(MBTargetDeviceTransferEngine *)self _saveDeviceTransferInfo];
  uint64_t v13 = [(MBTargetDeviceTransferEngine *)self _restoreEngineWithSourceInfo:v7];
  double v14 = [v13 restore];
  double v15 = MBGetDefaultLog();
  unint64_t v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412802;
      id v19 = v8;
      __int16 v20 = 2112;
      double v21 = v9;
      __int16 v22 = 2112;
      dispatch_time_t v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to restore data from \"%@\" (%@): %@", buf, 0x20u);
      _MBLog();
    }

    *a4 = v14;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      double v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finished restoring data from \"%@\" (%@)", buf, 0x16u);
      _MBLog();
    }
  }
  return v14 == 0;
}

- (id)_restoreEngineWithSourceInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MBDriveSettingsContext defaultSettingsContext];
  [v5 setIsDeviceTransfer:1];
  id v6 = MBAllDrivePlugins();
  [v5 setPlugins:v6];

  dispatch_semaphore_t v7 = [v4 sourceDeviceUDID];
  [v5 setSourceIdentifier:v7];

  id v8 = MBDeviceUDID_Legacy();
  [v5 setTargetIdentifier:v8];

  id v9 = [(MBTargetDeviceTransferEngine *)self transferLocalDrive];
  if (!v9) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _restoreEngineWithSourceInfo:]", "MBTargetDeviceTransferEngine.m", 1292, "self.transferLocalDrive");
  }

  __uint64_t v10 = [(MBTargetDeviceTransferEngine *)self transferLocalDrive];
  [v5 setDrive:v10];

  id v11 = +[MBCKManager sharedInstance];
  [v5 setManager:v11];

  [v5 setApplicationIDs:0];
  dispatch_time_t v12 = [[MBDriveRestoreEngine alloc] initWithSettingsContext:v5 debugContext:0];
  uint64_t v13 = [(MBDriveRestoreEngine *)v12 progress];
  [v13 setDelegate:self];

  return v12;
}

- (void)_sendDoneMessageWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MBTargetDeviceTransferEngine *)self fileTransferSession];
  if (!v5) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _sendDoneMessageWithError:]", "MBTargetDeviceTransferEngine.m", 1305, "fileTransferSession");
  }
  id v6 = (void *)v5;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_peerConnectedOnce);
  if ((v7 & 1) == 0
    || (unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_receivedDoneMessage), (v8 & 1) != 0)
    || (unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_sentDoneMessage), (v9 & 1) != 0)
    || (atomic_exchange((atomic_uchar *volatile)&self->_sendingDoneMessage, 1u) & 1) != 0)
  {
    dispatch_time_t v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v22 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not sending %@", buf, 0xCu);
      objc_opt_class();
      _MBLog();
    }
  }
  else
  {
    __uint64_t v10 = [[MBPeerDoneRequest alloc] initWithError:v4];
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001344D8;
    v17[3] = &unk_1004140F0;
    dispatch_time_t v12 = v10;
    dispatch_semaphore_t v18 = v12;
    id v19 = self;
    uint64_t v13 = v11;
    __int16 v20 = v13;
    +[MBPeerMessenger sendRequest:v12 session:v6 responseHandler:v17];
    dispatch_time_t v14 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v13, v14))
    {
      double v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = objc_opt_class();
        *(_DWORD *)long long buf = 138412290;
        uint64_t v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Timed out waiting for %@", buf, 0xCu);
        objc_opt_class();
        _MBLog();
      }

      [(MBTargetDeviceTransferEngine *)self _stopTrackingPeerConnectionStatus];
    }
  }
}

- (void)_sendRestoreProgressMessageWithPercentage:(unint64_t)a3
{
  uint64_t v5 = [(MBTargetDeviceTransferEngine *)self fileTransferSession];
  if (!v5) {
    __assert_rtn("-[MBTargetDeviceTransferEngine _sendRestoreProgressMessageWithPercentage:]", "MBTargetDeviceTransferEngine.m", 1339, "fileTransferSession");
  }
  id v6 = (void *)v5;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_peerConnectedOnce);
  if (v7 & 1) == 0 || (unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_receivedDoneMessage), (v8))
  {
    __uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
  }
  else
  {
    unsigned __int8 v9 = self;
    objc_sync_enter(v9);
    if (v9->_lastRestoreProgressPercentage == a3)
    {
      objc_sync_exit(v9);
    }
    else
    {
      v9->_lastRestoreProgressPercentage = a3;
      objc_sync_exit(v9);

      if (a3 <= 0x64 && (atomic_exchange((atomic_uchar *volatile)&v9->_sendingRestoreProgressMessage, 1u) & 1) == 0)
      {
        dispatch_semaphore_t v11 = [(MBTargetDeviceTransferEngine *)v9 progressGroup];
        dispatch_time_t v12 = dispatch_get_global_queue(17, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001348E8;
        block[3] = &unk_100412AB0;
        unint64_t v16 = a3;
        dispatch_time_t v14 = v6;
        double v15 = v9;
        dispatch_group_async(v11, v12, block);

        __uint64_t v10 = v14;
        goto LABEL_13;
      }
    }
    __uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:
      *(_DWORD *)long long buf = 138412290;
      uint64_t v18 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not sending %@", buf, 0xCu);
      objc_opt_class();
      _MBLog();
    }
  }
LABEL_13:
}

- (void)updatedTotalProgress:(id)a3
{
  id v4 = a3;
  if (![(MBEngine *)self isCanceled])
  {
    uint64_t v5 = [(MBTargetDeviceTransferEngine *)self progressGroup];
    id v6 = [(MBTargetDeviceTransferEngine *)self sessionQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100134CFC;
    v7[3] = &unk_1004110B0;
    v7[4] = self;
    id v8 = v4;
    dispatch_group_async(v5, v6, v7);
  }
}

- (void)progressUpdatedWithPercentage:(double)a3 size:(unint64_t)a4
{
  id v6 = [(MBTargetDeviceTransferEngine *)self progressModel];
  [v6 updateTotalProgressWithPhaseProgress:4 phase:a3 / 100.0];

  [(MBTargetDeviceTransferEngine *)self _sendRestoreProgressMessageWithPercentage:(unint64_t)a3];
}

- (MBConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (MBServiceManagerDeviceTransferDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MBServiceManagerDeviceTransferDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_semaphore)requestInitSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRequestInitSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)requestPreflightSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRequestPreflightSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)requestKeychainSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 192, 1);
}

- (void)setRequestKeychainSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)requestBackupSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRequestBackupSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)connectSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 208, 1);
}

- (void)setConnectSemaphore:(id)a3
{
}

- (OS_dispatch_source)disconnectTimer
{
  return self->_disconnectTimer;
}

- (void)setDisconnectTimer:(id)a3
{
}

- (MBPeerTransferDrive)transferDrive
{
  return (MBPeerTransferDrive *)objc_getProperty(self, a2, 224, 1);
}

- (MBDeviceTransferLocalDrive)transferLocalDrive
{
  return (MBDeviceTransferLocalDrive *)objc_getProperty(self, a2, 232, 1);
}

- (MBDeviceTransferProgressModel)progressModel
{
  return (MBDeviceTransferProgressModel *)objc_getProperty(self, a2, 240, 1);
}

- (MBDeviceLockAssertion)deviceLockAssertion
{
  return self->_deviceLockAssertion;
}

- (void)setDeviceLockAssertion:(id)a3
{
}

- (MBPowerAssertion)powerAssertion
{
  return self->_powerAssertion;
}

- (void)setPowerAssertion:(id)a3
{
}

- (RPFileTransferSession)fileTransferSession
{
  return self->_fileTransferSession;
}

- (void)setFileTransferSession:(id)a3
{
}

- (MBPeerInitResponse)peerInitResponse
{
  return (MBPeerInitResponse *)objc_getProperty(self, a2, 272, 1);
}

- (void)setPeerInitResponse:(id)a3
{
}

- (MBDeviceTransferPreflight)peerPreflightInfo
{
  return (MBDeviceTransferPreflight *)objc_getProperty(self, a2, 280, 1);
}

- (void)setPeerPreflightInfo:(id)a3
{
}

- (MBPeerKeychainTransferResponse)peerKeychainTransferResponse
{
  return (MBPeerKeychainTransferResponse *)objc_getProperty(self, a2, 288, 1);
}

- (void)setPeerKeychainTransferResponse:(id)a3
{
}

- (MBDeviceTransferKeychain)peerKeychainInfo
{
  return (MBDeviceTransferKeychain *)objc_getProperty(self, a2, 296, 1);
}

- (void)setPeerKeychainInfo:(id)a3
{
}

- (NSError)completionError
{
  return self->_completionError;
}

- (void)setCompletionError:(id)a3
{
}

- (NSDate)preflightStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setPreflightStartDate:(id)a3
{
}

- (MBPeerPreflightResponse)peerPreflightResponse
{
  return (MBPeerPreflightResponse *)objc_getProperty(self, a2, 320, 1);
}

- (void)setPeerPreflightResponse:(id)a3
{
}

- (unint64_t)preflightDuration
{
  return self->_preflightDuration;
}

- (void)setPreflightDuration:(unint64_t)a3
{
  self->_preflightDuration = a3;
}

- (NSDate)fileTransferStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (void)setFileTransferStartDate:(id)a3
{
}

- (NSDate)fileTransferEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 344, 1);
}

- (void)setFileTransferEndDate:(id)a3
{
}

- (NSDate)restoreStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 352, 1);
}

- (void)setRestoreStartDate:(id)a3
{
}

- (OS_dispatch_group)progressGroup
{
  return self->_progressGroup;
}

- (void)setProgressGroup:(id)a3
{
}

- (unint64_t)lastRestoreProgressPercentage
{
  return self->_lastRestoreProgressPercentage;
}

- (void)setLastRestoreProgressPercentage:(unint64_t)a3
{
  self->_lastRestoreProgressPercentage = a3;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

- (__CFString)chargeToken
{
  return self->_chargeToken;
}

- (void)setChargeToken:(__CFString *)a3
{
  self->_chargeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressGroup, 0);
  objc_storeStrong((id *)&self->_restoreStartDate, 0);
  objc_storeStrong((id *)&self->_fileTransferEndDate, 0);
  objc_storeStrong((id *)&self->_fileTransferStartDate, 0);
  objc_storeStrong((id *)&self->_peerPreflightResponse, 0);
  objc_storeStrong((id *)&self->_preflightStartDate, 0);
  objc_storeStrong((id *)&self->_completionError, 0);
  objc_storeStrong((id *)&self->_peerKeychainInfo, 0);
  objc_storeStrong((id *)&self->_peerKeychainTransferResponse, 0);
  objc_storeStrong((id *)&self->_peerPreflightInfo, 0);
  objc_storeStrong((id *)&self->_peerInitResponse, 0);
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_deviceLockAssertion, 0);
  objc_storeStrong((id *)&self->_progressModel, 0);
  objc_storeStrong((id *)&self->_transferLocalDrive, 0);
  objc_storeStrong((id *)&self->_transferDrive, 0);
  objc_storeStrong((id *)&self->_disconnectTimer, 0);
  objc_storeStrong((id *)&self->_connectSemaphore, 0);
  objc_storeStrong((id *)&self->_requestBackupSemaphore, 0);
  objc_storeStrong((id *)&self->_requestKeychainSemaphore, 0);
  objc_storeStrong((id *)&self->_requestPreflightSemaphore, 0);
  objc_storeStrong((id *)&self->_requestInitSemaphore, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_personalPersona, 0);
}

@end