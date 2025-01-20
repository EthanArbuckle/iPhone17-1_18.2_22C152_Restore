@interface SharedTripAction
- (BOOL)isCompatibleWithNavigation;
- (GEOSharedNavState)shareTrip;
- (SharedTripAction)initWithSharedTrip:(id)a3;
- (int)analyticsLaunchActionType;
@end

@implementation SharedTripAction

- (SharedTripAction)initWithSharedTrip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SharedTripAction;
  v6 = [(SharedTripAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shareTrip, a3);
  }

  return v7;
}

- (BOOL)isCompatibleWithNavigation
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 3;
}

- (GEOSharedNavState)shareTrip
{
  return self->_shareTrip;
}

- (void).cxx_destruct
{
}

@end