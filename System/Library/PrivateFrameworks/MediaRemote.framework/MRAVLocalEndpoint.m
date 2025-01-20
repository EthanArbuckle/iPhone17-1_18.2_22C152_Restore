@interface MRAVLocalEndpoint
+ (id)sharedLocalEndpoint;
+ (id)sharedLocalEndpointForRoutingContextWithUID:(id)a3;
- (BOOL)canModifyGroupMembership;
- (BOOL)groupContainsDiscoverableGroupLeader;
- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements;
- (MRAVRoutingDiscoverySession)audioDiscoverySession;
- (MRGroupSessionEligibilityMonitor)groupSessionEligibilityMonitor;
- (id)groupLeader;
- (id)groupSessionInfo;
- (id)initWithOutputContext:(void *)a1;
- (void)groupSessionMonitor:(id)a3 statusDidChangeFrom:(id)a4 to:(id)a5;
- (void)handleActiveGroupSessionDidChangeNotification:(id)a3;
- (void)registerNotifications;
- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation MRAVLocalEndpoint

- (id)groupLeader
{
  v3 = [(MRAVOutputContextEndpoint *)self outputDevices];
  v4 = objc_msgSend(v3, "msv_firstWhere:", &__block_literal_global_15);

  if (!v4)
  {
    v5 = [(MRAVLocalEndpoint *)self audioDiscoverySession];
    v6 = [v5 availableOutputDevices];
    v4 = objc_msgSend(v6, "msv_firstWhere:", &__block_literal_global_17);
  }

  return v4;
}

- (BOOL)canModifyGroupMembership
{
  v2 = [(MRAVOutputContextEndpoint *)self deviceInfo];
  if ([v2 supportsTwoHop])
  {
    BOOL v3 = 1;
  }
  else
  {
    if ([v2 isAirPlayActive]) {
      char v4 = [v2 parentGroupContainsDiscoverableGroupLeader];
    }
    else {
      char v4 = [v2 groupContainsDiscoverableGroupLeader];
    }
    BOOL v3 = v4;
  }

  return v3;
}

BOOL __32__MRAVLocalEndpoint_groupLeader__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 isLocalDevice] & 1) != 0 || objc_msgSend(v2, "deviceType") != 1;

  return v3;
}

- (BOOL)isEligibleForHostingGroupSessionExcludingAcknowledgements
{
  id v2 = [(MRAVLocalEndpoint *)self groupSessionEligibilityMonitor];
  BOOL v3 = [v2 status];
  char v4 = [v3 isEligibleForHostingGroupSessionExcludingAcknowledgements];

  return v4;
}

- (MRGroupSessionEligibilityMonitor)groupSessionEligibilityMonitor
{
  if (groupSessionEligibilityMonitor___token != -1) {
    dispatch_once(&groupSessionEligibilityMonitor___token, &__block_literal_global_23);
  }
  [(id)groupSessionEligibilityMonitor___groupSessionEligibilityMonitor addObserver:self];
  BOOL v3 = (void *)groupSessionEligibilityMonitor___groupSessionEligibilityMonitor;

  return (MRGroupSessionEligibilityMonitor *)v3;
}

+ (id)sharedLocalEndpoint
{
  id v2 = objc_opt_class();

  return (id)[v2 sharedLocalEndpointForRoutingContextWithUID:0];
}

void __65__MRAVLocalEndpoint_sharedLocalEndpointForRoutingContextWithUID___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [(id)sharedLocalEndpointForRoutingContextWithUID____contextUIDToLocalEndpointMap objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = +[MRAVOutputContext sharedAudioPresentationContext];
    v6 = [v5 uniqueIdentifier];
    int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

    if (v7) {
      +[MRAVConcreteOutputContext sharedAudioPresentationContext];
    }
    else {
    id v15 = +[MRAVConcreteOutputContext createOutputContextWithUniqueIdentifier:*(void *)(a1 + 32)];
    }
    id v8 = -[MRAVLocalEndpoint initWithOutputContext:]([MRAVLocalEndpoint alloc], v15);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    v11 = +[MRAVOutputContext sharedAudioPresentationContext];
    v12 = [v11 uniqueIdentifier];
    int v13 = [v12 isEqualToString:*(void *)(a1 + 32)];

    if (v13)
    {
      v14 = +[MROutputContextController sharedOutputContextController];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setOutputContextController:v14];
    }
    [(id)sharedLocalEndpointForRoutingContextWithUID____contextUIDToLocalEndpointMap setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
}

+ (id)sharedLocalEndpointForRoutingContextWithUID:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  char v4 = v3;
  if (sharedLocalEndpointForRoutingContextWithUID____once == -1)
  {
    if (v3) {
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&sharedLocalEndpointForRoutingContextWithUID____once, &__block_literal_global_14);
    if (v4) {
      goto LABEL_6;
    }
  }
  v5 = +[MRAVOutputContext sharedAudioPresentationContext];
  uint64_t v6 = [v5 uniqueIdentifier];

  if (v6) {
    char v4 = (__CFString *)v6;
  }
  else {
    char v4 = @"SYSTEM";
  }
LABEL_6:
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  int v7 = sharedLocalEndpointForRoutingContextWithUID____serialQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__MRAVLocalEndpoint_sharedLocalEndpointForRoutingContextWithUID___block_invoke_4;
  v11[3] = &unk_1E57D0590;
  v12 = v4;
  int v13 = &v14;
  id v8 = v4;
  dispatch_sync(v7, v11);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)initWithOutputContext:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    char v4 = +[MRAVOutputDevice localDeviceUID];
    v7.receiver = v2;
    v7.super_class = (Class)MRAVLocalEndpoint;
    id v2 = objc_msgSendSuper2(&v7, sel_initWithOutputContext_uniqueIdentifier_, v3, v4);

    if (v2)
    {
      v5 = +[MROrigin localOrigin];
      [v2 setOrigin:v5];

      -[MRAVLocalEndpoint registerNotifications]((uint64_t)v2);
    }
  }
  return v2;
}

- (void)registerNotifications
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:a1 selector:sel_handleActiveGroupSessionDidChangeNotification_ name:@"MRActiveGroupSessionInfoDidChangeNotification" object:0];
  }
}

- (BOOL)groupContainsDiscoverableGroupLeader
{
  id v2 = [(MRAVOutputContextEndpoint *)self deviceInfo];
  char v3 = [v2 groupContainsDiscoverableGroupLeader];

  return v3;
}

uint64_t __51__MRAVLocalEndpoint_groupSessionEligibilityMonitor__block_invoke()
{
  groupSessionEligibilityMonitor___groupSessionEligibilityMonitor = objc_alloc_init(MRGroupSessionEligibilityMonitor);

  return MEMORY[0x1F41817F8]();
}

- (void)handleActiveGroupSessionDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v9 = (id)[v5 mutableCopy];

  uint64_t v6 = [(MRAVLocalEndpoint *)self groupSessionInfo];
  [v9 setObject:v6 forKeyedSubscript:@"MRAVEndpointGroupSessionInfoUserInfoKey"];

  objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = [v4 userInfo];

  [v7 postNotificationName:@"MRAVEndpointGroupSessionInfoDidChangeNotification" object:self userInfo:v8];
}

- (id)groupSessionInfo
{
  id v2 = +[MRGroupSessionRequestManager sharedManager];
  char v3 = [v2 groupSessionInfo];

  if ([v3 isHosted]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

void __65__MRAVLocalEndpoint_sharedLocalEndpointForRoutingContextWithUID___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)sharedLocalEndpointForRoutingContextWithUID____contextUIDToLocalEndpointMap;
  sharedLocalEndpointForRoutingContextWithUID____contextUIDToLocalEndpointMap = (uint64_t)v0;

  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.MRAVEndpoint.sharedLocalEndpointSerialQueue", v4);
  char v3 = (void *)sharedLocalEndpointForRoutingContextWithUID____serialQueue;
  sharedLocalEndpointForRoutingContextWithUID____serialQueue = (uint64_t)v2;
}

BOOL __32__MRAVLocalEndpoint_groupLeader__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 isLocalDevice] & 1) != 0 || objc_msgSend(v2, "deviceType") != 1;

  return v3;
}

- (MRAVRoutingDiscoverySession)audioDiscoverySession
{
  if (audioDiscoverySession___token != -1) {
    dispatch_once(&audioDiscoverySession___token, &__block_literal_global_19_0);
  }
  id v2 = (void *)audioDiscoverySession___audioDiscoverySession;

  return (MRAVRoutingDiscoverySession *)v2;
}

uint64_t __42__MRAVLocalEndpoint_audioDiscoverySession__block_invoke()
{
  audioDiscoverySession___audioDiscoverySession = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:1];

  return MEMORY[0x1F41817F8]();
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __69__MRAVLocalEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke;
  id v15 = &unk_1E57D18A8;
  id v16 = v6;
  id v17 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = (void *)MEMORY[0x1997190F0](&v12);
  v11 = MRGetSharedService();
  objc_msgSend(v11, "requestGroupSessionWithCompletion:", v10, v12, v13, v14, v15);
}

void __69__MRAVLocalEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MRAVLocalEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __69__MRAVLocalEndpoint_requestGroupSessionWithDetails_queue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)groupSessionMonitor:(id)a3 statusDidChangeFrom:(id)a4 to:(id)a5
{
  id v7 = a5;
  LODWORD(a4) = [a4 isEligibleForHostingGroupSessionExcludingAcknowledgements];
  int v8 = [v7 isEligibleForHostingGroupSessionExcludingAcknowledgements];

  if (a4 != v8)
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"MRAVEndpointGroupSessionHostingEligibilityDidChangeNotification" object:self userInfo:0];
  }
}

@end