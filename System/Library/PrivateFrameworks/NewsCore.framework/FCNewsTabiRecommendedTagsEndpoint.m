@interface FCNewsTabiRecommendedTagsEndpoint
- (FCNewsTabiEventAggregationOutputsConfiguration)eventAggregationOutputs;
- (FCNewsTabiRecommendedTagsConfiguration)configuration;
- (FCNewsTabiRecommendedTagsEndpoint)init;
- (FCNewsTabiRecommendedTagsEndpoint)initWithDictionary:(id)a3;
- (NSString)packageAssetID;
- (id)description;
- (void)setConfiguration:(id)a3;
- (void)setEventAggregationOutputs:(id)a3;
- (void)setPackageAssetID:(id)a3;
@end

@implementation FCNewsTabiRecommendedTagsEndpoint

- (FCNewsTabiEventAggregationOutputsConfiguration)eventAggregationOutputs
{
  return self->_eventAggregationOutputs;
}

- (NSString)packageAssetID
{
  return self->_packageAssetID;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiRecommendedTagsEndpoint *)self packageAssetID];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\tpackageAssetID: %@;", v5];

  v6 = [(FCNewsTabiRecommendedTagsEndpoint *)self configuration];
  v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\tconfiguration: %@;", v7];

  v8 = [(FCNewsTabiRecommendedTagsEndpoint *)self eventAggregationOutputs];
  v9 = [v8 indentedDescription];
  [v3 appendFormat:@"\n\teventAggregationOutputs: %@;", v9];

  [v3 appendString:@"\n>"];
  return v3;
}

- (FCNewsTabiRecommendedTagsEndpoint)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationStringValue(v4, @"packageAssetID", 0);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = [[FCNewsTabiRecommendedTagsConfiguration alloc] initWithDictionary:v4];
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      v18.receiver = self;
      v18.super_class = (Class)FCNewsTabiRecommendedTagsEndpoint;
      v11 = [(FCNewsTabiRecommendedTagsEndpoint *)&v18 init];
      v12 = v11;
      if (v11)
      {
        objc_storeStrong((id *)&v11->_packageAssetID, v6);
        objc_storeStrong((id *)&v12->_configuration, v9);
        v13 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"eventAggregationOutputs", 0);
        if (v13)
        {
          v14 = [[FCNewsTabiEventAggregationOutputsConfiguration alloc] initWithDictionary:v13];
          eventAggregationOutputs = v12->_eventAggregationOutputs;
          v12->_eventAggregationOutputs = v14;
        }
      }
      self = v12;
      v16 = self;
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke_5;
      v19[3] = &unk_1E5B4C840;
      v20 = (FCNewsTabiRecommendedTagsConfiguration *)v4;
      __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke_5((uint64_t)v19);
      v16 = (FCNewsTabiRecommendedTagsEndpoint *)objc_claimAutoreleasedReturnValue();
      v10 = v20;
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke;
    v21[3] = &unk_1E5B4C840;
    id v22 = v4;
    __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke((uint64_t)v21);
    v16 = (FCNewsTabiRecommendedTagsEndpoint *)objc_claimAutoreleasedReturnValue();
    id v7 = v22;
  }

  return v16;
}

- (FCNewsTabiRecommendedTagsConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAggregationOutputs, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_packageAssetID, 0);
}

- (FCNewsTabiRecommendedTagsEndpoint)init
{
  return [(FCNewsTabiRecommendedTagsEndpoint *)self initWithDictionary:0];
}

uint64_t __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedTagsEndpoint due to failure to decode packageAssetID from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __56__FCNewsTabiRecommendedTagsEndpoint_initWithDictionary___block_invoke_5(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedTagsEndpoint due to failure to decode configuration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)setPackageAssetID:(id)a3
{
}

- (void)setConfiguration:(id)a3
{
}

- (void)setEventAggregationOutputs:(id)a3
{
}

@end