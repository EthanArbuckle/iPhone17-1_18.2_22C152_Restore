@interface PGShareBackSuggester
+ (id)momentUUIDsForExtendedUniversalDateInterval:(id)a3 suggesterInputs:(id)a4 momentFetchOptions:(id)a5;
+ (id)shareBackSuggesterForCMMWithLoggingConnection:(id)a3 photoLibrary:(id)a4 graph:(id)a5;
+ (id)shareBackSuggesterForExternalAssetProcessingWithLoggingConnection:(id)a3 photoLibrary:(id)a4 graph:(id)a5 serviceManager:(id)a6;
+ (id)shareBackSuggesterForSyndicationWithLoggingConnection:(id)a3 syndicationPhotoLibrary:(id)a4 systemPhotoLibrary:(id)a5 graph:(id)a6 faceIdentification:(id)a7 serviceManager:(id)a8;
+ (id)shareBackSuggesterForSyndicationWithLoggingConnection:(id)a3 syndicationPhotoLibrary:(id)a4 systemPhotoLibrary:(id)a5 graph:(id)a6 serviceManager:(id)a7;
- (PGShareBackSuggester)initWithSources:(id)a3 positiveProcessingValue:(unsigned __int16)a4 loggingConnection:(id)a5 photoLibrary:(id)a6 graph:(id)a7;
- (id)suggesterResultsForInputs:(id)a3 inGraph:(id)a4 error:(id *)a5;
- (id)suggesterResultsForUnclusteredSuggesterInputs:(id)a3 inGraph:(id)a4 error:(id *)a5;
- (unsigned)positiveProcessingValue;
@end

@implementation PGShareBackSuggester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

- (unsigned)positiveProcessingValue
{
  return self->_positiveProcessingValue;
}

- (id)suggesterResultsForUnclusteredSuggesterInputs:(id)a3 inGraph:(id)a4 error:(id *)a5
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v29 = a4;
  v26 = v7;
  v8 = +[PGShareBackLocationSource suggesterInputsByDateIntervalForInputs:v7];
  v9 = [v8 allKeys];
  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v36[0] = v10;
  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:1];
  v36[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v13 = [v9 sortedArrayUsingDescriptors:v12];

  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v32;
    do
    {
      uint64_t v18 = 0;
      v19 = v16;
      do
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * v18);
        v21 = (void *)MEMORY[0x1D25FED50]();
        v22 = [v8 objectForKeyedSubscript:v20];
        id v30 = v19;
        v23 = [(PGShareBackSuggester *)self suggesterResultsForInputs:v22 inGraph:v29 error:&v30];
        id v16 = v30;

        if (v23) {
          [v28 addObjectsFromArray:v23];
        }

        ++v18;
        v19 = v16;
      }
      while (v15 != v18);
      uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v15);
  }
  else
  {
    id v16 = 0;
  }

  if (a5) {
    *a5 = v16;
  }

  return v28;
}

- (id)suggesterResultsForInputs:(id)a3 inGraph:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = self->_loggingConnection;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12 = (void *)[v8 mutableCopy];
  v13 = +[PGShareBackSuggesterInput universalDateIntervalForSuggesterInputs:v8 withTimeIntervalPadding:7200.0];
  photoLibrary = self->_photoLibrary;
  v38 = a5;
  if (photoLibrary)
  {
    uint64_t v15 = [(PHPhotoLibrary *)photoLibrary librarySpecificFetchOptions];
    id v16 = +[PGShareBackSuggester momentUUIDsForExtendedUniversalDateInterval:v13 suggesterInputs:v8 momentFetchOptions:v15];

    uint64_t v17 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:v16 inGraph:v9];
    v45 = [v17 set];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, (os_log_t)v10, OS_LOG_TYPE_ERROR, "[PGShareBackSuggester] No photo library available, this should only be hit during unit testing", buf, 2u);
    }
    id v16 = +[PGShareBackSuggesterInput localDateIntervalForSuggesterInputs:v8 withTimeIntervalPadding:7200.0];
    v45 = [v9 momentNodesOverlappingLocalDateInterval:v16];
  }

  v44 = [(NSArray *)self->_sources lastObject];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = self->_sources;
  uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v53;
    oslog = v10;
    id v36 = v8;
    id v39 = v11;
    id v40 = v9;
    v37 = v13;
LABEL_8:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v53 != v42) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v52 + 1) + 8 * v18);
      uint64_t v20 = (void *)MEMORY[0x1D25FED50]();
      v21 = [v19 validInputsForSource:v12 givenSuggesterResults:v11];
      id v51 = 0;
      v22 = [v19 suggesterResultsForInputs:v21 momentNodes:v45 inGraph:v9 error:&v51];
      id v23 = v51;
      if (v23) {
        break;
      }
      [v11 addObjectsFromArray:v22];
      if (v19 != v44)
      {
        context = v20;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v24 = v22;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v48 != v27) {
                objc_enumerationMutation(v24);
              }
              id v29 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              if ((self->_positiveProcessingValue & objc_msgSend(v29, "processingValue", oslog)) != 0)
              {
                id v30 = [v29 suggesterInputs];
                [v12 removeObjectsInArray:v30];
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v26);
        }

        id v11 = v39;
        id v9 = v40;
        uint64_t v20 = context;
        if (![v12 count])
        {
          id v31 = 0;
          v22 = v24;
          v10 = (OS_os_log *)oslog;
          id v8 = v36;
          goto LABEL_30;
        }
      }

      if (++v18 == v43)
      {
        v10 = (OS_os_log *)oslog;
        id v8 = v36;
        v13 = v37;
        uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v43) {
          goto LABEL_8;
        }
        goto LABEL_25;
      }
    }
    id v31 = v23;
    context = v20;
    v10 = (OS_os_log *)oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v8 = v36;
      id v58 = v36;
      __int16 v59 = 2112;
      id v60 = v31;
      _os_log_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEFAULT, "[PGShareBackSuggester] Stopping due to error for suggester inputs: %@ - %@", buf, 0x16u);
    }
    else
    {
      id v8 = v36;
    }
LABEL_30:

    v13 = v37;
    if (!v31) {
      goto LABEL_33;
    }
    if (v38)
    {
      id v31 = v31;
      id v32 = 0;
      id *v38 = v31;
    }
    else
    {
      id v32 = 0;
    }
  }
  else
  {
LABEL_25:

LABEL_33:
    if (!objc_msgSend(v11, "count", oslog) && !objc_msgSend(v45, "count"))
    {
      long long v33 = [[PGShareBackSuggesterResult alloc] initWithInputs:v8 processingValue:1 momentNodes:v45];
      [v11 addObject:v33];
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v13;
        _os_log_impl(&dword_1D1805000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "[PGShareBackLocationSource] No moments for universal date interval %@", buf, 0xCu);
      }
    }
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v58 = v8;
      __int16 v59 = 2112;
      id v60 = v11;
      _os_log_impl(&dword_1D1805000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "[PGShareBackSuggester] Results for suggester inputs: %@ - %@", buf, 0x16u);
    }
    id v32 = v11;
    id v31 = 0;
  }

  return v32;
}

- (PGShareBackSuggester)initWithSources:(id)a3 positiveProcessingValue:(unsigned __int16)a4 loggingConnection:(id)a5 photoLibrary:(id)a6 graph:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v12 = (NSArray *)a3;
  v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v34.receiver = self;
  v34.super_class = (Class)PGShareBackSuggester;
  id v16 = [(PGShareBackSuggester *)&v34 init];
  uint64_t v17 = v16;
  if (v16)
  {
    id v28 = v14;
    objc_storeStrong((id *)&v16->_photoLibrary, a6);
    v17->_positiveProcessingValue = a4;
    objc_storeStrong((id *)&v17->_loggingConnection, a5);
    uint64_t v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v12;
      _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEFAULT, "[PGShareBackSuggester] Initialized suggester with sources: %@", buf, 0xCu);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v29 = v12;
    v19 = v12;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v30 + 1) + 8 * v23);
          uint64_t v25 = (void *)MEMORY[0x1D25FED50]();
          if ([v24 prepareSourceWithGraph:v15]) {
            [(NSArray *)v18 addObject:v24];
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v21);
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v18;
      _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEFAULT, "[PGShareBackSuggester] Available sources: %@", buf, 0xCu);
    }
    sources = v17->_sources;
    v17->_sources = v18;

    id v14 = v28;
    v12 = v29;
  }

  return v17;
}

+ (id)momentUUIDsForExtendedUniversalDateInterval:(id)a3 suggesterInputs:(id)a4 momentFetchOptions:(id)a5
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = [v6 startDate];
  v10 = [v6 endDate];
  id v11 = [v8 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"endDate", v9, @"startDate", v10];

  v12 = [MEMORY[0x1E4F8A9B8] fetchPredicateForExcludingOriginatorState:24];
  v13 = (void *)MEMORY[0x1E4F28BA0];
  v30[0] = v11;
  v30[1] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  id v15 = [v13 andPredicateWithSubpredicates:v14];
  [v7 setInternalPredicate:v15];

  id v16 = [MEMORY[0x1E4F391A0] fetchMomentsWithOptions:v7];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = [*(id *)(*((void *)&v25 + 1) + 8 * i) uuid];
        [v17 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }

  return v17;
}

+ (id)shareBackSuggesterForCMMWithLoggingConnection:(id)a3 photoLibrary:(id)a4 graph:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PGShareBackSource *)[PGShareBackLocationSource alloc] initWithLoggingConnection:v10];
  v15[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  v13 = (void *)[objc_alloc((Class)a1) initWithSources:v12 positiveProcessingValue:18 loggingConnection:v10 photoLibrary:v9 graph:v8];
  return v13;
}

+ (id)shareBackSuggesterForExternalAssetProcessingWithLoggingConnection:(id)a3 photoLibrary:(id)a4 graph:(id)a5 serviceManager:(id)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v10);
  id v16 = [(PGShareBackSource *)[PGShareBackLocationSource alloc] initWithLoggingConnection:v14];
  [v15 addObject:v16];

  id v17 = [(PGShareBackSource *)[PGShareBackSignificantLocationSource alloc] initWithLoggingConnection:v14];
  [v15 addObject:v17];

  id v18 = [PGShareBackCoreRoutineSource alloc];
  uint64_t v19 = [v11 routineService];

  uint64_t v20 = [(PGShareBackCoreRoutineSource *)v18 initWithRoutineService:v19 loggingConnection:v14];
  [v15 addObject:v20];

  uint64_t v21 = [[PGShareBackSceneprintSource alloc] initWithLoggingConnection:v14 photoLibrary:v13];
  [v15 addObject:v21];

  id v22 = objc_alloc_init(MEMORY[0x1E4F76C88]);
  uint64_t v23 = [[PGShareBackFacesSource alloc] initWithLoggingConnection:v14 photoLibrary:v13 faceIdentification:v22];
  [v15 addObject:v23];

  id v24 = [[PGShareBackPetSource alloc] initWithLoggingConnection:v14 photoLibrary:v13 faceIdentification:v22];
  [v15 addObject:v24];

  long long v25 = (void *)[objc_alloc((Class)a1) initWithSources:v15 positiveProcessingValue:15601 loggingConnection:v14 photoLibrary:v13 graph:v12];
  return v25;
}

+ (id)shareBackSuggesterForSyndicationWithLoggingConnection:(id)a3 syndicationPhotoLibrary:(id)a4 systemPhotoLibrary:(id)a5 graph:(id)a6 faceIdentification:(id)a7 serviceManager:(id)a8
{
  id v14 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = objc_alloc_init(v14);
  id v22 = [(PGShareBackSource *)[PGShareBackLocationSource alloc] initWithLoggingConnection:v20];
  [v21 addObject:v22];

  uint64_t v23 = [(PGShareBackSource *)[PGShareBackSignificantLocationSource alloc] initWithLoggingConnection:v20];
  [v21 addObject:v23];

  id v24 = [PGShareBackCoreRoutineSource alloc];
  long long v25 = [v15 routineService];

  long long v26 = [(PGShareBackCoreRoutineSource *)v24 initWithRoutineService:v25 loggingConnection:v20];
  [v21 addObject:v26];

  long long v27 = [[PGShareBackSceneprintSource alloc] initWithLoggingConnection:v20 photoLibrary:v18];
  [v21 addObject:v27];

  long long v28 = [[PGShareBackFacesSource alloc] initWithLoggingConnection:v20 photoLibrary:v19 faceIdentification:v16];
  [v21 addObject:v28];

  id v29 = [[PGShareBackPetSource alloc] initWithLoggingConnection:v20 photoLibrary:v19 faceIdentification:v16];
  [v21 addObject:v29];

  long long v30 = (void *)[objc_alloc((Class)a1) initWithSources:v21 positiveProcessingValue:32496 loggingConnection:v20 photoLibrary:v18 graph:v17];
  return v30;
}

+ (id)shareBackSuggesterForSyndicationWithLoggingConnection:(id)a3 syndicationPhotoLibrary:(id)a4 systemPhotoLibrary:(id)a5 graph:(id)a6 serviceManager:(id)a7
{
  id v12 = (objc_class *)MEMORY[0x1E4F76C90];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v12);
  id v19 = [a1 shareBackSuggesterForSyndicationWithLoggingConnection:v17 syndicationPhotoLibrary:v16 systemPhotoLibrary:v15 graph:v14 faceIdentification:v18 serviceManager:v13];

  return v19;
}

@end