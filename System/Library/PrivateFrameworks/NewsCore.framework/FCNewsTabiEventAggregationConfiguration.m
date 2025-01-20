@interface FCNewsTabiEventAggregationConfiguration
- (FCNewsTabiEventAggregationConditions)eventConditions;
- (FCNewsTabiEventAggregationConfiguration)init;
- (FCNewsTabiEventAggregationConfiguration)initWithDictionary:(id)a3;
- (FCNewsTabiEventAggregationConfiguration)initWithDictionary:(id)a3 outputs:(id)a4;
- (FCNewsTabiEventAggregationOutputsConfiguration)outputs;
- (NSDictionary)dictionary;
- (id)description;
- (int64_t)fullBodyEmbeddingDimension;
- (int64_t)maxSessionEvents;
- (int64_t)maxTopicIds;
- (int64_t)titleEmbeddingDimension;
- (void)setDictionary:(id)a3;
- (void)setEventConditions:(id)a3;
- (void)setFullBodyEmbeddingDimension:(int64_t)a3;
- (void)setMaxSessionEvents:(int64_t)a3;
- (void)setMaxTopicIds:(int64_t)a3;
- (void)setOutputs:(id)a3;
- (void)setTitleEmbeddingDimension:(int64_t)a3;
@end

@implementation FCNewsTabiEventAggregationConfiguration

void __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", v3);
  objc_msgSend(v4, "fc_safelyAddObject:", *(void *)(a1 + 40));
}

- (FCNewsTabiEventAggregationConfiguration)initWithDictionary:(id)a3 outputs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [FCNewsTabiEventAggregationConditions alloc];
  v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v7, @"eventConditions", 0);
  v11 = [(FCNewsTabiEventAggregationConditions *)v9 initWithDictionary:v10];

  if (v11)
  {
    v12 = v11;
    v13 = FCAppConfigurationNumberValue(v7, @"fullBodyEmbeddingDimension", 0);
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
      v16 = FCAppConfigurationNumberValue(v7, @"maxTopicIds", 0);
      v17 = v16;
      if (v16)
      {
        id v18 = v16;
        v19 = FCAppConfigurationNumberValue(v7, @"maxSessionEvents", 0);
        v33 = v19;
        if (v19)
        {
          v30 = v18;
          id v32 = v19;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_26;
          v39[3] = &unk_1E5B50AA8;
          id v20 = v7;
          id v40 = v20;
          id v41 = v8;
          v21 = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_26((uint64_t)v39);
          id obj = v21;
          if (v21)
          {
            id v28 = v21;
            v29 = FCAppConfigurationNumberValue(v20, @"titleEmbeddingDimension", 0);
            if (v29)
            {
              v34.receiver = self;
              v34.super_class = (Class)FCNewsTabiEventAggregationConfiguration;
              v22 = [(FCNewsTabiEventAggregationConfiguration *)&v34 init];
              v23 = v22;
              id v18 = v30;
              if (v22)
              {
                objc_storeStrong((id *)&v22->_dictionary, a3);
                objc_storeStrong((id *)&v23->_eventConditions, v11);
                v23->_fullBodyEmbeddingDimension = (int)[v15 intValue];
                v23->_maxTopicIds = (int)[v30 intValue];
                v23->_maxSessionEvents = (int)[v32 intValue];
                objc_storeStrong((id *)&v23->_outputs, obj);
                v23->_titleEmbeddingDimension = (int)[v29 intValue];
              }
              self = v23;
              v24 = self;
            }
            else
            {
              v35[0] = MEMORY[0x1E4F143A8];
              v35[1] = 3221225472;
              v35[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_31;
              v35[3] = &unk_1E5B4C840;
              id v36 = v20;
              __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_31((uint64_t)v35);
              v24 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();

              id v18 = v30;
            }

            v26 = v28;
          }
          else
          {
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_3;
            v37[3] = &unk_1E5B4C840;
            id v38 = v20;
            __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_3((uint64_t)v37);
            v24 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();
            v26 = v38;
            id v18 = v30;
          }

          v25 = v32;
        }
        else
        {
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_25;
          v42[3] = &unk_1E5B4C840;
          id v43 = v7;
          __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_25((uint64_t)v42);
          v24 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();
          v25 = v43;
        }
      }
      else
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_24;
        v44[3] = &unk_1E5B4C840;
        id v45 = v7;
        __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_24((uint64_t)v44);
        v24 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();
        id v18 = v45;
      }
    }
    else
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_23;
      v46[3] = &unk_1E5B4C840;
      id v47 = v7;
      __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_23((uint64_t)v46);
      v24 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();
      id v15 = v47;
    }
  }
  else
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke;
    v48[3] = &unk_1E5B4C840;
    v49 = (FCNewsTabiEventAggregationConditions *)v7;
    __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke((uint64_t)v48);
    v24 = (FCNewsTabiEventAggregationConfiguration *)objc_claimAutoreleasedReturnValue();
    v12 = v49;
  }

  return v24;
}

FCNewsTabiEventAggregationOutputsConfiguration *__70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_26(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"bundleOutputConfiguration"];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"nonBundleOutputConfiguration"];

    if (v3) {
      v2 = [[FCNewsTabiEventAggregationOutputsConfiguration alloc] initWithDictionary:*(void *)(a1 + 32)];
    }
    else {
      v2 = 0;
    }
  }
  id v4 = [FCNewsTabiEventAggregationOutputsConfiguration alloc];
  v5 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_2;
  v13 = &unk_1E5B501A0;
  id v14 = *(id *)(a1 + 40);
  id v15 = v2;
  v6 = v2;
  id v7 = objc_msgSend(v5, "fc_array:", &v10);
  id v8 = -[FCNewsTabiEventAggregationOutputsConfiguration initWithOutputs:](v4, "initWithOutputs:", v7, v10, v11, v12, v13);

  return v8;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsTabiEventAggregationConfiguration *)self eventConditions];
  v5 = [v4 indentedDescription];
  [v3 appendFormat:@"\n\teventConditions: %@;", v5];

  objc_msgSend(v3, "appendFormat:", @"\n\tfullBodyEmbeddingDimension: %lu;",
    [(FCNewsTabiEventAggregationConfiguration *)self fullBodyEmbeddingDimension]);
  objc_msgSend(v3, "appendFormat:", @"\n\tmaxTopicIds: %lu;",
    [(FCNewsTabiEventAggregationConfiguration *)self maxTopicIds]);
  objc_msgSend(v3, "appendFormat:", @"\n\tmaxSessionEvents: %lu;",
    [(FCNewsTabiEventAggregationConfiguration *)self maxSessionEvents]);
  v6 = [(FCNewsTabiEventAggregationConfiguration *)self outputs];
  id v7 = [v6 indentedDescription];
  [v3 appendFormat:@"\n\toutputs: %@;", v7];

  objc_msgSend(v3, "appendFormat:", @"\n\ttitleEmbeddingDimension: %lu;",
    [(FCNewsTabiEventAggregationConfiguration *)self titleEmbeddingDimension]);
  [v3 appendString:@"\n>"];
  return v3;
}

- (int64_t)titleEmbeddingDimension
{
  return self->_titleEmbeddingDimension;
}

- (FCNewsTabiEventAggregationOutputsConfiguration)outputs
{
  return self->_outputs;
}

- (int64_t)maxTopicIds
{
  return self->_maxTopicIds;
}

- (int64_t)maxSessionEvents
{
  return self->_maxSessionEvents;
}

- (int64_t)fullBodyEmbeddingDimension
{
  return self->_fullBodyEmbeddingDimension;
}

- (FCNewsTabiEventAggregationConditions)eventConditions
{
  return self->_eventConditions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventConditions, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (FCNewsTabiEventAggregationConfiguration)init
{
  return [(FCNewsTabiEventAggregationConfiguration *)self initWithDictionary:0 outputs:MEMORY[0x1E4F1CBF0]];
}

- (FCNewsTabiEventAggregationConfiguration)initWithDictionary:(id)a3
{
  return [(FCNewsTabiEventAggregationConfiguration *)self initWithDictionary:a3 outputs:MEMORY[0x1E4F1CBF0]];
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode eventConditions from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_23(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode fullBodyEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_24(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode maxTopicIDs from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_25(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode maxSessionEvents from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode bundleOutputConfiguration from configuration %{public}@", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

uint64_t __70__FCNewsTabiEventAggregationConfiguration_initWithDictionary_outputs___block_invoke_31(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCTabiConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCTabiConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 description];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to initialize FCNewsTabiEventAggregationConfiguration due to failure to decode titleEmbeddingDimension from configuration %{public}@", (uint8_t *)&v7, 0xCu);
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

- (void)setMaxSessionEvents:(int64_t)a3
{
  self->_maxSessionEvents = a3;
}

- (void)setTitleEmbeddingDimension:(int64_t)a3
{
  self->_titleEmbeddingDimension = a3;
}

- (void)setFullBodyEmbeddingDimension:(int64_t)a3
{
  self->_fullBodyEmbeddingDimension = a3;
}

- (void)setOutputs:(id)a3
{
}

- (void)setEventConditions:(id)a3
{
}

@end