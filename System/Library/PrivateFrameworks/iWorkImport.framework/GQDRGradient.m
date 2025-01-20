@interface GQDRGradient
+ (const)stateForReading;
- (CGPoint)end;
- (CGPoint)start;
- (__CFArray)stops;
- (float)angle;
- (float)opacity;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (int)type;
- (void)dealloc;
@end

@implementation GQDRGradient

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9EFE0;
}

- (void)dealloc
{
  mStops = self->mStops;
  if (mStops) {
    CFRelease(mStops);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDRGradient;
  [(GQDRGradient *)&v4 dealloc];
}

- (__CFArray)stops
{
  return self->mStops;
}

- (int)type
{
  return self->mType;
}

- (float)opacity
{
  return self->mOpacity;
}

- (float)angle
{
  return self->mAngle;
}

- (CGPoint)start
{
  double x = self->mStart.x;
  double y = self->mStart.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)end
{
  double x = self->mEnd.x;
  double y = self->mEnd.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  sub_43348(a3, qword_A35E8, (xmlChar *)"opacity", &self->mOpacity);
  if (v5)
  {
    int v6 = sub_43A9C(a3, qword_A35E8, (xmlChar *)"type", (uint64_t)&dword_A4088, &self->mType);
    int mType = self->mType;
    if (mType || !v6)
    {
      if (mType) {
        int v10 = v6;
      }
      else {
        int v10 = 0;
      }
      if (v10 == 1) {
        return 1;
      }
    }
    else
    {
      sub_43348(a3, qword_A35E8, (xmlChar *)"angle", &self->mAngle);
      if (v8) {
        return 1;
      }
    }
  }
  return 3;
}

@end