@interface FCNewsTabiTagSuggestionsConfiguration
- (FCNewsTabiTagSuggestionsConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiTagSuggestionsOutputConfiguration)bundleOutputConfiguration;
- (FCNewsTabiTagSuggestionsOutputConfiguration)nonBundleOutputConfiguration;
- (id)description;
- (void)setBundleOutputConfiguration:(id)a3;
- (void)setNonBundleOutputConfiguration:(id)a3;
@end

@implementation FCNewsTabiTagSuggestionsConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiTagSuggestionsConfiguration *)self bundleOutputConfiguration];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\tbundleOutputConfiguration: %@;", v5];

  v6 = [(FCNewsTabiTagSuggestionsConfiguration *)self nonBundleOutputConfiguration];
  v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\tnonBundleOutputConfiguration: %@;", v7];

  [v3 appendString:@"\n>"];
  return v3;
}

- (FCNewsTabiTagSuggestionsConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [FCNewsTabiTagSuggestionsOutputConfiguration alloc];
  v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"bundleOutputConfiguration", 0);
  v7 = [(FCNewsTabiTagSuggestionsOutputConfiguration *)v5 initWithDictionary:v6];

  if (v7)
  {
    v8 = v7;
    v9 = [FCNewsTabiTagSuggestionsOutputConfiguration alloc];
    v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"nonBundleOutputConfiguration", 0);
    v11 = [(FCNewsTabiTagSuggestionsOutputConfiguration *)v9 initWithDictionary:v10];

    if (v11)
    {
      v12 = v11;
      v17.receiver = self;
      v17.super_class = (Class)FCNewsTabiTagSuggestionsConfiguration;
      v13 = [(FCNewsTabiTagSuggestionsConfiguration *)&v17 init];
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
      v18[2] = __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke_55;
      v18[3] = &unk_1E5B4C840;
      v19 = (FCNewsTabiTagSuggestionsOutputConfiguration *)v4;
      __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke_55((uint64_t)v18);
      v15 = (FCNewsTabiTagSuggestionsConfiguration *)objc_claimAutoreleasedReturnValue();
      v12 = v19;
    }
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke;
    v20[3] = &unk_1E5B4C840;
    v21 = (FCNewsTabiTagSuggestionsOutputConfiguration *)v4;
    __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke((uint64_t)v20);
    v15 = (FCNewsTabiTagSuggestionsConfiguration *)objc_claimAutoreleasedReturnValue();
    v8 = v21;
  }

  return v15;
}

- (FCNewsTabiTagSuggestionsOutputConfiguration)nonBundleOutputConfiguration
{
  return self->_nonBundleOutputConfiguration;
}

- (FCNewsTabiTagSuggestionsOutputConfiguration)bundleOutputConfiguration
{
  return self->_bundleOutputConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, 0);
}

uint64_t __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsConfiguration due to failure to decode bundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __60__FCNewsTabiTagSuggestionsConfiguration_initWithDictionary___block_invoke_55(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsConfiguration due to failure to decode nonBundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
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