@interface PHAMemoryElectionTask
+ (BOOL)reloadAlbumWidgetTimelineWithLoggingConnection:(id)a3 error:(id *)a4;
+ (BOOL)reloadForYouWidgetTimelineWithLoggingConnection:(id)a3 error:(id *)a4;
+ (id)_filterMemoriesWithAcceptableUserFeedback:(id)a3 allMemoriesFetchResult:(id)a4 photoLibrary:(id)a5;
+ (id)_filterSuggestionsToFeatureBasedOnUserFeedbackForSuggestionsToFeature:(id)a3 sugestionsFetchResult:(id)a4 photoLibrary:(id)a5;
+ (id)_userFeedbackCalculatorWithPhotoLibrary:(id)a3;
+ (void)findAndSetFeaturedStateForMemoriesAndSuggestionsIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4;
+ (void)findMemoriesAndSetFeaturedStateIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4;
+ (void)findMemoriesAndSetNeverFeatureStateIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4;
+ (void)findSuggestionsAndSetFeaturedStateIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4;
+ (void)sendElectedMemoriesPipelineAnalyticsEventWithCountsOfMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5;
+ (void)sendGeneratedMemoriesPipelineAnalyticsEventWithCountsOfMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5;
+ (void)sendMemoryTriggersAnalyticsEventWithElectedMemoryType:(id)a3 triggerType:(id)a4 loggingConnection:(id)a5 analytics:(id)a6;
+ (void)sendNotifiedMemoriesPipelineAnalyticsEventWithMemoryType:(id)a3 loggingConnection:(id)a4 analytics:(id)a5;
+ (void)sendTriggeredMemoriesPipelineAnalyticsEventWithCountsOfMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5;
- (BOOL)createTransientMemories;
- (BOOL)currentPlatformIsSupported;
- (BOOL)featureAvailable;
- (BOOL)forceNotification;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (BOOL)userInitiated;
- (CLLocation)location;
- (NSDate)universalDate;
- (NSString)name;
- (NSString)requestedUniqueMemoryIdentifier;
- (PGFeature)requestedFeature;
- (PHAMemoryElectionTask)init;
- (double)period;
- (id)_electorConfigurationForExistingMemories:(id)a3 graphManager:(id)a4 loggingConnection:(id)a5;
- (id)_recentlySuggestedMoodsFromExistingMemoriesSortedByCreationDate:(id)a3;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (unint64_t)featureCode;
- (unint64_t)requestedCategory;
- (unint64_t)requestedTriggerType;
- (void)collectMetricsOnElectedEnrichedMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5;
- (void)collectMetricsOnExistingMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5;
- (void)collectMetricsOnMemoriesInGraphWithWorkingContext:(id)a3 loggingConnection:(id)a4 analytics:(id)a5;
- (void)handleNotificationsForMemories:(id)a3 graphManager:(id)a4 userFeedbackCalculator:(id)a5 loggingConnection:(id)a6;
- (void)runWithGraphManager:(id)a3 progressReporter:(id)a4 reply:(id)a5;
- (void)setCreateTransientMemories:(BOOL)a3;
- (void)setForceNotification:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setRequestedCategory:(unint64_t)a3;
- (void)setRequestedFeature:(id)a3;
- (void)setRequestedTriggerType:(unint64_t)a3;
- (void)setRequestedUniqueMemoryIdentifier:(id)a3;
- (void)setUniversalDate:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAMemoryElectionTask

- (void)handleNotificationsForMemories:(id)a3 graphManager:(id)a4 userFeedbackCalculator:(id)a5 loggingConnection:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = a6;
  if ([MEMORY[0x1E4F8D968] isMemoriesNotificationDisabled])
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v14 = "[PHAMemoryElectionTask] Not firing memories notification: disabled in settings";
LABEL_11:
      _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, v14, buf, 2u);
    }
  }
  else if (PLIsFeaturedContentAllowed())
  {
    id v30 = objc_alloc_init(MEMORY[0x1E4F8D8D0]);
    id v31 = v11;
    if (([v30 BOOLValueForKey:@"com.apple.photos.graphservice.forcedailynotifications" withFallbackValue:0] & 1) != 0|| -[PHAMemoryElectionTask forceNotification](self, "forceNotification"))
    {
      char v15 = 1;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v39 = 1;
        _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] Memory notifications will be forced: %d", buf, 8u);
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] Handling notifications for memories", buf, 2u);
      }
      char v15 = 0;
    }
    char v29 = v15;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v10;
    id v18 = v10;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v24 = NSNumber;
          [v23 score];
          v25 = objc_msgSend(v24, "numberWithDouble:");
          [v16 addObject:v25];

          v26 = [v23 localIdentifier];
          [v17 addObject:v26];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v20);
    }

    id v11 = v31;
    v27 = [[PHANotificationController alloc] initWithGraphManager:v31 userFeedbackCalculator:v12];
    v28 = v27;
    if ((v29 & 1) != 0
      || [(PHANotificationController *)v27 shouldFireNotificationForMemoriesWithScores:v16 withCreationReason:2])
    {
      [(PHANotificationController *)v28 fireNotificationForMemoryIdentifiers:v17 withCreationReason:2];
    }

    id v10 = v32;
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v14 = "[PHAMemoryElectionTask] Not firing memories notification: featured content is disabled in settings";
    goto LABEL_11;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedUniqueMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedFeature, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_universalDate, 0);
}

- (unint64_t)featureCode
{
  return self->_featureCode;
}

- (BOOL)featureAvailable
{
  return self->_featureAvailable;
}

- (void)setRequestedUniqueMemoryIdentifier:(id)a3
{
}

- (NSString)requestedUniqueMemoryIdentifier
{
  return self->_requestedUniqueMemoryIdentifier;
}

- (void)setRequestedFeature:(id)a3
{
}

- (PGFeature)requestedFeature
{
  return self->_requestedFeature;
}

- (void)setRequestedTriggerType:(unint64_t)a3
{
  self->_requestedTriggerType = a3;
}

- (unint64_t)requestedTriggerType
{
  return self->_requestedTriggerType;
}

- (void)setRequestedCategory:(unint64_t)a3
{
  self->_requestedCategory = a3;
}

- (unint64_t)requestedCategory
{
  return self->_requestedCategory;
}

- (void)setForceNotification:(BOOL)a3
{
  self->_forceNotification = a3;
}

- (BOOL)forceNotification
{
  return self->_forceNotification;
}

- (void)setCreateTransientMemories:(BOOL)a3
{
  self->_createTransientMemories = a3;
}

- (BOOL)createTransientMemories
{
  return self->_createTransientMemories;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setUniversalDate:(id)a3
{
}

- (NSDate)universalDate
{
  return self->_universalDate;
}

- (id)_electorConfigurationForExistingMemories:(id)a3 graphManager:(id)a4 loggingConnection:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F8D790]);
  [v11 setRequestedMemoryCategory:self->_requestedCategory];
  [v11 setRequestedTriggerType:self->_requestedTriggerType];
  if (self->_requestedFeature) {
    objc_msgSend(v11, "setRequestedFeature:");
  }
  if (self->_requestedUniqueMemoryIdentifier) {
    objc_msgSend(v11, "setRequestedUniqueMemoryIdentifier:");
  }
  if (self->_universalDate)
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F76C68], "localDateFromUniversalDate:");
    [v11 setLocalDate:v12];
  }
  if (self->_location)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F76C68], "timeZoneFromLocation:");
    [v11 setTimeZone:v13];
  }
  [v11 setShouldPersist:0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F8D8D0]) initWithTrialNamespace:1 onDiskResourceFile:0];
  uint64_t v15 = [v14 longValueForKey:@"com.apple.photos.memories.election.minimumTargetNumberOfMemories" withFallbackValue:3];
  uint64_t v16 = [v14 longValueForKey:@"com.apple.photos.memories.election.maximumTargetNumberOfMemories" withFallbackValue:5];
  uint64_t v17 = [v14 BOOLValueForKey:@"com.apple.photos.memories.election.useMaximumTargetNumberOfMemories" withFallbackValue:0];
  [v11 setMinimumTargetNumberOfMemories:v15];
  [v11 setMaximumTargetNumberOfMemories:v16];
  [v11 setUseMaximumTargetNumberOfMemories:v17];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v24 = 134217984;
    uint64_t v25 = v15;
    _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] ElectionConfiguration: minimumTargetNumberOfMemories:%lu", (uint8_t *)&v24, 0xCu);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v24 = 134217984;
    uint64_t v25 = v16;
    _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] ElectionConfiguration: maximumTargetNumberOfMemories:%lu", (uint8_t *)&v24, 0xCu);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v24 = 67109120;
    LODWORD(v25) = v17;
    _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] ElectionConfiguration: useMaximumTargetNumberOfMemories:%d", (uint8_t *)&v24, 8u);
  }
  if (self->_requestedCategory)
  {
    id v18 = [[PHASuggestionController alloc] initWithGraphManager:v9];
    id v19 = objc_alloc_init(MEMORY[0x1E4F8D920]);
    uint64_t v20 = [MEMORY[0x1E4F76C68] localDateFromUniversalDate:self->_universalDate];
    [v19 setLocalToday:v20];

    [v19 setDefaultStartAndEndDatesIfNeeded];
    [(PHASuggestionController *)v18 ingestExistingSuggestionsWithOptions:v19];
    uint64_t v21 = [(PHASuggestionController *)v18 collidableSuggestionsWithOptions:v19];
    [v11 setCollidableSuggestions:v21];
  }
  v22 = [(PHAMemoryElectionTask *)self _recentlySuggestedMoodsFromExistingMemoriesSortedByCreationDate:v8];
  [v11 setMoodHistory:v22];

  return v11;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAMemoryElectionTask timeoutFatal:]", "PHAMemoryElectionTask.m", 353, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAMemoryElectionTask is stuck", v3, 2u);
  }
}

- (id)_recentlySuggestedMoodsFromExistingMemoriesSortedByCreationDate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = objc_msgSend(v3, "reverseObjectEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      if ((unint64_t)[v4 count] > 9) {
        break;
      }
      if ([v10 pendingState] != 1)
      {
        id v11 = [v10 photosGraphProperties];
        id v12 = v11;
        if (v11)
        {
          v13 = [v11 objectForKeyedSubscript:@"suggestedMood"];
          uint64_t v14 = PHMemoryMoodForString();

          if (v14 != 16)
          {
            uint64_t v15 = [NSNumber numberWithUnsignedLongLong:v14];
            [v4 addObject:v15];
          }
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

- (void)runWithGraphManager:(id)a3 progressReporter:(id)a4 reply:(id)a5
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v42 = [v7 analytics];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F71F10]) initWithProgressReporter:v8];
  v44 = [v10 childProgressReporterToCheckpoint:0.25];
  v43 = [v10 childProgressReporterToCheckpoint:0.5];
  v46 = [v10 childProgressReporterToCheckpoint:0.75];
  v45 = [v10 childProgressReporterToCheckpoint:1.0];
  v50 = [v7 workingContextForMemories];
  v49 = [v50 photoLibrary];
  os_log_t oslog = [v50 loggingConnection];
  id v11 = [v49 librarySpecificFetchOptions];
  [v11 setIncludePendingMemories:1];
  id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v91[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:1];
  [v11 setSortDescriptors:v13];

  uint64_t v14 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v11];
  v48 = [v14 fetchedObjects];

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = oslog;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = [v48 count];
    _os_log_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] Found %d existing memories.", buf, 8u);
  }
  if ([v8 isCancelled])
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x1E4F1CC08], 0);
  }
  else
  {
    uint64_t v16 = self;
    BOOL userInitiated = self->_userInitiated;
    if (!userInitiated)
    {
      [(PHAMemoryElectionTask *)self collectMetricsOnExistingMemories:v48 loggingConnection:oslog analytics:v42];
      long long v18 = [v7 workingContext];
      [(PHAMemoryElectionTask *)self collectMetricsOnMemoriesInGraphWithWorkingContext:v18 loggingConnection:oslog analytics:v42];

      uint64_t v16 = self;
    }
    long long v19 = [(PHAMemoryElectionTask *)v16 _electorConfigurationForExistingMemories:v48 graphManager:v7 loggingConnection:oslog];
    *(void *)buf = 0;
    v86 = buf;
    uint64_t v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__2222;
    v89 = __Block_byref_object_dispose__2223;
    id v90 = 0;
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__2222;
    v79 = __Block_byref_object_dispose__2223;
    id v80 = 0;
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    char v74 = 1;
    long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F39338]) initWithPhotoLibrary:v49];
    uint64_t v21 = [v7 workingContext];
    BOOL v22 = !userInitiated;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke;
    v53[3] = &unk_1E6917BA8;
    id v37 = v7;
    id v54 = v37;
    id v23 = v20;
    id v55 = v23;
    id v38 = v19;
    id v56 = v38;
    id v57 = v44;
    id v58 = v8;
    id v39 = v9;
    id v66 = v39;
    v59 = self;
    id v24 = v49;
    id v60 = v24;
    id v61 = v43;
    uint64_t v25 = oslog;
    v62 = v25;
    id v63 = v46;
    v67 = &v75;
    v68 = buf;
    id v64 = v45;
    v69 = &v71;
    id v41 = v40;
    id v65 = v41;
    BOOL v70 = v22;
    [v21 performSynchronousConcurrentGraphReadUsingBlock:v53];

    if (*((unsigned char *)v72 + 24))
    {
      if ([*((id *)v86 + 5) count])
      {
        id v52 = 0;
        BOOL v26 = +[PHAMemoryElectionTask reloadForYouWidgetTimelineWithLoggingConnection:v25 error:&v52];
        id v36 = v52;
        if (!v26 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v83 = 138412290;
          *(void *)v84 = v36;
          _os_log_error_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] Error calling reloadForYouWidgetTimelineWithLoggingConnection (%@)", v83, 0xCu);
        }
        v27 = [v24 librarySpecificFetchOptions];
        [v27 setIncludePendingMemories:1];
        v28 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 localIdentifiers:*((void *)v86 + 5) options:v27];
        char v29 = [v28 fetchedObjects];
        [(PHAMemoryElectionTask *)self handleNotificationsForMemories:v29 graphManager:v37 userFeedbackCalculator:v23 loggingConnection:v25];
      }
      id v30 = v25;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v31 = [v41 count];
        id v32 = [v41 description];
        *(_DWORD *)v83 = 67109378;
        *(_DWORD *)v84 = v31;
        *(_WORD *)&v84[4] = 2112;
        *(void *)&v84[6] = v32;
        _os_log_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_INFO, "Persisted %d memories: %@", v83, 0x12u);
      }
      uint64_t v33 = *((void *)v86 + 5);
      if (!v33) {
        uint64_t v33 = MEMORY[0x1E4F1CBF0];
      }
      v81[0] = @"PHMemoryIdentifiersKey";
      v81[1] = @"PHMemoryDescriptionsKey";
      v82[0] = v33;
      v82[1] = v41;
      long long v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:2];
      (*((void (**)(id, void *, void))v39 + 2))(v39, v34, 0);
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v35 = v76[5];
        *(_DWORD *)v83 = 138412290;
        *(void *)v84 = v35;
        _os_log_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] memoryLocalIdentifiersFromPersistingEnrichedMemories failed (%@)", v83, 0xCu);
      }
      (*((void (**)(id, void, uint64_t))v39 + 2))(v39, 0, v76[5]);
    }

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(&v75, 8);

    _Block_object_dispose(buf, 8);
  }
}

void __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  id v4 = objc_alloc(MEMORY[0x1E4F8D788]);
  v5 = [*(id *)(a1 + 32) workingContext];
  uint64_t v6 = (void *)[v4 initWithWorkingContext:v5 userFeedbackCalculator:*(void *)(a1 + 40)];

  id v7 = (void *)v3;
  id v8 = [v6 generateEnrichedMemoriesWithConfiguration:*(void *)(a1 + 48) graph:v3 progressReporter:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 64) isCancelled])
  {
    (*(void (**)(void))(*(void *)(a1 + 128) + 16))();
  }
  else
  {
    uint64_t v9 = [v8 count];
    uint64_t v10 = v9;
    if (*(unsigned char *)(*(void *)(a1 + 72) + 9)) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v9 == 0;
    }
    if (!v11)
    {
      id v58 = v6;
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F8D7F0]) initForMemoryEnrichment];
      v13 = *(void **)(a1 + 32);
      id v70 = 0;
      uint64_t v14 = [v13 musicCuratorContextWithCurationOptions:v12 error:&v70];
      id v56 = v70;
      uint64_t v15 = v8;
      uint64_t v16 = (void *)MEMORY[0x1E4F8D3C0];
      uint64_t v18 = *(void *)(a1 + 80);
      uint64_t v17 = *(void *)(a1 + 88);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke_2;
      v68[3] = &unk_1E6917B58;
      id v69 = *(id *)(a1 + 96);
      long long v19 = v16;
      id v8 = v15;
      [v19 requestFlexMusicCurationForEnrichedMemories:v15 context:v14 photoLibrary:v18 graph:v3 progressReporter:v17 resultHandler:v68];
      if ([*(id *)(a1 + 64) isCancelled]) {
        goto LABEL_13;
      }
      if (v14)
      {
        long long v20 = (void *)MEMORY[0x1E4F8D3C0];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke_243;
        v66[3] = &unk_1E6917B80;
        uint64_t v21 = *(void *)(a1 + 104);
        id v67 = *(id *)(a1 + 96);
        [v20 requestMusicCurationForEnrichedMemories:v15 context:v14 graph:v3 progressReporter:v21 resultHandler:v66];
      }
      else
      {
        BOOL v22 = *(NSObject **)(a1 + 96);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v53 = *(void **)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          id v73 = v53;
          _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] (MemoriesMusic) Failed to build music curation context with error: %@", buf, 0xCu);
        }
      }
      id v8 = v15;
      if ([*(id *)(a1 + 64) isCancelled])
      {
LABEL_13:
        (*(void (**)(void))(*(void *)(a1 + 128) + 16))();

        uint64_t v6 = v58;
        goto LABEL_49;
      }
      id v23 = (void *)[objc_alloc(MEMORY[0x1E4F8D7B0]) initWithPhotoLibrary:*(void *)(a1 + 80)];
      if (*(unsigned char *)(*(void *)(a1 + 72) + 8))
      {
        uint64_t v24 = 0;
      }
      else if ([MEMORY[0x1E4F8D968] isMemoriesLivingOnFeedbackEnabled])
      {
        uint64_t v25 = *(NSObject **)(a1 + 96);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] Forcing memories to be non pending since user default isMemoriesLivingOnFeedbackEnabled is enabled", buf, 2u);
        }
        uint64_t v24 = 0;
        id v8 = v15;
      }
      else
      {
        uint64_t v24 = 1;
      }
      uint64_t v26 = *(void *)(a1 + 112);
      uint64_t v27 = *(void *)(*(void *)(a1 + 136) + 8);
      id obj = *(id *)(v27 + 40);
      uint64_t v28 = [v23 memoryLocalIdentifiersFromPersistingEnrichedMemories:v8 withPendingState:v24 graph:v3 progressReporter:v26 error:&obj];
      objc_storeStrong((id *)(v27 + 40), obj);
      uint64_t v29 = *(void *)(*(void *)(a1 + 144) + 8);
      id v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 144) + 8)
                                                                              + 40) != 0;
      *(unsigned char *)(*(void *)(a1 + 72) + 11) = *(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24))
      {
        id v54 = v23;
        int v31 = (void *)[objc_alloc(MEMORY[0x1E4F8D7E8]) initWithInflationActionSource:0];
        id v32 = *(void **)(a1 + 32);
        id v64 = 0;
        uint64_t v33 = [v32 musicCurationInflationContextWithInflationOptions:v31 error:&v64];
        id v34 = v64;
        if (v33)
        {
          uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F8D7B0]) initWithPhotoLibrary:*(void *)(a1 + 80)];
          [v35 cacheMusicAudioAndArtworkForEnrichedMemories:v15 inflationContext:v33 photoLibrary:*(void *)(a1 + 80)];
        }
        else
        {
          id v36 = *(NSObject **)(a1 + 96);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v73 = v34;
            _os_log_error_impl(&dword_1D21F2000, v36, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] Failed to generate inflationContextError, error: %{public}@", buf, 0xCu);
          }
        }

        id v23 = v54;
      }

      uint64_t v6 = v58;
      id v8 = v15;
    }
    int v37 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 152) + 8) + 24);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 152) + 8) + 24)) {
      BOOL v38 = v10 == 0;
    }
    else {
      BOOL v38 = 1;
    }
    if (!v38)
    {
      id v57 = v7;
      v59 = v6;
      unint64_t v39 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) count];
      if (!*(unsigned char *)(*(void *)(a1 + 72) + 9) && v39 != [v8 count])
      {
        id v40 = *(NSObject **)(a1 + 96);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D21F2000, v40, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] persistedMemoryLocalIdentifiers.count is expected to be equal to electedEnrichedMemories.count when _createTransientMemories == NO", buf, 2u);
        }
      }
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v55 = v8;
      id v41 = v8;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v60 objects:v71 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = 0;
        uint64_t v45 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v61 != v45) {
              objc_enumerationMutation(v41);
            }
            v47 = [*(id *)(*((void *)&v60 + 1) + 8 * i) enrichedDescription];
            if (v44 + i < v39)
            {
              v48 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) objectAtIndexedSubscript:v44 + i];
              uint64_t v49 = [NSString stringWithFormat:@"%@ - %@", v48, v47];

              v47 = (void *)v49;
            }
            [*(id *)(a1 + 120) addObject:v47];
          }
          v44 += i;
          uint64_t v43 = [v41 countByEnumeratingWithState:&v60 objects:v71 count:16];
        }
        while (v43);
      }

      int v37 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 152) + 8) + 24);
      id v7 = v57;
      uint64_t v6 = v59;
      id v8 = v55;
    }
    if (v37 && *(unsigned char *)(a1 + 160))
    {
      v50 = *(void **)(a1 + 72);
      uint64_t v51 = *(void *)(a1 + 96);
      id v52 = [*(id *)(a1 + 32) analytics];
      [v50 collectMetricsOnElectedEnrichedMemories:v8 loggingConnection:v51 analytics:v52];
    }
  }
LABEL_49:
}

void __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    [v7 setFlexMusicCuration:v8];
  }
  else
  {
    uint64_t v10 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v9;
      _os_log_error_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] (MemoriesMusic) Failed to curate flex music for enriched memory with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke_243(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    [v7 setMusicCuration:v8];
  }
  else
  {
    uint64_t v10 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v9;
      _os_log_error_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] (MemoriesMusic) Failed to curate apple music for enriched memory with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__2222;
  uint64_t v17 = __Block_byref_object_dispose__2223;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_error___block_invoke;
  v12[3] = &unk_1E6917B30;
  v12[4] = &v19;
  v12[5] = &v13;
  [(PHAMemoryElectionTask *)self runWithGraphManager:v8 progressReporter:v9 reply:v12];
  if (a5) {
    *a5 = (id) v14[5];
  }
  char v10 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 != 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v35 = 0;
  int v5 = [v4 isReadyWithError:&v35];
  id v6 = v35;
  if (v5)
  {
    id v7 = [v4 workingContextForMemories];
    id v8 = [v7 photoLibrary];
    id v9 = [v7 loggingConnection];
    if ([MEMORY[0x1E4F8D968] isMemoryElectionDisabled])
    {
      BOOL v10 = 0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v11 = "PHAMemoryElectionTask is disabled via user defaults";
LABEL_19:
        _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
        BOOL v10 = 0;
      }
    }
    else
    {
      if (PLIsFeaturedContentAllowed())
      {
        id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        uint64_t v13 = [v8 librarySpecificFetchOptions];
        BOOL v10 = 1;
        [v13 setIncludePendingMemories:1];
        [v13 setFetchLimit:10];
        [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
        v14 = id v30 = v8;
        v39[0] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
        [v13 setSortDescriptors:v15];

        uint64_t v29 = v13;
        [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v13];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v38 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          os_log_t oslog = v9;
          id v28 = v6;
          uint64_t v19 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v32 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              objc_msgSend(v21, "photosGraphVersion", oslog);
              if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() >= 0x301)
              {
                universalDate = self->_universalDate;
                id v23 = [v21 creationDate];
                uint64_t v24 = [v12 compareDate:universalDate toDate:v23 toUnitGranularity:16];

                if (v24 != 1)
                {
                  id v9 = oslog;
                  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v25 = self->_universalDate;
                    *(_DWORD *)buf = 138412290;
                    int v37 = v25;
                    _os_log_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] Already generated memories for universal date %@", buf, 0xCu);
                  }
                  BOOL v10 = 0;
                  id v6 = v28;
                  goto LABEL_23;
                }
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v38 count:16];
            if (v18) {
              continue;
            }
            break;
          }
          BOOL v10 = 1;
          id v9 = oslog;
          id v6 = v28;
LABEL_23:
          id v8 = v30;
          uint64_t v13 = v29;
        }
        else
        {
          id v8 = v30;
        }

        goto LABEL_26;
      }
      BOOL v10 = 0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v11 = "[PHAMemoryElectionTask] featured content is disabled in settings";
        goto LABEL_19;
      }
    }
LABEL_26:

    goto LABEL_27;
  }
  BOOL v10 = 0;
LABEL_27:

  return v10;
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
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
  return -2.0;
}

- (NSString)name
{
  return (NSString *)@"PHAMemoryElectionTask";
}

- (PHAMemoryElectionTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHAMemoryElectionTask;
  v2 = [(PHAMemoryElectionTask *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    universalDate = v2->_universalDate;
    v2->_universalDate = (NSDate *)v3;

    *(_DWORD *)&v2->_BOOL userInitiated = 0;
    v2->_requestedCategory = 0;
    v2->_requestedTriggerType = 0;
    v2->_featureCode = 101;
  }
  return v2;
}

+ (id)_userFeedbackCalculatorWithPhotoLibrary:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F39338];
  id v4 = a3;
  int v5 = (void *)[[v3 alloc] initWithPhotoLibrary:v4];

  return v5;
}

+ (id)_filterSuggestionsToFeatureBasedOnUserFeedbackForSuggestionsToFeature:(id)a3 sugestionsFetchResult:(id)a4 photoLibrary:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v8 count])
  {
    int v11 = (void *)MEMORY[0x1E4F38EB8];
    id v12 = [v10 librarySpecificFetchOptions];
    id v46 = v9;
    v50 = [v11 fetchKeyAssetBySuggestionUUIDForSuggestions:v9 options:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v47 = v8;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v56 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          long long v20 = [v19 uuid];
          uint64_t v21 = [v50 objectForKeyedSubscript:v20];

          if (v21)
          {
            char v22 = [v21 uuid];
            id v23 = [v19 uuid];
            [v13 setObject:v22 forKeyedSubscript:v23];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v16);
    }

    uint64_t v24 = [v10 librarySpecificFetchOptions];
    [v24 setIncludedDetectionTypes:&unk_1F291AD68];
    uint64_t v25 = (void *)MEMORY[0x1E4F391F0];
    uint64_t v26 = [v13 allValues];
    uint64_t v44 = v24;
    uint64_t v49 = [v25 fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v26 options:v24];

    id v45 = v10;
    uint64_t v27 = [a1 _userFeedbackCalculatorWithPhotoLibrary:v10];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v28 = v14;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v52;
      double v32 = *MEMORY[0x1E4F39848];
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v52 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v34 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          id v35 = [v34 uuid];
          id v36 = [v13 objectForKeyedSubscript:v35];

          if (v36)
          {
            uint64_t v37 = [v49 objectForKeyedSubscript:v36];
            BOOL v38 = (void *)v37;
            unint64_t v39 = (void *)MEMORY[0x1E4F1CBF0];
            if (v37) {
              unint64_t v39 = (void *)v37;
            }
            id v40 = v39;

            [v27 scoreForKeyAssetUUID:v36 personsUUIDsInKeyAsset:v40 memoryFeatures:0];
            double v42 = v41;

            if ([MEMORY[0x1E4F39338] score:v42 meetsScoreThreshold:v32]) {
              [v48 addObject:v34];
            }
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v30);
    }

    id v9 = v46;
    id v8 = v47;
    id v10 = v45;
  }

  return v48;
}

+ (void)findSuggestionsAndSetFeaturedStateIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = a4;
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v8 = v6;
  id v9 = v8;
  unint64_t v69 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FindSuggestionsAndSetFeaturedState", "", buf, 2u);
  }
  os_signpost_id_t spid = v7;

  uint64_t v67 = mach_absolute_time();
  id v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  id v12 = [v10 startOfDayForDate:v11];

  v76 = v12;
  uint64_t v13 = [v12 dateByAddingTimeInterval:-60.0];
  uint64_t v75 = v5;
  id v14 = [v5 librarySpecificFetchOptions];
  [v14 setWantsIncrementalChangeDetails:0];
  uint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v93[0] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:1];
  [v14 setSortDescriptors:v16];

  uint64_t v17 = [MEMORY[0x1E4F39310] predicateForAllFeaturedStateEnabledSuggestionTypesForWidget];
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(state == %d || state == %d)", 1, 0);
  id v70 = (void *)v13;
  uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate > %@ OR featuredState == %d", v13, 1];
  long long v20 = (void *)MEMORY[0x1E4F28BA0];
  v72 = (void *)v18;
  id v73 = (void *)v17;
  v92[0] = v17;
  v92[1] = v18;
  v92[2] = v19;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:3];
  char v22 = [v20 andPredicateWithSubpredicates:v21];
  [v14 setPredicate:v22];

  uint64_t v74 = v14;
  id v23 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v14];
  uint64_t v71 = v23;
  if ([v23 count])
  {
    uint64_t v24 = v9;
    uint64_t v25 = [v23 firstObject];
    uint64_t v26 = [v25 creationDate];

    uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v77 = [MEMORY[0x1E4F1CA48] array];
    id v28 = [v10 startOfDayForDate:v26];
    id v66 = v10;
    if ([v28 compare:v12] == -1)
    {
      uint64_t v29 = [MEMORY[0x1E4F1C9C8] distantFuture];

      uint64_t v26 = 0;
      id v28 = (void *)v29;
    }
    long long v63 = v19;
    os_log_t oslog = v24;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v30 = v23;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v82 objects:v87 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = 0;
      uint64_t v34 = *(void *)v83;
      while (1)
      {
        uint64_t v35 = 0;
        do
        {
          if (*(void *)v83 != v34) {
            objc_enumerationMutation(v30);
          }
          id v36 = *(void **)(*((void *)&v82 + 1) + 8 * v35);
          if ([v36 featuredState] == 1) {
            ++v33;
          }
          uint64_t v37 = [v36 creationDate];
          if ([v37 compare:v28] != -1
            || v26 && ([v26 timeIntervalSinceDate:v37], v39 < 2.0))
          {
            if (![v36 featuredState]) {
              [v27 addObject:v36];
            }
            id v38 = v37;
            goto LABEL_18;
          }
          if ([v36 featuredState] == 1)
          {
            [v77 addObject:v36];
            id v38 = 0;
LABEL_18:

            uint64_t v26 = v38;
          }

          ++v35;
        }
        while (v32 != v35);
        uint64_t v40 = [v30 countByEnumeratingWithState:&v82 objects:v87 count:16];
        uint64_t v32 = v40;
        if (!v40) {
          goto LABEL_35;
        }
      }
    }
    uint64_t v33 = 0;
LABEL_35:

    uint64_t v49 = v75;
    v50 = [a1 _filterSuggestionsToFeatureBasedOnUserFeedbackForSuggestionsToFeature:v27 sugestionsFetchResult:v30 photoLibrary:v75];

    uint64_t v51 = [v50 count];
    uint64_t v52 = [v77 count];
    BOOL v53 = v52 <= 0 && v51 <= 0;
    if (v53 || (double v54 = *(double *)&v52, v51 + v33 - v52 < 1))
    {
      double v42 = oslog;
      unint64_t v55 = v69;
      id v48 = v70;
      uint64_t v19 = v63;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Update featured suggestions - up to date", buf, 2u);
      }
    }
    else
    {
      double v42 = oslog;
      id v48 = v70;
      uint64_t v19 = v63;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v89 = (const char *)v51;
        __int16 v90 = 2048;
        double v91 = v54;
        _os_log_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update featured suggestions - add: %zd, remove: %zd", buf, 0x16u);
      }
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v89 = (const char *)v50;
        _os_log_debug_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Suggestions to add featured state: %@", buf, 0xCu);
      }
      unint64_t v55 = v69;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v89 = (const char *)v77;
        _os_log_debug_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Suggestions to remove featured state: %@", buf, 0xCu);
      }
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __116__PHAMemoryElectionTask_WidgetTimeline__findSuggestionsAndSetFeaturedStateIfNeededInPhotoLibrary_loggingConnection___block_invoke;
      v79[3] = &unk_1E69189B0;
      id v80 = v50;
      id v81 = v77;
      id v78 = 0;
      char v56 = [v75 performChangesAndWait:v79 error:&v78];
      long long v57 = (char *)v78;
      if ((v56 & 1) == 0 && os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v57;
        _os_log_error_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask+WidgetTimeline] Update featured suggestions - failed: %@", buf, 0xCu);
      }
    }
    uint64_t v58 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    uint64_t v61 = v42;
    long long v62 = v61;
    if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v62, OS_SIGNPOST_INTERVAL_END, spid, "FindSuggestionsAndSetFeaturedState", "", buf, 2u);
    }

    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v89 = "FindSuggestionsAndSetFeaturedState";
      __int16 v90 = 2048;
      double v91 = (float)((float)((float)((float)(v58 - v67) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v62, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    id v10 = v66;
    double v41 = v76;
  }
  else
  {
    double v41 = v12;
    double v42 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update featured suggestions - found 0 suggestions", buf, 2u);
    }
    uint64_t v43 = mach_absolute_time();
    uint32_t v44 = info.numer;
    uint32_t v45 = info.denom;
    id v46 = v9;
    id v47 = v46;
    id v48 = v70;
    uint64_t v49 = v75;
    if (v69 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v47, OS_SIGNPOST_INTERVAL_END, spid, "FindSuggestionsAndSetFeaturedState", "", buf, 2u);
    }

    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v89 = "FindSuggestionsAndSetFeaturedState";
      __int16 v90 = 2048;
      double v91 = (float)((float)((float)((float)(v43 - v67) * (float)v44) / (float)v45) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

void __116__PHAMemoryElectionTask_WidgetTimeline__findSuggestionsAndSetFeaturedStateIfNeededInPhotoLibrary_loggingConnection___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        os_signpost_id_t v7 = [MEMORY[0x1E4F39318] changeRequestForSuggestion:*(void *)(*((void *)&v18 + 1) + 8 * v6)];
        [v7 setFeaturedState:1];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F39318], "changeRequestForSuggestion:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [v13 setFeaturedState:0];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
}

+ (id)_filterMemoriesWithAcceptableUserFeedback:(id)a3 allMemoriesFetchResult:(id)a4 photoLibrary:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v8 count])
  {
    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v50 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v65 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if ([v17 isUserCreated])
          {
            [v11 addObject:v17];
          }
          else
          {
            long long v18 = [v17 objectID];
            [v53 addObject:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v14);
    }
    uint64_t v52 = v11;

    id v49 = v9;
    long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F390B0]) initWithExistingFetchResult:v9 filteredObjectIDs:v53];
    long long v20 = [v10 librarySpecificFetchOptions];
    [v20 setIncludedDetectionTypes:&unk_1F291AD50];
    uint64_t v51 = v20;
    long long v21 = [MEMORY[0x1E4F38EB8] fetchKeyAssetByMemoryUUIDForMemories:v19 options:v20];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v61 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = [v23 objectForKeyedSubscript:*(void *)(*((void *)&v60 + 1) + 8 * j)];
          uint64_t v29 = [v28 uuid];
          [v22 addObject:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v25);
    }

    unint64_t v55 = [MEMORY[0x1E4F391F0] fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v22 options:v51];
    id v48 = v10;
    id v30 = [a1 _userFeedbackCalculatorWithPhotoLibrary:v10];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = v19;
    uint64_t v31 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v57;
      double v34 = *MEMORY[0x1E4F39848];
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v57 != v33) {
            objc_enumerationMutation(obj);
          }
          id v36 = *(void **)(*((void *)&v56 + 1) + 8 * k);
          uint64_t v37 = [v36 uuid];
          id v38 = [v23 objectForKeyedSubscript:v37];
          double v39 = [v38 uuid];

          if (v39)
          {
            uint64_t v40 = [v55 objectForKeyedSubscript:v39];
            double v41 = (void *)v40;
            double v42 = (void *)MEMORY[0x1E4F1CBF0];
            if (v40) {
              double v42 = (void *)v40;
            }
            id v43 = v42;

            uint32_t v44 = [v36 blockableFeatures];
            [v30 scoreForKeyAssetUUID:v39 personsUUIDsInKeyAsset:v43 memoryFeatures:v44];
            double v46 = v45;

            if ([MEMORY[0x1E4F39338] score:v46 meetsScoreThreshold:v34]) {
              [v52 addObject:v36];
            }
          }
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v32);
    }

    id v9 = v49;
    id v8 = v50;
    id v11 = v52;
    id v10 = v48;
  }

  return v11;
}

+ (void)findMemoriesAndSetFeaturedStateIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = a4;
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v8 = v6;
  id v9 = v8;
  unint64_t v64 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FindMemoriesAndSetFeaturedState", "", buf, 2u);
  }
  os_signpost_id_t spid = v7;

  uint64_t v62 = mach_absolute_time();
  id v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  id v12 = [v10 startOfDayForDate:v11];

  uint64_t v13 = [v12 dateByAddingTimeInterval:-60.0];
  uint64_t v14 = [v5 librarySpecificFetchOptions];
  [v14 setWantsIncrementalChangeDetails:0];
  [v14 setIncludePendingMemories:1];
  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(creationDate > %@ OR featuredState == %d) AND userCreated == NO AND featuredState != %d", v13, 1, -1];
  [v14 setPredicate:v15];

  long long v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v81[0] = v16;
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
  [v14 setSortDescriptors:v17];

  long long v18 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v14];
  long long v65 = v18;
  if ([v18 count])
  {
    long long v57 = v14;
    long long v58 = v13;
    long long v19 = [v18 firstObject];
    long long v20 = [v19 creationDate];

    long long v66 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = [MEMORY[0x1E4F1CA48] array];
    id v22 = [v10 startOfDayForDate:v20];
    id v23 = v12;
    uint64_t v24 = v22;
    long long v59 = v23;
    long long v60 = v10;
    if (objc_msgSend(v22, "compare:") == -1)
    {
      [MEMORY[0x1E4F1C9C8] distantFuture];
      v26 = uint64_t v25 = v18;

      long long v20 = 0;
      uint64_t v24 = (void *)v26;
      long long v18 = v25;
    }
    os_log_t oslog = v9;
    long long v61 = v5;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v27 = v18;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (!v28)
    {
      uint64_t v30 = 0;
      goto LABEL_35;
    }
    uint64_t v29 = v28;
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)v72;
    while (1)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v72 != v31) {
          objc_enumerationMutation(v27);
        }
        uint64_t v33 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if ([v33 featuredState] == 1) {
          ++v30;
        }
        double v34 = [v33 creationDate];
        if ([v34 compare:v24] == -1
          && (!v20 || ([v20 timeIntervalSinceDate:v34], v36 >= 2.0))
          || ([v33 photosGraphVersion],
              PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() < 0x301))
        {
          if ([v33 featuredState] != 1) {
            goto LABEL_24;
          }
          [v21 addObject:v33];
          id v35 = 0;
        }
        else
        {
          if (![v33 featuredState]) {
            [v66 addObject:v33];
          }
          id v35 = v34;
        }

        long long v20 = v35;
LABEL_24:
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v71 objects:v76 count:16];
      if (!v29)
      {
LABEL_35:

        id v5 = v61;
        double v42 = [a1 _filterMemoriesWithAcceptableUserFeedback:v66 allMemoriesFetchResult:v27 photoLibrary:v61];

        uint64_t v43 = [v42 count];
        uint64_t v44 = [v21 count];
        BOOL v45 = v44 <= 0 && v43 <= 0;
        if (v45 || (double v46 = *(double *)&v44, v43 + v30 - v44 < 1))
        {
          id v9 = oslog;
          unint64_t v47 = v64;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Update featured memories - up to date", buf, 2u);
          }
        }
        else
        {
          id v9 = oslog;
          unint64_t v47 = v64;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            id v78 = (const char *)v43;
            __int16 v79 = 2048;
            double v80 = v46;
            _os_log_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update featured memories - add: %zd, remove: %zd", buf, 0x16u);
          }
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v78 = (const char *)v42;
            _os_log_debug_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Memories to add featured state: %@", buf, 0xCu);
          }
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v78 = (const char *)v21;
            _os_log_debug_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Memories to remove featured state: %@", buf, 0xCu);
          }
          v68[0] = MEMORY[0x1E4F143A8];
          v68[1] = 3221225472;
          v68[2] = __113__PHAMemoryElectionTask_WidgetTimeline__findMemoriesAndSetFeaturedStateIfNeededInPhotoLibrary_loggingConnection___block_invoke;
          v68[3] = &unk_1E69189B0;
          id v69 = v42;
          id v70 = v21;
          id v67 = 0;
          char v48 = [v61 performChangesAndWait:v68 error:&v67];
          id v49 = (char *)v67;
          if ((v48 & 1) == 0 && os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v78 = v49;
            _os_log_error_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask+WidgetTimeline] Update featured memories - failed: %@", buf, 0xCu);
          }
        }
        uint64_t v50 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        id v53 = v9;
        double v54 = v53;
        if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D21F2000, v54, OS_SIGNPOST_INTERVAL_END, spid, "FindMemoriesAndSetFeaturedState", "", buf, 2u);
        }

        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v78 = "FindMemoriesAndSetFeaturedState";
          __int16 v79 = 2048;
          double v80 = (float)((float)((float)((float)(v50 - v62) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D21F2000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        id v12 = v59;
        id v10 = v60;
        uint64_t v14 = v57;
        uint64_t v13 = v58;
        goto LABEL_58;
      }
    }
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update featured memories - found 0 memories", buf, 2u);
  }
  uint64_t v37 = mach_absolute_time();
  uint32_t v39 = info.numer;
  uint32_t v38 = info.denom;
  uint64_t v40 = v9;
  double v41 = v40;
  if (v64 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v41, OS_SIGNPOST_INTERVAL_END, spid, "FindMemoriesAndSetFeaturedState", "", buf, 2u);
  }

  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v78 = "FindMemoriesAndSetFeaturedState";
    __int16 v79 = 2048;
    double v80 = (float)((float)((float)((float)(v37 - v62) * (float)v39) / (float)v38) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v41, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
LABEL_58:
}

void __113__PHAMemoryElectionTask_WidgetTimeline__findMemoriesAndSetFeaturedStateIfNeededInPhotoLibrary_loggingConnection___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        os_signpost_id_t v7 = [MEMORY[0x1E4F39170] changeRequestForMemory:*(void *)(*((void *)&v18 + 1) + 8 * v6)];
        [v7 setFeaturedState:1];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F39170], "changeRequestForMemory:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [v13 setFeaturedState:0];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
}

+ (void)findMemoriesAndSetNeverFeatureStateIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_signpost_id_t v7 = a4;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FindMemoriesAndSetNeverFeatureState", "", buf, 2u);
  }

  uint64_t v44 = mach_absolute_time();
  uint64_t v12 = [v6 librarySpecificFetchOptions];
  [v12 setFetchLimit:13];
  [v12 setIncludePendingMemories:1];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"rejected == NO AND userCreated == NO AND featuredState != %d", -1);
  [v12 setPredicate:v13];

  long long v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v53[0] = v14;
  long long v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:0];
  v53[1] = v15;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  [v12 setSortDescriptors:v16];

  long long v17 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v12];
  long long v18 = [v17 fetchedObjects];
  if ([v18 count])
  {
    os_signpost_id_t spid = v8;
    long long v19 = [a1 _filterMemoriesWithAcceptableUserFeedback:v18 allMemoriesFetchResult:v17 photoLibrary:v6];
    uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
    long long v21 = [MEMORY[0x1E4F1CA80] setWithArray:v18];
    uint64_t v43 = (void *)v20;
    [v21 minusSet:v20];
    if ([v21 count])
    {
      double v41 = v19;
      id v22 = v10;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = [v21 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v50 = (const char *)v23;
        _os_log_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update never feature memories - add: %zd", buf, 0xCu);
      }

      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __117__PHAMemoryElectionTask_WidgetTimeline__findMemoriesAndSetNeverFeatureStateIfNeededInPhotoLibrary_loggingConnection___block_invoke;
      v46[3] = &unk_1E6918C50;
      id v47 = v21;
      id v45 = 0;
      char v24 = [v6 performChangesAndWait:v46 error:&v45];
      uint64_t v25 = (char *)v45;
      if ((v24 & 1) == 0 && os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = v25;
        _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask+WidgetTimeline] Update never feature memories - failed: %@", buf, 0xCu);
      }
      uint64_t v26 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      uint64_t v29 = v22;
      uint64_t v30 = v29;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D21F2000, v30, OS_SIGNPOST_INTERVAL_END, spid, "FindMemoriesAndSetNeverFeatureState", "", buf, 2u);
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v50 = "FindMemoriesAndSetNeverFeatureState";
        __int16 v51 = 2048;
        double v52 = (float)((float)((float)((float)(v26 - v44) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

      long long v19 = v41;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Update never feature memories - up to date", buf, 2u);
      }
      uint64_t v36 = mach_absolute_time();
      uint32_t v38 = info.numer;
      uint32_t v37 = info.denom;
      uint32_t v39 = v10;
      uint64_t v40 = v39;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D21F2000, v40, OS_SIGNPOST_INTERVAL_END, spid, "FindMemoriesAndSetNeverFeatureState", "", buf, 2u);
      }

      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v50 = "FindMemoriesAndSetNeverFeatureState";
        __int16 v51 = 2048;
        double v52 = (float)((float)((float)((float)(v36 - v44) * (float)v38) / (float)v37) / 1000000.0);
        _os_log_impl(&dword_1D21F2000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update never featured memories - found 0 memories", buf, 2u);
    }
    uint64_t v31 = mach_absolute_time();
    uint32_t v33 = info.numer;
    uint32_t v32 = info.denom;
    double v34 = v10;
    id v35 = v34;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v35, OS_SIGNPOST_INTERVAL_END, v8, "FindMemoriesAndSetNeverFeatureState", "", buf, 2u);
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v50 = "FindMemoriesAndSetNeverFeatureState";
      __int16 v51 = 2048;
      double v52 = (float)((float)((float)((float)(v31 - v44) * (float)v33) / (float)v32) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

void __117__PHAMemoryElectionTask_WidgetTimeline__findMemoriesAndSetNeverFeatureStateIfNeededInPhotoLibrary_loggingConnection___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = objc_msgSend(MEMORY[0x1E4F39170], "changeRequestForMemory:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setFeaturedState:-1];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

+ (void)findAndSetFeaturedStateForMemoriesAndSuggestionsIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  os_signpost_id_t v8 = os_signpost_id_generate(v6);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  long long v9 = v6;
  long long v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FindAndSetFeaturedStateForMemoriesAndSuggestions", "", buf, 2u);
  }

  uint64_t v11 = mach_absolute_time();
  [a1 findMemoriesAndSetNeverFeatureStateIfNeededInPhotoLibrary:v7 loggingConnection:v10];
  [a1 findMemoriesAndSetFeaturedStateIfNeededInPhotoLibrary:v7 loggingConnection:v10];
  [a1 findSuggestionsAndSetFeaturedStateIfNeededInPhotoLibrary:v7 loggingConnection:v10];

  uint64_t v12 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  long long v15 = v10;
  long long v16 = v15;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v16, OS_SIGNPOST_INTERVAL_END, v8, "FindAndSetFeaturedStateForMemoriesAndSuggestions", "", buf, 2u);
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v19 = "FindAndSetFeaturedStateForMemoriesAndSuggestions";
    __int16 v20 = 2048;
    double v21 = (float)((float)((float)((float)(v12 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v16, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

+ (BOOL)reloadAlbumWidgetTimelineWithLoggingConnection:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F58DA0]) initWithExtensionBundleIdentifier:@"com.apple.mobileslideshow.PhotosReliveWidget" kind:@"com.apple.mobileslideshow.PhotosReliveWidget.collections"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+AlbumWidgetTimeline] Calling reloadTimeline on CHSTimelineController", (uint8_t *)&v9, 2u);
  }
  id v7 = [v6 reloadTimelineWithReason:@"WidgetAssetChanged"];
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      long long v10 = v7;
      _os_log_error_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask+AlbumWidgetTimeline] CHSTimelineController reloadTimeline error: %@", (uint8_t *)&v9, 0xCu);
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
    if (a4) {
LABEL_6:
    }
      *a4 = v7;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+AlbumWidgetTimeline] CHSTimelineController reloadTimeline completed", (uint8_t *)&v9, 2u);
  }
LABEL_9:

  return v7 == 0;
}

+ (BOOL)reloadForYouWidgetTimelineWithLoggingConnection:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F58DA0]) initWithExtensionBundleIdentifier:@"com.apple.mobileslideshow.PhotosReliveWidget" kind:@"com.apple.mobileslideshow.PhotosReliveWidget"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+ForYouWidgetTimeline] Calling reloadTimeline on CHSTimelineController", (uint8_t *)&v9, 2u);
  }
  id v7 = [v6 reloadTimelineWithReason:@"WidgetAssetChanged"];
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      long long v10 = v7;
      _os_log_error_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask+ForYouWidgetTimeline] CHSTimelineController reloadTimeline error: %@", (uint8_t *)&v9, 0xCu);
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
    if (a4) {
LABEL_6:
    }
      *a4 = v7;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1D21F2000, v5, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+ForYouWidgetTimeline] CHSTimelineController reloadTimeline completed", (uint8_t *)&v9, 2u);
  }
LABEL_9:

  return v7 == 0;
}

- (void)collectMetricsOnElectedEnrichedMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v33 = a4;
  id v32 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v30 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v9);
        }
        v12 += [*(id *)(*((void *)&v43 + 1) + 8 * i) featuresGuestAssets];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  long long v15 = [NSNumber numberWithUnsignedInteger:v12];
  [v8 setValue:v15 forKey:@"numberOfMemoriesWithGuestAsset"];

  long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  [v8 setValue:v16 forKey:@"newMemoriesCount"];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v17 = v9;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        uint64_t v23 = [v22 memoryCategorySubcategory];
        char v24 = (void *)MEMORY[0x1E4F8D688];
        uint64_t v25 = [v22 memoryFeatureNodes];
        uint64_t v26 = [v24 fullMemoryTypeStringWithMemoryCategorySubcategory:v23 featureNodes:v25];

        [v34 addObject:v26];
        id v27 = [v22 triggerTypes];
        uint64_t v28 = [v27 count];

        if (v28)
        {
          [v30 addObject:v26];
          uint64_t v29 = [v22 triggerTypes];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __102__PHAMemoryElectionTask_Metrics__collectMetricsOnElectedEnrichedMemories_loggingConnection_analytics___block_invoke;
          v35[3] = &unk_1E69188B8;
          v35[4] = self;
          id v36 = v26;
          id v37 = v33;
          id v38 = v32;
          [v29 enumerateIndexesUsingBlock:v35];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v19);
  }

  [v32 sendEvent:@"com.apple.Photos.memories.generation" withPayload:v8];
  [(id)objc_opt_class() sendElectedMemoriesPipelineAnalyticsEventWithCountsOfMemories:v34 loggingConnection:v33 analytics:v32];
  [(id)objc_opt_class() sendTriggeredMemoriesPipelineAnalyticsEventWithCountsOfMemories:v30 loggingConnection:v33 analytics:v32];
}

void __102__PHAMemoryElectionTask_Metrics__collectMetricsOnElectedEnrichedMemories_loggingConnection_analytics___block_invoke(void *a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F39160] stringForTriggerType:a2];
  [(id)objc_opt_class() sendMemoryTriggersAnalyticsEventWithElectedMemoryType:a1[5] triggerType:v3 loggingConnection:a1[6] analytics:a1[7]];
}

- (void)collectMetricsOnMemoriesInGraphWithWorkingContext:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F28BD0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __112__PHAMemoryElectionTask_Metrics__collectMetricsOnMemoriesInGraphWithWorkingContext_loggingConnection_analytics___block_invoke;
  v13[3] = &unk_1E6918880;
  id v14 = v11;
  id v12 = v11;
  [v10 performSynchronousConcurrentGraphReadUsingBlock:v13];

  [(id)objc_opt_class() sendGeneratedMemoriesPipelineAnalyticsEventWithCountsOfMemories:v12 loggingConnection:v9 analytics:v8];
}

void __112__PHAMemoryElectionTask_Metrics__collectMetricsOnMemoriesInGraphWithWorkingContext_loggingConnection_analytics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 graph];
  uint64_t v4 = [MEMORY[0x1E4F8D690] nodesInGraph:v3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __112__PHAMemoryElectionTask_Metrics__collectMetricsOnMemoriesInGraphWithWorkingContext_loggingConnection_analytics___block_invoke_2;
  v6[3] = &unk_1E6918858;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  [v4 enumerateMemoryCategorySubcategoriesUsingBlock:v6];
}

void __112__PHAMemoryElectionTask_Metrics__collectMetricsOnMemoriesInGraphWithWorkingContext_loggingConnection_analytics___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc(MEMORY[0x1E4F8D690]);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F71E40]) initWithElementIdentifier:a2];
  id v12 = (id)[v6 initWithGraph:v7 elementIdentifiers:v8];

  id v9 = (void *)MEMORY[0x1E4F8D688];
  id v10 = [v12 featureNodes];
  id v11 = [v9 fullMemoryTypeStringWithMemoryCategorySubcategory:a3 featureNodes:v10];

  [*(id *)(a1 + 40) addObject:v11];
}

- (void)collectMetricsOnExistingMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  long long v74 = self;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  os_log_t oslog = a4;
  id v75 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v94 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v80 = +[PHAMetricsHelper memoryCategoryValueToDataAggregationKeyLookup];
  id v9 = +[PHAMetricsHelper memoryBlockableFeatureTypeValueToDataAggregationKeyLookup];
  uint64_t v77 = +[PHAMetricsHelper memoryBlockedFeatureTypeValueToDataAggregationKeyLookup];
  id v10 = [MEMORY[0x1E4F28BD0] set];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v7;
  uint64_t v81 = [obj countByEnumeratingWithState:&v103 objects:v111 count:16];
  uint64_t v11 = 0;
  if (v81)
  {
    uint64_t v78 = *(void *)v104;
    __int16 v79 = v10;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v104 != v78) {
          objc_enumerationMutation(obj);
        }
        uint64_t v89 = v12;
        uint64_t v13 = *(void **)(*((void *)&v103 + 1) + 8 * v12);
        context = (void *)MEMORY[0x1D26057A0]();
        unsigned int v86 = [v13 isFavorite];
        v92 = [v13 photosGraphProperties];
        uint64_t v14 = [v92 objectForKeyedSubscript:@"triggerTypes"];
        long long v15 = (void *)v14;
        long long v16 = (void *)MEMORY[0x1E4F1CBF0];
        if (v14) {
          long long v16 = (void *)v14;
        }
        id v17 = v16;

        if ((unint64_t)[v17 count] > 1
          || (v19 = [v17 count], uint64_t v18 = PHAMetrics_MemoriesFeed_RandomMemoriesCount, v19 == 1)
          && (char v20 = [v17 containsObject:&unk_1F291ABE8],
              uint64_t v18 = PHAMetrics_MemoriesFeed_RandomMemoriesCount,
              (v20 & 1) == 0))
        {
          uint64_t v18 = PHAMetrics_MemoriesFeed_TriggeredMemoriesCount;
        }
        double v21 = *v18;
        uint64_t v22 = [v8 objectForKey:v21];
        long long v84 = v22;
        if (v22) {
          uint64_t v23 = [v22 unsignedIntegerValue] + 1;
        }
        else {
          uint64_t v23 = 1;
        }
        uint64_t v87 = v17;
        uint64_t v90 = v11;
        char v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v23, v74);
        long long v85 = v21;
        [v8 setValue:v24 forKey:v21];

        uint64_t v25 = +[PHAMetricsHelper dataAggregationKeyForCategory:subCategory:lookupTable:](PHAMetricsHelper, "dataAggregationKeyForCategory:subCategory:lookupTable:", [v13 category], 0, v80);
        if (v25)
        {
          uint64_t v26 = [v8 objectForKey:v25];
          id v27 = v26;
          if (v26) {
            uint64_t v28 = [v26 unsignedIntegerValue] + 1;
          }
          else {
            uint64_t v28 = 1;
          }
          uint64_t v29 = [NSNumber numberWithUnsignedInteger:v28];
          [v8 setValue:v29 forKey:v25];
        }
        long long v82 = v13;
        long long v83 = (void *)v25;
        id v30 = v8;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        uint64_t v31 = [v13 blockableFeatures];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v99 objects:v110 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v100;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v100 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = [*(id *)(*((void *)&v99 + 1) + 8 * i) type];
              id v37 = [NSNumber numberWithUnsignedInteger:v36];
              id v38 = [v9 objectForKeyedSubscript:v37];

              if (v38)
              {
                long long v39 = [v30 objectForKey:v38];
                long long v40 = v39;
                if (v39) {
                  uint64_t v41 = [v39 unsignedIntegerValue] + 1;
                }
                else {
                  uint64_t v41 = 1;
                }
                long long v42 = [NSNumber numberWithUnsignedInteger:v41];
                [v94 setValue:v42 forKey:v38];
              }
              else if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v109 = v36;
                _os_log_error_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_ERROR, "[PHAMemoryGenerationTask] Not logging aggregate stats for existing memory blockable feature type %lu", buf, 0xCu);
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v99 objects:v110 count:16];
          }
          while (v33);
        }

        long long v43 = [v82 blacklistedFeature];
        long long v44 = v43;
        id v8 = v30;
        id v10 = v79;
        if (v43)
        {
          uint64_t v45 = [v43 type];
          long long v46 = [NSNumber numberWithUnsignedInteger:v45];
          id v47 = [v77 objectForKeyedSubscript:v46];

          if (v47)
          {
            char v48 = [v8 objectForKey:v47];
            uint64_t v49 = v48;
            if (v48) {
              uint64_t v50 = [v48 unsignedIntegerValue] + 1;
            }
            else {
              uint64_t v50 = 1;
            }
            __int16 v51 = [NSNumber numberWithUnsignedInteger:v50];
            [v94 setValue:v51 forKey:v47];
          }
          else if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v109 = v45;
            _os_log_error_impl(&dword_1D21F2000, oslog, OS_LOG_TYPE_ERROR, "[PHAMemoryGenerationTask] Not logging aggregate stats for existing memory blocked feature type %lu", buf, 0xCu);
          }
        }
        double v52 = [v92 objectForKeyedSubscript:@"moodKeywords"];
        if ([v52 count])
        {
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v53 = v52;
          uint64_t v54 = [v53 countByEnumeratingWithState:&v95 objects:v107 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v96;
            do
            {
              for (uint64_t j = 0; j != v55; ++j)
              {
                if (*(void *)v96 != v56) {
                  objc_enumerationMutation(v53);
                }
                [v79 addObject:*(void *)(*((void *)&v95 + 1) + 8 * j)];
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v95 objects:v107 count:16];
            }
            while (v55);
          }
        }
        else
        {
          [v79 addObject:@"None"];
        }
        uint64_t v11 = v90 + v86;

        uint64_t v12 = v89 + 1;
      }
      while (v89 + 1 != v81);
      uint64_t v81 = [obj countByEnumeratingWithState:&v103 objects:v111 count:16];
    }
    while (v81);
  }

  long long v58 = [obj lastObject];
  if (v58)
  {
    uint64_t v91 = v11;
    long long v59 = v8;
    id v60 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    long long v61 = (void *)[v60 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v62 = v58;
    long long v63 = [v58 creationDate];
    unint64_t v64 = [v61 startOfDayForDate:v63];

    long long v65 = [(PHAMemoryElectionTask *)v74 universalDate];
    long long v66 = [v61 startOfDayForDate:v65];

    id v67 = [v61 components:16 fromDate:v64 toDate:v66 options:0];
    uint64_t v68 = [v67 day];
    if (v68 >= 1)
    {
      id v69 = [NSNumber numberWithInteger:v68];
      [v59 setValue:v69 forKey:@"numberOfDaysSinceLastMemoryWasCreated"];
    }
    id v8 = v59;
    uint64_t v11 = v91;
    long long v58 = v62;
  }
  id v70 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count", v74));
  [v8 setValue:v70 forKey:@"totalMemoriesCount"];

  long long v71 = [NSNumber numberWithUnsignedInteger:v11];
  [v8 setValue:v71 forKey:@"totalFavoritedMemoriesCount"];

  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v73 = +[PHAMetricsHelper aggregatedStatsForMoodKeywordCountedSet:v10];
  [v72 addEntriesFromDictionary:v73];

  [v75 sendEvent:@"com.apple.Photos.memories.feed" withPayload:v8];
  [v75 sendEvent:@"com.apple.Photos.memories.mood" withPayload:v72];
  [v75 sendEvent:@"com.apple.Photos.memories.blacklist" withPayload:v94];
}

+ (void)sendMemoryTriggersAnalyticsEventWithElectedMemoryType:(id)a3 triggerType:(id)a4 loggingConnection:(id)a5 analytics:(id)a6
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"triggerType";
  v13[1] = @"triggerCount";
  v14[0] = a4;
  v14[1] = &unk_1F291AC00;
  v13[2] = @"fullMemoryType";
  v13[3] = @"memoryElected";
  v14[2] = a3;
  v14[3] = &unk_1F291AC00;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 dictionaryWithObjects:v14 forKeys:v13 count:4];

  [v9 sendEvent:@"com.apple.Photos.memories.triggers" withPayload:v12];
}

+ (void)sendNotifiedMemoriesPipelineAnalyticsEventWithMemoryType:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"pipelineStage";
  v10[1] = @"fullMemoryType";
  v11[0] = @"notified";
  v11[1] = a3;
  v10[2] = @"memoryCount";
  v11[2] = &unk_1F291AC00;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a5;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v11 forKeys:v10 count:3];

  [v7 sendEvent:@"com.apple.Photos.memories.pipeline" withPayload:v9];
}

+ (void)sendTriggeredMemoriesPipelineAnalyticsEventWithCountsOfMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v18 = a4;
  id v8 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        long long v15 = (void *)MEMORY[0x1D26057A0]();
        v23[0] = @"pipelineStage";
        v23[1] = @"fullMemoryType";
        v24[0] = @"triggered";
        v24[1] = v14;
        v23[2] = @"memoryCount";
        long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "countForObject:", v14));
        v24[2] = v16;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

        [v8 sendEvent:@"com.apple.Photos.memories.pipeline" withPayload:v17];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v11);
  }
}

+ (void)sendElectedMemoriesPipelineAnalyticsEventWithCountsOfMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v18 = a4;
  id v8 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        long long v15 = (void *)MEMORY[0x1D26057A0]();
        v23[0] = @"pipelineStage";
        v23[1] = @"fullMemoryType";
        v24[0] = @"elected";
        v24[1] = v14;
        v23[2] = @"memoryCount";
        long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "countForObject:", v14));
        v24[2] = v16;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

        [v8 sendEvent:@"com.apple.Photos.memories.pipeline" withPayload:v17];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v11);
  }
}

+ (void)sendGeneratedMemoriesPipelineAnalyticsEventWithCountsOfMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = a5;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v8 = [MEMORY[0x1E4F8D688] allMemoryTypeStrings];
  id v9 = (void *)[v7 initWithArray:v8];

  objc_msgSend(v9, "pha_shuffle");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v9;
  uint64_t v24 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v24)
  {
    uint64_t v10 = @"fullMemoryType";
    uint64_t v11 = @"memoryCount";
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = [v23 countForObject:v13];
        if (v14)
        {
          v31[0] = @"pipelineStage";
          v31[1] = v10;
          v32[0] = @"generated";
          v32[1] = v13;
          v31[2] = v11;
          [NSNumber numberWithUnsignedInteger:v14];
          long long v15 = v11;
          v17 = long long v16 = v10;
          v32[2] = v17;
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

          uint64_t v10 = v16;
          uint64_t v11 = v15;
          [v6 sendEvent:@"com.apple.Photos.memories.pipeline" withPayload:v18];
        }
        v29[1] = v11;
        v30[0] = v13;
        v29[0] = v10;
        long long v19 = [NSNumber numberWithUnsignedInteger:v14];
        v30[1] = v19;
        long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

        [v6 sendEvent:@"com.apple.Photos.memories.generationByType" withPayload:v20];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v24);
  }
}

@end