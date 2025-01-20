@interface NACRoutingControllerProxy
- (NACAudioRoute)pickedRoute;
- (NACRoutingControllerDelegate)delegate;
- (NACRoutingControllerProxy)initWithAudioCategory:(id)a3;
- (NSArray)availableAudioRoutes;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_audioRoutesDidChange;
- (void)beginObservingRoutes;
- (void)dealloc;
- (void)endObservingRoutes;
- (void)pickAudioRoute:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NACRoutingControllerProxy

- (NACRoutingControllerProxy)initWithAudioCategory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NACRoutingControllerProxy;
  v6 = [(NACRoutingControllerProxy *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_category, a3);
    uint64_t v8 = +[NACXPCClient sharedClient];
    xpcClient = v7->_xpcClient;
    v7->_xpcClient = (NACXPCClient *)v8;
  }
  return v7;
}

- (void)dealloc
{
  [(NACRoutingControllerProxy *)self endObservingRoutes];
  v3.receiver = self;
  v3.super_class = (Class)NACRoutingControllerProxy;
  [(NACRoutingControllerProxy *)&v3 dealloc];
}

- (void)beginObservingRoutes
{
  if (!self->_isObserving)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_NACAudioRoutesDidChangeNotification, @"NACAudioRoutesDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    [(NACXPCClient *)self->_xpcClient beginObservingAudioRoutesForCategory:self->_category];
    self->_isObserving = 1;
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__applicationDidBecomeActiveNotification_ name:*MEMORY[0x263F1D038] object:0];
    [v4 addObserver:self selector:sel__applicationWillResignActiveNotification_ name:*MEMORY[0x263F1D0D8] object:0];
    [(NACRoutingControllerProxy *)self _audioRoutesDidChange];
  }
}

- (void)endObservingRoutes
{
  if (self->_isObserving)
  {
    [(NACXPCClient *)self->_xpcClient endObservingAudioRoutesForCategory:self->_category];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self];

    self->_isObserving = 0;
  }
}

- (void)pickAudioRoute:(id)a3
{
  xpcClient = self->_xpcClient;
  id v5 = [a3 uniqueIdentifier];
  [(NACXPCClient *)xpcClient pickAudioRouteWithIdentifier:v5 category:self->_category];
}

- (void)_audioRoutesDidChange
{
  objc_initWeak(&location, self);
  xpcClient = self->_xpcClient;
  category = self->_category;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__NACRoutingControllerProxy__audioRoutesDidChange__block_invoke;
  v5[3] = &unk_264CFC980;
  objc_copyWeak(&v6, &location);
  [(NACXPCClient *)xpcClient audioRoutesForCategory:category result:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__NACRoutingControllerProxy__audioRoutesDidChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = +[NACAudioRoute audioRoutesFromBuffers:v3];
    id v6 = WeakRetained[5];
    WeakRetained[5] = (id)v5;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = WeakRetained[5];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v12 isPicked]) {
            objc_storeStrong(WeakRetained + 6, v12);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__NACRoutingControllerProxy__audioRoutesDidChange__block_invoke_2;
    block[3] = &unk_264CFC388;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __50__NACRoutingControllerProxy__audioRoutesDidChange__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v4 routingControllerDidUpdateAvailableRoutes:*(void *)(a1 + 32)];
  }
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  if (self->_isObserving) {
    [(NACXPCClient *)self->_xpcClient beginObservingAudioRoutesForCategory:self->_category];
  }
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  if (self->_isObserving) {
    [(NACXPCClient *)self->_xpcClient endObservingAudioRoutesForCategory:self->_category];
  }
}

- (NACRoutingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NACRoutingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)availableAudioRoutes
{
  return self->_availableAudioRoutes;
}

- (NACAudioRoute)pickedRoute
{
  return self->_pickedRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickedRoute, 0);
  objc_storeStrong((id *)&self->_availableAudioRoutes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_xpcClient, 0);
}

@end