@interface TIKeyboardTouchEvent
+ (BOOL)supportsSecureCoding;
+ (TIKeyboardTouchEvent)touchEventWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 fingerID:(int)a8 forcedKeyCode:(int64_t)a9;
+ (TIKeyboardTouchEvent)touchEventWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 fingerID:(int)a8 forcedKeyCode:(int64_t)a9 continuousPathState:(int)a10;
+ (TIKeyboardTouchEvent)touchEventWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 forcedKeyCode:(int64_t)a8;
- (CGPoint)location;
- (TIKeyboardTouchEvent)initWithCoder:(id)a3;
- (TIKeyboardTouchEvent)initWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 fingerID:(int)a8 forcedKeyCode:(int64_t)a9 continuousPathState:(int)a10;
- (double)radius;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (int)continuousPathState;
- (int)fingerID;
- (int)stage;
- (int64_t)forcedKeyCode;
- (int64_t)pathIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIKeyboardTouchEvent

- (int64_t)forcedKeyCode
{
  return self->_forcedKeyCode;
}

- (int)fingerID
{
  return self->_fingerID;
}

- (int)stage
{
  return self->_stage;
}

- (int64_t)pathIndex
{
  return self->_pathIndex;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)radius
{
  return self->_radius;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int)continuousPathState
{
  return self->_mask.integerValue & 0xF;
}

- (id)shortDescription
{
  unsigned int v3 = [(TIKeyboardTouchEvent *)self stage];
  if (v3 > 3) {
    v4 = "?";
  }
  else {
    v4 = off_1E5559AC8[v3];
  }
  unsigned int v5 = [(TIKeyboardTouchEvent *)self continuousPathState];
  if (v5 > 6) {
    v6 = "";
  }
  else {
    v6 = off_1E5559AE8[v5];
  }
  v7 = NSString;
  [(TIKeyboardTouchEvent *)self location];
  *(float *)&double v8 = v8;
  double v9 = *(float *)&v8;
  [(TIKeyboardTouchEvent *)self location];
  float v11 = v10;
  double v12 = v11;
  [(TIKeyboardTouchEvent *)self timestamp];
  *(float *)&double v13 = v13;
  return (id)[v7 stringWithFormat:@"(x=%.1f,y=%.1f,t=%.2f,%s,idx=%lu,cp=%s)", *(void *)&v9, *(void *)&v12, *(float *)&v13, v4, -[TIKeyboardTouchEvent pathIndex](self, "pathIndex"), v6];
}

- (id)description
{
  unsigned int v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  unsigned int v4 = [(TIKeyboardTouchEvent *)self stage];
  if (v4 <= 5) {
    [v3 appendString:*((void *)&off_1E55599F8 + v4)];
  }
  [(TIKeyboardTouchEvent *)self location];
  uint64_t v6 = v5;
  [(TIKeyboardTouchEvent *)self location];
  objc_msgSend(v3, "appendFormat:", @"; location = (%.1f,%.1f)", v6, v7);
  [(TIKeyboardTouchEvent *)self radius];
  objc_msgSend(v3, "appendFormat:", @"; radius = %f", v8);
  [(TIKeyboardTouchEvent *)self timestamp];
  objc_msgSend(v3, "appendFormat:", @"; timestamp = %f", v9);
  objc_msgSend(v3, "appendFormat:", @"; pathIndedouble x = %ld", -[TIKeyboardTouchEvent pathIndex](self, "pathIndex"));
  unsigned int v10 = [(TIKeyboardTouchEvent *)self fingerID];
  if (v10 <= 0xC && ((0x1F7Du >> v10) & 1) != 0) {
    [v3 appendString:*((void *)&off_1E5559A28 + v10)];
  }
  objc_msgSend(v3, "appendFormat:", @"; forcedKeyCode = %ld",
    [(TIKeyboardTouchEvent *)self forcedKeyCode]);
  unsigned int v11 = [(TIKeyboardTouchEvent *)self continuousPathState];
  if (v11 <= 6) {
    [v3 appendString:*((void *)&off_1E5559A90 + v11)];
  }
  [v3 appendString:@">"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t stage = self->_stage;
  id v12 = v4;
  if (stage)
  {
    [v4 encodeInteger:stage forKey:@"stage"];
    id v4 = v12;
  }
  CGFloat x = self->_location.x;
  if (x != 0.0)
  {
    *(float *)&CGFloat x = x;
    [v12 encodeFloat:@"location.x" forKey:x];
    id v4 = v12;
  }
  CGFloat y = self->_location.y;
  if (y != 0.0)
  {
    *(float *)&CGFloat y = y;
    [v12 encodeFloat:@"location.y" forKey:y];
    id v4 = v12;
  }
  if (self->_radius != 0.0)
  {
    objc_msgSend(v12, "encodeDouble:forKey:", @"radius");
    id v4 = v12;
  }
  if (self->_timestamp != 0.0)
  {
    objc_msgSend(v12, "encodeDouble:forKey:", @"timestamp");
    id v4 = v12;
  }
  pathIndeCGFloat x = self->_pathIndex;
  if (pathIndex)
  {
    [v12 encodeInteger:pathIndex forKey:@"pathIndex"];
    id v4 = v12;
  }
  uint64_t fingerID = self->_fingerID;
  if (fingerID)
  {
    [v12 encodeInteger:fingerID forKey:@"fingerID"];
    id v4 = v12;
  }
  int64_t forcedKeyCode = self->_forcedKeyCode;
  if (forcedKeyCode)
  {
    [v12 encodeInteger:forcedKeyCode forKey:@"forcedKeyCode"];
    id v4 = v12;
  }
  int64_t integerValue = self->_mask.integerValue;
  if (integerValue)
  {
    [v12 encodeInteger:integerValue forKey:@"flags"];
    id v4 = v12;
  }
}

- (TIKeyboardTouchEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardTouchEvent;
  uint64_t v5 = [(TIKeyboardTouchEvent *)&v12 init];
  if (v5)
  {
    v5->_uint64_t stage = [v4 decodeIntegerForKey:@"stage"];
    [v4 decodeFloatForKey:@"location.x"];
    CGFloat v7 = v6;
    [v4 decodeFloatForKey:@"location.y"];
    v5->_location.CGFloat x = v7;
    v5->_location.CGFloat y = v8;
    [v4 decodeDoubleForKey:@"radius"];
    v5->_radius = v9;
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v10;
    v5->_pathIndeCGFloat x = [v4 decodeIntegerForKey:@"pathIndex"];
    v5->_uint64_t fingerID = [v4 decodeIntegerForKey:@"fingerID"];
    v5->_int64_t forcedKeyCode = [v4 decodeIntegerForKey:@"forcedKeyCode"];
    v5->_mask.int64_t integerValue = [v4 decodeIntegerForKey:@"flags"];
  }

  return v5;
}

- (TIKeyboardTouchEvent)initWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 fingerID:(int)a8 forcedKeyCode:(int64_t)a9 continuousPathState:(int)a10
{
  char v10 = a10;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardTouchEvent;
  CGPoint result = [(TIKeyboardTouchEvent *)&v20 init];
  if (result)
  {
    result->_location.CGFloat x = x;
    result->_location.CGFloat y = y;
    result->_radius = a5;
    result->_timestamp = a6;
    result->_uint64_t stage = a3;
    result->_uint64_t fingerID = a8;
    result->_pathIndeCGFloat x = a7;
    result->_int64_t forcedKeyCode = a9;
    LOBYTE(result->_mask.integerValue) = result->_mask.integerValue & 0xF0 | v10 & 0xF;
  }
  return result;
}

+ (TIKeyboardTouchEvent)touchEventWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 fingerID:(int)a8 forcedKeyCode:(int64_t)a9 continuousPathState:(int)a10
{
  char v10 = -[TIKeyboardTouchEvent initWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]([TIKeyboardTouchEvent alloc], "initWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", *(void *)&a3, a7, *(void *)&a8, a9, *(void *)&a10, a4.x, a4.y, a5, a6);

  return v10;
}

+ (TIKeyboardTouchEvent)touchEventWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 fingerID:(int)a8 forcedKeyCode:(int64_t)a9
{
  double v9 = -[TIKeyboardTouchEvent initWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:]([TIKeyboardTouchEvent alloc], "initWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", *(void *)&a3, a7, *(void *)&a8, a9, 2, a4.x, a4.y, a5, a6);

  return v9;
}

+ (TIKeyboardTouchEvent)touchEventWithStage:(int)a3 location:(CGPoint)a4 radius:(double)a5 timestamp:(double)a6 pathIndex:(int64_t)a7 forcedKeyCode:(int64_t)a8
{
  return (TIKeyboardTouchEvent *)objc_msgSend(a1, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", *(void *)&a3, a7, 0, a8, 2, a4.x, a4.y, a5, a6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end