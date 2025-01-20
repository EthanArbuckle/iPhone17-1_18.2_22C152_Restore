@interface SKUIMediaQuerySizeFeature
+ (BOOL)supportsFeatureName:(id)a3;
- (BOOL)evaluateWithValues:(id)a3;
- (SKUIMediaQuerySizeFeature)initWithFeatureName:(id)a3 value:(id)a4;
- (id)description;
- (id)requiredKeys;
@end

@implementation SKUIMediaQuerySizeFeature

- (SKUIMediaQuerySizeFeature)initWithFeatureName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaQuerySizeFeature initWithFeatureName:value:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIMediaQuerySizeFeature;
  v8 = [(SKUIMediaQueryFeature *)&v11 initWithFeatureName:v6 value:v7];
  if (v8)
  {
    [v7 floatValue];
    v8->_value = v9;
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
    +[SKUIMediaQuerySizeFeature supportsFeatureName:]();
  }
  if (([v3 isEqualToString:@"min-width"] & 1) != 0
    || ([v3 isEqualToString:@"max-width"] & 1) != 0
    || ([v3 isEqualToString:@"min-height"] & 1) != 0
    || ([v3 isEqualToString:@"max-height"] & 1) != 0
    || ([v3 isEqualToString:@"width"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"height"];
  }

  return v4;
}

- (BOOL)evaluateWithValues:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIMediaQueryFeature *)self featureName];
  if (![v5 isEqualToString:@"min-width"])
  {
    if ([v5 isEqualToString:@"max-width"])
    {
      uint64_t v10 = 0x1F1C87BC8;
LABEL_6:
      id v7 = [v4 objectForKey:v10];
      [v7 floatValue];
      BOOL v9 = self->_value >= v11;
      goto LABEL_10;
    }
    if ([v5 isEqualToString:@"width"])
    {
      uint64_t v12 = 0x1F1C87BC8;
    }
    else
    {
      if ([v5 isEqualToString:@"min-height"])
      {
        uint64_t v6 = 0x1F1C87BE8;
        goto LABEL_3;
      }
      if ([v5 isEqualToString:@"max-height"])
      {
        uint64_t v10 = 0x1F1C87BE8;
        goto LABEL_6;
      }
      if (![v5 isEqualToString:@"height"])
      {
        BOOL v9 = 0;
        goto LABEL_11;
      }
      uint64_t v12 = 0x1F1C87BE8;
    }
    id v7 = [v4 objectForKey:v12];
    BOOL v9 = [v7 longValue] == (uint64_t)self->_value;
    goto LABEL_10;
  }
  uint64_t v6 = 0x1F1C87BC8;
LABEL_3:
  id v7 = [v4 objectForKey:v6];
  [v7 floatValue];
  BOOL v9 = self->_value <= v8;
LABEL_10:

LABEL_11:
  return v9;
}

- (id)requiredKeys
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(SKUIMediaQueryFeature *)self featureName];
  if (([v2 isEqualToString:@"min-width"] & 1) != 0
    || ([v2 isEqualToString:@"max-width"] & 1) != 0
    || [v2 isEqualToString:@"width"])
  {
    v7[0] = 0x1F1C87BC8;
    id v3 = v7;
  }
  else
  {
    uint64_t v6 = 0x1F1C87BE8;
    id v3 = &v6;
  }
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SKUIMediaQuerySizeFeature;
  id v4 = [(SKUIMediaQuerySizeFeature *)&v8 description];
  v5 = [(SKUIMediaQueryFeature *)self featureName];
  uint64_t v6 = [v3 stringWithFormat:@"%@: [%@, %.0f]", v4, v5, *(void *)&self->_value];

  return v6;
}

- (void)initWithFeatureName:value:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaQuerySizeFeature initWithFeatureName:value:]";
}

+ (void)supportsFeatureName:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIMediaQuerySizeFeature supportsFeatureName:]";
}

@end