@interface EPSagaTransactionCreatePhoneSideWatchBackup
- (EPTransactionDelegate)delegate;
- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EPSagaTransactionCreatePhoneSideWatchBackup

- (void)beginTransactionWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"nrDeviceIdentifier"];
  if (!v6)
  {
    v13 = nr_daemon_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      v15 = nr_daemon_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000FC56C();
      }
      goto LABEL_10;
    }
LABEL_11:
    v7 = [(EPSagaTransactionCreatePhoneSideWatchBackup *)self delegate];
    [v7 transactionDidComplete:self];
    goto LABEL_12;
  }
  if (!sub_1000DF0B0())
  {
    v16 = nr_daemon_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      v15 = nr_daemon_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000FC5F8();
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = objc_alloc((Class)sub_1000DF0B0());
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.nanoregistry.recoverymanager.backup", v7);
  v10 = [v8 initWithQueue:v9];
  backupManager = self->_backupManager;
  self->_backupManager = v10;

  v12 = self->_backupManager;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000DF194;
  v18[3] = &unk_1001699B0;
  v18[4] = self;
  id v19 = v6;
  id v20 = v5;
  [v12 createBackupForPairingID:v19 completionHandler:v18];

LABEL_12:
}

- (void)beginRollbackWithRoutingSlipEntry:(id)a3 serviceRegistry:(id)a4
{
  id v5 = [a3 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DF544;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (EPTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_backupManager, 0);
}

@end