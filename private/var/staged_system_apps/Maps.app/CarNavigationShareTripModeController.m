@interface CarNavigationShareTripModeController
+ (void)attemptToStartShareWithContact:(id)a3 sharingIdentity:(id)a4 interruptPresenter:(id)a5 completion:(id)a6;
- (BOOL)invalidAfterDisconnect;
- (BOOL)shouldAllowKnobFocusMovement;
- (BOOL)showsMapView;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CarNavigationShareTripModeController)init;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredCarFocusEnvironments;
- (NSArray)preferredFocusEnvironments;
- (id)desiredCards;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5;
- (int)backButtonUsageActionToMode:(id)a3;
- (int)currentUsageTarget;
- (int64_t)accessoriesHidingBehavior;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_attemptToStartShareWithContact:(id)a3;
- (void)_cancelDismiss;
- (void)_closeResultsController;
- (void)_commitPendingShares;
- (void)_dismissAfterDelay;
- (void)_displayContactResults:(id)a3 withTitle:(id)a4;
- (void)_externalDeviceUpdated:(id)a3;
- (void)_handleContactSearchResults:(id)a3 query:(id)a4;
- (void)_requestDictation;
- (void)_requestKeyboardInputUsingInteractionModel:(unint64_t)a3;
- (void)_setupTableFooterView;
- (void)_setupTableHeaderView;
- (void)_toggleSharingForContactAtIndexPath:(id)a3;
- (void)_updateSharingFooterWithIdentity:(id)a3;
- (void)_updateSizeOfView:(id)a3;
- (void)_updateWithSharingIdentity:(id)a3;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4;
- (void)carCardViewCloseButtonTapped:(id)a3;
- (void)carShareTripContactCellDidFinishRingAnimation:(id)a3;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4;
- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)userInputCell:(id)a3 didSelectAction:(unint64_t)a4 usingInteractionModel:(unint64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CarNavigationShareTripModeController

- (CarNavigationShareTripModeController)init
{
  v8.receiver = self;
  v8.super_class = (Class)CarNavigationShareTripModeController;
  v2 = [(CarNavigationShareTripModeController *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cellsByContactStringValue = v2->_cellsByContactStringValue;
    v2->_cellsByContactStringValue = v3;

    v5 = [[SharedTripSuggestionsDataSource alloc] initWithSoftCellCap:+[CarDisplayController maximumListLength] includeActiveContacts:1];
    dataSource = v2->_dataSource;
    v2->_dataSource = v5;

    [(SharedTripSuggestionsDataSource *)v2->_dataSource setShowContactSearchItem:GEOConfigGetBOOL()];
    [(SharedTripSuggestionsDataSource *)v2->_dataSource setContactSearchItemPosition:2];
    v2->_userInteracted = 0;
  }
  return v2;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)CarNavigationShareTripModeController;
  [(CarNavigationShareTripModeController *)&v25 viewDidLoad];
  v3 = [(CarNavigationShareTripModeController *)self view];
  v4 = [CarTableView alloc];
  v5 = [(CarNavigationShareTripModeController *)self view];
  [v5 bounds];
  v6 = -[CarTableView initWithFrame:style:](v4, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v6;

  [(CarTableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CarTableView *)self->_tableView setDelegate:self];
  [(CarTableView *)self->_tableView setDataSource:self];
  objc_super v8 = +[UIColor clearColor];
  [(CarTableView *)self->_tableView setBackgroundColor:v8];

  [(CarTableView *)self->_tableView setRowHeight:UITableViewAutomaticDimension];
  [v3 addSubview:self->_tableView];
  v23 = [(CarTableView *)self->_tableView topAnchor];
  v22 = [v3 topAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v26[0] = v21;
  v20 = [(CarTableView *)self->_tableView leadingAnchor];
  v9 = [v3 leadingAnchor];
  v10 = [v20 constraintEqualToAnchor:v9];
  v26[1] = v10;
  v11 = [v3 trailingAnchor];
  v12 = [(CarTableView *)self->_tableView trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v26[2] = v13;
  v24 = v3;
  v14 = [v3 bottomAnchor];
  v15 = [(CarTableView *)self->_tableView bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v26[3] = v16;
  v17 = +[NSArray arrayWithObjects:v26 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  [(CarNavigationShareTripModeController *)self _setupTableHeaderView];
  [(CarNavigationShareTripModeController *)self _setupTableFooterView];
  if ([(SharedTripSuggestionsDataSource *)self->_dataSource showsContactSearchItem])
  {
    v18 = [[CarUserInputCell alloc] initWithStyle:0 reuseIdentifier:0];
    userInputCell = self->_userInputCell;
    self->_userInputCell = v18;

    [(CarUserInputCell *)self->_userInputCell setSelectionStyle:0];
    [(CarUserInputCell *)self->_userInputCell setDelegate:self];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CarNavigationShareTripModeController;
  [(CarNavigationShareTripModeController *)&v7 viewDidAppear:a3];
  v4 = [(CarNavigationShareTripModeController *)self chromeViewController];
  unsigned int v5 = [v4 isCurrentContext:self];

  if (v5) {
    [(SharedTripSuggestionsDataSource *)self->_dataSource addTableView:self->_tableView cellProvider:self];
  }
  v6 = [(CarNavigationShareTripModeController *)self view];
  [v6 layoutIfNeeded];
}

- (void)_setupTableHeaderView
{
  if ([(CarNavigationShareTripModeController *)self isViewLoaded])
  {
    id v3 = objc_alloc((Class)UIView);
    v4 = [(CarNavigationShareTripModeController *)self view];
    [v4 bounds];
    id v16 = [v3 initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(v18), 1.79769313e308)];

    [v16 setAutoresizingMask:34];
    LODWORD(v5) = 1148846080;
    [v16 setContentCompressionResistancePriority:1 forAxis:v5];
    LODWORD(v6) = 1148846080;
    [v16 setContentHuggingPriority:1 forAxis:v6];
    id v7 = objc_alloc((Class)UILabel);
    [v16 bounds];
    id v8 = [v7 initWithFrame:];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    [v8 setFont:v9];

    v10 = +[UIColor _carSystemPrimaryColor];
    [v8 setTextColor:v10];

    [v8 setNumberOfLines:0];
    [v8 setLineBreakMode:0];
    v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"CarPlay_ShareTrip_SharingDescription" value:@"localized string not found" table:0];
    [v8 setText:v12];

    LODWORD(v13) = 1148846080;
    [v8 setContentHuggingPriority:1 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [v8 setContentCompressionResistancePriority:1 forAxis:v14];
    [v16 addSubview:v8];
    v15 = [v8 _maps_constraintsForCenteringInView:v16 edgeInsets:0.0, 10.0, 10.0, 10.0];
    +[NSLayoutConstraint activateConstraints:v15];

    [(CarNavigationShareTripModeController *)self _updateSizeOfView:v16];
    [(CarTableView *)self->_tableView setTableHeaderView:v16];
  }
}

- (void)_setupTableFooterView
{
  if ([(CarNavigationShareTripModeController *)self isViewLoaded])
  {
    id v3 = [CarShareTripFooterView alloc];
    v4 = [(CarNavigationShareTripModeController *)self view];
    [v4 bounds];
    double v5 = -[CarShareTripFooterView initWithFrame:](v3, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v15), 1.79769313e308);
    footerView = self->_footerView;
    self->_footerView = v5;

    [(CarShareTripFooterView *)self->_footerView setAutoresizingMask:10];
    LODWORD(v7) = 1148846080;
    [(CarShareTripFooterView *)self->_footerView setContentCompressionResistancePriority:1 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(CarShareTripFooterView *)self->_footerView setContentHuggingPriority:1 forAxis:v8];
    v9 = +[MSPSharedTripService sharedInstance];
    v10 = [v9 sharingIdentity];

    if (v10)
    {
      [(CarNavigationShareTripModeController *)self _updateSharingFooterWithIdentity:v10];
    }
    else
    {
      objc_initWeak(&location, self);
      v11 = +[MSPSharedTripService sharedInstance];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1004BB264;
      v12[3] = &unk_1012EC650;
      objc_copyWeak(&v13, &location);
      [v11 refreshSharingIdentityWithCompletion:v12];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CarNavigationShareTripModeController;
  [(CarNavigationShareTripModeController *)&v11 viewDidLayoutSubviews];
  id v3 = [(CarNavigationShareTripModeController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if (v5 != self->_lastViewSize.width || v7 != self->_lastViewSize.height)
  {
    self->_lastViewSize.width = v5;
    self->_lastViewSize.height = v7;
    v9 = [(CarTableView *)self->_tableView tableHeaderView];
    [(CarNavigationShareTripModeController *)self _updateSizeOfView:v9];

    v10 = [(CarTableView *)self->_tableView tableFooterView];
    [(CarNavigationShareTripModeController *)self _updateSizeOfView:v10];
  }
}

- (void)_updateSharingFooterWithIdentity:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_sharingIdentity, a3);
  double v5 = [v10 name];
  double v6 = [v10 handle];
  [(CarShareTripFooterView *)self->_footerView setNameText:v5];
  double v7 = +[NSString localizedStringWithFormat:@"(%@)", v6];
  [(CarShareTripFooterView *)self->_footerView setHandleText:v7];

  [(CarNavigationShareTripModeController *)self _updateSizeOfView:self->_footerView];
  double v8 = [(CarTableView *)self->_tableView tableFooterView];
  footerView = self->_footerView;

  if (v8 != footerView) {
    [(CarTableView *)self->_tableView setTableFooterView:self->_footerView];
  }
}

- (void)_updateSizeOfView:(id)a3
{
  if (a3)
  {
    tableView = self->_tableView;
    id v7 = a3;
    [(CarTableView *)tableView bounds];
    CGFloat Width = CGRectGetWidth(v9);
    LODWORD(v5) = 1148846080;
    LODWORD(v6) = 1112014848;
    [v7 systemLayoutSizeFittingSize:Width withHorizontalFittingPriority:1.79769313e308 verticalFittingPriority:v5 v6];
    [v7 frame];
    [v7 setFrame:0.0];
  }
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)invalidAfterDisconnect
{
  return 1;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (int64_t)accessoriesHidingBehavior
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1004BB6A8;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [a4 addPreparation:v4];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004BB868;
  v6[3] = &unk_1012E6160;
  v6[4] = self;
  id v7 = a3;
  id v5 = v7;
  [a4 addCompletion:v6];
}

- (id)desiredCards
{
  if (self->_contactSearchResultsController)
  {
    CFStringRef v6 = @"ShareTripContactResults";
    v2 = &v6;
  }
  else
  {
    CFStringRef v5 = @"ShareTrip";
    v2 = &v5;
  }
  id v3 = +[NSArray arrayWithObjects:v2 count:1];

  return v3;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"ShareTripContactResults"])
  {
    [v6 setContent:self->_contactSearchResultsController];
    double v8 = [(CarShareTripKeyboardSearchController *)self->_contactSearchResultsController title];
    [v6 setTitle:v8];

    [v6 setAccessory:1];
    memset(v41, 0, sizeof(v41));
    v31[0] = xmmword_100F6F1C0;
    v31[1] = xmmword_100F67600;
    uint64_t v32 = 3;
    uint64_t v33 = 1148846080;
    uint64_t v34 = 2;
    int v35 = 1148846080;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v38 = _Q0;
    long long v39 = _Q0;
    char v40 = 1;
    uint64_t v42 = 8;
    char v43 = 0;
    if (v6)
    {
      double v14 = v31;
LABEL_7:
      [v6 setLayout:v14, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30];
    }
  }
  else if ([v7 isEqualToString:@"ShareTrip"])
  {
    [v6 setContent:self];
    CGRect v15 = +[NSBundle mainBundle];
    id v16 = [v15 localizedStringForKey:@"CarPlay_ShareTrip_CardTitle" value:@"localized string not found" table:0];
    [v6 setTitle:v16];

    [v6 setAccessory:1];
    HIDWORD(v28) = 0;
    *(_DWORD *)((char *)&v28 + 1) = 0;
    long long v18 = xmmword_100F6F1C0;
    long long v19 = xmmword_100F67600;
    uint64_t v20 = 3;
    uint64_t v21 = 1148846080;
    uint64_t v22 = 2;
    LODWORD(v23) = 1148846080;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v26 = _Q0;
    long long v27 = _Q0;
    LOBYTE(v28) = 1;
    uint64_t v29 = 8;
    LOBYTE(v30) = 0;
    if (v6)
    {
      double v14 = &v18;
      goto LABEL_7;
    }
  }
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  if (self->_contactSearchResultsController)
  {
    [(CarNavigationShareTripModeController *)self _closeResultsController];
  }
  else
  {
    double v4 = [(CarNavigationShareTripModeController *)self chromeViewController];
    [v4 captureUserAction:4 onTarget:1019];

    id v5 = +[CarChromeModeCoordinator sharedInstance];
    [v5 popFromContext:self];
  }
}

- (void)_closeResultsController
{
  contactSearchResultsController = self->_contactSearchResultsController;
  if (contactSearchResultsController)
  {
    self->_contactSearchResultsController = 0;

    id v4 = [(CarNavigationShareTripModeController *)self chromeViewController];
    [v4 updateCardsForContext:self animated:1];
  }
}

- (NSArray)carFocusOrderSequences
{
  if ([(CarNavigationShareTripModeController *)self isViewLoaded])
  {
    id v3 = [(CarNavigationShareTripModeController *)self chromeViewController];
    id v4 = [v3 itemRepresentingStatusBanner];
    id v5 = [(CarNavigationShareTripModeController *)self chromeViewController];
    id v6 = [v5 itemRepresentingOverlays];
    v11[1] = v6;
    id v7 = +[NSArray arrayWithObjects:v11 count:2];
    double v8 = +[CarFocusOrderSequence sequenceWithItems:v7 options:5];
    v12 = v8;
    CGRect v9 = +[NSArray arrayWithObjects:&v12 count:1];
  }
  else
  {
    CGRect v9 = &__NSArray0__struct;
  }

  return (NSArray *)v9;
}

- (NSArray)preferredCarFocusEnvironments
{
  if ([(CarNavigationShareTripModeController *)self isViewLoaded])
  {
    id v3 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:self];
    id v6 = v3;
    id v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    id v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (NSArray)preferredFocusEnvironments
{
  if ([(CarNavigationShareTripModeController *)self isViewLoaded])
  {
    tableView = self->_tableView;
    id v3 = +[NSArray arrayWithObjects:&tableView count:1];
  }
  else
  {
    id v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (NSArray)focusOrderSubItems
{
  if ([(CarNavigationShareTripModeController *)self isViewLoaded])
  {
    id v3 = [(CarTableView *)self->_tableView _car_visibleCells];
    id v4 = [v3 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v6 = [v3 firstObject];
      id v7 = [v6 focusOrderSubItems];
      double v8 = [v3 _maps_subarrayFromIndex:1];
      id v9 = [v7 arrayByAddingObjectsFromArray:v8];
    }
    else
    {
      id v9 = [v3 copy];
    }
  }
  else
  {
    id v9 = &__NSArray0__struct;
  }

  return (NSArray *)v9;
}

- (void)_externalDeviceUpdated:(id)a3
{
  id v4 = +[CarDisplayController maximumListLength];
  if ((void *)[(SharedTripSuggestionsDataSource *)self->_dataSource softCap] != v4)
  {
    [(CarNavigationShareTripModeController *)self _commitPendingShares];
    dataSource = self->_dataSource;
    [(SharedTripSuggestionsDataSource *)dataSource setSoftCap:v4];
  }
}

- (void)_toggleSharingForContactAtIndexPath:(id)a3
{
  id v4 = [(SharedTripSuggestionsDataSource *)self->_dataSource contactForItemIndexPath:a3];
  if (v4)
  {
    id v5 = v4;
    [(SharedTripSuggestionsDataSource *)self->_dataSource toggleContact:v4];
    [(CarNavigationShareTripModeController *)self _dismissAfterDelay];
    id v4 = v5;
  }
}

- (void)_dismissAfterDelay
{
  [(CarNavigationShareTripModeController *)self _cancelDismiss];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004BC2C8;
  v5[3] = &unk_1012E73C8;
  objc_copyWeak(&v6, &location);
  id v3 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v5 block:7.0];
  dismissTimer = self->_dismissTimer;
  self->_dismissTimer = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_cancelDismiss
{
  dismissTimer = self->_dismissTimer;
  if (dismissTimer)
  {
    [(NSTimer *)dismissTimer invalidate];
    id v4 = self->_dismissTimer;
    self->_dismissTimer = 0;
  }
}

- (void)_commitPendingShares
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableDictionary *)self->_cellsByContactStringValue objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 sharingState] == (id)1)
        {
          [v8 setDelegate:0];
          [(CarNavigationShareTripModeController *)self carShareTripContactCellDidFinishRingAnimation:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)userInputCell:(id)a3 didSelectAction:(unint64_t)a4 usingInteractionModel:(unint64_t)a5
{
  id v8 = a3;
  if (a4 == 1)
  {
    id v9 = v8;
    [(CarNavigationShareTripModeController *)self _requestKeyboardInputUsingInteractionModel:a5];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v9 = v8;
    [(CarNavigationShareTripModeController *)self _requestDictation];
  }
  id v8 = v9;
LABEL_6:
}

- (void)_requestDictation
{
  id v2 = +[CarChromeModeCoordinator sharedInstance];
  [v2 displaySiriTripSharing];
}

- (void)_displayContactResults:(id)a3 withTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[CarShareTripKeyboardSearchController alloc] initWithContactSearchResults:v6 dataSource:self->_dataSource];
  contactSearchResultsController = self->_contactSearchResultsController;
  self->_contactSearchResultsController = v8;

  [(CarShareTripKeyboardSearchController *)self->_contactSearchResultsController setTitle:v7];
  objc_initWeak(&location, self);
  long long v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_1004BC6C8;
  double v14 = &unk_1012E6708;
  objc_copyWeak(&v15, &location);
  [(CarShareTripKeyboardSearchController *)self->_contactSearchResultsController setDismissHandler:&v11];
  long long v10 = [(CarNavigationShareTripModeController *)self chromeViewController];
  [v10 updateCardsForContext:self animated:1];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_requestKeyboardInputUsingInteractionModel:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v5 = +[CarChromeModeCoordinator sharedInstance];
  dataSource = self->_dataSource;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004BC808;
  v7[3] = &unk_1012EC678;
  objc_copyWeak(&v8, &location);
  [v5 displayTripSharingContactKeyboardSearchWithInteractionModel:a3 dataSource:dataSource searchHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_handleContactSearchResults:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  id v9 = sub_100576A9C();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (!v10)
    {
LABEL_20:

      uint64_t v23 = +[NSBundle mainBundle];
      id v9 = [v23 localizedStringForKey:@"CarPlay_ShareTrip_ContactResultsTitle" value:@"localized string not found" table:0];

      uint64_t v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7);
      [(CarNavigationShareTripModeController *)self _displayContactResults:v6 withTitle:v24];

      goto LABEL_23;
    }
    long long v11 = self;
    if (!v11)
    {
      id v16 = @"<nil>";
      goto LABEL_19;
    }
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      double v14 = [(CarNavigationShareTripModeController *)v11 performSelector:"accessibilityIdentifier"];
      id v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        id v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_9;
      }
    }
    id v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_9:

LABEL_19:
    *(_DWORD *)buf = 138543618;
    long long v27 = v16;
    __int16 v28 = 2048;
    id v29 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] [Keyboard] Displaying %lu contact results", buf, 0x16u);

    goto LABEL_20;
  }
  if (v10)
  {
    v17 = self;
    if (!v17)
    {
      uint64_t v22 = @"<nil>";
      goto LABEL_22;
    }
    long long v18 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v18);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v20 = [(CarNavigationShareTripModeController *)v17 performSelector:"accessibilityIdentifier"];
      uint64_t v21 = v20;
      if (v20 && ![v20 isEqualToString:v19])
      {
        uint64_t v22 = +[NSString stringWithFormat:@"%@<%p, %@>", v19, v17, v21];

        goto LABEL_17;
      }
    }
    uint64_t v22 = +[NSString stringWithFormat:@"%@<%p>", v19, v17];
LABEL_17:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    long long v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] [Keyboard] No contact results", buf, 0xCu);
  }
LABEL_23:

  uint64_t v25 = [(CarNavigationShareTripModeController *)self chromeViewController];
  [v25 popToContext:self animated:1 completion:0];
}

- (void)sharedTripServiceDidUpdateSendingAvailability:(id)a3
{
  id v4 = [a3 sharingIdentity];
  [(CarNavigationShareTripModeController *)self _updateWithSharingIdentity:v4];
}

- (void)sharedTripService:(id)a3 didUpdateSharingIdentity:(id)a4
{
}

- (void)_updateWithSharingIdentity:(id)a3
{
  id v4 = a3;
  [(CarNavigationShareTripModeController *)self _updateSharingFooterWithIdentity:v4];
  unsigned __int8 v5 = [v4 hasValidAccount];

  if ((v5 & 1) == 0)
  {
    id v6 = +[CarChromeModeCoordinator sharedInstance];
    [v6 popFromContext:self];
  }
}

- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a4;
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [(NSMutableDictionary *)self->_cellsByContactStringValue objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)v8)];
        uint64_t v10 = [v9 contactValue];
        long long v11 = (void *)v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          id v13 = +[MSPSharedTripService sharedInstance];
          id v17 = 0;
          id v14 = [v13 capabilityTypeForContact:v11 serviceName:&v17 isActiveReceiver:0];
          id v15 = v17;

          [v9 setCapabilityType:v14 serviceName:v15];
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(SharedTripSuggestionsDataSource *)self->_dataSource contactSearchItemIdentifier];
  unsigned int v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = self->_userInputCell;
    goto LABEL_9;
  }
  uint64_t v10 = [(SharedTripSuggestionsDataSource *)self->_dataSource contactForItemIdentifier:v6];
  cellsByContactStringValue = self->_cellsByContactStringValue;
  BOOL v12 = [v10 stringValue];
  id v9 = [(NSMutableDictionary *)cellsByContactStringValue objectForKey:v12];

  if (v9)
  {
    unint64_t v13 = [(SharedTripSuggestionsDataSource *)self->_dataSource sharingStateForContact:v10];
    id v14 = v9;
    uint64_t v15 = 1;
  }
  else
  {
    id v16 = [v10 stringValue];
    id v17 = [v16 length];

    if (!v17)
    {
      id v9 = 0;
      goto LABEL_8;
    }
    id v9 = [[CarShareTripContactCell alloc] initWithStyle:0 reuseIdentifier:0];
    long long v18 = self->_cellsByContactStringValue;
    long long v19 = [v10 stringValue];
    [(NSMutableDictionary *)v18 setObject:v9 forKey:v19];

    [(CarUserInputCell *)v9 setDelegate:self];
    [(CarUserInputCell *)v9 configureWithMSPSharedTripContact:v10];
    unint64_t v13 = [(SharedTripSuggestionsDataSource *)self->_dataSource sharingStateForContact:v10];
    id v14 = v9;
    uint64_t v15 = 0;
  }
  [(CarUserInputCell *)v14 setSharingState:v13 animated:v15];
LABEL_8:
  long long v20 = +[MSPSharedTripService sharedInstance];
  id v24 = 0;
  id v21 = [v20 capabilityTypeForContact:v10 serviceName:&v24 isActiveReceiver:0];
  id v22 = v24;

  [(CarUserInputCell *)v9 setCapabilityType:v21 serviceName:v22];
LABEL_9:

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 contactValue];
    if (v6)
    {
      uint64_t v7 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
      id v9 = v6;
      unsigned int v8 = +[NSArray arrayWithObjects:&v9 count:1];
      [v7 requestCapabilityLevelsForContacts:v8];
    }
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v9;
  if (isKindOfClass)
  {
    uint64_t v7 = [v9 contactValue];
    if (v7)
    {
      unsigned int v8 = +[MSPSharedTripCapabilityLevelFetcher sharedFetcher];
      [v8 cancelCapabilityLevelRequestForContact:v7];
    }
    id v6 = v9;
  }
}

- (void)carShareTripContactCellDidFinishRingAnimation:(id)a3
{
  id v5 = [(CarTableView *)self->_tableView indexPathForCell:a3];
  id v4 = -[SharedTripSuggestionsDataSource contactForItemIndexPath:](self->_dataSource, "contactForItemIndexPath:");
  if (![(SharedTripSuggestionsDataSource *)self->_dataSource sharingStateForContact:v4]) {
    [(CarNavigationShareTripModeController *)self _toggleSharingForContactAtIndexPath:v5];
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(CarNavigationShareTripModeController *)self _cancelDismiss];
  long long v11 = (char *)[v8 numberOfSections];
  if (v11)
  {
    BOOL v12 = v11;
    unint64_t v13 = [v9 nextFocusedIndexPath];
    id v14 = v13;
    if (v13)
    {
      uint64_t v15 = (char *)[v13 section];
      id v16 = (char *)[v8 numberOfRowsInSection:[v14 section]];
      if (v15 == v12 - 1 && [v14 row] == v16 - 1)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1004BD3B4;
        v17[3] = &unk_1012E5D08;
        id v18 = v8;
        [v10 addCoordinatedAnimations:0 completion:v17];
      }
    }
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v4 = [(SharedTripSuggestionsDataSource *)self->_dataSource contactForItemIndexPath:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  self->_userInteracted = 1;
  id v6 = a3;
  [(CarNavigationShareTripModeController *)self _cancelDismiss];
  [v6 deselectRowAtIndexPath:v13 animated:1];

  uint64_t v7 = [(SharedTripSuggestionsDataSource *)self->_dataSource contactForItemIndexPath:v13];
  cellsByContactStringValue = self->_cellsByContactStringValue;
  id v9 = [v7 stringValue];
  id v10 = [(NSMutableDictionary *)cellsByContactStringValue objectForKey:v9];

  id v11 = [v10 sharingState];
  if (v11 == (id)1)
  {
    [v10 setSharingState:[self->_dataSource sharingStateForContact:v7] animated:0];
  }
  else
  {
    if (!v11)
    {
      [(CarNavigationShareTripModeController *)self _attemptToStartShareWithContact:v7];
      goto LABEL_7;
    }
    [(CarNavigationShareTripModeController *)self _toggleSharingForContactAtIndexPath:v13];
  }
  BOOL v12 = [(CarNavigationShareTripModeController *)self chromeViewController];
  [v12 captureUserAction:9026];

LABEL_7:
}

- (void)_attemptToStartShareWithContact:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  BOOL v5 = objc_opt_class();
  sharingIdentity = self->_sharingIdentity;
  uint64_t v7 = [(CarNavigationShareTripModeController *)self chromeViewController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004BD6CC;
  v9[3] = &unk_1012E6690;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v5 attemptToStartShareWithContact:v8 sharingIdentity:sharingIdentity interruptPresenter:v7 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

+ (void)attemptToStartShareWithContact:(id)a3 sharingIdentity:(id)a4 interruptPresenter:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  BOOL v12 = +[MSPSharedTripService sharedInstance];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1004BD888;
  v16[3] = &unk_1012EC6F0;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v20 = a1;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [v12 fetchRequiresUserConfirmationOfSharingIdentityWithCompletion:v16];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = [objc_alloc((Class)UITableViewCell) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

  return v4;
}

- (int)backButtonUsageActionToMode:(id)a3
{
  return 4;
}

- (int)currentUsageTarget
{
  return 1019;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_sharingIdentity, 0);
  objc_storeStrong((id *)&self->_contactSearchResultsController, 0);
  objc_storeStrong((id *)&self->_userInputCell, 0);
  objc_storeStrong((id *)&self->_cellsByContactStringValue, 0);
  objc_storeStrong((id *)&self->_dismissTimer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end