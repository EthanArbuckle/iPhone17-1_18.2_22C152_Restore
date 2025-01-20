@interface MBSourceDeviceTransferEngine
- (BOOL)_setUpFileTransferSessionWithError:(id *)a3;
- (BOOL)_setUpWithError:(id *)a3;
- (BOOL)_updateOpenFdsLimit:(unint64_t)a3;
- (BOOL)_waitForControlConnectionWithBlock:(id)a3;
- (BOOL)cancel;
- (BOOL)isFinished;
- (MBCacheDeleteRequest)cacheDeleteRequest;
- (MBConnection)connection;
- (MBDeviceLockAssertion)deviceLockAssertion;
- (MBDeviceTransferProgressModel)progressModel;
- (MBDriveBackupEngine)driveBackupEngine;
- (MBDriveSettingsContext)driveSettingsContext;
- (MBPeerInitRequest)peerInitRequest;
- (MBPeerPreflightResponse)peerPreflightResponse;
- (MBPeerTransferDrive)transferDrive;
- (MBPowerAssertion)powerAssertion;
- (MBServiceManagerDeviceTransferDelegate)delegate;
- (MBSourceDeviceTransferEngine)initWithSessionInfo:(id)a3;
- (OS_dispatch_group)peerTaskGroup;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)connectSemaphore;
- (OS_dispatch_source)disconnectTimer;
- (OS_os_transaction)transaction;
- (RPFileTransferSession)fileTransferSession;
- (__CFString)chargeToken;
- (double)startTime;
- (id)_backupEngineWithPreflightRequest:(id)a3;
- (id)_handleError:(id)a3;
- (id)completionHandler;
- (id)engineModeString;
- (int)engineType;
- (int64_t)connectionType;
- (unint64_t)_purgeableDiskSpace;
- (void)_cancelBackupEngine;
- (void)_cancelDisconnectTimer;
- (void)_cleanUpBackupEngine;
- (void)_disableInfraWiFi;
- (void)_enableInfraWiFi;
- (void)_finishWithError:(id)a3;
- (void)_handleFileTransferSessionProgress:(id)a3;
- (void)_sendDoneMessageWithError:(id)a3;
- (void)_setUpMessaging;
- (void)_signalControlConnectionStarted;
- (void)_startDisconnectTimer;
- (void)_startTrackingPeerConnectionStatus;
- (void)_stopTrackingPeerConnectionStatus;
- (void)dealloc;
- (void)setCacheDeleteRequest:(id)a3;
- (void)setChargeToken:(__CFString *)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConnectSemaphore:(id)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceLockAssertion:(id)a3;
- (void)setDisconnectTimer:(id)a3;
- (void)setDriveBackupEngine:(id)a3;
- (void)setDriveSettingsContext:(id)a3;
- (void)setFileTransferSession:(id)a3;
- (void)setPeerInitRequest:(id)a3;
- (void)setPeerPreflightResponse:(id)a3;
- (void)setPeerTaskGroup:(id)a3;
- (void)setPowerAssertion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTransaction:(id)a3;
- (void)setTransferDrive:(id)a3;
- (void)start;
- (void)updatedTotalProgress:(id)a3;
@end

@implementation MBSourceDeviceTransferEngine

- (MBSourceDeviceTransferEngine)initWithSessionInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBSourceDeviceTransferEngine initWithSessionInfo:]", "MBSourceDeviceTransferEngine.m", 73, "sessionInfo");
  }
  v5 = v4;
  uint64_t v6 = [v4 fileTransferSession];
  if (!v6) {
    __assert_rtn("-[MBSourceDeviceTransferEngine initWithSessionInfo:]", "MBSourceDeviceTransferEngine.m", 75, "fileTransferSession");
  }
  v7 = (void *)v6;
  v8 = +[MBDriveSettingsContext defaultSettingsContext];
  v43.receiver = self;
  v43.super_class = (Class)MBSourceDeviceTransferEngine;
  v9 = [(MBEngine *)&v43 initWithSettingsContext:v8 debugContext:0 domainManager:0];
  v10 = v9;
  if (v9)
  {
    [(MBSourceDeviceTransferEngine *)v9 setDriveSettingsContext:v8];
    v11 = (objc_class *)objc_opt_class();
    Name = class_getName(v11);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v15 = dispatch_queue_create(Name, v14);
    [(MBSourceDeviceTransferEngine *)v10 setQueue:v15];

    v16 = (objc_class *)objc_opt_class();
    class_getName(v16);
    v17 = (void *)os_transaction_create();
    [(MBSourceDeviceTransferEngine *)v10 setTransaction:v17];

    [(MBSourceDeviceTransferEngine *)v10 setFileTransferSession:v7];
    dispatch_group_t v18 = dispatch_group_create();
    [(MBSourceDeviceTransferEngine *)v10 setPeerTaskGroup:v18];

    v19 = [MBDeviceTransferProgressModel alloc];
    v20 = objc_opt_new();
    v21 = [(MBDeviceTransferProgressModel *)v19 initWithEstimator:v20];
    progressModel = v10->_progressModel;
    v10->_progressModel = v21;

    [(MBDeviceTransferProgressModel *)v10->_progressModel setDelegate:v10];
    v23 = [[MBPowerAssertion alloc] initWithName:@"D2D" timeout:0.0];
    [(MBSourceDeviceTransferEngine *)v10 setPowerAssertion:v23];

    v10->_unint64_t concurrentUploadBatchCount = 15;
    v10->_unint64_t uploadBatchSize = 200;
    Boolean keyExistsAndHasValidFormat = 0;
    unint64_t AppIntegerValue = CFPreferencesGetAppIntegerValue(@"MBDriveBackupEngineUploadBatchCount", @"com.apple.MobileBackup", &keyExistsAndHasValidFormat);
    if (AppIntegerValue > 0x3E8 || keyExistsAndHasValidFormat == 0) {
      unint64_t v26 = 0;
    }
    else {
      unint64_t v26 = AppIntegerValue;
    }
    Boolean keyExistsAndHasValidFormat = 0;
    unint64_t v27 = CFPreferencesGetAppIntegerValue(@"MBDriveBackupEngineUploadBatchSize", @"com.apple.MobileBackup", &keyExistsAndHasValidFormat);
    if (v27 > 0x3E8 || keyExistsAndHasValidFormat == 0) {
      unint64_t v29 = 0;
    }
    else {
      unint64_t v29 = v27;
    }
    if (v26 | v29)
    {
      v30 = MBGetDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v45 = v29;
        __int16 v46 = 2048;
        unint64_t v47 = v26;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "MBDriveBackupEngineUploadBatchSize:%lu, MBDriveBackupEngineUploadBatchCount:%lu", buf, 0x16u);
        _MBLog();
      }

      if (v26) {
        v10->_unint64_t concurrentUploadBatchCount = v26;
      }
      if (v29) {
        v10->_unint64_t uploadBatchSize = v29;
      }
    }
    if (!v10->_concurrentUploadBatchCount) {
      __assert_rtn("-[MBSourceDeviceTransferEngine initWithSessionInfo:]", "MBSourceDeviceTransferEngine.m", 103, "_concurrentUploadBatchCount");
    }
    unint64_t uploadBatchSize = v10->_uploadBatchSize;
    if (!uploadBatchSize) {
      __assert_rtn("-[MBSourceDeviceTransferEngine initWithSessionInfo:]", "MBSourceDeviceTransferEngine.m", 104, "_uploadBatchSize");
    }
    if (![(MBSourceDeviceTransferEngine *)v10 _updateOpenFdsLimit:4 * uploadBatchSize + 56])
    {
      v10->_unint64_t concurrentUploadBatchCount = 1;
      v10->_unint64_t uploadBatchSize = 200;
    }
    v32 = MBGetDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = objc_opt_class();
      unint64_t v34 = v10->_uploadBatchSize;
      unint64_t concurrentUploadBatchCount = v10->_concurrentUploadBatchCount;
      *(_DWORD *)buf = 138544130;
      uint64_t v45 = v33;
      __int16 v46 = 2048;
      unint64_t v47 = v34;
      __int16 v48 = 2048;
      unint64_t v49 = concurrentUploadBatchCount;
      __int16 v50 = 2048;
      uint64_t v51 = 2;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@, uploadBatchSize:%lu, concurrentUploadBatchCount:%lu, concurrentOpenBatchCount:%lu", buf, 0x2Au);
      objc_opt_class();
      _MBLog();
    }

    v36 = [@"/var/mobile/Library/Caches/Backup/DT" stringByAppendingString:@"/"];
    v37 = [v36 stringByStandardizingPath];

    v38 = +[NSURL fileURLWithPath:v37 isDirectory:1];
    v39 = [[MBPeerTransferDrive alloc] initWithRootURL:v38 fileTransferSession:v7 uploadBatchSize:v10->_uploadBatchSize concurrentUploadBatchCount:v10->_concurrentUploadBatchCount concurrentOpenBatchCount:2];
    transferDrive = v10->_transferDrive;
    v10->_transferDrive = v39;
  }
  return v10;
}

- (void)dealloc
{
  v3 = [(MBSourceDeviceTransferEngine *)self driveSettingsContext];
  [v3 setEncryptionManager:0];

  id v4 = [(MBSourceDeviceTransferEngine *)self transferDrive];
  [v4 stopListeningForFileTransfers];

  v5.receiver = self;
  v5.super_class = (Class)MBSourceDeviceTransferEngine;
  [(MBSourceDeviceTransferEngine *)&v5 dealloc];
}

- (BOOL)_updateOpenFdsLimit:(unint64_t)a3
{
  if (!a3) {
    __assert_rtn("-[MBSourceDeviceTransferEngine _updateOpenFdsLimit:]", "MBSourceDeviceTransferEngine.m", 131, "openFdsLimit");
  }
  v13.rlim_t rlim_cur = 0;
  v13.rlim_max = 0;
  int v4 = getrlimit(8, &v13);
  objc_super v5 = MBGetDefaultLog();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(rlim_cur) = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "getrlmit(NOFILE) failed: %{errno}d", buf, 8u);
      __error();
LABEL_5:
      _MBLog();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      rlim_t rlim_cur = v13.rlim_cur;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "getrlimit(NOFILE): %llu", buf, 0xCu);
      _MBLog();
    }

    if (v13.rlim_cur >= a3) {
      return 1;
    }
    v13.rlim_t rlim_cur = a3;
    int v10 = setrlimit(8, &v13);
    v11 = MBGetDefaultLog();
    uint64_t v6 = v11;
    if (!v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        rlim_t rlim_cur = v13.rlim_cur;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setrlimit(NOFILE): %llu", buf, 0xCu);
        _MBLog();
      }
      BOOL v8 = 1;
      goto LABEL_7;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = *__error();
      *(_DWORD *)buf = 134218240;
      rlim_t rlim_cur = a3;
      __int16 v16 = 1024;
      int v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "setrlimit(NOFILE) failed, openFdsLimit:%lu: %{errno}d", buf, 0x12u);
      __error();
      goto LABEL_5;
    }
  }
  BOOL v8 = 0;
LABEL_7:

  return v8;
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
  if ((atomic_exchange((atomic_uchar *volatile)&self->_finished, 1u) & 1) == 0)
  {
    uint64_t v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v41 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finishing %@", buf, 0xCu);
      uint64_t v29 = objc_opt_class();
      _MBLog();
    }

    int v7 = [(MBSourceDeviceTransferEngine *)self transaction];
    [(MBSourceDeviceTransferEngine *)self setTransaction:0];
    BOOL v8 = [(MBSourceDeviceTransferEngine *)self deviceLockAssertion];
    [(MBSourceDeviceTransferEngine *)self setDeviceLockAssertion:0];
    [v8 drop];

    v9 = [(MBSourceDeviceTransferEngine *)self powerAssertion];
    [(MBSourceDeviceTransferEngine *)self setPowerAssertion:0];
    [(MBSourceDeviceTransferEngine *)self startTime];
    double v10 = 0.0;
    if (v11 > 0.0)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v13 = v12;
      [(MBSourceDeviceTransferEngine *)self startTime];
      double v10 = v13 - v14;
    }
    unsigned int v15 = [(MBEngine *)self isCanceled];
    char v16 = v15;
    if (!v15
      || (+[MBError errorWithCode:202 format:@"Canceled"],
          (id v17 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v17 = v5;
    }
    [(MBSourceDeviceTransferEngine *)self _stopTrackingPeerConnectionStatus];
    dispatch_group_t v18 = [(MBSourceDeviceTransferEngine *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10019E5C8;
    block[3] = &unk_100411128;
    block[4] = self;
    dispatch_async(v18, block);

    v19 = [(MBSourceDeviceTransferEngine *)self transferDrive];
    [v19 invalidate];

    [(MBSourceDeviceTransferEngine *)self _cancelBackupEngine];
    if ((id)[(MBSourceDeviceTransferEngine *)self connectionType] == (id)1
      && [(MBSourceDeviceTransferEngine *)self chargeToken])
    {
      [(MBSourceDeviceTransferEngine *)self chargeToken];
      MBCancelChargeLimit();
      [(MBSourceDeviceTransferEngine *)self setChargeToken:0];
    }
    v20 = [(MBSourceDeviceTransferEngine *)self peerTaskGroup];
    v21 = dispatch_get_global_queue(17, 0);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10019E5D0;
    v36[3] = &unk_100412B28;
    char v38 = v16;
    v36[4] = self;
    id v22 = v17;
    id v37 = v22;
    dispatch_group_async(v20, v21, v36);

    v23 = +[MBDaemon sharedDaemon];
    [v23 holdWorkAssertion:a2];

    v24 = [(MBSourceDeviceTransferEngine *)self peerTaskGroup];
    v25 = [(MBSourceDeviceTransferEngine *)self queue];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10019E700;
    v30[3] = &unk_100415660;
    v30[4] = self;
    id v31 = v22;
    double v34 = v10;
    id v32 = v9;
    id v33 = v7;
    SEL v35 = a2;
    id v26 = v7;
    id v27 = v9;
    id v28 = v22;
    dispatch_group_notify(v24, v25, v30);
  }
}

- (BOOL)isFinished
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

- (BOOL)cancel
{
  v7.receiver = self;
  v7.super_class = (Class)MBSourceDeviceTransferEngine;
  BOOL v3 = [(MBEngine *)&v7 cancel];
  if (!v3)
  {
    int v4 = [(MBSourceDeviceTransferEngine *)self cacheDeleteRequest];
    [v4 cancel];

    id v5 = [(MBSourceDeviceTransferEngine *)self transferDrive];
    [v5 invalidate];

    [(MBSourceDeviceTransferEngine *)self _signalControlConnectionStarted];
    [(MBSourceDeviceTransferEngine *)self _finishWithError:0];
  }
  return v3;
}

- (void)_sendDoneMessageWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MBSourceDeviceTransferEngine *)self fileTransferSession];
  if (!v5) {
    __assert_rtn("-[MBSourceDeviceTransferEngine _sendDoneMessageWithError:]", "MBSourceDeviceTransferEngine.m", 245, "fileTransferSession");
  }
  uint64_t v6 = (void *)v5;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_peerConnectedOnce);
  if (v7 & 1) == 0 || (unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_receivedDoneMessage), (v8))
  {
    double v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not sending %@", buf, 0xCu);
      objc_opt_class();
      _MBLog();
    }
  }
  else
  {
    v9 = [[MBPeerDoneRequest alloc] initWithError:v4];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10019ED04;
    v16[3] = &unk_100415688;
    double v11 = v9;
    id v17 = v11;
    double v12 = v10;
    dispatch_group_t v18 = v12;
    +[MBPeerMessenger sendRequest:v11 session:v6 responseHandler:v16];
    dispatch_time_t v13 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v12, v13))
    {
      double v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Timed out waiting for %@", buf, 0xCu);
        objc_opt_class();
        _MBLog();
      }
    }
  }
}

- (void)start
{
  BOOL v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = objc_opt_class();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "========== %@ starting", buf, 0xCu);
    objc_opt_class();
    _MBLog();
  }

  MBLogDeviceProperties();
  +[NSDate timeIntervalSinceReferenceDate];
  -[MBSourceDeviceTransferEngine setStartTime:](self, "setStartTime:");
  id v4 = [(MBSourceDeviceTransferEngine *)self powerAssertion];
  [v4 hold];

  id v8 = 0;
  unsigned __int8 v5 = [(MBSourceDeviceTransferEngine *)self _setUpWithError:&v8];
  id v6 = v8;
  unsigned __int8 v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (!v6) {
      __assert_rtn("-[MBSourceDeviceTransferEngine start]", "MBSourceDeviceTransferEngine.m", 278, "error");
    }
    [(MBSourceDeviceTransferEngine *)self _finishWithError:v6];
  }
}

- (BOOL)_setUpWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBSourceDeviceTransferEngine _setUpWithError:]", "MBSourceDeviceTransferEngine.m", 285, "error");
  }
  unsigned __int8 v5 = [(MBSourceDeviceTransferEngine *)self deviceLockAssertion];

  if (!v5)
  {
    id v6 = objc_opt_new();
    if (![v6 holdWithError:a3])
    {

      return 0;
    }
    [(MBSourceDeviceTransferEngine *)self setDeviceLockAssertion:v6];
  }
  return [(MBSourceDeviceTransferEngine *)self _setUpFileTransferSessionWithError:a3];
}

- (void)_startDisconnectTimer
{
  BOOL v3 = [(MBSourceDeviceTransferEngine *)self queue];
  dispatch_assert_queue_V2(v3);

  [(MBSourceDeviceTransferEngine *)self _cancelDisconnectTimer];
  if (![(MBSourceDeviceTransferEngine *)self isFinished])
  {
    id v4 = [(MBSourceDeviceTransferEngine *)self queue];
    unsigned __int8 v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);

    dispatch_time_t v6 = dispatch_walltime(0, 1800000000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10019F280;
    handler[3] = &unk_100413770;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v5, handler);
    [(MBSourceDeviceTransferEngine *)self setDisconnectTimer:v5];
    dispatch_resume(v5);
    unsigned __int8 v7 = MBGetDefaultLog();
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
  BOOL v3 = [(MBSourceDeviceTransferEngine *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MBSourceDeviceTransferEngine *)self disconnectTimer];
  if (v4)
  {
    [(MBSourceDeviceTransferEngine *)self setDisconnectTimer:0];
    dispatch_source_cancel(v4);
    unsigned __int8 v5 = MBGetDefaultLog();
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
  unsigned __int8 v2 = [(MBSourceDeviceTransferEngine *)self connectSemaphore];
  if (v2)
  {
    BOOL v3 = v2;
    dispatch_semaphore_signal(v2);
    unsigned __int8 v2 = v3;
  }
}

- (BOOL)_waitForControlConnectionWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  unsigned __int8 v5 = dispatch_semaphore_create(0);
  [(MBSourceDeviceTransferEngine *)self setConnectSemaphore:v5];
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
  -[MBSourceDeviceTransferEngine setConnectSemaphore:](self, "setConnectSemaphore:", 0, v10);

  return v8;
}

- (void)_startTrackingPeerConnectionStatus
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_trackPeerConnectionStatus, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    id v4 = MBGetDefaultLog();
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
    id v4 = MBGetDefaultLog();
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
  unsigned __int8 v5 = [(MBSourceDeviceTransferEngine *)self queue];
  dispatch_assert_queue_V2(v5);

  if (![(MBSourceDeviceTransferEngine *)self isFinished])
  {
    unsigned __int8 v6 = [(MBSourceDeviceTransferEngine *)self delegate];
    -[MBSourceDeviceTransferEngine setConnectionType:](self, "setConnectionType:", +[MBDeviceTransferConnectionInfo connectionTypeFromLinkType:](MBDeviceTransferConnectionInfo, "connectionTypeFromLinkType:", [v4 linkType]));
    if ([v4 type] != 10)
    {
      if ([v4 type] != 11)
      {
LABEL_21:

        goto LABEL_22;
      }
      dispatch_time_t v7 = objc_opt_new();
      [v7 setConnectionState:2];
      objc_msgSend(v7, "setConnectionType:", -[MBSourceDeviceTransferEngine connectionType](self, "connectionType"));
      unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_trackPeerConnectionStatus);
      if (v11)
      {
        atomic_store(0, (unsigned __int8 *)&self->_peerConnected);
        [(MBSourceDeviceTransferEngine *)self _startDisconnectTimer];
        int v12 = [(MBSourceDeviceTransferEngine *)self connection];
        [v6 connection:v12 didUpdateDeviceTransferConnectionInfo:v7];
      }
LABEL_20:

      goto LABEL_21;
    }
    atomic_store(1u, (unsigned __int8 *)&self->_peerConnectedOnce);
    [(MBSourceDeviceTransferEngine *)self _cancelDisconnectTimer];
    dispatch_time_t v7 = objc_opt_new();
    [v7 setConnectionState:1];
    objc_msgSend(v7, "setConnectionType:", -[MBSourceDeviceTransferEngine connectionType](self, "connectionType"));
    if ((id)[(MBSourceDeviceTransferEngine *)self connectionType] == (id)1)
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

        [(MBSourceDeviceTransferEngine *)self setChargeToken:v8];
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
    uint64_t v15 = [(MBSourceDeviceTransferEngine *)self connection];
    [v6 connection:v15 didUpdateDeviceTransferConnectionInfo:v7];

LABEL_19:
    [(MBSourceDeviceTransferEngine *)self _signalControlConnectionStarted];
    goto LABEL_20;
  }
LABEL_22:
}

- (BOOL)_setUpFileTransferSessionWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBSourceDeviceTransferEngine _setUpFileTransferSessionWithError:]", "MBSourceDeviceTransferEngine.m", 406, "error");
  }
  unsigned __int8 v5 = [(MBSourceDeviceTransferEngine *)self fileTransferSession];
  if (!v5) {
    __assert_rtn("-[MBSourceDeviceTransferEngine _setUpFileTransferSessionWithError:]", "MBSourceDeviceTransferEngine.m", 408, "fileTransferSession");
  }
  unsigned __int8 v6 = [(MBSourceDeviceTransferEngine *)self transferDrive];
  if (!v6) {
    __assert_rtn("-[MBSourceDeviceTransferEngine _setUpFileTransferSessionWithError:]", "MBSourceDeviceTransferEngine.m", 410, "transferDrive");
  }
  dispatch_time_t v7 = +[MBBehaviorOptions sharedOptions];
  objc_msgSend(v5, "setFlags:", objc_msgSend(v5, "flags") | 2);
  if ([v7 d2dTransferUSBOnly])
  {
    objc_msgSend(v5, "setFlags:", objc_msgSend(v5, "flags") | 0x30);
    objc_msgSend(v5, "setFlags:", (unint64_t)objc_msgSend(v5, "flags") & 0xFFFFFFF3);
  }
  if (([v7 d2dTransferUseCompression] & 1) == 0) {
    objc_msgSend(v5, "setFlags:", (unint64_t)objc_msgSend(v5, "flags") & 0xFFFFFEFF);
  }
  objc_msgSend(v5, "setMaxSmallFileTasks:", (int)objc_msgSend(v7, "d2dTransferSmallFileMaxTasks"));
  objc_msgSend(v5, "setMaxLargeFileTasks:", (int)objc_msgSend(v7, "d2dTransferLargeFileMaxTasks"));
  objc_msgSend(v5, "setLargeFileBufferBytes:", (int)(objc_msgSend(v7, "d2dTransferLargeFileBufferKilobytes") << 10));
  uint64_t v8 = [(MBSourceDeviceTransferEngine *)self queue];
  [v5 setDispatchQueue:v8];

  id v9 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Caches/Backup/RFReceiveTemp" isDirectory:1];
  [v5 setTemporaryDirectoryURL:v9];

  BOOL v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting up the FT session: %@", buf, 0xCu);
    _MBLog();
  }

  objc_initWeak((id *)buf, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10019FE8C;
  v18[3] = &unk_100413DF8;
  objc_copyWeak(&v19, (id *)buf);
  [v5 setCompletionHandler:v18];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10019FF7C;
  v16[3] = &unk_100413E20;
  objc_copyWeak(&v17, (id *)buf);
  [v5 setProgressHandler:v16];
  [(MBSourceDeviceTransferEngine *)self _setUpMessaging];
  [(MBSourceDeviceTransferEngine *)self _startTrackingPeerConnectionStatus];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001A0090;
  v14[3] = &unk_100411128;
  id v11 = v6;
  id v15 = v11;
  BOOL v12 = [(MBSourceDeviceTransferEngine *)self _waitForControlConnectionWithBlock:v14];
  if (!v12)
  {
    *a3 = +[MBError errorWithCode:15 format:@"Timed out"];
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

  return v12;
}

- (void)_disableInfraWiFi
{
  BOOL v3 = +[MBBehaviorOptions sharedOptions];
  unsigned int v4 = [v3 d2dTransferUSBOnly];

  if (v4)
  {
    unsigned __int8 v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not disabling infra WiFi in USB-only mode", buf, 2u);
      _MBLog();
    }
  }
  else
  {
    unsigned __int8 v6 = [(MBSourceDeviceTransferEngine *)self fileTransferSession];
    if (!v6) {
      __assert_rtn("-[MBSourceDeviceTransferEngine _disableInfraWiFi]", "MBSourceDeviceTransferEngine.m", 470, "fileTransferSession");
    }
    unsigned __int8 v5 = v6;
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
    unsigned __int8 v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not enabling infra WiFi in USB-only mode", buf, 2u);
      _MBLog();
    }
  }
  else
  {
    unsigned __int8 v6 = [(MBSourceDeviceTransferEngine *)self fileTransferSession];
    if (!v6) {
      __assert_rtn("-[MBSourceDeviceTransferEngine _enableInfraWiFi]", "MBSourceDeviceTransferEngine.m", 481, "fileTransferSession");
    }
    unsigned __int8 v5 = v6;
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

- (unint64_t)_purgeableDiskSpace
{
  int v2 = (void *)CacheDeleteCopyPurgeableSpaceWithInfo();
  BOOL v3 = [v2 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];

  if (v3)
  {
    unsigned int v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v5 = [v2 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to get purgeable space from Cache Delete: %@", buf, 0xCu);

      unsigned int v9 = [v2 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
      _MBLog();
    }
    id v6 = 0;
  }
  else
  {
    dispatch_time_t v7 = [v2 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    id v6 = [v7 unsignedLongLongValue];
  }
  return (unint64_t)v6;
}

- (id)_handleError:(id)a3
{
  id v4 = a3;
  if ([(MBEngine *)self isCanceled])
  {
    id v5 = +[MBError errorWithCode:202 format:@"Canceled"];
LABEL_5:
    id v6 = v5;
    goto LABEL_7;
  }
  if (v4)
  {
    id v5 = v4;
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (void)_setUpMessaging
{
  uint64_t v3 = [(MBSourceDeviceTransferEngine *)self fileTransferSession];
  if (!v3) {
    __assert_rtn("-[MBSourceDeviceTransferEngine _setUpMessaging]", "MBSourceDeviceTransferEngine.m", 515, "fileTransferSession");
  }
  id v4 = (void *)v3;
  uint64_t v5 = objc_opt_class();
  +[MBPeerMessenger registerRequestClass:responseClass:forTask:](MBPeerMessenger, "registerRequestClass:responseClass:forTask:", v5, objc_opt_class());
  uint64_t v6 = objc_opt_class();
  +[MBPeerMessenger registerRequestClass:v6 responseClass:objc_opt_class() forTask:@"MBPeerTaskTransfer"];
  uint64_t v7 = objc_opt_class();
  +[MBPeerMessenger registerRequestClass:v7 responseClass:objc_opt_class() forTask:@"MBPeerTaskDone"];
  uint64_t v8 = objc_opt_class();
  +[MBPeerMessenger registerRequestClass:v8 responseClass:objc_opt_class() forTask:@"MBPeerTaskKeychain"];
  uint64_t v9 = objc_opt_class();
  +[MBPeerMessenger registerRequestClass:v9 responseClass:objc_opt_class() forTask:@"MBPeerTaskPreflight"];
  uint64_t v10 = objc_opt_class();
  +[MBPeerMessenger registerRequestClass:v10 responseClass:objc_opt_class() forTask:@"MBPeerTaskRestoreProgress"];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001A09A8;
  v16[3] = &unk_1004156B0;
  void v16[4] = self;
  +[MBPeerMessenger registerRequestHandler:v16 forTask:@"MBPeerTaskInit" session:v4];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001A0C7C;
  v15[3] = &unk_1004156D8;
  v15[4] = self;
  +[MBPeerMessenger registerRequestHandler:v15 forTask:@"MBPeerTaskPreflight" session:v4];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001A15F4;
  v14[3] = &unk_100415700;
  void v14[4] = self;
  +[MBPeerMessenger registerRequestHandler:v14 forTask:@"MBPeerTaskKeychain" session:v4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A1D54;
  v13[3] = &unk_100415750;
  v13[4] = self;
  +[MBPeerMessenger registerRequestHandler:v13 forTask:@"MBPeerTaskTransfer" session:v4];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A26E0;
  v12[3] = &unk_100413E48;
  v12[4] = self;
  +[MBPeerMessenger registerRequestHandler:v12 forTask:@"MBPeerTaskDone" session:v4];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A290C;
  v11[3] = &unk_100415778;
  v11[4] = self;
  +[MBPeerMessenger registerRequestHandler:v11 forTask:@"MBPeerTaskRestoreProgress" session:v4];
}

- (id)_backupEngineWithPreflightRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MBDriveSettingsContext defaultSettingsContext];
  uint64_t v6 = MBDeviceUDID_Legacy();
  [v5 setTargetIdentifier:v6];

  uint64_t v7 = MBAllDrivePlugins();
  [v5 setPlugins:v7];

  [v5 setIsDeviceTransfer:1];
  id v8 = [v4 freeDiskSpace];

  uint64_t v9 = [(MBSourceDeviceTransferEngine *)self transferDrive];
  [v9 setFreeSpace:v8];

  uint64_t v10 = [(MBSourceDeviceTransferEngine *)self transferDrive];
  [v5 setDrive:v10];

  id v11 = +[MBCKManager sharedInstance];
  [v5 setManager:v11];

  BOOL v12 = +[MBDebugContext defaultDebugContext];
  unsigned __int8 v13 = +[MBDriveBackupEngine backupEngineWithSettingsContext:v5 debugContext:v12];

  [v13 setBatchSize:self->_uploadBatchSize];
  [v13 setConcurrentUploadBatchCount:self->_concurrentUploadBatchCount];

  return v13;
}

- (void)_cleanUpBackupEngine
{
  uint64_t v3 = [(MBSourceDeviceTransferEngine *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MBSourceDeviceTransferEngine *)self driveBackupEngine];
  if (v4)
  {
    [(MBSourceDeviceTransferEngine *)self setDriveBackupEngine:0];
    uint64_t v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up backup engine: %@", buf, 0xCu);
      _MBLog();
    }

    id v6 = [v4 cleanup];
    uint64_t v7 = +[MBError errorWithCode:202 format:@"Canceled"];
    id v8 = [v4 endWithError:v7];

    if (!v8) {
      __assert_rtn("-[MBSourceDeviceTransferEngine _cleanUpBackupEngine]", "MBSourceDeviceTransferEngine.m", 855, "error");
    }
  }
}

- (void)_cancelBackupEngine
{
  int v2 = [(MBSourceDeviceTransferEngine *)self driveBackupEngine];
  if (v2)
  {
    id v3 = v2;
    [v2 cancel];
    int v2 = v3;
  }
}

- (void)updatedTotalProgress:(id)a3
{
  id v4 = a3;
  if (![(MBEngine *)self isCanceled])
  {
    uint64_t v5 = [(MBSourceDeviceTransferEngine *)self queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001A2F04;
    v6[3] = &unk_1004110B0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
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

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_semaphore)connectSemaphore
{
  return self->_connectSemaphore;
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

- (OS_dispatch_group)peerTaskGroup
{
  return self->_peerTaskGroup;
}

- (void)setPeerTaskGroup:(id)a3
{
}

- (MBPeerTransferDrive)transferDrive
{
  return (MBPeerTransferDrive *)objc_getProperty(self, a2, 200, 1);
}

- (void)setTransferDrive:(id)a3
{
}

- (MBDeviceTransferProgressModel)progressModel
{
  return (MBDeviceTransferProgressModel *)objc_getProperty(self, a2, 208, 1);
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

- (MBDriveBackupEngine)driveBackupEngine
{
  return (MBDriveBackupEngine *)objc_getProperty(self, a2, 240, 1);
}

- (void)setDriveBackupEngine:(id)a3
{
}

- (MBPeerInitRequest)peerInitRequest
{
  return (MBPeerInitRequest *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPeerInitRequest:(id)a3
{
}

- (MBPeerPreflightResponse)peerPreflightResponse
{
  return (MBPeerPreflightResponse *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPeerPreflightResponse:(id)a3
{
}

- (MBDriveSettingsContext)driveSettingsContext
{
  return self->_driveSettingsContext;
}

- (void)setDriveSettingsContext:(id)a3
{
}

- (MBCacheDeleteRequest)cacheDeleteRequest
{
  return (MBCacheDeleteRequest *)objc_getProperty(self, a2, 272, 1);
}

- (void)setCacheDeleteRequest:(id)a3
{
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
  objc_storeStrong((id *)&self->_cacheDeleteRequest, 0);
  objc_storeStrong((id *)&self->_driveSettingsContext, 0);
  objc_storeStrong((id *)&self->_peerPreflightResponse, 0);
  objc_storeStrong((id *)&self->_peerInitRequest, 0);
  objc_storeStrong((id *)&self->_driveBackupEngine, 0);
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_deviceLockAssertion, 0);
  objc_storeStrong((id *)&self->_progressModel, 0);
  objc_storeStrong((id *)&self->_transferDrive, 0);
  objc_storeStrong((id *)&self->_peerTaskGroup, 0);
  objc_storeStrong((id *)&self->_disconnectTimer, 0);
  objc_storeStrong((id *)&self->_connectSemaphore, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end