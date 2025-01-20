@interface MBServiceLockManager
- (BOOL)_reacquireLockWithError:(id *)a3;
- (BOOL)reacquireLockWithError:(id *)a3;
- (MBServiceAccount)account;
- (MBServiceLockManager)initWithAccount:(id)a3 backupUDID:(id)a4 type:(int)a5 delegate:(id)a6;
- (double)_holdLock;
- (double)_releaseLock;
- (double)renewInterval;
- (double)retryInterval;
- (double)timeout;
- (void)_releaseLockAndScheduleRetries;
- (void)_scheduleTimerWithInterval:(double)a3;
- (void)_timerFired;
- (void)dealloc;
- (void)releaseLockAsync;
- (void)releaseLockSync;
- (void)resetRenewalTimer;
- (void)setAccount:(id)a3;
- (void)startRenewingLock;
- (void)stopRenewingLock;
@end

@implementation MBServiceLockManager

- (MBServiceLockManager)initWithAccount:(id)a3 backupUDID:(id)a4 type:(int)a5 delegate:(id)a6
{
  v16.receiver = self;
  v16.super_class = (Class)MBServiceLockManager;
  v10 = [(MBServiceLockManager *)&v16 init];
  if (v10)
  {
    v10->_account = (MBServiceAccount *)a3;
    v10->_service = [[MBService alloc] initWithAccount:a3];
    v11 = (NSString *)a4;
    v10->_type = a5;
    v10->_backupUDID = v11;
    v10->_delegate = a6;
    v12 = (objc_class *)objc_opt_class();
    Name = class_getName(v12);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10->_queue = (OS_dispatch_queue *)dispatch_queue_create(Name, v14);
  }
  return v10;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  [(PCPersistentTimer *)self->_timer invalidate];

  v3.receiver = self;
  v3.super_class = (Class)MBServiceLockManager;
  [(MBServiceLockManager *)&v3 dealloc];
}

- (double)timeout
{
  if (self->_type) {
    return (double)172800;
  }
  else {
    return (double)600;
  }
}

- (double)renewInterval
{
  if (self->_type) {
    return (double)1800;
  }
  else {
    return (double)300;
  }
}

- (double)retryInterval
{
  if (self->_type) {
    return (double)600;
  }
  else {
    return (double)60;
  }
}

- (void)startRenewingLock
{
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting to renew MBS lock", buf, 2u);
    _MBLog();
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028A8F8;
  block[3] = &unk_1004149C0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resetRenewalTimer
{
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Resetting MBS lock timer", buf, 2u);
    _MBLog();
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028AA4C;
  block[3] = &unk_1004149C0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopRenewingLock
{
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Stopping renewing MBS lock", buf, 2u);
    _MBLog();
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028AB54;
  block[3] = &unk_1004149C0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_reacquireLockWithError:(id *)a3
{
  v15 = 0;
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Re-acquiring lock", buf, 2u);
    _MBLog();
  }
  id v6 = [(MBService *)self->_service lockForBackupUDID:self->_backupUDID];
  if (!v6)
  {
    if (!a3) {
      return 0;
    }
    CFStringRef v12 = @"Can't re-acquire lock because it hasn't been acquired or was released";
LABEL_16:
    v13 = +[MBError errorWithCode:306 format:v12];
    BOOL result = 0;
LABEL_17:
    *a3 = v13;
    return result;
  }
  v7 = v6;
  if ([v6 state] != 1)
  {
    if (!a3) {
      return 0;
    }
    CFStringRef v12 = @"Can't re-acquire lock because it's not being held";
    goto LABEL_16;
  }
  if ([v7 type] != 1)
  {
    if (!a3) {
      return 0;
    }
    CFStringRef v12 = @"Can't re-acquire non-restore lock";
    goto LABEL_16;
  }
  [v7 setState:0];
  id v8 = [(MBService *)self->_service backupForUDID:self->_backupUDID lastModified:0 error:&v15];
  [v7 setState:1];
  v9 = MBGetDefaultLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      id v14 = +[MBError descriptionForError:v15];
      *(_DWORD *)buf = 138412290;
      id v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to re-acquire lock: %@", buf, 0xCu);
      +[MBError descriptionForError:v15];
      _MBLog();
    }
    if (a3)
    {
      BOOL result = 0;
      v13 = v15;
      goto LABEL_17;
    }
    return 0;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Re-acquired lock", buf, 2u);
    _MBLog();
  }
  return 1;
}

- (BOOL)reacquireLockWithError:(id *)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = sub_10028AEE4;
  id v14 = sub_10028AEF4;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028AF00;
  block[3] = &unk_100417B60;
  block[4] = self;
  void block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(queue, block);
  v5 = v11;
  if (a3) {
    *a3 = (id)v11[5];
  }
  id v6 = (id)v5[5];
  char v7 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v7;
}

- (void)releaseLockSync
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028AFD0;
  block[3] = &unk_1004149C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)releaseLockAsync
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028B04C;
  block[3] = &unk_1004149C0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_releaseLockAndScheduleRetries
{
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing lock", v6, 2u);
    _MBLog();
  }
  id v4 = [(MBService *)self->_service lockForBackupUDID:self->_backupUDID];
  if (v4) {
    [v4 setState:2];
  }
  else {
    [(MBService *)self->_service setLock:+[MBSLock lockWithState:2 type:self->_type timeout:172800] forBackupUDID:self->_backupUDID];
  }
  [(MBServiceLockManager *)self _releaseLock];
  if (v5 == 0.0) {
    [(PCPersistentTimer *)self->_timer invalidate];
  }
  else {
    -[MBServiceLockManager _scheduleTimerWithInterval:](self, "_scheduleTimerWithInterval:");
  }
}

- (void)_scheduleTimerWithInterval:(double)a3
{
  [(PCPersistentTimer *)self->_timer invalidate];

  double v5 = (PCPersistentTimer *)[objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"MobileBackupLockRenew" serviceIdentifier:self target:"_timerFired" selector:0 userInfo:a3];
  self->_timer = v5;
  [(PCPersistentTimer *)v5 setDisableSystemWaking:self->_type == 0];
  [(PCPersistentTimer *)self->_timer scheduleInRunLoop:+[NSRunLoop mainRunLoop]];
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Scheduled MBS lock timer in %0.1f s", buf, 0xCu);
    _MBLog();
  }
}

- (void)_timerFired
{
  objc_super v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "MBS lock timer fired", buf, 2u);
    _MBLog();
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028B330;
  block[3] = &unk_1004149C0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (double)_holdLock
{
  uint64_t v8 = 0;
  if ([(MBService *)self->_service backupForUDID:self->_backupUDID lastModified:0 error:&v8])
  {
    objc_super v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Renewed lock", buf, 2u);
      _MBLog();
    }
    [(MBServiceLockManager *)self renewInterval];
  }
  else
  {
    if (+[MBError isError:v8 withCode:306]
      && self->_type == 1)
    {
      [(MBServiceLockManager *)self _reacquireLockWithError:0];
    }
    else
    {
      double v5 = MBGetDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = +[MBError descriptionForError:v8];
        *(_DWORD *)buf = 138412290;
        id v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error renewing lock: %@", buf, 0xCu);
        id v7 = +[MBError descriptionForError:v8];
        _MBLog();
      }
    }
    [(MBServiceLockManager *)self retryInterval];
  }
  return result;
}

- (double)_releaseLock
{
  uint64_t v12 = 0;
  if ([(MBService *)self->_service restoreCompleteWithInfo:0 backupUDID:self->_backupUDID error:&v12])
  {
    if ([(MBService *)self->_service lockForBackupUDID:self->_backupUDID]) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceLockManager.m" lineNumber:234 description:@"Lock not released"];
    }
    id v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Released lock", buf, 2u);
      _MBLog();
    }
    [self->_delegate lockManagerDidReleaseLock:self];
    return 0.0;
  }
  unsigned int v5 = +[MBError isError:withCodes:](MBError, "isError:withCodes:", v12, 4, 13, 305, 306, 0);
  id v6 = MBGetDefaultLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      id v8 = +[MBError descriptionForError:v12];
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to release lock: %@", buf, 0xCu);
      id v11 = +[MBError descriptionForError:v12];
      _MBLog();
    }
    objc_msgSend(self->_delegate, "lockManager:failedToReleaseLockWithError:", self, v12, v11);
    return 0.0;
  }
  if (v7)
  {
    id v10 = +[MBError descriptionForError:v12];
    *(_DWORD *)buf = 138412290;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error releasing lock: %@", buf, 0xCu);
    id v11 = +[MBError descriptionForError:v12];
    _MBLog();
  }
  [(MBServiceLockManager *)self retryInterval];
  return result;
}

- (MBServiceAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

@end