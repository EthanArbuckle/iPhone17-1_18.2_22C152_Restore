@interface MTAAddClockViewController
+ (void)addCityFromUserActivity:(id)a3 parentViewController:(id)a4;
- (BOOL)_canShowWhileLocked;
- (CGRect)keyboardFrame;
- (MTAAddClockViewController)init;
- (MTAUpdateClockViewControllerDelegate)delegate;
- (NSArray)centerNoResultsFoundLabelConstraints;
- (UILabel)noResultsFoundLabel;
- (UISearchBar)searchBar;
- (double)_calculateVerticalMultiplierForKeyboard;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)_addAutolayoutConstraintsForNoResultsFoundLabel;
- (void)_dismiss;
- (void)_dismissWithoutDefferingTransitions;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillDismiss:(id)a3;
- (void)_keyboardWillResize:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_reloadNoResultsFoundLabelForKeyboardNotification:(id)a3;
- (void)_removeAutolayoutConstraintsForNoResultsFoundLabel;
- (void)_showNoResultsFound:(BOOL)a3;
- (void)contentSizeCategoryDidChange;
- (void)prepopulateSuggestions;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)setCenterNoResultsFoundLabelConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKeyboardFrame:(CGRect)a3;
- (void)setNoResultsFoundLabel:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTAAddClockViewController

- (MTAAddClockViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTAAddClockViewController;
  v2 = [(MTAAddClockViewController *)&v4 initWithNibName:0 bundle:0];
  if (v2 && MTUIIsPadIdiom()) {
    [(MTAAddClockViewController *)v2 setModalPresentationStyle:2];
  }
  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)MTAAddClockViewController;
  [(MTAAddClockViewController *)&v17 viewDidLoad];
  v3 = [(MTAAddClockViewController *)self tableView];
  [v3 _setDisplaysCellContentStringsOnTapAndHold:1];
  objc_super v4 = +[UIColor mtui_tintColor];
  [v3 setTintColor:v4];

  v5 = +[UIColor mtui_tintColor];
  [v3 setSectionIndexColor:v5];

  v6 = +[UIColor mtui_backgroundColor];
  [v3 setBackgroundColor:v6];

  [v3 setEstimatedRowHeight:48.0];
  [v3 setRowHeight:UITableViewAutomaticDimension];
  v7 = +[UIColor clearColor];
  [v3 setSectionIndexBackgroundColor:v7];

  [(MTAAddClockViewController *)self prepopulateSuggestions];
  v8 = [objc_alloc((Class)UISearchBar) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  searchBar = self->_searchBar;
  self->_searchBar = v8;

  [(UISearchBar *)self->_searchBar setSearchBarStyle:2];
  [(UISearchBar *)self->_searchBar setAutoresizingMask:2];
  [(UISearchBar *)self->_searchBar setAutocapitalizationType:0];
  [(UISearchBar *)self->_searchBar setKeyboardType:0];
  [(UISearchBar *)self->_searchBar setAutocorrectionType:1];
  [(UISearchBar *)self->_searchBar setKeyboardAppearance:1];
  [(UISearchBar *)self->_searchBar setTextContentType:UITextContentTypeAddressCityAndState];
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"SEARCH" value:&stru_1000A2560 table:0];
  [(UISearchBar *)self->_searchBar setPlaceholder:v11];

  [(UISearchBar *)self->_searchBar setBackgroundColor:0];
  [(UISearchBar *)self->_searchBar setBackgroundImage:0 forBarPosition:0 barMetrics:101];
  [(UISearchBar *)self->_searchBar _setBackdropStyle:2030];
  [(UISearchBar *)self->_searchBar setDelegate:self];
  v12 = [(MTAAddClockViewController *)self navigationItem];
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"SEARCH_FOR_CITY" value:&stru_1000A2560 table:0];
  [v12 setPrompt:v14];

  id v15 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_dismiss"];
  [v12 setRightBarButtonItem:v15];

  [v12 setTitleView:self->_searchBar];
  v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MTAAddClockViewController;
  id v6 = a3;
  [(MTAAddClockViewController *)&v11 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  v7 = [(MTAAddClockViewController *)self traitCollection];
  id v8 = [v7 horizontalSizeClass];
  id v9 = [v6 horizontalSizeClass];

  if (v8 != v9)
  {
    v10 = [(MTAAddClockViewController *)self delegate];
    [v10 dismissAddViewController:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTAAddClockViewController;
  [(MTAAddClockViewController *)&v7 viewWillAppear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_keyboardWillDismiss:" name:UIKeyboardWillHideNotification object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_keyboardDidShow:" name:UIKeyboardDidShowNotification object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTAAddClockViewController;
  [(MTAAddClockViewController *)&v7 viewWillDisappear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIKeyboardWillHideNotification object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:UIKeyboardDidShowNotification object:0];
}

- (void)_dismiss
{
  id v3 = [(MTAAddClockViewController *)self delegate];
  [v3 dismissAddViewController:self];
}

- (void)_dismissWithoutDefferingTransitions
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100050F88;
  v2[3] = &unk_1000A1428;
  v2[4] = self;
  +[UIViewController _performWithoutDeferringTransitions:v2];
}

- (void)_showNoResultsFound:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(MTAAddClockViewController *)self tableView];
  v5 = [(MTAAddClockViewController *)self noResultsFoundLabel];
  id v6 = v5;
  int v7 = !v3;
  if (!v3 || v5)
  {
    if (!v5) {
      int v7 = 0;
    }
    if (v7 == 1)
    {
      [v5 removeFromSuperview];
      [(MTAAddClockViewController *)self setNoResultsFoundLabel:0];
      [v12 setSeparatorStyle:1];
      [(MTAAddClockViewController *)self _removeAutolayoutConstraintsForNoResultsFoundLabel];
    }
  }
  else
  {
    id v6 = objc_opt_new();
    [(MTAAddClockViewController *)self setNoResultsFoundLabel:v6];
    [v6 setOpaque:0];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setBackgroundColor:0];
    [v6 setTextAlignment:1];
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"NO_RESULTS_FOUND" value:&stru_1000A2560 table:0];
    [v6 setText:v9];

    v10 = +[UIColor mtui_primaryTextColor];
    [v6 setTextColor:v10];

    objc_super v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v6 setFont:v11];

    [v6 setAdjustsFontForContentSizeCategory:1];
    [v6 sizeToFit];
    [v12 addSubview:v6];
    [(MTAAddClockViewController *)self _addAutolayoutConstraintsForNoResultsFoundLabel];
    [v12 setSeparatorStyle:0];
  }
}

- (void)prepopulateSuggestions
{
  v2 = +[ALCityManager sharedManager];
  BOOL v3 = [v2 allCities];
  objc_super v4 = +[NSMutableArray arrayWithArray:v3];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v5 = +[WorldClockManager sharedManager];
  id v6 = [v5 cities];

  id v7 = [v6 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v52;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = [*(id *)(*((void *)&v51 + 1) + 8 * i) alCity];
        [v4 removeObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v8);
  }

  v41 = v4;
  id v12 = [v4 sortedArrayUsingComparator:&stru_1000A1FC8];
  cities = self->_cities;
  self->_cities = v12;

  v14 = +[UILocalizedIndexedCollation currentCollation];
  id v15 = [v14 sectionTitles];
  v16 = (char *)[v15 count];

  objc_super v17 = +[NSMutableArray arrayWithCapacity:v16];
  if (v16)
  {
    v18 = v16;
    do
    {
      v19 = +[NSMutableArray array];
      [v17 addObject:v19];

      --v18;
    }
    while (v18);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v20 = self->_cities;
  id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v48;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v47 + 1) + 8 * (void)j);
        v26 = [v17 objectAtIndex:[v14 sectionForObject:v25 collationStringSelector:"name"]];
        [v26 addObject:v25];
      }
      id v22 = [(NSArray *)v20 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v22);
  }

  v27 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v16];
  v28 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
  populatedIndexSet = self->_populatedIndexSet;
  self->_populatedIndexSet = v28;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v30 = v17;
  id v31 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = 0;
    uint64_t v34 = *(void *)v44;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(v30);
        }
        v36 = [v14 sortedArrayFromArray:*(void *)(*((void *)&v43 + 1) + 8 * (void)k) collationStringSelector:"name"];
        [(NSArray *)v27 addObject:v36];
        if ([v36 count]) {
          [(NSMutableIndexSet *)self->_populatedIndexSet addIndex:(char *)k + v33];
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
      v33 += (uint64_t)k;
    }
    while (v32);
  }

  v37 = [v14 sectionIndexTitles];
  sectionIndexTitles = self->_sectionIndexTitles;
  self->_sectionIndexTitles = v37;

  partitionedCities = self->_partitionedCities;
  self->_partitionedCities = v27;

  v40 = [(MTAAddClockViewController *)self tableView];
  [v40 reloadData];
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if (self->_partitionedCities) {
    return self->_sectionIndexTitles;
  }
  else {
    return 0;
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(NSArray *)self->_partitionedCities objectAtIndex:a4];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = +[UILocalizedIndexedCollation currentCollation];
    id v8 = [v7 sectionTitles];
    uint64_t v9 = [v8 objectAtIndex:a4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)contentSizeCategoryDidChange
{
  id v6 = [(MTAAddClockViewController *)self tableView];
  [v6 contentOffset];
  double v3 = v2;
  double v5 = v4;
  [v6 reloadData];
  [v6 setContentOffset:0 animated:v3];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = [(NSArray *)self->_cities count];
  if (self->_partitionedCities)
  {
    id v7 = [(NSArray *)self->_partitionedCities objectAtIndex:a4];
    id v8 = [v7 count];

    return (int64_t)v8;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (!self->_partitionedCities) {
    return 1;
  }
  double v3 = +[UILocalizedIndexedCollation currentCollation];
  double v4 = [v3 sectionTitles];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7 = +[UILocalizedIndexedCollation currentCollation];
  id v8 = [v7 sectionForSectionIndexTitleAtIndex:a5];

  id v9 = [(NSMutableIndexSet *)self->_populatedIndexSet indexGreaterThanOrEqualToIndex:v8];
  int64_t result = (int64_t)[(NSMutableIndexSet *)self->_populatedIndexSet indexLessThanIndex:v8];
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL) {
    return (int64_t)v9;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"ClockSearchCellIdentifier"];
  if (!v7)
  {
    id v7 = [[MTAClockSearchCell alloc] initWithStyle:0 reuseIdentifier:0];
    id v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    id v9 = [(MTAClockSearchCell *)v7 textLabel];
    [v9 setFont:v8];

    v10 = [(MTAClockSearchCell *)v7 textLabel];
    [v10 setAdjustsFontForContentSizeCategory:1];
  }
  if ([v6 row] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v11 = -[NSArray objectAtIndex:](self->_cities, "objectAtIndex:", [v6 row]);
    partitionedCities = self->_partitionedCities;
    if (partitionedCities)
    {
      v13 = -[NSArray objectAtIndex:](partitionedCities, "objectAtIndex:", [v6 section]);
      uint64_t v14 = [v13 objectAtIndex:[v6 row]];

      objc_super v11 = (void *)v14;
    }
    id v15 = [v11 displayNameIncludingCountry:1];
    v16 = [(MTAClockSearchCell *)v7 textLabel];
    [v16 setText:v15];

    objc_super v17 = [v11 displayNameIncludingCountry:1 withFormat:@"%@\n%@"];
    [(MTAClockSearchCell *)v7 setContentString:v17];

    v18 = +[UIColor mtui_primaryTextColor];
    v19 = [(MTAClockSearchCell *)v7 textLabel];
    [v19 setTextColor:v18];

    v20 = +[UIColor mtui_backgroundColor];
    [(MTAClockSearchCell *)v7 setBackgroundColor:v20];

    id v21 = +[UIColor mtui_cellHighlightColor];
    [(MTAClockSearchCell *)v7 setSelectedBackgroundColor:v21];
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a4;
  if ([v14 row] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self];

    id v6 = -[NSArray objectAtIndex:](self->_cities, "objectAtIndex:", [v14 row]);
    partitionedCities = self->_partitionedCities;
    if (partitionedCities)
    {
      id v8 = -[NSArray objectAtIndex:](partitionedCities, "objectAtIndex:", [v14 section]);
      uint64_t v9 = [v8 objectAtIndex:[v14 row]];

      id v6 = (void *)v9;
    }
    v10 = [(MTAAddClockViewController *)self searchBar];
    [v10 resignFirstResponder];

    id v11 = [objc_alloc((Class)WorldClockCity) initWithALCity:v6];
    id v12 = [(MTAAddClockViewController *)self delegate];
    [v12 addClockViewController:self addCity:v11];

    v13 = [(MTAAddClockViewController *)self delegate];
    [v13 dismissAddViewController:self];
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v16 = [a3 text];
  partitionedCities = self->_partitionedCities;
  self->_partitionedCities = 0;

  if ([v16 length])
  {
    id v6 = +[ALCityManager sharedManager];
    id v7 = [v6 citiesMatchingName:v16];

    id v8 = [v7 sortedArrayUsingComparator:&stru_1000A1FE8];
    cities = self->_cities;
    self->_cities = v8;
  }
  else
  {
    v10 = self->_cities;
    self->_cities = 0;

    [(MTAAddClockViewController *)self prepopulateSuggestions];
  }
  id v11 = [(MTAAddClockViewController *)self tableView];
  [v11 reloadData];

  if ([(NSArray *)self->_cities count])
  {
    id v12 = [(MTAAddClockViewController *)self tableView];
    v13 = [(MTAAddClockViewController *)self view];
    [v13 safeAreaInsets];
    [v12 setContentOffset:1 animated:0.0];
  }
  if ([v16 length] && !-[NSArray count](self->_cities, "count")) {
    uint64_t v15 = [v16 isEqualToString:@"\n"] ^ 1;
  }
  else {
    uint64_t v15 = 0;
  }
  [(MTAAddClockViewController *)self _showNoResultsFound:v15];
}

- (void)_addAutolayoutConstraintsForNoResultsFoundLabel
{
  id v12 = [(MTAAddClockViewController *)self tableView];
  double v3 = [(MTAAddClockViewController *)self noResultsFoundLabel];
  double v4 = [(MTAAddClockViewController *)self centerNoResultsFoundLabelConstraints];

  if (!v4)
  {
    id v5 = objc_opt_new();
    id v6 = [v3 centerXAnchor];
    id v7 = [v12 centerXAnchor];
    id v8 = [v6 constraintEqualToAnchor:v7];
    [v5 addObject:v8];

    [(MTAAddClockViewController *)self _calculateVerticalMultiplierForKeyboard];
    if (v9 > 0.0)
    {
      v10 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 10, 0, v12, 10);
      [v5 addObject:v10];
    }
    [(MTAAddClockViewController *)self setCenterNoResultsFoundLabelConstraints:v5];
  }
  id v11 = [(MTAAddClockViewController *)self centerNoResultsFoundLabelConstraints];
  [v12 addConstraints:v11];
}

- (double)_calculateVerticalMultiplierForKeyboard
{
  double v3 = [(MTAAddClockViewController *)self view];
  [v3 frame];
  double v5 = v4;

  [(MTAAddClockViewController *)self keyboardFrame];
  v14.origin.x = v6;
  v14.origin.y = v7;
  v14.size.width = v8;
  double v10 = v9;
  v13.origin.x = CGRectZero.origin.x;
  v13.origin.y = CGRectZero.origin.y;
  v13.size.width = CGRectZero.size.width;
  v13.size.height = CGRectZero.size.height;
  v14.size.height = v10;
  BOOL v11 = CGRectEqualToRect(v13, v14);
  double result = 1.0;
  if (!v11) {
    return fmax(v10 / v5, 0.5);
  }
  return result;
}

- (void)_removeAutolayoutConstraintsForNoResultsFoundLabel
{
  id v4 = [(MTAAddClockViewController *)self centerNoResultsFoundLabelConstraints];
  if (v4)
  {
    double v3 = [(MTAAddClockViewController *)self tableView];
    [v3 removeConstraints:v4];

    [(MTAAddClockViewController *)self setCenterNoResultsFoundLabelConstraints:0];
  }
}

- (void)_keyboardWillShow:(id)a3
{
  id v17 = [a3 userInfo];
  id v4 = [v17 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v4 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  CGRect v13 = [(MTAAddClockViewController *)self view];
  [v13 convertRect:0 fromView:v6, v8, v10, v12];
  -[MTAAddClockViewController setKeyboardFrame:](self, "setKeyboardFrame:");

  [(MTAAddClockViewController *)self _reloadNoResultsFoundLabelForKeyboardNotification:v17];
  CGRect v14 = +[UIColor clearColor];
  uint64_t v15 = [(MTAAddClockViewController *)self searchBar];
  [v15 setTintColor:v14];

  id v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"_keyboardWillResize:" name:UIKeyboardWillChangeFrameNotification object:0];
}

- (void)_keyboardDidShow:(id)a3
{
  id v6 = +[UISearchBar appearance];
  id v4 = [v6 tintColor];
  double v5 = [(MTAAddClockViewController *)self searchBar];
  [v5 setTintColor:v4];
}

- (void)_keyboardWillDismiss:(id)a3
{
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = a3;
  -[MTAAddClockViewController setKeyboardFrame:](self, "setKeyboardFrame:", CGRectZero.origin.x, y, width, height);
  double v8 = [v7 userInfo];

  [(MTAAddClockViewController *)self _reloadNoResultsFoundLabelForKeyboardNotification:v8];
  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:UIKeyboardWillChangeFrameNotification object:0];
}

- (void)_keyboardWillResize:(id)a3
{
  id v14 = [a3 userInfo];
  id v4 = [v14 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v4 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  CGRect v13 = [(MTAAddClockViewController *)self view];
  [v13 convertRect:0 fromView:v6, v8, v10, v12];
  -[MTAAddClockViewController setKeyboardFrame:](self, "setKeyboardFrame:");

  [(MTAAddClockViewController *)self _reloadNoResultsFoundLabelForKeyboardNotification:v14];
}

- (void)_reloadNoResultsFoundLabelForKeyboardNotification:(id)a3
{
  id v11 = a3;
  id v4 = [(MTAAddClockViewController *)self noResultsFoundLabel];

  if (v4)
  {
    double v5 = [v11 objectForKeyedSubscript:UIKeyboardAnimationDurationUserInfoKey];
    [v5 doubleValue];
    double v7 = v6;

    double v8 = [v11 objectForKeyedSubscript:UIKeyboardAnimationCurveUserInfoKey];
    id v9 = [v8 integerValue];

    +[UIView beginAnimations:0 context:0];
    +[UIView setAnimationDuration:v7];
    +[UIView setAnimationCurve:v9];
    +[UIView setAnimationBeginsFromCurrentState:1];
    [(MTAAddClockViewController *)self _removeAutolayoutConstraintsForNoResultsFoundLabel];
    [(MTAAddClockViewController *)self _addAutolayoutConstraintsForNoResultsFoundLabel];
    double v10 = [(MTAAddClockViewController *)self view];
    [v10 layoutIfNeeded];

    +[UIView commitAnimations];
  }
}

+ (void)addCityFromUserActivity:(id)a3 parentViewController:(id)a4
{
  id v5 = a4;
  double v6 = [a3 userInfo];
  double v7 = [v6 objectForKeyedSubscript:@"TimeZone"];
  double v8 = +[NSTimeZone timeZoneWithName:v7];

  if (v8)
  {
    id v9 = [v6 objectForKeyedSubscript:@"Latitude"];
    [v9 doubleValue];
    double v11 = v10;

    double v12 = [v6 objectForKeyedSubscript:@"Longitude"];
    [v12 doubleValue];
    double v14 = v13;

    id v15 = [objc_alloc((Class)CLLocation) initWithLatitude:v11 longitude:v14];
    id v16 = +[WorldClockManager sharedManager];
    id v17 = [v16 closestCityToLocation:v15 matchingTimeZone:v8];
    v18 = [v16 cities];

    if (!v18) {
      [v16 loadCities];
    }
    v19 = [v16 cities];
    id v20 = [v19 indexOfObject:v17];

    if (v20 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v21 = +[NSBundle mainBundle];
      id v22 = [v21 localizedStringForKey:@"ADD_WORLD_CLOCK_FORMAT" value:&stru_1000A2560 table:0];
      uint64_t v23 = [v17 name];
      v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v23);

      uint64_t v25 = +[UIAlertController alertControllerWithTitle:v24 message:0 preferredStyle:1];
      id v35 = v5;
      v26 = +[NSBundle mainBundle];
      [v26 localizedStringForKey:@"CANCEL" value:&stru_1000A2560 table:0];
      v27 = id v34 = v15;
      v28 = +[UIAlertAction actionWithTitle:v27 style:1 handler:0];
      [v25 addAction:v28];

      v29 = +[NSBundle mainBundle];
      id v30 = [v29 localizedStringForKey:@"ADD_CLOCK" value:&stru_1000A2560 table:0];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10005297C;
      v39[3] = &unk_1000A2010;
      id v31 = v5;
      id v40 = v31;
      id v41 = v17;
      id v32 = +[UIAlertAction actionWithTitle:v30 style:0 handler:v39];
      [v25 addAction:v32];

      id v15 = v34;
      uint64_t v33 = v31;
      id v5 = v35;
      [v33 presentViewController:v25 animated:1 completion:0];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000529C4;
      block[3] = &unk_1000A2038;
      id v37 = v5;
      id v38 = v20;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v24 = v37;
    }
  }
}

- (MTAUpdateClockViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTAUpdateClockViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (NSArray)centerNoResultsFoundLabelConstraints
{
  return self->_centerNoResultsFoundLabelConstraints;
}

- (void)setCenterNoResultsFoundLabelConstraints:(id)a3
{
}

- (UILabel)noResultsFoundLabel
{
  return self->_noResultsFoundLabel;
}

- (void)setNoResultsFoundLabel:(id)a3
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_noResultsFoundLabel, 0);
  objc_storeStrong((id *)&self->_centerNoResultsFoundLabelConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_populatedIndexSet, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
  objc_storeStrong((id *)&self->_partitionedCities, 0);

  objc_storeStrong((id *)&self->_cities, 0);
}

@end