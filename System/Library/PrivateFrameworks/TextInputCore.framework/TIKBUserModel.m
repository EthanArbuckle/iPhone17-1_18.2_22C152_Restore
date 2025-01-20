@interface TIKBUserModel
+ (TIKBUserModel)userModelWithInputMode:(id)a3 userModelDataStore:(id)a4;
+ (TIKBUserModel)userModelWithInputMode:(id)a3 userModelDataStore:(id)a4 metricDescriptorRegistry:(id)a5 fromDate:(id)a6;
- (Class)userModelValuesClass;
- (TIKBUserModel)initWithInputMode:(id)a3 userModelDataStore:(id)a4 metricDescriptorRegistry:(id)a5 fromDate:(id)a6;
- (TIMetricDescriptorRegistry)metricDescriptorRegistry;
- (id)dictForPowerLog;
- (id)durableCounterKeys;
- (id)settingsDictionary;
- (id)valueForMetricWithName:(id)a3 withContext:(id)a4;
- (id)valuesByBucketedWordLengthForMetricWithName:(id)a3 withContext:(id)a4;
- (void)addDescriptor:(id)a3 toWeeklyMetricKeys:(id)a4;
- (void)addMetric:(id)a3 toWeeklyMetricKeys:(id)a4;
- (void)dispatchFeedbackAnalyzers:(id)a3 aligned:(id)a4 revisionRateAnalysisSummary:(id)a5;
- (void)doLoad;
- (void)sessionDidEnd:(id)a3 aligned:(id)a4;
- (void)trackPowerLogIfNecessary;
@end

@implementation TIKBUserModel

- (void).cxx_destruct
{
}

- (TIMetricDescriptorRegistry)metricDescriptorRegistry
{
  return self->_metricDescriptorRegistry;
}

- (id)valuesByBucketedWordLengthForMetricWithName:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TIUserModel *)self loadIfNecessary];
  v8 = [(TIUserModel *)self valuesFromContext:v6];

  v9 = [v8 metricValuesByWordLength:v7 userModel:self forNumberOfDays:*MEMORY[0x1E4FAEF70]];

  return v9;
}

- (id)valueForMetricWithName:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TIUserModel *)self loadIfNecessary];
  v8 = [(TIUserModel *)self valuesFromContext:v6];

  v9 = [v8 metricValue:v7 userModel:self forNumberOfDays:*MEMORY[0x1E4FAEF70]];

  return v9;
}

- (void)addDescriptor:(id)a3 toWeeklyMetricKeys:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 calculationExpression];

  if (v8)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v9 = objc_msgSend(v6, "calculationDependencies", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [(TIKBUserModel *)self addMetric:*(void *)(*((void *)&v15 + 1) + 8 * v13++) toWeeklyMetricKeys:v7];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v14 = [v6 metricName];
    [v7 addObject:v14];
  }
}

- (void)addMetric:(id)a3 toWeeklyMetricKeys:(id)a4
{
  id v7 = a4;
  id v6 = [(TIMetricDescriptorRegistry *)self->_metricDescriptorRegistry metricDescriptorWithName:a3];
  if (v6 && [v6 isMemberOfClass:objc_opt_class()]) {
    [(TIKBUserModel *)self addDescriptor:v6 toWeeklyMetricKeys:v7];
  }
}

- (void)doLoad
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_metricDescriptorRegistry)
  {
    v3 = +[TIMetricDescriptorRegistry registry];
    metricDescriptorRegistry = self->_metricDescriptorRegistry;
    self->_metricDescriptorRegistry = v3;
  }
  v5 = [(TIUserModel *)self weeklyMetricKeys];

  if (!v5)
  {
    id v6 = objc_opt_new();
    [v6 addObject:kFeatureCounterWithWordLenWordsTypedOnFloatingKeyboard];
    [v6 addObject:kFeatureValueWithWordLenWholeWordsPathed];
    [v6 addObject:kFeatureValueWithWordLenWordCompletionsPathed];
    [v6 addObject:kFeatureValueWithWordLenPathEligibleWordsTapped];
    [v6 addObject:kFeatureValueWithWordLenPathIneligibleWordsTapped];
    [v6 addObject:kFeatureCounterDurationPathedWords];
    [v6 addObject:kFeatureCounterDurationTappedWords];
    [v6 addObject:kFeatureValueWithWordLenWholeWordsPathed];
    [v6 addObject:kFeatureValueWithWordLenWordCompletionsPathed];
    [v6 addObject:kFeatureValueWithWordLenPathEligibleWordsTapped];
    [v6 addObject:kFeatureValueWithWordLenPathIneligibleWordsTapped];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(TIMetricDescriptorRegistry *)self->_metricDescriptorRegistry allMetricDescriptors];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
          if ([v12 isMemberOfClass:objc_opt_class()]) {
            [(TIKBUserModel *)self addDescriptor:v12 toWeeklyMetricKeys:v6];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [v6 allObjects];
    [(TIUserModel *)self setWeeklyMetricKeys:v13];
  }
  v14.receiver = self;
  v14.super_class = (Class)TIKBUserModel;
  [(TIUserModel *)&v14 doLoad];
}

- (void)dispatchFeedbackAnalyzers:(id)a3 aligned:(id)a4 revisionRateAnalysisSummary:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[TIAutocorrectionFeedbackAnalyzer analyzerForUserModel:self revisionRateAnalysisSummary:a5];
  objc_msgSend(v10, "analyzeSession:alignedSession:withConfidence:", v9, v8, objc_msgSend(v10, "evaluateConfidenceInSession:alignedSession:", v9, v8));
}

- (void)sessionDidEnd:(id)a3 aligned:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[TIFavoniusTypingSessionAnalyzer favoniusTypingSessionAnalyzerForUserModel:self];
  objc_msgSend(v8, "analyzeSession:alignedSession:withConfidence:", v7, v6, objc_msgSend(v8, "evaluateConfidenceInSession:alignedSession:", v7, v6));
}

- (id)dictForPowerLog
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = [(TIUserModel *)self contexts];
  uint64_t v53 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  if (v53)
  {
    uint64_t v51 = *(void *)v55;
    double v6 = 0.0;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v55 != v51) {
          objc_enumerationMutation(obj);
        }
        id v9 = [(TIUserModel *)self valuesFromContext:*(void *)(*((void *)&v54 + 1) + 8 * i)];
        id v10 = [v9 getTransientCounterForKey:kFeatureValueWithWordLenPathEligibleWordsTapped];
        uint64_t v11 = [v10 currentCounts];

        if ([v11 count])
        {
          uint64_t v12 = 0;
          do
          {
            uint64_t v13 = [v11 objectAtIndex:v12];
            int v14 = [v13 intValue];

            uint64_t v5 = (v14 + v5);
            uint64_t v4 = (v4 + v14 * (v12++ + 2));
          }
          while (v12 != [v11 count]);
        }
        long long v15 = [v9 getTransientCounterForKey:kFeatureValueWithWordLenPathIneligibleWordsTapped];
        long long v16 = [v15 currentCounts];

        if ([v16 count])
        {
          uint64_t v17 = 0;
          do
          {
            long long v18 = [v16 objectAtIndex:v17];
            int v19 = [v18 intValue];

            uint64_t v5 = (v19 + v5);
            uint64_t v4 = (v4 + v19 * (v17++ + 2));
          }
          while (v17 != [v16 count]);
        }
        uint64_t v20 = [v9 getTransientCounterForKey:kFeatureValueWithWordLenWholeWordsPathed];
        v21 = [v20 currentCounts];

        if ([v21 count])
        {
          uint64_t v22 = 0;
          do
          {
            v23 = [v21 objectAtIndex:v22];
            int v24 = [v23 intValue];

            uint64_t v3 = (v24 + v3);
            uint64_t v2 = (v2 + v24 * (v22++ + 2));
          }
          while (v22 != [v21 count]);
        }
        v25 = [v9 getTransientCounterForKey:kFeatureValueWithWordLenWordCompletionsPathed];
        v26 = [v25 currentCounts];

        if ([v26 count])
        {
          uint64_t v27 = 0;
          do
          {
            v28 = [v26 objectAtIndex:v27];
            int v29 = [v28 intValue];

            uint64_t v3 = (v29 + v3);
            uint64_t v2 = (v2 + v29 * (v27++ + 2));
          }
          while (v27 != [v26 count]);
        }
        v30 = [v9 getTransientCounterForKey:kFeatureCounterDurationTappedWords];
        v31 = [v30 currentCounts];

        if ([v31 count])
        {
          uint64_t v32 = 0;
          do
          {
            v33 = [v31 objectAtIndex:v32];
            [v33 doubleValue];
            double v35 = v34;

            double v7 = v7 + v35;
            ++v32;
          }
          while (v32 != [v31 count]);
        }
        v36 = [v9 getTransientCounterForKey:kFeatureCounterDurationPathedWords];
        v37 = [v36 currentCounts];

        if ([v37 count])
        {
          uint64_t v38 = 0;
          do
          {
            v39 = [v37 objectAtIndex:v38];
            [v39 doubleValue];
            double v41 = v40;

            double v6 = v6 + v41;
            ++v38;
          }
          while (v38 != [v37 count]);
        }
      }
      uint64_t v53 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v53);
  }
  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
  }

  if (v3 | v5)
  {
    v58[0] = @"WordsTapped";
    v43 = [NSNumber numberWithInt:v5];
    v59[0] = v43;
    v58[1] = @"CharactersTapped";
    v44 = [NSNumber numberWithInt:v4];
    v59[1] = v44;
    v58[2] = @"WordsPathed";
    v45 = [NSNumber numberWithInt:v3];
    v59[2] = v45;
    v58[3] = @"CharactersPathed";
    v46 = [NSNumber numberWithInt:v2];
    v59[3] = v46;
    v58[4] = @"TimeSpentPathTyping";
    v47 = [NSNumber numberWithDouble:v6 / 1000.0];
    v59[4] = v47;
    v58[5] = @"TimeSpentTapTyping";
    v48 = [NSNumber numberWithDouble:v7 / 1000.0];
    v59[5] = v48;
    v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:6];
  }
  else
  {
    v42 = 0;
  }

  return v42;
}

- (void)trackPowerLogIfNecessary
{
  [(TIKBUserModel *)self dictForPowerLog];
  if (objc_claimAutoreleasedReturnValue() && PLShouldLogRegisteredEvent()) {
    PLLogRegisteredEvent();
  }

  MEMORY[0x1F4181820]();
}

- (id)settingsDictionary
{
  v21[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  uint64_t v4 = *MEMORY[0x1E4FAE828];
  v21[0] = *MEMORY[0x1E4FAE840];
  v21[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4FAE5F0];
  v21[2] = *MEMORY[0x1E4FAE7A8];
  v21[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4FAE9C0];
  v21[4] = *MEMORY[0x1E4FAE948];
  v21[5] = v6;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v3, "BOOLForPreferenceKey:", v12, (void)v16);
        int v14 = [NSNumber numberWithBool:v13];
        [v2 setObject:v14 forKey:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v2;
}

- (id)durableCounterKeys
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v4[0] = kFeatureCounterTotalWordsTyped;
  v4[1] = kFeatureCounterTotalWordsPathed;
  v4[2] = kFeatureCounterTotalWordsAutocorrected;
  v4[3] = kFeatureCounterTotalWordsFromCandidateBar;
  v4[4] = kFeatureCounterTotalWordsTypedOnFloatingKeyboard;
  v4[5] = kFeatureCounterTotalWordsTypedInSecondaryLanguage;
  v4[6] = kFeedbackCounterAutocorrectionEnablementCorrectedWords;
  v4[7] = kFeedbackCounterAutocorrectionEnablementTappedWords;
  v4[8] = kFeedbackCounterAutocorrectionEnablementRevisedWords;
  v4[9] = kFeedbackCounterAutocorrectionEnablementRevisedCorrectedWords;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];

  return v2;
}

- (Class)userModelValuesClass
{
  return (Class)objc_opt_class();
}

- (TIKBUserModel)initWithInputMode:(id)a3 userModelDataStore:(id)a4 metricDescriptorRegistry:(id)a5 fromDate:(id)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TIKBUserModel;
  uint64_t v12 = [(TIUserModel *)&v15 initWithInputMode:a3 userModelDataStore:a4 weeklyMetricKeys:0 fromDate:a6 explicitTearDown:1];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_metricDescriptorRegistry, a5);
    [(TIUserModel *)v13 setConfigurationDelegate:v13];
  }

  return v13;
}

+ (TIKBUserModel)userModelWithInputMode:(id)a3 userModelDataStore:(id)a4 metricDescriptorRegistry:(id)a5 fromDate:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[TIKBUserModel alloc] initWithInputMode:v12 userModelDataStore:v11 metricDescriptorRegistry:v10 fromDate:v9];

  return v13;
}

+ (TIKBUserModel)userModelWithInputMode:(id)a3 userModelDataStore:(id)a4
{
  return (TIKBUserModel *)[a1 userModelWithInputMode:a3 userModelDataStore:a4 metricDescriptorRegistry:0 fromDate:0];
}

@end