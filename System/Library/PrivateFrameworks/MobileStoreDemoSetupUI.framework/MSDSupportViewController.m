@interface MSDSupportViewController
- (MSDSupportViewController)init;
- (NSString)countryCode;
- (OBWelcomeController)contentViewController;
- (UITableView)optionsTableView;
- (id)_currentCountryStackView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setContentViewController:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setOptionsTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MSDSupportViewController

- (MSDSupportViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)MSDSupportViewController;
  v2 = [(MSDSupportViewController *)&v13 init];
  if (v2)
  {
    v3 = +[MSDSetupUILocalization localizedStringForKey:@"SUPPORT_TITLE"];
    v4 = [MEMORY[0x263F1C6B0] systemImageNamed:@"phone.circle.fill"];
    v5 = (void *)[objc_alloc(MEMORY[0x263F5B918]) initWithTitle:v3 detailText:0 icon:v4];
    [(MSDSupportViewController *)v2 setContentViewController:v5];

    v6 = [(MSDSupportViewController *)v2 contentViewController];
    v7 = [v6 navigationItem];
    [v7 setHidesBackButton:1];

    v8 = [(MSDSupportViewController *)v2 contentViewController];
    [v8 setScrollingDisabled:1];

    v9 = +[MSDSetupUILocalization localizedStringForKey:@"SUPPORT_HEADER"];
    [(MSDSupportViewController *)v2 setTitle:v9];

    v10 = +[MSDLanguageAndRegionManager sharedInstance];
    v11 = [v10 getCurrentDeviceRegion];
    [(MSDSupportViewController *)v2 setCountryCode:v11];
  }
  return v2;
}

- (void)viewDidLoad
{
  v101[4] = *MEMORY[0x263EF8340];
  v96.receiver = self;
  v96.super_class = (Class)MSDSupportViewController;
  [(MSDSupportViewController *)&v96 viewDidLoad];
  v3 = [(MSDSupportViewController *)self contentViewController];
  v4 = [v3 buttonTray];
  [v4 setHidden:1];

  v5 = [(MSDSupportViewController *)self contentViewController];
  [(MSDSupportViewController *)self addChildViewController:v5];

  v6 = [(MSDSupportViewController *)self contentViewController];
  v7 = [v6 view];

  v8 = [(MSDSupportViewController *)self contentViewController];
  v94 = [v8 contentView];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(MSDSupportViewController *)self view];
  [v9 addSubview:v7];

  v89 = [v7 topAnchor];
  v91 = [(MSDSupportViewController *)self view];
  v87 = [v91 safeAreaLayoutGuide];
  v85 = [v87 topAnchor];
  v83 = [v89 constraintEqualToAnchor:v85];
  v101[0] = v83;
  v78 = [v7 bottomAnchor];
  v81 = [(MSDSupportViewController *)self view];
  v76 = [v81 safeAreaLayoutGuide];
  v74 = [v76 bottomAnchor];
  v72 = [v78 constraintEqualToAnchor:v74];
  v101[1] = v72;
  v95 = v7;
  v68 = [v7 leftAnchor];
  v70 = [(MSDSupportViewController *)self view];
  v10 = [v70 safeAreaLayoutGuide];
  v11 = [v10 leftAnchor];
  v12 = [v68 constraintEqualToAnchor:v11];
  v101[2] = v12;
  objc_super v13 = [v7 rightAnchor];
  v14 = [(MSDSupportViewController *)self view];
  v15 = [v14 safeAreaLayoutGuide];
  v16 = [v15 rightAnchor];
  v17 = [v13 constraintEqualToAnchor:v16];
  v101[3] = v17;
  v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:4];

  [MEMORY[0x263F08938] activateConstraints:v93];
  v18 = [(MSDSupportViewController *)self contentViewController];
  [v18 didMoveToParentViewController:self];

  v19 = [(MSDSupportViewController *)self _currentCountryStackView];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v94 addSubview:v19];
  v20 = [v19 topAnchor];
  v21 = [v94 topAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v100[0] = v22;
  v90 = v19;
  v23 = [v19 centerXAnchor];
  v24 = [v94 centerXAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v100[1] = v25;
  v92 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:2];

  [MEMORY[0x263F08938] activateConstraints:v92];
  id v26 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v26 setTextAlignment:1];
  v27 = [MEMORY[0x263F1C550] systemBlueColor];
  [v26 setTextColor:v27];

  v28 = [MEMORY[0x263F81708] boldSystemFontOfSize:30.0];
  [v26 setFont:v28];

  v29 = +[MSDStoreContactsModel sharedInstance];
  v30 = [(MSDSupportViewController *)self countryCode];
  v31 = [v29 contactNumberForCountryCode:v30];
  [v26 setText:v31];

  objc_msgSend(v26, "setLayoutMargins:", 30.0, 0.0, 30.0, 0.0);
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v94 addSubview:v26];
  v32 = [v26 topAnchor];
  v33 = [v19 bottomAnchor];
  v34 = [v32 constraintEqualToAnchor:v33 constant:30.0];
  v99[0] = v34;
  v35 = v26;
  v86 = v26;
  v36 = [v26 centerXAnchor];
  v37 = [v94 centerXAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  v99[1] = v38;
  v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:2];

  [MEMORY[0x263F08938] activateConstraints:v88];
  id v39 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v39 setTextAlignment:1];
  v40 = [MEMORY[0x263F1C550] labelColor];
  [v39 setTextColor:v40];

  [v39 setNumberOfLines:0];
  v41 = +[MSDSetupUILocalization localizedStringForKey:@"SUPPORT_DESCRIPTION"];
  [v39 setText:v41];

  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v94 addSubview:v39];
  v79 = [v39 topAnchor];
  v42 = [v35 bottomAnchor];
  v43 = [v79 constraintEqualToAnchor:v42 constant:30.0];
  v98[0] = v43;
  v84 = v39;
  v44 = [v39 leadingAnchor];
  v45 = [v94 leadingAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  v98[1] = v46;
  v47 = [v39 trailingAnchor];
  v48 = [v94 trailingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  v98[2] = v49;
  v82 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:3];

  [MEMORY[0x263F08938] activateConstraints:v82];
  id v50 = objc_alloc(MEMORY[0x263F1CA40]);
  v51 = objc_msgSend(v50, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(MSDSupportViewController *)self setOptionsTableView:v51];

  v52 = [(MSDSupportViewController *)self optionsTableView];
  [v52 setDelegate:self];

  v53 = [(MSDSupportViewController *)self optionsTableView];
  [v53 setDataSource:self];

  v54 = [(MSDSupportViewController *)self optionsTableView];
  [v54 setScrollEnabled:0];

  v55 = [(MSDSupportViewController *)self optionsTableView];
  [v55 setTranslatesAutoresizingMaskIntoConstraints:0];

  v56 = [(MSDSupportViewController *)self optionsTableView];
  [v95 addSubview:v56];

  v80 = [(MSDSupportViewController *)self optionsTableView];
  v77 = [v80 bottomAnchor];
  v75 = [v95 bottomAnchor];
  v73 = [v77 constraintEqualToAnchor:v75 constant:-30.0];
  v97[0] = v73;
  v71 = [(MSDSupportViewController *)self optionsTableView];
  v69 = [v71 leadingAnchor];
  v57 = [v95 leadingAnchor];
  v58 = [v69 constraintEqualToAnchor:v57];
  v97[1] = v58;
  v59 = [(MSDSupportViewController *)self optionsTableView];
  v60 = [v59 trailingAnchor];
  v61 = [v95 trailingAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  v97[2] = v62;
  v63 = [(MSDSupportViewController *)self optionsTableView];
  v64 = [v63 heightAnchor];
  v65 = [v64 constraintEqualToConstant:180.0];
  v97[3] = v65;
  v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:4];

  [MEMORY[0x263F08938] activateConstraints:v67];
  v66 = [(MSDSupportViewController *)self optionsTableView];
  [v66 registerClass:objc_opt_class() forCellReuseIdentifier:@"SupportViewTableCell"];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = a4;
  if ([v4 row] > 1)
  {
    v5 = 0;
    goto LABEL_9;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"SupportViewTableCell"];
  [v5 setAccessoryType:1];
  [v5 setSelectionStyle:2];
  v6 = [v5 defaultContentConfiguration];
  if (![v4 row])
  {
    v7 = @"DEVICE_DETAIL_OPTION";
    goto LABEL_7;
  }
  if ([v4 row] == 1)
  {
    v7 = @"PHONE_NUMBERS_OPTION";
LABEL_7:
    v8 = +[MSDSetupUILocalization localizedStringForKey:v7];
    [v6 setText:v8];
  }
  [v5 setContentConfiguration:v6];

LABEL_9:
  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 <= 0)
  {
    v6 = +[MSDSetupUILocalization localizedStringForKey:@"ADDITIONAL_INFORMATION_HEADER", v4];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  if ([v10 row] <= 1)
  {
    if ([v10 row])
    {
      if ([v10 row] != 1)
      {
LABEL_8:
        v9 = [(MSDSupportViewController *)self optionsTableView];
        [v9 deselectRowAtIndexPath:v10 animated:1];

        goto LABEL_9;
      }
      uint64_t v5 = off_264D87E80;
    }
    else
    {
      uint64_t v5 = &off_264D87F38;
    }
    id v6 = objc_alloc_init(*v5);
    if (v6)
    {
      v7 = v6;
      v8 = +[MSDSetupUIController sharedInstance];
      [v8 pushViewController:v7 andRemoveTopmostView:0];
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (id)_currentCountryStackView
{
  v30[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v4 = [(MSDSupportViewController *)self countryCode];
  v28 = [v3 localizedStringForCountryCode:v4];

  id v5 = objc_alloc(MEMORY[0x263F1C9B8]);
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
  [v10 setAxis:0];
  [v10 setDistribution:0];
  [v10 setAlignment:3];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setSpacing:10.0];
  id v11 = objc_alloc(MEMORY[0x263F1C6D0]);
  v12 = [MEMORY[0x263F1C6B0] systemImageNamed:@"globe"];
  objc_super v13 = (void *)[v11 initWithImage:v12];

  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [MEMORY[0x263F1C550] blackColor];
  [v13 setTintColor:v14];

  [v13 setContentMode:1];
  v15 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v6, v7, v8, v9);
  [v15 setNumberOfLines:0];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 setText:v28];
  v16 = [MEMORY[0x263F81708] boldSystemFontOfSize:22.0];
  [v15 setFont:v16];

  [v10 addArrangedSubview:v13];
  [v10 addArrangedSubview:v15];
  v17 = [v13 heightAnchor];
  v18 = [v17 constraintEqualToConstant:35.0];
  v30[0] = v18;
  v19 = [v13 widthAnchor];
  v20 = [v13 heightAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 multiplier:1.0];
  v30[1] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];

  [MEMORY[0x263F08938] activateConstraints:v22];
  v23 = [v15 centerYAnchor];
  v24 = [v13 centerYAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v29 = v25;
  id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];

  [MEMORY[0x263F08938] activateConstraints:v26];
  return v10;
}

- (OBWelcomeController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (UITableView)optionsTableView
{
  return self->_optionsTableView;
}

- (void)setOptionsTableView:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_optionsTableView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end