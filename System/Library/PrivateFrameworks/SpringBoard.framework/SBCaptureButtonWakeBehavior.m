@interface SBCaptureButtonWakeBehavior
- (BOOL)_shouldWake:(id)a3;
- (BOOL)_withinDirectLaunchGracePeriod:(id)a3;
- (unint64_t)cameraLaunchIntentInContext:(id)a3;
- (unint64_t)coachIntentInContext:(id)a3;
- (unint64_t)identifier;
- (unint64_t)prewarmIntentInContext:(id)a3;
- (unint64_t)wakeIntentInContext:(id)a3;
@end

@implementation SBCaptureButtonWakeBehavior

- (unint64_t)identifier
{
  return 1;
}

- (unint64_t)prewarmIntentInContext:(id)a3
{
  id v3 = a3;
  if ([v3 event] == 1 && objc_msgSend(v3, "gesture") == 1 && (objc_msgSend(v3, "isScreenOn") & 1) == 0)
  {
    v6 = [v3 policy];
    unint64_t v4 = [v6 isVisionIntelligenceEnabled] ^ 1;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)cameraLaunchIntentInContext:(id)a3
{
  id v4 = a3;
  if ([v4 event] == 2 && objc_msgSend(v4, "gesture") == 1)
  {
    if ([(SBCaptureButtonWakeBehavior *)self _withinDirectLaunchGracePeriod:v4]) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = [(SBCaptureButtonWakeBehavior *)self _shouldWake:v4];
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)wakeIntentInContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 policy];
  int v6 = [v5 wakeEnabled];

  if (v6 && [v4 event] == 2) {
    unint64_t v7 = [(SBCaptureButtonWakeBehavior *)self _shouldWake:v4];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)coachIntentInContext:(id)a3
{
  return 0;
}

- (BOOL)_shouldWake:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 policy];
  int v6 = [v5 wakeEnabled];

  if (!v6) {
    goto LABEL_5;
  }
  unint64_t v7 = [v4 policy];
  v8 = [v7 wakingBacklightStates];
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "backlightState"));
  int v10 = [v8 containsObject:v9];

  if (!v10) {
    goto LABEL_5;
  }
  if ([v4 gesture] == 1
    && ![(SBCaptureButtonWakeBehavior *)self _withinDirectLaunchGracePeriod:v4])
  {
    int v11 = [v4 isVoiceOverScreenCurtainActive] ^ 1;
  }
  else
  {
LABEL_5:
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)_withinDirectLaunchGracePeriod:(id)a3
{
  id v3 = a3;
  id v4 = [v3 policy];
  int v5 = [v4 directLaunchAfterUnsuppressEnabled];

  if (v5) {
    char v6 = [v3 isWithinDirectLaunchGracePeriod];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

@end