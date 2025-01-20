@interface SBCaptureButtonLaunchBehavior
- (unint64_t)cameraLaunchIntentInContext:(id)a3;
- (unint64_t)coachIntentInContext:(id)a3;
- (unint64_t)identifier;
- (unint64_t)prewarmIntentInContext:(id)a3;
- (unint64_t)wakeIntentInContext:(id)a3;
@end

@implementation SBCaptureButtonLaunchBehavior

- (unint64_t)identifier
{
  return 0;
}

- (unint64_t)cameraLaunchIntentInContext:(id)a3
{
  id v3 = a3;
  if ([v3 event] != 2) {
    goto LABEL_11;
  }
  uint64_t v4 = [v3 gesture];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4 == 3)
    {
      v5 = [v3 policy];
      if ([v5 isVisionIntelligenceEnabled]) {
        unint64_t v6 = 5;
      }
      else {
        unint64_t v6 = 1;
      }
      goto LABEL_10;
    }
LABEL_11:
    unint64_t v6 = 0;
    goto LABEL_12;
  }
  v5 = [v3 captureAppBundleID];
  if (v5) {
    unint64_t v6 = 2;
  }
  else {
    unint64_t v6 = 1;
  }
LABEL_10:

LABEL_12:
  return v6;
}

- (unint64_t)prewarmIntentInContext:(id)a3
{
  id v3 = a3;
  if ([v3 event] != 1) {
    goto LABEL_9;
  }
  uint64_t v4 = [v3 gesture];
  if (v4 == 3)
  {
LABEL_10:
    v7 = [v3 policy];
    if ([v7 isVisionIntelligenceEnabled]) {
      unint64_t v6 = 3;
    }
    else {
      unint64_t v6 = 1;
    }

    goto LABEL_20;
  }
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      v5 = [v3 captureAppBundleID];

      if (v5)
      {
        if ([v3 isPrewarmLockoutActive]) {
          unint64_t v6 = 1;
        }
        else {
          unint64_t v6 = 2;
        }
        goto LABEL_20;
      }
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v6 = 0;
    goto LABEL_20;
  }
  if ([v3 isPrewarmLockoutActive])
  {
    unint64_t v6 = 1;
  }
  else
  {
    v8 = [v3 captureAppBundleID];
    if (v8) {
      unint64_t v6 = 2;
    }
    else {
      unint64_t v6 = 1;
    }
  }
LABEL_20:

  return v6;
}

- (unint64_t)coachIntentInContext:(id)a3
{
  return 0;
}

- (unint64_t)wakeIntentInContext:(id)a3
{
  return 0;
}

@end