@interface NUVideoCompositionInstruction
+ (id)defaultInstructionForAsset:(id)a3 error:(id *)a4;
+ (id)instructionForVideoTrack:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale;
- ($246D6535441D8C1432A5B8F9230D346F)timeRange;
- (BOOL)containsTweening;
- (BOOL)enablePostProcessing;
- (BOOL)isDolbyVision;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstruction:(id)a3;
- (BOOL)requestedWindowOfSamples;
- (NSArray)pipelineFilters;
- (NSArray)requiredSourceSampleDataTrackIDs;
- (NSArray)requiredSourceTrackIDs;
- (NSString)description;
- (NSString)mainTrackSourceIdentifier;
- (NSString)name;
- (NUColorSpace)colorSpace;
- (NUComposition)adjustmentComposition;
- (NURenderContext)renderContext;
- (NURenderJob)renderJob;
- (NURenderNode)videoRenderPrepareNode;
- (NUVideoCompositionInstruction)init;
- (float)playbackRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)metadataTrackIDForSourceIdentifier:(id)a3;
- (id)sourceIdentifierForMetadataTrackID:(id)a3;
- (id)sourceIdentifierForTrackID:(id)a3;
- (id)trackIDForSourceIdentifier:(id)a3;
- (int)passthroughTrackID;
- (int64_t)sampleMode;
- (unint64_t)hash;
- (void)setAdjustmentComposition:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setIsDolbyVision:(BOOL)a3;
- (void)setMainTrackSourceIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPipelineFilters:(id)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setRenderContext:(id)a3;
- (void)setRenderJob:(id)a3;
- (void)setRenderScale:(id)a3;
- (void)setRequestedWindowOfSamples:(BOOL)a3;
- (void)setRequiredSourceTrackIDs:(id)a3;
- (void)setSampleMode:(int64_t)a3;
- (void)setSourceIdentifier:(id)a3 forMetadataTrackID:(id)a4;
- (void)setSourceIdentifier:(id)a3 forTrackID:(id)a4;
- (void)setTimeRange:(id *)a3;
- (void)setVideoRenderPrepareNode:(id)a3;
@end

@implementation NUVideoCompositionInstruction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainTrackSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_pipelineFilters, 0);
  objc_storeStrong((id *)&self->_adjustmentComposition, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_videoRenderPrepareNode, 0);
  objc_destroyWeak((id *)&self->_renderJob);
  objc_storeStrong((id *)&self->_requiredSourceTrackIDs, 0);
  objc_storeStrong((id *)&self->_sourceIdentifiersByMetadataTrackID, 0);

  objc_storeStrong((id *)&self->_sourceIdentifiersByTrackID, 0);
}

- (void)setMainTrackSourceIdentifier:(id)a3
{
}

- (NSString)mainTrackSourceIdentifier
{
  return self->_mainTrackSourceIdentifier;
}

- (void)setRequestedWindowOfSamples:(BOOL)a3
{
  self->_requestedWindowOfSamples = a3;
}

- (BOOL)requestedWindowOfSamples
{
  return self->_requestedWindowOfSamples;
}

- (void)setSampleMode:(int64_t)a3
{
  self->_sampleMode = a3;
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setIsDolbyVision:(BOOL)a3
{
  self->_isDolbyVision = a3;
}

- (BOOL)isDolbyVision
{
  return self->_isDolbyVision;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setRenderScale:(id)a3
{
  self->_renderScale = ($F9703ADC4DD3124DE91DE417D7636CC9)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale
{
  int64_t denominator = self->_renderScale.denominator;
  int64_t numerator = self->_renderScale.numerator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- (void)setPipelineFilters:(id)a3
{
}

- (NSArray)pipelineFilters
{
  return self->_pipelineFilters;
}

- (void)setAdjustmentComposition:(id)a3
{
}

- (NUComposition)adjustmentComposition
{
  return self->_adjustmentComposition;
}

- (void)setRenderContext:(id)a3
{
}

- (NURenderContext)renderContext
{
  return (NURenderContext *)objc_getProperty(self, a2, 64, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setVideoRenderPrepareNode:(id)a3
{
}

- (NURenderNode)videoRenderPrepareNode
{
  return (NURenderNode *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRenderJob:(id)a3
{
}

- (NURenderJob)renderJob
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderJob);

  return (NURenderJob *)WeakRetained;
}

- (void)setRequiredSourceTrackIDs:(id)a3
{
}

- (NSArray)requiredSourceTrackIDs
{
  return self->_requiredSourceTrackIDs;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- ($246D6535441D8C1432A5B8F9230D346F)timeRange
{
  long long v3 = *(_OWORD *)&self[3].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var3;
  return self;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)NUVideoCompositionInstruction;
  return [(NUVideoCompositionInstruction *)&v3 hash];
}

- (BOOL)isEqualToInstruction:(id)a3
{
  long long v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_3;
  }
  id v6 = [v4 renderJob];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderJob);

  if (v6 != WeakRetained) {
    goto LABEL_3;
  }
  [v5 timeRange];
  long long v10 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&v18.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&v18.start.epoch = v10;
  *(_OWORD *)&v18.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v18)) {
    goto LABEL_3;
  }
  uint64_t v11 = [v5 renderScale];
  if (!NUScaleEqual(v11, v12, self->_renderScale.numerator, self->_renderScale.denominator)) {
    goto LABEL_3;
  }
  v13 = [v5 requiredSourceTrackIDs];
  int v14 = [v13 isEqualToArray:self->_requiredSourceTrackIDs];

  if (v14
    && (int v15 = [v5 containsTweening],
        v15 == [(NUVideoCompositionInstruction *)self containsTweening])
    && (int v16 = [v5 passthroughTrackID],
        v16 == [(NUVideoCompositionInstruction *)self passthroughTrackID])
    && (int v17 = [v5 enablePostProcessing],
        v17 == [(NUVideoCompositionInstruction *)self enablePostProcessing]))
  {
    char v8 = [v5[1] isEqual:self->_sourceIdentifiersByTrackID];
  }
  else
  {
LABEL_3:
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (NUVideoCompositionInstruction *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NUVideoCompositionInstruction *)self isEqualToInstruction:v4];
  }

  return v5;
}

- (id)metadataTrackIDForSourceIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = [(NSMutableDictionary *)self->_sourceIdentifiersByMetadataTrackID allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [(NSMutableDictionary *)self->_sourceIdentifiersByMetadataTrackID objectForKeyedSubscript:v10];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)sourceIdentifierForMetadataTrackID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sourceIdentifiersByMetadataTrackID objectForKeyedSubscript:a3];
}

- (void)setSourceIdentifier:(id)a3 forMetadataTrackID:(id)a4
{
}

- (id)trackIDForSourceIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = [(NSMutableDictionary *)self->_sourceIdentifiersByTrackID allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [(NSMutableDictionary *)self->_sourceIdentifiersByTrackID objectForKeyedSubscript:v10];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)sourceIdentifierForTrackID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_sourceIdentifiersByTrackID objectForKeyedSubscript:a3];
}

- (void)setSourceIdentifier:(id)a3 forTrackID:(id)a4
{
}

- (NSArray)requiredSourceSampleDataTrackIDs
{
  return (NSArray *)[(NSMutableDictionary *)self->_sourceIdentifiersByMetadataTrackID allKeys];
}

- (int)passthroughTrackID
{
  return 0;
}

- (BOOL)containsTweening
{
  return 1;
}

- (BOOL)enablePostProcessing
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_alloc_init(NUVideoCompositionInstruction);
  long long v6 = *(_OWORD *)&self->_timeRange.start.epoch;
  v17[0] = *(_OWORD *)&self->_timeRange.start.value;
  v17[1] = v6;
  v17[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  [(NUVideoCompositionInstruction *)v5 setTimeRange:v17];
  uint64_t v7 = (void *)[(NSArray *)self->_requiredSourceTrackIDs copyWithZone:a3];
  [(NUVideoCompositionInstruction *)v5 setRequiredSourceTrackIDs:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderJob);
  [(NUVideoCompositionInstruction *)v5 setRenderJob:WeakRetained];

  id v9 = [(NUComposition *)self->_adjustmentComposition copyWithZone:a3];
  [(NUVideoCompositionInstruction *)v5 setAdjustmentComposition:v9];

  long long v10 = (void *)[(NSArray *)self->_pipelineFilters copyWithZone:a3];
  [(NUVideoCompositionInstruction *)v5 setPipelineFilters:v10];

  -[NUVideoCompositionInstruction setRenderScale:](v5, "setRenderScale:", self->_renderScale.numerator, self->_renderScale.denominator);
  [(NUVideoCompositionInstruction *)v5 setColorSpace:self->_colorSpace];
  [(NUVideoCompositionInstruction *)v5 setIsDolbyVision:self->_isDolbyVision];
  *(float *)&double v11 = self->_playbackRate;
  [(NUVideoCompositionInstruction *)v5 setPlaybackRate:v11];
  [(NUVideoCompositionInstruction *)v5 setName:self->_name];
  uint64_t v12 = [(NSMutableDictionary *)self->_sourceIdentifiersByTrackID mutableCopyWithZone:a3];
  sourceIdentifiersByTrackID = v5->_sourceIdentifiersByTrackID;
  v5->_sourceIdentifiersByTrackID = (NSMutableDictionary *)v12;

  uint64_t v14 = [(NSMutableDictionary *)self->_sourceIdentifiersByMetadataTrackID mutableCopyWithZone:a3];
  sourceIdentifiersByMetadataTrackID = v5->_sourceIdentifiersByMetadataTrackID;
  v5->_sourceIdentifiersByMetadataTrackID = (NSMutableDictionary *)v14;

  [(NUVideoCompositionInstruction *)v5 setSampleMode:self->_sampleMode];
  [(NUVideoCompositionInstruction *)v5 setVideoRenderPrepareNode:self->_videoRenderPrepareNode];
  [(NUVideoCompositionInstruction *)v5 setRequestedWindowOfSamples:self->_requestedWindowOfSamples];
  [(NUVideoCompositionInstruction *)v5 setMainTrackSourceIdentifier:self->_mainTrackSourceIdentifier];
  return v5;
}

- (NUVideoCompositionInstruction)init
{
  v8.receiver = self;
  v8.super_class = (Class)NUVideoCompositionInstruction;
  v2 = [(NUVideoCompositionInstruction *)&v8 init];
  objc_super v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sourceIdentifiersByTrackID = v2->_sourceIdentifiersByTrackID;
  v2->_sourceIdentifiersByTrackID = v3;

  BOOL v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sourceIdentifiersByMetadataTrackID = v2->_sourceIdentifiersByMetadataTrackID;
  v2->_sourceIdentifiersByMetadataTrackID = v5;

  v2->_renderScale = ($F9703ADC4DD3124DE91DE417D7636CC9)NUScaleOne;
  return v2;
}

- (NSString)description
{
  objc_super v3 = NSString;
  [(NUVideoCompositionInstruction *)self timeRange];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTimeRange range = v8;
  BOOL v5 = (__CFString *)CMTimeRangeCopyDescription(v4, &range);
  long long v6 = [v3 stringWithFormat:@"NUVideoCompositionInstruction <%p>:\ntimeRange:%@\nsourceIdentifiersByTrackID: %@\nsourceIdentifiersByMetadataTrackID:%@", self, v5, self->_sourceIdentifiersByTrackID, self->_sourceIdentifiersByMetadataTrackID];

  return (NSString *)v6;
}

+ (id)instructionForVideoTrack:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    long long v10 = NUAssertLogger_25577();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "videoTrack != nil");
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v13 = NUAssertLogger_25577();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        long long v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        uint64_t v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v29 = v17;
        __int16 v30 = 2114;
        v31 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      long long v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoCompositionInstruction instructionForVideoTrack:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositionInstruction.m", 61, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"videoTrack != nil");
  }
  CFAllocatorRef v4 = v3;
  BOOL v5 = objc_alloc_init(NUVideoCompositionInstruction);
  long long v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "trackID"));
  v27 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  [(NUVideoCompositionInstruction *)v5 setRequiredSourceTrackIDs:v7];

  [v4 timeRange];
  *(_OWORD *)v26 = *(_OWORD *)&v26[7];
  *(_OWORD *)&v26[2] = *(_OWORD *)&v26[9];
  *(_OWORD *)&v26[4] = *(_OWORD *)&v26[11];
  [(NUVideoCompositionInstruction *)v5 setTimeRange:v26];
  CMTimeRange v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "trackID"));
  [(NUVideoCompositionInstruction *)v5 setSourceIdentifier:@"video" forTrackID:v8];

  return v5;
}

+ (id)defaultInstructionForAsset:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v20 = NUAssertLogger_25577();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "asset != nil");
      *(_DWORD *)buf = 138543362;
      v37 = v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v23 = NUAssertLogger_25577();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        __int16 v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        __int16 v38 = 2114;
        v39 = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      v26 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v37 = v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoCompositionInstruction defaultInstructionForAsset:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositionInstruction.m", 32, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"asset != nil");
  }
  uint64_t v7 = v6;
  CMTimeRange v8 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:v6 error:a4];
  if (v8)
  {
    id v9 = [a1 instructionForVideoTrack:v8];
    long long v10 = +[NUVideoUtilities auxiliaryTrackInAsset:v7 ofType:2 error:a4];
    if (v10)
    {
      double v11 = [v9 requiredSourceTrackIDs];
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "trackID"));
      id v13 = [v11 arrayByAddingObject:v12];
      [v9 setRequiredSourceTrackIDs:v13];

      BOOL v14 = @"Disparity";
      long long v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "trackID"));
      [v9 setSourceIdentifier:@"Disparity" forTrackID:v15];
    }
    long long v16 = +[NUVideoUtilities metadataTrackWithPortraitVideoDataInAsset:v7];
    long long v17 = v16;
    if (v16)
    {
      long long v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "trackID"));
      [v9 setSourceIdentifier:@"portraitVideoMetadata" forMetadataTrackID:v18];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end