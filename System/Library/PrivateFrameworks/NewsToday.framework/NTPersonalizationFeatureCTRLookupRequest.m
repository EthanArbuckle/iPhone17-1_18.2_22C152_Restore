@interface NTPersonalizationFeatureCTRLookupRequest
- (FCPersonalizationFeature)personalizationFeature;
- (NTPersonalizationFeatureCTRLookupRequest)init;
- (double)clickPrior;
- (double)impressionPrior;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setClickPrior:(double)a3;
- (void)setImpressionPrior:(double)a3;
- (void)setPersonalizationFeature:(id)a3;
@end

@implementation NTPersonalizationFeatureCTRLookupRequest

- (NTPersonalizationFeatureCTRLookupRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTPersonalizationFeatureCTRLookupRequest;
  return [(NTPersonalizationFeatureCTRLookupRequest *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    objc_super v3 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v9 = "-[NTPersonalizationFeatureCTRLookupRequest copyWithZone:]";
    __int16 v10 = 2080;
    v11 = "NTPersonalizationFeatureCTRLookupOperation.m";
    __int16 v12 = 1024;
    int v13 = 21;
    __int16 v14 = 2114;
    v15 = v3;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTPersonalizationFeatureCTRLookupRequest copyWithZone:]"];
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (FCPersonalizationFeature)personalizationFeature
{
  return self->_personalizationFeature;
}

- (void)setPersonalizationFeature:(id)a3
{
}

- (double)clickPrior
{
  return self->_clickPrior;
}

- (void)setClickPrior:(double)a3
{
  self->_clickPrior = a3;
}

- (double)impressionPrior
{
  return self->_impressionPrior;
}

- (void)setImpressionPrior:(double)a3
{
  self->_impressionPrior = a3;
}

- (void).cxx_destruct
{
}

@end