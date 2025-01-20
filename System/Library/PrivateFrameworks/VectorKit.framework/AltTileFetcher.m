@interface AltTileFetcher
- (AltTileFetcher)initWithToken:(id)a3;
- (id).cxx_construct;
- (uint64_t)getJobForKey:(uint64_t)a1@<X0>;
- (uint64_t)reportCorruptTile:(uint64_t)a1;
- (void)cancelJob:(void *)a3;
- (void)cancelRequests;
- (void)fetchDataForJob:(void *)a3;
- (void)purgeExpired:(double)a3;
- (void)updateJobPriority:(void *)a3;
@end

@implementation AltTileFetcher

- (id).cxx_construct
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  self->_vectorTileDecoder._vptr$_retain_ptr = (void **)&unk_1EF5598F8;
  self->_vectorTileDecoder._obj = 0;
  self->_auditToken._vptr$_retain_ptr = (void **)&unk_1EF559AF8;
  self->_auditToken._obj = 0;
  self->_keyToJobMap.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_keyToJobMap.__table_.__p1_.__value_.__next_ = 0u;
  self->_keyToJobMap.__table_.__p3_.__value_ = 1.0;
  self->_mutex.mMutex = 0;
  pthread_mutexattr_init(&v3);
  pthread_mutexattr_settype(&v3, 2);
  operator new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileLoaderClientIdentifier, 0);
  pthread_mutex_destroy((pthread_mutex_t *)self->_mutex.mMutex);
  mMutex = self->_mutex.mMutex;
  if (mMutex) {
    MEMORY[0x1A6239270](mMutex, 0x1000C40FA0F61DDLL);
  }
  self->_mutex.mMutex = 0;
  next = self->_keyToJobMap.__table_.__p1_.__value_.__next_;
  while (next)
  {
    v5 = next;
    next = (void *)*next;
    v6 = (std::__shared_weak_count *)v5[5];
    if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    operator delete(v5);
  }
  value = self->_keyToJobMap.__table_.__bucket_list_.__ptr_.__value_;
  self->_keyToJobMap.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  self->_auditToken._vptr$_retain_ptr = (void **)&unk_1EF559AF8;

  self->_vectorTileDecoder._vptr$_retain_ptr = (void **)&unk_1EF5598F8;
  objc_storeStrong((id *)&self->_geoTileLoader, 0);
}

- (void)purgeExpired:(double)a3
{
  geoTileLoader = self->_geoTileLoader;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__AltTileFetcher_purgeExpired___block_invoke;
  v4[3] = &__block_descriptor_40_e723_B24__0r___GEOTileKey_b7b1_____GEOStandardTileKey_b40b6b26b26b14b4b4___GEOGloriaQuadIDTileKey_b6b64b14b4______b10b10b12_I____GEORegionalResourceKey_b32b8b6b8b8b1b57___GEOSputnikMetadataKey_b32b24b14b8b42___GEOFlyoverKey_b6b26b26b8b24b14b8b8___GEOTransitLineSelectionKey_b6b25b25b64___GEOPolygonSelectionKey_b6b25b25b64___GEORoadSelectionKey_b6b25b25b64___GEOContourLinesKey_b6b26b26b4b8b50___GEOTileOverlayKey_b6b26b26b8b32b16b6___GEOIdentifiedResourceKey_QCCb1b39___GEOMuninMeshKey_b64b32b16b5b3___GEOVisualLocalizationTrackKey_SCb16b6b26b26b22___GEOVisualLocalizationMetadataKey_b6b9b25b6b26b26b22___GEOVisualLocalizationDataKey_QCb5b21b21b1___GEOS2TileKey_b6b26b26b3b14b4b4b37___GEOLiveTileKey_b6b26b26b14b4b4b4b36___8d16l;
  *(double *)&v4[4] = a3;
  [(GEOTileLoader *)geoTileLoader expireTilesWithPredicate:v4];
}

BOOL __31__AltTileFetcher_purgeExpired___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  return (*(unsigned char *)a2 & 0x7F) == 0x14
      && (((unint64_t)*(unsigned __int16 *)(a2 + 13) << 32) & 0xFFFC00000000) == 0x3000000000
      && *(double *)(a1 + 32) < a3;
}

- (uint64_t)reportCorruptTile:(uint64_t)a1
{
  return objc_msgSend(*(id *)(a1 + 8), "reportCorruptTile:");
}

- (void)cancelRequests
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex.mMutex);
  if (self->_numDownloads)
  {
    for (i = self->_keyToJobMap.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
    {
      (*(void (**)(void))(*(void *)i[4] + 16))(i[4]);
      --self->_numDownloads;
    }
    [(GEOTileLoader *)self->_geoTileLoader cancelAllForClient:self->_tileLoaderClientIdentifier];
    if (self->_keyToJobMap.__table_.__p2_.__value_)
    {
      next = self->_keyToJobMap.__table_.__p1_.__value_.__next_;
      while (next)
      {
        v5 = next;
        next = (void *)*next;
        v6 = (std::__shared_weak_count *)v5[5];
        if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
        operator delete(v5);
      }
      self->_keyToJobMap.__table_.__p1_.__value_.__next_ = 0;
      unint64_t value = self->_keyToJobMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (uint64_t j = 0; j != value; ++j)
          self->_keyToJobMap.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
      }
      self->_keyToJobMap.__table_.__p2_.__value_ = 0;
    }
  }
  mMutex = (pthread_mutex_t *)self->_mutex.mMutex;
  pthread_mutex_unlock(mMutex);
}

- (void)updateJobPriority:(void *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(MEMORY[0x1E4F64AC8], "modernLoader", *(void *)(*(void *)a3 + 216), *(void *)(*(void *)a3 + 224));
  tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
  uint64_t v7 = atomic_load((unsigned int *)(*(void *)a3 + 16));
  [v5 reprioritizeKey:&v8 forClient:tileLoaderClientIdentifier newPriority:v7];
}

- (void)cancelJob:(void *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)(*(void *)a3 + 216);
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex.mMutex);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F64AC8], "modernLoader", v5);
  [v4 cancelKey:&v5 forClient:self->_tileLoaderClientIdentifier];

  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex.mMutex);
}

- (void)fetchDataForJob:(void *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)a3;
  long long v25 = *(_OWORD *)(*(void *)a3 + 216);
  pthread_mutex_lock(*(pthread_mutex_t **)(v5 + 152));
  int v6 = *(_DWORD *)(v5 + 160);
  pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 152));
  if ((v6 & 1) == 0)
  {
    pthread_mutex_lock((pthread_mutex_t *)self->_mutex.mMutex);
    if (std::__hash_table<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyHashFunc,GEOTileKeyEqualsFunc,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyEqualsFunc,GEOTileKeyHashFunc,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>>>::find<_GEOTileKey>(&self->_keyToJobMap.__table_.__bucket_list_.__ptr_.__value_))
    {
      v24 = &v25;
      uint64_t v7 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyHashFunc,GEOTileKeyEqualsFunc,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyEqualsFunc,GEOTileKeyHashFunc,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((uint64_t *)&self->_keyToJobMap, (uint64_t)&v25, &v24)[4];
      uint64_t v8 = *(void *)a3;
      while (1)
      {
        uint64_t v9 = v7;
        uint64_t v7 = *(void *)(v7 + 272);
        if (v7 == v8) {
          break;
        }
        if (!v7)
        {
          uint64_t v10 = *((void *)a3 + 1);
          if (v10) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
          }
          v11 = *(std::__shared_weak_count **)(v9 + 280);
          *(void *)(v9 + 272) = v8;
          *(void *)(v9 + 280) = v10;
          if (v11)
          {
            if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
              std::__shared_weak_count::__release_weak(v11);
            }
          }
          break;
        }
      }
      pthread_mutex_unlock((pthread_mutex_t *)self->_mutex.mMutex);
    }
    else
    {
      v24 = &v25;
      v12 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyHashFunc,GEOTileKeyEqualsFunc,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyEqualsFunc,GEOTileKeyHashFunc,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((uint64_t *)&self->_keyToJobMap, (uint64_t)&v25, &v24);
      uint64_t v14 = *(void *)a3;
      uint64_t v13 = *((void *)a3 + 1);
      if (v13) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
      }
      v15 = (std::__shared_weak_count *)v12[5];
      v12[4] = v14;
      v12[5] = v13;
      if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
      ++self->_numDownloads;
      pthread_mutex_unlock((pthread_mutex_t *)self->_mutex.mMutex);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __34__AltTileFetcher_fetchDataForJob___block_invoke;
      v23[3] = &unk_1E5A93C70;
      v23[4] = self;
      v16 = (void *)MEMORY[0x1A6239EB0](v23);
      v17 = [MEMORY[0x1E4F64AC8] modernLoader];
      uint64_t v18 = atomic_load((unsigned int *)(*(void *)a3 + 16));
      tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
      uint64_t v20 = qos_class_self();
      obuint64_t j = self->_auditToken._obj;
      v22 = dispatch_get_global_queue(0, 0);
      [v17 loadKey:&v25 priority:v18 forClient:tileLoaderClientIdentifier options:3 reason:1 qos:v20 signpostID:0 auditToken:obj callbackQ:v22 beginNetwork:0 callback:v16];
    }
  }
}

void __34__AltTileFetcher_fetchDataForJob___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 decodedRepresentation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v11;
  }
  else
  {
    id v45 = v11;
    v15 = [v10 readDataWithError:&v45];
    id v14 = v45;

    LOBYTE(v43) = 1;
    if ([*(id *)(*(void *)(a1 + 32) + 24) canDecodeTile:a2 quickly:&v43])
    {
      uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 24) decodeTile:v15 forKey:a2];

      uint64_t v13 = v16;
    }
    else if (!v13)
    {
      uint64_t v13 = v15;
    }
  }
  v43 = 0;
  v44 = 0;
  uint64_t v17 = *(void *)(a1 + 32);
  pthread_mutex_lock(*(pthread_mutex_t **)(v17 + 104));
  uint64_t v18 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyHashFunc,GEOTileKeyEqualsFunc,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyEqualsFunc,GEOTileKeyHashFunc,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>>>::find<_GEOTileKey>((void *)(*(void *)(a1 + 32) + 64));
  v19 = v18;
  if (v18)
  {
    v21 = (altitude::GeoServicesLoadJob *)v18[4];
    uint64_t v20 = (std::__shared_weak_count *)v18[5];
    if (v20) {
      atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v43 = v21;
    v44 = v20;
    v22 = *(void **)(a1 + 32);
    int8x8_t v23 = (int8x8_t)v22[9];
    unint64_t v24 = v18[1];
    uint8x8_t v25 = (uint8x8_t)vcnt_s8(v23);
    v25.i16[0] = vaddlv_u8(v25);
    if (v25.u32[0] > 1uLL)
    {
      if (v24 >= *(void *)&v23) {
        v24 %= *(void *)&v23;
      }
    }
    else
    {
      v24 &= *(void *)&v23 - 1;
    }
    uint64_t v26 = v22[8];
    v27 = *(void **)(v26 + 8 * v24);
    do
    {
      v28 = v27;
      v27 = (void *)*v27;
    }
    while (v27 != v18);
    if (v28 == v22 + 10) {
      goto LABEL_28;
    }
    unint64_t v29 = v28[1];
    if (v25.u32[0] > 1uLL)
    {
      if (v29 >= *(void *)&v23) {
        v29 %= *(void *)&v23;
      }
    }
    else
    {
      v29 &= *(void *)&v23 - 1;
    }
    if (v29 != v24)
    {
LABEL_28:
      if (!*v18) {
        goto LABEL_29;
      }
      unint64_t v30 = *(void *)(*v18 + 8);
      if (v25.u32[0] > 1uLL)
      {
        if (v30 >= *(void *)&v23) {
          v30 %= *(void *)&v23;
        }
      }
      else
      {
        v30 &= *(void *)&v23 - 1;
      }
      if (v30 != v24) {
LABEL_29:
      }
        *(void *)(v26 + 8 * v24) = 0;
    }
    uint64_t v31 = *v18;
    if (*v18)
    {
      unint64_t v32 = *(void *)(v31 + 8);
      if (v25.u32[0] > 1uLL)
      {
        if (v32 >= *(void *)&v23) {
          v32 %= *(void *)&v23;
        }
      }
      else
      {
        v32 &= *(void *)&v23 - 1;
      }
      if (v32 != v24)
      {
        *(void *)(v22[8] + 8 * v32) = v28;
        uint64_t v31 = *v18;
      }
    }
    void *v28 = v31;
    *uint64_t v18 = 0;
    --v22[11];
    v33 = (std::__shared_weak_count *)v18[5];
    if (v33 && !atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
    operator delete(v19);
    --*(_DWORD *)(*(void *)(a1 + 32) + 112);
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(v17 + 104));
  if (v14)
  {
    if ([v14 code] != -2) {
      goto LABEL_52;
    }
    v34 = [v14 domain];
    v35 = GEOErrorDomain();
    if (([v34 isEqualToString:v35] & 1) == 0)
    {

      goto LABEL_52;
    }
    v36 = v43;
    if (v43)
    {
      pthread_mutex_lock(*((pthread_mutex_t **)v43 + 19));
      int v37 = *((_DWORD *)v36 + 40);
      pthread_mutex_unlock(*((pthread_mutex_t **)v36 + 19));

      if ((v37 & 2) != 0)
      {
LABEL_53:
        pthread_mutex_lock(*((pthread_mutex_t **)v36 + 19));
        int v42 = *((_DWORD *)v36 + 40);
        pthread_mutex_unlock(*((pthread_mutex_t **)v36 + 19));
        if ((v42 & 2) == 0) {
          (*(void (**)(altitude::GeoServicesLoadJob *))(*(void *)v36 + 16))(v36);
        }
LABEL_55:
        v40 = v44;
        if (!v44) {
          goto LABEL_58;
        }
        goto LABEL_56;
      }
LABEL_52:
      v41 = GEOStringFromTileKey();
      NSLog((NSString *)@"Download failed: %@ Error: %@", v41, v14);

      v36 = v43;
      if (!v43) {
        goto LABEL_55;
      }
      goto LABEL_53;
    }

    v40 = v44;
    if (!v44) {
      goto LABEL_58;
    }
  }
  else
  {
    if (!v43) {
      goto LABEL_55;
    }
    altitude::GeoServicesLoadJob::setData(v43, v13);
    v38 = v43;
    pthread_mutex_lock(*((pthread_mutex_t **)v43 + 19));
    int v39 = *((_DWORD *)v38 + 40);
    pthread_mutex_unlock(*((pthread_mutex_t **)v38 + 19));
    if (v39) {
      goto LABEL_55;
    }
    karo::Job::step(v38);
    v40 = v44;
    if (!v44) {
      goto LABEL_58;
    }
  }
LABEL_56:
  if (!atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
    std::__shared_weak_count::__release_weak(v40);
  }
LABEL_58:
}

- (uint64_t)getJobForKey:(uint64_t)a1@<X0>
{
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 104));
  uint64_t v4 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyHashFunc,GEOTileKeyEqualsFunc,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>,GEOTileKeyEqualsFunc,GEOTileKeyHashFunc,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::shared_ptr<altitude::GeoServicesLoadJob>>>>::find<_GEOTileKey>((void *)(a1 + 64));
  if (v4)
  {
    uint64_t v5 = v4[5];
    *a2 = v4[4];
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  int v6 = *(pthread_mutex_t **)(a1 + 104);
  return pthread_mutex_unlock(v6);
}

- (AltTileFetcher)initWithToken:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AltTileFetcher;
  uint64_t v5 = [(AltTileFetcher *)&v18 init];
  uint64_t v6 = [MEMORY[0x1E4F64AC8] modernLoader];
  geoTileLoader = v5->_geoTileLoader;
  v5->_geoTileLoader = (GEOTileLoader *)v6;

  v5->_numDownloads = 0;
  uint64_t v8 = GEOTileLoaderClientIdentifier();
  uint64_t v9 = [v8 copy];
  tileLoaderClientIdentifier = v5->_tileLoaderClientIdentifier;
  v5->_tileLoaderClientIdentifier = (NSString *)v9;

  id v17 = objc_alloc_init(MEMORY[0x1E4F64BA8]);
  objc_storeStrong((id *)&v5->_vectorTileDecoder._obj, v17);
  id v11 = v17;

  id v12 = (GEOApplicationAuditToken *)v4;
  uint64_t v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  obuint64_t j = v5->_auditToken._obj;
  v5->_auditToken._obuint64_t j = v13;

  return v5;
}

@end