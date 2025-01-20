@interface _ISPlayerItemChefOperation
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime;
- ($D31FB86CA7B02E89CA780FE277FE9EC8)trimmedTimeRange;
- (AVAsset)asset;
- (BOOL)includeAudio;
- (BOOL)includeVideo;
- (_ISPlayerItemChefOperation)initWithAsset:(id)a3 trimmedTimeRange:(id *)a4 photoTime:(id *)a5 includeAudio:(BOOL)a6 includeVideo:(BOOL)a7 resultHandler:(id)a8;
- (id)resultHandler;
- (void)_handleValuesDidLoad;
- (void)_preparePlayerItem;
- (void)main;
@end

@implementation _ISPlayerItemChefOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (BOOL)includeAudio
{
  return self->_includeAudio;
}

- (BOOL)includeVideo
{
  return self->_includeVideo;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 280);
  return self;
}

- ($D31FB86CA7B02E89CA780FE277FE9EC8)trimmedTimeRange
{
  long long v3 = *(_OWORD *)&self[6].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[6].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[7].var0.var0;
  return self;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)_preparePlayerItem
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  long long v3 = [(_ISPlayerItemChefOperation *)self asset];
  BOOL v4 = [(_ISPlayerItemChefOperation *)self includeAudio];
  v5 = [(_ISPlayerItemChefOperation *)self resultHandler];
  id v93 = 0;
  uint64_t v6 = [v3 statusOfValueForKey:@"tracks" error:&v93];
  id v7 = v93;
  v8 = (long long *)MEMORY[0x1E4F1F9F8];
  if (v6 == 3)
  {
    v9 = ISGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.start.value) = 134218242;
      *(CMTimeValue *)((char *)&buf.start.value + 4) = 3;
      LOWORD(buf.start.flags) = 2112;
      *(void *)((char *)&buf.start.flags + 2) = v7;
      _os_log_error_impl(&dword_1DB21E000, v9, OS_LOG_TYPE_ERROR, "Property loading status:%ld error:%@", (uint8_t *)&buf, 0x16u);
    }

    v10 = (void (*)(void *, void, void, CMTimeRange *, id))v5[2];
    *(_OWORD *)&buf.start.CMTimeValue value = *v8;
    buf.start.CMTimeEpoch epoch = *((void *)v8 + 2);
    v10(v5, 0, 0, &buf, v7);
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F15C18];
    v69 = v3;
    v12 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v3];
    memset(&buf, 0, sizeof(buf));
    v13 = [v12 firstObject];
    v14 = v13;
    v68 = v5;
    if (v13) {
      [v13 timeRange];
    }
    else {
      memset(&buf, 0, sizeof(buf));
    }

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v15 = v12;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v89 objects:v99 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v90 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          if (v20) {
            [v20 timeRange];
          }
          else {
            memset(&otherRange, 0, sizeof(otherRange));
          }
          CMTimeRange range = buf;
          CMTimeRangeGetUnion(&v98, &range, &otherRange);
          CMTimeRange buf = v98;
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v89 objects:v99 count:16];
      }
      while (v17);
    }

    id v21 = objc_alloc_init(MEMORY[0x1E4F16590]);
    id v86 = v7;
    CMTimeRange v98 = buf;
    long long v65 = *v8;
    *(_OWORD *)&range.start.CMTimeValue value = *v8;
    CMTimeEpoch v64 = *((void *)v8 + 2);
    range.start.CMTimeEpoch epoch = v64;
    long long v3 = v69;
    char v22 = [MEMORY[0x1E4F8CC38] insertTimeRange:&v98 ofAsset:v69 atTime:&range intoMutableComposition:v21 error:&v86];
    id v67 = v86;

    v23 = [v21 tracksWithMediaType:v11];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __48___ISPlayerItemChefOperation__preparePlayerItem__block_invoke;
    v84[3] = &unk_1E6BECB38;
    id v66 = v15;
    id v85 = v66;
    [v23 enumerateObjectsUsingBlock:v84];

    if (v22)
    {
      v24 = (void *)MEMORY[0x1E4F16620];
      id v63 = v21;
      v25 = (void *)[v21 copy];
      v26 = [v24 playerItemWithAsset:v25];

      LODWORD(v27) = 2139095039;
      [v26 setSpeedThresholdForIFrameOnlyPlayback:v27];
      [v26 setVideoApertureMode:*MEMORY[0x1E4F161D0]];
      if (v4)
      {
        CMTimeFlags flags = buf.duration.flags;
        if ((buf.duration.flags & 0x1D) == 1)
        {
          CMTimeValue value = buf.duration.value;
          if (buf.duration.value >= 1)
          {
            v61 = v26;
            CMTimeScale timescale = buf.duration.timescale;
            CMTimeEpoch epoch = buf.duration.epoch;
            id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            memset(&v98, 0, 24);
            CMTimeMakeWithSeconds(&v98.start, 0.3, 600);
            range.start.CMTimeValue value = value;
            range.start.CMTimeScale timescale = timescale;
            range.start.CMTimeFlags flags = flags;
            range.start.CMTimeEpoch epoch = epoch;
            CMTimeMultiplyByRatio(&time2, &range.start, 1, 2);
            CMTime time1 = v98.start;
            CMTimeMinimum(&range.start, &time1, &time2);
            v98.start.CMTimeEpoch epoch = range.start.epoch;
            *(_OWORD *)&v98.start.CMTimeValue value = *(_OWORD *)&range.start.value;
            memset(&range, 0, 24);
            time1.CMTimeValue value = value;
            time1.CMTimeScale timescale = timescale;
            time1.CMTimeFlags flags = flags;
            time1.CMTimeEpoch epoch = epoch;
            CMTime rhs = v98.start;
            CMTimeSubtract(&range.start, &time1, &rhs);
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            v33 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15BA8] forAsset:v69];
            uint64_t v34 = [v33 countByEnumeratingWithState:&v77 objects:v97 count:16];
            if (v34)
            {
              uint64_t v35 = v34;
              uint64_t v36 = *(void *)v78;
              long long v70 = *MEMORY[0x1E4F1FA48];
              CMTimeEpoch v37 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
              do
              {
                for (uint64_t j = 0; j != v35; ++j)
                {
                  if (*(void *)v78 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  v39 = [MEMORY[0x1E4F16588] audioMixInputParametersWithTrack:*(void *)(*((void *)&v77 + 1) + 8 * j)];
                  *(_OWORD *)&time1.CMTimeValue value = v70;
                  time1.CMTimeEpoch epoch = v37;
                  CMTime rhs = v98.start;
                  CMTimeRangeMake(&v76, &time1, &rhs);
                  LODWORD(v40) = 1.0;
                  [v39 setVolumeRampFromStartVolume:&v76 toEndVolume:0.0 timeRange:v40];
                  CMTime time1 = range.start;
                  CMTime rhs = v98.start;
                  CMTimeRangeMake(&v75, &time1, &rhs);
                  LODWORD(v41) = 1.0;
                  [v39 setVolumeRampFromStartVolume:&v75 toEndVolume:v41 timeRange:0.0];
                  [v32 addObject:v39];
                }
                uint64_t v35 = [v33 countByEnumeratingWithState:&v77 objects:v97 count:16];
              }
              while (v35);
            }

            id v42 = objc_alloc_init(MEMORY[0x1E4F16580]);
            [v42 setInputParameters:v32];
            [v61 setAudioMix:v42];

            v26 = v61;
            long long v3 = v69;
          }
        }
      }
      if ([(_ISPlayerItemChefOperation *)self isCancelled])
      {
        v5 = v68;
        v43 = (void (*)(void *, void, void, CMTimeRange *, void))v68[2];
        *(_OWORD *)&v98.start.CMTimeValue value = v65;
        v98.start.CMTimeEpoch epoch = v64;
        v43(v68, 0, 0, &v98, 0);
        id v21 = v63;
        v44 = v66;
        id v7 = v67;
      }
      else
      {
        uint64_t v47 = *MEMORY[0x1E4F1CFD0];
        uint64_t v48 = *MEMORY[0x1E4F33D60];
        v95[0] = *MEMORY[0x1E4F33D68];
        v95[1] = v48;
        uint64_t v49 = *MEMORY[0x1E4F33D70];
        v96[0] = v47;
        v96[1] = v49;
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        v62 = v26;
        v51 = [v26 tracks];
        uint64_t v52 = [v51 countByEnumeratingWithState:&v71 objects:v94 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v72;
          do
          {
            for (uint64_t k = 0; k != v53; ++k)
            {
              if (*(void *)v72 != v54) {
                objc_enumerationMutation(v51);
              }
              v56 = *(void **)(*((void *)&v71 + 1) + 8 * k);
              v57 = [v56 assetTrack];
              v58 = [v57 mediaType];
              int v59 = [v58 isEqualToString:v11];

              if (v59) {
                [v56 setVideoEnhancementFilterOptions:v50];
              }
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v71 objects:v94 count:16];
          }
          while (v53);
        }

        if (_preparePlayerItem_onceToken != -1) {
          dispatch_once(&_preparePlayerItem_onceToken, &__block_literal_global_61);
        }
        v5 = v68;
        long long v3 = v69;
        v26 = v62;
        id v21 = v63;
        v44 = v66;
        id v7 = v67;
        [v62 setImageQueueInterpolationCurve:_preparePlayerItem_InterpolationCurveControlPoints];
        memset(&v98, 0, 24);
        if (v69) {
          [v69 duration];
        }
        if (v68)
        {
          v60 = (void (*)(void *, uint64_t, void *, CMTimeRange *, id))v68[2];
          *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)&v98.start.value;
          range.start.CMTimeEpoch epoch = v98.start.epoch;
          v60(v68, 1, v62, &range, v67);
        }
      }
    }
    else
    {
      v45 = ISGetLog();
      id v7 = v67;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v98.start.value) = 138412290;
        *(CMTimeValue *)((char *)&v98.start.value + 4) = (CMTimeValue)v67;
        _os_log_error_impl(&dword_1DB21E000, v45, OS_LOG_TYPE_ERROR, "Error inserting asset contents into composition: %@", (uint8_t *)&v98, 0xCu);
      }

      v5 = v68;
      v46 = (void (*)(void *, void, void, CMTimeRange *, id))v68[2];
      *(_OWORD *)&v98.start.CMTimeValue value = v65;
      v98.start.CMTimeEpoch epoch = v64;
      v46(v68, 0, 0, &v98, v67);
      v44 = v66;
    }
  }
}

- (void)_handleValuesDidLoad
{
  if (([(_ISPlayerItemChefOperation *)self isCancelled] & 1) == 0)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50___ISPlayerItemChefOperation__handleValuesDidLoad__block_invoke;
    block[3] = &unk_1E6BECD80;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

- (void)main
{
  long long v3 = [(_ISPlayerItemChefOperation *)self asset];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34___ISPlayerItemChefOperation_main__block_invoke;
  v4[3] = &unk_1E6BECB10;
  objc_copyWeak(&v5, &location);
  [v3 loadValuesAsynchronouslyForKeys:&unk_1F3554A80 completionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (_ISPlayerItemChefOperation)initWithAsset:(id)a3 trimmedTimeRange:(id *)a4 photoTime:(id *)a5 includeAudio:(BOOL)a6 includeVideo:(BOOL)a7 resultHandler:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  v27.receiver = self;
  v27.super_class = (Class)_ISPlayerItemChefOperation;
  uint64_t v17 = [(_ISPlayerItemChefOperation *)&v27 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_asset, a3);
    long long v20 = *(_OWORD *)&a4->var0.var3;
    long long v19 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v18->_trimmedTimeRange.start.CMTimeValue value = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&v18->_trimmedTimeRange.start.CMTimeEpoch epoch = v20;
    *(_OWORD *)&v18->_trimmedTimeRange.duration.CMTimeScale timescale = v19;
    long long v21 = *(_OWORD *)&a5->var0;
    v18->_photoTime.CMTimeEpoch epoch = a5->var3;
    *(_OWORD *)&v18->_photoTime.CMTimeValue value = v21;
    v18->_includeAudio = a6;
    v18->_includeVideo = a7;
    uint64_t v22 = [v16 copy];
    id resultHandler = v18->_resultHandler;
    v18->_id resultHandler = (id)v22;

    dispatch_queue_t v24 = dispatch_queue_create("com.apple.playeritemchef", 0);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v24;
  }
  return v18;
}

@end