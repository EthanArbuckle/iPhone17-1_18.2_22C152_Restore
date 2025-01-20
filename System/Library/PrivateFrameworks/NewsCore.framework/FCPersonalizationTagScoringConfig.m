@interface FCPersonalizationTagScoringConfig
+ (BOOL)supportsSecureCoding;
- (FCPersonalizationTagScoringConfig)init;
- (FCPersonalizationTagScoringConfig)initWithChannelTopicMappingWeight:(double)a3 democratizationFactor:(double)a4 locationScoreDecayFactor:(double)a5 locationWeight:(double)a6 maxDistanceThreshold:(double)a7 maxLocationsToConsider:(int64_t)a8 popularityMultiplierBoost:(double)a9 popularityMultiplierExponent:(double)a10 topicTopicMappingWeight:(double)a11 userMembershipWeight:(double)a12;
- (FCPersonalizationTagScoringConfig)initWithCoder:(id)a3;
- (FCPersonalizationTagScoringConfig)initWithConfigDictionary:(id)a3;
- (FCPersonalizationTagScoringConfig)initWithConfigDictionary:(id)a3 defaultConfig:(id)a4;
- (double)channelTopicMappingWeight;
- (double)democratizationFactor;
- (double)locationScoreDecayFactor;
- (double)locationWeight;
- (double)maxDistanceThreshold;
- (double)popularityMultiplierBoost;
- (double)popularityMultiplierExponent;
- (double)topicTopicMappingWeight;
- (double)userMembershipWeight;
- (int64_t)maxLocationsToConsider;
- (void)encodeWithCoder:(id)a3;
- (void)setChannelTopicMappingWeight:(double)a3;
- (void)setDemocratizationFactor:(double)a3;
- (void)setLocationScoreDecayFactor:(double)a3;
- (void)setLocationWeight:(double)a3;
- (void)setMaxDistanceThreshold:(double)a3;
- (void)setMaxLocationsToConsider:(int64_t)a3;
- (void)setPopularityMultiplierBoost:(double)a3;
- (void)setPopularityMultiplierExponent:(double)a3;
- (void)setTopicTopicMappingWeight:(double)a3;
- (void)setUserMembershipWeight:(double)a3;
@end

@implementation FCPersonalizationTagScoringConfig

- (FCPersonalizationTagScoringConfig)initWithConfigDictionary:(id)a3 defaultConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)FCPersonalizationTagScoringConfig;
  v8 = [(FCPersonalizationTagScoringConfig *)&v41 init];
  if (v8)
  {
    [v7 channelTopicMappingWeight];
    double v10 = FCAppConfigurationDoubleValue(v6, @"channelTopicMappingWeight", v9);
    [v7 channelTopicMappingWeight];
    if (v10 >= 0.0) {
      double v11 = v10;
    }
    double v40 = v11;
    [v7 democratizationFactor];
    double v13 = FCAppConfigurationDoubleValue(v6, @"democratizationFactor", v12);
    [v7 democratizationFactor];
    if (v13 > 1.0 || v13 < 0.0) {
      double v13 = v14;
    }
    [v7 locationScoreDecayFactor];
    double v17 = FCAppConfigurationDoubleValue(v6, @"locationScoreDecayFactor", v16);
    [v7 locationScoreDecayFactor];
    if (v17 > 1.0 || v17 < 0.0) {
      double v17 = v18;
    }
    [v7 locationWeight];
    double v21 = FCAppConfigurationDoubleValue(v6, @"locationWeight", v20);
    [v7 locationWeight];
    if (v21 < 0.0) {
      double v21 = v22;
    }
    [v7 maxDistanceThreshold];
    double v24 = FCAppConfigurationDoubleValue(v6, @"maxDistanceThreshold", v23);
    [v7 maxDistanceThreshold];
    if (v24 < 0.0) {
      double v24 = v25;
    }
    uint64_t v26 = FCAppConfigurationIntegerValue(v6, @"maxLocationsToConsider", [v7 maxLocationsToConsider]);
    [v7 popularityMultiplierBoost];
    double v28 = FCAppConfigurationDoubleValue(v6, @"popularityMultiplierBoost", v27);
    [v7 popularityMultiplierBoost];
    if (v28 < 0.0) {
      double v28 = v29;
    }
    [v7 popularityMultiplierExponent];
    double v31 = FCAppConfigurationDoubleValue(v6, @"popularityMultiplierExponent", v30);
    [v7 popularityMultiplierExponent];
    if (v31 < 0.0) {
      double v31 = v32;
    }
    [v7 topicTopicMappingWeight];
    double v34 = FCAppConfigurationDoubleValue(v6, @"topicTopicMappingWeight", v33);
    [v7 topicTopicMappingWeight];
    if (v34 < 0.0) {
      double v34 = v35;
    }
    [v7 userMembershipWeight];
    double v37 = FCAppConfigurationDoubleValue(v6, @"userMembershipWeight", v36);
    [v7 userMembershipWeight];
    if (v37 >= 0.0) {
      double v38 = v37;
    }
    v8 = [(FCPersonalizationTagScoringConfig *)v8 initWithChannelTopicMappingWeight:v26 democratizationFactor:v40 locationScoreDecayFactor:v13 locationWeight:v17 maxDistanceThreshold:v21 maxLocationsToConsider:v24 popularityMultiplierBoost:v28 popularityMultiplierExponent:v31 topicTopicMappingWeight:v34 userMembershipWeight:*(void *)&v38];
  }

  return v8;
}

- (double)userMembershipWeight
{
  return self->_userMembershipWeight;
}

- (double)topicTopicMappingWeight
{
  return self->_topicTopicMappingWeight;
}

- (double)popularityMultiplierExponent
{
  return self->_popularityMultiplierExponent;
}

- (double)popularityMultiplierBoost
{
  return self->_popularityMultiplierBoost;
}

- (double)maxDistanceThreshold
{
  return self->_maxDistanceThreshold;
}

- (double)locationWeight
{
  return self->_locationWeight;
}

- (double)locationScoreDecayFactor
{
  return self->_locationScoreDecayFactor;
}

- (double)democratizationFactor
{
  return self->_democratizationFactor;
}

- (double)channelTopicMappingWeight
{
  return self->_channelTopicMappingWeight;
}

- (int64_t)maxLocationsToConsider
{
  return self->_maxLocationsToConsider;
}

- (FCPersonalizationTagScoringConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)FCPersonalizationTagScoringConfig;
  v5 = [(FCPersonalizationTagScoringConfig *)&v27 init];
  if (v5)
  {
    double v6 = FCAppConfigurationDoubleValue(v4, @"channelTopicMappingWeight", 1.0);
    if (v6 < 0.0) {
      double v6 = 1.0;
    }
    double v26 = v6;
    double v7 = FCAppConfigurationDoubleValue(v4, @"democratizationFactor", 1.0);
    double v8 = 0.0;
    if (v7 > 1.0 || v7 < 0.0) {
      double v10 = 1.0;
    }
    else {
      double v10 = v7;
    }
    double v11 = 0.1;
    double v12 = FCAppConfigurationDoubleValue(v4, @"locationScoreDecayFactor", 0.1);
    if (v12 <= 1.0 && v12 >= 0.0) {
      double v11 = v12;
    }
    double v14 = FCAppConfigurationDoubleValue(v4, @"locationWeight", 1.0);
    if (v14 < 0.0) {
      double v15 = 1.0;
    }
    else {
      double v15 = v14;
    }
    double v16 = 1000.0;
    double v17 = FCAppConfigurationDoubleValue(v4, @"maxDistanceThreshold", 1000.0);
    if (v17 >= 0.0) {
      double v16 = v17;
    }
    uint64_t v18 = FCAppConfigurationIntegerValue(v4, @"maxLocationsToConsider", 10);
    double v19 = FCAppConfigurationDoubleValue(v4, @"popularityMultiplierBoost", 0.0);
    if (v19 >= 0.0) {
      double v8 = v19;
    }
    double v20 = 0.5;
    double v21 = FCAppConfigurationDoubleValue(v4, @"popularityMultiplierExponent", 0.5);
    if (v21 >= 0.0) {
      double v20 = v21;
    }
    double v22 = FCAppConfigurationDoubleValue(v4, @"topicTopicMappingWeight", 1.0);
    if (v22 < 0.0) {
      double v23 = 1.0;
    }
    else {
      double v23 = v22;
    }
    double v24 = FCAppConfigurationDoubleValue(v4, @"userMembershipWeight", 1.0);
    if (v24 < 0.0) {
      double v24 = 1.0;
    }
    v5 = [(FCPersonalizationTagScoringConfig *)v5 initWithChannelTopicMappingWeight:v18 democratizationFactor:v26 locationScoreDecayFactor:v10 locationWeight:v11 maxDistanceThreshold:v15 maxLocationsToConsider:v16 popularityMultiplierBoost:v8 popularityMultiplierExponent:v20 topicTopicMappingWeight:v23 userMembershipWeight:*(void *)&v24];
  }

  return v5;
}

- (FCPersonalizationTagScoringConfig)initWithChannelTopicMappingWeight:(double)a3 democratizationFactor:(double)a4 locationScoreDecayFactor:(double)a5 locationWeight:(double)a6 maxDistanceThreshold:(double)a7 maxLocationsToConsider:(int64_t)a8 popularityMultiplierBoost:(double)a9 popularityMultiplierExponent:(double)a10 topicTopicMappingWeight:(double)a11 userMembershipWeight:(double)a12
{
  v22.receiver = self;
  v22.super_class = (Class)FCPersonalizationTagScoringConfig;
  result = [(FCPersonalizationTagScoringConfig *)&v22 init];
  if (result)
  {
    result->_channelTopicMappingWeight = a3;
    result->_democratizationFactor = a4;
    result->_locationScoreDecayFactor = a5;
    result->_locationWeight = a6;
    result->_maxDistanceThreshold = a7;
    result->_maxLocationsToConsider = a8;
    result->_popularityMultiplierBoost = a9;
    result->_popularityMultiplierExponent = a10;
    result->_topicTopicMappingWeight = a11;
    result->_userMembershipWeight = a12;
  }
  return result;
}

- (FCPersonalizationTagScoringConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    double v8 = "-[FCPersonalizationTagScoringConfig init]";
    __int16 v9 = 2080;
    double v10 = "FCPersonalizationTagScoringConfig.m";
    __int16 v11 = 1024;
    int v12 = 16;
    __int16 v13 = 2114;
    double v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPersonalizationTagScoringConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationTagScoringConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"channelTopicMappingWeight"];
  double v24 = v5;
  [v4 decodeDoubleForKey:@"democratizationFactor"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"locationScoreDecayFactor"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"locationWeight"];
  double v11 = v10;
  [v4 decodeDoubleForKey:@"maxDistanceThreshold"];
  double v13 = v12;
  uint64_t v14 = [v4 decodeInt64ForKey:@"maxLocationsToConsider"];
  [v4 decodeDoubleForKey:@"popularityMultiplierBoost"];
  double v16 = v15;
  [v4 decodeDoubleForKey:@"popularityMultiplierExponent"];
  double v18 = v17;
  [v4 decodeDoubleForKey:@"topicTopicMappingWeight"];
  double v20 = v19;
  [v4 decodeDoubleForKey:@"userMembershipWeight"];
  uint64_t v22 = v21;

  return [(FCPersonalizationTagScoringConfig *)self initWithChannelTopicMappingWeight:v14 democratizationFactor:v24 locationScoreDecayFactor:v7 locationWeight:v9 maxDistanceThreshold:v11 maxLocationsToConsider:v13 popularityMultiplierBoost:v16 popularityMultiplierExponent:v18 topicTopicMappingWeight:v20 userMembershipWeight:v22];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [(FCPersonalizationTagScoringConfig *)self channelTopicMappingWeight];
  objc_msgSend(v5, "encodeDouble:forKey:", @"channelTopicMappingWeight");
  [(FCPersonalizationTagScoringConfig *)self democratizationFactor];
  objc_msgSend(v5, "encodeDouble:forKey:", @"democratizationFactor");
  [(FCPersonalizationTagScoringConfig *)self locationScoreDecayFactor];
  objc_msgSend(v5, "encodeDouble:forKey:", @"locationScoreDecayFactor");
  [(FCPersonalizationTagScoringConfig *)self locationWeight];
  objc_msgSend(v5, "encodeDouble:forKey:", @"locationWeight");
  [(FCPersonalizationTagScoringConfig *)self maxDistanceThreshold];
  [v5 encodeInt64:(uint64_t)v4 forKey:@"maxDistanceThreshold"];
  objc_msgSend(v5, "encodeDouble:forKey:", @"maxLocationsToConsider", (double)-[FCPersonalizationTagScoringConfig maxLocationsToConsider](self, "maxLocationsToConsider"));
  [(FCPersonalizationTagScoringConfig *)self popularityMultiplierBoost];
  objc_msgSend(v5, "encodeDouble:forKey:", @"popularityMultiplierBoost");
  [(FCPersonalizationTagScoringConfig *)self popularityMultiplierExponent];
  objc_msgSend(v5, "encodeDouble:forKey:", @"popularityMultiplierExponent");
  [(FCPersonalizationTagScoringConfig *)self topicTopicMappingWeight];
  objc_msgSend(v5, "encodeDouble:forKey:", @"topicTopicMappingWeight");
  [(FCPersonalizationTagScoringConfig *)self userMembershipWeight];
  objc_msgSend(v5, "encodeDouble:forKey:", @"userMembershipWeight");
}

- (void)setChannelTopicMappingWeight:(double)a3
{
  self->_channelTopicMappingWeight = a3;
}

- (void)setDemocratizationFactor:(double)a3
{
  self->_democratizationFactor = a3;
}

- (void)setLocationScoreDecayFactor:(double)a3
{
  self->_locationScoreDecayFactor = a3;
}

- (void)setLocationWeight:(double)a3
{
  self->_locationWeight = a3;
}

- (void)setMaxDistanceThreshold:(double)a3
{
  self->_maxDistanceThreshold = a3;
}

- (void)setMaxLocationsToConsider:(int64_t)a3
{
  self->_maxLocationsToConsider = a3;
}

- (void)setPopularityMultiplierBoost:(double)a3
{
  self->_popularityMultiplierBoost = a3;
}

- (void)setPopularityMultiplierExponent:(double)a3
{
  self->_popularityMultiplierExponent = a3;
}

- (void)setTopicTopicMappingWeight:(double)a3
{
  self->_topicTopicMappingWeight = a3;
}

- (void)setUserMembershipWeight:(double)a3
{
  self->_userMembershipWeight = a3;
}

@end