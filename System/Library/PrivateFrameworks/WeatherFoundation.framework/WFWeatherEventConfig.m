@interface WFWeatherEventConfig
- (BOOL)enabled;
- (WFWeatherEventConfig)initWithDictionary:(id)a3 defaulEnabled:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation WFWeatherEventConfig

- (WFWeatherEventConfig)initWithDictionary:(id)a3 defaulEnabled:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWeatherEventConfig;
  v7 = [(WFWeatherEventConfig *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_enabled = a4;
    v9 = [v6 numberForKey:@"ios"];
    v10 = v9;
    if (v9) {
      a4 = [v9 BOOLValue];
    }
    v8->_enabled = a4;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_enabled;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end