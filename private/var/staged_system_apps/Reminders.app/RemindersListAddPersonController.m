@interface RemindersListAddPersonController
+ (id)composeLabel;
+ (id)titleString;
- (BOOL)allowPhoneNumbers;
- (NSString)searchAccountID;
- (RemindersContactEditorDelegate)delegate;
- (RemindersListAddPersonController)initWithAllowsPhoneNumbers:(BOOL)a3;
- (double)_maxScrollerHeight;
- (id)_searchManager;
- (id)_searchResultsView;
- (id)_shadowView;
- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4;
- (id)recipientFromContact:(id)a3;
- (id)recipients;
- (int64_t)_interfaceIdiomToUse;
- (void)_hideSearchFieldAndCancelOutstandingSearches:(BOOL)a3;
- (void)_showSearchField;
- (void)addContact:(id)a3;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)commit;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)finishedSearchingForAutocompleteResults;
- (void)finishedTaskWithID:(id)a3;
- (void)loadView;
- (void)searchWithText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchAccountID:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation RemindersListAddPersonController

- (RemindersListAddPersonController)initWithAllowsPhoneNumbers:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)RemindersListAddPersonController;
  v4 = [(RemindersListAddPersonController *)&v13 init];
  if (v4)
  {
    v5 = [(id)objc_opt_class() titleString];
    v6 = [(RemindersListAddPersonController *)v4 navigationItem];
    [v6 setTitle:v5];

    v7 = [objc_alloc((Class)CNComposeRecipientTextView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    composeView = v4->_composeView;
    v4->_composeView = v7;

    v9 = +[NSArray array];
    [(CNComposeRecipientTextView *)v4->_composeView setAddresses:v9];

    v10 = (CNAutocompleteResultsTableViewController *)objc_alloc_init((Class)CNAutocompleteResultsTableViewController);
    searchResultsViewController = v4->_searchResultsViewController;
    v4->_searchResultsViewController = v10;

    [(CNAutocompleteResultsTableViewController *)v4->_searchResultsViewController setDelegate:v4];
    v4->_allowsPhoneNumbers = a3;
  }
  return v4;
}

+ (id)titleString
{
  return 0;
}

+ (id)composeLabel
{
  return 0;
}

- (void)loadView
{
  id v9 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v9 setAutoresizingMask:18];
  v3 = +[UIColor systemBackgroundColor];
  [v9 setBackgroundColor:v3];

  +[CNComposeRecipientTextView preferredHeight];
  double v5 = v4;
  -[CNComposeRecipientTextView setFrame:](self->_composeView, "setFrame:", 0.0, 0.0, 0.0, v4);
  [(CNComposeRecipientTextView *)self->_composeView setAutoresizingMask:2];
  v6 = [(id)objc_opt_class() composeLabel];
  [(CNComposeRecipientTextView *)self->_composeView setLabel:v6];

  [(CNComposeRecipientTextView *)self->_composeView setDelegate:self];
  v7 = [objc_alloc((Class)UIScrollView) initWithFrame:0.0, 0.0, 0.0, v5];
  composeScrollView = self->_composeScrollView;
  self->_composeScrollView = v7;

  [(UIScrollView *)self->_composeScrollView setAutoresizingMask:2];
  [(UIScrollView *)self->_composeScrollView addSubview:self->_composeView];
  [v9 addSubview:self->_composeScrollView];
  [(RemindersListAddPersonController *)self setView:v9];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RemindersListAddPersonController;
  [(RemindersListAddPersonController *)&v4 viewDidAppear:a3];
  [(CNComposeRecipientTextView *)self->_composeView becomeFirstResponder];
}

- (void)viewSafeAreaInsetsDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)RemindersListAddPersonController;
  [(RemindersListAddPersonController *)&v12 viewSafeAreaInsetsDidChange];
  [(UIScrollView *)self->_composeScrollView frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  id v9 = [(RemindersListAddPersonController *)self view];
  [v9 safeAreaInsets];
  double v11 = v10;

  -[UIScrollView setFrame:](self->_composeScrollView, "setFrame:", v4, v11, v6, v8);
}

- (int64_t)_interfaceIdiomToUse
{
  v2 = [(RemindersListAddPersonController *)self view];
  double v3 = [v2 window];
  double v4 = [v3 traitCollection];

  id v5 = [v4 horizontalSizeClass];
  id v6 = [v4 verticalSizeClass];
  uint64_t v7 = 1;
  if (v5 != (id)2) {
    uint64_t v7 = -1;
  }
  if (v6 == (id)2 && v5 == (id)1) {
    int64_t v9 = 0;
  }
  else {
    int64_t v9 = v7;
  }

  return v9;
}

- (id)_shadowView
{
  double v3 = [(RemindersListAddPersonController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(UIScrollView *)self->_composeScrollView frame];
  double v8 = CGRectGetMaxY(v18) + -1.0;
  +[MFSearchShadowView defaultHeight];
  shadowView = self->_shadowView;
  if (shadowView)
  {
    -[MFSearchShadowView setFrame:](shadowView, "setFrame:", v5, v8, v7, v9);
  }
  else
  {
    double v11 = [objc_alloc((Class)MFSearchShadowView) initWithFrame:v5, v8, v7, v9];
    objc_super v12 = self->_shadowView;
    self->_shadowView = v11;

    [(MFSearchShadowView *)self->_shadowView setAutoresizingMask:2];
    objc_super v13 = self->_shadowView;
    v14 = +[UIColor clearColor];
    [(MFSearchShadowView *)v13 setBackgroundColor:v14];
  }
  v15 = self->_shadowView;

  return v15;
}

- (id)_searchResultsView
{
  double v3 = [(RemindersListAddPersonController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (!self->_searchResultsView)
  {
    objc_super v12 = [(CNAutocompleteResultsTableViewController *)self->_searchResultsViewController tableView];
    searchResultsView = self->_searchResultsView;
    self->_searchResultsView = v12;

    [(UITableView *)self->_searchResultsView setAutoresizingMask:34];
  }
  v14 = [(RemindersListAddPersonController *)self view];
  v15 = [v14 window];
  v16 = [(RemindersListAddPersonController *)self view];
  double v52 = v5;
  double v53 = v9;
  [v15 convertRect:v16 fromView:v5];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v25 = [(RemindersListAddPersonController *)self view];
  v26 = [v25 window];
  [(UIScrollView *)self->_composeScrollView bounds];
  [v26 convertRect:self->_composeScrollView fromView:];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v54.origin.x = v28;
  v54.origin.y = v30;
  v54.size.width = v32;
  v54.size.height = v34;
  double MaxY = CGRectGetMaxY(v54);
  v55.origin.x = v18;
  v55.origin.y = v20;
  v55.size.width = v22;
  v55.size.height = v24;
  double MinY = CGRectGetMaxY(v55);
  v37 = +[UIKeyboard activeKeyboard];
  v38 = v37;
  if (v37)
  {
    v39 = [v37 window];
    [v38 bounds];
    [v39 convertRect:v38 fromView:];
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;

    v56.origin.x = v41;
    v56.origin.y = v43;
    v56.size.width = v45;
    v56.size.height = v47;
    double MinY = CGRectGetMinY(v56);
  }
  [(UIScrollView *)self->_composeScrollView frame];
  double v48 = CGRectGetMaxY(v57);
  if (MinY - MaxY >= 0.0) {
    double v49 = MinY - MaxY;
  }
  else {
    double v49 = 0.0;
  }
  -[UITableView setFrame:](self->_searchResultsView, "setFrame:", v52, v48, v53, v49);
  v50 = self->_searchResultsView;

  return v50;
}

- (void)_showSearchField
{
  self->_showingSearchField = 1;
  id v8 = [(RemindersListAddPersonController *)self _searchResultsView];
  double v3 = [v8 superview];

  if (!v3)
  {
    double v4 = [(RemindersListAddPersonController *)self view];
    [v4 addSubview:self->_searchResultsView];
  }
  double v5 = [(RemindersListAddPersonController *)self _shadowView];
  double v6 = [v5 superview];

  if (!v6)
  {
    double v7 = [(RemindersListAddPersonController *)self view];
    [v7 addSubview:self->_shadowView];
  }
  [(CNComposeRecipientTextView *)self->_composeView setSeparatorHidden:1];
}

- (void)_hideSearchFieldAndCancelOutstandingSearches:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showingSearchField = 0;
  searchResults = self->_searchResults;
  self->_searchResults = 0;

  displayedResults = self->_displayedResults;
  self->_displayedResults = 0;

  [(CNAutocompleteResultsTableViewController *)self->_searchResultsViewController setRecipients:self->_displayedResults];
  if (v3 && self->_lastSearchId)
  {
    double v7 = [(RemindersListAddPersonController *)self _searchManager];
    [v7 cancelTaskWithID:self->_lastSearchId];

    lastSearchId = self->_lastSearchId;
    self->_lastSearchId = 0;
  }
  [(UIScrollView *)self->_composeScrollView frame];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  int v16 = (int)-v15;
  double v17 = [(RemindersListAddPersonController *)self view];
  [v17 safeAreaInsets];
  uint64_t v19 = v18;

  if (v16)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000420E4;
    v20[3] = &unk_100734870;
    v20[4] = self;
    v20[5] = v10;
    v20[6] = v19;
    v20[7] = v12;
    v20[8] = v14;
    +[UIView animateWithDuration:v20 animations:0.2];
  }
  [(UITableView *)self->_searchResultsView removeFromSuperview];
  [(MFSearchShadowView *)self->_shadowView removeFromSuperview];
  [(CNComposeRecipientTextView *)self->_composeView setSeparatorHidden:0];
}

- (double)_maxScrollerHeight
{
  int64_t v3 = [(RemindersListAddPersonController *)self _interfaceIdiomToUse];
  double v4 = [(RemindersListAddPersonController *)self view];
  [v4 bounds];
  double v6 = v5;
  if (v3 != 1)
  {
    +[UIKeyboard defaultSize];
    double v6 = v6 - v7;
  }

  return v6;
}

- (id)_searchManager
{
  if (!self->_searchManager)
  {
    int64_t v3 = [objc_alloc((Class)CNAutocompleteSearchManager) initWithAutocompleteSearchType:[self allowPhoneNumbers]];
    searchManager = self->_searchManager;
    self->_searchManager = v3;

    double v5 = self->_searchManager;
    if (self->_searchAccountID)
    {
      [(CNAutocompleteSearchManager *)v5 setSearchTypes:10];
      double v6 = self->_searchManager;
      double v7 = +[NSArray arrayWithObject:self->_searchAccountID];
      [(CNAutocompleteSearchManager *)v6 setSearchAccountIDs:v7];
    }
    else
    {
      [(CNAutocompleteSearchManager *)v5 setSearchTypes:2];
    }
  }
  id v8 = self->_searchManager;

  return v8;
}

- (BOOL)allowPhoneNumbers
{
  return self->_allowsPhoneNumbers;
}

- (void)searchWithText:(id)a3
{
  id v8 = a3;
  if (self->_lastSearchId)
  {
    double v4 = [(RemindersListAddPersonController *)self _searchManager];
    [v4 cancelTaskWithID:self->_lastSearchId];
  }
  [(NSMutableArray *)self->_searchResults removeAllObjects];
  double v5 = [(RemindersListAddPersonController *)self _searchManager];
  double v6 = [v5 searchForText:v8 withAutocompleteFetchContext:0 consumer:self];
  lastSearchId = self->_lastSearchId;
  self->_lastSearchId = v6;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v9 = a3;
  if ([a4 isEqual:self->_lastSearchId] && objc_msgSend(v9, "count"))
  {
    searchResults = self->_searchResults;
    if (!searchResults)
    {
      double v7 = +[NSMutableArray array];
      id v8 = self->_searchResults;
      self->_searchResults = v7;

      searchResults = self->_searchResults;
    }
    [(NSMutableArray *)searchResults addObjectsFromArray:v9];
    if (!self->_showingSearchField) {
      [(RemindersListAddPersonController *)self _showSearchField];
    }
  }
}

- (void)finishedSearchingForAutocompleteResults
{
  if (self->_showingSearchField)
  {
    int64_t v3 = (NSMutableArray *)[(NSMutableArray *)self->_searchResults copy];
    displayedResults = self->_displayedResults;
    self->_displayedResults = v3;

    double v5 = self->_displayedResults;
    searchResultsViewController = self->_searchResultsViewController;
    [(CNAutocompleteResultsTableViewController *)searchResultsViewController setRecipients:v5];
  }
}

- (void)finishedTaskWithID:(id)a3
{
  if ([a3 isEqual:self->_lastSearchId])
  {
    lastSearchId = self->_lastSearchId;
    self->_lastSearchId = 0;
  }
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  double v4 = objc_opt_new();
  uint64_t v14 = CNContactEmailAddressesKey;
  double v5 = +[NSArray arrayWithObjects:&v14 count:1];
  if ([(RemindersListAddPersonController *)self allowPhoneNumbers])
  {
    double v6 = [@"emailAddresses.@count > 0" stringByAppendingString:@" || phoneNumbers.@count > 0"];
    [@"(key == 'emailAddresses')" stringByAppendingString:@" || (key == 'phoneNumbers')"];
    double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v5 arrayByAddingObject:CNContactPhoneNumbersKey];

    CFStringRef v9 = @"(emailAddresses.@count + phoneNumbers.@count) == 1";
    double v5 = (void *)v8;
  }
  else
  {
    double v7 = @"(key == 'emailAddresses')";
    CFStringRef v9 = @"(emailAddresses.@count) == 1";
    double v6 = @"emailAddresses.@count > 0";
  }
  [v4 setDelegate:self];
  uint64_t v10 = +[NSPredicate predicateWithFormat:v6];
  [v4 setPredicateForEnablingContact:v10];

  uint64_t v11 = +[NSPredicate predicateWithFormat:v9];
  [v4 setPredicateForSelectionOfContact:v11];

  uint64_t v12 = +[NSPredicate predicateWithFormat:v7];
  [v4 setPredicateForSelectionOfProperty:v12];

  [v4 setDisplayedPropertyKeys:v5];
  [v4 setModalPresentationStyle:18];
  uint64_t v13 = [(RemindersListAddPersonController *)self navigationController];
  [v13 presentModalViewController:v4 withTransition:8];
}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  double v4 = [(RemindersListAddPersonController *)self navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  composeView = self->_composeView;

  [(CNComposeRecipientTextView *)composeView becomeFirstResponder];
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v5 = a4;
  if ([(RemindersListAddPersonController *)self allowPhoneNumbers]) {
    uint64_t v6 = [v5 cal_isPhoneNumber];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [objc_alloc((Class)CNComposeRecipient) initWithContact:0 address:v5 kind:v6];

  return v7;
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  [a3 removeRecipient:a4];
  id v6 = [(RemindersListAddPersonController *)self delegate];
  id v5 = [(CNComposeRecipientTextView *)self->_composeView recipients];
  [v6 controller:self didUpdateRecipients:v5];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (([(UITableView *)self->_searchResultsView isDragging] & 1) == 0)
  {
    [v7 clearText];
    [(RemindersListAddPersonController *)self _hideSearchFieldAndCancelOutstandingSearches:1];
    [v7 addAddress:v6];
  }
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  [a3 invalidateAtomPresentationOptionsForRecipient:a4];
  id v6 = [(RemindersListAddPersonController *)self delegate];
  id v5 = [(CNComposeRecipientTextView *)self->_composeView recipients];
  [v6 controller:self didUpdateRecipients:v5];
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  if ([v5 length]) {
    [(RemindersListAddPersonController *)self searchWithText:v5];
  }
  else {
    [(RemindersListAddPersonController *)self _hideSearchFieldAndCancelOutstandingSearches:1];
  }
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  if (!self->_showingSearchField)
  {
    double height = a4.height;
    CGFloat width = a4.width;
    [(CNComposeRecipientTextView *)self->_composeView frame];
    if (v10 != height)
    {
      uint64_t v11 = v7;
      uint64_t v12 = v8;
      uint64_t v13 = v9;
      uint64_t v14 = [(CNComposeRecipientTextView *)self->_composeView addButton];
      [v14 setAlpha:0.0];

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100042AB0;
      v16[3] = &unk_100734898;
      v16[4] = self;
      v16[5] = v11;
      v16[6] = v12;
      v16[7] = v13;
      *(double *)&v16[8] = height;
      *(CGFloat *)&v16[9] = width;
      *(double *)&v16[10] = height;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100042BA0;
      v15[3] = &unk_1007348E8;
      v15[4] = self;
      +[UIView animateWithDuration:v16 animations:v15 completion:0.2];
    }
  }
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  if (a4)
  {
    composeView = self->_composeView;
    id v7 = a4;
    [(CNComposeRecipientTextView *)composeView clearText];
    [(RemindersListAddPersonController *)self _hideSearchFieldAndCancelOutstandingSearches:1];
    [(CNComposeRecipientTextView *)self->_composeView addRecipient:v7];
  }
}

- (id)recipientFromContact:(id)a3
{
  id v3 = a3;
  double v4 = [v3 emailAddresses];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [v3 emailAddresses];
    id v7 = [v6 objectAtIndexedSubscript:0];
    id v8 = [v7 value];
  }
  else
  {
    uint64_t v9 = [v3 phoneNumbers];
    id v8 = [v9 count];

    if (!v8) {
      goto LABEL_6;
    }
    double v10 = [v3 phoneNumbers];
    uint64_t v11 = [v10 objectAtIndexedSubscript:0];
    id v6 = [v11 value];

    id v8 = [v6 stringValue];
  }

LABEL_6:
  id v12 = [objc_alloc((Class)CNComposeRecipient) initWithContact:v3 address:v8 kind:v5 == 0];

  return v12;
}

- (void)addContact:(id)a3
{
  id v4 = [(RemindersListAddPersonController *)self recipientFromContact:a3];
  [(CNComposeRecipientTextView *)self->_composeView addRecipient:v4];
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  [(RemindersListAddPersonController *)self addContact:a4];
  composeView = self->_composeView;

  [(RemindersListAddPersonController *)self composeRecipientViewDidFinishPickingRecipient:composeView];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v13 = a4;
  id v5 = [v13 key];
  unsigned int v6 = [v5 isEqualToString:CNContactEmailAddressesKey];

  id v7 = [v13 value];
  id v8 = v7;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = [v7 stringValue];

    id v8 = (void *)v9;
  }
  id v10 = objc_alloc((Class)CNComposeRecipient);
  uint64_t v11 = [v13 contact];
  id v12 = [v10 initWithContact:v11 address:v8 kind:v6 ^ 1];

  [(CNComposeRecipientTextView *)self->_composeView addRecipient:v12];
  [(RemindersListAddPersonController *)self composeRecipientViewDidFinishPickingRecipient:self->_composeView];
}

- (void)commit
{
  composeView = self->_composeView;
  if (composeView)
  {
    composeView = [composeView textView];
  }
  id v3 = composeView;
  if ([composeView isFirstResponder]) {
    [v3 resignFirstResponder];
  }
}

- (id)recipients
{
  return [(CNComposeRecipientTextView *)self->_composeView recipients];
}

- (NSString)searchAccountID
{
  return self->_searchAccountID;
}

- (void)setSearchAccountID:(id)a3
{
}

- (RemindersContactEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RemindersContactEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchAccountID, 0);
  objc_storeStrong((id *)&self->_lastSearchId, 0);
  objc_storeStrong((id *)&self->_displayedResults, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_searchResultsView, 0);
  objc_storeStrong((id *)&self->_searchResultsViewController, 0);
  objc_storeStrong((id *)&self->_composeScrollView, 0);

  objc_storeStrong((id *)&self->_composeView, 0);
}

@end