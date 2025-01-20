@interface CCDPauseStateSolver
- (BOOL)isUserPauseStored;
- (BOOL)resolvePauseState;
- (CCDPauseStateSolver)init;
- (void)dealloc;
- (void)incomingCallDeclinedStatusUpdated:(BOOL)a3;
- (void)incomingCallStatusUpdated:(BOOL)a3;
- (void)pauseForEvent:(int64_t)a3;
- (void)resumeForEvent:(int64_t)a3;
- (void)saveUserPauseState:(BOOL)a3;
- (void)sideButtonPressed;
- (void)sideButtonReleased;
@end

@implementation CCDPauseStateSolver

- (CCDPauseStateSolver)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCDPauseStateSolver;
  result = [(CCDPauseStateSolver *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  [(CCDPauseStateSolver *)self saveUserPauseState:0];
  v3.receiver = self;
  v3.super_class = (Class)CCDPauseStateSolver;
  [(CCDPauseStateSolver *)&v3 dealloc];
}

- (void)incomingCallStatusUpdated:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_incomingCall = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)incomingCallDeclinedStatusUpdated:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_incomingCallDeclined = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)pauseForEvent:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
  {
    uint64_t v5 = qword_1000123E0[a3];
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    *((unsigned char *)&self->super.isa + v5) = 1;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)resumeForEvent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3) {
      return;
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    self->_pauseButtonPressed = 0;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
  }
  self->_pauseForInactiveShield = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)saveUserPauseState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Saving user pause %d", (uint8_t *)&v8, 0x12u);
  }

  v6 = self;
  objc_sync_enter(v6);
  v7 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v3) {
    v7 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"com.apple.continuitycapture.userPressedPause", *v7, @"com.apple.cameracapture");
  CFPreferencesAppSynchronize(@"com.apple.cameracapture");
  objc_sync_exit(v6);
}

- (BOOL)isUserPauseStored
{
  v2 = self;
  objc_sync_enter(v2);
  CFBooleanRef v3 = (CFBooleanRef)CFPreferencesCopyAppValue(@"com.apple.continuitycapture.userPressedPause", @"com.apple.cameracapture");
  if (v3)
  {
    BOOL v4 = v3 == kCFBooleanTrue;
    CFRelease(v3);
  }
  else
  {
    BOOL v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)sideButtonPressed
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_sideButtonPressed = 1;
  self->_pauseForInactiveShield = 0;
  os_unfair_lock_unlock(p_lock);

  [(CCDPauseStateSolver *)self saveUserPauseState:0];
}

- (void)sideButtonReleased
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_sideButtonPressed = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)resolvePauseState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL sideButtonPressed = self->_sideButtonPressed;
  BOOL pauseButtonPressed = self->_pauseButtonPressed;
  BOOL pauseForInactiveShield = self->_pauseForInactiveShield;
  BOOL incomingCallDeclined = self->_incomingCallDeclined;
  BOOL incomingCall = self->_incomingCall;
  os_unfair_lock_unlock(p_lock);
  v9 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136316418;
    v15 = "-[CCDPauseStateSolver resolvePauseState]";
    __int16 v16 = 1024;
    BOOL v17 = sideButtonPressed;
    __int16 v18 = 1024;
    BOOL v19 = pauseButtonPressed;
    __int16 v20 = 1024;
    BOOL v21 = pauseForInactiveShield;
    __int16 v22 = 1024;
    BOOL v23 = incomingCallDeclined;
    __int16 v24 = 1024;
    BOOL v25 = incomingCall;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s _sideButtonPressed=%d, _pauseButtonPressed=%d, _pauseForInactiveShield=%d, _incomingCallDeclined=%d, _incomingCall=%d", (uint8_t *)&v14, 0x2Au);
  }

  if (!sideButtonPressed)
  {
    int v11 = pauseForInactiveShield || pauseButtonPressed;
    if (!incomingCallDeclined || v11)
    {
      BOOL v12 = v11 != 0;
      if (!v11 || pauseButtonPressed) {
        goto LABEL_10;
      }
    }
    else if (!incomingCall)
    {
      goto LABEL_9;
    }
LABEL_13:
    LOBYTE(v12) = 1;
    return v12;
  }
  if (incomingCall) {
    goto LABEL_13;
  }
  __int16 v10 = +[CCDShieldUILifeCycleManager sharedInstance];
  [v10 bringShieldUIProcessToForegroundIfApplicable];

LABEL_9:
  BOOL v12 = 0;
LABEL_10:
  [(CCDPauseStateSolver *)self saveUserPauseState:v12];
  return v12;
}

@end