@interface MFSearchSuggestionsViewController
+ (OS_os_log)log;
+ (id)categoryComparator;
- (BOOL)hasSuggestions;
- (BOOL)suggestionsUpdated;
- (CGRect)currentKeyboardOverlap;
- (MFSearchSuggestionsTableViewModel)tableViewModel;
- (MFSearchSuggestionsTableViewModelReuseConfiguration)defaultReuseConfiguration;
- (MFSearchSuggestionsTableViewModelReuseConfiguration)topHitsReuseConfiguration;
- (MFSearchSuggestionsViewController)initWithCoder:(id)a3;
- (MFSearchSuggestionsViewController)initWithMainScene:(id)a3 delegate:(id)a4;
- (MFSearchSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MFSearchSuggestionsViewController)initWithStyle:(int64_t)a3;
- (MFSearchSuggestionsViewControllerDelegate)delegate;
- (MailMainScene)scene;
- (MessageListCellLayoutValuesHelper)layoutValuesHelper;
- (NSArray)lastVisibleIndexPaths;
- (double)currentKeyboardHeight;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_defaultTableViewCellPopulator;
- (id)_defaultTableViewRowHeightCalculator;
- (id)_defaultTableViewRowSelector;
- (id)_newSearchSuggestionsTableViewModel;
- (id)_topHitsTableViewCellPopulator;
- (id)_topHitsTableViewRowHeightCalculator;
- (id)_topHitsTableViewRowSelector;
- (id)searchSuggestionsForCategory:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3;
- (id)viewForKeyboardAvoidance:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)beginUpdatingSuggestions;
- (void)clearSuggestions;
- (void)configureReportedVisibleSuggestionsForTableView:(id)a3 alwaysReportItems:(BOOL)a4 keyboardVisibilityDidChange:(BOOL)a5;
- (void)dealloc;
- (void)didRemoveSearchSuggestion:(id)a3;
- (void)endUpdatingSuggestions;
- (void)keyboardAvoidance:(id)a3 adjustForFrameOverlap:(CGRect)a4;
- (void)keyboardVisibilityDidChange:(id)a3;
- (void)loadView;
- (void)reportVisibleSuggestionResults;
- (void)setCurrentKeyboardHeight:(double)a3;
- (void)setCurrentKeyboardOverlap:(CGRect)a3;
- (void)setDefaultReuseConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastVisibleIndexPaths:(id)a3;
- (void)setLayoutValuesHelper:(id)a3;
- (void)setScene:(id)a3;
- (void)setSuggestionsUpdated:(BOOL)a3;
- (void)setTableViewModel:(id)a3;
- (void)setTopHitsReuseConfiguration:(id)a3;
- (void)shouldReloadSearchSuggestion:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLayoutMargins:(UIEdgeInsets)a3;
- (void)updateSuggestionsWithResult:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MFSearchSuggestionsViewController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E1DEC;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699CF0 != -1) {
    dispatch_once(&qword_100699CF0, block);
  }
  v2 = (void *)qword_100699CE8;

  return (OS_os_log *)v2;
}

+ (id)categoryComparator
{
  return &stru_10060CFD8;
}

- (MFSearchSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(MFSearchSuggestionsViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFSearchSuggestionsViewController initWithNibName:bundle:]", "MFSearchSuggestionsViewController.m", 128, "0");
}

- (MFSearchSuggestionsViewController)initWithStyle:(int64_t)a3
{
}

- (MFSearchSuggestionsViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  [(MFSearchSuggestionsViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFSearchSuggestionsViewController initWithCoder:]", "MFSearchSuggestionsViewController.m", 130, "0");
}

- (MFSearchSuggestionsViewController)initWithMainScene:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MFSearchSuggestionsViewController;
  id v8 = [(MFSearchSuggestionsViewController *)&v17 initWithStyle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scene, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    touchedCategories = v9->_touchedCategories;
    v9->_touchedCategories = v10;

    v12 = [(MFSearchSuggestionsViewController *)v9 _newSearchSuggestionsTableViewModel];
    tableViewModel = v9->_tableViewModel;
    v9->_tableViewModel = v12;

    v14 = (MessageListCellLayoutValuesHelper *)objc_alloc_init((Class)MessageListCellLayoutValuesHelper);
    layoutValuesHelper = v9->_layoutValuesHelper;
    v9->_layoutValuesHelper = v14;

    [(MFSearchSuggestionsViewController *)v9 setModalPresentationStyle:3];
  }

  return v9;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = +[MFKeyboardAvoidance sharedController];
  [v3 unregisterKeyboardAvoidable:self];

  v4.receiver = self;
  v4.super_class = (Class)MFSearchSuggestionsViewController;
  [(MFSearchSuggestionsViewController *)&v4 dealloc];
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)MFSearchSuggestionsViewController;
  [(MFSearchSuggestionsViewController *)&v9 loadView];
  v3 = [(MFSearchSuggestionsViewController *)self tableView];
  [v3 setKeyboardDismissMode:1];
  [v3 setEstimatedRowHeight:44.0];
  [v3 setRowHeight:UITableViewAutomaticDimension];
  [v3 setInsetsLayoutMarginsFromSafeArea:0];
  objc_super v4 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  [v3 _setHeaderAndFooterViewsFloat:!IsAccessibilityCategory];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"kMFSearchSuggestionsCellIdentifier"];
  uint64_t v6 = objc_opt_class();
  id v7 = +[MessageListTableViewCell reusableIdentifier];
  [v3 registerClass:v6 forCellReuseIdentifier:v7];

  [v3 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kMFSearchSectionHeaderCellIdentifier"];
  id v8 = +[MFKeyboardAvoidance sharedController];
  [v8 registerKeyboardAvoidable:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFSearchSuggestionsViewController;
  [(MFSearchSuggestionsViewController *)&v6 viewWillAppear:a3];
  objc_super v4 = [(MFSearchSuggestionsViewController *)self layoutValuesHelper];
  id v5 = [(MFSearchSuggestionsViewController *)self traitCollection];
  [v4 setTraitCollection:v5];

  [(MFSearchSuggestionsViewController *)self systemMinimumLayoutMargins];
  [v4 setSystemLayoutMargins:];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFSearchSuggestionsViewController;
  [(MFSearchSuggestionsViewController *)&v10 traitCollectionDidChange:v4];
  id v5 = [(MFSearchSuggestionsViewController *)self traitCollection];
  if (objc_msgSend(v5, "mf_traitDifferenceAffectsTextLayout:", v4))
  {
    objc_super v6 = [(MFSearchSuggestionsViewController *)self layoutValuesHelper];
    [v6 setTraitCollection:v5];

    id v7 = [UIApp preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    objc_super v9 = [(MFSearchSuggestionsViewController *)self tableView];
    [v9 _setHeaderAndFooterViewsFloat:!IsAccessibilityCategory];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFSearchSuggestionsViewController;
  [(MFSearchSuggestionsViewController *)&v5 viewDidAppear:a3];
  id v4 = +[MFKeyboardAvoidance sharedController];
  [v4 registerKeyboardAvoidable:self];
}

- (void)viewLayoutMarginsDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)MFSearchSuggestionsViewController;
  [(MFSearchSuggestionsViewController *)&v12 viewLayoutMarginsDidChange];
  [(MFSearchSuggestionsViewController *)self systemMinimumLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MFSearchSuggestionsViewController *)self layoutValuesHelper];
  [v11 setSystemLayoutMargins:v4, v6, v8, v10];
}

- (void)keyboardVisibilityDidChange:(id)a3
{
  id v19 = [a3 userInfo];
  double v4 = [v19 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v4 CGRectValue];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  id v20 = +[UIScreen mainScreen];
  [v20 bounds];
  v25.origin.x = v13;
  v25.origin.y = v14;
  v25.size.width = v15;
  v25.size.height = v16;
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  CGRect v24 = CGRectIntersection(v23, v25);
  double Height = CGRectGetHeight(v24);

  [(MFSearchSuggestionsViewController *)self currentKeyboardHeight];
  if (v18 != Height)
  {
    [(MFSearchSuggestionsViewController *)self setCurrentKeyboardHeight:Height];
    id v21 = [(MFSearchSuggestionsViewController *)self tableView];
    -[MFSearchSuggestionsViewController configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:](self, "configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:");
  }
}

- (id)_defaultTableViewCellPopulator
{
  return &stru_10060D018;
}

- (id)_defaultTableViewRowHeightCalculator
{
  return &stru_10060D058;
}

- (id)_defaultTableViewRowSelector
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001E285C;
  v5[3] = &unk_10060D080;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  double v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (id)_topHitsTableViewCellPopulator
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001E29CC;
  v5[3] = &unk_10060D0A8;
  void v5[4] = self;
  v2 = objc_retainBlock(v5);
  double v3 = objc_retainBlock(v2);

  return v3;
}

- (id)_topHitsTableViewRowHeightCalculator
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001E2B88;
  v5[3] = &unk_10060D0D0;
  void v5[4] = self;
  v2 = objc_retainBlock(v5);
  double v3 = objc_retainBlock(v2);

  return v3;
}

- (id)_topHitsTableViewRowSelector
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001E2D90;
  v5[3] = &unk_10060D0F8;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  double v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (MFSearchSuggestionsTableViewModelReuseConfiguration)defaultReuseConfiguration
{
  defaultReuseConfiguration = self->_defaultReuseConfiguration;
  if (!defaultReuseConfiguration)
  {
    double v4 = [[MFSearchSuggestionsTableViewModelReuseConfiguration alloc] initWithReuseIdentifier:@"kMFSearchSuggestionsCellIdentifier"];
    double v5 = self->_defaultReuseConfiguration;
    self->_defaultReuseConfiguration = v4;

    id v6 = [(MFSearchSuggestionsViewController *)self _defaultTableViewCellPopulator];
    [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self->_defaultReuseConfiguration setCellPopulator:v6];

    double v7 = [(MFSearchSuggestionsViewController *)self _defaultTableViewRowHeightCalculator];
    [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self->_defaultReuseConfiguration setRowHeightCalculator:v7];

    CGFloat v8 = [(MFSearchSuggestionsViewController *)self _defaultTableViewRowSelector];
    [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self->_defaultReuseConfiguration setRowSelector:v8];

    defaultReuseConfiguration = self->_defaultReuseConfiguration;
  }

  return defaultReuseConfiguration;
}

- (MFSearchSuggestionsTableViewModelReuseConfiguration)topHitsReuseConfiguration
{
  if (!self->_topHitsReuseConfiguration)
  {
    double v3 = [(MFSearchSuggestionsViewController *)self delegate];
    unsigned int v4 = [v3 canGenerateTopHitsForSearchSuggestionsViewController:self];

    if (v4)
    {
      double v5 = [MFSearchSuggestionsTableViewModelReuseConfiguration alloc];
      id v6 = +[MessageListTableViewCell reusableIdentifier];
      double v7 = [(MFSearchSuggestionsTableViewModelReuseConfiguration *)v5 initWithReuseIdentifier:v6];
      topHitsReuseConfiguration = self->_topHitsReuseConfiguration;
      self->_topHitsReuseConfiguration = v7;

      double v9 = [(MFSearchSuggestionsViewController *)self _topHitsTableViewCellPopulator];
      [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self->_topHitsReuseConfiguration setCellPopulator:v9];

      CGFloat v10 = [(MFSearchSuggestionsViewController *)self _topHitsTableViewRowHeightCalculator];
      [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self->_topHitsReuseConfiguration setRowHeightCalculator:v10];

      double v11 = [(MFSearchSuggestionsViewController *)self _topHitsTableViewRowSelector];
      [(MFSearchSuggestionsTableViewModelReuseConfiguration *)self->_topHitsReuseConfiguration setRowSelector:v11];
    }
  }
  CGFloat v12 = self->_topHitsReuseConfiguration;

  return v12;
}

- (id)_newSearchSuggestionsTableViewModel
{
  double v3 = [MFSearchSuggestionsTableViewModel alloc];
  unsigned int v4 = [(id)objc_opt_class() categoryComparator];
  double v5 = [(MFSearchSuggestionsViewController *)self defaultReuseConfiguration];
  id v6 = [(MFSearchSuggestionsTableViewModel *)v3 initWithSectionComparator:v4 defaultReuseConfiguration:v5];

  double v7 = [(MFSearchSuggestionsViewController *)self delegate];
  LODWORD(v5) = [v7 canGenerateTopHitsForSearchSuggestionsViewController:self];

  if (v5)
  {
    CGFloat v8 = +[MUISearchSuggestionCategory topHitsCategory];
    double v9 = [(MFSearchSuggestionsViewController *)self topHitsReuseConfiguration];
    [(MFSearchSuggestionsTableViewModel *)v6 registerCategory:v8 forReuseConfiguration:v9];
  }
  return v6;
}

- (void)setTableViewModel:(id)a3
{
  double v5 = (MFSearchSuggestionsTableViewModel *)a3;
  if (self->_tableViewModel != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_tableViewModel, a3);
    id v6 = [(MFSearchSuggestionsViewController *)self tableView];
    [v6 reloadData];

    double v5 = v7;
  }
}

- (void)clearSuggestions
{
  [(NSMutableSet *)self->_touchedCategories removeAllObjects];
  [(MFSearchSuggestionsViewController *)self setSuggestionsUpdated:0];
  id v3 = [(MFSearchSuggestionsViewController *)self _newSearchSuggestionsTableViewModel];
  -[MFSearchSuggestionsViewController setTableViewModel:](self, "setTableViewModel:");
}

- (void)beginUpdatingSuggestions
{
  [(NSMutableSet *)self->_touchedCategories removeAllObjects];

  [(MFSearchSuggestionsViewController *)self setSuggestionsUpdated:0];
}

- (void)endUpdatingSuggestions
{
  id v3 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  double v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  double v7 = sub_1001E351C;
  CGFloat v8 = &unk_10060D120;
  double v9 = self;
  id v4 = [v3 copy];
  id v10 = v4;
  [v3 enumerateSections:&v5];
  -[MFSearchSuggestionsViewController setTableViewModel:](self, "setTableViewModel:", v4, v5, v6, v7, v8, v9);
}

- (void)updateSuggestionsWithResult:(id)a3
{
  id v33 = a3;
  [(MFSearchSuggestionsViewController *)self setSuggestionsUpdated:0];
  id v4 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  id v32 = [v4 copy];

  double v5 = +[NSMutableArray array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v6 = [v33 categories];
  id v7 = [v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v46;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v45 + 1) + 8 * i) groupingCategory:v32];
        [v5 addObject:v10];
      }
      id v7 = [v6 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)self->_touchedCategories addObjectsFromArray:v5];
  double v11 = +[NSMutableDictionary dictionary];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v5;
  id v12 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v42;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
        CGFloat v16 = +[NSMutableArray array];
        [v11 setObject:v16 forKeyedSubscript:v15];
      }
      id v12 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v12);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  objc_super v17 = [v33 suggestions];
  id v18 = [v17 countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v38;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = *(void **)(*((void *)&v37 + 1) + 8 * (void)k);
        v22 = [v21 category:v32];
        CGRect v23 = [v22 groupingCategory];

        [v21 setDelegate:self];
        CGRect v24 = [v11 objectForKeyedSubscript:v23];
        [v24 addObject:v21];
      }
      id v18 = [v17 countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v18);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1001E3B40;
  v35[3] = &unk_10060D148;
  id v25 = v32;
  id v36 = v25;
  [v11 enumerateKeysAndObjectsUsingBlock:v35];
  v26 = +[MFSearchSuggestionsViewController log];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v11;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Update search suggestions with suggestions: %@", buf, 0xCu);
  }

  v27 = [v33 suggestions];
  id v28 = [v27 count];

  if (v28)
  {
    v29 = [(MFSearchSuggestionsViewController *)self delegate];
    v30 = [v25 objectsByIdentifier];
    id v31 = [v30 copy];
    [v29 reportSuggestionsFetched:v31];
  }
  -[MFSearchSuggestionsViewController setTableViewModel:](self, "setTableViewModel:", v25, v32);
  [(MFSearchSuggestionsViewController *)self setSuggestionsUpdated:1];
}

- (BOOL)hasSuggestions
{
  v2 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  BOOL v3 = [v2 numberOfSections] != 0;

  return v3;
}

- (id)searchSuggestionsForCategory:(id)a3
{
  id v4 = a3;
  double v5 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  uint64_t v6 = [v5 sectionForIdentifier:v4];

  return v6;
}

- (void)reportVisibleSuggestionResults
{
  id v3 = [(MFSearchSuggestionsViewController *)self tableView];
  -[MFSearchSuggestionsViewController configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:](self, "configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:");
}

- (void)updateLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(MFSearchSuggestionsViewController *)self tableView];
  [v7 setLayoutMargins:top, left, bottom, right];
}

- (void)shouldReloadSearchSuggestion:(id)a3
{
  id v4 = a3;
  double v5 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  uint64_t v6 = [v5 indexPathForSuggestion:v4];

  if ([v6 row] == (id)0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "section") == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(MFSearchSuggestionsViewController *)self tableViewModel];
      sub_10045D3B8((uint64_t)v4, v8, (uint64_t)&v12);
    }
  }
  else
  {
    double v9 = [(MFSearchSuggestionsViewController *)self tableView];
    [v9 beginUpdates];

    id v10 = [(MFSearchSuggestionsViewController *)self tableView];
    uint64_t v13 = v6;
    double v11 = +[NSArray arrayWithObjects:&v13 count:1];
    [v10 reloadRowsAtIndexPaths:v11 withRowAnimation:5];

    id v7 = [(MFSearchSuggestionsViewController *)self tableView];
    [v7 endUpdates];
  }
}

- (void)didRemoveSearchSuggestion:(id)a3
{
  id v4 = a3;
  double v5 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  uint64_t v6 = [v5 indexPathForSuggestion:v4];

  if ([v6 row] == (id)0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v6, "section") == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(MFSearchSuggestionsViewController *)self tableViewModel];
      sub_10045D410((uint64_t)v4, v8, (uint64_t)&v11);
    }
  }
  else
  {
    tableViewModel = self->_tableViewModel;
    uint64_t v12 = v6;
    id v10 = +[NSArray arrayWithObjects:&v12 count:1];
    id v7 = [(MFSearchSuggestionsTableViewModel *)tableViewModel tableViewModelByRemovingItemsAtIndexPaths:v10];

    [(MFSearchSuggestionsViewController *)self setTableViewModel:v7];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
}

- (void)configureReportedVisibleSuggestionsForTableView:(id)a3 alwaysReportItems:(BOOL)a4 keyboardVisibilityDidChange:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([(MFSearchSuggestionsViewController *)self suggestionsUpdated] || v5)
  {
    double v9 = [(MFSearchSuggestionsViewController *)self tableView];
    id v10 = [v9 indexPathsForVisibleRows];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001E4328;
    v19[3] = &unk_10060D170;
    id v20 = v8;
    id v21 = self;
    uint64_t v11 = [v10 ef_filter:v19];
    uint64_t v12 = [v11 sortedArrayUsingSelector:"compare:"];

    if ([v12 count])
    {
      uint64_t v13 = [(MFSearchSuggestionsViewController *)self lastVisibleIndexPaths];
      unsigned int v14 = [v13 isEqualToArray:v12];

      if (!v14 || v6)
      {
        id v15 = [v12 copy];
        [(MFSearchSuggestionsViewController *)self setLastVisibleIndexPaths:v15];

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1001E4388;
        v18[3] = &unk_100609A68;
        v18[4] = self;
        CGFloat v16 = [v12 ef_compactMap:v18];
        objc_super v17 = [(MFSearchSuggestionsViewController *)self delegate];
        [v17 reportSuggestionsVisible:v16];
      }
    }
  }
  else
  {
    [(MFSearchSuggestionsViewController *)self setLastVisibleIndexPaths:0];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  [v8 tableView:v6 heightForRowAtIndexPath:v7];
  double v10 = v9;

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  [v7 tableView:v8 didSelectRowAtIndexPath:v6];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  id v6 = [v5 numberOfSectionsInTableView:v4];

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  id v8 = [v7 tableView:v6 numberOfRowsInSection:a4];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  id v8 = [v7 tableView:v6 titleForHeaderInSection:a4];

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = [a3 dequeueReusableHeaderFooterViewWithIdentifier:@"kMFSearchSectionHeaderCellIdentifier"];
  if (!v6) {
    id v6 = [objc_alloc((Class)UITableViewHeaderFooterView) initWithReuseIdentifier:@"kMFSearchSectionHeaderCellIdentifier"];
  }
  id v7 = [v6 contentConfiguration];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v6 defaultContentConfiguration];
  }
  double v10 = v9;

  uint64_t v11 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  uint64_t v12 = [v11 identifierAtIndex:a4];
  uint64_t v13 = [v12 displayName];
  [v10 setText:v13];

  unsigned int v14 = [v10 textProperties];
  [v14 setNumberOfLines:2];

  id v15 = [v10 textProperties];
  [v15 setAdjustsFontSizeToFitWidth:1];

  [v6 setContentConfiguration:v10];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFSearchSuggestionsViewController *)self tableViewModel];
  id v9 = [v8 tableView:v6 cellForRowAtIndexPath:v7];

  [v9 setInsetsLayoutMarginsFromSafeArea:0];

  return v9;
}

- (id)viewForKeyboardAvoidance:(id)a3
{
  id v3 = [(MFSearchSuggestionsViewController *)self tableView];

  return v3;
}

- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3
{
  return 0;
}

- (void)keyboardAvoidance:(id)a3 adjustForFrameOverlap:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(MFSearchSuggestionsViewController *)self currentKeyboardOverlap];
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  if (!CGRectEqualToRect(v11, v12))
  {
    -[MFSearchSuggestionsViewController setCurrentKeyboardOverlap:](self, "setCurrentKeyboardOverlap:", x, y, width, height);
    id v9 = [(MFSearchSuggestionsViewController *)self tableView];
    -[MFSearchSuggestionsViewController configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:](self, "configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:");
  }
}

- (MFSearchSuggestionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFSearchSuggestionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MFSearchSuggestionsTableViewModel)tableViewModel
{
  return self->_tableViewModel;
}

- (void)setDefaultReuseConfiguration:(id)a3
{
}

- (void)setTopHitsReuseConfiguration:(id)a3
{
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (void)setLayoutValuesHelper:(id)a3
{
}

- (NSArray)lastVisibleIndexPaths
{
  return self->_lastVisibleIndexPaths;
}

- (void)setLastVisibleIndexPaths:(id)a3
{
}

- (double)currentKeyboardHeight
{
  return self->_currentKeyboardHeight;
}

- (void)setCurrentKeyboardHeight:(double)a3
{
  self->_currentKeyboarddouble Height = a3;
}

- (CGRect)currentKeyboardOverlap
{
  double x = self->_currentKeyboardOverlap.origin.x;
  double y = self->_currentKeyboardOverlap.origin.y;
  double width = self->_currentKeyboardOverlap.size.width;
  double height = self->_currentKeyboardOverlap.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentKeyboardOverlap:(CGRect)a3
{
  self->_currentKeyboardOverlap = a3;
}

- (BOOL)suggestionsUpdated
{
  return self->_suggestionsUpdated;
}

- (void)setSuggestionsUpdated:(BOOL)a3
{
  self->_suggestionsUpdated = a3;
}

- (MailMainScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailMainScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_lastVisibleIndexPaths, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_storeStrong((id *)&self->_topHitsReuseConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultReuseConfiguration, 0);
  objc_storeStrong((id *)&self->_tableViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_touchedCategories, 0);
}

@end