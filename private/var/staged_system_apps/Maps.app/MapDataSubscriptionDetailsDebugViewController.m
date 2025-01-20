@interface MapDataSubscriptionDetailsDebugViewController
- (MapDataSubscriptionDetailsDebugViewController)initWithSubscription:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation MapDataSubscriptionDetailsDebugViewController

- (MapDataSubscriptionDetailsDebugViewController)initWithSubscription:(id)a3
{
  id v5 = a3;
  v6 = [(MapDataSubscriptionDetailsDebugViewController *)self initWithStyle:2];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionInfo, a3);
    v8 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

    [(NSDateFormatter *)v7->_dateFormatter setDateStyle:1];
    [(NSDateFormatter *)v7->_dateFormatter setTimeStyle:0];
    v10 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MapDataSubscriptionDetailsDebugViewController;
  [(MapDataSubscriptionDetailsDebugViewController *)&v7 viewDidLoad];
  v3 = [(MapDataSubscriptionDetailsDebugViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"map"];

  v4 = [(MapDataSubscriptionDetailsDebugViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"text"];

  id v5 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo subscription];
  v6 = [v5 identifier];
  [(MapDataSubscriptionDetailsDebugViewController *)self setTitle:v6];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = a4;
  if ([v4 section] || objc_msgSend(v4, "row")) {
    double v5 = UITableViewAutomaticDimension;
  }
  else {
    double v5 = 200.0;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return 6;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    v8 = 0;
  }
  else if ([v7 row])
  {
    v8 = [v6 dequeueReusableCellWithIdentifier:@"text"];
    v9 = +[UIListContentConfiguration valueCellConfiguration];
    switch((unint64_t)[v7 row])
    {
      case 1uLL:
        [v9 setText:@"Identifier"];
        v10 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo subscription];
        uint64_t v11 = [v10 identifier];
        goto LABEL_9;
      case 2uLL:
        [v9 setText:@"App"];
        v10 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo subscription];
        uint64_t v11 = [v10 _originatingBundleIdentifier];
        goto LABEL_9;
      case 3uLL:
        [v9 setText:@"Data"];
        v10 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo subscription];
        [v10 dataTypes];
        uint64_t v11 = GEOMapDataSubscriptionDataTypeAsString();
        goto LABEL_9;
      case 4uLL:
        [v9 setText:@"Policy"];
        v10 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo subscription];
        [v10 policy];
        uint64_t v11 = GEOMapDataSubscriptionPolicyAsString();
LABEL_9:
        v15 = (__CFString *)v11;
        v16 = v9;
        CFStringRef v17 = v15;
        goto LABEL_10;
      case 5uLL:
        [v9 setText:@"Expires"];
        v10 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo subscription];
        v15 = [v10 expirationDate];
        if (v15)
        {
          dateFormatter = self->_dateFormatter;
          v20 = [(MapDataSubscriptionInfo *)self->_subscriptionInfo subscription];
          v21 = [v20 expirationDate];
          v22 = [(NSDateFormatter *)dateFormatter stringFromDate:v21];
          [v9 setSecondaryText:v22];
        }
        else
        {
          CFStringRef v17 = @"Never";
          v16 = v9;
LABEL_10:
          [v16 setSecondaryText:v17];
        }

LABEL_12:
        [v8 setContentConfiguration:v9];
        [v8 setSelectionStyle:0];

        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    v8 = [v6 dequeueReusableCellWithIdentifier:@"map"];
    v12 = [MapDataSubscriptionMapContentConfiguration alloc];
    subscriptionInfo = self->_subscriptionInfo;
    v13 = +[NSArray arrayWithObjects:&subscriptionInfo count:1];
    v14 = [(MapDataSubscriptionMapContentConfiguration *)v12 initWithSubscriptions:v13];
    [v8 setContentConfiguration:v14];

    [v8 setSelectionStyle:0];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);

  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
}

@end