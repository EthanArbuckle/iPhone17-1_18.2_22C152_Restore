@interface SBExternalDisplaySystemGestureManager
- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3;
- (SBExternalDisplaySystemGestureManager)initWithDisplayIdentity:(id)a3;
@end

@implementation SBExternalDisplaySystemGestureManager

- (SBExternalDisplaySystemGestureManager)initWithDisplayIdentity:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBExternalDisplaySystemGestureManager.m", 18, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)SBExternalDisplaySystemGestureManager;
  v6 = [(SBSystemGestureManager *)&v9 _initWithDisplayIdentity:v5];

  return v6;
}

- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3
{
  BOOL result = 1;
  char v4 = a3 - 12;
  if (a3 - 12 <= 0x38)
  {
    if (((1 << v4) & 0x10106003BE81341) != 0) {
      return result;
    }
    if (((1 << v4) & 0x180000000000) != 0) {
      return SBFIsChamoisOverflowGestureAvailable();
    }
  }
  if (a3 - 109 > 0x1D || ((1 << (a3 - 109)) & 0x20000003) == 0) {
    return 0;
  }
  return result;
}

@end