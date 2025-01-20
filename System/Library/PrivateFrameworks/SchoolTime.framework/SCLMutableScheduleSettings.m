@interface SCLMutableScheduleSettings
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSchedule:(id)a3;
@end

@implementation SCLMutableScheduleSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SCLScheduleSettings alloc];
  return [(SCLScheduleSettings *)v4 initWithSchoolModeScheduleSettings:self];
}

- (void)setEnabled:(BOOL)a3
{
  self->super._enabled = a3;
}

- (void)setSchedule:(id)a3
{
  v4 = (SCLSchedule *)a3;
  if (!v4) {
    v4 = objc_alloc_init(SCLSchedule);
  }
  self->super._schedule = v4;
  MEMORY[0x270F9A758]();
}

@end