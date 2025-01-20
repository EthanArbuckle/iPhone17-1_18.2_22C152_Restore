@interface FCPersonalizationCohortConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)considerPublisherTopicAggregates;
- (BOOL)enableUndampening;
- (BOOL)undampenOnlyAboveBaselineMembership;
- (BOOL)useExponentialFavoritedBoost;
- (BOOL)useRelativePersonalizationValue;
- (FCPersonalizationCohortConfig)init;
- (FCPersonalizationCohortConfig)initWithCoder:(id)a3;
- (FCPersonalizationCohortConfig)initWithConfigDictionary:(id)a3;
- (FCPersonalizationCohortConfig)initWithConsiderPublisherTopicAggregates:(BOOL)a3 dilutionFactor:(double)a4 enableUndampening:(BOOL)a5 favoritedBoost:(double)a6 exponentialFavoritedBoost:(double)a7 globalWeight:(double)a8 globalWeightHalfLife:(double)a9 globalWeightInitialMultiplier:(double)a10 paddingFactor:(double)a11 preBaselineCurvature:(double)a12 postBaselineCurvature:(double)a13 undampenOnlyAboveBaselineMembership:(BOOL)a14 userBaseline:(double)a15 useRelativePersonalizationValue:(BOOL)a16 useExponentialFavoritedBoost:(BOOL)a17;
- (double)dilutionFactor;
- (double)exponentialFavoritedBoost;
- (double)favoritedBoost;
- (double)globalWeight;
- (double)globalWeightHalfLife;
- (double)globalWeightInitialMultiplier;
- (double)paddingFactor;
- (double)postBaselineCurvature;
- (double)preBaselineCurvature;
- (double)userBaseline;
- (void)encodeWithCoder:(id)a3;
- (void)setConsiderPublisherTopicAggregates:(BOOL)a3;
- (void)setDilutionFactor:(double)a3;
- (void)setEnableUndampening:(BOOL)a3;
- (void)setExponentialFavoritedBoost:(double)a3;
- (void)setFavoritedBoost:(double)a3;
- (void)setGlobalWeight:(double)a3;
- (void)setGlobalWeightHalfLife:(double)a3;
- (void)setGlobalWeightInitialMultiplier:(double)a3;
- (void)setPaddingFactor:(double)a3;
- (void)setPostBaselineCurvature:(double)a3;
- (void)setPreBaselineCurvature:(double)a3;
- (void)setUndampenOnlyAboveBaselineMembership:(BOOL)a3;
- (void)setUseExponentialFavoritedBoost:(BOOL)a3;
- (void)setUseRelativePersonalizationValue:(BOOL)a3;
- (void)setUserBaseline:(double)a3;
@end

@implementation FCPersonalizationCohortConfig

- (FCPersonalizationCohortConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)FCPersonalizationCohortConfig;
  v5 = [(FCPersonalizationCohortConfig *)&v35 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationBoolValue(v4, @"considerPublisherTopicAggregates", 0);
    double v7 = FCAppConfigurationDoubleValue(v4, @"dilutionFactor", 1.0);
    if (v7 > 1.0 || v7 < 0.0) {
      double v7 = 1.0;
    }
    double v34 = v7;
    uint64_t v9 = FCAppConfigurationBoolValue(v4, @"enableUndampening", 0);
    double v10 = FCAppConfigurationDoubleValue(v4, @"favoritedBoost", 0.3);
    if (v10 > 1.0 || v10 < 0.0) {
      double v10 = 0.3;
    }
    double v33 = v10;
    double v12 = FCAppConfigurationDoubleValue(v4, @"exponentialFavoritedBoost", 1.0);
    if (v12 < 0.0) {
      double v12 = 1.0;
    }
    double v32 = v12;
    double v13 = FCAppConfigurationDoubleValue(v4, @"globalWeight", 0.2);
    if (v13 > 1.0 || v13 < 0.0) {
      double v13 = 0.2;
    }
    double v31 = v13;
    double v15 = FCAppConfigurationDoubleValue(v4, @"globalWeightHalfLife", 5.0);
    if (v15 < 0.0) {
      double v16 = 5.0;
    }
    else {
      double v16 = v15;
    }
    double v17 = FCAppConfigurationDoubleValue(v4, @"globalWeightInitialMultiplier", 0.0);
    if (v17 < 0.0) {
      double v18 = 0.0;
    }
    else {
      double v18 = v17;
    }
    double v19 = FCAppConfigurationDoubleValue(v4, @"paddingFactor", 0.0);
    if (v19 < 0.0) {
      double v20 = 0.0;
    }
    else {
      double v20 = v19;
    }
    double v21 = FCAppConfigurationDoubleValue(v4, @"preBaselineCurvature", 2.0);
    if (v21 <= 0.0) {
      double v22 = 2.0;
    }
    else {
      double v22 = v21;
    }
    double v23 = FCAppConfigurationDoubleValue(v4, @"postBaselineCurvature", 2.0);
    if (v23 <= 0.0) {
      double v24 = 2.0;
    }
    else {
      double v24 = v23;
    }
    uint64_t v25 = FCAppConfigurationBoolValue(v4, @"undampenOnlyAboveBaselineMembership", 1);
    double v26 = 0.05;
    double v27 = FCAppConfigurationDoubleValue(v4, @"userBaseline", 0.05);
    if (v27 <= 1.0 && v27 >= 0.0) {
      double v26 = v27;
    }
    uint64_t v29 = FCAppConfigurationBoolValue(v4, @"useRelativePersonalizationValue", 0);
    v5 = -[FCPersonalizationCohortConfig initWithConsiderPublisherTopicAggregates:dilutionFactor:enableUndampening:favoritedBoost:exponentialFavoritedBoost:globalWeight:globalWeightHalfLife:globalWeightInitialMultiplier:paddingFactor:preBaselineCurvature:postBaselineCurvature:undampenOnlyAboveBaselineMembership:userBaseline:useRelativePersonalizationValue:useExponentialFavoritedBoost:](v5, "initWithConsiderPublisherTopicAggregates:dilutionFactor:enableUndampening:favoritedBoost:exponentialFavoritedBoost:globalWeight:globalWeightHalfLife:globalWeightInitialMultiplier:paddingFactor:preBaselineCurvature:postBaselineCurvature:undampenOnlyAboveBaselineMembership:userBaseline:useRelativePersonalizationValue:useExponentialFavoritedBoost:", v6, v9, v25, v29, FCAppConfigurationBoolValue(v4, @"useExponentialFavoritedBoost", 0), v34, v33, v32, v31, v16, v18, v20, v22, *(void *)&v24,
           *(void *)&v26);
  }

  return v5;
}

- (FCPersonalizationCohortConfig)initWithConsiderPublisherTopicAggregates:(BOOL)a3 dilutionFactor:(double)a4 enableUndampening:(BOOL)a5 favoritedBoost:(double)a6 exponentialFavoritedBoost:(double)a7 globalWeight:(double)a8 globalWeightHalfLife:(double)a9 globalWeightInitialMultiplier:(double)a10 paddingFactor:(double)a11 preBaselineCurvature:(double)a12 postBaselineCurvature:(double)a13 undampenOnlyAboveBaselineMembership:(BOOL)a14 userBaseline:(double)a15 useRelativePersonalizationValue:(BOOL)a16 useExponentialFavoritedBoost:(BOOL)a17
{
  v31.receiver = self;
  v31.super_class = (Class)FCPersonalizationCohortConfig;
  result = [(FCPersonalizationCohortConfig *)&v31 init];
  if (result)
  {
    result->_considerPublisherTopicAggregates = a3;
    result->_enableUndampening = a5;
    result->_dilutionFactor = a4;
    result->_favoritedBoost = a6;
    result->_exponentialFavoritedBoost = a7;
    result->_globalWeight = a8;
    result->_globalWeightHalfLife = a9;
    result->_globalWeightInitialMultiplier = a10;
    result->_paddingFactor = a11;
    result->_preBaselineCurvature = a12;
    result->_undampenOnlyAboveBaselineMembership = a14;
    result->_postBaselineCurvature = a13;
    result->_userBaseline = a15;
    result->_useRelativePersonalizationValue = a16;
    result->_useExponentialFavoritedBoost = a17;
  }
  return result;
}

- (FCPersonalizationCohortConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPersonalizationCohortConfig init]";
    __int16 v9 = 2080;
    double v10 = "FCPersonalizationCohortConfig.m";
    __int16 v11 = 1024;
    int v12 = 18;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPersonalizationCohortConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationCohortConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"considerPublisherTopicAggregates"];
  [v4 decodeDoubleForKey:@"dilutionFactor"];
  double v30 = v6;
  uint64_t v7 = [v4 decodeBoolForKey:@"enableUndampening"];
  [v4 decodeDoubleForKey:@"favoritedBoost"];
  double v29 = v8;
  [v4 decodeDoubleForKey:@"exponentialFavoritedBoost"];
  double v10 = v9;
  [v4 decodeDoubleForKey:@"globalWeight"];
  double v12 = v11;
  [v4 decodeDoubleForKey:@"globalWeightHalfLife"];
  double v14 = v13;
  [v4 decodeDoubleForKey:@"globalWeightInitialMultiplier"];
  double v16 = v15;
  [v4 decodeDoubleForKey:@"paddingFactor"];
  double v18 = v17;
  [v4 decodeDoubleForKey:@"preBaselineCurvature"];
  double v20 = v19;
  [v4 decodeDoubleForKey:@"postBaselineCurvature"];
  uint64_t v22 = v21;
  uint64_t v23 = [v4 decodeBoolForKey:@"undampenOnlyAboveBaselineMembership"];
  [v4 decodeDoubleForKey:@"userBaseline"];
  uint64_t v25 = v24;
  uint64_t v26 = [v4 decodeBoolForKey:@"useRelativePersonalizationValue"];
  uint64_t v27 = [v4 decodeBoolForKey:@"useExponentialFavoritedBoost"];

  return -[FCPersonalizationCohortConfig initWithConsiderPublisherTopicAggregates:dilutionFactor:enableUndampening:favoritedBoost:exponentialFavoritedBoost:globalWeight:globalWeightHalfLife:globalWeightInitialMultiplier:paddingFactor:preBaselineCurvature:postBaselineCurvature:undampenOnlyAboveBaselineMembership:userBaseline:useRelativePersonalizationValue:useExponentialFavoritedBoost:](self, "initWithConsiderPublisherTopicAggregates:dilutionFactor:enableUndampening:favoritedBoost:exponentialFavoritedBoost:globalWeight:globalWeightHalfLife:globalWeightInitialMultiplier:paddingFactor:preBaselineCurvature:postBaselineCurvature:undampenOnlyAboveBaselineMembership:userBaseline:useRelativePersonalizationValue:useExponentialFavoritedBoost:", v5, v7, v23, v26, v27, v30, v29, v10, v12, v14, v16, v18, v20, v22,
           v25);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[FCPersonalizationCohortConfig considerPublisherTopicAggregates](self, "considerPublisherTopicAggregates"), @"considerPublisherTopicAggregates");
  [(FCPersonalizationCohortConfig *)self dilutionFactor];
  objc_msgSend(v4, "encodeDouble:forKey:", @"dilutionFactor");
  objc_msgSend(v4, "encodeBool:forKey:", -[FCPersonalizationCohortConfig enableUndampening](self, "enableUndampening"), @"enableUndampening");
  [(FCPersonalizationCohortConfig *)self favoritedBoost];
  objc_msgSend(v4, "encodeDouble:forKey:", @"favoritedBoost");
  [(FCPersonalizationCohortConfig *)self exponentialFavoritedBoost];
  objc_msgSend(v4, "encodeDouble:forKey:", @"exponentialFavoritedBoost");
  [(FCPersonalizationCohortConfig *)self globalWeight];
  objc_msgSend(v4, "encodeDouble:forKey:", @"globalWeight");
  [(FCPersonalizationCohortConfig *)self globalWeightHalfLife];
  objc_msgSend(v4, "encodeDouble:forKey:", @"globalWeightHalfLife");
  [(FCPersonalizationCohortConfig *)self globalWeightInitialMultiplier];
  objc_msgSend(v4, "encodeDouble:forKey:", @"globalWeightInitialMultiplier");
  [(FCPersonalizationCohortConfig *)self paddingFactor];
  objc_msgSend(v4, "encodeDouble:forKey:", @"paddingFactor");
  [(FCPersonalizationCohortConfig *)self preBaselineCurvature];
  objc_msgSend(v4, "encodeDouble:forKey:", @"preBaselineCurvature");
  [(FCPersonalizationCohortConfig *)self postBaselineCurvature];
  objc_msgSend(v4, "encodeDouble:forKey:", @"postBaselineCurvature");
  objc_msgSend(v4, "encodeBool:forKey:", -[FCPersonalizationCohortConfig undampenOnlyAboveBaselineMembership](self, "undampenOnlyAboveBaselineMembership"), @"undampenOnlyAboveBaselineMembership");
  [(FCPersonalizationCohortConfig *)self userBaseline];
  objc_msgSend(v4, "encodeDouble:forKey:", @"userBaseline");
  objc_msgSend(v4, "encodeBool:forKey:", -[FCPersonalizationCohortConfig useRelativePersonalizationValue](self, "useRelativePersonalizationValue"), @"useRelativePersonalizationValue");
  objc_msgSend(v4, "encodeBool:forKey:", -[FCPersonalizationCohortConfig useExponentialFavoritedBoost](self, "useExponentialFavoritedBoost"), @"useExponentialFavoritedBoost");
}

- (BOOL)considerPublisherTopicAggregates
{
  return self->_considerPublisherTopicAggregates;
}

- (void)setConsiderPublisherTopicAggregates:(BOOL)a3
{
  self->_considerPublisherTopicAggregates = a3;
}

- (double)dilutionFactor
{
  return self->_dilutionFactor;
}

- (void)setDilutionFactor:(double)a3
{
  self->_dilutionFactor = a3;
}

- (BOOL)enableUndampening
{
  return self->_enableUndampening;
}

- (void)setEnableUndampening:(BOOL)a3
{
  self->_enableUndampening = a3;
}

- (double)favoritedBoost
{
  return self->_favoritedBoost;
}

- (void)setFavoritedBoost:(double)a3
{
  self->_favoritedBoost = a3;
}

- (double)exponentialFavoritedBoost
{
  return self->_exponentialFavoritedBoost;
}

- (void)setExponentialFavoritedBoost:(double)a3
{
  self->_exponentialFavoritedBoost = a3;
}

- (double)globalWeight
{
  return self->_globalWeight;
}

- (void)setGlobalWeight:(double)a3
{
  self->_globalWeight = a3;
}

- (double)globalWeightHalfLife
{
  return self->_globalWeightHalfLife;
}

- (void)setGlobalWeightHalfLife:(double)a3
{
  self->_globalWeightHalfLife = a3;
}

- (double)globalWeightInitialMultiplier
{
  return self->_globalWeightInitialMultiplier;
}

- (void)setGlobalWeightInitialMultiplier:(double)a3
{
  self->_globalWeightInitialMultiplier = a3;
}

- (double)paddingFactor
{
  return self->_paddingFactor;
}

- (void)setPaddingFactor:(double)a3
{
  self->_paddingFactor = a3;
}

- (double)preBaselineCurvature
{
  return self->_preBaselineCurvature;
}

- (void)setPreBaselineCurvature:(double)a3
{
  self->_preBaselineCurvature = a3;
}

- (double)postBaselineCurvature
{
  return self->_postBaselineCurvature;
}

- (void)setPostBaselineCurvature:(double)a3
{
  self->_postBaselineCurvature = a3;
}

- (BOOL)undampenOnlyAboveBaselineMembership
{
  return self->_undampenOnlyAboveBaselineMembership;
}

- (void)setUndampenOnlyAboveBaselineMembership:(BOOL)a3
{
  self->_undampenOnlyAboveBaselineMembership = a3;
}

- (double)userBaseline
{
  return self->_userBaseline;
}

- (void)setUserBaseline:(double)a3
{
  self->_userBaseline = a3;
}

- (BOOL)useRelativePersonalizationValue
{
  return self->_useRelativePersonalizationValue;
}

- (void)setUseRelativePersonalizationValue:(BOOL)a3
{
  self->_useRelativePersonalizationValue = a3;
}

- (BOOL)useExponentialFavoritedBoost
{
  return self->_useExponentialFavoritedBoost;
}

- (void)setUseExponentialFavoritedBoost:(BOOL)a3
{
  self->_useExponentialFavoritedBoost = a3;
}

@end