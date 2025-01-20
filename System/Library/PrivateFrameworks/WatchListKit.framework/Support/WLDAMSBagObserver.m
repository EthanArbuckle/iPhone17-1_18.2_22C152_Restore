@interface WLDAMSBagObserver
+ (id)sharedObserver;
- (WLDAMSBagObserver)init;
- (void)_amsBagDidChangeNotification:(id)a3;
- (void)dealloc;
@end

@implementation WLDAMSBagObserver

+ (id)sharedObserver
{
  if (sharedObserver___once != -1) {
    dispatch_once(&sharedObserver___once, &__block_literal_global_13);
  }
  v2 = (void *)sharedObserver___sharedObserver;

  return v2;
}

void __35__WLDAMSBagObserver_sharedObserver__block_invoke(id a1)
{
  sharedObserver___sharedObserver = objc_alloc_init(WLDAMSBagObserver);

  _objc_release_x1();
}

- (WLDAMSBagObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)WLDAMSBagObserver;
  v2 = [(WLDAMSBagObserver *)&v6 init];
  if (v2)
  {
    id v3 = +[WLKSettingsAMSBagTracker sharedTracker];
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_amsBagDidChangeNotification:" name:AMSBagChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WLDAMSBagObserver;
  [(WLDAMSBagObserver *)&v4 dealloc];
}

- (void)_amsBagDidChangeNotification:(id)a3
{
  id v3 = a3;
  objc_super v4 = _BagObserverLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Bag did change notifications", buf, 2u);
  }

  v5 = [v3 userInfo];

  objc_super v6 = [v5 objectForKey:AMSBagChangedNotificationUserInfoChangedKeys];
  v7 = +[WLKSettingsAMSBagTracker sharedTracker];
  v8 = dispatch_get_global_queue(0, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __50__WLDAMSBagObserver__amsBagDidChangeNotification___block_invoke;
  v11[3] = &unk_100044E28;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);
}

id __50__WLDAMSBagObserver__amsBagDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = _BagObserverLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Update tracked bag values", v4, 2u);
  }

  return [*(id *)(a1 + 32) updateTrackedBagValuesWithChangedKeys:*(void *)(a1 + 40)];
}

@end