@interface FCPersonalizationTopicConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)capAtBaseline;
- (BOOL)shouldLimitInGroup;
- (BOOL)useHalfLifeCoefficientOverride;
- (FCPersonalizationTopicConfig)init;
- (FCPersonalizationTopicConfig)initWithCoder:(id)a3;
- (FCPersonalizationTopicConfig)initWithConfigDictionary:(id)a3;
- (FCPersonalizationTopicConfig)initWithConfigDictionary:(id)a3 defaultConfig:(id)a4;
- (FCPersonalizationTopicConfig)initWithTopicID:(id)a3 scoreMultiplier:(double)a4 tagWeight:(double)a5 capAtBaseline:(BOOL)a6 limitInGroup:(int64_t)a7 shouldLimitInGroup:(BOOL)a8 publisherTopicWeight:(double)a9 useHalfLifeCoefficientOverride:(BOOL)a10 halfLifeCoefficientOverride:(double)a11;
- (NSString)topicID;
- (double)halfLifeCoefficientOverride;
- (double)publisherTopicWeight;
- (double)scoreMultiplier;
- (double)tagWeight;
- (int64_t)limitInGroup;
- (void)encodeWithCoder:(id)a3;
- (void)setCapAtBaseline:(BOOL)a3;
- (void)setHalfLifeCoefficientOverride:(double)a3;
- (void)setLimitInGroup:(int64_t)a3;
- (void)setPublisherTopicWeight:(double)a3;
- (void)setScoreMultiplier:(double)a3;
- (void)setShouldLimitInGroup:(BOOL)a3;
- (void)setTagWeight:(double)a3;
- (void)setTopicID:(id)a3;
- (void)setUseHalfLifeCoefficientOverride:(BOOL)a3;
@end

@implementation FCPersonalizationTopicConfig

- (NSString)topicID
{
  return self->_topicID;
}

- (FCPersonalizationTopicConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCPersonalizationTopicConfig;
  v5 = [(FCPersonalizationTopicConfig *)&v20 init];
  if (v5)
  {
    v6 = FCAppConfigurationStringValue(v4, @"topicId", 0);
    double v7 = FCAppConfigurationDoubleValue(v4, @"scoreMultiplier", 1.0);
    if (v7 < 0.0) {
      double v8 = 1.0;
    }
    else {
      double v8 = v7;
    }
    double v9 = FCAppConfigurationDoubleValue(v4, @"tagWeight", 1.0);
    if (v9 < 0.0) {
      double v10 = 1.0;
    }
    else {
      double v10 = v9;
    }
    uint64_t v11 = FCAppConfigurationBoolValue(v4, @"capAtBaseline", 0);
    uint64_t v12 = FCAppConfigurationIntegerValue(v4, @"limitInGroup", 100);
    uint64_t v13 = FCAppConfigurationBoolValue(v4, @"shouldLimitInGroup", 0);
    double v14 = FCAppConfigurationDoubleValue(v4, @"publisherTopicWeight", 1.0);
    if (v14 < 0.0) {
      double v15 = 1.0;
    }
    else {
      double v15 = v14;
    }
    uint64_t v16 = FCAppConfigurationBoolValue(v4, @"useHalfLifeCoefficientOverride", 0);
    double v17 = FCAppConfigurationDoubleValue(v4, @"halfLifeCoefficientOverride", 1.0);
    if (v17 <= 0.0) {
      double v18 = 1.0;
    }
    else {
      double v18 = v17;
    }
    v5 = [(FCPersonalizationTopicConfig *)v5 initWithTopicID:v6 scoreMultiplier:v11 tagWeight:v12 capAtBaseline:v13 limitInGroup:v16 shouldLimitInGroup:v8 publisherTopicWeight:v10 useHalfLifeCoefficientOverride:v15 halfLifeCoefficientOverride:v18];
  }
  return v5;
}

- (FCPersonalizationTopicConfig)initWithConfigDictionary:(id)a3 defaultConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)FCPersonalizationTopicConfig;
  double v8 = [(FCPersonalizationTopicConfig *)&v29 init];
  if (v8)
  {
    double v9 = [v7 topicID];
    double v10 = FCAppConfigurationStringValue(v6, @"topicId", v9);
    [v7 scoreMultiplier];
    double v12 = FCAppConfigurationDoubleValue(v6, @"scoreMultiplier", v11);
    [v7 scoreMultiplier];
    if (v12 < 0.0) {
      double v12 = v13;
    }
    [v7 tagWeight];
    double v15 = FCAppConfigurationDoubleValue(v6, @"tagWeight", v14);
    [v7 tagWeight];
    if (v15 < 0.0) {
      double v15 = v16;
    }
    uint64_t v17 = FCAppConfigurationBoolValue(v6, @"capAtBaseline", [v7 capAtBaseline]);
    uint64_t v18 = FCAppConfigurationIntegerValue(v6, @"limitInGroup", [v7 limitInGroup]);
    uint64_t v19 = FCAppConfigurationBoolValue(v6, @"shouldLimitInGroup", [v7 shouldLimitInGroup]);
    [v7 publisherTopicWeight];
    double v21 = FCAppConfigurationDoubleValue(v6, @"publisherTopicWeight", v20);
    [v7 publisherTopicWeight];
    if (v21 < 0.0) {
      double v21 = v22;
    }
    uint64_t v23 = FCAppConfigurationBoolValue(v6, @"useHalfLifeCoefficientOverride", [v7 useHalfLifeCoefficientOverride]);
    [v7 halfLifeCoefficientOverride];
    double v25 = FCAppConfigurationDoubleValue(v6, @"halfLifeCoefficientOverride", v24);
    [v7 halfLifeCoefficientOverride];
    if (v25 <= 0.0) {
      double v27 = v26;
    }
    else {
      double v27 = v25;
    }
    double v8 = [(FCPersonalizationTopicConfig *)v8 initWithTopicID:v10 scoreMultiplier:v17 tagWeight:v18 capAtBaseline:v19 limitInGroup:v23 shouldLimitInGroup:v12 publisherTopicWeight:v15 useHalfLifeCoefficientOverride:v21 halfLifeCoefficientOverride:v27];
  }
  return v8;
}

- (double)tagWeight
{
  return self->_tagWeight;
}

- (double)scoreMultiplier
{
  return self->_scoreMultiplier;
}

- (double)publisherTopicWeight
{
  return self->_publisherTopicWeight;
}

- (double)halfLifeCoefficientOverride
{
  return self->_halfLifeCoefficientOverride;
}

- (FCPersonalizationTopicConfig)initWithTopicID:(id)a3 scoreMultiplier:(double)a4 tagWeight:(double)a5 capAtBaseline:(BOOL)a6 limitInGroup:(int64_t)a7 shouldLimitInGroup:(BOOL)a8 publisherTopicWeight:(double)a9 useHalfLifeCoefficientOverride:(BOOL)a10 halfLifeCoefficientOverride:(double)a11
{
  id v21 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FCPersonalizationTopicConfig;
  double v22 = [(FCPersonalizationTopicConfig *)&v25 init];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_topicID, a3);
    v23->_scoreMultiplier = a4;
    v23->_tagWeight = a5;
    v23->_capAtBaseline = a6;
    v23->_limitInGroup = a7;
    v23->_shouldLimitInGroup = a8;
    v23->_useHalfLifeCoefficientOverride = a10;
    v23->_publisherTopicWeight = a9;
    v23->_halfLifeCoefficientOverride = a11;
  }

  return v23;
}

- (BOOL)useHalfLifeCoefficientOverride
{
  return self->_useHalfLifeCoefficientOverride;
}

- (BOOL)shouldLimitInGroup
{
  return self->_shouldLimitInGroup;
}

- (int64_t)limitInGroup
{
  return self->_limitInGroup;
}

- (BOOL)capAtBaseline
{
  return self->_capAtBaseline;
}

- (FCPersonalizationTopicConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    double v8 = "-[FCPersonalizationTopicConfig init]";
    __int16 v9 = 2080;
    double v10 = "FCPersonalizationTopicConfig.m";
    __int16 v11 = 1024;
    int v12 = 16;
    __int16 v13 = 2114;
    double v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPersonalizationTopicConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationTopicConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"topicId"];
  [v4 decodeDoubleForKey:@"scoreMultiplier"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"tagWeight"];
  double v9 = v8;
  uint64_t v10 = [v4 decodeBoolForKey:@"capAtBaseline"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"limitInGroup"];
  uint64_t v12 = [v4 decodeBoolForKey:@"shouldLimitInGroup"];
  [v4 decodeDoubleForKey:@"publisherTopicWeight"];
  double v14 = v13;
  uint64_t v15 = [v4 decodeBoolForKey:@"useHalfLifeCoefficientOverride"];
  [v4 decodeDoubleForKey:@"halfLifeCoefficientOverride"];
  double v17 = v16;

  uint64_t v18 = [(FCPersonalizationTopicConfig *)self initWithTopicID:v5 scoreMultiplier:v10 tagWeight:v11 capAtBaseline:v12 limitInGroup:v15 shouldLimitInGroup:v7 publisherTopicWeight:v9 useHalfLifeCoefficientOverride:v14 halfLifeCoefficientOverride:v17];
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(FCPersonalizationTopicConfig *)self topicID];
  [v5 encodeObject:v4 forKey:@"topicId"];

  [(FCPersonalizationTopicConfig *)self scoreMultiplier];
  objc_msgSend(v5, "encodeDouble:forKey:", @"scoreMultiplier");
  [(FCPersonalizationTopicConfig *)self tagWeight];
  objc_msgSend(v5, "encodeDouble:forKey:", @"tagWeight");
  objc_msgSend(v5, "encodeBool:forKey:", -[FCPersonalizationTopicConfig capAtBaseline](self, "capAtBaseline"), @"capAtBaseline");
  objc_msgSend(v5, "encodeInteger:forKey:", -[FCPersonalizationTopicConfig limitInGroup](self, "limitInGroup"), @"limitInGroup");
  objc_msgSend(v5, "encodeBool:forKey:", -[FCPersonalizationTopicConfig shouldLimitInGroup](self, "shouldLimitInGroup"), @"shouldLimitInGroup");
  [(FCPersonalizationTopicConfig *)self publisherTopicWeight];
  objc_msgSend(v5, "encodeDouble:forKey:", @"publisherTopicWeight");
  objc_msgSend(v5, "encodeBool:forKey:", -[FCPersonalizationTopicConfig useHalfLifeCoefficientOverride](self, "useHalfLifeCoefficientOverride"), @"useHalfLifeCoefficientOverride");
  [(FCPersonalizationTopicConfig *)self halfLifeCoefficientOverride];
  objc_msgSend(v5, "encodeDouble:forKey:", @"halfLifeCoefficientOverride");
}

- (void)setTopicID:(id)a3
{
}

- (void)setScoreMultiplier:(double)a3
{
  self->_scoreMultiplier = a3;
}

- (void)setTagWeight:(double)a3
{
  self->_tagWeight = a3;
}

- (void)setCapAtBaseline:(BOOL)a3
{
  self->_capAtBaseline = a3;
}

- (void)setLimitInGroup:(int64_t)a3
{
  self->_limitInGroup = a3;
}

- (void)setShouldLimitInGroup:(BOOL)a3
{
  self->_shouldLimitInGroup = a3;
}

- (void)setPublisherTopicWeight:(double)a3
{
  self->_publisherTopicWeight = a3;
}

- (void)setUseHalfLifeCoefficientOverride:(BOOL)a3
{
  self->_useHalfLifeCoefficientOverride = a3;
}

- (void)setHalfLifeCoefficientOverride:(double)a3
{
  self->_halfLifeCoefficientOverride = a3;
}

- (void).cxx_destruct
{
}

@end