@interface SBDockSuggestionsMetric
- (BOOL)_trackEvent:(BOOL)a3 withPayload:(id)a4;
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBDockSuggestionsMetric)init;
@end

@implementation SBDockSuggestionsMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6 = a4;
  v7 = [v6 eventPayload];
  v8 = v7;
  if (a3 == 9)
  {
    v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA7558]];
    if ([v10 isEqualToString:@"SBIconLocationFloatingDockSuggestions"])
    {
      BOOL v9 = [(SBDockSuggestionsMetric *)self _trackEvent:0 withPayload:v8];

      goto LABEL_10;
    }

    goto LABEL_9;
  }
  if (a3 == 11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__SBDockSuggestionsMetric_handleEvent_withContext___block_invoke;
    v12[3] = &unk_1E6AF9508;
    v12[4] = self;
    BOOL v9 = 1;
    [v6 stateForQueryName:1 completion:v12];
    goto LABEL_10;
  }
  if (a3 != 17)
  {
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  BOOL v9 = [(SBDockSuggestionsMetric *)self _trackEvent:1 withPayload:v7];
LABEL_10:

  return v9;
}

- (SBDockSuggestionsMetric)init
{
  v31[3] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SBDockSuggestionsMetric;
  v2 = [(SBDockSuggestionsMetric *)&v28 init];
  v3 = v2;
  if (v2)
  {
    v27 = v2;
    v4 = +[SBMedusaDomain rootSettings];
    [v4 numberOfRecents];
    *(float *)&double v5 = v5;
    unint64_t v6 = vcvtms_u32_f32(*(float *)&v5);

    v7 = [MEMORY[0x1E4F1CA48] array];
    if (v6)
    {
      unint64_t v8 = v6;
      do
      {
        BOOL v9 = (void *)MEMORY[0x1E4F93720];
        v30[0] = &unk_1F334B660;
        v30[1] = &unk_1F334B678;
        v31[0] = @"recent";
        v31[1] = @"suggest";
        v30[2] = &unk_1F334B690;
        v31[2] = @"badgedSuggest";
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
        v11 = [v9 propertyWithName:@"suggType" enumMapping:v10];

        v12 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:", @"index", 0, v6);
        id v13 = objc_alloc(MEMORY[0x1E4F93730]);
        v29[0] = v11;
        v29[1] = v12;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
        v15 = (void *)[v13 initWithFeatureId:@"SpringBoard" opportunityEvent:@"suggShown" conversionEvent:@"suggTapped" registerProperties:v14];

        [(NSArray *)v7 addObject:v15];
        --v8;
      }
      while (v8);
    }
    v3 = v27;
    trackers = v27->_trackers;
    v27->_trackers = v7;
    v17 = v7;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6];
    indexToSuggestionType = v27->_indexToSuggestionType;
    v27->_indexToSuggestionType = (NSMutableDictionary *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4F93738]);
    uint64_t v21 = MEMORY[0x1E4F1CBF0];
    uint64_t v22 = [v20 initWithFeatureId:@"SpringBoard" event:@"suggestionsEnabled" registerProperties:MEMORY[0x1E4F1CBF0]];
    enabledTracker = v27->_enabledTracker;
    v27->_enabledTracker = (PETScalarEventTracker *)v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F93718]) initWithFeatureId:@"SpringBoard" event:@"suggestionsDist" registerProperties:v21];
    distTracker = v27->_distTracker;
    v27->_distTracker = (PETDistributionEventTracker *)v24;
  }
  return v3;
}

- (BOOL)_trackEvent:(BOOL)a3 withPayload:(id)a4
{
  BOOL v4 = a3;
  v32[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (!v4)
  {
    v19 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7548]];
    unint64_t v20 = [v19 unsignedIntegerValue];

    if (v20 < [(NSArray *)self->_trackers count])
    {
      indexToSuggestionType = self->_indexToSuggestionType;
      uint64_t v22 = [NSNumber numberWithUnsignedInteger:v20];
      v23 = [(NSMutableDictionary *)indexToSuggestionType objectForKeyedSubscript:v22];
      uint64_t v24 = [v23 unsignedIntegerValue];

      v25 = [(NSArray *)self->_trackers objectAtIndexedSubscript:v20];
      v26 = [NSNumber numberWithUnsignedInteger:v24];
      v31[0] = v26;
      v27 = [NSNumber numberWithUnsignedInteger:v20];
      v31[1] = v27;
      objc_super v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
      [v25 trackGoalConversionEventWithPropertyValues:v28];

      [(PETDistributionEventTracker *)self->_distTracker trackEventWithPropertyValues:MEMORY[0x1E4F1CBF0] value:(double)v20];
      goto LABEL_6;
    }
LABEL_7:
    BOOL v29 = 0;
    goto LABEL_8;
  }
  unint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA74A0]];
  unint64_t v9 = [v8 unsignedIntegerValue];

  if (v9 >= [(NSArray *)self->_trackers count]) {
    goto LABEL_7;
  }
  v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA74A8]];
  uint64_t v11 = [v10 unsignedIntegerValue];

  v12 = [(NSArray *)self->_trackers objectAtIndexedSubscript:v9];
  id v13 = [NSNumber numberWithUnsignedInteger:v11];
  v32[0] = v13;
  v14 = [NSNumber numberWithUnsignedInteger:v9];
  v32[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v12 trackGoalOpportunityEventWithPropertyValues:v15];

  v16 = [NSNumber numberWithUnsignedInteger:v11];
  v17 = self->_indexToSuggestionType;
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:v9];
  [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];

LABEL_6:
  BOOL v29 = 1;
LABEL_8:

  return v29;
}

uint64_t __51__SBDockSuggestionsMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA74B0]];
  unsigned int v4 = [v3 BOOLValue];

  double v5 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v6 = MEMORY[0x1E4F1CBF0];
  return [v5 trackEventWithPropertyValues:v6 setValue:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distTracker, 0);
  objc_storeStrong((id *)&self->_indexToSuggestionType, 0);
  objc_storeStrong((id *)&self->_enabledTracker, 0);
  objc_storeStrong((id *)&self->_trackers, 0);
}

@end