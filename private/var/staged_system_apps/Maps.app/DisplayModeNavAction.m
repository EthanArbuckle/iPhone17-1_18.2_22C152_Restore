@interface DisplayModeNavAction
- (BOOL)isCompatibleWithNavigation;
- (BOOL)showDetails;
- (DisplayModeNavAction)initWithShowDetails:(BOOL)a3;
- (int)analyticsLaunchActionType;
- (void)setShowDetails:(BOOL)a3;
@end

@implementation DisplayModeNavAction

- (DisplayModeNavAction)initWithShowDetails:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DisplayModeNavAction;
  result = [(DisplayModeNavAction *)&v5 init];
  if (result) {
    result->_showDetails = a3;
  }
  return result;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (int)analyticsLaunchActionType
{
  return 7;
}

- (BOOL)showDetails
{
  return self->_showDetails;
}

- (void)setShowDetails:(BOOL)a3
{
  self->_showDetails = a3;
}

@end