@interface PPEventRankerFeaturizer
+ (id)scoreFeatureSchema:(id)a3;
+ (void)clearAssetCache;
- (PPEventRankerFeaturizer)initWithTrialWrapper:(id)a3;
- (id)featureSchema;
@end

@implementation PPEventRankerFeaturizer

- (void).cxx_destruct
{
}

- (id)featureSchema
{
  if (featureSchema_once != -1) {
    dispatch_once(&featureSchema_once, &__block_literal_global_4711);
  }
  v2 = [(id)_cache objectForKey:@"CK"];
  if (v2) {
    goto LABEL_6;
  }
  v3 = +[PPTrialWrapper sharedInstance];
  v2 = [v3 plistForFactorName:@"EventRankerFeatureSchema.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_EVENTS"];

  if (v2)
  {
    [(id)_cache setObject:v2 forKey:@"CK"];
LABEL_6:
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2, 2uLL);

    goto LABEL_7;
  }
  DeepCopy = 0;
LABEL_7:
  return DeepCopy;
}

uint64_t __40__PPEventRankerFeaturizer_featureSchema__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_cache;
  _cache = v0;

  v2 = (void *)_cache;
  return [v2 setCountLimit:1];
}

- (PPEventRankerFeaturizer)initWithTrialWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPEventRankerFeaturizer;
  v6 = [(PPEventRankerFeaturizer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_trialWrapper, a3);
  }

  return v7;
}

+ (void)clearAssetCache
{
}

+ (id)scoreFeatureSchema:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v38 = objc_opt_new();
  v4 = (void *)MEMORY[0x1CB79D060]();
  id v5 = [v3 allKeys];
  v6 = objc_msgSend(v5, "sortedArrayUsingSelector:");

  uint64_t v7 = 0;
  if ([v6 count])
  {
    uint64_t v8 = 0;
    double v9 = 0.0;
    double v10 = 0.0;
    v35 = v6;
    do
    {
      uint64_t v36 = v8;
      uint64_t v37 = v7;
      v11 = [v6 objectAtIndexedSubscript:v8];
      v12 = (void *)MEMORY[0x1CB79D060]();
      v13 = [v3 objectForKeyedSubscript:v11];
      v14 = [v13 allKeys];
      v15 = [v14 sortedArrayUsingSelector:sel_compare_];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
      double v18 = 0.0;
      if (v17)
      {
        uint64_t v19 = v17;
        uint64_t v20 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v40 != v20) {
              objc_enumerationMutation(v16);
            }
            uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * i);
            v23 = [v3 objectForKeyedSubscript:v11];
            v24 = [v23 objectForKeyedSubscript:v22];
            v25 = [v24 objectForKeyedSubscript:@"Value"];

            v26 = [v3 objectForKeyedSubscript:v11];
            v27 = [v26 objectForKeyedSubscript:v22];
            v28 = [v27 objectForKeyedSubscript:@"Weight"];

            [v38 addObject:v25];
            [v25 doubleValue];
            double v30 = v29;
            [v28 doubleValue];
            double v18 = v18 + v30 * v31;
          }
          uint64_t v19 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v19);
      }

      double v10 = v10 + v18;
      BOOL v32 = v18 <= v9;
      if (v18 > v9) {
        double v9 = v18;
      }
      uint64_t v7 = v37;
      if (!v32) {
        uint64_t v7 = v36;
      }

      uint64_t v8 = v36 + 1;
      v6 = v35;
    }
    while (v36 + 1 < (unint64_t)[v35 count]);
  }
  else
  {
    double v10 = 0.0;
  }
  v33 = [[PPEventFeatureScore alloc] initWithFeatureValues:v38 weightedScore:v7 prominentFeature:v10];

  return v33;
}

@end