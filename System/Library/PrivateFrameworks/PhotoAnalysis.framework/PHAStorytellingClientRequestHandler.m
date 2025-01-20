@interface PHAStorytellingClientRequestHandler
+ (BOOL)_isMeaningInferenceFromEventLabelingModel:(id)a3 meaningEdgeDomain:(unsigned __int16)a4 configuration:(id)a5;
+ (id)_aggregateErrorWithErrorDescriptions:(id)a3;
+ (id)_descriptionForMeaningNode:(id)a3 meaningEdge:(id)a4 configuration:(id)a5;
+ (id)_fetchOptionsForMusicCurationWithPhotoLibrary:(id)a3;
+ (unint64_t)_sceneTypeForPosterClassification:(unint64_t)a3;
- (BOOL)validateOperation:(id)a3 forConnection:(id)a4;
- (BOOL)validateSelector:(SEL)a3 forConnection:(id)a4;
- (OS_dispatch_queue)musicRequestQueue;
- (OS_os_log)loggingConnection;
- (PGManager)graphManager;
- (PHAStorytellingClientRequestHandler)initWithGraphManager:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (id)_assetCollectionForRelatedIdentifier:(id)a3;
- (id)_asssetLocalIdentifiersByCityNameForKeyAssetOnly:(BOOL)a3;
- (id)_collectionListForLocalIdentifier:(id)a3;
- (id)_defaultImageCreationOptions;
- (id)_generateFaceCropForFaceCropSourceDescriptors:(id)a3;
- (id)_pvFaceFromPHFace:(id)a3 copyPropertiesOption:(int64_t)a4;
- (id)_pvImageForAsset:(id)a3 targetSize:(CGSize)a4 error:(id *)a5;
- (id)_utilityAssetLocalIdentifiersForKeyAssetOnly:(BOOL)a3;
- (id)informationDictionaryForAsset:(id)a3;
- (id)relatedRequestPredicateValidator;
- (int64_t)_titleTupleFormatForPhotoAnalysisTitleFormat:(int64_t)a3;
- (unint64_t)_validatedMemoryNotificationState:(int)a3;
- (void)_cacheAllSongSourcesWithCompletionHandler:(id)a3;
- (void)exportWallpaperForAssets:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)handleOperation:(id)a3;
- (void)notifyWhenGraphReadyWithCoalescingIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)recordFeatureUsageFromCounts:(id)a3 context:(id)a4 reply:(id)a5;
- (void)reloadAlbumWidgetTimelineWithContext:(id)a3 reply:(id)a4;
- (void)reloadForYouWidgetTimelineWithContext:(id)a3 reply:(id)a4;
- (void)reloadWallpaperSuggestionsWithSuggestionUUIDs:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestAllSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestAssetCollectionsForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestAssetCollectionsRelatedToAssetWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestAssetCollectionsRelatedToMomentWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestAssetCollectionsRelatedToPersonLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestAssetLocalIdentifiersByCityNameWithContext:(id)a3 reply:(id)a4;
- (void)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestAssetsForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestAvailableSuggestionTypeInfosWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestCacheSongSourceWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestCameraSmartSharingProcessingForLibraryScopeWithUUID:(id)a3 withOptions:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestClearMusicCacheWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestComposabilityScoresOfAssetsForLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestConfidenceByMomentLocalIdentifierForMeaning:(id)a3 useAlternativeMeaningEdge:(BOOL)a4 onlyHighPrecision:(BOOL)a5 context:(id)a6 reply:(id)a7;
- (void)requestCuratedAssetForAssetCollectionWithLocalIdentifier:(id)a3 referenceAssetLocalIdentifier:(id)a4 options:(id)a5 context:(id)a6 reply:(id)a7;
- (void)requestCuratedAssetsForAssetCollectionWithLocalIdentifier:(id)a3 duration:(unint64_t)a4 options:(id)a5 context:(id)a6 reply:(id)a7;
- (void)requestCurationDebugInformationForAsset:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestCurationOfLength:(unint64_t)a3 forMemoryForLocalIdentifier:(id)a4 withOptions:(id)a5 context:(id)a6 reply:(id)a7;
- (void)requestCurationScoreByAssetUUIDForAssetUUIDs:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestDefaultsObjectForKey:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestDiscoveryFeedItemsWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestExportGraphServiceForPurpose:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestFlexMusicCurationDebugInformationForSongWithUID:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestFlexMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestFlexMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestFlexMusicCurationWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier:(id)a3 withOptions:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestGeoHashForAssetLocalIdentifiers:(id)a3 geoHashSize:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestGraphInferencesSummaryWithDateInterval:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestGraphInferencesSummaryWithMomentLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestGraphModelResultWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestGraphMomentLocalIdentifiersWithDateInterval:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestGraphRebuildFractionCompletedWithContext:(id)a3 reply:(id)a4;
- (void)requestGraphServicePerformsQueryWithContext:(id)a3 query:(id)a4 reply:(id)a5;
- (void)requestGraphServiceStatisticsWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestGraphServiceStatusWithContext:(id)a3 reply:(id)a4;
- (void)requestHighlightDebugInformationForHighlightWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestHighlightEstimatesWithContext:(id)a3 reply:(id)a4;
- (void)requestIconicSceneScoreForAssetLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestInferredMePersonLocalIdentifierWithErrorForContext:(id)a3 reply:(id)a4;
- (void)requestInvalidateServicePersistentCachesWithContext:(id)a3 reply:(id)a4;
- (void)requestInvalidateServiceTransientCachesWithContext:(id)a3 reply:(id)a4;
- (void)requestKeyAssetLocalIdentifierForPrototypeCategory:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestMeaningScoreDebugDescriptionForMomentLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestMemoryDebugInformationForMemoryWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestMusicCacheStatusWithContext:(id)a3 reply:(id)a4;
- (void)requestMusicCatalogAdamIDsForPurchasedSongID:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestMusicCurationDebugInformationForSongWithAdamID:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestMusicCurationWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestNightlySuggestionsForPosterConfiguration:(id)a3 atDate:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestOnDemandFaceCropsForFaceLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestPeopleForWallpaperSuggestionsWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestPrecachingOfAudioDataForAdamIDs:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestRecentlyUsedSongsWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestRelatedDebugInformationBetweenAssetForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 context:(id)a7 reply:(id)a8;
- (void)requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 context:(id)a7 reply:(id)a8;
- (void)requestRelatedMomentsForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext:(id)a3 reply:(id)a4;
- (void)requestRunPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 context:(id)a5 resultBlock:(id)a6;
- (void)requestSetDefaultsObject:(id)a3 forKey:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestSignalModelInfosWithContext:(id)a3 reply:(id)a4;
- (void)requestSnapshotServiceForPeopleCurationResultsWithGraphOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 context:(id)a6 reply:(id)a7;
- (void)requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 additionalSnapshotSummaryInfo:(id)a6 context:(id)a7 reply:(id)a8;
- (void)requestSnapshotServiceForRelatedResultsWithGraphOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestSnapshotServiceForRelatedWithAssetLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestSnapshotServiceForRelatedWithMomentLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestSongsForAdamIDs:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestSortedArrayOfPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestStartSharedLibrarySuggestionResultWithContext:(id)a3 reply:(id)a4;
- (void)requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers:(id)a3 withOptions:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestSuggestionInfosWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestSummaryCurationForHighlightLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestTextFeaturesForMomentLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestTitleForAssetCollectionWithLocalIdentifier:(id)a3 format:(int64_t)a4 context:(id)a5 reply:(id)a6;
- (void)requestTitleForCollectionMomentListWithLocalIdentifier:(id)a3 format:(int64_t)a4 context:(id)a5 reply:(id)a6;
- (void)requestTitleForPersonLocalIdentifiers:(id)a3 format:(int64_t)a4 context:(id)a5 reply:(id)a6;
- (void)requestTrendsByIdentifierWithCadence:(id)a3 forYear:(unint64_t)a4 context:(id)a5 reply:(id)a6;
- (void)requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestUpNextMemoriesWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestUtilityAssetInformationWithContext:(id)a3 reply:(id)a4;
- (void)requestUtilityAssetLocalIdentifiersWithContext:(id)a3 reply:(id)a4;
- (void)requestWallpaperPropertiesForAssets:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)runCurationWithItems:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)runModelInferenceForFingerprintVersion:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)runShadowEvaluationWithRecipe:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 context:(id)a8 resultBlock:(id)a9;
- (void)simulateMemoriesNotificationWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
@end

@implementation PHAStorytellingClientRequestHandler

- (void)notifyWhenGraphReadyWithCoalescingIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v6 = a5;
  id v7 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  [v7 registerCoalescingBlockWhenGraphAnalysisFinishes:v6];
}

- (void)requestGraphMomentLocalIdentifiersWithDateInterval:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v16 = 0;
  char v10 = [v9 isReadyWithError:&v16];
  id v11 = v16;
  v12 = v11;
  if (v10)
  {
    id v15 = v11;
    v13 = [v9 momentLocalIdentifiersInDateInterval:v7 error:&v15];
    id v14 = v15;

    v8[2](v8, v13, v14);
    v12 = v14;
  }
  else
  {
    v8[2](v8, 0, v11);
  }
}

- (void)requestGraphInferencesSummaryWithMomentLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v16 = 0;
  char v10 = [v9 isReadyWithError:&v16];
  id v11 = v16;
  v12 = v11;
  if (v10)
  {
    id v15 = v11;
    v13 = [v9 summaryOfInferencesPerMomentByLocalIdentifiers:v7 error:&v15];
    id v14 = v15;

    v8[2](v8, v13, v14);
    v12 = v14;
  }
  else
  {
    v8[2](v8, 0, v11);
  }
}

- (void)requestGraphInferencesSummaryWithDateInterval:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v16 = 0;
  char v10 = [v9 isReadyWithError:&v16];
  id v11 = v16;
  v12 = v11;
  if (v10)
  {
    id v15 = v11;
    v13 = [v9 summaryOfInferencesPerMomentInDateInterval:v7 error:&v15];
    id v14 = v15;

    v8[2](v8, v13, v14);
    v12 = v14;
  }
  else
  {
    v8[2](v8, 0, v11);
  }
}

- (void)requestExportGraphServiceForPurpose:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void, id))a5;
  if (v8)
  {
    v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    id v18 = 0;
    char v10 = [v9 isReadyWithError:&v18];
    id v11 = v18;
    if ((v10 & 1) == 0)
    {
      v8[2](v8, 0, v11);
LABEL_16:

      goto LABEL_17;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F8AE68]])
    {
      uint64_t v12 = [v9 snapshotOuputFilePathURLForKey:*MEMORY[0x1E4F8DBA8]];
      if (v12)
      {
        v13 = (void *)v12;
        if (([v9 copyGraphToURL:v12] & 1) == 0)
        {
LABEL_6:
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 10);
LABEL_14:
          id v15 = (void *)v14;
          v8[2](v8, 0, (id)v14);
          goto LABEL_15;
        }
LABEL_11:
        id v15 = [v13 path];
        ((void (**)(id, void *, id))v8)[2](v8, v15, 0);
LABEL_15:

        goto LABEL_16;
      }
LABEL_13:
      v13 = [NSString localizedStringWithFormat:@"Graph URL creation was not successful."];
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 9, v13);
      goto LABEL_14;
    }
    if ([v7 isEqualToString:@"snapshot"])
    {
      v13 = [v9 snapshotOuputFilePathURLForKey:*MEMORY[0x1E4F8DBB8]];
      if (!v13) {
        goto LABEL_13;
      }
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F1CB10];
      v17 = [v9 defaultGraphExportFullPath];
      v13 = [v16 fileURLWithPath:v17];

      if (!v13) {
        goto LABEL_13;
      }
    }
    if (![v9 saveGraphToURL:v13]) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_17:
}

- (void)requestGraphRebuildFractionCompletedWithContext:(id)a3 reply:(id)a4
{
  uint64_t v12 = (void (**)(id, id, void))a4;
  v5 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  uint64_t v6 = [v5 libraryAnalysisState];
  if (v6 == 1)
  {
    char v10 = NSNumber;
    id v11 = [v5 rebuildProgress];
    [v11 fractionCompleted];
    objc_msgSend(v10, "numberWithDouble:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v6)
  {
    id v9 = 0;
  }
  else
  {
    int v7 = [v5 isReady];
    v8 = &unk_1F291A4D8;
    if (v7) {
      v8 = &unk_1F291A4C8;
    }
    id v9 = v8;
  }
  v12[2](v12, v9, 0);
}

- (void)requestGraphServicePerformsQueryWithContext:(id)a3 query:(id)a4 reply:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v14 = 0;
  char v10 = [v9 isReadyWithError:&v14];
  id v11 = v14;
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __102__PHAStorytellingClientRequestHandler_Graph__requestGraphServicePerformsQueryWithContext_query_reply___block_invoke;
    v12[3] = &unk_1E6917D68;
    id v13 = v8;
    [v9 matchWithVisualFormat:v7 usingBlock:v12];
  }
  else
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v11);
  }
}

uint64_t __102__PHAStorytellingClientRequestHandler_Graph__requestGraphServicePerformsQueryWithContext_query_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestInvalidateServicePersistentCachesWithContext:(id)a3 reply:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v13 = 0;
  char v7 = [v6 isReadyWithError:&v13];
  id v8 = v13;
  if (v7)
  {
    id v9 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_INFO, "Invalidate Persistent Caches", buf, 2u);
    }

    [v6 invalidatePersistentCaches];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __104__PHAStorytellingClientRequestHandler_Graph__requestInvalidateServicePersistentCachesWithContext_reply___block_invoke;
    v10[3] = &unk_1E69173E0;
    id v11 = v5;
    [v6 waitUntilFinishedUsingBlock:v10];
  }
  else
  {
    (*((void (**)(id, id))v5 + 2))(v5, v8);
  }
}

uint64_t __104__PHAStorytellingClientRequestHandler_Graph__requestInvalidateServicePersistentCachesWithContext_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestInvalidateServiceTransientCachesWithContext:(id)a3 reply:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v13 = 0;
  char v7 = [v6 isReadyWithError:&v13];
  id v8 = v13;
  if (v7)
  {
    id v9 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_INFO, "Invalidate Transient Caches", buf, 2u);
    }

    [v6 invalidateTransientCaches];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __103__PHAStorytellingClientRequestHandler_Graph__requestInvalidateServiceTransientCachesWithContext_reply___block_invoke;
    v10[3] = &unk_1E69173E0;
    id v11 = v5;
    [v6 waitUntilFinishedUsingBlock:v10];
  }
  else
  {
    (*((void (**)(id, id))v5 + 2))(v5, v8);
  }
}

uint64_t __103__PHAStorytellingClientRequestHandler_Graph__requestInvalidateServiceTransientCachesWithContext_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestGraphServiceStatisticsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  v37[8] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v35 = 0;
  char v10 = [v9 isReadyWithError:&v35];
  id v11 = v35;
  if (v10)
  {
    uint64_t v12 = [v7 objectForKeyedSubscript:@"types"];
    id v13 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    id v14 = [v13 statisticsWithTypeStrings:v12];

    if (v14 && [v14 length])
    {
      v26 = v14;
      v27 = v12;
      id v28 = v11;
      v29 = v8;
      id v30 = v7;
      id v15 = [MEMORY[0x1E4F28E78] string];
      [v15 appendFormat:@"### PhotoAnalysis ###\n\n"];
      [v15 appendFormat:@"Defaults Writes Status:\n"];
      v37[0] = @"PhotoAnalysisGraphBackgroundActivitiesDisabled";
      v37[1] = @"PhotoAnalysisShouldTriggerNotificationEveryDay";
      v37[2] = @"PhotoAnalysisShouldOverrideUserIsActivelyUsingPhotos";
      v37[3] = @"PhotoAnalysisShouldForceTriggerNotification";
      uint64_t v16 = *MEMORY[0x1E4F8DB78];
      v37[4] = @"PhotoAnalysisNotificationSimulationDelayOverride";
      v37[5] = v16;
      uint64_t v17 = *MEMORY[0x1E4F8DB80];
      v37[6] = *MEMORY[0x1E4F8DB88];
      v37[7] = v17;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:8];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            v24 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
            v25 = [v24 valueForKey:v23];
            [v15 appendFormat:@"\t%@: %@\n", v23, v25];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v20);
      }

      [v15 appendFormat:@"\n\n### PhotoGraph ###\n\n"];
      id v14 = v26;
      [v15 appendString:v26];
      id v8 = v29;
      ((void (**)(id, void *, void *))v29)[2](v29, v15, 0);

      id v7 = v30;
      id v11 = v28;
      uint64_t v12 = v27;
    }
    else
    {
      id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 2, @"invalid type options to graph statistics command");
      v8[2](v8, 0, v15);
    }
  }
  else
  {
    v8[2](v8, 0, v11);
  }
}

- (void)requestGraphServiceStatusWithContext:(id)a3 reply:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, void))a4;
  uint64_t v6 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v7 = [MEMORY[0x1E4F28E78] string];
  uint64_t v8 = [v6 libraryAnalysisState];
  if (v8 == 1)
  {
    [v7 appendString:@"Library analysis: Running"];
    id v9 = [v6 rebuildProgress];
    [v9 fractionCompleted];
    double v11 = v10 * 100.0;

    objc_msgSend(v7, "appendFormat:", @"\nProgress: %0.1f%%", fmin(v11, 100.0));
  }
  else if (!v8)
  {
    [v7 appendString:@"Library analysis: Not Running"];
  }
  id v20 = 0;
  uint64_t v12 = [v6 isReadyWithError:&v20];
  id v13 = v20;
  if (v12) {
    id v14 = @"YES";
  }
  else {
    id v14 = @"NO";
  }
  [v7 appendFormat:@"\nReady: %@", v14];
  if ((v12 & 1) == 0)
  {
    id v15 = [v13 localizedDescription];
    [v7 appendFormat:@", %@", v15];
  }
  if ([v6 isBusy]) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  [v7 appendFormat:@"\nBusy: %@", v16];
  uint64_t v17 = *MEMORY[0x1E4F8AEE0];
  v21[0] = *MEMORY[0x1E4F8AED8];
  v21[1] = v17;
  v22[0] = v7;
  id v18 = [NSNumber numberWithBool:v12];
  v22[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  v5[2](v5, v19, 0);
}

- (void)requestDiscoveryFeedItemsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, void *, void))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v38 = 0;
  char v10 = [v9 isReadyWithError:&v38];
  id v11 = v38;
  uint64_t v12 = v11;
  if (v10)
  {
    id v33 = v11;
    id v13 = objc_alloc(MEMORY[0x1E4F8D3B0]);
    id v14 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8AE90]];
    uint64_t v15 = [v13 initWithDictionaryRepresentation:v14];

    uint64_t v16 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8AE98]];
    id v17 = objc_alloc(MEMORY[0x1E4F8D3B8]);
    id v18 = [v9 workingContext];
    long long v31 = (void *)v16;
    long long v32 = (void *)v15;
    uint64_t v19 = (void *)[v17 initWithOptions:v15 workingContext:v18 state:v16];

    id v20 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8AE88]];
    uint64_t v21 = [v20 unsignedIntegerValue];

    v22 = [v19 additionalItemsWithTargetCount:v21];
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          [v23 addObject:v29];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v26);
    }

    id v30 = [v19 currentState];

    v8[2](v8, v23, v30, 0);
    uint64_t v12 = v33;
  }
  else
  {
    ((void (**)(id, void *, void *, id))v8)[2](v8, 0, (void *)MEMORY[0x1E4F1CC08], v11);
  }
}

- (void)requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = (void (**)(id, uint64_t, id))a5;
  id v8 = a3;
  id v9 = [PHAUserFeedbackUpdater alloc];
  char v10 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v11 = [(PHAUserFeedbackUpdater *)v9 initWithGraphManager:v10];

  id v14 = 0;
  uint64_t v12 = [(PHAUserFeedbackUpdater *)v11 updateFeatureContentWithPersonUUIDs:v8 error:&v14];

  id v13 = v14;
  v7[2](v7, v12, v13);
}

- (void)requestGraphModelResultWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v19 = 0;
  char v10 = [v9 isReadyWithError:&v19];
  id v11 = v19;
  if (v10)
  {
    uint64_t v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8AEC8]];
    id v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8AEC0]];
    if ([v12 isEqualToString:*MEMORY[0x1E4F8AEB8]]
      && [v13 isEqualToString:*MEMORY[0x1E4F8AED0]])
    {
      id v18 = 0;
      id v14 = [v9 requestGraleSemanticLabelPropagationWithError:&v18];
      id v15 = v18;
      v8[2](v8, v14, v15);
    }
    else
    {
      id v15 = [NSString stringWithFormat:@"Unsupported request - modelIdentifier: %@, inferenceKind: %@", v12, v13];
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = v15;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v14 = [v16 errorWithDomain:@"com.apple.PhotoAnalysis.PHAStorytellingClientRequestHandler_MLModel" code:0 userInfo:v17];

      v8[2](v8, 0, v14);
    }
  }
  else
  {
    v8[2](v8, 0, v11);
  }
}

- (void)requestRelatedMomentsForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v14 = 0;
  char v10 = [v9 isReadyWithError:&v14];
  id v11 = v14;
  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    id v13 = [v9 assetCollectionsForPersonLocalIdentifiers:v12];

    v8[2](v8, v13, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)requestInferredMePersonLocalIdentifierWithErrorForContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v19 = 0;
  char v9 = [v8 isReadyWithError:&v19];
  id v10 = v19;
  if (v9)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy_;
    id v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    id v11 = [v8 workingContext];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __111__PHAStorytellingClientRequestHandler_Person__requestInferredMePersonLocalIdentifierWithErrorForContext_reply___block_invoke;
    v12[3] = &unk_1E6917530;
    void v12[4] = &v13;
    [v11 performSynchronousConcurrentGraphReadUsingBlock:v12];

    v7[2](v7, v14[5], 0);
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v10);
  }
}

void __111__PHAStorytellingClientRequestHandler_Person__requestInferredMePersonLocalIdentifierWithErrorForContext_reply___block_invoke(uint64_t a1, void *a2)
{
  id v8 = [a2 graph];
  v3 = [v8 meNode];
  v4 = [v3 inferredPersonNode];
  uint64_t v5 = [v4 localIdentifier];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)requestAssetsForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  char v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v14 = 0;
  char v10 = [v9 isReadyWithError:&v14];
  id v11 = v14;
  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    uint64_t v13 = [v9 assetIdentifiersForPersonLocalIdentifiers:v12];

    v8[2](v8, v13, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)requestAssetCollectionsForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  char v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v15 = 0;
  char v10 = [v9 isReadyWithError:&v15];
  id v11 = v15;
  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    uint64_t v13 = [v9 assetCollectionsForPersonLocalIdentifiers:v12];

    id v14 = [v13 valueForKey:@"localIdentifier"];
    v8[2](v8, v14, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)requestSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  char v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v14 = 0;
  char v10 = [v9 isReadyWithError:&v14];
  id v11 = v14;
  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    uint64_t v13 = [v9 socialGroupsOverlappingMemberLocalIdentifiers:v12];

    v8[2](v8, v13, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)requestAllSocialGroupsForMemberLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, void))a6;
  uint64_t v12 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v16 = 0;
  char v13 = [v12 isReadyWithError:&v16];
  id v14 = v16;
  if (v13)
  {
    id v15 = [v12 allSocialGroupsForMemberLocalIdentifier:v9 options:v10];
    v11[2](v11, v15, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v11)[2](v11, 0, v14);
  }
}

- (void)requestSortedArrayOfPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v14 = 0;
  char v10 = [v9 isReadyWithError:&v14];
  id v11 = v14;
  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    char v13 = [v9 sortedArrayForPersonLocalIdentifiers:v12];

    v8[2](v8, v13, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)requestComposabilityScoresOfAssetsForLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x1E4F8D338];
  char v10 = (void (**)(id, void *, void))a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 alloc];
  id v14 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v16 = (id)[v13 initWithPhotoLibrary:v14 options:v11];

  id v15 = [v16 composabilityScoresOfAssetsForLocalIdentifiers:v12];

  v10[2](v10, v15, 0);
}

- (void)requestSignalModelInfosWithContext:(id)a3 reply:(id)a4
{
  v4 = (objc_class *)MEMORY[0x1E4F8E770];
  uint64_t v5 = (void (**)(id, id, void))a4;
  uint64_t v6 = (void *)[[v4 alloc] initForTesting];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__PHAStorytellingClientRequestHandler_Curation__requestSignalModelInfosWithContext_reply___block_invoke;
  v9[3] = &unk_1E6917558;
  id v10 = v7;
  id v8 = v7;
  [v6 enumerateClassificationBasedSignalModelsUsingBlock:v9];
  v5[2](v5, v8, 0);
}

void __90__PHAStorytellingClientRequestHandler_Curation__requestSignalModelInfosWithContext_reply___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 modelInfo];
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = [(id)objc_opt_class() name];
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

- (void)runCurationWithItems:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, void))a6;
  uint64_t v12 = [v10 objectForKeyedSubscript:@"curationType"];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = @"extended";
  }
  id v15 = v14;

  if ([(__CFString *)v15 isEqualToString:@"extended"])
  {
    id v16 = (id)[objc_alloc(MEMORY[0x1E4F8D3A0]) initWithSimilarityModelClass:objc_opt_class()];
    id v17 = [v10 objectForKeyedSubscript:@"verifiedPersonLocalIdentifiers"];
    if (v17)
    {
      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v17];
      [v16 setVerifiedPersonLocalIdentifiers:v18];
    }
    id v28 = 0;
    id v19 = [v16 dejunkedDedupedItemIdentifiersWithItems:v9 options:v10 debugInfo:&v28];
    id v20 = v28;
  }
  else
  {
    if ([(__CFString *)v15 isEqualToString:@"curation"])
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F8D388]);
      id v27 = 0;
      id v19 = [v16 bestItemIdentifiersWithItems:v9 options:v10 debugInfo:&v27];
      id v20 = v27;
      goto LABEL_11;
    }
    if (![(__CFString *)v15 isEqualToString:@"keyAsset"])
    {
      id v19 = (void *)MEMORY[0x1E4F1CBF0];
      id v20 = (id)MEMORY[0x1E4F1CC08];
      goto LABEL_12;
    }
    id v22 = objc_alloc(MEMORY[0x1E4F8D750]);
    uint64_t v23 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    id v24 = [v23 curationManager];
    uint64_t v25 = [v24 curationCriteriaFactory];
    id v16 = (id)[v22 initWithCurationCriteriaFactory:v25];

    id v26 = 0;
    id v17 = [v16 keyItemIdentifierWithItems:v9 options:v10 debugInfo:&v26];
    id v20 = v26;
    if (v17)
    {
      v31[0] = v17;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    }
    else
    {
      id v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

LABEL_11:
LABEL_12:
  v29[0] = @"bestItemIdentifiers";
  v29[1] = @"debugInfo";
  v30[0] = v19;
  v30[1] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v11[2](v11, v21, 0);
}

- (void)requestCurationScoreByAssetUUIDForAssetUUIDs:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ![v8 count])
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CC08], 0);
  }
  else
  {
    id v11 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    uint64_t v12 = [v11 librarySpecificFetchOptions];
    id v13 = [MEMORY[0x1E4F8D378] assetPropertySetsForCuration];
    [v12 setFetchPropertySets:v13];

    [v12 setWantsIncrementalChangeDetails:0];
    [v12 setIncludeGuestAssets:1];
    [v12 setChunkSizeForFetch:1000];
    [v12 setCacheSizeForFetch:1000];
    id v37 = v9;
    id v38 = v8;
    id v36 = v10;
    long long v34 = v12;
    if (v8) {
      [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v8 options:v12];
    }
    else {
    id v14 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v12];
    }
    uint64_t v15 = [v14 count];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v15];
    long long v35 = v11;
    v41 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v11];
    id v17 = objc_alloc_init(MEMORY[0x1E4F8E760]);
    [v17 setViewCountThreshold:1.79769313e308];
    [v17 setPlayCountThreshold:1.79769313e308];
    [v17 setShouldEmphasizeShared:1];
    id v18 = objc_alloc(MEMORY[0x1E4F8EB18]);
    id v33 = (void *)[v18 initWithSceneAnalysisVersion:(int)*MEMORY[0x1E4F74590]];
    [v33 aestheticScoreThresholdToBeAwesome];
    uint64_t v19 = objc_msgSend(v17, "setAestheticScoreThresholdToBeAwesome:");
    if (v15)
    {
      unint64_t v20 = 0;
      unint64_t v39 = v15;
      uint64_t v40 = v14;
      do
      {
        context = (void *)MEMORY[0x1D26057A0](v19);
        if (v15 - v20 >= 0x3E8) {
          uint64_t v21 = 1000;
        }
        else {
          uint64_t v21 = v15 - v20;
        }
        id v22 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v20, v21);
        uint64_t v23 = [v14 objectsAtIndexes:v22];

        [MEMORY[0x1E4F38EB8] prefetchOnAssets:v23 options:13 curationContext:v41];
        id v24 = [v41 curationSession];
        [v24 prepareAssets:v23];

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v25 = v23;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v44 != v28) {
                objc_enumerationMutation(v25);
              }
              id v30 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              [v30 scoreInContext:v17];
              long long v31 = objc_msgSend(NSNumber, "numberWithDouble:");
              long long v32 = [v30 uuid];
              [v16 setObject:v31 forKeyedSubscript:v32];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
          }
          while (v27);
        }

        v20 += 1000;
        uint64_t v15 = v39;
        id v14 = v40;
      }
      while (v20 < v39);
    }
    id v10 = v36;
    (*((void (**)(id, void *, void))v36 + 2))(v36, v16, 0);

    id v9 = v37;
    id v8 = v38;
  }
}

- (void)requestGeoHashForAssetLocalIdentifiers:(id)a3 geoHashSize:(id)a4 context:(id)a5 reply:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  uint64_t v15 = [v14 librarySpecificFetchOptions];

  [v15 setChunkSizeForFetch:200];
  if (v10) {
    [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v10 options:v15];
  }
  else {
  id v16 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v15];
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v16)
  {
    id v33 = v15;
    long long v34 = v13;
    id v35 = v12;
    id v37 = v10;
    uint64_t v39 = [v16 count];
    id v36 = v11;
    uint64_t v18 = [v11 integerValue];
    if ((unint64_t)(v39 + 199) >= 0xC8)
    {
      uint64_t v19 = v18;
      uint64_t v20 = 0;
      id v38 = v16;
      do
      {
        context = (void *)MEMORY[0x1D26057A0]();
        uint64_t v40 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:");
        uint64_t v21 = objc_msgSend(v16, "objectsAtIndexes:");
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v43 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              uint64_t v27 = (void *)MEMORY[0x1E4F38F48];
              [v26 locationCoordinate];
              double v29 = v28;
              [v26 locationCoordinate];
              id v30 = objc_msgSend(v27, "poiGeoHashWithGeoHashSize:latitude:longitude:", v19, v29);
              if (v30)
              {
                long long v31 = [v26 uuid];
                [v17 setObject:v30 forKeyedSubscript:v31];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
          }
          while (v23);
        }

        ++v20;
        id v16 = v38;
      }
      while (v20 != (v39 + 199) / 0xC8uLL);
    }
    id v13 = v34;
    ((void (**)(id, id, void *))v34)[2](v34, v17, 0);
    id v11 = v36;
    id v10 = v37;
    id v12 = v35;
    uint64_t v15 = v33;
  }
  else
  {
    long long v32 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
    v13[2](v13, 0, v32);
  }
}

- (void)requestIconicSceneScoreForAssetLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F8CD48]);
  id v12 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v13 = [v12 librarySpecificFetchOptions];

  uint64_t v14 = *MEMORY[0x1E4F39538];
  v46[0] = *MEMORY[0x1E4F39458];
  v46[1] = v14;
  v46[2] = *MEMORY[0x1E4F394E0];
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  [v13 setFetchPropertySets:v15];

  [v13 setChunkSizeForFetch:200];
  if ([v8 count]) {
    [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v8 options:v13];
  }
  else {
  id v16 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v13];
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v16)
  {
    long long v32 = v13;
    id v33 = v10;
    id v34 = v9;
    id v35 = v8;
    id v18 = objc_alloc_init(MEMORY[0x1E4F8E778]);
    uint64_t v19 = [v16 count];
    if ((unint64_t)(v19 + 199) >= 0xC8)
    {
      uint64_t v20 = 0;
      unint64_t v36 = (v19 + 199) / 0xC8uLL;
      id v37 = v18;
      id v38 = v16;
      do
      {
        context = (void *)MEMORY[0x1D26057A0]();
        uint64_t v39 = [MEMORY[0x1E4F28D60] indexSetWithIndexesInRange:v32];
        uint64_t v21 = objc_msgSend(v16, "objectsAtIndexes:");
        [v18 prepareAssets:v21];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v42 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              double v28 = NSNumber;
              [v27 clsIconicSceneScoreWithSceneGeography:v11];
              double v29 = objc_msgSend(v28, "numberWithDouble:");
              [v29 floatValue];
              if (v30 > 0.0)
              {
                long long v31 = [v27 uuid];
                [v17 setObject:v29 forKeyedSubscript:v31];
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }
          while (v24);
        }

        ++v20;
        id v18 = v37;
        id v16 = v38;
      }
      while (v20 != v36);
    }
    id v10 = v33;
    ((void (**)(id, id, id))v33)[2](v33, v17, 0);
    id v9 = v34;
    id v8 = v35;
    id v13 = v32;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v18);
  }
}

- (void)requestCurationDebugInformationForAsset:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F38EB8];
  id v20 = v7;
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = [v9 arrayWithObjects:&v20 count:1];
  id v12 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v13 = [v12 librarySpecificFetchOptions];
  uint64_t v14 = [v8 fetchAssetsWithLocalIdentifiers:v11 options:v13];
  uint64_t v15 = [v14 firstObject];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F8E768]);
    id v17 = [v15 photoLibrary];
    id v18 = (void *)[v16 initWithPhotoLibrary:v17];

    uint64_t v19 = [MEMORY[0x1E4F8D340] debugInformationForAsset:v15 curationContext:v18];
    v10[2](v10, v19, 0);

    id v10 = (void (**)(id, uint64_t, void))v19;
  }
  else
  {
    id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v18);
  }
}

- (void)requestUtilityAssetInformationWithContext:(id)a3 reply:(id)a4
{
  id v8 = (void (**)(id, void *, void))a4;
  uint64_t v5 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v6 = [v5 utilityAssetInformation];

  if (v6)
  {
    v8[2](v8, v6, 0);
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v7);
  }
}

- (void)requestCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, void))a6;
  id v12 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v23 = 0;
  char v13 = [v12 isReadyWithError:&v23];
  id v14 = v23;
  if (v13)
  {
    uint64_t v15 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v16 = [v15 librarySpecificFetchOptions];
    id v17 = (void *)MEMORY[0x1E4F38EE8];
    v24[0] = v9;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    uint64_t v19 = [v17 fetchAssetCollectionsWithLocalIdentifiers:v18 options:v16];
    id v20 = [v19 firstObject];

    if (v20)
    {
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v15];
      id v22 = [v12 curationDebugInformationForAssetCollection:v20 options:v10 curationContext:v21];
      v11[2](v11, v22, 0);
    }
    else
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
      ((void (**)(id, void *, void *))v11)[2](v11, 0, v21);
    }
  }
  else
  {
    ((void (**)(id, void *, id))v11)[2](v11, 0, v14);
  }
}

- (void)requestSummaryCurationForHighlightLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a6;
  id v10 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v11 = [v10 librarySpecificFetchOptions];
  id v12 = (void *)MEMORY[0x1E4F38EE8];
  v17[0] = v8;
  char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v14 = [v12 fetchAssetCollectionsWithLocalIdentifiers:v13 options:v11];
  uint64_t v15 = [v14 firstObject];

  if (v15 && [v15 assetCollectionType] == 6)
  {
    id v16 = [MEMORY[0x1E4F8D770] summaryCurationForHighlight:v15];
    v9[2](v9, v16, 0);
  }
  else
  {
    id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
    ((void (**)(id, void *, void *))v9)[2](v9, 0, v16);
  }
}

- (void)requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = (char *)a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  id v12 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v14 = v12;
  uint64_t v15 = v14;
  unint64_t v45 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RepresentativeAssetsRequest", "", buf, 2u);
  }

  uint64_t v44 = mach_absolute_time();
  id v16 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v10 allKeys];
    double v18 = [v17 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412546;
    v53 = v9;
    __int16 v54 = 2112;
    double v55 = v18;
    _os_log_impl(&dword_1D21F2000, v16, OS_LOG_TYPE_INFO, "Representative Assets Request: collectionID:%@ options:%@", buf, 0x16u);
  }
  uint64_t v19 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v20 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v9 options:v10 photoLibrary:v19];
  if (v20)
  {
    os_signpost_id_t spid = v13;
    long long v41 = v11;
    id v42 = v10;
    long long v43 = v9;
    uint64_t v40 = [objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v19];
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F8D378], "representativeAssetsForAssetCollection:curationContext:progressBlock:", v20);
    id v22 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v47 != v26) {
            objc_enumerationMutation(v23);
          }
          double v28 = [(PHAStorytellingClientRequestHandler *)self informationDictionaryForAsset:*(void *)(*((void *)&v46 + 1) + 8 * i)];
          [v22 addObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v25);
    }

    double v29 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = [v22 count];
      double v31 = COERCE_DOUBLE([v20 estimatedAssetCount]);
      *(_DWORD *)buf = 134218240;
      v53 = (const char *)v30;
      __int16 v54 = 2048;
      double v55 = v31;
      _os_log_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_INFO, "Representative Assets Reply: representativeAssetsCount:%ld collectionAssetsCount:%ld", buf, 0x16u);
    }

    uint64_t v32 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    id v35 = v15;
    unint64_t v36 = v35;
    if (v45 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v36, OS_SIGNPOST_INTERVAL_END, spid, "RepresentativeAssetsRequest", "", buf, 2u);
    }

    id v10 = v42;
    id v9 = v43;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "RepresentativeAssetsRequest";
      __int16 v54 = 2048;
      double v55 = (float)((float)((float)((float)(v32 - v44) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    id v11 = v41;
    ((void (**)(id, void *, void *))v41)[2](v41, v22, 0);

    id v37 = (void *)v40;
  }
  else
  {
    id v37 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
    id v38 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v9;
      _os_log_error_impl(&dword_1D21F2000, v38, OS_LOG_TYPE_ERROR, "Representative Assets Error: Failed to lookup collectionID:%@", buf, 0xCu);
    }

    v11[2](v11, 0, v37);
  }
}

- (void)requestCuratedAssetsForAssetCollectionWithLocalIdentifier:(id)a3 duration:(unint64_t)a4 options:(id)a5 context:(id)a6 reply:(id)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v11 = (char *)a3;
  id v12 = a5;
  id v52 = a7;
  os_signpost_id_t v13 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  v53 = [v13 curationManager];

  id v14 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  os_signpost_id_t v15 = os_signpost_id_generate(v14);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v16 = v14;
  id v17 = v16;
  unint64_t v51 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CuratedAssetsRequest", "", buf, 2u);
  }
  os_signpost_id_t spid = v15;

  uint64_t v49 = mach_absolute_time();
  double v18 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E4F8D770], "stringFromPGDuration:", a4, v15);
    double v19 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    id v20 = [v12 allKeys];
    uint64_t v21 = [v20 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412802;
    v61 = v11;
    __int16 v62 = 2112;
    double v63 = v19;
    __int16 v64 = 2112;
    v65 = v21;
    _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_INFO, "Curated Assets Request: collectionID:%@ duration:%@ options:%@", buf, 0x20u);
  }
  id v22 = [v12 objectForKeyedSubscript:@"PHPhotosGraphOptionPersonLocalIdentifiersToFocus"];
  if ([v22 count] == 1)
  {
    v50 = v11;
    id v23 = [v22 firstObject];
    uint64_t v24 = [v53 curatedAssetsForPersonLocalIdentifier:v23 progressBlock:0];
LABEL_20:

    id v33 = [MEMORY[0x1E4F1CA48] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v23 = v24;
    uint64_t v36 = [v23 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v55 != v38) {
            objc_enumerationMutation(v23);
          }
          uint64_t v40 = -[PHAStorytellingClientRequestHandler informationDictionaryForAsset:](self, "informationDictionaryForAsset:", *(void *)(*((void *)&v54 + 1) + 8 * i), spid);
          [v33 addObject:v40];
        }
        uint64_t v37 = [v23 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v37);
    }

    uint64_t v41 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    uint64_t v44 = v17;
    unint64_t v45 = v44;
    if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v45, OS_SIGNPOST_INTERVAL_END, spid, "CuratedAssetsRequest", "", buf, 2u);
    }

    id v11 = v50;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v61 = "CuratedAssetsRequest";
      __int16 v62 = 2048;
      double v63 = (float)((float)((float)((float)(v41 - v49) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v45, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    long long v46 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      uint64_t v47 = [v33 count];
      *(_DWORD *)buf = 134217984;
      v61 = (const char *)v47;
      _os_log_impl(&dword_1D21F2000, v46, OS_LOG_TYPE_INFO, "Curated Assets Reply: collectionAssetsCount:%lu", buf, 0xCu);
    }

    id v35 = v52;
    (*((void (**)(id, void *, void))v52 + 2))(v52, v33, 0);
    goto LABEL_35;
  }
  id v23 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  uint64_t v25 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v11 options:v12 photoLibrary:v23];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    v50 = v11;
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v23];
    uint64_t v28 = [v53 optimalDurationForAssetCollection:v26 duration:a4 options:v12 curationContext:v27];
    double v29 = (void *)[objc_alloc(MEMORY[0x1E4F8D380]) initWithDuration:v28];
    if (v22 && (unint64_t)[v22 count] >= 2)
    {
      uint64_t v30 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
      uint64_t v24 = [v53 curatedAssetsForAssetCollection:v26 duration:v28 referencePersonLocalIdentifiers:v30 curationContext:v27 progressBlock:0];
    }
    else
    {
      double v31 = objc_msgSend(v12, "objectForKeyedSubscript:", @"PHPhotosGraphOptionCurationTypeDedupe", spid);
      int v32 = [v31 BOOLValue];

      if (v32)
      {
        [v53 dejunkAndDedupeAssetsInAssetCollection:v26 options:v12 curationContext:v27 progressBlock:0];
      }
      else
      {
        [v29 setIncludesAllFaces:1];
        [v53 curatedAssetsForAssetCollection:v26 options:v29 curationContext:v27 progressBlock:0];
      uint64_t v24 = };
    }

    goto LABEL_20;
  }
  id v33 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
  id v34 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v11;
    _os_log_error_impl(&dword_1D21F2000, v34, OS_LOG_TYPE_ERROR, "Curated Assets Error: Failed to lookup collectionID:%@", buf, 0xCu);
  }

  id v35 = v52;
  (*((void (**)(id, void, void *))v52 + 2))(v52, 0, v33);
LABEL_35:
}

- (void)requestCuratedAssetForAssetCollectionWithLocalIdentifier:(id)a3 referenceAssetLocalIdentifier:(id)a4 options:(id)a5 context:(id)a6 reply:(id)a7
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v11 = (char *)a3;
  id v12 = (char *)a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, void *))a7;
  os_signpost_id_t v15 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v17 = v15;
  double v18 = v17;
  unint64_t v71 = v16 - 1;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CuratedKeyAssetRequest", "", buf, 2u);
  }
  os_signpost_id_t spid = v16;

  uint64_t v70 = mach_absolute_time();
  double v19 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = [v13 allKeys];
    uint64_t v21 = [v20 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412802;
    v81 = v11;
    __int16 v82 = 2112;
    double v83 = *(double *)&v12;
    __int16 v84 = 2112;
    v85 = v21;
    _os_log_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_INFO, "Curated Key Asset Request: collectionID:%@ referenceAssetID:%@ options:%@", buf, 0x20u);
  }
  v73 = v18;

  id v22 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v23 = [v13 objectForKeyedSubscript:@"PHPhotosGraphOptionPersonLocalIdentifiersToFocus"];
  v74 = v22;
  v72 = v23;
  if ([v23 count] != 1)
  {
    uint64_t v37 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    uint64_t v24 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v11 options:v13 photoLibrary:v37];

    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
      uint64_t v36 = (char *)objc_claimAutoreleasedReturnValue();
      long long v46 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      uint64_t v47 = v18;
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
LABEL_46:

        v14[2](v14, 0, v36);
        goto LABEL_47;
      }
      *(_DWORD *)buf = 138412290;
      v81 = v11;
      long long v48 = "Curated Key Asset Error: Failed to lookup collectionID:%@";
      uint64_t v49 = v46;
      uint32_t v50 = 12;
LABEL_49:
      _os_log_error_impl(&dword_1D21F2000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
      goto LABEL_46;
    }
    if (v12)
    {
      id v66 = v13;
      uint64_t v38 = (void *)MEMORY[0x1E4F38EB8];
      v76 = v12;
      uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
      uint64_t v40 = v74;
      uint64_t v41 = [v74 librarySpecificFetchOptions];
      id v42 = [v38 fetchAssetsWithLocalIdentifiers:v39 options:v41];
      uint64_t v43 = [v42 firstObject];

      if (!v43)
      {
        uint64_t v44 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v12;
          _os_log_error_impl(&dword_1D21F2000, v44, OS_LOG_TYPE_ERROR, "Curated Key Asset Error: Failed to lookup referenceAssetID:%@", buf, 0xCu);
        }
      }
      unint64_t v45 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      id v13 = v66;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v81 = v11;
        __int16 v82 = 2112;
        double v83 = *(double *)&v43;
        _os_log_impl(&dword_1D21F2000, v45, OS_LOG_TYPE_INFO, "Curated Key Asset Request: referenceAssetID:%@ is referenceAsset:%@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v43 = 0;
      uint64_t v40 = v74;
    }
    unint64_t v51 = [v13 objectForKeyedSubscript:@"PHPhotosGraphOptionPersonLocalIdentifiersToFocus"];
    uint64_t v30 = v51;
    v67 = v11;
    v69 = v12;
    __int16 v64 = (void *)v43;
    if (v51 && [v51 count])
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F8D748]);
      id v52 = [MEMORY[0x1E4F1CAD0] setWithArray:v30];
      [v27 setReferencePersonLocalIdentifiers:v52];

      [v27 setFocusOnPeople:1];
      [v27 setComplete:1];
    }
    else
    {
      if (v43) {
        id v53 = (id)[objc_alloc(MEMORY[0x1E4F8D748]) initWithReferenceAsset:v43];
      }
      else {
        id v53 = objc_alloc_init(MEMORY[0x1E4F8D748]);
      }
      id v27 = v53;
    }
    [v27 setAllowContextualTrip:0];
    double v31 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    id v34 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v40];
    if ([v31 isReady])
    {
      uint64_t v36 = [v31 curatedKeyAssetForAssetCollection:v24 curatedAssetCollection:0 options:v27 curationContext:v34];
    }
    else
    {
      [v31 curationManager];
      long long v54 = v14;
      v56 = id v55 = v13;
      uint64_t v36 = [v56 curatedKeyAssetForAssetCollection:v24 curatedAssetCollection:0 options:v27 criteria:0 curationContext:v34];

      id v13 = v55;
      id v14 = v54;
    }
    goto LABEL_34;
  }
  uint64_t v24 = [v22 librarySpecificFetchOptions];
  [v24 setIncludedDetectionTypes:&unk_1F291AC78];
  uint64_t v25 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v23 options:v24];
  uint64_t v26 = [v25 firstObject];

  if (!v26)
  {
    uint64_t v36 = 0;
    goto LABEL_36;
  }
  id v65 = v13;
  v69 = v12;
  id v27 = [v22 librarySpecificFetchOptions];
  uint64_t v79 = *MEMORY[0x1E4F39628];
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  [v27 setFetchPropertySets:v28];

  [v27 setIncludedDetectionTypes:&unk_1F291AC78];
  double v29 = [MEMORY[0x1E4F39050] fetchKeyFaceForPerson:v26 options:v27];
  uint64_t v30 = [v29 firstObject];

  if (v30)
  {
    __int16 v64 = v26;
    v67 = v11;
    double v31 = [v22 librarySpecificFetchOptions];
    uint64_t v78 = *MEMORY[0x1E4F394A8];
    int v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    [v31 setFetchPropertySets:v32];

    id v33 = (void *)MEMORY[0x1E4F38EB8];
    v77 = v30;
    id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    id v35 = [v33 fetchAssetsForFaces:v34 options:v31];
    uint64_t v36 = [v35 firstObject];

    id v13 = v65;
LABEL_34:

    id v11 = v67;
    uint64_t v26 = v64;
    goto LABEL_35;
  }
  uint64_t v36 = 0;
LABEL_35:

  id v12 = v69;
LABEL_36:

  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 9);
    uint64_t v36 = (char *)objc_claimAutoreleasedReturnValue();
    long long v46 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    uint64_t v47 = v73;
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_WORD *)buf = 0;
    long long v48 = "Curated Key Asset Error: Failed to process curated key asset";
    uint64_t v49 = v46;
    uint32_t v50 = 2;
    goto LABEL_49;
  }
  long long v57 = [(PHAStorytellingClientRequestHandler *)self informationDictionaryForAsset:v36];
  uint64_t v58 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v47 = v73;
  v61 = v73;
  __int16 v62 = v61;
  if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v62, OS_SIGNPOST_INTERVAL_END, spid, "CuratedKeyAssetRequest", "", buf, 2u);
  }

  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v81 = "CuratedKeyAssetRequest";
    __int16 v82 = 2048;
    double v83 = (float)((float)((float)((float)(v58 - v70) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v62, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  double v63 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v81 = v36;
    _os_log_impl(&dword_1D21F2000, v63, OS_LOG_TYPE_INFO, "Curated Key Asset Reply: curatedKeyAsset:%@", buf, 0xCu);
  }

  ((void (**)(id, void *, void *))v14)[2](v14, v57, 0);
LABEL_47:
}

- (id)informationDictionaryForAsset:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  id v6 = [v4 localIdentifier];

  [v5 setObject:v6 forKeyedSubscript:@"PHRelatedAssetIdentifierKey"];

  return v5;
}

- (void)requestUpNextMemoriesWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v20 = 0;
  char v12 = [v11 isReadyWithError:&v20];
  id v13 = v20;
  if (v12)
  {
    objc_initWeak(&location, self);
    id v14 = [(PHAStorytellingClientRequestHandler *)self musicRequestQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__PHAStorytellingClientRequestHandler_UpNext__requestUpNextMemoriesWithOptions_context_reply___block_invoke;
    block[3] = &unk_1E69175E8;
    objc_copyWeak(&v18, &location);
    id v16 = v8;
    id v17 = v10;
    dispatch_async(v14, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
  }
}

void __94__PHAStorytellingClientRequestHandler_UpNext__requestUpNextMemoriesWithOptions_context_reply___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v14 = 0;
    id v4 = [MEMORY[0x1E4F8D960] requestWithDictionaryRepresentation:v3 error:&v14];
    id v5 = v14;
    if (!v4) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F8D7F0]) initForUpNextMemoryRequestWithOptionsDictionary:*(void *)(a1 + 32)];
    id v7 = [WeakRetained graphManager];
    id v8 = [v7 workingContextForUpNext];
    id v13 = v5;
    id v9 = [v4 fetchMemoryLocalIdentifiersWithWorkingContext:v8 musicCurationOptions:v6 error:&v13];
    id v10 = v13;

    if (v10)
    {
      id v11 = [WeakRetained loggingConnection];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v10;
        _os_log_error_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_ERROR, "Up Next Memories Generation Error:%{public}@", buf, 0xCu);
      }
    }
    char v12 = [v9 dictionaryRepresentation];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_defaultImageCreationOptions
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F2FF88];
  v5[0] = *MEMORY[0x1E4F2FF80];
  v5[1] = v2;
  v6[0] = MEMORY[0x1E4F1CC38];
  v6[1] = MEMORY[0x1E4F1CC28];
  v5[2] = *MEMORY[0x1E4F2FF48];
  v6[2] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

- (id)_pvFaceFromPHFace:(id)a3 copyPropertiesOption:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [PVFace alloc];
  id v8 = [v6 localIdentifier];
  id v9 = [(PVObject *)v7 initWithLocalIdentifier:v8];

  if (a4)
  {
    id v10 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109120;
      v14[1] = a4;
      _os_log_error_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_ERROR, "pvFaceFromPHFace option not supported: %d", (uint8_t *)v14, 8u);
    }
  }
  else
  {
    id v11 = [v6 personLocalIdentifier];
    [(PVFace *)v9 setPersonLocalIdentifier:v11];

    -[PVFace setSourceWidth:](v9, "setSourceWidth:", [v6 sourceWidth]);
    -[PVFace setSourceHeight:](v9, "setSourceHeight:", [v6 sourceHeight]);
    [v6 centerX];
    -[PVFace setCenterX:](v9, "setCenterX:");
    [v6 centerY];
    -[PVFace setCenterY:](v9, "setCenterY:");
    [v6 size];
    -[PVFace setSize:](v9, "setSize:");
    -[PVFace setHasSmile:](v9, "setHasSmile:", [v6 hasSmile]);
    [v6 blurScore];
    -[PVFace setBlurScore:](v9, "setBlurScore:");
    -[PVFace setIsLeftEyeClosed:](v9, "setIsLeftEyeClosed:", [v6 isLeftEyeClosed]);
    -[PVFace setIsRightEyeClosed:](v9, "setIsRightEyeClosed:", [v6 isRightEyeClosed]);
    [v6 poseYaw];
    -[PVFace setPoseYaw:](v9, "setPoseYaw:");
    -[PVFace setFaceAlgorithmVersion:](v9, "setFaceAlgorithmVersion:", [v6 faceAlgorithmVersion]);
    -[PVFace setQualityMeasure:](v9, "setQualityMeasure:", [v6 qualityMeasure]);
    -[PVFace setHidden:](v9, "setHidden:", [v6 isHidden]);
    -[PVFace setIsInTrash:](v9, "setIsInTrash:", [v6 isInTrash]);
    -[PVFace setManual:](v9, "setManual:", [v6 manual]);
    char v12 = [v6 adjustmentVersion];
    [(PVFace *)v9 setAdjustmentVersion:v12];

    -[PVFace setNameSource:](v9, "setNameSource:", [v6 nameSource]);
    -[PVFace setTrainingType:](v9, "setTrainingType:", [v6 trainingType]);
    -[PVFace setClusterSequenceNumber:](v9, "setClusterSequenceNumber:", [v6 clusterSequenceNumber]);
  }

  return v9;
}

- (id)_generateFaceCropForFaceCropSourceDescriptors:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(PVCanceler);
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__1288;
    id v23 = __Block_byref_object_dispose__1289;
    id v24 = 0;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __91__PHAStorytellingClientRequestHandler_Face___generateFaceCropForFaceCropSourceDescriptors___block_invoke;
    id v16 = &unk_1E6917738;
    id v18 = &v19;
    id v6 = v5;
    uint64_t v17 = v6;
    id v7 = +[PVFaceCropGenerator generateFaceCropsFromSourceDescriptors:v4 withProgressBlock:0 failureBlock:&v13 canceler:v6];
    id v8 = v7;
    if (v20[5])
    {
      id v9 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = v20[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v12;
        _os_log_error_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_ERROR, "Error generating facecrop: %@", buf, 0xCu);
      }

      id v10 = 0;
    }
    else
    {
      id v10 = v7;
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __91__PHAStorytellingClientRequestHandler_Face___generateFaceCropForFaceCropSourceDescriptors___block_invoke(uint64_t a1, int a2, int a3, int a4, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v7 = obj;
  [*(id *)(a1 + 32) setCanceled:1];
}

- (id)_pvImageForAsset:(id)a3 targetSize:(CGSize)a4 error:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v9 setNetworkAccessAllowed:1];
  [v9 setSynchronous:1];
  [v9 setLoadingMode:0x10000];
  [v9 setResizeMode:1];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1288;
  uint64_t v21 = __Block_byref_object_dispose__1289;
  id v22 = 0;
  id v10 = [MEMORY[0x1E4F390D0] defaultManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _DWORD v14[2] = __79__PHAStorytellingClientRequestHandler_Face___pvImageForAsset_targetSize_error___block_invoke;
  v14[3] = &unk_1E6917710;
  id v16 = &v17;
  v14[4] = self;
  id v11 = v8;
  id v15 = v11;
  objc_msgSend(v10, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 0, v9, v14, width, height);

  id v12 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __79__PHAStorytellingClientRequestHandler_Face___pvImageForAsset_targetSize_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F396C8]];
  if (v4)
  {
    long long v11 = *MEMORY[0x1E4F1DB30];
    PLGetOrientationAndUntransformedSizeFromImageURL();
    id v5 = [*(id *)(a1 + 32) _defaultImageCreationOptions];
    id v6 = [*(id *)(a1 + 40) adjustmentVersion];
    id v7 = [*(id *)(a1 + 40) creationDate];
    uint64_t v8 = +[PVImage imageWithURL:v4 assetWidth:(unint64_t)*(double *)&v11 assetHeight:(unint64_t)*((double *)&v11 + 1) imageCreationOptions:v5 adjustmentVersion:v6 creationDate:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)requestOnDemandFaceCropsForFaceLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v12 = (void *)v11;
  if (!v11)
  {
    id v52 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 13);
    v10[2](v10, 0, v52);

    goto LABEL_50;
  }
  id v55 = (void *)v11;
  long long v56 = v10;
  id v57 = v9;
  uint64_t v70 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  uint64_t v14 = [v13 librarySpecificFetchOptions];

  [v14 setIncludeTrashedAssets:1];
  v67 = v14;
  [v14 setIncludeHiddenAssets:1];
  id v15 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  uint64_t v16 = [v15 librarySpecificFetchOptions];

  id v58 = v8;
  uint64_t v17 = [MEMORY[0x1E4F39050] fetchFacesWithLocalIdentifiers:v8 options:v16];
  long long v54 = (void *)v16;
  id v18 = [MEMORY[0x1E4F39060] fetchFaceCropByFaceLocalIdentifierForFaces:v17 fetchOptions:v16];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v19 = v17;
  uint64_t v71 = [v19 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (!v71) {
    goto LABEL_48;
  }
  uint64_t v21 = *(void *)v74;
  *(void *)&long long v20 = 138412546;
  long long v53 = v20;
  v59 = self;
  id v65 = v19;
  id v66 = v18;
  uint64_t v64 = *(void *)v74;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v74 != v21) {
        objc_enumerationMutation(v19);
      }
      id v23 = *(NSObject **)(*((void *)&v73 + 1) + 8 * v22);
      id v24 = (void *)MEMORY[0x1D26057A0]();
      uint64_t v25 = [v23 localIdentifier];
      uint64_t v26 = [v18 objectForKeyedSubscript:v25];

      if (v26)
      {
        uint64_t v27 = [v26 resourceData];
        if (v27)
        {
          uint64_t v28 = (void *)v27;
          double v29 = [v26 uuid];
          [v70 setObject:v28 forKeyedSubscript:v29];
          goto LABEL_43;
        }
        double v29 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v78 = v23;
          long long v46 = v29;
          uint64_t v47 = "Error persisted facecrop is nil for PHFace: %@";
          goto LABEL_46;
        }
        goto LABEL_23;
      }
      uint64_t v30 = [(PHAStorytellingClientRequestHandler *)self _pvFaceFromPHFace:v23 copyPropertiesOption:0];
      if (!v30)
      {
        double v29 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v78 = v23;
          long long v46 = v29;
          uint64_t v47 = "Error getting PVFace from PHFace: %@";
LABEL_46:
          _os_log_error_impl(&dword_1D21F2000, v46, OS_LOG_TYPE_ERROR, v47, buf, 0xCu);
        }
LABEL_23:
        uint64_t v28 = 0;
        goto LABEL_43;
      }
      uint64_t v28 = (void *)v30;
      double v31 = (void *)MEMORY[0x1E4F38EB8];
      __int16 v82 = v23;
      int v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
      double v29 = [v31 fetchAssetsForFaces:v32 options:v67];

      if ([v29 count])
      {
        id v33 = [v29 firstObject];
        unint64_t v34 = [v33 pixelWidth];
        unint64_t v35 = [v33 pixelHeight];
        if (v34 <= v35) {
          unint64_t v34 = v35;
        }
        [v23 size];
        double v37 = 128.0 / v36;
        if (v37 >= (double)v34) {
          double v37 = (double)v34;
        }
        id v72 = 0;
        uint64_t v38 = -[PHAStorytellingClientRequestHandler _pvImageForAsset:targetSize:error:](self, "_pvImageForAsset:targetSize:error:", v33, &v72, (double)(unint64_t)v37, (double)(unint64_t)v37);
        id v68 = v72;
        if (v38)
        {
          os_log_t v60 = v38;
          v69 = +[PVFaceCropSourceDescriptor descriptorForFace:v28 image:v38];
          v81 = v69;
          uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
          [(PHAStorytellingClientRequestHandler *)self _generateFaceCropForFaceCropSourceDescriptors:v39];
          v41 = uint64_t v40 = self;

          __int16 v62 = v41;
          id v42 = [v41 firstObject];
          if (v42)
          {
            uint64_t v43 = [v33 cloudIdentifier];
            uint64_t v44 = v43;
            if (v43)
            {
              unint64_t v45 = v43;
            }
            else
            {
              unint64_t v45 = [v33 uuid];
            }
            log = v45;
            uint64_t v38 = v60;

            uint32_t v50 = [v42 faceCropData];
            if (v50)
            {
              [v70 setObject:v50 forKeyedSubscript:log];
            }
            else
            {
              v61 = [(PHAStorytellingClientRequestHandler *)v59 loggingConnection];
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v53;
                uint64_t v78 = v23;
                __int16 v79 = 2112;
                v80 = v33;
                _os_log_error_impl(&dword_1D21F2000, v61, OS_LOG_TYPE_ERROR, "Error generated facecrop is nil for PHFace: %@, PHAsset: %@", buf, 0x16u);
              }
            }
            self = v59;
            uint64_t v49 = v68;
          }
          else
          {
            log = [(PHAStorytellingClientRequestHandler *)v40 loggingConnection];
            self = v40;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v78 = v33;
              _os_log_error_impl(&dword_1D21F2000, log, OS_LOG_TYPE_ERROR, "Error getting PVFaceCrop from PHAsset: %@", buf, 0xCu);
            }
            uint64_t v49 = v68;
            uint64_t v38 = v60;
          }

          id v18 = v66;
        }
        else
        {
          long long v48 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
          v69 = v48;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v78 = v33;
            _os_log_error_impl(&dword_1D21F2000, v48, OS_LOG_TYPE_ERROR, "Error getting PVImage from PHAsset: %@", buf, 0xCu);
          }
          id v18 = v66;
          uint64_t v49 = v68;
        }
      }
      else
      {
        id v33 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v78 = v23;
          _os_log_error_impl(&dword_1D21F2000, v33, OS_LOG_TYPE_ERROR, "No corresponding asset for PHFace: %@", buf, 0xCu);
        }
        id v18 = v66;
      }
      id v19 = v65;

      uint64_t v21 = v64;
LABEL_43:

      ++v22;
    }
    while (v71 != v22);
    uint64_t v51 = [v19 countByEnumeratingWithState:&v73 objects:v83 count:16];
    uint64_t v71 = v51;
  }
  while (v51);
LABEL_48:

  id v10 = v56;
  ((void (**)(id, void *, void *))v56)[2](v56, v70, 0);

  id v9 = v57;
  id v8 = v58;
  id v12 = v55;
LABEL_50:
}

- (void)_cacheAllSongSourcesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v24[0] = 0;
  v24[1] = v24;
  void v24[2] = 0x2020000000;
  v24[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  void v22[3] = __Block_byref_object_copy__1741;
  v22[4] = __Block_byref_object_dispose__1742;
  id v23 = @"MusicForTopic";
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E6917A88;
  v21[4] = self;
  v21[5] = v24;
  v21[6] = v22;
  v21[7] = 0x4018000000000000;
  id v5 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v21];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = (void *)MEMORY[0x1E4F8D818];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_241;
  v11[3] = &unk_1E6917AD8;
  uint64_t v16 = v19;
  id v8 = v6;
  uint64_t v17 = v24;
  id v18 = v22;
  id v12 = v8;
  uint64_t v13 = self;
  id v9 = v5;
  id v14 = v9;
  id v10 = v4;
  id v15 = v10;
  [v7 prefetchCuratedSongLibraryAssetsWithProgressReporter:v9 completionHandler:v11];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v4 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  double v5 = *(double *)(a1 + 56);
  id v6 = [*(id *)(a1 + 32) loggingConnection];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    double v11 = (v4 + a2) / v5;
    _os_log_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_INFO, "[MemoriesMusic] Caching music for source (%@): %f", (uint8_t *)&v8, 0x16u);
  }
}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_241(uint64_t a1, char a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v5;
      _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "\nMusicForTopic prefetch failed with error: %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = NSString;
    int v8 = [v5 description];
    uint64_t v9 = [v7 stringWithFormat:@"MusicForTopic prefetch failed (%@)", v8];
    [v6 addObject:v9];
  }
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24)
                                                              + 1.0;
  uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
  double v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = @"MusicForArtist";

  uint64_t v12 = (void *)MEMORY[0x1E4F8D7F8];
  uint64_t v13 = [*(id *)(a1 + 40) photoLibrary];
  id v14 = [*(id *)(a1 + 40) graphManager];
  uint64_t v15 = *(void *)(a1 + 48);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_248;
  void v19[3] = &unk_1E6917AD8;
  uint64_t v24 = *(void *)(a1 + 64);
  id v16 = *(id *)(a1 + 32);
  long long v25 = *(_OWORD *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = *(void **)(a1 + 48);
  id v20 = v16;
  uint64_t v21 = v17;
  id v22 = v18;
  id v23 = *(id *)(a1 + 56);
  [v12 cacheMusicForMomentsInPhotoLibrary:v13 graphManager:v14 progressReporter:v15 completionHandler:v19];
}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_248(uint64_t a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "\nMusicForArtist caching failed with error: %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = NSString;
    int v8 = [v5 description];
    uint64_t v9 = [v7 stringWithFormat:@"MusicForArtist caching failed (%@)", v8];
    [v6 addObject:v9];
  }
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24)
                                                              + 1.0;
  uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
  double v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = @"MusicForMoment";

  uint64_t v12 = (void *)MEMORY[0x1E4F8D800];
  uint64_t v13 = [*(id *)(a1 + 40) photoLibrary];
  uint64_t v14 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_255;
  v18[3] = &unk_1E6917AD8;
  uint64_t v23 = *(void *)(a1 + 64);
  id v15 = *(id *)(a1 + 32);
  long long v24 = *(_OWORD *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void **)(a1 + 48);
  id v19 = v15;
  uint64_t v20 = v16;
  id v21 = v17;
  id v22 = *(id *)(a1 + 56);
  [v12 cacheMusicForMomentsInPhotoLibrary:v13 progressReporter:v14 completionHandler:v18];
}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_255(uint64_t a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "\nMusicForMoment caching failed with error: %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = NSString;
    int v8 = [v5 description];
    uint64_t v9 = [v7 stringWithFormat:@"MusicForMoment caching failed (%@)", v8];
    [v6 addObject:v9];
  }
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24)
                                                              + 1.0;
  uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
  double v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = @"MusicForYou";

  uint64_t v12 = (void *)MEMORY[0x1E4F8D820];
  uint64_t v13 = [*(id *)(a1 + 40) photoLibrary];
  uint64_t v14 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_262;
  v18[3] = &unk_1E6917AD8;
  uint64_t v23 = *(void *)(a1 + 64);
  id v15 = *(id *)(a1 + 32);
  long long v24 = *(_OWORD *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void **)(a1 + 48);
  id v19 = v15;
  uint64_t v20 = v16;
  id v21 = v17;
  id v22 = *(id *)(a1 + 56);
  [v12 cacheMusicForMomentsInPhotoLibrary:v13 progressReporter:v14 completionHandler:v18];
}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_262(uint64_t a1, char a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v5;
      _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "\nMusicForYou caching failed with error: %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = NSString;
    int v8 = [v5 description];
    uint64_t v9 = [v7 stringWithFormat:@"MusicForYou caching failed (%@)", v8];
    [v6 addObject:v9];
  }
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24)
                                                              + 1.0;
  uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
  double v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = @"MusicForTimeBackfill";

  uint64_t v12 = (void *)MEMORY[0x1E4F8D808];
  uint64_t v13 = [*(id *)(a1 + 40) photoLibrary];
  uint64_t v14 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_269;
  v17[3] = &unk_1E6917AD8;
  uint64_t v22 = *(void *)(a1 + 64);
  id v15 = *(id *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  id v18 = v15;
  uint64_t v19 = v16;
  id v21 = *(id *)(a1 + 56);
  long long v23 = *(_OWORD *)(a1 + 72);
  id v20 = *(id *)(a1 + 48);
  [v12 cacheMusicForMomentsInPhotoLibrary:v13 progressReporter:v14 completionHandler:v17];
}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_269(uint64_t a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24)
                                                                + 1.0;
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = @"MusicForTimeFrontfill";

    int v8 = (void *)MEMORY[0x1E4F8D810];
    uint64_t v9 = [*(id *)(a1 + 40) photoLibrary];
    uint64_t v10 = *(void *)(a1 + 48);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_276;
    v20[3] = &unk_1E6917AB0;
    uint64_t v24 = *(void *)(a1 + 64);
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v21 = v11;
    uint64_t v22 = v12;
    id v23 = *(id *)(a1 + 56);
    [v8 cacheMusicForMomentsInPhotoLibrary:v9 progressReporter:v10 completionHandler:v20];

    uint64_t v13 = v21;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "\nMusicForTimeBackfill caching failed with error: %@", buf, 0xCu);
    }
    id v14 = v5;
    uint64_t v13 = v14;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v15 = *(void **)(a1 + 32);
      uint64_t v16 = NSString;
      uint64_t v17 = [v14 description];
      id v18 = [v16 stringWithFormat:@"MusicForTimeBackfill caching failed (%@)", v17];
      [v15 addObject:v18];

      uint64_t v19 = [(id)objc_opt_class() _aggregateErrorWithErrorDescriptions:*(void *)(a1 + 32)];

      uint64_t v13 = (void *)v19;
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __88__PHAStorytellingClientRequestHandler_Music___cacheAllSongSourcesWithCompletionHandler___block_invoke_276(void *a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "\nMusicForTimeFrontfill caching failed with error: %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = NSString;
    int v8 = [v5 description];
    uint64_t v9 = [v7 stringWithFormat:@"MusicForTimeFrontfill caching failed (%@)", v8];
    [v6 addObject:v9];
  }
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v10 = [(id)objc_opt_class() _aggregateErrorWithErrorDescriptions:a1[4]];
  }
  else
  {
    uint64_t v10 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)requestRecentlyUsedSongsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v24 = 0;
  char v12 = [v11 isReadyWithError:&v24];
  id v13 = v24;
  if ((v12 & 1) == 0)
  {
    id v14 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_fault_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_FAULT, "[MemoriesMusic] requestRecentlyUsedSongsWithOptions requested when graph not ready. Request will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
    }
  }
  objc_initWeak(location, self);
  id v15 = [(PHAStorytellingClientRequestHandler *)self musicRequestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PHAStorytellingClientRequestHandler_Music__requestRecentlyUsedSongsWithOptions_context_reply___block_invoke;
  block[3] = &unk_1E6917A60;
  objc_copyWeak(&v23, location);
  id v21 = v11;
  id v22 = v10;
  id v20 = v8;
  id v16 = v11;
  id v17 = v8;
  id v18 = v10;
  dispatch_async(v15, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

void __96__PHAStorytellingClientRequestHandler_Music__requestRecentlyUsedSongsWithOptions_context_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [MEMORY[0x1E4F8D838] requestRecentlyUsedSongsWithOptions:*(void *)(a1 + 32) graphManager:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photoanalysis" code:15 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  }
}

- (void)requestFlexMusicCurationWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v24 = 0;
  char v12 = [v11 isReadyWithError:&v24];
  id v13 = v24;
  if ((v12 & 1) == 0)
  {
    id v14 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_fault_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Flex Music Curation with options requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
    }
  }
  objc_initWeak(location, self);
  id v15 = [(PHAStorytellingClientRequestHandler *)self musicRequestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationWithOptions_context_reply___block_invoke;
  block[3] = &unk_1E6917A60;
  objc_copyWeak(&v23, location);
  id v21 = v11;
  id v22 = v10;
  id v20 = v8;
  id v16 = v11;
  id v17 = v8;
  id v18 = v10;
  dispatch_async(v15, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

void __96__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationWithOptions_context_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F8D7F0]);
    if (*(void *)(a1 + 32)) {
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v3 = MEMORY[0x1E4F1CC08];
    }
    double v4 = (void *)[v2 initWithOptionsDictionary:v3];
    [MEMORY[0x1E4F8D838] requestFlexMusicCurationWithCurationOptions:v4 graphManager:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    double v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photoanalysis" code:15 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
}

- (void)requestMusicCurationWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v24 = 0;
  char v12 = [v11 isReadyWithError:&v24];
  id v13 = v24;
  if ((v12 & 1) == 0)
  {
    id v14 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v13;
      _os_log_fault_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Apple Music Curation with options requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
    }
  }
  objc_initWeak(location, self);
  id v15 = [(PHAStorytellingClientRequestHandler *)self musicRequestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PHAStorytellingClientRequestHandler_Music__requestMusicCurationWithOptions_context_reply___block_invoke;
  block[3] = &unk_1E6917A60;
  objc_copyWeak(&v23, location);
  id v21 = v11;
  id v22 = v10;
  id v20 = v8;
  id v16 = v11;
  id v17 = v8;
  id v18 = v10;
  dispatch_async(v15, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);
}

void __92__PHAStorytellingClientRequestHandler_Music__requestMusicCurationWithOptions_context_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F8D7F0]);
    if (*(void *)(a1 + 32)) {
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v3 = MEMORY[0x1E4F1CC08];
    }
    double v4 = (void *)[v2 initWithOptionsDictionary:v3];
    [MEMORY[0x1E4F8D838] requestMusicCurationWithCurationOptions:v4 graphManager:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    double v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photoanalysis" code:15 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
}

- (void)requestCacheSongSourceWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a5;
  id v8 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F8B088]];
  id v9 = (void *)MEMORY[0x1E4F71F08];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__PHAStorytellingClientRequestHandler_Music__requestCacheSongSourceWithOptions_context_reply___block_invoke;
  void v22[3] = &unk_1E6917A10;
  v22[4] = self;
  id v10 = v8;
  id v23 = v10;
  id v11 = [v9 progressReporterWithProgressBlock:v22];
  char v12 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  if (![v10 isEqualToString:*MEMORY[0x1E4F8B058]])
  {
    if ([v10 isEqualToString:*MEMORY[0x1E4F8B078]])
    {
      [MEMORY[0x1E4F8D818] prefetchCuratedSongLibraryAssetsWithProgressReporter:v11 completionHandler:v7];
      goto LABEL_13;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4F8B060]])
    {
      id v13 = (void *)MEMORY[0x1E4F8D7F8];
      id v14 = [(PHAStorytellingClientRequestHandler *)self graphManager];
      [v13 cacheMusicForMomentsInPhotoLibrary:v12 graphManager:v14 progressReporter:v11 completionHandler:v7];
LABEL_7:

      goto LABEL_13;
    }
    if ([v10 isEqualToString:*MEMORY[0x1E4F8B068]])
    {
      id v15 = (void *)MEMORY[0x1E4F8D800];
    }
    else
    {
      if (![v10 isEqualToString:*MEMORY[0x1E4F8B080]])
      {
        if ([v10 isEqualToString:*MEMORY[0x1E4F8B070]])
        {
          id v16 = (void *)MEMORY[0x1E4F8D808];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __94__PHAStorytellingClientRequestHandler_Music__requestCacheSongSourceWithOptions_context_reply___block_invoke_231;
          v18[3] = &unk_1E6917A38;
          id v21 = v7;
          id v19 = v12;
          id v20 = v11;
          [v16 cacheMusicForMomentsInPhotoLibrary:v19 progressReporter:v20 completionHandler:v18];

          goto LABEL_13;
        }
        id v14 = [NSString stringWithFormat:@"Unknown song source type: %@", v10];
        id v17 = [MEMORY[0x1E4F8D3C8] errorWithCode:0 description:v14];
        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);

        goto LABEL_7;
      }
      id v15 = (void *)MEMORY[0x1E4F8D820];
    }
    [v15 cacheMusicForMomentsInPhotoLibrary:v12 progressReporter:v11 completionHandler:v7];
    goto LABEL_13;
  }
  [(PHAStorytellingClientRequestHandler *)self _cacheAllSongSourcesWithCompletionHandler:v7];
LABEL_13:
}

void __94__PHAStorytellingClientRequestHandler_Music__requestCacheSongSourceWithOptions_context_reply___block_invoke(uint64_t a1, double a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = [*(id *)(a1 + 32) loggingConnection];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    double v9 = a2;
    _os_log_impl(&dword_1D21F2000, v4, OS_LOG_TYPE_INFO, "[MemoriesMusic] Caching music for source (%@): %f", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __94__PHAStorytellingClientRequestHandler_Music__requestCacheSongSourceWithOptions_context_reply___block_invoke_231(void *a1, char a2)
{
  if (a2) {
    return [MEMORY[0x1E4F8D810] cacheMusicForMomentsInPhotoLibrary:a1[4] progressReporter:a1[5] completionHandler:a1[6]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
}

- (void)requestMusicCatalogAdamIDsForPurchasedSongID:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  void v29[2] = __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke;
  v29[3] = &unk_1E6918B08;
  v29[4] = self;
  id v14 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v29];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F8D7E8]) initWithRequestOptionsDictionary:v11 inflationActionSource:2];
  objc_initWeak(&location, self);
  id v16 = [(PHAStorytellingClientRequestHandler *)self musicRequestQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke_223;
  v21[3] = &unk_1E69179E8;
  objc_copyWeak(&v27, &location);
  id v25 = v14;
  id v26 = v13;
  id v22 = v15;
  id v23 = self;
  id v24 = v10;
  id v17 = v14;
  id v18 = v10;
  id v19 = v15;
  id v20 = v13;
  dispatch_async(v16, v21);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke(uint64_t a1, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) loggingConnection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    double v5 = a2;
    _os_log_impl(&dword_1D21F2000, v3, OS_LOG_TYPE_INFO, "[MemoriesMusic] Request Songs For Purchased ID Progress: %f", (uint8_t *)&v4, 0xCu);
  }
}

void __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke_223(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = [WeakRetained graphManager];
    uint64_t v5 = *(void *)(a1 + 32);
    id v16 = 0;
    uint64_t v6 = [v4 musicCurationInflationContextWithInflationOptions:v5 error:&v16];
    id v7 = v16;

    if (v6)
    {
      __int16 v8 = (void *)MEMORY[0x1E4F8D838];
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      _DWORD v14[2] = __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke_224;
      v14[3] = &unk_1E69179C0;
      id v15 = *(id *)(a1 + 64);
      [v8 fetchMusicCatalogAdamIDsForPurchasedSongID:v9 inflationContext:v6 progressReporter:v10 completionHandler:v14];
      id v11 = v15;
    }
    else
    {
      id v13 = [*(id *)(a1 + 40) loggingConnection];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v7;
        _os_log_error_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to create inflation context when requesting adam IDs for purchased ID, error: %{public}@", buf, 0xCu);
      }

      id v11 = [MEMORY[0x1E4F8D3C8] xpcSafeErrorWithError:v7];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 64);
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photoanalysis" code:15 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v7);
  }
}

void __113__PHAStorytellingClientRequestHandler_Music__requestMusicCatalogAdamIDsForPurchasedSongID_options_context_reply___block_invoke_224(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F8D3C8];
  id v6 = a2;
  id v7 = [v5 xpcSafeErrorWithError:a3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestClearMusicCacheWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F8D838];
  id v7 = (void (**)(id, void *))a5;
  __int16 v8 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v11 = 0;
  [v6 cacheRemoveAllForPhotoLibrary:v8 error:&v11];
  id v9 = v11;

  uint64_t v10 = [MEMORY[0x1E4F8D3C8] xpcSafeErrorWithError:v9];

  v7[2](v7, v10);
}

- (void)requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  __int16 v8 = (void (**)(id, void *, void *))a5;
  id v9 = objc_opt_class();
  uint64_t v10 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v11 = [v9 _fetchOptionsForMusicCurationWithPhotoLibrary:v10];

  uint64_t v12 = (void *)MEMORY[0x1E4F38EE8];
  v26[0] = v7;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v14 = [v12 fetchAssetCollectionsWithLocalIdentifiers:v13 options:v11];
  id v15 = [v14 firstObject];

  if (v15)
  {
    id v16 = (void *)MEMORY[0x1E4F8D838];
    id v17 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    id v18 = [MEMORY[0x1E4F71F08] ignoreProgress];
    id v23 = 0;
    uint64_t v19 = [v16 generateFlexMusicCurationDebugInformationForAssetCollection:v15 graphManager:v17 progressReporter:v18 error:&v23];
    id v20 = v23;

    id v21 = [MEMORY[0x1E4F8D3C8] xpcSafeErrorWithError:v20];

    v8[2](v8, v19, v21);
  }
  else
  {
    uint64_t v19 = [NSString stringWithFormat:@"Flex music curation metadata for asset collection requested but no asset collections could be fetched from the specified local identifier: %@", v7];
    id v22 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v19;
      _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music Curation Metadata Request Error: %@", buf, 0xCu);
    }

    id v21 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, v19);
    v8[2](v8, 0, v21);
  }
}

- (void)requestFlexMusicCurationDebugInformationForSongWithUID:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F8D838];
  __int16 v8 = (void (**)(id, void *, void *))a5;
  id v9 = a3;
  uint64_t v10 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v11 = [MEMORY[0x1E4F71F08] ignoreProgress];
  id v15 = 0;
  uint64_t v12 = [v7 generateFlexMusicCurationDebugInformationForSongWithUID:v9 graphManager:v10 progressReporter:v11 error:&v15];

  id v13 = v15;
  id v14 = [MEMORY[0x1E4F8D3C8] xpcSafeErrorWithError:v13];

  v8[2](v8, v12, v14);
}

- (void)requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  __int16 v8 = (void (**)(id, void *, void *))a5;
  id v9 = objc_opt_class();
  uint64_t v10 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v11 = [v9 _fetchOptionsForMusicCurationWithPhotoLibrary:v10];

  uint64_t v12 = (void *)MEMORY[0x1E4F38EE8];
  v26[0] = v7;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v14 = [v12 fetchAssetCollectionsWithLocalIdentifiers:v13 options:v11];
  id v15 = [v14 firstObject];

  if (v15)
  {
    id v16 = (void *)MEMORY[0x1E4F8D838];
    id v17 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    id v18 = [MEMORY[0x1E4F71F08] ignoreProgress];
    id v23 = 0;
    uint64_t v19 = [v16 generateMusicCurationDebugInformationForAssetCollection:v15 graphManager:v17 progressReporter:v18 error:&v23];
    id v20 = v23;

    id v21 = [MEMORY[0x1E4F8D3C8] xpcSafeErrorWithError:v20];

    v8[2](v8, v19, v21);
  }
  else
  {
    uint64_t v19 = [NSString stringWithFormat:@"Music curation metadata for asset collection requested but no asset collections could be fetched from the specified local identifier: %@", v7];
    id v22 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v19;
      _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Music Curation Metadata Request Error: %@", buf, 0xCu);
    }

    id v21 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, v19);
    v8[2](v8, 0, v21);
  }
}

- (void)requestMusicCurationDebugInformationForSongWithAdamID:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F8D838];
  __int16 v8 = (void (**)(id, void *, void *))a5;
  id v9 = a3;
  uint64_t v10 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v11 = [MEMORY[0x1E4F71F08] ignoreProgress];
  id v15 = 0;
  uint64_t v12 = [v7 generateMusicCurationDebugInformationForSongWithAdamID:v9 graphManager:v10 progressReporter:v11 error:&v15];

  id v13 = v15;
  id v14 = [MEMORY[0x1E4F8D3C8] xpcSafeErrorWithError:v13];

  v8[2](v8, v12, v14);
}

- (void)requestPrecachingOfAudioDataForAdamIDs:(id)a3 context:(id)a4 reply:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F8D7D0];
  id v7 = (void *)MEMORY[0x1E4F71F08];
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 ignoreProgress];
  [v6 cacheSongAudioForAdamIDs:v9 progressReporter:v10 completionHandler:v8];
}

- (void)requestMusicCacheStatusWithContext:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F8D838];
  id v6 = (void (**)(id, void *, void *))a4;
  id v7 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v11 = 0;
  id v8 = [v5 cacheStatusWithPhotoLibrary:v7 error:&v11];
  id v9 = v11;

  id v10 = [MEMORY[0x1E4F8D3C8] xpcSafeErrorWithError:v9];

  v6[2](v6, v8, v10);
}

- (void)requestSongsForAdamIDs:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke;
  v28[3] = &unk_1E6918B08;
  v28[4] = self;
  id v14 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:v28];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F8D7E8]) initWithRequestOptionsDictionary:v11 inflationActionSource:2];
  objc_initWeak(&location, self);
  id v16 = [(PHAStorytellingClientRequestHandler *)self musicRequestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_212;
  block[3] = &unk_1E6917920;
  objc_copyWeak(&v26, &location);
  id v22 = v15;
  id v23 = v10;
  id v24 = v14;
  id v25 = v13;
  id v17 = v14;
  id v18 = v10;
  id v19 = v15;
  id v20 = v13;
  dispatch_async(v16, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke(uint64_t a1, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) loggingConnection];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    double v5 = a2;
    _os_log_impl(&dword_1D21F2000, v3, OS_LOG_TYPE_INFO, "[MemoriesMusic] Request Songs For Adam IDs Progress: %f", (uint8_t *)&v4, 0xCu);
  }
}

void __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_212(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = [WeakRetained graphManager];
    uint64_t v6 = *(void *)(a1 + 32);
    id v19 = 0;
    id v7 = [v5 musicCurationInflationContextWithInflationOptions:v6 error:&v19];
    id v8 = v19;

    if (v7)
    {
      id v9 = (void *)MEMORY[0x1E4F8D838];
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_214;
      v16[3] = &unk_1E6917998;
      objc_copyWeak(&v18, v2);
      id v17 = *(id *)(a1 + 56);
      [v9 fetchSongDisplayMetadataJSONForAdamIDs:v10 inflationContext:v7 progressReporter:v11 completionHandler:v16];

      objc_destroyWeak(&v18);
    }
    else
    {
      id v14 = [v4 loggingConnection];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v8;
        _os_log_error_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to create inflation context when requesting songs for adamIDs , error: %{public}@", buf, 0xCu);
      }

      id v15 = [MEMORY[0x1E4F8D3C8] xpcSafeErrorWithError:v8];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 56);
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photoanalysis" code:15 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
}

void __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_214(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained musicRequestQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_2;
    block[3] = &unk_1E6917970;
    id v13 = v6;
    id v15 = *(id *)(a1 + 32);
    id v14 = v5;
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photoanalysis" code:15 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
}

void __91__PHAStorytellingClientRequestHandler_Music__requestSongsForAdamIDs_options_context_reply___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F8D3C8] xpcSafeErrorWithError:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)requestFlexMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v25 = a5;
  id v12 = a6;
  id v13 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v14 = [v13 librarySpecificFetchOptions];

  id v15 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v10 options:v14];
  id v16 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v31 = 0;
  char v17 = [v16 isReadyWithError:&v31];
  id v18 = v31;
  if ((v17 & 1) == 0)
  {
    id v19 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_fault_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Flex Music curation requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
    }
  }
  objc_initWeak(location, self);
  id v20 = [(PHAStorytellingClientRequestHandler *)self musicRequestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationForAssetLocalIdentifiers_options_context_reply___block_invoke;
  block[3] = &unk_1E6917948;
  id v29 = v16;
  id v30 = v12;
  void block[4] = self;
  id v27 = v11;
  id v28 = v15;
  id v21 = v16;
  id v22 = v15;
  id v23 = v11;
  id v24 = v12;
  dispatch_async(v20, block);

  objc_destroyWeak(location);
}

void __117__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationForAssetLocalIdentifiers_options_context_reply___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F8D7F0];
    id v4 = v2;
    id v5 = [v3 alloc];
    if (a1[5]) {
      uint64_t v6 = a1[5];
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F1CC08];
    }
    id v8 = (id)[v5 initWithOptionsDictionary:v6];
    objc_msgSend(MEMORY[0x1E4F8D838], "requestFlexMusicCurationForAssetFetchResult:curationOptions:graphManager:reply:", a1[6]);
  }
  else
  {
    uint64_t v7 = a1[8];
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photoanalysis" code:15 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
}

- (void)requestFlexMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v27 = a5;
  id v12 = a6;
  id v13 = objc_opt_class();
  id v14 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v15 = [v13 _fetchOptionsForMusicCurationWithPhotoLibrary:v14];

  id v16 = (void *)MEMORY[0x1E4F38EE8];
  v36[0] = v10;
  char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  id v18 = [v16 fetchAssetCollectionsWithLocalIdentifiers:v17 options:v15];
  id v19 = [v18 firstObject];

  if (v19)
  {
    id v20 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    id v34 = 0;
    char v21 = [v20 isReadyWithError:&v34];
    id v22 = v34;
    if ((v21 & 1) == 0)
    {
      id v23 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v22;
        _os_log_fault_impl(&dword_1D21F2000, v23, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Flex Music curation requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
      }
    }
    objc_initWeak(location, self);
    id v24 = [(PHAStorytellingClientRequestHandler *)self musicRequestQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_context_reply___block_invoke;
    block[3] = &unk_1E6917920;
    objc_copyWeak(&v33, location);
    id v32 = v12;
    id v29 = v11;
    id v30 = v19;
    id v31 = v20;
    id v25 = v20;
    dispatch_async(v24, block);

    objc_destroyWeak(&v33);
    objc_destroyWeak(location);
  }
  else
  {
    id v25 = [NSString stringWithFormat:@"flex music curation requested but no asset collection could be fetched from the specified local identifier: %@", v10, v27];
    id v26 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v25;
      _os_log_error_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music Curation Error: %@", (uint8_t *)location, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, v25);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v22);
  }
}

void __126__PHAStorytellingClientRequestHandler_Music__requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_context_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F8D7F0]);
    if (*(void *)(a1 + 32)) {
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v3 = MEMORY[0x1E4F1CC08];
    }
    id v4 = (void *)[v2 initWithOptionsDictionary:v3];
    [MEMORY[0x1E4F8D838] requestFlexMusicCurationForAssetCollection:*(void *)(a1 + 40) curationOptions:v4 graphManager:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photoanalysis" code:15 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
}

- (void)requestMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v10 = a4;
  id v22 = a5;
  id v11 = a6;
  uint64_t v12 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v13 = [(id)v12 librarySpecificFetchOptions];

  id v14 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v23 options:v13];
  id v15 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v30 = 0;
  LOBYTE(v12) = [v15 isReadyWithError:&v30];
  id v16 = v30;
  if ((v12 & 1) == 0)
  {
    char v17 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v16;
      _os_log_fault_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Music Curation requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
    }
  }
  objc_initWeak(location, self);
  id v18 = [(PHAStorytellingClientRequestHandler *)self musicRequestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__PHAStorytellingClientRequestHandler_Music__requestMusicCurationForAssetLocalIdentifiers_options_context_reply___block_invoke;
  block[3] = &unk_1E6917920;
  objc_copyWeak(&v29, location);
  id v25 = v10;
  id v26 = v14;
  id v27 = self;
  id v28 = v11;
  id v19 = v14;
  id v20 = v10;
  id v21 = v11;
  dispatch_async(v18, block);

  objc_destroyWeak(&v29);
  objc_destroyWeak(location);
}

void __113__PHAStorytellingClientRequestHandler_Music__requestMusicCurationForAssetLocalIdentifiers_options_context_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F8D7F0]);
    if (*(void *)(a1 + 32)) {
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v3 = MEMORY[0x1E4F1CC08];
    }
    id v4 = (void *)[v2 initWithOptionsDictionary:v3];
    uint64_t v5 = (void *)MEMORY[0x1E4F8D838];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 48) graphManager];
    [v5 requestMusicCurationForAssetFetchResult:v6 curationOptions:v4 graphManager:v7 reply:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photoanalysis" code:15 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v4);
  }
}

- (void)requestMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v27 = a5;
  id v12 = a6;
  id v13 = objc_opt_class();
  id v14 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v15 = [v13 _fetchOptionsForMusicCurationWithPhotoLibrary:v14];

  id v16 = (void *)MEMORY[0x1E4F38EE8];
  v36[0] = v10;
  char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  id v18 = [v16 fetchAssetCollectionsWithLocalIdentifiers:v17 options:v15];
  id v19 = [v18 firstObject];

  if (v19)
  {
    id v20 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    id v34 = 0;
    char v21 = [v20 isReadyWithError:&v34];
    id v22 = v34;
    if ((v21 & 1) == 0)
    {
      id v23 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v22;
        _os_log_fault_impl(&dword_1D21F2000, v23, OS_LOG_TYPE_FAULT, "[MemoriesMusic] Music Curation requested when graph not ready, curation will proceed, but results may be non-optimal: %@", (uint8_t *)location, 0xCu);
      }
    }
    objc_initWeak(location, self);
    id v24 = [(PHAStorytellingClientRequestHandler *)self musicRequestQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __122__PHAStorytellingClientRequestHandler_Music__requestMusicCurationForAssetCollectionLocalIdentifier_options_context_reply___block_invoke;
    block[3] = &unk_1E6917920;
    objc_copyWeak(&v33, location);
    id v32 = v12;
    id v29 = v11;
    id v30 = v19;
    id v31 = v20;
    id v25 = v20;
    dispatch_async(v24, block);

    objc_destroyWeak(&v33);
    objc_destroyWeak(location);
  }
  else
  {
    id v25 = [NSString stringWithFormat:@"music curation requested but no asset collections could be fetched from the specified local identifier: %@", v10, v27];
    id v26 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v25;
      _os_log_error_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Music Curation Error: %@", (uint8_t *)location, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, v25);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v22);
  }
}

void __122__PHAStorytellingClientRequestHandler_Music__requestMusicCurationForAssetCollectionLocalIdentifier_options_context_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F8D7F0]);
    if (*(void *)(a1 + 32)) {
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v3 = MEMORY[0x1E4F1CC08];
    }
    id v4 = (void *)[v2 initWithOptionsDictionary:v3];
    [MEMORY[0x1E4F8D838] requestMusicCurationForAssetCollection:*(void *)(a1 + 40) curationOptions:v4 graphManager:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photoanalysis" code:15 userInfo:MEMORY[0x1E4F1CC08]];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
}

+ (id)_aggregateErrorWithErrorDescriptions:(id)a3
{
  uint64_t v3 = [a3 componentsJoinedByString:@"\n"];
  id v4 = [MEMORY[0x1E4F8D3C8] errorWithCode:-1 description:v3];

  return v4;
}

+ (id)_fetchOptionsForMusicCurationWithPhotoLibrary:(id)a3
{
  uint64_t v3 = [a3 librarySpecificFetchOptions];
  [v3 setIncludePendingMemories:1];
  [v3 setIncludeLocalMemories:1];
  [v3 setIncludeStoryMemories:1];

  return v3;
}

- (void)requestHighlightEstimatesWithContext:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, void *, void))a4;
  uint64_t v6 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v16 = 0;
  char v7 = [v6 isReadyWithError:&v16];
  id v8 = v16;
  if (v7)
  {
    id v9 = [v6 workingContext];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F8D708]) initWithWorkingContext:v9];
    id v11 = objc_alloc(MEMORY[0x1E4F8E768]);
    id v12 = [v6 photoLibrary];
    id v13 = (void *)[v11 initWithPhotoLibrary:v12];

    id v14 = [v10 highlightEstimatesDictionaryWithCurationContext:v13];
    id v15 = [v10 highlightEstimatesDescriptionWithCurationContext:v13];
    v5[2](v5, v14, v15, 0);
  }
  else
  {
    ((void (**)(id, void *, void *, id))v5)[2](v5, 0, 0, v8);
  }
}

- (void)requestHighlightDebugInformationForHighlightWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  char v7 = (void (**)(id, void *, void))a5;
  id v8 = a3;
  id v9 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v15 = [v9 librarySpecificFetchOptions];

  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier == %@", v8];

  [v15 setPredicate:v10];
  id v11 = [MEMORY[0x1E4F39238] fetchHighlightsWithOptions:v15];
  id v12 = [v11 firstObject];
  if (v12)
  {
    id v13 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    id v14 = [v13 highlightDebugInformationWithHighlight:v12];

    v7[2](v7, v14, 0);
  }
  else
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v14);
  }
}

- (void)requestSnapshotServiceForPeopleCurationResultsWithGraphOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, __CFString *, id))a5;
  id v11 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v103 = 0;
  LOBYTE(a5) = [v11 isReadyWithError:&v103];
  id v12 = (__CFString *)v103;
  if (a5)
  {
    id v77 = v9;
    id v74 = v8;
    uint64_t v86 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v76 = v11;
    id v13 = [v11 curationManager];
    __int16 v82 = self;
    id v14 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v14];
    long long v75 = v14;
    uint64_t v16 = [v14 librarySpecificFetchOptions];
    [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v16];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    double v83 = v17;
    uint64_t v84 = (void *)v15;
    uint64_t v88 = [v17 countByEnumeratingWithState:&v99 objects:v113 count:16];
    v85 = (void *)v16;
    if (v88)
    {
      uint64_t v18 = *(void *)v100;
      unint64_t v19 = 0x1E4F38000uLL;
      id v72 = v13;
      long long v73 = v10;
      uint64_t v69 = *(void *)v100;
      uint64_t v70 = v12;
      while (2)
      {
        for (uint64_t i = 0; i != v88; ++i)
        {
          if (*(void *)v100 != v18) {
            objc_enumerationMutation(v17);
          }
          char v21 = *(void **)(*((void *)&v99 + 1) + 8 * i);
          if ((unint64_t)(objc_msgSend(v21, "verifiedType", v69) - 1) <= 1)
          {
            [v21 name];
            id v22 = v87 = v21;
            uint64_t v23 = [v22 length];

            if (v23)
            {
              context = (void *)MEMORY[0x1D26057A0]();
              id v24 = [v87 localIdentifier];
              id v25 = [v13 curatedAssetsForPersonLocalIdentifier:v24 progressBlock:0];

              id v26 = *(void **)(v19 + 3768);
              v112 = v87;
              id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
              uint64_t v28 = [v26 fetchAssetsForPersons:v27 options:v16];

              v80 = (void *)v28;
              uint64_t v29 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v28 title:0];
              uint64_t v30 = [v13 optimalDurationForAssetCollection:v29 duration:2 options:MEMORY[0x1E4F1CC08] curationContext:v15];
              id v31 = (void *)[objc_alloc(MEMORY[0x1E4F8D380]) initWithDuration:v30];
              [v31 setIncludesAllFaces:1];
              uint64_t v78 = v31;
              __int16 v79 = (void *)v29;
              id v32 = [v13 curatedAssetsForAssetCollection:v29 options:v31 curationContext:v15 progressBlock:0];
              id v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v25, "count"));
              long long v95 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              id v34 = v25;
              uint64_t v35 = [v34 countByEnumeratingWithState:&v95 objects:v111 count:16];
              if (v35)
              {
                uint64_t v36 = v35;
                uint64_t v37 = *(void *)v96;
                while (2)
                {
                  for (uint64_t j = 0; j != v36; ++j)
                  {
                    if (*(void *)v96 != v37) {
                      objc_enumerationMutation(v34);
                    }
                    uint64_t v39 = *(void **)(*((void *)&v95 + 1) + 8 * j);
                    uint64_t v40 = [v39 cloudIdentifier];

                    if (!v40)
                    {
                      int v71 = 0;
                      goto LABEL_19;
                    }
                    uint64_t v41 = [v39 cloudIdentifier];
                    [v33 addObject:v41];
                  }
                  uint64_t v36 = [v34 countByEnumeratingWithState:&v95 objects:v111 count:16];
                  if (v36) {
                    continue;
                  }
                  break;
                }
              }
              int v71 = 1;
LABEL_19:

              id v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v32, "count"));
              long long v91 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              long long v94 = 0u;
              id v43 = v32;
              uint64_t v44 = [v43 countByEnumeratingWithState:&v91 objects:v110 count:16];
              if (v44)
              {
                uint64_t v45 = v44;
                uint64_t v46 = *(void *)v92;
                while (2)
                {
                  for (uint64_t k = 0; k != v45; ++k)
                  {
                    if (*(void *)v92 != v46) {
                      objc_enumerationMutation(v43);
                    }
                    long long v48 = *(void **)(*((void *)&v91 + 1) + 8 * k);
                    uint64_t v49 = [v48 cloudIdentifier];

                    if (!v49)
                    {

                      goto LABEL_37;
                    }
                    uint32_t v50 = [v48 cloudIdentifier];
                    [v42 addObject:v50];
                  }
                  uint64_t v45 = [v43 countByEnumeratingWithState:&v91 objects:v110 count:16];
                  if (v45) {
                    continue;
                  }
                  break;
                }
              }

              if (!v71)
              {
LABEL_37:

                id v17 = v83;

                v61 = [(PHAStorytellingClientRequestHandler *)v82 loggingConnection];
                id v10 = v73;
                __int16 v62 = v84;
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v105 = "-[PHAStorytellingClientRequestHandler(Related) requestSnapshotServiceForPeopleCurationResultsWi"
                         "thGraphOptions:context:reply:]";
                  __int16 v106 = 2112;
                  v107 = @"Error: Should be called on cloud enabled libraries only (cloudIdentifier is nil)";
                  _os_log_error_impl(&dword_1D21F2000, v61, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
                }

                objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 17, @"Error: Should be called on cloud enabled libraries only (cloudIdentifier is nil)");
                id v53 = (id)objc_claimAutoreleasedReturnValue();
                v73[2](v73, @"failed", v53);
                id v8 = v74;
                double v63 = v75;
                id v11 = v76;
                id v9 = v77;
                id v13 = v72;
                id v12 = v70;
                goto LABEL_49;
              }
              v108[0] = @"people";
              v108[1] = @"regular";
              v109[0] = v33;
              v109[1] = v42;
              uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:2];
              id v52 = [v87 name];
              [v86 setObject:v51 forKeyedSubscript:v52];

              id v13 = v72;
              id v10 = v73;
              uint64_t v15 = (uint64_t)v84;
              uint64_t v16 = (uint64_t)v85;
              id v17 = v83;
              uint64_t v18 = v69;
              unint64_t v19 = 0x1E4F38000;
            }
          }
        }
        id v12 = v70;
        uint64_t v88 = [v17 countByEnumeratingWithState:&v99 objects:v113 count:16];
        if (v88) {
          continue;
        }
        break;
      }
    }

    id v53 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    long long v54 = [(PHAStorytellingClientRequestHandler *)v82 graphManager];
    id v55 = [v54 defaultGraphExportFullPath];
    long long v56 = [v55 stringByDeletingLastPathComponent];

    id v57 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v56 isDirectory:1];
    v90 = v12;
    [v53 createDirectoryAtURL:v57 withIntermediateDirectories:1 attributes:0 error:&v90];
    id v58 = v90;
    v59 = v12;
    id v12 = v58;

    if (v12)
    {
      os_log_t v60 = [(PHAStorytellingClientRequestHandler *)v82 loggingConnection];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v105 = "-[PHAStorytellingClientRequestHandler(Related) requestSnapshotServiceForPeopleCurationResultsWithGraphOpt"
               "ions:context:reply:]";
        __int16 v106 = 2112;
        v107 = v12;
        _os_log_error_impl(&dword_1D21F2000, v60, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
      }

      v10[2](v10, @"failed", v12);
      id v8 = v74;
    }
    else
    {
      uint64_t v64 = [v57 URLByAppendingPathComponent:@"peopleCurationsSnapshot.plist"];
      id v65 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initWithURL:v64 append:0];
      [v65 open];
      id v89 = 0;
      uint64_t v66 = [MEMORY[0x1E4F28F98] writePropertyList:v86 toStream:v65 format:100 options:0 error:&v89];
      id v12 = (__CFString *)v89;
      if (v66)
      {
        [v65 close];
        v67 = [(PHAStorytellingClientRequestHandler *)v82 loggingConnection];
        id v8 = v74;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v67, OS_LOG_TYPE_INFO, "Export matching result done!", buf, 2u);
        }

        v10[2](v10, @"success", 0);
      }
      else
      {
        id v68 = [(PHAStorytellingClientRequestHandler *)v82 loggingConnection];
        id v8 = v74;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v105 = "-[PHAStorytellingClientRequestHandler(Related) requestSnapshotServiceForPeopleCurationResultsWithGraphO"
                 "ptions:context:reply:]";
          __int16 v106 = 2112;
          v107 = v12;
          _os_log_error_impl(&dword_1D21F2000, v68, OS_LOG_TYPE_ERROR, "%s - %@", buf, 0x16u);
        }

        [v65 close];
        [v53 removeItemAtURL:v64 error:0];
        v10[2](v10, @"failed", v12);
      }

      id v17 = v83;
    }

    id v11 = v76;
    id v9 = v77;
    double v63 = v75;
    __int16 v62 = v84;
LABEL_49:
  }
  else
  {
    v10[2](v10, 0, v12);
  }
}

- (void)requestSnapshotServiceForRelatedResultsWithGraphOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, __CFString *, id))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v26 = 0;
  char v10 = [v9 isReadyWithError:&v26];
  id v11 = v26;
  if (v10)
  {
    id v12 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v13 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:0 options:v7 photoLibrary:v12];

    if (v13)
    {
      uint64_t v24 = [v9 defaultSnapshotRootPath];
      uint64_t v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v24 isDirectory:1];
      id v14 = [v9 workingContextForRelated];
      id v15 = objc_alloc(MEMORY[0x1E4F8D8B8]);
      uint64_t v16 = [(PHAStorytellingClientRequestHandler *)self graphManager];
      id v17 = [v16 blockedFeatures];
      uint64_t v18 = (void *)[v15 initWithWorkingContext:v14 blockedFeatures:v17];

      id v25 = v11;
      LODWORD(v17) = [v18 exportMatchingResultsForMoment:v13 relatedType:63 toURL:v23 error:&v25];
      id v19 = v25;

      if (v17) {
        id v20 = @"success";
      }
      else {
        id v20 = @"failed";
      }
      v8[2](v8, v20, v19);

      char v21 = (void *)v24;
    }
    else
    {
      char v21 = [NSString localizedStringWithFormat:@"No matching asset collection found for a given graph options: %@", v7];
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, v21);
      id v19 = (id)objc_claimAutoreleasedReturnValue();

      id v22 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v21;
        _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "Graph Snapshot Error: %{public}@", buf, 0xCu);
      }

      v8[2](v8, @"failed", v19);
    }

    id v11 = v19;
  }
  else
  {
    v8[2](v8, @"failed", v11);
  }
}

- (id)_assetCollectionForRelatedIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 componentsSeparatedByString:@", "];
  if ((unint64_t)[v5 count] < 2)
  {
    uint64_t v16 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v15 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v4 options:0 photoLibrary:v16];
  }
  else
  {
    id v19 = v4;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v7 = [v18 librarySpecificFetchOptions];
    id v8 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithLocalIdentifiers:v5 options:v7];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(*((void *)&v20 + 1) + 8 * i) options:v7];
          id v14 = [v13 fetchedObjects];

          [v6 addObjectsFromArray:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
    id v15 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v6 title:0 identifier:0 photoLibrary:v18];

    id v4 = v19;
  }

  return v15;
}

- (void)requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 additionalSnapshotSummaryInfo:(id)a6 context:(id)a7 reply:(id)a8
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void, id))a8;
  [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v52 = v62 = 0;
  LOBYTE(a8) = [v52 isReadyWithError:&v62];
  id v17 = v62;
  uint64_t v18 = v17;
  if ((a8 & 1) == 0)
  {
    v16[2](v16, 0, v17);
    goto LABEL_41;
  }
  id v45 = v17;
  uint32_t v50 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v49 = v13;
  uint64_t v46 = (void (**)(void, __CFString *, id))v16;
  uint64_t v47 = v15;
  if (v13)
  {
    long long v20 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v13 options:0 photoLibrary:v19];
  }
  else
  {
    long long v20 = 0;
  }
  uint64_t v44 = (void *)v19;
  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v19];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v48 = v14;
  id v21 = v14;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v59 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if ([v26 length])
        {
          uint64_t v27 = [(PHAStorytellingClientRequestHandler *)self _assetCollectionForRelatedIdentifier:v26];
          uint64_t v28 = (void *)v27;
          if (v20) {
            uint64_t v29 = v20;
          }
          else {
            uint64_t v29 = (void *)v27;
          }
          uint64_t v30 = [v52 relatedDebugInformationBetweenReferenceAssetCollection:v29 andRelatedAssetCollection:v27 relatedType:a5 curationContext:v51];
          if (v30) {
            [v50 setObject:v30 forKey:v26];
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v23);
  }

  id v15 = v47;
  if (v47)
  {
    id v31 = [MEMORY[0x1E4F1CA60] dictionary];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __214__PHAStorytellingClientRequestHandler_Related__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_context_reply___block_invoke;
    v55[3] = &unk_1E6917E38;
    id v56 = v47;
    id v32 = v31;
    id v57 = v32;
    [v50 enumerateKeysAndObjectsUsingBlock:v55];
  }
  else
  {
    id v32 = v50;
  }
  id v13 = v49;
  if ([v32 count])
  {
    id v33 = [v52 snapshotOuputFilePathURLForKey:*MEMORY[0x1E4F8DBB0]];
    id v54 = 0;
    id v34 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v32 format:200 options:0 error:&v54];
    id v35 = v54;
    if (v35)
    {
      id v36 = v35;

LABEL_36:
      goto LABEL_37;
    }
    id v53 = 0;
    char v37 = [v34 writeToURL:v33 options:0 error:&v53];
    id v36 = v53;
    if ((v37 & 1) == 0)
    {
      uint64_t v38 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v64 = (uint64_t)v33;
        __int16 v65 = 2114;
        uint64_t v66 = (uint64_t)v36;
        _os_log_error_impl(&dword_1D21F2000, v38, OS_LOG_TYPE_ERROR, "error in writing to %@ - %{public}@", buf, 0x16u);
      }
    }
    if (v36) {
      goto LABEL_37;
    }
  }
  uint64_t v39 = [v32 count];
  if (v39 != [v21 count])
  {
    uint64_t v40 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = [v21 count];
      uint64_t v42 = [v32 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v64 = v41;
      __int16 v65 = 2048;
      uint64_t v66 = v42;
      _os_log_impl(&dword_1D21F2000, v40, OS_LOG_TYPE_INFO, "Related Debug Info requested(%lu) and results(%lu) does not match", buf, 0x16u);
    }

    id v33 = objc_msgSend(NSString, "stringWithFormat:", @"Related Debug Info requested(%lu) and results(%lu) dose not match", objc_msgSend(v21, "count"), objc_msgSend(v32, "count"));
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, v33);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  id v36 = 0;
LABEL_37:
  if (v36) {
    id v43 = @"failed";
  }
  else {
    id v43 = @"success";
  }
  uint64_t v16 = (void (**)(id, void, id))v46;
  v46[2](v46, v43, v36);

  id v14 = v48;
  uint64_t v18 = v45;
LABEL_41:
}

void __214__PHAStorytellingClientRequestHandler_Related__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_context_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v8];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [v7 setObject:v5 forKey:@"matchingResult"];
    [v7 setObject:v6 forKey:@"debugInfo"];
    [*(id *)(a1 + 40) setObject:v7 forKey:v8];
  }
}

- (void)requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 context:(id)a6 reply:(id)a7
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, __CFString *, id))a7;
  [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v54 = v61 = 0;
  LOBYTE(a7) = [v54 isReadyWithError:&v61];
  id v14 = v61;
  if (a7)
  {
    id v52 = v13;
    id v15 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    uint64_t v16 = (void *)MEMORY[0x1E4F38EB8];
    v67[0] = v11;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
    uint64_t v18 = [v15 librarySpecificFetchOptions];
    uint64_t v19 = [v16 fetchAssetsWithLocalIdentifiers:v17 options:v18];
    uint64_t v20 = [v19 firstObject];

    id v53 = (void *)v20;
    if (v20)
    {
      id v48 = v14;
      id v50 = v11;
      id v21 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v51 = v15;
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v15];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v49 = v12;
      id v23 = v12;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v58 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            if ([v28 length])
            {
              uint64_t v29 = [(PHAStorytellingClientRequestHandler *)self _assetCollectionForRelatedIdentifier:v28];
              uint64_t v30 = [v54 relatedDebugInformationBetweenAsset:v53 andRelatedAssetCollection:v29 relatedType:a5 curationContext:v22];
              if (v30) {
                [v21 addObject:v30];
              }
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v66 count:16];
        }
        while (v25);
      }

      id v31 = v21;
      id v15 = v51;
      id v13 = v52;
      if (![v21 count]) {
        goto LABEL_24;
      }
      id v32 = [v54 defaultSnapshotRootPath];
      id v33 = (void *)MEMORY[0x1E4F1CB10];
      id v34 = [v32 stringByAppendingPathComponent:@"snapshotAssetAndRelatedDebugInfo.plist"];
      id v35 = [v33 fileURLWithPath:v34];

      id v56 = 0;
      id v36 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v31 format:200 options:0 error:&v56];
      id v37 = v56;
      if (!v37)
      {
        id v55 = 0;
        uint64_t v47 = v35;
        char v38 = [v36 writeToURL:v35 options:0 error:&v55];
        id v37 = v55;
        if (v38)
        {
          id v15 = v51;
          id v35 = v47;
        }
        else
        {
          uint64_t v40 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
          id v35 = v47;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v63 = (uint64_t)v47;
            __int16 v64 = 2114;
            uint64_t v65 = (uint64_t)v37;
            _os_log_error_impl(&dword_1D21F2000, v40, OS_LOG_TYPE_ERROR, "error in writing to %@ - %{public}@", buf, 0x16u);
          }

          id v15 = v51;
        }
      }

      if (!v37)
      {
LABEL_24:
        uint64_t v41 = [v31 count];
        if (v41 == [v23 count])
        {
          id v37 = 0;
        }
        else
        {
          uint64_t v42 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            uint64_t v43 = [v31 count];
            uint64_t v44 = [v23 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v63 = v43;
            __int16 v64 = 2048;
            uint64_t v65 = v44;
            _os_log_impl(&dword_1D21F2000, v42, OS_LOG_TYPE_INFO, "Related Debug Info requested(%lu) and results(%lu) does not match", buf, 0x16u);
          }

          id v45 = objc_msgSend(NSString, "stringWithFormat:", @"Related Debug Info requested(%lu) and results(%lu) does not match", objc_msgSend(v23, "count"), objc_msgSend(v31, "count"));
          objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, v45);
          id v37 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      if (v37) {
        uint64_t v46 = @"failed";
      }
      else {
        uint64_t v46 = @"success";
      }
      v52[2](v52, v46, v37);

      id v12 = v49;
      id v11 = v50;
      id v14 = v48;
    }
    else
    {
      uint64_t v39 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);

      id v13 = v52;
      v52[2](v52, @"failed", (id)v39);
      id v14 = (id)v39;
    }
  }
  else
  {
    v13[2](v13, @"failed", v14);
  }
}

- (void)requestSnapshotServiceForRelatedWithAssetLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, __CFString *, id))a5;
  uint64_t v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v30 = 0;
  char v10 = [v9 isReadyWithError:&v30];
  id v11 = v30;
  if (v10)
  {
    uint64_t v28 = [v9 defaultSnapshotRootPath];
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:");
    id v12 = (void *)MEMORY[0x1E4F38EB8];
    v33[0] = v7;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v14 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v15 = [v14 librarySpecificFetchOptions];
    uint64_t v16 = [v12 fetchAssetsWithLocalIdentifiers:v13 options:v15];
    id v17 = [v16 firstObject];

    if (v17)
    {
      uint64_t v18 = [v9 workingContextForRelated];
      id v19 = objc_alloc(MEMORY[0x1E4F8D8B8]);
      uint64_t v20 = [(PHAStorytellingClientRequestHandler *)self graphManager];
      id v21 = [v20 blockedFeatures];
      uint64_t v22 = (void *)[v19 initWithWorkingContext:v18 blockedFeatures:v21];

      id v29 = v11;
      id v23 = (void *)v27;
      LODWORD(v20) = [v22 exportMatchingResultsForAsset:v17 relatedType:63 toURL:v27 error:&v29];
      id v24 = v29;

      if (v20) {
        uint64_t v25 = @"success";
      }
      else {
        uint64_t v25 = @"failed";
      }
      v8[2](v8, v25, v24);
    }
    else
    {
      uint64_t v18 = [NSString localizedStringWithFormat:@"No matching asset found for identifier: %@", v7];
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, v18);
      id v24 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v26 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v7;
        _os_log_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_INFO, "No matching asset found for identifier: %@", buf, 0xCu);
      }

      v8[2](v8, @"failed", v24);
      id v23 = (void *)v27;
    }

    id v11 = v24;
  }
  else
  {
    v8[2](v8, @"failed", v11);
  }
}

- (void)requestSnapshotServiceForRelatedWithMomentLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, __CFString *, id))a5;
  uint64_t v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v28 = 0;
  char v10 = [v9 isReadyWithError:&v28];
  id v11 = v28;
  if (v10)
  {
    id v12 = [v9 defaultSnapshotRootPath];
    id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:1];
    id v14 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v15 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v7 options:0 photoLibrary:v14];

    if (v15)
    {
      uint64_t v16 = [v9 workingContextForRelated];
      id v17 = objc_alloc(MEMORY[0x1E4F8D8B8]);
      uint64_t v18 = [(PHAStorytellingClientRequestHandler *)self graphManager];
      [v18 blockedFeatures];
      id v19 = v25 = v7;
      uint64_t v26 = v12;
      uint64_t v20 = (void *)[v17 initWithWorkingContext:v16 blockedFeatures:v19];

      id v27 = v11;
      LODWORD(v19) = [v20 exportMatchingResultsForMoment:v15 relatedType:63 toURL:v13 error:&v27];
      id v21 = v27;

      BOOL v22 = v19 == 0;
      id v7 = v25;
      if (v22) {
        id v23 = @"failed";
      }
      else {
        id v23 = @"success";
      }
      v8[2](v8, v23, v21);

      id v12 = v26;
    }
    else
    {
      uint64_t v16 = [NSString localizedStringWithFormat:@"No matching asset collection found for identifier: %@", v7];
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, v16);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      id v24 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v7;
        _os_log_impl(&dword_1D21F2000, v24, OS_LOG_TYPE_INFO, "No matching asset collection found for identifier: %@", buf, 0xCu);
      }

      v8[2](v8, @"failed", v21);
    }

    id v11 = v21;
  }
  else
  {
    v8[2](v8, @"failed", v11);
  }
}

- (void)requestRelatedDebugInformationBetweenAssetForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 context:(id)a7 reply:(id)a8
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (void (**)(id, void *, void))a8;
  id v17 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v32 = 0;
  char v18 = [v17 isReadyWithError:&v32];
  id v19 = v32;
  if (v18)
  {
    unint64_t v30 = a6;
    id v31 = v14;
    uint64_t v20 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v21 = (void *)MEMORY[0x1E4F38EB8];
    v33[0] = v13;
    BOOL v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    id v23 = [v20 librarySpecificFetchOptions];
    id v24 = [v21 fetchAssetsWithLocalIdentifiers:v22 options:v23];
    id v25 = [v24 firstObject];

    if (v25)
    {
      uint64_t v26 = [v15 objectForKeyedSubscript:@"PHPhotosGraphOptionRelatedOptions"];
      id v27 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v31 options:v26 photoLibrary:v20];

      id v28 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v20];
      id v29 = [v17 relatedDebugInformationBetweenAsset:v25 andRelatedAssetCollection:v27 relatedType:v30 curationContext:v28];
      v16[2](v16, v29, 0);
    }
    else
    {
      id v27 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
      ((void (**)(id, void *, void *))v16)[2](v16, 0, v27);
    }

    id v14 = v31;
  }
  else
  {
    ((void (**)(id, void *, id))v16)[2](v16, 0, v19);
  }
}

- (void)requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 context:(id)a7 reply:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v16 = (void (**)(id, void *, void))a8;
  id v17 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v29 = 0;
  char v18 = [v17 isReadyWithError:&v29];
  id v19 = v29;
  if (v18)
  {
    uint64_t v20 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    [v15 objectForKeyedSubscript:@"PHPhotosGraphOptionReferenceOptions"];
    id v21 = v27 = a6;
    BOOL v22 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v13 options:v21 photoLibrary:v20];

    [v15 objectForKeyedSubscript:@"PHPhotosGraphOptionRelatedOptions"];
    id v23 = v28 = v13;
    id v24 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v14 options:v23 photoLibrary:v20];

    id v25 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v20];
    uint64_t v26 = [v17 relatedDebugInformationBetweenReferenceAssetCollection:v22 andRelatedAssetCollection:v24 relatedType:v27 curationContext:v25];
    v16[2](v16, v26, 0);

    id v13 = v28;
  }
  else
  {
    ((void (**)(id, void *, id))v16)[2](v16, 0, v19);
  }
}

- (void)requestAssetCollectionsRelatedToAssetWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a6;
  id v12 = [v10 objectForKeyedSubscript:@"PHRelatedOptionPredicateKey"];
  if (!v12)
  {
LABEL_4:
    uint64_t v16 = (void *)MEMORY[0x1E4F38EB8];
    v43[0] = v9;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    char v18 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v19 = [v18 librarySpecificFetchOptions];
    uint64_t v20 = [v16 fetchAssetsWithLocalIdentifiers:v17 options:v19];
    id v15 = [v20 firstObject];

    if (v15)
    {
      id v21 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v9;
        __int16 v41 = 2112;
        id v42 = v15;
        _os_log_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_INFO, "Related Collections for Asset Request: assetID:%@ is asset:%@", buf, 0x16u);
      }
      id v36 = v9;

      BOOL v22 = [v10 objectForKeyedSubscript:@"PHRelatedOptionRelationOptionsKey"];
      uint64_t v23 = [v22 unsignedIntegerValue];

      if (!v23) {
        uint64_t v23 = 63;
      }
      id v24 = [(PHAStorytellingClientRequestHandler *)self graphManager];
      id v35 = v10;
      id v25 = (void *)[objc_alloc(MEMORY[0x1E4F8D8C0]) initWithOptions:v10];
      uint64_t v26 = [v24 workingContextForRelated];
      id v27 = objc_alloc(MEMORY[0x1E4F8D8B8]);
      id v28 = [v24 blockedFeatures];
      id v29 = (void *)[v27 initWithWorkingContext:v26 blockedFeatures:v28];

      id v37 = 0;
      unint64_t v30 = [v29 relatedCollectionsForAsset:v15 relatedType:v23 options:v25 error:&v37];
      id v13 = v37;
      if (v30)
      {
        id v31 = [v30 valueForKey:@"dictionaryRepresentation"];
        v11[2](v11, v31, v13);
      }
      else
      {
        id v34 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v36;
          _os_log_error_impl(&dword_1D21F2000, v34, OS_LOG_TYPE_ERROR, "Related Collections for Asset Error: Failed to match asset:%@", buf, 0xCu);
        }

        v11[2](v11, 0, v13);
      }

      id v10 = v35;
      id v9 = v36;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v33 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v9;
        _os_log_error_impl(&dword_1D21F2000, v33, OS_LOG_TYPE_ERROR, "Related Collections for Asset Error: Failed to lookup assetID:%@", buf, 0xCu);
      }

      v11[2](v11, 0, v13);
      id v15 = 0;
    }
    goto LABEL_21;
  }
  id v13 = (id)objc_opt_new();
  uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F291AD38];
  [v13 setAllowedKeyPaths:v14];

  id v38 = 0;
  LOBYTE(v14) = [v13 validatePredicate:v12 error:&v38];
  id v15 = v38;
  if (v14)
  {
    [v12 allowEvaluation];

    goto LABEL_4;
  }
  id v32 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v12;
    _os_log_error_impl(&dword_1D21F2000, v32, OS_LOG_TYPE_ERROR, "Related Collections for Asset Error: Failed to validate predicate %@", buf, 0xCu);
  }

  v11[2](v11, 0, v15);
LABEL_21:
}

- (void)requestAssetCollectionsRelatedToPersonLocalIdentifiers:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, id))a6;
  id v12 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v40 = 0;
  LOBYTE(a6) = [v12 isReadyWithError:&v40];
  id v13 = v40;
  if (a6)
  {
    uint64_t v14 = [v10 objectForKeyedSubscript:@"PHRelatedOptionPredicateKey"];
    if (v14)
    {
      id v15 = [(PHAStorytellingClientRequestHandler *)self relatedRequestPredicateValidator];
      id v39 = 0;
      char v16 = [v15 validatePredicate:v14 error:&v39];
      id v17 = v39;

      if ((v16 & 1) == 0)
      {
        id v33 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v14;
          _os_log_error_impl(&dword_1D21F2000, v33, OS_LOG_TYPE_ERROR, "Related Collections for Face Collection Error: Failed to validate predicate %@", buf, 0xCu);
        }

        v11[2](v11, 0, v17);
        goto LABEL_15;
      }
      [v14 allowEvaluation];
    }
    id v35 = v12;
    id v37 = v14;
    char v18 = [v10 objectForKeyedSubscript:@"PHRelatedOptionRelationOptionsKey"];
    uint64_t v19 = [v18 unsignedIntegerValue];

    uint64_t v20 = 63;
    if (v19) {
      uint64_t v20 = v19;
    }
    uint64_t v34 = v20;
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F8D8C0]) initWithOptions:v10];
    BOOL v22 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    uint64_t v23 = [v22 workingContextForRelated];

    id v24 = objc_alloc(MEMORY[0x1E4F8D8B8]);
    [(PHAStorytellingClientRequestHandler *)self graphManager];
    v26 = id v25 = v9;
    id v27 = [v26 blockedFeatures];
    id v36 = (void *)v23;
    uint64_t v28 = v23;
    id v17 = (id)v21;
    id v29 = (void *)[v24 initWithWorkingContext:v28 blockedFeatures:v27];

    id v9 = v25;
    id v38 = v13;
    unint64_t v30 = [v29 relatedCollectionsForPersonLocalIdentifiers:v25 relatedType:v34 options:v21 error:&v38];
    id v31 = v38;

    if (v30)
    {
      id v32 = [v30 valueForKey:@"dictionaryRepresentation"];
      ((void (**)(id, void *, id))v11)[2](v11, v32, v31);

      id v9 = v25;
    }
    else
    {
      v11[2](v11, 0, v31);
    }

    id v13 = v31;
    uint64_t v14 = v37;
    id v12 = v35;
LABEL_15:

    goto LABEL_16;
  }
  v11[2](v11, 0, v13);
LABEL_16:
}

- (void)requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v9 = (char *)a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, id))a6;
  id v12 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v14 = v12;
  id v15 = v14;
  unint64_t v70 = v13 - 1;
  os_signpost_id_t spid = v13;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RelatedCollectionsForAssetCollectionRequest", "", buf, 2u);
  }

  uint64_t v69 = mach_absolute_time();
  char v16 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = (void *)MEMORY[0x1E4F8D8B8];
    char v18 = [v10 objectForKeyedSubscript:@"PHRelatedOptionRelationOptionsKey"];
    uint64_t v19 = objc_msgSend(v17, "stringFromPGRelatedType:", objc_msgSend(v18, "unsignedIntegerValue"));
    *(_DWORD *)buf = 138412546;
    long long v76 = v9;
    __int16 v77 = 2112;
    double v78 = *(double *)&v19;
    _os_log_impl(&dword_1D21F2000, v16, OS_LOG_TYPE_INFO, "Related Collections for Asset Collection Request: assetCollectionID:%@ relatedType:%@", buf, 0x16u);
  }
  uint64_t v20 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v73 = 0;
  char v21 = [v20 isReadyWithError:&v73];
  id v22 = v73;
  if (v21)
  {
    uint64_t v66 = v20;
    uint64_t v23 = [v10 objectForKeyedSubscript:@"PHRelatedOptionPredicateKey"];
    uint64_t v68 = v9;
    if (v23)
    {
      id v24 = v15;
      id v25 = v10;
      uint64_t v26 = [(PHAStorytellingClientRequestHandler *)self relatedRequestPredicateValidator];
      id v72 = 0;
      id v27 = v23;
      char v28 = [v26 validatePredicate:v23 error:&v72];
      id v29 = v72;

      if ((v28 & 1) == 0)
      {
        id v54 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        uint64_t v23 = v27;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v76 = (const char *)v27;
          _os_log_error_impl(&dword_1D21F2000, v54, OS_LOG_TYPE_ERROR, "Related Collections for Asset Collection Error: Failed to validate predicate %@", buf, 0xCu);
        }

        unint64_t v30 = v29;
        v11[2](v11, 0, v29);
        id v10 = v25;
        id v15 = v24;
        id v9 = v68;
        goto LABEL_36;
      }
      [v27 allowEvaluation];

      uint64_t v23 = v27;
      id v10 = v25;
      id v15 = v24;
      id v9 = v68;
    }
    unint64_t v30 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    v67 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v9 options:v10 photoLibrary:v30];
    if (v67)
    {
      __int16 v64 = v23;
      uint64_t v65 = v30;
      id v31 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        long long v76 = v9;
        __int16 v77 = 2112;
        double v78 = *(double *)&v67;
        _os_log_impl(&dword_1D21F2000, v31, OS_LOG_TYPE_INFO, "Related Collections for Asset Collection Request: assetCollectionID:%@ is assetCollection:%@", buf, 0x16u);
      }

      id v32 = [v10 objectForKeyedSubscript:@"PHRelatedOptionRelationOptionsKey"];
      uint64_t v33 = [v32 unsignedIntegerValue];

      uint64_t v34 = 63;
      if (v33) {
        uint64_t v34 = v33;
      }
      uint64_t v62 = v34;
      uint64_t v35 = [objc_alloc(MEMORY[0x1E4F8D8C0]) initWithOptions:v10];
      id v36 = [(PHAStorytellingClientRequestHandler *)self graphManager];
      uint64_t v37 = [v36 workingContextForRelated];

      id v38 = objc_alloc(MEMORY[0x1E4F8D8B8]);
      id v39 = [(PHAStorytellingClientRequestHandler *)self graphManager];
      id v40 = [v39 blockedFeatures];
      id v61 = (void *)v37;
      __int16 v41 = (void *)[v38 initWithWorkingContext:v37 blockedFeatures:v40];

      long long v59 = (void *)[objc_alloc(MEMORY[0x1E4F8E768]) initWithPhotoLibrary:v65];
      long long v60 = v41;
      uint64_t v42 = v62;
      uint64_t v63 = (void *)v35;
      uint64_t v43 = objc_msgSend(v41, "relatedCollectionsForAssetCollection:relatedType:options:curationContext:error:", v67, v42, v35);
      id v44 = v22;

      long long v58 = v43;
      if (v43)
      {
        id v45 = [v43 valueForKey:@"dictionaryRepresentation"];
        uint64_t v46 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          uint64_t v47 = [v45 count];
          *(_DWORD *)buf = 134217984;
          long long v76 = (const char *)v47;
          _os_log_impl(&dword_1D21F2000, v46, OS_LOG_TYPE_INFO, "Related Collections for Asset Collection Reply: resultsCount:%lu", buf, 0xCu);
        }

        uint64_t v48 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        uint64_t v51 = v15;
        id v52 = v51;
        id v9 = v68;
        uint64_t v23 = v64;
        if (v70 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D21F2000, v52, OS_SIGNPOST_INTERVAL_END, spid, "RelatedCollectionsForAssetCollectionRequest", " enableTelemetry=YES ", buf, 2u);
        }

        unint64_t v30 = v65;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          long long v76 = "RelatedCollectionsForAssetCollectionRequest";
          __int16 v77 = 2048;
          double v78 = (float)((float)((float)((float)(v48 - v69) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D21F2000, v52, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        id v53 = v44;
        ((void (**)(id, void *, id))v11)[2](v11, v45, v44);
      }
      else
      {
        long long v57 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        id v9 = v68;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v76 = v68;
          _os_log_error_impl(&dword_1D21F2000, v57, OS_LOG_TYPE_ERROR, "Related Collections for Asset Collection Error: Failed to match assetCollectionID:%@", buf, 0xCu);
        }

        id v53 = v44;
        v11[2](v11, 0, v44);
        uint64_t v23 = v64;
        unint64_t v30 = v65;
      }
      id v55 = v63;

      id v22 = v53;
    }
    else
    {
      id v55 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
      id v56 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v76 = v9;
        _os_log_error_impl(&dword_1D21F2000, v56, OS_LOG_TYPE_ERROR, "Related Collections for Asset Collection Error: Failed to lookup assetCollectionID:%@", buf, 0xCu);
      }

      v11[2](v11, 0, v55);
    }

LABEL_36:
    uint64_t v20 = v66;
    goto LABEL_37;
  }
  v11[2](v11, 0, v22);
LABEL_37:
}

- (void)requestAssetCollectionsRelatedToMomentWithLocalIdentifier:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v9 = (char *)a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, id))a6;
  id v12 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v14 = v12;
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RelatedCollectionsForMomentRequest", "", buf, 2u);
  }

  uint64_t v68 = mach_absolute_time();
  char v16 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = (void *)MEMORY[0x1E4F8D8B8];
    [v10 objectForKeyedSubscript:@"PHRelatedOptionRelationOptionsKey"];
    v19 = id v18 = v10;
    uint64_t v20 = objc_msgSend(v17, "stringFromPGRelatedType:", objc_msgSend(v19, "unsignedIntegerValue"));
    *(_DWORD *)buf = 138412546;
    long long v75 = v9;
    __int16 v76 = 2112;
    double v77 = *(double *)&v20;
    _os_log_impl(&dword_1D21F2000, v16, OS_LOG_TYPE_INFO, "Related Collections for Moment Request: momentID:%@ relatedType:%@", buf, 0x16u);

    id v10 = v18;
  }

  char v21 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v72 = 0;
  char v22 = [v21 isReadyWithError:&v72];
  id v23 = v72;
  if (v22)
  {
    __int16 v64 = v11;
    uint64_t v65 = v21;
    uint64_t v69 = v9;
    uint64_t v24 = [v10 objectForKeyedSubscript:@"PHRelatedOptionPredicateKey"];
    uint64_t v66 = (char *)v24;
    if (v24)
    {
      id v25 = (void *)v24;
      uint64_t v26 = [(PHAStorytellingClientRequestHandler *)self relatedRequestPredicateValidator];
      id v71 = 0;
      char v27 = [v26 validatePredicate:v25 error:&v71];
      id v28 = v71;

      if ((v27 & 1) == 0)
      {
        id v53 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        id v9 = v69;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v75 = v66;
          _os_log_error_impl(&dword_1D21F2000, v53, OS_LOG_TYPE_ERROR, "Related Collections for Moment Error: Failed to validate predicate %@", buf, 0xCu);
        }

        id v50 = v28;
        id v11 = v64;
        v64[2](v64, 0, v50);
        goto LABEL_36;
      }
      [v25 allowEvaluation];
    }
    id v29 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v9 = v69;
    uint64_t v30 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v69 options:v10 photoLibrary:v29];

    v67 = (void *)v30;
    if (v30)
    {
      id v31 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        long long v75 = v69;
        __int16 v76 = 2112;
        double v77 = *(double *)&v30;
        _os_log_impl(&dword_1D21F2000, v31, OS_LOG_TYPE_INFO, "Related Collections for Moment Request: momentID:%@ is moment:%@", buf, 0x16u);
      }

      id v32 = [v10 objectForKeyedSubscript:@"PHRelatedOptionRelationOptionsKey"];
      uint64_t v33 = [v32 unsignedIntegerValue];

      uint64_t v34 = 63;
      if (v33) {
        uint64_t v34 = v33;
      }
      uint64_t v60 = v34;
      uint64_t v35 = [(PHAStorytellingClientRequestHandler *)self graphManager];
      uint64_t v36 = [v35 workingContextForRelated];

      id v63 = v10;
      uint64_t v37 = [objc_alloc(MEMORY[0x1E4F8D8C0]) initWithOptions:v10];
      id v38 = objc_alloc(MEMORY[0x1E4F8D8B8]);
      id v39 = [(PHAStorytellingClientRequestHandler *)self graphManager];
      id v40 = [v39 blockedFeatures];
      uint64_t v62 = (void *)v36;
      __int16 v41 = (void *)[v38 initWithWorkingContext:v36 blockedFeatures:v40];

      id v70 = v23;
      uint64_t v42 = v60;
      long long v59 = v41;
      id v61 = (void *)v37;
      uint64_t v43 = [v41 relatedCollectionsForMoment:v67 relatedType:v42 options:v37 error:&v70];
      id v58 = v70;

      id v11 = v64;
      long long v57 = v43;
      if (v43)
      {
        id v56 = [v43 valueForKey:@"dictionaryRepresentation"];
        uint64_t v44 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        uint64_t v47 = v15;
        uint64_t v48 = v47;
        if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D21F2000, v48, OS_SIGNPOST_INTERVAL_END, v13, "RelatedCollectionsForMomentRequest", " enableTelemetry=YES ", buf, 2u);
        }

        id v9 = v69;
        id v49 = v62;
        id v10 = v63;
        id v50 = v67;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          long long v75 = "RelatedCollectionsForMomentRequest";
          __int16 v76 = 2048;
          double v77 = (float)((float)((float)((float)(v44 - v68) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D21F2000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        uint64_t v51 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          uint64_t v52 = [v56 count];
          *(_DWORD *)buf = 134217984;
          long long v75 = (const char *)v52;
          _os_log_impl(&dword_1D21F2000, v51, OS_LOG_TYPE_INFO, "Related Collections for Moment Reply: resultsCount:%lu", buf, 0xCu);
        }

        id v23 = v58;
        ((void (**)(id, void *, id))v64)[2](v64, v56, v58);
      }
      else
      {
        id v55 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
        id v9 = v69;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          long long v75 = v69;
          _os_log_error_impl(&dword_1D21F2000, v55, OS_LOG_TYPE_ERROR, "Related Collections for Moment Error: Failed to match momentID:%@", buf, 0xCu);
        }

        id v23 = v58;
        v64[2](v64, 0, v58);
        id v49 = v62;
        id v10 = v63;
        id v50 = v67;
      }
    }
    else
    {
      id v49 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
      id v54 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v75 = v69;
        _os_log_error_impl(&dword_1D21F2000, v54, OS_LOG_TYPE_ERROR, "Related Collections for Moment Error: Failed to lookup momentID:%@", buf, 0xCu);
      }

      id v11 = v64;
      v64[2](v64, 0, v49);
      id v50 = 0;
    }

LABEL_36:
    char v21 = v65;
    goto LABEL_37;
  }
  v11[2](v11, 0, v23);
LABEL_37:
}

- (id)relatedRequestPredicateValidator
{
  id v2 = objc_opt_new();
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F291AD20];
  [v2 setAllowedKeyPaths:v3];

  return v2;
}

- (void)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress) {
    [(id)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress cancelOperation];
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F71F20]) initWithProgressBlock:&__block_literal_global_3446];
  objc_storeStrong((id *)&requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress, v9);
  objc_sync_exit(v8);

  id v10 = [(PHAStorytellingClientRequestHandler *)v8 graphManager];
  id v11 = objc_opt_class();
  objc_sync_enter(v11);
  id v23 = 0;
  BOOL v12 = +[PHASharedLibrarySuggestionGenerationTask resetSuggestionsWithGraphManager:v10 error:&v23];
  id v13 = v23;
  if (!v12)
  {
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  if (!PLIsSharedLibrarySuggestionsEnabled())
  {
    uint64_t v14 = 1;
    goto LABEL_16;
  }
  id v22 = 0;
  uint64_t v14 = [v10 isReadyWithError:&v22];
  id v15 = (PHASharedLibrarySuggestionGenerationTask *)v22;
  if (v9 == (void *)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress) {
    char v16 = 0;
  }
  else {
    char v16 = v14;
  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 16);
    id v17 = (PHASharedLibrarySuggestionGenerationTask *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = 0;
LABEL_14:

    id v15 = v17;
    goto LABEL_15;
  }
  if (v14)
  {
    id v18 = [[PHASharedLibrarySuggestionGenerationTask alloc] initWithTaskType:0];
    char v21 = v15;
    uint64_t v14 = [(PHASharedLibrarySuggestionGenerationTask *)v18 runWithGraphManager:v10 progressReporter:v9 error:&v21];
    uint64_t v20 = v18;
    id v17 = v21;

    id v15 = v20;
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  objc_sync_exit(v11);

  uint64_t v19 = v8;
  objc_sync_enter(v19);
  if ((void *)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress == v9)
  {
    requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext_reply__suggestionTaskProgress = 0;
  }
  objc_sync_exit(v19);

  v7[2](v7, v14, v13);
}

- (void)requestCameraSmartSharingProcessingForLibraryScopeWithUUID:(id)a3 withOptions:(id)a4 context:(id)a5 reply:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a6;
  id v10 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v11 = objc_alloc_init(PHACameraSmartSharingTask);
  if (v8)
  {
    BOOL v12 = [MEMORY[0x1E4F39110] localIdentifierWithUUID:v8];
    [(PHACameraSmartSharingTask *)v11 setLibraryScopeLocalIdentifier:v12];
  }
  id v13 = [MEMORY[0x1E4F71F08] ignoreProgress];
  id v18 = 0;
  uint64_t v14 = [(PHACameraSmartSharingTask *)v11 runWithGraphManager:v10 progressReporter:v13 error:&v18];
  id v15 = v18;

  uint64_t v19 = @"result";
  char v16 = [NSNumber numberWithBool:v14];
  v20[0] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];

  v9[2](v9, v17, v15);
}

- (void)requestStartSharedLibrarySuggestionResultWithContext:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, uint64_t, id))a4;
  id v6 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v13 = 0;
  char v7 = [v6 isReadyWithError:&v13];
  id v8 = v13;
  id v9 = v8;
  if (v7)
  {
    id v12 = v8;
    uint64_t v10 = [v6 suggestsToStartSharedLibraryWithError:&v12];
    id v11 = v12;

    v5[2](v5, v10, v11);
    id v9 = v11;
  }
  else
  {
    v5[2](v5, 0, v8);
  }
}

- (void)requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers:(id)a3 withOptions:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, id))a6;
  id v12 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v19 = 0;
  char v13 = [v12 isReadyWithError:&v19];
  id v14 = v19;
  id v15 = v14;
  if (v13)
  {
    id v18 = v14;
    char v16 = [v12 suggestedMomentLocalIdentifiersForPersonLocalIdentifiers:v9 withOptions:v10 error:&v18];
    id v17 = v18;

    v11[2](v11, v16, v17);
    id v15 = v17;
  }
  else
  {
    v11[2](v11, 0, v14);
  }
}

- (void)requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier:(id)a3 withOptions:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t, id))a6;
  id v12 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v19 = 0;
  char v13 = [v12 isReadyWithError:&v19];
  id v14 = v19;
  id v15 = v14;
  if (v13)
  {
    id v18 = v14;
    uint64_t v16 = [v12 generateDefaultRulesForLibraryScopeWithLocalIdentifier:v9 withOptions:v10 error:&v18];
    id v17 = v18;

    v11[2](v11, v16, v17);
    id v15 = v17;
  }
  else
  {
    v11[2](v11, 0, v14);
  }
}

- (void)requestTextFeaturesForMomentLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v13 = 0;
  char v10 = [v9 isReadyWithError:&v13];
  id v11 = v13;
  if (v10)
  {
    id v12 = [v9 textFeaturesForMomentLocalIdentifiers:v7];
    v8[2](v8, v12, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v15 = 0;
  char v10 = [v9 isReadyWithError:&v15];
  id v11 = v15;
  if (v10)
  {
    id v12 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v13 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v7 options:0 photoLibrary:v12];

    id v14 = [v9 sharingMessageSuggestionDebugInformationForAssetCollection:v13];
    v8[2](v8, v14, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v22 = 0;
  char v10 = [v9 isReadyWithError:&v22];
  id v11 = v22;
  if (v10)
  {
    id v12 = (void *)MEMORY[0x1E4F38EE8];
    v25[0] = v7;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    id v14 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v15 = [v14 librarySpecificFetchOptions];
    uint64_t v16 = [v12 fetchAssetCollectionsWithLocalIdentifiers:v13 options:v15];

    id v17 = [v16 firstObject];
    id v18 = v17;
    if (v17 && [v17 assetCollectionType] == 8)
    {
      id v19 = [v9 sharingSuggestionDebugInformationForSuggestion:v18];
      v8[2](v8, v19, 0);
    }
    else
    {
      id v19 = [NSString localizedStringWithFormat:@"No matching asset collection (PHSuggestion) found for local identifier: %@", v7];
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, v19);
      char v21 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v19;
        _os_log_error_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
      }

      ((void (**)(id, void *, void *))v8)[2](v8, 0, v20);
    }
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, id, void))a6;
  id v12 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v28 = 0;
  char v13 = [v12 isReadyWithError:&v28];
  id v14 = v28;
  if (v13)
  {
    id v15 = [v10 objectForKey:@"PHPeopleSuggestionClientKey"];
    uint64_t v16 = v15;
    if (v15) {
      uint64_t v17 = [v15 unsignedIntegerValue];
    }
    else {
      uint64_t v17 = 0;
    }
    id v18 = [MEMORY[0x1E4F8D908] optionsForClient:v17];
    id v19 = [v10 objectForKey:@"PHSuggestedRecipientsSharingStreamKey"];
    uint64_t v20 = v19;
    if (v19) {
      objc_msgSend(v18, "setSharingStream:", objc_msgSend(v19, "unsignedIntegerValue"));
    }
    char v21 = objc_opt_new();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __126__PHAStorytellingClientRequestHandler_Sharing__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_context_reply___block_invoke;
    v24[3] = &unk_1E6917E60;
    id v25 = v12;
    id v26 = v18;
    id v27 = v21;
    id v22 = v21;
    id v23 = v18;
    [v9 enumerateKeysAndObjectsUsingBlock:v24];
    v11[2](v11, v22, 0);
  }
  else
  {
    ((void (**)(id, id, id))v11)[2](v11, 0, v14);
  }
}

void __126__PHAStorytellingClientRequestHandler_Sharing__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_context_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  context = (void *)MEMORY[0x1D26057A0]();
  char v21 = v5;
  id v7 = [MEMORY[0x1E4F38EB8] localIdentifierWithUUID:v5];
  id v8 = [MEMORY[0x1E4F391A0] localIdentifierWithUUID:v6];
  id v9 = *(void **)(a1 + 32);
  v28[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  id v27 = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  id v12 = [v9 suggestedRecipientsForAssetLocalIdentifiers:v10 momentLocalIdentifiers:v11 sharingOptions:*(void *)(a1 + 40)];

  char v13 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [*(id *)(*((void *)&v22 + 1) + 8 * v18) dictionaryRepresentation];
        [v13 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  [*(id *)(a1 + 48) setObject:v13 forKeyedSubscript:v7];
}

- (int64_t)_titleTupleFormatForPhotoAnalysisTitleFormat:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (id)_collectionListForLocalIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v6 = [v5 librarySpecificFetchOptions];

    id v7 = (void *)MEMORY[0x1E4F39008];
    v12[0] = v4;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v9 = [v7 fetchCollectionListsWithLocalIdentifiers:v8 options:v6];

    id v10 = [v9 firstObject];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)requestTitleForPersonLocalIdentifiers:(id)a3 format:(int64_t)a4 context:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = (void (**)(id, void *, void *, id))a6;
  id v11 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v21 = 0;
  char v12 = [v11 isReadyWithError:&v21];
  id v13 = v21;
  if (v12)
  {
    id v20 = v13;
    id v14 = objc_msgSend(v11, "titleTupleForPersonLocalIdentifiers:format:error:", v9, -[PHAStorytellingClientRequestHandler _titleTupleFormatForPhotoAnalysisTitleFormat:](self, "_titleTupleFormatForPhotoAnalysisTitleFormat:", a4), &v20);
    id v15 = v20;

    uint64_t v16 = [v14 title];
    uint64_t v17 = [v16 stringValue];
    uint64_t v18 = [v14 subtitle];
    id v19 = [v18 stringValue];
    v10[2](v10, v17, v19, v15);

    id v13 = v15;
  }
  else
  {
    v10[2](v10, 0, 0, v13);
  }
}

- (void)requestTitleForAssetCollectionWithLocalIdentifier:(id)a3 format:(int64_t)a4 context:(id)a5 reply:(id)a6
{
  id v9 = (void (**)(id, void *, void *, id))a6;
  id v10 = a3;
  id v11 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  char v12 = +[PHAStorytellingClientRequestUtils assetCollectionForLocalIdentifier:v10 options:0 photoLibrary:v11];

  int64_t v13 = [(PHAStorytellingClientRequestHandler *)self _titleTupleFormatForPhotoAnalysisTitleFormat:a4];
  id v14 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v21 = 0;
  id v15 = [v14 titleTupleForAssetCollection:v12 format:v13 error:&v21];
  id v16 = v21;

  uint64_t v17 = [v15 title];
  uint64_t v18 = [v17 stringValue];
  id v19 = [v15 subtitle];
  id v20 = [v19 stringValue];
  v9[2](v9, v18, v20, v16);
}

- (void)requestTitleForCollectionMomentListWithLocalIdentifier:(id)a3 format:(int64_t)a4 context:(id)a5 reply:(id)a6
{
  id v9 = (void (**)(id, void *, void *, id))a6;
  id v10 = [(PHAStorytellingClientRequestHandler *)self _collectionListForLocalIdentifier:a3];
  int64_t v11 = [(PHAStorytellingClientRequestHandler *)self _titleTupleFormatForPhotoAnalysisTitleFormat:a4];
  char v12 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v19 = 0;
  int64_t v13 = [v12 titleTupleForMomentList:v10 format:v11 error:&v19];
  id v14 = v19;

  id v15 = [v13 title];
  id v16 = [v15 stringValue];
  uint64_t v17 = [v13 subtitle];
  uint64_t v18 = [v17 stringValue];
  v9[2](v9, v16, v18, v14);
}

- (void)reloadAlbumWidgetTimelineWithContext:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, BOOL, id))a4;
  id v6 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  id v9 = 0;
  BOOL v7 = +[PHAMemoryElectionTask reloadAlbumWidgetTimelineWithLoggingConnection:v6 error:&v9];
  id v8 = v9;

  v5[2](v5, v7, v8);
}

- (void)reloadForYouWidgetTimelineWithContext:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, BOOL, id))a4;
  if (PLIsFeaturedContentAllowed())
  {
    id v6 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    BOOL v7 = [v6 workingContext];
    id v8 = [v7 photoLibrary];

    id v9 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    +[PHAMemoryElectionTask findAndSetFeaturedStateForMemoriesAndSuggestionsIfNeededInPhotoLibrary:v8 loggingConnection:v9];
  }
  else
  {
    id v10 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_INFO, "Featured content is disabled when reloading widget", buf, 2u);
    }
  }
  int64_t v11 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
  id v14 = 0;
  BOOL v12 = +[PHAMemoryElectionTask reloadForYouWidgetTimelineWithLoggingConnection:v11 error:&v14];
  id v13 = v14;

  v5[2](v5, v12, v13);
}

- (void)requestCurationOfLength:(unint64_t)a3 forMemoryForLocalIdentifier:(id)a4 withOptions:(id)a5 context:(id)a6 reply:(id)a7
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, void))a7;
  id v14 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v15 = [v14 librarySpecificFetchOptions];

  [v15 setFetchLimit:1];
  [v15 setIncludePendingMemories:1];
  [v15 setIncludeRejectedMemories:1];
  [v15 setIncludeLocalMemories:1];
  [v15 setIncludeStoryMemories:1];
  id v16 = objc_alloc(MEMORY[0x1E4F8E768]);
  uint64_t v17 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  uint64_t v18 = (void *)[v16 initWithPhotoLibrary:v17];

  id v19 = (void *)MEMORY[0x1E4F38EE8];
  v28[0] = v11;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  id v21 = [v19 fetchAssetCollectionsWithLocalIdentifiers:v20 options:v15];
  long long v22 = [v21 firstObject];

  if (v22)
  {
    long long v23 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F39790]];
    [v23 doubleValue];
    double v25 = v24;

    id v26 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    id v27 = [v26 curationOfLength:a3 forMemory:v22 customDuration:1 useAssetEligibility:v18 curationContext:v25];

    v13[2](v13, v27, 0);
  }
  else
  {
    id v27 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
    ((void (**)(id, void *, void *))v13)[2](v13, 0, v27);
  }
}

- (void)requestMemoryDebugInformationForMemoryWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v32 = 0;
  char v10 = [v9 isReadyWithError:&v32];
  id v11 = v32;
  if (v10)
  {
    id v12 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    id v13 = [v12 librarySpecificFetchOptions];
    id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier == %@", v7];
    [v13 setPredicate:v14];

    [v13 setIncludePendingMemories:1];
    id v15 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v13];
    id v16 = [v15 firstObject];
    if (v16)
    {
      id v28 = v15;
      id v29 = v12;
      id v30 = v11;
      id v31 = v7;
      uint64_t v17 = [v12 librarySpecificFetchOptions];
      uint64_t v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
      v33[0] = v18;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      [v17 setSortDescriptors:v19];

      id v27 = [MEMORY[0x1E4F38EE8] fetchMomentsBackingMemory:v16 options:v17];
      id v20 = [v27 fetchedObjects];
      id v21 = [v16 photosGraphProperties];
      long long v22 = v21;
      if (v21)
      {
        long long v23 = [v21 objectForKeyedSubscript:@"info"];
        double v24 = [v23 objectForKeyedSubscript:@"meaningLabels"];
      }
      else
      {
        double v24 = 0;
      }
      double v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v24];
      id v26 = [v9 memoryDebugInformationWithMoments:v20 meaningLabels:v25];

      v8[2](v8, v26, 0);
      id v11 = v30;
      id v7 = v31;
      id v15 = v28;
      id v12 = v29;
    }
    else
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 5);
      ((void (**)(id, void *, void *))v8)[2](v8, 0, v17);
    }
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (unint64_t)_validatedMemoryNotificationState:(int)a3
{
  if (a3 >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void)simulateMemoriesNotificationWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v53 = a4;
  id v58 = a5;
  id v55 = self;
  id v54 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v8 = [v54 librarySpecificFetchOptions];
  id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v74[0] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
  [v8 setSortDescriptors:v10];

  [v8 setIncludePendingMemories:0];
  [v8 setIncludeRejectedMemories:0];
  id v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v8];
  id v12 = objc_opt_new();
  id v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v66 != v18) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        id v21 = [v20 creationDate];
        if (!v17)
        {
          uint64_t v17 = [v13 startOfDayForDate:v21];
        }
        if ([v17 compare:v21] != 1) {
          [v12 addObject:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v16);
  }
  else
  {
    uint64_t v17 = 0;
  }

  if ([v12 count])
  {
    uint64_t v52 = [v12 firstObject];
    long long v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    long long v23 = [v22 objectForKey:@"PhotoAnalysisNotificationSimulationDelayOverride"];

    double v24 = v57;
    double v25 = v58;
    uint64_t v51 = v23;
    if (v23)
    {
      [v23 doubleValue];
      double v27 = v26;
      id v28 = v55;
      id v29 = [(PHAStorytellingClientRequestHandler *)v55 loggingConnection];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        double v70 = v27;
        __int16 v71 = 2112;
        id v72 = @"PhotoAnalysisNotificationSimulationDelayOverride";
        _os_log_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_INFO, "[Memories Notification] Simulation: overriding notification delay with time interval %.2f because of user defaults %@", buf, 0x16u);
      }

      int64_t v30 = (uint64_t)(v27 * 1000000000.0);
    }
    else
    {
      int64_t v30 = 5000000000;
      id v28 = v55;
    }
    id v50 = v8;
    if (!v57)
    {
      uint64_t v42 = 1;
LABEL_31:
      dispatch_time_t v43 = dispatch_time(0, v30);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __101__PHAStorytellingClientRequestHandler_Memory__simulateMemoriesNotificationWithOptions_context_reply___block_invoke;
      block[3] = &unk_1E6918008;
      id v32 = v54;
      id v60 = v54;
      id v61 = v52;
      uint64_t v64 = v42;
      uint64_t v62 = v55;
      id v63 = v25;
      id v44 = v52;
      dispatch_after(v43, MEMORY[0x1E4F14428], block);

      id v8 = v50;
      id v31 = v51;
      goto LABEL_32;
    }
    uint64_t v33 = [v57 objectForKey:@"notificationState"];
    uint64_t v49 = [(PHAStorytellingClientRequestHandler *)v28 _validatedMemoryNotificationState:[(PHANotificationController *)v33 intValue]];
    uint64_t v34 = [v57 objectForKeyedSubscript:@"checkEligibility"];
    if (!v34) {
      goto LABEL_27;
    }
    uint64_t v35 = v34;
    int v36 = [v34 BOOLValue];

    if (!v36)
    {
      double v24 = v57;
      goto LABEL_30;
    }
    int64_t v48 = v30;
    uint64_t v37 = [PHANotificationController alloc];
    id v38 = [(PHAStorytellingClientRequestHandler *)v28 graphManager];
    uint64_t v33 = [(PHANotificationController *)v37 initWithGraphManager:v38];

    id v39 = (void *)[objc_alloc(MEMORY[0x1E4F39338]) initWithPhotoLibrary:v54];
    id v40 = [v52 blockableFeatures];
    BOOL v41 = [(PHANotificationController *)v33 userFeedbackScoreIsAcceptableForAssetCollection:v52 memoryFeatures:v40 userFeedbackCalculator:v39];

    if (v41)
    {

      double v24 = v57;
      int64_t v30 = v48;
LABEL_27:

LABEL_30:
      double v25 = v58;
      uint64_t v42 = v49;
      goto LABEL_31;
    }
    id v56 = v39;
    id v45 = [(PHAStorytellingClientRequestHandler *)v28 loggingConnection];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      uint64_t v46 = [v52 localIdentifier];
      *(_DWORD *)buf = 138412290;
      double v70 = *(double *)&v46;
      _os_log_impl(&dword_1D21F2000, v45, OS_LOG_TYPE_INFO, "[Memories Notification] Not firing notification for memory %@: user feedback score is lower than acceptable.", buf, 0xCu);
    }
    uint64_t v47 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 16, @"Latest memory is not eligible for notification");
    double v25 = v58;
    (*((void (**)(id, void, void *))v58 + 2))(v58, 0, v47);

    id v31 = v52;
  }
  else
  {
    id v31 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 5, @"No memories are available for simulating notification");
    double v25 = v58;
    (*((void (**)(id, void, void *))v58 + 2))(v58, 0, v31);
  }
  double v24 = v57;
  id v32 = v54;
LABEL_32:
}

void __101__PHAStorytellingClientRequestHandler_Memory__simulateMemoriesNotificationWithOptions_context_reply___block_invoke(uint64_t a1)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__PHAStorytellingClientRequestHandler_Memory__simulateMemoriesNotificationWithOptions_context_reply___block_invoke_2;
  v10[3] = &unk_1E6917FE0;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v11 = v3;
  uint64_t v12 = v4;
  id v9 = 0;
  [v2 performChangesAndWait:v10 error:&v9];
  id v5 = v9;
  if (*(void *)(a1 + 64) == 1)
  {
    id v6 = [PHANotificationController alloc];
    id v7 = [*(id *)(a1 + 48) graphManager];
    id v8 = [(PHANotificationController *)v6 initWithGraphManager:v7];

    [(PHANotificationController *)v8 postNotificationForMemory:*(void *)(a1 + 40) withCreationReason:0 forceImmediateDelivery:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __101__PHAStorytellingClientRequestHandler_Memory__simulateMemoriesNotificationWithOptions_context_reply___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39170] changeRequestForMemory:*(void *)(a1 + 32)];
  [v2 setNotificationState:*(void *)(a1 + 40)];
}

- (void)requestMeaningScoreDebugDescriptionForMomentLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id, void))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v22 = 0;
  char v10 = [v9 isReadyWithError:&v22];
  id v11 = v22;

  if (v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F8D3D0]);
    id v14 = [(PHAStorytellingClientRequestHandler *)self graphManager];
    uint64_t v15 = [v14 workingContext];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke;
    v18[3] = &unk_1E6918518;
    id v19 = v7;
    id v20 = v12;
    id v21 = v13;
    id v16 = v13;
    id v17 = v12;
    [v15 performSynchronousConcurrentGraphReadUsingBlock:v18];

    v8[2](v8, v17, 0);
  }
  else
  {
    ((void (**)(id, id, id))v8)[2](v8, 0, v11);
  }
}

void __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 graph];
  id v5 = (void *)MEMORY[0x1E4F8D6A8];
  id v6 = [MEMORY[0x1E4F391A0] uuidFromLocalIdentifier:*(void *)(a1 + 32)];
  id v7 = [v5 momentNodeForUUID:v6 inGraph:v4];
  id v8 = [v7 anyNode];

  [*(id *)(a1 + 40) appendString:@"Meaning Edges"];
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v9 = (unsigned __int16)*MEMORY[0x1E4F8DB98];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke_2;
  void v22[3] = &unk_1E69184F0;
  id v23 = *(id *)(a1 + 48);
  id v24 = *(id *)(a1 + 40);
  double v25 = &v26;
  [v8 enumerateMeaningEdgesAndNodesWithDomain:v9 block:v22];
  if (!*((unsigned char *)v27 + 24)) {
    [*(id *)(a1 + 40) appendString:@"\n    None"];
  }
  [*(id *)(a1 + 40) appendString:@"\n\nAlternative Meaning Edges"];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v10 = (unsigned __int16)*MEMORY[0x1E4F8DB90];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke_3;
  id v14 = &unk_1E69184F0;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 40);
  id v17 = &v18;
  [v8 enumerateMeaningEdgesAndNodesWithDomain:v10 block:&v11];
  if (!*((unsigned char *)v19 + 24)) {
    objc_msgSend(*(id *)(a1 + 40), "appendString:", @"\n    None", v11, v12, v13, v14, v15);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v26, 8);
}

void __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[PHAStorytellingClientRequestHandler _descriptionForMeaningNode:a3 meaningEdge:a2 configuration:*(void *)(a1 + 32)];
  uint64_t v4 = [NSString stringWithFormat:@"\n    %@", v5];
  [*(id *)(a1 + 40) appendString:v4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __124__PHAStorytellingClientRequestHandler_Prototype__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_context_reply___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[PHAStorytellingClientRequestHandler _descriptionForMeaningNode:a3 meaningEdge:a2 configuration:*(void *)(a1 + 32)];
  uint64_t v4 = [NSString stringWithFormat:@"\n    %@", v5];
  [*(id *)(a1 + 40) appendString:v4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

- (id)_asssetLocalIdentifiersByCityNameForKeyAssetOnly:(BOOL)a3
{
  id v3 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6555;
  id v15 = __Block_byref_object_dispose__6556;
  id v16 = 0;
  uint64_t v4 = [v3 workingContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__PHAStorytellingClientRequestHandler_Prototype___asssetLocalIdentifiersByCityNameForKeyAssetOnly___block_invoke;
  v8[3] = &unk_1E69184C8;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = &v11;
  [v4 performSynchronousConcurrentGraphReadUsingBlock:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __99__PHAStorytellingClientRequestHandler_Prototype___asssetLocalIdentifiersByCityNameForKeyAssetOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 graph];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 interestingCityNodes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__PHAStorytellingClientRequestHandler_Prototype___asssetLocalIdentifiersByCityNameForKeyAssetOnly___block_invoke_2;
  v10[3] = &unk_1E69184A0;
  id v11 = *(id *)(a1 + 32);
  id v6 = v4;
  id v12 = v6;
  [v5 enumerateIdentifiersAsCollectionsWithBlock:v10];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  id v9 = v6;
}

void __99__PHAStorytellingClientRequestHandler_Prototype___asssetLocalIdentifiersByCityNameForKeyAssetOnly___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = [v4 momentNodes];
  id v9 = [v8 uuids];
  uint64_t v10 = [v7 predicateWithFormat:@"uuid in %@", v9];
  [v6 setInternalPredicate:v10];

  uint64_t v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:3 subtype:0x7FFFFFFFFFFFFFFFLL options:v6];
  id v12 = [*(id *)(a1 + 32) photoLibrary];
  uint64_t v13 = [v12 librarySpecificFetchOptions];

  id v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:0];
  v34[0] = v14;
  id v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v34[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  [v13 setInternalSortDescriptors:v16];

  uint64_t v28 = (void *)v11;
  id v17 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollections:v11 options:v13];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [*(id *)(*((void *)&v29 + 1) + 8 * v23) localIdentifier];
        [v18 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v21);
  }

  double v25 = *(void **)(a1 + 40);
  uint64_t v26 = [v4 names];
  double v27 = [v26 firstObject];
  [v25 setObject:v18 forKeyedSubscript:v27];
}

- (void)requestAssetLocalIdentifiersByCityNameWithContext:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, void *, void))a4;
  id v6 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v10 = 0;
  char v7 = [v6 isReadyWithError:&v10];
  id v8 = v10;
  if (v7)
  {
    id v9 = [(PHAStorytellingClientRequestHandler *)self _asssetLocalIdentifiersByCityNameForKeyAssetOnly:0];
    v5[2](v5, v9, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v5)[2](v5, 0, v8);
  }
}

- (void)requestConfidenceByMomentLocalIdentifierForMeaning:(id)a3 useAlternativeMeaningEdge:(BOOL)a4 onlyHighPrecision:(BOOL)a5 context:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = (void (**)(id, uint64_t, void))a7;
  id v15 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v30 = 0;
  char v16 = [v15 isReadyWithError:&v30];
  id v17 = v30;
  if (v16)
  {
    uint64_t v24 = 0;
    double v25 = &v24;
    uint64_t v26 = 0x3032000000;
    double v27 = __Block_byref_object_copy__6555;
    uint64_t v28 = __Block_byref_object_dispose__6556;
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v18 = [v15 workingContext];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke;
    void v19[3] = &unk_1E6918478;
    BOOL v22 = a5;
    id v20 = v12;
    uint64_t v21 = &v24;
    BOOL v23 = a4;
    [v18 performSynchronousConcurrentGraphReadUsingBlock:v19];

    v14[2](v14, v25[5], 0);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    ((void (**)(id, uint64_t, id))v14)[2](v14, 0, v17);
  }
}

void __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  id v4 = (void *)MEMORY[0x1E4F8D678];
  v9[0] = *(void *)(a1 + 32);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v6 = [v4 meaningNodesWithMeaningLabels:v5 inGraph:v3];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke_2;
  v7[3] = &unk_1E6918450;
  __int16 v8 = *(_WORD *)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  [v6 enumerateNodesUsingBlock:v7];
}

void __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  char v7 = __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke_3;
  __int16 v8 = &unk_1E6918428;
  LOBYTE(v10) = *(unsigned char *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = _Block_copy(&v5);
  if (*(unsigned char *)(a1 + 41)) {
    objc_msgSend(v3, "enumerateMomentAlternativeEdgesAndNodesUsingBlock:", v4, v5, v6, v7, v8, v9, v10);
  }
  else {
    objc_msgSend(v3, "enumerateMomentEdgesAndNodesUsingBlock:", v4, v5, v6, v7, v8, v9, v10);
  }
}

void __159__PHAStorytellingClientRequestHandler_Prototype__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_context_reply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (!*(unsigned char *)(a1 + 40) || [v10 isHighPrecision])
  {
    uint64_t v6 = NSNumber;
    [v10 confidence];
    char v7 = objc_msgSend(v6, "numberWithDouble:");
    __int16 v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v9 = [v5 localIdentifier];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
}

- (id)_utilityAssetLocalIdentifiersForKeyAssetOnly:(BOOL)a3
{
  BOOL v54 = a3;
  v72[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v4 = [v3 photoLibrary];
  id v5 = [v4 librarySpecificFetchOptions];

  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:0];
  v72[0] = v6;
  char v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v72[1] = v7;
  __int16 v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
  [v5 setInternalSortDescriptors:v8];

  uint64_t v9 = *MEMORY[0x1E4F394E0];
  v71[0] = *MEMORY[0x1E4F39538];
  v71[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  [v5 setFetchPropertySets:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F1C978]);
  dispatch_time_t v43 = v5;
  id v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v5];
  id v13 = [v12 fetchedObjects];
  id v14 = (void *)[v11 initWithArray:v13];

  id v42 = objc_alloc_init(MEMORY[0x1E4F8E778]);
  [v42 prepareAssets:v14];
  [MEMORY[0x1E4F38EB8] prefetchScenesOnAssets:v14];
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v14;
  uint64_t v53 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v64;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v64 != v52) {
          objc_enumerationMutation(obj);
        }
        char v16 = *(void **)(*((void *)&v63 + 1) + 8 * v15);
        id v17 = objc_msgSend(v16, "curationModel", v41);
        id v18 = [v17 sceneModel];
        id v19 = [v16 sceneClassifications];
        id v56 = [v18 sceneNamesFromSceneClassifications:v19 passingThresholdOfType:2];

        id v20 = [v16 curationModel];
        LODWORD(v19) = [v20 isMemeExclusiveWithAsset:v16];

        if (v19)
        {
          uint64_t v21 = [v16 localIdentifier];
          [v49 addObject:v21];
        }
        uint64_t v55 = v15;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v57 = [v16 sceneClassifications];
        uint64_t v22 = [v57 countByEnumeratingWithState:&v59 objects:v69 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          char v24 = 0;
          char v25 = 0;
          uint64_t v58 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v60 != v58) {
                objc_enumerationMutation(v57);
              }
              uint64_t v27 = *(void *)(*((void *)&v59 + 1) + 8 * i);
              [v16 curationModel];
              v29 = uint64_t v28 = v16;
              id v30 = [v29 junkClassificationModel];
              long long v31 = [v30 receiptOrDocumentNode];
              char v32 = [v31 passesHighPrecisionWithSignal:v27];

              char v16 = v28;
              v25 |= v32;
              uint64_t v33 = [v28 curationModel];
              uint64_t v34 = [v33 junkClassificationModel];
              uint64_t v35 = [v34 screenshotNode];
              LOBYTE(v27) = [v35 passesHighPrecisionWithSignal:v27];

              v24 |= v27;
            }
            uint64_t v23 = [v57 countByEnumeratingWithState:&v59 objects:v69 count:16];
          }
          while (v23);
        }
        else
        {
          char v24 = 0;
          char v25 = 0;
        }

        if (([v56 containsObject:@"whiteboard"] & 1) != 0
          || [v56 containsObject:@"chalkboard"])
        {
          int v36 = [v16 localIdentifier];
          uint64_t v37 = v51;
          goto LABEL_20;
        }
        if (([v56 containsObject:@"ticket"] & 1) != 0
          || [v56 containsObject:@"coupon"])
        {
          int v36 = [v16 localIdentifier];
          uint64_t v37 = v48;
          goto LABEL_20;
        }
        if ([v56 containsObject:@"menu"])
        {
          int v36 = [v16 localIdentifier];
          uint64_t v37 = v47;
          goto LABEL_20;
        }
        if ([v56 containsObject:@"recipe"])
        {
          int v36 = [v16 localIdentifier];
          uint64_t v37 = v46;
          goto LABEL_20;
        }
        if (v24)
        {
          int v36 = [v16 localIdentifier];
          uint64_t v37 = v45;
          goto LABEL_20;
        }
        if (v25)
        {
          int v36 = [v16 localIdentifier];
          uint64_t v37 = v44;
LABEL_20:
          [v37 addObject:v36];

          if (v54) {
            goto LABEL_38;
          }
          goto LABEL_21;
        }
        if (v54)
        {
LABEL_38:

          goto LABEL_39;
        }
LABEL_21:

        uint64_t v15 = v55 + 1;
      }
      while (v55 + 1 != v53);
      uint64_t v38 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
      uint64_t v53 = v38;
    }
    while (v38);
  }
LABEL_39:

  v67[0] = @"receipt";
  v67[1] = @"document";
  v68[0] = v41;
  v68[1] = v44;
  v67[2] = @"whiteboard";
  void v67[3] = @"screenCapture";
  v68[2] = v51;
  v68[3] = v45;
  v67[4] = @"ticket";
  v67[5] = @"menu";
  v68[4] = v48;
  v68[5] = v47;
  v67[6] = @"receipe";
  v67[7] = @"meme";
  v68[6] = v46;
  v68[7] = v49;
  id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:8];

  return v39;
}

- (void)requestUtilityAssetLocalIdentifiersWithContext:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [(PHAStorytellingClientRequestHandler *)self _utilityAssetLocalIdentifiersForKeyAssetOnly:0];
  (*((void (**)(id, id, void))a4 + 2))(v6, v7, 0);
}

- (void)requestTrendsByIdentifierWithCadence:(id)a3 forYear:(unint64_t)a4 context:(id)a5 reply:(id)a6
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = [v10 isEqualToString:@"daily"];
  if (a4 == 2022 || v13)
  {
    id v36 = v12;
    id v37 = v11;
    id v38 = v10;
    id v14 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
    uint64_t v15 = [v14 librarySpecificFetchOptions];

    v45[0] = *MEMORY[0x1E4F394A8];
    char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    [v15 setFetchPropertySets:v16];

    id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    id v44 = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    [v15 setSortDescriptors:v18];

    [v15 setFetchLimit:250];
    uint64_t v35 = v15;
    id v19 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v15];
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v22 = v19;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v40;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v40 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v39 + 1) + 8 * v26);
          if ((unint64_t)[v21 count] > 0x18)
          {
            id v29 = [MEMORY[0x1E4F29128] UUID];
            id v30 = [v29 UUIDString];
            [v20 setObject:v21 forKeyedSubscript:v30];

            long long v31 = (void *)MEMORY[0x1E4F1CA48];
            uint64_t v28 = [v27 localIdentifier];
            uint64_t v32 = [v31 arrayWithObject:v28];

            id v21 = (id)v32;
          }
          else
          {
            uint64_t v28 = [v27 localIdentifier];
            [v21 addObject:v28];
          }

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v24);
    }

    if ([v21 count])
    {
      uint64_t v33 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v34 = [v33 UUIDString];
      [v20 setObject:v21 forKeyedSubscript:v34];
    }
    id v12 = v36;
    (*((void (**)(id, id, void))v36 + 2))(v36, v20, 0);

    id v11 = v37;
    id v10 = v38;
  }
  else
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, MEMORY[0x1E4F1CC08], 0);
  }
}

- (void)requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, id, void))a5;
  id v7 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  __int16 v8 = [v7 librarySpecificFetchOptions];

  v26[0] = *MEMORY[0x1E4F394A8];
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v8 setFetchPropertySets:v9];

  id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  uint64_t v25 = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [v8 setSortDescriptors:v11];

  [v8 setFetchLimit:10];
  id v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v8];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v18), "localIdentifier", (void)v20);
        [v13 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }

  v6[2](v6, v13, 0);
}

- (void)requestKeyAssetLocalIdentifierForPrototypeCategory:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  __int16 v8 = (void (**)(id, void, void *))a5;
  if ([v7 isEqualToString:@"Utility"])
  {
    uint64_t v9 = [(PHAStorytellingClientRequestHandler *)self _utilityAssetLocalIdentifiersForKeyAssetOnly:1];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = [v9 allValues];
    id v11 = (void *)[v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
        if ([v14 count]) {
          break;
        }
        if (v11 == (void *)++v13)
        {
          id v11 = (void *)[v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_22;
        }
      }
LABEL_21:
      id v11 = [v14 firstObject];
    }
  }
  else
  {
    if (![v7 isEqualToString:@"Places"])
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = [NSString stringWithFormat:@"%s does not support category: %@", "-[PHAStorytellingClientRequestHandler(Prototype) requestKeyAssetLocalIdentifierForPrototypeCategory:context:reply:]", v7];
      id v19 = objc_msgSend(v17, "pl_analysisErrorWithCode:localizedDescription:", 2, v18);
      v8[2](v8, 0, v19);

      id v11 = 0;
      goto LABEL_24;
    }
    uint64_t v9 = [(PHAStorytellingClientRequestHandler *)self _asssetLocalIdentifiersByCityNameForKeyAssetOnly:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = [v9 allValues];
    id v11 = (void *)[v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v11)
    {
      uint64_t v15 = *(void *)v21;
LABEL_14:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
        if ([v14 count]) {
          goto LABEL_21;
        }
        if (v11 == (void *)++v16)
        {
          id v11 = (void *)[v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v11) {
            goto LABEL_14;
          }
          break;
        }
      }
    }
  }
LABEL_22:

LABEL_24:
  ((void (**)(id, void *, void *))v8)[2](v8, v11, 0);
}

+ (BOOL)_isMeaningInferenceFromEventLabelingModel:(id)a3 meaningEdgeDomain:(unsigned __int16)a4 configuration:(id)a5
{
  int v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F8D3D0] isEventLabelingEnabled])
  {
    if ([MEMORY[0x1E4F8D3D0] usePrimaryMeaningDomainForEventLabelingMeanings])
    {
      uint64_t v9 = [v8 meaningLabelsForEventLabeling];
      char v10 = [v9 containsObject:v7];
      if ((unsigned __int16)*MEMORY[0x1E4F8DB98] == v6) {
        BOOL v11 = v10;
      }
      else {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = (unsigned __int16)*MEMORY[0x1E4F8DB90] == v6;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)_descriptionForMeaningNode:(id)a3 meaningEdge:(id)a4 configuration:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [a3 label];
  [v8 confidence];
  uint64_t v11 = v10;
  uint64_t v12 = [v8 domain];

  if (+[PHAStorytellingClientRequestHandler _isMeaningInferenceFromEventLabelingModel:v9 meaningEdgeDomain:v12 configuration:v7])
  {
    [v7 highPrecisionThresholdForMeaningLabel:v9];
    uint64_t v14 = v13;
    [v7 highRecallThresholdForMeaningLabel:v9];
    uint64_t v16 = @"🌅";
  }
  else
  {
    uint64_t v16 = @"🏙";
    uint64_t v15 = 0;
    uint64_t v14 = 0x3FE51EB851EB851FLL;
  }
  uint64_t v17 = [NSString stringWithFormat:@"%@ %@ (conf: %.2f, p: %.2f, r: %.2f)", v16, v9, v11, v14, v15];

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicRequestQueue, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_progressReporterByQueryID, 0);

  objc_storeStrong((id *)&self->_executionQueue, 0);
}

- (OS_dispatch_queue)musicRequestQueue
{
  return self->_musicRequestQueue;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PGManager)graphManager
{
  return self->_graphManager;
}

- (BOOL)validateSelector:(SEL)a3 forConnection:(id)a4
{
  if (sel_requestGraphInferencesSummaryWithMomentLocalIdentifiers_context_reply_ != a3
    && sel_requestGraphMomentLocalIdentifiersWithDateInterval_context_reply_ != a3
    && sel_requestGraphInferencesSummaryWithDateInterval_context_reply_ != a3
    && sel_requestCurationScoreByAssetUUIDForAssetUUIDs_context_reply_ != a3)
  {
    return 1;
  }
  id v7 = [a4 valueForEntitlement:@"com.apple.private.photos.storytelling.inferenceSummary"];
  id v8 = v7;
  BOOL v9 = v7 && ([v7 BOOLValue] & 1) != 0;

  return v9;
}

- (BOOL)validateOperation:(id)a3 forConnection:(id)a4
{
  id v6 = a4;
  id v7 = [a3 invocation];
  uint64_t v8 = [v7 selector];

  LOBYTE(v7) = [(PHAStorytellingClientRequestHandler *)self validateSelector:v8 forConnection:v6];
  return (char)v7;
}

- (void)handleOperation:(id)a3
{
  id v4 = a3;
  executionQueue = self->_executionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PHAStorytellingClientRequestHandler_handleOperation___block_invoke;
  v7[3] = &unk_1E69189B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(executionQueue, v7);
}

uint64_t __55__PHAStorytellingClientRequestHandler_handleOperation___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = v2;
    id v5 = [v3 invocation];
    qos_class_t v6 = qos_class_self();
    id v7 = PHADescriptionForQoS(v6);
    int v9 = 138412546;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D21F2000, v4, OS_LOG_TYPE_DEFAULT, "Running task '%@' at QoS %@", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(a1 + 40) runOperation];
}

- (PHAStorytellingClientRequestHandler)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PHAStorytellingClientRequestHandler;
  qos_class_t v6 = [(PHAStorytellingClientRequestHandler *)&v23 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    id v8 = [(PGManager *)v7->_graphManager workingContext];
    uint64_t v9 = [v8 photoLibrary];
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v9;

    __int16 v11 = MEMORY[0x1E4F14430];
    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.photoanalysisd.storytellinghandler", v12);
    executionQueue = v7->_executionQueue;
    v7->_executionQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    progressReporterByQueryID = v7->_progressReporterByQueryID;
    v7->_progressReporterByQueryID = v15;

    os_log_t v17 = os_log_create("com.apple.photoanalysisd", "clientqueryhandler");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v17;

    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.photoanalysisd.storytellinghandler.music", v19);
    musicRequestQueue = v7->_musicRequestQueue;
    v7->_musicRequestQueue = (OS_dispatch_queue *)v20;
  }
  return v7;
}

- (void)runModelInferenceForFingerprintVersion:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
}

- (void)runShadowEvaluationWithRecipe:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 context:(id)a8 resultBlock:(id)a9
{
  uint64_t v15 = (void (**)(id, id))a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  long long v21 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  long long v22 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v27 = 0;
  objc_super v23 = +[PHACurareShadowEvaluationRecipeDecoder decodeRecipeUserInfo:v20 models:v19 photoLibrary:v21 graphManager:v22 trialDeploymentID:v18 trialExperimentID:v17 trialTreatmentID:v16 decodingError:&v27];

  id v24 = v27;
  id v26 = v24;
  [v23 runWithError:&v26];
  id v25 = v26;

  v15[2](v15, v25);
}

- (void)requestRunPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 context:(id)a5 resultBlock:(id)a6
{
  uint64_t v9 = (void (**)(id, void *, void *, id))a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  dispatch_queue_t v13 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v26 = 0;
  uint64_t v14 = +[PHAPrivateFederatedLearningRecipeDecoder decodeRecipeUserInfo:v10 attachmentURLs:v11 photoLibrary:v12 graphManager:v13 decodingError:&v26];

  id v15 = v26;
  id v16 = [v14 options];
  id v17 = [v16 learningFramework];
  LODWORD(v10) = [v17 isEqualToString:@"coreML"];

  if (v10)
  {
    id v25 = v15;
    id v18 = &v25;
    uint64_t v19 = [v14 runCoreMLModelWithError:&v25];
  }
  else
  {
    id v24 = v15;
    id v18 = &v24;
    uint64_t v19 = [v14 runWithError:&v24];
  }
  id v20 = (void *)v19;
  id v21 = *v18;

  long long v22 = [v20 dataPackage];
  objc_super v23 = [v20 trainingMetrics];
  v9[2](v9, v22, v23, v21);
}

- (void)recordFeatureUsageFromCounts:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = (void (**)(id, uint64_t, id))a5;
  id v8 = a3;
  uint64_t v9 = objc_alloc_init(PHAFeaturesUsageReportingTask);
  id v10 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v11 = [v10 workingContext];

  uint64_t v12 = [v11 photoLibrary];
  dispatch_queue_t v13 = [v11 loggingConnection];
  id v16 = 0;
  uint64_t v14 = [(PHAFeaturesUsageReportingTask *)v9 recordFeatureUsageFromCounts:v8 forPhotoLibrary:v12 loggingConnection:v13 error:&v16];

  id v15 = v16;
  v7[2](v7, v14, v15);
}

- (void)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a5;
  uint64_t v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v17 = 0;
  char v10 = [v9 isReadyWithError:&v17];
  id v11 = v17;
  uint64_t v12 = v11;
  if (v10)
  {
    id v16 = v11;
    dispatch_queue_t v13 = [v9 requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:v7 error:&v16];
    id v14 = v16;

    if (v14)
    {
      id v15 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v14;
        _os_log_error_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_ERROR, "Up Next Memories Generation Error:%{public}@", buf, 0xCu);
      }
    }
    v8[2](v8, v13, v14);
  }
  else
  {
    v8[2](v8, 0, v11);
    id v14 = v12;
  }
}

- (void)requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *, id))a5;
  uint64_t v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v17 = 0;
  char v10 = [v9 isReadyWithError:&v17];
  id v11 = v17;
  uint64_t v12 = v11;
  if (v10)
  {
    id v16 = v11;
    dispatch_queue_t v13 = [v9 requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:v7 error:&v16];
    id v14 = v16;

    if (v14)
    {
      id v15 = [(PHAStorytellingClientRequestHandler *)self loggingConnection];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v14;
        _os_log_error_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_ERROR, "Up Next Memories Generation Error:%{public}@", buf, 0xCu);
      }
    }
    v8[2](v8, v13, v14);
  }
  else
  {
    v8[2](v8, 0, v11);
    id v14 = v12;
  }
}

- (void)requestSetDefaultsObject:(id)a3 forKey:(id)a4 context:(id)a5 reply:(id)a6
{
  id v13 = a6;
  id v8 = (void *)MEMORY[0x1E4F1CB18];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 standardUserDefaults];
  [v11 setObject:v10 forKey:v9];

  uint64_t v12 = v13;
  if (v13)
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
    uint64_t v12 = v13;
  }
}

- (void)requestDefaultsObjectForKey:(id)a3 context:(id)a4 reply:(id)a5
{
  id v10 = (void (**)(id, void *, void))a5;
  qos_class_t v6 = (void *)MEMORY[0x1E4F1CB18];
  id v7 = a3;
  id v8 = [v6 standardUserDefaults];
  id v9 = [v8 objectForKey:v7];

  if (v10) {
    v10[2](v10, v9, 0);
  }
}

- (void)exportWallpaperForAssets:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t, id))a6;
  uint64_t v12 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  id v13 = [v12 librarySpecificFetchOptions];

  v50[0] = *MEMORY[0x1E4F39538];
  uint64_t v14 = 1;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  [v13 setFetchPropertySets:v15];

  long long v39 = v13;
  id v16 = [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v9 options:v13];
  id v17 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8B1B8]];
  uint64_t v41 = [v17 unsignedIntegerValue];

  id v18 = (void *)MEMORY[0x1E4F1CB10];
  id v19 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8B1C8]];
  dispatch_time_t v43 = [v18 fileURLWithPath:v19];

  uint64_t v20 = [PHAWallpaperSuggestionRefreshSession alloc];
  id v21 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  long long v42 = [(PHAWallpaperSuggestionRefreshSession *)v20 initWithGraphManager:v21];

  long long v22 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8B1C0]];
  uint64_t v23 = [v22 BOOLValue];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v16;
  uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    id v36 = v11;
    id v37 = v10;
    id v38 = v9;
    id v26 = 0;
    uint64_t v27 = *(void *)v46;
    uint64_t v28 = *MEMORY[0x1E4F8D0D0];
    while (2)
    {
      uint64_t v29 = 0;
      uint64_t v30 = v26;
      do
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(obj);
        }
        long long v31 = *(void **)(*((void *)&v45 + 1) + 8 * v29);
        uint64_t v32 = [v31 uuid];
        uint64_t v33 = [v43 URLByAppendingPathComponent:v32];
        uint64_t v34 = [v33 URLByAppendingPathExtension:@"wallpaper"];

        uint64_t v35 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v35 removeItemAtURL:v34 error:0];

        id v44 = v30;
        LODWORD(v35) = [(PHAWallpaperSuggestionRefreshSession *)v42 savePreviewSegmentationResourcesForAsset:v31 atURL:v34 withClassification:v41 styleCategory:v28 enableSettlingEffect:v23 error:&v44];
        id v26 = v44;

        if (!v35)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
        ++v29;
        uint64_t v30 = v26;
      }
      while (v25 != v29);
      uint64_t v25 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v25) {
        continue;
      }
      break;
    }
    uint64_t v14 = 1;
LABEL_11:
    id v10 = v37;
    id v9 = v38;
    id v11 = v36;
  }
  else
  {
    id v26 = 0;
  }

  v11[2](v11, v14, v26);
}

- (void)requestWallpaperPropertiesForAssets:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v38 = (void (**)(id, void *, id))a6;
  id v11 = [(PHAStorytellingClientRequestHandler *)self photoLibrary];
  uint64_t v12 = [v11 librarySpecificFetchOptions];

  v46[0] = *MEMORY[0x1E4F39538];
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  [(id)v12 setFetchPropertySets:v13];

  id v37 = (void *)v12;
  uint64_t v14 = [MEMORY[0x1E4F38EB8] fetchAssetsWithUUIDs:v9 options:v12];
  long long v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v14, "count"));
  id v15 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8B1C0]];
  LOBYTE(v12) = [v15 BOOLValue];

  if (v12)
  {
    uint64_t v16 = 5;
  }
  else
  {
    id v17 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F8B1B8]];
    uint64_t v18 = [v17 unsignedIntegerValue];

    uint64_t v16 = [(id)objc_opt_class() _sceneTypeForPosterClassification:v18];
  }
  id v19 = objc_alloc(MEMORY[0x1E4F8D978]);
  uint64_t v20 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v21 = [v20 workingContextForSuggestions];
  long long v22 = [v21 loggingConnection];
  uint64_t v23 = (void *)[v19 initWithType:v16 loggingConnection:v22];

  [v23 setIsUserInitiated:1];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v24 = v14;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    id v35 = v10;
    id v36 = v9;
    id v27 = 0;
    uint64_t v28 = *(void *)v42;
    while (2)
    {
      uint64_t v29 = 0;
      uint64_t v30 = v27;
      do
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v24);
        }
        long long v31 = *(void **)(*((void *)&v41 + 1) + 8 * v29);
        id v40 = v30;
        uint64_t v32 = objc_msgSend(v23, "requestWallpaperPropertiesForAsset:progressBlock:error:", v31, &__block_literal_global_9361, &v40, v35, v36);
        id v27 = v40;

        if (!v32)
        {

          uint64_t v34 = 0;
          id v10 = v35;
          id v9 = v36;
          goto LABEL_16;
        }
        uint64_t v33 = [v31 uuid];
        [v39 setObject:v32 forKeyedSubscript:v33];

        ++v29;
        uint64_t v30 = v27;
      }
      while (v26 != v29);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v26) {
        continue;
      }
      break;
    }
    id v10 = v35;
    id v9 = v36;
  }
  else
  {
    id v27 = 0;
  }
  uint64_t v34 = v39;
LABEL_16:

  v38[2](v38, v34, v27);
}

- (void)requestPeopleForWallpaperSuggestionsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = (objc_class *)MEMORY[0x1E4F8D980];
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = a3;
  id v10 = [v7 alloc];
  id v11 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  uint64_t v12 = [v11 workingContextForSuggestions];
  id v13 = (void *)[v10 initWithWorkingContext:v12];

  uint64_t v14 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F8EAD8]];

  uint64_t v15 = [v14 BOOLValue];
  uint64_t v16 = [v13 personLocalIdentifiersForTopPeople:v15];
  uint64_t v22 = *MEMORY[0x1E4F8EAD0];
  id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  id v21 = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  id v19 = [v16 sortedArrayUsingDescriptors:v18];
  v23[0] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  v8[2](v8, v20, 0);
}

- (void)reloadWallpaperSuggestionsWithSuggestionUUIDs:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, id))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v10 = [v9 workingContextForSuggestions];
  id v11 = [v10 loggingConnection];

  uint64_t v12 = [PHAWallpaperSuggestionRefreshSession alloc];
  id v13 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  uint64_t v14 = [(PHAWallpaperSuggestionRefreshSession *)v12 initWithGraphManager:v13];

  id v25 = 0;
  LODWORD(v13) = [(PHAWallpaperSuggestionRefreshSession *)v14 prepareWithError:&v25];
  id v15 = v25;
  if (v13)
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F8D898]) initWithTaskName:@"ReloadWallpaperSuggestions" loggingConnection:v11];
    id v17 = objc_alloc(MEMORY[0x1E4F71F20]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __111__PHAStorytellingClientRequestHandler_Suggestion__reloadWallpaperSuggestionsWithSuggestionUUIDs_context_reply___block_invoke;
    v23[3] = &unk_1E6918D90;
    id v24 = v16;
    id v18 = v16;
    id v19 = (void *)[v17 initWithProgressBlock:v23];
    id v22 = v15;
    uint64_t v20 = [(PHAWallpaperSuggestionRefreshSession *)v14 reloadWallpaperSuggestionsForUUIDs:v7 progress:v19 error:&v22];
    id v21 = v22;

    [(PHAWallpaperSuggestionRefreshSession *)v14 cleanup];
    id v15 = v21;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v15;
      _os_log_fault_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_FAULT, "Failed to prepare wallpaper suggestion refresh session: %@", buf, 0xCu);
    }
    uint64_t v20 = 0;
  }
  v8[2](v8, v20, v15);
}

uint64_t __111__PHAStorytellingClientRequestHandler_Suggestion__reloadWallpaperSuggestionsWithSuggestionUUIDs_context_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkCallsWithProgress:stop:", 0);
}

- (void)requestNightlySuggestionsForPosterConfiguration:(id)a3 atDate:(id)a4 context:(id)a5 reply:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (objc_class *)MEMORY[0x1E4F8CD38];
  id v11 = (void (**)(id, void *, void))a6;
  id v12 = a4;
  id v13 = (void *)[[v10 alloc] initWithShuffleType:0];
  [v13 setShuffleSmartAlbums:0];
  uint64_t v14 = [v9 objectForKeyedSubscript:@"personLocalIdentifiers"];
  if ([v14 count])
  {
    id v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
    [v13 setPersonLocalIdentifiers:v15];

    objc_msgSend(v13, "setShuffleSmartAlbums:", objc_msgSend(v13, "shuffleSmartAlbums") | 1);
  }
  uint64_t v16 = [v9 objectForKeyedSubscript:@"includePets"];
  int v17 = [v16 BOOLValue];

  id v18 = [v9 objectForKeyedSubscript:@"includeLandscapes"];
  int v19 = [v18 BOOLValue];

  uint64_t v20 = [v9 objectForKeyedSubscript:@"includeCityscapes"];
  int v21 = [v20 BOOLValue];

  if (!v17)
  {
    if (!v19) {
      goto LABEL_5;
    }
LABEL_9:
    objc_msgSend(v13, "setShuffleSmartAlbums:", objc_msgSend(v13, "shuffleSmartAlbums") | 4);
    if (!v21) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  objc_msgSend(v13, "setShuffleSmartAlbums:", objc_msgSend(v13, "shuffleSmartAlbums") | 2);
  if (v19) {
    goto LABEL_9;
  }
LABEL_5:
  if (v21) {
LABEL_6:
  }
    objc_msgSend(v13, "setShuffleSmartAlbums:", objc_msgSend(v13, "shuffleSmartAlbums") | 8);
LABEL_7:
  id v22 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  uint64_t v23 = [v22 photoLibrary];

  id v24 = (void *)[objc_alloc(MEMORY[0x1E4F39338]) initWithPhotoLibrary:v23];
  id v25 = [v24 personUUIDsWithNegativeFeedback];
  uint64_t v26 = [MEMORY[0x1E4F8E850] suggestionLocalIdentifiersByFeatureForPosterConfiguration:v13 atDate:v12 inPhotoLibrary:v23];
  id v27 = [MEMORY[0x1E4F8E850] chosenSuggestionLocalIdentifiersForPosterConfiguration:v13 fromSuggestionLocalIdentifiersByFeature:v26 atDate:v12 usingStrategy:0 withRejectedPersonLocalIdentifiers:v25];

  uint64_t v29 = *MEMORY[0x1E4F8B118];
  v30[0] = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  v11[2](v11, v28, 0);
}

- (void)requestSuggestionInfosWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v14 = 0;
  char v10 = [v9 isReadyWithError:&v14];
  id v11 = v14;
  if (v10)
  {
    id v12 = [[PHASuggestionController alloc] initWithGraphManager:v9];
    id v13 = [(PHASuggestionController *)v12 suggestionInfosWithOptions:v7];
    v8[2](v8, v13, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)requestAvailableSuggestionTypeInfosWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  qos_class_t v6 = (void (**)(id, void *, void))a5;
  id v7 = [(PHAStorytellingClientRequestHandler *)self graphManager];
  id v11 = 0;
  char v8 = [v7 isReadyWithError:&v11];
  id v9 = v11;
  if (v8)
  {
    char v10 = +[PHASuggestionController availableSuggestionTypeInfosWithProfile:0];
    v6[2](v6, v10, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v6)[2](v6, 0, v9);
  }
}

+ (unint64_t)_sceneTypeForPosterClassification:(unint64_t)a3
{
  if (a3 > 5) {
    return 2;
  }
  else {
    return qword_1D2433508[a3];
  }
}

@end