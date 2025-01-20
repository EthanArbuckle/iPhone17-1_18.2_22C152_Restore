@interface PSSearchController
- (BOOL)_setBoolValue:(BOOL)a3 forIvar:(BOOL *)a4;
- (BOOL)activateWithInitialText:(id)a3 animated:(BOOL)a4;
- (BOOL)isActive;
- (BOOL)searchResultsController:(id)a3 shouldShowSwitchForSearchEntry:(id)a4;
- (Class)rootSearchControllerClassForSearchModel:(id)a3;
- (PSListController)listController;
- (PSSearchController)initWithListController:(id)a3;
- (PSSearchControllerDelegate)delegate;
- (UISearchBar)searchBar;
- (id)iconForSearchEntryHandler;
- (id)rootSpecifiersForSearchModel:(id)a3;
- (id)searchResultsController:(id)a3 iconForSearchEntry:(id)a4;
- (id)searchResultsController:(id)a3 switchActionForSearchEntry:(id)a4;
- (void)_buildSearchUIIfNecessary;
- (void)_reloadSettings:(BOOL)a3;
- (void)_updateListControllerHeaderView:(BOOL)a3;
- (void)_updateSearchResultsWithText:(id)a3;
- (void)addRootSpecifiers:(id)a3;
- (void)dealloc;
- (void)didDismissSearchController:(id)a3;
- (void)reloadRootSpecifiers:(id)a3;
- (void)removeRootSpecifiers:(id)a3;
- (void)searchModel:(id)a3 updatedWithNewResults:(id)a4 forQuery:(id)a5;
- (void)searchModelDidFinishIndexing:(id)a3;
- (void)searchModelWillBeginIndexing:(id)a3;
- (void)searchResultsController:(id)a3 didSelectSearchEntry:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIconForSearchEntryHandler:(id)a3;
- (void)setSearchBarVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation PSSearchController

- (PSSearchController)initWithListController:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PSSearchController;
  v5 = [(PSSearchController *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_listController, v4);
    v7 = +[PSSearchModel sharedInstance];
    [v7 addDelegate:v6];

    v8 = +[PSSearchModel sharedInstance];
    [v8 setDataSource:v6];

    v6->_searchEnabled = 1;
    v9 = [MEMORY[0x1E4F42948] currentDevice];
    int v10 = objc_msgSend(v9, "sf_isInternalInstall");

    if (v10)
    {
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3032000000;
      v16[3] = __Block_byref_object_copy__6;
      v16[4] = __Block_byref_object_dispose__6;
      v11 = v6;
      v17 = v11;
      v12 = MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __45__PSSearchController_initWithListController___block_invoke;
      handler[3] = &unk_1E5C5F000;
      handler[4] = v16;
      notify_register_dispatch("com.apple.preferences.internal.searchSettingsChanged", v11 + 7, v12, handler);

      [v11 _reloadSettings:0];
      _Block_object_dispose(v16, 8);
    }
    [(PSSearchController *)v6 _buildSearchUIIfNecessary];
  }

  return v6;
}

uint64_t __45__PSSearchController_initWithListController___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _reloadSettings:1];
}

- (void)dealloc
{
  v3 = +[PSSearchModel sharedInstance];
  [v3 removeDelegate:self];

  id v4 = [MEMORY[0x1E4F42948] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5) {
    notify_cancel(self->_notifyToken);
  }
  v6.receiver = self;
  v6.super_class = (Class)PSSearchController;
  [(PSSearchController *)&v6 dealloc];
}

- (UISearchBar)searchBar
{
  return [(UISearchController *)self->_searchController searchBar];
}

- (void)_buildSearchUIIfNecessary
{
  if (!self->_resultsController)
  {
    v3 = objc_alloc_init(PSSearchResultsController);
    resultsController = self->_resultsController;
    self->_resultsController = v3;

    [(PSSearchResultsController *)self->_resultsController setModalPresentationStyle:3];
    [(PSSearchResultsController *)self->_resultsController setDelegate:self];
  }
  if (!self->_searchController)
  {
    int v5 = [[PSUISearchController alloc] initWithSearchResultsController:self->_resultsController];
    searchController = self->_searchController;
    self->_searchController = &v5->super;

    [(UISearchController *)self->_searchController setDelegate:self];
    [(UISearchController *)self->_searchController setSearchResultsUpdater:self];
    id v8 = [(UISearchController *)self->_searchController searchBar];
    v7 = PS_LocalizedString(@"SEARCH_SETTINGS_PLACEHOLDER");
    [v8 setPlaceholder:v7];

    [v8 sizeToFit];
  }
}

- (BOOL)_setBoolValue:(BOOL)a3 forIvar:(BOOL *)a4
{
  BOOL result = *a4 != a3;
  *a4 = a3;
  return result;
}

- (void)_reloadSettings:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [MEMORY[0x1E4F42948] currentDevice];
  int v6 = objc_msgSend(v5, "sf_isInternalInstall");

  if (v6)
  {
    v7 = [MEMORY[0x1E4F42948] currentDevice];
    if (objc_msgSend(v7, "sf_isInternalInstall"))
    {
      Boolean keyExistsAndHasValidFormat = 0;
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PSSearchIsEnabled", @"com.apple.Preferences", &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat) {
        BOOL v9 = AppBooleanValue == 0;
      }
      else {
        BOOL v9 = 0;
      }
      uint64_t v10 = !v9;
    }
    else
    {
      uint64_t v10 = 1;
    }

    if ([(PSSearchController *)self _setBoolValue:v10 forIvar:&self->_searchEnabled])
    {
      [(PSSearchController *)self _updateListControllerHeaderView:0];
      if (v3 && self->_searchEnabled) {
        [(PSSearchResultsController *)self->_resultsController reloadData];
      }
    }
  }
}

- (void)_updateListControllerHeaderView:(BOOL)a3
{
  if (a3
    || (id v4 = objc_loadWeakRetained((id *)&self->_listController),
        int v5 = [v4 isViewLoaded],
        v4,
        v5))
  {
    if (self->_searchEnabled)
    {
      id v12 = [(PSSearchController *)self searchBar];
    }
    else
    {
      id v12 = 0;
    }
    p_listController = &self->_listController;
    id WeakRetained = objc_loadWeakRetained((id *)p_listController);
    id v8 = [WeakRetained table];
    id v9 = [v8 tableHeaderView];

    if (v9 != v12)
    {
      id v10 = objc_loadWeakRetained((id *)p_listController);
      v11 = [v10 table];
      [v11 setTableHeaderView:v12];
    }
  }
}

- (BOOL)isActive
{
  return [(UISearchController *)self->_searchController isActive];
}

- (void)setActive:(BOOL)a3
{
}

- (void)setSearchBarVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_listController = &self->_listController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v18 = [WeakRetained table];

  id v9 = objc_loadWeakRetained((id *)p_listController);
  id v10 = [v9 view];
  v11 = [v10 safeAreaLayoutGuide];
  [v11 layoutFrame];
  double v13 = v12;

  v14 = [(PSSearchController *)self searchBar];
  [v14 frame];
  double v16 = v15;

  double v17 = -v13;
  if (!v5) {
    double v17 = v16 - v13;
  }
  objc_msgSend(v18, "setContentOffset:animated:", v4, 0.0, v17);
}

- (BOOL)activateWithInitialText:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  if (-[PSSearchController isActive](self, "isActive") || ![v5 length])
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = 1;
    [(PSSearchController *)self setActive:1];
    v7 = [(PSSearchController *)self searchBar];
    [v7 becomeFirstResponder];

    id v8 = [(PSSearchController *)self searchBar];
    [v8 setText:v5];

    [(PSSearchController *)self _updateSearchResultsWithText:v5];
  }

  return v6;
}

- (void)addRootSpecifiers:(id)a3
{
}

void __40__PSSearchController_addRootSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PSSearchModel sharedInstance];
  [v3 addRootSpecifier:v2];
}

- (void)reloadRootSpecifiers:(id)a3
{
}

void __43__PSSearchController_reloadRootSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PSSearchModel sharedInstance];
  [v3 reloadRootSpecifier:v2];
}

- (void)removeRootSpecifiers:(id)a3
{
}

void __43__PSSearchController_removeRootSpecifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PSSearchModel sharedInstance];
  [v3 removeRootSpecifier:v2];
}

- (BOOL)searchResultsController:(id)a3 shouldShowSwitchForSearchEntry:(id)a4
{
  return 0;
}

- (void)searchResultsController:(id)a3 didSelectSearchEntry:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [v5 isRootURL];
  v7 = [v5 url];

  if (v7)
  {
    id v8 = _PSLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = @"NO";
      if (v6) {
        id v9 = @"YES";
      }
      int v11 = 138412546;
      double v12 = v7;
      __int16 v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1A6597000, v8, OS_LOG_TYPE_DEFAULT, "Opening URL %@, is root: %@", (uint8_t *)&v11, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchController:self openURL:v7];
  }
}

- (id)searchResultsController:(id)a3 switchActionForSearchEntry:(id)a4
{
  return +[PSSpecifierAction actionWithGetter:&__block_literal_global_24_0 setter:&__block_literal_global_28];
}

id __73__PSSearchController_searchResultsController_switchActionForSearchEntry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 target];
    if (v4 && v3[2] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v5 = [v3 performGetter];

      goto LABEL_8;
    }
  }
  id v5 = +[PSRootController readPreferenceValue:v3];
LABEL_8:

  return v5;
}

void __73__PSSearchController_searchResultsController_switchActionForSearchEntry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v4 = a3;
  id v5 = v8;
  id v6 = v4;
  if (v8)
  {
    v7 = [v8 target];
    if (v7 && v8[3] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v8 performSetterWithValue:v6];

      goto LABEL_8;
    }

    id v5 = v8;
  }
  +[PSRootController setPreferenceValue:v6 specifier:v5];
LABEL_8:
}

- (id)searchResultsController:(id)a3 iconForSearchEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v9 = [v7 identifier];
  id v10 = [WeakRetained specifierForID:v9];

  iconForSearchEntryHandler = (void (**)(id, id, id, void *))self->_iconForSearchEntryHandler;
  if (iconForSearchEntryHandler)
  {
    double v12 = iconForSearchEntryHandler[2](iconForSearchEntryHandler, v6, v7, v10);
    goto LABEL_14;
  }
  __int16 v13 = [v10 propertyForKey:@"searchIcon"];
  if ([v13 length])
  {
    v14 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v16 = [MEMORY[0x1E4F42D90] mainScreen];
    double v17 = [v16 traitCollection];
    double v12 = [v14 imageNamed:v13 inBundle:v15 compatibleWithTraitCollection:v17];
  }
  else
  {
    double v12 = [v10 propertyForKey:@"iconImage"];
    if (v12) {
      goto LABEL_13;
    }
    id v18 = [v10 propertyForKey:@"useLazyIcons"];
    int v19 = [v18 BOOLValue];

    if (!v19)
    {
      double v12 = 0;
      goto LABEL_13;
    }
    uint64_t v15 = [v10 propertyForKey:@"appIDForLazyIcon"];
    if (v15)
    {
      v20 = (void *)MEMORY[0x1E4F42A80];
      v21 = [MEMORY[0x1E4F42D90] mainScreen];
      [v21 scale];
      double v12 = objc_msgSend(v20, "_applicationIconImageForBundleIdentifier:format:scale:", v15, 0);

      if (v12)
      {
        v22 = [v10 propertyForKey:@"dontUnloadLazyIcon"];
        int v23 = [v22 BOOLValue];

        if (v23) {
          [v10 setProperty:v12 forKey:@"iconImage"];
        }
      }
    }
    else
    {
      double v12 = 0;
    }
  }

LABEL_13:
LABEL_14:

  return v12;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v5 = [a3 searchBar];
  id v4 = [v5 text];
  [(PSSearchController *)self _updateSearchResultsWithText:v4];
}

- (void)willPresentSearchController:(id)a3
{
  id v3 = +[PSSearchModel sharedInstance];
  [v3 preheat];
}

- (void)didDismissSearchController:(id)a3
{
}

- (void)_updateSearchResultsWithText:(id)a3
{
  id v3 = a3;
  id v4 = +[PSSearchModel sharedInstance];
  [v4 searchForQuery:v3];
}

- (void)searchModel:(id)a3 updatedWithNewResults:(id)a4 forQuery:(id)a5
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PSSearchController_searchModel_updatedWithNewResults_forQuery___block_invoke;
  v8[3] = &unk_1E5C5DDD0;
  id v9 = v6;
  id v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __65__PSSearchController_searchModel_updatedWithNewResults_forQuery___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTreatSectionEntriesAsRegularEntries:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 16);
  return [v3 setSearchResults:v2];
}

- (void)searchModelWillBeginIndexing:(id)a3
{
}

void __51__PSSearchController_searchModelWillBeginIndexing___block_invoke()
{
  id v0 = [MEMORY[0x1E4F42738] sharedApplication];
  [v0 setNetworkActivityIndicatorVisible:1];
}

- (void)searchModelDidFinishIndexing:(id)a3
{
}

void __51__PSSearchController_searchModelDidFinishIndexing___block_invoke()
{
  id v0 = [MEMORY[0x1E4F42738] sharedApplication];
  [v0 setNetworkActivityIndicatorVisible:0];
}

- (id)rootSpecifiersForSearchModel:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained rootSpecifiersForSearchController:self];

  return v5;
}

- (Class)rootSearchControllerClassForSearchModel:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = objc_opt_class();

  return (Class)v4;
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (PSSearchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSSearchControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)iconForSearchEntryHandler
{
  return self->_iconForSearchEntryHandler;
}

- (void)setIconForSearchEntryHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_iconForSearchEntryHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end