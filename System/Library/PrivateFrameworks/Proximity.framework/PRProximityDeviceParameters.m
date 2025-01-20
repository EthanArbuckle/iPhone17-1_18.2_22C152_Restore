@interface PRProximityDeviceParameters
- (NSNumber)rssiImmediate;
- (NSNumber)rssiNear;
- (PRProximityDeviceParameters)init;
- (PRProximityDeviceParameters)initWithFilter:(void *)a3 sampleSize:(unint64_t)a4 rssiImmediate:(id)a5 rssiNear:(id)a6;
- (unint64_t)samplesize;
- (void)filter;
@end

@implementation PRProximityDeviceParameters

- (PRProximityDeviceParameters)init
{
  return 0;
}

- (PRProximityDeviceParameters)initWithFilter:(void *)a3 sampleSize:(unint64_t)a4 rssiImmediate:(id)a5 rssiNear:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PRProximityDeviceParameters;
  v13 = [(PRProximityDeviceParameters *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_filter = a3;
    v13->_samplesize = a4;
    objc_storeStrong((id *)&v13->_rssiImmediate, a5);
    objc_storeStrong((id *)&v14->_rssiNear, a6);
  }

  return v14;
}

- (void)filter
{
  return self->_filter;
}

- (unint64_t)samplesize
{
  return self->_samplesize;
}

- (NSNumber)rssiImmediate
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)rssiNear
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssiNear, 0);
  objc_storeStrong((id *)&self->_rssiImmediate, 0);
}

@end