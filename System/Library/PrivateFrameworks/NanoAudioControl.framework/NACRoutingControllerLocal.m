@interface NACRoutingControllerLocal
- (NACAudioRoute)pickedRoute;
- (NACRoutingControllerDelegate)delegate;
- (NACRoutingControllerLocal)initWithAudioCategory:(id)a3;
- (NSArray)availableAudioRoutes;
- (void)beginObservingRoutes;
- (void)endObservingRoutes;
- (void)pickAudioRoute:(id)a3;
- (void)routingController:(id)a3 didFailToPickRouteWithError:(id)a4;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NACRoutingControllerLocal

- (NACRoutingControllerLocal)initWithAudioCategory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NACRoutingControllerLocal;
  v6 = [(NACRoutingControllerLocal *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioCategory, a3);
  }

  return v7;
}

- (void)beginObservingRoutes
{
  v3 = (MPAVRoutingController *)objc_opt_new();
  routingController = self->_routingController;
  self->_routingController = v3;

  [(MPAVRoutingController *)self->_routingController setDiscoveryMode:1];
  [(MPAVRoutingController *)self->_routingController setCategory:self->_audioCategory];
  id v5 = self->_routingController;

  [(MPAVRoutingController *)v5 setDelegate:self];
}

- (void)endObservingRoutes
{
  self->_routingController = 0;
  MEMORY[0x270F9A758]();
}

- (void)pickAudioRoute:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(MPAVRoutingController *)self->_routingController availableRoutes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = +[NACAudioRoute audioRouteWithMPAVRoute:v10];
        if ([v4 isEqualToAudioRoute:v11])
        {
          routingController = self->_routingController;
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __44__NACRoutingControllerLocal_pickAudioRoute___block_invoke;
          v13[3] = &unk_264CFC2D0;
          v13[4] = v10;
          [(MPAVRoutingController *)routingController selectRoute:v10 operation:0 completion:v13];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __44__NACRoutingControllerLocal_pickAudioRoute___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = NMLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__NACRoutingControllerLocal_pickAudioRoute___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (NACAudioRoute)pickedRoute
{
  v2 = [(MPAVRoutingController *)self->_routingController pickedRoute];
  id v3 = +[NACAudioRoute audioRouteWithMPAVRoute:v2];

  return (NACAudioRoute *)v3;
}

- (NSArray)availableAudioRoutes
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(MPAVRoutingController *)self->_routingController availableRoutes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = +[NACAudioRoute audioRouteWithMPAVRoute:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained routingControllerDidUpdateAvailableRoutes:self];
}

- (void)routingController:(id)a3 didFailToPickRouteWithError:(id)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 routingControllerFailedToPickRoute:self];
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioCategory, 0);

  objc_storeStrong((id *)&self->_routingController, 0);
}

void __44__NACRoutingControllerLocal_pickAudioRoute___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_237CD4000, log, OS_LOG_TYPE_ERROR, "Failed to pick route: %@ due to %@", (uint8_t *)&v4, 0x16u);
}

@end