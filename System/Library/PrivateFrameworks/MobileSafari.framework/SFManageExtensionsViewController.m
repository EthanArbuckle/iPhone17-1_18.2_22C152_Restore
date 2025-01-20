@interface SFManageExtensionsViewController
+ (id)createManageExtensionsNavigationControllerFromPageFormatMenu:(id)a3 activeDocument:(id)a4;
- (BOOL)_isAppStoreLinkSection:(int64_t)a3;
- (BOOL)_isOnOtherDevicesSection:(int64_t)a3;
- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_SFPageFormatMenuController)presentingPageFormatMenu;
- (id)_tintIconForDarkModeIfNeeded:(id)a3;
- (id)initFromPageFormatMenu:(id)a3 activeDocument:(id)a4;
- (id)initFromSettingsWithExtensionsController:(id)a3 contentBlockerManager:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_commonInit;
- (void)_extensionStateWasToggled:(id)a3;
- (void)_filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery;
- (void)_filterExtensionsBasedOnUserTypedSearchQuery;
- (void)_refreshExtensionData;
- (void)_reload;
- (void)_setPrivateBrowsingStateForExtension:(id)a3 isOn:(BOOL)a4;
- (void)_updateCloudExtensionLockupViews;
- (void)_updateLastViewedDate;
- (void)dealloc;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setPresentingPageFormatMenu:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SFManageExtensionsViewController

+ (id)createManageExtensionsNavigationControllerFromPageFormatMenu:(id)a3 activeDocument:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[SFManageExtensionsViewController alloc] initFromPageFormatMenu:v5 activeDocument:v6];
  objc_initWeak(&location, v7);
  id v8 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB14A8], "_sf_popoverDoneButtonItem");
  v10 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __112__SFManageExtensionsViewController_createManageExtensionsNavigationControllerFromPageFormatMenu_activeDocument___block_invoke;
  v19 = &unk_1E54ED038;
  objc_copyWeak(&v20, &location);
  v11 = [v10 actionWithTitle:&stru_1EDA07C28 image:0 identifier:0 handler:&v16];
  v12 = objc_msgSend(v8, "initWithBarButtonSystemItem:primaryAction:", v9, v11, v16, v17, v18, v19);
  v13 = [v7 navigationItem];
  objc_msgSend(v13, "sf_setPreferredDismissOrDoneButtonItem:", v12);

  v14 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __112__SFManageExtensionsViewController_createManageExtensionsNavigationControllerFromPageFormatMenu_activeDocument___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (id)initFromPageFormatMenu:(id)a3 activeDocument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SFManageExtensionsViewController;
  id v8 = [(SFManageExtensionsViewController *)&v16 initWithStyle:2];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentingPageFormatMenu, v6);
    v9->_presentedFromPrivateBrowsing = [v7 isPrivateBrowsingEnabled];
    uint64_t v10 = [v7 webExtensionsController];
    webExtensionsController = v9->_webExtensionsController;
    v9->_webExtensionsController = (SFWebExtensionsController *)v10;

    uint64_t v12 = [v7 contentBlockerManager];
    contentBlockerManager = v9->_contentBlockerManager;
    v9->_contentBlockerManager = (SFContentBlockerManager *)v12;

    [(SFManageExtensionsViewController *)v9 _commonInit];
    v14 = v9;
  }

  return v9;
}

- (id)initFromSettingsWithExtensionsController:(id)a3 contentBlockerManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFManageExtensionsViewController;
  uint64_t v9 = [(SFManageExtensionsViewController *)&v13 initWithStyle:2];
  p_isa = (id *)&v9->super.super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webExtensionsController, a3);
    objc_storeStrong(p_isa + 129, a4);
    [p_isa _commonInit];
    v11 = p_isa;
  }

  return p_isa;
}

- (void)_commonInit
{
  id v5 = self->_webExtensionsController;
  [(SFManageExtensionsViewController *)self _refreshExtensionData];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__reload name:*MEMORY[0x1E4F984D0] object:0];
  [v3 addObserver:self selector:sel__reload name:*MEMORY[0x1E4F99070] object:0];
  [v3 addObserver:self selector:sel__reload name:*MEMORY[0x1E4F98118] object:0];
  [(WBSExtensionsController *)v5 addObserver:self];
  v4 = _WBSLocalizedString();
  [(SFManageExtensionsViewController *)self setTitle:v4];
}

- (void)_refreshExtensionData
{
  v3 = self->_webExtensionsController;
  v4 = [(WBSExtensionsController *)v3 extensions];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__SFManageExtensionsViewController__refreshExtensionData__block_invoke;
  v17[3] = &unk_1E54ED060;
  id v5 = v3;
  v18 = v5;
  id v6 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v17);
  id v7 = [(SFContentBlockerManager *)self->_contentBlockerManager extensions];
  id v8 = [v7 allObjects];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__SFManageExtensionsViewController__refreshExtensionData__block_invoke_2;
  v14[3] = &unk_1E54ED088;
  uint64_t v9 = v5;
  v15 = v9;
  objc_super v16 = self;
  uint64_t v10 = objc_msgSend(v8, "safari_mapAndFilterObjectsUsingBlock:", v14);
  v11 = [v6 arrayByAddingObjectsFromArray:v10];
  uint64_t v12 = [v11 sortedArrayUsingSelector:sel_localizedCompare_];
  extensions = self->_extensions;
  self->_extensions = v12;

  [(SFManageExtensionsViewController *)self _filterExtensionsBasedOnUserTypedSearchQuery];
  [(SFManageExtensionsViewController *)self _updateCloudExtensionLockupViews];
}

id __57__SFManageExtensionsViewController__refreshExtensionData__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) webExtensionForExtension:a2];
  v4 = [v3 composedIdentifier];
  id v5 = +[SFExtensionWrapper extensionWrapperForWebExtensionWithComposedIdentifier:v4 webExtensionsController:*(void *)(a1 + 32)];

  return v5;
}

id __57__SFManageExtensionsViewController__refreshExtensionData__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) composedIdentifierForExtensionStateForExtension:a2];
  v4 = +[SFExtensionWrapper extensionWrapperForContentBlockerWithComposedIdentifier:v3 contentBlockerManager:*(void *)(*(void *)(a1 + 40) + 1032)];

  return v4;
}

- (void)_updateCloudExtensionLockupViews
{
  if (!self->_waitingForLockupViews)
  {
    self->_waitingForLockupViews = 1;
    v3 = [MEMORY[0x1E4F98A18] sharedManager];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __68__SFManageExtensionsViewController__updateCloudExtensionLockupViews__block_invoke;
    v4[3] = &unk_1E54ED0B0;
    v4[4] = self;
    [v3 getLockupViewsForAppsOnOtherDevicesWithCompletionHandler:v4];
  }
}

void __68__SFManageExtensionsViewController__updateCloudExtensionLockupViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 1096) = 0;
  id v8 = v3;
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1080), "isEqual:") & 1) == 0)
  {
    uint64_t v4 = [v8 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 1080);
    *(void *)(v5 + 1080) = v4;

    [*(id *)(a1 + 32) _filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery];
    id v7 = [*(id *)(a1 + 32) tableView];
    [v7 reloadData];
  }
}

- (void)dealloc
{
  [(WBSExtensionsController *)self->_webExtensionsController removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SFManageExtensionsViewController;
  [(SFManageExtensionsViewController *)&v3 dealloc];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFManageExtensionsViewController;
  [(SFManageExtensionsViewController *)&v3 viewWillLayoutSubviews];
  -[UISearchBar setLayoutMargins:](self->_searchBar, "setLayoutMargins:", 0.0, self->_indentationWidthOfCell + self->_indentationWidthOfCell, 0.0, self->_indentationWidthOfCell + self->_indentationWidthOfCell);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFManageExtensionsViewController;
  [(SFManageExtensionsViewController *)&v4 viewWillAppear:a3];
  [(SFContentBlockerManager *)self->_contentBlockerManager addObserver:self];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)SFManageExtensionsViewController;
  [(SFManageExtensionsViewController *)&v9 viewDidLoad];
  objc_super v3 = [(SFManageExtensionsViewController *)self view];
  [v3 setAccessibilityIdentifier:@"ManageWebExtensionsView"];

  objc_super v4 = (void *)MEMORY[0x1E4FB1BF0];
  uint64_t v5 = [(SFManageExtensionsViewController *)self tableView];
  objc_msgSend(v4, "sf_installSearchBarInTableView:includeSeparator:", v5, 0);
  id v6 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  searchBar = self->_searchBar;
  self->_searchBar = v6;

  [(UISearchBar *)self->_searchBar setDelegate:self];
  id v8 = _WBSLocalizedString();
  [(UISearchBar *)self->_searchBar setPlaceholder:v8];

  [(SFManageExtensionsViewController *)self _updateLastViewedDate];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFManageExtensionsViewController;
  [(SFManageExtensionsViewController *)&v5 viewDidDisappear:a3];
  [(SFContentBlockerManager *)self->_contentBlockerManager removeObserver:self];
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"SFManageWebExtensionsViewDidDismissNotification" object:self];
}

- (void)_updateLastViewedDate
{
  if (!self->_presentedFromPrivateBrowsing)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    objc_super v3 = [MEMORY[0x1E4F1C9C8] now];
    objc_msgSend(v4, "safari_setDate:forKey:", v3, *MEMORY[0x1E4F98670]);
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x1E4F99758] object:self];
}

- (void)_reload
{
  [(SFManageExtensionsViewController *)self _refreshExtensionData];
  objc_super v3 = [(SFManageExtensionsViewController *)self tableView];
  [v3 reloadData];

  [(SFManageExtensionsViewController *)self _updateLastViewedDate];
}

- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  return 1;
}

- (id)_tintIconForDarkModeIfNeeded:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "safari_computeAverageLuminance");
  double v5 = v4;
  int v6 = objc_msgSend(v3, "safari_isGrayscale");
  int v7 = objc_msgSend(v3, "safari_transparencyAnalysisResultIsNotOpaque");
  if (v5 < 0.1 && ((v6 ^ 1) & 1) == 0 && ((v7 ^ 1) & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v9 = [v3 imageWithTintColor:v8];

    id v3 = (id)v9;
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[SFManageExtensionsViewController _isOnOtherDevicesSection:](self, "_isOnOtherDevicesSection:", [v7 section]))
  {
    id v8 = [v6 dequeueReusableCellWithIdentifier:@"availableAppCell"];
    if (!v8) {
      id v8 = [[SFAvailableAppTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"availableAppCell"];
    }
    uint64_t v9 = -[NSArray objectAtIndexedSubscript:](self->_filteredExtensionAppLockupViews, "objectAtIndexedSubscript:", [v7 row]);
    [(SFAvailableAppTableViewCell *)v8 setLockupView:v9];
    goto LABEL_5;
  }
  if (!-[SFManageExtensionsViewController _isAppStoreLinkSection:](self, "_isAppStoreLinkSection:", [v7 section]))
  {
    objc_super v13 = [v6 dequeueReusableCellWithIdentifier:@"toggleExtensionCell"];
    v14 = v13;
    if (v13)
    {
      id v55 = [(SFAvailableAppTableViewCell *)v13 accessoryView];
      id v8 = v14;
    }
    else
    {
      id v8 = (SFAvailableAppTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"toggleExtensionCell"];
      id v55 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
      -[SFAvailableAppTableViewCell setAccessoryView:](v8, "setAccessoryView:");
      [v55 addTarget:self action:sel__extensionStateWasToggled_ forControlEvents:4096];
    }
    v54 = self->_webExtensionsController;
    v15 = -[NSArray objectAtIndexedSubscript:](self->_filteredExtensions, "objectAtIndexedSubscript:", [v7 row]);
    objc_super v16 = v15;
    if (self->_presentedFromPrivateBrowsing)
    {
      if (![v15 isEnabled])
      {
        uint64_t v18 = 0;
        goto LABEL_18;
      }
      uint64_t v17 = [v16 allowedInPrivateBrowsing];
    }
    else
    {
      uint64_t v17 = [v15 isEnabled];
    }
    uint64_t v18 = v17;
LABEL_18:
    [v55 setOn:v18];
    char v19 = [(SFWebExtensionsController *)v54 parentalControlsAreEnabledForExtensions];
    if (self->_presentedFromPrivateBrowsing) {
      char v20 = 1;
    }
    else {
      char v20 = v19;
    }
    if (v20)
    {
      if (v19)
      {
        BOOL v21 = 0;
      }
      else
      {
        v24 = [MEMORY[0x1E4F97ED0] sharedController];
        v25 = [v16 composedIdentifier];
        uint64_t v26 = [v24 managedExtensionPrivateBrowsingStateForComposedIdentifier:v25];

        v27 = [MEMORY[0x1E4F97ED0] sharedController];
        v28 = [v16 composedIdentifier];
        uint64_t v29 = [v27 managedExtensionStateForComposedIdentifier:v28];

        if (v26) {
          BOOL v30 = 1;
        }
        else {
          BOOL v30 = v29 == 2;
        }
        BOOL v21 = !v30;
      }
    }
    else
    {
      v22 = [MEMORY[0x1E4F97ED0] sharedController];
      v23 = [v16 composedIdentifier];
      BOOL v21 = [v22 managedExtensionStateForComposedIdentifier:v23] == 0;
    }
    [v55 setEnabled:v21];
    objc_msgSend(v55, "setTag:", objc_msgSend(v7, "row"));
    v31 = (void *)MEMORY[0x1E4F22458];
    v32 = [v16 extension];
    v33 = [v32 _plugIn];
    v34 = [v33 uuid];
    v53 = [v31 pluginKitProxyForUUID:v34];

    v35 = [v16 displayName];
    if ([v16 contentBlockerHasSameNameAsWebExtensionFromSameApp:self->_extensions])
    {
      v36 = NSString;
      v37 = _WBSLocalizedString();
      v38 = [v16 displayName];
      v39 = objc_msgSend(v36, "stringWithFormat:", v37, v38);
    }
    else
    {
      v39 = v35;
    }
    if ([v16 isContentBlocker]) {
      goto LABEL_37;
    }
    v40 = [v16 extension];
    v41 = [(WBSWebExtensionsController *)v54 webExtensionForExtension:v40];

    if (!v41
      || ([v41 preferencesIcon],
          v42 = objc_claimAutoreleasedReturnValue(),
          v41,
          !v42))
    {
LABEL_37:
      v42 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v53 format:0];
    }
    v43 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F2B8]];
    [v43 size];
    double v45 = v44;
    double v47 = v46;

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __68__SFManageExtensionsViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v56[3] = &unk_1E54ED0D8;
    v56[4] = self;
    v48 = objc_msgSend(v42, "safari_dynamicImageWithSize:generator:", v56, v45, v47);

    v49 = [(SFAvailableAppTableViewCell *)v8 imageView];
    [v49 setImage:v48];

    v50 = [(SFAvailableAppTableViewCell *)v8 textLabel];
    [v50 setText:v39];

    [(SFAvailableAppTableViewCell *)v8 indentationWidth];
    self->_indentationWidthOfCell = v51;

    goto LABEL_39;
  }
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"appStoreLinkCell"];
  if (!v8)
  {
    id v8 = (SFAvailableAppTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"appStoreLinkCell"];
    uint64_t v10 = _WBSLocalizedString();
    v11 = [(SFAvailableAppTableViewCell *)v8 textLabel];
    [v11 setText:v10];

    uint64_t v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
    uint64_t v12 = [(SFAvailableAppTableViewCell *)v8 textLabel];
    [v12 setTextColor:v9];

LABEL_5:
  }
LABEL_39:

  return v8;
}

id __68__SFManageExtensionsViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _tintIconForDarkModeIfNeeded:a2];

  return v2;
}

- (void)_extensionStateWasToggled:(id)a3
{
  id v4 = a3;
  double v5 = -[NSArray objectAtIndexedSubscript:](self->_filteredExtensions, "objectAtIndexedSubscript:", [v4 tag]);
  id v22 = 0;
  char v6 = [v5 canLoadWithErrorString:&v22];
  id v7 = v22;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = [v5 displayName];
    uint64_t v10 = (void *)MEMORY[0x1E4FB1418];
    v11 = NSString;
    uint64_t v12 = _WBSLocalizedString();
    objc_super v13 = objc_msgSend(v11, "stringWithFormat:", v12, v9);
    v14 = [v10 alertControllerWithTitle:v13 message:v7 preferredStyle:1];

    v15 = (void *)MEMORY[0x1E4FB1410];
    objc_super v16 = _WBSLocalizedString();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__SFManageExtensionsViewController__extensionStateWasToggled___block_invoke;
    v20[3] = &unk_1E54ED100;
    id v21 = v4;
    uint64_t v17 = [v15 actionWithTitle:v16 style:0 handler:v20];
    [v14 addAction:v17];

    [(SFManageExtensionsViewController *)self presentViewController:v14 animated:1 completion:0];
    goto LABEL_11;
  }
  uint64_t v8 = [v4 isOn];
  if ((v8 & 1) == 0)
  {
    if (!self->_presentedFromPrivateBrowsing)
    {
      [v5 disable];
      goto LABEL_11;
    }
LABEL_8:
    [(SFManageExtensionsViewController *)self _setPrivateBrowsingStateForExtension:v5 isOn:v8];
    goto LABEL_11;
  }
  if (!self->_presentedFromPrivateBrowsing)
  {
    [v5 enableWithPresentingViewController:self completionHandler:&__block_literal_global_55];
    goto LABEL_11;
  }
  if ([v5 isEnabled]) {
    goto LABEL_8;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__SFManageExtensionsViewController__extensionStateWasToggled___block_invoke_2;
  v18[3] = &unk_1E54ED128;
  v18[4] = self;
  id v19 = v5;
  [v19 enableWithPresentingViewController:self completionHandler:v18];

LABEL_11:
}

uint64_t __62__SFManageExtensionsViewController__extensionStateWasToggled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:0];
}

uint64_t __62__SFManageExtensionsViewController__extensionStateWasToggled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPrivateBrowsingStateForExtension:*(void *)(a1 + 40) isOn:1];
}

- (void)_setPrivateBrowsingStateForExtension:(id)a3 isOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 setAllowedInPrivateBrowsing:v4];
  double v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x1E4F997F0] object:0];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v11 = a3;
  id v6 = (NSString *)a4;
  userTypedQuery = self->_userTypedQuery;
  if (userTypedQuery != v6 && ![(NSString *)userTypedQuery isEqualToString:v6])
  {
    uint64_t v8 = (NSString *)[(NSString *)v6 copy];
    uint64_t v9 = self->_userTypedQuery;
    self->_userTypedQuery = v8;

    [(SFManageExtensionsViewController *)self _filterExtensionsBasedOnUserTypedSearchQuery];
    [(SFManageExtensionsViewController *)self _filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery];
    uint64_t v10 = [(SFManageExtensionsViewController *)self tableView];
    [v10 reloadData];
  }
}

- (void)_filterExtensionsBasedOnUserTypedSearchQuery
{
  NSUInteger v3 = [(NSString *)self->_userTypedQuery length];
  extensions = self->_extensions;
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__SFManageExtensionsViewController__filterExtensionsBasedOnUserTypedSearchQuery__block_invoke;
    v9[3] = &unk_1E54ED150;
    v9[4] = self;
    double v5 = [(NSArray *)extensions safari_filterObjectsUsingBlock:v9];
    filteredExtensions = self->_filteredExtensions;
    self->_filteredExtensions = v5;
  }
  else
  {
    id v7 = (NSArray *)[(NSArray *)extensions copy];
    uint64_t v8 = self->_filteredExtensions;
    self->_filteredExtensions = v7;
  }
}

uint64_t __80__SFManageExtensionsViewController__filterExtensionsBasedOnUserTypedSearchQuery__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 displayName];
  if ([v4 localizedCaseInsensitiveContainsString:*(void *)(*(void *)(a1 + 32) + 1064)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [v3 shortName];
    uint64_t v5 = [v6 localizedCaseInsensitiveContainsString:*(void *)(*(void *)(a1 + 32) + 1064)];
  }
  return v5;
}

- (void)_filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery
{
  NSUInteger v3 = [(NSString *)self->_userTypedQuery length];
  extensionAppLockupViews = self->_extensionAppLockupViews;
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__SFManageExtensionsViewController__filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery__block_invoke;
    v9[3] = &unk_1E54ED178;
    v9[4] = self;
    uint64_t v5 = [(NSArray *)extensionAppLockupViews safari_filterObjectsUsingBlock:v9];
    filteredExtensionAppLockupViews = self->_filteredExtensionAppLockupViews;
    self->_filteredExtensionAppLockupViews = v5;
  }
  else
  {
    id v7 = (NSArray *)[(NSArray *)extensionAppLockupViews copy];
    uint64_t v8 = self->_filteredExtensionAppLockupViews;
    self->_filteredExtensionAppLockupViews = v7;
  }
}

uint64_t __93__SFManageExtensionsViewController__filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery__block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v3 = [a2 lockup];
  BOOL v4 = [v3 title];
  uint64_t v5 = [v4 localizedCaseInsensitiveContainsString:*(void *)(*(void *)(a1 + 32) + 1064)];

  return v5;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (![(SFManageExtensionsViewController *)self _isOnOtherDevicesSection:a4])
    {
      int64_t v8 = [(SFManageExtensionsViewController *)self _isAppStoreLinkSection:a4];
      goto LABEL_7;
    }
    id v7 = &OBJC_IVAR___SFManageExtensionsViewController__filteredExtensionAppLockupViews;
  }
  else
  {
    id v7 = &OBJC_IVAR___SFManageExtensionsViewController__filteredExtensions;
  }
  int64_t v8 = [*(id *)((char *)&self->super.super.super.super.isa + *v7) count];
LABEL_7:

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (-[SFManageExtensionsViewController _isAppStoreLinkSection:](self, "_isAppStoreLinkSection:", [v6 section]))
  {
    [v9 deselectRowAtIndexPath:v6 animated:1];
    id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    int64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F997E8]];
    [v7 openURL:v8 withOptions:0];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  LOBYTE(self) = -[SFManageExtensionsViewController _isAppStoreLinkSection:](self, "_isAppStoreLinkSection:", [v5 section]);

  return (char)self;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(NSArray *)self->_filteredExtensionAppLockupViews count]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if ([(SFManageExtensionsViewController *)self _isOnOtherDevicesSection:a4]) {
      goto LABEL_5;
    }
    [(SFManageExtensionsViewController *)self _isAppStoreLinkSection:a4];
    goto LABEL_7;
  }
  if (self->_presentedFromPrivateBrowsing)
  {
LABEL_5:
    id v7 = _WBSLocalizedString();
    goto LABEL_8;
  }
  if (![(SFWebExtensionsController *)self->_webExtensionsController hasNamedProfiles])
  {
    if ([(NSArray *)self->_filteredExtensionAppLockupViews count]
      && [(NSArray *)self->_filteredExtensions count])
    {
      goto LABEL_5;
    }
LABEL_7:
    id v7 = 0;
    goto LABEL_8;
  }
  id v9 = [(SFWebExtensionsController *)self->_webExtensionsController profile];
  id v7 = [v9 title];

LABEL_8:

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F97ED0], "sharedController", a3);
    int v7 = [v6 hasAnyExtensionManagement];

    if (v7)
    {
      extensions = self->_extensions;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __70__SFManageExtensionsViewController_tableView_titleForFooterInSection___block_invoke;
      v10[3] = &unk_1E54ED150;
      v10[4] = self;
      [(NSArray *)extensions safari_containsObjectPassingTest:v10];
      BOOL v4 = _WBSLocalizedString();
    }
    else
    {
      BOOL v4 = _WBSLocalizedString();
    }
  }

  return v4;
}

BOOL __70__SFManageExtensionsViewController_tableView_titleForFooterInSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1097))
  {
    BOOL v4 = [MEMORY[0x1E4F97ED0] sharedController];
    id v5 = [v3 composedIdentifier];
    uint64_t v6 = [v4 managedExtensionPrivateBrowsingStateForComposedIdentifier:v5];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F97ED0] sharedController];
    id v5 = [v3 composedIdentifier];
    uint64_t v6 = [v4 managedExtensionStateForComposedIdentifier:v5];
  }
  uint64_t v7 = v6;

  return v7 == 0;
}

- (BOOL)_isOnOtherDevicesSection:(int64_t)a3
{
  NSUInteger v4 = [(NSArray *)self->_filteredExtensionAppLockupViews count];
  return a3 == 1 && v4 != 0;
}

- (BOOL)_isAppStoreLinkSection:(int64_t)a3
{
  NSUInteger v4 = [(NSArray *)self->_filteredExtensionAppLockupViews count];
  uint64_t v5 = 1;
  if (v4) {
    uint64_t v5 = 2;
  }
  return v5 == a3;
}

- (_SFPageFormatMenuController)presentingPageFormatMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingPageFormatMenu);

  return (_SFPageFormatMenuController *)WeakRetained;
}

- (void)setPresentingPageFormatMenu:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingPageFormatMenu);
  objc_storeStrong((id *)&self->_filteredExtensionAppLockupViews, 0);
  objc_storeStrong((id *)&self->_extensionAppLockupViews, 0);
  objc_storeStrong((id *)&self->_userTypedQuery, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_filteredExtensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_contentBlockerManager, 0);

  objc_storeStrong((id *)&self->_webExtensionsController, 0);
}

@end