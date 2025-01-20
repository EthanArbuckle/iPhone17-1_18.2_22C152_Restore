@interface ACMAppleConnectImplComponents
+ (id)components;
- (ACC2SVControllerProtocol)twoSVController;
- (ACMAppleConnectPreferences)preferences;
- (ACMSystemInfoProtocol)systemInfo;
- (ACMUIControllerDelegate)uiControllerDelegate;
- (ACMUIControllerProtocol)uiController;
- (BOOL)uiControllerLoaded;
- (id)createAuthenticationRequest;
- (id)createHandlerWithClass:(Class)a3 context:(id)a4;
- (id)createTicketVerificationRequest;
- (void)cleanupOnMemoryWarning;
- (void)dealloc;
- (void)setPreferences:(id)a3;
- (void)setSystemInfo:(id)a3;
- (void)setTwoSVController:(id)a3;
- (void)setUIControllerDelegate:(id)a3;
- (void)setUiController:(id)a3;
@end

@implementation ACMAppleConnectImplComponents

+ (id)components
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ACMAppleConnectImplComponents;
  return [super components];
}

- (void)dealloc
{
  [(ACMAppleConnectImplComponents *)self setPreferences:0];
  [(ACMAppleConnectImplComponents *)self setUiController:0];
  [(ACMAppleConnectImplComponents *)self setSystemInfo:0];
  [(ACFComponents *)self setCryptograph:0];
  [(ACCComponents *)self setTgtStoragePolicy:0];
  if (self->_twoSVController)
  {
    [(ACC2SVControllerProtocol *)[(ACMAppleConnectImplComponents *)self twoSVController] setDelegate:0];
    [(ACMAppleConnectImplComponents *)self setTwoSVController:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)ACMAppleConnectImplComponents;
  [(ACCComponents *)&v3 dealloc];
}

- (void)cleanupOnMemoryWarning
{
  objc_sync_enter(self);
  [(ACMAppleConnectPreferences *)self->_preferences cleanupOnMemoryWarning];

  self->_preferences = 0;
  self->_systemInfo = 0;

  objc_sync_exit(self);
}

- (ACMAppleConnectPreferences)preferences
{
  objc_sync_enter(self);
  preferences = self->_preferences;
  if (!preferences)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMAppleConnectImplComponents preferences]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImplComponents.m", 80, 0, "Creating AppleConnectPreferences instance");
    }
    preferences = +[ACMAppleConnectPreferences preferencesWithStore:](ACMAppleConnectPreferences, "preferencesWithStore:", +[ACMPreferencesCFPreferencesStore preferencesStoreWithCFPreferences]);
    self->_preferences = preferences;
  }
  objc_sync_exit(self);
  return preferences;
}

- (ACMSystemInfoProtocol)systemInfo
{
  objc_sync_enter(self);
  systemInfo = self->_systemInfo;
  if (!systemInfo)
  {
    systemInfo = (ACMSystemInfoProtocol *)objc_opt_new();
    self->_systemInfo = systemInfo;
  }
  objc_sync_exit(self);
  return systemInfo;
}

- (ACMUIControllerProtocol)uiController
{
  return 0;
}

- (ACMUIControllerDelegate)uiControllerDelegate
{
  return self->_uiControllerDelegate;
}

- (void)setUIControllerDelegate:(id)a3
{
  if (self->_uiControllerDelegate != a3)
  {
    self->_uiControllerDelegate = (ACMUIControllerDelegate *)a3;
    -[ACMUIControllerProtocol setDelegate:](self->_uiController, "setDelegate:");
  }
}

- (id)createAuthenticationRequest
{
  v2 = objc_opt_new();

  return v2;
}

- (id)createTicketVerificationRequest
{
  v2 = objc_opt_new();

  return v2;
}

- (id)createHandlerWithClass:(Class)a3 context:(id)a4
{
  v4 = (void *)[[a3 alloc] initWithContext:a4];

  return v4;
}

- (BOOL)uiControllerLoaded
{
  return 0;
}

- (void)setPreferences:(id)a3
{
}

- (ACC2SVControllerProtocol)twoSVController
{
  return self->_twoSVController;
}

- (void)setTwoSVController:(id)a3
{
}

- (void)setSystemInfo:(id)a3
{
}

- (void)setUiController:(id)a3
{
}

@end