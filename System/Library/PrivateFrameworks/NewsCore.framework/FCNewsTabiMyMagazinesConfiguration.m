@interface FCNewsTabiMyMagazinesConfiguration
- (FCNewsTabiMyMagazinesConfiguration)initWithDictionary:(id)a3;
- (NSString)scoreOutputName;
- (id)description;
- (int64_t)fullBodyEmbeddingDimension;
- (int64_t)maxTopicIds;
- (int64_t)titleEmbeddingDimension;
- (void)setFullBodyEmbeddingDimension:(int64_t)a3;
- (void)setMaxTopicIds:(int64_t)a3;
- (void)setScoreOutputName:(id)a3;
- (void)setTitleEmbeddingDimension:(int64_t)a3;
@end

@implementation FCNewsTabiMyMagazinesConfiguration

- (FCNewsTabiMyMagazinesConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationNumberValue(v4, @"maxTopicIds", 0);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = FCAppConfigurationNumberValue(v4, @"titleEmbeddingDimension", 0);
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v11 = FCAppConfigurationNumberValue(v4, @"fullBodyEmbeddingDimension", 0);
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
        v14 = FCAppConfigurationStringValue(v4, @"scoreOutputName", 0);
        v15 = v14;
        if (v14)
        {
          id v20 = v14;
          v21.receiver = self;
          v21.super_class = (Class)FCNewsTabiMyMagazinesConfiguration;
          v16 = [(FCNewsTabiMyMagazinesConfiguration *)&v21 init];
          if (v16)
          {
            v16->_maxTopicIds = (int)[v7 intValue];
            v16->_titleEmbeddingDimension = (int)[v10 intValue];
            v16->_fullBodyEmbeddingDimension = (int)[v13 intValue];
            objc_storeStrong((id *)&v16->_scoreOutputName, v15);
          }
          self = v16;
          v17 = self;
          v18 = v20;
        }
        else
        {
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_62;
          v22[3] = &unk_1E5B4C840;
          id v23 = v4;
          __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_62((uint64_t)v22);
          v17 = (FCNewsTabiMyMagazinesConfiguration *)objc_claimAutoreleasedReturnValue();
          v18 = v23;
        }
      }
      else
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_61;
        v24[3] = &unk_1E5B4C840;
        id v25 = v4;
        __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_61((uint64_t)v24);
        v17 = (FCNewsTabiMyMagazinesConfiguration *)objc_claimAutoreleasedReturnValue();
        id v13 = v25;
      }
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_60;
      v26[3] = &unk_1E5B4C840;
      id v27 = v4;
      __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_60((uint64_t)v26);
      v17 = (FCNewsTabiMyMagazinesConfiguration *)objc_claimAutoreleasedReturnValue();
      id v10 = v27;
    }
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke;
    v28[3] = &unk_1E5B4C840;
    id v29 = v4;
    __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke((uint64_t)v28);
    v17 = (FCNewsTabiMyMagazinesConfiguration *)objc_claimAutoreleasedReturnValue();
    id v7 = v29;
  }

  return v17;
}

uint64_t __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiMyMagazinesConfiguration due to failure to decode maxTopicIds from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_60(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiMyMagazinesConfiguration due to failure to decode titleEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_61(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiMyMagazinesConfiguration due to failure to decode fullBodyEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __57__FCNewsTabiMyMagazinesConfiguration_initWithDictionary___block_invoke_62(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiMyMagazinesConfiguration due to failure to decode scoreOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"\n\tmaxTopicIds: %lu", -[FCNewsTabiMyMagazinesConfiguration maxTopicIds](self, "maxTopicIds"));
  objc_msgSend(v3, "appendFormat:", @"\n\ttitleEmbeddingDimension: %lu", -[FCNewsTabiMyMagazinesConfiguration titleEmbeddingDimension](self, "titleEmbeddingDimension"));
  objc_msgSend(v3, "appendFormat:", @"\n\tfullBodyEmbeddingDimension: %lu", -[FCNewsTabiMyMagazinesConfiguration fullBodyEmbeddingDimension](self, "fullBodyEmbeddingDimension"));
  id v4 = [(FCNewsTabiMyMagazinesConfiguration *)self scoreOutputName];
  [v3 appendFormat:@"\n\tscoreOutputName: %@;", v4];

  [v3 appendString:@"\n>"];
  return v3;
}

- (int64_t)maxTopicIds
{
  return self->_maxTopicIds;
}

- (void)setMaxTopicIds:(int64_t)a3
{
  self->_maxTopicIds = a3;
}

- (int64_t)titleEmbeddingDimension
{
  return self->_titleEmbeddingDimension;
}

- (void)setTitleEmbeddingDimension:(int64_t)a3
{
  self->_titleEmbeddingDimension = a3;
}

- (int64_t)fullBodyEmbeddingDimension
{
  return self->_fullBodyEmbeddingDimension;
}

- (void)setFullBodyEmbeddingDimension:(int64_t)a3
{
  self->_fullBodyEmbeddingDimension = a3;
}

- (NSString)scoreOutputName
{
  return self->_scoreOutputName;
}

- (void)setScoreOutputName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end