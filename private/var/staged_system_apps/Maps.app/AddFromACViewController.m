@interface AddFromACViewController
- (AddFromACViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)searchBarShouldEndEditing:(id)a3;
- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4;
- (BOOL)showsRecents;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)headerTitle;
- (UITableView)tableView;
- (id)emptyStateDataSource;
- (id)recentlyViewedDataSource;
- (id)searchDataSource;
- (id)suggestionsDataSource;
- (int)requestSource;
- (int64_t)accessoryTypeToShow;
- (int64_t)shortcutType;
- (void)_enableTextFieldNotification:(BOOL)a3;
- (void)_handleItem:(id)a3;
- (void)_setPlaceHolder;
- (void)_textFieldDidChange:(id)a3;
- (void)_updateHeaderHairline;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)didBecomeCurrent;
- (void)didResignCurrent;
- (void)macFooterViewRightButtonTapped:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchDataSource:(id)a3 addItem:(id)a4;
- (void)setInputText:(id)a3;
- (void)setTableView:(id)a3;
- (void)updateDataSource;
- (void)updateTheme;
- (void)viewDidLoad;
@end

@implementation AddFromACViewController

- (NSString)headerTitle
{
  return (NSString *)&stru_101324E70;
}

- (int)requestSource
{
  return 7;
}

- (int64_t)shortcutType
{
  return 0;
}

- (AddFromACViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AddFromACViewController;
  v4 = [(AddFromACViewController *)&v9 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(ContaineeViewController *)v4 cardPresentationController];
    [v6 setPresentedModally:1];

    v7 = [(ContaineeViewController *)v5 cardPresentationController];
    [v7 setTakesAvailableHeight:1];

    [(ContaineeViewController *)v5 setPreferredPresentationStyle:6];
    -[AddFromACViewController setPreferredContentSize:](v5, "setPreferredContentSize:", 341.0, 500.0);
  }
  return v5;
}

- (void)viewDidLoad
{
  v84.receiver = self;
  v84.super_class = (Class)AddFromACViewController;
  [(ContaineeViewController *)&v84 viewDidLoad];
  [(AddFromACViewController *)self setAccessibilityIdentifier:@"AddFromACView"];
  v3 = [(ContaineeViewController *)self headerView];
  v83 = [(ContaineeViewController *)self contentView];
  v4 = [ModalCardHeaderView alloc];
  v5 = +[ModalCardHeaderConfiguration leadingAlignedTitleModalCardHeaderConfiguration];
  v6 = [(ModalCardHeaderView *)v4 initWithConfiguration:v5];

  [(ModalCardHeaderView *)v6 setUseAdaptiveFont:1];
  [(ModalCardHeaderView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [(AddFromACViewController *)self headerTitle];
  [(ModalCardHeaderView *)v6 setTitle:v7];

  v8 = [(ModalCardHeaderView *)v6 bottomHairline];
  [v8 setHidden:1];

  if (sub_1000BBB44(self) != 5)
  {
    objc_super v9 = [(ModalCardHeaderView *)v6 trailingButton];
    v10 = sub_100AEBDC4();
    [v9 setTitle:v10 forState:0];

    v11 = [(ModalCardHeaderView *)v6 trailingButton];
    [v11 addTarget:self action:"headerViewButtonTapped:buttonType:" forControlEvents:64];
  }
  objc_storeStrong((id *)&self->_modalHeaderView, v6);
  v12 = objc_alloc_init(PassthruSearchBar);
  [(PassthruSearchBar *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v12];
  [(PassthruSearchBar *)v12 setDelegate:self];
  [(PassthruSearchBar *)v12 setTextFieldDelegate:self];
  objc_storeStrong((id *)&self->_searchBar, v12);
  v13 = [(PassthruSearchBar *)v12 searchTextField];
  [v13 setReturnKeyType:6];
  v80 = v13;
  objc_storeStrong((id *)&self->_searchField, v13);
  [v3 addSubview:v6];
  v82 = v12;
  v14 = [(PassthruSearchBar *)v12 _maps_addHairlineAtBottomWithMargin:0.0];
  headerHairline = self->_headerHairline;
  self->_headerHairline = v14;

  [(HairlineView *)self->_headerHairline setAlpha:0.0];
  id v16 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v16 setAccessibilityIdentifier:@"AddFromACTableView"];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = +[UIColor clearColor];
  [v16 setBackgroundColor:v17];

  [v16 _setHeaderAndFooterViewsFloat:0];
  [v16 setPreservesSuperviewLayoutMargins:1];
  [v16 setSectionHeaderTopPadding:0.0];
  [v83 addSubview:v16];
  [(AddFromACViewController *)self setTableView:v16];
  v81 = v16;
  if (sub_1000BBB44(self) == 5)
  {
    v18 = [[MacFooterView alloc] initWithRightButtonType:8];
    footerView = self->_footerView;
    self->_footerView = v18;

    [(MacFooterView *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MacFooterView *)self->_footerView setRightButtonEnabled:1];
    [(MacFooterView *)self->_footerView setDelegate:self];
    v20 = [(ContaineeViewController *)self contentView];
    [v20 addSubview:self->_footerView];

    v69 = [(MacFooterView *)self->_footerView bottomAnchor];
    v74 = [(AddFromACViewController *)self view];
    v78 = [v74 bottomAnchor];
    v76 = [v69 constraintEqualToAnchor:];
    v87[0] = v76;
    v62 = [(MacFooterView *)self->_footerView leadingAnchor];
    v56 = [(AddFromACViewController *)self view];
    uint64_t v59 = [v56 leadingAnchor];
    v71 = [v62 constraintEqualToAnchor:v59];
    v87[1] = v71;
    v64 = [(MacFooterView *)self->_footerView trailingAnchor];
    v67 = [(AddFromACViewController *)self view];
    v57 = [v67 trailingAnchor];
    v54 = [v64 constraintEqualToAnchor:v57];
    v87[2] = v54;
    v52 = [v16 leadingAnchor];
    v21 = [v83 leadingAnchor];
    v22 = [v52 constraintEqualToAnchor:v21 constant:10.0];
    v87[3] = v22;
    v23 = [v16 bottomAnchor];
    v24 = [(MacFooterView *)self->_footerView topAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v87[4] = v25;
    +[NSArray arrayWithObjects:v87 count:5];
    v27 = v26 = v3;
    +[NSLayoutConstraint activateConstraints:v27];

    v3 = v26;
    v28 = v56;

    v29 = v69;
    v30 = (void *)v59;
    v31 = v62;

    id v16 = v81;
    v32 = v74;
  }
  else
  {
    v29 = [v16 leadingAnchor];
    v32 = [v83 leadingAnchor];
    v78 = [v29 constraintEqualToAnchor:v32];
    v86[0] = v78;
    v33 = [v16 bottomAnchor];
    v31 = [v83 bottomAnchor];
    v76 = v33;
    v28 = [v33 constraintEqualToAnchor:v31];
    v86[1] = v28;
    v30 = +[NSArray arrayWithObjects:v86 count:2];
    +[NSLayoutConstraint activateConstraints:v30];
  }
  v61 = v6;
  v66 = v3;

  v79 = [(ModalCardHeaderView *)v6 topAnchor];
  v77 = [v3 topAnchor];
  v75 = [v79 constraintEqualToAnchor:v77];
  v85[0] = v75;
  v73 = [(ModalCardHeaderView *)v6 leadingAnchor];
  v72 = [v3 leadingAnchor];
  v70 = [v73 constraintEqualToAnchor:v72];
  v85[1] = v70;
  v68 = [(ModalCardHeaderView *)v6 trailingAnchor];
  v65 = [v3 trailingAnchor];
  v63 = [v68 constraintEqualToAnchor:v65];
  v85[2] = v63;
  v60 = [(ModalCardHeaderView *)v6 bottomAnchor];
  v58 = [(PassthruSearchBar *)v82 topAnchor];
  v55 = [v60 constraintEqualToAnchor:v58 constant:10.0];
  v85[3] = v55;
  v53 = [(PassthruSearchBar *)v82 leadingAnchor];
  v51 = [v3 leadingAnchor];
  v50 = [v53 constraintEqualToAnchor:v51];
  v85[4] = v50;
  v49 = [(PassthruSearchBar *)v82 trailingAnchor];
  v48 = [v3 trailingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v85[5] = v47;
  v46 = [(PassthruSearchBar *)v82 bottomAnchor];
  v34 = [v3 bottomAnchor];
  v35 = [v46 constraintEqualToAnchor:v34];
  v85[6] = v35;
  v36 = [v16 topAnchor];
  v37 = [v83 topAnchor];
  uint64_t v38 = [v36 constraintEqualToAnchor:v37];
  v39 = v16;
  v40 = (void *)v38;
  v85[7] = v38;
  v41 = [v39 trailingAnchor];
  v42 = [v83 trailingAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  v85[8] = v43;
  v44 = +[NSArray arrayWithObjects:v85 count:9];
  +[NSLayoutConstraint activateConstraints:v44];

  v45 = [(AddFromACViewController *)self view];
  [v45 layoutIfNeeded];

  +[KeyboardAvoidingView startObservingKeyboard];
  [(AddFromACViewController *)self updateTheme];
  [(AddFromACViewController *)self updateDataSource];
  [(AddFromACViewController *)self _setPlaceHolder];
}

- (void)didBecomeCurrent
{
  v3.receiver = self;
  v3.super_class = (Class)AddFromACViewController;
  [(ContaineeViewController *)&v3 didBecomeCurrent];
  [(UITextField *)self->_searchField becomeFirstResponder];
  [(AddFromACViewController *)self _enableTextFieldNotification:1];
  if (+[LibraryUIUtilities isMyPlacesEnabled]) {
    [(AddFromACViewController *)self updateDataSource];
  }
}

- (void)didResignCurrent
{
  [(AddFromACViewController *)self _enableTextFieldNotification:0];
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    currentDataSource = self->_currentDataSource;
    self->_currentDataSource = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AddFromACViewController;
  [(ContaineeViewController *)&v4 didResignCurrent];
}

- (void)_setPlaceHolder
{
  if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
  {
    objc_super v3 = +[NSLocale preferredLanguages];
    objc_super v4 = [v3 firstObject];
    id v11 = +[NSString stringWithFormat:@"%@-%@", @"__internal__searchBarPlaceholderV2", v4];

    v5 = +[NSUserDefaults standardUserDefaults];
    v6 = [v5 objectForKey:v11];

    searchField = self->_searchField;
    if (v6)
    {
      [(UITextField *)self->_searchField setPlaceholder:v6];
    }
    else
    {
      v8 = +[NSBundle mainBundle];
      objc_super v9 = [v8 localizedStringForKey:@"Search for a place or address" value:@"localized string not found" table:0];
      [(UITextField *)searchField setPlaceholder:v9];
    }
    v10 = [(UITextField *)self->_searchField _placeholderLabel];
    [v10 setAllowsDefaultTighteningForTruncation:1];
  }
}

- (void)updateTheme
{
  objc_super v3 = [(AddFromACViewController *)self theme];
  objc_super v4 = [v3 searchBarPlaceHolderColor];
  v5 = [(UITextField *)self->_searchField _placeholderLabel];
  [v5 setTextColor:v4];

  v6 = [(AddFromACViewController *)self theme];
  -[UITextField setKeyboardAppearance:](self->_searchField, "setKeyboardAppearance:", [v6 textFieldKeyboardAppearance]);

  tableView = self->_tableView;
  id v9 = [(AddFromACViewController *)self theme];
  v8 = [v9 hairlineColor];
  [(UITableView *)tableView setSeparatorColor:v8];
}

- (id)suggestionsDataSource
{
  suggestionsDataSource = self->_suggestionsDataSource;
  if (!suggestionsDataSource)
  {
    objc_super v4 = [ShortcutSuggestionsDataSource alloc];
    v5 = [(AddFromACViewController *)self tableView];
    v6 = [(ShortcutSuggestionsDataSource *)v4 initWithTableView:v5 updateLocation:0 shortcutType:[(AddFromACViewController *)self shortcutType]];

    [(DataSource *)v6 setDelegate:self];
    v7 = self->_suggestionsDataSource;
    self->_suggestionsDataSource = v6;

    suggestionsDataSource = self->_suggestionsDataSource;
  }

  return suggestionsDataSource;
}

- (id)recentlyViewedDataSource
{
  recentlyViewedDataSource = self->_recentlyViewedDataSource;
  if (!recentlyViewedDataSource)
  {
    objc_super v4 = [RecentlyViewedDataSource alloc];
    v5 = [(AddFromACViewController *)self tableView];
    v6 = [(RecentlyViewedDataSource *)v4 initWithTableView:v5 updateLocation:0];

    [(DataSource *)v6 setDelegate:self];
    [(RecentlyViewedDataSource *)v6 setShowAddAccessory:1];
    v7 = self->_recentlyViewedDataSource;
    self->_recentlyViewedDataSource = v6;

    recentlyViewedDataSource = self->_recentlyViewedDataSource;
  }

  return recentlyViewedDataSource;
}

- (id)searchDataSource
{
  searchDataSource = self->_searchDataSource;
  if (!searchDataSource)
  {
    objc_super v4 = [SearchDataSource alloc];
    v5 = [(AddFromACViewController *)self tableView];
    v6 = [(SearchDataSource *)v4 initWithTableView:v5];

    [(DataSource *)v6 setDelegate:self];
    [(SearchDataSource *)v6 setShowAddAccessory:1];
    [(SearchDataSource *)v6 setAccessoryType:[(AddFromACViewController *)self accessoryTypeToShow]];
    v7 = [(SearchDataSource *)v6 searchDataProvider];
    [v7 setResultTypes:3];

    v8 = self->_searchDataSource;
    self->_searchDataSource = v6;

    searchDataSource = self->_searchDataSource;
  }

  return searchDataSource;
}

- (id)emptyStateDataSource
{
  if ([(AddFromACViewController *)self showsRecents]) {
    [(AddFromACViewController *)self recentlyViewedDataSource];
  }
  else {
  objc_super v3 = [(AddFromACViewController *)self suggestionsDataSource];
  }

  return v3;
}

- (BOOL)showsRecents
{
  return 1;
}

- (int64_t)accessoryTypeToShow
{
  return 1;
}

- (void)updateDataSource
{
  objc_super v3 = [(UITextField *)self->_searchField text];
  if ([v3 length]) {
    [(AddFromACViewController *)self searchDataSource];
  }
  else {
  obj = [(AddFromACViewController *)self emptyStateDataSource];
  }

  currentDataSource = self->_currentDataSource;
  if (currentDataSource != obj)
  {
    [currentDataSource setActive:0];
    objc_storeStrong((id *)&self->_currentDataSource, obj);
    v5 = [(AddFromACViewController *)self tableView];
    [v5 setDataSource:obj];

    v6 = [(AddFromACViewController *)self tableView];
    [v6 setDelegate:obj];

    [(DataSource *)obj setActive:1];
  }
}

- (void)_enableTextFieldNotification:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  id v6 = v5;
  if (v3) {
    [v5 addObserver:self selector:"_textFieldDidChange:" name:UITextFieldTextDidChangeNotification object:self->_searchField];
  }
  else {
    [v5 removeObserver:self name:UITextFieldTextDidChangeNotification object:self->_searchField];
  }
}

- (void)_updateHeaderHairline
{
  id v5 = [(AddFromACViewController *)self tableView];
  unsigned int v3 = [v5 _maps_shouldShowTopHairline];
  double v4 = 0.0;
  if (v3) {
    double v4 = 1.0;
  }
  [(HairlineView *)self->_headerHairline setAlpha:v4];
}

- (void)_handleItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(ControlContaineeViewController *)self delegate];
    if (v6)
    {
      v7 = [(ControlContaineeViewController *)self delegate];
      id v8 = [v7 newTraits];
    }
    else
    {
      v7 = +[MKMapService sharedService];
      id v8 = [v7 defaultTraits];
    }
    id v9 = v8;

    [v9 setSource:[self requestSource]];
    v10 = +[MKMapService sharedService];
    id v11 = [v5 queryLine];
    v12 = [v5 geoCompletionItem];

    v13 = [v10 ticketForSearchQuery:v11 completionItem:v12 traits:v9 searchSessionData:0];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1004CAE14;
    v14[3] = &unk_1012E7610;
    v14[4] = self;
    [v13 submitWithHandler:v14 networkActivity:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AddFromACViewController *)self saveMapItem:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
        [(AddFromACViewController *)self saveShortcut:v4];
      }
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AddFromACViewController;
  [(ContaineeViewController *)&v4 scrollViewDidScroll:a3];
  [(AddFromACViewController *)self _updateHeaderHairline];
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
}

- (void)searchDataSource:(id)a3 addItem:(id)a4
{
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_currentDataSource == a3)
  {
    [(UITableView *)self->_tableView reloadData];
    [(AddFromACViewController *)self _updateHeaderHairline];
  }
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  id v5 = v4;
  id v6 = [v5 mapItem];
  unsigned __int8 v7 = [v6 _hasHikeInfo];

  if ((v7 & 1) == 0 && [v5 _type] != (id)2)
  {
    id v8 = [v5 _type];

    if (v8 == (id)1)
    {
      unsigned __int8 v7 = 0;
      goto LABEL_8;
    }
LABEL_7:
    unsigned __int8 v7 = 1;
    goto LABEL_8;
  }

LABEL_8:
  return v7;
}

- (void)setInputText:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = v4;
  if (self->_inputText != v4)
  {
    v12 = v4;
    unsigned __int8 v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    id v5 = v12;
    if ((v6 & 1) == 0)
    {
      unsigned __int8 v7 = (NSString *)[(NSString *)v12 copy];
      inputText = self->_inputText;
      self->_inputText = v7;

      id v9 = [(ControlContaineeViewController *)self delegate];
      id v10 = [v9 newTraits];

      id v11 = [(AddFromACViewController *)self searchDataSource];
      [v11 setInputText:self->_inputText traits:v10 source:11];

      id v5 = v12;
    }
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return 1;
}

- (void)searchBarCancelButtonClicked:(id)a3
{
}

- (void)_textFieldDidChange:(id)a3
{
  id v4 = [(UITextField *)self->_searchField text];
  [(AddFromACViewController *)self setInputText:v4];

  [(AddFromACViewController *)self updateDataSource];
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerHairline, 0);
  objc_storeStrong((id *)&self->_suggestionsDataSource, 0);
  objc_storeStrong((id *)&self->_recentlyViewedDataSource, 0);
  objc_storeStrong((id *)&self->_searchDataSource, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);

  objc_storeStrong((id *)&self->_inputText, 0);
}

@end