@interface REContentRelevanceProviderManager
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (BOOL)_suppportsPortarit;
- (BOOL)_suppportsSentimentAnalysis;
- (id)_valuesForProvider:(id)a3 context:(id)a4 features:(id)a5;
- (void)modelManagerDidUpdateModel:(id)a3;
- (void)pause;
- (void)predictorDidUpdate:(id)a3;
- (void)resume;
@end

@implementation REContentRelevanceProviderManager

+ (id)_features
{
  v8[4] = *MEMORY[0x263EF8340];
  v2 = +[REFeature sentimentAnalysisFeature];
  v8[0] = v2;
  v3 = +[REFeature negativeSentimentAnalysisFeature];
  v8[1] = v3;
  v4 = +[REFeature sentimentAnalysisCertaintyFeature];
  v8[2] = v4;
  v5 = +[REFeature portraitFeature];
  v8[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

- (id)_valuesForProvider:(id)a3 context:(id)a4 features:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v33 = a4;
  id v8 = a5;
  v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v10)
  {
    v12 = 0;
    goto LABEL_22;
  }
  uint64_t v11 = v10;
  v12 = 0;
  uint64_t v13 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      v16 = +[REFeature portraitFeature];
      int v17 = [v15 isEqual:v16];

      if (v17)
      {
        v18 = +[RESingleton sharedInstance];
        v19 = [v7 keywords];
        [v18 userAffinityToContent:v19];
        v21 = +[REFeatureValue featureValueWithDouble:v20];

        goto LABEL_18;
      }
      if (!v12)
      {
        sentimentAnalyzer = self->_sentimentAnalyzer;
        v23 = [v7 keywords];
        v12 = [(REMLSentimentAnalyzer *)sentimentAnalyzer sentimentForTokens:v23];
      }
      v24 = +[REFeature sentimentAnalysisFeature];
      int v25 = [v15 isEqual:v24];

      if (v25)
      {
        [v12 postivieSentiment];
LABEL_16:
        double v31 = v26;
        goto LABEL_17;
      }
      v27 = +[REFeature negativeSentimentAnalysisFeature];
      int v28 = [v15 isEqual:v27];

      if (v28)
      {
        [v12 negativeSentiment];
        goto LABEL_16;
      }
      v29 = +[REFeature sentimentAnalysisCertaintyFeature];
      int v30 = [v15 isEqual:v29];

      double v31 = 0.0;
      if (v30)
      {
        objc_msgSend(v12, "certainty", 0.0);
        goto LABEL_16;
      }
LABEL_17:
      v21 = +[REFeatureValue featureValueWithDouble:v31];
LABEL_18:
      [v9 addObject:v21];
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v11);
LABEL_22:

  return v9;
}

- (BOOL)_suppportsPortarit
{
  v2 = [(RERelevanceProviderManager *)self effectiveFeatures];
  v3 = +[REFeature portraitFeature];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)_suppportsSentimentAnalysis
{
  v2 = [(RERelevanceProviderManager *)self effectiveFeatures];
  v3 = +[REFeature sentimentAnalysisFeature];
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (void)resume
{
  if ([(REContentRelevanceProviderManager *)self _suppportsPortarit])
  {
    v3 = +[RESingleton sharedInstance];
    [v3 addObserver:self];
  }
  if ([(REContentRelevanceProviderManager *)self _suppportsSentimentAnalysis])
  {
    char v4 = [(RERelevanceProviderManager *)self environment];
    v5 = [v4 relevanceEngine];
    id v14 = [v5 modelManager];

    v12 = v14;
    if (!v14)
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Model Manager should not be nil!", v6, v7, v8, v9, v10, v11, v13);
      v12 = 0;
    }
    [v12 addObserver:self];
    [(REContentRelevanceProviderManager *)self modelManagerDidUpdateModel:v14];
  }
}

- (void)pause
{
  if ([(REContentRelevanceProviderManager *)self _suppportsPortarit])
  {
    v3 = +[RESingleton sharedInstance];
    [v3 removeObserver:self];
  }
  if ([(REContentRelevanceProviderManager *)self _suppportsSentimentAnalysis])
  {
    char v4 = [(RERelevanceProviderManager *)self environment];
    v5 = [v4 relevanceEngine];
    id v7 = [v5 modelManager];

    [v7 removeObserver:self];
    sentimentAnalyzer = self->_sentimentAnalyzer;
    self->_sentimentAnalyzer = 0;
  }
}

- (void)modelManagerDidUpdateModel:(id)a3
{
  id v4 = a3;
  v5 = [(RERelevanceProviderManager *)self _manager_queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__REContentRelevanceProviderManager_modelManagerDidUpdateModel___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__REContentRelevanceProviderManager_modelManagerDidUpdateModel___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) sentimentAnalyzer];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  v5 = *(void **)(a1 + 32);
  id v6 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [v5 _scheduleUpdate:v6];
}

- (void)predictorDidUpdate:(id)a3
{
  id v4 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v4];
}

- (void).cxx_destruct
{
}

@end