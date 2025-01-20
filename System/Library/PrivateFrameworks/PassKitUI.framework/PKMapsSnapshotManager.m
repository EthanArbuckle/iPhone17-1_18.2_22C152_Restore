@interface PKMapsSnapshotManager
- (PKMapsSnapshotManager)init;
- (id)_iconForCacheKey:(id)a3;
- (id)_iconFromDiskForCacheKey:(id)a3;
- (id)placeholderWithTraitCollection:(id)a3 completion:(id)a4;
- (id)snapshotForDisplayRegion:(id *)a3 size:(CGSize)a4 traitCollection:(id)a5 completion:(id)a6;
- (void)_processNextRequest;
@end

@implementation PKMapsSnapshotManager

- (PKMapsSnapshotManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)PKMapsSnapshotManager;
  v2 = [(PKMapsSnapshotManager *)&v22 init];
  if (v2)
  {
    uint64_t v3 = PKMapsSnapshotsCacheURL();
    cacheURL = v2->_cacheURL;
    v2->_cacheURL = (NSURL *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    snapshotCache = v2->_snapshotCache;
    v2->_snapshotCache = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    snapshotCacheKeys = v2->_snapshotCacheKeys;
    v2->_snapshotCacheKeys = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    snapshotsKeysToPerform = v2->_snapshotsKeysToPerform;
    v2->_snapshotsKeysToPerform = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    snapshotOptionsByKey = v2->_snapshotOptionsByKey;
    v2->_snapshotOptionsByKey = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionBlockByKey = v2->_completionBlockByKey;
    v2->_completionBlockByKey = v15;

    v2->_fileLock._os_unfair_lock_opaque = 0;
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(v17, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.passkitui.mapsnapshotter", v18);
    snapshotQueue = v2->_snapshotQueue;
    v2->_snapshotQueue = (OS_dispatch_queue *)v19;

    os_unfair_lock_lock(&v2->_fileLock);
    [(NSFileManager *)v2->_fileManager createDirectoryAtURL:v2->_cacheURL withIntermediateDirectories:1 attributes:0 error:0];
    os_unfair_lock_unlock(&v2->_fileLock);
  }
  return v2;
}

- (id)placeholderWithTraitCollection:(id)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = *MEMORY[0x1E4F1E750];
  double v8 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PKMapsSnapshotManager_placeholderWithTraitCollection_completion___block_invoke;
  v12[3] = &unk_1E59D6408;
  id v13 = v6;
  id v9 = v6;
  v10 = -[PKMapsSnapshotManager snapshotForDisplayRegion:size:traitCollection:completion:](self, "snapshotForDisplayRegion:size:traitCollection:completion:", a3, v12, v7, v8, 0.0, 0.0, 100.0, 100.0);

  return v10;
}

uint64_t __67__PKMapsSnapshotManager_placeholderWithTraitCollection_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)snapshotForDisplayRegion:(id *)a3 size:(CGSize)a4 traitCollection:(id)a5 completion:(id)a6
{
  v11 = v9;
  v12 = v8;
  id v13 = v7;
  v14 = v6;
  double height = a4.height;
  double width = a4.width;
  v18 = a3;
  id v19 = a5;
  objc_initWeak(location, self);
  v55.latitude = width;
  v55.longitude = height;
  BOOL v20 = CLLocationCoordinate2DIsValid(v55);
  v21 = NSString;
  uint64_t v22 = [($987839895DD992B6B168348548CE6C1A *)v18 userInterfaceStyle];
  double v23 = *MEMORY[0x1E4F1E750];
  double v24 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  if (v20)
  {
    double v23 = width;
    double v24 = height;
  }
  v25 = [v21 stringWithFormat:@"%.7f-%.7f-%.7f-%.7f-%.2f-%.2f-%ld", *(void *)&v23, *(void *)&v24, v14, v13, v12, v11, v22];
  v26 = [v25 dataUsingEncoding:4];
  v27 = [v26 fileSafeBase64Encoding];

  v28 = [(PKMapsSnapshotManager *)self _iconForCacheKey:v27];
  if (v28)
  {
    id v29 = v28;
  }
  else
  {
    v30 = [(PKMapsSnapshotManager *)self _iconFromDiskForCacheKey:v27];
    if (v30)
    {
      os_unfair_lock_lock(&self->_cacheLock);
      [(NSMutableArray *)self->_snapshotCacheKeys addObject:v27];
      [(NSMutableDictionary *)self->_snapshotCache setObject:v30 forKey:v27];
      os_unfair_lock_unlock(&self->_cacheLock);
    }
    else
    {
      if (!v20) {
        goto LABEL_14;
      }
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke;
      v49[3] = &unk_1E59D6430;
      objc_copyWeak(&v52, location);
      id v50 = v27;
      id v51 = v19;
      v30 = [(PKMapsSnapshotManager *)self placeholderWithTraitCollection:v18 completion:v49];

      objc_destroyWeak(&v52);
      if (!v30)
      {
LABEL_14:
        v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", *(double *)&v12, *(double *)&v11);
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke_2;
        v48[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
        v48[4] = v12;
        v48[5] = v11;
        v30 = [v32 imageWithActions:v48];
      }
      if (v19)
      {
        p_cacheLock = &self->_cacheLock;
        os_unfair_lock_lock(&self->_cacheLock);
        v34 = [(NSMutableDictionary *)self->_completionBlockByKey objectForKey:v27];
        if (v34)
        {
          v35 = _Block_copy(v19);
          [v34 addObject:v35];

          os_unfair_lock_unlock(p_cacheLock);
          id v36 = v30;
        }
        else
        {
          BOOL v37 = !v20;
          os_unfair_lock_unlock(&self->_cacheLock);
          snapshotQueue = self->_snapshotQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke_3;
          block[3] = &unk_1E59D6478;
          objc_copyWeak(v46, location);
          v46[1] = v12;
          v46[2] = v11;
          v39 = v18;
          BOOL v47 = v37;
          v46[3] = *(id *)&width;
          v46[4] = *(id *)&height;
          v46[5] = v14;
          v46[6] = v13;
          v42 = v39;
          v43 = self;
          id v44 = v27;
          id v45 = v19;
          dispatch_async(snapshotQueue, block);
          id v40 = v30;

          objc_destroyWeak(v46);
        }

        goto LABEL_9;
      }
    }
    id v29 = v30;
  }
  v30 = v29;
LABEL_9:

  objc_destroyWeak(location);

  return v30;
}

void __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 17);
    uint64_t v5 = [*(id *)&v4[10]._os_unfair_lock_opaque objectForKey:*(void *)(a1 + 32)];

    os_unfair_lock_unlock(v4 + 17);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6) {
        (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v7, 0);
      }
    }
  }
}

void __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a2;
  v4 = [v3 secondarySystemBackgroundColor];
  [v4 setFill];

  objc_msgSend(v5, "fillRect:", 0.0, 0.0, *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __82__PKMapsSnapshotManager_snapshotForDisplayRegion_size_traitCollection_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F30F40]);
    [v3 setShowsBuildings:1];
    [v3 _setShowsVenues:0];
    [v3 _setShowsPointLabels:0];
    v4 = [MEMORY[0x1E4F30FE0] filterExcludingAllCategories];
    [v3 setPointOfInterestFilter:v4];

    objc_msgSend(v3, "setSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    [v3 setTraitCollection:*(void *)(a1 + 32)];
    if (*(unsigned char *)(a1 + 120))
    {
      [v3 setMapType:105];
    }
    else
    {
      double v5 = *(double *)(a1 + 104);
      double v6 = *(double *)(a1 + 112);
      [v3 setMapType:0];
      objc_msgSend(v3, "setRegion:", *(double *)(a1 + 88), *(double *)(a1 + 96), v5, v6);
    }
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 17);
    id v7 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:*(void *)(a1 + 48)];
    if (v7)
    {
      double v8 = _Block_copy(*(const void **)(a1 + 56));
      [v7 addObject:v8];

      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 17);
    }
    else
    {
      uint64_t v9 = [*((id *)WeakRetained + 3) count];
      [*((id *)WeakRetained + 3) addObject:*(void *)(a1 + 48)];
      [*((id *)WeakRetained + 4) setObject:v3 forKey:*(void *)(a1 + 48)];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v11 = _Block_copy(*(const void **)(a1 + 56));
      [v10 addObject:v11];

      [*((id *)WeakRetained + 5) setObject:v10 forKey:*(void *)(a1 + 48)];
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 17);
      if (!v9)
      {
        [WeakRetained _processNextRequest];
LABEL_11:

        goto LABEL_12;
      }
    }
    v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Queued snapshot for %@", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)_processNextRequest
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v4 = [(NSMutableArray *)self->_snapshotsKeysToPerform firstObject];
  double v5 = [(NSMutableDictionary *)self->_snapshotOptionsByKey objectForKey:v4];
  os_unfair_lock_unlock(p_cacheLock);
  if (v4)
  {
    double v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Getting snapshot for %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F30F48]) initWithOptions:v5];
    snapshotQueue = self->_snapshotQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__PKMapsSnapshotManager__processNextRequest__block_invoke;
    v10[3] = &unk_1E59D64A0;
    v10[4] = self;
    objc_copyWeak(&v14, (id *)buf);
    id v11 = v5;
    id v12 = v4;
    id v9 = v7;
    id v13 = v9;
    [v9 startWithQueue:snapshotQueue completionHandler:v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __44__PKMapsSnapshotManager__processNextRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__PKMapsSnapshotManager__processNextRequest__block_invoke_2;
  v10[3] = &unk_1E59D10E8;
  objc_copyWeak(&v16, (id *)(a1 + 64));
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  id v15 = *(id *)(a1 + 56);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v16);
}

void __44__PKMapsSnapshotManager__processNextRequest__block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained) {
    goto LABEL_15;
  }
  id v3 = [*(id *)(a1 + 32) image];
  if (v3)
  {
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Snapshot completed for %@", buf, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 18);
    id v6 = [*((id *)WeakRetained + 1) URLByAppendingPathComponent:*(void *)(a1 + 48)];
    id v7 = [v6 URLByAppendingPathExtension:@"png"];

    id v8 = UIImagePNGRepresentation(v3);
    [v8 writeToURL:v7 atomically:1];

    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 18);
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 17);
    [*((id *)WeakRetained + 6) addObject:*(void *)(a1 + 48)];
    [*((id *)WeakRetained + 7) setObject:v3 forKey:*(void *)(a1 + 48)];
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 17);
  }
  else
  {
    if (!*(void *)(a1 + 56)) {
      goto LABEL_7;
    }
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v17;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Could not get snapshot for %@", buf, 0xCu);
    }
  }

LABEL_7:
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 17);
  id v9 = [*((id *)WeakRetained + 5) objectForKey:*(void *)(a1 + 48)];
  [*((id *)WeakRetained + 3) removeObjectAtIndex:0];
  [*((id *)WeakRetained + 4) removeObjectForKey:*(void *)(a1 + 48)];
  [*((id *)WeakRetained + 5) removeObjectForKey:*(void *)(a1 + 48)];
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 17);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    id v14 = MEMORY[0x1E4F14428];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __44__PKMapsSnapshotManager__processNextRequest__block_invoke_35;
        v18[3] = &unk_1E59CAD68;
        uint64_t v20 = v16;
        id v19 = v3;
        dispatch_async(v14, v18);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [WeakRetained _processNextRequest];
LABEL_15:
}

uint64_t __44__PKMapsSnapshotManager__processNextRequest__block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_iconForCacheKey:(id)a3
{
  if (a3)
  {
    p_cacheLock = &self->_cacheLock;
    id v5 = a3;
    os_unfair_lock_lock(p_cacheLock);
    id v6 = [(NSMutableDictionary *)self->_snapshotCache objectForKey:v5];
    [(NSMutableArray *)self->_snapshotCacheKeys removeObject:v5];
    [(NSMutableArray *)self->_snapshotCacheKeys addObject:v5];

    if ((unint64_t)[(NSMutableArray *)self->_snapshotCacheKeys count] >= 0x33)
    {
      id v7 = [(NSMutableArray *)self->_snapshotCacheKeys firstObject];
      [(NSMutableArray *)self->_snapshotCacheKeys removeObject:v7];
      [(NSMutableDictionary *)self->_snapshotCache removeObjectForKey:v7];
    }
    os_unfair_lock_unlock(p_cacheLock);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_iconFromDiskForCacheKey:(id)a3
{
  v4 = [(NSURL *)self->_cacheURL URLByAppendingPathComponent:a3];
  id v5 = [v4 URLByAppendingPathExtension:@"png"];

  id v6 = [v5 path];
  p_fileLock = &self->_fileLock;
  os_unfair_lock_lock(&self->_fileLock);
  if ([(NSFileManager *)self->_fileManager fileExistsAtPath:v6])
  {
    id v8 = [(NSFileManager *)self->_fileManager attributesOfItemAtPath:v6 error:0];
    id v9 = [v8 objectForKey:*MEMORY[0x1E4F282C0]];
    id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
    if (v9 && [v9 compare:v10] == -1)
    {
      [(NSFileManager *)self->_fileManager removeItemAtURL:v5 error:0];
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4FB1818] imageWithContentsOfFile:v6];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  os_unfair_lock_unlock(p_fileLock);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_snapshotCacheKeys, 0);
  objc_storeStrong((id *)&self->_completionBlockByKey, 0);
  objc_storeStrong((id *)&self->_snapshotOptionsByKey, 0);
  objc_storeStrong((id *)&self->_snapshotsKeysToPerform, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);

  objc_storeStrong((id *)&self->_cacheURL, 0);
}

@end