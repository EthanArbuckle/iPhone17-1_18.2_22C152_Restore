@interface PTAssetReader
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration;
- (AVAsset)asset;
- (BOOL)isReadyForReading;
- (BOOL)startReadingFrames:(unint64_t)a3 atTime:(id *)a4 error:(id *)a5;
- (BOOL)startReadingFrames:(unint64_t)a3 error:(id *)a4;
- (BOOL)updateFormatPropertiesFromAsset:(id)a3;
- (NSString)YCbCrMatrix;
- (NSString)colorPrimaries;
- (NSString)transferFunction;
- (PTAssetReader)initWithAsset:(id)a3;
- (PTGlobalCinematographyMetadata)globalCinematographyMetadata;
- (PTGlobalRenderingMetadata)globalRenderingMetadata;
- (PTGlobalStabilizationMetadata)globalStabilizationMetadata;
- (PTGlobalVideoHeaderMetadata)globalVideoHeaderMetadata;
- (id)nextFrame;
- (id)popComposedFrame;
- (opaqueCMFormatDescription)formatDescription;
- (unint64_t)estimatedDataRate;
- (unint64_t)estimatedFrameCount;
- (unint64_t)frameCount;
- (void)_decodeGlobalMetadata;
- (void)_decodeMetadata:(id)a3;
- (void)estimatedFrameCount;
- (void)nextFrame;
- (void)pushComposedFrame:(id)a3;
- (void)setColorPrimaries:(id)a3;
- (void)setTransferFunction:(id)a3;
- (void)setYCbCrMatrix:(id)a3;
- (void)startReadingFrames:(unint64_t)a3;
- (void)stopReadingFrames;
@end

@implementation PTAssetReader

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();

  +[PTSerialization registerSerializationClass:v2];
}

- (BOOL)isReadyForReading
{
  return self->assetReader != 0;
}

- (void)pushComposedFrame:(id)a3
{
  id v5 = a3;
  v4 = self->composedFrames;
  objc_sync_enter(v4);
  [(NSMutableArray *)self->composedFrames addObject:v5];
  objc_sync_exit(v4);
}

- (id)popComposedFrame
{
  v3 = self->composedFrames;
  objc_sync_enter(v3);
  if ([(NSMutableArray *)self->composedFrames count])
  {
    v4 = [(NSMutableArray *)self->composedFrames objectAtIndexedSubscript:0];
    [(NSMutableArray *)self->composedFrames removeObjectAtIndex:0];
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)updateFormatPropertiesFromAsset:(id)a3
{
  v4 = loadTracksWithMediaType(a3, (void *)*MEMORY[0x1E4F15C18]);
  id v5 = [v4 firstObject];
  v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  [v5 estimatedDataRate];
  self->_estimatedDataRate = (unint64_t)v7;
  [v6 nominalFrameRate];
  if (v8 == 0.0)
  {
    CMTimeMake(&v23, 1, 30);
  }
  else
  {
    [v6 nominalFrameRate];
    CMTimeMakeWithSeconds(&v23, 1.0 / v9, 90000);
  }
  self->_frameDuration = ($95D729B680665BEAEFA1D6FCA8238556)v23;
  v10 = [v6 formatDescriptions];
  v11 = (opaqueCMFormatDescription *)[v10 firstObject];

  if (v11)
  {
    self->_formatDescription = v11;
    v12 = CMFormatDescriptionGetExtensions(v11);
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F24C18]];
    YCbCrMatrix = self->_YCbCrMatrix;
    self->_YCbCrMatrix = v13;

    v15 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F24A90]];
    colorPrimaries = self->_colorPrimaries;
    self->_colorPrimaries = v15;

    v17 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F24BC8]];
    transferFunction = self->_transferFunction;
    self->_transferFunction = v17;

    if (!self->_transferFunction)
    {
      v19 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F24B78]];
      v20 = self->_transferFunction;
      self->_transferFunction = v19;
    }
    BOOL v21 = 1;
  }
  else
  {
LABEL_9:
    BOOL v21 = 0;
  }

  return v21;
}

- (PTAssetReader)initWithAsset:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTAssetReader;
  v6 = [(PTAssetReader *)&v9 init];
  float v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    if ([(PTAssetReader *)v7 updateFormatPropertiesFromAsset:v5])
    {
      [(PTAssetReader *)v7 stopReadingFrames];
    }
    else
    {

      float v7 = 0;
    }
  }

  return v7;
}

- (void)startReadingFrames:(unint64_t)a3
{
  uint64_t v3 = 0;
  [(PTAssetReader *)self startReadingFrames:a3 error:&v3];
}

- (BOOL)startReadingFrames:(unint64_t)a3 error:(id *)a4
{
  long long v5 = *MEMORY[0x1E4F1F9F8];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  return [(PTAssetReader *)self startReadingFrames:a3 atTime:&v5 error:a4];
}

- (BOOL)startReadingFrames:(unint64_t)a3 atTime:(id *)a4 error:(id *)a5
{
  char v7 = a3;
  float v8 = self;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  [(PTAssetReader *)self stopReadingFrames];
  objc_super v9 = (void *)MEMORY[0x1E4F16378];
  v10 = [(PTAssetReader *)v8 asset];
  uint64_t v11 = [v9 assetReaderWithAsset:v10 error:a5];
  assetReader = v8->assetReader;
  v8->assetReader = (AVAssetReader *)v11;

  v13 = v8->assetReader;
  if (v13)
  {
    v14 = [(AVAssetReader *)v13 asset];
    v15 = loadTracksWithMediaType(v14, (void *)*MEMORY[0x1E4F15C18]);
    memset(duration, 0, sizeof(duration));
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:duration objects:&range count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v18 = a5;
      char v19 = v7;
      uint64_t v20 = **(void **)&duration[16];
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (**(void **)&duration[16] != v20) {
            objc_enumerationMutation(v15);
          }
          v22 = *(void **)(*(void *)&duration[8] + 8 * i);
          if ([v22 isEnabled])
          {
            char v7 = v19;
            a5 = v18;
            id v23 = v22;
            goto LABEL_13;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:duration objects:&range count:16];
        if (v17) {
          continue;
        }
        break;
      }
      char v7 = v19;
      a5 = v18;
    }
    id v23 = 0;
LABEL_13:

    if (v23)
    {
      if (v7)
      {
        v80 = a4;
        v81 = v8;
        v82 = v23;
        v24 = [(AVAssetReader *)v8->assetReader asset];
        v25 = loadTracksWithMediaType(v24, (void *)*MEMORY[0x1E4F15BE0]);
        memset(duration, 0, sizeof(duration));
        long long v98 = 0u;
        long long v99 = 0u;
        uint64_t v26 = [v25 countByEnumeratingWithState:duration objects:&range count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          v78 = v24;
          char v79 = v7;
          uint64_t v28 = **(void **)&duration[16];
          while (2)
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (**(void **)&duration[16] != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*(void *)&duration[8] + 8 * j);
              if ([v30 isEnabled])
              {
                v31 = [v30 formatDescriptions];
                v32 = (const opaqueCMFormatDescription *)[v31 firstObject];

                if (v32)
                {
                  v33 = CMMetadataFormatDescriptionGetIdentifiers(v32);
                  v34 = [@"mdta/" stringByAppendingString:@"com.apple.quicktime.cinematic-video.cinematography"];
                  v35 = [@"mdta/" stringByAppendingString:@"com.apple.quicktime.cinematography-dictionary"];
                  if (([v33 containsObject:v34] & 1) != 0
                    || ([v33 containsObject:v35] & 1) != 0)
                  {
                    id v36 = v30;

                    goto LABEL_31;
                  }
                }
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:duration objects:&range count:16];
            if (v27) {
              continue;
            }
            break;
          }
          id v36 = 0;
LABEL_31:
          char v7 = v79;
          v24 = v78;
        }
        else
        {
          id v36 = 0;
        }

        float v8 = v81;
        if (!v36)
        {
          v75 = NSString;
          v76 = [(AVAssetReader *)v81->assetReader asset];
          v77 = [v75 stringWithFormat:@"Couldn't find metadata track in asset: %@", v76];
          AssetReaderError(v77);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          BOOL v37 = 0;
          id v23 = v82;
          goto LABEL_65;
        }
        id v23 = v82;
        [v82 timeRange];
        [v36 timeRange];
        if (!CMTimeRangeEqual(&range1, &range2))
        {
          v40 = _PTLogSystem();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            [v36 timeRange];
            CFAllocatorRef v41 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            CMTimeRange range = v94;
            v42 = (__CFString *)CMTimeRangeCopyDescription(v41, &range);
            [v82 timeRange];
            CMTimeRange range = v93;
            v43 = (__CFString *)CMTimeRangeCopyDescription(v41, &range);
            LODWORD(range.start.value) = 138412546;
            *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v42;
            LOWORD(range.start.flags) = 2112;
            *(void *)((char *)&range.start.flags + 2) = v43;
            _os_log_impl(&dword_1D0778000, v40, OS_LOG_TYPE_INFO, "WARNING: meta timeRange (%@) not equal to vide timeRange (%@)", (uint8_t *)&range, 0x16u);
          }
        }
        v44 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v36 outputSettings:0];
        uint64_t v45 = [objc_alloc(MEMORY[0x1E4F16390]) initWithAssetReaderTrackOutput:v44];
        metadataAdaptor = v81->metadataAdaptor;
        v81->metadataAdaptor = (AVAssetReaderOutputMetadataAdaptor *)v45;

        [(AVAssetReader *)v81->assetReader addOutput:v44];
        a4 = v80;
      }
      if ((v7 & 6) == 0)
      {
LABEL_57:
        if (a4->var2)
        {
          *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0;
          range.start.int64_t epoch = a4->var3;
          *(_OWORD *)duration = *MEMORY[0x1E4F1FA10];
          *(void *)&duration[16] = *(void *)(MEMORY[0x1E4F1FA10] + 16);
          CMTimeRangeMake(&v84, &range.start, (CMTime *)duration);
          v71 = v8->assetReader;
          CMTimeRange v83 = v84;
          [(AVAssetReader *)v71 setTimeRange:&v83];
        }
        if ([(AVAssetReader *)v8->assetReader startReading])
        {
          BOOL v37 = 1;
        }
        else
        {
          [(AVAssetReader *)v8->assetReader error];
          BOOL v37 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_65;
      }
      uint64_t v47 = objc_opt_new();
      composedFrames = v8->composedFrames;
      v8->composedFrames = (NSMutableArray *)v47;

      v49 = [(AVAssetReader *)v8->assetReader asset];
      v50 = loadTracksWithMediaType(v49, (void *)*MEMORY[0x1E4F15BB8]);
      memset(duration, 0, sizeof(duration));
      long long v98 = 0u;
      long long v99 = 0u;
      uint64_t v51 = [v50 countByEnumeratingWithState:duration objects:&range count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = **(void **)&duration[16];
        while (2)
        {
          for (uint64_t k = 0; k != v52; ++k)
          {
            if (**(void **)&duration[16] != v53) {
              objc_enumerationMutation(v50);
            }
            v55 = *(void **)(*(void *)&duration[8] + 8 * k);
            if ([v55 isEnabled])
            {
              id v56 = v55;
              goto LABEL_50;
            }
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:duration objects:&range count:16];
          if (v52) {
            continue;
          }
          break;
        }
      }
      id v56 = 0;
LABEL_50:

      if (v56)
      {
        v57 = a4;
        uint64_t v58 = [v23 trackID];
        uint64_t v59 = [v56 trackID];
        v60 = objc_alloc_init(PTAssetReaderCompositionInstruction);
        *(_OWORD *)&range.start.value = *MEMORY[0x1E4F1FA48];
        range.start.int64_t epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        *(_OWORD *)duration = *MEMORY[0x1E4F1FA10];
        *(void *)&duration[16] = *(void *)(MEMORY[0x1E4F1FA10] + 16);
        CMTimeRangeMake(&v92, &range.start, (CMTime *)duration);
        CMTimeRange v91 = v92;
        [(PTAssetReaderCompositionInstruction *)v60 setTimeRange:&v91];
        [(PTAssetReaderCompositionInstruction *)v60 setVideTrackID:v58];
        [(PTAssetReaderCompositionInstruction *)v60 setAuxvTrackID:v59];
        [(PTAssetReaderCompositionInstruction *)v60 setAssetReader:v8];
        [v23 timeRange];
        [v56 timeRange];
        if (!CMTimeRangeEqual(&v90, &v89))
        {
          v61 = _PTLogSystem();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            [v56 timeRange];
            CFAllocatorRef v62 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            CMTimeRange range = v88;
            v63 = (__CFString *)CMTimeRangeCopyDescription(v62, &range);
            [v23 timeRange];
            CMTimeRange range = v87;
            v64 = (__CFString *)CMTimeRangeCopyDescription(v62, &range);
            LODWORD(range.start.value) = 138412546;
            *(CMTimeValue *)((char *)&range.start.value + 4) = (CMTimeValue)v63;
            LOWORD(range.start.flags) = 2112;
            *(void *)((char *)&range.start.flags + 2) = v64;
            _os_log_impl(&dword_1D0778000, v61, OS_LOG_TYPE_INFO, "WARNING: auxv timeRange (%@) not equal to vide timeRange (%@)", (uint8_t *)&range, 0x16u);
          }
        }
        uint64_t v65 = [MEMORY[0x1E4F165B0] videoComposition];
        videoComposition = v8->videoComposition;
        v8->videoComposition = (AVMutableVideoComposition *)v65;

        [(AVMutableVideoComposition *)v8->videoComposition setCustomVideoCompositorClass:objc_opt_class()];
        [(AVMutableVideoComposition *)v8->videoComposition setSourceTrackIDForFrameTiming:v58];
        [v23 naturalSize];
        -[AVMutableVideoComposition setRenderSize:](v8->videoComposition, "setRenderSize:");
        long long v85 = *(_OWORD *)&v8->_frameDuration.value;
        int64_t epoch = v8->_frameDuration.epoch;
        [(AVMutableVideoComposition *)v8->videoComposition setFrameDuration:&v85];
        v101 = v60;
        v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
        [(AVMutableVideoComposition *)v8->videoComposition setInstructions:v67];

        v100[0] = v23;
        v100[1] = v56;
        v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:2];
        uint64_t v69 = [objc_alloc(MEMORY[0x1E4F163A8]) initWithVideoTracks:v68 videoSettings:0];
        videoCompositionOutput = v8->videoCompositionOutput;
        v8->videoCompositionOutput = (AVAssetReaderVideoCompositionOutput *)v69;

        [(AVAssetReaderVideoCompositionOutput *)v8->videoCompositionOutput setVideoComposition:v8->videoComposition];
        [(AVAssetReaderVideoCompositionOutput *)v8->videoCompositionOutput setAlwaysCopiesSampleData:0];
        if ([(AVAssetReader *)v8->assetReader canAddOutput:v8->videoCompositionOutput])
        {
          [(AVAssetReader *)v8->assetReader addOutput:v8->videoCompositionOutput];

          a4 = v57;
          goto LABEL_57;
        }
        AssetReaderError(@"Cannot add videoCompositionOutput to assetReader");
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_64;
      }
      v72 = NSString;
      v39 = [(AVAssetReader *)v8->assetReader asset];
      [v72 stringWithFormat:@"Couldn't find disparity track in asset: %@", v39];
    }
    else
    {
      v38 = NSString;
      v39 = [(AVAssetReader *)v8->assetReader asset];
      [v38 stringWithFormat:@"Couldn't find video track in asset: %@", v39];
    v73 = };
    AssetReaderError(v73);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_64:
    BOOL v37 = 0;
LABEL_65:

    return v37;
  }
  return 0;
}

- (void)stopReadingFrames
{
  assetReader = self->assetReader;
  if (assetReader)
  {
    [(AVAssetReader *)assetReader cancelReading];
    v4 = self->assetReader;
    self->assetReader = 0;
  }
  metadataAdaptor = self->metadataAdaptor;
  self->metadataAdaptor = 0;

  videoComposition = self->videoComposition;
  self->videoComposition = 0;

  videoCompositionOutput = self->videoCompositionOutput;
  self->videoCompositionOutput = 0;

  composedFrames = self->composedFrames;
  self->composedFrames = 0;

  self->lastDecodedFrameIndex = -1;
}

- (unint64_t)estimatedFrameCount
{
  uint64_t v3 = [(PTAssetReader *)self asset];
  v4 = loadTracksWithMediaType(v3, (void *)*MEMORY[0x1E4F15C18]);

  long long v5 = [v4 firstObject];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [(PTAssetReader *)self asset];
  char v7 = v6;
  if (v6) {
    [v6 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  [v5 nominalFrameRate];
  double v10 = Seconds * v9;

  unint64_t v11 = vcvtad_u64_f64(v10);
  if (!v11)
  {
LABEL_6:
    v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PTAssetReader estimatedFrameCount](v12);
    }

    unint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)frameCount
{
  unint64_t result = self->_cachedAccurateFrameCount;
  if (!result)
  {
    [(PTAssetReader *)self startReadingFrames:4];
    while (1)
    {
      id v4 = [(PTAssetReader *)self nextFrame];

      if (!v4) {
        break;
      }
      ++self->_cachedAccurateFrameCount;
    }
    [(PTAssetReader *)self stopReadingFrames];
    return self->_cachedAccurateFrameCount;
  }
  return result;
}

- (PTGlobalCinematographyMetadata)globalCinematographyMetadata
{
  globalCinematographyMetadata = self->_globalCinematographyMetadata;
  if (!globalCinematographyMetadata)
  {
    [(PTAssetReader *)self _decodeGlobalMetadata];
    globalCinematographyMetadata = self->_globalCinematographyMetadata;
  }

  return globalCinematographyMetadata;
}

- (PTGlobalRenderingMetadata)globalRenderingMetadata
{
  globalRenderingMetadata = self->_globalRenderingMetadata;
  if (!globalRenderingMetadata)
  {
    [(PTAssetReader *)self _decodeGlobalMetadata];
    globalRenderingMetadata = self->_globalRenderingMetadata;
  }

  return globalRenderingMetadata;
}

- (PTGlobalStabilizationMetadata)globalStabilizationMetadata
{
  globalStabilizationMetadata = self->_globalStabilizationMetadata;
  if (!globalStabilizationMetadata)
  {
    [(PTAssetReader *)self _decodeGlobalMetadata];
    globalStabilizationMetadata = self->_globalStabilizationMetadata;
  }

  return globalStabilizationMetadata;
}

- (PTGlobalVideoHeaderMetadata)globalVideoHeaderMetadata
{
  globalVideoHeaderMetadata = self->_globalVideoHeaderMetadata;
  if (!globalVideoHeaderMetadata)
  {
    [(PTAssetReader *)self _decodeGlobalMetadata];
    globalVideoHeaderMetadata = self->_globalVideoHeaderMetadata;
  }

  return globalVideoHeaderMetadata;
}

- (void)_decodeGlobalMetadata
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(&dword_1D0778000, v0, v1, "Failed to deserialize global rendering metadata: %@", v2);
}

- (void)_decodeMetadata:(id)a3
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v54[0] = @"com.apple.quicktime.camera-dictionary";
  v54[1] = @"com.apple.quicktime.cinematography-dictionary";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v45;
    id v42 = v4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v10 = [v3 objectForKeyedSubscript:v9];
        if (v10)
        {
          unint64_t v11 = (void *)v10;
          v12 = [v3 objectForKeyedSubscript:v9];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            v14 = [v3 objectForKeyedSubscript:v9];
            objc_opt_class();
            char v15 = objc_opt_isKindOfClass();

            if (v15)
            {
              uint64_t v16 = [v3 objectForKeyedSubscript:v9];
              v52[0] = objc_opt_class();
              v52[1] = objc_opt_class();
              v52[2] = objc_opt_class();
              v52[3] = objc_opt_class();
              v52[4] = objc_opt_class();
              uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:5];
              v18 = (void *)MEMORY[0x1E4F28DC0];
              char v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
              id v43 = 0;
              uint64_t v20 = [v18 unarchivedObjectOfClasses:v19 fromData:v16 error:&v43];
              BOOL v21 = v43;

              if (v21)
              {
                v22 = _PTLogSystem();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v49 = v9;
                  __int16 v50 = 2112;
                  uint64_t v51 = v21;
                  _os_log_error_impl(&dword_1D0778000, v22, OS_LOG_TYPE_ERROR, "ERROR: Failed to decode metadata dictionary for %@. Decoder failed: %@", buf, 0x16u);
                }
              }
              else
              {
                [v3 setObject:v20 forKeyedSubscript:v9];
              }

              id v4 = v42;
            }
            else
            {
              BOOL v21 = _PTLogSystem();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v49 = v9;
                _os_log_error_impl(&dword_1D0778000, v21, OS_LOG_TYPE_ERROR, "ERROR: Failed to decode metadata dictionary for %@. Value is not NSData.", buf, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v6);
  }

  id v23 = [v3 objectForKeyedSubscript:@"com.apple.quicktime.cinematic-video.rendering"];

  if (v23)
  {
    v24 = [v3 objectForKeyedSubscript:@"com.apple.quicktime.cinematic-video.rendering"];
    v25 = [(PTAssetReader *)self globalRenderingMetadata];
    uint64_t v26 = [v25 majorVersion];
    uint64_t v27 = [(PTAssetReader *)self globalRenderingMetadata];
    uint64_t v28 = +[PTTimedRenderingMetadata objectFromData:withMajorVersion:minorVersion:](PTTimedRenderingMetadata, "objectFromData:withMajorVersion:minorVersion:", v24, v26, [v27 minorVersion]);

    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"com.apple.quicktime.cinematic-video.rendering"];
    }
    else
    {
      v29 = _PTLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[PTAssetReader _decodeMetadata:](v3, @"com.apple.quicktime.cinematic-video.rendering");
      }
    }
  }
  v30 = [v3 objectForKeyedSubscript:@"com.apple.quicktime.cinematic-video.stabilization"];

  if (v30)
  {
    v31 = [v3 objectForKeyedSubscript:@"com.apple.quicktime.cinematic-video.stabilization"];
    v32 = [(PTAssetReader *)self globalStabilizationMetadata];
    uint64_t v33 = [v32 majorVersion];
    v34 = [(PTAssetReader *)self globalStabilizationMetadata];
    v35 = +[PTTimedStabilizationMetadata objectFromData:withMajorVersion:minorVersion:](PTTimedStabilizationMetadata, "objectFromData:withMajorVersion:minorVersion:", v31, v33, [v34 minorVersion]);

    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"com.apple.quicktime.cinematic-video.stabilization"];
    }
    else
    {
      id v36 = _PTLogSystem();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[PTAssetReader _decodeMetadata:](v3, @"com.apple.quicktime.cinematic-video.stabilization");
      }
    }
  }
  BOOL v37 = [v3 objectForKeyedSubscript:@"com.apple.quicktime.cinematic-video.cinematography"];

  if (v37)
  {
    v38 = [v3 objectForKeyedSubscript:@"com.apple.quicktime.cinematic-video.cinematography"];
    v39 = +[PTSerialization objectFromData:v38 error:0];

    if (v39)
    {
      [v3 setObject:v39 forKeyedSubscript:@"com.apple.quicktime.cinematic-video.cinematography"];
    }
    else
    {
      v40 = _PTLogSystem();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[PTAssetReader _decodeMetadata:](v3, @"com.apple.quicktime.cinematic-video.cinematography");
      }
    }
  }
}

- (id)nextFrame
{
  uint64_t v2 = self;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D25E42A0](self, a2);
  ++v2->lastDecodedFrameIndex;
  id v4 = (id)objc_opt_new();
  [v4 setIndex:v2->lastDecodedFrameIndex];
  metadataAdaptor = v2->metadataAdaptor;
  if (metadataAdaptor)
  {
    uint64_t v6 = [(AVAssetReaderOutputMetadataAdaptor *)metadataAdaptor nextTimedMetadataGroup];
    if (v6)
    {
      v32 = v2;
      uint64_t v33 = v4;
      v34 = v3;
      uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
      CMTimeValue value = *MEMORY[0x1E4F1F9F8];
      CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
      CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
      CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v31 = v6;
      uint64_t v10 = [v6 items];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v62 != v13) {
              objc_enumerationMutation(v10);
            }
            char v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            if (flags)
            {
              if (v15) {
                [*(id *)(*((void *)&v61 + 1) + 8 * i) time];
              }
              else {
                memset(&time1, 0, sizeof(time1));
              }
              time2.CMTimeValue value = value;
              time2.CMTimeScale timescale = timescale;
              time2.CMTimeFlags flags = flags;
              time2.CMTimeEpoch epoch = epoch;
              if (CMTimeCompare(&time1, &time2)) {
                NSLog(&cfstr_WarningMetadat.isa);
              }
            }
            else
            {
              if (v15)
              {
                [*(id *)(*((void *)&v61 + 1) + 8 * i) time];
                CMTimeFlags flags = time2.flags;
                CMTimeEpoch epoch = time2.epoch;
              }
              else
              {
                CMTimeEpoch epoch = 0;
                CMTimeFlags flags = 0;
                memset(&time2, 0, sizeof(time2));
              }
              CMTimeValue value = time2.value;
              CMTimeScale timescale = time2.timescale;
            }
            uint64_t v16 = [v15 value];
            uint64_t v17 = [v15 key];
            [v7 setObject:v16 forKeyedSubscript:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v61 objects:v65 count:16];
        }
        while (v12);
      }

      uint64_t v2 = v32;
      [(PTAssetReader *)v32 _decodeMetadata:v7];
      id v4 = v33;
      [v33 setMetadata:v7];
      CMTimeValue v55 = value;
      CMTimeScale v56 = timescale;
      CMTimeFlags v57 = flags;
      CMTimeEpoch v58 = epoch;
      [v33 setMetadataTime:&v55];
      if ((flags & 1) == 0) {
        NSLog(&cfstr_WarningMetadat_0.isa);
      }

      id v3 = v34;
      uint64_t v6 = v31;
    }
    else if (!v2->videoCompositionOutput)
    {

      id v4 = 0;
    }
  }
  videoCompositionOutput = v2->videoCompositionOutput;
  if (!videoCompositionOutput) {
    goto LABEL_46;
  }
  char v19 = (const void *)[(AVAssetReaderVideoCompositionOutput *)videoCompositionOutput copyNextSampleBuffer];
  if (!v19)
  {
    BOOL v21 = v4;
    id v4 = 0;
LABEL_45:

LABEL_46:
    id v4 = v4;
    uint64_t v26 = v4;
    goto LABEL_47;
  }
  CFRelease(v19);
  uint64_t v20 = [(PTAssetReader *)v2 popComposedFrame];
  if (v20)
  {
    BOOL v21 = v20;
    [v20 time];
    long long v51 = v53;
    uint64_t v52 = v54;
    [v4 setTime:&v51];
    objc_msgSend(v4, "setColorBuffer:", CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v21, "colorBuffer")));
    [v21 time];
    long long v47 = v49;
    uint64_t v48 = v50;
    [v4 setColorBufferTime:&v47];
    v22 = [(AVAssetReaderVideoCompositionOutput *)v2->videoCompositionOutput videoTracks];
    id v23 = [v22 objectAtIndexedSubscript:0];
    v24 = v23;
    if (v23)
    {
      [v23 preferredTransform];
    }
    else
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v44 = 0u;
    }
    v43[0] = v44;
    v43[1] = v45;
    v43[2] = v46;
    [v4 setColorBufferPreferredTransform:v43];

    if ([v21 auxBuffer])
    {
      if (CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v21 auxBuffer]) == 1751411059)
      {
        objc_msgSend(v4, "setDisparityBuffer:", CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v21, "auxBuffer")));
        [v21 time];
        long long v39 = v41;
        uint64_t v40 = v42;
        [v4 setDisparityBufferTime:&v39];
        uint64_t v27 = [(AVAssetReaderVideoCompositionOutput *)v2->videoCompositionOutput videoTracks];
        uint64_t v28 = [v27 objectAtIndexedSubscript:1];
        v29 = v28;
        if (v28)
        {
          [v28 preferredTransform];
        }
        else
        {
          long long v37 = 0u;
          long long v38 = 0u;
          long long v36 = 0u;
        }
        v35[0] = v36;
        v35[1] = v37;
        v35[2] = v38;
        [v4 setDisparityBufferPreferredTransform:v35];
      }
      else
      {
        uint64_t v27 = _PTLogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[PTAssetReader nextFrame](v4);
        }
      }
    }
    goto LABEL_45;
  }
  v25 = _PTLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[PTAssetReader nextFrame](v4);
  }

  uint64_t v26 = 0;
LABEL_47:

  return v26;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (unint64_t)estimatedDataRate
{
  return self->_estimatedDataRate;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (NSString)colorPrimaries
{
  return self->_colorPrimaries;
}

- (void)setColorPrimaries:(id)a3
{
}

- (NSString)transferFunction
{
  return self->_transferFunction;
}

- (void)setTransferFunction:(id)a3
{
}

- (NSString)YCbCrMatrix
{
  return self->_YCbCrMatrix;
}

- (void)setYCbCrMatrix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_YCbCrMatrix, 0);
  objc_storeStrong((id *)&self->_transferFunction, 0);
  objc_storeStrong((id *)&self->_colorPrimaries, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_globalVideoHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_globalStabilizationMetadata, 0);
  objc_storeStrong((id *)&self->_globalRenderingMetadata, 0);
  objc_storeStrong((id *)&self->_globalCinematographyMetadata, 0);
  objc_storeStrong((id *)&self->composedFrames, 0);
  objc_storeStrong((id *)&self->videoCompositionOutput, 0);
  objc_storeStrong((id *)&self->videoComposition, 0);
  objc_storeStrong((id *)&self->metadataAdaptor, 0);

  objc_storeStrong((id *)&self->assetReader, 0);
}

- (void)estimatedFrameCount
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "ERROR: couldn't calculate frame count", v1, 2u);
}

- (void)_decodeMetadata:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v3, v4, "Failed to deserialize cinematography metadata: %@", v5, v6, v7, v8, v9);
}

- (void)_decodeMetadata:(void *)a1 .cold.2(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v3, v4, "Failed to deserialize timed stabilization metadata: %@", v5, v6, v7, v8, v9);
}

- (void)_decodeMetadata:(void *)a1 .cold.3(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v3, v4, "Failed to deserialize timed rendering metadata: %@", v5, v6, v7, v8, v9);
}

- (void)nextFrame
{
  [a1 index];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v1, v2, "Failed to decode auxv buffer for frame %lu. Format was not 'kCVPixelFormatType_DisparityFloat16'", v3, v4, v5, v6, v7);
}

@end