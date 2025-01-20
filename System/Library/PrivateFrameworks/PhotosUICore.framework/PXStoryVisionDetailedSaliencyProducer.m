@interface PXStoryVisionDetailedSaliencyProducer
+ (id)effectiveSaliencyAreasFromTiledVisionSaliencyAreas:(id)a3;
- (OS_dispatch_queue)workQueue;
- (OS_os_log)log;
- (PXMediaProvider)mediaProvider;
- (PXStoryVisionDetailedSaliencyProducer)init;
- (PXStoryVisionDetailedSaliencyProducer)initWithMediaProvider:(id)a3;
- (id)requestDetailedSaliencyForDisplayAssets:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5;
- (int64_t)overlappingTileCount;
- (void)_requestDetailedSaliencyForDisplayAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 resultHandler:(id)a6;
- (void)requestWorkingImageForDisplayAsset:(id)a3 resultHandler:(id)a4;
@end

@implementation PXStoryVisionDetailedSaliencyProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

- (int64_t)overlappingTileCount
{
  return self->_overlappingTileCount;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_os_log)log
{
  return self->_log;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (id)requestDetailedSaliencyForDisplayAssets:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
  objc_initWeak(&location, self);
  v11 = [(PXStoryVisionDetailedSaliencyProducer *)self workQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __103__PXStoryVisionDetailedSaliencyProducer_requestDetailedSaliencyForDisplayAssets_options_resultHandler___block_invoke;
  v18[3] = &unk_1E5DCA988;
  id v12 = v10;
  id v19 = v12;
  objc_copyWeak(v22, &location);
  v22[1] = (id)a4;
  id v20 = v8;
  id v21 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v18);

  v15 = v21;
  id v16 = v12;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  return v16;
}

void __103__PXStoryVisionDetailedSaliencyProducer_requestDetailedSaliencyForDisplayAssets_options_resultHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _requestDetailedSaliencyForDisplayAssets:*(void *)(a1 + 40) options:*(void *)(a1 + 64) progress:*(void *)(a1 + 32) resultHandler:*(void *)(a1 + 48)];
  }
}

- (void)requestWorkingImageForDisplayAsset:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PXStoryMultipartPanoramaSettings sharedInstance];
  [v8 maximumTileSide];
  double v10 = v9;

  double v11 = v10
      * (double)([(PXStoryVisionDetailedSaliencyProducer *)self overlappingTileCount] + 1)
      * 0.5;
  id v13 = objc_alloc_init((Class)off_1E5DA6E70);
  [v13 setSynchronous:1];
  [v13 setDeliveryMode:1];
  [v13 setNetworkAccessAllowed:1];
  id v12 = [(PXStoryVisionDetailedSaliencyProducer *)self mediaProvider];
  objc_msgSend(v12, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v13, v6, v11, v11);
}

- (void)_requestDetailedSaliencyForDisplayAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 resultHandler:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v39 = a5;
  id v11 = a6;
  id v12 = [(PXStoryVisionDetailedSaliencyProducer *)self log];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  id v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PXStoryDetailedSaliency", "Context=%{signpost.telemetry:string2}lu vision-based", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__116229;
  v73 = __Block_byref_object_dispose__116230;
  id v74 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5DBB6C8;
  aBlock[4] = &buf;
  v37 = _Block_copy(aBlock);
  id v16 = objc_alloc_init(PXStoryConcreteMutableSaliencyDataSource);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_44;
  v59[3] = &unk_1E5DBB6F0;
  unint64_t v64 = a4;
  v17 = v15;
  v60 = v17;
  os_signpost_id_t v65 = v13;
  v66 = self;
  v18 = v16;
  v61 = v18;
  p_long long buf = &buf;
  id v36 = v11;
  id v62 = v36;
  v38 = _Block_copy(v59);
  if (([v39 isCancelled] & 1) == 0)
  {
    uint64_t v19 = [v10 count];
    id v20 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    if (v19 >= 1)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        v22 = (void *)MEMORY[0x1AD10CB00]();
        v23 = [v10 objectAtIndexedSubscript:i];
        if ([v23 mediaType] == 1 && (objc_msgSend(v23, "mediaSubtypes") & 1) != 0) {
          [v20 addIndex:i];
        }
      }
    }
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    v58[3] = 0;
    uint64_t v24 = [v20 count];
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x2020000000;
    uint64_t v57 = 0;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v57 = v25;
    v26 = +[PXStoryMultipartPanoramaSettings sharedInstance];
    [v26 productionSimulatedDelay];
    uint64_t v28 = v27;
    [v26 productionReportsTimeInterval];
    uint64_t v30 = v29;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_51;
    v40[3] = &unk_1E5DBB790;
    id v41 = v39;
    v48 = v58;
    v49 = v56;
    uint64_t v50 = v30;
    v31 = v38;
    id v46 = v31;
    uint64_t v51 = v24;
    id v42 = v10;
    v32 = v17;
    os_signpost_id_t v52 = v13;
    v53 = self;
    v43 = v32;
    v44 = self;
    SEL v54 = a2;
    id v47 = v37;
    v45 = v18;
    uint64_t v55 = v28;
    [v20 enumerateIndexesUsingBlock:v40];
    v31[2](v31, 1.0);
    v33 = v32;
    v34 = v33;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_DWORD *)v68 = 134217984;
      v69 = self;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v34, OS_SIGNPOST_INTERVAL_END, v13, "PXStoryDetailedSaliency", "Context=%{signpost.telemetry:string2}lu ", v68, 0xCu);
    }

    _Block_object_dispose(v56, 8);
    _Block_object_dispose(v58, 8);
  }
  _Block_object_dispose(&buf, 8);
}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v4 addObject:v3];
  id v8 = PLStoryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Detailed saliency error: %@", (uint8_t *)&v9, 0xCu);
  }
}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_44(uint64_t a1, float a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a2 >= 1.0 || (*(unsigned char *)(a1 + 64) & 6) == 0)
  {
    v4 = *(id *)(a1 + 32);
    id v5 = v4;
    os_signpost_id_t v6 = *(void *)(a1 + 72);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      uint64_t v7 = *(void *)(a1 + 80);
      *(_DWORD *)long long buf = 134218240;
      uint64_t v21 = v7;
      __int16 v22 = 2048;
      double v23 = a2;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_EVENT, v6, "PXStoryDetailedSaliencyResult", "Context=%{signpost.telemetry:string2}lu completed:%0.2f", buf, 0x16u);
    }

    id v8 = [PXStoryProducerResult alloc];
    int v9 = (void *)[*(id *)(a1 + 40) copy];
    id v10 = [(PXStoryProducerResult *)v8 initWithObject:v9];
    *(float *)&double v11 = a2;
    id v12 = [(PXStoryProducerResult *)v10 fractionCompleted:v11];

    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
    {
      os_signpost_id_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v18 = *MEMORY[0x1E4F28750];
      uint64_t v19 = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v16 = [v13 errorWithDomain:@"PXStoryErrorDomain" code:25 userInfo:v15];
      uint64_t v17 = [v12 error:v16];

      id v12 = (void *)v17;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_51(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD10CB00]();
  if ([*(id *)(a1 + 32) isCancelled])
  {
    *a3 = 1;
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (*(uint64_t *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) >= 1)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 96) + 8);
      if (v6 - *(double *)(v7 + 24) >= *(double *)(a1 + 104))
      {
        *(double *)(v7 + 24) = v6;
        (*(void (**)(float))(*(void *)(a1 + 72) + 16))((float)*(uint64_t *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                        + 24) / (float)*(uint64_t *)(a1 + 112));
      }
    }
    id v8 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
    int v9 = *(id *)(a1 + 48);
    id v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 120);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      uint64_t v12 = *(void *)(a1 + 128);
      *(_DWORD *)long long buf = 134218240;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXStoryDetailedAssetSaliency", "Context=%{signpost.telemetry:string2}lu index:%li", buf, 0x16u);
    }

    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v39 = 0;
    os_signpost_id_t v13 = *(id *)(a1 + 48);
    uint64_t v14 = v13;
    os_signpost_id_t v15 = *(void *)(a1 + 120);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      uint64_t v16 = *(void *)(a1 + 128);
      *(_DWORD *)id v36 = 134217984;
      *(void *)&v36[4] = v16;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PXStoryDetailedSaliencyAssetImage", "Context=%{signpost.telemetry:string2}lu ", v36, 0xCu);
    }

    uint64_t v17 = *(void **)(a1 + 56);
    aBlock[8] = MEMORY[0x1E4F143A8];
    aBlock[9] = 3221225472;
    aBlock[10] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_52;
    aBlock[11] = &unk_1E5DBB718;
    uint64_t v18 = *(void *)(a1 + 136);
    v33 = buf;
    uint64_t v34 = v18;
    aBlock[12] = v17;
    id v30 = *(id *)(a1 + 48);
    long long v35 = *(_OWORD *)(a1 + 120);
    id v32 = *(id *)(a1 + 80);
    id v31 = v8;
    id v27 = v31;
    objc_msgSend(v17, "requestWorkingImageForDisplayAsset:resultHandler:");
    if (*(void *)(*(void *)&buf[8] + 24))
    {
      id v19 = objc_alloc(MEMORY[0x1E4F45890]);
      id v20 = (void *)[v19 initWithCGImage:*(void *)(*(void *)&buf[8] + 24) options:MEMORY[0x1E4F1CC08]];
      uint64_t v21 = [MEMORY[0x1E4F458E8] defaultANEDevice];
      __int16 v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v23 = [MEMORY[0x1E4F458E8] defaultDevice];
      }
      uint64_t v24 = v23;

      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_65;
      aBlock[3] = &unk_1E5DBB768;
      aBlock[4] = v24;
      void aBlock[5] = v20;
      aBlock[7] = *(id *)(a1 + 80);
      aBlock[6] = v25;
      _Block_copy(aBlock);
      long long v26 = *((_OWORD *)off_1E5DAB010 + 1);
      *(_OWORD *)id v36 = *(_OWORD *)off_1E5DAB010;
      long long v37 = v26;
      [*(id *)(a1 + 56) overlappingTileCount];
      CGImageGetWidth(*(CGImageRef *)(*(void *)&buf[8] + 24));
      CGImageGetHeight(*(CGImageRef *)(*(void *)&buf[8] + 24));
      PXSizeValueForAxis();
    }
    if (*(double *)(a1 + 144) > 0.0) {
      objc_msgSend(MEMORY[0x1E4F29060], "sleepForTimeInterval:");
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);

    _Block_object_dispose(buf, 8);
  }
}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_52(uint64_t a1, CGImage *a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"PXStoryVisionDetailedSaliencyProducer.m", 123, @"Invalid parameter not satisfying: %@", @"image == nil" object file lineNumber description];
  }
  uint64_t v7 = *(id *)(a1 + 40);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 80);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(a1 + 88);
    *(_DWORD *)long long buf = 134218496;
    uint64_t v21 = v10;
    __int16 v22 = 2048;
    size_t Width = CGImageGetWidth(a2);
    __int16 v24 = 2048;
    size_t Height = CGImageGetHeight(a2);
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "PXStoryDetailedSaliencyAssetImage", "Context=%{signpost.telemetry:string2}lu image:%lix%li", buf, 0x20u);
  }

  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CGImageRetain(a2);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    uint64_t v18 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(25, v12, @"failed to obtain image for %@", v13, v14, v15, v16, v17, *(void *)(a1 + 48));
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v18);
  }
}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_65(uint64_t a1, double a2, double a3, double a4, double a5)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v10 = objc_alloc_init(MEMORY[0x1E4F45848]);
  [v10 setProcessingDevice:*(void *)(a1 + 32)];
  objc_msgSend(v10, "setRegionOfInterest:", a2, a3, a4, a5);
  id v11 = objc_alloc_init(MEMORY[0x1E4F45820]);
  [v11 setProcessingDevice:*(void *)(a1 + 32)];
  objc_msgSend(v11, "setRegionOfInterest:", a2, a3, a4, a5);
  uint64_t v12 = *(void **)(a1 + 40);
  v35[0] = v10;
  v35[1] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  id v34 = 0;
  char v14 = [v12 performRequests:v13 error:&v34];
  id v15 = v34;

  if (v14)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_2;
    aBlock[3] = &unk_1E5DBB740;
    double v30 = a2;
    double v31 = a3;
    double v32 = a4;
    double v33 = a5;
    id v29 = *(id *)(a1 + 48);
    uint64_t v21 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    __int16 v22 = [v10 results];
    v21[2](v21, v22, 1);

    id v23 = [v11 results];
    v21[2](v21, v23, 2);

    __int16 v24 = v29;
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v26 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(25, v15, @"failed perform Vision saliency requests", v16, v17, v18, v19, v20, v27);
    (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, v26);
    __int16 v24 = v15;
    id v15 = (id)v26;
  }
}

void __113__PXStoryVisionDetailedSaliencyProducer__requestDetailedSaliencyForDisplayAssets_options_progress_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  memset(v3, 0, sizeof(v3));
  if ([v2 countByEnumeratingWithState:v3 objects:v4 count:16])
  {
    [**((id **)&v3[0] + 1) narrowedBoundingBox];
    PXRectDenormalize();
  }
}

- (PXStoryVisionDetailedSaliencyProducer)initWithMediaProvider:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryVisionDetailedSaliencyProducer;
  id v6 = [(PXStoryVisionDetailedSaliencyProducer *)&v22 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaProvider, a3);
    id v8 = (const char *)*MEMORY[0x1E4F8C518];
    os_signpost_id_t v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    id v10 = objc_claimAutoreleasedReturnValue();
    os_log_t v11 = os_log_create(v8, (const char *)[v10 UTF8String]);
    log = v7->_log;
    v7->_log = (OS_os_log *)v11;

    uint64_t v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    id v14 = objc_claimAutoreleasedReturnValue();
    id v15 = (const char *)[v14 UTF8String];
    uint64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v18 = dispatch_queue_create(v15, v17);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = +[PXStoryMultipartPanoramaSettings sharedInstance];
    v7->_overlappingTileCount = [v20 overlappingTileCount];
  }
  return v7;
}

- (PXStoryVisionDetailedSaliencyProducer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryVisionDetailedSaliencyProducer.m", 40, @"%s is not available as initializer", "-[PXStoryVisionDetailedSaliencyProducer init]");

  abort();
}

+ (id)effectiveSaliencyAreasFromTiledVisionSaliencyAreas:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__PXStoryVisionDetailedSaliencyProducer_effectiveSaliencyAreasFromTiledVisionSaliencyAreas___block_invoke_2;
  aBlock[3] = &unk_1E5DBB7D8;
  id v65 = &__block_literal_global_116308;
  id v59 = v4;
  id v64 = v59;
  id v6 = _Block_copy(aBlock);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __92__PXStoryVisionDetailedSaliencyProducer_effectiveSaliencyAreasFromTiledVisionSaliencyAreas___block_invoke_3;
  v60[3] = &unk_1E5DBB7D8;
  id v62 = &__block_literal_global_116308;
  id v58 = v5;
  id v61 = v58;
  uint64_t v7 = _Block_copy(v60);
  uint64_t v8 = [v3 count];
  os_signpost_id_t v9 = +[PXStoryMultipartPanoramaSettings sharedInstance];
  [v9 tileOverlapThreshold];

  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      os_log_t v11 = [v3 objectAtIndexedSubscript:v10];
      uint64_t v12 = ++v10;
      if (v10 < v8)
      {
        do
        {
          uint64_t v13 = [v3 objectAtIndexedSubscript:v12];
          uint64_t v14 = [v11 type];
          if (v14 == [v13 type])
          {
            [v11 sourceRegionOfInterest];
            CGFloat v16 = v15;
            CGFloat v18 = v17;
            CGFloat v20 = v19;
            CGFloat v22 = v21;
            [v13 sourceRegionOfInterest];
            v71.origin.x = v23;
            v71.origin.y = v24;
            v71.size.width = v25;
            v71.size.height = v26;
            v67.origin.x = v16;
            v67.origin.y = v18;
            v67.size.width = v20;
            v67.size.height = v22;
            if (CGRectIntersectsRect(v67, v71)) {
              goto LABEL_17;
            }
          }
          uint64_t v27 = [v11 type];
          if (v27 != [v13 type])
          {
            [v11 sourceRegionOfInterest];
            CGFloat v29 = v28;
            CGFloat v31 = v30;
            CGFloat v33 = v32;
            CGFloat v35 = v34;
            [v13 sourceRegionOfInterest];
            v72.origin.x = v36;
            v72.origin.y = v37;
            v72.size.width = v38;
            v72.size.height = v39;
            v68.origin.x = v29;
            v68.origin.y = v31;
            v68.size.width = v33;
            v68.size.height = v35;
            if (CGRectEqualToRect(v68, v72))
            {
LABEL_17:
              [v11 contentsRect];
              CGFloat v41 = v40;
              CGFloat v43 = v42;
              CGFloat v45 = v44;
              CGFloat v47 = v46;
              [v13 contentsRect];
              CGFloat v49 = v48;
              CGFloat v51 = v50;
              CGFloat v53 = v52;
              CGFloat v55 = v54;
              v69.origin.x = v41;
              v69.origin.y = v43;
              v69.size.width = v45;
              v69.size.height = v47;
              v73.origin.x = v49;
              v73.origin.y = v51;
              v73.size.width = v53;
              v73.size.height = v55;
              if (CGRectIntersectsRect(v69, v73))
              {
                v70.origin.x = v41;
                v70.origin.y = v43;
                v70.size.width = v45;
                v70.size.height = v47;
                v74.origin.x = v49;
                v74.origin.y = v51;
                v74.size.width = v53;
                v74.size.height = v55;
                CGRectIntersection(v70, v74);
                PXSizeGetArea();
              }
            }
          }

          ++v12;
        }
        while (v8 != v12);
      }
    }
    while (v10 != v8);
  }
  v56 = [v59 arrayByAddingObjectsFromArray:v58];

  return v56;
}

uint64_t __92__PXStoryVisionDetailedSaliencyProducer_effectiveSaliencyAreasFromTiledVisionSaliencyAreas___block_invoke_2(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  return (*(uint64_t (**)(void, void, __n128, __n128, __n128, __n128, float))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3, a4, a5, 0.9);
}

uint64_t __92__PXStoryVisionDetailedSaliencyProducer_effectiveSaliencyAreasFromTiledVisionSaliencyAreas___block_invoke_3(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  return (*(uint64_t (**)(void, void, __n128, __n128, __n128, __n128, float))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3, a4, a5, 0.1);
}

void __92__PXStoryVisionDetailedSaliencyProducer_effectiveSaliencyAreasFromTiledVisionSaliencyAreas___block_invoke(double x, double y, double width, double height, float a5, uint64_t a6, void *a7)
{
  id v27 = a7;
  uint64_t v11 = [v27 count];
  if (v11 - 1 >= 0)
  {
    uint64_t v12 = v11;
    uint64_t v13 = v27;
    do
    {
      uint64_t v14 = [v13 objectAtIndexedSubscript:--v12];
      [v14 contentsRect];
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;

      v29.origin.x = v16;
      v29.origin.y = v18;
      v29.size.width = v20;
      v29.size.height = v22;
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      if (CGRectIntersectsRect(v29, v32))
      {
        v30.origin.x = x;
        v30.origin.y = y;
        v30.size.width = width;
        v30.size.height = height;
        v33.origin.x = v16;
        v33.origin.y = v18;
        v33.size.width = v20;
        v33.size.height = v22;
        CGRect v31 = CGRectUnion(v30, v33);
        x = v31.origin.x;
        y = v31.origin.y;
        width = v31.size.width;
        height = v31.size.height;
        [v27 removeObjectAtIndex:v12];
      }
      uint64_t v13 = v27;
    }
    while (v12 > 0);
  }
  CGFloat v23 = [PXStoryConcreteSaliencyArea alloc];
  *(float *)&double v24 = a5;
  CGFloat v25 = -[PXStoryConcreteSaliencyArea initWithContentsRect:confidence:](v23, "initWithContentsRect:confidence:", x, y, width, height, v24);
  [v27 addObject:v25];
}

@end