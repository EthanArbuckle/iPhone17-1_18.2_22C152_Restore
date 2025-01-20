@interface SUSUIBaseAlertItem
- (BOOL)allowInSetup;
- (BOOL)allowLockScreenDismissal;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)allowNoButton;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)isUILocked;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowCountdown;
- (BOOL)shouldShowInLockScreen;
- (BOOL)showButtonsOnLockScreen;
- (BOOL)undimsScreen;
- (NSArray)allowedApps;
- (NSDictionary)extensionDictionary;
- (NSString)contentExtensionID;
- (SUSUIBaseAlertItem)init;
- (id)buildAlertItemDefinition;
- (id)buttons;
- (id)message;
- (id)title;
- (void)_setPresentationManager:(id)a3;
- (void)dismissAlert;
- (void)setIsUILocked:(BOOL)a3;
- (void)updateAlert;
- (void)willPresentAlert;
@end

@implementation SUSUIBaseAlertItem

- (SUSUIBaseAlertItem)init
{
  SEL v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSUIBaseAlertItem;
  v6 = [(SUSUIBaseAlertItem *)&v7 init];
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    v2 = objc_alloc_init(SUSUIAlertItemDefinition);
    alertItemDefinition = v9->_alertItemDefinition;
    v9->_alertItemDefinition = v2;

    v9->_isUILocked = 0;
  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (id)buildAlertItemDefinition
{
  alertItemDefinition = self->_alertItemDefinition;
  id v5 = [(SUSUIBaseAlertItem *)self title];
  -[SUSUIAlertItemDefinition setTitle:](alertItemDefinition, "setTitle:");

  v6 = self->_alertItemDefinition;
  id v7 = [(SUSUIBaseAlertItem *)self message];
  -[SUSUIAlertItemDefinition setMessage:](v6, "setMessage:");

  SEL v8 = self->_alertItemDefinition;
  id v9 = [(SUSUIBaseAlertItem *)self buttons];
  -[SUSUIAlertItemDefinition setButtons:](v8, "setButtons:");

  v2 = self->_alertItemDefinition;

  return v2;
}

- (id)title
{
  return 0;
}

- (id)message
{
  return 0;
}

- (id)buttons
{
  return 0;
}

- (NSString)contentExtensionID
{
  return 0;
}

- (NSDictionary)extensionDictionary
{
  return 0;
}

- (void)willPresentAlert
{
  oslog[2] = &self->super;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)SUSUILog();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    os_log_type_t v4 = type;
    v2 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v2);
    v6 = v5;
    sub_8120((uint64_t)v9, (uint64_t)v6);
    _os_log_impl(&def_46F0, log, v4, "[%{public}@] willPresentAlert", v9, 0xCu);

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)dismissAlert
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)SUSUILog();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v8[0];
    os_log_type_t type = v7;
    v2 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v2);
    v6 = v5;
    sub_8120((uint64_t)v10, (uint64_t)v6);
    _os_log_impl(&def_46F0, log, type, "[%{public}@] Dismissing", v10, 0xCu);

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong(v8, 0);
  [(SUSUIAlertPresentationManager *)v9->_presentationManager _noteAlertDeactivated:v9];
}

- (void)updateAlert
{
}

- (BOOL)shouldShowCountdown
{
  return 0;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)reappearsAfterLock
{
  return 0;
}

- (BOOL)reappearsAfterUnlock
{
  return 0;
}

- (BOOL)forcesModalAlertAppearance
{
  return 0;
}

- (BOOL)allowNoButton
{
  return 0;
}

- (BOOL)showButtonsOnLockScreen
{
  return 0;
}

- (BOOL)allowInSetup
{
  return 0;
}

- (BOOL)undimsScreen
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 1;
}

- (BOOL)allowMenuButtonDismissal
{
  return 1;
}

- (NSArray)allowedApps
{
  return 0;
}

- (void)_setPresentationManager:(id)a3
{
  os_log_type_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_presentationManager, location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)isUILocked
{
  return self->_isUILocked;
}

- (void)setIsUILocked:(BOOL)a3
{
  self->_isUILocked = a3;
}

- (void).cxx_destruct
{
}

@end