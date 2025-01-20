@interface SBHTintedIconImageStyleConfiguration
- (SBHTintedIconImageStyleConfiguration)initWithConfigurationType:(int64_t)a3 tintColor:(id)a4;
- (id)tintColor;
- (int64_t)configurationType;
@end

@implementation SBHTintedIconImageStyleConfiguration

- (SBHTintedIconImageStyleConfiguration)initWithConfigurationType:(int64_t)a3 tintColor:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBHTintedIconImageStyleConfiguration;
  v7 = [(SBHIconImageStyleConfiguration *)&v11 initWithConfigurationType:a3 tintColor:v6];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    tintColor = v7->_tintColor;
    v7->_tintColor = (UIColor *)v8;
  }
  return v7;
}

- (int64_t)configurationType
{
  return 4;
}

- (id)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
}

@end