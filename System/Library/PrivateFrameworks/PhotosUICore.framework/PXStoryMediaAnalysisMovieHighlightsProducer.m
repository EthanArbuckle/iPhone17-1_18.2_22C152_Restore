@interface PXStoryMediaAnalysisMovieHighlightsProducer
- (PXMediaAnalyzer)mediaAnalyzer;
- (PXStoryMediaAnalysisMovieHighlightsProducer)init;
- (PXStoryMediaAnalysisMovieHighlightsProducer)initWithStoryConfiguration:(id)a3;
- (id)_requestMovieCurationForAssets:(id)a3 completionHandler:(id)a4;
- (id)requestMovieHighlightsForAssets:(id)a3 partialCollection:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6;
- (unint64_t)batchSize;
- (void)_requestMovieHighlightsForAssets:(id)a3 partialCollection:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6;
- (void)setBatchSize:(unint64_t)a3;
- (void)setMediaAnalyzer:(id)a3;
- (void)waitUntilScheduled;
@end

@implementation PXStoryMediaAnalysisMovieHighlightsProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAnalyzer, 0);
  objc_storeStrong((id *)&self->_customTimeRangeByAssetUUID, 0);
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_results_queue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setMediaAnalyzer:(id)a3
{
}

- (PXMediaAnalyzer)mediaAnalyzer
{
  return self->_mediaAnalyzer;
}

- (id)_requestMovieCurationForAssets:(id)a3 completionHandler:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v9 = self->_log;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PXStoryMovieHighlightsMediaAnalysisRequest", "", buf, 2u);
  }

  v11 = (void *)[v6 copy];
  v12 = +[PXStorySettings sharedInstance];
  int v13 = [v12 allowOnDemandVideoAnalysis];
  int v14 = [v12 useBestHighlightTrim];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!self->_didProcessConfiguration)
  {
    int v46 = v14;
    v16 = [(PXStoryConfiguration *)self->_storyConfiguration assetCollection];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v17 = v16;

      if (!v17)
      {
LABEL_11:
        self->_didProcessConfiguration = 1;

        int v14 = v46;
        goto LABEL_12;
      }
      v16 = [MEMORY[0x1E4F8E798] getCuratedAssetPlaybackTimeRangesForMemory:v17];
      v18 = (NSDictionary *)[v16 copy];
      customTimeRangeByAssetUUID = self->_customTimeRangeByAssetUUID;
      self->_customTimeRangeByAssetUUID = v18;
    }
    else
    {
      id v17 = 0;
    }

    goto LABEL_11;
  }
LABEL_12:
  v20 = self->_customTimeRangeByAssetUUID;
  if (v20 && [(NSDictionary *)v20 count])
  {
    int v41 = v13;
    int v47 = v14;
    os_signpost_id_t v43 = v8;
    id v44 = v7;
    id v45 = v6;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v42 = v11;
    id v21 = v11;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v57;
      v25 = (_OWORD *)MEMORY[0x1E4F1FA20];
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v57 != v24) {
            objc_enumerationMutation(v21);
          }
          v27 = self->_customTimeRangeByAssetUUID;
          v28 = [*(id *)(*((void *)&v56 + 1) + 8 * i) uuid];
          v29 = [(NSDictionary *)v27 objectForKeyedSubscript:v28];

          if (v29)
          {
            long long v54 = 0u;
            long long v55 = 0u;
            *(_OWORD *)buf = 0u;
            [v29 CMTimeRangeValue];
            v52[0] = *(_OWORD *)buf;
            v52[1] = v54;
            v52[2] = v55;
            v30 = (CMTimeRange *)v52;
          }
          else
          {
            long long v31 = v25[1];
            *(_OWORD *)buf = *v25;
            long long v54 = v31;
            long long v55 = v25[2];
            v30 = (CMTimeRange *)buf;
          }
          CFDictionaryRef v32 = CMTimeRangeCopyAsDictionary(v30, 0);
          [v15 addObject:v32];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v23);
    }

    id v7 = v44;
    id v6 = v45;
    v11 = v42;
    os_signpost_id_t v8 = v43;
    int v14 = v47;
    int v13 = v41;
  }
  BOOL v33 = v13 == 0;
  uint64_t v34 = 46;
  mediaAnalyzer = self->_mediaAnalyzer;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __96__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieCurationForAssets_completionHandler___block_invoke;
  v48[3] = &unk_1E5DC8798;
  if (!v33) {
    uint64_t v34 = 47;
  }
  if (v14) {
    uint64_t v36 = v34 | 0x10;
  }
  else {
    uint64_t v36 = v34;
  }
  v48[4] = self;
  id v49 = v11;
  id v50 = v7;
  os_signpost_id_t v51 = v8;
  id v37 = v7;
  id v38 = v11;
  v39 = [(PXMediaAnalyzer *)mediaAnalyzer requestAnalysisForAssets:v38 options:v36 contexts:v15 resultHandler:v48];

  return v39;
}

void __96__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieCurationForAssets_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(id *)(*(void *)(a1 + 32) + 24);
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryMovieHighlightsMediaAnalysisRequest", "", buf, 2u);
  }

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    os_signpost_id_t v8 = +[PXStoryMediaAnalysisMovieHighlightCuration movieHighlightCurationsFromMediaAnalysisResults:v3];
    v9 = (void *)[v8 mutableCopy];
    if ([v8 count])
    {
      unint64_t v10 = 0;
      do
      {
        v11 = [v8 objectAtIndexedSubscript:v10];
        v12 = [v11 defaultHighlight];

        if (!v12)
        {
          int v13 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v10];
          int v14 = +[PXStoryFallbackMovieHighlightCuration movieHighlightCurationForDisplayAsset:v13];
          [v9 setObject:v14 atIndexedSubscript:v10];

          id v15 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v10];
          v16 = [v15 uuid];
          [v7 addObject:v16];
        }
        ++v10;
      }
      while (v10 < [v8 count]);
    }
    id v17 = (void *)[v9 copy];
  }
  else
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v24 = +[PXStoryFallbackMovieHighlightCuration movieHighlightCurationForDisplayAsset:v23];
          [v9 addObject:v24];
          v25 = [v23 uuid];
          [v7 addObject:v25];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v20);
    }

    id v17 = (void *)[v9 copy];
    id v3 = 0;
  }

  if ([v7 count])
  {
    v26 = PLStoryGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [v7 count];
      uint64_t v28 = [*(id *)(a1 + 40) count];
      v29 = [v7 componentsJoinedByString:@" "];
      *(_DWORD *)buf = 134218498;
      uint64_t v41 = v27;
      __int16 v42 = 2048;
      uint64_t v43 = v28;
      __int16 v44 = 2114;
      id v45 = v29;
      _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "PXStoryMediaAnalysisMovieHighlightsProducer: missing media analysis data for %lu assets out of %lu. Assets: %{public}@", buf, 0x20u);
    }
  }
  v30 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieCurationForAssets_completionHandler___block_invoke_246;
  block[3] = &unk_1E5DD3280;
  id v31 = *(id *)(a1 + 48);
  id v34 = v17;
  id v35 = v31;
  id v32 = v17;
  dispatch_async(v30, block);
}

uint64_t __96__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieCurationForAssets_completionHandler___block_invoke_246(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_requestMovieHighlightsForAssets:(id)a3 partialCollection:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  int v13 = self->_log;
  int v14 = v13;
  unint64_t v32 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PXStoryMovieHighlightsProduction", "", buf, 2u);
  }

  uint64_t v15 = [v9 count];
  unint64_t batchSize = self->_batchSize;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:batchSize];
  id v18 = objc_alloc_init(MEMORY[0x1E4F28F90]);
  uint64_t v19 = objc_alloc_init(PXStoryMovieHighlightsConcreteMutableCollection);
  *(void *)buf = 0;
  __int16 v44 = buf;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DC8770;
  BOOL v33 = self;
  aBlock[4] = self;
  uint64_t v20 = v19;
  long long v38 = v20;
  uint64_t v41 = buf;
  os_signpost_id_t v42 = v12;
  os_signpost_id_t spid = v12;
  id v35 = v11;
  id v40 = v35;
  id v34 = v18;
  id v39 = v34;
  uint64_t v21 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v15)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      uint64_t v23 = objc_msgSend(v9, "objectAtIndex:", i, spid);
      if ((unint64_t)([v23 playbackStyle] - 3) <= 2)
      {
        ++*((void *)v44 + 3);
        uint64_t v24 = [v10 movieHighlightsForDisplayAsset:v23];
        if (v24)
        {
          [(PXStoryMovieHighlightsConcreteMutableCollection *)v20 setMovieHighlightCuration:v24 forDisplayAsset:v23];
        }
        else
        {
          if ([v17 count] == batchSize)
          {
            v21[2](v21, v17);
            [v17 removeAllObjects];
          }
          [v17 addObject:v23];
        }
      }
    }
  }
  if (objc_msgSend(v17, "count", spid))
  {
    v21[2](v21, v17);
  }
  else
  {
    v25 = [PXStoryProducerResult alloc];
    v26 = (void *)[(PXStoryMovieHighlightsConcreteMutableCollection *)v20 copy];
    uint64_t v27 = [(PXStoryProducerResult *)v25 initWithObject:v26];

    (*((void (**)(id, PXStoryProducerResult *))v35 + 2))(v35, v27);
    uint64_t v28 = v33->_log;
    v29 = v28;
    if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)long long v36 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v29, OS_SIGNPOST_INTERVAL_END, spida, "PXStoryMovieHighlightsProduction", "", v36, 2u);
    }
  }
  _Block_object_dispose(buf, 8);
}

void __120__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[v3 copy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __120__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke_2;
  v13[3] = &unk_1E5DC8748;
  v5 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = v4;
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v18 = v6;
  long long v12 = *(_OWORD *)(a1 + 56);
  id v7 = (id)v12;
  long long v17 = v12;
  id v8 = v4;
  id v9 = [v5 _requestMovieCurationForAssets:v8 completionHandler:v13];
  objc_msgSend(*(id *)(a1 + 48), "setTotalUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount") + objc_msgSend(v3, "count"));
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = [v3 count];

  [v10 addChild:v9 withPendingUnitCount:v11];
}

void __120__PXStoryMediaAnalysisMovieHighlightsProducer__requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setMovieHighlightCurations:a2 forDisplayAssets:*(void *)(a1 + 40)];
  uint64_t v6 = [PXStoryProducerResult alloc];
  id v7 = (void *)[*(id *)(a1 + 32) copy];
  id v8 = [(PXStoryProducerResult *)v6 initWithObject:v7];

  if ([*(id *)(a1 + 32) count] != *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v9 = [(PXStoryProducerResult *)v8 flags:1];

    id v8 = (PXStoryProducerResult *)v9;
  }
  if (v5)
  {
    uint64_t v10 = [(PXStoryProducerResult *)v8 error:v5];

    id v8 = (PXStoryProducerResult *)v10;
  }
  uint64_t v11 = *(id *)(*(void *)(a1 + 48) + 24);
  long long v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 72);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_EVENT, v13, "PXStoryMovieHighlightsBatchDelivery", "", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if ([*(id *)(a1 + 32) count] == *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v14 = *(id *)(*(void *)(a1 + 48) + 24);
    id v15 = v14;
    os_signpost_id_t v16 = *(void *)(a1 + 72);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)long long v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PXStoryMovieHighlightsProduction", "", v17, 2u);
    }
  }
}

- (void)waitUntilScheduled
{
}

- (id)requestMovieHighlightsForAssets:(id)a3 partialCollection:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  os_signpost_id_t v13 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:1];
  workQueue = self->_workQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __119__PXStoryMediaAnalysisMovieHighlightsProducer_requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke;
  v22[3] = &unk_1E5DC89D0;
  id v15 = v13;
  id v23 = v15;
  uint64_t v24 = self;
  id v25 = v10;
  id v26 = v11;
  id v27 = v12;
  unint64_t v28 = a5;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(workQueue, v22);
  uint64_t v19 = v27;
  id v20 = v15;

  return v20;
}

uint64_t __119__PXStoryMediaAnalysisMovieHighlightsProducer_requestMovieHighlightsForAssets_partialCollection_options_resultHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) becomeCurrentWithPendingUnitCount:1];
  [*(id *)(a1 + 40) _requestMovieHighlightsForAssets:*(void *)(a1 + 48) partialCollection:*(void *)(a1 + 56) options:*(void *)(a1 + 72) resultHandler:*(void *)(a1 + 64)];
  v2 = *(void **)(a1 + 32);
  return [v2 resignCurrent];
}

- (PXStoryMediaAnalysisMovieHighlightsProducer)initWithStoryConfiguration:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PXStoryMediaAnalysisMovieHighlightsProducer *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storyConfiguration, a3);
    v7->_didProcessConfiguration = 0;
    customTimeRangeByAssetUUID = v7->_customTimeRangeByAssetUUID;
    v7->_customTimeRangeByAssetUUID = 0;
  }
  return v7;
}

- (PXStoryMediaAnalysisMovieHighlightsProducer)init
{
  v16.receiver = self;
  v16.super_class = (Class)PXStoryMediaAnalysisMovieHighlightsProducer;
  v2 = [(PXStoryMediaAnalysisMovieHighlightsProducer *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc_init(PXSystemMediaAnalyzer);
    mediaAnalyzer = v2->_mediaAnalyzer;
    v2->_mediaAnalyzer = (PXMediaAnalyzer *)v3;

    v2->_unint64_t batchSize = 100;
    id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("PXStoryMediaAnalysisMovieHighlightsProducer.Work", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("PXStoryMediaAnalysisMovieHighlightsProducer.Results", 0);
    results_queue = v2->_results_queue;
    v2->_results_queue = (OS_dispatch_queue *)v8;

    id v10 = (const char *)*MEMORY[0x1E4F8C518];
    id v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    os_log_t v13 = os_log_create(v10, (const char *)[v12 UTF8String]);
    log = v2->_log;
    v2->_log = (OS_os_log *)v13;
  }
  return v2;
}

@end