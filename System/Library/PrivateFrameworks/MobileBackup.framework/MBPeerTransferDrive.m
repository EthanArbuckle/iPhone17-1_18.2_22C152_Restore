@interface MBPeerTransferDrive
- (BOOL)_handleMoveItem:(id)a3 metadata:(id)a4 error:(id *)a5;
- (BOOL)_handleReceivedItem:(id)a3 metadata:(id)a4 error:(id *)a5;
- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4;
- (BOOL)invalidated;
- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (MBFileHashDB)fileHashDB;
- (MBPeerTransferDrive)initWithRootURL:(id)a3 fileTransferSession:(id)a4 uploadBatchSize:(unint64_t)a5 concurrentUploadBatchCount:(unint64_t)a6 concurrentOpenBatchCount:(unint64_t)a7;
- (NSError)invalidationError;
- (NSMutableArray)batchQueues;
- (NSMutableArray)metadataQueues;
- (NSMutableArray)pendingUploadBatches;
- (NSURL)rootURL;
- (OS_dispatch_semaphore)batchUploadSemaphore;
- (OS_dispatch_semaphore)openSQLiteFilesSemaphore;
- (RPFileTransferSession)fileTransferSession;
- (id)_queueWithBatch:(id)a3;
- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (id)fullURLForDriveRelativePath:(id)a3;
- (id)receiveProgressHandler;
- (id)sendProgressHandler;
- (unint64_t)concurrentUploadBatchCount;
- (unint64_t)freeSpace;
- (unint64_t)pendingUploadSize;
- (unint64_t)uploadBatchSize;
- (void)_resetReceivedFilesProgress;
- (void)_updateProgressForReceivedItem:(id)a3 size:(int64_t)a4;
- (void)_updateProgressForSentItem:(id)a3 size:(int64_t)a4;
- (void)_uploadBatch:(id)a3 options:(id)a4 completion:(id)a5;
- (void)cleanUpReceivedFilesDirectory;
- (void)dealloc;
- (void)finishBatchUploadsWithOptions:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)setBatchQueues:(id)a3;
- (void)setBatchUploadSemaphore:(id)a3;
- (void)setConcurrentUploadBatchCount:(unint64_t)a3;
- (void)setFileHashDB:(id)a3;
- (void)setFileTransferSession:(id)a3;
- (void)setFreeSpace:(unint64_t)a3;
- (void)setInvalidationError:(id)a3;
- (void)setMetadataQueues:(id)a3;
- (void)setOpenSQLiteFilesSemaphore:(id)a3;
- (void)setPendingUploadBatches:(id)a3;
- (void)setPendingUploadSize:(unint64_t)a3;
- (void)setReceiveProgressHandler:(id)a3;
- (void)setRootURL:(id)a3;
- (void)setSendProgressHandler:(id)a3;
- (void)setUploadBatchSize:(unint64_t)a3;
- (void)startListeningForFileTransfers;
- (void)uploadBatch:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation MBPeerTransferDrive

- (MBPeerTransferDrive)initWithRootURL:(id)a3 fileTransferSession:(id)a4 uploadBatchSize:(unint64_t)a5 concurrentUploadBatchCount:(unint64_t)a6 concurrentOpenBatchCount:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  if (!a5) {
    __assert_rtn("-[MBPeerTransferDrive initWithRootURL:fileTransferSession:uploadBatchSize:concurrentUploadBatchCount:concurrentOpenBatchCount:]", "MBPeerTransferDrive.m", 59, "uploadBatchSize");
  }
  if (!a6) {
    __assert_rtn("-[MBPeerTransferDrive initWithRootURL:fileTransferSession:uploadBatchSize:concurrentUploadBatchCount:concurrentOpenBatchCount:]", "MBPeerTransferDrive.m", 60, "concurrentUploadBatchCount");
  }
  if (!a7) {
    __assert_rtn("-[MBPeerTransferDrive initWithRootURL:fileTransferSession:uploadBatchSize:concurrentUploadBatchCount:concurrentOpenBatchCount:]", "MBPeerTransferDrive.m", 61, "concurrentOpenBatchCount");
  }
  v14 = v13;
  v53.receiver = self;
  v53.super_class = (Class)MBPeerTransferDrive;
  v15 = [(MBPeerTransferDrive *)&v53 init];
  v16 = v15;
  if (v15)
  {
    unint64_t v48 = a5;
    unint64_t v49 = a6;
    v15->_progressLock._os_unfair_lock_opaque = 0;
    v51 = v14;
    [(MBPeerTransferDrive *)v15 setFileTransferSession:v14];
    id v52 = v12;
    [(MBPeerTransferDrive *)v16 setRootURL:v12];
    id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a7];
    uint64_t v18 = 0;
    do
    {
      id v19 = +[NSString stringWithFormat:@"com.apple.backup.batch.%lu", v18];
      v20 = (const char *)[v19 UTF8String];
      v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v22 = dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v23 = dispatch_queue_create(v20, v22);

      [v17 addObject:v23];
      ++v18;
    }
    while (a7 != v18);
    v50 = v16;
    [(MBPeerTransferDrive *)v16 setBatchQueues:v17];
    id v24 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a7];
    uint64_t v25 = 0;
    do
    {
      id v26 = +[NSString stringWithFormat:@"com.apple.backup.medatada.%lu", v25];
      v27 = (const char *)[v26 UTF8String];
      v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v29 = dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v30 = dispatch_queue_create(v27, v29);

      [v24 addObject:v30];
      ++v25;
    }
    while (a7 != v25);
    [(MBPeerTransferDrive *)v50 setMetadataQueues:v24];
    uint64_t v31 = objc_opt_class();
    +[MBPeerMessenger registerRequestClass:v31 responseClass:objc_opt_class() forTask:@"MBPeerTaskMove"];
    v16 = v50;
    uint64_t v32 = objc_opt_class();
    +[MBPeerMessenger registerRequestClass:v32 responseClass:objc_opt_class() forTask:@"MBPeerTaskRemove"];
    v50->_unint64_t uploadBatchSize = v48;
    v50->_unint64_t concurrentUploadBatchCount = v49;
    v33 = MBGetDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = objc_opt_class();
      unint64_t uploadBatchSize = v50->_uploadBatchSize;
      unint64_t concurrentUploadBatchCount = v50->_concurrentUploadBatchCount;
      *(_DWORD *)buf = 138544130;
      uint64_t v55 = v34;
      __int16 v56 = 2048;
      unint64_t v57 = uploadBatchSize;
      __int16 v58 = 2048;
      unint64_t v59 = concurrentUploadBatchCount;
      __int16 v60 = 2048;
      unint64_t v61 = a7;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@, uploadBatchSize:%lu, concurrentUploadBatchCount:%lu, concurrentOpenBatchCount:%lu", buf, 0x2Au);
      objc_opt_class();
      _MBLog();
    }

    dispatch_semaphore_t v37 = dispatch_semaphore_create(v50->_concurrentUploadBatchCount);
    batchUploadSemaphore = v50->_batchUploadSemaphore;
    v50->_batchUploadSemaphore = (OS_dispatch_semaphore *)v37;

    dispatch_semaphore_t v39 = dispatch_semaphore_create(v50->_uploadBatchSize * a7);
    openSQLiteFilesSemaphore = v50->_openSQLiteFilesSemaphore;
    v50->_openSQLiteFilesSemaphore = (OS_dispatch_semaphore *)v39;

    uint64_t v41 = +[MBError errorWithCode:202 format:@"Invalidated"];
    invalidationError = v50->_invalidationError;
    v50->_invalidationError = (NSError *)v41;

    if (_os_feature_enabled_impl())
    {
      v43 = NSTemporaryDirectory();
      v44 = [v43 stringByAppendingPathComponent:@"filehashes.db"];

      v45 = [[MBFileHashDB alloc] initWithPath:v44];
      fileHashDB = v50->_fileHashDB;
      v50->_fileHashDB = v45;
    }
    v14 = v51;
    id v12 = v52;
  }

  return v16;
}

- (void)dealloc
{
  v3 = [(MBFileHashDB *)self->_fileHashDB path];
  fileHashDB = self->_fileHashDB;
  id v17 = 0;
  unsigned __int8 v5 = [(MBFileHashDB *)fileHashDB close:&v17];
  id v6 = v17;
  if ((v5 & 1) == 0)
  {
    v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v3;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to close the SQLite DB at %@: %@", buf, 0x16u);
      id v13 = v3;
      id v14 = v6;
      _MBLog();
    }
  }
  if (MBIsInternalInstall())
  {
    v8 = MBGetCacheDir();
    v9 = [v8 stringByAppendingPathComponent:@"filehashes.db"];
    id v16 = v6;
    unsigned __int8 v10 = +[MBSQLiteFileHandle copySQLiteFileAtPath:v3 toPath:v9 error:&v16];
    id v11 = v16;

    if ((v10 & 1) == 0)
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v3;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to copy the SQLite file at %@: %@", buf, 0x16u);
        id v13 = v3;
        id v14 = v11;
        _MBLog();
      }
    }
  }
  else
  {
    id v11 = v6;
  }
  +[MBSQLiteFileHandle removeAllSQLiteFilesAtPath:](MBSQLiteFileHandle, "removeAllSQLiteFilesAtPath:", v3, v13, v14);
  [(MBPeerTransferDrive *)self stopListeningForFileTransfers];

  v15.receiver = self;
  v15.super_class = (Class)MBPeerTransferDrive;
  [(MBPeerTransferDrive *)&v15 dealloc];
}

- (BOOL)invalidated
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)invalidate
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_invalidated, 1u) & 1) == 0)
  {
    unsigned __int8 v2 = MBGetDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v4 = objc_opt_class();
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Invalidated %@", buf, 0xCu);
      objc_opt_class();
      _MBLog();
    }
  }
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  __assert_rtn("-[MBPeerTransferDrive contentsOfDirectoryAtPath:options:error:]", "MBPeerTransferDrive.m", 138, "0 && \"not yet implemented\"");
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __assert_rtn("-[MBPeerTransferDrive copyItemAtPath:toPath:options:error:]", "MBPeerTransferDrive.m", 143, "0 && \"not yet implemented\"");
}

- (BOOL)uploadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v21 = v10;
  id v22 = v11;
  id v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v19 = 0;
  id v20 = 0;
  BOOL v14 = [(MBPeerTransferDrive *)self uploadFilesAtPaths:v13 options:v12 results:&v20 error:&v19];
  id v15 = v20;
  id v16 = v19;

  if (!v14)
  {
    if (!v16) {
      __assert_rtn("-[MBPeerTransferDrive uploadFileAtPath:toPath:options:error:]", "MBPeerTransferDrive.m", 151, "error");
    }
    id v17 = [v15 objectForKeyedSubscript:v10];

    if (!v17) {
      __assert_rtn("-[MBPeerTransferDrive uploadFileAtPath:toPath:options:error:]", "MBPeerTransferDrive.m", 153, "error");
    }
    if (a6)
    {
      id v16 = v17;
      *a6 = v16;
    }
    else
    {
      id v16 = v17;
    }
  }

  return v14;
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_1001BE884;
  uint64_t v32 = sub_1001BE894;
  id v33 = 0;
  uint64_t v22 = 0;
  dispatch_queue_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_1001BE884;
  id v26 = sub_1001BE894;
  id v27 = 0;
  id v12 = [[MBDriveUploadBatch alloc] initWithPaths:v10 size:0 last:1];
  id v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001BE89C;
  v18[3] = &unk_1004159A0;
  id v20 = &v28;
  id v21 = &v22;
  BOOL v14 = v13;
  id v19 = v14;
  [(MBPeerTransferDrive *)self uploadBatch:v12 options:v11 completion:v18];
  MBGroupWaitForever();
  id v15 = (void *)v29[5];
  if (v15 || v23[5])
  {
    if (a5) {
      *a5 = v15;
    }
    BOOL v16 = 0;
    if (a6) {
      *a6 = (id) v23[5];
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

- (void)_uploadBatch:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v74 = a4;
  id v9 = a5;
  if (!v8) {
    __assert_rtn("-[MBPeerTransferDrive _uploadBatch:options:completion:]", "MBPeerTransferDrive.m", 181, "batch");
  }
  v70 = v9;
  if (!v9) {
    __assert_rtn("-[MBPeerTransferDrive _uploadBatch:options:completion:]", "MBPeerTransferDrive.m", 182, "completion");
  }
  id v10 = [(MBPeerTransferDrive *)self fileTransferSession];
  if (!v10) {
    __assert_rtn("-[MBPeerTransferDrive _uploadBatch:options:completion:]", "MBPeerTransferDrive.m", 184, "fileTransferSession");
  }
  id v11 = [v74 objectForKeyedSubscript:@"FileHandleFactory"];
  v77 = [v8 paths];
  id v76 = [v77 count];
  if ((unint64_t)v76 > self->_uploadBatchSize) {
    __assert_rtn("-[MBPeerTransferDrive _uploadBatch:options:completion:]", "MBPeerTransferDrive.m", 188, "pathCount <= _uploadBatchSize");
  }
  id v72 = [v8 index];
  id v12 = (char *)[v8 size];
  unsigned int v13 = [v8 last];
  BOOL v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v106 = v72;
    *(_WORD *)&v106[4] = 2048;
    *(void *)&v106[6] = v76;
    *(_WORD *)&v106[14] = 2048;
    *(void *)&v106[16] = v12;
    *(_WORD *)&v106[24] = 1024;
    *(_DWORD *)&v106[26] = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Preparing batch i:%u, pc:%lu, s:%llu, l:%d", buf, 0x22u);
    v63 = v12;
    uint64_t v64 = v13;
    id v61 = v72;
    id v62 = v76;
    _MBLog();
  }

  dispatch_group_t v15 = dispatch_group_create();
  id v16 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
  id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v76];
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  char v104 = 0;
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_1001BF468;
  v92[3] = &unk_100415A38;
  v92[4] = self;
  id v69 = v16;
  id v93 = v69;
  int v100 = (int)v72;
  id v68 = v11;
  id v94 = v68;
  v99 = &v101;
  id v18 = v8;
  id v95 = v18;
  id v71 = v10;
  id v96 = v71;
  dispatch_group_t group = v15;
  dispatch_group_t v97 = group;
  id v19 = v17;
  id v98 = v19;
  [v77 enumerateKeysAndObjectsUsingBlock:v92];
  [v18 setItems:v19];

  if ((v13 & 1) != 0 || *((unsigned char *)v102 + 24)) {
    unsigned __int8 v20 = 1;
  }
  else {
    unsigned __int8 v20 = [(MBPeerTransferDrive *)self invalidated];
  }
  id v21 = self;
  objc_sync_enter(v21);
  uint64_t v22 = (char *)[(NSMutableArray *)v21->_pendingUploadBatches count];
  unint64_t concurrentUploadBatchCount = v21->_concurrentUploadBatchCount;
  if ((unint64_t)v22 >= concurrentUploadBatchCount) {
    __assert_rtn("-[MBPeerTransferDrive _uploadBatch:options:completion:]", "MBPeerTransferDrive.m", 358, "pendingUploadBatchCount < _concurrentUploadBatchCount");
  }
  unint64_t v24 = (unint64_t)&v12[v21->_pendingUploadSize];
  if (v24 > 0xF423F) {
    char v25 = 1;
  }
  else {
    char v25 = v20;
  }
  if (v25) {
    goto LABEL_19;
  }
  id v26 = v22 + 1;
  unint64_t v27 = concurrentUploadBatchCount / 3;
  if (concurrentUploadBatchCount / 3 <= 1) {
    unint64_t v27 = 1;
  }
  if (v27 <= (unint64_t)v26 && v24 > 0x249EF)
  {
LABEL_19:
    BOOL v28 = 1;
  }
  else
  {
    unint64_t v29 = 2 * concurrentUploadBatchCount / 3;
    if (v29 <= 1) {
      unint64_t v29 = 1;
    }
    unint64_t v30 = v24 >> 5;
    BOOL v28 = v29 <= (unint64_t)v26 && v30 > 0xC34 || concurrentUploadBatchCount <= (unint64_t)v26;
  }
  pendingUploadBatches = v21->_pendingUploadBatches;
  if (!pendingUploadBatches)
  {
    uint64_t v34 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v21->_concurrentUploadBatchCount];
    v35 = v21->_pendingUploadBatches;
    v21->_pendingUploadBatches = v34;

    pendingUploadBatches = v21->_pendingUploadBatches;
  }
  if (![(NSMutableArray *)pendingUploadBatches count] && v21->_pendingUploadSize)
  {
    unint64_t v59 = "_pendingUploadBatches.count || !_pendingUploadSize";
    int v60 = 367;
LABEL_68:
    __assert_rtn("-[MBPeerTransferDrive _uploadBatch:options:completion:]", "MBPeerTransferDrive.m", v60, v59);
  }
  [(NSMutableArray *)v21->_pendingUploadBatches addObject:v18];
  v66 = &v12[v21->_pendingUploadSize];
  v21->_pendingUploadSize = (unint64_t)v66;
  if (v28)
  {
    v36 = v21->_pendingUploadBatches;
    dispatch_semaphore_t v37 = v21->_pendingUploadBatches;
    v21->_pendingUploadBatches = 0;

    v21->_pendingUploadSize = 0;
  }
  else
  {
    v36 = 0;
  }
  if ((unint64_t)[(NSMutableArray *)v21->_pendingUploadBatches count] >= v21->_concurrentUploadBatchCount)
  {
    unint64_t v59 = "_pendingUploadBatches.count < _concurrentUploadBatchCount";
    int v60 = 376;
    goto LABEL_68;
  }
  objc_sync_exit(v21);

  if (v36) {
    char v38 = v28;
  }
  else {
    char v38 = 1;
  }
  if ((v38 & 1) == 0) {
    __assert_rtn("-[MBPeerTransferDrive _uploadBatch:options:completion:]", "MBPeerTransferDrive.m", 378, "flush || !pendingUploadBatches");
  }
  int v39 = dword_100482660;
  int v40 = dword_100482664;
  uint64_t v41 = MBGetDefaultLog();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v106 = v72;
    *(_WORD *)&v106[4] = 1024;
    *(_DWORD *)&v106[6] = v39;
    *(_WORD *)&v106[10] = 1024;
    *(_DWORD *)&v106[12] = v40;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Queued batch i:%u, o:%u(%u)", buf, 0x14u);
    _MBLog();
  }

  if (v28)
  {
    __uint64_t v42 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    dispatch_semaphore_wait((dispatch_semaphore_t)v21->_batchUploadSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    __uint64_t v65 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    id v43 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", self->_uploadBatchSize * (void)-[NSMutableArray count](v36, "count"));
    id v44 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](v36, "count"));
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_1001C0558;
    v88[3] = &unk_100415A60;
    __uint64_t v91 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    id v45 = v43;
    id v89 = v45;
    id v46 = v44;
    id v90 = v46;
    [(NSMutableArray *)v36 enumerateObjectsUsingBlock:v88];
    v47 = [v46 componentsJoinedByString:@","];
    unsigned int add_explicit = atomic_fetch_add_explicit(&dword_100482660, 1u, memory_order_relaxed);
    unsigned int v67 = atomic_fetch_add_explicit(&dword_100482664, [v45 count], memory_order_relaxed);
    if ([(MBPeerTransferDrive *)v21 invalidated])
    {
      unint64_t v48 = MBGetDefaultLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        unint64_t v49 = v48;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          id v50 = [v45 count];
          *(_DWORD *)buf = 134218754;
          *(void *)v106 = v50;
          *(_WORD *)&v106[8] = 2114;
          *(void *)&v106[10] = v47;
          *(_WORD *)&v106[18] = 1024;
          *(_DWORD *)&v106[20] = add_explicit;
          *(_WORD *)&v106[24] = 1024;
          *(_DWORD *)&v106[26] = v67;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Invalidating %lu items for batches i:[%{public}@], o:%u(%u)", buf, 0x22u);
        }

        [v45 count];
        _MBLog();
      }

      v51 = [v71 dispatchQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001C0620;
      block[3] = &unk_1004110B0;
      id v86 = v45;
      v87 = v21;
      dispatch_group_async(group, v51, block);
    }
    else
    {
      id v52 = MBGetDefaultLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v53 = v52;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          id v54 = [v45 count];
          *(_DWORD *)buf = 138544642;
          *(void *)v106 = v47;
          *(_WORD *)&v106[8] = 2048;
          *(void *)&v106[10] = v54;
          *(_WORD *)&v106[18] = 2048;
          *(void *)&v106[20] = v66;
          *(_WORD *)&v106[28] = 2048;
          double v107 = (double)(v65 - v42) / 1000000000.0;
          __int16 v108 = 1024;
          unsigned int v109 = add_explicit;
          __int16 v110 = 1024;
          unsigned int v111 = v67;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Uploading batches i:[%{public}@], c:%lu, s:%llu, tq:%.3f, o:%u(%u)", buf, 0x36u);
        }

        [v45 count];
        _MBLog();
      }

      [v71 addItems:v45];
    }

    v36 = 0;
  }
  uint64_t v55 = dispatch_get_global_queue(17, 0);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1001C06FC;
  v78[3] = &unk_100415AB0;
  BOOL v84 = v28;
  id v79 = v18;
  v80 = v21;
  id v81 = v69;
  id v82 = v70;
  id v83 = v76;
  id v56 = v70;
  id v57 = v69;
  id v58 = v18;
  dispatch_group_notify(group, v55, v78);

  _Block_object_dispose(&v101, 8);
}

- (id)_queueWithBatch:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MBPeerTransferDrive *)self batchQueues];
  unsigned int v6 = [v4 index];

  id v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", v6 % (unint64_t)objc_msgSend(v5, "count"));

  return v7;
}

- (void)uploadBatch:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MBPeerTransferDrive *)self _queueWithBatch:v8];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001C0BCC;
  v15[3] = &unk_100415AD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)finishBatchUploadsWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[MBDriveUploadBatch alloc] initWithPaths:0 size:0 last:1];
  id v9 = [(MBPeerTransferDrive *)self _queueWithBatch:v8];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C0CF4;
  v13[3] = &unk_100415AD8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

- (BOOL)downloadFileAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  if (a6)
  {
    *a6 = +[MBError errorWithCode:4 path:a3 format:@"Download file at path is not implemented"];
  }
  return 0;
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a4;
  __assert_rtn("-[MBPeerTransferDrive downloadFilesAtPaths:options:results:error:]", "MBPeerTransferDrive.m", 471, "0 && \"not yet implemented\"");
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  id v15 = a3;
  id v16 = a4;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  LOBYTE(a6) = [(MBPeerTransferDrive *)self moveItemsAtPaths:v13 options:v10 results:0 error:a6];
  return (char)a6;
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(MBPeerTransferDrive *)self fileTransferSession];
  if (!v12) {
    __assert_rtn("-[MBPeerTransferDrive moveItemsAtPaths:options:results:error:]", "MBPeerTransferDrive.m", 481, "fileTransferSession");
  }
  id v13 = (void *)v12;
  if ([(MBPeerTransferDrive *)self invalidated])
  {
    id v14 = self->_invalidationError;
  }
  else
  {
    id v15 = objc_opt_new();
    [v15 setRelativePaths:v10];
    id v24 = 0;
    id v16 = +[MBPeerMessenger sendRequestSync:v15 session:v13 error:&v24];
    id v14 = (NSError *)v24;

    if (v16)
    {
      BOOL v17 = 1;
      goto LABEL_12;
    }
  }
  if (!v14) {
    __assert_rtn("-[MBPeerTransferDrive moveItemsAtPaths:options:results:error:]", "MBPeerTransferDrive.m", 496, "error");
  }
  if (a5)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001C1140;
    v21[3] = &unk_100415B28;
    id v22 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v10, "count"));
    dispatch_queue_t v23 = v14;
    id v18 = v22;
    [v10 enumerateKeysAndObjectsUsingBlock:v21];
    id v19 = v18;
    *a5 = v19;
  }
  if (a6)
  {
    id v14 = v14;
    BOOL v17 = 0;
    id v16 = 0;
    *a6 = v14;
  }
  else
  {
    BOOL v17 = 0;
    id v16 = 0;
  }
LABEL_12:

  return v17;
}

- (BOOL)removeItemAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSArray arrayWithObjects:&v12 count:1];

  LOBYTE(a5) = -[MBPeerTransferDrive removeItemsAtPaths:options:results:error:](self, "removeItemsAtPaths:options:results:error:", v10, v8, 0, a5, v12);
  return (char)a5;
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(MBPeerTransferDrive *)self fileTransferSession];
  if (!v12) {
    __assert_rtn("-[MBPeerTransferDrive removeItemsAtPaths:options:results:error:]", "MBPeerTransferDrive.m", 519, "fileTransferSession");
  }
  id v13 = (void *)v12;
  if ([(MBPeerTransferDrive *)self invalidated])
  {
    id v14 = self->_invalidationError;
  }
  else
  {
    id v15 = objc_opt_new();
    [v15 setRelativePaths:v10];
    id v24 = 0;
    id v16 = +[MBPeerMessenger sendRequestSync:v15 session:v13 error:&v24];
    id v14 = (NSError *)v24;

    if (v16)
    {
      BOOL v17 = 1;
      goto LABEL_12;
    }
  }
  if (!v14) {
    __assert_rtn("-[MBPeerTransferDrive removeItemsAtPaths:options:results:error:]", "MBPeerTransferDrive.m", 534, "error");
  }
  if (a5)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001C143C;
    v21[3] = &unk_100415B50;
    id v22 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v10, "count"));
    dispatch_queue_t v23 = v14;
    id v18 = v22;
    [v10 enumerateObjectsUsingBlock:v21];
    id v19 = v18;
    *a5 = v19;
  }
  if (a6)
  {
    id v14 = v14;
    BOOL v17 = 0;
    id v16 = 0;
    *a6 = v14;
  }
  else
  {
    BOOL v17 = 0;
    id v16 = 0;
  }
LABEL_12:

  return v17;
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  if (a3) {
    *a3 = self->_freeSpace;
  }
  return 1;
}

- (void)startListeningForFileTransfers
{
  v3 = [(MBPeerTransferDrive *)self fileTransferSession];
  if (!v3) {
    __assert_rtn("-[MBPeerTransferDrive startListeningForFileTransfers]", "MBPeerTransferDrive.m", 566, "fileTransferSession");
  }
  [(MBPeerTransferDrive *)self _resetReceivedFilesProgress];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C172C;
  v10[3] = &unk_100415B78;
  objc_copyWeak(&v11, &location);
  [v3 setReceivedItemHandler:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001C1A24;
  v9[3] = &unk_100415BA0;
  v9[4] = self;
  +[MBPeerMessenger registerRequestHandler:v9 forTask:@"MBPeerTaskMove" session:v3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C1F1C;
  v8[3] = &unk_100415BC8;
  v8[4] = self;
  +[MBPeerMessenger registerRequestHandler:v8 forTask:@"MBPeerTaskRemove" session:v3];
  [v3 activate];
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 selfPublicKey];
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activated the FT session (selfPublicKey: %@)", buf, 0xCu);
    }
    id v7 = [v3 selfPublicKey];
    _MBLog();
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)_handleReceivedItem:(id)a3 metadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5) {
    __assert_rtn("-[MBPeerTransferDrive _handleReceivedItem:metadata:error:]", "MBPeerTransferDrive.m", 662, "errorOut");
  }
  id v10 = v9;
  uint64_t v11 = [v8 itemURL];
  if (!v11) {
    __assert_rtn("-[MBPeerTransferDrive _handleReceivedItem:metadata:error:]", "MBPeerTransferDrive.m", 667, "fromFileURL");
  }
  uint64_t v12 = (void *)v11;
  id v13 = [v10 relativePath];
  if (v13)
  {
    id v14 = [v10 protectionClass];
    id v102 = 0;
    uint64_t v15 = MBProtectionClassSupportedValue((uint64_t)[v14 intValue], 1, &v102);
    id v16 = v102;

    id v94 = v10;
    if (v15 == 255)
    {
      unsigned __int8 v20 = MBGetDefaultLog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v19 = v16;
        goto LABEL_13;
      }
      id v24 = [v12 path];
      *(_DWORD *)buf = 138412546;
      id v104 = v24;
      __int16 v105 = 2112;
      v106 = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "invalid protection class at %@: %@", buf, 0x16u);

      id v22 = [v12 path];
      id v81 = v22;
      BOOL v84 = v16;
      _MBLog();
      id v19 = v16;
    }
    else
    {
      id v17 = v12;
      uint64_t v101 = v16;
      unsigned __int8 v18 = +[MBProtectionClassUtils setWithPathFSR:value:error:](MBProtectionClassUtils, "setWithPathFSR:value:error:", [v17 fileSystemRepresentation], v15, &v101);
      id v19 = v101;

      if (v18) {
        goto LABEL_14;
      }
      unsigned __int8 v20 = MBGetDefaultLog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        id v19 = 0;
LABEL_14:
        dispatch_group_t v97 = v13;
        char v25 = -[MBPeerTransferDrive fullURLForDriveRelativePath:](self, "fullURLForDriveRelativePath:", v13, v81, v84);
        uint64_t v26 = [v25 URLByDeletingLastPathComponent];
        unint64_t v27 = +[NSFileManager defaultManager];
        [v27 createDirectoryAtURL:v26 withIntermediateDirectories:1 attributes:0 error:0];

        id v95 = (void *)v26;
        id v96 = v8;
        if (!self->_fileHashDB) {
          goto LABEL_42;
        }
        uint64_t v28 = [v8 sha256HashData];
        fileHashDB = self->_fileHashDB;
        int v100 = v19;
        unint64_t v30 = [(MBFileHashDB *)fileHashDB filePathForHash:v28 error:&v100];
        __uint64_t v91 = v100;

        id v93 = v28;
        if (v30)
        {
          uint64_t v31 = copyfile_state_alloc();
          id v32 = v30;
          id v33 = (const char *)[v32 fileSystemRepresentation];
          id v34 = v25;
          int v35 = copyfile(v33, (const char *)[v34 fileSystemRepresentation], v31, 0x12C0000u);
          int v36 = *__error();
          copyfile_state_free(v31);
          if (!v35)
          {
            id v52 = MBGetDefaultLog();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              objc_super v53 = [v34 path];
              *(_DWORD *)buf = 138412546;
              id v104 = v32;
              __int16 v105 = 2112;
              v106 = v53;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "Cloned %@ to %@", buf, 0x16u);

              v87 = [v34 path];
              _MBLog();
            }
            id v54 = +[NSFileManager defaultManager];
            v99 = v91;
            unsigned __int8 v55 = [v54 removeItemAtURL:v12 error:&v99];
            id v19 = v99;

            id v10 = v94;
            unint64_t v49 = v95;
            if (v55) {
              goto LABEL_49;
            }
            int v60 = MBGetDefaultLog();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              id v61 = [v12 path];
              *(_DWORD *)buf = 138412546;
              id v104 = v61;
              __int16 v105 = 2112;
              v106 = v19;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Failed to remove received file %@: %@", buf, 0x16u);

              id v82 = [v12 path];
              _MBLog();
            }
LABEL_48:

LABEL_49:
            id v74 = v93;
LABEL_51:

            id v8 = v96;
            v77 = [v96 fileSize];
            [(MBPeerTransferDrive *)self _updateProgressForReceivedItem:v25 size:v77];
            v78 = MBGetDefaultLog();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
            {
              id v79 = [v25 path];
              *(_DWORD *)buf = 138412546;
              id v104 = v79;
              __int16 v105 = 2048;
              v106 = v77;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEBUG, "Downloaded %@ (%llu)", buf, 0x16u);

              id v83 = [v25 path];
              _MBLog();

              id v13 = v97;
            }

            BOOL v23 = 1;
            goto LABEL_54;
          }
          if (v36 == 18)
          {
            dispatch_semaphore_t v37 = MBGetDefaultLog();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              char v38 = [v34 path];
              *(_DWORD *)buf = 138412546;
              id v104 = v32;
              __int16 v105 = 2112;
              v106 = v38;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Failed to clone from %@ to %@. Destination is on a different volume. Will copy instead", buf, 0x16u);

              v85 = [v34 path];
              _MBLog();
            }
            int v39 = copyfile_state_alloc();
            id v89 = v32;
            int v40 = (const char *)[v89 fileSystemRepresentation];
            id v41 = v34;
            LODWORD(v40) = copyfile(v40, (const char *)[v41 fileSystemRepresentation], v39, 0x120000u);
            int v42 = *__error();
            copyfile_state_free(v39);
            id v10 = v94;
            if (v40)
            {
              id v43 = MBGetDefaultLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                id v44 = [v12 path];
                id v45 = [v41 path];
                *(_DWORD *)buf = 138412802;
                id v104 = v44;
                __int16 v105 = 2112;
                v106 = v45;
                __int16 v107 = 1024;
                LODWORD(v108[0]) = v42;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to copy received file from %@ to %@: %{errno}d", buf, 0x1Cu);

                id v46 = [v12 path];
                id v86 = [v41 path];
                _MBLog();
              }
              v47 = [v41 path];
              unint64_t v48 = +[MBError posixErrorWithPath:v47 format:@"Failed to move transferred item into place"];

              id v19 = v48;
              *a5 = v19;

              BOOL v23 = 0;
              id v8 = v96;
              id v13 = v97;
              unint64_t v49 = v95;
LABEL_54:

              goto LABEL_55;
            }
            id v19 = v91;
            id v13 = v97;
            unint64_t v49 = v95;
            goto LABEL_49;
          }
          uint64_t v90 = +[MBError posixErrorWithPath:v32 format:@"copyfile failed"];

          id v56 = MBGetDefaultLog();
          if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            id v10 = v94;
            id v58 = v90;
            goto LABEL_40;
          }
          v92 = [v34 path];
          *(_DWORD *)buf = 138413058;
          id v104 = v32;
          __int16 v105 = 2112;
          v106 = v92;
          __int16 v107 = 1024;
          LODWORD(v108[0]) = v35;
          WORD2(v108[0]) = 1024;
          *(_DWORD *)((char *)v108 + 6) = v36;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "copyfile(%@, %@) failed (%d): %{errno}d", buf, 0x22u);

          id v57 = [v34 path];
          _MBLog();
          id v10 = v94;
          id v58 = v90;
        }
        else
        {
          id v50 = self->_fileHashDB;
          v51 = [v25 path];
          id v98 = 0;
          LOBYTE(v50) = [(MBFileHashDB *)v50 addFilePath:v51 forHash:v28 error:&v98];
          id v32 = v98;

          if (v50)
          {
            id v19 = v91;
LABEL_41:

LABEL_42:
            id v62 = v12;
            v63 = (const std::__fs::filesystem::path *)[v62 fileSystemRepresentation];
            id v64 = v25;
            __uint64_t v65 = (const std::__fs::filesystem::path *)[v64 fileSystemRepresentation];
            rename(v63, v65, v66);
            if (v67)
            {
              id v68 = [v64 path];
              id v69 = +[MBError posixErrorWithPath:v68 format:@"Failed to move transferred item into place"];

              v70 = MBGetDefaultLog();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                id v71 = [v62 path];
                id v72 = [v64 path];
                *(_DWORD *)buf = 138412802;
                id v104 = v71;
                __int16 v105 = 2112;
                v106 = v72;
                __int16 v107 = 2112;
                v108[0] = v69;
                _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Failed to move received file from %@ to %@: %@", buf, 0x20u);

                v73 = [v62 path];
                v88 = [v64 path];
                _MBLog();

                id v13 = v97;
              }

              id v19 = v69;
              BOOL v23 = 0;
              *a5 = v19;
              unint64_t v49 = v95;
              id v8 = v96;
              goto LABEL_54;
            }
            id v74 = MBGetDefaultLog();
            if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            {
              unint64_t v49 = v95;
              goto LABEL_51;
            }
            v75 = [v62 path];
            id v76 = [v64 path];
            *(_DWORD *)buf = 138412546;
            id v104 = v75;
            __int16 v105 = 2112;
            v106 = v76;
            id v93 = v74;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "Moved %@ to %@", buf, 0x16u);

            id v13 = v97;
            id v32 = [v62 path];
            int v60 = [v64 path];
            _MBLog();
            unint64_t v49 = v95;
            goto LABEL_48;
          }
          id v56 = MBGetDefaultLog();
          if (!os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            id v58 = v91;
            goto LABEL_40;
          }
          unint64_t v59 = [v25 path];
          *(_DWORD *)buf = 138412802;
          id v104 = v59;
          __int16 v105 = 2112;
          v106 = v93;
          __int16 v107 = 2112;
          v108[0] = v32;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to add file path for hash %@ %@: %@", buf, 0x20u);

          id v57 = [v25 path];
          _MBLog();
          id v58 = v91;
        }

LABEL_40:
        id v19 = v58;
        goto LABEL_41;
      }
      id v21 = [v17 path];
      *(_DWORD *)buf = 138412546;
      id v104 = v21;
      __int16 v105 = 2112;
      v106 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to set the protection class at %@: %@", buf, 0x16u);

      id v22 = [v17 path];
      id v81 = v22;
      BOOL v84 = v19;
      _MBLog();
    }

    goto LABEL_13;
  }
  +[MBError errorWithCode:1 format:@"nil path"];
  BOOL v23 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:

  return v23;
}

- (BOOL)_handleMoveItem:(id)a3 metadata:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 relativePath];
  uint64_t v11 = [(MBPeerTransferDrive *)self fullURLForDriveRelativePath:v10];

  uint64_t v12 = [v11 URLByDeletingLastPathComponent];
  id v13 = +[NSFileManager defaultManager];
  [v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:0];

  id v14 = [v8 itemURL];
  if (!v14) {
    __assert_rtn("-[MBPeerTransferDrive _handleMoveItem:metadata:error:]", "MBPeerTransferDrive.m", 774, "item.itemURL");
  }

  uint64_t v15 = +[NSFileManager defaultManager];
  id v16 = [v8 itemURL];
  id v35 = 0;
  unsigned __int8 v17 = [v15 moveItemAtURL:v16 toURL:v11 error:&v35];
  id v18 = v35;

  id v19 = MBGetDefaultLog();
  unsigned __int8 v20 = v19;
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v21 = [v8 itemURL];
      id v22 = [v21 path];
      BOOL v23 = [v11 path];
      *(_DWORD *)buf = 138412546;
      dispatch_semaphore_t v37 = v22;
      __int16 v38 = 2112;
      int v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Moved %@ to %@", buf, 0x16u);

      id v24 = [v8 itemURL];
      char v25 = [v24 path];
      id v32 = [v11 path];
      _MBLog();
    }
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [v8 itemURL];
      unint64_t v27 = [v26 path];
      [v11 path];
      v28 = id v34 = a5;
      *(_DWORD *)buf = 138412802;
      dispatch_semaphore_t v37 = v27;
      __int16 v38 = 2112;
      int v39 = v28;
      __int16 v40 = 2112;
      id v41 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to move received file from %@ to %@: %@", buf, 0x20u);

      unint64_t v29 = [v8 itemURL];
      unint64_t v30 = [v29 path];
      id v33 = [v11 path];
      _MBLog();

      a5 = v34;
    }

    if (a5) {
      *a5 = v18;
    }
  }

  return v17;
}

- (void)cleanUpReceivedFilesDirectory
{
  unsigned __int8 v2 = [(MBPeerTransferDrive *)self rootURL];
  v3 = [v2 path];

  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing %@", buf, 0xCu);
      id v16 = v3;
      _MBLog();
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v8 = v7;
    id v9 = +[NSFileManager defaultManager];
    id v18 = 0;
    unsigned __int8 v10 = [v9 removeItemAtPath:v3 error:&v18];
    double v11 = COERCE_DOUBLE(v18);

    if ((v10 & 1) == 0)
    {
      uint64_t v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unsigned __int8 v20 = v3;
        __int16 v21 = 2112;
        double v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
        id v16 = v3;
        double v17 = v11;
        _MBLog();
      }
    }
    +[NSDate timeIntervalSinceReferenceDate];
    double v14 = v13;
    uint64_t v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      unsigned __int8 v20 = v3;
      __int16 v21 = 2048;
      double v22 = v14 - v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removed %@ in %.3fs", buf, 0x16u);
      _MBLog();
    }
  }
}

- (void)_resetReceivedFilesProgress
{
  p_progressLock = &self->_progressLock;
  os_unfair_lock_lock(&self->_progressLock);
  self->_filesReceived = 0;
  self->_bytesReceived = 0;
  self->_filesSent = 0;
  self->_bytesSent = 0;
  os_unfair_lock_unlock(p_progressLock);
}

- (id)fullURLForDriveRelativePath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MBPeerTransferDrive *)self rootURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (void)_updateProgressForReceivedItem:(id)a3 size:(int64_t)a4
{
  id v6 = a3;
  double v7 = v6;
  if ((a4 & 0x8000000000000000) == 0)
  {
LABEL_4:
    os_unfair_lock_lock(&self->_progressLock);
    self->_bytesReceived += a4;
    unint64_t v11 = self->_filesReceived + 1;
    self->_filesReceived = v11;
    unint64_t bytesReceived = self->_bytesReceived;
    os_unfair_lock_unlock(&self->_progressLock);
    uint64_t v13 = [(MBPeerTransferDrive *)self receiveProgressHandler];
    id v10 = (id)v13;
    if (v13)
    {
      double v14 = *(void (**)(uint64_t, unsigned char *))(v13 + 16);
      *(void *)buf = v11;
      *(void *)&buf[8] = bytesReceived;
      *(void *)&buf[16] = 0;
      uint64_t v21 = 0;
      v14(v13, buf);
    }
    goto LABEL_9;
  }
  id v19 = 0;
  id v18 = 0;
  unsigned __int8 v8 = [v6 getResourceValue:&v19 forKey:NSURLFileSizeKey error:&v18];
  id v9 = v19;
  id v10 = v18;
  if (v8)
  {
    a4 = (int64_t)[v9 longLongValue];

    goto LABEL_4;
  }
  uint64_t v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = [v7 path];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to get file size of %@: %@", buf, 0x16u);

    double v17 = [v7 path];
    _MBLog();
  }
LABEL_9:
}

- (void)_updateProgressForSentItem:(id)a3 size:(int64_t)a4
{
  id v6 = a3;
  double v7 = v6;
  if ((a4 & 0x8000000000000000) == 0)
  {
LABEL_4:
    os_unfair_lock_lock(&self->_progressLock);
    self->_bytesSent += a4;
    unint64_t v11 = self->_filesSent + 1;
    self->_filesSent = v11;
    unint64_t bytesSent = self->_bytesSent;
    os_unfair_lock_unlock(&self->_progressLock);
    uint64_t v13 = [(MBPeerTransferDrive *)self sendProgressHandler];
    id v10 = (id)v13;
    if (v13)
    {
      double v14 = *(void (**)(uint64_t, unsigned char *))(v13 + 16);
      *(void *)buf = v11;
      *(void *)&buf[8] = bytesSent;
      *(void *)&buf[16] = 0;
      uint64_t v21 = 0;
      v14(v13, buf);
    }
    goto LABEL_9;
  }
  id v19 = 0;
  id v18 = 0;
  unsigned __int8 v8 = [v6 getResourceValue:&v19 forKey:NSURLFileSizeKey error:&v18];
  id v9 = v19;
  id v10 = v18;
  if (v8)
  {
    a4 = (int64_t)[v9 longLongValue];

    goto LABEL_4;
  }
  uint64_t v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = [v7 path];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to get file size of %@: %@", buf, 0x16u);

    double v17 = [v7 path];
    _MBLog();
  }
LABEL_9:
}

- (unint64_t)freeSpace
{
  return self->_freeSpace;
}

- (void)setFreeSpace:(unint64_t)a3
{
  self->_freeSpace = a3;
}

- (id)sendProgressHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setSendProgressHandler:(id)a3
{
}

- (id)receiveProgressHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setReceiveProgressHandler:(id)a3
{
}

- (RPFileTransferSession)fileTransferSession
{
  return self->_fileTransferSession;
}

- (void)setFileTransferSession:(id)a3
{
}

- (NSURL)rootURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRootURL:(id)a3
{
}

- (unint64_t)uploadBatchSize
{
  return self->_uploadBatchSize;
}

- (void)setUploadBatchSize:(unint64_t)a3
{
  self->_unint64_t uploadBatchSize = a3;
}

- (unint64_t)concurrentUploadBatchCount
{
  return self->_concurrentUploadBatchCount;
}

- (void)setConcurrentUploadBatchCount:(unint64_t)a3
{
  self->_unint64_t concurrentUploadBatchCount = a3;
}

- (NSMutableArray)metadataQueues
{
  return self->_metadataQueues;
}

- (void)setMetadataQueues:(id)a3
{
}

- (NSMutableArray)batchQueues
{
  return self->_batchQueues;
}

- (void)setBatchQueues:(id)a3
{
}

- (OS_dispatch_semaphore)batchUploadSemaphore
{
  return self->_batchUploadSemaphore;
}

- (void)setBatchUploadSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)openSQLiteFilesSemaphore
{
  return self->_openSQLiteFilesSemaphore;
}

- (void)setOpenSQLiteFilesSemaphore:(id)a3
{
}

- (NSError)invalidationError
{
  return self->_invalidationError;
}

- (void)setInvalidationError:(id)a3
{
}

- (unint64_t)pendingUploadSize
{
  return self->_pendingUploadSize;
}

- (void)setPendingUploadSize:(unint64_t)a3
{
  self->_pendingUploadSize = a3;
}

- (NSMutableArray)pendingUploadBatches
{
  return self->_pendingUploadBatches;
}

- (void)setPendingUploadBatches:(id)a3
{
}

- (MBFileHashDB)fileHashDB
{
  return self->_fileHashDB;
}

- (void)setFileHashDB:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHashDB, 0);
  objc_storeStrong((id *)&self->_pendingUploadBatches, 0);
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_openSQLiteFilesSemaphore, 0);
  objc_storeStrong((id *)&self->_batchUploadSemaphore, 0);
  objc_storeStrong((id *)&self->_batchQueues, 0);
  objc_storeStrong((id *)&self->_metadataQueues, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong(&self->_receiveProgressHandler, 0);
  objc_storeStrong(&self->_sendProgressHandler, 0);
}

@end