@interface PHAsset(Curation)
+ (BOOL)isScore:()Curation closeToValue:;
+ (id)_filterPersonUUIDs:()Curation fromPersonUUIDsByAssetUUID:personUUIDByMergeCandidateUUID:;
+ (id)_personUUIDsByAssetUUIDWithAssetUUIDs:()Curation personUUIDs:photoLibrary:;
+ (id)_personUUIDsByAssetUUIDWithAssets:()Curation personUUIDs:;
+ (id)_petUUIDsByAssetUUIDWithAssetUUIDs:()Curation photoLibrary:;
+ (id)clsAllAssetsFromFetchResult:()Curation prefetchOptions:curationContext:;
+ (id)verifiedPersonLocalIdentifiersByAssetUUIDWithAssets:()Curation;
+ (uint64_t)clsPrefetchOptionsForKeyAsset;
+ (void)_populateAsset:()Curation withPersonUUIDs:consolidatedPersonUUIDs:petUUIDs:;
+ (void)prefetchOnAssets:()Curation options:curationContext:;
+ (void)prefetchScenesOnAssets:()Curation;
- (BOOL)clsFaceInformationArePrefetched;
- (BOOL)clsIsGuestAsset;
- (BOOL)clsIsLongExposure;
- (BOOL)clsIsLoopOrBounce;
- (BOOL)clsIsSceneProcessed;
- (BOOL)clsPeopleCountIsPrefetched;
- (BOOL)clsPersonLocalIdentifiersArePrefetched;
- (BOOL)clsSceneClassificationsArePrefetched;
- (BOOL)hasCurationModel;
- (BOOL)isSubtype:()Curation;
- (double)clsActivityScore;
- (double)clsAestheticScore;
- (double)clsAutoplaySuggestionScore;
- (double)clsContentScoreRecomputingIfNeeded:()Curation;
- (double)clsDuration;
- (double)clsExposureScore;
- (double)clsFaceScore;
- (double)clsIconicSceneScoreWithSceneGeography:()Curation;
- (double)clsIconicScore;
- (double)clsSharpnessScore;
- (double)clsSquareCropScore;
- (double)clsVideoScore;
- (double)clsWallpaperScore;
- (double)cropScoreForTargetAspectRatio:()Curation forFaces:;
- (double)pl_coordinate;
- (double)pl_gpsHorizontalAccuracy;
- (double)scoreInContext:()Curation;
- (float)clsBehavioralScore;
- (float)clsInteractionScore;
- (id)clsConsolidatedPersonLocalIdentifiers;
- (id)clsFaceInformationSummary;
- (id)clsPersonAndPetLocalIdentifiers;
- (id)clsPersonLocalIdentifiers;
- (id)clsPetLocalIdentifiers;
- (id)clsProcessedSignals;
- (id)clsSceneClassifications;
- (id)clsSceneprint;
- (id)clsUnprefetchedPersonLocalIdentifiers;
- (id)curationModel;
- (uint64_t)clsAvoidIfPossibleAsKeyItemForMemories:()Curation allowGuestAsset:;
- (uint64_t)clsAvoidIfPossibleAsKeyItemForMemories:()Curation allowGuestAsset:reason:;
- (uint64_t)clsContentScore;
- (uint64_t)clsHasCustomPlaybackVariation;
- (uint64_t)clsHasInterestingAudioClassification;
- (uint64_t)clsHasInterestingScenes;
- (uint64_t)clsHasPoorResolution;
- (uint64_t)clsInterestingAudioClassifications;
- (uint64_t)clsIsAestheticallyPrettyGood;
- (uint64_t)clsIsBlurry;
- (uint64_t)clsIsFaceProcessed;
- (uint64_t)clsIsInhabited;
- (uint64_t)clsIsInterestingHDR;
- (uint64_t)clsIsInterestingLivePhoto;
- (uint64_t)clsIsInterestingPanorama;
- (uint64_t)clsIsInterestingSDOF;
- (uint64_t)clsIsInterestingVideo;
- (uint64_t)clsIsNonMemorable;
- (uint64_t)clsIsScreenshotOrScreenRecording;
- (uint64_t)clsIsTragicFailure;
- (uint64_t)clsIsUtility;
- (uint64_t)clsPeopleCount;
- (uint64_t)clsPlayCount;
- (uint64_t)clsShareCount;
- (uint64_t)clsSimilarityModelVersion;
- (uint64_t)clsVideoFaceCount;
- (uint64_t)clsViewCount;
- (uint64_t)isGold;
- (uint64_t)isRegularGem;
- (uint64_t)isShinyGem;
- (uint64_t)prepareWithAlternateJunkingHeuristics:()Curation withContext:curationContext:;
- (void)cacheCurationScore:()Curation;
- (void)clsCacheIconicSceneScore:()Curation;
- (void)clsCacheIsUtility:()Curation;
- (void)clsSetConsolidatedPersonLocalIdentifiers:()Curation;
- (void)clsSetFaceInformationSummary:()Curation;
- (void)clsSetPeopleCount:()Curation;
- (void)clsSetPersonLocalIdentifiers:()Curation;
- (void)clsSetPetLocalIdentifiers:()Curation;
- (void)clsSetProcessedSignals:()Curation;
- (void)clsSetSceneClassifications:()Curation;
- (void)setCurationModel:()Curation;
@end

@implementation PHAsset(Curation)

- (BOOL)clsFaceInformationArePrefetched
{
  v1 = objc_getAssociatedObject(a1, "kCLSFaceInformationSummaryString");
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)clsSceneClassificationsArePrefetched
{
  v1 = objc_getAssociatedObject(a1, "clsSceneClassifications");
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)clsPeopleCountIsPrefetched
{
  v1 = objc_getAssociatedObject(a1, "clsPeopleCount");
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)clsPersonLocalIdentifiersArePrefetched
{
  v1 = objc_getAssociatedObject(a1, "clsPersonLocalIdentifiers");
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)prepareWithAlternateJunkingHeuristics:()Curation withContext:curationContext:
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a1 curationModel];
  v11 = v10;
  if (a3)
  {
    v12 = [v9 userFeedbackCalculator];
    uint64_t v13 = [v11 isUtilityForMemoriesWithAsset:a1 userFeedbackCalculator:v12];
  }
  else
  {
    uint64_t v13 = [v10 isUtilityWithAsset:a1];
  }

  uint64_t v14 = v13 ^ [a1 clsIsUtility];
  if (v14 == 1)
  {
    [a1 clsCacheIsUtility:v13];
    [a1 scoreInContext:v8];
    double v16 = v15;
    [a1 curationScore];
    if (v16 != v17) {
      [a1 cacheCurationScore:v16];
    }
  }

  return v14;
}

- (uint64_t)clsIsTragicFailure
{
  BOOL v2 = [a1 curationModel];
  uint64_t v3 = [v2 isTragicFailureWithImageAsset:a1];

  return v3;
}

- (uint64_t)clsHasCustomPlaybackVariation
{
  uint64_t result = [a1 isSubtype:8];
  if (result) {
    return [a1 playbackVariation] != 0;
  }
  return result;
}

- (uint64_t)clsInterestingAudioClassifications
{
  BOOL v2 = [a1 curationModel];
  uint64_t v3 = [v2 interestingAudioClassificationsWithAsset:a1];

  return v3;
}

- (uint64_t)clsHasInterestingAudioClassification
{
  BOOL v2 = [a1 curationModel];
  uint64_t v3 = [v2 hasInterestingAudioClassificationWithAsset:a1];

  return v3;
}

- (uint64_t)clsIsInterestingHDR
{
  BOOL v2 = [a1 curationModel];
  uint64_t v3 = [v2 isInterestingHDRWithAsset:a1];

  return v3;
}

- (uint64_t)clsIsInterestingSDOF
{
  BOOL v2 = [a1 curationModel];
  uint64_t v3 = [v2 isInterestingSDOFWithAsset:a1];

  return v3;
}

- (uint64_t)clsIsInterestingPanorama
{
  BOOL v2 = [a1 curationModel];
  uint64_t v3 = [v2 isInterestingPanoramaWithAsset:a1];

  return v3;
}

- (uint64_t)clsIsInterestingLivePhoto
{
  BOOL v2 = [a1 curationModel];
  uint64_t v3 = [v2 isInterestingLivePhotoWithAsset:a1];

  return v3;
}

- (double)clsAutoplaySuggestionScore
{
  v1 = [a1 mediaAnalysisProperties];
  [v1 autoplaySuggestionScore];
  double v3 = v2;

  return v3;
}

- (BOOL)clsIsLongExposure
{
  return [a1 playbackVariation] == 3;
}

- (BOOL)clsIsLoopOrBounce
{
  return [a1 playbackVariation] - 1 < 2;
}

- (uint64_t)clsIsInterestingVideo
{
  float v2 = [a1 curationModel];
  uint64_t v3 = [v2 isInterestingVideoWithAsset:a1];

  return v3;
}

- (double)scoreInContext:()Curation
{
  id v4 = a3;
  v5 = [a1 curationModel];
  [v5 scoreWithAsset:a1 inContext:v4];
  double v7 = v6;

  return v7;
}

- (void)cacheCurationScore:()Curation
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "clsCurationScore", v2, (void *)1);
}

- (double)clsContentScoreRecomputingIfNeeded:()Curation
{
  v5 = objc_getAssociatedObject(a1, "clsCurationScore");
  double v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
  }
  else
  {
    [a1 curationScore];
    double v8 = v9;
    if (v9 == 0.0 && a3 != 0)
    {
      v11 = [a1 curationModel];
      [v11 scoreWithAsset:a1 inContext:0];
      double v8 = v12;

      [a1 cacheCurationScore:v8];
    }
  }

  return v8;
}

- (uint64_t)clsContentScore
{
  return [a1 clsContentScoreRecomputingIfNeeded:1];
}

- (double)cropScoreForTargetAspectRatio:()Curation forFaces:
{
  [a1 faceAreaMinX];
  double v7 = v6;
  [a1 faceAreaMinY];
  double v9 = v8;
  [a1 faceAreaMaxX];
  double v11 = v10;
  [a1 faceAreaMaxY];
  double v12 = v11 - v7;
  double v14 = v13 - v9;
  double v32 = 0.0;
  double v15 = v7;
  double v16 = v9;
  double v17 = v12;
  double v18 = v13 - v9;
  if ((a4 & 1) == 0)
  {
    [a1 acceptableCropRect];
    double v15 = v19;
    double v16 = v20;
    double v17 = v21;
    double v18 = v22;
  }
  v23 = (void *)MEMORY[0x263F5DF00];
  uint64_t v24 = [a1 pixelWidth];
  uint64_t v25 = [a1 pixelHeight];
  [a1 preferredCropRect];
  objc_msgSend(v23, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", v24, v25, &v32, a2, 0.0, 0.0, 0.0, 0.0, v26, v27, v28, v29, *(void *)&v15, *(void *)&v16, *(void *)&v17, *(void *)&v18,
    *(void *)&v7,
    1.0 - (v9 + v14),
    *(void *)&v12,
    *(void *)&v14);
  return v32;
}

- (double)clsSquareCropScore
{
  double v2 = 0.0;
  objc_msgSend(a1, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v2, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0);
  return v2;
}

- (uint64_t)clsHasInterestingScenes
{
  double v2 = [a1 curationModel];
  uint64_t v3 = [v2 hasInterestingScenesWithAsset:a1];

  return v3;
}

- (uint64_t)clsHasPoorResolution
{
  double v2 = [a1 curationModel];
  uint64_t v3 = [v2 hasPoorResolutionWithAsset:a1];

  return v3;
}

- (uint64_t)clsAvoidIfPossibleAsKeyItemForMemories:()Curation allowGuestAsset:reason:
{
  if ((a4 & 1) != 0 || ![a1 clsIsGuestAsset])
  {
    double v9 = [a1 curationModel];
    double v10 = v9;
    if (a3 && [v9 avoidIfPossibleForMemoryKeyAssetWithAsset:a1])
    {
      if (a5) {
        *a5 = @"Video";
      }
      uint64_t v8 = 1;
    }
    else
    {
      memset(v13, 0, sizeof(v13));
      uint64_t v11 = [v10 avoidIfPossibleForKeyAssetWithAsset:a1 statistics:v13];
      uint64_t v8 = v11;
      if (a5 && v11)
      {
        *a5 = +[CLSCurationModel firstReasonForAvoidForKeyAssetFromStatistics:v13];
      }
    }
  }
  else
  {
    if (a5) {
      *a5 = @"Guest Asset";
    }
    return 1;
  }
  return v8;
}

- (uint64_t)clsAvoidIfPossibleAsKeyItemForMemories:()Curation allowGuestAsset:
{
  return [a1 clsAvoidIfPossibleAsKeyItemForMemories:a3 allowGuestAsset:a4 reason:0];
}

- (uint64_t)clsIsInhabited
{
  double v2 = [a1 curationModel];
  uint64_t v3 = [v2 isInhabitedWithAsset:a1];

  return v3;
}

- (uint64_t)clsIsBlurry
{
  double v2 = [a1 curationModel];
  uint64_t v3 = [v2 isBlurryWithAsset:a1];

  return v3;
}

- (uint64_t)clsSimilarityModelVersion
{
  v1 = [a1 curationModel];
  uint64_t v2 = [v1 similarityModelVersion];

  return v2;
}

- (id)clsSceneprint
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_getAssociatedObject(a1, "clsSceneprint");
  if (!v2)
  {
    v5 = [a1 sceneprintProperties];
    double v6 = [v5 sceneprint];

    if (v6)
    {
      id v13 = 0;
      uint64_t v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v13];
      id v7 = v13;
      uint64_t v8 = v7;
      if (v3)
      {

        objc_setAssociatedObject(a1, "clsSceneprint", v3, (void *)1);
LABEL_13:

        goto LABEL_14;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        double v12 = [a1 uuid];
        *(_DWORD *)buf = 138412546;
        double v15 = v12;
        __int16 v16 = 2112;
        double v17 = v8;
        _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error unarchiving sceneprint for asset %@: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      double v9 = [a1 uuid];
      *(_DWORD *)buf = 138412290;
      double v15 = v9;
      _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Sceneprint not available for asset %@", buf, 0xCu);
    }
    double v10 = [MEMORY[0x263EFF9D0] null];
    objc_setAssociatedObject(a1, "clsSceneprint", v10, (void *)1);

    uint64_t v3 = 0;
    goto LABEL_13;
  }
  uint64_t v3 = (void *)v2;
  id v4 = [MEMORY[0x263EFF9D0] null];

  if (v3 == v4)
  {

    uint64_t v3 = 0;
  }
LABEL_14:
  return v3;
}

- (void)clsSetSceneClassifications:()Curation
{
}

- (id)clsSceneClassifications
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_getAssociatedObject(a1, "clsSceneClassifications");
  if (!v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v4 = [a1 localIdentifier];
      int v5 = 134218242;
      double v6 = a1;
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "clsSceneClassifications not prefetched for asset %p %@", (uint8_t *)&v5, 0x16u);
    }
    uint64_t v2 = [a1 sceneClassifications];
  }
  return v2;
}

- (double)clsFaceScore
{
  v1 = [a1 clsFaceInformationSummary];
  [v1 averageFaceQuality];
  double v3 = v2;

  return v3;
}

- (uint64_t)clsVideoFaceCount
{
  double v2 = [a1 mediaAnalysisProperties];
  if (v2)
  {
    double v3 = [a1 mediaAnalysisProperties];
    uint64_t v4 = [v3 faceCount];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (double)clsActivityScore
{
  double v2 = [a1 mediaAnalysisProperties];
  if (v2)
  {
    double v3 = [a1 mediaAnalysisProperties];
    [v3 activityScore];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)clsVideoScore
{
  double v2 = [a1 mediaAnalysisProperties];
  if (v2)
  {
    double v3 = [a1 mediaAnalysisProperties];
    [v3 videoScore];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)clsAestheticScore
{
  [a1 overallAestheticScore];
  return v1;
}

- (double)clsSharpnessScore
{
  double v2 = [a1 mediaAnalysisProperties];
  if (v2)
  {
    double v3 = [a1 mediaAnalysisProperties];
    [v3 blurrinessScore];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)clsWallpaperScore
{
  double v2 = [a1 mediaAnalysisProperties];
  if (v2)
  {
    double v3 = [a1 mediaAnalysisProperties];
    [v3 wallpaperScore];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (double)clsExposureScore
{
  double v2 = [a1 mediaAnalysisProperties];
  if (v2)
  {
    double v3 = [a1 mediaAnalysisProperties];
    [v3 exposureScore];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.5;
  }

  return v5;
}

- (id)clsProcessedSignals
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v2 = objc_getAssociatedObject(a1, "kCLSProcessedSignalsString");
  if (!v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    float v4 = [a1 localIdentifier];
    int v5 = 134218242;
    double v6 = a1;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_fault_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "processedSignals not prefetched for asset %p %@", (uint8_t *)&v5, 0x16u);
  }
  return v2;
}

- (void)clsSetProcessedSignals:()Curation
{
}

- (id)clsFaceInformationSummary
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v2 = objc_getAssociatedObject(a1, "kCLSFaceInformationSummaryString");
  if (!v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    float v4 = [a1 localIdentifier];
    int v5 = 134218242;
    double v6 = a1;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_fault_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "faceInformationSummary not prefetched for asset %p %@", (uint8_t *)&v5, 0x16u);
  }
  return v2;
}

- (void)clsSetFaceInformationSummary:()Curation
{
}

- (void)clsSetPeopleCount:()Curation
{
}

- (uint64_t)clsPeopleCount
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v2 = objc_getAssociatedObject(a1, "clsPeopleCount");
  double v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 unsignedIntegerValue];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      __int16 v7 = [a1 localIdentifier];
      int v8 = 134218242;
      uint64_t v9 = a1;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "clsPeopleCount not prefetched for asset %p %@", (uint8_t *)&v8, 0x16u);
    }
    int v5 = [a1 clsUnprefetchedPersonLocalIdentifiers];
    uint64_t v4 = [v5 count];
  }
  return v4;
}

- (id)clsUnprefetchedPersonLocalIdentifiers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_getAssociatedObject(a1, "clsPersonLocalIdentifiers");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (([a1 clsIsScreenshotOrScreenRecording] & 1) == 0)
    {
      uint64_t v4 = [a1 photoLibrary];
      int v5 = [v4 librarySpecificFetchOptions];

      [v5 setPersonContext:1];
      double v6 = [MEMORY[0x263F14E88] fetchPersonsInAsset:a1 options:v5];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) localIdentifier];
            if (v11) {
              [v3 addObject:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v8);
      }
    }
    id v2 = v3;
    objc_setAssociatedObject(a1, "clsPersonLocalIdentifiers", v2, (void *)1);
    uint64_t v12 = NSNumber;
    uint64_t v13 = [v2 count];

    double v14 = [v12 numberWithUnsignedInteger:v13];
    objc_setAssociatedObject(a1, "clsPeopleCount", v14, (void *)1);
  }
  return v2;
}

- (void)clsSetConsolidatedPersonLocalIdentifiers:()Curation
{
}

- (id)clsConsolidatedPersonLocalIdentifiers
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = objc_getAssociatedObject(a1, "clsConsolidatedPersonLocalIdentifiers");
  if (!v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [a1 localIdentifier];
      int v5 = 134218242;
      double v6 = a1;
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "clsConsolidatedPersonLocalIdentifiers not prefetched for asset %p %@", (uint8_t *)&v5, 0x16u);
    }
    id v2 = (void *)MEMORY[0x263EFFA68];
  }
  return v2;
}

- (void)clsSetPersonLocalIdentifiers:()Curation
{
  id v4 = a3;
  objc_setAssociatedObject(a1, "clsPersonLocalIdentifiers", v4, (void *)1);
  int v5 = NSNumber;
  uint64_t v6 = [v4 count];

  id v7 = [v5 numberWithUnsignedInteger:v6];
  objc_setAssociatedObject(a1, "clsPeopleCount", v7, (void *)1);
}

- (id)clsPersonLocalIdentifiers
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = objc_getAssociatedObject(a1, "clsPersonLocalIdentifiers");
  if (!v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v4 = [a1 localIdentifier];
      int v5 = 134218242;
      uint64_t v6 = a1;
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "clsPersonLocalIdentifiers not prefetched for asset %p %@", (uint8_t *)&v5, 0x16u);
    }
    id v2 = [a1 clsUnprefetchedPersonLocalIdentifiers];
  }
  return v2;
}

- (void)clsSetPetLocalIdentifiers:()Curation
{
}

- (id)clsPetLocalIdentifiers
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = objc_getAssociatedObject(a1, "clsPetLocalIdentifiers");
  id v3 = v2;
  if (!v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [a1 localIdentifier];
      int v7 = 134218242;
      uint64_t v8 = a1;
      __int16 v9 = 2112;
      __int16 v10 = v6;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "clsPetLocalIdentifiers not prefetched for asset %p %@", (uint8_t *)&v7, 0x16u);
    }
    id v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v2;

  return v4;
}

- (id)clsPersonAndPetLocalIdentifiers
{
  id v2 = [a1 clsPersonLocalIdentifiers];
  id v3 = [a1 clsPetLocalIdentifiers];
  id v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return v4;
}

- (double)pl_gpsHorizontalAccuracy
{
  float v1 = [a1 coarseLocationProperties];
  [v1 gpsHorizontalAccuracy];
  double v3 = v2;

  return v3;
}

- (double)pl_coordinate
{
  double v2 = [a1 location];

  if (!v2) {
    return *MEMORY[0x263F00B58];
  }
  double v3 = [a1 location];
  [v3 coordinate];
  double v5 = v4;

  if (v5 == 0.0) {
    return *MEMORY[0x263F00B58];
  }
  return v5;
}

- (void)clsCacheIconicSceneScore:()Curation
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "clsIconicSceneScore", v2, (void *)1);
}

- (double)clsIconicSceneScoreWithSceneGeography:()Curation
{
  id v4 = a3;
  double v5 = objc_getAssociatedObject(a1, "clsIconicSceneScore");
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
  }
  else
  {
    __int16 v9 = [a1 curationModel];
    __int16 v10 = [v9 sceneModel];
    uint64_t v11 = [a1 clsSceneClassifications];
    uint64_t v12 = [v10 sceneIdentifiersFromSceneClassifications:v11 passingThresholdOfType:1];

    [a1 locationCoordinate];
    +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:assetLatitude:assetLongitude:sceneGeography:maxScenesCount:](PNAssetCurationUtilities, "assetIconicScoreForSceneClassificationIdentifiers:assetLatitude:assetLongitude:sceneGeography:maxScenesCount:", v12, v4, 5);
    double v8 = v13;
    objc_msgSend(a1, "clsCacheIconicSceneScore:");
  }
  return v8;
}

- (double)clsIconicScore
{
  float v1 = [a1 iconicScoreProperties];
  [v1 iconicScore];
  double v3 = v2;

  return v3;
}

- (BOOL)clsIsGuestAsset
{
  return [a1 sourceType] == 32;
}

- (uint64_t)clsIsFaceProcessed
{
  __int16 v2 = [a1 faceAnalysisVersion];
  if (*MEMORY[0x263F5D9E8] != v2) {
    return 1;
  }
  double v3 = [a1 faceAdjustmentVersion];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)clsIsSceneProcessed
{
  float v1 = [a1 sceneAnalysisProperties];
  __int16 v2 = [v1 sceneAnalysisVersion];
  BOOL v3 = *MEMORY[0x263F5D9F0] != v2;

  return v3;
}

- (uint64_t)isRegularGem
{
  __int16 v2 = [a1 curationModel];
  uint64_t v3 = [v2 isRegularGemWithAsset:a1];

  return v3;
}

- (uint64_t)isShinyGem
{
  __int16 v2 = [a1 curationModel];
  uint64_t v3 = [v2 isShinyGemWithAsset:a1];

  return v3;
}

- (uint64_t)isGold
{
  __int16 v2 = [a1 curationModel];
  uint64_t v3 = [v2 isGoldWithAsset:a1];

  return v3;
}

- (float)clsBehavioralScore
{
  float v1 = [a1 curationProperties];
  [v1 behavioralScore];
  float v3 = v2;

  return v3;
}

- (float)clsInteractionScore
{
  float v1 = [a1 curationProperties];
  [v1 interactionScore];
  float v3 = v2;

  return v3;
}

- (uint64_t)clsIsAestheticallyPrettyGood
{
  float v2 = [a1 curationModel];
  uint64_t v3 = [v2 isAestheticallyPrettyGoodWithAsset:a1];

  return v3;
}

- (uint64_t)clsIsScreenshotOrScreenRecording
{
  if ([a1 isSubtype:4]) {
    return 1;
  }
  return [a1 isScreenRecording];
}

- (void)clsCacheIsUtility:()Curation
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "clsIsUtility", v2, (void *)1);
}

- (uint64_t)clsIsUtility
{
  id v2 = objc_getAssociatedObject(a1, "clsIsUtility");
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 BOOLValue];
  }
  else
  {
    double v5 = [a1 curationModel];
    uint64_t v4 = [v5 isUtilityWithAsset:a1];

    [a1 clsCacheIsUtility:v4];
  }

  return v4;
}

- (uint64_t)clsIsNonMemorable
{
  id v2 = [a1 curationModel];
  uint64_t v3 = [v2 isNonMemorableWithAsset:a1];

  return v3;
}

- (double)clsDuration
{
  [a1 duration];
  double Seconds = v2;
  if ([a1 isMediaSubtype:8])
  {
    uint64_t v4 = [a1 photoIrisProperties];
    double v5 = v4;
    if (v4) {
      [v4 photoIrisVideoDuration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
  }
  return Seconds;
}

- (BOOL)isSubtype:()Curation
{
  return (a3 & ~[a1 mediaSubtypes]) == 0;
}

- (uint64_t)clsShareCount
{
  float v1 = [a1 assetUserActivityProperties];
  uint64_t v2 = [v1 shareCount];

  return v2;
}

- (uint64_t)clsPlayCount
{
  float v1 = [a1 assetUserActivityProperties];
  uint64_t v2 = [v1 playCount];

  return v2;
}

- (uint64_t)clsViewCount
{
  float v1 = [a1 assetUserActivityProperties];
  uint64_t v2 = [v1 viewCount];

  return v2;
}

- (BOOL)hasCurationModel
{
  float v1 = objc_getAssociatedObject(a1, "clsCurationModel");
  BOOL v2 = v1 != 0;

  return v2;
}

- (void)setCurationModel:()Curation
{
}

- (id)curationModel
{
  BOOL v2 = objc_getAssociatedObject(a1, "clsCurationModel");
  if (!v2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_fault_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Asset curation requires a curation model, call [CLSCurationSession prepareAssets:] on your asset", v5, 2u);
    }
    uint64_t v3 = objc_alloc_init(CLSCurationSession);
    [a1 fetchPropertySetsIfNeeded];
    BOOL v2 = [(CLSCurationSession *)v3 curationModelForAsset:a1];
    [a1 setCurationModel:v2];
  }
  return v2;
}

+ (void)prefetchOnAssets:()Curation options:curationContext:
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v83 = a5;
  double v8 = [v7 firstObject];
  __int16 v9 = [v8 photoLibrary];
  if (!v9) {
    goto LABEL_68;
  }
  if ((a4 & 3) != 0)
  {
    int v98 = [v8 clsPeopleCountIsPrefetched] ^ 1;
    if ((a4 & 0x10) == 0) {
      goto LABEL_4;
    }
  }
  else
  {
    int v98 = 0;
    if ((a4 & 0x10) == 0)
    {
LABEL_4:
      int v10 = 0;
      if ((a4 & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      int v97 = 0;
      if ((a4 & 8) != 0) {
        goto LABEL_6;
      }
LABEL_10:
      int v99 = 0;
      goto LABEL_11;
    }
  }
  int v10 = [v8 canUseLocationCoordinateForLocation] ^ 1;
  if ((a4 & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  int v97 = [v8 clsSceneClassificationsArePrefetched] ^ 1;
  if ((a4 & 8) == 0) {
    goto LABEL_10;
  }
LABEL_6:
  int v99 = [v8 clsFaceInformationArePrefetched] ^ 1;
LABEL_11:
  if (((v98 | v10 | v97) & 1) != 0 || v99)
  {
    int v93 = v10;
    if ((a4 & 0xC) != 0)
    {
      uint64_t v11 = [v7 firstObject];
      char v12 = [v11 hasCurationModel];

      if ((v12 & 1) == 0)
      {
        double v13 = (void *)MEMORY[0x25A2E0AC0]();
        double v14 = [v83 curationSession];
        [v14 prepareAssets:v7];
      }
    }
    if ((v98 | v99) == 1)
    {
      contextb = (void *)MEMORY[0x25A2E0AC0]();
      double v15 = [v83 personUUIDByMergeCandidateUUID];
      long long v16 = [v83 verifiedPersonUUIDs];
      uint64_t v17 = [v83 hiddenOrBlockedPersonUUIDs];
      long long v18 = (void *)MEMORY[0x263EFFA08];
      long long v19 = [v15 allKeys];
      uint64_t v20 = [v18 setWithArray:v19];

      id v21 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [v21 unionSet:v16];
      v80 = (void *)v17;
      [v21 unionSet:v17];
      [v21 unionSet:v20];
      v74 = (void *)v20;
      double v22 = [v16 setByAddingObjectsFromSet:v20];
      v23 = objc_msgSend(v7, "_pl_map:", &__block_literal_global_285);
      uint64_t v24 = [a1 _personUUIDsByAssetUUIDWithAssetUUIDs:v23 personUUIDs:v21 photoLibrary:v9];
      v81 = v16;
      v96 = [a1 _filterPersonUUIDs:v16 fromPersonUUIDsByAssetUUID:v24 personUUIDByMergeCandidateUUID:0];
      v82 = v15;
      v95 = [a1 _filterPersonUUIDs:v22 fromPersonUUIDsByAssetUUID:v24 personUUIDByMergeCandidateUUID:v15];
      v94 = [a1 _petUUIDsByAssetUUIDWithAssetUUIDs:v23 photoLibrary:v9];
    }
    else
    {
      v94 = 0;
      v95 = 0;
      v96 = 0;
      v74 = 0;
      v80 = 0;
      v81 = 0;
      v82 = 0;
    }
    v76 = v9;
    id v77 = v7;
    v75 = v8;
    if (v99)
    {
      v104 = (void *)MEMORY[0x25A2E0AC0]();
      uint64_t v25 = [v9 librarySpecificFetchOptions];
      [v25 setIncludedDetectionTypes:&unk_27076A5F8];
      [v25 setIncludeTorsoAndFaceDetectionData:1];
      [v25 setWantsIncrementalChangeDetails:0];
      v101 = v25;
      uint64_t v26 = [MEMORY[0x263F14DF0] fetchFacesGroupedByAssetLocalIdentifierForAssets:v7 options:v25];
      id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      v79 = v26;
      context = [v26 objectEnumerator];
      uint64_t v28 = [context countByEnumeratingWithState:&v119 objects:v127 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v120;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v120 != v30) {
              objc_enumerationMutation(context);
            }
            double v32 = *(void **)(*((void *)&v119 + 1) + 8 * i);
            v33 = (void *)MEMORY[0x25A2E0AC0]();
            if ([v32 count])
            {
              unint64_t v34 = 0;
              do
              {
                v35 = (void *)MEMORY[0x25A2E0AC0]();
                v36 = [v32 objectAtIndexedSubscript:v34];
                v37 = [v36 uuid];
                [v27 addObject:v37];

                ++v34;
              }
              while (v34 < [v32 count]);
            }
          }
          uint64_t v29 = [context countByEnumeratingWithState:&v119 objects:v127 count:16];
        }
        while (v29);
      }

      v78 = [MEMORY[0x263F14DE8] detectionTraitsByFaceLocalIdentifierForFaceUUIDs:v27 photoLibrary:v76];

      id v7 = v77;
    }
    else
    {
      v78 = 0;
      v79 = 0;
    }
    if (v97)
    {
      v38 = (void *)MEMORY[0x25A2E0AC0]();
      v84 = [MEMORY[0x263F14EF0] fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:v7 sceneClassificationType:0 includeTemporalClassifications:0];
    }
    else
    {
      v84 = 0;
    }
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    obuint64_t j = v7;
    uint64_t v100 = [obj countByEnumeratingWithState:&v115 objects:v126 count:16];
    if (v100)
    {
      uint64_t v92 = *(void *)v116;
      do
      {
        v39 = 0;
        do
        {
          if (*(void *)v116 != v92) {
            objc_enumerationMutation(obj);
          }
          v40 = *(void **)(*((void *)&v115 + 1) + 8 * (void)v39);
          v41 = [v40 uuid];
          v42 = [v96 objectForKeyedSubscript:v41];
          v43 = [v95 objectForKeyedSubscript:v41];
          v44 = [v94 objectForKeyedSubscript:v41];
          if (v98) {
            [a1 _populateAsset:v40 withPersonUUIDs:v42 consolidatedPersonUUIDs:v43 petUUIDs:v44];
          }
          if (v93) {
            [v40 setCanUseLocationCoordinateForLocation:1];
          }
          if (v97)
          {
            v45 = [v40 localIdentifier];
            v46 = [v84 objectForKeyedSubscript:v45];

            v91 = v46;
            if (v46)
            {
              v89 = v44;
              v90 = v41;
              v102 = v43;
              v105 = v42;
              contexta = v39;
              uint64_t v87 = [MEMORY[0x263EFFA08] setWithArray:v46];
              objc_msgSend(v40, "clsSetSceneClassifications:");
              id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              v88 = v40;
              v48 = [v40 curationModel];
              v49 = [v48 sceneModel];

              long long v113 = 0u;
              long long v114 = 0u;
              long long v111 = 0u;
              long long v112 = 0u;
              id v50 = v46;
              uint64_t v51 = [v50 countByEnumeratingWithState:&v111 objects:v125 count:16];
              if (v51)
              {
                uint64_t v52 = v51;
                uint64_t v53 = *(void *)v112;
                do
                {
                  for (uint64_t j = 0; j != v52; ++j)
                  {
                    if (*(void *)v112 != v53) {
                      objc_enumerationMutation(v50);
                    }
                    v55 = *(void **)(*((void *)&v111 + 1) + 8 * j);
                    uint64_t v56 = [v55 extendedSceneIdentifier];
                    if (([v49 isResponsibleForSignalIdentifier:v56] & 1) == 0)
                    {
                      v57 = NSNumber;
                      [v55 confidence];
                      v58 = objc_msgSend(v57, "numberWithDouble:");
                      v59 = [NSNumber numberWithUnsignedLongLong:v56];
                      [v47 setObject:v58 forKeyedSubscript:v59];
                    }
                  }
                  uint64_t v52 = [v50 countByEnumeratingWithState:&v111 objects:v125 count:16];
                }
                while (v52);
              }

              v40 = v88;
              v60 = [v88 curationModel];
              v61 = [v60 processedSignalsFromSignals:v47];

              [v88 clsSetProcessedSignals:v61];
              v42 = v105;
              v39 = contexta;
              v44 = v89;
              v41 = v90;
              v43 = v102;
              v62 = (CLSAssetProcessedSignals *)v87;
            }
            else
            {
              id v63 = objc_alloc_init(MEMORY[0x263EFFA08]);
              [v40 clsSetSceneClassifications:v63];

              v62 = objc_alloc_init(CLSAssetProcessedSignals);
              [v40 clsSetProcessedSignals:v62];
            }
          }
          if (v99)
          {
            if ([v40 faceAnalysisVersionWasFetched])
            {
              v64 = [v83 userFeedbackCalculator];
              [v40 localIdentifier];
              v65 = contextc = v39;
              [v79 objectForKeyedSubscript:v65];
              v106 = v42;
              v67 = v66 = v41;
              [v67 fetchedObjects];
              v68 = v103 = v43;

              v69 = [v40 curationModel];
              v70 = [v40 clsIdentifier];
              [v69 faceInformationSummaryWithFaces:v68 detectionTraitsByFaceLocalIdentifier:v78 verifiedPersonUUIDs:v81 hiddenPersonUUIDs:v80 personUUIDByMergeCandidateUUID:v82 userFeedbackCalculator:v64 assetUUID:v70];
              v72 = v71 = v44;

              v41 = v66;
              v42 = v106;

              v39 = contextc;
              [v40 clsSetFaceInformationSummary:v72];

              v44 = v71;
              v43 = v103;
LABEL_61:

              goto LABEL_63;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              v64 = [v40 uuid];
              *(_DWORD *)buf = 138412290;
              v124 = v64;
              goto LABEL_61;
            }
          }
LABEL_63:

          v39 = (char *)v39 + 1;
        }
        while (v39 != (void *)v100);
        uint64_t v73 = [obj countByEnumeratingWithState:&v115 objects:v126 count:16];
        uint64_t v100 = v73;
      }
      while (v73);
    }

    __int16 v9 = v76;
    id v7 = v77;
    double v8 = v75;
  }
LABEL_68:
}

+ (void)prefetchScenesOnAssets:()Curation
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v26 = [MEMORY[0x263F14EF0] fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:v3 sceneClassificationType:0 includeTemporalClassifications:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v3;
  uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(obj);
        }
        double v5 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v6 = [v5 localIdentifier];
        id v7 = [v26 objectForKeyedSubscript:v6];

        if (v7)
        {
          uint64_t v31 = i;
          uint64_t v28 = [MEMORY[0x263EFFA08] setWithArray:v7];
          objc_msgSend(v5, "clsSetSceneClassifications:");
          id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          uint64_t v29 = v5;
          __int16 v9 = [v5 curationModel];
          int v10 = [v9 sceneModel];

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v30 = v7;
          id v11 = v7;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v33;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v33 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                uint64_t v17 = [v16 extendedSceneIdentifier];
                if (([v10 isResponsibleForSignalIdentifier:v17] & 1) == 0)
                {
                  long long v18 = NSNumber;
                  [v16 confidence];
                  long long v19 = objc_msgSend(v18, "numberWithDouble:");
                  uint64_t v20 = [NSNumber numberWithUnsignedLongLong:v17];
                  [v8 setObject:v19 forKeyedSubscript:v20];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v13);
          }

          id v21 = [v29 curationModel];
          double v22 = [v21 processedSignalsFromSignals:v8];

          [v29 clsSetProcessedSignals:v22];
          id v7 = v30;
          uint64_t i = v31;
          id v23 = (id)v28;
        }
        else
        {
          id v23 = objc_alloc_init(MEMORY[0x263EFFA08]);
          [v5 clsSetSceneClassifications:v23];
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v27);
  }
}

+ (id)clsAllAssetsFromFetchResult:()Curation prefetchOptions:curationContext:
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    id v10 = objc_alloc(MEMORY[0x263EFF8C0]);
    id v11 = [v8 fetchedObjects];
    uint64_t v12 = (void *)[v10 initWithArray:v11 copyItems:0];

    if ((a4 & 4) != 0
      && ([v8 fetchPropertySets],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 containsObject:*MEMORY[0x263F15028]],
          v13,
          (v14 & 1) == 0)
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Asking for scene information but sceneAnalysisVersion is not available", buf, 2u);
      if ((a4 & 8) != 0) {
        goto LABEL_6;
      }
    }
    else if ((a4 & 8) != 0)
    {
LABEL_6:
      double v15 = [v8 fetchPropertySets];
      char v16 = [v15 containsObject:*MEMORY[0x263F14FD0]];

      if ((v16 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long v18 = 0;
        _os_log_fault_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Asking for face information but faceAnalysisVersion is not available", v18, 2u);
      }
    }
    [a1 prefetchOnAssets:v12 options:a4 curationContext:v9];
    goto LABEL_11;
  }
  uint64_t v12 = (void *)MEMORY[0x263EFFA68];
LABEL_11:

  return v12;
}

+ (void)_populateAsset:()Curation withPersonUUIDs:consolidatedPersonUUIDs:petUUIDs:
{
  id v23 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  if ([v11 clsIsScreenshotOrScreenRecording])
  {
    uint64_t v12 = MEMORY[0x263EFFA68];
    [v11 clsSetPersonLocalIdentifiers:MEMORY[0x263EFFA68]];
    [v11 clsSetConsolidatedPersonLocalIdentifiers:v12];
    [v11 clsSetPetLocalIdentifiers:v12];
  }
  else
  {
    uint64_t v13 = objc_msgSend(v23, "_pl_map:", &__block_literal_global_276);
    char v14 = (void *)v13;
    uint64_t v15 = MEMORY[0x263EFFA68];
    if (v13) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = MEMORY[0x263EFFA68];
    }
    [v11 clsSetPersonLocalIdentifiers:v16];
    uint64_t v17 = objc_msgSend(v9, "_pl_map:", &__block_literal_global_278);
    long long v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = v17;
    }
    else {
      uint64_t v19 = v15;
    }
    [v11 clsSetConsolidatedPersonLocalIdentifiers:v19];
    uint64_t v20 = objc_msgSend(v10, "_pl_map:", &__block_literal_global_280);
    id v21 = (void *)v20;
    if (v20) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = v15;
    }
    [v11 clsSetPetLocalIdentifiers:v22];

    id v11 = v14;
  }
}

+ (id)_filterPersonUUIDs:()Curation fromPersonUUIDsByAssetUUID:personUUIDByMergeCandidateUUID:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __98__PHAsset_Curation___filterPersonUUIDs_fromPersonUUIDsByAssetUUID_personUUIDByMergeCandidateUUID___block_invoke;
    v15[3] = &unk_26544F0B0;
    id v16 = v7;
    id v17 = v9;
    id v11 = v10;
    id v18 = v11;
    [v8 enumerateKeysAndObjectsUsingBlock:v15];
    uint64_t v12 = v18;
    id v13 = v11;
  }
  else
  {
    id v13 = (id)MEMORY[0x263EFFA78];
  }

  return v13;
}

+ (id)verifiedPersonLocalIdentifiersByAssetUUIDWithAssets:()Curation
{
  id v4 = a3;
  double v5 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v4 count])
  {
    uint64_t v6 = [a1 _personUUIDsByAssetUUIDWithAssets:v4 personUUIDs:0];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __73__PHAsset_Curation__verifiedPersonLocalIdentifiersByAssetUUIDWithAssets___block_invoke;
    v8[3] = &unk_26544F088;
    id v9 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v8];
  }
  return v5;
}

+ (id)_petUUIDsByAssetUUIDWithAssetUUIDs:()Curation photoLibrary:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v6 librarySpecificFetchOptions];
    [v7 setIncludedDetectionTypes:&unk_27076A5E0];
    id v8 = [MEMORY[0x263F14E88] fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v5 options:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA78];
  }

  return v8;
}

+ (id)_personUUIDsByAssetUUIDWithAssetUUIDs:()Curation personUUIDs:photoLibrary:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v7 count]) {
    goto LABEL_5;
  }
  if (!v8)
  {
    id v10 = [v9 librarySpecificFetchOptions];
    char v14 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"personForFace.type", 0xFFFFFFFFLL);
    [v10 setInternalPredicate:v14];

    uint64_t v12 = [MEMORY[0x263F14E88] fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v7 options:v10];
    goto LABEL_7;
  }
  if (![v8 count])
  {
LABEL_5:
    id v13 = (void *)MEMORY[0x263EFFA78];
    goto LABEL_8;
  }
  id v10 = [v9 librarySpecificFetchOptions];
  id v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"personForFace.personUUID", v8];
  [v10 setInternalPredicate:v11];

  uint64_t v12 = [MEMORY[0x263F14E88] fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v7 options:v10];
LABEL_7:
  id v13 = (void *)v12;

LABEL_8:
  return v13;
}

+ (id)_personUUIDsByAssetUUIDWithAssets:()Curation personUUIDs:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "uuid", (void)v19);
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [v9 firstObject];
    id v16 = [v15 photoLibrary];
    id v17 = [a1 _personUUIDsByAssetUUIDWithAssetUUIDs:v8 personUUIDs:v7 photoLibrary:v16];
  }
  else
  {
    id v17 = (void *)MEMORY[0x263EFFA78];
  }

  return v17;
}

+ (BOOL)isScore:()Curation closeToValue:
{
  return vabdd_f64(a1, a2) < 0.00001;
}

+ (uint64_t)clsPrefetchOptionsForKeyAsset
{
  return 13;
}

@end