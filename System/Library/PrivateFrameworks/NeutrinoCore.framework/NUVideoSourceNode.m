@interface NUVideoSourceNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)cleanAperture;
- (BOOL)_load:(id *)a3;
- (BOOL)isHDR;
- (BOOL)load:(id *)a3;
- (BOOL)loadAudioMixParameters:(id *)a3;
- (BOOL)loadAuxiliaryVideoTrackProperties:(id *)a3;
- (BOOL)requiresAudioMix;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4;
- (NSDictionary)auxiliaryVideoTrackProperties;
- (NUVideoSourceNode)initWithSettings:(id)a3;
- (NUVideoSourceNode)initWithURL:(id)a3 identifier:(id)a4 options:(id)a5;
- (NUVideoSourceNode)initWithVideoData:(id)a3 identifier:(id)a4 options:(id)a5;
- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)_evaluateTimedMetadataSampleWithIdentifier:(id)a3 atTime:(id *)a4 error:(id *)a5;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoAttributes:(id *)a3;
- (id)_evaluateVideoCompositionWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateVideoPropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_settingsForPipelineState:(id)a3;
- (id)asset:(id *)a3;
- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)sourceOptionsForSettings:(id)a3 error:(id *)a4;
- (int64_t)sourceOrientation;
- (void)_initializeQueue;
@end

@implementation NUVideoSourceNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryVideoTrackProperties, 0);
  objc_storeStrong((id *)&self->_corruptionInfo, 0);
  objc_storeStrong((id *)&self->_cinematicAudioMixInputParameters, 0);
  objc_storeStrong((id *)&self->_colorProperties, 0);
  objc_storeStrong((id *)&self->_trackMetadata, 0);
  objc_storeStrong((id *)&self->_trackGroups, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_videoData, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSDictionary)auxiliaryVideoTrackProperties
{
  return self->_auxiliaryVideoTrackProperties;
}

- (BOOL)requiresAudioMix
{
  return 0;
}

- (BOOL)requiresVideoComposition
{
  return +[NUGlobalSettings videoCompositorDebugMode] == 3;
}

- (id)_evaluateTimedMetadataSampleWithIdentifier:(id)a3 atTime:(id *)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [(NURenderNode *)self outputVideo:a5];
  if (v9)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v10 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15BE0] forAsset:v9];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (+[NUVideoUtilities metadataTrack:v15 containsIdentifier:v8])
          {
            long long v21 = *(_OWORD *)&a4->var0;
            int64_t var3 = a4->var3;
            uint64_t v16 = +[NUVideoUtilities readTimedMetadataGroupAtTime:&v21 fromTrack:v15 outputSettings:0 videoComposition:0 error:a5];
            if (v16)
            {
              v18 = (void *)v16;
              v19 = [NURenderPipelineVideoMetadataSample alloc];
              long long v21 = *(_OWORD *)&a4->var0;
              int64_t var3 = a4->var3;
              v17 = [(NURenderPipelineVideoMetadataSample *)v19 initWithFrameTime:&v21 metadataGroup:v18];

              goto LABEL_14;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    v17 = 0;
LABEL_14:
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_evaluateVideoAttributes:(id *)a3
{
  if ([(NUVideoSourceNode *)self load:a3])
  {
    v4 = [NUVideoAttributes alloc];
    [(NUVideoSourceNode *)self duration];
    v5 = [(NUVideoAttributes *)v4 initWithDuration:v7];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_evaluateVideoPropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(NUVideoSourceNode *)self load:a4])
  {
    v7 = objc_alloc_init(_NUVideoProperties);
    [(_NUVideoProperties *)v7 setUrl:self->_URL];
    [(_NUVideoProperties *)v7 setMetadata:self->_metadata];
    [(_NUVideoProperties *)v7 setTrackGroups:self->_trackGroups];
    [(_NUVideoProperties *)v7 setTrackMetadata:self->_trackMetadata];
    uint64_t v8 = [(NUVideoSourceNode *)self pixelSizeWithSourceOptions:v6];
    -[_NUVideoProperties setSize:](v7, "setSize:", v8, v9);
    [(_NUVideoProperties *)v7 setOrientation:[(NUVideoSourceNode *)self sourceOrientation]];
    *(float *)&double v10 = self->_nominalFrameRate;
    [(_NUVideoProperties *)v7 setNominalFrameRate:v10];
    uint64_t v11 = [v6 objectForKeyedSubscript:@"applyCleanAperture"];
    uint64_t v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "nu_pixelRect");
      v23[0] = 0;
      v23[1] = 0;
      long long v24 = v25;
      uint64_t v13 = v23;
    }
    else
    {
      [(NUVideoSourceNode *)self cleanAperture];
      v22[0] = v22[2];
      v22[1] = v22[3];
      uint64_t v13 = v22;
    }
    [(_NUVideoProperties *)v7 setCleanAperture:v13];
    [(NUVideoSourceNode *)self cleanAperture];
    v21[0] = v21[2];
    v21[1] = v21[3];
    [(_NUVideoProperties *)v7 setOriginalCleanAperture:v21];
    -[_NUVideoProperties setOriginalSize:](v7, "setOriginalSize:", self->_size.width, self->_size.height);
    [(_NUVideoProperties *)v7 setColorProperties:self->_colorProperties];
    long long v19 = *(_OWORD *)&self->_livePhotoKeyFrameTime.value;
    int64_t epoch = self->_livePhotoKeyFrameTime.epoch;
    [(_NUVideoProperties *)v7 setLivePhotoKeyFrameTime:&v19];
    [(NUVideoSourceNode *)self duration];
    long long v15 = v17;
    uint64_t v16 = v18;
    [(_NUVideoProperties *)v7 setDuration:&v15];
    [(_NUVideoProperties *)v7 setAuxiliaryVideoTrackProperties:self->_auxiliaryVideoTrackProperties];
    [(_NUVideoProperties *)v7 setCinematicAudioMixInputParameters:self->_cinematicAudioMixInputParameters];
    [(_NUVideoProperties *)v7 setVideoCorruptionInfo:self->_corruptionInfo];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    long long v21 = NUAssertLogger_554();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v24 = NUAssertLogger_554();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v38 = v28;
        __int16 v39 = 2114;
        v40 = v32;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      long long v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v38 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode _evaluateImagePropertiesWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 874, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"error != NULL");
  }
  v7 = v6;
  uint64_t v8 = [(NUSourceNode *)self originalNode];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 imageProperties:a4];
    if (!v10)
    {
      uint64_t v12 = 0;
      goto LABEL_16;
    }
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [[_NUImageProperties alloc] initWithProperties:v10];
    [(_NUImageProperties *)v12 resetAuxiliaryImageProperties];
  }
  else
  {
    uint64_t v11 = [(NUVideoSourceNode *)self _evaluateVideoPropertiesWithSourceOptions:v7 error:a4];
    if (v11)
    {
      uint64_t v12 = objc_alloc_init(_NUImageProperties);
      [(_NUImageProperties *)v12 setMetadata:MEMORY[0x1E4F1CC08]];
      uint64_t v13 = [v11 colorProperties];
      v14 = +[NUColorSpace colorSpaceFromVideoColorProperties:v13];

      if (!v14)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
        }
        long long v15 = (void *)_NURenderLogger;
        if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = v15;
          long long v17 = [v11 colorProperties];
          *(_DWORD *)buf = 138543362;
          v38 = v17;
          _os_log_impl(&dword_1A9892000, v16, OS_LOG_TYPE_DEFAULT, "Invalid video color properties: %{public}@, assuming sRGB.", buf, 0xCu);
        }
        v14 = +[NUColorSpace sRGBColorSpace];
      }
      [(_NUImageProperties *)v12 setColorSpace:v14];
      [v14 headroom];
      -[_NUImageProperties setContentHeadroom:](v12, "setContentHeadroom:");
      uint64_t v18 = [v11 size];
      -[_NUImageProperties setSize:](v12, "setSize:", v18, v19);
      -[_NUImageProperties setOrientation:](v12, "setOrientation:", [v11 orientation]);
      [(_NUImageProperties *)v12 setAlphaInfo:2];
      [(_NUImageProperties *)v12 setComponentInfo:0];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }

LABEL_16:

  return v12;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a5)
  {
    uint64_t v10 = NUAssertLogger_554();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v13 = NUAssertLogger_554();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        long long v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        v20 = [v18 callStackSymbols];
        long long v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v27 = v17;
        __int16 v28 = 2114;
        v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      long long v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 865, @"Invalid parameter not satisfying: %s", v22, v23, v24, v25, (uint64_t)"error != nil");
  }
  uint64_t v8 = v7;
  *a5 = +[NUError errorWithCode:5 reason:@"Video node cannot generate a valid CIImage" object:self];

  return 0;
}

- (id)_settingsForPipelineState:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = v5;
  URL = self->_URL;
  if (URL)
  {
    [v5 setObject:URL forKeyedSubscript:@"identifier"];
    if (v4)
    {
LABEL_3:
      [v4 time];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = [(NURenderNode *)self settings];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"identifier"];
    [v6 setObject:v9 forKeyedSubscript:@"identifier"];

    if (v4) {
      goto LABEL_3;
    }
  }
  memset(&time, 0, sizeof(time));
LABEL_6:
  CFDictionaryRef v10 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [v6 setObject:v10 forKeyedSubscript:@"time"];

  unint64_t v11 = [v4 auxiliaryImageType];
  if (v11 > 0xB) {
    uint64_t v12 = @"Invalid";
  }
  else {
    uint64_t v12 = off_1E5D94190[v11];
  }
  uint64_t v13 = v12;
  [v6 setObject:v13 forKeyedSubscript:@"auxiliaryImageType"];

  if (self->_originalExtent.size.width && self->_originalExtent.size.height)
  {
    $5BB7312FFE32F1AB3F1F5957C99A58B3 size = self->_originalExtent.size;
    v17[0] = self->_originalExtent.origin;
    v17[1] = size;
    long long v15 = objc_msgSend(MEMORY[0x1E4F29238], "nu_valueWithPixelRect:", v17);
    [v6 setObject:v15 forKeyedSubscript:@"originalExtent"];
  }

  return v6;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    v52 = NUAssertLogger_554();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v91 = v53;
      _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v55 = NUAssertLogger_554();
    BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v56)
      {
        v59 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v60 = (void *)MEMORY[0x1E4F29060];
        id v61 = v59;
        v62 = [v60 callStackSymbols];
        v63 = [v62 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v91 = v59;
        __int16 v92 = 2114;
        v93 = v63;
        _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v56)
    {
      v57 = [MEMORY[0x1E4F29060] callStackSymbols];
      v58 = [v57 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v91 = v58;
      _os_log_error_impl(&dword_1A9892000, v55, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 749, @"Invalid parameter not satisfying: %s", v64, v65, v66, v67, (uint64_t)"error != nil");
  }
  uint64_t v13 = v12;
  if (![(NUVideoSourceNode *)self load:a6]
    || ![(NUVideoSourceNode *)self supportsPipelineState:v13 error:a6])
  {
    goto LABEL_52;
  }
  if (![v13 evaluationMode] || objc_msgSend(v13, "evaluationMode") == 2)
  {
    BOOL v14 = self;
    goto LABEL_53;
  }
  if ([v13 evaluationMode] != 3)
  {
    if ([v13 evaluationMode] != 1)
    {
      v68 = NUAssertLogger_554();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v69 = [NSString stringWithFormat:@"Unsupported pipelineState evaluation mode: %@", v13];
        *(_DWORD *)buf = 138543362;
        v91 = v69;
        _os_log_error_impl(&dword_1A9892000, v68, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v70 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v71 = NUAssertLogger_554();
      BOOL v72 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);
      if (v70)
      {
        if (v72)
        {
          v75 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v76 = (void *)MEMORY[0x1E4F29060];
          id v77 = v75;
          v78 = [v76 callStackSymbols];
          v79 = [v78 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v91 = v75;
          __int16 v92 = 2114;
          v93 = v79;
          _os_log_error_impl(&dword_1A9892000, v71, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v72)
      {
        v73 = [MEMORY[0x1E4F29060] callStackSymbols];
        v74 = [v73 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v91 = v74;
        _os_log_error_impl(&dword_1A9892000, v71, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 827, @"Unsupported pipelineState evaluation mode: %@", v80, v81, v82, v83, (uint64_t)v13);
    }
    if (v13)
    {
      [v13 time];
      if ((v88 & 0x100000000) != 0)
      {
        long long v17 = [(NUVideoSourceNode *)self _settingsForPipelineState:v13];
        if ([v13 auxiliaryImageType] != 1)
        {
          auxiliaryVideoTrackProperties = self->_auxiliaryVideoTrackProperties;
          unint64_t v19 = [v13 auxiliaryImageType];
          if (v19 > 0xB) {
            v20 = @"Invalid";
          }
          else {
            v20 = off_1E5D94190[v19];
          }
          v40 = v20;
          uint64_t v41 = [(NSDictionary *)auxiliaryVideoTrackProperties objectForKeyedSubscript:v40];

          if (!v41)
          {
            unint64_t v49 = [v13 auxiliaryImageType];
            if (v49 > 0xB) {
              v50 = @"Invalid";
            }
            else {
              v50 = off_1E5D94190[v49];
            }
            uint64_t v23 = v50;
            v38 = @"Missing video track properties for auxiliary image type ";
            __int16 v39 = v23;
LABEL_51:
            *a6 = +[NUError missingError:v38 object:v39];

LABEL_52:
            BOOL v14 = 0;
            goto LABEL_53;
          }
        }
        v42 = [NUKeyFrameSourceNode alloc];
        [v13 time];
        uint64_t v24 = [(NUKeyFrameSourceNode *)v42 initWithVideoSource:self time:v86 settings:v17 orientation:[(NUVideoSourceNode *)self sourceOrientation]];
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v87 = 0;
      uint64_t v88 = 0;
      uint64_t v89 = 0;
    }
    +[NUError unsupportedError:@"invalid frame time" object:v13];
    BOOL v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  if ([v13 auxiliaryImageType] == 1 || !objc_msgSend(v13, "auxiliaryImageType"))
  {
    long long v17 = @"video";
  }
  else
  {
    unint64_t v15 = [v13 auxiliaryImageType];
    if (v15 > 0xB) {
      uint64_t v16 = @"Invalid";
    }
    else {
      uint64_t v16 = off_1E5D94190[v15];
    }
    long long v17 = v16;
  }
  long long v21 = [v13 videoFrames];
  uint64_t v22 = [v21 objectForKeyedSubscript:v17];

  uint64_t v23 = [(NUVideoSourceNode *)self _settingsForPipelineState:v13];
  if (!v22)
  {
    unint64_t v25 = [v13 auxiliaryImageType];
    if (v25 <= 9 && ((1 << v25) & 0x218) != 0)
    {
      long long v26 = self->_auxiliaryVideoTrackProperties;
      unint64_t v27 = [v13 auxiliaryImageType];
      v85 = v17;
      if (v27 > 0xB) {
        __int16 v28 = @"Invalid";
      }
      else {
        __int16 v28 = off_1E5D94190[v27];
      }
      v29 = v28;
      v84 = [(NSDictionary *)v26 objectForKeyedSubscript:v29];

      double v30 = (double)[v84 size];
      [v84 size];
      double v32 = (double)v31;
      uint64_t v33 = [NUCISourceNode alloc];
      uint64_t v34 = (void *)MEMORY[0x1E4F1E050];
      uint64_t v35 = [MEMORY[0x1E4F1E008] blackColor];
      uint64_t v36 = [v34 imageWithColor:v35];
      v37 = objc_msgSend(v36, "imageByCroppingToRect:", 0.0, 0.0, v30, v32);
      uint64_t v24 = [(NUCISourceNode *)v33 initWithImage:v37 settings:v23 orientation:[(NUVideoSourceNode *)self sourceOrientation]];

      long long v17 = v85;
      goto LABEL_31;
    }
    v38 = @"unable to find video frame";
    __int16 v39 = v17;
    goto LABEL_51;
  }
  uint64_t v24 = -[NUPixelBufferSourceNode initWithPixelBuffer:settings:orientation:]([NUPixelBufferSourceNode alloc], "initWithPixelBuffer:settings:orientation:", [v22 pixelBuffer], v23, -[NUVideoSourceNode sourceOrientation](self, "sourceOrientation"));
LABEL_31:

LABEL_37:
  v43 = [(NUSourceNode *)self originalNode];
  if ([v13 auxiliaryImageType] == 2)
  {
    v44 = 0;
  }
  else
  {
    uint64_t v45 = [v13 auxiliaryImageType];
    v44 = v43;
    if (v45 != 1)
    {
      uint64_t v46 = objc_msgSend(v13, "auxiliaryImageType", v43);
      if (v43) {
        v47 = v43;
      }
      else {
        v47 = self;
      }
      if (v46) {
        v44 = v47;
      }
      else {
        v44 = v43;
      }
    }
  }
  [(NUSourceNode *)v24 setOriginalNode:v44];
  v48 = [(NUSourceNode *)self sourceDerivation];
  [(NUSourceNode *)v24 setSourceDerivation:v48];

  -[NURenderNode setEvaluatedForMode:](v24, "setEvaluatedForMode:", [v13 evaluationMode]);
  BOOL v14 = v24;

LABEL_53:

  return v14;
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!a7)
  {
    v29 = NUAssertLogger_554();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      double v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v47 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    double v32 = NUAssertLogger_554();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        uint64_t v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        __int16 v39 = [v37 callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v47 = v36;
        __int16 v48 = 2114;
        unint64_t v49 = v40;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      uint64_t v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v47 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 720, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"error != nil");
  }
  uint64_t v16 = v15;
  if ([(NUVideoSourceNode *)self load:a7]
    && [(NUVideoSourceNode *)self supportsPipelineState:v13 error:a7])
  {
    unint64_t v17 = [v13 auxiliaryImageType];
    if (v17 < 2)
    {
LABEL_10:
      v45.receiver = self;
      v45.super_class = (Class)NUVideoSourceNode;
      uint64_t v23 = [(NUSourceNode *)&v45 preparedNodeWithSourceContainer:v12 pipelineState:v13 pipelineSettings:v14 sourceSettings:v16 error:a7];
      goto LABEL_16;
    }
    unint64_t v18 = v17;
    auxiliaryVideoTrackProperties = self->_auxiliaryVideoTrackProperties;
    if (v17 > 0xB) {
      v20 = @"Invalid";
    }
    else {
      v20 = off_1E5D94190[v17];
    }
    long long v21 = v20;
    uint64_t v22 = [(NSDictionary *)auxiliaryVideoTrackProperties objectForKeyedSubscript:v21];

    if (v22)
    {

      goto LABEL_10;
    }
    uint64_t v24 = NSString;
    if (v18 > 0xB) {
      unint64_t v25 = @"Invalid";
    }
    else {
      unint64_t v25 = off_1E5D94190[v18];
    }
    long long v26 = v25;
    unint64_t v27 = [v24 stringWithFormat:@"Requested auxiliary track type %@ but no associated track property found", v26];

    *a7 = +[NUError invalidError:v27 object:v13];
  }
  uint64_t v23 = 0;
LABEL_16:

  return v23;
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a4)
  {
    id v13 = NUAssertLogger_554();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      double v30 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v16 = NUAssertLogger_554();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        uint64_t v23 = [v21 callStackSymbols];
        uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v30 = v20;
        __int16 v31 = 2114;
        double v32 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      unint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      unint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v30 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 685, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"error != NULL");
  }
  id v6 = v5;
  uint64_t v7 = [v5 auxiliaryImageType];
  if ((unint64_t)(v7 - 5) >= 4)
  {
    if (!v7 && ([v6 evaluationMode] == 2 || objc_msgSend(v6, "evaluationMode") == 3))
    {
      +[NUError invalidError:@"expected a valid auxiliaryImageType during render" object:v6];
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    unint64_t v8 = [v6 auxiliaryImageType];
    if (v8 > 0xB) {
      uint64_t v9 = @"Invalid";
    }
    else {
      uint64_t v9 = off_1E5D94190[v8];
    }
    id v11 = v9;
    *a4 = +[NUError unsupportedError:@"auxiliary image is not supported" object:v11];

    BOOL v10 = 0;
  }

  return v10;
}

- (id)_evaluateVideoCompositionWithSourceOptions:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v20 = NUAssertLogger_554();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(time2.value) = 138543362;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v21;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time2, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v23 = NUAssertLogger_554();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        double v30 = [v28 callStackSymbols];
        __int16 v31 = [v30 componentsJoinedByString:@"\n"];
        LODWORD(time2.value) = 138543618;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v27;
        LOWORD(time2.flags) = 2114;
        *(void *)((char *)&time2.flags + 2) = v31;
        _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time2, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
      LODWORD(time2.value) = 138543362;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v26;
      _os_log_error_impl(&dword_1A9892000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time2, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode _evaluateVideoCompositionWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 637, @"Invalid parameter not satisfying: %s", v32, v33, v34, v35, (uint64_t)"error != NULL");
  }
  uint64_t v7 = v6;
  unint64_t v8 = [(NURenderNode *)self outputVideo:a4];
  if (!v8)
  {
    id v14 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:v8 error:a4];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F165B0]);
    [v9 naturalSize];
    objc_msgSend(v10, "setRenderSize:");
    objc_msgSend(v10, "setSourceTrackIDForFrameTiming:", objc_msgSend(v9, "trackID"));
    [v9 minFrameDuration];
    if (v48)
    {
      [v9 minFrameDuration];
      long long v44 = v46;
      uint64_t v45 = v47;
      id v13 = (CMTime *)&v44;
    }
    else
    {
      [v9 nominalFrameRate];
      if (v11 <= 0.0)
      {
        CMTimeMake(&v41, 1, 30);
        CMTime v40 = v41;
        id v13 = &v40;
      }
      else
      {
        [v9 nominalFrameRate];
        CMTimeMakeWithSeconds(&v43, 1.0 / v12, 600);
        CMTime v42 = v43;
        id v13 = &v42;
      }
    }
    [v10 setFrameDuration:v13];
    if (v10)
    {
      [v10 frameDuration];
      if ((v38 & 0x100000000) != 0)
      {
        [v10 frameDuration];
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (CMTimeCompare(&time1, &time2) > 0)
        {
          uint64_t v15 = +[NUVideoCompositionInstruction defaultInstructionForAsset:v8 error:a4];
          uint64_t v16 = (void *)v15;
          if (v15)
          {
            uint64_t v49 = v15;
            BOOL v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
            [v10 setInstructions:v17];

            unint64_t v18 = [v16 requiredSourceSampleDataTrackIDs];
            [v10 setSourceSampleDataTrackIDs:v18];

            id v14 = v10;
          }
          else
          {
            id v14 = 0;
          }

          goto LABEL_18;
        }
      }
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
    }
    +[NUError invalidError:@"Invalid frame duration for video track" object:v9];
    id v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  id v14 = 0;
LABEL_19:

LABEL_20:

  return v14;
}

- (id)_evaluateVideo:(id *)a3
{
  v107[9] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v37 = NUAssertLogger_554();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)CMTime time1 = 138543362;
      *(void *)&time1[4] = v38;
      _os_log_error_impl(&dword_1A9892000, v37, OS_LOG_TYPE_ERROR, "Fail: %{public}@", time1, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    CMTime v40 = NUAssertLogger_554();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        long long v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        uint64_t v47 = [v45 callStackSymbols];
        char v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)CMTime time1 = 138543618;
        *(void *)&time1[4] = v44;
        *(_WORD *)&time1[12] = 2114;
        *(void *)&time1[14] = v48;
        _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", time1, 0x16u);
      }
    }
    else if (v41)
    {
      CMTime v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      CMTime v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)CMTime time1 = 138543362;
      *(void *)&time1[4] = v43;
      _os_log_error_impl(&dword_1A9892000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", time1, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 477, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"error != nil");
  }
  if (!-[NUVideoSourceNode load:](self, "load:"))
  {
    id v10 = a3;
    +[NUError errorWithCode:1 reason:@"[NUVideoSourceNode _evaluateVideo] asset failed to load" object:0 underlyingError:*a3];
    id v11 = 0;
    id *v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_74;
  }
  v70 = self;
  v63 = a3;
  v69 = [MEMORY[0x1E4F16590] composition];
  if (!v69)
  {
    +[NUError errorWithCode:1 reason:@"[NUVideoSourceNode _evaluateVideo] failed to get new composition" object:0];
    id v11 = 0;
    id *v63 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_73;
  }
  uint64_t v5 = *MEMORY[0x1E4F15BB8];
  v107[0] = *MEMORY[0x1E4F15C18];
  v107[1] = v5;
  uint64_t v72 = v5;
  uint64_t v6 = *MEMORY[0x1E4F15C08];
  uint64_t v64 = *MEMORY[0x1E4F15BA8];
  v107[2] = *MEMORY[0x1E4F15BA8];
  v107[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4F15C00];
  v107[4] = *MEMORY[0x1E4F15BC8];
  v107[5] = v7;
  uint64_t v8 = *MEMORY[0x1E4F15BE0];
  v107[6] = *MEMORY[0x1E4F15C10];
  v107[7] = v8;
  v107[8] = *MEMORY[0x1E4F15BF0];
  id v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:9];
  uint64_t v9 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:self->_asset error:a3];
  id v62 = v9;
  if (!v9)
  {
    id v11 = 0;
    goto LABEL_72;
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v99 = 0u;
  [v9 timeRange];
  v59 = +[NUVideoUtilities metadataTrackWithPortraitVideoDataInAsset:self->_asset];
  if (v59
    && !+[NUVideoUtilities track:v59 hasSamplesForEachSampleInTrack:v62])
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
    }
    float v12 = _NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTime time1 = 0;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Detected metadata track with missing samples. Cinematic effect will be disabled.", time1, 2u);
    }
    int v67 = 1;
  }
  else
  {
    int v67 = 0;
  }
  asset = self->_asset;
  id v98 = 0;
  v58 = +[NUVideoUtilities auxiliaryTrackInAsset:asset ofType:2 error:&v98];
  id v55 = v98;
  if (v58
    && !+[NUVideoUtilities track:v58 hasSamplesForEachSampleInTrack:v62])
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
    }
    id v14 = _NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CMTime time1 = 0;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Detected disparity track with missing samples. Cinematic effect will be disabled.", time1, 2u);
    }
    int v67 = 1;
  }
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v61;
  uint64_t v56 = [obj countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (!v56) {
    goto LABEL_69;
  }
  uint64_t v15 = *(void *)v95;
  uint64_t v66 = *MEMORY[0x1E4F15B70];
  uint64_t v53 = *(void *)v95;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v95 != v15)
      {
        uint64_t v17 = v16;
        objc_enumerationMutation(obj);
        uint64_t v16 = v17;
      }
      uint64_t v54 = v16;
      unint64_t v18 = *(void **)(*((void *)&v94 + 1) + 8 * v16);
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v68 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:v18 forAsset:v70->_asset];
      uint64_t v73 = [v68 countByEnumeratingWithState:&v90 objects:v105 count:16];
      if (!v73) {
        goto LABEL_67;
      }
      uint64_t v71 = *(void *)v91;
      while (2)
      {
        for (uint64_t i = 0; i != v73; ++i)
        {
          if (*(void *)v91 != v71) {
            objc_enumerationMutation(v68);
          }
          v20 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          memset(v89, 0, sizeof(v89));
          long long v88 = 0u;
          if (v20) {
            [v20 timeRange];
          }
          else {
            memset(v87, 0, sizeof(v87));
          }
          *(_OWORD *)CMTime time1 = v99;
          *(_OWORD *)&time1[16] = v100;
          long long v103 = v101;
          +[NUVideoUtilities conformRange:v87 inRange:time1];
          if (BYTE12(v88))
          {
            BOOL v21 = 0;
            if ((BYTE4(v89[1]) & 1) != 0
              && !*((void *)&v89[1] + 1)
              && (*((void *)&v89[0] + 1) & 0x8000000000000000) == 0)
            {
              *(_OWORD *)CMTime time1 = *(_OWORD *)((char *)v89 + 8);
              *(void *)&time1[16] = *((void *)&v89[1] + 1);
              CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
              BOOL v21 = CMTimeCompare((CMTime *)time1, &time2) == 0;
            }
          }
          else
          {
            BOOL v21 = 0;
          }
          int v22 = !v21;
          if ([v18 isEqualToString:v72]
            && [v20 hasMediaCharacteristic:v66])
          {
            int v22 = (v67 | v21) ^ 1;
          }
          if ([v18 isEqualToString:v8]
            && +[NUVideoUtilities metadataTrackContainsPortraitVideoData:v20])
          {
            v22 &= v67 ^ 1;
          }
          if (![v18 isEqualToString:v8])
          {
            if (!v22) {
              continue;
            }
LABEL_52:
            corruptionInfo = v70->_corruptionInfo;
            if (corruptionInfo && [(NSArray *)corruptionInfo count] >= 2)
            {
              BOOL v24 = [(NSDictionary *)v70->_auxiliaryVideoTrackProperties objectForKeyedSubscript:@"DeltaImage"];
              uint64_t v25 = PFFind();
              if (v25)
              {
                int v26 = [v20 trackID];
                if (v26 == [v24 trackID])
                {
                  uint64_t v27 = objc_msgSend(v69, "addMutableTrackWithMediaType:preferredTrackID:", v18, objc_msgSend(v20, "trackID"));
                  *(void *)CMTime time1 = 0;
                  *(void *)&time1[8] = time1;
                  *(void *)&time1[16] = 0x3810000000;
                  *(void *)&time1[24] = &unk_1A9AA79AF;
                  long long v60 = *MEMORY[0x1E4F1FA48];
                  long long v103 = *MEMORY[0x1E4F1FA48];
                  CMTimeEpoch v28 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
                  CMTimeEpoch v104 = v28;
                  time2.value = 0;
                  *(void *)&time2.timescale = &time2;
                  time2.int64_t epoch = 0x3810000000;
                  v84 = &unk_1A9AA79AF;
                  long long v85 = *MEMORY[0x1E4F1F9F8];
                  uint64_t v86 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
                  id v29 = [v25 corruptedRanges];
                  v78[0] = MEMORY[0x1E4F143A8];
                  v78[1] = 3221225472;
                  v78[2] = __36__NUVideoSourceNode__evaluateVideo___block_invoke_2;
                  v78[3] = &unk_1E5D93BC0;
                  uint64_t v81 = time1;
                  id v30 = v27;
                  id v79 = v30;
                  uint64_t v80 = v20;
                  p_CMTime time2 = &time2;
                  [v29 enumerateObjectsUsingBlock:v78];

                  if (*(unsigned char *)(*(void *)&time2.timescale + 44))
                  {
                    CMTime start = *(CMTime *)(*(void *)&time2.timescale + 32);
                    *(_OWORD *)&duration.value = v60;
                    duration.int64_t epoch = v28;
                    if (CMTimeCompare(&start, &duration))
                    {
                      CMTime start = *(CMTime *)(*(void *)&time1[8] + 32);
                      CMTime duration = *(CMTime *)(*(void *)&time2.timescale + 32);
                      CMTimeRangeMake(&v75, &start, &duration);
                      CMTime start = *(CMTime *)(*(void *)&time1[8] + 32);
                      [v30 insertTimeRange:&v75 ofTrack:v20 atTime:&start error:0];
                    }
                  }

                  _Block_object_dispose(&time2, 8);
                  _Block_object_dispose(time1, 8);

LABEL_64:
                  continue;
                }
              }
            }
            BOOL v24 = objc_msgSend(v69, "addMutableTrackWithMediaType:preferredTrackID:", v18, objc_msgSend(v20, "trackID"));
            __int16 v31 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v24, "trackID"));
            uint64_t v32 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v20, "trackID"));
            [v65 setObject:v31 forKeyedSubscript:v32];

            if ([v18 isEqualToString:v64])
            {
              objc_msgSend(v24, "setAlternateGroupID:", objc_msgSend(v20, "alternateGroupID"));
              uint64_t v33 = [v20 languageCode];
              [v24 setLanguageCode:v33];
            }
            objc_msgSend(v24, "setEnabled:", objc_msgSend(v20, "isEnabled"));
            id v74 = 0;
            *(_OWORD *)CMTime time1 = v88;
            *(_OWORD *)&time1[16] = v89[0];
            long long v103 = v89[1];
            CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
            [v24 insertTimeRange:time1 ofTrack:v20 atTime:&time2 error:&v74];
            id v34 = v74;
            if (v34)
            {
              uint64_t v35 = v34;
              id *v63 = +[NUError errorWithCode:1 reason:@"unable to insert time range" object:v70 underlyingError:v34];

              id v11 = 0;
              goto LABEL_71;
            }
            goto LABEL_64;
          }
          if (v22 & ~+[NUVideoUtilities metadataTrackContainsLegacyCinematicAudioData:v20])goto LABEL_52; {
        }
          }
        uint64_t v73 = [v68 countByEnumeratingWithState:&v90 objects:v105 count:16];
        if (v73) {
          continue;
        }
        break;
      }
LABEL_67:

      uint64_t v15 = v53;
      uint64_t v16 = v54 + 1;
    }
    while (v54 + 1 != v56);
    uint64_t v56 = [obj countByEnumeratingWithState:&v94 objects:v106 count:16];
    uint64_t v15 = v53;
  }
  while (v56);
LABEL_69:

  [MEMORY[0x1E4F8CC38] preserveTrackAssociations:0 ofAsset:v70->_asset forMutableComposition:v69 assetToCompositionTrackID:v65];
  id v11 = v69;
LABEL_71:

  uint64_t v9 = v62;
LABEL_72:

LABEL_73:
LABEL_74:

  return v11;
}

double __36__NUVideoSourceNode__evaluateVideo___block_invoke_2(void *a1, CFDictionaryRef dictionaryRepresentation)
{
  memset(&v17, 0, sizeof(v17));
  CMTimeRangeMakeFromDictionary(&v17, dictionaryRepresentation);
  memset(&v16, 0, sizeof(v16));
  CMTimeRange range = v17;
  CMTimeRangeGetEnd(&v16, &range);
  memset(&range, 0, sizeof(range));
  uint64_t v3 = *(void *)(a1[6] + 8);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&v17.start.value;
  lhs.start.int64_t epoch = v17.start.epoch;
  CMTime rhs = *(CMTime *)(v3 + 32);
  CMTimeSubtract(&duration, &lhs.start, &rhs);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)(v3 + 32);
  lhs.start.int64_t epoch = *(void *)(v3 + 48);
  CMTimeRangeMake(&range, &lhs.start, &duration);
  lhs.CMTime start = range.duration;
  CMTime rhs = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&lhs.start, &rhs))
  {
    id v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = *(void *)(a1[6] + 8);
    CMTimeRange lhs = range;
    CMTime rhs = *(CMTime *)(v6 + 32);
    [v4 insertTimeRange:&lhs ofTrack:v5 atTime:&rhs error:0];
  }
  uint64_t v7 = (void *)a1[5];
  if (v7) {
    [v7 timeRange];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  CMTime v10 = *(CMTime *)&v9[1];
  lhs.CMTime start = v16;
  CMTimeSubtract(&v11, &v10, &lhs.start);
  *(CMTime *)(*(void *)(a1[7] + 8) + 32) = v11;
  double result = *(double *)&v16.value;
  *(CMTime *)(*(void *)(a1[6] + 8) + 32) = v16;
  return result;
}

BOOL __36__NUVideoSourceNode__evaluateVideo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 3;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)cleanAperture
{
  uint64_t v3 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!LOBYTE(self[6].var0.var0))
  {
    uint64_t v5 = NUAssertLogger_554();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [NSString stringWithFormat:@"%@ not loaded", v3];
      *(_DWORD *)buf = 138543362;
      int v22 = v6;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v8 = NUAssertLogger_554();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v9)
      {
        float v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v13 = (void *)MEMORY[0x1E4F29060];
        id v14 = v12;
        uint64_t v15 = [v13 callStackSymbols];
        CMTime v16 = [v15 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        int v22 = v12;
        __int16 v23 = 2114;
        BOOL v24 = v16;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v9)
    {
      CMTime v10 = [MEMORY[0x1E4F29060] callStackSymbols];
      CMTime v11 = [v10 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      int v22 = v11;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode cleanAperture]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 471, @"%@ not loaded", v17, v18, v19, v20, (uint64_t)v3);
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 v4 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[8].var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[8].var0.var1;
  retstr->var1 = v4;
  return self;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_loaded)
  {
    CMTime v16 = NUAssertLogger_554();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [NSString stringWithFormat:@"%@ not loaded", self];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v19 = NUAssertLogger_554();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        __int16 v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        int v26 = [v24 callStackSymbols];
        uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v23;
        __int16 v36 = 2114;
        uint64_t v37 = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode pixelSizeWithSourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 448, @"%@ not loaded", v28, v29, v30, v31, (uint64_t)self);
  }
  uint64_t v5 = v4;
  uint64_t v6 = [v4 objectForKeyedSubscript:@"imageType"];
  if (NUAuxiliaryImageTypeFromString(v6) && NUAuxiliaryImageTypeFromString(v6) != 1)
  {
    uint64_t v8 = [(NSDictionary *)self->_auxiliaryVideoTrackProperties objectForKeyedSubscript:v6];
    int64_t width = [v8 size];
    int64_t v12 = v11;
  }
  else
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"applyCleanAperture"];
    uint64_t v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "nu_pixelRect");
      int64_t width = v32;
      p_height = &v33;
    }
    else
    {
      p_height = &self->_originalExtent.size.height;
      int64_t width = self->_originalExtent.size.width;
      if (width) {
        BOOL v13 = self->_originalExtent.size.height == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
        p_height = &self->_size.height;
        int64_t width = self->_size.width;
      }
    }
    int64_t v12 = *p_height;
  }

  int64_t v14 = width;
  int64_t v15 = v12;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (BOOL)isHDR
{
  v2 = [(NSDictionary *)self->_colorProperties objectForKeyedSubscript:*MEMORY[0x1E4F162E0]];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F162E8]];

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  char v3 = self;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!LOBYTE(self[8].var0))
  {
    id v4 = NUAssertLogger_554();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [NSString stringWithFormat:@"%@ not loaded", v3];
      *(_DWORD *)buf = 138543362;
      BOOL v21 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v7 = NUAssertLogger_554();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        int64_t v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        int64_t v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        int64_t v14 = [v12 callStackSymbols];
        int64_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v21 = v11;
        __int16 v22 = 2114;
        __int16 v23 = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      BOOL v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      CMTime v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v21 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode duration]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 437, @"%@ not loaded", v16, v17, v18, v19, (uint64_t)v3);
  }
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (id)asset:(id *)a3
{
  if ([(NUVideoSourceNode *)self load:a3]) {
    id v4 = self->_asset;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)load:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  if (self->_loaded)
  {
    BOOL v3 = 1;
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
    }
    uint64_t v6 = (id)_NURenderLogger;
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
    BOOL v8 = v6;
    BOOL v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9892000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "NUVideoSourceNode.load", (const char *)&unk_1A9A9F00F, buf, 2u);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __26__NUVideoSourceNode_load___block_invoke;
    v14[3] = &unk_1E5D958C0;
    v14[4] = self;
    v14[5] = &v16;
    v14[6] = a3;
    CMTime v10 = (void (**)(void))MEMORY[0x1AD0FAD00](v14);
    v10[2]();
    int64_t v11 = v9;
    int64_t v12 = v11;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9892000, v12, OS_SIGNPOST_INTERVAL_END, v7, "NUVideoSourceNode.load", (const char *)&unk_1A9A9F00F, buf, 2u);
    }

    BOOL v3 = *((unsigned char *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);
  return v3;
}

__n128 __26__NUVideoSourceNode_load___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__NUVideoSourceNode_load___block_invoke_2;
  block[3] = &unk_1E5D958C0;
  long long v5 = v1;
  uint64_t v6 = *(void *)(a1 + 48);
  dispatch_sync(v2, block);
  return result;
}

uint64_t __26__NUVideoSourceNode_load___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _load:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)loadAuxiliaryVideoTrackProperties:(id *)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v29 = NUAssertLogger_554();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v63 = v30;
      _os_log_error_impl(&dword_1A9892000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v32 = NUAssertLogger_554();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v33)
      {
        __int16 v36 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v37 = (void *)MEMORY[0x1E4F29060];
        id v38 = v36;
        uint64_t v39 = [v37 callStackSymbols];
        CMTime v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v63 = v36;
        __int16 v64 = 2114;
        id v65 = v40;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v33)
    {
      id v34 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v63 = v35;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode loadAuxiliaryVideoTrackProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 351, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"error != NULL");
  }
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v50 = [&unk_1F004A5E0 arrayByAddingObjectsFromArray:&unk_1F004A5F8];
  uint64_t v51 = self;
  [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15BB8] forAsset:self->_asset];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v4 = (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = [(NSDictionary *)v4 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (!v49) {
    goto LABEL_38;
  }
  uint64_t v48 = *(void *)v57;
  long long v5 = off_1E5D93000;
  id obj = v4;
LABEL_4:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v57 != v48) {
      objc_enumerationMutation(obj);
    }
    os_signpost_id_t v7 = *(void **)(*((void *)&v56 + 1) + 8 * v6);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    BOOL v8 = v50;
    uint64_t v9 = [(__CFString *)v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v9) {
      break;
    }
LABEL_36:

    if (++v6 == v49)
    {
      id v4 = obj;
      uint64_t v49 = [(NSDictionary *)obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (!v49)
      {
LABEL_38:

        id v25 = v46;
        int v26 = (NSDictionary *)v46;
        auxiliaryVideoTrackProperties = v51->_auxiliaryVideoTrackProperties;
        v51->_auxiliaryVideoTrackProperties = v26;
        LOBYTE(v21) = 1;
        goto LABEL_40;
      }
      goto LABEL_4;
    }
  }
  uint64_t v10 = v9;
  int64_t v11 = v5;
  uint64_t v12 = *(void *)v53;
LABEL_9:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v53 != v12) {
      objc_enumerationMutation(v8);
    }
    unint64_t v14 = [*(id *)(*((void *)&v52 + 1) + 8 * v13) integerValue];
    NUMediaCharacteristicForAuxiliaryImageType(v14);
    int64_t v15 = (_NUAVAssetTrackAuxiliaryVideoTrackProperties *)objc_claimAutoreleasedReturnValue();
    if (v15 && [v7 hasMediaCharacteristic:v15])
    {
      uint64_t v16 = @"Invalid";
      if (v14 <= 0xB) {
        uint64_t v16 = off_1E5D94190[v14];
      }
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v17 = 0;
    }
    if (v14 != 2)
    {
      if (v17) {
        goto LABEL_29;
      }
      goto LABEL_23;
    }
    if (v17) {
      goto LABEL_26;
    }
    uint64_t v18 = [(__objc2_class *)v11[19] metadataTrackWithPortraitVideoDataInAsset:v51->_asset];
    if (v18) {
      break;
    }
LABEL_23:

    if (v10 == ++v13)
    {
      uint64_t v10 = [(__CFString *)v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v10) {
        goto LABEL_9;
      }
      long long v5 = v11;
      goto LABEL_36;
    }
  }
  uint64_t v19 = (void *)v18;
  uint64_t v17 = @"Disparity";
  BOOL v20 = @"Disparity";

LABEL_26:
  long long v5 = v11;
  BOOL v21 = [(__objc2_class *)v11[19] firstEnabledVideoTrackInAsset:v51->_asset error:a3];
  if (v21)
  {
    if ([(__objc2_class *)v11[19] track:v7 hasSamplesForEachSampleInTrack:v21])
    {

LABEL_29:
      int64_t v15 = objc_alloc_init(_NUAVAssetTrackAuxiliaryVideoTrackProperties);
      -[_NUAVAssetTrackAuxiliaryVideoTrackProperties setTrackID:](v15, "setTrackID:", [v7 trackID]);
      long long v5 = v11;
      uint64_t v22 = [(__objc2_class *)v11[19] naturalSizeOfTrack:v7 oriented:0];
      -[_NUAVAssetTrackAuxiliaryVideoTrackProperties setSize:](v15, "setSize:", v22, v23);
      [v46 setObject:v15 forKeyedSubscript:v17];
      BOOL v8 = v17;
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
      }
      uint64_t v24 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v7;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Detected disparity track with missing samples. Cinematic effect will be disabled. %@", buf, 0xCu);
      }
    }
    goto LABEL_36;
  }

  id v25 = v46;
  id v4 = obj;
  auxiliaryVideoTrackProperties = obj;
LABEL_40:

  return (char)v21;
}

- (BOOL)loadAudioMixParameters:(id *)a3
{
  id v4 = self;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v5 = +[NUVideoUtilities cinematicAudioTrackInAsset:self->_asset];
  if (!v5)
  {
    BOOL v27 = 1;
    goto LABEL_34;
  }
  __int16 v36 = [MEMORY[0x1E4F16588] audioMixInputParametersWithTrack:v5];
  uint64_t v6 = +[NUVideoUtilities metadataTrackWithCinematicAudioDataInAsset:v4->_asset];
  if (!v6)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
    }
    uint64_t v28 = _NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Missing cinematic audio metadata track, continuing with default audio mix paramaters", buf, 2u);
    }
    goto LABEL_27;
  }
  *(_OWORD *)buf = *MEMORY[0x1E4F1FA48];
  uint64_t v42 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  id v43 = 0;
  os_signpost_id_t v7 = +[NUVideoUtilities readTimedMetadataGroupAtTime:buf fromTrack:v6 outputSettings:0 videoComposition:0 error:&v43];
  id v8 = v43;
  if (!v7)
  {
    *a3 = +[NUError errorWithCode:1 reason:@"Could not read timed metadata group at time zero from cinematic audio metadata track" object:v6 underlyingError:v8];
LABEL_32:

    BOOL v27 = 0;
    cinematicAudioMixInputParameters = v6;
    uint64_t v6 = v36;
    goto LABEL_33;
  }
  int64_t v32 = v4;
  BOOL v33 = a3;
  uint64_t v9 = [v7 items];
  if (!v9
    || (uint64_t v10 = (void *)v9,
        [v7 items],
        int64_t v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 count],
        v11,
        v10,
        !v12))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
    }
    uint64_t v13 = _NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Missing cinematic audio metadata group items, continuing with default audio mix paramaters", buf, 2u);
    }
  }
  id v34 = v7;
  uint64_t v35 = v6;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v14 = [v7 items];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (!v15) {
    goto LABEL_21;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v38;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v38 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      BOOL v20 = [v19 identifier];
      int v21 = [v20 isEqualToString:kCinematicAudioMetadataIdentifier];

      if (v21)
      {
        uint64_t v22 = [v19 dataType];
        char v23 = [v22 isEqualToString:@"com.apple.metadata.datatype.raw-data"];

        if (v23)
        {
          uint64_t v24 = [v19 dataValue];
          if (v24)
          {
            id v25 = (void *)v24;
            int v26 = [MEMORY[0x1E4F163E8] cinematicAudioEffectWithData:v24];
            [(AVAudioMixInputParameters *)v36 addEffect:v26];

            continue;
          }
          *BOOL v33 = +[NUError errorWithCode:3 reason:@"Missing cinematic audio metadata data value" object:v19];
        }
        else
        {
          uint64_t v30 = [v19 dataType];
          *BOOL v33 = +[NUError errorWithCode:2 reason:@"Expected cinematic audio metadata as raw data" object:v30];
        }
        uint64_t v6 = v35;
        goto LABEL_32;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_21:

  uint64_t v6 = v35;
  id v4 = v32;
LABEL_27:
  cinematicAudioMixInputParameters = v4->_cinematicAudioMixInputParameters;
  v4->_cinematicAudioMixInputParameters = v36;
  BOOL v27 = 1;
LABEL_33:

LABEL_34:
  return v27;
}

- (BOOL)_load:(id *)a3
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v76 = NUAssertLogger_554();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      id v77 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v77;
      _os_log_error_impl(&dword_1A9892000, v76, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v79 = NUAssertLogger_554();
    BOOL v80 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v80)
      {
        uint64_t v83 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v84 = (void *)MEMORY[0x1E4F29060];
        id v85 = v83;
        uint64_t v86 = [v84 callStackSymbols];
        uint64_t v87 = [v86 componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543618;
        *(void *)((char *)&buf.origin.x + 4) = v83;
        WORD2(buf.origin.y) = 2114;
        *(void *)((char *)&buf.origin.y + 6) = v87;
        _os_log_error_impl(&dword_1A9892000, v79, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v80)
    {
      uint64_t v81 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v82 = [v81 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v82;
      _os_log_error_impl(&dword_1A9892000, v79, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode _load:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 179, @"Invalid parameter not satisfying: %s", v88, v89, v90, v91, (uint64_t)"error != NULL");
  }
  if (!self->_loaded)
  {
    if (self->_URL) {
      objc_msgSend(MEMORY[0x1E4F16330], "assetWithURL:");
    }
    else {
    long long v5 = [MEMORY[0x1E4F16330] assetWithData:self->_videoData contentType:*MEMORY[0x1E4F15AB0] options:MEMORY[0x1E4F1CC08]];
    }
    asset = self->_asset;
    self->_asset = v5;

    os_signpost_id_t v7 = [(AVAsset *)self->_asset metadata];
    id v8 = (NSArray *)[v7 copy];
    metadata = self->_metadata;
    self->_metadata = v8;

    uint64_t v10 = [(AVAsset *)self->_asset trackGroups];
    int64_t v11 = (NSArray *)[v10 copy];
    trackGroups = self->_trackGroups;
    self->_trackGroups = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v95 = self;
    unint64_t v14 = [(AVAsset *)self->_asset tracks];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v101 objects:v109 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v102 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          BOOL v20 = [v19 metadata];
          int v21 = (void *)[v20 copy];
          uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v19, "trackID"));
          [v13 setObject:v21 forKeyedSubscript:v22];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v101 objects:v109 count:16];
      }
      while (v16);
    }

    uint64_t v23 = [v13 copy];
    trackMetadata = v95->_trackMetadata;
    v95->_trackMetadata = (NSDictionary *)v23;

    id v25 = a3;
    int v26 = +[NUVideoUtilities firstEnabledVideoTrackInAsset:v95->_asset error:a3];
    BOOL v27 = v26;
    if (v26)
    {
      if ([v26 isDecodable])
      {
        if (!+[NUVideoUtilities isAssetStyled:v95->_asset])
        {
LABEL_28:
          [v27 preferredTransform];
          v95->_orientation = +[NUVideoUtilities videoOrientationForAssetPreferredTransform:v99];
          [v27 nominalFrameRate];
          v95->_nominalFrameRate = v34;
          uint64_t v35 = [v27 formatDescriptions];
          if ([v35 count])
          {
            long long v94 = v35;
            __int16 v36 = [v35 firstObject];

            uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)v36);
            int64_t v38 = (int)Dimensions;
            uint64_t v39 = Dimensions >> 32;
            if ((((int)Dimensions | (unint64_t)(Dimensions >> 32)) & 0x8000000000000000) != 0)
            {
              long long v92 = [MEMORY[0x1E4F28B00] currentHandler];
              long long v93 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
              [v92 handleFailureInFunction:v93, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
            }
            v95->_size.int64_t width = v38;
            v95->_size.height = v39;
            CGRect buf = CMVideoFormatDescriptionGetCleanAperture((CMVideoFormatDescriptionRef)v36, 0);
            NU::RectT<long>::RectT(&v105, &buf, 3);
            $5BB7312FFE32F1AB3F1F5957C99A58B3 v40 = v106;
            v95->_cleanAperture.origin = v105;
            v95->_cleanAperture.$5BB7312FFE32F1AB3F1F5957C99A58B3 size = v40;
            uint64_t v41 = CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v36, (CFStringRef)*MEMORY[0x1E4F24A90]);
            uint64_t v42 = CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v36, (CFStringRef)*MEMORY[0x1E4F24BC8]);
            uint64_t v43 = CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v36, (CFStringRef)*MEMORY[0x1E4F24C18]);
            uint64_t v44 = (void *)v43;
            if (v41 && v42 && v43)
            {
              id v45 = v41;
              id v46 = v42;
              id v47 = (id)v43;
            }
            else
            {
              uint64_t v48 = (void *)*MEMORY[0x1E4F16248];
              if (v41) {
                uint64_t v48 = v41;
              }
              id v45 = v48;

              uint64_t v49 = (void *)*MEMORY[0x1E4F162F0];
              if (v42) {
                uint64_t v49 = v42;
              }
              id v46 = v49;

              uint64_t v50 = (void *)*MEMORY[0x1E4F16310];
              if (v44) {
                uint64_t v50 = v44;
              }
              id v47 = v50;

              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
              }
              uint64_t v51 = (void *)_NURenderLogger;
              if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_INFO))
              {
                long long v52 = v51;
                long long v53 = [v35 firstObject];
                LODWORD(buf.origin.x) = 138412290;
                *(void *)((char *)&buf.origin.x + 4) = v53;
                _os_log_impl(&dword_1A9892000, v52, OS_LOG_TYPE_INFO, "Invalid color properties in format description: %@", (uint8_t *)&buf, 0xCu);
              }
            }
            uint64_t v54 = *MEMORY[0x1E4F162E0];
            v107[0] = *MEMORY[0x1E4F16240];
            v107[1] = v54;
            v108[0] = v45;
            v108[1] = v46;
            v107[2] = *MEMORY[0x1E4F16308];
            v108[2] = v47;
            uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:3];
            colorProperties = v95->_colorProperties;
            v95->_colorProperties = (NSDictionary *)v55;

            long long v57 = [(NUSourceNode *)v95 originalNode];

            if (v57)
            {
              +[NUVideoUtilities readStillImageTimeFromVideoAsset:v95->_asset];
              *(CGPoint *)&v95->_livePhotoKeyFrameTime.value = buf.origin;
              v95->_livePhotoKeyFrameTime.int64_t epoch = *(void *)&buf.size.width;
            }
            long long v58 = v95->_asset;
            if (v58) {
              [(AVAsset *)v58 duration];
            }
            else {
              memset(&buf, 0, 24);
            }
            *(CGPoint *)&v95->_duration.value = buf.origin;
            v95->_duration.int64_t epoch = *(void *)&buf.size.width;

            long long v59 = [(NURenderNode *)v95 settings];
            long long v60 = [v59 objectForKeyedSubscript:@"appliedCropRect"];

            if (v60)
            {
              objc_msgSend(v60, "nu_CGRect");
              CGFloat v62 = (double)v95->_size.width / v61;
              CGFloat v64 = (double)v95->_size.height / v63;
              CGFloat v67 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) - v66 * v64;
              buf.origin.x = *MEMORY[0x1E4F1DAD8] - v65 * v62;
              buf.origin.y = v67;
              buf.size.int64_t width = v62;
              buf.size.height = v64;
              NU::RectT<long>::RectT(&v105, &buf, 2);
              $5BB7312FFE32F1AB3F1F5957C99A58B3 v68 = v106;
              v95->_originalExtent.origin = v105;
              v95->_originalExtent.$5BB7312FFE32F1AB3F1F5957C99A58B3 size = v68;
            }
            id v98 = 0;
            BOOL v69 = [(NUVideoSourceNode *)v95 loadAuxiliaryVideoTrackProperties:&v98];
            id v70 = v98;
            if (v69)
            {
              id v97 = 0;
              BOOL v71 = [(NUVideoSourceNode *)v95 loadAudioMixParameters:&v97];
              id v72 = v97;

              if (v71)
              {
                BOOL v4 = 1;
                v95->_loaded = 1;
              }
              else
              {
                +[NUError errorWithCode:1 reason:@"Failed to load audio mix parameters" object:v95->_asset underlyingError:v72];
                BOOL v4 = 0;
                *a3 = (id)objc_claimAutoreleasedReturnValue();
              }
              id v70 = v72;
            }
            else
            {
              +[NUError errorWithCode:1 reason:@"Failed to load auxiliary video track properties" object:v95->_asset underlyingError:v70];
              BOOL v4 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }

            uint64_t v35 = v94;
          }
          else
          {
            +[NUError unknownError:@"no format descriptions available" object:v27];
            BOOL v4 = 0;
            *id v25 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_61;
        }
        uint64_t v28 = v95->_asset;
        id v100 = 0;
        uint64_t v29 = +[NUVideoUtilities validateSemanticStyleAsset:v28 error:&v100];
        id v30 = v100;
        if ([v29 count])
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_411);
          }
          uint64_t v31 = (void *)_NURenderLogger;
          if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_FAULT))
          {
            id v74 = v31;
            CMTimeRange v75 = [v29 componentsJoinedByString:@"\n"];
            LODWORD(buf.origin.x) = 138543362;
            *(void *)((char *)&buf.origin.x + 4) = v75;
            _os_log_fault_impl(&dword_1A9892000, v74, OS_LOG_TYPE_FAULT, "Detected invalid video asset for semantic styles:\n%{public}@", (uint8_t *)&buf, 0xCu);

            id v25 = a3;
          }
          uint64_t v32 = [v29 copy];
          p_super = &v95->_corruptionInfo->super;
          v95->_corruptionInfo = (NSArray *)v32;
        }
        else
        {
          if (v29) {
            goto LABEL_27;
          }
          p_super = NURenderLogger();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.origin.x) = 138543362;
            *(void *)((char *)&buf.origin.x + 4) = v30;
            _os_log_error_impl(&dword_1A9892000, p_super, OS_LOG_TYPE_ERROR, "Failed to validate semantic style video asset: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }

LABEL_27:
        goto LABEL_28;
      }
      +[NUError unsupportedError:@"asset is unplayable" object:v95];
      BOOL v4 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v4 = 0;
    }
LABEL_61:

    return v4;
  }
  return 1;
}

- (id)sourceOptionsForSettings:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  os_signpost_id_t v7 = (void *)[v6 initWithDictionary:MEMORY[0x1E4F1CC08]];
  id v8 = [v5 objectForKeyedSubscript:@"auxiliaryImageType"];

  if (v8)
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:@"auxiliaryImageType"];
    int v10 = [v9 isEqualToString:@"Disparity"];

    if (!v10) {
      goto LABEL_6;
    }
    int64_t v11 = @"Disparity";
  }
  else
  {
    int64_t v11 = @"None";
  }
  uint64_t v12 = v11;
  [v7 setObject:v11 forKeyedSubscript:@"imageType"];

LABEL_6:
  uint64_t v13 = [v5 objectForKeyedSubscript:@"hardCropCleanAperture"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    [(NUVideoSourceNode *)self cleanAperture];
  }
  uint64_t v15 = (void *)[v7 copy];

  return v15;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  return 1;
}

- (int64_t)sourceOrientation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self->_loaded)
  {
    BOOL v4 = NUAssertLogger_554();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [NSString stringWithFormat:@"%@ not loaded", self];
      *(_DWORD *)CGRect buf = 138543362;
      int v21 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    os_signpost_id_t v7 = NUAssertLogger_554();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        int64_t v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        int v14 = [v12 callStackSymbols];
        uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        int v21 = v11;
        __int16 v22 = 2114;
        uint64_t v23 = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      int v21 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode sourceOrientation]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 148, @"%@ not loaded", v16, v17, v18, v19, (uint64_t)self);
  }
  return self->_orientation;
}

- (void)_initializeQueue
{
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  BOOL v3 = (OS_dispatch_queue *)dispatch_queue_create("NUVideoSourceNode", v5);
  queue = self->_queue;
  self->_queue = v3;
}

- (NUVideoSourceNode)initWithSettings:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_409);
  }
  id v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v6 = NSString;
    os_signpost_id_t v7 = v5;
    BOOL v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = NSStringFromSelector(a2);
    int64_t v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)CGRect buf = 138543362;
    uint64_t v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_409);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_409);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v14 = (void *)MEMORY[0x1E4F29060];
    uint64_t v15 = v13;
    uint64_t v16 = [v14 callStackSymbols];
    uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)CGRect buf = 138543362;
    uint64_t v31 = v17;
    _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v18 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  BOOL v20 = (void *)MEMORY[0x1E4F29060];
  id v21 = specific;
  uint64_t v15 = v18;
  __int16 v22 = [v20 callStackSymbols];
  uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)CGRect buf = 138543618;
  uint64_t v31 = specific;
  __int16 v32 = 2114;
  BOOL v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode initWithSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 139, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUVideoSourceNode)initWithVideoData:(id)a3 identifier:(id)a4 options:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v8 = (NSData *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    uint64_t v17 = NUAssertLogger_554();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v51 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v20 = NUAssertLogger_554();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        uint64_t v51 = v31;
        __int16 v52 = 2114;
        long long v53 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      __int16 v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v51 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode initWithVideoData:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 123, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"data != nil");
  }
  if (!v9)
  {
    uint64_t v24 = NUAssertLogger_554();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v51 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v27 = NUAssertLogger_554();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        $5BB7312FFE32F1AB3F1F5957C99A58B3 v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        uint64_t v51 = v40;
        __int16 v52 = 2114;
        long long v53 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v51 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode initWithVideoData:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 124, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"identifier != nil");
  }
  int64_t v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v12 setObject:v9 forKeyedSubscript:@"identifier"];
  id v13 = [v11 objectForKeyedSubscript:@"appliedCropRect"];
  [v12 setObject:v13 forKeyedSubscript:@"appliedCropRect"];

  v49.receiver = self;
  v49.super_class = (Class)NUVideoSourceNode;
  int v14 = [(NUSourceNode *)&v49 initWithSettings:v12];
  videoData = v14->_videoData;
  v14->_videoData = v8;

  [(NUVideoSourceNode *)v14 _initializeQueue];
  return v14;
}

- (NUVideoSourceNode)initWithURL:(id)a3 identifier:(id)a4 options:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v8 = (NSURL *)a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    uint64_t v17 = NUAssertLogger_554();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "URL != nil");
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v51 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v20 = NUAssertLogger_554();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        uint64_t v51 = v31;
        __int16 v52 = 2114;
        long long v53 = v35;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      __int16 v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v51 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode initWithURL:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 106, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"URL != nil");
  }
  if (!v9)
  {
    uint64_t v24 = NUAssertLogger_554();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v51 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v27 = NUAssertLogger_554();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        $5BB7312FFE32F1AB3F1F5957C99A58B3 v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        uint64_t v43 = [v41 callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        uint64_t v51 = v40;
        __int16 v52 = 2114;
        long long v53 = v44;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v51 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoSourceNode initWithURL:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+Video.m", 107, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"identifier != nil");
  }
  int64_t v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v12 setObject:v8 forKeyedSubscript:@"url"];
  [v12 setObject:v9 forKeyedSubscript:@"identifier"];
  id v13 = [v11 objectForKeyedSubscript:@"appliedCropRect"];
  [v12 setObject:v13 forKeyedSubscript:@"appliedCropRect"];

  v49.receiver = self;
  v49.super_class = (Class)NUVideoSourceNode;
  int v14 = [(NUSourceNode *)&v49 initWithSettings:v12];
  URL = v14->_URL;
  v14->_URL = v8;

  [(NUVideoSourceNode *)v14 _initializeQueue];
  return v14;
}

@end