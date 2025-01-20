@interface ICLiveLinkPlaybackCoordinatorMedium
- (BOOL)isCoordinatorSuspended;
- (ICLiveLink)liveLink;
- (ICLiveLinkPlaybackCoordinatorMedium)initWithLiveLink:(id)a3;
- (NSMutableArray)fetchServerStateCompletions;
- (NSUUID)localParticipantUUID;
- (int64_t)fetchServerStateInProgressCount;
- (os_unfair_lock_s)fetchServerStateLock;
- (void)_broadcastLocalParticipantStateDictionary:(id)a3;
- (void)_broadcastTransportControlStateDictionary:(id)a3 forItemWithIdentifier:(id)a4;
- (void)_reloadTransportControlStateForItemWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)clearCoordinationMediumDelegate;
- (void)handleNewParticipantStateDictionary:(id)a3;
- (void)handleNewTransportControlStateDictionary:(id)a3;
- (void)handlePlaybackSyncPayload:(id)a3;
- (void)removeParticipant:(id)a3;
- (void)synchronizePlaybackStateForReason:(id)a3;
@end

@implementation ICLiveLinkPlaybackCoordinatorMedium

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchServerStateCompletions, 0);
  objc_storeStrong((id *)&self->_localParticipantUUID, 0);

  objc_destroyWeak((id *)&self->_liveLink);
}

- (NSMutableArray)fetchServerStateCompletions
{
  return self->_fetchServerStateCompletions;
}

- (int64_t)fetchServerStateInProgressCount
{
  return self->_fetchServerStateInProgressCount;
}

- (os_unfair_lock_s)fetchServerStateLock
{
  return self->_fetchServerStateLock;
}

- (NSUUID)localParticipantUUID
{
  return self->_localParticipantUUID;
}

- (ICLiveLink)liveLink
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveLink);

  return (ICLiveLink *)WeakRetained;
}

- (void)_reloadTransportControlStateForItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(ICLiveLinkPlaybackCoordinatorMedium *)self liveLink];
  os_unfair_lock_lock(&self->_fetchServerStateLock);
  if (self->_fetchServerStateInProgressCount && ([v8 isExpectingToJoinWithStartItem] & 1) == 0)
  {
    fetchServerStateCompletions = self->_fetchServerStateCompletions;
    v11 = (void *)MEMORY[0x1A6240BF0](v7);
    [(NSMutableArray *)fetchServerStateCompletions addObject:v11];

    os_unfair_lock_unlock(&self->_fetchServerStateLock);
    v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = self;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "MLLM %p: reloadTransportControlStateForItemWithIdentifier enqueuing completion handler [fetch server state in progress]", buf, 0xCu);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_fetchServerStateLock);
    v9 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "MLLM %p: reloadTransportControlStateForItemWithIdentifier calling fetching item state [coordinator requested] itemID=%{public}@", buf, 0x16u);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __107__ICLiveLinkPlaybackCoordinatorMedium__reloadTransportControlStateForItemWithIdentifier_completionHandler___block_invoke;
    v13[3] = &unk_1E5AC8108;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    [v8 fetchPlaybackSyncStateForMediumWithCompletion:v13];
  }
}

void __107__ICLiveLinkPlaybackCoordinatorMedium__reloadTransportControlStateForItemWithIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v32 = v7;
      __int16 v33 = 2114;
      id v34 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "MLLM %p: reloadTransportControlStateForItemWithIdentifier [fetch request failed] error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    if (a2) {
      v8 = *(void **)(a2 + 32);
    }
    else {
      v8 = 0;
    }
    id v6 = v8;
    uint64_t v9 = [v6 countByEnumeratingWithState:&v27 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        v12 = v6;
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v12);
          }
          id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v15 = [v14 dataUsingEncoding:4];
          id v26 = 0;
          v16 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v15 options:0 error:&v26];
          id v17 = v26;
          if (v17)
          {
            __int16 v18 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              uint64_t v19 = *(void *)(a1 + 32);
              uint64_t v20 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 134218754;
              uint64_t v32 = v19;
              __int16 v33 = 2114;
              id v34 = v20;
              __int16 v35 = 2114;
              id v36 = v17;
              __int16 v37 = 2114;
              v38 = v14;
              _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "MLLM %p: reloadTransportControlStateForItemWithIdentifier [invalid JSON] itemID=%{public}@ error=%{public}@ transportControlStateString=%{public}@", buf, 0x2Au);
            }
          }
          else
          {
            v21 = [v16 objectForKeyedSubscript:@"Identifier"];
            int v22 = [v21 isEqual:*(void *)(a1 + 40)];

            if (v22)
            {
              v23 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v24 = *(void *)(a1 + 32);
                v25 = *(void **)(a1 + 40);
                *(_DWORD *)buf = 134218498;
                uint64_t v32 = v24;
                __int16 v33 = 2114;
                id v34 = v25;
                __int16 v35 = 2114;
                id v36 = v16;
                _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_DEFAULT, "MLLM %p: reloadTransportControlStateForItemWithIdentifier [importing] itemID=%{public}@ transportControlState=%{public}@", buf, 0x20u);
              }

              [*(id *)(a1 + 32) handleNewTransportControlStateDictionary:v16];
            }
          }
        }
        id v6 = v12;
        uint64_t v10 = [v12 countByEnumeratingWithState:&v27 objects:v39 count:16];
      }
      while (v10);
      id v5 = 0;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_broadcastTransportControlStateDictionary:(id)a3 forItemWithIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "MLLM %p: broadcastTransportControlStateDictionary [AVPlaybackCoordination] itemID=%{public}@ tcs=%{public}@", buf, 0x20u);
  }

  uint64_t v9 = [(ICLiveLinkPlaybackCoordinatorMedium *)self liveLink];
  uint64_t v11 = @"ICLiveLinkTransportControlStateKey";
  id v12 = v6;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [v9 sendPlaybackSyncPayload:v10];
}

- (void)_broadcastLocalParticipantStateDictionary:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICLiveLinkPlaybackCoordinatorMedium *)self liveLink];
  id v7 = @"ICLiveLinkPlaybackSyncParticipantStateKey";
  v8[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [v5 sendPlaybackSyncPayload:v6];
}

- (void)clearCoordinationMediumDelegate
{
  uint64_t v4 = +[ICLiveLinkPlaybackCoordinatorMedium instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"ICLiveLinkPlaybackCoordinatorMedium.m", 176, @"Subclass %@ must implement -%@ defined in %@.", v6, v7, @"ICLiveLinkPlaybackCoordinatorMedium" object file lineNumber description];
  }
}

- (void)synchronizePlaybackStateForReason:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_fetchServerStateLock);
  ++self->_fetchServerStateInProgressCount;
  os_unfair_lock_unlock(&self->_fetchServerStateLock);
  id v5 = [(ICLiveLinkPlaybackCoordinatorMedium *)self liveLink];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ICLiveLinkPlaybackCoordinatorMedium_synchronizePlaybackStateForReason___block_invoke;
  v7[3] = &unk_1E5AC80E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchPlaybackSyncStateWithCompletion:v7];
}

void __73__ICLiveLinkPlaybackCoordinatorMedium_synchronizePlaybackStateForReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  --*(void *)(*(void *)(a1 + 32) + 32);
  id v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __73__ICLiveLinkPlaybackCoordinatorMedium_synchronizePlaybackStateForReason___block_invoke_2;
  v77[3] = &unk_1E5ACD4C8;
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  id v78 = v8;
  uint64_t v79 = v9;
  uint64_t v10 = MEMORY[0x1A6240BF0](v77);
  uint64_t v11 = (void (**)(void))v10;
  v64 = (id *)v5;
  if (v6)
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v82 = v13;
      __int16 v83 = 2114;
      id v84 = v6;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "MLLM %p: _loadInitialPlaybackSyncData [request failed] error=%{public}@", buf, 0x16u);
    }

    v11[2](v11);
    goto LABEL_57;
  }
  long long v76 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v73 = 0u;
  id v61 = v8;
  v60 = (void (**)(void))v10;
  if (v5) {
    id v14 = (void *)v5[3];
  }
  else {
    id v14 = 0;
  }
  id obj = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v73 objects:v89 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v74 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        uint64_t v20 = [v19 dataUsingEncoding:4];
        id v72 = 0;
        v21 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v20 options:0 error:&v72];
        id v22 = v72;
        v23 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
        uint64_t v24 = v23;
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v25 = *(void *)(a1 + 32);
            id v26 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 134218754;
            uint64_t v82 = v25;
            __int16 v83 = 2114;
            id v84 = v26;
            __int16 v85 = 2114;
            id v86 = v22;
            __int16 v87 = 2114;
            v88 = v19;
            _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_ERROR, "MLLM %p: synchronizePlaybackState [invalid JSON] reason=%{public}@ error=%{public}@ participantStateString=%{public}@", buf, 0x2Au);
          }
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = *(void *)(a1 + 32);
            long long v28 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 134218498;
            uint64_t v82 = v27;
            __int16 v83 = 2114;
            id v84 = v28;
            __int16 v85 = 2114;
            id v86 = v21;
            _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_DEFAULT, "MLLM %p: synchronizePlaybackState [importing] reason=%{public}@ participantState=%{public}@", buf, 0x20u);
          }

          [*(id *)(a1 + 32) handleNewParticipantStateDictionary:v21];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v73 objects:v89 count:16];
    }
    while (v16);
  }

  if (v64)
  {
    id v29 = v64[1];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v30 = v64[4];
  }
  else
  {
    id v29 = 0;
    id v30 = 0;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
  }
  os_log_t v31 = (os_log_t)v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v63 = 0;
    char v62 = 0;
    uint64_t v34 = *(void *)v69;
    os_log_t obja = v31;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v69 != v34) {
          objc_enumerationMutation(obja);
        }
        id v36 = *(void **)(*((void *)&v68 + 1) + 8 * v35);
        __int16 v37 = [v36 dataUsingEncoding:4];
        id v67 = 0;
        v38 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v37 options:0 error:&v67];
        id v39 = v67;
        if (v39)
        {
          uint64_t v40 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            uint64_t v41 = *(void *)(a1 + 32);
            v42 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 134218754;
            uint64_t v82 = v41;
            __int16 v83 = 2114;
            id v84 = v42;
            __int16 v85 = 2114;
            id v86 = v39;
            __int16 v87 = 2114;
            v88 = v36;
            _os_log_impl(&dword_1A2D01000, v40, OS_LOG_TYPE_ERROR, "MLLM %p: synchronizePlaybackState [invalid JSON] reason=%{public}@ error=%{public}@ transportControlStateString=%{public}@", buf, 0x2Au);
          }
        }
        else
        {
          if (v64) {
            id v43 = v64[1];
          }
          else {
            id v43 = 0;
          }
          id v44 = v43;

          if (!v44)
          {
            v45 = [v38 objectForKeyedSubscript:@"LamportTimestamp"];
            uint64_t v46 = [v45 integerValue];

            if (v46 > v63)
            {
              v47 = [v38 objectForKeyedSubscript:@"Identifier"];
              if ([v47 length])
              {
                id v48 = v47;
                v49 = v29;
                id v29 = v48;

                char v62 = 1;
                uint64_t v63 = v46;
              }
            }
          }
          v50 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v51 = *(void *)(a1 + 32);
            v52 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 134218498;
            uint64_t v82 = v51;
            __int16 v83 = 2114;
            id v84 = v52;
            __int16 v85 = 2114;
            id v86 = v38;
            _os_log_impl(&dword_1A2D01000, v50, OS_LOG_TYPE_DEFAULT, "MLLM %p: synchronizePlaybackState [importing] reason=%{public}@ transportControlState=%{public}@", buf, 0x20u);
          }

          [*(id *)(a1 + 32) handleNewTransportControlStateDictionary:v38];
        }

        ++v35;
      }
      while (v33 != v35);
      uint64_t v53 = [obja countByEnumeratingWithState:&v68 objects:v80 count:16];
      uint64_t v33 = v53;
    }
    while (v53);

    if ((v62 & 1) == 0)
    {
      id v8 = v61;
      id v6 = 0;
      uint64_t v11 = v60;
      goto LABEL_52;
    }
    os_log_t v31 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    id v8 = v61;
    id v6 = 0;
    uint64_t v11 = v60;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = *(void *)(a1 + 32);
      v55 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v82 = v54;
      __int16 v83 = 2114;
      id v84 = v55;
      __int16 v85 = 2114;
      id v86 = v29;
      _os_log_impl(&dword_1A2D01000, v31, OS_LOG_TYPE_DEFAULT, "MLLM %p: synchronizePlaybackState [computed local currentItemID] reason=%{public}@ currentItemID=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v6 = 0;
    uint64_t v11 = v60;
  }

LABEL_52:
  if ([v29 length])
  {
    v56 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v57 = *(void *)(a1 + 32);
      v58 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v82 = v57;
      __int16 v83 = 2114;
      id v84 = v58;
      __int16 v85 = 2114;
      id v86 = v29;
      _os_log_impl(&dword_1A2D01000, v56, OS_LOG_TYPE_DEFAULT, "MLLM %p: synchronizePlaybackState [importing] reason=%{public}@ currentItemID=%{public}@", buf, 0x20u);
    }

    v59 = [*(id *)(a1 + 32) liveLink];
    [v59 receivedCurrentItemIdentifier:v29 fromParticipant:0];
  }
  v11[2](v11);

LABEL_57:
}

void __73__ICLiveLinkPlaybackCoordinatorMedium_synchronizePlaybackStateForReason___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134218240;
      uint64_t v16 = v3;
      __int16 v17 = 2048;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "MLLM %p: synchronizePlaybackStateForReason [flushing pending completions] completionCount=%ld", buf, 0x16u);
    }

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = *(id *)(a1 + 32);
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
}

- (void)handleNewTransportControlStateDictionary:(id)a3
{
  uint64_t v5 = +[ICLiveLinkPlaybackCoordinatorMedium instanceMethodForSelector:a2];
  if (v5 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"ICLiveLinkPlaybackCoordinatorMedium.m", 94, @"Subclass %@ must implement -%@ defined in %@.", v7, v8, @"ICLiveLinkPlaybackCoordinatorMedium" object file lineNumber description];
  }
}

- (void)handleNewParticipantStateDictionary:(id)a3
{
  uint64_t v5 = +[ICLiveLinkPlaybackCoordinatorMedium instanceMethodForSelector:a2];
  if (v5 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"ICLiveLinkPlaybackCoordinatorMedium.m", 90, @"Subclass %@ must implement -%@ defined in %@.", v7, v8, @"ICLiveLinkPlaybackCoordinatorMedium" object file lineNumber description];
  }
}

- (void)removeParticipant:(id)a3
{
  uint64_t v5 = +[ICLiveLinkPlaybackCoordinatorMedium instanceMethodForSelector:a2];
  if (v5 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"ICLiveLinkPlaybackCoordinatorMedium.m", 86, @"Subclass %@ must implement -%@ defined in %@.", v7, v8, @"ICLiveLinkPlaybackCoordinatorMedium" object file lineNumber description];
  }
}

- (void)handlePlaybackSyncPayload:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"ICLiveLinkPlaybackSyncParticipantStateKey"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"ICLiveLinkTransportControlStateKey"];
  uint64_t v7 = (void *)v6;
  if (!v5)
  {
    if (v6)
    {
      if (_NSIsNSDictionary())
      {
        [(ICLiveLinkPlaybackCoordinatorMedium *)self handleNewTransportControlStateDictionary:v7];
        goto LABEL_15;
      }
      uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 134218243;
        long long v11 = self;
        __int16 v12 = 2113;
        id v13 = v7;
        id v9 = "MLLM %p: ignoring transport control state of unknown form %{private}@";
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 134218243;
        long long v11 = self;
        __int16 v12 = 2113;
        id v13 = v4;
        id v9 = "MLLM %p: no state found in sync payload %{private}@";
        goto LABEL_13;
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!_NSIsNSDictionary())
  {
    uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134218243;
      long long v11 = self;
      __int16 v12 = 2113;
      id v13 = v5;
      id v9 = "MLLM %p: ignoring participant state of unknown form %{private}@";
LABEL_13:
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v10, 0x16u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  [(ICLiveLinkPlaybackCoordinatorMedium *)self handleNewParticipantStateDictionary:v5];
LABEL_15:
}

- (BOOL)isCoordinatorSuspended
{
  return 0;
}

- (ICLiveLinkPlaybackCoordinatorMedium)initWithLiveLink:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICLiveLinkPlaybackCoordinatorMedium;
  uint64_t v5 = [(ICLiveLinkPlaybackCoordinatorMedium *)&v17 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_liveLink, v4);
    uint64_t v7 = [v4 identity];
    uint64_t v8 = [v7 identifier];
    localParticipantUUID = v6->_localParticipantUUID;
    v6->_localParticipantUUID = (NSUUID *)v8;

    if (!v6->_localParticipantUUID)
    {
      uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
      long long v11 = v6->_localParticipantUUID;
      v6->_localParticipantUUID = (NSUUID *)v10;

      __int16 v12 = os_log_create("com.apple.amp.iTunesCloud", "LiveLinkMedium");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = v6->_localParticipantUUID;
        *(_DWORD *)buf = 134218242;
        uint64_t v19 = v6;
        __int16 v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "MLLM %p: playback sync initialized without a server defined local participant UUID: locallyGeneratedUUID=%{public}@", buf, 0x16u);
      }
    }
    v6->_fetchServerStateLock._os_unfair_lock_opaque = 0;
    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fetchServerStateCompletions = v6->_fetchServerStateCompletions;
    v6->_fetchServerStateCompletions = v14;
  }
  return v6;
}

@end