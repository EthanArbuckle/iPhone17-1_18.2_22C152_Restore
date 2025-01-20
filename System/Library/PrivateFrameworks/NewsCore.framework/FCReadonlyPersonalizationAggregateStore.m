@interface FCReadonlyPersonalizationAggregateStore
- (FCDerivedPersonalizationData)derivedPersonalizationData;
- (FCOnce)prepareOnce;
- (FCPersonalizationDataGeneratorType)generator;
- (FCReadonlyPersonalizationAggregateStore)init;
- (FCReadonlyPersonalizationAggregateStore)initWithGenerator:(id)a3;
- (NSDictionary)allAggregates;
- (NSMutableDictionary)overrideAggregatesByFeatureKey;
- (double)decayRate;
- (id)aggregateForFeatureKey:(id)a3;
- (id)aggregatesForFeatureKeys:(id)a3;
- (id)aggregatesForFeatures:(id)a3;
- (id)baselineAggregateWithConfigurableValues:(id)a3;
- (unint64_t)scoringType;
- (void)enumerateAggregatesUsingBlock:(id)a3;
- (void)modifyLocalAggregatesForFeatureKeys:(id)a3 withAction:(unint64_t)a4 actionCount:(unint64_t)a5 defaultClicks:(double)a6 defaultImpressions:(double)a7 impressionBias:(double)a8 configurableValues:(id)a9;
- (void)prepareAggregatesForUseWithCompletionHandler:(id)a3;
- (void)processTodayPersonalizationUpdates:(id)a3 withConfigurableValues:(id)a4;
- (void)setDecayRate:(double)a3;
- (void)setDerivedPersonalizationData:(id)a3;
- (void)setGenerator:(id)a3;
- (void)setOverrideAggregatesByFeatureKey:(id)a3;
- (void)setPrepareOnce:(id)a3;
- (void)setScoringType:(unint64_t)a3;
- (void)updateFeatures:(id)a3 withAction:(unint64_t)a4 displayRank:(int64_t)a5 groupRank:(int64_t)a6 individually:(BOOL)a7 configurableValues:(id)a8;
@end

@implementation FCReadonlyPersonalizationAggregateStore

- (FCReadonlyPersonalizationAggregateStore)initWithGenerator:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "generator");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCReadonlyPersonalizationAggregateStore initWithGenerator:]";
    __int16 v20 = 2080;
    v21 = "FCPersonalizationAggregate.m";
    __int16 v22 = 1024;
    int v23 = 121;
    __int16 v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v17.receiver = self;
  v17.super_class = (Class)FCReadonlyPersonalizationAggregateStore;
  v6 = [(FCReadonlyPersonalizationAggregateStore *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_generator, a3);
    v8 = [FCDerivedPersonalizationData alloc];
    uint64_t v9 = [(FCDerivedPersonalizationData *)v8 initWithAggregates:MEMORY[0x1E4F1CC08] scoringType:0 decayRate:0.0];
    derivedPersonalizationData = v7->_derivedPersonalizationData;
    v7->_derivedPersonalizationData = (FCDerivedPersonalizationData *)v9;

    v11 = [[FCOnce alloc] initWithOptions:1];
    prepareOnce = v7->_prepareOnce;
    v7->_prepareOnce = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    overrideAggregatesByFeatureKey = v7->_overrideAggregatesByFeatureKey;
    v7->_overrideAggregatesByFeatureKey = (NSMutableDictionary *)v13;
  }
  return v7;
}

- (void)prepareAggregatesForUseWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  id v5 = [(FCReadonlyPersonalizationAggregateStore *)self prepareOnce];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__FCReadonlyPersonalizationAggregateStore_prepareAggregatesForUseWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5B4C018;
  v6[4] = self;
  [v5 executeOnce:v6];

  v4[2](v4);
}

- (FCOnce)prepareOnce
{
  return self->_prepareOnce;
}

void __88__FCReadonlyPersonalizationAggregateStore_prepareAggregatesForUseWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) generator];
  v3 = [v2 generateDerivedData];

  v4 = (void *)FCReadonlyPersonalizationAggregateStoreLog;
  if (os_log_type_enabled((os_log_t)FCReadonlyPersonalizationAggregateStoreLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    v6 = NSStringFromFCScoringType([v3 scoringType]);
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Generated personalization data with scoring type %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) setDerivedPersonalizationData:v3];
  objc_msgSend(*(id *)(a1 + 32), "setScoringType:", objc_msgSend(v3, "scoringType"));
  [v3 decayRate];
  objc_msgSend(*(id *)(a1 + 32), "setDecayRate:");
}

- (void)setScoringType:(unint64_t)a3
{
  self->_scoringType = a3;
}

- (void)setDerivedPersonalizationData:(id)a3
{
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (FCPersonalizationDataGeneratorType)generator
{
  return self->_generator;
}

- (unint64_t)scoringType
{
  return self->_scoringType;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (FCReadonlyPersonalizationAggregateStore)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCReadonlyPersonalizationAggregateStore init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationAggregate.m";
    __int16 v11 = 1024;
    int v12 = 116;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCReadonlyPersonalizationAggregateStore init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)modifyLocalAggregatesForFeatureKeys:(id)a3 withAction:(unint64_t)a4 actionCount:(unint64_t)a5 defaultClicks:(double)a6 defaultImpressions:(double)a7 impressionBias:(double)a8 configurableValues:(id)a9
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a9;
  id v18 = objc_alloc_init(MEMORY[0x1E4F82B08]);
  [v18 setDefaultClicks:a6];
  [v18 setDefaultImpressions:a7];
  [v18 setImpressionBias:a8];
  v19 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v18, "setTimestamp:", objc_msgSend(v19, "fc_millisecondTimeIntervalSince1970"));

  [v18 addAction:a4 count:a5];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v16;
  uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * v23);
        v25 = [(FCReadonlyPersonalizationAggregateStore *)self overrideAggregatesByFeatureKey];
        id v26 = [v25 objectForKeyedSubscript:v24];

        if (!v26)
        {
          id v26 = objc_alloc_init(MEMORY[0x1E4F82B00]);
          [v26 setFeatureKey:v24];
          v27 = [(FCReadonlyPersonalizationAggregateStore *)self derivedPersonalizationData];
          v28 = [v27 aggregateForFeatureKey:v24];

          if (v28)
          {
            [v28 clicks];
            objc_msgSend(v26, "setClicks:");
            [v28 impressions];
            objc_msgSend(v26, "setImpressions:");
            v29 = [v28 lastModified];
            objc_msgSend(v26, "setTimestamp:", objc_msgSend(v29, "fc_millisecondTimeIntervalSince1970"));

            objc_msgSend(v26, "setEventCount:", objc_msgSend(v28, "eventCount"));
          }
          v30 = [(FCReadonlyPersonalizationAggregateStore *)self overrideAggregatesByFeatureKey];
          [v30 setObject:v26 forKeyedSubscript:v24];
        }
        [v18 applyToAggregate:v26 withTreatment:v17];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }
}

- (void)updateFeatures:(id)a3 withAction:(unint64_t)a4 displayRank:(int64_t)a5 groupRank:(int64_t)a6 individually:(BOOL)a7 configurableValues:(id)a8
{
  BOOL v38 = a7;
  int64_t v36 = a5;
  int64_t v37 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v40 = a8;
  v10 = [MEMORY[0x1E4F1CA48] array];
  __int16 v11 = [MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = MEMORY[0x1E4F14500];
    uint64_t v16 = *(void *)v43;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v42 + 1) + 8 * v17);
        v19 = objc_msgSend(v18, "personalizationIdentifier", v36, v37);

        if (v19)
        {
          [v10 addObject:v18];
          uint64_t v20 = [v18 personalizationIdentifier];
          [v11 addObject:v20];
LABEL_8:

          goto LABEL_10;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"Found a personalization feature without a personalization identifier"];
          *(_DWORD *)buf = 136315906;
          v48 = "-[FCReadonlyPersonalizationAggregateStore updateFeatures:withAction:displayRank:groupRank:individually:c"
                "onfigurableValues:]";
          __int16 v49 = 2080;
          v50 = "FCPersonalizationAggregate.m";
          __int16 v51 = 1024;
          int v52 = 192;
          __int16 v53 = 2114;
          v54 = v20;
          _os_log_error_impl(&dword_1A460D000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          goto LABEL_8;
        }
LABEL_10:
        ++v17;
      }
      while (v14 != v17);
      uint64_t v21 = [v12 countByEnumeratingWithState:&v42 objects:v55 count:16];
      uint64_t v14 = v21;
    }
    while (v21);
  }

  uint64_t v22 = [(FCReadonlyPersonalizationAggregateStore *)self baselineAggregateWithConfigurableValues:v40];
  double v23 = FCPersonalizationAggregateImpressionBiasForAction(a4, v36, v37, v40);
  [v40 featureImpressionPrior];
  double v25 = v24;
  id v26 = [v40 defaultScoringConfig];
  [v26 decayFactor];
  objc_msgSend(v22, "personalizationValueWithBaseline:decayRate:", 0);
  double v28 = v25 * v27;
  [v40 featureImpressionPrior];
  uint64_t v29 = 1;
  [(FCReadonlyPersonalizationAggregateStore *)self modifyLocalAggregatesForFeatureKeys:v11 withAction:a4 actionCount:1 defaultClicks:v40 defaultImpressions:v28 impressionBias:v30 configurableValues:v23];

  v31 = [v22 featureKey];
  v46 = v31;
  long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  if (v38) {
    uint64_t v29 = [v11 count];
  }
  objc_msgSend(v22, "clicks", v36, v37);
  double v34 = v33;
  [v22 impressions];
  [(FCReadonlyPersonalizationAggregateStore *)self modifyLocalAggregatesForFeatureKeys:v32 withAction:a4 actionCount:v29 defaultClicks:v40 defaultImpressions:v34 impressionBias:v35 configurableValues:v23];
}

- (id)baselineAggregateWithConfigurableValues:(id)a3
{
  uint64_t v4 = FCPersonalizationAggregateBaselineAggregateWithConfigurableValues(self, a3);
  id v5 = [(FCReadonlyPersonalizationAggregateStore *)self overrideAggregatesByFeatureKey];
  id v6 = [v4 featureKey];
  int v7 = [v5 objectForKeyedSubscript:v6];
  v8 = v7;
  if (!v7) {
    int v7 = v4;
  }
  id v9 = v7;

  return v9;
}

- (id)aggregateForFeatureKey:(id)a3
{
  id v4 = a3;
  id v5 = [(FCReadonlyPersonalizationAggregateStore *)self overrideAggregatesByFeatureKey];
  id v6 = [v5 objectForKeyedSubscript:v4];
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(FCReadonlyPersonalizationAggregateStore *)self derivedPersonalizationData];
    id v8 = [v9 aggregateForFeatureKey:v4];
  }
  return v8;
}

- (id)aggregatesForFeatureKeys:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  int v7 = [(FCReadonlyPersonalizationAggregateStore *)self overrideAggregatesByFeatureKey];
  id v8 = objc_msgSend(v7, "fc_subdictionaryForKeys:", v5);
  [v6 addEntriesFromDictionary:v8];

  id v9 = [(FCReadonlyPersonalizationAggregateStore *)self derivedPersonalizationData];
  v10 = [v9 aggregatesForFeatureKeys:v5];

  [v6 addEntriesFromDictionary:v10];
  return v6;
}

- (id)aggregatesForFeatures:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__FCReadonlyPersonalizationAggregateStore_aggregatesForFeatures___block_invoke;
  v9[3] = &unk_1E5B4CDC0;
  id v10 = v4;
  __int16 v11 = self;
  id v6 = v4;
  int v7 = objc_msgSend(v5, "fc_dictionary:", v9);

  return v7;
}

void __65__FCReadonlyPersonalizationAggregateStore_aggregatesForFeatures___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__FCReadonlyPersonalizationAggregateStore_aggregatesForFeatures___block_invoke_2;
  v6[3] = &unk_1E5B5BAE0;
  id v4 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __65__FCReadonlyPersonalizationAggregateStore_aggregatesForFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 personalizationIdentifier];
  id v4 = [*(id *)(a1 + 32) aggregateForFeatureKey:v3];
  if (v4) {
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:v5];
  }
}

- (void)enumerateAggregatesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FCReadonlyPersonalizationAggregateStore *)self derivedPersonalizationData];
  id v6 = [v5 allAggregates];
  id v7 = (void *)[v6 mutableCopy];

  id v8 = [(FCReadonlyPersonalizationAggregateStore *)self overrideAggregatesByFeatureKey];
  [v7 addEntriesFromDictionary:v8];

  id v9 = [v7 allValues];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__FCReadonlyPersonalizationAggregateStore_enumerateAggregatesUsingBlock___block_invoke;
  v11[3] = &unk_1E5B5B3F8;
  id v12 = v4;
  id v10 = v4;
  [v9 enumerateObjectsUsingBlock:v11];
}

uint64_t __73__FCReadonlyPersonalizationAggregateStore_enumerateAggregatesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSDictionary)allAggregates
{
  id v3 = [(FCReadonlyPersonalizationAggregateStore *)self overrideAggregatesByFeatureKey];
  uint64_t v4 = [v3 count];

  id v5 = [(FCReadonlyPersonalizationAggregateStore *)self derivedPersonalizationData];
  id v6 = [v5 allAggregates];
  id v7 = v6;
  if (v4)
  {
    id v8 = (void *)[v6 mutableCopy];

    id v5 = [(FCReadonlyPersonalizationAggregateStore *)self overrideAggregatesByFeatureKey];
    [v8 addEntriesFromDictionary:v5];
    id v7 = v8;
  }

  return (NSDictionary *)v7;
}

- (void)processTodayPersonalizationUpdates:(id)a3 withConfigurableValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEBUG, "Processing past events for accurate News Today Widget personalization", buf, 2u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __101__FCReadonlyPersonalizationAggregateStore_processTodayPersonalizationUpdates_withConfigurableValues___block_invoke;
  v10[3] = &unk_1E5B5BB30;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v6 enumerateObjectsUsingBlock:v10];
}

void __101__FCReadonlyPersonalizationAggregateStore_processTodayPersonalizationUpdates_withConfigurableValues___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 events];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __101__FCReadonlyPersonalizationAggregateStore_processTodayPersonalizationUpdates_withConfigurableValues___block_invoke_2;
  v5[3] = &unk_1E5B5BB08;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 enumerateObjectsUsingBlock:v5];
}

void __101__FCReadonlyPersonalizationAggregateStore_processTodayPersonalizationUpdates_withConfigurableValues___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v9 = +[FCPersonalizationFeature featuresFromTodayPersonalizationEvent:v4];
  unsigned int v5 = [v4 action] - 2;
  if (v5 > 4) {
    uint64_t v6 = 22;
  }
  else {
    uint64_t v6 = qword_1A4974BB0[v5];
  }
  uint64_t v7 = [v4 overallOrder];
  uint64_t v8 = [v4 sectionOrder];

  [v3 updateFeatures:v9 withAction:v6 displayRank:v7 groupRank:v8 individually:1 configurableValues:*(void *)(a1 + 40)];
}

- (void)setPrepareOnce:(id)a3
{
}

- (void)setGenerator:(id)a3
{
}

- (FCDerivedPersonalizationData)derivedPersonalizationData
{
  return self->_derivedPersonalizationData;
}

- (NSMutableDictionary)overrideAggregatesByFeatureKey
{
  return self->_overrideAggregatesByFeatureKey;
}

- (void)setOverrideAggregatesByFeatureKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideAggregatesByFeatureKey, 0);
  objc_storeStrong((id *)&self->_derivedPersonalizationData, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_prepareOnce, 0);
}

@end