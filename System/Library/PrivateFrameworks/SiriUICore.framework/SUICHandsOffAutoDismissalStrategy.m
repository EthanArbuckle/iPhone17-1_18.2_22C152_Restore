@interface SUICHandsOffAutoDismissalStrategy
- (BOOL)shouldDismiss;
- (double)idleTimeInterval;
@end

@implementation SUICHandsOffAutoDismissalStrategy

- (double)idleTimeInterval
{
  [(SUICAutoDismissalStrategy *)self minimumIdleTimeInterval];
  double v4 = v3;
  if ([(SUICAutoDismissalStrategy *)self isViewRequiringExtendedTimeoutVisible]) {
    [(SUICAutoDismissalStrategy *)self extendedIdleTimeout];
  }
  else {
    [(SUICAutoDismissalStrategy *)self idleTimeout];
  }
  if (v4 >= result) {
    return v4;
  }
  return result;
}

- (BOOL)shouldDismiss
{
  if ([(SUICAutoDismissalStrategy *)self isVideoPlaying]
    || [(SUICAutoDismissalStrategy *)self userInteractedWithTouchScreen]
    || [(SUICAutoDismissalStrategy *)self userInteractedWithTouchIDSensor]
    || ![(SUICAutoDismissalStrategy *)self deviceSupportsFaceDetection]
    && [(SUICAutoDismissalStrategy *)self deviceSupportsRaiseGestureDetection]
    && [(SUICAutoDismissalStrategy *)self latestDeviceMotionEvent] == 1
    || [(SUICAutoDismissalStrategy *)self deviceSupportsFaceDetection]
    && [(SUICAutoDismissalStrategy *)self latestFaceAwarenessEvent] == 1)
  {
    uint64_t v3 = 0;
    BOOL v4 = 0;
  }
  else if ([(SUICAutoDismissalStrategy *)self isViewRequiringExtendedTimeoutVisible])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = v6;
    [(SUICAutoDismissalStrategy *)self viewRequiringExtendedTimeoutStartTime];
    double v9 = v7 - v8;
    [(SUICAutoDismissalStrategy *)self extendedIdleTimeout];
    BOOL v4 = v9 > v10;
    uint64_t v3 = 4 * (v9 > v10);
  }
  else
  {
    BOOL v4 = 1;
    uint64_t v3 = 3;
  }
  [(SUICAutoDismissalStrategy *)self setAutoDismissalReason:v3];
  return v4;
}

@end