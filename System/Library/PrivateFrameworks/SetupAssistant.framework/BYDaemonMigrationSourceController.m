@interface BYDaemonMigrationSourceController
- (BYDaemonMigrationSourceController)init;
- (BYSourceDeviceMigration)migrationManager;
- (NSString)targetDeviceName;
- (OS_dispatch_queue)migrationCompleteQueue;
- (RPFileTransferSession)fileTransferSessionTemplate;
- (id)migrationCompleteBlock;
- (void)addDelegate:(id)a3;
- (void)cancel;
- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4;
- (void)launchSetupForMigration;
- (void)removeDelegate:(id)a3;
- (void)setFileTransferSessionTemplate:(id)a3;
- (void)setFileTransferTemplate:(id)a3;
- (void)setMigrationCompleteBlock:(id)a3;
- (void)setMigrationCompleteQueue:(id)a3;
- (void)setMigrationManager:(id)a3;
- (void)setTargetDeviceName:(id)a3;
- (void)start;
- (void)waitForMigrationToCompleteWithTimeout:(double)a3 completionBlock:(id)a4;
@end

@implementation BYDaemonMigrationSourceController

- (BYDaemonMigrationSourceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BYDaemonMigrationSourceController;
  v2 = [(BYDaemonMigrationSourceController *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Migration Complete Queue", 0);
    migrationCompleteQueue = v2->_migrationCompleteQueue;
    v2->_migrationCompleteQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)start
{
  dispatch_queue_t v3 = [(BYDaemonMigrationSourceController *)self migrationManager];

  if (v3)
  {
    v4 = [(BYDaemonMigrationSourceController *)self migrationManager];
    [v4 cancelWithCause:8];
  }
  id v5 = objc_alloc((Class)BYSourceDeviceMigration);
  objc_super v6 = [(BYDaemonMigrationSourceController *)self fileTransferSessionTemplate];
  id v7 = [v5 initWithFileTranferSession:v6];
  [(BYDaemonMigrationSourceController *)self setMigrationManager:v7];

  v8 = [(BYDaemonMigrationSourceController *)self migrationManager];
  [v8 addDelegate:self];

  id v9 = [(BYDaemonMigrationSourceController *)self migrationManager];
  [v9 start];
}

- (void)cancel
{
  dispatch_queue_t v3 = [(BYDaemonMigrationSourceController *)self migrationManager];
  [v3 cancelWithCause:1];

  v4 = [(BYDaemonMigrationSourceController *)self migrationManager];
  [v4 removeDelegate:self];

  [(BYDaemonMigrationSourceController *)self setMigrationManager:0];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(BYDaemonMigrationSourceController *)self migrationManager];
  [v5 addDelegate:v4];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(BYDaemonMigrationSourceController *)self migrationManager];
  [v5 removeDelegate:v4];
}

- (void)launchSetupForMigration
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)BYSetupAssistantLaunchMigrationSourceUINotification;
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
}

- (void)setFileTransferTemplate:(id)a3
{
}

- (void)waitForMigrationToCompleteWithTimeout:(double)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(BYDaemonMigrationSourceController *)self migrationCompleteQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F070;
  block[3] = &unk_10001CB98;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  id v5 = [(BYDaemonMigrationSourceController *)self migrationCompleteQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F2B4;
  block[3] = &unk_10001C800;
  block[4] = self;
  dispatch_async(v5, block);
}

- (NSString)targetDeviceName
{
  return self->_targetDeviceName;
}

- (void)setTargetDeviceName:(id)a3
{
}

- (BYSourceDeviceMigration)migrationManager
{
  return self->_migrationManager;
}

- (void)setMigrationManager:(id)a3
{
}

- (RPFileTransferSession)fileTransferSessionTemplate
{
  return self->_fileTransferSessionTemplate;
}

- (void)setFileTransferSessionTemplate:(id)a3
{
}

- (OS_dispatch_queue)migrationCompleteQueue
{
  return self->_migrationCompleteQueue;
}

- (void)setMigrationCompleteQueue:(id)a3
{
}

- (id)migrationCompleteBlock
{
  return self->_migrationCompleteBlock;
}

- (void)setMigrationCompleteBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_migrationCompleteBlock, 0);
  objc_storeStrong((id *)&self->_migrationCompleteQueue, 0);
  objc_storeStrong((id *)&self->_fileTransferSessionTemplate, 0);
  objc_storeStrong((id *)&self->_migrationManager, 0);
  objc_storeStrong((id *)&self->_targetDeviceName, 0);
}

@end