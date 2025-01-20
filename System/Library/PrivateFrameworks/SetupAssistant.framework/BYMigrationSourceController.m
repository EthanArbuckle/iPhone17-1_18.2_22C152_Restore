@interface BYMigrationSourceController
- (BYBuddyDaemonMigrationSourceClient)migrationSourceClient;
- (BYMigrationSourceController)init;
- (void)launchSetupForMigration:(id)a3;
- (void)setFileTransferSession:(id)a3;
- (void)setMigrationSourceClient:(id)a3;
@end

@implementation BYMigrationSourceController

- (BYMigrationSourceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)BYMigrationSourceController;
  v2 = [(BYMigrationSourceController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(BYBuddyDaemonMigrationSourceClient);
    migrationSourceClient = v2->_migrationSourceClient;
    v2->_migrationSourceClient = v3;
  }
  return v2;
}

- (void)launchSetupForMigration:(id)a3
{
  id v3 = [(BYMigrationSourceController *)self migrationSourceClient];
  [v3 launchSetupForMigration];
}

- (void)setFileTransferSession:(id)a3
{
  id v4 = a3;
  id v5 = [(BYMigrationSourceController *)self migrationSourceClient];
  [v5 setFileTransferTemplate:v4];
}

- (BYBuddyDaemonMigrationSourceClient)migrationSourceClient
{
  return self->_migrationSourceClient;
}

- (void)setMigrationSourceClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end