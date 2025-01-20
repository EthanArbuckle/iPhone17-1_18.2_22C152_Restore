@interface SUUIMediaQueryNetworkTypeFeature
+ (BOOL)supportsFeatureName:(id)a3;
- (BOOL)evaluateWithValues:(id)a3;
- (SUUIMediaQueryNetworkTypeFeature)initWithFeatureName:(id)a3 value:(id)a4;
- (id)description;
- (id)notificationNames;
- (id)requiredKeys;
@end

@implementation SUUIMediaQueryNetworkTypeFeature

- (SUUIMediaQueryNetworkTypeFeature)initWithFeatureName:(id)a3 value:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMediaQueryNetworkTypeFeature;
  v7 = [(SUUIMediaQueryFeature *)&v11 initWithFeatureName:a3 value:v6];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    value = v7->_value;
    v7->_value = (NSString *)v8;
  }
  return v7;
}

+ (BOOL)supportsFeatureName:(id)a3
{
  return [a3 isEqualToString:@"network"];
}

- (BOOL)evaluateWithValues:(id)a3
{
  v4 = [a3 objectForKey:0x27050B170];
  LOBYTE(self) = [v4 isEqualToString:self->_value];

  return (char)self;
}

- (id)notificationNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F89418];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)requiredKeys
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0x27050B170;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SUUIMediaQueryNetworkTypeFeature;
  v4 = [(SUUIMediaQueryNetworkTypeFeature *)&v8 description];
  v5 = [(SUUIMediaQueryFeature *)self featureName];
  id v6 = [v3 stringWithFormat:@"%@: [%@, %@]", v4, v5, self->_value];

  return v6;
}

- (void).cxx_destruct
{
}

@end