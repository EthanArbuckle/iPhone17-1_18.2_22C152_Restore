@interface ICCloudClientAvailabilityService
- (BOOL)canShowCloudDownloadButtons;
- (BOOL)canShowCloudMusic;
- (BOOL)canShowCloudVideo;
- (BOOL)hasProperNetworkConditionsToPlayMedia;
- (BOOL)hasProperNetworkConditionsToShowCloudMedia;
- (BOOL)isCellularDataRestrictedForMusic;
- (BOOL)isCellularDataRestrictedForStoreApps;
- (BOOL)isCellularDataRestrictedForVideos;
- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions;
- (ICCloudClientAvailabilityService)initWithListenerEndpointProvider:(id)a3;
- (ICCloudServerListenerEndpointProviding)listenerEndpointProvider;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)serialQueue;
- (id)_xpcConnectionWithListenerEndpoint:(id)a3;
@end

@implementation ICCloudClientAvailabilityService

- (ICCloudClientAvailabilityService)initWithListenerEndpointProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICCloudClientAvailabilityService;
  v5 = [(ICCloudClientAvailabilityService *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_listenerEndpointProvider, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunescloudd.ICCloudClientAvailabilityService.serial.queue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listenerEndpointProvider);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (ICCloudServerListenerEndpointProviding)listenerEndpointProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listenerEndpointProvider);

  return (ICCloudServerListenerEndpointProviding *)WeakRetained;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (id)_xpcConnectionWithListenerEndpoint:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67B900];
    [v5 setRemoteObjectInterface:v6];
    [v5 setExportedObject:self];
    objc_initWeak(location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__ICCloudClientAvailabilityService__xpcConnectionWithListenerEndpoint___block_invoke;
    v13[3] = &unk_1E5ACD778;
    objc_copyWeak(&v14, location);
    [v5 setInterruptionHandler:v13];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    objc_super v10 = __71__ICCloudClientAvailabilityService__xpcConnectionWithListenerEndpoint___block_invoke_80;
    v11 = &unk_1E5ACD778;
    objc_copyWeak(&v12, location);
    [v5 setInvalidationHandler:&v8];
    objc_msgSend(v5, "resume", v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = self;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "ICCloudClientAvailabilityService %p - Unable to create XPC Connection [no listener endpoint]", (uint8_t *)location, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

void __71__ICCloudClientAvailabilityService__xpcConnectionWithListenerEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudClientAvailabilityService %p - Connection to cloud availability service interrupted", buf, 0xCu);
  }

  v3 = [WeakRetained serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ICCloudClientAvailabilityService__xpcConnectionWithListenerEndpoint___block_invoke_79;
  block[3] = &unk_1E5ACD750;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_sync(v3, block);
}

void __71__ICCloudClientAvailabilityService__xpcConnectionWithListenerEndpoint___block_invoke_80(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudClientAvailabilityService %p - Connection to cloud availability service invalidated", buf, 0xCu);
  }

  v3 = [WeakRetained serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ICCloudClientAvailabilityService__xpcConnectionWithListenerEndpoint___block_invoke_81;
  block[3] = &unk_1E5ACD750;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_sync(v3, block);
}

void __71__ICCloudClientAvailabilityService__xpcConnectionWithListenerEndpoint___block_invoke_81(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudClientAvailabilityService %p - Resetting XPC connection to nil", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

void __71__ICCloudClientAvailabilityService__xpcConnectionWithListenerEndpoint___block_invoke_79(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "ICCloudClientAvailabilityService %p - Resetting XPC connection to nil", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

- (NSXPCConnection)xpcConnection
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__26230;
  v11 = __Block_byref_object_dispose__26231;
  id v12 = 0;
  uint64_t v3 = [(ICCloudClientAvailabilityService *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__ICCloudClientAvailabilityService_xpcConnection__block_invoke;
  v6[3] = &unk_1E5ACD880;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

void __49__ICCloudClientAvailabilityService_xpcConnection__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "ICCloudClientAvailabilityService %p - Creating XPC Client Connection [started]", buf, 0xCu);
    }

    v5 = [*(id *)(a1 + 32) listenerEndpointProvider];
    id v19 = 0;
    int v6 = [v5 listenerEndpointForService:2 error:&v19];
    id v7 = v19;

    if (!v6 || v7)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218498;
        uint64_t v21 = v18;
        __int16 v22 = 2114;
        v23 = v6;
        __int16 v24 = 2114;
        id v25 = v7;
        id v14 = "ICCloudClientAvailabilityService %p - Creating XPC Client Connection [failed] - endpoint=%{public}@ - error=%{public}@";
        v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        uint32_t v17 = 32;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v8 = [*(id *)(a1 + 32) _xpcConnectionWithListenerEndpoint:v6];
      uint64_t v9 = *(void *)(a1 + 32);
      objc_super v10 = *(void **)(v9 + 8);
      *(void *)(v9 + 8) = v8;

      v11 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        v13 = *(void **)(v12 + 8);
        *(_DWORD *)buf = 134218242;
        uint64_t v21 = v12;
        __int16 v22 = 2114;
        v23 = v13;
        id v14 = "ICCloudClientAvailabilityService %p - Creating XPC Client Connection [done] - connection=%{public}@";
        v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 22;
LABEL_10:
        _os_log_impl(&dword_1A2D01000, v15, v16, v14, buf, v17);
      }
    }

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

- (BOOL)canShowCloudVideo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_22_26235];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ICCloudClientAvailabilityService_canShowCloudVideo__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 canShowCloudVideoWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __53__ICCloudClientAvailabilityService_canShowCloudVideo__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)canShowCloudMusic
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_20];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__ICCloudClientAvailabilityService_canShowCloudMusic__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 canShowCloudMusicWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __53__ICCloudClientAvailabilityService_canShowCloudMusic__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)canShowCloudDownloadButtons
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_18_26238];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__ICCloudClientAvailabilityService_canShowCloudDownloadButtons__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 canShowCloudDownloadButtonsWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __63__ICCloudClientAvailabilityService_canShowCloudDownloadButtons__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_16];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__ICCloudClientAvailabilityService_shouldProhibitStoreAppsActionForCurrentNetworkConditions__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 shouldProhibitStoreAppsActionForCurrentNetworkConditionsWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __92__ICCloudClientAvailabilityService_shouldProhibitStoreAppsActionForCurrentNetworkConditions__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_14];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__ICCloudClientAvailabilityService_isCellularDataRestrictedForStoreApps__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 isCellularDataRestrictedForStoreAppsWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __72__ICCloudClientAvailabilityService_isCellularDataRestrictedForStoreApps__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_12_26240];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__ICCloudClientAvailabilityService_shouldProhibitVideosActionForCurrentNetworkConditions__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 shouldProhibitVideosActionForCurrentNetworkConditionsWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __89__ICCloudClientAvailabilityService_shouldProhibitVideosActionForCurrentNetworkConditions__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isCellularDataRestrictedForVideos
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10_26242];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__ICCloudClientAvailabilityService_isCellularDataRestrictedForVideos__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 isCellularDataRestrictedForVideosWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __69__ICCloudClientAvailabilityService_isCellularDataRestrictedForVideos__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_8_26244];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__ICCloudClientAvailabilityService_shouldProhibitMusicActionForCurrentNetworkConditions__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 shouldProhibitMusicActionForCurrentNetworkConditionsWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __88__ICCloudClientAvailabilityService_shouldProhibitMusicActionForCurrentNetworkConditions__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isCellularDataRestrictedForMusic
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6_26246];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__ICCloudClientAvailabilityService_isCellularDataRestrictedForMusic__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 isCellularDataRestrictedForMusicWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __68__ICCloudClientAvailabilityService_isCellularDataRestrictedForMusic__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__ICCloudClientAvailabilityService_hasProperNetworkConditionsToShowCloudMedia__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 hasProperNetworkConditionsToShowCloudMediaWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __78__ICCloudClientAvailabilityService_hasProperNetworkConditionsToShowCloudMedia__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(ICCloudClientAvailabilityService *)self xpcConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_26248];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__ICCloudClientAvailabilityService_hasProperNetworkConditionsToPlayMedia__block_invoke_2;
  v5[3] = &unk_1E5ACA580;
  v5[4] = &v6;
  [v3 hasProperNetworkConditionsToPlayMediaWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __73__ICCloudClientAvailabilityService_hasProperNetworkConditionsToPlayMedia__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end