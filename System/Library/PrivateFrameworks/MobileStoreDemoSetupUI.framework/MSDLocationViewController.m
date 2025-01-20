@interface MSDLocationViewController
- (CLLocationManager)locationManager;
- (MSDLocationViewController)init;
- (void)_locationButtonTapped:(id)a3;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation MSDLocationViewController

- (MSDLocationViewController)init
{
  v3 = +[MSDSetupUILocalization localizedStringForKey:@"LOCATION_SERVICES_TITLE"];
  v4 = +[MSDSetupUILocalization localizedStringForKey:@"LOCATION_SERVICES_DESCRIPTION"];
  v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"location"];
  v10.receiver = self;
  v10.super_class = (Class)MSDLocationViewController;
  v6 = [(MSDLocationViewController *)&v10 initWithTitle:v3 detailText:v4 icon:v5];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F00A60]);
    [(MSDLocationViewController *)v6 setLocationManager:v7];

    v8 = [(MSDLocationViewController *)v6 locationManager];
    [v8 setDelegate:v6];
  }
  return v6;
}

- (void)viewDidLoad
{
  v31[5] = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)MSDLocationViewController;
  [(OBBaseWelcomeController *)&v28 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x263F00B60]);
  [v3 setLabel:4];
  [v3 setIcon:0];
  [v3 setCornerRadius:14.0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addTarget:self action:sel__locationButtonTapped_ forControlEvents:64];
  v4 = [MEMORY[0x263F5B898] boldButton];
  [v4 setTitle:@"placeholder" forState:0];
  v5 = [(MSDLocationViewController *)self buttonTray];
  [v5 addButton:v4];

  v6 = [(MSDLocationViewController *)self buttonTray];
  [v6 addSubview:v3];

  v27 = [v3 topAnchor];
  v26 = [v4 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v31[0] = v25;
  v24 = [v3 bottomAnchor];
  v23 = [v4 bottomAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v31[1] = v22;
  v21 = [v3 leadingAnchor];
  id v7 = [v4 leadingAnchor];
  v8 = [v21 constraintEqualToAnchor:v7];
  v31[2] = v8;
  v9 = [v3 trailingAnchor];
  objc_super v10 = [v4 trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v31[3] = v11;
  v12 = [v3 heightAnchor];
  [v4 frame];
  v14 = [v12 constraintEqualToConstant:v13];
  v31[4] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:5];

  [MEMORY[0x263F08938] activateConstraints:v15];
  v16 = defaultLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v30 = 2;
    _os_log_impl(&dword_23911B000, v16, OS_LOG_TYPE_DEFAULT, "Setting location button use mode to %d...", buf, 8u);
  }

  v17 = (void *)MEMORY[0x263F00A60];
  v18 = [MEMORY[0x263F086E0] mainBundle];
  v19 = [v18 bundleIdentifier];
  [v17 setLocationButtonUseMode:2 forBundleIdentifier:v19];

  v20 = +[MSDSetupUIController sharedInstance];
  [v20 enableLocationServices];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    int v12 = 138543874;
    double v13 = v5;
    __int16 v14 = 1024;
    int v15 = [v3 authorizationStatus];
    __int16 v16 = 2048;
    uint64_t v17 = [v3 accuracyAuthorization];
    _os_log_impl(&dword_23911B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: location authorization status changed to %d; accuracy authorization %ld",
      (uint8_t *)&v12,
      0x1Cu);
  }
  if ((int)[v3 authorizationStatus] >= 3)
  {
    id v7 = defaultLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      int v12 = 138543362;
      double v13 = v8;
      id v9 = v8;
      _os_log_impl(&dword_23911B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: location authorized; moving to store search view controller",
        (uint8_t *)&v12,
        0xCu);
    }
    objc_super v10 = objc_alloc_init(MSDStoreSearchViewController);
    v11 = +[MSDSetupUIController sharedInstance];
    [v11 pushViewController:v10 andRemoveTopmostView:1];
  }
}

- (void)_locationButtonTapped:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v7;
    _os_log_impl(&dword_23911B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Location button tapped from: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end