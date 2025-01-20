@interface PNDetailsViewSampler
+ (id)_assetObjectIDsFromClusters:(id)a3 facesByAssetIdentifiers:(id)a4 includeExtraAssets:(unint64_t)a5;
+ (id)_logger;
+ (id)_timeBasedAssetClustersForAssets:(id)a3 maximumClusterCount:(unint64_t)a4 photoLibrary:(id)a5;
+ (id)fetchMovieAssetsForPerson:(id)a3 options:(id)a4;
+ (id)fetchMovieAssetsForSocialGroup:(id)a3 options:(id)a4;
+ (unint64_t)_maximumNumberOfClustersForCuratedAssetCount:(unint64_t)a3 fetchLimit:(unint64_t)a4;
@end

@implementation PNDetailsViewSampler

+ (id)_logger
{
  if (_logger_onceToken_3540 != -1) {
    dispatch_once(&_logger_onceToken_3540, &__block_literal_global_3541);
  }
  v2 = (void *)_logger__log_3542;
  return v2;
}

uint64_t __31__PNDetailsViewSampler__logger__block_invoke()
{
  os_log_t v0 = os_log_create((const char *)*MEMORY[0x263F5DBE0], "DetailsViewSampler");
  uint64_t v2 = _logger__log_3542;
  _logger__log_3542 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v2, v1);
}

+ (id)_assetObjectIDsFromClusters:(id)a3 facesByAssetIdentifiers:(id)a4 includeExtraAssets:(unint64_t)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v33 = a4;
  v9 = [a1 _logger];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "assetObjectIDsFromClusters", "", buf, 2u);
  }
  v31 = v12;

  uint64_t v30 = mach_absolute_time();
  v13 = [MEMORY[0x263EFF980] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __95__PNDetailsViewSampler__assetObjectIDsFromClusters_facesByAssetIdentifiers_includeExtraAssets___block_invoke;
        v34[3] = &unk_26544F4B8;
        id v35 = v33;
        v19 = [v18 sortedArrayUsingComparator:v34];
        v20 = [v19 firstObject];
        v21 = [v20 objectID];
        [v13 addObject:v21];

        if (a5 && (unint64_t)[v19 count] >= 2)
        {
          v22 = [v19 objectAtIndexedSubscript:1];
          v23 = [v22 objectID];
          [v13 addObject:v23];

          --a5;
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v15);
  }

  uint64_t v24 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v27 = v31;
  v28 = v27;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v28, OS_SIGNPOST_INTERVAL_END, v10, "assetObjectIDsFromClusters", "", buf, 2u);
  }

  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "assetObjectIDsFromClusters";
    __int16 v43 = 2048;
    double v44 = (float)((float)((float)((float)(v24 - v30) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v13;
}

uint64_t __95__PNDetailsViewSampler__assetObjectIDsFromClusters_facesByAssetIdentifiers_includeExtraAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 isFavorite];
  if (v7 == [v6 isFavorite])
  {
    [v5 localIdentifier];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v31 = long long v39 = 0u;
    v9 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
    uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * i) size];
          uint64_t v16 = v15 <= 0.7 && v15 >= 0.1;
          v12 += v16;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
    }

    v17 = [v6 localIdentifier];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:v17];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v33;
      v23 = (void *)v31;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * j) size];
          uint64_t v26 = v25 <= 0.7 && v25 >= 0.1;
          v21 += v26;
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = 0;
      v23 = (void *)v31;
    }

    if (v12 == v21)
    {
      [v5 curationScore];
      double v28 = v27;
      [v6 curationScore];
      if (v28 == v29) {
        uint64_t v8 = [v23 compare:v17];
      }
      else {
        uint64_t v8 = v28 < v29;
      }
    }
    else
    {
      uint64_t v8 = v12 > v21;
    }
  }
  else if (v7)
  {
    uint64_t v8 = -1;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

+ (unint64_t)_maximumNumberOfClustersForCuratedAssetCount:(unint64_t)a3 fetchLimit:(unint64_t)a4
{
  unint64_t v6 = (unint64_t)pow((double)a3, 0.8);
  if (v6 >= 0x50) {
    unint64_t v6 = 80;
  }
  if (v6 <= 6) {
    unint64_t v6 = 6;
  }
  if (v6 >= a3) {
    unint64_t v6 = a3;
  }
  if (v6 >= a4) {
    unint64_t v7 = a4;
  }
  else {
    unint64_t v7 = v6;
  }
  if (a4) {
    return v7;
  }
  else {
    return v6;
  }
}

+ (id)_timeBasedAssetClustersForAssets:(id)a3 maximumClusterCount:(unint64_t)a4 photoLibrary:(id)a5
{
  v104[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v9 = [a1 _logger];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v11 = v9;
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "timeBasedAssetClustersForAssets", "", buf, 2u);
  }

  uint64_t v76 = mach_absolute_time();
  uint64_t v13 = [MEMORY[0x263EFF980] arrayWithCapacity:a4];
  uint64_t v14 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:a4];
  double v15 = [v7 firstObject];
  uint64_t v16 = [v15 creationDate];

  v17 = [v7 lastObject];
  uint64_t v18 = [v17 creationDate];

  v77 = (void *)v18;
  if (!v16 || !v18)
  {
    v104[0] = v7;
    v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:1];
    goto LABEL_61;
  }
  uint64_t v19 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v16 endDate:v18];
  if (!v19)
  {
    id v103 = v7;
    uint64_t v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v103 count:1];
    v66 = 0;
    v54 = (void *)v67;
    goto LABEL_60;
  }
  unint64_t v71 = v10 - 1;
  v72 = v16;
  os_signpost_id_t spid = v10;
  v73 = v12;
  id v74 = v8;
  uint64_t v20 = v13;
  [v13 addObject:v19];
  id v75 = v7;
  v70 = (void *)v19;
  [v14 setObject:v7 forKeyedSubscript:v19];
  v79 = v13;
  if ([v13 count] >= a4) {
    goto LABEL_45;
  }
  uint64_t v21 = 0;
  do
  {
    if (v21 == [v20 count]) {
      break;
    }
    context = (void *)MEMORY[0x25A2E0AC0]();
    uint64_t v22 = [v20 count];
    if (v22 < 1)
    {
      uint64_t v21 = 0;
      goto LABEL_44;
    }
    uint64_t v23 = v22;
    uint64_t v21 = 0;
    while (1)
    {
      uint64_t v24 = v23 - 1;
      double v25 = [v20 objectAtIndexedSubscript:v23 - 1];
      uint64_t v26 = [v25 startDate];
      double v27 = [v25 endDate];
      [v25 duration];
      double v29 = v28;
      uint64_t v30 = [v14 objectForKeyedSubscript:v25];
      if ((unint64_t)[v30 count] >= 2 && v29 >= 21600.0) {
        break;
      }
      ++v21;
LABEL_39:

      BOOL v53 = v23 <= 1;
      uint64_t v23 = v24;
      if (v53) {
        goto LABEL_44;
      }
    }
    uint64_t v84 = v21;
    double v31 = v29 * 0.5;
    uint64_t v86 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v26 duration:v31];
    uint64_t v32 = [v26 dateByAddingTimeInterval:v31 + 2.22044605e-16];
    v82 = v27;
    uint64_t v87 = [objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v32 endDate:v27];
    v83 = v26;
    [v26 timeIntervalSinceReferenceDate];
    double v34 = v33;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    v81 = v30;
    id v35 = v30;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v92 objects:v102 count:16];
    v85 = (void *)v32;
    if (!v36)
    {
      uint64_t v46 = v20;

      uint64_t v24 = v23 - 1;
      if (v31 >= 1.0) {
        goto LABEL_35;
      }
LABEL_31:
      uint64_t v42 = 1;
      goto LABEL_33;
    }
    uint64_t v37 = v36;
    uint64_t v38 = 0;
    double v39 = v31 + v34;
    uint64_t v40 = *(void *)v93;
    while (2)
    {
      uint64_t v41 = 0;
      uint64_t v42 = v38 + v37;
      do
      {
        if (*(void *)v93 != v40) {
          objc_enumerationMutation(v35);
        }
        __int16 v43 = [*(id *)(*((void *)&v92 + 1) + 8 * v41) creationDate];
        [v43 timeIntervalSinceReferenceDate];
        double v45 = v44;

        if (v45 > v39)
        {
          uint64_t v42 = v38 + v41;
          goto LABEL_25;
        }
        ++v41;
      }
      while (v37 != v41);
      uint64_t v37 = [v35 countByEnumeratingWithState:&v92 objects:v102 count:16];
      uint64_t v38 = v42;
      if (v37) {
        continue;
      }
      break;
    }
LABEL_25:

    if (v31 >= 1.0)
    {
      uint64_t v46 = v79;
      uint64_t v24 = v23 - 1;
      if (!v42) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v46 = v79;
      uint64_t v24 = v23 - 1;
      if (!v42) {
        goto LABEL_31;
      }
      if (v42 == [v35 count] && !--v42)
      {
LABEL_35:
        uint64_t v20 = v46;
        v49 = (void *)v87;
        [v46 setObject:v87 atIndexedSubscript:v24];
        [v14 setObject:v35 forKeyedSubscript:v87];
        v48 = (void *)v86;
        goto LABEL_37;
      }
    }
LABEL_33:
    uint64_t v47 = [v35 count];
    v48 = (void *)v86;
    [v46 setObject:v86 atIndexedSubscript:v24];
    if (v42 == v47)
    {
      [v14 setObject:v35 forKeyedSubscript:v86];
      uint64_t v20 = v46;
      v49 = (void *)v87;
    }
    else
    {
      [v46 insertObject:v87 atIndex:v23];
      v50 = objc_msgSend(v35, "subarrayWithRange:", 0, v42);
      [v14 setObject:v50 forKeyedSubscript:v86];

      v51 = objc_msgSend(v35, "subarrayWithRange:", v42, objc_msgSend(v35, "count") - v42);
      v49 = (void *)v87;
      [v14 setObject:v51 forKeyedSubscript:v87];

      uint64_t v20 = v46;
    }
LABEL_37:
    [v14 setObject:0 forKeyedSubscript:v25];
    unint64_t v52 = [v20 count];

    if (v52 < a4)
    {
      double v27 = v82;
      uint64_t v26 = v83;
      uint64_t v30 = v81;
      uint64_t v21 = v84;
      goto LABEL_39;
    }

    uint64_t v21 = v84;
LABEL_44:
  }
  while ([v20 count] < a4);
LABEL_45:
  v54 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count"));
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v55 = v20;
  uint64_t v56 = [v55 countByEnumeratingWithState:&v88 objects:v101 count:16];
  id v8 = v74;
  id v7 = v75;
  uint64_t v16 = v72;
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v89 != v58) {
          objc_enumerationMutation(v55);
        }
        v60 = [v14 objectForKeyedSubscript:*(void *)(*((void *)&v88 + 1) + 8 * i)];
        [v54 addObject:v60];
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v88 objects:v101 count:16];
    }
    while (v57);
  }

  uint64_t v61 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v12 = v73;
  v64 = v73;
  v65 = v64;
  if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v65, OS_SIGNPOST_INTERVAL_END, spid, "timeBasedAssetClustersForAssets", "", buf, 2u);
  }

  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v98 = "timeBasedAssetClustersForAssets";
    __int16 v99 = 2048;
    double v100 = (float)((float)((float)((float)(v61 - v76) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v65, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v13 = v79;
  v66 = v70;
LABEL_60:

LABEL_61:
  return v54;
}

+ (id)fetchMovieAssetsForSocialGroup:(id)a3 options:(id)a4
{
  v80[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v67 = a1;
  id v8 = [a1 _logger];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  os_signpost_id_t v10 = v8;
  uint64_t v11 = v10;
  unint64_t v62 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "fetchMovieAssetsForSocialGroup", "", buf, 2u);
  }
  os_signpost_id_t spid = v9;
  uint64_t v58 = v11;

  uint64_t v57 = mach_absolute_time();
  uint64_t v12 = [v7 fetchOptions];
  uint64_t v13 = (void *)[v12 copy];
  [v13 setSortDescriptors:0];
  uint64_t v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v80[0] = v14;
  double v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"addedDate" ascending:1];
  v80[1] = v15;
  uint64_t v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"uuid" ascending:1];
  v80[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:3];
  [v13 setInternalSortDescriptors:v17];

  [v13 setFetchLimit:0];
  v63 = v13;
  uint64_t v18 = +[PNPersonCurationWrapper fetchCuratedAssetsForSocialGroup:options:includeOthersInSocialGroupAssets:](PNPersonCurationWrapper, "fetchCuratedAssetsForSocialGroup:options:includeOthersInSocialGroupAssets:", v6, v13, [v7 includeOthersInSocialGroupAssets]);
  uint64_t v19 = objc_msgSend(v67, "_maximumNumberOfClustersForCuratedAssetCount:fetchLimit:", objc_msgSend(v18, "count"), objc_msgSend(v12, "fetchLimit"));
  v66 = v18;
  uint64_t v20 = [v18 fetchedObjects];
  uint64_t v21 = [v6 photoLibrary];
  uint64_t v59 = v19;
  uint64_t v61 = [v67 _timeBasedAssetClustersForAssets:v20 maximumClusterCount:v19 photoLibrary:v21];

  uint64_t v22 = [v6 photoLibrary];
  uint64_t v23 = [v22 librarySpecificFetchOptions];

  uint64_t v79 = *MEMORY[0x263F15088];
  uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
  [v23 setFetchPropertySets:v24];

  [v23 setIncludedDetectionTypes:&unk_27076A6B8];
  v60 = v23;
  double v25 = [MEMORY[0x263F14E88] fetchPersonsInSocialGroup:v6 option:v23];
  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v25, "count"));
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v27 = v25;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v70 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = [*(id *)(*((void *)&v69 + 1) + 8 * i) objectID];
        [v26 addObject:v32];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v29);
  }
  v64 = v7;

  double v33 = (void *)MEMORY[0x263F14E18];
  v65 = v6;
  double v34 = [v6 photoLibrary];
  id v35 = [v33 fetchOptionsWithPhotoLibrary:v34 orObject:0];

  [v35 setIncludedDetectionTypes:&unk_27076A6D0];
  uint64_t v36 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", @"personForFace", v26];
  [v35 setInternalPredicate:v36];

  uint64_t v37 = v58;
  os_signpost_id_t v38 = os_signpost_id_generate(v37);
  mach_timebase_info v68 = 0;
  mach_timebase_info(&v68);
  double v39 = v37;
  uint64_t v40 = v39;
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v38, "fetchFacesGroupedByAsset", "", buf, 2u);
  }

  uint64_t v41 = mach_absolute_time();
  uint64_t v42 = [MEMORY[0x263F14DF0] fetchFacesGroupedByAssetLocalIdentifierForAssets:v66 options:v35];
  uint64_t v43 = mach_absolute_time();
  uint32_t numer = v68.numer;
  uint32_t denom = v68.denom;
  uint64_t v46 = v40;
  uint64_t v47 = v46;
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v47, OS_SIGNPOST_INTERVAL_END, v38, "fetchFacesGroupedByAsset", "", buf, 2u);
  }

  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v75 = "fetchFacesGroupedByAsset";
    __int16 v76 = 2048;
    double v77 = (float)((float)((float)((float)(v43 - v41) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v48 = objc_msgSend(v67, "_assetObjectIDsFromClusters:facesByAssetIdentifiers:includeExtraAssets:", v61, v42, v59 - objc_msgSend(v61, "count"));
  v49 = [MEMORY[0x263F14D18] fetchAssetsWithObjectIDs:v48 options:v12];
  uint64_t v50 = mach_absolute_time();
  uint32_t v52 = info.numer;
  uint32_t v51 = info.denom;
  BOOL v53 = v47;
  v54 = v53;
  if (v62 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v54, OS_SIGNPOST_INTERVAL_END, spid, "fetchMovieAssetsForSocialGroup", "", buf, 2u);
  }

  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v75 = "fetchMovieAssetsForSocialGroup";
    __int16 v76 = 2048;
    double v77 = (float)((float)((float)((float)(v50 - v57) * (float)v52) / (float)v51) / 1000000.0);
    _os_log_impl(&dword_25934C000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v49;
}

+ (id)fetchMovieAssetsForPerson:(id)a3 options:(id)a4
{
  v65[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v57 = a1;
  id v8 = [a1 _logger];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  os_signpost_id_t v10 = v8;
  uint64_t v11 = v10;
  unint64_t v53 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "fetchMovieAssetsForPerson", "", buf, 2u);
  }
  os_signpost_id_t spid = v9;

  uint64_t v51 = mach_absolute_time();
  id v55 = v6;
  uint64_t v12 = [v6 fetchOptions];
  uint64_t v13 = (void *)[v12 copy];
  [v13 setSortDescriptors:0];
  uint64_t v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v65[0] = v14;
  double v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"addedDate" ascending:1];
  v65[1] = v15;
  uint64_t v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"uuid" ascending:1];
  v65[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:3];
  [v13 setInternalSortDescriptors:v17];

  [v13 setFetchLimit:0];
  uint64_t v18 = +[PNPersonCurationWrapper fetchCuratedAssetsForPerson:v7 options:v13];
  v54 = v12;
  uint64_t v19 = objc_msgSend(v57, "_maximumNumberOfClustersForCuratedAssetCount:fetchLimit:", objc_msgSend(v18, "count"), objc_msgSend(v12, "fetchLimit"));
  uint64_t v20 = [v18 fetchedObjects];
  uint64_t v21 = [v7 photoLibrary];
  uint64_t v52 = v19;
  uint64_t v56 = [v57 _timeBasedAssetClustersForAssets:v20 maximumClusterCount:v19 photoLibrary:v21];

  uint64_t v22 = (void *)MEMORY[0x263F14E18];
  uint64_t v23 = [v7 photoLibrary];
  uint64_t v24 = [v22 fetchOptionsWithPhotoLibrary:v23 orObject:0];

  uint64_t v64 = *MEMORY[0x263F15088];
  double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
  [v24 setFetchPropertySets:v25];

  [v24 setIncludedDetectionTypes:&unk_27076A6A0];
  uint64_t v26 = (void *)MEMORY[0x263F08A98];
  id v27 = [v7 objectID];

  uint64_t v28 = [v26 predicateWithFormat:@"%K = %@", @"personForFace", v27];
  [v24 setInternalPredicate:v28];

  uint64_t v29 = v11;
  os_signpost_id_t v30 = os_signpost_id_generate(v29);
  mach_timebase_info v58 = 0;
  mach_timebase_info(&v58);
  double v31 = v29;
  uint64_t v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "fetchFacesGroupedByAsset", "", buf, 2u);
  }

  uint64_t v33 = mach_absolute_time();
  double v34 = [MEMORY[0x263F14DF0] fetchFacesGroupedByAssetLocalIdentifierForAssets:v18 options:v24];
  uint64_t v35 = mach_absolute_time();
  uint32_t numer = v58.numer;
  uint32_t denom = v58.denom;
  os_signpost_id_t v38 = v32;
  double v39 = v38;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v39, OS_SIGNPOST_INTERVAL_END, v30, "fetchFacesGroupedByAsset", "", buf, 2u);
  }

  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v61 = "fetchFacesGroupedByAsset";
    __int16 v62 = 2048;
    double v63 = (float)((float)((float)((float)(v35 - v33) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v39, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v40 = objc_msgSend(v57, "_assetObjectIDsFromClusters:facesByAssetIdentifiers:includeExtraAssets:", v56, v34, v52 - objc_msgSend(v56, "count"));
  uint64_t v41 = (void *)MEMORY[0x263F14D18];
  uint64_t v42 = [v55 fetchOptions];
  uint64_t v43 = [v41 fetchAssetsWithObjectIDs:v40 options:v42];

  uint64_t v44 = mach_absolute_time();
  uint32_t v46 = info.numer;
  uint32_t v45 = info.denom;
  uint64_t v47 = v39;
  v48 = v47;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v48, OS_SIGNPOST_INTERVAL_END, spid, "fetchMovieAssetsForPerson", "", buf, 2u);
  }

  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v61 = "fetchMovieAssetsForPerson";
    __int16 v62 = 2048;
    double v63 = (float)((float)((float)((float)(v44 - v51) * (float)v46) / (float)v45) / 1000000.0);
    _os_log_impl(&dword_25934C000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v43;
}

@end