@interface PRProximity
- (BOOL)azimuthIsValid;
- (BOOL)elevationIsValid;
- (PRProximity)initWithTime:(double)a3 range:(float)a4;
- (PRProximity)initWithTime:(double)a3 range:(float)a4 azimuth:(float)a5 elevation:(float)a6;
- (double)timestamp;
- (double)vector;
- (float)azimuth;
- (float)elevation;
- (float)range;
@end

@implementation PRProximity

- (PRProximity)initWithTime:(double)a3 range:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PRProximity;
  result = [(PRProximity *)&v7 init];
  if (result)
  {
    result->_timestamp = a3;
    result->_range = a4;
    *(void *)&result->_azimuth = 0;
    *(_WORD *)&result->_azimuthIsValid = 0;
  }
  return result;
}

- (PRProximity)initWithTime:(double)a3 range:(float)a4 azimuth:(float)a5 elevation:(float)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PRProximity;
  result = [(PRProximity *)&v11 init];
  if (result)
  {
    result->_timestamp = a3;
    result->_range = a4;
    result->_azimuth = a5;
    result->_elevation = a6;
    *(_WORD *)&result->_azimuthIsValid = 257;
  }
  return result;
}

- (double)vector
{
  [a1 azimuth];
  float v3 = v2 * 3.14159265 / 180.0;
  [a1 elevation];
  float v5 = v4 * 3.14159265 / 180.0;
  [a1 range];
  double v7 = v6;
  __double2 v8 = __sincos_stret(v3);
  float v9 = v8.__sinval * v7;
  float v14 = v9;
  [a1 range];
  float v11 = v8.__cosval * v10 * __sincos_stret(v5).__cosval;
  float v13 = v11;
  [a1 range];
  return COERCE_DOUBLE(__PAIR64__(LODWORD(v13), LODWORD(v14)));
}

- (double)timestamp
{
  return self->_timestamp;
}

- (float)range
{
  return self->_range;
}

- (float)azimuth
{
  return self->_azimuth;
}

- (float)elevation
{
  return self->_elevation;
}

- (BOOL)azimuthIsValid
{
  return self->_azimuthIsValid;
}

- (BOOL)elevationIsValid
{
  return self->_elevationIsValid;
}

@end