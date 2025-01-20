@interface FCNewsTabiEventAggregationOutputsConfiguration
- (FCNewsTabiEventAggregationOutputConfiguration)bundleOutputConfiguration;
- (FCNewsTabiEventAggregationOutputConfiguration)nonBundleOutputConfiguration;
- (FCNewsTabiEventAggregationOutputsConfiguration)init;
- (FCNewsTabiEventAggregationOutputsConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiEventAggregationOutputsConfiguration)initWithOutputs:(id)a3;
- (id)description;
- (void)setBundleOutputConfiguration:(id)a3;
- (void)setNonBundleOutputConfiguration:(id)a3;
@end

@implementation FCNewsTabiEventAggregationOutputsConfiguration

- (FCNewsTabiEventAggregationOutputConfiguration)nonBundleOutputConfiguration
{
  return self->_nonBundleOutputConfiguration;
}

- (FCNewsTabiEventAggregationOutputConfiguration)bundleOutputConfiguration
{
  return self->_bundleOutputConfiguration;
}

uint64_t __66__FCNewsTabiEventAggregationOutputsConfiguration_initWithOutputs___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 nonBundleOutputConfiguration];
}

uint64_t __66__FCNewsTabiEventAggregationOutputsConfiguration_initWithOutputs___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 bundleOutputConfiguration];
}

- (FCNewsTabiEventAggregationOutputsConfiguration)initWithOutputs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v17.receiver = self;
    v17.super_class = (Class)FCNewsTabiEventAggregationOutputsConfiguration;
    v5 = [(FCNewsTabiEventAggregationOutputsConfiguration *)&v17 init];
    if (v5)
    {
      v6 = [FCNewsTabiEventAggregationOutputConfiguration alloc];
      v7 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_9);
      uint64_t v8 = [(FCNewsTabiEventAggregationOutputConfiguration *)v6 initWithOutputs:v7];
      bundleOutputConfiguration = v5->_bundleOutputConfiguration;
      v5->_bundleOutputConfiguration = (FCNewsTabiEventAggregationOutputConfiguration *)v8;

      v10 = [FCNewsTabiEventAggregationOutputConfiguration alloc];
      v11 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_11_0);
      uint64_t v12 = [(FCNewsTabiEventAggregationOutputConfiguration *)v10 initWithOutputs:v11];
      nonBundleOutputConfiguration = v5->_nonBundleOutputConfiguration;
      v5->_nonBundleOutputConfiguration = (FCNewsTabiEventAggregationOutputConfiguration *)v12;
    }
    self = v5;
    v14 = self;
  }
  else
  {
    v15 = FCTabiConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v15, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationOutputsConfiguration with external outputs because external outputs were empty", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsTabiEventAggregationOutputsConfiguration *)self bundleOutputConfiguration];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\tbundleOutputConfiguration: %@;", v5];

  v6 = [(FCNewsTabiEventAggregationOutputsConfiguration *)self nonBundleOutputConfiguration];
  v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\tnonBundleOutputConfiguration: %@;", v7];

  [v3 appendString:@"\n>"];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, 0);
}

- (FCNewsTabiEventAggregationOutputsConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [FCNewsTabiEventAggregationOutputConfiguration alloc];
  v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"bundleOutputConfiguration", 0);
  v7 = [(FCNewsTabiEventAggregationOutputConfiguration *)v5 initWithDictionary:v6];

  if (v7)
  {
    uint64_t v8 = v7;
    v9 = [FCNewsTabiEventAggregationOutputConfiguration alloc];
    v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"nonBundleOutputConfiguration", 0);
    v11 = [(FCNewsTabiEventAggregationOutputConfiguration *)v9 initWithDictionary:v10];

    if (v11)
    {
      uint64_t v12 = v11;
      v17.receiver = self;
      v17.super_class = (Class)FCNewsTabiEventAggregationOutputsConfiguration;
      v13 = [(FCNewsTabiEventAggregationOutputsConfiguration *)&v17 init];
      p_isa = (id *)&v13->super.isa;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_bundleOutputConfiguration, v7);
        objc_storeStrong(p_isa + 2, v11);
      }
      self = p_isa;
      v15 = self;
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke_5;
      v18[3] = &unk_1E5B4C840;
      v19 = (FCNewsTabiEventAggregationOutputConfiguration *)v4;
      __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke_5((uint64_t)v18);
      v15 = (FCNewsTabiEventAggregationOutputsConfiguration *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v19;
    }
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke;
    v20[3] = &unk_1E5B4C840;
    v21 = (FCNewsTabiEventAggregationOutputConfiguration *)v4;
    __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke((uint64_t)v20);
    v15 = (FCNewsTabiEventAggregationOutputsConfiguration *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v21;
  }

  return v15;
}

- (FCNewsTabiEventAggregationOutputsConfiguration)init
{
  return [(FCNewsTabiEventAggregationOutputsConfiguration *)self initWithDictionary:0];
}

uint64_t __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationOutputsConfiguration due to failure to decode bundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __69__FCNewsTabiEventAggregationOutputsConfiguration_initWithDictionary___block_invoke_5(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationOutputsConfiguration due to failure to decode nonBundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)setBundleOutputConfiguration:(id)a3
{
}

- (void)setNonBundleOutputConfiguration:(id)a3
{
}

@end