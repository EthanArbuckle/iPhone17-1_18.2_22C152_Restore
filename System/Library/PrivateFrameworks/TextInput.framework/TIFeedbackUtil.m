@interface TIFeedbackUtil
+ (BOOL)getFinalPreferenceValue;
+ (BOOL)getInitialPreferenceValue;
+ (BOOL)isEligibleDevice;
+ (BOOL)isFeatureEnabledForInternalBuilds;
+ (BOOL)isStudyForFCS;
+ (BOOL)migratePreviousStudyStateAndCheckPreviousEnrollment;
+ (BOOL)shouldOverrideLanguageRegionCheck;
+ (BOOL)shouldPublishCAEventsImmediately;
+ (BOOL)supportedLanguagesHaveRegions:(id)a3;
+ (id)getCompletionEventTimestamp;
+ (id)getFinalInputModes;
+ (id)getFinalTimestamp;
+ (id)getFormIdentifier;
+ (id)getFormMetadata;
+ (id)getInitialInputModes;
+ (id)getInitialTimestamp;
+ (id)getInitiationEventTimestamp;
+ (id)getKeyNameFor:(id)a3;
+ (id)getPreferenceKey;
+ (id)getRequestSurveyEventTimestamp;
+ (id)getRetryTimestamp;
+ (id)getStateKey;
+ (id)getStudyEnrollment;
+ (id)getStudyID;
+ (id)getStudyLanguageAndRegion;
+ (id)getSupportedFeedbackLanguages;
+ (id)getSupportedLangRegion;
+ (id)getSupportedLangRegionFromSupportedFeedbackLanguages:(id)a3;
+ (int64_t)getBucketedDuration;
+ (int64_t)getFeedbackState;
+ (int64_t)getSurveyOutcome;
+ (void)clearStudyState;
+ (void)clearStudyState:(id)a3;
+ (void)removeCompletionEventTimestamp;
+ (void)removeFeedbackState;
+ (void)removeFinalInputModes;
+ (void)removeFinalPreferenceValue;
+ (void)removeFinalTimestamp;
+ (void)removeInitialInputModes;
+ (void)removeInitialPreferenceValue;
+ (void)removeInitialTimestamp;
+ (void)removeInitiationEventTimestamp;
+ (void)removeRequestSurveyEventTimestamp;
+ (void)removeRetryTimestamp;
+ (void)removeStudyLanguageAndRegion;
+ (void)removeSurveyOutcome;
+ (void)setCompletionEventTimestamp:(id)a3;
+ (void)setFeedbackState:(int64_t)a3;
+ (void)setFinalInputModes:(id)a3;
+ (void)setFinalPreferenceValue:(BOOL)a3;
+ (void)setFinalTimestamp:(id)a3;
+ (void)setInitialInputModes:(id)a3;
+ (void)setInitialPreferenceValue:(BOOL)a3;
+ (void)setInitialTimestamp:(id)a3;
+ (void)setInitiationEventTimestamp:(id)a3;
+ (void)setRequestSurveyEventTimestamp:(id)a3;
+ (void)setRetryTimestamp:(id)a3;
+ (void)setStudyEnrollment;
+ (void)setStudyEnrollment:(id)a3;
+ (void)setStudyLanguageAndRegion:(id)a3;
+ (void)setSurveyOutcome:(int64_t)a3;
@end

@implementation TIFeedbackUtil

+ (id)getFormMetadata
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v3 = +[TIFeedbackUtil getBucketedDuration];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v3);
  [v2 setObject:v4 forKey:@":duration"];
  if (+[TIFeedbackUtil getInitialPreferenceValue]) {
    v5 = @"1";
  }
  else {
    v5 = @"0";
  }
  [v2 setObject:v5 forKey:@":initialPreferenceValue"];

  return v2;
}

+ (id)getFormIdentifier
{
  v2 = +[TIFeedbackUtil getStudyLanguageAndRegion];
  if (v2)
  {
    int64_t v3 = v2;
    v4 = [v2 stringByReplacingOccurrencesOfString:@"_" withString:&stru_1EDBDCE38];

    v5 = [@"framework-autocorrect_" stringByAppendingString:@"S03_FCS"];
    v6 = [v5 stringByAppendingString:@"_"];
    v7 = [v6 stringByAppendingString:v4];
  }
  else
  {
    v7 = &stru_1EDBDCE38;
  }

  return v7;
}

+ (void)removeStudyLanguageAndRegion
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackStudyLanguageRegionKey"];
  int64_t v3 = +[TIFeedbackUtil getKeyNameFor:v2];
  [v4 removeObjectForKey:v3];
}

+ (void)setStudyLanguageAndRegion:(id)a3
{
  int64_t v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  v5 = +[TIFeedbackUtil getKeyNameFor:@"feedbackStudyLanguageRegionKey"];
  [v6 setObject:v4 forKey:v5];
}

+ (id)getStudyLanguageAndRegion
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  int64_t v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackStudyLanguageRegionKey"];
  id v4 = [v2 objectForKey:v3];

  return v4;
}

+ (int64_t)getBucketedDuration
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = +[TIFeedbackUtil getFinalTimestamp];
  int64_t v3 = +[TIFeedbackUtil getInitialTimestamp];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [&unk_1EDC28690 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      int v11 = v8 + v7;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(&unk_1EDC28690);
        }
        if (v5 < (double)(int)[*(id *)(*((void *)&v13 + 1) + 8 * v10) intValue]) {
          return v8 + (int)v10;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [&unk_1EDC28690 countByEnumeratingWithState:&v13 objects:v17 count:16];
      int v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    return 0;
  }
  return v11;
}

+ (void)removeRetryTimestamp
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackRetryTimestamp_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setRetryTimestamp:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  double v5 = +[TIFeedbackUtil getKeyNameFor:@"feedbackRetryTimestamp_"];
  [v6 setObject:v4 forKey:v5];
}

+ (id)getRetryTimestamp
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackRetryTimestamp_"];
  id v4 = [v2 objectForKey:v3];

  return v4;
}

+ (void)removeSurveyOutcome
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackSurveyOutcome_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setSurveyOutcome:(int64_t)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v4 = +[TIFeedbackUtil getKeyNameFor:@"feedbackSurveyOutcome_"];
  [v5 setInteger:a3 forKey:v4];
}

+ (int64_t)getSurveyOutcome
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackSurveyOutcome_"];
  int64_t v4 = [v2 integerForKey:v3];

  return v4;
}

+ (void)removeCompletionEventTimestamp
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackCompletionEventTimestamp_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setCompletionEventTimestamp:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  id v5 = +[TIFeedbackUtil getKeyNameFor:@"feedbackCompletionEventTimestamp_"];
  [v6 setObject:v4 forKey:v5];
}

+ (id)getCompletionEventTimestamp
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackCompletionEventTimestamp_"];
  id v4 = [v2 objectForKey:v3];

  return v4;
}

+ (void)removeRequestSurveyEventTimestamp
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackSurveyRequestEventTimestamp_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setRequestSurveyEventTimestamp:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  id v5 = +[TIFeedbackUtil getKeyNameFor:@"feedbackSurveyRequestEventTimestamp_"];
  [v6 setObject:v4 forKey:v5];
}

+ (id)getRequestSurveyEventTimestamp
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackSurveyRequestEventTimestamp_"];
  id v4 = [v2 objectForKey:v3];

  return v4;
}

+ (void)removeInitiationEventTimestamp
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitiationEventTimestamp_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setInitiationEventTimestamp:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  id v5 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitiationEventTimestamp_"];
  [v6 setObject:v4 forKey:v5];
}

+ (id)getInitiationEventTimestamp
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitiationEventTimestamp_"];
  id v4 = [v2 objectForKey:v3];

  return v4;
}

+ (void)removeFinalTimestamp
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackFinalTimestamp_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setFinalTimestamp:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  id v5 = +[TIFeedbackUtil getKeyNameFor:@"feedbackFinalTimestamp_"];
  [v6 setObject:v4 forKey:v5];
}

+ (id)getFinalTimestamp
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackFinalTimestamp_"];
  id v4 = [v2 objectForKey:v3];

  return v4;
}

+ (void)removeInitialTimestamp
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitialTimestamp_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setInitialTimestamp:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  id v5 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitialTimestamp_"];
  [v6 setObject:v4 forKey:v5];
}

+ (id)getInitialTimestamp
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitialTimestamp_"];
  id v4 = [v2 objectForKey:v3];

  return v4;
}

+ (void)removeFinalInputModes
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackFinalInputModes_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setFinalInputModes:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  id v5 = +[TIFeedbackUtil getKeyNameFor:@"feedbackFinalInputModes_"];
  [v6 setObject:v4 forKey:v5];
}

+ (id)getFinalInputModes
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackFinalInputModes_"];
  id v4 = [v2 stringArrayForKey:v3];

  return v4;
}

+ (void)removeInitialInputModes
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitialInputModes_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setInitialInputModes:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  id v5 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitialInputModes_"];
  [v6 setObject:v4 forKey:v5];
}

+ (id)getInitialInputModes
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitialInputModes_"];
  id v4 = [v2 stringArrayForKey:v3];

  return v4;
}

+ (void)removeFinalPreferenceValue
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackFinalPreferenceValue_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setFinalPreferenceValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v4 = +[TIFeedbackUtil getKeyNameFor:@"feedbackFinalPreferenceValue_"];
  [v5 setBool:v3 forKey:v4];
}

+ (BOOL)getFinalPreferenceValue
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  BOOL v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackFinalPreferenceValue_"];
  char v4 = [v2 BOOLForKey:v3];

  return v4;
}

+ (void)removeInitialPreferenceValue
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitialPreferenceValue_"];
  [v3 removeObjectForKey:v2];
}

+ (void)setInitialPreferenceValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  char v4 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitialPreferenceValue_"];
  [v5 setBool:v3 forKey:v4];
}

+ (BOOL)getInitialPreferenceValue
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  BOOL v3 = +[TIFeedbackUtil getKeyNameFor:@"feedbackInitialPreferenceValue_"];
  char v4 = [v2 BOOLForKey:v3];

  return v4;
}

+ (void)removeFeedbackState
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  v2 = +[TIFeedbackUtil getStateKey];
  [v3 removeObjectForKey:v2];
}

+ (void)setFeedbackState:(int64_t)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  char v4 = +[TIFeedbackUtil getStateKey];
  [v5 setInteger:a3 forKey:v4];
}

+ (int64_t)getFeedbackState
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = +[TIFeedbackUtil getStateKey];
  int64_t v4 = [v2 integerForKey:v3];

  return v4;
}

+ (BOOL)isStudyForFCS
{
  return 1;
}

+ (id)getStudyEnrollment
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  id v3 = [v2 stringForKey:@"feedbackLastStudyEnrollment"];

  return v3;
}

+ (void)setStudyEnrollment
{
}

+ (void)setStudyEnrollment:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  [v5 setObject:v4 forKey:@"feedbackLastStudyEnrollment"];
}

+ (void)clearStudyState:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v18 = (id)[[v3 alloc] initWithSuiteName:@"com.apple.keyboard"];
  id v5 = [@"feedbackState_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v5];

  id v6 = [@"feedbackInitialInputModes_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v6];

  uint64_t v7 = [@"feedbackInitialTimestamp_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v7];

  int v8 = [@"feedbackInitialPreferenceValue_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v8];

  uint64_t v9 = [@"feedbackFinalInputModes_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v9];

  uint64_t v10 = [@"feedbackFinalTimestamp_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v10];

  int v11 = [@"feedbackFinalPreferenceValue_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v11];

  v12 = [@"feedbackSurveyOutcome_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v12];

  long long v13 = [@"feedbackCompletionEventTimestamp_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v13];

  long long v14 = [@"feedbackInitiationEventTimestamp_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v14];

  long long v15 = [@"feedbackSurveyRequestEventTimestamp_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v15];

  long long v16 = [@"feedbackRetryTimestamp_KeyboardAutocorrection_" stringByAppendingString:v4];
  [v18 removeObjectForKey:v16];

  v17 = [@"feedbackStudyLanguageRegionKeyKeyboardAutocorrection_" stringByAppendingString:v4];

  [v18 removeObjectForKey:v17];
}

+ (void)clearStudyState
{
  id v2 = +[TIFeedbackUtil getStudyEnrollment];
  if ([v2 length]) {
    +[TIFeedbackUtil clearStudyState:v2];
  }
}

+ (BOOL)migratePreviousStudyStateAndCheckPreviousEnrollment
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  if ([v2 integerForKey:@"feedbackState_KeyboardAutocorrection"])
  {
    +[TIFeedbackUtil setStudyEnrollment:@"S01"];
    [v2 removeObjectForKey:@"feedbackFeatureEnabled_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackState_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackInitialInputModes_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackInitialTimestamp_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackInitialPreferenceValue_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackFinalInputModes_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackFinalTimestamp_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackFinalPreferenceValue_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackSurveyOutcome_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackInitiationEventTimestamp_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackCompletionEventTimestamp_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackCountsRetained_KeyboardAutocorrection"];
    [v2 removeObjectForKey:@"feedbackStudyLanguageRegionKeyKeyboardAutocorrection"];
    BOOL v3 = 1;
  }
  else
  {
    id v4 = +[TIFeedbackUtil getStudyEnrollment];
    if ([v4 length] && (objc_msgSend(v4, "isEqualToString:", @"S03_FCS") & 1) == 0)
    {
      +[TIFeedbackUtil clearStudyState:v4];
      BOOL v3 = 1;
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return v3;
}

+ (BOOL)shouldPublishCAEventsImmediately
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  char v3 = [v2 BOOLForKey:@"feedbackPublishCAEventsImmediately"];

  return v3;
}

+ (BOOL)isFeatureEnabledForInternalBuilds
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  char v3 = [v2 BOOLForKey:@"feedbackFeatureEnabled"];

  return v3;
}

+ (BOOL)isEligibleDevice
{
  if (+[TIFeedbackUtil migratePreviousStudyStateAndCheckPreviousEnrollment])
  {
    return 0;
  }
  char v3 = +[TIFeedbackUtil getSupportedLangRegion];
  BOOL v2 = [v3 length] != 0;

  return v2;
}

+ (id)getSupportedLangRegionFromSupportedFeedbackLanguages:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__261;
  v17 = __Block_byref_object_dispose__262;
  id v18 = &stru_1EDBDCE38;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__TIFeedbackUtil_getSupportedLangRegionFromSupportedFeedbackLanguages___block_invoke;
  v10[3] = &unk_1E555A588;
  v12 = &v13;
  id v4 = v3;
  id v11 = v4;
  id v5 = (void (**)(void))MEMORY[0x192F9B5E0](v10);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v5[2](v5);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__TIFeedbackUtil_getSupportedLangRegionFromSupportedFeedbackLanguages___block_invoke_2;
    v8[3] = &unk_1E5559010;
    uint64_t v9 = v5;
    TIDispatchSync(MEMORY[0x1E4F14428], v8);
  }
  id v6 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v6;
}

void __71__TIFeedbackUtil_getSupportedLangRegionFromSupportedFeedbackLanguages___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[TIInputModeController sharedInputModeController];
  id v3 = [v2 enabledInputModeIdentifiers];

  if (+[TIFeedbackUtil shouldOverrideLanguageRegionCheck])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = TIInputModeGetLanguageWithRegion(*(void **)(*((void *)&v29 + 1) + 8 * i));
          uint64_t v10 = +[TIFeedbackUtil getSupportedFeedbackLanguages];
          int v11 = [v10 containsObject:v9];

          if (v11) {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    BOOL v12 = +[TIFeedbackUtil supportedLanguagesHaveRegions:*(void *)(a1 + 32)];
    if (v12)
    {
      uint64_t v13 = [v4 languageIdentifier];
      long long v14 = [v4 languageIdentifier];
      uint64_t v15 = [v14 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    }
    else
    {
      uint64_t v15 = [v4 languageCode];
    }
    if ([*(id *)(a1 + 32) containsObject:v15])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v16 = v3;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v26;
        while (2)
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v25 + 1) + 8 * j);
            if (v12) {
              TIInputModeGetLanguageWithRegion(v21);
            }
            else {
            v22 = TIInputModeGetLanguage(v21);
            }
            if (objc_msgSend(v22, "isEqualToString:", v15, (void)v25))
            {
              uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
              v24 = *(void **)(v23 + 40);
              *(void *)(v23 + 40) = v22;

              goto LABEL_29;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_29:
    }
  }
}

uint64_t __71__TIFeedbackUtil_getSupportedLangRegionFromSupportedFeedbackLanguages___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)getSupportedLangRegion
{
  BOOL v2 = +[TIFeedbackUtil getSupportedFeedbackLanguages];
  id v3 = +[TIFeedbackUtil getSupportedLangRegionFromSupportedFeedbackLanguages:v2];

  return v3;
}

+ (BOOL)shouldOverrideLanguageRegionCheck
{
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.keyboard"];
  char v3 = [v2 BOOLForKey:@"feedbackOverrideDeviceLanguageCheck"];

  return v3;
}

+ (id)getSupportedFeedbackLanguages
{
  return &unk_1EDC28678;
}

+ (id)getStudyID
{
  BOOL v2 = [@"_" stringByAppendingString:@"S03_FCS"];
  char v3 = [@"KeyboardAutocorrection" stringByAppendingString:v2];

  return v3;
}

+ (id)getPreferenceKey
{
  return @"KeyboardAutocorrection";
}

+ (BOOL)supportedLanguagesHaveRegions:(id)a3
{
  char v3 = [a3 objectAtIndex:0];
  char v4 = [v3 containsString:@"_"];

  return v4;
}

+ (id)getStateKey
{
  return +[TIFeedbackUtil getKeyNameFor:@"feedbackState_"];
}

+ (id)getKeyNameFor:(id)a3
{
  id v3 = a3;
  char v4 = +[TIFeedbackUtil getStudyID];
  uint64_t v5 = [v3 stringByAppendingString:v4];

  return v5;
}

@end