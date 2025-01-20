@interface SXLineBalancingSettings
- (BOOL)enableLineBalancing;
- (SXLineBalancingSettings)initWithLineBalancingEnabled:(BOOL)a3;
@end

@implementation SXLineBalancingSettings

- (SXLineBalancingSettings)initWithLineBalancingEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXLineBalancingSettings;
  result = [(SXLineBalancingSettings *)&v5 init];
  if (result) {
    result->_enableLineBalancing = a3;
  }
  return result;
}

- (BOOL)enableLineBalancing
{
  return self->_enableLineBalancing;
}

@end