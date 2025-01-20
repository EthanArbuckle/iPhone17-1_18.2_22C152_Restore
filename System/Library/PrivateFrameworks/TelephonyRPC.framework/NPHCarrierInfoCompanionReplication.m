@interface NPHCarrierInfoCompanionReplication
+ (id)sharedInstance;
- (NPHCarrierInfoCompanionReplication)init;
- (NPSManager)npsManager;
- (NSUserDefaults)mobilePhoneUserDefaults;
- (NSUserDefaults)nanoPhoneUserDefaults;
- (void)_updateHasCarrierVoicemailAccountsKey;
- (void)_updateIsVisualVoicemailServiceSubscribed;
- (void)_visualVMSubscriptionStateStatusChanged:(id)a3;
- (void)dealloc;
@end

@implementation NPHCarrierInfoCompanionReplication

+ (id)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sSharedCarrierInfoCompanionReplication;
  return v2;
}

uint64_t __52__NPHCarrierInfoCompanionReplication_sharedInstance__block_invoke()
{
  sharedInstance_sSharedCarrierInfoCompanionReplication = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (NPHCarrierInfoCompanionReplication)init
{
  v13.receiver = self;
  v13.super_class = (Class)NPHCarrierInfoCompanionReplication;
  v2 = [(NPHCarrierInfoCompanionReplication *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.mobilephone"];
    mobilePhoneUserDefaults = v2->_mobilePhoneUserDefaults;
    v2->_mobilePhoneUserDefaults = (NSUserDefaults *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.NanoPhone"];
    nanoPhoneUserDefaults = v2->_nanoPhoneUserDefaults;
    v2->_nanoPhoneUserDefaults = (NSUserDefaults *)v7;

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v10 = *MEMORY[0x263F84D20];
    v11 = [MEMORY[0x263F84CE8] shared];
    [v9 addObserver:v2 selector:sel__visualVMSubscriptionStateStatusChanged_ name:v10 object:v11];

    [(NPHCarrierInfoCompanionReplication *)v2 _updateIsVisualVoicemailServiceSubscribed];
    [(NPHCarrierInfoCompanionReplication *)v2 _updateHasCarrierVoicemailAccountsKey];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F84D20];
  uint64_t v5 = [MEMORY[0x263F84CE8] shared];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)NPHCarrierInfoCompanionReplication;
  [(NPHCarrierInfoCompanionReplication *)&v6 dealloc];
}

- (void)_visualVMSubscriptionStateStatusChanged:(id)a3
{
  [(NPHCarrierInfoCompanionReplication *)self _updateIsVisualVoicemailServiceSubscribed];
  [(NPHCarrierInfoCompanionReplication *)self _updateHasCarrierVoicemailAccountsKey];
}

- (void)_updateIsVisualVoicemailServiceSubscribed
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F84CE8] shared];
  uint64_t v4 = [v3 isSubscribed];

  uint64_t v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[NPHCarrierInfoCompanionReplication _updateIsVisualVoicemailServiceSubscribed]";
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_impl(&dword_234652000, v5, OS_LOG_TYPE_DEFAULT, "%s: %d", (uint8_t *)&v8, 0x12u);
  }

  [(NSUserDefaults *)self->_mobilePhoneUserDefaults setBool:v4 forKey:@"NPHIsVisualVoicemailServiceSubscribedKey"];
  npsManager = self->_npsManager;
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithObject:@"NPHIsVisualVoicemailServiceSubscribedKey"];
  [(NPSManager *)npsManager synchronizeUserDefaultsDomain:@"com.apple.mobilephone" keys:v7];
}

- (void)_updateHasCarrierVoicemailAccountsKey
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F84CE8] shared];
  uint64_t v4 = [v3 accounts];
  uint64_t v5 = [v4 count];

  objc_super v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    __int16 v10 = "-[NPHCarrierInfoCompanionReplication _updateHasCarrierVoicemailAccountsKey]";
    __int16 v11 = 1024;
    BOOL v12 = v5 != 0;
    _os_log_impl(&dword_234652000, v6, OS_LOG_TYPE_DEFAULT, "%s: %d", (uint8_t *)&v9, 0x12u);
  }

  [(NSUserDefaults *)self->_mobilePhoneUserDefaults setBool:v5 != 0 forKey:@"NPHHasCarrierVoicemailAccountsKey"];
  npsManager = self->_npsManager;
  int v8 = [MEMORY[0x263EFFA08] setWithObject:@"NPHHasCarrierVoicemailAccountsKey"];
  [(NPSManager *)npsManager synchronizeUserDefaultsDomain:@"com.apple.mobilephone" keys:v8];
}

- (NSUserDefaults)mobilePhoneUserDefaults
{
  return self->_mobilePhoneUserDefaults;
}

- (NSUserDefaults)nanoPhoneUserDefaults
{
  return self->_nanoPhoneUserDefaults;
}

- (NPSManager)npsManager
{
  return self->_npsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_nanoPhoneUserDefaults, 0);
  objc_storeStrong((id *)&self->_mobilePhoneUserDefaults, 0);
}

@end