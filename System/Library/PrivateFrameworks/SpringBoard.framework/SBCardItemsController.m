@interface SBCardItemsController
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SBCardItemsController)init;
- (SBWalletNotificationSource)walletNotificationSource;
- (void)_activateCardItem:(id)a3 animated:(BOOL)a4;
- (void)_deactivateCardItem:(id)a3;
- (void)_updateCardItem:(id)a3;
- (void)_updateRestrictions;
- (void)_updateThumbnailForCardItem:(id)a3 withSnapshotter:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)getCardItemsForControllerWithIdentifier:(id)a3 withHandler:(id)a4;
- (void)setCardItems:(id)a3 forControllerWithIdentifier:(id)a4;
- (void)setWalletNotificationSource:(id)a3;
@end

@implementation SBCardItemsController

- (SBCardItemsController)init
{
  v13.receiver = self;
  v13.super_class = (Class)SBCardItemsController;
  v2 = [(SBCardItemsController *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cardItems = v2->_cardItems;
    v2->_cardItems = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.springboard.carditemscontroller"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    connections = v2->_connections;
    v2->_connections = v7;

    uint64_t v9 = [MEMORY[0x1E4F74230] sharedConnection];
    profileConnection = v2->_profileConnection;
    v2->_profileConnection = (MCProfileConnection *)v9;

    [(SBCardItemsController *)v2 _updateRestrictions];
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v2 selector:sel__updateRestrictions name:*MEMORY[0x1E4F73EC0] object:v2->_profileConnection];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_connections;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSXPCListener *)self->_listener invalidate];
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)SBCardItemsController;
  [(SBCardItemsController *)&v9 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = (NSXPCListener *)a3;
  id v7 = a4;
  listener = self->_listener;
  if (listener == v6)
  {
    objc_super v9 = SBCardItemsControllerClientInterface();
    [v7 setRemoteObjectInterface:v9];

    long long v10 = SBCardItemsControllerServerInterface();
    [v7 setExportedInterface:v10];

    [v7 setExportedObject:self];
    objc_initWeak(&location, v7);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke;
    v16[3] = &unk_1E6AFC630;
    v16[4] = self;
    objc_copyWeak(&v17, &location);
    [v7 setInterruptionHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_31;
    v14[3] = &unk_1E6AFC630;
    v14[4] = self;
    objc_copyWeak(&v15, &location);
    [v7 setInvalidationHandler:v14];
    uint64_t v11 = MEMORY[0x1E4F14428];
    id v12 = MEMORY[0x1E4F14428];
    [v7 _setQueue:v11];

    [v7 resume];
    [(NSMutableArray *)self->_connections addObject:v7];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return listener == v6;
}

void __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2);
  }

  v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 removeObject:WeakRetained];
}

void __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_31(uint64_t a1)
{
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_31_cold_1(v2);
  }

  v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 removeObject:WeakRetained];
}

- (void)setCardItems:(id)a3 forControllerWithIdentifier:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v38 = a4;
  id v7 = -[NSMutableDictionary objectForKey:](self->_cardItems, "objectForKey:");
  v8 = (void *)[v7 copy];

  v44 = v8;
  v45 = (void *)[v8 mutableCopy];
  v43 = [MEMORY[0x1E4F1CA60] dictionary];
  id v40 = objc_alloc_init(MEMORY[0x1E4F880E0]);
  objc_super v9 = SBLogWallet();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v59 = [v6 count];
    __int16 v60 = 2112;
    *(void *)v61 = v6;
    *(_WORD *)&v61[8] = 2112;
    v62 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Received set card items [%ld]: %@ from: %@", buf, 0x20u);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v41 = *(id *)v53;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(id *)v53 != v41) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v14 = [v13 identifier];
        id v15 = [v44 objectForKeyedSubscript:v14];
        v16 = v15;
        if (v15)
        {
          id v17 = self;
          int v18 = [v15 isEqual:v13];
          v19 = [v16 thumbnail];

          if (v19) {
            int v20 = v18;
          }
          else {
            int v20 = 0;
          }
          v21 = SBLogWallet();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138544130;
            uint64_t v59 = (uint64_t)v14;
            __int16 v60 = 1024;
            *(_DWORD *)v61 = v18 ^ 1;
            *(_WORD *)&v61[4] = 1024;
            *(_DWORD *)&v61[6] = v19 != 0;
            LOWORD(v62) = 1024;
            *(_DWORD *)((char *)&v62 + 2) = v20 ^ 1;
            _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_INFO, "Received card item %{public}@ [ didChange: %d existingCardHasThumbnail: %d ] %d", buf, 0x1Eu);
          }

          if (v20)
          {
            [v43 setObject:v16 forKeyedSubscript:v14];
            self = v17;
            goto LABEL_19;
          }
          [v43 setObject:v13 forKeyedSubscript:v14];
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __66__SBCardItemsController_setCardItems_forControllerWithIdentifier___block_invoke;
          v51[3] = &unk_1E6AF5290;
          self = v17;
          v51[4] = v17;
          v51[5] = v13;
          v22 = v51;
          v23 = v17;
        }
        else
        {
          [v43 setObject:v13 forKeyedSubscript:v14];
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __66__SBCardItemsController_setCardItems_forControllerWithIdentifier___block_invoke_2;
          v50[3] = &unk_1E6AF5290;
          v50[4] = self;
          v50[5] = v13;
          v22 = v50;
          v23 = self;
        }
        [(SBCardItemsController *)v23 _updateThumbnailForCardItem:v13 withSnapshotter:v40 completion:v22];
LABEL_19:
        [v45 setObject:0 forKeyedSubscript:v14];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v11);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v42 = [v45 allValues];
  uint64_t v24 = [v42 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v47 != v26) {
          objc_enumerationMutation(v42);
        }
        v28 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        v29 = SBLogWallet();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = [v28 identifier];
          *(_DWORD *)buf = 138543362;
          uint64_t v59 = (uint64_t)v30;
          _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_INFO, "Remove card item %{public}@", buf, 0xCu);
        }
        [(SBCardItemsController *)self _deactivateCardItem:v28];
        v31 = (void *)MEMORY[0x1E4F880E0];
        v32 = [v28 userInfo];
        v33 = [v32 objectForKey:@"uniqueIDs"];
        v34 = [v32 objectForKey:@"seedIndex"];
        unint64_t v35 = [v34 unsignedIntegerValue];

        if ([v33 count])
        {
          if (v35 >= [v33 count]) {
            unint64_t v36 = 0;
          }
          else {
            unint64_t v36 = v35;
          }
          v37 = [v33 objectAtIndexedSubscript:v36];
        }
        else
        {
          v37 = 0;
        }

        [v31 purgeCacheOfPassSnapshotsWithUinqueID:v37];
      }
      uint64_t v25 = [v42 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v25);
  }

  [(NSMutableDictionary *)self->_cardItems setObject:v43 forKeyedSubscript:v38];
}

uint64_t __66__SBCardItemsController_setCardItems_forControllerWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCardItem:*(void *)(a1 + 40)];
}

uint64_t __66__SBCardItemsController_setCardItems_forControllerWithIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateCardItem:*(void *)(a1 + 40) animated:0];
}

- (void)getCardItemsForControllerWithIdentifier:(id)a3 withHandler:(id)a4
{
  if (a4)
  {
    cardItems = self->_cardItems;
    id v7 = a4;
    id v9 = [(NSMutableDictionary *)cardItems objectForKey:a3];
    v8 = [v9 allValues];
    (*((void (**)(id, void *, void))a4 + 2))(v7, v8, 0);
  }
}

- (void)_updateThumbnailForCardItem:(id)a3 withSnapshotter:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  uint64_t v10 = [v7 userInfo];
  uint64_t v11 = [v10 objectForKey:@"uniqueIDs"];
  id v12 = [v10 objectForKey:@"manifestHashes"];
  long long v13 = [v10 objectForKey:@"seedIndex"];
  unint64_t v14 = [v13 unsignedIntegerValue];

  if ([v11 count]) {
    BOOL v15 = [v12 count] != 0;
  }
  else {
    BOOL v15 = 0;
  }
  v16 = SBLogWallet();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [v7 identifier];
    *(_DWORD *)buf = 138543618;
    v28 = v17;
    __int16 v29 = 1024;
    BOOL v30 = v15;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "Update thumbnail card item %{public}@ shouldRequestSnapshot: %d", buf, 0x12u);
  }
  if (v15)
  {
    if (v14 >= [v11 count]) {
      unint64_t v18 = 0;
    }
    else {
      unint64_t v18 = v14;
    }
    if (v14 >= [v12 count]) {
      unint64_t v19 = 0;
    }
    else {
      unint64_t v19 = v14;
    }
    int v20 = [v11 objectAtIndexedSubscript:v18];
    v21 = [v12 objectAtIndexedSubscript:v19];
    v22 = SBLogWallet();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = [v7 identifier];
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_INFO, "Request snapshot for card item %{public}@", buf, 0xCu);
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __80__SBCardItemsController__updateThumbnailForCardItem_withSnapshotter_completion___block_invoke;
    v24[3] = &unk_1E6B08768;
    id v25 = v7;
    uint64_t v26 = v9;
    objc_msgSend(v8, "snapshotWithUniqueID:manifestHash:size:completion:", v20, v21, v24, 53.0, 66.0);
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

void __80__SBCardItemsController__updateThumbnailForCardItem_withSnapshotter_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SBCardItemsController__updateThumbnailForCardItem_withSnapshotter_completion___block_invoke_2;
  block[3] = &unk_1E6AF5FC8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__SBCardItemsController__updateThumbnailForCardItem_withSnapshotter_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = SBLogWallet();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) identifier];
    BOOL v4 = *(void *)(a1 + 40) != 0;
    int v6 = 138543618;
    id v7 = v3;
    __int16 v8 = 1024;
    BOOL v9 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Received snapshot for card item %{public}@: %d", (uint8_t *)&v6, 0x12u);
  }
  [*(id *)(a1 + 32) setThumbnail:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_activateCardItem:(id)a3 animated:(BOOL)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = SBLogWallet();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 identifier];
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Activating card item: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  __int16 v8 = [(SBCardItemsController *)self walletNotificationSource];
  [v8 postNotificationRequestForCardItem:v5];
}

- (void)_updateCardItem:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogWallet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [v4 identifier];
    int v8 = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Updating card item: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(SBCardItemsController *)self walletNotificationSource];
  [v7 modifyNotificationRequestForCardItem:v4];
}

- (void)_deactivateCardItem:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogWallet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [v4 identifier];
    int v8 = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Deactivating card item: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(SBCardItemsController *)self walletNotificationSource];
  [v7 withdrawNotificationRequestForCardItem:v4];
}

- (void)_updateRestrictions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SBCardItemsController__updateRestrictions__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__SBCardItemsController__updateRestrictions__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) effectiveBoolValueForSetting:*MEMORY[0x1E4F73F88]];
  int v3 = result == 1;
  if (*(unsigned __int8 *)(*(void *)(a1 + 32) + 40) != v3)
  {
    id v4 = SBLogWallet();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Card while locked restriction changed: %d", buf, 8u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 40) = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__SBCardItemsController__updateRestrictions__block_invoke_34;
    v7[3] = &unk_1E6AF8E28;
    v7[4] = v5;
    return [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
  return result;
}

uint64_t __44__SBCardItemsController__updateRestrictions__block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SBCardItemsController__updateRestrictions__block_invoke_2;
  v4[3] = &unk_1E6AF8E28;
  v4[4] = *(void *)(a1 + 32);
  return [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __44__SBCardItemsController__updateRestrictions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCardItem:");
}

- (SBWalletNotificationSource)walletNotificationSource
{
  return self->_walletNotificationSource;
}

- (void)setWalletNotificationSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletNotificationSource, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_cardItems, 0);
}

void __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBCardItemsController connection interrupted.", v1, 2u);
}

void __60__SBCardItemsController_listener_shouldAcceptNewConnection___block_invoke_31_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBCardItemsController connection invalidated.", v1, 2u);
}

@end