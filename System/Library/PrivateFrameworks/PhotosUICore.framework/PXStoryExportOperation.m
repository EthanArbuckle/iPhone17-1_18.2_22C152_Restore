@interface PXStoryExportOperation
@end

@implementation PXStoryExportOperation

void __56___PXStoryExportOperation_collectAnalyticsForExportEnd___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) status] == 2;
  id v6 = [*(id *)(a1 + 32) configuration];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  v5 = [*(id *)(a1 + 32) error];
  +[PXStoryExportManager collectAnalyticsForExportEndWithConfiguration:v6 analyticsToken:v3 model:v4 withSuccess:v2 error:v5];
}

uint64_t __61___PXStoryExportOperation_engine_shouldRenderLayout_sprites___block_invoke(uint64_t result, uint64_t a2, unsigned int **a3, unsigned char *a4)
{
  uint64_t v4 = **a3;
  int v5 = *(unsigned __int8 *)(*(void *)(result + 64) + v4);
  if (*(unsigned char *)a3[3] == 1 && v5 != 0) {
    PXAssertGetLog();
  }
  if ((v5 - 1) >= 2)
  {
    if (v5 == 4)
    {
      *(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24) = 1;
      [*(id *)(result + 40) errorForEntity:v4];
      objc_claimAutoreleasedReturnValue();
      id v7 = [NSString alloc];
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      objc_claimAutoreleasedReturnValue();
      PXGSpriteInfoDescription();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __46___PXStoryExportOperation__initializeProgress__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void __61___PXStoryExportOperation__exportAudioWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "audioQueue_audioWriter");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __61___PXStoryExportOperation__exportAudioWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_audioWriteQueue_exportAudioWithCompletionHandler:", *(void *)(a1 + 32));
}

uint64_t __55___PXStoryExportOperation__addAudioInputToAssetWriter___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAudioQueue_audioWriter:", *(void *)(a1 + 40));
}

void __55___PXStoryExportOperation__audibleVideoHilightsInStory__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  uint64_t v2 = [v1 timeline];

  [v2 size];
  PXRectWithOriginAndSize();
}

void __55___PXStoryExportOperation__audibleVideoHilightsInStory__block_invoke_2(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (a2 >= 1)
  {
    uint64_t v7 = a2;
    uint64_t v8 = a1;
    do
    {
      unint64_t v9 = *(void *)(a5 + 712);
      long long v10 = *(_OWORD *)(a5 + 736);
      long long v59 = *(_OWORD *)(a5 + 720);
      long long v60 = v10;
      long long v61 = *(_OWORD *)(a5 + 752);
      if (v9 >= 2)
      {
        v11 = [*(id *)(v8 + 32) clipWithIdentifier:*(void *)a5];
        v12 = [v11 resource];
        v13 = objc_msgSend(v12, "px_storyResourceDisplayAsset");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v14 = a3[1];
          long long v57 = *a3;
          *(_OWORD *)v58 = v14;
          *(_OWORD *)&v58[16] = a3[2];
          PXStoryClipVideoSegmentTimeRange(v11, &v51);
          CMTimeFlags v15 = HIDWORD(v51);
          CMTimeEpoch v27 = v52;
          uint64_t v28 = v53;
          int v26 = v54;
          int v30 = v55;
          uint64_t v29 = v56;
          *(_OWORD *)v31 = v57;
          *(_OWORD *)&v31[16] = *(_OWORD *)v58;
          *(_OWORD *)&v31[32] = *(_OWORD *)&v58[16];
          PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v11, (long long *)v31, 1u, &v46);
          CMTimeFlags v25 = HIDWORD(v46);
          CMTimeEpoch v22 = v47;
          uint64_t v24 = v48;
          char v16 = v49;
          uint64_t v17 = v50;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v43 = 0u;
          *(_OWORD *)v31 = v57;
          *(_OWORD *)&v31[16] = *(_OWORD *)v58;
          *(_OWORD *)&v31[32] = *(_OWORD *)&v58[16];
          PXStoryClipTimeRangeByAddingJLCutsToTimeRange(v11, (uint64_t)v31, (uint64_t)&v43);
          if ((v15 & 1) == 0 || (v30 & 1) == 0 || v29 || v28 < 0 || (v25 & 1) == 0 || (v16 & 1) == 0 || v17 || v24 < 0)
          {
            CMTime lhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
            *(_OWORD *)rhs = *(_OWORD *)&v58[8];
            *(void *)&rhs[16] = *(void *)&v58[24];
            CMTimeRangeMake((CMTimeRange *)v31, &lhs, (CMTime *)rhs);
            uint64_t v62 = *(void *)v31;
            int v18 = *(_DWORD *)&v31[12];
            int v63 = *(_DWORD *)&v31[8];
            uint64_t v19 = *(void *)&v31[16];
          }
          else
          {
            lhs.value = v46;
            lhs.timescale = DWORD2(v46);
            lhs.flags = v25;
            lhs.epoch = v22;
            *(void *)rhs = v51;
            *(void *)&rhs[8] = __PAIR64__(v15, DWORD2(v51));
            *(void *)&rhs[16] = v27;
            CMTimeSubtract((CMTime *)v31, &lhs, (CMTime *)rhs);
            uint64_t v62 = *(void *)v31;
            int v18 = *(_DWORD *)&v31[12];
            int v63 = *(_DWORD *)&v31[8];
            uint64_t v19 = *(void *)&v31[16];
          }
          v20 = [_PXStoryExport_VideoHighlightInfo alloc];
          uint64_t v37 = v19;
          lhs.value = v51;
          lhs.timescale = DWORD2(v51);
          lhs.flags = v15;
          lhs.epoch = v27;
          uint64_t v39 = v28;
          int v40 = v26;
          int v41 = v30;
          uint64_t v42 = v29;
          uint64_t v34 = v62;
          int v35 = v63;
          int v36 = v18;
          *(_OWORD *)rhs = v43;
          *(_OWORD *)&rhs[16] = v44;
          long long v33 = v45;
          *(void *)v31 = v9;
          *(_OWORD *)&v31[8] = v59;
          *(_OWORD *)&v31[24] = v60;
          *(_OWORD *)&v31[40] = v61;
          v21 = [(_PXStoryExport_VideoHighlightInfo *)v20 initWithAsset:v13 loadingVideoTimeRange:&lhs loadedVideoPlaybackStartTime:&v34 storyPlaybackRange:rhs audioInfo:v31];
          uint64_t v8 = a1;
          [*(id *)(a1 + 48) addObject:v21];
        }
      }
      a3 += 3;
      a5 += 768;
      --v7;
    }
    while (v7);
  }
}

void __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) audioQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke_2;
  block[3] = &unk_1E5DC7710;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v16 = v6;
  uint64_t v17 = v9;
  id v18 = v7;
  uint64_t v19 = v10;
  id v20 = *(id *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 56);
  id v11 = (id)v14;
  long long v21 = v14;
  id v12 = v7;
  id v13 = v6;
  dispatch_sync(v8, block);
}

intptr_t __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke_407(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    intptr_t v1 = result;
    result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __84___PXStoryExportOperation__addAudioAssetsForVideoHilightsToAudioCompositionBuilder___block_invoke_2(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    CMTimeFlags v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    id v16 = [*(id *)(a1 + 56) asset];
    CMTimeEpoch v22 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v15, @"failed to load video for asset %@", v17, v18, v19, v20, v21, (uint64_t)v16);
    [*(id *)(a1 + 40) _setError:v22];

    v23 = PLStoryGetLog();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    uint64_t v24 = [*(id *)(a1 + 56) asset];
    CMTimeFlags v25 = [v24 uuid];
    *(_DWORD *)buf = 138543362;
    long long v57 = v25;
    int v26 = "failed to load video for asset %{public}@";
    CMTimeEpoch v27 = v23;
    goto LABEL_20;
  }
  uint64_t v3 = *(void **)(a1 + 56);
  uint64_t v4 = *(void **)(a1 + 64);
  if (!v3)
  {
    memset(v55, 0, sizeof(v55));
    goto LABEL_12;
  }
  [v3 loadedVideoPlaybackStartTime];
  int v5 = *(void **)(a1 + 56);
  if (!v5)
  {
LABEL_12:
    memset(v54, 0, 48);
    goto LABEL_13;
  }
  [v5 storyPlaybackRange];
  id v6 = *(void **)(a1 + 56);
  if (!v6)
  {
LABEL_13:
    uint64_t v53 = 0;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
    int v8 = 0;
    goto LABEL_14;
  }
  [v6 audioInfo];
  id v7 = *(void **)(a1 + 56);
  int v8 = v51;
  if (!v7)
  {
LABEL_14:
    uint64_t v49 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v46 = 0u;
    double v9 = 0.0;
    goto LABEL_15;
  }
  [v7 audioInfo];
  double v9 = *((double *)&v48 + 1);
  uint64_t v10 = *(void **)(a1 + 56);
  if (!v10)
  {
LABEL_15:
    double v45 = 0.0;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v42 = 0u;
    double v12 = 0.0;
    goto LABEL_16;
  }
  [v10 audioInfo];
  id v11 = *(void **)(a1 + 56);
  double v12 = v45;
  if (v11)
  {
    [v11 audioInfo];
    BOOL v14 = v38 == 3;
    goto LABEL_17;
  }
LABEL_16:
  BOOL v14 = 0;
  uint64_t v41 = 0;
  HIDWORD(v13) = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
LABEL_17:
  id v37 = 0;
  LODWORD(v13) = v8;
  char v28 = [v4 addAudioFromVideoHighlightAsset:v2 fromTime:v55 atStoryTimeRange:v54 volume:v14 fadeIn:&v37 fadeOut:v13 shouldDuck:v9 error:v12];
  v23 = v37;
  if (v28) {
    goto LABEL_22;
  }
  uint64_t v29 = [*(id *)(a1 + 56) asset];
  uint64_t v24 = [v29 uuid];

  int v35 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v23, @"failed to add audio from video %@ for asset %@", v30, v31, v32, v33, v34, *(void *)(a1 + 32));
  [*(id *)(a1 + 40) _setError:v35];

  CMTimeFlags v25 = PLStoryGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    long long v57 = v24;
    int v26 = "failed to add audio from video %{public}@";
    CMTimeEpoch v27 = v25;
LABEL_20:
    _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_ERROR, v26, buf, 0xCu);
  }

LABEL_22:
  uint64_t v36 = *(void *)(*(void *)(a1 + 80) + 8);
  if (!*(unsigned char *)(v36 + 24))
  {
    *(unsigned char *)(v36 + 24) = 1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
  }
}

void __114___PXStoryExportOperation__handleMediaRequestCompletedForSongAsset_avAsset_audioMix_info_audioCompositionBuilder___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ProgramLoudnessLKFS"];

    if (v2)
    {
      uint64_t v4 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ProgramLoudnessLKFS"];
      [v4 floatValue];
      float v6 = v5;

      id v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"PeakdBFS"];
      [v7 floatValue];

      int v8 = +[PXStorySettings sharedInstance];
      [v8 musicTargetLoudnessLKFS];
      PXVolumeGainForTargetLoudness(v9, v6);
      float v11 = v10;
    }
    else
    {
      float v11 = 1.0;
    }
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void **)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 72);
    id v32 = 0;
    *(float *)&double v3 = v11;
    char v22 = [v20 addMusicAsset:v19 withAudioMix:v21 preferredVolume:&v32 error:v3];
    id v23 = v32;
    if ((v22 & 1) == 0)
    {
      uint64_t v24 = [*(id *)(a1 + 56) identifier];
      uint64_t v30 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v23, @"failed to add song %@ to audio composition", v25, v26, v27, v28, v29, (uint64_t)v24);
      [*(id *)(a1 + 40) _setError:v30];
    }
  }
  else if (([*(id *)(a1 + 40) isCancelled] & 1) == 0)
  {
    id v31 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"Error"];
    double v12 = [*(id *)(a1 + 56) identifier];
    uint64_t v18 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v31, @"failed to load media for song %@", v13, v14, v15, v16, v17, (uint64_t)v12);
    [*(id *)(a1 + 40) _setError:v18];
  }
}

void __66___PXStoryExportOperation__addSongAssetToAudioCompositionBuilder___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  double v3 = [v2 currentSongResource];
  uint64_t v4 = objc_msgSend(v3, "px_storyResourceSongAsset");

  if (!v4) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 targetDuration];
    if ((v19 & 1) == 0)
    {
      float v6 = *(void **)(a1 + 32);
      if (v6) {
        [v6 exportDuration];
      }
    }
LABEL_10:

    goto LABEL_11;
  }
  if ([v4 catalog] == 2)
  {
    id v7 = [*(id *)(a1 + 32) configuration];
    int v8 = [v7 activityType];

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        PXAssertGetLog();
      }
      id v5 = v4;
      float v9 = [*(id *)(a1 + 32) configuration];
      BOOL v10 = +[PXStoryExportManager collectAnalyticsForFixationWithAppleMusicAsset:v5 configuration:v9];

      if (!v10)
      {
        uint64_t v17 = PXStoryErrorCreateWithCodeDebugFormat(10, @"Could not collect apple music fixation analytics", v11, v12, v13, v14, v15, v16, v18);
        [*(id *)(a1 + 32) _setError:v17];

        goto LABEL_13;
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  if ([v4 defaultMediaProviderClass])
  {
    [*(id *)(a1 + 32) qualityOfService];
    px_dispatch_qos_from_nsqualityofservice();
  }
LABEL_13:
}

intptr_t __66___PXStoryExportOperation__addSongAssetToAudioCompositionBuilder___block_invoke_391(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = (id *)(a1 + 7);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _handleMediaRequestCompletedForSongAsset:a1[4] avAsset:v10 audioMix:v9 info:v8 audioCompositionBuilder:a1[5]];

  uint64_t v12 = a1[6];
  return dispatch_semaphore_signal(v12);
}

uint64_t __47___PXStoryExportOperation__setupAudioExporting__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47___PXStoryExportOperation__setupAudioExporting__block_invoke_2;
  v3[3] = &unk_1E5DC7670;
  intptr_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 finishAndWaitWithResultHandler:v3];
}

void __47___PXStoryExportOperation__setupAudioExporting__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = v8;
  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "_audioWriteQueue_setupAudioReaderWithAudioExportComposition:audioMix:", v17, v7);
  }
  else if (v8)
  {
    uint64_t v15 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v8, @"failed to build audio composition", v9, v10, v11, v12, v13, v16);
    [*(id *)(a1 + 32) _setError:v15];
  }
}

void __57___PXStoryExportOperation__checkForDriftFromCurrentTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  objc_msgSend(WeakRetained, "_storyQueue_checkForDriftFromCurrentTime:", &v3);
}

void __39___PXStoryExportOperation__exportVideo__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39___PXStoryExportOperation__exportVideo__block_invoke_2;
  v3[3] = &unk_1E5DD0F58;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_pixelBufferRenderDestination");
  [v2 setRenderCompletionBlock:v3];

  objc_destroyWeak(&v4);
}

void __39___PXStoryExportOperation__exportVideo__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "videoWriterQueue_pixelBufferWriter");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  intptr_t v1 = [v2 assetWriterInput];
  [v1 markAsFinished];
}

void __39___PXStoryExportOperation__exportVideo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_storyQueue_processRenderedLayoutPixelBuffer:", a2);
}

void __67___PXStoryExportOperation__writeVideoWithPixelBuffer_forStoryTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  objc_msgSend(WeakRetained, "_videoWriterQueue_writeVideoWithPixelBuffer:forStoryTime:", v3, &v4);

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
}

uint64_t __55___PXStoryExportOperation__addVideoInputToAssetWriter___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setVideoWriterQueue_pixelBufferWriter:", *(void *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  memset(v4, 0, sizeof(v4));
  return objc_msgSend(v2, "setVideoQueue_firstWrittenStoryTime:", v4);
}

void __53___PXStoryExportOperation__advanceLayoutToStoryTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  objc_msgSend(WeakRetained, "_storyQueue_advanceLayoutToStoryTime:", &v3);
}

void __44___PXStoryExportOperation__setupStoryLayout__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "videoWriterQueue_pixelBufferWriter");
  CVPixelBufferPoolRef v3 = CVPixelBufferPoolRetain((CVPixelBufferPoolRef)[v2 pixelBufferPool]);

  if (v3)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v10 = [*(id *)(a1 + 32) storyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44___PXStoryExportOperation__setupStoryLayout__block_invoke_2;
    block[3] = &unk_1E5DC8380;
    v18[1] = v3;
    objc_copyWeak(v18, &location);
    uint64_t v11 = *(void *)(a1 + 32);
    id v16 = v10;
    uint64_t v17 = v11;
    uint64_t v12 = v10;
    dispatch_async(v12, block);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    PXStoryErrorCreateWithCodeDebugFormat(10, @"Unexpected adapter pixelBufferPool is nil", v4, v5, v6, v7, v8, v9, (uint64_t)v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) _setError:v14];
  }
}

void __44___PXStoryExportOperation__setupStoryLayout__block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 336);
  CVPixelBufferPoolRef v3 = v2;
  uint64_t v4 = *(void **)(a1 + 32);
  os_signpost_id_t v5 = v4[43];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v6 = [v4 uniqueIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "StoryExportRequestSetupLayout", "setup layout for export %{public}@", buf, 0xCu);
  }
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  uint64_t v8 = objc_alloc_init(PXStoryPacingManualTimeSource);
  uint64_t v9 = [[PXStoryPacingController alloc] initWithModel:v7 timeSource:v8 cueSource:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 32), "setStoryQueue_pacingController:", v9);
  [(PXStoryController *)v9 performChanges:&__block_literal_global_348_229470];
  uint64_t v10 = [[PXStoryLayout alloc] initWithModel:v7];
  uint64_t v11 = [v7 extendedTraitCollection];
  [v11 displayScale];
  -[PXGLayout setDisplayScale:](v10, "setDisplayScale:");

  uint64_t v12 = +[PXStorySettings sharedInstance];
  if (![(PXStoryDiagnosticHUDLayout *)v12 isExportHUDEnabled]) {
    goto LABEL_7;
  }
  id v13 = +[PXStorySettings sharedInstance];
  uint64_t v14 = [v13 exportHUDType];

  if (v14)
  {
    uint64_t v12 = [[PXStoryDiagnosticHUDLayout alloc] initWithDataSource:*(void *)(a1 + 32)];
    [(PXStoryLayout *)v10 setDiagnosticOverlayLayout:v12];
LABEL_7:
  }
  uint64_t v15 = [PXGEngine alloc];
  id v16 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_pixelBufferRenderDestination");
  uint64_t v17 = [*(id *)(a1 + 32) storyQueue];
  uint64_t v18 = [(PXGEngine *)v15 initWithPixelBufferDestination:v16 layoutQueue:v17 displayLinkClass:objc_opt_class()];

  objc_msgSend(*(id *)(a1 + 32), "setStoryQueue_engine:", v18);
  [(PXGEngine *)v18 setIsExporting:1];
  [(PXGEngine *)v18 setVisible:1];
  [(PXGEngine *)v18 setDelegate:*(void *)(a1 + 32)];
  [(PXGEngine *)v18 setIsInitialLoad:0];
  [(PXGEngine *)v18 setLayout:v10];
  char v19 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_mediaProvider");
  [(PXGEngine *)v18 registerAllTextureProvidersWithMediaProvider:v19];

  uint64_t v20 = [(PXGEngine *)v18 displayLink];
  uint64_t v21 = [*(id *)(a1 + 32) configuration];
  char v22 = [v21 videoOptions];
  objc_msgSend(v20, "setPreferredFramesPerSecond:", objc_msgSend(v22, "frameRate"));

  id v23 = *(id *)(*(void *)(a1 + 32) + 336);
  uint64_t v24 = v23;
  os_signpost_id_t v25 = *(void *)(*(void *)(a1 + 32) + 344);
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "StoryExportRequestSetupLayout", "", buf, 2u);
  }
}

uint64_t __44___PXStoryExportOperation__setupStoryLayout__block_invoke_345(uint64_t a1, void *a2)
{
  return [a2 setIsActive:1];
}

void __44___PXStoryExportOperation__setupStoryLayout__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = [[PXGPixelBufferPool alloc] initWithPixelBufferPool:*(void *)(a1 + 56)];
  id v2 = [PXGPixelBufferMetalRenderDestination alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) videoOptions];
  [v4 scale];
  os_signpost_id_t v5 = -[PXGPixelBufferMetalRenderDestination initWithLayoutQueue:pixelBufferPool:scale:enablePoolRelease:](v2, "initWithLayoutQueue:pixelBufferPool:scale:enablePoolRelease:", v3, v7, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setStoryQueue_pixelBufferRenderDestination:", v5);

  CVPixelBufferPoolRelease(*(CVPixelBufferPoolRef *)(a1 + 56));
}

void __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  uint64_t v3 = *(void *)(a1 + 80);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke_2;
  v9[3] = &unk_1E5DC75B0;
  id v10 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 72);
  id v12 = v4;
  uint64_t v13 = v5;
  id v11 = *(id *)(a1 + 48);
  uint64_t v6 = objc_msgSend(v2, "pxStory_enumerateStatesByWatchingChanges:usingBlock:", v3, v9);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56)) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancel];
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __114___PXStoryExportOperation__waitForStoryStateWhileExportingCanContinueByWatchingChanges_timeout_verificationBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(NSObject **)(a1 + 32);
  id v7 = a2;
  dispatch_assert_queue_V2(v6);
  LODWORD(v6) = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();

  if (v6)
  {
    *a4 = 1;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

uint64_t __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke(uint64_t a1)
{
  uint64_t v2 = [PXStoryResourcesPreloadingController alloc];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  id v4 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_mediaProvider");
  uint64_t v5 = [(PXStoryResourcesPreloadingController *)v2 initWithModel:v3 mediaProvider:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setIsPreloadingEnabled:1];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) performChanges:&__block_literal_global_318_229503];
  uint64_t v8 = [PXStoryBufferingController alloc];
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  uint64_t v10 = [(PXStoryBufferingController *)v8 initWithModel:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return [v13 performChanges:&__block_literal_global_322_229505];
}

void __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_5;
  v10[3] = &unk_1E5DC7518;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = v4;
  uint64_t v12 = v6;
  uint64_t v13 = v5;
  uint64_t v7 = objc_msgSend(v3, "pxStory_enumerateStatesByWatchingChanges:usingBlock:", v2, v10);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_7(void *a1)
{
  [*(id *)(*(void *)(a1[4] + 8) + 40) cancel];
  uint64_t v2 = *(void *)(a1[4] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  [*(id *)(*(void *)(a1[5] + 8) + 40) performChanges:&__block_literal_global_332_229492];
  id v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
  return [v4 performChanges:&__block_literal_global_334_229493];
}

void __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_10(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
  uint64_t v3 = [v2 timeline];
  id v4 = v3;
  if (v3)
  {
    [v3 timeRange];
  }
  else
  {
    memset(v23, 0, sizeof(v23));
    long long v22 = 0u;
  }
  CMTime v24 = *(CMTime *)((char *)v23 + 8);

  CMTime time = v24;
  if (CMTimeGetSeconds(&time) == 0.0)
  {
    id v11 = PXStoryErrorCreateWithCodeDebugFormat(10, @"empty timeline", v5, v6, v7, v8, v9, v10, v16);
    [*(id *)(a1 + 32) _setError:v11];
  }
  else
  {
    CMTime v20 = v24;
    [*(id *)(a1 + 32) _setExportDuration:&v20];
    uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 outroDuration];
    }
    else
    {
      long long v18 = 0uLL;
      uint64_t v19 = 0;
    }
    uint64_t v14 = *(void **)(a1 + 32);
    long long v16 = v18;
    uint64_t v17 = v19;
    [v14 _setOutroDuration:&v16];

    id v11 = objc_msgSend(*(id *)(a1 + 32), "storyQueue_storyModel");
    uint64_t v15 = [v11 currentStyle];
    [*(id *)(a1 + 32) _setExportedStyle:v15];
  }
}

uint64_t __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

uint64_t __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 setIsActive:0];
}

BOOL __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 readinessStatus] == 3;
}

void __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_5(uint64_t a1, void *a2, char a3, unsigned char *a4)
{
  id v16 = a2;
  if ((a3 & 2) != 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) loadingFractionComplete];
    [*(id *)(a1 + 32) setCompletedUnitCount:(uint64_t)(float)(v7 * 100.0)];
  }
  if ((a3 & 1) != 0
    && [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isCompleted])
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
    *a4 = 1;
  }
  if ((a3 & 4) != 0)
  {
    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) error];
    if (v13)
    {
      uint64_t v14 = PXStoryErrorCreateWithCodeUnderlyingErrorDebugFormat(10, v13, @"resource preloading failed", v8, v9, v10, v11, v12, v15);
      [*(id *)(a1 + 40) _setError:v14];

      *a4 = 1;
    }
  }
}

uint64_t __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setIsActive:1];
}

void __68___PXStoryExportOperation__preloadStoryResourcesAndWaitForBuffering__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setIsSongResourcesPreloadingEnabled:0];
  [v2 setIsActive:1];
}

void __43___PXStoryExportOperation__setupStoryModel__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 336);
  uint64_t v3 = v2;
  id v4 = *(void **)(a1 + 32);
  os_signpost_id_t v5 = v4[43];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v6 = [v4 uniqueIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "StoryExportRequestSetupStoryModel", "setup layout for export %{public}@", buf, 0xCu);
  }
  float v7 = objc_msgSend(*(id *)(a1 + 32), "_storyQueue_createStoryModel");
  objc_msgSend(*(id *)(a1 + 32), "setStoryQueue_storyModel:", v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43___PXStoryExportOperation__setupStoryModel__block_invoke_312;
  v12[3] = &unk_1E5DCEE38;
  v12[4] = *(void *)(a1 + 32);
  [v7 performChanges:v12];
  uint64_t v8 = *(id *)(*(void *)(a1 + 32) + 336);
  uint64_t v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(a1 + 32) + 344);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v7;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_END, v10, "StoryExportRequestSetupStoryModel", "setup layout with model %p", buf, 0xCu);
  }

  uint64_t v11 = [[PXStorySongController alloc] initWithModel:v7];
  objc_msgSend(*(id *)(a1 + 32), "setStoryQueue_songController:", v11);
}

void __43___PXStoryExportOperation__setupStoryModel__block_invoke_312(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v3 = [v2 videoOptions];
  objc_msgSend(v4, "setPrefersExportLayoutMatchesPlayback:", objc_msgSend(v3, "prefersExportLayoutMatchesPlayback"));

  [v4 setDesiredPlayState:1];
  [v4 setMusicReadinessStatus:3];
}

intptr_t __41___PXStoryExportOperation__finishWriting__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __31___PXStoryExportOperation_main__block_invoke(uint64_t a1)
{
  id v5 = +[PXApplicationState sharedState];
  uint64_t v2 = [v5 beginDisablingIdleTimerForReason:@"Story export (PXStoryExportManager)"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

intptr_t __31___PXStoryExportOperation_main__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __31___PXStoryExportOperation_main__block_invoke_298(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v2 = +[PXApplicationState sharedState];
    [v2 endDisablingIdleTimer:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  }
}

void __45___PXStoryExportOperation__setExportedStyle___block_invoke(uint64_t a1)
{
}

void __40___PXStoryExportOperation_exportedStyle__block_invoke(uint64_t a1)
{
}

__n128 __45___PXStoryExportOperation__setOutroDuration___block_invoke(uint64_t a1)
{
  intptr_t v1 = (__n128 *)(*(void *)(a1 + 32) + 300);
  unint64_t v2 = *(void *)(a1 + 56);
  __n128 result = *(__n128 *)(a1 + 40);
  __n128 *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

__n128 __40___PXStoryExportOperation_outroDuration__block_invoke(uint64_t a1)
{
  intptr_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  unint64_t v2 = (__n128 *)(*(void *)(a1 + 32) + 300);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 316);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

__n128 __46___PXStoryExportOperation__setExportDuration___block_invoke(uint64_t a1)
{
  intptr_t v1 = (__n128 *)(*(void *)(a1 + 32) + 276);
  unint64_t v2 = *(void *)(a1 + 56);
  __n128 result = *(__n128 *)(a1 + 40);
  __n128 *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

__n128 __41___PXStoryExportOperation_exportDuration__block_invoke(uint64_t a1)
{
  intptr_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  unint64_t v2 = (__n128 *)(*(void *)(a1 + 32) + 276);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 292);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

uint64_t __49___PXStoryExportOperation__setHasAudioForExport___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 272) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __44___PXStoryExportOperation_hasAudioForExport__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 272);
  return result;
}

uint64_t __33___PXStoryExportOperation_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 256);
  return result;
}

uint64_t __38___PXStoryExportOperation__setStatus___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 256) = *(void *)(result + 40);
  return result;
}

void __32___PXStoryExportOperation_error__block_invoke(uint64_t a1)
{
}

void __37___PXStoryExportOperation__setError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 264), *(id *)(a1 + 40));
  unint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    unint64_t v3 = [v2 domain];
    if ([v3 isEqualToString:@"PXStoryErrorDomain"])
    {
      uint64_t v4 = [*(id *)(a1 + 40) code];

      if (v4 == 11)
      {
        uint64_t v5 = 3;
LABEL_7:
        *(void *)(*(void *)(a1 + 32) + 256) = v5;
        return;
      }
    }
    else
    {
    }
    uint64_t v5 = 4;
    goto LABEL_7;
  }
}

@end