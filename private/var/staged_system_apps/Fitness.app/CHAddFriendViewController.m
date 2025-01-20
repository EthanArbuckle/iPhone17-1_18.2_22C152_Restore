@interface CHAddFriendViewController
- (BOOL)_contact:(id)a3 hasEmailDestination:(id)a4;
- (BOOL)_contact:(id)a3 hasPhoneNumberDestination:(id)a4;
- (BOOL)_destinationMatchesCurrentAccountDestination:(id)a3;
- (BOOL)_isContactsAccessAuthorized;
- (CHAddFriendViewController)initWithFriendListManager:(id)a3 friendManager:(id)a4;
- (CHAddFriendViewControllerDelegate)delegate;
- (CNComposeRecipientTextView)recipientView;
- (NSArray)shownContacts;
- (NSLayoutConstraint)composeInputLineHeight;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_createPeoplePicker;
- (id)_destinationAddressesForCurrentAccount;
- (id)_noSuggestionString;
- (id)_preferredServiceIdentifierForDestination:(id)a3 inReachableDestinationsByService:(id)a4;
- (id)_recipientFromDestination:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_guessedKindForString:(id)a3;
- (void)_addContact:(id)a3;
- (void)_addSuggestedContact:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_checkReachableForContact:(id)a3 withDestination:(id)a4;
- (void)_dismissAndNotifyDelegate;
- (void)_dismissKeyboard:(id)a3;
- (void)_doneButtonTapped:(id)a3;
- (void)_fontSizeDidChange;
- (void)_mergeRecipient:(id)a3;
- (void)_populateSuggestedContactsWithReachability;
- (void)_queryAllServicesForDestinations:(id)a3 reachableUpdateHandler:(id)a4 completionHandler:(id)a5;
- (void)_refilterShownContacts;
- (void)_resetSearchResults;
- (void)_searchForRecipientWithText:(id)a3;
- (void)_sendInviteToRecipientsByService:(id)a3 completion:(id)a4;
- (void)_setShowSuggestions:(BOOL)a3;
- (void)_textFieldShouldBecomeFirstResponder;
- (void)_textFieldShouldResignFirstResponder;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)dealloc;
- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4;
- (void)finishedSearchingForAutocompleteResults;
- (void)removeRecipient:(id)a3;
- (void)setComposeInputLineHeight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRecipientView:(id)a3;
- (void)setShownContacts:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CHAddFriendViewController

- (CHAddFriendViewController)initWithFriendListManager:(id)a3 friendManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CHAddFriendViewController;
  v9 = [(CHAddFriendViewController *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_friendListManager, a3);
    objc_storeStrong((id *)&v10->_friendManager, a4);
    v11 = [(ASFriendListSectionManager *)v10->_friendListManager allDestinationsForActiveOrPendingFriends];
    uint64_t v12 = [v11 allObjects];
    currentFriendDestinations = v10->_currentFriendDestinations;
    v10->_currentFriendDestinations = (NSArray *)v12;

    v14 = +[ASReachabilityManager sharedInstanceForServiceIdentifier:kASiCloudServiceIdentifier];
    v15 = +[ASReachabilityManager sharedInstanceForServiceIdentifier:kASiMessageServiceIdentifier];
    v23[0] = v14;
    v23[1] = v15;
    uint64_t v16 = +[NSArray arrayWithObjects:v23 count:2];
    reachabilityManagers = v10->_reachabilityManagers;
    v10->_reachabilityManagers = (NSArray *)v16;

    v18 = objc_alloc_init(CHInvitationDestinationCoordinator);
    invitationDestinationCoordinator = v10->_invitationDestinationCoordinator;
    v10->_invitationDestinationCoordinator = v18;

    v20 = +[IMDaemonController sharedInstance];
    [v20 addListenerID:@"com.apple.Fitness.listener" capabilities:kFZListenerCapAccounts];
  }
  return v10;
}

- (void)dealloc
{
  v3 = +[IMDaemonController sharedInstance];
  [v3 removeListenerID:@"com.apple.Fitness.listener"];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CHAddFriendViewController;
  [(CHAddFriendViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v72.receiver = self;
  v72.super_class = (Class)CHAddFriendViewController;
  [(CHAddFriendViewController *)&v72 viewDidLoad];
  v3 = [(CHAddFriendViewController *)self view];
  v4 = +[UIColor systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  objc_super v5 = [(CHAddFriendViewController *)self navigationItem];
  v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"SHARE_ACTIVITY" value:&stru_1008D8AB8 table:@"Localizable"];
  [v5 setTitle:v7];

  id v70 = objc_alloc_init((Class)CNComposeRecipientTextView);
  [(CHAddFriendViewController *)self setRecipientView:v70];
  [(CNComposeRecipientTextView *)self->_recipientView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNComposeRecipientTextView *)self->_recipientView setEditable:1];
  [(CNComposeRecipientTextView *)self->_recipientView setAddresses:&__NSArray0__struct];
  [(CNComposeRecipientTextView *)self->_recipientView setDelegate:self];
  id v8 = [(CNComposeRecipientTextView *)self->_recipientView addButton];
  [v8 setHidden:0];

  [(CNComposeRecipientTextView *)self->_recipientView setSeparatorHidden:0];
  recipientView = self->_recipientView;
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"SHARE_INVITE_TO" value:&stru_1008D8AB8 table:@"Localizable"];
  [(CNComposeRecipientTextView *)recipientView setLabel:v11];

  uint64_t v12 = (CNAutocompleteSearchManager *)[objc_alloc((Class)CNAutocompleteSearchManager) initWithAutocompleteSearchType:1];
  searchManager = self->_searchManager;
  self->_searchManager = v12;

  [(CNAutocompleteSearchManager *)self->_searchManager setSearchTypes:17];
  [(CNAutocompleteSearchManager *)self->_searchManager setImplicitGroupCreationThreshold:2];
  [(CNAutocompleteSearchManager *)self->_searchManager setIncludeUpcomingEventMembers:1];
  v14 = [(CHAddFriendViewController *)self _destinationAddressesForCurrentAccount];
  currentAccountAddresses = self->_currentAccountAddresses;
  self->_currentAccountAddresses = v14;

  uint64_t v16 = [(CHAddFriendViewController *)self _createPeoplePicker];
  peoplePicker = self->_peoplePicker;
  self->_peoplePicker = v16;

  id v18 = objc_alloc((Class)UITableView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v22 = [v18 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CHAddFriendViewController *)self setTableView:v22];

  v23 = [(CHAddFriendViewController *)self tableView];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  v24 = [(CHAddFriendViewController *)self tableView];
  [v24 setDelegate:self];

  v25 = [(CHAddFriendViewController *)self tableView];
  [v25 setDataSource:self];

  v26 = [(CHAddFriendViewController *)self tableView];
  [v26 setKeyboardDismissMode:1];

  v27 = [(CHAddFriendViewController *)self tableView];
  [v27 setSectionHeaderTopPadding:0.0];

  id v28 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  v29 = [(CHAddFriendViewController *)self tableView];
  [v29 setTableFooterView:v28];

  v30 = [(CHAddFriendViewController *)self tableView];
  [v30 setSeparatorStyle:0];

  v31 = [(CHAddFriendViewController *)self tableView];
  v32 = [v31 separatorColor];
  separatorColor = self->_separatorColor;
  self->_separatorColor = v32;

  v34 = [(CHAddFriendViewController *)self tableView];
  v35 = +[UIColor clearColor];
  [v34 setSeparatorColor:v35];

  v36 = (CNMonogrammer *)[objc_alloc((Class)CNMonogrammer) initWithStyle:0 diameter:32.0];
  monogrammer = self->_monogrammer;
  self->_monogrammer = v36;

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100106C9C;
  v71[3] = &unk_1008AC0D0;
  v71[4] = self;
  v38 = +[NSPredicate predicateWithBlock:v71];
  recipientArrayFilterPredicate = self->_recipientArrayFilterPredicate;
  self->_recipientArrayFilterPredicate = v38;

  v40 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  pendingSearchResults = self->_pendingSearchResults;
  self->_pendingSearchResults = v40;

  v42 = (CNAutocompleteFetchContext *)objc_alloc_init((Class)CNAutocompleteFetchContext);
  context = self->_context;
  self->_context = v42;

  v44 = self->_context;
  v73[0] = CRRecentsDomainMail;
  v73[1] = CRRecentsDomainMessages;
  v45 = +[NSArray arrayWithObjects:v73 count:2];
  [(CNAutocompleteFetchContext *)v44 setBundleIdentifiers:v45];

  [(CNAutocompleteFetchContext *)self->_context setPredictsBasedOnOutgoingInteraction:1];
  self->_finishedPopulatingSuggestions = 0;
  [(CHAddFriendViewController *)self _searchForRecipientWithText:@"*"];
  v46 = [(CHAddFriendViewController *)self view];
  v47 = [(CHAddFriendViewController *)self recipientView];
  [v46 addSubview:v47];

  v48 = [(CHAddFriendViewController *)self view];
  v49 = [(CHAddFriendViewController *)self tableView];
  [v48 addSubview:v49];

  v50 = objc_opt_new();
  v51 = _NSDictionaryOfVariableBindings(@"_recipientView, _tableView", self->_recipientView, self->_tableView, 0);
  v52 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_recipientView]|" options:0 metrics:0 views:v51];
  [v50 addObjectsFromArray:v52];

  v53 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:0 views:v51];
  [v50 addObjectsFromArray:v53];

  v54 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_recipientView][_tableView]|" options:0 metrics:0 views:v51];
  [v50 addObjectsFromArray:v54];

  v55 = [(CNComposeRecipientTextView *)self->_recipientView topAnchor];
  v56 = [(CHAddFriendViewController *)self view];
  v57 = [v56 safeAreaLayoutGuide];
  v58 = [v57 topAnchor];
  v59 = [v55 constraintEqualToAnchor:v58];
  [v50 addObject:v59];

  v60 = [(CNComposeRecipientTextView *)self->_recipientView heightAnchor];
  +[CNComposeRecipientTextView preferredHeight];
  v61 = [v60 constraintEqualToConstant:];
  [(CHAddFriendViewController *)self setComposeInputLineHeight:v61];

  v62 = [(CHAddFriendViewController *)self composeInputLineHeight];
  LODWORD(v63) = 1148829696;
  [v62 setPriority:v63];

  v64 = [(CHAddFriendViewController *)self composeInputLineHeight];
  [v50 addObject:v64];

  v65 = [(CNComposeRecipientTextView *)self->_recipientView heightAnchor];
  v66 = [(CHAddFriendViewController *)self view];
  v67 = [v66 heightAnchor];
  v68 = [v65 constraintLessThanOrEqualToAnchor:v67 multiplier:0.3];
  [v50 addObject:v68];

  +[NSLayoutConstraint activateConstraints:v50];
  v69 = +[NSNotificationCenter defaultCenter];
  [v69 addObserver:self selector:"_fontSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)_fontSizeDidChange
{
  +[CNComposeRecipientTextView preferredHeight];
  double v4 = v3;
  id v5 = [(CHAddFriendViewController *)self composeInputLineHeight];
  [v5 setConstant:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CHAddFriendViewController;
  [(CHAddFriendViewController *)&v19 viewWillAppear:a3];
  id v4 = objc_alloc((Class)UIBarButtonItem);
  id v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"SHARING_INVITE_SEND" value:&stru_1008D8AB8 table:@"Localizable"];
  id v7 = [v4 initWithTitle:v6 style:2 target:self action:"_doneButtonTapped:"];
  id v8 = [(CHAddFriendViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  v9 = [(CHAddFriendViewController *)self recipientView];
  v10 = [v9 recipients];
  BOOL v11 = [v10 count] != 0;

  uint64_t v12 = [(CHAddFriendViewController *)self navigationItem];
  v13 = [v12 rightBarButtonItem];
  [v13 setEnabled:v11];

  id v14 = objc_alloc((Class)UIBarButtonItem);
  v15 = +[NSBundle mainBundle];
  uint64_t v16 = [v15 localizedStringForKey:@"SHARING_CANCEL" value:&stru_1008D8AB8 table:@"Localizable"];
  id v17 = [v14 initWithTitle:v16 style:0 target:self action:"_cancelButtonTapped:"];
  id v18 = [(CHAddFriendViewController *)self navigationItem];
  [v18 setLeftBarButtonItem:v17];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHAddFriendViewController;
  [(CHAddFriendViewController *)&v4 viewDidAppear:a3];
  [(CNComposeRecipientTextView *)self->_recipientView reflow];
  [(CHAddFriendViewController *)self _textFieldShouldBecomeFirstResponder];
}

- (void)viewWillLayoutSubviews
{
  double v3 = [(CHAddFriendViewController *)self recipientView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(CHAddFriendViewController *)self parentViewController];
  v9 = [v8 navigationBar];
  [v9 frame];
  double v11 = v10;

  uint64_t v12 = +[UIApplication sharedApplication];
  v13 = [v12 windows];
  id v14 = [v13 firstObject];
  v15 = [v14 windowScene];
  uint64_t v16 = [v15 statusBarManager];
  [v16 statusBarFrame];
  double v18 = v17;

  CGFloat v19 = v11 + v18;
  v20 = [(CHAddFriendViewController *)self view];
  [v20 bounds];
  double Width = CGRectGetWidth(v33);

  id v22 = [(CHAddFriendViewController *)self recipientView];
  [v22 setFrame:v5, v19, Width, v7];

  v23 = [(CHAddFriendViewController *)self tableView];
  [v23 frame];
  double v25 = v24;
  double v27 = v26;

  v34.origin.x = v5;
  v34.origin.double y = v19;
  v34.size.double width = Width;
  v34.size.double height = v7;
  double MaxY = CGRectGetMaxY(v34);
  v29 = [(CHAddFriendViewController *)self view];
  [v29 bounds];
  double v30 = CGRectGetWidth(v35);

  v31 = [(CHAddFriendViewController *)self tableView];
  [v31 setFrame:v25 MaxY:v30 v27];

  v32.receiver = self;
  v32.super_class = (Class)CHAddFriendViewController;
  [(CHAddFriendViewController *)&v32 viewWillLayoutSubviews];
}

- (void)_sendInviteToRecipientsByService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 1;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_100107624;
  v25[4] = sub_100107634;
  id v26 = 0;
  dispatch_group_t v8 = dispatch_group_create();
  v9 = HKCreateSerialDispatchQueue();
  double v10 = sub_10010763C();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001076A8;
  v18[3] = &unk_1008AC148;
  double v11 = v8;
  CGFloat v19 = v11;
  v20 = self;
  id v12 = v10;
  id v21 = v12;
  id v13 = v9;
  id v22 = v13;
  v23 = v27;
  double v24 = v25;
  [v6 enumerateKeysAndObjectsUsingBlock:v18];
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100107958;
    block[3] = &unk_1008AC170;
    id v15 = v7;
    uint64_t v16 = v27;
    double v17 = v25;
    dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
}

- (void)_doneButtonTapped:(id)a3
{
  id v4 = a3;
  double v5 = [(CHAddFriendViewController *)self recipientView];
  unsigned int v6 = [v5 finishEnteringRecipient];

  id v7 = [(CHAddFriendViewController *)self recipientView];
  dispatch_group_t v8 = [v7 recipients];
  v9 = (char *)[v8 count];

  [(CHAddFriendViewController *)self _dismissKeyboard:self];
  if ((uint64_t)&v9[v6] <= (uint64_t)[(ASFriendListSectionManager *)self->_friendListManager numberOfNewFriendsAllowed])
  {
    double v10 = [(CHAddFriendViewController *)self recipientView];
    double v11 = [v10 recipients];
    id v12 = [v11 count];

    if (v12)
    {
      id v13 = objc_alloc_init((Class)NSMutableSet);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v14 = [(CHAddFriendViewController *)self recipientView];
      id v15 = [v14 recipients];

      id v16 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v37;
        do
        {
          double v18 = 0;
          do
          {
            if (*(void *)v37 != v17) {
              objc_enumerationMutation(v15);
            }
            CGFloat v19 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)v18) address];
            [v13 addObject:v19];

            double v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          id v16 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v16);
      }

      v20 = [(CHAddFriendViewController *)self navigationItem];
      id v21 = [v20 rightBarButtonItem];
      [v21 setEnabled:0];

      objc_initWeak(&location, self);
      if (ASManateeContainerEnabled())
      {
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_100107DA0;
        v34[3] = &unk_1008AC198;
        v34[4] = self;
        id v22 = [v13 hk_filter:v34];
        invitationDestinationCoordinator = self->_invitationDestinationCoordinator;
        double v24 = [v22 allObjects];
        double v25 = sub_10010763C();
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100107DC4;
        v32[3] = &unk_1008ABB10;
        v32[4] = self;
        id v33 = v13;
        [(CHInvitationDestinationCoordinator *)invitationDestinationCoordinator sendInvitationToDestinations:v24 callerID:v25 completion:v32];
      }
      else
      {
        id v26 = objc_alloc_init((Class)NSMutableDictionary);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100108220;
        v28[3] = &unk_1008AC210;
        objc_copyWeak(&v31, &location);
        id v27 = v26;
        id v29 = v27;
        id v30 = v13;
        [(CHAddFriendViewController *)self _queryAllServicesForDestinations:v30 reachableUpdateHandler:0 completionHandler:v28];

        objc_destroyWeak(&v31);
      }
      objc_destroyWeak(&location);
    }
    else
    {
      [(CHAddFriendViewController *)self _dismissAndNotifyDelegate];
    }
  }
}

- (void)_populateSuggestedContactsWithReachability
{
  v2 = +[NSMutableDictionary dictionary];
  double v3 = +[NSMutableDictionary dictionary];
  id v4 = self;
  if ([(NSArray *)self->_searchResults count] >= 0x1A)
  {
    double v5 = -[NSArray subarrayWithRange:](self->_searchResults, "subarrayWithRange:", 0, 25);
    unsigned int v6 = (NSArray *)[v5 mutableCopy];
    searchResults = self->_searchResults;
    self->_searchResults = v6;

    id v4 = self;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obj = v4->_searchResults;
  id v32 = [(NSArray *)obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v51;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v51 != v31) {
          objc_enumerationMutation(obj);
        }
        v9 = [*(id *)(*((void *)&v50 + 1) + 8 * i) contact];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        double v10 = [v9 emailAddresses];
        id v11 = [v10 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v47;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v47 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = [*(id *)(*((void *)&v46 + 1) + 8 * (void)j) value];
              [v2 setObject:v9 forKeyedSubscript:v14];
            }
            id v11 = [v10 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }
          while (v11);
        }

        long long v44 = 0u;
        long long v45 = 0u;
        long long v43 = 0u;
        long long v42 = 0u;
        id v15 = [v9 phoneNumbers];
        id v16 = [v15 countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v43;
          do
          {
            for (k = 0; k != v16; k = (char *)k + 1)
            {
              if (*(void *)v43 != v17) {
                objc_enumerationMutation(v15);
              }
              CGFloat v19 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)k) value];
              v20 = [v19 stringValue];
              [v3 setObject:v9 forKeyedSubscript:v20];
            }
            id v16 = [v15 countByEnumeratingWithState:&v42 objects:v54 count:16];
          }
          while (v16);
        }
      }
      id v32 = [(NSArray *)obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v32);
  }

  id v21 = [v2 allKeys];
  id v22 = [v3 allKeys];
  v23 = [v21 arrayByAddingObjectsFromArray:v22];
  double v24 = +[NSSet setWithArray:v23];

  double v25 = +[NSMutableArray array];
  reachableSuggestedContacts = self->_reachableSuggestedContacts;
  self->_reachableSuggestedContacts = v25;

  [(CHAddFriendViewController *)self _setShowSuggestions:1];
  self->_finishedPopulatingSuggestions = 1;
  [(CNAutocompleteSearchManager *)self->_searchManager setSearchTypes:19];
  if ([v24 count])
  {
    if (ASManateeContainerEnabled())
    {
      invitationDestinationCoordinator = self->_invitationDestinationCoordinator;
      char v28 = [v24 allObjects];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100108F9C;
      v38[3] = &unk_1008AC238;
      id v39 = v2;
      id v40 = v3;
      v41 = self;
      [(CHInvitationDestinationCoordinator *)invitationDestinationCoordinator fetchReachableDestinationsFor:v28 completion:v38];
    }
    else
    {
      objc_initWeak(&location, self);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100109250;
      v33[3] = &unk_1008AC260;
      objc_copyWeak(&v36, &location);
      id v34 = v2;
      id v35 = v3;
      [(CHAddFriendViewController *)self _queryAllServicesForDestinations:v24 reachableUpdateHandler:v33 completionHandler:0];

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_dismissKeyboard:(id)a3
{
}

- (void)_cancelButtonTapped:(id)a3
{
  [(CHAddFriendViewController *)self _dismissKeyboard:self];

  [(CHAddFriendViewController *)self _dismissAndNotifyDelegate];
}

- (void)_addContact:(id)a3
{
  id v4 = [(CHAddFriendViewController *)self recipientView];
  [(CHAddFriendViewController *)self composeRecipientViewRequestAddRecipient:v4];
}

- (void)_textFieldShouldBecomeFirstResponder
{
  id v3 = [(CHAddFriendViewController *)self recipientView];
  v2 = [v3 textView];
  [v2 becomeFirstResponder];
}

- (void)_textFieldShouldResignFirstResponder
{
  id v3 = [(CHAddFriendViewController *)self recipientView];
  v2 = [v3 textView];
  [v2 resignFirstResponder];
}

- (void)_resetSearchResults
{
}

- (id)_recipientFromDestination:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = [(CHAddFriendViewController *)self recipientView];
  unsigned int v6 = [v5 recipients];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 address];
        unsigned int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (unint64_t)_guessedKindForString:(id)a3
{
  id v3 = a3;
  if (([v3 containsString:@"@"] & 1) != 0
    || ([v3 containsString:@"mailto:"] & 1) != 0)
  {
    unint64_t v4 = 0;
  }
  else if (([v3 containsString:@"tel:"] & 1) != 0 {
         || (+[NSCharacterSet decimalDigitCharacterSet],
  }
             double v5 = objc_claimAutoreleasedReturnValue(),
             id v6 = [v3 rangeOfCharacterFromSet:v5],
             v5,
             v6 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v4 = 1;
  }
  else
  {
    unint64_t v4 = 5;
  }

  return v4;
}

- (id)_createPeoplePicker
{
  id v3 = objc_alloc_init((Class)CNContactPickerViewController);
  [v3 setDelegate:self];
  [v3 setHidesPromptInLandscape:1];
  [v3 setAllowsEditing:1];
  [v3 setAllowsCancel:1];
  v20[0] = CNContactEmailAddressesKey;
  v20[1] = CNContactPhoneNumbersKey;
  unint64_t v4 = +[NSArray arrayWithObjects:v20 count:2];
  [v3 setDisplayedPropertyKeys:v4];
  double v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = +[NSPredicate predicateWithFormat:@"%K.@count > 0", *(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  unsigned int v12 = +[NSPredicate predicateWithValue:0];
  [v3 setPredicateForSelectionOfContact:v12];

  id v13 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];
  [v3 setPredicateForEnablingContact:v13];

  [v3 setModalPresentationStyle:3];
  [v3 _setAllowsAutorotation:0];

  return v3;
}

- (void)_dismissAndNotifyDelegate
{
  id v3 = [(CHAddFriendViewController *)self parentViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  unint64_t v4 = [(CHAddFriendViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CHAddFriendViewController *)self delegate];
    [v6 addFriendViewControllerDidDismiss:self];
  }
}

- (void)_searchForRecipientWithText:(id)a3
{
  id v10 = a3;
  [(CHAddFriendViewController *)self _resetSearchResults];
  if (!self->_currentSearchTaskID
    || self->_finishedPopulatingSuggestions
    && (-[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:"),
        unint64_t v4 = self->_currentSearchTaskID,
        self->_currentSearchTaskID = 0,
        v4,
        !self->_currentSearchTaskID))
  {
    char v5 = [(CNComposeRecipientTextView *)self->_recipientView uncommentedAddresses];
    id v6 = [v5 arrayByAddingObjectsFromArray:self->_currentAccountAddresses];

    if (self->_currentFriendDestinations && !self->_finishedPopulatingSuggestions)
    {
      uint64_t v7 = [v6 arrayByAddingObjectsFromArray:];

      id v6 = (void *)v7;
    }
    [(CNAutocompleteFetchContext *)self->_context setOtherAddressesAlreadyChosen:v6];
    id v8 = [(CNAutocompleteSearchManager *)self->_searchManager searchForText:v10 withAutocompleteFetchContext:self->_context consumer:self];
    currentSearchTaskID = self->_currentSearchTaskID;
    self->_currentSearchTaskID = v8;
  }
}

- (id)_destinationAddressesForCurrentAccount
{
  id v2 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2];
  id v3 = objc_alloc_init((Class)ACAccountStore);
  uint64_t v4 = [v3 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierCloudKit];
  v23 = v3;
  [v3 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierIdentityServices];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v20 = long long v31 = 0u;
  id v21 = (void *)v4;
  v33[0] = v4;
  v33[1] = v20;
  id obj = +[NSArray arrayWithObjects:v33 count:2];
  id v5 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [v23 accountsWithAccountType:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v25;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
              long long v15 = [v14 username];

              if (v15)
              {
                long long v16 = [v14 username];
                [v2 addObject:v16];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v11);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v6);
  }

  long long v17 = sub_10010763C();
  if (v17) {
    [v2 addObject:v17];
  }
  long long v18 = [v2 allObjects];

  return v18;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
}

- (void)finishedSearchingForAutocompleteResults
{
  id v3 = (NSArray *)[(NSMutableArray *)self->_pendingSearchResults copy];
  searchResults = self->_searchResults;
  self->_searchResults = v3;

  if (!self->_finishedPopulatingSuggestions) {
    [(CHAddFriendViewController *)self _populateSuggestedContactsWithReachability];
  }
  tableView = self->_tableView;

  [(UITableView *)tableView reloadData];
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)removeRecipient:(id)a3
{
}

- (id)_preferredServiceIdentifierForDestination:(id)a3 inReachableDestinationsByService:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)kASiCloudServiceIdentifier;
  id v8 = [v6 objectForKeyedSubscript:kASiCloudServiceIdentifier];
  unsigned __int8 v9 = [v8 containsObject:v5];

  if ((v9 & 1) != 0
    || (uint64_t v7 = (void *)kASiMessageServiceIdentifier,
        [v6 objectForKeyedSubscript:kASiMessageServiceIdentifier],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v10 containsObject:v5],
        v10,
        v11))
  {
    id v12 = v7;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_queryAllServicesForDestinations:(id)a3 reachableUpdateHandler:(id)a4 completionHandler:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v16 = a5;
  unsigned __int8 v9 = dispatch_group_create();
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = self->_reachabilityManagers;
  id v11 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        dispatch_group_enter(v9);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10010A210;
        v25[3] = &unk_1008AC2D8;
        v25[4] = v15;
        id v26 = v10;
        id v27 = v8;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        void v23[2] = sub_10010A5E4;
        v23[3] = &unk_1008AC300;
        long long v24 = v9;
        [v15 queryDestinations:v18 updateHandler:v25 completionHandler:v23];
      }
      id v12 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  if (v16)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010A5EC;
    block[3] = &unk_1008AC350;
    id v20 = v10;
    id v21 = self;
    id v22 = v16;
    dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_checkReachableForContact:(id)a3 withDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CHAddFriendViewController *)self recipientView];
  unsigned __int8 v9 = [v8 atomViewForRecipient:v7];

  id v10 = +[UIColor darkGrayColor];
  [v9 setBackgroundColor:v10];

  id v11 = +[UIColor grayColor];
  [v9 setTintColor:v11];

  id v12 = +[UIApplication sharedApplication];
  uint64_t v13 = [v12 windows];
  long long v14 = [v13 firstObject];
  long long v15 = [v14 tintColor];

  id v16 = +[NSSet setWithObject:v6];
  if (ASManateeContainerEnabled())
  {
    invitationDestinationCoordinator = self->_invitationDestinationCoordinator;
    id v18 = [v16 allObjects];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10010AAA0;
    v28[3] = &unk_1008AC238;
    CGFloat v19 = &v29;
    id v20 = &v30;
    id v29 = v6;
    long long v30 = v9;
    id v31 = v15;
    id v21 = v15;
    id v22 = v9;
    [(CHInvitationDestinationCoordinator *)invitationDestinationCoordinator fetchReachableDestinationsFor:v18 completion:v28];
  }
  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10010ABCC;
    v25[3] = &unk_1008AC378;
    CGFloat v19 = &v26;
    id v20 = &v27;
    id v26 = v9;
    id v27 = v15;
    id v23 = v15;
    id v24 = v9;
    [(CHAddFriendViewController *)self _queryAllServicesForDestinations:v16 reachableUpdateHandler:v25 completionHandler:0];
  }
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  id v5 = [(CHAddFriendViewController *)self composeInputLineHeight];
  [v5 setConstant:height];
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  [(CNComposeRecipientTextView *)self->_recipientView clearText];
  id v4 = [(CHAddFriendViewController *)self parentViewController];
  [v4 presentViewController:self->_peoplePicker animated:1 completion:0];
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v7 = a4;
  if ([v7 length])
  {
    if (self->_showSuggestions) {
      [(CHAddFriendViewController *)self _setShowSuggestions:0];
    }
    [(CHAddFriendViewController *)self _searchForRecipientWithText:v7];
  }
  else
  {
    [(CHAddFriendViewController *)self _setShowSuggestions:1];
    [(CHAddFriendViewController *)self _resetSearchResults];
    id v5 = (NSArray *)[(NSMutableArray *)self->_pendingSearchResults copy];
    searchResults = self->_searchResults;
    self->_searchResults = v5;

    [(UITableView *)self->_tableView reloadData];
  }
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [v18 recipients];
  id v8 = [v7 count];

  if (v8)
  {
    unsigned __int8 v9 = [(CHAddFriendViewController *)self navigationItem];
    id v10 = [v9 rightBarButtonItem];
    [v10 setEnabled:1];
  }
  id v11 = [v18 recipients];
  id v12 = [v11 count];
  id v13 = [(ASFriendListSectionManager *)self->_friendListManager numberOfNewFriendsAllowed];

  if (v12 <= v13)
  {
    long long v17 = [v6 address];
    [(CHAddFriendViewController *)self _checkReachableForContact:v6 withDestination:v17];

    [(CHAddFriendViewController *)self _refilterShownContacts];
  }
  else
  {
    long long v14 = sub_10014ADC4();
    long long v15 = [(CHAddFriendViewController *)self recipientView];
    [v15 removeRecipient:v6];

    id v16 = [(CHAddFriendViewController *)self parentViewController];
    [v16 presentViewController:v14 animated:1 completion:0];
  }
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v5 = [a3 recipients];
  id v6 = [v5 count];

  if (!v6)
  {
    id v7 = [(CHAddFriendViewController *)self navigationItem];
    id v8 = [v7 rightBarButtonItem];
    [v8 setEnabled:0];
  }

  [(CHAddFriendViewController *)self _refilterShownContacts];
}

- (void)_mergeRecipient:(id)a3
{
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = self;
  id v5 = [(CHAddFriendViewController *)self recipientView];
  id v6 = [v5 recipients];

  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v7)
  {
    unsigned __int8 v9 = 0;
    goto LABEL_24;
  }
  id v8 = v7;
  unsigned __int8 v9 = 0;
  id obj = v6;
  uint64_t v23 = *(void *)v25;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v25 != v23) {
      objc_enumerationMutation(obj);
    }
    id v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
    id v12 = [v4 address];
    id v13 = [v11 address];
    long long v14 = [v4 contact];
    long long v15 = [v11 contact];
    if (([v11 isEqual:v4] & 1) != 0
      || ([v13 isEqualToString:v12] & 1) != 0
      || v15
      && ([(CHAddFriendViewController *)v21 _contact:v15 hasEmailDestination:v12]
       || [(CHAddFriendViewController *)v21 _contact:v15 hasPhoneNumberDestination:v12]))
    {
      goto LABEL_14;
    }
    if (v14
      && ([(CHAddFriendViewController *)v21 _contact:v14 hasEmailDestination:v13]
       || [(CHAddFriendViewController *)v21 _contact:v14 hasPhoneNumberDestination:v13]))
    {
LABEL_14:
      id v16 = v11;

      int v17 = 0;
      unsigned __int8 v9 = v16;
    }
    else
    {
      int v17 = 1;
    }

    if (!v17) {
      break;
    }
    if (v8 == (id)++v10)
    {
      id v18 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v8 = v18;
      if (v18) {
        goto LABEL_3;
      }
      break;
    }
  }

  if (!v9) {
    goto LABEL_25;
  }
  CGFloat v19 = [v4 contact];

  if (v19)
  {
    id v6 = [(CHAddFriendViewController *)v21 recipientView];
    [v6 removeRecipient:v9];
LABEL_24:

LABEL_25:
    id v20 = [(CHAddFriendViewController *)v21 recipientView];
    [v20 addRecipient:v4];
  }
}

- (BOOL)_contact:(id)a3 hasEmailDestination:(id)a4
{
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [a3 emailAddresses];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) value];
        unsigned __int8 v11 = [v10 isEqualToString:v5];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (BOOL)_contact:(id)a3 hasPhoneNumberDestination:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)CNPhoneNumber) initWithStringValue:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v5 phoneNumbers];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) value];
        unsigned __int8 v13 = [v7 isLikePhoneNumber:v12];

        if (v13)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v9;
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v11 = a4;
  id v5 = [v11 destinationStripped];
  if ([v5 length]
    && (([v11 isPhoneNumber] & 1) != 0 || objc_msgSend(v11, "isEmail")))
  {
    id v6 = [objc_alloc((Class)CNComposeRecipient) initWithContact:0 address:v5 kind:[self _guessedKindForString:v5]];
    [(CHAddFriendViewController *)self _mergeRecipient:v6];
    id v7 = [(CHAddFriendViewController *)self recipientView];
    [v7 clearText];

    uint64_t v8 = [(CHAddFriendViewController *)self recipientView];
    id v9 = [v8 delegate];
    uint64_t v10 = [(CHAddFriendViewController *)self recipientView];
    [v9 composeRecipientView:v10 textDidChange:&stru_1008D8AB8];
  }
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v16 = a4;
  id v6 = a3;
  id v7 = [v16 key];
  unsigned __int8 v8 = [v7 isEqualToString:CNContactEmailAddressesKey];

  id v9 = [v16 value];
  uint64_t v10 = v9;
  if (v8)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = [v9 stringValue];

    uint64_t v11 = 1;
    uint64_t v10 = (void *)v12;
  }
  [v6 dismissViewControllerAnimated:1 completion:0];

  id v13 = objc_alloc((Class)CNComposeRecipient);
  long long v14 = [v16 contact];
  id v15 = [v13 initWithContact:v14 address:v10 kind:v11];

  [(CHAddFriendViewController *)self _mergeRecipient:v15];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v15 = a4;
  id v6 = a3;
  id v7 = [v15 emailAddresses];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = [v15 emailAddresses];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v10 value];
    uint64_t v12 = 0;
  }
  else
  {
    id v9 = [v15 phoneNumbers];
    uint64_t v10 = [v9 firstObject];
    id v13 = [v10 value];
    uint64_t v11 = [v13 stringValue];

    uint64_t v12 = 1;
  }

  [v6 dismissViewControllerAnimated:1 completion:0];
  id v14 = [objc_alloc((Class)CNComposeRecipient) initWithContact:v15 address:v11 kind:v12];
  [(CHAddFriendViewController *)self _mergeRecipient:v14];
}

- (void)_addSuggestedContact:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  reachableSuggestedContacts = self->_reachableSuggestedContacts;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_10010B8F0;
  uint64_t v10 = &unk_1008AC3A0;
  uint64_t v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  [(NSMutableArray *)reachableSuggestedContacts enumerateObjectsUsingBlock:&v7];
  if (!*((unsigned char *)v14 + 24)) {
    -[NSMutableArray addObject:](self->_reachableSuggestedContacts, "addObject:", v6, v7, v8, v9, v10);
  }

  _Block_object_dispose(&v13, 8);
}

- (void)_setShowSuggestions:(BOOL)a3
{
  self->_showSuggestions = a3;
  if (a3)
  {
    id v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v5 = [(CHAddFriendViewController *)self tableView];
    [v5 setTableFooterView:v4];

    id v6 = [(CHAddFriendViewController *)self tableView];
    [v6 setSeparatorStyle:0];

    id v7 = [(CHAddFriendViewController *)self tableView];
    uint64_t v8 = +[UIColor clearColor];
    [v7 setSeparatorColor:v8];

    reachableSuggestedContacts = self->_reachableSuggestedContacts;
  }
  else
  {
    uint64_t v10 = [(CHAddFriendViewController *)self tableView];
    [v10 setTableFooterView:0];

    id v11 = [(CHAddFriendViewController *)self tableView];
    [v11 setSeparatorStyle:1];

    uint64_t v12 = [(CHAddFriendViewController *)self tableView];
    [v12 setSeparatorColor:self->_separatorColor];

    reachableSuggestedContacts = (NSMutableArray *)&__NSArray0__struct;
  }

  [(CHAddFriendViewController *)self setShownContacts:reachableSuggestedContacts];
}

- (void)setShownContacts:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_shownContacts, "isEqualToArray:"))
  {
    id v4 = (NSArray *)[v6 copy];
    shownContacts = self->_shownContacts;
    self->_shownContacts = v4;

    [(CHAddFriendViewController *)self _refilterShownContacts];
  }
}

- (void)_refilterShownContacts
{
  id v3 = [(NSArray *)self->_shownContacts filteredArrayUsingPredicate:self->_recipientArrayFilterPredicate];
  unselectedShownContacts = self->_unselectedShownContacts;
  self->_unselectedShownContacts = v3;

  id v5 = [(NSArray *)self->_unselectedShownContacts sortedArrayUsingComparator:&stru_1008AC3E0];
  id v6 = self->_unselectedShownContacts;
  self->_unselectedShownContacts = v5;

  id v7 = [(CHAddFriendViewController *)self tableView];
  [v7 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_showSuggestions)
  {
    int64_t result = [(NSArray *)self->_unselectedShownContacts count];
    if ((unint64_t)result <= 1) {
      return 1;
    }
  }
  else
  {
    searchResults = self->_searchResults;
    return [(NSArray *)searchResults count];
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_showSuggestions)
  {
    if ([(NSArray *)self->_unselectedShownContacts count])
    {
      uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"SuggestedContactCellReuseIdentifier"];
      if (!v8)
      {
        uint64_t v8 = (CHRecipientTableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"SuggestedContactCellReuseIdentifier"];
        id v9 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
        [v9 setBackgroundColor:self->_separatorColor];
        [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
        uint64_t v10 = [(CHRecipientTableViewCell *)v8 contentView];
        [v10 addSubview:v9];

        CFStringRef v49 = @"inset";
        [v6 separatorInset];
        long long v48 = +[NSNumber numberWithDouble:v11];
        long long v50 = v48;
        uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
        _NSDictionaryOfVariableBindings(@"separatorView", v9, 0);
        uint64_t v13 = v47 = v7;
        +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(inset)-[separatorView]|", 0, v12, v13);
        v15 = id v14 = v6;
        +[NSLayoutConstraint activateConstraints:v15];

        id v6 = v14;
        id v7 = v47;

        char v16 = _NSDictionaryOfVariableBindings(@"separatorView", v9, 0);
        long long v17 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[separatorView]|" options:0 metrics:0 views:v16];
        +[NSLayoutConstraint activateConstraints:v17];

        long long v18 = [v9 heightAnchor];
        CGFloat v19 = [v18 constraintEqualToConstant:0.5];
        [v19 setActive:1];
      }
      id v20 = -[NSArray objectAtIndexedSubscript:](self->_unselectedShownContacts, "objectAtIndexedSubscript:", [v7 row]);
      id v21 = [v20 contact];
      id v22 = +[CNContactFormatter stringFromContact:v21 style:0];
      uint64_t v23 = [(CHRecipientTableViewCell *)v8 textLabel];
      [v23 setText:v22];

      long long v24 = [v20 reachableEmailAddress];

      if (v24)
      {
        long long v25 = [v20 reachableEmailAddress];
        long long v26 = [(CHRecipientTableViewCell *)v8 detailTextLabel];
        [v26 setText:v25];
      }
      else
      {
        long long v25 = [v20 reachablePhoneNumber];
        long long v26 = sub_100106E48(v25);
        id v32 = [(CHRecipientTableViewCell *)v8 detailTextLabel];
        [v32 setText:v26];
      }
      if (self->_showSuggestions)
      {
        monogrammer = self->_monogrammer;
        id v34 = [v20 contact];
        id v35 = [(CNMonogrammer *)monogrammer monogramForContact:v34];
        id v36 = [(CHRecipientTableViewCell *)v8 imageView];
        [v36 setImage:v35];
      }
      else
      {
        id v34 = [(CHRecipientTableViewCell *)v8 imageView];
        [v34 setImage:0];
      }

      long long v37 = +[ARUIMetricColors keyColors];
      long long v38 = [v37 nonGradientTextColor];
      id v39 = [(CHRecipientTableViewCell *)v8 textLabel];
      [v39 setTextColor:v38];

      id v40 = [(CHRecipientTableViewCell *)v8 textLabel];
      v41 = [v40 textColor];
      long long v42 = [(CHRecipientTableViewCell *)v8 detailTextLabel];
      [v42 setTextColor:v41];

      [(CHRecipientTableViewCell *)v8 setSelectionStyle:3];
    }
    else if (self->_showSuggestions)
    {
      uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"NoSuggestedContactsCellReuseIdentifier"];
      if (!v8) {
        uint64_t v8 = (CHRecipientTableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"NoSuggestedContactsCellReuseIdentifier"];
      }
      long long v28 = [(CHAddFriendViewController *)self _noSuggestionString];
      id v29 = [(CHRecipientTableViewCell *)v8 textLabel];
      [v29 setAttributedText:v28];

      long long v30 = [(CHRecipientTableViewCell *)v8 textLabel];
      [v30 setNumberOfLines:0];

      id v31 = [(CHRecipientTableViewCell *)v8 textLabel];
      [v31 setTextAlignment:1];

      [(CHRecipientTableViewCell *)v8 setSelectionStyle:0];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    if ([(NSArray *)self->_searchResults count])
    {
      long long v27 = -[NSArray objectAtIndex:](self->_searchResults, "objectAtIndex:", [v7 row]);
    }
    else
    {
      long long v27 = 0;
    }
    long long v43 = +[CHRecipientTableViewCell identifier];
    uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:v43];

    if (!v8)
    {
      long long v44 = [CHRecipientTableViewCell alloc];
      long long v45 = +[CHRecipientTableViewCell identifier];
      uint64_t v8 = [(CHRecipientTableViewCell *)v44 initWithStyle:3 reuseIdentifier:v45];

      [(CHRecipientTableViewCell *)v8 setOpaque:0];
    }
    [(CHRecipientTableViewCell *)v8 setRecipient:v27];
  }

  return v8;
}

- (BOOL)_isContactsAccessAuthorized
{
  return (id)+[CNContactStore authorizationStatusForEntityType:0] == (id)3;
}

- (id)_noSuggestionString
{
  NSAttributedStringKey v20 = NSForegroundColorAttributeName;
  id v3 = +[UIColor lightTextColor];
  id v21 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  if ([(CHAddFriendViewController *)self _isContactsAccessAuthorized])
  {
    id v5 = objc_alloc((Class)NSAttributedString);
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"SHARING_NO_SUGGESTED" value:&stru_1008D8AB8 table:@"Localizable"];
    id v8 = [v5 initWithString:v7 attributes:v4];
  }
  else
  {
    id v9 = +[NSBundle mainBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"SHARING_NO_CONTACTS_ACCESS" value:&stru_1008D8AB8 table:@"Localizable"];
    double v11 = +[NSBundle mainBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"SHARING_NO_CONTACTS_ACCESS_SETTINGS" value:&stru_1008D8AB8 table:@"Localizable"];
    id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12);

    id v8 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v6 attributes:v4];
    uint64_t v13 = +[NSBundle mainBundle];
    id v14 = [v13 localizedStringForKey:@"SHARING_NO_CONTACTS_ACCESS_SETTINGS" value:&stru_1008D8AB8 table:@"Localizable"];
    id v15 = [v6 rangeOfString:v14];
    uint64_t v17 = v16;

    id v7 = +[ARUIMetricColors keyColors];
    long long v18 = [v7 nonGradientTextColor];
    [v8 addAttribute:NSForegroundColorAttributeName value:v18 range:v15, v17];
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (!self->_showSuggestions)
  {
    unint64_t v7 = [(NSArray *)self->_searchResults count];
    if (v7 > (unint64_t)[v6 row])
    {
      -[NSArray objectAtIndexedSubscript:](self->_searchResults, "objectAtIndexedSubscript:", [v6 row]);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = [(CHAddFriendViewController *)self recipientView];
      [v9 clearText];

      uint64_t v10 = [(CHAddFriendViewController *)self recipientView];
      [v10 addRecipient:v8];

      [(CHAddFriendViewController *)self _setShowSuggestions:1];
      [v19 reloadData];
LABEL_12:

      goto LABEL_13;
    }
  }
  unint64_t v11 = [(NSArray *)self->_unselectedShownContacts count];
  if (v11 > (unint64_t)[v6 row])
  {
    -[NSArray objectAtIndexedSubscript:](self->_unselectedShownContacts, "objectAtIndexedSubscript:", [v6 row]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v8 reachableEmailAddress];

    if (v12)
    {
      uint64_t v13 = [v8 reachableEmailAddress];
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v13 = [v8 reachablePhoneNumber];
      uint64_t v14 = 1;
    }
    id v16 = objc_alloc((Class)CNComposeRecipient);
    uint64_t v17 = [v8 contact];
    id v18 = [v16 initWithContact:v17 address:v13 kind:v14];

    [(CHAddFriendViewController *)self _mergeRecipient:v18];
    goto LABEL_12;
  }
  if (self->_showSuggestions
    && ![(CHAddFriendViewController *)self _isContactsAccessAuthorized])
  {
    id v8 = [objc_alloc((Class)NSURL) initWithString:@"prefs:root=Privacy&path=CONTACTS"];
    id v15 = +[LSApplicationWorkspace defaultWorkspace];
    [v15 openSensitiveURL:v8 withOptions:&__NSDictionary0__struct];

    goto LABEL_12;
  }
LABEL_13:
  [v19 deselectRowAtIndexPath:v6 animated:1];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (self->_showSuggestions)
  {
    id v5 = a3;
    id v6 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    unint64_t v11 = [v5 backgroundColor];
    [v10 setBackgroundColor:v11];

    uint64_t v12 = objc_opt_new();
    id v13 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v13 setBackgroundColor:self->_separatorColor];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 addSubview:v13];
    CFStringRef v38 = @"inset";
    [v5 separatorInset];
    double v15 = v14;

    id v16 = +[NSNumber numberWithDouble:v15];
    id v39 = v16;
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    id v18 = _NSDictionaryOfVariableBindings(@"separatorView", v13, 0);
    id v19 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(inset)-[separatorView]|", 0, v17, v18);
    [v12 addObjectsFromArray:v19];

    NSAttributedStringKey v20 = [v13 heightAnchor];
    id v21 = [v20 constraintEqualToConstant:0.5];
    [v12 addObject:v21];

    id v22 = [v13 bottomAnchor];
    uint64_t v23 = [v10 bottomAnchor];
    long long v24 = [v22 constraintEqualToAnchor:v23];
    [v12 addObject:v24];

    id v25 = objc_alloc_init((Class)UILabel);
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v25 setNumberOfLines:0];
    long long v26 = +[NSBundle mainBundle];
    long long v27 = [v26 localizedStringForKey:@"SHARE_SUGGESTED" value:&stru_1008D8AB8 table:@"Localizable"];
    [v25 setText:v27];

    long long v28 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [v25 setFont:v28];

    [v10 addSubview:v25];
    id v29 = _NSDictionaryOfVariableBindings(@"headerLabel", v25, 0);
    long long v30 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[headerLabel]-|", 0, 0, v29);
    [v12 addObjectsFromArray:v30];

    id v31 = [v25 leadingAnchor];
    id v32 = [v13 leadingAnchor];
    id v33 = [v31 constraintEqualToAnchor:v32];
    [v12 addObject:v33];

    id v34 = [v25 trailingAnchor];
    id v35 = [v10 trailingAnchor];
    id v36 = [v34 constraintLessThanOrEqualToSystemSpacingAfterAnchor:v35 multiplier:1.0];
    [v12 addObject:v36];

    +[NSLayoutConstraint activateConstraints:v12];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = UITableViewAutomaticDimension;
  if (!self->_showSuggestions) {
    return 0.0;
  }
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_showSuggestions || ![(NSArray *)self->_searchResults count])
  {
    if ([(NSArray *)self->_unselectedShownContacts count]) {
      double v8 = UITableViewAutomaticDimension;
    }
    else {
      double v8 = 196.0;
    }
  }
  else
  {
    double v8 = 56.0;
  }

  return v8;
}

- (BOOL)_destinationMatchesCurrentAccountDestination:(id)a3
{
  id v4 = ASContactSanitizedDestination();
  LOBYTE(self) = [(NSArray *)self->_currentAccountAddresses containsObject:v4];

  return (char)self;
}

- (CHAddFriendViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHAddFriendViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNComposeRecipientTextView)recipientView
{
  return self->_recipientView;
}

- (void)setRecipientView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)shownContacts
{
  return self->_shownContacts;
}

- (NSLayoutConstraint)composeInputLineHeight
{
  return self->_composeInputLineHeight;
}

- (void)setComposeInputLineHeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeInputLineHeight, 0);
  objc_storeStrong((id *)&self->_shownContacts, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_recipientView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invitationDestinationCoordinator, 0);
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);
  objc_storeStrong((id *)&self->_friendListManager, 0);
  objc_storeStrong((id *)&self->_currentAccountAddresses, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_pendingSearchResults, 0);
  objc_storeStrong((id *)&self->_currentSearchTaskID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_peoplePicker, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_recipientArrayFilterPredicate, 0);
  objc_storeStrong((id *)&self->_currentFriendDestinations, 0);
  objc_storeStrong((id *)&self->_unselectedShownContacts, 0);
  objc_storeStrong((id *)&self->_reachableSuggestedContacts, 0);

  objc_storeStrong((id *)&self->_reachabilityManagers, 0);
}

@end