@interface FCNewsTabiRecommendedIssuesConfiguration
- (FCNewsTabiRecommendedIssuesConfiguration)init;
- (FCNewsTabiRecommendedIssuesConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)bundleInputOutputConfiguration;
- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)nonBundleInputOutputConfiguration;
- (FCNewsTabiRecommendedIssuesUserContextConfiguration)userContextConfiguration;
- (id)description;
- (void)setBundleInputOutputConfiguration:(id)a3;
- (void)setNonBundleInputOutputConfiguration:(id)a3;
- (void)setUserContextConfiguration:(id)a3;
@end

@implementation FCNewsTabiRecommendedIssuesConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiRecommendedIssuesConfiguration *)self bundleInputOutputConfiguration];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\tbundleInputOutputConfiguration: %@;", v5];

  v6 = [(FCNewsTabiRecommendedIssuesConfiguration *)self nonBundleInputOutputConfiguration];
  v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\tnonBundleInputOutputConfiguration: %@;", v7];

  v8 = [(FCNewsTabiRecommendedIssuesConfiguration *)self userContextConfiguration];
  v9 = [v8 indentedDescription];
  [v3 appendFormat:@"\n\tuserContextConfiguration: %@;", v9];

  [v3 appendString:@"\n>"];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userContextConfiguration, 0);
  objc_storeStrong((id *)&self->_nonBundleInputOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleInputOutputConfiguration, 0);
}

- (FCNewsTabiRecommendedIssuesConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [FCNewsTabiRecommendedIssuesInputOutputConfiguration alloc];
  v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"bundleInputOutputConfiguration", 0);
  v7 = [(FCNewsTabiRecommendedIssuesInputOutputConfiguration *)v5 initWithDictionary:v6];

  if (v7)
  {
    v8 = v7;
    v9 = [FCNewsTabiRecommendedIssuesInputOutputConfiguration alloc];
    v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"nonBundleInputOutputConfiguration", 0);
    v11 = [(FCNewsTabiRecommendedIssuesInputOutputConfiguration *)v9 initWithDictionary:v10];

    if (v11)
    {
      v12 = v11;
      v20.receiver = self;
      v20.super_class = (Class)FCNewsTabiRecommendedIssuesConfiguration;
      v13 = [(FCNewsTabiRecommendedIssuesConfiguration *)&v20 init];
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_bundleInputOutputConfiguration, v7);
        objc_storeStrong((id *)&v14->_nonBundleInputOutputConfiguration, v11);
        v15 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"userContextConfiguration", 0);
        v16 = [[FCNewsTabiRecommendedIssuesUserContextConfiguration alloc] initWithDictionary:v15];
        userContextConfiguration = v14->_userContextConfiguration;
        v14->_userContextConfiguration = v16;
      }
      self = v14;
      v18 = self;
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke_58;
      v21[3] = &unk_1E5B4C840;
      v22 = (FCNewsTabiRecommendedIssuesInputOutputConfiguration *)v4;
      __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke_58((uint64_t)v21);
      v18 = (FCNewsTabiRecommendedIssuesConfiguration *)objc_claimAutoreleasedReturnValue();
      v12 = v22;
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke;
    v23[3] = &unk_1E5B4C840;
    v24 = (FCNewsTabiRecommendedIssuesInputOutputConfiguration *)v4;
    __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke((uint64_t)v23);
    v18 = (FCNewsTabiRecommendedIssuesConfiguration *)objc_claimAutoreleasedReturnValue();
    v8 = v24;
  }

  return v18;
}

- (FCNewsTabiRecommendedIssuesUserContextConfiguration)userContextConfiguration
{
  return self->_userContextConfiguration;
}

- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)nonBundleInputOutputConfiguration
{
  return self->_nonBundleInputOutputConfiguration;
}

- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)bundleInputOutputConfiguration
{
  return self->_bundleInputOutputConfiguration;
}

- (FCNewsTabiRecommendedIssuesConfiguration)init
{
  return [(FCNewsTabiRecommendedIssuesConfiguration *)self initWithDictionary:0];
}

uint64_t __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedIssuesConfiguration due to failure to decode bundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __63__FCNewsTabiRecommendedIssuesConfiguration_initWithDictionary___block_invoke_58(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedIssuesConfiguration due to failure to decode nonBundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)setBundleInputOutputConfiguration:(id)a3
{
}

- (void)setNonBundleInputOutputConfiguration:(id)a3
{
}

- (void)setUserContextConfiguration:(id)a3
{
}

@end