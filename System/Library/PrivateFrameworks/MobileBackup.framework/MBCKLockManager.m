@interface MBCKLockManager
- (BOOL)_lockMustRenew;
- (BOOL)reacquireLockWithError:(id *)a3;
- (CKOperationGroup)ckOperationGroup;
- (MBCKDatabaseManager)databaseManager;
- (MBCKLock)lock;
- (MBCKLockManager)initWithAccount:(id)a3 restoreType:(int)a4 backupUDID:(id)a5 databaseManager:(id)a6 delegate:(id)a7 operationGroup:(id)a8 thermalPressureMonitor:(id)a9 snapshotUUID:(id)a10;
- (MBThermalPressureMonitor)thermalPressureMonitor;
- (NSDate)lastAcquired;
- (NSString)snapshotUUID;
- (double)lastDuration;
- (double)renewInterval;
- (double)retryInterval;
- (double)timeout;
- (id)_fetchPluginFieldsFromDelegate;
- (int)restoreType;
- (void)_releaseLockAndScheduleRetries;
- (void)_renewLockAndScheduleRetries;
- (void)_scheduleTimerWithInterval:(double)a3;
- (void)_timerFired;
- (void)releaseLockAsync;
- (void)releaseLockSync;
- (void)resetRenewalTimer;
- (void)setCkOperationGroup:(id)a3;
- (void)setLastAcquired:(id)a3;
- (void)setLastDuration:(double)a3;
- (void)setSnapshotUUID:(id)a3;
- (void)setThermalPressureMonitor:(id)a3;
- (void)startRenewingLock;
- (void)stopRenewingLock;
@end

@implementation MBCKLockManager

- (MBCKLockManager)initWithAccount:(id)a3 restoreType:(int)a4 backupUDID:(id)a5 databaseManager:(id)a6 delegate:(id)a7 operationGroup:(id)a8 thermalPressureMonitor:(id)a9 snapshotUUID:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v27 = a9;
  id v20 = a10;
  if (!v17) {
    __assert_rtn("-[MBCKLockManager initWithAccount:restoreType:backupUDID:databaseManager:delegate:operationGroup:thermalPressureMonitor:snapshotUUID:]", "MBCKLockManager.m", 40, "databaseManager");
  }
  v26 = v20;
  v28.receiver = self;
  v28.super_class = (Class)MBCKLockManager;
  v21 = [(MBServiceLockManager *)&v28 initWithAccount:v15 backupUDID:v16 type:1 delegate:v18];
  v22 = v21;
  if (v21)
  {
    v21->_restoreType = a4;
    lock = v21->_lock;
    v21->_lock = 0;

    v22->_releaseLock = 0;
    objc_storeStrong((id *)&v22->_databaseManager, a6);
    objc_storeStrong((id *)&v22->_ckOperationGroup, a8);
    objc_storeStrong((id *)&v22->_thermalPressureMonitor, a9);
    objc_storeStrong((id *)&v22->_snapshotUUID, a10);
  }

  return v22;
}

- (MBCKLock)lock
{
  v2 = self;
  objc_sync_enter(v2);
  lock = v2->_lock;
  if (!lock)
  {
    v4 = [MBCKLock alloc];
    backupUDID = v2->super._backupUDID;
    v6 = [(MBCKLockManager *)v2 databaseManager];
    v7 = [(MBCKLock *)v4 initWithDeviceUUID:backupUDID databaseManager:v6];
    v8 = v2->_lock;
    v2->_lock = v7;

    [(MBCKLock *)v2->_lock setCkOperationGroup:v2->_ckOperationGroup];
    lock = v2->_lock;
  }
  v9 = lock;
  objc_sync_exit(v2);

  return v9;
}

- (double)timeout
{
  return 172800.0;
}

- (double)renewInterval
{
  return 1800.0;
}

- (double)retryInterval
{
  return 600.0;
}

- (void)startRenewingLock
{
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    backupUDID = self->super._backupUDID;
    *(_DWORD *)buf = 138412290;
    v8 = backupUDID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting to renew lock for device %@", buf, 0xCu);
    _MBLog();
  }

  queue = self->super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001449D0;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resetRenewalTimer
{
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting lock timer", buf, 2u);
    _MBLog();
  }

  queue = self->super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100144CA4;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopRenewingLock
{
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping renewing lock", buf, 2u);
    _MBLog();
  }

  queue = self->super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100144DB4;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)reacquireLockWithError:(id *)a3
{
  if (![(MBCKLockManager *)self _lockMustRenew]) {
    return 1;
  }
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    backupUDID = self->super._backupUDID;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = backupUDID;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Acquiring lock for device %@", (uint8_t *)&buf, 0xCu);
    id v16 = self->super._backupUDID;
    _MBLog();
  }

  self->_releaseLock = 0;
  [(MBCKLockManager *)self timeout];
  double v8 = v7;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  objc_super v28 = sub_100145108;
  v29 = sub_100145118;
  id v30 = 0;
  queue = self->super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100145120;
  block[3] = &unk_100411840;
  block[4] = self;
  void block[5] = &v18;
  *(double *)&block[7] = v7;
  block[6] = &buf;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v19 + 24))
  {
    if (self->super._delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [self->super._delegate lockManagerDidAcquireLock:self];
    }
    v10 = +[NSDate date];
    [(MBCKLockManager *)self setLastAcquired:v10];

    [(MBCKLockManager *)self setLastDuration:v8];
  }
  else
  {
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = self->super._backupUDID;
      uint64_t v15 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v22 = 138412546;
      v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to renew lock for device %@: %@", v22, 0x16u);
      _MBLog();
    }

    if (a3) {
      *a3 = *(id *)(*((void *)&buf + 1) + 40);
    }
    if (self->super._delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [self->super._delegate lockManager:self failedToAcquireLockWithError:*(void *)(*((void *)&buf + 1) + 40)];
    }
  }
  BOOL v11 = *((unsigned char *)v19 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)releaseLockSync
{
  queue = self->super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014524C;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)releaseLockAsync
{
  queue = self->super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001452C8;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_releaseLockAndScheduleRetries
{
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    backupUDID = self->super._backupUDID;
    *(_DWORD *)long long buf = 138412290;
    id v17 = backupUDID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing lock for device %@", buf, 0xCu);
    v14 = self->super._backupUDID;
    _MBLog();
  }

  self->_releaseLock = 1;
  v5 = [(MBCKLockManager *)self _fetchPluginFieldsFromDelegate];
  v6 = [(MBCKLockManager *)self lock];
  double v7 = [(MBServiceLockManager *)self account];
  id v15 = 0;
  unsigned int v8 = [v6 clearLockWithAccount:v7 pluginFields:v5 error:&v15];
  id v9 = v15;

  if (v8)
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = self->super._backupUDID;
      *(_DWORD *)long long buf = 138412290;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Released lock for device %@", buf, 0xCu);
      v14 = self->super._backupUDID;
      _MBLog();
    }

    [self->super._delegate lockManagerDidReleaseLock:self];
    [(MBCKLockManager *)self setLastAcquired:0];
    [(MBCKLockManager *)self setLastDuration:0.0];
    goto LABEL_9;
  }
  [(MBCKLockManager *)self retryInterval];
  double v13 = v12;
  [self->super._delegate lockManager:self failedToReleaseLockWithError:v9];
  if (v13 <= 0.0)
  {
LABEL_9:
    [(PCPersistentTimer *)self->super._timer invalidate];
    goto LABEL_10;
  }
  [(MBCKLockManager *)self _scheduleTimerWithInterval:v13];
LABEL_10:
}

- (void)_renewLockAndScheduleRetries
{
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    backupUDID = self->super._backupUDID;
    *(_DWORD *)long long buf = 138412290;
    id v19 = backupUDID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Renewing lock for device %@", buf, 0xCu);
    id v16 = self->super._backupUDID;
    _MBLog();
  }

  [(MBCKLockManager *)self timeout];
  double v6 = v5;
  double v7 = [(MBCKLockManager *)self _fetchPluginFieldsFromDelegate];
  unsigned int v8 = [(MBCKLockManager *)self lock];
  id v9 = [(MBServiceLockManager *)self account];
  id v17 = 0;
  unsigned __int8 v10 = [v8 saveLockWithAccount:v9 timeout:v7 pluginFields:&v17 error:v6];
  id v11 = v17;

  if (v10)
  {
    [(MBCKLockManager *)self renewInterval];
    double v13 = v12;
    if (self->super._delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [self->super._delegate lockManagerDidAcquireLock:self];
    }
    v14 = +[NSDate date];
    [(MBCKLockManager *)self setLastAcquired:v14];

    [(MBCKLockManager *)self setLastDuration:v6];
  }
  else
  {
    [(MBCKLockManager *)self retryInterval];
    double v13 = v15;
    if (self->super._delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [self->super._delegate lockManager:self failedToAcquireLockWithError:v11];
    }
  }
  if (v13 <= 0.0) {
    [(PCPersistentTimer *)self->super._timer invalidate];
  }
  else {
    [(MBCKLockManager *)self _scheduleTimerWithInterval:v13];
  }
}

- (void)_scheduleTimerWithInterval:(double)a3
{
  [(PCPersistentTimer *)self->super._timer invalidate];
  double v5 = (PCPersistentTimer *)[objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"MobileBackupLockRenew" serviceIdentifier:self target:"_timerFired" selector:0 userInfo:a3];
  timer = self->super._timer;
  self->super._timer = v5;

  [(PCPersistentTimer *)self->super._timer scheduleInQueue:self->super._queue];
  double v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    double v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Scheduled lock timer in %.3fs", buf, 0xCu);
    _MBLog();
  }
}

- (void)_timerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._queue);
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Lock timer fired", v4, 2u);
    _MBLog();
  }

  if (self->_releaseLock) {
    [(MBCKLockManager *)self _releaseLockAndScheduleRetries];
  }
  else {
    [(MBCKLockManager *)self _renewLockAndScheduleRetries];
  }
}

- (BOOL)_lockMustRenew
{
  uint64_t v3 = [(MBCKLockManager *)self lastAcquired];
  if (!v3) {
    return 1;
  }
  v4 = (void *)v3;
  [(MBCKLockManager *)self lastDuration];
  double v6 = v5;

  if (v6 == 0.0) {
    return 1;
  }
  unsigned int v8 = +[NSDate date];
  double v9 = [(MBCKLockManager *)self lastAcquired];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;
  [(MBCKLockManager *)self lastDuration];
  BOOL v7 = v11 > v12 + -600.0;

  return v7;
}

- (id)_fetchPluginFieldsFromDelegate
{
  if ([(MBCKLockManager *)self restoreType] == 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = self->super._delegate;
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v3 = [v4 fetchPluginFieldsForLockManger:self];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (int)restoreType
{
  return self->_restoreType;
}

- (MBThermalPressureMonitor)thermalPressureMonitor
{
  return self->_thermalPressureMonitor;
}

- (void)setThermalPressureMonitor:(id)a3
{
}

- (NSString)snapshotUUID
{
  return self->_snapshotUUID;
}

- (void)setSnapshotUUID:(id)a3
{
}

- (NSDate)lastAcquired
{
  return self->_lastAcquired;
}

- (void)setLastAcquired:(id)a3
{
}

- (double)lastDuration
{
  return self->_lastDuration;
}

- (void)setLastDuration:(double)a3
{
  self->_lastDuration = a3;
}

- (MBCKDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (CKOperationGroup)ckOperationGroup
{
  return self->_ckOperationGroup;
}

- (void)setCkOperationGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckOperationGroup, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_lastAcquired, 0);
  objc_storeStrong((id *)&self->_snapshotUUID, 0);
  objc_storeStrong((id *)&self->_thermalPressureMonitor, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end