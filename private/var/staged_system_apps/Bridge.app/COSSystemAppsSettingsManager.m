@interface COSSystemAppsSettingsManager
- (BOOL)_shouldReloadChangedRow:(id)a3 installed:(BOOL)a4 activeDevice:(id)a5;
- (COSApplicationsInstallStateProvider)appsInstallStateManager;
- (COSSystemAppsSettingsManager)initWithDelegate:(id)a3;
- (COSSystemAppsSettingsManagerDelegate)delegate;
- (NSArray)systemAppsSpecifiersBundleDicts;
- (NSMutableArray)bundleRows;
- (NSMutableDictionary)watchBundleIDToBundleRowMapping;
- (OS_dispatch_queue)bundleLoadingQueue;
- (id)_systemAppSpecifierDictForBundleRow:(id)a3;
- (void)_addRequiredWatchAppsToMapping:(id)a3;
- (void)_buildSystemAppSpecifierDicts;
- (void)_loadSystemAppSettings;
- (void)_notifyThatFullSpecifierDictListIsLoaded;
- (void)_notifyThatSpecifiersShouldBeRemoved:(id)a3;
- (void)_recheckInstallStateForAllBundleRows;
- (void)_setUpBundleRows:(id)a3;
- (void)buildSystemAppSettings;
- (void)setAppsInstallStateManager:(id)a3;
- (void)setBundleLoadingQueue:(id)a3;
- (void)setBundleRows:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSystemAppsSpecifiersBundleDicts:(id)a3;
- (void)setWatchBundleIDToBundleRowMapping:(id)a3;
- (void)watchAppsChangedForBundleRows:(id)a3 installed:(BOOL)a4;
@end

@implementation COSSystemAppsSettingsManager

- (void)_notifyThatFullSpecifierDictListIsLoaded
{
  v3 = [(COSSystemAppsSettingsManager *)self systemAppsSpecifiersBundleDicts];
  id v4 = [v3 copy];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005D50;
  v6[3] = &unk_100243908;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)_loadSystemAppSettings
{
  v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[COSSystemAppsSettingsManager _loadSystemAppSettings]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s - Loading system app bundles", buf, 0xCu);
  }

  id v4 = [(COSSystemAppsSettingsManager *)self bundleLoadingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013834;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (COSSystemAppsSettingsManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)COSSystemAppsSettingsManager;
  id v5 = [(COSSystemAppsSettingsManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.Bridge.systemapploading", v7);
    bundleLoadingQueue = v6->_bundleLoadingQueue;
    v6->_bundleLoadingQueue = (OS_dispatch_queue *)v8;

    v10 = [[COSApplicationsInstallStateProvider alloc] initWithDelegate:v6];
    appsInstallStateManager = v6->_appsInstallStateManager;
    v6->_appsInstallStateManager = v10;

    [(COSSystemAppsSettingsManager *)v6 _loadSystemAppSettings];
  }

  return v6;
}

- (void)_buildSystemAppSpecifierDicts
{
  v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[COSSystemAppsSettingsManager _buildSystemAppSpecifierDicts]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s - building system app specifier bundle dictionaries", buf, 0xCu);
  }

  id v4 = [(COSSystemAppsSettingsManager *)self systemAppsSpecifiersBundleDicts];

  if (!v4)
  {
    id v5 = objc_opt_new();
    [(COSSystemAppsSettingsManager *)self setSystemAppsSpecifiersBundleDicts:v5];
  }
  v6 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(COSSystemAppsSettingsManager *)self bundleRows];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [(COSSystemAppsSettingsManager *)self _systemAppSpecifierDictForBundleRow:*(void *)(*((void *)&v13 + 1) + 8 * (void)v11)];
        if (v12) {
          [v6 addObject:v12];
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(COSSystemAppsSettingsManager *)self setSystemAppsSpecifiersBundleDicts:v6];
}

- (id)_systemAppSpecifierDictForBundleRow:(id)a3
{
  id v3 = a3;
  if ([v3 requiredAppsInstalled])
  {
    id v4 = [v3 settingsBundleDict];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setSystemAppsSpecifiersBundleDicts:(id)a3
{
}

- (void)_setUpBundleRows:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [(COSSystemAppsSettingsManager *)self setBundleRows:v5];

  v6 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
        long long v13 = [COSSystemAppSettingsBundleRow alloc];
        long long v14 = [v7 objectForKeyedSubscript:v12, v17];
        long long v15 = [(COSSystemAppSettingsBundleRow *)v13 initWithBundle:v14 name:v12];

        [(COSSystemAppsSettingsManager *)self _addRequiredWatchAppsToMapping:v15];
        [(COSSystemAppSettingsBundleRow *)v15 setAreRequiredWatchAppsInstalled:v6];
        long long v16 = [(COSSystemAppsSettingsManager *)self bundleRows];
        [v16 addObject:v15];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (NSMutableArray)bundleRows
{
  return self->_bundleRows;
}

- (void)_addRequiredWatchAppsToMapping:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requiredInstalledWatchApps];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v11 = [(COSSystemAppsSettingsManager *)self watchBundleIDToBundleRowMapping];

        if (!v11)
        {
          uint64_t v12 = objc_opt_new();
          [(COSSystemAppsSettingsManager *)self setWatchBundleIDToBundleRowMapping:v12];
        }
        long long v13 = [(COSSystemAppsSettingsManager *)self watchBundleIDToBundleRowMapping];
        long long v14 = [v13 objectForKeyedSubscript:v10];
        long long v15 = v14;
        if (v14) {
          id v16 = v14;
        }
        else {
          id v16 = (id)objc_opt_new();
        }
        long long v17 = v16;

        if (([v17 containsObject:v4] & 1) == 0)
        {
          [v17 addObject:v4];
          long long v18 = [(COSSystemAppsSettingsManager *)self watchBundleIDToBundleRowMapping];
          [v18 setObject:v17 forKeyedSubscript:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (NSMutableDictionary)watchBundleIDToBundleRowMapping
{
  return self->watchBundleIDToBundleRowMapping;
}

- (NSArray)systemAppsSpecifiersBundleDicts
{
  return self->_systemAppsSpecifiersBundleDicts;
}

- (void)setWatchBundleIDToBundleRowMapping:(id)a3
{
}

- (void)setBundleRows:(id)a3
{
}

- (COSSystemAppsSettingsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSSystemAppsSettingsManagerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)bundleLoadingQueue
{
  return self->_bundleLoadingQueue;
}

- (void)buildSystemAppSettings
{
  id v3 = [(COSSystemAppsSettingsManager *)self bundleLoadingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118FD8;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_recheckInstallStateForAllBundleRows
{
  id v3 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(COSSystemAppsSettingsManager *)self bundleRows];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setAreRequiredWatchAppsInstalled:v3];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_notifyThatSpecifiersShouldBeRemoved:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001191BC;
  v4[3] = &unk_100243908;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)watchAppsChangedForBundleRows:(id)a3 installed:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(COSSystemAppsSettingsManager *)self bundleLoadingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001192CC;
  block[3] = &unk_1002465B8;
  id v10 = v6;
  long long v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)_shouldReloadChangedRow:(id)a3 installed:(BOOL)a4 activeDevice:(id)a5
{
  int v6 = a4;
  id v7 = a3;
  id v8 = a5;
  unsigned int v9 = [v7 requiredAppsInstalled];
  [v7 setAreRequiredWatchAppsInstalled:v8];

  if (v9 != [v7 requiredAppsInstalled]
    && [v7 requiredAppsInstalled] == v6)
  {
    long long v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v7 identifier];
      long long v13 = (void *)v12;
      CFStringRef v14 = @"uninstalled";
      if (v6) {
        CFStringRef v14 = @"installed";
      }
      int v16 = 138412546;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      CFStringRef v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Watch app corresponding with this dependent row %@ has been \"%@\", flagging row for reload", (uint8_t *)&v16, 0x16u);
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
}

- (COSApplicationsInstallStateProvider)appsInstallStateManager
{
  return self->_appsInstallStateManager;
}

- (void)setAppsInstallStateManager:(id)a3
{
}

- (void)setBundleLoadingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleLoadingQueue, 0);
  objc_storeStrong((id *)&self->_bundleRows, 0);
  objc_storeStrong((id *)&self->_appsInstallStateManager, 0);
  objc_storeStrong((id *)&self->_systemAppsSpecifiersBundleDicts, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->watchBundleIDToBundleRowMapping, 0);
}

@end