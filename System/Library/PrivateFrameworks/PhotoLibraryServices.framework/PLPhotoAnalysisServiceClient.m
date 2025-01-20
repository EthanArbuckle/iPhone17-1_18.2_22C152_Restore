@interface PLPhotoAnalysisServiceClient
- (BOOL)rebuildPersonsWithOptions:(id)a3 error:(id *)a4;
- (BOOL)reclusterFacesWithOptions:(id)a3 error:(id *)a4;
- (BOOL)reportMetricsWithOptions:(id)a3 error:(id *)a4;
- (BOOL)requestAssetRevGeocodingForAssetLocalIdentifiers:(id)a3 withError:(id *)a4;
- (BOOL)requestAssetRevGeocodingWithError:(id *)a3;
- (BOOL)requestEnrichmentWithOptions:(id)a3 error:(id *)a4;
- (BOOL)requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (BOOL)requestHighlightCollectionEnrichmentWithOptions:(id)a3 error:(id *)a4;
- (BOOL)requestHighlightEnrichmentWithOptions:(id)a3 error:(id *)a4;
- (BOOL)requestInvalidatePersistentCaches:(id *)a3;
- (BOOL)requestInvalidateTransientCaches:(id *)a3;
- (BOOL)requestSetDefaultsObject:(id)a3 forKey:(id)a4 withError:(id *)a5;
- (BOOL)requestStartSharedLibrarySuggestionResultWithError:(id *)a3;
- (BOOL)requestSyndicationLibraryRevGeocodingWithError:(id *)a3;
- (BOOL)requestTitleForAssetCollectionWithLocalIdentifier:(id)a3 format:(int64_t)a4 title:(id *)a5 subtitle:(id *)a6 error:(id *)a7;
- (BOOL)requestTitleForCollectionMomentListWithLocalIdentifier:(id)a3 format:(int64_t)a4 title:(id *)a5 subtitle:(id *)a6 error:(id *)a7;
- (BOOL)requestTitleForPersonLocalIdentifiers:(id)a3 format:(int64_t)a4 title:(id *)a5 subtitle:(id *)a6 error:(id *)a7;
- (BOOL)resetFaceClassificationModel:(id *)a3;
- (BOOL)resetFaceClusteringState:(id *)a3;
- (NSURL)libraryURL;
- (OS_dispatch_queue)backgroundQueue;
- (PLPhotoAnalysisServiceClient)init;
- (PLPhotoAnalysisServiceClient)initWithLibraryURL:(id)a3;
- (id)_xpcConnection;
- (id)differencesBetweenClustersInClusterCacheAndLibrary:(id *)a3;
- (id)dumpAnalysisStatusError:(id *)a3;
- (id)executiveService;
- (id)faceCandidatesForKeyFaceForPersonsWithLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)legacyService;
- (id)momentGraphService;
- (id)photoLibraryService;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)requestAllSocialGroupsForMemberLocalIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (id)requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)requestAssetCollectionsRelatedToAssetWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)requestAssetCollectionsRelatedToMomentWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)requestAssetCollectionsRelatedToPersonLocalIdentifiers:(id)a3 options:(id)a4 error:(id *)a5;
- (id)requestAssetLocalIdentifiersByCityNameWithError:(id *)a3;
- (id)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestAssetsForPersonLocalIdentifiers:(id)a3 withError:(id *)a4;
- (id)requestAvailableSuggestionTypeInfosWithOptions:(id)a3 error:(id *)a4;
- (id)requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID:(id)a3 options:(id)a4 error:(id *)a5;
- (id)requestCameraSmartSharingProcessingForLibraryScopeWithUUID:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (id)requestComposabilityScoresOfAssetsForLocalIdentifiers:(id)a3 options:(id)a4 error:(id *)a5;
- (id)requestConfidenceByMomentLocalIdentifierForMeaning:(id)a3 useAlternativeMeaningEdge:(BOOL)a4 onlyHighPrecision:(BOOL)a5 error:(id *)a6;
- (id)requestContextDictionary;
- (id)requestCuratedAssetForAssetCollectionWithLocalIdentifier:(id)a3 referenceAssetLocalIdentifier:(id)a4 options:(id)a5 error:(id *)a6;
- (id)requestCuratedAssetsForAssetCollectionWithLocalIdentifier:(id)a3 duration:(unint64_t)a4 options:(id)a5 error:(id *)a6;
- (id)requestCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)requestCurationDebugInformationForAssetLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestCurationOfLength:(unint64_t)a3 forMemoryForLocalIdentifier:(id)a4 withOptions:(id)a5 error:(id *)a6;
- (id)requestCurationScoreByAssetUUIDForAssetUUIDs:(id)a3 error:(id *)a4;
- (id)requestDefaultsObjectForKey:(id)a3 withError:(id *)a4;
- (id)requestDiscoveryFeedItemsWithOptions:(id)a3 generationSessionState:(id *)a4 error:(id *)a5;
- (id)requestEnergyStatusWithError:(id *)a3;
- (id)requestExportGraphForPurpose:(id)a3 error:(id *)a4;
- (id)requestGeoHashForAssetLocalIdentifiers:(id)a3 geoHashSize:(id)a4 error:(id *)a5;
- (id)requestGraphInferencesSummaryWithDateInterval:(id)a3 error:(id *)a4;
- (id)requestGraphInferencesSummaryWithMomentLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)requestGraphMomentLocalIdentifiersWithDateInterval:(id)a3 error:(id *)a4;
- (id)requestGraphPerformQuery:(id)a3 error:(id *)a4;
- (id)requestGraphStatisticsWithOptions:(id)a3 error:(id *)a4;
- (id)requestGraphStatus:(id *)a3;
- (id)requestHighlightDebugInformationForHighlightWithLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestIconicSceneScoreForAssetLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)requestKeyAssetLocalIdentifierForPrototypeCategory:(id)a3 error:(id *)a4;
- (id)requestMeaningScoreDebugDescriptionForMomentLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestMemoryDebugInformationForMemoryWithLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestNightlySuggestionsForPosterConfiguration:(id)a3 atDate:(id)a4 error:(id *)a5;
- (id)requestOnDemandFaceCropsForFaceLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)requestPersonalTraitsForAssetsWithUUIDs:(id)a3 error:(id *)a4;
- (id)requestPersonalTraitsForHighlightsWithUUIDs:(id)a3 error:(id *)a4;
- (id)requestRelatedDebugInformationBetweenAssetForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7;
- (id)requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7;
- (id)requestRelatedMomentsForPersonLocalIdentifiers:(id)a3 withError:(id *)a4;
- (id)requestRelationshipInferencesForPersonLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestSignalModelInfosWithError:(id *)a3;
- (id)requestSnapshotServiceForPeopleCurationResultsWithGraphOptions:(id)a3 error:(id *)a4;
- (id)requestSnapshotServiceForRelatedResultsWithGraphOptions:(id)a3 error:(id *)a4;
- (id)requestSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3 withError:(id *)a4;
- (id)requestSortedArrayOfPersonLocalIdentifiers:(id)a3 withError:(id *)a4;
- (id)requestSuggestedContributionsForAssetsMetadata:(id)a3 error:(id *)a4;
- (id)requestSuggestedMePersonIdentifierWithError:(id *)a3;
- (id)requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (id)requestSuggestedPersonsWithOptions:(id)a3 error:(id *)a4;
- (id)requestSuggestedRecipientsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 options:(id)a5 error:(id *)a6;
- (id)requestSuggestionInfosWithOptions:(id)a3 error:(id *)a4;
- (id)requestSummaryCurationForHighlightLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (id)requestTextFeaturesForMomentLocalIdentifiers:(id)a3 error:(id *)a4;
- (id)requestTrendsByIdentifierWithCadence:(id)a3 forYear:(unint64_t)a4 error:(id *)a5;
- (id)requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier:(id)a3 error:(id *)a4;
- (id)requestUpNextMemoryLocalIdentifiersWithOptions:(id)a3 error:(id *)a4;
- (id)requestUtilityAssetInformationWithError:(id *)a3;
- (id)requestUtilityAssetLocalIdentifiersWithError:(id *)a3;
- (id)runCurationWithItems:(id)a3 options:(id)a4 error:(id *)a5;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)testService;
- (id)wallpaperService;
- (id)xpcConnection;
- (int)photoanalysisdPid;
- (int64_t)suggestedPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 completion:(id)a6;
- (int64_t)updateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5;
- (void)_resetServicesIncludingConnection:(BOOL)a3;
- (void)_setupLegacyServiceInterface:(id)a3;
- (void)_setupServiceProviderInterface:(id)a3;
- (void)_setupServices;
- (void)_setupXPCConnection;
- (void)asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID:(id)a3 withOptions:(id)a4 reply:(id)a5;
- (void)cacheCPAnalyticsPropertiesWithReply:(id)a3;
- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)dispatchOnQueue:(id)a3 blockWithoutBoost:(id)a4;
- (void)exportWallpaperForAssets:(id)a3 options:(id)a4 reply:(id)a5;
- (void)generateMemoriesWithOptions:(id)a3 reply:(id)a4;
- (void)generateSuggestionsWithOptions:(id)a3 reply:(id)a4;
- (void)notifyLibraryAvailableAtURLForMediaanalysisd:(id)a3;
- (void)notifyLibraryAvailableAtURLForPhotoanalysisd:(id)a3;
- (void)notifyWhenGraphReadyWithCoalescingIdentifier:(id)a3 reply:(id)a4;
- (void)personPromoterAdvancedStatus:(id)a3;
- (void)personPromoterStatus:(id)a3;
- (void)recordFeatureUsageFromCounts:(id)a3 reply:(id)a4;
- (void)reloadAlbumWidgetTimelineWithReply:(id)a3;
- (void)reloadForYouWidgetTimelineWithReply:(id)a3;
- (void)reloadWallpaperSuggestions:(id)a3 reply:(id)a4;
- (void)requestCacheSongSourceWithOptions:(id)a3 reply:(id)a4;
- (void)requestClearMusicCacheWithOptions:(id)a3 reply:(id)a4;
- (void)requestExternalAssetRelevanceProcessingWithReply:(id)a3;
- (void)requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 reply:(id)a4;
- (void)requestFlexMusicCurationDebugInformationForSongWithUID:(id)a3 reply:(id)a4;
- (void)requestFlexMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 reply:(id)a5;
- (void)requestFlexMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 reply:(id)a5;
- (void)requestFlexMusicCurationWithOptions:(id)a3 reply:(id)a4;
- (void)requestGenerateQuestionsWithOptions:(id)a3 reply:(id)a4;
- (void)requestGraphModelResultWithOptions:(id)a3 progress:(id)a4 reply:(id)a5;
- (void)requestGraphRebuildFractionCompletedWithReply:(id)a3;
- (void)requestHighlightEstimatesWithReply:(id)a3;
- (void)requestModelInference:(id)a3 options:(id)a4 reply:(id)a5;
- (void)requestMusicCacheStatusWithReply:(id)a3;
- (void)requestMusicCatalogAdamIDsForPurchasedSongID:(id)a3 options:(id)a4 reply:(id)a5;
- (void)requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 reply:(id)a4;
- (void)requestMusicCurationDebugInformationForSongWithAdamID:(id)a3 reply:(id)a4;
- (void)requestMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 reply:(id)a5;
- (void)requestMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 reply:(id)a5;
- (void)requestMusicCurationWithOptions:(id)a3 reply:(id)a4;
- (void)requestOnDemandTasksWithOptions:(id)a3 reply:(id)a4;
- (void)requestPeopleForWallpaperSuggestionsWithOptions:(id)a3 reply:(id)a4;
- (void)requestPrecachingOfAudioDataForAdamIDs:(id)a3 reply:(id)a4;
- (void)requestRecentlyUsedSongsWithOptions:(id)a3 reply:(id)a4;
- (void)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply:(id)a3;
- (void)requestRunPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 resultBlock:(id)a5;
- (void)requestRunShadowEvaluationWithRecipe:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 resultBlock:(id)a8;
- (void)requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 reply:(id)a6;
- (void)requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 additionalSnapshotSummaryInfo:(id)a6 reply:(id)a7;
- (void)requestSnapshotServiceForRelatedWithAssetLocalIdentifier:(id)a3 reply:(id)a4;
- (void)requestSnapshotServiceForRelatedWithMomentLocalIdentifier:(id)a3 reply:(id)a4;
- (void)requestSongsForAdamIDs:(id)a3 options:(id)a4 reply:(id)a5;
- (void)requestSyndicationProcessingWithOptions:(id)a3 reply:(id)a4;
- (void)requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs:(id)a3 reply:(id)a4;
- (void)requestWallpaperProperties:(id)a3 options:(id)a4 reply:(id)a5;
- (void)runPerformanceTest:(id)a3 options:(id)a4 reply:(id)a5;
- (void)simulateMemoriesNotificationWithOptions:(id)a3 reply:(id)a4;
- (void)writeQALog:(id)a3;
@end

@implementation PLPhotoAnalysisServiceClient

- (id)requestOnDemandFaceCropsForFaceLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__18065;
  v20 = __Block_byref_object_dispose__18066;
  id v21 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__18065;
  v14[4] = __Block_byref_object_dispose__18066;
  id v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__18065;
  v12[4] = __Block_byref_object_dispose__18066;
  id v13 = 0;
  v6 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__PLPhotoAnalysisServiceClient_Vision__requestOnDemandFaceCropsForFaceLocalIdentifiers_error___block_invoke;
  v11[3] = &unk_1E5874CF8;
  v11[4] = v14;
  v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__PLPhotoAnalysisServiceClient_Vision__requestOnDemandFaceCropsForFaceLocalIdentifiers_error___block_invoke_2;
  v10[3] = &unk_1E5874D48;
  v10[4] = &v16;
  v10[5] = v12;
  [v7 requestOnDemandFaceCropsForFaceLocalIdentifiers:v5 context:v6 reply:v10];

  id v8 = (id)v17[5];
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __94__PLPhotoAnalysisServiceClient_Vision__requestOnDemandFaceCropsForFaceLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
}

void __94__PLPhotoAnalysisServiceClient_Vision__requestOnDemandFaceCropsForFaceLocalIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)rebuildPersonsWithOptions:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  id v8 = (void *)[v7 mutableCopy];

  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v8 addEntriesFromDictionary:v6];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__18065;
  v30 = __Block_byref_object_dispose__18066;
  id v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v9 = [v6 objectForKeyedSubscript:@"personLocalIdentifier"];
  v10 = (void *)v9;
  if (v9)
  {
    v32[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  }
  else
  {
    id v11 = 0;
  }
  dispatch_block_t v12 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_153);
  id v13 = [(PLPhotoAnalysisServiceClient *)self libraryURL];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__PLPhotoAnalysisServiceClient_Vision__rebuildPersonsWithOptions_error___block_invoke_3;
  v18[3] = &unk_1E5865D50;
  v20 = &v22;
  id v21 = &v26;
  id v14 = v12;
  id v19 = v14;
  +[PLMediaAnalysisServiceRequestAdapter requestRebuildPersonsWithLocalIdentifiers:v11 photoLibraryURL:v13 progressHandler:&__block_literal_global_155 completionHandler:v18];

  dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  int v15 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((unsigned char *)v23 + 24))
  {
    *a4 = (id) v27[5];
    int v15 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v16 = v15 != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v16;
}

void __72__PLPhotoAnalysisServiceClient_Vision__rebuildPersonsWithOptions_error___block_invoke_3(void *a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

- (id)faceCandidatesForKeyFaceForPersonsWithLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__18065;
  v27 = __Block_byref_object_dispose__18066;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18065;
  id v21 = __Block_byref_object_dispose__18066;
  id v22 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_144);
  id v8 = [(PLPhotoAnalysisServiceClient *)self libraryURL];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__PLPhotoAnalysisServiceClient_Vision__faceCandidatesForKeyFaceForPersonsWithLocalIdentifiers_error___block_invoke_3;
  v13[3] = &unk_1E5865DA0;
  int v15 = &v17;
  BOOL v16 = &v23;
  id v9 = v7;
  id v14 = v9;
  +[PLMediaAnalysisServiceRequestAdapter requestFaceCandidatesforKeyFaceForPersonsWithLocalIdentifiers:v6 photoLibraryURL:v8 progessHandler:&__block_literal_global_146 completionHandler:v13];

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (void *)v24[5];
  if (a4 && !v10)
  {
    *a4 = (id) v18[5];
    v10 = (void *)v24[5];
  }
  id v11 = v10;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __101__PLPhotoAnalysisServiceClient_Vision__faceCandidatesForKeyFaceForPersonsWithLocalIdentifiers_error___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(a1[6] + 8);
  dispatch_block_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)personPromoterAdvancedStatus:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_140);
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__18065;
  id v22 = __Block_byref_object_dispose__18066;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__18065;
  BOOL v16 = __Block_byref_object_dispose__18066;
  id v17 = 0;
  uint64_t v6 = [(PLPhotoAnalysisServiceClient *)self libraryURL];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PLPhotoAnalysisServiceClient_Vision__personPromoterAdvancedStatus___block_invoke_3;
  v8[3] = &unk_1E5865D78;
  v10 = &v18;
  id v11 = &v12;
  id v7 = v5;
  id v9 = v7;
  +[PLMediaAnalysisServiceRequestAdapter requestPersonPromoterStatusWithAdvancedFlag:1 photoLibraryURL:v6 progressHandler:&__block_literal_global_142 completionHandler:v8];

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v4) {
    v4[2](v4, v19[5], v13[5]);
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

void __69__PLPhotoAnalysisServiceClient_Vision__personPromoterAdvancedStatus___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

- (void)personPromoterStatus:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_136);
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__18065;
  id v22 = __Block_byref_object_dispose__18066;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__18065;
  BOOL v16 = __Block_byref_object_dispose__18066;
  id v17 = 0;
  id v6 = [(PLPhotoAnalysisServiceClient *)self libraryURL];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PLPhotoAnalysisServiceClient_Vision__personPromoterStatus___block_invoke_3;
  v8[3] = &unk_1E5865D78;
  v10 = &v18;
  id v11 = &v12;
  id v7 = v5;
  id v9 = v7;
  +[PLMediaAnalysisServiceRequestAdapter requestPersonPromoterStatusWithAdvancedFlag:0 photoLibraryURL:v6 progressHandler:&__block_literal_global_138 completionHandler:v8];

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v4) {
    v4[2](v4, v19[5], v13[5]);
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

void __61__PLPhotoAnalysisServiceClient_Vision__personPromoterStatus___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

- (id)differencesBetweenClustersInClusterCacheAndLibrary:(id *)a3
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__18065;
  uint64_t v25 = __Block_byref_object_dispose__18066;
  id v26 = 0;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__18065;
  uint64_t v19 = __Block_byref_object_dispose__18066;
  id v20 = 0;
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_131);
  id v6 = [(PLPhotoAnalysisServiceClient *)self libraryURL];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__PLPhotoAnalysisServiceClient_Vision__differencesBetweenClustersInClusterCacheAndLibrary___block_invoke_3;
  v11[3] = &unk_1E5865D78;
  id v13 = &v21;
  uint64_t v14 = &v15;
  id v7 = v5;
  id v12 = v7;
  +[PLMediaAnalysisServiceRequestAdapter requestClusterCacheValidationWithPhotoLibraryURL:v6 progressHandler:&__block_literal_global_133 completionHandler:v11];

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (void *)v22[5];
  if (a3 && !v8)
  {
    *a3 = (id) v16[5];
    id v8 = (void *)v22[5];
  }
  id v9 = v8;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __91__PLPhotoAnalysisServiceClient_Vision__differencesBetweenClustersInClusterCacheAndLibrary___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

- (BOOL)reclusterFacesWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__18065;
  uint64_t v25 = __Block_byref_object_dispose__18066;
  id v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_127);
  id v8 = [(PLPhotoAnalysisServiceClient *)self libraryURL];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PLPhotoAnalysisServiceClient_Vision__reclusterFacesWithOptions_error___block_invoke_3;
  v13[3] = &unk_1E5865D50;
  uint64_t v15 = &v17;
  BOOL v16 = &v21;
  id v9 = v7;
  id v14 = v9;
  +[PLMediaAnalysisServiceRequestAdapter requestResetFaceClusteringStateWithPhotoLibraryURL:v8 progressHandler:&__block_literal_global_129 completionHandler:v13];

  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  int v10 = *((unsigned __int8 *)v18 + 24);
  if (a4 && !*((unsigned char *)v18 + 24))
  {
    *a4 = (id) v22[5];
    int v10 = *((unsigned __int8 *)v18 + 24);
  }
  BOOL v11 = v10 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __72__PLPhotoAnalysisServiceClient_Vision__reclusterFacesWithOptions_error___block_invoke_3(void *a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

- (BOOL)resetFaceClassificationModel:(id *)a3
{
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__18065;
  uint64_t v23 = __Block_byref_object_dispose__18066;
  id v24 = 0;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_123);
  id v6 = [(PLPhotoAnalysisServiceClient *)self libraryURL];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PLPhotoAnalysisServiceClient_Vision__resetFaceClassificationModel___block_invoke_3;
  v11[3] = &unk_1E5865D50;
  id v13 = &v15;
  id v14 = &v19;
  id v7 = v5;
  id v12 = v7;
  +[PLMediaAnalysisServiceRequestAdapter requestResetFaceClassificationModelForPhotoLibraryURL:v6 progressHandler:&__block_literal_global_125 completionHandler:v11];

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  int v8 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((unsigned char *)v16 + 24))
  {
    *a3 = (id) v20[5];
    int v8 = *((unsigned __int8 *)v16 + 24);
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __69__PLPhotoAnalysisServiceClient_Vision__resetFaceClassificationModel___block_invoke_3(void *a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

- (BOOL)resetFaceClusteringState:(id *)a3
{
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__18065;
  uint64_t v23 = __Block_byref_object_dispose__18066;
  id v24 = 0;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_119);
  id v6 = [(PLPhotoAnalysisServiceClient *)self libraryURL];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PLPhotoAnalysisServiceClient_Vision__resetFaceClusteringState___block_invoke_3;
  v11[3] = &unk_1E5865D50;
  id v13 = &v15;
  id v14 = &v19;
  id v7 = v5;
  id v12 = v7;
  +[PLMediaAnalysisServiceRequestAdapter requestResetFaceClusteringStateWithPhotoLibraryURL:v6 progressHandler:&__block_literal_global_121_18074 completionHandler:v11];

  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  int v8 = *((unsigned __int8 *)v16 + 24);
  if (a3 && !*((unsigned char *)v16 + 24))
  {
    *a3 = (id) v20[5];
    int v8 = *((unsigned __int8 *)v16 + 24);
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __65__PLPhotoAnalysisServiceClient_Vision__resetFaceClusteringState___block_invoke_3(void *a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(a1[4] + 16))();
}

- (int64_t)updateKeyFacesOfPersonsWithLocalIdentifiers:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v9 = a3;
  int v10 = [(PLPhotoAnalysisServiceClient *)self libraryURL];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__PLPhotoAnalysisServiceClient_Vision__updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_completion___block_invoke_2;
  v14[3] = &unk_1E5865D28;
  id v15 = v8;
  BOOL v16 = &v17;
  id v11 = v8;
  int64_t v12 = +[PLMediaAnalysisServiceRequestAdapter requestUpdateKeyFacesOfPersonsWithLocalIdentifiers:v9 forceUpdate:v5 photoLibraryURL:v10 progessHandler:&__block_literal_global_115 completionHandler:v14];

  v18[3] = v12;
  _Block_object_dispose(&v17, 8);

  return v12;
}

uint64_t __107__PLPhotoAnalysisServiceClient_Vision__updateKeyFacesOfPersonsWithLocalIdentifiers_forceUpdate_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), a3);
}

- (int64_t)suggestedPersonsForPersonWithLocalIdentifier:(id)a3 toBeConfirmedPersonSuggestions:(id)a4 toBeRejectedPersonSuggestions:(id)a5 completion:(id)a6
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v13 valueForKey:@"suggestionDictionaryRepresentation"];
  uint64_t v16 = [v15 count];
  uint64_t v17 = [v13 count];

  if (v16 != v17)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"PLPhotoAnalysisServiceClient+Vision.m" lineNumber:90 description:@"dictionary representation failure for confirmed face suggestions"];
  }
  char v18 = [v12 valueForKey:@"suggestionDictionaryRepresentation"];
  uint64_t v19 = [v18 count];
  uint64_t v20 = [v12 count];

  if (v19 != v20)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"PLPhotoAnalysisServiceClient+Vision.m" lineNumber:93 description:@"dictionary representation failure for rejected face suggestions"];
  }
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v21 = [(PLPhotoAnalysisServiceClient *)self libraryURL];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __157__PLPhotoAnalysisServiceClient_Vision__suggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_completion___block_invoke_2;
  v27[3] = &unk_1E5865D00;
  id v28 = v11;
  v29 = &v30;
  id v22 = v11;
  int64_t v23 = +[PLMediaAnalysisServiceRequestAdapter requestSuggestedPersonsForPersonWithLocalIdentifier:v14 toBeConfirmedPersonSuggestions:v15 toBeRejectedPersonSuggestions:v18 photoLibraryURL:v21 progessHandler:&__block_literal_global_18080 completionHandler:v27];

  v31[3] = v23;
  _Block_object_dispose(&v30, 8);

  return v23;
}

void __157__PLPhotoAnalysisServiceClient_Vision__suggestedPersonsForPersonWithLocalIdentifier_toBeConfirmedPersonSuggestions_toBeRejectedPersonSuggestions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v12 = [PLPhotoAnalysisPersonSuggestion alloc];
          id v13 = -[PLPhotoAnalysisPersonSuggestion initWithSuggestionDictionary:](v12, "initWithSuggestionDictionary:", v11, (void)v14);
          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_wallpaperService, 0);
  objc_storeStrong((id *)&self->_executiveService, 0);
  objc_storeStrong((id *)&self->_testService, 0);
  objc_storeStrong((id *)&self->_momentGraphService, 0);
  objc_storeStrong((id *)&self->_photoLibraryService, 0);
  objc_storeStrong((id *)&self->_legacyService, 0);
  objc_storeStrong((id *)&self->_wallpaperServiceInterface, 0);
  objc_storeStrong((id *)&self->_executiveServiceInterface, 0);
  objc_storeStrong((id *)&self->_testServiceInterface, 0);
  objc_storeStrong((id *)&self->_momentGraphServiceInterface, 0);
  objc_storeStrong((id *)&self->_photoLibraryServiceInterface, 0);
  objc_storeStrong((id *)&self->_legacyServiceInterface, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_cachedRequestContextDictionary, 0);
}

- (NSURL)libraryURL
{
  return self->_libraryURL;
}

- (id)legacyService
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  id v4 = [(PLPhotoAnalysisServiceClient *)self _xpcConnection];
  BOOL v5 = self->_legacyService;
  os_unfair_lock_unlock(p_connectionLock);
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_fault_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "The Legacy Service to PAD is unexpectedly nil", v7, 2u);
  }
  return v5;
}

- (void)dispatchOnQueue:(id)a3 blockWithoutBoost:(id)a4
{
  BOOL v5 = a3;
  id v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, a4);
  dispatch_async(v5, v6);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLPhotoAnalysisServiceClient *)self legacyService];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLPhotoAnalysisServiceClient *)self legacyService];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)requestContextDictionary
{
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_cachedRequestContextDictionary];
  atomic_fetch_add(&requestContextDictionary_lastOperationId, 1uLL);
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:");
  [v2 setObject:v3 forKeyedSubscript:@"PHPhotoAnalysisOptionOperationIdKey"];

  return v2;
}

- (id)xpcConnection
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  id v4 = [(PLPhotoAnalysisServiceClient *)self _xpcConnection];
  os_unfair_lock_unlock(p_connectionLock);
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_fault_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "The XPC connection to PAD is unexpectedly nil", v6, 2u);
  }
  return v4;
}

- (id)_xpcConnection
{
  os_unfair_lock_assert_owner(&self->_connectionLock);
  if (self->_xpcConnection)
  {
    if (!self->_legacyService) {
      [(PLPhotoAnalysisServiceClient *)self _setupServices];
    }
  }
  else
  {
    [(PLPhotoAnalysisServiceClient *)self _setupXPCConnection];
  }
  xpcConnection = self->_xpcConnection;
  return xpcConnection;
}

- (void)_setupServices
{
  id v3 = self->_libraryURL;
  id v4 = [PLPhotoAnalysisServiceClientSideService alloc];
  xpcConnection = self->_xpcConnection;
  legacyServiceInterface = self->_legacyServiceInterface;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke;
  v50[3] = &unk_1E586F9C8;
  uint64_t v7 = v3;
  v51 = v7;
  uint64_t v8 = [(PLPhotoAnalysisServiceClientSideService *)v4 initWithConnection:xpcConnection remoteInterface:legacyServiceInterface instantiationBlock:v50];
  legacyService = self->_legacyService;
  self->_legacyService = v8;

  int v10 = [PLPhotoAnalysisServiceClientSideService alloc];
  uint64_t v11 = self->_xpcConnection;
  photoLibraryServiceInterface = self->_photoLibraryServiceInterface;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_2;
  v48[3] = &unk_1E586F9C8;
  id v13 = v7;
  v49 = v13;
  long long v14 = [(PLPhotoAnalysisServiceClientSideService *)v10 initWithConnection:v11 remoteInterface:photoLibraryServiceInterface instantiationBlock:v48];
  photoLibraryService = self->_photoLibraryService;
  self->_photoLibraryService = v14;

  long long v16 = [PLPhotoAnalysisServiceClientSideService alloc];
  long long v17 = self->_xpcConnection;
  momentGraphServiceInterface = self->_momentGraphServiceInterface;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_3;
  v46[3] = &unk_1E586F9C8;
  uint64_t v19 = v13;
  v47 = v19;
  uint64_t v20 = [(PLPhotoAnalysisServiceClientSideService *)v16 initWithConnection:v17 remoteInterface:momentGraphServiceInterface instantiationBlock:v46];
  momentGraphService = self->_momentGraphService;
  self->_momentGraphService = v20;

  id v22 = [PLPhotoAnalysisServiceClientSideService alloc];
  int64_t v23 = self->_xpcConnection;
  testServiceInterface = self->_testServiceInterface;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_4;
  v44[3] = &unk_1E586F9C8;
  uint64_t v25 = v19;
  v45 = v25;
  id v26 = [(PLPhotoAnalysisServiceClientSideService *)v22 initWithConnection:v23 remoteInterface:testServiceInterface instantiationBlock:v44];
  testService = self->_testService;
  self->_testService = v26;

  id v28 = [PLPhotoAnalysisServiceClientSideService alloc];
  v29 = self->_xpcConnection;
  executiveServiceInterface = self->_executiveServiceInterface;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_5;
  v42[3] = &unk_1E586F9C8;
  id v31 = v25;
  v43 = v31;
  uint64_t v32 = [(PLPhotoAnalysisServiceClientSideService *)v28 initWithConnection:v29 remoteInterface:executiveServiceInterface instantiationBlock:v42];
  executiveService = self->_executiveService;
  self->_executiveService = v32;

  v34 = [PLPhotoAnalysisServiceClientSideService alloc];
  v35 = self->_xpcConnection;
  wallpaperServiceInterface = self->_wallpaperServiceInterface;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_6;
  v40[3] = &unk_1E586F9C8;
  v41 = v31;
  v37 = v31;
  v38 = [(PLPhotoAnalysisServiceClientSideService *)v34 initWithConnection:v35 remoteInterface:wallpaperServiceInterface instantiationBlock:v40];
  wallpaperService = self->_wallpaperService;
  self->_wallpaperService = v38;
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 legacyStorytellingServiceAt:*(void *)(a1 + 32) reply:a3];
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 photoLibraryServiceAt:*(void *)(a1 + 32) reply:a3];
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 momentGraphServiceAt:*(void *)(a1 + 32) reply:a3];
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 testServiceAt:*(void *)(a1 + 32) reply:a3];
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 executiveServiceAt:*(void *)(a1 + 32) reply:a3];
}

uint64_t __46__PLPhotoAnalysisServiceClient__setupServices__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 wallpaperServiceAt:*(void *)(a1 + 32) reply:a3];
}

- (void)_setupServiceProviderInterface:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29280];
  id v24 = a3;
  BOOL v5 = [v4 interfaceWithProtocol:&unk_1EECD1B78];
  legacyServiceInterface = self->_legacyServiceInterface;
  self->_legacyServiceInterface = v5;

  [(PLPhotoAnalysisServiceClient *)self _setupLegacyServiceInterface:self->_legacyServiceInterface];
  [v24 setInterface:self->_legacyServiceInterface forSelector:sel_legacyStorytellingServiceAt_reply_ argumentIndex:0 ofReply:1];
  uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECD1BD8];
  photoLibraryServiceInterface = self->_photoLibraryServiceInterface;
  self->_photoLibraryServiceInterface = v7;

  [v24 setInterface:self->_photoLibraryServiceInterface forSelector:sel_photoLibraryServiceAt_reply_ argumentIndex:0 ofReply:1];
  uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECD1C38];
  momentGraphServiceInterface = self->_momentGraphServiceInterface;
  self->_momentGraphServiceInterface = v9;

  uint64_t v11 = (void *)MEMORY[0x1E4F1CA80];
  id v12 = [(NSXPCInterface *)self->_momentGraphServiceInterface classesForSelector:sel_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_operationID_reply_ argumentIndex:0 ofReply:1];
  id v13 = [v11 setWithSet:v12];

  [v13 addObject:objc_opt_class()];
  [(NSXPCInterface *)self->_momentGraphServiceInterface setClasses:v13 forSelector:sel_requestAssetSearchKeywordsForAssetCollectionUUIDs_ofType_operationID_reply_ argumentIndex:0 ofReply:1];
  long long v14 = (void *)MEMORY[0x1E4F1CA80];
  long long v15 = [(NSXPCInterface *)self->_momentGraphServiceInterface classesForSelector:sel_requestZeroKeywordsWithOptions_operationID_reply_ argumentIndex:0 ofReply:1];
  long long v16 = [v14 setWithSet:v15];

  long long v17 = +[PLZeroKeywordStore expectedClasses];
  [v16 unionSet:v17];

  [(NSXPCInterface *)self->_momentGraphServiceInterface setClasses:v16 forSelector:sel_requestZeroKeywordsWithOptions_operationID_reply_ argumentIndex:0 ofReply:1];
  [v24 setInterface:self->_momentGraphServiceInterface forSelector:sel_momentGraphServiceAt_reply_ argumentIndex:0 ofReply:1];
  char v18 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECD1C98];
  testServiceInterface = self->_testServiceInterface;
  self->_testServiceInterface = v18;

  [v24 setInterface:self->_testServiceInterface forSelector:sel_testServiceAt_reply_ argumentIndex:0 ofReply:1];
  uint64_t v20 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECD1CF8];
  executiveServiceInterface = self->_executiveServiceInterface;
  self->_executiveServiceInterface = v20;

  [v24 setInterface:self->_executiveServiceInterface forSelector:sel_executiveServiceAt_reply_ argumentIndex:0 ofReply:1];
  id v22 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECD1D58];
  wallpaperServiceInterface = self->_wallpaperServiceInterface;
  self->_wallpaperServiceInterface = v22;

  [v24 setInterface:self->_wallpaperServiceInterface forSelector:sel_wallpaperServiceAt_reply_ argumentIndex:0 ofReply:1];
}

- (void)_setupLegacyServiceInterface:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  BOOL v5 = [v4 classesForSelector:sel_cancelOperationsWithIdentifiers_context_reply_ argumentIndex:0 ofReply:1];
  id v6 = [v3 setWithSet:v5];

  v33[0] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  [v6 addObjectsFromArray:v7];

  [v4 setClasses:v6 forSelector:sel_cancelOperationsWithIdentifiers_context_reply_ argumentIndex:0 ofReply:1];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v9 = [v4 classesForSelector:sel_requestAvailableSuggestionTypeInfosWithOptions_context_reply_ argumentIndex:0 ofReply:1];
  int v10 = [v8 setWithSet:v9];

  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  void v32[2] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  [v10 addObjectsFromArray:v11];

  [v4 setClasses:v10 forSelector:sel_requestAvailableSuggestionTypeInfosWithOptions_context_reply_ argumentIndex:0 ofReply:1];
  id v12 = (void *)MEMORY[0x1E4F1CA80];
  id v13 = [v4 classesForSelector:sel_requestSuggestionInfosWithOptions_context_reply_ argumentIndex:0 ofReply:1];
  long long v14 = [v12 setWithSet:v13];

  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  [v14 addObjectsFromArray:v15];

  [v4 setClasses:v14 forSelector:sel_requestSuggestionInfosWithOptions_context_reply_ argumentIndex:0 ofReply:1];
  long long v16 = (void *)MEMORY[0x1E4F1CA80];
  long long v17 = [v4 classesForSelector:sel_requestGraphInferencesSummaryWithDateInterval_context_reply_ argumentIndex:0 ofReply:1];
  char v18 = [v16 setWithSet:v17];

  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  v30[3] = objc_opt_class();
  v30[4] = objc_opt_class();
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
  [v18 addObjectsFromArray:v19];

  [v4 setClasses:v18 forSelector:sel_requestGraphInferencesSummaryWithDateInterval_context_reply_ argumentIndex:0 ofReply:1];
  uint64_t v20 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v21 = [v4 classesForSelector:sel_requestGraphInferencesSummaryWithMomentLocalIdentifiers_context_reply_ argumentIndex:0 ofReply:1];
  id v22 = [v20 setWithSet:v21];

  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  v29[3] = objc_opt_class();
  v29[4] = objc_opt_class();
  int64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:5];
  [v22 addObjectsFromArray:v23];

  [v4 setClasses:v22 forSelector:sel_requestGraphInferencesSummaryWithMomentLocalIdentifiers_context_reply_ argumentIndex:0 ofReply:1];
  id v24 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v25 = [v4 classesForSelector:sel_requestGraphMomentLocalIdentifiersWithDateInterval_context_reply_ argumentIndex:0 ofReply:1];
  id v26 = [v24 setWithSet:v25];

  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  [v26 addObjectsFromArray:v27];

  [v4 setClasses:v26 forSelector:sel_requestGraphMomentLocalIdentifiersWithDateInterval_context_reply_ argumentIndex:0 ofReply:1];
}

- (void)_setupXPCConnection
{
  os_unfair_lock_assert_owner(&self->_connectionLock);
  id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.photoanalysisd" options:0];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  BOOL v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECD1B18];
  [(PLPhotoAnalysisServiceClient *)self _setupServiceProviderInterface:v5];
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v5];
  [(PLPhotoAnalysisServiceClient *)self _setupServices];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PLPhotoAnalysisServiceClient__setupXPCConnection__block_invoke;
  v8[3] = &unk_1E5875F08;
  objc_copyWeak(&v9, &location);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PLPhotoAnalysisServiceClient__setupXPCConnection__block_invoke_85;
  v6[3] = &unk_1E5875F08;
  objc_copyWeak(&v7, &location);
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v6];
  [(NSXPCConnection *)self->_xpcConnection activate];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__PLPhotoAnalysisServiceClient__setupXPCConnection__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Photo analysis client XPC connection invalidated", v3, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetServicesIncludingConnection:1];
}

void __51__PLPhotoAnalysisServiceClient__setupXPCConnection__block_invoke_85(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v3 = 0;
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Photo analysis client XPC connection interrupted", v3, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetServicesIncludingConnection:0];
}

- (void)_resetServicesIncludingConnection:(BOOL)a3
{
  BOOL v3 = a3;
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (v3)
  {
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
  legacyService = self->_legacyService;
  self->_legacyService = 0;

  photoLibraryService = self->_photoLibraryService;
  self->_photoLibraryService = 0;

  momentGraphService = self->_momentGraphService;
  self->_momentGraphService = 0;

  testService = self->_testService;
  self->_testService = 0;

  executiveService = self->_executiveService;
  self->_executiveService = 0;

  wallpaperService = self->_wallpaperService;
  self->_wallpaperService = 0;

  os_unfair_lock_unlock(p_connectionLock);
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (void)writeQALog:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:&__block_literal_global_79130];
  [v5 writeQALog:v4];
}

- (void)notifyLibraryAvailableAtURLForMediaanalysisd:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Notifying mediaanalysisd of photo library available at %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediaanalysisd.analysis" options:0];
  id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECB6DB8];
  [v4 setRemoteObjectInterface:v5];

  [v4 resume];
  id v6 = [v4 _unboostingRemoteObjectProxy];
  [v6 notifyLibraryAvailableAtURL:v3];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Invalidating temporary connection to mediaanalysisd", (uint8_t *)&v7, 2u);
  }
  [v4 invalidate];
}

- (void)notifyLibraryAvailableAtURLForPhotoanalysisd:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLPhotoAnalysisServiceClient.m", 132, @"Invalid parameter not satisfying: %@", @"libraryURL" object file lineNumber description];

    id v5 = 0;
  }
  if (([v5 isEqual:self->_libraryURL] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLPhotoAnalysisServiceClient.m", 133, @"Invalid parameter not satisfying: %@", @"[libraryURL isEqual:_libraryURL]" object file lineNumber description];
  }
  id v6 = [(PLPhotoAnalysisServiceClient *)self xpcConnection];
  int v7 = [v6 _unboostingRemoteObjectProxy];
  [v7 notifyLibraryAvailableAtURL:v10];
}

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__PLPhotoAnalysisServiceClient_cancelOperationsWithIdentifiers_reply___block_invoke;
  v15[3] = &unk_1E58734E8;
  id v8 = v7;
  id v16 = v6;
  id v17 = v8;
  id v9 = v6;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v15];
  uint64_t v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PLPhotoAnalysisServiceClient_cancelOperationsWithIdentifiers_reply___block_invoke_2;
  v13[3] = &unk_1E586F9A0;
  id v14 = v8;
  id v12 = v8;
  [v10 cancelOperationsWithIdentifiers:v9 context:v11 reply:v13];
}

void __70__PLPhotoAnalysisServiceClient_cancelOperationsWithIdentifiers_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "setObject:forKey:", v3, *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __70__PLPhotoAnalysisServiceClient_cancelOperationsWithIdentifiers_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)dumpAnalysisStatusError:(id *)a3
{
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__79150;
  uint64_t v21 = __Block_byref_object_dispose__79151;
  id v22 = 0;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__79150;
  uint64_t v15 = __Block_byref_object_dispose__79151;
  id v16 = 0;
  id v4 = [(PLPhotoAnalysisServiceClient *)self executiveService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PLPhotoAnalysisServiceClient_dumpAnalysisStatusError___block_invoke;
  v10[3] = &unk_1E5874CF8;
  v10[4] = &v17;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__PLPhotoAnalysisServiceClient_dumpAnalysisStatusError___block_invoke_2;
  v9[3] = &unk_1E5874D48;
  v9[4] = &v17;
  v9[5] = &v11;
  [v5 requestAnalysisStatusWithReply:v9];

  if (a3)
  {
    uint64_t v6 = (void *)v18[5];
    if (v6) {
      *a3 = v6;
    }
  }
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __56__PLPhotoAnalysisServiceClient_dumpAnalysisStatusError___block_invoke(uint64_t a1, void *a2)
{
}

void __56__PLPhotoAnalysisServiceClient_dumpAnalysisStatusError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (int)photoanalysisdPid
{
  v2 = [(PLPhotoAnalysisServiceClient *)self xpcConnection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PLPhotoAnalysisServiceClient;
  [(PLPhotoAnalysisServiceClient *)&v3 dealloc];
}

- (PLPhotoAnalysisServiceClient)initWithLibraryURL:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLPhotoAnalysisServiceClient.m", 68, @"Invalid parameter not satisfying: %@", @"libraryURL" object file lineNumber description];
  }
  id v7 = [v6 path];
  int v8 = [v7 hasPrefix:@"/var/mobile/Media/PhotoData"];

  if (v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLPhotoAnalysisServiceClient.m", 69, @"Invalid parameter not satisfying: %@", @"![libraryURL.path hasPrefix:@\"/var/mobile/Media/PhotoData\"]" object file lineNumber description];

    if (!v6) {
      goto LABEL_8;
    }
  }
  else if (!v6)
  {
LABEL_8:

    self = 0;
    goto LABEL_9;
  }
  v19.receiver = self;
  v19.super_class = (Class)PLPhotoAnalysisServiceClient;
  uint64_t v9 = [(PLPhotoAnalysisServiceClient *)&v19 init];
  self = v9;
  if (!v9) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v9->_libraryURL, a3);
  uint64_t v20 = @"PHPhotoAnalysisOptionPhotoLibraryURLKey";
  long long v10 = [(NSURL *)self->_libraryURL absoluteString];
  v21[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  cachedRequestContextDictionary = self->_cachedRequestContextDictionary;
  self->_cachedRequestContextDictionary = v11;

  uint64_t v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  id v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photoanalysis.PLPhotoAnalysisServiceClient.backgroundQueue", v13);
  backgroundQueue = self->_backgroundQueue;
  self->_backgroundQueue = v14;

  self->_connectionLock._os_unfair_lock_opaque = 0;
LABEL_9:

  return self;
}

- (PLPhotoAnalysisServiceClient)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLPhotoAnalysisServiceClient.m" lineNumber:62 description:@"Invalid initialization"];

  return 0;
}

- (id)wallpaperService
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  id v4 = [(PLPhotoAnalysisServiceClient *)self _xpcConnection];
  id v5 = self->_wallpaperService;
  os_unfair_lock_unlock(p_connectionLock);
  return v5;
}

- (id)executiveService
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  id v4 = [(PLPhotoAnalysisServiceClient *)self _xpcConnection];
  id v5 = self->_executiveService;
  os_unfair_lock_unlock(p_connectionLock);
  return v5;
}

- (id)testService
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  id v4 = [(PLPhotoAnalysisServiceClient *)self _xpcConnection];
  id v5 = self->_testService;
  os_unfair_lock_unlock(p_connectionLock);
  return v5;
}

- (id)momentGraphService
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  id v4 = [(PLPhotoAnalysisServiceClient *)self _xpcConnection];
  id v5 = self->_momentGraphService;
  os_unfair_lock_unlock(p_connectionLock);
  return v5;
}

- (id)photoLibraryService
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  id v4 = [(PLPhotoAnalysisServiceClient *)self _xpcConnection];
  id v5 = self->_photoLibraryService;
  os_unfair_lock_unlock(p_connectionLock);
  return v5;
}

- (void)cacheCPAnalyticsPropertiesWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PLPhotoAnalysisServiceClient_Job__cacheCPAnalyticsPropertiesWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PLPhotoAnalysisServiceClient_Job__cacheCPAnalyticsPropertiesWithReply___block_invoke_2;
  v9[3] = &unk_1E5874DE8;
  id v10 = v6;
  id v8 = v6;
  [v7 cacheCPAnalyticsPropertiesWithContext:v5 reply:v9];
}

uint64_t __73__PLPhotoAnalysisServiceClient_Job__cacheCPAnalyticsPropertiesWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __73__PLPhotoAnalysisServiceClient_Job__cacheCPAnalyticsPropertiesWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)recordFeatureUsageFromCounts:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PLPhotoAnalysisServiceClient_Job__recordFeatureUsageFromCounts_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PLPhotoAnalysisServiceClient_Job__recordFeatureUsageFromCounts_reply___block_invoke_2;
  v12[3] = &unk_1E5874DE8;
  id v13 = v9;
  id v11 = v9;
  [v10 recordFeatureUsageFromCounts:v7 context:v8 reply:v12];
}

uint64_t __72__PLPhotoAnalysisServiceClient_Job__recordFeatureUsageFromCounts_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Job__recordFeatureUsageFromCounts_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)reloadAlbumWidgetTimelineWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__PLPhotoAnalysisServiceClient_Job__reloadAlbumWidgetTimelineWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PLPhotoAnalysisServiceClient_Job__reloadAlbumWidgetTimelineWithReply___block_invoke_2;
  v9[3] = &unk_1E5874DE8;
  id v10 = v6;
  id v8 = v6;
  [v7 reloadAlbumWidgetTimelineWithContext:v5 reply:v9];
}

uint64_t __72__PLPhotoAnalysisServiceClient_Job__reloadAlbumWidgetTimelineWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Job__reloadAlbumWidgetTimelineWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)reloadForYouWidgetTimelineWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PLPhotoAnalysisServiceClient_Job__reloadForYouWidgetTimelineWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PLPhotoAnalysisServiceClient_Job__reloadForYouWidgetTimelineWithReply___block_invoke_2;
  v9[3] = &unk_1E5874DE8;
  id v10 = v6;
  id v8 = v6;
  [v7 reloadForYouWidgetTimelineWithContext:v5 reply:v9];
}

uint64_t __73__PLPhotoAnalysisServiceClient_Job__reloadForYouWidgetTimelineWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __73__PLPhotoAnalysisServiceClient_Job__reloadForYouWidgetTimelineWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestGraphModelResultWithOptions:(id)a3 progress:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__PLPhotoAnalysisServiceClient_Graph__requestGraphModelResultWithOptions_progress_reply___block_invoke;
  v20[3] = &unk_1E5874D70;
  id v9 = v8;
  id v21 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v20];
  id v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  [v10 becomeCurrentWithPendingUnitCount:1];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __89__PLPhotoAnalysisServiceClient_Graph__requestGraphModelResultWithOptions_progress_reply___block_invoke_2;
  char v18 = &unk_1E5874D98;
  id v19 = v9;
  id v14 = v9;
  [v12 requestGraphModelResultWithOptions:v11 context:v13 reply:&v15];

  objc_msgSend(v10, "resignCurrent", v15, v16, v17, v18);
}

uint64_t __89__PLPhotoAnalysisServiceClient_Graph__requestGraphModelResultWithOptions_progress_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__PLPhotoAnalysisServiceClient_Graph__requestGraphModelResultWithOptions_progress_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runPerformanceTest:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PLPhotoAnalysisServiceClient_Graph__runPerformanceTest_options_reply___block_invoke;
  v17[3] = &unk_1E5874D70;
  id v9 = v8;
  id v18 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PLPhotoAnalysisServiceClient_Graph__runPerformanceTest_options_reply___block_invoke_2;
  v15[3] = &unk_1E5874DE8;
  id v16 = v9;
  id v14 = v9;
  [v12 runPerformanceTest:v11 options:v10 context:v13 reply:v15];
}

uint64_t __72__PLPhotoAnalysisServiceClient_Graph__runPerformanceTest_options_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Graph__runPerformanceTest_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)requestEnergyStatusWithError:(id *)a3
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int64_t v23 = __Block_byref_object_copy__112046;
  id v24 = __Block_byref_object_dispose__112047;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__112046;
  id v18 = __Block_byref_object_dispose__112047;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PLPhotoAnalysisServiceClient_Graph__requestEnergyStatusWithError___block_invoke;
  v13[3] = &unk_1E5874CF8;
  void v13[4] = &v20;
  id v5 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  id v6 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PLPhotoAnalysisServiceClient_Graph__requestEnergyStatusWithError___block_invoke_2;
  v12[3] = &unk_1E5875100;
  void v12[4] = &v14;
  [v5 requestEnergyStatusWithContext:v6 reply:v12];

  id v7 = (void *)v21[5];
  id v8 = v7;
  id v9 = v8;
  if (v7 && a3) {
    *a3 = v8;
  }

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __68__PLPhotoAnalysisServiceClient_Graph__requestEnergyStatusWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __68__PLPhotoAnalysisServiceClient_Graph__requestEnergyStatusWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)exportWallpaperForAssets:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__PLPhotoAnalysisServiceClient_Graph__exportWallpaperForAssets_options_reply___block_invoke;
  v17[3] = &unk_1E5874D70;
  id v9 = v8;
  id v18 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v17];
  id v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PLPhotoAnalysisServiceClient_Graph__exportWallpaperForAssets_options_reply___block_invoke_2;
  v15[3] = &unk_1E5874DE8;
  id v16 = v9;
  id v14 = v9;
  [v12 exportWallpaperForAssets:v11 options:v10 context:v13 reply:v15];
}

uint64_t __78__PLPhotoAnalysisServiceClient_Graph__exportWallpaperForAssets_options_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __78__PLPhotoAnalysisServiceClient_Graph__exportWallpaperForAssets_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestWallpaperProperties:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__PLPhotoAnalysisServiceClient_Graph__requestWallpaperProperties_options_reply___block_invoke;
  v17[3] = &unk_1E5874D70;
  id v9 = v8;
  id v18 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v17];
  id v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PLPhotoAnalysisServiceClient_Graph__requestWallpaperProperties_options_reply___block_invoke_2;
  v15[3] = &unk_1E5874D98;
  id v16 = v9;
  id v14 = v9;
  [v12 requestWallpaperPropertiesForAssets:v11 options:v10 context:v13 reply:v15];
}

uint64_t __80__PLPhotoAnalysisServiceClient_Graph__requestWallpaperProperties_options_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __80__PLPhotoAnalysisServiceClient_Graph__requestWallpaperProperties_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestPeopleForWallpaperSuggestionsWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestPeopleForWallpaperSuggestionsWithOptions_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v7 = v6;
  id v15 = v7;
  id v8 = a3;
  id v9 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  id v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestPeopleForWallpaperSuggestionsWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E5874D98;
  id v13 = v7;
  id v11 = v7;
  [v9 requestPeopleForWallpaperSuggestionsWithOptions:v8 context:v10 reply:v12];
}

uint64_t __93__PLPhotoAnalysisServiceClient_Graph__requestPeopleForWallpaperSuggestionsWithOptions_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __93__PLPhotoAnalysisServiceClient_Graph__requestPeopleForWallpaperSuggestionsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)reloadWallpaperSuggestions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PLPhotoAnalysisServiceClient_Graph__reloadWallpaperSuggestions_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v7 = v6;
  id v15 = v7;
  id v8 = a3;
  id v9 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  id v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PLPhotoAnalysisServiceClient_Graph__reloadWallpaperSuggestions_reply___block_invoke_2;
  v12[3] = &unk_1E5874DE8;
  id v13 = v7;
  id v11 = v7;
  [v9 reloadWallpaperSuggestionsWithSuggestionUUIDs:v8 context:v10 reply:v12];
}

uint64_t __72__PLPhotoAnalysisServiceClient_Graph__reloadWallpaperSuggestions_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __72__PLPhotoAnalysisServiceClient_Graph__reloadWallpaperSuggestions_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)requestNightlySuggestionsForPosterConfiguration:(id)a3 atDate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__112046;
  uint64_t v33 = __Block_byref_object_dispose__112047;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__112046;
  v27 = __Block_byref_object_dispose__112047;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__112046;
  id v21 = __Block_byref_object_dispose__112047;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestNightlySuggestionsForPosterConfiguration_atDate_error___block_invoke;
  v16[3] = &unk_1E5874CF8;
  v16[4] = &v29;
  id v10 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestNightlySuggestionsForPosterConfiguration_atDate_error___block_invoke_2;
  v15[3] = &unk_1E5874D48;
  void v15[4] = &v17;
  v15[5] = &v23;
  [v10 requestNightlySuggestionsForPosterConfiguration:v8 atDate:v9 context:v11 reply:v15];

  if (a5)
  {
    id v12 = (void *)v30[5];
    if (!v12) {
      id v12 = (void *)v24[5];
    }
    *a5 = v12;
  }
  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

void __100__PLPhotoAnalysisServiceClient_Graph__requestNightlySuggestionsForPosterConfiguration_atDate_error___block_invoke(uint64_t a1, void *a2)
{
}

void __100__PLPhotoAnalysisServiceClient_Graph__requestNightlySuggestionsForPosterConfiguration_atDate_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v5 = v4;
  id v12 = v5;
  id v6 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply___block_invoke_2;
  v9[3] = &unk_1E5874DE8;
  id v10 = v5;
  id v8 = v5;
  [v6 requestReprocessSuggestionsOnLibraryScopeRulesChangeWithContext:v7 reply:v9];
}

uint64_t __101__PLPhotoAnalysisServiceClient_Graph__requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __101__PLPhotoAnalysisServiceClient_Graph__requestReprocessSuggestionsOnLibraryScopeRulesChangeWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID:(id)a3 withOptions:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __121__PLPhotoAnalysisServiceClient_Graph__asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_reply___block_invoke;
  v17[3] = &unk_1E5874D70;
  id v12 = v8;
  id v18 = v12;
  id v13 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __121__PLPhotoAnalysisServiceClient_Graph__asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_reply___block_invoke_2;
  v15[3] = &unk_1E5874D98;
  id v16 = v12;
  id v14 = v12;
  [v13 requestCameraSmartSharingProcessingForLibraryScopeWithUUID:v10 withOptions:v9 context:v11 reply:v15];
}

uint64_t __121__PLPhotoAnalysisServiceClient_Graph__asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __121__PLPhotoAnalysisServiceClient_Graph__asyncRequestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)requestCameraSmartSharingProcessingForLibraryScopeWithUUID:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__112046;
  uint64_t v33 = __Block_byref_object_dispose__112047;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__112046;
  v27 = __Block_byref_object_dispose__112047;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__112046;
  id v21 = __Block_byref_object_dispose__112047;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __116__PLPhotoAnalysisServiceClient_Graph__requestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_error___block_invoke;
  v16[3] = &unk_1E5874CF8;
  v16[4] = &v29;
  id v10 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116__PLPhotoAnalysisServiceClient_Graph__requestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_error___block_invoke_2;
  v15[3] = &unk_1E5874D48;
  void v15[4] = &v17;
  v15[5] = &v23;
  [v10 requestCameraSmartSharingProcessingForLibraryScopeWithUUID:v8 withOptions:v9 context:v11 reply:v15];

  if (a5)
  {
    id v12 = (void *)v30[5];
    if (!v12) {
      id v12 = (void *)v24[5];
    }
    *a5 = v12;
  }
  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

void __116__PLPhotoAnalysisServiceClient_Graph__requestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __116__PLPhotoAnalysisServiceClient_Graph__requestCameraSmartSharingProcessingForLibraryScopeWithUUID_withOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)requestStartSharedLibrarySuggestionResultWithError:(id *)a3
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__112046;
  id v26 = __Block_byref_object_dispose__112047;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__112046;
  uint64_t v20 = __Block_byref_object_dispose__112047;
  id v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestStartSharedLibrarySuggestionResultWithError___block_invoke;
  v11[3] = &unk_1E5874CF8;
  void v11[4] = &v22;
  id v5 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  id v6 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestStartSharedLibrarySuggestionResultWithError___block_invoke_2;
  v10[3] = &unk_1E5874ED8;
  v10[4] = &v16;
  void v10[5] = &v12;
  [v5 requestStartSharedLibrarySuggestionResultWithContext:v6 reply:v10];

  if (a3)
  {
    uint64_t v7 = (void *)v23[5];
    if (!v7) {
      uint64_t v7 = (void *)v17[5];
    }
    *a3 = v7;
  }
  char v8 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v8;
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestStartSharedLibrarySuggestionResultWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestStartSharedLibrarySuggestionResultWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__112046;
  uint64_t v33 = __Block_byref_object_dispose__112047;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__112046;
  id v27 = __Block_byref_object_dispose__112047;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__112046;
  id v21 = __Block_byref_object_dispose__112047;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __121__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke;
  v16[3] = &unk_1E5874CF8;
  v16[4] = &v29;
  id v10 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __121__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke_2;
  v15[3] = &unk_1E5874D20;
  void v15[4] = &v17;
  v15[5] = &v23;
  [v10 requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers:v8 withOptions:v9 context:v11 reply:v15];

  if (a5)
  {
    uint64_t v12 = (void *)v30[5];
    if (!v12) {
      uint64_t v12 = (void *)v24[5];
    }
    *a5 = v12;
  }
  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

void __121__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __121__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMomentLocalIdentifiersForPersonLocalIdentifiers_withOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  uint64_t v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __119__PLPhotoAnalysisServiceClient_Graph__requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke;
  v16[3] = &unk_1E5874CF8;
  v16[4] = &v27;
  id v10 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __119__PLPhotoAnalysisServiceClient_Graph__requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke_2;
  v15[3] = &unk_1E5874ED8;
  void v15[4] = &v17;
  v15[5] = &v21;
  [v10 requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier:v8 withOptions:v9 context:v11 reply:v15];

  if (a5)
  {
    uint64_t v12 = (void *)v28[5];
    if (!v12) {
      uint64_t v12 = (void *)v22[5];
    }
    *a5 = v12;
  }
  char v13 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v13;
}

void __119__PLPhotoAnalysisServiceClient_Graph__requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __119__PLPhotoAnalysisServiceClient_Graph__requestGenerateDefaultRulesForLibraryScopeWithLocalIdentifier_withOptions_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v7 = v6;
  id v15 = v7;
  id v8 = a3;
  id v9 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  id v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_reply___block_invoke_2;
  v12[3] = &unk_1E5874DE8;
  id v13 = v7;
  id v11 = v7;
  [v9 requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs:v8 context:v10 reply:v12];
}

uint64_t __108__PLPhotoAnalysisServiceClient_Graph__requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __108__PLPhotoAnalysisServiceClient_Graph__requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__112046;
  uint64_t v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __114__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  id v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __114__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke_2;
  v11[3] = &unk_1E5874D20;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v7 requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:v6 context:v8 reply:v11];

  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __114__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __114__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__112046;
  uint64_t v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __116__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __116__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke_2;
  v11[3] = &unk_1E5874D20;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v7 requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier:v6 context:v8 reply:v11];

  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __116__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __116__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersWithinLocationRadiusOfAssetLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestMeaningScoreDebugDescriptionForMomentLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__112046;
  uint64_t v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_error___block_invoke_2;
  v11[3] = &unk_1E5874E10;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v7 requestMeaningScoreDebugDescriptionForMomentLocalIdentifier:v6 context:v8 reply:v11];

  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __105__PLPhotoAnalysisServiceClient_Graph__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __105__PLPhotoAnalysisServiceClient_Graph__requestMeaningScoreDebugDescriptionForMomentLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestAssetLocalIdentifiersByCityNameWithError:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__112046;
  uint64_t v21 = __Block_byref_object_dispose__112047;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__112046;
  uint64_t v15 = __Block_byref_object_dispose__112047;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersByCityNameWithError___block_invoke;
  v10[3] = &unk_1E5874CF8;
  v10[4] = &v17;
  id v5 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v6 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersByCityNameWithError___block_invoke_2;
  v9[3] = &unk_1E5874D48;
  void v9[4] = &v11;
  v9[5] = &v17;
  [v5 requestAssetLocalIdentifiersByCityNameWithContext:v6 reply:v9];

  if (a3) {
    *a3 = (id) v18[5];
  }
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __87__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersByCityNameWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __87__PLPhotoAnalysisServiceClient_Graph__requestAssetLocalIdentifiersByCityNameWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestConfidenceByMomentLocalIdentifierForMeaning:(id)a3 useAlternativeMeaningEdge:(BOOL)a4 onlyHighPrecision:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__112046;
  uint64_t v27 = __Block_byref_object_dispose__112047;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__112046;
  uint64_t v21 = __Block_byref_object_dispose__112047;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __140__PLPhotoAnalysisServiceClient_Graph__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_error___block_invoke;
  v16[3] = &unk_1E5874CF8;
  v16[4] = &v23;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __140__PLPhotoAnalysisServiceClient_Graph__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_error___block_invoke_2;
  v15[3] = &unk_1E5874D48;
  void v15[4] = &v17;
  v15[5] = &v23;
  [v11 requestConfidenceByMomentLocalIdentifierForMeaning:v10 useAlternativeMeaningEdge:v8 onlyHighPrecision:v7 context:v12 reply:v15];

  if (a6) {
    *a6 = (id) v24[5];
  }
  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __140__PLPhotoAnalysisServiceClient_Graph__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_error___block_invoke(uint64_t a1, void *a2)
{
}

void __140__PLPhotoAnalysisServiceClient_Graph__requestConfidenceByMomentLocalIdentifierForMeaning_useAlternativeMeaningEdge_onlyHighPrecision_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestUtilityAssetLocalIdentifiersWithError:(id *)a3
{
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__112046;
  uint64_t v21 = __Block_byref_object_dispose__112047;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__112046;
  uint64_t v15 = __Block_byref_object_dispose__112047;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetLocalIdentifiersWithError___block_invoke;
  v10[3] = &unk_1E5874CF8;
  v10[4] = &v17;
  id v5 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v6 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetLocalIdentifiersWithError___block_invoke_2;
  v9[3] = &unk_1E5874D48;
  void v9[4] = &v11;
  v9[5] = &v17;
  [v5 requestUtilityAssetLocalIdentifiersWithContext:v6 reply:v9];

  if (a3) {
    *a3 = (id) v18[5];
  }
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __84__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetLocalIdentifiersWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __84__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetLocalIdentifiersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestTrendsByIdentifierWithCadence:(id)a3 forYear:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestTrendsByIdentifierWithCadence_forYear_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  uint64_t v9 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  id v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestTrendsByIdentifierWithCadence_forYear_error___block_invoke_2;
  v13[3] = &unk_1E5874D48;
  void v13[4] = &v15;
  void v13[5] = &v21;
  [v9 requestTrendsByIdentifierWithCadence:v8 forYear:a4 context:v10 reply:v13];

  if (a5) {
    *a5 = (id) v22[5];
  }
  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestTrendsByIdentifierWithCadence_forYear_error___block_invoke(uint64_t a1, void *a2)
{
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestTrendsByIdentifierWithCadence_forYear_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__112046;
  uint64_t v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__PLPhotoAnalysisServiceClient_Graph__requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __107__PLPhotoAnalysisServiceClient_Graph__requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier_error___block_invoke_2;
  v11[3] = &unk_1E5874D20;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v7 requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier:v6 context:v8 reply:v11];

  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __107__PLPhotoAnalysisServiceClient_Graph__requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __107__PLPhotoAnalysisServiceClient_Graph__requestUpNextAssetLocalIdentifiersForAssetWithLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestKeyAssetLocalIdentifierForPrototypeCategory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__112046;
  uint64_t v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestKeyAssetLocalIdentifierForPrototypeCategory_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestKeyAssetLocalIdentifierForPrototypeCategory_error___block_invoke_2;
  v11[3] = &unk_1E5874E10;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v7 requestKeyAssetLocalIdentifierForPrototypeCategory:v6 context:v8 reply:v11];

  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestKeyAssetLocalIdentifierForPrototypeCategory_error___block_invoke(uint64_t a1, void *a2)
{
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestKeyAssetLocalIdentifierForPrototypeCategory_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestUpNextMemoryLocalIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  id v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  id v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v7 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestUpNextMemoriesWithOptions", "", buf, 2u);
  }

  uint64_t v11 = mach_absolute_time();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestUpNextMemoryLocalIdentifiersWithOptions_error___block_invoke;
  v22[3] = &unk_1E5874CF8;
  v22[4] = &v30;
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v22];
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestUpNextMemoryLocalIdentifiersWithOptions_error___block_invoke_2;
  v21[3] = &unk_1E5874D48;
  v21[4] = &v24;
  v21[5] = &v30;
  [v12 requestUpNextMemoriesWithOptions:v6 context:v13 reply:v21];

  uint64_t v14 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v17 = v10;
  id v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v8, "RequestUpNextMemoriesWithOptions", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "RequestUpNextMemoriesWithOptions";
    __int16 v38 = 2048;
    double v39 = (float)((float)((float)((float)(v14 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (a4) {
    *a4 = (id) v31[5];
  }
  id v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v19;
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestUpNextMemoryLocalIdentifiersWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestUpNextMemoryLocalIdentifiersWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestDiscoveryFeedItemsWithOptions:(id)a3 generationSessionState:(id *)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v38 = 0;
  double v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__112046;
  v42 = __Block_byref_object_dispose__112047;
  id v43 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__112046;
  v36 = __Block_byref_object_dispose__112047;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__112046;
  uint64_t v30 = __Block_byref_object_dispose__112047;
  id v31 = 0;
  uint64_t v9 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v11 = v9;
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RequestDiscoveryFeedItemsWithOptions", "", buf, 2u);
  }

  uint64_t v13 = mach_absolute_time();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestDiscoveryFeedItemsWithOptions_generationSessionState_error___block_invoke;
  v24[3] = &unk_1E5874CF8;
  v24[4] = &v38;
  uint64_t v14 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v24];
  uint64_t v15 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestDiscoveryFeedItemsWithOptions_generationSessionState_error___block_invoke_2;
  v23[3] = &unk_1E5874F58;
  v23[4] = &v32;
  v23[5] = &v26;
  v23[6] = &v38;
  [v14 requestDiscoveryFeedItemsWithOptions:v8 context:v15 reply:v23];

  uint64_t v16 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v19 = v12;
  id v20 = v19;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v10, "RequestDiscoveryFeedItemsWithOptions", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "RequestDiscoveryFeedItemsWithOptions";
    __int16 v46 = 2048;
    double v47 = (float)((float)((float)((float)(v16 - v13) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (a4) {
    *a4 = (id) v27[5];
  }
  if (a5) {
    *a5 = (id) v39[5];
  }
  id v21 = (id)v33[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v21;
}

void __105__PLPhotoAnalysisServiceClient_Graph__requestDiscoveryFeedItemsWithOptions_generationSessionState_error___block_invoke(uint64_t a1, void *a2)
{
}

void __105__PLPhotoAnalysisServiceClient_Graph__requestDiscoveryFeedItemsWithOptions_generationSessionState_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

- (id)requestPersonalTraitsForAssetsWithUUIDs:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__112046;
  id v37 = __Block_byref_object_dispose__112047;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  id v7 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "requestPersonalTraitsForAssetsWithUUIDs", "", buf, 2u);
  }

  uint64_t v11 = mach_absolute_time();
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self momentGraphService];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForAssetsWithUUIDs_error___block_invoke;
  v25[3] = &unk_1E5874CF8;
  v25[4] = &v33;
  uint64_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForAssetsWithUUIDs_error___block_invoke_2;
  v24[3] = &unk_1E5874D20;
  v24[4] = &v27;
  void v24[5] = &v33;
  [v13 requestPersonalTraitsForAssetUUIDs:v6 operationID:&stru_1EEB2EB80 reply:v24];

  uint64_t v14 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v17 = v10;
  id v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v8, "requestPersonalTraitsForAssetsWithUUIDs", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v40 = "requestPersonalTraitsForAssetsWithUUIDs";
    __int16 v41 = 2048;
    double v42 = (float)((float)((float)((float)(v14 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v19 = (void *)v34[5];
  id v20 = v19;
  id v21 = v20;
  if (v19 && a4) {
    *a4 = v20;
  }

  id v22 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v22;
}

void __85__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForAssetsWithUUIDs_error___block_invoke(uint64_t a1, void *a2)
{
}

void __85__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForAssetsWithUUIDs_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestPersonalTraitsForHighlightsWithUUIDs:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__112046;
  id v37 = __Block_byref_object_dispose__112047;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v7 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "requestPersonalTraitsForHighlightsWithUUIDs", "", buf, 2u);
  }

  uint64_t v11 = mach_absolute_time();
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self momentGraphService];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForHighlightsWithUUIDs_error___block_invoke;
  v25[3] = &unk_1E5874CF8;
  v25[4] = &v33;
  uint64_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __89__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForHighlightsWithUUIDs_error___block_invoke_2;
  v24[3] = &unk_1E5874D20;
  v24[4] = &v27;
  void v24[5] = &v33;
  [v13 requestPersonalTraitsForHighlightUUIDs:v6 operationID:&stru_1EEB2EB80 reply:v24];

  uint64_t v14 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v17 = v10;
  id v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v8, "requestPersonalTraitsForHighlightsWithUUIDs", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v40 = "requestPersonalTraitsForHighlightsWithUUIDs";
    __int16 v41 = 2048;
    double v42 = (float)((float)((float)((float)(v14 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v19 = (void *)v34[5];
  id v20 = v19;
  id v21 = v20;
  if (v19 && a4) {
    *a4 = v20;
  }

  id v22 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v22;
}

void __89__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForHighlightsWithUUIDs_error___block_invoke(uint64_t a1, void *a2)
{
}

void __89__PLPhotoAnalysisServiceClient_Graph__requestPersonalTraitsForHighlightsWithUUIDs_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestGraphMomentLocalIdentifiersWithDateInterval:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__112046;
  id v37 = __Block_byref_object_dispose__112047;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v7 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestGraphInferencesSummaryWithDateInterval", "", buf, 2u);
  }

  uint64_t v11 = mach_absolute_time();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestGraphMomentLocalIdentifiersWithDateInterval_error___block_invoke;
  v25[3] = &unk_1E5874CF8;
  v25[4] = &v33;
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v25];
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestGraphMomentLocalIdentifiersWithDateInterval_error___block_invoke_2;
  v24[3] = &unk_1E5874D20;
  v24[4] = &v27;
  void v24[5] = &v33;
  [v12 requestGraphMomentLocalIdentifiersWithDateInterval:v6 context:v13 reply:v24];

  uint64_t v14 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v17 = v10;
  id v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v8, "RequestGraphInferencesSummaryWithDateInterval", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v40 = "RequestGraphInferencesSummaryWithDateInterval";
    __int16 v41 = 2048;
    double v42 = (float)((float)((float)((float)(v14 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v19 = (void *)v34[5];
  id v20 = v19;
  id v21 = v20;
  if (v19 && a4) {
    *a4 = v20;
  }

  id v22 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v22;
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestGraphMomentLocalIdentifiersWithDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestGraphMomentLocalIdentifiersWithDateInterval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestGraphInferencesSummaryWithMomentLocalIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__112046;
  id v37 = __Block_byref_object_dispose__112047;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v7 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestGraphInferencesSummaryWithDateInterval", "", buf, 2u);
  }

  uint64_t v11 = mach_absolute_time();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithMomentLocalIdentifiers_error___block_invoke;
  v25[3] = &unk_1E5874CF8;
  v25[4] = &v33;
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v25];
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithMomentLocalIdentifiers_error___block_invoke_2;
  v24[3] = &unk_1E5874D48;
  v24[4] = &v27;
  void v24[5] = &v33;
  [v12 requestGraphInferencesSummaryWithMomentLocalIdentifiers:v6 context:v13 reply:v24];

  uint64_t v14 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v17 = v10;
  id v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v8, "RequestGraphInferencesSummaryWithDateInterval", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v40 = "RequestGraphInferencesSummaryWithDateInterval";
    __int16 v41 = 2048;
    double v42 = (float)((float)((float)((float)(v14 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v19 = (void *)v34[5];
  id v20 = v19;
  id v21 = v20;
  if (v19 && a4) {
    *a4 = v20;
  }

  id v22 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v22;
}

void __101__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithMomentLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
}

void __101__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithMomentLocalIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestGraphInferencesSummaryWithDateInterval:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__112046;
  id v37 = __Block_byref_object_dispose__112047;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v7 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestGraphInferencesSummaryWithDateInterval", "", buf, 2u);
  }

  uint64_t v11 = mach_absolute_time();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __91__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithDateInterval_error___block_invoke;
  v25[3] = &unk_1E5874CF8;
  v25[4] = &v33;
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v25];
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __91__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithDateInterval_error___block_invoke_2;
  v24[3] = &unk_1E5874D48;
  v24[4] = &v27;
  void v24[5] = &v33;
  [v12 requestGraphInferencesSummaryWithDateInterval:v6 context:v13 reply:v24];

  uint64_t v14 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v17 = v10;
  id v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v8, "RequestGraphInferencesSummaryWithDateInterval", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v40 = "RequestGraphInferencesSummaryWithDateInterval";
    __int16 v41 = 2048;
    double v42 = (float)((float)((float)((float)(v14 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v19 = (void *)v34[5];
  id v20 = v19;
  id v21 = v20;
  if (v19 && a4) {
    *a4 = v20;
  }

  id v22 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v22;
}

void __91__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
}

void __91__PLPhotoAnalysisServiceClient_Graph__requestGraphInferencesSummaryWithDateInterval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSuggestedMePersonIdentifierWithError:(id *)a3
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__112046;
  id v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__112046;
  uint64_t v16 = __Block_byref_object_dispose__112047;
  id v17 = 0;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMePersonIdentifierWithError___block_invoke;
  v11[3] = &unk_1E5874CF8;
  void v11[4] = &v18;
  id v6 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMePersonIdentifierWithError___block_invoke_2;
  v10[3] = &unk_1E5874E10;
  v10[4] = &v24;
  void v10[5] = &v12;
  [v6 requestInferredMePersonLocalIdentifierWithErrorForContext:v5 reply:v10];

  if (a3)
  {
    uint64_t v7 = (void *)v19[5];
    if (!v7) {
      uint64_t v7 = (void *)v13[5];
    }
    *a3 = v7;
  }
  id v8 = (id)v25[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v8;
}

void __83__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMePersonIdentifierWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __83__PLPhotoAnalysisServiceClient_Graph__requestSuggestedMePersonIdentifierWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestComposabilityScoresOfAssetsForLocalIdentifiers:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__112046;
  id v37 = __Block_byref_object_dispose__112047;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v10 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = v10;
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "RequestComposabilityScores", "", buf, 2u);
  }

  uint64_t v14 = mach_absolute_time();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __107__PLPhotoAnalysisServiceClient_Graph__requestComposabilityScoresOfAssetsForLocalIdentifiers_options_error___block_invoke;
  v25[3] = &unk_1E5874CF8;
  v25[4] = &v33;
  uint64_t v15 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v25];
  uint64_t v16 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __107__PLPhotoAnalysisServiceClient_Graph__requestComposabilityScoresOfAssetsForLocalIdentifiers_options_error___block_invoke_2;
  v24[3] = &unk_1E5874D48;
  v24[4] = &v27;
  void v24[5] = &v33;
  [v15 requestComposabilityScoresOfAssetsForLocalIdentifiers:v8 options:v9 context:v16 reply:v24];

  uint64_t v17 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v20 = v13;
  id v21 = v20;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_INTERVAL_END, v11, "RequestComposabilityScores", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v40 = "RequestComposabilityScores";
    __int16 v41 = 2048;
    double v42 = (float)((float)((float)((float)(v17 - v14) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (a5) {
    *a5 = (id) v34[5];
  }
  id v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v22;
}

void __107__PLPhotoAnalysisServiceClient_Graph__requestComposabilityScoresOfAssetsForLocalIdentifiers_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __107__PLPhotoAnalysisServiceClient_Graph__requestComposabilityScoresOfAssetsForLocalIdentifiers_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSuggestedPersonsWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  uint64_t v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v7 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestSuggestedPersonsWithOptions", "", buf, 2u);
  }

  uint64_t v11 = mach_absolute_time();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__PLPhotoAnalysisServiceClient_Graph__requestSuggestedPersonsWithOptions_error___block_invoke;
  v22[3] = &unk_1E5874CF8;
  v22[4] = &v30;
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v22];
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __80__PLPhotoAnalysisServiceClient_Graph__requestSuggestedPersonsWithOptions_error___block_invoke_2;
  v21[3] = &unk_1E5874D20;
  v21[4] = &v24;
  v21[5] = &v30;
  [v12 requestSuggestedPersonsWithOptions:v6 context:v13 reply:v21];

  uint64_t v14 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v17 = v10;
  uint64_t v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v8, "RequestSuggestedPersonsWithOptions", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v37 = "RequestSuggestedPersonsWithOptions";
    __int16 v38 = 2048;
    double v39 = (float)((float)((float)((float)(v14 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (a4) {
    *a4 = (id) v31[5];
  }
  id v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v19;
}

void __80__PLPhotoAnalysisServiceClient_Graph__requestSuggestedPersonsWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __80__PLPhotoAnalysisServiceClient_Graph__requestSuggestedPersonsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestRelationshipInferencesForPersonLocalIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  uint64_t v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v7 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RequestRelationshipInferencesForPersonLocalIdentifiers", "", buf, 2u);
  }

  uint64_t v11 = mach_absolute_time();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestRelationshipInferencesForPersonLocalIdentifiers_error___block_invoke;
  v22[3] = &unk_1E5874CF8;
  v22[4] = &v30;
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v22];
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestRelationshipInferencesForPersonLocalIdentifiers_error___block_invoke_2;
  v21[3] = &unk_1E5874D48;
  v21[4] = &v24;
  v21[5] = &v30;
  [v12 requestRelationshipInferencesForPersonLocalIdentifiers:v6 context:v13 reply:v21];

  if (a4) {
    *a4 = (id) v31[5];
  }
  uint64_t v14 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v17 = v10;
  uint64_t v18 = v17;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v8, "RequestRelationshipInferencesForPersonLocalIdentifiers", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v37 = "RequestRelationshipInferencesForPersonLocalIdentifiers";
    __int16 v38 = 2048;
    double v39 = (float)((float)((float)((float)(v14 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v19;
}

void __100__PLPhotoAnalysisServiceClient_Graph__requestRelationshipInferencesForPersonLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
}

void __100__PLPhotoAnalysisServiceClient_Graph__requestRelationshipInferencesForPersonLocalIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  os_signpost_id_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestModelInference:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PLPhotoAnalysisServiceClient_Graph__requestModelInference_options_reply___block_invoke;
  v17[3] = &unk_1E5874D70;
  id v9 = v8;
  id v18 = v9;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v17];
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PLPhotoAnalysisServiceClient_Graph__requestModelInference_options_reply___block_invoke_2;
  v15[3] = &unk_1E5874DE8;
  id v16 = v9;
  id v14 = v9;
  [v12 runModelInferenceForFingerprintVersion:v11 options:v10 context:v13 reply:v15];
}

uint64_t __75__PLPhotoAnalysisServiceClient_Graph__requestModelInference_options_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __75__PLPhotoAnalysisServiceClient_Graph__requestModelInference_options_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestRunShadowEvaluationWithRecipe:(id)a3 models:(id)a4 trialDeploymentID:(id)a5 trialExperimentID:(id)a6 trialTreatmentID:(id)a7 resultBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void))a8;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__112046;
  id v35 = __Block_byref_object_dispose__112047;
  id v36 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__112046;
  id v29 = __Block_byref_object_dispose__112047;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __148__PLPhotoAnalysisServiceClient_Graph__requestRunShadowEvaluationWithRecipe_models_trialDeploymentID_trialExperimentID_trialTreatmentID_resultBlock___block_invoke;
  v24[3] = &unk_1E5874CF8;
  v24[4] = &v31;
  uint64_t v20 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v24];
  id v21 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __148__PLPhotoAnalysisServiceClient_Graph__requestRunShadowEvaluationWithRecipe_models_trialDeploymentID_trialExperimentID_trialTreatmentID_resultBlock___block_invoke_2;
  v23[3] = &unk_1E5874CF8;
  v23[4] = &v25;
  [v20 runShadowEvaluationWithRecipe:v14 models:v15 trialDeploymentID:v16 trialExperimentID:v17 trialTreatmentID:v18 context:v21 resultBlock:v23];

  uint64_t v22 = v26[5];
  if (!v22) {
    uint64_t v22 = v32[5];
  }
  v19[2](v19, v22);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

void __148__PLPhotoAnalysisServiceClient_Graph__requestRunShadowEvaluationWithRecipe_models_trialDeploymentID_trialExperimentID_trialTreatmentID_resultBlock___block_invoke(uint64_t a1, void *a2)
{
}

void __148__PLPhotoAnalysisServiceClient_Graph__requestRunShadowEvaluationWithRecipe_models_trialDeploymentID_trialExperimentID_trialTreatmentID_resultBlock___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)requestRunPFLWithAttachments:(id)a3 recipeUserInfo:(id)a4 resultBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, uint64_t, uint64_t))a5;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__112046;
  __int16 v38 = __Block_byref_object_dispose__112047;
  id v39 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__112046;
  uint64_t v32 = __Block_byref_object_dispose__112047;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__112046;
  uint64_t v26 = __Block_byref_object_dispose__112047;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__112046;
  uint64_t v20 = __Block_byref_object_dispose__112047;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__PLPhotoAnalysisServiceClient_Graph__requestRunPFLWithAttachments_recipeUserInfo_resultBlock___block_invoke;
  v15[3] = &unk_1E5874CF8;
  void v15[4] = &v34;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v15];
  uint64_t v12 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__PLPhotoAnalysisServiceClient_Graph__requestRunPFLWithAttachments_recipeUserInfo_resultBlock___block_invoke_2;
  v14[3] = &unk_1E5874F00;
  void v14[4] = &v22;
  void v14[5] = &v16;
  v14[6] = &v28;
  [v11 requestRunPFLWithAttachments:v8 recipeUserInfo:v9 context:v12 resultBlock:v14];

  uint64_t v13 = v29[5];
  if (!v13) {
    uint64_t v13 = v35[5];
  }
  v10[2](v10, v23[5], v17[5], v13);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

void __95__PLPhotoAnalysisServiceClient_Graph__requestRunPFLWithAttachments_recipeUserInfo_resultBlock___block_invoke(uint64_t a1, void *a2)
{
}

void __95__PLPhotoAnalysisServiceClient_Graph__requestRunPFLWithAttachments_recipeUserInfo_resultBlock___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

- (BOOL)reportMetricsWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PLPhotoAnalysisServiceClient_Graph__reportMetricsWithOptions_error___block_invoke;
  v13[3] = &unk_1E5874CF8;
  void v13[4] = &v24;
  id v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PLPhotoAnalysisServiceClient_Graph__reportMetricsWithOptions_error___block_invoke_2;
  v12[3] = &unk_1E5874ED8;
  void v12[4] = &v14;
  void v12[5] = &v18;
  [v7 reportMetricsWithOptions:v6 context:v8 reply:v12];

  if (a4)
  {
    id v9 = (void *)v25[5];
    if (!v9) {
      id v9 = (void *)v19[5];
    }
    *a4 = v9;
  }
  char v10 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

void __70__PLPhotoAnalysisServiceClient_Graph__reportMetricsWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__PLPhotoAnalysisServiceClient_Graph__reportMetricsWithOptions_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)runCurationWithItems:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__112046;
  uint64_t v26 = __Block_byref_object_dispose__112047;
  id v27 = 0;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__112046;
  uint64_t v20 = __Block_byref_object_dispose__112047;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__PLPhotoAnalysisServiceClient_Graph__runCurationWithItems_options_error___block_invoke;
  v15[3] = &unk_1E5874CF8;
  void v15[4] = &v22;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__PLPhotoAnalysisServiceClient_Graph__runCurationWithItems_options_error___block_invoke_2;
  v14[3] = &unk_1E5874D48;
  void v14[4] = &v16;
  void v14[5] = &v22;
  [v11 runCurationWithItems:v8 options:v9 context:v10 reply:v14];

  if (a5) {
    *a5 = (id) v23[5];
  }
  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __74__PLPhotoAnalysisServiceClient_Graph__runCurationWithItems_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __74__PLPhotoAnalysisServiceClient_Graph__runCurationWithItems_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestCurationScoreByAssetUUIDForAssetUUIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  id v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__112046;
  char v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestCurationScoreByAssetUUIDForAssetUUIDs_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestCurationScoreByAssetUUIDForAssetUUIDs_error___block_invoke_2;
  v11[3] = &unk_1E5874D48;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v8 requestCurationScoreByAssetUUIDForAssetUUIDs:v6 context:v7 reply:v11];

  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestCurationScoreByAssetUUIDForAssetUUIDs_error___block_invoke(uint64_t a1, void *a2)
{
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestCurationScoreByAssetUUIDForAssetUUIDs_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestGeoHashForAssetLocalIdentifiers:(id)a3 geoHashSize:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__112046;
  uint64_t v26 = __Block_byref_object_dispose__112047;
  id v27 = 0;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__112046;
  uint64_t v20 = __Block_byref_object_dispose__112047;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestGeoHashForAssetLocalIdentifiers_geoHashSize_error___block_invoke;
  v15[3] = &unk_1E5874CF8;
  void v15[4] = &v22;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestGeoHashForAssetLocalIdentifiers_geoHashSize_error___block_invoke_2;
  v14[3] = &unk_1E5874D48;
  void v14[4] = &v16;
  void v14[5] = &v22;
  [v11 requestGeoHashForAssetLocalIdentifiers:v8 geoHashSize:v9 context:v10 reply:v14];

  if (a5) {
    *a5 = (id) v23[5];
  }
  id v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestGeoHashForAssetLocalIdentifiers_geoHashSize_error___block_invoke(uint64_t a1, void *a2)
{
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestGeoHashForAssetLocalIdentifiers_geoHashSize_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestIconicSceneScoreForAssetLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  id v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__112046;
  char v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestIconicSceneScoreForAssetLocalIdentifiers_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestIconicSceneScoreForAssetLocalIdentifiers_error___block_invoke_2;
  v11[3] = &unk_1E5874D48;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v8 requestIconicSceneScoreForAssetLocalIdentifiers:v6 context:v7 reply:v11];

  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __93__PLPhotoAnalysisServiceClient_Graph__requestIconicSceneScoreForAssetLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
}

void __93__PLPhotoAnalysisServiceClient_Graph__requestIconicSceneScoreForAssetLocalIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestTextFeaturesForMomentLocalIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  id v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__112046;
  char v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestTextFeaturesForMomentLocalIdentifiers_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__PLPhotoAnalysisServiceClient_Graph__requestTextFeaturesForMomentLocalIdentifiers_error___block_invoke_2;
  v11[3] = &unk_1E5874D48;
  void v11[4] = &v13;
  void v11[5] = &v19;
  [v8 requestTextFeaturesForMomentLocalIdentifiers:v6 context:v7 reply:v11];

  if (a4) {
    *a4 = (id) v20[5];
  }
  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestTextFeaturesForMomentLocalIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
}

void __90__PLPhotoAnalysisServiceClient_Graph__requestTextFeaturesForMomentLocalIdentifiers_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestHighlightDebugInformationForHighlightWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  uint64_t v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestHighlightDebugInformationForHighlightWithLocalIdentifier_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestHighlightDebugInformationForHighlightWithLocalIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E5874D48;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v7 requestHighlightDebugInformationForHighlightWithLocalIdentifier:v6 context:v8 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    char v10 = (void *)v22[5];
    if (!v10) {
      char v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __109__PLPhotoAnalysisServiceClient_Graph__requestHighlightDebugInformationForHighlightWithLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __109__PLPhotoAnalysisServiceClient_Graph__requestHighlightDebugInformationForHighlightWithLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)requestSyndicationLibraryRevGeocodingWithError:(id *)a3
{
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__112046;
  uint64_t v15 = __Block_byref_object_dispose__112047;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__PLPhotoAnalysisServiceClient_Graph__requestSyndicationLibraryRevGeocodingWithError___block_invoke;
  v10[3] = &unk_1E5874CF8;
  v10[4] = &v11;
  id v6 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__PLPhotoAnalysisServiceClient_Graph__requestSyndicationLibraryRevGeocodingWithError___block_invoke_2;
  v9[3] = &unk_1E5874EB0;
  void v9[4] = &v11;
  [v6 requestRevGeocodingSyndicationLibraryWithContext:v5 reply:v9];

  if (a3) {
    *a3 = (id) v12[5];
  }
  BOOL v7 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __86__PLPhotoAnalysisServiceClient_Graph__requestSyndicationLibraryRevGeocodingWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __86__PLPhotoAnalysisServiceClient_Graph__requestSyndicationLibraryRevGeocodingWithError___block_invoke_2(uint64_t a1, int a2, id obj)
{
}

- (BOOL)requestAssetRevGeocodingForAssetLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingForAssetLocalIdentifiers_withError___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v13;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingForAssetLocalIdentifiers_withError___block_invoke_2;
  v11[3] = &unk_1E5874CF8;
  void v11[4] = &v13;
  [v8 requestAssetRevGeocodingForAssetLocalIdentifiers:v6 context:v7 reply:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __98__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingForAssetLocalIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __98__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingForAssetLocalIdentifiers_withError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)requestAssetRevGeocodingWithError:(id *)a3
{
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__112046;
  uint64_t v15 = __Block_byref_object_dispose__112047;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingWithError___block_invoke;
  v10[3] = &unk_1E5874CF8;
  v10[4] = &v11;
  id v6 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingWithError___block_invoke_2;
  v9[3] = &unk_1E5874CF8;
  void v9[4] = &v11;
  [v6 requestAssetRevGeocodingWithContext:v5 reply:v9];

  if (a3) {
    *a3 = (id) v12[5];
  }
  BOOL v7 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __73__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __73__PLPhotoAnalysisServiceClient_Graph__requestAssetRevGeocodingWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)requestHighlightCollectionEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestHighlightCollectionEnrichmentWithOptions_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v13;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__PLPhotoAnalysisServiceClient_Graph__requestHighlightCollectionEnrichmentWithOptions_error___block_invoke_2;
  v11[3] = &unk_1E5874CF8;
  void v11[4] = &v13;
  [v8 requestHighlightCollectionEnrichmentWithOptions:v6 context:v7 reply:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __93__PLPhotoAnalysisServiceClient_Graph__requestHighlightCollectionEnrichmentWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __93__PLPhotoAnalysisServiceClient_Graph__requestHighlightCollectionEnrichmentWithOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)requestEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestEnrichmentWithOptions_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v13;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestEnrichmentWithOptions_error___block_invoke_2;
  v11[3] = &unk_1E5874CF8;
  void v11[4] = &v13;
  [v8 requestEnrichmentWithOptions:v6 context:v7 reply:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __74__PLPhotoAnalysisServiceClient_Graph__requestEnrichmentWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __74__PLPhotoAnalysisServiceClient_Graph__requestEnrichmentWithOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)requestHighlightEnrichmentWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__PLPhotoAnalysisServiceClient_Graph__requestHighlightEnrichmentWithOptions_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v13;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__PLPhotoAnalysisServiceClient_Graph__requestHighlightEnrichmentWithOptions_error___block_invoke_2;
  v11[3] = &unk_1E5874CF8;
  void v11[4] = &v13;
  [v8 requestHighlightEnrichmentWithOptions:v6 context:v7 reply:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __83__PLPhotoAnalysisServiceClient_Graph__requestHighlightEnrichmentWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __83__PLPhotoAnalysisServiceClient_Graph__requestHighlightEnrichmentWithOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)requestSuggestedContributionsForAssetsMetadata:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v37 = 0;
  __int16 v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__112046;
  __int16 v41 = __Block_byref_object_dispose__112047;
  id v42 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__112046;
  id v35 = __Block_byref_object_dispose__112047;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__112046;
  uint64_t v29 = __Block_byref_object_dispose__112047;
  id v30 = 0;
  BOOL v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  id v8 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  char v10 = v8;
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RequestSuggestedContributions", "", buf, 2u);
  }

  uint64_t v12 = mach_absolute_time();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestSuggestedContributionsForAssetsMetadata_error___block_invoke;
  v23[3] = &unk_1E5874CF8;
  v23[4] = &v31;
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestSuggestedContributionsForAssetsMetadata_error___block_invoke_2;
  v22[3] = &unk_1E5874D20;
  v22[4] = &v37;
  void v22[5] = &v25;
  [v13 requestSuggestedContributionsForAssetsMetadata:v6 options:0 context:v7 reply:v22];

  if (a4 && !v38[5])
  {
    uint64_t v14 = (void *)v32[5];
    if (!v14) {
      uint64_t v14 = (void *)v26[5];
    }
    *a4 = v14;
  }
  uint64_t v15 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  id v18 = v11;
  uint64_t v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v9, "RequestSuggestedContributions", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "RequestSuggestedContributions";
    __int16 v45 = 2048;
    double v46 = (float)((float)((float)((float)(v15 - v12) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v20 = (id)v38[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v20;
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestSuggestedContributionsForAssetsMetadata_error___block_invoke(uint64_t a1, void *a2)
{
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestSuggestedContributionsForAssetsMetadata_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  uint64_t v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  char v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v24;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_error___block_invoke_2;
  v16[3] = &unk_1E5874D48;
  v16[4] = &v30;
  void v16[5] = &v18;
  [v11 requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID:v8 options:v9 context:v10 reply:v16];

  uint64_t v12 = (void *)v31[5];
  if (a5 && !v12)
  {
    uint64_t v13 = (void *)v25[5];
    if (!v13) {
      uint64_t v13 = (void *)v19[5];
    }
    *a5 = v13;
    uint64_t v12 = (void *)v31[5];
  }
  id v14 = v12;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v14;
}

void __109__PLPhotoAnalysisServiceClient_Graph__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __109__PLPhotoAnalysisServiceClient_Graph__requestBatchSuggestedRecipientsForMomentUUIDByAssetUUID_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  char v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSuggestedRecipientsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  double v46 = __Block_byref_object_copy__112046;
  uint64_t v47 = __Block_byref_object_dispose__112047;
  id v48 = 0;
  uint64_t v37 = 0;
  __int16 v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__112046;
  __int16 v41 = __Block_byref_object_dispose__112047;
  id v42 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__112046;
  id v35 = __Block_byref_object_dispose__112047;
  id v36 = 0;
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  id v14 = PLPhotoAnalysisQueriesGetLog();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v16 = v14;
  uint64_t v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RequestSuggestedRecipientsForAssetLocalIdentifiers", "", buf, 2u);
  }

  uint64_t v18 = mach_absolute_time();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __127__PLPhotoAnalysisServiceClient_Graph__requestSuggestedRecipientsForAssetLocalIdentifiers_momentLocalIdentifiers_options_error___block_invoke;
  v29[3] = &unk_1E5874CF8;
  v29[4] = &v37;
  uint64_t v19 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v29];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  void v28[2] = __127__PLPhotoAnalysisServiceClient_Graph__requestSuggestedRecipientsForAssetLocalIdentifiers_momentLocalIdentifiers_options_error___block_invoke_2;
  v28[3] = &unk_1E5874D20;
  v28[4] = &v43;
  v28[5] = &v31;
  [v19 requestSuggestedRecipientsForAssetLocalIdentifiers:v10 momentLocalIdentifiers:v11 options:v12 context:v13 reply:v28];

  if (a6 && !v44[5])
  {
    uint64_t v20 = (void *)v38[5];
    if (!v20) {
      uint64_t v20 = (void *)v32[5];
    }
    *a6 = v20;
  }
  uint64_t v21 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v24 = v17;
  uint64_t v25 = v24;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v25, OS_SIGNPOST_INTERVAL_END, v15, "RequestSuggestedRecipientsForAssetLocalIdentifiers", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "RequestSuggestedRecipientsForAssetLocalIdentifiers";
    __int16 v51 = 2048;
    double v52 = (float)((float)((float)((float)(v21 - v18) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v26 = (id)v44[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  return v26;
}

void __127__PLPhotoAnalysisServiceClient_Graph__requestSuggestedRecipientsForAssetLocalIdentifiers_momentLocalIdentifiers_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __127__PLPhotoAnalysisServiceClient_Graph__requestSuggestedRecipientsForAssetLocalIdentifiers_momentLocalIdentifiers_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSnapshotServiceForPeopleCurationResultsWithGraphOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  id v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForPeopleCurationResultsWithGraphOptions_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v13;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForPeopleCurationResultsWithGraphOptions_error___block_invoke_2;
  v11[3] = &unk_1E5874E10;
  void v11[4] = &v19;
  void v11[5] = &v13;
  [v8 requestSnapshotServiceForPeopleCurationResultsWithGraphOptions:v6 context:v7 reply:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  id v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __108__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForPeopleCurationResultsWithGraphOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __108__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForPeopleCurationResultsWithGraphOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSnapshotServiceForRelatedResultsWithGraphOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  id v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedResultsWithGraphOptions_error___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v13;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedResultsWithGraphOptions_error___block_invoke_2;
  v11[3] = &unk_1E5874E10;
  void v11[4] = &v19;
  void v11[5] = &v13;
  [v8 requestSnapshotServiceForRelatedResultsWithGraphOptions:v6 context:v7 reply:v11];

  if (a4) {
    *a4 = (id) v14[5];
  }
  id v9 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __101__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedResultsWithGraphOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __101__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedResultsWithGraphOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)requestTitleForPersonLocalIdentifiers:(id)a3 format:(int64_t)a4 title:(id *)a5 subtitle:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__112046;
  id v35 = __Block_byref_object_dispose__112047;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__112046;
  id v29 = __Block_byref_object_dispose__112047;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  id v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestTitleForPersonLocalIdentifiers_format_title_subtitle_error___block_invoke;
  v18[3] = &unk_1E5874CF8;
  void v18[4] = &v19;
  id v14 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__PLPhotoAnalysisServiceClient_Graph__requestTitleForPersonLocalIdentifiers_format_title_subtitle_error___block_invoke_2;
  v17[3] = &unk_1E5874E88;
  void v17[4] = &v31;
  void v17[5] = &v25;
  v17[6] = &v19;
  [v14 requestTitleForPersonLocalIdentifiers:v12 format:a4 context:v13 reply:v17];

  if (a5) {
    *a5 = (id) v32[5];
  }
  if (a6) {
    *a6 = (id) v26[5];
  }
  if (a7) {
    *a7 = (id) v20[5];
  }
  BOOL v15 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

void __105__PLPhotoAnalysisServiceClient_Graph__requestTitleForPersonLocalIdentifiers_format_title_subtitle_error___block_invoke(uint64_t a1, void *a2)
{
}

void __105__PLPhotoAnalysisServiceClient_Graph__requestTitleForPersonLocalIdentifiers_format_title_subtitle_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void *)(v10 + 40);
  id v11 = (id *)(v10 + 40);
  if (!v12) {
    objc_storeStrong(v11, a4);
  }
}

- (BOOL)requestTitleForAssetCollectionWithLocalIdentifier:(id)a3 format:(int64_t)a4 title:(id *)a5 subtitle:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__112046;
  id v35 = __Block_byref_object_dispose__112047;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__112046;
  id v29 = __Block_byref_object_dispose__112047;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  id v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  id v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __117__PLPhotoAnalysisServiceClient_Graph__requestTitleForAssetCollectionWithLocalIdentifier_format_title_subtitle_error___block_invoke;
  v18[3] = &unk_1E5874CF8;
  void v18[4] = &v19;
  id v14 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __117__PLPhotoAnalysisServiceClient_Graph__requestTitleForAssetCollectionWithLocalIdentifier_format_title_subtitle_error___block_invoke_2;
  v17[3] = &unk_1E5874E88;
  void v17[4] = &v31;
  void v17[5] = &v25;
  v17[6] = &v19;
  [v14 requestTitleForAssetCollectionWithLocalIdentifier:v12 format:a4 context:v13 reply:v17];

  if (a5) {
    *a5 = (id) v32[5];
  }
  if (a6) {
    *a6 = (id) v26[5];
  }
  if (a7) {
    *a7 = (id) v20[5];
  }
  BOOL v15 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

void __117__PLPhotoAnalysisServiceClient_Graph__requestTitleForAssetCollectionWithLocalIdentifier_format_title_subtitle_error___block_invoke(uint64_t a1, void *a2)
{
}

void __117__PLPhotoAnalysisServiceClient_Graph__requestTitleForAssetCollectionWithLocalIdentifier_format_title_subtitle_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void *)(v10 + 40);
  id v11 = (id *)(v10 + 40);
  if (!v12) {
    objc_storeStrong(v11, a4);
  }
}

- (BOOL)requestTitleForCollectionMomentListWithLocalIdentifier:(id)a3 format:(int64_t)a4 title:(id *)a5 subtitle:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__112046;
  id v35 = __Block_byref_object_dispose__112047;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__112046;
  id v29 = __Block_byref_object_dispose__112047;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  id v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  id v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __122__PLPhotoAnalysisServiceClient_Graph__requestTitleForCollectionMomentListWithLocalIdentifier_format_title_subtitle_error___block_invoke;
  v18[3] = &unk_1E5874CF8;
  void v18[4] = &v19;
  id v14 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __122__PLPhotoAnalysisServiceClient_Graph__requestTitleForCollectionMomentListWithLocalIdentifier_format_title_subtitle_error___block_invoke_2;
  v17[3] = &unk_1E5874E88;
  void v17[4] = &v31;
  void v17[5] = &v25;
  v17[6] = &v19;
  [v14 requestTitleForCollectionMomentListWithLocalIdentifier:v12 format:a4 context:v13 reply:v17];

  if (a5) {
    *a5 = (id) v32[5];
  }
  if (a6) {
    *a6 = (id) v26[5];
  }
  if (a7) {
    *a7 = (id) v20[5];
  }
  BOOL v15 = v20[5] == 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v15;
}

void __122__PLPhotoAnalysisServiceClient_Graph__requestTitleForCollectionMomentListWithLocalIdentifier_format_title_subtitle_error___block_invoke(uint64_t a1, void *a2)
{
}

void __122__PLPhotoAnalysisServiceClient_Graph__requestTitleForCollectionMomentListWithLocalIdentifier_format_title_subtitle_error___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void *)(v10 + 40);
  id v11 = (id *)(v10 + 40);
  if (!v12) {
    objc_storeStrong(v11, a4);
  }
}

- (BOOL)requestSetDefaultsObject:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__112046;
  uint64_t v27 = __Block_byref_object_dispose__112047;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__112046;
  uint64_t v21 = __Block_byref_object_dispose__112047;
  id v22 = 0;
  uint64_t v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestSetDefaultsObject_forKey_withError___block_invoke;
  v16[3] = &unk_1E5874CF8;
  v16[4] = &v23;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestSetDefaultsObject_forKey_withError___block_invoke_2;
  v15[3] = &unk_1E5874CF8;
  void v15[4] = &v17;
  [v11 requestSetDefaultsObject:v8 forKey:v9 context:v10 reply:v15];

  if (a5)
  {
    uint64_t v12 = (void *)v24[5];
    if (!v12) {
      uint64_t v12 = (void *)v18[5];
    }
    *a5 = v12;
  }
  if (v24[5]) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v18[5] == 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __81__PLPhotoAnalysisServiceClient_Graph__requestSetDefaultsObject_forKey_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __81__PLPhotoAnalysisServiceClient_Graph__requestSetDefaultsObject_forKey_withError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)requestDefaultsObjectForKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__112046;
  id v30 = __Block_byref_object_dispose__112047;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__112046;
  id v24 = __Block_byref_object_dispose__112047;
  id v25 = 0;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__112046;
  id v18 = __Block_byref_object_dispose__112047;
  id v19 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__PLPhotoAnalysisServiceClient_Graph__requestDefaultsObjectForKey_withError___block_invoke;
  v13[3] = &unk_1E5874CF8;
  void v13[4] = &v26;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PLPhotoAnalysisServiceClient_Graph__requestDefaultsObjectForKey_withError___block_invoke_2;
  v12[3] = &unk_1E5874E60;
  void v12[4] = &v14;
  void v12[5] = &v20;
  [v8 requestDefaultsObjectForKey:v6 context:v7 reply:v12];

  if (a4)
  {
    id v9 = (void *)v27[5];
    if (!v9) {
      id v9 = (void *)v21[5];
    }
    *a4 = v9;
  }
  id v10 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v10;
}

void __77__PLPhotoAnalysisServiceClient_Graph__requestDefaultsObjectForKey_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __77__PLPhotoAnalysisServiceClient_Graph__requestDefaultsObjectForKey_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 additionalSnapshotSummaryInfo:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  BOOL v15 = (void (**)(id, void, uint64_t))a7;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__112046;
  uint64_t v37 = __Block_byref_object_dispose__112047;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  id v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v16 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __197__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_reply___block_invoke;
  v20[3] = &unk_1E5874CF8;
  void v20[4] = &v27;
  uint64_t v17 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __197__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_reply___block_invoke_2;
  v19[3] = &unk_1E5874E10;
  v19[4] = &v33;
  v19[5] = &v21;
  [v17 requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier:v12 andRelatedResultsForLocalIdentifiers:v13 relatedType:a5 additionalSnapshotSummaryInfo:v14 context:v16 reply:v19];

  uint64_t v18 = v28[5];
  if (!v18) {
    uint64_t v18 = v22[5];
  }
  v15[2](v15, v34[5], v18);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
}

void __197__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __197__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_additionalSnapshotSummaryInfo_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier:(id)a3 andRelatedResultsForLocalIdentifiers:(id)a4 relatedType:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, uint64_t))a6;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  uint64_t v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  id v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __166__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_reply___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v24;
  id v14 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __166__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_reply___block_invoke_2;
  v16[3] = &unk_1E5874E10;
  v16[4] = &v30;
  void v16[5] = &v18;
  [v14 requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier:v10 andRelatedResultsForLocalIdentifiers:v11 relatedType:a5 context:v13 reply:v16];

  uint64_t v15 = v25[5];
  if (!v15) {
    uint64_t v15 = v19[5];
  }
  v12[2](v12, v31[5], v15);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

void __166__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __166__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier_andRelatedResultsForLocalIdentifiers_relatedType_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestSnapshotServiceForRelatedWithAssetLocalIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__112046;
  id v29 = __Block_byref_object_dispose__112047;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  id v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithAssetLocalIdentifier_reply___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  uint64_t v9 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithAssetLocalIdentifier_reply___block_invoke_2;
  v11[3] = &unk_1E5874E10;
  void v11[4] = &v25;
  void v11[5] = &v13;
  [v9 requestSnapshotServiceForRelatedWithAssetLocalIdentifier:v6 context:v8 reply:v11];

  uint64_t v10 = v20[5];
  if (!v10) {
    uint64_t v10 = v14[5];
  }
  v7[2](v7, v26[5], v10);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
}

void __102__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithAssetLocalIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __102__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithAssetLocalIdentifier_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestSnapshotServiceForRelatedWithMomentLocalIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, uint64_t))a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__112046;
  id v29 = __Block_byref_object_dispose__112047;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  id v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithMomentLocalIdentifier_reply___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  uint64_t v9 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithMomentLocalIdentifier_reply___block_invoke_2;
  v11[3] = &unk_1E5874E10;
  void v11[4] = &v25;
  void v11[5] = &v13;
  [v9 requestSnapshotServiceForRelatedWithMomentLocalIdentifier:v6 context:v8 reply:v11];

  uint64_t v10 = v20[5];
  if (!v10) {
    uint64_t v10 = v14[5];
  }
  v7[2](v7, v26[5], v10);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
}

void __103__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithMomentLocalIdentifier_reply___block_invoke(uint64_t a1, void *a2)
{
}

void __103__PLPhotoAnalysisServiceClient_Graph__requestSnapshotServiceForRelatedWithMomentLocalIdentifier_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)requestInvalidatePersistentCaches:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__112046;
  uint64_t v15 = __Block_byref_object_dispose__112047;
  id v16 = 0;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PLPhotoAnalysisServiceClient_Graph__requestInvalidatePersistentCaches___block_invoke;
  v10[3] = &unk_1E5874CF8;
  v10[4] = &v11;
  id v6 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PLPhotoAnalysisServiceClient_Graph__requestInvalidatePersistentCaches___block_invoke_2;
  v9[3] = &unk_1E5874CF8;
  void v9[4] = &v11;
  [v6 requestInvalidateServicePersistentCachesWithContext:v5 reply:v9];

  uint64_t v7 = (void *)v12[5];
  if (a3 && v7) {
    *a3 = v7;
  }

  _Block_object_dispose(&v11, 8);
  return v7 == 0;
}

void __73__PLPhotoAnalysisServiceClient_Graph__requestInvalidatePersistentCaches___block_invoke(uint64_t a1, void *a2)
{
}

void __73__PLPhotoAnalysisServiceClient_Graph__requestInvalidatePersistentCaches___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)requestInvalidateTransientCaches:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__112046;
  uint64_t v15 = __Block_byref_object_dispose__112047;
  id v16 = 0;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PLPhotoAnalysisServiceClient_Graph__requestInvalidateTransientCaches___block_invoke;
  v10[3] = &unk_1E5874CF8;
  v10[4] = &v11;
  id v6 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PLPhotoAnalysisServiceClient_Graph__requestInvalidateTransientCaches___block_invoke_2;
  v9[3] = &unk_1E5874CF8;
  void v9[4] = &v11;
  [v6 requestInvalidateServiceTransientCachesWithContext:v5 reply:v9];

  uint64_t v7 = (void *)v12[5];
  if (a3 && v7) {
    *a3 = v7;
  }

  _Block_object_dispose(&v11, 8);
  return v7 == 0;
}

void __72__PLPhotoAnalysisServiceClient_Graph__requestInvalidateTransientCaches___block_invoke(uint64_t a1, void *a2)
{
}

void __72__PLPhotoAnalysisServiceClient_Graph__requestInvalidateTransientCaches___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)requestGraphRebuildFractionCompletedWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestGraphRebuildFractionCompletedWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestGraphRebuildFractionCompletedWithReply___block_invoke_2;
  v9[3] = &unk_1E5874DC0;
  id v10 = v6;
  id v8 = v6;
  [v7 requestGraphRebuildFractionCompletedWithContext:v5 reply:v9];
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__requestGraphRebuildFractionCompletedWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__requestGraphRebuildFractionCompletedWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestGraphPerformQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__PLPhotoAnalysisServiceClient_Graph__requestGraphPerformQuery_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PLPhotoAnalysisServiceClient_Graph__requestGraphPerformQuery_error___block_invoke_2;
  v13[3] = &unk_1E5874D48;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v8 requestGraphServicePerformsQueryWithContext:v7 query:v6 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __70__PLPhotoAnalysisServiceClient_Graph__requestGraphPerformQuery_error___block_invoke(uint64_t a1, void *a2)
{
}

void __70__PLPhotoAnalysisServiceClient_Graph__requestGraphPerformQuery_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestGraphStatus:(id *)a3
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__112046;
  uint64_t v29 = __Block_byref_object_dispose__112047;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  uint64_t v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PLPhotoAnalysisServiceClient_Graph__requestGraphStatus___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  id v6 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__PLPhotoAnalysisServiceClient_Graph__requestGraphStatus___block_invoke_2;
  v11[3] = &unk_1E5874D48;
  void v11[4] = &v25;
  void v11[5] = &v13;
  [v6 requestGraphServiceStatusWithContext:v5 reply:v11];

  if (v26[5])
  {
    uint64_t v7 = [PLPhotosKnowledgeGraphAvailabilityStatus alloc];
    id v8 = [(PLPhotosKnowledgeGraphAvailabilityStatus *)v7 initWithDictionary:v26[5]];
  }
  else if (a3)
  {
    uint64_t v9 = (void *)v20[5];
    if (!v9) {
      uint64_t v9 = (void *)v14[5];
    }
    id v8 = 0;
    *a3 = v9;
  }
  else
  {
    id v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v8;
}

void __58__PLPhotoAnalysisServiceClient_Graph__requestGraphStatus___block_invoke(uint64_t a1, void *a2)
{
}

void __58__PLPhotoAnalysisServiceClient_Graph__requestGraphStatus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestHighlightEstimatesWithReply:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestHighlightEstimatesWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v5 = v4;
  id v12 = v5;
  id v6 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestHighlightEstimatesWithReply___block_invoke_2;
  v9[3] = &unk_1E5874E38;
  id v10 = v5;
  id v8 = v5;
  [v6 requestHighlightEstimatesWithContext:v7 reply:v9];
}

uint64_t __74__PLPhotoAnalysisServiceClient_Graph__requestHighlightEstimatesWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__PLPhotoAnalysisServiceClient_Graph__requestHighlightEstimatesWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestGraphStatisticsWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestGraphStatisticsWithOptions_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestGraphStatisticsWithOptions_error___block_invoke_2;
  v13[3] = &unk_1E5874E10;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v8 requestGraphServiceStatisticsWithOptions:v6 context:v7 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __79__PLPhotoAnalysisServiceClient_Graph__requestGraphStatisticsWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __79__PLPhotoAnalysisServiceClient_Graph__requestGraphStatisticsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestExportGraphForPurpose:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestExportGraphForPurpose_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PLPhotoAnalysisServiceClient_Graph__requestExportGraphForPurpose_error___block_invoke_2;
  v13[3] = &unk_1E5874E10;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v8 requestExportGraphServiceForPurpose:v6 context:v7 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __74__PLPhotoAnalysisServiceClient_Graph__requestExportGraphForPurpose_error___block_invoke(uint64_t a1, void *a2)
{
}

void __74__PLPhotoAnalysisServiceClient_Graph__requestExportGraphForPurpose_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSuggestionInfosWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestSuggestionInfosWithOptions_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestSuggestionInfosWithOptions_error___block_invoke_2;
  v13[3] = &unk_1E5874D20;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v7 requestSuggestionInfosWithOptions:v6 context:v8 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __79__PLPhotoAnalysisServiceClient_Graph__requestSuggestionInfosWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __79__PLPhotoAnalysisServiceClient_Graph__requestSuggestionInfosWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestAvailableSuggestionTypeInfosWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestAvailableSuggestionTypeInfosWithOptions_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestAvailableSuggestionTypeInfosWithOptions_error___block_invoke_2;
  v13[3] = &unk_1E5874D48;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v7 requestAvailableSuggestionTypeInfosWithOptions:v6 context:v8 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestAvailableSuggestionTypeInfosWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestAvailableSuggestionTypeInfosWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestCurationOfLength:(unint64_t)a3 forMemoryForLocalIdentifier:(id)a4 withOptions:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__112046;
  id v36 = __Block_byref_object_dispose__112047;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__112046;
  id v30 = __Block_byref_object_dispose__112047;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__112046;
  id v24 = __Block_byref_object_dispose__112047;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestCurationOfLength_forMemoryForLocalIdentifier_withOptions_error___block_invoke;
  v19[3] = &unk_1E5874CF8;
  v19[4] = &v26;
  id v12 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v19];
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __109__PLPhotoAnalysisServiceClient_Graph__requestCurationOfLength_forMemoryForLocalIdentifier_withOptions_error___block_invoke_2;
  v18[3] = &unk_1E5874D20;
  void v18[4] = &v32;
  void v18[5] = &v20;
  [v12 requestCurationOfLength:a3 forMemoryForLocalIdentifier:v10 withOptions:v11 context:v13 reply:v18];

  id v14 = (void *)v33[5];
  if (a6 && !v14)
  {
    uint64_t v15 = (void *)v27[5];
    if (!v15) {
      uint64_t v15 = (void *)v21[5];
    }
    *a6 = v15;
    id v14 = (void *)v33[5];
  }
  id v16 = v14;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v16;
}

void __109__PLPhotoAnalysisServiceClient_Graph__requestCurationOfLength_forMemoryForLocalIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __109__PLPhotoAnalysisServiceClient_Graph__requestCurationOfLength_forMemoryForLocalIdentifier_withOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestMemoryDebugInformationForMemoryWithLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  id v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestMemoryDebugInformationForMemoryWithLocalIdentifier_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestMemoryDebugInformationForMemoryWithLocalIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E5874D48;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v7 requestMemoryDebugInformationForMemoryWithLocalIdentifier:v6 context:v8 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __103__PLPhotoAnalysisServiceClient_Graph__requestMemoryDebugInformationForMemoryWithLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __103__PLPhotoAnalysisServiceClient_Graph__requestMemoryDebugInformationForMemoryWithLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSummaryCurationForHighlightLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  uint64_t v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestSummaryCurationForHighlightLocalIdentifier_options_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v24;
  id v10 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__PLPhotoAnalysisServiceClient_Graph__requestSummaryCurationForHighlightLocalIdentifier_options_error___block_invoke_2;
  v16[3] = &unk_1E5874D20;
  v16[4] = &v30;
  void v16[5] = &v18;
  [v10 requestSummaryCurationForHighlightLocalIdentifier:v8 options:v9 context:v11 reply:v16];

  id v12 = (void *)v31[5];
  if (a5 && !v12)
  {
    uint64_t v13 = (void *)v25[5];
    if (!v13) {
      uint64_t v13 = (void *)v19[5];
    }
    *a5 = v13;
    id v12 = (void *)v31[5];
  }
  id v14 = v12;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14;
}

void __103__PLPhotoAnalysisServiceClient_Graph__requestSummaryCurationForHighlightLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __103__PLPhotoAnalysisServiceClient_Graph__requestSummaryCurationForHighlightLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  uint64_t v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __122__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetCollectionWithLocalIdentifier_options_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v24;
  id v10 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __122__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetCollectionWithLocalIdentifier_options_error___block_invoke_2;
  v16[3] = &unk_1E5874D48;
  v16[4] = &v30;
  void v16[5] = &v18;
  [v10 requestCurationDebugInformationForAssetCollectionWithLocalIdentifier:v8 options:v9 context:v11 reply:v16];

  id v12 = (void *)v31[5];
  if (a5 && !v12)
  {
    uint64_t v13 = (void *)v25[5];
    if (!v13) {
      uint64_t v13 = (void *)v19[5];
    }
    *a5 = v13;
    id v12 = (void *)v31[5];
  }
  id v14 = v12;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14;
}

void __122__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetCollectionWithLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __122__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetCollectionWithLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__112046;
  id v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __126__PLPhotoAnalysisServiceClient_Graph__requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __126__PLPhotoAnalysisServiceClient_Graph__requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E5874D48;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v8 requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier:v6 context:v7 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __126__PLPhotoAnalysisServiceClient_Graph__requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __126__PLPhotoAnalysisServiceClient_Graph__requestSharingMessageSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__112046;
  id v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __119__PLPhotoAnalysisServiceClient_Graph__requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __119__PLPhotoAnalysisServiceClient_Graph__requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E5874D48;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v8 requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:v6 context:v7 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __119__PLPhotoAnalysisServiceClient_Graph__requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __119__PLPhotoAnalysisServiceClient_Graph__requestSharingSuggestionDebugInformationForAssetCollectionLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestUtilityAssetInformationWithError:(id *)a3
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__112046;
  uint64_t v29 = __Block_byref_object_dispose__112047;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  uint64_t v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetInformationWithError___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  id v6 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetInformationWithError___block_invoke_2;
  v11[3] = &unk_1E5874D48;
  void v11[4] = &v25;
  void v11[5] = &v13;
  [v6 requestUtilityAssetInformationWithContext:v5 reply:v11];

  uint64_t v7 = (void *)v26[5];
  if (a3 && !v7)
  {
    id v8 = (void *)v20[5];
    if (!v8) {
      id v8 = (void *)v14[5];
    }
    *a3 = v8;
    uint64_t v7 = (void *)v26[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v9;
}

void __79__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetInformationWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __79__PLPhotoAnalysisServiceClient_Graph__requestUtilityAssetInformationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestCurationDebugInformationForAssetLocalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetLocalIdentifier_error___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetLocalIdentifier_error___block_invoke_2;
  v13[3] = &unk_1E5874D48;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v8 requestCurationDebugInformationForAsset:v6 context:v7 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __100__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetLocalIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __100__PLPhotoAnalysisServiceClient_Graph__requestCurationDebugInformationForAssetLocalIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__112046;
  uint64_t v39 = __Block_byref_object_dispose__112047;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__112046;
  uint64_t v33 = __Block_byref_object_dispose__112047;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__112046;
  uint64_t v27 = __Block_byref_object_dispose__112047;
  id v28 = 0;
  uint64_t v15 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __189__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke;
  v22[3] = &unk_1E5874CF8;
  v22[4] = &v29;
  id v16 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __189__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke_2;
  v21[3] = &unk_1E5874D48;
  v21[4] = &v35;
  v21[5] = &v23;
  [v16 requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:v12 andRelatedAssetCollectionForLocalIdentifier:v13 options:v14 relatedType:a6 context:v15 reply:v21];

  uint64_t v17 = (void *)v36[5];
  if (a7 && !v17)
  {
    id v18 = (void *)v30[5];
    if (!v18) {
      id v18 = (void *)v24[5];
    }
    *a7 = v18;
    uint64_t v17 = (void *)v36[5];
  }
  id v19 = v17;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v19;
}

void __189__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __189__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestRelatedDebugInformationBetweenAssetForLocalIdentifier:(id)a3 andRelatedAssetCollectionForLocalIdentifier:(id)a4 options:(id)a5 relatedType:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__112046;
  uint64_t v39 = __Block_byref_object_dispose__112047;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__112046;
  uint64_t v33 = __Block_byref_object_dispose__112047;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__112046;
  uint64_t v27 = __Block_byref_object_dispose__112047;
  id v28 = 0;
  uint64_t v15 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __170__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenAssetForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke;
  v22[3] = &unk_1E5874CF8;
  v22[4] = &v29;
  id v16 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __170__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenAssetForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke_2;
  v21[3] = &unk_1E5874D48;
  v21[4] = &v35;
  v21[5] = &v23;
  [v16 requestRelatedDebugInformationBetweenAssetForLocalIdentifier:v12 andRelatedAssetCollectionForLocalIdentifier:v13 options:v14 relatedType:a6 context:v15 reply:v21];

  uint64_t v17 = (void *)v36[5];
  if (a7 && !v17)
  {
    id v18 = (void *)v30[5];
    if (!v18) {
      id v18 = (void *)v24[5];
    }
    *a7 = v18;
    uint64_t v17 = (void *)v36[5];
  }
  id v19 = v17;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v19;
}

void __170__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenAssetForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke(uint64_t a1, void *a2)
{
}

void __170__PLPhotoAnalysisServiceClient_Graph__requestRelatedDebugInformationBetweenAssetForLocalIdentifier_andRelatedAssetCollectionForLocalIdentifier_options_relatedType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestOnDemandTasksWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__PLPhotoAnalysisServiceClient_Graph__requestOnDemandTasksWithOptions_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PLPhotoAnalysisServiceClient_Graph__requestOnDemandTasksWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E5874DE8;
  id v13 = v9;
  id v11 = v9;
  [v10 requestOnDemandTasksWithOptions:v7 context:v8 reply:v12];
}

uint64_t __77__PLPhotoAnalysisServiceClient_Graph__requestOnDemandTasksWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__PLPhotoAnalysisServiceClient_Graph__requestOnDemandTasksWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyWhenGraphReadyWithCoalescingIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __90__PLPhotoAnalysisServiceClient_Graph__notifyWhenGraphReadyWithCoalescingIdentifier_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__PLPhotoAnalysisServiceClient_Graph__notifyWhenGraphReadyWithCoalescingIdentifier_reply___block_invoke_2;
  v12[3] = &unk_1E5874DE8;
  id v13 = v9;
  id v11 = v9;
  [v10 notifyWhenGraphReadyWithCoalescingIdentifier:v7 context:v8 reply:v12];
}

uint64_t __90__PLPhotoAnalysisServiceClient_Graph__notifyWhenGraphReadyWithCoalescingIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__PLPhotoAnalysisServiceClient_Graph__notifyWhenGraphReadyWithCoalescingIdentifier_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestSignalModelInfosWithError:(id *)a3
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__112046;
  uint64_t v29 = __Block_byref_object_dispose__112047;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__112046;
  uint64_t v23 = __Block_byref_object_dispose__112047;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__112046;
  uint64_t v17 = __Block_byref_object_dispose__112047;
  id v18 = 0;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PLPhotoAnalysisServiceClient_Graph__requestSignalModelInfosWithError___block_invoke;
  v12[3] = &unk_1E5874CF8;
  void v12[4] = &v19;
  id v6 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__PLPhotoAnalysisServiceClient_Graph__requestSignalModelInfosWithError___block_invoke_2;
  v11[3] = &unk_1E5874D48;
  void v11[4] = &v25;
  void v11[5] = &v13;
  [v6 requestSignalModelInfosWithContext:v5 reply:v11];

  id v7 = (void *)v26[5];
  if (a3 && !v7)
  {
    id v8 = (void *)v20[5];
    if (!v8) {
      id v8 = (void *)v14[5];
    }
    *a3 = v8;
    id v7 = (void *)v26[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v9;
}

void __72__PLPhotoAnalysisServiceClient_Graph__requestSignalModelInfosWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __72__PLPhotoAnalysisServiceClient_Graph__requestSignalModelInfosWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestAssetsForPersonLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  uint64_t v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__PLPhotoAnalysisServiceClient_Graph__requestAssetsForPersonLocalIdentifiers_withError___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__PLPhotoAnalysisServiceClient_Graph__requestAssetsForPersonLocalIdentifiers_withError___block_invoke_2;
  v13[3] = &unk_1E5874D20;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v8 requestAssetsForPersonLocalIdentifiers:v6 context:v7 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __88__PLPhotoAnalysisServiceClient_Graph__requestAssetsForPersonLocalIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __88__PLPhotoAnalysisServiceClient_Graph__requestAssetsForPersonLocalIdentifiers_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestRelatedMomentsForPersonLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  uint64_t v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestRelatedMomentsForPersonLocalIdentifiers_withError___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__PLPhotoAnalysisServiceClient_Graph__requestRelatedMomentsForPersonLocalIdentifiers_withError___block_invoke_2;
  v13[3] = &unk_1E5874D20;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v8 requestRelatedMomentsForPersonLocalIdentifiers:v6 context:v7 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestRelatedMomentsForPersonLocalIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __96__PLPhotoAnalysisServiceClient_Graph__requestRelatedMomentsForPersonLocalIdentifiers_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSocialGroupsOverlappingMemberLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__112046;
  uint64_t v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__PLPhotoAnalysisServiceClient_Graph__requestSocialGroupsOverlappingMemberLocalIdentifiers_withError___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__PLPhotoAnalysisServiceClient_Graph__requestSocialGroupsOverlappingMemberLocalIdentifiers_withError___block_invoke_2;
  v13[3] = &unk_1E5874D20;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v8 requestSocialGroupsOverlappingMemberLocalIdentifiers:v6 context:v7 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __102__PLPhotoAnalysisServiceClient_Graph__requestSocialGroupsOverlappingMemberLocalIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __102__PLPhotoAnalysisServiceClient_Graph__requestSocialGroupsOverlappingMemberLocalIdentifiers_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestAllSocialGroupsForMemberLocalIdentifier:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  id v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  id v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  id v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __104__PLPhotoAnalysisServiceClient_Graph__requestAllSocialGroupsForMemberLocalIdentifier_withOptions_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v24;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __104__PLPhotoAnalysisServiceClient_Graph__requestAllSocialGroupsForMemberLocalIdentifier_withOptions_error___block_invoke_2;
  v16[3] = &unk_1E5874D20;
  v16[4] = &v30;
  void v16[5] = &v18;
  [v11 requestAllSocialGroupsForMemberLocalIdentifier:v8 options:v9 context:v10 reply:v16];

  id v12 = (void *)v31[5];
  if (a5 && !v12)
  {
    uint64_t v13 = (void *)v25[5];
    if (!v13) {
      uint64_t v13 = (void *)v19[5];
    }
    *a5 = v13;
    id v12 = (void *)v31[5];
  }
  id v14 = v12;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v14;
}

void __104__PLPhotoAnalysisServiceClient_Graph__requestAllSocialGroupsForMemberLocalIdentifier_withOptions_error___block_invoke(uint64_t a1, void *a2)
{
}

void __104__PLPhotoAnalysisServiceClient_Graph__requestAllSocialGroupsForMemberLocalIdentifier_withOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestSortedArrayOfPersonLocalIdentifiers:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  uint64_t v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__112046;
  uint64_t v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__112046;
  uint64_t v19 = __Block_byref_object_dispose__112047;
  id v20 = 0;
  uint64_t v7 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestSortedArrayOfPersonLocalIdentifiers_withError___block_invoke;
  v14[3] = &unk_1E5874CF8;
  void v14[4] = &v21;
  id v8 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__PLPhotoAnalysisServiceClient_Graph__requestSortedArrayOfPersonLocalIdentifiers_withError___block_invoke_2;
  v13[3] = &unk_1E5874D20;
  void v13[4] = &v27;
  void v13[5] = &v15;
  [v8 requestSortedArrayOfPersonLocalIdentifiers:v6 context:v7 reply:v13];

  uint64_t v9 = (void *)v28[5];
  if (a4 && !v9)
  {
    id v10 = (void *)v22[5];
    if (!v10) {
      id v10 = (void *)v16[5];
    }
    *a4 = v10;
    uint64_t v9 = (void *)v28[5];
  }
  id v11 = v9;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestSortedArrayOfPersonLocalIdentifiers_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __92__PLPhotoAnalysisServiceClient_Graph__requestSortedArrayOfPersonLocalIdentifiers_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)requestRecentlyUsedSongsWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestRecentlyUsedSongsWithOptions_reply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  [v10 requestRecentlyUsedSongsWithOptions:v7 context:v8 reply:v9];
}

uint64_t __81__PLPhotoAnalysisServiceClient_Graph__requestRecentlyUsedSongsWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestFlexMusicCurationWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationWithOptions_reply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  [v10 requestFlexMusicCurationWithOptions:v7 context:v8 reply:v9];
}

uint64_t __81__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestMusicCurationWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationWithOptions_reply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  [v10 requestMusicCurationWithOptions:v7 context:v8 reply:v9];
}

uint64_t __77__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestCacheSongSourceWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestCacheSongSourceWithOptions_reply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  [v10 requestCacheSongSourceWithOptions:v7 context:v8 reply:v9];
}

uint64_t __79__PLPhotoAnalysisServiceClient_Graph__requestCacheSongSourceWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestMusicCatalogAdamIDsForPurchasedSongID:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__PLPhotoAnalysisServiceClient_Graph__requestMusicCatalogAdamIDsForPurchasedSongID_options_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v15 = v8;
  id v12 = v8;
  uint64_t v13 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  [v13 requestMusicCatalogAdamIDsForPurchasedSongID:v10 options:v9 context:v11 reply:v12];
}

uint64_t __98__PLPhotoAnalysisServiceClient_Graph__requestMusicCatalogAdamIDsForPurchasedSongID_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestClearMusicCacheWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestClearMusicCacheWithOptions_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PLPhotoAnalysisServiceClient_Graph__requestClearMusicCacheWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E5874D70;
  id v13 = v9;
  id v11 = v9;
  [v10 requestClearMusicCacheWithOptions:v7 context:v8 reply:v12];
}

uint64_t __79__PLPhotoAnalysisServiceClient_Graph__requestClearMusicCacheWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__PLPhotoAnalysisServiceClient_Graph__requestClearMusicCacheWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __123__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_reply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  [v10 requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:v7 context:v8 reply:v9];
}

uint64_t __123__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestFlexMusicCurationDebugInformationForSongWithUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __100__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationDebugInformationForSongWithUID_reply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  [v10 requestFlexMusicCurationDebugInformationForSongWithUID:v7 context:v8 reply:v9];
}

uint64_t __100__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationDebugInformationForSongWithUID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __119__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_reply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  [v10 requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:v7 context:v8 reply:v9];
}

uint64_t __119__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestMusicCurationDebugInformationForSongWithAdamID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationDebugInformationForSongWithAdamID_reply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  [v10 requestMusicCurationDebugInformationForSongWithAdamID:v7 context:v8 reply:v9];
}

uint64_t __99__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationDebugInformationForSongWithAdamID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestPrecachingOfAudioDataForAdamIDs:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__PLPhotoAnalysisServiceClient_Graph__requestPrecachingOfAudioDataForAdamIDs_reply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v12 = v6;
  id v9 = v6;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  [v10 requestPrecachingOfAudioDataForAdamIDs:v7 context:v8 reply:v9];
}

uint64_t __84__PLPhotoAnalysisServiceClient_Graph__requestPrecachingOfAudioDataForAdamIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestMusicCacheStatusWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PLPhotoAnalysisServiceClient_Graph__requestMusicCacheStatusWithReply___block_invoke;
  v8[3] = &unk_1E5874D70;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v8];
  [v7 requestMusicCacheStatusWithContext:v5 reply:v6];
}

uint64_t __72__PLPhotoAnalysisServiceClient_Graph__requestMusicCacheStatusWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestSongsForAdamIDs:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PLPhotoAnalysisServiceClient_Graph__requestSongsForAdamIDs_options_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v15 = v8;
  id v12 = v8;
  id v13 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  [v13 requestSongsForAdamIDs:v10 options:v9 context:v11 reply:v12];
}

uint64_t __76__PLPhotoAnalysisServiceClient_Graph__requestSongsForAdamIDs_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestFlexMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationForAssetLocalIdentifiers_options_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v15 = v8;
  id v12 = v8;
  id v13 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  [v13 requestFlexMusicCurationForAssetLocalIdentifiers:v10 options:v9 context:v11 reply:v12];
}

uint64_t __102__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationForAssetLocalIdentifiers_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestFlexMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __111__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v15 = v8;
  id v12 = v8;
  id v13 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  [v13 requestFlexMusicCurationForAssetCollectionLocalIdentifier:v10 options:v9 context:v11 reply:v12];
}

uint64_t __111__PLPhotoAnalysisServiceClient_Graph__requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestMusicCurationForAssetLocalIdentifiers:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationForAssetLocalIdentifiers_options_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v15 = v8;
  id v12 = v8;
  id v13 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  [v13 requestMusicCurationForAssetLocalIdentifiers:v10 options:v9 context:v11 reply:v12];
}

uint64_t __98__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationForAssetLocalIdentifiers_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestMusicCurationForAssetCollectionLocalIdentifier:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __107__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationForAssetCollectionLocalIdentifier_options_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v15 = v8;
  id v12 = v8;
  id v13 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  [v13 requestMusicCurationForAssetCollectionLocalIdentifier:v10 options:v9 context:v11 reply:v12];
}

uint64_t __107__PLPhotoAnalysisServiceClient_Graph__requestMusicCurationForAssetCollectionLocalIdentifier_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestExternalAssetRelevanceProcessingWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PLPhotoAnalysisServiceClient_Graph__requestExternalAssetRelevanceProcessingWithReply___block_invoke;
  v11[3] = &unk_1E5874D70;
  id v6 = v4;
  id v12 = v6;
  id v7 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__PLPhotoAnalysisServiceClient_Graph__requestExternalAssetRelevanceProcessingWithReply___block_invoke_2;
  v9[3] = &unk_1E5874DC0;
  id v10 = v6;
  id v8 = v6;
  [v7 requestExternalAssetRelevanceProcessingWithContext:v5 reply:v9];
}

uint64_t __88__PLPhotoAnalysisServiceClient_Graph__requestExternalAssetRelevanceProcessingWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__PLPhotoAnalysisServiceClient_Graph__requestExternalAssetRelevanceProcessingWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestSyndicationProcessingWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestSyndicationProcessingWithOptions_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PLPhotoAnalysisServiceClient_Graph__requestSyndicationProcessingWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E5874D98;
  id v13 = v9;
  id v11 = v9;
  [v10 requestSyndicationProcessingWithOptions:v7 context:v8 reply:v12];
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__requestSyndicationProcessingWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__requestSyndicationProcessingWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestGenerateQuestionsWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestGenerateQuestionsWithOptions_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PLPhotoAnalysisServiceClient_Graph__requestGenerateQuestionsWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E5874D98;
  id v13 = v9;
  id v11 = v9;
  [v10 requestGenerateQuestionsWithOptions:v7 context:v8 reply:v12];
}

uint64_t __81__PLPhotoAnalysisServiceClient_Graph__requestGenerateQuestionsWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__PLPhotoAnalysisServiceClient_Graph__requestGenerateQuestionsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateSuggestionsWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PLPhotoAnalysisServiceClient_Graph__generateSuggestionsWithOptions_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PLPhotoAnalysisServiceClient_Graph__generateSuggestionsWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E5874D98;
  id v13 = v9;
  id v11 = v9;
  [v10 generateSuggestionsWithOptions:v7 context:v8 reply:v12];
}

uint64_t __76__PLPhotoAnalysisServiceClient_Graph__generateSuggestionsWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PLPhotoAnalysisServiceClient_Graph__generateSuggestionsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)simulateMemoriesNotificationWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__PLPhotoAnalysisServiceClient_Graph__simulateMemoriesNotificationWithOptions_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PLPhotoAnalysisServiceClient_Graph__simulateMemoriesNotificationWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E5874D98;
  id v13 = v9;
  id v11 = v9;
  [v10 simulateMemoriesNotificationWithOptions:v7 context:v8 reply:v12];
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__simulateMemoriesNotificationWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__PLPhotoAnalysisServiceClient_Graph__simulateMemoriesNotificationWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateMemoriesWithOptions:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__PLPhotoAnalysisServiceClient_Graph__generateMemoriesWithOptions_reply___block_invoke;
  v14[3] = &unk_1E5874D70;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(PLPhotoAnalysisServiceClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PLPhotoAnalysisServiceClient_Graph__generateMemoriesWithOptions_reply___block_invoke_2;
  v12[3] = &unk_1E5874D98;
  id v13 = v9;
  id v11 = v9;
  [v10 generateMemoriesWithOptions:v7 context:v8 reply:v12];
}

uint64_t __73__PLPhotoAnalysisServiceClient_Graph__generateMemoriesWithOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__PLPhotoAnalysisServiceClient_Graph__generateMemoriesWithOptions_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  id v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  id v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  id v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __118__PLPhotoAnalysisServiceClient_Graph__requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier_options_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v24;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __118__PLPhotoAnalysisServiceClient_Graph__requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier_options_error___block_invoke_2;
  v16[3] = &unk_1E5874D20;
  v16[4] = &v30;
  void v16[5] = &v18;
  [v11 requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier:v8 options:v9 context:v10 reply:v16];

  id v12 = (void *)v31[5];
  if (a5 && !v12)
  {
    id v13 = (void *)v25[5];
    if (!v13) {
      id v13 = (void *)v19[5];
    }
    *a5 = v13;
    id v12 = (void *)v31[5];
  }
  id v14 = v12;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v14;
}

void __118__PLPhotoAnalysisServiceClient_Graph__requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __118__PLPhotoAnalysisServiceClient_Graph__requestRepresentativeAssetsForAssetCollectionWithLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestCuratedAssetsForAssetCollectionWithLocalIdentifier:(id)a3 duration:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__112046;
  id v36 = __Block_byref_object_dispose__112047;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__112046;
  uint64_t v30 = __Block_byref_object_dispose__112047;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__112046;
  uint64_t v24 = __Block_byref_object_dispose__112047;
  id v25 = 0;
  id v12 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __120__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetsForAssetCollectionWithLocalIdentifier_duration_options_error___block_invoke;
  v19[3] = &unk_1E5874CF8;
  v19[4] = &v26;
  id v13 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __120__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetsForAssetCollectionWithLocalIdentifier_duration_options_error___block_invoke_2;
  v18[3] = &unk_1E5874D20;
  void v18[4] = &v32;
  void v18[5] = &v20;
  [v13 requestCuratedAssetsForAssetCollectionWithLocalIdentifier:v10 duration:a4 options:v11 context:v12 reply:v18];

  id v14 = (void *)v33[5];
  if (a6 && !v14)
  {
    id v15 = (void *)v27[5];
    if (!v15) {
      id v15 = (void *)v21[5];
    }
    *a6 = v15;
    id v14 = (void *)v33[5];
  }
  id v16 = v14;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v16;
}

void __120__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetsForAssetCollectionWithLocalIdentifier_duration_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __120__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetsForAssetCollectionWithLocalIdentifier_duration_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestCuratedAssetForAssetCollectionWithLocalIdentifier:(id)a3 referenceAssetLocalIdentifier:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__112046;
  id v37 = __Block_byref_object_dispose__112047;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__112046;
  id v31 = __Block_byref_object_dispose__112047;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__112046;
  id v25 = __Block_byref_object_dispose__112047;
  id v26 = 0;
  id v13 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __140__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetForAssetCollectionWithLocalIdentifier_referenceAssetLocalIdentifier_options_error___block_invoke;
  v20[3] = &unk_1E5874CF8;
  void v20[4] = &v27;
  id v14 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __140__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetForAssetCollectionWithLocalIdentifier_referenceAssetLocalIdentifier_options_error___block_invoke_2;
  v19[3] = &unk_1E5874D48;
  v19[4] = &v33;
  void v19[5] = &v21;
  [v14 requestCuratedAssetForAssetCollectionWithLocalIdentifier:v10 referenceAssetLocalIdentifier:v11 options:v12 context:v13 reply:v19];

  id v15 = (void *)v34[5];
  if (a6 && !v15)
  {
    id v16 = (void *)v28[5];
    if (!v16) {
      id v16 = (void *)v22[5];
    }
    *a6 = v16;
    id v15 = (void *)v34[5];
  }
  id v17 = v15;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

void __140__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetForAssetCollectionWithLocalIdentifier_referenceAssetLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __140__PLPhotoAnalysisServiceClient_Graph__requestCuratedAssetForAssetCollectionWithLocalIdentifier_referenceAssetLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestAssetCollectionsRelatedToPersonLocalIdentifiers:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  uint64_t v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  id v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v24;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_error___block_invoke_2;
  v16[3] = &unk_1E5874D20;
  v16[4] = &v30;
  void v16[5] = &v18;
  [v11 requestAssetCollectionsRelatedToPersonLocalIdentifiers:v8 options:v9 context:v10 reply:v16];

  id v12 = (void *)v31[5];
  if (a5 && !v12)
  {
    id v13 = (void *)v25[5];
    if (!v13) {
      id v13 = (void *)v19[5];
    }
    *a5 = v13;
    id v12 = (void *)v31[5];
  }
  id v14 = v12;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v14;
}

void __108__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __108__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  uint64_t v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  id v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __120__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v24;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_error___block_invoke_2;
  v16[3] = &unk_1E5874D20;
  v16[4] = &v30;
  void v16[5] = &v18;
  [v11 requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier:v8 options:v9 context:v10 reply:v16];

  id v12 = (void *)v31[5];
  if (a5 && !v12)
  {
    id v13 = (void *)v25[5];
    if (!v13) {
      id v13 = (void *)v19[5];
    }
    *a5 = v13;
    id v12 = (void *)v31[5];
  }
  id v14 = v12;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v14;
}

void __120__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __120__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestAssetCollectionsRelatedToMomentWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  uint64_t v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  id v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __111__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v24;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_error___block_invoke_2;
  v16[3] = &unk_1E5874D20;
  v16[4] = &v30;
  void v16[5] = &v18;
  [v11 requestAssetCollectionsRelatedToMomentWithLocalIdentifier:v8 options:v9 context:v10 reply:v16];

  id v12 = (void *)v31[5];
  if (a5 && !v12)
  {
    id v13 = (void *)v25[5];
    if (!v13) {
      id v13 = (void *)v19[5];
    }
    *a5 = v13;
    id v12 = (void *)v31[5];
  }
  id v14 = v12;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v14;
}

void __111__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __111__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)requestAssetCollectionsRelatedToAssetWithLocalIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__112046;
  uint64_t v34 = __Block_byref_object_dispose__112047;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__112046;
  uint64_t v28 = __Block_byref_object_dispose__112047;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__112046;
  uint64_t v22 = __Block_byref_object_dispose__112047;
  id v23 = 0;
  id v10 = [(PLPhotoAnalysisServiceClient *)self requestContextDictionary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __110__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_error___block_invoke;
  v17[3] = &unk_1E5874CF8;
  void v17[4] = &v24;
  id v11 = [(PLPhotoAnalysisServiceClient *)self synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __110__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_error___block_invoke_2;
  v16[3] = &unk_1E5874D20;
  v16[4] = &v30;
  void v16[5] = &v18;
  [v11 requestAssetCollectionsRelatedToAssetWithLocalIdentifier:v8 options:v9 context:v10 reply:v16];

  id v12 = (void *)v31[5];
  if (a5 && !v12)
  {
    id v13 = (void *)v25[5];
    if (!v13) {
      id v13 = (void *)v19[5];
    }
    *a5 = v13;
    id v12 = (void *)v31[5];
  }
  id v14 = v12;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v14;
}

void __110__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __110__PLPhotoAnalysisServiceClient_Graph__requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

@end