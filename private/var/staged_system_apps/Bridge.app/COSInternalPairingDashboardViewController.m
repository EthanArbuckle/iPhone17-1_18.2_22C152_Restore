@interface COSInternalPairingDashboardViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (COSInternalPairingDashboardHeader)watchHeader;
- (COSInternalPairingDashboardModel)dashboardData;
- (COSInternalPairingDashboardViewController)init;
- (NRDevice)pairingDevice;
- (OS_dispatch_queue)queue;
- (UITableView)dashboard;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateDashBoardRows:(id)a3;
- (void)_updatePairingEvents:(id)a3;
- (void)_updatePairingEventsWithEvent:(id)a3;
- (void)addPairingDevice:(id)a3;
- (void)dealloc;
- (void)decorateCell:(id)a3 basedOnEvent:(id)a4;
- (void)setDashboard:(id)a3;
- (void)setDashboardData:(id)a3;
- (void)setPairingDevice:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWatchHeader:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSInternalPairingDashboardViewController

- (COSInternalPairingDashboardViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)COSInternalPairingDashboardViewController;
  v2 = [(COSInternalPairingDashboardViewController *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(COSInternalPairingDashboardViewController *)v2 tableView];
    [v4 setDelegate:v3];

    v5 = [(COSInternalPairingDashboardViewController *)v3 tableView];
    [v5 setDataSource:v3];

    v6 = [(COSInternalPairingDashboardViewController *)v3 tableView];
    [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"PairingDashboardCellID"];

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.InternalPairingDashboard", 0);
    [(COSInternalPairingDashboardViewController *)v3 setQueue:v7];

    v8 = objc_alloc_init(COSInternalPairingDashboardModel);
    [(COSInternalPairingDashboardViewController *)v3 setDashboardData:v8];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v3 selector:"_updatePairingEvents:" name:BRPairingMetricChangedNotification object:0];
  }
  return v3;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)COSInternalPairingDashboardViewController;
  [(COSInternalPairingDashboardViewController *)&v13 viewDidLoad];
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  v8 = [(COSInternalPairingDashboardViewController *)self tableView];
  [v8 setTableFooterView:v7];

  v9 = BPSBackgroundColor();
  v10 = [(COSInternalPairingDashboardViewController *)self tableView];
  [v10 setBackgroundColor:v9];

  objc_super v11 = -[COSInternalPairingDashboardHeader initWithFrame:]([COSInternalPairingDashboardHeader alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  watchHeader = self->_watchHeader;
  self->_watchHeader = v11;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:BRPairingMetricChangedNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)COSInternalPairingDashboardViewController;
  [(COSInternalPairingDashboardViewController *)&v4 dealloc];
}

- (void)_updatePairingEvents:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:BRPairingChangedMetricKey];

  [(COSInternalPairingDashboardViewController *)self _updatePairingEventsWithEvent:v5];
  if ([v5 isEqualToString:@"PairingBeginsType"]) {
    [(COSInternalPairingDashboardViewController *)self _updatePairingEventsWithEvent:@"PairingBeginsTime"];
  }
}

- (void)_updatePairingEventsWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(COSInternalPairingDashboardViewController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100042998;
  v7[3] = &unk_100243908;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_updateDashBoardRows:(id)a3
{
  if ([a3 count])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100042AC0;
    block[3] = &unk_1002438A0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)addPairingDevice:(id)a3
{
  id v6 = a3;
  id v4 = [(COSInternalPairingDashboardViewController *)self pairingDevice];

  if (!v4)
  {
    [(COSInternalPairingDashboardViewController *)self setPairingDevice:v6];
    id v5 = [(COSInternalPairingDashboardViewController *)self watchHeader];
    [v5 refreshForWatchDetails:v6];
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return self->_watchHeader;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v4 = [(COSInternalPairingDashboardViewController *)self watchHeader];
  [v4 totalHeaderHeight];
  double v6 = v5 + 10.0;

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(COSInternalPairingDashboardViewController *)self dashboardData];
  double v5 = [v4 pairingEvents];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(COSInternalPairingDashboardViewController *)self dashboardData];
  v9 = [v8 pairingEvents];
  v10 = [v9 objectAtIndex:[v6 row]];

  id v11 = [v7 dequeueReusableCellWithIdentifier:@"PairingDashboardCellID" forIndexPath:v6];

  if (!v11) {
    id v11 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"PairingDashboardCellID"];
  }
  v12 = [v11 textLabel];
  objc_super v13 = [v10 dashboardKey];
  [v12 setText:v13];

  v14 = [v11 textLabel];
  v15 = BPSTextColor();
  [v14 setTextColor:v15];

  v16 = BPSAccessoryColor();
  [v11 setBackgroundColor:v16];

  v17 = [v11 accessoryView];
  v18 = BPSAccessoryColor();
  [v17 setTintColor:v18];

  id v19 = objc_alloc_init((Class)UIView);
  v20 = BPSCellHightlightColor();
  [v19 setBackgroundColor:v20];

  [v11 setSelectedBackgroundView:v19];
  [(COSInternalPairingDashboardViewController *)self decorateCell:v11 basedOnEvent:v10];

  return v11;
}

- (void)decorateCell:(id)a3 basedOnEvent:(id)a4
{
  id v22 = a3;
  id v5 = a4;
  id v6 = +[UIImage systemImageNamed:@"checkmark.circle"];
  id v7 = +[UIColor systemGreenColor];
  id v8 = [v6 imageWithTintColor:v7 renderingMode:1];

  v9 = +[UIImage systemImageNamed:@"xmark.circle"];
  v10 = +[UIColor systemGrayColor];
  id v11 = [v9 imageWithTintColor:v10 renderingMode:1];

  v12 = [v5 eventValue];

  if (v12)
  {
    objc_super v13 = [v5 eventValue];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v15 = [v5 eventValue];
      if ([v15 isEqual:&off_10025BF38]) {
        v16 = v8;
      }
      else {
        v16 = v11;
      }
      id v17 = v16;

      v18 = [v22 imageView];
      [v18 setImage:v17];
    }
    else
    {
      id v19 = [v5 dashboardKey];
      v20 = [v5 eventValue];
      v18 = +[NSString stringWithFormat:@"%@ : %@", v19, v20];

      v21 = [v22 imageView];
      [v21 setImage:v8];

      id v17 = [v22 textLabel];
      [v17 setText:v18];
    }
  }
  else
  {
    v18 = [v22 imageView];
    [v18 setImage:v11];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (COSInternalPairingDashboardModel)dashboardData
{
  return self->_dashboardData;
}

- (void)setDashboardData:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (UITableView)dashboard
{
  return self->_dashboard;
}

- (void)setDashboard:(id)a3
{
}

- (COSInternalPairingDashboardHeader)watchHeader
{
  return self->_watchHeader;
}

- (void)setWatchHeader:(id)a3
{
}

- (NRDevice)pairingDevice
{
  return self->_pairingDevice;
}

- (void)setPairingDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingDevice, 0);
  objc_storeStrong((id *)&self->_watchHeader, 0);
  objc_storeStrong((id *)&self->_dashboard, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_dashboardData, 0);
}

@end