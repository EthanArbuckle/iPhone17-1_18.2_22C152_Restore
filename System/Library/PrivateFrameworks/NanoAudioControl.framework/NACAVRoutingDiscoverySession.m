@interface NACAVRoutingDiscoverySession
@end

@implementation NACAVRoutingDiscoverySession

void __37___NACAVRoutingDiscoverySession_init__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[4];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37___NACAVRoutingDiscoverySession_init__block_invoke_2;
    block[3] = &unk_264CFC388;
    v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

void __37___NACAVRoutingDiscoverySession_init__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    *(unsigned char *)(v1 + 40) = 1;
    v3 = NMLogForCategory(4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_237CD4000, v3, OS_LOG_TYPE_DEFAULT, "[NACEndpointObserver] Got initial updates for MRAVEndpoints in session %@!", (uint8_t *)&v6, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
    MRAVRoutingDiscoverySessionRemoveEndpointsChangedCallback();
    v5 = *(const void **)(*(void *)(a1 + 32) + 16);
    if (v5) {
      CFRelease(v5);
    }
  }
}

void __74___NACAVRoutingDiscoverySession_fetchRouteForOriginIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = (id)MRAVRoutingDiscoverySessionCopyAvailableEndpoints();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * v6);
        if (MRAVEndpointGetExternalDevice())
        {
          uint64_t v8 = MRExternalDeviceCopyCustomOrigin();
          if (v8)
          {
            v9 = (const void *)v8;
            int UniqueIdentifier = MROriginGetUniqueIdentifier();
            if (UniqueIdentifier == [*(id *)(a1 + 40) intValue])
            {
              v11 = (void *)[objc_alloc(MEMORY[0x263F11CF8]) initWithEndpoint:v7];
              CFRelease(v9);
              if (v11) {
                goto LABEL_15;
              }
            }
            else
            {
              CFRelease(v9);
            }
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
  v11 = 0;
LABEL_15:

  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);
  }
  v13 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___NACAVRoutingDiscoverySession_fetchRouteForOriginIdentifier_completion___block_invoke_2;
  block[3] = &unk_264CFC388;
  id v15 = *(id *)(a1 + 48);
  dispatch_async(v13, block);
}

@end