@interface SKUIMediaQueryFeature
+ (BOOL)supportsFeatureName:(id)a3;
- (BOOL)evaluateWithValues:(id)a3;
- (NSArray)notificationNames;
- (NSArray)requiredKeys;
- (NSString)featureName;
- (SKUIMediaQueryFeature)initWithFeatureName:(id)a3 value:(id)a4;
@end

@implementation SKUIMediaQueryFeature

- (SKUIMediaQueryFeature)initWithFeatureName:(id)a3 value:(id)a4
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaQueryFeature initWithFeatureName:value:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIMediaQueryFeature;
  v6 = [(SKUIMediaQueryFeature *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    featureName = v6->_featureName;
    v6->_featureName = (NSString *)v7;
  }
  return v6;
}

+ (BOOL)supportsFeatureName:(id)a3
{
  return 0;
}

- (BOOL)evaluateWithValues:(id)a3
{
  return 0;
}

- (NSArray)notificationNames
{
  return 0;
}

- (NSArray)requiredKeys
{
  return 0;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void).cxx_destruct
{
}

- (void)initWithFeatureName:value:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaQueryFeature initWithFeatureName:value:]";
}

@end