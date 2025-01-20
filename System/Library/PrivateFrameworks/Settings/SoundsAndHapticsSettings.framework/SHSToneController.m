@interface SHSToneController
- (SHSToneController)init;
- (TKTonePickerViewController)tonePickerViewController;
- (TKVibrationPickerViewController)vibrationPickerViewController;
- (id)_defaultToneIdentifierForTonePickerWithAlertType:(int64_t)a3 topic:(id)a4;
- (id)_defaultVibrationIdentifierForVibrationPickerWithAlertType:(int64_t)a3 topic:(id)a4;
- (void)_handleAlertOverridePolicyDidChangeNotification:(id)a3;
- (void)_insertTonePickerView;
- (void)_updateReloadSpecifierInParentController;
- (void)dealloc;
- (void)setSpecifier:(id)a3;
- (void)setTonePickerViewController:(id)a3;
- (void)setVibrationPickerViewController:(id)a3;
- (void)tonePickerViewController:(id)a3 didDismissVibrationPickerViewController:(id)a4;
- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4;
- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4;
- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SHSToneController

- (SHSToneController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SHSToneController;
  v2 = [(SHSToneController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleAlertOverridePolicyDidChangeNotification_ name:*MEMORY[0x263F7FD88] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F7FD88] object:0];
  v4 = [(SHSToneController *)self tonePickerViewController];
  [v4 willMoveToParentViewController:0];
  if ([v4 isViewLoaded])
  {
    objc_super v5 = [v4 view];
    [v5 removeFromSuperview];
  }
  [v4 removeFromParentViewController];
  [v4 setDelegate:0];

  v6.receiver = self;
  v6.super_class = (Class)SHSToneController;
  [(SHSToneController *)&v6 dealloc];
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SHSToneController;
  [(SHSToneController *)&v17 setSpecifier:v4];
  objc_super v5 = [v4 name];
  [(SHSToneController *)self setTitle:v5];

  objc_super v6 = [v4 propertyForKey:@"alertType"];
  if (v6)
  {
    v7 = [(SHSToneController *)self tonePickerViewController];

    if (!v7)
    {
      uint64_t v8 = TLAlertTypeFromString();
      v9 = [(SHSToneController *)self view];
      int v10 = PSShouldInsetListView();

      if (v10) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 1;
      }
      v12 = (void *)[objc_alloc(MEMORY[0x263F7FC58]) _initWithAlertType:v8 tableViewStyle:v11];
      v13 = [v4 propertyForKey:@"accountIdentifier"];
      if (v13) {
        [v12 setTopic:v13];
      }
      if (v8 == 1)
      {
        [v12 setShowsNone:0];
      }
      else
      {
        [v12 setShowsNone:1];
        [v12 setNoneAtTop:1];
      }
      v14 = [(SHSToneController *)self _defaultToneIdentifierForTonePickerWithAlertType:v8 topic:v13];
      [v12 setDefaultToneIdentifier:v14];

      v15 = [MEMORY[0x263F7FC90] sharedToneManager];
      v16 = [v15 currentToneIdentifierForAlertType:v8 topic:v13];
      [v12 setSelectedToneIdentifier:v16];

      [v12 setShowsVibrations:1];
      [v12 setDelegate:self];
      [(SHSToneController *)self setTonePickerViewController:v12];
      [(SHSToneController *)self addChildViewController:v12];
      if ([(SHSToneController *)self isViewLoaded]) {
        [(SHSToneController *)self _insertTonePickerView];
      }
      [v12 didMoveToParentViewController:self];
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SHSToneController;
  [(SHSToneController *)&v3 viewDidLoad];
  [(SHSToneController *)self _insertTonePickerView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v33.receiver = self;
  v33.super_class = (Class)SHSToneController;
  [(SHSToneController *)&v33 viewDidAppear:a3];
  id v4 = [MEMORY[0x263EFF980] array];
  objc_super v5 = objc_msgSend(MEMORY[0x263F08DB0], "shs_rootPaneComponent");
  [v4 addObject:v5];

  objc_super v6 = [(SHSToneController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v8 = (void *)MEMORY[0x263F08DB0];
  if (isKindOfClass)
  {
    v9 = [(SHSToneController *)self parentController];
    int v10 = [v9 specifier];
    uint64_t v11 = objc_msgSend(v8, "shs_localizedPathComponentForTonePickerSpecifier:", v10);

    if (v11) {
      [v4 addObject:v11];
    }
    id v12 = objc_alloc(MEMORY[0x263F08DB0]);
    v13 = [(SHSToneController *)self specifier];
    v14 = [v13 name];
    v15 = [MEMORY[0x263EFF960] currentLocale];
    SHS_BundleForSoundsAndHapticsSettingsFramework();
    v16 = v32 = v4;
    objc_super v17 = [v16 bundleURL];
    v18 = (void *)[v12 initWithKey:&stru_26EA42AA8 defaultValue:v14 table:0 locale:v15 bundleURL:v17];

    v19 = NSURL;
    v20 = NSString;
    v21 = [(SHSToneController *)self parentController];
    v22 = [v21 specifier];
    v23 = [v22 identifier];
    v24 = [(SHSToneController *)self specifier];
    v25 = [v24 identifier];
    v26 = [v20 stringWithFormat:@"settings-navigation://com.apple.Settings.Sounds/%@/%@", v23, v25];
    v27 = [v19 URLWithString:v26];

    id v4 = v32;
  }
  else
  {
    v28 = [(SHSToneController *)self specifier];
    v18 = objc_msgSend(v8, "shs_localizedPathComponentForTonePickerSpecifier:", v28);

    if (!v18)
    {
      v29 = SHSLogForCategory(0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[SHSToneController viewDidAppear:](self, v29);
      }
    }
    v30 = NSURL;
    v31 = NSString;
    uint64_t v11 = [(SHSToneController *)self specifier];
    v21 = [v11 identifier];
    v22 = [v31 stringWithFormat:@"settings-navigation://com.apple.Settings.Sounds/%@", v21];
    v27 = [v30 URLWithString:v22];
  }

  if ([(SHSToneController *)self isMemberOfClass:objc_opt_class()] && v18) {
    [(SHSToneController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.sound" title:v18 localizedNavigationComponents:v4 deepLink:v27];
  }
}

- (void)_insertTonePickerView
{
  id v11 = [(SHSToneController *)self view];
  objc_super v3 = [(SHSToneController *)self tonePickerViewController];
  id v4 = [v3 view];
  [v11 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
  objc_super v5 = [MEMORY[0x263F82670] currentDevice];
  int v6 = objc_msgSend(v5, "sf_isiPad");

  if (v6)
  {
    PSTableViewSideInset();
    double v8 = v7;
    double v9 = *MEMORY[0x263F839B8];
    int v10 = [v3 tableView];
    objc_msgSend(v10, "_setSectionContentInset:", v9, v8, v9, v8);
  }
  [v11 addSubview:v4];
}

- (void)_updateReloadSpecifierInParentController
{
  id v5 = [(SHSToneController *)self parentController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v5;
    id v4 = [(SHSToneController *)self specifier];
    [v3 reloadSpecifier:v4];
  }
}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  int v6 = (void *)MEMORY[0x263F7FC90];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 sharedToneManager];
  uint64_t v10 = [v8 alertType];
  id v11 = [v8 topic];

  [v9 setCurrentToneIdentifier:v7 forAlertType:v10 topic:v11];
  [(SHSToneController *)self _updateReloadSpecifierInParentController];
}

- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  [v10 setShowsDefault:0];
  [v10 setShowsUserGenerated:1];
  [v10 setShowsNone:1];
  [v10 setShowsEditButtonInNavigationBar:1];
  uint64_t v7 = [v6 alertType];
  id v8 = [v6 topic];

  double v9 = [(SHSToneController *)self _defaultVibrationIdentifierForVibrationPickerWithAlertType:v7 topic:v8];
  [v10 setDefaultVibrationIdentifier:v9];

  [v10 setAllowsDeletingDefaultVibration:1];
  [v10 setDelegate:self];
  [(SHSToneController *)self setVibrationPickerViewController:v10];
}

- (void)tonePickerViewController:(id)a3 didDismissVibrationPickerViewController:(id)a4
{
  [a4 setDelegate:0];
  [(SHSToneController *)self setVibrationPickerViewController:0];
}

- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4
{
  id v6 = (void *)MEMORY[0x263F7FCA0];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 sharedVibrationManager];
  uint64_t v10 = [v8 alertType];
  id v11 = [v8 topic];

  [v9 setCurrentVibrationIdentifier:v7 forAlertType:v10 topic:v11];
  [(SHSToneController *)self _updateReloadSpecifierInParentController];
}

- (void)_handleAlertOverridePolicyDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__SHSToneController__handleAlertOverridePolicyDidChangeNotification___block_invoke;
  block[3] = &unk_264CD01F8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__SHSToneController__handleAlertOverridePolicyDidChangeNotification___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) tonePickerViewController];
  uint64_t v2 = [v9 alertType];
  id v3 = [v9 topic];
  id v4 = [*(id *)(a1 + 32) _defaultToneIdentifierForTonePickerWithAlertType:v2 topic:v3];
  [v9 setDefaultToneIdentifier:v4];

  id v5 = [MEMORY[0x263F7FC90] sharedToneManager];
  id v6 = [v5 currentToneIdentifierForAlertType:v2 topic:v3];
  [v9 setSelectedToneIdentifier:v6];

  if (v3)
  {
    id v7 = [*(id *)(a1 + 32) vibrationPickerViewController];
    id v8 = [*(id *)(a1 + 32) _defaultVibrationIdentifierForVibrationPickerWithAlertType:v2 topic:v3];
    [v7 setDefaultVibrationIdentifier:v8];
  }
}

- (id)_defaultToneIdentifierForTonePickerWithAlertType:(int64_t)a3 topic:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x263F7FC90] sharedToneManager];
  id v7 = [v6 defaultToneIdentifierForAlertType:a3];

  if (v5)
  {
    id v8 = [MEMORY[0x263F7FC90] sharedToneManager];
    int v9 = [v8 hasSpecificDefaultToneIdentifierForAlertType:a3 topic:v5];

    uint64_t v10 = [MEMORY[0x263F7FC90] sharedToneManager];
    id v11 = v10;
    if (v9) {
      [v10 defaultToneIdentifierForAlertType:a3 topic:v5];
    }
    else {
    uint64_t v12 = [v10 currentToneIdentifierForAlertType:a3];
    }

    id v7 = (void *)v12;
  }

  return v7;
}

- (id)_defaultVibrationIdentifierForVibrationPickerWithAlertType:(int64_t)a3 topic:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
  id v7 = [v6 defaultVibrationIdentifierForAlertType:a3];

  if (v5)
  {
    id v8 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
    int v9 = [v8 hasSpecificDefaultVibrationIdentifierForAlertType:a3 topic:v5];

    uint64_t v10 = [MEMORY[0x263F7FCA0] sharedVibrationManager];
    id v11 = v10;
    if (v9) {
      [v10 defaultVibrationIdentifierForAlertType:a3 topic:v5];
    }
    else {
    uint64_t v12 = [v10 currentVibrationIdentifierForAlertType:a3];
    }

    id v7 = (void *)v12;
  }

  return v7;
}

- (TKTonePickerViewController)tonePickerViewController
{
  return self->_tonePickerViewController;
}

- (void)setTonePickerViewController:(id)a3
{
}

- (TKVibrationPickerViewController)vibrationPickerViewController
{
  return self->_vibrationPickerViewController;
}

- (void)setVibrationPickerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrationPickerViewController, 0);
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);
}

- (void)viewDidAppear:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [a1 specifier];
  int v4 = 136315394;
  id v5 = "-[SHSToneController viewDidAppear:]";
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl(&dword_237305000, a2, OS_LOG_TYPE_ERROR, "%s shs_localizedPathComponentForTonePickerSpecifier returned nil for specifier: %@", (uint8_t *)&v4, 0x16u);
}

@end