@interface PGMusicWrapper
+ (BOOL)cacheRemoveAllForPhotoLibrary:(id)a3 error:(id *)a4;
+ (id)_musicCurationFeaturesWithFeatureExtractionContext:(id)a3 assetFetchResult:(id)a4 graphManager:(id)a5 progressReporter:(id)a6 error:(id *)a7;
+ (id)_musicCurationFeaturesWithFeatureExtractionContext:(id)a3 memory:(id)a4 graphManager:(id)a5 progressReporter:(id)a6 error:(id *)a7;
+ (id)appleMusicCurationWithOptions:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (id)cacheStatusWithPhotoLibrary:(id)a3 error:(id *)a4;
+ (id)flexMusicCurationWithOptions:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (id)generateFlexMusicCurationDebugInformationForAssetCollection:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (id)generateFlexMusicCurationDebugInformationForSongWithUID:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (id)generateMusicCurationDebugInformationForAssetCollection:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (id)generateMusicCurationDebugInformationForSongWithAdamID:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6;
+ (void)fetchMusicCatalogAdamIDsForPurchasedSongID:(id)a3 inflationContext:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6;
+ (void)fetchSongDisplayMetadataJSONForAdamIDs:(id)a3 inflationContext:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6;
+ (void)requestFlexMusicCurationForAssetCollection:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6;
+ (void)requestFlexMusicCurationForAssetFetchResult:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6;
+ (void)requestFlexMusicCurationWithCurationOptions:(id)a3 graphManager:(id)a4 reply:(id)a5;
+ (void)requestMusicCurationForAssetCollection:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6;
+ (void)requestMusicCurationForAssetFetchResult:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6;
+ (void)requestMusicCurationWithCurationOptions:(id)a3 graphManager:(id)a4 reply:(id)a5;
+ (void)requestRecentlyUsedSongsWithOptions:(id)a3 graphManager:(id)a4 reply:(id)a5;
@end

@implementation PGMusicWrapper

+ (id)flexMusicCurationWithOptions:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 topicKeywordsAndWeights];
  v13 = v12;
  if (v12 && [v12 count])
  {
    id v88 = 0;
    v14 = [v10 musicCuratorContextWithCurationOptions:v9 error:&v88];
    id v85 = v88;
    if (!v14)
    {
      v62 = +[PGLogging sharedLogging];
      v63 = [v62 loggingConnection];

      v59 = v85;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v91 = (uint64_t)v85;
        _os_log_error_impl(&dword_1D1805000, v63, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation with options failed when creating curator context, error: %@", buf, 0xCu);
      }

      v46 = 0;
      if (a6) {
        *a6 = v85;
      }
      goto LABEL_52;
    }
    uint64_t v15 = [(id)objc_opt_class() flexMusicFeatureExtractionContextWithCuratorContext:v14];
    v16 = [[PGKeywordBasedFeatureExtractor alloc] initWithWeightByKeyword:v13];
    v17 = [v11 childProgressReporterFromStart:0.0 toEnd:0.2];
    id v87 = 0;
    v82 = v16;
    v83 = (void *)v15;
    uint64_t v18 = [(PGKeywordBasedFeatureExtractor *)v16 musicCurationFeaturesWithContext:v15 progressReporter:v17 error:&v87];
    id v19 = v87;

    v84 = (void *)v18;
    v81 = v19;
    if (!v18)
    {
      v64 = +[PGLogging sharedLogging];
      v65 = [v64 loggingConnection];

      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v91 = (uint64_t)v19;
        _os_log_error_impl(&dword_1D1805000, v65, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music option-based curation failed to extract features with error: %@", buf, 0xCu);
      }

      v59 = v85;
      if (a6)
      {
        id v66 = v19;
        v46 = 0;
        *a6 = v66;
      }
      else
      {
        v46 = 0;
      }
      goto LABEL_51;
    }
    v20 = [v10 photoLibrary];
    v21 = +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:v20];

    v22 = [v9 recentlyUsedBundledSongIDs];
    v23 = [MEMORY[0x1E4F1C9C8] date];
    v80 = v21;
    [v21 addSongIDs:v22 date:v23];

    uint64_t v78 = [v9 suggestedMood];
    v24 = &stru_1F283BC78;
    v77 = v14;
    if ([v9 shouldUseSpecificationOptionsForCuration])
    {
      v25 = +[PGLogging sharedLogging];
      v26 = [v25 loggingConnection];

      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[MemoriesMusic] Using specification options for flex", buf, 2u);
      }

      v27 = [v9 musicCurationSpecificationOptions];
      v28 = [v27 genres];
      uint64_t v29 = [v28 firstObject];
      v30 = (void *)v29;
      if (v29) {
        v31 = (__CFString *)v29;
      }
      else {
        v31 = &stru_1F283BC78;
      }
      v24 = v31;

      v32 = [v27 moods];
      v33 = v32;
      if (v32 && [v32 count])
      {
        v34 = [v33 firstObject];
        uint64_t v78 = +[PGMusicCurationSpecificationOptions PHMemoryMoodFromNumber:v34];
      }
      v35 = +[PGLogging sharedLogging];
      v36 = [v35 loggingConnection];

      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v91 = (uint64_t)v33;
        __int16 v92 = 2112;
        v93 = v24;
        _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "[MemoriesMusic] Specification options mood=%@ | genre=%@", buf, 0x16u);
      }

      v14 = v77;
    }
    v37 = +[PGLogging sharedLogging];
    v38 = [v37 loggingConnection];

    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v91 = v78;
      __int16 v92 = 2112;
      v93 = v24;
      _os_log_impl(&dword_1D1805000, v38, OS_LOG_TYPE_INFO, "[MemoriesMusic] Final mood:%llu, genre: %@", buf, 0x16u);
    }

    v39 = [PGFlexMusicCurationParameters alloc];
    v40 = [MEMORY[0x1E4F29128] UUID];
    v41 = [v40 UUIDString];
    v42 = [(PGFlexMusicCurationParameters *)v39 initWithMood:v78 moodKeywords:MEMORY[0x1E4F1CBF0] recentlyUsedSongs:v80 entityUUID:v41 useMoodKeywords:0 features:v84 musicCuratorContext:v14 genre:v24];

    v43 = +[PGLogging sharedLogging];
    v44 = [v43 loggingConnection];

    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v44, OS_LOG_TYPE_INFO, "[MemoriesMusic] Curating Flex Music using options", buf, 2u);
    }

    v45 = [v11 childProgressReporterFromStart:0.2 toEnd:1.0];
    id v86 = 0;
    v46 = +[PGFlexMusicCurator curateFlexMusicWithCurationParameters:v42 progressReporter:v45 error:&v86];
    id v47 = v86;

    id v76 = v10;
    if (!v46)
    {
      id v56 = v11;
      v57 = v24;
      +[PGLogging sharedLogging];
      v68 = id v67 = v47;
      v69 = [v68 loggingConnection];

      id v47 = v67;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v91 = (uint64_t)v67;
        _os_log_error_impl(&dword_1D1805000, v69, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation using options failed with Error: %@", buf, 0xCu);
      }

      v59 = v85;
      if (a6) {
        *a6 = v47;
      }
      goto LABEL_50;
    }
    uint64_t v48 = [v9 musicCurationSpecificationOptions];
    if (v48)
    {
      v49 = (void *)v48;
      v50 = [v9 musicCurationSpecificationOptions];
      if (![v50 shouldDownloadKeyFlexSong]) {
        goto LABEL_31;
      }
      uint64_t v51 = [v46 bestSongSuggestions];
      if (!v51) {
        goto LABEL_31;
      }
      v79 = (void *)v51;
      v75 = [v46 bestSongSuggestions];
      uint64_t v52 = [v75 firstObject];
      if (!v52)
      {
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      v72 = (void *)v52;
      v71 = [v46 bestSongSuggestions];
      [v71 firstObject];
      v53 = id v74 = v47;
      v73 = [v53 uid];

      id v47 = v74;
      if (v73)
      {
        v54 = +[PGLogging sharedLogging];
        v55 = [v54 loggingConnection];

        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v55, OS_LOG_TYPE_INFO, "[MemoriesMusic] Cache the key flex song, which triggers the song assets download", buf, 2u);
        }

        v49 = [v46 bestSongSuggestions];
        v50 = [v49 firstObject];
        v79 = [v50 uid];
        v89 = v79;
        v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
        +[PGFlexMusicCacher cacheSongAudioAndArtworkForUIDs:](PGFlexMusicCacher, "cacheSongAudioAndArtworkForUIDs:");
        id v47 = v74;
        goto LABEL_30;
      }
    }
LABEL_32:
    id v56 = v11;
    v57 = v24;
    id v58 = v46;
    v59 = v85;
LABEL_50:

    id v11 = v56;
    id v10 = v76;
    v14 = v77;
LABEL_51:

LABEL_52:
    goto LABEL_53;
  }
  v60 = +[PGLogging sharedLogging];
  v61 = [v60 loggingConnection];

  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1805000, v61, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation with options failed with empty keywords and weights dictionary", buf, 2u);
  }

  if (a6)
  {
    +[PGError errorWithCode:-8 description:@"Flex Music curation: No topic keywords and weights provided in options"];
    v46 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = 0;
  }
LABEL_53:

  return v46;
}

+ (id)appleMusicCurationWithOptions:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 topicKeywordsAndWeights];
  v13 = v12;
  if (v12 && [v12 count])
  {
    id v43 = 0;
    v14 = [v10 musicCuratorContextWithCurationOptions:v9 error:&v43];
    id v15 = v43;
    if (v14)
    {
      uint64_t v16 = [(id)objc_opt_class() appleMusicFeatureExtractionContextWithCuratorContext:v14];
      v17 = [[PGKeywordBasedFeatureExtractor alloc] initWithWeightByKeyword:v13];
      uint64_t v18 = [v11 childProgressReporterFromStart:0.0 toEnd:0.2];
      id v42 = 0;
      v39 = v17;
      v40 = (void *)v16;
      id v19 = [(PGKeywordBasedFeatureExtractor *)v17 musicCurationFeaturesWithContext:v16 progressReporter:v18 error:&v42];
      id v38 = v42;

      v20 = +[PGLogging sharedLogging];
      v21 = [v20 loggingConnection];

      if (v19)
      {
        id v37 = v15;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "[MemoriesMusic] Curating Apple Music using options", buf, 2u);
        }

        v22 = [v11 childProgressReporterFromStart:0.2 toEnd:1.0];
        id v41 = 0;
        v23 = +[PGMusicCurator curateMusicForFeatures:v19 context:v14 progressReporter:v22 error:&v41];
        id v24 = v41;

        if (v23)
        {
          id v25 = v23;
          id v15 = v37;
        }
        else
        {
          v36 = v19;
          v31 = +[PGLogging sharedLogging];
          [v31 loggingConnection];
          v33 = id v32 = v24;

          v34 = v33;
          id v24 = v32;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v45 = v32;
            _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation error with error: %@", buf, 0xCu);
          }

          id v19 = v36;
          id v15 = v37;
          if (a6) {
            *a6 = v24;
          }
        }

        v30 = v38;
      }
      else
      {
        v30 = v38;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v38;
          _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation failed to extract features with error: %@", buf, 0xCu);
        }

        v23 = 0;
        if (a6) {
          *a6 = v38;
        }
      }
    }
    else
    {
      v28 = +[PGLogging sharedLogging];
      uint64_t v29 = [v28 loggingConnection];

      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v15;
        _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation failed when creating curator context, error: %@", buf, 0xCu);
      }

      v23 = 0;
      if (a6) {
        *a6 = v15;
      }
    }
  }
  else
  {
    v26 = +[PGLogging sharedLogging];
    v27 = [v26 loggingConnection];

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v27, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation failed with empty keywords and weights dictionary", buf, 2u);
    }

    if (a6)
    {
      +[PGError errorWithCode:-8 description:@"No topic keywords and weights provided in options"];
      v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

+ (id)_musicCurationFeaturesWithFeatureExtractionContext:(id)a3 assetFetchResult:(id)a4 graphManager:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__22221;
  id v38 = __Block_byref_object_dispose__22222;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__22221;
  id v32 = __Block_byref_object_dispose__22222;
  id v33 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __122__PGMusicWrapper__musicCurationFeaturesWithFeatureExtractionContext_assetFetchResult_graphManager_progressReporter_error___block_invoke;
  v22[3] = &unk_1E68E8500;
  v26 = &v34;
  id v15 = v12;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  id v17 = v14;
  id v25 = v17;
  v27 = &v28;
  [v13 performSynchronousConcurrentGraphReadUsingBlock:v22];
  uint64_t v18 = (void *)v35[5];
  if (v18)
  {
    id v19 = v18;
  }
  else if (a7)
  {
    v20 = (void *)v29[5];
    if (v20) {
      *a7 = v20;
    }
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

void __122__PGMusicWrapper__musicCurationFeaturesWithFeatureExtractionContext_assetFetchResult_graphManager_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 graph];
  v4 = [*(id *)(a1 + 32) fetchedObjects];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = +[PGMusicCurator extractMusicCurationFeaturesForAssets:v4 graph:v3 context:v5 progressReporter:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (id)_musicCurationFeaturesWithFeatureExtractionContext:(id)a3 memory:(id)a4 graphManager:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__22221;
  id v38 = __Block_byref_object_dispose__22222;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__22221;
  id v32 = __Block_byref_object_dispose__22222;
  id v33 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __112__PGMusicWrapper__musicCurationFeaturesWithFeatureExtractionContext_memory_graphManager_progressReporter_error___block_invoke;
  v22[3] = &unk_1E68E8500;
  v26 = &v34;
  id v15 = v12;
  id v23 = v15;
  id v16 = v11;
  id v24 = v16;
  id v17 = v14;
  id v25 = v17;
  v27 = &v28;
  [v13 performSynchronousConcurrentGraphReadUsingBlock:v22];
  uint64_t v18 = (void *)v35[5];
  if (v18)
  {
    id v19 = v18;
  }
  else if (a7)
  {
    v20 = (void *)v29[5];
    if (v20) {
      *a7 = v20;
    }
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v18;
}

void __112__PGMusicWrapper__musicCurationFeaturesWithFeatureExtractionContext_memory_graphManager_progressReporter_error___block_invoke(void *a1, void *a2)
{
  v3 = [a2 graph];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = +[PGMusicCurator extractMusicCurationFeaturesForMemory:v4 graph:v3 context:v5 progressReporter:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (void)requestRecentlyUsedSongsWithOptions:(id)a3 graphManager:(id)a4 reply:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void *))a5;
  id v10 = +[PGLogging memoriesMusicLogging];
  id v11 = [v10 loggingConnection];

  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  id v13 = v11;
  id v14 = v13;
  unint64_t v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "RequestRecentlyUsedSongsWithOptions", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  os_signpost_id_t spid = v12;
  uint64_t v38 = mach_absolute_time();
  if (v7
    && (uint64_t v16 = *MEMORY[0x1E4F8AF08],
        [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8AF08]],
        id v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v17))
  {
    uint64_t v18 = [v7 objectForKeyedSubscript:v16];
    id v19 = v18;
    if (v18)
    {
      if ([v18 isEqualToString:*MEMORY[0x1E4F8AEF8]])
      {
        v20 = v8;
        v21 = [v8 photoLibrary];
        v22 = +[PGMusicCurationRecentlyUsedSongs recentlyUsedAppleMusicSongsFromPhotoLibrary:v21];

        id v23 = [v22 allEntries];
        id v24 = +[PGLogging sharedLogging];
        id v25 = [v24 loggingConnection];

        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v23;
          v26 = "[MemoriesMusic] recentlyUsedAppleMusicSongs: %@";
LABEL_14:
          _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, v26, buf, 0xCu);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      if ([v19 isEqualToString:*MEMORY[0x1E4F8AF00]])
      {
        v20 = v8;
        v27 = [v8 photoLibrary];
        v22 = +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:v27];

        id v23 = [v22 allEntries];
        uint64_t v28 = +[PGLogging sharedLogging];
        id v25 = [v28 loggingConnection];

        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v23;
          v26 = "[MemoriesMusic] recentlyUsedFlexMusicSongs: %@";
          goto LABEL_14;
        }
LABEL_15:

        uint64_t v29 = +[PGError xpcSafeErrorWithError:0];
        v9[2](v9, v23, v29);
        goto LABEL_20;
      }
    }
    v20 = v8;
  }
  else
  {
    v20 = v8;
    id v19 = 0;
  }
  v22 = [NSString stringWithFormat:@"requestRecentlyUsedSongsWithOptions is missing a required options key or value"];
  uint64_t v30 = +[PGLogging sharedLogging];
  v31 = [v30 loggingConnection];

  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = (const char *)v22;
    _os_log_error_impl(&dword_1D1805000, v31, OS_LOG_TYPE_ERROR, "[MemoriesMusic] %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 2, v22);
  id v23 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = +[PGError xpcSafeErrorWithError:v23];
  v9[2](v9, 0, v29);
LABEL_20:

  uint64_t v32 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v35 = v14;
  uint64_t v36 = v35;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v36, OS_SIGNPOST_INTERVAL_END, spid, "RequestRecentlyUsedSongsWithOptions", "", buf, 2u);
  }

  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v41 = "RequestRecentlyUsedSongsWithOptions";
    __int16 v42 = 2048;
    double v43 = (float)((float)((float)((float)(v32 - v38) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

+ (void)requestFlexMusicCurationWithCurationOptions:(id)a3 graphManager:(id)a4 reply:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void *, void *))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[PGLogging memoriesMusicLogging];
  os_signpost_id_t v12 = [v11 loggingConnection];

  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  id v14 = v12;
  unint64_t v15 = v14;
  unint64_t v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "FlexMusicCurationUsingOptions", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v50 = mach_absolute_time();
  id v17 = +[PGLogging sharedLogging];
  uint64_t v18 = [v17 loggingConnection];

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Flex Music curation using curation options", buf, 2u);
  }

  id v19 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:&__block_literal_global_370];
  id v51 = 0;
  v20 = [a1 flexMusicCurationWithOptions:v10 graphManager:v9 progressReporter:v19 error:&v51];

  v21 = (char *)v51;
  if (v20)
  {
    v22 = [v20 expandedJsonRepresentation];
    if (v22)
    {
      id v23 = +[PGLogging sharedLogging];
      id v24 = [v23 loggingConnection];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v22;
        _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Flex Music curation using provided options: %@", buf, 0xCu);
      }

      id v25 = +[PGError xpcSafeErrorWithError:0];
      v8[2](v8, v22, v25);

      uint64_t v26 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v29 = v15;
      uint64_t v30 = v29;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v30, OS_SIGNPOST_INTERVAL_END, v13, "FlexMusicCurationUsingOptions", "", buf, 2u);
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "FlexMusicCurationUsingOptions";
        __int16 v55 = 2048;
        double v56 = (float)((float)((float)((float)(v26 - v50) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }
    else
    {
      os_signpost_id_t spid = v13;
      uint64_t v39 = [NSString stringWithFormat:@"Failed to serialize flex music curation object to JSON: %@", v20];
      v40 = +[PGLogging sharedLogging];
      id v41 = [v40 loggingConnection];

      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v54 = (const char *)v39;
        _os_log_error_impl(&dword_1D1805000, v41, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation using options failed with serialization error: %@", buf, 0xCu);
      }

      v49 = (void *)v39;
      __int16 v42 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, v39);
      v8[2](v8, 0, v42);
      uint64_t v43 = mach_absolute_time();
      uint32_t v45 = info.numer;
      uint32_t v44 = info.denom;
      uint64_t v46 = v15;
      id v47 = v46;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v47, OS_SIGNPOST_INTERVAL_END, spid, "FlexMusicCurationUsingOptions", "", buf, 2u);
      }

      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "FlexMusicCurationUsingOptions";
        __int16 v55 = 2048;
        double v56 = (float)((float)((float)((float)(v43 - v50) * (float)v45) / (float)v44) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }
  }
  else
  {
    v31 = +[PGLogging sharedLogging];
    uint64_t v32 = [v31 loggingConnection];

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v21;
      _os_log_error_impl(&dword_1D1805000, v32, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation using options failed with Error: %@", buf, 0xCu);
    }

    id v33 = +[PGError xpcSafeErrorWithError:v21];
    v8[2](v8, 0, v33);

    uint64_t v34 = mach_absolute_time();
    uint32_t v36 = info.numer;
    uint32_t v35 = info.denom;
    id v37 = v15;
    uint64_t v38 = v37;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v38, OS_SIGNPOST_INTERVAL_END, v13, "FlexMusicCurationUsingOptions", "", buf, 2u);
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "FlexMusicCurationUsingOptions";
      __int16 v55 = 2048;
      double v56 = (float)((float)((float)((float)(v34 - v50) * (float)v36) / (float)v35) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

+ (void)requestMusicCurationWithCurationOptions:(id)a3 graphManager:(id)a4 reply:(id)a5
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v87 = a5;
  id v10 = +[PGLogging memoriesMusicLogging];
  id v11 = [v10 loggingConnection];

  os_signpost_id_t v12 = v11;
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  id v14 = v12;
  unint64_t v15 = v14;
  unint64_t v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MusicCurationUsingOptions", "", buf, 2u);
  }
  os_signpost_id_t spid = v13;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v86 = mach_absolute_time();
  int v17 = [v8 shouldUseSpecificationOptionsForCuration];
  uint64_t v18 = +[PGLogging sharedLogging];
  id v19 = [v18 loggingConnection];

  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (!v17)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Apple Music curation using curation options", buf, 2u);
    }

    v21 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:&__block_literal_global_364];
    id v99 = 0;
    uint64_t v32 = [a1 appleMusicCurationWithOptions:v8 graphManager:v9 progressReporter:v21 error:&v99];
    id v24 = (PGSpecificationBasedMusicCurator *)v99;
    if (!v32)
    {
      v54 = +[PGLogging sharedLogging];
      __int16 v55 = [v54 loggingConnection];

      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v103 = (const char *)v24;
        _os_log_error_impl(&dword_1D1805000, v55, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation failed error: %@", buf, 0xCu);
      }

      double v56 = +[PGError xpcSafeErrorWithError:v24];
      uint64_t v26 = v87;
      (*((void (**)(id, void, void *))v87 + 2))(v87, 0, v56);

      uint64_t v27 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v57 = v15;
      v31 = v57;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v31, OS_SIGNPOST_INTERVAL_END, spid, "MusicCurationUsingOptions", "", buf, 2u);
      }

      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
        goto LABEL_36;
      }
      goto LABEL_53;
    }
    id v33 = v21;
    v21 = (void *)v32;
LABEL_21:

    id v37 = [v21 keySongAdamID];

    if (v37)
    {
      uint64_t v38 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v39 = [v21 keySongAdamID];
      v40 = objc_msgSend(v38, "arrayWithObjects:", v39, 0);

      id v41 = +[PGLogging sharedLogging];
      __int16 v42 = [v41 loggingConnection];

      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        uint64_t v43 = [v40 objectAtIndexedSubscript:0];
        *(_DWORD *)buf = 138412290;
        v103 = v43;
        _os_log_impl(&dword_1D1805000, v42, OS_LOG_TYPE_INFO, "[MemoriesMusic] Start Caching the key Apple Music song %@ for MC. It should trigger the song assets download.", buf, 0xCu);
      }
      uint32_t v44 = [MEMORY[0x1E4F71F08] ignoreProgress];
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __77__PGMusicWrapper_requestMusicCurationWithCurationOptions_graphManager_reply___block_invoke_365;
      v97[3] = &unk_1E68EAB90;
      id v98 = v40;
      id v45 = v40;
      +[PGMusicAudioCacher cacheSongAudioForAdamIDs:v45 progressReporter:v44 completionHandler:v97];
    }
    id v84 = v8;
    uint64_t v46 = +[PGLogging sharedLogging];
    id v47 = [v46 loggingConnection];

    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, "[MemoriesMusic] Inflating Apple Music option-based curation", buf, 2u);
    }

    uint64_t v48 = [[PGMusicCurationInflationOptions alloc] initWithInflationActionSource:1];
    id v96 = 0;
    [v9 musicCurationInflationContextWithInflationOptions:v48 error:&v96];
    uint64_t v50 = v49 = v9;
    id v24 = (PGSpecificationBasedMusicCurator *)v96;
    v83 = v49;
    if (v50)
    {
      id v95 = 0;
      id v51 = [v49 musicCuratorContextWithCurationOptions:v84 error:&v95];
      uint64_t v52 = (char *)v95;
      if (v51)
      {
        v53 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:&__block_literal_global_368];
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __77__PGMusicWrapper_requestMusicCurationWithCurationOptions_graphManager_reply___block_invoke_2;
        v88[3] = &unk_1E68E7598;
        id v91 = v87;
        uint64_t v92 = v86;
        mach_timebase_info v94 = info;
        v89 = v15;
        os_signpost_id_t v93 = spid;
        id v90 = v21;
        +[PGMusicCurator inflateDisplayMetadataForMusicCuration:v90 inflationContext:v50 curatorContext:v51 progressReporter:v53 completionHandler:v88];
      }
      else
      {
        id v66 = +[PGLogging sharedLogging];
        id v67 = [v66 loggingConnection];

        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v103 = v52;
          _os_log_error_impl(&dword_1D1805000, v67, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation musicCuratorContext error: %{public}@", buf, 0xCu);
        }

        v68 = +[PGError xpcSafeErrorWithError:v52];
        (*((void (**)(id, void, void *))v87 + 2))(v87, 0, v68);

        uint64_t v69 = mach_absolute_time();
        uint32_t v71 = info.numer;
        uint32_t v70 = info.denom;
        v72 = v15;
        v73 = v72;
        if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v73, OS_SIGNPOST_INTERVAL_END, spid, "MusicCurationUsingOptions", "", buf, 2u);
        }

        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v103 = "MusicCurationUsingOptions";
          __int16 v104 = 2048;
          double v105 = (float)((float)((float)((float)(v69 - v86) * (float)v71) / (float)v70) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v73, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
      }

      uint64_t v26 = v87;
    }
    else
    {
      id v58 = +[PGLogging sharedLogging];
      v59 = [v58 loggingConnection];

      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v103 = (const char *)v24;
        _os_log_error_impl(&dword_1D1805000, v59, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation inflation error: %{public}@", buf, 0xCu);
      }

      v60 = +[PGError xpcSafeErrorWithError:v24];
      uint64_t v26 = v87;
      (*((void (**)(id, void, void *))v87 + 2))(v87, 0, v60);

      uint64_t v61 = mach_absolute_time();
      uint32_t v63 = info.numer;
      uint32_t v62 = info.denom;
      v64 = v15;
      v65 = v64;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v65, OS_SIGNPOST_INTERVAL_END, spid, "MusicCurationUsingOptions", "", buf, 2u);
      }

      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v103 = "MusicCurationUsingOptions";
        __int16 v104 = 2048;
        double v105 = (float)((float)((float)((float)(v61 - v86) * (float)v63) / (float)v62) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v65, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }

    id v9 = v83;
    id v8 = v84;
    goto LABEL_53;
  }
  if (v20)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Apple Music curation using specification options", buf, 2u);
  }

  v21 = [v8 musicCurationSpecificationOptions];
  if (![v21 isQUEmpty])
  {
    id v24 = [[PGSpecificationBasedMusicCurator alloc] initWithOptions:v21];
    id v100 = 0;
    uint64_t v34 = [(PGSpecificationBasedMusicCurator *)v24 musicCurationAndReturnError:&v100];
    id v35 = v100;
    uint32_t v36 = v35;
    if (!v34)
    {
      id v74 = +[PGLogging sharedLogging];
      v75 = [v74 loggingConnection];

      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        v82 = [v36 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v103 = v82;
        _os_log_error_impl(&dword_1D1805000, v75, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music specification-based curation failed with error: %@", buf, 0xCu);
      }
      id v76 = +[PGError xpcSafeErrorWithError:v36];
      uint64_t v26 = v87;
      (*((void (**)(id, void, void *))v87 + 2))(v87, 0, v76);

      uint64_t v77 = mach_absolute_time();
      uint32_t v79 = info.numer;
      uint32_t v78 = info.denom;
      v80 = v15;
      v81 = v80;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v81, OS_SIGNPOST_INTERVAL_END, spid, "MusicCurationUsingOptions", "", buf, 2u);
      }

      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v103 = "MusicCurationUsingOptions";
        __int16 v104 = 2048;
        double v105 = (float)((float)((float)((float)(v77 - v86) * (float)v79) / (float)v78) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v81, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

      goto LABEL_53;
    }

    id v33 = v21;
    v21 = (void *)v34;
    goto LABEL_21;
  }
  v22 = +[PGLogging sharedLogging];
  id v23 = [v22 loggingConnection];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v103 = (const char *)@"Apple Music curation failed since specificationOptions is empty";
    _os_log_error_impl(&dword_1D1805000, v23, OS_LOG_TYPE_ERROR, "[MemoriesMusic] %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, @"Apple Music curation failed since specificationOptions is empty");
  id v24 = (PGSpecificationBasedMusicCurator *)objc_claimAutoreleasedReturnValue();
  id v25 = +[PGError xpcSafeErrorWithError:v24];
  uint64_t v26 = v87;
  (*((void (**)(id, void, void *))v87 + 2))(v87, 0, v25);

  uint64_t v27 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v30 = v15;
  v31 = v30;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v31, OS_SIGNPOST_INTERVAL_END, spid, "MusicCurationUsingOptions", "", buf, 2u);
  }

  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
LABEL_36:
    *(_DWORD *)buf = 136315394;
    v103 = "MusicCurationUsingOptions";
    __int16 v104 = 2048;
    double v105 = (float)((float)((float)((float)(v27 - v86) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
LABEL_53:
}

void __77__PGMusicWrapper_requestMusicCurationWithCurationOptions_graphManager_reply___block_invoke_365(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[PGLogging sharedLogging];
  id v7 = [v6 loggingConnection];

  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[MemoriesMusic] Cached Key Apple Music Song: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Attempt to cache key AM song failed with error: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

void __77__PGMusicWrapper_requestMusicCurationWithCurationOptions_graphManager_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 jsonRepresentation];
    if (v6)
    {
      id v7 = +[PGLogging sharedLogging];
      id v8 = [v7 loggingConnection];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v42 = v6;
        _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Apple Music curation using provided options: %@", buf, 0xCu);
      }

      int v9 = +[PGError xpcSafeErrorWithError:0];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      uint64_t v10 = mach_absolute_time();
      uint64_t v11 = *(void *)(a1 + 56);
      unsigned int v13 = *(_DWORD *)(a1 + 72);
      unsigned int v12 = *(_DWORD *)(a1 + 76);
      id v14 = *(id *)(a1 + 32);
      unint64_t v15 = v14;
      os_signpost_id_t v16 = *(void *)(a1 + 64);
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_END, v16, "MusicCurationUsingOptions", "", buf, 2u);
      }

      int v17 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v42 = "MusicCurationUsingOptions";
        __int16 v43 = 2048;
        double v44 = (float)((float)((float)((float)(v10 - v11) * (float)v13) / (float)v12) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v29 = [NSString stringWithFormat:@"Failed to serialize inflated music curation object to JSON: %@", *(void *)(a1 + 40)];
      uint64_t v30 = +[PGLogging sharedLogging];
      v31 = [v30 loggingConnection];

      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v42 = v29;
        _os_log_error_impl(&dword_1D1805000, v31, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation error: %@", buf, 0xCu);
      }

      uint64_t v32 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, v29);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v33 = mach_absolute_time();
      uint64_t v34 = *(void *)(a1 + 56);
      unsigned int v36 = *(_DWORD *)(a1 + 72);
      unsigned int v35 = *(_DWORD *)(a1 + 76);
      id v37 = *(id *)(a1 + 32);
      uint64_t v38 = v37;
      os_signpost_id_t v39 = *(void *)(a1 + 64);
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v38, OS_SIGNPOST_INTERVAL_END, v39, "MusicCurationUsingOptions", "", buf, 2u);
      }

      v40 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v42 = "MusicCurationUsingOptions";
        __int16 v43 = 2048;
        double v44 = (float)((float)((float)((float)(v33 - v34) * (float)v36) / (float)v35) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v18 = +[PGLogging sharedLogging];
    id v19 = [v18 loggingConnection];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v42 = v5;
      _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music option-based curation inflation failed with error: %@", buf, 0xCu);
    }

    BOOL v20 = +[PGError xpcSafeErrorWithError:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    uint64_t v21 = mach_absolute_time();
    uint64_t v22 = *(void *)(a1 + 56);
    unsigned int v24 = *(_DWORD *)(a1 + 72);
    unsigned int v23 = *(_DWORD *)(a1 + 76);
    id v25 = *(id *)(a1 + 32);
    uint64_t v26 = v25;
    os_signpost_id_t v27 = *(void *)(a1 + 64);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v26, OS_SIGNPOST_INTERVAL_END, v27, "MusicCurationUsingOptions", "", buf, 2u);
    }

    uint64_t v28 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v42 = "MusicCurationUsingOptions";
      __int16 v43 = 2048;
      double v44 = (float)((float)((float)((float)(v21 - v22) * (float)v24) / (float)v23) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

+ (void)fetchMusicCatalogAdamIDsForPurchasedSongID:(id)a3 inflationContext:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
}

+ (BOOL)cacheRemoveAllForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v5 = +[PGMusicCache cacheWithPhotoLibrary:error:](PGMusicCache, "cacheWithPhotoLibrary:error:", a3);
  uint64_t v6 = [MEMORY[0x1E4F71F08] ignoreProgress];
  LOBYTE(a4) = [v5 removeAllWithProgressReporter:v6 error:a4];

  return (char)a4;
}

+ (id)cacheStatusWithPhotoLibrary:(id)a3 error:(id *)a4
{
  id v5 = +[PGMusicCache cacheWithPhotoLibrary:error:](PGMusicCache, "cacheWithPhotoLibrary:error:", a3);
  uint64_t v6 = [v5 statusAndReturnError:a4];

  return v6;
}

+ (id)generateMusicCurationDebugInformationForAssetCollection:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned int v12 = [v10 musicCuratorContextWithRecentlyUsedSongAdamIDs:0 error:a6];
  if (v12)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    unsigned int v24 = __Block_byref_object_copy__22221;
    id v25 = __Block_byref_object_dispose__22222;
    id v26 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __110__PGMusicWrapper_generateMusicCurationDebugInformationForAssetCollection_graphManager_progressReporter_error___block_invoke;
    v15[3] = &unk_1E68E8D20;
    id v19 = &v21;
    id v16 = v9;
    id v17 = v12;
    id v18 = v11;
    BOOL v20 = a6;
    [v10 performSynchronousConcurrentGraphReadUsingBlock:v15];
    id v13 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __110__PGMusicWrapper_generateMusicCurationDebugInformationForAssetCollection_graphManager_progressReporter_error___block_invoke(void *a1, void *a2)
{
  id v6 = [a2 graph];
  uint64_t v3 = +[PGMusicCurator generateDebugInformationForAssetCollection:a1[4] graph:v6 context:a1[5] progressReporter:a1[6] error:a1[8]];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)generateMusicCurationDebugInformationForSongWithAdamID:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [a4 musicCuratorContextWithRecentlyUsedSongAdamIDs:0 error:a6];
  if (v11)
  {
    unsigned int v12 = +[PGMusicCurator generateDebugInformationForSongWithAdamID:v9 context:v11 progressReporter:v10 error:a6];
  }
  else
  {
    unsigned int v12 = 0;
  }

  return v12;
}

+ (id)generateFlexMusicCurationDebugInformationForAssetCollection:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  unsigned int v24 = __Block_byref_object_copy__22221;
  id v25 = __Block_byref_object_dispose__22222;
  id v26 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __114__PGMusicWrapper_generateFlexMusicCurationDebugInformationForAssetCollection_graphManager_progressReporter_error___block_invoke;
  v16[3] = &unk_1E68F0C70;
  id v19 = &v21;
  id v12 = v9;
  id v17 = v12;
  id v13 = v11;
  id v18 = v13;
  BOOL v20 = a6;
  [v10 performSynchronousConcurrentGraphReadUsingBlock:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __114__PGMusicWrapper_generateFlexMusicCurationDebugInformationForAssetCollection_graphManager_progressReporter_error___block_invoke(void *a1, void *a2)
{
  id v6 = [a2 graph];
  uint64_t v3 = +[PGFlexMusicCurator generateDebugInformationForAssetCollection:a1[4] graph:v6 progressReporter:a1[5] error:a1[7]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)generateFlexMusicCurationDebugInformationForSongWithUID:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  return +[PGFlexMusicCurator generateDebugInformationForSongWithUID:a3 progressReporter:a5 error:a6];
}

+ (void)fetchSongDisplayMetadataJSONForAdamIDs:(id)a3 inflationContext:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __109__PGMusicWrapper_fetchSongDisplayMetadataJSONForAdamIDs_inflationContext_progressReporter_completionHandler___block_invoke;
  v11[3] = &unk_1E68E75C0;
  id v12 = v9;
  id v10 = v9;
  +[PGMusicCurator fetchSongDisplayMetadataJSONForAdamIDs:a3 inflationContext:a4 progressReporter:a5 completionHandler:v11];
}

uint64_t __109__PGMusicWrapper_fetchSongDisplayMetadataJSONForAdamIDs_inflationContext_progressReporter_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)requestFlexMusicCurationForAssetFetchResult:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, void *))a6;
  id v14 = +[PGLogging sharedLogging];
  unint64_t v15 = [v14 loggingConnection];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building flex music curation context for asset fetch result.", buf, 2u);
  }

  if ([v10 count])
  {
    id v69 = 0;
    id v16 = [v12 musicCuratorContextWithCurationOptions:v11 error:&v69];
    id v17 = (__CFString *)v69;
    if (v16)
    {
      id v18 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:&__block_literal_global_352];
      v65 = v16;
      id v66 = [(id)objc_opt_class() flexMusicFeatureExtractionContextWithCuratorContext:v16];
      id v19 = +[PGLogging sharedLogging];
      BOOL v20 = [v19 loggingConnection];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[MemoriesMusic] Extracting music curation features from asset fetch result for Flex Music curation", buf, 2u);
      }

      uint64_t v21 = [v18 childProgressReporterFromStart:0.0 toEnd:0.2];
      id v68 = 0;
      uint64_t v22 = [a1 _musicCurationFeaturesWithFeatureExtractionContext:v66 assetFetchResult:v10 graphManager:v12 progressReporter:v21 error:&v68];
      uint32_t v63 = (__CFString *)v68;

      v64 = (void *)v22;
      if (v22)
      {
        uint32_t v62 = v18;
        uint64_t v23 = [v12 photoLibrary];
        unsigned int v24 = +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:v23];

        id v59 = v11;
        id v25 = [v11 recentlyUsedBundledSongIDs];
        id v26 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v61 = v24;
        [v24 addSongIDs:v25 date:v26];

        os_signpost_id_t v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        if ([v10 count])
        {
          unint64_t v28 = 0;
          do
          {
            uint64_t v29 = (void *)MEMORY[0x1D25FED50]();
            uint64_t v30 = [v10 objectAtIndexedSubscript:v28];
            v31 = [v30 localIdentifier];
            [v27 addObject:v31];

            ++v28;
          }
          while (v28 < [v10 count]);
        }
        uint64_t v32 = [v27 sortedArrayUsingSelector:sel_compare_];
        uint64_t v33 = [PGFlexMusicCurationParameters alloc];
        id v58 = v32;
        uint64_t v34 = [v32 firstObject];
        uint64_t v35 = [(PGFlexMusicCurationParameters *)v33 initWithMood:16 moodKeywords:MEMORY[0x1E4F1CBF0] recentlyUsedSongs:v61 entityUUID:v34 useMoodKeywords:0 features:v64 musicCuratorContext:v65];

        id v67 = 0;
        uint64_t v57 = (void *)v35;
        unsigned int v36 = +[PGFlexMusicCurator curateFlexMusicWithCurationParameters:v35 progressReporter:v62 error:&v67];
        id v37 = (__CFString *)v67;
        uint64_t v38 = v37;
        if (v36)
        {
          v60 = v37;
          os_signpost_id_t v39 = [v36 jsonRepresentation];
          if (v39)
          {
            v40 = +[PGLogging sharedLogging];
            id v41 = [v40 loggingConnection];

            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint32_t v71 = v39;
              _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Flex Music curation for asset local identifiers: %@", buf, 0xCu);
            }

            __int16 v42 = +[PGError xpcSafeErrorWithError:v60];
            v13[2](v13, v39, v42);
          }
          else
          {
            __int16 v42 = [NSString stringWithFormat:@"Failed to serialize flex music curation object to JSON: %@", v36];
            v54 = +[PGLogging sharedLogging];
            __int16 v55 = [v54 loggingConnection];

            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint32_t v71 = v42;
              _os_log_error_impl(&dword_1D1805000, v55, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music serialization error: %@", buf, 0xCu);
            }

            uint64_t v56 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, v42);

            v13[2](v13, 0, (void *)v56);
            v60 = (__CFString *)v56;
          }
          id v18 = v62;
          v49 = v63;

          v53 = v60;
        }
        else
        {
          id v51 = +[PGLogging sharedLogging];
          uint64_t v52 = [v51 loggingConnection];

          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint32_t v71 = v38;
            _os_log_error_impl(&dword_1D1805000, v52, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music Curation Error: %@", buf, 0xCu);
          }

          +[PGError xpcSafeErrorWithError:v38];
          v53 = v38;
          os_signpost_id_t v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v13[2](v13, 0, v39);
          id v18 = v62;
          v49 = v63;
        }

        id v11 = v59;
        id v16 = v65;
        uint64_t v50 = v61;
      }
      else
      {
        id v47 = +[PGLogging sharedLogging];
        uint64_t v48 = [v47 loggingConnection];

        v49 = v63;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint32_t v71 = v63;
          _os_log_error_impl(&dword_1D1805000, v48, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music feature extraction error for assert fetch result: %@", buf, 0xCu);
        }

        uint64_t v50 = +[PGError xpcSafeErrorWithError:v63];
        v13[2](v13, 0, v50);
        id v16 = v65;
      }
    }
    else
    {
      uint64_t v45 = +[PGLogging sharedLogging];
      uint64_t v46 = [v45 loggingConnection];

      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint32_t v71 = v17;
        _os_log_error_impl(&dword_1D1805000, v46, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curator context error for asset fetch result: %@", buf, 0xCu);
      }

      id v18 = +[PGError xpcSafeErrorWithError:v17];
      v13[2](v13, 0, v18);
    }
  }
  else
  {
    __int16 v43 = +[PGLogging sharedLogging];
    double v44 = [v43 loggingConnection];

    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint32_t v71 = @"Cannot curate music for an empty asset fetch result.";
      _os_log_error_impl(&dword_1D1805000, v44, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music Curation Error: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, @"Cannot curate music for an empty asset fetch result.");
    id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v17);
  }
}

+ (void)requestFlexMusicCurationForAssetCollection:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = +[PGLogging sharedLogging];
  unint64_t v15 = [v14 loggingConnection];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Flex Music curation context for asset collection.", buf, 2u);
  }

  id v16 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:&__block_literal_global_341];
  id v17 = [v10 uuid];
  id v125 = 0;
  uint64_t v18 = [v12 musicCuratorContextWithCurationOptions:v11 error:&v125];
  id v119 = v125;
  v120 = (void *)v18;
  if (v18)
  {
    v118 = v17;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v20 = v10;
    uint64_t v21 = (void *)MEMORY[0x1E4F1CBF0];
    id v116 = v11;
    if ((isKindOfClass & 1) == 0)
    {
      id v117 = (id)MEMORY[0x1E4F1CBF0];
      id v24 = 0;
      uint64_t v113 = 16;
      id v10 = v20;
LABEL_16:
      v115 = v12;
      os_signpost_id_t v39 = [v12 photoLibrary];
      v40 = +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsFromPhotoLibrary:v39];

      id v41 = [v11 recentlyUsedBundledSongIDs];
      __int16 v42 = [MEMORY[0x1E4F1C9C8] date];
      [v40 addSongIDs:v41 date:v42];

      if ((isKindOfClass & 1) == 0)
      {
        __int16 v43 = [v115 photoLibrary];
        id v123 = 0;
        double v44 = +[PGMusicCurationRecentlyUsedSongs recentlyUsedFlexMusicSongsForCollectionsFromPhotoLibrary:v43 error:&v123];
        id v45 = v123;

        uint64_t v46 = +[PGLogging sharedLogging];
        id v47 = [v46 loggingConnection];

        if (!v44 || v45)
        {
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v128 = v45;
            _os_log_error_impl(&dword_1D1805000, v47, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Error getting the recently used Flex songs for collections. error=%@", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v128 = v44;
            _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, "[MemoriesMusic] recentlyUsedSongsForCollections = %@", buf, 0xCu);
          }

          [v40 appendWithOtherRecentlyUsed:v44];
        }

        id v11 = v116;
      }
      v112 = v40;
      uint64_t v48 = [[PGFlexMusicCurationParameters alloc] initWithMood:v113 moodKeywords:v117 recentlyUsedSongs:v40 entityUUID:v118 useMoodKeywords:0 features:v24 musicCuratorContext:v120];
      v49 = [v16 childProgressReporterFromStart:0.2 toEnd:1.0];
      id v122 = 0;
      v111 = v48;
      uint64_t v50 = +[PGFlexMusicCurator curateFlexMusicWithCurationParameters:v48 progressReporter:v49 error:&v122];
      id v114 = v122;

      if (!v50)
      {
        uint32_t v62 = +[PGLogging sharedLogging];
        uint32_t v63 = [v62 loggingConnection];

        v64 = v114;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          __int16 v104 = [v10 uuid];
          *(_DWORD *)buf = 138412546;
          id v128 = v104;
          __int16 v129 = 2112;
          id v130 = v114;
          _os_log_error_impl(&dword_1D1805000, v63, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation failed for asset collection (%@) with Error: %@", buf, 0x16u);
        }
        uint64_t v56 = +[PGError xpcSafeErrorWithError:v114];
        v13[2](v13, 0, v56);
        id v12 = v115;
        goto LABEL_68;
      }
      if (isKindOfClass)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v51 = (PGFlexMusicCurationManager *)v10;
          uint64_t v52 = v51;
          if (v51 && [(PGFlexMusicCurationManager *)v51 creationType] == 1)
          {
            v53 = +[PGLogging sharedLogging];
            v54 = [v53 loggingConnection];

            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1805000, v54, OS_LOG_TYPE_INFO, "[MemoriesMusic] Generative PHMemory so extract the curated music", buf, 2u);
            }

            __int16 v55 = [(PGFlexMusicCurationManager *)v52 extractGenerativeMemoryMusicCuration];
            if (v55)
            {
              uint64_t v56 = v55;
              id v107 = v24;
              uint64_t v57 = [v55 objectForKeyedSubscript:@"flexMusicSongIds"];
              id v58 = v57;
              if (v57 && [v57 count])
              {
                id v59 = +[PGLogging sharedLogging];
                v60 = [v59 loggingConnection];

                if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D1805000, v60, OS_LOG_TYPE_INFO, "[MemoriesMusic] Replacing replaceBestSongSuggestionsWithFlexSongIds", buf, 2u);
                }

                uint64_t v61 = [v50 replaceBestSongSuggestionsWithFlexSongIds:v58];

                uint64_t v50 = (void *)v61;
              }
LABEL_52:

              uint32_t v71 = v56;
              uint64_t v56 = v50;
              id v24 = v107;
LABEL_53:

              uint64_t v108 = [v56 jsonRepresentation];
              if (!v108)
              {
                id v96 = [NSString stringWithFormat:@"Failed to serialize flex music curation object to JSON: %@", v56];
                id v98 = +[PGLogging sharedLogging];
                id v99 = [v98 loggingConnection];

                if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v106 = [v10 uuid];
                  *(_DWORD *)buf = 138412546;
                  id v128 = v106;
                  __int16 v129 = 2112;
                  id v130 = v96;
                  _os_log_error_impl(&dword_1D1805000, v99, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curation failed for asset collection (%@) with serialization error: %@", buf, 0x16u);
                }
                uint64_t v100 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, v96);

                v13[2](v13, 0, (void *)v100);
                v64 = (void *)v100;
                id v12 = v115;
                v97 = 0;
                goto LABEL_67;
              }
              v110 = v13;
              v75 = +[PGLogging sharedLogging];
              id v76 = [v75 loggingConnection];

              v64 = v114;
              if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
              {
                uint64_t v77 = [v10 title];
                uint32_t v78 = [v10 uuid];
                *(_DWORD *)buf = 138412802;
                id v128 = v77;
                __int16 v129 = 2112;
                id v130 = v78;
                __int16 v131 = 2112;
                uint64_t v132 = v108;
                _os_log_impl(&dword_1D1805000, v76, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Flex Music curation for asset collection (%@) with uuid '%@': %@", buf, 0x20u);
              }
              uint64_t v79 = [v56 bestSongSuggestions];
              id v12 = v115;
              if (v79)
              {
                v80 = (void *)v79;
                v81 = [v56 bestSongSuggestions];
                uint64_t v82 = [v81 firstObject];
                if (!v82)
                {
LABEL_62:

                  goto LABEL_63;
                }
                v83 = (void *)v82;
                id v84 = [v56 bestSongSuggestions];
                id v85 = [v84 firstObject];
                uint64_t v86 = [v85 uid];

                v64 = v114;
                id v12 = v115;

                if (v86)
                {
                  id v87 = +[PGLogging sharedLogging];
                  id v88 = [v87 loggingConnection];

                  if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
                  {
                    v89 = [v56 bestSongSuggestions];
                    id v90 = [v89 firstObject];
                    id v91 = [v90 uid];
                    uint64_t v92 = [v10 title];
                    os_signpost_id_t v93 = [v10 uuid];
                    *(_DWORD *)buf = 138412802;
                    id v128 = v91;
                    __int16 v129 = 2112;
                    id v130 = v92;
                    __int16 v131 = 2112;
                    uint64_t v132 = (uint64_t)v93;
                    _os_log_impl(&dword_1D1805000, v88, OS_LOG_TYPE_INFO, "[MemoriesMusic] Cache the key flex song (%@) for collection with title '%@' and with uuid '%@'. This triggers the song assets download.", buf, 0x20u);

                    v64 = v114;
                  }

                  v80 = [v56 bestSongSuggestions];
                  v81 = [v80 firstObject];
                  mach_timebase_info v94 = [v81 uid];
                  v126 = v94;
                  id v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1];
                  +[PGFlexMusicCacher cacheSongAudioAndArtworkForUIDs:v95];

                  id v12 = v115;
                  goto LABEL_62;
                }
              }
LABEL_63:
              id v96 = +[PGError xpcSafeErrorWithError:v64];
              v97 = (void *)v108;
              id v13 = v110;
              v110[2](v110, v108, v96);
              id v11 = v116;
LABEL_67:

LABEL_68:
              uint64_t v38 = v117;
              id v17 = v118;
LABEL_69:

              id v37 = v119;
              goto LABEL_70;
            }
          }
        }
        else
        {
          uint64_t v52 = 0;
        }
        uint32_t v71 = 0;
        uint64_t v56 = v50;
        goto LABEL_53;
      }
      v65 = [v11 backingCollectionLocalIdentifier];
      id v66 = v65;
      id v107 = v24;
      if (v65)
      {
        id v67 = v65;
      }
      else
      {
        id v67 = [v11 assetCollectionLocalIdentifier];
      }
      uint64_t v56 = v67;

      uint64_t v52 = objc_alloc_init(PGFlexMusicCurationManager);
      uint64_t v72 = [v120 cache];
      v73 = [MEMORY[0x1E4F71F08] ignoreProgress];
      id v121 = 0;
      uint64_t v74 = [(PGFlexMusicCurationManager *)v52 adjustCurationForCollectionWithLocalIdentifier:v56 initialCuration:v50 cache:v72 progressReporter:v73 error:&v121];
      id v58 = v121;

      if (!v74)
      {
        v101 = +[PGLogging sharedLogging];
        v102 = [v101 loggingConnection];

        id v17 = v118;
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v128 = v118;
          __int16 v129 = 2112;
          id v130 = v58;
          _os_log_error_impl(&dword_1D1805000, v102, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Adjusting curation for collection (%@) failed with error: %@", buf, 0x16u);
        }

        v103 = +[PGError xpcSafeErrorWithError:v114];
        v13[2](v13, 0, v103);

        v64 = v114;
        id v12 = v115;
        id v11 = v116;
        uint64_t v38 = v117;
        id v24 = v107;
        goto LABEL_69;
      }
      uint64_t v50 = (void *)v74;
      id v11 = v116;
      goto LABEL_52;
    }
    v109 = v13;
    id v22 = v12;
    uint64_t v23 = v20;
    id v24 = v20;
    uint64_t v113 = [v24 suggestedMood];
    uint64_t v25 = [v24 moodKeywords];
    id v26 = (void *)v25;
    if (v25) {
      os_signpost_id_t v27 = (void *)v25;
    }
    else {
      os_signpost_id_t v27 = v21;
    }
    id v117 = v27;

    unint64_t v28 = [(id)objc_opt_class() flexMusicFeatureExtractionContextWithCuratorContext:v120];
    uint64_t v29 = +[PGLogging sharedLogging];
    uint64_t v30 = [v29 loggingConnection];

    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = [v24 uuid];
      *(_DWORD *)buf = 138412290;
      id v128 = v31;
      _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "[MemoriesMusic] Extracting music curation features for memory: %@ for Flex Music curation", buf, 0xCu);
    }
    uint64_t v32 = [v16 childProgressReporterFromStart:0.0 toEnd:0.2];
    id v124 = 0;
    uint64_t v33 = [a1 _musicCurationFeaturesWithFeatureExtractionContext:v28 memory:v24 graphManager:v22 progressReporter:v32 error:&v124];
    id v34 = v124;

    if (v33)
    {

      id v24 = (id)v33;
      id v11 = v116;
      id v12 = v22;
      id v13 = v109;
      id v10 = v23;
      goto LABEL_16;
    }
    id v68 = +[PGLogging sharedLogging];
    id v69 = [v68 loggingConnection];

    id v10 = v23;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      double v105 = [v24 uuid];
      *(_DWORD *)buf = 138412546;
      id v128 = v105;
      __int16 v129 = 2112;
      id v130 = v34;
      _os_log_error_impl(&dword_1D1805000, v69, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music feature extraction error for PHMemory (%@): %@", buf, 0x16u);
    }
    uint32_t v70 = +[PGError xpcSafeErrorWithError:v34];
    v109[2](v109, 0, v70);

    id v11 = v116;
    uint64_t v38 = v117;
    id v12 = v22;
    id v13 = v109;
    id v17 = v118;
    id v37 = v119;
  }
  else
  {
    uint64_t v35 = +[PGLogging sharedLogging];
    unsigned int v36 = [v35 loggingConnection];

    id v37 = v119;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v128 = v119;
      _os_log_error_impl(&dword_1D1805000, v36, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Flex Music curator context error for asset fetch result: %@", buf, 0xCu);
    }

    id v24 = +[PGError xpcSafeErrorWithError:v119];
    v13[2](v13, 0, v24);
    uint64_t v38 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_70:
}

+ (void)requestMusicCurationForAssetFetchResult:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = +[PGLogging sharedLogging];
  unint64_t v15 = [v14 loggingConnection];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [v11 assetCollectionLocalIdentifier];
    *(_DWORD *)buf = 138412290;
    id v116 = v16;
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Apple Music curation context for asset fetch result. assetCollectionLocalIdentifier = %@", buf, 0xCu);
  }
  if ([v10 count])
  {
    id v17 = +[PGLogging memoriesMusicLogging];
    uint64_t v18 = [v17 loggingConnection];

    id v19 = v18;
    os_signpost_id_t v20 = os_signpost_id_generate(v19);
    uint64_t v21 = v19;
    id v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MusicCurationForAssetFetchResult", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v90 = mach_absolute_time();
    id v113 = 0;
    uint64_t v23 = [v12 musicCuratorContextWithCurationOptions:v11 error:&v113];
    id v24 = (__CFString *)v113;
    if (!v23)
    {
      id v37 = +[PGLogging sharedLogging];
      uint64_t v38 = [v37 loggingConnection];

      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v116 = v24;
        _os_log_error_impl(&dword_1D1805000, v38, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curator context error for asset fetch result: %@", buf, 0xCu);
      }

      os_signpost_id_t v39 = +[PGError xpcSafeErrorWithError:v24];
      v13[2](v13, 0, v39);
      goto LABEL_59;
    }
    os_signpost_id_t v88 = v20;
    uint64_t v25 = [v11 assetCollectionLocalIdentifier];

    id v96 = v11;
    if (v25)
    {
      v97 = v13;
      id v26 = v24;
      os_signpost_id_t v27 = v12;
      id v28 = v10;
      uint64_t v29 = v27;
      uint64_t v30 = [v27 photoLibrary];
      id v112 = 0;
      v31 = +[PGMusicCurationRecentlyUsedSongs recentlyUsedAppleMusicSongsForCollectionsFromPhotoLibrary:v30 error:&v112];
      uint64_t v32 = (__CFString *)v112;

      uint64_t v33 = +[PGLogging sharedLogging];
      id v34 = [v33 loggingConnection];

      os_signpost_id_t v93 = v32;
      if (!v31 || v32)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v116 = v32;
          _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Error getting the recently used Apple Music songs for collections. error=%@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v116 = v31;
          _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "[MemoriesMusic] recentlyUsedSongsForCollections = %@", buf, 0xCu);
        }

        id v34 = [v23 recentlyUsedSongs];
        [v34 appendWithOtherRecentlyUsed:v31];
      }
      id v10 = v28;

      id v12 = v29;
      id v24 = v26;
      id v11 = v96;
      id v13 = v97;
    }
    else
    {
      os_signpost_id_t v93 = 0;
    }
    id v91 = v24;
    mach_timebase_info v94 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:&__block_literal_global_331];
    id v98 = [(id)objc_opt_class() appleMusicFeatureExtractionContextWithCuratorContext:v23];
    v40 = +[PGLogging sharedLogging];
    id v41 = [v40 loggingConnection];

    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "[MemoriesMusic] Extracting music curation features from asset fetch result for Apple Music curation", buf, 2u);
    }

    __int16 v42 = v94;
    __int16 v43 = [v94 childProgressReporterFromStart:0.0 toEnd:0.2];
    id v111 = 0;
    uint64_t v44 = [a1 _musicCurationFeaturesWithFeatureExtractionContext:v98 assetFetchResult:v10 graphManager:v12 progressReporter:v43 error:&v111];
    uint64_t v92 = (__CFString *)v111;

    id v45 = +[PGLogging sharedLogging];
    uint64_t v46 = [v45 loggingConnection];

    id v95 = (void *)v44;
    if (!v44)
    {
      uint64_t v57 = v23;
      id v58 = v92;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v116 = v92;
        _os_log_error_impl(&dword_1D1805000, v46, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for asset fetch result: %@", buf, 0xCu);
      }

      id v59 = +[PGError xpcSafeErrorWithError:v92];
      v13[2](v13, 0, v59);
      os_signpost_id_t v39 = v93;
      id v24 = v91;
      goto LABEL_58;
    }
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v46, OS_LOG_TYPE_INFO, "[MemoriesMusic] Curating Apple Music for asset fetch result.", buf, 2u);
    }

    id v47 = [v94 childProgressReporterFromStart:0.2 toEnd:1.0];
    id v110 = 0;
    uint64_t v48 = +[PGMusicCurator curateMusicForFeatures:v44 context:v23 progressReporter:v47 error:&v110];
    v89 = (__CFString *)v110;

    id v24 = v91;
    if (!v48)
    {
      v60 = +[PGLogging sharedLogging];
      uint64_t v61 = [v60 loggingConnection];

      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v116 = v89;
        _os_log_error_impl(&dword_1D1805000, v61, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error: %@", buf, 0xCu);
      }
      uint64_t v57 = v23;

      uint32_t v62 = +[PGError xpcSafeErrorWithError:v89];
      v13[2](v13, 0, v62);
      id v58 = v92;
      os_signpost_id_t v39 = v93;
      goto LABEL_57;
    }
    id v84 = v10;
    uint64_t v49 = [v11 backingCollectionLocalIdentifier];
    if (v49 || ([v11 assetCollectionLocalIdentifier], (uint64_t v49 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v82 = v12;
      v83 = v22;
      uint64_t v50 = objc_alloc_init(PGMusicCurationManager);
      id v51 = [v23 cache];
      uint64_t v52 = [MEMORY[0x1E4F71F08] ignoreProgress];
      id v109 = 0;
      id v85 = (void *)v49;
      uint64_t v53 = [(PGMusicCurationManager *)v50 adjustCurationForCollection:v49 initialCuration:v48 cache:v51 progressReporter:v52 error:&v109];
      v54 = (__CFString *)v109;

      if (!v53)
      {
        uint64_t v86 = v54;
        id v87 = v50;
        uint32_t v63 = +[PGLogging sharedLogging];
        v64 = [v63 loggingConnection];

        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v81 = [v11 assetCollectionLocalIdentifier];
          *(_DWORD *)buf = 138412546;
          id v116 = v81;
          __int16 v117 = 2112;
          v118 = v54;
          _os_log_error_impl(&dword_1D1805000, v64, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Adjusting curation for collection (%@) failed with error: %@", buf, 0x16u);
        }
        os_signpost_id_t v39 = v93;
        v65 = +[PGError xpcSafeErrorWithError:v93];
        v13[2](v13, 0, v65);
        id v22 = v83;
        id v10 = v84;
        id v12 = v82;
        goto LABEL_56;
      }

      __int16 v55 = (PGMusicCurationManager *)v53;
      uint64_t v56 = off_1E68E2000;
      id v12 = v82;
      id v22 = v83;
    }
    else
    {
      id v85 = 0;
      __int16 v55 = v48;
      uint64_t v56 = off_1E68E2000;
    }
    id v87 = v55;
    id v66 = [(PGMusicCurationManager *)v55 keySongAdamID];

    if (v66)
    {
      id v67 = (void *)MEMORY[0x1E4F1C978];
      id v68 = [(PGMusicCurationManager *)v87 keySongAdamID];
      id v69 = objc_msgSend(v67, "arrayWithObjects:", v68, 0);

      uint32_t v70 = [(__objc2_class *)v56[215] sharedLogging];
      uint32_t v71 = [v70 loggingConnection];

      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        uint64_t v72 = [v69 objectAtIndexedSubscript:0];
        *(_DWORD *)buf = 138412290;
        id v116 = v72;
        _os_log_impl(&dword_1D1805000, v71, OS_LOG_TYPE_INFO, "[MemoriesMusic] Start Caching the key Apple Music song %@ for the collection. It should trigger the song assets download.", buf, 0xCu);
      }
      v73 = [MEMORY[0x1E4F71F08] ignoreProgress];
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __93__PGMusicWrapper_requestMusicCurationForAssetFetchResult_curationOptions_graphManager_reply___block_invoke_334;
      v107[3] = &unk_1E68EAB90;
      id v108 = v69;
      id v74 = v69;
      +[PGMusicAudioCacher cacheSongAudioForAdamIDs:v74 progressReporter:v73 completionHandler:v107];

      uint64_t v56 = off_1E68E2000;
    }
    v75 = [(__objc2_class *)v56[215] sharedLogging];
    id v76 = [v75 loggingConnection];

    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v76, OS_LOG_TYPE_INFO, "[MemoriesMusic] Inflating Apple Music curation for asset fetch result.", buf, 2u);
    }

    v65 = [[PGMusicCurationInflationOptions alloc] initWithInflationActionSource:1];
    id v106 = 0;
    uint64_t v77 = [v12 musicCurationInflationContextWithInflationOptions:v65 error:&v106];
    uint64_t v86 = (__CFString *)v106;
    if (v77)
    {
      uint32_t v78 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:&__block_literal_global_338];
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __93__PGMusicWrapper_requestMusicCurationForAssetFetchResult_curationOptions_graphManager_reply___block_invoke_2;
      v99[3] = &unk_1E68E7598;
      v102 = v13;
      uint64_t v100 = v87;
      uint64_t v103 = v90;
      mach_timebase_info v105 = info;
      v101 = v22;
      os_signpost_id_t v104 = v88;
      +[PGMusicCurator inflateDisplayMetadataForMusicCuration:v100 inflationContext:v77 curatorContext:0 progressReporter:v78 completionHandler:v99];
    }
    else
    {
      uint64_t v79 = +[PGLogging sharedLogging];
      v80 = [v79 loggingConnection];

      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v116 = v86;
        _os_log_error_impl(&dword_1D1805000, v80, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation inflation error for assets: %{public}@", buf, 0xCu);
      }

      uint32_t v78 = +[PGError xpcSafeErrorWithError:v86];
      v13[2](v13, 0, v78);
    }
    id v10 = v84;

    os_signpost_id_t v39 = v93;
LABEL_56:
    uint64_t v57 = v23;

    __int16 v42 = v94;
    id v58 = v92;
    uint32_t v62 = v85;
LABEL_57:

    id v59 = v89;
LABEL_58:

    uint64_t v23 = v57;
    id v11 = v96;
LABEL_59:

    goto LABEL_60;
  }
  uint64_t v35 = +[PGLogging sharedLogging];
  unsigned int v36 = [v35 loggingConnection];

  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v116 = @"Cannot curate music for an empty asset fetch result.";
    _os_log_error_impl(&dword_1D1805000, v36, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error: %@", buf, 0xCu);
  }

  id v22 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, @"Cannot curate music for an empty asset fetch result.");
  v13[2](v13, 0, v22);
LABEL_60:
}

void __93__PGMusicWrapper_requestMusicCurationForAssetFetchResult_curationOptions_graphManager_reply___block_invoke_334(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[PGLogging sharedLogging];
  id v7 = [v6 loggingConnection];

  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[MemoriesMusic] Cached Key Apple Music Song: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Attempt to cache key AM song failed with error: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

void __93__PGMusicWrapper_requestMusicCurationForAssetFetchResult_curationOptions_graphManager_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a2)
  {
    id v19 = +[PGLogging sharedLogging];
    os_signpost_id_t v20 = [v19 loggingConnection];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation inflation error for asset fetch result: %@", buf, 0xCu);
    }

    id v7 = +[PGError xpcSafeErrorWithError:v5];
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_14;
  }
  uint64_t v6 = [a2 jsonRepresentation];
  if (v6)
  {
    id v7 = (char *)v6;
    id v8 = +[PGLogging sharedLogging];
    int v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v7;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Apple Music curation for asset fetch result: %@", buf, 0xCu);
    }

    uint64_t v10 = mach_absolute_time();
    uint64_t v11 = *(void *)(a1 + 56);
    unsigned int v13 = *(_DWORD *)(a1 + 72);
    unsigned int v12 = *(_DWORD *)(a1 + 76);
    id v14 = *(id *)(a1 + 40);
    unint64_t v15 = v14;
    os_signpost_id_t v16 = *(void *)(a1 + 64);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_END, v16, "MusicCurationForAssetFetchResult", "", buf, 2u);
    }

    id v17 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v26 = "MusicCurationForAssetFetchResult";
      __int16 v27 = 2048;
      double v28 = (float)((float)((float)((float)(v10 - v11) * (float)v13) / (float)v12) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_14:
    v18();
    goto LABEL_18;
  }
  uint64_t v21 = [NSString stringWithFormat:@"Failed to serialize inflated music curation object to JSON: %@", *(void *)(a1 + 32)];
  id v22 = +[PGLogging sharedLogging];
  uint64_t v23 = [v22 loggingConnection];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v21;
    _os_log_error_impl(&dword_1D1805000, v23, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for asset fetch result: %@", buf, 0xCu);
  }

  id v24 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, v21);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  id v7 = 0;
LABEL_18:
}

+ (void)requestMusicCurationForAssetCollection:(id)a3 curationOptions:(id)a4 graphManager:(id)a5 reply:(id)a6
{
  v117[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 photoLibrary];
  if ([v10 assetCollectionType] == 4)
  {
    id v91 = a1;
    unint64_t v15 = +[PGLogging memoriesMusicLogging];
    os_signpost_id_t v16 = [v15 loggingConnection];

    id v17 = v16;
    os_signpost_id_t v18 = os_signpost_id_generate(v17);
    id v19 = v17;
    os_signpost_id_t v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MusicCurationForMemory", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v87 = mach_absolute_time();
    id v98 = v10;
    uint64_t v21 = +[PGLogging sharedLogging];
    id v22 = [v21 loggingConnection];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [v98 uuid];
      *(_DWORD *)buf = 138412290;
      id v114 = v23;
      _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[MemoriesMusic] Building Apple Music curation context for asset collection: %@.", buf, 0xCu);
    }
    id v111 = 0;
    id v24 = [v12 musicCuratorContextWithCurationOptions:v11 error:&v111];
    id v25 = v111;
    id v96 = v12;
    if (v24)
    {
      id v89 = v25;
      id v26 = v98;
      mach_timebase_info v94 = v14;
      if ([v98 creationType] != 1) {
        goto LABEL_18;
      }
      __int16 v27 = +[PGLogging sharedLogging];
      double v28 = [v27 loggingConnection];

      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "[MemoriesMusic] Generative PHMemory so extract the curated music", buf, 2u);
      }

      uint64_t v29 = [v98 extractGenerativeMemoryMusicCuration];
      if (v29)
      {
        uint64_t v90 = (void *)v29;
        uint64_t v30 = +[PGLogging sharedLogging];
        v31 = [v30 loggingConnection];

        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          uint64_t v32 = [v98 uuid];
          *(_DWORD *)buf = 138412290;
          id v114 = v32;
          _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "[MemoriesMusic] bypassMusicForTopicElection=YES for generative memory: %@", buf, 0xCu);
        }
        [v24 setBypassMusicForTopicElection:1];
      }
      else
      {
LABEL_18:
        uint64_t v90 = 0;
      }
      v40 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v41 = [v40 BOOLForKey:@"overrideMusicCuration"];

      os_signpost_id_t v84 = v18;
      if (v41)
      {
        id v42 = v13;
        id v43 = v12;
        uint64_t v44 = v24;
        id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/var/mobile/Media/PhotoData/Caches/GraphService/musicCurationOverride.plist"];
        uint64_t v46 = [v45 objectForKeyedSubscript:@"memoryUUID"];
        id v47 = [v98 uuid];
        int v48 = [v47 isEqualToString:v46];

        if (v48) {
          [v44 setMusicCurationOverrideDictionary:v45];
        }

        id v24 = v44;
        id v12 = v43;
        id v13 = v42;
        id v26 = v98;
      }
      v97 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:&__block_literal_global_22382];
      os_signpost_id_t v93 = v24;
      id v95 = [(id)objc_opt_class() appleMusicFeatureExtractionContextWithCuratorContext:v24];
      uint64_t v49 = +[PGLogging sharedLogging];
      uint64_t v50 = [v49 loggingConnection];

      id v14 = v94;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        id v51 = [v26 uuid];
        *(_DWORD *)buf = 138412290;
        id v114 = v51;
        _os_log_impl(&dword_1D1805000, v50, OS_LOG_TYPE_INFO, "[MemoriesMusic] Extracting music curation features for memory: %@ for Apple Music curation", buf, 0xCu);
      }
      uint64_t v52 = [v97 childProgressReporterFromStart:0.0 toEnd:0.2];
      id v110 = 0;
      uint64_t v53 = [v91 _musicCurationFeaturesWithFeatureExtractionContext:v95 memory:v26 graphManager:v12 progressReporter:v52 error:&v110];
      id v88 = v110;

      v54 = +[PGLogging sharedLogging];
      __int16 v55 = [v54 loggingConnection];

      uint64_t v92 = (void *)v53;
      if (v53)
      {
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          uint64_t v56 = [v26 uuid];
          *(_DWORD *)buf = 138412290;
          id v114 = v56;
          _os_log_impl(&dword_1D1805000, v55, OS_LOG_TYPE_INFO, "[MemoriesMusic] Curating Apple Music for PHMemory: %@.", buf, 0xCu);
        }
        uint64_t v57 = [v97 childProgressReporterFromStart:0.2 toEnd:1.0];
        id v109 = 0;
        id v58 = +[PGMusicCurator curateMusicForFeatures:v53 context:v93 progressReporter:v57 error:&v109];
        id v85 = v109;

        id v59 = +[PGLogging sharedLogging];
        v60 = [v59 loggingConnection];

        if (v58)
        {
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            uint64_t v61 = [v98 uuid];
            *(_DWORD *)buf = 138412290;
            id v114 = v61;
            _os_log_impl(&dword_1D1805000, v60, OS_LOG_TYPE_INFO, "[MemoriesMusic] Inflating Apple Music curation for PHMemory: %@.", buf, 0xCu);
          }
          if (v90)
          {
            uint32_t v62 = [v90 objectForKeyedSubscript:@"appleMusicSongIds"];
            uint32_t v63 = v62;
            if (v62 && [v62 count])
            {
              v64 = +[PGLogging sharedLogging];
              v65 = [v64 loggingConnection];

              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1805000, v65, OS_LOG_TYPE_INFO, "[MemoriesMusic] Replacing replaceBestMusicSuggestionsWithAdamIds", buf, 2u);
              }

              uint64_t v66 = [v58 replaceBestMusicSuggestionsWithAdamIds:v63];

              id v58 = (void *)v66;
              id v67 = v12;
            }
            else
            {
              id v67 = v12;
            }

            id v12 = v67;
          }
          uint64_t v108 = 0;
          uint64_t v86 = [[PGMusicCurationInflationOptions alloc] initWithInflationActionSource:1];
          id v74 = objc_msgSend(v12, "musicCurationInflationContextWithInflationOptions:error:");
          id v83 = 0;
          if (v74)
          {
            v75 = [MEMORY[0x1E4F71F08] progressReporterWithProgressBlock:&__block_literal_global_318];
            v99[0] = MEMORY[0x1E4F143A8];
            v99[1] = 3221225472;
            v99[2] = __92__PGMusicWrapper_requestMusicCurationForAssetCollection_curationOptions_graphManager_reply___block_invoke_2;
            v99[3] = &unk_1E68E7570;
            id v100 = v98;
            id v104 = v13;
            id v101 = v58;
            id v102 = v100;
            uint64_t v105 = v87;
            mach_timebase_info v107 = info;
            uint64_t v103 = v20;
            os_signpost_id_t v106 = v84;
            +[PGMusicCurator inflateDisplayMetadataForMusicCuration:v101 inflationContext:v74 curatorContext:0 progressReporter:v75 completionHandler:v99];

            id v76 = v83;
          }
          else
          {
            uint64_t v77 = +[PGLogging sharedLogging];
            uint32_t v78 = [v77 loggingConnection];

            id v76 = v83;
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              id v82 = [v98 uuid];
              *(_DWORD *)buf = 138412546;
              id v114 = v82;
              __int16 v115 = 2114;
              id v116 = v83;
              _os_log_error_impl(&dword_1D1805000, v78, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation inflation error for PHMemory (%@): %{public}@", buf, 0x16u);
            }
            v75 = +[PGError xpcSafeErrorWithError:v83];
            (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v75);
          }

          id v26 = v98;
          id v24 = v93;
          uint64_t v72 = v88;
          id v68 = v89;
          v73 = v85;
        }
        else
        {
          id v26 = v98;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v81 = [v98 uuid];
            *(_DWORD *)buf = 138412546;
            id v114 = v81;
            __int16 v115 = 2112;
            id v116 = v85;
            _os_log_error_impl(&dword_1D1805000, v60, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for PHMemory (%@): %@", buf, 0x16u);
          }
          v73 = v85;
          id v58 = +[PGError xpcSafeErrorWithError:v85];
          (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v58);
          id v24 = v93;
          uint64_t v72 = v88;
          id v68 = v89;
        }

        id v14 = v94;
      }
      else
      {
        uint64_t v72 = v88;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          v80 = [v26 uuid];
          *(_DWORD *)buf = 138412546;
          id v114 = v80;
          __int16 v115 = 2112;
          id v116 = v88;
          _os_log_error_impl(&dword_1D1805000, v55, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for PHMemory (%@): %@", buf, 0x16u);
        }
        v73 = +[PGError xpcSafeErrorWithError:v88];
        (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v73);
        id v24 = v93;
        id v68 = v89;
      }

      uint32_t v71 = v90;
    }
    else
    {
      id v68 = v25;
      id v69 = +[PGLogging sharedLogging];
      uint32_t v70 = [v69 loggingConnection];

      id v26 = v98;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        uint64_t v79 = [v98 uuid];
        *(_DWORD *)buf = 138412546;
        id v114 = v79;
        __int16 v115 = 2112;
        id v116 = v68;
        _os_log_error_impl(&dword_1D1805000, v70, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for PHMemory (%@): %@", buf, 0x16u);
      }
      uint32_t v71 = +[PGError xpcSafeErrorWithError:v68];
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v71);
    }

    unsigned int v36 = v20;
    id v12 = v96;
  }
  else
  {
    uint64_t v33 = +[PGLogging sharedLogging];
    id v34 = [v33 loggingConnection];

    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = [v10 localIdentifier];
      *(_DWORD *)buf = 138412290;
      id v114 = v35;
      _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "[MemoriesMusic] requestMusicCurationForAssetCollection delegating to requestMusicCurationForAssetFetchResult for assetCollection.localIdentifier: %@", buf, 0xCu);
    }
    unsigned int v36 = [v14 librarySpecificFetchOptions];
    [v36 setWantsIncrementalChangeDetails:0];
    v117[0] = *MEMORY[0x1E4F394A8];
    id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:1];
    [v36 setFetchPropertySets:v37];

    os_signpost_id_t v20 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v10 options:v36];
    uint64_t v38 = [v10 localIdentifier];
    uint64_t v39 = [v11 copyWithAssetCollectionLocalIdentifier:v38];

    [a1 requestMusicCurationForAssetFetchResult:v20 curationOptions:v39 graphManager:v12 reply:v13];
    id v11 = (id)v39;
  }
}

void __92__PGMusicWrapper_requestMusicCurationForAssetCollection_curationOptions_graphManager_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a2)
  {
    uint64_t v21 = +[PGLogging sharedLogging];
    id v22 = [v21 loggingConnection];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v27;
      __int16 v31 = 2112;
      double v32 = *(double *)&v5;
      _os_log_error_impl(&dword_1D1805000, v22, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation inflation error for PHMemory (%@): %@", buf, 0x16u);
    }
    id v7 = +[PGError xpcSafeErrorWithError:v5];
    os_signpost_id_t v20 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_14;
  }
  uint64_t v6 = [a2 jsonRepresentation];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = +[PGLogging sharedLogging];
    int v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [*(id *)(a1 + 48) title];
      id v11 = [*(id *)(a1 + 48) uuid];
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v10;
      __int16 v31 = 2112;
      double v32 = *(double *)&v11;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "[MemoriesMusic] Successfully produced Apple Music curation for asset collection (%@) with uuid '%@': %@", buf, 0x20u);
    }
    uint64_t v12 = mach_absolute_time();
    uint64_t v13 = *(void *)(a1 + 72);
    unsigned int v15 = *(_DWORD *)(a1 + 88);
    unsigned int v14 = *(_DWORD *)(a1 + 92);
    os_signpost_id_t v16 = *(id *)(a1 + 56);
    id v17 = v16;
    os_signpost_id_t v18 = *(void *)(a1 + 80);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v17, OS_SIGNPOST_INTERVAL_END, v18, "MusicCurationForMemory", "", buf, 2u);
    }

    id v19 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v30 = "MusicCurationForMemory";
      __int16 v31 = 2048;
      double v32 = (float)((float)((float)((float)(v12 - v13) * (float)v15) / (float)v14) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    os_signpost_id_t v20 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_14:
    v20();
    goto LABEL_18;
  }
  uint64_t v23 = [NSString stringWithFormat:@"Failed to serialize inflated music curation object to JSON: %@", *(void *)(a1 + 40)];
  id v24 = +[PGLogging sharedLogging];
  id v25 = [v24 loggingConnection];

  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    double v28 = [*(id *)(a1 + 32) uuid];
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = v28;
    __int16 v31 = 2112;
    double v32 = *(double *)&v23;
    _os_log_error_impl(&dword_1D1805000, v25, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Apple Music curation error for PHMemory (%@): %@", buf, 0x16u);
  }
  id v26 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, v23);
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

  id v7 = 0;
LABEL_18:
}

@end