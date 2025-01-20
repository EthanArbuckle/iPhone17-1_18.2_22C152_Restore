@interface SUSettingsSUPreferencesManager
- (BOOL)autoInstallSecurityResponse;
- (BOOL)autoInstallSecurityResponseForceOn;
- (BOOL)autoInstallSystemAndDataFiles;
- (BOOL)isAutomaticDownloadEnabled;
- (BOOL)isAutomaticUpdateV2Enabled;
- (BOOL)previousUserSpecifiedAutoInstallSecurityResponse;
- (BOOL)previousUserSpecifiedAutomaticUpdateV2Enabled;
- (OS_dispatch_queue)queue;
- (SUPreferences)preferences;
- (SUSettingsSUPreferencesManager)initWithDispatchQueue:(id)a3;
- (SUSettingsSUPreferencesManager)initWithDispatchQueue:(id)a3 forSUPreferencesInstance:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)enableAutoInstallSecurityResponse:(BOOL)a3;
- (void)enableAutoInstallSystemAndDataFiles:(BOOL)a3;
- (void)enableAutomaticDownload:(BOOL)a3;
- (void)enableAutomaticUpdateV2:(BOOL)a3;
- (void)enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3;
- (void)enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3;
- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5;
- (void)queue_enableAutoInstallSecurityResponse:(BOOL)a3;
- (void)queue_enableAutoInstallSystemAndDataFiles:(BOOL)a3;
- (void)queue_enableAutomaticDownload:(BOOL)a3;
- (void)queue_enableAutomaticUpdateV2:(BOOL)a3;
- (void)queue_enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3;
- (void)queue_enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3;
- (void)removeObserver:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SUSettingsSUPreferencesManager

- (BOOL)isAutomaticDownloadEnabled
{
  v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __60__SUSettingsSUPreferencesManager_isAutomaticDownloadEnabled__block_invoke;
  v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __60__SUSettingsSUPreferencesManager_isAutomaticDownloadEnabled__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) preferences];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isAutomaticDownloadEnabled] & 1;
}

- (void)enableAutomaticDownload:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __58__SUSettingsSUPreferencesManager_enableAutomaticDownload___block_invoke;
  v8 = &unk_26483BE00;
  v9 = v13;
  BOOL v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __58__SUSettingsSUPreferencesManager_enableAutomaticDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutomaticDownload:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutomaticDownload:(BOOL)a3
{
  BOOL v5 = a3;
  v3 = [(SUSettingsSUPreferencesManager *)self queue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  uint64_t v4 = [(SUSettingsSUPreferencesManager *)self preferences];
  [(SUPreferences *)v4 enableAutomaticDownload:v5];
}

- (BOOL)isAutomaticUpdateV2Enabled
{
  v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __60__SUSettingsSUPreferencesManager_isAutomaticUpdateV2Enabled__block_invoke;
  v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __60__SUSettingsSUPreferencesManager_isAutomaticUpdateV2Enabled__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) preferences];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isAutomaticUpdateV2Enabled] & 1;
}

- (void)enableAutomaticUpdateV2:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __58__SUSettingsSUPreferencesManager_enableAutomaticUpdateV2___block_invoke;
  v8 = &unk_26483BE00;
  v9 = v13;
  BOOL v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __58__SUSettingsSUPreferencesManager_enableAutomaticUpdateV2___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutomaticUpdateV2:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutomaticUpdateV2:(BOOL)a3
{
  BOOL v5 = a3;
  v3 = [(SUSettingsSUPreferencesManager *)self queue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  uint64_t v4 = [(SUSettingsSUPreferencesManager *)self preferences];
  [(SUPreferences *)v4 enableAutomaticUpdateV2:v5];
}

- (BOOL)previousUserSpecifiedAutomaticUpdateV2Enabled
{
  v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __79__SUSettingsSUPreferencesManager_previousUserSpecifiedAutomaticUpdateV2Enabled__block_invoke;
  v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __79__SUSettingsSUPreferencesManager_previousUserSpecifiedAutomaticUpdateV2Enabled__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) preferences];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 previousUserSpecifiedAutomaticUpdateV2Enabled] & 1;
}

- (void)enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __79__SUSettingsSUPreferencesManager_enablePreviousUserSpecifiedAutomaticUpdateV2___block_invoke;
  v8 = &unk_26483BE00;
  v9 = v13;
  BOOL v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __79__SUSettingsSUPreferencesManager_enablePreviousUserSpecifiedAutomaticUpdateV2___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enablePreviousUserSpecifiedAutomaticUpdateV2:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3
{
  BOOL v5 = a3;
  v3 = [(SUSettingsSUPreferencesManager *)self queue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  uint64_t v4 = [(SUSettingsSUPreferencesManager *)self preferences];
  [(SUPreferences *)v4 enablePreviousUserSpecifiedAutomaticUpdateV2:v5];
}

- (BOOL)autoInstallSecurityResponse
{
  v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __61__SUSettingsSUPreferencesManager_autoInstallSecurityResponse__block_invoke;
  v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __61__SUSettingsSUPreferencesManager_autoInstallSecurityResponse__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) preferences];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 autoInstallSecurityResponse] & 1;
}

- (void)enableAutoInstallSecurityResponse:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __68__SUSettingsSUPreferencesManager_enableAutoInstallSecurityResponse___block_invoke;
  v8 = &unk_26483BE00;
  v9 = v13;
  BOOL v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __68__SUSettingsSUPreferencesManager_enableAutoInstallSecurityResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutoInstallSecurityResponse:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutoInstallSecurityResponse:(BOOL)a3
{
  BOOL v5 = a3;
  v3 = [(SUSettingsSUPreferencesManager *)self queue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  uint64_t v4 = [(SUSettingsSUPreferencesManager *)self preferences];
  [(SUPreferences *)v4 enableAutoInstallSecurityResponse:v5];
}

- (BOOL)autoInstallSecurityResponseForceOn
{
  v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __68__SUSettingsSUPreferencesManager_autoInstallSecurityResponseForceOn__block_invoke;
  v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __68__SUSettingsSUPreferencesManager_autoInstallSecurityResponseForceOn__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) preferences];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 autoInstallSecurityResponseForceOn] & 1;
}

- (BOOL)previousUserSpecifiedAutoInstallSecurityResponse
{
  v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __82__SUSettingsSUPreferencesManager_previousUserSpecifiedAutoInstallSecurityResponse__block_invoke;
  v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __82__SUSettingsSUPreferencesManager_previousUserSpecifiedAutoInstallSecurityResponse__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) preferences];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 previousUserSpecifiedAutoInstallSecurityResponse] & 1;
}

- (void)enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __89__SUSettingsSUPreferencesManager_enablePreviousUserSpecifiedAutoInstallSecurityResponse___block_invoke;
  v8 = &unk_26483BE00;
  v9 = v13;
  BOOL v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __89__SUSettingsSUPreferencesManager_enablePreviousUserSpecifiedAutoInstallSecurityResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enablePreviousUserSpecifiedAutoInstallSecurityResponse:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3
{
  BOOL v5 = a3;
  v3 = [(SUSettingsSUPreferencesManager *)self queue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  uint64_t v4 = [(SUSettingsSUPreferencesManager *)self preferences];
  [(SUPreferences *)v4 enablePreviousUserSpecifiedAutoInstallSecurityResponse:v5];
}

- (BOOL)autoInstallSystemAndDataFiles
{
  v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __63__SUSettingsSUPreferencesManager_autoInstallSystemAndDataFiles__block_invoke;
  v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = v17;
  dispatch_sync((dispatch_queue_t)queue, &v5);

  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __63__SUSettingsSUPreferencesManager_autoInstallSystemAndDataFiles__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) preferences];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 autoInstallSystemAndDataFiles] & 1;
}

- (void)enableAutoInstallSystemAndDataFiles:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = [(SUSettingsSUPreferencesManager *)self queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __70__SUSettingsSUPreferencesManager_enableAutoInstallSystemAndDataFiles___block_invoke;
  v8 = &unk_26483BE00;
  v9 = v13;
  BOOL v10 = v11;
  dispatch_sync((dispatch_queue_t)queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __70__SUSettingsSUPreferencesManager_enableAutoInstallSystemAndDataFiles___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutoInstallSystemAndDataFiles:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutoInstallSystemAndDataFiles:(BOOL)a3
{
  BOOL v5 = a3;
  v3 = [(SUSettingsSUPreferencesManager *)self queue];
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  uint64_t v4 = [(SUSettingsSUPreferencesManager *)self preferences];
  [(SUPreferences *)v4 enableAutoInstallSystemAndDataFiles:v5];
}

- (SUSettingsSUPreferencesManager)initWithDispatchQueue:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v5 = v9;
  id v4 = location[0];
  id v6 = (id)[MEMORY[0x263F78218] sharedInstance];
  v9 = 0;
  v9 = -[SUSettingsSUPreferencesManager initWithDispatchQueue:forSUPreferencesInstance:](v5, "initWithDispatchQueue:forSUPreferencesInstance:", v4);
  int v7 = v9;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (SUSettingsSUPreferencesManager)initWithDispatchQueue:(id)a3 forSUPreferencesInstance:(id)a4
{
  SEL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v4 = v12;
  SEL v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)SUSettingsSUPreferencesManager;
  v8 = [(SUSettingsSUPreferencesManager *)&v9 init];
  SEL v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    [(SUSettingsSUPreferencesManager *)v12 setPreferences:v10];
    [(SUSettingsSUPreferencesManager *)v12 setQueue:location[0]];
    [(SUSettingsSUPreferencesManager *)v12 addObserver:v12];
  }
  id v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)dealloc
{
  BOOL v5 = self;
  SEL v4 = a2;
  id v2 = [(SUSettingsSUPreferencesManager *)self preferences];
  [(SUPreferences *)v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)SUSettingsSUPreferencesManager;
  [(SUSettingsSUPreferencesManager *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = [(SUSettingsSUPreferencesManager *)v5 preferences];
  [(SUPreferences *)v3 addObserver:location[0]];

  objc_storeStrong(location, 0);
}

- (void)removeObserver:(id)a3
{
  BOOL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = [(SUSettingsSUPreferencesManager *)v5 preferences];
  [(SUPreferences *)v3 removeObserver:location[0]];

  objc_storeStrong(location, 0);
}

- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v11, (uint64_t)"-[SUSettingsSUPreferencesManager preferences:didChangePreference:toValue:]", (uint64_t)v9);
    _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s: The preferences key '%{public}@' have been changed.", v11, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SUPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end