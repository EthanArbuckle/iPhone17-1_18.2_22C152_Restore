@interface ContentProtectionTesting
+ (id)sharedInstance;
- (ContentProtectionTesting)init;
- (void)_invalidateLockTimer;
- (void)_lockTimerFired:(id)a3;
- (void)_simulateContentProtectionState:(int64_t)a3;
- (void)disableContentProtection;
- (void)toggleLockState;
@end

@implementation ContentProtectionTesting

+ (id)sharedInstance
{
  if (qword_1006993C8 != -1) {
    dispatch_once(&qword_1006993C8, &stru_1006046C8);
  }
  v2 = (void *)qword_1006993C0;

  return v2;
}

- (ContentProtectionTesting)init
{
  return 0;
}

- (void)toggleLockState
{
  uint64_t ObservedState = EFContentProtectionGetObservedState();
  if (ObservedState == 3)
  {
    [(ContentProtectionTesting *)self _simulateContentProtectionState:0];
    uint64_t ObservedState = EFContentProtectionGetObservedState();
  }
  if (ObservedState == 2)
  {
    [(ContentProtectionTesting *)self _invalidateLockTimer];
    goto LABEL_8;
  }
  if (ObservedState == 1)
  {
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  if (ObservedState) {
    return;
  }
  v4 = +[NSTimer timerWithTimeInterval:self target:"_lockTimerFired:" selector:0 userInfo:0 repeats:10.0];
  lockTimer = self->_lockTimer;
  self->_lockTimer = v4;

  v6 = +[NSRunLoop currentRunLoop];
  [v6 addTimer:self->_lockTimer forMode:NSRunLoopCommonModes];

  uint64_t v7 = 2;
LABEL_9:

  [(ContentProtectionTesting *)self _simulateContentProtectionState:v7];
}

- (void)disableContentProtection
{
  [(ContentProtectionTesting *)self _invalidateLockTimer];

  [(ContentProtectionTesting *)self _simulateContentProtectionState:3];
}

- (void)_lockTimerFired:(id)a3
{
  if (self->_lockTimer == a3)
  {
    if (EFContentProtectionGetObservedState() == 2) {
      [(ContentProtectionTesting *)self _simulateContentProtectionState:1];
    }
    [(ContentProtectionTesting *)self _invalidateLockTimer];
  }
}

- (void)_invalidateLockTimer
{
  [(NSTimer *)self->_lockTimer invalidate];
  lockTimer = self->_lockTimer;
  self->_lockTimer = 0;
}

- (void)_simulateContentProtectionState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    CFStringRef v4 = @"invalid";
  }
  else {
    CFStringRef v4 = off_1006046E8[a3];
  }
  v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = +[NSNumber numberWithInteger:a3];
    int v7 = 138412546;
    CFStringRef v8 = v4;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Simulating Content Protection state: %@ (%@)", (uint8_t *)&v7, 0x16u);
  }
  EFContentProtectionSimulateState();
}

- (void).cxx_destruct
{
}

@end