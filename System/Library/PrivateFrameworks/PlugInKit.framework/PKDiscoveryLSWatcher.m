@interface PKDiscoveryLSWatcher
- (PKApplicationWorkspaceProxy)workspace;
- (PKDiscoveryDriver)wdriver;
- (PKDiscoveryLSWatcher)initWithDriver:(id)a3;
- (void)pluginsDidInstall:(id)a3;
- (void)pluginsDidUninstall:(id)a3;
- (void)setWdriver:(id)a3;
- (void)setWorkspace:(id)a3;
- (void)stopUpdates;
- (void)update;
- (void)updateWithUninstalledProxies:(id)a3;
@end

@implementation PKDiscoveryLSWatcher

- (PKDiscoveryLSWatcher)initWithDriver:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDiscoveryLSWatcher;
  v5 = [(PKDiscoveryLSWatcher *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(PKDiscoveryLSWatcher *)v5 setWdriver:v4];
    v7 = [v4 host];
    v8 = [v7 external];
    v9 = [v8 ls];
    v10 = [v9 defaultApplicationWorkspace];
    [(PKDiscoveryLSWatcher *)v6 setWorkspace:v10];

    v11 = [(PKDiscoveryLSWatcher *)v6 workspace];
    [v11 addObserver:v6];
  }
  return v6;
}

- (PKApplicationWorkspaceProxy)workspace
{
  return (PKApplicationWorkspaceProxy *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWorkspace:(id)a3
{
}

- (void)setWdriver:(id)a3
{
}

- (void)stopUpdates
{
  id v3 = [(PKDiscoveryLSWatcher *)self workspace];
  [v3 removeObserver:self];
}

- (void)pluginsDidInstall:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(PKDiscoveryLSWatcher *)self wdriver];
    int v7 = 134218240;
    v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = [v4 count];
    _os_log_impl(&dword_1B38B0000, v5, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> new plugin(s) (count: %lu) installed, re-performing query for continuous discovery", (uint8_t *)&v7, 0x16u);
  }
  [(PKDiscoveryLSWatcher *)self update];
}

- (void)pluginsDidUninstall:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = pklog_handle_for_category(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(PKDiscoveryLSWatcher *)self wdriver];
    int v7 = 134218240;
    v8 = v6;
    __int16 v9 = 2048;
    uint64_t v10 = [v4 count];
    _os_log_impl(&dword_1B38B0000, v5, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> plugin(s) (count: %lu) uninstalled", (uint8_t *)&v7, 0x16u);
  }
  [(PKDiscoveryLSWatcher *)self updateWithUninstalledProxies:v4];
}

- (void)update
{
}

- (void)updateWithUninstalledProxies:(id)a3
{
  id v4 = a3;
  v5 = [(PKDiscoveryLSWatcher *)self wdriver];
  v6 = v5;
  if (v5)
  {
    int v7 = [v5 queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B38C0418;
    v8[3] = &unk_1E6058CC8;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (PKDiscoveryDriver)wdriver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wdriver);
  return (PKDiscoveryDriver *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_destroyWeak((id *)&self->_wdriver);
}

@end