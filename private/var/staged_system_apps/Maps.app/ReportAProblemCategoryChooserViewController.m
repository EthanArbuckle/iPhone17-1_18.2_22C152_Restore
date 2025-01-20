@interface ReportAProblemCategoryChooserViewController
- (BOOL)showingPartialSearchResults;
- (NSArray)fullCategoryList;
- (NSArray)originalCategoryList;
- (NSArray)partialCategoryList;
- (NSMutableArray)selectedCategoryNames;
- (RAPCategoryChooserDelegate)chooserDelegate;
- (ReportAProblemCategoryChooserViewController)initWithPresentationStyle:(int64_t)a3 selectedCategoryNames:(id)a4;
- (UIColor)selectedTextColor;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)categoryNameAtIndexPath:(id)a3;
- (id)searchBarDefaultPlaceholder;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int)analyticTarget;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)presentationStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancel;
- (void)_captureUserAction:(int)a3;
- (void)_categoryNameSelected:(id)a3;
- (void)_didTapOnRightBarButtonItem;
- (void)_updateDoneBarButtonItem;
- (void)_updateSearchResultsWithString:(id)a3;
- (void)checkmarkTableViewCell:(id)a3 isSelected:(BOOL)a4;
- (void)fetchLocalizedCategories;
- (void)macFooterViewBackButtonTapped:(id)a3;
- (void)macFooterViewLeftButtonTapped:(id)a3;
- (void)macFooterViewRightButtonTapped:(id)a3;
- (void)saveCategoryAndDismissIfNecessary;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)setChooserDelegate:(id)a3;
- (void)setFullCategoryList:(id)a3;
- (void)setOriginalCategoryList:(id)a3;
- (void)setPartialCategoryList:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setSelectedCategoryNames:(id)a3;
- (void)setSelectedTextColor:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateBarButtonItems;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateSelectedCategoryNames:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ReportAProblemCategoryChooserViewController

- (ReportAProblemCategoryChooserViewController)initWithPresentationStyle:(int64_t)a3 selectedCategoryNames:(id)a4
{
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ReportAProblemCategoryChooserViewController;
  v7 = [(ReportAProblemCategoryChooserViewController *)&v24 initWithStyle:0];
  v8 = v7;
  if (v7)
  {
    v7->_presentationStyle = a3;
    [(ReportAProblemCategoryChooserViewController *)v7 updateBarButtonItems];
    v9 = (UIColor *)[objc_alloc((Class)UIColor) initWithRed:0.984313726 green:0.23137255 blue:0.101960786 alpha:1.0];
    selectedTextColor = v8->_selectedTextColor;
    v8->_selectedTextColor = v9;

    v11 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v6];
    selectedCategoryNames = v8->_selectedCategoryNames;
    v8->_selectedCategoryNames = v11;

    v13 = (NSArray *)[(NSMutableArray *)v8->_selectedCategoryNames copy];
    originalCategoryList = v8->_originalCategoryList;
    v8->_originalCategoryList = v13;

    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"Select a Category" value:@"localized string not found" table:0];
    [(ReportAProblemCategoryChooserViewController *)v8 setTitle:v16];

    v17 = [(ReportAProblemCategoryChooserViewController *)v8 tableView];
    uint64_t v18 = objc_opt_class();
    v19 = +[RAPCategorySearchTableViewCell identifier];
    [v17 registerClass:v18 forCellReuseIdentifier:v19];

    v20 = [(ReportAProblemCategoryChooserViewController *)v8 tableView];
    uint64_t v21 = objc_opt_class();
    v22 = +[MacRAPCheckmarkCell identifier];
    [v20 registerClass:v21 forCellReuseIdentifier:v22];

    [(ReportAProblemCategoryChooserViewController *)v8 fetchLocalizedCategories];
  }

  return v8;
}

- (int)analyticTarget
{
  return 1156;
}

- (void)fetchLocalizedCategories
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100B7BB54;
  v2[3] = &unk_1012E9BD0;
  objc_copyWeak(&v3, &location);
  +[RAPCategoriesDownloader fetchCategories:v2];
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_updateDoneBarButtonItem
{
  id v7 = +[NSSet setWithArray:self->_originalCategoryList];
  id v3 = +[NSSet setWithArray:self->_selectedCategoryNames];
  uint64_t v4 = [v7 isEqualToSet:v3] ^ 1;
  v5 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
  id v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:v4];
}

- (void)_didTapOnRightBarButtonItem
{
  [(ReportAProblemCategoryChooserViewController *)self _captureUserAction:10110];

  [(ReportAProblemCategoryChooserViewController *)self saveCategoryAndDismissIfNecessary];
}

- (void)saveCategoryAndDismissIfNecessary
{
  id v3 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
  uint64_t v4 = [v3 searchController];
  [v4 setActive:0];

  v5 = [(ReportAProblemCategoryChooserViewController *)self chooserDelegate];
  id v6 = [(ReportAProblemCategoryChooserViewController *)self selectedCategoryNames];
  [v5 categoryChooserViewController:self didReceiveSelectedCategories:v6];

  id v7 = [(ReportAProblemCategoryChooserViewController *)self traitCollection];
  id v8 = [v7 userInterfaceIdiom];

  if (v8 == (id)5)
  {
    id v10 = [(ReportAProblemCategoryChooserViewController *)self navigationController];
    id v9 = [v10 popViewControllerAnimated:1];
  }
  else if ((id)[(ReportAProblemCategoryChooserViewController *)self presentationStyle] == (id)1)
  {
    [(ReportAProblemCategoryChooserViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_cancel
{
  id v3 = [(ReportAProblemCategoryChooserViewController *)self chooserDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(ReportAProblemCategoryChooserViewController *)self chooserDelegate];
    [v5 categoryChooserViewController:self categoriesDidNotChange:self->_originalCategoryList];
  }
  [(ReportAProblemCategoryChooserViewController *)self _captureUserAction:10111];
  id v6 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
  id v7 = [v6 searchController];
  [v7 setActive:0];

  [(ReportAProblemCategoryChooserViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)ReportAProblemCategoryChooserViewController;
  [(ReportAProblemCategoryChooserViewController *)&v17 viewDidLoad];
  char v4 = [(ReportAProblemCategoryChooserViewController *)self tableView];
  [v4 setDataSource:self];

  v5 = [(ReportAProblemCategoryChooserViewController *)self tableView];
  [v5 setKeyboardDismissMode:1];

  id v6 = [(ReportAProblemCategoryChooserViewController *)self tableView];
  [v6 setRowHeight:UITableViewAutomaticDimension];

  id v7 = [(ReportAProblemCategoryChooserViewController *)self traitCollection];
  id v8 = [v7 userInterfaceIdiom];

  if (v8 == (id)5)
  {
    id v9 = [(ReportAProblemCategoryChooserViewController *)self tableView];
    [v9 setSeparatorStyle:0];
  }
  else
  {
    id v9 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
    [v9 setSearchResultsUpdater:self];
    [v9 setObscuresBackgroundDuringPresentation:0];
    [v9 setHidesNavigationBarDuringPresentation:0];
    id v10 = [(ReportAProblemCategoryChooserViewController *)self fullCategoryList];
    id v11 = [v10 count];
    if (v11)
    {
      [(ReportAProblemCategoryChooserViewController *)self searchBarDefaultPlaceholder];
    }
    else
    {
      v2 = +[NSBundle mainBundle];
      [v2 localizedStringForKey:@"Loading Categories..." value:@"localized string not found" table:0];
    v12 = };
    v13 = [v9 searchBar];
    [v13 setPlaceholder:v12];

    if (!v11)
    {

      v12 = v2;
    }

    v14 = [v9 searchBar];
    [v14 setReturnKeyType:9];

    [v9 setAutomaticallyShowsCancelButton:0];
    v15 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
    [v15 setSearchController:v9];

    v16 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
    [v16 setHidesSearchBarWhenScrolling:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ReportAProblemCategoryChooserViewController;
  [(ReportAProblemCategoryChooserViewController *)&v5 viewDidAppear:a3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B7C25C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)searchBarDefaultPlaceholder
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Search for a category" value:@"localized string not found" table:0];

  return v3;
}

- (void)updateBarButtonItems
{
  if ([(ReportAProblemCategoryChooserViewController *)self presentationStyle])
  {
    if ((id)[(ReportAProblemCategoryChooserViewController *)self presentationStyle] == (id)1)
    {
      id v3 = objc_alloc((Class)UIBarButtonItem);
      char v4 = +[NSBundle mainBundle];
      objc_super v5 = [v4 localizedStringForKey:@"RAPCategory_Cancel" value:@"localized string not found" table:0];
      id v6 = [v3 initWithTitle:v5 style:0 target:self action:"_cancel"];
      id v7 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
      [v7 setLeftBarButtonItem:v6];

      id v8 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
      [v8 setHidesBackButton:1];

      id v9 = objc_alloc((Class)UIBarButtonItem);
      id v10 = +[NSBundle mainBundle];
      id v11 = [v10 localizedStringForKey:@"RAPCategory_Add" value:@"localized string not found" table:0];
      id v12 = [v9 initWithTitle:v11 style:2 target:self action:"_didTapOnRightBarButtonItem"];
      v13 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
      [v13 setRightBarButtonItem:v12];

      [(ReportAProblemCategoryChooserViewController *)self _updateDoneBarButtonItem];
    }
  }
  else
  {
    id v16 = +[NSBundle mainBundle];
    v14 = [v16 localizedStringForKey:@"Back" value:@"localized string not found" table:0];
    v15 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
    [v15 setBackButtonTitle:v14];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v5 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
  id v3 = [v5 searchController];
  char v4 = [v3 searchBar];
  [v4 endEditing:1];
}

- (void)updateSelectedCategoryNames:(id)a3
{
  id v4 = a3;
  id v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v4];

  selectedCategoryNames = self->_selectedCategoryNames;
  self->_selectedCategoryNames = v5;

  id v7 = (NSArray *)[(NSMutableArray *)self->_selectedCategoryNames copy];
  originalCategoryList = self->_originalCategoryList;
  self->_originalCategoryList = v7;

  [(ReportAProblemCategoryChooserViewController *)self _updateDoneBarButtonItem];
  id v9 = [(ReportAProblemCategoryChooserViewController *)self tableView];
  [v9 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(ReportAProblemCategoryChooserViewController *)self showingPartialSearchResults])
  {
    [(ReportAProblemCategoryChooserViewController *)self partialCategoryList];
  }
  else
  {
    [(ReportAProblemCategoryChooserViewController *)self fullCategoryList];
  id v5 = };
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(ReportAProblemCategoryChooserViewController *)self categoryNameAtIndexPath:a4];
  id v8 = [(ReportAProblemCategoryChooserViewController *)self selectedCategoryNames];
  id v9 = [v8 containsObject:v7];

  id v10 = [(ReportAProblemCategoryChooserViewController *)self traitCollection];
  id v11 = [v10 userInterfaceIdiom];

  if (v11 == (id)5)
  {
    id v12 = +[MacRAPCheckmarkCell identifier];
    v13 = [v6 dequeueReusableCellWithIdentifier:v12];

    [v13 setChecked:v9];
    [v13 setDisplayText:v7];
    [v13 setDelegate:self];
    [v13 setObject:v7];
  }
  else
  {
    v14 = +[RAPCategorySearchTableViewCell identifier];
    v13 = [v6 dequeueReusableCellWithIdentifier:v14];

    [v13 setChecked:v9];
    [v13 setDisplayText:v7];
  }

  return v13;
}

- (BOOL)showingPartialSearchResults
{
  v2 = [(ReportAProblemCategoryChooserViewController *)self navigationItem];
  id v3 = [v2 searchController];

  if ([v3 isActive])
  {
    id v4 = [v3 searchBar];
    id v5 = [v4 text];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)categoryNameAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(ReportAProblemCategoryChooserViewController *)self showingPartialSearchResults]) {
    [(ReportAProblemCategoryChooserViewController *)self partialCategoryList];
  }
  else {
  id v5 = [(ReportAProblemCategoryChooserViewController *)self fullCategoryList];
  }
  id v6 = [v4 row];

  id v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v4 = +[RAPFontManager regularTitleFont];
  [v4 _mapkit_scaledValueForValue:55.0];
  double v6 = v5;

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ReportAProblemCategoryChooserViewController *)self traitCollection];
  id v9 = [v8 userInterfaceIdiom];

  if (v9 != (id)5)
  {
    id v10 = [(ReportAProblemCategoryChooserViewController *)self categoryNameAtIndexPath:v7];
    [(ReportAProblemCategoryChooserViewController *)self _categoryNameSelected:v10];
    [v6 deselectRowAtIndexPath:v7 animated:0];
    id v12 = v7;
    id v11 = +[NSArray arrayWithObjects:&v12 count:1];
    [v6 reloadRowsAtIndexPaths:v11 withRowAnimation:100];
  }
}

- (void)_categoryNameSelected:(id)a3
{
  id v9 = a3;
  id v4 = [(ReportAProblemCategoryChooserViewController *)self selectedCategoryNames];
  unsigned int v5 = [v4 containsObject:v9];

  if (v5)
  {
    id v6 = [(ReportAProblemCategoryChooserViewController *)self selectedCategoryNames];
    [v6 removeObject:v9];

    [(ReportAProblemCategoryChooserViewController *)self _captureUserAction:10170];
  }
  else
  {
    id v7 = [(NSMutableArray *)self->_selectedCategoryNames count];
    if ((unint64_t)v7 < GEOConfigGetUInteger())
    {
      [(ReportAProblemCategoryChooserViewController *)self _captureUserAction:10147];
      id v8 = [(ReportAProblemCategoryChooserViewController *)self selectedCategoryNames];
      [v8 addObject:v9];
    }
  }
  [(ReportAProblemCategoryChooserViewController *)self _updateDoneBarButtonItem];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v5 = [a3 searchBar];
  id v4 = [v5 text];
  [(ReportAProblemCategoryChooserViewController *)self _updateSearchResultsWithString:v4];
}

- (void)_updateSearchResultsWithString:(id)a3
{
  id v10 = a3;
  unsigned int v4 = [(ReportAProblemCategoryChooserViewController *)self showingPartialSearchResults];
  id v5 = [(ReportAProblemCategoryChooserViewController *)self fullCategoryList];
  id v6 = v5;
  if (v4)
  {
    id v7 = +[NSPredicate predicateWithFormat:@"SELF contains[cd] %@", v10];
    id v8 = [v6 filteredArrayUsingPredicate:v7];
    [(ReportAProblemCategoryChooserViewController *)self setPartialCategoryList:v8];
  }
  else
  {
    id v7 = [v5 copy];
    [(ReportAProblemCategoryChooserViewController *)self setPartialCategoryList:v7];
  }

  id v9 = [(ReportAProblemCategoryChooserViewController *)self tableView];
  [v9 reloadData];
}

- (void)_captureUserAction:(int)a3
{
  if (a3 != 17099)
  {
    uint64_t v4 = *(void *)&a3;
    uint64_t v5 = [(ReportAProblemCategoryChooserViewController *)self analyticTarget];
    +[GEOAPPortal captureUserAction:v4 target:v5 value:0];
  }
}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
}

- (void)macFooterViewBackButtonTapped:(id)a3
{
  id v4 = [(ReportAProblemCategoryChooserViewController *)self navigationController];
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)checkmarkTableViewCell:(id)a3 isSelected:(BOOL)a4
{
  id v8 = a3;
  uint64_t v5 = [v8 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v8 object];
    [(ReportAProblemCategoryChooserViewController *)self _categoryNameSelected:v7];
  }
}

- (RAPCategoryChooserDelegate)chooserDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chooserDelegate);

  return (RAPCategoryChooserDelegate *)WeakRetained;
}

- (void)setChooserDelegate:(id)a3
{
}

- (NSArray)originalCategoryList
{
  return self->_originalCategoryList;
}

- (void)setOriginalCategoryList:(id)a3
{
}

- (NSArray)fullCategoryList
{
  return self->_fullCategoryList;
}

- (void)setFullCategoryList:(id)a3
{
}

- (NSArray)partialCategoryList
{
  return self->_partialCategoryList;
}

- (void)setPartialCategoryList:(id)a3
{
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (UIColor)selectedTextColor
{
  return self->_selectedTextColor;
}

- (void)setSelectedTextColor:(id)a3
{
}

- (NSMutableArray)selectedCategoryNames
{
  return self->_selectedCategoryNames;
}

- (void)setSelectedCategoryNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCategoryNames, 0);
  objc_storeStrong((id *)&self->_selectedTextColor, 0);
  objc_storeStrong((id *)&self->_partialCategoryList, 0);
  objc_storeStrong((id *)&self->_fullCategoryList, 0);
  objc_storeStrong((id *)&self->_originalCategoryList, 0);

  objc_destroyWeak((id *)&self->_chooserDelegate);
}

@end