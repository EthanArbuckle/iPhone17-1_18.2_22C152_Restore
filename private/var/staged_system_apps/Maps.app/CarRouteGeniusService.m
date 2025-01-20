@interface CarRouteGeniusService
+ (id)sharedService;
- (BOOL)isActive;
- (CarRouteGeniusService)init;
- (id).cxx_construct;
- (id)suggestion;
- (void)_isActive:(BOOL)a3;
- (void)didUpdateRouteGenius:(id)a3;
- (void)forceReroute;
- (void)registerObserver:(id)a3;
- (void)start;
- (void)stop;
- (void)unregisterObserver:(id)a3;
@end

@implementation CarRouteGeniusService

+ (id)sharedService
{
  if (qword_10160F660 != -1) {
    dispatch_once(&qword_10160F660, &stru_1012F6300);
  }
  v2 = (void *)qword_10160F658;

  return v2;
}

- (CarRouteGeniusService)init
{
  v17.receiver = self;
  v17.super_class = (Class)CarRouteGeniusService;
  v2 = [(CarRouteGeniusService *)&v17 init];
  if (v2)
  {
    v3 = (MNRouteGeniusRemoteService *)[objc_alloc((Class)MNRouteGeniusRemoteService) initWithDelegate:v2];
    remote = v2->_config.remote;
    v2->_config.remote = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = @"MapsSuggestionsRouteGeniusServiceQueue";
    v7 = v5;
    id v8 = [@"MapsSuggestionsRouteGeniusServiceQueue" copy];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], v7);

    innerQueue = v2->_state.queue._innerQueue;
    v2->_state.queue._innerQueue = (OS_dispatch_queue *)v9;

    name = v2->_state.queue._name;
    v2->_state.queue._name = (NSString *)v8;

    id v12 = objc_alloc((Class)MapsSuggestionsObservers);
    v13 = v2->_state.queue._innerQueue;
    v14 = (MapsSuggestionsObservers *)[v12 initWithCallbackQueue:v13 name:@"MapsSuggestionsRouteGeniusServiceObservers"];
    observers = v2->_state.observers;
    v2->_state.observers = v14;
  }
  return v2;
}

- (void)start
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "About to start RouteGeniusService", v4, 2u);
  }

  sub_10070E5CC((NSObject **)&self->_state.queue, self, &stru_1012F6340);
}

- (void)forceReroute
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "About to force RouteGenius to reroute", v4, 2u);
  }

  sub_10070E5CC((NSObject **)&self->_state.queue, self, &stru_1012F6360);
}

- (void)stop
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "About to stop RouteGeniusService", v4, 2u);
  }

  sub_10070E5CC((NSObject **)&self->_state.queue, self, &stru_1012F6380);
}

- (BOOL)isActive
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isActive = v2->_state.isActive;
  objc_sync_exit(v2);

  return isActive;
}

- (void)_isActive:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_state.BOOL isActive = a3;
  objc_sync_exit(obj);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Registering observer: %@", (uint8_t *)&v6, 0xCu);
  }

  [(MapsSuggestionsObservers *)self->_state.observers registerObserver:v4 handler:&stru_1012F63A0];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Unregistering observer: %@", (uint8_t *)&v6, 0xCu);
  }

  [(MapsSuggestionsObservers *)self->_state.observers unregisterObserver:v4 handler:&stru_1012F63C0];
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10070EF24;
  block[3] = &unk_1012F64A0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  innerQueue = self->_state.queue._innerQueue;
  id v6 = v4;
  dispatch_async(innerQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)suggestion
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10070F510;
  v10[3] = &unk_1012F64C8;
  v10[4] = self;
  v3 = v10;
  uint64_t v16 = 0;
  objc_super v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100103EBC;
  v20 = sub_1001047E8;
  id v21 = 0;
  innerQueue = self->_state.queue._innerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  id v12 = sub_10070F658;
  v13 = &unk_1012F6518;
  v15 = &v16;
  v5 = v3;
  id v14 = v5;
  label = dispatch_queue_get_label(innerQueue);
  if (label == dispatch_queue_get_label(0))
  {
    v12((uint64_t)block);
  }
  else
  {
    dispatch_sync(innerQueue, block);
  }
  id v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v8;
}

- (void).cxx_destruct
{
  remote = self->_config.remote;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end