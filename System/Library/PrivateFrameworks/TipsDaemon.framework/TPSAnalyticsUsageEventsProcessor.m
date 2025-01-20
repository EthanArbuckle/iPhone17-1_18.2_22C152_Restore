@interface TPSAnalyticsUsageEventsProcessor
+ (BOOL)_tipStatusValidForLiftProcessing:(id)a3 contextualInfo:(id)a4 firstShownDate:(id)a5;
+ (BOOL)_validateContextualInfo:(id)a3 forDisplayType:(unint64_t)a4;
+ (id)_firstShownDateForTipStatus:(id)a3;
+ (id)_notifiedDateForTipStatus:(id)a3;
+ (id)_preHintRangeOutOfBoundsForIdentifier:(id)a3;
+ (id)_preHintUsageKeyForIdentifier:(id)a3;
+ (id)_usageEventsProcessedKeyForIdentifier:(id)a3;
- (BOOL)_shouldCalculateLift:(id)a3;
- (TPSAnalyticsUsageEventsProcessor)init;
- (void)_calculateLift:(id)a3 completion:(id)a4;
- (void)_countsForEvent:(id)a3 interval:(id)a4 completion:(id)a5;
- (void)_saveHistoricalUsage:(id)a3 completion:(id)a4;
- (void)_savePreHintRangeOutOfBounds:(BOOL)a3 forIdentifier:(id)a4;
- (void)processAnalytics:(id)a3;
- (void)resetAnalytics;
- (void)setCurrentDate:(id)a3;
@end

@implementation TPSAnalyticsUsageEventsProcessor

- (TPSAnalyticsUsageEventsProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)TPSAnalyticsUsageEventsProcessor;
  v2 = [(TPSAnalyticsProcessor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    currentDate = v2->_currentDate;
    v2->_currentDate = (NSDate *)v3;
  }
  return v2;
}

- (void)processAnalytics:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v42 = (void (**)(void))a3;
  v47 = [(TPSAnalyticsProcessor *)self dateLastRun];
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v4 = [(TPSAnalyticsProcessor *)self dataSource];
  id obj = [v4 allTipStatus];

  uint64_t v46 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v65 != v45) {
          objc_enumerationMutation(obj);
        }
        objc_super v6 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        v7 = [v6 identifier];
        v8 = [(TPSAnalyticsProcessor *)self dataSource];
        v9 = [v8 contextualInfoForIdentifier:v7];

        v10 = [(id)objc_opt_class() _firstShownDateForTipStatus:v6];
        v11 = [(id)objc_opt_class() _notifiedDateForTipStatus:v6];
        if ([(id)objc_opt_class() _tipStatusValidForLiftProcessing:v6 contextualInfo:v9 firstShownDate:v10])
        {
          v12 = [v9 usageEvents];
          v13 = [v12 firstObject];

          v14 = [v6 desiredOutcomePerformedDates];
          uint64_t v15 = [v14 count];

          v16 = objc_alloc_init(TPSAnalyticsUsageInfo);
          -[TPSAnalyticsUsageInfo setOverrideHoldout:](v16, "setOverrideHoldout:", [v6 overrideHoldout]);
          [(TPSAnalyticsUsageInfo *)v16 setFirstShownDate:v10];
          [(TPSAnalyticsUsageInfo *)v16 setNotifiedDate:v11];
          [(TPSAnalyticsUsageInfo *)v16 setUsageEvent:v13];
          [(TPSAnalyticsUsageInfo *)v16 setIdentifier:v7];
          [(TPSAnalyticsUsageInfo *)v16 setDesiredOutcomeCount:v15];
          [v43 addObject:v16];
        }
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
    }
    while (v46);
  }

  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  uint64_t v63 = [v43 count];
  v17 = [MEMORY[0x1E4FAF480] analytics];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)v61[3];
    *(_DWORD *)buf = 134217984;
    v70 = v18;
    _os_log_impl(&dword_1E4492000, v17, OS_LOG_TYPE_INFO, "Valid tips for usage event processing: %lu", buf, 0xCu);
  }

  if (v61[3])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke;
    aBlock[3] = &unk_1E6E6C358;
    v59 = &v60;
    v58 = v42;
    v19 = (void (**)(void))_Block_copy(aBlock);
    v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v21 = [v20 dateByAddingUnit:16 value:-5 toDate:self->_currentDate options:0];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v22 = v43;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v68 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v54;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v54 != v24) {
            objc_enumerationMutation(v22);
          }
          v26 = *(void **)(*((void *)&v53 + 1) + 8 * v25);
          if (v47
            && ([*(id *)(*((void *)&v53 + 1) + 8 * v25) firstShownDate],
                v27 = objc_claimAutoreleasedReturnValue(),
                BOOL v28 = [v27 compare:v47] == 1,
                v27,
                !v28))
          {
            if ([(TPSAnalyticsUsageEventsProcessor *)self _shouldCalculateLift:v26])
            {
              v34 = [MEMORY[0x1E4FAF480] analytics];
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                v35 = [v26 identifier];
                *(_DWORD *)buf = 138412290;
                v70 = v35;
                _os_log_impl(&dword_1E4492000, v34, OS_LOG_TYPE_INFO, "Lift threshold hit, calculating lift for: %@", buf, 0xCu);
              }
              v36 = [(TPSAnalyticsProcessor *)self dataSource];
              v37 = [v36 experiment];

              v48[0] = MEMORY[0x1E4F143A8];
              v48[1] = 3221225472;
              v48[2] = __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke_6;
              v48[3] = &unk_1E6E6C380;
              v48[4] = self;
              v48[5] = v26;
              id v49 = v47;
              id v50 = v21;
              id v38 = v37;
              id v51 = v38;
              v52 = v19;
              [(TPSAnalyticsUsageEventsProcessor *)self _calculateLift:v26 completion:v48];
            }
            else
            {
              v39 = [MEMORY[0x1E4FAF480] analytics];
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                v40 = [v26 identifier];
                *(_DWORD *)buf = 138412290;
                v70 = v40;
                _os_log_impl(&dword_1E4492000, v39, OS_LOG_TYPE_INFO, "Lift threshold not yet hit for: %@", buf, 0xCu);
              }
              v19[2](v19);
            }
          }
          else
          {
            v29 = [MEMORY[0x1E4FAF480] analytics];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = [v26 identifier];
              *(_DWORD *)buf = 138412290;
              v70 = v30;
              _os_log_impl(&dword_1E4492000, v29, OS_LOG_TYPE_INFO, "Tip shown since last run, saving historical usage: %@", buf, 0xCu);
            }
            v31 = [v26 firstShownDate];
            BOOL v32 = [v31 compare:v21] == -1;

            if (v32)
            {
              v33 = [v26 identifier];
              [(TPSAnalyticsUsageEventsProcessor *)self _savePreHintRangeOutOfBounds:1 forIdentifier:v33];
            }
            [(TPSAnalyticsUsageEventsProcessor *)self _saveHistoricalUsage:v26 completion:v19];
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v41 = [v22 countByEnumeratingWithState:&v53 objects:v68 count:16];
        uint64_t v23 = v41;
      }
      while (v41);
    }
  }
  else
  {
    v42[2]();
  }
  _Block_object_dispose(&v60, 8);
}

void __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke_2;
  block[3] = &unk_1E6E6C358;
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  long long v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke_2(uint64_t result)
{
  if (!--*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = [*(id *)(a1 + 40) identifier];
  v9 = [v7 _preHintRangeOutOfBoundsForIdentifier:v8];
  v10 = [v6 loadValueForKey:v9 class:objc_opt_class()];
  uint64_t v11 = [v10 BOOLValue];

  BOOL v12 = [*(id *)(a1 + 48) compare:*(void *)(a1 + 56)] == -1;
  v13 = [TPSAnalyticsEventProcessedUsageEvents alloc];
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 64);
  v16 = [MEMORY[0x1E4F1C9C8] date];
  id v22 = [(TPSAnalyticsEventProcessedUsageEvents *)v13 initWithUsageInfo:v14 experiment:v15 preHintUsageCount:a2 postHintUsageCount:a3 preHintRangeOutOfBounds:v11 postHintRangeOutOfBounds:v12 date:v16];

  v17 = [MEMORY[0x1E4FAF380] sharedInstance];
  [v17 logAnalyticsEvent:v22];

  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = [*(id *)(a1 + 40) identifier];
  v21 = [v19 _usageEventsProcessedKeyForIdentifier:v20];
  [v18 saveValue:MEMORY[0x1E4F1CC38] forKey:v21];

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (void)resetAnalytics
{
  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsUsageEventsProcessor;
  [(TPSAnalyticsProcessor *)&v7 resetAnalytics];
  [(TPSAnalyticsProcessor *)self setDateLastRun:0];
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  long long v4 = [v3 dictionaryRepresentation];

  v5 = [v4 allKeys];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__TPSAnalyticsUsageEventsProcessor_resetAnalytics__block_invoke;
  v6[3] = &unk_1E6E6C3A8;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __50__TPSAnalyticsUsageEventsProcessor_resetAnalytics__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasPrefix:@"TPSAnalyticsUsageEvents"]) {
    [(id)objc_opt_class() saveValue:0 forKey:v2];
  }
}

- (BOOL)_shouldCalculateLift:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FAF450] crunchingIntervalInDays];
  if (v5)
  {
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v6 = 20;
    }
    else {
      uint64_t v6 = v5;
    }
    objc_super v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v8 = [v7 dateByAddingUnit:16 value:-v6 toDate:self->_currentDate options:0];

    v9 = [v4 firstShownDate];
    BOOL v10 = [v9 compare:v8] == -1;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_calculateLift:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v6 firstShownDate];
  BOOL v10 = [v8 dateByAddingUnit:16 value:19 toDate:v9 options:0];

  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  BOOL v12 = [v6 firstShownDate];
  v13 = (void *)[v11 initWithStartDate:v12 endDate:v10];

  uint64_t v14 = [v6 usageEvent];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__TPSAnalyticsUsageEventsProcessor__calculateLift_completion___block_invoke;
  v17[3] = &unk_1E6E6C3D0;
  v17[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v15 = v7;
  id v16 = v6;
  [(TPSAnalyticsUsageEventsProcessor *)self _countsForEvent:v14 interval:v13 completion:v17];
}

uint64_t __62__TPSAnalyticsUsageEventsProcessor__calculateLift_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  id v4 = [*(id *)(a1 + 40) identifier];
  uint64_t v5 = [v3 _preHintUsageKeyForIdentifier:v4];
  id v6 = [v2 loadValueForKey:v5 class:objc_opt_class()];
  [v6 integerValue];

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v7();
}

- (void)_savePreHintRangeOutOfBounds:(BOOL)a3 forIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v8 = [(id)objc_opt_class() _preHintRangeOutOfBoundsForIdentifier:v5];

  id v6 = objc_opt_class();
  id v7 = [NSNumber numberWithBool:v4];
  [v6 saveValue:v7 forKey:v8];
}

- (void)_saveHistoricalUsage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v6 firstShownDate];
  BOOL v10 = [v8 dateByAddingUnit:16 value:-20 toDate:v9 options:0];

  id v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  BOOL v12 = [v6 firstShownDate];
  v13 = [v11 dateByAddingUnit:16 value:-1 toDate:v12 options:0];

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 endDate:v13];
  id v15 = [v6 usageEvent];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__TPSAnalyticsUsageEventsProcessor__saveHistoricalUsage_completion___block_invoke;
  v18[3] = &unk_1E6E6C3D0;
  v18[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  [(TPSAnalyticsUsageEventsProcessor *)self _countsForEvent:v15 interval:v14 completion:v18];
}

void __68__TPSAnalyticsUsageEventsProcessor__saveHistoricalUsage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_opt_class();
  id v5 = [*(id *)(a1 + 40) identifier];
  id v6 = [v4 _preHintUsageKeyForIdentifier:v5];

  id v7 = [MEMORY[0x1E4FAF480] analytics];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [NSNumber numberWithUnsignedInteger:a2];
    int v11 = 138412546;
    BOOL v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1E4492000, v7, OS_LOG_TYPE_INFO, "Saving value: %@ for key: %@", (uint8_t *)&v11, 0x16u);
  }
  v9 = objc_opt_class();
  BOOL v10 = [NSNumber numberWithUnsignedInteger:a2];
  [v9 saveValue:v10 forKey:v6];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_countsForEvent:(id)a3 interval:(id)a4 completion:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4FAF3D8];
  id v8 = (void (**)(id, uint64_t))a5;
  v8[2](v8, [v7 countsForEvent:a3 interval:a4]);
}

+ (id)_preHintUsageKeyForIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_%@_PreHintUsage", @"TPSAnalyticsUsageEvents", a3];
}

+ (id)_preHintRangeOutOfBoundsForIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_%@_PreHintRangeOutOfBounds", @"TPSAnalyticsUsageEvents", a3];
}

+ (id)_usageEventsProcessedKeyForIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@_%@_UsageEventsProcessed", @"TPSAnalyticsUsageEvents", a3];
}

+ (id)_firstShownDateForTipStatus:(id)a3
{
  id v3 = a3;
  if ([v3 displayType] && objc_msgSend(v3, "displayType") != 1)
  {
    id v5 = [v3 hintWouldHaveBeenDisplayedDate];
    id v6 = v5;
    if (v5)
    {
      id v4 = v5;
    }
    else
    {
      id v7 = [v3 hintDisplayedDates];
      id v4 = [v7 firstObject];
    }
  }
  else
  {
    id v4 = [v3 contentViewedDate];
  }

  return v4;
}

+ (id)_notifiedDateForTipStatus:(id)a3
{
  id v3 = a3;
  if ([v3 displayType] && objc_msgSend(v3, "displayType") != 1)
  {
    id v6 = 0;
  }
  else
  {
    id v4 = [v3 hintWouldHaveBeenDisplayedDate];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v7 = [v3 hintDisplayedDates];
      id v6 = [v7 firstObject];
    }
  }

  return v6;
}

+ (BOOL)_tipStatusValidForLiftProcessing:(id)a3 contextualInfo:(id)a4 firstShownDate:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = objc_opt_class();
  int v11 = [v9 identifier];
  BOOL v12 = [v10 _usageEventsProcessedKeyForIdentifier:v11];
  __int16 v13 = [a1 loadValueForKey:v12 class:objc_opt_class()];
  char v14 = [v13 BOOLValue];

  uint64_t v15 = objc_opt_class();
  uint64_t v16 = [v9 displayType];

  char v17 = [v15 _validateContextualInfo:v8 forDisplayType:v16];
  if (a5) {
    char v18 = v17;
  }
  else {
    char v18 = 0;
  }
  return v18 & (v14 ^ 1);
}

+ (BOOL)_validateContextualInfo:(id)a3 forDisplayType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    BOOL v7 = v5 != 0;
  }
  else
  {
    id v8 = [v5 usageEvents];
    if ([v8 count])
    {
      BOOL v7 = 1;
    }
    else
    {
      id v9 = [v6 desiredOutcomeCondition];
      BOOL v10 = [v9 rules];
      BOOL v7 = [v10 count] != 0;
    }
  }

  return v7;
}

- (void)setCurrentDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end