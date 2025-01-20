@interface ACMAppleConnectImpl
- (ACMAppleConnectImpl)init;
- (ACMAppleConnectImplComponents)components;
- (BOOL)shouldReleaseOnMemoryWarning;
- (NSMutableSet)handlers;
- (UIView)managerApprovalDialogSummaryView;
- (id)memoryError;
- (int64_t)logLevel;
- (unint64_t)signInDialogContentStyle;
- (void)authenticate:(id)a3;
- (void)changeUserPasswordWithRequest:(id)a3 isGesture:(BOOL)a4;
- (void)dealloc;
- (void)scheduleHandler:(id)a3 withCompletionBlock:(id)a4;
- (void)setLogLevel:(int64_t)a3;
- (void)uiControllerOnLogOut:(id)a3;
- (void)unscheduleAllHandlers;
- (void)unscheduleHandler:(id)a3;
- (void)updateLogLevel;
@end

@implementation ACMAppleConnectImpl

- (ACMAppleConnectImpl)init
{
  v7.receiver = self;
  v7.super_class = (Class)ACMAppleConnectImpl;
  v2 = [(ACMAppleConnectImpl *)&v7 init];
  if (v2)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACMAppleConnectImpl init]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 37, 0, "Creating instance...");
    }
    v3 = (void *)MEMORY[0x263F087E8];
    v4 = NSDictionary;
    id v5 = +[ACMBaseLocale localizedString:@"Out of Memory"];
    v2->_memoryError = (NSError *)(id)[v3 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200200 userInfo:[v4 dictionaryWithObject:v5 forKey:@"MEMORY"]];
    [(ACMAppleConnectImpl *)v2 updateLogLevel];
    [(ACMAppleConnectImplComponents *)[(ACMAppleConnectImpl *)v2 components] setUIControllerDelegate:v2];
  }
  return v2;
}

- (ACMAppleConnectImplComponents)components
{
  return (ACMAppleConnectImplComponents *)+[ACMAppleConnectImplComponents components];
}

- (BOOL)shouldReleaseOnMemoryWarning
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACMAppleConnectImpl shouldReleaseOnMemoryWarning]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 53, 0, "Memory Warning is received, cleaning up... ");
  }
  objc_sync_enter(self);
  [(ACMAppleConnectImplComponents *)[(ACMAppleConnectImpl *)self components] cleanupOnMemoryWarning];
  handlers = self->_handlers;
  if (handlers) {
    BOOL v4 = [(NSMutableSet *)handlers count] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  objc_sync_exit(self);
  return v4;
}

- (void)dealloc
{
  self->_memoryError = 0;
  [(ACMAppleConnectImplComponents *)[(ACMAppleConnectImpl *)self components] setUIControllerDelegate:0];
  [(ACMAppleConnectImpl *)self unscheduleAllHandlers];
  v3.receiver = self;
  v3.super_class = (Class)ACMAppleConnectImpl;
  [(ACMAppleConnectImpl *)&v3 dealloc];
}

- (id)memoryError
{
  return self->_memoryError;
}

- (unint64_t)signInDialogContentStyle
{
  return 0;
}

- (UIView)managerApprovalDialogSummaryView
{
  return 0;
}

- (NSMutableSet)handlers
{
  objc_sync_enter(self);
  handlers = self->_handlers;
  if (!handlers)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMAppleConnectImpl handlers]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 102, 0, "Creating HTTP handlers pool");
    }
    handlers = (NSMutableSet *)objc_opt_new();
    self->_handlers = handlers;
  }
  objc_sync_exit(self);
  return handlers;
}

- (void)scheduleHandler:(id)a3 withCompletionBlock:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMAppleConnectImpl scheduleHandler:withCompletionBlock:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 112, 0, "Scheduling HTTP handler %p for url %@", a3, [objc_msgSend((id)objc_msgSend(a3, "transport"), "requestURLTemplate")]);
  }
  objc_sync_enter(self);
  if (a3)
  {
    if (![(NSMutableSet *)[(ACMAppleConnectImpl *)self handlers] count]) {
      [((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication")) setNetworkActivityIndicatorVisible:1];
    }
    [(NSMutableSet *)[(ACMAppleConnectImpl *)self handlers] addObject:a3];
    [a3 performRequestWithCompletionBlock:a4];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__ACMAppleConnectImpl_scheduleHandler_withCompletionBlock___block_invoke;
    v7[3] = &unk_265043CC8;
    v7[4] = self;
    v7[5] = a3;
    [a3 setFinalizeBlock:v7];
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
  {
    ACFLog(3, (uint64_t)"-[ACMAppleConnectImpl scheduleHandler:withCompletionBlock:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 130, 0, "Trying to schedule nil handler");
  }
  objc_sync_exit(self);
}

uint64_t __59__ACMAppleConnectImpl_scheduleHandler_withCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unscheduleHandler:*(void *)(a1 + 40)];
}

- (void)unscheduleHandler:(id)a3
{
  objc_sync_enter(self);
  if ([(NSMutableSet *)[(ACMAppleConnectImpl *)self handlers] containsObject:a3])
  {
    [(NSMutableSet *)[(ACMAppleConnectImpl *)self handlers] removeObject:a3];
    [a3 setFinalizeBlock:0];
    if (![(NSMutableSet *)[(ACMAppleConnectImpl *)self handlers] count])
    {
      [[(id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication") setNetworkActivityIndicatorVisible:0];

      self->_handlers = 0;
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
  {
    ACFLog(6, (uint64_t)"-[ACMAppleConnectImpl unscheduleHandler:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 152, 0, "HTTP handler %p is not found, probably it was already removed", a3);
  }

  objc_sync_exit(self);
}

- (void)unscheduleAllHandlers
{
  v2 = self;
  while ([(NSMutableSet *)[(ACMAppleConnectImpl *)self handlers] count])
  {
    [(ACMAppleConnectImpl *)v2 unscheduleHandler:[(NSMutableSet *)[(ACMAppleConnectImpl *)v2 handlers] anyObject]];
    self = v2;
  }
  handlers = v2->_handlers;
  if (handlers)
  {

    v2->_handlers = 0;
  }
}

- (void)authenticate:(id)a3
{
  if (ACFProfileStart && (ACFLogSettingsGetLevelMask() & 0x100) != 0) {
    ACFProfileStart((uint64_t)"-[ACMAppleConnectImpl authenticate:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 174, 0, 0);
  }
  [(ACMAppleConnectImpl *)self performSelectorOnMainThread:sel_authenticateRunningOnMainThreadWithRequest_ withObject:a3 waitUntilDone:1];
  if (ACFProfileEnd)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x100) != 0) {
      ACFProfileEnd((uint64_t)"-[ACMAppleConnectImpl authenticate:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 178, 0, 0);
    }
  }
}

- (void)changeUserPasswordWithRequest:(id)a3 isGesture:(BOOL)a4
{
  BOOL v4 = a4;
  if (ACFProfileStart && (ACFLogSettingsGetLevelMask() & 0x100) != 0) {
    ACFProfileStart((uint64_t)"-[ACMAppleConnectImpl changeUserPasswordWithRequest:isGesture:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 201, 0, 0);
  }
  objc_super v7 = &selRef_changeGestureRunningOnMainThreadWithRequest_;
  if (!v4) {
    objc_super v7 = &selRef_changePasswordRunningOnMainThreadWithRequest_;
  }
  [(ACMAppleConnectImpl *)self performSelectorOnMainThread:*v7 withObject:a3 waitUntilDone:1];
  if (ACFProfileEnd)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x100) != 0) {
      ACFProfileEnd((uint64_t)"-[ACMAppleConnectImpl changeUserPasswordWithRequest:isGesture:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMAppleConnectImpl.m", 206, 0, 0);
    }
  }
}

- (void)updateLogLevel
{
}

- (int64_t)logLevel
{
  return [(ACMAppleConnectPreferences *)[(ACMAppleConnectImplComponents *)[(ACMAppleConnectImpl *)self components] preferences] logLevel];
}

- (void)setLogLevel:(int64_t)a3
{
  BOOL v4 = [(ACMAppleConnectImplComponents *)[(ACMAppleConnectImpl *)self components] preferences];

  [(ACMAppleConnectPreferences *)v4 setLogLevel:a3];
}

- (void)uiControllerOnLogOut:(id)a3
{
}

@end