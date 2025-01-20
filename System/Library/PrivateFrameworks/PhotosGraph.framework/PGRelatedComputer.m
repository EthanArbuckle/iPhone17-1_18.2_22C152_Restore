@interface PGRelatedComputer
+ (id)searchNodesInGraph:(id)a3 forAsset:(id)a4 inMoment:(id)a5;
+ (id)stringFromPGRelatedType:(unint64_t)a3;
- (BOOL)exportMatchingResultsForAsset:(id)a3 relatedType:(unint64_t)a4 toURL:(id)a5 error:(id *)a6;
- (BOOL)exportMatchingResultsForMoment:(id)a3 relatedType:(unint64_t)a4 toURL:(id)a5 error:(id *)a6;
- (PGRelatedComputer)initWithWorkingContext:(id)a3 blockedFeatures:(id)a4;
- (id)_diverseResultsFromMatchingResults:(id)a3 inGraph:(id)a4 timeShuffleDate:(id)a5 matchingOptions:(id)a6 options:(id)a7;
- (id)_fileURLForMomentNode:(id)a3 inGraph:(id)a4 relatedType:(unint64_t)a5 focusOnAsset:(id)a6 toURL:(id)a7;
- (id)_postProcessMatchingResults:(id)a3 inGraph:(id)a4 matchingOptions:(id)a5 options:(id)a6;
- (id)_referenceAssetWithLocalIdentifier:(id)a3;
- (id)_relatedCollectionBetweenHighlight:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 needsDebugInfo:(BOOL)a6 needsDiversityInfo:(BOOL)a7;
- (id)_relatedCollectionBetweenMoment:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 needsDebugInfo:(BOOL)a6 needsDiversityInfo:(BOOL)a7;
- (id)_relatedCollectionsForDefaultAssetCollection:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 assetCollectionForKeywords:(id)a6 curationContext:(id)a7 error:(id *)a8;
- (id)_relatedCollectionsForMemoryTripOrWeekend:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 assetCollectionForKeywords:(id)a6 curationContext:(id)a7 error:(id *)a8;
- (id)_stringFromRelatedType:(unint64_t)a3;
- (id)_tripsForTargetDomain:(unsigned __int16)a3 inGraph:(id)a4;
- (id)_upNextCollectionsForAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5 error:(id *)a6;
- (id)_weekendsForTargetDomain:(unsigned __int16)a3 inGraph:(id)a4;
- (id)relatedCollectionBetweenAsset:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 needsDebugInfo:(BOOL)a6;
- (id)relatedCollectionBetweenAssetCollection:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 curationContext:(id)a6 needsDebugInfo:(BOOL)a7;
- (id)relatedCollectionsForAsset:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 error:(id *)a6;
- (id)relatedCollectionsForAssetCollection:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 curationContext:(id)a6 error:(id *)a7;
- (id)relatedCollectionsForDefaultAssetCollection:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 curationContext:(id)a6 error:(id *)a7;
- (id)relatedCollectionsForHighlight:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 generateTitles:(BOOL)a6 error:(id *)a7;
- (id)relatedCollectionsForMemoryTripOrWeekend:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 curationContext:(id)a6 error:(id *)a7;
- (id)relatedCollectionsForMoment:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 error:(id *)a6;
- (id)relatedCollectionsForMoment:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 generateTitles:(BOOL)a6 error:(id *)a7;
- (id)relatedCollectionsForPersonLocalIdentifiers:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 error:(id *)a6;
- (void)_generateTitleForRelatedResults:(id)a3 withGraph:(id)a4 referenceEvent:(id)a5 referenceAsset:(id)a6;
@end

@implementation PGRelatedComputer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_blockedFeatures, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (void)_generateTitleForRelatedResults:(id)a3 withGraph:(id)a4 referenceEvent:(id)a5 referenceAsset:(id)a6
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v48 = a5;
  id v50 = a6;
  v49 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obuint64_t j = v9;
  uint64_t v60 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (v60)
  {
    uint64_t v58 = *(void *)v75;
    uint64_t v53 = *MEMORY[0x1E4F394A8];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v75 != v58) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v74 + 1) + 8 * v11);
        if ([v12 shouldGenerateTitle]
          && [v12 isGeneratingTitleBasedOnKeyAsset])
        {
          v13 = [v12 highlight];
          id v56 = [v12 moments];
          if (v13)
          {
            id v14 = v13;
            goto LABEL_12;
          }
          if ([v56 count] == 1)
          {
            id v14 = [v56 firstObject];
LABEL_12:
            v15 = v14;
          }
          else
          {
            v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v56, "count"));
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            id v20 = v56;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v70 objects:v81 count:16];
            if (v21)
            {
              uint64_t v22 = *(void *)v71;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v71 != v22) {
                    objc_enumerationMutation(v20);
                  }
                  v24 = [*(id *)(*((void *)&v70 + 1) + 8 * i) localIdentifier];
                  [v19 addObject:v24];
                }
                uint64_t v21 = [v20 countByEnumeratingWithState:&v70 objects:v81 count:16];
              }
              while (v21);
            }

            v25 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
            v26 = [v25 librarySpecificFetchOptions];

            uint64_t v80 = v53;
            v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
            [v26 setFetchPropertySets:v27];

            v28 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"moment.uuid IN (%@)", v19];
            [v26 setInternalPredicate:v28];
            [v26 setIncludeAssetSourceTypes:5];
            v29 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v26];
            v15 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v29 title:0];
          }
          v16 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v15 referenceAsset:v50];
          v17 = [v16 firstObject];

          if (v17)
          {
            id v18 = v49;
            objc_sync_enter(v18);
            [v18 setObject:v17 forKey:v12];
            objc_sync_exit(v18);
          }
        }
        ++v11;
      }
      while (v11 != v60);
      uint64_t v30 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
      uint64_t v60 = v30;
    }
    while (v30);
  }

  if (v48)
  {
    v31 = objc_msgSend(v48, "cls_localStartDate");
    uint64_t v32 = objc_msgSend(v48, "cls_localEndDate");
    v33 = (void *)v32;
    if (v31 && v32)
    {
      v54 = +[PGTimeUtility dateIntervalWithStartDate:v31 endDate:v32];
    }
    else if (v31)
    {
      v54 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v31 duration:0.0];
    }
    else
    {
      v54 = 0;
    }
  }
  else
  {
    v54 = 0;
  }
  v34 = [PGTitleGenerationContext alloc];
  v35 = [(PGManagerWorkingContext *)self->_workingContext serviceManager];
  v52 = [(PGTitleGenerationContext *)v34 initWithGraph:v10 serviceManager:v35];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v57 = obj;
  uint64_t v61 = [v57 countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v61; ++j)
      {
        if (*(void *)v67 != v59) {
          objc_enumerationMutation(v57);
        }
        v37 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        if ([v37 shouldGenerateTitle])
        {
          v38 = [v37 highlight];
          BOOL v39 = v38 == 0;

          if (v39)
          {
            if (![v37 isGeneratingTitleBasedOnKeyAsset]) {
              continue;
            }
            v41 = [v49 objectForKey:v37];
            v42 = [MEMORY[0x1E4F1CA80] set];
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            v43 = [v37 moments];
            uint64_t v44 = [v43 countByEnumeratingWithState:&v62 objects:v78 count:16];
            if (v44)
            {
              uint64_t v45 = *(void *)v63;
              do
              {
                for (uint64_t k = 0; k != v44; ++k)
                {
                  if (*(void *)v63 != v45) {
                    objc_enumerationMutation(v43);
                  }
                  v47 = [v10 momentNodeForMoment:*(void *)(*((void *)&v62 + 1) + 8 * k)];
                  if (v47) {
                    [v42 addObject:v47];
                  }
                }
                uint64_t v44 = [v43 countByEnumeratingWithState:&v62 objects:v78 count:16];
              }
              while (v44);
            }

            [v37 _generateTitleWithMomentNodes:v42 keyAsset:v41 referenceDateInterval:v54 titleGenerationContext:v52];
          }
          else
          {
            v40 = [v37 highlight];
            v41 = [v10 highlightNodeForHighlight:v40];

            [v37 _generateTitleWithHighlightNode:v41 referenceDateInterval:v54 titleGenerationContext:v52];
          }
        }
      }
      uint64_t v61 = [v57 countByEnumeratingWithState:&v66 objects:v79 count:16];
    }
    while (v61);
  }
}

- (id)_referenceAssetWithLocalIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    v6 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
    v7 = [v6 librarySpecificFetchOptions];

    [v7 setFetchLimit:1];
    v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier == %@", v5];
    [v7 setPredicate:v8];

    [v7 setIncludeAssetSourceTypes:5];
    id v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v7];
    id v10 = [v9 firstObject];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)exportMatchingResultsForAsset:(id)a3 relatedType:(unint64_t)a4 toURL:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  workingContext = self->_workingContext;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__PGRelatedComputer_exportMatchingResultsForAsset_relatedType_toURL_error___block_invoke;
  v16[3] = &unk_1E68F07D0;
  id v13 = v11;
  id v17 = v13;
  uint64_t v21 = a6;
  id v14 = v10;
  id v18 = v14;
  v19 = self;
  unint64_t v22 = a4;
  id v20 = &v23;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v16];
  LOBYTE(a4) = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return a4;
}

void __75__PGRelatedComputer_exportMatchingResultsForAsset_relatedType_toURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v4 createDirectoryAtURL:*(void *)(a1 + 32) withIntermediateDirectories:1 attributes:0 error:*(void *)(a1 + 64)])
  {
    v5 = [v3 graph];
    v6 = [v5 momentNodeForAsset:*(void *)(a1 + 40)];
    v7 = [*(id *)(a1 + 40) photoLibrary];
    v8 = [v7 librarySpecificFetchOptions];

    [v8 setFetchLimit:1];
    id v9 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:*(void *)(a1 + 40) withType:3 options:v8];
    if ([v9 count])
    {
      id v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 40);
      v12 = [v9 firstObject];
      id v13 = [v10 searchNodesInGraph:v5 forAsset:v11 inMoment:v12];

      id v14 = [*(id *)(a1 + 48) _fileURLForMomentNode:v6 inGraph:v5 relatedType:*(void *)(a1 + 72) focusOnAsset:*(void *)(a1 + 40) toURL:*(void *)(a1 + 32)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 exportMatchMomentEventResults:v6 relatedType:*(void *)(a1 + 72) focusOnNodes:v13 toFileURL:v14 error:*(void *)(a1 + 64)];
    }
    else
    {
      v15 = +[PGLogging sharedLogging];
      v16 = [v15 loggingConnection];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v19;
        _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Cannot find asset collection for inAsset %@", buf, 0xCu);
      }

      id v17 = (void *)MEMORY[0x1E4F28C58];
      id v18 = [NSString stringWithFormat:@"Cannot find asset collection for inAsset %@", *(void *)(a1 + 40)];
      **(void **)(a1 + 64) = [v17 errorWithDescription:v18];
    }
  }
}

- (BOOL)exportMatchingResultsForMoment:(id)a3 relatedType:(unint64_t)a4 toURL:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  workingContext = self->_workingContext;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__PGRelatedComputer_exportMatchingResultsForMoment_relatedType_toURL_error___block_invoke;
  v16[3] = &unk_1E68F07D0;
  id v13 = v11;
  id v17 = v13;
  uint64_t v21 = a6;
  id v14 = v10;
  id v18 = v14;
  uint64_t v19 = self;
  unint64_t v22 = a4;
  id v20 = &v23;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v16];
  LOBYTE(a4) = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return a4;
}

void __76__PGRelatedComputer_exportMatchingResultsForMoment_relatedType_toURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 graph];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v3 createDirectoryAtURL:*(void *)(a1 + 32) withIntermediateDirectories:1 attributes:0 error:*(void *)(a1 + 64)])
  {
    id v4 = [v6 momentNodeForMoment:*(void *)(a1 + 40)];
    v5 = [*(id *)(a1 + 48) _fileURLForMomentNode:v4 inGraph:v6 relatedType:*(void *)(a1 + 72) focusOnAsset:0 toURL:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v6 exportMatchMomentEventResults:v4 relatedType:*(void *)(a1 + 72) focusOnNodes:0 toFileURL:v5 error:*(void *)(a1 + 64)];
  }
}

- (id)_fileURLForMomentNode:(id)a3 inGraph:(id)a4 relatedType:(unint64_t)a5 focusOnAsset:(id)a6 toURL:(id)a7
{
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E4F28E78];
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v13 string];
  id v18 = [(PGRelatedComputer *)self _stringFromRelatedType:a5];
  uint64_t v19 = [v15 identifier];

  id v20 = [v19 UUIDString];
  uint64_t v21 = [v16 name];

  [v17 appendFormat:@"%@_%@_%@", v20, v21, v18];
  if (v12)
  {
    unint64_t v22 = [v12 localIdentifier];
    [v17 appendFormat:@"_%@", v22];
  }
  [v17 appendString:@".plist"];
  uint64_t v23 = [v17 stringByReplacingOccurrencesOfString:@" " withString:@"-"];
  v24 = [v23 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

  uint64_t v25 = [v14 path];

  char v26 = [v25 stringByAppendingPathComponent:v24];

  v27 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v26];

  return v27;
}

- (id)_stringFromRelatedType:(unint64_t)a3
{
  if ((~(_BYTE)a3 & 7) == 0) {
    return @"ALLM1";
  }
  if ((~(_BYTE)a3 & 0xF) == 0) {
    return @"ALLM2";
  }
  if ((~(_BYTE)a3 & 0x3F) == 0) {
    return @"ALLM3";
  }
  if (a3) {
    return @"PEOPLE";
  }
  if ((a3 & 2) != 0) {
    return @"TIME";
  }
  if ((a3 & 4) != 0) {
    return @"LOCATION";
  }
  if ((a3 & 8) != 0) {
    return @"EVENT";
  }
  if ((a3 & 0x10) != 0) {
    return @"PLACE";
  }
  return (id)((unint64_t)@"SCENE" & ((uint64_t)(a3 << 58) >> 63));
}

- (id)_weekendsForTargetDomain:(unsigned __int16)a3 inGraph:(id)a4
{
  int v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (v4 == 102)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = objc_msgSend(v6, "shortTripNodes", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) sortedHighlightNodes];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else if (v4 == 100)
  {
    id v7 = [v5 weekends];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_tripsForTargetDomain:(unsigned __int16)a3 inGraph:(id)a4
{
  int v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (v4 == 102)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = objc_msgSend(v6, "longTripNodes", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) sortedHighlightNodes];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else if (v4 == 100)
  {
    id v7 = [v5 trips];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_diverseResultsFromMatchingResults:(id)a3 inGraph:(id)a4 timeShuffleDate:(id)a5 matchingOptions:(id)a6 options:(id)a7
{
  uint64_t v403 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v299 = a4;
  id v278 = a5;
  id v284 = a6;
  id v298 = a7;
  v285 = self;
  id v13 = self->_loggingConnection;
  os_signpost_id_t v14 = os_signpost_id_generate((os_log_t)v13);
  long long v15 = v13;
  long long v16 = v15;
  unint64_t v263 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "RelatedDiversity", "", buf, 2u);
  }
  os_signpost_id_t spid = v14;
  v262 = v16;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v261 = mach_absolute_time();
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v372 = 0u;
  long long v373 = 0u;
  long long v374 = 0u;
  long long v375 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v372 objects:v396 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v373;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v373 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = [*(id *)(*((void *)&v372 + 1) + 8 * i) event];
        [v17 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v372 objects:v396 count:16];
    }
    while (v20);
  }
  v264 = v17;

  v24 = +[PGGraph defaultMatchingSortDescriptors];
  v265 = v18;
  v319 = [v18 sortedArrayUsingDescriptors:v24];

  char v315 = [v284 relatedType];
  unsigned int v308 = [v284 needsKeywords];
  v297 = [v298 filteringLocalIdentifiers];
  uint64_t v25 = [v298 fetchLimit];
  uint64_t v26 = 64;
  if (v25) {
    uint64_t v26 = v25;
  }
  unint64_t v300 = v26;
  v331 = [MEMORY[0x1E4F28E60] indexSet];
  v330 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v368 = 0u;
  long long v369 = 0u;
  long long v370 = 0u;
  long long v371 = 0u;
  v27 = -[PGRelatedComputer _weekendsForTargetDomain:inGraph:](v285, "_weekendsForTargetDomain:inGraph:", [v284 targetEventDomain], v299);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v368 objects:v395 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v369;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v369 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void **)(*((void *)&v368 + 1) + 8 * j);
        long long v364 = 0u;
        long long v365 = 0u;
        long long v366 = 0u;
        long long v367 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v364 objects:v394 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v365;
          do
          {
            for (uint64_t k = 0; k != v35; ++k)
            {
              if (*(void *)v365 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = [*(id *)(*((void *)&v364 + 1) + 8 * k) identifier];
              BOOL v39 = [NSNumber numberWithUnsignedInteger:v38];
              [v330 setObject:v33 forKeyedSubscript:v39];

              [v331 addIndex:v38];
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v364 objects:v394 count:16];
          }
          while (v35);
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v368 objects:v395 count:16];
    }
    while (v29);
  }

  v40 = [MEMORY[0x1E4F28E60] indexSet];
  v41 = [MEMORY[0x1E4F28E60] indexSet];
  v332 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v360 = 0u;
  long long v361 = 0u;
  long long v362 = 0u;
  long long v363 = 0u;
  -[PGRelatedComputer _tripsForTargetDomain:inGraph:](v285, "_tripsForTargetDomain:inGraph:", [v284 targetEventDomain], v299);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v42 = [obj countByEnumeratingWithState:&v360 objects:v393 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v327 = *(void *)v361;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v361 != v327) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = *(void **)(*((void *)&v360 + 1) + 8 * m);
        long long v356 = 0u;
        long long v357 = 0u;
        long long v358 = 0u;
        long long v359 = 0u;
        id v46 = v45;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v356 objects:v392 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v357;
          do
          {
            for (uint64_t n = 0; n != v48; ++n)
            {
              if (*(void *)v357 != v49) {
                objc_enumerationMutation(v46);
              }
              uint64_t v51 = [*(id *)(*((void *)&v356 + 1) + 8 * n) identifier];
              v52 = [NSNumber numberWithUnsignedInteger:v51];
              [v332 setObject:v46 forKeyedSubscript:v52];

              [v40 addIndex:v51];
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v356 objects:v392 count:16];
          }
          while (v48);
        }
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v360 objects:v393 count:16];
    }
    while (v43);
  }

  v282 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:64];
  v269 = [MEMORY[0x1E4F1CA48] array];
  v271 = [MEMORY[0x1E4F1CA48] array];
  v270 = [MEMORY[0x1E4F1CA48] array];
  v268 = [MEMORY[0x1E4F1CA48] array];
  v267 = [MEMORY[0x1E4F1CA48] array];
  v273 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v53 = (void *)MEMORY[0x1E4F76C68];
  v54 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v304 = [v53 yearFromDate:v54];

  if (v315) {
    double v55 = 0.7;
  }
  else {
    double v55 = 0.0;
  }
  if ((v315 & 2) != 0) {
    double v56 = 0.5;
  }
  else {
    double v56 = -0.0;
  }
  if ((v315 & 4) != 0) {
    double v57 = 1.1;
  }
  else {
    double v57 = -0.0;
  }
  if ((v315 & 8) != 0) {
    double v58 = 0.5;
  }
  else {
    double v58 = -0.0;
  }
  if ((v315 & 0x10) != 0) {
    double v59 = 0.3;
  }
  else {
    double v59 = -0.0;
  }
  long long v354 = 0u;
  long long v355 = 0u;
  if ((v315 & 0x20) != 0) {
    double v60 = 0.3;
  }
  else {
    double v60 = -0.0;
  }
  long long v352 = 0uLL;
  long long v353 = 0uLL;
  id v279 = v319;
  uint64_t v61 = [v279 countByEnumeratingWithState:&v352 objects:v391 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    double v63 = v55 + v56 + v57 + v58 + v59 + v60;
    double v291 = 1.1 / v63;
    double v287 = 0.7 / v63;
    uint64_t v64 = *(void *)v353;
    uint64_t v306 = *(void *)v353;
    do
    {
      uint64_t v65 = 0;
      uint64_t v309 = v62;
      do
      {
        if (*(void *)v353 != v64) {
          objc_enumerationMutation(v279);
        }
        long long v66 = *(void **)(*((void *)&v352 + 1) + 8 * v65);
        long long v67 = [v66 event];
        if ([v67 isInteresting])
        {
          [v67 contentScore];
          double v69 = v68;
          long long v70 = [v67 localStartDate];

          if (v70)
          {
            long long v71 = (void *)MEMORY[0x1E4F76C68];
            long long v72 = [v67 localStartDate];
            uint64_t v73 = [v71 yearFromDate:v72];

            uint64_t v74 = v304 - v73;
            if (v304 - v73 < 0) {
              uint64_t v74 = v73 - v304;
            }
            double v75 = fmin((double)v74 / 20.0, 1.0);
          }
          else
          {
            double v75 = 0.0;
          }
          id v76 = [v67 localStartDate];
          id v77 = v278;
          [v77 timeIntervalSince1970];
          uint64_t v79 = (uint64_t)llround(v78) % 86400;
          [v77 timeIntervalSince1970];
          int64_t v81 = llround(v80);
          uint64_t v82 = v79 + 86400 * (v81 / 86400) - v81;
          if (v82 < 0) {
            uint64_t v82 = -v82;
          }
          uint64_t v320 = v82;

          uint64_t v83 = [v66 contextItemForRelatedType:4];
          v328 = [v66 contextItemForRelatedType:1];
          v84 = [v66 contextItemForRelatedType:32];
          v85 = [v66 sortedCriteria];
          uint64_t v86 = [v85 count];

          v87 = [v66 sortedCriteria];
          int v88 = [v87 containsIndex:22];
          id obja = v84;
          v316 = v67;
          if (v88)
          {
            v312 = [v66 sortedCriteria];
            if ([v312 containsIndex:21])
            {
              v89 = (void *)v83;
              BOOL v90 = 1;
              goto LABEL_81;
            }
            if (v84)
            {
LABEL_78:
              v89 = (void *)v83;
              v91 = [v84 contextNodes];
              BOOL v90 = (unint64_t)[v91 count] < 2;

              if (!v88) {
                goto LABEL_82;
              }
            }
            else
            {
              v89 = (void *)v83;
              BOOL v90 = 0;
            }
LABEL_81:

            goto LABEL_82;
          }
          if (v84) {
            goto LABEL_78;
          }
          v89 = (void *)v83;
          BOOL v90 = 0;
LABEL_82:

          unint64_t v92 = v86 - v90;
          int v93 = (int)v328;
          if (v328)
          {
            [v328 score];
            v94 = v89;
            if (v95 < 0.65)
            {
              BOOL v96 = 0;
              int v93 = 0;
              --v92;
              goto LABEL_86;
            }
            [v328 score];
            *(float *)&double v97 = v97;
            long long v67 = v316;
            BOOL v96 = *(float *)&v97 >= 0.75;
            int v93 = 1;
          }
          else
          {
            BOOL v96 = 0;
            v94 = v89;
LABEL_86:
            long long v67 = v316;
          }
          double v98 = (double)v320 / -86400.0 + 1.0;
          if (v94)
          {
            unint64_t v99 = [v94 criteria];
            BOOL v321 = v99 > 0x11;
            if (v99 <= 0x11)
            {
              if ((unint64_t)[v94 criteria] < 0x10) {
                BOOL v96 = 1;
              }
              BOOL v100 = v75 != 0.0;
              if (v75 == 0.0) {
                int v102 = 0;
              }
              else {
                int v102 = v93;
              }
              if (v102 == 1)
              {
                int v103 = v93;
                v104 = (void *)[v66 copy];
                [v104 score];
                [v104 setScore:v75 * v105];
                [v104 score];
                [v104 setScore:(v69 * 0.1 + 0.9) * v106];
                [v104 score];
                [v104 setScore:(v98 * 0.1 + 0.9) * v107];
                [v269 addObject:v104];

                int v93 = v103;
                BOOL v100 = 1;
              }
            }
            else
            {
              --v92;
              BOOL v100 = v75 != 0.0;
            }
            unint64_t v108 = [v94 criteria];
            char v109 = v92 > 1 || v96;
            if (v108 >= 0x13 && (v109 & 1) != 0)
            {
LABEL_107:
              if ([v67 hasLocation])
              {
                [v66 score];
                double v111 = v110;
                v294 = v94;
                [v94 score];
                double v113 = v111 + (v112 * -2.0 + 1.0) * v291;
                BOOL v114 = v100;
                v115 = (void *)[v66 copy];
                [v115 setScore:v113];
                double v116 = v69 * 0.1 + 0.9;
                [v115 score];
                [v115 setScore:v116 * v117];
                double v118 = v98 * 0.1 + 0.9;
                [v115 score];
                [v115 setScore:v118 * v119];
                [v271 addObject:v115];
                if (v114)
                {
                  int v289 = v93;
                  v120 = (void *)[v115 copy];
                  [v120 score];
                  [v120 setScore:v75 * v121];
                  [v120 score];
                  [v120 setScore:v116 * v122];
                  [v120 score];
                  [v120 setScore:v118 * v123];
                  [v268 addObject:v120];

                  int v93 = v289;
                }

                BOOL v100 = v114;
                v94 = v294;
              }
            }
            int v124 = v92 > 1 || v96;
            if ((v93 | v321) != 1 && v124 && [v67 hasPeopleCountingMe:0])
            {
              v125 = v94;
              [v66 score];
              double v127 = v126;
              [v328 score];
              double v129 = v127 + (v128 * -2.0 + 1.0) * v287;
              BOOL v130 = v100;
              v131 = (void *)[v66 copy];
              [v131 setScore:v129];
              double v132 = v69 * 0.1 + 0.9;
              [v131 score];
              [v131 setScore:v132 * v133];
              double v134 = v98 * 0.1 + 0.9;
              [v131 score];
              [v131 setScore:v134 * v135];
              [v270 addObject:v131];
              if (v130)
              {
                int v136 = v93;
                v137 = (void *)[v131 copy];
                [v137 score];
                [v137 setScore:v75 * v138];
                [v137 score];
                [v137 setScore:v132 * v139];
                [v137 score];
                [v137 setScore:v134 * v140];
                [v267 addObject:v137];

                int v93 = v136;
              }

              v94 = v125;
            }
          }
          else
          {
            BOOL v100 = v75 != 0.0;
            BOOL v101 = !v96;
            if (v92 >= 2) {
              BOOL v101 = 0;
            }
            if (!v101)
            {
              BOOL v321 = 1;
              goto LABEL_107;
            }
          }
          if (v93)
          {
            [v328 score];
            double v142 = v141;
            [v66 score];
            double v144 = v143 * 0.2 + v142 * 0.8;
            v145 = (void *)[v66 copy];
            [v145 setScore:v144];
            [v145 score];
            [v145 setScore:(v69 * 0.1 + 0.9) * v146];
            [v145 score];
            [v145 setScore:(v98 * 0.1 + 0.9) * v147];
            [v273 addObject:v145];
          }
          uint64_t v62 = v309;
          uint64_t v64 = v306;
          if ((unint64_t)[v282 count] <= 0x3F)
          {
            [v66 score];
            [v66 setScore:(v69 * 0.1 + 0.9) * v148];
            [v282 addObject:v66];
          }
        }
        ++v65;
      }
      while (v62 != v65);
      uint64_t v62 = [v279 countByEnumeratingWithState:&v352 objects:v391 count:16];
    }
    while (v62);
  }

  v149 = +[PGGraph defaultMatchingSortDescriptors];
  [v282 sortUsingDescriptors:v149];

  v150 = +[PGGraph defaultMatchingSortDescriptors];
  [v269 sortUsingDescriptors:v150];

  v151 = +[PGGraph defaultMatchingSortDescriptors];
  [v271 sortUsingDescriptors:v151];

  v152 = +[PGGraph defaultMatchingSortDescriptors];
  [v270 sortUsingDescriptors:v152];

  v153 = +[PGGraph defaultMatchingSortDescriptors];
  [v268 sortUsingDescriptors:v153];

  v154 = +[PGGraph defaultMatchingSortDescriptors];
  [v267 sortUsingDescriptors:v154];

  v155 = +[PGGraph defaultMatchingSortDescriptors];
  [v273 sortUsingDescriptors:v155];

  v390[0] = v282;
  v390[1] = v269;
  v390[2] = v271;
  v390[3] = v270;
  v390[4] = v268;
  v390[5] = v267;
  v390[6] = v273;
  v156 = [MEMORY[0x1E4F1C978] arrayWithObjects:v390 count:7];
  v329 = [MEMORY[0x1E4F28BD0] set];
  long long v348 = 0u;
  long long v349 = 0u;
  long long v350 = 0u;
  long long v351 = 0u;
  id v280 = v156;
  id objb = v40;
  uint64_t v313 = [v280 countByEnumeratingWithState:&v348 objects:v389 count:16];
  if (v313)
  {
    uint64_t v310 = *(void *)v349;
    do
    {
      uint64_t v157 = 0;
      do
      {
        if (*(void *)v349 != v310) {
          objc_enumerationMutation(v280);
        }
        uint64_t v317 = v157;
        v158 = *(void **)(*((void *)&v348 + 1) + 8 * v157);
        long long v344 = 0u;
        long long v345 = 0u;
        long long v346 = 0u;
        long long v347 = 0u;
        id v159 = v158;
        uint64_t v160 = [v159 countByEnumeratingWithState:&v344 objects:v388 count:16];
        if (v160)
        {
          uint64_t v161 = v160;
          unint64_t v162 = 0;
          uint64_t v163 = *(void *)v345;
          id v322 = v159;
LABEL_134:
          uint64_t v164 = 0;
          while (1)
          {
            if (*(void *)v345 != v163) {
              objc_enumerationMutation(v159);
            }
            v165 = [*(id *)(*((void *)&v344 + 1) + 8 * v164) event];
            uint64_t v166 = [v165 identifier];

            if ([v40 containsIndex:v166])
            {
              if (([v41 containsIndex:v166] & 1) == 0)
              {
                v167 = [NSNumber numberWithUnsignedInteger:v166];
                v168 = [v332 objectForKeyedSubscript:v167];

                [v329 addObject:v168];
                if ((unint64_t)[v329 countForObject:v168] >= 2)
                {
                  long long v342 = 0u;
                  long long v343 = 0u;
                  long long v340 = 0u;
                  long long v341 = 0u;
                  id v169 = v168;
                  uint64_t v170 = [v169 countByEnumeratingWithState:&v340 objects:v387 count:16];
                  if (v170)
                  {
                    uint64_t v171 = v170;
                    uint64_t v172 = *(void *)v341;
                    do
                    {
                      for (iuint64_t i = 0; ii != v171; ++ii)
                      {
                        if (*(void *)v341 != v172) {
                          objc_enumerationMutation(v169);
                        }
                        objc_msgSend(v41, "addIndex:", objc_msgSend(*(id *)(*((void *)&v340 + 1) + 8 * ii), "identifier"));
                      }
                      uint64_t v171 = [v169 countByEnumeratingWithState:&v340 objects:v387 count:16];
                    }
                    while (v171);
                  }

                  id v159 = v322;
                  v40 = objb;
                }
                ++v162;

                if (v162 > 0x3F) {
                  break;
                }
              }
            }
            if (++v164 == v161)
            {
              uint64_t v161 = [v159 countByEnumeratingWithState:&v344 objects:v388 count:16];
              if (v161) {
                goto LABEL_134;
              }
              break;
            }
          }
        }

        uint64_t v157 = v317 + 1;
      }
      while (v317 + 1 != v313);
      uint64_t v313 = [v280 countByEnumeratingWithState:&v348 objects:v389 count:16];
    }
    while (v313);
  }

  v296 = v285->_blockedFeatures;
  v307 = [(PGManagerWorkingContext *)v285->_workingContext photoLibrary];
  v174 = [MEMORY[0x1E4F28E60] indexSet];
  v175 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v300];
  size_t v176 = [v280 count];
  if (!v176) {
    goto LABEL_251;
  }
  v177 = malloc_type_calloc(8uLL, v176, 0x5254AD64uLL);
  v178 = v177;
  if ([v175 count] >= v300) {
    goto LABEL_249;
  }
  unint64_t v266 = 0;
  v293 = v175;
  v295 = v174;
  v274 = v177;
  while (2)
  {
    long long v338 = 0u;
    long long v339 = 0u;
    long long v336 = 0u;
    long long v337 = 0u;
    id v272 = v280;
    uint64_t v276 = [v272 countByEnumeratingWithState:&v336 objects:v386 count:16];
    if (!v276) {
      goto LABEL_246;
    }
    uint64_t v302 = 0;
    uint64_t v275 = *(void *)v337;
LABEL_158:
    uint64_t v179 = 0;
    while (2)
    {
      if (*(void *)v337 != v275)
      {
        uint64_t v180 = v179;
        objc_enumerationMutation(v272);
        uint64_t v179 = v180;
      }
      uint64_t v281 = v179;
      v181 = *(void **)(*((void *)&v336 + 1) + 8 * v179);
      unint64_t v182 = v178[v302];
      v314 = v181;
      while (1)
      {
        if (v182 >= [v181 count])
        {
          v186 = 0;
          goto LABEL_241;
        }
        v183 = [v181 objectAtIndexedSubscript:v182];
        v184 = [v183 event];
        uint64_t v185 = [v184 identifier];
        if ([v174 containsIndex:v185])
        {
          v186 = 0;
LABEL_236:
          ++v182;
          goto LABEL_237;
        }
        [v174 addIndex:v185];
        v318 = v184;
        v323 = v183;
        if (v308)
        {
          v187 = [&unk_1F28D4DA0 objectAtIndexedSubscript:v302];
          v385 = v187;
          v188 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v385 count:1];
          [v323 addKeywords:v188 forRelatedType:64];

          v183 = v323;
          v184 = v318;
        }
        if (([v331 containsIndex:v185] & 1) == 0
          && ([v41 containsIndex:v185] & 1) == 0)
        {
          break;
        }
        unint64_t v311 = v182;
        if ([v331 containsIndex:v185])
        {
          id v292 = v299;
          id v189 = v174;
          id v301 = v183;
          id v190 = v330;
          v191 = v296;
          id v305 = v307;
          id v303 = v297;
          id v288 = v298;
          [NSNumber numberWithUnsignedInteger:v185];
          v286 = v290 = v190;
          v192 = objc_msgSend(v190, "objectForKeyedSubscript:");
          v193 = [MEMORY[0x1E4F1CA48] array];
          long long v381 = 0u;
          long long v382 = 0u;
          long long v383 = 0u;
          long long v384 = 0u;
          id v194 = v192;
          uint64_t v195 = [v194 countByEnumeratingWithState:&v381 objects:buf count:16];
          if (v195)
          {
            uint64_t v196 = v195;
            uint64_t v197 = *(void *)v382;
            do
            {
              for (juint64_t j = 0; jj != v196; ++jj)
              {
                if (*(void *)v382 != v197) {
                  objc_enumerationMutation(v194);
                }
                uint64_t v199 = *(void *)(*((void *)&v381 + 1) + 8 * jj);
                if (!+[PGMemoryController anyBlockedFeatureIn:isHitByEvent:](PGMemoryController, "anyBlockedFeatureIn:isHitByEvent:", v191, v199))[v193 addObject:v199]; {
              }
                }
              uint64_t v196 = [v194 countByEnumeratingWithState:&v381 objects:buf count:16];
            }
            while (v196);
          }

          if (![v193 count]) {
            goto LABEL_198;
          }
          if ([v193 count] != 1)
          {
            long long v380 = 0u;
            long long v379 = 0u;
            long long v378 = 0u;
            long long v377 = 0u;
            id v218 = v194;
            uint64_t v219 = [v218 countByEnumeratingWithState:&v377 objects:v398 count:16];
            if (v219)
            {
              uint64_t v220 = v219;
              uint64_t v221 = *(void *)v378;
              do
              {
                for (kuint64_t k = 0; kk != v220; ++kk)
                {
                  if (*(void *)v378 != v221) {
                    objc_enumerationMutation(v218);
                  }
                  objc_msgSend(v189, "addIndex:", objc_msgSend(*(id *)(*((void *)&v377 + 1) + 8 * kk), "identifier"));
                }
                uint64_t v220 = [v218 countByEnumeratingWithState:&v377 objects:v398 count:16];
              }
              while (v220);
            }

            v223 = [v193 firstObject];
            v224 = [v223 highlightGroupNode];

            v283 = v224;
            v277 = [v224 fetchAssetCollectionInPhotoLibrary:v305];
            v225 = [(PGRelated *)v277 localIdentifier];
            char v226 = [v303 containsObject:v225];

            if (v226) {
              goto LABEL_220;
            }
            v40 = objb;
            v174 = v295;
            if (v308)
            {
              v227 = [NSString stringWithFormat:@"%@ upgrade", @"Weekend"];
              v397 = v227;
              v228 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v397 count:1];
              [v301 addKeywords:v228 forRelatedType:128];
            }
            goto LABEL_227;
          }
          v200 = [v193 firstObject];
          v201 = [v200 fetchAssetCollectionInPhotoLibrary:v305];

          v40 = objb;
          if (!v201) {
            goto LABEL_224;
          }
          v202 = [v201 localIdentifier];
          char v203 = [v303 containsObject:v202];

          v204 = v201;
          v174 = v295;
          v283 = v204;
          if ((v203 & 1) == 0) {
            goto LABEL_228;
          }
        }
        else
        {
          id v292 = v299;
          id v189 = v174;
          id v301 = v183;
          id v205 = v332;
          v191 = v296;
          id v305 = v307;
          id v303 = v297;
          id v288 = v298;
          [NSNumber numberWithUnsignedInteger:v185];
          v286 = v290 = v205;
          v206 = objc_msgSend(v205, "objectForKeyedSubscript:");
          v193 = [MEMORY[0x1E4F1CA48] array];
          long long v381 = 0u;
          long long v382 = 0u;
          long long v383 = 0u;
          long long v384 = 0u;
          id v194 = v206;
          uint64_t v207 = [v194 countByEnumeratingWithState:&v381 objects:buf count:16];
          if (v207)
          {
            uint64_t v208 = v207;
            uint64_t v209 = *(void *)v382;
            do
            {
              for (muint64_t m = 0; mm != v208; ++mm)
              {
                if (*(void *)v382 != v209) {
                  objc_enumerationMutation(v194);
                }
                uint64_t v211 = *(void *)(*((void *)&v381 + 1) + 8 * mm);
                if (!+[PGMemoryController anyBlockedFeatureIn:isHitByEvent:](PGMemoryController, "anyBlockedFeatureIn:isHitByEvent:", v191, v211))[v193 addObject:v211]; {
              }
                }
              uint64_t v208 = [v194 countByEnumeratingWithState:&v381 objects:buf count:16];
            }
            while (v208);
          }

          if (![v193 count])
          {
LABEL_198:
            v186 = 0;
            v40 = objb;
            v174 = v295;
            v181 = v314;
            goto LABEL_231;
          }
          if ([v193 count] != 1)
          {
            long long v380 = 0u;
            long long v379 = 0u;
            long long v378 = 0u;
            long long v377 = 0u;
            id v229 = v194;
            uint64_t v230 = [v229 countByEnumeratingWithState:&v377 objects:v398 count:16];
            if (v230)
            {
              uint64_t v231 = v230;
              uint64_t v232 = *(void *)v378;
              do
              {
                for (nuint64_t n = 0; nn != v231; ++nn)
                {
                  if (*(void *)v378 != v232) {
                    objc_enumerationMutation(v229);
                  }
                  objc_msgSend(v189, "addIndex:", objc_msgSend(*(id *)(*((void *)&v377 + 1) + 8 * nn), "identifier"));
                }
                uint64_t v231 = [v229 countByEnumeratingWithState:&v377 objects:v398 count:16];
              }
              while (v231);
            }

            v234 = [v193 firstObject];
            v235 = [v234 highlightGroupNode];

            v283 = v235;
            v277 = [v235 fetchAssetCollectionInPhotoLibrary:v305];
            v236 = [(PGRelated *)v277 localIdentifier];
            char v237 = [v303 containsObject:v236];

            if (v237)
            {
LABEL_220:
              v186 = 0;
              v40 = objb;
              v174 = v295;
              v238 = v277;
LABEL_229:

              goto LABEL_230;
            }
            v40 = objb;
            v174 = v295;
            if (v308)
            {
              v241 = [NSString stringWithFormat:@"%@ upgrade", @"Trip"];
              v397 = v241;
              v242 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v397 count:1];
              [v301 addKeywords:v242 forRelatedType:128];
            }
LABEL_227:
            v238 = v277;
            v186 = [[PGRelated alloc] initWithGraphMatchingResult:v301 highlight:v277 needsDebugInfo:v308];

            goto LABEL_229;
          }
          v212 = [v193 firstObject];
          v213 = [v212 fetchAssetCollectionInPhotoLibrary:v305];

          v40 = objb;
          if (!v213)
          {
LABEL_224:
            v283 = 0;
            v186 = 0;
            v174 = v295;
            goto LABEL_230;
          }
          v214 = [v213 localIdentifier];
          char v215 = [v303 containsObject:v214];

          v204 = v213;
          v174 = v295;
          v283 = v204;
          if ((v215 & 1) == 0)
          {
LABEL_228:
            v238 = [[PGRelated alloc] initWithGraphMatchingResult:v301 assetCollection:v204 needsDebugInfo:v308];
            v186 = v238;
            goto LABEL_229;
          }
        }
        v186 = 0;
LABEL_230:
        v181 = v314;

LABEL_231:
        v175 = v293;
        unint64_t v182 = v311;
        v184 = v318;
        v183 = v323;
        if (v186) {
          goto LABEL_232;
        }
LABEL_237:

        if (v186) {
          goto LABEL_241;
        }
      }
      v216 = [v184 photoEvent];
      v217 = [v216 fetchAssetCollectionInPhotoLibrary:v307];

      if (!v217)
      {
        v239 = +[PGLogging sharedLogging];
        v240 = [v239 loggingConnection];

        if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v400 = "-[PGRelatedComputer _diverseResultsFromMatchingResults:inGraph:timeShuffleDate:matchingOptions:options:]";
          _os_log_error_impl(&dword_1D1805000, v240, OS_LOG_TYPE_ERROR, "Nil asset collection for event node in %s, graph is out-of-sync with the photo library.", buf, 0xCu);
        }

        v186 = 0;
        v184 = v318;
        goto LABEL_237;
      }

      v186 = 0;
      v184 = v318;
LABEL_232:
      [(PGRelated *)v186 score];
      double v244 = v243;
      [v184 contentScore];
      [(PGRelated *)v186 setMatchingScore:v244 / (v245 * 0.1 + 0.9)];
      if (v186) {
        [v175 addObject:v186];
      }
      v246 = [v184 eventCollection];
      v247 = [v246 eventMomentNodes];

      v248 = [v247 dateNodes];
      v249 = [v248 momentNodes];
      v333[0] = MEMORY[0x1E4F143A8];
      v333[1] = 3221225472;
      v333[2] = __104__PGRelatedComputer__diverseResultsFromMatchingResults_inGraph_timeShuffleDate_matchingOptions_options___block_invoke;
      v333[3] = &unk_1E68F0768;
      id v334 = v284;
      id v335 = v174;
      [v249 enumerateNodesUsingBlock:v333];

      unint64_t v250 = [v175 count];
      if (v250 < v300)
      {
        v181 = v314;
        v184 = v318;
        v183 = v323;
        goto LABEL_236;
      }

LABEL_241:
      if ([v175 count] < v300)
      {
        v274[v302++] = v182;

        v178 = v274;
        uint64_t v179 = v281 + 1;
        if (v281 + 1 != v276) {
          continue;
        }
        uint64_t v276 = [v272 countByEnumeratingWithState:&v336 objects:v386 count:16];
        if (!v276) {
          goto LABEL_246;
        }
        goto LABEL_158;
      }
      break;
    }

    v178 = v274;
LABEL_246:

    if ([v175 count] < v300 && v266++ < 0x3F) {
      continue;
    }
    break;
  }
LABEL_249:
  if (v178) {
    free(v178);
  }
LABEL_251:
  uint64_t v252 = mach_absolute_time();
  uint32_t numer = info.numer;
  denouint64_t m = info.denom;
  v255 = v262;
  v256 = v255;
  if (v263 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v255))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v256, OS_SIGNPOST_INTERVAL_END, spid, "RelatedDiversity", "", buf, 2u);
  }

  v257 = v256;
  if (os_log_type_enabled(v257, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v400 = "RelatedDiversity";
    __int16 v401 = 2048;
    double v402 = (float)((float)((float)((float)(v252 - v261) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v257, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  id v258 = v175;
  return v258;
}

void __104__PGRelatedComputer__diverseResultsFromMatchingResults_inGraph_timeShuffleDate_matchingOptions_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v4 = objc_msgSend(v3, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 32), "targetEventDomain", 0));
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "identifier"));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_postProcessMatchingResults:(id)a3 inGraph:(id)a4 matchingOptions:(id)a5 options:(id)a6
{
  uint64_t v264 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v158 = a4;
  id v11 = a5;
  id v12 = a6;
  v178 = self;
  id v13 = self->_loggingConnection;
  os_signpost_id_t v14 = os_signpost_id_generate((os_log_t)v13);
  long long v15 = v13;
  long long v16 = v15;
  unint64_t v155 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "RelatedPostProcessing", "", buf, 2u);
  }
  os_signpost_id_t spid = v14;
  v154 = v16;

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v151 = mach_absolute_time();
  uint64_t v196 = v11;
  int8x8_t v17 = (int8x8_t)[v11 relatedType];
  v168 = [v12 filteringLocalIdentifiers];
  uint64_t v157 = v12;
  uint64_t v18 = [v12 fetchLimit];
  long long v235 = 0u;
  long long v236 = 0u;
  uint64_t v19 = 64;
  if (v18) {
    uint64_t v19 = v18;
  }
  unint64_t v162 = v19;
  long long v237 = 0uLL;
  long long v238 = 0uLL;
  id v20 = v10;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v235 objects:v257 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v236;
    uint8x8_t v24 = (uint8x8_t)vcnt_s8(v17);
    v24.i16[0] = vaddlv_u8(v24);
    unint64_t v25 = v24.u32[0];
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v236 != v23) {
          objc_enumerationMutation(v20);
        }
        if (v25 >= 2)
        {
          v27 = *(void **)(*((void *)&v235 + 1) + 8 * i);
          uint64_t v28 = [v27 event];
          [v28 contentScore];
          double v30 = v29;

          [v27 score];
          [v27 setScore:(v30 * 0.1 + 0.9) * v31];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v235 objects:v257 count:16];
    }
    while (v22);
  }
  int8x8_t v173 = v17;

  uint64_t v197 = [MEMORY[0x1E4F28E60] indexSet];
  +[PGGraph defaultMatchingSortDescriptors];
  v153 = v156 = v20;
  uint64_t v32 = objc_msgSend(v20, "sortedArrayUsingDescriptors:");
  unint64_t v33 = [v32 count];
  if (v33 >= 0x40) {
    uint64_t v34 = 64;
  }
  else {
    uint64_t v34 = v33;
  }
  v152 = v32;
  size_t v176 = objc_msgSend(v32, "subarrayWithRange:", 0, v34);
  uint64_t v199 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v35 = [MEMORY[0x1E4F28E60] indexSet];
  v198 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v36 = [MEMORY[0x1E4F1CA60] dictionary];
  v37 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v231 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  -[PGRelatedComputer _weekendsForTargetDomain:inGraph:](v178, "_weekendsForTargetDomain:inGraph:", [v196 targetEventDomain], v158);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v188 = [obj countByEnumeratingWithState:&v231 objects:v256 count:16];
  if (v188)
  {
    uint64_t v184 = *(void *)v232;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v232 != v184) {
          objc_enumerationMutation(obj);
        }
        uint64_t v193 = v38;
        BOOL v39 = *(void **)(*((void *)&v231 + 1) + 8 * v38);
        long long v227 = 0u;
        long long v228 = 0u;
        long long v229 = 0u;
        long long v230 = 0u;
        id v40 = v39;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v227 objects:v255 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v228;
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v228 != v43) {
                objc_enumerationMutation(v40);
              }
              uint64_t v45 = [*(id *)(*((void *)&v227 + 1) + 8 * j) identifier];
              id v46 = [NSNumber numberWithUnsignedInteger:v45];
              [v36 setObject:v40 forKeyedSubscript:v46];

              [v199 addIndex:v45];
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v227 objects:v255 count:16];
          }
          while (v42);
        }

        uint64_t v38 = v193 + 1;
      }
      while (v193 + 1 != v188);
      uint64_t v188 = [obj countByEnumeratingWithState:&v231 objects:v256 count:16];
    }
    while (v188);
  }

  uint64_t v180 = [MEMORY[0x1E4F28BD0] set];
  long long v223 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  -[PGRelatedComputer _tripsForTargetDomain:inGraph:](v178, "_tripsForTargetDomain:inGraph:", [v196 targetEventDomain], v158);
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v189 = [obja countByEnumeratingWithState:&v223 objects:v254 count:16];
  if (v189)
  {
    uint64_t v185 = *(void *)v224;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v224 != v185) {
          objc_enumerationMutation(obja);
        }
        uint64_t v194 = v47;
        uint64_t v48 = *(void **)(*((void *)&v223 + 1) + 8 * v47);
        long long v219 = 0u;
        long long v220 = 0u;
        long long v221 = 0u;
        long long v222 = 0u;
        id v49 = v48;
        uint64_t v50 = [v49 countByEnumeratingWithState:&v219 objects:v253 count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v52 = *(void *)v220;
          do
          {
            for (uint64_t k = 0; k != v51; ++k)
            {
              if (*(void *)v220 != v52) {
                objc_enumerationMutation(v49);
              }
              uint64_t v54 = [*(id *)(*((void *)&v219 + 1) + 8 * k) identifier];
              double v55 = [NSNumber numberWithUnsignedInteger:v54];
              [v37 setObject:v49 forKeyedSubscript:v55];

              [v35 addIndex:v54];
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v219 objects:v253 count:16];
          }
          while (v51);
        }

        uint64_t v47 = v194 + 1;
      }
      while (v194 + 1 != v189);
      uint64_t v189 = [obja countByEnumeratingWithState:&v223 objects:v254 count:16];
    }
    while (v189);
  }

  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  id v56 = v176;
  uint64_t v195 = [v56 countByEnumeratingWithState:&v215 objects:v252 count:16];
  if (v195)
  {
    uint64_t v57 = *(void *)v216;
    uint64_t v186 = *(void *)v216;
    id v190 = v56;
    do
    {
      for (uint64_t m = 0; m != v195; ++m)
      {
        if (*(void *)v216 != v57) {
          objc_enumerationMutation(v56);
        }
        double v59 = [*(id *)(*((void *)&v215 + 1) + 8 * m) event];
        uint64_t v60 = [v59 identifier];

        if ([v35 containsIndex:v60])
        {
          uint64_t v61 = [NSNumber numberWithUnsignedInteger:v60];
          uint64_t v62 = [v37 objectForKeyedSubscript:v61];

          [v180 addObject:v62];
          if ((unint64_t)[v180 countForObject:v62] >= 2)
          {
            long long v213 = 0u;
            long long v214 = 0u;
            long long v211 = 0u;
            long long v212 = 0u;
            id v63 = v62;
            uint64_t v64 = [v63 countByEnumeratingWithState:&v211 objects:v251 count:16];
            if (v64)
            {
              uint64_t v65 = v64;
              uint64_t v66 = *(void *)v212;
              do
              {
                for (uint64_t n = 0; n != v65; ++n)
                {
                  if (*(void *)v212 != v66) {
                    objc_enumerationMutation(v63);
                  }
                  objc_msgSend(v198, "addIndex:", objc_msgSend(*(id *)(*((void *)&v211 + 1) + 8 * n), "identifier"));
                }
                uint64_t v65 = [v63 countByEnumeratingWithState:&v211 objects:v251 count:16];
              }
              while (v65);
            }

            uint64_t v57 = v186;
            id v56 = v190;
          }
        }
      }
      uint64_t v195 = [v56 countByEnumeratingWithState:&v215 objects:v252 count:16];
    }
    while (v195);
  }

  id v169 = [(PGManagerWorkingContext *)v178->_workingContext photoLibrary];
  v175 = v178->_blockedFeatures;
  id v171 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v162];
  long long v207 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  id v68 = v56;
  uint64_t v170 = v68;
  uint64_t v179 = [v68 countByEnumeratingWithState:&v207 objects:v250 count:16];
  if (!v179) {
    goto LABEL_155;
  }
  uint64_t v69 = *(void *)v208;
  uint8x8_t v70 = (uint8x8_t)vcnt_s8(v173);
  v70.i16[0] = vaddlv_u8(v70);
  unint64_t v161 = v70.u32[0];
  uint64_t v174 = *(void *)v208;
  while (2)
  {
    long long v71 = 0;
    do
    {
      if (*(void *)v208 != v69) {
        objc_enumerationMutation(v68);
      }
      id objb = v71;
      long long v72 = *(void **)(*((void *)&v207 + 1) + 8 * (void)v71);
      uint64_t v73 = [v72 event];
      uint64_t v74 = [v73 identifier];
      if ([v73 isInteresting]
        && ([v197 containsIndex:v74] & 1) == 0
        && !+[PGMemoryController anyBlockedFeatureIn:v175 isHitByEvent:v73])
      {
        v177 = v73;
        unsigned int v172 = [v196 needsKeywords];
        if (([v199 containsIndex:v74] & 1) == 0
          && ([v198 containsIndex:v74] & 1) == 0)
        {
          double v110 = v73;
          double v111 = [v73 photoEvent];
          double v112 = [v111 fetchAssetCollectionInPhotoLibrary:v169];

          if (v112)
          {
            double v113 = [v112 localIdentifier];
            char v114 = [v168 containsObject:v113];

            if (v114)
            {
              v115 = 0;
              uint64_t v69 = v174;
LABEL_148:

              goto LABEL_149;
            }
            v115 = [[PGRelated alloc] initWithGraphMatchingResult:v72 assetCollection:v112 needsDebugInfo:v172];

            uint64_t v69 = v174;
            if (!v115)
            {
LABEL_149:
              if ([v171 count] >= v162)
              {

                goto LABEL_155;
              }
              goto LABEL_150;
            }
LABEL_138:
            if (v161 >= 2)
            {
              [v110 contentScore];
              double v132 = v131;
              [(PGRelated *)v115 score];
              [(PGRelated *)v115 setScore:v133 / (v132 * 0.1 + 0.9)];
            }
            [v171 addObject:v115];
            long long v205 = 0u;
            long long v206 = 0u;
            long long v203 = 0u;
            long long v204 = 0u;
            double v112 = [v110 dateNodes];
            uint64_t v134 = [v112 countByEnumeratingWithState:&v203 objects:v249 count:16];
            if (v134)
            {
              uint64_t v135 = v134;
              v192 = v115;
              uint64_t v136 = *(void *)v204;
              do
              {
                for (iuint64_t i = 0; ii != v135; ++ii)
                {
                  if (*(void *)v204 != v136) {
                    objc_enumerationMutation(v112);
                  }
                  double v138 = [*(id *)(*((void *)&v203 + 1) + 8 * ii) collection];
                  double v139 = [v138 momentNodes];
                  v200[0] = MEMORY[0x1E4F143A8];
                  v200[1] = 3221225472;
                  v200[2] = __81__PGRelatedComputer__postProcessMatchingResults_inGraph_matchingOptions_options___block_invoke;
                  v200[3] = &unk_1E68F0768;
                  id v201 = v196;
                  id v202 = v197;
                  [v139 enumerateNodesUsingBlock:v200];
                }
                uint64_t v135 = [v112 countByEnumeratingWithState:&v203 objects:v249 count:16];
              }
              while (v135);
              id v68 = v170;
              uint64_t v69 = v174;
              double v110 = v177;
              v115 = v192;
            }
            goto LABEL_148;
          }
          double v126 = +[PGLogging sharedLogging];
          double v127 = [v126 loggingConnection];

          if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v261 = "-[PGRelatedComputer _postProcessMatchingResults:inGraph:matchingOptions:options:]";
            _os_log_error_impl(&dword_1D1805000, v127, OS_LOG_TYPE_ERROR, "Nil asset collection for momentNode in %s, graph is out-of-sync with the photo library.", buf, 0xCu);
          }

          v115 = 0;
          uint64_t v69 = v174;
LABEL_150:

          uint64_t v73 = v177;
          goto LABEL_151;
        }
        if ([v199 containsIndex:v74])
        {
          id v187 = v197;
          id v165 = v72;
          id v75 = v36;
          id v76 = v175;
          id v167 = v169;
          id v166 = v168;
          uint64_t v163 = [NSNumber numberWithUnsignedInteger:v74];
          id v164 = v75;
          id v77 = objc_msgSend(v75, "objectForKeyedSubscript:");
          v191 = [MEMORY[0x1E4F1CA48] array];
          long long v244 = 0u;
          long long v245 = 0u;
          long long v246 = 0u;
          long long v247 = 0u;
          id v78 = v77;
          uint64_t v79 = [v78 countByEnumeratingWithState:&v244 objects:buf count:16];
          if (v79)
          {
            uint64_t v80 = v79;
            uint64_t v81 = *(void *)v245;
            do
            {
              for (juint64_t j = 0; jj != v80; ++jj)
              {
                if (*(void *)v245 != v81) {
                  objc_enumerationMutation(v78);
                }
                uint64_t v83 = *(void *)(*((void *)&v244 + 1) + 8 * jj);
                if (!+[PGMemoryController anyBlockedFeatureIn:isHitByEvent:](PGMemoryController, "anyBlockedFeatureIn:isHitByEvent:", v76, v83))[v191 addObject:v83]; {
              }
                }
              uint64_t v80 = [v78 countByEnumeratingWithState:&v244 objects:buf count:16];
            }
            while (v80);
          }

          v84 = v191;
          if ([v191 count])
          {
            if ([v191 count] != 1)
            {
              long long v242 = 0u;
              long long v243 = 0u;
              long long v240 = 0u;
              long long v241 = 0u;
              id v85 = v78;
              uint64_t v86 = [v85 countByEnumeratingWithState:&v240 objects:v259 count:16];
              if (v86)
              {
                uint64_t v87 = v86;
                uint64_t v88 = *(void *)v241;
                do
                {
                  for (kuint64_t k = 0; kk != v87; ++kk)
                  {
                    if (*(void *)v241 != v88) {
                      objc_enumerationMutation(v85);
                    }
                    objc_msgSend(v187, "addIndex:", objc_msgSend(*(id *)(*((void *)&v240 + 1) + 8 * kk), "identifier"));
                  }
                  uint64_t v87 = [v85 countByEnumeratingWithState:&v240 objects:v259 count:16];
                }
                while (v87);
              }

              BOOL v90 = [v191 firstObject];
              v91 = [v90 highlightGroupNode];

              id v159 = v91;
              uint64_t v160 = [(PGRelated *)v91 fetchAssetCollectionInPhotoLibrary:v167];
              unint64_t v92 = [v160 localIdentifier];
              char v93 = [v166 containsObject:v92];

              if ((v93 & 1) == 0)
              {
                uint64_t v94 = v172;
                if (v172)
                {
                  double v95 = NSString;
                  BOOL v96 = @"Weekend";
LABEL_133:
                  double v129 = [v95 stringWithFormat:@"%@ upgrade", v96];
                  id v258 = v129;
                  BOOL v130 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v258 count:1];
                  [v165 addKeywords:v130 forRelatedType:128];

                  uint64_t v94 = v172;
                  goto LABEL_134;
                }
                goto LABEL_134;
              }
              goto LABEL_122;
            }
            goto LABEL_107;
          }
        }
        else
        {
          id v187 = v197;
          id v165 = v72;
          id v97 = v37;
          id v76 = v175;
          id v167 = v169;
          id v166 = v168;
          uint64_t v163 = [NSNumber numberWithUnsignedInteger:v74];
          id v164 = v97;
          double v98 = objc_msgSend(v97, "objectForKeyedSubscript:");
          v191 = [MEMORY[0x1E4F1CA48] array];
          long long v244 = 0u;
          long long v245 = 0u;
          long long v246 = 0u;
          long long v247 = 0u;
          id v78 = v98;
          uint64_t v99 = [v78 countByEnumeratingWithState:&v244 objects:buf count:16];
          if (v99)
          {
            uint64_t v100 = v99;
            uint64_t v101 = *(void *)v245;
            do
            {
              for (muint64_t m = 0; mm != v100; ++mm)
              {
                if (*(void *)v245 != v101) {
                  objc_enumerationMutation(v78);
                }
                uint64_t v103 = *(void *)(*((void *)&v244 + 1) + 8 * mm);
                if (!+[PGMemoryController anyBlockedFeatureIn:isHitByEvent:](PGMemoryController, "anyBlockedFeatureIn:isHitByEvent:", v76, v103))[v191 addObject:v103]; {
              }
                }
              uint64_t v100 = [v78 countByEnumeratingWithState:&v244 objects:buf count:16];
            }
            while (v100);
          }

          v84 = v191;
          if ([v191 count])
          {
            if ([v191 count] != 1)
            {
              long long v242 = 0u;
              long long v243 = 0u;
              long long v240 = 0u;
              long long v241 = 0u;
              id v116 = v78;
              uint64_t v117 = [v116 countByEnumeratingWithState:&v240 objects:v259 count:16];
              if (v117)
              {
                uint64_t v118 = v117;
                uint64_t v119 = *(void *)v241;
                do
                {
                  for (nuint64_t n = 0; nn != v118; ++nn)
                  {
                    if (*(void *)v241 != v119) {
                      objc_enumerationMutation(v116);
                    }
                    objc_msgSend(v187, "addIndex:", objc_msgSend(*(id *)(*((void *)&v240 + 1) + 8 * nn), "identifier"));
                  }
                  uint64_t v118 = [v116 countByEnumeratingWithState:&v240 objects:v259 count:16];
                }
                while (v118);
              }

              double v121 = [v191 firstObject];
              double v122 = [v121 highlightGroupNode];

              id v159 = v122;
              uint64_t v160 = [(PGRelated *)v122 fetchAssetCollectionInPhotoLibrary:v167];
              double v123 = [v160 localIdentifier];
              char v124 = [v166 containsObject:v123];

              if ((v124 & 1) == 0)
              {
                uint64_t v94 = v172;
                if (v172)
                {
                  double v95 = NSString;
                  BOOL v96 = @"Trip";
                  goto LABEL_133;
                }
LABEL_134:
                v125 = v160;
                double v105 = [[PGRelated alloc] initWithGraphMatchingResult:v165 highlight:v160 needsDebugInfo:v94];
                uint64_t v69 = v174;
                goto LABEL_135;
              }
LABEL_122:
              double v105 = 0;
              uint64_t v69 = v174;
              v125 = v160;
LABEL_135:

              id v68 = v170;
              unint64_t v108 = v164;
              char v109 = v159;
LABEL_136:

LABEL_137:
              double v110 = v177;
              v115 = v105;
              if (v105) {
                goto LABEL_138;
              }
              goto LABEL_150;
            }
LABEL_107:
            v104 = [v84 firstObject];
            double v105 = [v104 fetchAssetCollectionInPhotoLibrary:v167];

            if (v105)
            {
              double v106 = [(PGRelated *)v105 localIdentifier];
              char v107 = [v166 containsObject:v106];

              unint64_t v108 = v164;
              if (v107)
              {
                char v109 = v105;
                double v105 = 0;
              }
              else
              {
                double v128 = [[PGRelated alloc] initWithGraphMatchingResult:v165 assetCollection:v105 needsDebugInfo:v172];
                char v109 = v105;
                double v105 = v128;
              }
              id v68 = v170;
              uint64_t v69 = v174;
            }
            else
            {
              char v109 = 0;
              id v68 = v170;
              uint64_t v69 = v174;
              unint64_t v108 = v164;
            }
            goto LABEL_136;
          }
        }
        double v105 = 0;
        id v68 = v170;
        uint64_t v69 = v174;
        unint64_t v108 = v164;
        goto LABEL_137;
      }
LABEL_151:

      long long v71 = objb + 1;
    }
    while (objb + 1 != (char *)v179);
    uint64_t v179 = [v68 countByEnumeratingWithState:&v207 objects:v250 count:16];
    if (v179) {
      continue;
    }
    break;
  }
LABEL_155:

  double v140 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  double v141 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"highlight" ascending:0 comparator:&__block_literal_global_72173];
  double v142 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"moments" ascending:0 comparator:&__block_literal_global_396];
  v248[0] = v140;
  v248[1] = v141;
  v248[2] = v142;
  double v143 = [MEMORY[0x1E4F1C978] arrayWithObjects:v248 count:3];
  [v171 sortUsingDescriptors:v143];

  uint64_t v144 = mach_absolute_time();
  uint32_t numer = info.numer;
  denouint64_t m = info.denom;
  double v147 = v154;
  double v148 = v147;
  if (v155 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v147))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v148, OS_SIGNPOST_INTERVAL_END, spid, "RelatedPostProcessing", "", buf, 2u);
  }

  if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v261 = "RelatedPostProcessing";
    __int16 v262 = 2048;
    double v263 = (float)((float)((float)((float)(v144 - v151) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v148, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v171;
}

void __81__PGRelatedComputer__postProcessMatchingResults_inGraph_matchingOptions_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v4 = objc_msgSend(v3, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 32), "targetEventDomain", 0));
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "identifier"));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

uint64_t __81__PGRelatedComputer__postProcessMatchingResults_inGraph_matchingOptions_options___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 firstObject];
  uint64_t v6 = [v5 startDate];
  uint64_t v7 = [v4 firstObject];

  uint64_t v8 = [v7 startDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __81__PGRelatedComputer__postProcessMatchingResults_inGraph_matchingOptions_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 startDate];
  uint64_t v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)relatedCollectionBetweenAssetCollection:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 curationContext:(id)a6 needsDebugInfo:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  long long v15 = 0;
  if (v12 && v13)
  {
    if ([v12 assetCollectionType] == 3)
    {
      uint64_t v16 = [(PGRelatedComputer *)self _relatedCollectionBetweenMoment:v12 andAssetCollection:v13 relatedType:a5 needsDebugInfo:v7 needsDiversityInfo:1];
LABEL_7:
      long long v15 = (void *)v16;
      goto LABEL_21;
    }
    if ([v12 assetCollectionType] == 6)
    {
      uint64_t v16 = [(PGRelatedComputer *)self _relatedCollectionBetweenHighlight:v12 andAssetCollection:v13 relatedType:a5 needsDebugInfo:v7 needsDiversityInfo:1];
      goto LABEL_7;
    }
    if ([v12 assetCollectionType] == 4)
    {
      id v17 = v12;
      uint64_t v18 = [v17 subcategory];
      if ((unint64_t)(v18 - 205) > 1)
      {
        double v31 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v17 options:0];
        uint64_t v22 = [v31 fetchedObjects];
        uint64_t v23 = [v17 photoLibrary];
        uint8x8_t v24 = [v23 librarySpecificFetchOptions];

        [v24 setFetchLimit:2];
        uint64_t v32 = (void *)v22;
        double v30 = v24;
        unint64_t v25 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAssets:v22 withType:3 options:v24];
        if ([v25 count] == 1)
        {
          [v25 firstObject];
          v27 = uint64_t v26 = v25;
          long long v15 = [(PGRelatedComputer *)self _relatedCollectionBetweenMoment:v27 andAssetCollection:v13 relatedType:a5 needsDebugInfo:v7 needsDiversityInfo:1];

          unint64_t v25 = v26;
          id v21 = 0;
        }
        else
        {
          id v34 = 0;
          uint64_t v28 = [(PGRelatedComputer *)self _relatedCollectionsForDefaultAssetCollection:v17 relatedType:a5 & 0xFFFFFFFFFFFFFFF5 options:0 assetCollectionForKeywords:v13 curationContext:v14 error:&v34];
          id v21 = v34;
          long long v15 = [v28 firstObject];
        }
        id v20 = v31;
      }
      else
      {
        if (v18 == 205) {
          unint64_t v19 = a5 & 0xFFFFFFFFFFFFFFF5;
        }
        else {
          unint64_t v19 = a5;
        }
        id v35 = 0;
        id v20 = [(PGRelatedComputer *)self _relatedCollectionsForMemoryTripOrWeekend:v17 relatedType:v19 options:0 assetCollectionForKeywords:v13 curationContext:v14 error:&v35];
        id v21 = v35;
        long long v15 = [v20 firstObject];
      }
    }
    else
    {
      id v33 = 0;
      id v17 = [(PGRelatedComputer *)self _relatedCollectionsForDefaultAssetCollection:v12 relatedType:a5 & 0xFFFFFFFFFFFFFFF5 options:0 assetCollectionForKeywords:v13 curationContext:v14 error:&v33];
      id v21 = v33;
      long long v15 = [v17 firstObject];
    }
  }
LABEL_21:

  return v15;
}

- (id)_relatedCollectionBetweenHighlight:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 needsDebugInfo:(BOOL)a6 needsDiversityInfo:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  id v15 = 0;
  if (v12 && v13)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    double v29 = __Block_byref_object_copy__72187;
    double v30 = __Block_byref_object_dispose__72188;
    id v31 = 0;
    workingContext = self->_workingContext;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __121__PGRelatedComputer__relatedCollectionBetweenHighlight_andAssetCollection_relatedType_needsDebugInfo_needsDiversityInfo___block_invoke;
    v18[3] = &unk_1E68F0740;
    id v19 = v12;
    BOOL v24 = a6;
    BOOL v25 = a7;
    id v20 = v14;
    id v21 = self;
    uint64_t v22 = &v26;
    unint64_t v23 = a5;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v18];
    id v15 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }

  return v15;
}

void __121__PGRelatedComputer__relatedCollectionBetweenHighlight_andAssetCollection_relatedType_needsDebugInfo_needsDiversityInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 graph];
  uint64_t v5 = [v4 highlightNodeForHighlight:*(void *)(a1 + 32)];
  uint64_t v64 = v4;
  uint64_t v6 = [v4 eventNodeForAssetCollection:*(void *)(a1 + 40)];
  BOOL v7 = [v6 relatableEvent];

  if (v7)
  {
    uint64_t v8 = 0;
    if (!v5) {
      goto LABEL_19;
    }
LABEL_6:
    long long v10 = +[PGGraphMatchingOptions optionsWithRelatedType:*(void *)(a1 + 64)];
    [v10 setNeedsKeywords:*(unsigned __int8 *)(a1 + 72)];
    uint64_t v62 = v8;
    id v63 = v5;
    if (v7)
    {
      -[NSObject setTargetEventDomain:](v10, "setTargetEventDomain:", [v7 domain]);
      id v11 = [v64 matchEvent:v5 withEvent:v7 options:v10];
      if (v11) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v59 = a1;
      id v60 = v3;
      [v10 setTargetEventDomain:100];
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id obja = v8;
      uint64_t v24 = [obja countByEnumeratingWithState:&v73 objects:v82 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        id v11 = 0;
        id v68 = 0;
        uint64_t v26 = *(void *)v74;
        v27 = v64;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v74 != v26) {
              objc_enumerationMutation(obja);
            }
            double v29 = [v27 momentNodeForMoment:*(void *)(*((void *)&v73 + 1) + 8 * i)];
            if (v29)
            {
              double v30 = v5;
              id v31 = v10;
              uint64_t v32 = [v27 matchEvent:v5 withEvent:v29 options:v10];
              [v32 score];
              double v34 = v33;
              id v35 = v11;
              [v11 score];
              if (v34 <= v36)
              {
                uint64_t v5 = v30;
              }
              else
              {
                id v11 = v32;

                id v37 = v29;
                id v68 = v37;
                uint64_t v5 = v63;
                v27 = v64;
              }

              long long v10 = v31;
            }
          }
          uint64_t v25 = [obja countByEnumeratingWithState:&v73 objects:v82 count:16];
        }
        while (v25);
      }
      else
      {
        id v11 = 0;
        id v68 = 0;
      }

      id v3 = v60;
      uint64_t v8 = v62;
      BOOL v7 = v68;
      a1 = v59;
      if (v11)
      {
LABEL_8:
        if (*(unsigned char *)(a1 + 72))
        {
          obuint64_t j = v11;
          long long v67 = v7;
          double v58 = v10;
          id v12 = [v5 name];
          id v13 = v12;
          if (!v12)
          {
            long long v10 = [v5 photoEvent];
            id v13 = [v10 localIdentifier];
          }
          uint64_t v81 = v13;
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
          [obj addKeywords:v14 forRelatedType:512];

          if (!v12)
          {
          }
          id v15 = [v7 name];
          uint64_t v16 = v15;
          if (!v15)
          {
            long long v10 = [v7 photoEvent];
            uint64_t v16 = [v10 localIdentifier];
          }
          uint64_t v80 = v16;
          id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
          [obj addKeywords:v17 forRelatedType:256];

          if (!v15)
          {
          }
          uint64_t v18 = [v64 matchEvent:v63 options:v58];
          id v19 = *(void **)(a1 + 48);
          if (*(unsigned char *)(a1 + 73))
          {
            id v20 = [v63 localStartDate];
            uint64_t v21 = v18;
            uint64_t v22 = [v19 _diverseResultsFromMatchingResults:v18 inGraph:v64 timeShuffleDate:v20 matchingOptions:v58 options:0];
          }
          else
          {
            uint64_t v21 = v18;
            uint64_t v22 = [*(id *)(a1 + 48) _postProcessMatchingResults:v18 inGraph:v64 matchingOptions:v58 options:0];
          }
          id v11 = obj;
          uint64_t v57 = v21;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v44 = v22;
          uint64_t v45 = [v44 countByEnumeratingWithState:&v69 objects:v79 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v70;
            id v61 = v3;
            while (2)
            {
              for (uint64_t j = 0; j != v46; ++j)
              {
                if (*(void *)v70 != v47) {
                  objc_enumerationMutation(v44);
                }
                id v49 = *(void **)(*((void *)&v69 + 1) + 8 * j);
                uint64_t v50 = objc_msgSend(v49, "highlight", v57);
                uint64_t v51 = (void *)MEMORY[0x1E4F1CAD0];
                if (v50)
                {
                  uint64_t v52 = [v49 highlight];
                  [v51 setWithObject:v52];
                }
                else
                {
                  uint64_t v52 = [v49 moments];
                  [v51 setWithArray:v52];
                uint64_t v53 = };

                uint64_t v8 = v62;
                if (([v53 containsObject:*(void *)(a1 + 40)] & 1) != 0
                  || v62 && [v53 intersectsSet:v62])
                {
                  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v49);

                  id v3 = v61;
                  id v11 = obj;
                  goto LABEL_51;
                }
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v69 objects:v79 count:16];
              id v3 = v61;
              id v11 = obj;
              if (v46) {
                continue;
              }
              break;
            }
          }
LABEL_51:

          uint64_t v54 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          double v55 = [v11 keywords];
          [v54 _addKeywordsFromKeywords:v55];

          uint64_t v5 = v63;
          BOOL v7 = v67;
          BOOL v39 = v57;
          long long v10 = v58;
        }
        else
        {
          uint64_t v38 = *(void **)(a1 + 48);
          id v78 = v11;
          BOOL v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
          id v40 = [v38 _postProcessMatchingResults:v39 inGraph:v64 matchingOptions:v10 options:0];
          uint64_t v41 = [v40 firstObject];
          uint64_t v42 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v43 = *(void **)(v42 + 40);
          *(void *)(v42 + 40) = v41;
        }
        goto LABEL_56;
      }
    }
    id v56 = +[PGLogging sharedLogging];
    BOOL v39 = [v56 loggingConnection];

    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v39, OS_LOG_TYPE_ERROR, "No matching moment found for nodes", buf, 2u);
    }
LABEL_56:

    goto LABEL_57;
  }
  uint64_t v9 = PGMomentsForAssetCollection(*(void *)(a1 + 40));
  uint64_t v8 = v9;
  if (v5 && [v9 count]) {
    goto LABEL_6;
  }
LABEL_19:
  unint64_t v23 = +[PGLogging sharedLogging];
  long long v10 = [v23 loggingConnection];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "No moment found for asset", buf, 2u);
  }
LABEL_57:
}

- (id)_relatedCollectionBetweenMoment:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 needsDebugInfo:(BOOL)a6 needsDiversityInfo:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = v13;
  id v15 = 0;
  if (v12 && v13)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    double v29 = __Block_byref_object_copy__72187;
    double v30 = __Block_byref_object_dispose__72188;
    id v31 = 0;
    workingContext = self->_workingContext;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __118__PGRelatedComputer__relatedCollectionBetweenMoment_andAssetCollection_relatedType_needsDebugInfo_needsDiversityInfo___block_invoke;
    v18[3] = &unk_1E68F0740;
    id v19 = v12;
    BOOL v24 = a6;
    BOOL v25 = a7;
    id v20 = v14;
    uint64_t v21 = self;
    uint64_t v22 = &v26;
    unint64_t v23 = a5;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v18];
    id v15 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }

  return v15;
}

void __118__PGRelatedComputer__relatedCollectionBetweenMoment_andAssetCollection_relatedType_needsDebugInfo_needsDiversityInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 graph];
  uint64_t v5 = [v4 momentNodeForMoment:*(void *)(a1 + 32)];
  uint64_t v65 = v4;
  uint64_t v6 = [v4 eventNodeForAssetCollection:*(void *)(a1 + 40)];
  BOOL v7 = [v6 relatableEvent];

  if (v7)
  {
    uint64_t v8 = 0;
    if (!v5) {
      goto LABEL_15;
    }
LABEL_6:
    long long v10 = +[PGGraphMatchingOptions optionsWithRelatedType:*(void *)(a1 + 64)];
    [v10 setNeedsKeywords:*(unsigned __int8 *)(a1 + 72)];
    id v63 = v8;
    uint64_t v64 = v5;
    if (v7)
    {
      -[NSObject setTargetEventDomain:](v10, "setTargetEventDomain:", [v7 domain]);
      id v11 = [v65 matchEvent:v5 withEvent:v7 options:v10];
      if (v11) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v60 = a1;
      id v61 = v3;
      [v10 setTargetEventDomain:100];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id obja = v8;
      uint64_t v22 = [obja countByEnumeratingWithState:&v74 objects:v83 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        id v24 = 0;
        long long v69 = 0;
        uint64_t v25 = *(void *)v75;
        uint64_t v26 = v65;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v75 != v25) {
              objc_enumerationMutation(obja);
            }
            uint64_t v28 = [v26 momentNodeForMoment:*(void *)(*((void *)&v74 + 1) + 8 * i)];
            if (v28)
            {
              double v29 = v5;
              double v30 = v10;
              id v31 = [v26 matchEvent:v5 withEvent:v28 options:v10];
              [v31 score];
              double v33 = v32;
              double v34 = v24;
              [v24 score];
              if (v33 <= v35)
              {
                uint64_t v5 = v29;
              }
              else
              {
                id v24 = v31;

                id v36 = v28;
                long long v69 = v36;
                uint64_t v5 = v64;
                uint64_t v26 = v65;
              }

              long long v10 = v30;
            }
          }
          uint64_t v23 = [obja countByEnumeratingWithState:&v74 objects:v83 count:16];
        }
        while (v23);
      }
      else
      {
        id v24 = 0;
        long long v69 = 0;
      }

      id v3 = v61;
      uint64_t v8 = v63;
      BOOL v7 = v69;
      a1 = v60;
      id v11 = v24;
      if (v24)
      {
LABEL_8:
        if (*(unsigned char *)(a1 + 72))
        {
          obuint64_t j = v10;
          id v12 = [v5 name];
          uint64_t v82 = v12;
          id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
          [v11 addKeywords:v13 forRelatedType:512];

          id v68 = v7;
          id v14 = [v7 name];
          id v15 = v14;
          if (!v14)
          {
            id v13 = [v68 photoEvent];
            id v15 = [v13 localIdentifier];
          }
          uint64_t v81 = v15;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
          uint64_t v59 = v11;
          [v11 addKeywords:v16 forRelatedType:256];

          if (!v14)
          {
          }
          uint64_t v17 = [v65 matchEvent:v64 options:obj];
          uint64_t v18 = *(void **)(a1 + 48);
          double v58 = v17;
          if (*(unsigned char *)(a1 + 73))
          {
            id v19 = [v64 localStartDate];
            id v20 = [v18 _diverseResultsFromMatchingResults:v17 inGraph:v65 timeShuffleDate:v19 matchingOptions:obj options:0];
          }
          else
          {
            id v20 = [v18 _postProcessMatchingResults:v17 inGraph:v65 matchingOptions:obj options:0];
          }
          BOOL v7 = v68;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v43 = v20;
          uint64_t v44 = [v43 countByEnumeratingWithState:&v70 objects:v80 count:16];
          uint64_t v45 = a1;
          uint64_t v46 = v43;
          if (v44)
          {
            uint64_t v47 = v44;
            uint64_t v48 = *(void *)v71;
            id v62 = v3;
            while (2)
            {
              for (uint64_t j = 0; j != v47; ++j)
              {
                if (*(void *)v71 != v48) {
                  objc_enumerationMutation(v46);
                }
                uint64_t v50 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                uint64_t v51 = objc_msgSend(v50, "highlight", v58);
                uint64_t v52 = (void *)MEMORY[0x1E4F1CAD0];
                if (v51)
                {
                  uint64_t v53 = [v50 highlight];
                  [v52 setWithObject:v53];
                }
                else
                {
                  uint64_t v53 = [v50 moments];
                  [v52 setWithArray:v53];
                uint64_t v54 = };

                uint64_t v8 = v63;
                if (([v54 containsObject:*(void *)(v45 + 40)] & 1) != 0
                  || v63 && [v54 intersectsSet:v63])
                {
                  objc_storeStrong((id *)(*(void *)(*(void *)(v45 + 56) + 8) + 40), v50);

                  id v3 = v62;
                  BOOL v7 = v68;
                  goto LABEL_47;
                }
              }
              uint64_t v47 = [v46 countByEnumeratingWithState:&v70 objects:v80 count:16];
              id v3 = v62;
              BOOL v7 = v68;
              if (v47) {
                continue;
              }
              break;
            }
          }
LABEL_47:

          double v55 = *(void **)(*(void *)(*(void *)(v45 + 56) + 8) + 40);
          id v11 = v59;
          id v56 = [v59 keywords];
          [v55 _addKeywordsFromKeywords:v56];

          uint64_t v5 = v64;
          long long v10 = obj;
          uint64_t v38 = v58;
        }
        else
        {
          id v37 = *(void **)(a1 + 48);
          uint64_t v79 = v11;
          uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
          BOOL v39 = [v37 _postProcessMatchingResults:v38 inGraph:v65 matchingOptions:v10 options:0];
          uint64_t v40 = [v39 firstObject];
          uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v42 = *(void **)(v41 + 40);
          *(void *)(v41 + 40) = v40;
        }
        goto LABEL_52;
      }
    }
    uint64_t v57 = +[PGLogging sharedLogging];
    uint64_t v38 = [v57 loggingConnection];

    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v38, OS_LOG_TYPE_ERROR, "No matching moment found for nodes", buf, 2u);
    }
LABEL_52:

    goto LABEL_53;
  }
  uint64_t v9 = PGMomentsForAssetCollection(*(void *)(a1 + 40));
  uint64_t v8 = v9;
  if (v5 && [v9 count]) {
    goto LABEL_6;
  }
LABEL_15:
  uint64_t v21 = +[PGLogging sharedLogging];
  long long v10 = [v21 loggingConnection];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "No moment found for asset", buf, 2u);
  }
LABEL_53:
}

- (id)relatedCollectionBetweenAsset:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 needsDebugInfo:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  id v13 = 0;
  if (v10 && v11)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__72187;
    v27 = __Block_byref_object_dispose__72188;
    id v28 = 0;
    workingContext = self->_workingContext;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __97__PGRelatedComputer_relatedCollectionBetweenAsset_andAssetCollection_relatedType_needsDebugInfo___block_invoke;
    v16[3] = &unk_1E68F0718;
    id v17 = v10;
    BOOL v22 = a6;
    id v18 = v12;
    id v19 = self;
    id v20 = &v23;
    unint64_t v21 = a5;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v16];
    id v13 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
  }

  return v13;
}

void __97__PGRelatedComputer_relatedCollectionBetweenAsset_andAssetCollection_relatedType_needsDebugInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 graph];
  uint64_t v5 = [v4 momentNodeForAsset:*(void *)(a1 + 32)];
  if (v5)
  {
    if ([*(id *)(a1 + 40) assetCollectionType] == 3)
    {
      uint64_t v6 = [v4 momentNodeForMoment:*(void *)(a1 + 40)];
    }
    else
    {
      if ([*(id *)(a1 + 40) assetCollectionType] != 6)
      {
        uint64_t v86 = PGMomentsForAssetCollection(*(void *)(a1 + 40));
        goto LABEL_11;
      }
      uint64_t v6 = [v4 highlightNodeForHighlight:*(void *)(a1 + 40)];
    }
    uint64_t v8 = v6;
    uint64_t v86 = 0;
    if (v6)
    {
      id v80 = v3;
      char v10 = 0;
      goto LABEL_13;
    }
LABEL_11:
    if (![v86 count])
    {
      id v37 = +[PGLogging sharedLogging];
      id v12 = [v37 loggingConnection];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v75 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v102 = v75;
        _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "No moment(s) found for assetCollection %@", buf, 0xCu);
      }
      uint64_t v8 = 0;
      goto LABEL_60;
    }
    id v80 = v3;
    uint64_t v8 = 0;
    char v10 = 1;
LABEL_13:
    id v11 = [*(id *)(a1 + 32) photoLibrary];
    id v12 = [v11 librarySpecificFetchOptions];

    [v12 setFetchLimit:1];
    id v13 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:*(void *)(a1 + 32) withType:3 options:v12];
    if (![v13 count])
    {
      id v36 = +[PGLogging sharedLogging];
      id v14 = [v36 loggingConnection];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v74 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v102 = v74;
        _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "Cannot find asset collection for inAsset %@", buf, 0xCu);
      }
      id v3 = v80;
      goto LABEL_59;
    }
    uint64_t v79 = v12;
    id v14 = +[PGGraphMatchingOptions optionsWithRelatedType:*(void *)(a1 + 64)];
    [v14 setNeedsKeywords:*(unsigned __int8 *)(a1 + 72)];
    id v15 = objc_opt_class();
    uint64_t v16 = *(void *)(a1 + 32);
    id v78 = v13;
    id v17 = [v13 firstObject];
    id v18 = [v15 searchNodesInGraph:v4 forAsset:v16 inMoment:v17];
    [v14 setFocusedNodes:v18];

    uint64_t v83 = a1;
    if (v10)
    {
      uint64_t v82 = v14;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v19 = v86;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v91 objects:v100 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        BOOL v22 = 0;
        uint64_t v8 = 0;
        uint64_t v84 = *(void *)v92;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v92 != v84) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v91 + 1) + 8 * i);
            uint64_t v25 = [v4 momentNodeForMoment:v24];
            if ([v5 isSameNodeAsNode:v25])
            {
              uint64_t v38 = [[PGRelated alloc] initWithMoment:v24 needsDebugInfo:*(unsigned __int8 *)(a1 + 72)];
              uint64_t v39 = *(void *)(*(void *)(a1 + 56) + 8);
              uint64_t v40 = *(void **)(v39 + 40);
              *(void *)(v39 + 40) = v38;

              [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) _addKeywords:&unk_1F28D4D88 forRelatedType:128];
              uint64_t v41 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
              uint64_t v42 = [v25 name];
              uint64_t v99 = v42;
              [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
              uint64_t v44 = v43 = v22;
              [v41 _addKeywords:v44 forRelatedType:256];

              id v3 = v80;
              goto LABEL_55;
            }
            if (v25)
            {
              uint64_t v26 = [v4 matchEvent:v5 withEvent:v25 options:v82];
              [v26 score];
              double v28 = v27;
              [v22 score];
              if (v28 > v29)
              {
                double v30 = v4;
                id v31 = v19;
                double v32 = v5;
                double v33 = v26;

                double v34 = v25;
                double v35 = v33;
                uint64_t v5 = v32;
                id v19 = v31;
                id v4 = v30;
                a1 = v83;
                uint64_t v8 = v34;
                BOOL v22 = v35;
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v91 objects:v100 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v22 = 0;
        uint64_t v8 = 0;
      }

      id v3 = v80;
      id v14 = v82;
    }
    else
    {
      BOOL v22 = [v4 matchEvent:v5 withEvent:v8 options:v14];
      id v3 = v80;
    }
    id v12 = v79;
    if (v22)
    {
      if (*(unsigned char *)(a1 + 72))
      {
        uint64_t v45 = [v5 name];
        double v98 = v45;
        uint64_t v46 = v22;
        uint64_t v47 = v14;
        uint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
        [v46 addKeywords:v48 forRelatedType:512];

        id v49 = [v8 name];
        id v97 = v49;
        uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
        id v85 = v46;
        [v46 addKeywords:v50 forRelatedType:256];

        uint64_t v51 = [v4 matchEvent:v5 options:v14];
        uint64_t v52 = *(void **)(a1 + 48);
        uint64_t v53 = [v5 localStartDate];
        long long v77 = (void *)v51;
        uint64_t v82 = v47;
        uint64_t v54 = [v52 _diverseResultsFromMatchingResults:v51 inGraph:v4 timeShuffleDate:v53 matchingOptions:v47 options:0];

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v55 = v54;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v87 objects:v96 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v88;
          id v81 = v3;
          long long v76 = v5;
          while (2)
          {
            for (uint64_t j = 0; j != v57; ++j)
            {
              if (*(void *)v88 != v58) {
                objc_enumerationMutation(v55);
              }
              uint64_t v60 = *(void **)(*((void *)&v87 + 1) + 8 * j);
              id v61 = (void *)MEMORY[0x1E4F1CAD0];
              id v62 = [v60 moments];
              id v63 = [v61 setWithArray:v62];

              if (([v63 containsObject:*(void *)(v83 + 40)] & 1) != 0
                || v86 && [v63 intersectsSet:v86])
              {
                uint64_t v65 = v60;
                a1 = v83;
                objc_storeStrong((id *)(*(void *)(*(void *)(v83 + 56) + 8) + 40), v65);

                id v3 = v81;
                uint64_t v5 = v76;
                goto LABEL_54;
              }
            }
            uint64_t v57 = [v55 countByEnumeratingWithState:&v87 objects:v96 count:16];
            id v3 = v81;
            uint64_t v5 = v76;
            a1 = v83;
            if (v57) {
              continue;
            }
            break;
          }
        }
LABEL_54:

        uint64_t v66 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        id v43 = v85;
        long long v67 = [v85 keywords];
        [v66 _addKeywordsFromKeywords:v67];

LABEL_55:
        id v13 = v78;
        id v12 = v79;
        id v14 = v82;
        goto LABEL_58;
      }
      id v68 = *(void **)(a1 + 48);
      double v95 = v22;
      long long v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
      long long v70 = [v68 _postProcessMatchingResults:v69 inGraph:v4 matchingOptions:v14 options:0];
      uint64_t v71 = [v70 firstObject];
      uint64_t v72 = *(void *)(*(void *)(a1 + 56) + 8);
      long long v73 = *(void **)(v72 + 40);
      *(void *)(v72 + 40) = v71;

      id v43 = v22;
    }
    else
    {
      uint64_t v64 = +[PGLogging sharedLogging];
      id v43 = [v64 loggingConnection];

      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v43, OS_LOG_TYPE_ERROR, "No matching moment found for nodes", buf, 2u);
      }
    }
    id v13 = v78;
LABEL_58:

LABEL_59:
LABEL_60:

    goto LABEL_61;
  }
  BOOL v7 = +[PGLogging sharedLogging];
  uint64_t v8 = [v7 loggingConnection];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v102 = v9;
    _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "No moment found for asset %@", buf, 0xCu);
  }
LABEL_61:
}

- (id)relatedCollectionsForPersonLocalIdentifiers:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (v10 && [v10 count])
  {
    id v12 = self->_loggingConnection;
    os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)v12);
    id v14 = v12;
    id v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RelatedForPersonLocalIdentifiers", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v27 = mach_absolute_time();
    *(void *)buf = 0;
    uint64_t v42 = buf;
    uint64_t v43 = 0x3032000000;
    uint64_t v44 = __Block_byref_object_copy__72187;
    uint64_t v45 = __Block_byref_object_dispose__72188;
    id v46 = 0;
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = __Block_byref_object_copy__72187;
    uint64_t v39 = __Block_byref_object_dispose__72188;
    id v40 = 0;
    workingContext = self->_workingContext;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __91__PGRelatedComputer_relatedCollectionsForPersonLocalIdentifiers_relatedType_options_error___block_invoke;
    v28[3] = &unk_1E68F06F0;
    double v32 = &v35;
    double v33 = buf;
    unint64_t v34 = a4;
    id v29 = v10;
    double v30 = self;
    id v31 = v11;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v28];
    if (v36[5])
    {
      id v17 = +[PGLogging sharedLogging];
      id v18 = [v17 loggingConnection];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = (const char *)v36[5];
        *(_DWORD *)uint64_t v48 = 138412290;
        id v49 = v26;
        _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Error occured: %@", v48, 0xCu);
      }

      if (a6) {
        *a6 = (id) v36[5];
      }
    }
    uint64_t v19 = mach_absolute_time();
    uint32_t numer = info.numer;
    denouint64_t m = info.denom;
    BOOL v22 = v15;
    uint64_t v23 = v22;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)uint64_t v48 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_END, v13, "RelatedForPersonLocalIdentifiers", "", v48, 2u);
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v48 = 136315394;
      id v49 = "RelatedForPersonLocalIdentifiers";
      __int16 v50 = 2048;
      double v51 = (float)((float)((float)((float)(v19 - v27) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v48, 0x16u);
    }
    id v24 = *((id *)v42 + 5);

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v24 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

void __91__PGRelatedComputer_relatedCollectionsForPersonLocalIdentifiers_relatedType_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v6 = [v3 personNodesForPersonLocalIdentifiers:*(void *)(a1 + 32)];
    BOOL v7 = [v5 setWithArray:v6];

    if ((unint64_t)[v7 count] >= 2)
    {
      uint64_t v8 = [v4 meNode];
      if (v8) {
        [v7 removeObject:v8];
      }
    }
    if ([v7 count])
    {
      uint64_t v9 = [v4 matchPersonNodes:v7 sortDescriptors:0];
      if ([v9 count])
      {
        id v10 = +[PGGraphMatchingOptions optionsWithRelatedType:*(void *)(a1 + 72)];
        uint64_t v11 = [*(id *)(a1 + 40) _postProcessMatchingResults:v9 inGraph:v4 matchingOptions:v10 options:*(void *)(a1 + 48)];
        uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
        os_signpost_id_t v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        id v14 = *(void **)(a1 + 40);
        id v15 = [*(id *)(a1 + 48) referenceAssetIdentifier];
        uint64_t v16 = [v14 _referenceAssetWithLocalIdentifier:v15];

        [*(id *)(a1 + 40) _generateTitleForRelatedResults:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) withGraph:v4 referenceEvent:0 referenceAsset:v16];
      }
      else
      {
        uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
        id v10 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      uint64_t v20 = +[PGLogging sharedLogging];
      uint64_t v21 = [v20 loggingConnection];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        int v26 = 138412290;
        uint64_t v27 = v25;
        _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "Couldn't find nodes for person local identifiers: %@", (uint8_t *)&v26, 0xCu);
      }

      uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v17 = +[PGError errorForCode:-10];
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
}

- (id)_relatedCollectionsForMemoryTripOrWeekend:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 assetCollectionForKeywords:(id)a6 curationContext:(id)a7 error:(id *)a8
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v68 = a5;
  id v71 = a6;
  id v67 = a7;
  uint64_t v75 = v14;
  if (v14)
  {
    uint64_t v66 = self;
    id v15 = self->_loggingConnection;
    os_signpost_id_t v16 = os_signpost_id_generate((os_log_t)v15);
    uint64_t v17 = v15;
    uint64_t v18 = v17;
    os_signpost_id_t spid = v16;
    unint64_t v63 = v16 - 1;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "RelatedForMemoryTripOrWeekend", "", buf, 2u);
    }
    id v62 = v18;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v59 = mach_absolute_time();
    uint64_t v74 = objc_msgSend(v75, "cls_localStartDate");
    uint64_t v65 = [v68 filteringLocalIdentifiers];
    unint64_t v69 = [v68 fetchLimit];
    *(void *)buf = 0;
    uint64_t v102 = buf;
    uint64_t v103 = 0x2020000000;
    unint64_t v104 = v69 - (v69 >> 1);
    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    long long v70 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v64 = [v75 photoLibrary];
    uint64_t v20 = (void *)[v68 mutableCopy];
    objc_msgSend(v20, "setFetchLimit:", 2 * objc_msgSend(v68, "fetchLimit"));
    id v61 = v20;
    uint64_t v21 = [(PGRelatedComputer *)self _relatedCollectionsForDefaultAssetCollection:v75 relatedType:a4 options:v20 assetCollectionForKeywords:v71 curationContext:v67 error:a8];
    uint64_t v22 = (void *)[v21 mutableCopy];

    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v97 objects:v113 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v98;
      double v26 = *MEMORY[0x1E4F8B800];
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v98 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          if ([v28 memoryTripTitleType] != 0x7FFFFFFFFFFFFFFFLL
            && (![v28 memoryTripTitleType] && objc_msgSend(v75, "subcategory") == 205
             || [v28 memoryTripTitleType] == 1 && objc_msgSend(v75, "subcategory") == 206))
          {
            id v29 = [v28 highlight];
            double v30 = v29;
            if (v29)
            {
              id v31 = v29;
            }
            else
            {
              double v32 = [v28 moments];
              id v31 = [v32 firstObject];
            }
            double v33 = objc_msgSend(v31, "cls_localStartDate");
            [v33 timeIntervalSinceDate:v74];
            double v35 = v34;

            double v36 = -v35;
            if (v35 >= 0.0) {
              double v36 = v35;
            }
            if (v36 >= v26)
            {
              if (v71) {
                [v28 _addKeywords:&unk_1F28D4D58 forRelatedType:128];
              }
              [v70 addObject:v28];
              uint64_t v37 = [v28 highlight];
              double v112 = v37;
              uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
              id v39 = v38;
              if (!v38)
              {
                obuint64_t j = [v28 moments];
                id v39 = obj;
              }
              [v19 addObjectsFromArray:v39];
              if (!v38) {
            }
              }
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v97 objects:v113 count:16];
      }
      while (v24);
    }

    [v23 removeObjectsInArray:v70];
    unint64_t v40 = [v70 count];
    if (v40 < *((void *)v102 + 3))
    {
      uint64_t v41 = [(PGManagerWorkingContext *)v66->_workingContext serviceManager];
      workingContext = v66->_workingContext;
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __132__PGRelatedComputer__relatedCollectionsForMemoryTripOrWeekend_relatedType_options_assetCollectionForKeywords_curationContext_error___block_invoke;
      v84[3] = &unk_1E68F06C8;
      id v85 = v75;
      long long v94 = buf;
      id v86 = v70;
      id v87 = v74;
      unint64_t v95 = v69;
      id v88 = v23;
      id v43 = v41;
      id v89 = v43;
      id v90 = v64;
      id v91 = v19;
      id v92 = v65;
      id v93 = v71;
      BOOL v96 = v71 != 0;
      [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v84];
    }
    uint64_t v44 = [MEMORY[0x1E4F1CA48] arrayWithArray:v70];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obja = v23;
    uint64_t v45 = [obja countByEnumeratingWithState:&v80 objects:v111 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v81;
LABEL_35:
      uint64_t v47 = 0;
      while (1)
      {
        if (*(void *)v81 != v46) {
          objc_enumerationMutation(obja);
        }
        uint64_t v48 = *(void **)(*((void *)&v80 + 1) + 8 * v47);
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v49 = [v48 moments];
        uint64_t v50 = [v49 countByEnumeratingWithState:&v76 objects:v110 count:16];
        if (v50)
        {
          uint64_t v51 = *(void *)v77;
          while (2)
          {
            for (uint64_t j = 0; j != v50; ++j)
            {
              if (*(void *)v77 != v51) {
                objc_enumerationMutation(v49);
              }
              if ([v19 containsObject:*(void *)(*((void *)&v76 + 1) + 8 * j)])
              {

                goto LABEL_49;
              }
            }
            uint64_t v50 = [v49 countByEnumeratingWithState:&v76 objects:v110 count:16];
            if (v50) {
              continue;
            }
            break;
          }
        }

        [v44 addObject:v48];
        if ([v44 count] >= v69) {
          break;
        }
LABEL_49:
        if (++v47 == v45)
        {
          uint64_t v45 = [obja countByEnumeratingWithState:&v80 objects:v111 count:16];
          if (v45) {
            goto LABEL_35;
          }
          break;
        }
      }
    }

    uint64_t v53 = mach_absolute_time();
    uint32_t numer = info.numer;
    denouint64_t m = info.denom;
    uint64_t v56 = v62;
    uint64_t v57 = v56;
    if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
    {
      *(_WORD *)double v106 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v57, OS_SIGNPOST_INTERVAL_END, spid, "RelatedForMemoryTripOrWeekend", "", v106, 2u);
    }

    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)double v106 = 136315394;
      char v107 = "RelatedForMemoryTripOrWeekend";
      __int16 v108 = 2048;
      double v109 = (float)((float)((float)((float)(v53 - v59) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v57, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v106, 0x16u);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v44 = 0;
  }

  return v44;
}

void __132__PGRelatedComputer__relatedCollectionsForMemoryTripOrWeekend_relatedType_options_assetCollectionForKeywords_curationContext_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  long long v98 = [MEMORY[0x1E4F1CA80] set];
  if ([*(id *)(a1 + 32) subcategory] == 205) {
    [v3 trips];
  }
  else {
  id v4 = [v3 weekends];
  }
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
  unint64_t v6 = [v4 count] - 1;
  if (v5 < v6) {
    unint64_t v6 = v5;
  }
  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v6;
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
  if (v7 > [*(id *)(a1 + 40) count])
  {
    unint64_t v95 = v3;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v91 = v4;
    obuint64_t j = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v127 objects:v136 count:16];
    uint64_t v9 = (double *)MEMORY[0x1E4F8B800];
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v128;
      double v12 = *MEMORY[0x1E4F8B800];
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v128 != v11) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v127 + 1) + 8 * i);
          id v15 = [v14 firstObject];
          os_signpost_id_t v16 = [v15 localStartDate];
          [v16 timeIntervalSinceDate:*(void *)(a1 + 48)];
          double v18 = v17;

          double v19 = -v18;
          if (v18 >= 0.0) {
            double v19 = v18;
          }
          if (v19 < v12)
          {
            [v98 addObject:v14];
            goto LABEL_19;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v127 objects:v136 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_19:

    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    uint64_t v108 = a1;
    id v96 = *(id *)(a1 + 40);
    uint64_t v104 = [v96 countByEnumeratingWithState:&v123 objects:v135 count:16];
    if (v104)
    {
      uint64_t v99 = *(void *)v124;
      double v20 = *v9;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v124 != v99) {
            objc_enumerationMutation(v96);
          }
          uint64_t v106 = v21;
          uint64_t v22 = *(void **)(*((void *)&v123 + 1) + 8 * v21);
          long long v119 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          id v23 = obj;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v119 objects:v134 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v120;
            while (2)
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v120 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = *(void **)(*((void *)&v119 + 1) + 8 * j);
                id v29 = [v22 highlight];
                double v30 = v29;
                if (v29)
                {
                  id v31 = v29;
                }
                else
                {
                  double v32 = [v22 moments];
                  id v31 = [v32 firstObject];
                }
                double v33 = objc_msgSend(v31, "cls_localStartDate");
                double v34 = [v28 firstObject];
                double v35 = [v34 localStartDate];
                [v33 timeIntervalSinceDate:v35];
                double v37 = v36;

                double v38 = -v37;
                if (v37 >= 0.0) {
                  double v38 = v37;
                }
                if (v38 < v20)
                {
                  [v98 addObject:v28];

                  goto LABEL_39;
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v119 objects:v134 count:16];
              if (v25) {
                continue;
              }
              break;
            }
          }
LABEL_39:

          uint64_t v21 = v106 + 1;
        }
        while (v106 + 1 != v104);
        uint64_t v104 = [v96 countByEnumeratingWithState:&v123 objects:v135 count:16];
      }
      while (v104);
    }

    uint64_t v39 = v108;
    BOOL v92 = [*(id *)(v108 + 32) subcategory] != 205;
    unint64_t v40 = [MEMORY[0x1E4F1CA80] setWithArray:obj];
    [v40 minusSet:v98];
    uint64_t v41 = (void *)MEMORY[0x1E4F29008];
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __132__PGRelatedComputer__relatedCollectionsForMemoryTripOrWeekend_relatedType_options_assetCollectionForKeywords_curationContext_error___block_invoke_2;
    v117[3] = &unk_1E68F06A0;
    id v118 = *(id *)(v108 + 48);
    id v89 = [v41 sortDescriptorWithKey:@"self" ascending:0 comparator:v117];
    double v133 = v89;
    uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
    id v90 = v40;
    id v43 = [v40 sortedArrayUsingDescriptors:v42];

    unint64_t v44 = *(void *)(v108 + 112);
    unint64_t v45 = [*(id *)(v108 + 56) count];
    unint64_t v94 = *(void *)(*(void *)(*(void *)(v108 + 104) + 8) + 24);
    if (v44 > v45)
    {
      uint64_t v46 = *(void *)(v108 + 112);
      uint64_t v47 = [*(id *)(v108 + 56) count];
      unint64_t v48 = v94;
      if (v94 <= v46 - v47) {
        unint64_t v48 = v46 - v47;
      }
      unint64_t v94 = v48;
    }
    id v3 = v95;
    id v93 = [[PGTitleGenerationContext alloc] initWithGraph:v95 serviceManager:*(void *)(v108 + 64)];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id obja = v43;
    uint64_t v107 = [obja countByEnumeratingWithState:&v113 objects:v132 count:16];
    if (v107)
    {
      uint64_t v105 = *(void *)v114;
      *(void *)&long long v49 = 138412290;
      long long v88 = v49;
      do
      {
        uint64_t v50 = 0;
        do
        {
          if (*(void *)v114 != v105) {
            objc_enumerationMutation(obja);
          }
          uint64_t v51 = *(void **)(*((void *)&v113 + 1) + 8 * v50);
          unint64_t v52 = objc_msgSend(v51, "count", v88);
          if (v52 >= 2) {
            unint64_t v53 = 2;
          }
          else {
            unint64_t v53 = v52;
          }
          uint64_t v54 = [v3 momentsForMomentNodes:v51 inPhotoLibrary:*(void *)(v39 + 72) sortChronologically:1];
          long long v109 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          id v55 = v54;
          uint64_t v56 = [v55 countByEnumeratingWithState:&v109 objects:v131 count:16];
          uint64_t v57 = v55;
          if (v56)
          {
            uint64_t v58 = v56;
            LOBYTE(v59) = 0;
            uint64_t v60 = 0;
            uint64_t v61 = *(void *)v110;
            while (2)
            {
              for (uint64_t k = 0; k != v58; ++k)
              {
                if (*(void *)v110 != v61) {
                  objc_enumerationMutation(v55);
                }
                unint64_t v63 = *(void **)(*((void *)&v109 + 1) + 8 * k);
                if ([*(id *)(v108 + 80) containsObject:v63])
                {
                  uint64_t v57 = v55;
                  id v3 = v95;
                  uint64_t v39 = v108;
                  goto LABEL_75;
                }
                if (v59)
                {
                  BOOL v59 = 1;
                }
                else
                {
                  uint64_t v64 = *(void **)(v108 + 88);
                  uint64_t v65 = [v63 localIdentifier];
                  LOBYTE(v64) = [v64 containsObject:v65];

                  BOOL v59 = (v64 & 1) == 0 && ++v60 >= v53;
                }
              }
              uint64_t v58 = [v55 countByEnumeratingWithState:&v109 objects:v131 count:16];
              if (v58) {
                continue;
              }
              break;
            }

            id v3 = v95;
            uint64_t v39 = v108;
            if (v59)
            {
              [*(id *)(v108 + 80) addObjectsFromArray:v55];
              uint64_t v66 = [v51 firstObject];
              uint64_t v57 = [v66 highlightNode];

              long long v100 = [v57 collection];
              id v97 = [v100 momentNodes];
              id v67 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
              *(void *)&long long buf = v67;
              id v68 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
              *((void *)&buf + 1) = v68;
              unint64_t v69 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
              double v138 = v69;
              long long v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:3];

              id v71 = [v97 sortedArrayUsingDescriptors:v70];

              if (([v71 isEqualToArray:v51] & 1) == 0)
              {
                uint64_t v72 = +[PGLogging sharedLogging];
                long long v73 = [v72 loggingConnection];

                if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = v88;
                  *(void *)((char *)&buf + 4) = v57;
                  _os_log_error_impl(&dword_1D1805000, v73, OS_LOG_TYPE_ERROR, "Mismatch between moment nodes in highlight and [graph trips] api for highlight node: %@", (uint8_t *)&buf, 0xCu);
                }

                uint64_t v57 = 0;
              }
              uint64_t v74 = [v57 fetchAssetCollectionInPhotoLibrary:*(void *)(v108 + 72)];
              uint64_t v75 = v74;
              if (v74)
              {
                long long v76 = *(void **)(v108 + 88);
                long long v77 = [v74 localIdentifier];
                LODWORD(v76) = [v76 containsObject:v77];

                if (v76)
                {

                  goto LABEL_75;
                }
              }
              uint64_t v101 = v71;
              long long v78 = [PGGraphMatchingResult alloc];
              long long v79 = v78;
              if (v57)
              {
                long long v80 = [(PGGraphMatchingResult *)v78 initWithEvent:v57];
              }
              else
              {
                long long v81 = [v51 firstObject];
                long long v80 = [(PGGraphMatchingResult *)v79 initWithEvent:v81];
              }
              if (*(void *)(v108 + 96)) {
                [(PGGraphMatchingResult *)v80 addKeywords:&unk_1F28D4D70 forRelatedType:128];
              }
              long long v82 = [PGRelated alloc];
              long long v83 = v82;
              if (v57)
              {
                uint64_t v84 = [(PGRelated *)v82 initWithGraphMatchingResult:v80 highlight:v75 needsDebugInfo:*(unsigned __int8 *)(v108 + 120)];
              }
              else
              {
                id v85 = [MEMORY[0x1E4F1CAD0] setWithArray:v51];
                uint64_t v84 = [(PGRelated *)v83 initWithGraphMatchingResult:v80 moments:v55 tripMemoryTitleType:v92 tripMomentNodes:v85 titleGenerationContext:v93 needsDebugInfo:*(unsigned __int8 *)(v108 + 120)];
              }
              [*(id *)(v108 + 40) addObject:v84];
              unint64_t v86 = [*(id *)(v108 + 40) count];

              if (v86 >= v94)
              {

                goto LABEL_89;
              }
            }
          }
          else
          {
LABEL_75:
          }
          ++v50;
        }
        while (v50 != v107);
        uint64_t v87 = [obja countByEnumeratingWithState:&v113 objects:v132 count:16];
        uint64_t v107 = v87;
      }
      while (v87);
    }
LABEL_89:

    id v4 = v91;
  }
}

uint64_t __132__PGRelatedComputer__relatedCollectionsForMemoryTripOrWeekend_relatedType_options_assetCollectionForKeywords_curationContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 firstObject];
  unint64_t v6 = [v5 localStartDate];
  [v6 timeIntervalSince1970];
  uint64_t v8 = (uint64_t)llround(v7) % 86400;
  [v6 timeIntervalSince1970];
  int64_t v10 = llround(v9);
  uint64_t v11 = v8 + 86400 * (v10 / 86400) - v10;
  if (v11 < 0) {
    uint64_t v11 = -v11;
  }
  double v12 = 1.0 - (double)v11 / 86400.0;

  os_signpost_id_t v13 = [v4 firstObject];

  id v14 = [v13 localStartDate];
  [v14 timeIntervalSince1970];
  uint64_t v16 = (uint64_t)llround(v15) % 86400;
  [v14 timeIntervalSince1970];
  int64_t v18 = llround(v17);
  uint64_t v19 = v16 + 86400 * (v18 / 86400) - v18;
  if (v19 < 0) {
    uint64_t v19 = -v19;
  }
  double v20 = 1.0 - (double)v19 / 86400.0;

  if (v12 < v20) {
    return -1;
  }
  else {
    return v12 > v20;
  }
}

- (id)relatedCollectionsForMemoryTripOrWeekend:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 curationContext:(id)a6 error:(id *)a7
{
  return [(PGRelatedComputer *)self _relatedCollectionsForMemoryTripOrWeekend:a3 relatedType:a4 options:a5 assetCollectionForKeywords:0 curationContext:a6 error:a7];
}

- (id)_relatedCollectionsForDefaultAssetCollection:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 assetCollectionForKeywords:(id)a6 curationContext:(id)a7 error:(id *)a8
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v88 = v13;
  if (v13)
  {
    double v17 = self->_loggingConnection;
    os_signpost_id_t v18 = os_signpost_id_generate((os_log_t)v17);
    uint64_t v19 = v17;
    double v20 = v19;
    unint64_t v82 = v18 - 1;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "RelatedForDefaultAssetCollection", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    os_signpost_id_t spid = v18;
    uint64_t v81 = mach_absolute_time();
    id v85 = v20;
    if (v15)
    {
      unint64_t v86 = PGMomentsForAssetCollection((uint64_t)v15);
    }
    else
    {
      unint64_t v86 = 0;
    }
    uint64_t v21 = (void *)[v14 copy];
    [v21 setUseDiversity:0];
    id v90 = v21;
    objc_msgSend(v21, "setFetchLimit:", objc_msgSend(v14, "fetchLimit") + 2);
    uint64_t v22 = [[PGCurationOptions alloc] initWithDuration:8];
    id v93 = self;
    id v23 = [(PGManagerWorkingContext *)self->_workingContext curationManager];
    id v83 = v16;
    uint64_t v84 = v22;
    uint64_t v24 = [v23 curatedAssetsForAssetCollection:v13 options:v22 curationContext:v16 progressBlock:0];

    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v24, "count"));
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id v26 = v24;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v119 objects:v131 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v120;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v120 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = [*(id *)(*((void *)&v119 + 1) + 8 * i) localIdentifier];
          [v25 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v119 objects:v131 count:16];
      }
      while (v28);
    }

    double v32 = (void *)MEMORY[0x1E4F38EE8];
    double v33 = [(PGManagerWorkingContext *)v93->_workingContext photoLibrary];
    double v34 = [v33 librarySpecificFetchOptions];
    double v35 = [v32 fetchMomentsForAssetsWithLocalIdentifiers:v25 options:v34];

    unint64_t v94 = [MEMORY[0x1E4F1CA48] array];
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    obuint64_t j = v35;
    uint64_t v36 = [obj countByEnumeratingWithState:&v115 objects:v130 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v116;
      while (2)
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v116 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = [(PGRelatedComputer *)v93 relatedCollectionsForMoment:*(void *)(*((void *)&v115 + 1) + 8 * j) relatedType:a4 options:v90 generateTitles:0 error:a8];
          if (!v40)
          {
            id v103 = 0;
            long long v77 = obj;
            uint64_t v42 = obj;
            id v16 = v83;
            goto LABEL_80;
          }
          uint64_t v41 = (void *)v40;
          [v94 addObject:v40];
        }
        uint64_t v37 = [obj countByEnumeratingWithState:&v115 objects:v130 count:16];
        if (v37) {
          continue;
        }
        break;
      }
    }

    uint64_t v42 = PGMomentsForAssetCollection((uint64_t)v13);
    id v79 = v14;
    uint64_t v43 = [v14 fetchLimit];
    if (v43) {
      unint64_t v44 = v43;
    }
    else {
      unint64_t v44 = 64;
    }
    unint64_t v45 = malloc_type_calloc(8uLL, [v94 count], 0x2C97B642uLL);
    uint64_t v46 = [MEMORY[0x1E4F1CA80] set];
    [MEMORY[0x1E4F1CA48] arrayWithCapacity:v44];
    id v102 = v15;
    id v103 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v89 = 0;
    unint64_t v101 = v44;
    if (v44 <= 1) {
      uint64_t v47 = 1;
    }
    else {
      uint64_t v47 = v44;
    }
    uint64_t v87 = v47;
    unint64_t v48 = v45;
    id v97 = v26;
    long long v98 = v25;
    id v96 = v45;
    do
    {
      if ([v103 count] >= v101) {
        break;
      }
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id v95 = v94;
      uint64_t v100 = [v95 countByEnumeratingWithState:&v111 objects:v129 count:16];
      if (v100)
      {
        uint64_t v49 = 0;
        uint64_t v99 = *(void *)v112;
LABEL_34:
        uint64_t v50 = 0;
        while (1)
        {
          if (*(void *)v112 != v99) {
            objc_enumerationMutation(v95);
          }
          uint64_t v104 = v50;
          uint64_t v105 = v49;
          uint64_t v51 = *(void **)(*((void *)&v111 + 1) + 8 * v50);
          unint64_t v52 = v48[v49];
          while (v52 < [v51 count])
          {
            unint64_t v53 = [v51 objectAtIndexedSubscript:v52];
            uint64_t v54 = [v53 highlight];
            char v55 = [v46 containsObject:v54];

            long long v109 = 0u;
            long long v110 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            uint64_t v56 = [v53 moments];
            uint64_t v57 = [v56 countByEnumeratingWithState:&v107 objects:v128 count:16];
            if (v57)
            {
              uint64_t v58 = v57;
              uint64_t v59 = *(void *)v108;
              char v106 = v55;
              while (2)
              {
                for (uint64_t k = 0; k != v58; ++k)
                {
                  if (*(void *)v108 != v59) {
                    objc_enumerationMutation(v56);
                  }
                  uint64_t v61 = *(void *)(*((void *)&v107 + 1) + 8 * k);
                  if (([v42 containsObject:v61] & 1) != 0
                    || ([v46 containsObject:v61] & 1) != 0)
                  {

                    ++v52;
                    goto LABEL_51;
                  }
                }
                uint64_t v58 = [v56 countByEnumeratingWithState:&v107 objects:v128 count:16];
                char v55 = v106;
                if (v58) {
                  continue;
                }
                break;
              }
            }

            ++v52;
            if ((v55 & 1) == 0)
            {
              id v62 = [v53 highlight];

              if (v62)
              {
                unint64_t v63 = [v53 highlight];
                [v46 addObject:v63];
              }
              uint64_t v64 = [v53 moments];
              [v46 addObjectsFromArray:v64];

              if (v102)
              {
                uint64_t v65 = [v53 highlight];
                uint64_t v66 = (void *)MEMORY[0x1E4F1CAD0];
                if (v65)
                {
                  id v67 = [v53 highlight];
                  [v66 setWithObject:v67];
                }
                else
                {
                  id v67 = [v53 moments];
                  [v66 setWithArray:v67];
                id v68 = };

                if (([v68 containsObject:v88] & 1) != 0
                  || [v86 intersectsSet:v68])
                {
                  unint64_t v69 = [obj objectAtIndexedSubscript:v105];
                  uint64_t v70 = [(PGRelatedComputer *)v93 _relatedCollectionBetweenMoment:v69 andAssetCollection:v102 relatedType:a4 needsDebugInfo:1 needsDiversityInfo:0];

                  unint64_t v53 = (void *)v70;
                  goto LABEL_61;
                }
              }
              else
              {
LABEL_61:
                [v103 addObject:v53];
              }

              break;
            }
LABEL_51:
          }
          unint64_t v48 = v96;
          v96[v105] = v52;
          id v15 = v102;
          id v26 = v97;
          uint64_t v25 = v98;
          if ([v103 count] >= v101 || v102 && objc_msgSend(v103, "count")) {
            break;
          }
          uint64_t v49 = v105 + 1;
          uint64_t v50 = v104 + 1;
          if (v104 + 1 == v100)
          {
            uint64_t v71 = [v95 countByEnumeratingWithState:&v111 objects:v129 count:16];
            uint64_t v100 = v71;
            if (v71) {
              goto LABEL_34;
            }
            break;
          }
        }
      }

      ++v89;
    }
    while (v89 != v87);
    if (v48) {
      free(v48);
    }
    uint64_t v72 = mach_absolute_time();
    uint32_t numer = info.numer;
    denouint64_t m = info.denom;
    uint64_t v75 = v85;
    long long v76 = v75;
    id v16 = v83;
    if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v76, OS_SIGNPOST_INTERVAL_END, spid, "RelatedForDefaultAssetCollection", "", buf, 2u);
    }

    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      long long v125 = "RelatedForDefaultAssetCollection";
      __int16 v126 = 2048;
      double v127 = (float)((float)((float)((float)(v72 - v81) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v76, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    id v14 = v79;
    long long v77 = obj;
LABEL_80:
  }
  else
  {
    id v103 = 0;
  }

  return v103;
}

- (id)_upNextCollectionsForAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5 error:(id *)a6
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  uint64_t v71 = v12;
  uint64_t v72 = v13;
  unint64_t v69 = a6;
  if ([v10 assetCollectionType] == 3)
  {
    id v14 = [v10 uuid];
    v85[0] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];

    id v16 = 0;
    goto LABEL_22;
  }
  if ([v10 assetCollectionType] == 6)
  {
    double v17 = [v13 librarySpecificFetchOptions];
    os_signpost_id_t v18 = [MEMORY[0x1E4F38EE8] fetchMomentsInHighlight:v10 options:v17];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v18 count])
    {
      unint64_t v19 = 0;
      do
      {
        double v20 = [v18 objectAtIndexedSubscript:v19];
        uint64_t v21 = [v20 uuid];
        [v15 addObject:v21];

        ++v19;
      }
      while (v19 < [v18 count]);
    }

    id v16 = 0;
  }
  else
  {
    if ([v10 assetCollectionType] == 4)
    {
      id v16 = [v10 localIdentifier];
      id v15 = 0;
      goto LABEL_22;
    }
    id v66 = v11;
    uint64_t v22 = [[PGCurationOptions alloc] initWithDuration:8];
    id v23 = [(PGManagerWorkingContext *)self->_workingContext curationManager];
    id v67 = v10;
    uint64_t v24 = [v23 curatedAssetsForAssetCollection:v10 options:v22 curationContext:v12 progressBlock:0];

    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v24, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v26 = v24;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v79 objects:v84 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v80 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = [*(id *)(*((void *)&v79 + 1) + 8 * i) localIdentifier];
          [v25 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v79 objects:v84 count:16];
      }
      while (v28);
    }

    double v32 = (void *)MEMORY[0x1E4F38EE8];
    double v33 = [v72 librarySpecificFetchOptions];
    double v34 = [v32 fetchMomentsForAssetsWithLocalIdentifiers:v25 options:v33];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v34 count])
    {
      unint64_t v35 = 0;
      do
      {
        uint64_t v36 = [v34 objectAtIndexedSubscript:v35];
        uint64_t v37 = [v36 uuid];
        [v15 addObject:v37];

        ++v35;
      }
      while (v35 < [v34 count]);
    }

    id v16 = 0;
    id v11 = v66;
    id v10 = v67;
  }
  id v13 = v72;
LABEL_22:
  uint64_t v38 = [PGUpNextMemoriesGenerationRequest alloc];
  uint64_t v39 = [v11 filteringLocalIdentifiers];
  uint64_t v40 = [v11 fetchLimit];
  uint64_t v41 = [v13 librarySpecificFetchOptions];
  uint64_t v42 = -[PGUpNextMemoriesGenerationRequest initWithRootMemoryLocalIdentifier:momentUUIDs:memoryLocalIdentifiersToAvoid:targetUpNextMemoryCount:sharingFilter:](v38, "initWithRootMemoryLocalIdentifier:momentUUIDs:memoryLocalIdentifiersToAvoid:targetUpNextMemoryCount:sharingFilter:", v16, v15, v39, v40, [v41 sharingFilter]);

  uint64_t v43 = [PGMusicCurationOptions alloc];
  unint64_t v44 = [(PGMusicCurationOptions *)v43 initWithOptionsDictionary:MEMORY[0x1E4F1CC08]];
  unint64_t v45 = [(PGUpNextMemoriesGenerationRequest *)v42 fetchMemoryLocalIdentifiersWithWorkingContext:self->_workingContext musicCurationOptions:v44 error:v69];
  if (v45)
  {
    uint64_t v64 = v44;
    uint64_t v65 = v42;
    id v68 = v10;
    uint64_t v70 = v16;
    uint64_t v46 = [v13 librarySpecificFetchOptions];
    [v46 setIncludeLocalMemories:1];
    uint64_t v47 = (void *)MEMORY[0x1E4F39160];
    unint64_t v48 = [v45 memoryLocalIdentifiers];
    id v62 = v46;
    uint64_t v49 = [v47 fetchAssetCollectionsWithLocalIdentifiers:v48 options:v46];

    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __88__PGRelatedComputer__upNextCollectionsForAssetCollection_options_curationContext_error___block_invoke;
    v77[3] = &unk_1E68F0678;
    id v51 = v50;
    id v78 = v51;
    uint64_t v61 = v49;
    [v49 enumerateObjectsUsingBlock:v77];
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    unint64_t v63 = v45;
    unint64_t v53 = [v45 memoryLocalIdentifiers];
    uint64_t v54 = [v53 countByEnumeratingWithState:&v73 objects:v83 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v55; ++j)
        {
          if (*(void *)v74 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v58 = [v51 objectForKeyedSubscript:*(void *)(*((void *)&v73 + 1) + 8 * j)];
          uint64_t v59 = [[PGRelated alloc] initWithMemory:v58 needsDebugInfo:0];
          [v52 addObject:v59];
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v73 objects:v83 count:16];
      }
      while (v55);
    }

    id v10 = v68;
    id v13 = v72;
    id v16 = v70;
    unint64_t v44 = v64;
    uint64_t v42 = v65;
    unint64_t v45 = v63;
  }
  else
  {
    id v52 = 0;
  }

  return v52;
}

void __88__PGRelatedComputer__upNextCollectionsForAssetCollection_options_curationContext_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (id)relatedCollectionsForDefaultAssetCollection:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 curationContext:(id)a6 error:(id *)a7
{
  return [(PGRelatedComputer *)self _relatedCollectionsForDefaultAssetCollection:a3 relatedType:a4 options:a5 assetCollectionForKeywords:0 curationContext:a6 error:a7];
}

- (id)relatedCollectionsForAssetCollection:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 curationContext:(id)a6 error:(id *)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  if (v11)
  {
    id v13 = self->_loggingConnection;
    id v14 = a6;
    os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)v13);
    id v16 = v13;
    double v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RelatedForAssetCollection", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v18 = mach_absolute_time();
    unint64_t v19 = [(PGRelatedComputer *)self _upNextCollectionsForAssetCollection:v11 options:v12 curationContext:v14 error:a7];

    unint64_t v20 = [v12 fetchLimit];
    if (v20)
    {
      unint64_t v21 = v20;
      if ([v19 count] > v20)
      {
        uint64_t v22 = objc_msgSend(v19, "subarrayWithRange:", 0, v21);

        unint64_t v19 = (void *)v22;
      }
    }
    workingContext = self->_workingContext;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __100__PGRelatedComputer_relatedCollectionsForAssetCollection_relatedType_options_curationContext_error___block_invoke;
    v33[3] = &unk_1E68F0898;
    v33[4] = self;
    id v34 = v12;
    id v24 = v19;
    id v35 = v24;
    id v36 = v11;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v33];
    uint64_t v25 = mach_absolute_time();
    uint32_t numer = info.numer;
    denouint64_t m = info.denom;
    uint64_t v28 = v17;
    uint64_t v29 = v28;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v29, OS_SIGNPOST_INTERVAL_END, v15, "RelatedForAssetCollection", "", buf, 2u);
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v39 = "RelatedForAssetCollection";
      __int16 v40 = 2048;
      double v41 = (float)((float)((float)((float)(v25 - v18) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    double v30 = v36;
    id v31 = v24;
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

void __100__PGRelatedComputer_relatedCollectionsForAssetCollection_relatedType_options_curationContext_error___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  unint64_t v6 = [v4 referenceAssetIdentifier];
  id v10 = [v3 _referenceAssetWithLocalIdentifier:v6];

  double v7 = (void *)a1[4];
  uint64_t v8 = a1[6];
  double v9 = [v5 graph];

  [v7 _generateTitleForRelatedResults:v8 withGraph:v9 referenceEvent:a1[7] referenceAsset:v10];
}

- (id)relatedCollectionsForHighlight:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 generateTitles:(BOOL)a6 error:(id *)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  if (v12)
  {
    id v14 = self->_loggingConnection;
    os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)v14);
    id v16 = v14;
    double v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RelatedForHighlight", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v29 = mach_absolute_time();
    *(void *)long long buf = 0;
    unint64_t v45 = buf;
    uint64_t v46 = 0x3032000000;
    uint64_t v47 = __Block_byref_object_copy__72187;
    unint64_t v48 = __Block_byref_object_dispose__72188;
    id v49 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x3032000000;
    double v41 = __Block_byref_object_copy__72187;
    uint64_t v42 = __Block_byref_object_dispose__72188;
    id v43 = 0;
    workingContext = self->_workingContext;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __93__PGRelatedComputer_relatedCollectionsForHighlight_relatedType_options_generateTitles_error___block_invoke;
    v30[3] = &unk_1E68F0650;
    id v34 = &v38;
    id v31 = v12;
    unint64_t v36 = a4;
    id v35 = buf;
    id v32 = v13;
    double v33 = self;
    BOOL v37 = a6;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v30];
    if (v39[5])
    {
      unint64_t v19 = +[PGLogging sharedLogging];
      unint64_t v20 = [v19 loggingConnection];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = (const char *)v39[5];
        *(_DWORD *)id v51 = 138412290;
        id v52 = v28;
        _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "Error occured: %@", v51, 0xCu);
      }

      if (a7) {
        *a7 = (id) v39[5];
      }
    }
    uint64_t v21 = mach_absolute_time();
    uint32_t numer = info.numer;
    denouint64_t m = info.denom;
    id v24 = v17;
    uint64_t v25 = v24;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)id v51 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v25, OS_SIGNPOST_INTERVAL_END, v15, "RelatedForHighlight", "", v51, 2u);
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v51 = 136315394;
      id v52 = "RelatedForHighlight";
      __int16 v53 = 2048;
      double v54 = (float)((float)((float)((float)(v21 - v29) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v51, 0x16u);
    }
    id v26 = *((id *)v45 + 5);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

void __93__PGRelatedComputer_relatedCollectionsForHighlight_relatedType_options_generateTitles_error___block_invoke(uint64_t a1, void *a2)
{
  id v23 = [a2 graph];
  if (v23)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    id v5 = [v23 highlightNodeForHighlight:*(void *)(a1 + 32)];
    if (v5)
    {
      unint64_t v6 = +[PGGraphMatchingOptions optionsWithRelatedType:*(void *)(a1 + 72)];
      double v7 = [v23 matchEvent:v5 options:v6];
      int v8 = [*(id *)(a1 + 40) useDiversity];
      double v9 = *(void **)(a1 + 48);
      if (v8)
      {
        id v10 = [v5 localStartDate];
        uint64_t v11 = [v9 _diverseResultsFromMatchingResults:v7 inGraph:v23 timeShuffleDate:v10 matchingOptions:v6 options:*(void *)(a1 + 40)];
        uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
        id v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
      }
      else
      {
        uint64_t v18 = [*(id *)(a1 + 48) _postProcessMatchingResults:v7 inGraph:v23 matchingOptions:v6 options:*(void *)(a1 + 40)];
        uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
        id v10 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;
      }

      if (*(unsigned char *)(a1 + 80))
      {
        unint64_t v20 = *(void **)(a1 + 48);
        uint64_t v21 = [*(id *)(a1 + 40) referenceAssetIdentifier];
        uint64_t v22 = [v20 _referenceAssetWithLocalIdentifier:v21];

        [*(id *)(a1 + 48) _generateTitleForRelatedResults:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) withGraph:v23 referenceEvent:*(void *)(a1 + 32) referenceAsset:v22];
      }
    }
    else
    {
      unint64_t v6 = [NSString stringWithFormat:@"No highlight node found for highlight %@", *(void *)(a1 + 32)];
      uint64_t v16 = +[PGError errorWithCode:-3 description:v6];
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      double v7 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
  else
  {
    uint64_t v14 = +[PGError errorForCode:-10];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (id)relatedCollectionsForMoment:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 generateTitles:(BOOL)a6 error:(id *)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  if (v12)
  {
    uint64_t v14 = self->_loggingConnection;
    os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)v14);
    uint64_t v16 = v14;
    uint64_t v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RelatedForMoment", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v29 = mach_absolute_time();
    *(void *)long long buf = 0;
    unint64_t v45 = buf;
    uint64_t v46 = 0x3032000000;
    uint64_t v47 = __Block_byref_object_copy__72187;
    unint64_t v48 = __Block_byref_object_dispose__72188;
    id v49 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x3032000000;
    double v41 = __Block_byref_object_copy__72187;
    uint64_t v42 = __Block_byref_object_dispose__72188;
    id v43 = 0;
    workingContext = self->_workingContext;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __90__PGRelatedComputer_relatedCollectionsForMoment_relatedType_options_generateTitles_error___block_invoke;
    v30[3] = &unk_1E68F0650;
    id v34 = &v38;
    id v31 = v12;
    unint64_t v36 = a4;
    id v35 = buf;
    id v32 = v13;
    double v33 = self;
    BOOL v37 = a6;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v30];
    if (v39[5])
    {
      uint64_t v19 = +[PGLogging sharedLogging];
      unint64_t v20 = [v19 loggingConnection];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = (const char *)v39[5];
        *(_DWORD *)id v51 = 138412290;
        id v52 = v28;
        _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "Error occured: %@", v51, 0xCu);
      }

      if (a7) {
        *a7 = (id) v39[5];
      }
    }
    uint64_t v21 = mach_absolute_time();
    uint32_t numer = info.numer;
    denouint64_t m = info.denom;
    id v24 = v17;
    uint64_t v25 = v24;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)id v51 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v25, OS_SIGNPOST_INTERVAL_END, v15, "RelatedForMoment", "", v51, 2u);
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v51 = 136315394;
      id v52 = "RelatedForMoment";
      __int16 v53 = 2048;
      double v54 = (float)((float)((float)((float)(v21 - v29) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v51, 0x16u);
    }
    id v26 = *((id *)v45 + 5);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

void __90__PGRelatedComputer_relatedCollectionsForMoment_relatedType_options_generateTitles_error___block_invoke(uint64_t a1, void *a2)
{
  v47[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    unint64_t v6 = [v3 momentNodeForMoment:*(void *)(a1 + 32)];
    if (v6)
    {
      double v7 = +[PGGraphMatchingOptions optionsWithRelatedType:*(void *)(a1 + 72)];
      int v8 = [v3 matchEvent:v6 options:v7];
      int v9 = [*(id *)(a1 + 40) useDiversity];
      id v10 = *(void **)(a1 + 48);
      if (v9)
      {
        uint64_t v11 = [v6 localStartDate];
        uint64_t v12 = [v10 _diverseResultsFromMatchingResults:v8 inGraph:v3 timeShuffleDate:v11 matchingOptions:v7 options:*(void *)(a1 + 40)];
        uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }
      else
      {
        uint64_t v22 = [*(id *)(a1 + 48) _postProcessMatchingResults:v8 inGraph:v3 matchingOptions:v7 options:*(void *)(a1 + 40)];
        uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v11 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;
      }

      if ([v7 targetEventDomain] == 102)
      {
        id v24 = (void *)MEMORY[0x1E4F390A0];
        uint64_t v25 = [*(id *)(*(void *)(a1 + 48) + 8) photoLibrary];
        id v26 = [v24 fetchOptionsWithPhotoLibrary:v25 orObject:0];

        uint64_t v27 = (void *)MEMORY[0x1E4F39238];
        v47[0] = *(void *)(a1 + 32);
        uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
        uint64_t v29 = [v27 fetchPhotosHighlightsContainingMoments:v28 options:v26];
        double v30 = [v29 firstObject];

        if (MEMORY[0x1D25FE3D0]([v30 type]))
        {
          id v31 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) firstObject];
          id v32 = [v31 highlight];
          char v33 = [v32 isEqual:v30];

          if ((v33 & 1) == 0)
          {
            id v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"highlight != %@", v30];
            uint64_t v35 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) filteredArrayUsingPredicate:v34];
            uint64_t v36 = *(void *)(*(void *)(a1 + 64) + 8);
            BOOL v37 = *(void **)(v36 + 40);
            *(void *)(v36 + 40) = v35;

            uint64_t v38 = [[PGRelated alloc] initWithHighlight:v30 needsDebugInfo:0];
            uint64_t v46 = v38;
            uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
            uint64_t v40 = [v39 arrayByAddingObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
            uint64_t v41 = *(void *)(*(void *)(a1 + 64) + 8);
            uint64_t v42 = *(void **)(v41 + 40);
            *(void *)(v41 + 40) = v40;
          }
        }
      }
      if (*(unsigned char *)(a1 + 80))
      {
        id v43 = *(void **)(a1 + 48);
        unint64_t v44 = [*(id *)(a1 + 40) referenceAssetIdentifier];
        unint64_t v45 = [v43 _referenceAssetWithLocalIdentifier:v44];

        [*(id *)(a1 + 48) _generateTitleForRelatedResults:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) withGraph:v3 referenceEvent:*(void *)(a1 + 32) referenceAsset:v45];
      }
    }
    else
    {
      uint64_t v18 = [NSString stringWithFormat:@"No moment found for moment %@", *(void *)(a1 + 32)];
      uint64_t v19 = +[PGError errorWithCode:-3 description:v18];
      uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
  }
  else
  {
    uint64_t v15 = +[PGError errorForCode:-10];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
}

- (id)relatedCollectionsForMoment:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  return [(PGRelatedComputer *)self relatedCollectionsForMoment:a3 relatedType:a4 options:a5 generateTitles:1 error:a6];
}

- (id)relatedCollectionsForAsset:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    uint64_t v12 = self->_loggingConnection;
    os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)v12);
    uint64_t v14 = v12;
    uint64_t v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RelatedForAsset", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v16 = mach_absolute_time();
    *(void *)long long buf = 0;
    id v43 = buf;
    uint64_t v44 = 0x3032000000;
    unint64_t v45 = __Block_byref_object_copy__72187;
    uint64_t v46 = __Block_byref_object_dispose__72188;
    id v47 = 0;
    uint64_t v17 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v10 withType:3 options:0];
    if ([v17 count] == 1)
    {
      *(void *)&long long v53 = 0;
      *((void *)&v53 + 1) = &v53;
      uint64_t v54 = 0x3032000000;
      uint64_t v55 = __Block_byref_object_copy__72187;
      uint64_t v56 = __Block_byref_object_dispose__72188;
      id v57 = 0;
      uint64_t v18 = [v17 firstObject];
      workingContext = self->_workingContext;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __74__PGRelatedComputer_relatedCollectionsForAsset_relatedType_options_error___block_invoke;
      v34[3] = &unk_1E68F0628;
      uint64_t v39 = &v53;
      id v33 = v18;
      id v35 = v33;
      id v36 = v10;
      id v37 = v11;
      uint64_t v38 = self;
      uint64_t v40 = buf;
      unint64_t v41 = a4;
      [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v34];
      if (*(void *)(*((void *)&v53 + 1) + 40))
      {
        uint64_t v20 = +[PGLogging sharedLogging];
        uint64_t v21 = [v20 loggingConnection];

        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v32 = *(const char **)(*((void *)&v53 + 1) + 40);
          *(_DWORD *)id v49 = 138412290;
          id v50 = v32;
          _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "Error occured: %@", v49, 0xCu);
        }

        if (a6) {
          *a6 = *(id *)(*((void *)&v53 + 1) + 40);
        }
      }
      uint64_t v22 = mach_absolute_time();
      uint32_t numer = info.numer;
      denouint64_t m = info.denom;
      uint64_t v25 = v15;
      id v26 = v25;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)id v49 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v26, OS_SIGNPOST_INTERVAL_END, v13, "RelatedForAsset", "", v49, 2u);
      }

      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v49 = 136315394;
        id v50 = "RelatedForAsset";
        __int16 v51 = 2048;
        double v52 = (float)((float)((float)((float)(v22 - v16) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v49, 0x16u);
      }
      id v27 = *((id *)v43 + 5);

      _Block_object_dispose(&v53, 8);
    }
    else
    {
      if (a6)
      {
        uint64_t v28 = [NSString stringWithFormat:@"Cannot find asset collection for inAsset %@", v10];
        *a6 = +[PGError errorWithCode:-3 description:v28];
      }
      uint64_t v29 = +[PGLogging sharedLogging];
      double v30 = [v29 loggingConnection];

      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v53) = 138412290;
        *(void *)((char *)&v53 + 4) = v10;
        _os_log_error_impl(&dword_1D1805000, v30, OS_LOG_TYPE_ERROR, "Cannot find asset collection for inAsset %@", (uint8_t *)&v53, 0xCu);
      }

      id v27 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

void __74__PGRelatedComputer_relatedCollectionsForAsset_relatedType_options_error___block_invoke(uint64_t a1, void *a2)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    unint64_t v6 = [v3 momentNodeForMoment:*(void *)(a1 + 32)];
    if (!v6)
    {
      uint64_t v21 = [NSString stringWithFormat:@"No moment found for asset %@", *(void *)(a1 + 40)];
      uint64_t v22 = +[PGError errorWithCode:-3 description:v21];
      uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
      id v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

LABEL_25:
      goto LABEL_26;
    }
    double v7 = (void *)[*(id *)(a1 + 48) copy];
    int v8 = [*(id *)(a1 + 48) shouldIncludeContainingEventKey];
    if (v8 && [*(id *)(a1 + 48) fetchLimit]) {
      objc_msgSend(v7, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 48), "fetchLimit") - 1);
    }
    int v9 = +[PGGraphMatchingOptions optionsWithRelatedType:*(void *)(a1 + 80)];
    id v10 = [(id)objc_opt_class() searchNodesInGraph:v3 forAsset:*(void *)(a1 + 40) inMoment:*(void *)(a1 + 32)];
    [v9 setFocusedNodes:v10];

    id v11 = [v3 matchEvent:v6 options:v9];
    int v12 = [*(id *)(a1 + 48) useDiversity];
    os_signpost_id_t v13 = *(void **)(a1 + 56);
    if (v12)
    {
      uint64_t v14 = [v6 localStartDate];
      uint64_t v15 = [v13 _diverseResultsFromMatchingResults:v11 inGraph:v3 timeShuffleDate:v14 matchingOptions:v9 options:v7];
      uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
    else
    {
      uint64_t v25 = [*(id *)(a1 + 56) _postProcessMatchingResults:v11 inGraph:v3 matchingOptions:v9 options:v7];
      uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v14 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;
    }

    if (v8)
    {
      if ([v9 targetEventDomain] == 100)
      {
        id v27 = [[PGRelated alloc] initWithMoment:*(void *)(a1 + 32) needsDebugInfo:0];
        if (!v27) {
          goto LABEL_18;
        }
      }
      else
      {
        if ([v9 targetEventDomain] != 102) {
          goto LABEL_18;
        }
        uint64_t v28 = (void *)MEMORY[0x1E4F390A0];
        uint64_t v29 = [*(id *)(*(void *)(a1 + 56) + 8) photoLibrary];
        double v30 = [v28 fetchOptionsWithPhotoLibrary:v29 orObject:0];

        id v31 = (void *)MEMORY[0x1E4F39238];
        v45[0] = *(void *)(a1 + 32);
        id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
        id v33 = [v31 fetchPhotosHighlightsContainingMoments:v32 options:v30];
        id v34 = [v33 firstObject];

        id v27 = [[PGRelated alloc] initWithHighlight:v34 needsDebugInfo:0];
        if (!v27) {
          goto LABEL_18;
        }
      }
      uint64_t v44 = v27;
      id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      uint64_t v36 = [v35 arrayByAddingObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
      uint64_t v37 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v38 = *(void **)(v37 + 40);
      *(void *)(v37 + 40) = v36;
    }
LABEL_18:
    uint64_t v39 = [*(id *)(a1 + 48) referenceAssetIdentifier];
    uint64_t v40 = *(void **)(a1 + 40);
    if (v39)
    {
      unint64_t v41 = [v40 localIdentifier];
      if ([v39 isEqualToString:v41])
      {
        id v42 = *(id *)(a1 + 40);
      }
      else
      {
        id v42 = [*(id *)(a1 + 56) _referenceAssetWithLocalIdentifier:v39];
      }
      id v43 = v42;
    }
    else
    {
      id v43 = v40;
    }
    [*(id *)(a1 + 56) _generateTitleForRelatedResults:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) withGraph:v3 referenceEvent:*(void *)(a1 + 32) referenceAsset:v43];

    goto LABEL_25;
  }
  uint64_t v18 = +[PGError errorForCode:-10];
  uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

LABEL_26:
}

- (PGRelatedComputer)initWithWorkingContext:(id)a3 blockedFeatures:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGRelatedComputer;
  int v9 = [(PGRelatedComputer *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workingContext, a3);
    objc_storeStrong((id *)&v10->_blockedFeatures, a4);
    uint64_t v11 = [v7 loggingConnection];
    loggingConnectiouint64_t n = v10->_loggingConnection;
    v10->_loggingConnectiouint64_t n = (OS_os_log *)v11;
  }
  return v10;
}

+ (id)searchNodesInGraph:(id)a3 forAsset:(id)a4 inMoment:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 _checkCanRead];
  id v10 = [v7 momentNodeForMoment:v9];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    [v11 addObject:v10];
    int v12 = [v8 clsLocation];

    BOOL v13 = v12 == 0;
    BOOL v14 = v12 != 0;
    if (v13) {
      double v15 = 10000.0;
    }
    else {
      double v15 = 1.79769313e308;
    }
    uint64_t v16 = +[PGAssetLocationResolver closestAssetLocationForAsset:v8 inAssetCollection:v9];
    uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    uint64_t v37 = (void *)v16;
    uint64_t v18 = +[PGAssetLocationResolver closestAddressNodeFromMomentNodes:v17 toLocation:v16 withMaximumDistance:v14 allowRemoteLocations:v15];

    if (v18)
    {
      [v11 addObject:v18];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke;
      v41[3] = &unk_1E68F1B78;
      id v42 = v11;
      [v18 enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:v41];
    }
    uint64_t v36 = v18;
    uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = [v8 clsUnprefetchedPersonLocalIdentifiers];
    uint64_t v21 = [v19 setWithArray:v20];

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke_3;
    v38[3] = &unk_1E68F0820;
    id v35 = v21;
    id v39 = v35;
    id v22 = v11;
    id v40 = v22;
    [v10 enumeratePersonNodesUsingBlock:v38];
    uint64_t v23 = objc_msgSend(v8, "cls_localDate");
    id v24 = [v10 dateNodes];
    uint64_t v25 = [v7 dateNodeForLocalDate:v23];
    if (v25 && [v24 containsObject:v25])
    {
      [v22 addObject:v25];
    }
    else
    {
      id v34 = v9;
      uint64_t v26 = [MEMORY[0x1E4F76C68] dateByAddingDays:-1 toDate:v23];
      id v27 = [v7 dateNodeForLocalDate:v26];

      if (v27 && [v24 containsObject:v27])
      {
        [v22 addObject:v27];
        uint64_t v25 = v27;
      }
      else
      {
        id v31 = [MEMORY[0x1E4F76C68] dateByAddingDays:1 toDate:v23];
        uint64_t v25 = [v7 dateNodeForLocalDate:v31];

        if (v25 && [v24 containsObject:v25]) {
          [v22 addObject:v25];
        }
      }
      id v9 = v34;
    }
    id v32 = [v10 weekendNode];
    if (v32) {
      [v22 addObject:v32];
    }
    double v30 = [MEMORY[0x1E4F1CAD0] setWithSet:v22];
  }
  else
  {
    uint64_t v28 = +[PGLogging sharedLogging];
    uint64_t v29 = [v28 loggingConnection];

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v44 = v8;
      _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, "Cannot find moment node for asset %@", buf, 0xCu);
    }

    double v30 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v30;
}

void __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__72187;
  uint64_t v18 = __Block_byref_object_dispose__72188;
  id v6 = a3;
  id v19 = v6;
  if (v6)
  {
    int v7 = [v5 domain];
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = v15[5];
    if (v7 == 200)
    {
      [v8 addObject:v9];
      while ([(id)v15[5] outEdgesCount])
      {
        id v10 = (void *)v15[5];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke_2;
        v11[3] = &unk_1E68F07F8;
        BOOL v13 = &v14;
        id v12 = *(id *)(a1 + 32);
        [v10 enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:v11];
      }
    }
    else
    {
      [v8 addObject:v9];
    }
  }
  _Block_object_dispose(&v14, 8);
}

void __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 localIdentifier];
  if ([v3 length] && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3)) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

void __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  int v8 = [a2 domain];
  if (v9 && v8 == 200)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    *a4 = 1;
  }
}

+ (id)stringFromPGRelatedType:(unint64_t)a3
{
  id result = @"PGRelatedTypeUnknown";
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      id result = @"PGRelatedTypePeople";
      break;
    case 2uLL:
      id result = @"PGRelatedTypeTime";
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      goto LABEL_6;
    case 4uLL:
      id result = @"PGRelatedTypeLocation";
      break;
    case 7uLL:
      id result = @"PGRelatedTypeFujiTailM1";
      break;
    case 8uLL:
      id result = @"PGRelatedTypeEvent";
      break;
    case 0xFuLL:
      id result = @"PGRelatedTypeFujiTailM2";
      break;
    case 0x10uLL:
      id result = @"PGRelatedTypePlace";
      break;
    default:
      if (a3 == 32)
      {
        id result = @"PGRelatedTypeScene";
      }
      else if (a3 == 63)
      {
        id result = @"PGRelatedTypeAny";
      }
      else
      {
LABEL_6:
        id result = @"invalid";
      }
      break;
  }
  return result;
}

@end