@interface SBContinuityLockStateProvider
- (BOOL)isUILocked;
- (void)addLockStateObserver:(id)a3;
- (void)removeLockStateObserver:(id)a3;
@end

@implementation SBContinuityLockStateProvider

- (BOOL)isUILocked
{
  return 0;
}

- (void)addLockStateObserver:(id)a3
{
  if (!a3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBContinuityLockStateProvider.m", 22, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
}

- (void)removeLockStateObserver:(id)a3
{
  if (!a3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBContinuityLockStateProvider.m", 27, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
}

@end