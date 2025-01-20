@interface CarplayDetailViewController
- (BOOL)organizerCanBeMessaged;
- (CarplayDetailViewController)initWithEvent:(id)a3 showDayName:(BOOL)a4;
- (id)_createTableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_donateUserActivity:(id)a3;
- (void)_initActionIdentifiers;
- (void)createAndActivateLayoutConstraints;
- (void)eventStoreChanged:(id)a3;
- (void)pushViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateViewWithEvent;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CarplayDetailViewController

- (CarplayDetailViewController)initWithEvent:(id)a3 showDayName:(BOOL)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CarplayDetailViewController;
  v8 = [(CarplayDetailViewController *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_showDayName = a4;
    objc_storeStrong((id *)&v8->_event, a3);
    uint64_t v10 = objc_opt_new();
    actionIdentifiers = v9->_actionIdentifiers;
    v9->_actionIdentifiers = (NSMutableArray *)v10;

    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"Event Details" value:&stru_1001D6918 table:0];
    v14 = [(CarplayDetailViewController *)v9 navigationItem];
    [v14 setTitle:v13];

    [(CarplayDetailViewController *)v9 _initActionIdentifiers];
    [(CarplayDetailViewController *)v9 _donateUserActivity:v9->_event];
    +[EKMapsUtilities geocodeEventIfNeeded:v7];
  }

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CarplayDetailViewController *)self navigationController];
  [v5 setNavigationBarHidden:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"eventStoreChanged:" name:EKEventStoreChangedNotification object:0];
  v7.receiver = self;
  v7.super_class = (Class)CarplayDetailViewController;
  [(CarplayDetailViewController *)&v7 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:EKEventStoreChangedNotification object:0];
  v6.receiver = self;
  v6.super_class = (Class)CarplayDetailViewController;
  [(CarplayDetailViewController *)&v6 viewWillDisappear:v3];
}

- (id)_createTableView
{
  id v3 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setDelegate:self];
  [v3 setDataSource:self];
  uint64_t v4 = objc_opt_class();
  v5 = +[CarplayDetailTableViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  uint64_t v6 = objc_opt_class();
  objc_super v7 = +[CarplayDetailTableViewCell reuseIdentifier];
  [v3 registerClass:v6 forCellReuseIdentifier:v7];

  uint64_t v8 = objc_opt_class();
  v9 = +[CarplayDetailTableViewCell reuseIdentifier];
  [v3 registerClass:v8 forCellReuseIdentifier:v9];

  uint64_t v10 = objc_opt_class();
  v11 = +[CarplayDetailTableViewCell reuseIdentifier];
  [v3 registerClass:v10 forCellReuseIdentifier:v11];

  return v3;
}

- (void)_initActionIdentifiers
{
  [(NSMutableArray *)self->_actionIdentifiers removeAllObjects];
  actionIdentifiers = self->_actionIdentifiers;
  uint64_t v4 = +[CarplayDetailTableViewCell reuseIdentifier];
  [(NSMutableArray *)actionIdentifiers addObject:v4];

  if (+[CarplayUtilities eventCanNavigate:self->_event])
  {
    v5 = self->_actionIdentifiers;
    uint64_t v6 = +[CarplayDetailTableViewCell reuseIdentifier];
    [(NSMutableArray *)v5 addObject:v6];
  }
  if (+[CarplayUtilities eventCanDialIn:self->_event])
  {
    objc_super v7 = self->_actionIdentifiers;
    uint64_t v8 = +[CarplayDetailTableViewCell reuseIdentifier];
    [(NSMutableArray *)v7 addObject:v8];
  }
  if ([(CarplayDetailViewController *)self organizerCanBeMessaged])
  {
    v9 = self->_actionIdentifiers;
    uint64_t v10 = +[CarplayDetailTableViewCell reuseIdentifier];
    [(NSMutableArray *)v9 addObject:v10];
  }
  v11 = [(CarplayDetailViewController *)self _createTableView];
  tableView = self->_tableView;
  self->_tableView = v11;

  v13 = [(CarplayDetailViewController *)self view];
  [v13 addSubview:self->_tableView];

  [(CarplayDetailViewController *)self createAndActivateLayoutConstraints];
}

- (void)createAndActivateLayoutConstraints
{
  id v3 = [(CarplayDetailViewController *)self view];
  v19 = [(UITableView *)self->_tableView leadingAnchor];
  v20 = [v3 safeAreaLayoutGuide];
  v18 = [v20 leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v21[0] = v17;
  v15 = [(UITableView *)self->_tableView trailingAnchor];
  objc_super v16 = [v3 safeAreaLayoutGuide];
  v14 = [v16 trailingAnchor];
  v13 = [v15 constraintEqualToAnchor:v14];
  v21[1] = v13;
  uint64_t v4 = [(UITableView *)self->_tableView topAnchor];
  v5 = [v3 safeAreaLayoutGuide];
  uint64_t v6 = [v5 topAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6];
  v21[2] = v7;
  uint64_t v8 = [(UITableView *)self->_tableView bottomAnchor];
  v9 = [v3 safeAreaLayoutGuide];
  uint64_t v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v21[3] = v11;
  v12 = +[NSArray arrayWithObjects:v21 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (BOOL)organizerCanBeMessaged
{
  id v3 = [(EKEvent *)self->_event organizer];
  if (v3)
  {
    uint64_t v4 = [(EKEvent *)self->_event organizer];
    unsigned int v5 = [v4 isCurrentUser] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)eventStoreChanged:(id)a3
{
  if ([(EKEvent *)self->_event refreshIfRefreshableAndNotify:1])
  {
    [(CarplayDetailViewController *)self updateViewWithEvent];
  }
  else
  {
    id v5 = [(CarplayDetailViewController *)self navigationController];
    id v4 = [v5 popViewControllerAnimated:1];
  }
}

- (void)updateViewWithEvent
{
  [(CarplayDetailViewController *)self _initActionIdentifiers];
  tableView = self->_tableView;

  [(UITableView *)tableView reloadData];
}

- (void)_donateUserActivity:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.mobilecal"];
  id v6 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithItemContentType:@"com.apple.mobilecal"];
  objc_super v7 = [v4 title];
  [v6 setContentDescription:v7];

  uint64_t v8 = [v4 structuredLocation];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 title];
    [v6 setNamedLocation:v10];

    v11 = [v9 geoLocation];
    [v11 coordinate];
    v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v6 setLatitude:v12];

    v13 = [v9 geoLocation];
    [v13 coordinate];
    v15 = +[NSNumber numberWithDouble:v14];
    [v6 setLongitude:v15];

    [v6 setSupportsNavigation:&__kCFBooleanTrue];
  }
  objc_super v16 = [v4 virtualConference];
  v17 = [v16 firstPhoneNumber];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [v4 conferenceURLForDisplay];
  }
  v20 = v19;

  if (objc_msgSend(v20, "cal_hasSchemeTel"))
  {
    v21 = [v20 absoluteString];
    v23 = v21;
    v22 = +[NSArray arrayWithObjects:&v23 count:1];
    [v6 setPhoneNumbers:v22];

    [v6 setSupportsPhoneCall:&__kCFBooleanTrue];
  }
  [v5 setContentAttributeSet:v6];
  [v5 setEligibleForSearch:1];
  [v5 setNeedsSave:1];
  [v5 becomeCurrent];
  [(CarplayDetailViewController *)self setUserActivity:v5];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_actionIdentifiers count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  actionIdentifiers = self->_actionIdentifiers;
  id v7 = a4;
  id v8 = a3;
  v9 = -[NSMutableArray objectAtIndexedSubscript:](actionIdentifiers, "objectAtIndexedSubscript:", [v7 row]);
  uint64_t v10 = [v8 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];

  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___DayNameToggleable]) {
    [v10 setShowDayName:self->_showDayName];
  }
  [v10 setDelegate:self];
  [v10 updateWithEvent:self->_event];

  return v10;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [a3 cellForRowAtIndexPath:v5];
  if ([v6 isSelectable]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 cellForRowAtIndexPath:v5];
  [v7 cellWasTapped];
  [v6 deselectRowAtIndexPath:v5 animated:1];
}

- (void)pushViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CarplayDetailViewController *)self navigationController];
  [v5 pushViewController:v4 animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifiers, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end