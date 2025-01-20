@interface NTSectionPresencePersonalizationAbsoluteRequest
- (FCPersonalizationFeature)feature;
- (NTAbsolutePersonalizedSectionPresenceConfig)absolutePresenceConfig;
- (NTSectionPresencePersonalizationAbsoluteRequest)init;
- (double)featureClickPrior;
- (double)featureImpressionPrior;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAbsolutePresenceConfig:(id)a3;
- (void)setFeature:(id)a3;
- (void)setFeatureClickPrior:(double)a3;
- (void)setFeatureImpressionPrior:(double)a3;
@end

@implementation NTSectionPresencePersonalizationAbsoluteRequest

- (NTSectionPresencePersonalizationAbsoluteRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTSectionPresencePersonalizationAbsoluteRequest;
  return [(NTSectionPresencePersonalizationAbsoluteRequest *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    objc_super v3 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v9 = "-[NTSectionPresencePersonalizationAbsoluteRequest copyWithZone:]";
    __int16 v10 = 2080;
    v11 = "NTSectionPresencePersonalizationOperation.m";
    __int16 v12 = 1024;
    int v13 = 23;
    __int16 v14 = 2114;
    v15 = v3;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTSectionPresencePersonalizationAbsoluteRequest copyWithZone:]"];
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (FCPersonalizationFeature)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
}

- (double)featureClickPrior
{
  return self->_featureClickPrior;
}

- (void)setFeatureClickPrior:(double)a3
{
  self->_featureClickPrior = a3;
}

- (double)featureImpressionPrior
{
  return self->_featureImpressionPrior;
}

- (void)setFeatureImpressionPrior:(double)a3
{
  self->_featureImpressionPrior = a3;
}

- (NTAbsolutePersonalizedSectionPresenceConfig)absolutePresenceConfig
{
  return self->_absolutePresenceConfig;
}

- (void)setAbsolutePresenceConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absolutePresenceConfig, 0);

  objc_storeStrong((id *)&self->_feature, 0);
}

@end