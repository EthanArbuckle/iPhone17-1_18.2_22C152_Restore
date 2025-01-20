@interface RPStatusBarAssertion
- (BOOL)broadcasting;
- (BOOL)microphoneEnabled;
- (BOOL)paused;
- (NSDate)timerPauseDate;
- (NSDate)timerStartDate;
- (NSString)broadcastServiceName;
- (NSTimer)timer;
- (RPStatusBarAssertionDelegate)assertionDelegate;
- (SBSStatusBarStyleOverridesAssertion)assertion;
- (SBSStatusBarStyleOverridesCoordinator)coordinator;
- (SBSStatusBarStyleOverridesCoordinatorDelegate)delegate;
- (double)totalPausedTime;
- (id)rpLocalizedStatusStringForPaused:(BOOL)a3;
- (id)stringWithTimeInterval:(double)a3;
- (void)acquireAssertionWithPid:(int)a3;
- (void)acquireAssertionWithPidWaitForCompletion:(int)a3;
- (void)invalidateStatusBar;
- (void)pauseSession;
- (void)resumeSession;
- (void)setAssertion:(id)a3;
- (void)setAssertionDelegate:(id)a3;
- (void)setBroadcastServiceName:(id)a3;
- (void)setBroadcasting:(BOOL)a3;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTimer:(id)a3;
- (void)setTimerPauseDate:(id)a3;
- (void)setTimerStartDate:(id)a3;
- (void)setTotalPausedTime:(double)a3;
- (void)showStatusBarWithPid:(int)a3;
- (void)startRepeatingTimer;
- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4;
- (void)updateDelegateRecordingTimer:(id)a3;
@end

@implementation RPStatusBarAssertion

- (void)acquireAssertionWithPidWaitForCompletion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = (SBSStatusBarStyleOverridesAssertion *)[objc_alloc((Class)SBSStatusBarStyleOverridesAssertion) initWithStatusBarStyleOverrides:0x100000 forPID:v3 exclusive:1 showsWhenForeground:0];
  assertion = self->_assertion;
  self->_assertion = v6;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_1000177F0;
  v14[4] = sub_100017800;
  v15 = self;
  v8 = self->_assertion;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100017808;
  v11[3] = &unk_100085568;
  v13 = v14;
  v9 = v5;
  v12 = v9;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000178C8;
  v10[3] = &unk_100085590;
  v10[4] = v14;
  [(SBSStatusBarStyleOverridesAssertion *)v8 acquireWithHandler:v11 invalidationHandler:v10];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(v14, 8);
}

- (void)acquireAssertionWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[RPStatusBarAssertion acquireAssertionWithPidWaitForCompletion:](self, "acquireAssertionWithPidWaitForCompletion:");
  if (!self->_assertion)
  {
    [(RPStatusBarAssertion *)self acquireAssertionWithPidWaitForCompletion:v3];
  }
}

- (void)showStatusBarWithPid:(int)a3
{
  [(RPStatusBarAssertion *)self acquireAssertionWithPid:*(void *)&a3];
  if (self->_assertion)
  {
    v4 = (SBSStatusBarStyleOverridesCoordinator *)objc_alloc_init((Class)SBSStatusBarStyleOverridesCoordinator);
    coordinator = self->_coordinator;
    self->_coordinator = v4;

    v6 = [(RPStatusBarAssertion *)self delegate];
    [(SBSStatusBarStyleOverridesCoordinator *)self->_coordinator setDelegate:v6];

    [(SBSStatusBarStyleOverridesCoordinator *)self->_coordinator setRegisteredStyleOverrides:0x100000 reply:&stru_1000855B0];
    [(RPStatusBarAssertion *)self startRepeatingTimer];
  }
}

- (void)startRepeatingTimer
{
  self->_totalPausedTime = 0.0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017AE4;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)invalidateStatusBar
{
  if (self->_assertion)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: double height status bar assertion released", v6, 2u);
    }
    [(SBSStatusBarStyleOverridesAssertion *)self->_assertion invalidate];
    assertion = self->_assertion;
    self->_assertion = 0;

    [(SBSStatusBarStyleOverridesCoordinator *)self->_coordinator setRegisteredStyleOverrides:0 reply:&stru_1000855D0];
    coordinator = self->_coordinator;
    self->_coordinator = 0;

    [(NSTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;
  }
  self->_totalPausedTime = 0.0;
}

- (id)stringWithTimeInterval:(double)a3
{
  id v4 = objc_alloc_init((Class)NSDateComponentsFormatter);
  [v4 setUnitsStyle:0];
  [v4 setIncludesApproximationPhrase:0];
  [v4 setIncludesTimeRemainingPhrase:0];
  [v4 setMaximumUnitCount:2];
  if (a3 >= 60.0)
  {
    uint64_t v5 = 240;
  }
  else
  {
    [v4 setZeroFormattingBehavior:0x10000];
    uint64_t v5 = 192;
  }
  [v4 setAllowedUnits:v5];
  v6 = [v4 stringFromTimeInterval:a3];

  return v6;
}

- (id)rpLocalizedStatusStringForPaused:(BOOL)a3
{
  if (self->_broadcasting)
  {
    if (a3) {
      CFStringRef v4 = @"BROADCASTING_PAUSED_STATUS_BAR_FORMAT";
    }
    else {
      CFStringRef v4 = @"BROADCASTING_STATUS_BAR_FORMAT";
    }
    v6 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v4];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, self->_broadcastServiceName);
  }
  else
  {
    if (a3) {
      CFStringRef v5 = @"RECORDING_PAUSED_STATUS_BAR";
    }
    else {
      CFStringRef v5 = @"RECORDING_STATUS_BAR";
    }
    v7 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v5];
  }

  return v7;
}

- (void)updateDelegateRecordingTimer:(id)a3
{
  CFStringRef v4 = +[NSDate date];
  [v4 timeIntervalSinceDate:self->_timerStartDate];
  double v6 = v5 - self->_totalPausedTime;

  assertionDelegate = self->_assertionDelegate;
  id v8 = [(RPStatusBarAssertion *)self stringWithTimeInterval:v6];
  [(RPStatusBarAssertionDelegate *)assertionDelegate timerDidUpdate:v8];
}

- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = [a4 code];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: coordinator registartion invalidated with error %li", (uint8_t *)&v5, 0xCu);
  }
}

- (void)pauseSession
{
  self->_timerPauseDate = +[NSDate date];

  _objc_release_x1();
}

- (void)resumeSession
{
  double totalPausedTime = self->_totalPausedTime;
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceDate:self->_timerPauseDate];
  self->_double totalPausedTime = totalPausedTime + v4;
}

- (BOOL)microphoneEnabled
{
  return self->_microphoneEnabled;
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  self->_microphoneEnabled = a3;
}

- (BOOL)broadcasting
{
  return self->_broadcasting;
}

- (void)setBroadcasting:(BOOL)a3
{
  self->_broadcasting = a3;
}

- (NSString)broadcastServiceName
{
  return self->_broadcastServiceName;
}

- (void)setBroadcastServiceName:(id)a3
{
}

- (SBSStatusBarStyleOverridesCoordinatorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (RPStatusBarAssertionDelegate)assertionDelegate
{
  return self->_assertionDelegate;
}

- (void)setAssertionDelegate:(id)a3
{
}

- (SBSStatusBarStyleOverridesAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (SBSStatusBarStyleOverridesCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSDate)timerStartDate
{
  return self->_timerStartDate;
}

- (void)setTimerStartDate:(id)a3
{
}

- (double)totalPausedTime
{
  return self->_totalPausedTime;
}

- (void)setTotalPausedTime:(double)a3
{
  self->_double totalPausedTime = a3;
}

- (NSDate)timerPauseDate
{
  return self->_timerPauseDate;
}

- (void)setTimerPauseDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerPauseDate, 0);
  objc_storeStrong((id *)&self->_timerStartDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_assertionDelegate, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_broadcastServiceName, 0);
}

@end