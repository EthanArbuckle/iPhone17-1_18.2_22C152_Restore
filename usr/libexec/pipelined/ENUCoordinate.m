@interface ENUCoordinate
+ (id)fromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5;
- (ENUCoordinate)init;
- (ENUCoordinate)initWithEast:(double)a3 north:(double)a4 up:(double)a5;
- (double)east;
- (double)north;
- (double)up;
- (void)setEast:(double)a3;
- (void)setFromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5;
- (void)setNorth:(double)a3;
- (void)setUp:(double)a3;
@end

@implementation ENUCoordinate

+ (id)fromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(ENUCoordinate);
  [(ENUCoordinate *)v10 setFromLatLonOrigin:v7 andEcefOrigin:v8 andEcefPoint:v9];

  return v10;
}

- (ENUCoordinate)init
{
  return [(ENUCoordinate *)self initWithEast:NAN north:NAN up:NAN];
}

- (ENUCoordinate)initWithEast:(double)a3 north:(double)a4 up:(double)a5
{
  self->_east = a3;
  self->_north = a4;
  self->_up = a5;
  return self;
}

- (void)setFromLatLonOrigin:(id)a3 andEcefOrigin:(id)a4 andEcefPoint:(id)a5
{
  id v38 = a3;
  id v8 = a4;
  id v9 = a5;
  [v38 latitude];
  double v11 = v10;
  [v38 latitude];
  double v13 = v12;
  [v38 longitude];
  double v15 = v14;
  [v38 longitude];
  double v17 = v16;
  [v9 x];
  double v19 = v18;
  [v8 x];
  double v21 = v20;
  double v36 = v15;
  double v37 = v13;
  [v9 y];
  double v23 = v22;
  [v8 y];
  double v25 = v24;
  [v9 z];
  double v35 = v26;
  [v8 z];
  double v28 = v27;
  double v29 = v23 - v25;
  double v30 = v19 - v21;
  double v31 = sin(v17 * 0.0174532925);
  double v32 = cos(v36 * 0.0174532925);
  double v33 = sin(v37 * 0.0174532925);
  long double v34 = cos(v11 * 0.0174532925);
  self->_east = v32 * v29 - v31 * v30;
  self->_north = -(v33 * v31) * v29 + -(v33 * v32) * v30 + v34 * (v35 - v28);
  self->_up = v34 * v31 * v29 + v34 * v32 * v30 + v33 * (v35 - v28);
}

- (double)north
{
  return self->_north;
}

- (double)east
{
  return self->_east;
}

- (void)setEast:(double)a3
{
  self->_east = a3;
}

- (void)setNorth:(double)a3
{
  self->_north = a3;
}

- (double)up
{
  return self->_up;
}

- (void)setUp:(double)a3
{
  self->_up = a3;
}

@end