@interface SBDeviceUnlockAggdLogger
- (BOOL)_observeDashBoardEvents;
- (BOOL)handleEvent:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (NSString)coverSheetIdentifier;
- (SBDeviceUnlockAggdLogger)init;
- (int64_t)participantState;
- (void)_setObserveDashBoardEvents:(BOOL)a3;
- (void)dealloc;
- (void)logDeviceUnlock;
- (void)logDeviceWake;
- (void)logIdleTimerScreenDimWarning;
- (void)logOrientationAndAccessoryStateForPrefix:(id)a3;
- (void)logUserResetIdleTimer;
@end

@implementation SBDeviceUnlockAggdLogger

- (SBDeviceUnlockAggdLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBDeviceUnlockAggdLogger;
  v2 = [(SBDeviceUnlockAggdLogger *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_observeDashBoardEvents = 1;
    v4 = +[SBLockScreenManager sharedInstance];
    v5 = [v4 coverSheetViewController];
    [v5 registerExternalEventHandler:v3];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[SBLockScreenManager sharedInstance];
  v4 = [v3 coverSheetViewController];
  [v4 unregisterExternalEventHandler:self];

  v5.receiver = self;
  v5.super_class = (Class)SBDeviceUnlockAggdLogger;
  [(SBDeviceUnlockAggdLogger *)&v5 dealloc];
}

- (void)logDeviceWake
{
}

- (void)logDeviceUnlock
{
}

- (void)logOrientationAndAccessoryStateForPrefix:(id)a3
{
  id v7 = a3;
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_super v5 = [MEMORY[0x1E4F42948] currentDevice];
    v6 = SBDeviceUnlockAggdKeyForPrefixAndOrientation((uint64_t)v7, [v5 orientation]);

    ADClientAddValueForScalarKey();
    if ([MEMORY[0x1E4F42B08] isInHardwareKeyboardMode])
    {
      [NSString stringWithFormat:@"%@.%@", v6, @"keyboard"];
      ADClientAddValueForScalarKey();
    }
    if ([(id)SBApp smartCoverIsClosed])
    {
      [NSString stringWithFormat:@"%@.%@", v6, @"SmartCover"];
      ADClientAddValueForScalarKey();
    }
  }
}

- (void)logIdleTimerScreenDimWarning
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [NSString stringWithFormat:@"%@.%@", @"com.apple.springboard.idleTimer", @"screenDim"];
    ADClientAddValueForScalarKey();
  }
}

- (void)logUserResetIdleTimer
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [NSString stringWithFormat:@"%@.%@", @"com.apple.springboard.idleTimer", @"userAttentionReset"];
    ADClientAddValueForScalarKey();
  }
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if ([(SBDeviceUnlockAggdLogger *)self _observeDashBoardEvents]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 12)
  {
    [(SBDeviceUnlockAggdLogger *)self logDeviceUnlock];
    v6 = self;
    uint64_t v7 = 0;
LABEL_7:
    [(SBDeviceUnlockAggdLogger *)v6 _setObserveDashBoardEvents:v7];
    goto LABEL_8;
  }
  if (v5 == 25)
  {
    v6 = self;
    uint64_t v7 = 1;
    goto LABEL_7;
  }
  if (v5 != 24)
  {
    char v8 = 0;
    goto LABEL_10;
  }
  [(SBDeviceUnlockAggdLogger *)self logDeviceWake];
LABEL_8:
  char v8 = [v4 isConsumable];
LABEL_10:

  return v8;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)_observeDashBoardEvents
{
  return self->_observeDashBoardEvents;
}

- (void)_setObserveDashBoardEvents:(BOOL)a3
{
  self->_observeDashBoardEvents = a3;
}

@end