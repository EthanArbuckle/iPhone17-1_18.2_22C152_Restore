@interface FMFScheduler
+ (const)alarmStream;
+ (const)timerIdentifier;
- (void)notifyDelegateThatCurrentSchedulesDidChange;
@end

@implementation FMFScheduler

+ (const)timerIdentifier
{
  return (const char *)FMFScheduleTimerIdentifier;
}

+ (const)alarmStream
{
  return (const char *)FMFFenceTimerAlarmStream;
}

- (void)notifyDelegateThatCurrentSchedulesDidChange
{
  id v3 = [(FMFScheduler *)self delegate];
  [v3 schedulerCurrentSchedulesDidChange:self];
}

@end