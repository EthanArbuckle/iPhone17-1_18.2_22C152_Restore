@interface CLMicroLocationGeofence
- (CLLocation)regionCenterLocation;
- (CLMicroLocationGeofence)init;
- (NSString)regionId;
- (void)setRegionCenterLocation:(id)a3;
- (void)setRegionId:(id)a3;
@end

@implementation CLMicroLocationGeofence

- (CLMicroLocationGeofence)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationGeofence;
  return [(CLMicroLocationGeofence *)&v3 init];
}

- (NSString)regionId
{
  return self->_regionId;
}

- (void)setRegionId:(id)a3
{
}

- (CLLocation)regionCenterLocation
{
  return self->_regionCenterLocation;
}

- (void)setRegionCenterLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCenterLocation, 0);
  objc_storeStrong((id *)&self->_regionId, 0);
}

@end