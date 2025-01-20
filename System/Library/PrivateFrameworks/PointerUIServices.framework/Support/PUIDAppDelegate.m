@interface PUIDAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (PUIDAppDelegate)init;
- (void)_pointerUIServiceDidFinishSceneCreationWithSceneBag:(id)a3;
- (void)_setEventFetchThreadPriorityWhenPossible;
- (void)applicationDidCreateFBSScene:(id)a3;
- (void)handleEvent:(id)a3;
- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation PUIDAppDelegate

- (PUIDAppDelegate)init
{
  v12.receiver = self;
  v12.super_class = (Class)PUIDAppDelegate;
  v2 = [(PUIDAppDelegate *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[BSServicesConfiguration extendAutomaticBootstrapCompletion];
    servicesBootstrapExtension = v2->_servicesBootstrapExtension;
    v2->_servicesBootstrapExtension = (BSInvalidatable *)v3;

    v5 = objc_alloc_init(PUIDPointerEventStreamController);
    pointerEventStreamController = v2->_pointerEventStreamController;
    v2->_pointerEventStreamController = v5;

    uint64_t v7 = +[NSMutableSet set];
    displaysThatFinishedSceneCreation = v2->_displaysThatFinishedSceneCreation;
    v2->_displaysThatFinishedSceneCreation = (NSMutableSet *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    sceneBagForDisplay = v2->_sceneBagForDisplay;
    v2->_sceneBagForDisplay = (NSMutableDictionary *)v9;

    [(PUIDAppDelegate *)v2 _setEventFetchThreadPriorityWhenPossible];
  }
  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (void)applicationDidCreateFBSScene:(id)a3
{
  id v5 = a3;
  v6 = [v5 psDisplay];
  if (!v6)
  {
    v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PUIDAppDelegate.m" lineNumber:81 description:@"No display for scene"];
  }
  uint64_t v7 = PSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v5 identifier];
    int v27 = 138543874;
    v28 = v6;
    __int16 v29 = 2048;
    id v30 = v5;
    __int16 v31 = 2114;
    v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@> Scene did connect: <%p:%{public}@> ", (uint8_t *)&v27, 0x20u);
  }
  p_isa = [(NSMutableDictionary *)self->_sceneBagForDisplay objectForKeyedSubscript:v6];
  if (!p_isa)
  {
    v10 = objc_alloc_init(_PUIDSceneBag);
    p_isa = (id *)&v10->super.isa;
    if (v10) {
      objc_storeWeak((id *)&v10->_display, v6);
    }
    [(NSMutableDictionary *)self->_sceneBagForDisplay setObject:p_isa forKeyedSubscript:v6];
  }
  v11 = [v5 identifier];
  unsigned int v12 = [v11 hasPrefix:PSApplicationSceneIdentifierSystemPointer];

  if (v12)
  {
    if (p_isa)
    {
      id WeakRetained = objc_loadWeakRetained(p_isa + 1);

      if (WeakRetained)
      {
        v24 = +[NSAssertionHandler currentHandler];
        [v24 handleFailureInMethod:a2 object:self file:@"PUIDAppDelegate.m" lineNumber:93 description:@"System pointer window scene created twice."];
      }
    }
    v14 = +[UIWindowScene _sceneForFBSScene:v5];
    if (!v14)
    {
      v23 = +[NSAssertionHandler currentHandler];
      [v23 handleFailureInMethod:a2 object:self file:@"PUIDAppDelegate.m" lineNumber:95 description:@"System pointer window scene could not be found."];
    }
    [v14 setDelegate:self];
    [v14 _setKeepContextAssociationInBackground:1];
    if (!p_isa) {
      goto LABEL_26;
    }
    uint64_t v15 = 1;
LABEL_25:
    objc_storeWeak(&p_isa[v15], v14);
LABEL_26:

    goto LABEL_27;
  }
  v16 = [v5 identifier];
  unsigned int v17 = [v16 hasPrefix:PSApplicationSceneIdentifierPointerRendering];

  if (v17)
  {
    if (p_isa)
    {
      id v18 = objc_loadWeakRetained(p_isa + 2);

      if (v18)
      {
        v26 = +[NSAssertionHandler currentHandler];
        [v26 handleFailureInMethod:a2 object:self file:@"PUIDAppDelegate.m" lineNumber:100 description:@"Rendering window scene created twice."];
      }
    }
    v14 = +[UIWindowScene _sceneForFBSScene:v5];
    if (!v14)
    {
      v25 = +[NSAssertionHandler currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"PUIDAppDelegate.m" lineNumber:102 description:@"Rendering window scene could not be found."];
    }
    [v14 setDelegate:self];
    [v14 _setKeepContextAssociationInBackground:1];
    if (!p_isa) {
      goto LABEL_26;
    }
    uint64_t v15 = 2;
    goto LABEL_25;
  }
LABEL_27:
  if (([(NSMutableSet *)self->_displaysThatFinishedSceneCreation containsObject:v6] & 1) == 0)
  {
    if (p_isa)
    {
      id v19 = objc_loadWeakRetained(p_isa + 1);
      if (v19)
      {
        v20 = v19;
        id v21 = objc_loadWeakRetained(p_isa + 2);

        if (v21)
        {
          [(NSMutableSet *)self->_displaysThatFinishedSceneCreation addObject:v6];
          [(PUIDAppDelegate *)self _pointerUIServiceDidFinishSceneCreationWithSceneBag:p_isa];
        }
      }
    }
  }
}

- (void)handleEvent:(id)a3
{
}

- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v7 = a6;
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)UIApp;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001A4A4;
    v10[3] = &unk_100045210;
    id v11 = v7;
    [v9 _scheduleSceneEventResponseForScene:a3 withResponseBlock:v10];
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = [v4 psDisplay];
  v6 = PSLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 _sceneIdentifier];
    int v9 = 138543874;
    v10 = v5;
    __int16 v11 = 2048;
    id v12 = v4;
    __int16 v13 = 2114;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@> Scene did disconnect: <%p:%{public}@> ", (uint8_t *)&v9, 0x20u);
  }
  if ([(NSMutableSet *)self->_displaysThatFinishedSceneCreation containsObject:v5])
  {
    v8 = PSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up for scene disconnection on display: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(NSMutableSet *)self->_displaysThatFinishedSceneCreation removeObject:v5];
    [(NSMutableDictionary *)self->_sceneBagForDisplay removeObjectForKey:v5];
    [(PUIDPointerController *)self->_pointerController displayDetached:v5];
  }
}

- (void)_pointerUIServiceDidFinishSceneCreationWithSceneBag:(id)a3
{
  id v5 = (id *)a3;
  v6 = v5;
  if (!v5 || (id WeakRetained = objc_loadWeakRetained(v5 + 3)) == 0)
  {
    unsigned int v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PUIDAppDelegate.m" lineNumber:156 description:@"Can't finishing configuring without a display!"];

    id WeakRetained = 0;
  }
  v8 = PSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543362;
    id v19 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@> Configuring Pointer", (uint8_t *)&v18, 0xCu);
  }

  pointerController = self->_pointerController;
  if (pointerController)
  {
    if (v6)
    {
      id v10 = objc_loadWeakRetained(v6 + 2);
      id v11 = objc_loadWeakRetained(v6 + 1);
    }
    else
    {
      id v10 = 0;
      id v11 = 0;
    }
    [(PUIDPointerController *)pointerController displayAttached:WeakRetained pointerRenderingScene:v10 systemPointerScene:v11];
  }
  else
  {
    id v12 = [PUIDPointerController alloc];
    pointerEventStreamController = self->_pointerEventStreamController;
    if (v6)
    {
      id v10 = objc_loadWeakRetained(v6 + 2);
      id v11 = objc_loadWeakRetained(v6 + 1);
    }
    else
    {
      id v10 = 0;
      id v11 = 0;
    }
    v14 = [(PUIDPointerController *)v12 initWithPointerEventStreamProvider:pointerEventStreamController initialDisplay:WeakRetained pointerRenderingScene:v10 systemPointerScene:v11];
    uint64_t v15 = self->_pointerController;
    self->_pointerController = v14;
  }
  [(BSInvalidatable *)self->_servicesBootstrapExtension invalidate];
  servicesBootstrapExtension = self->_servicesBootstrapExtension;
  self->_servicesBootstrapExtension = 0;
}

- (void)_setEventFetchThreadPriorityWhenPossible
{
  uint64_t v3 = (__CFRunLoop *)[UIApp _eventFetchRunLoop];
  if (v3)
  {
    CFRunLoopPerformBlock(v3, kCFRunLoopCommonModes, &stru_100045230);
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 1000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A9A0;
    block[3] = &unk_100045190;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneBagForDisplay, 0);
  objc_storeStrong((id *)&self->_pointerEventStreamController, 0);
  objc_storeStrong((id *)&self->_pointerController, 0);
  objc_storeStrong((id *)&self->_servicesBootstrapExtension, 0);
  objc_storeStrong((id *)&self->_displaysThatFinishedSceneCreation, 0);
}

@end