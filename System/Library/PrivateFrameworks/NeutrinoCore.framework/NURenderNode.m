@interface NURenderNode
+ (id)nodeFromCache:(id)a3;
+ (id)nodeFromCache:(id)a3 cache:(id)a4;
+ (id)resampleImage:(id)a3 by:(id)a4 sampleMode:(int64_t)a5 extent:(id *)a6 colorSpace:(id)a7;
- (AVAudioMix)cached_outputAudioMix;
- (AVComposition)cached_outputVideo;
- (AVVideoComposition)cached_outputVideoComposition;
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)canPropagateOriginalLivePhotoMetadataTrack;
- (BOOL)hasCyclicalDependencyForInput:(id)a3;
- (BOOL)isCached;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRenderNode:(id)a3;
- (BOOL)isEqualToSettingsAndInputs:(id)a3;
- (BOOL)isGeometryNode;
- (BOOL)isPlaceholderNode;
- (BOOL)requiresAudioMix;
- (BOOL)requiresVideoComposition;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (BOOL)shouldInvalidateCachedAudioMix;
- (CIImage)cached_outputImage;
- (NSDictionary)inputs;
- (NSDictionary)settings;
- (NSDictionary)xforms;
- (NSMutableDictionary)cached_auxiliaryImages;
- (NSString)dominantInputKey;
- (NSString)nodeCreationJobName;
- (NSString)spaceMapKey;
- (NUGeometrySpaceMap)cached_geometrySpaceMap;
- (NUImageGeometry)cached_outputImageGeometry;
- (NUImageProperties)cached_imageProperties;
- (NURenderNode)init;
- (NURenderNode)initWithSettings:(id)a3 inputs:(id)a4;
- (NUVideoProperties)cached_videoProperties;
- (double)nodeCreationTime;
- (id)_descriptionWithOffset:(int64_t)a3 showInputs:(BOOL)a4 map:(id)a5;
- (id)_dictionaryToSingleLineString:(id)a3;
- (id)_evaluateAudioMix:(id *)a3;
- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4;
- (id)_evaluateGeometrySpaceMap:(id *)a3;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateImageProperties:(id *)a3;
- (id)_evaluateTimedMetadataSampleWithIdentifier:(id)a3 atTime:(id *)a4 error:(id *)a5;
- (id)_evaluateVideo:(id *)a3;
- (id)_evaluateVideoAttributes:(id *)a3;
- (id)_evaluateVideoComposition:(id *)a3;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)_generateSpaceMapKey;
- (id)aliasDescription;
- (id)debugDescription;
- (id)debugQuickLookObject;
- (id)description;
- (id)descriptionSubClassHook;
- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4;
- (id)evaluateSettings:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)geometryNode;
- (id)imageProperties:(id *)a3;
- (id)inputForKey:(id)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 error:(id *)a4;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)originalAuxiliaryImageForType:(int64_t)a3 error:(id *)a4;
- (id)outputAudioMix:(id *)a3;
- (id)outputGeometrySpaceMap:(id *)a3;
- (id)outputImage:(id *)a3;
- (id)outputImageGeometry:(id *)a3;
- (id)outputTimedMetadataSampleWithIdentifier:(id)a3 atTime:(id *)a4 error:(id *)a5;
- (id)outputVideo:(id *)a3;
- (id)outputVideoComposition:(id *)a3;
- (id)placeholderNodeWithCachedInputs:(id)a3;
- (id)resamplingColorSpace;
- (id)resolvedNodeWithCachedInputs:(id)a3 cache:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (id)uniqueInputNode;
- (id)videoProperties:(id *)a3;
- (int64_t)_evaluatedForMode;
- (int64_t)cacheHitsCount;
- (unint64_t)_hash;
- (unint64_t)hash;
- (unint64_t)settingsAndInputsHash;
- (void)_appendInputsWithOffset:(int64_t)a3 to:(id)a4 map:(id)a5;
- (void)invalidateCachedAudioMix;
- (void)nu_updateDigest:(id)a3;
- (void)resetInput:(id)a3 forKey:(id)a4;
- (void)setCacheHitsCount:(int64_t)a3;
- (void)setCached:(BOOL)a3;
- (void)setCached_auxiliaryImages:(id)a3;
- (void)setCached_geometrySpaceMap:(id)a3;
- (void)setCached_imageProperties:(id)a3;
- (void)setCached_outputAudioMix:(id)a3;
- (void)setCached_outputImage:(id)a3;
- (void)setCached_outputImageGeometry:(id)a3;
- (void)setCached_outputVideo:(id)a3;
- (void)setCached_outputVideoComposition:(id)a3;
- (void)setCached_videoProperties:(id)a3;
- (void)setEvaluatedForMode:(int64_t)a3;
- (void)setNodeCreationJobName:(id)a3;
- (void)set_evaluatedForMode:(int64_t)a3;
@end

@implementation NURenderNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeCreationJobName, 0);
  objc_storeStrong((id *)&self->_spaceMapKey, 0);
  objc_storeStrong((id *)&self->_dominantInputKey, 0);
  objc_storeStrong((id *)&self->_cached_geometrySpaceMap, 0);
  objc_storeStrong((id *)&self->_cached_videoProperties, 0);
  objc_storeStrong((id *)&self->_cached_imageProperties, 0);
  objc_storeStrong((id *)&self->_cached_outputImageGeometry, 0);
  objc_storeStrong((id *)&self->_cached_outputAudioMix, 0);
  objc_storeStrong((id *)&self->_cached_outputVideoComposition, 0);
  objc_storeStrong((id *)&self->_cached_outputVideo, 0);
  objc_storeStrong((id *)&self->_cached_auxiliaryImages, 0);
  objc_storeStrong((id *)&self->_cached_outputImage, 0);
  objc_storeStrong((id *)&self->_xforms, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_inputs, 0);
}

- (void)setCacheHitsCount:(int64_t)a3
{
  self->_cacheHitsCount = a3;
}

- (int64_t)cacheHitsCount
{
  return self->_cacheHitsCount;
}

- (void)setNodeCreationJobName:(id)a3
{
}

- (NSString)nodeCreationJobName
{
  return self->_nodeCreationJobName;
}

- (double)nodeCreationTime
{
  return self->_nodeCreationTime;
}

- (NSString)spaceMapKey
{
  return self->_spaceMapKey;
}

- (NSString)dominantInputKey
{
  return self->_dominantInputKey;
}

- (BOOL)isCached
{
  return self->_cached;
}

- (void)set_evaluatedForMode:(int64_t)a3
{
  self->__evaluatedForMode = a3;
}

- (int64_t)_evaluatedForMode
{
  return self->__evaluatedForMode;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

- (void)setCached_geometrySpaceMap:(id)a3
{
}

- (NUGeometrySpaceMap)cached_geometrySpaceMap
{
  return (NUGeometrySpaceMap *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCached_videoProperties:(id)a3
{
}

- (NUVideoProperties)cached_videoProperties
{
  return (NUVideoProperties *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCached_imageProperties:(id)a3
{
}

- (NUImageProperties)cached_imageProperties
{
  return (NUImageProperties *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCached_outputImageGeometry:(id)a3
{
}

- (NUImageGeometry)cached_outputImageGeometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCached_outputAudioMix:(id)a3
{
}

- (AVAudioMix)cached_outputAudioMix
{
  return (AVAudioMix *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCached_outputVideoComposition:(id)a3
{
}

- (AVVideoComposition)cached_outputVideoComposition
{
  return (AVVideoComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCached_outputVideo:(id)a3
{
}

- (AVComposition)cached_outputVideo
{
  return (AVComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCached_auxiliaryImages:(id)a3
{
}

- (NSMutableDictionary)cached_auxiliaryImages
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCached_outputImage:(id)a3
{
}

- (CIImage)cached_outputImage
{
  return (CIImage *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isGeometryNode
{
  return self->_isGeometryNode;
}

- (NSDictionary)xforms
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)settings
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)inputs
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)nu_updateDigest:(id)a3
{
  id v8 = a3;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v8 addString:v5];

  [v8 addCString:"settings"];
  v6 = [(NURenderNode *)self settings];
  objc_msgSend(v6, "nu_updateDigest:", v8);

  [v8 addCString:"inputs"];
  v7 = [(NURenderNode *)self inputs];
  objc_msgSend(v7, "nu_updateDigest:", v8);

  [v8 addCString:"end"];
}

- (unint64_t)hash
{
  unint64_t result = self->_hashValue;
  if (!result)
  {
    unint64_t result = [(NURenderNode *)self _hash];
    self->_hashValue = result;
  }
  return result;
}

- (unint64_t)_hash
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = 0x412264519ABB7 * [v4 hash];

  return (0x1C820311EBB3D9 * [(NURenderNode *)self settingsAndInputsHash]) ^ v5;
}

- (unint64_t)settingsAndInputsHash
{
  uint64_t v3 = NUDeepDictionaryHash(self->_settings);
  v4 = self->_inputs;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __NURenderNodeDictionaryHash_block_invoke;
  v7[3] = &unk_1E5D95C88;
  v7[4] = &v8;
  [(NSDictionary *)v4 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return (0x22FE22F4190DAFLL * v5) ^ (0x18705A47792769 * v3);
}

- (BOOL)isEqualToRenderNode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class() && [(NURenderNode *)self isEqualToSettingsAndInputs:v4];

  return v6;
}

- (BOOL)isEqualToSettingsAndInputs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)v4[3];
  BOOL v6 = self->_inputs;
  id v7 = v5;
  uint64_t v8 = [(NSDictionary *)v6 count];
  if (v8 != [v7 count])
  {

    goto LABEL_5;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __NURenderNodeDictionaryEqual_block_invoke;
  v18 = &unk_1E5D94D60;
  id v9 = v7;
  id v19 = v9;
  v20 = &v21;
  [(NSDictionary *)v6 enumerateKeysAndObjectsUsingBlock:&v15];
  int v10 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  if (!v10)
  {
LABEL_5:
    char v13 = 0;
    goto LABEL_6;
  }
  uint64_t v11 = [(NURenderNode *)self settings];
  v12 = [v4 settings];
  char v13 = [v11 isEqualToDictionary:v12];

LABEL_6:
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NURenderNode *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NURenderNode *)self isEqualToRenderNode:v4];
  }

  return v5;
}

- (id)aliasDescription
{
  return &stru_1F0017700;
}

- (id)descriptionSubClassHook
{
  return &stru_1F0017700;
}

- (id)_descriptionWithOffset:(int64_t)a3 showInputs:(BOOL)a4 map:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v9 = objc_opt_class();
  int64_t v10 = [(NURenderNode *)self evaluatedForMode];
  if ((unint64_t)(v10 - 1) > 2) {
    uint64_t v11 = @"Prepare";
  }
  else {
    uint64_t v11 = off_1E5D93E68[v10 - 1];
  }
  v12 = v11;
  BOOL v13 = [(NURenderNode *)self isCached];
  unint64_t v14 = [(NURenderNode *)self hash];
  uint64_t v15 = [(NURenderNode *)self descriptionSubClassHook];
  uint64_t v16 = [(NURenderNode *)self _dictionaryToSingleLineString:self->_settings];
  v17 = [v8 stringWithFormat:@"<%@:%p> evaluated=%@ cached=%d hash=%lu %@ settings=%@", v9, self, v12, v13, v14, v15, v16];

  if (v5) {
    [(NURenderNode *)self _appendInputsWithOffset:a3 to:v17 map:v7];
  }

  return v17;
}

- (void)_appendInputsWithOffset:(int64_t)a3 to:(id)a4 map:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v27 = a4;
  id v8 = a5;
  v26 = self;
  uint64_t v9 = [(NSDictionary *)self->_inputs allKeys];
  int64_t v10 = [v9 sortedArrayUsingSelector:sel_compare_];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v10;
  uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v28)
  {
    int64_t v29 = a3 + 1;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        BOOL v13 = [(NSDictionary *)v26->_inputs objectForKey:v12];
        unint64_t v14 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n"];
        uint64_t v15 = v14;
        if ((a3 & 0x8000000000000000) == 0) {
          [v14 appendString:@"|"];
        }
        uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%2ld", v29);
        [v15 appendString:v16];
        int64_t v17 = a3 & ~(a3 >> 63);
        if (a3 >= 1)
        {
          do
          {
            [v15 appendString:@"--"];
            --v17;
          }
          while (v17);
        }
        if ((a3 & 0x8000000000000000) == 0) {
          [v15 appendString:@">"];
        }
        uint64_t v18 = [v8 objectForKey:v13];
        if (v18)
        {
          id v19 = (void *)v18;
          [v27 appendFormat:@"%@ '%@' : %@", v15, v12, v18];
        }
        else
        {
          v20 = [v13 _descriptionWithOffset:v29 showInputs:1 map:v8];
          [v27 appendFormat:@"%@ '%@' : %@", v15, v12, v20];

          if (!v8) {
            goto LABEL_17;
          }
          uint64_t v23 = NSString;
          uint64_t v21 = objc_opt_class();
          v22 = [v13 aliasDescription];
          id v19 = [v23 stringWithFormat:@"<%@:%p> %@", v21, v13, v22];

          [v8 setObject:v19 forKey:v13];
        }

LABEL_17:
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v28);
  }
}

- (id)_dictionaryToSingleLineString:(id)a3
{
  uint64_t v3 = [a3 description];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F0017700];

  BOOL v5 = [v4 stringByReplacingOccurrencesOfString:@"\t" withString:@" "];

  BOOL v6 = [v5 stringByReplacingOccurrencesOfString:@"    " withString:@" "];

  unint64_t v7 = [v6 length];
  if (v7 >= 0xFF) {
    uint64_t v8 = 255;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t v9 = [v6 substringToIndex:v8];

  return v9;
}

- (id)debugDescription
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:514 valueOptions:0 capacity:0];
  id v4 = [(NURenderNode *)self _descriptionWithOffset:0 showInputs:1 map:v3];

  return v4;
}

- (id)description
{
  return [(NURenderNode *)self _descriptionWithOffset:0 showInputs:0 map:0];
}

- (id)_evaluateVideoProperties:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v11 = NUAssertLogger_14509();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v30 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    unint64_t v14 = NUAssertLogger_14509();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        uint64_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        uint64_t v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v30 = v18;
        __int16 v31 = 2114;
        long long v32 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v30 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateVideoProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1177, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    BOOL v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    BOOL v6 = [(NSDictionary *)v5 videoProperties:a3];
    if (!v6 && !*a3)
    {
      unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate video properties", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1183);
      *a3 = +[NUError unknownError:v7 object:v5];
    }
LABEL_11:

    goto LABEL_12;
  }
  memset(v27, 0, sizeof(v27));
  BOOL v5 = self->_inputs;
  if ([(NSDictionary *)v5 countByEnumeratingWithState:v27 objects:v28 count:16])
  {
    uint64_t v8 = [(NSDictionary *)self->_inputs objectForKey:**((void **)&v27[0] + 1)];
    BOOL v6 = [v8 videoProperties:a3];
    if (!v6 && !*a3)
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate video properties", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1195, *(void *)&v27[0]);
      *a3 = +[NUError unknownError:v9 object:v8];
    }
    goto LABEL_11;
  }

  +[NUError unknownError:@"unable to resolve video properties -- no inputs" object:self];
  BOOL v6 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v6;
}

- (id)videoProperties:(id *)a3
{
  if ([(NURenderNode *)self isCached])
  {
    BOOL v5 = [(NURenderNode *)self cached_videoProperties];
    if (!v5)
    {
      uint64_t v6 = [(NURenderNode *)self _evaluateVideoProperties:a3];
      BOOL v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate video properties", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1164);
        *a3 = +[NUError unknownError:v7 object:self];
      }
      [(NURenderNode *)self setCached_videoProperties:v5];
    }
  }
  else
  {
    BOOL v5 = [(NURenderNode *)self _evaluateVideoProperties:a3];
  }

  return v5;
}

- (id)_evaluateImageProperties:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v11 = NUAssertLogger_14509();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v30 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    unint64_t v14 = NUAssertLogger_14509();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        uint64_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        uint64_t v21 = [v19 callStackSymbols];
        v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v30 = v18;
        __int16 v31 = 2114;
        long long v32 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      int64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v30 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateImageProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1126, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    BOOL v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [(NSDictionary *)v5 imageProperties:a3];
    if (!v6 && !*a3)
    {
      unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate image properties", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1132);
      *a3 = +[NUError unknownError:v7 object:v5];
    }
LABEL_11:

    goto LABEL_12;
  }
  memset(v27, 0, sizeof(v27));
  BOOL v5 = self->_inputs;
  if ([(NSDictionary *)v5 countByEnumeratingWithState:v27 objects:v28 count:16])
  {
    uint64_t v8 = [(NSDictionary *)self->_inputs objectForKey:**((void **)&v27[0] + 1)];
    uint64_t v6 = [v8 imageProperties:a3];
    if (!v6 && !*a3)
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate image properties", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1146, *(void *)&v27[0]);
      *a3 = +[NUError unknownError:v9 object:v8];
    }
    goto LABEL_11;
  }

  +[NUError unknownError:@"unable to resolve image properties -- no inputs" object:self];
  uint64_t v6 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v6;
}

- (id)imageProperties:(id *)a3
{
  if ([(NURenderNode *)self isCached])
  {
    BOOL v5 = [(NURenderNode *)self cached_imageProperties];
    if (!v5)
    {
      uint64_t v6 = [(NURenderNode *)self _evaluateImageProperties:a3];
      BOOL v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate image properties", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1113);
        *a3 = +[NUError unknownError:v7 object:self];
      }
      [(NURenderNode *)self setCached_imageProperties:v5];
    }
  }
  else
  {
    BOOL v5 = [(NURenderNode *)self _evaluateImageProperties:a3];
  }

  return v5;
}

- (id)_evaluateVideoAttributes:(id *)a3
{
  dominantInputKey = self->_dominantInputKey;
  inputs = self->_inputs;
  if (dominantInputKey) {
    goto LABEL_4;
  }
  if ([(NSDictionary *)inputs count] == 1)
  {
    inputs = self->_inputs;
    dominantInputKey = (NSString *)*MEMORY[0x1E4F1E480];
LABEL_4:
    unint64_t v7 = [(NSDictionary *)inputs objectForKey:dominantInputKey];
    uint64_t v8 = [v7 outputVideoAttributes:a3];

    goto LABEL_6;
  }
  uint64_t v8 = 0;
LABEL_6:

  return v8;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v32 = NUAssertLogger_14509();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v35 = NUAssertLogger_14509();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        v39 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v40 = (void *)MEMORY[0x1E4F29060];
        id v41 = v39;
        v42 = [v40 callStackSymbols];
        v43 = [v42 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v39;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v43;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateImageGeometry:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 965, @"Invalid parameter not satisfying: %s", v44, v45, v46, v47, (uint64_t)"error != nil");
  }
  uint64_t v5 = *((void *)&NUScaleOne + 1);
  uint64_t v6 = NUScaleOne;
  long long v57 = 0u;
  long long v58 = 0u;
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    unint64_t v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [(NSDictionary *)v7 outputImageGeometry:a3];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 renderScale];
      if (v10 >= 1 && v11 > 0)
      {
        uint64_t v6 = v10;
        uint64_t v5 = v11;
        [v9 extent];
        uint64_t v24 = [v9 orientation];
        uint64_t v25 = [v9 roundingPolicy];

        goto LABEL_31;
      }
      BOOL v13 = +[NUError errorWithCode:1 reason:@"invalid scale for input node" object:v7];
    }
    else
    {
      BOOL v13 = +[NUError errorWithCode:1 reason:@"unable to evaluate image geometry" object:v7 underlyingError:*a3];
    }
    *a3 = v13;

LABEL_41:
    id v27 = 0;
    goto LABEL_42;
  }
  long long v55 = 0uLL;
  long long v56 = 0uLL;
  long long v53 = 0uLL;
  long long v54 = 0uLL;
  unint64_t v7 = self->_inputs;
  uint64_t v51 = [(NSDictionary *)v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (!v51)
  {
    uint64_t v25 = 0;
    uint64_t v24 = 1;
    goto LABEL_31;
  }
  uint64_t v49 = 0;
  uint64_t v50 = v6;
  uint64_t v52 = *(void *)v54;
  uint64_t v24 = 1;
  char v14 = 1;
  id obj = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v51; ++i)
    {
      if (*(void *)v54 != v52) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = [(NSDictionary *)self->_inputs objectForKey:*(void *)(*((void *)&v53 + 1) + 8 * i)];
      int64_t v17 = [v16 outputImageGeometry:a3];
      uint64_t v18 = v17;
      if (!v17)
      {
        uint64_t v28 = +[NUError errorWithCode:1 reason:@"unable to evaluate image geometry" object:v16 underlyingError:*a3];
        goto LABEL_40;
      }
      uint64_t v19 = [v17 renderScale];
      if (v19 < 1 || v20 <= 0)
      {
        int64_t v29 = @"invalid scale for input node";
        goto LABEL_35;
      }
      uint64_t v22 = v19;
      uint64_t v23 = v20;
      if (v14)
      {
        [v18 extent];
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v24 = [v18 orientation];
        uint64_t v49 = [v18 roundingPolicy];
        uint64_t v50 = v22;
        uint64_t v5 = v23;
        goto LABEL_25;
      }
      if (!NUScaleEqual(v19, v20, v50, v5))
      {
        int64_t v29 = @"mismatch of rendering scales across inputs";
LABEL_35:
        uint64_t v30 = 1;
LABEL_39:
        uint64_t v28 = +[NUError errorWithCode:v30 reason:v29 object:v16];
LABEL_40:
        *a3 = v28;

        goto LABEL_41;
      }
      [v18 extent];
      memset(buf, 0, 32);
      long long v59 = v57;
      long long v60 = v58;
      NU::RectT<long>::add((uint64_t *)&v59, (uint64_t *)buf);
      long long v57 = v59;
      long long v58 = v60;
      if (v24 != [v18 orientation])
      {
        int64_t v29 = @"incompatible orientations for multiple inputs";
LABEL_38:
        uint64_t v30 = 5;
        goto LABEL_39;
      }
      if (v49 != [v18 roundingPolicy])
      {
        int64_t v29 = @"incompatible rounding policy for multiple inputs";
        goto LABEL_38;
      }
LABEL_25:

      char v14 = 0;
    }
    unint64_t v7 = obj;
    char v14 = 0;
    uint64_t v51 = [(NSDictionary *)obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v51) {
      continue;
    }
    break;
  }
  uint64_t v25 = v49;
  uint64_t v6 = v50;
LABEL_31:

  uint64_t v26 = [NUImageGeometry alloc];
  *(_OWORD *)buf = v57;
  *(_OWORD *)&buf[16] = v58;
  id v27 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](v26, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", buf, v6, v5, v24, 0, v25);
LABEL_42:

  return v27;
}

- (id)outputImageGeometry:(id *)a3
{
  if ([(NURenderNode *)self isCached])
  {
    uint64_t v5 = [(NURenderNode *)self cached_outputImageGeometry];
    if (!v5)
    {
      uint64_t v6 = [(NURenderNode *)self _evaluateImageGeometry:a3];
      if (v6)
      {
        uint64_t v5 = (void *)v6;
        [(NURenderNode *)self setCached_outputImageGeometry:v6];
      }
      else
      {
        if (a3 && !*a3)
        {
          uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate image geometry", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 951);
          *a3 = +[NUError unknownError:v8 object:self];
        }
        uint64_t v5 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = [(NURenderNode *)self _evaluateImageGeometry:a3];
  }

  return v5;
}

- (id)_evaluateGeometrySpaceMap:(id *)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v22 = NUAssertLogger_14509();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      v62 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v25 = NUAssertLogger_14509();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        int64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        long long v32 = [v30 callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v29;
        __int16 v63 = 2114;
        v64 = v33;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      id v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateGeometrySpaceMap:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 903, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"error != nil");
  }
  if ([(NURenderNode *)self isGeometryNode])
  {
    uint64_t v5 = objc_alloc_init(NUGeometrySpaceMap);
    if (self->_dominantInputKey)
    {
      dominantInputKey = self->_dominantInputKey;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&dominantInputKey count:1];
    }
    else
    {
      uint64_t v6 = [(NURenderNode *)self inputs];
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v56;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v56 != v13) {
            objc_enumerationMutation(v10);
          }
          BOOL v15 = [(NURenderNode *)self inputForKey:*(void *)(*((void *)&v55 + 1) + 8 * i)];
          uint64_t v16 = [v15 outputGeometrySpaceMap:a3];
          if (!v16)
          {
            if (!*a3)
            {
              uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate geometry space map", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 919, (void)v55);
              *a3 = +[NUError unknownError:v20 object:v15];
            }
            uint64_t v8 = 0;
            goto LABEL_22;
          }
          int64_t v17 = (void *)v16;
          [(NUGeometrySpaceMap *)v5 mergeWithSpaceMap:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v18 = objc_opt_new();
    uint64_t v19 = [(NURenderNode *)self spaceMapKey];
    [(NUGeometrySpaceMap *)v5 setSpace:v18 forKey:v19];

    uint64_t v8 = v5;
LABEL_22:
  }
  else
  {
    unint64_t v7 = [(NURenderNode *)self uniqueInputNode];
    if (!v7)
    {
      v38 = NUAssertLogger_14509();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = [NSString stringWithFormat:@"SpaceMap :: Nodes with 0 or 2 or more inputs must be geometry nodes"];
        *(_DWORD *)buf = 138543362;
        v62 = v39;
        _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      id v41 = NUAssertLogger_14509();
      BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
      if (v40)
      {
        if (v42)
        {
          uint64_t v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v46 = (void *)MEMORY[0x1E4F29060];
          id v47 = v45;
          v48 = [v46 callStackSymbols];
          uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          v62 = v45;
          __int16 v63 = 2114;
          v64 = v49;
          _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v42)
      {
        v43 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v62 = v44;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateGeometrySpaceMap:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 934, @"SpaceMap :: Nodes with 0 or 2 or more inputs must be geometry nodes", v50, v51, v52, v53, v54);
    }
    uint64_t v5 = v7;
    uint64_t v8 = [(NUGeometrySpaceMap *)v7 outputGeometrySpaceMap:a3];
    if (!v8 && !*a3)
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate geometry space map", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 937);
      *a3 = +[NUError unknownError:v9 object:v5];
    }
  }

  return v8;
}

- (id)geometryNode
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NURenderNode *)self isGeometryNode])
  {
    uint64_t v3 = self;
  }
  else
  {
    id v4 = [(NURenderNode *)self uniqueInputNode];
    if (!v4)
    {
      unint64_t v7 = NUAssertLogger_14509();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = [NSString stringWithFormat:@"GeometryNode :: Nodes with 0 or 2 or more inputs must be geometry nodes"];
        *(_DWORD *)uint64_t v23 = 138543362;
        *(void *)&v23[4] = v8;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v23, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      id v10 = NUAssertLogger_14509();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v11)
        {
          char v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          BOOL v15 = (void *)MEMORY[0x1E4F29060];
          id v16 = v14;
          int64_t v17 = [v15 callStackSymbols];
          uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
          *(_DWORD *)uint64_t v23 = 138543618;
          *(void *)&v23[4] = v14;
          __int16 v24 = 2114;
          uint64_t v25 = v18;
          _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v23, 0x16u);
        }
      }
      else if (v11)
      {
        uint64_t v12 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v23 = 138543362;
        *(void *)&v23[4] = v13;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v23, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NURenderNode geometryNode]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 895, @"GeometryNode :: Nodes with 0 or 2 or more inputs must be geometry nodes", v19, v20, v21, v22, *(uint64_t *)v23);
    }
    uint64_t v5 = v4;
    uint64_t v3 = [v4 geometryNode];
  }

  return v3;
}

- (id)uniqueInputNode
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__14581;
  uint64_t v13 = __Block_byref_object_dispose__14582;
  id v14 = 0;
  uint64_t v3 = [(NURenderNode *)self inputs];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    uint64_t v5 = [(NURenderNode *)self inputs];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31__NURenderNode_uniqueInputNode__block_invoke;
    v8[3] = &unk_1E5D95C88;
    v8[4] = &v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __31__NURenderNode_uniqueInputNode__block_invoke(uint64_t a1, int a2, id obj, unsigned char *a4)
{
  *a4 = 1;
}

- (id)outputGeometrySpaceMap:(id *)a3
{
  if ([(NURenderNode *)self isCached])
  {
    uint64_t v5 = [(NURenderNode *)self cached_geometrySpaceMap];
    if (!v5)
    {
      uint64_t v6 = [(NURenderNode *)self _evaluateGeometrySpaceMap:a3];
      uint64_t v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate geometry space map", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 863);
        *a3 = +[NUError unknownError:v7 object:self];
      }
      [(NURenderNode *)self setCached_geometrySpaceMap:v5];
    }
  }
  else
  {
    uint64_t v5 = [(NURenderNode *)self _evaluateGeometrySpaceMap:a3];
  }

  return v5;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    uint64_t v13 = NUAssertLogger_14509();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      long long v32 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v16 = NUAssertLogger_14509();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        uint64_t v23 = [v21 callStackSymbols];
        __int16 v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v32 = v20;
        __int16 v33 = 2114;
        uint64_t v34 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      uint64_t v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v32 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateAuxiliaryImageForType:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 828, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"error != NULL");
  }
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    unint64_t v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [(NSDictionary *)v7 originalAuxiliaryImageForType:a3 error:a4];
    if (!v8 && !*a4)
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate auxiliary image", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 834);
      *a4 = +[NUError unknownError:v9 object:v7];
    }
LABEL_11:

    goto LABEL_12;
  }
  memset(v29, 0, sizeof(v29));
  unint64_t v7 = self->_inputs;
  if ([(NSDictionary *)v7 countByEnumeratingWithState:v29 objects:v30 count:16])
  {
    id v10 = [(NSDictionary *)self->_inputs objectForKey:**((void **)&v29[0] + 1)];
    uint64_t v8 = [v10 originalAuxiliaryImageForType:a3 error:a4];
    if (!v8 && !*a4)
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate evaluate auxiliary image", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 845, *(void *)&v29[0]);
      *a4 = +[NUError unknownError:v11 object:v10];
    }
    goto LABEL_11;
  }

  +[NUError unknownError:@"unable to resolve evaluate auxiliary image" object:self];
  uint64_t v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v8;
}

- (id)originalAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  if ([(NURenderNode *)self isCached])
  {
    if ((unint64_t)a3 > 0xB) {
      unint64_t v7 = @"Invalid";
    }
    else {
      unint64_t v7 = off_1E5D94190[a3];
    }
    uint64_t v9 = v7;
    id v10 = [(NURenderNode *)self cached_auxiliaryImages];
    uint64_t v8 = [v10 objectForKeyedSubscript:v9];

    if (!v8)
    {
      uint64_t v11 = [(NURenderNode *)self _evaluateAuxiliaryImageForType:a3 error:a4];
      uint64_t v8 = (void *)v11;
      if (a4 && !v11 && !*a4)
      {
        uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate portrait effects matte", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 816);
        *a4 = +[NUError unknownError:v12 object:self];
      }
      uint64_t v13 = [(NURenderNode *)self cached_auxiliaryImages];
      [v13 setObject:v8 forKeyedSubscript:v9];
    }
  }
  else
  {
    uint64_t v8 = [(NURenderNode *)self _evaluateAuxiliaryImageForType:a3 error:a4];
  }

  return v8;
}

- (BOOL)canPropagateOriginalLivePhotoMetadataTrack
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    uint64_t v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    char v4 = [(NSDictionary *)v3 canPropagateOriginalLivePhotoMetadataTrack];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v3 = self->_inputs;
    uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          int v10 = [v9 canPropagateOriginalLivePhotoMetadataTrack];

          if (!v10)
          {
            char v4 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [(NSDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    char v4 = 1;
  }
LABEL_13:

  return v4;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    uint64_t v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    char v6 = [(NSDictionary *)v5 canPropagateOriginalAuxiliaryData:a3];
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    uint64_t v5 = self->_inputs;
    if ([(NSDictionary *)v5 countByEnumeratingWithState:v9 objects:v10 count:16])
    {
      uint64_t v7 = -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", **((void **)&v9[0] + 1), *(void *)&v9[0]);
      char v6 = [v7 canPropagateOriginalAuxiliaryData:a3];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)_evaluateImage:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
  }
  uint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    char v4 = NSString;
    uint64_t v5 = v3;
    char v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = [v4 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v7];
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v8;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v9 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v9 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
      }
      goto LABEL_8;
    }
    if (v9 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    int v10 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F29060];
    long long v12 = v10;
    long long v13 = [v11 callStackSymbols];
    long long v14 = [v13 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v14;
    _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  long long v15 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v17 = (void *)MEMORY[0x1E4F29060];
  id v18 = specific;
  long long v12 = v15;
  uint64_t v19 = [v17 callStackSymbols];
  uint64_t v20 = [v19 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v28 = specific;
  __int16 v29 = 2114;
  uint64_t v30 = v20;
  _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v21 = (objc_class *)objc_opt_class();
  uint64_t v22 = NSStringFromClass(v21);
  _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateImage:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 771, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v23, v24, v25, v26, v22);
}

- (id)debugQuickLookObject
{
  uint64_t v3 = [(NURenderNode *)self cached_outputImage];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_3:
    char v6 = v5;
    goto LABEL_6;
  }
  if (!self->_dominantInputKey)
  {
    id v5 = [MEMORY[0x1E4F1E050] emptyImage];
    goto LABEL_3;
  }
  uint64_t v7 = -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
  char v6 = [v7 debugQuickLookObject];

LABEL_6:

  return v6;
}

- (id)_evaluateTimedMetadataSampleWithIdentifier:(id)a3 atTime:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  inputs = self->_inputs;
  if (self->_dominantInputKey)
  {
    int v10 = -[NSDictionary objectForKey:](inputs, "objectForKey:");
    uint64_t v11 = v10;
    long long v17 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
LABEL_5:
    a5 = [v10 _evaluateTimedMetadataSampleWithIdentifier:v8 atTime:&v17 error:a5];

    goto LABEL_6;
  }
  if ([(NSDictionary *)inputs count] == 1)
  {
    long long v12 = self->_inputs;
    long long v13 = [(NSDictionary *)v12 allKeys];
    long long v14 = [v13 objectAtIndexedSubscript:0];
    uint64_t v11 = [(NSDictionary *)v12 objectForKeyedSubscript:v14];

    long long v17 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    int v10 = v11;
    goto LABEL_5;
  }
  if (a5)
  {
    if (!*a5)
    {
      id v16 = [NSString stringWithFormat:@"missing error %s:%d: unable to evaluate timed metadata sample with multiple, or zero, inputs", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 751];
      *a5 = +[NUError unknownError:v16 object:self];
    }
    a5 = 0;
  }
LABEL_6:

  return a5;
}

- (id)outputTimedMetadataSampleWithIdentifier:(id)a3 atTime:(id *)a4 error:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  id v5 = [(NURenderNode *)self _evaluateTimedMetadataSampleWithIdentifier:a3 atTime:&v7 error:a5];

  return v5;
}

- (id)outputImage:(id *)a3
{
  if ([(NURenderNode *)self isCached])
  {
    id v5 = [(NURenderNode *)self cached_outputImage];
    if (!v5)
    {
      uint64_t v6 = [(NURenderNode *)self _evaluateImage:a3];
      id v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate output image", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 723);
        *a3 = +[NUError unknownError:v7 object:self];
      }
      [(NURenderNode *)self setCached_outputImage:v5];
    }
  }
  else
  {
    id v5 = [(NURenderNode *)self _evaluateImage:a3];
  }

  return v5;
}

- (void)invalidateCachedAudioMix
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NURenderNode *)self setCached_outputAudioMix:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = [(NSDictionary *)self->_inputs allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidateCachedAudioMix];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)shouldInvalidateCachedAudioMix
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSDictionary *)self->_inputs allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldInvalidateCachedAudioMix])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_evaluateAudioMix:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v11 = NUAssertLogger_14509();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v14 = NUAssertLogger_14509();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        id v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        uint64_t v21 = [v19 callStackSymbols];
        uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v18;
        __int16 v31 = 2114;
        long long v32 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      long long v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateAudioMix:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 664, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  if (self->_dominantInputKey)
  {
    -[NSDictionary objectForKey:](self->_inputs, "objectForKey:");
    uint64_t v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [(NSDictionary *)v5 outputAudioMix:a3];
    if (!v6 && !*a3)
    {
      long long v7 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate audio mix", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 671);
      *a3 = +[NUError unknownError:v7 object:v5];
    }
LABEL_11:

    goto LABEL_12;
  }
  memset(v27, 0, sizeof(v27));
  uint64_t v5 = self->_inputs;
  if ([(NSDictionary *)v5 countByEnumeratingWithState:v27 objects:v28 count:16])
  {
    long long v8 = [(NSDictionary *)self->_inputs objectForKey:**((void **)&v27[0] + 1)];
    uint64_t v6 = [v8 outputAudioMix:a3];
    if (!v6 && !*a3)
    {
      long long v9 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate audio mix", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 683, *(void *)&v27[0]);
      *a3 = +[NUError unknownError:v9 object:v8];
    }
    goto LABEL_11;
  }

  +[NUError unsupportedError:@"cannot generate audio mix" object:objc_opt_class()];
  uint64_t v6 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v6;
}

- (id)outputAudioMix:(id *)a3
{
  if ([(NURenderNode *)self isCached])
  {
    uint64_t v5 = [(NURenderNode *)self cached_outputAudioMix];
    if (!v5)
    {
      uint64_t v6 = [(NURenderNode *)self _evaluateAudioMix:a3];
      uint64_t v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        long long v7 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate audio mix", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 651);
        *a3 = +[NUError unknownError:v7 object:self];
      }
      [(NURenderNode *)self setCached_outputAudioMix:v5];
    }
  }
  else
  {
    uint64_t v5 = [(NURenderNode *)self _evaluateAudioMix:a3];
  }

  return v5;
}

- (BOOL)requiresAudioMix
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_inputs;
  uint64_t v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        char v9 = [v8 requiresAudioMix];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)_evaluateVideoComposition:(id *)a3
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v75 = NUAssertLogger_14509();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v76 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      LODWORD(v149.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v76;
      _os_log_error_impl(&dword_1A9892000, v75, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v149, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v78 = NUAssertLogger_14509();
    BOOL v79 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v79)
      {
        v82 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v83 = (void *)MEMORY[0x1E4F29060];
        id v84 = v82;
        v85 = [v83 callStackSymbols];
        v86 = [v85 componentsJoinedByString:@"\n"];
        LODWORD(v149.start.value) = 138543618;
        *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v82;
        LOWORD(v149.start.flags) = 2114;
        *(void *)((char *)&v149.start.flags + 2) = v86;
        _os_log_error_impl(&dword_1A9892000, v78, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v149, 0x16u);
      }
    }
    else if (v79)
    {
      v80 = [MEMORY[0x1E4F29060] callStackSymbols];
      v81 = [v80 componentsJoinedByString:@"\n"];
      LODWORD(v149.start.value) = 138543362;
      *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v81;
      _os_log_error_impl(&dword_1A9892000, v78, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v149, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 497, @"Invalid parameter not satisfying: %s", v87, v88, v89, v90, (uint64_t)"error != nil");
  }
  uint64_t v3 = a3;
  uint64_t v4 = self;
  if (![(NSDictionary *)self->_inputs count])
  {
    char v9 = [NSString stringWithFormat:@"This type of source node (%@) cannot generate an AVVideoComposition", objc_opt_class()];
    id *v3 = +[NUError errorWithCode:9 reason:v9 object:v4];

    id v7 = 0;
    goto LABEL_85;
  }
  if ([(NSDictionary *)v4->_inputs count] == 1)
  {
    memset(v146, 0, sizeof(v146));
    uint64_t v5 = v4->_inputs;
    if ([(NSDictionary *)v5 countByEnumeratingWithState:v146 objects:v156 count:16])
    {
      uint64_t v6 = [(NSDictionary *)v4->_inputs objectForKey:*(void *)v146[1]];
      id v7 = [v6 outputVideoComposition:v3];
      if (!v7 && !*v3)
      {
        long long v8 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate video composition", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 517);
        id *v3 = +[NUError unknownError:v8 object:v6];
      }
      goto LABEL_85;
    }
  }
  double v11 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v12 = (_OWORD *)MEMORY[0x1E4F1FA48];
  CMTimeValue value = *MEMORY[0x1E4F1FA48];
  CMTimeFlags v13 = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA48] + 8);
  CMTimeEpoch v14 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v15 = objc_opt_new();
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id v16 = v4->_inputs;
  uint64_t v106 = [(NSDictionary *)v16 countByEnumeratingWithState:&v142 objects:v153 count:16];
  CMTimeEpoch v102 = v14;
  if (!v106)
  {
    CMTimeEpoch epoch = v14;
    goto LABEL_80;
  }
  uint64_t v108 = *(void *)v143;
  CMTimeEpoch v17 = v14;
  char v18 = 1;
  CMTimeEpoch epoch = v17;
  v101 = v4;
  v104 = v16;
  do
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v143 != v108) {
        objc_enumerationMutation(v16);
      }
      uint64_t v110 = v19;
      v111 = [(NSDictionary *)v4->_inputs objectForKey:*(void *)(*((void *)&v142 + 1) + 8 * v19)];
      id v20 = [v111 outputVideoComposition:v3];
      if (!v20)
      {
        if (*v3)
        {
          uint64_t v21 = 0;
LABEL_77:
          uint64_t v53 = v111;
        }
        else
        {
          v74 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate video composition", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 537);
          uint64_t v53 = v111;
          id *v3 = +[NUError unknownError:v74 object:v111];

          uint64_t v21 = 0;
        }

        id v7 = 0;
        goto LABEL_84;
      }
      uint64_t v21 = v20;
      [v20 frameDuration];
      time1.CMTimeValue value = value;
      time1.CMTimeScale timescale = timescale;
      time1.CMTimeFlags flags = v13;
      time1.CMTimeEpoch epoch = epoch;
      CMTimeMaximum(&v149.start, &time1, &time2);
      CMTimeValue value = v149.start.value;
      CMTimeFlags flags = v149.start.flags;
      CMTimeScale timescale = v149.start.timescale;
      CMTimeEpoch epoch = v149.start.epoch;
      [v21 renderSize];
      double v25 = v23;
      double v26 = v24;
      CMTimeFlags v109 = flags;
      if ((v18 & 1) == 0)
      {
        if (v23 != v11 || v24 != v10)
        {
          id *v3 = +[NUError errorWithCode:5 reason:@"Mixed resolutions not currently supported" object:0];
          goto LABEL_77;
        }
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        uint64_t v27 = [v21 instructions];
        uint64_t v97 = [v27 countByEnumeratingWithState:&v132 objects:v151 count:16];
        if (!v97) {
          goto LABEL_73;
        }
        uint64_t v34 = *(void *)v133;
        uint64_t v93 = *(void *)v133;
LABEL_34:
        uint64_t v35 = 0;
        long long v36 = 0uLL;
        while (1)
        {
          if (*(void *)v133 != v34)
          {
            uint64_t v37 = v35;
            objc_enumerationMutation(v27);
            uint64_t v35 = v37;
            long long v36 = 0uLL;
          }
          uint64_t v100 = v35;
          v112 = *(void **)(*((void *)&v132 + 1) + 8 * v35);
          long long v128 = v36;
          long long v129 = v36;
          long long v130 = v36;
          long long v131 = v36;
          id obj = v15;
          uint64_t v96 = [obj countByEnumeratingWithState:&v128 objects:v150 count:16];
          if (v96) {
            break;
          }
LABEL_69:

          uint64_t v35 = v100 + 1;
          long long v36 = 0uLL;
          uint64_t v34 = v93;
          if (v100 + 1 == v97)
          {
            uint64_t v97 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v132, v151, 16, 0.0);
            if (!v97) {
              goto LABEL_73;
            }
            goto LABEL_34;
          }
        }
        uint64_t v103 = *(void *)v129;
        while (2)
        {
          uint64_t v38 = 0;
LABEL_40:
          if (*(void *)v129 != v103)
          {
            uint64_t v39 = v38;
            objc_enumerationMutation(obj);
            uint64_t v38 = v39;
          }
          uint64_t v95 = v38;
          v40 = *(void **)(*((void *)&v128 + 1) + 8 * v38);
          if ([v40 isEqual:v112]) {
            goto LABEL_69;
          }
          long long v41 = 0uLL;
          memset(&v149, 0, sizeof(v149));
          if (v112)
          {
            [v112 timeRange];
            long long v41 = 0uLL;
            if (v40) {
              goto LABEL_45;
            }
LABEL_47:
            *(_OWORD *)&otherRange.start.CMTimeEpoch epoch = v41;
            *(_OWORD *)&otherRange.duration.CMTimeScale timescale = v41;
            *(_OWORD *)&otherRange.start.CMTimeValue value = v41;
          }
          else
          {
            memset(&range, 0, sizeof(range));
            if (!v40) {
              goto LABEL_47;
            }
LABEL_45:
            objc_msgSend(v40, "timeRange", 0.0);
          }
          CMTimeRangeGetIntersection(&v149, &range, &otherRange);
          if ((v149.start.flags & 1) == 0
            || (v149.duration.flags & 1) == 0
            || v149.duration.epoch
            || v149.duration.value < 0)
          {
            goto LABEL_69;
          }
          BOOL v42 = [v112 requiredSourceTrackIDs];
          v105 = [v40 requiredSourceTrackIDs];
          long long v122 = 0u;
          long long v123 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          id v43 = v42;
          uint64_t v94 = [v43 countByEnumeratingWithState:&v122 objects:v148 count:16];
          if (v94)
          {
            uint64_t v44 = *(void *)v123;
            v98 = v43;
            v99 = v3;
            uint64_t v92 = *(void *)v123;
            do
            {
              uint64_t v45 = 0;
              do
              {
                if (*(void *)v123 != v44) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v46 = *(void **)(*((void *)&v122 + 1) + 8 * v45);
                long long v118 = 0u;
                long long v119 = 0u;
                long long v120 = 0u;
                long long v121 = 0u;
                id v47 = v105;
                uint64_t v48 = [v47 countByEnumeratingWithState:&v118 objects:v147 count:16];
                if (v48)
                {
                  uint64_t v49 = v48;
                  uint64_t v50 = *(void *)v119;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v49; ++i)
                    {
                      if (*(void *)v119 != v50) {
                        objc_enumerationMutation(v47);
                      }
                      if ([v46 isEqual:*(void *)(*((void *)&v118 + 1) + 8 * i)])
                      {
                        id *v99 = +[NUError errorWithCode:5 reason:@"time ranges for tracks cannot overlap" object:v46];

                        id v16 = v104;
                        goto LABEL_77;
                      }
                    }
                    uint64_t v49 = [v47 countByEnumeratingWithState:&v118 objects:v147 count:16];
                    if (v49) {
                      continue;
                    }
                    break;
                  }
                }

                ++v45;
                id v43 = v98;
                uint64_t v3 = v99;
                uint64_t v4 = v101;
                id v16 = v104;
                uint64_t v44 = v92;
              }
              while (v45 != v94);
              uint64_t v94 = [v98 countByEnumeratingWithState:&v122 objects:v148 count:16];
            }
            while (v94);
          }

          uint64_t v38 = v95 + 1;
          if (v95 + 1 == v96)
          {
            uint64_t v96 = [obj countByEnumeratingWithState:&v128 objects:v150 count:16];
            if (v96) {
              continue;
            }
            goto LABEL_69;
          }
          goto LABEL_40;
        }
      }
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      uint64_t v27 = [v21 instructions];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v136 objects:v152 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v137;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v137 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v136 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
              }
              long long v55 = (void *)_NUAssertLogger;
              if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
              {
                long long v56 = NSString;
                long long v57 = v55;
                long long v58 = [v56 stringWithFormat:@"incorrect class of video instruction"];
                LODWORD(v149.start.value) = 138543362;
                *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v58;
                _os_log_error_impl(&dword_1A9892000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v149, 0xCu);

                uint64_t v59 = _NULogOnceToken;
                BOOL v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
                if (v59 != -1) {
                  dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
                }
              }
              else
              {
                BOOL v60 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey) == 0;
              }
              v61 = (id)_NUAssertLogger;
              BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
              if (v60)
              {
                if (v62)
                {
                  __int16 v63 = [MEMORY[0x1E4F29060] callStackSymbols];
                  v64 = [v63 componentsJoinedByString:@"\n"];
                  LODWORD(v149.start.value) = 138543362;
                  *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v64;
                  _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v149, 0xCu);
                }
              }
              else if (v62)
              {
                uint64_t v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
                v66 = (void *)MEMORY[0x1E4F29060];
                id v67 = v65;
                v68 = [v66 callStackSymbols];
                v69 = [v68 componentsJoinedByString:@"\n"];
                LODWORD(v149.start.value) = 138543618;
                *(CMTimeValue *)((char *)&v149.start.value + 4) = (CMTimeValue)v65;
                LOWORD(v149.start.flags) = 2114;
                *(void *)((char *)&v149.start.flags + 2) = v69;
                _os_log_error_impl(&dword_1A9892000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v149, 0x16u);
              }
              _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateVideoComposition:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 556, @"incorrect class of video instruction", v70, v71, v72, v73, v91);
            }
            [v15 addObject:v32];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v136 objects:v152 count:16];
        }
        while (v29);
        double v10 = v26;
        double v11 = v25;
        uint64_t v4 = v101;
        id v16 = v104;
      }
      else
      {
        double v10 = v26;
        double v11 = v25;
      }
LABEL_73:

      char v18 = 0;
      uint64_t v19 = v110 + 1;
      CMTimeFlags v13 = v109;
    }
    while (v110 + 1 != v106);
    uint64_t v52 = [(NSDictionary *)v16 countByEnumeratingWithState:&v142 objects:v153 count:16];
    char v18 = 0;
    long long v12 = (_OWORD *)MEMORY[0x1E4F1FA48];
    uint64_t v106 = v52;
  }
  while (v52);
LABEL_80:

  if ((v13 & 1) != 0
    && (v149.start.CMTimeValue value = value,
        v149.start.CMTimeScale timescale = timescale,
        v149.start.CMTimeFlags flags = v13,
        v149.start.CMTimeEpoch epoch = epoch,
        *(_OWORD *)&time1.CMTimeValue value = *v12,
        time1.CMTimeEpoch epoch = v102,
        CMTimeCompare(&v149.start, &time1) > 0))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F165B0]);
    objc_msgSend(v7, "setRenderSize:", v11, v10);
    CMTimeValue v114 = value;
    CMTimeScale v115 = timescale;
    CMTimeFlags v116 = v13;
    CMTimeEpoch v117 = epoch;
    [v7 setFrameDuration:&v114];
    [v7 setInstructions:v15];
  }
  else
  {
    +[NUError invalidError:@"Invalid frame duration for render node" object:v4];
    id v7 = 0;
    id *v3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_84:

LABEL_85:

  return v7;
}

- (id)outputVideoComposition:(id *)a3
{
  if ([(NURenderNode *)self isCached])
  {
    uint64_t v5 = [(NURenderNode *)self cached_outputVideoComposition];
    if (!v5)
    {
      uint64_t v6 = [(NURenderNode *)self _evaluateVideoComposition:a3];
      uint64_t v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        id v7 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate video composition", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 484);
        *a3 = +[NUError unknownError:v7 object:self];
      }
      [(NURenderNode *)self setCached_outputVideoComposition:v5];
    }
  }
  else
  {
    uint64_t v5 = [(NURenderNode *)self _evaluateVideoComposition:a3];
  }

  return v5;
}

- (BOOL)requiresVideoComposition
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_inputs;
  uint64_t v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        char v9 = [v8 requiresVideoComposition];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)_evaluateVideo:(id *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    double v24 = NUAssertLogger_14509();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      double v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v27 = NUAssertLogger_14509();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        __int16 v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v48 = v31;
        __int16 v49 = 2114;
        uint64_t v50 = v35;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      uint64_t v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v48 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode _evaluateVideo:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 410, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"error != nil");
  }
  if (![(NSDictionary *)self->_inputs count])
  {
    char v9 = @"Cannot generate an AVComposition. no inputs.";
    uint64_t v10 = 9;
LABEL_26:
    +[NUError errorWithCode:v10 reason:v9 object:self];
    id v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if ([(NSDictionary *)self->_inputs count] == 1)
  {
    memset(v44, 0, sizeof(v44));
    uint64_t v5 = self->_inputs;
    if ([(NSDictionary *)v5 countByEnumeratingWithState:v44 objects:v46 count:16])
    {
      uint64_t v6 = [(NSDictionary *)self->_inputs objectForKey:**((void **)&v44[0] + 1)];
      id v7 = [v6 outputVideo:a3];
      if (!v7 && !*a3)
      {
        long long v8 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to get video", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 429);
        *a3 = +[NUError unknownError:v8 object:v6];
      }
      goto LABEL_27;
    }
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  double v11 = self->_inputs;
  uint64_t v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v12)
  {

LABEL_25:
    char v9 = @"[NURenderNode _evaluateVideo] expected outputAsset to be set.";
    uint64_t v10 = 1;
    goto LABEL_26;
  }
  uint64_t v13 = v12;
  id v7 = 0;
  uint64_t v14 = *(void *)v41;
  while (2)
  {
    uint64_t v15 = 0;
    id v16 = v7;
    do
    {
      if (*(void *)v41 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * v15);
      char v18 = [(NSDictionary *)self->_inputs objectForKey:v17];
      uint64_t v19 = [v18 outputVideo:a3];
      if (!v19)
      {
        id v21 = +[NUError errorWithCode:1 reason:@"Cannot get AV composition for input node" object:v18 underlyingError:*a3];
        *a3 = v21;
        if (!v21)
        {
          uint64_t v22 = [NSString stringWithFormat:@"missing error %s:%d: unable to get video from %@", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 445, v17];
          *a3 = +[NUError unknownError:v22 object:v18];
        }
        id v7 = 0;
        goto LABEL_27;
      }
      id v20 = v19;
      id v7 = (void *)[v19 copy];

      ++v15;
      id v16 = v7;
    }
    while (v13 != v15);
    uint64_t v13 = [(NSDictionary *)v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v13) {
      continue;
    }
    break;
  }

  if (!v7) {
    goto LABEL_25;
  }
LABEL_27:

  return v7;
}

- (id)outputVideo:(id *)a3
{
  if ([(NURenderNode *)self isCached])
  {
    uint64_t v5 = [(NURenderNode *)self cached_outputVideo];
    if (!v5)
    {
      uint64_t v6 = [(NURenderNode *)self _evaluateVideo:a3];
      uint64_t v5 = (void *)v6;
      if (a3 && !v6 && !*a3)
      {
        id v7 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to get video", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 397);
        *a3 = +[NUError unknownError:v7 object:self];
      }
      [(NURenderNode *)self setCached_outputVideo:v5];
    }
  }
  else
  {
    uint64_t v5 = [(NURenderNode *)self _evaluateVideo:a3];
  }

  return v5;
}

- (id)evaluateRenderDependenciesWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(NURenderNode *)self evaluatedForMode])
  {
    uint64_t v19 = NUAssertLogger_14509();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [NSString stringWithFormat:@"Node hasn't been evaluated for render"];
      *(_DWORD *)buf = 138543362;
      long long v42 = v20;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v22 = NUAssertLogger_14509();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v23)
      {
        double v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        id v28 = v26;
        uint64_t v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v42 = v26;
        __int16 v43 = 2114;
        uint64_t v44 = v30;
        _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v23)
    {
      double v24 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v25 = [v24 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v42 = v25;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode evaluateRenderDependenciesWithRequest:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 367, @"Node hasn't been evaluated for render", v31, v32, v33, v34, v35);
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v8 = self->_inputs;
  uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [(NURenderNode *)self inputForKey:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        uint64_t v14 = [v13 evaluateRenderDependenciesWithRequest:v6 error:a4];
        if (!v14)
        {
          if (a4 && !*a4)
          {
            uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: unable to evaluate dependencies", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 377, (void)v36);
            *a4 = +[NUError unknownError:v17 object:v13];
          }
          id v16 = 0;
          goto LABEL_15;
        }
        uint64_t v15 = (void *)v14;
        [v7 addEntriesFromDictionary:v14];
      }
      uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v16 = v7;
LABEL_15:

  return v16;
}

- (void)setEvaluatedForMode:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(NURenderNode *)v4 _evaluatedForMode];
  if (a3)
  {
    unint64_t v6 = v5;
    if (v5 != a3)
    {
      if (v5)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
        }
        id v7 = (id)_NUAssertLogger;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          long long v8 = NSString;
          if (v6 > 3) {
            uint64_t v9 = @"Prepare";
          }
          else {
            uint64_t v9 = off_1E5D93E68[v6 - 1];
          }
          uint64_t v10 = v9;
          if ((unint64_t)(a3 - 1) > 2) {
            uint64_t v11 = @"Prepare";
          }
          else {
            uint64_t v11 = off_1E5D93E68[a3 - 1];
          }
          uint64_t v12 = v11;
          uint64_t v13 = [v8 stringWithFormat:@"Node is already evaluated for %@ -> %@\n%@", v10, v12, v4];
          *(_DWORD *)buf = 138543362;
          uint64_t v29 = v13;
          _os_log_impl(&dword_1A9892000, v7, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);
        }
        if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
          }
          uint64_t v14 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
            id v16 = [MEMORY[0x1E4F29060] callStackSymbols];
            uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            uint64_t v29 = v15;
            __int16 v30 = 2114;
            uint64_t v31 = v17;
            _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
          }
          uint64_t v14 = (id)_NUAssertLogger;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            double v25 = [MEMORY[0x1E4F29060] callStackSymbols];
            double v26 = [v25 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543362;
            uint64_t v29 = v26;
            _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
        }

        if (v6 > 3) {
          char v18 = @"Prepare";
        }
        else {
          char v18 = off_1E5D93E68[v6 - 1];
        }
        uint64_t v19 = v18;
        if ((unint64_t)(a3 - 1) > 2) {
          id v20 = @"Prepare";
        }
        else {
          id v20 = off_1E5D93E68[a3 - 1];
        }
        uint64_t v27 = v20;
        _NUAssertContinueHandler((uint64_t)"-[NURenderNode setEvaluatedForMode:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 357, @"Node is already evaluated for %@ -> %@\n%@", v21, v22, v23, v24, (uint64_t)v19);
      }
      [(NURenderNode *)v4 set_evaluatedForMode:a3];
    }
  }
  objc_sync_exit(v4);
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)objc_opt_class());
  uint64_t v11 = [v9 copy];

  uint64_t v12 = (void *)*((void *)v10 + 3);
  *((void *)v10 + 3) = v11;

  uint64_t v13 = [v8 copy];
  uint64_t v14 = (void *)*((void *)v10 + 4);
  *((void *)v10 + 4) = v13;

  objc_storeStrong((id *)v10 + 16, self->_dominantInputKey);
  uint64_t v15 = [v10 _generateSpaceMapKey];
  id v16 = (void *)*((void *)v10 + 17);
  *((void *)v10 + 17) = v15;

  *((void *)v10 + 18) = *(void *)&self->_nodeCreationTime;
  objc_storeStrong((id *)v10 + 19, self->_nodeCreationJobName);
  *((void *)v10 + 20) = self->_cacheHitsCount;

  return v10;
}

- (id)placeholderNodeWithCachedInputs:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
          if (![v11 isPlaceholderNode]
            || ([v11 inputs],
                uint64_t v12 = objc_claimAutoreleasedReturnValue(),
                uint64_t v13 = [v12 count],
                v12,
                v13))
          {
            uint64_t v14 = [v11 spaceMapKey];
            [v4 setObject:v11 forKeyedSubscript:v14];

            id v15 = v11;
            id v8 = v15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }

    if ([v4 count] == 1) {
      char v18 = v8;
    }
    else {
      char v18 = [[NUPlaceholderNode alloc] initWithInputs:v4];
    }
    uint64_t v17 = v18;
  }
  else
  {
    id v16 = [NUPlaceholderNode alloc];
    uint64_t v17 = [(NUPlaceholderNode *)v16 initWithInputs:MEMORY[0x1E4F1CC08]];
  }

  return v17;
}

- (id)evaluateSettings:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a3, "nu_evaluateWithPipelineState:error:", a4, a5);
}

- (id)resolvedNodeWithCachedInputs:(id)a3 cache:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![(NURenderNode *)self shouldCacheNodeForPipelineState:v12])
  {
    id v15 = [(NURenderNode *)self placeholderNodeWithCachedInputs:v10];
    goto LABEL_6;
  }
  uint64_t v13 = [(NURenderNode *)self evaluateSettings:self->_settings pipelineState:v12 error:a6];
  if (!v13)
  {
    if (!a6 || *a6) {
      goto LABEL_14;
    }
    uint64_t v17 = NSString;
    uint64_t v18 = 262;
    goto LABEL_13;
  }
  uint64_t v14 = [(NURenderNode *)self resolvedNodeWithCachedInputs:v10 settings:v13 pipelineState:v12 error:a6];
  if (v14)
  {
    id v15 = (void *)v14;

LABEL_6:
    id v16 = +[NURenderNode nodeFromCache:v15 cache:v11];

    objc_msgSend(v16, "setEvaluatedForMode:", objc_msgSend(v12, "evaluationMode"));
    goto LABEL_15;
  }
  if (a6 && !*a6)
  {
    uint64_t v17 = NSString;
    uint64_t v18 = 271;
LABEL_13:
    uint64_t v19 = objc_msgSend(v17, "stringWithFormat:", @"missing error %s:%d: failed to evaluate settings", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", v18);
    *a6 = +[NUError unknownError:v19 object:self];
  }
LABEL_14:

  id v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
  }
  uint64_t v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSString;
    uint64_t v6 = v4;
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v12 = (void *)MEMORY[0x1E4F29060];
    uint64_t v13 = v11;
    uint64_t v14 = [v12 callStackSymbols];
    id v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  id v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  uint64_t v13 = v16;
  long long v20 = [v18 callStackSymbols];
  long long v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v29 = specific;
  __int16 v30 = 2114;
  uint64_t v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  long long v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  _NUAssertFailHandler((uint64_t)"-[NURenderNode shouldCacheNodeForPipelineState:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 252, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v24, v25, v26, v27, v23);
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v26 = a4;
  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = [(NURenderNode *)self inputs];
  id v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = self->_inputs;
  uint64_t v12 = [(NSDictionary *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v17 = [(NSDictionary *)self->_inputs objectForKey:v16];
        id v18 = v8;
        uint64_t v19 = [v17 nodeByReplayingAgainstCache:v8 pipelineState:v26 error:a5];
        if (!v19)
        {
          if (a5 && !*a5)
          {
            uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: failed to replay against cache", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 241);
            *a5 = +[NUError unknownError:v23 object:v17];
          }
          long long v22 = 0;
          long long v21 = v26;
          goto LABEL_14;
        }
        long long v20 = (void *)v19;
        [v11 setObject:v19 forKeyedSubscript:v16];

        id v8 = v18;
      }
      uint64_t v13 = [(NSDictionary *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v21 = v26;
  long long v22 = [(NURenderNode *)self resolvedNodeWithCachedInputs:v11 cache:v8 pipelineState:v26 error:a5];
LABEL_14:

  return v22;
}

- (id)nodeByReplayingAgainstCache:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v13 = NUAssertLogger_14509();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "state != nil");
      *(_DWORD *)buf = 138543362;
      long long v30 = v14;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v16 = NUAssertLogger_14509();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        long long v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v21 = (void *)MEMORY[0x1E4F29060];
        id v22 = v20;
        uint64_t v23 = [v21 callStackSymbols];
        uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v30 = v20;
        __int16 v31 = 2114;
        uint64_t v32 = v24;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v30 = v19;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode nodeByReplayingAgainstCache:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 224, @"Invalid parameter not satisfying: %s", v25, v26, v27, v28, (uint64_t)"state != nil");
  }
  uint64_t v7 = v6;
  id v8 = +[NURenderNodeCache sharedInstance];
  uint64_t v9 = [(NURenderNode *)self nodeByReplayingAgainstCache:v8 pipelineState:v7 error:a4];
  uint64_t v10 = (void *)v9;
  if (a4 && !v9 && !*a4)
  {
    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"missing error %s:%d: failed to replay against cache", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 228);
    *a4 = +[NUError unknownError:v11 object:self];
  }

  return v10;
}

- (void)resetInput:(id)a3 forKey:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v6 = a4;
  if (!v60)
  {
    id v11 = NUAssertLogger_14509();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "input != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v62 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_14509();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        uint64_t v32 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        uint64_t v35 = [v33 callStackSymbols];
        long long v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v62 = v32;
        __int16 v63 = 2114;
        v64 = v36;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v62 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode resetInput:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 195, @"Invalid parameter not satisfying: %s", v37, v38, v39, v40, (uint64_t)"input != nil");
  }
  if (!v6)
  {
    id v18 = NUAssertLogger_14509();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "key != nil");
      *(_DWORD *)buf = 138543362;
      BOOL v62 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v20 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v21 = NUAssertLogger_14509();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v22)
      {
        long long v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        long long v42 = (void *)MEMORY[0x1E4F29060];
        id v43 = v41;
        uint64_t v44 = [v42 callStackSymbols];
        uint64_t v45 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v62 = v41;
        __int16 v63 = 2114;
        v64 = v45;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v62 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode resetInput:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 196, @"Invalid parameter not satisfying: %s", v46, v47, v48, v49, (uint64_t)"key != nil");
  }
  if ([(NURenderNode *)self isCached])
  {
    uint64_t v25 = NUAssertLogger_14509();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [NSString stringWithFormat:@"Cannot mutate a cached node!"];
      *(_DWORD *)buf = 138543362;
      BOOL v62 = v26;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v28 = NUAssertLogger_14509();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29)
      {
        uint64_t v50 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v51 = (void *)MEMORY[0x1E4F29060];
        id v52 = v50;
        uint64_t v53 = [v51 callStackSymbols];
        uint64_t v54 = [v53 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v62 = v50;
        __int16 v63 = 2114;
        v64 = v54;
        _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v29)
    {
      long long v30 = [MEMORY[0x1E4F29060] callStackSymbols];
      __int16 v31 = [v30 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v62 = v31;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode resetInput:forKey:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 197, @"Cannot mutate a cached node!", v55, v56, v57, v58, v59);
  }
  id v7 = [(NSDictionary *)self->_inputs objectForKeyedSubscript:v6];

  if (v7 != v60)
  {
    id v8 = (void *)[(NSDictionary *)self->_inputs mutableCopy];
    [v8 setObject:v60 forKeyedSubscript:v6];
    uint64_t v9 = (NSDictionary *)[v8 copy];
    inputs = self->_inputs;
    self->_inputs = v9;

    self->_hashValue = 0;
  }
}

- (BOOL)hasCyclicalDependencyForInput:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToRenderNode:self])
  {
    BOOL v5 = 1;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = objc_msgSend(v4, "inputs", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [v4 inputForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          BOOL v12 = [(NURenderNode *)self hasCyclicalDependencyForInput:v11];

          if (v12)
          {
            BOOL v5 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 0;
LABEL_13:
  }
  return v5;
}

- (id)inputForKey:(id)a3
{
  return [(NSDictionary *)self->_inputs objectForKey:a3];
}

- (id)_generateSpaceMapKey
{
  return (id)[NSString stringWithFormat:@"%@:%p", objc_opt_class(), self];
}

- (BOOL)isPlaceholderNode
{
  return 0;
}

- (NURenderNode)initWithSettings:(id)a3 inputs:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    __int16 v31 = NUAssertLogger_14509();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settings != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v34 = NUAssertLogger_14509();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        uint64_t v45 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v46 = (void *)MEMORY[0x1E4F29060];
        id v47 = v45;
        uint64_t v48 = [v46 callStackSymbols];
        uint64_t v49 = [v48 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v65 = v45;
        __int16 v66 = 2114;
        id v67 = v49;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      long long v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 95, @"Invalid parameter not satisfying: %s", v50, v51, v52, v53, (uint64_t)"settings != nil");
  }
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v38 = NUAssertLogger_14509();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputs != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v39;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v41 = NUAssertLogger_14509();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (v42)
      {
        uint64_t v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v55 = (void *)MEMORY[0x1E4F29060];
        id v56 = v54;
        uint64_t v57 = [v55 callStackSymbols];
        uint64_t v58 = [v57 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v65 = v54;
        __int16 v66 = 2114;
        id v67 = v58;
        _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v42)
    {
      id v43 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v65 = v44;
      _os_log_error_impl(&dword_1A9892000, v41, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderNode initWithSettings:inputs:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 96, @"Invalid parameter not satisfying: %s", v59, v60, v61, v62, (uint64_t)"inputs != nil");
  }
  v63.receiver = self;
  v63.super_class = (Class)NURenderNode;
  uint64_t v9 = [(NURenderNode *)&v63 init];
  v9->_nodeCreationTime = NUAbsoluteTime();
  uint64_t v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 copy];
    nodeCreationJobName = v9->_nodeCreationJobName;
    v9->_nodeCreationJobName = (NSString *)v12;
  }
  else
  {
    nodeCreationJobName = v9->_nodeCreationJobName;
    v9->_nodeCreationJobName = (NSString *)@"N/A";
  }

  uint64_t v14 = [v8 copy];
  inputs = v9->_inputs;
  v9->_inputs = (NSDictionary *)v14;

  v9->_isGeometryNode = 0;
  v9->_hashValue = 0;
  uint64_t v16 = [v6 objectForKey:@"__dominantInputSettingsKey"];
  dominantInputKey = v9->_dominantInputKey;
  v9->_dominantInputKey = (NSString *)v16;

  if (v9->_dominantInputKey)
  {
    id v18 = (NSString *)[v6 mutableCopy];
    [(NSString *)v18 removeObjectForKey:@"__dominantInputSettingsKey"];
    uint64_t v19 = [(NSString *)v18 copy];
    settings = v9->_settings;
    v9->_settings = (NSDictionary *)v19;

    long long v21 = [v8 objectForKeyedSubscript:v9->_dominantInputKey];

    if (!v21)
    {
      BOOL v22 = v9->_dominantInputKey;
      v9->_dominantInputKey = 0;
    }
    goto LABEL_11;
  }
  uint64_t v23 = [v6 copy];
  uint64_t v24 = v9->_settings;
  v9->_settings = (NSDictionary *)v23;

  uint64_t v25 = (void *)*MEMORY[0x1E4F1E480];
  uint64_t v26 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1E480]];

  if (v26)
  {
    uint64_t v27 = v25;
    id v18 = v9->_dominantInputKey;
    v9->_dominantInputKey = v27;
LABEL_11:
  }
  uint64_t v28 = [(NURenderNode *)v9 _generateSpaceMapKey];
  spaceMapKey = v9->_spaceMapKey;
  v9->_spaceMapKey = (NSString *)v28;

  return v9;
}

- (NURenderNode)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v3 = NSString;
    id v4 = v2;
    BOOL v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_14526);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F29060];
    id v11 = v9;
    uint64_t v12 = [v10 callStackSymbols];
    uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  id v11 = v14;
  id v18 = [v16 callStackSymbols];
  uint64_t v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  uint64_t v27 = specific;
  __int16 v28 = 2114;
  BOOL v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  long long v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NURenderNode init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 89, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

+ (id)nodeFromCache:(id)a3 cache:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    uint64_t v10 = NUAssertLogger_14509();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "node != nil");
      *(_DWORD *)buf = 138543362;
      id v43 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v13 = NUAssertLogger_14509();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v25 = (void *)MEMORY[0x1E4F29060];
        id v26 = v24;
        uint64_t v27 = [v25 callStackSymbols];
        __int16 v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v43 = v24;
        __int16 v44 = 2114;
        uint64_t v45 = v28;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      long long v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v43 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderNode nodeFromCache:cache:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 214, @"Invalid parameter not satisfying: %s", v29, v30, v31, v32, (uint64_t)"node != nil");
  }
  id v7 = v6;
  if (!v6)
  {
    id v17 = NUAssertLogger_14509();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "cache != nil");
      *(_DWORD *)buf = 138543362;
      id v43 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    long long v20 = NUAssertLogger_14509();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        uint64_t v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v34 = (void *)MEMORY[0x1E4F29060];
        id v35 = v33;
        long long v36 = [v34 callStackSymbols];
        uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v43 = v33;
        __int16 v44 = 2114;
        uint64_t v45 = v37;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v43 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderNode nodeFromCache:cache:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 215, @"Invalid parameter not satisfying: %s", v38, v39, v40, v41, (uint64_t)"cache != nil");
  }
  uint64_t v8 = [v6 retrieveAndCacheNode:v5];
  [v8 setCached:1];

  return v8;
}

+ (id)nodeFromCache:(id)a3
{
  id v3 = a3;
  id v4 = +[NURenderNodeCache sharedInstance];
  id v5 = +[NURenderNode nodeFromCache:v3 cache:v4];

  return v5;
}

- (id)resamplingColorSpace
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (+[NUGlobalSettings resampleInSourceColorSpace])
  {
    id v10 = 0;
    id v3 = [(NURenderNode *)self imageProperties:&v10];
    id v4 = v10;
    if (v3)
    {
      id v5 = [v3 colorSpace];
      if ([v5 hasCICP]) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
      id v7 = v6;
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_423_14747);
      }
      uint64_t v8 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v4;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Failed to load image properties for rescaling, error: %@", buf, 0xCu);
      }
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)resampleImage:(id)a3 by:(id)a4 sampleMode:(int64_t)a5 extent:(id *)a6 colorSpace:(id)a7
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  if (!v12)
  {
    id v35 = NUAssertLogger_14509();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      long long v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "inputImage != nil");
      *(_DWORD *)buf = 138543362;
      long long v119 = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v38 = NUAssertLogger_14509();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v39)
      {
        id v56 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v57 = (void *)MEMORY[0x1E4F29060];
        id v58 = v56;
        uint64_t v59 = [v57 callStackSymbols];
        uint64_t v60 = [v59 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v119 = v56;
        __int16 v120 = 2114;
        long long v121 = v60;
        _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      uint64_t v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v119 = v41;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderNode(Resampling) resampleImage:by:sampleMode:extent:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1394, @"Invalid parameter not satisfying: %s", v61, v62, v63, v64, (uint64_t)"inputImage != nil");
  }
  if (var0 < 1 || var1 <= 0)
  {
    BOOL v42 = NUAssertLogger_14509();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v43 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUScaleIsValid(scale)");
      *(_DWORD *)buf = 138543362;
      long long v119 = v43;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v45 = NUAssertLogger_14509();
    BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
    if (v44)
    {
      if (v46)
      {
        uint64_t v65 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v66 = (void *)MEMORY[0x1E4F29060];
        id v67 = v65;
        uint64_t v68 = [v66 callStackSymbols];
        v69 = [v68 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v119 = v65;
        __int16 v120 = 2114;
        long long v121 = v69;
        _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v46)
    {
      id v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v48 = [v47 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v119 = v48;
      _os_log_error_impl(&dword_1A9892000, v45, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderNode(Resampling) resampleImage:by:sampleMode:extent:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1395, @"Invalid parameter not satisfying: %s", v70, v71, v72, v73, (uint64_t)"NUScaleIsValid(scale)");
  }
  if (!a6->var1.var0 || !a6->var1.var1)
  {
    uint64_t v49 = NUAssertLogger_14509();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "NUPixelRectIsEmpty(extent) == NO");
      *(_DWORD *)buf = 138543362;
      long long v119 = v50;
      _os_log_error_impl(&dword_1A9892000, v49, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v52 = NUAssertLogger_14509();
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
    if (v51)
    {
      if (v53)
      {
        v74 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v75 = (void *)MEMORY[0x1E4F29060];
        id v76 = v74;
        v77 = [v75 callStackSymbols];
        v78 = [v77 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v119 = v74;
        __int16 v120 = 2114;
        long long v121 = v78;
        _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v53)
    {
      uint64_t v54 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v55 = [v54 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v119 = v55;
      _os_log_error_impl(&dword_1A9892000, v52, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderNode(Resampling) resampleImage:by:sampleMode:extent:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1396, @"Invalid parameter not satisfying: %s", v79, v80, v81, v82, (uint64_t)"NUPixelRectIsEmpty(extent) == NO");
  }
  BOOL v14 = v13;
  if (v13)
  {
    long long v15 = objc_msgSend(v12, "imageByColorMatchingWorkingSpaceToColorSpace:", objc_msgSend(v13, "CGColorSpace"));
    uint64_t v16 = v15;
    BOOL v17 = v15 != 0;
    if (v15)
    {
      id v18 = v15;

      id v12 = v18;
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_423_14747);
      }
      uint64_t v19 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        long long v119 = v14;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Failed to color match input image to color space: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v17 = 0;
  }
  long long v20 = [v12 imageByClampingToExtent];
  double v21 = NUScaleToDouble(var0, var1);
  uint64_t v22 = *(void *)&v21;
  if (a5 == 1)
  {
    uint64_t v28 = [v20 _imageBySamplingNearest];

    long long v20 = (void *)v28;
    goto LABEL_21;
  }
  if (a5 != 3)
  {
LABEL_21:
    CGAffineTransformMakeScale(&v115, *(CGFloat *)&v22, *(CGFloat *)&v22);
    uint64_t v27 = [v20 imageByApplyingTransform:&v115 highQualityDownsample:1];
    goto LABEL_22;
  }
  v116[0] = *MEMORY[0x1E4F1E480];
  v116[1] = @"inputScale";
  v117[0] = v20;
  uint64_t v23 = [NSNumber numberWithDouble:v21];
  v117[1] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:2];

  uint64_t v25 = [MEMORY[0x1E4F1E040] filterWithName:@"CILanczosScaleTransform" withInputParameters:v24];
  if (!v25)
  {
    v83 = NUAssertLogger_14509();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      id v84 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to resolve CILanczosScaleTransform scale %f", v22);
      *(_DWORD *)buf = 138543362;
      long long v119 = v84;
      _os_log_error_impl(&dword_1A9892000, v83, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v85 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v86 = NUAssertLogger_14509();
    BOOL v87 = os_log_type_enabled(v86, OS_LOG_TYPE_ERROR);
    if (v85)
    {
      if (v87)
      {
        uint64_t v97 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v98 = (void *)MEMORY[0x1E4F29060];
        id v99 = v97;
        uint64_t v100 = [v98 callStackSymbols];
        v101 = [v100 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v119 = v97;
        __int16 v120 = 2114;
        long long v121 = v101;
        _os_log_error_impl(&dword_1A9892000, v86, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v87)
    {
      uint64_t v88 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v89 = [v88 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v119 = v89;
      _os_log_error_impl(&dword_1A9892000, v86, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderNode(Resampling) resampleImage:by:sampleMode:extent:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1419, @"Unable to resolve CILanczosScaleTransform scale %f", v102, v103, v104, v105, v22);
  }
  id v26 = v25;
  uint64_t v27 = [v25 outputImage];

  if (!v27)
  {
    uint64_t v90 = NUAssertLogger_14509();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      uint64_t v91 = [NSString stringWithFormat:@"Unable to apply scale with CILanczosScaleTransform: %@", v26];
      *(_DWORD *)buf = 138543362;
      long long v119 = v91;
      _os_log_error_impl(&dword_1A9892000, v90, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v92 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v93 = NUAssertLogger_14509();
    BOOL v94 = os_log_type_enabled(v93, OS_LOG_TYPE_ERROR);
    if (v92)
    {
      if (v94)
      {
        uint64_t v106 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v107 = (void *)MEMORY[0x1E4F29060];
        id v108 = v106;
        CMTimeFlags v109 = [v107 callStackSymbols];
        uint64_t v110 = [v109 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        long long v119 = v106;
        __int16 v120 = 2114;
        long long v121 = v110;
        _os_log_error_impl(&dword_1A9892000, v93, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v94)
    {
      uint64_t v95 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v96 = [v95 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      long long v119 = v96;
      _os_log_error_impl(&dword_1A9892000, v93, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderNode(Resampling) resampleImage:by:sampleMode:extent:colorSpace:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderNode.m", 1422, @"Unable to apply scale with CILanczosScaleTransform: %@", v111, v112, v113, v114, (uint64_t)v26);
  }

  long long v20 = (void *)v24;
LABEL_22:

  if (v17)
  {
    uint64_t v29 = objc_msgSend(v27, "imageByColorMatchingColorSpaceToWorkingSpace:", objc_msgSend(v14, "CGColorSpace"));
    uint64_t v30 = v29;
    if (v29)
    {
      id v31 = v29;

      uint64_t v27 = v31;
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_423_14747);
      }
      uint64_t v32 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        long long v119 = v14;
        _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Failed to color match output image to color space: %{public}@", buf, 0xCu);
      }
    }
  }
  uint64_t v33 = objc_msgSend(v27, "imageByCroppingToRect:", (double)a6->var0.var0, (double)a6->var0.var1, (double)a6->var1.var0, (double)a6->var1.var1);

  return v33;
}

@end