@interface BYDeviceSetupSourceSession
- (BOOL)hasBackupCompleted;
- (BOOL)hasSyncCompleted;
- (BYBuddyDaemonMigrationSourceClient)migrationSourceClient;
- (BYBuddyDaemonProximitySourceClient)client;
- (CUMessageSession)messageSession;
- (RPFileTransferSession)fileTransferSessionTemplate;
- (double)backupProgress;
- (double)syncProgress;
- (double)timeRemaining;
- (id)progressHandler;
- (id)sendObjectHandler;
- (unint64_t)currentPhase;
- (void)activate;
- (void)backupCompletedWithError:(id)a3;
- (void)backupProgress:(double)a3 estimatedTimeRemaining:(int64_t)a4;
- (void)finishedWithError:(id)a3;
- (void)invalidate;
- (void)setBackupProgress:(double)a3;
- (void)setClient:(id)a3;
- (void)setCurrentPhase:(unint64_t)a3;
- (void)setFileTransferSessionTemplate:(id)a3;
- (void)setHasBackupCompleted:(BOOL)a3;
- (void)setHasSyncCompleted:(BOOL)a3;
- (void)setMessageSession:(id)a3;
- (void)setMigrationSourceClient:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setSendObjectHandler:(id)a3;
- (void)setSyncProgress:(double)a3;
- (void)setTimeRemaining:(double)a3;
- (void)syncCompletedWithErrors:(id)a3;
- (void)syncProgress:(double)a3;
- (void)updateProgress;
@end

@implementation BYDeviceSetupSourceSession

- (void)setMessageSession:(id)a3
{
  objc_storeStrong((id *)&self->_messageSession, a3);
  v4 = [(BYDeviceSetupSourceSession *)self client];

  if (v4)
  {
    [(BYDeviceSetupSourceSession *)self invalidate];
    [(BYDeviceSetupSourceSession *)self activate];
  }
}

- (void)setFileTransferSessionTemplate:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_fileTransferSessionTemplate, a3);
  v5 = [(BYDeviceSetupSourceSession *)self migrationSourceClient];

  if (v5)
  {
    v6 = [(BYDeviceSetupSourceSession *)self migrationSourceClient];
    [v6 setFileTransferTemplate:v7];
  }
}

- (void)activate
{
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Proximity setup source session activated", v11, 2u);
  }

  [(BYDeviceSetupSourceSession *)self setCurrentPhase:0];
  v4 = objc_alloc_init(BYBuddyDaemonProximitySourceClient);
  [(BYDeviceSetupSourceSession *)self setClient:v4];

  v5 = [(BYDeviceSetupSourceSession *)self client];
  [v5 setDelegate:self];

  v6 = objc_alloc_init(BYBuddyDaemonMigrationSourceClient);
  [(BYDeviceSetupSourceSession *)self setMigrationSourceClient:v6];

  id v7 = [(BYDeviceSetupSourceSession *)self migrationSourceClient];
  v8 = [(BYDeviceSetupSourceSession *)self fileTransferSessionTemplate];
  [v7 setFileTransferTemplate:v8];

  [(BYDeviceSetupSourceSession *)self setTimeRemaining:-1.0];
  v9 = [(BYDeviceSetupSourceSession *)self client];
  v10 = [(BYDeviceSetupSourceSession *)self messageSession];
  [v9 activateWithSharingChannel:v10];
}

- (void)invalidate
{
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Proximity setup source session invalidated", v5, 2u);
  }

  v4 = [(BYDeviceSetupSourceSession *)self client];
  [v4 invalidate];

  [(BYDeviceSetupSourceSession *)self setClient:0];
}

- (void)updateProgress
{
  if ([(BYDeviceSetupSourceSession *)self currentPhase] == 1
    && [(BYDeviceSetupSourceSession *)self hasBackupCompleted])
  {
    [(BYDeviceSetupSourceSession *)self setCurrentPhase:2];
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(BYDeviceSetupSourceSession *)self backupProgress];
  double v4 = v3;
  [(BYDeviceSetupSourceSession *)self syncProgress];
  v6 = [NSNumber numberWithDouble:v5 * 0.200000003 + v4 * 0.800000012];
  [v13 setObject:v6 forKeyedSubscript:@"percentComplete"];

  id v7 = NSNumber;
  [(BYDeviceSetupSourceSession *)self timeRemaining];
  v9 = [v7 numberWithDouble:v8 * 60.0];
  [v13 setObject:v9 forKeyedSubscript:@"timeRemaining"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BYDeviceSetupSourceSession currentPhase](self, "currentPhase"));
  [v13 setObject:v10 forKeyedSubscript:@"phase"];

  v11 = [(BYDeviceSetupSourceSession *)self progressHandler];

  if (v11)
  {
    v12 = [(BYDeviceSetupSourceSession *)self progressHandler];
    ((void (**)(void, id))v12)[2](v12, v13);
  }
}

- (void)finishedWithError:(id)a3
{
  id v9 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v5 = v4;
  if (v9)
  {
    v6 = @"eo";
    id v7 = v9;
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CC38];
    v6 = @"finished";
  }
  [v4 setObject:v7 forKeyedSubscript:v6];
  double v8 = [(BYDeviceSetupSourceSession *)self progressHandler];
  ((void (**)(void, void *))v8)[2](v8, v5);
}

- (void)backupProgress:(double)a3 estimatedTimeRemaining:(int64_t)a4
{
  [(BYDeviceSetupSourceSession *)self setBackupProgress:a3];
  [(BYDeviceSetupSourceSession *)self setTimeRemaining:(double)a4];
  [(BYDeviceSetupSourceSession *)self setHasBackupCompleted:0];
  [(BYDeviceSetupSourceSession *)self setCurrentPhase:1];
  [(BYDeviceSetupSourceSession *)self updateProgress];
}

- (void)backupCompletedWithError:(id)a3
{
  [(BYDeviceSetupSourceSession *)self setHasBackupCompleted:1];
  [(BYDeviceSetupSourceSession *)self setTimeRemaining:-1.0];
  [(BYDeviceSetupSourceSession *)self updateProgress];
}

- (void)syncProgress:(double)a3
{
  [(BYDeviceSetupSourceSession *)self setSyncProgress:a3];
  [(BYDeviceSetupSourceSession *)self updateProgress];
}

- (void)syncCompletedWithErrors:(id)a3
{
  [(BYDeviceSetupSourceSession *)self setHasSyncCompleted:1];
  [(BYDeviceSetupSourceSession *)self updateProgress];
}

- (id)sendObjectHandler
{
  return self->_sendObjectHandler;
}

- (void)setSendObjectHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (CUMessageSession)messageSession
{
  return self->_messageSession;
}

- (RPFileTransferSession)fileTransferSessionTemplate
{
  return self->_fileTransferSessionTemplate;
}

- (BYBuddyDaemonProximitySourceClient)client
{
  return (BYBuddyDaemonProximitySourceClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClient:(id)a3
{
}

- (BYBuddyDaemonMigrationSourceClient)migrationSourceClient
{
  return self->_migrationSourceClient;
}

- (void)setMigrationSourceClient:(id)a3
{
}

- (double)backupProgress
{
  return self->_backupProgress;
}

- (void)setBackupProgress:(double)a3
{
  self->_backupProgress = a3;
}

- (double)syncProgress
{
  return self->_syncProgress;
}

- (void)setSyncProgress:(double)a3
{
  self->_syncProgress = a3;
}

- (BOOL)hasBackupCompleted
{
  return self->_hasBackupCompleted;
}

- (void)setHasBackupCompleted:(BOOL)a3
{
  self->_hasBackupCompleted = a3;
}

- (BOOL)hasSyncCompleted
{
  return self->_hasSyncCompleted;
}

- (void)setHasSyncCompleted:(BOOL)a3
{
  self->_hasSyncCompleted = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (unint64_t)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(unint64_t)a3
{
  self->_currentPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationSourceClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_fileTransferSessionTemplate, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_sendObjectHandler, 0);
}

@end