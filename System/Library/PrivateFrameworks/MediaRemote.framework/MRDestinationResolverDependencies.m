@interface MRDestinationResolverDependencies
+ (id)defaultDependencies;
- (id)addPlayerPathInvalidationHandler:(id)a3 queue:(id)a4 handler:(id)a5;
- (id)createEndpointObserverWithUID:(id)a3;
- (void)createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)removePlayerPathInvalidationHandler:(id)a3;
- (void)resolvePlayerPath:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)retrieveEndpointForContextUID:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)retrieveEndpointForUID:(id)a3 endpointGroupUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)retrieveOutputDeviceUIDForOrigin:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation MRDestinationResolverDependencies

+ (id)defaultDependencies
{
  if (defaultDependencies_onceToken != -1) {
    dispatch_once(&defaultDependencies_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)defaultDependencies__defaultDependencies;

  return v2;
}

uint64_t __56__MRDestinationResolverDependencies_defaultDependencies__block_invoke()
{
  defaultDependencies__defaultDependencies = objc_alloc_init(MRDestinationResolverDependencies);

  return MEMORY[0x1F41817F8]();
}

- (void)createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 queue:(id)a6 completion:(id)a7
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v28 = @"MREndpointConnectionReasonUserInfoKey";
  v29[0] = @"MRNowPlayingController";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__MRDestinationResolverDependencies_createPlayerPathForEndpoint_client_player_queue_completion___block_invoke;
  v22[3] = &unk_1E57D1120;
  id v26 = v13;
  id v27 = v15;
  id v23 = v14;
  id v24 = v11;
  id v25 = v12;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v15;
  id v21 = v14;
  [v19 connectToExternalDeviceWithUserInfo:v16 completion:v22];
}

void __96__MRDestinationResolverDependencies_createPlayerPathForEndpoint_client_player_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__MRDestinationResolverDependencies_createPlayerPathForEndpoint_client_player_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D2408;
  id v7 = v3;
  id v11 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __96__MRDestinationResolverDependencies_createPlayerPathForEndpoint_client_player_queue_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v2();
  }
  else
  {
    id v3 = [MRPlayerPath alloc];
    v4 = [*(id *)(a1 + 40) origin];
    id v5 = [(MRPlayerPath *)v3 initWithOrigin:v4 client:*(void *)(a1 + 48) player:*(void *)(a1 + 56)];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)resolvePlayerPath:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__MRDestinationResolverDependencies_resolvePlayerPath_queue_completion___block_invoke;
  v9[3] = &unk_1E57D2318;
  id v10 = v7;
  id v8 = v7;
  MRMediaRemoteNowPlayingResolvePlayerPath(a3, a4, v9);
}

uint64_t __72__MRDestinationResolverDependencies_resolvePlayerPath_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveEndpointForContextUID:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__MRDestinationResolverDependencies_retrieveEndpointForContextUID_queue_completion___block_invoke;
  v17[3] = &unk_1E57D17C0;
  id v18 = v7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__MRDestinationResolverDependencies_retrieveEndpointForContextUID_queue_completion___block_invoke_2;
  v14[3] = &unk_1E57D23E0;
  id v15 = v10;
  id v16 = v8;
  id v11 = v8;
  id v12 = v10;
  id v13 = v7;
  [(MRAVLightweightReconnaissanceSession *)v12 searchEndpointsWithPredicate:v17 timeout:@"MRNowPlayingController-partialGroupUID" reason:v9 queue:v14 completion:3.0];
}

uint64_t __84__MRDestinationResolverDependencies_retrieveEndpointForContextUID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 outputDevices];
  v4 = [v3 firstObject];
  id v5 = [v4 groupContextID];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

void __84__MRDestinationResolverDependencies_retrieveEndpointForContextUID_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);
}

- (void)retrieveEndpointForUID:(id)a3 endpointGroupUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = [v9 isEqualToString:@"proactiveEndpoint"];
  int v14 = [v9 isEqualToString:@"userSelectedEndpoint"];
  if ((v13 & 1) != 0 || v14)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke;
    v25[3] = &unk_1E57D23B8;
    id v26 = (MRAVLightweightReconnaissanceSession *)v12;
    MRAVEndpointResolveActiveSystemEndpointWithType(v13, v11, v25, 3.0);
    id v16 = v26;
  }
  else
  {
    id v15 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    id v16 = v15;
    if (v10)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke_2;
      v22[3] = &unk_1E57D23E0;
      id v17 = (id *)&v23;
      id v23 = v15;
      id v18 = &v24;
      id v24 = v12;
      [(MRAVLightweightReconnaissanceSession *)v16 searchEndpointsForGroupUID:v10 timeout:@"MRNowPlayingController-recon" reason:v11 queue:v22 completion:3.0];
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke_3;
      v19[3] = &unk_1E57D23E0;
      id v17 = (id *)&v20;
      id v20 = v15;
      id v18 = &v21;
      id v21 = v12;
      [(MRAVLightweightReconnaissanceSession *)v16 searchEndpointsForOutputDeviceUID:v9 timeout:@"MRNowPlayingController-recon" reason:v11 queue:v19 completion:3.0];
    }
  }
}

uint64_t __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);
}

void __94__MRDestinationResolverDependencies_retrieveEndpointForUID_endpointGroupUID_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v7 = *(id *)(a1 + 32);
  v6(v5, a2, a3);
}

- (void)retrieveOutputDeviceUIDForOrigin:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__MRDestinationResolverDependencies_retrieveOutputDeviceUIDForOrigin_queue_completion___block_invoke;
  v9[3] = &unk_1E57D2318;
  id v10 = v7;
  id v8 = v7;
  MRMediaRemoteGetDeviceInfo((uint64_t)a3, (uint64_t)a4, v9);
}

void __87__MRDestinationResolverDependencies_retrieveOutputDeviceUIDForOrigin_queue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 deviceUID];
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (id)addPlayerPathInvalidationHandler:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__MRDestinationResolverDependencies_addPlayerPathInvalidationHandler_queue_handler___block_invoke;
  v11[3] = &unk_1E57D3458;
  id v12 = v7;
  id v8 = v7;
  id v9 = (void *)MRMediaRemoteAddPlayerPathInvalidationHandler((uint64_t)a3, a4, v11);

  return v9;
}

uint64_t __84__MRDestinationResolverDependencies_addPlayerPathInvalidationHandler_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePlayerPathInvalidationHandler:(id)a3
{
}

- (id)createEndpointObserverWithUID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[MRAVEndpointObserver alloc] initWithOutputDeviceUID:v3];

  return v4;
}

@end