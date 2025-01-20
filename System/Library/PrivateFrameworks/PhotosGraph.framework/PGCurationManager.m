@interface PGCurationManager
+ (BOOL)areAssetsInteresting:(id)a3 minimumNumberOfCuratedAssets:(unint64_t)a4 duration:(unint64_t)a5;
+ (double)contentScoreForAssets:(id)a3;
+ (id)_filterAssets:(id)a3 withPositiveLocations:(id)a4 negativeLocations:(id)a5 maximumDistance:(double)a6;
+ (id)_filteredAssetsWithFaceFilter:(unint64_t)a3 forAssets:(id)a4;
+ (id)assetPropertySetsForCuration;
+ (id)assetsBeautifier;
+ (id)dedupedAssetsWithAssets:(id)a3;
+ (id)defaultAssetSortDescriptors;
+ (id)dejunkAndDedupeItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forAreaNodes:(id)a5 withMaximumDistance:(double)a6;
+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forCityNodes:(id)a5 withMaximumDistance:(double)a6;
+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forLocationNodes:(id)a5 withMaximumDistance:(double)a6;
+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forStateNodes:(id)a5 withMaximumDistance:(double)a6;
+ (id)filterAssets:(id)a3 withLocation:(id)a4 maximumDistance:(double)a5;
+ (id)filterAssets:(id)a3 withLocations:(id)a4 maximumDistance:(double)a5;
+ (id)filteredAssetsFromAssets:(id)a3 withContextualAssetLocalIdentifiers:(id)a4 approximateTimeDistance:(double)a5;
+ (id)representativeAssetsForAssetCollection:(id)a3 curationContext:(id)a4 progressBlock:(id)a5;
+ (id)representativeAssetsForAssets:(id)a3 extendedCuratedAssets:(id)a4 progressBlock:(id)a5;
+ (id)representativeAssetsForAssets:(id)a3 progressBlock:(id)a4;
+ (id)sceneInfoWithAsset:(id)a3 curationSession:(id)a4;
+ (id)summaryClusteringForDuration:(unint64_t)a3;
+ (unint64_t)maximumNumberOfItemsForDuration:(unint64_t)a3 withTotalNumberOfItems:(unint64_t)a4;
+ (unint64_t)maximumNumberOfItemsForDuration:(unint64_t)a3 withTotalNumberOfItems:(unint64_t)a4 spanningNumberOfDays:(double)a5;
+ (unint64_t)minimumNumberOfItemsForDuration:(unint64_t)a3 withMaximumNumberOfItems:(unint64_t)a4;
- (BOOL)isAssetCollectionInteresting:(id)a3 curationContext:(id)a4;
- (BOOL)isAssetFeederInteresting:(id)a3 withAlternateJunking:(BOOL)a4 smart:(BOOL)a5;
- (OS_os_log)curationLoggingConnection;
- (PFSceneGeography)sceneGeography;
- (PGCurationCriteriaFactory)curationCriteriaFactory;
- (PGCurationManager)initWithPhotoLibrary:(id)a3 cacheURL:(id)a4;
- (PHPhotoLibrary)photoLibrary;
- (double)contentScoreForAssetCollection:(id)a3 curationContext:(id)a4;
- (double)contentScoreForAssetFeeder:(id)a3;
- (id)_bestAssetInSummarizedAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4;
- (id)_bestAssetsInAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4 minimumRatioOfReferencePersonsPerAsset:(double)a5 progressBlock:(id)a6;
- (id)_contextualBestAssetInAssets:(id)a3;
- (id)_curatedKeyAssetIdentifierForCollectionUUID:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curatedKeyAsset:(id *)a7 curationContext:(id)a8;
- (id)_extendedAssetsForCurationForAssets:(id)a3 matchingAssetsRange:(_NSRange)a4;
- (id)_filteredAssetsForAssets:(id)a3 inMoments:(id)a4 keepFavorites:(BOOL)a5;
- (id)_firstBestFacedAssetInAssetCluster:(id)a3 facesByAssetIdentifiers:(id)a4;
- (id)_libraryDateInterval;
- (id)_timeBasedAssetClustersForAssets:(id)a3 maximumClusterCount:(unint64_t)a4;
- (id)bestAssetForAssetFeeder:(id)a3 options:(id)a4;
- (id)bestAssetForAssetFeeder:(id)a3 options:(id)a4 criteria:(id)a5;
- (id)bestAssetInAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4 minimumNumberOfCommonPeople:(unint64_t)a5 forKeyAsset:(BOOL)a6 forMemories:(BOOL)a7 allowGuestAsset:(BOOL)a8;
- (id)bestAssetInAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4 requiredMinimumNumberOfReferencePersons:(unint64_t)a5 forMemories:(BOOL)a6 forSocialGroup:(BOOL)a7 allowGuestAsset:(BOOL)a8 wantsGoodSquareCropScore:(BOOL)a9;
- (id)bestAssetInAssets:(id)a3 options:(id)a4;
- (id)bestAssetsForAssetFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5;
- (id)criteriaForKeyAssetCurationWithAssetCollection:(id)a3 graph:(id)a4 options:(id)a5 curationContext:(id)a6;
- (id)curatedAssetsForAssetCollection:(id)a3 duration:(unint64_t)a4 referencePersonLocalIdentifiers:(id)a5 curationContext:(id)a6 progressBlock:(id)a7;
- (id)curatedAssetsForAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5 progressBlock:(id)a6;
- (id)curatedAssetsForPersonLocalIdentifier:(id)a3 progressBlock:(id)a4;
- (id)curatedKeyAssetForAssetCollection:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curationContext:(id)a7;
- (id)curatedKeyAssetForCollectionUUID:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curationContext:(id)a7;
- (id)curatedKeyAssetIdentifierForCollectionUUID:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curationContext:(id)a7;
- (id)defaultAssetFetchOptions;
- (id)defaultAssetFetchOptionsForMemories;
- (id)defaultAssetFetchOptionsForMemoriesWithoutPrefetch;
- (id)dejunkAndDedupeAssetsInAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5 progressBlock:(id)a6;
- (id)fetchAssetWithLocalIdentifier:(id)a3;
- (id)fetchAssetsSortedByDateWithLocalIdentifiers:(id)a3;
- (id)memoryCuratedAssetsForAssetCollection:(id)a3 duration:(unint64_t)a4 withContextualAssetLocalIdentifiers:(id)a5 minimumProportion:(double)a6 graph:(id)a7 curationContext:(id)a8 progressBlock:(id)a9;
- (id)memoryCuratedAssetsForAssets:(id)a3 duration:(unint64_t)a4 withContextualAssetLocalIdentifiers:(id)a5 minimumProportion:(double)a6 graph:(id)a7 curationContext:(id)a8 progressBlock:(id)a9;
- (unint64_t)optimalDurationForAssetCollection:(id)a3 duration:(unint64_t)a4 options:(id)a5 curationContext:(id)a6;
- (void)invalidateCurationCacheForMomentUUIDs:(id)a3;
- (void)invalidateDiskCaches;
- (void)invalidateMemoryCaches;
@end

@implementation PGCurationManager

- (id)_curatedKeyAssetIdentifierForCollectionUUID:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curatedKeyAsset:(id *)a7 curationContext:(id)a8
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  v16 = (PGKeyAssetCurationOptions *)a5;
  id v17 = a6;
  id v18 = a8;
  if (!v14)
  {
    v25 = 0;
    goto LABEL_37;
  }
  id v57 = v18;
  v19 = [(PGCurationManager *)self curationLoggingConnection];
  os_signpost_id_t v20 = os_signpost_id_generate(v19);
  v21 = v19;
  v22 = v21;
  unint64_t v55 = v20 - 1;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "CuratedKeyAsset", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v53 = mach_absolute_time();
  if (!v16) {
    v16 = objc_alloc_init(PGKeyAssetCurationOptions);
  }
  uint64_t v23 = [(PGCurationCache *)self->_cache curatedKeyAssetIdentifierForCollectionUUID:v14 options:v16];
  uint64_t v24 = v23;
  id v56 = v17;
  os_signpost_id_t spid = v20;
  if (v23)
  {
    if (!a7)
    {
      id v28 = 0;
      v25 = (void *)v23;
      goto LABEL_27;
    }
    v54 = a7;
    v25 = (void *)v23;
LABEL_10:
    v65[0] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
    v27 = [(PGCurationManager *)self fetchAssetsSortedByDateWithLocalIdentifiers:v26];

    id v28 = [v27 firstObject];

LABEL_26:
    id v28 = v28;
    id *v54 = v28;
    goto LABEL_27;
  }
  v54 = a7;
  context = (void *)MEMORY[0x1D25FED50]();
  v29 = [v15 photoLibrary];
  v30 = [v29 librarySpecificFetchOptions];

  v31 = +[PGCurationManager assetPropertySetsForCuration];
  [v30 addFetchPropertySets:v31];

  [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:1];
  v33 = v32 = v17;
  [v33 setPersonsPrefetchMode:2];
  [v33 setFaceInformationPrefetchMode:2];
  v34 = [v32 scenesTrait];
  if ([v34 isActive]) {
    uint64_t v35 = 2;
  }
  else {
    uint64_t v35 = 1;
  }
  [v33 setScenesPrefetchMode:v35];

  id v51 = v15;
  v49 = v30;
  v36 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v15 options:v30 feederPrefetchOptions:v33 curationContext:v57];
  v37 = (void *)[(PGKeyAssetCurationOptions *)v16 copy];
  id v28 = [(PGCurationManager *)self bestAssetForAssetFeeder:v36 options:v37 criteria:v32];
  if (!v28)
  {
    if ([v36 numberOfItems]
      && ![(PGKeyAssetCurationOptions *)v16 useContextualCurationOnly])
    {
      id v28 = [v36 itemAtIndex:0];
    }
    else
    {
      id v28 = 0;
    }
  }
  v25 = [v28 localIdentifier];
  if (v28) {
    [(PGCurationCache *)self->_cache setCuratedKeyAsset:v28 forCollectionUUID:v14 options:v16];
  }

  if (v54)
  {
    id v15 = v51;
    if (!v25) {
      goto LABEL_27;
    }
    if (v28) {
      goto LABEL_26;
    }
    goto LABEL_10;
  }
  id v15 = v51;
LABEL_27:
  uint64_t v38 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v41 = v22;
  v42 = v41;
  if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    v43 = @"YES";
    if (!v24) {
      v43 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v60 = (const char *)v43;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v42, OS_SIGNPOST_INTERVAL_END, spid, "CuratedKeyAsset", "KeyAsset Criteria Cached (%@)", buf, 0xCu);
  }

  v44 = v42;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    float v45 = (float)((float)((float)(v38 - v53) * (float)numer) / (float)denom) / 1000000.0;
    v46 = @"YES";
    if (!v24) {
      v46 = @"NO";
    }
    v47 = [NSString stringWithFormat:@"KeyAsset Criteria Cached (%@)", v46];
    *(_DWORD *)buf = 136315650;
    v60 = "CuratedKeyAsset";
    __int16 v61 = 2112;
    v62 = v47;
    __int16 v63 = 2048;
    double v64 = v45;
    _os_log_impl(&dword_1D1805000, v44, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  id v17 = v56;
  id v18 = v57;
LABEL_37:

  return v25;
}

- (id)curatedKeyAssetForCollectionUUID:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curationContext:(id)a7
{
  id v10 = 0;
  id v7 = [(PGCurationManager *)self _curatedKeyAssetIdentifierForCollectionUUID:a3 curatedAssetCollection:a4 options:a5 criteria:a6 curatedKeyAsset:&v10 curationContext:a7];
  id v8 = v10;
  return v8;
}

- (id)curatedKeyAssetIdentifierForCollectionUUID:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curationContext:(id)a7
{
  return [(PGCurationManager *)self _curatedKeyAssetIdentifierForCollectionUUID:a3 curatedAssetCollection:a4 options:a5 criteria:a6 curatedKeyAsset:0 curationContext:a7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneGeography, 0);
  objc_storeStrong((id *)&self->_curationCriteriaFactory, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_curationLoggingConnection, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (PGCurationCriteriaFactory)curationCriteriaFactory
{
  return self->_curationCriteriaFactory;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_os_log)curationLoggingConnection
{
  return self->_curationLoggingConnection;
}

- (id)defaultAssetFetchOptionsForMemoriesWithoutPrefetch
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PGCurationManager *)self photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v6[0] = *MEMORY[0x1E4F394A8];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 setFetchPropertySets:v4];

  [v3 setWantsIncrementalChangeDetails:0];
  [v3 setIncludeGuestAssets:1];
  return v3;
}

- (id)defaultAssetFetchOptionsForMemories
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [(PGCurationManager *)self defaultAssetFetchOptions];
  [v2 setIncludeGuestAssets:1];
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"isFavorite" ascending:0];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  [v2 setSortDescriptors:v5];

  [v2 setFetchLimit:5000];
  return v2;
}

- (id)defaultAssetFetchOptions
{
  v2 = [(PGCurationManager *)self photoLibrary];
  v3 = [v2 librarySpecificFetchOptions];

  v4 = +[PGCurationManager assetPropertySetsForCuration];
  [v3 setFetchPropertySets:v4];

  [v3 setWantsIncrementalChangeDetails:0];
  return v3;
}

- (id)fetchAssetWithLocalIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    v5 = [(PGCurationManager *)self photoLibrary];
    v6 = [v5 librarySpecificFetchOptions];

    [v6 setFetchLimit:1];
    id v7 = (void *)MEMORY[0x1E4F38EB8];
    v12[0] = v4;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v9 = [v7 fetchAssetsWithLocalIdentifiers:v8 options:v6];

    id v10 = [v9 firstObject];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)fetchAssetsSortedByDateWithLocalIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(PGCurationManager *)self photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];

  id v7 = [(id)objc_opt_class() defaultAssetSortDescriptors];
  [v6 setSortDescriptors:v7];

  id v8 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v4 options:v6];

  return v8;
}

- (id)_extendedAssetsForCurationForAssets:(id)a3 matchingAssetsRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = [v7 count];
  if (location != -1)
  {
    unint64_t v9 = v8;
    if (length >= 4)
    {
      id v10 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7 copyItems:0];
      v11 = -[NSObject subarrayWithRange:](v10, "subarrayWithRange:", location, length);
      v12 = [(PGCurationManager *)self curationLoggingConnection];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v19 = 134218240;
        NSUInteger v20 = length;
        __int16 v21 = 2048;
        unint64_t v22 = v9;
        v13 = "Curated key asset with criteria: found assets range matching scenes %ld/%ld";
LABEL_14:
        _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v19, 0x16u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (length)
    {
      double v14 = (double)v8 * 0.5;
      double v15 = v14 - (double)location;
      double v16 = (double)(location + length) - v14;
      if (v15 <= v16) {
        unint64_t v17 = v8 - location;
      }
      else {
        unint64_t v17 = location + length;
      }
      if (v17 < 4)
      {
        id v10 = [(PGCurationManager *)self curationLoggingConnection];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v19 = 134218240;
          NSUInteger v20 = v17;
          __int16 v21 = 2048;
          unint64_t v22 = v9;
          _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Curated key asset with criteria: cannot use extended assets %ld/%ld", (uint8_t *)&v19, 0x16u);
        }
        v11 = 0;
        goto LABEL_16;
      }
      if (v15 > v16) {
        NSUInteger location = 0;
      }
      id v10 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7 copyItems:0];
      v11 = -[NSObject subarrayWithRange:](v10, "subarrayWithRange:", location, v17);
      v12 = [(PGCurationManager *)self curationLoggingConnection];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v19 = 134218240;
        NSUInteger v20 = v17;
        __int16 v21 = 2048;
        unint64_t v22 = v9;
        v13 = "Curated key asset with criteria: found extended assets for curation %ld/%ld";
        goto LABEL_14;
      }
LABEL_15:

LABEL_16:
      goto LABEL_18;
    }
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (id)_contextualBestAssetInAssets:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v4 = 0;
      uint64_t v8 = *(void *)v19;
      double v9 = -1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "clsContentScore", (void)v18);
          double v13 = v12;
          [v11 clsAestheticScore];
          if (v14 < 0.0) {
            double v14 = 0.0;
          }
          double v15 = (v13 + v14) * 0.5;
          if (v15 > v9)
          {
            id v16 = v11;

            double v9 = v15;
            id v4 = v16;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

- (id)bestAssetForAssetFeeder:(id)a3 options:(id)a4 criteria:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v60 = (PGKeyAssetCurationOptions *)a4;
  id v65 = a5;
  id v56 = v7;
  v59 = [v7 allItems];
  uint64_t v57 = [v59 count];
  if (!v57)
  {
    uint64_t v24 = 0;
    goto LABEL_69;
  }
  uint64_t v8 = v60;
  if (!v60) {
    uint64_t v8 = objc_alloc_init(PGKeyAssetCurationOptions);
  }
  v60 = v8;
  double v9 = [v65 peopleTrait];
  v54 = [v9 items];

  if ([v54 count])
  {
    [(PGKeyAssetCurationOptions *)v60 setFocusOnPeople:1];
    [(PGKeyAssetCurationOptions *)v60 setReferencePersonLocalIdentifiers:v54];
  }
  uint64_t v10 = [(PGKeyAssetCurationOptions *)v60 isForMemories];
  uint64_t v11 = [(PGKeyAssetCurationOptions *)v60 allowGuestAsset];
  if (!v65)
  {
    v25 = 0;
    uint64_t v16 = -1;
    uint64_t v17 = -1;
    if (!v60) {
      goto LABEL_54;
    }
    goto LABEL_55;
  }
  uint64_t v12 = v11;
  v62 = [MEMORY[0x1E4F1CA48] array];
  __int16 v61 = [MEMORY[0x1E4F1CA48] array];
  __int16 v63 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v59;
  uint64_t v13 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v13)
  {
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v76;
    uint64_t v16 = -1;
    uint64_t v17 = -1;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v76 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        long long v20 = (void *)MEMORY[0x1D25FED50]();
        *(void *)buf = 0;
        int v21 = [v65 isPassingForAsset:v19 score:buf];
        if (*(double *)buf > 0.0) {
          int v22 = v21;
        }
        else {
          int v22 = 0;
        }
        if (v22 == 1)
        {
          uint64_t v23 = [NSNumber numberWithDouble:*(double *)buf];
          [v63 setObject:v23 forKey:v19];

          [v62 addObject:v19];
          uint64_t v16 = v14 + i;
          if (v17 == -1) {
            uint64_t v17 = v14 + i;
          }
          if (([v19 clsAvoidIfPossibleAsKeyItemForMemories:v10 allowGuestAsset:v12] & 1) == 0) {
            [v61 addObject:v19];
          }
        }
      }
      v14 += v13;
      uint64_t v13 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v16 = -1;
    uint64_t v17 = -1;
  }

  if ([v61 count])
  {
    id v26 = v61;

    v27 = v26;
  }
  else
  {
    v27 = v62;
  }
  id v28 = v27;
  uint64_t v29 = [v27 count];
  v30 = [(PGCurationManager *)self curationLoggingConnection];
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
  if (!v29)
  {
    if (v31)
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v57;
      _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "Curated key asset with criteria: not enough matching assets %ld/%ld. Fallback to normal curation", buf, 0x16u);
    }
    goto LABEL_46;
  }
  if (v31)
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v29;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v57;
    _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "Curated key asset with criteria: matching assets with criteria %ld/%ld.", buf, 0x16u);
  }

  v30 = objc_msgSend((id)objc_opt_class(), "_filteredAssetsWithFaceFilter:forAssets:", objc_msgSend(v65, "faceFilter"), v28);
  if (![v30 count])
  {
    v44 = [(PGCurationManager *)self curationLoggingConnection];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      uint64_t v45 = [v30 count];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v45;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v57;
      _os_log_impl(&dword_1D1805000, v44, OS_LOG_TYPE_INFO, "Curated key asset with criteria: not enough matching assets (with faces) %ld/%ld. Fallback to normal curation", buf, 0x16u);
    }

LABEL_46:
    v25 = 0;
    goto LABEL_53;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v84 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x2020000000;
  v74[3] = 0;
  v32 = (void *)MEMORY[0x1E4F76C60];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke;
  v72[3] = &unk_1E68EA180;
  id v33 = v63;
  id v73 = v33;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_2;
  v71[3] = &unk_1E68EA1A8;
  v71[4] = buf;
  v71[5] = v74;
  [v32 calculateStandardDeviationForItems:v30 valueBlock:v72 result:v71];
  v34 = (void *)MEMORY[0x1E4F28F60];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_3;
  v67[3] = &unk_1E68EA1D0;
  id v68 = v33;
  v69 = buf;
  v70 = v74;
  uint64_t v35 = [v34 predicateWithBlock:v67];
  v36 = [v30 filteredArrayUsingPredicate:v35];

  unint64_t v37 = [v36 count];
  unint64_t v38 = [obj count];
  [v65 minimumAssetsRatio];
  if ((double)v37 / (double)v38 >= v39 && v37 >= 2)
  {
    v25 = v36;
    v41 = [(PGCurationManager *)self curationLoggingConnection];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      uint64_t v46 = [v25 count];
      *(_DWORD *)v79 = 134218240;
      uint64_t v80 = v46;
      __int16 v81 = 2048;
      uint64_t v82 = v57;
      v43 = "Curated key asset with criteria: using strongly filtered assets %ld/%ld";
      goto LABEL_51;
    }
  }
  else if ([(PGKeyAssetCurationOptions *)v60 useContextualCurationOnly])
  {
    v25 = v36;
    v41 = [(PGCurationManager *)self curationLoggingConnection];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      uint64_t v42 = [v25 count];
      *(_DWORD *)v79 = 134218240;
      uint64_t v80 = v42;
      __int16 v81 = 2048;
      uint64_t v82 = v57;
      v43 = "Curated key asset with criteria: using weakly filtered assets %ld/%ld";
LABEL_51:
      _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, v43, v79, 0x16u);
    }
  }
  else
  {
    v25 = v30;
    v41 = [(PGCurationManager *)self curationLoggingConnection];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      uint64_t v47 = [v25 count];
      *(_DWORD *)v79 = 134218240;
      uint64_t v80 = v47;
      __int16 v81 = 2048;
      uint64_t v82 = v57;
      v43 = "Curated key asset with criteria: using matching assets (with faces) %ld/%ld";
      goto LABEL_51;
    }
  }

  _Block_object_dispose(v74, 8);
  _Block_object_dispose(buf, 8);
LABEL_53:

  if (!v60) {
LABEL_54:
  }
    v60 = objc_alloc_init(PGKeyAssetCurationOptions);
LABEL_55:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_355;
  aBlock[3] = &__block_descriptor_40_e8_B16__0Q8l;
  aBlock[4] = v57;
  v48 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
  if (v25)
  {
    uint64_t v24 = [(PGCurationManager *)self _contextualBestAssetInAssets:v25];
    if (v24) {
      goto LABEL_68;
    }
  }
  if (![(PGKeyAssetCurationOptions *)v60 useContextualCurationOnly])
  {
    [(PGKeyAssetCurationOptions *)v60 setPrefilterAssetsWithFaces:1];
    v49 = -[PGCurationManager _extendedAssetsForCurationForAssets:matchingAssetsRange:](self, "_extendedAssetsForCurationForAssets:matchingAssetsRange:", v59, v17, v16 - v17);
    uint64_t v50 = [v49 count];
    if (v50)
    {
      id v51 = [(PGCurationManager *)self curationLoggingConnection];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v50;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v57;
        _os_log_impl(&dword_1D1805000, v51, OS_LOG_TYPE_INFO, "Curated key asset with criteria: using extended assets for curation %ld/%ld", buf, 0x16u);
      }

      [(PGKeyAssetCurationOptions *)v60 setUseSummarizer:v48[2](v48, v50)];
      uint64_t v24 = [(PGCurationManager *)self bestAssetInAssets:v49 options:v60];
      if (v24) {
        goto LABEL_67;
      }
      v52 = [(PGCurationManager *)self curationLoggingConnection];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v52, OS_LOG_TYPE_ERROR, "Curated key asset with criteria: didn't find key asset in extended assets. Fallback to default.", buf, 2u);
      }
    }
    [(PGKeyAssetCurationOptions *)v60 setUseSummarizer:v48[2](v48, v57)];
    uint64_t v24 = [(PGCurationManager *)self bestAssetInAssets:v59 options:v60];
LABEL_67:

    goto LABEL_68;
  }
  uint64_t v24 = 0;
LABEL_68:

LABEL_69:
  return v24;
}

double __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKey:a2];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

uint64_t __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_2(uint64_t result, double a2, double a3)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  *(double *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  return result;
}

BOOL __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  double v3 = [*(id *)(a1 + 32) objectForKey:a2];
  [v3 doubleValue];
  double v5 = v4;

  return v5 >= *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
             + *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) * 0.5;
}

BOOL __62__PGCurationManager_bestAssetForAssetFeeder_options_criteria___block_invoke_355(uint64_t a1, unint64_t a2)
{
  return (double)a2 / (double)*(unint64_t *)(a1 + 32) >= 0.5 || a2 > 0x1D;
}

- (id)bestAssetForAssetFeeder:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    uint64_t v8 = [v6 allItems];
    double v9 = [(PGCurationManager *)self bestAssetInAssets:v8 options:v7];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)_bestAssetInSummarizedAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 firstObject];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  double v9 = [v7 clsPersonAndPetLocalIdentifiers];
  uint64_t v10 = [v8 setWithArray:v9];

  uint64_t v11 = (void *)[v6 mutableCopy];
  [v11 intersectSet:v10];
  if ([v6 isSubsetOfSet:v10]) {
    goto LABEL_14;
  }
  v32 = v10;
  unint64_t v12 = [v11 count];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v34 = v7;
    id v31 = v5;
    char v33 = 0;
    uint64_t v16 = *(void *)v36;
    double v17 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        long long v19 = v11;
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v6, "mutableCopy", v31);

        int v21 = (void *)MEMORY[0x1E4F1CAD0];
        int v22 = [v20 clsPersonAndPetLocalIdentifiers];
        uint64_t v23 = [v21 setWithArray:v22];
        [v11 intersectSet:v23];

        unint64_t v24 = [v11 count];
        if (v24 > v12)
        {
          double v25 = (double)v24;
          [v20 clsContentScore];
          double v27 = v25 + v26 * 0.9;
          if (v27 > v17)
          {
            id v28 = v20;

            char v33 = 1;
            v34 = v28;
            double v17 = v27;
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v15);

    if (v33)
    {
      id v5 = v31;
      uint64_t v10 = v32;
      id v7 = v34;
LABEL_14:
      id v7 = v7;
      uint64_t v29 = v7;
      goto LABEL_17;
    }
    uint64_t v29 = 0;
    id v5 = v31;
    uint64_t v10 = v32;
    id v7 = v34;
  }
  else
  {

    uint64_t v29 = 0;
  }
LABEL_17:

  return v29;
}

- (id)_bestAssetsInAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4 minimumRatioOfReferencePersonsPerAsset:(double)a5 progressBlock:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  double v11 = 0.0;
  double v39 = (void (**)(void *, unsigned char *, double))_Block_copy(a6);
  if (v39)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v48 = 0;
      v39[2](v39, &v48, 0.0);
      if (v48)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v52 = 1984;
          __int16 v53 = 2080;
          v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curati"
                "on/PGCurationManager.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v13 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_46;
      }
      double v11 = Current;
    }
  }
  long long v37 = objc_opt_new();
  unint64_t v14 = [v10 count];
  unint64_t v15 = [v9 count];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v35 = v9;
  id obj = v9;
  uint64_t v16 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    unint64_t v18 = vcvtpd_u64_f64((double)v14 * 0.4);
    if (v18 <= 2) {
      unint64_t v18 = 2;
    }
    uint64_t v38 = *(void *)v45;
    double v19 = 0.0 / (double)v15;
    double v20 = (double)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(obj);
        }
        int v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (v39)
        {
          double v23 = CFAbsoluteTimeGetCurrent();
          if (v23 - v11 >= 0.01)
          {
            char v48 = 0;
            v39[2](v39, &v48, v19);
            if (v48)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v52 = 1995;
                __int16 v53 = 2080;
                v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Curation/PGCurationManager.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              id v13 = (id)MEMORY[0x1E4F1CBF0];
              id v9 = v35;
              char v33 = v37;
              goto LABEL_45;
            }
            double v11 = v23;
          }
        }
        unint64_t v24 = objc_msgSend(v22, "clsPersonAndPetLocalIdentifiers", v35);
        unint64_t v25 = [v24 count];
        if ((double)v25 * a5 <= v20) {
          double v26 = v20;
        }
        else {
          double v26 = (double)v25 * a5;
        }
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v27 = v24;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = 0;
          uint64_t v31 = *(void *)v41;
          while (2)
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v41 != v31) {
                objc_enumerationMutation(v27);
              }
              if ([v10 containsObject:*(void *)(*((void *)&v40 + 1) + 8 * j)])
              {
                if (++v30 >= (unint64_t)v26)
                {

                  [v37 addObject:v22];
                  goto LABEL_33;
                }
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v49 count:16];
            if (v29) {
              continue;
            }
            break;
          }
        }

LABEL_33:
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  char v33 = v37;
  if (v39 && CFAbsoluteTimeGetCurrent() - v11 >= 0.01 && (char v48 = 0, v39[2](v39, &v48, 1.0), v48))
  {
    id v9 = v35;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v52 = 2019;
      __int16 v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/P"
            "GCurationManager.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v13 = v37;
    id v9 = v35;
  }
LABEL_45:

LABEL_46:
  return v13;
}

- (id)bestAssetInAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4 requiredMinimumNumberOfReferencePersons:(unint64_t)a5 forMemories:(BOOL)a6 forSocialGroup:(BOOL)a7 allowGuestAsset:(BOOL)a8 wantsGoodSquareCropScore:(BOOL)a9
{
  BOOL v80 = a6;
  BOOL v81 = a8;
  BOOL v72 = a7;
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v70 = a4;
  v67 = v10;
  if (![v10 count])
  {
    v49 = 0;
    goto LABEL_58;
  }
  id v83 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id obj = v10;
  uint64_t v82 = [obj countByEnumeratingWithState:&v122 objects:v127 count:16];
  if (v82)
  {
    char v71 = 0;
    int v11 = 0;
    BOOL v78 = 0;
    uint64_t v79 = *(void *)v123;
    double v68 = *MEMORY[0x1E4F8E758];
    double v12 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v82; ++i)
      {
        if (*(void *)v123 != v79) {
          objc_enumerationMutation(obj);
        }
        unint64_t v14 = *(void **)(*((void *)&v122 + 1) + 8 * i);
        int v15 = [v14 clsAvoidIfPossibleAsKeyItemForMemories:v80 allowGuestAsset:v81];
        if ((!v72 | v15)) {
          LODWORD(v16) = v72 | v15;
        }
        else {
          unint64_t v16 = ((unint64_t)[v14 mediaSubtypes] >> 2) & 1;
        }
        uint64_t v17 = [v83 count];
        uint64_t v18 = v17;
        if (!((v17 == 0 || (v16 & 1) == 0) | v11 & 1)) {
          goto LABEL_21;
        }
        if (a9)
        {
          BOOL v19 = v17 != 0;
          [v14 clsSquareCropScore];
          BOOL v77 = v20 < v68;
          BOOL v21 = v20 < v68 && v19;
          if (!((v78 || !v21) | v11 & 1)) {
            goto LABEL_20;
          }
          BOOL v22 = v18 != 0;
          [v14 cropScoreForTargetAspectRatio:1 forFaces:0.75];
          double v24 = v23;
          [v14 cropScoreForTargetAspectRatio:1 forFaces:1.5];
          BOOL v25 = v24 < 0.475;
          if (v26 < 0.475) {
            BOOL v25 = 1;
          }
          BOOL v74 = v25;
          if (!(v71 & 1 | (!v25 || !v22) | (v78 | v11) & 1))
          {
            char v71 = 0;
LABEL_20:
            BOOL v78 = 0;
LABEL_21:
            int v11 = 0;
            continue;
          }
        }
        else
        {
          BOOL v77 = 0;
          BOOL v74 = 0;
        }
        id v27 = [v14 curationModel];
        uint64_t v28 = [v27 faceModel];
        uint64_t v29 = [v28 qualityNode];
        [v29 operatingPoint];
        uint64_t v31 = v30;

        [v27 faceSizeUpperLimit];
        uint64_t v33 = v32;
        [v27 faceSizeLowerLimit];
        double v35 = v34;
        uint64_t v117 = 0;
        uint64_t v118 = 0;
        v119 = &v118;
        uint64_t v120 = 0x2020000000;
        uint64_t v121 = 0;
        uint64_t v114 = 0;
        v115 = (double *)&v114;
        uint64_t v116 = 0x2020000000;
        uint64_t v110 = 0;
        v111 = (double *)&v110;
        uint64_t v112 = 0x2020000000;
        uint64_t v113 = 0;
        long long v36 = [v14 clsFaceInformationSummary];
        long long v37 = [v36 faceInformationByPersonLocalIdentifier];
        long long v76 = v36;
        id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v106 = 0;
        v107 = (double *)&v106;
        uint64_t v108 = 0x2020000000;
        uint64_t v109 = 0x7FEFFFFFFFFFFFFFLL;
        v96[0] = MEMORY[0x1E4F143A8];
        v96[1] = 3221225472;
        v96[2] = __182__PGCurationManager_bestAssetInAssets_forReferencePersonLocalIdentifiers_requiredMinimumNumberOfReferencePersons_forMemories_forSocialGroup_allowGuestAsset_wantsGoodSquareCropScore___block_invoke;
        v96[3] = &unk_1E68EA130;
        id v39 = v70;
        uint64_t v103 = v31;
        uint64_t v104 = v33;
        double v105 = v35;
        id v97 = v39;
        v99 = &v106;
        v100 = &v118;
        v101 = &v114;
        v102 = &v110;
        id v40 = v38;
        id v98 = v40;
        [v37 enumerateKeysAndObjectsUsingBlock:v96];
        double v41 = v107[3];
        double v42 = v41 * 0.5;
        if (v41 * 0.5 >= v35) {
          double v42 = v35;
        }
        if (v41 >= 1.79769313e308) {
          double v43 = 0.0;
        }
        else {
          double v43 = v42;
        }
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __182__PGCurationManager_bestAssetInAssets_forReferencePersonLocalIdentifiers_requiredMinimumNumberOfReferencePersons_forMemories_forSocialGroup_allowGuestAsset_wantsGoodSquareCropScore___block_invoke_2;
        v88[3] = &unk_1E68EA158;
        id v44 = v37;
        uint64_t v92 = v31;
        uint64_t v93 = v33;
        double v94 = v35;
        double v95 = v43;
        id v89 = v44;
        v90 = &v114;
        v91 = &v110;
        [v40 enumerateObjectsUsingBlock:v88];
        uint64_t v45 = [v39 count];
        unint64_t v46 = v119[3];
        double v47 = v115[3] + (double)(v45 - v46) * -0.25;
        v115[3] = v47;
        if (v46 >= a5)
        {
          if (((v16 | ~(_BYTE)v11) & ((v77 | ~v78) & (v74 | ~v71)) & 1) == 0) {
            double v12 = -1.79769313e308;
          }
          if (v47 >= v12)
          {
            if (v47 > v12)
            {
              [v83 removeAllObjects];
              [v75 removeAllObjects];
              char v71 = v74;
              BOOL v78 = v77;
              int v11 = v16;
              double v12 = v47;
            }
            [v83 addObject:v14];
            char v48 = [NSNumber numberWithDouble:v111[3]];
            [v75 addObject:v48];
          }
        }

        _Block_object_dispose(&v106, 8);
        _Block_object_dispose(&v110, 8);
        _Block_object_dispose(&v114, 8);
        _Block_object_dispose(&v118, 8);
      }
      uint64_t v82 = [obj countByEnumeratingWithState:&v122 objects:v127 count:16];
    }
    while (v82);
  }

  if ((unint64_t)[v83 count] <= 1)
  {
    v49 = [v83 firstObject];
    goto LABEL_57;
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v50 = v83;
  v49 = 0;
  uint64_t v51 = [v50 countByEnumeratingWithState:&v84 objects:v126 count:16];
  if (!v51) {
    goto LABEL_56;
  }
  int v52 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = *(void *)v85;
  double v55 = -1.79769313e308;
  double v56 = -1.79769313e308;
  do
  {
    for (uint64_t j = 0; j != v51; ++j)
    {
      if (*(void *)v85 != v54) {
        objc_enumerationMutation(v50);
      }
      v58 = *(void **)(*((void *)&v84 + 1) + 8 * j);
      int v59 = [v58 isFavorite];
      v60 = [v75 objectAtIndexedSubscript:v53 + j];
      [v60 doubleValue];
      double v62 = v61;

      [v58 overallAestheticScore];
      double v64 = v63;
      if ((v52 ^ v59))
      {
        if (v59) {
          goto LABEL_53;
        }
      }
      else if (v62 > v55 || v62 == v55 && v56 < v64)
      {
LABEL_53:
        id v65 = v58;

        v49 = v65;
        int v52 = v59;
        double v55 = v62;
        double v56 = v64;
        continue;
      }
    }
    uint64_t v51 = [v50 countByEnumeratingWithState:&v84 objects:v126 count:16];
    v53 += j;
  }
  while (v51);
LABEL_56:

LABEL_57:
LABEL_58:

  return v49;
}

void __182__PGCurationManager_bestAssetInAssets_forReferencePersonLocalIdentifiers_requiredMinimumNumberOfReferencePersons_forMemories_forSocialGroup_allowGuestAsset_wantsGoodSquareCropScore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v14])
  {
    double v6 = 1.0;
    if (([v5 faceIsGood] & 1) == 0)
    {
      if ([v5 faceIsOk]) {
        double v6 = 0.5;
      }
      else {
        double v6 = 0.25;
      }
    }
    [v5 faceSize];
    double v8 = v7;
    [v5 faceQuality];
    if (v9 == -1.0) {
      double v9 = *(double *)(a1 + 80);
    }
    if (v8 <= *(double *)(a1 + 88)) {
      double v10 = v8;
    }
    else {
      double v10 = *(double *)(a1 + 96);
    }
    double v11 = v9 * v10;
    if (v8 >= *(double *)(a1 + 96))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      double v13 = *(double *)(v12 + 24);
      if (v13 >= v8) {
        double v13 = v8;
      }
      *(double *)(v12 + 24) = v13;
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v6
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v11
                                                                + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24);
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v14];
  }
}

void __182__PGCurationManager_bestAssetInAssets_forReferencePersonLocalIdentifiers_requiredMinimumNumberOfReferencePersons_forMemories_forSocialGroup_allowGuestAsset_wantsGoodSquareCropScore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  [v14 faceSize];
  double v4 = v3;
  [v14 faceQuality];
  if (v5 == -1.0) {
    double v5 = *(double *)(a1 + 56);
  }
  double v6 = v4;
  if (v4 > *(double *)(a1 + 64)) {
    double v6 = *(double *)(a1 + 72);
  }
  double v7 = v5 * v6;
  int v8 = [v14 isKnownPerson];
  double v9 = *(double *)(a1 + 80);
  BOOL v10 = v4 < v9;
  BOOL v11 = v4 >= v9;
  double v12 = -0.05;
  if (!v10) {
    double v12 = -0.25;
  }
  double v13 = 0.25;
  if (v8)
  {
    double v13 = 0.5;
    double v12 = dbl_1D1F4F240[v11];
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7 * v13
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
}

- (id)bestAssetInAssets:(id)a3 forReferencePersonLocalIdentifiers:(id)a4 minimumNumberOfCommonPeople:(unint64_t)a5 forKeyAsset:(BOOL)a6 forMemories:(BOOL)a7 allowGuestAsset:(BOOL)a8
{
  BOOL v74 = a7;
  BOOL v75 = a8;
  BOOL v8 = a6;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v80 = a4;
  if (![v12 count])
  {
    double v13 = 0;
    goto LABEL_76;
  }
  v66 = self;
  unint64_t v67 = a5;
  if (v8) {
    BOOL v72 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  }
  else {
    BOOL v72 = 0;
  }
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v81 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v68 = v12;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v92;
    double v17 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v92 != v16) {
          objc_enumerationMutation(obj);
        }
        BOOL v19 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        BOOL v20 = v8;
        if (v8
          && ([*(id *)(*((void *)&v91 + 1) + 8 * i) clsAvoidIfPossibleAsKeyItemForMemories:v74 allowGuestAsset:v75] & 1) == 0)
        {
          [v72 addObject:v19];
        }
        BOOL v21 = (void *)MEMORY[0x1E4F1CAD0];
        BOOL v22 = [v19 clsPersonAndPetLocalIdentifiers];
        double v23 = [v21 setWithArray:v22];

        double v24 = (void *)[v80 mutableCopy];
        [v24 intersectSet:v23];
        unint64_t v25 = [v24 count];
        unint64_t v26 = [v80 count] - v25;
        double v27 = (double)v25 + (double)v26 * -0.25 + (double)([v23 count] - v25) * -0.1;
        if (v27 >= v17)
        {
          if (v27 > v17)
          {
            [v79 removeAllObjects];
            [v81 removeAllObjects];
            double v17 = v27;
          }
          [v79 addObject:v19];
          uint64_t v28 = [NSNumber numberWithUnsignedInteger:v25];
          [v81 addObject:v28];
        }
        BOOL v8 = v20;
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
    }
    while (v15);
  }

  uint64_t v29 = v79;
  if ([v79 count] == 1)
  {
    uint64_t v30 = [v81 firstObject];
    unint64_t v31 = [v30 unsignedIntegerValue];

    if (v31 >= v67)
    {
      double v13 = [v79 firstObject];
    }
    else
    {
      double v13 = 0;
    }
    id v12 = v68;
    goto LABEL_75;
  }
  BOOL v65 = v8;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v32 = v79;
  uint64_t v76 = [v32 countByEnumeratingWithState:&v87 objects:v96 count:16];
  if (!v76)
  {
    unint64_t v73 = 0;
    id v35 = 0;
    goto LABEL_60;
  }
  unint64_t v73 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  id v35 = 0;
  uint64_t v36 = *(void *)v88;
  unint64_t v37 = -1;
  double v38 = -1.79769313e308;
  double v39 = -1.79769313e308;
  uint64_t v69 = *(void *)v88;
  id v70 = v32;
  do
  {
    for (uint64_t j = 0; j != v76; ++j)
    {
      if (*(void *)v88 != v36) {
        objc_enumerationMutation(v32);
      }
      double v41 = *(void **)(*((void *)&v87 + 1) + 8 * j);
      [v41 clsContentScore];
      double v43 = v42;
      id v44 = [v41 clsFaceInformationSummary];
      if (!((v44 != 0) | v34 & 1))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Face information expected but not prefetched.", buf, 2u);
        }
        uint64_t v34 = 1;
      }
      unsigned int v45 = [v44 numberOfFacesIncludingPets];
      unsigned int v46 = v45;
      if (v37 <= v45)
      {
        if (v37 != v45) {
          goto LABEL_54;
        }
        unint64_t obja = v37;
        uint64_t v47 = v34;
        id v71 = v35;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        char v48 = [v44 faceInformationByPersonLocalIdentifier];
        v49 = [v48 allValues];

        uint64_t v50 = [v49 countByEnumeratingWithState:&v82 objects:v95 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v83;
          double v53 = 0.0;
          do
          {
            for (uint64_t k = 0; k != v51; ++k)
            {
              if (*(void *)v83 != v52) {
                objc_enumerationMutation(v49);
              }
              [*(id *)(*((void *)&v82 + 1) + 8 * k) faceSize];
              double v53 = v53 + v55;
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v82 objects:v95 count:16];
          }
          while (v51);
        }
        else
        {
          double v53 = 0.0;
        }

        double v56 = v53 / (double)v46;
        uint64_t v36 = v69;
        if (v39 >= 0.3 || v56 <= v39)
        {
          id v32 = v70;
          id v35 = v71;
          if (v39 < 0.3) {
            goto LABEL_53;
          }
          if (v56 < 0.3 || v43 <= v38) {
            goto LABEL_53;
          }
        }
        else
        {
          double v39 = v53 / (double)v46;
          id v32 = v70;
          id v35 = v71;
        }
      }
      else
      {
        uint64_t v47 = v34;
        unint64_t obja = v45;
      }
      id v58 = v41;

      int v59 = [v81 objectAtIndexedSubscript:v33];
      unint64_t v73 = [v59 unsignedIntegerValue];

      double v38 = v43;
      id v35 = v58;
LABEL_53:
      uint64_t v34 = v47;
      unint64_t v37 = obja;
LABEL_54:
      ++v33;
    }
    uint64_t v76 = [v32 countByEnumeratingWithState:&v87 objects:v96 count:16];
  }
  while (v76);
LABEL_60:

  if (v73 >= v67)
  {
    id v12 = v68;
    if (v65)
    {
      uint64_t v29 = v79;
      if ([v35 clsAvoidIfPossibleAsKeyItemForMemories:v74 allowGuestAsset:v75]
        && [v72 count])
      {
        v60 = [(PGCurationManager *)v66 curationLoggingConnection];
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v60, OS_LOG_TYPE_DEFAULT, "Curated key asset: key Asset is video. Trying to find non video key asset.", buf, 2u);
        }
        double v61 = [(PGCurationManager *)v66 bestAssetInAssets:v72 forReferencePersonLocalIdentifiers:v80 minimumNumberOfCommonPeople:v67 forKeyAsset:0 forMemories:v74 allowGuestAsset:v75];
        double v62 = v61;
        if (v61)
        {
          id v63 = v61;

          id v35 = v63;
        }
        else if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v60, OS_LOG_TYPE_DEFAULT, "Curated key asset: Didn't find any non video key asset.", buf, 2u);
        }
      }
    }
    else
    {
      uint64_t v29 = v79;
    }
    id v35 = v35;
    double v13 = v35;
  }
  else
  {
    double v13 = 0;
    id v12 = v68;
    uint64_t v29 = v79;
  }

LABEL_75:
LABEL_76:

  return v13;
}

- (id)bestAssetInAssets:(id)a3 options:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v7 referencePersonLocalIdentifiers];
  double v9 = v8;
  if (v8) {
    BOOL v10 = [v8 count] != 0;
  }
  else {
    BOOL v10 = 0;
  }
  uint64_t v11 = [v7 isForMemories];
  uint64_t v12 = [v7 allowGuestAsset];
  double v13 = (void *)MEMORY[0x1D25FED50]();
  if (!v10 || ![v7 focusOnPeople]) {
    goto LABEL_12;
  }
  uint64_t v14 = [(PGCurationManager *)self bestAssetInAssets:v6 forReferencePersonLocalIdentifiers:v9 minimumNumberOfCommonPeople:1 forKeyAsset:1 forMemories:v11 allowGuestAsset:v12];
  uint64_t v15 = [(PGCurationManager *)self curationLoggingConnection];
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (!v14)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Curated key asset: didn't find key asset with reference people and focus on people.", buf, 2u);
    }

LABEL_12:
    HIDWORD(v68) = v10;
    if ([v7 prefilterAssetsWithFaces])
    {
      id v17 = [(id)objc_opt_class() _filteredAssetsWithFaceFilter:1 forAssets:v6];
      double v18 = (double)(unint64_t)[v17 count];
      double v19 = v18 / (double)(unint64_t)[v6 count];
      [v7 prefilterAssetsWithFacesThreshold];
      double v21 = v20;
      BOOL v22 = [(PGCurationManager *)self curationLoggingConnection];
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (v19 >= v21)
      {
        if (v23)
        {
          id v53 = v7;
          uint64_t v54 = self;
          double v55 = v9;
          uint64_t v56 = [v17 count];
          uint64_t v57 = [v6 count];
          *(_DWORD *)buf = 134218240;
          uint64_t v80 = v56;
          double v9 = v55;
          self = v54;
          id v7 = v53;
          __int16 v81 = 2048;
          uint64_t v82 = v57;
          _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "Curated key asset: prefiltered assets with faces %ld/%ld.", buf, 0x16u);
        }

        LODWORD(v68) = 1;
        if (v17)
        {
LABEL_19:
          uint64_t v29 = v17;
          id v71 = v9;
          id v72 = v6;
          uint64_t v69 = v7;
          id v70 = v13;
          unint64_t v73 = v29;
          if ([v7 useSummarizer])
          {
            if ([v7 complete]) {
              uint64_t v30 = 4;
            }
            else {
              uint64_t v30 = 2;
            }
            unint64_t v31 = [(id)objc_opt_class() summaryClusteringForDuration:v30];
            id v32 = [v31 performWithItems:v29 identifiersOfEligibleItems:0 maximumNumberOfItemsToElect:1 progressBlock:0];
            uint64_t v33 = v29;
            if ([v32 count])
            {
              uint64_t v34 = [v32 firstObject];
              id v35 = [v34 cluster];
              uint64_t v33 = [v35 objects];
            }
            uint64_t v36 = [(PGCurationManager *)self curationLoggingConnection];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              uint64_t v37 = [v33 count];
              uint64_t v38 = [v29 count];
              *(_DWORD *)buf = 134218240;
              uint64_t v80 = v37;
              __int16 v81 = 2048;
              uint64_t v82 = v38;
              _os_log_impl(&dword_1D1805000, v36, OS_LOG_TYPE_INFO, "Curated key asset: summarizer elected %ld/%ld assets.", buf, 0x16u);
            }
            double v39 = self;
          }
          else
          {
            unint64_t v31 = [(PGCurationManager *)self curationLoggingConnection];
            double v39 = self;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              uint64_t v40 = [v29 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v80 = v40;
              _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "Curated key asset: not using summarizer. %ld assets remaining.", buf, 0xCu);
            }
            uint64_t v33 = v29;
          }

          double v41 = [MEMORY[0x1E4F1CA48] array];
          double v42 = [MEMORY[0x1E4F1CA48] array];
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v43 = v33;
          uint64_t v44 = [v43 countByEnumeratingWithState:&v74 objects:v78 count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v46 = *(void *)v75;
            do
            {
              for (uint64_t i = 0; i != v45; ++i)
              {
                if (*(void *)v75 != v46) {
                  objc_enumerationMutation(v43);
                }
                char v48 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                if (objc_msgSend(v48, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", v11, v12, v68))v49 = v42; {
                else
                }
                  v49 = v41;
                [v49 addObject:v48];
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v74 objects:v78 count:16];
            }
            while (v45);
          }

          double v9 = v71;
          uint64_t v50 = v39;
          id v7 = v69;
          if (HIDWORD(v68))
          {
            uint64_t v51 = [(PGCurationManager *)v50 _bestAssetInSummarizedAssets:v41 forReferencePersonLocalIdentifiers:v71];
            if (v51)
            {
              uint64_t v14 = (void *)v51;
              uint64_t v52 = [(PGCurationManager *)v50 curationLoggingConnection];
              id v6 = v72;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1805000, v52, OS_LOG_TYPE_INFO, "Curated key asset: found key asset with reference people in non video assets.", buf, 2u);
              }

LABEL_69:
              double v13 = v70;
              uint64_t v15 = v73;
              goto LABEL_70;
            }
            uint64_t v14 = [(PGCurationManager *)v50 _bestAssetInSummarizedAssets:v42 forReferencePersonLocalIdentifiers:v71];
            id v58 = [(PGCurationManager *)v50 curationLoggingConnection];
            BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_INFO);
            id v6 = v72;
            if (v14)
            {
              if (v59)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1805000, v58, OS_LOG_TYPE_INFO, "Curated key asset: found key asset with reference people in video assets.", buf, 2u);
              }

              goto LABEL_69;
            }
            if (v59)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1805000, v58, OS_LOG_TYPE_INFO, "Curated key asset: didn't find common people. fallback to basic curation.", buf, 2u);
            }
          }
          v60 = [(id)objc_opt_class() assetsBeautifier];
          double v61 = [v60 performWithItems:v41 maximumNumberOfItemsToChoose:1 progressBlock:0];
          uint64_t v62 = [v61 count];
          id v63 = [(PGCurationManager *)v50 curationLoggingConnection];
          BOOL v64 = os_log_type_enabled(v63, OS_LOG_TYPE_INFO);
          if (v62)
          {
            if (v64)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1805000, v63, OS_LOG_TYPE_INFO, "Curated key asset: found key asset in non video assets.", buf, 2u);
            }
          }
          else
          {
            if (v64)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1805000, v63, OS_LOG_TYPE_INFO, "Curated key asset: didn't find key asset w/o videos. Trying to find asset in video assets.", buf, 2u);
            }

            [v60 performWithItems:v42 maximumNumberOfItemsToChoose:1 progressBlock:0];
            double v61 = v63 = v61;
          }
          id v6 = v72;

          uint64_t v14 = [v61 firstObject];

          char v65 = v68 ^ 1;
          if (v14) {
            char v65 = 1;
          }
          if ((v65 & 1) == 0)
          {
            v66 = [(PGCurationManager *)v50 curationLoggingConnection];
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1805000, v66, OS_LOG_TYPE_INFO, "Curated key asset: no key asset found when using pre-filtering. Trying again w/o prefiltering.", buf, 2u);
            }

            [v69 setPrefilterAssetsWithFaces:0];
            uint64_t v14 = [(PGCurationManager *)v50 bestAssetInAssets:v72 options:v69];
          }
          goto LABEL_69;
        }
LABEL_18:
        id v17 = v6;
        goto LABEL_19;
      }
      if (v23)
      {
        id v24 = v7;
        unint64_t v25 = self;
        unint64_t v26 = v9;
        uint64_t v27 = [v17 count];
        uint64_t v28 = [v6 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v80 = v27;
        double v9 = v26;
        self = v25;
        id v7 = v24;
        __int16 v81 = 2048;
        uint64_t v82 = v28;
        _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "Curated key asset: not using prefiltered assets with faces (%ld/%ld).", buf, 0x16u);
      }
    }
    LODWORD(v68) = 0;
    goto LABEL_18;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Curated key asset: found key asset with reference people and focus on people.", buf, 2u);
  }
LABEL_70:

  return v14;
}

- (double)contentScoreForAssetFeeder:(id)a3
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x1D25FED50]();
  double v5 = objc_opt_class();
  id v6 = [v3 allItems];
  [v5 contentScoreForAssets:v6];
  double v8 = v7;

  return v8;
}

- (BOOL)isAssetFeederInteresting:(id)a3 withAlternateJunking:(BOOL)a4 smart:(BOOL)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = [v7 assetCollection];
  if ([v7 numberOfItems])
  {
    double v9 = [v7 allItems];
    BOOL v10 = v9;
    if (!a5)
    {
      unint64_t v17 = +[PGUserDefaults minimumNumberOfCuratedAssetsForInterestingMoments];
      if (v17) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 4;
      }
      char v16 = [(id)objc_opt_class() areAssetsInteresting:v10 minimumNumberOfCuratedAssets:v18 duration:2];
      goto LABEL_13;
    }
    unint64_t v11 = [v9 count];
    [MEMORY[0x1E4F76DA8] maximumScoreForItems:v10];
    double v13 = v12;
    [(PGCurationManager *)self contentScoreForAssetFeeder:v7];
    double v15 = v14;
    if (v14 < (*MEMORY[0x1E4F8E750] + *MEMORY[0x1E4F8E740]) * 0.5) {
      goto LABEL_4;
    }
    if (v13 > *MEMORY[0x1E4F8E738] || ([v7 hasBestScoringAssets] & 1) != 0)
    {
LABEL_12:
      char v16 = 1;
      goto LABEL_13;
    }
    if (v11 >= 5)
    {
      if (v11 > 0x40) {
        goto LABEL_12;
      }
      double v20 = objc_msgSend(v8, "cls_universalEndDate");
      double v21 = objc_msgSend(v8, "cls_universalStartDate");
      [v20 timeIntervalSinceDate:v21];
      double v23 = v22;

      if (v23 >= 60.0)
      {
        if (v11 > 6 || [v7 hasPeople])
        {
          unint64_t v53 = v11;
          unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:&__block_literal_global_335_41408];
          [v25 setMaximumDistance:1800.0];
          [v25 setMinimumNumberOfObjects:1];
          uint64_t v54 = v25;
          [v25 performWithDataset:v10 progressBlock:0];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v57 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
          if (v57)
          {
            uint64_t v56 = *(void *)v65;
            while (2)
            {
              for (uint64_t i = 0; i != v57; ++i)
              {
                if (*(void *)v65 != v56) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v27 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                context = (void *)MEMORY[0x1D25FED50]();
                uint64_t v28 = [v27 objects];
                uint64_t v29 = [v28 firstObject];

                uint64_t v30 = [v29 creationDate];
                [v30 timeIntervalSince1970];
                double v32 = v31;

                id v58 = v29;
                uint64_t v33 = [v29 creationDate];
                [v33 timeIntervalSince1970];
                double v35 = v34;

                long long v62 = 0u;
                long long v63 = 0u;
                long long v60 = 0u;
                long long v61 = 0u;
                uint64_t v36 = [v27 objects];
                uint64_t v37 = [v36 countByEnumeratingWithState:&v60 objects:v74 count:16];
                if (v37)
                {
                  uint64_t v38 = v37;
                  uint64_t v39 = *(void *)v61;
                  do
                  {
                    for (uint64_t j = 0; j != v38; ++j)
                    {
                      if (*(void *)v61 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      double v41 = [*(id *)(*((void *)&v60 + 1) + 8 * j) creationDate];
                      [v41 timeIntervalSince1970];
                      double v43 = v42;

                      if (v43 < v32) {
                        double v32 = v43;
                      }
                      if (v43 > v35) {
                        double v35 = v43;
                      }
                    }
                    uint64_t v38 = [v36 countByEnumeratingWithState:&v60 objects:v74 count:16];
                  }
                  while (v38);
                }

                if (v35 - v32 >= 0.0) {
                  double v44 = v35 - v32;
                }
                else {
                  double v44 = -(v35 - v32);
                }

                if (v44 >= 60.0)
                {

                  if (v15 <= *MEMORY[0x1E4F8E748])
                  {
                    unint64_t v47 = 4;
                  }
                  else if ([v7 hasPeople])
                  {
                    unint64_t v47 = 2;
                  }
                  else
                  {
                    unint64_t v47 = 4;
                  }
                  uint64_t v46 = v54;
                  uint64_t v45 = [(id)objc_opt_class() assetsBeautifier];
                  unint64_t v48 = [(id)objc_opt_class() maximumNumberOfItemsForDuration:2 withTotalNumberOfItems:v53];
                  if (v48 >= v53) {
                    unint64_t v49 = v53;
                  }
                  else {
                    unint64_t v49 = v48;
                  }
                  uint64_t v50 = [v45 performWithItems:v10 maximumNumberOfItemsToChoose:v49 progressBlock:0];
                  if ([v50 count] >= v47
                    && (double)v49 * 0.3 <= (double)(unint64_t)[v50 count])
                  {
                    char v16 = 1;
                  }
                  else
                  {
                    uint64_t v51 = [(PGCurationManager *)self curationLoggingConnection];
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v52 = [v50 count];
                      *(_DWORD *)buf = 134218498;
                      uint64_t v69 = v52;
                      __int16 v70 = 2048;
                      unint64_t v71 = v49;
                      __int16 v72 = 2112;
                      unint64_t v73 = v8;
                      _os_log_debug_impl(&dword_1D1805000, v51, OS_LOG_TYPE_DEBUG, "AssetCollection is not interesting: \"Not enough best assets from beautifier (%ld/%ld) for assetCollection %@\"", buf, 0x20u);
                    }

                    char v16 = 0;
                  }

                  goto LABEL_63;
                }
              }
              uint64_t v57 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
              if (v57) {
                continue;
              }
              break;
            }
          }

          uint64_t v45 = [(PGCurationManager *)self curationLoggingConnection];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v69 = (uint64_t)v8;
            _os_log_debug_impl(&dword_1D1805000, v45, OS_LOG_TYPE_DEBUG, "AssetCollection is not interesting: \"%@ sub-segments are too short\"", buf, 0xCu);
          }
          char v16 = 0;
          uint64_t v46 = v54;
LABEL_63:

          goto LABEL_13;
        }
      }
      else
      {
        id v24 = [(PGCurationManager *)self curationLoggingConnection];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v69 = (uint64_t)v8;
          _os_log_debug_impl(&dword_1D1805000, v24, OS_LOG_TYPE_DEBUG, "AssetCollection is not interesting: \"%@ is too short\"", buf, 0xCu);
        }
      }
    }
LABEL_4:
    char v16 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v16 = 0;
LABEL_14:

  return v16;
}

double __73__PGCurationManager_isAssetFeederInteresting_withAlternateJunking_smart___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = objc_msgSend(a2, "cls_universalDate");
  id v6 = objc_msgSend(v4, "cls_universalDate");

  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  return v8;
}

- (void)invalidateDiskCaches
{
}

- (void)invalidateMemoryCaches
{
}

- (void)invalidateCurationCacheForMomentUUIDs:(id)a3
{
  cache = self->_cache;
  id v4 = [a3 allObjects];
  [(PGCurationCache *)cache invalidateCacheForMomentUUIDs:v4];
}

- (unint64_t)optimalDurationForAssetCollection:(id)a3 duration:(unint64_t)a4 options:(id)a5 curationContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 assetCollectionType];
  if (v13 == 1) {
    goto LABEL_12;
  }
  uint64_t v14 = v13;
  if (v13 == 2 && [v10 assetCollectionSubtype] != 200) {
    goto LABEL_12;
  }
  if (v11)
  {
    double v15 = [v11 objectForKeyedSubscript:@"PHPhotosGraphOptionIsCompleteMoments"];
    char v16 = v15;
    if (v15 && ([v15 BOOLValue] & 1) == 0)
    {

LABEL_12:
      unint64_t v18 = 5;
      if (a4 != 3) {
        unint64_t v18 = a4;
      }
      if (a4 == 2) {
        a4 = 4;
      }
      else {
        a4 = v18;
      }
      goto LABEL_17;
    }
  }
  else
  {
    char v16 = 0;
  }
  if (v14 != 3 && (unint64_t)[v10 estimatedAssetCount] > 0x64)
  {

    goto LABEL_17;
  }
  BOOL v17 = [(PGCurationManager *)self isAssetCollectionInteresting:v10 curationContext:v12];

  if (!v17) {
    goto LABEL_12;
  }
LABEL_17:

  return a4;
}

- (id)memoryCuratedAssetsForAssets:(id)a3 duration:(unint64_t)a4 withContextualAssetLocalIdentifiers:(id)a5 minimumProportion:(double)a6 graph:(id)a7 curationContext:(id)a8 progressBlock:(id)a9
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v108 = v16;
  uint64_t v104 = v18;
  double v105 = v19;
  uint64_t v106 = v20;
  if (![v16 count])
  {
    id v23 = 0;
    goto LABEL_111;
  }
  uint64_t v152 = 0;
  v153 = &v152;
  uint64_t v154 = 0x2020000000;
  char v155 = 0;
  uint64_t v148 = 0;
  v149 = (double *)&v148;
  uint64_t v150 = 0x2020000000;
  uint64_t v151 = 0;
  uint64_t v117 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v20);
  if (v117)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v149[3] >= 0.01)
    {
      v149[3] = Current;
      LOBYTE(info.numer) = 0;
      v117[2](v117, &info, 0.0);
      char v22 = *((unsigned char *)v153 + 24) | LOBYTE(info.numer);
      *((unsigned char *)v153 + 24) = v22;
      if (v22)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v157 = 627;
          *(_WORD *)&v157[4] = 2080;
          *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v23 = 0;
        goto LABEL_110;
      }
    }
  }
  id v24 = [(PGCurationManager *)self curationLoggingConnection];
  os_signpost_id_t v25 = os_signpost_id_generate(v24);
  unint64_t v26 = v24;
  uint64_t v27 = v26;
  unint64_t v96 = v25 - 1;
  os_signpost_id_t spid = v25;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "CuratedAssets", "", buf, 2u);
  }
  v101 = v27;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v28 = mach_absolute_time();
  uint64_t v103 = [v16 fetchedObjects];
  if (v117)
  {
    double v29 = CFAbsoluteTimeGetCurrent();
    if (v29 - v149[3] >= 0.01)
    {
      v149[3] = v29;
      char v146 = 0;
      v117[2](v117, (mach_timebase_info *)&v146, 0.5);
      char v30 = *((unsigned char *)v153 + 24) | v146;
      *((unsigned char *)v153 + 24) = v30;
      if (v30)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v157 = 632;
          *(_WORD *)&v157[4] = 2080;
          *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v23 = 0;
        goto LABEL_109;
      }
    }
  }
  uint64_t v94 = v28;
  unint64_t v31 = +[PGCurationManager maximumNumberOfItemsForDuration:withTotalNumberOfItems:](PGCurationManager, "maximumNumberOfItemsForDuration:withTotalNumberOfItems:", a4, [v103 count]);
  unint64_t v95 = +[PGCurationManager minimumNumberOfItemsForDuration:a4 withMaximumNumberOfItems:v31];
  unint64_t v99 = v31;
  v102 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v31];
  v107 = +[PGCurationManager assetsBeautifier];
  double v32 = (void *)[objc_alloc(MEMORY[0x1E4F8A8C8]) initWithNumericValueKeypaths:&unk_1F28D44A0];
  [v32 setK:v99];
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke;
  v141[3] = &unk_1E68F03F8;
  v111 = v117;
  v142 = v111;
  v143 = &v148;
  uint64_t v145 = 0x3F847AE147AE147BLL;
  v144 = &v152;
  uint64_t v98 = v32;
  v100 = [v32 performWithDataset:v103 progressBlock:v141];
  if (*((unsigned char *)v153 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v157 = 647;
      *(_WORD *)&v157[4] = 2080;
      *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Curation/PGCurationManager.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v23 = 0;
    goto LABEL_108;
  }
  uint64_t v113 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v112 = [MEMORY[0x1E4F1CA48] array];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id obj = v100;
  uint64_t v116 = [obj countByEnumeratingWithState:&v137 objects:v161 count:16];
  if (v116)
  {
    uint64_t v114 = *(void *)v138;
    double v33 = *MEMORY[0x1E4F8E750];
    do
    {
      for (uint64_t i = 0; i != v116; ++i)
      {
        if (*(void *)v138 != v114) {
          objc_enumerationMutation(obj);
        }
        double v34 = *(void **)(*((void *)&v137 + 1) + 8 * i);
        if (v117)
        {
          double v35 = CFAbsoluteTimeGetCurrent();
          if (v35 - v149[3] >= 0.01)
          {
            v149[3] = v35;
            char v146 = 0;
            v111[2](v111, (mach_timebase_info *)&v146, 0.5);
            char v36 = *((unsigned char *)v153 + 24) | v146;
            *((unsigned char *)v153 + 24) = v36;
            if (v36)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v157 = 653;
                *(_WORD *)&v157[4] = 2080;
                *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Curation/PGCurationManager.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_54;
            }
          }
        }
        uint64_t v37 = [v34 objects];
        uint64_t v38 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v37, "count"));
        uint64_t v39 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v37, "count"));
        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        id v40 = v37;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v133 objects:v160 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v134;
          do
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(void *)v134 != v42) {
                objc_enumerationMutation(v40);
              }
              double v44 = *(void **)(*((void *)&v133 + 1) + 8 * j);
              [v44 clsContentScore];
              if (v45 > v33)
              {
                uint64_t v46 = [v44 localIdentifier];
                int v47 = [v17 containsObject:v46];

                if (v47) {
                  unint64_t v48 = v38;
                }
                else {
                  unint64_t v48 = v39;
                }
                [v48 addObject:v44];
              }
            }
            uint64_t v41 = [v40 countByEnumeratingWithState:&v133 objects:v160 count:16];
          }
          while (v41);
        }

        if ([v38 count])
        {
          [v112 addObject:v38];
          [v113 addObject:v39];
        }
      }
      uint64_t v116 = [obj countByEnumeratingWithState:&v137 objects:v161 count:16];
    }
    while (v116);
  }

  if (v117)
  {
    double v49 = CFAbsoluteTimeGetCurrent();
    if (v49 - v149[3] >= 0.01)
    {
      v149[3] = v49;
      char v146 = 0;
      v111[2](v111, (mach_timebase_info *)&v146, 0.5);
      char v50 = *((unsigned char *)v153 + 24) | v146;
      *((unsigned char *)v153 + 24) = v50;
      if (v50)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v157 = 684;
          *(_WORD *)&v157[4] = 2080;
          *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_54:
        id v23 = 0;
        goto LABEL_107;
      }
    }
  }
  [v113 sortUsingComparator:&__block_literal_global_322];
  v115 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v51 = 0;
  unint64_t v52 = 0;
  unint64_t v93 = 0;
  while (1)
  {
    unint64_t v92 = v52;
    if ([v102 count] >= v95) {
      break;
    }
    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id obja = v112;
    uint64_t v53 = [obja countByEnumeratingWithState:&v129 objects:v159 count:16];
    unint64_t v54 = v93;
    if (!v53) {
      goto LABEL_72;
    }
    unint64_t v54 = v93;
    unint64_t v55 = v99 - v52;
    uint64_t v56 = *(void *)v130;
    while (2)
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v130 != v56) {
          objc_enumerationMutation(obja);
        }
        id v58 = *(void **)(*((void *)&v129 + 1) + 8 * k);
        if (v117)
        {
          double v59 = CFAbsoluteTimeGetCurrent();
          if (v59 - v149[3] >= 0.01)
          {
            v149[3] = v59;
            char v146 = 0;
            v111[2](v111, (mach_timebase_info *)&v146, 0.5);
            char v60 = *((unsigned char *)v153 + 24) | v146;
            *((unsigned char *)v153 + 24) = v60;
            if (v60)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v157 = 704;
                *(_WORD *)&v157[4] = 2080;
                *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Curation/PGCurationManager.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_104;
            }
          }
        }
        v124[0] = MEMORY[0x1E4F143A8];
        v124[1] = 3221225472;
        v124[2] = __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke_323;
        v124[3] = &unk_1E68F03F8;
        long long v125 = v111;
        v126 = &v148;
        uint64_t v128 = 0x3F847AE147AE147BLL;
        v127 = &v152;
        long long v61 = [v107 performWithItems:v58 maximumNumberOfItemsToChoose:1 progressBlock:v124];
        long long v62 = v61;
        if (*((unsigned char *)v153 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v157 = 710;
            *(_WORD *)&v157[4] = 2080;
            *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurationManager.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

LABEL_104:
          id v23 = 0;
          goto LABEL_105;
        }
        long long v63 = [v61 firstObject];
        if (v63)
        {
          [v102 addObject:v63];
          [v58 removeObject:v63];
          ++v54;
        }
        else
        {
          [v115 addObject:v58];
        }

        if (v54 >= v55) {
          goto LABEL_72;
        }
      }
      uint64_t v53 = [obja countByEnumeratingWithState:&v129 objects:v159 count:16];
      if (v53) {
        continue;
      }
      break;
    }
LABEL_72:

    [obja removeObjectsInArray:v115];
    [v115 removeAllObjects];
    unint64_t v64 = vcvtmd_u64_f64((double)v54 / a6 - (double)v54);
    if (v99 - v54 >= v64) {
      unint64_t v65 = v64;
    }
    else {
      unint64_t v65 = v99 - v54;
    }
    unint64_t v66 = [v113 count];
    unint64_t v52 = v92;
    while (v51 < v66 && v52 < v65)
    {
      long long v67 = [v113 objectAtIndexedSubscript:v51];
      v119[0] = MEMORY[0x1E4F143A8];
      v119[1] = 3221225472;
      v119[2] = __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke_324;
      v119[3] = &unk_1E68F03F8;
      uint64_t v120 = v111;
      uint64_t v121 = &v148;
      uint64_t v123 = 0x3F847AE147AE147BLL;
      long long v122 = &v152;
      uint64_t v68 = [v107 performWithItems:v67 maximumNumberOfItemsToChoose:1 progressBlock:v119];
      uint64_t v69 = [v68 firstObject];

      int v70 = *((unsigned __int8 *)v153 + 24);
      if (*((unsigned char *)v153 + 24))
      {
        unint64_t v71 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v157 = 744;
          *(_WORD *)&v157[4] = 2080;
          *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager.m";
          _os_log_impl(&dword_1D1805000, v71, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        if (v69)
        {
          [v102 addObject:v69];
          [v67 removeObject:v69];
          ++v52;
        }
        else
        {
          [v115 addObject:v67];
        }
        ++v51;
      }

      if (v70) {
        goto LABEL_104;
      }
    }
    if (v51 >= v66) {
      unint64_t v51 = 0;
    }
    [v113 removeObjectsInArray:v115];
    [v115 removeAllObjects];
    BOOL v72 = v54 == v93;
    unint64_t v93 = v54;
    if (v72)
    {
      unint64_t v93 = v54;
      if (v52 == v92) {
        break;
      }
    }
  }
  if (v117
    && (double v73 = CFAbsoluteTimeGetCurrent(), v73 - v149[3] >= 0.01)
    && (v149[3] = v73,
        char v146 = 0,
        v111[2](v111, (mach_timebase_info *)&v146, 0.5),
        char v74 = *((unsigned char *)v153 + 24) | v146,
        *((unsigned char *)v153 + 24) = v74,
        long long v75 = v115,
        v74))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v157 = 772;
      *(_WORD *)&v157[4] = 2080;
      *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Curation/PGCurationManager.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v23 = 0;
  }
  else
  {
    long long v77 = [v107 deduplicateItems:v102 debugInfo:0];
    BOOL v78 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v158 = v78;
    id v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v158 count:1];
    uint64_t v80 = [v77 sortedArrayUsingDescriptors:v79];

    uint64_t v81 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    long long v84 = v101;
    long long v85 = v84;
    if (v96 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v85, OS_SIGNPOST_INTERVAL_END, spid, "CuratedAssets", "", buf, 2u);
    }

    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v157 = "CuratedAssets";
      *(_WORD *)&v157[8] = 2048;
      *(double *)&v157[10] = (float)((float)((float)((float)(v81 - v94) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v85, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    id v86 = objc_alloc(MEMORY[0x1E4F39150]);
    long long v87 = [v108 photoLibrary];
    long long v88 = [v108 fetchPropertySets];
    long long v89 = (void *)[v86 initWithObjects:v80 photoLibrary:v87 fetchType:0 fetchPropertySets:v88 identifier:0 registerIfNeeded:0];

    if (v117
      && (double v90 = CFAbsoluteTimeGetCurrent(), v90 - v149[3] >= 0.01)
      && (v149[3] = v90,
          char v146 = 0,
          v111[2](v111, (mach_timebase_info *)&v146, 1.0),
          char v91 = *((unsigned char *)v153 + 24) | v146,
          (*((unsigned char *)v153 + 24) = v91) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v157 = 779;
        *(_WORD *)&v157[4] = 2080;
        *(void *)&v157[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGCurationManager.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v23 = 0;
    }
    else
    {
      id v23 = v89;
    }

LABEL_105:
    long long v75 = v115;
  }

LABEL_107:
LABEL_108:

LABEL_109:
LABEL_110:
  _Block_object_dispose(&v148, 8);
  _Block_object_dispose(&v152, 8);

LABEL_111:
  return v23;
}

void __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke_323(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke_324(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

uint64_t __149__PGCurationManager_memoryCuratedAssetsForAssets_duration_withContextualAssetLocalIdentifiers_minimumProportion_graph_curationContext_progressBlock___block_invoke_319(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 count];
  unint64_t v6 = [v4 count];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v6 > v5;
  }
}

- (id)memoryCuratedAssetsForAssetCollection:(id)a3 duration:(unint64_t)a4 withContextualAssetLocalIdentifiers:(id)a5 minimumProportion:(double)a6 graph:(id)a7 curationContext:(id)a8 progressBlock:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = a3;
  double v21 = [(PGCurationManager *)self defaultAssetFetchOptions];
  char v22 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:2];
  id v23 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v20 options:v21 feederPrefetchOptions:v22 curationContext:v17];

  id v24 = [v23 assetFetchResult];
  os_signpost_id_t v25 = [(PGCurationManager *)self memoryCuratedAssetsForAssets:v24 duration:a4 withContextualAssetLocalIdentifiers:v19 minimumProportion:v18 graph:v17 curationContext:v16 progressBlock:a6];

  return v25;
}

- (id)curatedAssetsForAssetCollection:(id)a3 duration:(unint64_t)a4 referencePersonLocalIdentifiers:(id)a5 curationContext:(id)a6 progressBlock:(id)a7
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v61 = a5;
  id v63 = a6;
  id v12 = a7;
  uint64_t v13 = (void (**)(void *, unsigned char *, double))_Block_copy(v12);
  uint64_t v89 = 0;
  double v90 = &v89;
  uint64_t v91 = 0x2020000000;
  char v92 = 0;
  uint64_t v85 = 0;
  id v86 = (double *)&v85;
  uint64_t v87 = 0x2020000000;
  uint64_t v88 = 0;
  id v58 = v12;
  if (!v13
    || (double v14 = CFAbsoluteTimeGetCurrent(), v14 - v86[3] < 0.01)
    || (v86[3] = v14,
        LOBYTE(info.numer) = 0,
        ((void (**)(void *, mach_timebase_info *, double))v13)[2](v13, &info, 0.0),
        char v15 = *((unsigned char *)v90 + 24) | LOBYTE(info.numer),
        (*((unsigned char *)v90 + 24) = v15) == 0))
  {
    id v17 = [(PGCurationManager *)self curationLoggingConnection];
    os_signpost_id_t v18 = os_signpost_id_generate(v17);
    id v19 = v17;
    id v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "CuratedAssetsForPeople", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v56 = mach_absolute_time();
    char v60 = [(PGCurationManager *)self defaultAssetFetchOptions];
    double v21 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:1];
    [v21 setPersonsPrefetchMode:2];
    [v21 setFaceInformationPrefetchMode:2];
    double v59 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v62 options:v60 feederPrefetchOptions:v21 curationContext:v63];
    if (v13)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v86[3] >= 0.01)
      {
        v86[3] = Current;
        char v83 = 0;
        v13[2](v13, &v83, 0.5);
        char v23 = *((unsigned char *)v90 + 24) | v83;
        *((unsigned char *)v90 + 24) = v23;
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)uint64_t v94 = 550;
            *(_WORD *)&v94[4] = 2080;
            *(void *)&v94[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Curation/PGCurationManager.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = 0;
          goto LABEL_48;
        }
      }
    }
    id v24 = [v59 allItems];
    if (v13)
    {
      double v25 = CFAbsoluteTimeGetCurrent();
      if (v25 - v86[3] >= 0.01)
      {
        v86[3] = v25;
        char v83 = 0;
        v13[2](v13, &v83, 0.5);
        char v26 = *((unsigned char *)v90 + 24) | v83;
        *((unsigned char *)v90 + 24) = v26;
        if (v26)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)uint64_t v94 = 554;
            *(_WORD *)&v94[4] = 2080;
            *(void *)&v94[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Curation/PGCurationManager.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = 0;
          goto LABEL_47;
        }
      }
    }
    uint64_t v27 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfItemsForDuration:withTotalNumberOfItems:", a4, objc_msgSend(v24, "count"));
    unint64_t v28 = [(id)objc_opt_class() minimumNumberOfItemsForDuration:a4 withMaximumNumberOfItems:v27];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke;
    v78[3] = &unk_1E68F03F8;
    double v29 = v13;
    id v79 = v29;
    uint64_t v80 = &v85;
    uint64_t v81 = &v89;
    uint64_t v82 = 0x3F847AE147AE147BLL;
    uint64_t v57 = [(PGCurationManager *)self _bestAssetsInAssets:v24 forReferencePersonLocalIdentifiers:v61 minimumRatioOfReferencePersonsPerAsset:v78 progressBlock:0.0];
    if (*((unsigned char *)v90 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)uint64_t v94 = 563;
        *(_WORD *)&v94[4] = 2080;
        *(void *)&v94[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Curation/PGCurationManager.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v16 = 0;
      goto LABEL_46;
    }
    char v30 = [(id)objc_opt_class() assetsBeautifier];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke_308;
    v73[3] = &unk_1E68F03F8;
    unint64_t v55 = v29;
    id v74 = v55;
    long long v75 = &v85;
    uint64_t v76 = &v89;
    uint64_t v77 = 0x3F847AE147AE147BLL;
    unint64_t v31 = [v30 performWithItems:v57 maximumNumberOfItemsToChoose:v27 progressBlock:v73];
    id v32 = v31;
    double v33 = v30;
    if (*((unsigned char *)v90 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)uint64_t v94 = 571;
        *(_WORD *)&v94[4] = 2080;
        *(void *)&v94[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Curation/PGCurationManager.m";
        double v34 = MEMORY[0x1E4F14500];
LABEL_29:
        _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if ([v31 count] >= v28) {
        goto LABEL_71;
      }
      double v35 = [MEMORY[0x1E4F1CA80] setWithArray:v32];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke_310;
      v68[3] = &unk_1E68F03F8;
      uint64_t v69 = v55;
      int v70 = &v85;
      unint64_t v71 = &v89;
      uint64_t v72 = 0x3F847AE147AE147BLL;
      uint64_t v53 = [v33 performWithItems:v24 maximumNumberOfItemsToChoose:v28 progressBlock:v68];
      int v52 = *((unsigned __int8 *)v90 + 24);
      if (*((unsigned char *)v90 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v94 = 582;
          *(_WORD *)&v94[4] = 2080;
          *(void *)&v94[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/PGCurationManager.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        char v50 = v32;
        unint64_t v51 = v33;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id obj = v53;
        uint64_t v36 = [obj countByEnumeratingWithState:&v64 objects:v95 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v65;
LABEL_36:
          uint64_t v38 = 0;
          while (1)
          {
            if (*(void *)v65 != v37) {
              objc_enumerationMutation(obj);
            }
            [v35 addObject:*(void *)(*((void *)&v64 + 1) + 8 * v38)];
            if ([v35 count] >= v28) {
              break;
            }
            if (v36 == ++v38)
            {
              uint64_t v36 = [obj countByEnumeratingWithState:&v64 objects:v95 count:16];
              if (v36) {
                goto LABEL_36;
              }
              break;
            }
          }
        }

        double v33 = v51;
        id v32 = [v35 allObjects];
      }
      if (!v52)
      {
LABEL_71:
        if (!v13
          || (double v40 = CFAbsoluteTimeGetCurrent(), v40 - v86[3] < 0.01)
          || (v86[3] = v40,
              char v83 = 0,
              v55[2](v55, &v83, 0.5),
              char v41 = *((unsigned char *)v90 + 24) | v83,
              (*((unsigned char *)v90 + 24) = v41) == 0))
        {
          uint64_t v42 = [v32 sortedArrayUsingComparator:&__block_literal_global_41454];

          uint64_t v43 = mach_absolute_time();
          uint32_t numer = info.numer;
          uint32_t denom = info.denom;
          uint64_t v46 = v20;
          int v47 = v46;
          if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v47, OS_SIGNPOST_INTERVAL_END, v18, "CuratedAssetsForPeople", "", buf, 2u);
          }

          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)uint64_t v94 = "CuratedAssetsForPeople";
            *(_WORD *)&v94[8] = 2048;
            *(double *)&v94[10] = (float)((float)((float)((float)(v43 - v56) * (float)numer) / (float)denom) / 1000000.0);
            _os_log_impl(&dword_1D1805000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }
          if (v13
            && (double v48 = CFAbsoluteTimeGetCurrent(), v48 - v86[3] >= 0.01)
            && (v86[3] = v48,
                char v83 = 0,
                v55[2](v55, &v83, 1.0),
                char v49 = *((unsigned char *)v90 + 24) | v83,
                (*((unsigned char *)v90 + 24) = v49) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)uint64_t v94 = 604;
              *(_WORD *)&v94[4] = 2080;
              *(void *)&v94[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Curation/PGCurationManager.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            id v16 = 0;
            id v32 = v42;
          }
          else
          {
            id v32 = v42;
            id v16 = v32;
          }
          goto LABEL_45;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v94 = 596;
          *(_WORD *)&v94[4] = 2080;
          *(void *)&v94[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/PGCurationManager.m";
          double v34 = MEMORY[0x1E4F14500];
          goto LABEL_29;
        }
      }
    }
    id v16 = 0;
LABEL_45:

LABEL_46:
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)uint64_t v94 = 540;
    *(_WORD *)&v94[4] = 2080;
    *(void *)&v94[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/PGCurationManager.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v16 = 0;
LABEL_49:
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);

  return v16;
}

void __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke_308(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke_310(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

uint64_t __124__PGCurationManager_curatedAssetsForAssetCollection_duration_referencePersonLocalIdentifiers_curationContext_progressBlock___block_invoke_311(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 creationDate];
  unint64_t v6 = [v4 creationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)isAssetCollectionInteresting:(id)a3 curationContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PGCurationManager *)self defaultAssetFetchOptions];
  double v9 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:1];
  [v9 setFaceInformationPrefetchMode:2];
  id v10 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v7 options:v8 feederPrefetchOptions:v9 curationContext:v6];

  LOBYTE(self) = [(PGCurationManager *)self isAssetFeederInteresting:v10 withAlternateJunking:0 smart:0];
  return (char)self;
}

- (double)contentScoreForAssetCollection:(id)a3 curationContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PGCurationManager *)self defaultAssetFetchOptions];
  double v9 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:1];
  [v9 setPersonsPrefetchMode:0];
  id v10 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v7 options:v8 feederPrefetchOptions:v9 curationContext:v6];

  [(PGCurationManager *)self contentScoreForAssetFeeder:v10];
  double v12 = v11;

  return v12;
}

- (id)criteriaForKeyAssetCurationWithAssetCollection:(id)a3 graph:(id)a4 options:(id)a5 curationContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 assetCollectionType] == 3)
  {
    double v14 = [v11 momentNodeForMoment:v10];
    if (v14)
    {
      char v15 = [v11 bestMeaningLabelForMeaningfulEvent:v14];
      if (v15)
      {
        curationCriteriaFactory = self->_curationCriteriaFactory;
        id v17 = [v14 enrichableEvent];
        uint64_t v18 = [(PGCurationCriteriaFactory *)curationCriteriaFactory curationCriteriaWithCollection:v17 meaningLabel:v15 inGraph:v11 client:1];
      }
      else if ([v12 allowContextualTrip] && objc_msgSend(v14, "isTrip"))
      {
        id v20 = self->_curationCriteriaFactory;
        id v17 = [v14 enrichableEvent];
        uint64_t v18 = [(PGCurationCriteriaFactory *)v20 tripCurationCriteriaWithCollection:v17 client:1];
      }
      else
      {
        double v21 = self->_curationCriteriaFactory;
        id v17 = [v14 enrichableEvent];
        uint64_t v18 = [(PGCurationCriteriaFactory *)v21 petCurationCriteriaWithCollection:v17 client:1 curationContext:v13];
      }
      id v19 = (void *)v18;
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)dejunkAndDedupeAssetsInAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5 progressBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = _os_activity_create(&dword_1D1805000, "Dejunk and Dedup Assets", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v22.opaque[0] = 0;
  v22.opaque[1] = 0;
  os_activity_scope_enter(v14, &v22);
  char v15 = [(PGCurationManager *)self defaultAssetFetchOptions];
  id v16 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:1];
  [v16 setPersonsPrefetchMode:0];
  [v16 setFaceInformationPrefetchMode:2];
  id v17 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v10 options:v15 feederPrefetchOptions:v16 curationContext:v12];
  uint64_t v18 = objc_opt_class();
  id v19 = [v17 allItems];
  id v20 = [v18 dejunkAndDedupeItems:v19 options:v11 debugInfo:0 progressBlock:v13];

  os_activity_scope_leave(&v22);
  return v20;
}

- (id)curatedAssetsForAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5 progressBlock:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v55 = a5;
  id v54 = a6;
  id v12 = _Block_copy(v54);
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  uint64_t v64 = 0;
  long long v65 = (double *)&v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  if (!v12
    || (double v13 = CFAbsoluteTimeGetCurrent(), v13 - v65[3] < 0.01)
    || (void v65[3] = v13,
        LOBYTE(state.opaque[0]) = 0,
        (*((void (**)(void *, os_activity_scope_state_s *, double))v12 + 2))(v12, &state, 0.0),
        char v14 = *((unsigned char *)v69 + 24) | LOBYTE(state.opaque[0]),
        (*((unsigned char *)v69 + 24) = v14) == 0))
  {
    id v16 = _os_activity_create(&dword_1D1805000, "Curated Assets", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    uint64_t v53 = v16;
    os_activity_scope_enter(v16, &state);
    id v17 = [(PGCurationManager *)self curationLoggingConnection];
    os_signpost_id_t v18 = os_signpost_id_generate(v17);
    id v19 = v17;
    id v20 = v19;
    os_signpost_id_t spid = v18;
    unint64_t v21 = v18 - 1;
    if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CuratedAssets", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v51 = mach_absolute_time();
    os_activity_scope_state_s v22 = [(PGCurationCache *)self->_cache curatedAssetIdentifiersForMoment:v10 options:v11];
    if (v12
      && (double v23 = CFAbsoluteTimeGetCurrent(), v23 - v65[3] >= 0.01)
      && (void v65[3] = v23,
          char v61 = 0,
          (*((void (**)(void *, char *, double))v12 + 2))(v12, &v61, 0.5),
          char v24 = *((unsigned char *)v69 + 24) | v61,
          (*((unsigned char *)v69 + 24) = v24) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)double v73 = 208;
        *(_WORD *)&void v73[4] = 2080;
        *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Curation/PGCurationManager.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v25 = 0;
    }
    else
    {
      if (v22)
      {
        char v26 = [(PGCurationManager *)self fetchAssetsSortedByDateWithLocalIdentifiers:v22];
        id v25 = [v26 fetchedObjects];

        uint64_t v27 = [(PGCurationManager *)self curationLoggingConnection];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)double v73 = v10;
          _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "Curated Assets: Cache Hit for assetCollection: %@", buf, 0xCu);
        }
      }
      else
      {
        char v49 = [(PGCurationManager *)self defaultAssetFetchOptions];
        double v35 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:1];
        if ([v11 includesAllFaces]) {
          uint64_t v36 = 2;
        }
        else {
          uint64_t v36 = 0;
        }
        [v35 setPersonsPrefetchMode:v36];
        [v35 setFaceInformationPrefetchMode:2];
        char v50 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v10 options:v49 feederPrefetchOptions:v35 curationContext:v55];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __91__PGCurationManager_curatedAssetsForAssetCollection_options_curationContext_progressBlock___block_invoke;
        v56[3] = &unk_1E68F03F8;
        id v37 = v12;
        id v57 = v37;
        id v58 = &v64;
        double v59 = &v68;
        uint64_t v60 = 0x3F847AE147AE147BLL;
        uint64_t v38 = [(PGCurationManager *)self bestAssetsForAssetFeeder:v50 options:v11 progressBlock:v56];
        id v25 = v38;
        if (*((unsigned char *)v69 + 24))
        {
          int v39 = 1;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)double v73 = 221;
            *(_WORD *)&void v73[4] = 2080;
            *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Curation/PGCurationManager.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          if (![v38 count])
          {
            uint64_t v47 = [v50 allItems];

            id v25 = (id)v47;
          }
          uint64_t v46 = objc_alloc_init(PGKeyAssetCurationOptions);
          double v45 = -[PGCurationCache curatedKeyAssetIdentifierForMoment:options:](self->_cache, "curatedKeyAssetIdentifierForMoment:options:", v10);
          double v48 = -[PGCurationManager fetchAssetWithLocalIdentifier:](self, "fetchAssetWithLocalIdentifier:");
          if (v12
            && (double Current = CFAbsoluteTimeGetCurrent(), Current - v65[3] >= 0.01)
            && (void v65[3] = Current,
                char v61 = 0,
                (*((void (**)(id, char *, double))v37 + 2))(v37, &v61, 0.5),
                char v41 = *((unsigned char *)v69 + 24) | v61,
                (*((unsigned char *)v69 + 24) = v41) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)double v73 = 234;
              *(_WORD *)&void v73[4] = 2080;
              *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Curation/PGCurationManager.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            int v39 = 1;
          }
          else
          {
            if (v48 && (objc_msgSend(v25, "containsObject:") & 1) == 0)
            {
              double v44 = [v25 arrayByAddingObject:v48];

              uint64_t v42 = [(id)objc_opt_class() defaultAssetSortDescriptors];
              id v25 = [v44 sortedArrayUsingDescriptors:v42];
            }
            [(PGCurationCache *)self->_cache setCuratedAssets:v25 forMoment:v10 options:v11];
            int v39 = 0;
          }
        }
        if (v39) {
          goto LABEL_51;
        }
      }
      uint64_t v28 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      unint64_t v31 = v20;
      id v32 = v31;
      if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v32, OS_SIGNPOST_INTERVAL_END, spid, "CuratedAssets", "", buf, 2u);
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)double v73 = "CuratedAssets";
        *(_WORD *)&v73[8] = 2048;
        *(double *)&v73[10] = (float)((float)((float)((float)(v28 - v51) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (!v12
        || (double v33 = CFAbsoluteTimeGetCurrent(), v33 - v65[3] < 0.01)
        || (void v65[3] = v33,
            char v61 = 0,
            (*((void (**)(void *, char *, double))v12 + 2))(v12, &v61, 1.0),
            char v34 = *((unsigned char *)v69 + 24) | v61,
            (*((unsigned char *)v69 + 24) = v34) == 0))
      {
        id v25 = v25;
        char v15 = v25;
LABEL_52:

        os_activity_scope_leave(&state);
        goto LABEL_53;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)double v73 = 252;
        *(_WORD *)&void v73[4] = 2080;
        *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Curation/PGCurationManager.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
LABEL_51:
    char v15 = 0;
    goto LABEL_52;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)double v73 = 199;
    *(_WORD *)&void v73[4] = 2080;
    *(void *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/PGCurationManager.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  char v15 = 0;
LABEL_53:
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);

  return v15;
}

void __91__PGCurationManager_curatedAssetsForAssetCollection_options_curationContext_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)bestAssetsForAssetFeeder:(id)a3 options:(id)a4 progressBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(PGCurator_PHAsset);
  [(PGCurator *)v11 setLoggingConnection:self->_curationLoggingConnection];
  id v12 = [(PGCurator_PHAsset *)v11 bestAssetsForFeeder:v10 options:v9 debugInfo:0 progressBlock:v8];

  return v12;
}

- (id)curatedKeyAssetForAssetCollection:(id)a3 curatedAssetCollection:(id)a4 options:(id)a5 criteria:(id)a6 curationContext:(id)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  char v14 = (PGKeyAssetCurationOptions *)a5;
  id v15 = a6;
  id v52 = a7;
  id v16 = [(PGCurationManager *)self curationLoggingConnection];
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  os_signpost_id_t v18 = v16;
  id v19 = v18;
  unint64_t v20 = v17 - 1;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CuratedKeyAsset", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v49 = mach_absolute_time();
  if (v13) {
    unint64_t v21 = v13;
  }
  else {
    unint64_t v21 = v12;
  }
  id v51 = v21;
  if (!v14) {
    char v14 = objc_alloc_init(PGKeyAssetCurationOptions);
  }
  char v50 = v15;
  if (v15)
  {
    os_activity_scope_state_s v22 = [v12 uuid];
    double v23 = [(PGCurationManager *)self curatedKeyAssetForCollectionUUID:v22 curatedAssetCollection:v51 options:v14 criteria:v15 curationContext:v52];

    if (v23)
    {
      uint64_t v24 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v27 = v19;
      uint64_t v28 = v27;
      if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v28, OS_SIGNPOST_INTERVAL_END, v17, "CuratedKeyAsset", "Curated Key Asset. Updated asset collection to collection.", buf, 2u);
      }

      double v29 = v28;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        char v30 = [NSString stringWithFormat:@"Curated Key Asset. Updated asset collection to collection."];
        *(_DWORD *)buf = 136315650;
        id v55 = "CuratedKeyAsset";
        __int16 v56 = 2112;
        id v57 = v30;
        __int16 v58 = 2048;
        double v59 = (float)((float)((float)((float)(v24 - v49) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
      }
      goto LABEL_31;
    }
  }
  id v48 = v13;
  double v29 = [(PGCurationCache *)self->_cache curatedKeyAssetIdentifierForMoment:v12 options:v14];
  if (v29)
  {
    double v23 = [(PGCurationManager *)self fetchAssetWithLocalIdentifier:v29];
    goto LABEL_21;
  }
  uint64_t v31 = [(PGCurationManager *)self defaultAssetFetchOptions];
  id v32 = v51;
  double v33 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:1];
  [v33 setPersonsPrefetchMode:2];
  [v33 setFaceInformationPrefetchMode:2];
  [v33 setScenesPrefetchMode:2];
  uint64_t v46 = v32;
  uint64_t v47 = (void *)v31;
  char v34 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v32 options:v31 feederPrefetchOptions:v33 curationContext:v52];
  double v23 = [(PGCurationManager *)self bestAssetForAssetFeeder:v34 options:v14];
  if (!v23)
  {
    if (![v34 numberOfItems])
    {
      double v23 = 0;
      goto LABEL_20;
    }
    double v23 = [v34 itemAtIndex:0];
    if (!v23) {
      goto LABEL_20;
    }
  }
  [(PGCurationCache *)self->_cache setCuratedKeyAsset:v23 forMoment:v12 options:v14];
LABEL_20:

LABEL_21:
  uint64_t v35 = mach_absolute_time();
  uint32_t v37 = info.numer;
  uint32_t v36 = info.denom;
  uint64_t v38 = v19;
  int v39 = v38;
  if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    double v40 = @"YES";
    if (!v29) {
      double v40 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    id v55 = (const char *)v40;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v39, OS_SIGNPOST_INTERVAL_END, v17, "CuratedKeyAsset", "Curated Key Asset (cached: %@)", buf, 0xCu);
  }

  char v41 = v39;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    float v42 = (float)((float)((float)(v35 - v49) * (float)v37) / (float)v36) / 1000000.0;
    uint64_t v43 = @"YES";
    if (!v29) {
      uint64_t v43 = @"NO";
    }
    double v44 = [NSString stringWithFormat:@"Curated Key Asset (cached: %@)", v43];
    *(_DWORD *)buf = 136315650;
    id v55 = "CuratedKeyAsset";
    __int16 v56 = 2112;
    id v57 = v44;
    __int16 v58 = 2048;
    double v59 = v42;
    _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  id v13 = v48;
LABEL_31:

  return v23;
}

- (PFSceneGeography)sceneGeography
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sceneGeography)
  {
    id v3 = (PFSceneGeography *)objc_alloc_init(MEMORY[0x1E4F8CD48]);
    sceneGeography = v2->_sceneGeography;
    v2->_sceneGeography = v3;
  }
  objc_sync_exit(v2);

  unint64_t v5 = v2->_sceneGeography;
  return v5;
}

- (PGCurationManager)initWithPhotoLibrary:(id)a3 cacheURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PGCurationManager;
  id v9 = [(PGCurationManager *)&v20 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    os_log_t v11 = os_log_create("com.apple.PhotosGraph", "curation");
    curationLoggingConnection = v10->_curationLoggingConnection;
    v10->_curationLoggingConnection = (OS_os_log *)v11;

    id v13 = objc_alloc_init(PGCurationCriteriaFactory);
    curationCriteriaFactory = v10->_curationCriteriaFactory;
    v10->_curationCriteriaFactory = v13;

    id v15 = [PGCurationCache alloc];
    id v16 = +[CLSDBCache urlWithParentURL:v8];
    uint64_t v17 = [(CLSDBCache *)v15 initWithURL:v16];
    cache = v10->_cache;
    v10->_cache = (PGCurationCache *)v17;
  }
  return v10;
}

+ (id)filteredAssetsFromAssets:(id)a3 withContextualAssetLocalIdentifiers:(id)a4 approximateTimeDistance:(double)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:&__block_literal_global_344];
  [v10 setMaximumDistance:a5];
  [v10 setMinimumNumberOfObjects:2];
  os_log_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier IN %@", v9];
  id v12 = [v8 filteredArrayUsingPredicate:v11];
  uint64_t v13 = [v12 mutableCopy];

  id v52 = (id)v13;
  char v14 = [v10 performWithDataset:v13 progressBlock:0];
  if (![v14 count]) {
    goto LABEL_45;
  }
  id v48 = v10;
  id v49 = v9;
  uint64_t v46 = [a1 defaultAssetSortDescriptors];
  id v47 = v8;
  char v50 = objc_msgSend(v8, "sortedArrayUsingDescriptors:");
  uint64_t v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v51 = v14;
  id obj = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (!v15) {
    goto LABEL_26;
  }
  uint64_t v16 = v15;
  uint64_t v55 = *(void *)v65;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v65 != v55) {
        objc_enumerationMutation(obj);
      }
      os_signpost_id_t v18 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v19 = [v18 objects];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (!v20)
      {
        double v23 = 0;
        os_activity_scope_state_s v22 = 0;
        goto LABEL_23;
      }
      uint64_t v21 = v20;
      os_activity_scope_state_s v22 = 0;
      double v23 = 0;
      uint64_t v24 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v61 != v24) {
            objc_enumerationMutation(v19);
          }
          char v26 = objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * j), "cls_universalDate");
          if (!v23 || [v23 compare:v26] == 1)
          {
            id v27 = v26;

            double v23 = v27;
          }
          if (!v22 || [v22 compare:v26] == -1)
          {
            id v28 = v26;

            os_activity_scope_state_s v22 = v28;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v21);

      if (v23)
      {
        id v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v23 endDate:v22];
        [v53 addObject:v19];
LABEL_23:
      }
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
  }
  while (v16);
LABEL_26:

  double v29 = v53;
  id v10 = v48;
  id v9 = v49;
  char v14 = v51;
  if ([v53 count])
  {
    [v53 sortUsingSelector:sel_startDate];
    unint64_t v30 = [v53 count];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v31 = v50;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      unint64_t v34 = 0;
      uint64_t v35 = *(void *)v57;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v57 != v35) {
            objc_enumerationMutation(v31);
          }
          uint32_t v37 = *(void **)(*((void *)&v56 + 1) + 8 * v36);
          uint64_t v38 = objc_msgSend(v37, "cls_universalDate");
          int v39 = [v29 objectAtIndexedSubscript:v34];
          char v40 = [v39 containsDate:v38];

          if (v40)
          {
            [v52 addObject:v37];
          }
          else
          {
            if (v34 >= v30)
            {
LABEL_42:

              id v10 = v48;
              id v9 = v49;
              char v14 = v51;
              double v29 = v53;
              goto LABEL_43;
            }
            while (1)
            {
              char v41 = [v53 objectAtIndexedSubscript:v34];
              float v42 = [v41 endDate];
              uint64_t v43 = [v42 compare:v38];

              if (v43 != -1) {
                break;
              }
              if (v30 == ++v34) {
                goto LABEL_42;
              }
            }
          }

          ++v36;
          char v14 = v51;
          double v29 = v53;
        }
        while (v36 != v33);
        uint64_t v44 = [v31 countByEnumeratingWithState:&v56 objects:v68 count:16];
        uint64_t v33 = v44;
        id v10 = v48;
        id v9 = v49;
      }
      while (v44);
    }
LABEL_43:
  }
  id v8 = v47;
LABEL_45:

  return v52;
}

void __106__PGCurationManager_filteredAssetsFromAssets_withContextualAssetLocalIdentifiers_approximateTimeDistance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend(a2, "cls_universalDate");
  id v6 = objc_msgSend(v4, "cls_universalDate");

  [v5 timeIntervalSinceDate:v6];
}

+ (id)_filteredAssetsWithFaceFilter:(unint64_t)a3 forAssets:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    if ([v5 count])
    {
      v11[0] = 0;
      v11[1] = v11;
      v11[2] = 0x2020000000;
      char v12 = 0;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __61__PGCurationManager__filteredAssetsWithFaceFilter_forAssets___block_invoke;
      v10[3] = &unk_1E68EA108;
      v10[4] = v11;
      v10[5] = a3;
      id v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v10];
      id v8 = [v6 filteredArrayUsingPredicate:v7];

      _Block_object_dispose(v11, 8);
    }
    else
    {
      id v8 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

uint64_t __61__PGCurationManager__filteredAssetsWithFaceFilter_forAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 clsFaceInformationSummary];
  if (!v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    if (!*(unsigned char *)(v4 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Face information expected but not prefetched.", v10, 2u);
        uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
      }
      *(unsigned char *)(v4 + 24) = 1;
    }
  }
  int v5 = [v3 numberOfFaces];
  BOOL v6 = v5 != 0;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 == 2) {
    BOOL v6 = v5 == 0;
  }
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 1;
  }

  return v8;
}

+ (unint64_t)minimumNumberOfItemsForDuration:(unint64_t)a3 withMaximumNumberOfItems:(unint64_t)a4
{
  unint64_t v4 = vcvtad_u64_f64((double)a4 * 0.3);
  unint64_t v5 = 4;
  if (a4 < 4) {
    unint64_t v5 = a4;
  }
  if (v4 >= 4) {
    return v4;
  }
  else {
    return v5;
  }
}

+ (unint64_t)maximumNumberOfItemsForDuration:(unint64_t)a3 withTotalNumberOfItems:(unint64_t)a4 spanningNumberOfDays:(double)a5
{
  if (a3 == 1)
  {
    unint64_t v8 = 9;
  }
  else if (a3 == 2)
  {
LABEL_3:
    double v6 = (double)a4;
    long double v7 = 0.8;
LABEL_4:
    unint64_t v8 = (unint64_t)pow(v6, v7);
    BOOL v9 = v8 >= 0x50;
    unint64_t v10 = 80;
LABEL_5:
    if (v9) {
      unint64_t v8 = v10;
    }
    BOOL v11 = v8 > 6;
    uint64_t v12 = 6;
LABEL_9:
    if (!v11) {
      unint64_t v8 = v12;
    }
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14)
  {
    unint64_t v8 = a4;
    if (a4 >= 0x15) {
      unint64_t v8 = (unint64_t)fmin((pow((double)a4 / 20.0, 0.148) + -1.0) * 135.135135 + 20.0, 80.0);
    }
  }
  else
  {
    unint64_t v8 = a4;
    switch(a3)
    {
      case 3uLL:
      case 5uLL:
        unint64_t v8 = (unint64_t)pow((double)a4, 0.827129859);
        if (v8 >= 0xC0) {
          unint64_t v8 = 192;
        }
        BOOL v11 = v8 > 0xC;
        uint64_t v12 = 12;
        goto LABEL_9;
      case 4uLL:
        goto LABEL_3;
      case 6uLL:
      case 0x10uLL:
        break;
      case 7uLL:
        BOOL v14 = a4 >= 0x50;
        unint64_t v8 = 80;
        goto LABEL_30;
      case 8uLL:
      case 0xFuLL:
        BOOL v14 = a4 >= 4;
        unint64_t v8 = 4;
        goto LABEL_30;
      case 9uLL:
      case 0xAuLL:
        BOOL v14 = a4 >= 0x100;
        unint64_t v8 = 256;
        goto LABEL_30;
      case 0xBuLL:
        double v6 = (double)a4;
        long double v7 = 0.915306674;
        goto LABEL_4;
      case 0xCuLL:
      case 0xDuLL:
        BOOL v14 = a4 >= 7;
        unint64_t v8 = 7;
LABEL_30:
        if (!v14) {
          unint64_t v8 = a4;
        }
        break;
      case 0xEuLL:
        if (a5 >= 15.0) {
          double v17 = 80.0;
        }
        else {
          double v17 = a5 * 60.0 / 15.0 + 20.0;
        }
        double v18 = log((v17 + -20.0) / 60.0 * -0.233333333 + 0.333333333);
        long double v19 = log(v17 / ((v17 + -20.0) / 60.0 * -0.233333333 + 0.333333333));
        unint64_t v8 = (unint64_t)pow((double)a4, v18 / v19 + 1.0);
        unint64_t v10 = (unint64_t)v17;
        BOOL v9 = v8 >= (unint64_t)v17;
        goto LABEL_5;
      default:
        uint64_t v15 = +[PGLogging sharedLogging];
        uint64_t v16 = [v15 loggingConnection];

        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v20 = 0;
          _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Unsupported PGDuration", v20, 2u);
        }

        unint64_t v8 = 0;
        break;
    }
  }
  if (v8 >= a4) {
    return a4;
  }
  else {
    return v8;
  }
}

+ (unint64_t)maximumNumberOfItemsForDuration:(unint64_t)a3 withTotalNumberOfItems:(unint64_t)a4
{
  return [a1 maximumNumberOfItemsForDuration:a3 withTotalNumberOfItems:a4 spanningNumberOfDays:0.0];
}

+ (id)assetsBeautifier
{
  v2 = [MEMORY[0x1E4F76C48] beautifier];
  [v2 setEnableStatisticalSampling:1];
  [v2 setEnableNetworkAccess:0];
  [v2 setEnableIntermediateNaturalClustering:1];
  [v2 setEnableFinalNaturalClustering:1];
  [v2 setEnableFinalTimeClustering:1];
  [v2 setUsesKMeans:1];
  return v2;
}

+ (id)summaryClusteringForDuration:(unint64_t)a3
{
  unint64_t v4 = objc_opt_new();
  [v4 setOptimalDayDistributionThreshold:30.0];
  [v4 setTimeSpanDensityAverageNumberOfObjects:300];
  [v4 setEnableDensityClusteringLocationsDistance:1];
  [v4 setDensityClusteringLocationsDistanceUnit:2000];
  switch(a3)
  {
    case 1uLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:10800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:7];
      [v4 setConciseDensityClusteringMaximumDistance:1800.0];
      uint64_t v12 = v4;
      uint64_t v13 = 3;
      goto LABEL_26;
    case 2uLL:
    case 0x14uLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:10800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:7];
      [v4 setConciseDensityClusteringMaximumDistance:1800.0];
      unint64_t v5 = v4;
      uint64_t v6 = 3;
      goto LABEL_4;
    case 3uLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:10800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:7];
      [v4 setConciseDensityClusteringMaximumDistance:1800.0];
      [v4 setConciseDensityClusteringMinimumNumberOfObjects:3];
      [v4 setEnableMultipassDensityClustering:0];
      BOOL v14 = v4;
      uint64_t v15 = 3;
      goto LABEL_17;
    case 4uLL:
    case 0xBuLL:
    case 0x15uLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:10800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:1];
      [v4 setConciseDensityClusteringMaximumDistance:1800.0];
      unint64_t v5 = v4;
      uint64_t v6 = 1;
LABEL_4:
      [v5 setConciseDensityClusteringMinimumNumberOfObjects:v6];
      [v4 setEnableMultipassDensityClustering:0];
      [v4 setAdaptiveElectionMinimumNumberOfItemsByCluster:1];
      [v4 setEnableAdaptiveElectionSmoother:1];
      [v4 setEnableAdaptiveElectionSmootherAutomaticLimit:1];
      long double v7 = v4;
      uint64_t v8 = 7;
      goto LABEL_18;
    case 5uLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:10800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:1];
      [v4 setConciseDensityClusteringMaximumDistance:1800.0];
      uint64_t v16 = v4;
      uint64_t v17 = 1;
      goto LABEL_16;
    case 6uLL:
    case 0xAuLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:1800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:1];
      BOOL v9 = v4;
      goto LABEL_7;
    case 7uLL:
      double v18 = 1800.0;
      goto LABEL_24;
    case 8uLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:10800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:1];
      double v19 = 1800.0;
      uint64_t v20 = v4;
      goto LABEL_25;
    case 9uLL:
    case 0x10uLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:10800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:1];
      BOOL v9 = v4;
LABEL_7:
      [v9 setConciseDensityClusteringMaximumDistance:1800.0];
      [v4 setConciseDensityClusteringMinimumNumberOfObjects:1];
      [v4 setEnableMultipassDensityClustering:0];
      [v4 setAdaptiveElectionMinimumNumberOfItemsByCluster:1];
      [v4 setEnableAdaptiveElectionSmoother:0];
      unint64_t v10 = v4;
      uint64_t v11 = 0;
      goto LABEL_28;
    case 0xCuLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:10800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:1];
      double v21 = 1800.0;
      os_activity_scope_state_s v22 = v4;
      goto LABEL_34;
    case 0xDuLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:3600.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:1];
      [v4 setConciseDensityClusteringMaximumDistance:900.0];
      [v4 setConciseDensityClusteringMinimumNumberOfObjects:1];
      [v4 setEnableMultipassDensityClustering:0];
      [v4 setAdaptiveElectionMinimumNumberOfItemsByCluster:1];
      [v4 setAdaptiveElectionMaximumNumberOfItemsByCluster:1];
      goto LABEL_27;
    case 0xEuLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:10800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:5];
      [v4 setConciseDensityClusteringMaximumDistance:1800.0];
      uint64_t v16 = v4;
      uint64_t v17 = 3;
LABEL_16:
      [v16 setConciseDensityClusteringMinimumNumberOfObjects:v17];
      [v4 setEnableMultipassDensityClustering:0];
      BOOL v14 = v4;
      uint64_t v15 = 1;
LABEL_17:
      [v14 setAdaptiveElectionMinimumNumberOfItemsByCluster:v15];
      [v4 setEnableAdaptiveElectionSmoother:1];
      [v4 setEnableAdaptiveElectionSmootherAutomaticLimit:1];
      long double v7 = v4;
      uint64_t v8 = 4;
LABEL_18:
      [v7 setAdaptiveElectionSmootherMinimumLimit:v8];
      double v23 = v4;
      uint64_t v24 = 20;
      goto LABEL_29;
    case 0xFuLL:
      [v4 setDiffuseDensityClusteringMaximumDistance:10800.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:1];
      [v4 setConciseDensityClusteringMaximumDistance:1800.0];
      [v4 setConciseDensityClusteringMinimumNumberOfObjects:1];
      [v4 setEnableMultipassDensityClustering:0];
      [v4 setAdaptiveElectionMinimumNumberOfItemsByCluster:1];
      [v4 setEnableAdaptiveElectionSmoother:1];
      [v4 setEnableAdaptiveElectionSmootherAutomaticLimit:1];
      [v4 setAdaptiveElectionSmootherMinimumLimit:1];
      double v23 = v4;
      uint64_t v24 = 2;
      goto LABEL_29;
    case 0x16uLL:
      [v4 setEnableDensityClusteringLocationsDistance:0];
      double v18 = 86400.0;
LABEL_24:
      [v4 setDiffuseDensityClusteringMaximumDistance:v18];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:1];
      uint64_t v20 = v4;
      double v19 = v18;
LABEL_25:
      [v20 setConciseDensityClusteringMaximumDistance:v19];
      uint64_t v12 = v4;
      uint64_t v13 = 1;
LABEL_26:
      [v12 setConciseDensityClusteringMinimumNumberOfObjects:v13];
      [v4 setEnableMultipassDensityClustering:0];
      [v4 setAdaptiveElectionMinimumNumberOfItemsByCluster:1];
LABEL_27:
      [v4 setEnableAdaptiveElectionSmoother:1];
      unint64_t v10 = v4;
      uint64_t v11 = 1;
LABEL_28:
      [v10 setEnableAdaptiveElectionSmootherAutomaticLimit:v11];
      [v4 setAdaptiveElectionSmootherMinimumLimit:1];
      double v23 = v4;
      uint64_t v24 = 1;
      goto LABEL_29;
    case 0x17uLL:
      [v4 setEnableDensityClusteringLocationsDistance:0];
      [v4 setDiffuseDensityClusteringMaximumDistance:86400.0];
      [v4 setDiffuseDensityClusteringMinimumNumberOfObjects:1];
      os_activity_scope_state_s v22 = v4;
      double v21 = 86400.0;
LABEL_34:
      [v22 setConciseDensityClusteringMaximumDistance:v21];
      [v4 setConciseDensityClusteringMinimumNumberOfObjects:1];
      [v4 setEnableMultipassDensityClustering:0];
      [v4 setAdaptiveElectionMinimumNumberOfItemsByCluster:1];
      [v4 setEnableAdaptiveElectionSmoother:1];
      [v4 setEnableAdaptiveElectionSmootherAutomaticLimit:1];
      [v4 setAdaptiveElectionSmootherMinimumLimit:1];
      double v23 = v4;
      uint64_t v24 = 3;
LABEL_29:
      [v23 setAdaptiveElectionSmootherMaximumLimit:v24];
      break;
    default:
      id v25 = +[PGLogging sharedLogging];
      char v26 = [v25 loggingConnection];

      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v28 = 0;
        _os_log_error_impl(&dword_1D1805000, v26, OS_LOG_TYPE_ERROR, "Unsupported PGDuration", v28, 2u);
      }

      break;
  }
  return v4;
}

+ (BOOL)areAssetsInteresting:(id)a3 minimumNumberOfCuratedAssets:(unint64_t)a4 duration:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v9 = [v8 count];
  unint64_t v10 = [a1 assetsBeautifier];
  unint64_t v11 = [a1 maximumNumberOfItemsForDuration:a5 withTotalNumberOfItems:v9];
  if (v11 >= v9) {
    unint64_t v12 = v9;
  }
  else {
    unint64_t v12 = v11;
  }
  uint64_t v13 = [v10 performWithItems:v8 maximumNumberOfItemsToChoose:v12 progressBlock:0];

  if ([v13 count] >= a4 && (double)v12 * 0.3 <= (double)(unint64_t)objc_msgSend(v13, "count"))
  {
    BOOL v14 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v16 = 134218240;
      uint64_t v17 = [v13 count];
      __int16 v18 = 2048;
      unint64_t v19 = v12;
      _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "AssetCollection is not interesting: \"Not enough best assets from beautifier (%lu/%lu) for assets\"", (uint8_t *)&v16, 0x16u);
    }
    BOOL v14 = 0;
  }

  return v14;
}

+ (double)contentScoreForAssets:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 count];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    double v9 = *MEMORY[0x1E4F8E738];
    double v10 = *MEMORY[0x1E4F8E740];
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "clsContentScore", (void)v25);
        double v17 = v16;
        if (v16 >= v9 && [v15 clsIsUtility]) {
          double v17 = v10;
        }
        double v13 = v13 + v17;
        double v18 = v12 + 1.0;
        if (v17 >= v10) {
          double v18 = v12;
        }
        if (v17 <= v10) {
          double v12 = v18;
        }
        else {
          double v11 = v11 + 1.0;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
  }
  double v19 = (double)v4;

  double v20 = (v11 * v11 - v12 * v12) * 0.25 / (v19 * v19);
  long double v21 = log2((double)v4);
  double v22 = pow(fabs(v20), 1.0 / v21);
  if (v20 < 0.0) {
    double v23 = -v22;
  }
  else {
    double v23 = v22;
  }

  return (v13 / v19 + (v23 + 1.0) * 0.5) * 0.5;
}

+ (id)dedupedAssetsWithAssets:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [(id)objc_opt_class() assetsBeautifier];
  id v5 = [v4 deduplicateItems:v3 debugInfo:0];

  return v5;
}

+ (id)representativeAssetsForAssets:(id)a3 extendedCuratedAssets:(id)a4 progressBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v9 count] > 0x200)
  {
    id v11 = [a1 representativeAssetsForAssets:v8 progressBlock:v10];
  }
  else
  {
    id v11 = v9;
  }
  double v12 = v11;

  return v12;
}

+ (id)representativeAssetsForAssetCollection:(id)a3 curationContext:(id)a4 progressBlock:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _Block_copy(v10);
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  int v39 = (double *)&v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  if (!v11
    || (double v12 = CFAbsoluteTimeGetCurrent(), v12 - v39[3] < 0.01)
    || (v39[3] = v12,
        char v37 = 0,
        (*((void (**)(void *, char *, double))v11 + 2))(v11, &v37, 0.0),
        char v13 = *((unsigned char *)v43 + 24) | v37,
        (*((unsigned char *)v43 + 24) = v13) == 0))
  {
    uint64_t v15 = [v8 photoLibrary];
    double v16 = [v15 librarySpecificFetchOptions];

    uint64_t v17 = *MEMORY[0x1E4F39528];
    v46[0] = *MEMORY[0x1E4F394A8];
    v46[1] = v17;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    [v16 setFetchPropertySets:v18];

    double v19 = [MEMORY[0x1E4F76C98] feederPrefetchOptionsWithDefaultMode:0];
    [v19 setPersonsPrefetchMode:0];
    double v20 = [MEMORY[0x1E4F76CF0] feederForAssetCollection:v8 options:v16 feederPrefetchOptions:v19 curationContext:v9];
    if ([v20 numberOfItems])
    {
      if (!v11
        || (double v21 = CFAbsoluteTimeGetCurrent(), v21 - v39[3] < 0.01)
        || (v39[3] = v21,
            char v37 = 0,
            (*((void (**)(void *, char *, double))v11 + 2))(v11, &v37, 0.5),
            char v22 = *((unsigned char *)v43 + 24) | v37,
            (*((unsigned char *)v43 + 24) = v22) == 0))
      {
        uint64_t v24 = [v20 allItems];
        if ((unint64_t)[v24 count] > 0x200)
        {
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __90__PGCurationManager_representativeAssetsForAssetCollection_curationContext_progressBlock___block_invoke;
          v32[3] = &unk_1E68F03F8;
          id v27 = v11;
          id v33 = v27;
          unint64_t v34 = &v38;
          uint64_t v35 = &v42;
          uint64_t v36 = 0x3F847AE147AE147BLL;
          long long v28 = [a1 representativeAssetsForAssets:v24 progressBlock:v32];
          if (v11
            && (double Current = CFAbsoluteTimeGetCurrent(), Current - v39[3] >= 0.01)
            && (v39[3] = Current,
                char v37 = 0,
                (*((void (**)(id, char *, double))v27 + 2))(v27, &v37, 1.0),
                char v30 = *((unsigned char *)v43 + 24) | v37,
                (*((unsigned char *)v43 + 24) = v30) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v48 = 408;
              __int16 v49 = 2080;
              char v50 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cu"
                    "ration/PGCurationManager.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            id v14 = (id)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            id v14 = v28;
          }
        }
        else
        {
          id v14 = v24;
        }

        goto LABEL_31;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_21:
        id v14 = (id)MEMORY[0x1E4F1CBF0];
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 67109378;
      int v48 = 397;
      __int16 v49 = 2080;
      char v50 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/P"
            "GCurationManager.m";
      double v23 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!v11) {
        goto LABEL_21;
      }
      double v25 = CFAbsoluteTimeGetCurrent();
      if (v25 - v39[3] < 0.01) {
        goto LABEL_21;
      }
      v39[3] = v25;
      char v37 = 0;
      (*((void (**)(void *, char *, double))v11 + 2))(v11, &v37, 1.0);
      char v26 = *((unsigned char *)v43 + 24) | v37;
      *((unsigned char *)v43 + 24) = v26;
      if (!v26 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 67109378;
      int v48 = 393;
      __int16 v49 = 2080;
      char v50 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/P"
            "GCurationManager.m";
      double v23 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v48 = 383;
    __int16 v49 = 2080;
    char v50 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGC"
          "urationManager.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v14 = (id)MEMORY[0x1E4F1CBF0];
LABEL_32:
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v14;
}

void __90__PGCurationManager_representativeAssetsForAssetCollection_curationContext_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

+ (id)representativeAssetsForAssets:(id)a3 progressBlock:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v6 = a4;
  uint64_t v7 = _Block_copy(v6);
  uint64_t v59 = 0;
  long long v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v55 = 0;
  long long v56 = (double *)&v55;
  uint64_t v57 = 0x2020000000;
  uint64_t v58 = 0;
  int v39 = v6;
  if (v7
    && (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v56[3] >= 0.01)
    && (v56[3] = v8,
        char v54 = 0,
        (*((void (**)(void *, char *, double))v7 + 2))(v7, &v54, 0.0),
        char v9 = *((unsigned char *)v60 + 24) | v54,
        (*((unsigned char *)v60 + 24) = v9) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v66 = 336;
      __int16 v67 = 2080;
      uint64_t v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/P"
            "GCurationManager.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    context = (void *)MEMORY[0x1D25FED50]();
    id v11 = [a1 summaryClusteringForDuration:6];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __65__PGCurationManager_representativeAssetsForAssets_progressBlock___block_invoke;
    v49[3] = &unk_1E68F03F8;
    id v12 = v7;
    id v50 = v12;
    uint64_t v51 = &v55;
    id v52 = &v59;
    uint64_t v53 = 0x3F847AE147AE147BLL;
    char v37 = v11;
    char v13 = [v11 densityClustersWithItems:v40 progressBlock:v49];
    id v14 = v13;
    if (*((unsigned char *)v60 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v66 = 345;
        __int16 v67 = 2080;
        uint64_t v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation"
              "/PGCurationManager.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      if ((unint64_t)[v13 count] < 0x101)
      {
        id v17 = v14;
      }
      else
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F8AB78]);
        [v15 setNumberOfClusters:256];
        uint64_t v36 = v15;
        double v16 = [v15 performWithDataset:v14 progressBlock:0];
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v18 = v16;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v64 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v46 != v20) {
                objc_enumerationMutation(v18);
              }
              char v22 = [*(id *)(*((void *)&v45 + 1) + 8 * i) objects];
              double v23 = [v22 firstObject];
              [v17 addObject:v23];
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v64 count:16];
          }
          while (v19);
        }
      }
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v14 = v17;
      uint64_t v25 = [v14 countByEnumeratingWithState:&v41 objects:v63 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v42;
        while (2)
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v14);
            }
            long long v28 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            if (v7)
            {
              double Current = CFAbsoluteTimeGetCurrent();
              if (Current - v56[3] >= 0.01)
              {
                v56[3] = Current;
                char v54 = 0;
                (*((void (**)(id, char *, double))v12 + 2))(v12, &v54, 0.8);
                char v30 = *((unsigned char *)v60 + 24) | v54;
                *((unsigned char *)v60 + 24) = v30;
                if (v30)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    int v66 = 363;
                    __int16 v67 = 2080;
                    uint64_t v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Curation/PGCurationManager.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  goto LABEL_41;
                }
              }
            }
            unint64_t v31 = [v28 count];
            if (v31)
            {
              uint64_t v32 = [v28 objectAtIndexedSubscript:v31 >> 1];
              [v24 addObject:v32];
            }
          }
          uint64_t v25 = [v14 countByEnumeratingWithState:&v41 objects:v63 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      if (v7
        && (double v33 = CFAbsoluteTimeGetCurrent(), v33 - v56[3] >= 0.01)
        && (v56[3] = v33,
            char v54 = 0,
            (*((void (**)(id, char *, double))v12 + 2))(v12, &v54, 1.0),
            char v34 = *((unsigned char *)v60 + 24) | v54,
            (*((unsigned char *)v60 + 24) = v34) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v66 = 373;
          __int16 v67 = 2080;
          uint64_t v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curati"
                "on/PGCurationManager.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_41:
        id v10 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v10 = v24;
      }
    }
  }
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

  return v10;
}

void __65__PGCurationManager_representativeAssetsForAssets_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

+ (id)sceneInfoWithAsset:(id)a3 curationSession:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v16[0] = a3;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  double v8 = [v5 arrayWithObjects:v16 count:1];
  [v6 prepareAssets:v8];

  char v9 = [v7 clsSceneClassifications];
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  id v11 = (void *)MEMORY[0x1E4F8E778];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__PGCurationManager_sceneInfoWithAsset_curationSession___block_invoke;
  v14[3] = &unk_1E68EADD8;
  id v12 = v10;
  id v15 = v12;
  [v11 enumerateSignalsFromAsset:v7 fullHierarchyName:0 usingBlock:v14];

  return v12;
}

void __56__PGCurationManager_sceneInfoWithAsset_curationSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  id v7 = [NSString stringWithFormat:@"%@ (%llu)", a3, a2];
  id v6 = [NSNumber numberWithDouble:a4];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

+ (id)dejunkAndDedupeItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = (void (**)(void *, unsigned char *, double))_Block_copy(a6);
  double v14 = 0.0;
  if (!v13 || (double v15 = CFAbsoluteTimeGetCurrent(), v15 < 0.01))
  {
LABEL_8:
    if (v12)
    {
      [v12 setAgent:@"Dejunk and Dedupe"];
      [v12 setStage:@"Initial"];
      id v17 = [MEMORY[0x1E4F8A788] clusterWithObjects:v10];
      uint64_t v32 = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      [v12 setClusters:v18 withReason:@"DejunkAndDeduper"];
    }
    uint64_t v19 = [a1 assetsBeautifier];
    if (v13)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v14 >= 0.01)
      {
        char v31 = 0;
        v13[2](v13, &v31, 0.5);
        if (v31)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v34 = 292;
            __int16 v35 = 2080;
            uint64_t v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cura"
                  "tion/PGCurationManager.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = 0;
          goto LABEL_34;
        }
        double v14 = Current;
      }
    }
    double v21 = [v11 objectForKeyedSubscript:@"dedupingDuration"];

    if (v21)
    {
      char v22 = [v11 objectForKeyedSubscript:@"dedupingDuration"];
      [v22 doubleValue];
      double v24 = v23;
    }
    else
    {
      double v24 = 60.0;
    }
    uint64_t v25 = [v11 objectForKeyedSubscript:@"dedupingSimilarity"];

    if (v25)
    {
      uint64_t v26 = [v11 objectForKeyedSubscript:@"dedupingSimilarity"];
      uint64_t v27 = [v26 integerValue];
    }
    else
    {
      uint64_t v27 = 2;
    }
    long long v28 = [v19 deduplicateItems:v10 withDuration:v27 andSimilarity:v12 debugInfo:v24];
    if ([v28 count])
    {
      if (!v13) {
        goto LABEL_32;
      }
    }
    else
    {
      id v29 = v10;

      long long v28 = v29;
      if (!v13) {
        goto LABEL_32;
      }
    }
    if (CFAbsoluteTimeGetCurrent() - v14 >= 0.01)
    {
      char v31 = 0;
      v13[2](v13, &v31, 1.0);
      if (v31)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v34 = 315;
          __int16 v35 = 2080;
          uint64_t v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curati"
                "on/PGCurationManager.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v16 = 0;
        goto LABEL_33;
      }
    }
LABEL_32:
    id v16 = v28;
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
  char v31 = 0;
  v13[2](v13, &v31, 0.0);
  if (!v31)
  {
    double v14 = v15;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v34 = 280;
    __int16 v35 = 2080;
    uint64_t v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGC"
          "urationManager.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v16 = 0;
LABEL_35:

  return v16;
}

+ (id)defaultAssetSortDescriptors
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v6[1] = v3;
  unint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)assetPropertySetsForCuration
{
  v12[16] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F39568];
  v12[0] = *MEMORY[0x1E4F39448];
  v12[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F39550];
  void v12[2] = *MEMORY[0x1E4F39538];
  v12[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F39528];
  v12[4] = *MEMORY[0x1E4F394E0];
  v12[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F39420];
  v12[6] = *MEMORY[0x1E4F39458];
  v12[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F394C8];
  v12[8] = *MEMORY[0x1E4F39488];
  v12[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F394B8];
  v12[10] = *MEMORY[0x1E4F39508];
  v12[11] = v7;
  uint64_t v8 = *MEMORY[0x1E4F39558];
  v12[12] = *MEMORY[0x1E4F394C0];
  v12[13] = v8;
  uint64_t v9 = *MEMORY[0x1E4F39498];
  v12[14] = *MEMORY[0x1E4F39480];
  v12[15] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:16];
  return v10;
}

- (id)_filteredAssetsForAssets:(id)a3 inMoments:(id)a4 keepFavorites:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v33 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v9 = [v8 count];
  id v10 = [v8 firstObject];
  id v11 = [v10 startDate];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  double v14 = [v10 endDate];
  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    unint64_t v19 = 0;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(obj);
        }
        char v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (v5)
        {
          if ([*(id *)(*((void *)&v35 + 1) + 8 * i) isFavorite]) {
            goto LABEL_21;
          }
          if (v19 >= v9) {
            continue;
          }
        }
        double v23 = [v22 creationDate];
        [v23 timeIntervalSinceReferenceDate];
        double v25 = v24;

        if (v25 < v13) {
          continue;
        }
        if (v25 > v16)
        {
          if (++v19 >= v9)
          {
LABEL_15:
            if (!v5) {
              goto LABEL_24;
            }
            continue;
          }
          while (1)
          {
            uint64_t v26 = v10;
            id v10 = [v8 objectAtIndexedSubscript:v19];

            uint64_t v27 = [v10 startDate];
            [v27 timeIntervalSinceReferenceDate];
            double v13 = v28;

            id v29 = [v10 endDate];
            [v29 timeIntervalSinceReferenceDate];
            double v16 = v30;

            if (v16 >= v25) {
              break;
            }
            if (v9 == ++v19)
            {
              unint64_t v19 = v9;
              goto LABEL_15;
            }
          }
        }
        if (v25 >= v13 && v25 <= v16)
        {
LABEL_21:
          [v33 addObject:v22];
          continue;
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v18);
  }
LABEL_24:

  return v33;
}

- (id)_libraryDateInterval
{
  v21[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PGCurationManager *)self photoLibrary];
  uint64_t v3 = [v2 librarySpecificFetchOptions];

  uint64_t v4 = *MEMORY[0x1E4F39528];
  v21[0] = *MEMORY[0x1E4F394A8];
  v21[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v3 setFetchPropertySets:v5];

  [v3 setFetchLimit:1];
  [v3 setIncludeAssetSourceTypes:5];
  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  uint64_t v20 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [v3 setSortDescriptors:v7];

  id v8 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v3];
  unint64_t v9 = [v8 firstObject];

  id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  unint64_t v19 = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  [v3 setSortDescriptors:v11];

  double v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v3];
  double v13 = [v12 firstObject];

  double v14 = [v9 creationDate];
  uint64_t v15 = [v13 creationDate];
  double v16 = (void *)v15;
  uint64_t v17 = 0;
  if (v14 && v15) {
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v15];
  }

  return v17;
}

- (id)_firstBestFacedAssetInAssetCluster:(id)a3 facesByAssetIdentifiers:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] == 1)
  {
    id v7 = [v5 firstObject];
    [v7 curationScore];
    if (v8 == *MEMORY[0x1E4F8E750]) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = v7;
    }
    id v10 = v9;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = v5;
    uint64_t v11 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v10 = 0;
      uint64_t v13 = *(void *)v29;
      double v14 = *MEMORY[0x1E4F8E750];
      double v15 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          [v17 curationScore];
          if (v18 != v14)
          {
            unint64_t v19 = [v17 localIdentifier];
            uint64_t v20 = [v6 objectForKeyedSubscript:v19];
            memset(v27, 0, sizeof(v27));
            if ([v20 countByEnumeratingWithState:v27 objects:v32 count:16])
            {
              [**((id **)&v27[0] + 1) size];
              if (v21 >= 0.1 && v21 <= 0.7)
              {
                id v25 = v17;

                id v10 = v25;
                goto LABEL_26;
              }
            }
            else
            {
              double v21 = 0.0;
            }
            double v22 = 0.4 - v21;
            if (v22 < 0.0) {
              double v22 = -v22;
            }
            double v23 = 1.0 - v22;
            if (1.0 - v22 > v15)
            {
              id v24 = v17;

              id v10 = v24;
              double v15 = v23;
            }
          }
        }
        uint64_t v12 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }
    else
    {
      id v10 = 0;
    }
  }
LABEL_26:

  return v10;
}

- (id)_timeBasedAssetClustersForAssets:(id)a3 maximumClusterCount:(unint64_t)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  double v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:a4];
  unint64_t v9 = [(PGCurationManager *)self _libraryDateInterval];
  if (!v9)
  {
    long long v42 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_49;
  }
  [v7 addObject:v9];
  id v50 = v9;
  id v51 = v6;
  [v8 setObject:v6 forKeyedSubscript:v9];
  if ([v7 count] >= a4) {
    goto LABEL_40;
  }
  uint64_t v10 = 0;
  uint64_t v53 = v7;
  unint64_t v54 = a4;
  do
  {
    if (v10 == [v7 count]) {
      break;
    }
    context = (void *)MEMORY[0x1D25FED50]();
    uint64_t v11 = [v7 count];
    if (v11 < 1)
    {
      uint64_t v10 = 0;
      goto LABEL_39;
    }
    uint64_t v12 = v11;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v13 = v12 - 1;
      double v14 = [v7 objectAtIndexedSubscript:v12 - 1];
      double v15 = [v14 startDate];
      double v16 = [v14 endDate];
      [v14 duration];
      double v18 = v17;
      char v62 = [v8 objectForKeyedSubscript:v14];
      if ((unint64_t)[v62 count] >= 2 && v18 >= 21600.0) {
        break;
      }
      ++v10;
LABEL_34:

      BOOL v41 = v12 <= 1;
      uint64_t v12 = v13;
      if (v41) {
        goto LABEL_39;
      }
    }
    uint64_t v61 = v12;
    uint64_t v59 = v12 - 1;
    double v19 = v18 * 0.5;
    uint64_t v56 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v15 duration:v19];
    uint64_t v55 = [v15 dateByAddingTimeInterval:v19 + 2.22044605e-16];
    uint64_t v57 = v16;
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v55 endDate:v16];
    uint64_t v58 = v15;
    [v15 timeIntervalSinceReferenceDate];
    double v22 = v21;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v23 = v62;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v72 count:16];
    id v25 = (void *)v20;
    uint64_t v60 = v10;
    if (!v24)
    {

      uint64_t v13 = v59;
      if (v19 >= 1.0) {
        goto LABEL_30;
      }
LABEL_26:
      uint64_t v31 = 1;
      goto LABEL_28;
    }
    uint64_t v26 = v24;
    uint64_t v27 = 0;
    double v28 = v19 + v22;
    uint64_t v29 = *(void *)v68;
    while (2)
    {
      uint64_t v30 = 0;
      uint64_t v31 = v27 + v26;
      do
      {
        if (*(void *)v68 != v29) {
          objc_enumerationMutation(v23);
        }
        uint64_t v32 = [*(id *)(*((void *)&v67 + 1) + 8 * v30) creationDate];
        [v32 timeIntervalSinceReferenceDate];
        double v34 = v33;

        if (v34 > v28)
        {
          uint64_t v31 = v27 + v30;
          uint64_t v20 = (uint64_t)v25;
          goto LABEL_20;
        }
        ++v30;
      }
      while (v26 != v30);
      uint64_t v20 = (uint64_t)v25;
      uint64_t v26 = [v23 countByEnumeratingWithState:&v67 objects:v72 count:16];
      uint64_t v27 = v31;
      if (v26) {
        continue;
      }
      break;
    }
LABEL_20:

    if (v19 >= 1.0)
    {
      id v7 = v53;
      uint64_t v13 = v59;
      if (!v31) {
        goto LABEL_30;
      }
    }
    else
    {
      id v7 = v53;
      uint64_t v13 = v59;
      if (!v31) {
        goto LABEL_26;
      }
      if (v31 == [v23 count] && !--v31)
      {
LABEL_30:
        [v7 setObject:v20 atIndexedSubscript:v13];
        [v8 setObject:v23 forKeyedSubscript:v20];
        long long v36 = (void *)v56;
        double v16 = v57;
        long long v37 = v7;
        id v25 = (void *)v20;
        goto LABEL_32;
      }
    }
LABEL_28:
    uint64_t v35 = [v23 count];
    long long v36 = (void *)v56;
    [v7 setObject:v56 atIndexedSubscript:v13];
    if (v31 == v35)
    {
      [v8 setObject:v23 forKeyedSubscript:v56];
      double v16 = v57;
      long long v37 = v7;
    }
    else
    {
      long long v37 = v7;
      [v7 insertObject:v25 atIndex:v61];
      long long v38 = objc_msgSend(v23, "subarrayWithRange:", 0, v31);
      [v8 setObject:v38 forKeyedSubscript:v56];

      int v39 = objc_msgSend(v23, "subarrayWithRange:", v31, objc_msgSend(v23, "count") - v31);
      [v8 setObject:v39 forKeyedSubscript:v25];

      double v16 = v57;
    }
LABEL_32:
    [v8 setObject:0 forKeyedSubscript:v14];
    id v7 = v37;
    unint64_t v40 = [v37 count];

    a4 = v54;
    if (v40 < v54)
    {
      double v15 = v58;
      uint64_t v10 = v60;
      uint64_t v12 = v61;
      goto LABEL_34;
    }

    uint64_t v10 = v60;
LABEL_39:
  }
  while ([v7 count] < a4);
LABEL_40:
  long long v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v43 = v7;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v64 != v46) {
          objc_enumerationMutation(v43);
        }
        long long v48 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * i)];
        [v42 addObject:v48];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v45);
  }

  unint64_t v9 = v50;
  id v6 = v51;
LABEL_49:

  return v42;
}

- (id)curatedAssetsForPersonLocalIdentifier:(id)a3 progressBlock:(id)a4
{
  uint64_t v344 = *MEMORY[0x1E4F143B8];
  id v259 = a3;
  id v5 = a4;
  uint64_t v319 = 0;
  v320 = &v319;
  uint64_t v321 = 0x2020000000;
  char v322 = 0;
  uint64_t v315 = 0;
  v316 = (double *)&v315;
  uint64_t v317 = 0x2020000000;
  uint64_t v318 = 0;
  v262 = (void (**)(void *, unsigned char *, double))_Block_copy(v5);
  v254 = v5;
  if (!v262
    || (double v6 = CFAbsoluteTimeGetCurrent(), v6 - v316[3] < 0.01)
    || (v316[3] = v6,
        LOBYTE(state.opaque[0]) = 0,
        ((void (**)(void *, os_activity_scope_state_s *, double))v262)[2](v262, &state, 0.0),
        char v7 = *((unsigned char *)v320 + 24) | LOBYTE(state.opaque[0]),
        (*((unsigned char *)v320 + 24) = v7) == 0))
  {
    unint64_t v9 = _os_activity_create(&dword_1D1805000, "Curated Assets for people", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[1] = 0;
    state.opaque[0] = 0;
    os_activity_scope_enter(v9, &state);
    [(PGCurationManager *)self photoLibrary];
    v258 = v252 = v9;
    uint64_t v10 = [v258 librarySpecificFetchOptions];
    [v10 setIncludedDetectionTypes:&unk_1F28D4500];
    v255 = v10;
    uint64_t v11 = (void *)MEMORY[0x1E4F391F0];
    id v341 = v259;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v341 count:1];
    uint64_t v13 = [v11 fetchPersonsWithLocalIdentifiers:v12 options:v255];
    v260 = [v13 firstObject];

    if (!v260)
    {
      double v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_266:

      os_activity_scope_leave(&state);
      goto LABEL_267;
    }
    v261 = [v258 librarySpecificFetchOptions];
    uint64_t v340 = *MEMORY[0x1E4F39448];
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v340 count:1];
    [v261 setFetchPropertySets:v14];

    double v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"highlightBeingExtendedAssets != nil"];
    [v261 setInternalPredicate:v15];

    double v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
    v339[0] = v16;
    double v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
    v339[1] = v17;
    double v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"filename" ascending:1];
    v339[2] = v18;
    v251 = [MEMORY[0x1E4F1C978] arrayWithObjects:v339 count:3];

    [v261 setInternalSortDescriptors:v251];
    double v19 = [MEMORY[0x1E4F38EB8] fetchAssetsForPerson:v260 options:v261];
    v263 = [v19 fetchedObjects];
    v243 = v19;
    if (v262)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v316[3] >= 0.01)
      {
        v316[3] = Current;
        char v313 = 0;
        v262[2](v262, &v313, 0.5);
        char v21 = *((unsigned char *)v320 + 24) | v313;
        *((unsigned char *)v320 + 24) = v21;
        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v343 = 67;
            *(_WORD *)&v343[4] = 2080;
            *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurationManager+People.m";
            double v22 = MEMORY[0x1E4F14500];
LABEL_19:
            _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
    }
    uint64_t v23 = [v263 count];
    if (!v23)
    {
      double v8 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_265;
    }
    if (v262)
    {
      double v24 = CFAbsoluteTimeGetCurrent();
      if (v24 - v316[3] >= 0.01)
      {
        v316[3] = v24;
        char v313 = 0;
        v262[2](v262, &v313, 0.5);
        char v25 = *((unsigned char *)v320 + 24) | v313;
        *((unsigned char *)v320 + 24) = v25;
        if (v25)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v343 = 75;
            *(_WORD *)&v343[4] = 2080;
            *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurationManager+People.m";
            double v22 = MEMORY[0x1E4F14500];
            goto LABEL_19;
          }
LABEL_20:
          double v8 = 0;
LABEL_265:

          goto LABEL_266;
        }
      }
    }
    v235 = (char *)[(id)objc_opt_class() maximumNumberOfItemsForDuration:4 withTotalNumberOfItems:v23];
    unint64_t v224 = [(id)objc_opt_class() minimumNumberOfItemsForDuration:4 withMaximumNumberOfItems:v235];
    v266 = [MEMORY[0x1E4F1CA48] array];
    for (uint64_t i = 0; i != v23; ++i)
    {
      uint64_t v27 = (void *)MEMORY[0x1D25FED50]();
      double v28 = [v263 objectAtIndexedSubscript:i];
      if ([v28 isFavorite]) {
        [v266 addObject:v28];
      }
    }
    if (v262)
    {
      double v29 = CFAbsoluteTimeGetCurrent();
      if (v29 - v316[3] >= 0.01)
      {
        v316[3] = v29;
        char v313 = 0;
        v262[2](v262, &v313, 0.5);
        char v30 = *((unsigned char *)v320 + 24) | v313;
        *((unsigned char *)v320 + 24) = v30;
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v343 = 92;
            *(_WORD *)&v343[4] = 2080;
            *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurationManager+People.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          double v8 = 0;
          goto LABEL_264;
        }
      }
    }
    uint64_t v31 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v338[0] = v31;
    uint64_t v32 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:1];
    v338[1] = v32;
    double v33 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"estimatedAssetCount" ascending:0];
    v338[2] = v33;
    v238 = [MEMORY[0x1E4F1C978] arrayWithObjects:v338 count:3];

    double v34 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:v258 orObject:0];
    [v34 setSortDescriptors:v238];
    uint64_t v35 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"estimatedAssetCount >= 10"];
    [v34 setPredicate:v35];
    v237 = v34;

    long long v36 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAssets:v263 withType:3 options:v34];
    long long v37 = [v36 fetchedObjects];

    if (v262)
    {
      double v38 = CFAbsoluteTimeGetCurrent();
      if (v38 - v316[3] >= 0.01)
      {
        v316[3] = v38;
        char v313 = 0;
        v262[2](v262, &v313, 0.5);
        char v39 = *((unsigned char *)v320 + 24) | v313;
        *((unsigned char *)v320 + 24) = v39;
        if (v39)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v343 = 105;
            *(_WORD *)&v343[4] = 2080;
            *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurationManager+People.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          double v8 = 0;
          goto LABEL_263;
        }
      }
    }
    unint64_t v40 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:v258 orObject:0];
    [v40 setSortDescriptors:v238];
    v230 = v40;
    BOOL v41 = (void *)MEMORY[0x1E4F38EE8];
    long long v42 = [v263 firstObject];
    v337[0] = v42;
    id v43 = [v263 lastObject];
    v337[1] = v43;
    uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v337 count:2];
    v229 = [v41 fetchAssetCollectionsContainingAssets:v44 withType:3 options:v230];

    v234 = [v229 firstObject];
    v233 = [v229 lastObject];
    unint64_t v45 = [v37 count];
    if (!v45) {
      goto LABEL_45;
    }
    uint64_t v46 = [v37 firstObject];
    long long v47 = [v46 localIdentifier];
    long long v48 = [v234 localIdentifier];
    int v49 = [v47 isEqualToString:v48];

    if (v49)
    {
      unint64_t v50 = v45 - 1;
      if (v45 == 1)
      {
        id v231 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_50;
      }
      uint64_t v51 = 1;
    }
    else
    {
      uint64_t v51 = 0;
      unint64_t v50 = v45;
    }
    id v52 = [v37 lastObject];
    uint64_t v53 = [v52 localIdentifier];
    unint64_t v54 = [v233 localIdentifier];
    unsigned int v55 = [v53 isEqualToString:v54];

    unint64_t v56 = v50 - v55;
    if (v45 == v56)
    {
LABEL_45:
      id v231 = v37;
LABEL_51:
      if (v262)
      {
        double v57 = CFAbsoluteTimeGetCurrent();
        if (v57 - v316[3] >= 0.01)
        {
          v316[3] = v57;
          char v313 = 0;
          v262[2](v262, &v313, 0.5);
          char v58 = *((unsigned char *)v320 + 24) | v313;
          *((unsigned char *)v320 + 24) = v58;
          if (v58)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 131;
              *(_WORD *)&v343[4] = 2080;
              *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            double v8 = 0;
            goto LABEL_262;
          }
        }
      }
      uint64_t v59 = [(PGCurationManager *)self _filteredAssetsForAssets:v263 inMoments:v231 keepFavorites:1];
      v227 = (void *)[v59 mutableCopy];

      uint64_t v60 = objc_msgSend(v234, "cls_universalEndDate");
      [v60 timeIntervalSinceReferenceDate];
      double v62 = v61;

      long long v63 = objc_msgSend(v233, "cls_universalStartDate");
      [v63 timeIntervalSinceReferenceDate];
      double v65 = v64;

      v250 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v264 = [v266 count];
      v253 = [MEMORY[0x1E4F1CA48] array];
      v232 = [v266 firstObject];
      if (v232
        && ([v232 creationDate],
            long long v66 = objc_claimAutoreleasedReturnValue(),
            [v66 timeIntervalSinceReferenceDate],
            BOOL v68 = v67 > v62,
            v66,
            !v68))
      {
        [v253 addObject:v232];
        long long v312 = 0u;
        long long v311 = 0u;
        long long v310 = 0u;
        long long v309 = 0u;
        id v69 = v266;
        uint64_t v77 = [v69 countByEnumeratingWithState:&v309 objects:v336 count:16];
        if (v77)
        {
          uint64_t v78 = *(void *)v310;
LABEL_70:
          uint64_t v79 = 0;
          while (1)
          {
            if (*(void *)v310 != v78) {
              objc_enumerationMutation(v69);
            }
            uint64_t v80 = *(void **)(*((void *)&v309 + 1) + 8 * v79);
            uint64_t v81 = [v80 creationDate];
            [v81 timeIntervalSinceReferenceDate];
            BOOL v83 = v82 > v62;

            if (v83) {
              break;
            }
            [v250 addObject:v80];
            if (v77 == ++v79)
            {
              uint64_t v77 = [v69 countByEnumeratingWithState:&v309 objects:v336 count:16];
              if (v77) {
                goto LABEL_70;
              }
              break;
            }
          }
        }
      }
      else
      {
        long long v307 = 0u;
        long long v308 = 0u;
        long long v305 = 0u;
        long long v306 = 0u;
        id v69 = v263;
        uint64_t v70 = [v69 countByEnumeratingWithState:&v305 objects:v335 count:16];
        if (v70)
        {
          uint64_t v71 = *(void *)v306;
LABEL_61:
          uint64_t v72 = 0;
          while (1)
          {
            if (*(void *)v306 != v71) {
              objc_enumerationMutation(v69);
            }
            uint64_t v73 = *(void **)(*((void *)&v305 + 1) + 8 * v72);
            uint64_t v74 = [v73 creationDate];
            [v74 timeIntervalSinceReferenceDate];
            BOOL v76 = v75 > v62;

            if (v76) {
              break;
            }
            [v253 addObject:v73];
            if (v70 == ++v72)
            {
              uint64_t v70 = [v69 countByEnumeratingWithState:&v305 objects:v335 count:16];
              if (v70) {
                goto LABEL_61;
              }
              break;
            }
          }
        }
      }

      if (v262)
      {
        double v84 = CFAbsoluteTimeGetCurrent();
        if (v84 - v316[3] >= 0.01)
        {
          v316[3] = v84;
          char v313 = 0;
          v262[2](v262, &v313, 0.5);
          char v85 = *((unsigned char *)v320 + 24) | v313;
          *((unsigned char *)v320 + 24) = v85;
          if (v85)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 170;
              *(_WORD *)&v343[4] = 2080;
              *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            double v8 = 0;
            goto LABEL_261;
          }
        }
      }
      v244 = [MEMORY[0x1E4F1CA48] array];
      v228 = [v266 lastObject];
      if (v228
        && ([v228 creationDate],
            id v86 = objc_claimAutoreleasedReturnValue(),
            [v86 timeIntervalSinceReferenceDate],
            BOOL v88 = v87 < v65,
            v86,
            !v88))
      {
        [v244 addObject:v228];
        long long v303 = 0u;
        long long v304 = 0u;
        long long v301 = 0u;
        long long v302 = 0u;
        uint64_t v89 = [v266 reverseObjectEnumerator];
        uint64_t v97 = [v89 countByEnumeratingWithState:&v301 objects:v334 count:16];
        if (v97)
        {
          uint64_t v98 = *(void *)v302;
LABEL_95:
          uint64_t v99 = 0;
          while (1)
          {
            if (*(void *)v302 != v98) {
              objc_enumerationMutation(v89);
            }
            v100 = *(void **)(*((void *)&v301 + 1) + 8 * v99);
            v101 = [v100 creationDate];
            [v101 timeIntervalSinceReferenceDate];
            BOOL v103 = v102 < v62;

            if (v103) {
              break;
            }
            [v250 addObject:v100];
            if (v97 == ++v99)
            {
              uint64_t v97 = [v89 countByEnumeratingWithState:&v301 objects:v334 count:16];
              if (v97) {
                goto LABEL_95;
              }
              break;
            }
          }
        }
      }
      else
      {
        long long v299 = 0u;
        long long v300 = 0u;
        long long v297 = 0u;
        long long v298 = 0u;
        uint64_t v89 = [v263 reverseObjectEnumerator];
        uint64_t v90 = [v89 countByEnumeratingWithState:&v297 objects:v333 count:16];
        if (v90)
        {
          uint64_t v91 = *(void *)v298;
LABEL_86:
          uint64_t v92 = 0;
          while (1)
          {
            if (*(void *)v298 != v91) {
              objc_enumerationMutation(v89);
            }
            unint64_t v93 = *(void **)(*((void *)&v297 + 1) + 8 * v92);
            uint64_t v94 = [v93 creationDate];
            [v94 timeIntervalSinceReferenceDate];
            BOOL v96 = v95 < v65;

            if (v96) {
              break;
            }
            [v244 addObject:v93];
            if (v90 == ++v92)
            {
              uint64_t v90 = [v89 countByEnumeratingWithState:&v297 objects:v333 count:16];
              if (v90) {
                goto LABEL_86;
              }
              break;
            }
          }
        }
      }

      if ([v250 count]) {
        [v227 removeObjectsInArray:v250];
      }
      if (v262)
      {
        double v104 = CFAbsoluteTimeGetCurrent();
        if (v104 - v316[3] >= 0.01)
        {
          v316[3] = v104;
          char v313 = 0;
          v262[2](v262, &v313, 0.5);
          char v105 = *((unsigned char *)v320 + 24) | v313;
          *((unsigned char *)v320 + 24) = v105;
          if (v105)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 203;
              *(_WORD *)&v343[4] = 2080;
              *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            double v8 = 0;
            goto LABEL_260;
          }
        }
      }
      if ((unint64_t)v235 <= 1) {
        uint64_t v106 = 0;
      }
      else {
        uint64_t v106 = v235 - 2;
      }
      v223 = [(PGCurationManager *)self _timeBasedAssetClustersForAssets:v227 maximumClusterCount:v106];
      if (v262)
      {
        double v107 = CFAbsoluteTimeGetCurrent();
        if (v107 - v316[3] >= 0.01)
        {
          v316[3] = v107;
          char v313 = 0;
          v262[2](v262, &v313, 0.5);
          char v108 = *((unsigned char *)v320 + 24) | v313;
          *((unsigned char *)v320 + 24) = v108;
          if (v108)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 207;
              *(_WORD *)&v343[4] = 2080;
              *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            double v8 = 0;
            goto LABEL_259;
          }
        }
      }
      v242 = [MEMORY[0x1E4F1CA48] array];
      v226 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:v258 orObject:0];
      uint64_t v332 = *MEMORY[0x1E4F39618];
      uint64_t v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v332 count:1];
      [v226 setFetchPropertySets:v109];

      [v226 setIncludedDetectionTypes:&unk_1F28D4518];
      uint64_t v110 = (void *)MEMORY[0x1E4F28F60];
      v111 = [v260 objectID];
      uint64_t v112 = [v110 predicateWithFormat:@"%K = %@", @"personForFace", v111];
      [v226 setInternalPredicate:v112];

      uint64_t v113 = [MEMORY[0x1E4F39050] fetchFacesGroupedByAssetLocalIdentifierForAssets:v263 options:v226];
      uint64_t v114 = [(PGCurationManager *)self _firstBestFacedAssetInAssetCluster:v253 facesByAssetIdentifiers:v113];
      v222 = (void *)v114;
      if (v114)
      {
        [v242 addObject:v114];
      }
      else
      {
        v115 = [(PGCurationManager *)self curationLoggingConnection];
        if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v343 = v253;
          _os_log_impl(&dword_1D1805000, v115, OS_LOG_TYPE_INFO, "nil asset from first asset cluster: %@", buf, 0xCu);
        }
      }
      if (v262)
      {
        double v116 = CFAbsoluteTimeGetCurrent();
        if (v116 - v316[3] >= 0.01)
        {
          v316[3] = v116;
          char v313 = 0;
          v262[2](v262, &v313, 0.5);
          char v117 = *((unsigned char *)v320 + 24) | v313;
          *((unsigned char *)v320 + 24) = v117;
          if (v117)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 230;
              *(_WORD *)&v343[4] = 2080;
              *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
LABEL_179:
            double v8 = 0;
LABEL_258:

LABEL_259:
LABEL_260:

LABEL_261:
LABEL_262:

            long long v37 = v231;
LABEL_263:

LABEL_264:
            goto LABEL_265;
          }
        }
      }
      long long v295 = 0u;
      long long v296 = 0u;
      long long v293 = 0u;
      long long v294 = 0u;
      id obj = v223;
      uint64_t v118 = [obj countByEnumeratingWithState:&v293 objects:v331 count:16];
      if (v118)
      {
        uint64_t v119 = 0;
        uint64_t v245 = *(void *)v294;
        double v120 = *MEMORY[0x1E4F8E750];
        do
        {
          uint64_t v247 = v118;
          for (uint64_t j = 0; j != v247; ++j)
          {
            if (*(void *)v294 != v245) {
              objc_enumerationMutation(obj);
            }
            long long v122 = *(void **)(*((void *)&v293 + 1) + 8 * j);
            if (v262)
            {
              double v123 = CFAbsoluteTimeGetCurrent();
              if (v123 - v316[3] >= 0.01)
              {
                v316[3] = v123;
                char v313 = 0;
                v262[2](v262, &v313, 0.5);
                char v124 = *((unsigned char *)v320 + 24) | v313;
                *((unsigned char *)v320 + 24) = v124;
                if (v124)
                {
                  char v155 = MEMORY[0x1E4F14500];
                  id v156 = MEMORY[0x1E4F14500];
                  if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v343 = 237;
                    *(_WORD *)&v343[4] = 2080;
                    *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Curation/PGCurationManager+People.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  goto LABEL_178;
                }
              }
            }
            if (v119 >= v264)
            {
LABEL_144:
              if (v262)
              {
                double v138 = CFAbsoluteTimeGetCurrent();
                if (v138 - v316[3] >= 0.01)
                {
                  v316[3] = v138;
                  char v313 = 0;
                  v262[2](v262, &v313, 0.5);
                  char v139 = *((unsigned char *)v320 + 24) | v313;
                  *((unsigned char *)v320 + 24) = v139;
                  if (v139)
                  {
                    v157 = MEMORY[0x1E4F14500];
                    id v158 = MEMORY[0x1E4F14500];
                    if (os_log_type_enabled(v157, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v343 = 264;
                      *(_WORD *)&v343[4] = 2080;
                      *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Curation/PGCurationManager+People.m";
                      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }
LABEL_178:

                    goto LABEL_179;
                  }
                }
              }
              long long v291 = 0u;
              long long v292 = 0u;
              long long v289 = 0u;
              long long v290 = 0u;
              id v130 = v122;
              uint64_t v140 = [v130 countByEnumeratingWithState:&v289 objects:v330 count:16];
              if (v140)
              {
                uint64_t v141 = *(void *)v290;
                while (2)
                {
                  for (uint64_t k = 0; k != v140; ++k)
                  {
                    if (*(void *)v290 != v141) {
                      objc_enumerationMutation(v130);
                    }
                    v143 = *(void **)(*((void *)&v289 + 1) + 8 * k);
                    [v143 curationScore];
                    if (v144 != v120)
                    {
                      uint64_t v145 = [v143 localIdentifier];
                      char v146 = [v113 objectForKeyedSubscript:v145];
                      memset(v288, 0, sizeof(v288));
                      id v147 = v146;
                      if ([v147 countByEnumeratingWithState:v288 objects:v329 count:16])
                      {
                        [**((id **)&v288[0] + 1) size];
                        if (v148 >= 0.1 && v148 <= 0.7)
                        {
                          [v242 addObject:v143];

                          goto LABEL_161;
                        }
                      }
                    }
                  }
                  uint64_t v140 = [v130 countByEnumeratingWithState:&v289 objects:v330 count:16];
                  if (v140) {
                    continue;
                  }
                  break;
                }
              }
            }
            else
            {
              long long v125 = [v122 firstObject];
              v126 = [v125 creationDate];
              [v126 timeIntervalSinceReferenceDate];
              double v128 = v127;

              long long v129 = 0;
              while (1)
              {
                id v130 = [v266 objectAtIndexedSubscript:v119];

                long long v131 = [v130 creationDate];
                [v131 timeIntervalSinceReferenceDate];
                double v133 = v132;

                if (v133 >= v128) {
                  break;
                }
                ++v119;
                long long v129 = v130;
                if (v264 == v119)
                {
                  uint64_t v119 = v264;
LABEL_143:

                  goto LABEL_144;
                }
              }
              if (!v130) {
                goto LABEL_143;
              }
              long long v134 = [v122 lastObject];
              long long v135 = [v134 creationDate];
              [v135 timeIntervalSinceReferenceDate];
              BOOL v137 = v133 > v136;

              if (v137) {
                goto LABEL_143;
              }
              [v242 addObject:v130];
            }
LABEL_161:
          }
          uint64_t v118 = [obj countByEnumeratingWithState:&v293 objects:v331 count:16];
        }
        while (v118);
      }

      unint64_t v149 = 0x1E4F29000;
      if (v262)
      {
        double v150 = CFAbsoluteTimeGetCurrent();
        if (v150 - v316[3] >= 0.01)
        {
          v316[3] = v150;
          char v313 = 0;
          v262[2](v262, &v313, 0.5);
          char v151 = *((unsigned char *)v320 + 24) | v313;
          *((unsigned char *)v320 + 24) = v151;
          if (v151)
          {
            uint64_t v152 = MEMORY[0x1E4F14500];
            id v153 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 300;
              *(_WORD *)&v343[4] = 2080;
              *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_179;
          }
        }
      }
      uint64_t v154 = [(PGCurationManager *)self _firstBestFacedAssetInAssetCluster:v244 facesByAssetIdentifiers:v113];
      if (v154)
      {
        [v242 addObject:v154];
      }
      else
      {
        v159 = [(PGCurationManager *)self curationLoggingConnection];
        if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v343 = v244;
          _os_log_impl(&dword_1D1805000, v159, OS_LOG_TYPE_INFO, "nil asset from last asset cluster: %@", buf, 0xCu);
        }
      }
      v221 = (void *)v154;
      id v160 = v242;
      if (v262
        && (double v161 = CFAbsoluteTimeGetCurrent(), v161 - v316[3] >= 0.01)
        && (v316[3] = v161,
            char v313 = 0,
            v262[2](v262, &v313, 0.5),
            char v162 = *((unsigned char *)v320 + 24) | v313,
            (*((unsigned char *)v320 + 24) = v162) != 0))
      {
        v163 = MEMORY[0x1E4F14500];
        id v164 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v343 = 314;
          *(_WORD *)&v343[4] = 2080;
          *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager+People.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        if ([v160 count] < v224)
        {
          v248 = v160;
          v265 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v235];
          v165 = (void *)[objc_alloc(MEMORY[0x1E4F8A8C8]) initWithNumericValueKeypaths:&unk_1F28D4530];
          [v165 setK:v235];
          v283[0] = MEMORY[0x1E4F143A8];
          v283[1] = 3221225472;
          v283[2] = __81__PGCurationManager_People__curatedAssetsForPersonLocalIdentifier_progressBlock___block_invoke;
          v283[3] = &unk_1E68F03F8;
          v166 = v262;
          id v284 = v166;
          v285 = &v315;
          uint64_t v287 = 0x3F847AE147AE147BLL;
          v286 = &v319;
          v220 = [v165 performWithDataset:v263 progressBlock:v283];
          v219 = v165;
          if (*((unsigned char *)v320 + 24))
          {
            v167 = MEMORY[0x1E4F14500];
            id v168 = MEMORY[0x1E4F14500];
            int v169 = 1;
            if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 327;
              *(_WORD *)&v343[4] = 2080;
              *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1D1805000, v167, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
          else
          {
            long long v281 = 0u;
            long long v282 = 0u;
            long long v279 = 0u;
            long long v280 = 0u;
            id v170 = v220;
            uint64_t v171 = [v170 countByEnumeratingWithState:&v279 objects:v328 count:16];
            if (v171)
            {
              uint64_t v172 = *(void *)v280;
              do
              {
                for (uint64_t m = 0; m != v171; ++m)
                {
                  if (*(void *)v280 != v172) {
                    objc_enumerationMutation(v170);
                  }
                  v174 = [*(id *)(*((void *)&v279 + 1) + 8 * m) objects];
                  v175 = [v174 firstObject];
                  [v265 addObject:v175];
                }
                uint64_t v171 = [v170 countByEnumeratingWithState:&v279 objects:v328 count:16];
              }
              while (v171);
            }

            v176 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
            v327 = v176;
            v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v327 count:1];
            [v265 sortUsingDescriptors:v177];

            v167 = [MEMORY[0x1E4F1CAD0] setWithArray:v160];
            v246 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSObject count](v167, "count"));
            v257 = [MEMORY[0x1E4F1CA48] array];
            long long v277 = 0u;
            long long v278 = 0u;
            long long v275 = 0u;
            long long v276 = 0u;
            id v178 = v265;
            uint64_t v179 = [v178 countByEnumeratingWithState:&v275 objects:v326 count:16];
            if (v179)
            {
              uint64_t v180 = *(void *)v276;
              do
              {
                for (uint64_t n = 0; n != v179; ++n)
                {
                  if (*(void *)v276 != v180) {
                    objc_enumerationMutation(v178);
                  }
                  uint64_t v182 = *(void *)(*((void *)&v275 + 1) + 8 * n);
                  if (([v167 containsObject:v182] & 1) == 0) {
                    [v257 addObject:v182];
                  }
                }
                uint64_t v179 = [v178 countByEnumeratingWithState:&v275 objects:v326 count:16];
              }
              while (v179);
            }

            if (v262
              && (double v183 = CFAbsoluteTimeGetCurrent(), v183 - v316[3] >= 0.01)
              && (v316[3] = v183,
                  char v313 = 0,
                  v166[2](v166, &v313, 0.5),
                  char v184 = *((unsigned char *)v320 + 24) | v313,
                  (*((unsigned char *)v320 + 24) = v184) != 0))
            {
              v185 = MEMORY[0x1E4F14500];
              id v186 = MEMORY[0x1E4F14500];
              if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v343 = 349;
                *(_WORD *)&v343[4] = 2080;
                *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Curation/PGCurationManager+People.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              int v169 = 1;
            }
            else
            {
              v187 = [MEMORY[0x1E4F1CA48] array];
              v188 = [MEMORY[0x1E4F1CAD0] setWithArray:v178];
              long long v273 = 0u;
              long long v274 = 0u;
              long long v271 = 0u;
              long long v272 = 0u;
              id v189 = v248;
              uint64_t v190 = [v189 countByEnumeratingWithState:&v271 objects:v325 count:16];
              if (v190)
              {
                uint64_t v191 = *(void *)v272;
                do
                {
                  for (iuint64_t i = 0; ii != v190; ++ii)
                  {
                    if (*(void *)v272 != v191) {
                      objc_enumerationMutation(v189);
                    }
                    uint64_t v193 = *(void *)(*((void *)&v271 + 1) + 8 * ii);
                    if (([v188 containsObject:v193] & 1) == 0) {
                      [v187 addObject:v193];
                    }
                  }
                  uint64_t v190 = [v189 countByEnumeratingWithState:&v271 objects:v325 count:16];
                }
                while (v190);
              }

              long long v269 = 0u;
              long long v270 = 0u;
              long long v267 = 0u;
              long long v268 = 0u;
              id v236 = v187;
              v194 = v257;
              uint64_t v241 = [v236 countByEnumeratingWithState:&v267 objects:v324 count:16];
              if (v241)
              {
                id obja = *(id *)v268;
LABEL_226:
                uint64_t v195 = 0;
                while (1)
                {
                  if (*(id *)v268 != obja) {
                    objc_enumerationMutation(v236);
                  }
                  v196 = *(void **)(*((void *)&v267 + 1) + 8 * v195);
                  if (![v194 count]) {
                    break;
                  }
                  uint64_t v197 = objc_msgSend(v194, "indexOfObject:inSortedRange:options:usingComparator:", v196, 0, objc_msgSend(v194, "count"), 1024, &__block_literal_global_44410);
                  v249 = [v196 creationDate];
                  if (v197)
                  {
                    uint64_t v198 = v197 - 1;
                    if (v197 != [v257 count])
                    {
                      v225 = [v257 objectAtIndexedSubscript:v197 - 1];
                      v199 = [v225 creationDate];
                      [v249 timeIntervalSinceDate:v199];
                      double v201 = v200;

                      v202 = [v257 objectAtIndexedSubscript:v197];
                      v203 = [v202 creationDate];
                      [v203 timeIntervalSinceDate:v249];
                      double v205 = v204;

                      if (v201 >= v205) {
                        uint64_t v198 = v197;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v198 = 0;
                  }
                  v206 = [v257 objectAtIndexedSubscript:v198];
                  [v257 removeObjectAtIndex:v198];
                  [v246 addObject:v206];

                  ++v195;
                  v194 = v257;
                  if (v241 == v195)
                  {
                    uint64_t v241 = [v236 countByEnumeratingWithState:&v267 objects:v324 count:16];
                    if (v241) {
                      goto LABEL_226;
                    }
                    break;
                  }
                }
              }

              [v178 removeObjectsInArray:v246];
              [v178 addObjectsFromArray:v236];
              v248 = (void *)[v178 mutableCopy];

              int v169 = 0;
            }
          }
          if (v169)
          {
            double v8 = 0;
            id v207 = v248;
LABEL_257:

            goto LABEL_258;
          }
          unint64_t v149 = 0x1E4F29000uLL;
          id v160 = v248;
        }
        if (!v262
          || (double v208 = CFAbsoluteTimeGetCurrent(), v208 - v316[3] < 0.01)
          || (v316[3] = v208,
              char v313 = 0,
              v262[2](v262, &v313, 0.5),
              char v209 = *((unsigned char *)v320 + 24) | v313,
              (*((unsigned char *)v320 + 24) = v209) == 0))
        {
          v212 = [*(id *)(v149 + 8) sortDescriptorWithKey:@"creationDate" ascending:1];
          v323 = v212;
          v213 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v323 count:1];
          [v160 sortUsingDescriptors:v213];

          if (v262
            && (double v214 = CFAbsoluteTimeGetCurrent(), v214 - v316[3] >= 0.01)
            && (v316[3] = v214,
                char v313 = 0,
                v262[2](v262, &v313, 1.0),
                char v215 = *((unsigned char *)v320 + 24) | v313,
                (*((unsigned char *)v320 + 24) = v215) != 0))
          {
            v216 = MEMORY[0x1E4F14500];
            id v217 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v343 = 410;
              *(_WORD *)&v343[4] = 2080;
              *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurationManager+People.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            double v8 = 0;
            id v207 = v160;
          }
          else
          {
            id v207 = v160;
            double v8 = v207;
          }
          goto LABEL_257;
        }
        v210 = MEMORY[0x1E4F14500];
        id v211 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v210, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v343 = 403;
          *(_WORD *)&v343[4] = 2080;
          *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurationManager+People.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      double v8 = 0;
      id v207 = v160;
      goto LABEL_257;
    }
    id v231 = (id)MEMORY[0x1E4F1CBF0];
    if (v56 && v56 + v51 <= v45)
    {
      id v231 = [v37 subarrayWithRange:v51];

      long long v37 = v231;
    }
LABEL_50:

    goto LABEL_51;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v343 = 37;
    *(_WORD *)&v343[4] = 2080;
    *(void *)&v343[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Curation/PGCurationManager+People.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  double v8 = 0;
LABEL_267:
  _Block_object_dispose(&v315, 8);
  _Block_object_dispose(&v319, 8);

  return v8;
}

void __81__PGCurationManager_People__curatedAssetsForPersonLocalIdentifier_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

uint64_t __81__PGCurationManager_People__curatedAssetsForPersonLocalIdentifier_progressBlock___block_invoke_304(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 creationDate];
  double v6 = [v4 creationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)_filterAssets:(id)a3 withPositiveLocations:(id)a4 negativeLocations:(id)a5 maximumDistance:(double)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v34 = a4;
  id v10 = a5;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        double v16 = [v15 location];
        if (v16)
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v17 = v34;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v40;
            double v21 = 1.79769313e308;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v40 != v20) {
                  objc_enumerationMutation(v17);
                }
                [v16 distanceFromLocation:*(void *)(*((void *)&v39 + 1) + 8 * j)];
                if (v23 < v21) {
                  double v21 = v23;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v48 count:16];
            }
            while (v19);
          }
          else
          {
            double v21 = 1.79769313e308;
          }

          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v24 = v10;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v36;
            double v28 = 1.79769313e308;
            do
            {
              for (uint64_t k = 0; k != v26; ++k)
              {
                if (*(void *)v36 != v27) {
                  objc_enumerationMutation(v24);
                }
                [v16 distanceFromLocation:*(void *)(*((void *)&v35 + 1) + 8 * k)];
                if (v30 < v28) {
                  double v28 = v30;
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
            }
            while (v26);
          }
          else
          {
            double v28 = 1.79769313e308;
          }

          if (v21 < a6 && v21 <= v28) {
            [v32 addObject:v15];
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v12);
  }

  return v32;
}

+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forLocationNodes:(id)a5 withMaximumDistance:(double)a6
{
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [a4 addressNodes];
  uint64_t v13 = [v10 addressNodes];

  double v14 = [v12 collectionByIntersecting:v13];
  double v15 = [v12 collectionBySubtracting:v13];
  double v16 = [v14 locations];
  id v17 = [v15 locations];
  uint64_t v18 = [a1 _filterAssets:v11 withPositiveLocations:v16 negativeLocations:v17 maximumDistance:a6];

  return v18;
}

+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forStateNodes:(id)a5 withMaximumDistance:(double)a6
{
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [a4 addressNodes];
  uint64_t v13 = [v10 addressNodes];

  double v14 = [v12 collectionByIntersecting:v13];
  double v15 = [v12 collectionBySubtracting:v13];
  double v16 = [v14 locations];
  id v17 = [v15 locations];
  uint64_t v18 = [a1 _filterAssets:v11 withPositiveLocations:v16 negativeLocations:v17 maximumDistance:a6];

  return v18;
}

+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forAreaNodes:(id)a5 withMaximumDistance:(double)a6
{
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [a4 addressNodes];
  uint64_t v13 = [v10 addressNodes];

  double v14 = [v12 collectionByIntersecting:v13];
  double v15 = [v12 collectionBySubtracting:v13];
  double v16 = [v14 locations];
  id v17 = [v15 locations];
  uint64_t v18 = [a1 _filterAssets:v11 withPositiveLocations:v16 negativeLocations:v17 maximumDistance:a6];

  return v18;
}

+ (id)filterAssets:(id)a3 inMomentNodes:(id)a4 forCityNodes:(id)a5 withMaximumDistance:(double)a6
{
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [a4 addressNodes];
  uint64_t v13 = [v10 addressNodes];

  double v14 = [v12 collectionByIntersecting:v13];
  double v15 = [v12 collectionBySubtracting:v13];
  double v16 = [v14 locations];
  id v17 = [v15 locations];
  uint64_t v18 = [a1 _filterAssets:v11 withPositiveLocations:v16 negativeLocations:v17 maximumDistance:a6];

  return v18;
}

+ (id)filterAssets:(id)a3 withLocation:(id)a4 maximumDistance:(double)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  double v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 arrayWithObjects:&v14 count:1];

  uint64_t v12 = objc_msgSend(a1, "filterAssets:withLocations:maximumDistance:", v10, v11, a5, v14, v15);

  return v12;
}

+ (id)filterAssets:(id)a3 withLocations:(id)a4 maximumDistance:(double)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "location", v22);
        if (v14)
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v15 = v8;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v25;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v25 != v18) {
                  objc_enumerationMutation(v15);
                }
                [v14 distanceFromLocation:*(void *)(*((void *)&v24 + 1) + 8 * j)];
                if (v20 < a5)
                {
                  [v22 addObject:v13];
                  goto LABEL_17;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  return v22;
}

@end