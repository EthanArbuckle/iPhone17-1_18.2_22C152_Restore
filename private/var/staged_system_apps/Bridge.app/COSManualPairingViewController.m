@interface COSManualPairingViewController
- (BOOL)updateDiscoveredDevices;
- (COSManualPairingHeader)headerView;
- (COSManualPairingViewController)initWithStyle:(int64_t)a3;
- (COSPasskeyEntryViewController)passkeyEntryController;
- (Class)headerClass;
- (NSMutableArray)displayedDeviceNames;
- (NSTimer)tableUpdateTimer;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)cellNameForRow:(int64_t)a3;
- (id)didSelectRowAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadDataForUI;
- (void)beginDiscovery;
- (void)controllerCancelled:(id)a3;
- (void)endDiscovery;
- (void)setDisplayedDeviceNames:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setPasskeyEntryController:(id)a3;
- (void)setTableUpdateTimer:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation COSManualPairingViewController

- (COSManualPairingViewController)initWithStyle:(int64_t)a3
{
  v24.receiver = self;
  v24.super_class = (Class)COSManualPairingViewController;
  v3 = [(COSManualPairingViewController *)&v24 initWithStyle:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(COSManualPairingViewController *)v3 tableView];
    [v5 setDelegate:v4];

    v6 = [(COSManualPairingViewController *)v4 tableView];
    [v6 setDataSource:v4];

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    displayedDeviceNames = v4->_displayedDeviceNames;
    v4->_displayedDeviceNames = v7;

    v9 = [objc_alloc(-[COSManualPairingViewController headerClass](v4, "headerClass")) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    headerView = v4->_headerView;
    v4->_headerView = v9;

    id v11 = objc_alloc((Class)UIBarButtonItem);
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"Localizable"];
    id v14 = [v11 initWithTitle:v13 style:0 target:v4 action:"controllerCancelled:"];

    v15 = [(COSManualPairingViewController *)v4 navigationItem];
    [v15 setRightBarButtonItem:v14];

    v16 = [(COSManualPairingViewController *)v4 tableView];
    [v16 registerClass:objc_opt_class() forCellReuseIdentifier:@"SecurePairingCellID"];

    v17 = [(COSManualPairingViewController *)v4 tableView];
    v18 = BPSSeparatorColor();
    [v17 setSeparatorColor:v18];

    v19 = [(COSManualPairingViewController *)v4 view];
    v20 = +[UIColor clearColor];
    [v19 setBackgroundColor:v20];

    v21 = [(COSManualPairingViewController *)v4 view];
    v22 = BPSSetupTintColor();
    [v21 setTintColor:v22];
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COSManualPairingViewController;
  [(COSManualPairingViewController *)&v6 viewWillAppear:a3];
  [(COSManualPairingViewController *)self beginDiscovery];
  if (!self->_tableUpdateTimer)
  {
    v4 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_reloadDataForUI" selector:0 userInfo:1 repeats:1.5];
    tableUpdateTimer = self->_tableUpdateTimer;
    self->_tableUpdateTimer = v4;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSManualPairingViewController;
  [(COSManualPairingViewController *)&v5 viewWillDisappear:a3];
  [(NSTimer *)self->_tableUpdateTimer invalidate];
  tableUpdateTimer = self->_tableUpdateTimer;
  self->_tableUpdateTimer = 0;

  [(COSManualPairingViewController *)self endDiscovery];
}

- (void)_reloadDataForUI
{
  if ([(COSManualPairingViewController *)self updateDiscoveredDevices])
  {
    id v3 = [(COSManualPairingViewController *)self tableView];
    [v3 reloadData];
  }
}

- (void)controllerCancelled:(id)a3
{
  id v5 = a3;
  v4 = [(COSManualPairingViewController *)self navigationController];
  if (objc_opt_respondsToSelector()) {
    [v4 controllerCancelled:v5];
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return self->_headerView;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  objc_super v6 = [(COSManualPairingViewController *)self view];
  [v6 bounds];
  double Width = CGRectGetWidth(v16);
  [v5 _sectionContentInset];
  double v9 = v8;
  [v5 _sectionContentInset];
  double v11 = v10;

  -[COSManualPairingHeader sizeThatFits:](self->_headerView, "sizeThatFits:", Width - (v9 + v11), 0.0);
  double v13 = v12;
  -[COSManualPairingHeader setFrame:](self->_headerView, "setFrame:", CGPointZero.x, CGPointZero.y, v14, v12);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  [a3 deselectRowAtIndexPath:animated:];
  if ([(NSMutableArray *)self->_displayedDeviceNames count])
  {
    objc_super v6 = [(COSManualPairingViewController *)self navigationController];
    v7 = [(COSManualPairingViewController *)self didSelectRowAtIndexPath:v8];
    [v6 pushViewController:v7 animated:1];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_displayedDeviceNames count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"SecurePairingCellID"];
  if ([(NSMutableArray *)self->_displayedDeviceNames count])
  {
    -[COSManualPairingViewController cellNameForRow:](self, "cellNameForRow:", [v6 row]);
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    id v8 = &stru_100249230;
  }
  [v7 setAccessoryType:v9];
  double v10 = [v7 textLabel];
  [v10 setText:v8];

  double v11 = [v7 textLabel];
  double v12 = BPSTextColor();
  [v11 setTextColor:v12];

  double v13 = BPSForegroundColor();
  [v7 setBackgroundColor:v13];

  double v14 = [v7 accessoryView];
  v15 = BPSAccessoryColor();
  [v14 setTintColor:v15];

  id v16 = objc_alloc_init((Class)UIView);
  v17 = BPSCellHightlightColor();
  [v16 setBackgroundColor:v17];

  [v7 setSelectedBackgroundView:v16];

  return v7;
}

- (Class)headerClass
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[COSManualPairingViewController headerClass]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (BOOL)updateDiscoveredDevices
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[COSManualPairingViewController updateDiscoveredDevices]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (void)beginDiscovery
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    int v4 = "-[COSManualPairingViewController beginDiscovery]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v3, 0xCu);
  }
}

- (void)endDiscovery
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    int v4 = "-[COSManualPairingViewController endDiscovery]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v3, 0xCu);
  }
}

- (id)cellNameForRow:(int64_t)a3
{
  int v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[COSManualPairingViewController cellNameForRow:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
  }

  return &stru_100249230;
}

- (id)didSelectRowAtIndexPath:(id)a3
{
  int v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[COSManualPairingViewController didSelectRowAtIndexPath:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (NSMutableArray)displayedDeviceNames
{
  return self->_displayedDeviceNames;
}

- (void)setDisplayedDeviceNames:(id)a3
{
}

- (NSTimer)tableUpdateTimer
{
  return self->_tableUpdateTimer;
}

- (void)setTableUpdateTimer:(id)a3
{
}

- (COSManualPairingHeader)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (COSPasskeyEntryViewController)passkeyEntryController
{
  return self->_passkeyEntryController;
}

- (void)setPasskeyEntryController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkeyEntryController, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableUpdateTimer, 0);

  objc_storeStrong((id *)&self->_displayedDeviceNames, 0);
}

@end