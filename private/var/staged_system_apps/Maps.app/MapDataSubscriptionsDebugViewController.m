@interface MapDataSubscriptionsDebugViewController
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_configuredCellForSubscriptionIdentifier:(id)a3;
- (void)_reloadSubscriptions;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MapDataSubscriptionsDebugViewController

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)MapDataSubscriptionsDebugViewController;
  [(MapDataSubscriptionsDebugViewController *)&v20 viewDidLoad];
  v3 = [(MapDataSubscriptionsDebugViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"subscription"];

  v4 = [(MapDataSubscriptionsDebugViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"map"];

  objc_initWeak(&location, self);
  id v5 = objc_alloc((Class)UITableViewDiffableDataSource);
  v6 = [(MapDataSubscriptionsDebugViewController *)self tableView];
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100706F30;
  v17 = &unk_1012F6068;
  objc_copyWeak(&v18, &location);
  v7 = (UITableViewDiffableDataSource *)[v5 initWithTableView:v6 cellProvider:&v14];
  dataSource = self->_dataSource;
  self->_dataSource = v7;

  v9 = self->_dataSource;
  v10 = [(MapDataSubscriptionsDebugViewController *)self tableView];
  [v10 setDataSource:v9];

  v11 = objc_alloc_init(_MapDataSubscriptionStateObserverRegistry);
  observerRegistry = self->_observerRegistry;
  self->_observerRegistry = v11;

  v13 = self->_observerRegistry;
  if (v13) {
    objc_storeStrong((id *)&v13->_dataSource, self->_dataSource);
  }
  [(MapDataSubscriptionsDebugViewController *)self setTitle:@"Data Subscriptions"];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MapDataSubscriptionsDebugViewController;
  [(MapDataSubscriptionsDebugViewController *)&v14 viewWillAppear:a3];
  if (!self->_subscriptionManager)
  {
    v4 = (GEOMapDataSubscriptionManager *)objc_alloc_init((Class)GEOMapDataSubscriptionManager);
    subscriptionManager = self->_subscriptionManager;
    self->_subscriptionManager = v4;
  }
  objc_initWeak(&location, self);
  v6 = (const char *)GEOMapDataSubscriptionManagerSubscriptionsDidChangeDarwinNotification;
  id v7 = &_dispatch_main_q;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100707100;
  v11 = &unk_1012F6090;
  objc_copyWeak(&v12, &location);
  notify_register_dispatch(v6, &self->_subscriptionsChangedNotifyToken, (dispatch_queue_t)&_dispatch_main_q, &v8);

  [(MapDataSubscriptionsDebugViewController *)self _reloadSubscriptions];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapDataSubscriptionsDebugViewController;
  [(MapDataSubscriptionsDebugViewController *)&v4 viewWillDisappear:a3];
  notify_cancel(self->_subscriptionsChangedNotifyToken);
  self->_subscriptionsChangedNotifyToken = 0;
}

- (id)_configuredCellForSubscriptionIdentifier:(id)a3
{
  id v4 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = self->_subscriptions;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v40;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v40 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * v8);
      v10 = [v9 subscription];
      v11 = [v10 identifier];
      unsigned __int8 v12 = [v11 isEqual:v4];

      if (v12) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    v13 = v9;

    if (!v13)
    {
      id v6 = 0;
      goto LABEL_19;
    }
    objc_super v14 = [(MapDataSubscriptionsDebugViewController *)self tableView];
    id v6 = [v14 dequeueReusableCellWithIdentifier:@"subscription"];

    uint64_t v15 = [(NSArray *)v13 state];
    v16 = +[UIListContentConfiguration subtitleCellConfiguration];
    v17 = [(NSArray *)v13 subscription];
    id v18 = [v17 identifier];
    [v16 setText:v18];

    v19 = [(NSArray *)v13 subscription];
    [v19 policy];
    objc_super v20 = GEOMapDataSubscriptionPolicyAsString();
    [v19 dataTypes];
    v21 = GEOMapDataSubscriptionDataTypeAsString();
    v22 = +[NSString stringWithFormat:@"%@ • %@", v20, v21];

    [v16 setSecondaryText:v22];
    if ([v15 loadState])
    {
      [v6 setAccessoryView:0];
      [v6 setAccessoryType:1];
    }
    else
    {
      objc_initWeak(&location, self);
      v23 = [v15 downloadProgress];
      BOOL v24 = v23 == 0;

      if (v24)
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100707740;
        v32[3] = &unk_1012E6368;
        objc_copyWeak(&v34, &location);
        v33 = v13;
        v28 = +[UIAction actionWithHandler:v32];
        v29 = +[UIButton buttonWithType:0 primaryAction:v28];

        v30 = +[UIImage systemImageNamed:@"icloud.and.arrow.down"];
        [v29 setImage:v30 forState:0];

        [v29 sizeToFit];
        [v6 setAccessoryView:v29];

        objc_destroyWeak(&v34);
      }
      else
      {
        id v25 = objc_alloc_init((Class)MUCircleProgressObservingView);
        v26 = +[UIImage systemImageNamed:@"stop.fill"];
        [v25 setImage:v26];

        v27 = [v15 downloadProgress];
        [v25 setProgress:v27];

        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1007076B0;
        v35[3] = &unk_1012E6690;
        objc_copyWeak(&v37, &location);
        v36 = v13;
        [v25 setPrimaryAction:v35];
        [v6 setAccessoryView:v25];

        objc_destroyWeak(&v37);
      }
      objc_destroyWeak(&location);
    }
    [v6 setContentConfiguration:v16];

    id v5 = v13;
  }
LABEL_18:

LABEL_19:

  return v6;
}

- (void)_reloadSubscriptions
{
  objc_initWeak(&location, self);
  subscriptionManager = self->_subscriptionManager;
  id v4 = &_dispatch_main_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007078C8;
  v5[3] = &unk_1012E7418;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [(GEOMapDataSubscriptionManager *)subscriptionManager fetchAllSubscriptionsWithCallbackQueue:&_dispatch_main_q completionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 section])
  {
    id v8 = [v7 row];
    if (v8 >= (id)[(NSArray *)self->_subscriptions count])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)unsigned __int8 v12 = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: (NSUInteger)indexPath.row < _subscriptions.count", v12, 2u);
      }
    }
    else
    {
      uint64_t v9 = -[NSArray objectAtIndexedSubscript:](self->_subscriptions, "objectAtIndexedSubscript:", [v7 row]);
      v10 = [[MapDataSubscriptionDetailsDebugViewController alloc] initWithSubscription:v9];
      v11 = [(MapDataSubscriptionsDebugViewController *)self navigationController];
      [v11 pushViewController:v10 animated:1];

      [v6 deselectRowAtIndexPath:v7 animated:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_observerRegistry, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);

  objc_storeStrong((id *)&self->_subscriptionManager, 0);
}

@end