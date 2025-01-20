@interface CarKeyboardSearchResultsViewController
- (CarKeyboardModeController)keyboardMode;
- (CarKeyboardSearchResultsViewController)init;
- (UITableView)searchResultTableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)itemAtIndexPath:(id)a3;
- (id)modelForItemAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)handleCancelButtonPressed;
- (void)handleSearchButtonPressedWithText:(id)a3;
- (void)handleSearchTextDidChange:(id)a3;
- (void)prepareTableView;
- (void)searchDataProviderDidUpdate:(id)a3;
- (void)setKeyboardMode:(id)a3;
- (void)setSearchResultTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateForInteractionModel:(unint64_t)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation CarKeyboardSearchResultsViewController

- (CarKeyboardSearchResultsViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)CarKeyboardSearchResultsViewController;
  v2 = [(CarKeyboardSearchResultsViewController *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SearchDataProvider);
    searchDataProvider = v2->_searchDataProvider;
    v2->_searchDataProvider = v3;

    [(SearchDataProvider *)v2->_searchDataProvider setEnableRAPIfAvailable:0];
    [(SearchDataProvider *)v2->_searchDataProvider setDelegate:v2];
    [(SearchDataProvider *)v2->_searchDataProvider setSearchMode:3];
    v2->_cellStyle = 0;
    uint64_t v5 = +[NSMapTable weakToStrongObjectsMapTable];
    modelsByItem = v2->_modelsByItem;
    v2->_modelsByItem = (NSMapTable *)v5;
  }
  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CarKeyboardSearchResultsViewController;
  [(CarKeyboardSearchResultsViewController *)&v3 viewDidLoad];
  [(CarKeyboardSearchResultsViewController *)self prepareTableView];
}

- (void)prepareTableView
{
  objc_super v3 = (UITableView *)objc_alloc_init((Class)UITableView);
  searchResultTableView = self->_searchResultTableView;
  self->_searchResultTableView = v3;

  [(UITableView *)self->_searchResultTableView setAccessibilityIdentifier:@"CarSearchResultTableView"];
  [(UITableView *)self->_searchResultTableView setDelegate:self];
  [(UITableView *)self->_searchResultTableView setDataSource:self];
  uint64_t v5 = +[UIColor clearColor];
  [(UITableView *)self->_searchResultTableView setBackgroundColor:v5];

  v6 = self->_searchResultTableView;
  uint64_t v7 = objc_opt_class();
  objc_super v8 = +[CarSearchItemCell reuseIdentifier];
  [(UITableView *)v6 registerClass:v7 forCellReuseIdentifier:v8];

  v9 = [(CarKeyboardSearchResultsViewController *)self view];
  [v9 addSubview:self->_searchResultTableView];

  [(UITableView *)self->_searchResultTableView setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = self->_searchResultTableView;
  id v15 = [(CarKeyboardSearchResultsViewController *)self view];
  v11 = [v15 safeAreaLayoutGuide];
  LODWORD(v12) = 1148846080;
  v13 = -[UITableView _maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:](v10, "_maps_constraintsEqualToEdgesOfLayoutGuide:insets:priority:", v11, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v12);
  v14 = [v13 allConstraints];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)updateForInteractionModel:(unint64_t)a3
{
  BOOL v3 = a3 != 1;
  id v4 = [(CarKeyboardSearchResultsViewController *)self searchResultTableView];
  [v4 setScrollEnabled:v3];
}

- (void)handleSearchButtonPressedWithText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CarKeyboardSearchResultsViewController *)self keyboardMode];
  v6 = [v5 chromeViewController];
  [v6 captureUserAction:2014];

  uint64_t v7 = sub_100015DB4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_super v8 = self;
    if (!v8)
    {
      v13 = @"<nil>";
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      v11 = [(CarKeyboardSearchResultsViewController *)v8 performSelector:"accessibilityIdentifier"];
      double v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Keyboard search button pressed, will perform search", buf, 0xCu);
  }
  v14 = objc_alloc_init(SearchFieldItem);
  id v15 = [v4 _maps_stringByTrimmingLeadingWhitespace];
  [(SearchFieldItem *)v14 setSearchString:v15];

  [(SearchFieldItem *)v14 setUserTypedStringForRAP:v4];
  v16 = +[CarDisplayController sharedInstance];
  id v17 = [v16 processSearchFieldItem:v14 searchInfo:0 userInfo:0];
}

- (void)handleSearchTextDidChange:(id)a3
{
  if (![a3 length])
  {
    id v5 = [(CarKeyboardSearchResultsViewController *)self keyboardMode];
    id v4 = [v5 chromeViewController];
    [v4 captureUserAction:2003];
  }
}

- (void)handleCancelButtonPressed
{
  BOOL v3 = sub_100015DB4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = self;
    if (!v4)
    {
      v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(CarKeyboardSearchResultsViewController *)v4 performSelector:"accessibilityIdentifier"];
      objc_super v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Keyboard cancel button pressed.", buf, 0xCu);
  }
  v10 = [(CarKeyboardSearchResultsViewController *)self keyboardMode];
  v11 = [v10 chromeViewController];
  [v11 captureUserAction:2003];
}

- (void)searchDataProviderDidUpdate:(id)a3
{
  id v3 = a3;
  id v37 = objc_alloc_init((Class)NSMutableArray);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v34 = v3;
  id obj = [v3 sections];
  id v39 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v39)
  {
    uint64_t v38 = *(void *)v47;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v4;
        id v5 = *(void **)(*((void *)&v46 + 1) + 8 * v4);
        id v6 = objc_alloc((Class)NSMutableArray);
        uint64_t v7 = [v5 items];
        id v8 = [v6 initWithCapacity:[v7 count]];

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        v40 = v5;
        v9 = [v5 items];
        id v10 = [v9 countByEnumeratingWithState:&v42 objects:v56 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v43;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v43 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              id v15 = [v14 autocompleteObject];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v16 = v15;
                id v17 = [v16 collectionResult];
                if (v17)
                {
                }
                else
                {
                  v18 = [v16 publisherResult];

                  if (!v18) {
                    [v8 addObject:v14];
                  }
                }
              }
              else
              {
                [v8 addObject:v14];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v42 objects:v56 count:16];
          }
          while (v11);
        }

        if ([v8 count])
        {
          v19 = sub_100015DB4();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = self;
            if (self)
            {
              v21 = (objc_class *)objc_opt_class();
              v22 = NSStringFromClass(v21);
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_27;
              }
              v23 = [(CarKeyboardSearchResultsViewController *)v20 performSelector:"accessibilityIdentifier"];
              v24 = v23;
              if (v23 && ![v23 isEqualToString:v22])
              {
                v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];
              }
              else
              {

LABEL_27:
                v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
              }
            }
            else
            {
              v25 = @"<nil>";
            }

            id v26 = [v8 count];
            *(_DWORD *)buf = 138543874;
            v51 = v25;
            __int16 v52 = 2112;
            v53 = v40;
            __int16 v54 = 2048;
            id v55 = v26;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Setting items for sections : %@. Count: %lu", buf, 0x20u);
          }
          v27 = [AutocompleteSection alloc];
          v28 = [v40 title];
          v29 = -[AutocompleteSection initWithTitle:items:isQuerySuggestionsSection:](v27, "initWithTitle:items:isQuerySuggestionsSection:", v28, v8, [v40 isQuerySuggestionsSection]);
          [v37 addObject:v29];
        }
        uint64_t v4 = v41 + 1;
      }
      while ((id)(v41 + 1) != v39);
      id v30 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
      id v39 = v30;
    }
    while (v30);
  }

  v31 = (NSArray *)[v37 copy];
  filteredResults = self->_filteredResults;
  self->_filteredResults = v31;

  v33 = [(CarKeyboardSearchResultsViewController *)self searchResultTableView];
  [v33 reloadData];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isActive];
  id v6 = sub_100015DB4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (!v7) {
      goto LABEL_26;
    }
    v14 = self;
    if (!v14)
    {
      v19 = @"<nil>";
      goto LABEL_25;
    }
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      id v17 = [(CarKeyboardSearchResultsViewController *)v14 performSelector:"accessibilityIdentifier"];
      v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_17;
      }
    }
    v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_17:

LABEL_25:
    *(_DWORD *)buf = 138543362;
    v32 = v19;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Seaarch controller is not active", buf, 0xCu);

    goto LABEL_26;
  }
  if (v7)
  {
    id v8 = self;
    if (!v8)
    {
      v13 = @"<nil>";
      goto LABEL_19;
    }
    v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(CarKeyboardSearchResultsViewController *)v8 performSelector:"accessibilityIdentifier"];
      uint64_t v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_9;
      }
    }
    v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_9:

LABEL_19:
    v20 = [v4 searchBar];
    v21 = [v20 text];
    *(_DWORD *)buf = 138543618;
    v32 = v13;
    __int16 v33 = 2112;
    v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Processing new query on CarPlay : %@", buf, 0x16u);
  }
  v22 = [v4 searchBar];
  v23 = [v22 text];
  inputText = self->_inputText;
  self->_inputText = v23;

  v25 = [(CarKeyboardSearchResultsViewController *)self searchResultTableView];
  [v25 scrollRectToVisible:0, 0.0, 0.0, 1.0, 1.0];

  id v26 = [(CarKeyboardSearchResultsViewController *)self keyboardMode];
  v27 = [v26 chromeViewController];
  id v6 = [v27 currentTraits];

  v28 = +[MNNavigationService sharedService];
  LODWORD(v27) = [v28 isInNavigatingState];

  if (v27) {
    uint64_t v29 = 2;
  }
  else {
    uint64_t v29 = 0;
  }
  [v6 setAutocompleteOriginationType:v29];
  id v30 = +[MNNavigationService sharedService];
  -[NSObject setNavigating:](v6, "setNavigating:", [v30 isInNavigatingState]);

  [v6 addSupportedAutocompleteListType:2];
  [(SearchDataProvider *)self->_searchDataProvider setInputText:self->_inputText traits:v6 source:12];
LABEL_26:
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_filteredResults count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_filteredResults objectAtIndex:a4];
  unsigned int v5 = [v4 items];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)itemAtIndexPath:(id)a3
{
  filteredResults = self->_filteredResults;
  id v4 = a3;
  unsigned int v5 = -[NSArray objectAtIndex:](filteredResults, "objectAtIndex:", [v4 section]);
  id v6 = [v5 items];
  id v7 = [v4 row];

  id v8 = [v6 objectAtIndex:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 autocompleteObject];

    id v8 = (void *)v9;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CarKeyboardSearchResultsViewController *)self itemAtIndexPath:v7];
  uint64_t v9 = [(CarKeyboardSearchResultsViewController *)self modelForItemAtIndexPath:v7];
  if (!v9)
  {
    uint64_t v9 = +[CarSearchItemCellModel modelWithUpdateBlock:0];
    [v8 updateModel:v9];
  }
  id v10 = [v9 rating];
  if (v10)
  {
  }
  else
  {
    id v11 = [v9 chargerNumberString];

    if (!v11)
    {
      uint64_t v12 = &CarSearchItemCellTwoLineHeight;
      goto LABEL_7;
    }
  }
  uint64_t v12 = &CarSearchItemCellThreeLineHeight;
LABEL_7:
  double v13 = *(double *)v12;

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(CarKeyboardSearchResultsViewController *)self itemAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = sub_100015DB4();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
    goto LABEL_14;
  }
  id v11 = self;
  if (!v11)
  {
    id v16 = @"<nil>";
    goto LABEL_13;
  }
  uint64_t v12 = (objc_class *)objc_opt_class();
  double v13 = NSStringFromClass(v12);
  if (objc_opt_respondsToSelector())
  {
    v14 = [(CarKeyboardSearchResultsViewController *)v11 performSelector:"accessibilityIdentifier"];
    id v15 = v14;
    if (v14 && ![v14 isEqualToString:v13])
    {
      id v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

      goto LABEL_11;
    }
  }
  id v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_11:

LABEL_13:
  *(_DWORD *)buf = 138543874;
  v25 = v16;
  __int16 v26 = 2112;
  v27 = v7;
  __int16 v28 = 2112;
  id v29 = v6;
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] [SearchAC] Selected item: %@ at indexPath: %@", buf, 0x20u);

LABEL_14:
  id v17 = [(CarKeyboardSearchResultsViewController *)self keyboardMode];
  v18 = [v17 chromeViewController];
  [v18 captureUserAction:2007 mapItem:v9 atResultIndex:[v6 row]];

  if ([(NSString *)self->_inputText length])
  {
    inputText = self->_inputText;
    CFStringRef v22 = @"userTypedSearchString";
    v23 = inputText;
    v20 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  }
  else
  {
    v20 = 0;
  }
  if (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes())
  {
    v21 = +[CarDisplayController sharedInstance];
    [v21 processItem:v7 userInfo:v20];
  }
  else
  {
    v21 = +[CarChromeModeCoordinator sharedInstance];
    [v21 displayRoutePlanningForDestination:v7 userInfo:v20];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = +[CarSearchItemCell reuseIdentifier];
  id v8 = [v20 dequeueReusableCellWithIdentifier:v7 forIndexPath:v6];

  id v9 = [(CarKeyboardSearchResultsViewController *)self itemAtIndexPath:v6];
  id v10 = [(CarKeyboardSearchResultsViewController *)self modelForItemAtIndexPath:v6];
  if (!v10)
  {
    objc_initWeak((id *)location, v8);
    objc_initWeak(&from, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100A81728;
    v21[3] = &unk_1012F3D28;
    objc_copyWeak(&v22, &from);
    objc_copyWeak(&v23, (id *)location);
    v21[4] = self;
    id v11 = objc_retainBlock(v21);
    id v10 = +[CarSearchItemCellModel modelWithUpdateBlock:v11];
    [(NSMapTable *)self->_modelsByItem setObject:v10 forKey:v9];
    [v9 updateModel:v10];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
  }
  uint64_t v12 = sub_100015DB4();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    double v13 = self;
    if (!v13)
    {
      v18 = @"<nil>";
      goto LABEL_12;
    }
    v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      id v16 = [(CarKeyboardSearchResultsViewController *)v13 performSelector:"accessibilityIdentifier"];
      id v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_10;
      }
    }
    v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_10:

LABEL_12:
    *(_DWORD *)location = 138543874;
    *(void *)&location[4] = v18;
    __int16 v26 = 2112;
    v27 = v10;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] [SearchAC] Setting up cell with model: %@, indexpath: %@", location, 0x20u);
  }
  [v8 setupWithModel:v10 cellStyle:self->_cellStyle];

  return v8;
}

- (id)modelForItemAtIndexPath:(id)a3
{
  modelsByItem = self->_modelsByItem;
  id v4 = [(CarKeyboardSearchResultsViewController *)self itemAtIndexPath:a3];
  unsigned int v5 = [(NSMapTable *)modelsByItem objectForKey:v4];

  return v5;
}

- (CarKeyboardModeController)keyboardMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardMode);

  return (CarKeyboardModeController *)WeakRetained;
}

- (void)setKeyboardMode:(id)a3
{
}

- (UITableView)searchResultTableView
{
  return self->_searchResultTableView;
}

- (void)setSearchResultTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultTableView, 0);
  objc_destroyWeak((id *)&self->_keyboardMode);
  objc_storeStrong((id *)&self->_modelsByItem, 0);
  objc_storeStrong((id *)&self->_inputText, 0);
  objc_storeStrong((id *)&self->_filteredResults, 0);

  objc_storeStrong((id *)&self->_searchDataProvider, 0);
}

@end