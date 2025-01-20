@interface _NUImageProperties
+ (BOOL)getGainMapHeadroom:(double *)a3 fromMakerNote:(id)a4;
+ (BOOL)getGainMapHeadroom:(double *)a3 fromMetadata:(CGImageMetadata *)a4;
+ (BOOL)setGainMapHeadroom:(double)a3 toMakerNote:(id)a4;
+ (BOOL)setGainMapHeadroom:(double)a3 toMetadata:(CGImageMetadata *)a4;
+ (CGImageMetadata)createGainMapMetadataWithHeadroom:(double)a3;
+ (id)versionFromFlexRangeMetadata:(CGImageMetadata *)a3;
+ (id)versionFromMetadataTag:(CGImageMetadataTag *)a3;
+ (id)versionFromMeteorPlusMetadata:(CGImageMetadata *)a3;
+ (void)_computeMeteorPlusGain:(double *)a3 gainMapValue:(double *)a4 forContentHeadroom:(double)a5;
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- (BOOL)hasGainMap;
- (BOOL)isHDR;
- (NSDictionary)metadata;
- (NSString)description;
- (NSString)fileUTI;
- (NSURL)url;
- (NUColorSpace)colorSpace;
- (NUFlexRangeProperties)flexRangeProperties;
- (NURAWImageProperties)rawProperties;
- (NUSemanticStyleProperties)semanticStyleProperties;
- (NUVersion)meteorPlusGainMapVersion;
- (_NUImageProperties)init;
- (_NUImageProperties)initWithProperties:(id)a3;
- (double)_computeGainMapHeadroom;
- (double)gainMapHeadroom;
- (float)contentHeadroom;
- (id)auxiliaryImagePropertiesForType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)alphaInfo;
- (int64_t)componentInfo;
- (int64_t)orientation;
- (void)_updateGainMapHeadroomMetadata:(double)a3;
- (void)_updateGainMapMetadata:(CGImageMetadata *)a3;
- (void)_updateMakerNote:(id)a3;
- (void)enumerateAuxiliaryImageProperties:(id)a3;
- (void)resetAuxiliaryImageProperties;
- (void)setAlphaInfo:(int64_t)a3;
- (void)setAuxiliaryImageProperties:(id)a3 forType:(int64_t)a4;
- (void)setColorSpace:(id)a3;
- (void)setComponentInfo:(int64_t)a3;
- (void)setContentHeadroom:(float)a3;
- (void)setFileUTI:(id)a3;
- (void)setFlexRangeProperties:(id)a3;
- (void)setGainMapHeadroom:(double)a3;
- (void)setMetadata:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setRawProperties:(id)a3;
- (void)setSemanticStyleProperties:(id)a3;
- (void)setSize:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation _NUImageProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticStyleProperties, 0);
  objc_storeStrong((id *)&self->_flexRangeProperties, 0);
  objc_storeStrong((id *)&self->_rawProperties, 0);
  objc_storeStrong((id *)&self->_fileUTI, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_auxiliaryImagesProperties, 0);

  objc_storeStrong((id *)&self->_gainMapHeadroomValue, 0);
}

- (void)setSemanticStyleProperties:(id)a3
{
}

- (NUSemanticStyleProperties)semanticStyleProperties
{
  return (NUSemanticStyleProperties *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFlexRangeProperties:(id)a3
{
}

- (NUFlexRangeProperties)flexRangeProperties
{
  return (NUFlexRangeProperties *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRawProperties:(id)a3
{
}

- (NURAWImageProperties)rawProperties
{
  return (NURAWImageProperties *)objc_getProperty(self, a2, 88, 1);
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

- (void)setFileUTI:(id)a3
{
}

- (NSString)fileUTI
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
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

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)enumerateAuxiliaryImageProperties:(id)a3
{
  id v4 = a3;
  auxiliaryImagesProperties = self->_auxiliaryImagesProperties;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___NUImageProperties_enumerateAuxiliaryImageProperties___block_invoke;
  v7[3] = &unk_1E5D94078;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)auxiliaryImagesProperties enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)resetAuxiliaryImageProperties
{
}

- (void)setAuxiliaryImageProperties:(id)a3 forType:(int64_t)a4
{
  auxiliaryImagesProperties = self->_auxiliaryImagesProperties;
  id v6 = a3;
  if ((unint64_t)a4 > 0xB) {
    v7 = @"Invalid";
  }
  else {
    v7 = off_1E5D94190[a4];
  }
  id v8 = v7;
  [(NSMutableDictionary *)auxiliaryImagesProperties setObject:v6 forKeyedSubscript:v8];
}

- (id)auxiliaryImagePropertiesForType:(int64_t)a3
{
  auxiliaryImagesProperties = self->_auxiliaryImagesProperties;
  if ((unint64_t)a3 > 0xB) {
    id v4 = @"Invalid";
  }
  else {
    id v4 = off_1E5D94190[a3];
  }
  v5 = v4;
  id v6 = [(NSMutableDictionary *)auxiliaryImagesProperties objectForKeyedSubscript:v5];

  return v6;
}

- (_NUImageProperties)initWithProperties:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  if (!v4)
  {
    v28 = NUAssertLogger_2895();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "properties != nil");
      *(_DWORD *)buf = 138543362;
      v62 = v29;
      _os_log_error_impl(&dword_1A9892000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v31 = NUAssertLogger_2895();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v32)
      {
        v42 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v43 = (void *)MEMORY[0x1E4F29060];
        id v44 = v42;
        v45 = [v43 callStackSymbols];
        v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v42;
        __int16 v63 = 2114;
        v64 = v46;
        _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v32)
    {
      v33 = [MEMORY[0x1E4F29060] callStackSymbols];
      v34 = [v33 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v34;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageProperties initWithProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 401, @"Invalid parameter not satisfying: %s", v47, v48, v49, v50, (uint64_t)"properties != nil");
  }
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = NUAssertLogger_2895();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "[properties isKindOfClass:_NUImageProperties.class]");
      *(_DWORD *)buf = 138543362;
      v62 = v36;
      _os_log_error_impl(&dword_1A9892000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v38 = NUAssertLogger_2895();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v39)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        v54 = [v52 callStackSymbols];
        v55 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v62 = v51;
        __int16 v63 = 2114;
        v64 = v55;
        _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v39)
    {
      v40 = [MEMORY[0x1E4F29060] callStackSymbols];
      v41 = [v40 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v62 = v41;
      _os_log_error_impl(&dword_1A9892000, v38, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageProperties initWithProperties:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 402, @"Invalid parameter not satisfying: %s", v56, v57, v58, v59, (uint64_t)"[properties isKindOfClass:_NUImageProperties.class]");
  }
  v60.receiver = self;
  v60.super_class = (Class)_NUImageProperties;
  id v6 = [(_NUImageProperties *)&v60 init];
  uint64_t v7 = [v5 url];
  url = v6->_url;
  v6->_url = (NSURL *)v7;

  v9 = [v5 metadata];
  uint64_t v10 = [v9 copy];
  metadata = v6->_metadata;
  v6->_metadata = (NSDictionary *)v10;

  uint64_t v12 = [v5 colorSpace];
  colorSpace = v6->_colorSpace;
  v6->_colorSpace = (NUColorSpace *)v12;

  [v5 contentHeadroom];
  v6->_contentHeadroom = v14;
  v6->_size.width = [v5 size];
  v6->_size.height = v15;
  v6->_orientation = [v5 orientation];
  uint64_t v16 = [v5 fileUTI];
  fileUTI = v6->_fileUTI;
  v6->_fileUTI = (NSString *)v16;

  v6->_alphaInfo = [v5 alphaInfo];
  v6->_componentInfo = [v5 componentInfo];
  v18 = [v5 semanticStyleProperties];
  uint64_t v19 = [v18 copy];
  semanticStyleProperties = v6->_semanticStyleProperties;
  v6->_semanticStyleProperties = (NUSemanticStyleProperties *)v19;

  uint64_t v21 = [v5[2] mutableCopy];
  auxiliaryImagesProperties = v6->_auxiliaryImagesProperties;
  v6->_auxiliaryImagesProperties = (NSMutableDictionary *)v21;

  uint64_t v23 = [v5[12] copy];
  flexRangeProperties = v6->_flexRangeProperties;
  v6->_flexRangeProperties = (NUFlexRangeProperties *)v23;

  uint64_t v25 = [v5 rawProperties];
  rawProperties = v6->_rawProperties;
  v6->_rawProperties = (NURAWImageProperties *)v25;

  return v6;
}

- (_NUImageProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)_NUImageProperties;
  int64_t v2 = [(_NUImageProperties *)&v6 init];
  int64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  auxiliaryImagesProperties = v2->_auxiliaryImagesProperties;
  v2->_auxiliaryImagesProperties = v3;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_NUImageProperties alloc];

  return [(_NUImageProperties *)v4 initWithProperties:self];
}

- (NSString)description
{
  v20 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = [(_NUImageProperties *)self url];
  v5 = [(_NUImageProperties *)self fileUTI];
  uint64_t v6 = [(_NUImageProperties *)self size];
  id v8 = [NSString stringWithFormat:@"{%ld, %ld}", v6, v7];
  int64_t v9 = [(_NUImageProperties *)self orientation];
  if ((unint64_t)(v9 - 9) >= 0xFFFFFFFFFFFFFFF8) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = 0;
  }
  v11 = *(&NUOrientationName_names + v10);
  uint64_t v12 = [(_NUImageProperties *)self colorSpace];
  [(_NUImageProperties *)self contentHeadroom];
  double v14 = v13;
  int64_t v15 = [(_NUImageProperties *)self rawProperties];
  auxiliaryImagesProperties = self->_auxiliaryImagesProperties;
  v17 = [(_NUImageProperties *)self metadata];
  v18 = [v20 stringWithFormat:@"<%@:%p> url=%@ fileUTI=%@ size=%@ orientation=%@ colorSpace=%@ headroom=%f raw=%@ aux=%@ metadata=%@", v3, self, v4, v5, v8, v11, v12, *(void *)&v14, v15, auxiliaryImagesProperties, v17];

  return (NSString *)v18;
}

- (NUVersion)meteorPlusGainMapVersion
{
  int64_t v2 = [(_NUImageProperties *)self auxiliaryImagePropertiesForType:7];
  uint64_t v3 = v2;
  if (v2 && (uint64_t v4 = [v2 auxiliaryDataInfoMetadata]) != 0)
  {
    v5 = [(id)objc_opt_class() versionFromMeteorPlusMetadata:v4];
  }
  else
  {
    v5 = 0;
  }

  return (NUVersion *)v5;
}

- (void)_updateGainMapMetadata:(CGImageMetadata *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v23 = [(_NUImageProperties *)self auxiliaryImagePropertiesForType:7];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = NUAssertLogger_2895();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [NSString stringWithFormat:@"Unexpected gain map properties"];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    int64_t v9 = NUAssertLogger_2895();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        float v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        double v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        uint64_t v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v25 = v13;
        __int16 v26 = 2114;
        v27 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[_NUImageProperties _updateGainMapMetadata:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 202, @"Unexpected gain map properties", v18, v19, v20, v21, v22);
  }
  v5 = [v23 auxiliaryImagePropertiesByUpdatingMetadata:a3];
  [(_NUImageProperties *)self setAuxiliaryImageProperties:v5 forType:7];
}

- (void)_updateMakerNote:(id)a3
{
  id v4 = a3;
  v5 = [(_NUImageProperties *)self metadata];
  id v8 = (id)[v5 mutableCopy];

  uint64_t v6 = (void *)[v4 copy];
  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2FC20]];

  uint64_t v7 = (void *)[v8 copy];
  [(_NUImageProperties *)self setMetadata:v7];
}

- (void)_updateGainMapHeadroomMetadata:(double)a3
{
  v5 = [(_NUImageProperties *)self auxiliaryImagePropertiesForType:7];
  if (v5)
  {
    id v12 = v5;
    uint64_t v6 = (const CGImageMetadata *)[v5 auxiliaryDataInfoMetadata];
    v5 = v12;
    if (v6)
    {
      uint64_t v7 = [(id)objc_opt_class() versionFromMeteorPlusMetadata:v6];
      if ([v7 major] >= 2)
      {
        CGMutableImageMetadataRef MutableCopy = CGImageMetadataCreateMutableCopy(v6);
        if ([(id)objc_opt_class() setGainMapHeadroom:MutableCopy toMetadata:a3]) {
          [(_NUImageProperties *)self _updateGainMapMetadata:MutableCopy];
        }
        CFRelease(MutableCopy);
      }
      int64_t v9 = [(_NUImageProperties *)self metadata];
      BOOL v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
      v11 = (void *)[v10 mutableCopy];

      if (v11 && [(id)objc_opt_class() setGainMapHeadroom:v11 toMakerNote:a3]) {
        [(_NUImageProperties *)self _updateMakerNote:v11];
      }

      v5 = v12;
    }
  }
}

- (double)_computeGainMapHeadroom
{
  uint64_t v3 = [(_NUImageProperties *)self flexRangeProperties];
  id v4 = v3;
  if (!v3)
  {
    *(double *)&uint64_t v17 = 1.0;
    int64_t v9 = [(_NUImageProperties *)self auxiliaryImagePropertiesForType:7];
    BOOL v10 = v9;
    double v8 = 1.0;
    if (!v9) {
      goto LABEL_13;
    }
    uint64_t v11 = [v9 auxiliaryDataInfoMetadata];
    if (!v11) {
      goto LABEL_13;
    }
    uint64_t v12 = v11;
    float v13 = [(id)objc_opt_class() versionFromMeteorPlusMetadata:v11];
    if ([v13 major] <= 1)
    {
      if ([v13 major] < 1)
      {
LABEL_12:

        double v8 = *(double *)&v17;
LABEL_13:

        goto LABEL_14;
      }
    }
    else if ([(id)objc_opt_class() getGainMapHeadroom:&v17 fromMetadata:v12])
    {
      goto LABEL_12;
    }
    double v14 = [(_NUImageProperties *)self metadata];
    id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];

    if (v15) {
      [(id)objc_opt_class() getGainMapHeadroom:&v17 fromMakerNote:v15];
    }

    goto LABEL_12;
  }
  [v3 baseHeadroom];
  float v6 = v5;
  [v4 alternateHeadroom];
  double v8 = exp2f(fmaxf(v6, v7));
LABEL_14:

  return v8;
}

- (void)setGainMapHeadroom:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v4 = [NSNumber numberWithDouble:a3];
  gainMapHeadroomValue = obj->_gainMapHeadroomValue;
  obj->_gainMapHeadroomValue = (NSNumber *)v4;

  [(_NUImageProperties *)obj _updateGainMapHeadroomMetadata:a3];
  objc_sync_exit(obj);
}

- (double)gainMapHeadroom
{
  int64_t v2 = self;
  objc_sync_enter(v2);
  gainMapHeadroomValue = v2->_gainMapHeadroomValue;
  if (!gainMapHeadroomValue)
  {
    uint64_t v4 = NSNumber;
    [(_NUImageProperties *)v2 _computeGainMapHeadroom];
    uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
    float v6 = v2->_gainMapHeadroomValue;
    v2->_gainMapHeadroomValue = (NSNumber *)v5;

    gainMapHeadroomValue = v2->_gainMapHeadroomValue;
  }
  [(NSNumber *)gainMapHeadroomValue doubleValue];
  double v8 = v7;
  objc_sync_exit(v2);

  return v8;
}

- (BOOL)hasGainMap
{
  int64_t v2 = [(_NUImageProperties *)self auxiliaryImagePropertiesForType:7];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isHDR
{
  BOOL v3 = [(_NUImageProperties *)self colorSpace];
  char v4 = [v3 isHDR];

  if (v4) {
    return 1;
  }
  uint64_t v5 = [(_NUImageProperties *)self colorSpace];
  char v6 = [v5 isExtended];

  if (v6) {
    return 1;
  }

  return +[NUGlobalSettings allAssetsCanUseHDRPipeline];
}

+ (CGImageMetadata)createGainMapMetadataWithHeadroom:(double)a3
{
  CGMutableImageMetadataRef Mutable = CGImageMetadataCreateMutable();
  if (CGImageMetadataRegisterNamespaceForPrefix(Mutable, @"http://ns.apple.com/HDRGainMap/1.0/", @"HDRGainMap", 0))
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:0x20000];
    char v6 = CGImageMetadataTagCreate(@"http://ns.apple.com/HDRGainMap/1.0/", @"HDRGainMap", @"HDRGainMapVersion", kCGImageMetadataTypeDefault, v5);
    double v7 = [NSString stringWithFormat:@"%@:%@", @"HDRGainMap", @"HDRGainMapVersion"];
    if (CGImageMetadataSetTagWithPath(Mutable, 0, v7, v6))
    {
      double v8 = [NSNumber numberWithDouble:a3];
      int64_t v9 = CGImageMetadataTagCreate(@"http://ns.apple.com/HDRGainMap/1.0/", @"HDRGainMap", @"HDRGainMapHeadroom", kCGImageMetadataTypeDefault, v8);
      BOOL v10 = [NSString stringWithFormat:@"%@:%@", @"HDRGainMap", @"HDRGainMapHeadroom"];
      if (CGImageMetadataSetTagWithPath(Mutable, 0, v10, v9))
      {
        uint64_t v11 = Mutable;
      }
      else
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
        }
        double v14 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v16 = 0;
          _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Failed to set HDRGainMap metadata headroom tag!", v16, 2u);
        }
        uint64_t v11 = 0;
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
      }
      float v13 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Failed to set HDRGainMap metadata version tag!", v17, 2u);
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
    }
    uint64_t v12 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Failed to register HDRGainMap metadata tag!", buf, 2u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

+ (void)_computeMeteorPlusGain:(double *)a3 gainMapValue:(double *)a4 forContentHeadroom:(double)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v10 = NUAssertLogger_2895();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outGain != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v11;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    float v13 = NUAssertLogger_2895();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        v34 = [v32 callStackSymbols];
        v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v59 = v31;
        __int16 v60 = 2114;
        v61 = v35;
        _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v14)
    {
      id v15 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v15 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v16;
      _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties _computeMeteorPlusGain:gainMapValue:forContentHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 337, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"outGain != NULL");
  }
  if (!a4)
  {
    uint64_t v17 = NUAssertLogger_2895();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "outValue != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v18;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v20 = NUAssertLogger_2895();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19)
    {
      if (v21)
      {
        v40 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v41 = (void *)MEMORY[0x1E4F29060];
        id v42 = v40;
        v43 = [v41 callStackSymbols];
        id v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v59 = v40;
        __int16 v60 = 2114;
        v61 = v44;
        _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v23 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v23;
      _os_log_error_impl(&dword_1A9892000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties _computeMeteorPlusGain:gainMapValue:forContentHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 338, @"Invalid parameter not satisfying: %s", v45, v46, v47, v48, (uint64_t)"outValue != NULL");
  }
  if (a5 < 1.0)
  {
    v24 = NUAssertLogger_2895();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "headroom >= 1.0");
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    __int16 v26 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger_2895();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v28)
      {
        uint64_t v49 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v50 = (void *)MEMORY[0x1E4F29060];
        id v51 = v49;
        v52 = [v50 callStackSymbols];
        id v53 = [v52 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v59 = v49;
        __int16 v60 = 2114;
        v61 = v53;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v59 = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties _computeMeteorPlusGain:gainMapValue:forContentHeadroom:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 339, @"Invalid parameter not satisfying: %s", v54, v55, v56, v57, (uint64_t)"headroom >= 1.0");
  }
  double v8 = log2(a5);
  *a3 = a5;
  if (v8 <= 2.3) {
    double v9 = (2.3 - v8) * 0.99 / 0.3;
  }
  else {
    double v9 = (v8 + -2.3) * 0.01 / -0.7;
  }
  *a4 = v9 + 0.01;
}

+ (BOOL)setGainMapHeadroom:(double)a3 toMakerNote:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v11 = NUAssertLogger_2895();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "makerNote != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v14 = NUAssertLogger_2895();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        uint64_t v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        BOOL v21 = [v19 callStackSymbols];
        uint64_t v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v18;
        __int16 v29 = 2114;
        v30 = v22;
        _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties setGainMapHeadroom:toMakerNote:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 321, @"Invalid parameter not satisfying: %s", v23, v24, v25, v26, (uint64_t)"makerNote != NULL");
  }
  double v7 = v6;
  double v27 = 0.0;
  *(void *)buf = 0;
  [a1 _computeMeteorPlusGain:buf gainMapValue:&v27 forContentHeadroom:a3];
  double v8 = [NSNumber numberWithDouble:*(double *)buf];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F15560]];

  double v9 = [NSNumber numberWithDouble:v27];
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F15568]];

  return 1;
}

+ (BOOL)getGainMapHeadroom:(double *)a3 fromMakerNote:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!v5)
  {
    BOOL v15 = NUAssertLogger_2895();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "makerNote != NULL");
      *(_DWORD *)buf = 138543362;
      BOOL v32 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v18 = NUAssertLogger_2895();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        BOOL v32 = v22;
        __int16 v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      BOOL v32 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties getGainMapHeadroom:fromMakerNote:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 301, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"makerNote != NULL");
  }
  id v6 = v5;
  double v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F15560]];
  double v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F15568]];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v7 doubleValue];
    double v10 = v9;
    [v8 doubleValue];
    [MEMORY[0x1E4F8CC38] gainMapHeadroomForHDRGain:v10 gainMapValue:v11];
    if (a3) {
      *(void *)a3 = v12;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)setGainMapHeadroom:(double)a3 toMetadata:(CGImageMetadata *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    uint64_t v12 = NUAssertLogger_2895();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "metadata != NULL");
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v13;
      _os_log_error_impl(&dword_1A9892000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v15 = NUAssertLogger_2895();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        BOOL v19 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v20 = (void *)MEMORY[0x1E4F29060];
        id v21 = v19;
        uint64_t v22 = [v20 callStackSymbols];
        uint64_t v23 = [v22 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v19;
        __int16 v30 = 2114;
        uint64_t v31 = v23;
        _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v18;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties setGainMapHeadroom:toMetadata:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 281, @"Invalid parameter not satisfying: %s", v24, v25, v26, v27, (uint64_t)"metadata != NULL");
  }
  id v5 = [NSNumber numberWithDouble:a3];
  id v6 = [NSString stringWithFormat:@"%@:%@", @"HDRGainMap", @"HDRGainMapHeadroom"];
  double v7 = CGImageMetadataTagCreate(@"http://ns.apple.com/HDRGainMap/1.0/", @"HDRGainMap", @"HDRGainMapHeadroom", kCGImageMetadataTypeDefault, v5);
  if (v7)
  {
    if (CGImageMetadataSetTagWithPath(a4, 0, v6, v7))
    {
      BOOL v8 = 1;
      goto LABEL_14;
    }
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
    }
    double v9 = _NULogger;
    BOOL v8 = 0;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v10 = "Failed to set HDRGainMap metadata headroom tag!";
      goto LABEL_13;
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
    }
    double v9 = _NULogger;
    BOOL v8 = 0;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v10 = "Failed to make HDRGainMap metadata headroom tag!";
LABEL_13:
      _os_log_impl(&dword_1A9892000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
      BOOL v8 = 0;
    }
  }
LABEL_14:

  return v8;
}

+ (BOOL)getGainMapHeadroom:(double *)a3 fromMetadata:(CGImageMetadata *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    BOOL v15 = NUAssertLogger_2895();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "metadata != NULL");
      BOOL v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    uint64_t v18 = NUAssertLogger_2895();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v22 = (__CFString *)dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        uint64_t v23 = (void *)MEMORY[0x1E4F29060];
        uint64_t v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        uint64_t v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v22;
        __int16 v33 = 2114;
        v34 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[_NUImageProperties getGainMapHeadroom:fromMetadata:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUImageProperties.m", 255, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"metadata != NULL");
  }
  id v6 = [NSString stringWithFormat:@"%@:%@", @"HDRGainMap", @"HDRGainMapHeadroom"];
  double v7 = CGImageMetadataCopyTagWithPath(a4, 0, v6);
  BOOL v8 = v7;
  if (v7)
  {
    double v9 = (__CFString *)CGImageMetadataTagCopyValue(v7);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      [(__CFString *)v9 doubleValue];
      if (a3) {
        *(void *)a3 = v11;
      }
    }
    else
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
      }
      BOOL v13 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = v9;
        _os_log_impl(&dword_1A9892000, v13, OS_LOG_TYPE_DEFAULT, "Invalid gain map headroom tag value: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
    }
    uint64_t v12 = _NULogger;
    char isKindOfClass = 0;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v6;
      __int16 v33 = 2114;
      v34 = a4;
      _os_log_impl(&dword_1A9892000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get metadata tag %{public}@ from metadata: %{public}@", buf, 0x16u);
      char isKindOfClass = 0;
    }
  }

  return isKindOfClass & 1;
}

+ (id)versionFromMetadataTag:(CGImageMetadataTag *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (id)CGImageMetadataTagCopyValue(a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = +[NUVersion versionWithPackedUInt32:](NUVersion, "versionWithPackedUInt32:", [v3 integerValue]);
  }
  else
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_684);
    }
    id v5 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      BOOL v8 = v3;
      _os_log_impl(&dword_1A9892000, v5, OS_LOG_TYPE_DEFAULT, "Invalid HDRGainMap version tag value: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    char v4 = 0;
  }

  return v4;
}

+ (id)versionFromMeteorPlusMetadata:(CGImageMetadata *)a3
{
  if (a3)
  {
    id v5 = [NSString stringWithFormat:@"%@:%@", @"HDRGainMap", @"HDRGainMapVersion"];
    CGImageMetadataTagRef v6 = CGImageMetadataCopyTagWithPath(a3, 0, v5);
    if (v6)
    {
      int v7 = [a1 versionFromMetadataTag:v6];
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (id)versionFromFlexRangeMetadata:(CGImageMetadata *)a3
{
  if (a3)
  {
    id v5 = [NSString stringWithFormat:@"%@:%@", @"HDRToneMap", @"Version"];
    CGImageMetadataTagRef v6 = CGImageMetadataCopyTagWithPath(a3, 0, v5);
    if (v6)
    {
      int v7 = [a1 versionFromMetadataTag:v6];
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

@end