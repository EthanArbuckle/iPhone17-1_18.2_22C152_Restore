@interface MBServiceEngine
- (BOOL)cancel;
- (BOOL)waitWithTimeout:(double)a3;
- (MBChunkStore)chunkStore;
- (MBService)service;
- (MBServiceCache)cache;
- (MBServiceEncryptionManager)encryptionManager;
- (MBServiceEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5;
- (MBServiceReachabilityMonitor)reachability;
- (MBServiceRetryStrategy)retryStrategy;
- (MBServiceSettingsContext)settingsContext;
- (NSString)backupUDID;
- (id)acquireLock;
- (id)cleanupAfterError:(id)a3;
- (id)releaseLock;
- (id)releaseLockNow;
- (id)run;
- (id)setup;
- (int)engineType;
- (void)dealloc;
- (void)runWithQueue:(id)a3 stateChange:(id)a4;
@end

@implementation MBServiceEngine

- (MBServiceEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4 domainManager:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MBServiceEngine;
  v8 = -[MBEngine initWithSettingsContext:debugContext:domainManager:](&v10, "initWithSettingsContext:debugContext:domainManager:");
  if (v8)
  {
    v8->_service = -[MBService initWithAccount:]([MBService alloc], "initWithAccount:", [a3 account]);
    v8->_chunkStore = (MBChunkStore *)objc_msgSend(objc_msgSend(a3, "account"), "createChunkStoreWithPath:", objc_msgSend(a3, "chunkStorePath"));
    if ([a4 isFlagSet:@"VerifyProgress"]) {
      [(MBChunkStoreProgressModel *)[(MBChunkStore *)v8->_chunkStore progressModel] setVerify:1];
    }
    v8->_cache = -[MBServiceCache initWithPath:domainManager:]([MBServiceCache alloc], "initWithPath:domainManager:", [a3 cachePath], a5);
    v8->_encryptionManager = [[MBServiceEncryptionManager alloc] initWithEngine:v8];
    v8->_retryStrategy = -[MBServiceRetryStrategy initWithEngine:account:]([MBServiceRetryStrategy alloc], "initWithEngine:account:", v8, [a3 account]);
    v8->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v8->_reachability = objc_alloc_init(MBServiceReachabilityMonitor);
  }
  return v8;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_semaphore);
  v3.receiver = self;
  v3.super_class = (Class)MBServiceEngine;
  [(MBServiceEngine *)&v3 dealloc];
}

- (MBServiceSettingsContext)settingsContext
{
  return (MBServiceSettingsContext *)self->super._settingsContext;
}

- (NSString)backupUDID
{
  v2 = [(MBServiceEngine *)self settingsContext];
  return [(MBServiceSettingsContext *)v2 backupUDID];
}

- (int)engineType
{
  return 2;
}

- (BOOL)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)MBServiceEngine;
  BOOL v3 = [(MBEngine *)&v5 cancel];
  if (!v3)
  {
    [(MBService *)self->_service cancel];
    [(MBChunkStore *)self->_chunkStore cancel];
  }
  return v3;
}

- (BOOL)waitWithTimeout:(double)a3
{
  semaphore = self->_semaphore;
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  return dispatch_semaphore_wait(semaphore, v4) == 0;
}

- (void)runWithQueue:(id)a3 stateChange:(id)a4
{
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001D209C;
  v30[3] = &unk_100415D98;
  v30[4] = a3;
  v30[5] = a4;
  [(MBChunkStoreProgressModel *)[(MBChunkStore *)self->_chunkStore progressModel] setBlock:v30];
  +[NSDate timeIntervalSinceReferenceDate];
  double v9 = v8;
  objc_super v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(MBEngine *)self engineModeString];
    *(_DWORD *)buf = 138412290;
    v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ starting", buf, 0xCu);
    v25 = [(MBEngine *)self engineModeString];
    _MBLog();
  }
  if (![(MBEngine *)self isBackgroundRestore]) {
    MBLogDeviceProperties();
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D2134;
  block[3] = &unk_100415DC0;
  block[4] = a4;
  dispatch_async((dispatch_queue_t)a3, block);
  id v12 = [(MBServiceEngine *)self run];
  if ([(MBEngine *)self isCanceled])
  {
    v13 = +[MBError errorWithCode:202, @"%@ cancelled", [(MBEngine *)self engineModeString] format];
    v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(MBEngine *)self engineModeString];
      *(_DWORD *)buf = 138412290;
      v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ cancelled", buf, 0xCu);
      [(MBEngine *)self engineModeString];
      _MBLog();
    }
    v16 = v13;
    v17 = v28;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1001D2150;
    v28[3] = &unk_100415DE8;
    v28[4] = v13;
    v28[5] = a4;
  }
  else
  {
    v18 = MBGetDefaultLog();
    v19 = v18;
    if (v12)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = [(MBEngine *)self engineModeString];
        double v21 = COERCE_DOUBLE(+[MBError descriptionForError:v12]);
        *(_DWORD *)buf = 138412546;
        v32 = v20;
        __int16 v33 = 2112;
        double v34 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ failed: %@", buf, 0x16u);
        [(MBEngine *)self engineModeString];
        +[MBError descriptionForError:v12];
        _MBLog();
      }
      id v22 = v12;
      v17 = v27;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1001D219C;
      v27[3] = &unk_100415DE8;
      v27[4] = v12;
      v27[5] = a4;
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [(MBEngine *)self engineModeString];
        +[NSDate timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 138412546;
        v32 = v23;
        __int16 v33 = 2048;
        double v34 = v24 - v9;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ finished in %0.3f s", buf, 0x16u);
        [(MBEngine *)self engineModeString];
        +[NSDate timeIntervalSinceReferenceDate];
        _MBLog();
      }
      v17 = v26;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1001D21E8;
      v26[3] = &unk_100415DC0;
      v26[4] = a4;
    }
  }
  dispatch_async((dispatch_queue_t)a3, v17);
  [v7 drain];
}

- (id)setup
{
  return 0;
}

- (id)run
{
  return 0;
}

- (id)cleanupAfterError:(id)a3
{
  return 0;
}

- (id)acquireLock
{
  if (objc_msgSend(-[MBService lockForBackupUDID:](-[MBServiceEngine service](self, "service"), "lockForBackupUDID:", -[MBServiceEngine backupUDID](self, "backupUDID")), "state") != 1)
  {
    BOOL v3 = [(MBEngine *)self isBackgroundRestore];
    uint64_t v4 = [(MBEngine *)self isBackupEngine] ^ 1;
    unsigned int v5 = [(MBEngine *)self isBackupEngine];
    v6 = [(MBServiceEngine *)self service];
    if (v5) {
      uint64_t v7 = 600;
    }
    else {
      uint64_t v7 = 172800;
    }
    [(MBService *)v6 setLock:+[MBSLock lockWithState:v3 type:v4 timeout:v7] forBackupUDID:[(MBServiceEngine *)self backupUDID]];
  }
  double v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = objc_msgSend(-[MBService lockForBackupUDID:](-[MBServiceEngine service](self, "service"), "lockForBackupUDID:", -[MBServiceEngine backupUDID](self, "backupUDID")), "stateString");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ lock", buf, 0xCu);
    objc_msgSend(-[MBService lockForBackupUDID:](-[MBServiceEngine service](self, "service"), "lockForBackupUDID:", -[MBServiceEngine backupUDID](self, "backupUDID")), "stateString");
    _MBLog();
  }
  return 0;
}

- (id)releaseLock
{
  BOOL v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Releasing lock", v5, 2u);
    _MBLog();
  }
  objc_msgSend(-[MBService lockForBackupUDID:](-[MBServiceEngine service](self, "service"), "lockForBackupUDID:", -[MBServiceEngine backupUDID](self, "backupUDID")), "setState:", 2);
  return 0;
}

- (id)releaseLockNow
{
  id v9 = 0;
  [(MBServiceEngine *)self releaseLock];
  BOOL v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Releasing lock now", buf, 2u);
    _MBLog();
  }
  if ([(MBService *)self->_service backupForUDID:[(MBServiceEngine *)self backupUDID] lastModified:0 error:&v9])
  {
    [(MBDebugContext *)[(MBEngine *)self debugContext] setFlag:@"ReleasedLock"];
  }
  else
  {
    if (!+[MBError isError:v9 withCode:306])
    {
      id v6 = [v9 code];
      return +[MBError errorWithCode:v6 error:v9 format:@"Error releasing backup lock"];
    }
    unsigned int v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Lock already released", v7, 2u);
      _MBLog();
    }
  }
  return 0;
}

- (MBService)service
{
  return self->_service;
}

- (MBChunkStore)chunkStore
{
  return self->_chunkStore;
}

- (MBServiceCache)cache
{
  return self->_cache;
}

- (MBServiceEncryptionManager)encryptionManager
{
  return self->_encryptionManager;
}

- (MBServiceRetryStrategy)retryStrategy
{
  return self->_retryStrategy;
}

- (MBServiceReachabilityMonitor)reachability
{
  return self->_reachability;
}

@end