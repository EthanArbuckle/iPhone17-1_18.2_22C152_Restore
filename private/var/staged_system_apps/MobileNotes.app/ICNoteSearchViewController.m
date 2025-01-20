@interface ICNoteSearchViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)isActive;
- (BOOL)queryDidExist;
- (BOOL)searchBarContainsQuery;
- (BOOL)showCompactFloatingSuggestions;
- (BOOL)showsFloatingSuggestions;
- (ICNASearchResultExposureReporter)searchResultExposureReporter;
- (ICNoteSearchDataSource)searchDataSource;
- (ICNoteSearchViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4;
- (ICNoteSearchViewControllerCollectionViewDelegate)collectionViewDelegate;
- (ICSearchSuggestionController)suggestionsController;
- (ICSearchSuggestionsContext)searchContext;
- (NSObject)noteMigrationObserver;
- (NSString)accountIdentifier;
- (NSString)searchSessionID;
- (UIScrollView)observableScrollView;
- (UISearchBar)searchBar;
- (UISearchController)searchController;
- (id)contentUnavailableConfigurationState;
- (unint64_t)state;
- (void)_dci_updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4;
- (void)cancelSearch;
- (void)dealloc;
- (void)processSelectedSearchSuggestion:(id)a3;
- (void)registerForTraitChanges;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchDataSourceDidUpdateSuggestions:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setCollectionViewDelegate:(id)a3;
- (void)setNoteContainerViewMode:(int64_t)a3;
- (void)setNoteMigrationObserver:(id)a3;
- (void)setObservableScrollView:(id)a3;
- (void)setQueryDidExist:(BOOL)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchContext:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchDataSource:(id)a3;
- (void)setSearchResultExposureReporter:(id)a3;
- (void)setSearchSessionID:(id)a3;
- (void)setShowCompactFloatingSuggestions:(BOOL)a3;
- (void)setShowsFloatingSuggestions:(BOOL)a3;
- (void)setSuggestions:(id)a3;
- (void)setSuggestionsController:(id)a3;
- (void)startSearchBecomeFirstResponder:(BOOL)a3;
- (void)submitSearchResultSelectEventWithSearchResult:(id)a3 diffableDataSourceSnapshot:(id)a4;
- (void)updateCollectionViewForCurrentViewMode;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)updateFromSearchContext;
- (void)updateSearchAccountIdentifierWithSelectedScope:(unint64_t)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateSearchResultsVisibility;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICNoteSearchViewController

- (ICNoteSearchViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICNoteSearchViewController;
  v7 = [(ICNoteResultsViewController *)&v17 initWithViewMode:a3 viewControllerManager:v6 viewControllerType:1];
  if (v7)
  {
    id v8 = objc_alloc((Class)ICNASearchResultExposureReporter);
    v9 = [v6 window];
    v10 = (ICNASearchResultExposureReporter *)[v8 initWithWindow:v9];
    searchResultExposureReporter = v7->_searchResultExposureReporter;
    v7->_searchResultExposureReporter = v10;

    if ((+[ICSearchSuggestionsContext supportsSearchSuggestions] & 1) == 0)
    {
      v12 = [ICSearchSuggestionController alloc];
      v13 = [(ICNoteSearchViewController *)v7 view];
      v14 = [(ICSearchSuggestionController *)v12 initWithParentView:v13 delegate:v7];
      suggestionsController = v7->_suggestionsController;
      v7->_suggestionsController = v14;
    }
    v7->_showCompactFloatingSuggestions = 0;
    [(ICNoteSearchViewController *)v7 registerForTraitChanges];
  }

  return v7;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)ICNoteSearchViewController;
  [(ICNoteResultsViewController *)&v13 viewDidLoad];
  [(ICNoteSearchViewController *)self updateCollectionViewForCurrentViewMode];
  objc_initWeak(&location, self);
  v3 = +[ICNoteContext sharedContext];
  v4 = [v3 crossProcessChangeCoordinator];
  uint64_t v5 = ICLockedNotesModeMigratorDidMigrateNoteNotification;
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_1000674E4;
  v10 = &unk_100625938;
  objc_copyWeak(&v11, &location);
  id v6 = [v4 registerForCrossProcessNotificationName:v5 block:&v7];
  -[ICNoteSearchViewController setNoteMigrationObserver:](self, "setNoteMigrationObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICNoteSearchViewController;
  [(ICNoteResultsViewController *)&v8 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"ICNoteSearchViewControllerDidUpdateSearchAppearanceNotification" object:0];

  if (+[ICSearchSuggestionsContext supportsSearchSuggestions])
  {
    uint64_t v5 = [(ICNoteSearchViewController *)self searchController];
    [(ICNoteSearchViewController *)self updateSearchResultsForSearchController:v5];
  }
  id v6 = [(ICNoteSearchViewController *)self eventReporter];
  [v6 submitSearchAttemptEvent];

  [(ICNoteSearchViewController *)self updateSearchResultsVisibility];
  v7 = +[NotesApp sharedNotesApp];
  [v7 refreshNotesIfNeededForCollection:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004D50DC(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  objc_super v13 = [(ICNoteSearchViewController *)self searchDataSource];
  [v13 cancelSearchQuery];

  v14 = +[NSNotificationCenter defaultCenter];
  [v14 postNotificationName:@"ICNoteSearchViewControllerDidUpdateSearchAppearanceNotification" object:0];

  v15.receiver = self;
  v15.super_class = (Class)ICNoteSearchViewController;
  [(ICNoteSearchViewController *)&v15 viewWillDisappear:v3];
}

- (void)dealloc
{
  BOOL v3 = +[ICNoteContext sharedContext];
  v4 = [v3 crossProcessChangeCoordinator];
  uint64_t v5 = [(ICNoteSearchViewController *)self noteMigrationObserver];
  [v4 removeCrossProcessNotificationObserver:v5];

  v6.receiver = self;
  v6.super_class = (Class)ICNoteSearchViewController;
  [(ICNoteResultsViewController *)&v6 dealloc];
}

- (void)registerForTraitChanges
{
  id v4 = +[UITraitCollection ic_traitsAffectingSizeAndColor];
  id v3 = [(ICNoteSearchViewController *)self registerForTraitChanges:v4 withAction:"updateSearchResultsVisibility"];
}

- (void)setSearchBar:(id)a3
{
  p_searchBar = &self->_searchBar;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_searchBar, v6);
  [v6 setDelegate:self];
}

- (BOOL)isActive
{
  v2 = [(ICNoteSearchViewController *)self searchController];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountIdentifier, a3);
  id v4 = [(ICNoteSearchViewController *)self searchBar];
  -[ICNoteSearchViewController updateSearchAccountIdentifierWithSelectedScope:](self, "updateSearchAccountIdentifierWithSelectedScope:", [v4 selectedScopeButtonIndex]);
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteSearchViewController;
  [(ICBaseViewController *)&v4 setNoteContainerViewMode:a3];
  [(ICNoteSearchViewController *)self updateCollectionViewForCurrentViewMode];
}

- (void)updateCollectionViewForCurrentViewMode
{
  unsigned __int8 v3 = [(ICNoteResultsViewController *)self collectionView];

  if (!v3)
  {
    objc_super v4 = [ICNoteSearchCollectionView alloc];
    id v5 = [(ICBaseViewController *)self legacyViewContext];
    id v6 = [(ICBaseViewController *)self modernViewContext];
    uint64_t v7 = [(ICBaseViewController *)self viewControllerManager];
    uint64_t v8 = [(ICNoteBrowseCollectionView *)v4 initWithPresentingViewController:self legacyManagedObjectContext:v5 modernManagedObjectContext:v6 viewControllerManager:v7];
    [(ICNoteResultsViewController *)self setCollectionView:v8];

    uint64_t v9 = [(ICNoteSearchViewController *)self collectionViewDelegate];
    uint64_t v10 = [(ICNoteResultsViewController *)self collectionView];
    [v10 setDelegate:v9];

    uint64_t v11 = [(ICNoteSearchViewController *)self view];
    uint64_t v12 = [(ICNoteResultsViewController *)self collectionView];
    [v11 addSubview:v12];

    objc_super v13 = [(ICNoteResultsViewController *)self collectionView];
    [v13 ic_addAnchorsToFillSuperviewWithHorizontalPadding:1 verticalPadding:0.0 usesSafeAreaLayoutGuideHorizontally:0.0 usesSafeAreaLayoutGuideVertically:0.0];
  }
  v14 = [ICNoteSearchDataSource alloc];
  objc_super v15 = [(ICNoteResultsViewController *)self collectionView];
  int64_t v16 = [(ICBaseViewController *)self noteContainerViewMode];
  objc_super v17 = [(ICBaseViewController *)self viewControllerManager];
  v18 = [(ICBaseViewController *)self legacyViewContext];
  v19 = [(ICBaseViewController *)self modernViewContext];
  v20 = [(ICNoteSearchViewController *)self searchContext];
  v21 = [(ICNoteSearchDataSource *)v14 initWithCollectionView:v15 noteContainerViewMode:v16 viewControllerManager:v17 legacyViewContext:v18 modernViewContext:v19 searchContext:v20];
  [(ICNoteSearchViewController *)self setSearchDataSource:v21];

  v22 = [(ICNoteSearchViewController *)self searchDataSource];
  [v22 setDelegate:self];

  v23 = [(ICNoteSearchViewController *)self dataSource];
  v24 = [v23 collectionViewDiffableDataSource];
  v25 = [(ICNoteResultsViewController *)self collectionView];
  [v25 setDiffableDataSource:v24];

  int64_t v26 = [(ICBaseViewController *)self noteContainerViewMode];
  v27 = [(ICNoteResultsViewController *)self collectionView];
  [v27 setNoteContainerViewMode:v26];

  BOOL v28 = [(ICBaseViewController *)self noteContainerViewMode] == 0;
  id v29 = [(ICNoteResultsViewController *)self collectionView];
  [v29 setSelectionFollowsFocus:v28];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  if ([(ICNoteSearchViewController *)self searchBarContainsQuery])
  {
    id v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1004D5114(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v14 = [(ICNoteSearchViewController *)self searchDataSource];
    [v14 cancelSearchQuery];
  }
  [(ICNoteSearchViewController *)self updateSearchAccountIdentifierWithSelectedScope:a4];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, a3);
  id v4 = [(ICNoteSearchViewController *)self searchDataSource];
  [v4 switchToMode:2];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  if (![v4 isBeingPresented]
    || [(ICNoteSearchViewController *)self searchBarContainsQuery]
    || +[ICSearchSuggestionsContext supportsSearchSuggestions])
  {
    id v5 = [v4 searchBar];
    id v6 = [v5 text];

    uint64_t v7 = [v4 searchBar];
    uint64_t v8 = [v7 searchTextField];
    uint64_t v9 = [v8 tokens];

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100068274;
    v45[3] = &unk_100626988;
    id v10 = objc_alloc_init((Class)NSMutableArray);
    id v46 = v10;
    v44 = v9;
    [v9 enumerateObjectsUsingBlock:v45];
    uint64_t v11 = [(ICNoteSearchViewController *)self searchBar];
    uint64_t v12 = [v11 textInputMode];
    uint64_t v13 = [v12 primaryLanguage];

    id v14 = [objc_alloc((Class)ICSearchUserInput) initWithSearchString:v6 tokens:v10 keyboardLanguage:v13];
    +[ICSearchProfiler resetProfileTimer];
    +[ICSearchProfiler logProfilingWithMessage:@"ICNotesSearchresultsController updateSearchResultsForSearchController:"];
    objc_super v15 = [(ICBaseViewController *)self viewControllerManager];
    int64_t v16 = [v15 noteEditorViewController];
    unsigned int v17 = [v16 ic_isViewVisible];

    if (v17)
    {
      if ([v6 length]) {
        id v18 = [objc_alloc((Class)ICSearchResultRegexMatchFinder) initWithSearchString:v6];
      }
      else {
        id v18 = 0;
      }
      v19 = [(ICBaseViewController *)self viewControllerManager];
      v20 = [v19 noteEditorViewController];
      [v20 highlightSearchMatchesForRegexFinder:v18];
    }
    if ([v14 isEmpty])
    {
      v21 = [(ICNoteSearchViewController *)self searchResultExposureReporter];
      [v21 submitEventIfApplicable];

      [(ICNoteSearchViewController *)self setSearchSessionID:0];
      v22 = [(ICNoteSearchViewController *)self searchResultExposureReporter];
      [v22 invalidateSearchSessionID];

      v23 = [(ICBaseViewController *)self viewControllerManager];
      v24 = [v23 legacyNoteEditorViewController];
      v25 = [v24 eventReporter];
      [v25 popSearchData];

      int64_t v26 = [(ICBaseViewController *)self viewControllerManager];
      v27 = [v26 noteEditorViewController];
      BOOL v28 = [v27 eventReporter];
      [v28 popSearchData];
    }
    else
    {
      id v29 = [(ICNoteSearchViewController *)self searchSessionID];

      if (v29)
      {
LABEL_14:
        v41 = [(ICNoteSearchViewController *)self searchResultExposureReporter];
        v42 = [v14 searchString];
        [v41 startTrackingNewSearchString:v42];

        v43 = [(ICNoteSearchViewController *)self searchDataSource];
        [v43 searchWithUserInput:v14 updateHandler:0];

        [(ICNoteSearchViewController *)self updateSearchResultsVisibility];
        goto LABEL_15;
      }
      v30 = +[NSUUID UUID];
      v31 = [v30 UUIDString];
      [(ICNoteSearchViewController *)self setSearchSessionID:v31];

      v32 = [(ICNoteSearchViewController *)self searchResultExposureReporter];
      v33 = [(ICNoteSearchViewController *)self searchSessionID];
      [v32 updateSearchSessionID:v33];

      v34 = [(ICNoteSearchViewController *)self eventReporter];
      v35 = [(ICNoteSearchViewController *)self searchSessionID];
      [v34 submitSearchInitiateEventWithSearchSessionID:v35 suggestionTypeOfFirstItemInTokens:[ICSearchToken suggestionTypeOfFirstItemInTokens:v10]];

      v36 = [(ICBaseViewController *)self viewControllerManager];
      v37 = [v36 legacyNoteEditorViewController];
      v38 = [v37 eventReporter];
      v39 = [(ICNoteSearchViewController *)self searchSessionID];
      [v38 pushSearchDataWithSearchSessionID:v39];

      int64_t v26 = [(ICBaseViewController *)self viewControllerManager];
      v27 = [v26 noteEditorViewController];
      BOOL v28 = [v27 eventReporter];
      v40 = [(ICNoteSearchViewController *)self searchSessionID];
      [v28 pushSearchDataWithSearchSessionID:v40];
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)_dci_updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  id v6 = [v5 representedObject];

  ICDynamicCast();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = v8;
  if (v8)
  {
    [(ICNoteSearchViewController *)self processSelectedSearchSuggestion:v8];
    uint64_t v7 = v8;
  }
}

- (void)searchDataSourceDidUpdateSuggestions:(id)a3
{
  id v6 = a3;
  if (+[ICSearchSuggestionsContext supportsSearchSuggestions])
  {
    id v4 = [v6 snapshot];
    id v5 = [v4 currentSuggestions];
    [(ICNoteSearchViewController *)self setSuggestions:v5];
  }
}

- (void)setSuggestions:(id)a3
{
  id v9 = a3;
  if ([(ICNoteSearchViewController *)self showCompactFloatingSuggestions])
  {
    id v4 = [v9 ic_map:&stru_1006269C8];
    id v5 = [(ICNoteSearchViewController *)self searchController];
    [v5 _dci_setSearchSuggestions:v4];
  }
  else
  {
    id v6 = [(ICNoteSearchViewController *)self searchController];
    uint64_t v7 = [v6 _dci_searchSuggestions];
    id v8 = [v7 count];

    if (!v8) {
      goto LABEL_6;
    }
    id v4 = [(ICNoteSearchViewController *)self searchController];
    [v4 _dci_setSearchSuggestions:&__NSArray0__struct];
  }

LABEL_6:
}

- (ICNoteSearchViewControllerCollectionViewDelegate)collectionViewDelegate
{
  collectionViewDelegate = self->_collectionViewDelegate;
  if (!collectionViewDelegate)
  {
    id v4 = [[ICNoteSearchViewControllerCollectionViewDelegate alloc] initWithNoteSearchViewController:self];
    id v5 = self->_collectionViewDelegate;
    self->_collectionViewDelegate = v4;

    collectionViewDelegate = self->_collectionViewDelegate;
  }

  return collectionViewDelegate;
}

- (ICSearchSuggestionsContext)searchContext
{
  if (+[ICSearchSuggestionsContext supportsSearchSuggestions]&& !self->_searchContext)
  {
    unsigned __int8 v3 = (ICSearchSuggestionsContext *)objc_alloc_init((Class)ICSearchSuggestionsContext);
    searchContext = self->_searchContext;
    self->_searchContext = v3;
  }
  id v5 = self->_searchContext;

  return v5;
}

- (BOOL)searchBarContainsQuery
{
  unsigned __int8 v3 = [(ICNoteSearchViewController *)self searchBar];
  id v4 = [v3 text];
  unint64_t v5 = (unint64_t)[v4 length];

  id v6 = [(ICNoteSearchViewController *)self searchBar];
  uint64_t v7 = [v6 searchTextField];
  id v8 = [v7 tokens];
  unint64_t v9 = (unint64_t)[v8 count];

  return (v5 | v9) != 0;
}

- (BOOL)showsFloatingSuggestions
{
  if ((id)[(ICBaseViewController *)self noteContainerViewMode] == (id)1)
  {
    unsigned __int8 v3 = [(ICNoteSearchViewController *)self view];
    unsigned int v4 = [v3 ic_hasCompactSize] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)updateSearchResultsVisibility
{
  unsigned int v3 = [(ICNoteSearchViewController *)self queryDidExist];
  BOOL v4 = [(ICNoteSearchViewController *)self searchBarContainsQuery];
  if (v4) {
    unsigned int v5 = +[ICSearchSuggestionsContext supportsSearchSuggestions];
  }
  else {
    unsigned int v5 = 1;
  }
  [(ICNoteSearchViewController *)self setQueryDidExist:v4];
  if (+[ICSearchSuggestionsContext supportsSearchSuggestions])uint64_t v6 = [(ICNoteSearchViewController *)self showsFloatingSuggestions] & !v4; {
  else
  }
    uint64_t v6 = v4 ^ 1;
  uint64_t v7 = [(ICNoteResultsViewController *)self collectionView];
  [v7 setHidden:v6];

  id v8 = [(ICNoteSearchViewController *)self searchController];
  if (![v8 isActive])
  {

    if (![(ICNoteSearchViewController *)self showsFloatingSuggestions]) {
      goto LABEL_14;
    }
    uint64_t v11 = 0;
LABEL_13:
    [(ICNoteSearchViewController *)self setShowCompactFloatingSuggestions:v11];
    objc_super v15 = [(ICNoteSearchViewController *)self suggestionsController];
    [v15 hide];

    goto LABEL_16;
  }
  unint64_t v9 = [(ICNoteSearchViewController *)self searchController];
  unsigned int v10 = [v9 showsSearchResultsController];

  uint64_t v11 = v10 & v5;
  if ([(ICNoteSearchViewController *)self showsFloatingSuggestions]) {
    goto LABEL_13;
  }
  if (!v11)
  {
LABEL_14:
    uint64_t v12 = [(ICNoteSearchViewController *)self suggestionsController];
    [v12 hide];
    goto LABEL_15;
  }
  uint64_t v12 = [(ICNoteSearchViewController *)self suggestionsController];
  uint64_t v13 = [(ICNoteSearchViewController *)self transitionCoordinator];
  id v14 = [(ICNoteSearchViewController *)self searchBar];
  [v14 frame];
  [v12 showWithAnimated:1 transitionCoordinator:v13];

LABEL_15:
  [(ICNoteSearchViewController *)self setShowCompactFloatingSuggestions:0];
LABEL_16:
  int64_t v16 = [(ICNoteSearchViewController *)self suggestionsController];
  unsigned int v17 = [v16 collectionView];

  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    if ([(ICNoteSearchViewController *)self ic_behavior] == (id)1)
    {
      id v18 = +[UIColor secondarySystemBackgroundColor];
      v19 = [(ICNoteSearchViewController *)self view];
      [v19 setBackgroundColor:v18];
    }
    else
    {
      id v18 = [(ICNoteResultsViewController *)self collectionView];
      if ([v18 isHidden]) {
        +[UIColor clearColor];
      }
      else {
      v19 = +[UIColor systemGroupedBackgroundColor];
      }
      v20 = [(ICNoteSearchViewController *)self view];
      [v20 setBackgroundColor:v19];
    }
  }
  if (v3 != v4)
  {
    v21 = +[NSNotificationCenter defaultCenter];
    CFStringRef v28 = @"ICNoteSearchViewControllerQueryDidChangeNotificationQueryExistsKey";
    v22 = +[NSNumber numberWithBool:v4];
    id v29 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    [v21 postNotificationName:@"ICNoteSearchViewControllerQueryDidChangeNotification" object:self userInfo:v23];
  }
  if (!v4)
  {
    if ([(ICNoteSearchViewController *)self showsFloatingSuggestions])
    {
      id v27 = [(ICNoteSearchViewController *)self observableScrollView];
    }
    else
    {
      id v27 = v17;
    }
    v24 = v27;
    [(ICNoteSearchViewController *)self setContentScrollView:v27 forEdge:15];
    goto LABEL_33;
  }
  v24 = [(ICNoteResultsViewController *)self collectionView];
  [(ICNoteSearchViewController *)self setContentScrollView:v24 forEdge:15];
  v25 = [(ICNoteResultsViewController *)self collectionView];
  unsigned int v26 = [v25 isHidden];

  if (!v26)
  {
LABEL_33:
    [(ICNoteSearchViewController *)self setNeedsUpdateContentUnavailableConfiguration];
    goto LABEL_34;
  }
  [(ICNoteSearchViewController *)self performSelector:"setNeedsUpdateContentUnavailableConfiguration" withObject:0 afterDelay:0.8];
LABEL_34:
}

- (void)updateSearchAccountIdentifierWithSelectedScope:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v5 = [(ICNoteSearchViewController *)self accountIdentifier];
    BOOL v4 = [(ICNoteSearchViewController *)self searchDataSource];
    [v4 setAccountIdentifier:v5];
  }
  else
  {
    if (a3) {
      return;
    }
    id v5 = [(ICNoteSearchViewController *)self searchDataSource];
    [v5 setAccountIdentifier:0];
  }
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v23 = a3;
  switch([(ICNoteSearchViewController *)self state])
  {
    case 0uLL:
    case 2uLL:
      [(ICNoteSearchViewController *)self setContentUnavailableConfiguration:0];
      if ([(ICNoteSearchViewController *)self showsFloatingSuggestions]) {
        uint64_t v4 = [(ICNoteSearchViewController *)self searchBarContainsQuery] ^ 1;
      }
      else {
        uint64_t v4 = 0;
      }
      id v5 = [(ICNoteResultsViewController *)self collectionView];
      [v5 setHidden:v4];
      goto LABEL_14;
    case 1uLL:
      id v5 = +[UIContentUnavailableConfiguration loadingConfiguration];
      uint64_t v6 = +[NSBundle mainBundle];
      uint64_t v7 = [v6 localizedStringForKey:@"Searching…" value:&stru_10063F3D8 table:0];
      [v5 setText:v7];

      [(ICNoteSearchViewController *)self setContentUnavailableConfiguration:v5];
      id v8 = [(ICNoteResultsViewController *)self collectionView];
      [v8 setHidden:1];

      goto LABEL_14;
    case 3uLL:
      unint64_t v9 = +[UIContentUnavailableConfiguration searchConfiguration];
      id v5 = [v9 updatedConfigurationForState:v23];

      unsigned int v10 = +[UIImage systemImageNamed:@"magnifyingglass"];
      [v5 setImage:v10];

      uint64_t v11 = [v23 searchText];
      if ([v11 length])
      {
        uint64_t v12 = +[NSBundle mainBundle];
        uint64_t v13 = [v12 localizedStringForKey:@"No results for “%@”" value:&stru_10063F3D8 table:0];
        id v14 = [v23 searchText];
        objc_super v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v14);
      }
      else
      {
        uint64_t v12 = +[NSBundle mainBundle];
        objc_super v15 = [v12 localizedStringForKey:@"No results" value:&stru_10063F3D8 table:0];
      }

      [v5 setText:v15];
      int64_t v16 = [v23 customStateForKey:@"ICNoteEmptyStateActualSearchStringLengthKey"];
      id v17 = [v16 unsignedIntegerValue];

      id v18 = +[NSBundle mainBundle];
      v19 = v18;
      if (v17) {
        CFStringRef v20 = @"Check spelling or try a new search.";
      }
      else {
        CFStringRef v20 = @"Try a new search.";
      }
      v21 = [v18 localizedStringForKey:v20 value:&stru_10063F3D8 table:0];
      [v5 setSecondaryText:v21];

      [(ICNoteSearchViewController *)self setContentUnavailableConfiguration:v5];
      v22 = [(ICNoteResultsViewController *)self collectionView];
      [v22 setHidden:1];

LABEL_14:
      break;
    default:
      break;
  }
}

- (id)contentUnavailableConfigurationState
{
  v12.receiver = self;
  v12.super_class = (Class)ICNoteSearchViewController;
  unsigned int v3 = [(ICNoteSearchViewController *)&v12 contentUnavailableConfigurationState];
  uint64_t v4 = [(ICNoteSearchViewController *)self searchDataSource];
  id v5 = [v4 currentSearchUserInput];
  uint64_t v6 = [v5 displayString];
  [v3 setSearchText:v6];

  uint64_t v7 = [(ICNoteSearchViewController *)self searchDataSource];
  id v8 = [v7 currentSearchUserInput];
  unint64_t v9 = [v8 searchString];
  unsigned int v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 length]);
  [v3 setCustomState:v10 forKey:@"ICNoteEmptyStateActualSearchStringLengthKey"];

  return v3;
}

- (void)startSearchBecomeFirstResponder:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100069020;
  v3[3] = &unk_100625D18;
  v3[4] = self;
  BOOL v4 = a3;
  [(ICNoteSearchViewController *)self ic_performBlockAfterActiveTransition:v3];
}

- (void)cancelSearch
{
  unsigned int v3 = [(ICNoteSearchViewController *)self searchBar];
  BOOL v4 = [v3 text];
  id v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [(ICNoteSearchViewController *)self searchBar];
    uint64_t v7 = [v6 searchTextField];
    [v7 setText:&stru_10063F3D8];
  }
  id v8 = [(ICNoteSearchViewController *)self searchController];
  unsigned int v9 = [v8 isActive];

  if (v9)
  {
    unsigned int v10 = [(ICNoteSearchViewController *)self searchController];
    [v10 setActive:0];
  }
  uint64_t v11 = [(ICNoteSearchViewController *)self searchBar];
  objc_super v12 = [v11 searchTextField];
  uint64_t v13 = [v12 tokens];
  id v14 = [v13 count];

  if (v14)
  {
    id v16 = [(ICNoteSearchViewController *)self searchBar];
    objc_super v15 = [v16 searchTextField];
    [v15 setTokens:&__NSArray0__struct];
  }
}

- (void)submitSearchResultSelectEventWithSearchResult:(id)a3 diffableDataSourceSnapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    unsigned int v9 = (char *)[v7 indexOfItemIdentifier:v6];
    if (v9 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned int v10 = v9 + 1;
      CFStringRef v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_100069470;
      id v23 = &unk_1006269F0;
      id v24 = v8;
      uint64_t v11 = objc_retainBlock(&v20);
      uint64_t v12 = ((uint64_t (*)(void ***, const __CFString *))v11[2])(v11, @"ICNoteSearchDataSourceTopHitsSectionIdentifier");
      uint64_t v13 = ((uint64_t (*)(void ***, const __CFString *))v11[2])(v11, @"ICNoteSearchDataSourceNoteSectionIdentifier");
      uint64_t v14 = ((uint64_t (*)(void ***, const __CFString *))v11[2])(v11, @"ICNoteSearchDataSourceAttachmentSectionIdentifier");
      objc_super v15 = [(ICNoteSearchViewController *)self searchResultExposureReporter];
      [v15 updateSearchResultWasSelected:1];

      id v16 = [(ICNoteSearchViewController *)self eventReporter];
      id v17 = [(ICNoteSearchViewController *)self searchSessionID];
      id v18 = [v6 configuration];
      id v19 = [v18 searchStringLength];
      [v16 submitSearchResultSelectEventWithSearchResult:v6 searchSessionID:v17 queryLength:v19 topHitResultCount:v12 noteResultCount:v13 attachmentResultCount:v14 gmRank:v10 v20, v21, v22, v23];
    }
  }
}

- (unint64_t)state
{
  if (![(ICNoteSearchViewController *)self searchBarContainsQuery]) {
    return 0;
  }
  unsigned int v3 = [(ICNoteSearchViewController *)self searchDataSource];
  unsigned int v4 = [v3 didUpdateForCurrentSearchUserInput];

  if (!v4) {
    return 1;
  }
  id v5 = [(ICNoteSearchViewController *)self searchDataSource];
  id v6 = [v5 snapshot];
  id v7 = [v6 currentSnapshot];
  id v8 = [v7 numberOfItems];

  if (v8) {
    return 2;
  }
  else {
    return 3;
  }
}

- (void)setShowCompactFloatingSuggestions:(BOOL)a3
{
  if (self->_showCompactFloatingSuggestions == a3)
  {
    if (!+[ICSearchSuggestionsContext supportsSearchSuggestions])return; {
  }
    }
  else
  {
    self->_showCompactFloatingSuggestions = a3;
  }
  if ([(ICNoteSearchViewController *)self queryDidExist])
  {
    id v6 = [(ICNoteSearchViewController *)self searchDataSource];
    unsigned int v4 = [v6 snapshot];
    id v5 = [v4 currentSuggestions];
    [(ICNoteSearchViewController *)self setSuggestions:v5];
  }
  else
  {
    id v6 = +[ICSearchSuggestion orderedDefaultSearchSuggestions];
    [(ICNoteSearchViewController *)self setSuggestions:v6];
  }
}

- (void)processSelectedSearchSuggestion:(id)a3
{
  id v18 = a3;
  if (+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions")&& ([v18 csSuggestion], unsigned int v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    id v5 = [(ICNoteSearchViewController *)self searchContext];
    id v6 = [v18 csSuggestion];
    [v5 updateSearchSuggestion:v6 interaction:1];

    [(ICNoteSearchViewController *)self updateFromSearchContext];
  }
  else
  {
    id v7 = [v18 token];
    id v8 = +[ICSearchSuggestion iconImageForToken:v7];
    unsigned int v9 = [v7 title];
    unsigned int v10 = +[UISearchToken tokenWithIcon:v8 text:v9];

    [v10 setRepresentedObject:v7];
    uint64_t v11 = [(ICNoteSearchViewController *)self searchBar];
    uint64_t v12 = [v11 searchTextField];

    uint64_t v13 = [v12 selectedTextRange];
    if (v13
      && (uint64_t v14 = (void *)v13,
          [v12 selectedTextRange],
          objc_super v15 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v16 = [v15 isEmpty],
          v15,
          v14,
          (v16 & 1) == 0))
    {
      id v17 = [v12 selectedTextRange];
      [v12 replaceTextualPortionOfRange:v17 withToken:v10 atIndex:0];
    }
    else
    {
      [v12 insertToken:v10 atIndex:0];
    }
  }
  [(ICNoteSearchViewController *)self updateSearchResultsVisibility];
}

- (void)updateFromSearchContext
{
  if (+[ICSearchSuggestionsContext supportsSearchSuggestions])
  {
    unsigned int v3 = [(ICNoteSearchViewController *)self searchBar];
    id v17 = [v3 searchTextField];

    unsigned int v4 = [v17 tokens];
    id v5 = [v4 ic_objectsPassingTest:&stru_100626A30];

    id v6 = [(ICNoteSearchViewController *)self searchContext];
    id v7 = [v6 searchSuggestion];
    uint64_t v8 = [v7 userQueryString];
    unsigned int v9 = (void *)v8;
    unsigned int v10 = &stru_10063F3D8;
    if (v8) {
      unsigned int v10 = (__CFString *)v8;
    }
    uint64_t v11 = v10;

    uint64_t v12 = [(ICNoteSearchViewController *)self searchContext];
    uint64_t v13 = [v12 searchSuggestion];
    uint64_t v14 = [v13 currentTokens];
    objc_super v15 = objc_msgSend(v14, "ic_map:", &stru_100626A70);

    [v17 setText:v11];
    unsigned __int8 v16 = [v5 arrayByAddingObjectsFromArray:v15];
    [v17 setTokens:v16];
  }
}

- (UISearchBar)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);

  return (UISearchBar *)WeakRetained;
}

- (UISearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);

  return (UISearchController *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (ICNoteSearchDataSource)searchDataSource
{
  return self->_searchDataSource;
}

- (void)setSearchDataSource:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setShowsFloatingSuggestions:(BOOL)a3
{
  self->_showsFloatingSuggestions = a3;
}

- (UIScrollView)observableScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observableScrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setObservableScrollView:(id)a3
{
}

- (NSString)searchSessionID
{
  return self->_searchSessionID;
}

- (void)setSearchSessionID:(id)a3
{
}

- (ICNASearchResultExposureReporter)searchResultExposureReporter
{
  return self->_searchResultExposureReporter;
}

- (void)setSearchResultExposureReporter:(id)a3
{
}

- (void)setCollectionViewDelegate:(id)a3
{
}

- (ICSearchSuggestionController)suggestionsController
{
  return self->_suggestionsController;
}

- (void)setSuggestionsController:(id)a3
{
}

- (void)setSearchContext:(id)a3
{
}

- (BOOL)showCompactFloatingSuggestions
{
  return self->_showCompactFloatingSuggestions;
}

- (BOOL)queryDidExist
{
  return self->_queryDidExist;
}

- (void)setQueryDidExist:(BOOL)a3
{
  self->_queryDidExist = a3;
}

- (NSObject)noteMigrationObserver
{
  return self->_noteMigrationObserver;
}

- (void)setNoteMigrationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteMigrationObserver, 0);
  objc_storeStrong((id *)&self->_searchContext, 0);
  objc_storeStrong((id *)&self->_suggestionsController, 0);
  objc_storeStrong((id *)&self->_collectionViewDelegate, 0);
  objc_storeStrong((id *)&self->_searchResultExposureReporter, 0);
  objc_storeStrong((id *)&self->_searchSessionID, 0);
  objc_destroyWeak((id *)&self->_observableScrollView);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_searchDataSource, 0);
  objc_destroyWeak((id *)&self->_searchController);

  objc_destroyWeak((id *)&self->_searchBar);
}

@end