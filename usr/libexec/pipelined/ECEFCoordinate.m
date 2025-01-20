@interface ECEFCoordinate
+ (id)fromLatLon:(id)a3;
- (ECEFCoordinate)init;
- (ECEFCoordinate)initWithX:(double)a3 y:(double)a4 z:(double)a5;
- (double)x;
- (double)y;
- (double)z;
- (id)initFromLatLon:(id)a3;
- (point_xy<double,)toBoostEnuWithLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 usingENU:(id)a5;
- (void)setFromLatLon:(id)a3;
- (void)setFromX:(double)a3 y:(double)a4 z:(double)a5;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)setZ:(double)a3;
@end

@implementation ECEFCoordinate

+ (id)fromLatLon:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ECEFCoordinate);
  [(ECEFCoordinate *)v4 setFromLatLon:v3];

  return v4;
}

- (double)y
{
  return self->_y;
}

- (double)x
{
  return self->_x;
}

- (double)z
{
  return self->_z;
}

- (void)setFromX:(double)a3 y:(double)a4 z:(double)a5
{
  self->_x = a3;
  self->_y = a4;
  self->_z = a5;
}

- (void)setFromLatLon:(id)a3
{
  id v16 = a3;
  [v16 latitude];
  double v5 = cos(v4 * 0.0174532925);
  [v16 latitude];
  double v7 = sin(v6 * 0.0174532925);
  [v16 longitude];
  double v9 = cos(v8 * 0.0174532925);
  [v16 longitude];
  double v11 = sin(v10 * 0.0174532925);
  [v16 altitude];
  double v12 = 6378137.0 / sqrt(v7 * -0.00669437999 * v7 + 1.0);
  self->_x = v9 * (v5 * (v12 + v13));
  [v16 altitude];
  self->_y = v11 * (v5 * (v12 + v14));
  [v16 altitude];
  self->_z = v7 * (v15 + v12 * 0.99330562);
}

- (point_xy<double,)toBoostEnuWithLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 usingENU:(id)a5
{
  id v8 = a5;
  [v8 setFromLatLonOrigin:a3 andEcefOrigin:a4 andEcefPoint:self];
  [v8 east];
  double v10 = v9;
  [v8 north];
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.var0[1] = v14;
  result.var0[0] = v13;
  return result;
}

- (ECEFCoordinate)initWithX:(double)a3 y:(double)a4 z:(double)a5
{
  return self;
}

- (ECEFCoordinate)init
{
  return [(ECEFCoordinate *)self initWithX:NAN y:NAN z:NAN];
}

- (id)initFromLatLon:(id)a3
{
  double v4 = +[ECEFCoordinate fromLatLon:a3];

  return v4;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end