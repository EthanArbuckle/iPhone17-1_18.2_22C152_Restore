@interface MapsSuggestionsMKLocationManagerAdapter
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (MapsSuggestionsMKLocationManagerAdapter)init;
- (void)locationManagerApprovalDidChange:(id)a3;
- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)onStartImplementation;
- (void)onStopImplementation;
@end

@implementation MapsSuggestionsMKLocationManagerAdapter

- (MapsSuggestionsMKLocationManagerAdapter)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("MapsSuggestionsMKLocationManagerAdapterQueue", v3);
  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsMKLocationManagerAdapter;
  v5 = [(MapsSuggestionsMKLocationManagerAdapter *)&v10 initWithName:@"MapsSuggestionsMKLocationManagerAdapter" queue:v4];

  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000826A8;
    v7[3] = &unk_10009F630;
    objc_copyWeak(&v8, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)onStartImplementation
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100082870;
  v2[3] = &unk_10009F630;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)onStopImplementation
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100082A70;
  v2[3] = &unk_10009F630;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = a3;
  -[MapsSuggestionsMKLocationManagerAdapter considerMyAllowanceAsLimited:](self, "considerMyAllowanceAsLimited:", [v4 isAuthorizedForPreciseLocation] ^ 1);
  id v5 = [v4 lastLocation];

  [(MapsSuggestionsMKLocationManagerAdapter *)self considerMyNewLocation:v5];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return [(MapsSuggestionsMKLocationManagerAdapter *)self hasObservers] ^ 1;
}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed updating location: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)locationManagerApprovalDidChange:(id)a3
{
  uint64_t v4 = [(MKLocationManager *)self->_mkLocationManager isAuthorizedForPreciseLocation] ^ 1;

  [(MapsSuggestionsMKLocationManagerAdapter *)self considerMyAllowanceAsLimited:v4];
}

- (void).cxx_destruct
{
}

@end