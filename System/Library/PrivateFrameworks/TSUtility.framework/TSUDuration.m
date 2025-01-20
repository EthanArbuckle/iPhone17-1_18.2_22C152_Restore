@interface TSUDuration
+ (id)durationWithTimeInterval:(double)a3;
- (BOOL)isEqual:(id)a3;
- (TSUDuration)initWithTimeInterval:(double)a3;
- (double)timeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation TSUDuration

+ (id)durationWithTimeInterval:(double)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTimeInterval:a3];
  return v3;
}

- (TSUDuration)initWithTimeInterval:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSUDuration;
  result = [(TSUDuration *)&v5 init];
  if (result) {
    result->mTimeInterval = a3;
  }
  return result;
}

- (double)timeInterval
{
  return self->mTimeInterval;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double mTimeInterval = self->mTimeInterval;
  return (id)[v4 initWithTimeInterval:mTimeInterval];
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0 && *((double *)a3 + 1) == self->mTimeInterval;
}

- (unint64_t)hash
{
  return self->mTimeInterval;
}

@end