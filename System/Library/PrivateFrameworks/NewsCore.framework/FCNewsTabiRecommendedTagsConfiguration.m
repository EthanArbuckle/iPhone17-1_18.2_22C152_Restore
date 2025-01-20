@interface FCNewsTabiRecommendedTagsConfiguration
- (BOOL)filterLocationSuggestionsOnlyToAppleNewsLocal;
- (FCNewsTabiRecommendedTagsConfiguration)init;
- (FCNewsTabiRecommendedTagsConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiRecommendedTagsContextConfiguration)contextConfiguration;
- (FCNewsTabiRecommendedTagsContextConfiguration)userContextConfiguration;
- (FCNewsTabiRecommendedTagsInputOutputConfiguration)bundleInputOutputConfiguration;
- (FCNewsTabiRecommendedTagsInputOutputConfiguration)nonBundleInputOutputConfiguration;
- (id)description;
- (void)setBundleInputOutputConfiguration:(id)a3;
- (void)setFilterLocationSuggestionsOnlyToAppleNewsLocal:(BOOL)a3;
- (void)setNonBundleInputOutputConfiguration:(id)a3;
- (void)setUserContextConfiguration:(id)a3;
@end

@implementation FCNewsTabiRecommendedTagsConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiRecommendedTagsConfiguration *)self bundleInputOutputConfiguration];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\tbundleInputOutputConfiguration: %@;", v5];

  v6 = [(FCNewsTabiRecommendedTagsConfiguration *)self nonBundleInputOutputConfiguration];
  v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\tnonBundleInputOutputConfiguration: %@;", v7];

  v8 = [(FCNewsTabiRecommendedTagsConfiguration *)self userContextConfiguration];
  v9 = [v8 indentedDescription];
  [v3 appendFormat:@"\n\tcontextConfiguration: %@;", v9];

  [v3 appendString:@"\n>"];
  return v3;
}

- (FCNewsTabiRecommendedTagsConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [FCNewsTabiRecommendedTagsInputOutputConfiguration alloc];
  v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"bundleInputOutputConfiguration", 0);
  v7 = [(FCNewsTabiRecommendedTagsInputOutputConfiguration *)v5 initWithDictionary:v6];

  if (v7)
  {
    v8 = v7;
    v9 = [FCNewsTabiRecommendedTagsInputOutputConfiguration alloc];
    v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"nonBundleInputOutputConfiguration", 0);
    v11 = [(FCNewsTabiRecommendedTagsInputOutputConfiguration *)v9 initWithDictionary:v10];

    if (v11)
    {
      v12 = v11;
      v20.receiver = self;
      v20.super_class = (Class)FCNewsTabiRecommendedTagsConfiguration;
      v13 = [(FCNewsTabiRecommendedTagsConfiguration *)&v20 init];
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_bundleInputOutputConfiguration, v7);
        objc_storeStrong((id *)&v14->_nonBundleInputOutputConfiguration, v11);
        v15 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"contextConfiguration", 0);
        v16 = [[FCNewsTabiRecommendedTagsContextConfiguration alloc] initWithDictionary:v15];
        contextConfiguration = v14->_contextConfiguration;
        v14->_contextConfiguration = v16;
      }
      self = v14;
      v18 = self;
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke_58;
      v21[3] = &unk_1E5B4C840;
      v22 = (FCNewsTabiRecommendedTagsInputOutputConfiguration *)v4;
      __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke_58((uint64_t)v21);
      v18 = (FCNewsTabiRecommendedTagsConfiguration *)objc_claimAutoreleasedReturnValue();
      v12 = v22;
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke;
    v23[3] = &unk_1E5B4C840;
    v24 = (FCNewsTabiRecommendedTagsInputOutputConfiguration *)v4;
    __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke((uint64_t)v23);
    v18 = (FCNewsTabiRecommendedTagsConfiguration *)objc_claimAutoreleasedReturnValue();
    v8 = v24;
  }

  return v18;
}

- (FCNewsTabiRecommendedTagsContextConfiguration)userContextConfiguration
{
  return self->_userContextConfiguration;
}

- (FCNewsTabiRecommendedTagsInputOutputConfiguration)nonBundleInputOutputConfiguration
{
  return self->_nonBundleInputOutputConfiguration;
}

- (FCNewsTabiRecommendedTagsInputOutputConfiguration)bundleInputOutputConfiguration
{
  return self->_bundleInputOutputConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userContextConfiguration, 0);
  objc_storeStrong((id *)&self->_contextConfiguration, 0);
  objc_storeStrong((id *)&self->_nonBundleInputOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleInputOutputConfiguration, 0);
}

- (FCNewsTabiRecommendedTagsConfiguration)init
{
  return [(FCNewsTabiRecommendedTagsConfiguration *)self initWithDictionary:0];
}

uint64_t __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedTagsConfiguration due to failure to decode bundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __61__FCNewsTabiRecommendedTagsConfiguration_initWithDictionary___block_invoke_58(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedTagsConfiguration due to failure to decode nonBundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)setBundleInputOutputConfiguration:(id)a3
{
}

- (void)setNonBundleInputOutputConfiguration:(id)a3
{
}

- (FCNewsTabiRecommendedTagsContextConfiguration)contextConfiguration
{
  return self->_contextConfiguration;
}

- (void)setUserContextConfiguration:(id)a3
{
}

- (BOOL)filterLocationSuggestionsOnlyToAppleNewsLocal
{
  return self->_filterLocationSuggestionsOnlyToAppleNewsLocal;
}

- (void)setFilterLocationSuggestionsOnlyToAppleNewsLocal:(BOOL)a3
{
  self->_filterLocationSuggestionsOnlyToAppleNewsLocal = a3;
}

@end