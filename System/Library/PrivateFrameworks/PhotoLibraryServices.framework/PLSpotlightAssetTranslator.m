@interface PLSpotlightAssetTranslator
+ (id)_albumsUUIDsForAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 assetCounts:(id *)a6;
+ (id)_audioClassificationsForAsset:(id)a3;
+ (id)_contentRatingForAsset:(id)a3 fetchHelper:(id)a4;
+ (id)_highlightUUIDsForAsset:(id)a3 libraryIdentifier:(int64_t)a4 assetCounts:(id *)a5;
+ (id)_humanActionScenesForAsset:(id)a3 fetchHelper:(id)a4;
+ (id)_jsonRepresentationForCSPersons:(id)a3;
+ (id)_jsonRepresentationForScenesFromAsset:(id)a3 fetchHelper:(id)a4 indexingContext:(id)a5 isSensitiveLocation:(BOOL *)a6;
+ (id)_jsonRepresentationFromAsset:(id)a3 libraryIdentifier:(int64_t)a4 graphData:(id)a5 indexingContext:(id)a6 includeEmbeddingData:(BOOL)a7;
+ (id)_libraryScopeForAsset:(id)a3;
+ (id)_locationNamesForAsset:(id)a3 graphData:(id)a4;
+ (id)_locationNamesForAsset:(id)a3 graphLocations:(id)a4;
+ (id)_mediaTypesForAsset:(id)a3;
+ (id)_memoryUUIDsForAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 assetCounts:(id *)a6;
+ (id)_nameForContributor:(id)a3;
+ (id)_personsForAsset:(id)a3 fetchHelper:(id)a4 personSynonyms:(id)a5;
+ (id)_privateEncryptedComputeScenesForAsset:(id)a3 fetchHelper:(id)a4 csuTaxonomyObjectStore:(id)a5 locale:(id)a6 isSensitiveLocation:(BOOL *)a7;
+ (id)_revGeoLocationNamesForAsset:(id)a3;
+ (id)_scenesForAsset:(id)a3 fetchHelper:(id)a4 sceneTaxonomyProvider:(id)a5;
+ (id)_sharedLibraryContributorsForAsset:(id)a3;
+ (id)_spotlightSearchableAttributesForAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 graphData:(id)a6 indexingContext:(id)a7 documentObservation:(id)a8 propertySets:(unint64_t)a9 embeddingsFetcher:(id)a10;
+ (id)_utilityTypesForAsset:(id)a3 indexingContext:(id)a4;
+ (id)jsonRepresentationKeys;
+ (id)partialSpotlightSearchableItemFromAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 propertySets:(unint64_t)a6 graphData:(id)a7 indexingContext:(id)a8 documentObservation:(id)a9 embeddingsFetcher:(id)a10;
+ (id)spotlightSearchableItemFromAsset:(id)a3 libraryIdentifier:(int64_t)a4 graphData:(id)a5 indexingContext:(id)a6 documentObservation:(id)a7;
+ (void)_getGraphAttributesForMomentFromFetchHelper:(id)a3 businessNames:(id *)a4 businessCategories:(id *)a5 eventNames:(id *)a6 eventCategories:(id *)a7 eventPerformers:(id *)a8 meanings:(id *)a9 holidays:(id *)a10 locationKeywords:(id *)a11;
@end

@implementation PLSpotlightAssetTranslator

+ (id)_jsonRepresentationForScenesFromAsset:(id)a3 fetchHelper:(id)a4 indexingContext:(id)a5 isSensitiveLocation:(BOOL *)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_17:
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 1374, @"Invalid parameter not satisfying: %@", @"indexingContext" object file lineNumber description];

    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_18;
  }
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 1373, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (a6) {
    goto LABEL_4;
  }
LABEL_18:
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 1375, @"Invalid parameter not satisfying: %@", @"outSensitiveLocation" object file lineNumber description];

LABEL_4:
  v15 = objc_opt_new();
  v16 = objc_opt_new();
  v17 = [v14 sceneTaxonomyProvider];
  v18 = [a1 _scenesForAsset:v11 fetchHelper:v12 sceneTaxonomyProvider:v17];
  [v16 addObjectsFromArray:v18];

  v19 = [a1 _audioClassificationsForAsset:v11];
  [v16 addObjectsFromArray:v19];

  v20 = [a1 _humanActionScenesForAsset:v11 fetchHelper:v12];
  [v16 addObjectsFromArray:v20];

  BOOL v54 = 0;
  v21 = [v14 csuTaxonomyObjectStore];
  v47 = v14;
  v22 = [v14 locale];
  v48 = v12;
  v23 = [a1 _privateEncryptedComputeScenesForAsset:v11 fetchHelper:v12 csuTaxonomyObjectStore:v21 locale:v22 isSensitiveLocation:&v54];
  [v16 addObjectsFromArray:v23];

  *a6 = v54;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v16;
  uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v51 != v26) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v29 = objc_opt_new();
        v30 = [v28 label];
        [v29 setObject:v30 forKeyedSubscript:@"label"];

        v31 = [v28 synonyms];
        [v29 setObject:v31 forKeyedSubscript:@"synonyms"];

        v32 = NSNumber;
        [v28 confidence];
        v33 = objc_msgSend(v32, "numberWithDouble:");
        [v29 setObject:v33 forKeyedSubscript:@"confidence"];

        v34 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v28, "sceneIdentifier"));
        [v29 setObject:v34 forKeyedSubscript:@"sceneIdentifier"];

        v35 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v28, "sceneType"));
        [v29 setObject:v35 forKeyedSubscript:@"sceneType"];

        unint64_t v36 = [v28 sceneType];
        v37 = @"unknown";
        if (v36 <= 8) {
          v37 = off_1E586CFB0[v36];
        }
        v38 = v37;
        [v29 setObject:v38 forKeyedSubscript:@"sceneType_humanReadable"];

        v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v28, "mediaType"));
        [v29 setObject:v39 forKeyedSubscript:@"mediaType"];

        [v28 boundingBox];
        v40 = NSStringFromRect(v58);
        [v29 setObject:v40 forKeyedSubscript:@"boundingBox"];

        v41 = NSNumber;
        [v28 sceneArea];
        v42 = objc_msgSend(v41, "numberWithFloat:");
        [v29 setObject:v42 forKeyedSubscript:@"sceneArea"];

        [v15 addObject:v29];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v25);
  }

  return v15;
}

+ (id)_jsonRepresentationForCSPersons:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v10 = objc_opt_new();
        id v11 = [v9 displayName];
        [v10 setObject:v11 forKeyedSubscript:@"displayName"];

        id v12 = [v9 photosPersonIdentifier];
        [v10 setObject:v12 forKeyedSubscript:@"photosPersonIdentifier"];

        id v13 = [v9 contactIdentifier];
        [v10 setObject:v13 forKeyedSubscript:@"contactIdentifier"];

        v14 = [v9 nameAlternatives];
        [v10 setObject:v14 forKeyedSubscript:@"nameAlternatives"];

        v15 = [v9 faceAttributes];
        [v10 setObject:v15 forKeyedSubscript:@"faceAttributes"];

        v16 = [v9 personType];
        [v10 setObject:v16 forKeyedSubscript:@"personType"];

        [v4 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)_jsonRepresentationFromAsset:(id)a3 libraryIdentifier:(int64_t)a4 graphData:(id)a5 indexingContext:(id)a6 includeEmbeddingData:(BOOL)a7
{
  BOOL v130 = a7;
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v133 = a5;
  id v12 = a6;
  id v13 = [PLSearchIndexingLazyFetchHelper alloc];
  v14 = [v11 managedObjectContext];
  int64_t v129 = a4;
  uint64_t v15 = [(PLSearchIndexingLazyFetchHelper *)v13 initWithObject:v11 libraryIdentifier:a4 managedObjectContext:v14];

  v16 = [v11 additionalAttributes];
  v17 = [v11 mediaAnalysisAttributes];
  id v148 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = [v11 uuid];
  [v18 setObject:v19 forKeyedSubscript:@"uuid"];

  long long v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "hidden"));
  [v18 setObject:v20 forKeyedSubscript:@"hidden"];

  long long v21 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v11, "trashedState"));
  [v18 setObject:v21 forKeyedSubscript:@"trashedState"];

  long long v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "reverseLocationDataIsValid"));
  [v18 setObject:v22 forKeyedSubscript:@"photosReverseLocationDataIsValid"];

  [v18 setObject:@"com.apple.photos.search.result.collection.asset" forKeyedSubscript:@"photosResultType"];
  v23 = [v11 formattedCameraModel];
  [v18 setObject:v23 forKeyedSubscript:@"photosAcquisitionModel"];

  uint64_t v24 = [v11 moment];
  uint64_t v25 = [v24 uuid];
  [v18 setObject:v25 forKeyedSubscript:@"photosContainerIdentifier"];

  uint64_t v26 = [v11 uniformTypeIdentifier];
  [v18 setObject:v26 forKeyedSubscript:@"photosContentType"];

  v27 = [v11 title];
  [v18 setObject:v27 forKeyedSubscript:@"photosTitle"];

  v28 = [v11 longDescription];
  [v18 setObject:v28 forKeyedSubscript:@"photosContentDescription"];

  v29 = NSNumber;
  [v11 curationScore];
  v30 = objc_msgSend(v29, "numberWithDouble:");
  [v18 setObject:v30 forKeyedSubscript:@"photosCurationScore"];

  v31 = NSNumber;
  [v11 overallAestheticScore];
  v32 = objc_msgSend(v31, "numberWithFloat:");
  [v18 setObject:v32 forKeyedSubscript:@"photosAestheticScore"];

  v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "isFavorite"));
  [v18 setObject:v33 forKeyedSubscript:@"photosFavorited"];

  v34 = [a1 _mediaTypesForAsset:v11];
  [v18 setObject:v34 forKeyedSubscript:@"photosMediaTypes"];

  v144 = (void *)v15;
  v35 = [a1 _contentRatingForAsset:v11 fetchHelper:v15];
  [v18 setObject:v35 forKeyedSubscript:@"photosContentRating"];

  unint64_t v36 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v16, "sceneAnalysisVersion"));
  [v18 setObject:v36 forKeyedSubscript:@"photosSceneAnalysisVersion"];

  v37 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v16, "faceAnalysisVersion"));
  [v18 setObject:v37 forKeyedSubscript:@"photosFaceAnalysisVersion"];

  v38 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v17, "mediaAnalysisVersion"));
  [v18 setObject:v38 forKeyedSubscript:@"photosMediaAnalysisVersion"];

  v39 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v17, "mediaAnalysisImageVersion"));
  [v18 setObject:v39 forKeyedSubscript:@"photosMediaAnalysisImageVersion"];

  v40 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v17, "characterRecognitionVersion"));
  [v18 setObject:v40 forKeyedSubscript:@"photosCharacterRecognitionAnalysisVersion"];

  v41 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v17, "vaAnalysisVersion"));
  [v18 setObject:v41 forKeyedSubscript:@"photosPrivateEncryptedComputeAnalysisVersion"];

  v42 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v17, "vaLocationAnalysisVersion"));
  [v18 setObject:v42 forKeyedSubscript:@"photosLocationPrivateEncryptedComputeAnalysisVersion"];

  v43 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v17, "imageEmbeddingVersion"));
  [v18 setObject:v43 forKeyedSubscript:@"photosMediaAnalysisImageEmbeddingVersion"];

  v131 = v17;
  v44 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v17, "videoEmbeddingVersion"));
  [v18 setObject:v44 forKeyedSubscript:@"photosMediaAnalysisVideoEmbeddingVersion"];

  v45 = [v16 timeZoneName];
  [v18 setObject:v45 forKeyedSubscript:@"photosTimeZoneName"];

  v132 = v16;
  v46 = [v16 timeZoneOffset];
  [v18 setObject:v46 forKeyedSubscript:@"photosTimeZoneOffset"];

  uint64_t v47 = [v11 dateCreated];
  v48 = [v148 stringFromDate:v47];
  [v18 setObject:v48 forKeyedSubscript:@"photosContentCreationDate"];

  v49 = [v12 searchIndexDateFormatter];
  uint64_t v50 = [v49 localizedMonthStringsFromDate:v47];
  v127 = v49;
  v128 = (void *)v47;
  uint64_t v51 = [v49 newLocalizedComponentsFromDate:v47 includeMonth:0];
  v126 = (void *)v50;
  [v18 setObject:v50 forKeyedSubscript:@"photosContentCreationDateMonths"];
  v125 = (void *)v51;
  [v18 setObject:v51 forKeyedSubscript:@"photosContentCreationDateYears"];
  v149 = v12;
  id v143 = a1;
  if (_os_feature_enabled_impl())
  {
    long long v52 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      long long v53 = [v11 uuid];
      *(_DWORD *)buf = 138412290;
      v162 = v53;
      _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_DEBUG, "PLSpotlightAssetTranslator using Graph data from photo library storage for asset: %@", buf, 0xCu);
    }
    [v11 moment];
    v139 = id v54 = a1;
    if (v139)
    {
      id v159 = 0;
      id v160 = 0;
      id v157 = 0;
      id v158 = 0;
      id v155 = 0;
      id v156 = 0;
      id v153 = 0;
      id v154 = 0;
      [a1 _getGraphAttributesForMomentFromFetchHelper:v144 businessNames:&v160 businessCategories:&v159 eventNames:&v158 eventCategories:&v157 eventPerformers:&v156 meanings:&v155 holidays:&v154 locationKeywords:&v153];
      id v145 = v160;
      id v142 = v159;
      id v55 = v158;
      id v137 = v157;
      id v136 = v156;
      id v56 = v155;
      id v134 = v154;
      id v57 = v153;
    }
    else
    {
      v69 = PLSearchBackendModelTranslationGetLog();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        v70 = [v11 uuid];
        *(_DWORD *)buf = 138412290;
        v162 = v70;
        _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_INFO, "No Moment set for asset: %@. No Knowledge Graph data for this asset.", buf, 0xCu);
      }
      id v57 = 0;
      id v134 = 0;
      id v136 = 0;
      id v56 = 0;
      id v137 = 0;
      id v55 = 0;
      id v142 = 0;
      id v145 = 0;
      id v54 = v143;
    }
    v71 = [v11 dateCreated];
    v72 = [v12 calendar];
    uint64_t v73 = +[PLSpotlightTranslatorUtilities seasonsForDate:v71 calendar:v72];

    uint64_t v68 = [v54 _locationNamesForAsset:v11 graphLocations:v57];

    id v67 = v145;
    id v65 = v54;
    uint64_t v64 = v73;
    uint64_t v59 = (uint64_t)v137;
    uint64_t v61 = (uint64_t)v134;
  }
  else
  {
    uint64_t v146 = +[PLSpotlightTranslatorUtilities textFromGraphData:v133 searchIndexCategoryMask:0x100000];
    id v142 = +[PLSpotlightTranslatorUtilities textFromGraphData:v133 searchIndexCategoryMask:0x200000];
    uint64_t v140 = +[PLSpotlightTranslatorUtilities textFromGraphData:v133 searchIndexCategoryMask:0x1000000];
    NSRect v58 = [v12 synonymsByIndexCategoryMask];
    uint64_t v59 = +[PLSpotlightTranslatorUtilities textFromGraphData:v133 searchIndexCategoryMask:0x4000000 synonymSearchIndexCategoryMask:0x200000000 synonyms:v58];

    id v136 = +[PLSpotlightTranslatorUtilities textFromGraphData:v133 searchIndexCategoryMask:0x2000000];
    v60 = [v12 synonymsByIndexCategoryMask];
    id v56 = +[PLSpotlightTranslatorUtilities textFromGraphData:v133 searchIndexCategoryMask:0x4000 synonymSearchIndexCategoryMask:0x20000000 synonyms:v60];

    uint64_t v61 = +[PLSpotlightTranslatorUtilities textFromGraphData:v133 searchIndexCategoryMask:0x8000];
    v62 = [v11 dateCreated];
    v63 = [v12 calendar];
    uint64_t v64 = +[PLSpotlightTranslatorUtilities seasonsForDate:v62 calendar:v63];

    id v65 = a1;
    uint64_t v66 = [a1 _locationNamesForAsset:v11 graphData:v133];
    id v67 = (id)v146;
    uint64_t v68 = v66;
    id v55 = (id)v140;
  }
  v147 = v67;
  objc_msgSend(v18, "setObject:forKeyedSubscript:");
  [v18 setObject:v142 forKeyedSubscript:@"photosBusinessCategories"];
  [v18 setObject:v55 forKeyedSubscript:@"photosEventNames"];
  v138 = (void *)v59;
  [v18 setObject:v59 forKeyedSubscript:@"photosEventCategories"];
  [v18 setObject:v136 forKeyedSubscript:@"photosEventPerformers"];
  [v18 setObject:v56 forKeyedSubscript:@"photosMeanings"];
  [v18 setObject:v61 forKeyedSubscript:@"photosHolidays"];
  v123 = (void *)v64;
  [v18 setObject:v64 forKeyedSubscript:@"photosSeasons"];
  v74 = [v11 localDateCreated];
  v75 = PLSearchPartsOfDayForLocalDate(v74);
  [v18 setObject:v75 forKeyedSubscript:@"photosPartsOfDay"];

  v76 = [v11 localDateCreated];
  v77 = PLSearchPartsOfWeekForLocalDate(v76);
  [v18 setObject:v77 forKeyedSubscript:@"photosPartsOfWeek"];

  v122 = (void *)v68;
  [v18 setObject:v68 forKeyedSubscript:@"photosLocationKeywords"];
  if ([v11 kind] == 1)
  {
    v78 = NSNumber;
    [v11 duration];
    v79 = objc_msgSend(v78, "numberWithDouble:");
    [v18 setObject:v79 forKeyedSubscript:@"photosDuration"];
  }
  if ([v149 isSharedLibraryEnabled])
  {
    v80 = [v65 _libraryScopeForAsset:v11];
    [v18 setObject:v80 forKeyedSubscript:@"photosLibraryName"];

    v81 = [v65 _sharedLibraryContributorsForAsset:v11];
    v82 = [v65 _jsonRepresentationForCSPersons:v81];
    [v18 setObject:v82 forKeyedSubscript:@"photosSharedLibraryContributors"];
  }
  v135 = (void *)v61;
  v124 = v56;
  v141 = v55;
  v83 = [MEMORY[0x1E4F1C9C8] now];
  v84 = [v148 stringFromDate:v83];
  [v18 setObject:v84 forKeyedSubscript:@"photosDonationTimestamp"];

  v85 = [v11 importedByBundleIdentifier];
  v86 = [v11 importedByDisplayName];
  if (PLShouldConstructDisplayNameForAppBundle(v85, (uint64_t)v86))
  {
    v87 = PLSyndicatedDisplayNameForAppBundle(v85, v86);
    [v18 setObject:v87 forKeyedSubscript:@"photosSavedFromAppName"];
    [v18 setObject:v85 forKeyedSubscript:@"photosSavedFromAppBundleIdentifier"];
  }
  v120 = v86;
  v121 = v85;
  v88 = [v11 documentObservation];
  v89 = +[PLSearchOCRUtilities jsonOCRTextLinesFromDocumentObservation:v88];
  [v18 setObject:v89 forKeyedSubscript:@"photosTextContentPieces"];

  v90 = [v149 synonymsByIndexCategoryMask];
  v91 = [v90 objectForKeyedSubscript:&unk_1EEBEE430];
  uint64_t v92 = [v143 _personsForAsset:v11 fetchHelper:v144 personSynonyms:v91];

  v119 = (void *)v92;
  v93 = [v143 _jsonRepresentationForCSPersons:v92];
  v118 = v93;
  if ([v93 count]) {
    v94 = v93;
  }
  else {
    v94 = 0;
  }
  [v18 setObject:v94 forKeyedSubscript:@"photosPeople"];
  buf[0] = 0;
  v95 = [v143 _jsonRepresentationForScenesFromAsset:v11 fetchHelper:v144 indexingContext:v149 isSensitiveLocation:buf];
  if ([v95 count]) {
    v96 = v95;
  }
  else {
    v96 = 0;
  }
  [v18 setObject:v96 forKeyedSubscript:@"photosSceneClassifications"];
  v97 = [NSNumber numberWithBool:buf[0]];
  [v18 setObject:v97 forKeyedSubscript:@"photosSensitiveLocation"];

  v98 = [v143 _utilityTypesForAsset:v11 indexingContext:v149];
  [v18 setObject:v98 forKeyedSubscript:@"photosUtilityTypes"];

  v99 = +[PLKeywordManager keywordsForAsset:v11];
  v100 = [v99 allObjects];
  [v18 setObject:v100 forKeyedSubscript:@"photosKeywords"];

  id v152 = 0;
  v101 = [v143 _albumsUUIDsForAsset:v11 fetchHelper:v144 libraryIdentifier:v129 assetCounts:&v152];
  id v102 = v152;
  [v18 setObject:v101 forKeyedSubscript:@"photosAlbumUUIDs"];

  [v18 setObject:v102 forKeyedSubscript:@"photosAlbumAssetCounts"];
  id v151 = 0;
  v103 = [v143 _memoryUUIDsForAsset:v11 fetchHelper:v144 libraryIdentifier:v129 assetCounts:&v151];
  id v104 = v151;
  [v18 setObject:v103 forKeyedSubscript:@"photosMemoryUUIDs"];

  [v18 setObject:v104 forKeyedSubscript:@"photosMemoryAssetCounts"];
  id v150 = 0;
  v105 = [v143 _highlightUUIDsForAsset:v11 libraryIdentifier:v129 assetCounts:&v150];
  id v106 = v150;
  [v18 setObject:v105 forKeyedSubscript:@"photosHighlightUUIDs"];

  [v18 setObject:v106 forKeyedSubscript:@"photosHighlightAssetCounts"];
  v107 = objc_alloc_init(PLSearchIndexingEmbeddingsFetcher);
  v108 = [(PLSearchIndexingEmbeddingsFetcher *)v107 embeddingForAsset:v11 indexingContext:v149 allowFetchIfMissing:1];
  v109 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v108, "isSuccess"));
  [v18 setObject:v109 forKeyedSubscript:@"hasPhotoEmbedding"];

  if (v130)
  {
    v110 = [v108 result];
    v111 = PLSearchJSONForCSEmbedding(v110);

    if (v111)
    {
      [v18 setObject:v111 forKeyedSubscript:@"photoEmbedding"];
    }
    else
    {
      v112 = [MEMORY[0x1E4F1CA98] null];
      [v18 setObject:v112 forKeyedSubscript:@"photoEmbedding"];
    }
  }
  v113 = NSNumber;
  v114 = [v108 result];
  v115 = [v114 vectors];
  v116 = objc_msgSend(v113, "numberWithUnsignedInteger:", objc_msgSend(v115, "count"));
  [v18 setObject:v116 forKeyedSubscript:@"photosEmbeddingCount"];

  return v18;
}

+ (id)jsonRepresentationKeys
{
  v4[62] = *MEMORY[0x1E4F143B8];
  v4[0] = @"photosAcquisitionModel";
  v4[1] = @"photosContainerIdentifier";
  v4[2] = @"photosContentType";
  v4[3] = @"photosContentCreationDate";
  v4[4] = @"photosContentCreationDateMonths";
  v4[5] = @"photosContentCreationDateYears";
  v4[6] = @"photosTitle";
  v4[7] = @"photosContentDescription";
  v4[8] = @"photosCurationScore";
  v4[9] = @"photosAestheticScore";
  v4[10] = @"photosFavorited";
  v4[11] = @"photosMediaTypes";
  v4[12] = @"photosContentRating";
  v4[13] = @"photosSceneAnalysisVersion";
  v4[14] = @"photosFaceAnalysisVersion";
  v4[15] = @"photosMediaAnalysisVersion";
  v4[16] = @"photosMediaAnalysisImageVersion";
  v4[17] = @"photosPrivateEncryptedComputeAnalysisVersion";
  v4[18] = @"photosLocationPrivateEncryptedComputeAnalysisVersion";
  v4[19] = @"photosCharacterRecognitionAnalysisVersion";
  v4[20] = @"photosMediaAnalysisImageEmbeddingVersion";
  v4[21] = @"photosMediaAnalysisVideoEmbeddingVersion";
  v4[22] = @"photosTimeZoneName";
  v4[23] = @"photosTimeZoneOffset";
  v4[24] = @"photosLocationKeywords";
  v4[25] = @"photosSeasons";
  v4[26] = @"photosPartsOfDay";
  v4[27] = @"photosPartsOfWeek";
  v4[28] = @"photosBusinessNames";
  v4[29] = @"photosBusinessCategories";
  v4[30] = @"photosEventNames";
  v4[31] = @"photosEventCategories";
  v4[32] = @"photosEventPerformers";
  v4[33] = @"photosMeanings";
  v4[34] = @"photosHolidays";
  v4[35] = @"photosResultType";
  v4[36] = @"photosDuration";
  v4[37] = @"photosLibraryName";
  v4[38] = @"photosSharedLibraryContributors";
  v4[39] = @"photosDonationTimestamp";
  v4[40] = @"photosSavedFromAppName";
  v4[41] = @"photosSavedFromAppBundleIdentifier";
  v4[42] = @"photosFilename";
  v4[43] = @"photosTextContentPieces";
  v4[44] = @"photosPeople";
  v4[45] = @"photosSceneClassifications";
  v4[46] = @"photosUtilityTypes";
  v4[47] = @"photosKeywords";
  v4[48] = @"photosAlbumUUIDs";
  v4[49] = @"photosAlbumAssetCounts";
  v4[50] = @"photosMemoryUUIDs";
  v4[51] = @"photosMemoryAssetCounts";
  v4[52] = @"photosHighlightUUIDs";
  v4[53] = @"photosHighlightAssetCounts";
  v4[54] = @"photosSensitiveLocation";
  v4[55] = @"photosReverseLocationDataIsValid";
  v4[56] = @"photosEmbeddingCount";
  v4[57] = @"photoEmbedding";
  v4[58] = @"uuid";
  v4[59] = @"hidden";
  v4[60] = @"trashedState";
  v4[61] = @"hasPhotoEmbedding";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:62];
  return v2;
}

+ (id)_highlightUUIDsForAsset:(id)a3 libraryIdentifier:(int64_t)a4 assetCounts:(id *)a5
{
  id v9 = a3;
  if (v9)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 1073, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 1074, @"Invalid parameter not satisfying: %@", @"outAssetCounts" object file lineNumber description];

LABEL_3:
  v10 = objc_opt_new();
  id v11 = objc_opt_new();
  id v12 = [v9 dayGroupHighlightBeingAssets];
  id v13 = +[PLPhotosHighlight isEligibleForSearchIndexingPredicateForLibraryIdentifier:a4];
  int v14 = [v13 evaluateWithObject:v12];

  if (v14)
  {
    uint64_t v15 = [v12 uuid];
    [v10 addObject:v15];

    v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "dayGroupAssetsCount"));
    [v11 addObject:v16];
  }
  id v17 = v11;
  *a5 = v17;

  return v10;
}

+ (id)_memoryUUIDsForAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 assetCounts:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v28 = v10;
  if (!v10)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 1056, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  if (!a6)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 1057, @"Invalid parameter not satisfying: %@", @"outAssetCounts" object file lineNumber description];
  }
  id v12 = objc_opt_new();
  id v13 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v14 = [v11 memoriesEligibleForSearchIndexing];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v20 = [v19 uuid];
        [v12 addObject:v20];

        long long v21 = NSNumber;
        long long v22 = [v19 curatedAssets];
        v23 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
        [v13 addObject:v23];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v16);
  }

  id v24 = v13;
  *a6 = v24;

  return v12;
}

+ (id)_albumsUUIDsForAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 assetCounts:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v26 = v10;
  if (!v10)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 1039, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  if (!a6)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 1040, @"Invalid parameter not satisfying: %@", @"outAssetCounts" object file lineNumber description];
  }
  id v12 = objc_opt_new();
  id v13 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v14 = [v11 albumsEligibleForSearchIndexing];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v20 = [v19 uuid];
        [v12 addObject:v20];

        long long v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v19, "cachedCount"));
        [v13 addObject:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  id v22 = v13;
  *a6 = v22;

  return v12;
}

+ (id)_nameForContributor:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 nameComponents];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v4 style:0 options:0];
  }
  else
  {
    uint64_t v6 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "No name for contributor: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)_sharedLibraryContributorsForAsset:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v21 = v3;
  id obj = [v3 libraryScopeContributors];
  uint64_t v26 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v6 = [a1 _nameForContributor:v5];
        uint64_t v7 = [v5 emailAddress];
        int v8 = [v5 phoneNumber];
        id v9 = objc_opt_new();
        if ([v5 isCurrentUser])
        {
          uint64_t v10 = PLServicesSharedLibraryLocalizedFrameworkString();
          [v9 addObject:v10];
          id v11 = PLServicesSharedLibraryLocalizedFrameworkString();
          [v9 addObject:v11];
        }
        id v12 = PLServicesSharedLibraryLocalizedFrameworkString();
        if ([v6 length])
        {
          id v13 = PFStringWithValidatedFormat();
          objc_msgSend(v9, "addObject:", v13, v6);
        }
        if ([v7 length])
        {
          int v14 = PFStringWithValidatedFormat();
          objc_msgSend(v9, "addObject:", v14, v7);
        }
        if ([v8 length])
        {
          uint64_t v15 = PFStringWithValidatedFormat();
          objc_msgSend(v9, "addObject:", v15, v8);
        }
        uint64_t v16 = [v9 firstObject];
        if ([v16 length])
        {
          [v9 removeObject:v16];
          id v17 = objc_alloc(MEMORY[0x1E4F23810]);
          id v18 = [v5 uuid];
          long long v19 = (void *)[v17 initWithDisplayName:v16 handles:0 handleIdentifier:0 photosPersonIdentifier:v18 isPhotosPerson:1 personType:1 nameAlternatives:v9 faceAttributes:0];

          [v23 addObject:v19];
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v26);
  }

  return v23;
}

+ (id)_libraryScopeForAsset:(id)a3
{
  [a3 hasLibraryScope];
  id v3 = PLServicesSharedLibraryLocalizedFrameworkString();
  return v3;
}

+ (id)_revGeoLocationNamesForAsset:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 907, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v5 reverseLocationDataIsValid])
  {
    uint64_t v7 = [v5 locationInfo];
    int v8 = [v7 isHome];

    if (v8)
    {
      id v9 = PLMomentsLocalizedFrameworkString(@"MOMENT_HOME");
      [v6 addObject:v9];
    }
    uint64_t v10 = [v5 locationInfo];
    id v11 = [v5 placeAnnotation];
    id v12 = [v10 placeWithAnnotation:v11];

    if (v12)
    {
      id v27 = v5;
      id v13 = &qword_19BA9AC90;
      do
      {
        uint64_t v14 = *v13;
        uint64_t v15 = [v12 placeInfosForOrderType];
        uint64_t v16 = [NSNumber numberWithUnsignedInteger:v14];
        id v17 = [v15 objectForKeyedSubscript:v16];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v29 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = [*(id *)(*((void *)&v28 + 1) + 8 * i) placeName];
              [v6 addObject:v23];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v20);
        }

        --v13;
      }
      while (v13 >= _revGeoLocationNamesForAsset__revGeoDominantOrderTypes);
      id v5 = v27;
    }
  }
  else
  {
    id v12 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = [v5 uuid];
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v24;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Invalid RevGeo location data for asset: %{public}@. Not indexing locations.", buf, 0xCu);
    }
  }

  return v6;
}

+ (id)_locationNamesForAsset:(id)a3 graphData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 888, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v9 = [a1 _revGeoLocationNamesForAsset:v7];
  uint64_t v10 = [v8 objectForKeyedSubscript:&unk_1EEBEE4A8];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    id v12 = PLMomentsLocalizedFrameworkString(@"MOMENT_HOME");
    [v9 addObject:v12];
  }
  id v13 = [v8 objectForKeyedSubscript:&unk_1EEBEE4C0];
  if ([v13 length]) {
    [v9 addObject:v13];
  }
  uint64_t v14 = [v9 allObjects];

  return v14;
}

+ (id)_locationNamesForAsset:(id)a3 graphLocations:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 864, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v9 = [a1 _revGeoLocationNamesForAsset:v7];
  uint64_t v10 = [v7 reverseLocationData];
  int v11 = [v7 reverseLocationDataIsValid];
  int v12 = v11;
  if (v10 && v11)
  {
    [v9 addObjectsFromArray:v8];
  }
  else if ([v8 count])
  {
    id v13 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      if (v12) {
        uint64_t v14 = @"valid";
      }
      else {
        uint64_t v14 = @"invalid";
      }
      if (v10) {
        uint64_t v15 = @"present";
      }
      else {
        uint64_t v15 = @"nil";
      }
      uint64_t v16 = [v7 uuid];
      *(_DWORD *)buf = 138544130;
      uint64_t v32 = v14;
      __int16 v33 = 2114;
      uint64_t v34 = v15;
      __int16 v35 = 2114;
      unint64_t v36 = v16;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Location data is %{public}@ / %{public}@ for asset %{public}@. Not indexing Graph locations: %@", buf, 0x2Au);
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = (void *)[v9 copy];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = PLSearchStringByTrimmingApostrophes(*(void **)(*((void *)&v26 + 1) + 8 * i));
        [v9 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }

  id v23 = [v9 allObjects];

  return v23;
}

+ (id)_utilityTypesForAsset:(id)a3 indexingContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 849, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 850, @"Invalid parameter not satisfying: %@", @"indexingContext" object file lineNumber description];

LABEL_3:
  uint64_t v10 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PLSpotlightAssetTranslator__utilityTypesForAsset_indexingContext___block_invoke;
  v15[3] = &unk_1E586A798;
  id v11 = v10;
  id v16 = v11;
  PLSearchEnumerateSearchStringsForUtilityCollections(v7, v9, v15);

  return v11;
}

uint64_t __68__PLSpotlightAssetTranslator__utilityTypesForAsset_indexingContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

+ (id)_privateEncryptedComputeScenesForAsset:(id)a3 fetchHelper:(id)a4 csuTaxonomyObjectStore:(id)a5 locale:(id)a6 isSensitiveLocation:(BOOL *)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  long long v53 = v13;
  if (!v13)
  {
    uint64_t v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 778, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (a7) {
      goto LABEL_3;
    }
LABEL_58:
    uint64_t v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 779, @"Invalid parameter not satisfying: %@", @"outSensitiveLocation" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a7) {
    goto LABEL_58;
  }
LABEL_3:
  id v57 = v16;
  *a7 = 0;
  long long v52 = v14;
  id v17 = [v14 allSceneClassifications];
  id v56 = (id)objc_opt_new();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (!v18)
  {
    uint64_t v20 = 0;
    goto LABEL_54;
  }
  uint64_t v19 = v18;
  uint64_t v20 = 0;
  uint64_t v62 = *(void *)v69;
  id v54 = a7;
  id v55 = v15;
  do
  {
    uint64_t v21 = 0;
    uint64_t v60 = v19;
    do
    {
      if (*(void *)v69 != v62) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(void **)(*((void *)&v68 + 1) + 8 * v21);
      signed int v23 = [v22 classificationType];
      uint64_t v24 = v23;
      uint64_t v25 = [NSNumber numberWithInteger:v23];
      int v26 = [&unk_1EEBF1CE8 containsObject:v25];

      if (v23 == 4 || v26 != 0)
      {
        uint64_t v28 = [v22 sceneIdentifier];
        int64_t v29 = +[PLSpotlightTranslatorUtilities CSSceneTypeForPLSceneClassificationType:v23];
        if (v29)
        {
          int64_t v30 = v29;
          if (v23 > 7) {
            __int16 v31 = 1;
          }
          else {
            __int16 v31 = word_19BA9A0D0[v23];
          }
          id v67 = v20;
          uint64_t v32 = [v15 entityForIdentifier:v28 idType:v31 error:&v67];
          id v33 = v67;

          if (!v32 || v33)
          {
            uint64_t v34 = PLSearchBackendSceneTaxonomyGetLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v74 = v28;
              __int16 v35 = v34;
              os_log_type_t v36 = OS_LOG_TYPE_ERROR;
              __int16 v37 = "CSU: CSU entity not found in MAD database. Ignoring any PrivateEncryptedCompute scenes for scene identifier: %llu";
              uint32_t v38 = 12;
LABEL_26:
              _os_log_impl(&dword_19B3C7000, v35, v36, v37, buf, v38);
            }
LABEL_27:
            uint64_t v19 = v60;
          }
          else
          {
            *a7 |= [v32 sensitiveLocation];
            if ([v32 sensitiveLocation])
            {
              uint64_t v34 = PLSearchBackendSceneTaxonomyGetLog();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v74 = v24;
                __int16 v75 = 2048;
                uint64_t v76 = v28;
                __int16 v35 = v34;
                os_log_type_t v36 = OS_LOG_TYPE_DEBUG;
                __int16 v37 = "CSU: CSU entity not eligible for search. Skipping Scene (%lu, %llu)";
                uint32_t v38 = 22;
                goto LABEL_26;
              }
              goto LABEL_27;
            }
            int64_t v59 = v30;
            uint64_t v34 = [v32 localizedLabelWithLocale:v57];
            if ([v34 length])
            {
              uint64_t v39 = objc_opt_new();
              NSRect v58 = v32;
              v40 = [v32 localizedSynonymsWithLocale:v57];
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              uint64_t v41 = [v40 countByEnumeratingWithState:&v63 objects:v72 count:16];
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v43 = *(void *)v64;
                do
                {
                  for (uint64_t i = 0; i != v42; ++i)
                  {
                    if (*(void *)v64 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    v45 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                    if (v45 && [*(id *)(*((void *)&v63 + 1) + 8 * i) length])
                    {
                      if ([v45 isEqualToString:v34])
                      {
                        v46 = PLSearchBackendSceneTaxonomyGetLog();
                        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v74 = (uint64_t)v34;
                          __int16 v75 = 2048;
                          uint64_t v76 = v28;
                          _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "CSU: Duplicate PrivateEncryptedCompute label: '%@' found in synonyms for Scene ID: %llu", buf, 0x16u);
                        }
                      }
                      else
                      {
                        [v39 addObject:v45];
                      }
                    }
                  }
                  uint64_t v42 = [v40 countByEnumeratingWithState:&v63 objects:v72 count:16];
                }
                while (v42);
              }
              id v47 = objc_alloc(MEMORY[0x1E4F23820]);
              [v22 confidence];
              v48 = objc_msgSend(v47, "initWithLabel:synonyms:confidence:sceneIdentifier:", v34, v39, v28);
              [v48 setSceneType:v59];
              [v56 addObject:v48];

              a7 = v54;
              id v15 = v55;
              uint64_t v19 = v60;
              uint64_t v32 = v58;
            }
            else
            {
              uint64_t v39 = PLSearchBackendSceneTaxonomyGetLog();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v74 = v28;
                _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "CSU: Failed to get localized text from CSU for PEC sceneIdentifier: %llu", buf, 0xCu);
              }
              uint64_t v19 = v60;
            }
            id v33 = 0;
          }
        }
        else
        {
          uint64_t v32 = PLSearchBackendSceneTaxonomyGetLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v74 = v28;
            _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "CSU: Unsupported scene classification type for scene identifier: %llu", buf, 0xCu);
          }
          id v33 = v20;
          uint64_t v19 = v60;
        }

        uint64_t v20 = v33;
      }
      ++v21;
    }
    while (v21 != v19);
    uint64_t v19 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
  }
  while (v19);
LABEL_54:

  return v56;
}

+ (id)_scenesForAsset:(id)a3 fetchHelper:(id)a4 sceneTaxonomyProvider:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    signed int v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 758, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 759, @"Invalid parameter not satisfying: %@", @"sceneTaxonomyProvider" object file lineNumber description];

LABEL_3:
  id v13 = [v9 additionalAttributes];
  uint64_t v14 = [v13 sceneAnalysisVersion];

  id v15 = [v12 searchIndexSceneTaxonomyForSceneAnalysisVersion:v14];
  if (v15)
  {
    id v16 = (void *)MEMORY[0x1E4F1CAD0];
    id v17 = [v10 allSceneClassifications];
    uint64_t v18 = [v16 setWithArray:v17];

    uint64_t v19 = +[PLSpotlightTranslatorUtilities spotlightScenesFromScenes:v18 sceneTaxonomy:v15];
  }
  else
  {
    if (v14)
    {
      uint64_t v20 = PLSearchBackendSceneTaxonomyGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = [v9 uuid];
        *(_DWORD *)buf = 67109378;
        int v26 = v14;
        __int16 v27 = 2112;
        uint64_t v28 = v21;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Could not open taxonomy for scene analysis version: %i, unable to index scenes for asset: %@", buf, 0x12u);
      }
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

+ (id)_mediaTypesForAsset:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 613, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 RAWBadgeAttribute] - 1 <= 2)
  {
    id v7 = PLServicesLocalizedFrameworkString();
    [v6 addObject:v7];
  }
  int v8 = [v5 kind];
  if (v8)
  {
    if (v8 != 1) {
      goto LABEL_10;
    }
    id v9 = @"SEARCH_MEDIA_TYPE_VIDEOS";
  }
  else
  {
    id v9 = @"SEARCH_MEDIA_TYPE_PHOTOS";
  }
  id v10 = PLServicesLocalizedFrameworkString();
  [v6 addObject:v10];

  id v11 = PLSearchLocalizedSynonymsForKey(v9);
  int v12 = [v11 allObjects];
  [v6 addObjectsFromArray:v12];

LABEL_10:
  int v13 = [v5 kindSubtype];
  int v14 = v13;
  if (v13 > 100)
  {
    if (v13 == 103 || v13 == 102 || v13 == 101) {
      goto LABEL_18;
    }
  }
  else if (v13 == 1 || v13 == 2 || v13 == 10)
  {
LABEL_18:
    id v15 = PLServicesLocalizedFrameworkString();
    [v6 addObject:v15];
  }
  if ([v5 playbackVariation] == 3)
  {
    id v16 = PLServicesLocalizedFrameworkString();
    [v6 addObject:v16];
  }
  int v17 = [v5 playbackStyle];
  if (v17 == 5 || v17 == 2)
  {
    uint64_t v18 = PLServicesLocalizedFrameworkString();
    [v6 addObject:v18];
  }
  if (([v5 avalanchePickType] & 0x10) != 0)
  {
    uint64_t v19 = PLServicesLocalizedFrameworkString();
    [v6 addObject:v19];
  }
  int v20 = [v5 depthType];
  if (v20 == 1)
  {
    id v22 = PLServicesLocalizedFrameworkString();
    [v6 addObject:v22];

    if (v14 != 2) {
      goto LABEL_32;
    }
    uint64_t v21 = PLServicesLivePortraitLocalizedFrameworkString();
  }
  else
  {
    if ((unsigned __int16)v20 != 2) {
      goto LABEL_32;
    }
    uint64_t v21 = PLServicesLocalizedFrameworkString();
  }
  signed int v23 = (void *)v21;
  [v6 addObject:v21];

LABEL_32:
  if ([v5 isMagicCarpet])
  {
    uint64_t v24 = PLServicesLocalizedFrameworkString();
    [v6 addObject:v24];
  }
  if ([v5 spatialType])
  {
    uint64_t v25 = PLServicesLocalizedFrameworkString();
    [v6 addObject:v25];
  }
  int v26 = [v5 additionalAttributes];
  int v27 = [v26 cameraCaptureDevice];

  if (v27 == 1)
  {
    uint64_t v28 = PLServicesLocalizedFrameworkString();
    [v6 addObject:v28];
    uint64_t v29 = PLServicesLocalizedFrameworkString();
    if ([v29 length] && (objc_msgSend(v29, "isEqualToString:", @"NULL") & 1) == 0)
    {
      int64_t v30 = (void *)MEMORY[0x1E4F1CAD0];
      __int16 v31 = [v29 componentsSeparatedByString:@"|"];
      uint64_t v32 = [v30 setWithArray:v31];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v33 = v32;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v41 != v36) {
              objc_enumerationMutation(v33);
            }
            [v6 addObject:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v35);
      }
    }
  }

  return v6;
}

+ (id)_personsForAsset:(id)a3 fetchHelper:(id)a4 personSynonyms:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v46 = a5;
  uint64_t v45 = v9;
  if (!v9)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 512, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v47 = v10;
  [v10 allDetectedFaces];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v60;
    uint64_t v48 = *(void *)v60;
    do
    {
      uint64_t v14 = 0;
      uint64_t v50 = v12;
      do
      {
        if (*(void *)v60 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v59 + 1) + 8 * v14);
        id v16 = [v15 associatedPersonForFaceOrTorso:1 orTemporal:1];
        int v17 = [v16 personUUID];
        if ([v16 shouldIndexForSearch])
        {
          uint64_t v18 = [v16 displayName];
          uint64_t v19 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          int v20 = [v18 stringByTrimmingCharactersInSet:v19];

          uint64_t v21 = [v16 fullName];
          id v22 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          signed int v23 = [v21 stringByTrimmingCharactersInSet:v22];

          uint64_t v24 = [v20 length];
          int v25 = [v23 isEqualToString:v20];
          if (v24) {
            int v26 = v20;
          }
          else {
            int v26 = v23;
          }
          if (v24) {
            int v27 = v25;
          }
          else {
            int v27 = 1;
          }
          id v54 = v26;
          if (v27) {
            uint64_t v28 = 0;
          }
          else {
            uint64_t v28 = v23;
          }
          uint64_t v29 = v28;
          uint64_t v30 = [v16 detectionType] - 1;
          if (v30 < 4) {
            uint64_t v31 = v30 + 1;
          }
          else {
            uint64_t v31 = 0;
          }
          uint64_t v32 = objc_opt_new();
          if ([v29 length]) {
            [v32 addObject:v29];
          }
          uint64_t v52 = v31;
          if ((unint64_t)(v31 - 2) <= 2)
          {
            id v33 = PLServicesLocalizedFrameworkString();
            [v32 addObject:v33];

            uint64_t v34 = PLServicesLocalizedFrameworkString();
            [v32 addObject:v34];
          }
          long long v53 = v29;
          uint64_t v35 = objc_opt_new();
          int v36 = [v15 ageType];
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke;
          v57[3] = &unk_1E586A840;
          id v37 = v35;
          id v58 = v37;
          PLSearchSearchStringsForPersonAgeType(v36, v57);
          if (_os_feature_enabled_impl())
          {
            uint32_t v38 = v17;
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke_2;
            v55[3] = &unk_1E5869BC8;
            id v56 = v32;
            [v47 enumerateSearchEntityRelationsForPerson:v16 block:v55];
            uint64_t v39 = v56;
          }
          else
          {
            uint32_t v38 = v17;
            uint64_t v39 = [v46 objectForKeyedSubscript:v17];
            if ([v39 count]) {
              [v32 addObjectsFromArray:v39];
            }
          }

          id v40 = objc_alloc(MEMORY[0x1E4F23810]);
          int v17 = v38;
          long long v41 = (void *)[v40 initWithDisplayName:v54 handles:MEMORY[0x1E4F1CBF0] handleIdentifier:0 photosPersonIdentifier:v38 isPhotosPerson:1 personType:v52 nameAlternatives:v32 faceAttributes:v37];
          long long v42 = [v16 personUri];
          [v41 setContactIdentifier:v42];

          [v49 addObject:v41];
          uint64_t v12 = v50;
          uint64_t v13 = v48;
        }
        else
        {
          int v20 = PLSearchBackendModelTranslationGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            long long v64 = v17;
            _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Person not valid for indexing: %@", buf, 0xCu);
          }
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v12);
  }

  return v49;
}

void __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 allObjects];

  [v7 addObjectsFromArray:v8];
}

void __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke_3;
  v3[3] = &unk_1E586A840;
  id v4 = *(id *)(a1 + 32);
  PLSearchStringsForPersonRelation(a2, v3);
}

void __74__PLSpotlightAssetTranslator__personsForAsset_fetchHelper_personSynonyms___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v8 length])
  {
    [*(id *)(a1 + 32) addObject:v8];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v5 allObjects];
    [v6 addObjectsFromArray:v7];
  }
}

+ (id)_contentRatingForAsset:(id)a3 fetchHelper:(id)a4
{
  id v5 = a4;
  id v6 = [a3 additionalAttributes];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [v5 allSceneClassifications];

  id v9 = [v7 setWithArray:v8];

  id v10 = +[PLSpotlightTranslatorUtilities contentRatingFromScenes:algorithmVersion:](PLSpotlightTranslatorUtilities, "contentRatingFromScenes:algorithmVersion:", v9, [v6 sceneAnalysisVersion]);

  return v10;
}

+ (id)_humanActionScenesForAsset:(id)a3 fetchHelper:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(v4, "allDetectedFaces", 0);
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
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) detectionTraits];
        uint64_t v12 = +[PLSpotlightTranslatorUtilities spotlightScenesFromDetectionTraits:v11];

        [v5 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_audioClassificationsForAsset:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 additionalAttributes];

  id v6 = [v5 temporalSceneClassifications];
  uint64_t v7 = +[PLSpotlightTranslatorUtilities spotlightAudioClassificationsFromScenes:v6];

  [v4 addObjectsFromArray:v7];
  return v4;
}

+ (void)_getGraphAttributesForMomentFromFetchHelper:(id)a3 businessNames:(id *)a4 businessCategories:(id *)a5 eventNames:(id *)a6 eventCategories:(id *)a7 eventPerformers:(id *)a8 meanings:(id *)a9 holidays:(id *)a10 locationKeywords:(id *)a11
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  if (v55)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint32_t v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 393, @"Invalid parameter not satisfying: %@", @"fetchHelper" object file lineNumber description];

    if (a4)
    {
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
LABEL_23:
      id v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 395, @"Invalid parameter not satisfying: %@", @"outBusinessCategories" object file lineNumber description];

      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_24;
    }
  }
  uint64_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 394, @"Invalid parameter not satisfying: %@", @"outBusinessNames" object file lineNumber description];

  if (!a5) {
    goto LABEL_23;
  }
LABEL_4:
  if (a6) {
    goto LABEL_5;
  }
LABEL_24:
  long long v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 396, @"Invalid parameter not satisfying: %@", @"outEventNames" object file lineNumber description];

LABEL_5:
  if (!a7)
  {
    long long v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 397, @"Invalid parameter not satisfying: %@", @"outEventCategories" object file lineNumber description];
  }
  if (!a8)
  {
    long long v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 398, @"Invalid parameter not satisfying: %@", @"outEventPerformers" object file lineNumber description];
  }
  uint64_t v18 = a11;
  if (a9)
  {
    if (a10) {
      goto LABEL_11;
    }
  }
  else
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 399, @"Invalid parameter not satisfying: %@", @"outMeanings" object file lineNumber description];

    uint64_t v18 = a11;
    if (a10) {
      goto LABEL_11;
    }
  }
  uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
  [v45 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 400, @"Invalid parameter not satisfying: %@", @"outHolidays" object file lineNumber description];

  uint64_t v18 = a11;
LABEL_11:
  uint64_t v50 = a4;
  uint64_t v51 = a5;
  uint64_t v52 = a6;
  long long v53 = a7;
  id v54 = a8;
  if (!v18)
  {
    id v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 401, @"Invalid parameter not satisfying: %@", @"outLocationKeywords" object file lineNumber description];
  }
  uint64_t v19 = objc_opt_new();
  int v20 = objc_opt_new();
  uint64_t v21 = objc_opt_new();
  id v22 = objc_opt_new();
  signed int v23 = objc_opt_new();
  uint64_t v24 = objc_opt_new();
  int v25 = objc_opt_new();
  int v26 = objc_opt_new();
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __185__PLSpotlightAssetTranslator__getGraphAttributesForMomentFromFetchHelper_businessNames_businessCategories_eventNames_eventCategories_eventPerformers_meanings_holidays_locationKeywords___block_invoke;
  v60[3] = &unk_1E5869BA0;
  id v49 = v19;
  id v61 = v49;
  id v48 = v20;
  id v62 = v48;
  id v47 = v21;
  id v63 = v47;
  id v27 = v22;
  id v64 = v27;
  id v28 = v23;
  id v65 = v28;
  id v29 = v24;
  id v66 = v29;
  id v30 = v25;
  id v67 = v30;
  id v31 = v26;
  id v68 = v31;
  [v55 enumerateMomentSearchEntitiesWithBlock:v60];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v32 = (void *)[v31 copy];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v57 != v35) {
          objc_enumerationMutation(v32);
        }
        id v37 = PLSearchStringByTrimmingApostrophes(*(void **)(*((void *)&v56 + 1) + 8 * i));
        [v31 addObject:v37];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v56 objects:v69 count:16];
    }
    while (v34);
  }

  *uint64_t v50 = (id)[v49 copy];
  *uint64_t v51 = (id)[v48 copy];
  *uint64_t v52 = (id)[v47 copy];
  *long long v53 = (id)[v27 copy];
  *id v54 = (id)[v28 copy];
  *a9 = (id)[v29 copy];
  *a11 = (id)[v30 copy];
  *a10 = [v31 allObjects];
}

void __185__PLSpotlightAssetTranslator__getGraphAttributesForMomentFromFetchHelper_businessNames_businessCategories_eventNames_eventCategories_eventPerformers_meanings_holidays_locationKeywords___block_invoke(void *a1, void *a2)
{
  id v22 = a2;
  uint64_t v3 = [v22 type];
  if (v3 > 1699)
  {
    if (v3 <= 1799)
    {
      if (v3 == 1700)
      {
        uint64_t v19 = (void *)a1[4];
        int v20 = [v22 label];
        [v19 addObject:v20];

        id v6 = (void *)a1[4];
      }
      else
      {
        if (v3 != 1701) {
          goto LABEL_22;
        }
        uint64_t v11 = (void *)a1[5];
        uint64_t v12 = [v22 label];
        [v11 addObject:v12];

        id v6 = (void *)a1[5];
      }
    }
    else
    {
      switch(v3)
      {
        case 1800:
          long long v15 = (void *)a1[6];
          long long v16 = [v22 label];
          [v15 addObject:v16];

          id v6 = (void *)a1[6];
          break;
        case 1801:
          long long v17 = (void *)a1[8];
          uint64_t v18 = [v22 label];
          [v17 addObject:v18];

          id v6 = (void *)a1[8];
          break;
        case 1802:
          uint64_t v7 = (void *)a1[7];
          uint64_t v8 = [v22 label];
          [v7 addObject:v8];

          id v6 = (void *)a1[7];
          break;
        default:
          goto LABEL_22;
      }
    }
    goto LABEL_21;
  }
  if (v3 <= 1599)
  {
    if ((unint64_t)(v3 - 1000) >= 2)
    {
      if (v3 != 1102) {
        goto LABEL_22;
      }
      uint64_t v13 = (void *)a1[11];
      long long v14 = [v22 label];
      [v13 addObject:v14];

      id v6 = (void *)a1[11];
    }
    else
    {
      id v4 = (void *)a1[10];
      id v5 = [v22 label];
      [v4 addObject:v5];

      id v6 = (void *)a1[10];
    }
    goto LABEL_21;
  }
  if (v3 == 1600 || v3 == 1610)
  {
    uint64_t v9 = (void *)a1[9];
    id v10 = [v22 label];
    [v9 addObject:v10];

    id v6 = (void *)a1[9];
LABEL_21:
    uint64_t v21 = [v22 synonyms];
    [v6 addObjectsFromArray:v21];
  }
LABEL_22:
}

+ (id)_spotlightSearchableAttributesForAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 graphData:(id)a6 indexingContext:(id)a7 documentObservation:(id)a8 propertySets:(unint64_t)a9 embeddingsFetcher:(id)a10
{
  uint64_t v210 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v193 = a7;
  id v19 = a8;
  v191 = (PLSearchIndexingEmbeddingsFetcher *)a10;
  if (v16)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v164 = [MEMORY[0x1E4F28B00] currentHandler];
    [v164 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 142, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v165 = [MEMORY[0x1E4F28B00] currentHandler];
  [v165 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 143, @"Invalid parameter not satisfying: %@", @"graphData" object file lineNumber description];

LABEL_3:
  if (!v193)
  {
    v166 = [MEMORY[0x1E4F28B00] currentHandler];
    [v166 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 144, @"Invalid parameter not satisfying: %@", @"indexingContext" object file lineNumber description];
  }
  id v190 = a1;
  id v20 = v17;
  uint64_t v21 = [v16 dateCreated];
  id v22 = [MEMORY[0x1E4F1C9C8] distantPast];
  if ([v21 isEqualToDate:v22])
  {
    signed int v23 = [v16 importedByBundleIdentifier];
    int v24 = [v23 isEqualToString:@"com.apple.MobileSMS"];

    if (v24)
    {
      int v25 = PLSearchBackendModelTranslationGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = [v16 uuid];
        id v27 = [v16 additionalAttributes];
        id v28 = [v27 syndicationIdentifier];
        *(_DWORD *)buf = 138543618;
        v207 = v26;
        __int16 v208 = 2114;
        v209 = v28;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Not creating CSSI attributeSet (dateCreated = distantPast) Messages asset %{public}@ %{public}@", buf, 0x16u);
      }
      id v29 = 0;
      id v30 = v20;
      goto LABEL_47;
    }
  }
  else
  {
  }
  id v31 = objc_alloc_init(MEMORY[0x1E4F23850]);
  id v29 = v31;
  v192 = v31;
  if (a9)
  {
    [v31 setPhotosResultType:@"com.apple.photos.search.result.collection.asset"];
    uint64_t v32 = [v16 formattedCameraModel];
    [v29 setPhotosAcquisitionModel:v32];

    uint64_t v33 = [v16 moment];
    uint64_t v34 = [v33 uuid];
    [v29 setPhotosContainerIdentifier:v34];

    uint64_t v35 = [v16 uniformTypeIdentifier];
    [v29 setPhotosContentType:v35];

    int v36 = [v16 title];
    [v29 setPhotosTitle:v36];

    id v37 = [v16 longDescription];
    [v29 setPhotosContentDescription:v37];

    uint32_t v38 = NSNumber;
    [v16 curationScore];
    uint64_t v39 = objc_msgSend(v38, "numberWithDouble:");
    [v29 setPhotosCurationScore:v39];

    id v40 = NSNumber;
    [v16 overallAestheticScore];
    long long v41 = objc_msgSend(v40, "numberWithFloat:");
    [v29 setPhotosAestheticScore:v41];

    long long v42 = [v193 synonymsByIndexCategoryMask];
    long long v43 = [v42 objectForKeyedSubscript:&unk_1EEBEE430];
    id v30 = v20;
    v44 = [v190 _personsForAsset:v16 fetchHelper:v20 personSynonyms:v43];
    [v192 setPhotosPeople:v44];

    uint64_t v45 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "isFavorite"));
    [v192 setPhotosFavorited:v45];

    id v46 = PLServicesLocalizedFrameworkString();
    [v192 setPhotosFavorites:v46];

    id v47 = [v190 _mediaTypesForAsset:v16];
    [v192 setPhotosMediaTypes:v47];

    id v48 = [v16 dateCreated];
    id v49 = [v193 calendar];
    uint64_t v50 = +[PLSpotlightTranslatorUtilities seasonsForDate:v48 calendar:v49];
    [v192 setPhotosSeasons:v50];

    uint64_t v51 = [v190 _contentRatingForAsset:v16 fetchHelper:v20];
    [v192 setPhotosContentRating:v51];

    uint64_t v52 = [v190 _locationNamesForAsset:v16 graphData:v18];
    [v192 setPhotosLocationKeywords:v52];

    long long v53 = [v190 _utilityTypesForAsset:v16 indexingContext:v193];
    [v192 setPhotosUtilityTypes:v53];

    uint64_t v54 = [v16 dateCreated];
    [v192 setPhotosContentCreationDate:v54];
    id v55 = [v193 searchIndexDateFormatter];
    uint64_t v56 = [v55 localizedMonthStringsFromDate:v54];
    v184 = v55;
    v185 = (void *)v54;
    uint64_t v57 = [v55 newLocalizedComponentsFromDate:v54 includeMonth:0];
    v183 = (void *)v56;
    [v192 setPhotosContentCreationDateMonths:v56];
    v182 = (void *)v57;
    [v192 setPhotosContentCreationDateYears:v57];
    long long v58 = objc_opt_new();
    long long v59 = [v193 sceneTaxonomyProvider];
    long long v60 = [v190 _scenesForAsset:v16 fetchHelper:v20 sceneTaxonomyProvider:v59];
    [v58 addObjectsFromArray:v60];

    id v61 = [v190 _audioClassificationsForAsset:v16];
    [v58 addObjectsFromArray:v61];

    id v62 = [v190 _humanActionScenesForAsset:v16 fetchHelper:v20];
    [v58 addObjectsFromArray:v62];

    unsigned __int8 v205 = 0;
    uint64_t v63 = [v193 csuTaxonomyObjectStore];
    id v64 = [v193 locale];
    v180 = (void *)v63;
    id v65 = [v190 _privateEncryptedComputeScenesForAsset:v16 fetchHelper:v20 csuTaxonomyObjectStore:v63 locale:v64 isSensitiveLocation:&v205];
    [v58 addObjectsFromArray:v65];

    id v66 = [NSNumber numberWithBool:v205];
    id v67 = [v193 photosSensitiveLocationKey];
    [v192 setValue:v66 forCustomKey:v67];

    v181 = v58;
    [v192 setPhotosSceneClassifications:v58];
    [v192 setPhotosDonationState:&unk_1EEBEE448];
    id v68 = NSNumber;
    long long v69 = [v16 additionalAttributes];
    uint64_t v70 = objc_msgSend(v68, "numberWithShort:", objc_msgSend(v69, "sceneAnalysisVersion"));
    [v192 setPhotosSceneAnalysisVersion:v70];

    long long v71 = NSNumber;
    v72 = [v16 mediaAnalysisAttributes];
    uint64_t v73 = objc_msgSend(v71, "numberWithShort:", objc_msgSend(v72, "characterRecognitionVersion"));
    [v192 setPhotosCharacterRecognitionAnalysisVersion:v73];

    uint64_t v74 = NSNumber;
    __int16 v75 = [v16 additionalAttributes];
    uint64_t v76 = objc_msgSend(v74, "numberWithShort:", objc_msgSend(v75, "faceAnalysisVersion"));
    [v192 setPhotosFaceAnalysisVersion:v76];

    v77 = NSNumber;
    uint64_t v78 = [v16 mediaAnalysisAttributes];
    v79 = objc_msgSend(v77, "numberWithUnsignedLongLong:", objc_msgSend(v78, "mediaAnalysisVersion"));
    [v192 setPhotosMediaAnalysisVersion:v79];

    v80 = NSNumber;
    v81 = [v16 mediaAnalysisAttributes];
    v82 = objc_msgSend(v80, "numberWithShort:", objc_msgSend(v81, "mediaAnalysisImageVersion"));
    [v192 setPhotosMediaAnalysisImageVersion:v82];

    v83 = NSNumber;
    v84 = [v16 mediaAnalysisAttributes];
    v85 = objc_msgSend(v83, "numberWithShort:", objc_msgSend(v84, "vaAnalysisVersion"));
    [v192 setPhotosPrivateEncryptedComputeAnalysisVersion:v85];

    v86 = NSNumber;
    v87 = [v16 mediaAnalysisAttributes];
    v88 = objc_msgSend(v86, "numberWithShort:", objc_msgSend(v87, "vaLocationAnalysisVersion"));
    [v192 setPhotosLocationPrivateEncryptedComputeAnalysisVersion:v88];

    v89 = NSNumber;
    v90 = [v16 mediaAnalysisAttributes];
    v91 = objc_msgSend(v89, "numberWithShort:", objc_msgSend(v90, "imageEmbeddingVersion"));
    [v192 setPhotosImageEmbeddingVersion:v91];

    uint64_t v92 = NSNumber;
    v93 = [v16 mediaAnalysisAttributes];
    v94 = objc_msgSend(v92, "numberWithShort:", objc_msgSend(v93, "videoEmbeddingVersion"));
    [v192 setPhotosVideoEmbeddingVersion:v94];

    v95 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "reverseLocationDataIsValid"));
    v96 = [v193 photosReverseLocationDataIsValidKey];
    [v192 setValue:v95 forCustomKey:v96];

    if ([v16 kind] == 1)
    {
      v97 = NSNumber;
      [v16 duration];
      v98 = objc_msgSend(v97, "numberWithDouble:");
      [v192 setPhotosDuration:v98];
    }
    if (_shouldIndexAssetUUIDForDebugging_onceToken != -1) {
      dispatch_once(&_shouldIndexAssetUUIDForDebugging_onceToken, &__block_literal_global_41464);
    }
    if (_shouldIndexAssetUUIDForDebugging_shouldIndexAssetUUIDForDebugging)
    {
      v99 = [v16 uuid];
      [v192 setPhotosDisplayName:v99];
    }
    if ([v193 isSharedLibraryEnabled])
    {
      v100 = [v190 _libraryScopeForAsset:v16];
      [v192 setPhotosLibraryName:v100];

      v101 = [v190 _sharedLibraryContributorsForAsset:v16];
      [v192 setPhotosSharedLibraryContributors:v101];
    }
    id v186 = v18;
    id v102 = [MEMORY[0x1E4F1C9C8] now];
    [v192 setPhotosDonationTimestamp:v102];

    v103 = [v16 importedByBundleIdentifier];
    id v104 = [v16 importedByDisplayName];
    if (PLShouldConstructDisplayNameForAppBundle(v103, (uint64_t)v104))
    {
      v105 = PLSyndicatedDisplayNameForAppBundle(v103, v104);
      [v192 setPhotosSavedFromAppName:v105];
      [v192 setPhotosSavedFromAppBundleIdentifier:v103];
    }
    v178 = v104;
    v179 = v103;
    id v106 = [v16 additionalAttributes];
    v107 = [v106 timeZoneName];
    [v192 setPhotosTimeZoneName:v107];

    v177 = v106;
    v108 = [v106 timeZoneOffset];
    [v192 setPhotosTimeZoneOffset:v108];

    v109 = [v16 localDateCreated];
    v110 = PLSearchPartsOfDayForLocalDate(v109);
    [v192 setPhotosPartsOfDay:v110];

    v111 = [v16 localDateCreated];
    v112 = PLSearchPartsOfWeekForLocalDate(v111);
    [v192 setPhotosPartsOfWeek:v112];

    v113 = +[PLKeywordManager keywordsForAsset:v16];
    v114 = [v113 allObjects];
    [v192 setPhotosKeywords:v114];

    id v204 = 0;
    uint64_t v115 = [v190 _albumsUUIDsForAsset:v16 fetchHelper:v20 libraryIdentifier:a5 assetCounts:&v204];
    id v116 = v204;
    v117 = [v193 photosAlbumUUIDsKey];
    v176 = (void *)v115;
    [v192 setValue:v115 forCustomKey:v117];

    v118 = [v193 photosAlbumAssetCountsKey];
    v175 = v116;
    [v192 setValue:v116 forCustomKey:v118];

    id v203 = 0;
    uint64_t v119 = [v190 _memoryUUIDsForAsset:v16 fetchHelper:v20 libraryIdentifier:a5 assetCounts:&v203];
    id v120 = v203;
    v121 = [v193 photosMemoryUUIDsKey];
    v174 = (void *)v119;
    [v192 setValue:v119 forCustomKey:v121];

    v122 = [v193 photosMemoryAssetCountsKey];
    v173 = v120;
    [v192 setValue:v120 forCustomKey:v122];

    id v202 = 0;
    uint64_t v123 = [v190 _highlightUUIDsForAsset:v16 libraryIdentifier:a5 assetCounts:&v202];
    id v124 = v202;
    v125 = [v193 photosHighlightUUIDsKey];
    v189 = (void *)v123;
    [v192 setValue:v123 forCustomKey:v125];

    v126 = [v193 photosHighlightAssetCountsKey];
    [v192 setValue:v124 forCustomKey:v126];

    if (_os_feature_enabled_impl())
    {
      v127 = PLSearchBackendModelTranslationGetLog();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
      {
        v128 = [v16 uuid];
        *(_DWORD *)buf = 138412290;
        v207 = v128;
        _os_log_impl(&dword_19B3C7000, v127, OS_LOG_TYPE_DEBUG, "PLSpotlightAssetTranslator using Graph data from photo library storage for asset: %@", buf, 0xCu);
      }
      v172 = [v16 moment];
      if (v172)
      {
        id v200 = 0;
        id v201 = 0;
        id v198 = 0;
        id v199 = 0;
        id v196 = 0;
        id v197 = 0;
        id v194 = 0;
        id v195 = 0;
        [v190 _getGraphAttributesForMomentFromFetchHelper:v20 businessNames:&v201 businessCategories:&v200 eventNames:&v199 eventCategories:&v198 eventPerformers:&v197 meanings:&v196 holidays:&v195 locationKeywords:&v194];
        id v129 = v201;
        id v130 = v200;
        id v171 = v199;
        id v170 = v198;
        id v169 = v197;
        id v168 = v196;
        id v167 = v195;
        v131 = v190;
        id v132 = v194;
      }
      else
      {
        id v145 = PLSearchBackendModelTranslationGetLog();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
        {
          uint64_t v146 = [v16 uuid];
          *(_DWORD *)buf = 138412290;
          v207 = v146;
          _os_log_impl(&dword_19B3C7000, v145, OS_LOG_TYPE_INFO, "No Moment set for asset: %@. No Knowledge Graph data for this asset.", buf, 0xCu);
        }
        id v129 = 0;
        id v130 = 0;
        id v170 = 0;
        id v171 = 0;
        id v168 = 0;
        id v169 = 0;
        id v167 = 0;
        id v132 = 0;
        v131 = v190;
      }
      [v192 setPhotosBusinessNames:v129];
      [v192 setPhotosBusinessCategories:v130];
      [v192 setPhotosEventNames:v171];
      [v192 setPhotosEventCategories:v170];
      [v192 setPhotosEventPerformers:v169];
      [v192 setPhotosMeanings:v168];
      [v192 setPhotosHolidays:v167];
      v147 = [v131 _locationNamesForAsset:v16 graphLocations:v132];
      [v192 setPhotosLocationKeywords:v147];

      v144 = v129;
      id v18 = v186;
    }
    else
    {
      id v18 = v186;
      if (!v186)
      {
        id v133 = PLSearchBackendModelTranslationGetLog();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
        {
          id v134 = [v16 uuid];
          *(_DWORD *)buf = 138412290;
          v207 = v134;
          _os_log_impl(&dword_19B3C7000, v133, OS_LOG_TYPE_DEBUG, "No Graph Data for asset: %@", buf, 0xCu);
        }
        id v18 = (id)MEMORY[0x1E4F1CC08];
      }
      v135 = +[PLSpotlightTranslatorUtilities textFromGraphData:v18 searchIndexCategoryMask:0x100000];
      [v192 setPhotosBusinessNames:v135];

      id v136 = +[PLSpotlightTranslatorUtilities textFromGraphData:v18 searchIndexCategoryMask:0x200000];
      [v192 setPhotosBusinessCategories:v136];

      id v137 = +[PLSpotlightTranslatorUtilities textFromGraphData:v18 searchIndexCategoryMask:0x1000000];
      [v192 setPhotosEventNames:v137];

      v138 = [v193 synonymsByIndexCategoryMask];
      v139 = +[PLSpotlightTranslatorUtilities textFromGraphData:v18 searchIndexCategoryMask:0x4000000 synonymSearchIndexCategoryMask:0x200000000 synonyms:v138];
      [v192 setPhotosEventCategories:v139];

      uint64_t v140 = +[PLSpotlightTranslatorUtilities textFromGraphData:v18 searchIndexCategoryMask:0x2000000];
      [v192 setPhotosEventPerformers:v140];

      v141 = [v193 synonymsByIndexCategoryMask];
      id v142 = +[PLSpotlightTranslatorUtilities textFromGraphData:v18 searchIndexCategoryMask:0x4000 synonymSearchIndexCategoryMask:0x20000000 synonyms:v141];
      [v192 setPhotosMeanings:v142];

      id v143 = +[PLSpotlightTranslatorUtilities textFromGraphData:v18 searchIndexCategoryMask:0x8000];
      [v192 setPhotosHolidays:v143];

      v144 = [v190 _locationNamesForAsset:v16 graphData:v18];
      [v192 setPhotosLocationKeywords:v144];
    }

    id v148 = [v16 photoLibrary];
    v149 = [v148 libraryServicesManager];
    uint64_t v150 = [v149 wellKnownPhotoLibraryIdentifier];

    if (v150 != 3)
    {
      id v151 = [v16 uuid];
      id v152 = PLServicesLocalizedFrameworkString();
      +[PLSpotlightTranslatorUtilities tagCSSearchableItem:v192 entityInstanceIdentifier:v151 typeIdentifier:@"AssetEntity" typeDisplayName:v152 displayTitle:&stru_1EEB2EB80 displaySubtitle:0];
    }
    id v29 = v192;
  }
  else
  {
    id v30 = v20;
  }
  if ((a9 & 2) != 0)
  {
    id v153 = +[PLSearchOCRUtilities spotlightTextLinesFromDocumentObservation:v19];
    [v29 setPhotosTextContentPieces:v153];
  }
  id v154 = v191;
  if (!v191) {
    id v154 = objc_alloc_init(PLSearchIndexingEmbeddingsFetcher);
  }
  int v25 = [(PLSearchIndexingEmbeddingsFetcher *)v154 embeddingForAsset:v16 indexingContext:v193 allowFetchIfMissing:v191 == 0];
  if ([v25 isSuccess])
  {
    id v155 = [v25 result];
    [v192 setPhotoEmbedding:v155];

    id v156 = NSNumber;
    [v25 result];
    id v157 = v187 = v30;
    id v158 = [v157 vectors];
    id v159 = objc_msgSend(v156, "numberWithUnsignedInteger:", objc_msgSend(v158, "count"));
    [v193 photosEmbeddingCountKey];
    id v160 = v18;
    v162 = id v161 = v19;
    [v192 setValue:v159 forCustomKey:v162];

    id v19 = v161;
    id v18 = v160;

    id v29 = v192;
    id v30 = v187;
  }
  v191 = v154;
LABEL_47:

  return v29;
}

+ (id)partialSpotlightSearchableItemFromAsset:(id)a3 fetchHelper:(id)a4 libraryIdentifier:(int64_t)a5 propertySets:(unint64_t)a6 graphData:(id)a7 indexingContext:(id)a8 documentObservation:(id)a9 embeddingsFetcher:(id)a10
{
  id v16 = a3;
  id v50 = a4;
  id v17 = a7;
  id v49 = a8;
  id v18 = a9;
  id v19 = a10;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 114, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 115, @"Invalid parameter not satisfying: %@", @"graphData" object file lineNumber description];

LABEL_3:
  id v48 = v17;
  id v20 = v49;
  if (!v49)
  {
    uint64_t v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 116, @"Invalid parameter not satisfying: %@", @"indexingContext" object file lineNumber description];
  }
  if (a6) {
    unint64_t v21 = a6;
  }
  else {
    unint64_t v21 = 3;
  }
  id v22 = +[PLSpotlightDonationUtilities spotlightUniqueIdentifierForAsset:v16];
  [v16 photoLibrary];
  int v24 = v23 = a1;
  int v25 = [v24 libraryServicesManager];
  int v26 = +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", [v25 wellKnownPhotoLibraryIdentifier]);

  id v27 = v23;
  id v28 = v48;
  id v29 = [v27 _spotlightSearchableAttributesForAsset:v16 fetchHelper:v50 libraryIdentifier:a5 graphData:v48 indexingContext:v49 documentObservation:v18 propertySets:v21 embeddingsFetcher:v19];
  if (v29)
  {
    id v47 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v22 domainIdentifier:v26 attributeSet:v29];
    id v30 = [v16 photoLibrary];
    id v31 = [v30 libraryServicesManager];
    uint64_t v32 = v26;
    id v33 = v16;
    unint64_t v34 = v21;
    uint64_t v35 = v22;
    id v36 = v19;
    id v37 = v18;
    uint64_t v38 = [v31 wellKnownPhotoLibraryIdentifier];

    id v20 = v49;
    BOOL v40 = v38 == 3;
    id v18 = v37;
    id v19 = v36;
    id v22 = v35;
    uint64_t v39 = v47;
    id v28 = v48;
    BOOL v40 = !v40 && v34 == 3;
    id v16 = v33;
    int v26 = v32;
    uint64_t v41 = !v40;
    [v47 setIsUpdate:v41];
  }
  else
  {
    uint64_t v39 = 0;
  }

  return v39;
}

+ (id)spotlightSearchableItemFromAsset:(id)a3 libraryIdentifier:(int64_t)a4 graphData:(id)a5 indexingContext:(id)a6 documentObservation:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v42 = a7;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_19:
    uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 85, @"Invalid parameter not satisfying: %@", @"graphData" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
LABEL_20:
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 86, @"Invalid parameter not satisfying: %@", @"indexingContext" object file lineNumber description];

    goto LABEL_4;
  }
  unint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, a1, @"PLSpotlightAssetTranslator.m", 84, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

  if (!v13) {
    goto LABEL_19;
  }
LABEL_3:
  if (!v14) {
    goto LABEL_20;
  }
LABEL_4:
  long long v15 = PLSearchIndexGetLog();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  id v17 = v15;
  id v18 = v17;
  unint64_t v39 = v16 - 1;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLSpotlightAssetTranslator: Asset translation time", "", buf, 2u);
  }
  os_signpost_id_t spid = v16;

  id v19 = +[PLSpotlightDonationUtilities spotlightUniqueIdentifierForAsset:v12];
  id v20 = [v12 photoLibrary];
  unint64_t v21 = [v20 libraryServicesManager];
  id v22 = +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", [v21 wellKnownPhotoLibraryIdentifier]);

  id v23 = [PLSearchIndexingLazyFetchHelper alloc];
  int v24 = [v12 managedObjectContext];
  int v25 = [(PLSearchIndexingLazyFetchHelper *)v23 initWithObject:v12 libraryIdentifier:a4 managedObjectContext:v24];

  int v26 = [a1 _spotlightSearchableAttributesForAsset:v12 fetchHelper:v25 libraryIdentifier:a4 graphData:v13 indexingContext:v14 documentObservation:v42 propertySets:3 embeddingsFetcher:0];
  if (v26)
  {
    id v38 = v14;
    id v41 = v13;
    id v27 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v19 domainIdentifier:v22 attributeSet:v26];
    id v28 = [v12 photoLibrary];
    id v29 = [v28 libraryServicesManager];
    uint64_t v30 = [v29 wellKnownPhotoLibraryIdentifier];

    if (v30 == 3) {
      [v27 setIsUpdate:1];
    }
    id v31 = v18;
    uint64_t v32 = v31;
    if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)long long v43 = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PLSpotlightAssetTranslator: Asset translation time", "", v43, 2u);
    }

    id v13 = v41;
    id v14 = v38;
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

@end