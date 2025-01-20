@interface FCPersonalizationTopicsConfig
+ (BOOL)supportsSecureCoding;
- (FCPersonalizationTopicsConfig)init;
- (FCPersonalizationTopicsConfig)initWithCoder:(id)a3;
- (FCPersonalizationTopicsConfig)initWithConfig:(id)a3;
- (FCPersonalizationTopicsConfig)initWithConfig:(id)a3 defaultConfig:(id)a4;
- (FCPersonalizationTopicsConfig)initWithTopicsConfig:(id)a3;
- (NSArray)topicsConfig;
- (void)encodeWithCoder:(id)a3;
- (void)setTopicsConfig:(id)a3;
@end

@implementation FCPersonalizationTopicsConfig

- (void).cxx_destruct
{
}

- (FCPersonalizationTopicsConfig)initWithConfig:(id)a3 defaultConfig:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)FCPersonalizationTopicsConfig;
  v8 = [(FCPersonalizationTopicsConfig *)&v27 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v10 = [v7 topicsConfig];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v16 = [v15 topicID];

          if (v16)
          {
            v17 = [v15 topicID];
            [v9 setObject:v15 forKeyedSubscript:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v12);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__FCPersonalizationTopicsConfig_initWithConfig_defaultConfig___block_invoke;
    v21[3] = &unk_1E5B56B28;
    id v22 = v9;
    id v18 = v9;
    [v6 enumerateObjectsUsingBlock:v21];
    v19 = [v18 allValues];
    v8 = [(FCPersonalizationTopicsConfig *)v8 initWithTopicsConfig:v19];
  }
  return v8;
}

- (FCPersonalizationTopicsConfig)initWithTopicsConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPersonalizationTopicsConfig;
  id v6 = [(FCPersonalizationTopicsConfig *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_topicsConfig, a3);
  }

  return v7;
}

- (NSArray)topicsConfig
{
  return self->_topicsConfig;
}

void __62__FCPersonalizationTopicsConfig_initWithConfig_defaultConfig___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = FCAppConfigurationStringValue(v9, @"topicId", 0);
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    id v5 = [FCPersonalizationTopicConfig alloc];
    id v6 = v5;
    if (v4)
    {
      id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
      v8 = [(FCPersonalizationTopicConfig *)v6 initWithConfigDictionary:v9 defaultConfig:v7];
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v3];
    }
    else
    {
      id v7 = [(FCPersonalizationTopicConfig *)v5 initWithConfigDictionary:v9];
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v3];
    }
  }
}

FCPersonalizationTopicConfig *__48__FCPersonalizationTopicsConfig_initWithConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FCPersonalizationTopicConfig alloc] initWithConfigDictionary:v2];

  return v3;
}

- (FCPersonalizationTopicsConfig)initWithConfig:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCPersonalizationTopicsConfig;
  id v5 = [(FCPersonalizationTopicsConfig *)&v8 init];
  if (v5)
  {
    id v6 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_163);
    id v5 = [(FCPersonalizationTopicsConfig *)v5 initWithTopicsConfig:v6];
  }
  return v5;
}

- (FCPersonalizationTopicsConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    objc_super v8 = "-[FCPersonalizationTopicsConfig init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationTopicsConfig.m";
    __int16 v11 = 1024;
    int v12 = 17;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPersonalizationTopicsConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationTopicsConfig)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeObjectForKey:@"topicsConfig"];
  id v5 = [(FCPersonalizationTopicsConfig *)self initWithTopicsConfig:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPersonalizationTopicsConfig *)self topicsConfig];
  [v4 encodeObject:v5 forKey:@"topicsConfig"];
}

- (void)setTopicsConfig:(id)a3
{
}

@end