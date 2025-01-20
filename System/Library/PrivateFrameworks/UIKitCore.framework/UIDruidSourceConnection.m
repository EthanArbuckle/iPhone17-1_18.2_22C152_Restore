@interface UIDruidSourceConnection
@end

@implementation UIDruidSourceConnection

uint64_t __32___UIDruidSourceConnection_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __32___UIDruidSourceConnection_init__block_invoke_2(uint64_t a1)
{
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_2___s_category)
                    + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection connection invalidated", v5, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _internalDragFailed];
  }
}

void __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[UIApplication _systemAnimationFenceExemptQueue];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_2;
    v3[3] = &unk_1E52D9F70;
    v3[4] = WeakRetained;
    [v2 performAsync:v3];
  }
}

void __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_3___s_category)
                    + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "%@ timed out. Cancelling drag.", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) cancelDrag];
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;
}

void __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_589(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_4___s_category)
                    + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = a2;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection beginDragWithTouches:items:completion: got replyHandler with sessionID %ld", buf, 0xCu);
  }
  uint64_t v7 = +[UIApplication _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_590;
  v9[3] = &unk_1E52EC340;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v12 = *(id *)(a1 + 48);
  unsigned int v13 = a2;
  id v11 = *(id *)(a1 + 40);
  id v8 = v5;
  [v7 performAsync:v9];
}

void __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_590(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 24), *(id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = *(unsigned int *)(a1 + 64);
    id v9 = [*(id *)(a1 + 48) itemCollection];
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v7, v9);
  }
  else
  {
    (*(void (**)(void, void, void))(v6 + 16))(*(void *)(a1 + 56), 0, 0);
    id v8 = *(void **)(*(void *)(a1 + 32) + 8);
    [v8 invalidate];
  }
}

void __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_2_592(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_5___s_category)
                    + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection got error handler with error %@", buf, 0xCu);
  }
  id v5 = +[UIApplication _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_593;
  v7[3] = &unk_1E52DB330;
  id v6 = *(id *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v5 performAsync:v7];
}

uint64_t __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_593(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 invalidate];
}

void __65___UIDruidSourceConnection_requestDragPreviewsForIndexSet_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dragPreviewProviderBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) dragPreviewProviderBlock];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65___UIDruidSourceConnection_requestDragPreviewsForIndexSet_reply___block_invoke_2;
    v7[3] = &unk_1E52EC3B8;
    uint64_t v4 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    ((void (**)(void, uint64_t, void *))v3)[2](v3, v4, v7);
  }
  else
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &kOutstandingItemsCountKey_block_invoke_6___s_category)
                      + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Source has no dragPreviewProviderBlock yet; we assume druid will retry",
        v6,
        2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __65___UIDruidSourceConnection_requestDragPreviewsForIndexSet_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48___UIDruidSourceConnection_updatedPresentation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) updatedPresentationBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) updatedPresentationBlock];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

void __63___UIDruidSourceConnection_canHandOffCancelledItems_withReply___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  uint64_t v2 = [*(id *)(a1 + 32) canHandOffCancelledItemsBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) canHandOffCancelledItemsBlock];
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = 0;
    ((void (**)(void, uint64_t, id *))v3)[2](v3, v4, &v6);
    id v5 = v6;
  }
  else
  {
    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __60___UIDruidSourceConnection_handOffCancelledItems_withFence___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) handOffCancelledItemsBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) handOffCancelledItemsBlock];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

void __51___UIDruidSourceConnection_dragEndedWithOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dragCompletionBlock];

  if (v2)
  {
    BOOL v3 = *(void *)(a1 + 40) == 0;
    uint64_t v4 = [*(id *)(a1 + 32) dragCompletionBlock];
    v4[2](v4, v3, *(void *)(a1 + 40));

    [*(id *)(a1 + 32) setDragCompletionBlock:0];
  }
  if (!*(void *)(a1 + 40))
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 8);
    [v5 invalidate];
  }
}

uint64_t __55___UIDruidSourceConnection_dataTransferSessionFinished__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataTransferFinishedBlock];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) dataTransferFinishedBlock];
    v3[2]();

    [*(id *)(a1 + 32) setDataTransferFinishedBlock:0];
  }
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v4 invalidate];
}

uint64_t __47___UIDruidSourceConnection__internalDragFailed__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dragCompletionBlock];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) dragCompletionBlock];
    v3[2](v3, 2, 0);

    [*(id *)(a1 + 32) setDragCompletionBlock:0];
  }
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v4 invalidate];
}

@end