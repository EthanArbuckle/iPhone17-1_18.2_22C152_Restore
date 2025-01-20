@interface FCPersonalizationPublisherDampeningConfig
+ (BOOL)supportsSecureCoding;
- (FCPersonalizationPublisherDampeningConfig)init;
- (FCPersonalizationPublisherDampeningConfig)initWithCoder:(id)a3;
- (FCPersonalizationPublisherDampeningConfig)initWithConfig:(id)a3;
- (FCPersonalizationPublisherDampeningConfig)initWithDampeningFactorMapping:(id)a3 dampeningStrategy:(unint64_t)a4 defaultDampeningFactor:(double)a5;
- (NSDictionary)dampeningFactorMapping;
- (double)defaultDampeningFactor;
- (unint64_t)dampeningStrategy;
- (void)encodeWithCoder:(id)a3;
- (void)setDampeningFactorMapping:(id)a3;
- (void)setDampeningStrategy:(unint64_t)a3;
- (void)setDefaultDampeningFactor:(double)a3;
@end

@implementation FCPersonalizationPublisherDampeningConfig

- (void).cxx_destruct
{
}

- (FCPersonalizationPublisherDampeningConfig)initWithConfig:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPersonalizationPublisherDampeningConfig;
  v5 = [(FCPersonalizationPublisherDampeningConfig *)&v9 init];
  if (v5)
  {
    v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"mapping", 0);
    uint64_t v7 = FCAppConfigurationIntegerValue(v4, @"strategy", 0);
    v5 = [(FCPersonalizationPublisherDampeningConfig *)v5 initWithDampeningFactorMapping:v6 dampeningStrategy:v7 defaultDampeningFactor:FCAppConfigurationDoubleValue(v4, @"defaultDampeningFactor", 1.0)];
  }
  return v5;
}

- (FCPersonalizationPublisherDampeningConfig)initWithDampeningFactorMapping:(id)a3 dampeningStrategy:(unint64_t)a4 defaultDampeningFactor:(double)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCPersonalizationPublisherDampeningConfig;
  objc_super v9 = [(FCPersonalizationPublisherDampeningConfig *)&v13 init];
  if (v9)
  {
    if (v8) {
      v10 = (NSDictionary *)v8;
    }
    else {
      v10 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    dampeningFactorMapping = v9->_dampeningFactorMapping;
    v9->_dampeningFactorMapping = v10;

    v9->_dampeningStrategy = a4;
    v9->_defaultDampeningFactor = a5;
  }

  return v9;
}

- (FCPersonalizationPublisherDampeningConfig)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCPersonalizationPublisherDampeningConfig init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationPublisherDampeningConfig.m";
    __int16 v11 = 1024;
    int v12 = 17;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPersonalizationPublisherDampeningConfig init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersonalizationPublisherDampeningConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"dampeningFactorMapping"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"dampeningStrategy"];
  [v4 decodeDoubleForKey:@"defaultDampeningFactor"];
  double v8 = v7;

  __int16 v9 = [(FCPersonalizationPublisherDampeningConfig *)self initWithDampeningFactorMapping:v5 dampeningStrategy:v6 defaultDampeningFactor:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(FCPersonalizationPublisherDampeningConfig *)self dampeningFactorMapping];
  [v5 encodeObject:v4 forKey:@"dampeningFactorMapping"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[FCPersonalizationPublisherDampeningConfig dampeningStrategy](self, "dampeningStrategy"), @"dampeningStrategy");
  [(FCPersonalizationPublisherDampeningConfig *)self defaultDampeningFactor];
  objc_msgSend(v5, "encodeDouble:forKey:", @"defaultDampeningFactor");
}

- (NSDictionary)dampeningFactorMapping
{
  return self->_dampeningFactorMapping;
}

- (void)setDampeningFactorMapping:(id)a3
{
}

- (unint64_t)dampeningStrategy
{
  return self->_dampeningStrategy;
}

- (void)setDampeningStrategy:(unint64_t)a3
{
  self->_dampeningStrategy = a3;
}

- (double)defaultDampeningFactor
{
  return self->_defaultDampeningFactor;
}

- (void)setDefaultDampeningFactor:(double)a3
{
  self->_defaultDampeningFactor = a3;
}

@end