@interface FCNewsTabiTagSuggestionsOutputConfiguration
- (FCNewsTabiTagSuggestionsOutputConfiguration)initWithDictionary:(id)a3;
- (NSString)channelIDsOutputName;
- (NSString)channelScoresOutputName;
- (NSString)topicIDsOutputName;
- (NSString)topicScoresOutputName;
- (id)description;
- (void)setChannelIDsOutputName:(id)a3;
- (void)setChannelScoresOutputName:(id)a3;
- (void)setTopicIDsOutputName:(id)a3;
- (void)setTopicScoresOutputName:(id)a3;
@end

@implementation FCNewsTabiTagSuggestionsOutputConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiTagSuggestionsOutputConfiguration *)self channelIDsOutputName];
  [v3 appendFormat:@"\n\tchannelIDsOutputName: %@;", v4];

  v5 = [(FCNewsTabiTagSuggestionsOutputConfiguration *)self topicIDsOutputName];
  [v3 appendFormat:@"\n\ttopicIDsOutputName: %@;", v5];

  v6 = [(FCNewsTabiTagSuggestionsOutputConfiguration *)self channelScoresOutputName];
  [v3 appendFormat:@"\n\tchannelScoresOutputName: %@;", v6];

  v7 = [(FCNewsTabiTagSuggestionsOutputConfiguration *)self topicScoresOutputName];
  [v3 appendFormat:@"\n\ttopicScoresOutputName: %@;", v7];

  [v3 appendString:@"\n>"];
  return v3;
}

- (NSString)topicScoresOutputName
{
  return self->_topicScoresOutputName;
}

- (NSString)topicIDsOutputName
{
  return self->_topicIDsOutputName;
}

- (NSString)channelScoresOutputName
{
  return self->_channelScoresOutputName;
}

- (NSString)channelIDsOutputName
{
  return self->_channelIDsOutputName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicScoresOutputName, 0);
  objc_storeStrong((id *)&self->_channelScoresOutputName, 0);
  objc_storeStrong((id *)&self->_topicIDsOutputName, 0);
  objc_storeStrong((id *)&self->_channelIDsOutputName, 0);
}

- (FCNewsTabiTagSuggestionsOutputConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationStringValue(v4, @"channelIDsOutputName", 0);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = FCAppConfigurationStringValue(v4, @"topicIDsOutputName", 0);
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v11 = FCAppConfigurationStringValue(v4, @"channelScoresOutputName", 0);
      v12 = v11;
      if (v11)
      {
        id v21 = v11;
        v13 = FCAppConfigurationStringValue(v4, @"topicScoresOutputName", 0);
        v14 = v13;
        if (v13)
        {
          id v15 = v13;
          v22.receiver = self;
          v22.super_class = (Class)FCNewsTabiTagSuggestionsOutputConfiguration;
          v16 = [(FCNewsTabiTagSuggestionsOutputConfiguration *)&v22 init];
          p_isa = (id *)&v16->super.isa;
          if (v16)
          {
            objc_storeStrong((id *)&v16->_channelIDsOutputName, v6);
            objc_storeStrong(p_isa + 2, v9);
            objc_storeStrong(p_isa + 3, v12);
            objc_storeStrong(p_isa + 4, v14);
          }
          self = p_isa;
          v18 = self;
        }
        else
        {
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_13;
          v23[3] = &unk_1E5B4C840;
          id v24 = v4;
          __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_13((uint64_t)v23);
          v18 = (FCNewsTabiTagSuggestionsOutputConfiguration *)objc_claimAutoreleasedReturnValue();
          id v15 = v24;
        }

        v19 = v21;
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_12;
        v25[3] = &unk_1E5B4C840;
        id v26 = v4;
        __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_12((uint64_t)v25);
        v18 = (FCNewsTabiTagSuggestionsOutputConfiguration *)objc_claimAutoreleasedReturnValue();
        v19 = v26;
      }
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_11;
      v27[3] = &unk_1E5B4C840;
      id v28 = v4;
      __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_11((uint64_t)v27);
      v18 = (FCNewsTabiTagSuggestionsOutputConfiguration *)objc_claimAutoreleasedReturnValue();
      id v10 = v28;
    }
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke;
    v29[3] = &unk_1E5B4C840;
    id v30 = v4;
    __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke((uint64_t)v29);
    v18 = (FCNewsTabiTagSuggestionsOutputConfiguration *)objc_claimAutoreleasedReturnValue();
    id v7 = v30;
  }

  return v18;
}

uint64_t __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsOutputConfiguration due to failure to decode channelIDsOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_11(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsOutputConfiguration due to failure to decode topicIDsOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_12(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsOutputConfiguration due to failure to decode channelScoresOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __66__FCNewsTabiTagSuggestionsOutputConfiguration_initWithDictionary___block_invoke_13(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagSuggestionsOutputConfiguration due to failure to decode topicScoresOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)setChannelIDsOutputName:(id)a3
{
}

- (void)setTopicIDsOutputName:(id)a3
{
}

- (void)setChannelScoresOutputName:(id)a3
{
}

- (void)setTopicScoresOutputName:(id)a3
{
}

@end