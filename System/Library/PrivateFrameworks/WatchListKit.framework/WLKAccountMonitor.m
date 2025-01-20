@interface WLKAccountMonitor
+ (id)sharedInstance;
- (ACAccount)activeAccount;
- (ACMonitoredAccountStore)monitoredAccountStore;
- (BOOL)_shouldNotifyAccountChange:(id)a3 newAccount:(id)a4;
- (BOOL)_shouldNotifyStoreFrontChange:(id)a3 newAccount:(id)a4;
- (WLKAccountMonitor)init;
- (void)_accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)setMonitoredAccountStore:(id)a3;
@end

@implementation WLKAccountMonitor

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

- (ACAccount)activeAccount
{
  return self->_activeAccount;
}

uint64_t __35__WLKAccountMonitor_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_alloc_init(WLKAccountMonitor);

  return MEMORY[0x1F41817F8]();
}

- (WLKAccountMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)WLKAccountMonitor;
  v2 = [(WLKAccountMonitor *)&v8 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    uint64_t v4 = objc_msgSend(v3, "ams_activeiTunesAccount");
    activeAccount = v2->_activeAccount;
    v2->_activeAccount = (ACAccount *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__accountStoreDidChange_ name:*MEMORY[0x1E4F178D8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WLKAccountMonitor;
  [(WLKAccountMonitor *)&v4 dealloc];
}

- (void)_accountStoreDidChange:(id)a3
{
  id v15 = a3;
  objc_super v4 = [v15 userInfo];
  v5 = objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E4F17810]);

  if (([v5 isEqualToString:*MEMORY[0x1E4F17890]] & 1) != 0
    || [v5 isEqualToString:*MEMORY[0x1E4F17898]])
  {
    v6 = self;
    objc_sync_enter(v6);
    v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    objc_super v8 = objc_msgSend(v7, "ams_activeiTunesAccount");

    v9 = [(WLKAccountMonitor *)v6 activeAccount];
    BOOL v10 = [(WLKAccountMonitor *)v6 _shouldNotifyAccountChange:v9 newAccount:v8];

    if (v10)
    {
      objc_storeStrong((id *)&v6->_activeAccount, v8);
      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 postNotificationName:@"WLKAccountMonitorAccountDidChange" object:v6];
    }
    v12 = [(WLKAccountMonitor *)v6 activeAccount];
    BOOL v13 = [(WLKAccountMonitor *)v6 _shouldNotifyStoreFrontChange:v12 newAccount:v8];

    if (v13)
    {
      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 postNotificationName:@"WLKAccountMontiorStoreFrontDidChange" object:v6];
    }
    objc_sync_exit(v6);
  }
}

- (BOOL)_shouldNotifyAccountChange:(id)a3 newAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && !v6)
  {
    objc_super v8 = WLKSystemLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      v9 = "WLKAccountMonitor - User logged out";
      BOOL v10 = (uint8_t *)&v18;
LABEL_15:
      _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v5 && v6)
  {
    objc_super v8 = WLKSystemLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      v9 = "WLKAccountMonitor - User logged in";
      BOOL v10 = (uint8_t *)&v17;
      goto LABEL_15;
    }
LABEL_16:

    BOOL v11 = 1;
    goto LABEL_17;
  }
  BOOL v11 = 0;
  if (v5 && v6)
  {
    v12 = [v5 identifier];
    BOOL v13 = [v7 identifier];
    char v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      objc_super v8 = WLKSystemLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = 0;
        v9 = "WLKAccountMonitor - Account changed";
        BOOL v10 = (uint8_t *)&v16;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    BOOL v11 = 0;
  }
LABEL_17:

  return v11;
}

- (BOOL)_shouldNotifyStoreFrontChange:(id)a3 newAccount:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    v9 = objc_msgSend(v5, "ams_storefront");
    BOOL v10 = objc_msgSend(v7, "ams_storefront");
    char v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      BOOL v8 = 0;
    }
    else
    {
      v12 = WLKSystemLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = objc_msgSend(v5, "ams_storefront");
        char v14 = objc_msgSend(v7, "ams_storefront");
        int v16 = 138412546;
        __int16 v17 = v13;
        __int16 v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_1BA2E8000, v12, OS_LOG_TYPE_DEFAULT, "WLKAccountMonitor - Store front changed %@ - %@", (uint8_t *)&v16, 0x16u);
      }
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (ACMonitoredAccountStore)monitoredAccountStore
{
  return self->_monitoredAccountStore;
}

- (void)setMonitoredAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredAccountStore, 0);

  objc_storeStrong((id *)&self->_activeAccount, 0);
}

@end