@interface _NACAVRoutingDiscoverySession
- (_NACAVRoutingDiscoverySession)init;
- (void)dealloc;
- (void)fetchRouteForOriginIdentifier:(id)a3 completion:(id)a4;
@end

@implementation _NACAVRoutingDiscoverySession

- (_NACAVRoutingDiscoverySession)init
{
  v11.receiver = self;
  v11.super_class = (Class)_NACAVRoutingDiscoverySession;
  id v2 = [(_NACAVRoutingDiscoverySession *)&v11 init];
  if (v2)
  {
    *((void *)v2 + 1) = MRAVRoutingDiscoverySessionCreate();
    MRAVRoutingDiscoverySessionSetAlwaysAllowUpdates();
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoAudioControl.EndpointObserver", v3);
    v5 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v4;

    dispatch_group_t v6 = dispatch_group_create();
    v7 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v6;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 3));
    objc_initWeak(&location, v2);
    objc_copyWeak(&v9, &location);
    *((void *)v2 + 2) = MRAVRoutingDiscoverySessionAddEndpointsChangedCallback();
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return (_NACAVRoutingDiscoverySession *)v2;
}

- (void)dealloc
{
  callbackToken = self->_callbackToken;
  if (callbackToken) {
    CFRelease(callbackToken);
  }
  discoverySession = self->_discoverySession;
  if (discoverySession) {
    CFRelease(discoverySession);
  }
  v5.receiver = self;
  v5.super_class = (Class)_NACAVRoutingDiscoverySession;
  [(_NACAVRoutingDiscoverySession *)&v5 dealloc];
}

- (void)fetchRouteForOriginIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)os_transaction_create();
  initialFetchGroup = self->_initialFetchGroup;
  serialQueue = self->_serialQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74___NACAVRoutingDiscoverySession_fetchRouteForOriginIdentifier_completion___block_invoke;
  v14[3] = &unk_264CFCB10;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  dispatch_group_notify(initialFetchGroup, serialQueue, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_initialFetchGroup, 0);
}

@end