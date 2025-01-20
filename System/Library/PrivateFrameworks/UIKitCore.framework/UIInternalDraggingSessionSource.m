@interface UIInternalDraggingSessionSource
@end

@implementation UIInternalDraggingSessionSource

void __46___UIInternalDraggingSessionSource_beginDrag___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 116) = a2;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a3);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _didBeginDrag];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) setState:3];
    [*(id *)(a1 + 32) setDruidConnection:0];
  }
}

void __94___UIInternalDraggingSessionSource__sendDragPreviewReplyWithIndexSet_dragPreviews_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 88))
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    if (*(unsigned char *)(v2 + 48))
    {
      v4 = 0;
    }
    else
    {
      v4 = +[UIScene _synchronizedDrawingFence];
      *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
      [*(id *)(a1 + 32) _sendHandedOffDragImage];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    v5 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __94___UIInternalDraggingSessionSource__sendDragPreviewReplyWithIndexSet_dragPreviews_completion___block_invoke_2;
    v6[3] = &unk_1E52DA548;
    v6[4] = v2;
    [v5 enumerateIndexesUsingBlock:v6];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __94___UIInternalDraggingSessionSource__sendDragPreviewReplyWithIndexSet_dragPreviews_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) internalItems];
  id v5 = [v4 objectAtIndexedSubscript:a2];

  [*(id *)(a1 + 32) _sendHandedOffDragImageForItem:v5];
}

void __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained && !WeakRetained[88])
  {
    v8 = [WeakRetained internalItems];
    v9 = dragPreviewsOfItems(v8, v10, v7);
    [v7 _sendDragPreviewReplyWithIndexSet:v10 dragPreviews:v9 completion:v5];
  }
  else
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

void __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updatedPresentation:v3];
}

uint64_t __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (!WeakRetained || !WeakRetained[48]) {
    goto LABEL_16;
  }
  int v8 = [(id)UIApp _canAnimateDragCancelInApp];
  if (v7[90]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v7[90]) {
      int v10 = 0;
    }
    else {
      int v10 = v8;
    }
    if (v10 != 1) {
      goto LABEL_16;
    }
  }
  else if (!v7[89])
  {
LABEL_16:
    uint64_t v11 = 0;
    goto LABEL_17;
  }
  if (![v7 _canHandOffCancelledItems:v5]) {
    goto LABEL_16;
  }
  [v7 _setupAnimationForCancelledItems:v5 returningLayerContext:a3];
  uint64_t v11 = 1;
LABEL_17:

  return v11;
}

void __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[UIScene _synchronizeDrawingWithFence:v5];
    [WeakRetained _handOffCancelledItems:v7];
    WeakRetained[10] = 5;
  }
}

void __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_5(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 >= 3) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = a2 + 4;
    }
    id v7 = WeakRetained;
    [WeakRetained setResultOperation:a3];
    id WeakRetained = v7;
    if (v7[9])
    {
      v7[10] = v6;
    }
    else
    {
      [v7 setState:v6];
      id WeakRetained = v7;
    }
  }
}

void __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _sendDataTransferFinished];
    uint64_t v2 = [v3 dragManager];
    [v2 sessionSourceDidEnd:v3];

    id WeakRetained = v3;
  }
}

void __50___UIInternalDraggingSessionSource_dragDidExitApp__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    BOOL v2 = [WeakRetained state] == 2;
    id WeakRetained = v4;
    if (v2)
    {
      id v3 = [v4 druidConnection];
      [v3 dragDidExitApp];

      id WeakRetained = v4;
    }
  }
}

uint64_t __91___UIInternalDraggingSessionSource__setupAnimationForCancelledItems_returningLayerContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[10];
  return [v4 setState:v5];
}

@end