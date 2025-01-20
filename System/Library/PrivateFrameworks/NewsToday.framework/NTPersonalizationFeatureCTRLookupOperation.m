@interface NTPersonalizationFeatureCTRLookupOperation
- (BOOL)validateOperation;
- (FCPersonalizationTreatment)personalizationTreatment;
- (FCReadonlyPersonalizationAggregateStore)aggregateStore;
- (NSArray)lookupRequests;
- (NSDictionary)result;
- (NTPersonalizationFeatureCTRLookupOperation)init;
- (id)lookupCompletion;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setAggregateStore:(id)a3;
- (void)setLookupCompletion:(id)a3;
- (void)setLookupRequests:(id)a3;
- (void)setPersonalizationTreatment:(id)a3;
- (void)setResult:(id)a3;
- (void)validateOperation;
@end

@implementation NTPersonalizationFeatureCTRLookupOperation

- (NTPersonalizationFeatureCTRLookupOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTPersonalizationFeatureCTRLookupOperation;
  return [(FCOperation *)&v3 init];
}

- (BOOL)validateOperation
{
  objc_super v3 = [(NTPersonalizationFeatureCTRLookupOperation *)self personalizationTreatment];

  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTPersonalizationFeatureCTRLookupOperation validateOperation]();
  }
  v4 = [(NTPersonalizationFeatureCTRLookupOperation *)self lookupRequests];

  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTPersonalizationFeatureCTRLookupOperation validateOperation]();
  }
  v5 = [(NTPersonalizationFeatureCTRLookupOperation *)self lookupCompletion];

  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTPersonalizationFeatureCTRLookupOperation validateOperation]();
  }
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6 && v5 != 0;
}

- (void)performOperation
{
  objc_super v3 = [(NTPersonalizationFeatureCTRLookupOperation *)self lookupRequests];
  v4 = objc_msgSend(v3, "fc_dictionaryWithKeyBlock:", &__block_literal_global_4);

  v5 = [(NTPersonalizationFeatureCTRLookupOperation *)self aggregateStore];
  BOOL v6 = [v4 allKeys];
  v7 = [v5 aggregatesForFeatures:v6];

  v8 = [(NTPersonalizationFeatureCTRLookupOperation *)self personalizationTreatment];
  v9 = [(NTPersonalizationFeatureCTRLookupOperation *)self aggregateStore];
  v10 = [v9 baselineAggregateWithConfigurableValues:v8];

  v11 = [v8 defaultScoringConfig];
  [v11 decayFactor];
  uint64_t v13 = v12;

  v14 = [v8 defaultScoringConfig];
  [v14 baselineRatePrior];
  uint64_t v16 = v15;

  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __62__NTPersonalizationFeatureCTRLookupOperation_performOperation__block_invoke_2;
  v23 = &unk_26475C6A8;
  id v24 = v7;
  id v25 = v10;
  uint64_t v26 = v16;
  uint64_t v27 = v13;
  id v17 = v10;
  id v18 = v7;
  v19 = objc_msgSend(v4, "fc_dictionaryByTransformingValuesWithBlock:", &v20);
  -[NTPersonalizationFeatureCTRLookupOperation setResult:](self, "setResult:", v19, v20, v21, v22, v23);

  [(FCOperation *)self finishedPerformingOperationWithError:0];
}

uint64_t __62__NTPersonalizationFeatureCTRLookupOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 personalizationFeature];
}

id __62__NTPersonalizationFeatureCTRLookupOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 personalizationFeature];
  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    [v3 impressionPrior];
    double v7 = 1.0;
    if (v8 > 0.0)
    {
      [v3 clickPrior];
      double v10 = v9;
      [v3 impressionPrior];
      double v12 = v10 / v11;
      if (v12 > 0.0)
      {
        double v13 = *(double *)(a1 + 48);
        if (v13 > 0.0) {
          double v7 = v12 / v13;
        }
      }
    }
    v14 = NSNumber;
    [v6 personalizationValueWithBaseline:*(void *)(a1 + 40) decayRate:*(double *)(a1 + 56) baselineClicksMultiplier:v7];
    uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  BOOL v6 = [(NTPersonalizationFeatureCTRLookupOperation *)self lookupCompletion];
  v5 = [(NTPersonalizationFeatureCTRLookupOperation *)self result];
  v6[2](v6, v5, v4);
}

- (FCReadonlyPersonalizationAggregateStore)aggregateStore
{
  return self->_aggregateStore;
}

- (void)setAggregateStore:(id)a3
{
}

- (FCPersonalizationTreatment)personalizationTreatment
{
  return self->_personalizationTreatment;
}

- (void)setPersonalizationTreatment:(id)a3
{
}

- (NSArray)lookupRequests
{
  return self->_lookupRequests;
}

- (void)setLookupRequests:(id)a3
{
}

- (id)lookupCompletion
{
  return self->_lookupCompletion;
}

- (void)setLookupCompletion:(id)a3
{
}

- (NSDictionary)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_lookupCompletion, 0);
  objc_storeStrong((id *)&self->_lookupRequests, 0);
  objc_storeStrong((id *)&self->_personalizationTreatment, 0);

  objc_storeStrong((id *)&self->_aggregateStore, 0);
}

- (void)validateOperation
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"feature CTR lookup operation requires personalization treatment"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

@end