@interface PUIDXPCClientController
- (PUIDXPCClientController)init;
- (PUIDXPCClientControllerDelegate)delegate;
- (id)_launchingPointerClientForServiceConnection:(id)a3;
- (id)_nonLaunchingServiceConnectionForPointerClient:(id)a3;
- (id)_pointerClientForNonLaunchingServiceConnection:(id)a3;
- (int64_t)_clientInteractionState;
- (int64_t)_pointerVisibilityState;
- (void)_addLaunchingMapBetweenServiceConnection:(id)a3 pointerClient:(id)a4;
- (void)_addNonLaunchingMapBetweenServiceConnection:(id)a3 pointerClient:(id)a4;
- (void)_handleDisconnectForLaunchingConnection:(id)a3;
- (void)_handleDisconnectForNonLaunchingConnection:(id)a3;
- (void)_removeLaunchingMapBetweenServiceConnection:(id)a3 pointerClient:(id)a4;
- (void)_removeNonLaunchingMapBetweenServiceConnection:(id)a3 pointerClient:(id)a4;
- (void)adjustedDecelerationTargetForPointerClient:(id)a3 withTargetPointerPosition:(CGPoint)a4 velocity:(CGPoint)a5 inContextID:(unsigned int)a6 cursorRegionLookupRadius:(double)a7 cursorRegionLookupResolution:(double)a8 lookupConeAngle:(double)a9 completion:(id)a10;
- (void)autohidePointerForReason:(id)a3;
- (void)createContentMatchMoveSourcesForDisplay:(id)a3 countValue:(id)a4 completion:(id)a5;
- (void)createPointerPortalSourceCollectionForDisplay:(id)a3 completion:(id)a4;
- (void)invalidateContentMatchMoveSources:(id)a3 completion:(id)a4;
- (void)invalidatePointerPortalSourceCollection:(id)a3 completion:(id)a4;
- (void)invalidatedPortalSourceCollections:(id)a3 matchMoveSources:(id)a4 forClient:(id)a5;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setActiveHoverRegion:(id)a3 transitionCompletion:(id)a4;
- (void)setClientInteractionState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setOverridesHoverRegions:(id)a3 display:(id)a4;
- (void)setPointerPersistentlyHiddenForReasons:(id)a3;
- (void)setPointerPersistentlyVisibleForReasons:(id)a3;
- (void)setPointerVisibilityState:(int64_t)a3;
- (void)setSystemPointerInteractionContextID:(id)a3 display:(id)a4;
- (void)setWantsServiceKeepAlive:(id)a3;
- (void)set_clientInteractionState:(int64_t)a3;
- (void)set_pointerVisibilityState:(int64_t)a3;
@end

@implementation PUIDXPCClientController

- (PUIDXPCClientController)init
{
  v21.receiver = self;
  v21.super_class = (Class)PUIDXPCClientController;
  v2 = [(PUIDXPCClientController *)&v21 init];
  v3 = v2;
  if (v2)
  {
    v2->_clientServiceCollectionMapLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v5 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v5;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100012074;
    v19[3] = &unk_100044FD8;
    v7 = v3;
    v20 = v7;
    uint64_t v8 = +[BSServiceConnectionListener listenerWithConfigurator:v19];
    id v9 = v7[5];
    v7[5] = (id)v8;

    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_100012114;
    v17 = &unk_100044FD8;
    v10 = v7;
    v18 = v10;
    uint64_t v11 = +[BSServiceConnectionListener listenerWithConfigurator:&v14];
    id v12 = v10[6];
    v10[6] = (id)v11;

    objc_msgSend(v7[5], "activate", v14, v15, v16, v17);
    [v10[6] activate];
  }
  return v3;
}

- (void)adjustedDecelerationTargetForPointerClient:(id)a3 withTargetPointerPosition:(CGPoint)a4 velocity:(CGPoint)a5 inContextID:(unsigned int)a6 cursorRegionLookupRadius:(double)a7 cursorRegionLookupResolution:(double)a8 lookupConeAngle:(double)a9 completion:(id)a10
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v17 = a4.y;
  CGFloat v18 = a4.x;
  id v20 = a3;
  id v21 = a10;
  connectionQueue = self->_connectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000122CC;
  block[3] = &unk_100045078;
  block[4] = self;
  id v26 = v20;
  CGFloat v28 = v18;
  CGFloat v29 = v17;
  CGFloat v30 = x;
  CGFloat v31 = y;
  unsigned int v35 = a6;
  double v32 = a7;
  double v33 = a8;
  double v34 = a9;
  id v27 = v21;
  id v23 = v21;
  id v24 = v20;
  dispatch_async(connectionQueue, block);
}

- (void)invalidatedPortalSourceCollections:(id)a3 matchMoveSources:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connectionQueue = self->_connectionQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001276C;
  v15[3] = &unk_1000450A0;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(connectionQueue, v15);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  v7 = (BSServiceConnectionListener *)a3;
  id v8 = a4;
  id v9 = [v8 remoteProcess];
  unsigned int v10 = [v9 pid];
  pid_t v11 = getpid();

  if (v10 != v11)
  {
    id v12 = [PUIDPointerClient alloc];
    id v13 = +[NSUUID UUID];
    id v14 = [v8 remoteProcess];
    uint64_t v15 = [v14 auditToken];
    id v16 = [(PUIDPointerClient *)v12 initWithUniqueIdentifier:v13 auditToken:v15];

    if (self->_nonLaunchingConnectionListener == v7)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100012BD0;
      v35[3] = &unk_1000450F0;
      id v17 = v8;
      id v36 = v17;
      v37 = self;
      [v17 configureConnection:v35];
      [(PUIDXPCClientController *)self _addNonLaunchingMapBetweenServiceConnection:v17 pointerClient:v16];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012DA0;
      block[3] = &unk_100044C88;
      block[4] = self;
      double v34 = v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      [v17 activate];
      if ([(PUIDXPCClientController *)self _clientInteractionState])
      {
        id v18 = [v17 remoteTarget];
        v19 = +[NSNumber numberWithInteger:[(PUIDXPCClientController *)self _clientInteractionState]];
        [v18 clientInteractionStateDidChange:v19];
      }
      if ([(PUIDXPCClientController *)self _pointerVisibilityState])
      {
        id v20 = [v17 remoteTarget];
        id v21 = +[NSNumber numberWithInteger:[(PUIDXPCClientController *)self _pointerVisibilityState]];
        [v20 pointerVisibilityStateDidChange:v21];
      }
      v22 = v36;
    }
    else
    {
      if (self->_launchingConnectionListener != v7)
      {
        [v8 invalidate];
LABEL_13:

        goto LABEL_14;
      }
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100012DF4;
      v30[3] = &unk_1000450F0;
      id v23 = v8;
      id v31 = v23;
      double v32 = self;
      [v23 configureConnection:v30];
      [(PUIDXPCClientController *)self _addLaunchingMapBetweenServiceConnection:v23 pointerClient:v16];
      id v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472;
      id v26 = sub_100012FC4;
      id v27 = &unk_100044C88;
      CGFloat v28 = self;
      CGFloat v29 = v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v24);
      objc_msgSend(v23, "activate", v24, v25, v26, v27, v28);

      v22 = v31;
    }

    goto LABEL_13;
  }
  [v8 invalidate];
LABEL_14:
}

- (void)createPointerPortalSourceCollectionForDisplay:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v9 = [v8 connection];

  unsigned int v10 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v9];
  if (v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100013180;
    v12[3] = &unk_100045118;
    v12[4] = self;
    id v13 = v6;
    id v14 = v10;
    id v15 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
  else if (v7)
  {
    pid_t v11 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)invalidatePointerPortalSourceCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v9 = [v8 connection];

  unsigned int v10 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v9];
  if (v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100013374;
    v12[3] = &unk_100045118;
    v12[4] = self;
    id v13 = v6;
    id v14 = v10;
    id v15 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
  else if (v7)
  {
    pid_t v11 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)createContentMatchMoveSourcesForDisplay:(id)a3 countValue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  pid_t v11 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v12 = [v11 connection];

  id v13 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v12];
  if (v13)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013568;
    block[3] = &unk_100045140;
    id v16 = v9;
    id v17 = self;
    id v18 = v8;
    id v19 = v13;
    id v20 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (v10)
  {
    id v14 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)invalidateContentMatchMoveSources:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v9 = [v8 connection];

  id v10 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v9];
  if (v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100013920;
    v12[3] = &unk_100045118;
    v12[4] = self;
    id v13 = v6;
    id v14 = v10;
    id v15 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
  else if (v7)
  {
    pid_t v11 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)setActiveHoverRegion:(id)a3 transitionCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v9 = [v8 connection];

  id v10 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v9];
  if (v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100013BB0;
    v12[3] = &unk_100045118;
    id v13 = v6;
    id v14 = self;
    id v15 = v10;
    id v16 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
  else if (v7)
  {
    pid_t v11 = +[NSError errorWithDomain:@"PUIDXPCClientControllerErrorDomain" code:-1002 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)autohidePointerForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v6 = [v5 connection];

  id v7 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v6];
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013DEC;
    block[3] = &unk_100045168;
    void block[4] = self;
    id v10 = v4;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    id v8 = PSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002845C();
    }
  }
}

- (void)setPointerPersistentlyHiddenForReasons:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v6 = [v5 connection];

  id v7 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v6];
  id v8 = v7;
  if (!v7)
  {
    id v11 = PSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000284C4();
    }
    goto LABEL_8;
  }
  id v9 = [v7 auditToken];
  unsigned int v10 = [v9 hasEntitlement:@"com.apple.pointerui.persistentlyHidePointer"];

  if (!v10)
  {
    id v11 = PSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v16 = @"com.apple.pointerui.persistentlyHidePointer";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ignoring persistent hide request because missing entitlement (%@)", buf, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014030;
  block[3] = &unk_100045168;
  void block[4] = self;
  id v13 = v4;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_9:
}

- (void)setPointerPersistentlyVisibleForReasons:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v6 = [v5 connection];

  id v7 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v6];
  id v8 = v7;
  if (!v7)
  {
    id v11 = PSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10002852C();
    }
    goto LABEL_8;
  }
  id v9 = [v7 auditToken];
  unsigned int v10 = [v9 hasEntitlement:@"com.apple.pointerui.persistentlyShowPointer"];

  if (!v10)
  {
    id v11 = PSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v16 = @"com.apple.pointerui.persistentlyShowPointer";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ignoring persistent show request because missing entitlement (%@)", buf, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014264;
  block[3] = &unk_100045168;
  void block[4] = self;
  id v13 = v4;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_9:
}

- (void)setSystemPointerInteractionContextID:(id)a3 display:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v9 = [v8 connection];

  unsigned int v10 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 auditToken];
    unsigned int v13 = [v12 hasEntitlement:@"com.apple.pointerui.set-system-cursor-interaction-context"];

    if (v13)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10001440C;
      v14[3] = &unk_1000450A0;
      v14[4] = self;
      id v15 = v6;
      id v16 = v7;
      id v17 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    }
  }
}

- (void)setOverridesHoverRegions:(id)a3 display:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v9 = [v8 connection];

  unsigned int v10 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 auditToken];
    unsigned int v13 = [v12 hasEntitlement:@"com.apple.pointerui.set-system-cursor-interaction-context"];

    if (v13)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000145F4;
      v15[3] = &unk_1000450A0;
      v15[4] = self;
      id v16 = v6;
      id v17 = v7;
      id v18 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    }
    else
    {
      id v14 = PSLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100028594();
      }
    }
  }
}

- (void)setWantsServiceKeepAlive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_PUIDXPCClientControllerTarget currentTarget];
  id v6 = [v5 connection];

  id v7 = [(PUIDXPCClientController *)self _launchingPointerClientForServiceConnection:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 auditToken];
    unsigned int v10 = [v9 hasEntitlement:@"com.apple.pointerui.service-keep-alive-assertion"];

    if (v10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100014784;
      block[3] = &unk_100045168;
      void block[4] = self;
      id v12 = v4;
      id v13 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)setClientInteractionState:(int64_t)a3
{
  if ([(PUIDXPCClientController *)self _clientInteractionState] != a3)
  {
    [(PUIDXPCClientController *)self set_clientInteractionState:a3];
    connectionQueue = self->_connectionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014884;
    block[3] = &unk_100045190;
    void block[4] = self;
    dispatch_async(connectionQueue, block);
  }
}

- (void)setPointerVisibilityState:(int64_t)a3
{
  if ([(PUIDXPCClientController *)self _pointerVisibilityState] != a3)
  {
    [(PUIDXPCClientController *)self set_pointerVisibilityState:a3];
    connectionQueue = self->_connectionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014ADC;
    block[3] = &unk_100045190;
    void block[4] = self;
    dispatch_async(connectionQueue, block);
  }
}

- (void)_handleDisconnectForLaunchingConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  uint64_t v5 = [(PUIDXPCClientController *)self _launchingPointerClientForServiceConnection:v4];
  if (v5)
  {
    [(PUIDXPCClientController *)self _removeLaunchingMapBetweenServiceConnection:v4 pointerClient:v5];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100014D74;
    v6[3] = &unk_100044C88;
    v6[4] = self;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)_handleDisconnectForNonLaunchingConnection:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  uint64_t v5 = [(PUIDXPCClientController *)self _pointerClientForNonLaunchingServiceConnection:v4];
  if (v5)
  {
    [(PUIDXPCClientController *)self _removeNonLaunchingMapBetweenServiceConnection:v4 pointerClient:v5];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100014EA0;
    v6[3] = &unk_100044C88;
    v6[4] = self;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)_addLaunchingMapBetweenServiceConnection:(id)a3 pointerClient:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_clientServiceCollectionMapLock);
  launchingConnectionToPointerClientMap = self->_launchingConnectionToPointerClientMap;
  if (!launchingConnectionToPointerClientMap)
  {
    id v8 = +[NSMapTable strongToStrongObjectsMapTable];
    id v9 = self->_launchingConnectionToPointerClientMap;
    self->_launchingConnectionToPointerClientMap = v8;

    launchingConnectionToPointerClientMap = self->_launchingConnectionToPointerClientMap;
  }
  [(NSMapTable *)launchingConnectionToPointerClientMap setObject:v6 forKey:v10];
  os_unfair_lock_unlock(&self->_clientServiceCollectionMapLock);
}

- (id)_launchingPointerClientForServiceConnection:(id)a3
{
  p_clientServiceCollectionMapLock = &self->_clientServiceCollectionMapLock;
  id v5 = a3;
  os_unfair_lock_lock(p_clientServiceCollectionMapLock);
  id v6 = [(NSMapTable *)self->_launchingConnectionToPointerClientMap objectForKey:v5];

  os_unfair_lock_unlock(p_clientServiceCollectionMapLock);
  return v6;
}

- (void)_removeLaunchingMapBetweenServiceConnection:(id)a3 pointerClient:(id)a4
{
  p_clientServiceCollectionMapLock = &self->_clientServiceCollectionMapLock;
  id v6 = a3;
  os_unfair_lock_lock(p_clientServiceCollectionMapLock);
  [(NSMapTable *)self->_launchingConnectionToPointerClientMap removeObjectForKey:v6];

  os_unfair_lock_unlock(p_clientServiceCollectionMapLock);
}

- (void)_addNonLaunchingMapBetweenServiceConnection:(id)a3 pointerClient:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_clientServiceCollectionMapLock);
  nonLaunchingConnectionToPointerClientMap = self->_nonLaunchingConnectionToPointerClientMap;
  if (!nonLaunchingConnectionToPointerClientMap)
  {
    id v8 = +[NSMapTable strongToStrongObjectsMapTable];
    id v9 = self->_nonLaunchingConnectionToPointerClientMap;
    self->_nonLaunchingConnectionToPointerClientMap = v8;

    nonLaunchingConnectionToPointerClientMap = self->_nonLaunchingConnectionToPointerClientMap;
  }
  [(NSMapTable *)nonLaunchingConnectionToPointerClientMap setObject:v6 forKey:v13];
  pointerClientToNonLaunchingConnectionMap = self->_pointerClientToNonLaunchingConnectionMap;
  if (!pointerClientToNonLaunchingConnectionMap)
  {
    id v11 = +[NSMapTable strongToStrongObjectsMapTable];
    id v12 = self->_pointerClientToNonLaunchingConnectionMap;
    self->_pointerClientToNonLaunchingConnectionMap = v11;

    pointerClientToNonLaunchingConnectionMap = self->_pointerClientToNonLaunchingConnectionMap;
  }
  [(NSMapTable *)pointerClientToNonLaunchingConnectionMap setObject:v13 forKey:v6];
  os_unfair_lock_unlock(&self->_clientServiceCollectionMapLock);
}

- (id)_nonLaunchingServiceConnectionForPointerClient:(id)a3
{
  p_clientServiceCollectionMapLock = &self->_clientServiceCollectionMapLock;
  id v5 = a3;
  os_unfair_lock_lock(p_clientServiceCollectionMapLock);
  id v6 = [(NSMapTable *)self->_pointerClientToNonLaunchingConnectionMap objectForKey:v5];

  os_unfair_lock_unlock(p_clientServiceCollectionMapLock);
  return v6;
}

- (id)_pointerClientForNonLaunchingServiceConnection:(id)a3
{
  p_clientServiceCollectionMapLock = &self->_clientServiceCollectionMapLock;
  id v5 = a3;
  os_unfair_lock_lock(p_clientServiceCollectionMapLock);
  id v6 = [(NSMapTable *)self->_nonLaunchingConnectionToPointerClientMap objectForKey:v5];

  os_unfair_lock_unlock(p_clientServiceCollectionMapLock);
  return v6;
}

- (void)_removeNonLaunchingMapBetweenServiceConnection:(id)a3 pointerClient:(id)a4
{
  p_clientServiceCollectionMapLock = &self->_clientServiceCollectionMapLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_clientServiceCollectionMapLock);
  [(NSMapTable *)self->_nonLaunchingConnectionToPointerClientMap removeObjectForKey:v8];

  [(NSMapTable *)self->_pointerClientToNonLaunchingConnectionMap removeObjectForKey:v7];
  os_unfair_lock_unlock(p_clientServiceCollectionMapLock);
}

- (PUIDXPCClientControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUIDXPCClientControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)_clientInteractionState
{
  return self->__clientInteractionState;
}

- (void)set_clientInteractionState:(int64_t)a3
{
  self->__clientInteractionState = a3;
}

- (int64_t)_pointerVisibilityState
{
  return self->__pointerVisibilityState;
}

- (void)set_pointerVisibilityState:(int64_t)a3
{
  self->__pointerVisibilityState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_launchingConnectionListener, 0);
  objc_storeStrong((id *)&self->_nonLaunchingConnectionListener, 0);
  objc_storeStrong((id *)&self->_pointerClientToNonLaunchingConnectionMap, 0);
  objc_storeStrong((id *)&self->_nonLaunchingConnectionToPointerClientMap, 0);
  objc_storeStrong((id *)&self->_launchingConnectionToPointerClientMap, 0);
}

@end