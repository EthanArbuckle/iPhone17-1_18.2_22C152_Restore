@interface SBCaptureButtonDeviceStationaryBehavior
- (BOOL)_enabledInContext:(id)a3;
- (BOOL)_isWithinDebouncePeriod:(id)a3;
- (unint64_t)cameraLaunchIntentInContext:(id)a3;
- (unint64_t)coachIntentInContext:(id)a3;
- (unint64_t)identifier;
- (unint64_t)prewarmIntentInContext:(id)a3;
- (unint64_t)wakeIntentInContext:(id)a3;
@end

@implementation SBCaptureButtonDeviceStationaryBehavior

- (unint64_t)identifier
{
  return 2;
}

- (unint64_t)prewarmIntentInContext:(id)a3
{
  return 0;
}

- (unint64_t)cameraLaunchIntentInContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBCaptureButtonDeviceStationaryBehavior *)self _enabledInContext:v4]
    && ![(SBCaptureButtonDeviceStationaryBehavior *)self _isWithinDebouncePeriod:v4]
    && [v4 stationaryState] == 1;

  return v5;
}

- (unint64_t)wakeIntentInContext:(id)a3
{
  return 2
       * ([(SBCaptureButtonDeviceStationaryBehavior *)self cameraLaunchIntentInContext:a3] == 1);
}

- (unint64_t)coachIntentInContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBCaptureButtonDeviceStationaryBehavior *)self cameraLaunchIntentInContext:v4] == 1
    && [v4 event] == 2;

  return v5;
}

- (BOOL)_isWithinDebouncePeriod:(id)a3
{
  id v3 = a3;
  [v3 timeSinceLastStationarySquelch];
  double v5 = v4;
  v6 = [v3 policy];

  [v6 deviceStationaryDetectionStationaryDebounceInterval];
  LOBYTE(v3) = v5 < v7;

  return (char)v3;
}

- (BOOL)_enabledInContext:(id)a3
{
  id v3 = a3;
  if ([v3 uiLocked])
  {
    char v4 = 1;
  }
  else
  {
    double v5 = [v3 policy];
    char v4 = [v5 deviceStationaryDetectionEnabledWhenUnlocked];
  }
  BOOL v6 = [v3 gesture] == 1 || objc_msgSend(v3, "gesture") == 3;
  double v7 = [v3 policy];
  int v8 = [v7 deviceStationaryDetectionEnabled];

  if (v8) {
    BOOL v9 = v6 & v4;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

@end