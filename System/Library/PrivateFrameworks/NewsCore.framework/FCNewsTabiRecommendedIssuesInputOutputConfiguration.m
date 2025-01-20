@interface FCNewsTabiRecommendedIssuesInputOutputConfiguration
- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)init;
- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)initWithDictionary:(id)a3;
- (NSString)contextFeatureKey;
- (NSString)recommendedIssuePublisherOutputName;
- (NSString)recommendedIssuePublisherScoreOutputName;
- (id)description;
- (void)setContextFeatureKey:(id)a3;
- (void)setRecommendedIssuePublisherOutputName:(id)a3;
- (void)setRecommendedIssuePublisherScoreOutputName:(id)a3;
@end

@implementation FCNewsTabiRecommendedIssuesInputOutputConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiRecommendedIssuesInputOutputConfiguration *)self contextFeatureKey];
  [v3 appendFormat:@"\n\tcontextFeatureKey: %@;", v4];

  v5 = [(FCNewsTabiRecommendedIssuesInputOutputConfiguration *)self recommendedIssuePublisherOutputName];
  [v3 appendFormat:@"\n\trecommendedIssuePublisherOutputName: %@;", v5];

  v6 = [(FCNewsTabiRecommendedIssuesInputOutputConfiguration *)self recommendedIssuePublisherScoreOutputName];
  [v3 appendFormat:@"\n\trecommendedIssuePublisherScoreOutputName: %@;", v6];

  [v3 appendString:@"\n>"];
  return v3;
}

- (NSString)recommendedIssuePublisherScoreOutputName
{
  return self->_recommendedIssuePublisherScoreOutputName;
}

- (NSString)recommendedIssuePublisherOutputName
{
  return self->_recommendedIssuePublisherOutputName;
}

- (NSString)contextFeatureKey
{
  return self->_contextFeatureKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedIssuePublisherScoreOutputName, 0);
  objc_storeStrong((id *)&self->_recommendedIssuePublisherOutputName, 0);
  objc_storeStrong((id *)&self->_contextFeatureKey, 0);
}

- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationStringValue(v4, @"contextFeatureKey", 0);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = FCAppConfigurationStringValue(v4, @"recommendedIssuePublisherOutputName", 0);
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v11 = FCAppConfigurationStringValue(v4, @"recommendedIssuePublisherScoreOutputName", 0);
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
        v18.receiver = self;
        v18.super_class = (Class)FCNewsTabiRecommendedIssuesInputOutputConfiguration;
        v14 = [(FCNewsTabiRecommendedIssuesInputOutputConfiguration *)&v18 init];
        p_isa = (id *)&v14->super.isa;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_contextFeatureKey, v6);
          objc_storeStrong(p_isa + 2, v9);
          objc_storeStrong(p_isa + 3, v12);
        }
        self = p_isa;
        v16 = self;
      }
      else
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_9;
        v19[3] = &unk_1E5B4C840;
        id v20 = v4;
        __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_9((uint64_t)v19);
        v16 = (FCNewsTabiRecommendedIssuesInputOutputConfiguration *)objc_claimAutoreleasedReturnValue();
        id v13 = v20;
      }
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_8;
      v21[3] = &unk_1E5B4C840;
      id v22 = v4;
      __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_8((uint64_t)v21);
      v16 = (FCNewsTabiRecommendedIssuesInputOutputConfiguration *)objc_claimAutoreleasedReturnValue();
      id v10 = v22;
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke;
    v23[3] = &unk_1E5B4C840;
    id v24 = v4;
    __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke((uint64_t)v23);
    v16 = (FCNewsTabiRecommendedIssuesInputOutputConfiguration *)objc_claimAutoreleasedReturnValue();
    id v7 = v24;
  }

  return v16;
}

- (FCNewsTabiRecommendedIssuesInputOutputConfiguration)init
{
  return [(FCNewsTabiRecommendedIssuesInputOutputConfiguration *)self initWithDictionary:0];
}

uint64_t __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedIssuesInputOutputConfiguration due to failure to decode contextFeatureKey from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_8(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedIssuesInputOutputConfiguration due to failure to decode recommendedIssuePublisherOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __74__FCNewsTabiRecommendedIssuesInputOutputConfiguration_initWithDictionary___block_invoke_9(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiRecommendedIssuesInputOutputConfiguration due to failure to decode recommendedIssuePublisherScoreOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)setContextFeatureKey:(id)a3
{
}

- (void)setRecommendedIssuePublisherOutputName:(id)a3
{
}

- (void)setRecommendedIssuePublisherScoreOutputName:(id)a3
{
}

@end