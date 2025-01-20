@interface FCNewsTabiEventAggregationOutputConfiguration
- (FCNewsTabiEventAggregationOutputConfiguration)init;
- (FCNewsTabiEventAggregationOutputConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiEventAggregationOutputConfiguration)initWithOutputs:(id)a3;
- (NSArray)outputNames;
- (id)description;
- (void)setOutputNames:(id)a3;
@end

@implementation FCNewsTabiEventAggregationOutputConfiguration

- (void).cxx_destruct
{
}

- (FCNewsTabiEventAggregationOutputConfiguration)initWithOutputs:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__FCNewsTabiEventAggregationOutputConfiguration_initWithOutputs___block_invoke;
  v15[3] = &unk_1E5B4C2F0;
  id v6 = v4;
  id v16 = v6;
  v7 = objc_msgSend(v5, "fc_set:", v15);
  if ([v7 count])
  {
    v14.receiver = self;
    v14.super_class = (Class)FCNewsTabiEventAggregationOutputConfiguration;
    v8 = [(FCNewsTabiEventAggregationOutputConfiguration *)&v14 init];
    if (v8)
    {
      uint64_t v9 = [v7 allObjects];
      outputNames = v8->_outputNames;
      v8->_outputNames = (NSArray *)v9;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v12 = FCTabiConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v12, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationOutputConfiguration from external outputs due to their being no outputs specified", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsTabiEventAggregationOutputConfiguration *)self outputNames];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\toutputNames: %@;", v5];

  [v3 appendString:@"\n>"];
  return v3;
}

void __65__FCNewsTabiEventAggregationOutputConfiguration_initWithOutputs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "outputNames", (void)v10);
        objc_msgSend(v3, "fc_safelyAddObjects:", v9);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSArray)outputNames
{
  return self->_outputNames;
}

- (FCNewsTabiEventAggregationOutputConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"outputNames", 0);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v12.receiver = self;
    v12.super_class = (Class)FCNewsTabiEventAggregationOutputConfiguration;
    uint64_t v8 = [(FCNewsTabiEventAggregationOutputConfiguration *)&v12 init];
    uint64_t v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_outputNames, v6);
    }
    self = v9;
    long long v10 = self;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__FCNewsTabiEventAggregationOutputConfiguration_initWithDictionary___block_invoke;
    v13[3] = &unk_1E5B4C840;
    id v14 = v4;
    __68__FCNewsTabiEventAggregationOutputConfiguration_initWithDictionary___block_invoke((uint64_t)v13);
    long long v10 = (FCNewsTabiEventAggregationOutputConfiguration *)objc_claimAutoreleasedReturnValue();
    id v7 = v14;
  }

  return v10;
}

- (FCNewsTabiEventAggregationOutputConfiguration)init
{
  return [(FCNewsTabiEventAggregationOutputConfiguration *)self initWithDictionary:0];
}

uint64_t __68__FCNewsTabiEventAggregationOutputConfiguration_initWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = v2;
    uint64_t v6 = [v4 description];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationOutputConfiguration due to failure to decode outputNames from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)setOutputNames:(id)a3
{
}

@end