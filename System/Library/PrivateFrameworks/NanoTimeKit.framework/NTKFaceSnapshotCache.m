@interface NTKFaceSnapshotCache
+ (id)snapshotCache;
- (NSMapTable)callCountsByFace;
- (NSMutableDictionary)requestsBySnapshotKey;
- (NSMutableDictionary)snapshots;
- (NSMutableOrderedSet)highPriorityRequests;
- (NSMutableOrderedSet)lowPriorityRequests;
- (NTKFaceSnapshotCache)init;
- (NTKFaceSnapshotCacheRequest)servicingRequest;
- (OS_dispatch_queue)snapshotQueue;
- (id)cachedSnapshotOfFace:(id)a3;
- (void)_attemptSnapshotForRequest:(id)a3;
- (void)_invokeCallbacksMatchingRequest:(id)a3 withSnapshot:(id)a4;
- (void)_serviceRequestsIfIdle;
- (void)_snapshotProcessInterrupted:(id)a3;
- (void)cancelSnapshotRequest:(id)a3;
- (void)dealloc;
- (void)fetchSnapshotWithRequest:(id)a3;
- (void)setHighPriorityRequests:(id)a3;
- (void)setLowPriorityRequests:(id)a3;
- (void)setServicingRequest:(id)a3;
@end

@implementation NTKFaceSnapshotCache

+ (id)snapshotCache
{
  if (snapshotCache_onceToken != -1) {
    dispatch_once(&snapshotCache_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)snapshotCache_cache;

  return v2;
}

void __37__NTKFaceSnapshotCache_snapshotCache__block_invoke()
{
  v0 = objc_alloc_init(NTKFaceSnapshotCache);
  v1 = (void *)snapshotCache_cache;
  snapshotCache_cache = (uint64_t)v0;
}

- (NTKFaceSnapshotCache)init
{
  v18.receiver = self;
  v18.super_class = (Class)NTKFaceSnapshotCache;
  v2 = [(NTKFaceSnapshotCache *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    snapshots = v2->_snapshots;
    v2->_snapshots = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    requestsBySnapshotKey = v2->_requestsBySnapshotKey;
    v2->_requestsBySnapshotKey = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
    callCountsByFace = v2->_callCountsByFace;
    v2->_callCountsByFace = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA70] orderedSet];
    highPriorityRequests = v2->_highPriorityRequests;
    v2->_highPriorityRequests = (NSMutableOrderedSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA70] orderedSet];
    lowPriorityRequests = v2->_lowPriorityRequests;
    v2->_lowPriorityRequests = (NSMutableOrderedSet *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.nanotimekit.snapshots.face", v13);
    snapshotQueue = v2->_snapshotQueue;
    v2->_snapshotQueue = (OS_dispatch_queue *)v14;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v2 selector:sel__snapshotProcessInterrupted_ name:@"NTKFaceSnapshotClientInterruptionName" object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKFaceSnapshotCache;
  [(NTKFaceSnapshotCache *)&v4 dealloc];
}

- (id)cachedSnapshotOfFace:(id)a3
{
  objc_super v4 = _NTKFaceSnapshotCacheKeyForFace(a3);
  if (v4)
  {
    uint64_t v5 = [(NTKFaceSnapshotCache *)self snapshots];
    v6 = [v5 objectForKey:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_snapshotProcessInterrupted:(id)a3
{
  objc_super v4 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Face snapshot process interrupted!", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NTKFaceSnapshotCache__snapshotProcessInterrupted___block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __52__NTKFaceSnapshotCache__snapshotProcessInterrupted___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) servicingRequest];
  if (v2)
  {
    uint64_t v3 = v2;
    [*(id *)(a1 + 32) _attemptSnapshotForRequest:v2];
    v2 = v3;
  }
}

- (void)_invokeCallbacksMatchingRequest:(id)a3 withSnapshot:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 face];
    v10 = [v6 faceSnapshotKey];
    *(_DWORD *)buf = 138412802;
    id v31 = v7;
    __int16 v32 = 2112;
    v33 = v9;
    __int16 v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Invoking callbacks for snapshot %@ of face %@ with key %@", buf, 0x20u);
  }
  requestsBySnapshotKey = self->_requestsBySnapshotKey;
  v12 = [v6 faceSnapshotKey];
  v13 = [(NSMutableDictionary *)requestsBySnapshotKey objectForKey:v12];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v18), "completion", (void)v25);
        v20 = (void *)v19;
        if (v19) {
          (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v7);
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  v21 = self->_requestsBySnapshotKey;
  v22 = [v6 faceSnapshotKey];
  [(NSMutableDictionary *)v21 removeObjectForKey:v22];

  v23 = [(NTKFaceSnapshotCache *)self callCountsByFace];
  v24 = [v6 face];
  [v23 removeObjectForKey:v24];
}

- (void)cancelSnapshotRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 face];
    int v16 = 138412290;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Cancel face request for %@", (uint8_t *)&v16, 0xCu);
  }
  id v7 = [(NTKFaceSnapshotCache *)self servicingRequest];
  if (v7 != v4)
  {
    v8 = [(NTKFaceSnapshotCache *)self requestsBySnapshotKey];
    uint64_t v9 = [v4 faceSnapshotKey];
    v10 = [v8 objectForKey:v9];

    [v10 removeObject:v4];
    uint64_t v11 = [(NTKFaceSnapshotCache *)self highPriorityRequests];
    [v11 removeObject:v4];
    v12 = [(NTKFaceSnapshotCache *)self lowPriorityRequests];
    [v12 removeObject:v4];
    v13 = [v4 completion];
    if (v13)
    {
      id v14 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v4 face];
        int v16 = 138412290;
        uint64_t v17 = v15;
        _os_log_impl(&dword_1BC5A9000, v14, OS_LOG_TYPE_DEFAULT, "Cancelling face completion callback called for %@", (uint8_t *)&v16, 0xCu);
      }
      v13[2](v13, 1, 0);
    }
  }
}

- (void)fetchSnapshotWithRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 face];
    int v16 = 138412290;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Fetch request for %@", (uint8_t *)&v16, 0xCu);
  }
  id v7 = [v4 options];
  uint64_t v8 = [v7 priority];

  uint64_t v9 = [v4 completion];
  if (v9)
  {
    v10 = [v4 face];

    if (v10)
    {
      if (v8 == 3) {
        [(NTKFaceSnapshotCache *)self highPriorityRequests];
      }
      else {
      uint64_t v11 = [(NTKFaceSnapshotCache *)self lowPriorityRequests];
      }
      [v11 addObject:v4];

      v12 = [(NTKFaceSnapshotCache *)self requestsBySnapshotKey];
      v13 = [v4 faceSnapshotKey];
      id v14 = [v12 objectForKey:v13];

      if (!v14)
      {
        id v14 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v15 = [v4 faceSnapshotKey];
        [v12 setObject:v14 forKey:v15];
      }
      [v14 addObject:v4];
      [(NTKFaceSnapshotCache *)self _serviceRequestsIfIdle];
    }
  }
}

- (void)_serviceRequestsIfIdle
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to service face requests if idle…", (uint8_t *)&v16, 2u);
  }

  id v4 = [(NTKFaceSnapshotCache *)self servicingRequest];

  if (!v4)
  {
    id v7 = [(NTKFaceSnapshotCache *)self highPriorityRequests];
    uint64_t v8 = [(NTKFaceSnapshotCache *)self lowPriorityRequests];
    uint64_t v9 = [v7 count];
    v10 = v7;
    if (v9 || (uint64_t v11 = [v8 count], v10 = v8, v11)) {
      uint64_t v5 = v10;
    }
    else {
      uint64_t v5 = 0;
    }
    v12 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v7 count];
      uint64_t v14 = [v8 count];
      int v16 = 134218240;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v14;
      _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "High/Low Priority Requests: %lu/%lu", (uint8_t *)&v16, 0x16u);
    }

    if (v5)
    {
      uint64_t v15 = [v5 firstObject];
      [v5 removeObjectAtIndex:0];
      [(NTKFaceSnapshotCache *)self setServicingRequest:v15];
      [(NTKFaceSnapshotCache *)self _attemptSnapshotForRequest:v15];
    }
    goto LABEL_14;
  }
  uint64_t v5 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NTKFaceSnapshotCache *)self servicingRequest];
    id v7 = [v6 face];
    int v16 = 138412290;
    uint64_t v17 = (uint64_t)v7;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Skipping service request because already servicing face %@", (uint8_t *)&v16, 0xCu);

LABEL_14:
  }
}

- (void)_attemptSnapshotForRequest:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 face];
  id v6 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = v5;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Attempting snapshot of face %@", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  v24 = [(NTKFaceSnapshotCache *)self callCountsByFace];
  id v7 = [v24 objectForKey:v5];
  uint64_t v8 = v7;
  if (!v7) {
    id v7 = &unk_1F16E04F8;
  }
  uint64_t v9 = [v7 unsignedIntegerValue];

  if ((unint64_t)(v9 + 1) < 3)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v24 setObject:v12 forKey:v5];

    id v11 = [v4 options];
    unint64_t v13 = [v11 priority] - 1;
    if (v13 >= 3)
    {
      int v14 = 0;
      dispatch_qos_class_t v15 = QOS_CLASS_UTILITY;
    }
    else
    {
      int v14 = dword_1BC8A0240[v13];
      dispatch_qos_class_t v15 = QOS_CLASS_USER_INITIATED;
    }
    int v16 = objc_msgSend(v11, "ntk_asDictionaryOptions");
    uint64_t v17 = _NTKFaceSnapshotCacheKeyForFace(v5);
    __int16 v18 = self->_snapshotQueue;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_2;
    v25[3] = &unk_1E62C0A60;
    id v26 = v17;
    id v27 = v5;
    id v28 = v16;
    v29 = v18;
    uint64_t v19 = v18;
    id v20 = v16;
    id v21 = v17;
    objc_copyWeak(&v31, &location);
    id v30 = v4;
    id v22 = v4;
    dispatch_block_t v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, v14, v25);
    dispatch_async(v19, v23);

    objc_destroyWeak(&v31);
  }
  else
  {
    v10 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v5;
      _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Skipping face %@ - too many failures", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke;
    block[3] = &unk_1E62C09C0;
    block[4] = self;
    id v33 = v4;
    id v11 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_destroyWeak(&location);
}

uint64_t __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invokeCallbacksMatchingRequest:*(void *)(a1 + 40) withSnapshot:0];
  [*(id *)(a1 + 32) setServicingRequest:0];
  v2 = *(void **)(a1 + 32);

  return [v2 _serviceRequestsIfIdle];
}

void __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = +[NTKFaceSnapshotClient sharedInstance];
  uint64_t v3 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Asking face client to snapshot %@ (%@)…", buf, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_37;
  v8[3] = &unk_1E62C0A38;
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 32);
  objc_copyWeak(&v13, (id *)(a1 + 72));
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 40);
  [v2 snapshotFace:v6 options:v7 completion:v8];

  objc_destroyWeak(&v13);
}

void __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_37(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_2_38;
  block[3] = &unk_1E62C0A10;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  dispatch_async(v4, block);

  objc_destroyWeak(&v11);
}

void __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_2_38(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "Client face snapshotted %@ - %@", buf, 0x16u);
  }

  id v5 = [a1[5] imageWithRenderingMode:1];
  if (NTKInternalBuild(v5, v6, v7, v8) && _os_feature_enabled_impl()) {
    _NTKFaceDebugAPLSnapshotWithBaseImage(v5);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_39;
  block[3] = &unk_1E62C09E8;
  objc_copyWeak(&v15, a1 + 8);
  id v11 = a1[6];
  id v12 = a1[4];
  id v13 = v5;
  id v14 = a1[7];
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v15);
}

void __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_39(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [WeakRetained servicingRequest];
  id v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    uint64_t v8 = _NTKFaceSnapshotCacheKeyForFace(*(void **)(a1 + 56));
    id v9 = [*(id *)(a1 + 32) faceSnapshotKey];
    int v10 = [v8 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_39_cold_1(v11);
      }
    }
    uint64_t v12 = *(void *)(a1 + 48);
    if (!v12) {
      goto LABEL_21;
    }
    int v13 = *(void *)(a1 + 40) ? v10 : 0;
    if (v13 != 1) {
      goto LABEL_21;
    }
    id v14 = objc_msgSend(WeakRetained[1], "objectForKeyedSubscript:");

    id v15 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(a1 + 48);
        *(_DWORD *)dispatch_block_t v23 = 138412546;
        *(void *)&v23[4] = v17;
        *(_WORD *)&v23[12] = 2112;
        *(void *)&v23[14] = v18;
        id v19 = "Overwriting cache %@ with %@";
LABEL_19:
        _os_log_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_DEFAULT, v19, v23, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      *(_DWORD *)dispatch_block_t v23 = 138412546;
      *(void *)&v23[4] = v20;
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[14] = v21;
      id v19 = "Stored to cache %@ with %@";
      goto LABEL_19;
    }

    id v22 = [WeakRetained snapshots];
    [v22 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];

    uint64_t v12 = *(void *)(a1 + 48);
LABEL_21:
    objc_msgSend(WeakRetained, "_invokeCallbacksMatchingRequest:withSnapshot:", *(void *)(a1 + 32), v12, *(_OWORD *)v23, *(void *)&v23[16], v24);
    [WeakRetained setServicingRequest:0];
    goto LABEL_22;
  }
  id v5 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)dispatch_block_t v23 = 138412546;
    *(void *)&v23[4] = v6;
    *(_WORD *)&v23[12] = 2112;
    *(void *)&v23[14] = v7;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Aborting callbacks because it's not the servicing face request %@ - %@", v23, 0x16u);
  }

LABEL_22:
  [WeakRetained _serviceRequestsIfIdle];
}

- (NSMutableDictionary)snapshots
{
  return self->_snapshots;
}

- (OS_dispatch_queue)snapshotQueue
{
  return self->_snapshotQueue;
}

- (NSMutableDictionary)requestsBySnapshotKey
{
  return self->_requestsBySnapshotKey;
}

- (NSMapTable)callCountsByFace
{
  return self->_callCountsByFace;
}

- (NTKFaceSnapshotCacheRequest)servicingRequest
{
  return self->_servicingRequest;
}

- (void)setServicingRequest:(id)a3
{
}

- (NSMutableOrderedSet)highPriorityRequests
{
  return self->_highPriorityRequests;
}

- (void)setHighPriorityRequests:(id)a3
{
}

- (NSMutableOrderedSet)lowPriorityRequests
{
  return self->_lowPriorityRequests;
}

- (void)setLowPriorityRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowPriorityRequests, 0);
  objc_storeStrong((id *)&self->_highPriorityRequests, 0);
  objc_storeStrong((id *)&self->_servicingRequest, 0);
  objc_storeStrong((id *)&self->_callCountsByFace, 0);
  objc_storeStrong((id *)&self->_requestsBySnapshotKey, 0);
  objc_storeStrong((id *)&self->_snapshotQueue, 0);

  objc_storeStrong((id *)&self->_snapshots, 0);
}

void __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_39_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Snapshot key changed during request!", v1, 2u);
}

@end