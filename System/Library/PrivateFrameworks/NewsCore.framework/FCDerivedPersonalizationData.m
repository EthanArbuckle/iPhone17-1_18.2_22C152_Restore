@interface FCDerivedPersonalizationData
+ (BOOL)supportsSecureCoding;
- (FCDerivedPersonalizationData)init;
- (FCDerivedPersonalizationData)initWithAggregates:(id)a3 scoringType:(unint64_t)a4;
- (FCDerivedPersonalizationData)initWithAggregates:(id)a3 scoringType:(unint64_t)a4 decayRate:(double)a5;
- (FCDerivedPersonalizationData)initWithCoder:(id)a3;
- (double)decayRate;
- (id)aggregateForFeatureKey:(id)a3;
- (id)aggregatesForFeatureKeys:(id)a3;
- (id)allAggregates;
- (unint64_t)scoringType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCDerivedPersonalizationData

- (FCDerivedPersonalizationData)initWithAggregates:(id)a3 scoringType:(unint64_t)a4 decayRate:(double)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "aggregates");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCDerivedPersonalizationData initWithAggregates:scoringType:decayRate:]";
    __int16 v17 = 2080;
    v18 = "FCDerivedPersonalizationData.m";
    __int16 v19 = 1024;
    int v20 = 31;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v14.receiver = self;
  v14.super_class = (Class)FCDerivedPersonalizationData;
  v9 = [(FCDerivedPersonalizationData *)&v14 init];
  v10 = v9;
  if (v9)
  {
    if (v8) {
      v11 = v8;
    }
    else {
      v11 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v9->_aggregatesByFeatureKey, v11);
    v10->_scoringType = a4;
    v10->_decayRate = a5;
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (unint64_t)scoringType
{
  return self->_scoringType;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (FCDerivedPersonalizationData)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCDerivedPersonalizationData init]";
    __int16 v9 = 2080;
    v10 = "FCDerivedPersonalizationData.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    objc_super v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCDerivedPersonalizationData init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCDerivedPersonalizationData)initWithAggregates:(id)a3 scoringType:(unint64_t)a4
{
  return [(FCDerivedPersonalizationData *)self initWithAggregates:a3 scoringType:a4 decayRate:0.0];
}

- (id)allAggregates
{
  if (self) {
    self = (FCDerivedPersonalizationData *)self->_aggregatesByFeatureKey;
  }
  return self;
}

- (id)aggregatesForFeatureKeys:(id)a3
{
  if (self) {
    self = (FCDerivedPersonalizationData *)self->_aggregatesByFeatureKey;
  }
  return (id)[(FCDerivedPersonalizationData *)self fc_subdictionaryForKeys:a3];
}

- (id)aggregateForFeatureKey:(id)a3
{
  if (self) {
    self = (FCDerivedPersonalizationData *)self->_aggregatesByFeatureKey;
  }
  return (id)[(FCDerivedPersonalizationData *)self objectForKeyedSubscript:a3];
}

- (FCDerivedPersonalizationData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"version"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"scoringType"];
  [v4 decodeDoubleForKey:@"decayRate"];
  double v8 = v7;
  if (v5 == 5)
  {
    __int16 v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    int v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    __int16 v13 = [v4 decodeObjectOfClasses:v12 forKey:@"aggregatesByFeatureKey"];
  }
  else
  {
    __int16 v13 = objc_opt_new();
  }
  objc_super v14 = [(FCDerivedPersonalizationData *)self initWithAggregates:v13 scoringType:v6 decayRate:v8];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:5 forKey:@"version"];
  if (self) {
    aggregatesByFeatureKey = self->_aggregatesByFeatureKey;
  }
  else {
    aggregatesByFeatureKey = 0;
  }
  [v5 encodeObject:aggregatesByFeatureKey forKey:@"aggregatesByFeatureKey"];
  objc_msgSend(v5, "encodeInteger:forKey:", -[FCDerivedPersonalizationData scoringType](self, "scoringType"), @"scoringType");
  [(FCDerivedPersonalizationData *)self decayRate];
  objc_msgSend(v5, "encodeDouble:forKey:", @"decayRate");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end