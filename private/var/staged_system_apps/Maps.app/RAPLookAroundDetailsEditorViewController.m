@interface RAPLookAroundDetailsEditorViewController
- (BOOL)_requiresPrivacyElements;
- (BOOL)_shouldShowPrivacyFooterForSection:(int64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (RAPLookAroundDetailsEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightforFooterInSection:(int64_t)a4;
- (id)_sendButtonItem;
- (id)_userInfoCell;
- (id)commentHeaderView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 resolveHomeImageryCellForIndexPath:(id)a4;
- (id)tableView:(id)a3 resolveHomeImageryCellWithNoAccountForIndexPath:(id)a4;
- (id)tableView:(id)a3 resolveSimpleFeedbackCellForIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int)analyticTarget;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_presentPrivacyView;
- (void)_sendRAP;
- (void)_setupTableView;
- (void)addressTableViewCell:(id)a3 updatedAddress:(id)a4;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)macFooterViewRightButtonTapped:(id)a3;
- (void)rapSearchAutocompleteViewController:(id)a3 finishedPickingAutocompleteResult:(id)a4 isAutocompleteResult:(BOOL)a5;
- (void)setTableView:(id)a3;
- (void)userTappedOnAddressTableViewCell:(id)a3;
- (void)valueForCorrectableItemKind:(int64_t)a3 changedTo:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RAPLookAroundDetailsEditorViewController

- (RAPLookAroundDetailsEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)RAPLookAroundDetailsEditorViewController;
  v12 = [(RAPLookAroundDetailsEditorViewController *)&v18 initWithNibName:0 bundle:0];
  if (v12)
  {
    v13 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    tableView = v12->_tableView;
    v12->_tableView = v13;

    [(UITableView *)v12->_tableView setRowHeight:UITableViewAutomaticDimension];
    [(UITableView *)v12->_tableView setDelegate:v12];
    [(UITableView *)v12->_tableView setDataSource:v12];
    objc_storeStrong((id *)&v12->_report, a3);
    objc_storeStrong((id *)&v12->_question, a4);
    id v15 = [v11 copy];
    id completion = v12->_completion;
    v12->_id completion = v15;

    [(RAPReport *)v12->_report updateIfNeeded];
  }

  return v12;
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)RAPLookAroundDetailsEditorViewController;
  [(RAPLookAroundDetailsEditorViewController *)&v38 viewDidLoad];
  v3 = +[GEOUserAccountInfo primaryICloudAccount];
  account = self->_account;
  self->_account = v3;

  id v37 = objc_alloc_init((Class)NSMutableArray);
  v5 = [(RAPLookAroundQuestion *)self->_question localizedDetailsNavigationTitle];
  v6 = [(RAPLookAroundDetailsEditorViewController *)self navigationItem];
  [v6 setTitle:v5];

  v7 = [(RAPLookAroundDetailsEditorViewController *)self _sendButtonItem];
  v8 = [(RAPLookAroundDetailsEditorViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  id v9 = [(RAPLookAroundDetailsEditorViewController *)self view];
  id v10 = sub_100ABB9DC([(RAPLookAroundQuestion *)self->_question selectedQuestionType]);
  [v9 setAccessibilityIdentifier:v10];

  id v11 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(RAPLookAroundDetailsEditorViewController *)self view];
  v13 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v12 addSubview:v13];

  v36 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  v34 = [v36 leadingAnchor];
  v35 = [(RAPLookAroundDetailsEditorViewController *)self view];
  v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v39[0] = v32;
  v31 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  v30 = [v31 trailingAnchor];
  v14 = [(RAPLookAroundDetailsEditorViewController *)self view];
  id v15 = [v14 trailingAnchor];
  v16 = [v30 constraintEqualToAnchor:v15];
  v39[1] = v16;
  v17 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  objc_super v18 = [v17 topAnchor];
  v19 = [(RAPLookAroundDetailsEditorViewController *)self view];
  v20 = [v19 topAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v39[2] = v21;
  v22 = +[NSArray arrayWithObjects:v39 count:3];
  [v37 addObjectsFromArray:v22];

  v23 = +[NSNotificationCenter defaultCenter];
  [v23 addObserver:self selector:"keyboardWillShow:" name:UIKeyboardDidShowNotification object:0];

  v24 = +[NSNotificationCenter defaultCenter];
  [v24 addObserver:self selector:"keyboardWillHide:" name:UIKeyboardDidHideNotification object:0];

  [(RAPLookAroundDetailsEditorViewController *)self _setupTableView];
  v25 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  v26 = [v25 bottomAnchor];
  v27 = [(RAPLookAroundDetailsEditorViewController *)self view];
  v28 = [v27 bottomAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  [v37 addObject:v29];

  +[NSLayoutConstraint activateConstraints:v37];
}

- (void)_setupTableView
{
  v3 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v3 setDataSource:self];

  v4 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"RAPAddressTableViewCell"];

  v5 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"RAPLookAroundCommentTableViewCell"];

  v6 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"RAPLookAroundEmailTableViewCell"];

  v7 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"RAPUserContentTableViewCell"];

  v8 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v8 _maps_initializeRAPAppearance];

  id v9 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v9 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"CommentHeaderView"];

  id v10 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v10 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"MacRAPTableViewFooterView"];

  id v11 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v11 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"RAPUserContentTableViewFooterView"];

  id v13 = +[UIColor systemBackgroundColor];
  v12 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v12 setBackgroundColor:v13];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RAPLookAroundDetailsEditorViewController;
  [(RAPLookAroundDetailsEditorViewController *)&v5 viewDidAppear:a3];
  commentCell = self->_commentCell;
  if (commentCell) {
    [(RAPReportComposerCommentTableViewCell *)commentCell beginEditingCommentIfPossible];
  }
}

- (void)keyboardWillShow:(id)a3
{
  v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  id v15 = +[UIScreen mainScreen];
  v16 = [v15 coordinateSpace];
  [v14 convertRect:v16 fromCoordinateSpace:v7, v9, v11, v13];
  double v18 = v17;

  id v19 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v19 setContentInset:0.0, 0.0, v18, 0.0];
}

- (void)keyboardWillHide:(id)a3
{
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  double v7 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v7 setContentInset:UIEdgeInsetsZero.top, left, bottom, right];

  id v8 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v8 setScrollIndicatorInsets:UIEdgeInsetsZero.top, left, bottom, right];
}

- (BOOL)_requiresPrivacyElements
{
  return (id)[(RAPLookAroundQuestion *)self->_question selectedQuestionType] == (id)5;
}

- (id)_sendButtonItem
{
  sendButtonItem = self->_sendButtonItem;
  if (!sendButtonItem)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    objc_super v5 = +[NSBundle mainBundle];
    double v6 = [v5 localizedStringForKey:@"Submit" value:@"localized string not found" table:0];
    double v7 = (UIBarButtonItem *)[v4 initWithTitle:v6 style:2 target:self action:"_sendRAP"];

    [(UIBarButtonItem *)v7 setEnabled:[(RAPReport *)self->_report canCreateSubmittableProblem]];
    [(UIBarButtonItem *)v7 setAccessibilityIdentifier:@"RAPSubmitButton"];
    [(RAPReport *)self->_report addObserver:self changeHandler:&stru_1012F65F8];
    id v8 = self->_sendButtonItem;
    self->_sendButtonItem = v7;

    sendButtonItem = self->_sendButtonItem;
  }

  return sendButtonItem;
}

- (void)_sendRAP
{
  v3 = [(RAPLookAroundDetailsEditorViewController *)self view];
  [v3 endEditing:1];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100713E68;
  v7[3] = &unk_1012F6620;
  v7[4] = self;
  id v4 = objc_retainBlock(v7);
  if ((id)[(RAPLookAroundQuestion *)self->_question selectedQuestionType] == (id)5)
  {
    objc_super v5 = [(RAPLookAroundQuestion *)self->_question emailAddressCorrectableString];
    double v6 = [v5 value];
    +[RAPPrivacy performPrivacyCheckWithAppearance:1 userEnteredEmailAddress:v6 completion:v4];
  }
  else if (MapsFeature_IsEnabled_RAPCommunityID())
  {
    ((void (*)(void *, uint64_t, void, void))v4[2])(v4, 1, 0, 0);
  }
  else
  {
    +[RAPPrivacy performPrivacyCheckWithAppearance:1 completion:v4];
  }
}

- (void)valueForCorrectableItemKind:(int64_t)a3 changedTo:(id)a4
{
  question = self->_question;
  id v5 = a4;
  id v6 = [(RAPLookAroundQuestion *)question emailAddressCorrectableString];
  [v6 setValue:v5];
}

- (void)rapSearchAutocompleteViewController:(id)a3 finishedPickingAutocompleteResult:(id)a4 isAutocompleteResult:(BOOL)a5
{
  if (a5)
  {
    question = self->_question;
    id v7 = a4;
    id v8 = [(RAPLookAroundQuestion *)question addressCorrectableString];
    double v9 = [v7 selectedMapItem];

    [v8 updateFreeformAddressFromMapItem:v9];
  }
  else
  {
    id v10 = a4;
    id v8 = [v10 searchBarText];

    double v9 = [(RAPLookAroundQuestion *)self->_question addressCorrectableString];
    double v11 = [v9 freeformAddress];
    [v11 setValue:v8];
  }
  double v12 = [(RAPLookAroundQuestion *)self->_question addressCorrectableString];
  double v13 = [v12 freeformAddress];
  v14 = [v13 value];
  [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setFreeformAddress:v14];

  id v15 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
  [v15 _maps_reloadCellHeights];
}

- (void)addressTableViewCell:(id)a3 updatedAddress:(id)a4
{
  [a4 freeformAddress:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(RAPLookAroundQuestion *)self->_question addressCorrectableString];
  id v6 = [v5 freeformAddress];
  [v6 setValue:v7];
}

- (void)userTappedOnAddressTableViewCell:(id)a3
{
  id v4 = [(RAPLookAroundQuestion *)self->_question addressCorrectableString];
  id v5 = [v4 freeformAddress];
  id v6 = [v5 value];
  id v15 = +[RAPSearchAutocompleteViewController addressAutocompleteViewControllerWithInitialSearchString:v6];

  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Home Address [RAP]" value:@"localized string not found" table:0];
  [v15 setTitleText:v8];

  [v15 setDelegate:self];
  id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v15];
  [v9 setModalPresentationStyle:2];
  [v9 setModalInPresentation:1];
  id v10 = [(RAPLookAroundDetailsEditorViewController *)self navigationController];
  [v9 setOverrideUserInterfaceStyle:[v10 overrideUserInterfaceStyle]];

  [v9 setAccessibilityIdentifier:@"RAPHomeAddressAutocompleteView"];
  double v11 = [(RAPLookAroundDetailsEditorViewController *)self navigationController];
  objc_msgSend(v15, "setOverrideUserInterfaceStyle:", objc_msgSend(v11, "overrideUserInterfaceStyle"));

  double v12 = [(RAPLookAroundDetailsEditorViewController *)self traitCollection];
  id v13 = [v12 userInterfaceIdiom];

  if (v13 == (id)5)
  {
    [v15 setOverrideUserInterfaceStyle:1];
    v14 = [(RAPLookAroundDetailsEditorViewController *)self navigationController];
    [v14 pushViewController:v15 animated:1];
  }
  else
  {
    [(RAPLookAroundDetailsEditorViewController *)self presentViewController:v9 animated:1 completion:0];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_account) {
    unsigned int v4 = 3;
  }
  else {
    unsigned int v4 = 2;
  }
  if (MapsFeature_IsEnabled_RAPCommunityID())
  {
    if (![(RAPLookAroundDetailsEditorViewController *)self _requiresPrivacyElements]) {
      return 1;
    }
  }
  else if ((id)[(RAPLookAroundQuestion *)self->_question selectedQuestionType] != (id)5)
  {
    if (self->_account) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ((id)[(RAPLookAroundQuestion *)self->_question selectedQuestionType] != (id)5)
  {
    if (MapsFeature_IsEnabled_RAPCommunityID()
      || (account = self->_account, a4) && account
      || !a4 && !account)
    {
      id v13 = [(RAPLookAroundDetailsEditorViewController *)self commentHeaderView];
      goto LABEL_19;
    }
  }
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Address [RAP]" value:@"localized string not found" table:0];

  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"Contact Information [Report a Problem]" value:@"localized string not found" table:0];

  if ((id)[(RAPLookAroundQuestion *)self->_question selectedQuestionType] != (id)5) {
    goto LABEL_17;
  }
  if (self->_account)
  {
    double v11 = v8;
    if (a4 != 1)
    {
      double v11 = v10;
      if (a4 != 2) {
        goto LABEL_17;
      }
    }
  }
  else
  {
    double v11 = v8;
    if (a4)
    {
      if (a4 != 1)
      {
LABEL_17:
        v14 = &stru_101324E70;
        goto LABEL_18;
      }
      double v11 = v10;
    }
  }
  v14 = v11;
LABEL_18:
  id v13 = [v6 _maps_groupedHeaderViewWithTitle:v14];

LABEL_19:

  return v13;
}

- (id)commentHeaderView
{
  if (!self->_commentHeaderView)
  {
    v3 = [RAPCommentPartHeaderView alloc];
    unsigned int v4 = [(RAPLookAroundQuestion *)self->_question commentQuestion];
    id v5 = [(RAPCommentPartHeaderView *)v3 initWithQuestion:v4 reuseIdentifier:@"CommentHeaderView"];
    commentHeaderView = self->_commentHeaderView;
    self->_commentHeaderView = v5;
  }
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"Details [Report a Problem]" value:@"localized string not found" table:0];
  [(RAPHeaderFooterView *)self->_commentHeaderView setTitleLabelText:v8];

  id v9 = self->_commentHeaderView;

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if ([(RAPLookAroundDetailsEditorViewController *)self _requiresPrivacyElements]) {
    return UITableViewAutomaticDimension;
  }
  id v6 = [(RAPLookAroundDetailsEditorViewController *)self commentHeaderView];
  [v6 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v5 = v7;

  return v5;
}

- (BOOL)_shouldShowPrivacyFooterForSection:(int64_t)a3
{
  account = self->_account;
  if (!a3 && account)
  {
    BOOL v6 = 1;
LABEL_8:
    unsigned __int8 v7 = [(RAPLookAroundDetailsEditorViewController *)self _requiresPrivacyElements];
    if (a3) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v7;
    }
    goto LABEL_12;
  }
  BOOL v6 = 0;
  if (!a3 && !account)
  {
    BOOL v6 = (id)[(RAPLookAroundQuestion *)self->_question selectedQuestionType] != (id)5;
    account = self->_account;
  }
  if (account) {
    goto LABEL_8;
  }
  BOOL v8 = 0;
LABEL_12:
  if (MapsFeature_IsEnabled_RAPCommunityID()) {
    return v8;
  }
  else {
    return v6;
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  account = self->_account;
  if ((id)[(RAPLookAroundQuestion *)self->_question selectedQuestionType] != (id)5) {
    goto LABEL_6;
  }
  uint64_t v6 = 1;
  if (account) {
    uint64_t v6 = 2;
  }
  if (v6 == a4)
  {
    unsigned __int8 v7 = +[NSBundle mainBundle];
    BOOL v8 = [v7 localizedStringForKey:@"Email Disclosure [Report a Problem]" value:@"localized string not found" table:0];
  }
  else
  {
LABEL_6:
    BOOL v8 = &stru_101324E70;
  }

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v6 = +[TableViewFooterOptions defaultRAPUserContentOptions];
  unsigned __int8 v7 = [[TableViewSelectableFooterView alloc] initWithReuseIdentifier:@"RAPUserContentTableViewFooterView" options:v6];
  [(TableViewSelectableFooterView *)v7 setTarget:self action:"_presentPrivacyView"];
  if ([(RAPLookAroundDetailsEditorViewController *)self _shouldShowPrivacyFooterForSection:a4])
  {
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (double)tableView:(id)a3 heightforFooterInSection:(int64_t)a4
{
  if (a4) {
    return 2.22507386e-308;
  }
  unint64_t v7 = [(RAPLookAroundQuestion *)self->_question selectedQuestionType];
  double result = UITableViewAutomaticDimension;
  if (v7 == 5) {
    return 2.22507386e-308;
  }
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = (id)[(RAPLookAroundQuestion *)self->_question selectedQuestionType] != (id)5
    || !self->_account
    || [v5 section];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  question = self->_question;
  id v7 = a4;
  id v8 = a3;
  if ((id)[(RAPLookAroundQuestion *)question selectedQuestionType] == (id)5) {
    [(RAPLookAroundDetailsEditorViewController *)self tableView:v8 resolveHomeImageryCellForIndexPath:v7];
  }
  else {
  id v9 = [(RAPLookAroundDetailsEditorViewController *)self tableView:v8 resolveSimpleFeedbackCellForIndexPath:v7];
  }

  return v9;
}

- (id)tableView:(id)a3 resolveHomeImageryCellForIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!self->_account)
  {
    id v15 = [(RAPLookAroundDetailsEditorViewController *)self tableView:v6 resolveHomeImageryCellWithNoAccountForIndexPath:v7];
LABEL_9:
    v16 = v15;
    goto LABEL_10;
  }
  if (![v7 section])
  {
    id v15 = [(RAPLookAroundDetailsEditorViewController *)self _userInfoCell];
    goto LABEL_9;
  }
  if ([v8 section] == (id)1)
  {
    addressCell = self->_addressCell;
    if (!addressCell)
    {
      id v10 = [v6 dequeueReusableCellWithIdentifier:@"RAPAddressTableViewCell" forIndexPath:v8];
      double v11 = self->_addressCell;
      self->_addressCell = v10;
      double v12 = v10;

      [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setDelegate:self];
      id v13 = +[RAPAddressLayoutOptions allFieldsDisabledOptions];
      [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setLayoutOptions:v13];

      [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setEditableAndTappable:1];
      [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setAccessibilityIdentifier:@"RAPLookAroundAddressCell"];
      v14 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
      [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setParentTableView:v14];

      addressCell = self->_addressCell;
    }
    id v15 = addressCell;
    goto LABEL_9;
  }
  v16 = [v6 dequeueReusableCellWithIdentifier:@"RAPLookAroundEmailTableViewCell" forIndexPath:v8];
  double v18 = +[NSBundle mainBundle];
  id v19 = [v18 localizedStringForKey:@"Email Address [Report a Problem]" value:@"localized string not found" table:0];
  [v16 setPlaceholder:v19];

  v20 = [(RAPLookAroundQuestion *)self->_question emailAddressCorrectableString];
  v21 = [v20 value];
  [v16 setValue:v21];

  [v16 setPreferredKeyboardType:7];
  [v16 setAccessibilityIdentifier:@"RAPLookAroundEmailCell"];
  [v16 setDelegate:self];
LABEL_10:

  return v16;
}

- (id)tableView:(id)a3 resolveHomeImageryCellWithNoAccountForIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    id v8 = [v6 dequeueReusableCellWithIdentifier:@"RAPLookAroundEmailTableViewCell" forIndexPath:v7];
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"Email Address [Report a Problem]" value:@"localized string not found" table:0];
    [(RAPMultilineAddressLabelTableViewCell *)v8 setPlaceholder:v10];

    double v11 = [(RAPLookAroundQuestion *)self->_question emailAddressCorrectableString];
    double v12 = [v11 value];
    [(RAPMultilineAddressLabelTableViewCell *)v8 setValue:v12];

    [(RAPMultilineAddressLabelTableViewCell *)v8 setPreferredKeyboardType:7];
    [(RAPMultilineAddressLabelTableViewCell *)v8 setAccessibilityIdentifier:@"RAPLookAroundEmailCell"];
    [(RAPMultilineAddressLabelTableViewCell *)v8 setDelegate:self];
  }
  else
  {
    addressCell = self->_addressCell;
    if (!addressCell)
    {
      v14 = [v6 dequeueReusableCellWithIdentifier:@"RAPAddressTableViewCell" forIndexPath:v7];
      id v15 = self->_addressCell;
      self->_addressCell = v14;
      v16 = v14;

      [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setDelegate:self];
      double v17 = +[RAPAddressLayoutOptions allFieldsDisabledOptions];
      [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setLayoutOptions:v17];

      [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setEditableAndTappable:1];
      [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setAccessibilityIdentifier:@"RAPLookAroundAddressCell"];
      double v18 = [(RAPLookAroundDetailsEditorViewController *)self tableView];
      [(RAPMultilineAddressLabelTableViewCell *)self->_addressCell setParentTableView:v18];

      addressCell = self->_addressCell;
    }
    id v8 = addressCell;
  }

  return v8;
}

- (id)tableView:(id)a3 resolveSimpleFeedbackCellForIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_account)
  {
    p_commentCell = &self->_commentCell;
    commentCell = self->_commentCell;
    if (!commentCell)
    {
      id v10 = [v6 dequeueReusableCellWithIdentifier:@"RAPLookAroundCommentTableViewCell" forIndexPath:v7];
      objc_storeStrong((id *)&self->_commentCell, v10);
      id v15 = [(RAPLookAroundQuestion *)self->_question localizedDescription];
      [(RAPReportComposerCommentTableViewCell *)*p_commentCell setPlaceholderText:v15];

      v16 = [(RAPLookAroundQuestion *)self->_question commentQuestion];
      objc_initWeak(&location, self);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100715124;
      v20[3] = &unk_1012F6648;
      id v13 = v16;
      id v21 = v13;
      objc_copyWeak(&v22, &location);
      [(RAPReportComposerCommentTableViewCell *)*p_commentCell setTextDidChange:v20];
      objc_destroyWeak(&v22);
      v14 = v21;
      goto LABEL_8;
    }
LABEL_9:
    double v17 = commentCell;
    goto LABEL_10;
  }
  if ((MapsFeature_IsEnabled_RAPCommunityID() & 1) != 0 || [v7 section])
  {
    p_commentCell = &self->_commentCell;
    commentCell = self->_commentCell;
    if (!commentCell)
    {
      id v10 = [v6 dequeueReusableCellWithIdentifier:@"RAPLookAroundCommentTableViewCell" forIndexPath:v7];
      objc_storeStrong((id *)&self->_commentCell, v10);
      double v11 = [(RAPLookAroundQuestion *)self->_question localizedDescription];
      [(RAPReportComposerCommentTableViewCell *)*p_commentCell setPlaceholderText:v11];

      double v12 = [(RAPLookAroundQuestion *)self->_question commentQuestion];
      objc_initWeak(&location, self);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1007150B8;
      v23[3] = &unk_1012F6648;
      id v13 = v12;
      id v24 = v13;
      objc_copyWeak(&v25, &location);
      [(RAPReportComposerCommentTableViewCell *)*p_commentCell setTextDidChange:v23];
      objc_destroyWeak(&v25);
      v14 = v24;
LABEL_8:

      objc_destroyWeak(&location);
      commentCell = *p_commentCell;
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  double v17 = [(RAPLookAroundDetailsEditorViewController *)self _userInfoCell];
LABEL_10:
  double v18 = v17;

  return v18;
}

- (id)_userInfoCell
{
  if (!self->_userInfoCell)
  {
    v3 = [[RAPDisplayUserContentTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    userInfoCell = self->_userInfoCell;
    self->_userInfoCell = v3;

    if (sub_1000BBB44(self) == 5)
    {
      id v5 = +[UIColor systemBackgroundColor];
      [(RAPDisplayUserContentTableViewCell *)self->_userInfoCell setBackgroundColor:v5];
    }
  }
  id v6 = self->_userInfoCell;

  return v6;
}

- (void)_presentPrivacyView
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.mapsrap"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (int)analyticTarget
{
  return [(RAPLookAroundQuestion *)self->_question analyticTarget];
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
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_userContentFooterView, 0);
  objc_storeStrong((id *)&self->_userInfoCell, 0);
  objc_storeStrong((id *)&self->_commentHeaderView, 0);
  objc_storeStrong((id *)&self->_addressCell, 0);
  objc_storeStrong((id *)&self->_commentCell, 0);
  objc_storeStrong((id *)&self->_sendButtonItem, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_question, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end