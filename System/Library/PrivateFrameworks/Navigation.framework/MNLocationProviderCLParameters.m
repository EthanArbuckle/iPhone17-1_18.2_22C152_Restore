@interface MNLocationProviderCLParameters
- (BOOL)fusionInfoEnabled;
- (int64_t)activityType;
- (void)setActivityType:(int64_t)a3;
- (void)setFusionInfoEnabled:(BOOL)a3;
@end

@implementation MNLocationProviderCLParameters

- (int64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (BOOL)fusionInfoEnabled
{
  return self->_fusionInfoEnabled;
}

- (void)setFusionInfoEnabled:(BOOL)a3
{
  self->_fusionInfoEnabled = a3;
}

@end