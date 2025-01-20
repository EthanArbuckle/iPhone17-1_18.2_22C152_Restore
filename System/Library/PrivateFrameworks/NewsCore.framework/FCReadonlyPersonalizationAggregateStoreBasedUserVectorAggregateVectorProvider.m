@interface FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider
- (FCPersonalizationTreatment)personalizationTreatment;
- (FCReadonlyPersonalizationAggregateStore)aggregateStore;
- (FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider)initWithReadonlyPersonalizationAggregateStore:(id)a3 personalizationTreatment:(id)a4;
- (id)aggregateVectorForTags:(id)a3;
- (void)setAggregateStore:(id)a3;
- (void)setPersonalizationTreatment:(id)a3;
@end

@implementation FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider

- (FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider)initWithReadonlyPersonalizationAggregateStore:(id)a3 personalizationTreatment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider;
  v9 = [(FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_aggregateStore, a3);
    objc_storeStrong((id *)&v10->_personalizationTreatment, a4);
  }

  return v10;
}

- (id)aggregateVectorForTags:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        objc_super v12 = [[FCTagIDFeature alloc] initWithTagID:v11];
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  v13 = [(FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider *)self aggregateStore];
  v14 = [(FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider *)self personalizationTreatment];
  v15 = [v13 baselineAggregateWithConfigurableValues:v14];

  v16 = [(FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider *)self aggregateStore];
  v17 = [v5 allValues];
  v18 = [v16 aggregatesForFeatures:v17];

  v19 = [(FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider *)self personalizationTreatment];
  v20 = [v19 defaultScoringConfig];
  [v20 decayFactor];
  double v22 = v21;

  [v15 personalizationValueWithBaseline:0 decayRate:v22];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __104__FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider_aggregateVectorForTags___block_invoke;
  v29[3] = &unk_1E5B54D10;
  id v30 = v18;
  id v31 = v5;
  id v32 = v15;
  double v33 = v22;
  uint64_t v34 = v23;
  id v24 = v15;
  id v25 = v5;
  id v26 = v18;
  v27 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v29);

  return v27;
}

id __104__FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider_aggregateVectorForTags___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  id v5 = objc_msgSend(v3, "fc_safeObjectForKey:", v4);

  if (v5)
  {
    id v6 = NSNumber;
    [v5 personalizationValueWithBaseline:*(void *)(a1 + 48) decayRate:*(double *)(a1 + 56)];
    uint64_t v8 = [v6 numberWithDouble:v7 - *(double *)(a1 + 64)];
  }
  else
  {
    uint64_t v8 = &unk_1EF8D9A08;
  }

  return v8;
}

- (FCPersonalizationTreatment)personalizationTreatment
{
  return self->_personalizationTreatment;
}

- (void)setPersonalizationTreatment:(id)a3
{
}

- (FCReadonlyPersonalizationAggregateStore)aggregateStore
{
  return self->_aggregateStore;
}

- (void)setAggregateStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateStore, 0);
  objc_storeStrong((id *)&self->_personalizationTreatment, 0);
}

@end