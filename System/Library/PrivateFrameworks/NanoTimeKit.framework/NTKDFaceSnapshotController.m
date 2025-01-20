@interface NTKDFaceSnapshotController
- (BOOL)_modernSnapshottingEnabledForStore:(id)a3;
- (BOOL)_queue_cleanCache;
- (BOOL)_queue_cleanCacheExcludingKeys:(id)a3;
- (BOOL)_queue_cleanContexts;
- (BOOL)_queue_cleanSnapshotKeysWithBlankComplications;
- (BOOL)_snapshotExistsForKey:(id)a3;
- (NTKDFaceSnapshotController)init;
- (OS_dispatch_queue)queue;
- (id)_currentContext;
- (id)_preferencesKeyForCollectionStore:(id)a3;
- (id)_queue_allSnapshotObjects;
- (id)_queue_snapshotObjectsForFace:(id)a3;
- (id)_queue_snapshotObjectsForFace:(id)a3 complicationTemplateChanged:(BOOL)a4;
- (void)_endSnapshottingActivityDidTakeSnapshot:(BOOL)a3;
- (void)_enumerateAllFacesForDeviceUUID:(id)a3 block:(id)a4;
- (void)_enumerateRemoteComplicationsForFace:(id)a3 block:(id)a4;
- (void)_loadComplicationCollection;
- (void)_notifyFaceSnapshotChangedForKey:(id)a3;
- (void)_onObserverQueue_async:(id)a3;
- (void)_onQueue_async:(id)a3;
- (void)_queue_snapshotFaces:(id)a3 completion:(id)a4;
- (void)_queue_updateAllSnapshots;
- (void)_queue_updateSnapshotForFace:(id)a3 complicationTemplateChanged:(BOOL)a4;
- (void)_queue_updateSnapshotForFace:(id)a3 inStore:(id)a4;
- (void)_queue_updateSnapshots:(id)a3 completion:(id)a4;
- (void)_startSnapshottingActivity;
- (void)_updateSnapshotForFace:(id)a3 inStore:(id)a4;
- (void)_writeImageToDisk:(id)a3 imageName:(id)a4;
- (void)addObserver:(id)a3;
- (void)collectionStore:(id)a3 didAddFace:(id)a4 forUUID:(id)a5 seqId:(id)a6;
- (void)collectionStore:(id)a3 didRemoveFaceOfStyle:(int64_t)a4 forUUID:(id)a5 seqId:(id)a6 acknowledge:(id)a7;
- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withConfiguration:(id)a5 seqId:(id)a6;
- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withResourceDirectory:(id)a5 seqId:(id)a6 acknowledge:(id)a7;
- (void)collectionStore:(id)a3 didUpdateOrderedUUIDs:(id)a4 seqId:(id)a5;
- (void)collectionStore:(id)a3 didUpdateSelectedUUID:(id)a4 seqId:(id)a5;
- (void)collectionStore:(id)a3 didUpgradeFace:(id)a4 forUUID:(id)a5 seqId:(id)a6;
- (void)collectionStore:(id)a3 loadOrderedUUIDs:(id)a4 selectedUUID:(id)a5 facesByUUID:(id)a6 seqId:(id)a7 acknowledge:(id)a8;
- (void)collectionStoreHasBeenCreated:(id)a3;
- (void)collectionStoreWillBePurged:(id)a3;
- (void)complicationCollection:(id)a3 didUpdateSampleTemplateForClient:(id)a4;
- (void)complicationCollectionDidLoad:(id)a3;
- (void)dealloc;
- (void)performAfterCompletingCurrentlyPendingSnapshots:(id)a3;
- (void)provideSnapshotOfFace:(id)a3 options:(id)a4 completion:(id)a5;
- (void)queue_updateAddableAndGallerySnapshotsWithContinuationBlock:(id)a3 finishedBlock:(id)a4;
- (void)removeObserver:(id)a3;
- (void)snapshotFace:(id)a3 options:(id)a4 completion:(id)a5;
- (void)snapshotLibrarySelectedFaceForDeviceUUID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)updateAddableAndGallerySnapshotsWithContinuationBlock:(id)a3 finishedBlock:(id)a4;
- (void)updateAllSnapshots;
- (void)updateSnapshotForFace:(id)a3;
@end

@implementation NTKDFaceSnapshotController

- (NTKDFaceSnapshotController)init
{
  v38.receiver = self;
  v38.super_class = (Class)NTKDFaceSnapshotController;
  v2 = [(NTKDFaceSnapshotController *)&v38 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    xpcSnapshotOperationQueue = v2->_xpcSnapshotOperationQueue;
    v2->_xpcSnapshotOperationQueue = v3;

    [(NSOperationQueue *)v2->_xpcSnapshotOperationQueue setName:@"com.apple.nanotimekitd.snapshot.queue"];
    [(NSOperationQueue *)v2->_xpcSnapshotOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_xpcSnapshotOperationQueue setQualityOfService:17];
    id v5 = +[NSString stringWithFormat:@"com.apple.ntkd.facesnapshotcontroller.%p", v2];
    v6 = (const char *)[v5 UTF8String];
    v7 = dispatch_queue_attr_make_initially_inactive(0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v6, v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    objc_initWeak(&location, v2);
    if ((NTKDebugDaemonRunningSnapshotTestingTool() & 1) != 0 || (NTKDebugSnapshotInNanoTimeKitDaemon() & 1) == 0) {
      unsigned int v11 = 0;
    }
    else {
      unsigned int v11 = 15;
    }
    sub_10000B610(@"delaying-snapshots");
    v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Delaying snapshots for %is", buf, 8u);
    }

    dispatch_time_t v13 = dispatch_time(0, 1000000000 * v11);
    v14 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012BB0;
    block[3] = &unk_100060A68;
    objc_copyWeak(&v36, &location);
    dispatch_after(v13, v14, block);

    v15 = +[NSString stringWithFormat:@"com.apple.ntkd.facesnapshotcontroller.observercallback.%p", v2];

    id v16 = v15;
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    observerCallbackQueue = v2->_observerCallbackQueue;
    v2->_observerCallbackQueue = (OS_dispatch_queue *)v17;

    uint64_t v19 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v19;

    uint64_t v21 = objc_opt_new();
    observersLock = v2->_observersLock;
    v2->_observersLock = (NSRecursiveLock *)v21;

    v23 = +[NTKDCollectionCoordinator sharedInstance];
    [v23 addCollectionLifecycleObserver:v2];

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100012C5C;
    v33[3] = &unk_100060A90;
    v24 = v2;
    v34 = v24;
    [(NTKDFaceSnapshotController *)v24 _onQueue_async:v33];
    dispatch_semaphore_t v25 = dispatch_semaphore_create(4);
    setImageForKeyOperationsCount = v24->_setImageForKeyOperationsCount;
    v24->_setImageForKeyOperationsCount = (OS_dispatch_semaphore *)v25;

    if (NTKDebugSnapshotInNanoTimeKitDaemon())
    {
      v27 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138412546;
        v40 = v29;
        __int16 v41 = 2080;
        v42 = "__PRETTY_FUNCTION__";
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@: %s snapshotInDaemon: YES; creating a snapshottter",
          buf,
          0x16u);
      }
      v30 = (NTKFaceSnapshotter *)objc_alloc_init((Class)NTKFaceSnapshotter);
      snapshotter = v24->_snapshotter;
      v24->_snapshotter = v30;
    }
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_activate((dispatch_object_t)self->_queue);
  v3 = +[NTKDCollectionCoordinator sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000135D8;
  v6[3] = &unk_100061398;
  v6[4] = self;
  [v3 enumerateAllStoresWithHandler:v6];

  [(NTKComplicationCollection *)self->_complicationCollection removeObserver:self];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NTKDFaceSnapshotController;
  [(NTKDFaceSnapshotController *)&v5 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "adding NTKDFaceSnapshotController observer - %@", (uint8_t *)&v6, 0xCu);
  }

  [(NSRecursiveLock *)self->_observersLock lock];
  [(NSHashTable *)self->_observers addObject:v4];
  [(NSRecursiveLock *)self->_observersLock unlock];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_super v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removing NTKDFaceSnapshotController observer - %@", (uint8_t *)&v6, 0xCu);
  }

  [(NSRecursiveLock *)self->_observersLock lock];
  [(NSHashTable *)self->_observers removeObject:v4];
  [(NSRecursiveLock *)self->_observersLock unlock];
}

- (void)updateAllSnapshots
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100013810;
  v2[3] = &unk_100060A90;
  v2[4] = self;
  [(NTKDFaceSnapshotController *)self _onQueue_async:v2];
}

- (void)_queue_updateAllSnapshots
{
  v3 = sub_100009124();

  if (v3)
  {
    self->_needToUpdateSnapshotsForFacesWithThirdPartyComplications = [(NTKComplicationCollection *)self->_complicationCollection hasLoaded] ^ 1;
    [(NTKDFaceSnapshotController *)self _queue_allSnapshotObjects];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001392C;
    v5[3] = &unk_100060AB8;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = self;
    id v4 = v6;
    [(NTKDFaceSnapshotController *)self _queue_updateSnapshots:v4 completion:v5];
  }
  else
  {
    id v4 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Nothing to snapshot. No paired device", buf, 2u);
    }
  }
}

- (void)updateSnapshotForFace:(id)a3
{
}

- (void)snapshotFace:(id)a3 options:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100013B1C;
  v9[3] = &unk_1000613E8;
  id v10 = a5;
  id v8 = v10;
  [(NTKDFaceSnapshotController *)self provideSnapshotOfFace:a3 options:a4 completion:v9];
}

- (void)provideSnapshotOfFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    dispatch_time_t v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412802;
    v58 = v13;
    __int16 v59 = 2080;
    v60 = "-[NTKDFaceSnapshotController provideSnapshotOfFace:options:completion:]";
    __int16 v61 = 2112;
    id v62 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: %s: In here. Face: %@", buf, 0x20u);
  }
  if (v8)
  {
    if (NTKDebugSnapshotInNanoTimeKitDaemon())
    {
      v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        id v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138412546;
        v58 = v16;
        __int16 v59 = 2080;
        v60 = "__PRETTY_FUNCTION__";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: %s snapshotInDaemon: YES", buf, 0x16u);
      }
      [(NTKFaceSnapshotter *)self->_snapshotter provideSnapshotOfFace:v8 options:v9 completion:v10];
LABEL_30:

      goto LABEL_31;
    }
    if (!v10)
    {
      v43 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = (objc_class *)objc_opt_class();
        v45 = NSStringFromClass(v44);
        *(_DWORD *)buf = 138412546;
        v58 = v45;
        __int16 v59 = 2080;
        v60 = "-[NTKDFaceSnapshotController provideSnapshotOfFace:options:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Returning early: No block given for: %@ %s", buf, 0x16u);
      }
      goto LABEL_30;
    }
    id v20 = [v8 copy];

    uint64_t v21 = [v20 resourceDirectory];
    [v20 setResourceDirectoryByTransferringOwnership:v21];

    v22 = [v9 valueForKey:NTKSnapshotPersistableKey];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v22 BOOLValue])
    {
      v23 = NTKCachedSnapshotForFace();
      v24 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_semaphore_t v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138412802;
        v58 = v26;
        __int16 v59 = 2080;
        v60 = "__PRETTY_FUNCTION__";
        __int16 v61 = 2112;
        id v62 = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@: %s wantsToPersistSnapshot: YES, image: %@", buf, 0x20u);
      }
      if (v23)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100014258;
        block[3] = &unk_100060C08;
        id v55 = v23;
        id v56 = v10;
        id v27 = v23;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_26:
        goto LABEL_31;
      }
      char v28 = 1;
    }
    else
    {
      char v28 = 0;
    }
    v29 = [v9 valueForKey:NTKSnapshotPriorityKey];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t v30 = (unint64_t)[v29 unsignedIntegerValue] - 1, v30 <= 2))
    {
      uint64_t v31 = 4 * v30 - 4;
      dispatch_qos_class_t v32 = 4 * v30 + 17;
      int v33 = dword_100059250[v30];
    }
    else
    {
      int v33 = 0;
      dispatch_qos_class_t v32 = QOS_CLASS_UTILITY;
      uint64_t v31 = -4;
    }
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100014270;
    v49[3] = &unk_1000614B0;
    v49[4] = self;
    id v20 = v20;
    id v50 = v20;
    char v53 = v28;
    id v52 = v10;
    id v51 = v9;
    dispatch_block_t v34 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v32, v33, v49);
    v35 = +[NSBlockOperation blockOperationWithBlock:v34];
    [v35 setQueuePriority:v31];
    [(NSOperationQueue *)self->_xpcSnapshotOperationQueue addOperation:v35];
    id v36 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      objc_super v38 = v48 = v29;
      xpcSnapshotOperationQueue = self->_xpcSnapshotOperationQueue;
      v46 = [(NSOperationQueue *)xpcSnapshotOperationQueue progress];
      id v47 = v20;
      id v40 = [v46 completedUnitCount];
      __int16 v41 = [(NSOperationQueue *)self->_xpcSnapshotOperationQueue progress];
      id v42 = [v41 totalUnitCount];
      *(_DWORD *)buf = 138413570;
      __int16 v59 = 2080;
      v58 = v38;
      v60 = "-[NTKDFaceSnapshotController provideSnapshotOfFace:options:completion:]";
      __int16 v61 = 2112;
      id v62 = v35;
      __int16 v63 = 2112;
      v64 = xpcSnapshotOperationQueue;
      __int16 v65 = 2048;
      id v66 = v40;
      id v20 = v47;
      v29 = v48;
      __int16 v67 = 2048;
      id v68 = v42;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@: %s adding the operation %@ to the queue:%@, count: %lld/%lld", buf, 0x3Eu);
    }
    goto LABEL_26;
  }
  dispatch_queue_t v17 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412546;
    v58 = v19;
    __int16 v59 = 2080;
    v60 = "-[NTKDFaceSnapshotController provideSnapshotOfFace:options:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Returning early: Face is nil. %@ %s", buf, 0x16u);
  }
  (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
LABEL_31:
}

- (void)snapshotLibrarySelectedFaceForDeviceUUID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = _NTKLoggingObjectForDomain();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412546;
      v23 = v14;
      __int16 v24 = 2080;
      dispatch_semaphore_t v25 = "-[NTKDFaceSnapshotController snapshotLibrarySelectedFaceForDeviceUUID:options:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Inside: %@ %s", buf, 0x16u);
    }
    v15 = +[NTKDCollectionCoordinator sharedInstance];
    uint64_t v16 = NTKCollectionIdentifierLibraryFaces;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100014FD4;
    v17[3] = &unk_1000614D8;
    id v18 = v8;
    id v21 = v10;
    uint64_t v19 = self;
    id v20 = v9;
    [v15 checkoutStoreForCollectionIdentifier:v16 deviceUUID:v18 withHandler:v17];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000432A0(v12);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)updateAddableAndGallerySnapshotsWithContinuationBlock:(id)a3 finishedBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015228;
  v7[3] = &unk_100061500;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKDFaceSnapshotController *)v8 _onQueue_async:v7];
}

- (void)queue_updateAddableAndGallerySnapshotsWithContinuationBlock:(id)a3 finishedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NTKDCollectionCoordinator sharedInstance];
  id v9 = +[NSMutableArray array];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10001572C;
  v38[3] = &unk_1000610C8;
  id v10 = v8;
  id v39 = v10;
  id v11 = v9;
  id v40 = v11;
  [v10 enumerateAllStoresIncludingUnpaired:0 withHandler:v38];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10001585C;
  v36[3] = &unk_100061528;
  id v12 = v7;
  id v37 = v12;
  dispatch_time_t v13 = objc_retainBlock(v36);
  v14 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Prewarm: %lu stores to enumerate.", (uint8_t *)&buf, 0xCu);
  }

  if ([v11 count])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v46 = 0x3032000000;
    id v47 = sub_1000147A4;
    v48 = sub_1000147B4;
    id v49 = [v11 firstObject];
    [v11 removeObjectAtIndex:0];
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    int v33 = sub_1000147A4;
    dispatch_block_t v34 = sub_1000147B4;
    uint64_t v16 = [*(id *)(*((void *)&buf + 1) + 40) orderedUUIDs];
    id v35 = [v16 mutableCopy];

    dispatch_queue_t v17 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [*(id *)(*((void *)&buf + 1) + 40) collectionIdentifier];
      id v19 = [(id)v31[5] count];
      *(_DWORD *)__int16 v41 = 138412546;
      *(void *)&v41[4] = v18;
      *(_WORD *)&v41[12] = 2048;
      *(void *)&v41[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Prewarm: Store %@ has %lu face UUIDs to enumerate.", v41, 0x16u);
    }
    *(void *)__int16 v41 = 0;
    *(void *)&v41[8] = v41;
    *(void *)&v41[16] = 0x3032000000;
    id v42 = sub_100015874;
    v43 = sub_1000158A0;
    id v44 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000158A8;
    v22[3] = &unk_1000615A0;
    v22[4] = self;
    id v25 = v6;
    p_long long buf = &buf;
    id v23 = v10;
    v26 = v13;
    char v28 = v41;
    v29 = &v30;
    id v24 = v11;
    id v20 = objc_retainBlock(v22);
    id v21 = *(void **)(*(void *)&v41[8] + 40);
    *(void *)(*(void *)&v41[8] + 40) = v20;

    (*(void (**)(void))(*(void *)(*(void *)&v41[8] + 40) + 16))();
    _Block_object_dispose(v41, 8);

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    ((void (*)(void *, uint64_t))v13[2])(v13, 1);
  }
}

- (void)performAfterCompletingCurrentlyPendingSnapshots:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000160D4;
  v5[3] = &unk_100060B30;
  id v6 = a3;
  id v4 = v6;
  [(NTKDFaceSnapshotController *)self _onQueue_async:v5];
}

- (void)_notifyFaceSnapshotChangedForKey:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notify face snapshot changed for key:%@", buf, 0xCu);
  }

  [(NSRecursiveLock *)self->_observersLock lock];
  id v6 = [(NSHashTable *)self->_observers allObjects];
  [(NSRecursiveLock *)self->_observersLock unlock];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v11);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100016360;
        v13[3] = &unk_100060AB8;
        v13[4] = v12;
        id v14 = v4;
        [(NTKDFaceSnapshotController *)self _onObserverQueue_async:v13];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)collectionStoreHasBeenCreated:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "collection store has been created", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001645C;
  v7[3] = &unk_100060AB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NTKDFaceSnapshotController *)self _onQueue_async:v7];
}

- (void)collectionStoreWillBePurged:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "collection store will be purged", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000165B4;
  v7[3] = &unk_100060AB8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(NTKDFaceSnapshotController *)self _onQueue_async:v7];
}

- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withConfiguration:(id)a5 seqId:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  CFStringRef v12 = [(NTKDFaceSnapshotController *)self _preferencesKeyForCollectionStore:v9];
  CFPreferencesSetAppValue(v12, v10, NTKDaemonPreferencesDomain);

  dispatch_time_t v13 = [v9 faceForUUID:v11];

  id v14 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    long long v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating snapshot due to face configuration change for face %@", (uint8_t *)&v15, 0xCu);
  }

  [(NTKDFaceSnapshotController *)self _updateSnapshotForFace:v13 inStore:v9];
}

- (void)collectionStore:(id)a3 didUpdateFaceForUUID:(id)a4 withResourceDirectory:(id)a5 seqId:(id)a6 acknowledge:(id)a7
{
  id v11 = a3;
  CFStringRef v12 = (void (**)(void))a7;
  id v13 = a6;
  id v14 = a4;
  CFStringRef v15 = [(NTKDFaceSnapshotController *)self _preferencesKeyForCollectionStore:v11];
  CFPreferencesSetAppValue(v15, v13, NTKDaemonPreferencesDomain);

  v12[2](v12);
  long long v16 = [v11 faceForUUID:v14];

  long long v17 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Updating snapshot due to face resource directory change for face %@", (uint8_t *)&v18, 0xCu);
  }

  [(NTKDFaceSnapshotController *)self _updateSnapshotForFace:v16 inStore:v11];
}

- (void)collectionStore:(id)a3 didAddFace:(id)a4 forUUID:(id)a5 seqId:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  CFStringRef v12 = [(NTKDFaceSnapshotController *)self _preferencesKeyForCollectionStore:v11];
  CFPreferencesSetAppValue(v12, v10, NTKDaemonPreferencesDomain);

  id v13 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating snapshot due to face added for face %@", (uint8_t *)&v14, 0xCu);
  }

  [(NTKDFaceSnapshotController *)self _updateSnapshotForFace:v9 inStore:v11];
}

- (void)collectionStore:(id)a3 loadOrderedUUIDs:(id)a4 selectedUUID:(id)a5 facesByUUID:(id)a6 seqId:(id)a7 acknowledge:(id)a8
{
  id v12 = a3;
  id v13 = a6;
  int v14 = (void (**)(void))a8;
  id v15 = a7;
  CFStringRef v16 = [(NTKDFaceSnapshotController *)self _preferencesKeyForCollectionStore:v12];
  CFPreferencesSetAppValue(v16, v15, NTKDaemonPreferencesDomain);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100016A78;
  v19[3] = &unk_100060C58;
  id v20 = v13;
  id v21 = self;
  id v22 = v12;
  id v17 = v12;
  id v18 = v13;
  [(NTKDFaceSnapshotController *)self _onQueue_async:v19];
  v14[2](v14);
}

- (void)collectionStore:(id)a3 didUpdateSelectedUUID:(id)a4 seqId:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  CFStringRef v11 = [(NTKDFaceSnapshotController *)self _preferencesKeyForCollectionStore:v8];
  CFPreferencesSetAppValue(v11, v9, NTKDaemonPreferencesDomain);

  id v12 = [v8 faceForUUID:v10];

  id v13 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating snapshot due to updating selected UUID for face %@", (uint8_t *)&v14, 0xCu);
  }

  [(NTKDFaceSnapshotController *)self _updateSnapshotForFace:v12 inStore:v8];
}

- (void)collectionStore:(id)a3 didUpdateOrderedUUIDs:(id)a4 seqId:(id)a5
{
  id value = a5;
  CFStringRef v7 = [(NTKDFaceSnapshotController *)self _preferencesKeyForCollectionStore:a3];
  CFPreferencesSetAppValue(v7, value, NTKDaemonPreferencesDomain);
}

- (void)collectionStore:(id)a3 didRemoveFaceOfStyle:(int64_t)a4 forUUID:(id)a5 seqId:(id)a6 acknowledge:(id)a7
{
  id v12 = (void (**)(void))a7;
  id v10 = a6;
  CFStringRef v11 = [(NTKDFaceSnapshotController *)self _preferencesKeyForCollectionStore:a3];
  CFPreferencesSetAppValue(v11, v10, NTKDaemonPreferencesDomain);

  v12[2]();
}

- (void)collectionStore:(id)a3 didUpgradeFace:(id)a4 forUUID:(id)a5 seqId:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  CFStringRef v12 = [(NTKDFaceSnapshotController *)self _preferencesKeyForCollectionStore:v11];
  CFPreferencesSetAppValue(v12, v10, NTKDaemonPreferencesDomain);

  id v13 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating snapshot due to upgrade for face %@", (uint8_t *)&v14, 0xCu);
  }

  [(NTKDFaceSnapshotController *)self _updateSnapshotForFace:v9 inStore:v11];
}

- (BOOL)_modernSnapshottingEnabledForStore:(id)a3
{
  return 0;
}

- (void)complicationCollection:(id)a3 didUpdateSampleTemplateForClient:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016F70;
  v7[3] = &unk_100060C58;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKDFaceSnapshotController *)v8 _onQueue_async:v7];
}

- (void)complicationCollectionDidLoad:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100017260;
  v3[3] = &unk_100060A90;
  v3[4] = self;
  [(NTKDFaceSnapshotController *)self _onQueue_async:v3];
}

- (id)_queue_allSnapshotObjects
{
  v3 = objc_opt_new();
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  id v47 = sub_1000147A4;
  v48 = sub_1000147B4;
  id v49 = 0;
  id v4 = sub_1000090CC();
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  CFStringRef v7 = +[NTKDCollectionCoordinator sharedInstance];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100017988;
  v39[3] = &unk_100061668;
  id v8 = v4;
  id v40 = v8;
  v43 = &v44;
  id v27 = v5;
  id v41 = v27;
  id v9 = v6;
  id v42 = v9;
  [v7 enumerateAllStoresWithHandler:v39];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100017C08;
  v37[3] = &unk_100061690;
  v37[4] = self;
  id v10 = v3;
  id v38 = v10;
  id v11 = objc_retainBlock(v37);
  CFStringRef v12 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating snapshots for library on active gizmo", buf, 2u);
  }

  ((void (*)(void *, uint64_t))v11[2])(v11, v45[5]);
  id v13 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating snapshots for libraries on other gizmos", buf, 2u);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v14 = [v27 allValues];
  id v15 = [v14 countByEnumeratingWithState:&v32 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v33;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v14);
        }
        ((void (*)(void *, void))v11[2])(v11, *(void *)(*((void *)&v32 + 1) + 8 * i));
      }
      id v15 = [v14 countByEnumeratingWithState:&v32 objects:v51 count:16];
    }
    while (v15);
  }

  id v18 = [v9 objectForKeyedSubscript:v8];
  [v9 setObject:0 forKeyedSubscript:v8];
  id v19 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating snapshots for other collections on active gizmo", buf, 2u);
  }

  ((void (*)(void *, void *))v11[2])(v11, v18);
  id v20 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Updating snapshots for other collections on other gizmos", buf, 2u);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v21 = [v9 allValues];
  id v22 = [v21 countByEnumeratingWithState:&v28 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v29;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v21);
        }
        ((void (*)(void *, void))v11[2])(v11, *(void *)(*((void *)&v28 + 1) + 8 * (void)j));
      }
      id v22 = [v21 countByEnumeratingWithState:&v28 objects:v50 count:16];
    }
    while (v22);
  }

  id v25 = v10;
  _Block_object_dispose(&v44, 8);

  return v25;
}

- (id)_queue_snapshotObjectsForFace:(id)a3
{
  return [(NTKDFaceSnapshotController *)self _queue_snapshotObjectsForFace:a3 complicationTemplateChanged:0];
}

- (id)_queue_snapshotObjectsForFace:(id)a3 complicationTemplateChanged:(BOOL)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v8 = &__NSArray0__struct;
    goto LABEL_22;
  }
  CFStringRef v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Maybe need updated snapshot for face %@", buf, 0xCu);
  }

  id v8 = +[NSMutableArray array];
  uint64_t v9 = [v6 dailySnapshotKey];
  id v10 = [v6 unadornedSnapshotKey];
  uint64_t v11 = [(NSMutableDictionary *)self->_snapshotContexts objectForKey:v9];
  CFStringRef v12 = [(NTKDFaceSnapshotController *)self _currentContext];
  long long v28 = (void *)v11;
  if (NTKDebugDisableSnapshotting())
  {
    uint64_t v13 = 0;
    unsigned int v29 = 0;
  }
  else if (!a4 {
         && v11
  }
         && [(NTKDFaceSnapshotController *)self _snapshotExistsForKey:v9]
         && ![v6 snapshotContext:v11 isStaleRelativeToContext:v12])
  {
    uint64_t v13 = (uint64_t)[(NSMutableArray *)self->_snapshotKeysWithBlankComplications containsObject:v9];
    unsigned int v29 = [v6 wantsUnadornedSnapshot];
    if (v29 && (v13 & 1) == 0)
    {
      uint64_t v13 = 0;
      unsigned int v29 = ![(NTKDFaceSnapshotController *)self _snapshotExistsForKey:v10];
    }
  }
  else
  {
    unsigned int v29 = objc_msgSend(v6, "wantsUnadornedSnapshot", v11);
    uint64_t v13 = 1;
  }
  int v14 = objc_opt_new();
  [v14 setFace:v6];
  uint64_t v15 = NTKSnapshotUIOnlyKey;
  uint64_t v32 = NTKSnapshotUIOnlyKey;
  long long v33 = &__kCFBooleanTrue;
  uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  [v14 setOptions:v16];

  id v17 = (void *)v9;
  [v14 setKey:v9];
  [v14 setContext:v12];
  [v14 setSnapshotStale:v13];
  id v18 = v8;
  [v8 addObject:v14];
  if ([v6 wantsUnadornedSnapshot])
  {
    id v19 = v17;
    id v20 = objc_opt_new();

    [v20 setFace:v6];
    v30[0] = v15;
    v30[1] = NTKSnapshotUnadornedContentKey;
    v31[0] = &__kCFBooleanTrue;
    v31[1] = &__kCFBooleanTrue;
    id v21 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    [v20 setOptions:v21];

    [v20 setKey:v10];
    [v20 setContext:v12];
    char v22 = v29;
    [v20 setSnapshotStale:v29];
    [v18 addObject:v20];
    int v14 = v20;
    id v17 = v19;
    id v8 = v18;
  }
  else
  {
    char v22 = v29;
  }
  char v23 = v13 | v22;
  id v24 = _NTKLoggingObjectForDomain();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v25)
    {
      *(_WORD *)long long buf = 0;
      v26 = "Update needed!";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
    }
  }
  else if (v25)
  {
    *(_WORD *)long long buf = 0;
    v26 = "No update needed.";
    goto LABEL_20;
  }

LABEL_22:

  return v8;
}

- (BOOL)_queue_cleanContexts
{
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Persisting snapshot contexts", v7, 2u);
  }

  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:self->_snapshotContexts requiringSecureCoding:1 error:0];
  id v5 = sub_1000181E0();
  [v4 writeToFile:v5 atomically:1];

  return 1;
}

- (BOOL)_queue_cleanSnapshotKeysWithBlankComplications
{
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Persisting snapshot keys with blank complications", v7, 2u);
  }

  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:self->_snapshotKeysWithBlankComplications requiringSecureCoding:1 error:0];
  id v5 = sub_1000182F4();
  [v4 writeToFile:v5 atomically:1];

  return 1;
}

- (BOOL)_queue_cleanCache
{
  v3 = objc_opt_new();
  id v4 = +[NTKDCollectionCoordinator sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001841C;
  v7[3] = &unk_100061398;
  id v8 = v3;
  id v5 = v3;
  [v4 enumerateAllStoresWithHandler:v7];

  LOBYTE(self) = [(NTKDFaceSnapshotController *)self _queue_cleanCacheExcludingKeys:v5];
  return (char)self;
}

- (BOOL)_queue_cleanCacheExcludingKeys:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleaning snapshot cache", buf, 2u);
  }

  id v6 = NTKSnapshotMappedImageCache();
  CFStringRef v7 = [v6 allKeys];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100018740;
  v15[3] = &unk_1000616B8;
  id v8 = v4;
  id v16 = v8;
  [v7 enumerateObjectsUsingBlock:v15];

  uint64_t v9 = [(NSMutableDictionary *)self->_snapshotContexts allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000188C4;
  v12[3] = &unk_1000616E0;
  id v13 = v8;
  int v14 = self;
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:v12];

  sub_10000A838(@"CleanSnapshotCache");
  return 1;
}

- (id)_currentContext
{
  return +[NTKFaceSnapshotContext currentContext];
}

- (void)_onQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.facesnapshotcontroller.asyncwork");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000189E4;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_onObserverQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.facesnapshotcontroller.asyncobservercallback");
  observerCallbackQueue = self->_observerCallbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018AC8;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerCallbackQueue, block);
}

- (BOOL)_snapshotExistsForKey:(id)a3
{
  id v3 = a3;
  id v4 = NTKSnapshotMappedImageCache();
  id v5 = [v4 allKeys];
  unsigned __int8 v6 = [v5 containsObject:v3];

  return v6;
}

- (void)_loadComplicationCollection
{
  [(NTKComplicationCollection *)self->_complicationCollection removeObserver:self];
  id v3 = sub_100009124();
  id v4 = +[CLKDevice deviceForNRDevice:v3];
  id v5 = +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:v4];
  complicationCollection = self->_complicationCollection;
  self->_complicationCollection = v5;

  CFStringRef v7 = self->_complicationCollection;

  [(NTKComplicationCollection *)v7 addObserver:self];
}

- (void)_enumerateAllFacesForDeviceUUID:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFStringRef v7 = +[NTKDCollectionCoordinator sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018CD8;
  v10[3] = &unk_100060C30;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 enumerateAllStoresWithHandler:v10];
}

- (void)_enumerateRemoteComplicationsForFace:(id)a3 block:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018ED8;
  v7[3] = &unk_100061708;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  [v6 enumerateComplicationSlotsWithBlock:v7];
}

- (void)_updateSnapshotForFace:(id)a3 inStore:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019018;
  v7[3] = &unk_100060C58;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKDFaceSnapshotController *)v8 _onQueue_async:v7];
}

- (void)_queue_updateSnapshotForFace:(id)a3 inStore:(id)a4
{
  id v9 = a3;
  if ([(NTKDFaceSnapshotController *)self _modernSnapshottingEnabledForStore:a4])
  {
    id v6 = +[NTKFaceSnapshotter defaultModernSnapshotOptions];
    id v7 = [v6 mutableCopy];

    [v7 setValue:&off_100064040 forKey:NTKSnapshotPriorityKey];
    id v8 = [v7 copy];
    [(NTKDFaceSnapshotController *)self provideSnapshotOfFace:v9 options:v8 completion:&stru_100061748];
  }
  else
  {
    [(NTKDFaceSnapshotController *)self _queue_updateSnapshotForFace:v9 complicationTemplateChanged:0];
  }
}

- (void)_queue_updateSnapshotForFace:(id)a3 complicationTemplateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = sub_100009124();

  if (v7)
  {
    id v8 = [(NTKDFaceSnapshotController *)self _queue_snapshotObjectsForFace:v6 complicationTemplateChanged:v4];
    [(NTKDFaceSnapshotController *)self _queue_updateSnapshots:v8 completion:0];
  }
  else
  {
    id v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_queue_updateSnapshotForFace:complicationTemplateChanged: no active device so we are not taking snapshots.", v10, 2u);
    }
  }
}

- (void)_queue_updateSnapshots:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 indexesOfObjectsPassingTest:&stru_100061788];
  id v9 = [v7 objectsAtIndexes:v8];

  if (![(NSArray *)self->_currentSnapshots count])
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000195C4;
    v37[3] = &unk_1000617B0;
    v37[4] = self;
    id v38 = v6;
    id v24 = objc_retainBlock(v37);
    [(NTKDFaceSnapshotController *)self _startSnapshottingActivity];
    objc_storeStrong((id *)&self->_currentSnapshots, v9);
    if ([v9 count])
    {
      BOOL v25 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [v9 count];
        *(_DWORD *)long long buf = 134217984;
        id v44 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "taking snapshots for %lu faces", buf, 0xCu);
      }

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000199A0;
      v35[3] = &unk_1000617B0;
      v35[4] = self;
      id v36 = v24;
      [(NTKDFaceSnapshotController *)self _queue_snapshotFaces:v9 completion:v35];
    }
    else
    {
      ((void (*)(void *, void))v24[2])(v24, 0);
    }

    goto LABEL_35;
  }
  if (![v9 count])
  {
    if (self->_currentSnapshotCompletions) {
      goto LABEL_35;
    }
    id v27 = (NSMutableArray *)objc_opt_new();
    currentSnapshotCompletions = self->_currentSnapshotCompletions;
    self->_currentSnapshotCompletions = v27;

    if (!v6) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  long long v34 = v8;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (!v11)
  {

    goto LABEL_35;
  }
  id v12 = v11;
  uint64_t v32 = v9;
  id v33 = v6;
  char v13 = 0;
  char v14 = 0;
  uint64_t v15 = *(void *)v40;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v40 != v15) {
        objc_enumerationMutation(v10);
      }
      uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      if ([(NSArray *)self->_currentSnapshots containsObject:v17])
      {
        char v13 = 1;
      }
      else
      {
        pendingSnapshots = self->_pendingSnapshots;
        if (!pendingSnapshots)
        {
          id v19 = (NSMutableArray *)objc_opt_new();
          id v20 = self->_pendingSnapshots;
          self->_pendingSnapshots = v19;

          pendingSnapshots = self->_pendingSnapshots;
        }
        if (([(NSMutableArray *)pendingSnapshots containsObject:v17] & 1) == 0)
        {
          [(NSMutableArray *)self->_pendingSnapshots addObject:v17];
          char v14 = 1;
        }
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v39 objects:v45 count:16];
  }
  while (v12);

  id v9 = v32;
  id v6 = v33;
  id v8 = v34;
  if (v33)
  {
    if (v14)
    {
      if (!self->_pendingSnapshotCompletions)
      {
        id v21 = (NSMutableArray *)objc_opt_new();
        pendingSnapshotCompletions = self->_pendingSnapshotCompletions;
        self->_pendingSnapshotCompletions = v21;

        char v23 = self->_pendingSnapshotCompletions;
LABEL_34:
        id v31 = objc_retainBlock(v6);
        [(NSMutableArray *)v23 addObject:v31];

        goto LABEL_35;
      }
      goto LABEL_35;
    }
    if ((v13 & 1) == 0 || self->_currentSnapshotCompletions) {
      goto LABEL_35;
    }
    unsigned int v29 = (NSMutableArray *)objc_opt_new();
    long long v30 = self->_currentSnapshotCompletions;
    self->_currentSnapshotCompletions = v29;

LABEL_33:
    char v23 = self->_currentSnapshotCompletions;
    goto LABEL_34;
  }
LABEL_35:
}

- (void)_queue_snapshotFaces:(id)a3 completion:(id)a4
{
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100019C08;
  v27[3] = &unk_100061208;
  id v28 = a3;
  unsigned int v29 = self;
  id v30 = a4;
  id v6 = v30;
  id v7 = v28;
  id v8 = objc_retainBlock(v27);
  id v9 = [v7 firstObject];
  id v10 = objc_alloc((Class)NTKJetsamInfoInterval);
  id v11 = [v9 face];
  id v12 = (objc_class *)objc_opt_class();
  char v13 = NSStringFromClass(v12);
  id v14 = [v10 initWithLabel:v13];

  uint64_t v15 = [v9 key];
  id v16 = [v9 face];
  uint64_t v17 = [v9 options];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100019CB4;
  v22[3] = &unk_100061848;
  v22[4] = self;
  id v23 = v15;
  id v24 = v14;
  id v25 = v9;
  id v26 = v8;
  id v18 = v8;
  id v19 = v9;
  id v20 = v14;
  id v21 = v15;
  [(NTKDFaceSnapshotController *)self provideSnapshotOfFace:v16 options:v17 completion:v22];
}

- (void)_startSnapshottingActivity
{
  v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "starting snapshotting activity", v4, 2u);
  }

  id v3 = +[NTKDActivityTracker sharedInstance];
  [v3 beginActivity:@"snapshotting-session-activity"];

  CFPreferencesSetAppValue(@"NTKFaceSnapshotsAreDirtyKey", kCFBooleanTrue, NTKDaemonPreferencesDomain);
}

- (void)_endSnapshottingActivityDidTakeSnapshot:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ending snapshotting activity", buf, 2u);
  }

  CFPreferencesSetAppValue(@"NTKFaceSnapshotsAreDirtyKey", kCFBooleanFalse, NTKDaemonPreferencesDomain);
  id v5 = +[NTKDActivityTracker sharedInstance];
  [v5 endActivity:@"snapshotting-session-activity"];

  id v6 = _NTKLoggingObjectForDomain();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting daemon to exit when clean", v9, 2u);
    }

    xpc_transaction_exit_clean();
  }
  else
  {
    if (v7)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No snapshots taken. Not setting daemon to exit when clean", v8, 2u);
    }
  }
}

- (id)_preferencesKeyForCollectionStore:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 collectionIdentifier];
  id v5 = [v3 deviceUUID];

  id v6 = [v5 UUIDString];
  BOOL v7 = +[NSString stringWithFormat:@"%@%@%@", v4, v6, @"SnapshotSequenceIdKey"];

  return v7;
}

- (void)_writeImageToDisk:(id)a3 imageName:(id)a4
{
  id v5 = a4;
  id v6 = (UIImage *)a3;
  NSTemporaryDirectory();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v7 = [v10 stringByAppendingPathComponent:v5];

  id v8 = [v7 stringByAppendingPathExtension:@"png"];

  id v9 = UIImagePNGRepresentation(v6);

  [v9 writeToFile:v8 options:1 error:0];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcSnapshotOperationQueue, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotCompletions, 0);
  objc_storeStrong((id *)&self->_pendingSnapshots, 0);
  objc_storeStrong((id *)&self->_currentSnapshotCompletions, 0);
  objc_storeStrong((id *)&self->_currentSnapshots, 0);
  objc_storeStrong((id *)&self->_setImageForKeyOperationsCount, 0);
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_complicationCollection, 0);
  objc_storeStrong((id *)&self->_snapshotContexts, 0);
  objc_storeStrong((id *)&self->_snapshotKeysWithBlankComplications, 0);

  objc_storeStrong((id *)&self->_observerCallbackQueue, 0);
}

@end