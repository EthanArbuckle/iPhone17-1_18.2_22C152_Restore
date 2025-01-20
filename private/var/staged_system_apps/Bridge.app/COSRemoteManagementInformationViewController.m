@interface COSRemoteManagementInformationViewController
+ (BOOL)controllerNeedsToRun;
- (BOOL)holdBeforeDisplaying;
- (BOOL)holdWithWaitScreen;
- (BOOL)requiresActivationCheck;
- (COSRemoteManagementInformationViewController)init;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)waitScreenPushGracePeriod;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)localizedWaitScreenDescription;
- (id)suggestedButtonTitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)titleString;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)alternateButtonPressed:(id)a3;
- (void)didEstablishHold;
- (void)discoveryOperationComplete;
- (void)remoteManagementInformationCell:(id)a3 buttonPressed:(id)a4;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSRemoteManagementInformationViewController

- (BOOL)requiresActivationCheck
{
  return 0;
}

+ (BOOL)controllerNeedsToRun
{
  v2 = [UIApp setupController];
  unsigned __int8 v3 = [v2 offerYorktownForCurrentPairing];

  return v3;
}

- (COSRemoteManagementInformationViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)COSRemoteManagementInformationViewController;
  v2 = [(COSRemoteManagementInformationViewController *)&v7 initWithTitle:&stru_100249230 detailText:0 icon:0 contentLayout:3];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    [(COSRemoteManagementInformationViewController *)v2 setStyle:10];
    v4 = [[COSBuddyWatchDiscoveryMonitor alloc] initWithPresentingViewController:v3];
    buddyWatchDiscoveryMonitor = v3->_buddyWatchDiscoveryMonitor;
    v3->_buddyWatchDiscoveryMonitor = v4;

    [(COSBuddyWatchDiscoveryMonitor *)v3->_buddyWatchDiscoveryMonitor setDelegate:v3];
  }
  return v3;
}

- (void)viewDidLoad
{
  v42.receiver = self;
  v42.super_class = (Class)COSRemoteManagementInformationViewController;
  [(COSRemoteManagementInformationViewController *)&v42 viewDidLoad];
  unsigned __int8 v3 = -[COSSelfSizingTableView initWithFrame:style:]([COSSelfSizingTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  sub_100040140((uint64_t)self, v3);

  if (self) {
    tableView = self->_tableView;
  }
  else {
    tableView = 0;
  }
  [(UITableView *)tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(COSRemoteManagementInformationViewController *)self contentView];
  v6 = v5;
  if (self) {
    objc_super v7 = self->_tableView;
  }
  else {
    objc_super v7 = 0;
  }
  [v5 addSubview:v7];

  v41 = [(COSRemoteManagementInformationViewController *)self contentView];
  v8 = [v41 topAnchor];
  if (self) {
    v9 = self->_tableView;
  }
  else {
    v9 = 0;
  }
  v39 = v9;
  v38 = [(UITableView *)v39 topAnchor];
  v37 = [v8 constraintEqualToAnchor:];
  v43[0] = v37;
  v36 = [(COSRemoteManagementInformationViewController *)self contentView];
  v10 = [v36 bottomAnchor];
  if (self) {
    v11 = self->_tableView;
  }
  else {
    v11 = 0;
  }
  v34 = v11;
  v33 = [(UITableView *)v34 bottomAnchor];
  v32 = [v10 constraintEqualToAnchor:];
  v43[1] = v32;
  v31 = [(COSRemoteManagementInformationViewController *)self contentView];
  v12 = [v31 leadingAnchor];
  if (self) {
    v13 = self->_tableView;
  }
  else {
    v13 = 0;
  }
  v14 = v13;
  v15 = [(UITableView *)v14 leadingAnchor];
  v30 = v12;
  v16 = [v12 constraintEqualToAnchor:v15];
  v43[2] = v16;
  v17 = [(COSRemoteManagementInformationViewController *)self contentView];
  v18 = [v17 trailingAnchor];
  v40 = v8;
  v35 = v10;
  if (self) {
    v19 = self->_tableView;
  }
  else {
    v19 = 0;
  }
  v20 = v19;
  v21 = [(UITableView *)v20 trailingAnchor];
  v22 = [v18 constraintEqualToAnchor:v21];
  v43[3] = v22;
  v23 = +[NSArray arrayWithObjects:v43 count:4];
  +[NSLayoutConstraint activateConstraints:v23];

  if (self)
  {
    v24 = &selRef_initWithStyle_reuseIdentifier_specifier_updateIcon_showLearnMore_delegate_;
    v25 = self->_tableView;
    [(UITableView *)v25 registerClass:objc_opt_class() forCellReuseIdentifier:@"COSRemoteManagementInformationCell"];

    v26 = self->_tableView;
  }
  else
  {
    [0 registerClass:objc_opt_class() forCellReuseIdentifier:@"COSRemoteManagementInformationCell"];
    v26 = 0;
    v24 = &selRef_initWithStyle_reuseIdentifier_specifier_updateIcon_showLearnMore_delegate_;
  }
  v27 = v26;
  [(UITableView *)v27 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"COSRemoteManagementInformationHeder"];

  if (self)
  {
    [*(id *)&self->super.BPSWelcomeOptinViewController_opaque[*((int *)v24 + 355)] setRowHeight:UITableViewAutomaticDimension];
    v28 = *(void **)&self->super.BPSWelcomeOptinViewController_opaque[*((int *)v24 + 355)];
  }
  else
  {
    [0 setRowHeight:UITableViewAutomaticDimension];
    v28 = 0;
  }
  [v28 setDelegate:self];
  if (self)
  {
    [*(id *)&self->super.BPSWelcomeOptinViewController_opaque[*((int *)v24 + 355)] setDataSource:self];
    v29 = *(void **)&self->super.BPSWelcomeOptinViewController_opaque[*((int *)v24 + 355)];
  }
  else
  {
    [0 setDataSource:0];
    v29 = 0;
  }
  [v29 setScrollEnabled:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSRemoteManagementInformationViewController;
  [(COSRemoteManagementInformationViewController *)&v4 viewWillAppear:a3];
  [(COSBuddyWatchDiscoveryMonitor *)self->_buddyWatchDiscoveryMonitor startDiscoveryCoordinator];
}

- (id)imageResource
{
  return @"gear";
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"REMOTE_MANAGEMENT_TITLE" value:&stru_100249230 table:@"Localizable-yorktown"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"CLOUD_CONFIG_DESCRIPTION_MANDATORY" value:&stru_100249230 table:@"Localizable-yorktown"];

  return v3;
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"CONTINUE_ENROLLMENT" value:&stru_100249230 table:@"Localizable-yorktown"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  if (_os_feature_enabled_impl())
  {
    buddyWatchDiscoveryMonitor = self->_buddyWatchDiscoveryMonitor;
    [(COSBuddyWatchDiscoveryMonitor *)buddyWatchDiscoveryMonitor discoverWatchesOrShowSpinner];
  }
  else
  {
    id v5 = [(COSRemoteManagementInformationViewController *)self delegate];
    [v5 buddyControllerDone:self];
  }
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"CANCEL_AND_EXIT_PAIRING" value:&stru_100249230 table:@"Localizable-yorktown"];

  return v3;
}

- (void)alternateButtonPressed:(id)a3
{
}

- (BOOL)holdBeforeDisplaying
{
  return 1;
}

- (BOOL)holdWithWaitScreen
{
  return 1;
}

- (double)waitScreenPushGracePeriod
{
  return 5.0;
}

- (void)didEstablishHold
{
  unsigned __int8 v3 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000404C4;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (id)localizedWaitScreenDescription
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"WAITING_MESSAGE_FETCH_ORGANIZATION_INFORMATION" value:&stru_100249230 table:@"Localizable-yorktown"];

  return v3;
}

- (void)discoveryOperationComplete
{
  id v3 = [(COSRemoteManagementInformationViewController *)self delegate];
  [v3 buddyControllerDone:self];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = [a3 dequeueReusableCellWithIdentifier:@"COSRemoteManagementInformationCell" forIndexPath:a4];
  [v5 setDelegate:self];

  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = [a3 dequeueReusableHeaderFooterViewWithIdentifier:@"COSRemoteManagementInformationHeder" a4];
  if (!self || (v6 = self->_organizationName) == 0)
  {
    objc_super v7 = +[NSBundle mainBundle];
    v6 = [v7 localizedStringForKey:@"UNKNOWN" value:&stru_100249230 table:@"Localizable-yorktown"];
  }
  v8 = [(NSString *)v6 stringByAppendingString:@"\n"];

  [v5 setOrganizationName:v8];

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return UITableViewAutomaticDimension;
}

- (void)remoteManagementInformationCell:(id)a3 buttonPressed:(id)a4
{
  id v5 = [COSNavigationController alloc];
  v6 = sub_100040850(self);
  objc_super v7 = [(COSNavigationController *)v5 initWithRootViewController:v6];

  [(COSNavigationController *)v7 setModalPresentationStyle:5];
  [(COSRemoteManagementInformationViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_buddyWatchDiscoveryMonitor, 0);

  objc_storeStrong((id *)&self->_learnMoreViewController, 0);
}

@end