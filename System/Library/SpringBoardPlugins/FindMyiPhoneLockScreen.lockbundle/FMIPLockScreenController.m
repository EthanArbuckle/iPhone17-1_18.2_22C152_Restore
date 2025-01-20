@interface FMIPLockScreenController
- (BOOL)pluginAnimatesAppearanceTransition:(BOOL)a3;
- (BOOL)pluginHandleEvent:(int64_t)a3;
- (CoreTelephonyClient)ctClient;
- (FMIPLockScreenController)init;
- (FMIPLockScreenViewController)_mainViewController;
- (SBLockScreenPluginAgent)pluginAgent;
- (SBLockScreenPluginAppearance)pluginAppearance;
- (SBLockScreenPluginViewController)pluginViewController;
- (UIStoryboard)_mainStoryboard;
- (id)mainViewController;
- (int64_t)pluginPriority;
- (void)_addObservers;
- (void)dealloc;
- (void)operatorNameChanged:(id)a3 name:(id)a4;
- (void)pluginDidDeactivateWithContext:(id)a3;
- (void)pluginWillActivateWithContext:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setPluginAgent:(id)a3;
- (void)set_mainStoryboard:(id)a3;
- (void)set_mainViewController:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)stopAlarm;
@end

@implementation FMIPLockScreenController

- (int64_t)pluginPriority
{
  return 15000;
}

- (id)mainViewController
{
  v3 = [(FMIPLockScreenController *)self _mainViewController];

  if (!v3)
  {
    v4 = [[FMIPLockScreenViewController alloc] initWithNibName:0 bundle:0];
    [(FMIPLockScreenController *)self set_mainViewController:v4];

    v5 = [(FMIPLockScreenController *)self _mainViewController];

    if (!v5)
    {
      v6 = sub_4588();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_46B8(v6);
      }
    }
    v7 = [(FMIPLockScreenController *)self _mainViewController];
    [v7 setPluginController:self];

    v8 = sub_4588();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_4620(self, v8);
    }
  }
  v9 = [(FMIPLockScreenController *)self _mainViewController];

  return v9;
}

- (SBLockScreenPluginViewController)pluginViewController
{
  return (SBLockScreenPluginViewController *)[(FMIPLockScreenController *)self mainViewController];
}

- (BOOL)pluginAnimatesAppearanceTransition:(BOOL)a3
{
  return 0;
}

- (void)stopAlarm
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)kStopLostModeAlarmNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v4 = a4;
  v5 = sub_4588();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Received simStatusDidChange distributed notification: %@", (uint8_t *)&v6, 0xCu);
  }

  _os_activity_initiate(&dword_0, "SimStatusChangedLocalNotification", OS_ACTIVITY_FLAG_DEFAULT, &stru_82B0);
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v4 = a4;
  v5 = sub_4588();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Received operatorNameChanged distributed notification: %@", (uint8_t *)&v6, 0xCu);
  }

  _os_activity_initiate(&dword_0, "RegistrationStatusChangedNotification", OS_ACTIVITY_FLAG_DEFAULT, &stru_82D0);
}

- (void)_addObservers
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)kLostModeChangedNotification;

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_190C, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (FMIPLockScreenController)init
{
  v8.receiver = self;
  v8.super_class = (Class)FMIPLockScreenController;
  v2 = [(FMIPLockScreenController *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)CoreTelephonyClient);
    [(FMIPLockScreenController *)v2 setCtClient:v3];

    CFStringRef v4 = [(FMIPLockScreenController *)v2 ctClient];
    [v4 setDelegate:v2];

    v5 = sub_4588();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "init - setting up notifications", v7, 2u);
    }

    [(FMIPLockScreenController *)v2 _addObservers];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = sub_4588();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "dealloc - removing up notifications", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kLostModeChangedNotification, 0);
  v5 = sub_4588();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Destroying myself", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)FMIPLockScreenController;
  [(FMIPLockScreenController *)&v6 dealloc];
}

- (void)pluginWillActivateWithContext:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = sub_4588();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "TRACE: pluginWillActivateWithContext: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)pluginDidDeactivateWithContext:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = sub_4588();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "TRACE: pluginDidDeactivateWithContext: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (SBLockScreenPluginAppearance)pluginAppearance
{
  id v2 = objc_alloc_init((Class)SBLockScreenPluginMutableAppearanceContext);
  id v3 = +[FMDFMIPManager sharedInstance];
  CFStringRef v4 = [v3 lostModeInfo];

  int v5 = [v4 message];
  if ([v5 length])
  {

    uint64_t v6 = 1;
    uint64_t v7 = 2;
    BOOL v8 = 1;
  }
  else
  {
    v9 = [v4 phoneNumber];
    id v10 = [v9 length];

    BOOL v8 = v10 != 0;
    if (v10) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    uint64_t v7 = 2 * (v10 != 0);
  }
  [v2 setPresentationStyle:v6];
  [v2 setBackgroundStyle:v7];
  [v2 setNotificationBehavior:1];
  if ([v4 lostModeType] == (char *)&dword_0 + 3
    || [v4 lostModeType] == (char *)&dword_4 + 1)
  {
    uint64_t v11 = 510;
  }
  else
  {
    uint64_t v11 = 502;
  }
  [v2 setRestrictedCapabilities:v11];
  v12 = sub_4588();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_46FC(v8, v12);
  }

  return (SBLockScreenPluginAppearance *)v2;
}

- (BOOL)pluginHandleEvent:(int64_t)a3
{
  int v5 = sub_4588();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "FMIPLockScreenController: VolumeDownButtonPressed", v8, 2u);
  }

  BOOL v6 = 1;
  if ((unint64_t)a3 <= 8)
  {
    if (((1 << a3) & 0x1E0) == 0)
    {
      if (((1 << a3) & 0xD) != 0) {
        return 0;
      }
      BOOL v6 = 0;
    }
    [(FMIPLockScreenController *)self stopAlarm];
  }
  return v6;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (SBLockScreenPluginAgent)pluginAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->pluginAgent);

  return (SBLockScreenPluginAgent *)WeakRetained;
}

- (void)setPluginAgent:(id)a3
{
}

- (UIStoryboard)_mainStoryboard
{
  return self->__mainStoryboard;
}

- (void)set_mainStoryboard:(id)a3
{
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (FMIPLockScreenViewController)_mainViewController
{
  return self->__mainViewController;
}

- (void)set_mainViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mainViewController, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->__mainStoryboard, 0);

  objc_destroyWeak((id *)&self->pluginAgent);
}

@end