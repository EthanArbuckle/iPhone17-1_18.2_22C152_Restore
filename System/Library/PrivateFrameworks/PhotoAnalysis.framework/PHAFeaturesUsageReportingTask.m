@interface PHAFeaturesUsageReportingTask
+ (BOOL)shouldReportSettingsWithLoggingConnection:(id)a3;
+ (id)_dateFormatter;
+ (unsigned)_valueForSetting:(__CFString *)a3 withDefaultValue:(unsigned __int8)a4;
+ (void)_reportAlchemistSettings:(id)a3;
+ (void)_reportCameraSharingSettingsWithPhotoLibrary:(id)a3 andAnalytics:(id)a4;
+ (void)_reportSettings:(id)a3;
+ (void)updateLastReportSettings;
- (BOOL)currentPlatformIsSupported;
- (BOOL)recordFeatureUsageFromCounts:(id)a3 forPhotoLibrary:(id)a4 loggingConnection:(id)a5 error:(id *)a6;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (BOOL)shouldRunWithPhotoLibrary:(id)a3;
- (NSString)name;
- (double)period;
- (id)_libraryScopedWorkerFeaturesUsageForLibrary:(id)a3 loggingConnection:(id)a4 error:(id *)a5;
- (id)_libraryScopedWorkerFeaturesUsageURLForPhotoLibrary:(id)a3;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAFeaturesUsageReportingTask

+ (unsigned)_valueForSetting:(__CFString *)a3 withDefaultValue:(unsigned __int8)a4
{
  Boolean keyExistsAndHasValidFormat = 0;
  unsigned __int8 result = CFPreferencesGetAppBooleanValue(a3, @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return a4;
  }
  return result;
}

+ (void)_reportSettings:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(a1, "_valueForSetting:withDefaultValue:", @"shouldModulateImages", 1));
  [v7 setObject:v6 forKeyedSubscript:@"view_full_hdr"];

  [v5 sendEvent:@"com.apple.photos.settings" withPayload:v7];
}

+ (void)_reportCameraSharingSettingsWithPhotoLibrary:(id)a3 andAnalytics:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 librarySpecificFetchOptions];
  v8 = [MEMORY[0x1E4F39110] fetchActiveLibraryScopeWithOptions:v7];
  v9 = [v8 firstObject];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    Boolean keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(@"CameraSharingEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat)|| !keyExistsAndHasValidFormat)
    {
      if (CFPreferencesGetAppBooleanValue(@"CameraAutoShareEnabled", @"com.apple.mobileslideshow", 0)) {
        v11 = @"auto";
      }
      else {
        v11 = @"manual";
      }
      [v10 setObject:v11 forKeyedSubscript:@"mode"];
      v12 = [NSNumber numberWithBool:CFPreferencesGetAppBooleanValue(@"CameraShareFromHomeEnabled", @"com.apple.mobileslideshow", 0) != 0];
      [v10 setObject:v12 forKeyedSubscript:@"home"];
    }
    else
    {
      [v10 setObject:@"disabled" forKeyedSubscript:@"mode"];
    }
    v13 = [v5 librarySpecificFetchOptions];
    [v13 setShouldPrefetchCount:1];
    v14 = [MEMORY[0x1E4F392E8] fetchParticipantsInShare:v9 options:v13];
    uint64_t v15 = [v14 count];

    v16 = [NSNumber numberWithUnsignedInteger:v15];
    [v10 setObject:v16 forKeyedSubscript:@"participantsCount"];

    [v6 sendEvent:@"com.apple.photos.cpa.camera_sharing" withPayload:v10];
  }
}

+ (void)_reportAlchemistSettings:(id)a3
{
  id v3 = a3;
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  Boolean keyExistsAndHasValidFormat = 0;
  if (!CFPreferencesGetAppBooleanValue(@"EnableAlchemizeButton", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat))[v3 sendEvent:@"com.apple.photos.alchemist.disabled" withPayload:MEMORY[0x1E4F1CC08]]; {
}
  }

+ (void)updateLastReportSettings
{
  v2 = (void *)MEMORY[0x1E4F76C68];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [v2 components:8 fromDate:v3];
  uint64_t v5 = [v4 month];

  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 setInteger:v5 forKey:@"PHALastSettingsReportMonth"];
  [v6 synchronize];
}

+ (BOOL)shouldReportSettingsWithLoggingConnection:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F76C68];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v4 components:24 fromDate:v5];

  uint64_t v7 = [v6 day];
  if (v7 < 15)
  {
    uint64_t v13 = [v6 month];
    v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v15 = [v14 integerForKey:@"PHALastSettingsReportMonth"];

    if (v13 != v15)
    {
      BOOL v9 = 1;
      goto LABEL_9;
    }
    BOOL v9 = 0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67109120;
      int v18 = v13;
      id v10 = "[PHAFeaturesUsageReportingTask] skip settings - already sent this month: %d";
      v11 = v3;
      uint32_t v12 = 8;
      goto LABEL_7;
    }
  }
  else
  {
    int v8 = v7;
    BOOL v9 = 0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 67109376;
      int v18 = v8;
      __int16 v19 = 1024;
      int v20 = 14;
      id v10 = "[PHAFeaturesUsageReportingTask] skip settings - day of the month %d > %d";
      v11 = v3;
      uint32_t v12 = 14;
LABEL_7:
      _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
      BOOL v9 = 0;
    }
  }
LABEL_9:

  return v9;
}

+ (id)_dateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setTimeStyle:0];
  [v2 setDateStyle:0];
  [v2 setDateFormat:@"yyyy-MM-dd"];
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:@"en_US_POSIX"];
  [v2 setCalendar:v4];

  return v2;
}

- (id)_libraryScopedWorkerFeaturesUsageURLForPhotoLibrary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 urlForApplicationDataFolderIdentifier:1];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:0];
  }
  else
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_1563);
    }
    id v6 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_error_impl(&dword_1D21F2000, v6, OS_LOG_TYPE_ERROR, "Error: no persistentStorageDirectoryURL photoLibrary = %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = [v4 URLByAppendingPathComponent:@"PhotoAnalysisServiceFeaturesAnalytics.plist"];

  return v7;
}

uint64_t __85__PHAFeaturesUsageReportingTask__libraryScopedWorkerFeaturesUsageURLForPhotoLibrary___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

- (id)_libraryScopedWorkerFeaturesUsageForLibrary:(id)a3 loggingConnection:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v8 = a4;
  int v9 = [(PHAFeaturesUsageReportingTask *)self _libraryScopedWorkerFeaturesUsageURLForPhotoLibrary:a3];
  if (v9)
  {
    id v14 = 0;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v9 error:&v14];
    id v11 = v14;
    if ([v11 code] == 260)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v10;
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_DEFAULT, "[PHAFeaturesUsageReportingTask] Cannot find feature usage file at path %@, error: %@", buf, 0x16u);
      }
      id v12 = (id)MEMORY[0x1E4F1CC08];
    }
    else
    {
      if (a5) {
        *a5 = v11;
      }
      id v12 = v10;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)recordFeatureUsageFromCounts:(id)a3 forPhotoLibrary:(id)a4 loggingConnection:(id)a5 error:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  oslog = a5;
  if ([v10 count])
  {
    id v12 = [(PHAFeaturesUsageReportingTask *)self _libraryScopedWorkerFeaturesUsageURLForPhotoLibrary:v11];
    if (v12)
    {
      uint64_t v13 = [(id)objc_opt_class() _dateFormatter];
      id v14 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v15 = [v13 stringFromDate:v14];

      v50 = (void *)v15;
      v48 = [v13 dateFromString:v15];
      if (v48)
      {
        v16 = [(PHAFeaturesUsageReportingTask *)self _libraryScopedWorkerFeaturesUsageForLibrary:v11 loggingConnection:oslog error:0];
        __int16 v17 = [v16 objectForKeyedSubscript:@"firstSeenDates_V2"];
        id v18 = [v16 objectForKeyedSubscript:@"lastSeenDates_v2"];
        if (v17) {
          uint64_t v19 = [v17 mutableCopy];
        }
        else {
          uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v16, "count"));
        }
        uint64_t v21 = (void *)v19;
        if (v18) {
          uint64_t v22 = [v18 mutableCopy];
        }
        else {
          uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v16, "count"));
        }
        v49 = (void *)v22;
        if (v21 && v22)
        {
          v46 = v18;
          v47 = v17;
          v43 = v16;
          v44 = v12;
          v41 = a6;
          id v42 = v10;
          id v45 = v11;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v23 = v10;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v60 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v53;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v53 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                v29 = [v21 objectForKeyedSubscript:v28];
                v30 = [v13 dateFromString:v29];

                if (!v30 || ([v30 timeIntervalSinceDate:v48], v31 > 0.0))
                {
                  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v59 = v28;
                    _os_log_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_INFO, "Feature [%@] - set first seen", buf, 0xCu);
                  }
                  [v21 setObject:v50 forKeyedSubscript:v28];
                }
                v32 = [v23 objectForKeyedSubscript:v28];
                uint64_t v33 = [v32 integerValue];

                if (v33 >= 1)
                {
                  v34 = [v49 objectForKeyedSubscript:v28];
                  v35 = [v13 dateFromString:v34];

                  if (!v35 || ([v35 timeIntervalSinceDate:v48], v36 != 0.0))
                  {
                    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v59 = v28;
                      _os_log_debug_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_DEBUG, "Feature [%@] - set last seen", buf, 0xCu);
                    }
                    [v49 setObject:v50 forKeyedSubscript:v28];
                  }
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v52 objects:v60 count:16];
            }
            while (v25);
          }

          __int16 v17 = v47;
          id v18 = v46;
          if ([v47 isEqualToDictionary:v21]
            && ([v46 isEqualToDictionary:v49] & 1) != 0)
          {
            char v20 = 1;
            id v10 = v42;
            id v12 = v44;
            id v11 = v45;
          }
          else
          {
            v56[0] = @"firstSeenDates_V2";
            v56[1] = @"lastSeenDates_v2";
            v57[0] = v21;
            v57[1] = v49;
            v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
            v38 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v37 format:100 options:0 error:v41];
            v39 = v38;
            id v12 = v44;
            id v11 = v45;
            if (v38) {
              char v20 = [v38 writeToURL:v44 options:1073741825 error:v41];
            }
            else {
              char v20 = 0;
            }
            id v10 = v42;
          }
          v16 = v43;
        }
        else if (a6)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, @"Update feature usage - first or last seen dates are nil");
          char v20 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          char v20 = 0;
        }
      }
      else if (a6)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 1, @"Update feature usage - today's day is nil");
        char v20 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v20 = 0;
      }
    }
    else if (a6)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 9, @"Update feature usage - featuresURL is nil");
      char v20 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 1;
  }

  return v20;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAFeaturesUsageReportingTask timeoutFatal:]", "PHAFeaturesUsageReportingTask.m", 268, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAFeaturesUsageReportingTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  v105[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = os_log_create("com.apple.PhotosGraph", "metrics");
  if ([v10 isSystemPhotoLibrary]
    && [(id)objc_opt_class() shouldReportSettingsWithLoggingConnection:v13])
  {
    v104 = @"featured_content_allowed";
    id v14 = [NSNumber numberWithBool:PLIsFeaturedContentAllowed()];
    v105[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:&v104 count:1];
    [v11 sendEvent:@"com.apple.photos.cpa.featured_content" withPayload:v15];

    [(id)objc_opt_class() _reportCameraSharingSettingsWithPhotoLibrary:v10 andAnalytics:v11];
    [(id)objc_opt_class() _reportSettings:v11];
    [(id)objc_opt_class() updateLastReportSettings];
  }
  v16 = [(PHAFeaturesUsageReportingTask *)self _libraryScopedWorkerFeaturesUsageForLibrary:v10 loggingConnection:v13 error:a6];
  __int16 v17 = v16;
  if (v16)
  {
    if ([v16 count])
    {
      id v18 = [(id)objc_opt_class() _dateFormatter];
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v20 = [v18 stringFromDate:v19];

      v66 = (void *)v20;
      v78 = [v18 dateFromString:v20];
      uint64_t v21 = [v17 objectForKeyedSubscript:@"firstSeenDates_V2"];
      v68 = v17;
      uint64_t v79 = [v17 objectForKeyedSubscript:@"lastSeenDates_v2"];
      id v22 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v77 = v21;
      id v23 = [v21 allKeys];
      uint64_t v24 = (void *)[v22 initWithArray:v23];

      v67 = v24;
      if ([v24 count])
      {
        v63 = a6;
        objc_msgSend(v24, "pha_shuffle");
        uint64_t v25 = v24;
        unint64_t v26 = [v24 count];
        v74 = v11;
        v27 = [v11 systemProperties];
        uint64_t v65 = *MEMORY[0x1E4F56540];
        v69 = objc_msgSend(v27, "propertyForKey:forEventName:payloadForSystemPropertyExtraction:");

        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id obj = v25;
        uint64_t v28 = (void *)v79;
        uint64_t v83 = [obj countByEnumeratingWithState:&v85 objects:v103 count:16];
        if (v83)
        {
          uint64_t v75 = 0;
          double v30 = 1.0 / (double)v26;
          uint64_t v82 = *(void *)v86;
          double v31 = 0.0;
          *(void *)&long long v29 = 138412546;
          long long v62 = v29;
          id v64 = v10;
          v71 = v13;
          id v72 = v12;
          v70 = v18;
LABEL_9:
          uint64_t v32 = 0;
          uint64_t v33 = v77;
          while (1)
          {
            if (*(void *)v86 != v82) {
              objc_enumerationMutation(obj);
            }
            v34 = *(void **)(*((void *)&v85 + 1) + 8 * v32);
            if (objc_msgSend(v12, "isCancelledWithProgress:", v31, v62))
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v90 = 174;
                *(_WORD *)&v90[4] = 2080;
                *(void *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAn"
                                     "alysis/Framework/Storytelling/Tasks/AnalyticsTasks/PHAFeaturesUsageReportingTask.m";
                _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              id v10 = v64;
              id v11 = v74;
              uint64_t v59 = v66;
              if (v63 && !*v63)
              {
                id *v63 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
              }

              BOOL v60 = 0;
              goto LABEL_71;
            }
            v35 = [v33 objectForKeyedSubscript:v34];
            double v36 = [v28 objectForKeyedSubscript:v34];
            if (!v35)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v90 = v34;
                _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - skip reporting, missing first seen date", buf, 0xCu);
              }
              goto LABEL_51;
            }
            v84 = [v18 dateFromString:v35];
            if (!v84)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v90 = v34;
                _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - skip reporting, first seen date format is invalid", buf, 0xCu);
              }
              goto LABEL_50;
            }
            if (v36)
            {
              uint64_t v37 = [v18 dateFromString:v36];
              if (!v37)
              {
                if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v90 = v34;
                  _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - skip reporting, last seen date format is invalid", buf, 0xCu);
                }
                v38 = 0;
                goto LABEL_49;
              }
            }
            else
            {
              uint64_t v37 = [MEMORY[0x1E4F1C9C8] distantPast];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v90 = v34;
                _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - no last seen date, using distant past", buf, 0xCu);
              }
            }
            [v78 timeIntervalSinceDate:v84];
            double v40 = v39 / 86400.0;
            v80 = (void *)v37;
            [v78 timeIntervalSinceDate:v37];
            double v42 = v41;
            int v43 = [v34 hasPrefix:@"com.apple.photos.cpa.active_user_feature."];
            if (v43) {
              break;
            }
            if (PFOSVariantHasInternalDiagnostics()) {
              double v58 = 7.0;
            }
            else {
              double v58 = 30.0;
            }
            if (v40 <= v58)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v62;
                *(void *)v90 = v34;
                *(_WORD *)&v90[8] = 2048;
                *(double *)&v90[10] = v58;
                _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature: [%@] - skip generic active_user_feature event, not seen for %f days", buf, 0x16u);
              }
            }
            else if (v75 <= 9)
            {
              break;
            }
            uint64_t v28 = (void *)v79;
LABEL_48:
            v38 = v80;
LABEL_49:

LABEL_50:
LABEL_51:
            double v31 = v30 + v31;

            if (v83 == ++v32)
            {
              id v10 = v64;
              uint64_t v83 = [obj countByEnumeratingWithState:&v85 objects:v103 count:16];
              if (v83) {
                goto LABEL_9;
              }
              goto LABEL_53;
            }
          }
          int v76 = v43;
          double v44 = v42 / 86400.0;
          id v45 = [NSNumber numberWithDouble:v40 / 7.0];
          uint64_t v46 = [v45 integerValue];

          v47 = [NSNumber numberWithDouble:v40 / 30.0];
          uint64_t v48 = [v47 integerValue];

          id v49 = objc_alloc(MEMORY[0x1E4F1CA60]);
          v102[0] = v34;
          v101[0] = @"cpa_feature_name";
          v101[1] = @"cpa_feature_daily";
          v50 = [NSNumber numberWithBool:v44 <= 1.0];
          v102[1] = v50;
          v101[2] = @"cpa_feature_total_weeks";
          v51 = [NSNumber numberWithInteger:v46];
          v102[2] = v51;
          v101[3] = @"cpa_feature_total_months";
          uint64_t v73 = v48;
          long long v52 = [NSNumber numberWithInteger:v48];
          v102[3] = v52;
          long long v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:4];
          long long v54 = (void *)[v49 initWithDictionary:v53];

          if (v40 >= 7.0)
          {
            long long v55 = [NSNumber numberWithBool:v44 <= 7.0];
            [v54 setObject:v55 forKeyedSubscript:@"cpa_feature_weekly"];
          }
          uint64_t v13 = v71;
          if (v40 >= 30.0)
          {
            v56 = [NSNumber numberWithBool:v44 <= 30.0];
            [v54 setObject:v56 forKeyedSubscript:@"cpa_feature_monthly"];
          }
          id v12 = v72;
          uint64_t v33 = v77;
          if (v76)
          {
            v57 = [v34 substringFromIndex:objc_msgSend(@"com.apple.photos.cpa.active_user_feature.", "length")];
            [v54 setObject:v57 forKeyedSubscript:@"cpa_feature_name"];

            [v54 setObject:v69 forKeyedSubscript:v65];
            [v74 sendEvent:v34 withPayload:v54];
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v90 = v34;
              _os_log_impl(&dword_1D21F2000, v71, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - report dedicated active_user_feature event", buf, 0xCu);
            }
            uint64_t v28 = (void *)v79;
          }
          else
          {
            [v74 sendEvent:@"com.apple.photos.cpa.active_user_feature" withPayload:v54];
            uint64_t v28 = (void *)v79;
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413826;
              *(void *)v90 = v34;
              *(_WORD *)&v90[8] = 2048;
              *(double *)&v90[10] = v40;
              __int16 v91 = 2048;
              double v92 = v44;
              __int16 v93 = 1024;
              BOOL v94 = v44 <= 1.0;
              __int16 v95 = 1024;
              BOOL v96 = v44 <= 7.0;
              __int16 v97 = 1024;
              BOOL v98 = v44 <= 30.0;
              __int16 v99 = 2048;
              uint64_t v100 = v73;
              _os_log_impl(&dword_1D21F2000, v71, OS_LOG_TYPE_INFO, "[PHAFeaturesUsageReportingTask] Feature [%@] - f[%f], l[%f], reporting: d[%d], w[%d], m[%d], tm[%ld]", buf, 0x3Cu);
            }
            ++v75;
          }

          id v18 = v70;
          goto LABEL_48;
        }
LABEL_53:

        if ([v12 isCancelledWithProgress:1.0])
        {
          uint64_t v59 = v66;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v90 = 262;
            *(_WORD *)&v90[4] = 2080;
            *(void *)&v90[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalys"
                                 "is/Framework/Storytelling/Tasks/AnalyticsTasks/PHAFeaturesUsageReportingTask.m";
            _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v11 = v74;
          if (v63 && !*v63)
          {
            [MEMORY[0x1E4F71EB8] errorForCode:-4];
            BOOL v60 = 0;
            id *v63 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v60 = 0;
          }
          uint64_t v28 = (void *)v79;
        }
        else
        {
          BOOL v60 = 1;
          id v11 = v74;
          uint64_t v59 = v66;
        }
LABEL_71:
      }
      else
      {
        BOOL v60 = 1;
        uint64_t v59 = v66;
        uint64_t v28 = (void *)v79;
      }

      __int16 v17 = v68;
    }
    else
    {
      BOOL v60 = 1;
    }
  }
  else
  {
    BOOL v60 = 0;
  }

  return v60;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 workingContext];
  id v11 = [v10 photoLibrary];
  id v12 = [v9 analytics];

  LOBYTE(a5) = [(PHAFeaturesUsageReportingTask *)self runWithPhotoLibrary:v11 analytics:v12 progressReporter:v8 error:a5];
  return (char)a5;
}

- (BOOL)shouldRunWithPhotoLibrary:(id)a3
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  v4 = [a3 photoLibrary];
  LOBYTE(self) = [(PHAFeaturesUsageReportingTask *)self shouldRunWithPhotoLibrary:v4];

  return (char)self;
}

- (int)priority
{
  return 1;
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
  return (NSString *)@"PHAFeaturesUsageReportingTask";
}

@end