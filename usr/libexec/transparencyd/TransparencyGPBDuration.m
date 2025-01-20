@interface TransparencyGPBDuration
+ (id)descriptor;
- (TransparencyGPBDuration)initWithTimeInterval:(double)a3;
- (TransparencyGPBDuration)initWithTimeIntervalSince1970:(double)a3;
- (double)timeInterval;
- (double)timeIntervalSince1970;
- (void)setTimeInterval:(double)a3;
- (void)setTimeIntervalSince1970:(double)a3;
@end

@implementation TransparencyGPBDuration

+ (id)descriptor
{
  id result = (id)qword_10032EB38;
  if (!qword_10032EB38)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBDuration messageName:@"Duration" fileDescription:off_100323748 fields:&off_100323708 fieldCount:2 storageSize:16 flags:v3];
    qword_10032EB38 = (uint64_t)result;
  }
  return result;
}

- (TransparencyGPBDuration)initWithTimeInterval:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TransparencyGPBDuration;
  v4 = [(TransparencyGPBMessage *)&v7 init];
  if (v4)
  {
    double __y = 0.0;
    uint64_t v5 = (int)(modf(a3, &__y) * 1000000000.0);
    [(TransparencyGPBDuration *)v4 setSeconds:(uint64_t)__y];
    [(TransparencyGPBDuration *)v4 setNanos:v5];
  }
  return v4;
}

- (TransparencyGPBDuration)initWithTimeIntervalSince1970:(double)a3
{
  return [(TransparencyGPBDuration *)self initWithTimeInterval:a3];
}

- (double)timeInterval
{
  id v3 = [(TransparencyGPBDuration *)self seconds];
  return (double)(int)[(TransparencyGPBDuration *)self nanos] / 1000000000.0 + (double)(uint64_t)v3;
}

- (void)setTimeInterval:(double)a3
{
  double __y = 0.0;
  uint64_t v4 = (int)(modf(a3, &__y) * 1000000000.0);
  [(TransparencyGPBDuration *)self setSeconds:(uint64_t)__y];

  [(TransparencyGPBDuration *)self setNanos:v4];
}

- (double)timeIntervalSince1970
{
  [(TransparencyGPBDuration *)self timeInterval];
  return result;
}

- (void)setTimeIntervalSince1970:(double)a3
{
}

@end