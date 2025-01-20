@interface TIPreferencesAnalyzer
+ (id)normalizedInputModeIdentifierGroupsFromInputModes:(id)a3;
- (TIPreferencesAnalyzer)init;
- (TIPreferencesAnalyzer)initWithRegistry:(id)a3;
- (TIPreferencesAnalyzerRegistry)registry;
- (id)_createEventSpecForTextInputUserPreferenceChanges;
- (id)_createEventSpecForTextInputUserPreferenceState;
- (void)_dispatchEventPayloadWithPreferenceNameToChangesEvent:(id)a3 activeInputModes:(id)a4 currentValue:(id)a5 previousValue:(id)a6 changedAt:(id)a7 analyzedAt:(id)a8 buildAtChange:(id)a9 isFreshInstall:(BOOL)a10 approxDateOfBuildInstall:(id)a11 buildAtLastAnalysis:(id)a12;
- (void)_dispatchEventPayloadWithPreferenceNameToStateEvent:(id)a3 activeInputModes:(id)a4 currentValue:(id)a5;
- (void)_recordAnalysisOfPreferenceKey:(id)a3 inDomain:(id)a4;
- (void)_registerAnalyticsEventSpecWithAnalyticsService;
- (void)_resetChangedAtForPreferenceKey:(id)a3 inDomain:(id)a4;
- (void)_updateApproxBuildAtLastAnalysisWithBuild:(id)a3 andApproxDateOfInstall:(id)a4 ForPreferenceKey:(id)a5 inDomain:(id)a6;
- (void)analyzeRegisteredPreferences;
- (void)setRegistry:(id)a3;
@end

@implementation TIPreferencesAnalyzer

- (void).cxx_destruct
{
}

- (void)setRegistry:(id)a3
{
}

- (TIPreferencesAnalyzerRegistry)registry
{
  return (TIPreferencesAnalyzerRegistry *)objc_getProperty(self, a2, 8, 1);
}

- (id)_createEventSpecForTextInputUserPreferenceState
{
  if (_createEventSpecForTextInputUserPreferenceState_onceToken != -1) {
    dispatch_once(&_createEventSpecForTextInputUserPreferenceState_onceToken, &__block_literal_global_46);
  }
  v2 = (void *)_createEventSpecForTextInputUserPreferenceState___eventSpec;

  return v2;
}

void __72__TIPreferencesAnalyzer__createEventSpecForTextInputUserPreferenceState__block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"preferenceName"];
  v1 = objc_msgSend(MEMORY[0x1E4FAE250], "stringFieldSpecWithName:", @"activeInputModes", v0);
  v6[1] = v1;
  v2 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"currentValue"];
  v6[2] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];

  uint64_t v4 = [MEMORY[0x1E4FAE248] eventSpecWithName:@"textInputUserPreferenceState" inputModeRequired:0 fieldSpecs:v3];
  v5 = (void *)_createEventSpecForTextInputUserPreferenceState___eventSpec;
  _createEventSpecForTextInputUserPreferenceState___eventSpec = v4;
}

- (id)_createEventSpecForTextInputUserPreferenceChanges
{
  if (_createEventSpecForTextInputUserPreferenceChanges_onceToken != -1) {
    dispatch_once(&_createEventSpecForTextInputUserPreferenceChanges_onceToken, &__block_literal_global_8299);
  }
  v2 = (void *)_createEventSpecForTextInputUserPreferenceChanges___eventSpec;

  return v2;
}

void __74__TIPreferencesAnalyzer__createEventSpecForTextInputUserPreferenceChanges__block_invoke()
{
  v16[10] = *MEMORY[0x1E4F143B8];
  v15 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"preferenceName"];
  v16[0] = v15;
  v14 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"activeInputModes"];
  v16[1] = v14;
  v13 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"previousValue"];
  v16[2] = v13;
  v0 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"currentValue"];
  v16[3] = v0;
  v1 = (void *)MEMORY[0x1E4FAE250];
  v2 = [NSNumber numberWithUnsignedInteger:1];
  v3 = [NSNumber numberWithUnsignedInteger:5];
  uint64_t v4 = [v1 integerFieldSpecWithName:@"daysSinceLastChangeBucket" minValue:v2 maxValue:v3 significantDigits:0];
  v16[4] = v4;
  v5 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"daysSinceUpgradeToOff" minValue:&unk_1F3FA7BF8 maxValue:0 significantDigits:0];
  v16[5] = v5;
  v6 = [MEMORY[0x1E4FAE250] integerFieldSpecWithName:@"daysSinceLastChange" minValue:&unk_1F3FA7BF8 maxValue:0 significantDigits:0];
  v16[6] = v6;
  v7 = [MEMORY[0x1E4FAE250] stringFieldSpecWithName:@"buildAtChange"];
  v16[7] = v7;
  v8 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"valueDidChange"];
  v16[8] = v8;
  v9 = [MEMORY[0x1E4FAE250] BOOLeanFieldSpecWithName:@"isNewUser"];
  v16[9] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:10];

  uint64_t v11 = [MEMORY[0x1E4FAE248] eventSpecWithName:@"textInputUserPreferenceChanges" inputModeRequired:0 fieldSpecs:v10];
  v12 = (void *)_createEventSpecForTextInputUserPreferenceChanges___eventSpec;
  _createEventSpecForTextInputUserPreferenceChanges___eventSpec = v11;
}

- (void)_registerAnalyticsEventSpecWithAnalyticsService
{
  id v6 = [(TIPreferencesAnalyzer *)self _createEventSpecForTextInputUserPreferenceChanges];
  v3 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v3 registerEventSpec:v6];

  uint64_t v4 = [(TIPreferencesAnalyzer *)self _createEventSpecForTextInputUserPreferenceState];
  v5 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v5 registerEventSpec:v4];
}

- (void)_dispatchEventPayloadWithPreferenceNameToStateEvent:(id)a3 activeInputModes:(id)a4 currentValue:(id)a5
{
  id v17 = a5;
  v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  [v10 setObject:v9 forKey:@"preferenceName"];

  uint64_t v11 = [v8 componentsJoinedByString:@", "];

  [v10 setObject:v11 forKey:@"activeInputModes"];
  if (v17)
  {
    id v12 = v17;
    if ([MEMORY[0x1E4FAE268] isBoolean:v12])
    {
      int v13 = [v12 BOOLValue];
      v14 = &unk_1F3FA7BF8;
      if (v13) {
        v14 = &unk_1F3FA7BE0;
      }
      id v15 = v14;

      id v12 = v15;
    }
    [v10 setObject:v12 forKey:@"currentValue"];
  }
  else
  {
    [v10 setObject:&unk_1F3FA7BF8 forKey:@"currentValue"];
  }
  v16 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v16 dispatchEventWithName:@"textInputUserPreferenceState" payload:v10 testingParameters:0 allowSparsePayload:1];
}

- (void)_dispatchEventPayloadWithPreferenceNameToChangesEvent:(id)a3 activeInputModes:(id)a4 currentValue:(id)a5 previousValue:(id)a6 changedAt:(id)a7 analyzedAt:(id)a8 buildAtChange:(id)a9 isFreshInstall:(BOOL)a10 approxDateOfBuildInstall:(id)a11 buildAtLastAnalysis:(id)a12
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a11;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v55 = v16;
  [v23 setObject:v16 forKey:@"preferenceName"];
  v24 = [v17 componentsJoinedByString:@", "];
  [v23 setObject:v24 forKey:@"activeInputModes"];

  v25 = [NSNumber numberWithBool:a10];
  [v23 setObject:v25 forKey:@"isNewUser"];

  if (v18)
  {
    v26 = [NSString stringWithFormat:@"%@", v18];
    [v23 setObject:v26 forKey:@"currentValue"];
  }
  if (v19)
  {
    v27 = [NSString stringWithFormat:@"%@", v19];
    [v23 setObject:v27 forKey:@"previousValue"];

    if (!v20) {
      goto LABEL_18;
    }
  }
  else
  {
    [v23 setObject:@"previousValueNotSet" forKey:@"previousValue"];
    if (!v20) {
      goto LABEL_18;
    }
  }
  id v28 = v20;
  [v28 timeIntervalSinceNow];
  double v30 = v29;
  if (v29 <= 0.0)
  {
    unint64_t v31 = (unint64_t)(v29 / -86400.0);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v52 = [v28 description];
      v53 = [v28 dateByAddingTimeInterval:-v30];
      [v53 description];
      *(_DWORD *)buf = 136315650;
      v57 = "_daysSinceChangedAtDate";
      __int16 v58 = 2112;
      v59 = v52;
      v61 = __int16 v60 = 2112;
      v49 = (void *)v61;
      _os_log_fault_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s:Preference changes saved with a timestamp in the future. Refer rdar://98151099. changedAt:%@, now:%@", buf, 0x20u);
    }
    unint64_t v31 = 0;
  }

  v32 = [NSNumber numberWithUnsignedInteger:v31];
  [v23 setObject:v32 forKey:@"daysSinceLastChange"];

  uint64_t v33 = 0;
  uint64_t v34 = 5;
  while (1)
  {
    unint64_t v35 = _bucketizeDaysSinceChangedAtDate_bucketMaxBoundingRanges[v33++];
    if (v35 >= v31) {
      break;
    }
    if (v33 == 4) {
      goto LABEL_17;
    }
  }
  uint64_t v34 = v33;
LABEL_17:
  v36 = [NSNumber numberWithUnsignedInteger:v34];
  [v23 setObject:v36 forKey:@"daysSinceLastChangeBucket"];

LABEL_18:
  if (v21) {
    [v23 setObject:v21 forKey:@"buildAtChange"];
  }
  id v37 = v18;
  int v38 = [v37 BOOLValue];
  if (v20 && v22 && !v38)
  {
    [v20 timeIntervalSinceDate:v22];
    if (v39 >= 0.0)
    {
      v41 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v22 endDate:v20];
      [v41 duration];
      uint64_t v40 = (uint64_t)(v42 / 86400.0);

      if (v40 < 0) {
        goto LABEL_29;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        v50 = [v20 description];
        v51 = [v22 description];
        *(_DWORD *)buf = 136315650;
        v57 = "-[TIPreferencesAnalyzer _dispatchEventPayloadWithPreferenceNameToChangesEvent:activeInputModes:currentValu"
              "e:previousValue:changedAt:analyzedAt:buildAtChange:isFreshInstall:approxDateOfBuildInstall:buildAtLastAnalysis:]";
        __int16 v58 = 2112;
        v59 = v50;
        __int16 v60 = 2112;
        uint64_t v61 = (uint64_t)v51;
        _os_log_fault_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s:Preference changes saved with a timestamp in the future relative to date of BuildInstall. Refer rdar://98151099. changedAt:%@, approxDateOfBuildInstall:%@", buf, 0x20u);
      }
      uint64_t v40 = 0;
    }
    v43 = [NSNumber numberWithInteger:v40];
    [v23 setObject:v43 forKey:@"daysSinceUpgradeToOff"];
  }
LABEL_29:
  if (a8) {
    BOOL v44 = 1;
  }
  else {
    BOOL v44 = v37 == v19;
  }
  uint64_t v46 = !v44 && v20 != 0;
  v47 = [NSNumber numberWithBool:v46];
  [v23 setObject:v47 forKey:@"valueDidChange"];

  v48 = [MEMORY[0x1E4FAE260] sharedInstance];
  [v48 dispatchEventWithName:@"textInputUserPreferenceChanges" payload:v23 testingParameters:0 allowSparsePayload:1];
}

- (void)_resetChangedAtForPreferenceKey:(id)a3 inDomain:(id)a4
{
  v5 = NSString;
  id v6 = (__CFString *)a4;
  v7 = [v5 stringWithFormat:@"%@_changedAt", a3];
  CFPreferencesSetAppValue(v7, 0, v6);
}

- (void)_updateApproxBuildAtLastAnalysisWithBuild:(id)a3 andApproxDateOfInstall:(id)a4 ForPreferenceKey:(id)a5 inDomain:(id)a6
{
  id v9 = NSString;
  id v10 = (__CFString *)a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  key = [v9 stringWithFormat:@"%@_approxDateOfBuildInstall", v11];
  v14 = [NSString stringWithFormat:@"%@_buildAtLastAnalysis", v11];

  CFPreferencesSetAppValue(v14, v13, v10);
  CFPreferencesSetAppValue(key, v12, v10);
}

- (void)_recordAnalysisOfPreferenceKey:(id)a3 inDomain:(id)a4
{
  v5 = NSString;
  id v6 = (__CFString *)a4;
  key = [v5 stringWithFormat:@"%@_analyzedAt", a3];
  v7 = [MEMORY[0x1E4F1C9C8] now];
  CFPreferencesSetAppValue(key, v7, v6);
}

- (TIPreferencesAnalyzer)initWithRegistry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIPreferencesAnalyzer;
  id v6 = [(TIPreferencesAnalyzer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(TIPreferencesAnalyzer *)v6 _registerAnalyticsEventSpecWithAnalyticsService];
    objc_storeStrong((id *)&v7->_registry, a3);
  }

  return v7;
}

- (TIPreferencesAnalyzer)init
{
  v3 = objc_alloc_init(TIPreferencesAnalyzerRegistry);
  uint64_t v4 = [(TIPreferencesAnalyzer *)self initWithRegistry:v3];

  return v4;
}

- (void)analyzeRegisteredPreferences
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__8337;
  id v18 = __Block_byref_object_dispose__8338;
  id v19 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___getSystemActiveInputModes_block_invoke;
  aBlock[3] = &unk_1E6E2E248;
  aBlock[4] = &v14;
  v3 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v3[2](v3);
  }
  else {
    TIDispatchSync();
  }
  uint64_t v4 = (void *)v15[5];
  if (v4 && [v4 count])
  {
    id v5 = +[TIPreferencesAnalyzer normalizedInputModeIdentifierGroupsFromInputModes:v15[5]];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"self" ascending:1];
    v20[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v8 = [v5 sortedArrayUsingDescriptors:v7];
  }
  else
  {
    id v8 = &unk_1F3FA7778;
  }

  _Block_object_dispose(&v14, 8);
  objc_super v9 = [(TIPreferencesAnalyzer *)self registry];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__TIPreferencesAnalyzer_analyzeRegisteredPreferences__block_invoke;
  v11[3] = &unk_1E6E2B340;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 enumerateRegisteredPreferencesUsingBlock:v11];
}

void __53__TIPreferencesAnalyzer_analyzeRegisteredPreferences__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = v10;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__8337;
  v53 = __Block_byref_object_dispose__8338;
  id v54 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___getCurrentValueFromPreferenceController_block_invoke;
  aBlock[3] = &unk_1E6E2E130;
  id v47 = v12;
  v48 = &v49;
  id v13 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v13[2](v13);
  }
  else {
    TIDispatchSync();
  }
  id v14 = (id)v50[5];

  _Block_object_dispose(&v49, 8);
  if (v14) {
    id v15 = v14;
  }
  else {
    id v15 = v11;
  }
  id v16 = v15;

  if (a5) {
    [*(id *)(a1 + 32) _dispatchEventPayloadWithPreferenceNameToStateEvent:v12 activeInputModes:*(void *)(a1 + 40) currentValue:v16];
  }
  if ((a5 & 2) != 0)
  {
    id v43 = v11;
    id v17 = NSString;
    id v18 = (__CFString *)v9;
    id v19 = [v17 stringWithFormat:@"%@_previousValue", v12];
    id v20 = (__CFString *)CFPreferencesCopyAppValue(v19, v18);

    id v21 = @"previousValueNotSet";
    if (v20) {
      id v21 = v20;
    }
    double v42 = v21;

    id v22 = NSString;
    id v23 = v18;
    v24 = [v22 stringWithFormat:@"%@_changedAt", v12];
    v45 = (void *)CFPreferencesCopyAppValue(v24, v23);

    v41 = _getPreferenceAnalyzedAtDateForKeyInDomain((uint64_t)v12, v23);
    v25 = NSString;
    v26 = v23;
    v27 = [v25 stringWithFormat:@"%@_buildAtChange", v12];
    id v28 = (void *)CFPreferencesCopyAppValue(v27, v26);

    double v29 = NSString;
    double v30 = v26;
    unint64_t v31 = [v29 stringWithFormat:@"%@_approxDateOfBuildInstall", v12];
    v32 = (void *)CFPreferencesCopyAppValue(v31, v30);

    uint64_t v33 = NSString;
    uint64_t v34 = v30;
    unint64_t v35 = [v33 stringWithFormat:@"%@_buildAtLastAnalysis", v12];
    v36 = (void *)CFPreferencesCopyAppValue(v35, v34);

    id v37 = (void *)MGGetStringAnswer();
    id v44 = v9;
    if (![v36 isEqualToString:v37] || !v32)
    {
      id v38 = v37;

      uint64_t v39 = [MEMORY[0x1E4F1C9C8] now];

      [*(id *)(a1 + 32) _updateApproxBuildAtLastAnalysisWithBuild:v38 andApproxDateOfInstall:v39 ForPreferenceKey:v12 inDomain:v34];
      v36 = v38;
      v32 = (void *)v39;
    }
    if (([v36 isEqualToString:v37] & 1) == 0) {
      [*(id *)(a1 + 32) _resetChangedAtForPreferenceKey:v12 inDomain:v34];
    }
    LOBYTE(v40) = DMGetUserDataDisposition() & 1;
    [*(id *)(a1 + 32) _dispatchEventPayloadWithPreferenceNameToChangesEvent:v12 activeInputModes:*(void *)(a1 + 40) currentValue:v16 previousValue:v42 changedAt:v45 analyzedAt:v41 buildAtChange:v28 isFreshInstall:v40 approxDateOfBuildInstall:v32 buildAtLastAnalysis:v36];

    [*(id *)(a1 + 32) _recordAnalysisOfPreferenceKey:v12 inDomain:v34];
    id v11 = v43;
    id v9 = v44;
  }
}

+ (id)normalizedInputModeIdentifierGroupsFromInputModes:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    id v36 = v5;
    id v37 = v4;
    uint64_t v35 = *(void *)v42;
    do
    {
      uint64_t v9 = 0;
      uint64_t v38 = v7;
      do
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = TIInputModeGetMultilingualID();
        if (v10)
        {
          if ([v4 containsObject:v10]) {
            goto LABEL_35;
          }
          [v4 addObject:v10];
          id v11 = TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();
          id v12 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v40 = [MEMORY[0x1E4F1CA80] set];
          id v13 = @"Unknown";
          if ([v11 count])
          {
            unint64_t v14 = 0;
            id v15 = @"Unknown";
            do
            {
              id v16 = [v11 objectAtIndexedSubscript:v14];
              id v17 = TIInputModeGetNormalizedIdentifier();
              if (v17)
              {
                if (!v14)
                {
                  uint64_t v18 = TIInputModeGetSWLayout();
                  id v19 = (void *)v18;
                  if (v18) {
                    id v20 = (void *)v18;
                  }
                  else {
                    id v20 = v15;
                  }
                  id v21 = v20;

                  id v15 = v21;
                }
                if (v14 == [v11 count] - 1)
                {
                  uint64_t v22 = [NSString stringWithFormat:@"%@-%@", v17, v15];
                }
                else
                {
                  uint64_t v22 = [v17 copy];
                }
                id v23 = (void *)v22;
                [v12 addObject:v22];
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v46 = "+[TIPreferencesAnalyzer normalizedInputModeIdentifierGroupsFromInputModes:]";
                _os_log_fault_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s:nil input mode found.", buf, 0xCu);
              }

              ++v14;
            }
            while (v14 < [v11 count]);
          }
          else
          {
            id v15 = @"Unknown";
          }
          double v30 = NSString;
          unint64_t v31 = [v12 componentsJoinedByString:@","];
          v32 = [v30 stringWithFormat:@"(%@)", v31];
          [v39 addObject:v32];

          id v5 = v36;
          id v4 = v37;
          uint64_t v8 = v35;
          uint64_t v7 = v38;
        }
        else
        {
          uint64_t v24 = TIInputModeGetNormalizedIdentifier();
          if (v24)
          {
            id v11 = (void *)v24;
            uint64_t v25 = TIInputModeGetSWLayout();
            v26 = (void *)v25;
            if (v25) {
              v27 = (__CFString *)v25;
            }
            else {
              v27 = @"Unknown";
            }
            id v28 = v27;

            double v29 = [NSString stringWithFormat:@"%@-%@", v11, v28];

            [v39 addObject:v29];
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v46 = "+[TIPreferencesAnalyzer normalizedInputModeIdentifierGroupsFromInputModes:]";
              _os_log_fault_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s:nil input mode found.", buf, 0xCu);
            }
            id v11 = 0;
          }
        }

LABEL_35:
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v7);
  }

  uint64_t v33 = [v39 allObjects];

  return v33;
}

@end