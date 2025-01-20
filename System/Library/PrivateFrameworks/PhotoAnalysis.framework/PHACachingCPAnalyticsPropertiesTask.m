@interface PHACachingCPAnalyticsPropertiesTask
+ (BOOL)_hasAppleMusicSubscriptionWithLoggingConnection:(id)a3;
+ (id)_ageRangeDescriptionFromBirthday:(id)a3;
+ (id)_fetchDemographicsSummaryWithLoggingConnection:(id)a3;
+ (id)_fetchLibrarySummaryForPhotoLibrary:(id)a3 loggingConnection:(id)a4 progressReporter:(id)a5;
+ (id)_genderDescriptionFromGivenName:(id)a3;
+ (id)_meContactWithLoggingConnection:(id)a3;
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (BOOL)shouldRunWithPhotoLibrary:(id)a3;
- (NSString)name;
- (double)period;
- (id)_buildPropertyCacheForPhotoLibrary:(id)a3 loggingConnection:(id)a4 progressReporter:(id)a5;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHACachingCPAnalyticsPropertiesTask

+ (BOOL)_hasAppleMusicSubscriptionWithLoggingConnection:(id)a3
{
  id v3 = a3;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v5 = (void *)MEMORY[0x1E4F8D7E0];
  v6 = [MEMORY[0x1E4F71F08] ignoreProgress];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PHACachingCPAnalyticsPropertiesTask__hasAppleMusicSubscriptionWithLoggingConnection___block_invoke;
  v13[3] = &unk_1E6917E10;
  v16 = &v17;
  v7 = v3;
  v14 = v7;
  v8 = v4;
  v15 = v8;
  [v5 checkMusicCatalogEligibilityWithProgressReporter:v6 completionHandler:v13];

  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v8, v9) && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "[PHACachingCPAnalyticsPropertiesTask] Checking Apple Music Catalog Timeout", v12, 2u);
  }
  char v10 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __87__PHACachingCPAnalyticsPropertiesTask__hasAppleMusicSubscriptionWithLoggingConnection___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 & a3;
  if ((a2 & 1) == 0)
  {
    v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_DEFAULT, "[PHACachingCPAnalyticsPropertiesTask] Error checking Apple Music Catalog eligibility (%@)", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)_ageRangeDescriptionFromBirthday:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3 || [v3 year] < 1900 || objc_msgSend(v4, "day") == 1 && objc_msgSend(v4, "month") == 1)
  {
    v5 = @"Unknown";
  }
  else
  {
    v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v4 setCalendar:v6];
    id v7 = [v4 date];
    v8 = [MEMORY[0x1E4F1C9C8] date];
    int v9 = [v6 components:4 fromDate:v7 toDate:v8 options:0];
    unint64_t v10 = [v9 year];
    uint64_t v11 = @"<18";
    v12 = @"18-25";
    v13 = @"26-35";
    v14 = @"36-45";
    v15 = @"46-55";
    v16 = @">65";
    if (v10 < 0x42) {
      v16 = @"56-65";
    }
    if (v10 >= 0x38) {
      v15 = v16;
    }
    if (v10 >= 0x2E) {
      v14 = v15;
    }
    if (v10 >= 0x24) {
      v13 = v14;
    }
    if (v10 >= 0x1A) {
      v12 = v13;
    }
    if (v10 >= 0x12) {
      uint64_t v11 = v12;
    }
    if ((uint64_t)v10 >= 1) {
      v5 = v11;
    }
    else {
      v5 = @"Unknown";
    }
  }
  return v5;
}

+ (id)_genderDescriptionFromGivenName:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = v3;
    v5 = @"Unknown";
    if ([v4 UTF8String])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F5C968]);
      uint64_t v7 = [v6 genderMajorityForGivenName:v4];
      v8 = @"Male";
      if (v7 != 2) {
        v8 = @"Unknown";
      }
      if (v7 == 1) {
        v5 = @"Female";
      }
      else {
        v5 = v8;
      }
    }
  }
  else
  {
    v5 = @"Unknown";
  }

  return v5;
}

+ (id)_meContactWithLoggingConnection:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v3, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] Start fetching Me contact card", buf, 2u);
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 1) > 1)
  {
    uint64_t v6 = *MEMORY[0x1E4F1AD90];
    v14[0] = *MEMORY[0x1E4F1ADF0];
    v14[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    id v11 = 0;
    v8 = [v4 _crossPlatformUnifiedMeContactWithKeysToFetch:v7 error:&v11];
    id v9 = v11;

    if (v9)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v9;
        _os_log_error_impl(&dword_1D21F2000, v3, OS_LOG_TYPE_ERROR, "[PHACachingCPAnalyticsPropertiesTask] Error fetching the me Contact Card (%@)", buf, 0xCu);
      }
      id v5 = 0;
    }
    else
    {
      id v5 = v8;
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v3, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] Not authorized to get meContact", buf, 2u);
    }
    id v5 = 0;
  }

  return v5;
}

+ (id)_fetchDemographicsSummaryWithLoggingConnection:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1D21F2000, v4, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] Start caching CPAnalytics demographics summary", v13, 2u);
  }
  id v5 = [a1 _meContactWithLoggingConnection:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = v6;
  if (v5)
  {
    v8 = [v5 birthday];
    id v9 = [a1 _ageRangeDescriptionFromBirthday:v8];
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F563D8]];

    unint64_t v10 = [v5 givenName];
    id v11 = [a1 _genderDescriptionFromGivenName:v10];
    [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F563E0]];
  }
  else
  {
    [v6 setObject:@"Unknown" forKeyedSubscript:*MEMORY[0x1E4F563D8]];
    [v7 setObject:@"Unknown" forKeyedSubscript:*MEMORY[0x1E4F563E0]];
  }

  return v7;
}

+ (id)_fetchLibrarySummaryForPhotoLibrary:(id)a3 loggingConnection:(id)a4 progressReporter:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] Start caching CPAnalytics library summary", buf, 2u);
  }
  if (!v7)
  {
    id v14 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_33;
  }
  id v10 = v9;
  id v11 = [v7 librarySpecificFetchOptions];
  [v11 setWantsIncrementalChangeDetails:0];
  [v11 setShouldPrefetchCount:1];
  [v11 setIsExclusivePredicate:1];
  v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithMediaType:1 options:v11];
  uint64_t v13 = [v12 count];
  if ([v10 isCancelledWithProgress:0.1])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v58 = 187;
      __int16 v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storytel"
            "ling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
      _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v14 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_32;
  }
  v15 = [MEMORY[0x1E4F38EB8] fetchAssetsWithMediaType:2 options:v11];
  uint64_t v16 = [v15 count];
  if ([v10 isCancelledWithProgress:0.2])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v58 = 191;
      __int16 v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storytel"
            "ling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
      _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v14 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_31;
  }
  v54 = [MEMORY[0x1E4F391A0] fetchMomentsWithOptions:v11];
  uint64_t v17 = [v7 librarySpecificFetchOptions];
  [v17 setShouldPrefetchCount:1];
  [v17 setPersonContext:1];
  v53 = v17;
  v18 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v17];
  if ([v10 isCancelledWithProgress:0.3])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v58 = 201;
      __int16 v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storytel"
            "ling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
      uint64_t v19 = MEMORY[0x1E4F14500];
LABEL_19:
      _os_log_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    [v7 ratioOfAssetsWithScenesProcessed];
    double v21 = v20;
    [v7 ratioOfAssetsWithFacesProcessed];
    double v23 = v22;
    [v7 ratioOfAssetsWithMediaAnalysisVideoProcessed];
    double v25 = v24;
    [v7 ratioOfAssetsWithMediaAnalysisImageProcessed];
    double v27 = v26;
    if (![v10 isCancelledWithProgress:0.5])
    {
      v52 = v18;
      unsigned int v41 = [v7 isCloudPhotoLibraryEnabled];
      v50 = v15;
      if (v41)
      {
        v28 = [v7 librarySpecificFetchOptions];
        [v28 setShouldPrefetchCount:1];
        v29 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v28];
        BOOL v46 = [v29 count] != 0;
      }
      else
      {
        BOOL v46 = 0;
      }
      v51 = [v7 cplStatus];
      v55[0] = *MEMORY[0x1E4F56610];
      v49 = [NSNumber numberWithUnsignedInteger:v13];
      v56[0] = v49;
      v55[1] = *MEMORY[0x1E4F56620];
      v48 = [NSNumber numberWithUnsignedInteger:v16];
      v56[1] = v48;
      v55[2] = *MEMORY[0x1E4F565C8];
      v47 = [NSNumber numberWithUnsignedInteger:v16 + v13];
      v56[2] = v47;
      v55[3] = *MEMORY[0x1E4F565F0];
      v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v54, "count"));
      v56[3] = v45;
      v55[4] = *MEMORY[0x1E4F56600];
      v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v52, "count"));
      v56[4] = v44;
      v55[5] = *MEMORY[0x1E4F56618];
      v43 = [NSNumber numberWithDouble:v21];
      v56[5] = v43;
      v55[6] = *MEMORY[0x1E4F565D0];
      v40 = [NSNumber numberWithDouble:v23];
      v56[6] = v40;
      v55[7] = *MEMORY[0x1E4F565E8];
      v39 = [NSNumber numberWithDouble:v25];
      v56[7] = v39;
      v55[8] = *MEMORY[0x1E4F565E0];
      v38 = [NSNumber numberWithDouble:v27];
      v56[8] = v38;
      v55[9] = *MEMORY[0x1E4F56630];
      v42 = [NSNumber numberWithBool:v41];
      v56[9] = v42;
      v55[10] = *MEMORY[0x1E4F56638];
      v37 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v51, "isExceedingQuota"));
      v56[10] = v37;
      v55[11] = *MEMORY[0x1E4F56648];
      v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v51, "lowDiskSpace"));
      v56[11] = v36;
      v55[12] = *MEMORY[0x1E4F56650];
      v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v51, "veryLowDiskSpace"));
      v56[12] = v30;
      v55[13] = *MEMORY[0x1E4F56640];
      v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v51, "hasChangesToProcess"));
      v56[13] = v31;
      v55[14] = *MEMORY[0x1E4F56628];
      v32 = [NSNumber numberWithBool:v46];
      v56[14] = v32;
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:15];

      if ([v10 isCancelledWithProgress:1.0])
      {
        v34 = v33;
        v15 = v50;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v58 = 241;
          __int16 v59 = 2080;
          v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Stor"
                "ytelling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
          _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v14 = (id)MEMORY[0x1E4F1CC08];
      }
      else
      {
        v34 = v33;
        id v14 = v33;
        v15 = v50;
      }
      v18 = v52;

      goto LABEL_30;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v58 = 207;
      __int16 v59 = 2080;
      v60 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storytel"
            "ling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
      uint64_t v19 = MEMORY[0x1E4F14500];
      goto LABEL_19;
    }
  }
  id v14 = (id)MEMORY[0x1E4F1CC08];
LABEL_30:

LABEL_31:
LABEL_32:

LABEL_33:

  return v14;
}

- (id)_buildPropertyCacheForPhotoLibrary:(id)a3 loggingConnection:(id)a4 progressReporter:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v8 childProgressReporterFromStart:0.0 toEnd:0.3];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12 = [(id)objc_opt_class() _fetchLibrarySummaryForPhotoLibrary:v9 loggingConnection:v7 progressReporter:v10];

  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F563D0]];
  uint64_t v13 = [(id)objc_opt_class() _fetchDemographicsSummaryWithLoggingConnection:v7];
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F563C0]];

  if ([v8 isCancelledWithProgress:0.6])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v19 = 67109378;
      int v20 = 164;
      __int16 v21 = 2080;
      double v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storytel"
            "ling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
      id v14 = MEMORY[0x1E4F14500];
LABEL_7:
      _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v19, 0x12u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_hasAppleMusicSubscriptionWithLoggingConnection:", v7));
  [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F56540]];

  if ([v8 isCancelledWithProgress:1.0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v19 = 67109378;
      int v20 = 167;
      __int16 v21 = 2080;
      double v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Framework/Storytel"
            "ling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
      id v14 = MEMORY[0x1E4F14500];
      goto LABEL_7;
    }
LABEL_8:
    id v16 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_10;
  }
  uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
  [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F563C8]];

  id v16 = v11;
LABEL_10:

  return v16;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHACachingCPAnalyticsPropertiesTask timeoutFatal:]", "PHACachingCPAnalyticsPropertiesTask.m", 148, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHACachingCPAnalyticsPropertiesTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (![v10 isCancelledWithProgress:0.0])
  {
    v12 = os_log_create("com.apple.PhotosGraph", "metrics");
    os_signpost_id_t v13 = os_signpost_id_generate(v12);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    id v14 = v12;
    v15 = v14;
    unint64_t v16 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CacheCPAnalyticsProperties", "", buf, 2u);
    }

    uint64_t v17 = mach_absolute_time();
    v47 = [v10 childProgressReporterFromStart:0.0 toEnd:0.5];
    v49 = -[PHACachingCPAnalyticsPropertiesTask _buildPropertyCacheForPhotoLibrary:loggingConnection:progressReporter:](self, "_buildPropertyCacheForPhotoLibrary:loggingConnection:progressReporter:", v9, v15);
    v18 = [v9 urlForApplicationDataFolderIdentifier:9];
    uint64_t v19 = *MEMORY[0x1E4F565B8];
    int v20 = [NSString stringWithFormat:@"temp-%@", *MEMORY[0x1E4F565B8]];
    v48 = v18;
    __int16 v21 = [v18 URLByAppendingPathComponent:v20];

    if (!v21)
    {
      uint64_t v23 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      double v26 = v15;
      double v27 = v26;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D21F2000, v27, OS_SIGNPOST_INTERVAL_END, v13, "CacheCPAnalyticsProperties", "", buf, 2u);
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v54 = "CacheCPAnalyticsProperties";
        *(_WORD *)&v54[8] = 2048;
        *(double *)&v54[10] = (float)((float)((float)((float)(v23 - v17) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D21F2000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v27, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] CPAnalytics TemporaryCacheFile URL is nil", buf, 2u);
      }
      if (a6)
      {
        double v22 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 9);
        goto LABEL_26;
      }
LABEL_27:
      char v11 = 0;
      goto LABEL_76;
    }
    if ([v10 isCancelledWithProgress:0.6])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v54 = 112;
        *(_WORD *)&v54[4] = 2080;
        *(void *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/F"
                             "ramework/Storytelling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
        _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a6 && !*a6)
      {
        double v22 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
LABEL_26:
        char v11 = 0;
        *a6 = v22;
LABEL_76:

        goto LABEL_77;
      }
      goto LABEL_27;
    }
    id v51 = 0;
    BOOL v46 = v21;
    char v28 = [v49 writeToURL:v21 error:&v51];
    id v29 = v51;
    if (v28)
    {
      if ([v10 isCancelledWithProgress:0.7])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v54 = 125;
          *(_WORD *)&v54[4] = 2080;
          *(void *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis"
                               "/Framework/Storytelling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
          _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v30 = v29;
        if (a6)
        {
          __int16 v21 = v46;
          if (*a6)
          {
            char v11 = 0;
          }
          else
          {
            [MEMORY[0x1E4F71EB8] errorForCode:-4];
            char v11 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_75;
        }
        char v11 = 0;
        goto LABEL_71;
      }
      uint64_t v36 = [v48 URLByAppendingPathComponent:v19];
      v37 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v50 = v29;
      v45 = (void *)v36;
      LOBYTE(v36) = [v37 replaceItemAtURL:v36 withItemAtURL:v46 backupItemName:0 options:1 resultingItemURL:0 error:&v50];
      id v44 = v50;

      float v38 = (float)((float)((float)(mach_absolute_time() - v17) * (float)info.numer) / (float)info.denom) / 1000000.0;
      v39 = v15;
      v40 = v39;
      if (v36)
      {
        if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D21F2000, v40, OS_SIGNPOST_INTERVAL_END, v13, "CacheCPAnalyticsProperties", "", buf, 2u);
        }

        id v30 = v44;
        __int16 v21 = v46;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v54 = "CacheCPAnalyticsProperties";
          *(_WORD *)&v54[8] = 2048;
          *(double *)&v54[10] = v38;
          _os_log_impl(&dword_1D21F2000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v40, OS_LOG_TYPE_INFO, "[PHACachingCPAnalyticsPropertiesTask] Successfully cached CPAnalytics system properties", buf, 2u);
        }
        int v41 = [v10 isCancelledWithProgress:1.0];
        if (v41)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v54 = 142;
            *(_WORD *)&v54[4] = 2080;
            *(void *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalys"
                                 "is/Framework/Storytelling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
            _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          if (a6 && !*a6)
          {
            *a6 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
          }
        }
        char v11 = v41 ^ 1;
        v42 = v45;
        goto LABEL_74;
      }
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D21F2000, v40, OS_SIGNPOST_INTERVAL_END, v13, "CacheCPAnalyticsProperties", "", buf, 2u);
      }

      id v30 = v44;
      v42 = v45;
      __int16 v21 = v46;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v54 = "CacheCPAnalyticsProperties";
        *(_WORD *)&v54[8] = 2048;
        *(double *)&v54[10] = v38;
        _os_log_impl(&dword_1D21F2000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v54 = v46;
        *(_WORD *)&v54[8] = 2112;
        *(void *)&v54[10] = v45;
        __int16 v55 = 2112;
        id v56 = v44;
        _os_log_error_impl(&dword_1D21F2000, v40, OS_LOG_TYPE_ERROR, "[PHACachingCPAnalyticsPropertiesTask] Failed replacing %@ to %@, error: %@", buf, 0x20u);
        if (a6) {
          goto LABEL_66;
        }
      }
      else if (a6)
      {
LABEL_66:
        char v11 = 0;
        *a6 = v44;
LABEL_74:

        goto LABEL_75;
      }
      char v11 = 0;
      goto LABEL_74;
    }
    uint64_t v31 = mach_absolute_time();
    uint32_t v33 = info.numer;
    uint32_t v32 = info.denom;
    v34 = v15;
    v35 = v34;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v35, OS_SIGNPOST_INTERVAL_END, v13, "CacheCPAnalyticsProperties", "", buf, 2u);
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v54 = "CacheCPAnalyticsProperties";
      *(_WORD *)&v54[8] = 2048;
      *(double *)&v54[10] = (float)((float)((float)((float)(v31 - v17) * (float)v33) / (float)v32) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v54 = v29;
      _os_log_error_impl(&dword_1D21F2000, v35, OS_LOG_TYPE_ERROR, "[PHACachingCPAnalyticsPropertiesTask] Failed writing cached CPAnalytics properties, error: %@", buf, 0xCu);
      if (a6) {
        goto LABEL_43;
      }
    }
    else if (a6)
    {
LABEL_43:
      id v30 = v29;
      char v11 = 0;
      *a6 = v30;
LABEL_71:
      __int16 v21 = v46;
LABEL_75:

      goto LABEL_76;
    }
    char v11 = 0;
    id v30 = v29;
    goto LABEL_71;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v54 = 92;
    *(_WORD *)&v54[4] = 2080;
    *(void *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Frame"
                         "work/Storytelling/Tasks/AnalyticsTasks/PHACachingCPAnalyticsPropertiesTask.m";
    _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  if (a6 && !*a6)
  {
    [MEMORY[0x1E4F71EB8] errorForCode:-4];
    char v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v11 = 0;
  }
LABEL_77:

  return v11;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 workingContext];
  char v11 = [v10 photoLibrary];
  v12 = [v9 analytics];

  LOBYTE(a5) = [(PHACachingCPAnalyticsPropertiesTask *)self runWithPhotoLibrary:v11 analytics:v12 progressReporter:v8 error:a5];
  return (char)a5;
}

- (BOOL)shouldRunWithPhotoLibrary:(id)a3
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v4 = [a3 photoLibrary];
  LOBYTE(self) = [(PHACachingCPAnalyticsPropertiesTask *)self shouldRunWithPhotoLibrary:v4];

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
  return (NSString *)@"PHACachingCPAnalyticsPropertiesTask";
}

@end