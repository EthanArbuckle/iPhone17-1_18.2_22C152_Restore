@interface MusicKit_SoftLinking_MPAVRoutingController
- (MusicKit_SoftLinking_MPAVRoutingController)init;
- (id)routesDidUpdate;
- (void)_handleRoutesDidChange:(id)a3;
- (void)beginRouteDiscovery;
- (void)endRouteDiscovery;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
- (void)setRoutesDidUpdate:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPAVRoutingController

- (MusicKit_SoftLinking_MPAVRoutingController)init
{
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPAVRoutingController;
  v2 = [(MusicKit_SoftLinking_MPAVRoutingController *)&v11 init];
  if (v2)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v3 = (void *)getMPAVEndpointRoutingDataSourceClass_softClass;
    uint64_t v20 = getMPAVEndpointRoutingDataSourceClass_softClass;
    if (!getMPAVEndpointRoutingDataSourceClass_softClass)
    {
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __getMPAVEndpointRoutingDataSourceClass_block_invoke;
      v15 = &unk_1E6D453B0;
      v16 = &v17;
      __getMPAVEndpointRoutingDataSourceClass_block_invoke((uint64_t)&v12);
      v3 = (void *)v18[3];
    }
    v4 = v3;
    _Block_object_dispose(&v17, 8);
    id v5 = objc_alloc_init(v4);
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v6 = (void *)getMPAVRoutingControllerClass_softClass_0;
    uint64_t v20 = getMPAVRoutingControllerClass_softClass_0;
    if (!getMPAVRoutingControllerClass_softClass_0)
    {
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __getMPAVRoutingControllerClass_block_invoke_0;
      v15 = &unk_1E6D453B0;
      v16 = &v17;
      __getMPAVRoutingControllerClass_block_invoke_0((uint64_t)&v12);
      v6 = (void *)v18[3];
    }
    v7 = v6;
    _Block_object_dispose(&v17, 8);
    uint64_t v8 = [[v7 alloc] initWithDataSource:v5 name:@"MusicKitInternal.InternalMusicPlayer"];
    underlyingRoutingController = v2->_underlyingRoutingController;
    v2->_underlyingRoutingController = (MPAVRoutingController *)v8;

    [(MPAVRoutingController *)v2->_underlyingRoutingController setDelegate:v2];
  }
  return v2;
}

- (void)beginRouteDiscovery
{
}

- (void)endRouteDiscovery
{
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__MusicKit_SoftLinking_MPAVRoutingController_routingControllerAvailableRoutesDidChange___block_invoke;
  v5[3] = &unk_1E6D457E0;
  objc_copyWeak(&v6, &location);
  [v4 fetchAvailableRoutesWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_handleRoutesDidChange:(id)a3
{
  a3;
  routesDidUpdate = (void (**)(void))self->_routesDidUpdate;
  if (routesDidUpdate) {
    routesDidUpdate[2]();
  }
  MEMORY[0x1F41817F8]();
}

- (id)routesDidUpdate
{
  return self->_routesDidUpdate;
}

- (void)setRoutesDidUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_routesDidUpdate, 0);
  objc_storeStrong((id *)&self->_underlyingRoutingController, 0);
}

@end