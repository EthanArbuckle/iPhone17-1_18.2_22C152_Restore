@interface PGWallpaperSuggestionAssetGater
+ (double)sydneyMD4FaceQualityFromAsset:(id)a3;
+ (id)assetFetchPropertySetsForGating;
+ (int)numberOfFailuresAfterStabilizationFromStatistics:(id *)a3;
+ (unint64_t)_posterClassificationFromAssetGaterType:(unint64_t)a3;
+ (unint64_t)currentWallpaperPropertiesVersion;
- ($029C8AA35660F62BB82CBF098D3EDE08)currentGatingStatistics;
- ($2753767B6D5E71768FC0A26EE39D5FB2)settlingEffectGatingStatistics;
- (BOOL)_hasPetFaceWithWallpaperProperties:(id)a3;
- (BOOL)_passesSegmentationWithWallpaperProperties:(id)a3;
- (BOOL)_passesSettlingEffectWithWallpaperProperties:(id)a3;
- (BOOL)assetIsUsingHeadroom:(id)a3;
- (BOOL)cacheExistsForAsset:(id)a3;
- (BOOL)coversTracks;
- (BOOL)enableSettlingEffect;
- (BOOL)hasValidAnalysisVersionForAsset:(id)a3;
- (BOOL)isLastGatingCallingMediaAnalysis;
- (BOOL)isUserInitiated;
- (BOOL)persistWallpaperProperties:(id)a3 ofAsset:(id)a4 error:(id *)a5;
- (PGWallpaperSuggestionAssetGater)initWithType:(unint64_t)a3 loggingConnection:(id)a4;
- (id)_gateAsset:(id)a3 wallpaperProperties:(id *)a4 progressBlock:(id)a5;
- (id)_requestAnalysisTypes:(unint64_t)a3 asset:(id)a4 options:(id)a5 progressBlock:(id)a6 error:(id *)a7;
- (id)_requestWallpaperPropertiesForAsset:(id)a3 progressBlock:(id)a4 error:(id *)a5;
- (id)existingSegmentationScoresWithAsset:(id)a3;
- (id)existingWallpaperPropertiesWithAsset:(id)a3;
- (id)gateAsset:(id)a3 hasPetFace:(BOOL *)a4;
- (id)gateAsset:(id)a3 progressBlock:(id)a4;
- (id)gatingResultWithWallpaperProperties:(id)a3;
- (id)requestAndPersistWallpaperPropertiesForAsset:(id)a3 progressBlock:(id)a4;
- (id)wallpaperPropertiesFromAnalysisResults:(id)a3 andAsset:(id)a4;
- (void)clearCacheOfAsset:(id)a3;
- (void)logCurrentGatingStatisticsWithPrefix:(id)a3;
- (void)logCurrentSettlingEffectGatingStatisticsWithPrefix:(id)a3;
- (void)setCoversTracks:(BOOL)a3;
- (void)setEnableSettlingEffect:(BOOL)a3;
- (void)setIsUserInitiated:(BOOL)a3;
@end

@implementation PGWallpaperSuggestionAssetGater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_deviceWallpaperLayoutConfiguration, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisService, 0);
}

- ($2753767B6D5E71768FC0A26EE39D5FB2)settlingEffectGatingStatistics
{
  long long v3 = *(_OWORD *)&self[1].var12;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var4 = v3;
  *(_OWORD *)&retstr->var8 = *(_OWORD *)&self[2].var3;
  retstr->var12 = self[2].var7;
  return self;
}

- ($029C8AA35660F62BB82CBF098D3EDE08)currentGatingStatistics
{
  long long v3 = *(_OWORD *)&self[1].var5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var4 = v3;
  *(void *)&retstr->var8 = *(void *)&self[1].var9;
  return self;
}

- (BOOL)isLastGatingCallingMediaAnalysis
{
  return self->_isLastGatingCallingMediaAnalysis;
}

- (void)setEnableSettlingEffect:(BOOL)a3
{
  self->_enableSettlingEffect = a3;
}

- (BOOL)enableSettlingEffect
{
  return self->_enableSettlingEffect;
}

- (void)setCoversTracks:(BOOL)a3
{
  self->_coversTracks = a3;
}

- (BOOL)coversTracks
{
  return self->_coversTracks;
}

- (void)setIsUserInitiated:(BOOL)a3
{
  self->_isUserInitiated = a3;
}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

- (void)clearCacheOfAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 photoLibrary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PGWallpaperSuggestionAssetGater_clearCacheOfAsset___block_invoke;
  v11[3] = &unk_1E68F0B18;
  id v6 = v4;
  id v12 = v6;
  id v10 = 0;
  char v7 = [v5 performChangesAndWait:v11 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Fail deleting segmentation cache for asset %@: %@", buf, 0x16u);
    }
  }
}

void __53__PGWallpaperSuggestionAssetGater_clearCacheOfAsset___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 32)];
  [v1 deleteAssetResourceWithType:109];
}

- (BOOL)cacheExistsForAsset:(id)a3
{
  long long v3 = (objc_class *)MEMORY[0x1E4F39358];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithPhotoAsset:v4];

  id v6 = [v5 segmentationResourceURL];
  LOBYTE(v4) = v6 != 0;

  return (char)v4;
}

- (BOOL)_hasPetFaceWithWallpaperProperties:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"petsModelVersion"];
  uint64_t v5 = [v4 unsignedIntegerValue];

  id v6 = [v3 objectForKeyedSubscript:@"petsFaceConfidence"];

  [v6 doubleValue];
  double v8 = v7;

  return v8 >= 0.5 && v5 == 0;
}

- (BOOL)_passesSettlingEffectWithWallpaperProperties:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKeyedSubscript:@"segmentationScores"];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] segmentation scores: %@", buf, 0xCu);
  }
  if (self->_enableSettlingEffect)
  {
    int v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    *(_OWORD *)buf = 0u;
    [MEMORY[0x1E4F8A378] settlingEffectGatingStatisticsFromScores:v4];
    BOOL v6 = (*(_DWORD *)buf | *(_DWORD *)&buf[4] | *(_DWORD *)&buf[8] | *(_DWORD *)&buf[12] | v13 | DWORD1(v13) | DWORD2(v13) | HIDWORD(v13) | v14 | DWORD1(v14) | DWORD2(v14) | HIDWORD(v14) | v15) == 0;
    if (*(_DWORD *)buf)
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruFeatureDisabled;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed feature enabled check";
LABEL_48:
        _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, v8, v11, 2u);
      }
    }
    else if (*(_DWORD *)&buf[4])
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruHardwareUnsupported;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed hardware support check";
        goto LABEL_48;
      }
    }
    else if (*(_DWORD *)&buf[8])
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruResourceAvailability;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed asset resource availability";
        goto LABEL_48;
      }
    }
    else if (*(_DWORD *)&buf[12])
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruUnsupportedAdjustments;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed valid adjustments check";
        goto LABEL_48;
      }
    }
    else if (v13)
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruGenericError;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed due to generic error";
        goto LABEL_48;
      }
    }
    else if (DWORD1(v13))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruMetadataCheck;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed metadata check";
        goto LABEL_48;
      }
    }
    else if (DWORD2(v13))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruStabilization;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed stabilization";
        goto LABEL_48;
      }
    }
    else if (HIDWORD(v13))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruVideoQuality;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed video quality";
        goto LABEL_48;
      }
    }
    else if (v14)
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruMetadataIntegrity;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed metadata integrity";
        goto LABEL_48;
      }
    }
    else if (DWORD1(v14))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruFRC;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed FRC";
        goto LABEL_48;
      }
    }
    else if (DWORD2(v14))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruVideoDecision;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed video decision";
        goto LABEL_48;
      }
    }
    else if (HIDWORD(v14))
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruLayoutDecision;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed layout decision";
        goto LABEL_48;
      }
    }
    else if (v15)
    {
      ++self->_settlingEffectGatingStatistics.numberOfEliminationsThruStillTransition;
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties failed still transition";
        goto LABEL_48;
      }
    }
    else
    {
      double v7 = self->_loggingConnection;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        double v8 = "[PGWallpaperSuggestionAssetGater] wallpaperProperties pass settling effect gating";
        goto LABEL_48;
      }
    }
  }
  else
  {
    v9 = self->_loggingConnection;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] settling effect disabled. Fail settling effect gating.", buf, 2u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_passesSegmentationWithWallpaperProperties:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"segmentationScores"];
  if ([MEMORY[0x1E4F8A378] curatedSegmentationGatingDecisionForSegmentationScores:v3]) {
    char v4 = [MEMORY[0x1E4F8A378] layoutGatingDecisionForSegmentationScores:v3];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)gatingResultWithWallpaperProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(PGWallpaperAssetGaterResult);
  if (self->_type != 5) {
    [(PGWallpaperAssetGaterResult *)v5 setPassesSegmentation:[(PGWallpaperSuggestionAssetGater *)self _passesSegmentationWithWallpaperProperties:v4]];
  }
  [(PGWallpaperAssetGaterResult *)v5 setPassesSettlingEffect:[(PGWallpaperSuggestionAssetGater *)self _passesSettlingEffectWithWallpaperProperties:v4]];

  return v5;
}

- (id)wallpaperPropertiesFromAnalysisResults:(id)a3 andAsset:(id)a4
{
  id v6 = a3;
  double v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  id v10 = NSNumber;
  v11 = [v8 sceneAnalysisProperties];
  id v12 = objc_msgSend(v10, "numberWithShort:", objc_msgSend(v11, "sceneAnalysisVersion"));
  [v9 setObject:v12 forKeyedSubscript:@"sceneAnalysisVersion"];

  long long v13 = NSNumber;
  uint64_t v14 = [v8 faceAnalysisVersion];

  int v15 = [v13 numberWithShort:v14];
  [v9 setObject:v15 forKeyedSubscript:@"faceAnalysisVersion"];

  uint64_t v16 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F74450]];
  [v9 setObject:v16 forKeyedSubscript:@"segmentationScores"];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E4F8A378], "currentVersion"));
  [v9 setObject:v17 forKeyedSubscript:@"segmentationModelVersion"];

  if (self->_type == 2)
  {
    uint64_t v18 = *MEMORY[0x1E4F74460];
    v19 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F74460]];
    uint64_t v20 = *MEMORY[0x1E4F744A8];
    v21 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F744A8]];
    [v9 setObject:v21 forKeyedSubscript:@"petsBounds"];

    v22 = [v6 objectForKeyedSubscript:v18];
    uint64_t v23 = *MEMORY[0x1E4F744B0];
    v24 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F744B0]];
    [v9 setObject:v24 forKeyedSubscript:@"petsConfidence"];

    uint64_t v25 = *MEMORY[0x1E4F74458];
    v26 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F74458]];
    v27 = [v26 objectForKeyedSubscript:v20];
    [v9 setObject:v27 forKeyedSubscript:@"petsFaceBounds"];

    v28 = [v6 objectForKeyedSubscript:v25];
    v29 = [v28 objectForKeyedSubscript:v23];
    [v9 setObject:v29 forKeyedSubscript:@"petsFaceConfidence"];

    v30 = [NSNumber numberWithUnsignedInteger:VCPMAGetRevisionForMediaAnalysisType()];
    [v9 setObject:v30 forKeyedSubscript:@"petsModelVersion"];
  }
  v31 = [(PFWallpaperCompoundDeviceConfiguration *)self->_deviceWallpaperLayoutConfiguration dictionaryRepresentation];
  [v9 setObject:v31 forKeyedSubscript:@"wallpaperLayoutConfiguration"];

  [v9 setObject:&unk_1F28D1BC0 forKeyedSubscript:@"wallpaperSpecificationVersion"];
  return v9;
}

- (BOOL)persistWallpaperProperties:(id)a3 ofAsset:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__32666;
  v24 = __Block_byref_object_dispose__32667;
  id v25 = 0;
  id v9 = [v8 photoLibrary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PGWallpaperSuggestionAssetGater_persistWallpaperProperties_ofAsset_error___block_invoke;
  v15[3] = &unk_1E68E8E60;
  id v10 = v7;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  uint64_t v18 = &v26;
  v19 = &v20;
  int v12 = [v9 performChangesAndWait:v15 error:a5];

  if (!v12) {
    goto LABEL_6;
  }
  if (!*((unsigned char *)v27 + 24))
  {
    if (a5)
    {
      BOOL v13 = 0;
      *a5 = (id) v21[5];
      goto LABEL_7;
    }
LABEL_6:
    BOOL v13 = 0;
    goto LABEL_7;
  }
  BOOL v13 = 1;
LABEL_7:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __76__PGWallpaperSuggestionAssetGater_persistWallpaperProperties_ofAsset_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v11 = 0;
  id v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:200 options:0 error:&v11];
  id v4 = v11;
  uint64_t v5 = v4;
  if (v3)
  {
    id v6 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 40)];
    [v6 setWallpaperPropertiesData:v3];
    id v7 = [*(id *)(a1 + 40) adjustmentTimestamp];
    if (v7)
    {
      [v6 setWallpaperPropertiesTimestamp:v7];
    }
    else
    {
      id v10 = [*(id *)(a1 + 40) creationDate];
      [v6 setWallpaperPropertiesTimestamp:v10];
    }
    [v6 setWallpaperPropertiesVersion:10];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = v4;
    id v6 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
}

- (id)_requestAnalysisTypes:(unint64_t)a3 asset:(id)a4 options:(id)a5 progressBlock:(id)a6 error:(id *)a7
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v44 = a5;
  id v12 = a6;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__32666;
  v72 = __Block_byref_object_dispose__32667;
  id v73 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__32666;
  v66 = __Block_byref_object_dispose__32667;
  id v67 = 0;
  v40 = [MEMORY[0x1E4F1C9C8] date];
  v41 = [v40 dateByAddingTimeInterval:120.0];
  v42 = v12;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v14 = dispatch_get_global_queue(33, 0);
  dispatch_source_t v15 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v14);

  id v16 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v11 uuid];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = 0x405E000000000000;
    _os_log_impl(&dword_1D1805000, (os_log_t)v16, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] Start requesting analysis for asset: %@. Timeout: %.3f seconds", buf, 0x16u);
  }
  uint64_t v18 = self->_loggingConnection;
  os_signpost_id_t v19 = os_signpost_id_generate((os_log_t)v18);
  uint64_t v20 = v18;
  v21 = v20;
  os_signpost_id_t spid = v19;
  unint64_t v22 = v19 - 1;
  if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v21, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ImagingAnalysisRequest", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v38 = mach_absolute_time();
  mediaAnalysisService = self->_mediaAnalysisService;
  v80[0] = v11;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __91__PGWallpaperSuggestionAssetGater__requestAnalysisTypes_asset_options_progressBlock_error___block_invoke_2;
  v54[3] = &unk_1E68E8E10;
  id v25 = v15;
  v55 = v25;
  v58 = &v68;
  id v26 = v11;
  id v56 = v26;
  v59 = &v62;
  unint64_t v60 = a3;
  v27 = v13;
  v57 = v27;
  LODWORD(mediaAnalysisService) = [(VCPMediaAnalysisService *)mediaAnalysisService requestAnalysisTypes:a3 forAssets:v24 withOptions:v44 progressHandler:&__block_literal_global_304 andCompletionHandler:v54];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  uint64_t v79 = 0;
  dispatch_source_set_timer(v25, 0, 0x5F5E100uLL, 0x4C4B40uLL);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __91__PGWallpaperSuggestionAssetGater__requestAnalysisTypes_asset_options_progressBlock_error___block_invoke_3;
  handler[3] = &unk_1E68E8E38;
  id v28 = v41;
  id v46 = v28;
  v47 = v25;
  v48 = self;
  int v53 = (int)mediaAnalysisService;
  id v29 = v26;
  id v49 = v29;
  id v30 = v42;
  v51 = buf;
  uint64_t v52 = 0x4092C00000000000;
  id v50 = v30;
  v31 = v25;
  dispatch_source_set_event_handler(v31, handler);
  dispatch_resume(v31);

  dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v32 = mach_absolute_time();
  mach_timebase_info v33 = info;
  v34 = v21;
  v35 = v34;
  if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)v74 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v35, OS_SIGNPOST_INTERVAL_END, spid, "ImagingAnalysisRequest", "", v74, 2u);
  }

  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v74 = 136315394;
    v75 = "ImagingAnalysisRequest";
    __int16 v76 = 2048;
    double v77 = (float)((float)((float)((float)(v32 - v38) * (float)v33.numer) / (float)v33.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v74, 0x16u);
  }
  if (a7) {
    *a7 = (id) v63[5];
  }
  id v36 = (id)v69[5];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v36;
}

void __91__PGWallpaperSuggestionAssetGater__requestAnalysisTypes_asset_options_progressBlock_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v29 = a2;
  id v5 = a3;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if (v29)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = [*(id *)(a1 + 40) localIdentifier];
    id v10 = [v29 objectForKeyedSubscript:v9];
    uint64_t v11 = *MEMORY[0x1E4F74450];
    id v12 = [v10 objectForKey:*MEMORY[0x1E4F74450]];
    dispatch_semaphore_t v13 = [v12 firstObject];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v13 forKeyedSubscript:v11];

    if ((*(unsigned char *)(a1 + 74) & 2) == 0) {
      goto LABEL_6;
    }
    uint64_t v14 = [*(id *)(a1 + 40) localIdentifier];
    dispatch_source_t v15 = [v29 objectForKeyedSubscript:v14];
    uint64_t v16 = *MEMORY[0x1E4F74460];
    id v17 = [v15 objectForKey:*MEMORY[0x1E4F74460]];
    uint64_t v18 = [v17 firstObject];
    uint64_t v19 = *MEMORY[0x1E4F74470];
    uint64_t v20 = [v18 objectForKey:*MEMORY[0x1E4F74470]];

    v21 = [*(id *)(a1 + 40) localIdentifier];
    unint64_t v22 = [v29 objectForKeyedSubscript:v21];
    uint64_t v23 = *MEMORY[0x1E4F74458];
    v24 = [v22 objectForKey:*MEMORY[0x1E4F74458]];
    id v25 = [v24 firstObject];
    id v26 = [v25 objectForKey:v19];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v20 forKeyedSubscript:v16];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v26 forKeyedSubscript:v23];
  }
  else
  {
    uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
    id v28 = v5;
    uint64_t v20 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v28;
  }

LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __91__PGWallpaperSuggestionAssetGater__requestAnalysisTypes_asset_options_progressBlock_error___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  if (v5 < 0.0)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 48) + 16) cancelRequest:*(unsigned int *)(a1 + 88)];
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(NSObject **)(v6 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = *(void **)(a1 + 56);
      id v10 = v7;
      uint64_t v11 = [v9 uuid];
      *(_DWORD *)buf = 138412290;
      dispatch_semaphore_t v13 = v11;
      _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Timeout requesting analysis for asset: %@", buf, 0xCu);

      uint64_t v6 = *(void *)(a1 + 48);
    }
    ++*(_DWORD *)(v6 + 80);
  }
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(a1 + 80) * (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  return result;
}

- (id)_requestWallpaperPropertiesForAsset:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  v28[7] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(id)objc_opt_class() _posterClassificationFromAssetGaterType:self->_type];
  uint64_t v11 = [MEMORY[0x1E4F8E858] mediaAnalysisTypeForPosterClassification:v10] | 0x800000000;
  id v12 = [(PFWallpaperCompoundDeviceConfiguration *)self->_deviceWallpaperLayoutConfiguration dictionaryRepresentation];
  if ([(PGWallpaperSuggestionAssetGater *)self isUserInitiated]) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  uint64_t v14 = *MEMORY[0x1E4F74538];
  v28[0] = MEMORY[0x1E4F1CC38];
  uint64_t v15 = *MEMORY[0x1E4F8A4F8];
  v27[0] = v14;
  v27[1] = v15;
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:v10];
  uint64_t v17 = *MEMORY[0x1E4F8A510];
  v28[1] = v16;
  v28[2] = v12;
  uint64_t v18 = *MEMORY[0x1E4F8A520];
  v27[2] = v17;
  v27[3] = v18;
  uint64_t v19 = [NSNumber numberWithInteger:v13];
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E4F8A500];
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[PGWallpaperSuggestionAssetGater enableSettlingEffect](self, "enableSettlingEffect"));
  uint64_t v21 = *MEMORY[0x1E4F8A518];
  v28[4] = v20;
  v28[5] = MEMORY[0x1E4F1CC28];
  uint64_t v22 = *MEMORY[0x1E4F8A528];
  v27[5] = v21;
  v27[6] = v22;
  v28[6] = &unk_1F28D1BA8;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:7];

  v24 = [(PGWallpaperSuggestionAssetGater *)self _requestAnalysisTypes:v11 asset:v8 options:v23 progressBlock:v9 error:a5];

  ++self->_currentGatingStatistics.numberOfMediaAnalysisRequest;
  if (v24)
  {
    id v25 = [(PGWallpaperSuggestionAssetGater *)self wallpaperPropertiesFromAnalysisResults:v24 andAsset:v8];
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (id)requestAndPersistWallpaperPropertiesForAsset:(id)a3 progressBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(PGWallpaperSuggestionAssetGater *)self hasValidAnalysisVersionForAsset:v6])
  {
    id v8 = 0;
    ++self->_currentGatingStatistics.numberOfInvalidAnalysisVersion;
    goto LABEL_12;
  }
  id v21 = 0;
  id v8 = [(PGWallpaperSuggestionAssetGater *)self _requestWallpaperPropertiesForAsset:v6 progressBlock:v7 error:&v21];
  id v9 = v21;
  uint64_t v10 = v9;
  if (v8)
  {
    if (!self->_coversTracks)
    {
      id v20 = v9;
      BOOL v11 = [(PGWallpaperSuggestionAssetGater *)self persistWallpaperProperties:v8 ofAsset:v6 error:&v20];
      id v12 = v20;

      if (!v11)
      {
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = loggingConnection;
          uint64_t v15 = [v6 localIdentifier];
          *(_DWORD *)buf = 138412546;
          uint64_t v23 = v15;
          __int16 v24 = 2112;
          id v25 = v12;
          _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Failed persisting wallpaper properties on asset %@: %@", buf, 0x16u);
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
    ++self->_currentGatingStatistics.numberOfFailuresFromNilResult;
    uint64_t v16 = self->_loggingConnection;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = v16;
      uint64_t v19 = [v6 localIdentifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Failed getting wallpaper properties on asset %@: %@", buf, 0x16u);
    }
  }
  id v12 = v10;
LABEL_11:

LABEL_12:
  return v8;
}

- (BOOL)hasValidAnalysisVersionForAsset:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 adjustmentTimestamp];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 creationDate];
  }
  id v8 = v7;

  int v9 = (__int16)*MEMORY[0x1E4F74590];
  LODWORD(v10) = *MEMORY[0x1E4F74588];
  BOOL v11 = [v4 sceneAnalysisProperties];
  int v12 = [v11 sceneAnalysisVersion];

  int v13 = [v4 faceAnalysisVersion];
  if (v9 <= v12)
  {
    uint64_t v14 = [v4 sceneAnalysisProperties];
    uint64_t v15 = [v14 sceneAnalysisTimestamp];
    if ([v15 isEqualToDate:v8] && v13 >= (__int16)v10)
    {
      [v4 faceAdjustmentVersion];
      __int16 v32 = (__int16)v10;
      v33 = uint64_t v10 = v8;
      char loga = [v33 isEqualToDate:v10];

      id v8 = v10;
      LOWORD(v10) = v32;

      if (loga)
      {
        BOOL v17 = 1;
        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  if (self->_type == 5 && v12 >= 1 && v13 >= 1 && (v9 > v12 || v13 < (__int16)v10))
  {
    loggingConnection = self->_loggingConnection;
    BOOL v17 = 1;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = loggingConnection;
      uint64_t v19 = [v4 uuid];
      *(_DWORD *)buf = 138412802;
      v37 = v19;
      __int16 v38 = 1024;
      int v39 = v12;
      __int16 v40 = 1024;
      LODWORD(v41) = v13;
      _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] Asset %@ analysis in not up-to-date, performing SettlingEffect, detecting an upgrade scenario with analysis versions (%d, %d), allowing.", buf, 0x18u);
    }
  }
  else
  {
    id v20 = self->_loggingConnection;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      log = v20;
      id v21 = [v4 uuid];
      uint64_t v22 = [v4 sceneAnalysisProperties];
      uint64_t v23 = v8;
      int v24 = [v22 sceneAnalysisVersion];
      id v25 = [v4 sceneAnalysisProperties];
      uint64_t v26 = [v25 sceneAnalysisTimestamp];
      int v27 = [v4 faceAnalysisVersion];
      uint64_t v28 = [v4 faceAdjustmentVersion];
      __int16 v29 = (__int16)v10;
      id v30 = (void *)v28;
      *(_DWORD *)buf = 138414082;
      v37 = v21;
      __int16 v38 = 1024;
      int v39 = v24;
      id v8 = v23;
      __int16 v40 = 2112;
      v41 = v26;
      __int16 v42 = 1024;
      int v43 = v27;
      __int16 v44 = 2112;
      uint64_t v45 = v28;
      __int16 v46 = 1024;
      int v47 = v9;
      __int16 v48 = 1024;
      int v49 = v29;
      __int16 v50 = 2112;
      v51 = v23;
      _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] Asset %@ analysis in not uptodate ((%d, %@, %d, %@) vs (%d, %d, %@))", buf, 0x42u);
    }
    BOOL v17 = 0;
  }
LABEL_18:

  return v17;
}

- (id)existingWallpaperPropertiesWithAsset:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 photoAnalysisWallpaperProperties];
  if ([v5 wallpaperPropertiesVersion] != 10) {
    goto LABEL_13;
  }
  id v6 = [v5 wallpaperPropertiesTimestamp];
  id v7 = [v4 adjustmentTimestamp];
  if (v7)
  {
    char v8 = [v6 isEqualToDate:v7];

    if (v8) {
      goto LABEL_4;
    }
LABEL_13:
    BOOL v11 = 0;
    goto LABEL_32;
  }
  int v24 = [v4 creationDate];
  int v25 = [v6 isEqualToDate:v24];

  if (!v25) {
    goto LABEL_13;
  }
LABEL_4:
  int v9 = (void *)MEMORY[0x1E4F28F98];
  uint64_t v10 = [v5 wallpaperPropertiesData];
  id v40 = 0;
  BOOL v11 = [v9 propertyListWithData:v10 options:0 format:0 error:&v40];
  int v12 = (PFWallpaperCompoundDeviceConfiguration *)v40;

  if (!v11)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      int v27 = loggingConnection;
      uint64_t v28 = [v4 localIdentifier];
      *(_DWORD *)buf = 138412546;
      __int16 v42 = v28;
      __int16 v43 = 2112;
      __int16 v44 = v12;
      _os_log_error_impl(&dword_1D1805000, v27, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Failed deserializing wallpaper properties on asset %@: %@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  int v13 = [v11 objectForKeyedSubscript:@"sceneAnalysisVersion"];
  uint64_t v14 = [v13 integerValue];
  uint64_t v15 = [v4 sceneAnalysisProperties];
  BOOL v16 = v14 == [v15 sceneAnalysisVersion];

  if (v16)
  {
    BOOL v17 = [v11 objectForKeyedSubscript:@"faceAnalysisVersion"];
    uint64_t v18 = [v17 integerValue];
    BOOL v16 = v18 == [v4 faceAnalysisVersion];

    if (v16)
    {
      uint64_t v19 = [v11 objectForKeyedSubscript:@"segmentationModelVersion"];
      uint64_t v20 = [v19 unsignedIntegerValue];
      BOOL v16 = v20 == [MEMORY[0x1E4F8A378] currentVersion];
    }
  }
  if (self->_type == 2)
  {
    uint64_t v21 = VCPMAGetRevisionForMediaAnalysisType();
    if (!v16) {
      goto LABEL_29;
    }
    uint64_t v22 = v21;
    uint64_t v23 = [v11 objectForKeyedSubscript:@"petsModelVersion"];
    LOBYTE(v22) = [v23 unsignedIntegerValue] == v22;

    if ((v22 & 1) == 0) {
      goto LABEL_29;
    }
  }
  else if (!v16)
  {
LABEL_29:

LABEL_30:
    BOOL v11 = 0;
    goto LABEL_31;
  }
  __int16 v29 = [v11 objectForKeyedSubscript:@"wallpaperSpecificationVersion"];
  BOOL v30 = [v29 unsignedIntegerValue] == 3;

  if (!v30) {
    goto LABEL_29;
  }
  v31 = [v11 objectForKeyedSubscript:@"wallpaperLayoutConfiguration"];
  if (!v31)
  {
    v34 = self->_loggingConnection;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Persisted wallpaper layout configuration is unexpectedly nil, invalidating", buf, 2u);
    }
    goto LABEL_29;
  }
  id v39 = 0;
  __int16 v32 = [MEMORY[0x1E4F8CE48] compoundDeviceConfigurationFromDictionary:v31 error:&v39];
  mach_timebase_info v33 = (PFWallpaperCompoundDeviceConfiguration *)v39;
  if (!v32)
  {
    v35 = self->_loggingConnection;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v42 = v31;
      __int16 v43 = 2112;
      __int16 v44 = v33;
      _os_log_error_impl(&dword_1D1805000, v35, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Failed to deserialize persisted layout configuration %@: %@", buf, 0x16u);
    }
    goto LABEL_28;
  }
  if (([v32 isEqualToLayoutConfiguration:self->_deviceWallpaperLayoutConfiguration] & 1) == 0)
  {
    id v36 = self->_loggingConnection;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      deviceWallpaperLayoutConfiguration = self->_deviceWallpaperLayoutConfiguration;
      *(_DWORD *)buf = 138412546;
      __int16 v42 = v32;
      __int16 v43 = 2112;
      __int16 v44 = deviceWallpaperLayoutConfiguration;
      _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_DEFAULT, "[PGWallpaperSuggestionAssetGater] Layout configuration no longer valid, %@ vs device %@, invalidating", buf, 0x16u);
    }
LABEL_28:

    goto LABEL_29;
  }

LABEL_31:
LABEL_32:

  return v11;
}

- (BOOL)assetIsUsingHeadroom:(id)a3
{
  id v3 = [(PGWallpaperSuggestionAssetGater *)self existingSegmentationScoresWithAsset:a3];
  if (v3) {
    char v4 = [MEMORY[0x1E4F8A378] settlingEffectLayoutContainsHeadroomForSegmentationScores:v3];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)existingSegmentationScoresWithAsset:(id)a3
{
  id v3 = [(PGWallpaperSuggestionAssetGater *)self existingWallpaperPropertiesWithAsset:a3];
  char v4 = v3;
  if (v3)
  {
    double v5 = [v3 objectForKeyedSubscript:@"segmentationScores"];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)logCurrentSettlingEffectGatingStatisticsWithPrefix:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v4;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ Settling Effect Gating Statistics:", buf, 0xCu);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    id v6 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v31;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "%@ %d failed feature enablement", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    id v7 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v30;
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "%@ %d failed hardware support", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    char v8 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v29;
    _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "%@ %d failed to download resources", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int v9 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v28;
    _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "%@ %d failed adjustments supported", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v27;
    _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "%@ %d failed with generic error", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v26;
    _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "%@ %d failed metadata check", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int v12 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v25;
    _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "%@ %d failed stabilization", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int v13 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v24;
    _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "%@ %d failed video quality", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v23;
    _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "%@ %d failed metadata integrity", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v22;
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "%@ %d failed FRC", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    BOOL v16 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v21;
    _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "%@ %d failed video decision", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    BOOL v17 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v20;
    _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "%@ %d failed layout decision", buf, 0x12u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = loggingConnection;
    [(PGWallpaperSuggestionAssetGater *)self settlingEffectGatingStatistics];
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 1024;
    int v35 = v19;
    _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "%@ %d failed still transition", buf, 0x12u);
  }
}

- (void)logCurrentGatingStatisticsWithPrefix:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ AssetGater Statistics:", (uint8_t *)&v16, 0xCu);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int numberOfAssetsGated = self->_currentGatingStatistics.numberOfAssetsGated;
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = numberOfAssetsGated;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfAssetsGated: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int numberOfMediaAnalysisRequest = self->_currentGatingStatistics.numberOfMediaAnalysisRequest;
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = numberOfMediaAnalysisRequest;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfMediaAnalysisRequest: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int numberOfValidWallpaperPropertiesRequested = self->_currentGatingStatistics.numberOfValidWallpaperPropertiesRequested;
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = numberOfValidWallpaperPropertiesRequested;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfValidWallpaperPropertiesRequested: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int numberOfInvalidAnalysisVersion = self->_currentGatingStatistics.numberOfInvalidAnalysisVersion;
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = numberOfInvalidAnalysisVersion;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfInvalidAnalysisVersion: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int numberOfFailuresFromNilResult = self->_currentGatingStatistics.numberOfFailuresFromNilResult;
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = numberOfFailuresFromNilResult;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfFailuresFromNilResult: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int numberOfSuccessFromCache = self->_currentGatingStatistics.numberOfSuccessFromCache;
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = numberOfSuccessFromCache;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfSuccessFromCache: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int numberOfFailuresFromCache = self->_currentGatingStatistics.numberOfFailuresFromCache;
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = numberOfFailuresFromCache;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfFailuresFromCache: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int numberOfSuccessFromMediaAnalysisRequests = self->_currentGatingStatistics.numberOfSuccessFromMediaAnalysisRequests;
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = numberOfSuccessFromMediaAnalysisRequests;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfSuccessFromMediaAnalysisRequests: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int numberOfFailuresFromMediaAnalysisRequests = self->_currentGatingStatistics.numberOfFailuresFromMediaAnalysisRequests;
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = numberOfFailuresFromMediaAnalysisRequests;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfFailuresFromMediaAnalysisRequests: %d", (uint8_t *)&v16, 0x12u);
    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    int numberOfTimeoutsFromMediaAnalysisRequests = self->_currentGatingStatistics.numberOfTimeoutsFromMediaAnalysisRequests;
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 1024;
    int v19 = numberOfTimeoutsFromMediaAnalysisRequests;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "%@ numberOfTimeoutsFromMediaAnalysisRequests: %d", (uint8_t *)&v16, 0x12u);
  }
}

- (id)gateAsset:(id)a3 hasPetFace:(BOOL *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = 0;
  id v7 = [(PGWallpaperSuggestionAssetGater *)self _gateAsset:v6 wallpaperProperties:&v22 progressBlock:&__block_literal_global_32722];
  id v8 = v22;
  int v9 = v8;
  if (a4)
  {
    if (v8)
    {
LABEL_3:
      *a4 = [(PGWallpaperSuggestionAssetGater *)self _hasPetFaceWithWallpaperProperties:v9];
      goto LABEL_13;
    }
    uint64_t v10 = [v6 photoAnalysisWallpaperProperties];
    BOOL v11 = [v10 wallpaperPropertiesData];

    if (v11)
    {
      id v21 = 0;
      int v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:&v21];
      id v12 = v21;
      int v13 = v12;
      if (v9)
      {

        goto LABEL_3;
      }
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        int v19 = loggingConnection;
        uint64_t v20 = [v6 localIdentifier];
        *(_DWORD *)buf = 138412546;
        int v24 = v20;
        __int16 v25 = 2112;
        int v26 = v13;
        _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Failed deserializing wallpaper properties on asset %@: %@", buf, 0x16u);
      }
    }
    *a4 = 0;
    uint64_t v15 = self->_loggingConnection;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = v15;
      id v17 = [v6 uuid];
      *(_DWORD *)buf = 138412290;
      int v24 = v17;
      _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAssetGater] No wallpaper properties available for asset %@, pet face check is going to fail.", buf, 0xCu);
    }
    int v9 = 0;
  }
LABEL_13:

  return v7;
}

- (id)gateAsset:(id)a3 progressBlock:(id)a4
{
  return [(PGWallpaperSuggestionAssetGater *)self _gateAsset:a3 wallpaperProperties:0 progressBlock:a4];
}

- (id)_gateAsset:(id)a3 wallpaperProperties:(id *)a4 progressBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(PGWallpaperAssetGaterResult);
  ++self->_currentGatingStatistics.numberOfAssetsGated;
  self->_isLastGatingCallingMediaAnalysis = 0;
  uint64_t v11 = [(PGWallpaperSuggestionAssetGater *)self existingWallpaperPropertiesWithAsset:v8];
  if (v11)
  {
    id v12 = (void *)v11;
    int v13 = [(PGWallpaperSuggestionAssetGater *)self gatingResultWithWallpaperProperties:v11];

    if (![v13 passesAnyGating]
      || [(PGWallpaperSuggestionAssetGater *)self cacheExistsForAsset:v8])
    {
      ++self->_currentGatingStatistics.numberOfValidWallpaperPropertiesRequested;
      if ([v13 passesAnyGating]) {
        ++self->_currentGatingStatistics.numberOfSuccessFromCache;
      }
      else {
        ++self->_currentGatingStatistics.numberOfFailuresFromCache;
      }
      goto LABEL_25;
    }
  }
  else
  {
    int v13 = v10;
  }
  int numberOfInvalidAnalysisVersion = self->_currentGatingStatistics.numberOfInvalidAnalysisVersion;
  int numberOfFailuresFromNilResult = self->_currentGatingStatistics.numberOfFailuresFromNilResult;
  int numberOfTimeoutsFromMediaAnalysisRequests = self->_currentGatingStatistics.numberOfTimeoutsFromMediaAnalysisRequests;
  uint64_t v16 = [(PGWallpaperSuggestionAssetGater *)self requestAndPersistWallpaperPropertiesForAsset:v8 progressBlock:v9];
  id v12 = (void *)v16;
  int v17 = self->_currentGatingStatistics.numberOfInvalidAnalysisVersion;
  int v18 = self->_currentGatingStatistics.numberOfTimeoutsFromMediaAnalysisRequests;
  if (!v16
    && v17 == numberOfInvalidAnalysisVersion
    && self->_currentGatingStatistics.numberOfFailuresFromNilResult == numberOfFailuresFromNilResult)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "Error in requestAndPersistWallpaperPropertiesForAsset, unknown failure", buf, 2u);
    }
  }
  else if (v16)
  {
    uint64_t v20 = [(PGWallpaperSuggestionAssetGater *)self gatingResultWithWallpaperProperties:v16];

    int v13 = (void *)v20;
  }
  if (![v13 passesAnyGating] || self->_coversTracks) {
    [(PGWallpaperSuggestionAssetGater *)self clearCacheOfAsset:v8];
  }
  int v21 = [v13 passesAnyGating];
  uint64_t v22 = 76;
  if (v21) {
    uint64_t v22 = 72;
  }
  ++*(_DWORD *)((char *)&self->super.isa + v22);
  if (v17 == numberOfInvalidAnalysisVersion) {
    self->_isLastGatingCallingMediaAnalysis = 1;
  }
  if (v18 != numberOfTimeoutsFromMediaAnalysisRequests) {
    [v13 setDidTimeout:1];
  }
LABEL_25:
  if (a4) {
    *a4 = v12;
  }

  return v13;
}

- (PGWallpaperSuggestionAssetGater)initWithType:(unint64_t)a3 loggingConnection:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGWallpaperSuggestionAssetGater;
  id v8 = [(PGWallpaperSuggestionAssetGater *)&v15 init];
  id v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    v8->_enableSettlingEffect = 1;
    uint64_t v10 = [MEMORY[0x1E4F744E8] analysisService];
    mediaAnalysisService = v9->_mediaAnalysisService;
    v9->_mediaAnalysisService = (VCPMediaAnalysisService *)v10;

    uint64_t v12 = [MEMORY[0x1E4F8CE48] deviceConfiguration];
    deviceWallpaperLayoutConfiguration = v9->_deviceWallpaperLayoutConfiguration;
    v9->_deviceWallpaperLayoutConfiguration = (PFWallpaperCompoundDeviceConfiguration *)v12;

    objc_storeStrong((id *)&v9->_loggingConnection, a4);
    *(_OWORD *)&v9->_settlingEffectGatingStatistics.numberOfEliminationsThruFRC = 0u;
    *(_OWORD *)&v9->_settlingEffectGatingStatistics.numberOfEliminationsThruStabilization = 0u;
    *(_OWORD *)&v9->_settlingEffectGatingStatistics.numberOfEliminationsThruResourceAvailability = 0u;
    *(_OWORD *)&v9->_currentGatingStatistics.int numberOfFailuresFromMediaAnalysisRequests = 0u;
    *(_OWORD *)&v9->_currentGatingStatistics.int numberOfFailuresFromNilResult = 0u;
    *(_OWORD *)&v9->_currentGatingStatistics.int numberOfAssetsGated = 0u;
  }

  return v9;
}

+ (int)numberOfFailuresAfterStabilizationFromStatistics:(id *)a3
{
  return vaddvq_s32(vaddq_s32(*(int32x4_t *)&a3->var0, *(int32x4_t *)&a3->var4));
}

+ (double)sydneyMD4FaceQualityFromAsset:(id)a3
{
  id v3 = [a3 photoAnalysisWallpaperProperties];
  id v4 = [v3 wallpaperPropertiesData];

  if (v4)
  {
    double v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
    id v6 = v5;
    double v7 = 0.0;
    if (v5)
    {
      id v8 = [v5 objectForKeyedSubscript:@"faceQualityModelVersion"];
      uint64_t v9 = [v8 unsignedIntegerValue];

      if (v9 == 3737841667)
      {
        uint64_t v10 = [v6 objectForKeyedSubscript:@"faceQualityScore"];
        [v10 doubleValue];
        double v7 = v11;
      }
    }
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (unint64_t)_posterClassificationFromAssetGaterType:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)assetFetchPropertySetsForGating
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F39480];
  v5[0] = *MEMORY[0x1E4F39538];
  v5[1] = v2;
  v5[2] = *MEMORY[0x1E4F394F8];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  return v3;
}

+ (unint64_t)currentWallpaperPropertiesVersion
{
  return 10;
}

@end