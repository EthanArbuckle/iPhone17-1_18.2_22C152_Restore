@interface TUNeighborhoodActivityConduit
+ (BOOL)isConduitAvailable;
- (BOOL)_shouldReconnect;
- (BOOL)canPullBackConversation:(id)a3;
- (BOOL)isRingingFaceTimeCallsOnConnectedTVDevice;
- (NSDictionary)nearbyTVDevices;
- (NSMapTable)delegates;
- (NSMutableSet)nearbyTVs;
- (NSSet)nearbyTVDeviceHandles;
- (TUConduitLifecycleController)conduitLifecycleController;
- (TUConversationManager)conversationManager;
- (TUNearbyDeviceHandle)activeSplitSessionTV;
- (TUNearbySuggestion)suggestion;
- (TUNeighborhoodActivityConduit)initWithConversationManager:(id)a3;
- (TUNeighborhoodActivityConduit)initWithConversationManager:(id)a3 xpcClient:(id)a4;
- (TUNeighborhoodActivityConduitApprovalDelegate)approvalDelegate;
- (TUNeighborhoodActivityConduitXPCClient)xpcClient;
- (id)_findConversationForUUID:(id)a3;
- (id)_osStateDictionary;
- (unint64_t)stateHandle;
- (void)_forEachDelegate:(id)a3;
- (void)_requestInitialState;
- (void)addDelegate:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)approveSplitSessionForConversation:(id)a3 device:(id)a4 pullContext:(int64_t)a5 completion:(id)a6;
- (void)cancelSplitSessionApproval;
- (void)connectionEstablishedForClient:(id)a3;
- (void)connectionLostForClient:(id)a3;
- (void)continuityCameraDidConnect;
- (void)dealloc;
- (void)disconnectTVDevice:(id)a3 completion:(id)a4;
- (void)handoffConversation:(id)a3 toTVDevice:(id)a4 completion:(id)a5;
- (void)inviteTVDevice:(id)a3 toConversation:(id)a4 completion:(id)a5;
- (void)isRingingFaceTimeCallsOnConnectedTVDeviceChanged:(BOOL)a3;
- (void)pullConversation:(id)a3 fromTVDevice:(id)a4 completion:(id)a5;
- (void)removeDelegate:(id)a3;
- (void)respondToSuggestionWithResult:(id)a3 completion:(id)a4;
- (void)setActiveSplitSessionTV:(id)a3;
- (void)setApprovalDelegate:(id)a3;
- (void)setConduitLifecycleController:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setIsRingingFaceTimeCallsOnConnectedTVDevice:(BOOL)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setSuggestedTVDeviceName:(id)a3 completion:(id)a4;
- (void)setSuggestion:(id)a3;
- (void)splitSessionUpdated:(id)a3;
- (void)startConversationWith:(id)a3 on:(id)a4 completion:(id)a5;
- (void)suggestionUpdated:(id)a3;
- (void)tvDeviceAppeared:(id)a3;
- (void)tvDeviceDisappeared:(id)a3;
@end

@implementation TUNeighborhoodActivityConduit

- (TUNeighborhoodActivityConduit)initWithConversationManager:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(TUNeighborhoodActivityConduitXPCClient);
  v6 = [(TUNeighborhoodActivityConduit *)self initWithConversationManager:v4 xpcClient:v5];

  return v6;
}

- (TUNeighborhoodActivityConduit)initWithConversationManager:(id)a3 xpcClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TUNeighborhoodActivityConduit;
  v9 = [(TUNeighborhoodActivityConduit *)&v20 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    nearbyTVs = v9->_nearbyTVs;
    v9->_nearbyTVs = (NSMutableSet *)v10;

    objc_storeStrong((id *)&v9->_xpcClient, a4);
    [(TUNeighborhoodActivityConduitXPCClient *)v9->_xpcClient setDelegate:v9];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    delegates = v9->_delegates;
    v9->_delegates = (NSMapTable *)v12;

    objc_storeStrong((id *)&v9->_conversationManager, a3);
    [(TUNeighborhoodActivityConduitXPCClient *)v9->_xpcClient ensureConnection];
    objc_initWeak(&location, v9);
    v14 = dispatch_get_global_queue(0, 0);
    objc_copyWeak(&v18, &location);
    v17 = v9;
    v17->_stateHandle = os_state_add_handler();

    v15 = v17;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

char *__71__TUNeighborhoodActivityConduit_initWithConversationManager_xpcClient___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F397B80]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = (void *)MEMORY[0x1E4F28F98];
    v5 = [*(id *)(a1 + 32) _osStateDictionary];
    id v16 = 0;
    v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:&v16];
    id v7 = v16;

    if (!v6)
    {
      id v8 = dispatch_get_global_queue(0, 0);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __71__TUNeighborhoodActivityConduit_initWithConversationManager_xpcClient___block_invoke_2;
      v14 = &unk_1E58E5BE0;
      id v15 = v7;
      dispatch_async(v8, &v11);
    }
  }
  else
  {
    v6 = 0;
  }
  v9 = (char *)malloc_type_malloc(objc_msgSend(v6, "length", v11, v12, v13, v14) + 200, 0xD0E4147BuLL);
  *(_DWORD *)v9 = 1;
  strcpy(v9 + 136, "TUNeighborhoodActivityConduit");
  *((_DWORD *)v9 + 1) = [v6 length];
  objc_msgSend(v6, "getBytes:length:", v9 + 200, objc_msgSend(v6, "length"));

  return v9;
}

void __71__TUNeighborhoodActivityConduit_initWithConversationManager_xpcClient___block_invoke_2(uint64_t a1)
{
  v2 = TUConduitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__TUNeighborhoodActivityConduit_initWithConversationManager_xpcClient___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "Deallocating TUNeighborhoodActivityConduit", v2, v3, v4, v5, v6);
}

+ (BOOL)isConduitAvailable
{
  if (isConduitAvailable_onceToken != -1) {
    dispatch_once(&isConduitAvailable_onceToken, &__block_literal_global_19);
  }
  return isConduitAvailable_sIsConduitAvailable;
}

void __51__TUNeighborhoodActivityConduit_isConduitAvailable__block_invoke()
{
  v0 = (const void *)MGGetStringAnswer();
  BOOL v1 = CFEqual(v0, @"AudioAccessory") == 0;
  CFRelease(v0);
  isConduitAvailable_sIsConduitAvailable = v1;
}

- (id)_osStateDictionary
{
  if (_osStateDictionary_onceToken != -1) {
    dispatch_once(&_osStateDictionary_onceToken, &__block_literal_global_201);
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:_osStateDictionary___keyset];
  uint64_t v4 = (void *)[(NSMutableSet *)self->_nearbyTVs copy];
  uint64_t v5 = [v4 valueForKey:@"plistRepresentation"];
  uint8_t v6 = [v5 allObjects];
  [v3 setObject:v6 forKeyedSubscript:@"nearbyTVs"];

  activeSplitSessionTV = self->_activeSplitSessionTV;
  if (activeSplitSessionTV)
  {
    uint64_t v8 = [(TUNearbyDeviceHandle *)activeSplitSessionTV plistRepresentation];
    [v3 setObject:v8 forKeyedSubscript:@"currentSplitSessionTV"];
  }
  suggestion = self->_suggestion;
  if (suggestion)
  {
    uint64_t v10 = [(TUNearbySuggestion *)suggestion description];
    [v3 setObject:v10 forKeyedSubscript:@"suggestion"];
  }
  uint64_t v11 = [(TUNeighborhoodActivityConduit *)self approvalDelegate];
  uint64_t v12 = v11;
  if (v11)
  {
    v13 = [v11 description];
    [v3 setObject:v13 forKeyedSubscript:@"approvalDelegate"];
  }

  return v3;
}

uint64_t __51__TUNeighborhoodActivityConduit__osStateDictionary__block_invoke()
{
  _osStateDictionary___keyset = [MEMORY[0x1E4F1CA60] sharedKeySetForKeys:&unk_1EED245B8];

  return MEMORY[0x1F41817F8]();
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  v9 = TUConduitLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    -[TUNeighborhoodActivityConduit addDelegate:queue:](v11, v12, v9);
  }

  [(NSMapTable *)v8->_delegates setObject:v7 forKey:v6];
  objc_sync_exit(v8);
}

- (void)addDelegate:(id)a3
{
  uint64_t v4 = addDelegate__onceToken;
  id v5 = a3;
  id v7 = v5;
  if (v4 == -1)
  {
    id v6 = v5;
  }
  else
  {
    dispatch_once(&addDelegate__onceToken, &__block_literal_global_219);
    id v6 = v7;
  }
  [(TUNeighborhoodActivityConduit *)self addDelegate:v6 queue:addDelegate__defaultQueue];
}

uint64_t __45__TUNeighborhoodActivityConduit_addDelegate___block_invoke()
{
  addDelegate__defaultQueue = (uint64_t)dispatch_queue_create("com.apple.faceTime.neighborhoodActivityConduit.defaultQueue", 0);

  return MEMORY[0x1F41817F8]();
}

- (void)removeDelegate:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = TUConduitLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    [(TUNeighborhoodActivityConduit *)v8 removeDelegate:v6];
  }

  [(NSMapTable *)v5->_delegates removeObjectForKey:v4];
  objc_sync_exit(v5);
}

- (void)setApprovalDelegate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUConduitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Setting approval delegate: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  objc_storeWeak((id *)&self->_approvalDelegate, v4);
  uint64_t v8 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  [v8 registerApprovalClientEnabled:v4 != 0];
}

- (void)setActiveSplitSessionTV:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = TUConduitLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    activeSplitSessionTV = self->_activeSplitSessionTV;
    int v8 = 138412546;
    int v9 = activeSplitSessionTV;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Setting activeSplitSessionTV: oldValue: %@, newValue: %@", (uint8_t *)&v8, 0x16u);
  }

  if (![(TUNearbyDeviceHandle *)self->_activeSplitSessionTV isEqual:v5])
  {
    [(TUNeighborhoodActivityConduit *)self willChangeValueForKey:@"activeSplitSessionTV"];
    objc_storeStrong((id *)&self->_activeSplitSessionTV, a3);
    [(TUNeighborhoodActivityConduit *)self didChangeValueForKey:@"activeSplitSessionTV"];
  }
}

- (void)setSuggestion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = TUConduitLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    suggestion = self->_suggestion;
    int v8 = 138412546;
    int v9 = suggestion;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Setting suggestion: oldValue: %@, newValue: %@", (uint8_t *)&v8, 0x16u);
  }

  if (![(TUNearbySuggestion *)self->_suggestion isEqual:v5])
  {
    [(TUNeighborhoodActivityConduit *)self willChangeValueForKey:@"suggestion"];
    objc_storeStrong((id *)&self->_suggestion, a3);
    [(TUNeighborhoodActivityConduit *)self didChangeValueForKey:@"suggestion"];
  }
}

- (void)setSuggestedTVDeviceName:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = TUConduitLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Called to force suggested tv device name banner: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  int v9 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__TUNeighborhoodActivityConduit_setSuggestedTVDeviceName_completion___block_invoke;
  v11[3] = &unk_1E58E6BF0;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v7;
  id v12 = v10;
  [v9 setSuggestedTVDeviceName:v6 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __69__TUNeighborhoodActivityConduit_setSuggestedTVDeviceName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7) {
      [WeakRetained setSuggestion:v7];
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_requestInitialState
{
  uint64_t v3 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke;
  v12[3] = &unk_1E58E6C40;
  v12[4] = self;
  [v3 nearbyTVDevicesWithCompletion:v12];

  id v4 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2;
  v11[3] = &unk_1E58E6C90;
  void v11[4] = self;
  [v4 activeSplitSessionTVDeviceWithCompletion:v11];

  id v5 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_230;
  v10[3] = &unk_1E58E6CB8;
  v10[4] = self;
  [v5 suggestionWithCompletion:v10];

  id v6 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_234;
  v9[3] = &unk_1E58E6CE0;
  v9[4] = self;
  [v6 isRingingFaceTimeCallsOnConnectedTVDeviceWithCompletion:v9];

  id v7 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  int v8 = [(TUNeighborhoodActivityConduit *)self approvalDelegate];
  [v7 registerApprovalClientEnabled:v8 != 0];
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = TUConduitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_cold_1();
    }
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) nearbyTVs];
    int v9 = (void *)[v8 mutableCopy];

    id v10 = (void *)[v5 mutableCopy];
    [v9 minusSet:v5];
    id v11 = [*(id *)(a1 + 32) nearbyTVs];
    [v10 minusSet:v11];

    id v12 = [*(id *)(a1 + 32) nearbyTVs];
    [v12 unionSet:v5];

    id v13 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_225;
    v15[3] = &unk_1E58E6C18;
    id v16 = v9;
    v17 = v13;
    id v18 = v10;
    id v14 = v10;
    id v7 = v9;
    [v13 _forEachDelegate:v15];
  }
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_225(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 neighborhoodActivityConduit:*(void *)(a1 + 40) tvDeviceDisappeared:*(void *)(*((void *)&v18 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v3, "neighborhoodActivityConduit:tvDeviceAppeared:", *(void *)(a1 + 40), *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = TUConduitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setActiveSplitSessionTV:v5];
    if (v5)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_228;
      v9[3] = &unk_1E58E6C68;
      v9[4] = v8;
      id v10 = v5;
      [v8 _forEachDelegate:v9];
    }
  }
}

uint64_t __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_228(uint64_t a1, void *a2)
{
  return [a2 neighborhoodActivityConduit:*(void *)(a1 + 32) splitSessionStarted:*(void *)(a1 + 40)];
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_230(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = TUConduitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_230_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setSuggestion:v5];
    if (v5)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_231;
      v9[3] = &unk_1E58E6C68;
      v9[4] = v8;
      id v10 = v5;
      [v8 _forEachDelegate:v9];
    }
  }
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_231(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 neighborhoodActivityConduit:*(void *)(a1 + 32) suggestionUpdated:*(void *)(a1 + 40)];
  }
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_234(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = TUConduitLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_234_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = a2;
  }
}

- (void)_forEachDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(TUNeighborhoodActivityConduit *)v5 delegates];
  uint64_t v7 = [v6 keyEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = [(TUNeighborhoodActivityConduit *)v5 delegates];
        uint64_t v13 = [v12 objectForKey:v11];

        if (v13)
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __50__TUNeighborhoodActivityConduit__forEachDelegate___block_invoke;
          v15[3] = &unk_1E58E6760;
          id v14 = v4;
          void v15[4] = v11;
          id v16 = v14;
          dispatch_async(v13, v15);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  objc_sync_exit(v5);
}

uint64_t __50__TUNeighborhoodActivityConduit__forEachDelegate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_findConversationForUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(TUNeighborhoodActivityConduit *)self conversationManager];
    id v6 = [v5 activeConversations];

    id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v10 UUID];
          char v12 = [v11 isEqual:v4];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldReconnect
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(TUNeighborhoodActivityConduit *)self conduitLifecycleController];

  if (v3)
  {
    id v4 = [(TUNeighborhoodActivityConduit *)self conduitLifecycleController];
    LODWORD(v3) = [v4 shouldKeepConduitAlive];

    id v5 = TUConduitLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Process does initialize conduitLifeCycleController, are we keeping NAC alive? %d", (uint8_t *)v7, 8u);
    }
  }
  else
  {
    id v5 = TUConduitLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Process does not initialize conduitLifecycleController, deferring to processes that do", (uint8_t *)v7, 2u);
      LOBYTE(v3) = 0;
    }
  }

  return (char)v3;
}

- (NSSet)nearbyTVDeviceHandles
{
  id v3 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  [v3 ensureConnection];

  id v4 = [(TUNeighborhoodActivityConduit *)self nearbyTVs];
  id v5 = (void *)[v4 copy];

  return (NSSet *)v5;
}

- (NSDictionary)nearbyTVDevices
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v4 = [(TUNeighborhoodActivityConduit *)self nearbyTVs];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(TUNeighborhoodActivityConduit *)self nearbyTVs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v12 = [v11 knownIdentifiersByHandleType];
        uint64_t v13 = [v12 objectForKey:&unk_1EED24120];

        if (v13) {
          [v5 setObject:v11 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];

  return (NSDictionary *)v14;
}

- (BOOL)isRingingFaceTimeCallsOnConnectedTVDevice
{
  id v3 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  [v3 ensureConnection];

  return self->_isRingingFaceTimeCallsOnConnectedTVDevice;
}

- (BOOL)canPullBackConversation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mergedRemoteMembers];
  unint64_t v5 = [v4 count];

  id v6 = [v3 mergedActiveRemoteParticipants];
  uint64_t v7 = [v6 count];

  if (v3 && [v3 isContinuitySession])
  {
    uint64_t v8 = [v3 state];
    BOOL v11 = (v5 > 1 || v7 != 0) && v8 == 3;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)inviteTVDevice:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  [v11 inviteTVDevice:v10 toConversationWithUUID:v9 completion:v8];
}

- (void)disconnectTVDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  [v8 disconnectTVDevice:v7 completion:v6];
}

- (void)respondToSuggestionWithResult:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  [v8 respondToSuggestionWithResult:v7 completion:v6];
}

- (void)handoffConversation:(id)a3 toTVDevice:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  [v11 handoffConversation:v10 toTVDevice:v9 completion:v8];
}

- (void)pullConversation:(id)a3 fromTVDevice:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = [(TUNeighborhoodActivityConduit *)self _findConversationForUUID:v12];
  if (v10 && [(TUNeighborhoodActivityConduit *)self canPullBackConversation:v10])
  {
    id v11 = [(TUNeighborhoodActivityConduit *)self xpcClient];
    [v11 pullConversation:v12 fromTVDevice:v8 completion:v9];
  }
  else
  {
    id v11 = TUMakeNeighborhoodConduitError(11, 0);
    v9[2](v9, 0, v11);
  }
}

- (void)startConversationWith:(id)a3 on:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  [v11 startConversationWith:v10 on:v9 completion:v8];
}

- (void)connectionEstablishedForClient:(id)a3
{
  id v4 = TUConduitLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[TUNeighborhoodActivityConduit connectionEstablishedForClient:]();
  }

  [(TUNeighborhoodActivityConduit *)self _requestInitialState];
}

- (void)connectionLostForClient:(id)a3
{
  id v4 = a3;
  unint64_t v5 = TUConduitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TUNeighborhoodActivityConduit connectionLostForClient:]();
  }

  self->_isRingingFaceTimeCallsOnConnectedTVDevice = 0;
  id v6 = [MEMORY[0x1E4F4F7F8] processHandle];
  int v7 = [v6 hasEntitlement:@"com.apple.NeighborhoodActivityConduitService"];

  if (v7 && [(TUNeighborhoodActivityConduit *)self _shouldReconnect]) {
    [v4 ensureConnection];
  }
}

- (void)tvDeviceAppeared:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUNeighborhoodActivityConduit *)self nearbyTVs];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__TUNeighborhoodActivityConduit_tvDeviceAppeared___block_invoke;
  v13[3] = &unk_1E58E6D08;
  id v6 = v4;
  id v14 = v6;
  int v7 = objc_msgSend(v5, "bs_filter:", v13);

  id v8 = [(TUNeighborhoodActivityConduit *)self nearbyTVs];
  [v8 minusSet:v7];

  id v9 = [(TUNeighborhoodActivityConduit *)self nearbyTVs];
  [v9 addObject:v6];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__TUNeighborhoodActivityConduit_tvDeviceAppeared___block_invoke_2;
  v11[3] = &unk_1E58E6C68;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(TUNeighborhoodActivityConduit *)self _forEachDelegate:v11];
}

uint64_t __50__TUNeighborhoodActivityConduit_tvDeviceAppeared___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEquivalentToDeviceHandle:*(void *)(a1 + 32)];
}

uint64_t __50__TUNeighborhoodActivityConduit_tvDeviceAppeared___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 neighborhoodActivityConduit:*(void *)(a1 + 32) tvDeviceAppeared:*(void *)(a1 + 40)];
}

- (void)tvDeviceDisappeared:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUNeighborhoodActivityConduit *)self nearbyTVs];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__TUNeighborhoodActivityConduit_tvDeviceDisappeared___block_invoke;
  v12[3] = &unk_1E58E6D08;
  id v6 = v4;
  id v13 = v6;
  int v7 = objc_msgSend(v5, "bs_filter:", v12);

  id v8 = [(TUNeighborhoodActivityConduit *)self nearbyTVs];
  [v8 minusSet:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__TUNeighborhoodActivityConduit_tvDeviceDisappeared___block_invoke_2;
  v10[3] = &unk_1E58E6C68;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(TUNeighborhoodActivityConduit *)self _forEachDelegate:v10];
}

uint64_t __53__TUNeighborhoodActivityConduit_tvDeviceDisappeared___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEquivalentToDeviceHandle:*(void *)(a1 + 32)];
}

uint64_t __53__TUNeighborhoodActivityConduit_tvDeviceDisappeared___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 neighborhoodActivityConduit:*(void *)(a1 + 32) tvDeviceDisappeared:*(void *)(a1 + 40)];
}

- (void)splitSessionUpdated:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUNeighborhoodActivityConduit *)self activeSplitSessionTV];
  [(TUNeighborhoodActivityConduit *)self setActiveSplitSessionTV:v4];
  if (v5 && ([v5 isEqual:v4] & 1) == 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__TUNeighborhoodActivityConduit_splitSessionUpdated___block_invoke;
    v8[3] = &unk_1E58E6C68;
    v8[4] = self;
    id v9 = v5;
    [(TUNeighborhoodActivityConduit *)self _forEachDelegate:v8];
  }
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__TUNeighborhoodActivityConduit_splitSessionUpdated___block_invoke_2;
    v6[3] = &unk_1E58E6C68;
    v6[4] = self;
    id v7 = v4;
    [(TUNeighborhoodActivityConduit *)self _forEachDelegate:v6];
  }
}

uint64_t __53__TUNeighborhoodActivityConduit_splitSessionUpdated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 neighborhoodActivityConduit:*(void *)(a1 + 32) splitSessionEnded:*(void *)(a1 + 40)];
}

uint64_t __53__TUNeighborhoodActivityConduit_splitSessionUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 neighborhoodActivityConduit:*(void *)(a1 + 32) splitSessionStarted:*(void *)(a1 + 40)];
}

- (void)suggestionUpdated:(id)a3
{
  id v4 = a3;
  [(TUNeighborhoodActivityConduit *)self setSuggestion:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__TUNeighborhoodActivityConduit_suggestionUpdated___block_invoke;
  v6[3] = &unk_1E58E6C68;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TUNeighborhoodActivityConduit *)self _forEachDelegate:v6];
}

void __51__TUNeighborhoodActivityConduit_suggestionUpdated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 neighborhoodActivityConduit:*(void *)(a1 + 32) suggestionUpdated:*(void *)(a1 + 40)];
  }
}

- (void)isRingingFaceTimeCallsOnConnectedTVDeviceChanged:(BOOL)a3
{
  self->_isRingingFaceTimeCallsOnConnectedTVDevice = a3;
}

- (void)approveSplitSessionForConversation:(id)a3 device:(id)a4 pullContext:(int64_t)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, id))a6;
  id v13 = [(TUNeighborhoodActivityConduit *)self approvalDelegate];
  if (!v13)
  {
    v26 = TUConduitLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[TUNeighborhoodActivityConduit approveSplitSessionForConversation:device:pullContext:completion:]();
    }

    uint64_t v25 = 8;
LABEL_19:
    TUMakeNeighborhoodConduitError(v25, 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v23);
    goto LABEL_20;
  }
  int64_t v27 = a5;
  id v28 = v11;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = [(TUNeighborhoodActivityConduit *)self conversationManager];
  long long v15 = [v14 activeConversations];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v16)
  {
LABEL_10:

LABEL_13:
    uint64_t v24 = TUConduitLog();
    id v11 = v28;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[TUNeighborhoodActivityConduit approveSplitSessionForConversation:device:pullContext:completion:]();
    }

    uint64_t v25 = 2;
    goto LABEL_19;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v30;
LABEL_4:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v30 != v18) {
      objc_enumerationMutation(v15);
    }
    long long v20 = *(void **)(*((void *)&v29 + 1) + 8 * v19);
    uint64_t v21 = [v20 UUID];
    char v22 = [v21 isEqual:v10];

    if (v22) {
      break;
    }
    if (v17 == ++v19)
    {
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v23 = v20;

  if (!v23) {
    goto LABEL_13;
  }
  id v11 = v28;
  [v13 approveSplitSessionForConversation:v23 requestedFromDevice:v28 pullContext:v27 completion:v12];
LABEL_20:
}

- (void)cancelSplitSessionApproval
{
  id v2 = [(TUNeighborhoodActivityConduit *)self approvalDelegate];
  [v2 cancelSplitSessionApproval];
}

- (void)continuityCameraDidConnect
{
  id v2 = [(TUNeighborhoodActivityConduit *)self xpcClient];
  [v2 ensureConnection];
}

- (TUNeighborhoodActivityConduitApprovalDelegate)approvalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_approvalDelegate);

  return (TUNeighborhoodActivityConduitApprovalDelegate *)WeakRetained;
}

- (void)setIsRingingFaceTimeCallsOnConnectedTVDevice:(BOOL)a3
{
  self->_isRingingFaceTimeCallsOnConnectedTVDevice = a3;
}

- (TUNearbyDeviceHandle)activeSplitSessionTV
{
  return self->_activeSplitSessionTV;
}

- (TUNearbySuggestion)suggestion
{
  return self->_suggestion;
}

- (NSMapTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (NSMutableSet)nearbyTVs
{
  return self->_nearbyTVs;
}

- (TUNeighborhoodActivityConduitXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (TUConduitLifecycleController)conduitLifecycleController
{
  return self->_conduitLifecycleController;
}

- (void)setConduitLifecycleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conduitLifecycleController, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_nearbyTVs, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_activeSplitSessionTV, 0);

  objc_destroyWeak((id *)&self->_approvalDelegate);
}

void __71__TUNeighborhoodActivityConduit_initWithConversationManager_xpcClient___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addDelegate:(os_log_t)log queue:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_19C496000, log, OS_LOG_TYPE_DEBUG, "Conduit delegate added: %{public}@", buf, 0xCu);
}

- (void)removeDelegate:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_19C496000, log, OS_LOG_TYPE_DEBUG, "Conduit delegate removed: %{public}@", buf, 0xCu);
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Failed to get initial state for nearby TVs: %@", v2, v3, v4, v5, v6);
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Failed to get initial state for active split session TV: %@", v2, v3, v4, v5, v6);
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_230_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Failed to get initial state for suggested TV: %@", v2, v3, v4, v5, v6);
}

void __53__TUNeighborhoodActivityConduit__requestInitialState__block_invoke_2_234_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Failed to get initial state for ringing status: %@", v2, v3, v4, v5, v6);
}

- (void)connectionEstablishedForClient:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "TUConduit XPC connection established", v2, v3, v4, v5, v6);
}

- (void)connectionLostForClient:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_19C496000, v0, v1, "TUConduit XPC connection lost", v2, v3, v4, v5, v6);
}

- (void)approveSplitSessionForConversation:device:pullContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_19C496000, v0, OS_LOG_TYPE_ERROR, "No split session approval delegate installed", v1, 2u);
}

- (void)approveSplitSessionForConversation:device:pullContext:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_19C496000, v0, OS_LOG_TYPE_ERROR, "Cannot find conversation for approving split session", v1, 2u);
}

@end