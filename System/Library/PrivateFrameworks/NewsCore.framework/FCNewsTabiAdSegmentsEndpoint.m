@interface FCNewsTabiAdSegmentsEndpoint
- (FCNewsTabiAdSegmentsEndpoint)init;
- (FCNewsTabiAdSegmentsEndpoint)initWithDictionary:(id)a3;
- (FCNewsTabiEventAggregationOutputsConfiguration)eventAggregationOutputs;
- (NSString)adSegmentsOutputName;
- (NSString)packageAssetID;
- (id)description;
@end

@implementation FCNewsTabiAdSegmentsEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAggregationOutputs, 0);
  objc_storeStrong((id *)&self->_adSegmentsOutputName, 0);
  objc_storeStrong((id *)&self->_packageAssetID, 0);
}

- (FCNewsTabiAdSegmentsEndpoint)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationStringValue(v4, @"packageAssetID", 0);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = FCAppConfigurationStringValue(v4, @"adSegmentsOutputName", 0);
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v20.receiver = self;
      v20.super_class = (Class)FCNewsTabiAdSegmentsEndpoint;
      v11 = [(FCNewsTabiAdSegmentsEndpoint *)&v20 init];
      if (v11)
      {
        v19.receiver = v11;
        v19.super_class = (Class)FCNewsTabiAdSegmentsEndpoint;
        v12 = [(FCNewsTabiAdSegmentsEndpoint *)&v19 init];
        v13 = v12;
        if (v12)
        {
          objc_storeStrong((id *)&v12->_packageAssetID, v6);
          objc_storeStrong((id *)&v13->_adSegmentsOutputName, v9);
          v14 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"eventAggregationOutputs", 0);
          if (v14)
          {
            v15 = [[FCNewsTabiEventAggregationOutputsConfiguration alloc] initWithDictionary:v14];
            eventAggregationOutputs = v13->_eventAggregationOutputs;
            v13->_eventAggregationOutputs = v15;
          }
        }
      }
      else
      {
        v13 = 0;
      }
      self = v13;
      v17 = self;
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke_16;
      v21[3] = &unk_1E5B4C840;
      id v22 = v4;
      __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke_16((uint64_t)v21);
      v17 = (FCNewsTabiAdSegmentsEndpoint *)objc_claimAutoreleasedReturnValue();
      id v10 = v22;
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke;
    v23[3] = &unk_1E5B4C840;
    id v24 = v4;
    __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke((uint64_t)v23);
    v17 = (FCNewsTabiAdSegmentsEndpoint *)objc_claimAutoreleasedReturnValue();
    id v7 = v24;
  }

  return v17;
}

uint64_t __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke(uint64_t a1)
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
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiAdSegmentsEndpoint due to failure to decode packageAssetID from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (FCNewsTabiAdSegmentsEndpoint)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNewsTabiAdSegmentsEndpoint init]";
    __int16 v9 = 2080;
    id v10 = "FCNewsTabiAdSegmentsConfiguration.m";
    __int16 v11 = 1024;
    int v12 = 23;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNewsTabiAdSegmentsEndpoint init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

uint64_t __51__FCNewsTabiAdSegmentsEndpoint_initWithDictionary___block_invoke_16(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v5 = v2;
    id v6 = [v4 description];
    int v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiAdSegmentsEndpoint due to failure to decode adSegmentsOutputName from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  uint64_t v4 = [(FCNewsTabiAdSegmentsEndpoint *)self packageAssetID];
  [v3 appendFormat:@"\n\tpackageAssetID: %@;", v4];

  v5 = [(FCNewsTabiAdSegmentsEndpoint *)self adSegmentsOutputName];
  [v3 appendFormat:@"\n\tadSegmentsOutputName: %@;", v5];

  id v6 = [(FCNewsTabiAdSegmentsEndpoint *)self eventAggregationOutputs];
  int v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\teventAggregationOutputs: %@;", v7];

  [v3 appendString:@"\n>"];
  return v3;
}

- (NSString)packageAssetID
{
  return self->_packageAssetID;
}

- (NSString)adSegmentsOutputName
{
  return self->_adSegmentsOutputName;
}

- (FCNewsTabiEventAggregationOutputsConfiguration)eventAggregationOutputs
{
  return self->_eventAggregationOutputs;
}

@end