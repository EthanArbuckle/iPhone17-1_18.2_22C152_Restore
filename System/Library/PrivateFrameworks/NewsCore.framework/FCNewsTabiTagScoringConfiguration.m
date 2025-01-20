@interface FCNewsTabiTagScoringConfiguration
- (FCNewsTabiTagScoringConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiTagScoringOutputConfiguration)bundleOutputConfiguration;
- (FCNewsTabiTagScoringOutputConfiguration)nonBundleOutputConfiguration;
- (double)minimumChannelScoreForGrouping;
- (id)description;
- (void)setBundleOutputConfiguration:(id)a3;
- (void)setMinimumChannelScoreForGrouping:(double)a3;
- (void)setNonBundleOutputConfiguration:(id)a3;
@end

@implementation FCNewsTabiTagScoringConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiTagScoringConfiguration *)self bundleOutputConfiguration];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\tbundleOutputConfiguration: %@;", v5];

  [(FCNewsTabiTagScoringConfiguration *)self minimumChannelScoreForGrouping];
  objc_msgSend(v3, "appendFormat:", @"\n\tminimumChannelScoreForGrouping: %.4f;", v6);
  v7 = [(FCNewsTabiTagScoringConfiguration *)self nonBundleOutputConfiguration];
  v8 = [v7 indentedDescription];
  [v3 appendFormat:@"\n\tnonBundleOutputConfiguration: %@;", v8];

  [v3 appendString:@"\n>"];
  return v3;
}

- (FCNewsTabiTagScoringConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [FCNewsTabiTagScoringOutputConfiguration alloc];
  uint64_t v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"bundleOutputConfiguration", 0);
  v7 = [(FCNewsTabiTagScoringOutputConfiguration *)v5 initWithDictionary:v6];

  if (v7)
  {
    v8 = v7;
    v9 = [FCNewsTabiTagScoringOutputConfiguration alloc];
    v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"nonBundleOutputConfiguration", 0);
    v11 = [(FCNewsTabiTagScoringOutputConfiguration *)v9 initWithDictionary:v10];

    if (v11)
    {
      v12 = v11;
      v17.receiver = self;
      v17.super_class = (Class)FCNewsTabiTagScoringConfiguration;
      v13 = [(FCNewsTabiTagScoringConfiguration *)&v17 init];
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_bundleOutputConfiguration, v7);
        v14->_minimumChannelScoreForGrouping = FCAppConfigurationDoubleValue(v4, @"minimumChannelScoreForGrouping", 0.03);
        objc_storeStrong((id *)&v14->_nonBundleOutputConfiguration, v11);
      }
      self = v14;
      v15 = self;
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __56__FCNewsTabiTagScoringConfiguration_initWithDictionary___block_invoke_58;
      v18[3] = &unk_1E5B4C840;
      v19 = (FCNewsTabiTagScoringOutputConfiguration *)v4;
      __56__FCNewsTabiTagScoringConfiguration_initWithDictionary___block_invoke_58((uint64_t)v18);
      v15 = (FCNewsTabiTagScoringConfiguration *)objc_claimAutoreleasedReturnValue();
      v12 = v19;
    }
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__FCNewsTabiTagScoringConfiguration_initWithDictionary___block_invoke;
    v20[3] = &unk_1E5B4C840;
    v21 = (FCNewsTabiTagScoringOutputConfiguration *)v4;
    __56__FCNewsTabiTagScoringConfiguration_initWithDictionary___block_invoke((uint64_t)v20);
    v15 = (FCNewsTabiTagScoringConfiguration *)objc_claimAutoreleasedReturnValue();
    v8 = v21;
  }

  return v15;
}

- (FCNewsTabiTagScoringOutputConfiguration)nonBundleOutputConfiguration
{
  return self->_nonBundleOutputConfiguration;
}

- (double)minimumChannelScoreForGrouping
{
  return self->_minimumChannelScoreForGrouping;
}

- (FCNewsTabiTagScoringOutputConfiguration)bundleOutputConfiguration
{
  return self->_bundleOutputConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, 0);
}

uint64_t __56__FCNewsTabiTagScoringConfiguration_initWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    uint64_t v6 = [v4 description];
    int v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagScoringConfiguration due to failure to decode bundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __56__FCNewsTabiTagScoringConfiguration_initWithDictionary___block_invoke_58(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    uint64_t v6 = [v4 description];
    int v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagScoringConfiguration due to failure to decode nonBundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)setBundleOutputConfiguration:(id)a3
{
}

- (void)setNonBundleOutputConfiguration:(id)a3
{
}

- (void)setMinimumChannelScoreForGrouping:(double)a3
{
  self->_minimumChannelScoreForGrouping = a3;
}

@end