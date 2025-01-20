@interface NBBackupiCloud
- (NBBackupiCloud)init;
- (NBRemoteObjectClassC)idsService;
- (NBiCloudBackupManager)manager;
- (OS_dispatch_queue)workQueue;
- (void)backupList:(id)a3;
- (void)backupPayloadForID:(id)a3 completion:(id)a4;
- (void)createBackupsAndPruneAtDate:(id)a3 withPayload:(id)a4 completion:(id)a5;
- (void)createInitialBackup:(id)a3;
- (void)createManualBackupWithCompletion:(id)a3;
- (void)deleteBackupWithID:(id)a3 completion:(id)a4;
- (void)restoreBackupWithID:(id)a3 completion:(id)a4;
- (void)restoreBackupWithURL:(id)a3 completion:(id)a4;
- (void)setIdsService:(id)a3;
- (void)setManager:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation NBBackupiCloud

- (NBBackupiCloud)init
{
  v11.receiver = self;
  v11.super_class = (Class)NBBackupiCloud;
  v2 = [(NBBackupiCloud *)&v11 init];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanobackupd", v3);
  workQueue = v2->_workQueue;
  v2->_workQueue = (OS_dispatch_queue *)v4;

  v6 = v2->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004004;
  block[3] = &unk_10002C7F8;
  v7 = v2;
  v10 = v7;
  dispatch_sync(v6, block);

  return v7;
}

- (void)backupList:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000041B0;
  v7[3] = &unk_10002C768;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)restoreBackupWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000043A0;
  block[3] = &unk_10002C870;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)deleteBackupWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004618;
  block[3] = &unk_10002C870;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)restoreBackupWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000480C;
  block[3] = &unk_10002C870;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)backupPayloadForID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A14;
  block[3] = &unk_10002C870;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)createInitialBackup:(id)a3
{
  manager = self->_manager;
  if (!manager)
  {
    v5 = objc_alloc_init(NBiCloudBackupManager);
    id v6 = self->_manager;
    self->_manager = v5;

    manager = self->_manager;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004BF8;
  v7[3] = &unk_10002C8C0;
  v7[4] = self;
  [(NBiCloudBackupManager *)manager createInitialBackup:v7];
}

- (void)createManualBackupWithCompletion:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  if (!manager)
  {
    id v6 = objc_alloc_init(NBiCloudBackupManager);
    id v7 = self->_manager;
    self->_manager = v6;

    manager = self->_manager;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004D80;
  v9[3] = &unk_10002C848;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(NBiCloudBackupManager *)manager createManualBackup:v9];
}

- (void)createBackupsAndPruneAtDate:(id)a3 withPayload:(id)a4 completion:(id)a5
{
  id v6 = a5;
  manager = self->_manager;
  if (!manager)
  {
    id v8 = objc_alloc_init(NBiCloudBackupManager);
    id v9 = self->_manager;
    self->_manager = v8;

    manager = self->_manager;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004EA8;
  v11[3] = &unk_10002C848;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(NBiCloudBackupManager *)manager createBackupsAndPruneAtDate:0 withPayload:0 completion:v11];
}

- (NBRemoteObjectClassC)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NBiCloudBackupManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end