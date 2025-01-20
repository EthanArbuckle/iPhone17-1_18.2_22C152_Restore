@interface HOLocationListViewController
+ (id)viewControllerForPresentingLocationEditorForHome:(id)a3 delegate:(id)a4 customizationBlock:(id)a5;
- (BOOL)_showSpinnerForInvitationWithResponseControllerState:(unint64_t)a3;
- (BOOL)locationSensingAvailable;
- (BOOL)showAddLocationButton;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)tableViewReady;
- (HOLocationListViewController)init;
- (HOLocationListViewController)initWithCoder:(id)a3;
- (HOLocationListViewController)initWithDelegate:(id)a3;
- (HOLocationListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HOLocationListViewController)initWithStyle:(int64_t)a3;
- (HOLocationListViewControllerDelegate)delegate;
- (HUInvitationHelper)invitationHelper;
- (NSMutableArray)homes;
- (NSMutableArray)pendingInvitations;
- (NSMutableDictionary)homesAwaitingPendingInvitations;
- (NSMutableDictionary)invitationResponseControllersByHomeUUID;
- (id)_currentSectionIdentifiers;
- (id)_identifierForSection:(unint64_t)a3;
- (id)_indexPathForPendingInvitation:(id)a3;
- (id)_pendingInvitationIdentifiers;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_indexOfSectionWithIdentifier:(id)a3;
- (void)addLocationViewController:(id)a3 didFinishWithHome:(id)a4;
- (void)doneButtonPressed:(id)a3;
- (void)editButtonPressed:(id)a3;
- (void)editLocationViewControllerWouldPresentAddController:(id)a3;
- (void)homeDidUpdateName:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4;
- (void)homeManagerDidFinishUnknownChange:(id)a3;
- (void)invitationCell:(id)a3 didRespondToInvitationWithResponse:(unint64_t)a4;
- (void)invitationResponseController:(id)a3 stateDidChange:(unint64_t)a4;
- (void)invitationViewControllerDidAcceptInvitation:(id)a3;
- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3;
- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3 error:(id)a4;
- (void)invitationViewControllerDidDeclineInvitation:(id)a3;
- (void)invitationViewControllerDidIgnoreInvitation:(id)a3;
- (void)invitationViewControllerDidReportJunkInvitation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomes:(id)a3;
- (void)setHomesAwaitingPendingInvitations:(id)a3;
- (void)setInvitationHelper:(id)a3;
- (void)setInvitationResponseControllersByHomeUUID:(id)a3;
- (void)setLocationSensingAvailable:(BOOL)a3;
- (void)setPendingInvitations:(id)a3;
- (void)setTableViewReady:(BOOL)a3;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)updateLocationSensingAvailability;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HOLocationListViewController

+ (id)viewControllerForPresentingLocationEditorForHome:(id)a3 delegate:(id)a4 customizationBlock:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, id))a5;
  id v9 = a4;
  v10 = [[HOLocationListViewController alloc] initWithDelegate:v9];

  [(HOLocationListViewController *)v10 loadViewIfNeeded];
  id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v10];
  [v11 setModalPresentationStyle:2];
  if (v7)
  {
    v12 = +[HFHomeKitDispatcher sharedDispatcher];
    v13 = [v12 homeManager];
    v14 = [v13 homes];
    id v15 = [v14 count];

    id v16 = [objc_alloc((Class)HFHomeBuilder) initWithExistingObject:v7 inHome:v7];
    id v17 = objc_alloc((Class)HUEditLocationViewController);
    if ((unint64_t)v15 >= 2) {
      v18 = 0;
    }
    else {
      v18 = v10;
    }
    id v19 = [v17 initWithHomeBuilder:v16 presentationDelegate:v10 addLocationDelegate:v18];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100046738;
    v22[3] = &unk_1000C2AE8;
    id v23 = v11;
    id v20 = v19;
    id v24 = v20;
    +[UIViewController _performWithoutDeferringTransitions:v22];

    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v20 = 0;
  if (v8) {
LABEL_6:
  }
    v8[2](v8, v20);
LABEL_7:

  return v11;
}

- (HOLocationListViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HOLocationListViewController;
  v5 = [(HOLocationListViewController *)&v28 initWithStyle:1];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = +[HFHomeKitDispatcher sharedDispatcher];
    [v7 addHomeManagerObserver:v6];
    [v7 addHomeObserver:v6];
    v8 = [v7 homeManager];
    id v9 = [v8 homes];

    if (!v9)
    {
      uint64_t v10 = objc_opt_class();
      NSLog(@"Creating %@ before the HMHomeManager has any homes!", v10);
    }
    id v11 = [v7 homeManager];
    v12 = [v11 hf_orderedHomes];
    v13 = (NSMutableArray *)[v12 mutableCopy];
    homes = v6->_homes;
    v6->_homes = v13;

    id v15 = +[HFHomeKitDispatcher sharedDispatcher];
    id v16 = [v15 homeManager];
    id v17 = [v16 incomingHomeInvitations];
    v18 = [v17 na_filter:&stru_1000C3FD0];
    id v19 = (NSMutableArray *)[v18 mutableCopy];
    pendingInvitations = v6->_pendingInvitations;
    v6->_pendingInvitations = v19;

    uint64_t v21 = objc_opt_new();
    invitationResponseControllersByHomeUUID = v6->_invitationResponseControllersByHomeUUID;
    v6->_invitationResponseControllersByHomeUUID = (NSMutableDictionary *)v21;

    uint64_t v23 = objc_opt_new();
    homesAwaitingPendingInvitations = v6->_homesAwaitingPendingInvitations;
    v6->_homesAwaitingPendingInvitations = (NSMutableDictionary *)v23;

    v25 = (HUInvitationHelper *)[objc_alloc((Class)HUInvitationHelper) initWithMode:0];
    invitationHelper = v6->_invitationHelper;
    v6->_invitationHelper = v25;

    [(HOLocationListViewController *)v6 updateLocationSensingAvailability];
  }

  return v6;
}

- (HOLocationListViewController)init
{
  id v4 = +[NSAssertionHandler currentHandler];
  v5 = NSStringFromSelector("init");
  [v4 handleFailureInMethod:a2 object:self file:@"HOLocationListViewController.m" lineNumber:123 description:@"%s is unavailable; use %@ instead"];
    "-[HOLocationListViewController init]",
    v5);

  return 0;
}

- (HOLocationListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = +[NSAssertionHandler currentHandler];
  id v7 = NSStringFromSelector("init");
  [v6 handleFailureInMethod:a2 object:self file:@"HOLocationListViewController.m" lineNumber:128 description:@"%s is unavailable; use %@ instead"];
    "-[HOLocationListViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HOLocationListViewController)initWithCoder:(id)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  v6 = NSStringFromSelector("init");
  [v5 handleFailureInMethod:a2 object:self file:@"HOLocationListViewController.m" lineNumber:133 description:@"%s is unavailable; use %@ instead"];
    "-[HOLocationListViewController initWithCoder:]",
    v6);

  return 0;
}

- (HOLocationListViewController)initWithStyle:(int64_t)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  v6 = NSStringFromSelector("init");
  [v5 handleFailureInMethod:a2 object:self file:@"HOLocationListViewController.m" lineNumber:138 description:@"%s is unavailable; use %@ instead"];
    "-[HOLocationListViewController initWithStyle:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)HOLocationListViewController;
  [(HOLocationListViewController *)&v21 viewDidLoad];
  v3 = [(HOLocationListViewController *)self tableView];
  [v3 setRowHeight:UITableViewAutomaticDimension];

  id v4 = [(HOLocationListViewController *)self tableView];
  [v4 setEstimatedRowHeight:44.0];

  v5 = [(HOLocationListViewController *)self tableView];
  [v5 _setSectionContentInsetFollowsLayoutMargins:1];

  v6 = [(HOLocationListViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"HOLocationTableViewCellReuseIdentifier"];

  id v7 = [(HOLocationListViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUButtonCellReuseIdentifier"];

  v8 = [(HOLocationListViewController *)self tableView];
  [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUSwitchCellReuseIdentifier"];

  id v9 = [(HOLocationListViewController *)self tableView];
  [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUIncomingInvitationTableViewCellReuseIdentifier"];

  uint64_t v10 = [(HOLocationListViewController *)self tableView];
  uint64_t v11 = objc_opt_class();
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  [v10 registerClass:v11 forHeaderFooterViewReuseIdentifier:v13];

  id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonPressed:"];
  id v15 = [(HOLocationListViewController *)self navigationItem];
  [v15 setRightBarButtonItem:v14];

  id v16 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"editButtonPressed:"];
  id v17 = [(HOLocationListViewController *)self navigationItem];
  [v17 setLeftBarButtonItem:v16];

  v18 = sub_100046EBC(@"HOLocationListBackButtonTitle");
  id v19 = [(HOLocationListViewController *)self navigationItem];
  [v19 setBackButtonTitle:v18];

  id v20 = sub_100046EBC(@"HOLocationListTitle");
  [(HOLocationListViewController *)self setTitle:v20];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HOLocationListViewController;
  [(HOLocationListViewController *)&v4 viewWillAppear:a3];
  [(HOLocationListViewController *)self setTableViewReady:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HOLocationListViewController;
  [(HOLocationListViewController *)&v4 viewDidDisappear:a3];
  [(HOLocationListViewController *)self setTableViewReady:0];
}

- (void)doneButtonPressed:(id)a3
{
  id v4 = [(HOLocationListViewController *)self delegate];
  [v4 locationListViewControllerDidFinish:self];
}

- (void)editButtonPressed:(id)a3
{
  id v4 = [(HOLocationListViewController *)self tableView];
  unsigned int v5 = [v4 isEditing];

  v6 = [(HOLocationListViewController *)self tableView];
  id v7 = v6;
  if (v5)
  {
    [v6 setEditing:0];

    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"editButtonPressed:"];
    id v9 = [(HOLocationListViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:v8];

    id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonPressed:"];
    uint64_t v11 = [(HOLocationListViewController *)self navigationItem];
    [v11 setRightBarButtonItem:v10];
  }
  else
  {
    [v6 setEditing:1];

    id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"editButtonPressed:"];
    v13 = [(HOLocationListViewController *)self navigationItem];
    [v13 setLeftBarButtonItem:v12];

    id v10 = [(HOLocationListViewController *)self navigationItem];
    [v10 setRightBarButtonItem:0];
  }

  if ([(HOLocationListViewController *)self showAddLocationButton])
  {
    unint64_t v14 = [(HOLocationListViewController *)self _indexOfSectionWithIdentifier:@"HOLocationListLocationsSectionIdentifier"];
    id v15 = [(HOLocationListViewController *)self tableView];
    id v16 = (char *)[v15 numberOfRowsInSection:v14] - 1;

    id v17 = [(HOLocationListViewController *)self tableView];
    v18 = +[NSIndexPath indexPathForRow:v16 inSection:v14];
    id v20 = v18;
    id v19 = +[NSArray arrayWithObjects:&v20 count:1];
    [v17 reloadRowsAtIndexPaths:v19 withRowAnimation:5];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(HOLocationListViewController *)self _currentSectionIdentifiers];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unsigned int v5 = [(HOLocationListViewController *)self _identifierForSection:a4];
  v6 = [(HOLocationListViewController *)self _pendingInvitationIdentifiers];
  if ([v5 isEqualToString:@"HOLocationListLocationsSectionIdentifier"])
  {
    id v7 = [(HOLocationListViewController *)self homes];
    id v8 = [v7 count];
    int64_t v9 = (int64_t)v8 + [(HOLocationListViewController *)self showAddLocationButton];
  }
  else if ([v5 isEqualToString:@"HOLocationListHomeSensingSectionIdentifier"])
  {
    int64_t v9 = 1;
  }
  else
  {
    int64_t v9 = [v6 containsObject:v5];
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", [v7 section]);
  int64_t v9 = [(HOLocationListViewController *)self _pendingInvitationIdentifiers];
  if (![v8 isEqualToString:@"HOLocationListLocationsSectionIdentifier"])
  {
    if ([v8 isEqualToString:@"HOLocationListHomeSensingSectionIdentifier"])
    {
      id v13 = [v6 dequeueReusableCellWithIdentifier:@"HUSwitchCellReuseIdentifier" forIndexPath:v7];
      uint64_t v23 = sub_100046EBC(@"HOLocationListHomeSensingTitle");
      id v24 = [v13 textLabel];
      [v24 setText:v23];

      v25 = +[HFHomeKitDispatcher sharedDispatcher];
      [v13 setOn:[v25 selectedHomeFollowsLocation]];

      [v13 setDelegate:self];
    }
    else
    {
      if (![v9 containsObject:v8]) {
        goto LABEL_19;
      }
      id v13 = [v6 dequeueReusableCellWithIdentifier:@"HUIncomingInvitationTableViewCellReuseIdentifier" forIndexPath:v7];
      if ([(HOLocationListViewController *)self locationSensingAvailable]) {
        CFStringRef v28 = @"HOLocationListHomeSensingSectionIdentifier";
      }
      else {
        CFStringRef v28 = @"HOLocationListLocationsSectionIdentifier";
      }
      unint64_t v29 = ~[(HOLocationListViewController *)self _indexOfSectionWithIdentifier:v28];
      v30 = (char *)[v7 section] + v29;
      v31 = [(HOLocationListViewController *)self pendingInvitations];
      v32 = (char *)[v31 count];

      if (v30 < v32)
      {
        v33 = [(HOLocationListViewController *)self pendingInvitations];
        v34 = [v33 objectAtIndex:v30];

        [v13 setInvitation:v34];
        [v13 setDelegate:self];
        [v13 setSelectionStyle:0];
        v35 = [(HOLocationListViewController *)self invitationResponseControllersByHomeUUID];
        v36 = [v34 homeUUID];
        v37 = [v35 objectForKeyedSubscript:v36];

        if (v37) {
          BOOL v38 = -[HOLocationListViewController _showSpinnerForInvitationWithResponseControllerState:](self, "_showSpinnerForInvitationWithResponseControllerState:", [v37 state]);
        }
        else {
          BOOL v38 = [v34 invitationState] == (id)5;
        }
        [v13 setShowSpinner:v38];
      }
    }
    id v22 = v13;
LABEL_11:

    goto LABEL_20;
  }
  id v10 = [v7 row];
  uint64_t v11 = [(HOLocationListViewController *)self homes];
  id v12 = [v11 count];

  if ((uint64_t)v10 < (uint64_t)v12)
  {
    v40 = v9;
    id v13 = [v6 dequeueReusableCellWithIdentifier:@"HOLocationTableViewCellReuseIdentifier" forIndexPath:v7];
    unint64_t v14 = [(HOLocationListViewController *)self homes];
    id v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

    [v13 setAccessoryType:1];
    id v16 = [v15 name];
    [v13 setTitleText:v16];

    if (objc_msgSend(v15, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade"))
    {
      [v13 setDisabled:1];
      [v13 setAccessoryType:0];
    }
    id v17 = [v15 uniqueIdentifier];
    v18 = +[HFHomeKitDispatcher sharedDispatcher];
    id v19 = [v18 homeManager];
    id v20 = [v19 currentHome];
    objc_super v21 = [v20 uniqueIdentifier];
    [v13 setShowLocationIcon:[v17 isEqual:v21]];

    [v13 setShowsReorderControl:1];
    id v22 = v13;
    int64_t v9 = v40;
    goto LABEL_11;
  }
  if ([(HOLocationListViewController *)self showAddLocationButton])
  {
    id v22 = [v6 dequeueReusableCellWithIdentifier:@"HUButtonCellReuseIdentifier" forIndexPath:v7];
    v26 = sub_100046EBC(@"HOLocationListAddButtonTitle");
    v27 = [v22 textLabel];
    [v27 setText:v26];

    id v13 = [(HOLocationListViewController *)self tableView];
    [v22 setDisabled:[v13 isEditing]];

    goto LABEL_11;
  }
LABEL_19:
  id v22 = 0;
LABEL_20:

  return v22;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", [v5 section]);
  if ([v6 isEqualToString:@"HOLocationListLocationsSectionIdentifier"])
  {
    id v7 = [v5 row];
    id v8 = [(HOLocationListViewController *)self homes];
    BOOL v9 = (uint64_t)v7 < (uint64_t)[v8 count];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v18 = a4;
  id v7 = a5;
  id v8 = -[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", [v18 section]);
  if ([v8 isEqualToString:@"HOLocationListLocationsSectionIdentifier"])
  {
    id v9 = [v18 row];
    if (v9 != [v7 row])
    {
      id v10 = [(HOLocationListViewController *)self homes];
      uint64_t v11 = [v10 objectAtIndexedSubscript:[v18 row]];

      id v12 = [(HOLocationListViewController *)self homes];
      [v12 removeObjectAtIndex:[v18 row]];

      id v13 = [(HOLocationListViewController *)self homes];
      [v13 insertObject:v11 atIndex:[v7 row]];

      unint64_t v14 = +[HFHomeKitDispatcher sharedDispatcher];
      id v15 = [v14 homeManager];
      id v16 = [(HOLocationListViewController *)self homes];
      [v15 hf_setOrderedHomes:v16];
    }
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", [v5 section]);
  if (![v6 isEqualToString:@"HOLocationListLocationsSectionIdentifier"]) {
    goto LABEL_5;
  }
  id v7 = [v5 row];
  id v8 = [(HOLocationListViewController *)self homes];
  id v9 = [v8 count];

  if ((uint64_t)v7 >= (uint64_t)v9) {
    goto LABEL_5;
  }
  uint64_t v10 = [(HOLocationListViewController *)self homes];
  uint64_t v11 = [v10 objectAtIndexedSubscript:[v5 row]];

  LOBYTE(v10) = [v11 hf_shouldBlockCurrentUserFromHomeForRoarUpgrade];
  if (v10) {
    id v12 = 0;
  }
  else {
LABEL_5:
  }
    id v12 = v5;

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v22 = a4;
  [a3 deselectRowAtIndexPath:v22 animated:1];
  id v6 = -[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", [v22 section]);
  if ([v6 isEqualToString:@"HOLocationListLocationsSectionIdentifier"])
  {
    id v7 = [v22 row];
    id v8 = [(HOLocationListViewController *)self homes];
    id v9 = [v8 count];

    if ((uint64_t)v7 >= (uint64_t)v9)
    {
      id v17 = [v22 row];
      id v18 = [(HOLocationListViewController *)self homes];
      id v19 = [v18 count];

      if (v17 != v19) {
        goto LABEL_7;
      }
      id v20 = objc_alloc((Class)UINavigationController);
      objc_super v21 = [[HOAddLocationViewController alloc] initWithName:0 delegate:self];
      id v13 = [v20 initWithRootViewController:v21];

      [v13 setModalPresentationStyle:2];
      [(HOLocationListViewController *)self presentViewController:v13 animated:1 completion:0];
    }
    else
    {
      id v10 = objc_alloc((Class)HFHomeBuilder);
      uint64_t v11 = [(HOLocationListViewController *)self homes];
      id v12 = [v11 objectAtIndexedSubscript:[v22 row]];
      id v13 = [v10 initWithExistingObject:0 inHome:v12];

      id v14 = [objc_alloc((Class)HUEditLocationViewController) initWithHomeBuilder:v13 presentationDelegate:self addLocationDelegate:0];
      id v15 = [(HOLocationListViewController *)self navigationController];
      id v16 = [v15 hu_pushPreloadableViewController:v14 animated:1];
    }
  }
LABEL_7:
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = -[HOLocationListViewController _identifierForSection:](self, "_identifierForSection:", [v8 section]);
  if (![v10 isEqualToString:@"HOLocationListLocationsSectionIdentifier"]) {
    goto LABEL_4;
  }
  id v11 = [v8 section];
  if (v11 == [v9 section])
  {
    id v12 = [v9 row];
    id v13 = [(HOLocationListViewController *)self homes];
    id v14 = [v13 count];

    if ((uint64_t)v12 < (uint64_t)v14)
    {
LABEL_4:
      id v15 = v9;
      goto LABEL_5;
    }
    id v20 = [(HOLocationListViewController *)self homes];
    +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v20 count] - 1, [v8 section]);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = [v9 section];
    id v18 = [v8 section];
    if ((uint64_t)v17 <= (uint64_t)v18)
    {
      id v19 = 0;
    }
    else
    {
      id v5 = [(HOLocationListViewController *)self homes];
      id v19 = (char *)[v5 count] - 1;
    }
    +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v19, [v8 section]);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if ((uint64_t)v17 > (uint64_t)v18) {
  }
    }
LABEL_5:

  return v15;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[UIListContentConfiguration groupedHeaderConfiguration];
  id v8 = [(HOLocationListViewController *)self _identifierForSection:a4];
  id v9 = [(HOLocationListViewController *)self _pendingInvitationIdentifiers];
  if ([v8 isEqualToString:@"HOLocationListLocationsSectionIdentifier"])
  {
    id v10 = @"HOLocationListLocationsSection";
  }
  else
  {
    if ([v9 indexOfObject:v8])
    {
      id v11 = v7;
      id v7 = 0;
      goto LABEL_7;
    }
    id v10 = @"HOLocationListInvitationsSection";
  }
  id v11 = sub_100046EBC(v10);
  [v7 setText:v11];
LABEL_7:

  id v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  id v14 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v13];

  [v14 setContentConfiguration:v7];

  return v14;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[UIListContentConfiguration groupedFooterConfiguration];
  id v8 = [(HOLocationListViewController *)self _identifierForSection:a4];
  id v9 = [(HOLocationListViewController *)self _pendingInvitationIdentifiers];
  id v10 = [v9 indexOfObject:v8];
  if (v10 == (char *)[v9 count] - 1)
  {
    id v11 = @"HOLocationListInvitationsSectionFooter";
LABEL_5:
    id v12 = sub_100046EBC(v11);
    [v7 setText:v12];
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"HOLocationListHomeSensingSectionIdentifier"])
  {
    id v11 = @"HOLocationListHomeSensingSectionFooter";
    goto LABEL_5;
  }
  id v12 = v7;
  id v7 = 0;
LABEL_7:

  id v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  id v15 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v14];

  [v15 setContentConfiguration:v7];

  return v15;
}

- (void)homeManagerDidFinishUnknownChange:(id)a3
{
  id v4 = [a3 hf_orderedHomes];
  id v5 = [v4 mutableCopy];
  [(HOLocationListViewController *)self setHomes:v5];

  id v6 = [(HOLocationListViewController *)self tableView];
  [v6 reloadData];
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[HOLocationListViewController homeManager:didAddHome:]";
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) home = %@.", buf, 0x16u);
  }

  id v7 = [(HOLocationListViewController *)self pendingInvitations];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100048588;
  v16[3] = &unk_1000C3FF8;
  id v8 = v5;
  id v17 = v8;
  id v9 = [v7 na_firstObjectPassingTest:v16];

  if (v9 && ([v9 invitationState] == (id)2 || objc_msgSend(v9, "invitationState") == (id)5))
  {
    id v10 = [(HOLocationListViewController *)self homesAwaitingPendingInvitations];
    id v11 = [v8 uuid];
    [v10 setObject:v8 forKey:v11];
  }
  else
  {
    id v12 = [(HOLocationListViewController *)self homes];
    [v12 addObject:v8];

    id v10 = +[HFHomeKitDispatcher sharedDispatcher];
    id v11 = [v10 homeManager];
    id v13 = [(HOLocationListViewController *)self homes];
    [v11 hf_setOrderedHomes:v13];
  }
  id v15 = [(HOLocationListViewController *)self tableView];
  [v15 reloadData];
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5 = a4;
  id v6 = [(HOLocationListViewController *)self homes];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100048718;
  id v15 = &unk_1000C4020;
  id v16 = v5;
  id v7 = v5;
  id v8 = [v6 indexOfObjectPassingTest:&v12];

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [v7 uniqueIdentifier];
    id v10 = [v9 UUIDString];
    NSLog(@"Received didRemoveHome: event for unknown home: %@", v10, v12, v13, v14, v15, v16);
  }
  else
  {
    id v11 = [(HOLocationListViewController *)self homes];
    [v11 removeObjectAtIndex:v8];

    id v9 = [(HOLocationListViewController *)self tableView];
    [v9 reloadData];
  }
}

- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4
{
  id v5 = a4;
  id v6 = [(HOLocationListViewController *)self tableView];
  [v6 beginUpdates];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v54;
    do
    {
      id v10 = 0;
      id v51 = v8;
      do
      {
        if (*(void *)v54 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v10);
        if (objc_msgSend(v11, "invitationState", v51) == (id)3)
        {
          id v12 = [(HOLocationListViewController *)self homesAwaitingPendingInvitations];
          uint64_t v13 = [v11 homeUUID];
          id v14 = [v12 objectForKey:v13];

          if (v14)
          {
            id v15 = [(HOLocationListViewController *)self homes];
            id v16 = [(HOLocationListViewController *)self homesAwaitingPendingInvitations];
            id v17 = [v11 homeUUID];
            id v18 = [v16 objectForKey:v17];
            [v15 addObject:v18];

            id v19 = +[HFHomeKitDispatcher sharedDispatcher];
            __int16 v20 = [v19 homeManager];
            id v21 = [(HOLocationListViewController *)self homes];
            id v22 = [v20 hf_setOrderedHomes:v21];

            uint64_t v23 = [(HOLocationListViewController *)self homesAwaitingPendingInvitations];
            id v24 = [v11 homeUUID];
            [v23 removeObjectForKey:v24];

            v25 = [(HOLocationListViewController *)self tableView];
            v26 = [(HOLocationListViewController *)self homes];
            v27 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v26 count] - 1, -[HOLocationListViewController _indexOfSectionWithIdentifier:](self, "_indexOfSectionWithIdentifier:", @"HOLocationListLocationsSectionIdentifier"));
            v59 = v27;
            CFStringRef v28 = +[NSArray arrayWithObjects:&v59 count:1];
            [v25 insertRowsAtIndexPaths:v28 withRowAnimation:0];
          }
        }
        if ([v11 invitationState] != (id)2 && objc_msgSend(v11, "invitationState") != (id)5)
        {
          v44 = [(HOLocationListViewController *)self pendingInvitations];
          id v45 = [v44 indexOfObject:v11];

          if (v45 == (id)0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_19;
          }
          v42 = [(HOLocationListViewController *)self _indexPathForPendingInvitation:v11];
          v46 = [(HOLocationListViewController *)self pendingInvitations];
          [v46 removeObjectAtIndex:v45];

          v47 = [(HOLocationListViewController *)self tableView];
          v58 = v42;
          v48 = +[NSArray arrayWithObjects:&v58 count:1];
          [v47 deleteRowsAtIndexPaths:v48 withRowAnimation:0];

          v43 = [(HOLocationListViewController *)self tableView];
          v49 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v42 section]);
          [v43 deleteSections:v49 withRowAnimation:0];

          goto LABEL_18;
        }
        unint64_t v29 = [(HOLocationListViewController *)self pendingInvitations];
        id v30 = [v29 indexOfObject:v11];

        if ([(HOLocationListViewController *)self locationSensingAvailable]) {
          CFStringRef v31 = @"HOLocationListHomeSensingSectionIdentifier";
        }
        else {
          CFStringRef v31 = @"HOLocationListLocationsSectionIdentifier";
        }
        unint64_t v32 = [(HOLocationListViewController *)self _indexOfSectionWithIdentifier:v31];
        if (v30 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v33 = v32 + 1;
          v34 = [(HOLocationListViewController *)self pendingInvitations];
          v35 = (char *)[v34 count];

          v36 = [(HOLocationListViewController *)self pendingInvitations];
          [v36 addObject:v11];

          v37 = [(HOLocationListViewController *)self tableView];
          BOOL v38 = +[NSIndexSet indexSetWithIndex:&v35[v33]];
          [v37 insertSections:v38 withRowAnimation:0];

          v39 = [(HOLocationListViewController *)self tableView];
          v40 = [(HOLocationListViewController *)self _indexPathForPendingInvitation:v11];
          v57 = v40;
          v41 = +[NSArray arrayWithObjects:&v57 count:1];
          [v39 insertRowsAtIndexPaths:v41 withRowAnimation:0];

          v42 = [(HOLocationListViewController *)self tableView];
          id v8 = v51;
          v43 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v33, v35);
          [v42 _reloadSectionHeaderFooters:v43 withRowAnimation:0];
LABEL_18:
        }
LABEL_19:
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v8);
  }

  v50 = [(HOLocationListViewController *)self tableView];
  [v50 endUpdates];
}

- (void)homeDidUpdateName:(id)a3
{
  id v4 = a3;
  id v5 = [(HOLocationListViewController *)self homes];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100048E84;
  v11[3] = &unk_1000C4020;
  id v6 = v4;
  id v12 = v6;
  id v7 = [v5 indexOfObjectPassingTest:v11];

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(HOLocationListViewController *)self tableView];
    uint64_t v9 = +[NSIndexPath indexPathForRow:v7 inSection:0];
    uint64_t v13 = v9;
    id v10 = +[NSArray arrayWithObjects:&v13 count:1];
    [v8 reloadRowsAtIndexPaths:v10 withRowAnimation:100];
  }
}

- (void)editLocationViewControllerWouldPresentAddController:(id)a3
{
  id v4 = objc_alloc((Class)UINavigationController);
  id v5 = [[HOAddLocationViewController alloc] initWithName:0 delegate:self];
  id v6 = [v4 initWithRootViewController:v5];

  [v6 setModalPresentationStyle:2];
  [(HOLocationListViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  id v5 = [(HOLocationListViewController *)self delegate];
  [v5 locationListViewControllerDidFinish:self];

  return +[NAFuture futureWithNoResult];
}

- (void)addLocationViewController:(id)a3 didFinishWithHome:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(HOLocationListViewController *)self navigationController];
    id v8 = [v7 topViewController];
    unsigned __int8 v9 = [v8 isEqual:self];

    if ((v9 & 1) == 0)
    {
      id v10 = [objc_alloc((Class)HFHomeBuilder) initWithExistingObject:0 inHome:v6];
      id v11 = [objc_alloc((Class)HUEditLocationViewController) initWithHomeBuilder:v10 presentationDelegate:self addLocationDelegate:0];
      id v12 = [(HOLocationListViewController *)self navigationController];
      id v13 = [v12 popToRootViewControllerAnimated:0];

      id v14 = [(HOLocationListViewController *)self navigationController];
      id v15 = [v14 hu_pushPreloadableViewController:v11 animated:0];
    }
  }
  [(HOLocationListViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  [v6 setSelectedHomeFollowsLocation:v4];

  +[HFAnalytics sendSwitchCellToggleEventForItem:0 isOn:v4 title:@"HOLocationListHomeSensingTitle" fromSourceViewController:self];
}

- (void)invitationCell:(id)a3 didRespondToInvitationWithResponse:(unint64_t)a4
{
  id v7 = a3;
  id v8 = [v7 invitation];
  unsigned __int8 v9 = [(HOLocationListViewController *)self invitationResponseControllersByHomeUUID];
  id v10 = [v8 homeUUID];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    id v12 = [v8 homeUUID];
    NSLog(@"Already have a response controller for invitation %@!", v12);
  }
  else if (a4 == 4)
  {
    v26 = HFLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v8 hf_prettyDescription];
      *(_DWORD *)buf = 138412290;
      v75 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Confirming report junk for invitation %@", buf, 0xCu);
    }
    CFStringRef v28 = HULocalizedString();
    unint64_t v29 = +[UIAlertController alertControllerWithTitle:v28 message:0 preferredStyle:0];

    objc_initWeak((id *)buf, self);
    id v30 = HULocalizedString();
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10004A028;
    v64[3] = &unk_1000C4070;
    objc_copyWeak(v66, (id *)buf);
    id v65 = v8;
    v66[1] = (id)4;
    CFStringRef v31 = +[UIAlertAction actionWithTitle:v30 style:2 handler:v64];

    unint64_t v32 = HULocalizedString();
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10004A188;
    v62[3] = &unk_1000C23E8;
    id v33 = v29;
    id v63 = v33;
    v34 = +[UIAlertAction actionWithTitle:v32 style:1 handler:v62];

    [v33 addAction:v31];
    [v33 addAction:v34];
    v35 = [v33 popoverPresentationController];
    [v35 setSourceView:v7];
    [(HOLocationListViewController *)self presentViewController:v33 animated:1 completion:0];

    objc_destroyWeak(v66);
    objc_destroyWeak((id *)buf);
  }
  else if (a4 == 1)
  {
    v61 = [v7 invitationHelper];
    if ([v61 isUnknownContact])
    {
      v58 = +[HUInvitationHelper dateFormatter];
      id v13 = [v58 copy];
      [v13 setDateStyle:1];
      [v13 setTimeStyle:0];
      [v13 setDoesRelativeDateFormatting:1];
      id v51 = v13;
      id v14 = [v13 copy];
      [v14 setDateStyle:0];
      v52 = v14;
      [v14 setTimeStyle:1];
      v60 = [v8 startDate];
      v57 = +[NSCalendar autoupdatingCurrentCalendar];
      v59 = +[NSDate date];
      id v15 = [v57 startOfDayForDate:v59];
      long long v56 = +[NSDate hf_dateByAddingDays:-1 toDate:v15];

      id v55 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v56 endDate:v59];
      id v16 = HFLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v8 hf_prettyDescription];
        id v18 = [v61 inviterContact];
        *(_DWORD *)buf = 138412546;
        v75 = v17;
        __int16 v76 = 2112;
        v77 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Confirming invitation %@ from unknown contact %@", buf, 0x16u);
      }
      id v19 = sub_100046EBC(@"HOLocationListInvitationAlertTitle");
      __int16 v20 = [v8 homeName];
      long long v54 = +[NSString stringWithValidatedFormat:v19, @"%@", 0, v20 validFormatSpecifiers error];

      if ([v55 containsDate:v60])
      {
        id v21 = sub_100046EBC(@"HOLocationListInvitationAlertBody_RelativeDate");
        id v22 = [v51 stringFromDate:v60];
        uint64_t v23 = [v52 stringFromDate:v60];
        id v24 = [v61 inviterContact];
        v25 = [v24 givenName];
        long long v53 = +[NSString stringWithValidatedFormat:v21, @"%@ %@ %@", 0, v22, v23, v25 validFormatSpecifiers error];
      }
      else
      {
        id v21 = sub_100046EBC(@"HOLocationListInvitationAlertBody_OtherDate");
        id v22 = [v58 stringFromDate:v60];
        uint64_t v23 = [v61 inviterContact];
        id v24 = [v23 givenName];
        long long v53 = +[NSString stringWithValidatedFormat:v21, @"%@ %@", 0, v22, v24 validFormatSpecifiers error];
      }

      v42 = +[UIAlertController alertControllerWithTitle:v54 message:v53 preferredStyle:1];
      objc_initWeak((id *)buf, self);
      v43 = sub_100046EBC(@"HOLocationListInvitationAlertAccept");
      v44 = [v61 invitation];
      unsigned int v45 = [v44 isInviteeRestrictedGuest];

      if (v45)
      {
        uint64_t v46 = sub_100046EBC(@"HOWelcomeView_Button_Continue");

        v43 = (void *)v46;
      }
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_100049BEC;
      v70[3] = &unk_1000C4048;
      objc_copyWeak(v73, (id *)buf);
      v73[1] = (id)a2;
      id v71 = v61;
      id v72 = v8;
      v73[2] = (id)1;
      v47 = +[UIAlertAction actionWithTitle:v43 style:0 handler:v70];
      [v47 setAccessibilityIdentifier:@"Home.Users.IncomingInvitation.Alert.AcceptOrContinueButton"];
      v48 = sub_100046EBC(@"HOLocationListInvitationAlertCancel");
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_100049F38;
      v67[3] = &unk_1000C4070;
      objc_copyWeak(v69, (id *)buf);
      v69[1] = (id)a2;
      id v49 = v42;
      id v68 = v49;
      v50 = +[UIAlertAction actionWithTitle:v48 style:1 handler:v67];

      [v50 setAccessibilityIdentifier:@"Home.Users.IncomingInvitation.Alert.CancelButton"];
      [v49 addAction:v50];
      [v49 addAction:v47];
      [(HOLocationListViewController *)self presentViewController:v49 animated:1 completion:0];

      objc_destroyWeak(v69);
      objc_destroyWeak(v73);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      v39 = [[HOOnboardingIncomingInvitationViewController alloc] initWithIncomingInvitation:v8 invitationHelper:v61 incomingInvitationDelegate:self];
      [(HOOnboardingIncomingInvitationViewController *)v39 setDelegate:self];
      id v40 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v39];
      id v41 = [(HOLocationListViewController *)self hu_presentPreloadableViewController:v40 animated:1];
    }
  }
  else
  {
    id v36 = [objc_alloc((Class)HUIncomingInvitationResponseController) initWithDelegate:self invitation:v8];
    v37 = [(HOLocationListViewController *)self invitationResponseControllersByHomeUUID];
    BOOL v38 = [v8 homeUUID];
    [v37 setObject:v36 forKeyedSubscript:v38];

    [v36 respondToInvitationWithResponse:a4];
  }
}

- (void)invitationViewControllerDidAcceptInvitation:(id)a3
{
}

- (void)invitationViewControllerDidDeclineInvitation:(id)a3
{
}

- (void)invitationViewControllerDidIgnoreInvitation:(id)a3
{
}

- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "-[HOLocationListViewController invitationViewControllerDidDecideLaterInvitation:error:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Deciding later for invitation | viewController %@ | error %@", buf, 0x20u);
  }

  unsigned __int8 v9 = [(HOLocationListViewController *)self hu_dismissViewControllerAnimated:1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004A418;
  v12[3] = &unk_1000C4098;
  id v13 = v7;
  id v10 = v7;
  id v11 = [v9 addCompletionBlock:v12];
}

- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3
{
}

- (void)invitationViewControllerDidReportJunkInvitation:(id)a3
{
}

- (void)invitationResponseController:(id)a3 stateDidChange:(unint64_t)a4
{
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [v6 state];
    id v8 = HUStringFromIncomingInvitationResponseControllerState();
    unsigned __int8 v9 = [v6 invitation];
    id v10 = [v9 hf_prettyDescription];
    *(_DWORD *)buf = 136315650;
    v27 = "-[HOLocationListViewController invitationResponseController:stateDidChange:]";
    __int16 v28 = 2114;
    unint64_t v29 = v8;
    __int16 v30 = 2112;
    CFStringRef v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) invitation state is %{public}@ for invitation %@", buf, 0x20u);
  }
  id v11 = [(HOLocationListViewController *)self pendingInvitations];
  id v12 = [v6 invitation];
  id v13 = [v11 indexOfObject:v12];

  if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = [v6 invitation];
    id v15 = [(HOLocationListViewController *)self _indexPathForPendingInvitation:v14];

    uint64_t v16 = objc_opt_class();
    id v17 = [(HOLocationListViewController *)self tableView];
    id v18 = [v17 cellForRowAtIndexPath:v15];
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        id v19 = v18;
      }
      else {
        id v19 = 0;
      }
      id v20 = v19;
      if (!v20)
      {
        id v21 = +[NSAssertionHandler currentHandler];
        id v22 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
        [v21 handleFailureInFunction:v22, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v16, objc_opt_class() file lineNumber description];
      }
    }
    else
    {
      id v20 = 0;
    }

    [v20 setShowSpinner:[self _showSpinnerForInvitationWithResponseControllerState:a4]];
    if (a4 == 2)
    {
      uint64_t v23 = [(HOLocationListViewController *)self invitationResponseControllersByHomeUUID];
      id v24 = [v6 invitation];
      v25 = [v24 homeUUID];
      [v23 removeObjectForKey:v25];
    }
  }
}

- (BOOL)_showSpinnerForInvitationWithResponseControllerState:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (id)_currentSectionIdentifiers
{
  v3 = +[NSMutableArray arrayWithObject:@"HOLocationListLocationsSectionIdentifier"];
  if ([(HOLocationListViewController *)self locationSensingAvailable]) {
    [v3 addObject:@"HOLocationListHomeSensingSectionIdentifier"];
  }
  BOOL v4 = [(HOLocationListViewController *)self pendingInvitations];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [(HOLocationListViewController *)self pendingInvitations];
    id v7 = [v6 na_map:&stru_1000C40B8];
    [v3 na_safeAddObjectsFromArray:v7];
  }

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  BOOL v4 = [(HOLocationListViewController *)self _currentSectionIdentifiers];
  if ((unint64_t)[v4 count] <= a3) {
    NSLog(@"Received identifier request for section (%ld), but only have (%ld) sections", a3, [v4 count]);
  }
  if ((unint64_t)[v4 count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (unint64_t)_indexOfSectionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HOLocationListViewController *)self _currentSectionIdentifiers];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004AA20;
  v9[3] = &unk_1000C40E0;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 indexOfObjectPassingTest:v9];

  return (unint64_t)v7;
}

- (id)_pendingInvitationIdentifiers
{
  v2 = [(HOLocationListViewController *)self pendingInvitations];
  v3 = [v2 na_map:&stru_1000C4100];

  return v3;
}

- (id)_indexPathForPendingInvitation:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [v4 UUIDString];
  id v6 = +[NSIndexPath indexPathForRow:0 inSection:[(HOLocationListViewController *)self _indexOfSectionWithIdentifier:v5]];

  return v6;
}

- (BOOL)showAddLocationButton
{
  if (+[HFUtilities isRunningInStoreDemoMode]) {
    return 0;
  }
  else {
    return +[HFUtilities isAMac] ^ 1;
  }
}

- (void)updateLocationSensingAvailability
{
  objc_initWeak(&location, self);
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 locationSensingAvailableFuture];
  id v4 = +[NAScheduler mainThreadScheduler];
  id v5 = [v3 reschedule:v4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004ACD0;
  v7[3] = &unk_1000C4128;
  objc_copyWeak(&v8, &location);
  id v6 = [v5 addCompletionBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (HOLocationListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HOLocationListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
}

- (NSMutableArray)pendingInvitations
{
  return self->_pendingInvitations;
}

- (void)setPendingInvitations:(id)a3
{
}

- (NSMutableDictionary)homesAwaitingPendingInvitations
{
  return self->_homesAwaitingPendingInvitations;
}

- (void)setHomesAwaitingPendingInvitations:(id)a3
{
}

- (NSMutableDictionary)invitationResponseControllersByHomeUUID
{
  return self->_invitationResponseControllersByHomeUUID;
}

- (void)setInvitationResponseControllersByHomeUUID:(id)a3
{
}

- (BOOL)tableViewReady
{
  return self->_tableViewReady;
}

- (void)setTableViewReady:(BOOL)a3
{
  self->_tableViewReady = a3;
}

- (BOOL)locationSensingAvailable
{
  return self->_locationSensingAvailable;
}

- (void)setLocationSensingAvailable:(BOOL)a3
{
  self->_locationSensingAvailable = a3;
}

- (HUInvitationHelper)invitationHelper
{
  return self->_invitationHelper;
}

- (void)setInvitationHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationHelper, 0);
  objc_storeStrong((id *)&self->_invitationResponseControllersByHomeUUID, 0);
  objc_storeStrong((id *)&self->_homesAwaitingPendingInvitations, 0);
  objc_storeStrong((id *)&self->_pendingInvitations, 0);
  objc_storeStrong((id *)&self->_homes, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end