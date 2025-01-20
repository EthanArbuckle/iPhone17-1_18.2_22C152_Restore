@interface SBDeviceMotionVector
- (BOOL)isEqual:(id)a3;
- (SBDeviceMotionVector)init;
- (SBDeviceMotionVector)initWithDictionary:(id)a3;
- (SBDeviceMotionVector)initWithX:(double)a3 y:(double)a4 z:(double)a5;
- (double)x;
- (double)y;
- (double)z;
- (id)dictionaryRepresentation;
@end

@implementation SBDeviceMotionVector

- (SBDeviceMotionVector)init
{
  return [(SBDeviceMotionVector *)self initWithX:0.0 y:0.0 z:0.0];
}

- (SBDeviceMotionVector)initWithX:(double)a3 y:(double)a4 z:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceMotionVector;
  result = [(SBDeviceMotionVector *)&v9 init];
  if (result)
  {
    result->_x = a3;
    result->_y = a4;
    result->_z = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  double x = self->_x;
  [v4 x];
  if (x == v6 && (double y = self->_y, [v4 y], y == v8))
  {
    double z = self->_z;
    [v4 z];
    BOOL v11 = z == v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)dictionaryRepresentation
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"x";
  v3 = [NSNumber numberWithDouble:self->_x];
  v9[0] = v3;
  v8[1] = @"y";
  id v4 = [NSNumber numberWithDouble:self->_y];
  v9[1] = v4;
  v8[2] = @"z";
  v5 = [NSNumber numberWithDouble:self->_z];
  v9[2] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (SBDeviceMotionVector)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"x"];
  [v5 doubleValue];
  double v7 = v6;

  double v8 = [v4 objectForKeyedSubscript:@"y"];
  [v8 doubleValue];
  double v10 = v9;

  BOOL v11 = [v4 objectForKeyedSubscript:@"z"];

  [v11 doubleValue];
  double v13 = v12;

  v14 = [[SBDeviceMotionVector alloc] initWithX:v7 y:v10 z:v13];
  return v14;
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

- (double)z
{
  return self->_z;
}

@end