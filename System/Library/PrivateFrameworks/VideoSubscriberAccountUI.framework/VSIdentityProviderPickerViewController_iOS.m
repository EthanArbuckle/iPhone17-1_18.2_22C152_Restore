@interface VSIdentityProviderPickerViewController_iOS
- (BOOL)_shouldInsetListView;
- (BOOL)isCancellationAllowed;
- (BOOL)isReadyToHandleDeepLinks;
- (BOOL)sectionContentInsetInitialized;
- (NSArray)allStorefronts;
- (NSArray)identityProviders;
- (NSArray)identityProvidersToDisplay;
- (NSArray)tvProviderSupportedStorefronts;
- (NSDictionary)providersByStorefrontCountryCode;
- (NSString)requestedStorefrontCountryCode;
- (NSString)requestingAppDisplayName;
- (NSString)resourceTitle;
- (NSString)searchString;
- (UISearchController)searchController;
- (UITableViewHeaderFooterView)firstSectionHeaderView;
- (UIView)footerView;
- (VSFontCenter)fontCenter;
- (VSIdentityProvider)selectedIdentityProvider;
- (VSIdentityProviderFilter)filter;
- (VSIdentityProviderPickerViewControllerDelegate)delegate;
- (VSIdentityProviderPickerViewController_iOS)init;
- (VSIdentityProviderPickerViewController_iOS)initWithStyle:(int64_t)a3;
- (VSIdentityProviderTableViewDataSource)filteredDataSource;
- (VSIdentityProviderTableViewDataSource)unfilteredDataSource;
- (VSOnboardingInfoCenter)onboardingInfoCenter;
- (VSSearchBarDelegate)searchBarDelegate;
- (VSStorefrontFilter)storefrontFilter;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_createTableHeaderContentConfiguration:(id)a3;
- (id)_titleForTableHeaderView;
- (id)_titleForViewController;
- (id)filteredTableView;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)titleForTableFooterView;
- (unint64_t)additionalProvidersMode;
- (void)_cancelButtonPressed:(id)a3;
- (void)_didPickAdditionalIdentityProviders;
- (void)_didPickIdentityProvider:(id)a3;
- (void)_didPickStorefront:(id)a3;
- (void)_performSelectionForIdentityProvider:(id)a3;
- (void)_showAboutPrivacy:(id)a3;
- (void)_showPrivacySheet:(id)a3;
- (void)_updateTableHeaderTitle;
- (void)deselectSelectedProviderAnimated:(BOOL)a3;
- (void)dismissSearchControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleDestination:(id)a3 completion:(id)a4;
- (void)handleSignInActionWithCompletion:(id)a3;
- (void)setAdditionalProvidersMode:(unint64_t)a3;
- (void)setAllStorefronts:(id)a3;
- (void)setCancellationAllowed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setFilteredDataSource:(id)a3;
- (void)setFirstSectionHeaderView:(id)a3;
- (void)setFontCenter:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setIdentityProviders:(id)a3;
- (void)setIdentityProvidersToDisplay:(id)a3;
- (void)setLayoutMarginsFollowReadableWidth:(BOOL)a3;
- (void)setOnboardingInfoCenter:(id)a3;
- (void)setProvidersByStorefrontCountryCode:(id)a3;
- (void)setReadyToHandleDeepLinks:(BOOL)a3;
- (void)setRequestedStorefrontCountryCode:(id)a3;
- (void)setRequestedStorefrontCountryCode:(id)a3 defaultToDeveloperProviders:(BOOL)a4;
- (void)setRequestingAppDisplayName:(id)a3;
- (void)setResourceTitle:(id)a3;
- (void)setSearchBarDelegate:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSectionContentInset:(UIEdgeInsets)a3;
- (void)setSectionContentInsetInitialized:(BOOL)a3;
- (void)setSelectedIdentityProvider:(id)a3;
- (void)setStorefrontFilter:(id)a3;
- (void)setTvProviderSupportedStorefronts:(id)a3;
- (void)setUnfilteredDataSource:(id)a3;
- (void)showPrivacySheet:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableViewDidFinishReload:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation VSIdentityProviderPickerViewController_iOS

- (VSIdentityProviderPickerViewController_iOS)initWithStyle:(int64_t)a3
{
  v49[1] = *MEMORY[0x263EF8340];
  v48.receiver = self;
  v48.super_class = (Class)VSIdentityProviderPickerViewController_iOS;
  v3 = [(VSIdentityProviderPickerViewController_iOS *)&v48 initWithStyle:a3];
  v4 = v3;
  if (v3)
  {
    identityProviders = v3->_identityProviders;
    v6 = (NSArray *)MEMORY[0x263EFFA68];
    v3->_identityProviders = (NSArray *)MEMORY[0x263EFFA68];

    identityProvidersToDisplay = v4->_identityProvidersToDisplay;
    v4->_identityProvidersToDisplay = v6;

    searchString = v4->_searchString;
    v4->_searchString = (NSString *)&stru_26F361E90;

    v9 = [[VSFontCenter alloc] initWithTraitEnvironment:v4];
    fontCenter = v4->_fontCenter;
    v4->_fontCenter = v9;

    v11 = objc_alloc_init(VSOnboardingInfoCenter);
    onboardingInfoCenter = v4->_onboardingInfoCenter;
    v4->_onboardingInfoCenter = v11;

    v13 = objc_alloc_init(VSIdentityProviderFilter);
    filter = v4->_filter;
    v4->_filter = v13;

    v15 = objc_alloc_init(VSStorefrontFilter);
    storefrontFilter = v4->_storefrontFilter;
    v4->_storefrontFilter = v15;

    v17 = objc_alloc_init(VSSearchBarDelegate);
    searchBarDelegate = v4->_searchBarDelegate;
    v4->_searchBarDelegate = v17;

    v19 = v4->_searchBarDelegate;
    v20 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderPickerViewController_iOS *)v4 vs_bind:@"searchString" toObject:v19 withKeyPath:@"text" options:v20];

    v21 = objc_alloc_init(VSIdentityProviderTableViewDataSource);
    unfilteredDataSource = v4->_unfilteredDataSource;
    v4->_unfilteredDataSource = v21;

    v23 = objc_alloc_init(VSIdentityProviderTableViewDataSource);
    filteredDataSource = v4->_filteredDataSource;
    v4->_filteredDataSource = v23;

    v25 = v4->_unfilteredDataSource;
    v26 = v4->_filter;
    v27 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderTableViewDataSource *)v25 vs_bind:@"identityProviders" toObject:v26 withKeyPath:@"filteredIdentityProviders" options:v27];

    v28 = v4->_unfilteredDataSource;
    v29 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderTableViewDataSource *)v28 vs_bind:@"additionalProvidersMode" toObject:v4 withKeyPath:@"additionalProvidersMode" options:v29];

    v30 = v4->_unfilteredDataSource;
    v31 = v4->_storefrontFilter;
    v32 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderTableViewDataSource *)v30 vs_bind:@"tvProviderSupportedStorefronts" toObject:v31 withKeyPath:@"filteredStorefronts" options:v32];

    v33 = v4->_filter;
    v34 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderFilter *)v33 vs_bind:@"allIdentityProviders" toObject:v4 withKeyPath:@"identityProvidersToDisplay" options:v34];

    v35 = v4->_filteredDataSource;
    v36 = v4->_filter;
    v37 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderTableViewDataSource *)v35 vs_bind:@"identityProviders" toObject:v36 withKeyPath:@"filteredIdentityProviders" options:v37];

    v38 = v4->_filteredDataSource;
    v39 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderTableViewDataSource *)v38 vs_bind:@"additionalProvidersMode" toObject:v4 withKeyPath:@"additionalProvidersMode" options:v39];

    v40 = v4->_storefrontFilter;
    v41 = VSMainConcurrencyBindingOptions();
    [(VSStorefrontFilter *)v40 vs_bind:@"storefronts" toObject:v4 withKeyPath:@"tvProviderSupportedStorefronts" options:v41];

    v42 = v4->_filteredDataSource;
    v43 = v4->_storefrontFilter;
    v44 = VSMainConcurrencyBindingOptions();
    [(VSIdentityProviderTableViewDataSource *)v42 vs_bind:@"tvProviderSupportedStorefronts" toObject:v43 withKeyPath:@"filteredStorefronts" options:v44];

    [(VSIdentityProviderPickerViewController_iOS *)v4 setDefinesPresentationContext:1];
    v49[0] = objc_opt_class();
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
    id v46 = (id)[(VSIdentityProviderPickerViewController_iOS *)v4 registerForTraitChanges:v45 withHandler:&__block_literal_global_15];
  }
  return v4;
}

- (VSIdentityProviderPickerViewController_iOS)init
{
  return [(VSIdentityProviderPickerViewController_iOS *)self initWithStyle:1];
}

- (void)setResourceTitle:(id)a3
{
  v4 = (NSString *)[a3 copy];
  resourceTitle = self->_resourceTitle;
  self->_resourceTitle = v4;

  [(VSIdentityProviderPickerViewController_iOS *)self _updateTableHeaderTitle];
}

- (void)setAdditionalProvidersMode:(unint64_t)a3
{
  self->_additionalProvidersMode = a3;
  [(VSIdentityProviderPickerViewController_iOS *)self _updateTableHeaderTitle];
}

- (void)setRequestingAppDisplayName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  requestingAppDisplayName = self->_requestingAppDisplayName;
  self->_requestingAppDisplayName = v4;

  [(VSIdentityProviderPickerViewController_iOS *)self _updateTableHeaderTitle];
}

- (void)setSearchString:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_searchString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_searchString, a3);
    if ([(VSIdentityProviderPickerViewController_iOS *)self additionalProvidersMode] == 6) {
      [(VSIdentityProviderPickerViewController_iOS *)self storefrontFilter];
    }
    else {
    v5 = [(VSIdentityProviderPickerViewController_iOS *)self filter];
    }
    [v5 setSearchQuery:v6];
  }
}

- (void)setRequestedStorefrontCountryCode:(id)a3
{
}

- (void)setRequestedStorefrontCountryCode:(id)a3 defaultToDeveloperProviders:(BOOL)a4
{
  BOOL v4 = a4;
  id v23 = a3;
  objc_storeStrong((id *)&self->_requestedStorefrontCountryCode, a3);
  unint64_t v7 = [(VSIdentityProviderPickerViewController_iOS *)self additionalProvidersMode];
  if (!v23 && v7 - 5 >= 2)
  {
    v8 = [(VSIdentityProviderPickerViewController_iOS *)self identityProviders];
    [(VSIdentityProviderPickerViewController_iOS *)self setIdentityProvidersToDisplay:v8];
    goto LABEL_19;
  }
  v9 = [(VSIdentityProviderPickerViewController_iOS *)self providersByStorefrontCountryCode];

  if (!v9)
  {
    v10 = objc_alloc_init(VSIdentityProviderStorefrontParser);
    v11 = [(VSIdentityProviderPickerViewController_iOS *)self identityProviders];
    [(VSIdentityProviderStorefrontParser *)v10 setAllIdentityProviders:v11];

    v12 = [(VSIdentityProviderPickerViewController_iOS *)self allStorefronts];
    if (v12) {
      [(VSIdentityProviderStorefrontParser *)v10 setAllStorefronts:v12 withCurrentStorefrontCode:v23];
    }
    v13 = [(VSIdentityProviderStorefrontParser *)v10 identityProvidersByStorefront];
    v14 = [(VSIdentityProviderStorefrontParser *)v10 tvProviderSupportedStorefronts];
    [(VSIdentityProviderPickerViewController_iOS *)self setProvidersByStorefrontCountryCode:v13];
    [(VSIdentityProviderPickerViewController_iOS *)self setTvProviderSupportedStorefronts:v14];
  }
  v15 = [(VSIdentityProviderPickerViewController_iOS *)self providersByStorefrontCountryCode];
  if (!v23) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The requestedStorefrontCountryCode parameter must not be nil."];
  }
  v8 = objc_msgSend(v15, "valueForKey:");

  v16 = [(VSIdentityProviderPickerViewController_iOS *)self providersByStorefrontCountryCode];
  v17 = [v16 valueForKey:@"__"];

  if (v4
    && v17
    && ([v17 allIdentityProviders],
        v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v18 count],
        v18,
        v19))
  {
    v20 = [v17 allIdentityProviders];
  }
  else
  {
    if (!v8)
    {
      uint64_t v22 = 6;
      goto LABEL_18;
    }
    id v21 = v8;
    [v21 featureProvidersInCurrentStorefront];
    v20 = [v21 allIdentityProviders];
  }
  [(VSIdentityProviderPickerViewController_iOS *)self setIdentityProvidersToDisplay:v20];

  uint64_t v22 = 5;
LABEL_18:
  [(VSIdentityProviderPickerViewController_iOS *)self setAdditionalProvidersMode:v22];

LABEL_19:
}

- (UITableViewHeaderFooterView)firstSectionHeaderView
{
  firstSectionHeaderView = self->_firstSectionHeaderView;
  if (!firstSectionHeaderView)
  {
    BOOL v4 = [(VSIdentityProviderPickerViewController_iOS *)self _titleForTableHeaderView];
    if (v4)
    {
      v5 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x263F1CA68]);
      id v6 = [(VSIdentityProviderPickerViewController_iOS *)self _createTableHeaderContentConfiguration:v4];
      [(UITableViewHeaderFooterView *)v5 setContentConfiguration:v6];
    }
    else
    {
      if ([(VSIdentityProviderPickerViewController_iOS *)self additionalProvidersMode] == 3)
      {
LABEL_7:

        firstSectionHeaderView = self->_firstSectionHeaderView;
        goto LABEL_8;
      }
      v5 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x263F1CA68]);
    }
    unint64_t v7 = self->_firstSectionHeaderView;
    self->_firstSectionHeaderView = v5;

    goto LABEL_7;
  }
LABEL_8:
  return firstSectionHeaderView;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(VSIdentityProviderPickerViewController_iOS *)self tableView];

  v8 = 0;
  if (!a4 && v7 == v6)
  {
    v8 = [(VSIdentityProviderPickerViewController_iOS *)self firstSectionHeaderView];
  }
  return v8;
}

- (id)_createTableHeaderContentConfiguration:(id)a3
{
  v3 = (void *)MEMORY[0x263F1C780];
  id v4 = a3;
  v5 = [v3 headerConfiguration];
  [v5 setSecondaryText:v4];

  return v5;
}

- (void)_updateTableHeaderTitle
{
  id v8 = [(VSIdentityProviderPickerViewController_iOS *)self _titleForTableHeaderView];
  if (v8)
  {
    v3 = [(VSIdentityProviderPickerViewController_iOS *)self firstSectionHeaderView];
    id v4 = [(VSIdentityProviderPickerViewController_iOS *)self _createTableHeaderContentConfiguration:v8];
    [v3 setContentConfiguration:v4];

    v5 = [(VSIdentityProviderPickerViewController_iOS *)self parentViewController];
    id v6 = [(VSIdentityProviderPickerViewController_iOS *)self _titleForViewController];
    [v5 setTitle:v6];

    id v7 = [(VSIdentityProviderPickerViewController_iOS *)self _titleForViewController];
    [(VSIdentityProviderPickerViewController_iOS *)self setTitle:v7];
  }
}

- (id)_titleForTableHeaderView
{
  if ([(VSIdentityProviderPickerViewController_iOS *)self additionalProvidersMode] == 3)
  {
    v3 = 0;
    goto LABEL_9;
  }
  id v4 = [(VSIdentityProviderPickerViewController_iOS *)self resourceTitle];
  if ([v4 length])
  {
    v5 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    id v6 = [v5 localizedStringForKey:@"IDENTITY_PROVIDER_PICKER_APP_MESSAGE_FORMAT" value:0 table:0];

    id v7 = NSString;
    id v8 = [(VSIdentityProviderPickerViewController_iOS *)self requestingAppDisplayName];
    objc_msgSend(v7, "stringWithFormat:", v6, v4, v8);
  }
  else
  {
    id v6 = [(VSIdentityProviderPickerViewController_iOS *)self requestingAppDisplayName];
    if (!v6)
    {
      unint64_t v12 = [(VSIdentityProviderPickerViewController_iOS *)self additionalProvidersMode];
      v13 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
      id v8 = v13;
      if (v12 == 6) {
        v14 = @"REGIONS_PICKER_SETTINGS_MESSAGE_TV";
      }
      else {
        v14 = @"IDENTITY_PROVIDER_PICKER_HEADER";
      }
      uint64_t v10 = [v13 localizedStringForKey:v14 value:0 table:0];
      goto LABEL_8;
    }
    v9 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    id v8 = [v9 localizedStringForKey:@"IDENTITY_PROVIDER_PICKER_APP_MESSAGE_NO_RESOURCE_TITLE_FORMAT" value:0 table:0];

    objc_msgSend(NSString, "stringWithFormat:", v8, v6, v15);
  uint64_t v10 = };
LABEL_8:
  v3 = (void *)v10;

LABEL_9:
  return v3;
}

- (id)titleForTableFooterView
{
  unint64_t v2 = [(VSIdentityProviderPickerViewController_iOS *)self additionalProvidersMode];
  v3 = 0;
  if (v2 <= 6 && ((1 << v2) & 0x64) != 0)
  {
    id v4 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    v3 = [v4 localizedStringForKey:@"IDENTITY_PROVIDER_PICKER_SETTINGS_FOOTER" value:0 table:0];
  }
  return v3;
}

- (id)_titleForViewController
{
  unint64_t v2 = [(VSIdentityProviderPickerViewController_iOS *)self additionalProvidersMode];
  if (v2 < 6)
  {
    v3 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    id v4 = v3;
    v5 = @"TV_PROVIDER_TITLE";
LABEL_3:
    id v6 = [v3 localizedStringForKey:v5 value:0 table:0];

    goto LABEL_4;
  }
  if (v2 == 6)
  {
    v3 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    id v4 = v3;
    v5 = @"REGIONS_PICKER_TITLE";
    goto LABEL_3;
  }
  id v6 = 0;
LABEL_4:
  return v6;
}

- (void)_didPickIdentityProvider:(id)a3
{
  id v5 = a3;
  id v4 = [(VSIdentityProviderPickerViewController_iOS *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 identityProviderPickerViewController:self didPickIdentityProvider:v5];
  }
}

- (void)_didPickAdditionalIdentityProviders
{
  id v5 = [(VSIdentityProviderPickerViewController_iOS *)self delegate];
  unint64_t v3 = [(VSIdentityProviderPickerViewController_iOS *)self additionalProvidersMode];
  if ((objc_opt_respondsToSelector() & 1) != 0 && v3 - 7 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    [v5 identityProviderPickerViewControllerDidPickAdditionalIdentityProviders:self];
  }
  else
  {
    id v4 = [(VSIdentityProviderPickerViewController_iOS *)self searchBarDelegate];
    [v4 clearText];

    [(VSIdentityProviderPickerViewController_iOS *)self setAdditionalProvidersMode:6];
    [(VSIdentityProviderPickerViewController_iOS *)self _updateTableHeaderTitle];
  }
}

- (void)_didPickStorefront:(id)a3
{
  id v4 = a3;
  id v5 = [(VSIdentityProviderPickerViewController_iOS *)self searchBarDelegate];
  [v5 clearText];

  id v6 = [v4 identitifer];

  [(VSIdentityProviderPickerViewController_iOS *)self setRequestedStorefrontCountryCode:v6];
  [(VSIdentityProviderPickerViewController_iOS *)self _updateTableHeaderTitle];
}

- (void)dismissSearchControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(VSIdentityProviderPickerViewController_iOS *)self searchController];
  [v7 resignFirstResponder];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__VSIdentityProviderPickerViewController_iOS_dismissSearchControllerAnimated_completion___block_invoke;
  v9[3] = &unk_265077BF8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(VSIdentityProviderPickerViewController_iOS *)self dismissViewControllerAnimated:v4 completion:v9];
}

- (void)_cancelButtonPressed:(id)a3
{
  id v4 = [(VSIdentityProviderPickerViewController_iOS *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 identityProviderPickerViewControllerDidCancel:self];
  }
}

- (void)_showAboutPrivacy:(id)a3
{
  id v4 = [(VSIdentityProviderPickerViewController_iOS *)self onboardingInfoCenter];
  [v4 presentDetailsFromViewController:self];
}

- (void)_performSelectionForIdentityProvider:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    [(VSIdentityProviderPickerViewController_iOS *)self _didPickIdentityProvider:v4];
  }
  else {
    [(VSIdentityProviderPickerViewController_iOS *)self _didPickAdditionalIdentityProviders];
  }
}

- (void)setCancellationAllowed:(BOOL)a3
{
  if (self->_cancellationAllowed != a3)
  {
    self->_cancellationAllowed = a3;
    if (a3) {
      id v5 = (id)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed_];
    }
    else {
      id v5 = 0;
    }
    id v4 = [(VSIdentityProviderPickerViewController_iOS *)self navigationItem];
    [v4 setLeftBarButtonItem:v5];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a4;
  id v6 = [a3 dataSource];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF4A0];
    v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v7 raise:v8, @"Unexpectedly, tableViewDataSource was %@, instead of VSIdentityProviderTableViewDataSource.", v10 format];
  }
  id v11 = v6;
  if ([v11 additionalProvidersMode] == 6)
  {
    unint64_t v12 = [v11 storefrontAtIndexPath:v14];
    [(VSIdentityProviderPickerViewController_iOS *)self _didPickStorefront:v12];
  }
  else
  {
    unint64_t v12 = [v11 identityProviderForRowAtIndexPath:v14];
    v13 = [(VSIdentityProviderPickerViewController_iOS *)self searchController];
    if ([v13 isActive])
    {
      [(VSIdentityProviderPickerViewController_iOS *)self setSelectedIdentityProvider:v12];
      [(VSIdentityProviderPickerViewController_iOS *)self dismissSearchControllerAnimated:1 completion:0];
    }
    else
    {
      [(VSIdentityProviderPickerViewController_iOS *)self _performSelectionForIdentityProvider:v12];
    }
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x263F1D600];
}

- (void)tableViewDidFinishReload:(id)a3
{
  id v7 = a3;
  [v7 contentOffset];
  double v4 = v3;
  id v5 = [v7 tableHeaderView];
  id v6 = v5;
  if (v5)
  {
    [v5 bounds];
    objc_msgSend(v7, "convertRect:fromView:", v6);
    objc_msgSend(v7, "scrollRectToVisible:animated:", 0);
  }
  else
  {
    if (v4 <= 0.0) {
      goto LABEL_6;
    }
    objc_msgSend(v7, "vs_scrollToTopAnimated:", 0);
  }
  [v7 setNeedsFocusUpdate];
LABEL_6:
}

- (UISearchController)searchController
{
  [(VSIdentityProviderPickerViewController_iOS *)self loadViewIfNeeded];
  searchController = self->_searchController;
  return searchController;
}

- (void)deselectSelectedProviderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v4 = [(VSIdentityProviderPickerViewController_iOS *)self tableView];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(v4, "indexPathsForSelectedRows", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 deselectRowAtIndexPath:*(void *)(*((void *)&v10 + 1) + 8 * v9++) animated:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)VSIdentityProviderPickerViewController_iOS;
  [(VSIdentityProviderPickerViewController_iOS *)&v35 viewDidLoad];
  BOOL v3 = [(VSIdentityProviderPickerViewController_iOS *)self tableView];
  double v4 = [MEMORY[0x263F1C550] clearColor];
  [v3 setSectionIndexBackgroundColor:v4];

  id v5 = [(VSIdentityProviderPickerViewController_iOS *)self unfilteredDataSource];
  [v5 setTableView:v3];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F1CA58]), "initWithStyle:", objc_msgSend(v3, "style"));
  uint64_t v7 = [v6 tableView];
  uint64_t v8 = [MEMORY[0x263F1C550] clearColor];
  [v7 setSectionIndexBackgroundColor:v8];

  [v7 setDelegate:self];
  uint64_t v9 = [(VSIdentityProviderPickerViewController_iOS *)self filteredDataSource];
  [v9 setTableView:v7];
  long long v10 = (void *)[objc_alloc(MEMORY[0x263F1C958]) initWithSearchResultsController:v6];
  [(VSIdentityProviderPickerViewController_iOS *)self setSearchController:v10];
  uint64_t v11 = [v10 searchBar];
  long long v12 = [(VSIdentityProviderPickerViewController_iOS *)self searchBarDelegate];
  v31 = (void *)v11;
  [v12 setSearchBar:v11];

  unint64_t v13 = [(VSIdentityProviderPickerViewController_iOS *)self additionalProvidersMode];
  id v14 = [MEMORY[0x263EFF980] array];
  uint64_t v15 = [(VSIdentityProviderPickerViewController_iOS *)self titleForTableFooterView];
  if (v15) {
    [v14 addObject:v15];
  }
  v32 = v6;
  if (v13 == 3)
  {
    v16 = 0;
  }
  else
  {
    v17 = [(VSIdentityProviderPickerViewController_iOS *)self onboardingInfoCenter];
    v18 = [v17 tvProviderPrivacyButtonViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = v9;
      uint64_t v19 = v5;
      v20 = [v18 flow];
      v16 = [v20 localizedButtonTitle];

      if (v16) {
        [v14 addObject:v16];
      }
      id v5 = v19;
      uint64_t v9 = v29;
    }
    else
    {
      v16 = 0;
    }
  }
  id v21 = [MEMORY[0x263F089D8] string];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __57__VSIdentityProviderPickerViewController_iOS_viewDidLoad__block_invoke;
  v33[3] = &unk_265077C20;
  id v22 = v21;
  id v34 = v22;
  [v14 enumerateObjectsUsingBlock:v33];
  if ([v22 length])
  {
    v28 = v5;
    v30 = v9;
    id v23 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"footer"];
    [v23 setProperty:v22 forKey:*MEMORY[0x263F600E8]];
    if (v16)
    {
      v36.location = [v22 rangeOfString:v16];
      v24 = NSStringFromRange(v36);
      [v23 setProperty:v24 forKey:*MEMORY[0x263F600D0]];

      v25 = NSStringFromSelector(sel_showPrivacySheet_);
      [v23 setProperty:v25 forKey:*MEMORY[0x263F600C8]];

      v26 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
      [v23 setProperty:v26 forKey:*MEMORY[0x263F600E0]];
    }
    v27 = (void *)[objc_alloc(MEMORY[0x263F5FB88]) initWithSpecifier:v23];
    [v27 setPreservesSuperviewLayoutMargins:1];
    [(VSIdentityProviderPickerViewController_iOS *)self setFooterView:v27];

    id v5 = v28;
    uint64_t v9 = v30;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderPickerViewController_iOS;
  [(VSIdentityProviderPickerViewController_iOS *)&v4 viewDidAppear:a3];
  [(VSIdentityProviderPickerViewController_iOS *)self setReadyToHandleDeepLinks:1];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if ([a3 numberOfSections] - 1 == a4)
  {
    id v5 = [(VSIdentityProviderPickerViewController_iOS *)self footerView];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)filteredTableView
{
  unint64_t v2 = [(VSIdentityProviderPickerViewController_iOS *)self filteredDataSource];
  BOOL v3 = [v2 tableView];

  return v3;
}

- (void)setLayoutMarginsFollowReadableWidth:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VSIdentityProviderPickerViewController_iOS *)self tableView];
  [v5 setLayoutMarginsFollowReadableWidth:v3];

  id v6 = [(VSIdentityProviderPickerViewController_iOS *)self filteredTableView];
  [v6 setLayoutMarginsFollowReadableWidth:v3];
}

- (void)setSectionContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  uint64_t v8 = [(VSIdentityProviderPickerViewController_iOS *)self tableView];
  objc_msgSend(v8, "_setSectionContentInset:", top, left, bottom, right);

  id v9 = [(VSIdentityProviderPickerViewController_iOS *)self filteredTableView];
  objc_msgSend(v9, "_setSectionContentInset:", top, left, bottom, right);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = [(VSIdentityProviderPickerViewController_iOS *)self presentedViewController];

    if (v5) {
      [(VSIdentityProviderPickerViewController_iOS *)self dismissViewControllerAnimated:0 completion:0];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)VSIdentityProviderPickerViewController_iOS;
  [(VSIdentityProviderPickerViewController_iOS *)&v6 willMoveToParentViewController:v4];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VSIdentityProviderPickerViewController_iOS;
  [(VSIdentityProviderPickerViewController_iOS *)&v5 viewDidLayoutSubviews];
  [(VSIdentityProviderPickerViewController_iOS *)self setLayoutMarginsFollowReadableWidth:[(VSIdentityProviderPickerViewController_iOS *)self _shouldInsetListView]];
  BOOL v3 = [(VSIdentityProviderPickerViewController_iOS *)self tableView];
  objc_msgSend(v3, "_setSectionContentInsetFollowsLayoutMargins:", -[VSIdentityProviderPickerViewController_iOS _shouldInsetListView](self, "_shouldInsetListView"));

  id v4 = [(VSIdentityProviderPickerViewController_iOS *)self filteredTableView];
  objc_msgSend(v4, "_setSectionContentInsetFollowsLayoutMargins:", -[VSIdentityProviderPickerViewController_iOS _shouldInsetListView](self, "_shouldInsetListView"));
}

- (BOOL)_shouldInsetListView
{
  unint64_t v2 = [(VSIdentityProviderPickerViewController_iOS *)self view];
  BOOL v3 = [MEMORY[0x263F1C920] mainScreen];
  id v4 = [v3 traitCollection];

  if ([v4 userInterfaceIdiom] == 1) {
    goto LABEL_2;
  }
  if (!_os_feature_enabled_impl()) {
    goto LABEL_15;
  }
  [v2 frame];
  double Width = CGRectGetWidth(v15);
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F1D168], *MEMORY[0x263F1D160], 0);
  uint64_t v8 = [v4 preferredContentSizeCategory];
  int v9 = [v7 containsObject:v8];

  uint64_t v10 = [v4 horizontalSizeClass];
  if (Width <= 320.0 && (v9 & 1) != 0) {
    goto LABEL_15;
  }
  BOOL v11 = Width <= 320.0;
  if (Width <= 320.0) {
    int v12 = 1;
  }
  else {
    int v12 = v9;
  }
  if (v10 != 2) {
    BOOL v11 = 1;
  }
  if ((v11 | v9 ^ 1) != 1 || v12 == 0) {
LABEL_2:
  }
    BOOL v5 = 1;
  else {
LABEL_15:
  }
    BOOL v5 = 0;

  return v5;
}

- (void)showPrivacySheet:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VSIdentityProviderPickerViewController_iOS *)self presentedViewController];

  if (v5)
  {
    objc_super v6 = [(VSIdentityProviderPickerViewController_iOS *)self presentedViewController];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__VSIdentityProviderPickerViewController_iOS_showPrivacySheet___block_invoke;
    v7[3] = &unk_265076FD0;
    v7[4] = self;
    id v8 = v4;
    [v6 dismissViewControllerAnimated:1 completion:v7];
  }
  else
  {
    [(VSIdentityProviderPickerViewController_iOS *)self _showPrivacySheet:v4];
  }
}

- (void)_showPrivacySheet:(id)a3
{
  id v4 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:0x26F363270];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)handleDestination:(id)a3 completion:(id)a4
{
  id v11 = a3;
  objc_super v6 = (void (**)(id, void, void *))a4;
  if ([v11 isEqual:@"signIn"])
  {
    [(VSIdentityProviderPickerViewController_iOS *)self handleSignInActionWithCompletion:v6];
  }
  else
  {
    uint64_t v7 = NSString;
    id v8 = [(VSIdentityProviderPickerViewController_iOS *)self debugDescription];
    int v9 = [v7 stringWithFormat:@"Unexpected destination %@ for %@", v11, v8];
    uint64_t v10 = VSDestinationError(2, v9);
    v6[2](v6, 0, v10);
  }
}

- (void)handleSignInActionWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__VSIdentityProviderPickerViewController_iOS_handleSignInActionWithCompletion___block_invoke;
  v6[3] = &unk_265077BF8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UIViewController *)self vs_makeTopmostInNavigationStack:1 completion:v6];
}

- (VSIdentityProviderPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSIdentityProviderPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (NSArray)identityProviders
{
  return self->_identityProviders;
}

- (void)setIdentityProviders:(id)a3
{
}

- (unint64_t)additionalProvidersMode
{
  return self->_additionalProvidersMode;
}

- (NSString)requestingAppDisplayName
{
  return self->_requestingAppDisplayName;
}

- (NSString)resourceTitle
{
  return self->_resourceTitle;
}

- (void)setSearchController:(id)a3
{
}

- (NSString)requestedStorefrontCountryCode
{
  return self->_requestedStorefrontCountryCode;
}

- (NSArray)allStorefronts
{
  return self->_allStorefronts;
}

- (void)setAllStorefronts:(id)a3
{
}

- (VSOnboardingInfoCenter)onboardingInfoCenter
{
  return self->_onboardingInfoCenter;
}

- (void)setOnboardingInfoCenter:(id)a3
{
}

- (VSIdentityProviderFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (VSSearchBarDelegate)searchBarDelegate
{
  return self->_searchBarDelegate;
}

- (void)setSearchBarDelegate:(id)a3
{
}

- (VSIdentityProviderTableViewDataSource)unfilteredDataSource
{
  return self->_unfilteredDataSource;
}

- (void)setUnfilteredDataSource:(id)a3
{
}

- (VSIdentityProviderTableViewDataSource)filteredDataSource
{
  return self->_filteredDataSource;
}

- (void)setFilteredDataSource:(id)a3
{
}

- (VSFontCenter)fontCenter
{
  return self->_fontCenter;
}

- (void)setFontCenter:(id)a3
{
}

- (VSIdentityProvider)selectedIdentityProvider
{
  return self->_selectedIdentityProvider;
}

- (void)setSelectedIdentityProvider:(id)a3
{
}

- (BOOL)sectionContentInsetInitialized
{
  return self->_sectionContentInsetInitialized;
}

- (void)setSectionContentInsetInitialized:(BOOL)a3
{
  self->_sectionContentInsetInitialized = a3;
}

- (NSDictionary)providersByStorefrontCountryCode
{
  return self->_providersByStorefrontCountryCode;
}

- (void)setProvidersByStorefrontCountryCode:(id)a3
{
}

- (NSArray)tvProviderSupportedStorefronts
{
  return self->_tvProviderSupportedStorefronts;
}

- (void)setTvProviderSupportedStorefronts:(id)a3
{
}

- (NSArray)identityProvidersToDisplay
{
  return self->_identityProvidersToDisplay;
}

- (void)setIdentityProvidersToDisplay:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (VSStorefrontFilter)storefrontFilter
{
  return self->_storefrontFilter;
}

- (void)setStorefrontFilter:(id)a3
{
}

- (void)setFirstSectionHeaderView:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (BOOL)isReadyToHandleDeepLinks
{
  return self->_readyToHandleDeepLinks;
}

- (void)setReadyToHandleDeepLinks:(BOOL)a3
{
  self->_readyToHandleDeepLinks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_firstSectionHeaderView, 0);
  objc_storeStrong((id *)&self->_storefrontFilter, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_identityProvidersToDisplay, 0);
  objc_storeStrong((id *)&self->_tvProviderSupportedStorefronts, 0);
  objc_storeStrong((id *)&self->_providersByStorefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_selectedIdentityProvider, 0);
  objc_storeStrong((id *)&self->_fontCenter, 0);
  objc_storeStrong((id *)&self->_filteredDataSource, 0);
  objc_storeStrong((id *)&self->_unfilteredDataSource, 0);
  objc_storeStrong((id *)&self->_searchBarDelegate, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_onboardingInfoCenter, 0);
  objc_storeStrong((id *)&self->_allStorefronts, 0);
  objc_storeStrong((id *)&self->_requestedStorefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_resourceTitle, 0);
  objc_storeStrong((id *)&self->_requestingAppDisplayName, 0);
  objc_storeStrong((id *)&self->_identityProviders, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end