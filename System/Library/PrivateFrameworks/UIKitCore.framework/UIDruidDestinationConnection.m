@interface UIDruidDestinationConnection
@end

@implementation UIDruidDestinationConnection

uint64_t __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke_2(uint64_t a1)
{
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_7___s_category)
                    + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection connection invalidated", buf, 2u);
  }
  v3 = +[UIApplication _systemAnimationFenceExemptQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke_692;
  v4[3] = &unk_1E52DC308;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  [v3 performAsync:v4];

  objc_destroyWeak(&v5);
}

void __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke_692(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    BOOL v2 = [WeakRetained state] == 4;
    id WeakRetained = v3;
    if (!v2)
    {
      [v3 setState:5];
      id WeakRetained = v3;
    }
  }
}

void __40___UIDruidDestinationConnection_connect__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  v12 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 1, a2);
    v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_8___s_category)+ 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v10;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection: sawFirstDragEvent reply with session %@", buf, 0xCu);
    }
    v16 = +[UIApplication _systemAnimationFenceExemptQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40___UIDruidDestinationConnection_connect__block_invoke_693;
    v17[3] = &unk_1E52EC3E0;
    objc_copyWeak(v20, v12);
    id v18 = v10;
    id v19 = v11;
    v20[1] = a4;
    v20[2] = a5;
    [v16 performAsync:v17];

    objc_destroyWeak(v20);
  }
}

void __40___UIDruidDestinationConnection_connect__block_invoke_693(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained state] || !*(void *)(a1 + 32))
    {
      [v3 setState:5];
    }
    else
    {
      [v3 setState:1];
      v4 = [v3 connectionBlock];

      if (v4)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        v6 = objc_msgSend(*(id *)(a1 + 40), "items", 0);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v14;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v14 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = [[UIItemProvider alloc] initWithPBItem:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
              [v5 addObject:v11];

              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }
          while (v8);
        }

        v12 = [v3 connectionBlock];
        ((void (**)(void, void, id, void, void))v12)[2](v12, *(void *)(a1 + 40), v5, *(void *)(a1 + 56), *(void *)(a1 + 64));
      }
    }
  }
}

void __40___UIDruidDestinationConnection_connect__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_9___s_category)
                    + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection sawFirstDragEvent error handler with %@", buf, 0xCu);
  }
  id v5 = +[UIApplication _systemAnimationFenceExemptQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40___UIDruidDestinationConnection_connect__block_invoke_695;
  v6[3] = &unk_1E52DC308;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  [v5 performAsync:v6];

  objc_destroyWeak(&v7);
}

void __40___UIDruidDestinationConnection_connect__block_invoke_695(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setState:5];
    id WeakRetained = v2;
  }
}

void __70___UIDruidDestinationConnection_requestDragPreviewsForIndexSet_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dragPreviewProviderBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) dragPreviewProviderBlock];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70___UIDruidDestinationConnection_requestDragPreviewsForIndexSet_reply___block_invoke_2;
    v7[3] = &unk_1E52EC3B8;
    uint64_t v4 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    ((void (**)(void, uint64_t, void *))v3)[2](v3, v4, v7);
  }
  else
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_10___s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Source has no dragPreviewProviderBlock yet; we assume druid will retry",
        v6,
        2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __70___UIDruidDestinationConnection_requestDragPreviewsForIndexSet_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53___UIDruidDestinationConnection_updatedPresentation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updatedPresentationBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) updatedPresentationBlock];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

void __53___UIDruidDestinationConnection_addedItemCollection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) itemsAddedBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) itemsAddedBlock];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

void __115___UIDruidDestinationConnection_performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 2 && *(void *)(a1 + 40) && *(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) setState:3];
    [*(id *)(a1 + 40) setDataProviderEndpoint:*(void *)(a1 + 48)];
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 40) registerLocalAvailableDerivedRepresentations];
    }
    id v2 = [*(id *)(a1 + 32) dropPerformBlock];

    if (v2)
    {
      id v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &qword_1E8FDE328) + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection performDropWithItemCollection: calling dropPerformBlock", buf, 2u);
      }
      id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v5 = [*(id *)(a1 + 40) items];
      v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = [*(id *)(a1 + 40) items];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v27;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = [[UIItemProvider alloc] initWithPBItem:*(void *)(*((void *)&v26 + 1) + 8 * v11)];
            [v6 addObject:v12];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v9);
      }

      long long v13 = [*(id *)(a1 + 32) dropPerformBlock];
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 56);
      id v25 = 0;
      ((void (**)(void, uint64_t, void *, uint64_t, id *))v13)[2](v13, v14, v6, v15, &v25);
      id v16 = v25;
    }
    else
    {
      id v16 = 0;
    }
    v20 = *(void **)(a1 + 64);
    if (v20)
    {
      v21 = *(void **)(a1 + 40);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __115___UIDruidDestinationConnection_performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion___block_invoke_700;
      v22[3] = &unk_1E52DB330;
      id v24 = v20;
      id v23 = v16;
      [v21 waitForItemRequestsDeliveryCompletion:v22];
    }
  }
  else
  {
    v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", qword_1E8FDE330) + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void **)(a1 + 32);
      id v19 = v17;
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = [v18 state];
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection performDropWithItemCollection: failing, state is %ld", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setState:5];
  }
}

uint64_t __115___UIDruidDestinationConnection_performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion___block_invoke_700(uint64_t a1)
{
  id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_12___s_category)
                    + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection performDropWithItemCollection: sending reply to druid", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63___UIDruidDestinationConnection_handOffDroppedItems_withFence___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 3)
  {
    id v2 = [*(id *)(a1 + 32) handOffDroppedItemsBlock];

    if (v2)
    {
      id v6 = [*(id *)(a1 + 32) handOffDroppedItemsBlock];
      (*((void (**)(id, void, void))v6 + 2))(v6, *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
  }
  else
  {
    id v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_13___s_category)+ 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = v3;
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = [v4 state];
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection handOffDroppedItems:withFence: failing, state is %ld", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setState:5];
  }
}

uint64_t __42___UIDruidDestinationConnection_dragEnded__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 2)
  {
    uint64_t v2 = 4;
  }
  else if ([*(id *)(a1 + 32) state] == 3)
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 5;
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 setState:v2];
}

@end