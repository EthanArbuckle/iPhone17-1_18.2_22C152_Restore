@interface PPRoutineSupport
+ (BOOL)importCoreRoutineDataWithError:(id *)a3 shouldContinueBlock:(id)a4;
+ (id)fetchLocationOfInterestByType:(int64_t)a3;
+ (id)locationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4;
@end

@implementation PPRoutineSupport

+ (id)fetchLocationOfInterestByType:(int64_t)a3
{
  v4 = defaultRTRoutineManager();
  if (v4)
  {
    *(void *)buf = 0;
    v17 = buf;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__3226;
    v20 = __Block_byref_object_dispose__3227;
    id v21 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __50__PPRoutineSupport_fetchLocationOfInterestByType___block_invoke;
    v13 = &unk_1E65D8E40;
    v15 = buf;
    v6 = v5;
    v14 = v6;
    [v4 fetchLocationsOfInterestOfType:a3 withHandler:&v10];
    objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:", v6, v10, v11, v12, v13);
    id v7 = *((id *)v17 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "PPRoutineSupport failed to initialize default RTRoutineManager.", buf, 2u);
    }

    id v7 = 0;
  }

  return v7;
}

intptr_t __50__PPRoutineSupport_fetchLocationOfInterestByType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

+ (id)locationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = defaultRTRoutineManager();
  if (v7)
  {
    *(void *)buf = 0;
    v19 = buf;
    uint64_t v20 = 0x3032000000;
    id v21 = __Block_byref_object_copy__3226;
    v22 = __Block_byref_object_dispose__3227;
    id v23 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__PPRoutineSupport_locationsOfInterestVisitedBetweenStartDate_endDate___block_invoke;
    v15[3] = &unk_1E65D8E40;
    v17 = buf;
    v9 = v8;
    v16 = v9;
    [v7 fetchLocationsOfInterestVisitedBetweenStartDate:v5 endDate:v6 withHandler:v15];
    if ([MEMORY[0x1E4F93B18] waitForSemaphore:v9 timeoutSeconds:10.0] == 1)
    {
      uint64_t v10 = pp_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v14[0] = 0;
        _os_log_fault_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_FAULT, "RTRoutineManager LOI fetching taking more than 10 seconds", (uint8_t *)v14, 2u);
      }
    }
    id v11 = *((id *)v19 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPRoutineSupport failed to initialize default RTRoutineManager.", buf, 2u);
    }

    id v11 = 0;
  }

  return v11;
}

void __71__PPRoutineSupport_locationsOfInterestVisitedBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v22 = v3;
    id obj = v3;
    uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
          v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          id v13 = objc_alloc(MEMORY[0x1E4F1E5F0]);
          v14 = [v11 mapItem];
          v15 = [v14 location];
          [v15 latitude];
          double v17 = v16;
          uint64_t v18 = [v11 mapItem];
          v19 = [v18 location];
          [v19 longitude];
          id v21 = (void *)[v13 initWithLatitude:v17 longitude:v20];
          [v12 addObject:v21];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }

    id v3 = v22;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)importCoreRoutineDataWithError:(id *)a3 shouldContinueBlock:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (uint64_t (**)(void))a4;
  uint64_t v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport running CoreRoutine import", (uint8_t *)&buf, 2u);
  }

  id v6 = +[PPConfiguration sharedInstance];
  uint64_t v7 = *MEMORY[0x1E4F8A058];
  uint64_t v8 = [v6 extractionAlgorithmsForBundleId:*MEMORY[0x1E4F8A058] sourceLanguage:0 conservative:0 domain:1];

  uint64_t v9 = +[PPConfiguration sharedInstance];
  uint64_t v10 = [v9 extractionAlgorithmsForBundleId:v7 sourceLanguage:0 conservative:0 domain:2];

  if ((v4[2](v4) & 1) == 0)
  {
    v37 = pp_default_log_handle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA9A8000, v37, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport: deferring before deletions.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_21;
  }
  int v11 = [v8 containsObject:&unk_1F2568CD8];
  int v12 = [v10 containsObject:&unk_1F2568CF0];
  char v13 = v12;
  if (((v11 | v12) & 1) == 0)
  {
    v37 = pp_default_log_handle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA9A8000, v37, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport: Core Routine blocked for both named entities and locations, skipping.", (uint8_t *)&buf, 2u);
    }
LABEL_21:

LABEL_28:
    BOOL v36 = 1;
    goto LABEL_29;
  }
  v14 = +[PPLocalNamedEntityStore defaultStore];
  id v61 = 0;
  char v15 = [v14 deleteAllNamedEntitiesFromSourcesWithBundleId:@"com.apple.CoreRoutine" deletedCount:0 error:&v61];
  id v16 = v61;

  if ((v15 & 1) == 0)
  {
    double v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport failed to purge CoreRoutine locations from PPNamedEntityStore: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v18 = +[PPLocalLocationStore defaultStore];
  id v60 = 0;
  char v19 = [v18 deleteAllLocationsFromSourcesWithBundleId:@"com.apple.CoreRoutine" deletedCount:0 error:&v60];
  id v20 = v60;

  if ((v19 & 1) == 0)
  {
    id v21 = pp_default_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport failed to purge CoreRoutine locations from PPLocationStore: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if ((v4[2](v4) & 1) == 0)
  {
    v38 = pp_default_log_handle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA9A8000, v38, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport: deferring after deletions.", (uint8_t *)&buf, 2u);
    }

    goto LABEL_28;
  }
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__3226;
  v65 = __Block_byref_object_dispose__3227;
  id v66 = 0;
  id v22 = objc_opt_new();
  v41 = [v22 dateByAddingTimeInterval:-4233600.0];
  id v23 = defaultRTRoutineManager();
  if (v23)
  {
    long long v24 = +[PPConfiguration sharedInstance];
    [v24 routineExtractionScoreCountWeight];
    uint64_t v26 = v25;

    long long v27 = +[PPConfiguration sharedInstance];
    [v27 routineExtractionScoreDurationWeight];
    uint64_t v29 = v28;

    v30 = +[PPConfiguration sharedInstance];
    [v30 routineExtractionScoreDecayHalfLifeDays];
    double v32 = v31;

    dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __71__PPRoutineSupport_importCoreRoutineDataWithError_shouldContinueBlock___block_invoke;
    v44[3] = &unk_1E65D50F8;
    p_long long buf = &buf;
    v48 = &v56;
    v34 = v33;
    v45 = v34;
    id v49 = a1;
    v46 = v4;
    uint64_t v50 = v26;
    uint64_t v51 = v29;
    double v52 = 0.693 / (v32 * 86400.0);
    char v53 = v11;
    char v54 = v13;
    [v23 fetchLocationsOfInterestVisitedBetweenStartDate:v41 endDate:v22 withHandler:v44];
    [MEMORY[0x1E4F93B18] waitForSemaphore:v34];

    int v35 = *((unsigned __int8 *)v57 + 24);
    if (a3 && !*((unsigned char *)v57 + 24))
    {
      *a3 = *(id *)(*((void *)&buf + 1) + 40);
      int v35 = *((unsigned __int8 *)v57 + 24);
    }
    BOOL v36 = v35 != 0;
  }
  else
  {
    v40 = pp_default_log_handle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v55 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v40, OS_LOG_TYPE_ERROR, "PPRoutineSupport failed to initialize default RTRoutineManager.", v55, 2u);
    }

    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F89FD0] code:25 userInfo:0];
    }

    BOOL v36 = 0;
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v56, 8);
LABEL_29:

  return v36;
}

void __71__PPRoutineSupport_importCoreRoutineDataWithError_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pp_default_log_handle();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "PPRoutineSupport fetchLOI query failure: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_82;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&buf[4] = [v5 count];
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport found %tu LOIs", buf, 0xCu);
  }

  uint64_t v9 = (void *)MEMORY[0x1CB79D060]();
  self;
  uint64_t v10 = objc_opt_new();
  [v10 setLimit:-1];
  int v11 = +[PPLocalLocationStore defaultStore];
  id v155 = 0;
  int v12 = [v11 locationRecordsWithQuery:v10 error:&v155];
  id v13 = v155;

  if (v12)
  {
    v14 = +[PPLocationClusterID lookupTableWithRecords:v12];
  }
  else
  {
    char v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "PPRoutineSupport error during unlimited record query: %@", buf, 0xCu);
    }

    v14 = 0;
  }

  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id obj = v5;
  uint64_t v119 = [obj countByEnumeratingWithState:&v151 objects:v157 count:16];
  if (!v119) {
    goto LABEL_81;
  }
  id v116 = v5;
  id v16 = 0;
  double v17 = 0;
  uint64_t v117 = *(void *)v152;
  v118 = v14;
  while (2)
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v152 != v117) {
        objc_enumerationMutation(obj);
      }
      char v19 = *(void **)(*((void *)&v151 + 1) + 8 * v18);
      id v20 = (void *)MEMORY[0x1CB79D060]();
      if (((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0)
      {
        v115 = pp_default_log_handle();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1CA9A8000, v115, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport: deferring during result iteration.", buf, 2u);
        }

        goto LABEL_80;
      }
      v135 = v17;
      v136 = v16;
      uint64_t v137 = v18;
      context = v20;
      v143 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", 9 * objc_msgSend(obj, "count"));
      v142 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(obj, "count"));
      id v21 = [v19 mapItem];
      id v22 = [v21 address];

      v127 = (void *)MEMORY[0x1E4F89E68];
      v141 = v19;
      v133 = [v19 mapItem];
      v131 = [v133 name];
      v129 = [v22 thoroughfare];
      v126 = [v22 subThoroughfare];
      v125 = [v22 locality];
      v139 = [v22 subLocality];
      v124 = [v22 administrativeArea];
      v123 = [v22 subAdministrativeArea];
      v122 = [v22 postalCode];
      id v23 = [v22 countryCode];
      v121 = [v22 country];
      long long v24 = [v22 inlandWater];
      uint64_t v25 = [v22 ocean];
      uint64_t v26 = [v22 areasOfInterest];
      v128 = [v127 placemarkWithLatitudeDegrees:0 longitudeDegrees:0 name:v131 thoroughfare:v129 subthoroughFare:v126 locality:v125 subLocality:v139 administrativeArea:v124 subAdministrativeArea:v123 postalCode:v122 countryCode:v23 country:v121 inlandWater:v24 ocean:v25 areasOfInterest:v26];

      id v27 = v22;
      id v28 = v128;
      id v29 = v118;
      self;
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:9];
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&buf[16] = __81__PPRoutineSupport__scoredNamedEntitiesForAddress_placemark_locationLookupTable___block_invoke;
      v159 = &unk_1E65D50D0;
      id v31 = v30;
      id v160 = v31;
      double v32 = (void (**)(void *, void *, uint64_t))_Block_copy(buf);
      dispatch_semaphore_t v33 = [v28 postalAddress];
      v34 = [v33 street];
      int v35 = [v28 name];

      v140 = v28;
      if (v35)
      {
        BOOL v36 = [v28 name];
        v32[2](v32, v36, 3);
      }
      else
      {
        if (!v118) {
          goto LABEL_25;
        }
        v130 = v34;
        v132 = v33;
        id v134 = v31;
        v37 = [PPLocationClusterID alloc];
        v38 = [v27 subThoroughfare];
        v39 = [v27 thoroughfare];
        v40 = [v27 subLocality];
        v41 = [v27 locality];
        [v27 administrativeArea];
        v43 = v42 = v29;
        BOOL v36 = [(PPLocationClusterID *)v37 initWithName:0 subThoroughfare:v38 thoroughfare:v39 subLocality:v40 locality:v41 administrativeArea:v43];

        id v29 = v42;
        v44 = [v42 objectForKeyedSubscript:v36];
        v45 = [v44 location];
        v46 = [v45 placemark];
        v47 = [v46 name];

        if (v47)
        {
          v48 = [v44 location];
          id v49 = [v48 placemark];
          uint64_t v50 = [v49 name];
          v32[2](v32, v50, 3);
        }
        id v28 = v140;
        dispatch_semaphore_t v33 = v132;
        id v31 = v134;
        v34 = v130;
      }

LABEL_25:
      if ([v34 length]) {
        v32[2](v32, v34, 8);
      }
      uint64_t v51 = [v27 subLocality];
      uint64_t v52 = [v51 length];

      if (v52)
      {
        char v53 = [v27 subLocality];
        v32[2](v32, v53, 9);
      }
      char v54 = [v27 locality];
      uint64_t v55 = [v54 length];

      if (v55)
      {
        uint64_t v56 = [v27 locality];
        v32[2](v32, v56, 9);
      }
      v57 = [v27 administrativeArea];
      uint64_t v58 = [v57 length];

      if (v58)
      {
        char v59 = [v27 administrativeArea];
        v32[2](v32, v59, 10);
      }
      id v60 = [v27 administrativeAreaCode];
      uint64_t v61 = [v60 length];

      if (v61)
      {
        v62 = [v27 administrativeAreaCode];
        v32[2](v32, v62, 10);
      }
      uint64_t v63 = [v27 country];
      uint64_t v64 = [v63 length];

      if (v64)
      {
        v65 = [v27 country];
        v32[2](v32, v65, 11);
      }
      id v66 = [v27 countryCode];
      uint64_t v67 = [v66 length];

      if (v67)
      {
        v68 = [v27 countryCode];
        v32[2](v32, v68, 11);
      }
      v69 = [v27 locality];
      uint64_t v70 = [v69 length];

      if (v70)
      {
        v71 = [MEMORY[0x1E4F1BA88] singleLineStringFromPostalAddress:v33 addCountryName:0];
        if (v71) {
          v32[2](v32, v71, 12);
        }
      }
      id v72 = v31;

      [v143 addObjectsFromArray:v72];
      v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89E48]), "initWithPlacemark:category:mostRelevantRecord:", v28, +[PPLocalLocationStore routineLOITypeToLocationCategory:](PPLocalLocationStore, "routineLOITypeToLocationCategory:", objc_msgSend(v141, "type")), 0);
      long long v147 = 0u;
      long long v148 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      v74 = [v141 visits];
      uint64_t v75 = [v74 countByEnumeratingWithState:&v147 objects:v156 count:16];
      if (v75)
      {
        uint64_t v76 = v75;
        uint64_t v77 = *(void *)v148;
        double v78 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v76; ++i)
          {
            if (*(void *)v148 != v77) {
              objc_enumerationMutation(v74);
            }
            v80 = *(void **)(*((void *)&v147 + 1) + 8 * i);
            double v81 = *(double *)(a1 + 72);
            v82 = [v80 exitDate];
            v83 = [v80 entryDate];
            [v82 timeIntervalSinceDate:v83];
            long double v85 = v81 + log2(v84 + 1.0) * *(double *)(a1 + 80);

            double v86 = *(double *)(a1 + 88);
            v87 = [v80 exitDate];
            [v87 timeIntervalSinceNow];
            double v78 = v78 + v85 * exp(-fabs(v86 * v88));
          }
          uint64_t v76 = [v74 countByEnumeratingWithState:&v147 objects:v156 count:16];
        }
        while (v76);
      }
      else
      {
        double v78 = 0.0;
      }

      v89 = (void *)[objc_alloc(MEMORY[0x1E4F89F10]) initWithLocation:v73 score:v78 / (v78 + 1.0) sentimentScore:0.0];
      [v142 addObject:v89];
      v90 = pp_default_log_handle();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v91 = [v143 count];
        uint64_t v92 = [v142 count];
        *(_DWORD *)long long buf = 134218240;
        *(void *)&buf[4] = v91;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v92;
        _os_log_impl(&dword_1CA9A8000, v90, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport extracted %tu entities and %tu locations from LOI", buf, 0x16u);
      }

      v93 = [v141 visits];
      v94 = [v93 lastObject];
      double v17 = [v94 exitDate];

      id v95 = objc_alloc(MEMORY[0x1E4F89F40]);
      v96 = objc_opt_new();
      v97 = [v96 UUIDString];
      v98 = objc_opt_new();
      id v16 = (void *)[v95 initWithBundleId:@"com.apple.CoreRoutine" groupId:0 documentId:v97 date:v98 relevanceDate:v17 contactHandles:0 language:0 metadata:0];

      if ([v143 count] && *(unsigned char *)(a1 + 96))
      {
        v99 = +[PPLocalNamedEntityStore defaultStore];
        id v146 = 0;
        char v100 = [v99 donateNamedEntities:v143 source:v16 algorithm:3 cloudSync:0 sentimentScore:&v146 error:0.0];
        id v101 = v146;

        if (v100)
        {
          v102 = +[PPLocalNamedEntityStore defaultStore];
          id v145 = 0;
          char v103 = [v102 flushDonationsWithError:&v145];
          id v104 = v145;

          if ((v103 & 1) == 0)
          {
            v105 = pp_default_log_handle();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&buf[4] = v104;
              _os_log_impl(&dword_1CA9A8000, v105, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport: importCoreRoutineDataWithCompletion: Warning: failed to flush: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          v106 = pp_default_log_handle();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&buf[4] = v101;
            _os_log_error_impl(&dword_1CA9A8000, v106, OS_LOG_TYPE_ERROR, "PPRoutineSupport failed to store CoreRoutine-derived named entities: %@", buf, 0xCu);
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
          uint64_t v107 = *(void *)(*(void *)(a1 + 48) + 8);
          id v108 = v101;
          id v104 = *(id *)(v107 + 40);
          *(void *)(v107 + 40) = v108;
        }
      }
      v109 = v142;
      if ([v142 count] && *(unsigned char *)(a1 + 97))
      {
        v110 = +[PPLocalLocationStore defaultStore];
        id v144 = 0;
        char v111 = [v110 donateLocations:v142 source:v16 contextualNamedEntities:0 algorithm:3 cloudSync:0 error:&v144];
        id v112 = v144;
        v113 = v144;

        if ((v111 & 1) == 0)
        {
          v114 = pp_default_log_handle();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&buf[4] = v113;
            _os_log_error_impl(&dword_1CA9A8000, v114, OS_LOG_TYPE_ERROR, "PPRoutineSupport failed to store CoreRoutine-derived locations: %@", buf, 0xCu);
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v112);
        }
        v109 = v142;
      }
      else
      {
        v113 = pp_default_log_handle();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&buf[4] = 0;
          _os_log_impl(&dword_1CA9A8000, v113, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport failed to submit CoreRoutine locations to location store: %@", buf, 0xCu);
        }
      }

      uint64_t v18 = v137 + 1;
    }
    while (v137 + 1 != v119);
    uint64_t v119 = [obj countByEnumeratingWithState:&v151 objects:v157 count:16];
    if (v119) {
      continue;
    }
    break;
  }
LABEL_80:

  id v6 = 0;
  id v5 = v116;
  v14 = v118;
LABEL_81:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_82:
}

void __81__PPRoutineSupport__scoredNamedEntitiesForAddress_placemark_locationLookupTable___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [MEMORY[0x1E4F89E90] describeCategory:a3];
    int v14 = 138412290;
    id v15 = v13;
    _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "PPRoutineSupport adding entity of category %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138739971;
    id v15 = v5;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPRoutineSupport adding entity: %{sensitive}@", (uint8_t *)&v14, 0xCu);
  }

  id v8 = objc_alloc(MEMORY[0x1E4F89E90]);
  uint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v10 = [v9 languageCode];
  int v11 = (void *)[v8 initWithName:v5 category:a3 language:v10];

  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v11 score:1.0];
  [*(id *)(a1 + 32) addObject:v12];
}

@end