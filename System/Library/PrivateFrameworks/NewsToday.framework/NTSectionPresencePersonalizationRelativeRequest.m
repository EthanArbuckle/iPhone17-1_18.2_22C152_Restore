@interface NTSectionPresencePersonalizationRelativeRequest
- (FCPersonalizationFeature)competingSectionFeature;
- (FCPersonalizationFeature)targetSectionFeature;
- (NTSectionPresencePersonalizationRelativeRequest)init;
- (double)competingSectionFeatureClickPrior;
- (double)competingSectionFeatureImpressionPrior;
- (double)scalar;
- (double)targetSectionFeatureClickPrior;
- (double)targetSectionFeatureImpressionPrior;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCompetingSectionFeature:(id)a3;
- (void)setCompetingSectionFeatureClickPrior:(double)a3;
- (void)setCompetingSectionFeatureImpressionPrior:(double)a3;
- (void)setScalar:(double)a3;
- (void)setTargetSectionFeature:(id)a3;
- (void)setTargetSectionFeatureClickPrior:(double)a3;
- (void)setTargetSectionFeatureImpressionPrior:(double)a3;
@end

@implementation NTSectionPresencePersonalizationRelativeRequest

- (NTSectionPresencePersonalizationRelativeRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTSectionPresencePersonalizationRelativeRequest;
  return [(NTSectionPresencePersonalizationRelativeRequest *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    objc_super v3 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v9 = "-[NTSectionPresencePersonalizationRelativeRequest copyWithZone:]";
    __int16 v10 = 2080;
    v11 = "NTSectionPresencePersonalizationOperation.m";
    __int16 v12 = 1024;
    int v13 = 39;
    __int16 v14 = 2114;
    v15 = v3;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTSectionPresencePersonalizationRelativeRequest copyWithZone:]"];
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (FCPersonalizationFeature)targetSectionFeature
{
  return self->_targetSectionFeature;
}

- (void)setTargetSectionFeature:(id)a3
{
}

- (double)targetSectionFeatureClickPrior
{
  return self->_targetSectionFeatureClickPrior;
}

- (void)setTargetSectionFeatureClickPrior:(double)a3
{
  self->_targetSectionFeatureClickPrior = a3;
}

- (double)targetSectionFeatureImpressionPrior
{
  return self->_targetSectionFeatureImpressionPrior;
}

- (void)setTargetSectionFeatureImpressionPrior:(double)a3
{
  self->_targetSectionFeatureImpressionPrior = a3;
}

- (FCPersonalizationFeature)competingSectionFeature
{
  return self->_competingSectionFeature;
}

- (void)setCompetingSectionFeature:(id)a3
{
}

- (double)competingSectionFeatureClickPrior
{
  return self->_competingSectionFeatureClickPrior;
}

- (void)setCompetingSectionFeatureClickPrior:(double)a3
{
  self->_competingSectionFeatureClickPrior = a3;
}

- (double)competingSectionFeatureImpressionPrior
{
  return self->_competingSectionFeatureImpressionPrior;
}

- (void)setCompetingSectionFeatureImpressionPrior:(double)a3
{
  self->_competingSectionFeatureImpressionPrior = a3;
}

- (double)scalar
{
  return self->_scalar;
}

- (void)setScalar:(double)a3
{
  self->_scalar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_competingSectionFeature, 0);

  objc_storeStrong((id *)&self->_targetSectionFeature, 0);
}

@end