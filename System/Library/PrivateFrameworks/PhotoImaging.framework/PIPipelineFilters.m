@interface PIPipelineFilters
+ (id)applyOrientationFilter;
+ (id)autoCropFilter;
+ (id)autoloopStabilizedVideoFilter;
+ (id)exifOrientationAndCropStraightenOnly;
+ (id)histogramOptimizationFilter;
+ (id)inputToCropFilter;
+ (id)iosCropToolFilter;
+ (id)noCropFilter;
+ (id)noGeometryFilter;
+ (id)noMuteFilter;
+ (id)noOrientationFilter;
+ (id)noRedEyeFilter;
+ (id)noTrimFilter;
+ (id)oneShotPortraitV2ExportFilter;
+ (id)orientationAsMetaDataFilter;
+ (id)perspectiveStraightenWithoutCropFilter;
+ (id)postGeometryFilter;
+ (id)preGeometryFilter;
+ (id)rawFaceBalanceFilter;
+ (id)rawSourceFilterIncludingOrientation;
+ (id)sourceFilter;
+ (id)sourceFilterNoOrientation;
+ (id)stopAtTagIncludeGeometryFilter:(id)a3;
+ (id)stopAtTagIncludeOrientationFilter:(id)a3;
+ (id)stripAllTimeAdjustmentsFilter;
+ (id)sushiLevel1Filter;
@end

@implementation PIPipelineFilters

+ (id)oneShotPortraitV2ExportFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_190];
  return v2;
}

id __50__PIPipelineFilters_oneShotPortraitV2ExportFilter__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  v10 = [a3 objectForKeyedSubscript:@"portraitEffect"];
  v11 = v10;
  if (!v10) {
    goto LABEL_9;
  }
  v12 = [v10 objectForKeyedSubscript:@"enabled"];
  if (([v12 BOOLValue] & 1) == 0)
  {

    goto LABEL_9;
  }
  uint64_t v13 = [v8 versionForPortraitEffect:v11];

  if (v13 <= 1)
  {
LABEL_9:
    id v14 = v9;
    goto LABEL_10;
  }
  id v23 = 0;
  id v14 = [v8 inputForPath:@"/PortraitV2" error:&v23];
  id v15 = v23;
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [v14 settings];
      v17 = (void *)[v16 mutableCopy];

      [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"disablePortraitMixing"];
      v18 = [PIPortraitEffectNode alloc];
      v19 = [v14 input];
      v20 = [v14 blurMap];
      v21 = [(PIPortraitEffectNode *)v18 initWithInput:v19 blurMap:v20 settings:v17];

      if ([v8 resetTag:@"/PortraitV2" input:v21 error:a5]) {
        id v14 = v9;
      }
      else {
        id v14 = 0;
      }
    }
    else
    {
      *a5 = [MEMORY[0x1E4F7A438] mismatchError:@"Unexpected PortraitEffect node" object:v14];

      id v14 = 0;
    }
  }
  else
  {
    *a5 = [MEMORY[0x1E4F7A438] errorWithCode:3 reason:@"Missing PortraitV2 tag" object:0 underlyingError:v15];
  }

LABEL_10:
  return v14;
}

+ (id)sourceFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_184_26121];
  return v2;
}

id __33__PIPipelineFilters_sourceFilter__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7 = a2;
  id v8 = [a3 objectForKeyedSubscript:@"source"];
  id v9 = [v7 renderNodeFromSource:v8 settings:&unk_1F000F058 error:a5];

  return v9;
}

+ (id)autoloopStabilizedVideoFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_176_26130];
  return v2;
}

id __50__PIPipelineFilters_autoloopStabilizedVideoFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = [v8 getTagWithPath:@"/AutoLoop/StabilizedVideo" error:a5];
  [v8 resetTag:@"/AutoLoop/Output" input:v9];

  return v7;
}

+ (id)applyOrientationFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_174];
  return v2;
}

id __43__PIPipelineFilters_applyOrientationFilter__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [a3 objectForKeyedSubscript:@"orientation"];
  id v9 = v8;
  v10 = v7;
  if (v8)
  {
    v11 = [v8 objectForKeyedSubscript:@"value"];
    uint64_t v12 = [v11 integerValue];

    v10 = [v6 orientedNode:v7 withOrientation:v12];
  }
  return v10;
}

+ (id)stopAtTagIncludeOrientationFilter:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F7A618]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PIPipelineFilters_stopAtTagIncludeOrientationFilter___block_invoke;
  v8[3] = &unk_1E5D816B8;
  id v9 = v3;
  id v5 = v3;
  id v6 = (void *)[v4 initWithBlock:v8];

  return v6;
}

id __55__PIPipelineFilters_stopAtTagIncludeOrientationFilter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = a2;
  id v8 = [v7 getTagWithPath:*(void *)(a1 + 32) error:a5];
  if (v8) {
    [v7 resetTag:@"/pre-Orientation" input:v8];
  }
  id v9 = [v7 getTagWithPath:@"/Orientation" error:a5];

  return v9;
}

+ (id)stopAtTagIncludeGeometryFilter:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F7A618]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PIPipelineFilters_stopAtTagIncludeGeometryFilter___block_invoke;
  v8[3] = &unk_1E5D816B8;
  id v9 = v3;
  id v5 = v3;
  id v6 = (void *)[v4 initWithBlock:v8];

  return v6;
}

id __52__PIPipelineFilters_stopAtTagIncludeGeometryFilter___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = a2;
  id v8 = [v7 getTagWithPath:*(void *)(a1 + 32) error:a5];
  if (v8) {
    [v7 resetTag:@"/pre-Geometry" input:v8];
  }
  id v9 = [v7 getTagWithPath:@"/post-Geometry" error:a5];

  return v9;
}

+ (id)histogramOptimizationFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_166];
  return v2;
}

id __48__PIPipelineFilters_histogramOptimizationFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [v7 getTagWithPath:@"pre-PortraitVideo" error:a5];
  if (v9) {
    [v7 resetTag:@"/post-PortraitVideo" input:v9];
  }

  return v8;
}

+ (id)inputToCropFilter
{
  return (id)[MEMORY[0x1E4F7A618] stopAtTagFilter:@"/perspectiveStraighten"];
}

+ (id)postGeometryFilter
{
  return (id)[MEMORY[0x1E4F7A618] stopAtTagFilter:@"/post-Geometry"];
}

+ (id)preGeometryFilter
{
  return (id)[MEMORY[0x1E4F7A618] stopAtTagFilter:@"/pre-Geometry"];
}

+ (id)perspectiveStraightenWithoutCropFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_161_26165];
  return v2;
}

id __59__PIPipelineFilters_perspectiveStraightenWithoutCropFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [v7 getTagWithPath:@"/perspectiveStraighten" error:a5];
  if (v9) {
    [v7 resetTag:@"/Crop" input:v9];
  }

  return v8;
}

+ (id)orientationAsMetaDataFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_153];
  return v2;
}

id __48__PIPipelineFilters_orientationAsMetaDataFilter__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [a3 objectForKeyedSubscript:@"orientation"];
  id v9 = v8;
  v10 = v7;
  if (v8)
  {
    v11 = [v8 objectForKeyedSubscript:@"value"];
    [v11 integerValue];

    v10 = [v6 orientedNode:v7 withOrientation:NUOrientationInverse()];
  }
  return v10;
}

+ (id)noOrientationFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_148];
  return v2;
}

id __40__PIPipelineFilters_noOrientationFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = [v8 getTagWithPath:@"/pre-Orientation" error:a5];
  [v8 resetTag:@"/Orientation" input:v9];

  return v7;
}

+ (id)noGeometryFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_143_26170];
  return v2;
}

id __37__PIPipelineFilters_noGeometryFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = [v8 getTagWithPath:@"/pre-Geometry" error:a5];
  [v8 resetTag:@"/post-Geometry" input:v9];

  return v7;
}

+ (id)stripAllTimeAdjustmentsFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_132];
  return v2;
}

id __50__PIPipelineFilters_stripAllTimeAdjustmentsFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = [v8 getTagWithPath:@"/pre-Trim" error:a5];
  [v8 resetTag:@"Trim" input:v9];
  v10 = [v8 getTagWithPath:@"pre-SloMo" error:a5];

  [v8 resetTag:@"SloMo" input:v10];
  return v7;
}

+ (id)iosCropToolFilter
{
  if (iosCropToolFilter_onceToken != -1) {
    dispatch_once(&iosCropToolFilter_onceToken, &__block_literal_global_122_26184);
  }
  v2 = (void *)iosCropToolFilter_filter;
  return v2;
}

uint64_t __38__PIPipelineFilters_iosCropToolFilter__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_124];
  uint64_t v1 = iosCropToolFilter_filter;
  iosCropToolFilter_filter = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __38__PIPipelineFilters_iosCropToolFilter__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = [v8 getTagWithPath:@"/pre-Geometry" error:a5];
  [v8 resetTag:@"/post-Adjustments" input:v9];

  return v7;
}

+ (id)noCropFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_116_26189];
  return v2;
}

id __33__PIPipelineFilters_noCropFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = [v8 getTagWithPath:@"/pre-Crop" error:a5];
  [v8 resetTag:@"/pre-Orientation" input:v9];

  return v7;
}

+ (id)noMuteFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_105];
  return v2;
}

id __33__PIPipelineFilters_noMuteFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = a2;
  id v7 = [v6 getTagWithPath:@"pre-Mute" error:a5];
  [v6 resetTag:@"Mute" input:v7];
  id v8 = [v6 getTagWithPath:@"Image" error:a5];

  return v8;
}

+ (id)noTrimFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_79];
  return v2;
}

id __33__PIPipelineFilters_noTrimFilter__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 getTagWithPath:@"/pre-Trim" error:a5];
  [v8 resetTag:@"/SloMo" input:v11];
  uint64_t v12 = [v10 objectForKeyedSubscript:@"slomo"];

  uint64_t v13 = v9;
  if (v12)
  {
    memset(&v27, 0, sizeof(v27));
    id v14 = [v12 objectForKeyedSubscript:@"start"];
    int64_t v15 = (int)[v14 intValue];
    v16 = [v12 objectForKeyedSubscript:@"startScale"];
    CMTimeMake(&v27, v15, [v16 intValue]);

    memset(&v26, 0, sizeof(v26));
    v17 = [v12 objectForKeyedSubscript:@"end"];
    int64_t v18 = (int)[v17 intValue];
    v19 = [v12 objectForKeyedSubscript:@"endScale"];
    CMTimeMake(&v26, v18, [v19 intValue]);

    v20 = [v12 objectForKeyedSubscript:@"rate"];
    [v20 floatValue];
    unsigned int v22 = v21;

    CMTime v25 = v27;
    CMTime v24 = v26;
    uint64_t v13 = objc_msgSend(v8, "createSloMoWithInput:startTime:endTime:rate:error:", v9, &v25, &v24, a5, COERCE_DOUBLE(__PAIR64__(HIDWORD(v26.value), v22)));
  }
  return v13;
}

+ (id)noRedEyeFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_71_26224];
  return v2;
}

id __35__PIPipelineFilters_noRedEyeFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = a2;
  id v7 = [v6 getTagWithPath:@"/pre-RedEye" error:a5];
  [v6 resetTag:@"/post-RedEye" input:v7];
  id v8 = [v6 getTagWithPath:@"/post-RedEye" error:a5];

  return v8;
}

+ (id)sushiLevel1Filter
{
  return (id)[MEMORY[0x1E4F7A618] stopAtTagFilter:@"/RAW/SushiLevel1"];
}

+ (id)sourceFilterNoOrientation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_56_26235];
  return v2;
}

id __46__PIPipelineFilters_sourceFilterNoOrientation__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:&unk_1F000F030];
  id v10 = [v8 objectForKeyedSubscript:@"raw"];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 objectForKeyedSubscript:@"inputDecoderVersion"];
    [v9 setObject:v12 forKeyedSubscript:@"inputDecoderVersion"];

    uint64_t v13 = [v11 objectForKeyedSubscript:@"inputSushiLevel"];
    if (v13) {
      [v9 setObject:v13 forKeyedSubscript:@"kCGImageSourceShouldExtendRaw"];
    }
    id v14 = [v11 objectForKeyedSubscript:@"gainMapVersion"];
    [v9 setObject:v14 forKeyedSubscript:@"gainMapVersion"];

    int64_t v15 = [v11 objectForKeyedSubscript:@"gainMapParameters"];
    [v9 setObject:v15 forKeyedSubscript:@"gainMapParameters"];

    v16 = [v8 objectForKeyedSubscript:@"source"];
    v17 = [v7 renderNodeFromSource:v16 settings:v9 error:a5];

    if (v17)
    {
      int64_t v18 = [v7 getTagWithPath:@"/ShowOriginalSource" error:a5];
      [v18 setInput:v17];
    }
    else
    {
      int64_t v18 = 0;
    }
  }
  else
  {
    int64_t v18 = [v7 getTagWithPath:@"/ShowOriginalSource" error:a5];
  }

  return v18;
}

+ (id)rawSourceFilterIncludingOrientation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_39];
  return v2;
}

id __56__PIPipelineFilters_rawSourceFilterIncludingOrientation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = [v9 objectForKeyedSubscript:@"raw"];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = [v12 objectForKeyedSubscript:@"inputDecoderVersion"];
    [v11 setObject:v14 forKeyedSubscript:@"inputDecoderVersion"];

    int64_t v15 = [v13 objectForKeyedSubscript:@"inputSushiLevel"];
    if (v15) {
      [v11 setObject:v15 forKeyedSubscript:@"kCGImageSourceShouldExtendRaw"];
    }

    v16 = [v9 objectForKeyedSubscript:@"source"];
    v17 = [v8 renderNodeFromSource:v16 settings:v11 error:a5];

    return v17;
  }
  else
  {
    v19 = NUAssertLogger_26263();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [NSString stringWithFormat:@"expected RAW in rawSourceFilterIncludingOrientation"];
      int v32 = 138543362;
      v33 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v32, 0xCu);
    }
    unsigned int v21 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v23 = NUAssertLogger_26263();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        CMTime v27 = dispatch_get_specific(*v21);
        v28 = (void *)MEMORY[0x1E4F29060];
        id v29 = v27;
        v30 = [v28 callStackSymbols];
        v31 = [v30 componentsJoinedByString:@"\n"];
        int v32 = 138543618;
        v33 = v27;
        __int16 v34 = 2114;
        v35 = v31;
        _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v32, 0x16u);
      }
    }
    else if (v24)
    {
      CMTime v25 = [MEMORY[0x1E4F29060] callStackSymbols];
      CMTime v26 = [v25 componentsJoinedByString:@"\n"];
      int v32 = 138543362;
      v33 = v26;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v32, 0xCu);
    }
    _NUAssertFailHandler();
    return NUAssertLogger_26263();
  }
}

+ (id)rawFaceBalanceFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_11];
  return v2;
}

id __41__PIPipelineFilters_rawFaceBalanceFilter__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = [v8 objectForKeyedSubscript:@"raw"];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 objectForKeyedSubscript:@"inputDecoderVersion"];
    [v9 setObject:v12 forKeyedSubscript:@"inputDecoderVersion"];

    [v9 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"skipOrientation"];
  }
  uint64_t v13 = [v8 objectForKeyedSubscript:@"source"];
  id v14 = [v7 renderNodeFromSource:v13 settings:v9 error:a5];

  int64_t v15 = [v7 getTagWithPath:@"Raw/Linear" error:a5];
  if (v15)
  {

    v18[0] = @"inputImage";
    v18[1] = @"inputBoost";
    v19[0] = v15;
    v19[1] = &unk_1F000AA08;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v14 = [v7 nodeByApplyingFilterWithName:@"PIForwardFakeBoost" useHDRFilter:0 settingsAndInputs:v16];
  }
  return v14;
}

+ (id)exifOrientationAndCropStraightenOnly
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_3];
  return v2;
}

id __57__PIPipelineFilters_exifOrientationAndCropStraightenOnly__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = a2;
  id v7 = [v6 getTagWithPath:@"/pre-Adjustments" error:a5];
  [v6 resetTag:@"/pre-Crop" input:v7];
  id v8 = [v6 getTagWithPath:@"/Crop" error:a5];

  id v9 = [v8 outputImageGeometry:a5];
  uint64_t v10 = [v9 orientation];

  v11 = [v6 orientedNode:v8 withOrientation:v10];

  return v11;
}

+ (id)autoCropFilter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_26296];
  return v2;
}

id __35__PIPipelineFilters_autoCropFilter__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = a2;
  id v7 = [v6 getTagWithPath:@"/pre-Adjustments" error:a5];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 outputImageGeometry:a5];
    uint64_t v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v6, "orientedNode:withOrientation:", v8, objc_msgSend(v9, "orientation"));
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end