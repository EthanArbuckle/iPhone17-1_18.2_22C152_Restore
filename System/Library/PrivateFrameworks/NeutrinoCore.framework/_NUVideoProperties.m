@interface _NUVideoProperties
- ($0AC6E346AE4835514AAA8AC86D8F4844)originalSize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoKeyFrameTime;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)cleanAperture;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)originalCleanAperture;
- (AVAudioMixInputParameters)cinematicAudioMixInputParameters;
- (BOOL)isHDR;
- (NSArray)metadata;
- (NSArray)trackGroups;
- (NSArray)videoCorruptionInfo;
- (NSDictionary)auxiliaryVideoTrackProperties;
- (NSDictionary)colorProperties;
- (NSDictionary)trackMetadata;
- (NSString)description;
- (NSURL)url;
- (_NUVideoProperties)initWithProperties:(id)a3;
- (float)nominalFrameRate;
- (id)metadataItemForKey:(id)a3;
- (int64_t)orientation;
- (void)setAuxiliaryVideoTrackProperties:(id)a3;
- (void)setCinematicAudioMixInputParameters:(id)a3;
- (void)setCleanAperture:(id *)a3;
- (void)setColorProperties:(id)a3;
- (void)setDuration:(id *)a3;
- (void)setLivePhotoKeyFrameTime:(id *)a3;
- (void)setMetadata:(id)a3;
- (void)setNominalFrameRate:(float)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOriginalCleanAperture:(id *)a3;
- (void)setOriginalSize:(id)a3;
- (void)setSize:(id)a3;
- (void)setTrackGroups:(id)a3;
- (void)setTrackMetadata:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVideoCorruptionInfo:(id)a3;
@end

@implementation _NUVideoProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoCorruptionInfo, 0);
  objc_storeStrong((id *)&self->_cinematicAudioMixInputParameters, 0);
  objc_storeStrong((id *)&self->_auxiliaryVideoTrackProperties, 0);
  objc_storeStrong((id *)&self->_trackMetadata, 0);
  objc_storeStrong((id *)&self->_trackGroups, 0);
  objc_storeStrong((id *)&self->_colorProperties, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)setVideoCorruptionInfo:(id)a3
{
}

- (NSArray)videoCorruptionInfo
{
  return self->_videoCorruptionInfo;
}

- (void)setCinematicAudioMixInputParameters:(id)a3
{
}

- (AVAudioMixInputParameters)cinematicAudioMixInputParameters
{
  return self->_cinematicAudioMixInputParameters;
}

- (void)setAuxiliaryVideoTrackProperties:(id)a3
{
}

- (NSDictionary)auxiliaryVideoTrackProperties
{
  return self->_auxiliaryVideoTrackProperties;
}

- (void)setTrackMetadata:(id)a3
{
}

- (NSDictionary)trackMetadata
{
  return self->_trackMetadata;
}

- (void)setTrackGroups:(id)a3
{
}

- (NSArray)trackGroups
{
  return self->_trackGroups;
}

- (void)setDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (void)setLivePhotoKeyFrameTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_livePhotoKeyFrameTime.epoch = a3->var3;
  *(_OWORD *)&self->_livePhotoKeyFrameTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoKeyFrameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setColorProperties:(id)a3
{
}

- (NSDictionary)colorProperties
{
  return self->_colorProperties;
}

- (void)setNominalFrameRate:(float)a3
{
  self->_nominalFrameRate = a3;
}

- (float)nominalFrameRate
{
  return self->_nominalFrameRate;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOriginalCleanAperture:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a3->var0;
  self->_originalCleanAperture.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3->var1;
  self->_originalCleanAperture.origin = ($86B46DF249C2B4242DBB096758D29184)var0;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)originalCleanAperture
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[6].var1.var1;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[6].var0.var1;
  retstr->var1 = v3;
  return self;
}

- (void)setCleanAperture:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a3->var0;
  self->_cleanAperture.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3->var1;
  self->_cleanAperture.origin = ($86B46DF249C2B4242DBB096758D29184)var0;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)cleanAperture
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[5].var1.var1;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[5].var0.var1;
  retstr->var1 = v3;
  return self;
}

- (void)setOriginalSize:(id)a3
{
  self->_originalSize = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)originalSize
{
  int64_t height = self->_originalSize.height;
  int64_t width = self->_originalSize.width;
  result.var1 = height;
  result.$0AC6E346AE4835514AAA8AC86D8F4844 var0 = width;
  return result;
}

- (void)setSize:(id)a3
{
  self->_size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height = self->_size.height;
  int64_t width = self->_size.width;
  result.var1 = height;
  result.$0AC6E346AE4835514AAA8AC86D8F4844 var0 = width;
  return result;
}

- (void)setMetadata:(id)a3
{
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isHDR
{
  BOOL v3 = +[NUGlobalSettings enableHDRSupport];
  if (v3)
  {
    if (+[NUGlobalSettings allAssetsCanUseHDRPipeline])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v4 = [(_NUVideoProperties *)self colorProperties];

      if (v4)
      {
        v5 = [(_NUVideoProperties *)self colorProperties];
        v6 = +[NUColorSpace colorSpaceFromVideoColorProperties:v5];

        LOBYTE(v5) = [v6 isHDR];
        LOBYTE(v3) = (_BYTE)v5;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
  }
  return v3;
}

- (id)metadataItemForKey:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v12 = NUAssertLogger_18222();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)buf = 138543362;
      v31 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v15 = NUAssertLogger_18222();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        v22 = [v20 callStackSymbols];
        v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v31 = v19;
        __int16 v32 = 2114;
        v33 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v31 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUVideoProperties metadataItemForKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoProperties.m", 46, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"key != nil");
  }
  v5 = v4;
  v6 = [(_NUVideoProperties *)self metadata];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __41___NUVideoProperties_metadataItemForKey___block_invoke;
  v28[3] = &unk_1E5D95160;
  id v7 = v5;
  id v29 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v28];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v10 = [(_NUVideoProperties *)self metadata];
    v9 = [v10 objectAtIndexedSubscript:v8];
  }

  return v9;
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_NUVideoProperties *)self url];
  v6 = [(_NUVideoProperties *)self metadata];
  uint64_t v7 = [(_NUVideoProperties *)self size];
  v9 = [NSString stringWithFormat:@"{%ld, %ld}", v7, v8];
  int64_t v10 = [(_NUVideoProperties *)self orientation];
  if ((unint64_t)(v10 - 9) >= 0xFFFFFFFFFFFFFFF8) {
    int64_t v11 = v10;
  }
  else {
    int64_t v11 = 0;
  }
  v12 = *(&NUOrientationName_names + v11);
  v13 = [(_NUVideoProperties *)self colorProperties];
  v14 = [v3 stringWithFormat:@"<%@:%p> url=%@ metadata=%@ size=%@ orientation=%@ color=%@", v4, self, v5, v6, v9, v12, v13];

  return (NSString *)v14;
}

- (_NUVideoProperties)initWithProperties:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_NUVideoProperties;
  v5 = [(_NUVideoProperties *)&v34 init];
  v6 = [v4 url];
  [(_NUVideoProperties *)v5 setUrl:v6];

  uint64_t v7 = [v4 metadata];
  [(_NUVideoProperties *)v5 setMetadata:v7];

  uint64_t v8 = [v4 size];
  -[_NUVideoProperties setSize:](v5, "setSize:", v8, v9);
  uint64_t v10 = [v4 originalSize];
  -[_NUVideoProperties setOriginalSize:](v5, "setOriginalSize:", v10, v11);
  if (v4)
  {
    [v4 cleanAperture];
    long long v30 = v32;
    long long v31 = v33;
    [(_NUVideoProperties *)v5 setCleanAperture:&v30];
    [v4 originalCleanAperture];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    [(_NUVideoProperties *)v5 setCleanAperture:&v30];
    long long v28 = 0u;
    long long v29 = 0u;
  }
  v27[0] = v28;
  v27[1] = v29;
  [(_NUVideoProperties *)v5 setOriginalCleanAperture:v27];
  -[_NUVideoProperties setOrientation:](v5, "setOrientation:", [v4 orientation]);
  [v4 nominalFrameRate];
  -[_NUVideoProperties setNominalFrameRate:](v5, "setNominalFrameRate:");
  v12 = [v4 colorProperties];
  [(_NUVideoProperties *)v5 setColorProperties:v12];

  if (v4)
  {
    [v4 livePhotoKeyFrameTime];
    long long v23 = v25;
    uint64_t v24 = v26;
    [(_NUVideoProperties *)v5 setLivePhotoKeyFrameTime:&v23];
    [v4 duration];
  }
  else
  {
    long long v25 = 0uLL;
    uint64_t v26 = 0;
    uint64_t v24 = 0;
    long long v23 = 0uLL;
    [(_NUVideoProperties *)v5 setLivePhotoKeyFrameTime:&v23];
    long long v21 = 0uLL;
    uint64_t v22 = 0;
  }
  long long v19 = v21;
  uint64_t v20 = v22;
  [(_NUVideoProperties *)v5 setDuration:&v19];
  v13 = [v4 trackGroups];
  [(_NUVideoProperties *)v5 setTrackGroups:v13];

  v14 = [v4 trackMetadata];
  [(_NUVideoProperties *)v5 setTrackMetadata:v14];

  v15 = [v4 auxiliaryVideoTrackProperties];
  [(_NUVideoProperties *)v5 setAuxiliaryVideoTrackProperties:v15];

  BOOL v16 = [v4 cinematicAudioMixInputParameters];
  [(_NUVideoProperties *)v5 setCinematicAudioMixInputParameters:v16];

  v17 = [v4 videoCorruptionInfo];
  [(_NUVideoProperties *)v5 setVideoCorruptionInfo:v17];

  return v5;
}

@end