@interface WFSettingsViewProvider
- (NSMapTable)credentialsViewControllerMap;
- (WFSettingsController)settingsController;
- (WFSettingsViewProvider)init;
- (id)certificateViewControllerWithContext:(id)a3;
- (id)credentialsViewControllerWithContext:(id)a3;
- (id)networkDetailsViewControllerWithContext:(id)a3;
- (id)networkErrorViewControllerWithContext:(id)a3;
- (id)otherNetworkViewControllerWithContext:(id)a3 appearanceProxy:(id)a4;
- (void)didDismissNetworkViewController:(id)a3 forContext:(id)a4;
- (void)setCredentialsViewControllerMap:(id)a3;
- (void)setSettingsController:(id)a3;
@end

@implementation WFSettingsViewProvider

- (WFSettingsViewProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFSettingsViewProvider;
  v2 = [(WFSettingsViewProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:5 valueOptions:0 capacity:0];
    credentialsViewControllerMap = v2->_credentialsViewControllerMap;
    v2->_credentialsViewControllerMap = (NSMapTable *)v3;
  }
  return v2;
}

- (id)credentialsViewControllerWithContext:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F863D8];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = WFCurrentDeviceCapability();
  v8 = [MEMORY[0x263F86368] defaultAppearanceProxy];
  v9 = (void *)[v6 initWithCredentialsProviderContext:v5 deviceCapability:v7 appearanceProxy:v8];

  [(NSMapTable *)self->_credentialsViewControllerMap setObject:v9 forKey:v5];
  return v9;
}

- (id)certificateViewControllerWithContext:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F863F0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithCertificateProviderContext:v4];

  return v5;
}

- (id)networkDetailsViewControllerWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [[WFSettingsController alloc] initWithDetailsContext:v4];

  [(WFSettingsViewProvider *)self setSettingsController:v5];
  id v6 = [(WFSettingsViewProvider *)self settingsController];
  uint64_t v7 = [v6 settingsViewController];

  return v7;
}

- (id)networkErrorViewControllerWithContext:(id)a3
{
  return (id)[MEMORY[0x263F863A0] errorAlertControllerWithContext:a3];
}

- (id)otherNetworkViewControllerWithContext:(id)a3 appearanceProxy:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x263F863D8];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = WFCurrentDeviceCapability();
  v8 = [MEMORY[0x263F86368] defaultAppearanceProxy];
  v9 = (void *)[v6 initWithOtherNetworkProviderContext:v5 deviceCapability:v7 appearanceProxy:v8];

  [v9 setDelegate:v5];
  return v9;
}

- (void)didDismissNetworkViewController:(id)a3 forContext:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(WFSettingsViewProvider *)self credentialsViewControllerMap];
    [v6 removeObjectForKey:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(WFSettingsViewProvider *)self settingsController];
      v8 = [v7 settingsViewController];
      int v9 = [v8 detailViewControllerVisible];

      if (v9)
      {
        v10 = WFLogForCategory(0);
        os_log_type_t v11 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v10 && os_log_type_enabled(v10, v11))
        {
          int v16 = 136315138;
          v17 = "-[WFSettingsViewProvider didDismissNetworkViewController:forContext:]";
          _os_log_impl(&dword_226071000, v10, v11, "%s: settings view controller has detail view controller visible, popping navigation controller", (uint8_t *)&v16, 0xCu);
        }

        v12 = [(WFSettingsViewProvider *)self settingsController];
        v13 = [v12 settingsViewController];
        v14 = [v13 navigationController];
        id v15 = (id)[v14 popViewControllerAnimated:1];
      }
      [(WFSettingsViewProvider *)self setSettingsController:0];
    }
  }
}

- (NSMapTable)credentialsViewControllerMap
{
  return self->_credentialsViewControllerMap;
}

- (void)setCredentialsViewControllerMap:(id)a3
{
}

- (WFSettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_credentialsViewControllerMap, 0);
}

@end