@interface CarSearchCategoriesCardViewController
- (BOOL)_isMapsOffline;
- (BOOL)supportFullTextSearch;
- (CarSearchCategoriesCardViewController)initWithCategories:(id)a3 delegate:(id)a4;
- (CarSearchCategoriesCardViewControllerDelegate)delegate;
- (CarTableView)tableView;
- (NSArray)categories;
- (NSArray)focusOrderSubItems;
- (UIScrollView)pptTestScrollView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_offlineSettingChangeHandler;
- (void)_ppt_selectFirstCarplayBrowseCategory;
- (void)checkFullTextSearchSupport;
- (void)dealloc;
- (void)setCategories:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSupportFullTextSearch:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)userInputCell:(id)a3 didSelectAction:(unint64_t)a4 usingInteractionModel:(unint64_t)a5;
- (void)viewDidLoad;
@end

@implementation CarSearchCategoriesCardViewController

- (CarSearchCategoriesCardViewController)initWithCategories:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CarSearchCategoriesCardViewController;
  v9 = [(CarSearchCategoriesCardViewController *)&v15 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_categories, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.Maps.search.offline.placeholder", v11);
    offlinePlaceholderQueue = v10->_offlinePlaceholderQueue;
    v10->_offlinePlaceholderQueue = (OS_dispatch_queue *)v12;
  }
  return v10;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CarSearchCategoriesCardViewController;
  [(CarSearchCategoriesCardViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)CarSearchCategoriesCardViewController;
  [(CarSearchCategoriesCardViewController *)&v14 viewDidLoad];
  v3 = [(CarSearchCategoriesCardViewController *)self view];
  [v3 setAccessibilityIdentifier:@"CarSearchCard"];

  objc_super v4 = objc_alloc_init(CarTableView);
  tableView = self->_tableView;
  self->_tableView = v4;

  [(CarTableView *)self->_tableView setAccessibilityIdentifier:@"CarSearchCardTableView"];
  [(CarTableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1148846080;
  [(CarTableView *)self->_tableView setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [(CarTableView *)self->_tableView setContentCompressionResistancePriority:1 forAxis:v7];
  [(CarTableView *)self->_tableView setDataSource:self];
  [(CarTableView *)self->_tableView setDelegate:self];
  id v8 = +[UIColor clearColor];
  [(CarTableView *)self->_tableView setBackgroundColor:v8];

  [(CarTableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"SearchCategoryCellReuseIdentifier"];
  [(CarTableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"UserInputCellReuseIdentifier"];
  v9 = [(CarSearchCategoriesCardViewController *)self view];
  [v9 addSubview:self->_tableView];

  v10 = self->_tableView;
  v11 = [(CarSearchCategoriesCardViewController *)self view];
  dispatch_queue_t v12 = [(CarTableView *)v10 _maps_constraintsForCenteringInView:v11];
  +[NSLayoutConstraint activateConstraints:v12];

  [(CarSearchCategoriesCardViewController *)self checkFullTextSearchSupport];
  v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_offlineSettingChangeHandler" name:@"UsingOfflineMapsStateChangedNotification" object:0];
}

- (void)setCategories:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_categories != v5)
  {
    double v6 = sub_100015DB4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)&self->_categories, a3);
      tableView = self->_tableView;
      objc_super v15 = +[NSIndexSet indexSetWithIndex:1];
      [(CarTableView *)tableView reloadSections:v15 withRowAnimation:100];

      goto LABEL_10;
    }
    double v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      v10 = [(CarSearchCategoriesCardViewController *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        dispatch_queue_t v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    dispatch_queue_t v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

    NSUInteger v13 = [(NSArray *)self->_categories count];
    *(_DWORD *)buf = 138543874;
    v17 = v12;
    __int16 v18 = 2048;
    NSUInteger v19 = v13;
    __int16 v20 = 2048;
    NSUInteger v21 = [(NSArray *)v5 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] CarSearchCategoriesCardVC didUpdate categories, previously: %ld, now: %ld", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = [a4 section:a3];
  if (v5 == (id)1) {
    return 44.0;
  }
  double v6 = 0.0;
  if (!v5
    && (![(CarSearchCategoriesCardViewController *)self _isMapsOffline] || self->_supportFullTextSearch))
  {
    return 44.0;
  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v8 = [(CarSearchCategoriesCardViewController *)self categories];
    int64_t supportFullTextSearch = (int64_t)[v8 count];
  }
  else if (a4)
  {
    int64_t supportFullTextSearch = 0;
  }
  else if ([(CarSearchCategoriesCardViewController *)self _isMapsOffline])
  {
    int64_t supportFullTextSearch = self->_supportFullTextSearch;
  }
  else
  {
    int64_t supportFullTextSearch = 1;
  }

  return supportFullTextSearch;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)1)
  {
    v9 = [v6 dequeueReusableCellWithIdentifier:@"SearchCategoryCellReuseIdentifier" forIndexPath:v7];
    v10 = [(CarSearchCategoriesCardViewController *)self categories];
    v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

    [v9 setupWithBrowseCategory:v11];
    goto LABEL_16;
  }
  if (!v8)
  {
    v9 = [v6 dequeueReusableCellWithIdentifier:@"UserInputCellReuseIdentifier" forIndexPath:v7];
    [v9 setDelegate:self];
    [v9 setSelectionStyle:0];
    goto LABEL_16;
  }
  dispatch_queue_t v12 = sub_100015DB4();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    NSUInteger v13 = self;
    if (!v13)
    {
      __int16 v18 = @"<nil>";
      goto LABEL_14;
    }
    objc_super v14 = (objc_class *)objc_opt_class();
    objc_super v15 = NSStringFromClass(v14);
    if (objc_opt_respondsToSelector())
    {
      v16 = [(CarSearchCategoriesCardViewController *)v13 performSelector:"accessibilityIdentifier"];
      v17 = v16;
      if (v16 && ![v16 isEqualToString:v15])
      {
        __int16 v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

        goto LABEL_12;
      }
    }
    __int16 v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
LABEL_12:

LABEL_14:
    *(_DWORD *)buf = 138543362;
    NSUInteger v21 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}@] CarSearchCategoriesCardViewController tried to dequeue a cell for invalid section.", buf, 0xCu);
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a4;
  [a3 deselectRowAtIndexPath:v9 animated:1];
  if ([v9 section] == (id)1)
  {
    id v6 = [(CarSearchCategoriesCardViewController *)self delegate];
    id v7 = [(CarSearchCategoriesCardViewController *)self categories];
    id v8 = [v7 objectAtIndexedSubscript:[v9 row]];
    [v6 searchCategoriesCard:self didSelectCategory:v8];
  }
}

- (void)userInputCell:(id)a3 didSelectAction:(unint64_t)a4 usingInteractionModel:(unint64_t)a5
{
  id v8 = a3;
  if (a4 == 1)
  {
    id v10 = v8;
    id v9 = [(CarSearchCategoriesCardViewController *)self delegate];
    [v9 searchCategoriesCardDidSelectKeyboardSearch:self usingInteractionModel:a5];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v10 = v8;
    id v9 = [(CarSearchCategoriesCardViewController *)self delegate];
    [v9 searchCategoriesCardDidSelectSiriSearch:self usingInteractionModel:a5];
  }

  id v8 = v10;
LABEL_6:
}

- (NSArray)focusOrderSubItems
{
  if ([(CarSearchCategoriesCardViewController *)self isViewLoaded])
  {
    v3 = [(CarSearchCategoriesCardViewController *)self tableView];
    objc_super v4 = [v3 _car_visibleCells];

    id v5 = [v4 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [v4 firstObject];
      id v8 = [v7 focusOrderSubItems];
      id v9 = [v4 _maps_subarrayFromIndex:1];
      id v10 = [v8 arrayByAddingObjectsFromArray:v9];
    }
    else
    {
      id v10 = [v4 copy];
    }
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }

  return (NSArray *)v10;
}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void)_ppt_selectFirstCarplayBrowseCategory
{
  id v6 = [(CarSearchCategoriesCardViewController *)self categories];
  if ([v6 count])
  {
    v3 = [(CarSearchCategoriesCardViewController *)self delegate];

    if (!v3) {
      return;
    }
    id v6 = [(CarSearchCategoriesCardViewController *)self delegate];
    objc_super v4 = [(CarSearchCategoriesCardViewController *)self categories];
    id v5 = [v4 firstObject];
    [v6 searchCategoriesCard:self didSelectCategory:v5];
  }
}

- (BOOL)_isMapsOffline
{
  v2 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v3 = [v2 isUsingOfflineMaps];

  return v3;
}

- (void)_offlineSettingChangeHandler
{
  unsigned __int8 v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v4 = [v3 isUsingOfflineMaps];

  if (v4)
  {
    [(CarSearchCategoriesCardViewController *)self checkFullTextSearchSupport];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained updateCardViewTitle:1];

    id v6 = [objc_alloc((Class)NSIndexSet) initWithIndex:0];
    [(CarTableView *)self->_tableView reloadSections:v6 withRowAnimation:100];
  }
}

- (void)checkFullTextSearchSupport
{
  objc_initWeak(&location, self);
  offlinePlaceholderQueue = self->_offlinePlaceholderQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C710B0;
  v4[3] = &unk_1012E6708;
  objc_copyWeak(&v5, &location);
  dispatch_async(offlinePlaceholderQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)supportFullTextSearch
{
  return self->_supportFullTextSearch;
}

- (void)setSupportFullTextSearch:(BOOL)a3
{
  self->_int64_t supportFullTextSearch = a3;
}

- (CarSearchCategoriesCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarSearchCategoriesCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (CarTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_offlinePlaceholderQueue, 0);
}

@end