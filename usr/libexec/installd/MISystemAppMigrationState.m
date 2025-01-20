@interface MISystemAppMigrationState
+ (id)defaultManager;
- (BOOL)systemAppMigrationComplete;
- (MISystemAppMigrationState)init;
- (NSMutableArray)blockArray;
- (OS_dispatch_queue)systemAppMigrationStateQueue;
- (void)setBlockArray:(id)a3;
- (void)setSystemAppMigrationComplete:(BOOL)a3;
- (void)waitForSystemAppMigrationToComplete:(id)a3;
@end

@implementation MISystemAppMigrationState

- (MISystemAppMigrationState)init
{
  v8.receiver = self;
  v8.super_class = (Class)MISystemAppMigrationState;
  v2 = [(MISystemAppMigrationState *)&v8 init];
  if (!v2) {
    return v2;
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.installd.SystemAppMigrationState", 0);
  systemAppMigrationStateQueue = v2->_systemAppMigrationStateQueue;
  v2->_systemAppMigrationStateQueue = (OS_dispatch_queue *)v3;

  if (sub_10002CB5C()) {
    goto LABEL_9;
  }
  if (!&_DMIsMigrationNeeded || (DMIsMigrationNeeded() & 1) == 0)
  {
    v5 = +[MIDaemonConfiguration sharedInstance];
    v6 = [v5 migrationPlistURL];
    MIRecordCurrentBuildVersion();

LABEL_9:
    v2->_systemAppMigrationComplete = 1;
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      goto LABEL_11;
    }
    return v2;
  }
  v2->_systemAppMigrationComplete = 0;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
LABEL_11:
  }
    MOLogWrite();
  return v2;
}

+ (id)defaultManager
{
  if (qword_1000A6000 != -1) {
    dispatch_once(&qword_1000A6000, &stru_10008D5D0);
  }
  v2 = (void *)qword_1000A6008;

  return v2;
}

- (void)setSystemAppMigrationComplete:(BOOL)a3
{
  v5 = [(MISystemAppMigrationState *)self systemAppMigrationStateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002DD4C;
  v6[3] = &unk_10008D5F8;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (BOOL)systemAppMigrationComplete
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(MISystemAppMigrationState *)self systemAppMigrationStateQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002DFBC;
  v5[3] = &unk_10008CFB0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)waitForSystemAppMigrationToComplete:(id)a3
{
  id v4 = a3;
  v5 = [(MISystemAppMigrationState *)self systemAppMigrationStateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E084;
  v7[3] = &unk_10008D620;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSMutableArray)blockArray
{
  return self->_blockArray;
}

- (void)setBlockArray:(id)a3
{
}

- (OS_dispatch_queue)systemAppMigrationStateQueue
{
  return self->_systemAppMigrationStateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAppMigrationStateQueue, 0);

  objc_storeStrong((id *)&self->_blockArray, 0);
}

@end