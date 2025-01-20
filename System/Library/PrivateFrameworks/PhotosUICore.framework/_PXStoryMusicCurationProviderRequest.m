@interface _PXStoryMusicCurationProviderRequest
- (NSArray)recentlyUsedAppleMusicSongIDs;
- (NSArray)recentlyUsedFlexSongIDs;
- (NSProgress)progress;
- (PXStoryMusicCurationProviderOptions)options;
- (PXStoryPhotoKitAssetContainer)assetContainer;
- (_PXStoryMusicCurationProviderRequest)init;
- (_PXStoryMusicCurationProviderRequest)initWithAssetContainer:(id)a3 options:(id)a4 recentlyUsedFlexSongIDs:(id)a5 recentlyUsedAppleMusicSongIDs:(id)a6 completion:(id)a7;
- (void)_handleCurationResult:(id)a3;
- (void)appendResultHandler:(id)a3;
- (void)start;
@end

@implementation _PXStoryMusicCurationProviderRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedAppleMusicSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedFlexSongIDs, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetContainer, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_resultHandlers, 0);
}

- (NSArray)recentlyUsedAppleMusicSongIDs
{
  return self->_recentlyUsedAppleMusicSongIDs;
}

- (NSArray)recentlyUsedFlexSongIDs
{
  return self->_recentlyUsedFlexSongIDs;
}

- (PXStoryMusicCurationProviderOptions)options
{
  return self->_options;
}

- (PXStoryPhotoKitAssetContainer)assetContainer
{
  return self->_assetContainer;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (void)_handleCurationResult:(id)a3
{
  id v4 = a3;
  resultHandlers = self->_resultHandlers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62___PXStoryMusicCurationProviderRequest__handleCurationResult___block_invoke;
  v7[3] = &unk_1E5DAF258;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)resultHandlers enumerateObjectsUsingBlock:v7];
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void)start
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (self->_hasStarted) {
    return;
  }
  self->_hasStarted = 1;
  v3 = [(_PXStoryMusicCurationProviderRequest *)self options];
  id v4 = [v3 categories];

  if ([v4 count]) {
    PXExists();
  }
  v5 = [(_PXStoryMusicCurationProviderRequest *)self options];
  uint64_t v43 = [v5 logContext];

  v44 = [(_PXStoryMusicCurationProviderRequest *)self assetContainer];
  PLStoryGetLog();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      v42 = [v44 identifier];
      v9 = [(_PXStoryMusicCurationProviderRequest *)self options];
      v10 = [v9 categories];
      v11 = [(_PXStoryMusicCurationProviderRequest *)self recentlyUsedAppleMusicSongIDs];
      v12 = [(_PXStoryMusicCurationProviderRequest *)self recentlyUsedFlexSongIDs];
      *(_DWORD *)buf = 134219522;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 1026;
      *(_DWORD *)v76 = 1;
      *(_WORD *)&v76[4] = 1026;
      *(_DWORD *)&v76[6] = 1;
      *(_WORD *)&v76[10] = 2114;
      *(void *)&v76[12] = v10;
      *(_WORD *)&v76[20] = 2114;
      *(void *)&v76[22] = v11;
      __int16 v77 = 2114;
      v78 = v12;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PXStoryMusicCurationProviderRequest", "Context=%{signpost.telemetry:string2}lu AssetContainer=%{signpost.description:attribute,public}@ WantsAppleMusic=%{signpost.description:attribute,public}d WantsFlexMusic=%{signpost.description:attribute,public}d Categories=%{signpost.description:attribute,public}@ RecentlyUsedAppleMusicSongIDs=%{signpost.description:attribute,public}@ RecentlyUsedFlexMusicSongIDs=%{signpost.description:attribute,public}@ ", buf, 0x40u);
    }
  }

  v13 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:0];
  v14 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)v76 = __Block_byref_object_copy__5266;
  *(void *)&v76[8] = __Block_byref_object_dispose__5267;
  *(void *)&v76[16] = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__5266;
  v69 = __Block_byref_object_dispose__5267;
  id v70 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__5266;
  v63 = __Block_byref_object_dispose__5267;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__5266;
  v57 = __Block_byref_object_dispose__5267;
  id v58 = 0;
  dispatch_group_enter(v14);
  v15 = [(_PXStoryMusicCurationProviderRequest *)self recentlyUsedAppleMusicSongIDs];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __45___PXStoryMusicCurationProviderRequest_start__block_invoke_287;
  v49[3] = &unk_1E5DAF208;
  v51 = buf;
  v52 = &v65;
  v50 = v14;
  v16 = +[PXMusicCurator requestAppleMusicCurationForAssetContainer:v44 recentlyUsedAdamIDs:v15 resultHandler:v49];

  objc_msgSend(v13, "px_appendChild:withPendingUnitCount:", v16, 50);
  v17 = +[PXMusicCurator bestLocallyAvailableAudioAssetForAssetContainer:v44];
  dispatch_group_enter(v14);
  v18 = [(_PXStoryMusicCurationProviderRequest *)self recentlyUsedFlexSongIDs];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __45___PXStoryMusicCurationProviderRequest_start__block_invoke_2_289;
  v45[3] = &unk_1E5DAF230;
  v47 = &v59;
  v48 = &v53;
  v46 = v14;
  v19 = +[PXMusicCurator requestFlexMusicCurationForAssetContainer:v44 recentlyUsedFlexSongIDs:v18 resultHandler:v45];

  objc_msgSend(v13, "px_appendChild:withPendingUnitCount:", v19, 50);
  v20 = [(_PXStoryMusicCurationProviderRequest *)self progress];
  v21 = [(_PXStoryMusicCurationProviderRequest *)self progress];
  objc_msgSend(v20, "addChild:withPendingUnitCount:", v13, objc_msgSend(v21, "totalUnitCount"));

  dispatch_time_t v22 = dispatch_time(0, 30000000000);
  intptr_t v23 = dispatch_group_wait(v14, v22);
  intptr_t v24 = v23;
  v25 = (void *)v66[5];
  if (v25 || (v25 = (void *)v54[5]) != 0)
  {
    id v26 = v25;
    if (v24)
    {
LABEL_10:
      v27 = PLStoryGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = [v44 identifier];
        *(_DWORD *)v71 = 138412546;
        uint64_t v72 = (uint64_t)v28;
        __int16 v73 = 2112;
        id v74 = v26;
        _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurationManager) Music curation for asset container (%@) timed out with error %@", v71, 0x16u);
      }
      uint64_t v34 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(5, v26, @"Music curation timed out.", v29, v30, v31, v32, v33, v41);

      id v26 = (id)v34;
    }
  }
  else
  {
    id v26 = 0;
    if (v23) {
      goto LABEL_10;
    }
  }
  v35 = [PXMusicCurationConcreteResult alloc];
  v36 = [(PXMusicCurationConcreteResult *)v35 initWithAppleMusicCuration:*(void *)(*(void *)&buf[8] + 40) flexMusicCuration:v60[5] fallbackAsset:v17 requestedCategories:v4 error:v26];
  PLStoryGetLog();
  v37 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v38 = os_signpost_id_make_with_pointer(v37, self);
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v39 = v38;
    if (os_signpost_enabled(v37))
    {
      v40 = [(PXMusicCurationConcreteResult *)v36 description];
      *(_DWORD *)v71 = 134218242;
      uint64_t v72 = v43;
      __int16 v73 = 2114;
      id v74 = v40;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v37, OS_SIGNPOST_INTERVAL_END, v39, "PXStoryMusicCurationProviderRequest", "Context=%{signpost.telemetry:string2}lu Result=%{signpost.description:attribute,public}@", v71, 0x16u);
    }
  }

  [(_PXStoryMusicCurationProviderRequest *)self _handleCurationResult:v36];
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(buf, 8);
}

- (void)appendResultHandler:(id)a3
{
  resultHandlers = self->_resultHandlers;
  id v5 = (id)[a3 copy];
  id v4 = _Block_copy(v5);
  [(NSMutableArray *)resultHandlers addObject:v4];
}

- (_PXStoryMusicCurationProviderRequest)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPhotoKitMusicCurationProvider.m", 348, @"%s is not available as initializer", "-[_PXStoryMusicCurationProviderRequest init]");

  abort();
}

- (_PXStoryMusicCurationProviderRequest)initWithAssetContainer:(id)a3 options:(id)a4 recentlyUsedFlexSongIDs:(id)a5 recentlyUsedAppleMusicSongIDs:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v33.receiver = self;
  v33.super_class = (Class)_PXStoryMusicCurationProviderRequest;
  v18 = [(_PXStoryMusicCurationProviderRequest *)&v33 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_assetContainer, a3);
    uint64_t v20 = [v14 copy];
    options = v19->_options;
    v19->_options = (PXStoryMusicCurationProviderOptions *)v20;

    uint64_t v22 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    progress = v19->_progress;
    v19->_progress = (NSProgress *)v22;

    intptr_t v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    resultHandlers = v19->_resultHandlers;
    v19->_resultHandlers = v24;

    uint64_t v26 = [v15 copy];
    recentlyUsedFlexSongIDs = v19->_recentlyUsedFlexSongIDs;
    v19->_recentlyUsedFlexSongIDs = (NSArray *)v26;

    uint64_t v28 = [v16 copy];
    recentlyUsedAppleMusicSongIDs = v19->_recentlyUsedAppleMusicSongIDs;
    v19->_recentlyUsedAppleMusicSongIDs = (NSArray *)v28;

    uint64_t v30 = [v17 copy];
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = (id)v30;
  }
  return v19;
}

@end