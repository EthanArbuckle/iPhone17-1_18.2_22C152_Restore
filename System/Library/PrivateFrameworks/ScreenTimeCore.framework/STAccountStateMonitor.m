@interface STAccountStateMonitor
- (STAccountState)accountState;
- (STAccountStateMonitor)initWithDelegate:(id)a3;
- (STAccountStateMonitorDelegate)delegate;
- (STDebouncer)debouncer;
- (STXPCEventObserver)accountChangeObserver;
- (STXPCEventObserver)familyChangeObserver;
- (id)cloudKitAccountChangeObserver;
- (void)dealloc;
- (void)debouncer:(id)a3 didDebounce:(id)a4;
- (void)reloadAccountState:(BOOL)a3;
- (void)setAccountChangeObserver:(id)a3;
- (void)setAccountState:(id)a3;
- (void)setCloudKitAccountChangeObserver:(id)a3;
- (void)setDebouncer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyChangeObserver:(id)a3;
@end

@implementation STAccountStateMonitor

- (void)dealloc
{
  notify_cancel(self->_TCCAccessChangedNotificationToken);
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_cloudKitAccountChangeObserver];

  v4.receiver = self;
  v4.super_class = (Class)STAccountStateMonitor;
  [(STAccountStateMonitor *)&v4 dealloc];
}

- (STAccountStateMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)STAccountStateMonitor;
  v5 = [(STAccountStateMonitor *)&v34 init];
  objc_storeWeak((id *)&v5->_delegate, v4);
  id v6 = [objc_alloc((Class)STDebouncer) initWithMinCoalescenceInterval:1.0 maxCoalescenceInterval:5.0];
  [v6 setDelegate:v5];
  objc_storeStrong((id *)&v5->_debouncer, v6);
  v7 = +[STXPCEventDispatcher notifydEventDispatcher];
  uint64_t v8 = [v7 registerObserverWithIdentifier:@"com.apple.dmd.iCloudAccount.didChange"];
  accountChangeObserver = v5->_accountChangeObserver;
  v5->_accountChangeObserver = (STXPCEventObserver *)v8;

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100005D44;
  v32[3] = &unk_1002FB278;
  id v10 = v6;
  id v33 = v10;
  [(STXPCEventObserver *)v5->_accountChangeObserver setHandler:v32];
  uint64_t v11 = [v7 registerObserverWithIdentifier:FAFamilyUpdateNotification];
  familyChangeObserver = v5->_familyChangeObserver;
  v5->_familyChangeObserver = (STXPCEventObserver *)v11;

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100005DF8;
  v30[3] = &unk_1002FB278;
  id v13 = v10;
  id v31 = v13;
  [(STXPCEventObserver *)v5->_familyChangeObserver setHandler:v30];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005E04;
  handler[3] = &unk_1002FB2A0;
  id v14 = v13;
  id v29 = v14;
  notify_register_dispatch("com.apple.tcc.access.changed", &v5->_TCCAccessChangedNotificationToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  objc_initWeak(&location, v5);
  v15 = +[NSNotificationCenter defaultCenter];
  v16 = +[NSOperationQueue mainQueue];
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_100005E10;
  v24 = &unk_1002FB2F0;
  objc_copyWeak(&v26, &location);
  id v17 = v14;
  id v25 = v17;
  uint64_t v18 = [v15 addObserverForName:CKAccountChangedNotification object:0 queue:v16 usingBlock:&v21];
  id cloudKitAccountChangeObserver = v5->_cloudKitAccountChangeObserver;
  v5->_id cloudKitAccountChangeObserver = (id)v18;

  -[STAccountStateMonitor reloadAccountState:](v5, "reloadAccountState:", 1, v21, v22, v23, v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v5;
}

- (void)debouncer:(id)a3 didDebounce:(id)a4
{
}

- (void)reloadAccountState:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006104;
  v3[3] = &unk_1002FB390;
  v3[4] = self;
  BOOL v4 = a3;
  +[STUserDescription currentUserWithCompletion:v3];
}

- (STAccountState)accountState
{
  return (STAccountState *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountState:(id)a3
{
}

- (STAccountStateMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STAccountStateMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STDebouncer)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (STXPCEventObserver)accountChangeObserver
{
  return self->_accountChangeObserver;
}

- (void)setAccountChangeObserver:(id)a3
{
}

- (STXPCEventObserver)familyChangeObserver
{
  return self->_familyChangeObserver;
}

- (void)setFamilyChangeObserver:(id)a3
{
}

- (id)cloudKitAccountChangeObserver
{
  return self->_cloudKitAccountChangeObserver;
}

- (void)setCloudKitAccountChangeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cloudKitAccountChangeObserver, 0);
  objc_storeStrong((id *)&self->_familyChangeObserver, 0);
  objc_storeStrong((id *)&self->_accountChangeObserver, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountState, 0);
}

@end