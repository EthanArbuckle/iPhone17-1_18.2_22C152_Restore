@interface FCPersonalizationOntologyLevelConfig
+ (BOOL)supportsSecureCoding;
- (FCPersonalizationOntologyLevelConfig)init;
- (FCPersonalizationOntologyLevelConfig)initWithCoder:(id)a3;
- (FCPersonalizationOntologyLevelConfig)initWithConfig:(id)a3;
- (FCPersonalizationOntologyLevelConfig)initWithConfig:(id)a3 defaultConfig:(id)a4;
- (FCPersonalizationOntologyLevelConfig)initWithTagWeightMapping:(id)a3;
- (NSDictionary)tagWeightMapping;
- (void)encodeWithCoder:(id)a3;
- (void)setTagWeightMapping:(id)a3;
@end

@implementation FCPersonalizationOntologyLevelConfig

- (void).cxx_destruct
{
}

- (FCPersonalizationOntologyLevelConfig)initWithConfig:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationOntologyLevelConfig;
  v5 = [(FCPersonalizationOntologyLevelConfig *)&v14 init];
  if (v5)
  {
    v6 = v5;
    v7 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"tagWeightMapping", 0);
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "fc_dictionaryByTransformingKeysWithBlock:", &__block_literal_global_103);
      v10 = [(FCPersonalizationOntologyLevelConfig *)v6 initWithTagWeightMapping:v9];
      v11 = v10;
    }
    else
    {
      v13 = v6;
      v10 = v13;
      v11 = [(FCPersonalizationOntologyLevelConfig *)v10 initWithTagWeightMapping:MEMORY[0x1E4F1CC08]];
      v9 = v13;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (FCPersonalizationOntologyLevelConfig)initWithConfig:(id)a3 defaultConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FCPersonalizationOntologyLevelConfig;
  v8 = [(FCPersonalizationOntologyLevelConfig *)&v18 init];
  if (v8)
  {
    v9 = v8;
    v10 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"tagWeightMapping", 0);

    if (v10)
    {
      v11 = FCAppConfigurationDictionaryValueWithDefaultValue(v6, @"tagWeightMapping", 0);
      v12 = v11;
      if (v11)
      {
        v13 = objc_msgSend(v11, "fc_dictionaryByTransformingKeysWithBlock:", &__block_literal_global_13_1);
        objc_super v14 = [(FCPersonalizationOntologyLevelConfig *)v9 initWithTagWeightMapping:v13];
        v15 = v14;
      }
      else
      {
        v17 = v9;
        objc_super v14 = v17;
        v15 = [(FCPersonalizationOntologyLevelConfig *)v14 initWithTagWeightMapping:MEMORY[0x1E4F1CC08]];
        v13 = v17;
      }
    }
    else
    {
      v12 = [v7 tagWeightMapping];
      objc_super v14 = [(FCPersonalizationOntologyLevelConfig *)v9 initWithTagWeightMapping:v12];
      v15 = v14;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (FCPersonalizationOntologyLevelConfig)initWithTagWeightMapping:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPersonalizationOntologyLevelConfig;
  id v6 = [(FCPersonalizationOntologyLevelConfig *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tagWeightMapping, a3);
  }

  return v7;
}

- (NSDictionary)tagWeightMapping
{
  return self->_tagWeightMapping;
}

id __69__FCPersonalizationOntologyLevelConfig_initWithConfig_defaultConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "integerValue"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (FCPersonalizationOntologyLevelConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPersonalizationOntologyLevelConfig init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationOntologyLevelConfig.m";
    __int16 v11 = 1024;
    int v12 = 17;
    __int16 v13 = 2114;
    objc_super v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPersonalizationOntologyLevelConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

id __55__FCPersonalizationOntologyLevelConfig_initWithConfig___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  id v2 = (void *)[v1 initWithTagWeightMapping:MEMORY[0x1E4F1CC08]];
  return v2;
}

id __55__FCPersonalizationOntologyLevelConfig_initWithConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "integerValue"));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __69__FCPersonalizationOntologyLevelConfig_initWithConfig_defaultConfig___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  id v2 = (void *)[v1 initWithTagWeightMapping:MEMORY[0x1E4F1CC08]];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationOntologyLevelConfig)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeObjectForKey:@"tagWeightMapping"];
  id v5 = [(FCPersonalizationOntologyLevelConfig *)self initWithTagWeightMapping:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPersonalizationOntologyLevelConfig *)self tagWeightMapping];
  [v4 encodeObject:v5 forKey:@"tagWeightMapping"];
}

- (void)setTagWeightMapping:(id)a3
{
}

@end