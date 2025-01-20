@interface SBCaptureButtonConsoleModeBehavior
- (unint64_t)cameraLaunchIntentInContext:(id)a3;
- (unint64_t)coachIntentInContext:(id)a3;
- (unint64_t)identifier;
- (unint64_t)prewarmIntentInContext:(id)a3;
- (unint64_t)wakeIntentInContext:(id)a3;
@end

@implementation SBCaptureButtonConsoleModeBehavior

- (unint64_t)identifier
{
  return 4;
}

- (unint64_t)prewarmIntentInContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 policy];
  int v5 = [v4 consoleModeMitigationEnabled];

  if (v5) {
    unint64_t v6 = [v3 inGameMode];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)cameraLaunchIntentInContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 policy];
  int v5 = [v4 consoleModeMitigationEnabled];

  if (v5) {
    unint64_t v6 = [v3 inGameMode];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)wakeIntentInContext:(id)a3
{
  return 0;
}

- (unint64_t)coachIntentInContext:(id)a3
{
  id v3 = a3;
  if ([v3 inGameMode] && objc_msgSend(v3, "event") == 2)
  {
    if ([v3 inGameModeStreakCount] == 1) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = 3;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

@end