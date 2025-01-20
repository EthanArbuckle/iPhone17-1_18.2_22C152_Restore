@interface PXAppleMusicMediaProvider
+ (PXAudioAssetMediaProvider)sharedInstance;
- (BOOL)_canByPassExportRestriction;
- (PXAppleMusicMediaProvider)init;
- (PXAppleMusicMediaProvider)initWithQOSClass:(unsigned int)a3;
- (id)_avAssetWithLocalMediaURL:(id)a3 entryPoint:(id)a4 fadeOutDuration:(id *)a5 maximumDuration:(id *)a6 audioMix:(id *)a7;
- (id)_localMediaURLForAsset:(id)a3 createIntermediateDirectories:(BOOL)a4 error:(id *)a5;
- (int64_t)_nextRequestID;
- (int64_t)requestMediaForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)_handleDownloadFinishedForAsset:(id)a3 downloadLocation:(id)a4 error:(id)a5;
- (void)_queue_cancelRequest:(int64_t)a3;
- (void)_queue_deliverResultForRequest:(id)a3 localMediaURL:(id)a4 error:(id)a5;
- (void)_queue_handleDownloadFinishedForAsset:(id)a3 downloadLocation:(id)a4 error:(id)a5;
- (void)_queue_processRequest:(id)a3;
- (void)_queue_startDownloadIfNeededForRequest:(id)a3;
- (void)cancelRequest:(int64_t)a3;
@end

@implementation PXAppleMusicMediaProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_downloaderByAsset, 0);
  objc_storeStrong((id *)&self->_queue_requestIDsByAsset, 0);
  objc_storeStrong((id *)&self->_queue_requestByID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_avAssetWithLocalMediaURL:(id)a3 entryPoint:(id)a4 fadeOutDuration:(id *)a5 maximumDuration:(id *)a6 audioMix:(id *)a7
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc(MEMORY[0x1E4F166C8]);
  uint64_t v63 = *MEMORY[0x1E4F16148];
  v64[0] = MEMORY[0x1E4F1CC38];
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
  v14 = (void *)[v12 initWithURL:v10 options:v13];

  [v11 time];
  memset(&v59, 0, sizeof(v59));
  CMTimeMakeWithSeconds(&v59, v15, PXAudioDefaultCMTimeScale);
  memset(&v58, 0, sizeof(v58));
  if (v14) {
    [v14 duration];
  }
  else {
    memset(&end, 0, sizeof(end));
  }
  start.CMTimeRange start = v59;
  CMTimeRangeFromTimeToTime(&v58, &start.start, &end);
  if ((a6->var2 & 0x1D) == 1)
  {
    id v56 = 0;
    *(_OWORD *)&start.start.value = *(_OWORD *)&a6->var0;
    start.start.CMTimeEpoch epoch = a6->var3;
    uint64_t v16 = objc_msgSend(v14, "px_assetByClampingToDuration:error:", &start, &v56);
    id v17 = v56;

    if (v16)
    {
      int v18 = 0;
      v14 = (void *)v16;
    }
    else
    {
      v19 = PLAudioPlaybackGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_OWORD *)&start.start.value = *(_OWORD *)&a6->var0;
        start.start.CMTimeEpoch epoch = a6->var3;
        Float64 Seconds = CMTimeGetSeconds(&start.start);
        LODWORD(start.start.value) = 134218498;
        *(Float64 *)((char *)&start.start.value + 4) = Seconds;
        LOWORD(start.start.flags) = 2112;
        *(void *)((char *)&start.start.flags + 2) = 0;
        HIWORD(start.start.epoch) = 2112;
        start.duration.value = (CMTimeValue)v17;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "Failed to trim asset to duration %.2fs asset for asset %@: %@", (uint8_t *)&start, 0x20u);
      }

      v14 = 0;
      int v18 = 1;
    }
  }
  else
  {
    int v18 = 0;
    id v17 = 0;
  }
  if (PXAudioAssetEntryPointIsNull(v11))
  {
    *(_OWORD *)&start.start.value = *(_OWORD *)&a5->var0;
    start.start.CMTimeEpoch epoch = a5->var3;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    BOOL v21 = CMTimeCompare(&start.start, &time2) > 0;
  }
  else
  {
    BOOL v21 = 1;
  }
  if ((v18 | !v21))
  {
    id v22 = 0;
  }
  else
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F16590]);
    id v55 = v17;
    CMTimeRange start = v58;
    v24 = (CMTime *)MEMORY[0x1E4F1FA48];
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    char v25 = [MEMORY[0x1E4F8CC38] insertTimeRange:&start ofAsset:v14 atTime:&time2 intoMutableComposition:v23 error:&v55];
    id v40 = v55;

    if (v25)
    {
      v26 = [v23 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
      v27 = [v26 firstObject];

      if (v27)
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F16580]);
        v39 = objc_alloc_init(MEMORY[0x1E4F16588]);
        [v39 setTrackID:[v27 trackID]];
        time2.value = 0;
        *(void *)&time2.timescale = &time2;
        time2.CMTimeEpoch epoch = 0x2020000000;
        int v54 = 0;
        start.start.value = 0;
        *(void *)&start.start.timescale = &start;
        start.start.CMTimeEpoch epoch = 0x3810000000;
        *(_OWORD *)&start.duration.timescale = *(_OWORD *)&v24->value;
        CMTimeEpoch epoch = v24->epoch;
        start.duration.value = (CMTimeValue)&unk_1AB5D584F;
        CMTimeEpoch v62 = epoch;
        v38 = [v11 fadeInKeyTimeOffsets];
        v29 = v39;
        if ([v38 count])
        {
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __107__PXAppleMusicMediaProvider__avAssetWithLocalMediaURL_entryPoint_fadeOutDuration_maximumDuration_audioMix___block_invoke;
          v48[3] = &unk_1E5DBAC78;
          id v49 = v11;
          v50 = v39;
          p_CMTime time2 = &time2;
          p_CMTimeRange start = &start;
          [v38 enumerateObjectsUsingBlock:v48];

          v29 = v39;
        }
        else
        {
          *(_DWORD *)(*(void *)&time2.timescale + 24) = 1065353216;
        }
        if ((a5->var2 & 0x1D) == 1)
        {
          CMTime time1 = (CMTime)*a5;
          CMTime rhs = *v24;
          if (CMTimeCompare(&time1, &rhs) >= 1)
          {
            memset(&time1, 0, sizeof(time1));
            uint64_t v31 = *(void *)&start.start.timescale;
            if (v23) {
              [v23 duration];
            }
            else {
              memset(&lhs, 0, sizeof(lhs));
            }
            CMTime rhs = (CMTime)*a5;
            CMTimeSubtract(&v45, &lhs, &rhs);
            CMTime rhs = *(CMTime *)(v31 + 32);
            CMTimeMaximum(&time1, &rhs, &v45);
            int v32 = *(_DWORD *)(*(void *)&time2.timescale + 24);
            if (v23) {
              [v23 duration];
            }
            else {
              memset(&v42, 0, sizeof(v42));
            }
            CMTime rhs = time1;
            CMTimeRangeFromTimeToTime(&v43, &rhs, &v42);
            LODWORD(v33) = v32;
            [v29 setVolumeRampFromStartVolume:&v43 toEndVolume:v33 timeRange:0.0];
          }
        }
        v60 = v29;
        v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
        [v22 setInputParameters:v34];

        _Block_object_dispose(&start, 8);
        _Block_object_dispose(&time2, 8);
        v30 = v39;
      }
      else
      {
        v30 = PLAudioPlaybackGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          LODWORD(start.start.value) = 138412546;
          *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)v14;
          LOWORD(start.start.flags) = 2112;
          *(void *)((char *)&start.start.flags + 2) = v40;
          _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_ERROR, "Failed to find audio track for apply audio ramping to asset %@: %@", (uint8_t *)&start, 0x16u);
        }
        id v22 = 0;
      }

      uint64_t v35 = [v23 copy];
      v14 = (void *)v35;
    }
    else
    {
      v27 = PLAudioPlaybackGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LODWORD(start.start.value) = 138412546;
        *(CMTimeValue *)((char *)&start.start.value + 4) = (CMTimeValue)v14;
        LOWORD(start.start.flags) = 2112;
        *(void *)((char *)&start.start.flags + 2) = v40;
        _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_ERROR, "Failed to create AVComposition to apply audio ramping to asset %@: %@", (uint8_t *)&start, 0x16u);
      }
      id v22 = 0;
    }

    id v17 = v40;
  }
  if (a7) {
    *a7 = v22;
  }
  id v36 = v14;

  return v36;
}

double __107__PXAppleMusicMediaProvider__avAssetWithLocalMediaURL_entryPoint_fadeOutDuration_maximumDuration_audioMix___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  [v4 doubleValue];
  objc_msgSend(v3, "fadeInGainAtOffset:");
  int v6 = v5;
  memset(&v16, 0, sizeof(v16));
  [v4 doubleValue];
  Float64 v8 = v7;

  CMTimeMakeWithSeconds(&v16, v8, PXAudioDefaultCMTimeScale);
  v9 = (void *)a1[5];
  LODWORD(v8) = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  CMTime start = *(CMTime *)(*(void *)(a1[7] + 8) + 32);
  CMTime v13 = v16;
  CMTimeRangeFromTimeToTime(&v15, &start, &v13);
  LODWORD(v10) = LODWORD(v8);
  LODWORD(v11) = v6;
  [v9 setVolumeRampFromStartVolume:&v15 toEndVolume:v10 timeRange:v11];
  double result = *(double *)&v16.value;
  *(CMTime *)(*(void *)(a1[7] + 8) + 32) = v16;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = v6;
  return result;
}

- (void)_queue_deliverResultForRequest:(id)a3 localMediaURL:(id)a4 error:(id)a5
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v8 asset];
  uint64_t v12 = [v8 signpostID];
  if (v12)
  {
    uint64_t v13 = v12;
    v14 = (void *)MEMORY[0x1E4F56658];
    uint64_t v15 = *MEMORY[0x1E4F56440];
    v40[0] = *MEMORY[0x1E4F56560];
    CMTime v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    v40[1] = *MEMORY[0x1E4F56580];
    v41[0] = v17;
    v41[1] = @"com.apple.photos.CPAnalytics.appleMusicSongDownloaded";
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
    int v18 = v11;
    v19 = self;
    BOOL v21 = v20 = v9;
    [v14 endSignpost:v13 forEventName:v15 withPayload:v21];

    id v9 = v20;
    self = v19;
    double v11 = v18;
  }
  if (v10)
  {
    uint64_t v38 = *MEMORY[0x1E4F28A50];
    id v39 = v10;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    id v23 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PXAppleMusicMediaProviderErrorDomain" code:3 userInfo:v22];
    id v36 = @"Error";
    v37 = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v25 = 0;
    v26 = 0;
  }
  else
  {
    v24 = [v11 loudnessMainPeak];
    if (v24)
    {
      v27 = [v11 loudnessMainValue];

      if (v27)
      {
        v34[0] = @"PeakdBFS";
        v28 = [v11 loudnessMainPeak];
        v34[1] = @"ProgramLoudnessLKFS";
        v35[0] = v28;
        v29 = [v11 loudnessMainValue];
        v35[1] = v29;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      }
      else
      {
        v24 = 0;
      }
    }
    id v22 = [v8 options];
    id v23 = [v22 entryPoint];
    if (v22)
    {
      [v22 fadeOutDuration];
      [v22 maximumDuration];
    }
    else
    {
      memset(v33, 0, sizeof(v33));
      memset(v32, 0, sizeof(v32));
    }
    id v31 = 0;
    v26 = [(PXAppleMusicMediaProvider *)self _avAssetWithLocalMediaURL:v9 entryPoint:v23 fadeOutDuration:v33 maximumDuration:v32 audioMix:&v31];
    id v25 = v31;
  }

  v30 = [v8 resultHandler];
  ((void (**)(void, void *, id, void *))v30)[2](v30, v26, v25, v24);
}

- (void)_queue_handleDownloadFinishedForAsset:(id)a3 downloadLocation:(id)a4 error:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = 0;
  id v24 = v10;
  if (v9)
  {
    id v12 = v10;
    if (!v10)
    {
      id v32 = 0;
      uint64_t v13 = -[PXAppleMusicMediaProvider _localMediaURLForAsset:createIntermediateDirectories:error:](self, "_localMediaURLForAsset:createIntermediateDirectories:error:", v8, 1, &v32, 0);
      id v12 = v32;
      if (v13)
      {
        v14 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v31 = v12;
        int v15 = [v14 moveItemAtURL:v9 toURL:v13 error:&v31];
        id v16 = v31;

        if (v15) {
          id v11 = v13;
        }
        else {
          id v11 = 0;
        }
        id v12 = v16;
      }
      else
      {
        id v11 = 0;
      }
    }
  }
  else
  {
    id v12 = v10;
  }
  v26 = v9;
  id v17 = -[NSMutableDictionary objectForKeyedSubscript:](self->_queue_requestIDsByAsset, "objectForKeyedSubscript:", v8, v24);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v23 = [(NSMutableDictionary *)self->_queue_requestByID objectForKeyedSubscript:v22];
        [(NSMutableDictionary *)self->_queue_requestByID setObject:0 forKeyedSubscript:v22];
        [(PXAppleMusicMediaProvider *)self _queue_deliverResultForRequest:v23 localMediaURL:v11 error:v12];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v19);
  }
  [v17 removeAllObjects];
  [(NSMutableDictionary *)self->_queue_downloaderByAsset setObject:0 forKeyedSubscript:v8];
}

- (void)_handleDownloadFinishedForAsset:(id)a3 downloadLocation:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PXAppleMusicMediaProvider__handleDownloadFinishedForAsset_downloadLocation_error___block_invoke;
  block[3] = &unk_1E5DCEA88;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __84__PXAppleMusicMediaProvider__handleDownloadFinishedForAsset_downloadLocation_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_queue_handleDownloadFinishedForAsset:downloadLocation:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_startDownloadIfNeededForRequest:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 asset];
  int v6 = [(PXAppleMusicMediaProvider *)self _localMediaURLForAsset:v5 createIntermediateDirectories:0 error:0];
  double v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    [(PXAppleMusicMediaProvider *)self _queue_deliverResultForRequest:v4 localMediaURL:v6 error:0];
  }
  else
  {
    id v10 = [v4 options];
    char v11 = [v10 networkAccessAllowed];

    if (v11)
    {
      id v12 = [(NSMutableDictionary *)self->_queue_downloaderByAsset objectForKeyedSubscript:v5];

      if (v12)
      {
        id v13 = 0;
      }
      else
      {
        uint64_t v22 = [v5 introPreviewURL];
        objc_initWeak(&location, self);
        id v23 = [MEMORY[0x1E4F290E0] sharedSession];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __68__PXAppleMusicMediaProvider__queue_startDownloadIfNeededForRequest___block_invoke;
        v30[3] = &unk_1E5DBAC50;
        objc_copyWeak(&v32, &location);
        id v24 = v5;
        id v31 = v24;
        id v13 = [v23 downloadTaskWithURL:v22 completionHandler:v30];

        [(NSMutableDictionary *)self->_queue_downloaderByAsset setObject:v13 forKeyedSubscript:v24];
        objc_msgSend(v4, "setSignpostID:", objc_msgSend(MEMORY[0x1E4F56658], "startSignpost"));

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
      }
      uint64_t v25 = [v4 requestID];
      queue_requestByID = self->_queue_requestByID;
      long long v27 = [NSNumber numberWithInteger:v25];
      [(NSMutableDictionary *)queue_requestByID setObject:v4 forKeyedSubscript:v27];

      id v28 = [(NSMutableDictionary *)self->_queue_requestIDsByAsset objectForKeyedSubscript:v5];
      if (!v28)
      {
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [(NSMutableDictionary *)self->_queue_requestIDsByAsset setObject:v28 forKeyedSubscript:v5];
      }
      long long v29 = [NSNumber numberWithInteger:v25];
      [v28 addObject:v29];

      [v13 resume];
    }
    else
    {
      id v14 = [NSString alloc];
      int v15 = [v5 identifier];
      id v16 = (void *)[v14 initWithFormat:@"Could not get media for song with identifier %@ because it is not local and downloading is not allowed by the request options.", v15];

      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v36 = *MEMORY[0x1E4F28228];
      v37[0] = v16;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      id v19 = (void *)[v17 initWithDomain:@"PXAppleMusicMediaProviderErrorDomain" code:2 userInfo:v18];

      uint64_t v34 = @"Error";
      uint64_t v35 = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      BOOL v21 = [v4 resultHandler];
      ((void (**)(void, void, void, void *))v21)[2](v21, 0, 0, v20);
    }
  }
}

void __68__PXAppleMusicMediaProvider__queue_startDownloadIfNeededForRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  int v6 = (id *)(a1 + 40);
  id v7 = a4;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleDownloadFinishedForAsset:*(void *)(a1 + 32) downloadLocation:v8 error:v7];
}

- (void)_queue_processRequest:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 asset];
  int v6 = [v4 options];
  uint64_t v7 = [v6 intent];

  if (v7 == 2)
  {
    id v8 = objc_alloc_init(PXMusicCuratorAudioAssetRequestOptions);
    [(PXMusicCuratorAudioAssetRequestOptions *)v8 setForceMetadataRefetch:1];
    int v9 = [v5 photoLibrary];
    if (!v9) {
      PXAssertGetLog();
    }
    id v10 = [v5 storeID];
    v16[0] = v10;
    char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__PXAppleMusicMediaProvider__queue_processRequest___block_invoke;
    v13[3] = &unk_1E5DBAC28;
    v13[4] = self;
    id v14 = v5;
    id v15 = v4;
    id v12 = +[PXMusicCurator requestAudioAssetFetchResultForAdamIDs:v11 requestOptions:v8 photoLibrary:v9 completionHandler:v13];
  }
  else
  {
    [(PXAppleMusicMediaProvider *)self _queue_startDownloadIfNeededForRequest:v4];
  }
}

void __51__PXAppleMusicMediaProvider__queue_processRequest___block_invoke(id *a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = [a2 firstObject];
  if ([v3 flags] & 2) != 0 || (objc_msgSend(a1[4], "_canByPassExportRestriction"))
  {
    objc_msgSend(a1[4], "_queue_startDownloadIfNeededForRequest:", a1[6]);
  }
  else
  {
    id v4 = [NSString alloc];
    int v5 = [a1[5] identifier];
    int v6 = (void *)[v4 initWithFormat:@"Asset can't be shared, identifier %@", v5];

    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F28228];
    v15[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    int v9 = (void *)[v7 initWithDomain:@"PXAppleMusicMediaProviderErrorDomain" code:4 userInfo:v8];

    id v12 = @"Error";
    id v13 = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    char v11 = [a1[6] resultHandler];
    ((void (**)(void, void, void, void *))v11)[2](v11, 0, 0, v10);
  }
}

- (BOOL)_canByPassExportRestriction
{
  if (!PFOSVariantHasInternalUI() || !_os_feature_enabled_impl()) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.plphotosctl"];

  return v4;
}

- (id)_localMediaURLForAsset:(id)a3 createIntermediateDirectories:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [MEMORY[0x1E4F28B50] mainBundle];
  id v10 = [v9 bundleIdentifier];

  if ([v10 isEqualToString:@"com.apple.mobileslideshow"])
  {
    id v24 = 0;
    char v11 = [v8 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v24];
    id v12 = v24;
    if (v11)
    {
      id v13 = [v11 URLByAppendingPathComponent:v10];
    }
    else
    {
      id v13 = 0;
    }

    if (!v13)
    {
LABEL_17:
      id v16 = 0;
      if (!a5) {
        goto LABEL_12;
      }
LABEL_11:
      *a5 = v12;
      goto LABEL_12;
    }
  }
  else
  {
    id v13 = [v8 temporaryDirectory];
    id v12 = 0;
    if (!v13) {
      goto LABEL_17;
    }
  }
  uint64_t v14 = [v13 URLByAppendingPathComponent:@"AppleMusicMedia" isDirectory:1];
  if (v6)
  {
    id v23 = v12;
    [v8 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&v23];
    id v15 = v23;

    id v12 = v15;
  }
  if (v12)
  {
    id v16 = 0;
  }
  else
  {
    id v17 = [v7 introPreviewURL];
    id v18 = [v17 lastPathComponent];
    id v19 = [v18 pathExtension];

    uint64_t v20 = [v7 identifier];
    BOOL v21 = [v20 stringByAppendingPathExtension:v19];

    id v16 = [v14 URLByAppendingPathComponent:v21 isDirectory:0];
  }
  if (a5) {
    goto LABEL_11;
  }
LABEL_12:

  return v16;
}

- (int64_t)_nextRequestID
{
  return (int)(atomic_fetch_add(&self->_requestIDCounter, 1u) + 1);
}

- (void)_queue_cancelRequest:(int64_t)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  queue_requestByID = self->_queue_requestByID;
  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)queue_requestByID objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_queue_requestByID;
    int v9 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v8 setObject:0 forKeyedSubscript:v9];

    id v10 = [v7 asset];
    char v11 = [(NSMutableDictionary *)self->_queue_requestIDsByAsset objectForKeyedSubscript:v10];
    id v12 = [NSNumber numberWithInteger:a3];
    [v11 removeObject:v12];

    if (![v11 count])
    {
      id v13 = [(NSMutableDictionary *)self->_queue_downloaderByAsset objectForKeyedSubscript:v10];
      uint64_t v14 = v13;
      if (v13) {
        [v13 cancel];
      }
      [(NSMutableDictionary *)self->_queue_downloaderByAsset setObject:0 forKeyedSubscript:v10];
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
      id v18 = @"Error";
      v19[0] = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v17 = [v7 resultHandler];
      ((void (**)(void, void, void, void *))v17)[2](v17, 0, 0, v16);
    }
  }
}

- (void)cancelRequest:(int64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PXAppleMusicMediaProvider_cancelRequest___block_invoke;
  block[3] = &unk_1E5DD0260;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __43__PXAppleMusicMediaProvider_cancelRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_cancelRequest:", *(void *)(a1 + 40));
}

- (int64_t)requestMediaForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (PXAudioRequestOptions *)a4;
  id v11 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v9 originalAsset];

    id v9 = (id)v12;
  }
  id v13 = v9;
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
      id v28 = (objc_class *)objc_opt_class();
      long long v29 = NSStringFromClass(v28);
      long long v30 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      [v27 handleFailureInMethod:a2, self, @"PXAppleMusicMediaProvider.m", 111, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"asset", v29, v30 object file lineNumber description];
    }
  }
  uint64_t v14 = [v13 introPreviewURL];

  if (v14)
  {
    int64_t v15 = [(PXAppleMusicMediaProvider *)self _nextRequestID];
    if (!v10) {
      id v10 = objc_alloc_init(PXAudioRequestOptions);
    }
    id v16 = [[_PXAppleMusicMediaProviderRequest alloc] initWithAsset:v13 options:v10 requestID:v15 resultHandler:v11];
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PXAppleMusicMediaProvider_requestMediaForAsset_options_resultHandler___block_invoke;
    block[3] = &unk_1E5DD20C8;
    objc_copyWeak(&v33, &location);
    id v32 = v16;
    id v18 = v16;
    dispatch_async(queue, block);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    id v19 = [NSString alloc];
    uint64_t v20 = [v13 identifier];
    BOOL v21 = (void *)[v19 initWithFormat:@"Could not find apple music preview for asset with identifier %@", v20];

    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v37 = *MEMORY[0x1E4F28228];
    v38[0] = v21;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v24 = (void *)[v22 initWithDomain:@"PXAppleMusicMediaProviderErrorDomain" code:1 userInfo:v23];

    uint64_t v35 = @"Error";
    uint64_t v36 = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v25);

    int64_t v15 = 0;
  }

  return v15;
}

void __72__PXAppleMusicMediaProvider_requestMediaForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_processRequest:", *(void *)(a1 + 32));
}

- (PXAppleMusicMediaProvider)initWithQOSClass:(unsigned int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXAppleMusicMediaProvider;
  if ([(PXAppleMusicMediaProvider *)&v4 init]) {
    px_dispatch_queue_create_serial();
  }
  return 0;
}

- (PXAppleMusicMediaProvider)init
{
  return [(PXAppleMusicMediaProvider *)self initWithQOSClass:21];
}

+ (PXAudioAssetMediaProvider)sharedInstance
{
  if (sharedInstance_onceToken_111265 != -1) {
    dispatch_once(&sharedInstance_onceToken_111265, &__block_literal_global_111266);
  }
  v2 = (void *)sharedInstance_sharedProvider;
  return (PXAudioAssetMediaProvider *)v2;
}

void __43__PXAppleMusicMediaProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PXAppleMusicMediaProvider);
  v1 = (void *)sharedInstance_sharedProvider;
  sharedInstance_sharedProvider = (uint64_t)v0;
}

@end