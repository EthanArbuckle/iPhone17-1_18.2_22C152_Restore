@interface RTLocationManagerNotificationLocationsLeeched
- (NSArray)leechedLocations;
- (RTLocationManagerNotificationLocationsLeeched)initWithLocations:(id)a3;
@end

@implementation RTLocationManagerNotificationLocationsLeeched

- (RTLocationManagerNotificationLocationsLeeched)initWithLocations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTLocationManagerNotificationLocationsLeeched;
  v6 = [(RTNotification *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_leechedLocations, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (NSArray)leechedLocations
{
  return self->_leechedLocations;
}

@end