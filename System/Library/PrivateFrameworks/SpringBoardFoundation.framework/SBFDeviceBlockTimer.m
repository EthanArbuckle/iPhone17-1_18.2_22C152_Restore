@interface SBFDeviceBlockTimer
- (BOOL)_isEnabled;
- (BOOL)isUserRequestedEraseEnabled;
- (NSString)primaryActionButtonText;
- (NSString)subtitleText;
- (NSString)timeoutText;
- (NSString)titleText;
- (NSTimer)timer;
- (SBFBlockStatusProvider)blockStatusProvider;
- (SBFDeviceBlockTimer)initWithDeviceBlockStatusProvider:(id)a3;
- (id)handler;
- (void)_clearTimer;
- (void)_scheduleTimerIfNecessaryAndUpdateState;
- (void)_setBlockStatusProvider:(id)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setTimer:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setHandler:(id)a3;
- (void)setPrimaryActionButtonText:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTimeoutText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setUserRequestedEraseEnabled:(BOOL)a3;
- (void)start;
@end

@implementation SBFDeviceBlockTimer

- (SBFDeviceBlockTimer)initWithDeviceBlockStatusProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBFDeviceBlockTimer;
  v5 = [(SBFDeviceBlockTimer *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SBFDeviceBlockTimer *)v5 _setBlockStatusProvider:v4];
    [(SBFDeviceBlockTimer *)v6 _scheduleTimerIfNecessaryAndUpdateState];
  }

  return v6;
}

- (void)dealloc
{
  [(SBFDeviceBlockTimer *)self _clearTimer];
  v3.receiver = self;
  v3.super_class = (Class)SBFDeviceBlockTimer;
  [(SBFDeviceBlockTimer *)&v3 dealloc];
}

- (void)start
{
  self->_enabled = 1;
  [(SBFDeviceBlockTimer *)self _scheduleTimerIfNecessaryAndUpdateState];
}

- (void)invalidate
{
  self->_enabled = 0;
  [(SBFDeviceBlockTimer *)self _clearTimer];
}

- (void)_clearTimer
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)_scheduleTimerIfNecessaryAndUpdateState
{
  if ([(SBFBlockStatusProvider *)self->_blockStatusProvider isPermanentlyBlocked])
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v28 = [v3 localizedStringForKey:@"CONNECT_TO_ITUNES" value:&stru_1ED879EF8 table:@"DeviceBlock"];
      double v4 = 0.0;
LABEL_6:

      id v15 = v28;
      goto LABEL_8;
    }
  }
  else
  {
    [(SBFBlockStatusProvider *)self->_blockStatusProvider timeIntervalUntilUnblockedSinceReferenceDate];
    double v6 = v5;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v8 = v6 - v7;
    if (v8 > 0.0)
    {
      double v9 = v8 / 60.0;
      double v10 = ceil(v9);
      double v4 = (v9 - (double)(uint64_t)(vcvtpd_s64_f64(v9) - 1)) * 60.0;
      id v3 = objc_alloc_init(MEMORY[0x1E4F28C00]);
      [v3 setUnitsStyle:3];
      v11 = [v3 stringFromTimeInterval:(double)(uint64_t)v10 * 60.0];
      [(SBFDeviceBlockTimer *)self setTimeoutText:v11];
      v12 = NSString;
      v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v14 = [v13 localizedStringForKey:@"TRY_AGAIN_AFTER_TIMEOUT" value:&stru_1ED879EF8 table:@"DeviceBlock"];
      objc_msgSend(v12, "stringWithFormat:", v14, v11);
      id v28 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  id v15 = 0;
  double v4 = 0.0;
LABEL_8:
  id v29 = v15;
  -[SBFDeviceBlockTimer setSubtitleText:](self, "setSubtitleText:");
  v16 = NSString;
  v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"DEVICE_BLOCKED" value:&stru_1ED879EF8 table:@"DeviceBlock"];
  v19 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  v20 = [v19 localizedProductName];
  v21 = objc_msgSend(v16, "stringWithFormat:", v18, v20);
  [(SBFDeviceBlockTimer *)self setTitleText:v21];

  [(SBFDeviceBlockTimer *)self setUserRequestedEraseEnabled:[(SBFBlockStatusProvider *)self->_blockStatusProvider isUserRequestedEraseEnabled]];
  handler = (void (**)(void))self->_handler;
  if (handler) {
    handler[2]();
  }
  [(SBFDeviceBlockTimer *)self _clearTimer];
  if (v4 > 0.0 && self->_enabled)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F1CB00]);
    v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v4];
    v25 = (NSTimer *)[v23 initWithFireDate:v24 interval:self target:sel__scheduleTimerIfNecessaryAndUpdateState selector:0 userInfo:0 repeats:0.0];
    timer = self->_timer;
    self->_timer = v25;

    v27 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v27 addTimer:self->_timer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
}

- (NSString)timeoutText
{
  return self->_timeoutText;
}

- (void)setTimeoutText:(id)a3
{
}

- (BOOL)isUserRequestedEraseEnabled
{
  return self->_userRequestedEraseEnabled;
}

- (void)setUserRequestedEraseEnabled:(BOOL)a3
{
  self->_userRequestedEraseEnabled = a3;
}

- (NSString)primaryActionButtonText
{
  return self->_primaryActionButtonText;
}

- (void)setPrimaryActionButtonText:(id)a3
{
}

- (SBFBlockStatusProvider)blockStatusProvider
{
  return self->_blockStatusProvider;
}

- (void)_setBlockStatusProvider:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)_setTimer:(id)a3
{
}

- (BOOL)_isEnabled
{
  return self->_enabled;
}

- (void)_setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_blockStatusProvider, 0);
  objc_storeStrong((id *)&self->_primaryActionButtonText, 0);
  objc_storeStrong((id *)&self->_timeoutText, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end