@interface PHAMediaSampleReportingTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (BOOL)shouldRunWithPhotoLibrary:(id)a3;
- (NSString)name;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAMediaSampleReportingTask

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAMediaSampleReportingTask timeoutFatal:]", "PHAMediaSampleReportingTask.m", 115, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAMediaSampleReportingTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  *(void *)&v29[5] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  os_log_t v12 = os_log_create("com.apple.PhotosGraph", "metrics");
  if (PFOSVariantHasInternalDiagnostics()) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 500;
  }
  if (arc4random_uniform(v13) == 1)
  {
    v14 = [v9 librarySpecificFetchOptions];
    v15 = [MEMORY[0x1E4F38FA8] assetPropertySetsToFetch];
    [v14 setFetchPropertySets:v15];

    [v14 setWantsIncrementalChangeDetails:0];
    [v14 setIsExclusivePredicate:1];
    [v14 setChunkSizeForFetch:1];
    [v14 setCacheSizeForFetch:1];
    v16 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v14];
    if ([v11 isCancelledWithProgress:0.5])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v29[0] = 91;
        LOWORD(v29[1]) = 2080;
        *(void *)((char *)&v29[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotoAnalysis/Framework/Storytelling/Tasks/AnalyticsTasks/PHAMediaSampleReportingTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a6 && !*a6)
      {
        [MEMORY[0x1E4F71EB8] errorForCode:-4];
        char v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      uint64_t v18 = [v16 count];
      if (v18
        && ([v16 objectAtIndexedSubscript:arc4random_uniform(v18)],
            (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v20 = (void *)v19;
        v21 = v12;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = [v20 uuid];
          *(_DWORD *)buf = 138412290;
          *(void *)v29 = v22;
          _os_log_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_INFO, "[PHAMediaSampleReportingTask] Reporting asset uuid: %@", buf, 0xCu);
        }
        uint64_t v26 = *MEMORY[0x1E4F56558];
        v27 = v20;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        [v10 sendEvent:@"com.apple.photos.CPAnalytics.mediaSample" withPayload:v23];
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_ERROR, "[PHAMediaSampleReportingTask] Media sample report: random asset is nil", buf, 2u);
        }
        v20 = 0;
      }
      int v24 = [v11 isCancelledWithProgress:1.0];
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v29[0] = 109;
          LOWORD(v29[1]) = 2080;
          *(void *)((char *)&v29[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotoAnalysis/Framework/Storytelling/Tasks/AnalyticsTasks/PHAMediaSampleReportingTask.m";
          _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        if (a6 && !*a6)
        {
          *a6 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
        }
      }
      char v17 = v24 ^ 1;
    }
  }
  else
  {
    char v17 = 1;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v29 = v13;
      _os_log_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_INFO, "[PHAMediaSampleReportingTask] Skip media sample reporting, reporting rate: %lu", buf, 0xCu);
    }
  }

  return v17;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 workingContext];
  id v11 = [v10 photoLibrary];
  os_log_t v12 = [v9 analytics];

  LOBYTE(a5) = [(PHAMediaSampleReportingTask *)self runWithPhotoLibrary:v11 analytics:v12 progressReporter:v8 error:a5];
  return (char)a5;
}

- (BOOL)shouldRunWithPhotoLibrary:(id)a3
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  v4 = [a3 photoLibrary];
  LOBYTE(self) = [(PHAMediaSampleReportingTask *)self shouldRunWithPhotoLibrary:v4];

  return (char)self;
}

- (int)priority
{
  return 0;
}

- (id)taskClassDependencies
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  return 86400.0;
}

- (NSString)name
{
  return (NSString *)@"PHAMediaSampleReportingTask";
}

@end