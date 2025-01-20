@interface PKMessagesAppSharedContext
+ (id)sharedContext;
- (NSArray)bubbleAppControllers;
- (NSString)description;
- (PKMessagesAppControllerInterface)primaryAppController;
- (PKMessagesAppSharedContext)init;
- (id)_directoryPath;
- (id)_sharedDirectoryPath;
- (id)_urlForMessageIdentifier:(id)a3;
- (id)externalizedControllerStateForMessageIdentifier:(id)a3;
- (void)_purgeOldCacheEntries;
- (void)_registerAppViewController:(id)a3;
- (void)_revealPrimaryAppController:(id)a3;
- (void)_withPrimaryAppController:(id)a3;
- (void)handlePaymentRequestMessage:(id)a3 sender:(id)a4 completion:(id)a5;
- (void)persistExternalizedControllerState:(id)a3 forMessageIdentifier:(id)a4;
- (void)removeExternalizedControllerStateDataForMessageIdentifier:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
@end

@implementation PKMessagesAppSharedContext

+ (id)sharedContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PKMessagesAppSharedContext_sharedContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_674 != -1) {
    dispatch_once(&_MergedGlobals_674, block);
  }
  v2 = (void *)qword_1EB545B98;

  return v2;
}

void __43__PKMessagesAppSharedContext_sharedContext__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB545B98;
  qword_1EB545B98 = (uint64_t)v1;
}

- (PKMessagesAppSharedContext)init
{
  v15.receiver = self;
  v15.super_class = (Class)PKMessagesAppSharedContext;
  v2 = [(PKMessagesAppSharedContext *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    weakBubbleAppControllers = v2->_weakBubbleAppControllers;
    v2->_weakBubbleAppControllers = (NSPointerArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    pendingPrimaryHandlers = v2->_pendingPrimaryHandlers;
    v2->_pendingPrimaryHandlers = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    externalizedControllerStateStore = v2->_externalizedControllerStateStore;
    v2->_externalizedControllerStateStore = (NSMutableDictionary *)v7;

    v9 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    paymentServiceDataProvider = v2->_paymentServiceDataProvider;
    v2->_paymentServiceDataProvider = v9;

    [(PKPaymentDefaultDataProvider *)v2->_paymentServiceDataProvider addDelegate:v2];
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__PKMessagesAppSharedContext_init__block_invoke;
    block[3] = &unk_1E59CA7D0;
    v14 = v2;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
  }
  return v2;
}

uint64_t __34__PKMessagesAppSharedContext_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeOldCacheEntries];
}

- (NSArray)bubbleAppControllers
{
  return [(NSPointerArray *)self->_weakBubbleAppControllers allObjects];
}

- (void)_registerAppViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 transactionSource];
  transactionSource = self->_transactionSource;
  self->_transactionSource = v5;

  uint64_t v7 = [v4 presentationStyle];
  v8 = PKLogFacilityTypeGetObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == 2)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v4;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Registering Bubble App Controller : %{public}@", buf, 0xCu);
    }

    [(NSPointerArray *)self->_weakBubbleAppControllers addPointer:v4];
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v4;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Registering Primary App Controller : %{public}@", buf, 0xCu);
    }

    objc_storeWeak((id *)&self->_primaryAppController, v4);
    v10 = (void *)[(NSMutableArray *)self->_pendingPrimaryHandlers copy];
    [(NSMutableArray *)self->_pendingPrimaryHandlers removeAllObjects];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__PKMessagesAppSharedContext__registerAppViewController___block_invoke;
    v12[3] = &unk_1E59CA870;
    id v13 = v4;
    id v14 = v10;
    id v11 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
}

void __57__PKMessagesAppSharedContext__registerAppViewController___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v4;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Processing %lu Primary App Controller Handlers.", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_revealPrimaryAppController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Attempting to reveal primary app controller.", buf, 2u);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Requesting presentation on sending controller.", v5, 2u);
  }

  [v3 requestPresentationStyle:0];
}

- (void)handlePaymentRequestMessage:(id)a3 sender:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(PKMessagesAppSharedContext *)self _revealPrimaryAppController:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PKMessagesAppSharedContext_handlePaymentRequestMessage_sender_completion___block_invoke;
  v12[3] = &unk_1E59CFD68;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(PKMessagesAppSharedContext *)self _withPrimaryAppController:v12];
}

uint64_t __76__PKMessagesAppSharedContext_handlePaymentRequestMessage_sender_completion___block_invoke(uint64_t a1, void *a2)
{
  [a2 _handlePaymentRequestMessage:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_withPrimaryAppController:(id)a3
{
  uint64_t v4 = (void (**)(void *, id))a3;
  if (v4)
  {
    aBlock = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryAppController);
    if (WeakRetained)
    {
      aBlock[2](aBlock, WeakRetained);
    }
    else
    {
      pendingPrimaryHandlers = self->_pendingPrimaryHandlers;
      uint64_t v7 = _Block_copy(aBlock);
      [(NSMutableArray *)pendingPrimaryHandlers addObject:v7];
    }
    uint64_t v4 = aBlock;
  }
}

- (void)persistExternalizedControllerState:(id)a3 forMessageIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    externalizedControllerStateStore = self->_externalizedControllerStateStore;
    id v7 = a4;
    id v8 = a3;
    [(NSMutableDictionary *)externalizedControllerStateStore setObject:v8 forKeyedSubscript:v7];
    id v9 = [(PKMessagesAppSharedContext *)self _urlForMessageIdentifier:v7];

    LOBYTE(externalizedControllerStateStore) = [v8 writeToURL:v9 atomically:1];
    if ((externalizedControllerStateStore & 1) == 0)
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        long long v12 = v9;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Failed to write externalized controller state archive to url: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (id)externalizedControllerStateForMessageIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_externalizedControllerStateStore objectForKeyedSubscript:v4];
    if (!v5)
    {
      uint64_t v6 = [(PKMessagesAppSharedContext *)self _urlForMessageIdentifier:v4];
      id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6];
      if (!v5)
      {
        id v7 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          id v10 = v6;
          _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Failed to read externalized controller state archive with url: %@", (uint8_t *)&v9, 0xCu);
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)removeExternalizedControllerStateDataForMessageIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    externalizedControllerStateStore = self->_externalizedControllerStateStore;
    id v5 = a3;
    [(NSMutableDictionary *)externalizedControllerStateStore setObject:0 forKeyedSubscript:v5];
    uint64_t v6 = [(PKMessagesAppSharedContext *)self _urlForMessageIdentifier:v5];

    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    LOBYTE(v5) = [v7 removeItemAtURL:v6 error:0];

    id v8 = PKLogFacilityTypeGetObject();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v9)
      {
        int v11 = 138412290;
        long long v12 = v6;
        id v10 = "PKMessagesAppSharedContext: Removed externalized controller state archive at url: %@";
LABEL_7:
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
      }
    }
    else if (v9)
    {
      int v11 = 138412290;
      long long v12 = v6;
      id v10 = "PKMessagesAppSharedContext: Failed to remove externalized controller state archive with url: %@";
      goto LABEL_7;
    }
  }
}

- (id)_directoryPath
{
  id v2 = PKCacheDirectoryPath();
  id v3 = [v2 stringByAppendingPathComponent:@"PeerPaymentControllerState"];

  return v3;
}

- (id)_sharedDirectoryPath
{
  id v2 = PKSharedCacheDirectoryPath();
  id v3 = [v2 stringByAppendingPathComponent:@"PeerPaymentControllerState"];

  return v3;
}

- (id)_urlForMessageIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKMessagesAppSharedContext *)self _sharedDirectoryPath];
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  char v7 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v8 = v15;

  if ((v7 & 1) == 0)
  {
    BOOL v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Failed to create externalized controller state directory with error: %@", buf, 0xCu);
    }
  }
  id v10 = [v4 UUIDString];
  int v11 = [v5 stringByAppendingPathComponent:v10];
  long long v12 = [v11 stringByAppendingPathExtension:@"archive"];

  uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];

  return v13;
}

- (void)_purgeOldCacheEntries
{
  id v3 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKMessagesAppSharedContext__purgeOldCacheEntries__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __51__PKMessagesAppSharedContext__purgeOldCacheEntries__block_invoke(uint64_t a1)
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  unsigned __int8 v47 = 0;
  id v3 = [*(id *)(a1 + 32) _directoryPath];
  int v4 = [v2 fileExistsAtPath:v3 isDirectory:&v47];
  int v5 = v47;

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    char v7 = (void *)MEMORY[0x1E4F1CB10];
    id v8 = [*(id *)(a1 + 32) _directoryPath];
    uint64_t v9 = [v7 fileURLWithPath:v8];

    uint64_t v10 = *MEMORY[0x1E4F1C628];
    uint64_t v11 = *MEMORY[0x1E4F1C540];
    v54[0] = *MEMORY[0x1E4F1C628];
    v54[1] = v11;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    uint64_t v13 = v2;
    v33 = (void *)v9;
    id v14 = [v2 enumeratorAtURL:v9 includingPropertiesForKeys:v12 options:0 errorHandler:&__block_literal_global_52];

    v34 = [MEMORY[0x1E4F1CA48] array];
    v35 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v42 = 0;
          [v20 getResourceValue:&v42 forKey:v10 error:0];
          id v21 = v42;
          id v41 = 0;
          [v20 getResourceValue:&v41 forKey:v11 error:0];
          id v22 = v41;
          if (([v21 BOOLValue] & 1) == 0 && objc_msgSend(v22, "compare:", v35) == -1) {
            [v34 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v17);
    }

    if ([v34 count])
    {
      v23 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v34 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v49 = v24;
        _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Purging %lu entries from the externalized controller state cache.", buf, 0xCu);
      }

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v25 = v34;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v52 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v38 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v37 + 1) + 8 * j);
            id v36 = 0;
            char v31 = [v13 removeItemAtURL:v30 error:&v36];
            id v32 = v36;
            if ((v31 & 1) == 0)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v49 = v30;
                __int16 v50 = 2112;
                id v51 = v32;
                _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Failed to remove externalized controller state archive at url: %@ with error: %@", buf, 0x16u);
              }
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v52 count:16];
        }
        while (v27);
      }
    }
    id v2 = v13;
  }
}

uint64_t __51__PKMessagesAppSharedContext__purgeOldCacheEntries__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = [v5 description];
      id v8 = [v4 absoluteString];
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Error: Failed to read directory contents: %@ at url: %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return 1;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryAppController);
  [v3 appendFormat:@"primaryAppController: %@ ", WeakRetained];

  id v5 = [(PKMessagesAppSharedContext *)self bubbleAppControllers];
  [v3 appendFormat:@"bubbleAppControllers: %@ ", v5];

  [v3 appendFormat:@"pendingPrimaryHandlers: %@", self->_pendingPrimaryHandlers];
  [v3 appendFormat:@"externalizedControllerStateStore: %@", self->_externalizedControllerStateStore];
  [v3 appendFormat:@">"];
  BOOL v6 = (void *)[v3 copy];

  return (NSString *)v6;
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  transactionSource = self->_transactionSource;
  if (transactionSource
    && ([(PKTransactionSource *)transactionSource transactionSourceIdentifiers],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 containsObject:v6],
        v9,
        (v10 & 1) != 0))
  {
    uint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v7;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Received updated transaction %@.", buf, 0xCu);
    }

    __int16 v12 = [(PKMessagesAppSharedContext *)self bubbleAppControllers];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) _handleUpdatedTransaction:v7 forTransactionSourceIdentifier:v6];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
  else
  {
    __int16 v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "PKMessagesAppSharedContext: Received updated transaction for non peer payment pass. Ignoring.", buf, 2u);
    }
  }
}

- (PKMessagesAppControllerInterface)primaryAppController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryAppController);

  return (PKMessagesAppControllerInterface *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryAppController);
  objc_storeStrong((id *)&self->_externalizedControllerStateStore, 0);
  objc_storeStrong((id *)&self->_transactionSource, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_pendingPrimaryHandlers, 0);

  objc_storeStrong((id *)&self->_weakBubbleAppControllers, 0);
}

@end