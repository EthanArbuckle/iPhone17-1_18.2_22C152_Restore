@interface COSApplicationsInstallStateProvider
- (COSApplicationsInstallStateProvider)initWithDelegate:(id)a3;
- (COSApplicationsInstallStateProviderDelegate)delegate;
- (void)_processChangedRows:(id)a3 installed:(BOOL)a4;
- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation COSApplicationsInstallStateProvider

- (COSApplicationsInstallStateProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COSApplicationsInstallStateProvider;
  v5 = [(COSApplicationsInstallStateProvider *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = +[ACXDeviceConnection sharedDeviceConnection];
    [v7 addObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[ACXDeviceConnection sharedDeviceConnection];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)COSApplicationsInstallStateProvider;
  [(COSApplicationsInstallStateProvider *)&v4 dealloc];
}

- (void)_processChangedRows:(id)a3 installed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    v11 = "-[COSApplicationsInstallStateProvider _processChangedRows:installed:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - changedRows %@, installed %{BOOL}d", (uint8_t *)&v10, 0x1Cu);
  }

  if ([v6 count])
  {
    v8 = [(COSApplicationsInstallStateProvider *)self delegate];
    [v8 watchAppsChangedForBundleRows:v6 installed:v4];
  }
  if (![v6 count] || !v4)
  {
    objc_super v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"COSAppListChangedNotification" object:0];
  }
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  objc_super v9 = [v8 pairingID];
  unsigned int v10 = [v9 isEqual:v7];

  if (v10)
  {
    v21 = self;
    v11 = [(COSApplicationsInstallStateProvider *)self delegate];
    __int16 v12 = [v11 watchBundleIDToBundleRowMapping];

    id v13 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v6;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v18) bundleIdentifier];
          v20 = [v12 objectForKey:v19];
          if (v20) {
            [v13 addObjectsFromArray:v20];
          }

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }

    [(COSApplicationsInstallStateProvider *)v21 _processChangedRows:v13 installed:1];
    id v6 = v22;
  }
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  objc_super v9 = [v8 pairingID];
  unsigned int v10 = [v9 isEqual:v7];

  if (v10)
  {
    v20 = self;
    v11 = [(COSApplicationsInstallStateProvider *)self delegate];
    __int16 v12 = [v11 watchBundleIDToBundleRowMapping];

    id v13 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [v12 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * (void)v18)];
          if (v19) {
            [v13 addObjectsFromArray:v19];
          }

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    [(COSApplicationsInstallStateProvider *)v20 _processChangedRows:v13 installed:0];
  }
}

- (COSApplicationsInstallStateProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSApplicationsInstallStateProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end