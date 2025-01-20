@interface SCLMutableScheduleTime
+ (BOOL)supportsSecureCoding;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setHour:(unint64_t)a3;
- (void)setMinute:(unint64_t)a3;
@end

@implementation SCLMutableScheduleTime

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SCLScheduleTime alloc];
  return [(SCLScheduleTime *)v4 initWithScheduleTime:self];
}

- (void)setHour:(unint64_t)a3
{
  if (a3 < 0x18)
  {
    self->super._hour = a3;
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFF940];
    uint64_t v4 = *MEMORY[0x263EFF4A0];
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v3 raise:v4, @"Hour %@ cannot be greater than 23", v5 format];
  }
}

- (void)setMinute:(unint64_t)a3
{
  if (a3 < 0x3C)
  {
    self->super._minute = a3;
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFF940];
    uint64_t v4 = *MEMORY[0x263EFF4A0];
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v3 raise:v4, @"Minute %@ cannot be greater than 59", v5 format];
  }
}

@end