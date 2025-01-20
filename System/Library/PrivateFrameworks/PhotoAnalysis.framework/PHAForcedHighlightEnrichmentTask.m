@interface PHAForcedHighlightEnrichmentTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (double)period;
- (id)_highlightUUIDsNeedingForceEnrichmentInPhotoLibrary:(id)a3;
- (id)incrementalKey;
- (int)priority;
- (unint64_t)tailorOptions;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAForcedHighlightEnrichmentTask

- (id)_highlightUUIDsNeedingForceEnrichmentInPhotoLibrary:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2629800.0];
  v5 = [v3 librarySpecificFetchOptions];
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastEnrichmentDate" ascending:1];
  v27[0] = v6;
  v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v27[1] = v7;
  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v27[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  [v5 setInternalSortDescriptors:v9];

  v10 = (void *)MEMORY[0x1E4F28BA0];
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == nil || %K < %@", @"lastEnrichmentDate", @"lastEnrichmentDate", v4];
  v26[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d || %K == %d", @"kind", 0, @"kind", 3);
  v26[1] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"category", 1);
  v26[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  v15 = [v10 andPredicateWithSubpredicates:v14];
  [v5 setInternalPredicate:v15];

  [v5 setFetchLimit:500];
  [v5 setWantsIncrementalChangeDetails:0];
  uint64_t v25 = *MEMORY[0x1E4F39808];
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [v5 setFetchPropertySets:v16];

  v17 = [MEMORY[0x1E4F39238] fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:v5];
  uint64_t v18 = [v17 count];
  if (v18)
  {
    uint64_t v19 = v18;
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v18];
    for (uint64_t i = 0; i != v19; ++i)
    {
      v22 = [v17 objectAtIndexedSubscript:i];
      v23 = [v22 uuid];
      [v20 addObject:v23];
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v20;
}

- (unint64_t)tailorOptions
{
  return 1073742079;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAForcedHighlightEnrichmentTask timeoutFatal:]", "PHAForcedHighlightEnrichmentTask.m", 66, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAForcedHighlightEnrichmentTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 photoLibrary];
  v11 = [(PHAForcedHighlightEnrichmentTask *)self _highlightUUIDsNeedingForceEnrichmentInPhotoLibrary:v10];

  v12 = [v8 workingContext];
  v13 = [v12 loggingConnection];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = [v11 count];
    _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "PHAForcedHighlightEnrichmentTask: %tu highlights to force enrich", buf, 0xCu);
  }

  if ([v11 count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8D6C8]), "initWithHighlightTailorOptions:", -[PHAForcedHighlightEnrichmentTask tailorOptions](self, "tailorOptions"));
    id v15 = objc_alloc(MEMORY[0x1E4F8D658]);
    v22 = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    v17 = (void *)[v15 initWithManager:v8 enrichmentProcessors:v16];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__PHAForcedHighlightEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke;
    v20[3] = &unk_1E6918B08;
    id v21 = v9;
    char v18 = [v17 enrichDataModelForHighlightUUIDs:v11 withError:a5 progressBlock:v20];
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

uint64_t __79__PHAForcedHighlightEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (double)period
{
  return 86400.0;
}

- (int)priority
{
  return -1;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

@end