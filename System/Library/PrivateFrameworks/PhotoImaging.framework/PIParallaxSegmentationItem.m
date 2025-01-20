@interface PIParallaxSegmentationItem
+ (BOOL)writeImageBuffer:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (id)_backgroundImageLoadingBlock;
+ (id)_matteImageLoadingBlock;
+ (id)_settlingEffectDataLoadingBlock;
+ (id)dataForImageBuffer:(id)a3 error:(id *)a4;
+ (id)imageBufferFromData:(id)a3 error:(id *)a4;
+ (id)readImageBufferFromURL:(id)a3 error:(id *)a4;
+ (void)loadSettlingEffectVideoDataFromURL:(id)a3 completion:(id)a4;
- (BOOL)_loadSegmentationDataFromURL:(id)a3 error:(id *)a4 matteImageLoadingBlock:(id)a5 backgroundImageLoadingBlock:(id)a6 settingEffectDataLoadingBlock:(id)a7;
- (BOOL)isComplete;
- (BOOL)isSettlingEffectAvailable;
- (BOOL)loadContentsFromDictionary:(id)a3 hasMatte:(BOOL *)a4 hasBackground:(BOOL *)a5 error:(id *)a6;
- (BOOL)loadFromURL:(id)a3 error:(id *)a4;
- (BOOL)loadSegmentationDataFromURL:(id)a3 error:(id *)a4;
- (BOOL)saveAssetResourceToURL:(id)a3 error:(id *)a4;
- (BOOL)saveSegmentationDataToURL:(id)a3 error:(id *)a4;
- (BOOL)saveToURL:(id)a3 error:(id *)a4;
- (BOOL)settlingEffectFailedAnyGating;
- (BOOL)settlingEffectHasInterestingMotion;
- (BOOL)supportsBackgroundlessStyles;
- (BOOL)supportsManualClockIntersectionTolerance;
- (BOOL)supportsSegmentedStyles;
- (CGRect)settlingEffectNormalizedBounds;
- (NSArray)_availableStyles;
- (NSArray)_defaultStyles;
- (NSArray)availableStyles;
- (NSArray)defaultStyles;
- (NSArray)settlingEffectGatingDiagnostics;
- (NSData)settlingEffectVideoData;
- (NSDictionary)localLightData;
- (NSDictionary)scores;
- (NSString)debugDescription;
- (NSURL)fileURL;
- (NSURL)segmentationDataURL;
- (NUComposition)composition;
- (NUImageBuffer)segmentationBackground;
- (NUImageBuffer)segmentationConfidenceMap;
- (NUImageBuffer)segmentationMatte;
- (PFParallaxAssetRegions)regions;
- (PFParallaxAssetResource)livePhotoResource;
- (PFParallaxAssetResource)resource;
- (PFParallaxLayerStyle)originalStyle;
- (PFPosterLayout)defaultLayout;
- (PFPosterLayout)headroomLayout;
- (PFPosterLayout)originalLayout;
- (PFPosterLayout)settlingEffectLayout;
- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration;
- (PIParallaxColorAnalysis)colorAnalysis;
- (PIParallaxSegmentationItem)init;
- (PISegmentationContextInfo)contextInfo;
- (id)adjustedStyleForHeadroom:(id)a3;
- (id)availableStyleOfKind:(id)a3;
- (id)contentsDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultStyleOfKind:(id)a3;
- (id)suggestedStyleForCategory:(id)a3;
- (unint64_t)classification;
- (unint64_t)loadingState;
- (unint64_t)settlingEffectStatus;
- (unint64_t)version;
- (void)_invalidateCachedData;
- (void)_populateAvailableStyles;
- (void)_populateDefaultStyles;
- (void)resetSettlingEffectGatingFailure;
- (void)setClassification:(unint64_t)a3;
- (void)setColorAnalysis:(id)a3;
- (void)setComposition:(id)a3;
- (void)setContextInfo:(id)a3;
- (void)setDefaultLayout:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setHeadroomLayout:(id)a3;
- (void)setLivePhotoResource:(id)a3;
- (void)setLoadingState:(unint64_t)a3;
- (void)setLocalLightData:(id)a3;
- (void)setOriginalLayout:(id)a3;
- (void)setRegions:(id)a3;
- (void)setResource:(id)a3;
- (void)setScores:(id)a3;
- (void)setSegmentationBackground:(id)a3;
- (void)setSegmentationConfidenceMap:(id)a3;
- (void)setSegmentationDataURL:(id)a3;
- (void)setSegmentationMatte:(id)a3;
- (void)setSettlingEffectLayout:(id)a3;
- (void)setSettlingEffectNormalizedBounds:(CGRect)a3;
- (void)setSettlingEffectStatus:(unint64_t)a3;
- (void)setSettlingEffectVideoData:(id)a3;
- (void)set_availableStyles:(id)a3;
- (void)set_defaultStyles:(id)a3;
- (void)updateScores:(id)a3;
@end

@implementation PIParallaxSegmentationItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_segmentationDataURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->__defaultStyles, 0);
  objc_storeStrong((id *)&self->__availableStyles, 0);
  objc_storeStrong((id *)&self->_settlingEffectVideoData, 0);
  objc_storeStrong((id *)&self->_localLightData, 0);
  objc_storeStrong((id *)&self->_colorAnalysis, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_settlingEffectLayout, 0);
  objc_storeStrong((id *)&self->_headroomLayout, 0);
  objc_storeStrong((id *)&self->_originalLayout, 0);
  objc_storeStrong((id *)&self->_defaultLayout, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_segmentationBackground, 0);
  objc_storeStrong((id *)&self->_segmentationConfidenceMap, 0);
  objc_storeStrong((id *)&self->_segmentationMatte, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_livePhotoResource, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

- (void)setContextInfo:(id)a3
{
}

- (PISegmentationContextInfo)contextInfo
{
  return self->_contextInfo;
}

- (void)setSegmentationDataURL:(id)a3
{
}

- (NSURL)segmentationDataURL
{
  return self->_segmentationDataURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)set_defaultStyles:(id)a3
{
}

- (NSArray)_defaultStyles
{
  return self->__defaultStyles;
}

- (void)set_availableStyles:(id)a3
{
}

- (NSArray)_availableStyles
{
  return self->__availableStyles;
}

- (void)setLoadingState:(unint64_t)a3
{
  self->_loadingState = a3;
}

- (unint64_t)loadingState
{
  return self->_loadingState;
}

- (NSData)settlingEffectVideoData
{
  return self->_settlingEffectVideoData;
}

- (unint64_t)settlingEffectStatus
{
  return self->_settlingEffectStatus;
}

- (CGRect)settlingEffectNormalizedBounds
{
  double x = self->_settlingEffectNormalizedBounds.origin.x;
  double y = self->_settlingEffectNormalizedBounds.origin.y;
  double width = self->_settlingEffectNormalizedBounds.size.width;
  double height = self->_settlingEffectNormalizedBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLocalLightData:(id)a3
{
}

- (NSDictionary)localLightData
{
  return self->_localLightData;
}

- (void)setColorAnalysis:(id)a3
{
}

- (PIParallaxColorAnalysis)colorAnalysis
{
  return self->_colorAnalysis;
}

- (void)setScores:(id)a3
{
}

- (NSDictionary)scores
{
  return self->_scores;
}

- (void)setSettlingEffectLayout:(id)a3
{
}

- (PFPosterLayout)settlingEffectLayout
{
  return self->_settlingEffectLayout;
}

- (void)setHeadroomLayout:(id)a3
{
}

- (PFPosterLayout)headroomLayout
{
  return self->_headroomLayout;
}

- (void)setOriginalLayout:(id)a3
{
}

- (PFPosterLayout)originalLayout
{
  return self->_originalLayout;
}

- (void)setDefaultLayout:(id)a3
{
}

- (PFPosterLayout)defaultLayout
{
  return self->_defaultLayout;
}

- (void)setRegions:(id)a3
{
}

- (PFParallaxAssetRegions)regions
{
  return self->_regions;
}

- (void)setSegmentationBackground:(id)a3
{
}

- (NUImageBuffer)segmentationBackground
{
  return self->_segmentationBackground;
}

- (void)setSegmentationConfidenceMap:(id)a3
{
}

- (NUImageBuffer)segmentationConfidenceMap
{
  return self->_segmentationConfidenceMap;
}

- (void)setSegmentationMatte:(id)a3
{
}

- (NUImageBuffer)segmentationMatte
{
  return self->_segmentationMatte;
}

- (void)setClassification:(unint64_t)a3
{
  self->_classification = a3;
}

- (unint64_t)classification
{
  return self->_classification;
}

- (void)setComposition:(id)a3
{
}

- (NUComposition)composition
{
  return self->_composition;
}

- (void)setLivePhotoResource:(id)a3
{
}

- (PFParallaxAssetResource)livePhotoResource
{
  return self->_livePhotoResource;
}

- (void)setResource:(id)a3
{
}

- (PFParallaxAssetResource)resource
{
  return self->_resource;
}

- (void)updateScores:(id)a3
{
  id v4 = a3;
  v5 = [(PIParallaxSegmentationItem *)self scores];
  id v6 = (id)[v5 mutableCopy];

  [v6 addEntriesFromDictionary:v4];
  [(PIParallaxSegmentationItem *)self setScores:v6];
}

- (void)resetSettlingEffectGatingFailure
{
  v3 = [(PIParallaxSegmentationItem *)self scores];
  id v4 = (id)[v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F8D200]];
  [(PIParallaxSegmentationItem *)self setScores:v4];
}

- (BOOL)loadContentsFromDictionary:(id)a3 hasMatte:(BOOL *)a4 hasBackground:(BOOL *)a5 error:(id *)a6
{
  p_CGRect buf = &buf;
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  v12 = a3;
  if (!v12)
  {
    v52 = NUAssertLogger_4065();
    v19 = "contents != nil";
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "contents != nil");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v53;
      _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v54 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v13 = NUAssertLogger_4065();
    BOOL v55 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v55)
      {
        specific = dispatch_get_specific(*v54);
        v72 = (void *)MEMORY[0x1E4F29060];
        a6 = specific;
        v54 = [v72 callStackSymbols];
        self = [v54 componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543618;
        *(void *)((char *)&buf.origin.x + 4) = specific;
        WORD2(buf.origin.y) = 2114;
        *(void *)((char *)&buf.origin.y + 6) = self;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else if (v55)
    {
      specific = [MEMORY[0x1E4F29060] callStackSymbols];
      v54 = [specific componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v54;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
    }
    int v58 = _NUAssertFailHandler();
    goto LABEL_95;
  }
  if (!a4)
  {
    v56 = NUAssertLogger_4065();
    v19 = "hasMatte != NULL";
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v57 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "hasMatte != NULL");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v57;
      _os_log_error_impl(&dword_1A9680000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v54 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v13 = NUAssertLogger_4065();
    int v58 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v58)
      {
        specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v54 = [specific componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543362;
        *(void *)((char *)&buf.origin.x + 4) = v54;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
      }
LABEL_97:

      int v61 = _NUAssertFailHandler();
      goto LABEL_98;
    }
LABEL_95:
    if (v58)
    {
      specific = dispatch_get_specific(*v54);
      v73 = (void *)MEMORY[0x1E4F29060];
      a6 = specific;
      v54 = [v73 callStackSymbols];
      self = [v54 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543618;
      *(void *)((char *)&buf.origin.x + 4) = specific;
      WORD2(buf.origin.y) = 2114;
      *(void *)((char *)&buf.origin.y + 6) = self;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
    }
    goto LABEL_97;
  }
  if (!a5)
  {
    v59 = NUAssertLogger_4065();
    v19 = "hasBackground != NULL";
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "hasBackground != NULL");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v60;
      _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v54 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v13 = NUAssertLogger_4065();
    int v61 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v61)
      {
        specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v54 = [specific componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543362;
        *(void *)((char *)&buf.origin.x + 4) = v54;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
      }
LABEL_100:

      int v64 = _NUAssertFailHandler();
      goto LABEL_101;
    }
LABEL_98:
    if (v61)
    {
      specific = dispatch_get_specific(*v54);
      v74 = (void *)MEMORY[0x1E4F29060];
      a6 = specific;
      v54 = [v74 callStackSymbols];
      self = [v54 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543618;
      *(void *)((char *)&buf.origin.x + 4) = specific;
      WORD2(buf.origin.y) = 2114;
      *(void *)((char *)&buf.origin.y + 6) = self;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
    }
    goto LABEL_100;
  }
  if (!a6)
  {
    v62 = NUAssertLogger_4065();
    v19 = "error != NULL";
    a6 = (id *)&unk_1A980A000;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v63 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      LODWORD(buf.origin.x) = 138543362;
      *(void *)((char *)&buf.origin.x + 4) = v63;
      _os_log_error_impl(&dword_1A9680000, v62, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v54 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v13 = NUAssertLogger_4065();
    int v64 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!specific)
    {
      if (v64)
      {
        specific = [MEMORY[0x1E4F29060] callStackSymbols];
        v65 = [specific componentsJoinedByString:@"\n"];
        LODWORD(buf.origin.x) = 138543362;
        *(void *)((char *)&buf.origin.x + 4) = v65;
        _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);
      }
LABEL_103:

      v118 = v19;
      _NUAssertFailHandler();
      goto LABEL_104;
    }
LABEL_101:
    if (v64)
    {
      specific = dispatch_get_specific(*v54);
      v75 = (void *)MEMORY[0x1E4F29060];
      a6 = specific;
      v76 = [v75 callStackSymbols];
      self = [v76 componentsJoinedByString:@"\n"];
      LODWORD(buf.origin.x) = 138543618;
      *(void *)((char *)&buf.origin.x + 4) = specific;
      WORD2(buf.origin.y) = 2114;
      *(void *)((char *)&buf.origin.y + 6) = self;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);
    }
    goto LABEL_103;
  }
  v13 = v12;
  specific = [v12 objectForKeyedSubscript:@"version"];
  if (!specific)
  {
    v16 = [MEMORY[0x1E4F7A438] missingError:@"Missing version info" object:v13];
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid version info" object:specific];
    goto LABEL_11;
  }
  unint64_t v15 = [specific unsignedIntegerValue];
  if (v15 >= 0x33)
  {
    v16 = [MEMORY[0x1E4F7A438] unsupportedError:@"Unsupported version" object:specific];
LABEL_11:
    BOOL v17 = 0;
    *a6 = v16;
    goto LABEL_12;
  }
  p_CGRect buf = (CGRect *)v15;
  if (v15 < 3)
  {
    uint64_t v153 = 0;
    v154 = 0;
    goto LABEL_29;
  }
  v154 = objc_alloc_init(PISegmentationContextInfo);
  [(PISegmentationContextInfo *)v154 setVersion:p_buf];
  v19 = [v13 objectForKeyedSubscript:@"systemVersion"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v19 count] != 3)
  {
    v45 = (void *)MEMORY[0x1E4F7A438];
    v46 = @"Invalid system version info";
LABEL_48:
    v47 = [v45 invalidError:v46 object:v19];
LABEL_49:
    *a6 = v47;
LABEL_50:

LABEL_51:
    BOOL v17 = 0;
    v48 = v154;
    goto LABEL_228;
  }
  v20 = [v19 objectAtIndexedSubscript:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a6 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid system name" object:v20];

    goto LABEL_50;
  }
  v152 = v20;
  v21 = [v19 objectAtIndexedSubscript:1];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a6 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid system version" object:v21];
    int v150 = 1;
    goto LABEL_110;
  }
  v146 = v21;
  v22 = [v19 objectAtIndexedSubscript:2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v144 = v22;
    [(PISegmentationContextInfo *)v154 setSystemName:v152];
    [(PISegmentationContextInfo *)v154 setSystemVersion:v146];
    [(PISegmentationContextInfo *)v154 setSystemBuildVersion:v22];
    id v6 = [v13 objectForKeyedSubscript:@"sourceMode"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *a6 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid source mode" object:v6];
      int v150 = 1;
LABEL_108:

      v22 = v144;
      goto LABEL_109;
    }
    v138 = v6;
    -[PISegmentationContextInfo setSourceMode:](v154, "setSourceMode:", [v6 integerValue]);
    uint64_t v23 = [v13 objectForKeyedSubscript:@"segmentationDisabled"];
    obuint64_t j = (id)v23;
    if (v23)
    {
      v24 = (void *)v23;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *a6 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid segmentation disabled flag" object:v24];
        int v150 = 1;
        id v6 = v138;
LABEL_107:

        goto LABEL_108;
      }
      -[PISegmentationContextInfo setSegmentationDisabled:](v154, "setSegmentationDisabled:", [v24 BOOLValue]);
    }
    v25 = [v13 objectForKeyedSubscript:@"infillAlgorithm"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *a6 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid infill algorithm" object:v25];
      int v150 = 1;
      v67 = v25;
      id v6 = v138;
LABEL_106:

      goto LABEL_107;
    }
    v132 = v25;
    -[PISegmentationContextInfo setInfillAlgorithm:](v154, "setInfillAlgorithm:", [v25 integerValue]);
    uint64_t v26 = [v13 objectForKeyedSubscript:@"layoutConfiguration"];
    objc_opt_class();
    v135 = (void *)v26;
    id v6 = v138;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v170 = 0;
      id v148 = [MEMORY[0x1E4F8CE48] compoundDeviceConfigurationFromDictionary:v135 error:&v170];
      [(PISegmentationContextInfo *)v154 setLayoutConfiguration:v148];

      v27 = [v13 objectForKeyedSubscript:@"role"];
      if (v27)
      {
        id v149 = v27;
        -[PISegmentationContextInfo setRole:](v154, "setRole:", [v27 integerValue]);
        v27 = v149;
      }

      int v150 = 0;
      v28 = v135;
      goto LABEL_105;
    }
LABEL_104:
    objc_msgSend(MEMORY[0x1E4F7A438], "invalidError:object:", @"Invalid layout configuration", v135, v118);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    v28 = v135;
    int v150 = 1;
LABEL_105:

    v67 = v132;
    goto LABEL_106;
  }
  *a6 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid system build version" object:v22];
  int v150 = 1;
LABEL_109:

  v21 = v146;
LABEL_110:

  if (v150) {
    goto LABEL_51;
  }
  if ((unint64_t)p_buf >= 0x26)
  {
    v19 = [v13 objectForKeyedSubscript:@"settlingEffectStatus"];
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v153 = [v19 unsignedIntegerValue];

        goto LABEL_121;
      }
      v84 = (void *)MEMORY[0x1E4F7A438];
      v85 = @"Expected a number";
LABEL_138:
      v47 = [v84 mismatchError:v85 object:v19];
      goto LABEL_49;
    }
    v82 = (void *)MEMORY[0x1E4F7A438];
    v83 = @"Missing settling effect status";
LABEL_136:
    v47 = [v82 missingError:v83 object:v13];
    goto LABEL_49;
  }
  if ((unint64_t)p_buf < 0x22)
  {
    uint64_t v153 = 0;
    goto LABEL_29;
  }
  v19 = [v13 objectForKeyedSubscript:@"hasSettlingEffect"];
  if (!v19)
  {
    v82 = (void *)MEMORY[0x1E4F7A438];
    v83 = @"Missing settling effect info";
    goto LABEL_136;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v84 = (void *)MEMORY[0x1E4F7A438];
    v85 = @"Expected BOOLean";
    goto LABEL_138;
  }
  int v77 = [v19 BOOLValue];
  uint64_t v78 = 3;
  if (!v77) {
    uint64_t v78 = 1;
  }
  uint64_t v153 = v78;

  if ((unint64_t)p_buf < 0x24)
  {
LABEL_29:
    v29 = 0;
    double x = *MEMORY[0x1E4F8A248];
    double y = *(double *)(MEMORY[0x1E4F8A248] + 8);
    double width = *(double *)(MEMORY[0x1E4F8A248] + 16);
    double height = *(double *)(MEMORY[0x1E4F8A248] + 24);
    goto LABEL_30;
  }
LABEL_121:
  v19 = [v13 objectForKeyedSubscript:@"settlingEffectBounds"];
  if (!v19)
  {
    v82 = (void *)MEMORY[0x1E4F7A438];
    v83 = @"Missing settling effect bounds";
    goto LABEL_136;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v84 = (void *)MEMORY[0x1E4F7A438];
    v85 = @"Expected dictionary";
    goto LABEL_138;
  }
  memset(&buf, 0, sizeof(buf));
  v19 = v19;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_177;
  }
  BOOL v79 = CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v19, &buf);

  if (!v79)
  {
LABEL_177:
    v45 = (void *)MEMORY[0x1E4F7A438];
    v46 = @"Invalid settling effect bounds value";
    goto LABEL_48;
  }
  double x = buf.origin.x;
  double y = buf.origin.y;
  double width = buf.size.width;
  double height = buf.size.height;

  if ((unint64_t)p_buf < 0x27)
  {
    v29 = 0;
  }
  else
  {
    v80 = [v13 objectForKeyedSubscript:@"settlingEffectLayout"];
    if (v80)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v81 = [MEMORY[0x1E4F7A438] mismatchError:@"Expected layout dictionary" object:v80];
        goto LABEL_211;
      }
      v29 = [MEMORY[0x1E4F8CD10] layoutWithDictionaryRepresentation:v80];
      if (!v29)
      {
        v81 = [MEMORY[0x1E4F7A438] failureError:@"Failed to deserialize settling effect layout info" object:v80];
LABEL_211:
        *a6 = v81;

        goto LABEL_51;
      }
    }
    else
    {
      v29 = 0;
    }
  }
LABEL_30:
  v34 = [v13 objectForKeyedSubscript:@"classification"];
  if (!v34)
  {
    v49 = [MEMORY[0x1E4F7A438] missingError:@"Missing classification info" object:v13];
LABEL_54:
    BOOL v17 = 0;
    *a6 = v49;
    v48 = v154;
    goto LABEL_227;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v49 = [MEMORY[0x1E4F7A438] mismatchError:@"Expected classification string" object:v34];
    goto LABEL_54;
  }
  id v151 = v29;
  uint64_t v147 = PFPosterClassificationNamed();
  v35 = [v13 objectForKeyedSubscript:@"hasMatte"];
  if (!v35)
  {
    v50 = [MEMORY[0x1E4F7A438] missingError:@"Missing matte image info" object:v13];
LABEL_58:
    BOOL v17 = 0;
    *a6 = v50;
    v48 = v154;
    goto LABEL_226;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v50 = [MEMORY[0x1E4F7A438] mismatchError:@"Expected BOOLean" object:v35];
    goto LABEL_58;
  }
  v145 = v35;
  *a4 = [v35 BOOLValue];
  v36 = [v13 objectForKeyedSubscript:@"hasBackground"];
  if (!v36)
  {
    v51 = [MEMORY[0x1E4F7A438] missingError:@"Missing background image info" object:v13];
LABEL_63:
    BOOL v17 = 0;
    *a6 = v51;
    v48 = v154;
    goto LABEL_225;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v51 = [MEMORY[0x1E4F7A438] mismatchError:@"Expected BOOLean" object:v36];
    goto LABEL_63;
  }
  *a5 = [v36 BOOLValue];
  uint64_t v37 = [v13 objectForKeyedSubscript:@"regions"];
  v38 = (void *)v37;
  if (!v37) {
    goto LABEL_39;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1E4F7A438] mismatchError:@"Expected regions dictionary" object:v38];
    BOOL v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_91:
    v48 = v154;
    goto LABEL_224;
  }
  id v169 = 0;
  uint64_t v37 = +[PISegmentationLayoutRegions regionsFromDictionary:v38 error:&v169];
  if (!v37)
  {
    v68 = (void *)MEMORY[0x1E4F7A438];
    id v69 = v169;
    [v68 errorWithCode:1 reason:@"Failed to deserialize regions info" object:v38 underlyingError:v69];
    v70 = v38;
    id v71 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v17 = 0;
    *a6 = v71;
    v38 = v70;
    goto LABEL_91;
  }
LABEL_39:
  v139 = (void *)v37;
  uint64_t v39 = [v13 objectForKeyedSubscript:@"layout"];
  v40 = (void *)v39;
  if (v39)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v39 = [MEMORY[0x1E4F8CD10] layoutWithDictionaryRepresentation:v40];
      if (v39) {
        goto LABEL_42;
      }
      v66 = [MEMORY[0x1E4F7A438] failureError:@"Failed to deserialize layout info" object:v40];
    }
    else
    {
      v66 = [MEMORY[0x1E4F7A438] mismatchError:@"Expected layout dictionary" object:v40];
    }
    BOOL v17 = 0;
    *a6 = v66;
    v48 = v154;
    v86 = v40;
    v35 = v145;
    goto LABEL_223;
  }
LABEL_42:
  v130 = v40;
  v131 = (void *)v39;
  v129 = v38;
  if ((unint64_t)p_buf < 0x32)
  {
    v134 = 0;
  }
  else
  {
    uint64_t v41 = [v13 objectForKeyedSubscript:@"headroomLayout"];
    if (v41)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v44 = [MEMORY[0x1E4F7A438] mismatchError:@"Expected headroom layout dictionary" object:v41];
        v43 = (void *)v41;
        goto LABEL_175;
      }
      v133 = (void *)v41;
      uint64_t v42 = [MEMORY[0x1E4F8CD10] layoutWithDictionaryRepresentation:v41];
      if (!v42)
      {
        v43 = (void *)v41;
        v44 = [MEMORY[0x1E4F7A438] failureError:@"Failed to deserialize headroom layout info" object:v41];
        v38 = v129;
LABEL_175:
        BOOL v17 = 0;
        *a6 = v44;
        v48 = v154;
        v35 = v145;
        goto LABEL_222;
      }
    }
    else
    {
      v133 = 0;
      uint64_t v42 = 0;
    }

    v134 = (void *)v42;
    v38 = v129;
  }
  uint64_t v87 = [v13 objectForKeyedSubscript:@"scores"];
  v128 = (void *)v87;
  if (v87)
  {
    v88 = (void *)v87;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1E4F7A438] mismatchError:@"Expected score dictionary" object:v88];
      BOOL v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      v48 = v154;
      v35 = v145;
      goto LABEL_221;
    }
    v127 = v36;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    id obja = v88;
    uint64_t v89 = [obja countByEnumeratingWithState:&v165 objects:v173 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v136 = *(void *)v166;
      do
      {
        for (uint64_t i = 0; i != v90; ++i)
        {
          if (*(void *)v166 != v136) {
            objc_enumerationMutation(obja);
          }
          uint64_t v92 = *(void *)(*((void *)&v165 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            *a6 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid score key" object:v92];
            goto LABEL_180;
          }
          v93 = [obja objectForKeyedSubscript:v92];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            *a6 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid score value" object:v93];

LABEL_180:
LABEL_219:
            BOOL v17 = 0;
            v48 = v154;
            v35 = v145;
            v36 = v127;
            goto LABEL_220;
          }
        }
        uint64_t v90 = [obja countByEnumeratingWithState:&v165 objects:v173 count:16];
      }
      while (v90);
    }

    v36 = v127;
  }
  if ((unint64_t)p_buf >= 7)
  {
    uint64_t v94 = [v13 objectForKeyedSubscript:@"colorAnalysis"];
    v127 = v36;
    if (v94)
    {
      v95 = (void *)v94;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v99 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid color analysis info" object:v95];
        goto LABEL_193;
      }
      id v164 = 0;
      v96 = v95;
      id objb = +[PIParallaxColorAnalysis loadFromContentsDictionary:v95 error:&v164];
      if (!objb)
      {
        v97 = (void *)MEMORY[0x1E4F7A438];
        id v98 = v164;
        id v99 = [v97 errorWithCode:1 reason:@"Failed to deserialize color analysis info" object:v95 underlyingError:v98];

LABEL_193:
        *a6 = v99;
LABEL_218:

        goto LABEL_219;
      }
    }
    else
    {
      v96 = 0;
      id objb = 0;
    }
    id v137 = 0;
    goto LABEL_183;
  }
  uint64_t v100 = [v13 objectForKeyedSubscript:@"styles"];
  if (!v100)
  {
    id v137 = 0;
    v109 = 0;
    v107 = 0;
    uint64_t v110 = v153;
    v48 = v154;
    goto LABEL_190;
  }
  v95 = (void *)v100;
  v127 = v36;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a6 = [MEMORY[0x1E4F7A438] mismatchError:@"Expected styles array" object:v95];
    goto LABEL_218;
  }
  v120 = v95;
  PFParallaxLayerStyleSupportedKinds();
  id objc = (id)objc_claimAutoreleasedReturnValue();
  id v137 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((unint64_t)p_buf <= 3)
  {
    long long v162 = 0uLL;
    long long v163 = 0uLL;
    long long v160 = 0uLL;
    long long v161 = 0uLL;
    id v123 = v95;
    uint64_t v101 = [v123 countByEnumeratingWithState:&v160 objects:v172 count:16];
    if (v101)
    {
      uint64_t v102 = v101;
      uint64_t v125 = *(void *)v161;
      while (2)
      {
        for (uint64_t j = 0; j != v102; ++j)
        {
          if (*(void *)v161 != v125) {
            objc_enumerationMutation(v123);
          }
          uint64_t v104 = *(void *)(*((void *)&v160 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ![objc containsObject:v104])
          {
            v115 = (void *)MEMORY[0x1E4F7A438];
            uint64_t v116 = v104;
            goto LABEL_213;
          }
          id v105 = objc_alloc(MEMORY[0x1E4F8CCA8]);
          v106 = (void *)[v105 initWithKind:v104 parameters:MEMORY[0x1E4F1CC08] colorSuggestions:MEMORY[0x1E4F1CBF0]];
          [v137 addObject:v106];
        }
        uint64_t v102 = [v123 countByEnumeratingWithState:&v160 objects:v172 count:16];
        if (v102) {
          continue;
        }
        break;
      }
    }
    goto LABEL_206;
  }
  long long v158 = 0uLL;
  long long v159 = 0uLL;
  long long v156 = 0uLL;
  long long v157 = 0uLL;
  id v119 = v95;
  uint64_t v121 = [v119 countByEnumeratingWithState:&v156 objects:v171 count:16];
  if (!v121) {
    goto LABEL_206;
  }
  uint64_t v122 = *(void *)v157;
  while (2)
  {
    for (uint64_t k = 0; k != v121; ++k)
    {
      if (*(void *)v157 != v122) {
        objc_enumerationMutation(v119);
      }
      uint64_t v112 = *(void *)(*((void *)&v156 + 1) + 8 * k);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v115 = (void *)MEMORY[0x1E4F7A438];
        uint64_t v116 = v112;
LABEL_213:
        *a6 = [v115 invalidError:@"Invalid style value" object:v116];
        goto LABEL_217;
      }
      id v155 = 0;
      v113 = [MEMORY[0x1E4F8CCA8] styleWithDictionary:v112 error:&v155];
      id v126 = v155;
      if (!v113)
      {
        v117 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Invalid style dictionary" object:v112 underlyingError:v126];
LABEL_216:
        *a6 = v117;

LABEL_217:
        v95 = v120;

        goto LABEL_218;
      }
      v114 = [v113 kind];
      char v124 = [objc containsObject:v114];

      if ((v124 & 1) == 0)
      {
        v117 = [MEMORY[0x1E4F7A438] invalidError:@"Unsupported style kind" object:v113];
        goto LABEL_216;
      }
      [v137 addObject:v113];
    }
    uint64_t v121 = [v119 countByEnumeratingWithState:&v156 objects:v171 count:16];
    if (v121) {
      continue;
    }
    break;
  }
LABEL_206:
  v96 = v120;

  id objb = 0;
LABEL_183:

  if ((unint64_t)p_buf < 0xE)
  {
    v107 = 0;
  }
  else
  {
    v107 = [v13 objectForKeyedSubscript:@"localLightData"];
    if (v107)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x1E4F7A438] invalidError:@"Invalid local light data" object:v107];
        BOOL v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        v48 = v154;
        v36 = v127;
        v108 = v137;
        v109 = objb;
        goto LABEL_191;
      }
    }
  }
  uint64_t v110 = v153;
  v48 = v154;
  v36 = v127;
  v109 = objb;
LABEL_190:
  [(PIParallaxSegmentationItem *)self setClassification:v147];
  [(PIParallaxSegmentationItem *)self setRegions:v139];
  [(PIParallaxSegmentationItem *)self setOriginalLayout:v131];
  [(PIParallaxSegmentationItem *)self setHeadroomLayout:v134];
  [(PIParallaxSegmentationItem *)self setScores:v128];
  [(PIParallaxSegmentationItem *)self setColorAnalysis:v109];
  v108 = v137;
  [(PIParallaxSegmentationItem *)self set_availableStyles:v137];
  [(PIParallaxSegmentationItem *)self setLocalLightData:v107];
  [(PIParallaxSegmentationItem *)self setContextInfo:v48];
  [(PIParallaxSegmentationItem *)self setSettlingEffectStatus:v110];
  -[PIParallaxSegmentationItem setSettlingEffectNormalizedBounds:](self, "setSettlingEffectNormalizedBounds:", x, y, width, height);
  [(PIParallaxSegmentationItem *)self setSettlingEffectLayout:v151];
  BOOL v17 = 1;
LABEL_191:

  v35 = v145;
LABEL_220:
  v38 = v129;
LABEL_221:
  v43 = v134;

LABEL_222:
  v86 = v130;
LABEL_223:

LABEL_224:
LABEL_225:

LABEL_226:
  v29 = v151;
LABEL_227:

LABEL_228:
LABEL_12:

  return v17;
}

- (BOOL)supportsManualClockIntersectionTolerance
{
  return [(PIParallaxSegmentationItem *)self version] > 0x20;
}

- (unint64_t)version
{
  v2 = [(PIParallaxSegmentationItem *)self contextInfo];
  unint64_t v3 = [v2 version];

  return v3;
}

- (id)contentsDictionary
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PIParallaxSegmentationItem *)self contextInfo];
  if (!v4)
  {
    uint64_t v39 = NUAssertLogger_4065();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = [NSString stringWithFormat:@"Missing context info!"];
      *(_DWORD *)CGRect buf = 138543362;
      v54 = v40;
      _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v41 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v43 = NUAssertLogger_4065();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v44)
      {
        v47 = dispatch_get_specific(*v41);
        v48 = (void *)MEMORY[0x1E4F29060];
        id v49 = v47;
        v50 = [v48 callStackSymbols];
        v51 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v54 = v47;
        __int16 v55 = 2114;
        v56 = v51;
        _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v44)
    {
      v45 = [MEMORY[0x1E4F29060] callStackSymbols];
      v46 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v54 = v46;
      _os_log_error_impl(&dword_1A9680000, v43, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v5 = v4;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "version"));
  [v3 setObject:v6 forKeyedSubscript:@"version"];

  [(PIParallaxSegmentationItem *)self classification];
  v7 = PFPosterClassificationName();
  [v3 setObject:v7 forKeyedSubscript:@"classification"];

  v8 = NSNumber;
  v9 = [(PIParallaxSegmentationItem *)self segmentationMatte];
  v10 = [v8 numberWithInt:v9 != 0];
  [v3 setObject:v10 forKeyedSubscript:@"hasMatte"];

  v11 = NSNumber;
  v12 = [(PIParallaxSegmentationItem *)self segmentationBackground];
  v13 = [v11 numberWithInt:v12 != 0];
  [v3 setObject:v13 forKeyedSubscript:@"hasBackground"];

  v14 = [(PIParallaxSegmentationItem *)self regions];
  if (v14)
  {
    unint64_t v15 = [(PIParallaxSegmentationItem *)self regions];
    v16 = +[PISegmentationLayoutRegions dictionaryFromRegions:v15];
    [v3 setObject:v16 forKeyedSubscript:@"regions"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"regions"];
  }

  BOOL v17 = [(PIParallaxSegmentationItem *)self originalLayout];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"layout"];

  v19 = [(PIParallaxSegmentationItem *)self scores];
  [v3 setObject:v19 forKeyedSubscript:@"scores"];

  v20 = [(PIParallaxSegmentationItem *)self colorAnalysis];
  v21 = [v20 contentsDictionary];
  [v3 setObject:v21 forKeyedSubscript:@"colorAnalysis"];

  v22 = [(PIParallaxSegmentationItem *)self localLightData];
  [v3 setObject:v22 forKeyedSubscript:@"localLightData"];

  uint64_t v23 = [v5 systemName];
  v52[0] = v23;
  v24 = [v5 systemVersion];
  v52[1] = v24;
  v25 = [v5 systemBuildVersion];
  v52[2] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
  [v3 setObject:v26 forKeyedSubscript:@"systemVersion"];

  v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "sourceMode"));
  [v3 setObject:v27 forKeyedSubscript:@"sourceMode"];

  v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "infillAlgorithm"));
  [v3 setObject:v28 forKeyedSubscript:@"infillAlgorithm"];

  v29 = [v5 layoutConfiguration];
  v30 = [v29 dictionaryRepresentation];
  [v3 setObject:v30 forKeyedSubscript:@"layoutConfiguration"];

  if ([v5 segmentationDisabled]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"segmentationDisabled"];
  }
  v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PIParallaxSegmentationItem settlingEffectStatus](self, "settlingEffectStatus"));
  [v3 setObject:v31 forKeyedSubscript:@"settlingEffectStatus"];

  [(PIParallaxSegmentationItem *)self settlingEffectNormalizedBounds];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v59);
  [v3 setObject:DictionaryRepresentation forKeyedSubscript:@"settlingEffectBounds"];

  v33 = [(PIParallaxSegmentationItem *)self settlingEffectLayout];
  v34 = [v33 dictionaryRepresentation];
  [v3 setObject:v34 forKeyedSubscript:@"settlingEffectLayout"];

  v35 = [(PIParallaxSegmentationItem *)self headroomLayout];
  v36 = [v35 dictionaryRepresentation];
  [v3 setObject:v36 forKeyedSubscript:@"headroomLayout"];

  uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "role"));
  [v3 setObject:v37 forKeyedSubscript:@"role"];

  return v3;
}

- (BOOL)_loadSegmentationDataFromURL:(id)a3 error:(id *)a4 matteImageLoadingBlock:(id)a5 backgroundImageLoadingBlock:(id)a6 settingEffectDataLoadingBlock:(id)a7
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  unint64_t v15 = a3;
  v16 = (void (**)(void, void *))a5;
  BOOL v17 = (const void **)a6;
  id v18 = a7;
  if (!v15)
  {
    uint64_t v41 = NUAssertLogger_4065();
    v35 = "archiveURL != nil";
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "archiveURL != nil");
      uint64_t v42 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      v91 = v42;
      _os_log_error_impl(&dword_1A9680000, v41, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v17 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    unint64_t v15 = NUAssertLogger_4065();
    BOOL v44 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v44)
      {
        v66 = dispatch_get_specific(*v17);
        v67 = (void *)MEMORY[0x1E4F29060];
        a7 = v66;
        BOOL v17 = [v67 callStackSymbols];
        v7 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v91 = (const void **)v66;
        __int16 v92 = 2114;
        v93 = v7;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v44)
    {
      v45 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v17 = [v45 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v91 = v17;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v49 = _NUAssertFailHandler();
    goto LABEL_67;
  }
  if (!a4)
  {
    v46 = NUAssertLogger_4065();
    v35 = "error != NULL";
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v47 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      v91 = v47;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v17 = (const void **)MEMORY[0x1E4F7A308];
    v48 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    unint64_t v15 = NUAssertLogger_4065();
    int v49 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v48)
    {
      if (v49)
      {
        v50 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v17 = [v50 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        v91 = v17;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_69:

      int v54 = _NUAssertFailHandler();
      goto LABEL_70;
    }
LABEL_67:
    if (v49)
    {
      v68 = dispatch_get_specific(*v17);
      id v69 = (void *)MEMORY[0x1E4F29060];
      a7 = v68;
      BOOL v17 = [v69 callStackSymbols];
      v7 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      v91 = (const void **)v68;
      __int16 v92 = 2114;
      v93 = v7;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_69;
  }
  if (!v16)
  {
    v51 = NUAssertLogger_4065();
    v35 = "matteImageLoadingBlock != nil";
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "matteImageLoadingBlock != nil");
      v52 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      v91 = v52;
      _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v17 = (const void **)MEMORY[0x1E4F7A308];
    v53 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    unint64_t v15 = NUAssertLogger_4065();
    int v54 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v53)
    {
      if (v54)
      {
        __int16 v55 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v17 = [v55 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        v91 = v17;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_72:

      int v59 = _NUAssertFailHandler();
      goto LABEL_73;
    }
LABEL_70:
    if (v54)
    {
      v70 = dispatch_get_specific(*v17);
      id v71 = (void *)MEMORY[0x1E4F29060];
      a7 = v70;
      BOOL v17 = [v71 callStackSymbols];
      v7 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      v91 = (const void **)v70;
      __int16 v92 = 2114;
      v93 = v7;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_72;
  }
  if (!v17)
  {
    v56 = NUAssertLogger_4065();
    v35 = "backgroundImageLoadingBlock != nil";
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "backgroundImageLoadingBlock != nil");
      uint64_t v57 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      v91 = v57;
      _os_log_error_impl(&dword_1A9680000, v56, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v17 = (const void **)MEMORY[0x1E4F7A308];
    int v58 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    unint64_t v15 = NUAssertLogger_4065();
    int v59 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v58)
    {
      if (v59)
      {
        v60 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v17 = [v60 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        v91 = v17;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_75:

      int v64 = _NUAssertFailHandler();
      goto LABEL_76;
    }
LABEL_73:
    if (v59)
    {
      v72 = dispatch_get_specific(*v17);
      v73 = (void *)MEMORY[0x1E4F29060];
      a7 = v72;
      BOOL v17 = [v73 callStackSymbols];
      v7 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      v91 = (const void **)v72;
      __int16 v92 = 2114;
      v93 = v7;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_75;
  }
  a7 = v18;
  if (!v18)
  {
    int v61 = NUAssertLogger_4065();
    v35 = "settingEffectDataLoadingBlock != nil";
    a7 = &unk_1A980A000;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "settingEffectDataLoadingBlock != nil");
      v62 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      v91 = v62;
      _os_log_error_impl(&dword_1A9680000, v61, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v17 = (const void **)MEMORY[0x1E4F7A308];
    v63 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    unint64_t v15 = NUAssertLogger_4065();
    int v64 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v63)
    {
      if (v64)
      {
        v65 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v17 = [v65 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        v91 = v17;
        _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_78:

      _NUAssertFailHandler();
      goto LABEL_79;
    }
LABEL_76:
    if (v64)
    {
      v74 = dispatch_get_specific(*v17);
      v75 = (void *)MEMORY[0x1E4F29060];
      a7 = v74;
      BOOL v17 = [v75 callStackSymbols];
      v7 = [v17 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      v91 = (const void **)v74;
      __int16 v92 = 2114;
      v93 = v7;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_78;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F8CBA0]) initWithArchiveURL:v15];
  [v7 setCompression:-1];
  id v89 = 0;
  char v19 = [v7 openForReading:&v89];
  id v20 = v89;
  v21 = v20;
  if (v19)
  {
    v80 = v16;
    id v87 = 0;
    id v88 = 0;
    id v86 = v20;
    char v22 = [v7 decodeData:&v88 filename:&v87 error:&v86];
    id v81 = v88;
    id v23 = v87;
    id v24 = v86;

    if (v22)
    {
      v8 = v23;
      if ([v23 isEqualToString:@"contents.plist"])
      {
        id v78 = v23;
        id v85 = 0;
        uint64_t v25 = [MEMORY[0x1E4F28F98] propertyListWithData:v81 options:0 format:0 error:&v85];
        id v26 = v85;

        BOOL v79 = (void *)v25;
        if (v25)
        {
          v9 = v81;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v84 = 0;
            id v83 = 0;
            BOOL v27 = [(PIParallaxSegmentationItem *)self loadContentsFromDictionary:v79 hasMatte:(char *)&v84 + 1 hasBackground:&v84 error:&v83];
            id v28 = v83;

            if (v27)
            {
              int v77 = v28;
              v8 = v78;
              if (HIBYTE(v84))
              {
                v29 = v79;
                v30 = v80[2](v80, v7);
                if (![v30 success])
                {
                  uint64_t v37 = (void *)MEMORY[0x1E4F7A438];
                  v38 = [v30 error];
                  uint64_t v39 = @"Failed to load matte image";
                  goto LABEL_34;
                }
                v31 = [v30 object];
                [(PIParallaxSegmentationItem *)self setSegmentationMatte:v31];

                v8 = v78;
              }
              if (!(_BYTE)v84)
              {
LABEL_18:
                if (![(PIParallaxSegmentationItem *)self isSettlingEffectAvailable]) {
                  goto LABEL_21;
                }
                v29 = v79;
                v30 = (*((void (**)(id, void *))a7 + 2))(a7, v7);
                if ([v30 success])
                {
                  v33 = [v30 object];
                  [(PIParallaxSegmentationItem *)self setSettlingEffectVideoData:v33];

                  v8 = v78;
LABEL_21:
                  [(PIParallaxSegmentationItem *)self setSegmentationDataURL:v15];
                  id v82 = v77;
                  char v34 = [v7 close:&v82];
                  id v76 = v82;

                  if (v34)
                  {
LABEL_24:
                    BOOL v36 = 1;
                    id v24 = v76;
LABEL_36:

                    goto LABEL_37;
                  }
                  NULogger_4131();
                  v35 = (char *)objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
                  {
LABEL_23:

                    goto LABEL_24;
                  }
LABEL_79:
                  *(_DWORD *)CGRect buf = 138477827;
                  v91 = (const void **)v76;
                  _os_log_error_impl(&dword_1A9680000, (os_log_t)v35, OS_LOG_TYPE_ERROR, "Failed to close the stream due to %{private}@", buf, 0xCu);
                  goto LABEL_23;
                }
                uint64_t v37 = (void *)MEMORY[0x1E4F7A438];
                v38 = [v30 error];
                uint64_t v39 = @"Failed to load settling effect data";
                goto LABEL_34;
              }
              v29 = v79;
              v30 = ((void (*)(const void **, void *))v17[2])(v17, v7);
              if ([v30 success])
              {
                v32 = [v30 object];
                [(PIParallaxSegmentationItem *)self setSegmentationBackground:v32];

                v8 = v78;
                goto LABEL_18;
              }
              uint64_t v37 = (void *)MEMORY[0x1E4F7A438];
              v38 = [v30 error];
              uint64_t v39 = @"Failed to load background image";
LABEL_34:
              *a4 = [v37 errorWithCode:1 reason:v39 object:v29 underlyingError:v38];

              v9 = v81;
              BOOL v36 = 0;
              id v24 = v77;
              goto LABEL_35;
            }
            [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load contents dictionary" object:v79 underlyingError:v28];
            BOOL v36 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            id v24 = v28;
          }
          else
          {
            [MEMORY[0x1E4F7A438] invalidError:@"Invalid contents plist" object:v79];
            BOOL v36 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            id v24 = v26;
          }
        }
        else
        {
          [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to deserialize contents plist" object:v81 underlyingError:v26];
          BOOL v36 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          id v24 = v26;
          v9 = v81;
        }
LABEL_35:
        v8 = v78;
        goto LABEL_36;
      }
      [MEMORY[0x1E4F7A438] invalidError:@"Expected contents.plist data" object:v23];
      BOOL v36 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v81;
    }
    else
    {
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to decode contents plist data" object:v7 underlyingError:v24];
      BOOL v36 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v81;
      v8 = v23;
    }
LABEL_37:

    v21 = v24;
    v16 = v80;
    goto LABEL_38;
  }
  [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to read segmentation archive" object:v15 underlyingError:v20];
  BOOL v36 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:

  return v36;
}

- (BOOL)loadSegmentationDataFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _matteImageLoadingBlock];
  v8 = [(id)objc_opt_class() _backgroundImageLoadingBlock];
  v9 = [(id)objc_opt_class() _settlingEffectDataLoadingBlock];
  LOBYTE(a4) = [(PIParallaxSegmentationItem *)self _loadSegmentationDataFromURL:v6 error:a4 matteImageLoadingBlock:v7 backgroundImageLoadingBlock:v8 settingEffectDataLoadingBlock:v9];

  return (char)a4;
}

- (BOOL)saveSegmentationDataToURL:(id)a3 error:(id *)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v47 = NUAssertLogger_4065();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "archiveURL != nil");
      v48 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      BOOL v79 = v48;
      _os_log_error_impl(&dword_1A9680000, v47, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int v49 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v51 = NUAssertLogger_4065();
    BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v52)
      {
        v60 = dispatch_get_specific(*v49);
        int v61 = (void *)MEMORY[0x1E4F29060];
        id v62 = v60;
        int v49 = [v61 callStackSymbols];
        v63 = [v49 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        BOOL v79 = (const void **)v60;
        __int16 v80 = 2114;
        id v81 = v63;
        _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v52)
    {
      v53 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v49 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      BOOL v79 = v49;
      _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v57 = _NUAssertFailHandler();
    goto LABEL_53;
  }
  if (!a4)
  {
    int v54 = NUAssertLogger_4065();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      __int16 v55 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      BOOL v79 = v55;
      _os_log_error_impl(&dword_1A9680000, v54, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    int v49 = (const void **)MEMORY[0x1E4F7A308];
    v56 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v51 = NUAssertLogger_4065();
    int v57 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (!v56)
    {
      if (v57)
      {
        int v58 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        BOOL v79 = v59;
        _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_55;
    }
LABEL_53:
    if (v57)
    {
      int v64 = dispatch_get_specific(*v49);
      v65 = (void *)MEMORY[0x1E4F29060];
      id v66 = v64;
      v67 = [v65 callStackSymbols];
      v68 = [v67 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      BOOL v79 = (const void **)v64;
      __int16 v80 = 2114;
      id v81 = v68;
      _os_log_error_impl(&dword_1A9680000, v51, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_55:

    _NUAssertFailHandler();
  }
  v7 = v6;
  v8 = [(PIParallaxSegmentationItem *)self segmentationDataURL];

  if (!v8) {
    goto LABEL_7;
  }
  v9 = [(PIParallaxSegmentationItem *)self segmentationDataURL];
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    v12 = [(PIParallaxSegmentationItem *)self segmentationDataURL];
    char v13 = [v11 copyItemAtURL:v12 toURL:v7 error:0];

    if ((v13 & 1) == 0)
    {
LABEL_7:
      unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F8CBA0]) initWithArchiveURL:v7];
      [v15 setCompression:-1];
      id v77 = 0;
      char v16 = [v15 openForWriting:&v77];
      id v17 = v77;
      if ((v16 & 1) == 0)
      {
        [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to write segmentation archive" object:v7 underlyingError:v17];
        BOOL v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

        goto LABEL_38;
      }
      id v18 = [(PIParallaxSegmentationItem *)self contentsDictionary];
      id v76 = 0;
      char v19 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v18 format:200 options:0 error:&v76];
      id v20 = v76;

      if (!v19)
      {
        BOOL v36 = (void *)MEMORY[0x1E4F7A438];
        uint64_t v37 = @"Failed to serialize contents plist";
        v38 = v18;
        goto LABEL_25;
      }
      id v75 = v20;
      char v21 = [v15 encodeData:v19 filename:@"contents.plist" error:&v75];
      id v22 = v75;

      if ((v21 & 1) == 0)
      {
        [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to archive contents plist data" object:v19 underlyingError:v22];
        BOOL v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        id v20 = v22;
        goto LABEL_36;
      }
      id v23 = [(PIParallaxSegmentationItem *)self segmentationMatte];

      if (v23)
      {
        id v24 = objc_opt_class();
        uint64_t v25 = [(PIParallaxSegmentationItem *)self segmentationMatte];
        id v74 = 0;
        id v26 = [v24 dataForImageBuffer:v25 error:&v74];
        id v20 = v74;

        if (!v26)
        {
          uint64_t v39 = (void *)MEMORY[0x1E4F7A438];
          v40 = [(PIParallaxSegmentationItem *)self segmentationMatte];
          uint64_t v41 = @"Failed to write segmentation matte";
          goto LABEL_30;
        }
        id v73 = v20;
        char v27 = [v15 encodeData:v26 filename:@"matte.heic" error:&v73];
        id v22 = v73;

        if ((v27 & 1) == 0)
        {
          uint64_t v42 = (void *)MEMORY[0x1E4F7A438];
          v43 = @"Failed to archive segmentation matte data";
LABEL_33:
          *a4 = [v42 errorWithCode:1 reason:v43 object:v26 underlyingError:v22];
          id v20 = v22;
          goto LABEL_34;
        }
      }
      id v28 = [(PIParallaxSegmentationItem *)self segmentationBackground];

      if (!v28)
      {
LABEL_18:
        v32 = [(PIParallaxSegmentationItem *)self settlingEffectVideoData];

        if (!v32)
        {
LABEL_21:
          id v69 = v22;
          char v35 = [v15 close:&v69];
          id v20 = v69;

          if (v35)
          {
            [(PIParallaxSegmentationItem *)self setSegmentationDataURL:v7];
            BOOL v14 = 1;
LABEL_36:

            id v17 = v20;
            goto LABEL_37;
          }
          BOOL v36 = (void *)MEMORY[0x1E4F7A438];
          uint64_t v37 = @"Failed to close archive file";
          v38 = v15;
LABEL_25:
          [v36 errorWithCode:1 reason:v37 object:v38 underlyingError:v20];
          BOOL v14 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        v33 = [(PIParallaxSegmentationItem *)self settlingEffectVideoData];
        id v70 = v22;
        char v34 = [v15 encodeData:v33 filename:@"settlingEffect.mov" error:&v70];
        id v20 = v70;

        if (v34)
        {
          id v22 = v20;
          goto LABEL_21;
        }
        v45 = (void *)MEMORY[0x1E4F7A438];
        v46 = [(PIParallaxSegmentationItem *)self settlingEffectVideoData];
        *a4 = [v45 errorWithCode:1 reason:@"Failed to archive settling effect video data" object:v46 underlyingError:v20];

LABEL_35:
        BOOL v14 = 0;
        goto LABEL_36;
      }
      v29 = objc_opt_class();
      v30 = [(PIParallaxSegmentationItem *)self segmentationBackground];
      id v72 = 0;
      id v26 = [v29 dataForImageBuffer:v30 error:&v72];
      id v20 = v72;

      if (v26)
      {
        id v71 = v20;
        char v31 = [v15 encodeData:v26 filename:@"background.heic" error:&v71];
        id v22 = v71;

        if (v31)
        {

          goto LABEL_18;
        }
        uint64_t v42 = (void *)MEMORY[0x1E4F7A438];
        v43 = @"Failed to archive segmentation background data";
        goto LABEL_33;
      }
      uint64_t v39 = (void *)MEMORY[0x1E4F7A438];
      v40 = [(PIParallaxSegmentationItem *)self segmentationBackground];
      uint64_t v41 = @"Failed to write segmentation background";
LABEL_30:
      *a4 = [v39 errorWithCode:1 reason:v41 object:v40 underlyingError:v20];

LABEL_34:
      goto LABEL_35;
    }
  }
  BOOL v14 = 1;
LABEL_38:

  return v14;
}

- (BOOL)saveAssetResourceToURL:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    char v19 = NUAssertLogger_4065();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "fileURL != nil");
      id v20 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      v51 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    char v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v23 = NUAssertLogger_4065();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        uint64_t v37 = dispatch_get_specific(*v21);
        v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        char v21 = [v38 callStackSymbols];
        v40 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        v51 = (const void **)v37;
        __int16 v52 = 2114;
        v53 = v40;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v21 = [v25 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      v51 = v21;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v29 = _NUAssertFailHandler();
    goto LABEL_29;
  }
  if (!a4)
  {
    id v26 = NUAssertLogger_4065();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      char v27 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      v51 = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    char v21 = (const void **)MEMORY[0x1E4F7A308];
    id v28 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v23 = NUAssertLogger_4065();
    int v29 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (!v28)
    {
      if (v29)
      {
        v30 = [MEMORY[0x1E4F29060] callStackSymbols];
        char v21 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        v51 = v21;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_31:

      int v34 = _NUAssertFailHandler();
      goto LABEL_32;
    }
LABEL_29:
    if (v29)
    {
      uint64_t v41 = dispatch_get_specific(*v21);
      uint64_t v42 = (void *)MEMORY[0x1E4F29060];
      id v43 = v41;
      char v21 = [v42 callStackSymbols];
      BOOL v44 = [v21 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      v51 = (const void **)v41;
      __int16 v52 = 2114;
      v53 = v44;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  v7 = v6;
  v8 = [(PIParallaxSegmentationItem *)self resource];

  if (!v8)
  {
    char v31 = NUAssertLogger_4065();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = [NSString stringWithFormat:@"Missing asset resource"];
      *(_DWORD *)CGRect buf = 138543362;
      v51 = v32;
      _os_log_error_impl(&dword_1A9680000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    char v21 = (const void **)MEMORY[0x1E4F7A308];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v23 = NUAssertLogger_4065();
    int v34 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (v34)
      {
        char v35 = [MEMORY[0x1E4F29060] callStackSymbols];
        BOOL v36 = [v35 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        v51 = v36;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_34;
    }
LABEL_32:
    if (v34)
    {
      v45 = dispatch_get_specific(*v21);
      v46 = (void *)MEMORY[0x1E4F29060];
      id v47 = v45;
      v48 = [v46 callStackSymbols];
      int v49 = [v48 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      v51 = (const void **)v45;
      __int16 v52 = 2114;
      v53 = v49;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_34:

    _NUAssertFailHandler();
  }
  v9 = [(PIParallaxSegmentationItem *)self resource];
  char v10 = [v9 archiveURL];

  v11 = [(PIParallaxSegmentationItem *)self resource];
  v12 = v11;
  if (!v10)
  {
    char v15 = [v11 saveToArchiveURL:v7 error:a4];
LABEL_9:

    goto LABEL_10;
  }
  char v13 = [v11 archiveURL];
  char v14 = [v7 isEqual:v13];

  if ((v14 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v16 = [(PIParallaxSegmentationItem *)self resource];
    id v17 = [v16 archiveURL];
    char v15 = [v12 copyItemAtURL:v17 toURL:v7 error:a4];

    goto LABEL_9;
  }
  char v15 = 1;
LABEL_10:

  return v15;
}

- (BOOL)loadFromURL:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    char v16 = NUAssertLogger_4065();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "archiveURL != nil");
      id v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v41 = v17;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v18 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v20 = NUAssertLogger_4065();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        int v29 = dispatch_get_specific(*v18);
        v30 = (void *)MEMORY[0x1E4F29060];
        id v31 = v29;
        id v18 = [v30 callStackSymbols];
        v32 = [v18 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        uint64_t v41 = (const void **)v29;
        __int16 v42 = 2114;
        id v43 = v32;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v21)
    {
      id v22 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v18 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v41 = v18;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v26 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  if (!a4)
  {
    id v23 = NUAssertLogger_4065();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      BOOL v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v41 = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    id v18 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v25 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v20 = NUAssertLogger_4065();
    int v26 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v25)
    {
      if (v26)
      {
        char v27 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v28 = [v27 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        uint64_t v41 = v28;
        _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_25;
    }
LABEL_23:
    if (v26)
    {
      v33 = dispatch_get_specific(*v18);
      int v34 = (void *)MEMORY[0x1E4F29060];
      id v35 = v33;
      BOOL v36 = [v34 callStackSymbols];
      uint64_t v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      uint64_t v41 = (const void **)v33;
      __int16 v42 = 2114;
      id v43 = v37;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_25:

    _NUAssertFailHandler();
  }
  v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F8CC68]);
  v9 = [v7 URLByAppendingPathComponent:@"asset.resource"];
  id v39 = 0;
  char v10 = [v8 loadFromArchiveURL:v9 error:&v39];
  id v11 = v39;
  if (v10)
  {
    [(PIParallaxSegmentationItem *)self setResource:v8];
    v12 = [v7 URLByAppendingPathComponent:@"segmentation.data.aar"];
    id v38 = 0;
    BOOL v13 = [(PIParallaxSegmentationItem *)self loadSegmentationDataFromURL:v12 error:&v38];
    id v14 = v38;

    if (v13)
    {
      [(PIParallaxSegmentationItem *)self setFileURL:v7];
    }
    else
    {
      *a4 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load segmentation data" object:v12 underlyingError:v14];
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load asset resource" object:v9 underlyingError:v11];
    BOOL v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v11;
  }

  return v13;
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v17 = NUAssertLogger_4065();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "archiveURL != nil");
      id v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      id v43 = v18;
      _os_log_error_impl(&dword_1A9680000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    char v19 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v21 = NUAssertLogger_4065();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v30 = dispatch_get_specific(*v19);
        id v31 = (void *)MEMORY[0x1E4F29060];
        id v32 = v30;
        char v19 = [v31 callStackSymbols];
        v33 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        id v43 = (const void **)v30;
        __int16 v44 = 2114;
        v45 = v33;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v22)
    {
      id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
      char v19 = [v23 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      id v43 = v19;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v27 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  if (!a4)
  {
    BOOL v24 = NUAssertLogger_4065();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      uint64_t v25 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      id v43 = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    char v19 = (const void **)MEMORY[0x1E4F7A308];
    int v26 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    BOOL v21 = NUAssertLogger_4065();
    int v27 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v26)
    {
      if (v27)
      {
        id v28 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v29 = [v28 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        id v43 = v29;
        _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_27;
    }
LABEL_25:
    if (v27)
    {
      int v34 = dispatch_get_specific(*v19);
      id v35 = (void *)MEMORY[0x1E4F29060];
      id v36 = v34;
      uint64_t v37 = [v35 callStackSymbols];
      id v38 = [v37 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      id v43 = (const void **)v34;
      __int16 v44 = 2114;
      v45 = v38;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_27:

    _NUAssertFailHandler();
  }
  v7 = v6;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v41 = 0;
  char v9 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:0 attributes:0 error:&v41];
  id v10 = v41;

  if (v9)
  {
    id v11 = [v7 URLByAppendingPathComponent:@"asset.resource"];
    id v40 = 0;
    BOOL v12 = [(PIParallaxSegmentationItem *)self saveAssetResourceToURL:v11 error:&v40];
    id v13 = v40;

    if (v12)
    {
      id v14 = [v7 URLByAppendingPathComponent:@"segmentation.data.aar"];
      id v39 = 0;
      BOOL v15 = [(PIParallaxSegmentationItem *)self saveSegmentationDataToURL:v14 error:&v39];
      id v10 = v39;

      if (!v15)
      {
        *a4 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to archive segmentation data" object:self underlyingError:v10];
      }
    }
    else
    {
      [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to archive asset resource" object:self underlyingError:v13];
      BOOL v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = v13;
    }
  }
  else
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to create archive directory" object:v7 underlyingError:v10];
    BOOL v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(PIParallaxSegmentationItem *)self classification];
  v5 = PFPosterClassificationName();
  id v6 = [(PIParallaxSegmentationItem *)self segmentationMatte];
  v7 = [(PIParallaxSegmentationItem *)self segmentationConfidenceMap];
  id v8 = [(PIParallaxSegmentationItem *)self segmentationBackground];
  char v9 = [(PIParallaxSegmentationItem *)self originalLayout];
  id v10 = [(PIParallaxSegmentationItem *)self resource];
  id v11 = [(PIParallaxSegmentationItem *)self composition];
  BOOL v12 = [v3 stringWithFormat:@"<%@:%p class=%@ matte=%@ conf=%@ infill=%@ layout=%@ resource=%@ composition=%@>", v4, self, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (id)suggestedStyleForCategory:(id)a3
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v41 = v4;
  if (![v4 isEqualToString:*MEMORY[0x1E4F8D0D0]])
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F8D0D8]])
    {
      uint64_t v9 = *MEMORY[0x1E4F8CFE8];
      v53[0] = *MEMORY[0x1E4F8D000];
      v53[1] = v9;
      uint64_t v10 = *MEMORY[0x1E4F8CFF8];
      v53[2] = *MEMORY[0x1E4F8CFF0];
      v53[3] = v10;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = v53;
    }
    else
    {
      if (![v4 isEqualToString:*MEMORY[0x1E4F8D0C8]])
      {
        if (![v4 isEqualToString:*MEMORY[0x1E4F8D0C0]])
        {
          int v26 = NUAssertLogger_4065();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v27 = [NSString stringWithFormat:@"Unsupported style category: %@", v4];
            *(_DWORD *)CGRect buf = 138543362;
            v48 = v27;
            _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
          }
          id v28 = (const void **)MEMORY[0x1E4F7A308];
          specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
          v30 = NUAssertLogger_4065();
          BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
          if (specific)
          {
            if (v31)
            {
              int v34 = dispatch_get_specific(*v28);
              id v35 = (void *)MEMORY[0x1E4F29060];
              id v36 = v34;
              uint64_t v37 = [v35 callStackSymbols];
              id v38 = [v37 componentsJoinedByString:@"\n"];
              *(_DWORD *)CGRect buf = 138543618;
              v48 = v34;
              __int16 v49 = 2114;
              v50 = v38;
              _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
            }
          }
          else if (v31)
          {
            id v32 = [MEMORY[0x1E4F29060] callStackSymbols];
            v33 = [v32 componentsJoinedByString:@"\n"];
            *(_DWORD *)CGRect buf = 138543362;
            v48 = v33;
            _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
          }
          uint64_t v39 = _NUAssertFailHandler();
          return (id)__56__PIParallaxSegmentationItem_suggestedStyleForCategory___block_invoke(v39, v40);
        }
        uint64_t v25 = *MEMORY[0x1E4F8CFD8];
        v51[0] = *MEMORY[0x1E4F8D018];
        v51[1] = v25;
        v51[2] = *MEMORY[0x1E4F8CFD0];
        id v6 = (void *)MEMORY[0x1E4F1C978];
        v7 = v51;
        goto LABEL_3;
      }
      uint64_t v11 = *MEMORY[0x1E4F8CFE8];
      v52[0] = *MEMORY[0x1E4F8D010];
      v52[1] = v11;
      uint64_t v12 = *MEMORY[0x1E4F8CFF0];
      v52[2] = *MEMORY[0x1E4F8CFF8];
      void v52[3] = v12;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = v52;
    }
    uint64_t v8 = 4;
    goto LABEL_9;
  }
  uint64_t v5 = *MEMORY[0x1E4F8D028];
  v54[0] = *MEMORY[0x1E4F8D008];
  v54[1] = v5;
  v54[2] = *MEMORY[0x1E4F8D020];
  id v6 = (void *)MEMORY[0x1E4F1C978];
  v7 = v54;
LABEL_3:
  uint64_t v8 = 3;
LABEL_9:
  [v6 arrayWithObjects:v7 count:v8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [(PIParallaxSegmentationItem *)self availableStyles];
        char v19 = PFFind();

        if (v19)
        {

          id v20 = v41;
          goto LABEL_23;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_815);
  }
  id v20 = v41;
  BOOL v21 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)CGRect buf = 138543362;
    v48 = v41;
    _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Couldn't find a single candidate style for category %{public}@, falling back to Original", buf, 0xCu);
  }
  char v19 = [(PIParallaxSegmentationItem *)self originalStyle];
LABEL_23:
  BOOL v22 = +[PIParallaxStyle styleWithBakedStyle:v19];
  [v22 configureForCategory:v20];
  id v23 = [v22 bakedStyle];

  return v23;
}

uint64_t __56__PIParallaxSegmentationItem_suggestedStyleForCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_populateDefaultStyles
{
  id v17 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  id v3 = [(PIParallaxSegmentationItem *)self originalStyle];
  [v17 addObject:v3];

  uint64_t v4 = [(PIParallaxSegmentationItem *)self colorAnalysis];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x1E4F8CFD0];
    id v6 = [(PIParallaxSegmentationItem *)self colorAnalysis];
    v7 = +[PIParallaxStyle defaultStyleForKind:v5 colorAnalysis:v6];

    uint64_t v8 = [v7 bakedStyle];
    [v17 addObject:v8];

    uint64_t v9 = *MEMORY[0x1E4F8CFF0];
    uint64_t v10 = [(PIParallaxSegmentationItem *)self colorAnalysis];
    uint64_t v11 = +[PIParallaxStyle defaultStyleForKind:v9 colorAnalysis:v10];

    uint64_t v12 = [v11 bakedStyle];
    [v17 addObject:v12];

    uint64_t v13 = *MEMORY[0x1E4F8CFF8];
    uint64_t v14 = [(PIParallaxSegmentationItem *)self colorAnalysis];
    uint64_t v15 = +[PIParallaxStyle defaultStyleForKind:v13 colorAnalysis:v14];

    uint64_t v16 = [v15 bakedStyle];
    [v17 addObject:v16];
  }
  [(PIParallaxSegmentationItem *)self set_defaultStyles:v17];
}

- (NSArray)defaultStyles
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(PIParallaxSegmentationItem *)v2 _defaultStyles];

  if (!v3) {
    [(PIParallaxSegmentationItem *)v2 _populateDefaultStyles];
  }
  objc_sync_exit(v2);

  return [(PIParallaxSegmentationItem *)v2 _defaultStyles];
}

- (id)defaultStyleOfKind:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PIParallaxSegmentationItem *)self colorAnalysis];
  id v6 = +[PIParallaxStyle defaultStyleForKind:v4 colorAnalysis:v5];

  v7 = [v6 bakedStyle];

  return v7;
}

- (id)availableStyleOfKind:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PIParallaxSegmentationItem *)self availableStyles];
  uint64_t v9 = v4;
  id v6 = v4;
  v7 = PFFind();

  return v7;
}

uint64_t __51__PIParallaxSegmentationItem_availableStyleOfKind___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  v2 = [(PIParallaxSegmentationItem *)self contextInfo];
  id v3 = [v2 layoutConfiguration];

  return (PFWallpaperCompoundDeviceConfiguration *)v3;
}

- (id)adjustedStyleForHeadroom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 kind];
  id v6 = (void *)*MEMORY[0x1E4F8D020];

  if (v5 == v6)
  {
    id v9 = [(PIParallaxSegmentationItem *)self originalStyle];
    goto LABEL_5;
  }
  v7 = [v4 kind];
  uint64_t v8 = (void *)*MEMORY[0x1E4F8CFD0];

  if (v7 != v8)
  {
    id v9 = v4;
LABEL_5:
    uint64_t v10 = v9;
    goto LABEL_7;
  }
  uint64_t v11 = [(PIParallaxSegmentationItem *)self colorAnalysis];
  uint64_t v12 = +[PIParallaxStyle defaultStyleForKind:v7 colorAnalysis:v11];
  uint64_t v10 = [v12 bakedStyle];

LABEL_7:
  return v10;
}

- (PFParallaxLayerStyle)originalStyle
{
  uint64_t v3 = *MEMORY[0x1E4F8D020];
  id v4 = [(PIParallaxSegmentationItem *)self colorAnalysis];
  uint64_t v5 = +[PIParallaxStyle defaultStyleForKind:v3 colorAnalysis:v4];

  if ([(PIParallaxSegmentationItem *)self classification] != 1)
  {
    id v6 = [MEMORY[0x1E4F8CC78] whiteColor];
    [v5 setClockColor:v6];
  }
  v7 = [v5 bakedStyle];

  return (PFParallaxLayerStyle *)v7;
}

- (BOOL)supportsBackgroundlessStyles
{
  uint64_t v3 = +[PIGlobalSettings globalSettings];
  int v4 = [v3 parallaxStyleEnableGreenScreen];

  if (!v4) {
    return 0;
  }
  return [(PIParallaxSegmentationItem *)self supportsSegmentedStyles];
}

- (BOOL)supportsSegmentedStyles
{
  uint64_t v3 = [(PIParallaxSegmentationItem *)self scores];
  unsigned int v4 = +[PISegmentationGating gatingResultForSegmentationScores:v3];

  return ([(PIParallaxSegmentationItem *)self classification] == 1) & (v4 >> 2);
}

- (void)_populateAvailableStyles
{
  id v41 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
  uint64_t v3 = [(PIParallaxSegmentationItem *)self originalStyle];
  [v41 addObject:v3];

  unsigned int v4 = [(PIParallaxSegmentationItem *)self colorAnalysis];

  if (v4)
  {
    if ([(PIParallaxSegmentationItem *)self supportsBackgroundlessStyles])
    {
      uint64_t v5 = *MEMORY[0x1E4F8D008];
      id v6 = [(PIParallaxSegmentationItem *)self colorAnalysis];
      v7 = +[PIParallaxStyle defaultStyleForKind:v5 colorAnalysis:v6];

      uint64_t v8 = [v7 bakedStyle];
      [v41 addObject:v8];

      uint64_t v9 = *MEMORY[0x1E4F8D000];
      uint64_t v10 = [(PIParallaxSegmentationItem *)self colorAnalysis];
      uint64_t v11 = +[PIParallaxStyle defaultStyleForKind:v9 colorAnalysis:v10];

      uint64_t v12 = [v11 bakedStyle];
      [v41 addObject:v12];

      uint64_t v13 = *MEMORY[0x1E4F8D018];
      uint64_t v14 = [(PIParallaxSegmentationItem *)self colorAnalysis];
      uint64_t v15 = +[PIParallaxStyle defaultStyleForKind:v13 colorAnalysis:v14];

      uint64_t v16 = [v15 bakedStyle];
      [v41 addObject:v16];

      uint64_t v17 = *MEMORY[0x1E4F8D010];
      id v18 = [(PIParallaxSegmentationItem *)self colorAnalysis];
      char v19 = +[PIParallaxStyle defaultStyleForKind:v17 colorAnalysis:v18];

      id v20 = [v19 bakedStyle];
      [v41 addObject:v20];
    }
    else
    {
      char v19 = 0;
    }
    if ([(PIParallaxSegmentationItem *)self supportsSegmentedStyles])
    {
      uint64_t v21 = *MEMORY[0x1E4F8D028];
      BOOL v22 = [(PIParallaxSegmentationItem *)self colorAnalysis];
      id v23 = +[PIParallaxStyle defaultStyleForKind:v21 colorAnalysis:v22];

      BOOL v24 = [v23 bakedStyle];
      [v41 addObject:v24];

      uint64_t v25 = *MEMORY[0x1E4F8CFD8];
      int v26 = [(PIParallaxSegmentationItem *)self colorAnalysis];
      char v19 = +[PIParallaxStyle defaultStyleForKind:v25 colorAnalysis:v26];

      int v27 = [v19 bakedStyle];
      [v41 addObject:v27];

      id v28 = (uint64_t *)MEMORY[0x1E4F8CFE8];
    }
    else
    {
      id v28 = (uint64_t *)MEMORY[0x1E4F8CFD0];
    }
    uint64_t v29 = *v28;
    v30 = [(PIParallaxSegmentationItem *)self colorAnalysis];
    BOOL v31 = +[PIParallaxStyle defaultStyleForKind:v29 colorAnalysis:v30];

    id v32 = [v31 bakedStyle];
    [v41 addObject:v32];

    uint64_t v33 = *MEMORY[0x1E4F8CFF0];
    int v34 = [(PIParallaxSegmentationItem *)self colorAnalysis];
    id v35 = +[PIParallaxStyle defaultStyleForKind:v33 colorAnalysis:v34];

    id v36 = [v35 bakedStyle];
    [v41 addObject:v36];

    uint64_t v37 = *MEMORY[0x1E4F8CFF8];
    id v38 = [(PIParallaxSegmentationItem *)self colorAnalysis];
    uint64_t v39 = +[PIParallaxStyle defaultStyleForKind:v37 colorAnalysis:v38];

    id v40 = [v39 bakedStyle];
    [v41 addObject:v40];
  }
  [(PIParallaxSegmentationItem *)self set_availableStyles:v41];
}

- (NSArray)availableStyles
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(PIParallaxSegmentationItem *)v2 _availableStyles];

  if (!v3) {
    [(PIParallaxSegmentationItem *)v2 _populateAvailableStyles];
  }
  objc_sync_exit(v2);

  return [(PIParallaxSegmentationItem *)v2 _availableStyles];
}

- (BOOL)isComplete
{
  v2 = [(PIParallaxSegmentationItem *)self originalLayout];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)settlingEffectHasInterestingMotion
{
  v2 = [(PIParallaxSegmentationItem *)self scores];
  BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F8D210]];

  if (v3)
  {
    [v3 floatValue];
    float v5 = v4;
  }
  else
  {
    float v5 = -1.0;
  }
  id v6 = +[PIGlobalSettings globalSettings];
  [v6 settlingEffectMinimumMotionScore];
  float v8 = v7;

  return v5 >= v8;
}

- (NSArray)settlingEffectGatingDiagnostics
{
  v13[14] = *MEMORY[0x1E4F143B8];
  v2 = [(PIParallaxSegmentationItem *)self scores];
  BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F8D200]];

  if (v3)
  {
    v12[0] = &unk_1F00097B8;
    v12[1] = &unk_1F00097D0;
    v13[0] = @"Missing required metadata";
    v13[1] = @"Failed L1 stabilization";
    v12[2] = &unk_1F00097E8;
    v12[3] = &unk_1F0009800;
    v13[2] = @"Failed video quality gating";
    v13[3] = @"Failed metadata integrity check";
    v12[4] = &unk_1F0009818;
    v12[5] = &unk_1F0009830;
    v13[4] = @"Failed FRC gating";
    v13[5] = @"Failed still transition gating";
    v12[6] = &unk_1F0009848;
    v12[7] = &unk_1F0009860;
    v13[6] = @"Unsupported Photos adjustments";
    v13[7] = @"Feature is disabled/unsupported";
    v12[8] = &unk_1F0009878;
    v12[9] = &unk_1F0009890;
    v13[8] = @"Asset resources are unavailable";
    v13[9] = @"Generic error";
    v12[10] = &unk_1F00098A8;
    v12[11] = &unk_1F00098C0;
    v13[10] = @"Failed to apply adjustments to FRC";
    v13[11] = @"Failed hardware support check";
    v12[12] = &unk_1F00098D8;
    v12[13] = &unk_1F00098F0;
    v13[12] = @"User-selected keyframe is out of the supported bounds";
    v13[13] = @"Failed to load AVAsset from URL";
    float v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:14];
    uint64_t v5 = [v3 unsignedIntegerValue];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__PIParallaxSegmentationItem_settlingEffectGatingDiagnostics__block_invoke;
    v9[3] = &unk_1E5D7F100;
    uint64_t v11 = v5;
    id v7 = v6;
    id v10 = v7;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v7;
}

void __61__PIParallaxSegmentationItem_settlingEffectGatingDiagnostics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (([a2 unsignedIntegerValue] & ~*(void *)(a1 + 40)) != 0) {
    id v6 = @"No";
  }
  else {
    id v6 = @"Yes";
  }
  id v7 = [NSString stringWithFormat:@"%@: %@", v5, v6];

  [*(id *)(a1 + 32) addObject:v7];
}

- (BOOL)settlingEffectFailedAnyGating
{
  v2 = [(PIParallaxSegmentationItem *)self scores];
  BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F8D200]];

  LOBYTE(v2) = [v3 unsignedIntegerValue] != 0;
  return (char)v2;
}

- (BOOL)isSettlingEffectAvailable
{
  return [(PIParallaxSegmentationItem *)self settlingEffectStatus] - 3 < 3;
}

- (void)setSettlingEffectVideoData:(id)a3
{
  id v4 = a3;
  [(PIParallaxSegmentationItem *)self _invalidateCachedData];
  id v5 = (NSData *)[v4 copy];

  settlingEffectVideoData = self->_settlingEffectVideoData;
  self->_settlingEffectVideoData = v5;
}

- (void)setSettlingEffectStatus:(unint64_t)a3
{
  self->_settlingEffectStatus = a3;
}

- (void)setSettlingEffectNormalizedBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PIParallaxSegmentationItem *)self _invalidateCachedData];
  self->_settlingEffectNormalizedBounds.origin.CGFloat x = x;
  self->_settlingEffectNormalizedBounds.origin.CGFloat y = y;
  self->_settlingEffectNormalizedBounds.size.CGFloat width = width;
  self->_settlingEffectNormalizedBounds.size.CGFloat height = height;
}

- (void)_invalidateCachedData
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PIParallaxSegmentationItem allocWithZone:a3] init];
  id v5 = [(PIParallaxSegmentationItem *)self resource];
  [(PIParallaxSegmentationItem *)v4 setResource:v5];

  id v6 = [(PIParallaxSegmentationItem *)self composition];
  [(PIParallaxSegmentationItem *)v4 setComposition:v6];

  [(PIParallaxSegmentationItem *)v4 setClassification:[(PIParallaxSegmentationItem *)self classification]];
  id v7 = [(PIParallaxSegmentationItem *)self segmentationMatte];
  [(PIParallaxSegmentationItem *)v4 setSegmentationMatte:v7];

  float v8 = [(PIParallaxSegmentationItem *)self segmentationConfidenceMap];
  [(PIParallaxSegmentationItem *)v4 setSegmentationConfidenceMap:v8];

  uint64_t v9 = [(PIParallaxSegmentationItem *)self segmentationBackground];
  [(PIParallaxSegmentationItem *)v4 setSegmentationBackground:v9];

  id v10 = [(PIParallaxSegmentationItem *)self regions];
  [(PIParallaxSegmentationItem *)v4 setRegions:v10];

  uint64_t v11 = [(PIParallaxSegmentationItem *)self originalLayout];
  [(PIParallaxSegmentationItem *)v4 setOriginalLayout:v11];

  uint64_t v12 = [(PIParallaxSegmentationItem *)self headroomLayout];
  [(PIParallaxSegmentationItem *)v4 setHeadroomLayout:v12];

  uint64_t v13 = [(PIParallaxSegmentationItem *)self defaultLayout];
  [(PIParallaxSegmentationItem *)v4 setDefaultLayout:v13];

  uint64_t v14 = [(PIParallaxSegmentationItem *)self settlingEffectLayout];
  [(PIParallaxSegmentationItem *)v4 setSettlingEffectLayout:v14];

  uint64_t v15 = [(PIParallaxSegmentationItem *)self scores];
  [(PIParallaxSegmentationItem *)v4 setScores:v15];

  uint64_t v16 = [(PIParallaxSegmentationItem *)self colorAnalysis];
  [(PIParallaxSegmentationItem *)v4 setColorAnalysis:v16];

  uint64_t v17 = [(PIParallaxSegmentationItem *)self localLightData];
  [(PIParallaxSegmentationItem *)v4 setLocalLightData:v17];

  [(PIParallaxSegmentationItem *)self settlingEffectNormalizedBounds];
  -[PIParallaxSegmentationItem setSettlingEffectNormalizedBounds:](v4, "setSettlingEffectNormalizedBounds:");
  id v18 = [(PIParallaxSegmentationItem *)self settlingEffectVideoData];
  [(PIParallaxSegmentationItem *)v4 setSettlingEffectVideoData:v18];

  [(PIParallaxSegmentationItem *)v4 setSettlingEffectStatus:[(PIParallaxSegmentationItem *)self settlingEffectStatus]];
  char v19 = [(PIParallaxSegmentationItem *)self contextInfo];
  [(PIParallaxSegmentationItem *)v4 setContextInfo:v19];

  return v4;
}

- (PIParallaxSegmentationItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)PIParallaxSegmentationItem;
  v2 = [(PIParallaxSegmentationItem *)&v6 init];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v2->_settlingEffectNormalizedBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v2->_settlingEffectNormalizedBounds.size = v3;
  scores = v2->_scores;
  v2->_scores = (NSDictionary *)MEMORY[0x1E4F1CC08];

  return v2;
}

+ (void)loadSettlingEffectVideoDataFromURL:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v14 = NUAssertLogger_4065();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v29 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v18 = NUAssertLogger_4065();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        BOOL v22 = dispatch_get_specific(*v16);
        id v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        uint64_t v25 = [v23 callStackSymbols];
        int v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        uint64_t v29 = v22;
        __int16 v30 = 2114;
        BOOL v31 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v29 = v21;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  id v7 = (void (**)(void, void, void))v6;
  float v8 = objc_alloc_init(PIParallaxSegmentationItem);
  id v27 = 0;
  uint64_t v9 = [(id)objc_opt_class() _settlingEffectDataLoadingBlock];
  BOOL v10 = [(PIParallaxSegmentationItem *)v8 _loadSegmentationDataFromURL:v5 error:&v27 matteImageLoadingBlock:&__block_literal_global_478 backgroundImageLoadingBlock:&__block_literal_global_478 settingEffectDataLoadingBlock:v9];
  id v11 = v27;

  if (v10
    && ([(PIParallaxSegmentationItem *)v8 settlingEffectVideoData],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    uint64_t v13 = [(PIParallaxSegmentationItem *)v8 settlingEffectVideoData];
    ((void (**)(void, void *, void))v7)[2](v7, v13, 0);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to load settling effect data" object:v5 underlyingError:v11];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v13);
  }
}

PISegmentationLoadingResult *__76__PIParallaxSegmentationItem_loadSettlingEffectVideoDataFromURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v11 = 0;
  id v12 = 0;
  id v10 = 0;
  char v3 = [v2 decodeData:&v12 filename:&v11 error:&v10];
  id v4 = v12;
  id v5 = v11;
  id v6 = v10;

  if (v3)
  {
    id v7 = [[PISegmentationLoadingResult alloc] initWithObject:0 success:1 error:0];
  }
  else
  {
    float v8 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to decode image data" object:v2 underlyingError:v6];
    id v7 = [[PISegmentationLoadingResult alloc] initWithObject:0 success:0 error:v8];
  }
  return v7;
}

+ (id)imageBufferFromData:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v12 = NUAssertLogger_4065();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "imageData != nil");
      *(_DWORD *)texture = 138543362;
      *(void *)&texture[4] = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v16 = NUAssertLogger_4065();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v25 = dispatch_get_specific(*v14);
        int v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v14 = [v26 callStackSymbols];
        id v28 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)texture = 138543618;
        *(void *)&texture[4] = v25;
        __int16 v35 = 2114;
        id v36 = v28;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);
      }
    }
    else if (v17)
    {
      id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)texture = 138543362;
      *(void *)&texture[4] = v14;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);
    }
    int v22 = _NUAssertFailHandler();
    goto LABEL_22;
  }
  if (!a4)
  {
    BOOL v19 = NUAssertLogger_4065();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)texture = 138543362;
      *(void *)&texture[4] = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v21 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v16 = NUAssertLogger_4065();
    int v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)texture = 138543362;
        *(void *)&texture[4] = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_22:
    if (v22)
    {
      uint64_t v29 = dispatch_get_specific(*v14);
      __int16 v30 = (void *)MEMORY[0x1E4F29060];
      id v31 = v29;
      uint64_t v32 = [v30 callStackSymbols];
      uint64_t v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)texture = 138543618;
      *(void *)&texture[4] = v29;
      __int16 v35 = 2114;
      id v36 = v33;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);
    }
LABEL_24:

    _NUAssertFailHandler();
  }
  id v6 = v5;
  *(void *)texture = 0;
  uint64_t CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
  if (CVPixelBufferFromImageData)
  {
    float v8 = (void *)MEMORY[0x1E4F7A438];
    uint64_t v9 = [NSNumber numberWithInt:CVPixelBufferFromImageData];
    *a4 = [v8 failureError:@"Failed to decode pixel buffer" object:v9];

    id v10 = 0;
  }
  else
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A3D8]) initWithCVPixelBuffer:*(void *)texture];
    CVPixelBufferRelease(*(CVPixelBufferRef *)texture);
  }

  return v10;
}

+ (id)dataForImageBuffer:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v14 = NUAssertLogger_4065();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      uint64_t v15 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v37 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v18 = NUAssertLogger_4065();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        id v27 = dispatch_get_specific(*v16);
        id v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        uint64_t v16 = [v28 callStackSymbols];
        __int16 v30 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        uint64_t v37 = (const void **)v27;
        __int16 v38 = 2114;
        uint64_t v39 = v30;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v37 = v16;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v24 = _NUAssertFailHandler();
    goto LABEL_22;
  }
  if (!a4)
  {
    uint64_t v21 = NUAssertLogger_4065();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      int v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v37 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v16 = (const void **)MEMORY[0x1E4F7A308];
    id v23 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v18 = NUAssertLogger_4065();
    int v24 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (!v23)
    {
      if (v24)
      {
        uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        uint64_t v37 = v26;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_22:
    if (v24)
    {
      id v31 = dispatch_get_specific(*v16);
      uint64_t v32 = (void *)MEMORY[0x1E4F29060];
      id v33 = v31;
      int v34 = [v32 callStackSymbols];
      __int16 v35 = [v34 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      uint64_t v37 = (const void **)v31;
      __int16 v38 = 2114;
      uint64_t v39 = v35;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_24:

    _NUAssertFailHandler();
  }
  id v6 = v5;
  [v5 CVPixelBuffer];
  uint64_t v7 = PFFigEncodeCVPixelBufferToData();
  id v8 = 0;
  uint64_t v9 = v8;
  if (v7)
  {
    id v10 = (void *)MEMORY[0x1E4F7A438];
    id v11 = [NSNumber numberWithInt:v7];
    *a4 = [v10 failureError:@"Failed to encode pixel buffer" object:v11];

    id v12 = 0;
  }
  else
  {
    id v12 = v8;
  }

  return v12;
}

+ (id)readImageBufferFromURL:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v12 = NUAssertLogger_4065();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "imageURL != nil");
      *(_DWORD *)texture = 138543362;
      *(void *)&texture[4] = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v16 = NUAssertLogger_4065();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        uint64_t v25 = dispatch_get_specific(*v14);
        int v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v14 = [v26 callStackSymbols];
        id v28 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)texture = 138543618;
        *(void *)&texture[4] = v25;
        __int16 v35 = 2114;
        id v36 = v28;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);
      }
    }
    else if (v17)
    {
      id v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)texture = 138543362;
      *(void *)&texture[4] = v14;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);
    }
    int v22 = _NUAssertFailHandler();
    goto LABEL_22;
  }
  if (!a4)
  {
    BOOL v19 = NUAssertLogger_4065();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)texture = 138543362;
      *(void *)&texture[4] = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v21 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v16 = NUAssertLogger_4065();
    int v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)texture = 138543362;
        *(void *)&texture[4] = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_22:
    if (v22)
    {
      id v29 = dispatch_get_specific(*v14);
      __int16 v30 = (void *)MEMORY[0x1E4F29060];
      id v31 = v29;
      uint64_t v32 = [v30 callStackSymbols];
      id v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)texture = 138543618;
      *(void *)&texture[4] = v29;
      __int16 v35 = 2114;
      id v36 = v33;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);
    }
LABEL_24:

    _NUAssertFailHandler();
  }
  id v6 = v5;
  *(void *)texture = 0;
  uint64_t CVPixelBufferFromURL = PFFigCreateCVPixelBufferFromURL();
  if (CVPixelBufferFromURL)
  {
    id v8 = (void *)MEMORY[0x1E4F7A438];
    uint64_t v9 = [NSNumber numberWithInt:CVPixelBufferFromURL];
    *a4 = [v8 failureError:@"Failed to decode pixel buffer" object:v9];

    id v10 = 0;
  }
  else
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A3D8]) initWithCVPixelBuffer:*(void *)texture];
    CVPixelBufferRelease(*(CVPixelBufferRef *)texture);
  }

  return v10;
}

+ (BOOL)writeImageBuffer:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v14 = NUAssertLogger_4065();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      uint64_t v15 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v46 = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v18 = NUAssertLogger_4065();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        uint64_t v32 = dispatch_get_specific(*v16);
        id v33 = (void *)MEMORY[0x1E4F29060];
        id v34 = v32;
        uint64_t v16 = [v33 callStackSymbols];
        __int16 v35 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543618;
        uint64_t v46 = (const void **)v32;
        __int16 v47 = 2114;
        v48 = v35;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v16 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v46 = v16;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v24 = _NUAssertFailHandler();
    goto LABEL_25;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v21 = NUAssertLogger_4065();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "destinationURL != nil");
      int v22 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v46 = v22;
      _os_log_error_impl(&dword_1A9680000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v16 = (const void **)MEMORY[0x1E4F7A308];
    id v23 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v18 = NUAssertLogger_4065();
    int v24 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (!v23)
    {
      if (v24)
      {
        uint64_t v25 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v16 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        uint64_t v46 = v16;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
LABEL_27:

      int v29 = _NUAssertFailHandler();
      goto LABEL_28;
    }
LABEL_25:
    if (v24)
    {
      id v36 = dispatch_get_specific(*v16);
      uint64_t v37 = (void *)MEMORY[0x1E4F29060];
      id v38 = v36;
      uint64_t v16 = [v37 callStackSymbols];
      uint64_t v39 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      uint64_t v46 = (const void **)v36;
      __int16 v47 = 2114;
      v48 = v39;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (!a5)
  {
    int v26 = NUAssertLogger_4065();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      id v27 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)CGRect buf = 138543362;
      uint64_t v46 = v27;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v16 = (const void **)MEMORY[0x1E4F7A308];
    id v28 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v18 = NUAssertLogger_4065();
    int v29 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (!v28)
    {
      if (v29)
      {
        __int16 v30 = [MEMORY[0x1E4F29060] callStackSymbols];
        id v31 = [v30 componentsJoinedByString:@"\n"];
        *(_DWORD *)CGRect buf = 138543362;
        uint64_t v46 = v31;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_30;
    }
LABEL_28:
    if (v29)
    {
      uint64_t v40 = dispatch_get_specific(*v16);
      id v41 = (void *)MEMORY[0x1E4F29060];
      id v42 = v40;
      long long v43 = [v41 callStackSymbols];
      long long v44 = [v43 componentsJoinedByString:@"\n"];
      *(_DWORD *)CGRect buf = 138543618;
      uint64_t v46 = (const void **)v40;
      __int16 v47 = 2114;
      v48 = v44;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_30:

    _NUAssertFailHandler();
  }
  [v7 CVPixelBuffer];
  uint64_t v10 = PFFigEncodeCVPixelBufferToURL();
  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F7A438];
    id v12 = [NSNumber numberWithInt:v10];
    *a5 = [v11 failureError:@"Failed to encode pixel buffer" object:v12];
  }
  return v10 == 0;
}

+ (id)_settlingEffectDataLoadingBlock
{
  return &__block_literal_global_4287;
}

PISegmentationLoadingResult *__61__PIParallaxSegmentationItem__settlingEffectDataLoadingBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v12 = 0;
  id v13 = 0;
  id v11 = 0;
  char v3 = [v2 decodeData:&v13 filename:&v12 error:&v11];
  id v4 = v13;
  id v5 = v12;
  id v6 = v11;
  if (v3)
  {
    if ([v5 isEqualToString:@"settlingEffect.mov"])
    {
      id v7 = [[PISegmentationLoadingResult alloc] initWithObject:v4 success:1 error:0];
      goto LABEL_7;
    }
    uint64_t v8 = [MEMORY[0x1E4F7A438] invalidError:@"Expected settlingEffect.mov data" object:v5];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to decode settling effect video data" object:v2 underlyingError:v6];
  }
  uint64_t v9 = (void *)v8;
  id v7 = [[PISegmentationLoadingResult alloc] initWithObject:0 success:0 error:v8];

LABEL_7:
  return v7;
}

+ (id)_backgroundImageLoadingBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PIParallaxSegmentationItem__backgroundImageLoadingBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e53___PISegmentationLoadingResult_16__0__PFAppleArchive_8l;
  v4[4] = a1;
  id v2 = (void *)MEMORY[0x1AD0F8FE0](v4, a2);
  return v2;
}

PISegmentationLoadingResult *__58__PIParallaxSegmentationItem__backgroundImageLoadingBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v15 = 0;
  id v16 = 0;
  id v14 = 0;
  char v3 = [v2 decodeData:&v16 filename:&v15 error:&v14];
  id v4 = v16;
  id v5 = v15;
  id v6 = v14;
  if (v3)
  {
    if ([v5 isEqualToString:@"background.heic"])
    {
      id v13 = 0;
      id v7 = [(id)objc_opt_class() imageBufferFromData:v4 error:&v13];
      id v8 = v13;

      if (v7)
      {
        uint64_t v9 = [[PISegmentationLoadingResult alloc] initWithObject:v7 success:1 error:0];
      }
      else
      {
        id v11 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to read background image data" object:v4 underlyingError:v8];
        uint64_t v9 = [[PISegmentationLoadingResult alloc] initWithObject:0 success:0 error:v11];
      }
      id v6 = v8;
      goto LABEL_10;
    }
    uint64_t v10 = [MEMORY[0x1E4F7A438] invalidError:@"Expected background.heic data" object:v5];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to decode background image data" object:v2 underlyingError:v6];
  }
  id v7 = (void *)v10;
  uint64_t v9 = [[PISegmentationLoadingResult alloc] initWithObject:0 success:0 error:v10];
LABEL_10:

  return v9;
}

+ (id)_matteImageLoadingBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PIParallaxSegmentationItem__matteImageLoadingBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e53___PISegmentationLoadingResult_16__0__PFAppleArchive_8l;
  v4[4] = a1;
  id v2 = (void *)MEMORY[0x1AD0F8FE0](v4, a2);
  return v2;
}

PISegmentationLoadingResult *__53__PIParallaxSegmentationItem__matteImageLoadingBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v15 = 0;
  id v16 = 0;
  id v14 = 0;
  char v3 = [v2 decodeData:&v16 filename:&v15 error:&v14];
  id v4 = v16;
  id v5 = v15;
  id v6 = v14;
  if (v3)
  {
    if ([v5 isEqualToString:@"matte.heic"])
    {
      id v13 = 0;
      id v7 = [(id)objc_opt_class() imageBufferFromData:v4 error:&v13];
      id v8 = v13;

      if (v7)
      {
        uint64_t v9 = [[PISegmentationLoadingResult alloc] initWithObject:v7 success:1 error:0];
      }
      else
      {
        id v11 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to read matte image data" object:v4 underlyingError:v8];
        uint64_t v9 = [[PISegmentationLoadingResult alloc] initWithObject:0 success:0 error:v11];
      }
      id v6 = v8;
      goto LABEL_10;
    }
    uint64_t v10 = [MEMORY[0x1E4F7A438] invalidError:@"Expected matte.heic data" object:v5];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to decode matte image data" object:v2 underlyingError:v6];
  }
  id v7 = (void *)v10;
  uint64_t v9 = [[PISegmentationLoadingResult alloc] initWithObject:0 success:0 error:v10];
LABEL_10:

  return v9;
}

@end