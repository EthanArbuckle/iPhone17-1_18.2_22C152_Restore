@interface CHFriendInboxTableViewController
- (BOOL)_isIndexPathEditable:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (CHFriendInboxTableViewController)init;
- (CHFriendInboxTableViewController)initWithCoder:(id)a3;
- (CHFriendInboxTableViewController)initWithFriendListManager:(id)a3 friendManager:(id)a4 achievementsDataProvider:(id)a5 workoutsDataProvider:(id)a6 workoutFormattingManager:(id)a7 formattingManager:(id)a8 badgeImageFactory:(id)a9 healthStore:(id)a10 fitnessAppContext:(id)a11 makeFriendDetailViewControllerBlock:(id)a12;
- (CHFriendInboxTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CHFriendInboxTableViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_presentedViewController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneButtonTapped;
- (void)_friendDataWasUpdated:(id)a3;
- (void)_inviteFriends;
- (void)_presentErrorAlertWithMessage:(id)a3;
- (void)_updateSections;
- (void)addFriendViewControllerDidDismiss:;
- (void)dealloc;
- (void)incomingTableViewCellDidTapAccept:(id)a3;
- (void)incomingTableViewCellDidTapIgnore:(id)a3;
- (void)loadView;
- (void)reloadDataAnimated:(BOOL)a3;
- (void)removeCellAtIndexPath:(id)a3;
- (void)removeCellFromTable:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CHFriendInboxTableViewController

- (void)addFriendViewControllerDidDismiss:
{
}

- (CHFriendInboxTableViewController)initWithFriendListManager:(id)a3 friendManager:(id)a4 achievementsDataProvider:(id)a5 workoutsDataProvider:(id)a6 workoutFormattingManager:(id)a7 formattingManager:(id)a8 badgeImageFactory:(id)a9 healthStore:(id)a10 fitnessAppContext:(id)a11 makeFriendDetailViewControllerBlock:(id)a12
{
  id v35 = a3;
  id obj = a4;
  id v34 = a4;
  id v33 = a5;
  id v32 = a6;
  id v27 = a7;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  v36.receiver = self;
  v36.super_class = (Class)CHFriendInboxTableViewController;
  v21 = [(CHFriendInboxTableViewController *)&v36 initWithStyle:2];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_friendListManager, a3);
    objc_storeStrong((id *)&v22->_friendManager, obj);
    objc_storeStrong((id *)&v22->_achievementsDataProvider, a5);
    objc_storeStrong((id *)&v22->_workoutsDataProvider, a6);
    objc_storeStrong((id *)&v22->_workoutFormattingManager, v27);
    objc_storeStrong((id *)&v22->_formattingManager, a8);
    objc_storeStrong((id *)&v22->_imageFactory, a9);
    objc_storeStrong((id *)&v22->_healthStore, a10);
    objc_storeStrong((id *)&v22->_fitnessAppContext, a11);
    id v23 = objc_retainBlock(v20);
    id makeFriendDetailViewControllerBlock = v22->_makeFriendDetailViewControllerBlock;
    v22->_id makeFriendDetailViewControllerBlock = v23;
  }
  return v22;
}

- (CHFriendInboxTableViewController)init
{
  return 0;
}

- (CHFriendInboxTableViewController)initWithStyle:(int64_t)a3
{
  return 0;
}

- (CHFriendInboxTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (CHFriendInboxTableViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)CHFriendInboxTableViewController;
  [(CHFriendInboxTableViewController *)&v8 loadView];
  v3 = [(CHFriendInboxTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"Add"];

  v4 = [(CHFriendInboxTableViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];

  v5 = [(CHFriendInboxTableViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"IncomingCell"];

  v6 = [(CHFriendInboxTableViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"OutgoingCell"];

  v7 = [(CHFriendInboxTableViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"LegacyDevicesCell"];
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)CHFriendInboxTableViewController;
  [(CHFriendInboxTableViewController *)&v33 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(CHFriendInboxTableViewController *)self tableView];
  [v4 setBackgroundColor:v3];

  id v5 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v6 = [(CHFriendInboxTableViewController *)self tableView];
  [v6 setTableFooterView:v5];

  id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneButtonTapped"];
  objc_super v8 = [(CHFriendInboxTableViewController *)self navigationItem];
  [v8 setLeftBarButtonItem:v7];

  v9 = +[OBPrivacyLinkController linkWithBundleIdentifier:@"com.apple.onboarding.activity"];
  privacyLink = self->_privacyLink;
  self->_privacyLink = v9;

  [(OBPrivacyLinkController *)self->_privacyLink setPresentedViewControllerShouldUseDarkMode:1];
  [(OBPrivacyLinkController *)self->_privacyLink setDisplayIcon:0];
  v11 = [(OBPrivacyLinkController *)self->_privacyLink view];
  v12 = [(CHFriendInboxTableViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  LODWORD(v13) = 1148846080;
  LODWORD(v15) = 1112014848;
  [v11 systemLayoutSizeFittingSize:v14 withHorizontalFittingPriority:0.0 verticalFittingPriority:v13 v15];
  double v17 = v16;

  id v18 = [(CHFriendInboxTableViewController *)self tableView];
  [v18 bounds];
  double v20 = v19;
  v21 = [(OBPrivacyLinkController *)self->_privacyLink view];
  [v21 setBounds:0.0, 0.0, v20, v17 + 25.0];

  [(CHFriendInboxTableViewController *)self addChildViewController:self->_privacyLink];
  v22 = [(CHFriendInboxTableViewController *)self tableView];
  [v22 _setDrawsSeparatorAtTopOfSections:0];

  id v23 = [(CHFriendInboxTableViewController *)self tableView];
  [v23 setIndicatorStyle:2];

  v24 = [(OBPrivacyLinkController *)self->_privacyLink view];
  v25 = [(CHFriendInboxTableViewController *)self tableView];
  [v25 setTableFooterView:v24];

  [(OBPrivacyLinkController *)self->_privacyLink didMoveToParentViewController:self];
  v26 = +[NSBundle mainBundle];
  id v27 = [v26 localizedStringForKey:@"SHARING" value:&stru_1008D8AB8 table:@"Localizable"];
  v28 = [(CHFriendInboxTableViewController *)self navigationItem];
  [v28 setTitle:v27];

  id v29 = [(CHFriendInboxTableViewController *)self navigationItem];
  [v29 setBackButtonDisplayMode:2];

  id v30 = +[NSNotificationCenter defaultCenter];
  [v30 addObserver:self selector:"_friendDataWasUpdated:" name:kASFriendListChangedNotificationKey object:0];
  id v31 = [(CHFitnessAppContext *)self->_fitnessAppContext cloudDeviceProvider];
  cloudDeviceProvider = self->_cloudDeviceProvider;
  self->_cloudDeviceProvider = v31;

  [(CHFriendInboxTableViewController *)self _updateSections];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHFriendInboxTableViewController;
  [(CHFriendInboxTableViewController *)&v5 viewDidAppear:a3];
  v4 = [(CHFriendInboxTableViewController *)self tableView];
  [v4 flashScrollIndicators];
}

- (void)viewDidLayoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)CHFriendInboxTableViewController;
  [(CHFriendInboxTableViewController *)&v49 viewDidLayoutSubviews];
  v3 = [(CHFriendInboxTableViewController *)self tableView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(CHFriendInboxTableViewController *)self tabBarController];
  double v13 = [v12 tabBar];

  if (v13)
  {
    double v14 = [(CHFriendInboxTableViewController *)self tableView];
    [v14 bounds];
    double v16 = v15;

    [v13 frame];
    double v9 = v16 - v17;
  }
  id v18 = [(CHFriendInboxTableViewController *)self tableView];
  [v18 setContentInset:v5, v7, v9, v11];

  double v19 = [(OBPrivacyLinkController *)self->_privacyLink view];
  double v20 = [(CHFriendInboxTableViewController *)self view];
  [v20 bounds];
  double v22 = v21;
  LODWORD(v21) = 1148846080;
  LODWORD(v23) = 1112014848;
  [v19 systemLayoutSizeFittingSize:v22 withHorizontalFittingPriority:0.0 verticalFittingPriority:v21 v23];
  double v25 = v24;

  v26 = [(CHFriendInboxTableViewController *)self tableView];
  [v26 bounds];
  double v28 = v27;
  id v29 = [(OBPrivacyLinkController *)self->_privacyLink view];
  [v29 setBounds:0.0, 0.0, v28, v25 + 25.0];

  id v30 = [(CHFriendInboxTableViewController *)self tableView];
  uint64_t v31 = (uint64_t)[v30 numberOfSections];

  uint64_t v32 = v31 - 1;
  if (v31 < 1)
  {
    id v35 = [(OBPrivacyLinkController *)self->_privacyLink view];
    [v35 center];
    double v47 = v46;
    v37 = [(OBPrivacyLinkController *)self->_privacyLink view];
    [v37 bounds];
    CGFloat v48 = CGRectGetMidY(v52) + 25.0;
    v42 = [(OBPrivacyLinkController *)self->_privacyLink view];
    [v42 setCenter:v47, v48];
    goto LABEL_8;
  }
  objc_super v33 = [(CHFriendInboxTableViewController *)self tableView];
  uint64_t v34 = (uint64_t)[v33 numberOfRowsInSection:v32];

  if (v34 >= 1)
  {
    id v35 = +[NSIndexPath indexPathForRow:v34 - 1 inSection:v32];
    objc_super v36 = [(CHFriendInboxTableViewController *)self tableView];
    v37 = [v36 cellForRowAtIndexPath:v35];

    if (!v37)
    {
LABEL_9:

      goto LABEL_10;
    }
    [v37 frame];
    CGFloat v38 = CGRectGetMaxY(v50) + 5.0;
    v39 = [(OBPrivacyLinkController *)self->_privacyLink view];
    [v39 bounds];
    CGFloat MidY = CGRectGetMidY(v51);
    double v41 = sub_10012475C(v38 + MidY, v25);

    v42 = [(OBPrivacyLinkController *)self->_privacyLink view];
    [v42 center];
    double v44 = v43;
    v45 = [(OBPrivacyLinkController *)self->_privacyLink view];
    [v45 setCenter:v44, v41];

LABEL_8:
    goto LABEL_9;
  }
LABEL_10:
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CHFriendInboxTableViewController;
  [(CHFriendInboxTableViewController *)&v4 dealloc];
}

- (void)_inviteFriends
{
  if ([(ASFriendListSectionManager *)self->_friendListManager hasReachedMaxNumberOfFriends])
  {
    sub_10014ADC4();
    objc_super v4 = (CHAddFriendViewController *)objc_claimAutoreleasedReturnValue();
    -[CHFriendInboxTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:");
  }
  else
  {
    sub_100145174();
    objc_super v4 = [[CHAddFriendViewController alloc] initWithFriendListManager:self->_friendListManager friendManager:self->_friendManager];
    [(CHAddFriendViewController *)v4 setDelegate:self];
    id v3 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
    [(CHFriendInboxTableViewController *)self presentViewController:v3 animated:1 completion:0];
  }
}

- (void)_doneButtonTapped
{
}

- (void)incomingTableViewCellDidTapAccept:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [v4 type];
  if (v5)
  {
    if (v5 == (id)1)
    {
      double v6 = [v4 friend];
      friendManager = self->_friendManager;
      uint64_t v8 = FIExperienceTypeWithHealthStore();
      sub_10014B014(self, v6, friendManager, v8);
    }
  }
  else if ([(ASFriendListSectionManager *)self->_friendListManager hasReachedMaxNumberOfFriends])
  {
    double v9 = sub_10014ADC4();
    sub_10014AF40(v9);
  }
  else
  {
    double v10 = self->_friendManager;
    double v11 = [v4 friend];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100153F08;
    v12[3] = &unk_1008AC1E8;
    objc_copyWeak(&v13, &location);
    [(CHFriendManager *)v10 acceptInvitationFromFriend:v11 completion:v12];

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);
}

- (void)incomingTableViewCellDidTapIgnore:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [v4 type];
  if (!v5)
  {
    friendManager = self->_friendManager;
    double v7 = [v4 friend];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100154140;
    v12[3] = &unk_1008AC1E8;
    uint64_t v8 = &v13;
    objc_copyWeak(&v13, &location);
    [(CHFriendManager *)friendManager ignoreInvitationFromFriend:v7 completion:v12];
    goto LABEL_5;
  }
  if (v5 == (id)1)
  {
    double v6 = self->_friendManager;
    double v7 = [v4 friend];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001541DC;
    v10[3] = &unk_1008AC1E8;
    uint64_t v8 = &v11;
    objc_copyWeak(&v11, &location);
    [(CHFriendManager *)v6 ignoreCompetitionRequestFromFriend:v7 completion:v10];
LABEL_5:

    objc_destroyWeak(v8);
  }
  objc_destroyWeak(&location);
}

- (void)_presentErrorAlertWithMessage:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015430C;
  block[3] = &unk_1008ABA78;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_presentedViewController
{
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 windows];
  id v4 = [v3 firstObject];
  id v5 = [v4 rootViewController];
  double v6 = [v5 presentedViewController];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)[(NSMutableDictionary *)self->_friendListSectionsByType count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(CHFriendInboxTableViewController *)self _sectionTypeForSectionIndex:a4];
  friendListSectionsByType = self->_friendListSectionsByType;
  double v7 = +[NSNumber numberWithInteger:v5];
  uint64_t v8 = [(NSMutableDictionary *)friendListSectionsByType objectForKeyedSubscript:v7];

  double v9 = [v8 rows];
  id v10 = [v9 count];
  if (v5 == 7) {
    int64_t v11 = (int64_t)v10 + 1;
  }
  else {
    int64_t v11 = (int64_t)v10;
  }

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v7 section]);
  friendListSectionsByType = self->_friendListSectionsByType;
  id v10 = +[NSNumber numberWithInteger:v8];
  int64_t v11 = [(NSMutableDictionary *)friendListSectionsByType objectForKeyedSubscript:v10];

  id v12 = [v7 row];
  id v13 = [v11 rows];
  if (v12 >= [v13 count])
  {
    double v15 = 0;
  }
  else
  {
    double v14 = [v11 rows];
    double v15 = [v14 objectAtIndexedSubscript:[v7 row]];
  }
  switch(v8)
  {
    case 0:
      double v27 = [v6 dequeueReusableCellWithIdentifier:@"IncomingCell" forIndexPath:v7];
      [v27 setSelectionStyle:0];
      id v16 = v27;
      double v28 = [v15 friend];
      [v16 setFriend:v28];

      [v16 setDelegate:self];
      [v16 setType:1];
      id v29 = +[UIColor as_lightCompetitionGold];
      [v16 setAcceptTintColor:v29];

      double v17 = +[UIColor as_darkCompetitionGold];
      [v16 setIgnoreTintColor:v17];

      goto LABEL_19;
    case 1:
    case 5:
    case 6:
      goto LABEL_5;
    case 2:
      id v30 = [v6 dequeueReusableCellWithIdentifier:@"OutgoingCell" forIndexPath:v7];
      [v30 setSelectionStyle:0];
      id v16 = v30;
      uint64_t v31 = [v15 friend];
      [v16 setFriend:v31];

      double v17 = [v15 friend];
      uint64_t v32 = [v17 as_competitionRequestDurationRemainingString];
      goto LABEL_16;
    case 3:
      double v19 = [v6 dequeueReusableCellWithIdentifier:@"IncomingCell" forIndexPath:v7];
      [v19 setSelectionStyle:0];
      id v16 = v19;
      double v20 = [v15 friend];
      [v16 setFriend:v20];

      [v16 setDelegate:self];
      [v16 setType:0];
      double v21 = +[ARUIMetricColors briskColors];
      double v22 = [v21 nonGradientTextColor];
      [v16 setAcceptTintColor:v22];

      double v17 = +[ARUIMetricColors energyColors];
      id v18 = [v17 nonGradientTextColor];
      [v16 setIgnoreTintColor:v18];
      goto LABEL_17;
    case 4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_5;
      }
      CFStringRef v26 = @"Add";
      goto LABEL_14;
    case 7:
      id v23 = [v7 row];
      double v24 = [v11 rows];
      id v25 = [v24 count];

      if (v23 == v25)
      {
        CFStringRef v26 = @"LegacyDevicesCell";
LABEL_14:
        id v16 = [v6 dequeueReusableCellWithIdentifier:v26 forIndexPath:v7];
        [v16 setSelectionStyle:3];
      }
      else
      {
LABEL_5:
        id v16 = [v6 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v7];
        [v16 setSelectionStyle:3];
        double v17 = [v15 friend];
        id v18 = [v15 snapshot];
        [v16 setFriend:v17 snapshot:v18 animated:0];
LABEL_18:

LABEL_19:
      }
LABEL_20:

      return v16;
    case 8:
      objc_super v33 = [v6 dequeueReusableCellWithIdentifier:@"OutgoingCell" forIndexPath:v7];
      [v33 setSelectionStyle:0];
      id v16 = v33;
      uint64_t v34 = [v15 friend];
      [v16 setFriend:v34];

      double v17 = [v15 friend];
      uint64_t v32 = [v17 as_invitedDurationString];
LABEL_16:
      id v18 = (void *)v32;
      [v16 setDetailText:v32];
LABEL_17:

      goto LABEL_18;
    default:
      id v16 = 0;
      goto LABEL_20;
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(CHFriendInboxTableViewController *)self _isIndexPathEditable:a4];
}

- (BOOL)_isIndexPathEditable:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v4 section]);
  if (v5 == 8)
  {
    LOBYTE(v12) = 1;
  }
  else if (v5 == 3)
  {
    friendListSectionsByType = self->_friendListSectionsByType;
    id v7 = +[NSNumber numberWithInteger:3];
    int64_t v8 = [(NSMutableDictionary *)friendListSectionsByType objectForKeyedSubscript:v7];

    double v9 = [v8 rows];
    id v10 = [v9 objectAtIndexedSubscript:[v4 row]];

    int64_t v11 = [v10 friend];
    unsigned int v12 = [v11 isAwaitingInviteResponseFromMe] ^ 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return [(CHFriendInboxTableViewController *)self _isIndexPathEditable:a4];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v9 section]);
  if (a4 == 1)
  {
    int64_t v11 = v10;
    if ([(CHFriendInboxTableViewController *)self _isIndexPathEditable:v9])
    {
      friendListSectionsByType = self->_friendListSectionsByType;
      id v13 = +[NSNumber numberWithInteger:v11];
      double v14 = [(NSMutableDictionary *)friendListSectionsByType objectForKeyedSubscript:v13];

      double v15 = [v14 rows];
      id v16 = [v15 objectAtIndexedSubscript:[v9 row]];

      objc_initWeak(&location, self);
      [v8 setEditing:0 animated:1];
      double v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      id v23 = sub_100154D24;
      double v24 = &unk_1008AC1E8;
      objc_copyWeak(&v25, &location);
      double v17 = objc_retainBlock(&v21);
      if (v11 == 3)
      {
        friendManager = self->_friendManager;
        double v19 = [v16 friend:v21, v22, v23, v24];
        [(CHFriendManager *)friendManager removeFriend:v19 completion:v17];
      }
      else
      {
        if (v11 != 8)
        {
LABEL_8:

          objc_destroyWeak(&v25);
          objc_destroyWeak(&location);

          goto LABEL_9;
        }
        id v18 = self->_friendManager;
        double v19 = [v16 friend:v21, v22, v23, v24];
        [(CHFriendManager *)v18 withdrawInvitationToFriend:v19 completion:v17];
      }

      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  int64_t v7 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v6 section]);
  friendListSectionsByType = self->_friendListSectionsByType;
  id v9 = +[NSNumber numberWithInteger:v7];
  int64_t v10 = [(NSMutableDictionary *)friendListSectionsByType objectForKeyedSubscript:v9];

  if (v7 != 3 && v7 != 8)
  {
    if (v7 == 7
      && ([v10 rows],
          int64_t v11 = objc_claimAutoreleasedReturnValue(),
          id v12 = [v11 count],
          id v13 = [v6 row],
          v11,
          v12 == v13))
    {
      double v14 = [[CHLegacyDevicesViewController alloc] initWithFitnessAppContext:self->_fitnessAppContext];
      id v15 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v14];
      id v16 = [(CHFriendInboxTableViewController *)self navigationController];
      [v16 presentViewController:v15 animated:1 completion:0];
    }
    else
    {
      double v17 = self->_friendListSectionsByType;
      id v18 = +[NSNumber numberWithInteger:v7];
      double v14 = [(NSMutableDictionary *)v17 objectForKeyedSubscript:v18];

      double v19 = [(CHLegacyDevicesViewController *)v14 rows];
      [v19 objectAtIndexedSubscript:[v6 row]];
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(CHFriendInboxTableViewController *)self _inviteFriends];
      }
      else
      {
        id makeFriendDetailViewControllerBlock = (void (**)(id, void *))self->_makeFriendDetailViewControllerBlock;
        double v21 = [v15 friend];
        uint64_t v22 = makeFriendDetailViewControllerBlock[2](makeFriendDetailViewControllerBlock, v21);

        id v23 = [(CHFriendInboxTableViewController *)self navigationController];
        [v23 pushViewController:v22 animated:1];
      }
    }
    [v24 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  +[CHFriendInboxTableViewCell preferredHeight];
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  +[CHFriendInboxTableViewCell preferredHeight];
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  switch([(CHFriendInboxTableViewController *)self _sectionTypeForSectionIndex:a4])
  {
    case 0:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"COMPETITION_INBOX_INCOMING_HEADER";
      goto LABEL_12;
    case 1:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"COMPETITION_INBOX_CURRENTLY_COMPETING_HEADER";
      goto LABEL_12;
    case 2:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"COMPETITION_INBOX_OUTGOING_HEADER";
      goto LABEL_12;
    case 3:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"SHARING_INBOX_PENDING";
      goto LABEL_12;
    case 4:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"SHARING_INBOX_ACTIVE";
      goto LABEL_12;
    case 5:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"SHARING_INBOX_HIDING";
      goto LABEL_12;
    case 6:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"SHARING_INBOX_HIDDEN";
      goto LABEL_12;
    case 7:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      int64_t v5 = v4;
      CFStringRef v6 = @"SHARING_INBOX_AWAITING_DOWNGRADE";
      CFStringRef v8 = @"Localizable-tetra";
      goto LABEL_13;
    case 8:
      id v4 = +[NSBundle mainBundle];
      int64_t v5 = v4;
      CFStringRef v6 = @"SHARING_INBOX_WAITING";
LABEL_12:
      CFStringRef v8 = @"Localizable";
LABEL_13:
      int64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1008D8AB8 table:v8];

      break;
    default:
      int64_t v7 = 0;
      break;
  }

  return v7;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v9 = a4;
  if ((unint64_t)[(CHFriendInboxTableViewController *)self _sectionTypeForSectionIndex:a5] <= 2)
  {
    int64_t v7 = +[UIColor as_lightCompetitionGold];
    CFStringRef v8 = [v9 textLabel];
    [v8 setTextColor:v7];
  }
}

- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3
{
  id v4 = sub_100155528(self->_friendListSectionsByType);
  if ((unint64_t)[v4 count] <= a3)
  {
    unint64_t v6 = 0;
  }
  else
  {
    int64_t v5 = [v4 objectAtIndexedSubscript:a3];
    unint64_t v6 = (unint64_t)[v5 integerValue];

    if (v6 > 8) {
      unint64_t v6 = 3;
    }
  }

  return v6;
}

- (void)_updateSections
{
  id v3 = +[NSMutableDictionary dictionary];
  friendListSectionsByType = self->_friendListSectionsByType;
  self->_friendListSectionsByType = v3;

  int64_t v5 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsRequestingMeToCompete];
  unint64_t v6 = [v5 rows];
  id v7 = [v6 count];

  if (v7) {
    [(NSMutableDictionary *)self->_friendListSectionsByType setObject:v5 forKeyedSubscript:&off_1008DE730];
  }
  CFStringRef v8 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsCompetingWithMe];
  id v9 = [v8 rows];
  id v10 = [v9 count];

  if (v10) {
    [(NSMutableDictionary *)self->_friendListSectionsByType setObject:v8 forKeyedSubscript:&off_1008DE748];
  }
  int64_t v11 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsRequestedToCompeteByMe];
  id v12 = [v11 rows];
  id v13 = [v12 count];

  if (v13) {
    [(NSMutableDictionary *)self->_friendListSectionsByType setObject:v11 forKeyedSubscript:&off_1008DE760];
  }
  CGFloat v38 = v11;
  v39 = v8;
  double v14 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsInvitingMe];
  id v15 = [v14 rows];
  id v16 = [v15 count];

  if (v16) {
    [(NSMutableDictionary *)self->_friendListSectionsByType setObject:v14 forKeyedSubscript:&off_1008DE778];
  }
  v37 = v14;
  double v17 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsWithNoHiding];
  objc_super v36 = objc_alloc_init(CHAddFriendFriendListRow);
  double v41 = v36;
  id v18 = +[NSArray arrayWithObjects:&v41 count:1];
  double v19 = [v17 rows];
  double v20 = [v18 arrayByAddingObjectsFromArray:v19];

  id v21 = objc_alloc((Class)ASFriendListSection);
  uint64_t v22 = [v17 startDate];
  id v23 = [v21 initWithDate:v22 andRows:v20];
  [(NSMutableDictionary *)self->_friendListSectionsByType setObject:v23 forKeyedSubscript:&off_1008DE790];

  id v24 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsMyDataIsHiddenFrom];
  id v25 = [v24 rows];
  id v26 = [v25 count];

  if (v26) {
    [(NSMutableDictionary *)self->_friendListSectionsByType setObject:v24 forKeyedSubscript:&off_1008DE7A8];
  }
  v40 = v5;
  double v27 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsHidingDataFromMe];
  double v28 = [v27 rows];
  id v29 = [v28 count];

  if (v29) {
    [(NSMutableDictionary *)self->_friendListSectionsByType setObject:v27 forKeyedSubscript:&off_1008DE7C0];
  }
  id v30 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsInvitedByMe];
  uint64_t v31 = [v30 rows];
  id v32 = [v31 count];

  if (v32) {
    [(NSMutableDictionary *)self->_friendListSectionsByType setObject:v30 forKeyedSubscript:&off_1008DE7D8];
  }
  objc_super v33 = [(ASFriendListSectionManager *)self->_friendListManager sectionForFriendsRequestedToDowngradeByMe];
  uint64_t v34 = [v33 rows];
  if ([v34 count])
  {
    unsigned int v35 = [(CHCloudDeviceProvider *)self->_cloudDeviceProvider oldDevicesExist];

    if (v35) {
      [(NSMutableDictionary *)self->_friendListSectionsByType setObject:v33 forKeyedSubscript:&off_1008DE7F0];
    }
  }
  else
  {
  }
}

- (void)_friendDataWasUpdated:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001559B4;
  block[3] = &unk_1008ABA78;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)removeCellFromTable:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CHFriendInboxTableViewController *)self tableView];
  unint64_t v6 = [v5 indexPathForCell:v4];

  int64_t v7 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v6 section]);
  friendListSectionsByType = self->_friendListSectionsByType;
  id v9 = +[NSNumber numberWithInteger:v7];
  id v10 = [(NSMutableDictionary *)friendListSectionsByType objectForKeyedSubscript:v9];

  int64_t v11 = [v10 rows];
  id v12 = +[NSMutableArray arrayWithArray:v11];

  [v12 removeObjectAtIndex:[v6 row]];
  id v13 = objc_alloc((Class)ASFriendListSection);
  double v14 = [v10 startDate];
  id v15 = [v13 initWithDate:v14 andRows:v12];
  id v16 = self->_friendListSectionsByType;
  double v17 = +[NSNumber numberWithInteger:v7];
  [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v17];

  id v18 = [(CHFriendInboxTableViewController *)self tableView];
  double v20 = v6;
  double v19 = +[NSArray arrayWithObjects:&v20 count:1];
  [v18 deleteRowsAtIndexPaths:v19 withRowAnimation:0];
}

- (void)removeCellAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v4 section]);
  friendListSectionsByType = self->_friendListSectionsByType;
  int64_t v7 = +[NSNumber numberWithInteger:v5];
  CFStringRef v8 = [(NSMutableDictionary *)friendListSectionsByType objectForKeyedSubscript:v7];

  id v9 = [v8 rows];
  id v10 = +[NSMutableArray arrayWithArray:v9];

  [v10 removeObjectAtIndex:[v4 row]];
  id v11 = objc_alloc((Class)ASFriendListSection);
  id v12 = [v8 startDate];
  id v13 = [v11 initWithDate:v12 andRows:v10];
  double v14 = self->_friendListSectionsByType;
  id v15 = +[NSNumber numberWithInteger:v5];
  [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

  id v16 = [(CHFriendInboxTableViewController *)self tableView];
  id v18 = v4;
  double v17 = +[NSArray arrayWithObjects:&v18 count:1];

  [v16 deleteRowsAtIndexPaths:v17 withRowAnimation:100];
}

- (void)reloadDataAnimated:(BOOL)a3
{
  id v3 = self;
  if (a3)
  {
    id v4 = [(NSMutableDictionary *)self->_friendListSectionsByType copy];
    [(CHFriendInboxTableViewController *)v3 _updateSections];
    int64_t v5 = [v4 allKeys];
    unint64_t v6 = [(NSMutableDictionary *)v3->_friendListSectionsByType allKeys];
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v155 objects:v166 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v156;
      id v11 = &__NSArray0__struct;
      id v12 = &__NSArray0__struct;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v156 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void *)(*((void *)&v155 + 1) + 8 * i);
          if ([v6 containsObject:v14])
          {
            uint64_t v15 = [v11 arrayByAddingObject:v14];
            id v16 = v11;
            id v11 = (void *)v15;
          }
          else
          {
            uint64_t v17 = [v12 arrayByAddingObject:v14];
            id v16 = v12;
            id v12 = (void *)v17;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v155 objects:v166 count:16];
      }
      while (v9);
    }
    else
    {
      id v11 = &__NSArray0__struct;
      id v12 = &__NSArray0__struct;
    }

    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id obj = v6;
    id v18 = [obj countByEnumeratingWithState:&v151 objects:v165 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v152;
      id v21 = &__NSArray0__struct;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v152 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v151 + 1) + 8 * (void)j);
          if (([v7 containsObject:v23] & 1) == 0)
          {
            uint64_t v24 = [v21 arrayByAddingObject:v23];

            id v21 = (void *)v24;
          }
        }
        id v19 = [obj countByEnumeratingWithState:&v151 objects:v165 count:16];
      }
      while (v19);
    }
    else
    {
      id v21 = &__NSArray0__struct;
    }
    id v125 = v11;

    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v114 = v12;
    id v25 = [v114 countByEnumeratingWithState:&v147 objects:v164 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v148;
      double v28 = &__NSArray0__struct;
      do
      {
        id v29 = 0;
        id v30 = v28;
        do
        {
          if (*(void *)v148 != v27) {
            objc_enumerationMutation(v114);
          }
          uint64_t v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_100156974((uint64_t)[*(id *)(*((void *)&v147 + 1) + 8 * (void)v29) integerValue], v4));
          double v28 = [v30 arrayByAddingObject:v31];

          id v29 = (char *)v29 + 1;
          id v30 = v28;
        }
        while (v26 != v29);
        id v26 = [v114 countByEnumeratingWithState:&v147 objects:v164 count:16];
      }
      while (v26);
    }
    else
    {
      double v28 = &__NSArray0__struct;
    }
    v108 = v28;

    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id v32 = v21;
    id v33 = [v32 countByEnumeratingWithState:&v143 objects:v163 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v144;
      objc_super v36 = &__NSArray0__struct;
      do
      {
        v37 = 0;
        CGFloat v38 = v36;
        do
        {
          if (*(void *)v144 != v35) {
            objc_enumerationMutation(v32);
          }
          v39 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", sub_100156974((uint64_t)[*(id *)(*((void *)&v143 + 1) + 8 * (void)v37) integerValue], v3->_friendListSectionsByType));
          objc_super v36 = [v38 arrayByAddingObject:v39];

          v37 = (char *)v37 + 1;
          CGFloat v38 = v36;
        }
        while (v34 != v37);
        id v34 = [v32 countByEnumeratingWithState:&v143 objects:v163 count:16];
      }
      while (v34);
    }
    else
    {
      objc_super v36 = &__NSArray0__struct;
    }
    v109 = v36;
    v111 = v32;
    v112 = v7;

    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v113 = v125;
    v118 = v4;
    v119 = (char *)[v113 countByEnumeratingWithState:&v139 objects:v162 count:16];
    v122 = v3;
    if (v119)
    {
      uint64_t v116 = *(void *)v140;
      v123 = &__NSArray0__struct;
      id v126 = &__NSArray0__struct;
      do
      {
        v40 = 0;
        do
        {
          if (*(void *)v140 != v116) {
            objc_enumerationMutation(v113);
          }
          v120 = v40;
          double v41 = *(void **)(*((void *)&v139 + 1) + 8 * (void)v40);
          v42 = [v4 objectForKeyedSubscript:v41];
          double v43 = [(NSMutableDictionary *)v3->_friendListSectionsByType objectForKeyedSubscript:v41];
          id v44 = sub_100156974((uint64_t)[v41 integerValue], v4);
          id v45 = sub_100156974((uint64_t)[v41 integerValue], v3->_friendListSectionsByType);
          double v46 = [v42 rows];
          id v47 = [v46 count];

          if (v47)
          {
            unint64_t v48 = 0;
            do
            {
              objc_super v49 = [v42 rows];
              CGRect v50 = [v49 objectAtIndexedSubscript:v48];

              CGRect v51 = +[NSIndexPath indexPathForRow:v48 inSection:v44];
              CGRect v52 = [v43 rows];
              unsigned __int8 v53 = [v52 containsObject:v50];

              if ((v53 & 1) == 0)
              {
                uint64_t v54 = [v123 arrayByAddingObject:v51];

                v123 = (void *)v54;
              }

              ++v48;
              v55 = [v42 rows];
              id v56 = [v55 count];
            }
            while (v48 < (unint64_t)v56);
          }
          v57 = [v43 rows];
          id v58 = [v57 count];

          if (v58)
          {
            unint64_t v59 = 0;
            id v4 = v118;
            do
            {
              v60 = [v43 rows];
              v61 = [v60 objectAtIndexedSubscript:v59];

              v62 = +[NSIndexPath indexPathForRow:v59 inSection:v45];
              v63 = [v42 rows];
              unsigned __int8 v64 = [v63 containsObject:v61];

              if ((v64 & 1) == 0)
              {
                uint64_t v65 = [v126 arrayByAddingObject:v62];

                id v126 = (id)v65;
              }

              ++v59;
              v66 = [v43 rows];
              id v67 = [v66 count];
            }
            while (v59 < (unint64_t)v67);
          }
          else
          {
            id v4 = v118;
          }

          v40 = v120 + 1;
          id v3 = v122;
        }
        while (v120 + 1 != v119);
        v119 = (char *)[v113 countByEnumeratingWithState:&v139 objects:v162 count:16];
      }
      while (v119);
    }
    else
    {
      v123 = &__NSArray0__struct;
      id v126 = &__NSArray0__struct;
    }

    v68 = [(CHFriendInboxTableViewController *)v3 tableView];
    [v68 beginUpdates];

    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v69 = v108;
    id v70 = [v69 countByEnumeratingWithState:&v135 objects:v161 count:16];
    if (v70)
    {
      id v71 = v70;
      uint64_t v72 = *(void *)v136;
      do
      {
        for (k = 0; k != v71; k = (char *)k + 1)
        {
          if (*(void *)v136 != v72) {
            objc_enumerationMutation(v69);
          }
          v74 = *(void **)(*((void *)&v135 + 1) + 8 * (void)k);
          v75 = [(CHFriendInboxTableViewController *)v3 tableView];
          v76 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v74 integerValue]);
          [v75 deleteSections:v76 withRowAnimation:100];
        }
        id v71 = [v69 countByEnumeratingWithState:&v135 objects:v161 count:16];
      }
      while (v71);
    }

    v77 = [(CHFriendInboxTableViewController *)v3 tableView];
    [v77 deleteRowsAtIndexPaths:v123 withRowAnimation:100];

    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v78 = v109;
    id v79 = [v78 countByEnumeratingWithState:&v131 objects:v160 count:16];
    if (v79)
    {
      id v80 = v79;
      uint64_t v81 = *(void *)v132;
      do
      {
        for (m = 0; m != v80; m = (char *)m + 1)
        {
          if (*(void *)v132 != v81) {
            objc_enumerationMutation(v78);
          }
          v83 = *(void **)(*((void *)&v131 + 1) + 8 * (void)m);
          v84 = [(CHFriendInboxTableViewController *)v3 tableView];
          v85 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v83 integerValue]);
          [v84 insertSections:v85 withRowAnimation:100];
        }
        id v80 = [v78 countByEnumeratingWithState:&v131 objects:v160 count:16];
      }
      while (v80);
    }
    v117 = v69;
    v110 = v78;

    v86 = [(CHFriendInboxTableViewController *)v3 tableView];
    [v86 insertRowsAtIndexPaths:v126 withRowAnimation:100];

    v87 = [(CHFriendInboxTableViewController *)v3 tableView];
    [v87 endUpdates];

    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    v88 = [(CHFriendInboxTableViewController *)v3 tableView];
    v89 = [v88 indexPathsForVisibleRows];

    id v121 = v89;
    id v90 = [v89 countByEnumeratingWithState:&v127 objects:v159 count:16];
    if (v90)
    {
      id v91 = v90;
      uint64_t v92 = *(void *)v128;
      do
      {
        for (n = 0; n != v91; n = (char *)n + 1)
        {
          if (*(void *)v128 != v92) {
            objc_enumerationMutation(v121);
          }
          v94 = *(void **)(*((void *)&v127 + 1) + 8 * (void)n);
          v95 = [(CHFriendInboxTableViewController *)v3 tableView];
          v96 = [v95 cellForRowAtIndexPath:v94];

          id v97 = -[CHFriendInboxTableViewController _sectionTypeForSectionIndex:](v3, "_sectionTypeForSectionIndex:", [v94 section]);
          friendListSectionsByType = v3->_friendListSectionsByType;
          v99 = +[NSNumber numberWithInteger:v97];
          v100 = [(NSMutableDictionary *)friendListSectionsByType objectForKeyedSubscript:v99];

          id v101 = [v94 row];
          v102 = [v100 rows];
          id v103 = [v102 count];

          if (v101 < v103)
          {
            v104 = [v100 rows];
            v105 = [v104 objectAtIndexedSubscript:[v94 row]];

            v106 = [v105 friend];
            if (objc_opt_respondsToSelector())
            {
              v107 = [v105 snapshot];
              [v96 setFriend:v106 snapshot:v107 animated:1];
            }
            else if (objc_opt_respondsToSelector())
            {
              [v96 setFriend:v106];
            }
          }
          id v3 = v122;
        }
        id v91 = [v121 countByEnumeratingWithState:&v127 objects:v159 count:16];
      }
      while (v91);
    }
  }
  else
  {
    [(CHFriendInboxTableViewController *)self _updateSections];
    id v124 = [(CHFriendInboxTableViewController *)v3 tableView];
    [v124 reloadData];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudDeviceProvider, 0);
  objc_storeStrong(&self->_makeFriendDetailViewControllerBlock, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_privacyLink, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_workoutFormattingManager, 0);
  objc_storeStrong((id *)&self->_friendListSectionsByType, 0);
  objc_storeStrong((id *)&self->_workoutsDataProvider, 0);
  objc_storeStrong((id *)&self->_achievementsDataProvider, 0);
  objc_storeStrong((id *)&self->_friendManager, 0);

  objc_storeStrong((id *)&self->_friendListManager, 0);
}

@end