@interface VCMetricSubmitter
+ (id)activityIdentifier;
+ (void)performWithDatabaseProvider:(id)a3;
+ (void)scheduleWithDatabaseProvider:(id)a3;
+ (void)scheduleWithScheduler:(id)a3 databaseProvider:(id)a4;
- (BOOL)addWidgetMetricsToEvent:(id)a3 error:(id *)a4;
- (BOOL)hasSeenAutoShortcutsSections;
- (BOOL)homeAutomationsPresent:(id *)a3;
- (BOOL)isAppInstalled;
- (BOOL)isSharingEnabled;
- (BOOL)isSleepEnabled;
- (BOOL)personalAutomationsEnabled:(id)a3;
- (VCMetricCheckIn)checkIn;
- (VCMetricSubmitter)initWithCheckIn:(id)a3 event:(id)a4 databaseProvider:(id)a5;
- (VCMetricSubmitter)initWithDatabaseProvider:(id)a3;
- (WFDatabaseProvider)databaseProvider;
- (WFMetricStatusEvent)event;
- (unsigned)averageShortcutCountPerFolder:(id)a3;
- (unsigned)folderCount:(id)a3;
- (unsigned)numberOfAppSessions:(id *)a3;
- (unsigned)numberOfPersonalAutomationsEnabled:(id)a3;
- (unsigned)numberOfShortcutRuns:(id)a3;
- (unsigned)shortcutsCount:(id)a3;
- (unsigned)sleepShortcutCount:(id)a3;
- (unsigned)uncategorizedShortcutCount:(id)a3;
- (unsigned)watchShortcutCount:(id)a3;
- (void)perform;
@end

@implementation VCMetricSubmitter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_checkIn, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (VCMetricCheckIn)checkIn
{
  return self->_checkIn;
}

- (WFMetricStatusEvent)event
{
  return self->_event;
}

- (BOOL)addWidgetMetricsToEvent:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(getATXHomeScreenConfigCacheClass());
  id v53 = 0;
  v7 = [v6 loadHomeScreenAndTodayPageConfigurationsWithError:&v53];
  id v8 = v53;
  v9 = v8;
  if (v7)
  {
    id v26 = v8;
    v27 = v7;
    id v28 = v6;
    v29 = v5;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v7;
    uint64_t v32 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    uint64_t v10 = 0;
    if (v32)
    {
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      int v38 = 0;
      uint64_t v31 = *(void *)v50;
      uint64_t v11 = *MEMORY[0x1E4FB4BE8];
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v12;
          v13 = *(void **)(*((void *)&v49 + 1) + 8 * v12);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v34 = [v13 stacks];
          uint64_t v36 = [v34 countByEnumeratingWithState:&v45 objects:v55 count:16];
          if (v36)
          {
            uint64_t v35 = *(void *)v46;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v46 != v35) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v37 = v14;
                v15 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
                long long v41 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                v16 = [v15 widgets];
                uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v54 count:16];
                if (v17)
                {
                  uint64_t v18 = v17;
                  uint64_t v19 = *(void *)v42;
                  do
                  {
                    for (uint64_t i = 0; i != v18; ++i)
                    {
                      if (*(void *)v42 != v19) {
                        objc_enumerationMutation(v16);
                      }
                      v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                      uint64_t v22 = [v21 appBundleId];
                      uint64_t v23 = [v21 extensionBundleId];
                      if (v22 | v23
                        && (([(id)v22 isEqualToString:v11] & 1) != 0
                         || [(id)v23 isEqualToString:@"Shortcuts"]))
                      {
                        uint64_t v24 = [v15 stackLayoutSize];
                        switch(v24)
                        {
                          case 2:
                            ++v40;
                            break;
                          case 1:
                            ++v39;
                            break;
                          case 0:
                            ++v38;
                            break;
                        }
                        if ([v13 pageIndex] == 20000) {
                          ++v10;
                        }
                      }
                    }
                    uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v54 count:16];
                  }
                  while (v18);
                }

                uint64_t v14 = v37 + 1;
              }
              while (v37 + 1 != v36);
              uint64_t v36 = [v34 countByEnumeratingWithState:&v45 objects:v55 count:16];
            }
            while (v36);
          }

          uint64_t v12 = v33 + 1;
        }
        while (v33 + 1 != v32);
        uint64_t v32 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v32);
    }
    else
    {
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      int v38 = 0;
    }

    id v5 = v29;
    objc_msgSend(v29, "setNumberOfSmallWidgets:");
    [v29 setNumberOfMediumWidgets:v39];
    [v29 setNumberOfLargeWidgets:v40];
    [v29 setNumberOfWidgetsOnHomeScreen:(v40 - v10 + v39 + v38)];
    [v29 setNumberOfWidgetsOnLoL:v10];
    v7 = v27;
    id v6 = v28;
    v9 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:underlyingError:", 213456, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 != 0;
}

- (unsigned)sleepShortcutCount:(id)a3
{
  v3 = [a3 sortedVisibleWorkflowsWithType:*MEMORY[0x1E4FB4FC0]];
  unsigned int v4 = [v3 count];

  return v4;
}

- (unsigned)numberOfAppSessions:(id *)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  unsigned int v4 = [(VCMetricSubmitter *)self checkIn];
  id v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = (void *)MEMORY[0x1E4F5B5D0];
  v7 = [v4 intervalStartDate];
  id v8 = [v4 currentDate];
  v9 = [v6 predicateForEventsWithStartOrEndInDateRangeWithFrom:v7 to:v8];
  v29[0] = v9;
  uint64_t v10 = (void *)MEMORY[0x1E4F5B5D0];
  uint64_t v11 = [MEMORY[0x1E4F5B4D0] withBundle:*MEMORY[0x1E4FB4BE8]];
  uint64_t v12 = [v10 predicateForEventsWithIdentifierValue:v11];
  v29[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  uint64_t v14 = [v5 andPredicateWithSubpredicates:v13];

  v15 = (void *)MEMORY[0x1E4F5B518];
  v16 = [MEMORY[0x1E4F5B5F8] appInFocusStream];
  id v28 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  uint64_t v18 = [v15 eventQueryWithPredicate:v14 eventStreams:v17 offset:0 limit:0 sortDescriptors:MEMORY[0x1E4F1CBF0]];

  [v18 setResultType:1];
  [v18 setReadMetadata:0];
  uint64_t v19 = [MEMORY[0x1E4F5B560] knowledgeStore];
  id v27 = 0;
  v20 = [v19 executeQuery:v18 error:&v27];
  id v21 = v27;

  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
  id v23 = v22;

  uint64_t v24 = [v23 firstObject];

  if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v25 = [v24 unsignedIntValue];
  }
  else
  {

    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:underlyingError:", 1296357, v21);
    unsigned int v25 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (unsigned)numberOfShortcutRuns:(id)a3
{
  id v4 = a3;
  id v5 = [(VCMetricSubmitter *)self checkIn];
  id v6 = [v5 intervalStartDate];
  v7 = [v5 currentDate];
  id v8 = [v4 sortedRunEventsWithSource:0 startDate:v6 endDate:v7];

  LODWORD(v4) = [v8 count];
  return v4;
}

- (unsigned)numberOfPersonalAutomationsEnabled:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB7360]) initWithDatabase:v3];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  id v5 = [v4 allConfiguredTriggers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__VCMetricSubmitter_numberOfPersonalAutomationsEnabled___block_invoke;
  v7[3] = &unk_1E6540760;
  v7[4] = &v8;
  [v5 enumerateObjectsUsingBlock:v7];

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __56__VCMetricSubmitter_numberOfPersonalAutomationsEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isEnabled];
  if (result) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (unsigned)folderCount:(id)a3
{
  id v3 = [a3 sortedVisibleFolders];
  unsigned int v4 = [v3 count];

  return v4;
}

- (unsigned)watchShortcutCount:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FB4A70];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithWorkflowType:*MEMORY[0x1E4FB4FC8]];
  v7 = [v4 sortedWorkflowsWithQuery:v6];

  LODWORD(v4) = [v7 count];
  return v4;
}

- (unsigned)uncategorizedShortcutCount:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FB4A70];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithLocation:1];
  id v6 = [v4 sortedWorkflowsWithQuery:v5];

  LODWORD(v4) = [v6 count];
  return v4;
}

- (unsigned)shortcutsCount:(id)a3
{
  return [a3 countOfAllVisibleWorkflows];
}

- (unsigned)averageShortcutCountPerFolder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sortedVisibleFolders];
  unint64_t v5 = [v4 count];

  if (v5) {
    unint64_t v5 = [v3 countOfWorkflowsInAFolder] / v5;
  }

  return v5;
}

- (BOOL)homeAutomationsPresent:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4FB7210] sharedManager];
  if ([v4 status] == 1)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB4C38] code:90210 userInfo:0];
    BOOL v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v26 = v4;
    id v6 = [v4 homesToWhichWeCanAddHomeAutomations];
    uint64_t v23 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v23)
    {
      uint64_t v7 = *(void *)v32;
      unsigned int v25 = v6;
      uint64_t v22 = *(void *)v32;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v32 != v7) {
            objc_enumerationMutation(v6);
          }
          uint64_t v24 = v8;
          v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v10 = [v9 triggers];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v28;
            while (2)
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v28 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = *(id *)(*((void *)&v27 + 1) + 8 * i);
                v16 = v15;
                if (v15)
                {
                  if ([v15 conformsToProtocol:&unk_1F229C628]) {
                    uint64_t v17 = v16;
                  }
                  else {
                    uint64_t v17 = 0;
                  }
                }
                else
                {
                  uint64_t v17 = 0;
                }
                id v18 = v17;

                uint64_t v19 = objc_msgSend(v18, "hf_triggerType");
                if (v19 != 7 && v19)
                {

                  BOOL v5 = 1;
                  goto LABEL_28;
                }
                v20 = getWFEventTrackerLogObject();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  uint64_t v36 = "-[VCMetricSubmitter homeAutomationsPresent:]";
                  __int16 v37 = 2114;
                  int v38 = v16;
                  _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_ERROR, "%s Ignoring trigger of unknown or placeholder type: %{public}@", buf, 0x16u);
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v39 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }

          uint64_t v8 = v24 + 1;
          id v6 = v25;
          uint64_t v7 = v22;
        }
        while (v24 + 1 != v23);
        uint64_t v23 = [v25 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v23);
    }

    BOOL v5 = 0;
LABEL_28:
    id v4 = v26;
  }

  return v5;
}

- (BOOL)hasSeenAutoShortcutsSections
{
  id v3 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  id v4 = [v3 valueForKey:*MEMORY[0x1E4FB7428]];

  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v4 = 0;
    goto LABEL_6;
  }
  BOOL v5 = [(VCMetricCheckIn *)self->_checkIn intervalStartDate];
  uint64_t v6 = [v5 compare:v4];

  if (v6 != -1)
  {
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)personalAutomationsEnabled:(id)a3
{
  return [(VCMetricSubmitter *)self numberOfPersonalAutomationsEnabled:a3] != 0;
}

- (BOOL)isSleepEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB7208]) initWithSleepFeature:1];
  BOOL v3 = [v2 sleepOnboardingStatus] == 1;

  return v3;
}

- (BOOL)isSharingEnabled
{
  return [MEMORY[0x1E4FB72F0] sharingEnabled];
}

- (BOOL)isAppInstalled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v3 = *MEMORY[0x1E4FB4BE8];
  id v9 = 0;
  id v4 = (void *)[v2 initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v9];
  id v5 = v9;
  if (v5)
  {
    uint64_t v6 = getWFEventTrackerLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[VCMetricSubmitter isAppInstalled]";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_FAULT, "%s Error accessing LSApplicationRecord for Shortcuts: %@", buf, 0x16u);
    }
    char v7 = 0;
  }
  else
  {
    uint64_t v6 = [v4 applicationState];
    char v7 = [v6 isInstalled];
  }

  return v7;
}

- (void)perform
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = getWFEventTrackerLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v26 = "-[VCMetricSubmitter perform]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s Attempting to perform checkin", buf, 0xCu);
  }

  id v4 = [(VCMetricSubmitter *)self checkIn];
  char v5 = [v4 isCheckInAllowed];

  if (v5)
  {
    uint64_t v6 = [(VCMetricSubmitter *)self databaseProvider];
    id v24 = 0;
    char v7 = [v6 databaseWithError:&v24];
    uint64_t v8 = v24;

    if (!v7)
    {
      uint64_t v14 = getWFEventTrackerLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v26 = "-[VCMetricSubmitter perform]";
        __int16 v27 = 2114;
        long long v28 = v8;
        _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_INFO, "%s Checkin is not possible because no database is available; %{public}@",
          buf,
          0x16u);
      }
      goto LABEL_16;
    }
    id v9 = [(VCMetricSubmitter *)self event];
    objc_msgSend(v9, "setInstalled:", -[VCMetricSubmitter isAppInstalled](self, "isAppInstalled"));
    objc_msgSend(v9, "setSharingEnabled:", -[VCMetricSubmitter isSharingEnabled](self, "isSharingEnabled"));
    objc_msgSend(v9, "setPersonalAutomationsEnabled:", -[VCMetricSubmitter personalAutomationsEnabled:](self, "personalAutomationsEnabled:", v7));
    objc_msgSend(v9, "setSleepEnabled:", -[VCMetricSubmitter isSleepEnabled](self, "isSleepEnabled"));
    id v23 = 0;
    BOOL v10 = [(VCMetricSubmitter *)self homeAutomationsPresent:&v23];
    id v11 = v23;
    [v9 setHomeAutomationsEnabled:v10];
    objc_msgSend(v9, "setAverageShortcutCountPerFolder:", -[VCMetricSubmitter averageShortcutCountPerFolder:](self, "averageShortcutCountPerFolder:", v7));
    objc_msgSend(v9, "setShortcutsCount:", -[VCMetricSubmitter shortcutsCount:](self, "shortcutsCount:", v7));
    objc_msgSend(v9, "setUncategorizedShortcutCount:", -[VCMetricSubmitter uncategorizedShortcutCount:](self, "uncategorizedShortcutCount:", v7));
    objc_msgSend(v9, "setWatchShortcutCount:", -[VCMetricSubmitter watchShortcutCount:](self, "watchShortcutCount:", v7));
    objc_msgSend(v9, "setFolderCount:", -[VCMetricSubmitter folderCount:](self, "folderCount:", v7));
    objc_msgSend(v9, "setNumberOfPersonalAutomationsEnabled:", -[VCMetricSubmitter numberOfPersonalAutomationsEnabled:](self, "numberOfPersonalAutomationsEnabled:", v7));
    objc_msgSend(v9, "setAppComplicationSlotsUsed:", objc_msgSend(MEMORY[0x1E4FB7180], "appComplicationSlotsUsed"));
    objc_msgSend(v9, "setShortcutComplicationSlotsUsed:", objc_msgSend(MEMORY[0x1E4FB7180], "shortcutComplicationSlotsUsed"));
    objc_msgSend(v9, "setShortcutRunCount:", -[VCMetricSubmitter numberOfShortcutRuns:](self, "numberOfShortcutRuns:", v7));
    id v22 = v11;
    uint64_t v12 = [(VCMetricSubmitter *)self numberOfAppSessions:&v22];
    id v13 = v22;

    [v9 setAppSessionCount:v12];
    objc_msgSend(v9, "setSleepShortcutsCount:", -[VCMetricSubmitter sleepShortcutCount:](self, "sleepShortcutCount:", v7));
    objc_msgSend(v9, "setAutoShortcutsSectionsViewed:", -[VCMetricSubmitter hasSeenAutoShortcutsSections](self, "hasSeenAutoShortcutsSections"));
    id v21 = v13;
    [(VCMetricSubmitter *)self addWidgetMetricsToEvent:v9 error:&v21];
    uint64_t v14 = v21;

    if (v14)
    {
      id v15 = getWFEventTrackerLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v26 = "-[VCMetricSubmitter perform]";
        __int16 v27 = 2114;
        long long v28 = v14;
        v16 = "%s Checkin is not possible because of an error: %{public}@";
        uint64_t v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_FAULT;
        uint32_t v19 = 22;
LABEL_14:
        _os_log_impl(&dword_1C7D7E000, v17, v18, v16, buf, v19);
      }
    }
    else
    {
      [v9 track];
      v20 = [(VCMetricSubmitter *)self checkIn];
      [v20 updateCheckInToNow];

      id v15 = getWFEventTrackerLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v26 = "-[VCMetricSubmitter perform]";
        v16 = "%s Checkin completed successfully";
        uint64_t v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
        uint32_t v19 = 12;
        goto LABEL_14;
      }
    }

LABEL_16:
    goto LABEL_17;
  }
  uint64_t v8 = getWFEventTrackerLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v7 = [MEMORY[0x1E4F1C9C8] date];
    *(_DWORD *)buf = 136315394;
    id v26 = "-[VCMetricSubmitter perform]";
    __int16 v27 = 2112;
    long long v28 = v7;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_INFO, "%s Checkin is not allowed at this time: %@", buf, 0x16u);
LABEL_17:
  }
}

- (VCMetricSubmitter)initWithCheckIn:(id)a3 event:(id)a4 databaseProvider:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    os_log_type_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"VCMetricSubmitter.m", 68, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"VCMetricSubmitter.m", 67, @"Invalid parameter not satisfying: %@", @"checkIn" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  uint32_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"VCMetricSubmitter.m", 69, @"Invalid parameter not satisfying: %@", @"provider" object file lineNumber description];

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)VCMetricSubmitter;
  id v13 = [(VCMetricSubmitter *)&v20 init];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_checkIn, a3);
    objc_storeStrong((id *)&v14->_event, a4);
    objc_storeStrong((id *)&v14->_databaseProvider, a5);
    id v15 = v14;
  }

  return v14;
}

- (VCMetricSubmitter)initWithDatabaseProvider:(id)a3
{
  id v4 = a3;
  char v5 = +[VCMetricCheckIn recentCheckInWithMode:0];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB7288]);
  char v7 = [(VCMetricSubmitter *)self initWithCheckIn:v5 event:v6 databaseProvider:v4];

  return v7;
}

+ (void)performWithDatabaseProvider:(id)a3
{
  id v3 = a3;
  id v4 = (id)[objc_alloc((Class)objc_opt_class()) initWithDatabaseProvider:v3];

  [v4 perform];
}

+ (void)scheduleWithScheduler:(id)a3 databaseProvider:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"VCMetricSubmitter.m", 339, @"Invalid parameter not satisfying: %@", @"scheduler" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"VCMetricSubmitter.m", 340, @"Invalid parameter not satisfying: %@", @"provider" object file lineNumber description];

LABEL_3:
  id v10 = getWFEventTrackerLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [a1 activityIdentifier];
    *(_DWORD *)buf = 136315394;
    uint32_t v19 = "+[VCMetricSubmitter scheduleWithScheduler:databaseProvider:]";
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEBUG, "%s Scheduling metric check in activity: (%{public}@)", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__VCMetricSubmitter_scheduleWithScheduler_databaseProvider___block_invoke;
  v15[3] = &unk_1E65409B0;
  id v16 = v9;
  id v17 = a1;
  id v12 = v9;
  [v7 scheduleWithRunHandler:v15];
}

uint64_t __60__VCMetricSubmitter_scheduleWithScheduler_databaseProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  char v5 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VCMetricSubmitter_scheduleWithScheduler_databaseProvider___block_invoke_2;
  block[3] = &unk_1E6540788;
  id v6 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  dispatch_async(v5, block);

  return 0;
}

uint64_t __60__VCMetricSubmitter_scheduleWithScheduler_databaseProvider___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = getWFEventTrackerLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 48) activityIdentifier];
    int v5 = 136315394;
    id v6 = "+[VCMetricSubmitter scheduleWithScheduler:databaseProvider:]_block_invoke_2";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_INFO, "%s Scheduling metric checkin activity invoked: (%{public}@)", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 48) performWithDatabaseProvider:*(void *)(a1 + 32)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)scheduleWithDatabaseProvider:(id)a3
{
  id v4 = a3;
  int v5 = [WFXPCActivityScheduler alloc];
  id v6 = [a1 activityIdentifier];
  __int16 v7 = [(WFXPCActivityScheduler *)v5 initWithActivityIdentifier:v6];

  [a1 scheduleWithScheduler:v7 databaseProvider:v4];
}

+ (id)activityIdentifier
{
  id result = (id)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"+[VCMetricSubmitter activityIdentifier] must be overridden"];
  __break(1u);
  return result;
}

@end