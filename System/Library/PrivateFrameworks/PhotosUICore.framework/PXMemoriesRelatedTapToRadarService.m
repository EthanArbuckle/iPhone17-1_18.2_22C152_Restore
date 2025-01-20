@interface PXMemoriesRelatedTapToRadarService
+ (BOOL)isServiceAvailableForProviders:(id)a3;
- (BOOL)canProvideConsoleDescription;
- (BOOL)canProvideContextualViewController;
- (BOOL)canProvideSettingsViewController;
- (id)_libraryStatDictionary;
- (id)_providerItemsSummary;
- (id)collectProviderItemsSummaryAndLibraryStat;
- (id)consoleDescription;
- (id)contextualViewController;
- (id)diagnosticFilesForPeopleContactSuggestionWithError:(id *)a3;
- (id)parseProviderItemsSummary:(id)a3 error:(id *)a4;
- (id)snapshotMemoriesRelatedResults:(id)a3 error:(id *)a4;
- (id)tapToRadarURLWithTitle:(id)a3 descriptionString:(id)a4;
- (id)title;
- (id)writeGraphData:(id)a3 errorsList:(id)a4;
- (id)writeGraphStatistics:(id)a3 errorsList:(id)a4;
- (id)writeLibraryStatistics:(id)a3 analysisClient:(id)a4 errorsList:(id)a5;
- (id)writeMemoriesSummary:(id)a3 analysisClient:(id)a4 errorsList:(id)a5;
- (id)writePeopleContactSuggestionsGraphStatistics:(id)a3 errorsList:(id)a4;
- (void)writeErrorsToErrorLog:(id)a3;
@end

@implementation PXMemoriesRelatedTapToRadarService

+ (BOOL)isServiceAvailableForProviders:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasItemForIdentifier:", @"PXDiagnosticsItemIdentifierRelatedCollection", (void)v11) & 1) != 0|| (objc_msgSend(v8, "hasItemForIdentifier:", @"PXDiagnosticsItemIdentifierMemory"))
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

- (id)contextualViewController
{
  if ([(PXMemoriesRelatedTapToRadarService *)self canProvideConsoleDescription])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__PXMemoriesRelatedTapToRadarService_contextualViewController__block_invoke;
    v6[3] = &unk_1E5DD2988;
    v6[4] = self;
    id v3 = objc_msgSend(MEMORY[0x1E4FB1EC0], "px_viewControllerWithOutput:", v6);
    uint64_t v4 = [(PXMemoriesRelatedTapToRadarService *)self title];
    [v3 setTitle:v4];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

uint64_t __62__PXMemoriesRelatedTapToRadarService_contextualViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) consoleDescription];
}

- (BOOL)canProvideSettingsViewController
{
  return 1;
}

- (BOOL)canProvideContextualViewController
{
  v2 = +[PXDiagnosticsSettings sharedInstance];
  char v3 = [v2 enableGraphService];

  return v3;
}

- (id)snapshotMemoriesRelatedResults:(id)a3 error:(id *)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v8 = [v7 photoAnalysisClient];
  BOOL v9 = [MEMORY[0x1E4F1CA48] array];
  id v65 = 0;
  v54 = [(PXMemoriesRelatedTapToRadarService *)self parseProviderItemsSummary:v6 error:&v65];
  id v10 = v65;
  long long v11 = v10;
  if (a4 && v10)
  {
    id v12 = v10;
    *a4 = v12;
    long long v13 = [v12 description];
    [v9 addObject:v13];
  }
  long long v14 = (void *)MEMORY[0x1E4F8A7D0];
  v15 = [v7 pathManager];
  id v16 = (id)[v14 createOrEmptyMemoriesRelatedSnapshotOutputFolderWithPathManager:v15];

  v17 = (void *)[v54 mutableCopy];
  id v18 = [(PXMemoriesRelatedTapToRadarService *)self writeGraphData:v8 errorsList:v9];
  id v19 = [(PXMemoriesRelatedTapToRadarService *)self writeGraphStatistics:v8 errorsList:v9];
  id v20 = [(PXMemoriesRelatedTapToRadarService *)self writeMemoriesSummary:v17 analysisClient:v8 errorsList:v9];
  id v21 = [(PXMemoriesRelatedTapToRadarService *)self writeLibraryStatistics:v6 analysisClient:v8 errorsList:v9];
  if (!v11)
  {
    v50 = [v17 objectForKey:@"identifiers"];
    v52 = [v50 objectForKey:@"referenceObjectIdentifier"];
    v23 = [v52 allKeys];
    v48 = [v23 firstObject];

    v24 = [v52 allValues];
    v49 = [v24 firstObject];

    v53 = [v49 objectForKey:@"referenceOrigin"];
    if (!v53)
    {
      v51 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== Unknown Reference Object Type Error ==\n"];
      if (v52) {
        [v51 appendFormat:@"Reference Object Info:\n(%@)\n", v52];
      }
      else {
        [v51 appendFormat:@"Reference Object is nil\n"];
      }
      v35 = PLUIGetLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v51;
        _os_log_impl(&dword_1A9AE7000, v35, OS_LOG_TYPE_ERROR, "%@\n", (uint8_t *)&buf, 0xCu);
      }

      [v9 addObject:v51];
      [(PXMemoriesRelatedTapToRadarService *)self writeErrorsToErrorLog:v9];
      id v22 = 0;
      goto LABEL_44;
    }
    [v17 setObject:v53 forKey:@"referenceObjectType"];
    if (([v53 isEqualToString:@"Moment"] & 1) != 0
      || ([v53 isEqualToString:@"Related"] & 1) != 0
      || ([v53 isEqualToString:@"Collection"] & 1) != 0
      || ([v53 isEqualToString:@"Memory"] & 1) != 0)
    {
      int v25 = 1;
      int v43 = 1;
    }
    else
    {
      int v43 = [v53 isEqualToString:@"One Up"];
      int v25 = 0;
    }
    v26 = PLUIGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v53;
      _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_DEBUG, "Snapshotting Memories and Related has started with reference object type %@.", (uint8_t *)&buf, 0xCu);
    }

    if (v43)
    {
      if (v25)
      {
        v27 = v64;
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke;
        v64[3] = &unk_1E5DCB3B8;
        id v28 = v48;
        v64[4] = v28;
        v64[5] = v9;
        [v8 requestSnapshotServiceForRelatedWithMomentLocalIdentifier:v28 reply:v64];
      }
      else
      {
        v27 = v63;
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_447;
        v63[3] = &unk_1E5DCB3B8;
        id v29 = v48;
        v63[4] = v29;
        v63[5] = v9;
        [v8 requestSnapshotServiceForRelatedWithAssetLocalIdentifier:v29 reply:v63];
      }
    }
    v51 = [v17 objectForKey:@"listOfSummaries"];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__248804;
    v69 = __Block_byref_object_dispose__248805;
    id v70 = [MEMORY[0x1E4F1CA60] dictionary];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_451;
    v62[3] = &unk_1E5DCB3E0;
    v62[4] = &buf;
    [v51 enumerateKeysAndObjectsUsingBlock:v62];
    v30 = [v54 objectForKey:@"identifiers"];
    v47 = [v30 objectForKey:@"referenceObjectIdentifier"];
    v46 = [v30 objectForKey:@"collectionIdentifiers"];
    v42 = v30;
    if (![v47 count] || !objc_msgSend(v46, "count"))
    {
LABEL_35:
      if ([v9 count])
      {
        [(PXMemoriesRelatedTapToRadarService *)self writeErrorsToErrorLog:v9];
        if (a4)
        {
          *a4 = [v9 firstObject];
        }
      }
      v38 = PLUIGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_1A9AE7000, v38, OS_LOG_TYPE_DEBUG, "Snapshotting Memories and Related results has completed.", v55, 2u);
      }

      if ([v9 count]) {
        v39 = 0;
      }
      else {
        v39 = v17;
      }
      id v22 = v39;

      _Block_object_dispose(&buf, 8);
LABEL_44:

      goto LABEL_45;
    }
    v31 = [v47 allKeys];
    v41 = [v31 firstObject];

    if ([v53 isEqualToString:@"One Up"])
    {
      v32 = [*(id *)(*((void *)&buf + 1) + 40) allKeys];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_2;
      v59[3] = &unk_1E5DCB408;
      v60[0] = v9;
      id v33 = v32;
      v60[1] = v33;
      id v61 = v41;
      [v8 requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier:v61 andRelatedResultsForLocalIdentifiers:v33 relatedType:63 reply:v59];
      v44 = (id *)v60;
      v34 = v59;
    }
    else
    {
      if (!v43)
      {
LABEL_34:

        goto LABEL_35;
      }
      v36 = [*(id *)(*((void *)&buf + 1) + 40) allKeys];
      uint64_t v45 = *(void *)(*((void *)&buf + 1) + 40);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_464;
      v56[3] = &unk_1E5DCB408;
      v57[0] = v9;
      id v33 = v36;
      v57[1] = v33;
      id v58 = v41;
      [v8 requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier:v58 andRelatedResultsForLocalIdentifiers:v33 relatedType:63 additionalSnapshotSummaryInfo:v45 reply:v56];
      v44 = (id *)v57;
      v34 = v56;
    }
    v37 = (id *)(v34 + 5);

    goto LABEL_34;
  }
  if ([v9 count]) {
    [(PXMemoriesRelatedTapToRadarService *)self writeErrorsToErrorLog:v9];
  }
  id v22 = 0;
LABEL_45:

  return v22;
}

void __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== requestSnapshotServiceForRelatedWithMomentLocalIdentifier:%@ ==\n", *(void *)(a1 + 32)];
    [v5 appendFormat:@"Failed writing Memories/Related related results - ERROR(%@)\n", v4];
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "== requestSnapshotServiceForRelatedWithMomentLocalIdentifier:%@ ==\nFailed writing Memories/Related related results - ERROR(%@)\n", buf, 0x16u);
    }

    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_447(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== requestSnapshotServiceForRelatedWithAssetLocalIdentifier:%@ ==\n", *(void *)(a1 + 32)];
    [v5 appendFormat:@"Failed writing Memories/Related related results - ERROR(%@)\n", v4];
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "== requestSnapshotServiceForRelatedWithAssetLocalIdentifier:%@ ==\nFailed writing Memories/Related related results - ERROR(%@)\n", buf, 0x16u);
    }

    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_451(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
  [v2 removeObjectForKey:@"referenceOrigin"];
  char v3 = [v2 objectForKey:@"momentLocalIdentifiers"];
  if (![v3 count])
  {
    id v4 = [v2 objectForKey:@"localIdentifier"];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

    char v3 = (void *)v5;
  }
  if ([v3 count])
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v7 = [v3 componentsJoinedByString:@", "];
    [v6 setObject:v2 forKey:v7];
  }
}

void __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed writing related debug info - ERROR(%@)\n", v4];
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Failed writing related debug info - ERROR(%@)\n", buf, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v7 = [*(id *)(a1 + 40) componentsJoinedByString:@"; "];
    v8 = [NSString stringWithFormat:@"== writing related debugInfo between asset(%@) and related results(%@) ==\n", *(void *)(a1 + 48), v7];
    uint64_t v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      id v12 = v10;
      __int16 v13 = 2112;
      long long v14 = v7;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "== writing related debugInfo between asset(%@) and related results(%@) ==\n", buf, 0x16u);
    }

    [*(id *)(a1 + 32) addObject:v8];
  }
}

void __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_464(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Failed writing related debug info - ERROR(%@)\n", v4];
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Failed writing related debug info - ERROR(%@)\n", buf, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v7 = [*(id *)(a1 + 40) componentsJoinedByString:@"; "];
    v8 = [NSString stringWithFormat:@"== writing related debugInfo between moment(%@) and related results(%@) ==\n", *(void *)(a1 + 48), v7];
    uint64_t v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      id v12 = v10;
      __int16 v13 = 2112;
      long long v14 = v7;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "== writing related debugInfo between moment(%@) and related results(%@) ==\n", buf, 0x16u);
    }

    [*(id *)(a1 + 32) addObject:v8];
  }
}

- (id)diagnosticFilesForPeopleContactSuggestionWithError:(id *)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary", a3);
  uint64_t v5 = [v4 photoAnalysisClient];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  id v8 = (id)[MEMORY[0x1E4F8A7D0] createOrEmptyMemoriesRelatedSnapshotOutputFolderWithPathManager:v7];
  uint64_t v9 = [(PXMemoriesRelatedTapToRadarService *)self writeGraphData:v5 errorsList:v6];
  __int16 v10 = [(PXMemoriesRelatedTapToRadarService *)self writePeopleContactSuggestionsGraphStatistics:v5 errorsList:v6];
  id v11 = [(PXMemoriesRelatedTapToRadarService *)self writeGraphStatistics:v5 errorsList:v6];
  id v12 = [MEMORY[0x1E4F1CA48] array];
  __int16 v13 = v12;
  if (v9) {
    [v12 addObject:v9];
  }
  if (v10) {
    [v13 addObject:v10];
  }
  if (v11) {
    [v13 addObject:v11];
  }

  return v13;
}

- (void)writeErrorsToErrorLog:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v3 stringWithFormat:@"ErrorsSnapshotMemoriesAndRelated.log"];
  id v6 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  uint64_t v7 = [MEMORY[0x1E4F8A7D0] memoriesAndRelatedDiagnosticsOutputURLWithPathManager:v6];
  id v8 = [v7 URLByAppendingPathComponent:v5];

  id v15 = 0;
  uint64_t v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:100 options:0 error:&v15];

  id v10 = v15;
  if (![v9 length]
    || (id v14 = v10,
        char v11 = [v9 writeToURL:v8 options:1073741825 error:&v14],
        id v12 = v14,
        v10,
        id v10 = v12,
        (v11 & 1) == 0))
  {
    __int16 v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v10;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Failed writing an error log due to an error - %@\n", buf, 0xCu);
    }
  }
}

- (id)writeLibraryStatistics:(id)a3 analysisClient:(id)a4 errorsList:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = [a3 objectForKey:@"libraryStatSummary"];
  if ([v7 count])
  {
    id v8 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    uint64_t v9 = [MEMORY[0x1E4F8A7D0] memoriesAndRelatedDiagnosticsOutputURLWithPathManager:v8];
    id v10 = [v9 URLByAppendingPathComponent:@"LibraryStatistics.plist"];

    char v11 = [v10 path];
    id v20 = 0;
    id v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v20];
    id v19 = v20;
    id v13 = v20;
    char v14 = [v12 writeToURL:v10 options:0 error:&v19];
    id v15 = v19;

    if ((v14 & 1) == 0)
    {
      id v16 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== writing library statistics summary ==\n"];
      [v16 appendFormat:@"Failed writing Library Statistics List - ERROR(%@)\n", v15];
      id v17 = PLUIGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v22 = v15;
        _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "== writing library statistics summary ==\nFailed writing Library Statistics List - ERROR(%@)\n", buf, 0xCu);
      }

      [v6 addObject:v16];
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)writeMemoriesSummary:(id)a3 analysisClient:(id)a4 errorsList:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 objectForKey:@"listOfMemoriesSummaries"];
  char v11 = [MEMORY[0x1E4F1CA48] array];
  if (v10)
  {
    id v12 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    id v13 = [MEMORY[0x1E4F8A7D0] memoriesAndRelatedDiagnosticsOutputURLWithPathManager:v12];
    char v14 = [v13 URLByAppendingPathComponent:@"Memories"];

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__248804;
    v37 = __Block_byref_object_dispose__248805;
    id v38 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v16 = (id *)(v34 + 5);
    id obj = (id)v34[5];
    char v17 = [v15 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&obj];
    objc_storeStrong(v16, obj);

    char v32 = v17;
    if (*((unsigned char *)v30 + 24))
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__PXMemoriesRelatedTapToRadarService_writeMemoriesSummary_analysisClient_errorsList___block_invoke;
      v22[3] = &unk_1E5DCB390;
      v26 = &v33;
      id v23 = v14;
      v27 = &v29;
      id v24 = v11;
      id v25 = v9;
      [v10 enumerateKeysAndObjectsUsingBlock:v22];

      uint64_t v18 = v23;
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== writing summary list ==\n"];
      [v18 appendFormat:@"Failed writing Memories/Related summary list - ERROR(%@)\n", v34[5]];
      id v19 = PLUIGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = v34[5];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v40 = v20;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "== writing summary list ==\nFailed writing Memories/Related summary list - ERROR(%@)\n", buf, 0xCu);
      }

      [v9 addObject:v18];
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);
  }
  return v11;
}

void __85__PXMemoriesRelatedTapToRadarService_writeMemoriesSummary_analysisClient_errorsList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F98];
  id v6 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  id v7 = a3;
  id v8 = a2;
  id v9 = [v5 dataWithPropertyList:v7 format:200 options:0 error:&obj];
  objc_storeStrong(v6, obj);
  id v10 = [v7 objectForKeyedSubscript:@"title"];

  char v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F00B0030];

  id v12 = NSString;
  id v13 = [v8 pathComponents];

  char v14 = [v13 firstObject];
  id v15 = [v12 stringWithFormat:@"%@-%@", v11, v14];

  id v16 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v15];
  char v17 = [v16 URLByAppendingPathExtension:@"plist"];

  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  id v24 = *(id *)(v18 + 40);
  LOBYTE(v14) = [v9 writeToURL:v17 options:0 error:&v24];
  objc_storeStrong((id *)(v18 + 40), v24);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (_BYTE)v14;
  id v19 = *(void **)(a1 + 40);
  uint64_t v20 = [v17 path];
  [v19 addObject:v20];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v21 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== writing summary list ==\n"];
    [v21 appendFormat:@"Failed writing Memories/Related summary list - ERROR(%@)\n", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    id v22 = PLUIGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v27 = v23;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "== writing summary list ==\nFailed writing Memories/Related summary list - ERROR(%@)\n", buf, 0xCu);
    }

    [*(id *)(a1 + 48) addObject:v21];
  }
}

- (id)writePeopleContactSuggestionsGraphStatistics:(id)a3 errorsList:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v22 = 0;
  id v6 = [a3 requestGraphStatisticsWithOptions:&unk_1F02DB8B0 error:&v22];
  id v7 = v22;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    char v11 = [MEMORY[0x1E4F8A7D0] memoriesAndRelatedDiagnosticsOutputURLWithPathManager:v8];
    id v12 = [v11 URLByAppendingPathComponent:@"PeopleContactSuggestions.txt"];

    id v10 = [v12 path];
    id v13 = [v6 dataUsingEncoding:4];
    if ([v13 length])
    {
      id v21 = 0;
      char v14 = [v13 writeToURL:v12 options:1073741825 error:&v21];
      id v15 = v21;
      if (v14)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      id v24 = @"Graph Statistics is not available";
      char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v15 = [v16 errorWithDomain:@"com.apple.Photos.TTR.metadataSnapshot" code:3 userInfo:v17];
    }
    uint64_t v18 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== writing Graph statistics ==\n"];
    [v18 appendFormat:@"Failed writing Graph Statistics - ERROR(%@)\n", v15];
    id v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v26 = v15;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "== writing Graph statistics ==\nFailed writing Graph Statistics - ERROR(%@)\n", buf, 0xCu);
    }

    [v5 addObject:v18];
    goto LABEL_12;
  }
  id v8 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== requestGraphStatistic ==\n"];
  [v8 appendFormat:@"Failed obtaining People Contact Suggestions Graph Statistics - ERROR(%@)\n", v7];
  id v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v26 = v7;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "== requestGraphStatistic ==\nFailed obtaining Graph Statistics - ERROR(%@)\n", buf, 0xCu);
  }

  [v5 addObject:v8];
  id v10 = 0;
LABEL_13:

  return v10;
}

- (id)writeGraphStatistics:(id)a3 errorsList:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v22 = 0;
  id v6 = [a3 requestGraphStatisticsWithOptions:MEMORY[0x1E4F1CC08] error:&v22];
  id v7 = v22;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    char v11 = [MEMORY[0x1E4F8A7D0] memoriesAndRelatedDiagnosticsOutputURLWithPathManager:v8];
    id v12 = [v11 URLByAppendingPathComponent:@"GraphStatistics.txt"];

    id v10 = [v12 path];
    id v13 = [v6 dataUsingEncoding:4];
    if ([v13 length])
    {
      id v21 = 0;
      char v14 = [v13 writeToURL:v12 options:1073741825 error:&v21];
      id v15 = v21;
      if (v14)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      id v24 = @"Graph Statistics is not available";
      char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v15 = [v16 errorWithDomain:@"com.apple.Photos.TTR.metadataSnapshot" code:3 userInfo:v17];
    }
    uint64_t v18 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== writing Graph statistics ==\n"];
    [v18 appendFormat:@"Failed writing Graph Statistics - ERROR(%@)\n", v15];
    id v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v26 = v15;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "== writing Graph statistics ==\nFailed writing Graph Statistics - ERROR(%@)\n", buf, 0xCu);
    }

    [v5 addObject:v18];
    goto LABEL_12;
  }
  id v8 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== requestGraphStatistic ==\n"];
  [v8 appendFormat:@"Failed obtaining Graph Statistics - ERROR(%@)\n", v7];
  id v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v26 = v7;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "== requestGraphStatistic ==\nFailed obtaining Graph Statistics - ERROR(%@)\n", buf, 0xCu);
  }

  [v5 addObject:v8];
  id v10 = 0;
LABEL_13:

  return v10;
}

- (id)writeGraphData:(id)a3 errorsList:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v11 = 0;
  id v6 = [a3 requestExportGraphForPurpose:@"snapshot" error:&v11];
  id v7 = v11;
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28E78] stringWithFormat:@"== requestExportGraphForPurpose:snapshot ==\n"];
    [v8 appendFormat:@"Failed writing Memories/Related Graph State - ERROR(%@)\n", v7];
    id v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "== requestExportGraphForPurpose:snapshot ==\nFailed writing Memories/Related Graph State - ERROR(%@)\n", buf, 0xCu);
    }

    [v5 addObject:v8];
  }

  return v6;
}

- (id)tapToRadarURLWithTitle:(id)a3 descriptionString:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 || !v8)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PXMemoriesRelatedTapToRadarService.m", 351, @"Invalid parameter not satisfying: %@", @"title && descriptionString" object file lineNumber description];
  }
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  [v10 setObject:v7 forKey:@"Title"];
  [v10 setObject:@"com.apple.PhotoLibraryServices.PhotosDiagnostics" forKey:@"ExtensionIdentifiers"];
  [v10 setObject:@"Serious Bug" forKey:@"Classification"];
  [v10 setObject:@"Always" forKey:@"Reproducibility"];
  id v25 = v9;
  [v10 setObject:v9 forKey:@"Description"];
  [v10 setObject:@"819256" forKey:@"ComponentID"];
  [v10 setObject:@"all" forKey:@"ComponentVersion"];
  [v10 setObject:@"Photos Media Mining (New Bugs)" forKey:@"ComponentName"];
  id v11 = [MEMORY[0x1E4F29088] componentsWithString:@"tap-to-radar://new"];
  id v12 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v19 = (void *)MEMORY[0x1E4F290C8];
        uint64_t v20 = [v13 objectForKeyedSubscript:v18];
        id v21 = [v19 queryItemWithName:v18 value:v20];
        [v12 addObject:v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  [v11 setQueryItems:v12];
  id v22 = [v11 URL];

  return v22;
}

- (id)collectProviderItemsSummaryAndLibraryStat
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(PXMemoriesRelatedTapToRadarService *)self _providerItemsSummary];
  if ([v4 count]) {
    [v3 setObject:v4 forKey:@"providerItemSummary"];
  }
  id v5 = [(PXMemoriesRelatedTapToRadarService *)self _libraryStatDictionary];
  if ([v5 count]) {
    [v3 setObject:v5 forKey:@"libraryStatSummary"];
  }

  return v3;
}

- (id)parseProviderItemsSummary:(id)a3 error:(id *)a4
{
  v94[1] = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v55 = [v57 objectForKey:@"providerItemSummary"];
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__248804;
  v87 = __Block_byref_object_dispose__248805;
  id v88 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = __Block_byref_object_copy__248804;
  v81[4] = __Block_byref_object_dispose__248805;
  id v82 = 0;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__248804;
  v79 = __Block_byref_object_dispose__248805;
  id v80 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = __Block_byref_object_copy__248804;
  v73[4] = __Block_byref_object_dispose__248805;
  id v74 = 0;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke;
  v72[3] = &unk_1E5DCB340;
  v72[4] = &v83;
  v72[5] = v81;
  v72[6] = &v75;
  v72[7] = v73;
  [v55 enumerateKeysAndObjectsUsingBlock:v72];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v58 = [v6 librarySpecificFetchOptions];

  [v58 setIncludePendingMemories:1];
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v94[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:1];
  [v58 setSortDescriptors:v8];

  v54 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v58];
  id v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v54, "count"));
  id v10 = [v54 objectsAtIndexes:v9];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v68 objects:v93 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v69 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:*(void *)(*((void *)&v68 + 1) + 8 * i)];
        uint64_t v16 = [v15 objectForKey:@"localIdentifier"];
        if (v16) {
          [v5 setObject:v15 forKey:v16];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v68 objects:v93 count:16];
    }
    while (v12);
  }

  [v4 setObject:v5 forKey:@"listOfMemoriesSummaries"];
  v56 = [MEMORY[0x1E4F1CA60] dictionary];
  char v17 = (void *)v76[5];
  if (v17)
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_3;
    v66[3] = &unk_1E5DD2A90;
    id v67 = v56;
    [v17 enumerateKeysAndObjectsUsingBlock:v66];
  }
  [v4 setObject:v56 forKey:@"listOfSummaries"];
  uint64_t v18 = [MEMORY[0x1E4F28E78] string];
  [v18 appendFormat:@"More details can be found in the attachments, but here is the high level library stats:\n"];
  [v18 appendFormat:@"\n ======== Library Summary Stat =======\n"];
  v53 = [v57 objectForKey:@"libraryStatSummary"];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_4;
  v64[3] = &unk_1E5DD2A90;
  id v19 = v18;
  id v65 = v19;
  [v53 enumerateKeysAndObjectsUsingBlock:v64];
  [v4 setObject:v19 forKey:@"summaryDescription"];
  uint64_t v20 = [(id)v84[5] objectForKey:@"summaryInfo"];
  if (!v84[5])
  {
    id v21 = [(id)v76[5] allValues];
    uint64_t v22 = [v21 firstObject];
    uint64_t v23 = (void *)v84[5];
    v84[5] = v22;

    uint64_t v24 = [(id)v84[5] objectForKey:@"summaryInfo"];

    uint64_t v20 = (void *)v24;
    if (!v84[5]) {
      goto LABEL_18;
    }
  }
  if (v20)
  {
    id v25 = [v20 objectForKey:@"referenceOrigin"];
    v49 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v26 = [(id)v84[5] objectForKey:@"summaryInfo"];
    v46 = [(id)v84[5] objectForKey:@"providerItem"];
    if ([v25 isEqualToString:@"Related"])
    {
      long long v27 = [v26 objectForKey:@"momentLocalIdentifiers"];
      long long v28 = v27;
      if (v27)
      {
        v50 = [v27 firstObject];
      }
      else
      {
        v50 = 0;
      }
    }
    else
    {
      v50 = [v26 objectForKey:@"localIdentifier"];
    }
    if (v50)
    {
      v52 = v26;
      uint64_t v33 = v4;
      v34 = v25;
      uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v25, @"referenceOrigin", v46, @"providerItem", 0);
      [v49 setObject:v35 forKey:v50];
      v36 = [MEMORY[0x1E4F1CA60] dictionary];
      v37 = (void *)v76[5];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_287;
      v59[3] = &unk_1E5DCB368;
      SEL v62 = a2;
      void v59[4] = self;
      id v60 = v34;
      id v38 = v36;
      id v61 = v38;
      [v37 enumerateKeysAndObjectsUsingBlock:v59];
      v39 = [MEMORY[0x1E4F1CA60] dictionary];
      [v39 setObject:v49 forKey:@"referenceObjectIdentifier"];
      [v39 setObject:v38 forKey:@"collectionIdentifiers"];
      [v33 setObject:v39 forKey:@"identifiers"];
      id v40 = v33;

      id v25 = v34;
      id v4 = v33;
      long long v26 = v52;
    }
    else
    {
      uint64_t v41 = PLUIGetLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A9AE7000, v41, OS_LOG_TYPE_ERROR, "Error - Local Identifier for a reference object wasn't set", buf, 2u);
      }

      if (a4)
      {
        v42 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v89 = *MEMORY[0x1E4F28568];
        v90 = @"Error - Local Identifier for a reference object wasn't set";
        int v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
        *a4 = [v42 errorWithDomain:@"com.apple.Photos.TTR.metadataSnapshot" code:2 userInfo:v43];
      }
      id v44 = v4;
    }
  }
  else
  {
LABEL_18:
    long long v29 = PLUIGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_ERROR, "Error - the main reference object (Moment / Memory) was not found. Please try to capture the data once all results were fully loaded on the screen.", buf, 2u);
    }

    if (a4)
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v91 = *MEMORY[0x1E4F28568];
      v92 = @"Error - the main reference object (Moment / Memory) was not found. Please try to capture the data once all results were fully loaded on the screen.";
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
      *a4 = [v30 errorWithDomain:@"com.apple.Photos.TTR.metadataSnapshot" code:2 userInfo:v31];
    }
    id v32 = v4;
  }

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(&v75, 8);

  _Block_object_dispose(v81, 8);
  _Block_object_dispose(&v83, 8);

  return v4;
}

void __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v9 = a3;
  if ([v8 isEqualToString:@"PXDiagnosticsItemIdentifierRelatedReferenceObject"])
  {
    id v10 = [v9 allValues];
    uint64_t v11 = [v10 firstObject];
    uint64_t v12 = *(void *)(a1[4] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = a1[5];
LABEL_6:
    objc_storeStrong((id *)(*(void *)(v14 + 8) + 40), a2);
    goto LABEL_7;
  }
  if (![v8 isEqualToString:@"PXDiagnosticsItemIdentifierMemory"])
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    uint64_t v14 = a1[7];
    goto LABEL_6;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_2;
  v15[3] = &unk_1E5DCB318;
  long long v16 = *((_OWORD *)a1 + 2);
  [v9 enumerateKeysAndObjectsUsingBlock:v15];
LABEL_7:
  if (*(void *)(*(void *)(a1[4] + 8) + 40) && *(void *)(*(void *)(a1[6] + 8) + 40)) {
    *a4 = 1;
  }
}

void __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 objectForKey:@"summaryInfo"];
  id v4 = [v5 objectForKey:@"localIdentifier"];
  if (v4) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v4];
  }
}

uint64_t __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@ = %@\n", a2, a3];
}

void __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_287(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v8 = [v4 objectForKey:@"summaryInfo"];
  id v5 = [v4 objectForKey:@"providerItem"];

  id v6 = [v8 objectForKey:@"localIdentifier"];
  id v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *(void *)(a1 + 40), @"referenceOrigin", v5, @"providerItem", 0);
  [*(id *)(a1 + 48) setObject:v7 forKey:v6];
}

void __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  id v7 = [v6 objectForKey:@"summaryInfo"];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKey:@"category"];
    if ([v9 integerValue] == 201)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
}

- (id)_providerItemsSummary
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v32 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(PXDiagnosticsService *)self itemProviders];
  uint64_t v27 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v38;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v3;
        id v4 = *(void **)(*((void *)&v37 + 1) + 8 * v3);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v5 = [v4 registeredIdentifiers];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v34;
          v30 = v5;
          uint64_t v31 = v4;
          uint64_t v29 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v34 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              if ([v10 containsString:@"com.apple.miro"])
              {
                id v11 = (id)[v4 itemForIdentifier:v10];
              }
              else
              {
                uint64_t v12 = [v4 itemForIdentifier:v10];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v13 = [v32 objectForKey:v10];
                  uint64_t v14 = (void *)[v13 mutableCopy];

                  if (!v14)
                  {
                    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
                  }
                  unint64_t v15 = [v14 count];
                  long long v16 = [v12 uuid];
                  char v17 = [v14 objectForKey:v16];
                  uint64_t v18 = (void *)[v17 mutableCopy];

                  if (!v18)
                  {
                    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
                  }
                  unint64_t v19 = [v18 count];
                  uint64_t v20 = [v18 objectForKey:v16];

                  if (!v20)
                  {
                    id v21 = +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:v12];
                    [v18 setObject:v21 forKey:v16];
                  }
                  if ([v18 count] > v19)
                  {
                    uint64_t v22 = [v18 valueForKey:v16];
                    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v22, @"summaryInfo", v12, @"providerItem", 0);
                    [v14 setObject:v23 forKey:v16];
                  }
                  uint64_t v8 = v29;
                  if ([v14 count] > v15) {
                    [v32 setObject:v14 forKey:v10];
                  }

                  id v5 = v30;
                  id v4 = v31;
                }
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v27);
  }

  return v32;
}

- (id)_libraryStatDictionary
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__248804;
  uint64_t v13 = __Block_byref_object_dispose__248805;
  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v2 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PXMemoriesRelatedTapToRadarService__libraryStatDictionary__block_invoke;
  v6[3] = &unk_1E5DD0588;
  id v3 = v2;
  id v7 = v3;
  uint64_t v8 = &v9;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __60__PXMemoriesRelatedTapToRadarService__libraryStatDictionary__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__PXMemoriesRelatedTapToRadarService__libraryStatDictionary__block_invoke_2;
  v3[3] = &unk_1E5DCB2E8;
  v3[4] = *(void *)(a1 + 40);
  [MEMORY[0x1E4F8A7D0] collectMomentsStatWithLibraryContext:v2 completionBlock:v3];
}

uint64_t __60__PXMemoriesRelatedTapToRadarService__libraryStatDictionary__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return [*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40) addEntriesFromDictionary:a2];
  }
  return result;
}

- (id)consoleDescription
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] string];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(PXDiagnosticsService *)self itemProviders];
  uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v4;
        id v5 = *(void **)(*((void *)&v22 + 1) + 8 * v4);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v6 = [v5 registeredIdentifiers];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              uint64_t v12 = [v5 itemForIdentifier:v11];
              if ([v3 length]) {
                [v3 appendString:@"\n"];
              }
              [v3 appendFormat:@"%@: %@\n", v11, v12];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v17 + 1;
      }
      while (v17 + 1 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v16);
  }

  return v3;
}

- (BOOL)canProvideConsoleDescription
{
  return 1;
}

- (id)title
{
  return @"Tap-to-Radar (Memories/Related)";
}

@end