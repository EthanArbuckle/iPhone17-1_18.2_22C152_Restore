@interface GKDaemonRuntimeStrategy
+ (void)setup;
- (BOOL)shouldRefreshPreferencesAfterBackgrounding;
- (GKDaemonRuntimeStrategy)init;
- (GKUtilityService)utilityService;
- (GKUtilityServicePrivate)utilityServicePrivate;
- (NSURLSession)instrumentedURLSession;
- (id)localPlayer;
- (void)requestClientsRemoteImageDataForURL:(id)a3 queue:(id)a4 reply:(id)a5;
@end

@implementation GKDaemonRuntimeStrategy

+ (void)setup
{
  v2 = objc_alloc_init(GKDaemonRuntimeStrategy);
  GKSetRuntimeStrategy();
}

- (GKDaemonRuntimeStrategy)init
{
  v8.receiver = self;
  v8.super_class = (Class)GKDaemonRuntimeStrategy;
  v2 = [(GKDaemonRuntimeStrategy *)&v8 init];
  if (v2)
  {
    v3 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    v4 = objc_alloc_init(_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate);
    uint64_t v5 = +[NSURLSession sessionWithConfiguration:v3 delegate:v4 delegateQueue:0];
    instrumentedURLSession = v2->_instrumentedURLSession;
    v2->_instrumentedURLSession = (NSURLSession *)v5;
  }
  return v2;
}

- (GKUtilityService)utilityService
{
  v2 = +[GKClientProxy gameCenterClient];
  v3 = +[GKService serviceWithTransport:0 forClient:v2 localPlayer:0];

  return (GKUtilityService *)v3;
}

- (GKUtilityServicePrivate)utilityServicePrivate
{
  return 0;
}

- (BOOL)shouldRefreshPreferencesAfterBackgrounding
{
  return 0;
}

- (id)localPlayer
{
  return +[GKLocalPlayerInternal archivedProfile];
}

- (void)requestClientsRemoteImageDataForURL:(id)a3 queue:(id)a4 reply:(id)a5
{
}

- (NSURLSession)instrumentedURLSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end