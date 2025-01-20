@interface STScreenTimeCapabilities
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCapabilities:(id)a3;
- (STScreenTimeCapabilities)initWithSupportedInfrastructure:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)supportedInfrastructure;
@end

@implementation STScreenTimeCapabilities

- (STScreenTimeCapabilities)initWithSupportedInfrastructure:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STScreenTimeCapabilities;
  result = [(STScreenTimeCapabilities *)&v5 init];
  result->_supportedInfrastructure = a3;
  return result;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = [(STScreenTimeCapabilities *)self supportedInfrastructure];
  objc_super v5 = objc_opt_new();
  v6 = v5;
  if (v4) {
    [v5 addObject:@"V1"];
  }
  if ((v4 & 2) != 0) {
    [v6 addObject:@"V2"];
  }
  v7 = [v6 componentsJoinedByString:@", "];
  v8 = +[NSString stringWithFormat:@"[%@]", v7];

  v9 = +[NSString stringWithFormat:@"<%@ { Supported Infrastructure: %@ }>", v3, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  int64_t supportedInfrastructure = self->_supportedInfrastructure;
  return [v4 initWithSupportedInfrastructure:supportedInfrastructure];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STScreenTimeCapabilities *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STScreenTimeCapabilities *)self isEqualToCapabilities:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToCapabilities:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  int64_t v5 = [(STScreenTimeCapabilities *)self supportedInfrastructure];
  id v6 = [v4 supportedInfrastructure];

  return v5 == (void)v6;
}

- (int64_t)supportedInfrastructure
{
  return self->_supportedInfrastructure;
}

@end