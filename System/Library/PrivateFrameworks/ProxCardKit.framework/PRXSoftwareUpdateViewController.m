@interface PRXSoftwareUpdateViewController
- (BOOL)offsetIcon;
- (void)installSettingsIcon;
- (void)setOffsetIcon:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PRXSoftwareUpdateViewController

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)PRXSoftwareUpdateViewController;
  [(PRXCardContentViewController *)&v20 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 localizedStringForKey:@"SOFTWARE_UPDATE" value:&stru_26CCF1BC8 table:0];
  [(PRXCardContentViewController *)self setTitle:v4];

  BOOL v5 = PRXIsPad();
  v6 = @"SOFTWARE_UPDATE_SUBTITLE_IOS";
  if (v5) {
    v6 = @"SOFTWARE_UPDATE_SUBTITLE_IPADOS";
  }
  v7 = v6;
  v8 = [MEMORY[0x263F086E0] mainBundle];
  v9 = [v8 localizedStringForKey:v7 value:&stru_26CCF1BC8 table:0];
  [(PRXCardContentViewController *)self setSubtitle:v9];

  [(PRXCardContentViewController *)self setDismissalType:3];
  id location = 0;
  objc_initWeak(&location, self);
  v10 = [MEMORY[0x263F086E0] mainBundle];
  v11 = [v10 localizedStringForKey:@"CHECK_FOR_UPDATE" value:&stru_26CCF1BC8 table:0];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __46__PRXSoftwareUpdateViewController_viewDidLoad__block_invoke;
  v17 = &unk_2644182D0;
  objc_copyWeak(&v18, &location);
  v12 = +[PRXAction actionWithTitle:v11 style:0 handler:&v14];

  id v13 = -[PRXCardContentViewController addAction:](self, "addAction:", v12, v14, v15, v16, v17);
  [(PRXSoftwareUpdateViewController *)self installSettingsIcon];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __46__PRXSoftwareUpdateViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:&__block_literal_global_0];
}

void __46__PRXSoftwareUpdateViewController_viewDidLoad__block_invoke_2()
{
  v25[2] = *MEMORY[0x263EF8340];
  v0 = [NSURL URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK&ShowDefaultAudiencePane=YES"];
  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x2020000000;
  v1 = (id *)getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  uint64_t v22 = getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_block_invoke;
    v17 = &unk_2644182F8;
    id v18 = &v19;
    v2 = (void *)FrontBoardServicesLibrary();
    v20[3] = (uint64_t)dlsym(v2, "FBSOpenApplicationOptionKeyUnlockDevice");
    getFBSOpenApplicationOptionKeyUnlockDeviceSymbolLoc_ptr = *(void *)(v18[1] + 24);
    v1 = (id *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v1) {
    goto LABEL_10;
  }
  id v3 = *v1;
  id v23 = v3;
  uint64_t v4 = MEMORY[0x263EFFA88];
  v25[0] = MEMORY[0x263EFFA88];
  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x2020000000;
  BOOL v5 = (id *)getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  uint64_t v22 = getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr;
  if (!getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_block_invoke;
    v17 = &unk_2644182F8;
    id v18 = &v19;
    v6 = (void *)FrontBoardServicesLibrary();
    v20[3] = (uint64_t)dlsym(v6, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
    getFBSOpenApplicationOptionKeyPromptUnlockDeviceSymbolLoc_ptr = *(void *)(v18[1] + 24);
    BOOL v5 = (id *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v5)
  {
LABEL_10:
    __46__PRXSoftwareUpdateViewController_viewDidLoad__block_invoke_2_cold_1();
    __break(1u);
  }
  id v24 = *v5;
  v25[1] = v4;
  v7 = NSDictionary;
  id v8 = v24;
  v9 = [v7 dictionaryWithObjects:v25 forKeys:&v23 count:2];

  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v10 = (void *)getLSApplicationWorkspaceClass_softClass;
  uint64_t v22 = getLSApplicationWorkspaceClass_softClass;
  if (!getLSApplicationWorkspaceClass_softClass)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __getLSApplicationWorkspaceClass_block_invoke;
    v17 = &unk_2644182F8;
    id v18 = &v19;
    __getLSApplicationWorkspaceClass_block_invoke((uint64_t)&v14);
    v10 = (void *)v20[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v19, 8);
  v12 = [v11 defaultWorkspace];
  uint64_t v13 = 0;
  [v12 openSensitiveURL:v0 withOptions:v9 error:&v13];
}

- (void)installSettingsIcon
{
  v77[17] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1C778]);
  uint64_t v4 = [(PRXCardContentViewController *)self contentView];
  [v4 addLayoutGuide:v3];

  v76 = [MEMORY[0x263F1C6B0] imageNamed:@"Settings"];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v76];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(PRXCardContentViewController *)self contentView];
  [v6 addSubview:v5];

  id v7 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [MEMORY[0x263F1C550] systemRedColor];
  [v7 setBackgroundColor:v8];

  v9 = [v7 layer];
  [v9 setCornerRadius:19.0];

  v10 = [(PRXCardContentViewController *)self contentView];
  [v10 addSubview:v7];

  id v11 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [MEMORY[0x263F08A30] localizedStringFromNumber:&unk_26CCFC100 numberStyle:0];
  [v11 setText:v12];

  uint64_t v13 = [MEMORY[0x263F1C550] whiteColor];
  [v11 setTextColor:v13];

  [v11 setTextAlignment:1];
  uint64_t v14 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D270]];
  v75 = objc_msgSend(v14, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v14, "symbolicTraits") | 2);

  uint64_t v15 = [MEMORY[0x263F1C658] fontWithDescriptor:v75 size:25.0];
  [v11 setFont:v15];

  [v7 addSubview:v11];
  if ([(PRXSoftwareUpdateViewController *)self offsetIcon]) {
    double v16 = 30.0 - 20.0;
  }
  else {
    double v16 = 0.0;
  }
  v17 = [(PRXCardContentViewController *)self contentView];
  id v18 = [v17 mainContentGuide];

  v51 = (void *)MEMORY[0x263F08938];
  v74 = [v3 centerXAnchor];
  v73 = [v18 centerXAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v77[0] = v72;
  v70 = [v3 topAnchor];
  v71 = v18;
  v69 = [v18 topAnchor];
  v68 = [v70 constraintEqualToAnchor:v69 constant:v16];
  v77[1] = v68;
  v67 = [v3 bottomAnchor];
  v66 = [v18 bottomAnchor];
  v65 = [v67 constraintLessThanOrEqualToAnchor:v66];
  v77[2] = v65;
  v64 = [v5 leadingAnchor];
  v63 = [v3 leadingAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v77[3] = v62;
  v60 = [v5 trailingAnchor];
  v59 = [v3 trailingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59 constant:-11.0];
  v77[4] = v58;
  v56 = [v5 topAnchor];
  v55 = [v3 topAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:11.0];
  v77[5] = v54;
  v61 = v5;
  v53 = [v5 bottomAnchor];
  v52 = [v3 bottomAnchor];
  v50 = [v53 constraintEqualToAnchor:v52];
  v77[6] = v50;
  v49 = [v5 widthAnchor];
  v48 = [v49 constraintEqualToConstant:104.0];
  v77[7] = v48;
  v47 = [v5 heightAnchor];
  v46 = [v5 widthAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v77[8] = v45;
  v43 = [v7 topAnchor];
  v57 = v3;
  v42 = [v3 topAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v77[9] = v41;
  uint64_t v19 = v7;
  v40 = [v7 trailingAnchor];
  v39 = [v3 trailingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v77[10] = v38;
  v37 = [v7 widthAnchor];
  v36 = [v37 constraintEqualToConstant:38.0];
  v77[11] = v36;
  v35 = [v7 heightAnchor];
  v34 = [v7 widthAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v77[12] = v33;
  v32 = [v11 leadingAnchor];
  v31 = [v7 leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v77[13] = v30;
  v29 = [v11 topAnchor];
  objc_super v20 = [v7 topAnchor];
  uint64_t v21 = [v29 constraintEqualToAnchor:v20];
  v77[14] = v21;
  v44 = v11;
  uint64_t v22 = [v11 bottomAnchor];
  id v23 = [v7 bottomAnchor];
  id v24 = [v22 constraintEqualToAnchor:v23];
  v77[15] = v24;
  v25 = [v11 trailingAnchor];
  v26 = [v19 trailingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v77[16] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:17];
  [v51 activateConstraints:v28];
}

- (BOOL)offsetIcon
{
  return self->_offsetIcon;
}

- (void)setOffsetIcon:(BOOL)a3
{
  self->_offsetIcon = a3;
}

uint64_t __46__PRXSoftwareUpdateViewController_viewDidLoad__block_invoke_2_cold_1()
{
  return __getLSApplicationWorkspaceClass_block_invoke_cold_1();
}

@end