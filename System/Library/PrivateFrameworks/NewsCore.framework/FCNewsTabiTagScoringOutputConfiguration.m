@interface FCNewsTabiTagScoringOutputConfiguration
- (FCNewsTabiTagScoringOutputConfiguration)initWithDictionary:(id)a3;
- (NSString)scoredTagsOutputName;
- (id)description;
- (void)setScoredTagsOutputName:(id)a3;
@end

@implementation FCNewsTabiTagScoringOutputConfiguration

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiTagScoringOutputConfiguration *)self scoredTagsOutputName];
  [v3 appendFormat:@"\n\tscoredTagsOutputName: %@;", v4];

  [v3 appendString:@"\n>"];
  return v3;
}

- (NSString)scoredTagsOutputName
{
  return self->_scoredTagsOutputName;
}

- (FCNewsTabiTagScoringOutputConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationStringValue(v4, @"scoredTagsOutputName", 0);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v12.receiver = self;
    v12.super_class = (Class)FCNewsTabiTagScoringOutputConfiguration;
    v8 = [(FCNewsTabiTagScoringOutputConfiguration *)&v12 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_scoredTagsOutputName, v6);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__FCNewsTabiTagScoringOutputConfiguration_initWithDictionary___block_invoke;
    v13[3] = &unk_1E5B4C840;
    id v14 = v4;
    __62__FCNewsTabiTagScoringOutputConfiguration_initWithDictionary___block_invoke((uint64_t)v13);
    v10 = (FCNewsTabiTagScoringOutputConfiguration *)objc_claimAutoreleasedReturnValue();
    id v7 = v14;
  }

  return v10;
}

uint64_t __62__FCNewsTabiTagScoringOutputConfiguration_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiTagScoringOutputConfiguration due to failure to decode scoredTagsOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)setScoredTagsOutputName:(id)a3
{
}

@end