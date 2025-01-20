@interface WebGeolocationPositionInternal
- (WebGeolocationPositionInternal)initWithCoreGeolocationPosition:(void *)a3;
- (id).cxx_construct;
@end

@implementation WebGeolocationPositionInternal

- (WebGeolocationPositionInternal)initWithCoreGeolocationPosition:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WebGeolocationPositionInternal;
  result = [(WebGeolocationPositionInternal *)&v10 init];
  if (result)
  {
    long long v5 = *(_OWORD *)a3;
    long long v6 = *((_OWORD *)a3 + 1);
    result->_position.altitude = (optional<double>)*((_OWORD *)a3 + 2);
    *(_OWORD *)&result->_position.longitude = v6;
    *(_OWORD *)&result->_position.timestamp = v5;
    optional<double> v7 = (optional<double>)*((_OWORD *)a3 + 3);
    optional<double> v8 = (optional<double>)*((_OWORD *)a3 + 4);
    optional<double> v9 = (optional<double>)*((_OWORD *)a3 + 5);
    result->_position.floorLevel = (optional<double>)*((_OWORD *)a3 + 6);
    result->_position.speed = v9;
    result->_position.heading = v8;
    result->_position.altitudeAccuracy = v7;
  }
  return result;
}

- (id).cxx_construct
{
  int64x2_t v2 = vdupq_n_s64(0x7FF8000000000000uLL);
  *(int64x2_t *)((char *)self + 8) = v2;
  *(int64x2_t *)((char *)self + 24) = v2;
  *((unsigned char *)self + 40) = 0;
  *((unsigned char *)self + 48) = 0;
  *((unsigned char *)self + 56) = 0;
  *((unsigned char *)self + 64) = 0;
  *((unsigned char *)self + 72) = 0;
  *((unsigned char *)self + 80) = 0;
  *((unsigned char *)self + 88) = 0;
  *((unsigned char *)self + 96) = 0;
  *((unsigned char *)self + 104) = 0;
  *((unsigned char *)self + 112) = 0;
  return self;
}

@end