@interface GeographicCoordinate
+ (id)fromECEFCoordinate:(id)a3;
- (GeographicCoordinate)init;
- (GeographicCoordinate)initWithLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5;
- (double)altitude;
- (double)latitude;
- (double)longitude;
- (id)initFromECEFCoordinate:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setFromECEFCoordinate:(id)a3;
- (void)setFromLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
@end

@implementation GeographicCoordinate

- (void)setFromLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5
{
  self->_latitude = a3;
  self->_longitude = a4;
  self->_altitude = a5;
}

- (void)setFromECEFCoordinate:(id)a3
{
  id v28 = a3;
  [v28 x];
  double v5 = v4;
  [v28 x];
  double v7 = v6;
  [v28 y];
  double v9 = v8;
  [v28 y];
  double v11 = v10;
  [v28 y];
  long double v13 = v12;
  [v28 x];
  double v14 = sqrt(v9 * v11 + v5 * v7);
  self->_longitude = atan2(v13, v15) / 0.0174532925;
  double v16 = v14 * 0.99330562;
  double v17 = 0.0;
  double v18 = 1.57079633;
  if (v14 * 0.99330562 == 0.0)
  {
    v19 = v28;
  }
  else
  {
    unsigned int v20 = 0;
    double v21 = 0.0;
    double v22 = 0.0;
    [v28 z:0x3FF921FB54442D18];
    while (1)
    {
      double v18 = atan2(v23, v16);
      __double2 v24 = __sincos_stret(v18);
      double v25 = 6378137.0 / sqrt(v24.__sinval * -0.00669437999 * v24.__sinval + 1.0);
      double v17 = v14 / v24.__cosval - v25;
      if (vabdd_f64(v21, v18) >= 0.000001)
      {
        v19 = v28;
        if (v20 > 8) {
          goto LABEL_15;
        }
      }
      else
      {
        BOOL v26 = vabdd_f64(v22, v17) < 0.001 || v20 >= 9;
        v19 = v28;
        if (v26) {
          goto LABEL_15;
        }
      }
      ++v20;
      double v16 = v14 * (v25 / (v17 + v25) * -0.00669437999 + 1.0);
      double v21 = v18;
      double v22 = v14 / v24.__cosval - v25;
      if (v16 == 0.0) {
        break;
      }
      [v19 z:v27];
    }
    double v18 = v27;
  }
LABEL_15:
  self->_latitude = v18 / 0.0174532925;
  self->_altitude = v17;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (id)initFromECEFCoordinate:(id)a3
{
  double v4 = +[GeographicCoordinate fromECEFCoordinate:a3];

  return v4;
}

+ (id)fromECEFCoordinate:(id)a3
{
  id v3 = a3;
  double v4 = objc_alloc_init(GeographicCoordinate);
  [(GeographicCoordinate *)v4 setFromECEFCoordinate:v3];

  return v4;
}

- (GeographicCoordinate)init
{
  v3.receiver = self;
  v3.super_class = (Class)GeographicCoordinate;
  return [[(GeographicCoordinate *)&v3 init] initWithLatitude:NAN longitude:NAN andAltitude:NAN];
}

- (GeographicCoordinate)initWithLatitude:(double)a3 longitude:(double)a4 andAltitude:(double)a5
{
  return self;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

@end