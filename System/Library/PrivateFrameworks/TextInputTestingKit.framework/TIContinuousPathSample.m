@interface TIContinuousPathSample
+ (BOOL)supportsSecureCoding;
- (CGPoint)point;
- (TIContinuousPathSample)initWithCoder:(id)a3;
- (TIContinuousPathSample)initWithJsonDictionary:(id)a3;
- (TIContinuousPathSample)initWithPoint:(CGPoint)a3 timeStamp:(double)a4 force:(double)a5 radius:(double)a6;
- (TIContinuousPathSample)initWithPoint:(CGPoint)a3 timeStamp:(double)a4 force:(double)a5 radius:(double)a6 stage:(int)a7 pathIndex:(int64_t)a8;
- (double)force;
- (double)radius;
- (double)timeStamp;
- (id)description;
- (id)toJsonDictionary;
- (int)stage;
- (int64_t)pathIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIContinuousPathSample

- (int64_t)pathIndex
{
  return self->_pathIndex;
}

- (int)stage
{
  return self->_stage;
}

- (double)radius
{
  return self->_radius;
}

- (double)force
{
  return self->_force;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  [(TIContinuousPathSample *)self point];
  uint64_t v5 = v4;
  [(TIContinuousPathSample *)self point];
  objc_msgSend(v3, "appendFormat:", @"; point = (%.1f,%.1f)", v5, v6);
  [(TIContinuousPathSample *)self timeStamp];
  objc_msgSend(v3, "appendFormat:", @"; timeStamp = %f", v7);
  [(TIContinuousPathSample *)self radius];
  objc_msgSend(v3, "appendFormat:", @"; radius = %f", v8);
  [(TIContinuousPathSample *)self force];
  objc_msgSend(v3, "appendFormat:", @"; force = %f", v9);
  objc_msgSend(v3, "appendFormat:", @"; stage = %u", -[TIContinuousPathSample stage](self, "stage"));
  objc_msgSend(v3, "appendFormat:", @"; pathIndedouble x = %ld", -[TIContinuousPathSample pathIndex](self, "pathIndex"));
  [v3 appendString:@">"];
  return v3;
}

- (id)toJsonDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  CGFloat x = self->_point.x;
  *(float *)&CGFloat x = x;
  uint64_t v5 = [NSNumber numberWithFloat:x];
  [v3 setObject:v5 forKeyedSubscript:@"x"];

  CGFloat y = self->_point.y;
  *(float *)&CGFloat y = y;
  uint64_t v7 = [NSNumber numberWithFloat:y];
  [v3 setObject:v7 forKeyedSubscript:@"y"];

  double timeStamp = self->_timeStamp;
  *(float *)&double timeStamp = timeStamp;
  uint64_t v9 = [NSNumber numberWithFloat:timeStamp];
  [v3 setObject:v9 forKeyedSubscript:@"t"];

  double force = self->_force;
  *(float *)&double force = force;
  v11 = [NSNumber numberWithFloat:force];
  [v3 setObject:v11 forKeyedSubscript:@"force"];

  double radius = self->_radius;
  *(float *)&double radius = radius;
  v13 = [NSNumber numberWithFloat:radius];
  [v3 setObject:v13 forKeyedSubscript:@"radius"];

  v14 = [NSNumber numberWithUnsignedInt:self->_stage];
  [v3 setObject:v14 forKeyedSubscript:@"stage"];

  v15 = [NSNumber numberWithInt:LODWORD(self->_pathIndex)];
  [v3 setObject:v15 forKeyedSubscript:@"path_index"];

  return v3;
}

- (TIContinuousPathSample)initWithJsonDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TIContinuousPathSample;
  uint64_t v5 = [(TIContinuousPathSample *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"x"];
    [v6 floatValue];
    float v8 = v7;

    uint64_t v9 = [v4 objectForKey:@"y"];
    [v9 floatValue];
    float v11 = v10;

    v5->_point.CGFloat x = v8;
    v5->_point.CGFloat y = v11;
    v12 = [v4 objectForKey:@"t"];
    [v12 floatValue];
    v5->_double timeStamp = v13;

    v14 = [v4 objectForKey:@"force"];
    [v14 floatValue];
    v5->_double force = v15;

    v16 = [v4 objectForKey:@"stage"];
    v17 = v16;
    if (v16) {
      int v18 = [v16 intValue];
    }
    else {
      int v18 = 7;
    }
    v5->_stage = v18;
    v19 = [v4 objectForKey:@"path_index"];
    v20 = v19;
    if (v19) {
      uint64_t v21 = (int)[v19 intValue];
    }
    else {
      uint64_t v21 = -1;
    }
    v5->_pathIndeCGFloat x = v21;
    v22 = [v4 objectForKey:@"radius"];
    v23 = v22;
    if (v22)
    {
      [v22 floatValue];
      v5->_double radius = v24;
    }
  }
  return v5;
}

- (TIContinuousPathSample)initWithPoint:(CGPoint)a3 timeStamp:(double)a4 force:(double)a5 radius:(double)a6 stage:(int)a7 pathIndex:(int64_t)a8
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)TIContinuousPathSample;
  CGPoint result = [(TIContinuousPathSample *)&v16 init];
  if (result)
  {
    result->_point.CGFloat x = x;
    result->_point.CGFloat y = y;
    result->_double timeStamp = a4;
    result->_double force = a5;
    result->_double radius = a6;
    result->_stage = a7;
    result->_pathIndeCGFloat x = a8;
  }
  return result;
}

- (TIContinuousPathSample)initWithPoint:(CGPoint)a3 timeStamp:(double)a4 force:(double)a5 radius:(double)a6
{
  return -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](self, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", 7, -1, a3.x, a3.y, a4, a5, a6);
}

- (TIContinuousPathSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIContinuousPathSample;
  uint64_t v5 = [(TIContinuousPathSample *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"point"];
    [v6 getValue:&v5->_point size:16];
    [v4 decodeDoubleForKey:@"timeStamp"];
    v5->_double timeStamp = v7;
    [v4 decodeDoubleForKey:@"force"];
    v5->_double force = v8;
    [v4 decodeDoubleForKey:@"radius"];
    v5->_double radius = v9;
    v5->_stage = [v4 decodeIntegerForKey:@"stage"];
    v5->_pathIndeCGFloat x = [v4 decodeIntegerForKey:@"path_index"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08D40];
  p_point = &self->_point;
  id v6 = a3;
  [v4 value:p_point withObjCType:"{CGPoint=dd}"];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v7 forKey:@"point"];
  [v6 encodeDouble:@"timeStamp" forKey:self->_timeStamp];
  [v6 encodeDouble:@"force" forKey:self->_force];
  [v6 encodeDouble:@"radius" forKey:self->_radius];
  [v6 encodeInteger:self->_stage forKey:@"stage"];
  [v6 encodeInteger:self->_pathIndex forKey:@"path_index"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end