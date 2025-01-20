@interface FCNewsTabiChannelPickerSuggestionsConfiguration
- (BOOL)filterLocationSuggestionsOnlyToAppleNewsLocal;
- (FCNewsTabiChannelPickerSuggestionsConfiguration)init;
- (FCNewsTabiChannelPickerSuggestionsConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)bundleInputOutputConfiguration;
- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)nonBundleInputOutputConfiguration;
- (FCNewsTabiChannelPickerSuggestionsUserContextConfiguration)userContextConfiguration;
- (id)description;
- (void)setBundleInputOutputConfiguration:(id)a3;
- (void)setFilterLocationSuggestionsOnlyToAppleNewsLocal:(BOOL)a3;
- (void)setNonBundleInputOutputConfiguration:(id)a3;
- (void)setUserContextConfiguration:(id)a3;
@end

@implementation FCNewsTabiChannelPickerSuggestionsConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiChannelPickerSuggestionsConfiguration *)self bundleInputOutputConfiguration];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\tbundleInputOutputConfiguration: %@;", v5];

  objc_msgSend(v3, "appendFormat:", @"\n\tfilterLocationSuggestionsOnlyToAppleNewsLocal: %d;",
    [(FCNewsTabiChannelPickerSuggestionsConfiguration *)self filterLocationSuggestionsOnlyToAppleNewsLocal]);
  v6 = [(FCNewsTabiChannelPickerSuggestionsConfiguration *)self nonBundleInputOutputConfiguration];
  v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\tnonBundleInputOutputConfiguration: %@;", v7];

  v8 = [(FCNewsTabiChannelPickerSuggestionsConfiguration *)self userContextConfiguration];
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

- (FCNewsTabiChannelPickerSuggestionsConfiguration)initWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration alloc];
  v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"bundleInputOutputConfiguration", 0);
  v7 = [(FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)v5 initWithDictionary:v6];

  if (v7)
  {
    v8 = v7;
    v9 = [FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration alloc];
    v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"nonBundleInputOutputConfiguration", 0);
    v11 = [(FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)v9 initWithDictionary:v10];

    if (v11)
    {
      v12 = v11;
      v25.receiver = self;
      v25.super_class = (Class)FCNewsTabiChannelPickerSuggestionsConfiguration;
      v13 = [(FCNewsTabiChannelPickerSuggestionsConfiguration *)&v25 init];
      v14 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_bundleInputOutputConfiguration, v7);
        objc_storeStrong((id *)&v14->_nonBundleInputOutputConfiguration, v11);
        v15 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"userContextConfiguration", 0);
        v16 = [[FCNewsTabiChannelPickerSuggestionsUserContextConfiguration alloc] initWithDictionary:v15];
        userContextConfiguration = v14->_userContextConfiguration;
        v14->_userContextConfiguration = v16;

        if (NFInternalBuild()
          && (NewsCoreUserDefaults(),
              v18 = objc_claimAutoreleasedReturnValue(),
              int v19 = [v18 BOOLForKey:@"news.news_personalization.should_override_local_channel_picker_configuration"], v18, v19))
        {
          v20 = NewsCoreUserDefaults();
          int v21 = [v20 BOOLForKey:@"news.news_personalization.should_filter_location_suggestions_only_to_apple_news_local"];

          v22 = FCTabiConfigurationLog;
          if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v31 = v21;
            _os_log_error_impl(&dword_1A460D000, v22, OS_LOG_TYPE_ERROR, "See override for filterLocationSuggestionsOnlyToAppleNewsLocal, setting to %d", buf, 8u);
          }
          v14->_filterLocationSuggestionsOnlyToAppleNewsLocal = v21;
        }
        else
        {
          v14->_filterLocationSuggestionsOnlyToAppleNewsLocal = FCAppConfigurationBoolValue(v4, @"filterLocationSuggestionsOnlyToAppleNewsLocal", 0);
        }
      }
      self = v14;
      v23 = self;
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke_61;
      v26[3] = &unk_1E5B4C840;
      v27 = (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)v4;
      __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke_61((uint64_t)v26);
      v23 = (FCNewsTabiChannelPickerSuggestionsConfiguration *)objc_claimAutoreleasedReturnValue();
      v12 = v27;
    }
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke;
    v28[3] = &unk_1E5B4C840;
    v29 = (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration *)v4;
    __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke((uint64_t)v28);
    v23 = (FCNewsTabiChannelPickerSuggestionsConfiguration *)objc_claimAutoreleasedReturnValue();
    v8 = v29;
  }

  return v23;
}

- (FCNewsTabiChannelPickerSuggestionsUserContextConfiguration)userContextConfiguration
{
  return self->_userContextConfiguration;
}

- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)nonBundleInputOutputConfiguration
{
  return self->_nonBundleInputOutputConfiguration;
}

- (BOOL)filterLocationSuggestionsOnlyToAppleNewsLocal
{
  return self->_filterLocationSuggestionsOnlyToAppleNewsLocal;
}

- (FCNewsTabiChannelPickerSuggestionsInputOutputConfiguration)bundleInputOutputConfiguration
{
  return self->_bundleInputOutputConfiguration;
}

- (FCNewsTabiChannelPickerSuggestionsConfiguration)init
{
  return [(FCNewsTabiChannelPickerSuggestionsConfiguration *)self initWithDictionary:0];
}

uint64_t __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiChannelPickerSuggestionsConfiguration due to failure to decode bundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __70__FCNewsTabiChannelPickerSuggestionsConfiguration_initWithDictionary___block_invoke_61(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiChannelPickerSuggestionsConfiguration due to failure to decode nonBundleInputOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
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

- (void)setFilterLocationSuggestionsOnlyToAppleNewsLocal:(BOOL)a3
{
  self->_filterLocationSuggestionsOnlyToAppleNewsLocal = a3;
}

@end