@interface MRDestinationResolver
+ (void)resolveDestination:(id)a3 level:(int64_t)a4 timeout:(double)a5 completion:(id)a6;
+ (void)resolveDestination:(id)a3 timeout:(double)a4 completion:(id)a5;
+ (void)resolvePartialDestination:(id)a3 level:(int64_t)a4 timeout:(double)a5 completion:(id)a6;
+ (void)resolvePartialDestination:(id)a3 level:(int64_t)a4 timeout:(double)a5 dependencies:(id)a6 completion:(id)a7;
- (BOOL)isDynamicEndpoint;
- (BOOL)isProactiveEndpoint;
- (BOOL)isUserSelectedEndpoint;
- (BOOL)registeredForEndpointChanges;
- (BOOL)registeredForEndpointInvalidations;
- (BOOL)registeredForNotifications;
- (BOOL)registeredForPlayerPathInvalidations;
- (BOOL)resolving;
- (MRAVEndpoint)delegateEndpoint;
- (MRAVEndpoint)resolvingEndpoint;
- (MRAVEndpointObserver)endpointObserver;
- (MRDestination)destination;
- (MRDestination)originalDestination;
- (MRDestinationResolver)initWithDestination:(id)a3 label:(id)a4;
- (MRDestinationResolver)initWithDestination:(id)a3 label:(id)a4 dependencies:(id)a5;
- (MRDestinationResolverDelegate)delegate;
- (MRDestinationResolverDependencies)dependencies;
- (MROrigin)delegateOrigin;
- (MRPlayerPath)delegatePlayerPath;
- (MRPlayerPath)resolvingPlayerPath;
- (MSVVariableIntervalTimer)connectionRetryTimer;
- (MSVVariableIntervalTimer)reconRetryTimer;
- (NSString)endpointObserverGroupUID;
- (NSString)label;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)serialQueue;
- (id)debugDescription;
- (id)description;
- (id)playerPathInvalidationObserver;
- (void)_handleEndpointDidDisconnectNotification:(id)a3;
- (void)beginResolving;
- (void)createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)endpointDidDisconnect:(id)a3;
- (void)handleActiveSystemEndpointChangedNotification:(id)a3;
- (void)handleEndpointChanged;
- (void)handleEndpointInvalidated;
- (void)handleEndpointResolution:(id)a3 client:(id)a4 player:(id)a5 source:(id)a6 error:(id)a7;
- (void)handlePlayerPathInvalidatedWithPlayerPath:(id)a3;
- (void)notifyDelegateOfEndpointChange:(id)a3;
- (void)notifyDelegateOfError:(id)a3;
- (void)notifyDelegateOfInvalidation;
- (void)notifyDelegateOfOriginChange:(id)a3;
- (void)notifyDelegateOfPlayerPathChange:(id)a3;
- (void)onQueue_clearStateForEndpoint;
- (void)onQueue_clearStateForOutputDeviceUID;
- (void)onQueue_clearStateForPlayerPath;
- (void)onQueue_registerForEndpointInvalidations:(id)a3;
- (void)onQueue_registerForPlayerPathInvalidationsForUnresolvedPlayerPath:(id)a3;
- (void)onQueue_retrieveEndpointForContextUID:(id)a3 completion:(id)a4;
- (void)onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4;
- (void)onQueue_setEndpoint:(id)a3;
- (void)onQueue_setOrigin:(id)a3;
- (void)onQueue_setResolvedPlayerPath:(id)a3;
- (void)onQueue_setUnresolvedPlayerPath:(id)a3;
- (void)registerForEndpointChangesForOutputDeviceUID:(id)a3;
- (void)resolve;
- (void)resolveForEndpoint:(id)a3 client:(id)a4 player:(id)a5;
- (void)resolveForOutputContextUID:(id)a3 client:(id)a4 player:(id)a5;
- (void)resolveForOutputDeviceUID:(id)a3 client:(id)a4 player:(id)a5;
- (void)resolveForResolvedPlayerPath:(id)a3;
- (void)resolveForUnresolvedPlayerPath:(id)a3;
- (void)resolvePlayerPath:(id)a3 completion:(id)a4;
- (void)setConnectionRetryTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateEndpoint:(id)a3;
- (void)setDelegateOrigin:(id)a3;
- (void)setDelegatePlayerPath:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDependencies:(id)a3;
- (void)setEndpointObserver:(id)a3;
- (void)setEndpointObserverGroupUID:(id)a3;
- (void)setOriginalDestination:(id)a3;
- (void)setPlayerPathInvalidationObserver:(id)a3;
- (void)setReconRetryTimer:(id)a3;
- (void)setRegisteredForEndpointChanges:(BOOL)a3;
- (void)setRegisteredForEndpointInvalidations:(BOOL)a3;
- (void)setRegisteredForNotifications:(BOOL)a3;
- (void)setRegisteredForPlayerPathInvalidations:(BOOL)a3;
- (void)setResolving:(BOOL)a3;
- (void)setResolvingEndpoint:(id)a3;
- (void)setResolvingPlayerPath:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)unregisterForEndpointChanges;
- (void)unregisterForEndpointInvalidations;
- (void)unregisterForPlayerPathInvalidations;
@end

@implementation MRDestinationResolver

+ (void)resolveDestination:(id)a3 timeout:(double)a4 completion:(id)a5
{
}

+ (void)resolveDestination:(id)a3 level:(int64_t)a4 timeout:(double)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = +[MRDestinationResolverDependencies defaultDependencies];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__MRDestinationResolver_resolveDestination_level_timeout_completion___block_invoke;
  v14[3] = &unk_1E57D40F8;
  id v15 = v10;
  id v13 = v10;
  [a1 resolvePartialDestination:v11 level:a4 timeout:v12 dependencies:v14 completion:a5];
}

uint64_t __69__MRDestinationResolver_resolveDestination_level_timeout_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a3) {
      a2 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

+ (void)resolvePartialDestination:(id)a3 level:(int64_t)a4 timeout:(double)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = +[MRDestinationResolverDependencies defaultDependencies];
  [a1 resolvePartialDestination:v11 level:a4 timeout:v12 dependencies:v10 completion:a5];
}

+ (void)resolvePartialDestination:(id)a3 level:(int64_t)a4 timeout:(double)a5 dependencies:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__15;
  v46 = __Block_byref_object_dispose__15;
  v47 = objc_alloc_init(MRDestinationResolverHelper);
  [(id)v43[5] setLevel:a4];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__15;
  v40 = __Block_byref_object_dispose__15;
  v41 = [[MRDestinationResolver alloc] initWithDestination:v11 label:@"resolvePartialDestination" dependencies:v12];
  [(id)v37[5] setDelegate:v43[5]];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke;
  v31[3] = &unk_1E57D4120;
  id v14 = v11;
  id v32 = v14;
  id v15 = v13;
  id v33 = v15;
  v34 = &v36;
  v35 = &v42;
  v16 = (void *)MEMORY[0x1997190F0](v31);
  v17 = [MRBlockGuard alloc];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke_2;
  v29[3] = &unk_1E57D0FE8;
  id v18 = v16;
  id v30 = v18;
  v19 = [(MRBlockGuard *)v17 initWithTimeout:@"MRDestinationResolver" reason:v29 handler:a5];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke_3;
  v25 = &unk_1E57D4148;
  int64_t v28 = a4;
  v20 = v19;
  v26 = v20;
  id v21 = v18;
  id v27 = v21;
  [(id)v43[5] setCallback:&v22];
  objc_msgSend((id)v37[5], "beginResolving", v22, v23, v24, v25);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

void __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v14 = (id)[a2 copy];
  v6 = [v14 client];
  if (v6)
  {
    [v14 setClient:v6];
  }
  else
  {
    v7 = [*(id *)(a1 + 32) client];
    [v14 setClient:v7];
  }
  v8 = [v14 player];
  if (v8)
  {
    [v14 setPlayer:v8];
  }
  else
  {
    v9 = [*(id *)(a1 + 32) player];
    [v14 setPlayer:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCallback:0];
}

uint64_t __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__MRDestinationResolver_resolvePartialDestination_level_timeout_dependencies_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6 == 2)
  {
    v7 = [v11 playerPath];

    if (v7) {
      goto LABEL_12;
    }
    uint64_t v6 = *(void *)(a1 + 48);
  }
  if (v6 == 1)
  {
    v8 = [v11 endpoint];

    if (!v8)
    {
      uint64_t v6 = *(void *)(a1 + 48);
      goto LABEL_7;
    }
LABEL_12:
    if (![*(id *)(a1 + 32) disarm]) {
      goto LABEL_15;
    }
    v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_14;
  }
LABEL_7:
  if (!v6)
  {
    uint64_t v10 = [v11 origin];

    if (v10) {
      goto LABEL_12;
    }
  }
  if (v5 && [*(id *)(a1 + 32) disarm])
  {
    v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_14:
    v9();
  }
LABEL_15:
}

- (MRDestinationResolver)initWithDestination:(id)a3 label:(id)a4 dependencies:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MRDestinationResolver;
  id v11 = [(MRDestinationResolver *)&v24 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dependencies, a5);
    objc_storeStrong((id *)&v12->_label, a4);
    if (v8)
    {
      uint64_t v13 = [v8 copy];
    }
    else
    {
      uint64_t v13 = +[MRDestination localDestination];
    }
    originalDestination = v12->_originalDestination;
    v12->_originalDestination = (MRDestination *)v13;

    uint64_t v15 = [(MRDestination *)v12->_originalDestination copy];
    destination = v12->_destination;
    v12->_destination = (MRDestination *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.mediaremote.MRDestinationResolver-serial", v17);
    serialQueue = v12->_serialQueue;
    v12->_serialQueue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.mediaremote.MRDestinationResolver-delegate", v20);
    delegateQueue = v12->_delegateQueue;
    v12->_delegateQueue = (OS_dispatch_queue *)v21;
  }
  return v12;
}

- (MRDestinationResolver)initWithDestination:(id)a3 label:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MRDestinationResolverDependencies defaultDependencies];
  id v9 = [(MRDestinationResolver *)self initWithDestination:v7 label:v6 dependencies:v8];

  return v9;
}

- (void)dealloc
{
  [(MRDestinationResolver *)self unregisterForPlayerPathInvalidations];
  v3.receiver = self;
  v3.super_class = (Class)MRDestinationResolver;
  [(MRDestinationResolver *)&v3 dealloc];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRDestinationResolver *)self label];
  id v6 = [(MRDestinationResolver *)self originalDestination];
  id v7 = [(MRDestinationResolver *)self destination];
  id v8 = (void *)[v3 initWithFormat:@"<%@ %p %@ : %@->%@", v4, self, v5, v6, v7];

  return v8;
}

- (id)debugDescription
{
  id v17 = [NSString alloc];
  uint64_t v16 = objc_opt_class();
  id v14 = [(MRDestinationResolver *)self label];
  v19 = [(MRDestinationResolver *)self originalDestination];
  uint64_t v13 = MRCreateIndentedDebugDescriptionFromObject(v19);
  dispatch_queue_t v18 = [(MRDestinationResolver *)self destination];
  id v3 = MRCreateIndentedDebugDescriptionFromObject(v18);
  uint64_t v15 = [(MRDestinationResolver *)self endpointObserver];
  uint64_t v4 = MRCreateIndentedDebugDescriptionFromObject(v15);
  id v5 = [(MRDestinationResolver *)self playerPathInvalidationObserver];
  if ([(MRDestinationResolver *)self resolving]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  id v7 = [(MSVVariableIntervalTimer *)self->_reconRetryTimer remainingIntervals];
  id v8 = MRCreateIndentedDebugDescriptionFromObject(v7);
  id v9 = [(MSVVariableIntervalTimer *)self->_connectionRetryTimer remainingIntervals];
  id v10 = MRCreateIndentedDebugDescriptionFromObject(v9);
  id v11 = (void *)[v17 initWithFormat:@"<%@ %p %@ {\n   originalDestination = %@\n   resolvedDestination = %@\n   endpointObserver = %@\n   playerPathInvalidationHandler = %@\n   resolving = %@\n   reconRetryTimer = %@\n   connectionRetryTimer = %@\n}\n", v16, self, v14, v13, v3, v4, v5, v6, v8, v10];

  return v11;
}

- (void)beginResolving
{
  id v3 = [(MRDestinationResolver *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MRDestinationResolver_beginResolving__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __39__MRDestinationResolver_beginResolving__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) resolving];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setResolving:1];
    id v3 = *(void **)(a1 + 32);
    return [v3 resolve];
  }
  return result;
}

- (MRDestination)destination
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__15;
  id v9 = __Block_byref_object_dispose__15;
  id v10 = 0;
  v2 = [(MRDestinationResolver *)self serialQueue];
  msv_dispatch_sync_on_queue();

  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (MRDestination *)v3;
}

uint64_t __36__MRDestinationResolver_destination__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)onQueue_setEndpoint:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v4 = [(MRDestination *)self->_destination endpoint];

  if (v4 != v6)
  {
    [(MRDestination *)self->_destination setEndpoint:v6];
    uint64_t v5 = [v6 origin];
    [(MRDestinationResolver *)self onQueue_setOrigin:v5];
  }
  [(MRDestinationResolver *)self notifyDelegateOfEndpointChange:v6];
}

- (void)onQueue_setOrigin:(id)a3
{
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v4 = [(MRDestination *)self->_destination origin];
  if (v4 == v12)
  {
  }
  else
  {
    char v5 = [v12 isEqual:v4];

    id v6 = v12;
    if (v5) {
      goto LABEL_8;
    }
    destination = self->_destination;
    if (v12)
    {
      [(MRDestination *)destination setOrigin:v12];
      id v8 = [(MRDestinationResolver *)self originalDestination];
      id v9 = [v8 client];
      [(MRDestination *)self->_destination setClient:v9];

      id v10 = [(MRDestinationResolver *)self originalDestination];
      id v11 = [v10 player];
      [(MRDestination *)self->_destination setPlayer:v11];
    }
    else
    {
      [(MRDestination *)destination setPlayerPath:0];
    }
  }
  id v6 = v12;
LABEL_8:
  [(MRDestinationResolver *)self notifyDelegateOfOriginChange:v6];
}

- (void)onQueue_setUnresolvedPlayerPath:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v4 = [(MRDestination *)self->_destination playerPath];
  if (v4 == v6)
  {
  }
  else
  {
    char v5 = [v6 isEqual:v4];

    if ((v5 & 1) == 0) {
      [(MRDestination *)self->_destination setPlayerPath:v6];
    }
  }
}

- (void)onQueue_setResolvedPlayerPath:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v4 = [(MRDestination *)self->_destination playerPath];
  if (v4 == v6)
  {
  }
  else
  {
    char v5 = [v6 isEqual:v4];

    if ((v5 & 1) == 0) {
      [(MRDestination *)self->_destination setPlayerPath:v6];
    }
  }
  [(MRDestinationResolver *)self notifyDelegateOfPlayerPathChange:v6];
}

- (MRAVEndpointObserver)endpointObserver
{
  if (!self->_endpointObserver)
  {
    id v3 = [(MRDestinationResolver *)self destination];
    id v4 = [v3 outputDeviceUID];

    if (v4)
    {
      char v5 = [(MRDestinationResolver *)self dependencies];
      id v6 = [(MRDestinationResolver *)self destination];
      uint64_t v7 = [v6 outputDeviceUID];
      id v8 = [v5 createEndpointObserverWithUID:v7];
      endpointObserver = self->_endpointObserver;
      self->_endpointObserver = v8;
    }
  }
  id v10 = self->_endpointObserver;

  return v10;
}

- (void)resolve
{
  id v3 = [(MRDestinationResolver *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MRDestinationResolver_resolve__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(v3, block);
}

void __32__MRDestinationResolver_resolve__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) resolving])
  {
    id v2 = *(id *)(*(void *)(a1 + 32) + 16);
    id v3 = [v2 playerPath];
    int v4 = [v3 isResolved];

    if (v4)
    {
      char v5 = *(void **)(a1 + 32);
      id v6 = [v2 playerPath];
      [v5 resolveForResolvedPlayerPath:v6];
LABEL_4:

LABEL_13:
      return;
    }
    uint64_t v7 = [v2 endpoint];

    if (v7)
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = [v2 endpoint];
      id v10 = [*(id *)(a1 + 32) originalDestination];
      id v11 = [v10 client];
      id v12 = [*(id *)(a1 + 32) originalDestination];
      uint64_t v13 = [v12 player];
      [v8 resolveForEndpoint:v9 client:v11 player:v13];
    }
    else
    {
      id v14 = [v2 outputContextUID];

      if (v14)
      {
        uint64_t v15 = *(void **)(a1 + 32);
        id v9 = [v2 outputContextUID];
        id v10 = [*(id *)(a1 + 32) originalDestination];
        id v11 = [v10 client];
        id v12 = [*(id *)(a1 + 32) originalDestination];
        uint64_t v13 = [v12 player];
        [v15 resolveForOutputContextUID:v9 client:v11 player:v13];
      }
      else
      {
        uint64_t v16 = [v2 outputDeviceUID];

        if (!v16)
        {
          dispatch_queue_t v18 = [v2 playerPath];
          if (v18)
          {
          }
          else
          {
            v19 = [*(id *)(a1 + 32) originalDestination];
            v20 = [v19 playerPath];

            if (!v20)
            {
              objc_super v24 = *(void **)(a1 + 32);
              v25 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:6];
              [v24 notifyDelegateOfError:v25];

              id v6 = _MRLogForCategory(0);
              if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v26 = *(void *)(a1 + 32);
                int v27 = 138412802;
                uint64_t v28 = v26;
                __int16 v29 = 2112;
                uint64_t v30 = v26;
                __int16 v31 = 2112;
                id v32 = v2;
                _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "%@ <%@> Unable to resolve destination %@", (uint8_t *)&v27, 0x20u);
              }
              goto LABEL_4;
            }
          }
          dispatch_queue_t v21 = [v2 playerPath];
          uint64_t v22 = v21;
          if (v21)
          {
            id v9 = v21;
          }
          else
          {
            uint64_t v23 = [*(id *)(a1 + 32) originalDestination];
            id v9 = [v23 playerPath];
          }
          [*(id *)(a1 + 32) resolveForUnresolvedPlayerPath:v9];
LABEL_12:

          goto LABEL_13;
        }
        id v17 = *(void **)(a1 + 32);
        id v9 = [v2 outputDeviceUID];
        id v10 = [*(id *)(a1 + 32) originalDestination];
        id v11 = [v10 client];
        id v12 = [*(id *)(a1 + 32) originalDestination];
        uint64_t v13 = [v12 player];
        [v17 resolveForOutputDeviceUID:v9 client:v11 player:v13];
      }
    }

    goto LABEL_12;
  }
}

- (void)resolveForResolvedPlayerPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(MRDestinationResolver *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = _MRLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "%@ <%@> Resolved playerPath: %@.", (uint8_t *)&v7, 0x20u);
  }

  [(MRDestinationResolver *)self onQueue_setResolvedPlayerPath:v4];
}

- (void)resolveForUnresolvedPlayerPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(MRDestinationResolver *)self serialQueue];
  dispatch_assert_queue_V2(v6);

  int v7 = _MRLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "%@ <%@> Begin resolving for unresolvedPlayerPath=%@", buf, 0x20u);
  }

  objc_storeStrong((id *)&self->_resolvingPlayerPath, a3);
  [(MRDestinationResolver *)self onQueue_registerForPlayerPathInvalidationsForUnresolvedPlayerPath:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__MRDestinationResolver_resolveForUnresolvedPlayerPath___block_invoke;
  v9[3] = &unk_1E57D4170;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(MRDestinationResolver *)self resolvePlayerPath:v8 completion:v9];
}

void __56__MRDestinationResolver_resolveForUnresolvedPlayerPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(*(void *)(a1 + 32) + 128) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    __int16 v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v16 = 138412802;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      dispatch_queue_t v21 = v5;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_INFO, "%@ <%@> PlayerPath has changed since we requested to resolve it. Ignoring incoming playerPath: %@", (uint8_t *)&v16, 0x20u);
    }
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 128);
  *(void *)(v7 + 128) = 0;

  if (![v5 isResolved])
  {
    if (v6) {
      Error = v6;
    }
    else {
      Error = MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    }
    __int16 v9 = Error;
    id v12 = _MRLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v16 = 138412802;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      dispatch_queue_t v21 = v9;
      _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "%@ <%@> Error resolving for unresolvedPlayerPath %@", (uint8_t *)&v16, 0x20u);
    }

    uint64_t v14 = [v9 code];
    __int16 v15 = *(void **)(a1 + 32);
    if (v14 == 5)
    {
      [v15 unregisterForPlayerPathInvalidations];
      objc_msgSend(*(id *)(a1 + 32), "onQueue_clearStateForPlayerPath");
    }
    else
    {
      objc_msgSend(v15, "onQueue_setUnresolvedPlayerPath:", v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "onQueue_setUnresolvedPlayerPath:", v5);
    [*(id *)(a1 + 32) notifyDelegateOfError:v9];
LABEL_15:

    goto LABEL_16;
  }
  [*(id *)(a1 + 32) resolveForResolvedPlayerPath:v5];
LABEL_16:
}

- (void)resolveForEndpoint:(id)a3 client:(id)a4 player:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(MRDestinationResolver *)self serialQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = _MRLogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v9 debugName];
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    dispatch_queue_t v21 = self;
    __int16 v22 = 2112;
    uint64_t v23 = v14;
    _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "%@ <%@> Begin resolving for endpoint=%@", buf, 0x20u);
  }
  objc_storeStrong((id *)&self->_resolvingEndpoint, a3);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__MRDestinationResolver_resolveForEndpoint_client_player___block_invoke;
  v16[3] = &unk_1E57D4170;
  v16[4] = self;
  id v17 = v9;
  id v15 = v9;
  [(MRDestinationResolver *)self createPlayerPathForEndpoint:v15 client:v11 player:v10 completion:v16];
}

void __58__MRDestinationResolver_resolveForEndpoint_client_player___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 120) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 120);
    *(void *)(v7 + 120) = 0;

    id v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [*(id *)(a1 + 40) debugName];
      *(_DWORD *)buf = 138413058;
      uint64_t v41 = v10;
      __int16 v42 = 2112;
      uint64_t v43 = v10;
      __int16 v44 = 2112;
      id v45 = v5;
      __int16 v46 = 2112;
      v47 = v11;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "%@ <%@> Setting unresolved playerPath to: %@ for endpoint=%@", buf, 0x2Au);
    }
    id v12 = [*(id *)(a1 + 32) serialQueue];
    dispatch_assert_queue_V2(v12);

    uint64_t v13 = [v5 origin];

    if (v13)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 144);
      *(void *)(v14 + 144) = 0;

      int v16 = *(void **)(a1 + 32);
      id v17 = [v5 origin];
      objc_msgSend(v16, "onQueue_setOrigin:", v17);

      objc_msgSend(*(id *)(a1 + 32), "onQueue_registerForEndpointInvalidations:", *(void *)(a1 + 40));
      [*(id *)(a1 + 32) resolveForUnresolvedPlayerPath:v5];
    }
    else
    {
      if (v6) {
        id v20 = v6;
      }
      else {
        id v20 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:5];
      }
      dispatch_queue_t v21 = v20;
      __int16 v22 = *(void **)(a1 + 32);
      if (v22[18])
      {
        uint64_t v23 = _MRLogForCategory(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = *(void *)(a1 + 32);
          [*(id *)(v24 + 144) timeUntilNextInterval];
          *(_DWORD *)buf = 138412802;
          uint64_t v41 = v24;
          __int16 v42 = 2112;
          uint64_t v43 = v24;
          __int16 v44 = 2048;
          id v45 = v25;
          _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "%@ <%@> ConnectionRetryTimer is already scheduled to retry in %lf more seconds", buf, 0x20u);
        }
      }
      else
      {
        objc_initWeak(&location, v22);
        uint64_t v36 = objc_msgSend([NSString alloc], "initWithFormat:", @"NowPlayingController.connectionRetryTimer<%p>", *(void *)(a1 + 32));
        id v26 = objc_alloc(MEMORY[0x1E4F77A38]);
        int v27 = +[MRUserSettings currentSettings];
        uint64_t v28 = [v27 destinationResolverReconRetryIntervals];
        uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 40);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __58__MRDestinationResolver_resolveForEndpoint_client_player___block_invoke_41;
        v37[3] = &unk_1E57D12A8;
        objc_copyWeak(&v38, &location);
        v37[4] = *(void *)(a1 + 32);
        uint64_t v30 = [v26 initWithIntervals:v28 name:v36 queue:v29 block:v37];
        uint64_t v31 = *(void *)(a1 + 32);
        id v32 = *(void **)(v31 + 144);
        *(void *)(v31 + 144) = v30;

        uint64_t v33 = _MRLogForCategory(0);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = *(void *)(a1 + 32);
          [*(id *)(v34 + 144) timeUntilNextInterval];
          *(_DWORD *)buf = 138412802;
          uint64_t v41 = v34;
          __int16 v42 = 2112;
          uint64_t v43 = v34;
          __int16 v44 = 2048;
          id v45 = v35;
          _os_log_impl(&dword_194F3C000, v33, OS_LOG_TYPE_DEFAULT, "%@ <%@> Starting ConnectionRetryTimer to fire in %lf seconds", buf, 0x20u);
        }

        [*(id *)(a1 + 32) notifyDelegateOfError:v21];
        objc_destroyWeak(&v38);

        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    __int16 v18 = _MRLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v41 = v19;
      __int16 v42 = 2112;
      uint64_t v43 = v19;
      __int16 v44 = 2112;
      id v45 = v5;
      _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_INFO, "%@ <%@> Resolved endpoint has changed since we requested a playerPath for it. Ignoring incoming playerPath: %@", buf, 0x20u);
    }
  }
}

void __58__MRDestinationResolver_resolveForEndpoint_client_player___block_invoke_41(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      [WeakRetained[18] currentInterval];
      int v6 = 138412802;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      id v9 = WeakRetained;
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "%@ <%@> ConnectionRetryTimer fired after %lf total seconds", (uint8_t *)&v6, 0x20u);
    }

    [WeakRetained resolve];
  }
}

- (void)resolveForOutputContextUID:(id)a3 client:(id)a4 player:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MRDestinationResolver *)self serialQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = [NSString stringWithFormat:@"outputContextUID=%@", v8];
  uint64_t v13 = _MRLogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "%@ <%@> Begin resolving for %@", buf, 0x20u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__MRDestinationResolver_resolveForOutputContextUID_client_player___block_invoke;
  v17[3] = &unk_1E57D4198;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v9;
  [(MRDestinationResolver *)self onQueue_retrieveEndpointForContextUID:v8 completion:v17];
}

uint64_t __66__MRDestinationResolver_resolveForOutputContextUID_client_player___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleEndpointResolution:a2 client:*(void *)(a1 + 40) player:*(void *)(a1 + 48) source:*(void *)(a1 + 56) error:a3];
}

- (void)resolveForOutputDeviceUID:(id)a3 client:(id)a4 player:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MRDestinationResolver *)self serialQueue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = [NSString stringWithFormat:@"outputDeviceUID=%@", v8];
  uint64_t v13 = _MRLogForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "%@ <%@> Begin resolving for %@", buf, 0x20u);
  }

  [(MRDestinationResolver *)self registerForEndpointChangesForOutputDeviceUID:v8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__MRDestinationResolver_resolveForOutputDeviceUID_client_player___block_invoke;
  v17[3] = &unk_1E57D4198;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v9;
  [(MRDestinationResolver *)self onQueue_retrieveEndpointForUID:v8 completion:v17];
}

uint64_t __65__MRDestinationResolver_resolveForOutputDeviceUID_client_player___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleEndpointResolution:a2 client:*(void *)(a1 + 40) player:*(void *)(a1 + 48) source:*(void *)(a1 + 56) error:a3];
}

- (void)handleEndpointResolution:(id)a3 client:(id)a4 player:(id)a5 source:(id)a6 error:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    id v17 = _MRLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MRDestinationResolver handleEndpointResolution:client:player:source:error:]((uint64_t)self, (uint64_t)v16, v17);
    }

    if (self->_reconRetryTimer)
    {
      id v18 = _MRLogForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        [(MSVVariableIntervalTimer *)self->_reconRetryTimer timeUntilNextInterval];
        *(_DWORD *)buf = 138412802;
        uint64_t v34 = self;
        __int16 v35 = 2112;
        uint64_t v36 = self;
        __int16 v37 = 2048;
        uint64_t v38 = v19;
        _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "%@ <%@> ReconRetryTimer is already scheduled to retry in %lf more seconds", buf, 0x20u);
      }
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"NowPlayingController.reconRetryTimer<%p>", self);
      id v21 = objc_alloc(MEMORY[0x1E4F77A38]);
      __int16 v22 = +[MRUserSettings currentSettings];
      __int16 v23 = [v22 destinationResolverReconRetryIntervals];
      serialQueue = self->_serialQueue;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __77__MRDestinationResolver_handleEndpointResolution_client_player_source_error___block_invoke;
      v30[3] = &unk_1E57D12A8;
      objc_copyWeak(&v31, &location);
      v30[4] = self;
      __int16 v25 = (MSVVariableIntervalTimer *)[v21 initWithIntervals:v23 name:v29 queue:serialQueue block:v30];
      reconRetryTimer = self->_reconRetryTimer;
      self->_reconRetryTimer = v25;

      uint64_t v27 = _MRLogForCategory(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        [(MSVVariableIntervalTimer *)self->_reconRetryTimer timeUntilNextInterval];
        *(_DWORD *)buf = 138412802;
        uint64_t v34 = self;
        __int16 v35 = 2112;
        uint64_t v36 = self;
        __int16 v37 = 2048;
        uint64_t v38 = v28;
        _os_log_impl(&dword_194F3C000, v27, OS_LOG_TYPE_DEFAULT, "%@ <%@> Starting ReconRetryTimer to fire in %lf seconds", buf, 0x20u);
      }

      [(MRDestinationResolver *)self notifyDelegateOfError:v16];
      objc_destroyWeak(&v31);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v20 = self->_reconRetryTimer;
    self->_reconRetryTimer = 0;

    [(MRDestinationResolver *)self resolveForEndpoint:v12 client:v13 player:v14];
  }
}

void __77__MRDestinationResolver_handleEndpointResolution_client_player_source_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      [WeakRetained[17] currentInterval];
      int v6 = 138412802;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      id v9 = WeakRetained;
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "%@ <%@> ReconRetryTimer fired after %lf total seconds", (uint8_t *)&v6, 0x20u);
    }

    [WeakRetained resolve];
  }
}

- (void)registerForEndpointChangesForOutputDeviceUID:(id)a3
{
  id v4 = a3;
  if (![(MRDestinationResolver *)self registeredForEndpointChanges])
  {
    if ([(MRDestinationResolver *)self isDynamicEndpoint])
    {
      uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:self selector:sel_handleActiveSystemEndpointChangedNotification_ name:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0];
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v8 = MEMORY[0x1E4F143A8];
      objc_copyWeak(&v9, &location);
      int v6 = [(MRDestinationResolver *)self endpointObserver];
      [v6 setEndpointChangedCallback:&v8];

      uint64_t v7 = [(MRDestinationResolver *)self endpointObserver];
      [v7 begin];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    [(MRDestinationResolver *)self setRegisteredForEndpointChanges:1];
  }
}

void __70__MRDestinationResolver_registerForEndpointChangesForOutputDeviceUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = a2;
    uint64_t v5 = [WeakRetained destination];
    int v6 = [v5 endpoint];
    uint64_t v7 = [v6 uniqueIdentifier];
    uint64_t v8 = [v4 uniqueIdentifier];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      __int16 v10 = _MRLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [WeakRetained destination];
        uint64_t v12 = [v11 endpoint];
        int v16 = 138413058;
        id v17 = WeakRetained;
        __int16 v18 = 2112;
        id v19 = WeakRetained;
        __int16 v20 = 2112;
        id v21 = v12;
        __int16 v22 = 2112;
        id v23 = v4;
        _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "%@ <%@> endpoint changed from %@ to %@", (uint8_t *)&v16, 0x2Au);
      }
      id v13 = [v4 outputDevices];
      id v14 = [v13 firstObject];
      id v15 = [v14 groupID];
      [WeakRetained setEndpointObserverGroupUID:v15];

      [WeakRetained handleEndpointChanged];
    }
  }
}

- (void)unregisterForEndpointChanges
{
  if ([(MRDestinationResolver *)self isDynamicEndpoint])
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0];
  }
  else
  {
    id v3 = [(MRDestinationResolver *)self endpointObserver];
    [v3 end];
  }

  [(MRDestinationResolver *)self setRegisteredForEndpointChanges:0];
}

- (void)onQueue_registerForEndpointInvalidations:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (![(MRDestinationResolver *)self registeredForEndpointInvalidations])
  {
    [(MRDestinationResolver *)self onQueue_setEndpoint:v5];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__handleEndpointDidDisconnectNotification_ name:@"MRAVEndpointDidDisconnectNotification" object:v5];

    [(MRDestinationResolver *)self setRegisteredForEndpointInvalidations:1];
  }
}

- (void)unregisterForEndpointInvalidations
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [(MRDestinationResolver *)self destination];
  id v5 = [v4 endpoint];
  [v3 removeObserver:self name:@"MRAVEndpointDidDisconnectNotification" object:v5];

  [(MRDestinationResolver *)self setRegisteredForEndpointInvalidations:0];
}

- (void)onQueue_registerForPlayerPathInvalidationsForUnresolvedPlayerPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (![(MRDestinationResolver *)self registeredForPlayerPathInvalidations])
  {
    [(MRDestinationResolver *)self onQueue_setUnresolvedPlayerPath:v4];
    objc_initWeak(&location, self);
    id v5 = [(MRDestinationResolver *)self dependencies];
    int v6 = [(MRDestination *)self->_destination playerPath];
    uint64_t v7 = [(MRDestinationResolver *)self serialQueue];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __91__MRDestinationResolver_onQueue_registerForPlayerPathInvalidationsForUnresolvedPlayerPath___block_invoke;
    uint64_t v12 = &unk_1E57D41C0;
    objc_copyWeak(&v13, &location);
    uint64_t v8 = [v5 addPlayerPathInvalidationHandler:v6 queue:v7 handler:&v9];
    -[MRDestinationResolver setPlayerPathInvalidationObserver:](self, "setPlayerPathInvalidationObserver:", v8, v9, v10, v11, v12);

    [(MRDestinationResolver *)self setRegisteredForPlayerPathInvalidations:1];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __91__MRDestinationResolver_onQueue_registerForPlayerPathInvalidationsForUnresolvedPlayerPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = _MRLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [WeakRetained[2] playerPath];
      int v7 = 138413058;
      uint64_t v8 = WeakRetained;
      __int16 v9 = 2112;
      uint64_t v10 = WeakRetained;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "%@ <%@> playerPath invalidated %@ -> %@", (uint8_t *)&v7, 0x2Au);
    }
    [WeakRetained handlePlayerPathInvalidatedWithPlayerPath:v3];
  }
}

- (void)unregisterForPlayerPathInvalidations
{
  id v3 = [(MRDestinationResolver *)self playerPathInvalidationObserver];

  if (v3)
  {
    id v4 = [(MRDestinationResolver *)self dependencies];
    id v5 = [(MRDestinationResolver *)self playerPathInvalidationObserver];
    [v4 removePlayerPathInvalidationHandler:v5];

    [(MRDestinationResolver *)self setPlayerPathInvalidationObserver:0];
  }

  [(MRDestinationResolver *)self setRegisteredForPlayerPathInvalidations:0];
}

- (void)handleEndpointChanged
{
  id v2 = [(MRDestinationResolver *)self serialQueue];
  msv_dispatch_async_on_queue();
}

uint64_t __46__MRDestinationResolver_handleEndpointChanged__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onQueue_clearStateForOutputDeviceUID");
  [*(id *)(a1 + 32) notifyDelegateOfInvalidation];
  id v2 = *(void **)(a1 + 32);

  return [v2 resolve];
}

- (void)handleEndpointInvalidated
{
  id v2 = [(MRDestinationResolver *)self serialQueue];
  msv_dispatch_async_on_queue();
}

uint64_t __50__MRDestinationResolver_handleEndpointInvalidated__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onQueue_clearStateForEndpoint");
  [*(id *)(a1 + 32) notifyDelegateOfInvalidation];
  id v2 = *(void **)(a1 + 32);

  return [v2 resolve];
}

- (void)handlePlayerPathInvalidatedWithPlayerPath:(id)a3
{
  id v3 = [(MRDestinationResolver *)self serialQueue];
  msv_dispatch_async_on_queue();
}

uint64_t __67__MRDestinationResolver_handlePlayerPathInvalidatedWithPlayerPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onQueue_clearStateForPlayerPath");
  [*(id *)(a1 + 32) notifyDelegateOfInvalidation];
  id v2 = *(void **)(a1 + 32);

  return [v2 resolve];
}

- (void)handleActiveSystemEndpointChangedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"kMRMediaRemoteActiveEndpointTypeUserInfoKey"];
  int v6 = [v5 intValue];

  if ([(MRDestinationResolver *)self isProactiveEndpoint] && v6 == 1
    || [(MRDestinationResolver *)self isUserSelectedEndpoint] && !v6)
  {
    int v7 = _MRLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      __int16 v9 = self;
      __int16 v10 = 2112;
      __int16 v11 = self;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "%@ <%@> Active system endpoint changed", (uint8_t *)&v8, 0x16u);
    }

    [(MRDestinationResolver *)self handleEndpointChanged];
  }
}

- (void)_handleEndpointDidDisconnectNotification:(id)a3
{
  id v4 = [a3 object];
  [(MRDestinationResolver *)self endpointDidDisconnect:v4];
}

- (void)endpointDidDisconnect:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MRDestinationResolver *)self destination];
  int v6 = [v5 endpoint];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    int v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412802;
      __int16 v10 = self;
      __int16 v11 = 2112;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "%@ <%@> endpoint invalidated %@", (uint8_t *)&v9, 0x20u);
    }

    [(MRDestinationResolver *)self handleEndpointInvalidated];
  }
}

- (void)notifyDelegateOfEndpointChange:(id)a3
{
  id v4 = (MRAVEndpoint *)a3;
  if (self->_delegateEndpoint != v4)
  {
    id v5 = [(MRDestinationResolver *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      int v7 = [(MRDestinationResolver *)self delegateQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __56__MRDestinationResolver_notifyDelegateOfEndpointChange___block_invoke;
      v9[3] = &unk_1E57D0790;
      v9[4] = self;
      __int16 v10 = v4;
      dispatch_async(v7, v9);
    }
  }
  delegateEndpoint = self->_delegateEndpoint;
  self->_delegateEndpoint = v4;
}

void __56__MRDestinationResolver_notifyDelegateOfEndpointChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 destinationResolver:*(void *)(a1 + 32) endpointDidChange:*(void *)(a1 + 40)];
}

- (void)notifyDelegateOfOriginChange:(id)a3
{
  id v4 = (MROrigin *)a3;
  id v5 = self->_delegateOrigin;
  if (v5 == v4)
  {
  }
  else
  {
    char v6 = v5;
    BOOL v7 = [(MROrigin *)v4 isEqual:v5];

    if (!v7)
    {
      int v8 = [(MRDestinationResolver *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        __int16 v10 = [(MRDestinationResolver *)self delegateQueue];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __54__MRDestinationResolver_notifyDelegateOfOriginChange___block_invoke;
        v12[3] = &unk_1E57D0790;
        v12[4] = self;
        __int16 v13 = v4;
        dispatch_async(v10, v12);
      }
    }
  }
  delegateOrigin = self->_delegateOrigin;
  self->_delegateOrigin = v4;
}

void __54__MRDestinationResolver_notifyDelegateOfOriginChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 destinationResolver:*(void *)(a1 + 32) originDidChange:*(void *)(a1 + 40)];
}

- (void)notifyDelegateOfPlayerPathChange:(id)a3
{
  id v4 = (MRPlayerPath *)a3;
  id v5 = self->_delegatePlayerPath;
  if (v5 == v4)
  {
  }
  else
  {
    char v6 = v5;
    BOOL v7 = [(MRPlayerPath *)v4 isEqual:v5];

    if (!v7)
    {
      int v8 = [(MRDestinationResolver *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        __int16 v10 = [(MRDestinationResolver *)self delegateQueue];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __58__MRDestinationResolver_notifyDelegateOfPlayerPathChange___block_invoke;
        v12[3] = &unk_1E57D0790;
        v12[4] = self;
        __int16 v13 = v4;
        dispatch_async(v10, v12);
      }
    }
  }
  delegatePlayerPath = self->_delegatePlayerPath;
  self->_delegatePlayerPath = v4;
}

void __58__MRDestinationResolver_notifyDelegateOfPlayerPathChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 destinationResolver:*(void *)(a1 + 32) playerPathDidChange:*(void *)(a1 + 40)];
}

- (void)notifyDelegateOfInvalidation
{
  id v3 = [(MRDestinationResolver *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MRDestinationResolver *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MRDestinationResolver_notifyDelegateOfInvalidation__block_invoke;
    block[3] = &unk_1E57D0518;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

void __53__MRDestinationResolver_notifyDelegateOfInvalidation__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 destinationResolverDestinationDidInvalidate:*(void *)(a1 + 32)];
}

- (void)notifyDelegateOfError:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDestinationResolver *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(MRDestinationResolver *)self delegateQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__MRDestinationResolver_notifyDelegateOfError___block_invoke;
    v8[3] = &unk_1E57D0790;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

void __47__MRDestinationResolver_notifyDelegateOfError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 destinationResolver:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)onQueue_clearStateForOutputDeviceUID
{
  id v3 = [(MRDestinationResolver *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  reconRetryTimer = self->_reconRetryTimer;
  self->_reconRetryTimer = 0;

  [(MRDestinationResolver *)self unregisterForEndpointChanges];

  [(MRDestinationResolver *)self onQueue_clearStateForEndpoint];
}

- (void)onQueue_clearStateForEndpoint
{
  id v3 = [(MRDestinationResolver *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  resolvingEndpoint = self->_resolvingEndpoint;
  self->_resolvingEndpoint = 0;

  connectionRetryTimer = self->_connectionRetryTimer;
  self->_connectionRetryTimer = 0;

  [(MRDestinationResolver *)self unregisterForEndpointInvalidations];
  [(MRDestinationResolver *)self unregisterForPlayerPathInvalidations];
  [(MRDestinationResolver *)self onQueue_setEndpoint:0];

  [(MRDestinationResolver *)self onQueue_clearStateForPlayerPath];
}

- (void)onQueue_clearStateForPlayerPath
{
  id v3 = [(MRDestinationResolver *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  resolvingPlayerPath = self->_resolvingPlayerPath;
  self->_resolvingPlayerPath = 0;

  [(MRDestinationResolver *)self onQueue_setResolvedPlayerPath:0];
}

- (void)createPlayerPathForEndpoint:(id)a3 client:(id)a4 player:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [(MRDestinationResolver *)self dependencies];
  id v14 = [(MRDestinationResolver *)self serialQueue];
  [v15 createPlayerPathForEndpoint:v13 client:v12 player:v11 queue:v14 completion:v10];
}

- (void)resolvePlayerPath:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(MRDestinationResolver *)self dependencies];
  int v8 = [(MRDestinationResolver *)self serialQueue];
  [v9 resolvePlayerPath:v7 queue:v8 completion:v6];
}

- (void)onQueue_retrieveEndpointForUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(MRDestinationResolver *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  id v11 = [(MRDestinationResolver *)self dependencies];
  id v9 = [(MRDestinationResolver *)self endpointObserverGroupUID];
  id v10 = [(MRDestinationResolver *)self serialQueue];
  [v11 retrieveEndpointForUID:v7 endpointGroupUID:v9 queue:v10 completion:v6];
}

- (void)onQueue_retrieveEndpointForContextUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(MRDestinationResolver *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  id v10 = [(MRDestinationResolver *)self dependencies];
  id v9 = [(MRDestinationResolver *)self serialQueue];
  [v10 retrieveEndpointForContextUID:v7 queue:v9 completion:v6];
}

- (BOOL)isProactiveEndpoint
{
  id v2 = [(MRDestinationResolver *)self destination];
  id v3 = [v2 outputDeviceUID];
  char v4 = [v3 isEqualToString:@"proactiveEndpoint"];

  return v4;
}

- (BOOL)isUserSelectedEndpoint
{
  id v2 = [(MRDestinationResolver *)self destination];
  id v3 = [v2 outputDeviceUID];
  char v4 = [v3 isEqualToString:@"userSelectedEndpoint"];

  return v4;
}

- (BOOL)isDynamicEndpoint
{
  if ([(MRDestinationResolver *)self isProactiveEndpoint]) {
    return 1;
  }

  return [(MRDestinationResolver *)self isUserSelectedEndpoint];
}

- (MRDestinationResolverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDestinationResolverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (MRDestinationResolverDependencies)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
}

- (BOOL)resolving
{
  return self->_resolving;
}

- (void)setResolving:(BOOL)a3
{
  self->_resolving = a3;
}

- (BOOL)registeredForNotifications
{
  return self->_registeredForNotifications;
}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  self->_registeredForNotifications = a3;
}

- (BOOL)registeredForEndpointChanges
{
  return self->_registeredForEndpointChanges;
}

- (void)setRegisteredForEndpointChanges:(BOOL)a3
{
  self->_registeredForEndpointChanges = a3;
}

- (BOOL)registeredForEndpointInvalidations
{
  return self->_registeredForEndpointInvalidations;
}

- (void)setRegisteredForEndpointInvalidations:(BOOL)a3
{
  self->_registeredForEndpointInvalidations = a3;
}

- (BOOL)registeredForPlayerPathInvalidations
{
  return self->_registeredForPlayerPathInvalidations;
}

- (void)setRegisteredForPlayerPathInvalidations:(BOOL)a3
{
  self->_registeredForPlayerPathInvalidations = a3;
}

- (id)playerPathInvalidationObserver
{
  return self->_playerPathInvalidationObserver;
}

- (void)setPlayerPathInvalidationObserver:(id)a3
{
}

- (void)setEndpointObserver:(id)a3
{
}

- (NSString)endpointObserverGroupUID
{
  return self->_endpointObserverGroupUID;
}

- (void)setEndpointObserverGroupUID:(id)a3
{
}

- (MRDestination)originalDestination
{
  return self->_originalDestination;
}

- (void)setOriginalDestination:(id)a3
{
}

- (MRAVEndpoint)delegateEndpoint
{
  return self->_delegateEndpoint;
}

- (void)setDelegateEndpoint:(id)a3
{
}

- (MROrigin)delegateOrigin
{
  return self->_delegateOrigin;
}

- (void)setDelegateOrigin:(id)a3
{
}

- (MRPlayerPath)delegatePlayerPath
{
  return self->_delegatePlayerPath;
}

- (void)setDelegatePlayerPath:(id)a3
{
}

- (MRAVEndpoint)resolvingEndpoint
{
  return self->_resolvingEndpoint;
}

- (void)setResolvingEndpoint:(id)a3
{
}

- (MRPlayerPath)resolvingPlayerPath
{
  return self->_resolvingPlayerPath;
}

- (void)setResolvingPlayerPath:(id)a3
{
}

- (MSVVariableIntervalTimer)reconRetryTimer
{
  return self->_reconRetryTimer;
}

- (void)setReconRetryTimer:(id)a3
{
}

- (MSVVariableIntervalTimer)connectionRetryTimer
{
  return self->_connectionRetryTimer;
}

- (void)setConnectionRetryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionRetryTimer, 0);
  objc_storeStrong((id *)&self->_reconRetryTimer, 0);
  objc_storeStrong((id *)&self->_resolvingPlayerPath, 0);
  objc_storeStrong((id *)&self->_resolvingEndpoint, 0);
  objc_storeStrong((id *)&self->_delegatePlayerPath, 0);
  objc_storeStrong((id *)&self->_delegateOrigin, 0);
  objc_storeStrong((id *)&self->_delegateEndpoint, 0);
  objc_storeStrong((id *)&self->_originalDestination, 0);
  objc_storeStrong((id *)&self->_endpointObserverGroupUID, 0);
  objc_storeStrong((id *)&self->_endpointObserver, 0);
  objc_storeStrong(&self->_playerPathInvalidationObserver, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_destination, 0);
}

- (void)handleEndpointResolution:(os_log_t)log client:player:source:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "%@ <%@> Error resolving for outputDeviceUID %@", (uint8_t *)&v3, 0x20u);
}

@end