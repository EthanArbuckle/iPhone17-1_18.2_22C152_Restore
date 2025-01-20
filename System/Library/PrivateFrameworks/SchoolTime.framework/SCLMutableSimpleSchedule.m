@interface SCLMutableSimpleSchedule
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEndTime:(id)a3;
- (void)setRepeatSchedule:(int64_t)a3;
- (void)setStartTime:(id)a3;
@end

@implementation SCLMutableSimpleSchedule

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SCLSimpleSchedule alloc];
  return [(SCLSimpleSchedule *)v4 initWithSimpleSchedule:self];
}

- (void)setStartTime:(id)a3
{
  self->super._startTime = (SCLScheduleTime *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setEndTime:(id)a3
{
  self->super._endTime = (SCLScheduleTime *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setRepeatSchedule:(int64_t)a3
{
  self->super._repeatSchedule = a3;
}

@end