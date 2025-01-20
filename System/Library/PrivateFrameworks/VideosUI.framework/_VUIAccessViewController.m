@interface _VUIAccessViewController
- (CGSize)_iconSize;
- (_VUIAccessViewController)init;
- (_VUIAccessViewController)initWithBundleIDs:(id)a3 channels:(id)a4 consentCancelButtonType:(unint64_t)a5 options:(id)a6 completionHandler:(id)a7;
- (id)_imageForBundleID:(id)a3;
- (id)_watchListAppIcon;
- (id)cappedTraitCollection;
- (id)completionHandler;
- (id)preferredFocusEnvironments;
- (void)_allow:(id)a3;
- (void)_completeWithStatus:(unint64_t)a3;
- (void)_disallow:(id)a3;
- (void)_fetchRemoteAppInfo;
- (void)_handleMenuGesture:(id)a3;
- (void)_handleNackButton:(id)a3;
- (void)_handleSeeAllButton:(id)a3;
- (void)_init;
- (void)_presentGenericErrorWithCompletion:(id)a3;
- (void)_setupAccessViews;
- (void)_setupNavigationBar;
- (void)_toggleLoadingScreen;
- (void)setCompletionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation _VUIAccessViewController

- (_VUIAccessViewController)initWithBundleIDs:(id)a3 channels:(id)a4 consentCancelButtonType:(unint64_t)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)_VUIAccessViewController;
  v16 = [(_VUIAccessViewController *)&v24 init];
  if (v16)
  {
    uint64_t v17 = objc_opt_new();
    bundleIDs = v16->_bundleIDs;
    v16->_bundleIDs = (NSMutableArray *)v17;

    uint64_t v19 = objc_opt_new();
    channelIds = v16->_channelIds;
    v16->_channelIds = (NSMutableArray *)v19;

    if ([v12 count]) {
      [(NSMutableArray *)v16->_bundleIDs addObjectsFromArray:v12];
    }
    objc_storeStrong((id *)&v16->_options, a6);
    NSLog(&cfstr_Vuiaccessviewc.isa, v16->_options);
    v16->_consentCancelButtonType = a5;
    objc_storeStrong((id *)&v16->_channels, a4);
    uint64_t v21 = [v15 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = (id)v21;

    [(_VUIAccessViewController *)v16 _init];
  }

  return v16;
}

- (_VUIAccessViewController)init
{
  return 0;
}

- (void)_init
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1E2BD7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[VUIAccessViewController]: Nil icon for TV.app", v0, 2u);
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)_VUIAccessViewController;
  [(_VUIAccessViewController *)&v26 viewDidLoad];
  [(_VUIAccessViewController *)self _setupNavigationBar];
  v3 = objc_alloc_init(VUIAppSpinnerView);
  loadingView = self->_loadingView;
  self->_loadingView = v3;

  [(VUIAppSpinnerView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(_VUIAccessViewController *)self view];
  [v5 addSubview:self->_loadingView];

  v6 = [(VUIAppSpinnerView *)self->_loadingView leadingAnchor];
  v7 = [(_VUIAccessViewController *)self view];
  v8 = [v7 leadingAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [(VUIAppSpinnerView *)self->_loadingView topAnchor];
  v11 = [(_VUIAccessViewController *)self view];
  id v12 = [v11 topAnchor];
  id v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  id v14 = [(VUIAppSpinnerView *)self->_loadingView trailingAnchor];
  id v15 = [(_VUIAccessViewController *)self view];
  v16 = [v15 trailingAnchor];
  uint64_t v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [(VUIAppSpinnerView *)self->_loadingView bottomAnchor];
  uint64_t v19 = [(_VUIAccessViewController *)self view];
  v20 = [v19 bottomAnchor];
  uint64_t v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  NSUInteger v22 = [(NSArray *)self->_appChannels count];
  v23 = self->_loadingView;
  if (v22)
  {
    [(VUIAppSpinnerView *)v23 setHidden:0];
    [(_VUIAccessViewController *)self _fetchRemoteAppInfo];
  }
  else
  {
    [(VUIAppSpinnerView *)v23 setHidden:1];
    [(_VUIAccessViewController *)self _setupAccessViews];
  }
  objc_super v24 = [(_VUIAccessViewController *)self view];
  v25 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library.id=\"Access\""];
  [v24 setAccessibilityIdentifier:v25];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)_VUIAccessViewController;
  [(_VUIAccessViewController *)&v11 viewDidAppear:a3];
  v4 = [(VUIAccessView_iOS *)self->_accessView bodyScroll];
  [v4 flashScrollIndicators];

  id v14 = @"appIds";
  bundleIDs = self->_bundleIDs;
  if (bundleIDs)
  {
    v6 = [(NSMutableArray *)self->_bundleIDs componentsJoinedByString:@", "];
  }
  else
  {
    v6 = &stru_1F3E921E0;
  }
  v15[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  if (bundleIDs) {

  }
  v8 = +[VUIMetricsController sharedInstance];
  id v12 = @"pageDetails";
  id v13 = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v10 = +[VUIMetricsPageEventData createWithPageId:@"VPPA" andPageType:@"VPPA" andEventData:v9];
  [v8 recordPage:v10];
}

- (void)_allow:(id)a3
{
  v4 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"requireVPPAStateUpdate"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [MEMORY[0x1E4FB5088] sharedInstance];
    [v6 _invalidateCache];
  }
  v7 = [(_VUIAccessViewController *)self navigationItem];
  v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:0];

  [(_VUIAccessViewController *)self _toggleLoadingScreen];
  v9 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"NewVPPAConsentPrompt"];
  objc_opt_class();
  char v10 = 0;
  if (objc_opt_isKindOfClass()) {
    char v10 = [v9 BOOLValue] ^ 1;
  }
  objc_initWeak(&location, self);
  objc_super v11 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___VUIAccessViewController__allow___block_invoke;
  block[3] = &unk_1E6DF5330;
  objc_copyWeak(&v13, &location);
  char v14 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_disallow:(id)a3
{
  [(_VUIAccessViewController *)self _toggleLoadingScreen];
  if (self->_shouldDenyOnCancel)
  {
    v4 = [(_VUIAccessViewController *)self navigationItem];
    [v4 setRightBarButtonItem:0];
  }
  objc_initWeak(&location, self);
  int v5 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38___VUIAccessViewController__disallow___block_invoke;
  v6[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_handleSeeAllButton:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(VUIAppsGridViewController);
  [(_VUIAccessViewController *)self _iconSize];
  -[VUIAppsGridViewController setIconSize:](v4, "setIconSize:");
  [(VUIAppsGridViewController *)v4 setApps:self->_appInfos];
  int v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 2)
  {
    [(_VUIAccessViewController *)self presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    id v7 = [(_VUIAccessViewController *)self navigationController];
    [v7 pushViewController:v4 animated:1];
  }
  v8 = +[VUIMetricsController sharedInstance];
  v10[0] = @"targetId";
  v10[1] = @"targetType";
  v11[0] = @"seeAll";
  v11[1] = @"button";
  v10[2] = @"actionType";
  v11[2] = @"seeAll";
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v8 recordClick:v9];
}

- (void)_handleMenuGesture:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  if (!+[VUIAccessViewController isHostedInRemoteViewService])[(_VUIAccessViewController *)self _completeWithStatus:0]; {
  v4 = +[VUIMetricsController sharedInstance];
  }
  v9[0] = @"targetId";
  v9[1] = @"targetType";
  v10[0] = @"cancel";
  v10[1] = @"button";
  v10[2] = @"cancel";
  v9[2] = @"actionType";
  v9[3] = @"actionDetails";
  id v7 = @"button";
  v8 = @"menu";
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  void v10[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  [v4 recordClick:v6];
}

- (void)_handleNackButton:(id)a3
{
  v6[3] = *MEMORY[0x1E4F143B8];
  [(_VUIAccessViewController *)self _completeWithStatus:2];
  v3 = +[VUIMetricsController sharedInstance];
  v5[0] = @"targetId";
  v5[1] = @"targetType";
  v6[0] = @"cancel";
  v6[1] = @"button";
  v5[2] = @"actionType";
  v6[2] = @"cancel";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v3 recordClick:v4];
}

- (void)_completeWithStatus:(unint64_t)a3
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  uint64_t v6 = __48___VUIAccessViewController__completeWithStatus___block_invoke;
  id v7 = &unk_1E6DF6668;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a3;
  v4 = v5;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v6((uint64_t)v4);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)_setupNavigationBar
{
  if (self->_consentCancelButtonType == 1)
  {
    v3 = +[VUILocalizationManager sharedInstance];
    v4 = v3;
    int v5 = @"ACCESS_CANCEL";
  }
  else
  {
    BOOL shouldDenyOnCancel = self->_shouldDenyOnCancel;
    v3 = +[VUILocalizationManager sharedInstance];
    v4 = v3;
    if (shouldDenyOnCancel) {
      int v5 = @"ACCESS_DENY_FINAL";
    }
    else {
      int v5 = @"ACCESS_DENY";
    }
  }
  id v9 = [v3 localizedStringForKey:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v9 style:0 target:self action:sel__disallow_];
  v8 = [(_VUIAccessViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  [v7 setAccessibilityIdentifier:@"UIA.TV.Button.access.disallow"];
}

- (void)_setupAccessViews
{
  v3 = [[VUIAccessView_iOS alloc] initWithApps:self->_appInfos];
  accessView = self->_accessView;
  self->_accessView = v3;

  [(VUIAccessView_iOS *)self->_accessView setTranslatesAutoresizingMaskIntoConstraints:0];
  int v5 = [(_VUIAccessViewController *)self view];
  [v5 addSubview:self->_accessView];

  uint64_t v6 = [(VUIAccessView_iOS *)self->_accessView leadingAnchor];
  id v7 = [(_VUIAccessViewController *)self view];
  v8 = [v7 leadingAnchor];
  id v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  char v10 = [(VUIAccessView_iOS *)self->_accessView topAnchor];
  objc_super v11 = [(_VUIAccessViewController *)self view];
  id v12 = [v11 topAnchor];
  id v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  char v14 = [(VUIAccessView_iOS *)self->_accessView trailingAnchor];
  id v15 = [(_VUIAccessViewController *)self view];
  v16 = [v15 trailingAnchor];
  uint64_t v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [(VUIAccessView_iOS *)self->_accessView bottomAnchor];
  uint64_t v19 = [(_VUIAccessViewController *)self view];
  v20 = [v19 bottomAnchor];
  uint64_t v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  NSUInteger v22 = [(VUIAccessView_iOS *)self->_accessView allowButton];
  [v22 addTarget:self action:sel__allow_ forControlEvents:0x2000];

  v23 = [(VUIAccessView_iOS *)self->_accessView seeAllButton];
  [v23 addTarget:self action:sel__handleSeeAllButton_ forControlEvents:0x2000];

  objc_super v24 = [(VUIAccessView_iOS *)self->_accessView nackButton];
  [v24 addTarget:self action:sel__handleNackButton_ forControlEvents:0x2000];

  NSUInteger v25 = [(NSArray *)self->_appInfos count];
  id v57 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"title"];
  objc_super v26 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"body"];
  v27 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"secondaryBody"];
  v28 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"account"];
  if ([v57 length])
  {
    id v29 = v57;
  }
  else
  {
    if (v25 == 2)
    {
      v34 = +[VUILocalizationManager sharedInstance];
      v31 = [v34 localizedStringForKey:@"ACCESS_MAIN_TITLE_PLURAL_2_FORMAT"];

      v35 = [(NSArray *)self->_appInfos firstObject];
      v33 = [v35 objectForKeyedSubscript:@"appName"];

      v36 = [(NSArray *)self->_appInfos lastObject];
      uint64_t v37 = [v36 objectForKeyedSubscript:@"appName"];

      uint64_t v38 = [NSString stringWithValidatedFormat:v31, @"%@ %@", 0, v33, v37 validFormatSpecifiers error];

      v39 = (void *)v37;
    }
    else
    {
      v30 = +[VUILocalizationManager sharedInstance];
      if (v25 == 1)
      {
        v31 = [v30 localizedStringForKey:@"ACCESS_MAIN_TITLE_SINGULAR_FORMAT"];

        v32 = [(NSArray *)self->_appInfos firstObject];
        v33 = [v32 objectForKeyedSubscript:@"appName"];

        [NSString stringWithValidatedFormat:v31, @"%@", 0, v33 validFormatSpecifiers error];
      }
      else
      {
        v31 = [v30 localizedStringForKey:@"ACCESS_MAIN_TITLE_PLURAL_3+_FORMAT"];

        v40 = [(NSArray *)self->_appInfos firstObject];
        v33 = [v40 objectForKeyedSubscript:@"appName"];

        objc_msgSend(NSString, "localizedStringWithFormat:", v31, v33, (v25 - 1));
      uint64_t v38 = };
      v39 = v57;
    }

    id v29 = (id)v38;
  }
  id v58 = v29;
  -[VUIAccessView_iOS setTitle:](self->_accessView, "setTitle:");
  if (![v26 length])
  {
    v41 = +[VUILocalizationManager sharedInstance];
    uint64_t v42 = [v41 localizedStringForKey:@"ACCESS_BODY_TEXT"];

    objc_super v26 = (void *)v42;
  }
  [(VUIAccessView_iOS *)self->_accessView setBody:v26];
  if (![v27 length])
  {
    if (v25 == 2)
    {
      v47 = +[VUILocalizationManager sharedInstance];
      v44 = [v47 localizedStringForKey:@"ACCESS_SECONDARY_BODY_PLURAL_2_FORMAT"];

      v48 = [(NSArray *)self->_appInfos firstObject];
      v46 = [v48 objectForKeyedSubscript:@"appName"];

      v49 = [(NSArray *)self->_appInfos lastObject];
      uint64_t v50 = [v49 objectForKeyedSubscript:@"appName"];

      uint64_t v51 = [NSString stringWithValidatedFormat:v44, @"%@ %@ %@", 0, v46, v50, v28 validFormatSpecifiers error];

      v27 = (void *)v50;
    }
    else
    {
      +[VUILocalizationManager sharedInstance];
      if (v25 == 1) {
        v43 = {;
      }
        v44 = [v43 localizedStringForKey:@"ACCESS_SECONDARY_BODY_SINGULAR_FORMAT"];

        v45 = [(NSArray *)self->_appInfos firstObject];
        v46 = [v45 objectForKeyedSubscript:@"appName"];

        [NSString stringWithValidatedFormat:v44, @"%@ %@", 0, v46, v28, v56 validFormatSpecifiers error];
      }
      else {
        v52 = {;
      }
        v44 = [v52 localizedStringForKey:@"ACCESS_SECONDARY_BODY_PLURAL_3+_FORMAT"];

        v53 = [(NSArray *)self->_appInfos firstObject];
        v46 = [v53 objectForKeyedSubscript:@"appName"];

        [NSString stringWithValidatedFormat:v44, @"%@ %d %@", 0, v46, (v25 - 1), v28 validFormatSpecifiers error];
      uint64_t v51 = };
    }

    v27 = (void *)v51;
  }
  [(VUIAccessView_iOS *)self->_accessView setSecondaryBody:v27];
  v54 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleMenuGesture_];
  [v54 setAllowedPressTypes:&unk_1F3F3E540];
  v55 = [(_VUIAccessViewController *)self view];
  [v55 addGestureRecognizer:v54];
}

- (void)_toggleLoadingScreen
{
  id v7 = self->_loadingView;
  v3 = self->_accessView;
  if ([(VUIAppSpinnerView *)self->_loadingView isHidden])
  {
    v4 = v7;
  }
  else
  {
    int v5 = self->_accessView;

    uint64_t v6 = self->_loadingView;
    v4 = v5;
    v3 = (VUIAccessView_iOS *)v6;
  }
  id v8 = v4;
  [MEMORY[0x1E4FB1EB0] transitionFromView:v3 toView:v4 duration:5243136 options:0 completion:0.5];
}

- (void)_presentGenericErrorWithCompletion:(id)a3
{
  v4 = +[VUILocalizationManager sharedInstance];
  int v5 = [v4 localizedStringForKey:@"AccessUnknownErrorTitle"];
  uint64_t v6 = +[VUILocalizationManager sharedInstance];
  id v7 = [v6 localizedStringForKey:@"AccessUnknownErrorMessage"];
  id v11 = +[VUIAlertController vui_alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  id v8 = +[VUILocalizationManager sharedInstance];
  id v9 = [v8 localizedStringForKey:@"AccessUnknownErrorButton"];
  char v10 = +[VUIAlertAction vui_actionWithTitle:v9 style:0 handler:0];

  objc_msgSend(v11, "vui_addAction:", v10);
  objc_msgSend(v11, "vui_presentAlertFromPresentingController:animated:completion:", self, 1, 0);
}

- (id)_imageForBundleID:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1BA8];
  id v4 = a3;
  int v5 = [v3 mainScreen];
  [v5 scale];
  double v7 = v6;

  id v8 = [MEMORY[0x1E4FB1818] _applicationIconImageForBundleIdentifier:v4 format:2 scale:v7];

  return v8;
}

- (CGSize)_iconSize
{
  +[VUIAccessView_iOS iconSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_fetchRemoteAppInfo
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v3 = self->_appChannels;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 appBundleIDs];
        char v10 = [v8 channelID];
        if (v10 && ([(NSMutableArray *)self->_channelIds containsObject:v10] & 1) == 0) {
          [(NSMutableArray *)self->_channelIds addObject:v10];
        }
        if ([v9 count]) {
          [(NSMutableArray *)self->_bundleIDs addObjectsFromArray:v9];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  objc_initWeak(&location, self);
  id v11 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47___VUIAccessViewController__fetchRemoteAppInfo__block_invoke;
  v12[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v13, &location);
  dispatch_async(v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)_watchListAppIcon
{
  double v3 = WLKTVAppBundleID();
  uint64_t v4 = [(_VUIAccessViewController *)self _imageForBundleID:v3];

  return v4;
}

- (id)cappedTraitCollection
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (cappedTraitCollection_onceToken != -1) {
    dispatch_once(&cappedTraitCollection_onceToken, &__block_literal_global_165);
  }
  double v3 = [(_VUIAccessViewController *)self traitCollection];
  uint64_t v4 = [v3 preferredContentSizeCategory];

  if ([(id)cappedTraitCollection_cappedSizes containsObject:v4])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB1E20];
    uint64_t v6 = [(_VUIAccessViewController *)self traitCollection];
    v11[0] = v6;
    double v7 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB2798]];
    v11[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    id v9 = [v5 traitCollectionWithTraitsFromCollections:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)preferredFocusEnvironments
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_VUIAccessViewController;
  double v3 = [(_VUIAccessViewController *)&v9 preferredFocusEnvironments];
  uint64_t v4 = [(VUIAccessView_iOS *)self->_accessView allowButton];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    v10[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = [v6 arrayByAddingObjectsFromArray:v3];
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_channelIds, 0);
  objc_storeStrong((id *)&self->_appChannels, 0);
  objc_storeStrong((id *)&self->_appInfos, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_accessView, 0);
}

@end