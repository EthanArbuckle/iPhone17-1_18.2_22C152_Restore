@interface PFVideoAVObjectBuilder
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToOriginalTimeFromScaledTime:(SEL)a3 forExport:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToScaledTimeFromOriginalTime:(SEL)a3 forExport:(id *)a4;
- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampInRangeForExport:(SEL)a3;
- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampOutRangeForExport:(SEL)a3;
- ($9E16F6706E08E1DCF37CEDFAE5F41851)timeRange;
- (AVAsset)_finalAsset;
- (AVAsset)videoAsset;
- (AVAudioMix)_finalAudioMix;
- (AVVideoComposition)_finalVideoComposition;
- (PFSlowMotionTimeRangeMapper)_timeRangeMapperForExport;
- (PFSlowMotionTimeRangeMapper)_timeRangeMapperForPlayback;
- (PFSlowMotionTimeRangeMapper)playbackTimeRangeMapper;
- (PFVideoAVObjectBuilder)initWithAsset:(id)a3 audioMix:(id)a4 videoComposition:(id)a5;
- (PFVideoAVObjectBuilder)initWithVideoAsset:(id)a3 videoAdjustments:(id)a4;
- (PFVideoAdjustments)videoAdjustments;
- (id)_getOrCreateTimeRangeMapperForExport:(BOOL)a3;
- (id)_trimAssetIfNecessary:(id)a3 error:(id *)a4;
- (id)description;
- (void)_synchronouslyLoadSlowMotionPropertiesFromAsset:(id)a3;
- (void)requestAVAssetForExport:(BOOL)a3 withResultHandler:(id)a4;
- (void)requestAVAssetWithResultHandler:(id)a3;
- (void)requestAsynchronousAVAssetWithResultHandler:(id)a3;
- (void)requestAsynchronousExportSessionWithExportPreset:(id)a3 resultHandler:(id)a4;
- (void)requestAsynchronousPlayerItemWithResultHandler:(id)a3;
- (void)requestExportSessionWithExportPreset:(id)a3 resultHandler:(id)a4;
- (void)requestPlayerItemWithResultHandler:(id)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation PFVideoAVObjectBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__finalVideoComposition, 0);
  objc_storeStrong((id *)&self->__finalAudioMix, 0);
  objc_storeStrong((id *)&self->__finalAsset, 0);
  objc_storeStrong((id *)&self->__timeRangeMapperForExport, 0);
  objc_storeStrong((id *)&self->__timeRangeMapperForPlayback, 0);
  objc_storeStrong((id *)&self->_videoAdjustments, 0);

  objc_storeStrong((id *)&self->_videoAsset, 0);
}

- (AVVideoComposition)_finalVideoComposition
{
  return self->__finalVideoComposition;
}

- (AVAudioMix)_finalAudioMix
{
  return self->__finalAudioMix;
}

- (AVAsset)_finalAsset
{
  return self->__finalAsset;
}

- (PFSlowMotionTimeRangeMapper)_timeRangeMapperForExport
{
  return self->__timeRangeMapperForExport;
}

- (PFSlowMotionTimeRangeMapper)_timeRangeMapperForPlayback
{
  return self->__timeRangeMapperForPlayback;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)timeRange
{
  long long v3 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var0;
  return self;
}

- (PFVideoAdjustments)videoAdjustments
{
  return self->_videoAdjustments;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (id)_trimAssetIfNecessary:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if ((self->_timeRange.start.flags & 1) == 0
    || (self->_timeRange.duration.flags & 1) == 0
    || self->_timeRange.duration.epoch
    || self->_timeRange.duration.value < 0)
  {
    id v8 = v6;
  }
  else
  {
    p_timeRange = &self->_timeRange;
    v11 = [MEMORY[0x1E4F16590] composition];
    long long v12 = *(_OWORD *)&p_timeRange->start.epoch;
    long long v32 = *(_OWORD *)&p_timeRange->start.value;
    long long v33 = v12;
    long long v34 = *(_OWORD *)&p_timeRange->duration.timescale;
    long long v30 = *MEMORY[0x1E4F1FA48];
    uint64_t v31 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    if (+[PFMediaUtilities insertTimeRange:&v32 ofAsset:v7 atTime:&v30 intoMutableComposition:v11 error:a4])
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
      uint64_t v13 = *MEMORY[0x1E4F15C18];
      v14 = +[PFMediaUtilities tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v7];
      v15 = [v14 firstObject];
      v16 = v15;
      if (v15)
      {
        [v15 preferredTransform];
      }
      else
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v32 = 0u;
      }

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v17 = [v11 tracks];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v27 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v23 = [v22 mediaType];
            int v24 = [v23 isEqualToString:v13];

            if (v24)
            {
              v25[0] = v32;
              v25[1] = v33;
              v25[2] = v34;
              [v22 setPreferredTransform:v25];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
        }
        while (v19);
      }

      id v8 = v11;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (void)_synchronouslyLoadSlowMotionPropertiesFromAsset:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    id v6 = +[PFSlowMotionUtilities slowMotionSourceAssetPropertyKeys];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__PFVideoAVObjectBuilder__synchronouslyLoadSlowMotionPropertiesFromAsset___block_invoke;
    v8[3] = &unk_1E5B2F5F0;
    v9 = v5;
    v7 = v5;
    [v4 loadValuesAsynchronouslyForKeys:v6 completionHandler:v8];

    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@ was asked to load slo-mo properties from a nil AVAsset.", buf, 0xCu);
  }
}

void __74__PFVideoAVObjectBuilder__synchronouslyLoadSlowMotionPropertiesFromAsset___block_invoke(uint64_t a1)
{
}

- (void)requestAVAssetForExport:(BOOL)a3 withResultHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t, AVAudioMix *, AVVideoComposition *, id))a4;
  finalAsset = self->__finalAsset;
  if (finalAsset)
  {
    id v8 = finalAsset;
    v9 = self->__finalAudioMix;
    v10 = self->__finalVideoComposition;
    if (v6)
    {
LABEL_3:
      id v18 = 0;
      uint64_t v11 = [(PFVideoAVObjectBuilder *)self _trimAssetIfNecessary:v8 error:&v18];
      id v12 = v18;

      v6[2](v6, v11, v9, v10, v12);
      id v8 = (AVAsset *)v11;
    }
  }
  else
  {
    [(PFVideoAVObjectBuilder *)self _synchronouslyLoadSlowMotionPropertiesFromAsset:self->_videoAsset];
    videoAsset = self->_videoAsset;
    [(PFVideoAdjustments *)self->_videoAdjustments slowMotionRate];
    int v15 = v14;
    videoAdjustments = self->_videoAdjustments;
    if (videoAdjustments)
    {
      [(PFVideoAdjustments *)videoAdjustments slowMotionTimeRange];
    }
    else
    {
      HIDWORD(v17) = 0;
      memset(v20, 0, sizeof(v20));
    }
    id v19 = 0;
    LODWORD(v17) = v15;
    id v8 = +[PFSlowMotionUtilities assetFromVideoAsset:videoAsset slowMotionRate:v20 slowMotionTimeRange:v4 forExport:&v19 outAudioMix:0 outTimeRangeMapper:v17];
    v9 = (AVAudioMix *)v19;
    v10 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
}

- (void)requestAsynchronousAVAssetWithResultHandler:(id)a3
{
  id v4 = a3;
  v5 = self->_videoAsset;
  id v6 = +[PFSlowMotionUtilities slowMotionSourceAssetPropertyKeys];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PFVideoAVObjectBuilder_requestAsynchronousAVAssetWithResultHandler___block_invoke;
  v8[3] = &unk_1E5B2F1D0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(AVAsset *)v5 loadValuesAsynchronouslyForKeys:v6 completionHandler:v8];
}

uint64_t __70__PFVideoAVObjectBuilder_requestAsynchronousAVAssetWithResultHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestAVAssetWithResultHandler:*(void *)(a1 + 40)];
}

- (void)requestAVAssetWithResultHandler:(id)a3
{
}

- (void)requestAsynchronousExportSessionWithExportPreset:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_videoAsset;
  id v9 = +[PFSlowMotionUtilities slowMotionSourceAssetPropertyKeys];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__PFVideoAVObjectBuilder_requestAsynchronousExportSessionWithExportPreset_resultHandler___block_invoke;
  v12[3] = &unk_1E5B2EB18;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(AVAsset *)v8 loadValuesAsynchronouslyForKeys:v9 completionHandler:v12];
}

uint64_t __89__PFVideoAVObjectBuilder_requestAsynchronousExportSessionWithExportPreset_resultHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestExportSessionWithExportPreset:*(void *)(a1 + 40) resultHandler:*(void *)(a1 + 48)];
}

- (void)requestExportSessionWithExportPreset:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  finalAsset = self->__finalAsset;
  if (finalAsset)
  {
    id v9 = [MEMORY[0x1E4F16360] exportSessionWithAsset:finalAsset presetName:v6];
    [v9 setAudioMix:self->__finalAudioMix];
    [v9 setVideoComposition:self->__finalVideoComposition];
    if (v7) {
LABEL_3:
    }
      v7[2](v7, v9, 0);
  }
  else
  {
    [(PFVideoAVObjectBuilder *)self _synchronouslyLoadSlowMotionPropertiesFromAsset:self->_videoAsset];
    videoAsset = self->_videoAsset;
    [(PFVideoAdjustments *)self->_videoAdjustments slowMotionRate];
    int v12 = v11;
    videoAdjustments = self->_videoAdjustments;
    if (videoAdjustments)
    {
      [(PFVideoAdjustments *)videoAdjustments slowMotionTimeRange];
    }
    else
    {
      HIDWORD(v14) = 0;
      memset(v24, 0, sizeof(v24));
    }
    id v23 = 0;
    LODWORD(v14) = v12;
    int v15 = +[PFSlowMotionUtilities assetFromVideoAsset:videoAsset slowMotionRate:v24 slowMotionTimeRange:1 forExport:&v23 outAudioMix:0 outTimeRangeMapper:v14];
    id v16 = v23;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v22 = 0;
    id v18 = [(PFVideoAVObjectBuilder *)self _trimAssetIfNecessary:v15 error:&v22];
    id v19 = v22;

    if (v18)
    {
      uint64_t v20 = +[PFSlowMotionUtilities exportPresetForAsset:v18 preferredPreset:v6];

      id v9 = [MEMORY[0x1E4F16360] exportSessionWithAsset:v18 presetName:v20];
      [v9 setAudioMix:v16];
      if (isKindOfClass)
      {
        v21 = [(AVAsset *)self->_videoAsset metadata];
        [v9 setMetadata:v21];

        +[PFSlowMotionUtilities configureExportSession:v9 forcePreciseConversion:0];
      }
      id v6 = (id)v20;
    }
    else
    {
      id v9 = 0;
    }

    if (v7) {
      goto LABEL_3;
    }
  }
}

- (void)requestAsynchronousPlayerItemWithResultHandler:(id)a3
{
  id v4 = a3;
  v5 = self->_videoAsset;
  id v6 = +[PFSlowMotionUtilities slowMotionSourceAssetPropertyKeys];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PFVideoAVObjectBuilder_requestAsynchronousPlayerItemWithResultHandler___block_invoke;
  v8[3] = &unk_1E5B2F1D0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(AVAsset *)v5 loadValuesAsynchronouslyForKeys:v6 completionHandler:v8];
}

uint64_t __73__PFVideoAVObjectBuilder_requestAsynchronousPlayerItemWithResultHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestPlayerItemWithResultHandler:*(void *)(a1 + 40)];
}

- (void)requestPlayerItemWithResultHandler:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, id))a3;
  if (self->__finalAsset)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F16620], "playerItemWithAsset:");
    [v5 setAudioMix:self->__finalAudioMix];
    [v5 setVideoComposition:self->__finalVideoComposition];
    id v6 = 0;
    if (v4) {
LABEL_3:
    }
      v4[2](v4, v5, v6);
  }
  else
  {
    [(PFVideoAVObjectBuilder *)self _synchronouslyLoadSlowMotionPropertiesFromAsset:self->_videoAsset];
    videoAsset = self->_videoAsset;
    [(PFVideoAdjustments *)self->_videoAdjustments slowMotionRate];
    int v9 = v8;
    videoAdjustments = self->_videoAdjustments;
    if (videoAdjustments)
    {
      [(PFVideoAdjustments *)videoAdjustments slowMotionTimeRange];
    }
    else
    {
      HIDWORD(v11) = 0;
      memset(v36, 0, sizeof(v36));
    }
    id v35 = 0;
    LODWORD(v11) = v9;
    int v12 = +[PFSlowMotionUtilities assetFromVideoAsset:videoAsset slowMotionRate:v36 slowMotionTimeRange:0 forExport:&v35 outAudioMix:0 outTimeRangeMapper:v11];
    id v13 = v35;
    id v34 = 0;
    double v14 = [(PFVideoAVObjectBuilder *)self _trimAssetIfNecessary:v12 error:&v34];
    id v6 = v34;

    if (v14)
    {
      v5 = [MEMORY[0x1E4F16620] playerItemWithAsset:v14];
      [v5 setAudioMix:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v15 = [(AVAsset *)self->_videoAsset URL];
        id v16 = v15;
        if (v15 && ([v15 isFileURL] & 1) == 0)
        {
          long long v27 = v16;
          id v28 = v13;
          [MEMORY[0x1E4F29088] componentsWithURL:v16 resolvingAgainstBaseURL:0];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v26 = v33 = 0u;
          id obj = [v26 queryItems];
          uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v31;
            while (2)
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v31 != v19) {
                  objc_enumerationMutation(obj);
                }
                v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                id v22 = [v21 name];
                int v23 = [v22 isEqualToString:@"pbl"];

                if (v23)
                {
                  int v24 = [v21 value];
                  int v25 = [v24 intValue];

                  if (v25 >= 1) {
                    [v5 setPreferredForwardBufferDuration:(double)v25];
                  }
                  goto LABEL_24;
                }
              }
              uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }
LABEL_24:

          id v16 = v27;
          id v13 = v28;
        }
      }
    }
    else
    {
      v5 = 0;
    }

    if (v4) {
      goto LABEL_3;
    }
  }
}

- (id)description
{
  if (self->__finalAsset)
  {
    v8.receiver = self;
    v8.super_class = (Class)PFVideoAVObjectBuilder;
    long long v3 = [(PFVideoAVObjectBuilder *)&v8 description];
    [v3 stringByAppendingFormat:@"(%@, %@, %@)", self->__finalAsset, self->__finalAudioMix, self->__finalVideoComposition];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PFVideoAVObjectBuilder;
    long long v3 = [(PFVideoAVObjectBuilder *)&v7 description];
    [v3 stringByAppendingFormat:@"(%@, %@)", self->_videoAsset, self->_videoAdjustments, v6];
  id v4 = };

  return v4;
}

- (PFVideoAVObjectBuilder)initWithAsset:(id)a3 audioMix:(id)a4 videoComposition:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PFVideoAVObjectBuilder;
  int v12 = [(PFVideoAVObjectBuilder *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->__finalAsset, a3);
    objc_storeStrong((id *)&v13->__finalAudioMix, a4);
    objc_storeStrong((id *)&v13->__finalVideoComposition, a5);
  }

  return v13;
}

- (PFVideoAVObjectBuilder)initWithVideoAsset:(id)a3 videoAdjustments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PFVideoAVObjectBuilder;
  id v9 = [(PFVideoAVObjectBuilder *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoAsset, a3);
    uint64_t v11 = [v8 copy];
    videoAdjustments = v10->_videoAdjustments;
    v10->_videoAdjustments = (PFVideoAdjustments *)v11;
  }
  return v10;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToOriginalTimeFromScaledTime:(SEL)a3 forExport:(id *)a4
{
  *retstr = *a4;
  id v7 = [(PFVideoAVObjectBuilder *)self _getOrCreateTimeRangeMapperForExport:a5];
  if (v7)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
    Float64 Seconds = CMTimeGetSeconds((CMTime *)&v11);
    *(float *)&Float64 Seconds = Seconds;
    [v7 originalTimeForScaledTime:Seconds];
    CMTimeMakeWithSeconds((CMTime *)&v11, v9, +[PFSlowMotionUtilities preferredTimeScale]);
    *retstr = v11;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToScaledTimeFromOriginalTime:(SEL)a3 forExport:(id *)a4
{
  *retstr = *a4;
  id v7 = [(PFVideoAVObjectBuilder *)self _getOrCreateTimeRangeMapperForExport:a5];
  if (v7)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
    Float64 Seconds = CMTimeGetSeconds((CMTime *)&v11);
    *(float *)&Float64 Seconds = Seconds;
    [v7 scaledTimeForOriginalTime:Seconds];
    CMTimeMakeWithSeconds((CMTime *)&v11, v9, +[PFSlowMotionUtilities preferredTimeScale]);
    *retstr = v11;
  }

  return result;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampOutRangeForExport:(SEL)a3
{
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x5010000000;
  id v16 = &unk_1A42EF38E;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v17 = *MEMORY[0x1E4F1FA20];
  long long v18 = v5;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  uint64_t v6 = [(PFVideoAVObjectBuilder *)self _getOrCreateTimeRangeMapperForExport:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__PFVideoAVObjectBuilder_SlowMotion__slowMotionRampOutRangeForExport___block_invoke;
  v10[3] = &unk_1E5B2EB40;
  v10[4] = v11;
  v10[5] = &v13;
  [v6 enumerateScaledRegionsUsingBlock:v10];
  id v7 = v14;
  long long v8 = *((_OWORD *)v14 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v14 + 2);
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v7 + 4);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
  return result;
}

CMTime *__70__PFVideoAVObjectBuilder_SlowMotion__slowMotionRampOutRangeForExport___block_invoke(CMTime *result, double a2, double a3, double a4, float a5, float a6)
{
  uint64_t v6 = *(void *)(*(void *)&result[1].timescale + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    float v9 = result;
    *(unsigned char *)(v6 + 24) = 1;
    CMTimeMakeWithSeconds(&v11, a5, +[PFSlowMotionUtilities preferredTimeScale]);
    *(CMTime *)(*(void *)(v9[1].epoch + 8) + 32) = v11;
    result = CMTimeMakeWithSeconds(&v10, (float)(a6 - a5), +[PFSlowMotionUtilities preferredTimeScale]);
    *(CMTime *)(*(void *)(v9[1].epoch + 8) + 56) = v10;
  }
  return result;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampInRangeForExport:(SEL)a3
{
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x5010000000;
  id v16 = &unk_1A42EF38E;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v17 = *MEMORY[0x1E4F1FA20];
  long long v18 = v5;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  uint64_t v6 = [(PFVideoAVObjectBuilder *)self _getOrCreateTimeRangeMapperForExport:a4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PFVideoAVObjectBuilder_SlowMotion__slowMotionRampInRangeForExport___block_invoke;
  v10[3] = &unk_1E5B2EB40;
  v10[4] = v11;
  v10[5] = &v13;
  [v6 enumerateScaledRegionsUsingBlock:v10];
  id v7 = v14;
  long long v8 = *((_OWORD *)v14 + 3);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v14 + 2);
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v7 + 4);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
  return result;
}

CMTime *__69__PFVideoAVObjectBuilder_SlowMotion__slowMotionRampInRangeForExport___block_invoke(CMTime *result, double a2, float a3, float a4)
{
  uint64_t v4 = *(void *)(*(void *)&result[1].timescale + 8);
  if (!*(unsigned char *)(v4 + 24))
  {
    id v7 = result;
    *(unsigned char *)(v4 + 24) = 1;
    CMTimeMakeWithSeconds(&v9, a3, +[PFSlowMotionUtilities preferredTimeScale]);
    *(CMTime *)(*(void *)(v7[1].epoch + 8) + 32) = v9;
    result = CMTimeMakeWithSeconds(&v8, (float)(a4 - a3), +[PFSlowMotionUtilities preferredTimeScale]);
    *(CMTime *)(*(void *)(v7[1].epoch + 8) + 56) = v8;
  }
  return result;
}

- (id)_getOrCreateTimeRangeMapperForExport:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = 24;
  if (a3) {
    uint64_t v5 = 32;
  }
  uint64_t v6 = (id *)((char *)&self->super.isa + v5);
  id v7 = *(id *)((char *)&self->super.isa + v5);
  if (!v7)
  {
    videoAsset = self->_videoAsset;
    if (videoAsset) {
      [(AVAsset *)videoAsset duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
    [(PFVideoAdjustments *)self->_videoAdjustments slowMotionRate];
    int v12 = v11;
    videoAdjustments = self->_videoAdjustments;
    if (videoAdjustments) {
      [(PFVideoAdjustments *)videoAdjustments slowMotionTimeRange];
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    LODWORD(v10) = v12;
    id v7 = +[PFSlowMotionUtilities timeRangeMapperForSourceDuration:v15 slowMotionRate:v3 slowMotionTimeRange:Seconds forExport:v10];
    objc_storeStrong(v6, v7);
  }

  return v7;
}

- (PFSlowMotionTimeRangeMapper)playbackTimeRangeMapper
{
  return (PFSlowMotionTimeRangeMapper *)[(PFVideoAVObjectBuilder *)self _getOrCreateTimeRangeMapperForExport:0];
}

@end