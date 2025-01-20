@interface HKSPSensitiveUIMonitor(Daemon)
- (uint64_t)environment;
- (uint64_t)initWithEnvironment:()Daemon;
@end

@implementation HKSPSensitiveUIMonitor(Daemon)

- (uint64_t)initWithEnvironment:()Daemon
{
  v4 = [a3 defaultCallbackScheduler];
  uint64_t v5 = [a1 initWithCallbackScheduler:v4];

  return v5;
}

- (uint64_t)environment
{
  return 0;
}

@end