@interface CLSubHarvesterAvengerAdvertisement
- (BOOL)fromOwnerDevice;
- (CLSubHarvesterAvengerAdvertisement)initWithAdvertisement:(id)a3 maxActivityBasedSpeedSinceAdvertisement:(double)a4;
- (SPAdvertisement)advertisement;
- (double)maxActivityBasedSpeedSinceAdvertisement;
- (int64_t)type;
- (void)dealloc;
- (void)setFromOwnerDevice:(BOOL)a3;
- (void)setMaxActivityBasedSpeedSinceAdvertisement:(double)a3;
@end

@implementation CLSubHarvesterAvengerAdvertisement

- (CLSubHarvesterAvengerAdvertisement)initWithAdvertisement:(id)a3 maxActivityBasedSpeedSinceAdvertisement:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLSubHarvesterAvengerAdvertisement;
  v6 = [(CLSubHarvesterAvengerAdvertisement *)&v8 init];
  if (v6)
  {
    v6->_advertisement = (SPAdvertisement *)a3;
    v6->_maxActivityBasedSpeedSinceAdvertisement = a4;
    v6->_type = [objc_msgSend(objc_msgSend(a3, "advertisementData")) length] != 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLSubHarvesterAvengerAdvertisement;
  [(CLSubHarvesterAvengerAdvertisement *)&v3 dealloc];
}

- (SPAdvertisement)advertisement
{
  return self->_advertisement;
}

- (double)maxActivityBasedSpeedSinceAdvertisement
{
  return self->_maxActivityBasedSpeedSinceAdvertisement;
}

- (void)setMaxActivityBasedSpeedSinceAdvertisement:(double)a3
{
  self->_maxActivityBasedSpeedSinceAdvertisement = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)fromOwnerDevice
{
  return self->_fromOwnerDevice;
}

- (void)setFromOwnerDevice:(BOOL)a3
{
  self->_fromOwnerDevice = a3;
}

@end