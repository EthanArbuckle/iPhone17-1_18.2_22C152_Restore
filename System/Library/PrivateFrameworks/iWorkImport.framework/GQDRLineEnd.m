@interface GQDRLineEnd
+ (const)stateForReading;
- (BOOL)isFilled;
- (CGPath)path;
- (CGPoint)endPoint;
- (char)pathStr;
- (double)scale;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (void)dealloc;
@end

@implementation GQDRLineEnd

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDRLineEnd;
  [(GQDRLineEnd *)&v3 dealloc];
}

- (char)pathStr
{
  return [(GQDBezierPath *)self->mPath pathStr];
}

- (CGPath)path
{
  return [(GQDBezierPath *)self->mPath path];
}

- (CGPoint)endPoint
{
  double x = self->mEndPoint.x;
  double y = self->mEndPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isFilled
{
  return self->mIsFilled;
}

- (double)scale
{
  return self->mScale;
}

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A3878;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  self->mIsFilled = sub_42DCC(a3, qword_A35E8, (xmlChar *)"filled", 0);
  sub_433CC(a3, qword_A35E8, (xmlChar *)"scale");
  self->mScale = v5;
  return 1;
}

@end