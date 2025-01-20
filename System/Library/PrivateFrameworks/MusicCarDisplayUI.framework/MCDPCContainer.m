@interface MCDPCContainer
- (BOOL)isValidForRefreshedParent:(id)a3;
- (BOOL)showPlaybackProgress;
- (MCDPCContainerDelegate)delegate;
- (MCDPCItem)rootItem;
- (MCDPCModel)model;
- (NSIndexPath)indexPath;
- (NSMutableDictionary)cachedIndiciesByIdentifier;
- (NSMutableDictionary)cachedItemsByIndicies;
- (NSString)appTitle;
- (NSString)identifier;
- (NSString)title;
- (OS_dispatch_queue)serialAccessContainerQueue;
- (id)_initWithModel:(id)a3 rootItem:(id)a4 indexPath:(id)a5;
- (id)cachedIndexByIdentifier:(id)a3;
- (id)cachedItemForIdentifier:(id)a3;
- (id)cachedItemForIndex:(int64_t)a3;
- (id)containerAtIndex:(int64_t)a3;
- (id)containerForItem:(id)a3;
- (id)description;
- (int64_t)cachedCount;
- (int64_t)showCurrentlyPlayingIndex;
- (void)_contentItemsUpdated:(id)a3;
- (void)_nowPlayingIdentifiersDidChange:(id)a3;
- (void)beginLoadingItem:(id)a3 completion:(id)a4;
- (void)beginLoadingItemWithCompletion:(id)a3;
- (void)dealloc;
- (void)fetchContentWithCompletion:(id)a3;
- (void)getChildrenInRange:(_NSRange)a3 completion:(id)a4;
- (void)getCountOfChildrenWithCompletion:(id)a3;
- (void)getNowPlayingIdentifiersWithCompletion:(id)a3;
- (void)getPlaybackProgressSupportForChildrenWithCompletion:(id)a3;
- (void)invalidate;
- (void)refreshWithCompletion:(id)a3;
- (void)setCachedCount:(int64_t)a3;
- (void)setCachedIndiciesByIdentifier:(id)a3;
- (void)setCachedItemsByIndicies:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setSerialAccessContainerQueue:(id)a3;
- (void)setShowPlaybackProgress:(BOOL)a3;
- (void)updateRootItemWithCompletion:(id)a3;
@end

@implementation MCDPCContainer

- (id)_initWithModel:(id)a3 rootItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(MCDPCContainer *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_model, v8);
    objc_storeWeak((id *)&v12->_rootItem, v9);
    v13 = [v9 identifier];
    uint64_t v14 = [v13 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v14;

    p_indexPath = (void **)&v12->_indexPath;
    objc_storeStrong((id *)&v12->_indexPath, a5);
    if (!v12->_indexPath)
    {
      id v17 = objc_alloc_init(MEMORY[0x263F088C8]);
      v18 = *p_indexPath;
      *p_indexPath = v17;
    }
    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    cachedItemsByIndicies = v12->_cachedItemsByIndicies;
    v12->_cachedItemsByIndicies = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    cachedIndiciesByIdentifier = v12->_cachedIndiciesByIdentifier;
    v12->_cachedIndiciesByIdentifier = (NSMutableDictionary *)v21;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.MusicCarDisplayUI.playableContent.serialContainerAccess", 0);
    serialAccessContainerQueue = v12->_serialAccessContainerQueue;
    v12->_serialAccessContainerQueue = (OS_dispatch_queue *)v23;

    v25 = [MEMORY[0x263F08A00] defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_model);
    [v25 addObserver:v12 selector:sel__contentItemsUpdated_ name:@"didUpdateContent" object:WeakRetained];

    [v25 addObserver:v12 selector:sel__nowPlayingIdentifiersDidChange_ name:@"MCDBrowsableContentNowPlayingIdentifiersUpdatedNotification" object:0];
  }

  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MCDPCContainer;
  [(MCDPCContainer *)&v4 dealloc];
}

- (void)invalidate
{
  [(MCDPCContainer *)self setCachedCount:0];
  v3 = [(MCDPCContainer *)self serialAccessContainerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__MCDPCContainer_invalidate__block_invoke;
  block[3] = &unk_26505BE68;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __28__MCDPCContainer_invalidate__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  [*(id *)(a1 + 32) setCachedItemsByIndicies:v2];

  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [*(id *)(a1 + 32) setCachedIndiciesByIdentifier:v3];
}

- (id)description
{
  id v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = _MCDStringFromIndexPath(self->_indexPath);
  identifier = self->_identifier;
  id v8 = [(NSMutableDictionary *)self->_cachedItemsByIndicies keyEnumerator];
  id v9 = [v8 allObjects];
  id v10 = [v9 componentsJoinedByString:@", "];
  v11 = [v3 stringWithFormat:@"<%@:%p - [%@:%@] - %@>", v5, self, v6, identifier, v10];

  return v11;
}

- (void)_contentItemsUpdated:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v20 = a3;
  uint64_t v21 = [v20 userInfo];
  objc_super v4 = [v21 objectForKey:@"items"];
  v5 = +[MCDBrowsableContentUtilities sharedInstance];
  v22 = [v5 nowPlayingIdentifiers];

  v6 = MCDGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F140000, v6, OS_LOG_TYPE_DEFAULT, "Content items updated, preparing to find indicies to update", buf, 2u);
  }

  dispatch_queue_t v23 = [MEMORY[0x263F089C8] indexSet];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v33 = __Block_byref_object_copy__1;
        v34 = __Block_byref_object_dispose__1;
        id v35 = 0;
        v11 = [(MCDPCContainer *)self serialAccessContainerQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __39__MCDPCContainer__contentItemsUpdated___block_invoke;
        block[3] = &unk_26505C378;
        void block[5] = v10;
        block[6] = buf;
        block[4] = self;
        dispatch_sync(v11, block);

        v12 = *(void **)(*(void *)&buf[8] + 40);
        if (v12)
        {
          v13 = -[MCDPCContainer cachedItemForIndex:](self, "cachedItemForIndex:", [v12 integerValue]);
          uint64_t v14 = v13;
          if (v10)
          {
            v15 = [v13 identifier];
            -[NSObject setCurrentlyPlaying:](v14, "setCurrentlyPlaying:", [v22 containsObject:v15]);

            objc_msgSend(v23, "addIndex:", objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "integerValue"));
          }
        }
        else
        {
          uint64_t v14 = MCDGeneralLogging();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v16 = [v10 identifier];
            -[MCDPCContainer _contentItemsUpdated:](v16, v30, &v31, v14);
          }
        }

        _Block_object_dispose(buf, 8);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v7);
  }

  if ([v23 count] && (*(unsigned char *)&self->44 & 2) != 0)
  {
    id v17 = MCDGeneralLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(MCDPCContainer *)self identifier];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      _os_log_impl(&dword_23F140000, v17, OS_LOG_TYPE_DEFAULT, "Contents updated for container: %{public}@, indicies: %{public}@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained container:self didInvalidateIndicies:v23];
  }
}

void __39__MCDPCContainer__contentItemsUpdated___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) cachedIndiciesByIdentifier];
  v2 = [*(id *)(a1 + 40) identifier];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_nowPlayingIdentifiersDidChange:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v23 = a3;
  uint64_t v4 = +[MCDBrowsableContentUtilities sharedInstance];
  v5 = [v4 nowPlayingIdentifiers];

  v24 = [MEMORY[0x263F089C8] indexSet];
  id v6 = MCDGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_23F140000, v6, OS_LOG_TYPE_DEFAULT, "Now Playing Identifiers changed, checking to see what is now playing", (uint8_t *)&buf, 2u);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [(MCDPCContainer *)self cachedItemsByIndicies];
  id obj = [v7 allKeys];

  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * v10);
        v12 = [(MCDPCContainer *)self cachedItemsByIndicies];
        v13 = [v12 objectForKeyedSubscript:v11];

        uint64_t v14 = [v13 identifier];
        int v15 = [v13 currentlyPlaying];
        uint64_t v16 = [v5 containsObject:v14];
        id v17 = MCDGeneralLogging();
        v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v14;
            _os_log_impl(&dword_23F140000, v18, OS_LOG_TYPE_DEFAULT, "Item currently playing. Identifier: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_debug_impl(&dword_23F140000, v18, OS_LOG_TYPE_DEBUG, "Item not currently playing. Identifier: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        [v13 setCurrentlyPlaying:v16];
        if (v15 != [v13 currentlyPlaying])
        {
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v35 = 0x3032000000;
          v36 = __Block_byref_object_copy__1;
          uint64_t v37 = __Block_byref_object_dispose__1;
          id v38 = 0;
          uint64_t v19 = MCDGeneralLogging();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long v29 = 0;
            _os_log_impl(&dword_23F140000, v19, OS_LOG_TYPE_DEFAULT, "Item currently playing has changed, updating indicies", v29, 2u);
          }

          serialAccessContainerQueue = self->_serialAccessContainerQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __50__MCDPCContainer__nowPlayingIdentifiersDidChange___block_invoke;
          block[3] = &unk_26505C378;
          p_long long buf = &buf;
          block[4] = self;
          id v27 = v14;
          dispatch_sync(serialAccessContainerQueue, block);
          objc_msgSend(v24, "addIndex:", objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "integerValue"));

          _Block_object_dispose(&buf, 8);
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v8);
  }

  if ([v24 count] && (*(unsigned char *)&self->44 & 2) != 0)
  {
    uint64_t v21 = MCDGeneralLogging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_23F140000, v21, OS_LOG_TYPE_DEFAULT, "Indicies invalidated based on now playing identifiers", (uint8_t *)&buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained container:self didInvalidateIndicies:v24];
  }
}

uint64_t __50__MCDPCContainer__nowPlayingIdentifiersDidChange___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 72) objectForKey:a1[5]];
  return MEMORY[0x270F9A758]();
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->44 = *(unsigned char *)&self->44 & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->44 = *(unsigned char *)&self->44 & 0xFB | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->44 = *(unsigned char *)&self->44 & 0xF7 | v7;
    objc_storeWeak((id *)&self->_delegate, obj);
  }
}

- (NSString)title
{
  if ([(NSIndexPath *)self->_indexPath length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_rootItem);
    [WeakRetained title];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
    [WeakRetained appTitle];
  uint64_t v4 = };

  return (NSString *)v4;
}

- (NSString)appTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  uint64_t v3 = [WeakRetained appTitle];

  return (NSString *)v3;
}

- (void)setShowPlaybackProgress:(BOOL)a3
{
  self->_showPlaybackProgress = a3;
}

- (int64_t)showCurrentlyPlayingIndex
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [(MCDPCContainer *)self cachedItemsByIndicies];
  uint64_t v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [(MCDPCContainer *)self cachedItemsByIndicies];
        v12 = [v11 objectForKeyedSubscript:v10];

        uint64_t v13 = [v10 integerValue];
        if (([v12 currentlyPlaying] & (v13 < v8)) != 0) {
          int64_t v8 = v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)setCount:(int64_t)a3
{
  if (self->_cachedCount != a3)
  {
    if ((*(unsigned char *)&self->44 & 4) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained containerWillChangeCount:self];
    }
    [(MCDPCContainer *)self setCachedCount:a3];
    if ((*(unsigned char *)&self->44 & 8) != 0)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 containerDidChangeCount:self];
    }
  }
}

- (id)containerForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  id v6 = [(MCDPCContainer *)self cachedIndexByIdentifier:v5];
  uint64_t v7 = [v6 integerValue];

  int64_t v8 = [MCDPCContainer alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  uint64_t v10 = [(NSIndexPath *)self->_indexPath indexPathByAddingIndex:v7];
  id v11 = [(MCDPCContainer *)v8 _initWithModel:WeakRetained rootItem:v4 indexPath:v10];

  return v11;
}

- (id)containerAtIndex:(int64_t)a3
{
  uint64_t v5 = [MCDPCContainer alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  uint64_t v7 = [(MCDPCContainer *)self cachedItemForIndex:a3];
  int64_t v8 = [(NSIndexPath *)self->_indexPath indexPathByAddingIndex:a3];
  id v9 = [(MCDPCContainer *)v5 _initWithModel:WeakRetained rootItem:v7 indexPath:v8];

  return v9;
}

- (void)updateRootItemWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (![(NSIndexPath *)self->_indexPath length]) {
    v4[2](v4, 1);
  }
  uint64_t v5 = [(NSIndexPath *)self->_indexPath indexPathByRemovingLastIndex];
  NSUInteger v6 = [(NSIndexPath *)self->_indexPath indexAtPosition:[(NSIndexPath *)self->_indexPath length] - 1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__MCDPCContainer_updateRootItemWithCompletion___block_invoke;
  v9[3] = &unk_26505C3A0;
  v9[4] = self;
  uint64_t v10 = v4;
  int64_t v8 = v4;
  objc_msgSend(WeakRetained, "getChildrenAtIndexPath:inRange:completion:", v5, v6, 1, v9);
}

void __47__MCDPCContainer_updateRootItemWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id obj = [a2 firstObject];
  uint64_t v3 = [obj identifier];
  int v4 = [v3 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)];

  if (v4) {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), obj);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchContentWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = MCDGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(MCDPCContainer *)self identifier];
    uint64_t v7 = (void *)v6;
    int64_t v8 = @"ROOT";
    if (v6) {
      int64_t v8 = (__CFString *)v6;
    }
    *(_DWORD *)long long buf = 138412290;
    uint64_t v13 = v8;
    _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Starting to refresh for %@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__MCDPCContainer_fetchContentWithCompletion___block_invoke;
  v10[3] = &unk_26505C3F0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(MCDPCContainer *)self getPlaybackProgressSupportForChildrenWithCompletion:v10];
}

void __45__MCDPCContainer_fetchContentWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__MCDPCContainer_fetchContentWithCompletion___block_invoke_2;
  v2[3] = &unk_26505C3C8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 getCountOfChildrenWithCompletion:v2];
}

void __45__MCDPCContainer_fetchContentWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__MCDPCContainer_fetchContentWithCompletion___block_invoke_3;
  v4[3] = &unk_26505C3A0;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "getChildrenInRange:completion:", 0, a2, v4);
}

uint64_t __45__MCDPCContainer_fetchContentWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    id v4 = (void *)v3;
    id v5 = @"ROOT";
    if (v3) {
      id v5 = (__CFString *)v3;
    }
    int v7 = 138412290;
    int64_t v8 = v5;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Finishing refresh for %@", (uint8_t *)&v7, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)refreshWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = MCDGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Starting to refresh all items, beginning with beginLoadingItem", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__MCDPCContainer_refreshWithCompletion___block_invoke;
  v7[3] = &unk_26505C440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MCDPCContainer *)self beginLoadingItemWithCompletion:v7];
}

void __40__MCDPCContainer_refreshWithCompletion___block_invoke(uint64_t a1)
{
  v2 = MCDGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_23F140000, v2, OS_LOG_TYPE_DEFAULT, "Begin Loading completed for refreshing all items", buf, 2u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__MCDPCContainer_refreshWithCompletion___block_invoke_360;
  v4[3] = &unk_26505C418;
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 fetchContentWithCompletion:v4];
}

void __40__MCDPCContainer_refreshWithCompletion___block_invoke_360(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v1 = MCDGeneralLogging();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_23F140000, v1, OS_LOG_TYPE_DEFAULT, "Completed invalidation, resetting", v2, 2u);
  }
}

- (BOOL)isValidForRefreshedParent:(id)a3
{
  id v4 = a3;
  if (v4 || [(NSIndexPath *)self->_indexPath length])
  {
    id v5 = [v4 containerAtIndex:0];
    id v6 = [v5 identifier];

    if (v6)
    {
      uint64_t v7 = 0;
      while (1)
      {
        id v8 = [v5 identifier];
        int v9 = [v8 isEqualToString:self->_identifier];

        if (v9) {
          break;
        }
        uint64_t v10 = [v4 containerAtIndex:++v7];

        id v11 = [v10 identifier];

        id v5 = v10;
        if (!v11)
        {
          BOOL v12 = 0;
          id v5 = v10;
          goto LABEL_10;
        }
      }
      uint64_t v13 = [v4 indexPath];
      uint64_t v14 = [v13 indexPathByAddingIndex:v7];
      indexPath = self->_indexPath;
      self->_indexPath = v14;

      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 0;
    }
LABEL_10:
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)beginLoadingItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(MCDPCContainer *)self containerForItem:a3];
  [v7 beginLoadingItemWithCompletion:v6];
}

- (void)beginLoadingItemWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = MCDGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(MCDPCContainer *)self identifier];
    id v7 = (void *)v6;
    id v8 = @"ROOT";
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    *(_DWORD *)long long buf = 138412290;
    long long v15 = v8;
    _os_log_impl(&dword_23F140000, v5, OS_LOG_TYPE_DEFAULT, "Preparing to begin loading item %@", buf, 0xCu);
  }
  int v9 = [(MCDPCContainer *)self model];
  uint64_t v10 = [(MCDPCContainer *)self indexPath];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__MCDPCContainer_beginLoadingItemWithCompletion___block_invoke;
  v12[3] = &unk_26505C440;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [v9 beginLoadingItemAtIndexPath:v10 completion:v12];
}

void __49__MCDPCContainer_beginLoadingItemWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = MCDGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) identifier];
    uint64_t v6 = (void *)v5;
    id v7 = @"ROOT";
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_impl(&dword_23F140000, v4, OS_LOG_TYPE_DEFAULT, "Finished begin loading item %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)getPlaybackProgressSupportForChildrenWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCDPCContainer *)self model];
  uint64_t v6 = [(MCDPCContainer *)self indexPath];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__MCDPCContainer_getPlaybackProgressSupportForChildrenWithCompletion___block_invoke;
  v8[3] = &unk_26505C3F0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 getChildrenSupportsPlaybackProgressForIndexPath:v6 withCompletion:v8];
}

void __70__MCDPCContainer_getPlaybackProgressSupportForChildrenWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) setShowPlaybackProgress:a2];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)getNowPlayingIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MCDPCContainer *)self model];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__MCDPCContainer_getNowPlayingIdentifiersWithCompletion___block_invoke;
  v7[3] = &unk_26505C468;
  id v8 = v4;
  id v6 = v4;
  [v5 getNowPlayingIdentifiersWithCompletion:v7];
}

void __57__MCDPCContainer_getNowPlayingIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[MCDBrowsableContentUtilities sharedInstance];
  [v3 setNowPlayingIdentifiers:v5];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)getCountOfChildrenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MCDPCContainer *)self model];
  id v6 = [(MCDPCContainer *)self indexPath];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__MCDPCContainer_getCountOfChildrenWithCompletion___block_invoke;
  v8[3] = &unk_26505C3C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 getCountOfChildrenAtIndexPath:v6 withCompletion:v8];
}

void __51__MCDPCContainer_getCountOfChildrenWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) setCount:a2];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)getChildrenInRange:(_NSRange)a3 completion:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = [(MCDPCContainer *)self model];
  id v9 = [(MCDPCContainer *)self indexPath];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__MCDPCContainer_getChildrenInRange_completion___block_invoke;
  v11[3] = &unk_26505C4B8;
  NSUInteger v13 = location;
  NSUInteger v14 = length;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  objc_msgSend(v8, "getChildrenAtIndexPath:inRange:completion:", v9, location, length, v11);
}

void __48__MCDPCContainer_getChildrenInRange_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  uint64_t v11 = [*(id *)(a1 + 32) serialAccessContainerQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__MCDPCContainer_getChildrenInRange_completion___block_invoke_2;
  v16[3] = &unk_26505C490;
  long long v21 = *(_OWORD *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 32);
  NSUInteger v13 = *(void **)(a1 + 40);
  id v17 = v9;
  uint64_t v18 = v12;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  id v19 = v10;
  id v20 = v13;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(v11, v16);
}

void __48__MCDPCContainer_getChildrenInRange_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = +[MCDBrowsableContentUtilities sharedInstance];
  uint64_t v23 = [v2 nowPlayingIdentifiers];

  uint64_t v3 = *(void *)(a1 + 64);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        if (v10
          && (uint64_t v11 = (void *)v10,
              [v9 identifier],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v12,
              v11,
              (isKindOfClass & 1) == 0))
        {
          id v15 = [v9 identifier];
          objc_msgSend(v9, "setCurrentlyPlaying:", objc_msgSend(v23, "containsObject:", v15));

          uint64_t v16 = [*(id *)(a1 + 40) cachedItemsByIndicies];
          id v17 = [NSNumber numberWithInteger:v3];
          [v16 setObject:v9 forKeyedSubscript:v17];

          uint64_t v18 = [NSNumber numberWithInteger:v3];
          id v19 = [*(id *)(a1 + 40) cachedIndiciesByIdentifier];
          id v20 = [v9 identifier];
          [v19 setObject:v18 forKeyedSubscript:v20];

          ++v3;
        }
        else
        {
          id v14 = MCDGeneralLogging();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            long long v29 = v9;
            _os_log_impl(&dword_23F140000, v14, OS_LOG_TYPE_DEFAULT, "Skipping item %@ without identifier", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v6);
  }

  long long v21 = MCDGeneralLogging();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_23F140000, v21, OS_LOG_TYPE_DEFAULT, "Finished adding items to cache", buf, 2u);
  }

  uint64_t v22 = *(void *)(a1 + 56);
  if (v22) {
    (*(void (**)(uint64_t, void, void, void, void))(v22 + 16))(v22, *(void *)(a1 + 32), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 48));
  }
}

- (id)cachedItemForIndex:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__1;
  NSUInteger v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  uint64_t v5 = [(MCDPCContainer *)self serialAccessContainerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__MCDPCContainer_cachedItemForIndex___block_invoke;
  block[3] = &unk_26505C4E0;
  block[4] = self;
  void block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __37__MCDPCContainer_cachedItemForIndex___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) cachedItemsByIndicies];
  v2 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)cachedItemForIdentifier:(id)a3
{
  uint64_t v4 = [(MCDPCContainer *)self cachedIndexByIdentifier:a3];
  uint64_t v5 = -[MCDPCContainer cachedItemForIndex:](self, "cachedItemForIndex:", [v4 integerValue]);

  return v5;
}

- (id)cachedIndexByIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  NSUInteger v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  uint64_t v5 = [(MCDPCContainer *)self serialAccessContainerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__MCDPCContainer_cachedIndexByIdentifier___block_invoke;
  block[3] = &unk_26505C378;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__MCDPCContainer_cachedIndexByIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) cachedIndiciesByIdentifier];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (MCDPCItem)rootItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootItem);
  return (MCDPCItem *)WeakRetained;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MCDPCModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (MCDPCModel *)WeakRetained;
}

- (int64_t)cachedCount
{
  return self->_cachedCount;
}

- (void)setCachedCount:(int64_t)a3
{
  self->_cachedCount = a3;
}

- (BOOL)showPlaybackProgress
{
  return self->_showPlaybackProgress;
}

- (MCDPCContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MCDPCContainerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)serialAccessContainerQueue
{
  return self->_serialAccessContainerQueue;
}

- (void)setSerialAccessContainerQueue:(id)a3
{
}

- (NSMutableDictionary)cachedIndiciesByIdentifier
{
  return self->_cachedIndiciesByIdentifier;
}

- (void)setCachedIndiciesByIdentifier:(id)a3
{
}

- (NSMutableDictionary)cachedItemsByIndicies
{
  return self->_cachedItemsByIndicies;
}

- (void)setCachedItemsByIndicies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedItemsByIndicies, 0);
  objc_storeStrong((id *)&self->_cachedIndiciesByIdentifier, 0);
  objc_storeStrong((id *)&self->_serialAccessContainerQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_model);
  objc_destroyWeak((id *)&self->_rootItem);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)_contentItemsUpdated:(void *)a3 .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *a3 = a1;
  _os_log_debug_impl(&dword_23F140000, log, OS_LOG_TYPE_DEBUG, "Index was nil for %{public}@", buf, 0xCu);
}

@end