@interface FCStatelessPersonalizationPublisherFavorability
- (FCStatelessPersonalizationPublisherFavorability)initWithArray:(id)a3;
- (NSDictionary)favorabilityByPublisherID;
- (void)setFavorabilityByPublisherID:(id)a3;
@end

@implementation FCStatelessPersonalizationPublisherFavorability

void __65__FCStatelessPersonalizationPublisherFavorability_initWithArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        FCAppConfigurationStringValue(v9, @"publisherID", 0);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = FCAppConfigurationNumberValue(v9, @"favorability", 0);
          if (v11)
          {
            v12 = [v3 objectForKeyedSubscript:v10];

            if (v12)
            {
              v13 = (void *)FCStatelessPersonalizationLog;
              if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_ERROR))
              {
                v14 = v13;
                v15 = [v3 objectForKeyedSubscript:v10];
                *(_DWORD *)buf = 138543874;
                v23 = v10;
                __int16 v24 = 2114;
                v25 = v15;
                __int16 v26 = 2114;
                v27 = v11;
                _os_log_error_impl(&dword_1A460D000, v14, OS_LOG_TYPE_ERROR, "Stateless personalization publisher favorability has duplicate entry for publisherID %{public}@. Existing favorability %{public}@, duplicate favorability %{public}@", buf, 0x20u);
              }
            }
            else
            {
              [v3 setObject:v11 forKeyedSubscript:v10];
            }
          }
          else
          {
            v17 = FCStatelessPersonalizationLog;
            if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v23 = @"favorability";
              __int16 v24 = 2114;
              v25 = v9;
              _os_log_error_impl(&dword_1A460D000, v17, OS_LOG_TYPE_ERROR, "Stateless personalization publisher favorability entry missing %{public}@: %{public}@", buf, 0x16u);
            }
          }
        }
        else
        {
          v16 = FCStatelessPersonalizationLog;
          if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v23 = @"publisherID";
            __int16 v24 = 2114;
            v25 = v9;
            _os_log_error_impl(&dword_1A460D000, v16, OS_LOG_TYPE_ERROR, "Stateless personalization publisher favorability entry missing %{public}@: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
}

- (FCStatelessPersonalizationPublisherFavorability)initWithArray:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCStatelessPersonalizationPublisherFavorability;
  uint64_t v5 = [(FCStatelessPersonalizationPublisherFavorability *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__FCStatelessPersonalizationPublisherFavorability_initWithArray___block_invoke;
    v10[3] = &unk_1E5B4BF78;
    id v11 = v4;
    uint64_t v7 = objc_msgSend(v6, "fc_dictionary:", v10);
    favorabilityByPublisherID = v5->_favorabilityByPublisherID;
    v5->_favorabilityByPublisherID = (NSDictionary *)v7;
  }
  return v5;
}

- (NSDictionary)favorabilityByPublisherID
{
  return self->_favorabilityByPublisherID;
}

- (void)setFavorabilityByPublisherID:(id)a3
{
}

@end