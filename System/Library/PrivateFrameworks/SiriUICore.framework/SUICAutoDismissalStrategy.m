@interface SUICAutoDismissalStrategy
- (BOOL)deviceSupportsFaceDetection;
- (BOOL)deviceSupportsRaiseGestureDetection;
- (BOOL)isVideoPlaying;
- (BOOL)isViewRequiringExtendedTimeoutVisible;
- (BOOL)shouldDismiss;
- (BOOL)userInteractedWithTouchIDSensor;
- (BOOL)userInteractedWithTouchScreen;
- (SUICAutoDismissalStrategy)initWithIdleTimeout:(double)a3 extendedIdleTimeout:(double)a4 deviceSupportsFaceDetection:(BOOL)a5 deviceSupportsRaiseGestureDetection:(BOOL)a6;
- (SUICAutoDismissalStrategyDelegate)delegate;
- (double)extendedIdleTimeout;
- (double)idleTimeInterval;
- (double)idleTimeout;
- (double)minimumIdleTimeInterval;
- (double)viewRequiringExtendedTimeoutStartTime;
- (int64_t)autoDismissalReason;
- (int64_t)latestDeviceMotionEvent;
- (int64_t)latestFaceAwarenessEvent;
- (void)_notifyDelegateOfAutoDismissalDecisionChangeIfNeeded;
- (void)_notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:(BOOL)a3;
- (void)setAutoDismissalReason:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLatestDeviceMotionEvent:(int64_t)a3;
- (void)setLatestFaceAwarenessEvent:(int64_t)a3;
- (void)setMinimumIdleTimeInterval:(double)a3;
- (void)setUserInteractedWithTouchIDSensor:(BOOL)a3;
- (void)setUserInteractedWithTouchScreen:(BOOL)a3;
- (void)setVideoPlaying:(BOOL)a3;
- (void)setViewRequiringExtendedTimeoutStartTime:(double)a3;
- (void)setViewRequiringExtendedTimeoutVisible:(BOOL)a3;
@end

@implementation SUICAutoDismissalStrategy

- (SUICAutoDismissalStrategy)initWithIdleTimeout:(double)a3 extendedIdleTimeout:(double)a4 deviceSupportsFaceDetection:(BOOL)a5 deviceSupportsRaiseGestureDetection:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SUICAutoDismissalStrategy;
  result = [(SUICAutoDismissalStrategy *)&v11 init];
  if (result)
  {
    result->_idleTimeout = a3;
    result->_extendedIdleTimeout = a4;
    result->_deviceSupportsFaceDetection = a5;
    result->_deviceSupportsRaiseGestureDetection = a6;
    *(_WORD *)&result->_userInteractedWithTouchScreen = 0;
    result->_viewRequiringExtendedTimeoutVisible = 0;
    *(_OWORD *)&result->_latestFaceAwarenessEvent = xmmword_1A64FBBE0;
    result->_autoDismissalReason = 0;
  }
  return result;
}

- (void)setUserInteractedWithTouchScreen:(BOOL)a3
{
  if (self->_userInteractedWithTouchScreen != a3)
  {
    self->_userInteractedWithTouchScreen = a3;
    [(SUICAutoDismissalStrategy *)self _notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:0];
  }
}

- (void)setUserInteractedWithTouchIDSensor:(BOOL)a3
{
  if (self->_userInteractedWithTouchIDSensor != a3)
  {
    self->_userInteractedWithTouchIDSensor = a3;
    [(SUICAutoDismissalStrategy *)self _notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:0];
  }
}

- (void)setLatestFaceAwarenessEvent:(int64_t)a3
{
  if (self->_latestFaceAwarenessEvent != a3)
  {
    self->_latestFaceAwarenessEvent = a3;
    [(SUICAutoDismissalStrategy *)self _notifyDelegateOfAutoDismissalDecisionChangeIfNeeded];
  }
}

- (void)setLatestDeviceMotionEvent:(int64_t)a3
{
  if (self->_latestDeviceMotionEvent != a3)
  {
    self->_latestDeviceMotionEvent = a3;
    [(SUICAutoDismissalStrategy *)self _notifyDelegateOfAutoDismissalDecisionChangeIfNeeded];
  }
}

- (void)setVideoPlaying:(BOOL)a3
{
  if (self->_videoPlaying != a3)
  {
    self->_videoPlaying = a3;
    [(SUICAutoDismissalStrategy *)self _notifyDelegateOfAutoDismissalDecisionChangeIfNeeded];
  }
}

- (void)setViewRequiringExtendedTimeoutVisible:(BOOL)a3
{
  if (self->_viewRequiringExtendedTimeoutVisible != a3)
  {
    self->_viewRequiringExtendedTimeoutVisible = a3;
    if (a3)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      self->_viewRequiringExtendedTimeoutStartTime = v4;
      [(SUICAutoDismissalStrategy *)self _notifyDelegateOfAutoDismissalDecisionChangeIfNeeded];
    }
  }
}

- (void)setViewRequiringExtendedTimeoutStartTime:(double)a3
{
  self->_viewRequiringExtendedTimeoutStartTime = a3;
}

- (void)_notifyDelegateOfAutoDismissalDecisionChangeIfNeeded
{
}

- (void)_notifyDelegateOfAutoDismissalDecisionChangeIfNeededPermanent:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SUICAutoDismissalStrategy *)self shouldDismiss];
  lastShouldDismissValue = self->_lastShouldDismissValue;
  if (!lastShouldDismissValue || v5 != [(NSNumber *)lastShouldDismissValue BOOLValue])
  {
    v7 = [NSNumber numberWithBool:v5];
    v8 = self->_lastShouldDismissValue;
    self->_lastShouldDismissValue = v7;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "autoDismissalStrategyDidChangeAutoDismissalDecision:dismissalReason:permanent:", self, -[SUICAutoDismissalStrategy autoDismissalReason](self, "autoDismissalReason"), v3);
  }
}

- (SUICAutoDismissalStrategyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUICAutoDismissalStrategyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)userInteractedWithTouchScreen
{
  return self->_userInteractedWithTouchScreen;
}

- (BOOL)userInteractedWithTouchIDSensor
{
  return self->_userInteractedWithTouchIDSensor;
}

- (int64_t)latestFaceAwarenessEvent
{
  return self->_latestFaceAwarenessEvent;
}

- (int64_t)latestDeviceMotionEvent
{
  return self->_latestDeviceMotionEvent;
}

- (BOOL)isVideoPlaying
{
  return self->_videoPlaying;
}

- (BOOL)isViewRequiringExtendedTimeoutVisible
{
  return self->_viewRequiringExtendedTimeoutVisible;
}

- (double)minimumIdleTimeInterval
{
  return self->_minimumIdleTimeInterval;
}

- (void)setMinimumIdleTimeInterval:(double)a3
{
  self->_minimumIdleTimeInterval = a3;
}

- (double)idleTimeInterval
{
  return self->_idleTimeInterval;
}

- (BOOL)shouldDismiss
{
  return self->_shouldDismiss;
}

- (int64_t)autoDismissalReason
{
  return self->_autoDismissalReason;
}

- (void)setAutoDismissalReason:(int64_t)a3
{
  self->_autoDismissalReason = a3;
}

- (double)idleTimeout
{
  return self->_idleTimeout;
}

- (double)extendedIdleTimeout
{
  return self->_extendedIdleTimeout;
}

- (BOOL)deviceSupportsFaceDetection
{
  return self->_deviceSupportsFaceDetection;
}

- (BOOL)deviceSupportsRaiseGestureDetection
{
  return self->_deviceSupportsRaiseGestureDetection;
}

- (double)viewRequiringExtendedTimeoutStartTime
{
  return self->_viewRequiringExtendedTimeoutStartTime;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_lastShouldDismissValue, 0);
}

@end