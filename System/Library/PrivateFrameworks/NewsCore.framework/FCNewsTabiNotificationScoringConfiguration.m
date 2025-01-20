@interface FCNewsTabiNotificationScoringConfiguration
- (FCNewsTabiNotificationScoringConfiguration)init;
- (FCNewsTabiNotificationScoringConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiNotificationScoringOutputConfiguration)bundleOutputConfiguration;
- (FCNewsTabiNotificationScoringOutputConfiguration)nonBundleOutputConfiguration;
- (id)description;
- (int64_t)fullBodyEmbeddingDimension;
- (int64_t)maxNotabilityScores;
- (int64_t)maxTopicIds;
- (int64_t)titleEmbeddingDimension;
- (void)setBundleOutputConfiguration:(id)a3;
- (void)setFullBodyEmbeddingDimension:(int64_t)a3;
- (void)setMaxNotabilityScores:(int64_t)a3;
- (void)setMaxTopicIds:(int64_t)a3;
- (void)setNonBundleOutputConfiguration:(id)a3;
- (void)setTitleEmbeddingDimension:(int64_t)a3;
@end

@implementation FCNewsTabiNotificationScoringConfiguration

- (FCNewsTabiNotificationScoringConfiguration)init
{
  return [(FCNewsTabiNotificationScoringConfiguration *)self initWithDictionary:0];
}

- (FCNewsTabiNotificationScoringConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [FCNewsTabiNotificationScoringOutputConfiguration alloc];
  v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"bundleOutputConfiguration", 0);
  v7 = [(FCNewsTabiNotificationScoringOutputConfiguration *)v5 initWithDictionary:v6];

  if (v7)
  {
    v8 = v7;
    v9 = FCAppConfigurationNumberValue(v4, @"fullBodyEmbeddingDimension", 0);
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
      v12 = FCAppConfigurationNumberValue(v4, @"maxTopicIds", 0);
      v13 = v12;
      if (v12)
      {
        id v27 = v12;
        v14 = [FCNewsTabiNotificationScoringOutputConfiguration alloc];
        v15 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"nonBundleOutputConfiguration", 0);
        v16 = [(FCNewsTabiNotificationScoringOutputConfiguration *)v14 initWithDictionary:v15];

        if (v16)
        {
          v25 = v16;
          v26 = FCAppConfigurationNumberValue(v4, @"titleEmbeddingDimension", 0);
          if (v26)
          {
            v28.receiver = self;
            v28.super_class = (Class)FCNewsTabiNotificationScoringConfiguration;
            v17 = [(FCNewsTabiNotificationScoringConfiguration *)&v28 init];
            v18 = v17;
            v19 = v27;
            if (v17)
            {
              objc_storeStrong((id *)&v17->_bundleOutputConfiguration, v7);
              v20 = [NSNumber numberWithInt:4];
              v21 = FCAppConfigurationNumberValue(v4, @"maxNotabilityScores", v20);
              v18->_maxNotabilityScores = [v21 integerValue];

              v19 = v27;
              v18->_fullBodyEmbeddingDimension = (int)[v11 intValue];
              v18->_maxTopicIds = (int)[v27 intValue];
              objc_storeStrong((id *)&v18->_nonBundleOutputConfiguration, v16);
              v18->_titleEmbeddingDimension = (int)[v26 intValue];
            }
            self = v18;
            v22 = self;
          }
          else
          {
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_70;
            v29[3] = &unk_1E5B4C840;
            id v30 = v4;
            __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_70((uint64_t)v29);
            v22 = (FCNewsTabiNotificationScoringConfiguration *)objc_claimAutoreleasedReturnValue();

            v19 = v27;
          }

          v23 = v25;
        }
        else
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_69;
          v31[3] = &unk_1E5B4C840;
          v32 = (FCNewsTabiNotificationScoringOutputConfiguration *)v4;
          __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_69((uint64_t)v31);
          v22 = (FCNewsTabiNotificationScoringConfiguration *)objc_claimAutoreleasedReturnValue();
          v23 = v32;
          v19 = v27;
        }
      }
      else
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_68;
        v33[3] = &unk_1E5B4C840;
        id v34 = v4;
        __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_68((uint64_t)v33);
        v22 = (FCNewsTabiNotificationScoringConfiguration *)objc_claimAutoreleasedReturnValue();
        v19 = v34;
      }
    }
    else
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_67;
      v35[3] = &unk_1E5B4C840;
      id v36 = v4;
      __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_67((uint64_t)v35);
      v22 = (FCNewsTabiNotificationScoringConfiguration *)objc_claimAutoreleasedReturnValue();
      id v11 = v36;
    }
  }
  else
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke;
    v37[3] = &unk_1E5B4C840;
    v38 = (FCNewsTabiNotificationScoringOutputConfiguration *)v4;
    __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke((uint64_t)v37);
    v22 = (FCNewsTabiNotificationScoringConfiguration *)objc_claimAutoreleasedReturnValue();
    v8 = v38;
  }

  return v22;
}

uint64_t __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiNotificationScoringConfiguration due to failure to decode bundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_67(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiNotificationScoringConfiguration due to failure to decode fullBodyEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_68(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiNotificationScoringConfiguration due to failure to decode maxTopicIds from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_69(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiNotificationScoringConfiguration due to failure to decode nonBundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __65__FCNewsTabiNotificationScoringConfiguration_initWithDictionary___block_invoke_70(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiNotificationScoringConfiguration due to failure to decode titleEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsTabiNotificationScoringConfiguration *)self bundleOutputConfiguration];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\tbundleOutputConfiguration: %@", v5];

  objc_msgSend(v3, "appendFormat:", @"\n\tfullBodyEmbeddingDimension: %lu", -[FCNewsTabiNotificationScoringConfiguration fullBodyEmbeddingDimension](self, "fullBodyEmbeddingDimension"));
  objc_msgSend(v3, "appendFormat:", @"\n\tmaxNotabilityScores: %lu", -[FCNewsTabiNotificationScoringConfiguration maxNotabilityScores](self, "maxNotabilityScores"));
  objc_msgSend(v3, "appendFormat:", @"\n\tmaxTopicIds: %lu", -[FCNewsTabiNotificationScoringConfiguration maxTopicIds](self, "maxTopicIds"));
  v6 = [(FCNewsTabiNotificationScoringConfiguration *)self nonBundleOutputConfiguration];
  int v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\tnonBundleOutputConfiguration: %@", v7];

  objc_msgSend(v3, "appendFormat:", @"\n\ttitleEmbeddingDimension: %lu", -[FCNewsTabiNotificationScoringConfiguration titleEmbeddingDimension](self, "titleEmbeddingDimension"));
  [v3 appendString:@"\n>"];
  return v3;
}

- (FCNewsTabiNotificationScoringOutputConfiguration)bundleOutputConfiguration
{
  return self->_bundleOutputConfiguration;
}

- (void)setBundleOutputConfiguration:(id)a3
{
}

- (int64_t)fullBodyEmbeddingDimension
{
  return self->_fullBodyEmbeddingDimension;
}

- (void)setFullBodyEmbeddingDimension:(int64_t)a3
{
  self->_fullBodyEmbeddingDimension = a3;
}

- (int64_t)maxNotabilityScores
{
  return self->_maxNotabilityScores;
}

- (void)setMaxNotabilityScores:(int64_t)a3
{
  self->_maxNotabilityScores = a3;
}

- (int64_t)maxTopicIds
{
  return self->_maxTopicIds;
}

- (void)setMaxTopicIds:(int64_t)a3
{
  self->_maxTopicIds = a3;
}

- (FCNewsTabiNotificationScoringOutputConfiguration)nonBundleOutputConfiguration
{
  return self->_nonBundleOutputConfiguration;
}

- (void)setNonBundleOutputConfiguration:(id)a3
{
}

- (int64_t)titleEmbeddingDimension
{
  return self->_titleEmbeddingDimension;
}

- (void)setTitleEmbeddingDimension:(int64_t)a3
{
  self->_titleEmbeddingDimension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBundleOutputConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleOutputConfiguration, 0);
}

@end