@interface PHAWorker
+ (void)configureInterface:(id)a3;
@end

@implementation PHAWorker

+ (void)configureInterface:(id)a3
{
  v97[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  v5 = [v4 classesForSelector:sel_generateMemoriesWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v6 = [v3 setWithSet:v5];

  v97[0] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:1];
  [v6 addObjectsFromArray:v7];

  [v4 setClasses:v6 forSelector:sel_generateMemoriesWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v8 = (void *)MEMORY[0x1E4F1CA80];
  v9 = [v4 classesForSelector:sel_generateSuggestionsWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v10 = [v8 setWithSet:v9];

  uint64_t v96 = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
  [v10 addObjectsFromArray:v11];

  [v4 setClasses:v10 forSelector:sel_generateSuggestionsWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v12 = (void *)MEMORY[0x1E4F1CA80];
  v13 = [v4 classesForSelector:sel_requestGenerateQuestionsWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v14 = [v12 setWithSet:v13];

  [v4 setClasses:v14 forSelector:sel_requestGenerateQuestionsWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v15 = (void *)MEMORY[0x1E4F1CA80];
  v16 = [v4 classesForSelector:sel_requestSyndicationProcessingWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v17 = [v15 setWithSet:v16];

  [v4 setClasses:v17 forSelector:sel_requestSyndicationProcessingWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v18 = (void *)MEMORY[0x1E4F1CA80];
  v19 = [v4 classesForSelector:sel_requestRevGeocodingSyndicationLibraryWithContext_reply_ argumentIndex:0 ofReply:0];
  v20 = [v18 setWithSet:v19];

  [v4 setClasses:v20 forSelector:sel_requestRevGeocodingSyndicationLibraryWithContext_reply_ argumentIndex:0 ofReply:0];
  v21 = (void *)MEMORY[0x1E4F1CA80];
  v22 = [v4 classesForSelector:sel_requestMusicCurationForAssetCollectionLocalIdentifier_options_context_reply_ argumentIndex:0 ofReply:0];
  v23 = [v21 setWithSet:v22];

  [v4 setClasses:v23 forSelector:sel_requestMusicCurationForAssetCollectionLocalIdentifier_options_context_reply_ argumentIndex:0 ofReply:0];
  v24 = (void *)MEMORY[0x1E4F1CA80];
  v25 = [v4 classesForSelector:sel_requestMusicCurationForAssetLocalIdentifiers_options_context_reply_ argumentIndex:0 ofReply:0];
  v26 = [v24 setWithSet:v25];

  [v4 setClasses:v26 forSelector:sel_requestMusicCurationForAssetLocalIdentifiers_options_context_reply_ argumentIndex:0 ofReply:0];
  v27 = (void *)MEMORY[0x1E4F1CA80];
  v28 = [v4 classesForSelector:sel_requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_context_reply_ argumentIndex:0 ofReply:0];
  v29 = [v27 setWithSet:v28];

  [v4 setClasses:v29 forSelector:sel_requestFlexMusicCurationForAssetCollectionLocalIdentifier_options_context_reply_ argumentIndex:0 ofReply:0];
  v30 = (void *)MEMORY[0x1E4F1CA80];
  v31 = [v4 classesForSelector:sel_requestFlexMusicCurationForAssetLocalIdentifiers_options_context_reply_ argumentIndex:0 ofReply:0];
  v32 = [v30 setWithSet:v31];

  [v4 setClasses:v32 forSelector:sel_requestFlexMusicCurationForAssetLocalIdentifiers_options_context_reply_ argumentIndex:0 ofReply:0];
  v33 = (void *)MEMORY[0x1E4F1CA80];
  v34 = [v4 classesForSelector:sel_requestSongsForAdamIDs_options_context_reply_ argumentIndex:0 ofReply:0];
  v35 = [v33 setWithSet:v34];

  [v4 setClasses:v35 forSelector:sel_requestSongsForAdamIDs_options_context_reply_ argumentIndex:0 ofReply:0];
  v36 = (void *)MEMORY[0x1E4F1CA80];
  v37 = [v4 classesForSelector:sel_requestMusicCacheStatusWithContext_reply_ argumentIndex:0 ofReply:0];
  v38 = [v36 setWithSet:v37];

  [v4 setClasses:v38 forSelector:sel_requestMusicCacheStatusWithContext_reply_ argumentIndex:0 ofReply:0];
  v39 = (void *)MEMORY[0x1E4F1CA80];
  v40 = [v4 classesForSelector:sel_requestPrecachingOfAudioDataForAdamIDs_context_reply_ argumentIndex:0 ofReply:0];
  v41 = [v39 setWithSet:v40];

  [v4 setClasses:v41 forSelector:sel_requestPrecachingOfAudioDataForAdamIDs_context_reply_ argumentIndex:0 ofReply:0];
  v42 = (void *)MEMORY[0x1E4F1CA80];
  v43 = [v4 classesForSelector:sel_requestMusicCurationDebugInformationForSongWithAdamID_context_reply_ argumentIndex:0 ofReply:0];
  v44 = [v42 setWithSet:v43];

  [v4 setClasses:v44 forSelector:sel_requestMusicCurationDebugInformationForSongWithAdamID_context_reply_ argumentIndex:0 ofReply:0];
  v45 = (void *)MEMORY[0x1E4F1CA80];
  v46 = [v4 classesForSelector:sel_requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_context_reply_ argumentIndex:0 ofReply:0];
  v47 = [v45 setWithSet:v46];

  [v4 setClasses:v47 forSelector:sel_requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_context_reply_ argumentIndex:0 ofReply:0];
  v48 = (void *)MEMORY[0x1E4F1CA80];
  v49 = [v4 classesForSelector:sel_requestFlexMusicCurationDebugInformationForSongWithUID_context_reply_ argumentIndex:0 ofReply:0];
  v50 = [v48 setWithSet:v49];

  [v4 setClasses:v50 forSelector:sel_requestFlexMusicCurationDebugInformationForSongWithUID_context_reply_ argumentIndex:0 ofReply:0];
  v51 = (void *)MEMORY[0x1E4F1CA80];
  v52 = [v4 classesForSelector:sel_requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_context_reply_ argumentIndex:0 ofReply:0];
  v53 = [v51 setWithSet:v52];

  [v4 setClasses:v53 forSelector:sel_requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier_context_reply_ argumentIndex:0 ofReply:0];
  v54 = (void *)MEMORY[0x1E4F1CA80];
  v55 = [v4 classesForSelector:sel_requestClearMusicCacheWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v56 = [v54 setWithSet:v55];

  [v4 setClasses:v56 forSelector:sel_requestClearMusicCacheWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v95[0] = objc_opt_class();
  v95[1] = objc_opt_class();
  v95[2] = objc_opt_class();
  v95[3] = objc_opt_class();
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:4];
  v58 = (void *)MEMORY[0x1E4F1CA80];
  v59 = [v4 classesForSelector:sel_requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_context_reply_ argumentIndex:1 ofReply:0];
  v60 = [v58 setWithSet:v59];

  [v60 addObjectsFromArray:v57];
  [v4 setClasses:v60 forSelector:sel_requestAssetCollectionsRelatedToAssetWithLocalIdentifier_options_context_reply_ argumentIndex:1 ofReply:0];
  v61 = (void *)MEMORY[0x1E4F1CA80];
  v62 = [v4 classesForSelector:sel_requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_context_reply_ argumentIndex:1 ofReply:0];
  v63 = [v61 setWithSet:v62];

  [v63 addObjectsFromArray:v57];
  [v4 setClasses:v63 forSelector:sel_requestAssetCollectionsRelatedToMomentWithLocalIdentifier_options_context_reply_ argumentIndex:1 ofReply:0];
  v64 = (void *)MEMORY[0x1E4F1CA80];
  v65 = [v4 classesForSelector:sel_requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_context_reply_ argumentIndex:1 ofReply:0];
  v66 = [v64 setWithSet:v65];

  [v66 addObjectsFromArray:v57];
  [v4 setClasses:v66 forSelector:sel_requestAssetCollectionsRelatedToAssetCollectionWithLocalIdentifier_options_context_reply_ argumentIndex:1 ofReply:0];
  v67 = (void *)MEMORY[0x1E4F1CA80];
  v68 = [v4 classesForSelector:sel_requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_context_reply_ argumentIndex:1 ofReply:0];
  v69 = [v67 setWithSet:v68];

  [v69 addObjectsFromArray:v57];
  [v4 setClasses:v69 forSelector:sel_requestAssetCollectionsRelatedToPersonLocalIdentifiers_options_context_reply_ argumentIndex:1 ofReply:0];
  v70 = (void *)MEMORY[0x1E4F1CA80];
  v71 = [v4 classesForSelector:sel_requestAvailableSuggestionTypeInfosWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v72 = [v70 setWithSet:v71];

  v94[0] = objc_opt_class();
  v94[1] = objc_opt_class();
  v94[2] = objc_opt_class();
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:3];
  [v72 addObjectsFromArray:v73];

  [v4 setClasses:v72 forSelector:sel_requestAvailableSuggestionTypeInfosWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v74 = (void *)MEMORY[0x1E4F1CA80];
  v75 = [v4 classesForSelector:sel_requestSuggestionInfosWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v76 = [v74 setWithSet:v75];

  v93[0] = objc_opt_class();
  v93[1] = objc_opt_class();
  v93[2] = objc_opt_class();
  v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:3];
  [v76 addObjectsFromArray:v77];

  [v4 setClasses:v76 forSelector:sel_requestSuggestionInfosWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v78 = (void *)MEMORY[0x1E4F1CA80];
  v79 = [v4 classesForSelector:sel_reportMetricsWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v80 = [v78 setWithSet:v79];

  v92[0] = objc_opt_class();
  v92[1] = objc_opt_class();
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
  [v80 addObjectsFromArray:v81];

  [v4 setClasses:v80 forSelector:sel_reportMetricsWithOptions_context_reply_ argumentIndex:0 ofReply:0];
  v82 = (void *)MEMORY[0x1E4F1CA80];
  v83 = [v4 classesForSelector:sel_requestRunPFLWithAttachments_recipeUserInfo_context_resultBlock_ argumentIndex:0 ofReply:0];
  v84 = [v82 setWithSet:v83];

  v91[0] = objc_opt_class();
  v91[1] = objc_opt_class();
  v91[2] = objc_opt_class();
  v91[3] = objc_opt_class();
  v91[4] = objc_opt_class();
  v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:5];
  [v84 addObjectsFromArray:v85];

  [v4 setClasses:v84 forSelector:sel_requestRunPFLWithAttachments_recipeUserInfo_context_resultBlock_ argumentIndex:0 ofReply:0];
  v86 = (void *)MEMORY[0x1E4F1CA80];
  v87 = [v4 classesForSelector:sel_requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_context_reply_ argumentIndex:0 ofReply:0];
  v88 = [v86 setWithSet:v87];

  v90[0] = objc_opt_class();
  v90[1] = objc_opt_class();
  v90[2] = objc_opt_class();
  v90[3] = objc_opt_class();
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:4];
  [v88 addObjectsFromArray:v89];

  [v4 setClasses:v88 forSelector:sel_requestUpdateFeaturedContentBasedOnUserFeedbackWithPersonUUIDs_context_reply_ argumentIndex:0 ofReply:0];
}

@end