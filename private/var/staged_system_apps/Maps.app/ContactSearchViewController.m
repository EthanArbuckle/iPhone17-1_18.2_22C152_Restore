@interface ContactSearchViewController
- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)searchBarShouldEndEditing:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (ContactSearchViewController)initWithInitialContacts:(id)a3 selectionHandler:(id)a4;
- (ContactSearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ContactSearchViewController)initWithShortcutEditSession:(id)a3;
- (NSArray)contactValues;
- (SharedTripSuggestionsDataSource)suggestionDataSource;
- (UITableView)tableView;
- (UIView)titleHeaderView;
- (id)modalHeaderView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelAction:(id)a3;
- (void)_contactValuesSelected:(id)a3;
- (void)_doneAction:(id)a3;
- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4;
- (void)clear;
- (void)dealloc;
- (void)fetchContacts;
- (void)loadContaineeHeaderView;
- (void)performAutocompleteSearch;
- (void)prepopulate;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setContactValues:(id)a3;
- (void)setSuggestionDataSource:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTitleHeaderView:(id)a3;
- (void)suggestionsDataSourceDidUpdateContactsForDisplay:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateCapabilityLevelForCell:(id)a3;
- (void)updateTheme;
- (void)viewDidLoad;
@end

@implementation ContactSearchViewController

- (ContactSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)ContactSearchViewController;
  v4 = [(ContactSearchViewController *)&v18 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(ContaineeViewController *)v4 cardPresentationController];
    [v6 setPresentedModally:1];

    v7 = [(ContaineeViewController *)v5 cardPresentationController];
    [v7 setTakesAvailableHeight:1];

    uint64_t v8 = +[NSMutableDictionary dictionary];
    destinationsToContactValues = v5->_destinationsToContactValues;
    v5->_destinationsToContactValues = (NSMutableDictionary *)v8;

    v10 = +[AddressBookManager sharedManager];
    v11 = [v10 meCard];
    uint64_t v12 = [v11 identifier];
    meCardIdentifier = v5->_meCardIdentifier;
    v5->_meCardIdentifier = (NSString *)v12;

    v14 = [[SharedTripSuggestionsDataSource alloc] initWithSoftCellCap:GEOConfigGetUInteger() includeActiveContacts:0];
    suggestionDataSource = v5->_suggestionDataSource;
    v5->_suggestionDataSource = v14;

    [(SharedTripSuggestionsDataSource *)v5->_suggestionDataSource setDelegate:v5];
    v5->_userInteracted = 0;
    v16 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
    [v16 registerObserver:v5];
  }
  return v5;
}

- (ContactSearchViewController)initWithShortcutEditSession:(id)a3
{
  id v5 = a3;
  v6 = [(ContactSearchViewController *)self initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_shortcutEditSession, a3);
    uint64_t v8 = [(ShortcutEditSession *)v7->_shortcutEditSession contacts];
    initialContactValues = v7->_initialContactValues;
    v7->_initialContactValues = (NSArray *)v8;
  }
  return v7;
}

- (ContactSearchViewController)initWithInitialContacts:(id)a3 selectionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ContactSearchViewController;
  v9 = [(ContactSearchViewController *)&v14 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_initialContactValues, a3);
    id v11 = [v8 copy];
    id selectionHandler = v10->_selectionHandler;
    v10->_id selectionHandler = v11;
  }
  return v10;
}

- (void)dealloc
{
  if (!self->_userInteracted) {
    [(SharedTripSuggestionsDataSource *)self->_suggestionDataSource abandon];
  }
  v3 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ContactSearchViewController;
  [(ContactSearchViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v83.receiver = self;
  v83.super_class = (Class)ContactSearchViewController;
  [(ContaineeViewController *)&v83 viewDidLoad];
  [(ContactSearchViewController *)self loadContaineeHeaderView];
  v3 = [(ContactSearchViewController *)self view];
  [v3 setAccessibilityIdentifier:@"ContactSearchView"];

  objc_super v4 = (UISearchBar *)objc_alloc_init((Class)UISearchBar);
  searchBar = self->_searchBar;
  self->_searchBar = v4;

  [(UISearchBar *)self->_searchBar setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(ContactSearchViewController *)self view];
  [v6 addSubview:self->_searchBar];

  [(UISearchBar *)self->_searchBar setDelegate:self];
  id v7 = +[UIColor clearColor];
  [(UISearchBar *)self->_searchBar setBackgroundColor:v7];

  id v8 = objc_alloc_init((Class)UIImage);
  [(UISearchBar *)self->_searchBar setBackgroundImage:v8];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"[Share ETA] Search" value:@"localized string not found" table:0];
  [(UISearchBar *)self->_searchBar setPlaceholder:v10];

  [(UISearchBar *)self->_searchBar setTranslucent:1];
  [(UISearchBar *)self->_searchBar setOpaque:0];
  [(UISearchBar *)self->_searchBar _setBackdropStyle:2005];
  id v11 = [(UISearchBar *)self->_searchBar searchTextField];
  searchField = self->_searchField;
  self->_searchField = v11;

  [(UITextField *)self->_searchField setAccessibilityIdentifier:@"ContactsSearchField"];
  id v13 = objc_alloc((Class)MKViewWithHairline);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v17 = [v13 initWithFrame:CGRectZero.origin.x, y, width, height];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v17 setTopHairlineHidden:1];
  [v17 setBottomHairlineHidden:0];
  objc_super v18 = [(ContactSearchViewController *)self view];
  [v18 addSubview:v17];

  v19 = +[UIScreen mainScreen];
  [v19 nativeScale];
  double v21 = v20;

  id v22 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v22 setRowHeight:UITableViewAutomaticDimension];
  [v22 setEstimatedRowHeight:76.0];
  v23 = +[UIColor clearColor];
  [v22 setBackgroundColor:v23];

  [v22 setPreservesSuperviewLayoutMargins:1];
  uint64_t v24 = objc_opt_class();
  v25 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v25);
  [v22 registerClass:v24 forCellReuseIdentifier:v26];

  v27 = [(ContactSearchViewController *)self view];
  [v27 addSubview:v22];

  [(ContactSearchViewController *)self setTableView:v22];
  v81 = [(UIView *)self->_titleHeaderView topAnchor];
  v82 = [(ContactSearchViewController *)self view];
  v80 = [v82 topAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v84[0] = v79;
  v77 = [(UIView *)self->_titleHeaderView leadingAnchor];
  v78 = [(ContactSearchViewController *)self view];
  v76 = [v78 leadingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v84[1] = v75;
  v73 = [(UIView *)self->_titleHeaderView trailingAnchor];
  v74 = [(ContactSearchViewController *)self view];
  v72 = [v74 trailingAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v84[2] = v71;
  v70 = [(UIView *)self->_titleHeaderView bottomAnchor];
  v69 = [(UISearchBar *)self->_searchBar topAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v84[3] = v68;
  v66 = [(UISearchBar *)self->_searchBar leadingAnchor];
  v67 = [(ContactSearchViewController *)self view];
  v64 = [v67 leadingAnchor];
  v63 = [v66 constraintEqualToAnchor:v64 constant:4.0];
  v84[4] = v63;
  v61 = [(UISearchBar *)self->_searchBar trailingAnchor];
  v62 = [(ContactSearchViewController *)self view];
  v60 = [v62 trailingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60 constant:-4.0];
  v84[5] = v59;
  v57 = [(UISearchBar *)self->_searchBar bottomAnchor];
  v56 = [v17 topAnchor];
  v55 = [v57 constraintEqualToAnchor:v56 constant:-12.0];
  v84[6] = v55;
  v54 = [v17 heightAnchor];
  v53 = [v54 constraintEqualToConstant:1.0 / v21];
  v84[7] = v53;
  v51 = [v17 leadingAnchor];
  v52 = [(ContactSearchViewController *)self view];
  v50 = [v52 leadingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v84[8] = v49;
  v65 = v17;
  v47 = [v17 trailingAnchor];
  v48 = [(ContactSearchViewController *)self view];
  v46 = [v48 trailingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v84[9] = v45;
  v44 = [v22 topAnchor];
  v43 = [v17 bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v84[10] = v42;
  v40 = [v22 leadingAnchor];
  v41 = [(ContactSearchViewController *)self view];
  v39 = [v41 leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v84[11] = v38;
  v58 = v22;
  v28 = [v22 trailingAnchor];
  v29 = [(ContactSearchViewController *)self view];
  v30 = [v29 trailingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  v84[12] = v31;
  v32 = [v22 bottomAnchor];
  v33 = [(ContactSearchViewController *)self view];
  v34 = [v33 bottomAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  v84[13] = v35;
  v36 = +[NSArray arrayWithObjects:v84 count:14];
  +[NSLayoutConstraint activateConstraints:v36];

  v37 = [(ContactSearchViewController *)self view];
  [v37 layoutIfNeeded];

  [(ContactSearchViewController *)self prepopulate];
  +[KeyboardAvoidingView startObservingKeyboard];
  [(ContactSearchViewController *)self updateTheme];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
}

- (void)suggestionsDataSourceDidUpdateContactsForDisplay:(id)a3
{
  objc_super v4 = [(UITextField *)self->_searchField text];
  id v5 = [v4 length];

  if (!v5)
  {
    [(ContactSearchViewController *)self prepopulate];
  }
}

- (void)updateTheme
{
  v3 = [(ContactSearchViewController *)self theme];
  objc_super v4 = [v3 searchBarPlaceHolderColor];
  id v5 = [(UITextField *)self->_searchField _placeholderLabel];
  [v5 setTextColor:v4];

  v6 = [(ContactSearchViewController *)self theme];
  -[UITextField setKeyboardAppearance:](self->_searchField, "setKeyboardAppearance:", [v6 textFieldKeyboardAppearance]);

  tableView = self->_tableView;
  id v9 = [(ContactSearchViewController *)self theme];
  id v8 = [v9 hairlineColor];
  [(UITableView *)tableView setSeparatorColor:v8];
}

- (id)modalHeaderView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self->_titleHeaderView;
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)loadContaineeHeaderView
{
  v3 = [ModalCardHeaderView alloc];
  objc_super v4 = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  id v5 = [(ModalCardHeaderView *)v3 initWithConfiguration:v4];

  [(UIView *)v5 setUseAdaptiveFont:1];
  [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"[Share ETA] Add Person" value:@"localized string not found" table:0];
  [(UIView *)v5 setTitle:v7];

  id v8 = [(UIView *)v5 leadingButton];
  id v9 = sub_100AEBD5C();
  [v8 setTitle:v9 forState:0];

  v10 = [(UIView *)v5 leadingButton];
  [v10 addTarget:self action:"_cancelAction:" forControlEvents:64];

  id v11 = [(UIView *)v5 trailingButton];
  uint64_t v12 = sub_100AEBDC4();
  [v11 setTitle:v12 forState:0];

  id v13 = [(UIView *)v5 trailingButton];
  [v13 addTarget:self action:"_doneAction:" forControlEvents:64];

  objc_super v14 = [(UIView *)v5 trailingButton];
  [v14 setEnabled:0];

  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v5;
  v16 = v5;

  id v17 = [(ContactSearchViewController *)self view];
  [v17 addSubview:v16];
}

- (void)_cancelAction:(id)a3
{
  id v4 = a3;
  +[GEOAPPortal captureUserAction:4 target:735 value:0];
  [(ContaineeViewController *)self handleDismissAction:v4];
}

- (void)_doneAction:(id)a3
{
  id v4 = a3;
  +[GEOAPPortal captureUserAction:41 target:735 value:0];
  [(ContaineeViewController *)self handleDismissAction:v4];
}

- (void)prepopulate
{
  v3 = [(SharedTripSuggestionsDataSource *)self->_suggestionDataSource contactsForDisplay];
  contactValues = self->_contactValues;
  self->_contactValues = v3;

  tableView = self->_tableView;

  [(UITableView *)tableView reloadData];
}

- (void)clear
{
  contactValues = self->_contactValues;
  self->_contactValues = 0;

  tableView = self->_tableView;

  [(UITableView *)tableView reloadData];
}

- (void)fetchContacts
{
  v3 = self->_initialContactValues;
  id v4 = sub_100099700(v3, &stru_10131A6B8);
  id v5 = +[MSPSharedTripService sharedInstance];
  v6 = [v5 sharingIdentity];
  id v7 = [v6 aliases];

  id v8 = +[AddressBookManager sharedManager];
  id v9 = [v8 contactStore];

  id v10 = objc_alloc((Class)CNContactFetchRequest);
  id v11 = +[AddressBookManager sharedManager];
  uint64_t v12 = [v11 properties];
  id v13 = [v10 initWithKeysToFetch:v12];

  if ([(NSString *)self->_searchQuery length] >= 3) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 3;
  }
  v15 = +[CNContact predicateForContactsMatchingName:self->_searchQuery options:v14];
  [v13 setPredicate:v15];

  [v13 setSortOrder:1];
  id v25 = +[NSMutableArray array];
  id v26 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100BB21B8;
  v22[3] = &unk_101316AC8;
  v22[4] = self;
  id v23 = v7;
  id v24 = v4;
  id v16 = v25;
  id v17 = v4;
  id v18 = v7;
  [v9 enumerateContactsWithFetchRequest:v13 error:&v26 usingBlock:v22];
  id v19 = v26;
  double v20 = (NSArray *)[v16 copy];
  contactValues = self->_contactValues;
  self->_contactValues = v20;

  [(UITableView *)self->_tableView reloadData];
}

- (void)_contactValuesSelected:(id)a3
{
  id v10 = a3;
  id v4 = [(ContactSearchViewController *)self modalHeaderView];
  id v5 = [v4 trailingButton];
  [v5 setEnabled:1];

  shortcutEditSession = self->_shortcutEditSession;
  if (shortcutEditSession)
  {
    [(ShortcutEditSession *)shortcutEditSession addSharing:v10];
  }
  else
  {
    id selectionHandler = self->_selectionHandler;
    if (selectionHandler)
    {
      id v8 = (void (**)(id, id))objc_retainBlock(selectionHandler);
      v8[2](v8, v10);
      id v9 = self->_selectionHandler;
      self->_id selectionHandler = 0;
    }
  }
  [(ContaineeViewController *)self handleDismissAction:0];
}

- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4
{
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(ContactSearchViewController *)self tableView];
  id v7 = [v6 visibleCells];

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v13 = [v12 contactValue];
        uint64_t v14 = [v13 stringValue];
        unsigned int v15 = [v5 containsObject:v14];

        if (v15) {
          [(ContactSearchViewController *)self updateCapabilityLevelForCell:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 contactValue];
    if (v6)
    {
      id v7 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
      id v9 = v6;
      id v8 = +[NSArray arrayWithObjects:&v9 count:1];
      [v7 requestCapabilityLevelsForContacts:v8];
    }
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = v9;
  if (isKindOfClass)
  {
    id v7 = [v9 contactValue];
    if (v7)
    {
      id v8 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
      [v8 cancelCapabilityLevelRequestForContact:v7];
    }
    v6 = v9;
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  self->_userInteracted = 1;
  contactValues = self->_contactValues;
  id v7 = a4;
  id v8 = a3;
  -[NSArray objectAtIndexedSubscript:](contactValues, "objectAtIndexedSubscript:", [v7 row]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(ContactSearchViewController *)self _contactValuesSelected:v9];
  [v8 deselectRowAtIndexPath:v7 animated:1];

  +[GEOAPPortal captureUserAction:9025 target:735 value:0];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_contactValues count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  tableView = self->_tableView;
  id v6 = a4;
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = [(UITableView *)tableView dequeueReusableCellWithIdentifier:v8];

  contactValues = self->_contactValues;
  id v11 = [v6 row];

  uint64_t v12 = [(NSArray *)contactValues objectAtIndexedSubscript:v11];
  id v13 = [v12 contact];
  uint64_t v14 = +[CNContactFormatter stringFromContact:v13 style:0];
  unsigned int v15 = [v9 contactNameLabel];
  [v15 setText:v14];

  long long v16 = [v12 labeledValue];
  long long v17 = [v16 label];
  long long v18 = +[CNLabeledValue localizedStringForLabel:v17];

  if ([v18 length])
  {
    long long v19 = [v12 stringValue];
    double v20 = +[NSString stringWithFormat:@"%@ %@", v18, v19];
    [v9 setContactHandle:v20];
  }
  else
  {
    long long v19 = [v12 stringValue];
    [v9 setContactHandle:v19];
  }

  [v9 setContactValue:v12];
  [(ContactSearchViewController *)self updateCapabilityLevelForCell:v9];

  return v9;
}

- (void)updateCapabilityLevelForCell:(id)a3
{
  id v3 = a3;
  id v4 = +[MSPSharedTripService sharedInstance];
  id v5 = [v3 contactValue];
  id v16 = 0;
  id v6 = [v4 capabilityTypeForContact:v5 serviceName:&v16 isActiveReceiver:0];
  id v7 = v16;

  switch((unint64_t)v6)
  {
    case 0uLL:
    case 1uLL:
      id v8 = +[UIColor secondaryLabelColor];
      [v3 setCapabilityColor:v8];

      [v3 setUserInteractionEnabled:0];
      break;
    case 2uLL:
      id v9 = +[UIColor systemGreenColor];
      [v3 setCapabilityColor:v9];

      [v3 setUserInteractionEnabled:1];
      uint64_t v10 = sub_100ACAE20();
      [v3 setContactCapability:v10];
      goto LABEL_7;
    case 3uLL:
      id v11 = +[UIColor systemBlueColor];
      [v3 setCapabilityColor:v11];

      [v3 setUserInteractionEnabled:1];
      uint64_t v12 = +[NSBundle mainBundle];
      uint64_t v10 = v12;
      CFStringRef v13 = @"share eta contact search iMessage";
      goto LABEL_6;
    case 4uLL:
      uint64_t v14 = +[UIColor systemBlueColor];
      [v3 setCapabilityColor:v14];

      [v3 setUserInteractionEnabled:1];
      uint64_t v12 = +[NSBundle mainBundle];
      uint64_t v10 = v12;
      CFStringRef v13 = @"share eta contact search Maps";
LABEL_6:
      unsigned int v15 = [v12 localizedStringForKey:v13 value:@"localized string not found" table:0];
      [v3 setContactCapability:v15];

LABEL_7:
      break;
    default:
      break;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ContactSearchViewController;
  [(ContaineeViewController *)&v5 scrollViewDidScroll:a3];
  id v4 = [(ContactSearchViewController *)self view];
  [v4 endEditing:1];
}

- (void)performAutocompleteSearch
{
  id v3 = [(UISearchBar *)self->_searchBar text];
  id v4 = v3;
  if (v3 != self->_searchQuery)
  {
    id v8 = v3;
    unsigned __int8 v5 = -[NSString isEqualToString:](v3, "isEqualToString:");
    id v4 = v8;
    if ((v5 & 1) == 0)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      searchQuerdouble y = self->_searchQuery;
      self->_searchQuerdouble y = v6;

      [(ContactSearchViewController *)self fetchContacts];
      id v4 = v8;
    }
  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  return 1;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSTimer *)self->_autocompleteDelayTimer invalidate];
  if ([v7 length])
  {
    [(ContactSearchViewController *)self clear];
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100BB2FA8;
    v10[3] = &unk_1012E73C8;
    objc_copyWeak(&v11, &location);
    id v8 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v10 block:0.5];
    autocompleteDelayTimer = self->_autocompleteDelayTimer;
    self->_autocompleteDelayTimer = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(ContactSearchViewController *)self prepopulate];
  }
}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return 1;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (SharedTripSuggestionsDataSource)suggestionDataSource
{
  return self->_suggestionDataSource;
}

- (void)setSuggestionDataSource:(id)a3
{
}

- (NSArray)contactValues
{
  return self->_contactValues;
}

- (void)setContactValues:(id)a3
{
}

- (UIView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
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
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_suggestionDataSource, 0);
  objc_storeStrong((id *)&self->_meCardIdentifier, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_contactValues, 0);
  objc_storeStrong((id *)&self->_initialContactValues, 0);
  objc_storeStrong((id *)&self->_destinationsToContactValues, 0);
  objc_storeStrong((id *)&self->_autocompleteDelayTimer, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_searchField, 0);

  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end