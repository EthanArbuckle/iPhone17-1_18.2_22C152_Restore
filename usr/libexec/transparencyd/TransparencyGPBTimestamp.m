@interface TransparencyGPBTimestamp
+ (id)descriptor;
- (NSDate)date;
- (TransparencyGPBTimestamp)initWithDate:(id)a3;
- (TransparencyGPBTimestamp)initWithTimeIntervalSince1970:(double)a3;
- (double)timeIntervalSince1970;
- (void)setDate:(id)a3;
- (void)setTimeIntervalSince1970:(double)a3;
@end

@implementation TransparencyGPBTimestamp

+ (id)descriptor
{
  id result = (id)qword_10032EBA0;
  if (!qword_10032EBA0)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBTimestamp messageName:@"Timestamp" fileDescription:off_100323A08 fields:&off_1003239C8 fieldCount:2 storageSize:16 flags:v3];
    qword_10032EBA0 = (uint64_t)result;
  }
  return result;
}

- (TransparencyGPBTimestamp)initWithDate:(id)a3
{
  [a3 timeIntervalSince1970];

  return -[TransparencyGPBTimestamp initWithTimeIntervalSince1970:](self, "initWithTimeIntervalSince1970:");
}

- (TransparencyGPBTimestamp)initWithTimeIntervalSince1970:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TransparencyGPBTimestamp;
  v4 = [(TransparencyGPBMessage *)&v9 init];
  if (v4)
  {
    double __y = 0.0;
    double v5 = modf(a3, &__y);
    double v6 = __y;
    if (v5 < 0.0)
    {
      double v6 = __y + -1.0;
      double v5 = v5 + 1.0;
    }
    uint64_t v7 = (int)(v5 * 1000000000.0);
    [(TransparencyGPBTimestamp *)v4 setSeconds:(uint64_t)v6];
    [(TransparencyGPBTimestamp *)v4 setNanos:v7];
  }
  return v4;
}

- (NSDate)date
{
  [(TransparencyGPBTimestamp *)self timeIntervalSince1970];

  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
}

- (void)setDate:(id)a3
{
  [a3 timeIntervalSince1970];

  -[TransparencyGPBTimestamp setTimeIntervalSince1970:](self, "setTimeIntervalSince1970:");
}

- (double)timeIntervalSince1970
{
  id v3 = [(TransparencyGPBTimestamp *)self seconds];
  return (double)(int)[(TransparencyGPBTimestamp *)self nanos] / 1000000000.0 + (double)(uint64_t)v3;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  double __y = 0.0;
  double v4 = modf(a3, &__y);
  double v5 = __y;
  if (v4 < 0.0)
  {
    double v5 = __y + -1.0;
    double v4 = v4 + 1.0;
  }
  uint64_t v6 = (int)(v4 * 1000000000.0);
  [(TransparencyGPBTimestamp *)self setSeconds:(uint64_t)v5];

  [(TransparencyGPBTimestamp *)self setNanos:v6];
}

@end