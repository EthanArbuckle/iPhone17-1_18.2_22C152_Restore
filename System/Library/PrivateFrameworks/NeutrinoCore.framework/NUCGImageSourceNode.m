@interface NUCGImageSourceNode
- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (BOOL)_load:(id *)a3;
- (BOOL)_loadSemanticStylesProperties:(id *)a3;
- (BOOL)_setAuxiliaryImagePropertiesFromCGProperties:(id)a3 error:(id *)a4;
- (BOOL)_setGeometryFromProperties:(id)a3 error:(id *)a4;
- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3;
- (BOOL)load:(id *)a3;
- (BOOL)loaded;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4;
- (BOOL)useEmbeddedPreview;
- (CGImageSource)cgImageSource;
- (CMPhotoDecompressionContainer)decompressionContainer;
- (CMPhotoDecompressionSession)decompressionSession;
- (NSDictionary)auxiliaryImagesProperties;
- (NSDictionary)cgImageProperties;
- (NSString)UTI;
- (NSURL)URL;
- (NUCGImageSourceNode)initWithImageSource:(CGImageSource *)a3 identifier:(id)a4;
- (NUCGImageSourceNode)initWithSettings:(id)a3;
- (NUCGImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 identifier:(id)a5;
- (NUCGImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 identifier:(id)a5 options:(id)a6;
- (NUCGImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 settings:(id)a5;
- (NUColorSpace)colorSpace;
- (NUSemanticStyleProperties)semanticStylesProperties;
- (float)contentHeadroom;
- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4;
- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5;
- (id)_evaluateRawImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4;
- (id)_finalizeSourceOptions:(id)a3 subsampleFactor:(int64_t)a4;
- (id)auxiliaryImagePropertiesForAuxImageType:(int64_t)a3;
- (id)debugQuickLookObject;
- (id)loadEmbeddedThumbnailDataFromImageSource:(CGImageSource *)a3 options:(id)a4;
- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7;
- (id)resolvedAuxiliaryImageNodeForPipelineState:(id)a3 error:(id *)a4;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)alphaInfo;
- (int64_t)componentInfo;
- (int64_t)normalizeSubsampleFactor:(int64_t)a3;
- (int64_t)orientation;
- (int64_t)sourceOrientation;
- (void)_addDefaultFinalizedSourceOptions:(id)a3;
- (void)_init;
- (void)dealloc;
- (void)setAlphaInfo:(int64_t)a3;
- (void)setAuxiliaryImagesProperties:(id)a3;
- (void)setCgImageProperties:(id)a3;
- (void)setCgImageSource:(CGImageSource *)a3;
- (void)setColorSpace:(id)a3;
- (void)setComponentInfo:(int64_t)a3;
- (void)setContentHeadroom:(float)a3;
- (void)setDecompressionContainer:(CMPhotoDecompressionContainer *)a3;
- (void)setDecompressionSession:(CMPhotoDecompressionSession *)a3;
- (void)setLoaded:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setSemanticStylesProperties:(id)a3;
- (void)setSize:(id)a3;
@end

@implementation NUCGImageSourceNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImagesProperties, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_semanticStylesProperties, 0);
  objc_storeStrong((id *)&self->_cgImageProperties, 0);
  objc_storeStrong((id *)&self->_UTI, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setAuxiliaryImagesProperties:(id)a3
{
}

- (NSDictionary)auxiliaryImagesProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setComponentInfo:(int64_t)a3
{
  self->_componentInfo = a3;
}

- (int64_t)componentInfo
{
  return self->_componentInfo;
}

- (void)setAlphaInfo:(int64_t)a3
{
  self->_alphaInfo = a3;
}

- (int64_t)alphaInfo
{
  return self->_alphaInfo;
}

- (void)setContentHeadroom:(float)a3
{
  self->_contentHeadroom = a3;
}

- (float)contentHeadroom
{
  return self->_contentHeadroom;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setSemanticStylesProperties:(id)a3
{
}

- (NUSemanticStyleProperties)semanticStylesProperties
{
  return self->_semanticStylesProperties;
}

- (void)setCgImageProperties:(id)a3
{
}

- (NSDictionary)cgImageProperties
{
  return self->_cgImageProperties;
}

- (void)setCgImageSource:(CGImageSource *)a3
{
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (NSString)UTI
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDecompressionContainer:(CMPhotoDecompressionContainer *)a3
{
  self->_decompressionContainer = a3;
}

- (CMPhotoDecompressionContainer)decompressionContainer
{
  return self->_decompressionContainer;
}

- (void)setDecompressionSession:(CMPhotoDecompressionSession *)a3
{
  self->_decompressionSession = a3;
}

- (CMPhotoDecompressionSession)decompressionSession
{
  return self->_decompressionSession;
}

- (id)_evaluateImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(NUCGImageSourceNode *)self load:a4])
  {
    v8 = 0;
    goto LABEL_43;
  }
  v7 = [(NUCGImageSourceNode *)self _evaluateRawImagePropertiesWithSourceOptions:v6 error:a4];
  if (v7)
  {
    v8 = objc_alloc_init(_NUImageProperties);
    [(_NUImageProperties *)v8 setUrl:self->_URL];
    [(_NUImageProperties *)v8 setMetadata:v7];
    v9 = [(NUCGImageSourceNode *)self colorSpace];
    [(_NUImageProperties *)v8 setColorSpace:v9];

    [(NUCGImageSourceNode *)self contentHeadroom];
    -[_NUImageProperties setContentHeadroom:](v8, "setContentHeadroom:");
    uint64_t v10 = [(NUCGImageSourceNode *)self pixelSizeWithSourceOptions:v6];
    -[_NUImageProperties setSize:](v8, "setSize:", v10, v11);
    [(_NUImageProperties *)v8 setOrientation:[(NUCGImageSourceNode *)self sourceOrientation]];
    v12 = [(NUCGImageSourceNode *)self UTI];
    [(_NUImageProperties *)v8 setFileUTI:v12];

    [(_NUImageProperties *)v8 setAlphaInfo:[(NUCGImageSourceNode *)self alphaInfo]];
    [(_NUImageProperties *)v8 setComponentInfo:[(NUCGImageSourceNode *)self componentInfo]];
    v13 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
    v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F2F3B8]];

    if (v14) {
      [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v14 forType:2];
    }
    v15 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
    v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F2F3D0]];

    if (v16) {
      [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v16 forType:3];
    }
    v17 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
    v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F2F3E8]];

    if (v18) {
      [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v18 forType:4];
    }
    v19 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
    v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F2F3F8]];

    if (v20) {
      [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v20 forType:6];
    }
    v21 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
    v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F2F3E0]];

    if (v22) {
      [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v22 forType:5];
    }
    v23 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
    v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F2F3D8]];

    if (v24) {
      [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v24 forType:8];
    }
    v25 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
    v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F2F3F0]];

    if (v26) {
      [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v26 forType:9];
    }
    v27 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
    v28 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F2F3C8]];

    if (v28)
    {
      BOOL v29 = +[NUGlobalSettings enableFlexRange];

      if (v29)
      {
        [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v28 forType:7];
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
        }
        v30 = (void *)_NURenderLogger;
        if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEBUG))
        {
          v45 = v30;
          *(_DWORD *)buf = 138412290;
          uint64_t v48 = [v28 auxiliaryDataInfoMetadata];
          _os_log_debug_impl(&dword_1A9892000, v45, OS_LOG_TYPE_DEBUG, "FlexRange metadata: %@", buf, 0xCu);
        }
        v31 = +[_NUFlexRangeProperties flexRangePropertiesWithGainMapMetadata:](_NUFlexRangeProperties, "flexRangePropertiesWithGainMapMetadata:", [v28 auxiliaryDataInfoMetadata]);
        v32 = [v28 colorSpace];
        [v31 setAlternateColorSpace:v32];

        double v46 = 0.0;
        v33 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
        v34 = [v33 objectForKeyedSubscript:*MEMORY[0x1E4F2F3C0]];

        if ([v34 auxiliaryDataInfoMetadata]
          && +[_NUImageProperties getGainMapHeadroom:fromMetadata:](_NUImageProperties, "getGainMapHeadroom:fromMetadata:", &v46, [v34 auxiliaryDataInfoMetadata]))
        {
          v35 = [NSNumber numberWithDouble:v46];
          [v31 setCompatibilityGainMapHeadroom:v35];
        }
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
        }
        v36 = _NURenderLogger;
        if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v48 = (uint64_t)v31;
          _os_log_debug_impl(&dword_1A9892000, v36, OS_LOG_TYPE_DEBUG, "FlexRange properties: %@", buf, 0xCu);
        }
        [(_NUImageProperties *)v8 setFlexRangeProperties:v31];

        goto LABEL_36;
      }
    }
    else
    {
    }
    v37 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
    uint64_t v38 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4F2F3C0]];

    if (!v38)
    {
LABEL_37:
      v39 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      v40 = [v39 objectForKeyedSubscript:@"tag:apple.com,2023:photo:aux:linearthumbnail"];

      if (v40) {
        [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v40 forType:10];
      }
      v41 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      v42 = [v41 objectForKeyedSubscript:@"tag:apple.com,2023:photo:aux:styledeltamap"];

      if (v42) {
        [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v42 forType:11];
      }
      v43 = [(NUCGImageSourceNode *)self semanticStylesProperties];
      [(_NUImageProperties *)v8 setSemanticStyleProperties:v43];

      goto LABEL_42;
    }
    [(_NUImageProperties *)v8 setAuxiliaryImageProperties:v38 forType:7];
    v28 = (void *)v38;
LABEL_36:

    goto LABEL_37;
  }
  v8 = 0;
LABEL_42:

LABEL_43:

  return v8;
}

- (id)_evaluateImageGeometryWithSourceOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(NUCGImageSourceNode *)self load:a4])
  {
    v9.receiver = self;
    v9.super_class = (Class)NUCGImageSourceNode;
    v7 = [(NUSourceNode *)&v9 _evaluateImageGeometryWithSourceOptions:v6 error:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_evaluateImageWithSourceOptions:(id)a3 subsampleFactor:(int64_t *)a4 error:(id *)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!a4)
  {
    v32 = NUAssertLogger_2215();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "subsampleFactor != NULL");
      *(_DWORD *)buf = 138543362;
      v66 = v33;
      _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v35 = NUAssertLogger_2215();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v36)
      {
        double v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v47 = (void *)MEMORY[0x1E4F29060];
        id v48 = v46;
        uint64_t v49 = [v47 callStackSymbols];
        v50 = [v49 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v46;
        __int16 v67 = 2114;
        v68 = v50;
        _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v36)
    {
      v37 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v38;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 839, @"Invalid parameter not satisfying: %s", v51, v52, v53, v54, (uint64_t)"subsampleFactor != NULL");
  }
  if (!a5)
  {
    v39 = NUAssertLogger_2215();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      v66 = v40;
      _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v41 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v42 = NUAssertLogger_2215();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (v41)
    {
      if (v43)
      {
        v55 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v56 = (void *)MEMORY[0x1E4F29060];
        id v57 = v55;
        v58 = [v56 callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v66 = v55;
        __int16 v67 = 2114;
        v68 = v59;
        _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v43)
    {
      v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      v45 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v66 = v45;
      _os_log_error_impl(&dword_1A9892000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode _evaluateImageWithSourceOptions:subsampleFactor:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 840, @"Invalid parameter not satisfying: %s", v60, v61, v62, v63, (uint64_t)"error != NULL");
  }
  objc_super v9 = v8;
  if (![(NUCGImageSourceNode *)self load:a5])
  {
    uint64_t v10 = 0;
    goto LABEL_20;
  }
  uint64_t v10 = [(NUCGImageSourceNode *)self cgImageSource];
  if (!v10)
  {
    *a5 = +[NUError invalidError:@"Unable to create imageSource" object:self];
    goto LABEL_20;
  }
  uint64_t v64 = [(NUCGImageSourceNode *)self _finalizeSourceOptions:v9 subsampleFactor:*a4];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v64];
  BOOL v12 = +[NUGlobalSettings imageSourceDisableCacheImmediately];
  v13 = (void *)MEMORY[0x1E4F1E380];
  if (v12)
  {
    uint64_t v14 = MEMORY[0x1E4F1CC28];
LABEL_11:
    v15 = v13;
    [v11 setObject:v14 forKeyedSubscript:*v13];
    goto LABEL_12;
  }
  v15 = (void *)MEMORY[0x1E4F1E380];
  v16 = [(NUCGImageSourceNode *)self colorSpace];
  int v17 = [v16 isHDR];

  if (v17)
  {
    uint64_t v14 = MEMORY[0x1E4F1CC38];
    v13 = v15;
    goto LABEL_11;
  }
LABEL_12:
  int64_t v18 = +[NUGlobalSettings maxPixelCountForCacheImmediately];
  uint64_t v19 = [(NUCGImageSourceNode *)self size];
  if (v19 * v20 <= v18) {
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v15];
  }
  v21 = (CGImageSource *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCGImageSource:v10 index:0 options:v11];
  uint64_t v10 = v21;
  if (v21)
  {
    [(CGImageSource *)v21 extent];
    uint64_t v23 = (uint64_t)v22;
    [(CGImageSource *)v10 extent];
    uint64_t v25 = (uint64_t)v24;
    uint64_t v26 = [(NUCGImageSourceNode *)self pixelSizeWithSourceOptions:v9];
    double v28 = (double)(v26 + v27) / (double)(v25 + v23);
    int64_t v29 = 1;
    if (v28 >= 1.0) {
      int64_t v29 = 1 << llround(log2(v28));
    }
    v30 = (void *)v64;
    *a4 = v29;
  }
  else
  {
    *a5 = +[NUError invalidError:@"Unable to create image from imageSource" object:self];
    v30 = (void *)v64;
  }

LABEL_20:

  return v10;
}

- (id)_evaluateRawImagePropertiesWithSourceOptions:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    uint64_t v11 = NUAssertLogger_2215();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      double v28 = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v14 = NUAssertLogger_2215();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        int64_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        v21 = [v19 callStackSymbols];
        double v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v28 = v18;
        __int16 v29 = 2114;
        v30 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v28 = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode _evaluateRawImagePropertiesWithSourceOptions:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 810, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"error != NULL");
  }
  v7 = v6;
  if ([(NUCGImageSourceNode *)self load:a4])
  {
    if ([v7 count])
    {
      id v8 = [(NUCGImageSourceNode *)self cgImageSource];
      if (v8)
      {
        CFDictionaryRef v9 = [(NUCGImageSourceNode *)self _finalizeSourceOptions:v7 subsampleFactor:1];
        id v8 = CGImageSourceCopyPropertiesAtIndex(v8, 0, v9);
        if (!v8)
        {
          *a4 = +[NUError invalidError:@"Unable to get properties from imageSource" object:self];
        }
      }
      else
      {
        *a4 = +[NUError invalidError:@"Unable to create imageSource" object:self];
      }
    }
    else
    {
      id v8 = [(NUCGImageSourceNode *)self cgImageProperties];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_finalizeSourceOptions:(id)a3 subsampleFactor:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(NUCGImageSourceNode *)self _addDefaultFinalizedSourceOptions:v7];
  if (a4 >= 2)
  {
    id v8 = [NSNumber numberWithInteger:a4];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2FF58]];
  }
  if ([v6 count]) {
    [v7 addEntriesFromDictionary:v6];
  }

  return v7;
}

- (void)_addDefaultFinalizedSourceOptions:(id)a3
{
  id v7 = a3;
  v4 = [(NUCGImageSourceNode *)self UTI];
  [v7 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F2FF78]];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F8CC38];
    id v6 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
    LODWORD(v5) = [v5 typeRequiresRasterizationDPI:v6];

    if (v5) {
      [v7 setObject:&unk_1F0049C80 forKeyedSubscript:*MEMORY[0x1E4F2FEC0]];
    }
  }
  if (+[NUGlobalSettings allAssetsCanUseHDRPipeline]) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2FF00]];
  }
}

- (CGImageSource)cgImageSource
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(NUCGImageSourceNode *)self loaded])
  {
    v4 = NUAssertLogger_2215();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [NSString stringWithFormat:@"%@ not loaded", self];
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v7 = NUAssertLogger_2215();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        uint64_t v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        uint64_t v14 = [v12 callStackSymbols];
        BOOL v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v21 = v11;
        __int16 v22 = 2114;
        uint64_t v23 = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      CFDictionaryRef v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode cgImageSource]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 768, @"%@ not loaded", v16, v17, v18, v19, (uint64_t)self);
  }
  return self->_cgImageSource;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)pixelSizeWithSourceOptions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NUCGImageSourceNode *)self loaded])
  {
    uint64_t v10 = NUAssertLogger_2215();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [NSString stringWithFormat:@"%@ not loaded", self];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v13 = NUAssertLogger_2215();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        uint64_t v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v18 = (void *)MEMORY[0x1E4F29060];
        id v19 = v17;
        id v20 = [v18 callStackSymbols];
        v21 = [v20 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v17;
        __int16 v28 = 2114;
        __int16 v29 = v21;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      BOOL v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode pixelSizeWithSourceOptions:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 762, @"%@ not loaded", v22, v23, v24, v25, (uint64_t)self);
  }
  p_size = &self->_size;
  int64_t width = self->_size.width;
  int64_t height = p_size->height;

  int64_t v8 = width;
  int64_t v9 = height;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (id)debugQuickLookObject
{
  uint64_t v9 = 0;
  int64_t v3 = [(NURenderNode *)self outputImage:&v9];
  id v4 = v3;
  if (!v3 || v9)
  {
    v8.receiver = self;
    v8.super_class = (Class)NUCGImageSourceNode;
    id v5 = [(NURenderNode *)&v8 debugQuickLookObject];
  }
  else
  {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)load:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  BOOL v19 = 0;
  BOOL v19 = [(NUCGImageSourceNode *)self loaded];
  if (*((unsigned char *)v17 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
    }
    id v6 = (id)_NURenderLogger;
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
    objc_super v8 = v6;
    uint64_t v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9892000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "NUCGImageSourceNode.load", (const char *)&unk_1A9A9F00F, buf, 2u);
    }

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __28__NUCGImageSourceNode_load___block_invoke;
    v14[3] = &unk_1E5D958C0;
    v14[4] = self;
    v14[5] = &v16;
    v14[6] = a3;
    uint64_t v10 = (void (**)(void))MEMORY[0x1AD0FAD00](v14);
    v10[2]();
    uint64_t v11 = v9;
    BOOL v12 = v11;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9892000, v12, OS_SIGNPOST_INTERVAL_END, v7, "NUCGImageSourceNode.load", (const char *)&unk_1A9A9F00F, buf, 2u);
    }

    BOOL v5 = *((unsigned char *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);
  return v5;
}

__n128 __28__NUCGImageSourceNode_load___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 32);
  int64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__NUCGImageSourceNode_load___block_invoke_2;
  block[3] = &unk_1E5D958C0;
  long long v5 = v1;
  uint64_t v6 = *(void *)(a1 + 48);
  dispatch_sync(v2, block);
  return result;
}

uint64_t __28__NUCGImageSourceNode_load___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _load:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)loadEmbeddedThumbnailDataFromImageSource:(CGImageSource *)a3 options:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v5 = CGImageSourceCopyProperties(a3, (CFDictionaryRef)a4);
  uint64_t v6 = [(__CFDictionary *)v5 objectForKeyedSubscript:@"{raw}"];
  os_signpost_id_t v7 = v6;
  if (v6)
  {
    objc_super v8 = [v6 objectForKeyedSubscript:@"CropSize"];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"Width"];
    uint64_t v10 = [v9 unsignedIntegerValue];

    uint64_t v11 = [v8 objectForKeyedSubscript:@"Height"];
    uint64_t v12 = [v11 unsignedIntegerValue];

    if (!v10 || !v12)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
      }
      uint64_t v31 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v41 = v7;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Invalid image size from Raw properties: %{public}@", buf, 0xCu);
      }
      __int16 v28 = 0;
      goto LABEL_36;
    }
    id v13 = [v7 objectForKeyedSubscript:@"Thumbnails"];
    BOOL v14 = [v13 firstObject];

    if (v14)
    {
      BOOL v15 = [v14 objectForKeyedSubscript:@"Width"];
      uint64_t v16 = [v15 unsignedIntegerValue];

      uint64_t v17 = [v14 objectForKeyedSubscript:@"Height"];
      uint64_t v18 = [v17 unsignedIntegerValue];

      if (v16 == v10 && v18 == v12)
      {
        BOOL v19 = [v14 objectForKeyedSubscript:@"JPEGOffset"];
        uint64_t v20 = [v19 unsignedIntegerValue];

        v21 = [v14 objectForKeyedSubscript:@"JPEGLength"];
        uint64_t v22 = [v21 unsignedIntegerValue];

        if (v20 && v22)
        {
          uint64_t v23 = (void *)MEMORY[0x1E4F1C9B8];
          uint64_t v24 = [(NUCGImageSourceNode *)self URL];
          id v39 = 0;
          uint64_t v25 = [v23 dataWithContentsOfURL:v24 options:1 error:&v39];
          id v26 = v39;

          uint64_t v27 = objc_msgSend(v25, "subdataWithRange:", v20, v22);
          __int16 v28 = v27;
          if (v27)
          {
            id v29 = v27;
          }
          else
          {
            uint64_t v38 = NURenderLogger_2273();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v41 = v26;
              _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Failed to load embedded thumbnail data: %{public}@", buf, 0xCu);
            }
          }
          goto LABEL_35;
        }
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
        }
        v32 = _NURenderLogger;
        if (!os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
        {
LABEL_34:
          __int16 v28 = 0;
LABEL_35:

LABEL_36:
          goto LABEL_37;
        }
        *(_DWORD *)buf = 138543362;
        id v41 = v7;
        v33 = "Invalid thumbnail data range: %{public}@";
      }
      else
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
        }
        v32 = _NURenderLogger;
        if (!os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 138543362;
        id v41 = v7;
        v33 = "Embedded thumbnail dimension mismatch: %{public}@";
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
      }
      v32 = _NURenderLogger;
      if (!os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 138543362;
      id v41 = v7;
      v33 = "Missing thumbnail properties: %{public}@";
    }
    _os_log_error_impl(&dword_1A9892000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);
    goto LABEL_34;
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
  }
  uint64_t v30 = (void *)_NURenderLogger;
  if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
  {
    v35 = v30;
    BOOL v36 = [(NUCGImageSourceNode *)self URL];
    v37 = [v36 path];
    *(_DWORD *)buf = 138412290;
    id v41 = v37;
    _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Invalid {raw} properties: %@", buf, 0xCu);
  }
  __int16 v28 = 0;
LABEL_37:

  return v28;
}

- (BOOL)_loadSemanticStylesProperties:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v5 = [(NUCGImageSourceNode *)self URL];
  int v6 = CMPhotoDecompressionDetectContainerFormat();

  if (!v6) {
    return 1;
  }
  uint64_t v7 = CMPhotoDecompressionSessionCreate();
  if (self->_decompressionSession)
  {
    objc_super v8 = [(NUCGImageSourceNode *)self URL];
    uint64_t Container = CMPhotoDecompressionSessionCreateContainer();

    if (self->_decompressionContainer)
    {
      uint64_t v16 = 0;
      uint64_t v10 = CMPhotoDecompressionContainerCopyCustomMetadataForIndexWithOptions();
      if (v10 >> 1 != 2147475151)
      {
        BOOL v14 = [NSNumber numberWithInt:v10];
        +[NUError failureError:@"Failed to load custom metadata" object:v14];
        BOOL v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        return v13;
      }
      return 1;
    }
    uint64_t v12 = [NSNumber numberWithInt:Container];
    *a3 = +[NUError failureError:@"Failed to create decompression container" object:v12];
  }
  else
  {
    uint64_t v11 = [NSNumber numberWithInt:v7];
    *a3 = +[NUError failureError:@"Failed to create decompression session" object:v11];
  }
  return 0;
}

- (BOOL)_load:(id *)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v51 = NUAssertLogger_2215();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      id v71 = v52;
      _os_log_error_impl(&dword_1A9892000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v54 = NUAssertLogger_2215();
    BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        v58 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v59 = (void *)MEMORY[0x1E4F29060];
        id v60 = v58;
        uint64_t v61 = [v59 callStackSymbols];
        uint64_t v62 = [v61 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v71 = v58;
        __int16 v72 = 2114;
        v73 = v62;
        _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v55)
    {
      v56 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v57 = [v56 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v71 = v57;
      _os_log_error_impl(&dword_1A9892000, v54, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode _load:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 512, @"Invalid parameter not satisfying: %s", v63, v64, v65, v66, (uint64_t)"error != NULL");
  }
  if (![(NUCGImageSourceNode *)self loaded])
  {
    CFDictionaryRef v6 = [(NUCGImageSourceNode *)self _finalizeSourceOptions:MEMORY[0x1E4F1CC08] subsampleFactor:1];
    CFURLRef v7 = [(NUCGImageSourceNode *)self URL];
    CGImageSourceRef v8 = CGImageSourceCreateWithURL(v7, v6);
    if (!v8)
    {
      +[NUError unknownError:@"Unable to create CGImageSourceRef" object:v7];
      BOOL v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_52:
      [(NUCGImageSourceNode *)self setLoaded:v5];

      return v5;
    }
    CGImageSourceRef v9 = v8;
    if ([(NUCGImageSourceNode *)self useEmbeddedPreview])
    {
      CFDataRef v10 = [(NUCGImageSourceNode *)self loadEmbeddedThumbnailDataFromImageSource:v9 options:v6];
      CFDataRef v11 = v10;
      if (v10)
      {
        CGImageSourceRef v12 = CGImageSourceCreateWithData(v10, v6);
        if (v12)
        {
          CGImageSourceRef v13 = v12;
          CFRelease(v9);
          CGImageSourceRef v9 = v13;
        }
        else
        {
          if (_NULogOnceToken != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
          }
          BOOL v14 = (void *)_NURenderLogger;
          if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
          {
            double v46 = v14;
            v47 = [(__CFURL *)v7 path];
            *(_DWORD *)buf = 138543362;
            id v71 = v47;
            _os_log_error_impl(&dword_1A9892000, v46, OS_LOG_TYPE_ERROR, "Failed to load image source from embedded thumbnail data at path: '%{public}@'", buf, 0xCu);
          }
        }
      }
    }
    [(NUCGImageSourceNode *)self setCgImageSource:v9];
    CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(v9, 0, v6);
    [(NUCGImageSourceNode *)self setCgImageProperties:v15];
    if (v15)
    {
      BOOL v16 = [(NUCGImageSourceNode *)self _setGeometryFromProperties:v15 error:a3];
    }
    else
    {
      +[NUError errorWithCode:2 reason:@"Unable to load CGImageProperties" object:self];
      BOOL v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v69 = 0;
    BOOL v17 = [(NUCGImageSourceNode *)self _loadSemanticStylesProperties:&v69];
    id v18 = v69;
    if (!v17)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
      }
      BOOL v19 = _NURenderLogger;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v71 = v18;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Failed to get style metadata: %{public}@", buf, 0xCu);
      }
    }

    if (v16)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, v6);
      BOOL v5 = (BOOL)ImageAtIndex;
      if (ImageAtIndex)
      {
        CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(ImageAtIndex);
        if ((BitmapInfo & 0x1F) > 6) {
          uint64_t v22 = 0;
        }
        else {
          uint64_t v22 = qword_1A9A74630[BitmapInfo & 0x1F];
        }
        [(NUCGImageSourceNode *)self setAlphaInfo:v22];
        if ((BitmapInfo & 0x100) != 0)
        {
          uint64_t v24 = 4;
        }
        else
        {
          unsigned int v23 = (BitmapInfo >> 12) & 7;
          if (v23 > 4) {
            uint64_t v24 = 0;
          }
          else {
            uint64_t v24 = qword_1A9A74668[v23];
          }
        }
        [(NUCGImageSourceNode *)self setComponentInfo:v24];
        CGColorSpaceRef ColorSpace = CGImageGetColorSpace((CGImageRef)v5);
        if (ColorSpace)
        {
          id v26 = [[NUColorSpace alloc] initWithCGColorSpace:ColorSpace];
LABEL_50:
          BOOL v43 = v26;
          [(NUCGImageSourceNode *)self setColorSpace:v26];

          CGImageGetContentHeadroom();
          -[NUCGImageSourceNode setContentHeadroom:](self, "setContentHeadroom:");
          CGImageRelease((CGImageRef)v5);
          CFDictionaryRef v44 = CGImageSourceCopyProperties(v9, v6);
          BOOL v5 = [(NUCGImageSourceNode *)self _setAuxiliaryImagePropertiesFromCGProperties:v44 error:a3];

          goto LABEL_51;
        }
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_2239);
        }
        uint64_t v27 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v28 = NSString;
          id v29 = v27;
          uint64_t v30 = [v28 stringWithFormat:@"Could not get the color space from the image - attempting to use built in sRGB"];
          *(_DWORD *)buf = 138543362;
          id v71 = v30;
          _os_log_impl(&dword_1A9892000, v29, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

          uint64_t v31 = _NULogOnceToken;
          if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
          {
            if (v31 != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_2239);
            }
LABEL_44:
            v32 = (void *)_NUAssertLogger;
            if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
            {
              v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              uint64_t v38 = (void *)MEMORY[0x1E4F29060];
              id v68 = v37;
              id v39 = v32;
              v40 = [v38 callStackSymbols];
              id v41 = [v40 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543618;
              id v71 = v37;
              __int16 v72 = 2114;
              v73 = v41;
              _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_55:
              goto LABEL_49;
            }
            goto LABEL_49;
          }
          if (v31 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_2239);
          }
        }
        else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          goto LABEL_44;
        }
        uint64_t v42 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          id v48 = (void *)MEMORY[0x1E4F29060];
          id v39 = v42;
          uint64_t v49 = [v48 callStackSymbols];
          v50 = [v49 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          id v71 = v50;
          _os_log_error_impl(&dword_1A9892000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

          goto LABEL_55;
        }
LABEL_49:
        _NUAssertContinueHandler((uint64_t)"-[NUCGImageSourceNode _load:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 579, @"Could not get the color space from the image - attempting to use built in sRGB", v33, v34, v35, v36, v67);
        id v26 = +[NUColorSpace sRGBColorSpace];
        goto LABEL_50;
      }
      *a3 = +[NUError invalidError:@"Unable to create image from imageSource" object:self];
    }
    else
    {
      BOOL v5 = 0;
    }
LABEL_51:
    CFRelease(v9);
    goto LABEL_52;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)_setAuxiliaryImagePropertiesFromCGProperties:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  CFURLRef v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F2F978]];
  CGImageSourceRef v8 = v7;
  if (v7)
  {
    CGImageSourceRef v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FBD8]];
    CFDataRef v10 = v9;
    if (v9 && [v9 count])
    {
      uint64_t v33 = v8;
      id v34 = v5;
      v32 = v10;
      uint64_t v31 = [v10 objectAtIndexedSubscript:0];
      CFDataRef v11 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F2F510]];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v39;
        uint64_t v15 = *MEMORY[0x1E4F2F518];
        uint64_t v37 = *MEMORY[0x1E4F2F3D0];
        uint64_t v36 = *MEMORY[0x1E4F2F3E8];
        uint64_t v35 = *MEMORY[0x1E4F2F3F0];
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v39 != v14) {
              objc_enumerationMutation(v11);
            }
            BOOL v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
            id v18 = [v17 objectForKeyedSubscript:v15];
            BOOL v19 = v18;
            if (v18)
            {
              if (self->_decompressionContainer
                && (([v18 isEqualToString:@"tag:apple.com,2023:photo:aux:linearthumbnail"] & 1) != 0
                 || ([v19 isEqualToString:v37] & 1) != 0
                 || ([v19 isEqualToString:v36] & 1) != 0
                 || ([v19 isEqualToString:v35] & 1) != 0
                 || [v19 isEqualToString:@"tag:apple.com,2023:photo:aux:styledeltamap"]))
              {
                uint64_t v20 = [[NUCMPhotoAuxiliaryImageProperties alloc] initWithProperties:v17 decompressionContainer:self->_decompressionContainer];
              }
              else
              {
                uint64_t v20 = [[NUCGAuxiliaryImageProperties alloc] initWithCGProperties:v17 imageSource:self->_cgImageSource];
              }
              uint64_t v22 = v20;
              [v6 setObject:v20 forKeyedSubscript:v19];
            }
            else
            {
              if (_NULogOnceToken != -1) {
                dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
              }
              v21 = _NURenderLogger;
              if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                BOOL v43 = v17;
                _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Missing AuxiliaryDataType key: %{public}@", buf, 0xCu);
              }
            }

            ++v16;
          }
          while (v13 != v16);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v13);
      }
      uint64_t v23 = *MEMORY[0x1E4F2F3C8];
      uint64_t v24 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2F3C8]];
      if (v24)
      {
        uint64_t v25 = (void *)v24;
        uint64_t v26 = *MEMORY[0x1E4F2F3C0];
        uint64_t v27 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2F3C0]];

        if (v27)
        {
          __int16 v28 = [v6 objectForKeyedSubscript:v23];
          id v29 = [v6 objectForKeyedSubscript:v26];
          objc_msgSend(v28, "setCompatibilityMetadata:", objc_msgSend(v29, "auxiliaryDataInfoMetadata"));
        }
      }
      [(NUCGImageSourceNode *)self setAuxiliaryImagesProperties:v6];

      CGImageSourceRef v8 = v33;
      id v5 = v34;
      CFDataRef v10 = v32;
    }
  }
  return 1;
}

- (BOOL)_setGeometryFromProperties:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    BOOL v17 = NUAssertLogger_2215();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      id v18 = (NUCGImageSourceNode *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_2215();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        uint64_t v26 = (NUCGImageSourceNode *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v27 = (void *)MEMORY[0x1E4F29060];
        __int16 v28 = v26;
        id v29 = [v27 callStackSymbols];
        uint64_t v30 = [v29 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v26;
        __int16 v37 = 2114;
        long long v38 = v30;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode _setGeometryFromProperties:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 401, @"Invalid parameter not satisfying: %s", v31, v32, v33, v34, (uint64_t)"error != nil");
  }
  CFURLRef v7 = v6;
  CGImageSourceRef v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
  uint64_t v9 = [v8 integerValue];

  CFDataRef v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
  uint64_t v11 = [v10 integerValue];

  if ((v11 | v9) < 0)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
    [v24 handleFailureInFunction:v25, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
  }
  -[NUCGImageSourceNode setSize:](self, "setSize:", v9, v11);
  uint64_t v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FD70]];
  if (v12
    || ([v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = [v12 integerValue];
    if ((unint64_t)(v13 - 1) >= 8)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_499_2206);
      }
      uint64_t v15 = _NURenderLogger;
      uint64_t v14 = 1;
      if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = self;
        __int16 v37 = 2114;
        long long v38 = v12;
        uint64_t v14 = 1;
        _os_log_impl(&dword_1A9892000, v15, OS_LOG_TYPE_INFO, "%@ has invalid orientation: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v14 = v13;
    }
  }
  else
  {
    uint64_t v14 = 1;
  }
  [(NUCGImageSourceNode *)self setOrientation:v14];

  return 1;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6)
  {
    uint64_t v16 = NUAssertLogger_2215();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v17;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v19 = NUAssertLogger_2215();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v20)
      {
        uint64_t v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v24 = (void *)MEMORY[0x1E4F29060];
        id v25 = v23;
        uint64_t v26 = [v24 callStackSymbols];
        uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v23;
        __int16 v34 = 2114;
        uint64_t v35 = v27;
        _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v20)
    {
      BOOL v21 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v22;
      _os_log_error_impl(&dword_1A9892000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode resolvedNodeWithCachedInputs:settings:pipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 385, @"Invalid parameter not satisfying: %s", v28, v29, v30, v31, (uint64_t)"error != nil");
  }
  uint64_t v13 = v12;
  if ([(NUCGImageSourceNode *)self load:a6]
    && [(NUCGImageSourceNode *)self supportsPipelineState:v13 error:a6])
  {
    uint64_t v14 = [(NUCGImageSourceNode *)self resolvedAuxiliaryImageNodeForPipelineState:v13 error:a6];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)preparedNodeWithSourceContainer:(id)a3 pipelineState:(id)a4 pipelineSettings:(id)a5 sourceSettings:(id)a6 error:(id *)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!a7)
  {
    BOOL v21 = NUAssertLogger_2215();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_2215();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        uint64_t v31 = [v29 callStackSymbols];
        uint64_t v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v39 = v28;
        __int16 v40 = 2114;
        long long v41 = v32;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode preparedNodeWithSourceContainer:pipelineState:pipelineSettings:sourceSettings:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 357, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"error != nil");
  }
  uint64_t v16 = v15;
  if ([(NUCGImageSourceNode *)self load:a7]
    && [(NUCGImageSourceNode *)self supportsPipelineState:v13 error:a7])
  {
    if ([v13 auxiliaryImageType] == 1 || !objc_msgSend(v13, "auxiliaryImageType"))
    {
      v37.receiver = self;
      v37.super_class = (Class)NUCGImageSourceNode;
      BOOL v19 = [(NUSourceNode *)&v37 preparedNodeWithSourceContainer:v12 pipelineState:v13 pipelineSettings:v14 sourceSettings:v16 error:a7];
    }
    else
    {
      BOOL v17 = [(NUCGImageSourceNode *)self resolvedAuxiliaryImageNodeForPipelineState:v13 error:a7];
      id v18 = v17;
      if (v17)
      {
        BOOL v19 = [v17 preparedNodeWithSourceContainer:v12 pipelineState:v13 pipelineSettings:v14 sourceSettings:v16 error:a7];
      }
      else
      {
        BOOL v19 = 0;
      }
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)canPropagateOriginalAuxiliaryData:(int64_t)a3
{
  int64_t v3 = [(NUCGImageSourceNode *)self auxiliaryImagePropertiesForAuxImageType:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_evaluateAuxiliaryImageForType:(int64_t)a3 error:(id *)a4
{
  id v6 = -[NUCGImageSourceNode auxiliaryImagePropertiesForAuxImageType:](self, "auxiliaryImagePropertiesForAuxImageType:");
  CFURLRef v7 = v6;
  if (v6)
  {
    CGImageSourceRef v8 = [v6 auxiliaryImage:a4];
  }
  else
  {
    if ((unint64_t)a3 > 0xB) {
      uint64_t v9 = @"Invalid";
    }
    else {
      uint64_t v9 = off_1E5D94190[a3];
    }
    id v10 = v9;
    *a4 = +[NUError missingError:@"source does not have properties for given auxiliary image type:" object:v10];

    CGImageSourceRef v8 = 0;
  }

  return v8;
}

- (id)resolvedAuxiliaryImageNodeForPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    id v18 = NUAssertLogger_2215();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      BOOL v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v19;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v21 = NUAssertLogger_2215();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        BOOL v25 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v28 = [v26 callStackSymbols];
        uint64_t v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v25;
        __int16 v36 = 2114;
        objc_super v37 = v29;
        _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      uint64_t v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v24;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode resolvedAuxiliaryImageNodeForPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 310, @"Invalid parameter not satisfying: %s", v30, v31, v32, v33, (uint64_t)"error != nil");
  }
  CFURLRef v7 = v6;
  uint64_t v8 = [v6 auxiliaryImageType];
  if (v8)
  {
    unint64_t v9 = v8;
    if (v8 == 1)
    {
      id v10 = self;
    }
    else
    {
      id v11 = [(NUCGImageSourceNode *)self auxiliaryImagePropertiesForAuxImageType:v8];
      if (v11)
      {
        if (v9 == 2)
        {
          id v12 = [NUCGImageDepthSourceNode alloc];
          id v13 = self;
          uint64_t v14 = 2;
        }
        else
        {
          id v12 = [NUCGAuxiliaryImageSourceNode alloc];
          id v13 = self;
          uint64_t v14 = v9;
        }
        id v10 = [(NUCGImageDepthSourceNode *)v12 initWithSourceNode:v13 auxiliaryImageType:v14 auxiliaryImageProperties:v11];
      }
      else
      {
        if (v9 > 0xB) {
          id v15 = @"Invalid";
        }
        else {
          id v15 = off_1E5D94190[v9];
        }
        uint64_t v16 = v15;
        *a4 = +[NUError missingError:@"source does not have properties for given auxiliaryImageType:" object:v16];

        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)auxiliaryImagePropertiesForAuxImageType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      id v5 = v4;
      id v6 = (__CFString **)MEMORY[0x1E4F2F3B8];
      goto LABEL_17;
    case 3:
      BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      id v5 = v4;
      id v6 = (__CFString **)MEMORY[0x1E4F2F3D0];
      goto LABEL_17;
    case 4:
      BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      id v5 = v4;
      id v6 = (__CFString **)MEMORY[0x1E4F2F3E8];
      goto LABEL_17;
    case 5:
      BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      id v5 = v4;
      id v6 = (__CFString **)MEMORY[0x1E4F2F3E0];
      goto LABEL_17;
    case 6:
      BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      id v5 = v4;
      id v6 = (__CFString **)MEMORY[0x1E4F2F3F8];
      goto LABEL_17;
    case 7:
      uint64_t v8 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      unint64_t v9 = (__CFString *)*MEMORY[0x1E4F2F3C8];
      uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2F3C8]];
      if (v10)
      {
        id v11 = (void *)v10;
        BOOL v12 = +[NUGlobalSettings enableFlexRange];

        if (v12)
        {
          BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
          id v5 = v4;
          id v13 = v9;
          goto LABEL_18;
        }
      }
      else
      {
      }
      BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      id v5 = v4;
      id v6 = (__CFString **)MEMORY[0x1E4F2F3C0];
LABEL_17:
      id v13 = *v6;
LABEL_18:
      CFURLRef v7 = [v4 objectForKeyedSubscript:v13];

LABEL_19:
      return v7;
    case 8:
      BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      id v5 = v4;
      id v6 = (__CFString **)MEMORY[0x1E4F2F3D8];
      goto LABEL_17;
    case 9:
      BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      id v5 = v4;
      id v6 = (__CFString **)MEMORY[0x1E4F2F3F0];
      goto LABEL_17;
    case 10:
      BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      id v5 = v4;
      id v13 = @"tag:apple.com,2023:photo:aux:linearthumbnail";
      goto LABEL_18;
    case 11:
      BOOL v4 = [(NUCGImageSourceNode *)self auxiliaryImagesProperties];
      id v5 = v4;
      id v13 = @"tag:apple.com,2023:photo:aux:styledeltamap";
      goto LABEL_18;
    default:
      CFURLRef v7 = 0;
      goto LABEL_19;
  }
}

- (BOOL)supportsPipelineState:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    BOOL v22 = NUAssertLogger_2215();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v25 = NUAssertLogger_2215();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v26)
      {
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        uint64_t v32 = [v30 callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = v29;
        __int16 v50 = 2114;
        uint64_t v51 = v33;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      id v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 226, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"error != nil");
  }
  CFURLRef v7 = v6;
  if ([v6 mediaComponentType] != 1)
  {
    +[NUError mismatchError:@"expected an image mediaComponentType" object:v7];
    BOOL v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  uint64_t v8 = [v7 auxiliaryImageType];
  if ((unint64_t)(v8 - 2) >= 0xA)
  {
    if (!v8 && [v7 evaluationMode] == 1)
    {
      id v13 = NUAssertLogger_2215();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [NSString stringWithFormat:@"expected a valid auxiliaryImageType during render"];
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = v14;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
      }
      id v15 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      uint64_t v16 = NUAssertLogger_2215();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (v15)
      {
        if (v17)
        {
          uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          uint64_t v39 = (void *)MEMORY[0x1E4F29060];
          id v40 = v38;
          long long v41 = [v39 callStackSymbols];
          uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543618;
          uint64_t v49 = v38;
          __int16 v50 = 2114;
          uint64_t v51 = v42;
          _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
        }
      }
      else if (v17)
      {
        id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v19 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = v19;
        _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode supportsPipelineState:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 239, @"expected a valid auxiliaryImageType during render", v43, v44, v45, v46, v47);
    }
    goto LABEL_5;
  }
  unint64_t v9 = -[NUCGImageSourceNode auxiliaryImagePropertiesForAuxImageType:](self, "auxiliaryImagePropertiesForAuxImageType:", [v7 auxiliaryImageType]);

  if (v9)
  {
LABEL_5:
    BOOL v10 = 1;
    goto LABEL_18;
  }
  unint64_t v11 = [v7 auxiliaryImageType];
  if (v11 > 0xB) {
    BOOL v12 = @"Invalid";
  }
  else {
    BOOL v12 = off_1E5D94190[v11];
  }
  BOOL v20 = v12;
  *a4 = +[NUError missingError:@"auxiliary image data not found" object:v20];

  BOOL v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3 = [a3 evaluationMode];
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (int64_t)normalizeSubsampleFactor:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (![(NUCGImageSourceNode *)self loaded])
  {
    BOOL v12 = NUAssertLogger_2215();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [NSString stringWithFormat:@"%@ not loaded", self];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v15 = NUAssertLogger_2215();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        BOOL v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        BOOL v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v19;
        __int16 v30 = 2114;
        id v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      BOOL v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode normalizeSubsampleFactor:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 158, @"%@ not loaded", v24, v25, v26, v27, (uint64_t)self);
  }
  id v5 = CGImageSourceGetType(self->_cgImageSource);
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v5];
  }
  else
  {
    id v6 = 0;
  }
  if ([v6 conformsToType:*MEMORY[0x1E4F44410]])
  {
    BOOL v7 = a3 < 8;
    int64_t v8 = 8;
    goto LABEL_11;
  }
  if ([v6 conformsToType:*MEMORY[0x1E4F44568]])
  {
    BOOL v7 = a3 < 64;
    int64_t v8 = 64;
    goto LABEL_11;
  }
  if ([v6 conformsToType:*MEMORY[0x1E4F44460]])
  {
    BOOL v7 = a3 < 128;
    int64_t v8 = 128;
LABEL_11:
    if (!v7) {
      a3 = v8;
    }
    goto LABEL_13;
  }
  if ([v6 conformsToType:*MEMORY[0x1E4F44498]])
  {
    a3 = 1;
  }
  else
  {
    int v10 = [v6 conformsToType:*MEMORY[0x1E4F444E0]];
    int64_t v11 = 128;
    if (a3 < 128) {
      int64_t v11 = a3;
    }
    if (v10) {
      a3 = v11;
    }
    else {
      a3 = 1;
    }
  }
LABEL_13:

  return a3;
}

- (int64_t)sourceOrientation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(NUCGImageSourceNode *)self loaded])
  {
    BOOL v4 = NUAssertLogger_2215();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [NSString stringWithFormat:@"%@ not loaded", self];
      *(_DWORD *)buf = 138543362;
      id v21 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v7 = NUAssertLogger_2215();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        int64_t v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        uint64_t v14 = [v12 callStackSymbols];
        id v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v21 = v11;
        __int16 v22 = 2114;
        uint64_t v23 = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      unint64_t v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v21 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode sourceOrientation]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 152, @"%@ not loaded", v16, v17, v18, v19, (uint64_t)self);
  }
  return self->_orientation;
}

- (void)dealloc
{
  cgImageSource = self->_cgImageSource;
  if (cgImageSource) {
    CFRelease(cgImageSource);
  }
  decompressionSession = self->_decompressionSession;
  if (decompressionSession) {
    CFRelease(decompressionSession);
  }
  decompressionuint64_t Container = self->_decompressionContainer;
  if (decompressionContainer) {
    CFRelease(decompressionContainer);
  }
  v6.receiver = self;
  v6.super_class = (Class)NUCGImageSourceNode;
  [(NUCGImageSourceNode *)&v6 dealloc];
}

- (NUCGImageSourceNode)initWithSettings:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_2239);
  }
  id v5 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    objc_super v6 = NSString;
    BOOL v7 = v5;
    BOOL v8 = (objc_class *)objc_opt_class();
    unint64_t v9 = NSStringFromClass(v8);
    int v10 = NSStringFromSelector(a2);
    int64_t v11 = [v6 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v9, v10];
    *(_DWORD *)buf = 138543362;
    id v31 = v11;
    _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v12 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v12 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_2239);
      }
      goto LABEL_8;
    }
    if (v12 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_2239);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v13 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F29060];
    id v15 = v13;
    uint64_t v16 = [v14 callStackSymbols];
    uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    id v31 = v17;
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
  id v15 = v18;
  __int16 v22 = [v20 callStackSymbols];
  uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  id v31 = specific;
  __int16 v32 = 2114;
  uint64_t v33 = v23;
  _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode initWithSettings:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 132, @"Initializer not available: -[%@ %@], use designated initializer instead.", v26, v27, v28, v29, v25);
}

- (NUCGImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 settings:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  BOOL v8 = (NSURL *)a3;
  unint64_t v9 = (NSString *)a4;
  id v10 = a5;
  if ([v10 count])
  {
    int64_t v11 = (void *)[v10 mutableCopy];
    [v11 setObject:v8 forKeyedSubscript:@"url"];
    uint64_t v12 = (void *)[v11 copy];
  }
  else
  {
    uint64_t v19 = @"url";
    v20[0] = v8;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  }
  v18.receiver = self;
  v18.super_class = (Class)NUCGImageSourceNode;
  id v13 = [(NUSourceNode *)&v18 initWithSettings:v12];
  [(NUCGImageSourceNode *)v13 _init];
  URL = v13->_URL;
  v13->_URL = v8;
  id v15 = v8;

  UTI = v13->_UTI;
  v13->_UTI = v9;

  return v13;
}

- (BOOL)useEmbeddedPreview
{
  int64_t v2 = [(NURenderNode *)self settings];
  unint64_t v3 = [v2 objectForKeyedSubscript:@"useEmbeddedPreview"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NUCGImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 identifier:(id)a5 options:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    id v21 = NUAssertLogger_2215();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "URL != nil");
      *(_DWORD *)buf = 138543362;
      v56 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v24 = NUAssertLogger_2215();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v25)
      {
        uint64_t v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        uint64_t v38 = [v36 callStackSymbols];
        uint64_t v39 = [v38 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v56 = v35;
        __int16 v57 = 2114;
        v58 = v39;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v56 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode initWithURL:UTI:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 98, @"Invalid parameter not satisfying: %s", v40, v41, v42, v43, (uint64_t)"URL != nil");
  }
  if (!v12)
  {
    uint64_t v28 = NUAssertLogger_2215();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      v56 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v31 = NUAssertLogger_2215();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        uint64_t v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v45 = (void *)MEMORY[0x1E4F29060];
        id v46 = v44;
        uint64_t v47 = [v45 callStackSymbols];
        id v48 = [v47 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v56 = v44;
        __int16 v57 = 2114;
        v58 = v48;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      uint64_t v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v56 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode initWithURL:UTI:identifier:options:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 99, @"Invalid parameter not satisfying: %s", v49, v50, v51, v52, (uint64_t)"identifier != nil");
  }
  uint64_t v14 = v13;
  id v15 = [v13 objectForKeyedSubscript:@"useEmbeddedPreview"];
  uint64_t v16 = [v15 BOOLValue];

  v53[1] = @"useEmbeddedPreview";
  v54[0] = v12;
  v53[0] = @"identifier";
  uint64_t v17 = [NSNumber numberWithBool:v16];
  v54[1] = v17;
  objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  uint64_t v19 = [(NUCGImageSourceNode *)self initWithURL:v10 UTI:v11 settings:v18];

  return v19;
}

- (NUCGImageSourceNode)initWithURL:(id)a3 UTI:(id)a4 identifier:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v15 = NUAssertLogger_2215();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "URL != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    objc_super v18 = NUAssertLogger_2215();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        __int16 v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        BOOL v32 = [v30 callStackSymbols];
        uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v29;
        __int16 v51 = 2114;
        uint64_t v52 = v33;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      BOOL v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode initWithURL:UTI:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 91, @"Invalid parameter not satisfying: %s", v34, v35, v36, v37, (uint64_t)"URL != nil");
  }
  id v11 = v10;
  if (!v10)
  {
    __int16 v22 = NUAssertLogger_2215();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "identifier != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v23;
      _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v25 = NUAssertLogger_2215();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        uint64_t v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v39 = (void *)MEMORY[0x1E4F29060];
        id v40 = v38;
        uint64_t v41 = [v39 callStackSymbols];
        uint64_t v42 = [v41 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v50 = v38;
        __int16 v51 = 2114;
        uint64_t v52 = v42;
        _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v26)
    {
      uint64_t v27 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v28 = [v27 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v28;
      _os_log_error_impl(&dword_1A9892000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUCGImageSourceNode initWithURL:UTI:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Pipeline/NURenderSourceNode+CGImage.m", 92, @"Invalid parameter not satisfying: %s", v43, v44, v45, v46, (uint64_t)"identifier != nil");
  }
  uint64_t v47 = @"identifier";
  id v48 = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  id v13 = [(NUCGImageSourceNode *)self initWithURL:v8 UTI:v9 settings:v12];

  return v13;
}

- (NUCGImageSourceNode)initWithImageSource:(CGImageSource *)a3 identifier:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v12 = @"identifier";
  v13[0] = a4;
  objc_super v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)NUCGImageSourceNode;
  id v9 = [(NUSourceNode *)&v11 initWithSettings:v8];

  [(NUCGImageSourceNode *)v9 _init];
  v9->_cgImageSource = (CGImageSource *)CFRetain(a3);
  return v9;
}

- (void)_init
{
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unint64_t v3 = (OS_dispatch_queue *)dispatch_queue_create("NUCGImageSourceNode", v5);
  queue = self->_queue;
  self->_queue = v3;
}

@end