@interface UIInternalDraggingSessionDestination
@end

@implementation UIInternalDraggingSessionDestination

void __48___UIInternalDraggingSessionDestination_connect__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v29 = v9;
    *((unsigned char *)WeakRetained + 40) = 1;
    *((unsigned char *)WeakRetained + 152) = a5 & 1;
    *((unsigned char *)WeakRetained + 153) = (a5 & 2) != 0;
    *((void *)WeakRetained + 26) = a4;
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [(UIDragItem *)[_UIDropItem alloc] initWithItemProvider:*(void *)(*((void *)&v30 + 1) + 8 * v18)];
          [v13 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v16);
    }

    id v9 = v29;
    *(void *)(*(void *)(a1 + 32) + 192) = [v29 originatorDataOwner];
    v20 = [v12 inAppSessionSource];
    v21 = v20;
    if (v20)
    {
      v22 = [v20 internalItems];
      uint64_t v23 = [v13 count];
      if (v23 - 1 < (unint64_t)[v22 count])
      {
        uint64_t v24 = 0;
        do
        {
          v25 = [v22 objectAtIndexedSubscript:v24];
          v26 = [v13 objectAtIndexedSubscript:v24];
          [v26 _setLocalDragItem:v25];

          ++v24;
        }
        while (v23 != v24);
      }

      id v9 = v29;
    }
    [v12 setInternalItems:v13];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) makeObjectsPerformSelector:sel__sendIfNeeded];
    uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
    v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = 0;
  }
}

void __48___UIInternalDraggingSessionDestination_connect__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained internalItems];
    id v10 = dragPreviewsOfItems(v9, v5, v8);

    v11 = (void *)UIApp;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_3;
    v13[3] = &unk_1E52DB330;
    id v14 = v10;
    id v15 = v6;
    id v12 = v10;
    [v11 _performBlockAfterCATransactionCommits:v13];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

uint64_t __48___UIInternalDraggingSessionDestination_connect__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __48___UIInternalDraggingSessionDestination_connect__block_invoke_4(uint64_t a1, void *a2)
{
  id v21 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = [v21 items];
    id v5 = [WeakRetained internalItems];
    unint64_t v6 = [v5 count];

    unint64_t v7 = [v4 count];
    v8 = [WeakRetained internalItems];
    id v9 = (void *)[v8 mutableCopy];

    if (v6 < v7)
    {
      unint64_t v10 = v6;
      do
      {
        v11 = [v4 objectAtIndexedSubscript:v10];
        id v12 = [[UIItemProvider alloc] initWithPBItem:v11];
        v13 = [(UIDragItem *)[_UIDropItem alloc] initWithItemProvider:v12];
        [v9 addObject:v13];

        ++v10;
      }
      while (v7 != v10);
    }
    id v14 = [WeakRetained inAppSessionSource];
    id v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 internalItems];
      unint64_t v17 = [v16 count];
      if (v6 < v7 && v7 <= v17)
      {
        do
        {
          uint64_t v18 = [v16 objectAtIndexedSubscript:v6];
          v19 = [v9 objectAtIndexedSubscript:v6];
          [v19 _setLocalDragItem:v18];

          ++v6;
        }
        while (v7 != v6);
      }
    }
    [WeakRetained setInternalItems:v9];
    v20 = [WeakRetained dragEvents];
    [v20 makeObjectsPerformSelector:sel__setNeedsHitTestReset];
  }
}

void __48___UIInternalDraggingSessionDestination_connect__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v14 = WeakRetained;
  if (WeakRetained && WeakRetained[9])
  {
    uint64_t v22 = a1;
    id v23 = v11;
    id v24 = v10;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "setDataTransferDelegate:", *((void *)v14 + 14), v22);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }

    [v14 takeVisibleDroppedItems:v12];
    objc_storeStrong((id *)v14 + 23, a3);
    objc_storeStrong((id *)v14 + 13, a2);
    *(unsigned char *)(*(void *)(v22 + 32) + 128) = 1;
    (*(void (**)(void))(*((void *)v14 + 9) + 16))();
    v20 = (void *)*((void *)v14 + 23);
    *((void *)v14 + 23) = 0;

    id v21 = (void *)*((void *)v14 + 9);
    *((void *)v14 + 9) = 0;

    [v14 setUpDropAnimation:v12 layerContext:a5];
    id v10 = v24;
    id v11 = v23;
  }
}

void __48___UIInternalDraggingSessionDestination_connect__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5) {
      +[UIScene _synchronizeDrawingWithFence:v5];
    }
    [WeakRetained handOffDroppedItems:v7];
  }
}

void __48___UIInternalDraggingSessionDestination_connect__block_invoke_7(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (a2) {
      BOOL v5 = *((void *)WeakRetained + 9) == 0;
    }
    else {
      BOOL v5 = 0;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_8;
    v9[3] = &unk_1E52D9FC0;
    v9[4] = WeakRetained;
    BOOL v10 = v5;
    unint64_t v6 = (void (**)(void))_Block_copy(v9);
    id v7 = [v4 activeDragEvent];
    v8 = v7;
    if (v5 || !v7) {
      v6[2](v6);
    }
    else {
      [v7 _dragFailedWithCallback:v6];
    }
    [v4 setDruidConnection:0];
    v4[40] = 0;
  }
}

uint64_t __48___UIInternalDraggingSessionDestination_connect__block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sessionDidEndNormally:*(unsigned __int8 *)(a1 + 40)];
}

void __64___UIInternalDraggingSessionDestination__sessionDidEndNormally___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "_sendSessionDidEnd:", *(void *)(a1 + 32), (void)v10);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  id v7 = *(id **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    [v7[14] sendDelegateEventsIfNeeded];
  }
  else {
    [v7 _removeFromDragManager];
  }
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 176), *(id *)(*(void *)(a1 + 32) + 168));
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 168);
  *(void *)(v8 + 168) = 0;
}

void __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 128))
  {
    id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &qword_1E8FDE310) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Data transfer began for dragging session destination %p", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 232);
    uint64_t v5 = [*(id *)(a1 + 40) progress];
    [v4 addChild:v5 withPendingUnitCount:100];

    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 216) == 1
      && [*(id *)(v6 + 112) totalItemsCount]
      && !*(void *)(*(void *)(a1 + 32) + 120))
    {
      id v7 = _UIKitUserDefaults();
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v43 = ___UIGetDraggingModalAlertLatencySeconds_block_invoke;
      v44 = &unk_1E52D9F70;
      id v45 = v7;
      uint64_t v8 = _MergedGlobals_16_1;
      id v9 = v7;
      if (v8 != -1) {
        dispatch_once(&_MergedGlobals_16_1, &buf);
      }
      int v10 = [v9 integerForKey:@"DraggingModalAlertLatencySeconds"];

      if (v10 >= 1)
      {
        int v37 = v10;
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
        long long v12 = [WeakRetained windowScene];

        if (v12) {
          +[_UIApplicationModalProgressController instanceForScene:v12];
        }
        else {
        long long v13 = +[_UIApplicationModalProgressController sharedInstance];
        }
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), v13);
        if (_IsKindOfUIView(*(void *)(*(void *)(a1 + 32) + 56)))
        {
          id v14 = *(id *)(*(void *)(a1 + 32) + 56);
          uint64_t v15 = [v14 traitCollection];
          uint64_t v16 = [v15 userInterfaceIdiom];

          if (v16 == 6)
          {
            uint64_t v17 = +[UIViewController _viewControllerForFullScreenPresentationFromView:v14];
          }
          else
          {
            uint64_t v17 = 0;
          }
        }
        else
        {
          uint64_t v17 = 0;
        }
        uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 112) totalItemsCount];
        id v24 = _UILocalizedFormat(@"dragging.dropAlertTitle", @"Drop alert title", @"Importing %lu items", v19, v20, v21, v22, v23, v18);
        uint64_t v30 = _UILocalizedFormat(@"dragging.dropAlertItemsRemaining", @"Drop alert message", @"%lu items remaining", v25, v26, v27, v28, v29, v18);
        long long v31 = _UILocalizedString(@"dragging.dropAlertCancelButton", @"Drop alert cancel button", @"Cancel");
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke_455;
        aBlock[3] = &unk_1E52DA6B0;
        aBlock[4] = *(void *)(a1 + 32);
        long long v32 = _Block_copy(aBlock);
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke_2;
        v38[3] = &unk_1E52DA660;
        id v33 = *(id *)(a1 + 40);
        uint64_t v34 = *(void *)(a1 + 32);
        id v39 = v33;
        uint64_t v40 = v34;
        uint64_t v35 = _Block_copy(v38);
        [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) forKeyPath:@"outstandingItemsCount" options:1 context:0];
        [v13 setDisplayDelaySeconds:(double)v37];
        v36 = [*(id *)(*(void *)(a1 + 32) + 112) progress];
        [v13 displayWithTitle:v24 message:v30 progress:v36 buttonTitle:v31 sourceViewController:v17 preDisplayTestBlock:v32 dismissalHandler:v35];
      }
    }
  }
}

uint64_t __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke_455(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) isFinished] ^ 1;
}

uint64_t __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) progress];
    [v3 cancel];
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 removeObserver:v5 forKeyPath:@"outstandingItemsCount"];
}

void __88___UIInternalDraggingSessionDestination_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = v1;
    _UILocalizedFormat(@"dragging.dropAlertItemsRemaining", @"Drop alert message", @"%lu items remaining", v4, v5, v6, v7, v8, v2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v3 setMessage:v9];
  }
}

uint64_t __78___UIInternalDraggingSessionDestination_dataTransferMonitorFinishedTransfers___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    [v2[15] hideAfterDelay:1 forceCompletion:0 replacementDismissalHandler:0.5];
    uint64_t v2 = *(id **)(a1 + 32);
  }
  return [v2 _removeFromDragManager];
}

uint64_t __93___UIInternalDraggingSessionDestination_requestDropOnOwner_withOperation_perform_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained druidConnection];
  [v3 enableKeyboardIfNeeded];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __73___UIInternalDraggingSessionDestination_setUpDropAnimation_layerContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[10];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = 0;

    uint64_t v2 = *(void **)(a1 + 32);
  }
  uint64_t v6 = v2[11];
  if (v6)
  {
    (*(void (**)(void))(v6 + 16))();
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 88);
    *(void *)(v7 + 88) = 0;

    uint64_t v2 = *(void **)(a1 + 32);
  }
  id v9 = (void *)v2[12];
  v2[12] = 0;
}

@end