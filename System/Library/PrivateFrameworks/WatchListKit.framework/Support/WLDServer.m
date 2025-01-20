@interface WLDServer
+ (id)server;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (WLDServer)init;
- (id)_init;
- (void)_handleContinueWatchingNotification:(id)a3;
- (void)_handleFamilyUpdateNotification:(id)a3;
- (void)_handleRestrictionsChangedNotification:(id)a3;
- (void)_invalidateWidgets;
- (void)addClient:(id)a3;
- (void)clientConnectionDidInvalidate:(id)a3;
- (void)dealloc;
- (void)handleAMSDeviceOffer;
- (void)handleSubscriptionRegistration;
- (void)handleUNWidgetRegistration;
- (void)handleVideosUIInvalidationNotification:(id)a3;
- (void)start;
@end

@implementation WLDServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  long long v23 = 0u;
  long long v24 = 0u;
  if (v7) {
    [v7 auditToken];
  }
  v22 = 0;
  *(_OWORD *)error = v23;
  long long v21 = v24;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    v9 = v22;
  }
  else
  {
    error[0] = 0;
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    v10 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    v9 = (__CFString *)SecTaskCopySigningIdentifier(v10, error);
    CFRelease(v10);
    if (v9) {
      v11 = v9;
    }
    else {
      NSLog(@"WLDServer - Failed to get signing identifier");
    }
  }
  NSLog(@"WLDServer - Got connection for client '%@'", v9);
  uint64_t v12 = WLKEntitlementWatchList;
  if (!WLDConnectionHasBoolValueForEntitlement(v8, WLKEntitlementWatchList)
    && !WLDConnectionHasBoolValueForEntitlement(v8, WLKEntitlementSuppression))
  {
    goto LABEL_25;
  }
  v13 = (void *)CFPreferencesCopyAppValue(@"ClientIdentifierOverride", @"com.apple.watchlistd");
  if ([v13 length])
  {
    NSLog(@"WLDServer - ClientIdentifierOverride: '%@'", v13);
    v14 = v13;

    v9 = v14;
  }
  if (!WLDConnectionHasBoolValueForEntitlement(v8, v12))
  {
    if (!WLDConnectionHasBoolValueForEntitlement(v8, WLKEntitlementSuppression))
    {
LABEL_24:

LABEL_25:
      NSLog(@"WLDServer - Dropping connection from unentitled client: %@", v8);
      BOOL v17 = 0;
      goto LABEL_26;
    }
    if (v9)
    {
      v15 = &off_1000446E8;
      NSLog(@"WLDServer - Accepted suppression connection for client '%@'", v9);
      goto LABEL_22;
    }
LABEL_23:
    NSLog(@"WLDServer - Failed to get client identifier '%@'", 0);
    goto LABEL_24;
  }
  if (!v9) {
    goto LABEL_23;
  }
  v15 = off_1000446D0;
  NSLog(@"WLDServer - Accepted connection for client '%@'", v9);
LABEL_22:
  id v16 = [objc_alloc(*v15) initWithConnection:v8 clientIdentifier:v9];
  [v16 setDelegate:self];
  [(WLDServer *)self addClient:v16];

  BOOL v17 = 1;
LABEL_26:

  return v17;
}

- (void)addClient:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = v9;
  clients = v4->_clients;
  if (!clients)
  {
    id v7 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:1];
    v8 = v4->_clients;
    v4->_clients = v7;

    clients = v4->_clients;
    id v5 = v9;
  }
  [(NSMutableSet *)clients addObject:v5];
  objc_sync_exit(v4);
}

+ (id)server
{
  if (server___once != -1) {
    dispatch_once(&server___once, &__block_literal_global_0);
  }
  v2 = (void *)server___server;

  return v2;
}

void __19__WLDServer_server__block_invoke(id a1)
{
  server___server = [[WLDServer alloc] _init];

  _objc_release_x1();
}

- (WLDServer)init
{
  return 0;
}

- (void)dealloc
{
  NSLog(@"WLDServer - dealloc", a2);
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)WLDServer;
  [(WLDServer *)&v5 dealloc];
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)WLDServer;
  v2 = [(WLDServer *)&v6 init];
  if (v2)
  {
    +[AMSEphemeralDefaults setHARLoggingEnabled:0];
    id v3 = +[WLDSubscriptionStore sharedInstance];
    v4 = dispatch_get_global_queue(17, 0);
    dispatch_async(v4, &__block_literal_global_34_0);
  }
  return v2;
}

void __18__WLDServer__init__block_invoke(id a1)
{
  id v1 = +[WLKAppLibrary defaultAppLibrary];
  NSLog(@"WLDServer - Prewarm completed");
}

- (void)clientConnectionDidInvalidate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    [v4 setDelegate:0];
    objc_super v5 = self;
    objc_sync_enter(v5);
    [(NSMutableSet *)v5->_clients removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)start
{
  id v3 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLDServer.start", "", buf, 2u);
  }

  NSLog(@"WLDServer - start");
  id v4 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.watchlistd.xpc"];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v4;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  [(NSXPCListener *)self->_xpcListener resume];
  id v6 = +[WLDPlaybackManager sharedManager];
  playbackManager = self->_playbackManager;
  self->_playbackManager = v6;

  v8 = objc_alloc_init(WLDPushNotificationController);
  pushController = self->_pushController;
  self->_pushController = v8;

  id v10 = +[WLKOfferManager defaultOfferManager];
  id v11 = +[WLDAMSBagObserver sharedObserver];
  uint64_t v12 = +[NSNotificationCenter defaultCenter];
  uint64_t v13 = WLKRestrictionsDidChangeNotification;
  v14 = +[WLKRestrictionsObserver sharedObserver];
  [v12 addObserver:self selector:"_handleRestrictionsChangedNotification:" name:v13 object:v14];

  v15 = +[NSDistributedNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"_handleFamilyUpdateNotification:" name:FAFamilyUpdateNotification object:0];

  id v16 = +[NSDistributedNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"_handleContinueWatchingNotification:" name:WLKContinueWatchingRequestDidCompleteNotification object:0];

  id v17 = +[WLDFullTVAppMonitor sharedInstance];
  NSLog(@"WLDServer - start main");
  v18 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLDServer.start", "", v19, 2u);
  }
}

- (void)handleSubscriptionRegistration
{
  NSLog(@"WLDServer - handleSubscriptionRegistration", a2);
  playbackManager = self->_playbackManager;

  [(WLDPlaybackManager *)playbackManager handleSubscriptionRegistration];
}

- (void)handleAMSDeviceOffer
{
  NSLog(@"WLDServer - handleAMSDeviceOffer", a2);
  v2 = objc_alloc_init(WLDDeviceOfferManager);
  [(WLDDeviceOfferManager *)v2 processDeviceOffers];
}

- (void)handleVideosUIInvalidationNotification:(id)a3
{
  NSLog(@"WLDServer - handleVideosUIInvalidationNotification %@", a2, a3);

  [(WLDServer *)self _invalidateWidgets];
}

- (void)handleUNWidgetRegistration
{
  NSLog(@"WLDServer - handleUNWidgetRegistration", a2);
  pushController = self->_pushController;

  [(WLDPushNotificationController *)pushController registerOpportunisticTopics];
}

- (void)_handleRestrictionsChangedNotification:(id)a3
{
  NSLog(@"WLDServer - _handleRestrictionsChangedNotification %@", a2, a3);

  [(WLDServer *)self _invalidateWidgets];
}

- (void)_handleContinueWatchingNotification:(id)a3
{
  NSLog(@"WLDServer - _handleContinueWatchingNotification %@", a2, a3);
  +[WLKUpNextWidgetCacheManager requestInvalidation];

  +[WLKUpNextWidgetCacheManager requestReload];
}

- (void)_invalidateWidgets
{
  +[WLKUpNextWidgetCacheManager requestInvalidation];

  +[WLKUpNextWidgetCacheManager requestReload];
}

- (void)_handleFamilyUpdateNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushController, 0);
  objc_storeStrong((id *)&self->_playbackManager, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end