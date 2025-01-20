@interface NTKDCollectionStore
+ (id)_sharedCollectionStoreObserverQueue;
+ (id)_sharedCollectionStoreQueue;
+ (void)cleanupOrphanedStoresWithCurrentDeviceUUIDs:(id)a3;
+ (void)enumerateStoreIdentifiersWithBlock:(id)a3;
- (BOOL)_queue_addFace:(id)a3 forUUID:(id)a4;
- (BOOL)_queue_isEmpty;
- (BOOL)_queue_isEmptyExceptForUUID:(id)a3;
- (BOOL)_queue_setOrderedUUIDs:(id)a3;
- (BOOL)_queue_setSelectedUUID:(id)a3;
- (BOOL)isBuildVersionOutdated;
- (BOOL)isEmpty;
- (BOOL)isInitialSetupComplete;
- (BOOL)isStoreVersionPreGrace;
- (BOOL)refusesToDeleteLastFace;
- (NSString)collectionIdentifier;
- (NSUUID)deviceUUID;
- (NTKDCollectionStore)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4;
- (float)version;
- (id)_deviceBuildVersion;
- (id)_queue_computeValidationHash;
- (id)_queue_copyAllFacesByUUID;
- (id)_queue_faceForUUID:(id)a3;
- (id)_storeBuildVersion;
- (id)description;
- (id)faceForMigrationForUUID:(id)a3;
- (id)faceForUUID:(id)a3;
- (id)orderedUUIDs;
- (id)selectedUUID;
- (int64_t)faceStyleForUUID:(id)a3;
- (void)_addFace:(id)a3 forUUID:(id)a4 skipSyncObserver:(BOOL)a5;
- (void)_onObserverQueue_async:(id)a3;
- (void)_onQueue_async:(id)a3;
- (void)_queue_clearRemovalsThroughSeqId:(id)a3;
- (void)_queue_incrementSeqId;
- (void)_queue_loadFullCollectionForObserver:(id)a3 completion:(id)a4;
- (void)_queue_notifyDidAddFace:(id)a3 forUUID:(id)a4 skipSyncObserver:(BOOL)a5;
- (void)_queue_notifyDidRemoveFaceOfStyle:(int64_t)a3 forUUID:(id)a4 skipSyncObserver:(BOOL)a5 completion:(id)a6;
- (void)_queue_notifyDidUpdateFaceForUUID:(id)a3 withConfiguration:(id)a4 skipSyncObserver:(BOOL)a5;
- (void)_queue_notifyDidUpdateFaceForUUID:(id)a3 withResourceDirectory:(id)a4 skipSyncObserver:(BOOL)a5 completion:(id)a6;
- (void)_queue_notifyDidUpdateOrderedUUIDs:(id)a3 skipSyncObserver:(BOOL)a4;
- (void)_queue_notifyDidUpdateSelectedUUID:(id)a3 skipSyncObserver:(BOOL)a4 suppressingCallbackToObserver:(id)a5;
- (void)_queue_notifyDidUpgradeFace:(id)a3 forUUID:(id)a4 skipSyncObserver:(BOOL)a5;
- (void)_queue_playbackChangesForObserver:(id)a3 fromSeqId:(id)a4;
- (void)_queue_reloadFullCollectionForObserver:(id)a3 completion:(id)a4;
- (void)_removeFaceForUUID:(id)a3 skipSyncObserver:(BOOL)a4;
- (void)_resetWithFaces:(id)a3 orderedUUIDs:(id)a4 selectedUUID:(id)a5;
- (void)_setOrderedUUIDs:(id)a3 skipSyncObserver:(BOOL)a4;
- (void)_setSelectedUUID:(id)a3 skipSyncObserver:(BOOL)a4;
- (void)_setSelectedUUID:(id)a3 skipSyncObserver:(BOOL)a4 suppressingCallbackToObserver:(id)a5;
- (void)_updateFaceForUUID:(id)a3 withConfiguration:(id)a4 skipSyncObserver:(BOOL)a5;
- (void)_updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4 skipSyncObserver:(BOOL)a5;
- (void)_upgradeFace:(id)a3 forUUID:(id)a4 skipSyncObserver:(BOOL)a5;
- (void)addFace:(id)a3 forUUID:(id)a4;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 withSeqId:(id)a4;
- (void)clearSyncObserver;
- (void)flushAndComputeValidationHashWithObserverCallback:(id)a3;
- (void)flushWithObserverCallback:(id)a3;
- (void)markInitialSetupComplete;
- (void)persistCurrentBuildVersion;
- (void)removeFaceForUUID:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeUnusedResourceDirectories;
- (void)setOrderedUUIDs:(id)a3;
- (void)setRefusesToDeleteLastFace:(BOOL)a3;
- (void)setSelectedUUID:(id)a3;
- (void)setSelectedUUID:(id)a3 suppressingCallbackToObserver:(id)a4;
- (void)setSyncObserver:(id)a3 withSeqId:(id)a4;
- (void)setVersion:(float)a3;
- (void)swapInTheseFaces:(id)a3;
- (void)synchronize;
- (void)updateFaceForUUID:(id)a3 withConfiguration:(id)a4;
- (void)updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4;
- (void)upgradeFace:(id)a3 forUUID:(id)a4;
- (void)withoutNotifyingSyncObserverAddFace:(id)a3 forUUID:(id)a4;
- (void)withoutNotifyingSyncObserverRemoveFaceForUUID:(id)a3;
- (void)withoutNotifyingSyncObserverResetWithFaces:(id)a3 orderedUUIDs:(id)a4 selectedUUID:(id)a5;
- (void)withoutNotifyingSyncObserverSetOrderedUUIDs:(id)a3;
- (void)withoutNotifyingSyncObserverSetSelectedUUID:(id)a3;
- (void)withoutNotifyingSyncObserverUpdateFaceForUUID:(id)a3 withConfiguration:(id)a4;
- (void)withoutNotifyingSyncObserverUpdateFaceForUUID:(id)a3 withResourceDirectory:(id)a4;
- (void)withoutNotifyingSyncObserverUpgradeFace:(id)a3 forUUID:(id)a4;
@end

@implementation NTKDCollectionStore

+ (void)enumerateStoreIdentifiersWithBlock:(id)a3
{
  id v3 = a3;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_10001ACC0;
  v51 = sub_10001ACD0;
  id v52 = 0;
  v4 = sub_10001ACD8();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AD2C;
  block[3] = &unk_100061870;
  block[4] = &v47;
  dispatch_sync(v4, block);

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = (id)v48[5];
  id v6 = [v5 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v43;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(v5);
        }
        (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(*((void *)&v42 + 1) + 8 * (void)v8), 0);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v6);
  }

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10001ACC0;
  v40 = sub_10001ACD0;
  id v41 = 0;
  v9 = sub_10001ACD8();
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10001ADEC;
  v35[3] = &unk_100061870;
  v35[4] = &v36;
  dispatch_sync(v9, v35);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)v37[5];
  id v10 = [obj countByEnumeratingWithState:&v31 objects:v54 count:16];
  if (v10)
  {
    uint64_t v19 = *(void *)v32;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v11);
        uint64_t v25 = 0;
        v26 = &v25;
        uint64_t v27 = 0x3032000000;
        v28 = sub_10001ACC0;
        v29 = sub_10001ACD0;
        id v30 = 0;
        v13 = sub_10001ACD8();
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10001AFAC;
        v24[3] = &unk_100061898;
        v24[4] = v12;
        v24[5] = &v25;
        dispatch_sync(v13, v24);

        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v14 = (id)v26[5];
        id v15 = [v14 countByEnumeratingWithState:&v20 objects:v53 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v21;
          do
          {
            v17 = 0;
            do
            {
              if (*(void *)v21 != v16) {
                objc_enumerationMutation(v14);
              }
              (*((void (**)(id, void, uint64_t))v3 + 2))(v3, *(void *)(*((void *)&v20 + 1) + 8 * (void)v17), v12);
              v17 = (char *)v17 + 1;
            }
            while (v15 != v17);
            id v15 = [v14 countByEnumeratingWithState:&v20 objects:v53 count:16];
          }
          while (v15);
        }

        _Block_object_dispose(&v25, 8);
        v11 = (char *)v11 + 1;
      }
      while (v11 != v10);
      id v10 = [obj countByEnumeratingWithState:&v31 objects:v54 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v47, 8);
}

+ (void)cleanupOrphanedStoresWithCurrentDeviceUUIDs:(id)a3
{
  id v3 = a3;
  v4 = sub_10001ACD8();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B114;
  block[3] = &unk_100060A90;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

+ (id)_sharedCollectionStoreQueue
{
  if (qword_1000723A0 != -1) {
    dispatch_once(&qword_1000723A0, &stru_1000618B8);
  }
  v2 = (void *)qword_100072398;

  return v2;
}

+ (id)_sharedCollectionStoreObserverQueue
{
  if (qword_1000723B0 != -1) {
    dispatch_once(&qword_1000723B0, &stru_1000618D8);
  }
  v2 = (void *)qword_1000723A8;

  return v2;
}

- (NTKDCollectionStore)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v61 = a3;
  id v60 = a4;
  v67.receiver = self;
  v67.super_class = (Class)NTKDCollectionStore;
  v64 = [(NTKDCollectionStore *)&v67 init];
  if (!v64) {
    goto LABEL_30;
  }
  id v6 = (NSString *)[v61 copy];
  collectionIdentifier = v64->_collectionIdentifier;
  v64->_collectionIdentifier = v6;

  objc_storeStrong((id *)&v64->_deviceUUID, a4);
  uint64_t v8 = +[NTKDCollectionStore _sharedCollectionStoreQueue];
  queue = v64->_queue;
  v64->_queue = (OS_dispatch_queue *)v8;

  uint64_t v10 = +[NTKDCollectionStore _sharedCollectionStoreObserverQueue];
  observerCallbackQueue = v64->_observerCallbackQueue;
  v64->_observerCallbackQueue = (OS_dispatch_queue *)v10;

  uint64_t v12 = +[NSHashTable weakObjectsHashTable];
  observers = v64->_observers;
  v64->_observers = (NSHashTable *)v12;

  id v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  facesByUUID = v64->_facesByUUID;
  v64->_facesByUUID = v14;

  deviceUUID = v64->_deviceUUID;
  v17 = v64->_collectionIdentifier;
  if (deviceUUID) {
    sub_10001B3B8(deviceUUID);
  }
  else {
  v18 = sub_10001B434();
  }
  uint64_t v19 = [v18 stringByAppendingPathComponent:v17];

  storeDirectory = v64->_storeDirectory;
  v64->_storeDirectory = (NSString *)v19;

  long long v21 = v64->_storeDirectory;
  long long v22 = +[NSFileManager defaultManager];
  long long v23 = [(NSString *)v21 stringByAppendingPathComponent:@"setup-complete"];

  LOBYTE(v21) = [v22 fileExistsAtPath:v23];
  v64->_initialSetupComplete = (char)v21;
  v24 = sub_10001ACD8();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BD88;
  block[3] = &unk_100060A90;
  v63 = v64;
  v66 = v63;
  dispatch_sync(v24, block);

  uint64_t v25 = [(NSString *)v64->_storeDirectory stringByAppendingPathComponent:@"sequence-id.string"];
  uint64_t v26 = sub_10001BEB4((uint64_t)v25);
  seqId = v63->_seqId;
  v63->_seqId = (NSNumber *)v26;

  v28 = v64->_storeDirectory;
  v29 = [_NTKDCollectionManifest alloc];
  id v30 = [(NSString *)v28 stringByAppendingPathComponent:@"manifest.plist"];

  long long v31 = [(_NTKDCollectionManifest *)v29 initWithContentsOfFile:v30];
  if (v31)
  {
    long long v32 = v31;
  }
  else
  {
    long long v32 = +[_NTKDCollectionManifest emptyManifest];
  }
  long long v33 = v32;

  manifest = v63->_manifest;
  v63->_manifest = v33;

  v35 = v64->_storeDirectory;
  uint64_t v36 = [(NSString *)v35 stringByAppendingPathComponent:@"selected-uuid.string"];
  v37 = +[NSString stringWithContentsOfFile:v36 encoding:4 error:0];

  if (!v37) {
    goto LABEL_13;
  }
  uint64_t v38 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDString:v37];
  if (!v38)
  {
    v39 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = [(NSString *)v35 stringByAppendingPathComponent:@"selected-uuid.string"];
      *(_DWORD *)buf = 138412546;
      v73 = v40;
      __int16 v74 = 2112;
      v75 = v37;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Error reading selected UUID at path %@: string could not be converted to UUID: %@", buf, 0x16u);
    }
LABEL_13:
    uint64_t v38 = 0;
  }

  selectedUUID = v63->_selectedUUID;
  v63->_selectedUUID = v38;

  v59 = v64->_storeDirectory;
  long long v42 = +[NSMutableDictionary dictionary];
  long long v43 = [(NSString *)v59 stringByAppendingPathComponent:@"deleted.plist"];
  v62 = +[NSDictionary dictionaryWithContentsOfFile:v43];

  if (v62)
  {
    objc_opt_class();
    objc_opt_class();
    NTKValidateDictionary();
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v44 = v62;
  id v45 = [v44 countByEnumeratingWithState:&v68 objects:buf count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v69;
    do
    {
      for (i = 0; i != v45; i = (char *)i + 1)
      {
        if (*(void *)v69 != v46) {
          objc_enumerationMutation(v44);
        }
        uint64_t v48 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        id v49 = [objc_alloc((Class)NSUUID) initWithUUIDString:v48];
        if (!v49) {
          +[NSException raise:NSInvalidUnarchiveOperationException, @"string could not be converted to UUID: %@", v48 format];
        }
        v50 = [v44 objectForKey:v48];
        [(NSMutableDictionary *)v42 setObject:v50 forKey:v49];
      }
      id v45 = [v44 countByEnumeratingWithState:&v68 objects:buf count:16];
    }
    while (v45);
  }

  removals = v63->_removals;
  v63->_removals = v42;

  id v52 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = v64->_collectionIdentifier;
    v54 = v64->_deviceUUID;
    CFStringRef v55 = @"yes";
    if (!v64->_initialSetupComplete) {
      CFStringRef v55 = @"no";
    }
    v56 = v63->_seqId;
    v57 = v63->_manifest;
    *(_DWORD *)buf = 138413314;
    v73 = v53;
    __int16 v74 = 2112;
    v75 = v54;
    __int16 v76 = 2112;
    CFStringRef v77 = v55;
    __int16 v78 = 2112;
    v79 = v56;
    __int16 v80 = 2112;
    v81 = v57;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "store<%@,%@> created with setupComplete: %@, seqId: %@, manifest: %@", buf, 0x34u);
  }

LABEL_30:
  return v64;
}

- (void)addObserver:(id)a3 withSeqId:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BFE8;
  v7[3] = &unk_100060C58;
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKDCollectionStore *)v8 _onQueue_async:v7];
}

- (void)addObserver:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001C1E0;
  v4[3] = &unk_100060AB8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NTKDCollectionStore *)v5 _onQueue_async:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C284;
  v7[3] = &unk_100060AB8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)setSyncObserver:(id)a3 withSeqId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C354;
  block[3] = &unk_100060C58;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (void)clearSyncObserver
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C444;
  block[3] = &unk_100060A90;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (float)version
{
  uint64_t v6 = 0;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C500;
  v5[3] = &unk_100061898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setVersion:(float)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001C600;
  v3[3] = &unk_100061900;
  v3[4] = self;
  float v4 = a3;
  [(NTKDCollectionStore *)self _onQueue_async:v3];
}

- (id)_storeBuildVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = sub_10001ACC0;
  id v10 = sub_10001ACD0;
  v11 = &stru_100062B50;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C858;
  v5[3] = &unk_100061898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_deviceBuildVersion
{
  id v3 = NTKBuildVersion();
  float v4 = [(NTKDCollectionStore *)self deviceUUID];
  id v5 = +[CLKDevice nrDeviceForNRDeviceUUID:v4];

  uint64_t v6 = [v5 valueForProperty:NRDevicePropertySystemBuildVersion];
  id v7 = +[NSString stringWithFormat:@"%@-%@", v3, v6];

  return v7;
}

- (void)persistCurrentBuildVersion
{
  [(NTKDCollectionStore *)self _deviceBuildVersion];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001CA44;
  v4[3] = &unk_100060AB8;
  void v4[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  [(NTKDCollectionStore *)self _onQueue_async:v4];
}

- (BOOL)isBuildVersionOutdated
{
  id v3 = [(NTKDCollectionStore *)self _storeBuildVersion];
  float v4 = [(NTKDCollectionStore *)self _deviceBuildVersion];
  char v5 = [v4 isEqualToString:v3] ^ 1;

  return v5;
}

- (BOOL)isStoreVersionPreGrace
{
  v2 = [(NTKDCollectionStore *)self _storeBuildVersion];
  id v3 = v2;
  BOOL v4 = !v2
    || ([v2 isEqualToString:&stru_100062B50] & 1) != 0
    || [v3 compare:@"17" options:64] == (id)-1;

  return v4;
}

- (BOOL)refusesToDeleteLastFace
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001CCCC;
  v5[3] = &unk_100061898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setRefusesToDeleteLastFace:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001CD50;
  v3[3] = &unk_100061928;
  v3[4] = self;
  BOOL v4 = a3;
  [(NTKDCollectionStore *)self _onQueue_async:v3];
}

- (BOOL)isInitialSetupComplete
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001CE0C;
  v5[3] = &unk_100061898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)markInitialSetupComplete
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001CE8C;
  v2[3] = &unk_100060A90;
  v2[4] = self;
  [(NTKDCollectionStore *)self _onQueue_async:v2];
}

- (BOOL)isEmpty
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D074;
  v5[3] = &unk_100061898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)orderedUUIDs
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_10001ACC0;
  id v10 = sub_10001ACD0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D198;
  v5[3] = &unk_100061898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)selectedUUID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_10001ACC0;
  id v10 = sub_10001ACD0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D2F0;
  v5[3] = &unk_100061898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (int64_t)faceStyleForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = -1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D3D4;
  block[3] = &unk_100061950;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)faceForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10001ACC0;
  uint64_t v16 = sub_10001ACD0;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D51C;
  block[3] = &unk_100061950;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)faceForMigrationForUUID:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_10001ACC0;
    uint64_t v16 = sub_10001ACD0;
    id v17 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D6AC;
    block[3] = &unk_100061950;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(queue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)setOrderedUUIDs:(id)a3
{
}

- (void)setSelectedUUID:(id)a3
{
}

- (void)setSelectedUUID:(id)a3 suppressingCallbackToObserver:(id)a4
{
}

- (void)addFace:(id)a3 forUUID:(id)a4
{
}

- (void)updateFaceForUUID:(id)a3 withConfiguration:(id)a4
{
}

- (void)updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4
{
}

- (void)upgradeFace:(id)a3 forUUID:(id)a4
{
}

- (void)removeFaceForUUID:(id)a3
{
}

- (void)withoutNotifyingSyncObserverSetOrderedUUIDs:(id)a3
{
}

- (void)withoutNotifyingSyncObserverSetSelectedUUID:(id)a3
{
}

- (void)withoutNotifyingSyncObserverAddFace:(id)a3 forUUID:(id)a4
{
}

- (void)withoutNotifyingSyncObserverUpdateFaceForUUID:(id)a3 withConfiguration:(id)a4
{
}

- (void)withoutNotifyingSyncObserverUpdateFaceForUUID:(id)a3 withResourceDirectory:(id)a4
{
}

- (void)withoutNotifyingSyncObserverUpgradeFace:(id)a3 forUUID:(id)a4
{
}

- (void)withoutNotifyingSyncObserverRemoveFaceForUUID:(id)a3
{
}

- (void)withoutNotifyingSyncObserverResetWithFaces:(id)a3 orderedUUIDs:(id)a4 selectedUUID:(id)a5
{
}

- (void)swapInTheseFaces:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v11);
        id v13 = +[NSUUID UUID];
        [v6 addObject:v13];
        [v5 setObject:v12 forKey:v13];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v9);
  }

  uint64_t v14 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    long long v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Swapping in faces (%@) for collection (%@)", buf, 0x16u);
  }

  uint64_t v15 = [v6 firstObject];
  [(NTKDCollectionStore *)self _resetWithFaces:v5 orderedUUIDs:v6 selectedUUID:v15];
}

- (void)removeUnusedResourceDirectories
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001DCD0;
  v2[3] = &unk_100060A90;
  v2[4] = self;
  [(NTKDCollectionStore *)self _onQueue_async:v2];
}

- (id)description
{
  collectionIdentifier = self->_collectionIdentifier;
  deviceUUID = self->_deviceUUID;
  if (deviceUUID)
  {
    id v4 = [(NSUUID *)deviceUUID UUIDString];
    id v5 = +[NSString stringWithFormat:@"%@:%@", collectionIdentifier, v4];
  }
  else
  {
    id v5 = +[NSString stringWithFormat:@"%@:%@", collectionIdentifier, @"global"];
  }

  return v5;
}

- (void)_setOrderedUUIDs:(id)a3 skipSyncObserver:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001E25C;
  v6[3] = &unk_100061118;
  id v7 = self;
  id v8 = a3;
  BOOL v9 = a4;
  id v5 = v8;
  [(NTKDCollectionStore *)v7 _onQueue_async:v6];
}

- (void)_setSelectedUUID:(id)a3 skipSyncObserver:(BOOL)a4
{
}

- (void)_setSelectedUUID:(id)a3 skipSyncObserver:(BOOL)a4 suppressingCallbackToObserver:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001E3C4;
  v9[3] = &unk_1000619A0;
  uint64_t v10 = self;
  id v11 = a3;
  BOOL v13 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  [(NTKDCollectionStore *)v10 _onQueue_async:v9];
}

- (void)_addFace:(id)a3 forUUID:(id)a4 skipSyncObserver:(BOOL)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001E4E8;
  v9[3] = &unk_1000619A0;
  uint64_t v10 = self;
  id v11 = a3;
  id v12 = a4;
  BOOL v13 = a5;
  id v7 = v12;
  id v8 = v11;
  [(NTKDCollectionStore *)v10 _onQueue_async:v9];
}

- (void)_updateFaceForUUID:(id)a3 withConfiguration:(id)a4 skipSyncObserver:(BOOL)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001E62C;
  v9[3] = &unk_1000619A0;
  uint64_t v10 = self;
  id v11 = a3;
  id v12 = a4;
  BOOL v13 = a5;
  id v7 = v12;
  id v8 = v11;
  [(NTKDCollectionStore *)v10 _onQueue_async:v9];
}

- (void)_updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4 skipSyncObserver:(BOOL)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001EA10;
  v9[3] = &unk_1000619A0;
  uint64_t v10 = self;
  id v11 = a3;
  id v12 = a4;
  BOOL v13 = a5;
  id v7 = v12;
  id v8 = v11;
  [(NTKDCollectionStore *)v10 _onQueue_async:v9];
}

- (void)_upgradeFace:(id)a3 forUUID:(id)a4 skipSyncObserver:(BOOL)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001EF28;
  v10[3] = &unk_1000619A0;
  id v11 = a3;
  id v12 = self;
  id v13 = a4;
  BOOL v14 = a5;
  id v8 = v13;
  id v9 = v11;
  [(NTKDCollectionStore *)self _onQueue_async:v10];
}

- (void)_removeFaceForUUID:(id)a3 skipSyncObserver:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F148;
  v6[3] = &unk_100061118;
  id v7 = self;
  id v8 = a3;
  BOOL v9 = a4;
  id v5 = v8;
  [(NTKDCollectionStore *)v7 _onQueue_async:v6];
}

- (void)_resetWithFaces:(id)a3 orderedUUIDs:(id)a4 selectedUUID:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001F7C0;
  v10[3] = &unk_1000610F0;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(NTKDCollectionStore *)v11 _onQueue_async:v10];
}

- (void)synchronize
{
}

- (void)flushWithObserverCallback:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001FF20;
  v4[3] = &unk_100060AE0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NTKDCollectionStore *)v5 _onQueue_async:v4];
}

- (void)flushAndComputeValidationHashWithObserverCallback:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002004C;
  v4[3] = &unk_100060AE0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NTKDCollectionStore *)v5 _onQueue_async:v4];
}

- (void)_onQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.collectionstore.asyncwork");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000201C0;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_onObserverQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.collectionstore.asyncobservercallback");
  observerCallbackQueue = self->_observerCallbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000202A4;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(observerCallbackQueue, block);
}

- (id)_queue_faceForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_facesByUUID objectForKey:v4];
    if (v5) {
      goto LABEL_9;
    }
    storeDirectory = self->_storeDirectory;
    id v7 = [(NTKDCollectionStore *)self deviceUUID];
    id v5 = sub_10001D734(storeDirectory, v4, v7, 0);

    if (v5)
    {
      [(NSMutableDictionary *)self->_facesByUUID setObject:v5 forKey:v4];
      goto LABEL_9;
    }
    id v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100043784((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  id v5 = 0;
LABEL_9:

  return v5;
}

- (BOOL)_queue_isEmpty
{
  return [(NTKDCollectionStore *)self _queue_isEmptyExceptForUUID:0];
}

- (BOOL)_queue_isEmptyExceptForUUID:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(_NTKDCollectionManifest *)self->_manifest orderedUUIDs];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ((NTKEqualObjects() & 1) == 0)
        {
          uint64_t v11 = [(NTKDCollectionStore *)self _queue_faceForUUID:v10];

          if (v11)
          {
            BOOL v12 = 0;
            goto LABEL_12;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)_queue_addFace:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = (NSNumber *)a4;
  if (!v6)
  {
    BOOL v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      collectionIdentifier = self->_collectionIdentifier;
      deviceUUID = self->_deviceUUID;
      int v28 = 138412802;
      v29 = collectionIdentifier;
      __int16 v30 = 2112;
      long long v31 = deviceUUID;
      __int16 v32 = 2112;
      long long v33 = v7;
      v24 = "<%@,%@> ignoring attempt to add nil face for UUID: %@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v28, 0x20u);
    }
LABEL_11:
    BOOL v21 = 0;
    goto LABEL_12;
  }
  if (!-[_NTKDCollectionManifest addUUID:withFaceStyle:](self->_manifest, "addUUID:withFaceStyle:", v7, [v6 faceStyle]))
  {
    BOOL v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = self->_collectionIdentifier;
      uint64_t v26 = self->_deviceUUID;
      int v28 = 138412802;
      v29 = v25;
      __int16 v30 = 2112;
      long long v31 = v26;
      __int16 v32 = 2112;
      long long v33 = v7;
      v24 = "<%@,%@> did not add face (because face already present) for UUID: %@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v8 = sub_100025314(self->_storeDirectory, v7);
  uint64_t v9 = +[NSFileManager defaultManager];
  [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

  sub_10001E7B0(self->_storeDirectory, v7, v6);
  sub_10001F4B8(self->_storeDirectory, self->_manifest);
  storeDirectory = self->_storeDirectory;
  uint64_t v11 = [v6 resourceDirectory];
  BOOL v12 = sub_10001EC3C(storeDirectory, v7, v11);

  [v6 setResourceDirectory:v12];
  facesByUUID = self->_facesByUUID;
  id v14 = [v6 copy];
  [(NSMutableDictionary *)facesByUUID setObject:v14 forKey:v7];

  [(NTKDCollectionStore *)self _queue_incrementSeqId];
  seqId = self->_seqId;
  long long v16 = sub_100020810(self->_storeDirectory, v7);
  sub_10001E86C((uint64_t)seqId, v16);

  long long v17 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    long long v18 = self->_collectionIdentifier;
    long long v19 = self->_deviceUUID;
    long long v20 = self->_seqId;
    int v28 = 138413314;
    v29 = v18;
    __int16 v30 = 2112;
    long long v31 = v19;
    __int16 v32 = 2112;
    long long v33 = v20;
    __int16 v34 = 2112;
    v35 = v7;
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%@,%@,%@> add face for UUID %@: %@", (uint8_t *)&v28, 0x34u);
  }

  BOOL v21 = 1;
LABEL_12:

  return v21;
}

- (BOOL)_queue_setSelectedUUID:(id)a3
{
  id v5 = (NSNumber *)a3;
  char v6 = NTKEqualObjects();
  if (v6)
  {
    id v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      collectionIdentifier = self->_collectionIdentifier;
      deviceUUID = self->_deviceUUID;
      int v23 = 138412802;
      v24 = collectionIdentifier;
      __int16 v25 = 2112;
      uint64_t v26 = deviceUUID;
      __int16 v27 = 2112;
      int v28 = v5;
      uint64_t v10 = "<%@,%@> ignoring attempt to select already-selected UUID %@";
      uint64_t v11 = v7;
      uint32_t v12 = 32;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v23, v12);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedUUID, a3);
    selectedUUID = self->_selectedUUID;
    id v14 = self->_storeDirectory;
    if (selectedUUID)
    {
      long long v15 = [(NSUUID *)selectedUUID UUIDString];
      long long v16 = [(NSString *)v14 stringByAppendingPathComponent:@"selected-uuid.string"];

      [v15 writeToFile:v16 atomically:1 encoding:4 error:0];
    }
    else
    {
      long long v15 = +[NSFileManager defaultManager];
      long long v16 = [(NSString *)v14 stringByAppendingPathComponent:@"selected-uuid.string"];

      [v15 removeItemAtPath:v16 error:0];
    }

    [(NTKDCollectionStore *)self _queue_incrementSeqId];
    seqId = self->_seqId;
    long long v18 = [(NSString *)self->_storeDirectory stringByAppendingPathComponent:@"selected-uuid-sequence-id.string"];
    sub_10001E86C((uint64_t)seqId, v18);

    id v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = self->_collectionIdentifier;
      long long v20 = self->_deviceUUID;
      BOOL v21 = self->_seqId;
      int v23 = 138413058;
      v24 = v19;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      int v28 = v21;
      __int16 v29 = 2112;
      __int16 v30 = v5;
      uint64_t v10 = "<%@,%@,%@> set selected UUID: %@";
      uint64_t v11 = v7;
      uint32_t v12 = 42;
      goto LABEL_9;
    }
  }

  return v6 ^ 1;
}

- (BOOL)_queue_setOrderedUUIDs:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_NTKDCollectionManifest *)self->_manifest updateOrderWithUUIDs:v4];
  if (v5)
  {
    sub_10001F4B8(self->_storeDirectory, self->_manifest);
    [(NTKDCollectionStore *)self _queue_incrementSeqId];
    seqId = self->_seqId;
    id v7 = [(NSString *)self->_storeDirectory stringByAppendingPathComponent:@"manifest-sequence-id.string"];
    sub_10001E86C((uint64_t)seqId, v7);

    uint64_t v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      collectionIdentifier = self->_collectionIdentifier;
      deviceUUID = self->_deviceUUID;
      uint64_t v11 = self->_seqId;
      uint32_t v12 = [v4 firstObject];
      int v16 = 138413058;
      long long v17 = collectionIdentifier;
      __int16 v18 = 2112;
      long long v19 = deviceUUID;
      __int16 v20 = 2112;
      BOOL v21 = v11;
      __int16 v22 = 2112;
      int v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@,%@,%@> set ordered UUIDs (first uuid = %@)", (uint8_t *)&v16, 0x2Au);
    }
  }
  else
  {
    uint64_t v8 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = self->_collectionIdentifier;
      id v14 = self->_deviceUUID;
      int v16 = 138412546;
      long long v17 = v13;
      __int16 v18 = 2112;
      long long v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@,%@> ignoring reorder request that would not change face order", (uint8_t *)&v16, 0x16u);
    }
  }

  return v5;
}

- (void)_queue_incrementSeqId
{
  id v3 = +[NSNumber numberWithUnsignedInteger:(char *)[(NSNumber *)self->_seqId unsignedIntegerValue] + 1];
  seqId = self->_seqId;
  self->_seqId = v3;

  BOOL v5 = self->_seqId;
  id v6 = [(NSString *)self->_storeDirectory stringByAppendingPathComponent:@"sequence-id.string"];
  sub_10001E86C((uint64_t)v5, v6);
}

- (id)_queue_copyAllFacesByUUID
{
  id v3 = +[NSMutableDictionary dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(_NTKDCollectionManifest *)self->_manifest orderedUUIDs];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [(NTKDCollectionStore *)self _queue_faceForUUID:v9];
        id v11 = [v10 copy];

        if (v11) {
          [v3 setObject:v11 forKey:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_queue_clearRemovalsThroughSeqId:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  removals = self->_removals;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100020F7C;
  uint32_t v12 = &unk_100061A60;
  id v7 = v4;
  id v13 = v7;
  id v8 = v5;
  id v14 = v8;
  [(NSMutableDictionary *)removals enumerateKeysAndObjectsUsingBlock:&v9];
  if (objc_msgSend(v8, "count", v9, v10, v11, v12))
  {
    [(NSMutableDictionary *)self->_removals removeObjectsForKeys:v8];
    sub_10001F528(self->_storeDirectory, self->_removals);
  }
}

- (id)_queue_computeValidationHash
{
  id v34 = objc_alloc_init((Class)NSMutableString);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(_NTKDCollectionManifest *)self->_manifest orderedUUIDs];
  id v3 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v38;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v38 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = [(NTKDCollectionStore *)self _queue_faceForUUID:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        id v8 = [v7 configuration];
        id v9 = [v8 copy];

        [v9 setResourceDirectoryExists:0];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000215A8;
        v35[3] = &unk_100061A88;
        id v36 = v9;
        id v10 = v9;
        [v7 enumerateComplicationSlotsWithBlock:v35];
        id v11 = (objc_class *)objc_opt_class();
        uint32_t v12 = NSStringFromClass(v11);
        id v13 = [v10 description];
        [v34 appendFormat:@"%@ [%@], ", v12, v13];
      }
      id v4 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v4);
  }

  [v34 appendFormat:@"%@", self->_selectedUUID];
  unint64_t v14 = (unint64_t)[v34 length];
  long long v15 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v34;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "collection store string: %@", buf, 0xCu);
  }

  if (v14 >= 0x400)
  {
    long long v16 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [v34 substringFromIndex:1023];
      *(_DWORD *)buf = 138412290;
      id v44 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "collection store string, part 2: %@", buf, 0xCu);
    }
    if (v14 >= 0x7FF)
    {
      __int16 v18 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        long long v19 = [v34 substringFromIndex:2046];
        *(_DWORD *)buf = 138412290;
        id v44 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "collection store string, part 3: %@", buf, 0xCu);
      }
      if (v14 >= 0xBFE)
      {
        __int16 v20 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v21 = [v34 substringFromIndex:3069];
          *(_DWORD *)buf = 138412290;
          id v44 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "collection store string, part 4: %@", buf, 0xCu);
        }
        if (v14 >= 0xFFD)
        {
          __int16 v22 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = [v34 substringFromIndex:4092];
            *(_DWORD *)buf = 138412290;
            id v44 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "collection store string, part 5: %@", buf, 0xCu);
          }
          if (v14 >> 2 >= 0x4FF)
          {
            v24 = _NTKLoggingObjectForDomain();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v25 = [v34 substringFromIndex:5115];
              *(_DWORD *)buf = 138412290;
              id v44 = v25;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "collection store string, part 6: %@", buf, 0xCu);
            }
          }
        }
      }
    }
  }
  id v26 = v34;
  __int16 v27 = (const char *)[v26 UTF8String];
  CC_LONG v28 = strlen(v27);
  CC_MD5(v27, v28, buf);
  __int16 v29 = +[NSMutableString stringWithCapacity:32];
  for (uint64_t j = 0; j != 16; ++j)
    objc_msgSend(v29, "appendFormat:", @"%02x", buf[j]);
  long long v31 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v41 = 138412290;
    long long v42 = v29;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "generated library collection store hash: %@", v41, 0xCu);
  }

  return v29;
}

- (void)_queue_playbackChangesForObserver:(id)a3 fromSeqId:(id)a4
{
  id v47 = a3;
  id v6 = a4;
  id v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    collectionIdentifier = self->_collectionIdentifier;
    deviceUUID = self->_deviceUUID;
    *(_DWORD *)buf = 138412802;
    v84 = collectionIdentifier;
    __int16 v85 = 2112;
    v86 = deviceUUID;
    __int16 v87 = 2112;
    id v88 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "store<%@,%@> playback changes since seqId %@", buf, 0x20u);
  }

  +[NSMutableDictionary dictionary];
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_100021E90;
  v79[3] = &unk_100061AB0;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v80 = v10;
  id v11 = objc_retainBlock(v79);
  uint32_t v12 = [(NSString *)self->_storeDirectory stringByAppendingPathComponent:@"selected-uuid-sequence-id.string"];
  id v13 = sub_10001BEB4((uint64_t)v12);

  if (v13 && sub_10001C0DC(v6, v13))
  {
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_100021F0C;
    v76[3] = &unk_100060C58;
    v76[4] = self;
    id v77 = v13;
    id v78 = v47;
    ((void (*)(void *, id, void *))v11[2])(v11, v77, v76);
  }
  long long v43 = v10;
  unint64_t v14 = [(NSString *)self->_storeDirectory stringByAppendingPathComponent:@"manifest-sequence-id.string"];
  long long v15 = sub_10001BEB4((uint64_t)v14);

  if (v15 && sub_10001C0DC(v6, v15))
  {
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100022088;
    v73[3] = &unk_100060C58;
    v73[4] = self;
    id v74 = v15;
    id v75 = v47;
    ((void (*)(void *, id, void *))v11[2])(v11, v74, v73);
  }
  long long v42 = v13;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = [(_NTKDCollectionManifest *)self->_manifest orderedUUIDs];
  id v46 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v70;
    do
    {
      for (i = 0; i != v46; i = (char *)i + 1)
      {
        if (*(void *)v70 != v45) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        __int16 v18 = sub_100020810(self->_storeDirectory, v17);
        long long v19 = sub_10001BEB4((uint64_t)v18);

        if (v19 && sub_10001C0DC(v6, v19))
        {
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472;
          v66[2] = sub_100022230;
          v66[3] = &unk_1000610F0;
          v66[4] = self;
          v66[5] = v17;
          id v20 = v19;
          id v67 = v20;
          id v68 = v47;
          ((void (*)(void *, id, void *))v11[2])(v11, v20, v66);
        }
        BOOL v21 = sub_10001F058(self->_storeDirectory, v17);
        __int16 v22 = sub_10001BEB4((uint64_t)v21);

        if (v22 && sub_10001C0DC(v6, v22))
        {
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = sub_1000223C4;
          v63[3] = &unk_1000610F0;
          v63[4] = self;
          v63[5] = v17;
          id v64 = v19;
          id v65 = v47;
          ((void (*)(void *, void *, void *))v11[2])(v11, v22, v63);
        }
        int v23 = sub_10001E8F4(self->_storeDirectory, v17);
        v24 = sub_10001BEB4((uint64_t)v23);

        if (v24 && sub_10001C0DC(v6, v24))
        {
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = sub_100022558;
          v60[3] = &unk_1000610F0;
          v60[4] = self;
          v60[5] = v17;
          id v25 = v24;
          id v61 = v25;
          id v62 = v47;
          ((void (*)(void *, id, void *))v11[2])(v11, v25, v60);
        }
        id v26 = sub_10001EDB0(self->_storeDirectory, v17);
        __int16 v27 = sub_10001BEB4((uint64_t)v26);

        if (v27 && sub_10001C0DC(v6, v27))
        {
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_100022748;
          v57[3] = &unk_1000610F0;
          v57[4] = self;
          v57[5] = v17;
          id v28 = v27;
          id v58 = v28;
          id v59 = v47;
          ((void (*)(void *, id, void *))v11[2])(v11, v28, v57);
        }
      }
      id v46 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
    }
    while (v46);
  }

  removals = self->_removals;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000228F0;
  v52[3] = &unk_100061B18;
  id v30 = v6;
  id v53 = v30;
  long long v31 = v11;
  id v56 = v31;
  v54 = self;
  id v32 = v47;
  id v55 = v32;
  [(NSMutableDictionary *)removals enumerateKeysAndObjectsUsingBlock:v52];
  long long v33 = [v43 allKeys];
  id v34 = [v33 sortedArrayUsingComparator:&stru_100061B58];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v35 = v34;
  id v36 = [v35 countByEnumeratingWithState:&v48 objects:v81 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v37; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(v35);
        }
        long long v40 = [v43 objectForKey:*(void *)(*((void *)&v48 + 1) + 8 * (void)j)];
        v40[2]();
      }
      id v37 = [v35 countByEnumeratingWithState:&v48 objects:v81 count:16];
    }
    while (v37);
  }
}

- (void)_queue_loadFullCollectionForObserver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_NTKDCollectionManifest *)self->_manifest orderedUUIDs];
  id v9 = [v8 copy];

  id v10 = self->_selectedUUID;
  id v11 = [(NTKDCollectionStore *)self _queue_copyAllFacesByUUID];
  uint32_t v12 = self->_seqId;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100022D04;
  v19[3] = &unk_100061B80;
  id v20 = v6;
  BOOL v21 = self;
  id v22 = v9;
  int v23 = v10;
  id v24 = v11;
  id v25 = v12;
  id v26 = v7;
  id v13 = v7;
  unint64_t v14 = v12;
  id v15 = v11;
  long long v16 = v10;
  id v17 = v9;
  id v18 = v6;
  [(NTKDCollectionStore *)self _onObserverQueue_async:v19];
}

- (void)_queue_reloadFullCollectionForObserver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100022EFC;
  unint64_t v14 = &unk_100061BA8;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = objc_retainBlock(&v11);
  -[NTKDCollectionStore _queue_loadFullCollectionForObserver:completion:](self, "_queue_loadFullCollectionForObserver:completion:", v8, v10, v11, v12, v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_queue_notifyDidUpdateSelectedUUID:(id)a3 skipSyncObserver:(BOOL)a4 suppressingCallbackToObserver:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = self->_seqId;
  id v11 = self->_syncObserver;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000232A4;
  v28[3] = &unk_100061BD0;
  BOOL v33 = a4;
  id v20 = v11;
  __int16 v29 = v20;
  id v30 = self;
  uint64_t v12 = v10;
  long long v31 = v12;
  id v13 = v8;
  id v32 = v13;
  [(NTKDCollectionStore *)self _onObserverQueue_async:v28];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v14 = self->_observers;
  id v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(id *)(*((void *)&v24 + 1) + 8 * (void)v18);
        if (v19 != v9)
        {
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_1000232C8;
          v21[3] = &unk_1000610F0;
          v21[4] = v19;
          v21[5] = self;
          id v22 = v13;
          int v23 = v12;
          [(NTKDCollectionStore *)self _onObserverQueue_async:v21];
        }
        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSHashTable *)v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v16);
  }
}

- (void)_queue_notifyDidUpdateOrderedUUIDs:(id)a3 skipSyncObserver:(BOOL)a4
{
  id v6 = a3;
  id v7 = self->_seqId;
  id v8 = self->_syncObserver;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100023508;
  v25[3] = &unk_100061BD0;
  BOOL v30 = a4;
  uint64_t v17 = v8;
  long long v26 = v17;
  long long v27 = self;
  id v9 = v7;
  id v28 = v9;
  id v10 = v6;
  id v29 = v10;
  [(NTKDCollectionStore *)self _onObserverQueue_async:v25];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = self->_observers;
  id v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v15);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10002352C;
        v18[3] = &unk_1000610F0;
        v18[4] = v16;
        v18[5] = self;
        id v19 = v10;
        id v20 = v9;
        [(NTKDCollectionStore *)self _onObserverQueue_async:v18];

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v13);
  }
}

- (void)_queue_notifyDidUpdateFaceForUUID:(id)a3 withConfiguration:(id)a4 skipSyncObserver:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self->_seqId;
  id v11 = self->_syncObserver;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000237A4;
  v30[3] = &unk_100061BF8;
  BOOL v36 = a5;
  id v20 = v11;
  long long v31 = v20;
  id v32 = self;
  id v12 = v10;
  BOOL v33 = v12;
  id v13 = v8;
  id v34 = v13;
  id v14 = v9;
  id v35 = v14;
  [(NTKDCollectionStore *)self _onObserverQueue_async:v30];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = self->_observers;
  id v15 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v18);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000237CC;
        v22[3] = &unk_100061190;
        v22[4] = v19;
        v22[5] = self;
        id v23 = v13;
        id v24 = v14;
        long long v25 = v12;
        [(NTKDCollectionStore *)self _onObserverQueue_async:v22];

        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v16);
  }
}

- (void)_queue_notifyDidUpgradeFace:(id)a3 forUUID:(id)a4 skipSyncObserver:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self->_seqId;
  id v11 = self->_syncObserver;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100023A48;
  v30[3] = &unk_100061BF8;
  BOOL v36 = a5;
  id v20 = v11;
  long long v31 = v20;
  id v32 = self;
  id v12 = v10;
  BOOL v33 = v12;
  id v13 = v8;
  id v34 = v13;
  id v14 = v9;
  id v35 = v14;
  [(NTKDCollectionStore *)self _onObserverQueue_async:v30];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = self->_observers;
  id v15 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v18);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100023A70;
        v22[3] = &unk_100061190;
        v22[4] = v19;
        v22[5] = self;
        id v23 = v13;
        id v24 = v14;
        long long v25 = v12;
        [(NTKDCollectionStore *)self _onObserverQueue_async:v22];

        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v16);
  }
}

- (void)_queue_notifyDidUpdateFaceForUUID:(id)a3 withResourceDirectory:(id)a4 skipSyncObserver:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v25 = a3;
  id v24 = a4;
  dispatch_block_t block = a6;
  id v10 = self->_seqId;
  id v11 = dispatch_group_create();
  id v12 = self->_syncObserver;
  id v13 = v12;
  if (v7)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100023DE4;
    v41[3] = &unk_100060C58;
    id v14 = (id *)v42;
    v42[0] = v12;
    v42[1] = self;
    id v15 = (id *)&v43;
    long long v43 = v10;
    [(NTKDCollectionStore *)self _onObserverQueue_async:v41];
  }
  else
  {
    if (!v12) {
      goto LABEL_6;
    }
    dispatch_group_enter(v11);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100023DF4;
    v35[3] = &unk_100061C20;
    id v14 = (id *)v36;
    v36[0] = v13;
    v36[1] = self;
    id v15 = &v37;
    id v37 = v25;
    id v38 = v24;
    long long v39 = v10;
    long long v40 = v11;
    [(NTKDCollectionStore *)self _onObserverQueue_async:v35];
  }
LABEL_6:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = self->_observers;
  id v16 = [(NSHashTable *)obj countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        id v20 = v10;
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        dispatch_group_enter(v11);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100023EAC;
        v26[3] = &unk_100061C20;
        v26[4] = v21;
        v26[5] = self;
        id v27 = v25;
        id v28 = v24;
        id v10 = v20;
        long long v29 = v20;
        BOOL v30 = v11;
        [(NTKDCollectionStore *)self _onObserverQueue_async:v26];
      }
      id v17 = [(NSHashTable *)obj countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v17);
  }

  dispatch_group_notify(v11, (dispatch_queue_t)self->_queue, block);
}

- (void)_queue_notifyDidAddFace:(id)a3 forUUID:(id)a4 skipSyncObserver:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self->_seqId;
  id v11 = self->_syncObserver;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000241CC;
  v30[3] = &unk_100061BF8;
  BOOL v36 = a5;
  id v20 = v11;
  long long v31 = v20;
  long long v32 = self;
  id v12 = v10;
  long long v33 = v12;
  id v13 = v8;
  id v34 = v13;
  id v14 = v9;
  id v35 = v14;
  [(NTKDCollectionStore *)self _onObserverQueue_async:v30];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = self->_observers;
  id v15 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v18);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000241F4;
        v22[3] = &unk_100061190;
        v22[4] = v19;
        v22[5] = self;
        id v23 = v13;
        id v24 = v14;
        id v25 = v12;
        [(NTKDCollectionStore *)self _onObserverQueue_async:v22];

        uint64_t v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSHashTable *)obj countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v16);
  }
}

- (void)_queue_notifyDidRemoveFaceOfStyle:(int64_t)a3 forUUID:(id)a4 skipSyncObserver:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v25 = a4;
  dispatch_block_t block = a6;
  id v9 = self->_seqId;
  id v10 = dispatch_group_create();
  id v11 = self->_syncObserver;
  id v12 = v11;
  if (v7)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100024540;
    v41[3] = &unk_100060C58;
    id v13 = (id *)v42;
    v42[0] = v11;
    v42[1] = self;
    id v14 = (id *)&v43;
    long long v43 = v9;
    [(NTKDCollectionStore *)self _onObserverQueue_async:v41];
  }
  else
  {
    if (!v11) {
      goto LABEL_6;
    }
    dispatch_group_enter(v10);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100024550;
    v35[3] = &unk_100061C48;
    id v13 = (id *)v36;
    v36[0] = v12;
    v36[1] = self;
    int64_t v40 = a3;
    id v14 = &v37;
    id v37 = v25;
    id v38 = v9;
    long long v39 = v10;
    [(NTKDCollectionStore *)self _onObserverQueue_async:v35];
  }
LABEL_6:
  uint64_t v21 = v12;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = self->_observers;
  id v15 = [(NSHashTable *)obj countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = v9;
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v18);
        dispatch_group_enter(v10);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100024608;
        v26[3] = &unk_100061C48;
        v26[4] = v20;
        v26[5] = self;
        int64_t v30 = a3;
        id v27 = v25;
        id v9 = v19;
        long long v28 = v19;
        long long v29 = v10;
        [(NTKDCollectionStore *)self _onObserverQueue_async:v26];

        uint64_t v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSHashTable *)obj countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v16);
  }

  dispatch_group_notify(v10, (dispatch_queue_t)self->_queue, block);
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_removals, 0);
  objc_storeStrong((id *)&self->_selectedUUID, 0);
  objc_storeStrong((id *)&self->_facesByUUID, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_observerCallbackQueue, 0);
  objc_storeStrong((id *)&self->_syncObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_seqId, 0);
  objc_storeStrong((id *)&self->_storeDirectory, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end