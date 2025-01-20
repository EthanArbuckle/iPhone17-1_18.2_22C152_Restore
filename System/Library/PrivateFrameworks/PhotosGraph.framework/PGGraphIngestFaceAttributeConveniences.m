@interface PGGraphIngestFaceAttributeConveniences
+ (id)sampledAssetsWithSingleFaceForPersonLocalIdentifier:(id)a3 photoLibrary:(id)a4 numberOfYearsBack:(unint64_t)a5 sampleSize:(unint64_t)a6 fetchPropertySets:(id)a7;
@end

@implementation PGGraphIngestFaceAttributeConveniences

+ (id)sampledAssetsWithSingleFaceForPersonLocalIdentifier:(id)a3 photoLibrary:(id)a4 numberOfYearsBack:(unint64_t)a5 sampleSize:(unint64_t)a6 fetchPropertySets:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v12)
  {
    v15 = [v13 librarySpecificFetchOptions];
    [v15 setFetchLimit:1];
    v16 = (void *)MEMORY[0x1E4F391F0];
    id v69 = v12;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
    v18 = [v16 fetchPersonsWithLocalIdentifiers:v17 options:v15];

    v60 = v18;
    uint64_t v61 = [v18 firstObject];
    if (v61)
    {
      unint64_t v53 = a6;
      id v59 = v12;
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)a5 * -31557600.0];
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count == 1", @"detectedFaces");
      v57 = v19;
      v55 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"dateCreated", v19];
      v56 = (void *)v20;
      v68[0] = v20;
      v68[1] = v55;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
      [v13 librarySpecificFetchOptions];
      v23 = id v22 = v14;
      [v23 setFetchLimit:3000];
      [v23 setIncludeGuestAssets:1];
      v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
      v67[0] = v24;
      v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
      v67[1] = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
      [v23 setSortDescriptors:v26];

      v54 = (void *)v21;
      v27 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v21];
      [v23 setInternalPredicate:v27];

      if (v22) {
        [v23 setFetchPropertySets:v22];
      }
      v58 = v22;
      v28 = (void *)v61;
      v29 = [MEMORY[0x1E4F38EB8] fetchAssetsForPerson:v61 options:v23];
      if ([v29 count] <= v53)
      {
        v45 = v60;
      }
      else
      {
        id v52 = v13;
        id v30 = objc_alloc_init(MEMORY[0x1E4F8AB78]);
        [v30 setNumberOfClusters:v53];
        v31 = [v29 fetchedObjects];
        v51 = v30;
        v32 = [v30 performWithDataset:v31 progressBlock:0];

        v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v53];
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v34 = v32;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v62 objects:v66 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v63 != v37) {
                objc_enumerationMutation(v34);
              }
              v39 = [*(id *)(*((void *)&v62 + 1) + 8 * i) objects];
              v40 = [v39 firstObject];

              if (v40) {
                [v33 addObject:v40];
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v62 objects:v66 count:16];
          }
          while (v36);
        }

        id v41 = objc_alloc(MEMORY[0x1E4F39150]);
        v42 = [v29 fetchType];
        v43 = [v29 fetchPropertySets];
        id v13 = v52;
        uint64_t v44 = [v41 initWithObjects:v33 photoLibrary:v52 fetchType:v42 fetchPropertySets:v43 identifier:0 registerIfNeeded:0];

        v29 = (void *)v44;
        v45 = v60;
        v28 = (void *)v61;
      }

      id v14 = v58;
      id v12 = v59;
      v48 = v57;
    }
    else
    {
      v47 = +[PGLogging sharedLogging];
      v48 = [v47 loggingConnection];

      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v71 = v12;
        _os_log_error_impl(&dword_1D1805000, v48, OS_LOG_TYPE_ERROR, "No person found for local identifier %@", buf, 0xCu);
      }
      v29 = 0;
      v45 = v60;
      v28 = 0;
    }
  }
  else
  {
    v46 = +[PGLogging sharedLogging];
    v15 = [v46 loggingConnection];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v50 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v71 = v50;
      _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "Nil person identifier incorrectly passed into '%@'. Exiting early.", buf, 0xCu);
    }
    v29 = 0;
  }

  return v29;
}

@end