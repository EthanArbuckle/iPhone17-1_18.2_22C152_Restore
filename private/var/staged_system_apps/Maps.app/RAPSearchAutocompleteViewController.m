@interface RAPSearchAutocompleteViewController
+ (id)addressAutocompleteViewControllerWithInitialSearchString:(id)a3;
+ (id)poiAutocompleteViewControllerWithBoundedMapRegion:(id)a3 excludedMUIDs:(id)a4;
- (BOOL)allowsFreeformResultText;
- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4;
- (GEOMapRegion)boundedMapRegion;
- (NSString)placeholderText;
- (NSString)titleText;
- (RAPSearchAutocompleteDelegate)delegate;
- (RAPSearchAutocompleteViewController)initWithPlaceholderText:(id)a3 initialSearchString:(id)a4 allowsFreeformResultText:(BOOL)a5 resultTypes:(unint64_t)a6 blockFilter:(id)a7;
- (int)entryPoint;
- (void)_cancelTapped;
- (void)_dismissViewController;
- (void)_updateWithInputText:(id)a3;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setAllowsFreeformResultText:(BOOL)a3;
- (void)setBoundedMapRegion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntryPoint:(int)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RAPSearchAutocompleteViewController

+ (id)addressAutocompleteViewControllerWithInitialSearchString:(id)a3
{
  id v3 = a3;
  v4 = [RAPSearchAutocompleteViewController alloc];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Enter an Address [RAP]" value:@"localized string not found" table:0];
  v7 = +[RAPSearchAutocompleteBlockFilter addressAutocompleteFilter];
  v8 = [(RAPSearchAutocompleteViewController *)v4 initWithPlaceholderText:v6 initialSearchString:v3 allowsFreeformResultText:1 resultTypes:1 blockFilter:v7];

  return v8;
}

+ (id)poiAutocompleteViewControllerWithBoundedMapRegion:(id)a3 excludedMUIDs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [RAPSearchAutocompleteViewController alloc];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Enter a Place [RAP]" value:@"localized string not found" table:0];
  v10 = +[RAPSearchAutocompleteBlockFilter poiAutocompleteFilterWithExcludedMUIDs:v5];

  v11 = [(RAPSearchAutocompleteViewController *)v7 initWithPlaceholderText:v9 initialSearchString:0 allowsFreeformResultText:0 resultTypes:2 blockFilter:v10];
  [(RAPSearchAutocompleteViewController *)v11 setBoundedMapRegion:v6];

  return v11;
}

- (RAPSearchAutocompleteViewController)initWithPlaceholderText:(id)a3 initialSearchString:(id)a4 allowsFreeformResultText:(BOOL)a5 resultTypes:(unint64_t)a6 blockFilter:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)RAPSearchAutocompleteViewController;
  v16 = [(RAPSearchAutocompleteViewController *)&v19 initWithNibName:0 bundle:0];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_placeholderText, a3);
    objc_storeStrong((id *)&v17->_currentSearchString, a4);
    v17->_allowsFreeformResultText = a5;
    v17->_resultTypes = a6;
    objc_storeStrong((id *)&v17->_autocompleteFilter, a7);
  }

  return v17;
}

- (void)setTitleText:(id)a3
{
  p_titleText = (id *)&self->_titleText;
  id v8 = a3;
  if ((objc_msgSend(*p_titleText, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    id v6 = *p_titleText;
    v7 = [(RAPSearchAutocompleteViewController *)self navigationItem];
    [v7 setTitle:v6];
  }
}

- (void)viewDidLoad
{
  v46.receiver = self;
  v46.super_class = (Class)RAPSearchAutocompleteViewController;
  [(RAPSearchAutocompleteViewController *)&v46 viewDidLoad];
  id v3 = +[UIColor systemBackgroundColor];
  v4 = [(RAPSearchAutocompleteViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  tableView = self->_tableView;
  self->_tableView = v5;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setKeyboardDismissMode:1];
  [(UITableView *)self->_tableView setRowHeight:UITableViewAutomaticDimension];
  [(UISearchController *)self->_searchController setAccessibilityIdentifier:@"RAPAddressSearchBar"];
  v7 = [(RAPSearchAutocompleteViewController *)self view];
  [v7 addSubview:self->_tableView];

  v44 = [(UITableView *)self->_tableView leadingAnchor];
  v45 = [(RAPSearchAutocompleteViewController *)self view];
  v43 = [v45 leadingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v47[0] = v42;
  v40 = [(UITableView *)self->_tableView trailingAnchor];
  v41 = [(RAPSearchAutocompleteViewController *)self view];
  v39 = [v41 trailingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v47[1] = v38;
  v36 = [(UITableView *)self->_tableView topAnchor];
  v37 = [(RAPSearchAutocompleteViewController *)self view];
  id v8 = [v37 safeAreaLayoutGuide];
  v9 = [v8 topAnchor];
  v10 = [v36 constraintEqualToAnchor:v9];
  v47[2] = v10;
  v11 = [(UITableView *)self->_tableView bottomAnchor];
  v12 = [(RAPSearchAutocompleteViewController *)self view];
  id v13 = [v12 bottomAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13];
  v47[3] = v14;
  id v15 = +[NSArray arrayWithObjects:v47 count:4];
  +[NSLayoutConstraint activateConstraints:v15];

  v16 = [(RAPSearchAutocompleteViewController *)self navigationItem];
  [v16 setHidesSearchBarWhenScrolling:0];

  v17 = [(RAPSearchAutocompleteViewController *)self traitCollection];
  id v18 = [v17 userInterfaceIdiom];

  if (v18 != (id)5)
  {
    objc_super v19 = (UISearchController *)[objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
    [(UISearchController *)v19 setSearchResultsUpdater:self];
    [(UISearchController *)v19 setObscuresBackgroundDuringPresentation:0];
    [(UISearchController *)v19 setHidesNavigationBarDuringPresentation:0];
    v20 = [(RAPSearchAutocompleteViewController *)self placeholderText];
    v21 = [(UISearchController *)v19 searchBar];
    [v21 setPlaceholder:v20];

    [(UISearchController *)v19 setActive:1];
    v22 = [(UISearchController *)v19 searchBar];
    [v22 setReturnKeyType:9];

    v23 = [(UISearchController *)v19 searchBar];
    [v23 setDelegate:self];

    currentSearchString = self->_currentSearchString;
    v25 = [(UISearchController *)v19 searchBar];
    [v25 setText:currentSearchString];

    [(UISearchController *)v19 setAutomaticallyShowsCancelButton:0];
    v26 = [(RAPSearchAutocompleteViewController *)self navigationItem];
    [v26 setSearchController:v19];

    searchController = self->_searchController;
    self->_searchController = v19;
  }
  v28 = [[SearchDataSource alloc] initWithTableView:self->_tableView];
  [(UITableView *)self->_tableView setDelegate:v28];
  [(UITableView *)self->_tableView setDataSource:v28];
  [(SearchDataSource *)v28 setResultTypes:self->_resultTypes];
  [(DataSource *)v28 setDelegate:self];
  dataSource = self->_dataSource;
  self->_dataSource = v28;
  v30 = v28;

  id v31 = objc_alloc((Class)UIBarButtonItem);
  v32 = +[NSBundle mainBundle];
  v33 = [v32 localizedStringForKey:@"RAPCategory_Cancel" value:@"localized string not found" table:0];
  id v34 = [v31 initWithTitle:v33 style:0 target:self action:"_cancelTapped"];

  v35 = [(RAPSearchAutocompleteViewController *)self navigationItem];
  [v35 setRightBarButtonItem:v34];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RAPSearchAutocompleteViewController;
  [(RAPSearchAutocompleteViewController *)&v5 viewDidAppear:a3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A86918;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cancelTapped
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 rapSearchAutocompleteViewControllerDidCancel:self];
  }

  [(RAPSearchAutocompleteViewController *)self _dismissViewController];
}

- (void)_dismissViewController
{
  [(UISearchController *)self->_searchController setActive:0];
  id v3 = [(RAPSearchAutocompleteViewController *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    id v6 = [(RAPSearchAutocompleteViewController *)self navigationController];
    id v5 = [v6 popViewControllerAnimated:1];
  }
  else
  {
    [(RAPSearchAutocompleteViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = +[GEOMapService sharedService];
    v10 = [v9 defaultTraits];

    [v10 setSource:23];
    v11 = +[MKMapService sharedService];
    v12 = [v8 queryLine];
    id v13 = [v8 geoCompletionItem];
    id v14 = [v11 ticketForSearchQuery:v12 completionItem:v13 traits:v10 searchSessionData:0];

    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100A86CEC;
    v15[3] = &unk_1012EBF08;
    v15[4] = self;
    objc_copyWeak(&v16, &location);
    [v14 submitWithHandler:v15 networkActivity:0];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)dataSourceUpdated:(id)a3
{
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  return [(RAPSearchAutocompleteBlockFilter *)self->_autocompleteFilter shouldFilterItem:a4];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v5 = [a3 searchBar];
  id v4 = [v5 text];
  [(RAPSearchAutocompleteViewController *)self _updateWithInputText:v4];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v7 = a3;
  if ([(RAPSearchAutocompleteViewController *)self allowsFreeformResultText])
  {
    id v4 = objc_alloc_init(RAPSearchAutocompleteResult);
    id v5 = [v7 text];
    [(RAPSearchAutocompleteResult *)v4 setSearchBarText:v5];

    [(RAPSearchAutocompleteResult *)v4 setSelectedMapItem:0];
    id v6 = [(RAPSearchAutocompleteViewController *)self delegate];
    [v6 rapSearchAutocompleteViewController:self finishedPickingAutocompleteResult:v4 isAutocompleteResult:0];

    [(RAPSearchAutocompleteViewController *)self _dismissViewController];
  }
  else
  {
    [v7 resignFirstResponder];
  }
}

- (void)_updateWithInputText:(id)a3
{
  id v4 = a3;
  id v5 = +[GEOMapService sharedService];
  id v10 = [v5 defaultTraits];

  id v6 = [(RAPSearchAutocompleteViewController *)self boundedMapRegion];

  if (v6)
  {
    id v7 = [(RAPSearchAutocompleteViewController *)self boundedMapRegion];
    [v10 setMapRegion:v7];
  }
  -[SearchDataSource setActive:](self->_dataSource, "setActive:", [v4 length] != 0);
  if (![(DataSource *)self->_dataSource active]) {
    [(SearchDataSource *)self->_dataSource clearAutocompleteResults];
  }
  currentSearchString = self->_currentSearchString;
  self->_currentSearchString = (NSString *)v4;
  id v9 = v4;

  [(SearchDataSource *)self->_dataSource setInputText:self->_currentSearchString traits:v10 source:11];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (RAPSearchAutocompleteDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPSearchAutocompleteDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (int)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int)a3
{
  self->_entryPoint = a3;
}

- (GEOMapRegion)boundedMapRegion
{
  return self->_boundedMapRegion;
}

- (void)setBoundedMapRegion:(id)a3
{
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (BOOL)allowsFreeformResultText
{
  return self->_allowsFreeformResultText;
}

- (void)setAllowsFreeformResultText:(BOOL)a3
{
  self->_allowsFreeformResultText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_boundedMapRegion, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autocompleteFilter, 0);
  objc_storeStrong((id *)&self->_currentSearchString, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_searchController, 0);
}

@end