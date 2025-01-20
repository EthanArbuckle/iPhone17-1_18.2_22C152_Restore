@interface ULPrivacyMonitorEventLocationServices
- (BOOL)locationServicesEnabled;
- (void)setLocationServicesEnabled:(BOOL)a3;
@end

@implementation ULPrivacyMonitorEventLocationServices

- (BOOL)locationServicesEnabled
{
  return self->_locationServicesEnabled;
}

- (void)setLocationServicesEnabled:(BOOL)a3
{
  self->_locationServicesEnabled = a3;
}

@end