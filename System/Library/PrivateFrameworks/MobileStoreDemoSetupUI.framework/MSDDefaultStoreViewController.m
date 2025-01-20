@interface MSDDefaultStoreViewController
- (MSDDefaultStoreViewController)init;
- (OBWelcomeController)contentViewController;
- (void)_completeSetupTapped:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation MSDDefaultStoreViewController

- (MSDDefaultStoreViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)MSDDefaultStoreViewController;
  v2 = [(MSDDefaultStoreViewController *)&v15 init];
  if (v2)
  {
    v3 = +[MSDSetupUILocalization localizedStringForKey:@"DEFAULT_STORE_VIEW_TITLE"];
    v4 = +[MSDSetupUILocalization localizedStringForKey:@"DEFAULT_STORE_VIEW_DESCRIPTION"];
    v5 = +[MSDSetupUILocalization localizedStringForKey:@"COMPLETE_SETUP_BUTTON"];
    v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"building.2.crop.circle.fill"];
    v7 = (void *)[objc_alloc(MEMORY[0x263F5B918]) initWithTitle:v3 detailText:v4 icon:v6];
    [(MSDDefaultStoreViewController *)v2 setContentViewController:v7];

    v8 = [MEMORY[0x263F5B898] boldButton];
    [v8 setTitle:v5 forState:0];
    [v8 addTarget:v2 action:sel__completeSetupTapped_ forControlEvents:64];
    v9 = [(MSDDefaultStoreViewController *)v2 contentViewController];
    v10 = [v9 buttonTray];
    [v10 addButton:v8];

    v11 = [(MSDDefaultStoreViewController *)v2 contentViewController];
    v12 = [v11 navigationItem];
    [v12 setHidesBackButton:1];

    v13 = +[MSDSetupUILocalization localizedStringForKey:@"CANNOT_FIND_STORE_HEADER"];
    [(MSDDefaultStoreViewController *)v2 setTitle:v13];
  }
  return v2;
}

- (void)viewDidLoad
{
  v30[4] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)MSDDefaultStoreViewController;
  [(MSDDefaultStoreViewController *)&v29 viewDidLoad];
  v3 = [(MSDDefaultStoreViewController *)self contentViewController];
  [(MSDDefaultStoreViewController *)self addChildViewController:v3];

  v4 = [(MSDDefaultStoreViewController *)self contentViewController];
  v5 = [v4 view];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(MSDDefaultStoreViewController *)self view];
  [v6 addSubview:v5];

  v27 = [v5 topAnchor];
  v28 = [(MSDDefaultStoreViewController *)self view];
  v26 = [v28 safeAreaLayoutGuide];
  v25 = [v26 topAnchor];
  v24 = [v27 constraintEqualToAnchor:v25];
  v30[0] = v24;
  v22 = [v5 bottomAnchor];
  v23 = [(MSDDefaultStoreViewController *)self view];
  v21 = [v23 safeAreaLayoutGuide];
  v20 = [v21 bottomAnchor];
  v19 = [v22 constraintEqualToAnchor:v20];
  v30[1] = v19;
  v16 = [v5 leftAnchor];
  v18 = [(MSDDefaultStoreViewController *)self view];
  v7 = [v18 safeAreaLayoutGuide];
  v8 = [v7 leftAnchor];
  v9 = [v16 constraintEqualToAnchor:v8];
  v30[2] = v9;
  v10 = [v5 rightAnchor];
  v11 = [(MSDDefaultStoreViewController *)self view];
  v12 = [v11 safeAreaLayoutGuide];
  v13 = [v12 rightAnchor];
  v14 = [v10 constraintEqualToAnchor:v13];
  v30[3] = v14;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];

  [MEMORY[0x263F08938] activateConstraints:v17];
  objc_super v15 = [(MSDDefaultStoreViewController *)self contentViewController];
  [v15 didMoveToParentViewController:self];
}

- (void)_completeSetupTapped:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = defaultLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v3;
    id v5 = v8;
    _os_log_impl(&dword_23911B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Complete setup button tapped from: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  v6 = +[MSDSetupUIController sharedInstance];
  [v6 setupCompleteWithStoreID:0];
}

- (OBWelcomeController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end