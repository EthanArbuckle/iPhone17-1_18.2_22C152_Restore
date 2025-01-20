@interface CACLanguageSelectionViewController
+ (id)defaultControllerWithStyle:(unint64_t)a3;
- (CACLanguageSelectionViewController)init;
- (CACUILanguageViewBridgeController)languageViewBridgeController;
- (NSArray)availableLocales;
- (UIViewController)languageViewController;
- (unint64_t)controllerStyle;
- (void)cacLanguageDownloadStartDownload:(id)a3;
- (void)cacLanguageDownloadStopDownload:(id)a3;
- (void)dealloc;
- (void)dismiss;
- (void)handleDownloadProgressChange;
- (void)handleErrorOccured:(id)a3;
- (void)languageDidChange;
- (void)selectedLanguageWithIdentifier:(id)a3;
- (void)setAvailableLocales:(id)a3;
- (void)setControllerStyle:(unint64_t)a3;
- (void)setLanguageViewBridgeController:(id)a3;
- (void)setLanguageViewController:(id)a3;
- (void)updateDownloadProgress;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CACLanguageSelectionViewController

+ (id)defaultControllerWithStyle:(unint64_t)a3
{
  v4 = objc_alloc_init(CACLanguageSelectionViewController);
  [(CACLanguageSelectionViewController *)v4 setControllerStyle:a3];
  return v4;
}

- (CACLanguageSelectionViewController)init
{
  v20.receiver = self;
  v20.super_class = (Class)CACLanguageSelectionViewController;
  v2 = [(CACLanguageSelectionViewController *)&v20 init];
  if (v2)
  {
    v3 = +[CACPreferences sharedPreferences];
    uint64_t v4 = [v3 userSelectableLocaleIdentifiers];
    availableLocales = v2->_availableLocales;
    v2->_availableLocales = (NSArray *)v4;

    v6 = +[CACLanguageAssetManager sharedManager];
    [v6 registerForCallback];

    uint64_t v7 = objc_opt_new();
    languageViewBridgeController = v2->_languageViewBridgeController;
    v2->_languageViewBridgeController = (CACUILanguageViewBridgeController *)v7;

    [(CACUILanguageViewBridgeController *)v2->_languageViewBridgeController setDelegate:v2];
    uint64_t v9 = [(CACUILanguageViewBridgeController *)v2->_languageViewBridgeController createLanguageViewControllerWithLocales:v2->_availableLocales];
    languageViewController = v2->_languageViewController;
    v2->_languageViewController = (UIViewController *)v9;

    v11 = +[CACLanguageAssetManager sharedManager];
    v12 = [v11 installationStatus];

    [(CACUILanguageViewBridgeController *)v2->_languageViewBridgeController updateInstallationStatus:v12];
    v13 = v2->_languageViewBridgeController;
    v14 = +[CACPreferences sharedPreferences];
    v15 = [v14 bestLocaleIdentifier];
    [(CACUILanguageViewBridgeController *)v13 setSelectedLanguageIdentifier:v15];

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v2 selector:sel_handleDownloadProgressChange name:@"CACNotificationAssetDownloadProgressChanged" object:0];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v2 selector:sel_handleErrorOccured_ name:@"CACNotificationAssetDownloadErrorOccured" object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_languageChanged, @"CACNotificationLanguageChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CACNotificationLanguageChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)CACLanguageSelectionViewController;
  [(CACLanguageSelectionViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v41[4] = *MEMORY[0x263EF8340];
  v40.receiver = self;
  v40.super_class = (Class)CACLanguageSelectionViewController;
  [(CACLanguageSelectionViewController *)&v40 viewDidLoad];
  v3 = [(CACLanguageSelectionViewController *)self view];
  objc_super v4 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(CACLanguageSelectionViewController *)self languageViewController];
  [(CACLanguageSelectionViewController *)self addChildViewController:v5];

  v6 = [(CACLanguageSelectionViewController *)self view];
  uint64_t v7 = [(CACLanguageSelectionViewController *)self languageViewController];
  v8 = [v7 view];
  [v6 addSubview:v8];

  uint64_t v9 = [(CACLanguageSelectionViewController *)self languageViewController];
  [v9 didMoveToParentViewController:self];

  v10 = [(CACLanguageSelectionViewController *)self languageViewController];
  v11 = [v10 view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(CACLanguageSelectionViewController *)self view];
  v13 = [v12 safeAreaLayoutGuide];

  v29 = (void *)MEMORY[0x263F08938];
  v38 = [(CACLanguageSelectionViewController *)self languageViewController];
  v37 = [v38 view];
  v36 = [v37 topAnchor];
  v35 = [v13 topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v41[0] = v34;
  v33 = [(CACLanguageSelectionViewController *)self languageViewController];
  v32 = [v33 view];
  v31 = [v32 bottomAnchor];
  v30 = [v13 bottomAnchor];
  v28 = [v31 constraintEqualToAnchor:v30];
  v41[1] = v28;
  v27 = [(CACLanguageSelectionViewController *)self languageViewController];
  v26 = [v27 view];
  v14 = [v26 leadingAnchor];
  v15 = [v13 leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v41[2] = v16;
  v17 = [(CACLanguageSelectionViewController *)self languageViewController];
  v18 = [v17 view];
  v19 = [v18 trailingAnchor];
  v39 = v13;
  objc_super v20 = [v13 trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v41[3] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:4];
  [v29 activateConstraints:v22];

  v23 = +[CACLocaleUtilities localizedUIStringForKey:@"LanguageSelection.Title"];
  [(CACLanguageSelectionViewController *)self setTitle:v23];

  if (![(CACLanguageSelectionViewController *)self controllerStyle])
  {
    v24 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismiss];
    v25 = [(CACLanguageSelectionViewController *)self navigationItem];
    [v25 setRightBarButtonItem:v24];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACLanguageSelectionViewController;
  [(CACLanguageSelectionViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(CACLanguageSelectionViewController *)self languageViewBridgeController];
  [v4 updateInstallationStatus:MEMORY[0x263EFFA78]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CACLanguageSelectionViewController;
  [(CACLanguageSelectionViewController *)&v3 viewDidAppear:a3];
}

- (void)selectedLanguageWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[CACPreferences sharedPreferences];
  [v4 setLocaleIdentifier:v3];
}

- (void)dismiss
{
}

- (void)languageDidChange
{
  id v3 = +[CACPreferences sharedPreferences];
  id v5 = [v3 bestLocaleIdentifier];

  id v4 = [(CACLanguageSelectionViewController *)self languageViewBridgeController];
  [v4 setSelectedLanguageIdentifier:v5];
}

- (void)handleDownloadProgressChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__CACLanguageSelectionViewController_handleDownloadProgressChange__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __66__CACLanguageSelectionViewController_handleDownloadProgressChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDownloadProgress];
}

- (void)updateDownloadProgress
{
  id v3 = +[CACLanguageAssetManager sharedManager];
  id v5 = [v3 downloadProgress];

  id v4 = [(CACLanguageSelectionViewController *)self languageViewBridgeController];
  [v4 updateDownloadStatus:v5];
}

- (void)handleErrorOccured:(id)a3
{
  id v4 = [a3 object];
  id v5 = CACLogAssetDownload();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CACLanguageSelectionViewController handleErrorOccured:]((uint64_t)v4, v5);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CACLanguageSelectionViewController_handleErrorOccured___block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__CACLanguageSelectionViewController_handleErrorOccured___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDownloadProgress];
}

- (void)cacLanguageDownloadStartDownload:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = CACLogAssetDownload();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_238377000, v4, OS_LOG_TYPE_DEFAULT, "Start download for language %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)cacLanguageDownloadStopDownload:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = CACLogAssetDownload();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_238377000, v4, OS_LOG_TYPE_DEFAULT, "Stop download for language %@", (uint8_t *)&v5, 0xCu);
  }
}

- (unint64_t)controllerStyle
{
  return self->_controllerStyle;
}

- (void)setControllerStyle:(unint64_t)a3
{
  self->_controllerStyle = a3;
}

- (CACUILanguageViewBridgeController)languageViewBridgeController
{
  return self->_languageViewBridgeController;
}

- (void)setLanguageViewBridgeController:(id)a3
{
}

- (UIViewController)languageViewController
{
  return self->_languageViewController;
}

- (void)setLanguageViewController:(id)a3
{
}

- (NSArray)availableLocales
{
  return self->_availableLocales;
}

- (void)setAvailableLocales:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableLocales, 0);
  objc_storeStrong((id *)&self->_languageViewController, 0);
  objc_storeStrong((id *)&self->_languageViewBridgeController, 0);
}

- (void)handleErrorOccured:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Error occured in language download for %@", (uint8_t *)&v2, 0xCu);
}

@end