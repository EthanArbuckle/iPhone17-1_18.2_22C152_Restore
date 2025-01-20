@interface MFMessageContentRequestScheduler
@end

@implementation MFMessageContentRequestScheduler

void __61___MFMessageContentRequestScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61___MFMessageContentRequestScheduler_afterDelay_performBlock___block_invoke_2;
  v6[3] = &unk_1E5D3FF10;
  v6[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 performDatabaseWorkInBlockWithHighPriority:v6];
}

void __61___MFMessageContentRequestScheduler_afterDelay_performBlock___block_invoke_2(uint64_t a1)
{
}

void __50___MFMessageContentRequestScheduler_performBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50___MFMessageContentRequestScheduler_performBlock___block_invoke_2;
  v6[3] = &unk_1E5D3FF10;
  v6[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 performDatabaseWorkInBlockWithHighPriority:v6];
}

void __50___MFMessageContentRequestScheduler_performBlock___block_invoke_2(uint64_t a1)
{
}

void __60___MFMessageContentRequestScheduler_performCancelableBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60___MFMessageContentRequestScheduler_performCancelableBlock___block_invoke_2;
  v7[3] = &unk_1E5D3FF38;
  objc_copyWeak(&v10, &location);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performDatabaseWorkInBlockWithHighPriority:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60___MFMessageContentRequestScheduler_performCancelableBlock___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[1];
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F60278] signpostLog];
      id v6 = v5;
      os_signpost_id_t v7 = v3[1];
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MFMessageContentRequestScheduler", "Begin work on scheduler", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v4)
    {
      id v8 = [MEMORY[0x1E4F60278] signpostLog];
      id v9 = v8;
      os_signpost_id_t v10 = v3[1];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7EFF000, v9, OS_SIGNPOST_INTERVAL_END, v10, "MFMessageContentRequestScheduler", "End work on scheduler", v11, 2u);
      }
    }
  }
}

void __54___MFMessageContentRequestScheduler_performSyncBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54___MFMessageContentRequestScheduler_performSyncBlock___block_invoke_2;
  v6[3] = &unk_1E5D3FF10;
  v6[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 performDatabaseWorkInBlockWithHighPriority:v6];
}

void __54___MFMessageContentRequestScheduler_performSyncBlock___block_invoke_2(uint64_t a1)
{
}

void __61___MFMessageContentRequestScheduler_performSyncBarrierBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61___MFMessageContentRequestScheduler_performSyncBarrierBlock___block_invoke_2;
  v6[3] = &unk_1E5D3FF10;
  v6[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 performDatabaseWorkInBlockWithHighPriority:v6];
}

void __61___MFMessageContentRequestScheduler_performSyncBarrierBlock___block_invoke_2(uint64_t a1)
{
}

void __67___MFMessageContentRequestScheduler_performVoucherPreservingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___MFMessageContentRequestScheduler_performVoucherPreservingBlock___block_invoke_2;
  v6[3] = &unk_1E5D3FF10;
  v6[4] = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 performDatabaseWorkInBlockWithHighPriority:v6];
}

void __67___MFMessageContentRequestScheduler_performVoucherPreservingBlock___block_invoke_2(uint64_t a1)
{
}

@end