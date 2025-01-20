@interface ACMExternalAppleConnectImplComponents
+ (id)components;
- (BOOL)uiControllerLoaded;
- (id)createAppleConnectImpl;
- (id)createAppleConnectImplWithMasterObject:(id)a3;
- (id)createAuthenticationRequest;
- (id)createHandlerWithClass:(Class)a3 context:(id)a4;
- (id)preferences;
- (id)twoSVController;
- (id)uiController;
- (void)unloadUIController;
@end

@implementation ACMExternalAppleConnectImplComponents

+ (id)components
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ACMExternalAppleConnectImplComponents;
  return [super components];
}

- (id)twoSVController
{
  objc_sync_enter(self);
  twoSVController = self->super._twoSVController;
  if (!twoSVController)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImplComponents twoSVController]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImplComponents.m", 41, 0, "Creating 2SV Controller instance");
    }
    twoSVController = (ACC2SVControllerProtocol *)objc_opt_new();
    self->super._twoSVController = twoSVController;
  }
  objc_sync_exit(self);
  return twoSVController;
}

- (id)preferences
{
  objc_sync_enter(self);
  preferences = (ACMExternalAppleConnectPreferences *)self->super._preferences;
  if (!preferences)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImplComponents preferences]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImplComponents.m", 54, 0, "Creating External AppleConnect Preferences instance");
    }
    preferences = +[ACMAppleConnectPreferences preferencesWithStore:](ACMExternalAppleConnectPreferences, "preferencesWithStore:", +[ACMPreferencesCFPreferencesStore preferencesStoreWithCFPreferences]);
    self->super._preferences = &preferences->super;
  }
  objc_sync_exit(self);
  return preferences;
}

- (id)uiController
{
  objc_sync_enter(self);
  uiController = self->super._uiController;
  if (!uiController)
  {
    [(ACMSystemInfoProtocol *)[(ACMAppleConnectImplComponents *)self systemInfo] isRunningOnModernMobileSystem];
    objc_opt_class();
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImplComponents uiController]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImplComponents.m", 78, 0, "Creating External UI Controller");
    }
    self->super._uiController = (ACMUIControllerProtocol *)objc_opt_new();
    [(ACMUIControllerProtocol *)self->super._uiController setDelegate:[(ACMAppleConnectImplComponents *)self uiControllerDelegate]];
    uiController = self->super._uiController;
  }
  objc_sync_exit(self);
  return uiController;
}

- (id)createAuthenticationRequest
{
  v2 = objc_opt_new();

  return v2;
}

- (id)createAppleConnectImpl
{
  v2 = [[ACMExternalAppleConnectImpl alloc] initWithMasterObject:0];

  return v2;
}

- (id)createAppleConnectImplWithMasterObject:(id)a3
{
  objc_super v3 = [[ACMExternalAppleConnectImpl alloc] initWithMasterObject:a3];

  return v3;
}

- (id)createHandlerWithClass:(Class)a3 context:(id)a4
{
  if ((Class)objc_opt_class() == a3)
  {
    return +[ACCHTTPHandler handlerWithContext:a4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ACMExternalAppleConnectImplComponents;
    return [(ACMAppleConnectImplComponents *)&v8 createHandlerWithClass:a3 context:a4];
  }
}

- (BOOL)uiControllerLoaded
{
  objc_sync_enter(self);
  BOOL v3 = self->super._uiController != 0;
  objc_sync_exit(self);
  return v3;
}

- (void)unloadUIController
{
  objc_sync_enter(self);
  [(ACMUIControllerProtocol *)self->super._uiController setDelegate:0];

  self->super._uiController = 0;

  objc_sync_exit(self);
}

@end