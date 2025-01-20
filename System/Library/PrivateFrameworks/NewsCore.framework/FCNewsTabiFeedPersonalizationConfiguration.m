@interface FCNewsTabiFeedPersonalizationConfiguration
- (FCNewsTabiFeedPersonalizationConfiguration)init;
- (FCNewsTabiFeedPersonalizationConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiFeedPersonalizationOutputConfiguration)bundleOutputConfiguration;
- (FCNewsTabiFeedPersonalizationOutputConfiguration)nonBundleOutputConfiguration;
- (NSDictionary)dictionary;
- (id)description;
- (int64_t)fullBodyEmbeddingDimension;
- (int64_t)maxTopicIds;
- (int64_t)titleEmbeddingDimension;
- (void)setBundleOutputConfiguration:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setFullBodyEmbeddingDimension:(int64_t)a3;
- (void)setMaxTopicIds:(int64_t)a3;
- (void)setNonBundleOutputConfiguration:(id)a3;
- (void)setTitleEmbeddingDimension:(int64_t)a3;
@end

@implementation FCNewsTabiFeedPersonalizationConfiguration

- (FCNewsTabiFeedPersonalizationConfiguration)initWithDictionary:(id)a3
{
  id v5 = a3;
  v6 = [FCNewsTabiFeedPersonalizationOutputConfiguration alloc];
  v7 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"bundleOutputConfiguration", 0);
  v8 = [(FCNewsTabiFeedPersonalizationOutputConfiguration *)v6 initWithDictionary:v7];

  if (v8)
  {
    v9 = v8;
    v10 = FCAppConfigurationNumberValue(v5, @"fullBodyEmbeddingDimension", 0);
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
      v13 = FCAppConfigurationNumberValue(v5, @"maxTopicIds", 0);
      v14 = v13;
      if (v13)
      {
        v27 = v12;
        id v26 = v13;
        v15 = [FCNewsTabiFeedPersonalizationOutputConfiguration alloc];
        v16 = FCAppConfigurationDictionaryValueWithDefaultValue(v5, @"nonBundleOutputConfiguration", 0);
        v17 = [(FCNewsTabiFeedPersonalizationOutputConfiguration *)v15 initWithDictionary:v16];

        if (v17)
        {
          v25 = v17;
          v18 = FCAppConfigurationNumberValue(v5, @"titleEmbeddingDimension", 0);
          if (v18)
          {
            v28.receiver = self;
            v28.super_class = (Class)FCNewsTabiFeedPersonalizationConfiguration;
            v19 = [(FCNewsTabiFeedPersonalizationConfiguration *)&v28 init];
            v20 = v19;
            v21 = v26;
            if (v19)
            {
              objc_storeStrong((id *)&v19->_dictionary, a3);
              objc_storeStrong((id *)&v20->_bundleOutputConfiguration, v8);
              v20->_fullBodyEmbeddingDimension = (int)[v27 intValue];
              v20->_maxTopicIds = (int)[v26 intValue];
              objc_storeStrong((id *)&v20->_nonBundleOutputConfiguration, v17);
              v20->_titleEmbeddingDimension = (int)[v18 intValue];
            }
            self = v20;
            v22 = self;
          }
          else
          {
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_67;
            v29[3] = &unk_1E5B4C840;
            id v30 = v5;
            __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_67((uint64_t)v29);
            v22 = (FCNewsTabiFeedPersonalizationConfiguration *)objc_claimAutoreleasedReturnValue();

            v21 = v26;
          }

          id v12 = v27;
          v23 = v25;
        }
        else
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_66;
          v31[3] = &unk_1E5B4C840;
          v32 = (FCNewsTabiFeedPersonalizationOutputConfiguration *)v5;
          __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_66((uint64_t)v31);
          v22 = (FCNewsTabiFeedPersonalizationConfiguration *)objc_claimAutoreleasedReturnValue();
          v23 = v32;
          v21 = v26;
          id v12 = v27;
        }
      }
      else
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_65;
        v33[3] = &unk_1E5B4C840;
        id v34 = v5;
        __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_65((uint64_t)v33);
        v22 = (FCNewsTabiFeedPersonalizationConfiguration *)objc_claimAutoreleasedReturnValue();
        v21 = v34;
      }
    }
    else
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_64;
      v35[3] = &unk_1E5B4C840;
      id v36 = v5;
      __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_64((uint64_t)v35);
      v22 = (FCNewsTabiFeedPersonalizationConfiguration *)objc_claimAutoreleasedReturnValue();
      id v12 = v36;
    }
  }
  else
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke;
    v37[3] = &unk_1E5B4C840;
    v38 = (FCNewsTabiFeedPersonalizationOutputConfiguration *)v5;
    __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke((uint64_t)v37);
    v22 = (FCNewsTabiFeedPersonalizationConfiguration *)objc_claimAutoreleasedReturnValue();
    v9 = v38;
  }

  return v22;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiFeedPersonalizationConfiguration *)self bundleOutputConfiguration];
  id v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\tbundleOutputConfiguration: %@", v5];

  objc_msgSend(v3, "appendFormat:", @"\n\tfullBodyEmbeddingDimension: %lu", -[FCNewsTabiFeedPersonalizationConfiguration fullBodyEmbeddingDimension](self, "fullBodyEmbeddingDimension"));
  objc_msgSend(v3, "appendFormat:", @"\n\tmaxTopicIds: %lu", -[FCNewsTabiFeedPersonalizationConfiguration maxTopicIds](self, "maxTopicIds"));
  v6 = [(FCNewsTabiFeedPersonalizationConfiguration *)self nonBundleOutputConfiguration];
  v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\tnonBundleOutputConfiguration: %@", v7];

  objc_msgSend(v3, "appendFormat:", @"\n\ttitleEmbeddingDimension: %lu", -[FCNewsTabiFeedPersonalizationConfiguration titleEmbeddingDimension](self, "titleEmbeddingDimension"));
  [v3 appendString:@"\n>"];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (int64_t)titleEmbeddingDimension
{
  return self->_titleEmbeddingDimension;
}

- (FCNewsTabiFeedPersonalizationOutputConfiguration)nonBundleOutputConfiguration
{
  return self->_nonBundleOutputConfiguration;
}

- (int64_t)maxTopicIds
{
  return self->_maxTopicIds;
}

- (int64_t)fullBodyEmbeddingDimension
{
  return self->_fullBodyEmbeddingDimension;
}

- (FCNewsTabiFeedPersonalizationOutputConfiguration)bundleOutputConfiguration
{
  return self->_bundleOutputConfiguration;
}

- (FCNewsTabiFeedPersonalizationConfiguration)init
{
  return [(FCNewsTabiFeedPersonalizationConfiguration *)self initWithDictionary:0];
}

uint64_t __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    id v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationConfiguration due to failure to decode bundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_64(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    id v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationConfiguration due to failure to decode fullBodyEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_65(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    id v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationConfiguration due to failure to decode maxTopicIds from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_66(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    id v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationConfiguration due to failure to decode nonBundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __65__FCNewsTabiFeedPersonalizationConfiguration_initWithDictionary___block_invoke_67(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(void **)(a1 + 32);
    id v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiFeedPersonalizationConfiguration due to failure to decode titleEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void)setMaxTopicIds:(int64_t)a3
{
  self->_maxTopicIds = a3;
}

- (void)setTitleEmbeddingDimension:(int64_t)a3
{
  self->_titleEmbeddingDimension = a3;
}

- (void)setFullBodyEmbeddingDimension:(int64_t)a3
{
  self->_fullBodyEmbeddingDimension = a3;
}

- (void)setBundleOutputConfiguration:(id)a3
{
}

- (void)setNonBundleOutputConfiguration:(id)a3
{
}

@end