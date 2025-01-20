@interface BYDaemonBackupController
- (BOOL)takeLock;
- (BYDaemonBackupController)initWithMigrationController:(id)a3;
- (BYDaemonBackupControllerDelegate)delegate;
- (BYDaemonMigrationSourceController)migrationController;
- (MBManager)manager;
- (__MKBAssertion)backupLockAssertion;
- (double)lastPercentComplete;
- (void)attemptToBeginBackup:(unint64_t)a3;
- (void)manager:(id)a3 didFailBackupWithError:(id)a4;
- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5;
- (void)managerDidFinishBackup:(id)a3;
- (void)releaseLock;
- (void)setBackupLockAssertion:(__MKBAssertion *)a3;
- (void)setDelegate:(id)a3;
- (void)setLastPercentComplete:(double)a3;
- (void)setManager:(id)a3;
- (void)setMigrationController:(id)a3;
- (void)startBackup;
@end

@implementation BYDaemonBackupController

- (BYDaemonBackupController)initWithMigrationController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BYDaemonBackupController;
  v5 = [(BYDaemonBackupController *)&v10 init];
  if (v5)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v6 = (void *)qword_100024D88;
    uint64_t v15 = qword_100024D88;
    if (!qword_100024D88)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10000D248;
      v11[3] = &unk_10001C560;
      v11[4] = &v12;
      sub_10000D248((uint64_t)v11);
      v6 = (void *)v13[3];
    }
    v7 = v6;
    _Block_object_dispose(&v12, 8);
    id v8 = [[v7 alloc] initWithDelegate:v5];
    [(BYDaemonBackupController *)v5 setManager:v8];

    [(BYDaemonBackupController *)v5 setMigrationController:v4];
  }

  return v5;
}

- (void)startBackup
{
  v3 = [(BYDaemonBackupController *)self manager];
  unsigned __int8 v4 = [v3 isBackupEnabled];

  v5 = _BYLoggingFacility();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ensuring migration is not running before attempting to start a backup...", buf, 2u);
    }

    v7 = [(BYDaemonBackupController *)self migrationController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C838;
    v9[3] = &unk_10001CAE0;
    v9[4] = self;
    [v7 waitForMigrationToCompleteWithTimeout:v9 completionBlock:1800.0];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Backup is not enabled", buf, 2u);
    }

    v7 = +[NSError errorWithDomain:@"BYDaemonBackupControllerErrorDomain" code:0 userInfo:0];
    id v8 = [(BYDaemonBackupController *)self delegate];
    [v8 backupCompletedWithError:v7 dateOfLastBackup:0];
  }
}

- (void)attemptToBeginBackup:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)MBStartBackupOptions);
  BOOL v6 = +[MBCellularAccess inexpensiveCellularAccess];
  [v5 setCellularAccess:v6];

  v7 = [(BYDaemonBackupController *)self manager];
  id v16 = 0;
  unsigned int v8 = [v7 startBackupWithOptions:v5 error:&v16];
  id v9 = v16;

  objc_super v10 = _BYLoggingFacility();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Backup started!", buf, 2u);
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = (uint64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Backup failed to start returning error: %@", buf, 0xCu);
    }

    if (a3)
    {
      uint64_t v12 = _BYLoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v18 = 0x4024000000000000;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will retry to start backup again in %f seconds...", buf, 0xCu);
      }

      dispatch_time_t v13 = dispatch_time(0, 10000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000CCD8;
      block[3] = &unk_10001CB08;
      block[4] = self;
      block[5] = a3;
      dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      [(BYDaemonBackupController *)self releaseLock];
      uint64_t v14 = [(BYDaemonBackupController *)self delegate];
      [v14 backupCompletedWithError:v9 dateOfLastBackup:0];
    }
  }
}

- (BOOL)takeLock
{
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Taking device lock assertion during backup...", (uint8_t *)&buf, 2u);
  }

  CFStringRef v16 = @"MKBAssertionKey";
  CFStringRef v17 = @"RestoreFromBackup";
  unsigned __int8 v4 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  CFTypeRef cf = 0;
  uint64_t v12 = 0;
  dispatch_time_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  id v5 = (uint64_t (*)(void *, CFTypeRef *))off_100024D98;
  uint64_t v15 = off_100024D98;
  if (!off_100024D98)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v19 = sub_10000D400;
    v20 = &unk_10001C560;
    v21 = &v12;
    sub_10000D400((uint64_t)&buf);
    id v5 = (uint64_t (*)(void *, CFTypeRef *))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
  {
    sub_10001050C();
    __break(1u);
  }
  [(BYDaemonBackupController *)self setBackupLockAssertion:v5(v4, &cf)];
  BOOL v6 = [(BYDaemonBackupController *)self backupLockAssertion] == 0;
  v7 = _BYLoggingFacility();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = cf;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to take device lock assertion: %@", (uint8_t *)&buf, 0xCu);
    }

    CFRelease(cf);
  }
  else
  {
    if (v8)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device lock assertion successful", (uint8_t *)&buf, 2u);
    }
  }
  BOOL v9 = [(BYDaemonBackupController *)self backupLockAssertion] != 0;

  return v9;
}

- (void)releaseLock
{
  if ([(BYDaemonBackupController *)self backupLockAssertion])
  {
    v3 = _BYLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing device lock assertion taken during backup", v4, 2u);
    }

    CFRelease([(BYDaemonBackupController *)self backupLockAssertion]);
    [(BYDaemonBackupController *)self setBackupLockAssertion:0];
  }
}

- (void)manager:(id)a3 didFailBackupWithError:(id)a4
{
  id v5 = a4;
  [(BYDaemonBackupController *)self releaseLock];
  id v6 = [(BYDaemonBackupController *)self delegate];
  [v6 backupCompletedWithError:v5 dateOfLastBackup:0];
}

- (void)managerDidFinishBackup:(id)a3
{
  id v4 = a3;
  [(BYDaemonBackupController *)self releaseLock];
  id v6 = [(BYDaemonBackupController *)self delegate];
  id v5 = [v4 dateOfLastBackup];

  [v6 backupCompletedWithError:0 dateOfLastBackup:v5];
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  [(BYDaemonBackupController *)self lastPercentComplete];
  double v8 = a4;
  if (v9 < 0.0 || ([(BYDaemonBackupController *)self lastPercentComplete], v8 - v10 >= 0.05))
  {
    [(BYDaemonBackupController *)self setLastPercentComplete:v8];
    id v11 = [(BYDaemonBackupController *)self delegate];
    [v11 backupUpdatedProgress:a5 estimatedTimeRemaining:v8];
  }
}

- (BYDaemonBackupControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BYDaemonBackupControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BYDaemonMigrationSourceController)migrationController
{
  return self->_migrationController;
}

- (void)setMigrationController:(id)a3
{
}

- (MBManager)manager
{
  return (MBManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManager:(id)a3
{
}

- (__MKBAssertion)backupLockAssertion
{
  return self->_backupLockAssertion;
}

- (void)setBackupLockAssertion:(__MKBAssertion *)a3
{
  self->_backupLockAssertion = a3;
}

- (double)lastPercentComplete
{
  return self->_lastPercentComplete;
}

- (void)setLastPercentComplete:(double)a3
{
  self->_lastPercentComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_migrationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end