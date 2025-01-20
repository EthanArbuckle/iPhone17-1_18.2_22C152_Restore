@interface AccelerometerData
- (AccelerometerData)initWithData:(id)a3 timestamp:(double)a4;
- (double)timestamp;
- (double)x;
- (double)y;
- (double)z;
- (id)description;
- (void)setTimestamp:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)setZ:(double)a3;
@end

@implementation AccelerometerData

- (AccelerometerData)initWithData:(id)a3 timestamp:(double)a4
{
  $1AB5FA073B851C12C2339EC22442E995 v10 = a3;
  SEL v8 = a2;
  double v7 = a4;
  v9 = 0;
  v6.receiver = self;
  v6.super_class = (Class)AccelerometerData;
  v9 = [(AccelerometerData *)&v6 init];
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v9->_timestamp = v7;
    v9->_x = v10.var0;
    v9->_y = v10.var1;
    v9->_z = v10.var2;
  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v7 = (id)[NSNumber numberWithDouble:self->_timestamp];
  id v6 = (id)[NSNumber numberWithDouble:self->_x];
  id v5 = (id)[NSNumber numberWithDouble:self->_y];
  id v4 = (id)[NSNumber numberWithDouble:self->_z];
  id v8 = (id)[v3 stringWithFormat:@"%@,%@,%@,%@", v7, v6, v5, v4];

  return v8;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (double)z
{
  return self->_z;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end