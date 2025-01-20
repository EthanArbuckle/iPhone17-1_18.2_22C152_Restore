@interface BKDisplayBrightnessUpdateTransactionManager
+ (BKDisplayBrightnessUpdateTransactionManager)sharedInstance;
- (float)systemDisplayBrightness;
- (id)_initWithBrightnessController:(id)a3;
- (void)_beginUpdateTransaction:(id)a3;
- (void)_endUpdateTransaction:(id)a3;
- (void)_lock_commitDisplayBrightness;
- (void)restoreSystemDisplayBrightness;
- (void)setDisplayBrightness:(float)a3 permanently:(BOOL)a4;
- (void)synchronizeALSPreferencesAndSystemDisplayBrightness;
@end

@implementation BKDisplayBrightnessUpdateTransactionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessController, 0);

  objc_storeStrong((id *)&self->_suppressBrightnessNotifications, 0);
}

- (void)_lock_commitDisplayBrightness
{
  if (self->_commitPending)
  {
    [(BKDisplayBrightnessController *)self->_brightnessController brightnessLevel];
    float v4 = v3;
    -[BKDisplayBrightnessController setBrightnessLevel:reason:options:](self->_brightnessController, "setBrightnessLevel:reason:options:", @"commitDisplayBrightness", 7);
    if (vabds_f32(self->_systemDisplayBrightness, v4) < 0.0001)
    {
      sub_100082D3C();
      v5 = +[BKSDefaults externalDefaults];
      v6 = [v5 springBoardDefaults];
      *(float *)&double v7 = v4;
      [v6 setBrightness:v7];
    }
    self->_commitPending = 0;
  }
}

- (void)_endUpdateTransaction:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  --self->_numPendingTransactions;
  v6 = BKLogBacklight();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int numPendingTransactions = self->_numPendingTransactions;
    int v14 = 138543618;
    id v15 = v5;
    __int16 v16 = 1024;
    LODWORD(v17) = numPendingTransactions;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ending transaction: %{public}@; %d remain",
      (uint8_t *)&v14,
      0x12u);
  }

  int v8 = self->_numPendingTransactions;
  if (v8 < 0)
  {
    v10 = +[NSString stringWithFormat:@"There shouldn't be a negative number of pending transactions"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(a2);
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      int v14 = 138544642;
      id v15 = v11;
      __int16 v16 = 2114;
      v17 = v13;
      __int16 v18 = 2048;
      v19 = self;
      __int16 v20 = 2114;
      CFStringRef v21 = @"BKDisplayBrightnessUpdateTransactionManager.m";
      __int16 v22 = 1024;
      int v23 = 292;
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v14, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100080DE8);
  }
  if (!v8)
  {
    [(BSInvalidatable *)self->_suppressBrightnessNotifications invalidate];
    suppressBrightnessNotifications = self->_suppressBrightnessNotifications;
    self->_suppressBrightnessNotifications = 0;

    [(BKDisplayBrightnessUpdateTransactionManager *)self _lock_commitDisplayBrightness];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_beginUpdateTransaction:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  int numPendingTransactions = self->_numPendingTransactions;
  self->_int numPendingTransactions = numPendingTransactions + 1;
  if (!numPendingTransactions)
  {
    v6 = [(BKDisplayBrightnessController *)self->_brightnessController suppressBrightnessNotificationsForReason:@"update-transaction"];
    suppressBrightnessNotifications = self->_suppressBrightnessNotifications;
    self->_suppressBrightnessNotifications = v6;
  }
  int v8 = BKLogBacklight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = self->_numPendingTransactions;
    int v10 = 138543618;
    id v11 = v4;
    __int16 v12 = 1024;
    int v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Begin transaction: %{public}@; %d now exist",
      (uint8_t *)&v10,
      0x12u);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)restoreSystemDisplayBrightness
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_shouldRestoreSystemBrightness)
  {
    float systemDisplayBrightness = self->_systemDisplayBrightness;
    if (systemDisplayBrightness >= 0.0)
    {
      self->_shouldRestoreSystemBrightness = 0;
      brightnessController = self->_brightnessController;
      double v7 = NSStringFromSelector(a2);
      *(float *)&double v8 = systemDisplayBrightness;
      [(BKDisplayBrightnessController *)brightnessController setBrightnessLevel:v7 reason:10 options:v8];

      sub_100082DF8();
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (float)systemDisplayBrightness
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  float systemDisplayBrightness = self->_systemDisplayBrightness;
  os_unfair_lock_unlock(p_lock);
  return systemDisplayBrightness;
}

- (void)setDisplayBrightness:(float)a3 permanently:(BOOL)a4
{
  BOOL v4 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  int numPendingTransactions = self->_numPendingTransactions;
  if (numPendingTransactions) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 3;
  }
  if (v4) {
    CFStringRef v11 = @"setDisplayBrightness (permanent)";
  }
  else {
    CFStringRef v11 = @"setDisplayBrightness (transient)";
  }
  *(float *)&double v8 = a3;
  [(BKDisplayBrightnessController *)self->_brightnessController setBrightnessLevel:v11 reason:v10 options:v8];
  if (v4 || self->_systemDisplayBrightness < 0.0)
  {
    self->_float systemDisplayBrightness = a3;
    if (numPendingTransactions)
    {
LABEL_10:
      self->_commitPending = 1;
      goto LABEL_13;
    }
  }
  else
  {
    self->_shouldRestoreSystemBrightness = 1;
    if (numPendingTransactions) {
      goto LABEL_10;
    }
  }
  [(BKDisplayBrightnessUpdateTransactionManager *)self _lock_commitDisplayBrightness];
LABEL_13:

  os_unfair_lock_unlock(p_lock);
}

- (void)synchronizeALSPreferencesAndSystemDisplayBrightness
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  *(float *)&double v4 = self->_systemDisplayBrightness;
  [(BKDisplayBrightnessController *)self->_brightnessController setBrightnessLevel:@"synchronizeALSPreferencesAndDisplayBrightness" reason:2 options:v4];
  if (sub_100082DF8())
  {
    [(BKDisplayBrightnessController *)self->_brightnessController brightnessLevel];
    self->_float systemDisplayBrightness = v5;
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)_initWithBrightnessController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKDisplayBrightnessUpdateTransactionManager;
  v6 = [(BKDisplayBrightnessUpdateTransactionManager *)&v12 init];
  double v7 = v6;
  if (v6)
  {
    *(void *)&v6->_lock._os_unfair_lock_opaque = 0;
    v6->_commitPending = 0;
    double v8 = +[BKSDefaults externalDefaults];
    int v9 = [v8 springBoardDefaults];
    [v9 brightness];
    v7->_float systemDisplayBrightness = v10;

    objc_storeStrong((id *)&v7->_brightnessController, a3);
  }

  return v7;
}

+ (BKDisplayBrightnessUpdateTransactionManager)sharedInstance
{
  if (qword_1001230E8 != -1) {
    dispatch_once(&qword_1001230E8, &stru_1000F81B8);
  }
  v2 = (void *)qword_1001230E0;

  return (BKDisplayBrightnessUpdateTransactionManager *)v2;
}

@end