@interface RTLocationManagerNotificationLocationsAccuracyHundredMeters
- (NSArray)locations;
- (RTLocationManagerNotificationLocationsAccuracyHundredMeters)initWithLocations:(id)a3;
@end

@implementation RTLocationManagerNotificationLocationsAccuracyHundredMeters

- (RTLocationManagerNotificationLocationsAccuracyHundredMeters)initWithLocations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTLocationManagerNotificationLocationsAccuracyHundredMeters;
  v6 = [(RTNotification *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_locations, a3);
  }

  return v7;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void).cxx_destruct
{
}

@end