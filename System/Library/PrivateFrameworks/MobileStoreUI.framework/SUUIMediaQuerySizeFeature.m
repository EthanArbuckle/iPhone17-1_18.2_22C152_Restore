@interface SUUIMediaQuerySizeFeature
+ (BOOL)supportsFeatureName:(id)a3;
- (BOOL)evaluateWithValues:(id)a3;
- (SUUIMediaQuerySizeFeature)initWithFeatureName:(id)a3 value:(id)a4;
- (id)description;
- (id)requiredKeys;
@end

@implementation SUUIMediaQuerySizeFeature

- (SUUIMediaQuerySizeFeature)initWithFeatureName:(id)a3 value:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SUUIMediaQuerySizeFeature;
  v7 = [(SUUIMediaQueryFeature *)&v10 initWithFeatureName:a3 value:v6];
  if (v7)
  {
    [v6 floatValue];
    v7->_value = v8;
  }

  return v7;
}

+ (BOOL)supportsFeatureName:(id)a3
{
  id v3 = a3;
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
  v5 = [(SUUIMediaQueryFeature *)self featureName];
  if (![v5 isEqualToString:@"min-width"])
  {
    if ([v5 isEqualToString:@"max-width"])
    {
      uint64_t v10 = 0x2704F7E70;
LABEL_6:
      v7 = [v4 objectForKey:v10];
      [v7 floatValue];
      BOOL v9 = self->_value >= v11;
      goto LABEL_10;
    }
    if ([v5 isEqualToString:@"width"])
    {
      uint64_t v12 = 0x2704F7E70;
    }
    else
    {
      if ([v5 isEqualToString:@"min-height"])
      {
        uint64_t v6 = 0x2704F7DB0;
        goto LABEL_3;
      }
      if ([v5 isEqualToString:@"max-height"])
      {
        uint64_t v10 = 0x2704F7DB0;
        goto LABEL_6;
      }
      if (![v5 isEqualToString:@"height"])
      {
        BOOL v9 = 0;
        goto LABEL_11;
      }
      uint64_t v12 = 0x2704F7DB0;
    }
    v7 = [v4 objectForKey:v12];
    BOOL v9 = [v7 longValue] == (uint64_t)self->_value;
    goto LABEL_10;
  }
  uint64_t v6 = 0x2704F7E70;
LABEL_3:
  v7 = [v4 objectForKey:v6];
  [v7 floatValue];
  BOOL v9 = self->_value <= v8;
LABEL_10:

LABEL_11:
  return v9;
}

- (id)requiredKeys
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(SUUIMediaQueryFeature *)self featureName];
  if (([v2 isEqualToString:@"min-width"] & 1) != 0
    || ([v2 isEqualToString:@"max-width"] & 1) != 0
    || [v2 isEqualToString:@"width"])
  {
    v7[0] = 0x2704F7E70;
    id v3 = v7;
  }
  else
  {
    uint64_t v6 = 0x2704F7DB0;
    id v3 = &v6;
  }
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SUUIMediaQuerySizeFeature;
  id v4 = [(SUUIMediaQuerySizeFeature *)&v8 description];
  v5 = [(SUUIMediaQueryFeature *)self featureName];
  uint64_t v6 = [v3 stringWithFormat:@"%@: [%@, %.0f]", v4, v5, *(void *)&self->_value];

  return v6;
}

@end