@interface MTLegacyDownloadNotifier
- (MTLegacyDownloadNotifier)init;
- (NSMutableArray)downloadListeners;
- (id)_listenerWithDelegate:(id)a3;
- (void)_sendDelegateSelector:(SEL)a3 withDownload:(id)a4;
- (void)_sendDelegateSelector:(SEL)a3 withDownloadCount:(id)a4;
- (void)_sendDelegateSelector:(SEL)a3 withDownloads:(id)a4;
- (void)registerForUpdates:(id)a3;
- (void)setDownloadListeners:(id)a3;
- (void)unregisterForUpdates:(id)a3;
@end

@implementation MTLegacyDownloadNotifier

- (void)registerForUpdates:(id)a3
{
  id v6 = a3;
  -[MTLegacyDownloadNotifier _listenerWithDelegate:](self, "_listenerWithDelegate:");
  v4 = (MTLegacyDownloadListener *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = [[MTLegacyDownloadListener alloc] initWithDelegate:v6];
    v5 = [(MTLegacyDownloadNotifier *)self downloadListeners];
    [v5 addObject:v4];
  }
}

- (id)_listenerWithDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v5 = [(MTLegacyDownloadNotifier *)self downloadListeners];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__MTLegacyDownloadNotifier__listenerWithDelegate___block_invoke;
  v9[3] = &unk_1E5E61430;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (NSMutableArray)downloadListeners
{
  return self->_downloadListeners;
}

- (MTLegacyDownloadNotifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTLegacyDownloadNotifier;
  v2 = [(MTLegacyDownloadNotifier *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    downloadListeners = v2->_downloadListeners;
    v2->_downloadListeners = (NSMutableArray *)v3;
  }
  return v2;
}

void __50__MTLegacyDownloadNotifier__listenerWithDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 delegate];
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)unregisterForUpdates:(id)a3
{
  id v5 = [(MTLegacyDownloadNotifier *)self _listenerWithDelegate:a3];
  if (v5)
  {
    id v4 = [(MTLegacyDownloadNotifier *)self downloadListeners];
    [v4 removeObject:v5];
  }
}

- (void)_sendDelegateSelector:(SEL)a3 withDownloadCount:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__MTLegacyDownloadNotifier__sendDelegateSelector_withDownloadCount___block_invoke;
  aBlock[3] = &unk_1E5E61458;
  id v10 = v6;
  SEL v11 = a3;
  aBlock[4] = self;
  id v7 = v6;
  v8 = _Block_copy(aBlock);
  [MEMORY[0x1E4F29060] mainThread:v8];
}

void __68__MTLegacyDownloadNotifier__sendDelegateSelector_withDownloadCount___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) downloadListeners];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [v8 delegate];

        if (v9)
        {
          id v10 = [v8 delegate];
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v2;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v17 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "performSelector:withObject:", *(void *)(a1 + 48), *(void *)(a1 + 40), (void)v17);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)_sendDelegateSelector:(SEL)a3 withDownload:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__MTLegacyDownloadNotifier__sendDelegateSelector_withDownload___block_invoke;
    aBlock[3] = &unk_1E5E61458;
    aBlock[4] = self;
    SEL v11 = a3;
    id v10 = v6;
    v8 = _Block_copy(aBlock);
    [MEMORY[0x1E4F29060] mainThread:v8];
  }
}

void __63__MTLegacyDownloadNotifier__sendDelegateSelector_withDownload___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) downloadListeners];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v9 = [v8 delegate];

        if (v9)
        {
          id v10 = [v8 delegate];
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v2;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "performSelector:withObject:", *(void *)(a1 + 48), *(void *)(a1 + 40), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)_sendDelegateSelector:(SEL)a3 withDownloads:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__MTLegacyDownloadNotifier__sendDelegateSelector_withDownloads___block_invoke;
  aBlock[3] = &unk_1E5E61458;
  id v10 = v6;
  SEL v11 = a3;
  aBlock[4] = self;
  id v7 = v6;
  v8 = _Block_copy(aBlock);
  [MEMORY[0x1E4F29060] mainThread:v8];
}

void __64__MTLegacyDownloadNotifier__sendDelegateSelector_withDownloads___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) downloadListeners];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [v8 delegate];

        if (v9)
        {
          id v10 = [v8 delegate];
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v2;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v17 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "performSelector:withObject:", *(void *)(a1 + 48), *(void *)(a1 + 40), (void)v17);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)setDownloadListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

@end