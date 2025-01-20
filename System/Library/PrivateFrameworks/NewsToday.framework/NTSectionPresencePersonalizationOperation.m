@interface NTSectionPresencePersonalizationOperation
- (BOOL)validateOperation;
- (FCPersonalizationTreatment)personalizationTreatment;
- (FCReadonlyPersonalizationAggregateStore)aggregateStore;
- (NSArray)absoluteRequests;
- (NSArray)relativeRequests;
- (NSDictionary)absolutePresenceResult;
- (NSDictionary)relativePresenceResult;
- (NTSectionPresencePersonalizationOperation)init;
- (id)absolutePresenceHandler;
- (id)personalizationCompletion;
- (id)relativePresenceHandler;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setAbsolutePresenceHandler:(id)a3;
- (void)setAbsolutePresenceResult:(id)a3;
- (void)setAbsoluteRequests:(id)a3;
- (void)setAggregateStore:(id)a3;
- (void)setPersonalizationCompletion:(id)a3;
- (void)setPersonalizationTreatment:(id)a3;
- (void)setRelativePresenceHandler:(id)a3;
- (void)setRelativePresenceResult:(id)a3;
- (void)setRelativeRequests:(id)a3;
- (void)validateOperation;
@end

@implementation NTSectionPresencePersonalizationOperation

- (NTSectionPresencePersonalizationOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTSectionPresencePersonalizationOperation;
  return [(FCOperation *)&v3 init];
}

- (BOOL)validateOperation
{
  objc_super v3 = [(NTSectionPresencePersonalizationOperation *)self personalizationTreatment];

  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionPresencePersonalizationOperation validateOperation].cold.7();
  }
  v4 = [(NTSectionPresencePersonalizationOperation *)self absoluteRequests];
  v5 = v4;
  if (v4 && objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_15))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[NTSectionPresencePersonalizationOperation validateOperation].cold.6();
    }
    char v6 = 0;
  }
  else
  {
    char v6 = 1;
  }
  v7 = [(NTSectionPresencePersonalizationOperation *)self relativeRequests];
  v8 = v7;
  if (!v7)
  {
    if (!v5)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[NTSectionPresencePersonalizationOperation validateOperation].cold.5();
      }
      char v10 = 0;
      goto LABEL_20;
    }
LABEL_16:
    char v10 = 1;
LABEL_20:
    char v9 = 1;
    goto LABEL_21;
  }
  if (!objc_msgSend(v7, "fc_containsObjectPassingTest:", &__block_literal_global_93)) {
    goto LABEL_16;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionPresencePersonalizationOperation validateOperation].cold.4();
  }
  char v9 = 0;
  char v10 = 1;
LABEL_21:
  v11 = [(NTSectionPresencePersonalizationOperation *)self absolutePresenceHandler];

  if (v5 && !v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionPresencePersonalizationOperation validateOperation]();
  }
  v12 = [(NTSectionPresencePersonalizationOperation *)self relativePresenceHandler];

  if (v8 && !v12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionPresencePersonalizationOperation validateOperation]();
  }
  v13 = [(NTSectionPresencePersonalizationOperation *)self personalizationCompletion];

  if (!v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionPresencePersonalizationOperation validateOperation]();
  }
  char v14 = v10 & v6 & v9;
  if (!v3) {
    char v14 = 0;
  }
  if (v13) {
    BOOL v15 = v14;
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

BOOL __62__NTSectionPresencePersonalizationOperation_validateOperation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [v2 feature];
  if (v3)
  {
    v4 = [v2 absolutePresenceConfig];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

BOOL __62__NTSectionPresencePersonalizationOperation_validateOperation__block_invoke_90(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [v2 targetSectionFeature];
  if (v3)
  {
    v4 = [v2 competingSectionFeature];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)performOperation
{
  objc_super v3 = [(NTSectionPresencePersonalizationOperation *)self absoluteRequests];
  v4 = [(NTSectionPresencePersonalizationOperation *)self relativeRequests];
  BOOL v5 = (void *)MEMORY[0x263EFF8C0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke;
  v17[3] = &unk_26475C020;
  id v6 = v3;
  id v18 = v6;
  id v7 = v4;
  id v19 = v7;
  v8 = objc_msgSend(v5, "fc_array:", v17);
  char v9 = objc_opt_new();
  char v10 = [(NTSectionPresencePersonalizationOperation *)self aggregateStore];
  [v9 setAggregateStore:v10];

  v11 = [(NTSectionPresencePersonalizationOperation *)self personalizationTreatment];
  [v9 setPersonalizationTreatment:v11];

  [v9 setLookupRequests:v8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_4;
  v14[3] = &unk_26475D790;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [v9 setLookupCompletion:v14];
  [(FCOperation *)self associateChildOperation:v9];
  [v9 start];
}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_2;
  v10[3] = &unk_26475D6D0;
  id v5 = v3;
  id v11 = v5;
  [v4 enumerateObjectsUsingBlock:v10];
  id v6 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_3;
  v8[3] = &unk_26475D6F8;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = (id)objc_opt_new();
  v4 = [v3 feature];
  [v7 setPersonalizationFeature:v4];

  [v3 featureImpressionPrior];
  objc_msgSend(v7, "setImpressionPrior:");
  [v3 featureClickPrior];
  double v6 = v5;

  [v7 setClickPrior:v6];
  [*(id *)(a1 + 32) addObject:v7];
}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = (id)objc_opt_new();
  v4 = [v3 targetSectionFeature];
  [v9 setPersonalizationFeature:v4];

  [v3 targetSectionFeatureImpressionPrior];
  objc_msgSend(v9, "setImpressionPrior:");
  [v3 targetSectionFeatureClickPrior];
  objc_msgSend(v9, "setClickPrior:");
  [*(id *)(a1 + 32) addObject:v9];
  double v5 = objc_opt_new();
  double v6 = [v3 competingSectionFeature];
  [v5 setPersonalizationFeature:v6];

  [v3 competingSectionFeatureImpressionPrior];
  objc_msgSend(v5, "setImpressionPrior:");
  [v3 competingSectionFeatureClickPrior];
  double v8 = v7;

  [v5 setClickPrior:v8];
  [*(id *)(a1 + 32) addObject:v5];
}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:a3];
  }
  else
  {
    double v6 = objc_opt_new();
    double v7 = [*(id *)(a1 + 32) personalizationTreatment];
    double v8 = [v7 defaultScoringConfig];
    [v8 decayFactor];
    uint64_t v10 = v9;

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_5;
    v28[3] = &__block_descriptor_40_e24_d32__0__NSNumber_8d16d24l;
    v28[4] = v10;
    id v11 = (void *)MEMORY[0x22A638590](v28);
    id v12 = *(void **)(a1 + 40);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_6;
    v24[3] = &unk_26475D740;
    id v13 = v5;
    id v25 = v13;
    id v14 = v11;
    id v26 = v6;
    id v27 = v14;
    id v15 = v6;
    [v12 enumerateObjectsUsingBlock:v24];
    [*(id *)(a1 + 32) setAbsolutePresenceResult:v15];
    id v16 = objc_opt_new();
    v17 = *(void **)(a1 + 48);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_132;
    v20[3] = &unk_26475D768;
    id v22 = v16;
    id v23 = v14;
    id v21 = v13;
    id v18 = v16;
    id v19 = v14;
    [v17 enumerateObjectsUsingBlock:v20];
    [*(id *)(a1 + 32) setRelativePresenceResult:v18];
    [*(id *)(a1 + 32) finishedPerformingOperationWithError:0];
  }
}

double __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_5(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  id v8 = objc_alloc_init(MEMORY[0x263F5A2E8]);
  [v8 setClicks:a3];
  [v8 setImpressions:a4];
  if (v7) {
    [v7 doubleValue];
  }
  else {
    [v8 personalizationValueWithBaseline:0 decayRate:*(double *)(a1 + 32)];
  }
  double v10 = v9;

  return v10;
}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 feature];
  id v5 = [v3 absolutePresenceConfig];
  uint64_t v6 = [v5 sectionEdition];
  id v7 = NSString;
  id v8 = [v4 personalizationIdentifier];
  uint64_t v9 = [v7 stringWithFormat:@"NTCache%@", v8];

  double v10 = NewsCoreUserDefaults();
  v39 = (void *)v9;
  id v11 = [v10 arrayForKey:v9];

  if (v11
    && ([v11 objectAtIndexedSubscript:0],
        id v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 unsignedLongLongValue],
        v12,
        v13 == v6))
  {
    id v14 = [v11 objectAtIndexedSubscript:1];
    id v15 = (void *)v9;
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    uint64_t v38 = a1;
    uint64_t v17 = *(void *)(a1 + 48);
    [v3 featureClickPrior];
    double v19 = v18;
    [v3 featureImpressionPrior];
    v36 = (void *)v16;
    (*(void (**)(uint64_t, uint64_t, double, double))(v17 + 16))(v17, v16, v19, v20);
    [v5 minProbabilityToShow];
    [v5 cTRToHide];
    [v5 cTRToShow];
    FCClamp();
    double v22 = v21;
    id v23 = NSNumber;
    FCRandom();
    id v14 = [v23 numberWithInt:v24 <= v22];
    id v25 = NSString;
    id v26 = [v4 personalizationIdentifier];
    id v27 = [NSNumber numberWithDouble:v22];
    uint64_t v37 = v6;
    v28 = [NSNumber numberWithUnsignedLongLong:v6];
    int v29 = [v14 BOOLValue];
    v30 = @"hiding";
    if (v29) {
      v30 = @"showing";
    }
    v31 = [v25 stringWithFormat:@"Section %@ has a probability of %@ to display in widget. The edition %@ is %@ the section.", v26, v27, v28, v30];

    v32 = *MEMORY[0x263F59300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F59300], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v31;
      _os_log_impl(&dword_22592C000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    v33 = NewsCoreUserDefaults();
    v34 = [NSNumber numberWithUnsignedLongLong:v37];
    v40[0] = v34;
    v40[1] = v14;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
    id v15 = v39;
    [v33 setObject:v35 forKey:v39];

    a1 = v38;
  }
  [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v4];
}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_132(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 targetSectionFeature];
  id v5 = [v3 competingSectionFeature];
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  uint64_t v8 = *(void *)(a1 + 48);
  [v3 targetSectionFeatureClickPrior];
  double v10 = v9;
  [v3 targetSectionFeatureImpressionPrior];
  double v12 = (*(double (**)(uint64_t, void *, double, double))(v8 + 16))(v8, v6, v10, v11);
  uint64_t v13 = *(void *)(a1 + 48);
  [v3 competingSectionFeatureClickPrior];
  double v15 = v14;
  [v3 competingSectionFeatureImpressionPrior];
  double v17 = (*(double (**)(uint64_t, void *, double, double))(v13 + 16))(v13, v7, v15, v16);
  double v18 = NSNumber;
  [v3 scalar];
  double v20 = v19;

  double v21 = [v18 numberWithInt:v12 >= v17 * v20];
  [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:v4];
  double v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "BOOLValue") ^ 1);
  [*(id *)(a1 + 40) setObject:v22 forKeyedSubscript:v5];

  id v23 = NSString;
  double v24 = [v4 personalizationIdentifier];
  id v25 = [v5 personalizationIdentifier];
  int v26 = [v21 BOOLValue];
  id v27 = @" not";
  if (v26) {
    id v27 = &stru_26D9160F8;
  }
  v28 = [v23 stringWithFormat:@"Target section %@ has a CTR of %f, while the competing section, %@, has a CTR of %f. Target will%@ be shown.", v24, *(void *)&v12, v25, *(void *)&v17, v27];

  int v29 = *MEMORY[0x263F59300];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F59300], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v28;
    _os_log_impl(&dword_22592C000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(NTSectionPresencePersonalizationOperation *)self absolutePresenceHandler];

  if (v5)
  {
    uint64_t v6 = [(NTSectionPresencePersonalizationOperation *)self absolutePresenceHandler];
    id v7 = [(NTSectionPresencePersonalizationOperation *)self absolutePresenceResult];
    ((void (**)(void, void *))v6)[2](v6, v7);
  }
  uint64_t v8 = [(NTSectionPresencePersonalizationOperation *)self relativePresenceHandler];

  if (v8)
  {
    double v9 = [(NTSectionPresencePersonalizationOperation *)self relativePresenceHandler];
    double v10 = [(NTSectionPresencePersonalizationOperation *)self relativePresenceResult];
    ((void (**)(void, void *))v9)[2](v9, v10);
  }
  double v11 = [(NTSectionPresencePersonalizationOperation *)self personalizationCompletion];
  v11[2](v11, v4);
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

- (NSArray)absoluteRequests
{
  return self->_absoluteRequests;
}

- (void)setAbsoluteRequests:(id)a3
{
}

- (NSArray)relativeRequests
{
  return self->_relativeRequests;
}

- (void)setRelativeRequests:(id)a3
{
}

- (id)absolutePresenceHandler
{
  return self->_absolutePresenceHandler;
}

- (void)setAbsolutePresenceHandler:(id)a3
{
}

- (id)relativePresenceHandler
{
  return self->_relativePresenceHandler;
}

- (void)setRelativePresenceHandler:(id)a3
{
}

- (id)personalizationCompletion
{
  return self->_personalizationCompletion;
}

- (void)setPersonalizationCompletion:(id)a3
{
}

- (NSDictionary)absolutePresenceResult
{
  return self->_absolutePresenceResult;
}

- (void)setAbsolutePresenceResult:(id)a3
{
}

- (NSDictionary)relativePresenceResult
{
  return self->_relativePresenceResult;
}

- (void)setRelativePresenceResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePresenceResult, 0);
  objc_storeStrong((id *)&self->_absolutePresenceResult, 0);
  objc_storeStrong(&self->_personalizationCompletion, 0);
  objc_storeStrong(&self->_relativePresenceHandler, 0);
  objc_storeStrong(&self->_absolutePresenceHandler, 0);
  objc_storeStrong((id *)&self->_relativeRequests, 0);
  objc_storeStrong((id *)&self->_absoluteRequests, 0);
  objc_storeStrong((id *)&self->_personalizationTreatment, 0);

  objc_storeStrong((id *)&self->_aggregateStore, 0);
}

- (void)validateOperation
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"section presence personalization operation requires personalization treatment"];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

@end