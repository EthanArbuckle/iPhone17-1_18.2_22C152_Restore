@interface PXStoryDefaultSongsProducer
- (OS_os_log)log;
- (PXStoryDefaultSongsProducer)init;
- (PXStoryDefaultSongsProducer)initWithAssetContainer:(id)a3 configuration:(id)a4 curationProvider:(id)a5;
- (PXStoryPhotoKitAssetContainer)assetContainer;
- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4;
- (unint64_t)logContext;
- (void)_handleAppleMusicCapabilityStatus:(int64_t)a3 error:(id)a4 curationResult:(id)a5 resultHandler:(id)a6;
- (void)_handleMusicCurationResult:(id)a3 signpostID:(unint64_t)a4 resultHandler:(id)a5;
- (void)setLogContext:(unint64_t)a3;
@end

@implementation PXStoryDefaultSongsProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_assetContainer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_curationProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (OS_os_log)log
{
  return self->_log;
}

- (PXStoryPhotoKitAssetContainer)assetContainer
{
  return self->_assetContainer;
}

- (void)setLogContext:(unint64_t)a3
{
  self->logContext = a3;
}

- (unint64_t)logContext
{
  return self->logContext;
}

- (void)_handleAppleMusicCapabilityStatus:(int64_t)a3 error:(id)a4 curationResult:(id)a5 resultHandler:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  v11 = PLStoryGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v58 = v9;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_INFO, "Received Music curation result: %@", buf, 0xCu);
  }

  v12 = [v9 error];
  v13 = [v9 songsByCategory];
  v14 = [v13 objectForKeyedSubscript:@"AppleMusicBest"];

  v15 = [v9 songsByCategory];
  v16 = [v15 objectForKeyedSubscript:@"FlexMusicBest"];

  id v17 = v14;
  id v18 = v17;
  if ([(PXStoryConfiguration *)self->_configuration shouldForceUsingFlexMusic])
  {
    v19 = PLStoryGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_INFO, "[LemMusic][ForceFlex] Force bestSuggestions music to Flex.", buf, 2u);
    }

    id v18 = v16;
  }
  v20 = [v9 songsByCategory];
  v21 = [v20 objectForKeyedSubscript:@"FlexMusicFallback"];

  uint64_t v22 = [v18 count];
  v53 = v16;
  v54 = (void (**)(void, void))v10;
  v52 = v17;
  if (a3 == 1 && v22)
  {
    id v23 = v16;

    if ([v23 count])
    {
      v24 = @"com.apple.photos.memory.interactiveMemoryMusicUsedAppleMusic";
      v21 = v23;
LABEL_22:
      id v26 = v18;
      goto LABEL_23;
    }
    v32 = [v9 songsByCategory];
    v21 = [v32 objectForKeyedSubscript:@"FlexMusicFallback"];

    v24 = @"com.apple.photos.memory.interactiveMemoryMusicUsedAppleMusic";
LABEL_21:

    goto LABEL_22;
  }
  if (a3 != 1)
  {
    v25 = PLStoryGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_INFO, "Declining Apple Music curated result because Apple Music is not playable for this user.", buf, 2u);
    }
  }
  id v26 = v16;

  if ([v26 count])
  {
    v24 = @"com.apple.photos.memory.interactiveMemoryMusicUsedFlexMusic";
  }
  else
  {
    v32 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(5, v12, @"No usable curation results found for Apple Music or Flex Music. Falling back to best local Flex Music track.", v27, v28, v29, v30, v31, v50);

    v33 = [v9 songsByCategory];
    id v18 = [v33 objectForKeyedSubscript:@"FlexMusicFallback"];

    if (![v18 count])
    {
      v12 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(5, v32, @"Full music curation failed, and no fallback track could be found.", v34, v35, v36, v37, v38, v51);
      v24 = @"com.apple.photos.memory.interactiveMemoryMusicFellBackToLocalFlexSong";
      goto LABEL_21;
    }
    v24 = @"com.apple.photos.memory.interactiveMemoryMusicFellBackToLocalFlexSong";
    id v26 = v18;
    v12 = v32;
  }
LABEL_23:
  id v39 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v55 = *MEMORY[0x1E4F56560];
  v40 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v40);
  v56 = v41;
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  v43 = (void *)[v39 initWithDictionary:v42];

  v44 = [(PXStoryDefaultSongsProducer *)self assetContainer];
  v45 = [v44 container];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v46 = v45;
  }
  else {
    id v46 = 0;
  }

  [v43 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F56548]];
  [v43 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F56568]];
  [MEMORY[0x1E4F56658] sendEvent:v24 withPayload:v43];
  v47 = [[PXStorySongsConfiguration alloc] initWithCuratedAudioAssets:v26 fallbackCuratedAssets:v21 currentAsset:0];
  v48 = [[PXStoryProducerResult alloc] initWithObject:v47];
  v49 = [(PXStoryProducerResult *)v48 error:v12];
  ((void (**)(void, void *))v54)[2](v54, v49);
}

- (void)_handleMusicCurationResult:(id)a3 signpostID:(unint64_t)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(PXStoryConfiguration *)self->_configuration appleMusicStatusProvider];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PXStoryDefaultSongsProducer__handleMusicCurationResult_signpostID_resultHandler___block_invoke;
  v13[3] = &unk_1E5DCDDD0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  id v11 = v8;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [v10 requestStatusForCapability:1 handler:v13];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __83__PXStoryDefaultSongsProducer__handleMusicCurationResult_signpostID_resultHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  v5 = (id *)(a1 + 6);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained log];

  os_signpost_id_t v9 = a1[7];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v9, "StoryDefaultSongsProducerEventReceivedAppleMusicStatus", "", v11, 2u);
  }

  id v10 = objc_loadWeakRetained(v5);
  [v10 _handleAppleMusicCapabilityStatus:a2 error:v6 curationResult:a1[4] resultHandler:a1[5]];
}

- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(PXStoryDefaultSongsProducer *)self log];
  v7 = (char *)os_signpost_id_make_with_pointer(v6, self);
  id v8 = v6;
  os_signpost_id_t v9 = v8;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "StoryDefaultSongsProducerResultDelivery", "", buf, 2u);
  }

  id v10 = [(PXStoryDefaultSongsProducer *)self assetContainer];
  id v11 = PLStoryGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = (uint64_t)v10;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "[LemMusic] requestSongsWithOptions: assetContainer=%@", buf, 0xCu);
  }

  id v12 = [v10 container];
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = v12;

  if (v13)
  {
    id v12 = PLStoryGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = [v13 category];
      uint64_t v24 = [v13 subcategory];
      id v26 = [v13 moodKeywords];
      uint64_t v14 = [v13 suggestedMood];
      id v15 = [v13 meaningLabels];
      *(_DWORD *)buf = 134219266;
      uint64_t v33 = v25;
      __int16 v34 = 2048;
      uint64_t v35 = v24;
      __int16 v36 = 2112;
      uint64_t v37 = v26;
      __int16 v38 = 2048;
      uint64_t v39 = v14;
      __int16 v40 = 2112;
      v41 = v15;
      __int16 v42 = 2112;
      v43 = v13;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "[LemMusic] Is PHMemory | category=%ld, sub-cat=%ld, moodKeywords=%@, suggestedMood=%llu, meaningLabels=%@, memory=%@", buf, 0x3Eu);
    }
    goto LABEL_12;
  }
LABEL_13:
  v16 = objc_alloc_init(PXStoryMusicCurationProviderOptions);
  [(PXStoryMusicCurationProviderOptions *)v16 addCategory:@"FlexMusicBest"];
  if ([(PXStoryConfiguration *)self->_configuration isAllowedToPlayAppleMusic]
    && ![(PXStoryConfiguration *)self->_configuration shouldForceUsingFlexMusic])
  {
    [(PXStoryMusicCurationProviderOptions *)v16 addCategory:@"AppleMusicBest"];
  }
  [(PXStoryMusicCurationProviderOptions *)v16 setLogContext:[(PXStoryDefaultSongsProducer *)self logContext]];
  objc_initWeak((id *)buf, self);
  curationProvider = self->_curationProvider;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__PXStoryDefaultSongsProducer_requestSongsWithOptions_resultHandler___block_invoke;
  v28[3] = &unk_1E5DCDDA8;
  id v18 = v9;
  uint64_t v29 = v18;
  v31[1] = v7;
  objc_copyWeak(v31, (id *)buf);
  id v19 = v5;
  id v30 = v19;
  v20 = [(PXStoryMusicCurationProvider *)curationProvider requestMusicCurationForAssetContainer:v10 options:v16 resultHandler:v28];
  v21 = v18;
  uint64_t v22 = v21;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)uint64_t v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v22, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v7, "StoryDefaultSongsProducerResultDelivery", "", v27, 2u);
  }

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)buf);

  return v20;
}

void __69__PXStoryDefaultSongsProducer_requestSongsWithOptions_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(id *)(a1 + 32);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_EVENT, v6, "StoryDefaultSongsProducerEventReceivedCuration", "", v8, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleMusicCurationResult:v3 signpostID:*(void *)(a1 + 56) resultHandler:*(void *)(a1 + 40)];
}

- (PXStoryDefaultSongsProducer)initWithAssetContainer:(id)a3 configuration:(id)a4 curationProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryDefaultSongsProducer;
  id v12 = [(PXStoryDefaultSongsProducer *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetContainer, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_curationProvider, a5);
    uint64_t v14 = (const char *)*MEMORY[0x1E4F8C518];
    id v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    os_log_t v17 = os_log_create(v14, (const char *)[v16 UTF8String]);
    log = v13->_log;
    v13->_log = (OS_os_log *)v17;

    px_dispatch_queue_create_serial();
  }

  return 0;
}

- (PXStoryDefaultSongsProducer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDefaultSongsProducer.m", 46, @"%s is not available as initializer", "-[PXStoryDefaultSongsProducer init]");

  abort();
}

@end