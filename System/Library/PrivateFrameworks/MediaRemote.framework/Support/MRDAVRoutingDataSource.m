@interface MRDAVRoutingDataSource
+ (MRDAVRoutingDataSource)allocWithZone:(_NSZone *)a3;
- (BOOL)resetPickedRouteForSource:(unsigned int)a3;
- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3;
- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4;
- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5;
- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5;
- (BOOL)unpickAirPlayRoutes;
- (MRDAVRoute)pickedRoute;
- (MRDAVRoutingDataSource)init;
- (NSArray)pickedRoutes;
- (id)authorizationRequestCallbackForRouteID:(id)a3;
- (id)pickableRoutesForCategory:(id)a3;
- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4;
- (id)pickedRouteForCategory:(id)a3;
- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4;
- (id)pickedRoutesForCategory:(id)a3 source:(unsigned int)a4;
- (unsigned)discoveryMode;
- (unsigned)externalScreenType;
- (void)addAuthorizationCallbackForRouteID:(id)a3 requestCallback:(id)a4;
- (void)removeAuthorizationCallbackForRouteID:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
@end

@implementation MRDAVRoutingDataSource

+ (MRDAVRoutingDataSource)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MRDAVRoutingDataSource *)+[MRDAVRoutingDataSource allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MRDAVRoutingDataSource;
    return (MRDAVRoutingDataSource *)objc_msgSendSuper2(&v6, "allocWithZone:", a3);
  }
}

- (MRDAVRoutingDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRDAVRoutingDataSource;
  v2 = [(MRDAVRoutingDataSource *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MRDAVRoutingDataSource.serialQueue", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (NSArray)pickedRoutes
{
  uint64_t v2 = [(MRDAVRoutingDataSource *)self pickedRoute];
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    dispatch_queue_t v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    dispatch_queue_t v4 = 0;
  }

  return (NSArray *)v4;
}

- (id)pickableRoutesForCategory:(id)a3
{
  return 0;
}

- (id)pickableRoutesForCategory:(id)a3 source:(unsigned int)a4
{
  return 0;
}

- (id)pickedRouteForCategory:(id)a3
{
  return 0;
}

- (id)pickedRoutesForCategory:(id)a3 source:(unsigned int)a4
{
  uint64_t v4 = [(MRDAVRoutingDataSource *)self pickedRouteForCategory:a3 source:*(void *)&a4];
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)pickedRouteForCategory:(id)a3 source:(unsigned int)a4
{
  return 0;
}

- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4
{
  return 0;
}

- (BOOL)setPickedRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5
{
  return 0;
}

- (BOOL)setPickedSystemRoute:(id)a3 withPassword:(id)a4 forSource:(unsigned int)a5
{
  return 0;
}

- (BOOL)resetPickedRouteForSource:(unsigned int)a3
{
  return 0;
}

- (BOOL)resetPickedSystemRouteForSource:(unsigned int)a3
{
  return 0;
}

- (BOOL)unpickAirPlayRoutes
{
  return 0;
}

- (void)addAuthorizationCallbackForRouteID:(id)a3 requestCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037F9C;
  block[3] = &unk_1004170B8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
}

- (void)removeAuthorizationCallbackForRouteID:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000380F8;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (id)authorizationRequestCallbackForRouteID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100038218;
  v16 = sub_100038244;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003824C;
  block[3] = &unk_100416730;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = objc_retainBlock((id)v13[5]);

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (unsigned)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  self->_discoveryMode = a3;
}

- (MRDAVRoute)pickedRoute
{
  return self->_pickedRoute;
}

- (unsigned)externalScreenType
{
  return self->_externalScreenType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickedRoute, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_authorizationCallbacks, 0);
}

@end