@interface ICBaseViewController
- (BOOL)isShowingActiveSearch;
- (BOOL)shouldBecomeFirstResponderWhenStartingSearch;
- (BOOL)shouldStartSearchWhenViewAppears;
- (ICBaseViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 viewControllerType:(int64_t)a5;
- (ICDataSource)dataSource;
- (ICNoteSearchViewController)noteSearchViewController;
- (ICViewControllerManager)viewControllerManager;
- (NSManagedObjectContext)legacyViewContext;
- (NSManagedObjectContext)modernViewContext;
- (UICollectionView)collectionView;
- (id)searchNavigationTitle;
- (id)unsupportedFolderInfoButtonTapHandler;
- (int64_t)noteContainerViewMode;
- (int64_t)viewControllerType;
- (void)accessibilityStatusDidChange;
- (void)addObservers;
- (void)configureSearchControllerIfNeeded;
- (void)dataSourceDataUpdateDidRender:(id)a3;
- (void)deactivateSearch;
- (void)dealloc;
- (void)didPresentSearchController:(id)a3;
- (void)noteSearchViewControllerQueryDidChange:(id)a3;
- (void)registerForTraitChanges;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNoteContainerViewMode:(int64_t)a3;
- (void)setNoteSearchViewController:(id)a3;
- (void)setShouldBecomeFirstResponderWhenStartingSearch:(BOOL)a3;
- (void)setShouldStartSearchWhenViewAppears:(BOOL)a3;
- (void)setViewControllerType:(int64_t)a3;
- (void)startSearchBecomeFirstResponder:(BOOL)a3;
- (void)startSearchWithSearchQuery:(id)a3 searchTokens:(id)a4 searchScope:(unint64_t)a5 becomeFirstResponder:(BOOL)a6;
- (void)updateScopeButtonTitles;
- (void)updateSearchControllerConfiguration;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation ICBaseViewController

- (id)unsupportedFolderInfoButtonTapHandler
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100058FD0;
  v4[3] = &unk_1006265D8;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (BOOL)isShowingActiveSearch
{
  v3 = [(ICBaseViewController *)self navigationItem];
  v4 = [v3 searchController];

  if ([(ICBaseViewController *)self shouldStartSearchWhenViewAppears])
  {
    unsigned __int8 v5 = 1;
  }
  else if ([v4 isActive])
  {
    unsigned __int8 v5 = [v4 showsSearchResultsController];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (NSManagedObjectContext)legacyViewContext
{
  return self->_legacyViewContext;
}

- (NSManagedObjectContext)modernViewContext
{
  return self->_modernViewContext;
}

- (ICViewControllerManager)viewControllerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerManager);

  return (ICViewControllerManager *)WeakRetained;
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (ICBaseViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 viewControllerType:(int64_t)a5
{
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICBaseViewController;
  v9 = [(ICBaseViewController *)&v17 initWithNibName:0 bundle:0];
  if (v9)
  {
    v10 = [v8 persistenceConfiguration];
    uint64_t v11 = [v10 legacyViewContext];
    legacyViewContext = v9->_legacyViewContext;
    v9->_legacyViewContext = (NSManagedObjectContext *)v11;

    v13 = [v8 persistenceConfiguration];
    uint64_t v14 = [v13 modernViewContext];
    modernViewContext = v9->_modernViewContext;
    v9->_modernViewContext = (NSManagedObjectContext *)v14;

    v9->_noteContainerViewMode = a3;
    objc_storeWeak((id *)&v9->_viewControllerManager, v8);
    v9->_viewControllerType = a5;
  }

  return v9;
}

- (BOOL)shouldStartSearchWhenViewAppears
{
  return self->_shouldStartSearchWhenViewAppears;
}

- (ICNoteSearchViewController)noteSearchViewController
{
  return self->_noteSearchViewController;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ICBaseViewController;
  [(ICBaseViewController *)&v3 viewDidLoad];
  [(ICBaseViewController *)self updateSearchControllerConfiguration];
  [(ICBaseViewController *)self addObservers];
  [(ICBaseViewController *)self registerForTraitChanges];
}

- (void)viewWillAppear:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)ICBaseViewController;
  [(ICBaseViewController *)&v25 viewWillAppear:a3];
  [(ICBaseViewController *)self updateSearchControllerConfiguration];
  v4 = [(ICBaseViewController *)self navigationController];
  unsigned __int8 v5 = [v4 navigationBar];
  id v6 = [v5 overrideUserInterfaceStyle];

  v7 = [(ICBaseViewController *)self navigationController];
  id v8 = [v7 navigationBar];
  [v8 setOverrideUserInterfaceStyle:0];

  id v9 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v9 configureWithDefaultBackground];
  v10 = [(ICBaseViewController *)self navigationController];
  uint64_t v11 = [v10 navigationBar];
  [v11 setStandardAppearance:v9];

  v12 = [(ICBaseViewController *)self navigationController];
  v13 = [v12 navigationBar];
  [v13 setCompactAppearance:v9];

  uint64_t v14 = [(ICBaseViewController *)self transitionCoordinator];
  if (!v14) {
    goto LABEL_6;
  }
  v15 = v14;
  if (!v6)
  {
    v16 = [(ICBaseViewController *)self noteSearchViewController];
    unsigned int v17 = [v16 isActive];

    if (v17) {
      goto LABEL_5;
    }
LABEL_6:
    v19 = [(ICBaseViewController *)self navigationController];
    v20 = [v19 toolbar];
    v21 = [v20 standardAppearance];
    [v21 configureWithDefaultBackground];

    v18 = [(ICBaseViewController *)self navigationController];
    v22 = [v18 toolbar];
    v23 = [v22 compactAppearance];
    [v23 configureWithDefaultBackground];

    goto LABEL_7;
  }

LABEL_5:
  v18 = [(ICBaseViewController *)self transitionCoordinator];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100058B68;
  v24[3] = &unk_100625AC8;
  v24[4] = self;
  [v18 animateAlongsideTransition:v24 completion:0];
LABEL_7:

  [(ICBaseViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICBaseViewController;
  [(ICBaseViewController *)&v4 viewDidAppear:a3];
  if ([(ICBaseViewController *)self shouldStartSearchWhenViewAppears])
  {
    [(ICBaseViewController *)self startSearchBecomeFirstResponder:[(ICBaseViewController *)self shouldBecomeFirstResponderWhenStartingSearch]];
    [(ICBaseViewController *)self setShouldStartSearchWhenViewAppears:0];
    [(ICBaseViewController *)self setShouldBecomeFirstResponderWhenStartingSearch:0];
  }
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICBaseViewController;
  [(ICBaseViewController *)&v4 dealloc];
}

- (void)startSearchBecomeFirstResponder:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ICBaseViewController *)self ic_isViewVisible])
  {
    unsigned __int8 v5 = [(ICBaseViewController *)self collectionView];
    id v6 = [(ICBaseViewController *)self collectionView];
    [v6 safeAreaInsets];
    [v5 setContentOffset:0, 0.0, -v7];

    id v11 = [(ICBaseViewController *)self noteSearchViewController];
    [v11 startSearchBecomeFirstResponder:v3];
  }
  else
  {
    [(ICBaseViewController *)self setShouldStartSearchWhenViewAppears:1];
    [(ICBaseViewController *)self setShouldBecomeFirstResponderWhenStartingSearch:v3];
    id v8 = [(ICBaseViewController *)self searchNavigationTitle];
    id v9 = [(ICBaseViewController *)self navigationItem];
    [v9 setTitle:v8];

    id v11 = [(ICBaseViewController *)self navigationItem];
    v10 = [v11 searchController];
    [v10 setShowsSearchResultsController:1];
  }
}

- (void)startSearchWithSearchQuery:(id)a3 searchTokens:(id)a4 searchScope:(unint64_t)a5 becomeFirstResponder:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [(ICBaseViewController *)self noteSearchViewController];
  [v12 cancelSearch];

  [(ICBaseViewController *)self configureSearchControllerIfNeeded];
  v13 = [(ICBaseViewController *)self noteSearchViewController];
  uint64_t v14 = [v13 searchBar];
  [v14 setSelectedScopeButtonIndex:a5];

  v15 = [(ICBaseViewController *)self noteSearchViewController];
  v16 = [v15 searchBar];
  unsigned int v17 = [v16 searchTextField];
  [v17 setText:v11];

  v18 = [(ICBaseViewController *)self noteSearchViewController];
  v19 = [v18 searchBar];
  v20 = [v19 searchTextField];
  [v20 setTokens:v10];

  [(ICBaseViewController *)self startSearchBecomeFirstResponder:v6];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICBaseViewController;
  -[ICBaseViewController setEditing:animated:](&v9, "setEditing:animated:");
  double v7 = [(ICBaseViewController *)self noteSearchViewController];
  id v8 = [v7 searchBar];
  [v8 _setEnabled:!v5 animated:v4];
}

- (void)dataSourceDataUpdateDidRender:(id)a3
{
}

- (void)noteSearchViewControllerQueryDidChange:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [v4 userInfo];

  BOOL v6 = [v5 objectForKeyedSubscript:@"ICNoteSearchViewControllerQueryDidChangeNotificationQueryExistsKey"];
  double v7 = ICDynamicCast();
  id v8 = [v7 BOOLValue];

  if (+[UIDevice ic_isVision])
  {
    objc_super v9 = [(ICBaseViewController *)self noteSearchViewController];
    unsigned int v10 = [v9 showsFloatingSuggestions];

    if (v10)
    {
      id v11 = [(ICBaseViewController *)self collectionView];
      [v11 setHidden:v8];
    }
  }
}

- (id)searchNavigationTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"Search" value:&stru_10063F3D8 table:0];

  return v3;
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = [(ICBaseViewController *)self navigationController];
  BOOL v5 = [v4 topViewController];

  if (v5 == self)
  {
    BOOL v6 = [(ICBaseViewController *)self presentedViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];

    [(ICBaseViewController *)self updateScopeButtonTitles];
    double v7 = [(ICBaseViewController *)self navigationController];
    [v7 setToolbarHidden:1];

    id v8 = [(ICBaseViewController *)self collectionView];
    objc_super v9 = [(ICBaseViewController *)self noteSearchViewController];
    [v9 setObservableScrollView:v8];

    unsigned int v10 = [(ICBaseViewController *)self navigationItem];
    id v11 = [v10 searchController];
    [v11 setShowsSearchResultsController:1];

    if (+[UIDevice ic_isVision])
    {
      v12 = [(ICBaseViewController *)self noteSearchViewController];
      unsigned __int8 v13 = [v12 showsFloatingSuggestions];

      if ((v13 & 1) == 0)
      {
        id v14 = [(ICBaseViewController *)self collectionView];
        [v14 setHidden:1];
      }
    }
  }
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = [(ICBaseViewController *)self navigationController];
  BOOL v5 = [v4 topViewController];

  if (v5 == self)
  {
    [(ICBaseViewController *)self updateNavigationTitle];
  }
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = [(ICBaseViewController *)self navigationController];
  BOOL v5 = [v4 topViewController];

  if (v5 == self)
  {
    id v6 = +[UIDevice ic_isVision];
    double v7 = [(ICBaseViewController *)self navigationController];
    [v7 setToolbarHidden:v6];

    id v8 = [(ICBaseViewController *)self navigationItem];
    objc_super v9 = [v8 searchController];
    [v9 setShowsSearchResultsController:0];

    [(ICBaseViewController *)self updateNavigationTitle];
    if (+[UIDevice ic_isVision])
    {
      unsigned int v10 = [(ICBaseViewController *)self noteSearchViewController];
      unsigned __int8 v11 = [v10 showsFloatingSuggestions];

      if ((v11 & 1) == 0)
      {
        v12 = [(ICBaseViewController *)self collectionView];
        [v12 setHidden:0];
      }
    }
    id v13 = +[NSNotificationCenter defaultCenter];
    [v13 postNotificationName:@"ICBaseViewControllerWillDismissSearchControllerNotification" object:self];
  }
}

- (void)addObservers
{
  id v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = ICDataSourceDataDidUpdateNotification;
  id v4 = [(ICBaseViewController *)self dataSource];
  [v8 addObserver:self selector:"dataSourceDataDidUpdate:" name:v3 object:v4];

  uint64_t v5 = ICDataSourceDataUpdateDidRenderNotification;
  id v6 = [(ICBaseViewController *)self dataSource];
  [v8 addObserver:self selector:"dataSourceDataUpdateDidRender:" name:v5 object:v6];

  double v7 = [(ICBaseViewController *)self noteSearchViewController];
  [v8 addObserver:self selector:"noteSearchViewControllerQueryDidChange:" name:@"ICNoteSearchViewControllerQueryDidChangeNotification" object:v7];

  [v8 addObserver:self selector:"accessibilityStatusDidChange" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];
  [v8 addObserver:self selector:"accessibilityStatusDidChange" name:UIAccessibilitySwitchControlStatusDidChangeNotification object:0];
}

- (void)registerForTraitChanges
{
  uint64_t v5 = objc_opt_class();
  uint64_t v3 = +[NSArray arrayWithObjects:&v5 count:1];
  id v4 = [(ICBaseViewController *)self registerForTraitChanges:v3 withAction:"updateSearchControllerConfiguration"];
}

- (void)updateSearchControllerConfiguration
{
  uint64_t v3 = [(ICBaseViewController *)self viewControllerManager];
  unsigned int v4 = [v3 hasCompactWidth];

  int64_t v5 = [(ICBaseViewController *)self viewControllerType];
  int64_t v6 = [(ICBaseViewController *)self viewControllerType];
  if (v5 && (v6 != 2 || ((v4 ^ 1) & 1) != 0))
  {
    if (v6 == 2) {
      char v7 = v4;
    }
    else {
      char v7 = 1;
    }
    if ((v7 & 1) == 0)
    {
      id v8 = [(ICBaseViewController *)self navigationItem];
      objc_super v9 = [v8 searchController];
      unsigned int v10 = [v9 isActive];

      if (v10) {
        [(ICBaseViewController *)self deactivateSearch];
      }
      unsigned __int8 v11 = [(ICBaseViewController *)self navigationItem];
      [v11 setSearchController:0];

      [(ICBaseViewController *)self setNoteSearchViewController:0];
    }
  }
  else
  {
    [(ICBaseViewController *)self configureSearchControllerIfNeeded];
  }
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  self->_noteContainerViewMode = a3;
  id v4 = [(ICBaseViewController *)self noteSearchViewController];
  [v4 setNoteContainerViewMode:a3];
}

- (void)configureSearchControllerIfNeeded
{
  uint64_t v3 = [(ICBaseViewController *)self noteSearchViewController];

  if (!v3)
  {
    id v4 = [ICNoteSearchViewController alloc];
    int64_t v5 = [(ICBaseViewController *)self noteContainerViewMode];
    int64_t v6 = [(ICBaseViewController *)self viewControllerManager];
    char v7 = [(ICNoteSearchViewController *)v4 initWithViewMode:v5 viewControllerManager:v6];
    [(ICBaseViewController *)self setNoteSearchViewController:v7];

    id v8 = objc_alloc((Class)UISearchController);
    objc_super v9 = [(ICBaseViewController *)self noteSearchViewController];
    id v18 = [v8 initWithSearchResultsController:v9];

    unsigned int v10 = [(ICBaseViewController *)self noteSearchViewController];
    [v18 setSearchResultsUpdater:v10];

    [v18 setAutomaticallyShowsSearchResultsController:0];
    [v18 setDelegate:self];
    [v18 setObscuresBackgroundDuringPresentation:1];
    unsigned __int8 v11 = [v18 searchBar];
    [v11 setCenterPlaceholder:0];
    v12 = [(ICBaseViewController *)self noteSearchViewController];
    [v12 setSearchBar:v11];

    id v13 = [(ICBaseViewController *)self noteSearchViewController];
    [v13 setSearchController:v18];

    id v14 = [(ICBaseViewController *)self navigationItem];
    [v14 setSearchController:v18];

    uint64_t v15 = ICAccessibilityNeedsAccessibilityElements() ^ 1;
    v16 = [(ICBaseViewController *)self navigationItem];
    [v16 setHidesSearchBarWhenScrolling:v15];

    unsigned int v17 = [(ICBaseViewController *)self collectionView];
    [v17 layoutIfNeeded];
  }
}

- (void)updateScopeButtonTitles
{
  if (![(ICBaseViewController *)self viewControllerType])
  {
    uint64_t v3 = [(ICBaseViewController *)self viewControllerManager];
    id v4 = [v3 countOfAllVisibleAccounts];

    int64_t v5 = [(ICBaseViewController *)self navigationItem];
    int64_t v6 = [v5 searchController];
    char v7 = [v6 searchBar];
    id v8 = [v7 scopeButtonTitles];
    id v9 = [v8 count];

    if ((unint64_t)v4 < 2 || v9)
    {
      if ((unint64_t)v4 > 1 || !v9) {
        return;
      }
      id v18 = [(ICBaseViewController *)self navigationItem];
      id v14 = [v18 searchController];
      uint64_t v15 = [v14 searchBar];
      [v15 setScopeButtonTitles:&__NSArray0__struct];
    }
    else
    {
      id v18 = +[NSMutableArray arrayWithCapacity:2];
      unsigned int v10 = +[NSBundle mainBundle];
      unsigned __int8 v11 = [v10 localizedStringForKey:@"All Accounts" value:&stru_10063F3D8 table:0];
      [v18 insertObject:v11 atIndex:0];

      v12 = +[NSBundle mainBundle];
      id v13 = [v12 localizedStringForKey:@"Current Account" value:&stru_10063F3D8 table:0];
      [v18 insertObject:v13 atIndex:1];

      id v14 = [v18 copy];
      uint64_t v15 = [(ICBaseViewController *)self navigationItem];
      v16 = [v15 searchController];
      unsigned int v17 = [v16 searchBar];
      [v17 setScopeButtonTitles:v14];
    }
  }
}

- (void)deactivateSearch
{
  id v3 = [(ICBaseViewController *)self navigationItem];
  v2 = [v3 searchController];
  [v2 setActive:0];
}

- (void)accessibilityStatusDidChange
{
  uint64_t v3 = ICAccessibilityNeedsAccessibilityElements() ^ 1;
  id v4 = [(ICBaseViewController *)self navigationItem];
  [v4 setHidesSearchBarWhenScrolling:v3];
}

- (void)setNoteSearchViewController:(id)a3
{
}

- (ICDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (ICDataSource *)WeakRetained;
}

- (int64_t)viewControllerType
{
  return self->_viewControllerType;
}

- (void)setViewControllerType:(int64_t)a3
{
  self->_viewControllerType = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setShouldStartSearchWhenViewAppears:(BOOL)a3
{
  self->_shouldStartSearchWhenViewAppears = a3;
}

- (BOOL)shouldBecomeFirstResponderWhenStartingSearch
{
  return self->_shouldBecomeFirstResponderWhenStartingSearch;
}

- (void)setShouldBecomeFirstResponderWhenStartingSearch:(BOOL)a3
{
  self->_shouldBecomeFirstResponderWhenStartingSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_modernViewContext, 0);
  objc_storeStrong((id *)&self->_legacyViewContext, 0);
  objc_storeStrong((id *)&self->_noteSearchViewController, 0);

  objc_destroyWeak((id *)&self->_viewControllerManager);
}

@end