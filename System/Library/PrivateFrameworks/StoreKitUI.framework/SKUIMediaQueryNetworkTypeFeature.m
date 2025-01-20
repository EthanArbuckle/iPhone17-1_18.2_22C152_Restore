@interface SKUIMediaQueryNetworkTypeFeature
+ (BOOL)supportsFeatureName:(id)a3;
- (BOOL)evaluateWithValues:(id)a3;
- (SKUIMediaQueryNetworkTypeFeature)initWithFeatureName:(id)a3 value:(id)a4;
- (id)description;
- (id)notificationNames;
- (id)requiredKeys;
@end

@implementation SKUIMediaQueryNetworkTypeFeature

- (SKUIMediaQueryNetworkTypeFeature)initWithFeatureName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaQueryNetworkTypeFeature initWithFeatureName:value:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIMediaQueryNetworkTypeFeature;
  v8 = [(SKUIMediaQueryFeature *)&v12 initWithFeatureName:v6 value:v7];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    value = v8->_value;
    v8->_value = (NSString *)v9;
  }
  return v8;
}

+ (BOOL)supportsFeatureName:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIMediaQueryNetworkTypeFeature supportsFeatureName:]();
  }
  char v4 = [v3 isEqualToString:@"network"];

  return v4;
}

- (BOOL)evaluateWithValues:(id)a3
{
  char v4 = [a3 objectForKey:0x1F1C87C48];
  LOBYTE(self) = [v4 isEqualToString:self->_value];

  return (char)self;
}

- (id)notificationNames
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4FB87E0];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)requiredKeys
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1F1C87C48;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SKUIMediaQueryNetworkTypeFeature;
  char v4 = [(SKUIMediaQueryNetworkTypeFeature *)&v8 description];
  v5 = [(SKUIMediaQueryFeature *)self featureName];
  id v6 = [v3 stringWithFormat:@"%@: [%@, %@]", v4, v5, self->_value];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)initWithFeatureName:value:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaQueryNetworkTypeFeature initWithFeatureName:value:]";
}

+ (void)supportsFeatureName:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIMediaQueryNetworkTypeFeature supportsFeatureName:]";
}

@end