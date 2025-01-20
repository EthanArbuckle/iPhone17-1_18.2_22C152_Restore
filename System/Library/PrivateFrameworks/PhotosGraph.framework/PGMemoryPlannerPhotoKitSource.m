@interface PGMemoryPlannerPhotoKitSource
+ (BOOL)translateLegacyMemoryCategory:(unint64_t)a3 subcategory:(unint64_t)a4 toNewMemoryCategory:(unint64_t *)a5 triggerType:(unint64_t *)a6;
- (PGMemoryPlannerPhotoKitSource)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4;
- (id)memoriesToAvoidForConfiguration:(id)a3 withGraph:(id)a4 progressReporter:(id)a5;
- (id)pastMemoriesForConfiguration:(id)a3 withGraph:(id)a4 progressReporter:(id)a5;
- (id)triggeredMemoriesFromPersistedMemories:(id)a3 withGraph:(id)a4 progressReporter:(id)a5;
@end

@implementation PGMemoryPlannerPhotoKitSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)triggeredMemoriesFromPersistedMemories:(id)a3 withGraph:(id)a4 progressReporter:(id)a5
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v74 = a5;
  unint64_t v9 = [v7 count];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v11 = v7;
  uint64_t v73 = [v11 countByEnumeratingWithState:&v94 objects:v109 count:16];
  if (v73)
  {
    double v12 = 1.0 / (double)v9;
    uint64_t v72 = *(void *)v95;
    double v13 = 0.0;
    id v70 = v11;
    id v71 = v8;
    v69 = v10;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v95 != v72) {
        objc_enumerationMutation(v11);
      }
      v15 = *(void **)(*((void *)&v94 + 1) + 8 * v14);
      v16 = (void *)MEMORY[0x1D25FED50]();
      double v13 = v12 + v13;
      if ([v74 isCancelledWithProgress:v13])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v101 = 90;
          *(_WORD *)&v101[4] = 2080;
          *(void *)&v101[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGMemoryPlannerPhotoKitSource.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        id v66 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_41;
      }
      v17 = [MEMORY[0x1E4F39160] fetchMomentsBackingMemory:v15 options:0];
      id v83 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      obuint64_t j = v17;
      uint64_t v18 = [obj countByEnumeratingWithState:&v90 objects:v108 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v91;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v91 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = [*(id *)(*((void *)&v90 + 1) + 8 * i) uuid];
            [v83 addObject:v22];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v90 objects:v108 count:16];
        }
        while (v19);
      }

      v23 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v83 inGraph:v8];
      unint64_t v24 = [v23 count];
      if (v24 < [v83 count]) {
        break;
      }
      if (v24) {
        goto LABEL_18;
      }
LABEL_35:

      if (++v14 == v73)
      {
        uint64_t v73 = [v11 countByEnumeratingWithState:&v94 objects:v109 count:16];
        if (v73) {
          goto LABEL_3;
        }
        goto LABEL_37;
      }
    }
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v101 = "-[PGMemoryPlannerPhotoKitSource triggeredMemoriesFromPersistedMemories:withGraph:progressReporter:]";
      _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "%s: Cannot find some moment nodes for moment uuids", buf, 0xCu);
    }
LABEL_18:
    unint64_t v89 = 0;
    unint64_t v89 = [v15 category];
    uint64_t v26 = [v15 subcategory];
    v27 = [(MAElementCollection *)[PGGraphFeatureNodeCollection alloc] initWithGraph:v8];
    [v15 photosGraphVersion];
    unsigned int v28 = PLMemoriesAlgorithmsVersionFromPhotosGraphVersion();
    uint64_t v80 = v14;
    v81 = v16;
    v79 = v23;
    if (v89 > 0x64 || v28 < 0x301)
    {
      uint64_t v88 = 0;
      if (([(id)objc_opt_class() translateLegacyMemoryCategory:v89 subcategory:v26 toNewMemoryCategory:&v89 triggerType:&v88] & 1) == 0)
      {
        v39 = self->_loggingConnection;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v59 = (void *)MEMORY[0x1E4F39160];
          unint64_t v60 = v89;
          v61 = v39;
          v62 = [v59 stringForCategory:v60];
          v63 = [MEMORY[0x1E4F39160] stringForSubcategory:v26];
          v64 = +[PGGraphBuilder memoryLabelForCategory:v89];
          v65 = +[PGMemoryTrigger stringFromTriggerType:v88];
          *(_DWORD *)buf = 136316162;
          *(void *)v101 = "-[PGMemoryPlannerPhotoKitSource triggeredMemoriesFromPersistedMemories:withGraph:progressReporter:]";
          *(_WORD *)&v101[8] = 2112;
          *(void *)&v101[10] = v62;
          __int16 v102 = 2112;
          v103 = v63;
          __int16 v104 = 2112;
          v105 = v64;
          __int16 v106 = 2112;
          v107 = v65;
          _os_log_error_impl(&dword_1D1805000, v61, OS_LOG_TYPE_ERROR, "%s: Failed to translate memory category %@ sub category %@ into memory category %@ trigger type %@", buf, 0x34u);
        }
      }
      v40 = [NSNumber numberWithUnsignedInteger:v88];
      v99 = v40;
      id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];

      char v76 = 0;
      uint64_t v77 = 0;
    }
    else
    {
      v29 = [v15 photosGraphProperties];
      uint64_t v30 = [v29 objectForKeyedSubscript:@"triggerTypes"];
      v31 = (void *)v30;
      v32 = (void *)MEMORY[0x1E4F1CBF0];
      if (v30) {
        v32 = (void *)v30;
      }
      id v33 = v32;

      v34 = [v29 objectForKeyedSubscript:@"memoryCategorySubcategory"];
      uint64_t v77 = [v34 unsignedIntegerValue];

      v35 = [v29 objectForKeyedSubscript:@"encodedFeatures"];
      v36 = +[PGFeature featuresForEncodedFeatures:v35];
      uint64_t v37 = +[PGGraphFeatureNodeCollection featureNodeCollectionWithFeatures:v36 inGraph:v8];

      v38 = [v29 objectForKeyedSubscript:@"generatedWithFallbackRequirements"];
      char v76 = [v38 BOOLValue];

      v27 = (PGGraphFeatureNodeCollection *)v37;
    }
    v78 = v27;
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v42 = v33;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v84 objects:v98 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v85;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v85 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void *)(*((void *)&v84 + 1) + 8 * j);
          id v48 = objc_alloc(MEMORY[0x1E4F28C18]);
          v49 = [v15 creationDate];
          v50 = [v15 creationDate];
          v51 = (void *)[v48 initWithStartDate:v49 endDate:v50];
          [v41 setObject:v51 forKeyedSubscript:v47];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v84 objects:v98 count:16];
      }
      while (v44);
    }

    v52 = +[PGGraphBuilder memoryLabelForCategory:v89];
    v53 = +[PGGraphMemoryNode uniqueMemoryIdentifierWithMemoryLabel:v52 featureNodes:v78];

    v54 = [PGTriggeredMemory alloc];
    unint64_t v55 = v89;
    v56 = [v15 creationDate];
    LOBYTE(v68) = v76;
    unint64_t v57 = v55;
    v23 = v79;
    v58 = [(PGTriggeredMemory *)v54 initWithMemoryCategory:v57 memoryCategorySubcategory:v77 memoryMomentNodes:v79 memoryFeatureNodes:v78 validityIntervalByTriggerType:v41 creationDate:v56 uniqueMemoryIdentifier:v53 generatedWithFallbackRequirements:v68];

    id v10 = v69;
    [v69 addObject:v58];

    id v11 = v70;
    id v8 = v71;
    uint64_t v14 = v80;
    v16 = v81;
    goto LABEL_35;
  }
LABEL_37:

  id v66 = v10;
LABEL_41:

  return v66;
}

- (id)memoriesToAvoidForConfiguration:(id)a3 withGraph:(id)a4 progressReporter:(id)a5
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = self->_loggingConnection;
  os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)v9);
  id v11 = v9;
  double v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGMemoryPlannerPhotoKitSourceMemoriesToAvoid", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v26 = mach_absolute_time();
  double v13 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v13 setIncludeRejectedMemories:1];
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"userCreated == NO && rejected == YES"];
  [v13 setPredicate:v14];

  v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v32[0] = v15;
  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v32[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v13 setSortDescriptors:v17];

  uint64_t v18 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v13];
  if ([v18 count])
  {
    uint64_t v19 = [(PGMemoryPlannerPhotoKitSource *)self triggeredMemoriesFromPersistedMemories:v18 withGraph:v7 progressReporter:v8];
    uint64_t v20 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v23 = v12;
    unint64_t v24 = v23;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v24, OS_SIGNPOST_INTERVAL_END, v10, "PGMemoryPlannerPhotoKitSourceMemoriesToAvoid", "", buf, 2u);
    }

    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "PGMemoryPlannerPhotoKitSourceMemoriesToAvoid";
      __int16 v30 = 2048;
      double v31 = (float)((float)((float)((float)(v20 - v26) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

- (id)pastMemoriesForConfiguration:(id)a3 withGraph:(id)a4 progressReporter:(id)a5
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v32 = a4;
  id v8 = a5;
  unint64_t v9 = self->_loggingConnection;
  id v10 = a3;
  os_signpost_id_t v11 = os_signpost_id_generate((os_log_t)v9);
  double v12 = v9;
  double v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PGMemoryPlannerPhotoKitSourcePastMemories", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v31 = mach_absolute_time();
  uint64_t v14 = [v10 pastMemoryCollisionUniversalDateInterval];

  v15 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v16 = (void *)MEMORY[0x1E4F28F60];
  v17 = [v14 startDate];
  uint64_t v18 = [v14 endDate];
  uint64_t v19 = [v16 predicateWithFormat:@"creationDate >= %@ AND creationDate <= %@ && category != %d", v17, v18, 401];
  [v15 setPredicate:v19];

  uint64_t v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v38[0] = v20;
  v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v38[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  [v15 setSortDescriptors:v22];

  v23 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v15];
  if ([v23 count])
  {
    unint64_t v24 = [(PGMemoryPlannerPhotoKitSource *)self triggeredMemoriesFromPersistedMemories:v23 withGraph:v32 progressReporter:v8];
    uint64_t v25 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    unsigned int v28 = v13;
    v29 = v28;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v29, OS_SIGNPOST_INTERVAL_END, v11, "PGMemoryPlannerPhotoKitSourcePastMemories", "", buf, 2u);
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "PGMemoryPlannerPhotoKitSourcePastMemories";
      __int16 v36 = 2048;
      double v37 = (float)((float)((float)((float)(v25 - v31) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    unint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

- (PGMemoryPlannerPhotoKitSource)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMemoryPlannerPhotoKitSource;
  unint64_t v9 = [(PGMemoryPlannerPhotoKitSource *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
  }

  return v10;
}

+ (BOOL)translateLegacyMemoryCategory:(unint64_t)a3 subcategory:(unint64_t)a4 toNewMemoryCategory:(unint64_t *)a5 triggerType:(unint64_t *)a6
{
  *a5 = 0;
  *a6 = 0;
  BOOL result = 1;
  if ((uint64_t)a3 > 200)
  {
    switch(a3)
    {
      case 0xC9uLL:
        unint64_t v7 = 8;
        goto LABEL_24;
      case 0xCAuLL:
        BOOL result = 1;
        *a5 = 1;
        *a6 = 4;
        goto LABEL_25;
      case 0xCBuLL:
      case 0xCCuLL:
      case 0xCDuLL:
      case 0xCEuLL:
      case 0xCFuLL:
      case 0xD0uLL:
      case 0xD1uLL:
      case 0xD2uLL:
      case 0xD3uLL:
        goto LABEL_25;
      case 0xD4uLL:
        unint64_t v8 = 16;
        goto LABEL_15;
      case 0xD5uLL:
        BOOL result = 1;
        *a5 = 1;
        goto LABEL_16;
      case 0xD6uLL:
        BOOL result = 1;
        *a5 = 1;
        *a6 = 11;
        goto LABEL_25;
      case 0xD7uLL:
        unint64_t v8 = 17;
LABEL_15:
        *a5 = v8;
        BOOL result = 1;
LABEL_16:
        *a6 = 1;
        goto LABEL_25;
      case 0xD8uLL:
      case 0xD9uLL:
        unint64_t v7 = 21;
        goto LABEL_24;
      case 0xDAuLL:
        BOOL result = 1;
        if (a4 == 203)
        {
LABEL_42:
          unint64_t v9 = 6;
        }
        else
        {
          if (a4 != 204) {
            goto LABEL_25;
          }
LABEL_37:
          unint64_t v9 = 3;
        }
        break;
      case 0xDBuLL:
        unint64_t v7 = 4;
        goto LABEL_24;
      case 0xDCuLL:
        unint64_t v7 = 3;
        goto LABEL_24;
      case 0xDDuLL:
        unint64_t v7 = 7;
LABEL_24:
        *a5 = v7;
        BOOL result = 1;
        goto LABEL_25;
      default:
        if (a3 == 401) {
          goto LABEL_8;
        }
        goto LABEL_25;
    }
    goto LABEL_52;
  }
  if (!a3 || a3 == 32) {
LABEL_8:
  }
    BOOL result = 0;
LABEL_25:
  if ((uint64_t)a4 <= 300)
  {
    switch(a4)
    {
      case 0xC9uLL:
        unint64_t v9 = 1;
        break;
      case 0xCAuLL:
        goto LABEL_37;
      case 0xCBuLL:
        if (a3 != 220) {
          goto LABEL_42;
        }
        unint64_t v9 = 5;
        break;
      case 0xCCuLL:
        if (a3 != 220) {
          goto LABEL_37;
        }
        unint64_t v9 = 2;
        break;
      case 0xCDuLL:
      case 0xCEuLL:
        unint64_t v9 = 19;
        break;
      case 0xCFuLL:
      case 0xD0uLL:
      case 0xD1uLL:
        return result;
      case 0xD2uLL:
        *a5 = 3;
        *a6 = 2;
        return result;
      case 0xD3uLL:
        unint64_t v9 = 20;
        break;
      case 0xD4uLL:
        unint64_t v9 = 10;
        break;
      case 0xD5uLL:
        goto LABEL_34;
      case 0xD6uLL:
        unint64_t v9 = 17;
        break;
      case 0xD7uLL:
        unint64_t v9 = 18;
        break;
      case 0xD8uLL:
        goto LABEL_31;
      case 0xD9uLL:
        unint64_t v9 = 11;
        break;
      case 0xDAuLL:
        unint64_t v9 = 9;
        break;
      default:
        if (a4 != 102) {
          return result;
        }
LABEL_34:
        unint64_t v9 = 16;
        break;
    }
LABEL_52:
    *a5 = v9;
    return result;
  }
  switch(a4)
  {
    case 0x191uLL:
      unint64_t v9 = 13;
      goto LABEL_52;
    case 0x192uLL:
      unint64_t v9 = 12;
      goto LABEL_52;
    case 0x193uLL:
      unint64_t v9 = 15;
      goto LABEL_52;
    case 0x194uLL:
      unint64_t v9 = 14;
      goto LABEL_52;
    default:
      if (a4 - 301 < 3) {
LABEL_31:
      }
        BOOL result = 0;
      break;
  }
  return result;
}

@end