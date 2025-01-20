@interface MFMailDebugMenuController
- (MFMailDebugMenuController)initWithScene:(id)a3;
- (MFMailDebugMenuPresenter)presenter;
- (MailScene)scene;
- (NSArray)sectionNames;
- (NSMutableDictionary)cellsBySection;
- (UITableView)tableView;
- (id)_navBarBackgroundImage;
- (id)_noTitleSectionForButtons;
- (id)_setupBlackPearlSection;
- (id)_setupBlankCellsSection;
- (id)_setupDatabaseSection;
- (id)_setupDebugInformationsSection;
- (id)_setupExperimentsSection;
- (id)_setupGreymatterSection;
- (id)_setupIndexingSection;
- (id)_setupMessageDisplaySection;
- (id)_setupRemoteContentSection;
- (id)_setupSMIMESection;
- (id)_setupTestingSupportSection;
- (id)_setupThreadingSection;
- (id)_setupWidgetSection;
- (id)_tableViewCellsForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)userActivity;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_clearAllUnseenState;
- (void)_clearRestorationState;
- (void)_debugDone;
- (void)_invokeTapToRadar;
- (void)_invokeTapToRadarWithDescription:(id)a3;
- (void)_recategorizeAllMail;
- (void)_resetDatabaseOnNextLaunch;
- (void)_resetGroupingLogic;
- (void)setCellsBySection:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setScene:(id)a3;
- (void)setSectionNames:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MFMailDebugMenuController

- (MFMailDebugMenuController)initWithScene:(id)a3
{
  id v25 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MFMailDebugMenuController;
  v4 = [(MFMailDebugMenuController *)&v30 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    [(MFMailDebugMenuController *)v4 setScene:v25];
    id v24 = [objc_alloc((Class)NSMutableArray) initWithObjects:&stru_100619928, @"Search Indexing 🔍", @"Experiments", @"Threading", @"Message Display", @"Blank Cells", @"Remote Content", @"S/MIME", @"Debug Information", @"Testing Support", @"Widget", @"Database Support", @"Greymatter", 0];
    if (_os_feature_enabled_impl()) {
      [v24 addObject:@"Black Pearl"];
    }
    v6 = (NSArray *)[v24 copy];
    sectionNames = v5->_sectionNames;
    v5->_sectionNames = v6;

    v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](v5->_sectionNames, "count")];
    cellsBySection = v5->_cellsBySection;
    v5->_cellsBySection = v8;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v10 = v5->_sectionNames;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v27;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v14 isEqualToString:&stru_100619928])
          {
            v15 = [(MFMailDebugMenuController *)v5 _noTitleSectionForButtons];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:&stru_100619928];
          }
          else if ([v14 isEqualToString:@"Search Indexing 🔍"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupIndexingSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Search Indexing 🔍"];
          }
          else if ([v14 isEqualToString:@"Experiments"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupExperimentsSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Experiments"];
          }
          else if ([v14 isEqualToString:@"Threading"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupThreadingSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Threading"];
          }
          else if ([v14 isEqualToString:@"Message Display"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupMessageDisplaySection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Message Display"];
          }
          else if ([v14 isEqualToString:@"Blank Cells"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupBlankCellsSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Blank Cells"];
          }
          else if ([v14 isEqualToString:@"Remote Content"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupRemoteContentSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Remote Content"];
          }
          else if ([v14 isEqualToString:@"S/MIME"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupSMIMESection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"S/MIME"];
          }
          else if ([v14 isEqualToString:@"Debug Information"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupDebugInformationsSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Debug Information"];
          }
          else if ([v14 isEqualToString:@"Testing Support"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupTestingSupportSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Testing Support"];
          }
          else if ([v14 isEqualToString:@"Widget"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupWidgetSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Widget"];
          }
          else if ([v14 isEqualToString:@"Greymatter"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupGreymatterSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Greymatter"];
          }
          else if ([v14 isEqualToString:@"Black Pearl"])
          {
            v15 = [(MFMailDebugMenuController *)v5 _setupBlackPearlSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Black Pearl"];
          }
          else
          {
            if (![v14 isEqualToString:@"Database Support"]) {
              continue;
            }
            v15 = [(MFMailDebugMenuController *)v5 _setupDatabaseSection];
            [(NSMutableDictionary *)v5->_cellsBySection setObject:v15 forKeyedSubscript:@"Database Support"];
          }
        }
        id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v11);
    }

    id v16 = objc_alloc((Class)UITableView);
    v17 = [(MFMailDebugMenuController *)v5 view];
    [v17 bounds];
    v18 = [v16 initWithFrame:1];
    tableView = v5->_tableView;
    v5->_tableView = v18;

    [(UITableView *)v5->_tableView setDataSource:v5];
    [(UITableView *)v5->_tableView setDelegate:v5];
    id v20 = objc_alloc_init((Class)UITableViewController);
    [v20 setTableView:v5->_tableView];
    [v20 setTitle:@"Debug Menu"];
    id v21 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v5 action:"_debugDone"];
    v22 = [v20 navigationItem];
    [v22 setRightBarButtonItem:v21];

    [(MFMailDebugMenuController *)v5 pushViewController:v20 animated:1];
    [(MFMailDebugMenuController *)v5 setDelegate:v5];
  }
  return v5;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)MFMailDebugMenuController;
  [(MFMailDebugMenuController *)&v13 viewDidLoad];
  v3 = [(MFMailDebugMenuController *)self navigationBar];
  v4 = [v3 standardAppearance];
  [v4 configureWithOpaqueBackground];

  v5 = [(MFMailDebugMenuController *)self _navBarBackgroundImage];
  v6 = [(MFMailDebugMenuController *)self navigationBar];
  v7 = [v6 standardAppearance];
  [v7 setBackgroundImage:v5];

  v8 = [(MFMailDebugMenuController *)self navigationBar];
  v9 = [v8 standardAppearance];
  [v9 setBackgroundImageContentMode:2];

  v10 = [(MFMailDebugMenuController *)self navigationBar];
  id v11 = [v10 standardAppearance];
  uint64_t v12 = [(MFMailDebugMenuController *)self navigationBar];
  [v12 setScrollEdgeAppearance:v11];
}

- (void)_debugDone
{
  id v3 = [(MFMailDebugMenuController *)self presenter];
  if (v3) {
    [v3 debugMenuWantsDismissal:self];
  }
  else {
    [(MFMailDebugMenuController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(MFMailDebugMenuController *)self sectionNames];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(MFMailDebugMenuController *)self _tableViewCellsForSection:a4];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = -[MFMailDebugMenuController _tableViewCellsForSection:](self, "_tableViewCellsForSection:", [v5 section]);
  v7 = [v6 objectAtIndexedSubscript:[v5 row]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 setDelegate:self];
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(MFMailDebugMenuController *)self sectionNames];
  v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  v6 = [v7 cellForRowAtIndexPath:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 invokeAction];
  }
  [v7 deselectRowAtIndexPath:v5 animated:1];
}

- (id)_tableViewCellsForSection:(int64_t)a3
{
  id v5 = [(MFMailDebugMenuController *)self sectionNames];
  v6 = [v5 objectAtIndexedSubscript:a3];

  id v7 = [(MFMailDebugMenuController *)self cellsBySection];
  v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (id)_setupIndexingSection
{
  v2 = +[DebugButtonCell cellShowingViewControllerClass:objc_opt_class()];
  id v3 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Hide maild indexed (local) results", 53, v2 preference];
  v9[1] = v3;
  id v4 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Hide SearchIndexer (remote) results" preference:54];
  v9[2] = v4;
  id v5 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Disable Server-Side Search" preference:18];
  v9[3] = v5;
  v6 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Disable Indexing" preference:37];
  v9[4] = v6;
  id v7 = +[NSArray arrayWithObjects:v9 count:5];

  return v7;
}

- (id)_setupExperimentsSection
{
  v2 = [DebugSwitchCell alloc];
  id v3 = mf_defaultsKeyForFeature();
  id v4 = [(DebugSwitchCell *)v2 initWithTitle:@"Forward Raw Source" defaultsKey:v3 defaultKeyValue:0 completion:&stru_10060BD90];

  id v5 = +[DebugButtonCell cellShowingViewControllerClass:objc_opt_class()];
  v6 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Sharing From Safari UI", 5, v5, v4 preference];
  v15[2] = v6;
  id v7 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Show Debug Info" preference:7];
  v15[3] = v7;
  v8 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Search Flag Colors" preference:8];
  v15[4] = v8;
  v9 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Favorite Flag Color Mailbox" preference:9];
  v15[5] = v9;
  v10 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Additional Pointer Interactions" preference:10];
  v15[6] = v10;
  id v11 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Allow Filter by Sender" preference:59];
  v15[7] = v11;
  uint64_t v12 = +[DebugButtonCell cellShowingViewControllerClass:objc_opt_class()];
  v15[8] = v12;
  objc_super v13 = +[NSArray arrayWithObjects:v15 count:9];

  return v13;
}

- (id)_setupThreadingSection
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Force In-Memory Threading" preference:2];
  v9[0] = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001AB9CC;
  v6[3] = &unk_100604FE8;
  objc_copyWeak(&v7, &location);
  id v3 = +[DebugButtonCell cellWithTitle:@"Reset Threads State" style:1 handler:v6];
  v9[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v9 count:2];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)_setupMessageDisplaySection
{
  v2 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Ignore BIMI Allowlist" preference:22];
  id v3 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Allow DKIM-signed BIMI", 23, v2 preference];
  v8[1] = v3;
  id v4 = [DebugSwitchCell alloc];
  id v5 = [(DebugSwitchCell *)v4 initWithTitle:@"Show Blocked Sender Banner" defaultsKey:EMPromptUserForBlockedSenderKey defaultKeyValue:1 completion:0];
  v8[2] = v5;
  v6 = +[NSArray arrayWithObjects:v8 count:3];

  return v6;
}

- (id)_setupBlankCellsSection
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Alert on Blank Cell" preference:24];
  v13[0] = v2;
  id v3 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Block XPC Queue" preference:25];
  v13[1] = v3;
  id v4 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Block SQL Queries" preference:26];
  v13[2] = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001ABE38;
  v10[3] = &unk_100604FE8;
  objc_copyWeak(&v11, &location);
  id v5 = +[DebugButtonCell cellWithTitle:@"Simulate Content Protection Changes" style:1 handler:v10];
  v13[3] = v5;
  v6 = +[DebugButtonCell cellWithTitle:@"Simulate Locked Content Protection" style:0 handler:&stru_10060BDD0];
  v13[4] = v6;
  id v7 = +[DebugButtonCell cellWithTitle:@"Reset Content Protection" style:0 handler:&stru_10060BDF0];
  v13[5] = v7;
  v8 = +[NSArray arrayWithObjects:v13 count:6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

- (id)_setupRemoteContentSection
{
  v2 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Request Remote Content Immediately" preference:11];
  id v3 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Always Verify Server-Provided Links", 12, v2 preference];
  v7[1] = v3;
  id v4 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Log Remote Content Links Unredacted" preference:13];
  v7[2] = v4;
  id v5 = +[NSArray arrayWithObjects:v7 count:3];

  return v5;
}

- (id)_setupSMIMESection
{
  v2 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Most Secure" preference:29];
  id v3 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Sign Using application/pkcs7-mime", 30, v2 preference];
  v11[1] = v3;
  id v4 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Skip Device Check" preference:31];
  v11[2] = v4;
  id v5 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Force Advertise GCM" preference:32];
  v11[3] = v5;
  v6 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Force Advertise Subject Encryption" preference:33];
  v11[4] = v6;
  id v7 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Force Encrypt With GCM" preference:34];
  v11[5] = v7;
  v8 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Force Encrypt Subject" preference:35];
  v11[6] = v8;
  v9 = +[NSArray arrayWithObjects:v11 count:7];

  return v9;
}

- (id)_setupDebugInformationsSection
{
  v2 = +[DebugButtonCell cellShowingViewControllerClass:objc_opt_class()];
  v6[0] = v2;
  id v3 = +[DebugButtonCell cellShowingViewControllerClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (id)_noTitleSectionForButtons
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 infoDictionary];
  id v5 = [v4 objectForKey:@"CFBundleVersion"];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v6 = v5;
  id v7 = objc_alloc_init((Class)UITableViewCell);
  v8 = [v7 textLabel];
  [v8 setText:@"Mail Version"];

  id v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v9 setText:v6];
  [v9 sizeToFit];
  [v7 setAccessoryView:v9];
  [v7 setSelectionStyle:0];

  v20[0] = v7;
  v10 = +[DebugButtonCell cellWithTitle:@"File A Radar" style:0 target:self action:"_invokeTapToRadar"];
  v20[1] = v10;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_1001AC6C8;
  v17 = &unk_100604FE8;
  objc_copyWeak(&v18, &location);
  id v11 = +[DebugButtonCell cellWithTitle:@"Kill Mail and maild" style:1 handler:&v14];
  v20[2] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3, v14, v15, v16, v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

- (id)_setupTestingSupportSection
{
  uint64_t v15 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Add Remind Me Debug Date" preference:19];
  v16[0] = v15;
  v14 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Follow Up 10 second Start Date" preference:20];
  v16[1] = v14;
  id v3 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Follow Up 60 second End Date" preference:21];
  v16[2] = v3;
  id v4 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Disable Query Log Submission" preference:38];
  v16[3] = v4;
  id v5 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Fake Managed Accounts" preference:6];
  v16[4] = v5;
  id v6 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Force Mini Tip" preference:36];
  v16[5] = v6;
  id v7 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Disable Snapshot Invalidation" preference:14];
  v16[6] = v7;
  v8 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Disable Initial Message Selection" preference:15];
  v16[7] = v8;
  id v9 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Disable State Restoration" preference:16];
  v16[8] = v9;
  v10 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Simulate delayed free space state" preference:49];
  v16[9] = v10;
  id v11 = +[DebugButtonCell cellWithTitle:@"Clear Restoration State" style:1 target:self action:"_clearRestorationState"];
  v16[10] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v16 count:11];

  return v12;
}

- (void)_clearRestorationState
{
  id v3 = [(MFMailDebugMenuController *)self tableView];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1001ACB74;
  v6[3] = &unk_100604F70;
  void v6[4] = self;
  +[MailRestorationStateClearer clearAllRestorationStates:v5 errorHandler:v6];
}

- (id)_setupWidgetSection
{
  v2 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Enable Threaded Messages" preference:17];
  id v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)_setupGreymatterSection
{
  v2 = +[DebugSwitchCell preferenceSwitchWithTitle:@"CatchUp - Use flagged instead of urgent for query predicate" preference:50];
  id v3 = +[DebugSwitchCell preferenceSwitchWithTitle:@"CatchUp - Remove time limit for Highlights", 51, v2 preference];
  v13[1] = v3;
  id v4 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Greymatter - Override as supported device" preference:57];
  v13[2] = v4;
  id v5 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Greymatter - Override Device Eligibility/Availaility" preference:58];
  v13[3] = v5;
  id v6 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Dynamically update generated summaries" preference:52];
  v13[4] = v6;
  id v7 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Create fake generated summaries for new messages" preference:55];
  v13[5] = v7;
  v8 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Create fake manual summaries" preference:56];
  void v13[6] = v8;
  id v9 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Show FCS feedback options" preference:60];
  v13[7] = v9;
  v10 = +[DebugButtonCell cellShowingViewControllerClass:objc_opt_class()];
  v13[8] = v10;
  id v11 = +[NSArray arrayWithObjects:v13 count:9];

  return v11;
}

- (id)_setupBlackPearlSection
{
  id v16 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Ignore Commerce Filter" preference:41];
  v18[0] = v16;
  uint64_t v15 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Disable Grouping in Business Mailbox" preference:43];
  v18[1] = v15;
  v14 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Show Category" preference:42];
  v18[2] = v14;
  id v3 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Force Collapsed Sender Header" preference:46];
  v18[3] = v3;
  id v4 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Digest Scrolls To Newest Message" preference:47];
  v18[4] = v4;
  id v5 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Allow Find In Digest" preference:48];
  v18[5] = v5;
  id v6 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Ignore Platform Restrictions" preference:45 didChangeHandler:&stru_10060BE10];
  v18[6] = v6;
  id v7 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Ignore Locale Restrictions" preference:40 didChangeHandler:&stru_10060BE30];
  v18[7] = v7;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001AD3F0;
  v17[3] = &unk_1006047A0;
  v17[4] = self;
  v8 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Regex for high impact messages" preference:44 didChangeHandler:v17];
  v18[8] = v8;
  id v9 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Verify Message Body with DKIM" preference:39];
  v18[9] = v9;
  v10 = +[DebugButtonCell cellWithTitle:@"Recategorize All Mail" style:0 target:self action:"_recategorizeAllMail"];
  v18[10] = v10;
  id v11 = +[DebugButtonCell cellWithTitle:@"Clear All Category Cloud Storage" style:1 target:self action:"_clearAllUnseenState"];
  v18[11] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v18 count:12];

  return v12;
}

- (void)_clearAllUnseenState
{
  id v10 = +[UIApplication sharedApplication];
  id v3 = [v10 mailboxCategoryCloudStorage];
  [v3 clearAll];

  id v11 = [(MFMailDebugMenuController *)self scene];
  id v4 = [v11 splitViewController];
  id v5 = [v4 messageListContainerViewController];
  id v6 = [v5 messageListViewController];
  id v7 = [v6 bucketsViewController];

  [v7 clearSessionState];
  v8 = [v11 daemonInterface];
  id v9 = [v8 messageRepository];
  [v9 removeAllEntriesFromBusinessCloudStorage];
}

- (void)_recategorizeAllMail
{
  id v5 = [(MFMailDebugMenuController *)self scene];
  v2 = [v5 daemonInterface];
  id v3 = [v2 messageRepository];
  id v4 = +[NSDate distantPast];
  [v3 recategorizeMessageSinceDate:v4];
}

- (void)_resetGroupingLogic
{
  id v3 = +[UIAlertController alertControllerWithTitle:@"Are you sure?" message:@"This will remove any existing category overrides for senders, and the badging you see on grouped senders and the category bar will not be synced across devices. After selecting this, quit and re-start Mail." preferredStyle:1];
  id v4 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v3 addAction:v4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1001AD834;
  v6[3] = &unk_1006079A8;
  void v6[4] = self;
  id v5 = +[UIAlertAction actionWithTitle:@"Continue" style:2 handler:v6];
  [v3 addAction:v5];
  [(MFMailDebugMenuController *)self presentViewController:v3 animated:1 completion:0];
}

- (id)_setupDatabaseSection
{
  v2 = +[DebugButtonCell cellWithTitle:@"Reset Mail data" style:1 target:self action:"_resetDatabaseOnNextLaunch"];
  id v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void)_resetDatabaseOnNextLaunch
{
  id v5 = +[UIAlertController alertControllerWithTitle:@"Are you sure?" message:@"This will wipe your Mail database. This might include messages that are not on the server. You need to restart the app for this to take effect." preferredStyle:1];
  id v3 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v5 addAction:v3];
  id v4 = +[UIAlertAction actionWithTitle:@"Continue" style:2 handler:&stru_10060BE90];
  [v5 addAction:v4];
  [(MFMailDebugMenuController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_invokeTapToRadar
{
}

- (void)_invokeTapToRadarWithDescription:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001ADBD8;
  void v8[3] = &unk_10060BEB8;
  id v4 = a3;
  id v9 = v4;
  id v5 = objc_retainBlock(v8);
  id v6 = +[MSRadarInteraction interactionWithTitle:@"Mail Issue?" message:@"See something wrong with Mail? Please provide as much information to help us track it down for you." builder:v5];
  id v7 = [v6 interactionViewController];
  [(MFMailDebugMenuController *)self presentViewController:v7 animated:1 completion:0];
}

- (id)userActivity
{
  id v2 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.mail.private.debugmenu"];
  [v2 setTargetContentIdentifier:@"com.apple.mail.private.debugmenu"];

  return v2;
}

- (id)_navBarBackgroundImage
{
  id v2 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:1500.0, 75.0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001ADDFC;
  void v7[3] = &unk_10060BED8;
  v7[4] = 20;
  v7[5] = 0x4052C00000000000;
  id v3 = [v2 imageWithActions:v7];
  id v4 = +[UIColor systemPurpleColor];
  id v5 = [v3 imageWithTintColor:v4];

  return v5;
}

- (MFMailDebugMenuPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (MFMailDebugMenuPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (MailScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (NSArray)sectionNames
{
  return self->_sectionNames;
}

- (void)setSectionNames:(id)a3
{
}

- (NSMutableDictionary)cellsBySection
{
  return self->_cellsBySection;
}

- (void)setCellsBySection:(id)a3
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
  objc_storeStrong((id *)&self->_cellsBySection, 0);
  objc_storeStrong((id *)&self->_sectionNames, 0);
  objc_destroyWeak((id *)&self->_scene);

  objc_destroyWeak((id *)&self->_presenter);
}

@end