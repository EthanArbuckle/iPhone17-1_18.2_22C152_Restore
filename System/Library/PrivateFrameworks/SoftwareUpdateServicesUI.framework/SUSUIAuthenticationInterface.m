@interface SUSUIAuthenticationInterface
+ (id)sharedInstance;
- (BOOL)attemptAuthentication:(id)a3 outBlocked:(BOOL *)a4;
- (BOOL)isBlocked;
- (BOOL)isController;
- (SUSUIAuthenticationInterface)init;
- (SUSUIAuthenticationInterface)initWithKeybag:(id)a3;
- (unint64_t)_currentFailedAttemptsCount;
- (unint64_t)_numberOfFailedAuthenticationAttempts;
- (void)_incrementFailedAttemptsCount;
- (void)_setNumberOfFailedAuthenticationAttempts:(unint64_t)a3;
- (void)_setPasscodeLocked:(BOOL)a3;
- (void)keybagInterface:(id)a3 passcodeLockedStateDidChange:(BOOL)a4;
- (void)resetAttempts;
- (void)setIsController:(BOOL)a3;
@end

@implementation SUSUIAuthenticationInterface

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&sharedInstance___once;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance___instance;

  return v2;
}

void __46__SUSUIAuthenticationInterface_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SUSUIAuthenticationInterface);
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;
}

- (SUSUIAuthenticationInterface)init
{
  v6 = self;
  id v4 = (id)[MEMORY[0x263F781F0] sharedInstance];
  v6 = 0;
  v6 = -[SUSUIAuthenticationInterface initWithKeybag:](self, "initWithKeybag:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0);
  return v5;
}

- (SUSUIAuthenticationInterface)initWithKeybag:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v13;
  v13 = 0;
  v11.receiver = v3;
  v11.super_class = (Class)SUSUIAuthenticationInterface;
  v9 = [(SUSUIAuthenticationInterface *)&v11 init];
  v13 = v9;
  objc_storeStrong((id *)&v13, v9);
  if (v9)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.softwareupdateservices.security"];
    defaults = v13->_defaults;
    v13->_defaults = (NSUserDefaults *)v4;

    objc_storeStrong((id *)&v13->_keybag, location[0]);
    [(SUKeybagInterface *)v13->_keybag addObserver:v13];
    char v6 = [(SUKeybagInterface *)v13->_keybag isPasscodeLocked];
    v13->_isPasscodeLocked = v6 & 1;
    id v10 = SUSUILogKeybagInterface();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v14, v13->_isPasscodeLocked);
      _os_log_impl(&dword_224ECB000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Initialized with passcode locked: %d", v14, 8u);
    }
    objc_storeStrong(&v10, 0);
  }
  v8 = v13;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

- (BOOL)isBlocked
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v10 = self;
  SEL v9 = a2;
  double v8 = 0.0;
  [(SUKeybagInterface *)self->_keybag backOffTime];
  double v8 = v2;
  id location = SUSUILogKeybagInterface();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v13, *(uint64_t *)&v8);
    _os_log_impl(&dword_224ECB000, (os_log_t)location, v6, "isBlocked: Backoff time: %f", v13, 0xCu);
  }
  objc_storeStrong(&location, 0);
  if (v8 <= 0.0)
  {
    unint64_t v5 = [(SUSUIAuthenticationInterface *)v10 _currentFailedAttemptsCount];
    os_log_t oslog = (os_log_t)SUSUILogKeybagInterface();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v12, v5);
      _os_log_impl(&dword_224ECB000, oslog, OS_LOG_TYPE_DEFAULT, "isBlocked: currentFailedAttemptsCount: %d", v12, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return v5 >= 5;
  }
  else
  {
    return 1;
  }
}

- (BOOL)attemptAuthentication:(id)a3 outBlocked:(BOOL *)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  char v18 = 0;
  char v17 = [(SUSUIAuthenticationInterface *)v21 isBlocked];
  if (!v17)
  {
    if ([(SUKeybagInterface *)v21->_keybag authenticate:location[0]])
    {
      id v16 = SUSUILogKeybagInterface();
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        log = v16;
        os_log_type_t type = v15;
        __os_log_helper_16_0_0(v14);
        _os_log_impl(&dword_224ECB000, log, type, "attemptAuthentication: success", v14, 2u);
      }
      objc_storeStrong(&v16, 0);
      char v18 = 1;
    }
    else
    {
      id v13 = SUSUILogKeybagInterface();
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v6 = v13;
        os_log_type_t v7 = v12;
        __os_log_helper_16_0_0(v11);
        _os_log_impl(&dword_224ECB000, v6, v7, "attemptAuthentication: failed", v11, 2u);
      }
      objc_storeStrong(&v13, 0);
      [(SUSUIAuthenticationInterface *)v21 _incrementFailedAttemptsCount];
      char v17 = [(SUSUIAuthenticationInterface *)v21 isBlocked];
    }
  }
  if (v19) {
    BOOL *v19 = v17 & 1;
  }
  if (v17) {
    [(SUKeybagInterface *)v21->_keybag lockDevice];
  }
  char v5 = v18;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)resetAttempts
{
  os_log_type_t v7 = self;
  location[1] = (id)a2;
  if (self->_isController)
  {
    location[0] = SUSUILogKeybagInterface();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      os_log_type_t type = v5;
      __os_log_helper_16_0_0(v4);
      _os_log_impl(&dword_224ECB000, log, type, "Attempts reset", v4, 2u);
    }
    objc_storeStrong(location, 0);
    [(SUSUIAuthenticationInterface *)v7 _setNumberOfFailedAuthenticationAttempts:0];
    [(NSUserDefaults *)v7->_defaults synchronize];
  }
}

- (unint64_t)_numberOfFailedAuthenticationAttempts
{
  return [(SUSUIAuthenticationInterface *)self _currentFailedAttemptsCount];
}

- (void)_setNumberOfFailedAuthenticationAttempts:(unint64_t)a3
{
  defaults = self->_defaults;
  id v4 = (id)[NSNumber numberWithUnsignedInteger:a3];
  -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:");

  [(NSUserDefaults *)self->_defaults synchronize];
}

- (void)_setPasscodeLocked:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  os_log_type_t v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if (self->_isPasscodeLocked != a3)
  {
    v6->_isPasscodeLocked = v4;
    os_log_t oslog = (os_log_t)SUSUILogKeybagInterface();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v7, v4);
      _os_log_impl(&dword_224ECB000, oslog, OS_LOG_TYPE_DEFAULT, "Passcode locked state did change: %d", v7, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(SUSUIAuthenticationInterface *)v6 resetAttempts];
  }
}

- (void)keybagInterface:(id)a3 passcodeLockedStateDidChange:(BOOL)a4
{
  os_log_type_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v13 = a4;
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  SEL v9 = __77__SUSUIAuthenticationInterface_keybagInterface_passcodeLockedStateDidChange___block_invoke;
  id v10 = &unk_26470ACB8;
  objc_super v11 = v15;
  BOOL v12 = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

uint64_t __77__SUSUIAuthenticationInterface_keybagInterface_passcodeLockedStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPasscodeLocked:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (unint64_t)_currentFailedAttemptsCount
{
  id v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"SUSUIFailedAttemptCountsWhileUnlocked"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)_incrementFailedAttemptsCount
{
}

- (BOOL)isController
{
  return self->_isController;
}

- (void)setIsController:(BOOL)a3
{
  self->_isController = a3;
}

- (void).cxx_destruct
{
}

@end