@interface SKTCCServiceObserver
- (BOOL)isMediaEventsStreamAuthorized;
- (NSString)identifier;
- (SKTCCServiceObserver)init;
- (int64_t)_mediaEventsStreamIsAuthorizedForBundles;
- (int64_t)numberOfAuthorizedBundles;
- (void)_subscribeForTCCEvents;
- (void)dealloc;
- (void)setIdentifier:(id)a3;
- (void)setNumberOfAuthorizedBundles:(int64_t)a3;
@end

@implementation SKTCCServiceObserver

- (SKTCCServiceObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKTCCServiceObserver;
  v2 = [(SKTCCServiceObserver *)&v6 init];
  v3 = v2;
  if (v2)
  {
    int64_t v4 = [(SKTCCServiceObserver *)v2 _mediaEventsStreamIsAuthorizedForBundles];
    v3->_identifier = (NSString *)@"SKMediaEventsHelper";
    v3->_numberOfAuthorizedBundles = v4;
    v3->_q = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SensorKit.SKMediaEventsHelper.TCCEvents", 0);
    [(SKTCCServiceObserver *)v3 _subscribeForTCCEvents];
  }
  return v3;
}

- (void)dealloc
{
  [(NSString *)[(SKTCCServiceObserver *)self identifier] UTF8String];
  tcc_events_unsubscribe();
  dispatch_release((dispatch_object_t)self->_q);

  v3.receiver = self;
  v3.super_class = (Class)SKTCCServiceObserver;
  [(SKTCCServiceObserver *)&v3 dealloc];
}

- (BOOL)isMediaEventsStreamAuthorized
{
  return [(SKTCCServiceObserver *)self numberOfAuthorizedBundles] > 0;
}

- (void)_subscribeForTCCEvents
{
  keys = (char *)[kTCCServiceSensorKitMediaEvents UTF8String];
  xpc_object_t values = xpc_BOOL_create(1);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  tcc_events_filter_create_with_criteria();
  objc_initWeak(&location, self);
  [(NSString *)self->_identifier UTF8String];
  objc_copyWeak(&v4, &location);
  tcc_events_subscribe();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (int64_t)_mediaEventsStreamIsAuthorizedForBundles
{
  v2 = (void *)TCCAccessCopyBundleIdentifiersForService();
  id v3 = [v2 count];

  id v4 = qword_1000089A8;
  if (os_log_type_enabled((os_log_t)qword_1000089A8, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Number of authorized bundles:%li", (uint8_t *)&v6, 0xCu);
  }
  return (int64_t)v3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)numberOfAuthorizedBundles
{
  return self->_numberOfAuthorizedBundles;
}

- (void)setNumberOfAuthorizedBundles:(int64_t)a3
{
  self->_numberOfAuthorizedBundles = a3;
}

@end