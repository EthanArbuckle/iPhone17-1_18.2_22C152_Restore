@interface SBCaptureButtonViewObstructedBehavior
- (BOOL)_isAbortingForContext:(id)a3;
- (unint64_t)cameraLaunchIntentInContext:(id)a3;
- (unint64_t)coachIntentInContext:(id)a3;
- (unint64_t)identifier;
- (unint64_t)prewarmIntentInContext:(id)a3;
- (unint64_t)wakeIntentInContext:(id)a3;
@end

@implementation SBCaptureButtonViewObstructedBehavior

- (unint64_t)identifier
{
  return 5;
}

- (unint64_t)cameraLaunchIntentInContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 event];
  if (v4 == 2)
  {
    if ([v3 suppressedOnButtonDown])
    {
      unint64_t v5 = 3;
      goto LABEL_9;
    }
LABEL_7:
    unint64_t v5 = [v3 isSuppressed];
    goto LABEL_9;
  }
  if (v4 != 1)
  {
    unint64_t v5 = 0;
    goto LABEL_9;
  }
  if (([v3 shouldSuspendLaunchOnButtonDown] & 1) == 0) {
    goto LABEL_7;
  }
  unint64_t v5 = 4;
LABEL_9:

  return v5;
}

- (unint64_t)prewarmIntentInContext:(id)a3
{
  return [(SBCaptureButtonViewObstructedBehavior *)self _isAbortingForContext:a3];
}

- (unint64_t)coachIntentInContext:(id)a3
{
  if ([(SBCaptureButtonViewObstructedBehavior *)self _isAbortingForContext:a3]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (unint64_t)wakeIntentInContext:(id)a3
{
  if ([(SBCaptureButtonViewObstructedBehavior *)self _isAbortingForContext:a3]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)_isAbortingForContext:(id)a3
{
  return [(SBCaptureButtonViewObstructedBehavior *)self cameraLaunchIntentInContext:a3] != 0;
}

@end