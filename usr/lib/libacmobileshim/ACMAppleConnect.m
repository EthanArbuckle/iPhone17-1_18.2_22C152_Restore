@interface ACMAppleConnect
+ (id)sharedInstance;
- (ACMAppleConnect)init;
- (NSString)version;
- (id)delegate;
- (id)hideAppleConnectSignInDialog;
- (id)private;
- (unint64_t)logLevel;
- (void)authenticate:(id)a3;
- (void)authenticateWithRequest:(id)a3 password:(id)a4;
- (void)cancelRequests;
- (void)dealloc;
- (void)handleMemoryWarningNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLogLevel:(unint64_t)a3;
- (void)setupComponents;
- (void)verifyServiceTicket:(id)a3;
@end

@implementation ACMAppleConnect

- (void)authenticateWithRequest:(id)a3 password:(id)a4
{
  id v6 = [(ACMAppleConnect *)self private];

  [v6 authenticateWithRequest:a3 password:a4];
}

+ (id)sharedInstance
{
  id result = (id)sAppleConnect;
  if (!sAppleConnect)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0) {
        ACFLog(6, (uint64_t)"+[ACMAppleConnect sharedInstance]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnect.m", 47, 0, "Creating shared instance of %@ version", @"2.9.2");
      }
    }
    id result = (id)objc_opt_new();
    sAppleConnect = (uint64_t)result;
  }
  return result;
}

- (ACMAppleConnect)init
{
  v3 = objc_opt_class();
  objc_sync_enter(v3);
  if (sAppleConnect)
  {
    [(ACMAppleConnect *)self dealloc];
    v4 = (ACMAppleConnect *)(id)sAppleConnect;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ACMAppleConnect;
    v4 = [(ACMAppleConnect *)&v8 init];
    sAppleConnect = (uint64_t)v4;
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = [MEMORY[0x263F1C408] sharedApplication];
    [v5 addObserver:v4 selector:sel_handleMemoryWarningNotification_ name:*MEMORY[0x263F1D060] object:v6];
  }
  objc_sync_exit(v3);
  return v4;
}

- (void)dealloc
{
  v3 = objc_opt_class();
  objc_sync_enter(v3);
  [objc_msgSend(MEMORY[0x263F08A00], "defaultCenter") removeObserver:self];
  if ((ACMAppleConnect *)sAppleConnect == self) {
    sAppleConnect = 0;
  }
  objc_sync_exit(v3);
  [self->_private setDelegate:0];
  [self->_private setMasterObject:0];

  self->_private = 0;
  +[ACFComponents setComponents:0];
  v4.receiver = self;
  v4.super_class = (Class)ACMAppleConnect;
  [(ACMAppleConnect *)&v4 dealloc];
}

- (void)handleMemoryWarningNotification:(id)a3
{
  objc_sync_enter(self);
  id v4 = self->_private;
  if (v4 && [v4 shouldReleaseOnMemoryWarning])
  {
    [self->_private setDelegate:0];
    [self->_private setMasterObject:0];

    self->_private = 0;
  }

  objc_sync_exit(self);
}

- (void)setupComponents
{
  id v2 = (id)objc_opt_new();
  [v2 setTransportClass:objc_opt_class()];
  [v2 setCryptograph:(id)objc_opt_new()];
  [v2 setKeychainManager:(id)objc_opt_new()];
  [v2 setCertificateStoragePolicy:(id)objc_opt_new()];
  [v2 setTgtStoragePolicy:(id)objc_opt_new()];
  [v2 setLocalAuthenticationContextClass:objc_opt_class()];
  id v3 = (id)objc_opt_new();
  [v3 setAuthContextClass:objc_opt_class()];
  [v3 setSsoTokenClass:objc_opt_class()];
  [v2 setTicketManager:v3];

  +[ACFComponents setComponents:v2];
}

- (id)private
{
  objc_sync_enter(self);
  id v3 = self->_private;
  if (!v3)
  {
    [(ACMAppleConnect *)self setupComponents];
    id v4 = (id)ACMExternalAppleConnectPrivateCreate((uint64_t)self);
    self->_private = v4;
    [v4 setDelegate:self->_delegate];
    id v3 = self->_private;
  }
  id v5 = v3;
  objc_sync_exit(self);
  return v5;
}

- (NSString)version
{
  return (NSString *)@"2.9.2";
}

- (void)authenticate:(id)a3
{
  id v4 = [(ACMAppleConnect *)self private];

  [v4 authenticate:a3];
}

- (void)verifyServiceTicket:(id)a3
{
  id v4 = [(ACMAppleConnect *)self private];

  [v4 verifyServiceTicket:a3];
}

- (void)cancelRequests
{
  id v2 = [(ACMAppleConnect *)self private];

  [v2 cancelRequests];
}

- (id)hideAppleConnectSignInDialog
{
  id v2 = [(ACMAppleConnect *)self private];

  return (id)[v2 hideAppleConnectSignInDialog];
}

- (id)delegate
{
  objc_sync_enter(self);
  id delegate = self->_delegate;
  objc_sync_exit(self);
  return delegate;
}

- (void)setDelegate:(id)a3
{
  objc_sync_enter(self);
  if (self->_delegate != a3)
  {
    self->_id delegate = a3;
    [self->_private setDelegate:a3];
  }

  objc_sync_exit(self);
}

- (unint64_t)logLevel
{
  id v2 = [(ACMAppleConnect *)self private];

  return [v2 logLevel];
}

- (void)setLogLevel:(unint64_t)a3
{
  id v4 = [(ACMAppleConnect *)self private];

  [v4 setLogLevel:a3];
}

@end