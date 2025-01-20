@interface POUtilities
+ (BOOL)assistantErrorIsInformational:(id)a3;
+ (BOOL)errorIsApplicationRequiresPreflight:(id)a3;
+ (BOOL)errorIsMaxStreamCount:(id)a3;
+ (BOOL)errorIsNoNetwork:(id)a3;
+ (BOOL)isPodcastsNowPlaying;
+ (_MRSystemAppPlaybackQueue)createPlaybackQueueFromRequestIdentifiers:(id)a3 startPlaying:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7;
+ (id)commandStatusForRemoteStatus:(unsigned int)a3 error:(id)a4 isRemoteStorePlayback:(BOOL)a5;
+ (id)identifierFromDomainObject:(id)a3;
+ (id)typeFromDomainObject:(id)a3;
+ (void)_resolveWithDestination:(id)a3 hashedRouteIdentifiers:(id)a4 decodedRouteIdentifiers:(id)a5 originatingOutputDeviceUID:(id)a6 localPlaybackPermitted:(BOOL)a7 audioRoutingInfo:(id)a8 completion:(id)a9;
+ (void)modifyContextForAirplay:(id)a3 andPlayLocally:(id)a4 completion:(id)a5;
+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 decodedRouteUIDs:(id)a5 originatingOutputDeviceUID:(id)a6 startPlaying:(BOOL)a7 requesterSharedUserId:(id)a8 sharedUserIdFromPlayableITunesAccount:(id)a9 context:(id)a10 allowsFallback:(BOOL)a11 completion:(id)a12;
+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 decodedRouteUIDs:(id)a6 originatingOutputDeviceUID:(id)a7 startPlaying:(BOOL)a8 requesterSharedUserId:(id)a9 sharedUserIdFromPlayableITunesAccount:(id)a10 context:(id)a11 allowsFallback:(BOOL)a12 completion:(id)a13;
+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 allowsFallback:(BOOL)a10 completion:(id)a11;
+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 completion:(id)a10;
+ (void)setPlaybackRate:(float)a3 failureErrorCode:(int64_t)a4 completion:(id)a5;
@end

@implementation POUtilities

+ (id)identifierFromDomainObject:(id)a3
{
  v3 = [a3 identifier];
  v4 = [v3 lastPathComponent];

  return v4;
}

+ (id)typeFromDomainObject:(id)a3
{
  v3 = [a3 identifier];
  v4 = [v3 host];

  return v4;
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 completion:(id)a10
{
  LOBYTE(v10) = 1;
  [a1 performPodcastsPlaybackRequestWithIdentifier:a3 assetInfo:a4 hashedRouteUIDs:a5 startPlaying:a6 requesterSharedUserId:a7 sharedUserIdFromPlayableITunesAccount:a8 context:a9 allowsFallback:v10 completion:a10];
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 startPlaying:(BOOL)a6 requesterSharedUserId:(id)a7 sharedUserIdFromPlayableITunesAccount:(id)a8 context:(id)a9 allowsFallback:(BOOL)a10 completion:(id)a11
{
  LOBYTE(v11) = a10;
  [a1 performPodcastsPlaybackRequestWithIdentifier:a3 assetInfo:a4 hashedRouteUIDs:a5 decodedRouteUIDs:0 originatingOutputDeviceUID:0 startPlaying:a6 requesterSharedUserId:a7 sharedUserIdFromPlayableITunesAccount:a8 context:a9 allowsFallback:v11 completion:a11];
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 decodedRouteUIDs:(id)a5 originatingOutputDeviceUID:(id)a6 startPlaying:(BOOL)a7 requesterSharedUserId:(id)a8 sharedUserIdFromPlayableITunesAccount:(id)a9 context:(id)a10 allowsFallback:(BOOL)a11 completion:(id)a12
{
  LOBYTE(v12) = a11;
  [a1 performPodcastsPlaybackRequestWithIdentifier:a3 assetInfo:a4 hashedRouteUIDs:0 decodedRouteUIDs:a5 originatingOutputDeviceUID:a6 startPlaying:a7 requesterSharedUserId:a8 sharedUserIdFromPlayableITunesAccount:a9 context:a10 allowsFallback:v12 completion:a12];
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(id)a3 assetInfo:(id)a4 hashedRouteUIDs:(id)a5 decodedRouteUIDs:(id)a6 originatingOutputDeviceUID:(id)a7 startPlaying:(BOOL)a8 requesterSharedUserId:(id)a9 sharedUserIdFromPlayableITunesAccount:(id)a10 context:(id)a11 allowsFallback:(BOOL)a12 completion:(id)a13
{
  BOOL v53 = a8;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v55 = a4;
  id v18 = a5;
  id v19 = a6;
  id v54 = a7;
  id v20 = a9;
  id v56 = a10;
  id v21 = a11;
  v22 = (void (**)(id, uint64_t, void *))a13;
  if (![v17 length])
  {
    v37 = v20;
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      v40 = POLogContextCommand;
    }
    else {
      v40 = &_os_log_internal;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      +[POUtilities performPodcastsPlaybackRequestWithIdentifier:assetInfo:hashedRouteUIDs:decodedRouteUIDs:originatingOutputDeviceUID:startPlaying:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:context:allowsFallback:completion:](v40, v41, v42, v43, v44, v45, v46, v47);
    }
    v48 = [MEMORY[0x263F087E8] errorWithDomain:@"POUtilitiesErrorDomain" code:102 userInfo:0];
    v22[2](v22, 2, v48);

    v23 = v19;
    v34 = v54;
    goto LABEL_15;
  }
  v23 = v19;
  if (![v18 count] && (!objc_msgSend(v19, "count") || !objc_msgSend(v54, "length")))
  {
    v49 = +[PODataSource sharedInstance];
    char v50 = [v49 isPodcastsInstalled];

    if ((v50 & 1) == 0)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"POUtilitiesErrorDomain" code:103 userInfo:0];
      v51 = v37 = v20;
      v22[2](v22, 2, v51);

      v34 = v54;
LABEL_15:
      v35 = v56;
      goto LABEL_16;
    }
  }
  v24 = v20;
  POLogInitIfNeeded();
  if (POLogContextCommand) {
    v25 = POLogContextCommand;
  }
  else {
    v25 = &_os_log_internal;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    [v18 componentsJoinedByString:@", "];
    v28 = id v27 = v18;
    v29 = [v19 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138413058;
    id v74 = v17;
    __int16 v75 = 2112;
    v76 = v28;
    __int16 v77 = 2112;
    v78 = v29;
    __int16 v79 = 2112;
    id v80 = v54;
    v23 = v19;
    _os_log_impl(&dword_23F08F000, v26, OS_LOG_TYPE_DEFAULT, "Will be setting playbackQueue using MediaRemote to %@ with routeUIDs %@ decodedRouteUIDs %@ originatingOutputDeviceUID %@", buf, 0x2Au);

    id v18 = v27;
  }
  id v72 = v17;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
  uint64_t v31 = [a1 createPlaybackQueueFromRequestIdentifiers:v30 startPlaying:v53 assetInfo:v55 requesterSharedUserId:v24 sharedUserIdFromPlayableITunesAccount:v56];

  v32 = [[MTMPCAssistantGenericPlaybackQueue alloc] initWithContextID:v21 playbackQueueRef:v31];
  v33 = [MEMORY[0x263F547A8] podcastsApplicationDestination];
  [v33 setSingleGroup:1];
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke;
  v57[3] = &unk_265055910;
  id v69 = a1;
  id v58 = v33;
  id v59 = v18;
  id v60 = v23;
  v34 = v54;
  id v61 = v54;
  v68 = v22;
  v62 = v32;
  BOOL v70 = a12;
  id v63 = v17;
  BOOL v71 = v53;
  id v64 = v55;
  id v65 = v24;
  v35 = v56;
  id v66 = v56;
  id v67 = v21;
  v36 = v32;
  v37 = v24;
  v38 = v36;
  id v39 = v33;
  MPAssistantWatchGetCurrentAudioRoutingInfo((uint64_t)v57);

LABEL_16:
}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_2;
  v11[3] = &unk_2650558E8;
  v8 = *(void **)(a1 + 120);
  id v18 = *(id *)(a1 + 112);
  id v9 = *(id *)(a1 + 64);
  char v20 = *(unsigned char *)(a1 + 128);
  uint64_t v10 = *(void *)(a1 + 120);
  id v12 = v9;
  uint64_t v19 = v10;
  id v13 = *(id *)(a1 + 72);
  char v21 = *(unsigned char *)(a1 + 129);
  id v14 = *(id *)(a1 + 80);
  id v15 = *(id *)(a1 + 88);
  id v16 = *(id *)(a1 + 96);
  id v17 = *(id *)(a1 + 104);
  [v8 _resolveWithDestination:v4 hashedRouteIdentifiers:v5 decodedRouteIdentifiers:v6 originatingOutputDeviceUID:v7 localPlaybackPermitted:1 audioRoutingInfo:a2 completion:v11];
}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v21 = *MEMORY[0x263F54C70];
  v22[0] = &unk_26F2D2920;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v5 = objc_alloc_init(MEMORY[0x263F54780]);
  uint64_t v6 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_23;
  v10[3] = &unk_2650558C0;
  id v7 = *(id *)(a1 + 80);
  char v19 = *(unsigned char *)(a1 + 96);
  id v11 = v3;
  uint64_t v8 = *(void *)(a1 + 88);
  id v17 = v7;
  uint64_t v18 = v8;
  id v12 = *(id *)(a1 + 40);
  char v20 = *(unsigned char *)(a1 + 97);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 72);
  id v9 = v3;
  [v5 sendPlaybackQueueWithResult:v6 toDestination:v9 withOptions:v4 completion:v10];
}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  id v5 = &_os_log_internal;
  if (v3)
  {
    uint64_t v6 = [v3 returnStatuses];
    id v7 = [v6 firstObject];
    int v8 = [v7 unsignedIntValue];

    id v9 = [v4 error];
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      uint64_t v10 = POLogContextCommand;
    }
    else {
      uint64_t v10 = v5;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      id v12 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412290;
      *(void *)id v54 = v12;
      _os_log_impl(&dword_23F08F000, v11, OS_LOG_TYPE_DEFAULT, "sendPlaybackQueueWithResult Error: %@", buf, 0xCu);
    }
    POLogInitIfNeeded();
    if (POLogContextCommand) {
      id v13 = POLogContextCommand;
    }
    else {
      id v13 = v5;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)id v54 = v8;
      _os_log_impl(&dword_23F08F000, v13, OS_LOG_TYPE_DEFAULT, "sendPlaybackQueueWithResult Status: %d", buf, 8u);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    objc_msgSend(v9, "underlyingErrors", 0);
    id v14 = (MTMPCAssistantGenericPlaybackQueue *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [(MTMPCAssistantGenericPlaybackQueue *)v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v14);
          }
          if (+[POUtilities errorIsNoNetwork:*(void *)(*((void *)&v49 + 1) + 8 * i)])
          {
            POLogInitIfNeeded();
            if (POLogContextCommand) {
              v26 = POLogContextCommand;
            }
            else {
              v26 = &_os_log_internal;
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_23_cold_3(v26, v27, v28, v29, v30, v31, v32, v33);
            }
            v34 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
            goto LABEL_63;
          }
        }
        uint64_t v16 = [(MTMPCAssistantGenericPlaybackQueue *)v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    int v19 = v8;
    char v20 = &_os_log_internal;
    if (*(unsigned char *)(a1 + 96))
    {
      uint64_t v21 = [*(id *)(a1 + 32) outputDeviceUIDs];
      if ([v21 count])
      {

        if ((v19 - 1) <= 1)
        {
          POLogInitIfNeeded();
          if (POLogContextCommand) {
            v22 = POLogContextCommand;
          }
          else {
            v22 = v20;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)id v54 = v19;
            _os_log_impl(&dword_23F08F000, v22, OS_LOG_TYPE_DEFAULT, "Falling back to airplay after status: %d", buf, 8u);
          }
          v23 = *(void **)(a1 + 88);
          uint64_t v57 = *(void *)(a1 + 40);
          v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
          uint64_t v25 = [v23 createPlaybackQueueFromRequestIdentifiers:v24 startPlaying:*(unsigned __int8 *)(a1 + 97) assetInfo:*(void *)(a1 + 48) requesterSharedUserId:*(void *)(a1 + 56) sharedUserIdFromPlayableITunesAccount:*(void *)(a1 + 64)];

          id v14 = [[MTMPCAssistantGenericPlaybackQueue alloc] initWithContextID:*(void *)(a1 + 72) playbackQueueRef:v25];
          [*(id *)(a1 + 88) modifyContextForAirplay:*(void *)(a1 + 32) andPlayLocally:v14 completion:*(void *)(a1 + 80)];
          goto LABEL_64;
        }
      }
      else
      {
      }
    }
    if (!*(void *)(a1 + 80))
    {
LABEL_65:

      goto LABEL_66;
    }
    uint64_t v43 = [v9 domain];
    if ([v43 isEqualToString:*MEMORY[0x263F54760]]) {
      uint64_t v44 = [v9 code];
    }
    else {
      uint64_t v44 = 0;
    }

    uint64_t v45 = [v9 domain];
    if ([v45 isEqualToString:*MEMORY[0x263F54758]]) {
      uint64_t v46 = [v9 code];
    }
    else {
      uint64_t v46 = 0;
    }

    POLogInitIfNeeded();
    if (POLogContextCommand) {
      uint64_t v47 = POLogContextCommand;
    }
    else {
      uint64_t v47 = v20;
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)id v54 = v19;
      *(_WORD *)&v54[4] = 2048;
      *(void *)&v54[6] = v44;
      __int16 v55 = 2048;
      uint64_t v56 = v46;
      _os_log_impl(&dword_23F08F000, v47, OS_LOG_TYPE_DEFAULT, "Completed sendPlaybackQueueWithResult with MR status: %d, remote error: %ld, assistant error: %ld", buf, 0x1Cu);
    }
    if (v9 && (MPCAssistantErrorIsInformational() & 1) == 0)
    {
      id v14 = v9;
      POLogInitIfNeeded();
      if (POLogContextCommand) {
        v48 = POLogContextCommand;
      }
      else {
        v48 = v20;
      }
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_23_cold_2((uint64_t)v14, v48);
      }
    }
    else
    {
      id v14 = 0;
    }
    v34 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_63:
    v34();
LABEL_64:

    goto LABEL_65;
  }
  POLogInitIfNeeded();
  if (POLogContextCommand) {
    v35 = POLogContextCommand;
  }
  else {
    v35 = v5;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_23_cold_1(v35, v36, v37, v38, v39, v40, v41, v42);
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_66:
}

+ (void)_resolveWithDestination:(id)a3 hashedRouteIdentifiers:(id)a4 decodedRouteIdentifiers:(id)a5 originatingOutputDeviceUID:(id)a6 localPlaybackPermitted:(BOOL)a7 audioRoutingInfo:(id)a8 completion:(id)a9
{
  BOOL v10 = a7;
  id v18 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  if ([v16 length]) {
    [v18 setOriginatingOutputDeviceUID:v16];
  }
  if ([v15 count]) {
    [v18 resolveWithQueue:0 routeIdentifiers:v15 localPlaybackPermitted:v10 audioRoutingInfo:*(unsigned int *)&a8 completion:v17];
  }
  else {
    [v18 resolveWithQueue:0 hashedRouteIdentifiers:v14 localPlaybackPermitted:v10 audioRoutingInfo:*(unsigned int *)&a8 completion:v17];
  }
}

+ (void)modifyContextForAirplay:(id)a3 andPlayLocally:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = modifyContextForAirplay_andPlayLocally_completion__onceToken;
  id v10 = a3;
  if (v9 != -1) {
    dispatch_once(&modifyContextForAirplay_andPlayLocally_completion__onceToken, &__block_literal_global_1);
  }
  id v11 = (void *)modifyContextForAirplay_andPlayLocally_completion__assistantContext;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__POUtilities_modifyContextForAirplay_andPlayLocally_completion___block_invoke_2;
  v14[3] = &unk_265055960;
  id v15 = v7;
  id v16 = v8;
  id v12 = v7;
  id v13 = v8;
  [v11 modifySystemMusicContextForDestination:v10 completion:v14];
}

uint64_t __65__POUtilities_modifyContextForAirplay_andPlayLocally_completion___block_invoke()
{
  modifyContextForAirplay_andPlayLocally_completion__assistantContext = (uint64_t)objc_alloc_init(MEMORY[0x263F547A0]);
  return MEMORY[0x270F9A758]();
}

void __65__POUtilities_modifyContextForAirplay_andPlayLocally_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, 2, v3);
    }
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263F54780]);
    id v6 = objc_alloc(MEMORY[0x263F547D0]);
    id v7 = (void *)[v6 initWithAppBundleID:*MEMORY[0x263F5EB90] playerID:@"Podcasts" origin:0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__POUtilities_modifyContextForAirplay_andPlayLocally_completion___block_invoke_3;
    v9[3] = &unk_265055938;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v5 sendPlaybackQueue:v8 toDestination:v7 completion:v9];
  }
}

void __65__POUtilities_modifyContextForAirplay_andPlayLocally_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [a3 firstObject];
  uint64_t v7 = [v6 unsignedIntValue];

  uint64_t v8 = [v5 domain];
  if ([v8 isEqualToString:*MEMORY[0x263F54760]]) {
    uint64_t v9 = [v5 code];
  }
  else {
    uint64_t v9 = 0;
  }

  id v10 = [v5 domain];
  if ([v10 isEqualToString:*MEMORY[0x263F54758]]) {
    uint64_t v11 = [v5 code];
  }
  else {
    uint64_t v11 = 0;
  }

  POLogInitIfNeeded();
  if (POLogContextCommand) {
    id v12 = POLogContextCommand;
  }
  else {
    id v12 = &_os_log_internal;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109632;
    v14[1] = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = v11;
    _os_log_impl(&dword_23F08F000, v12, OS_LOG_TYPE_DEFAULT, "Completed Airplay fallback with MR status: %d, remote error: %ld, assistant error: %ld", (uint8_t *)v14, 0x1Cu);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v7, v5);
  }
}

+ (_MRSystemAppPlaybackQueue)createPlaybackQueueFromRequestIdentifiers:(id)a3 startPlaying:(BOOL)a4 assetInfo:(id)a5 requesterSharedUserId:(id)a6 sharedUserIdFromPlayableITunesAccount:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  id v14 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

  __int16 v15 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  uint64_t v16 = v15;
  if (v10) {
    [v15 setObject:v10 forKey:@"requesterUserId"];
  }
  if (v11) {
    [v16 setObject:v11 forKey:@"sharedUserId"];
  }
  MRSystemAppPlaybackQueueSetUserInfo();
  MRSystemAppPlaybackQueueSetTracklistShuffleMode();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetSiriAssetInfo();

  return v14;
}

+ (id)commandStatusForRemoteStatus:(unsigned int)a3 error:(id)a4 isRemoteStorePlayback:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  uint64_t v8 = [v7 domain];
  if ([v8 isEqualToString:*MEMORY[0x263F54760]])
  {
    uint64_t v9 = [v7 code];
  }
  else
  {
    id v10 = [v7 domain];
    if ([v10 isEqualToString:@"POUtilitiesMRSendCommandErrorDomain"]) {
      uint64_t v9 = [v7 code];
    }
    else {
      uint64_t v9 = 0;
    }
  }
  id v11 = [v7 domain];
  if ([v11 isEqualToString:*MEMORY[0x263F54758]]) {
    uint64_t v12 = [v7 code];
  }
  else {
    uint64_t v12 = 0;
  }

  id v13 = [v7 domain];
  if ([v13 isEqualToString:@"POUtilitiesErrorDomain"]) {
    uint64_t v14 = [v7 code];
  }
  else {
    uint64_t v14 = 0;
  }

  if (v9)
  {
    id v15 = objc_alloc(MEMORY[0x263F64820]);
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"MediaRemote error code %ld", v9);
    __int16 v17 = (void *)[v15 initWithReason:v16];

    goto LABEL_48;
  }
  if ((int)a3 > 9)
  {
    if (a3 == 20)
    {
      uint64_t v18 = (uint64_t *)MEMORY[0x263F65A38];
      goto LABEL_28;
    }
    if (a3 == 10)
    {
      uint64_t v18 = (uint64_t *)MEMORY[0x263F659D8];
      goto LABEL_28;
    }
    goto LABEL_23;
  }
  if (!a3)
  {
    uint64_t v19 = 0;
    goto LABEL_29;
  }
  if (a3 != 1)
  {
LABEL_23:
    if (v5) {
      uint64_t v19 = *MEMORY[0x263F65A30];
    }
    else {
      uint64_t v19 = -1;
    }
    goto LABEL_29;
  }
  if (v5)
  {
    uint64_t v18 = (uint64_t *)MEMORY[0x263F65A18];
LABEL_28:
    uint64_t v19 = *v18;
    goto LABEL_29;
  }
  uint64_t v25 = +[PODataSource sharedInstance];
  v26 = [v25 podcastCollections];
  uint64_t v27 = [v26 count];
  uint64_t v28 = (uint64_t *)MEMORY[0x263F659E8];
  if (!v27) {
    uint64_t v28 = (uint64_t *)MEMORY[0x263F659F0];
  }
  uint64_t v19 = *v28;

LABEL_29:
  switch(v14)
  {
    case 'e':
      char v20 = (uint64_t *)MEMORY[0x263F65A10];
      goto LABEL_34;
    case 'g':
      char v20 = (uint64_t *)MEMORY[0x263F659E0];
      goto LABEL_34;
    case 'h':
      char v20 = (uint64_t *)MEMORY[0x263F659D0];
      goto LABEL_34;
    case 'i':
      char v20 = (uint64_t *)MEMORY[0x263F659C8];
LABEL_34:
      uint64_t v19 = *v20;
      break;
    default:
      break;
  }
  if (v19)
  {
    if (v12 != 1) {
      goto LABEL_43;
    }
    uint64_t v21 = (uint64_t *)MEMORY[0x263F659C8];
  }
  else if (v12 == 6)
  {
    uint64_t v21 = (uint64_t *)MEMORY[0x263F65A20];
  }
  else
  {
    if (v12 != 7)
    {
LABEL_45:
      v22 = (objc_class *)MEMORY[0x263F64830];
      goto LABEL_46;
    }
    uint64_t v21 = (uint64_t *)MEMORY[0x263F65A28];
  }
  uint64_t v19 = *v21;
  if (!*v21) {
    goto LABEL_45;
  }
LABEL_43:
  v22 = (objc_class *)MEMORY[0x263F64820];
  if (v19 == -1)
  {
LABEL_46:
    id v23 = objc_alloc_init(v22);
    goto LABEL_47;
  }
  id v23 = (id)[objc_alloc(MEMORY[0x263F64820]) initWithErrorCode:v19];
LABEL_47:
  __int16 v17 = v23;
LABEL_48:

  return v17;
}

+ (BOOL)isPodcastsNowPlaying
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  id v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = dispatch_get_global_queue(0, 0);
  uint64_t v5 = MEMORY[0x263EF8330];
  id v6 = v2;
  MRMediaRemoteGetNowPlayingClient();

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = objc_msgSend((id)v8[5], "isEqual:", @"com.apple.podcasts", v5, 3221225472, __35__POUtilities_isPodcastsNowPlaying__block_invoke, &unk_265055988);

  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __35__POUtilities_isPodcastsNowPlaying__block_invoke(uint64_t a1)
{
  id v8 = (id)MRNowPlayingClientCopyBundleIdentifierHierarchy();
  dispatch_semaphore_t v2 = MRNowPlayingClientGetParentAppBundleIdentifier();
  if ([v8 count])
  {
    uint64_t v3 = [v8 lastObject];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v2;
    uint64_t v5 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)setPlaybackRate:(float)a3 failureErrorCode:(int64_t)a4 completion:(id)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  id v6 = a5;
  v15[0] = *MEMORY[0x263F54D20];
  *(float *)&double v7 = a3;
  id v8 = [NSNumber numberWithFloat:v7];
  v15[1] = *MEMORY[0x263F54CC0];
  v16[0] = v8;
  v16[1] = MEMORY[0x263EFFA88];
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  POLogInitIfNeeded();
  if (POLogContextCommand) {
    id v10 = POLogContextCommand;
  }
  else {
    id v10 = &_os_log_internal;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v14 = a3;
    _os_log_impl(&dword_23F08F000, v10, OS_LOG_TYPE_INFO, "Will be setting currentPlaybackRate using MediaRemote to %f", buf, 0xCu);
  }
  id v11 = dispatch_get_global_queue(0, 0);
  id v12 = v6;
  MRMediaRemoteSendCommandWithReply();
}

void __59__POUtilities_setPlaybackRate_failureErrorCode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (!v4)
  {

LABEL_26:
    id v7 = objc_alloc_init(MEMORY[0x263F64830]);
    goto LABEL_27;
  }
  uint64_t v6 = v4;
  id v7 = 0;
  uint64_t v8 = *(void *)v20;
  uint64_t v9 = &_os_log_internal;
  *(void *)&long long v5 = 67109120;
  long long v18 = v5;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v20 != v8) {
      objc_enumerationMutation(v3);
    }
    int v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v10), "integerValue", v18, (void)v19);
    int v12 = v11;
    if (v11) {
      BOOL v13 = v11 == 3;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      POLogInitIfNeeded();
      if (POLogContextCommand) {
        double v14 = POLogContextCommand;
      }
      else {
        double v14 = v9;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v18;
        int v24 = v12;
        _os_log_error_impl(&dword_23F08F000, v14, OS_LOG_TYPE_ERROR, "MediaRemote command failed with status %u", buf, 8u);
      }
      uint64_t v15 = [objc_alloc(MEMORY[0x263F64820]) initWithErrorCode:*(void *)(a1 + 40)];

      id v7 = (id)v15;
    }
    if (v12 != 3 && v12 != 0) {
      break;
    }
    if (v6 == ++v10)
    {
      uint64_t v6 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v6) {
        goto LABEL_3;
      }
      break;
    }
  }

  if (!v7) {
    goto LABEL_26;
  }
LABEL_27:
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17) {
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v7);
  }
}

+ (BOOL)assistantErrorIsInformational:(id)a3
{
  return 0;
}

+ (BOOL)errorIsMaxStreamCount:(id)a3
{
  return 0;
}

+ (BOOL)errorIsNoNetwork:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:@"MTSetPlaybackQueueUtilErrorDomain"]) {
    BOOL v5 = [v3 code] == -433001;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)errorIsApplicationRequiresPreflight:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F54760]]) {
    BOOL v5 = [v3 code] == 15;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (void)performPodcastsPlaybackRequestWithIdentifier:(uint64_t)a3 assetInfo:(uint64_t)a4 hashedRouteUIDs:(uint64_t)a5 decodedRouteUIDs:(uint64_t)a6 originatingOutputDeviceUID:(uint64_t)a7 startPlaying:(uint64_t)a8 requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:context:allowsFallback:completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_23_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_23_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F08F000, a2, OS_LOG_TYPE_ERROR, "sendPlaybackQueueWithResult encountered error %@", (uint8_t *)&v2, 0xCu);
}

void __237__POUtilities_performPodcastsPlaybackRequestWithIdentifier_assetInfo_hashedRouteUIDs_decodedRouteUIDs_originatingOutputDeviceUID_startPlaying_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_context_allowsFallback_completion___block_invoke_23_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end