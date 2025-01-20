@interface MRHandlePlaybackQueueRequest
@end

@implementation MRHandlePlaybackQueueRequest

uint64_t ___MRHandlePlaybackQueueRequest_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___onQueue_MRHandlePlaybackQueueRequest_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void ___MRHandlePlaybackQueueRequest_block_invoke_55(uint64_t a1)
{
  v2 = +[MRNowPlayingOriginClientManager sharedManager];
  v3 = [v2 originClientForPlayerPath:*(void *)(a1 + 32)];

  v4 = [v3 playbackQueueCallback];
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ___MRHandlePlaybackQueueRequest_block_invoke_2;
    v14[3] = &unk_1E57D57C8;
    v7 = &v15;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 64);
    ((void (**)(void, uint64_t, uint64_t, void *))v4)[2](v4, v5, v6, v14);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ___MRHandlePlaybackQueueRequest_block_invoke_3;
    v12[3] = &unk_1E57D5840;
    v7 = &v13;
    id v13 = *(id *)(a1 + 64);
    _onQueue_MRHandlePlaybackQueueRequest(v10, v8, v9, v11, v12);
  }
}

void ___MRHandlePlaybackQueueRequest_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___MRHandlePlaybackQueueRequest_block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v8 = [*(id *)(a1 + 32) origin];
    int v9 = [v8 isLocal];

    if (v9)
    {
      [*(id *)(a1 + 40) invalidatationTimestamp];
      double v11 = v10;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v12 = objc_msgSend(v5, "contentItems", 0);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v18 = [v17 metadata];

            if (v18 && MRContentItemGetInferredTimestamp(v17) == 0.0) {
              MRContentItemSetInferredTimestamp(v17, v11);
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v37 count:16];
        }
        while (v14);
      }
    }
    v19 = [*(id *)(a1 + 40) homeUserIdentifiers];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      v21 = [*(id *)(a1 + 40) homeUserIdentifiers];
      [v5 setHomeUserIdentifiers:v21];
    }
    v22 = [v5 contentItems];
    v23 = MRContentItemsCopyMinimalReadableDescription(v22, 0);
    v24 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = *(void *)(a1 + 48);
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v25;
      __int16 v33 = 2114;
      uint64_t v34 = v26;
      __int16 v35 = 2114;
      v36 = v23;
      _os_log_debug_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEBUG, "[MRPlaybackQueueServiceClient] Responded to playbackQueueRequest %{public}@ for path %{public}@ with %{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t ___onQueue_MRHandlePlaybackQueueRequest_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void ___MRHandlePlaybackQueueRequest_block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a3;
  id v8 = a2;
  v7 = [v5 subscriptionController];
  [v7 subscribeToPlaybackQueue:v8 forRequest:a1[5]];

  (*(void (**)(void))(a1[6] + 16))();
}

void ___MRHandlePlaybackQueueRequest_block_invoke_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_7();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_194F3C000, v3, OS_LOG_TYPE_ERROR, "[MRPlaybackQueueServiceClient] Responded to playbackQueueRequest %{public}@ for path %{public}@ with error %{public}@", v4, 0x20u);
}

@end