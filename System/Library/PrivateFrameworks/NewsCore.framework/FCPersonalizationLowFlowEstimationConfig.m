@interface FCPersonalizationLowFlowEstimationConfig
+ (BOOL)supportsSecureCoding;
- (FCPersonalizationLowFlowEstimationConfig)init;
- (FCPersonalizationLowFlowEstimationConfig)initWithCoder:(id)a3;
- (FCPersonalizationLowFlowEstimationConfig)initWithConfigDictionary:(id)a3;
- (FCPersonalizationLowFlowEstimationConfig)initWithExponent:(double)a3 padding:(double)a4 prior:(double)a5;
- (double)exponent;
- (double)padding;
- (double)prior;
- (void)encodeWithCoder:(id)a3;
- (void)setExponent:(double)a3;
- (void)setPadding:(double)a3;
- (void)setPrior:(double)a3;
@end

@implementation FCPersonalizationLowFlowEstimationConfig

- (FCPersonalizationLowFlowEstimationConfig)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPersonalizationLowFlowEstimationConfig;
  v5 = [(FCPersonalizationLowFlowEstimationConfig *)&v14 init];
  if (v5)
  {
    double v6 = 0.5;
    double v7 = FCAppConfigurationDoubleValue(v4, @"exponent", 0.5);
    if (v7 >= 0.0) {
      double v6 = v7;
    }
    double v8 = 10.0;
    double v9 = FCAppConfigurationDoubleValue(v4, @"padding", 10.0);
    if (v9 >= 0.0) {
      double v8 = v9;
    }
    double v10 = FCAppConfigurationDoubleValue(v4, @"prior", 0.1);
    if (v10 > 1.0 || v10 < 0.0) {
      double v12 = 0.1;
    }
    else {
      double v12 = v10;
    }
    v5 = [(FCPersonalizationLowFlowEstimationConfig *)v5 initWithExponent:v6 padding:v8 prior:v12];
  }

  return v5;
}

- (FCPersonalizationLowFlowEstimationConfig)initWithExponent:(double)a3 padding:(double)a4 prior:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)FCPersonalizationLowFlowEstimationConfig;
  result = [(FCPersonalizationLowFlowEstimationConfig *)&v9 init];
  if (result)
  {
    result->_exponent = a3;
    result->_padding = a4;
    result->_prior = a5;
  }
  return result;
}

- (FCPersonalizationLowFlowEstimationConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    double v8 = "-[FCPersonalizationLowFlowEstimationConfig init]";
    __int16 v9 = 2080;
    double v10 = "FCPersonalizationLowFlowEstimationConfig.m";
    __int16 v11 = 1024;
    int v12 = 18;
    __int16 v13 = 2114;
    objc_super v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPersonalizationLowFlowEstimationConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationLowFlowEstimationConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"exponent"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"padding"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"prior"];
  double v10 = v9;

  return [(FCPersonalizationLowFlowEstimationConfig *)self initWithExponent:v6 padding:v8 prior:v10];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(FCPersonalizationLowFlowEstimationConfig *)self exponent];
  objc_msgSend(v4, "encodeDouble:forKey:", @"exponent");
  [(FCPersonalizationLowFlowEstimationConfig *)self padding];
  objc_msgSend(v4, "encodeDouble:forKey:", @"padding");
  [(FCPersonalizationLowFlowEstimationConfig *)self prior];
  objc_msgSend(v4, "encodeDouble:forKey:", @"prior");
}

- (double)exponent
{
  return self->_exponent;
}

- (void)setExponent:(double)a3
{
  self->_exponent = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (double)prior
{
  return self->_prior;
}

- (void)setPrior:(double)a3
{
  self->_prior = a3;
}

@end