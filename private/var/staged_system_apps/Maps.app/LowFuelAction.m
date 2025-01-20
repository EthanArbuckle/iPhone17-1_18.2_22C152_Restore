@interface LowFuelAction
- (BOOL)isCompatibleWithNavigation;
- (LowFuelAction)initWithEngineType:(int)a3;
- (int)analyticsLaunchActionType;
- (int)engineType;
- (void)setEngineType:(int)a3;
@end

@implementation LowFuelAction

- (LowFuelAction)initWithEngineType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LowFuelAction;
  result = [(LowFuelAction *)&v5 init];
  if (result) {
    result->_engineType = a3;
  }
  return result;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (int)analyticsLaunchActionType
{
  return 10;
}

- (int)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int)a3
{
  self->_engineType = a3;
}

@end