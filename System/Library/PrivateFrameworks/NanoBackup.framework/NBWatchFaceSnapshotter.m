@interface NBWatchFaceSnapshotter
+ (id)captureWatchFaceForPairingID:(id)a3 toFilePath:(id)a4;
- (NBWatchFaceSnapshotter)initWithPairingID:(id)a3;
- (NSMutableArray)snapshotBlocks;
- (NSUUID)pairingID;
- (NTKLibrarySelectedFaceSnapshotProvider)snapshotProvider;
- (OS_dispatch_queue)queue;
- (id)snapshotImage;
- (void)setPairingID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSnapshotBlocks:(id)a3;
- (void)setSnapshotProvider:(id)a3;
- (void)snapshotImageUpdated:(id)a3;
- (void)snapshotImageWithBlock:(id)a3;
@end

@implementation NBWatchFaceSnapshotter

+ (id)captureWatchFaceForPairingID:(id)a3 toFilePath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100034FA8 != -1) {
    dispatch_once(&qword_100034FA8, &stru_10002C7D0);
  }
  if (qword_100034FA0)
  {
    id v7 = [objc_alloc((Class)objc_opt_class()) initWithPairingID:v5];
    v8 = [v7 snapshotImage];
    v9 = v8;
    if (v8)
    {
      v10 = UIImagePNGRepresentation(v8);
      v11 = v10;
      if (v10)
      {
        id v21 = 0;
        [v10 writeToFile:v6 options:1073741825 error:&v21];
        id v12 = v21;
        if (v12)
        {
          v13 = v12;
          v14 = (void *)nb_daemon_log;
          if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            id v16 = [v11 length];
            *(_DWORD *)buf = 134218498;
            id v23 = v16;
            __int16 v24 = 2112;
            id v25 = v6;
            __int16 v26 = 2112;
            v27 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to write clock face data (%lu bytes) to (%@) with error: (%@)", buf, 0x20u);
          }
          goto LABEL_19;
        }
      }
      else
      {
        v19 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to retrieve the PNG representation of the snapshot", buf, 2u);
        }
      }
    }
    else
    {
      v18 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to retrieve the watch face snapshot", buf, 2u);
      }
    }
    v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v17 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to instantiate the Face Snapshot singleton", buf, 2u);
  }
  v13 = 0;
LABEL_20:

  return v13;
}

- (NBWatchFaceSnapshotter)initWithPairingID:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NBWatchFaceSnapshotter;
  id v6 = [(NBWatchFaceSnapshotter *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pairingID, a3);
    v8 = (NTKLibrarySelectedFaceSnapshotProvider *)[objc_alloc((Class)NTKLibrarySelectedFaceSnapshotProvider) initWithDeviceUUID:v5];
    snapshotProvider = v7->_snapshotProvider;
    v7->_snapshotProvider = v8;

    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(v10, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.NanoBackup.snapshotter", v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[NSMutableArray array];
    snapshotBlocks = v7->_snapshotBlocks;
    v7->_snapshotBlocks = (NSMutableArray *)v14;

    [(NTKLibrarySelectedFaceSnapshotProvider *)v7->_snapshotProvider setDelegate:v7];
  }

  return v7;
}

- (id)snapshotImage
{
  v3 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requesting face snapshot from NTK", buf, 2u);
  }
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  v15 = buf;
  uint64_t v16 = 0x3032000000;
  objc_super v17 = sub_1000031F8;
  v18 = sub_100003208;
  id v19 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003210;
  v11[3] = &unk_10002C740;
  v13 = buf;
  id v5 = v4;
  dispatch_queue_t v12 = v5;
  [(NBWatchFaceSnapshotter *)self snapshotImageWithBlock:v11];
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    id v7 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Timed out waiting for snapshot from NTK", v10, 2u);
    }
  }
  id v8 = *((id *)v15 + 5);

  _Block_object_dispose(buf, 8);

  return v8;
}

- (void)snapshotImageWithBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000033D8;
  block[3] = &unk_10002C768;
  block[4] = self;
  id v6 = v4;
  id v14 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
  id v7 = [(NTKLibrarySelectedFaceSnapshotProvider *)self->_snapshotProvider snapshotImage];
  if (v7)
  {
    id v8 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Face snapshot received from NTK inline", buf, 2u);
    }
    v9 = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000342C;
    v10[3] = &unk_10002C790;
    v10[4] = self;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)v9, v10);
  }
}

- (void)snapshotImageUpdated:(id)a3
{
  id v4 = a3;
  id v5 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Face snapshot received from NTK via delegate call", buf, 2u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003620;
  v8[3] = &unk_10002C790;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
}

- (NTKLibrarySelectedFaceSnapshotProvider)snapshotProvider
{
  return self->_snapshotProvider;
}

- (void)setSnapshotProvider:(id)a3
{
}

- (NSMutableArray)snapshotBlocks
{
  return self->_snapshotBlocks;
}

- (void)setSnapshotBlocks:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_snapshotBlocks, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);

  objc_storeStrong((id *)&self->_pairingID, 0);
}

@end