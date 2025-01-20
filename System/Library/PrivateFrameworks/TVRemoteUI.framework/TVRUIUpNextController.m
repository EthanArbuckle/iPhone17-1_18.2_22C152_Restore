@interface TVRUIUpNextController
+ (double)refreshDelayOnMediaDidChangeTimeInterval;
+ (double)refreshVisibleUpNextTimeInterval;
+ (double)staleDataTimeInterval;
- (BOOL)_isDataStale;
- (BOOL)hasFetchedInfos;
- (BOOL)hasMoreInfo;
- (BOOL)isFetchingUpNextInfos;
- (BOOL)isItemInUpNextForIdentifier:(id)a3;
- (BOOL)isItemInUpNextForMediaInfo:(id)a3;
- (BOOL)refreshNeeded;
- (BOOL)shouldPrewarmData;
- (BOOL)shouldPrewarmImages;
- (NSArray)infos;
- (NSDate)lastRefreshTimestamp;
- (NSSet)infoIdentifiers;
- (NSString)paginationToken;
- (TVRCUpNextController)upNextController;
- (TVRUIDevice)activeDevice;
- (TVRUIImageFetcher)imageFetcher;
- (TVRUIUpNextController)init;
- (void)_prewarmImagesAsNeeded;
- (void)_remoteAddItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)_remoteFetchUpNextInfosWithPaginationToken:(id)a3 completion:(id)a4;
- (void)_remoteMarkAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)_remotePlayItem:(id)a3 completion:(id)a4;
- (void)_remoteRemoveItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)fetchImageForUpNextInfo:(id)a3 completion:(id)a4;
- (void)refresh;
- (void)refreshIfNeeded;
- (void)requestMore;
- (void)setActiveDevice:(id)a3;
- (void)setHasFetchedInfos:(BOOL)a3;
- (void)setImageFetcher:(id)a3;
- (void)setInfos:(id)a3;
- (void)setIsFetchingUpNextInfos:(BOOL)a3;
- (void)setLastRefreshTimestamp:(id)a3;
- (void)setNeedsRefresh;
- (void)setPaginationToken:(id)a3;
- (void)setRefreshNeeded:(BOOL)a3;
- (void)setUpNextController:(id)a3;
@end

@implementation TVRUIUpNextController

- (TVRUIUpNextController)init
{
  v8.receiver = self;
  v8.super_class = (Class)TVRUIUpNextController;
  v2 = [(TVRUIUpNextController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    infos = v2->_infos;
    v2->_infos = (NSArray *)MEMORY[0x263EFFA68];

    *(_WORD *)&v3->_shouldPrewarmData = 256;
    uint64_t v5 = +[TVRUIImageFetcher imageFetcher];
    imageFetcher = v3->_imageFetcher;
    v3->_imageFetcher = (TVRUIImageFetcher *)v5;
  }
  return v3;
}

- (BOOL)isItemInUpNextForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TVRUIUpNextController *)self infoIdentifiers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isItemInUpNextForMediaInfo:(id)a3
{
  id v4 = objc_msgSend(a3, "tvrui_effectiveIdentifier");
  LOBYTE(self) = [(TVRUIUpNextController *)self isItemInUpNextForIdentifier:v4];

  return (char)self;
}

- (TVRCUpNextController)upNextController
{
  upNextController = self->_upNextController;
  if (!upNextController)
  {
    id v4 = (TVRCUpNextController *)objc_alloc_init(MEMORY[0x263F7CA10]);
    uint64_t v5 = self->_upNextController;
    self->_upNextController = v4;

    upNextController = self->_upNextController;
  }
  return upNextController;
}

- (void)setActiveDevice:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isEqualToDevice:self->_activeDevice];
  activeDevice = self->_activeDevice;
  self->_activeDevice = (TVRUIDevice *)v4;

  if ((v5 & 1) == 0)
  {
    [(TVRUIUpNextController *)self setInfos:MEMORY[0x263EFFA68]];
    if ([(TVRUIUpNextController *)self shouldPrewarmData])
    {
      [(TVRUIUpNextController *)self refresh];
    }
  }
}

- (void)setInfos:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_infos, a3);
  infoIdentifiers = self->_infoIdentifiers;
  self->_infoIdentifiers = 0;

  if ([(TVRUIUpNextController *)self shouldPrewarmImages]) {
    [(TVRUIUpNextController *)self _prewarmImagesAsNeeded];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__TVRUIUpNextController_setInfos___block_invoke;
  block[3] = &unk_2647FFF70;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __34__TVRUIUpNextController_setInfos___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"TVRUIUpNextInfosDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)setNeedsRefresh
{
}

- (void)refreshIfNeeded
{
  if (![(TVRUIUpNextController *)self isFetchingUpNextInfos])
  {
    BOOL v3 = [(TVRUIUpNextController *)self _isDataStale];
    if ([(TVRUIUpNextController *)self refreshNeeded] || v3)
    {
      [(TVRUIUpNextController *)self refresh];
    }
  }
}

- (void)requestMore
{
  if (![(TVRUIUpNextController *)self isFetchingUpNextInfos]
    && [(TVRUIUpNextController *)self hasMoreInfo])
  {
    id v3 = [(TVRUIUpNextController *)self paginationToken];
    [(TVRUIUpNextController *)self _remoteFetchUpNextInfosWithPaginationToken:v3 completion:0];
  }
}

- (void)refresh
{
  [(TVRUIUpNextController *)self setPaginationToken:0];
  [(TVRUIUpNextController *)self _remoteFetchUpNextInfosWithPaginationToken:0 completion:0];
}

- (NSSet)infoIdentifiers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  infoIdentifiers = self->_infoIdentifiers;
  if (!infoIdentifiers)
  {
    id v4 = (NSSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = [(TVRUIUpNextController *)self infos];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) mediaInfo];
          v11 = objc_msgSend(v10, "tvrui_effectiveIdentifier");

          if ([v11 length]) {
            [(NSSet *)v4 addObject:v11];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    v12 = self->_infoIdentifiers;
    self->_infoIdentifiers = v4;

    infoIdentifiers = self->_infoIdentifiers;
  }
  return infoIdentifiers;
}

+ (double)staleDataTimeInterval
{
  return 300.0;
}

+ (double)refreshVisibleUpNextTimeInterval
{
  return 60.0;
}

+ (double)refreshDelayOnMediaDidChangeTimeInterval
{
  return 2.5;
}

- (BOOL)hasMoreInfo
{
  id v2 = [(TVRUIUpNextController *)self paginationToken];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)fetchImageForUpNextInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 mediaInfo];
  uint64_t v9 = [v8 identifier];

  if (v6 && [v9 length])
  {
    v10 = [v6 mediaInfo];
    v11 = [v10 imageURLTemplate];
    if ([v11 length])
    {
      v12 = [MEMORY[0x263F7C9C0] imageTemplateWithString:v11];
      v13 = objc_msgSend(v12, "urlForSize:", 400.0, 225.0);
      long long v14 = [(TVRUIUpNextController *)self imageFetcher];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __60__TVRUIUpNextController_fetchImageForUpNextInfo_completion___block_invoke;
      v15[3] = &unk_2647FFF98;
      id v16 = v7;
      [v14 fetchImageWithURL:v13 identifier:v9 completion:v15];
    }
    else
    {
      (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, *MEMORY[0x263F7CA68], 0);
  }
}

uint64_t __60__TVRUIUpNextController_fetchImageForUpNextInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isDataStale
{
  BOOL v3 = [(TVRUIUpNextController *)self lastRefreshTimestamp];

  if (!v3) {
    return 1;
  }
  id v4 = [MEMORY[0x263EFF910] now];
  id v5 = [(TVRUIUpNextController *)self lastRefreshTimestamp];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  +[TVRUIUpNextController staleDataTimeInterval];
  return v7 > v8;
}

- (void)_remoteFetchUpNextInfosWithPaginationToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(TVRUIUpNextController *)self activeDevice];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    [(TVRUIUpNextController *)self setIsFetchingUpNextInfos:1];
    objc_initWeak(&location, self);
    v10 = [(TVRUIUpNextController *)self activeDevice];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke;
    v11[3] = &unk_2647FFFE8;
    objc_copyWeak(&v14, &location);
    id v12 = v6;
    id v13 = v7;
    [v10 fetchUpNextInfoWithPaginationToken:v12 completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setIsFetchingUpNextInfos:0];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke_2;
  v14[3] = &unk_2647FFFC0;
  id v15 = v9;
  id v16 = v8;
  id v17 = a1[4];
  id v11 = v8;
  id v12 = v9;
  objc_copyWeak(&v20, a1 + 6);
  id v18 = v7;
  id v19 = a1[5];
  id v13 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v14);

  objc_destroyWeak(&v20);
}

void __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3) {
      (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, MEMORY[0x263EFFA68]);
    }
    v26 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke_2_cold_1(v2, v26);
    }
  }
  else
  {
    v26 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v25 = a1;
    id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x263F7CA70]];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v10 = (void *)MEMORY[0x263F08928];
            uint64_t v11 = objc_opt_class();
            id v27 = 0;
            id v12 = [v10 unarchivedObjectOfClass:v11 fromData:v9 error:&v27];
            id v13 = v27;
            id v14 = v13;
            if (v12) {
              BOOL v15 = v13 == 0;
            }
            else {
              BOOL v15 = 0;
            }
            if (v15)
            {
              [v26 addObject:v12];
            }
            else
            {
              id v16 = _TVRUINowPlayingLog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v33 = v14;
                _os_log_error_impl(&dword_227326000, v16, OS_LOG_TYPE_ERROR, "Error unarchiving UpNext info: %{public}@", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v6);
    }
    uint64_t v17 = [*(id *)(v25 + 48) length];
    id WeakRetained = objc_loadWeakRetained((id *)(v25 + 72));
    id v19 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained setPaginationToken:*(void *)(v25 + 56)];
      [v19 setRefreshNeeded:0];
      id v20 = [MEMORY[0x263EFF910] now];
      [v19 setLastRefreshTimestamp:v20];

      [v19 setHasFetchedInfos:1];
      if (v17)
      {
        v21 = [v19 infos];
        v22 = [v21 arrayByAddingObjectsFromArray:v26];
        [v19 setInfos:v22];
      }
      else
      {
        [v19 setInfos:v26];
      }
      v23 = [v19 infos];
    }
    else
    {
      v23 = (void *)MEMORY[0x263EFFA68];
    }
    uint64_t v24 = *(void *)(v25 + 64);
    if (v24) {
      (*(void (**)(uint64_t, void, void *, void))(v24 + 16))(v24, *(void *)(v25 + 56), v23, *(void *)(v25 + 32));
    }
  }
}

- (void)_remoteAddItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(TVRUIUpNextController *)self activeDevice];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(TVRUIUpNextController *)self activeDevice];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__TVRUIUpNextController__remoteAddItemWithMediaIdentifier_completion___block_invoke;
    v11[3] = &unk_264800038;
    id v12 = v6;
    id v13 = v7;
    objc_copyWeak(&v14, &location);
    [v10 addItemWithMediaIdentifier:v12 completion:v11];

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);
}

void __70__TVRUIUpNextController__remoteAddItemWithMediaIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__TVRUIUpNextController__remoteAddItemWithMediaIdentifier_completion___block_invoke_cold_1();
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__TVRUIUpNextController__remoteAddItemWithMediaIdentifier_completion___block_invoke_18;
  block[3] = &unk_264800010;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v10);
}

void __70__TVRUIUpNextController__remoteAddItemWithMediaIdentifier_completion___block_invoke_18(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained refresh];
}

- (void)_remoteMarkAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(TVRUIUpNextController *)self activeDevice];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TVRUIUpNextController *)self activeDevice];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke;
    v11[3] = &unk_264800038;
    id v12 = v6;
    id v13 = v7;
    objc_copyWeak(&v14, &location);
    [v10 markAsWatchedWithMediaIdentifier:v12 completion:v11];

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);
}

void __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke_cold_1();
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke_22;
  block[3] = &unk_264800010;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v10);
}

void __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke_22(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained refresh];
}

- (void)_remoteRemoveItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(TVRUIUpNextController *)self activeDevice];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TVRUIUpNextController *)self activeDevice];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke;
    v11[3] = &unk_264800038;
    id v12 = v6;
    id v13 = v7;
    objc_copyWeak(&v14, &location);
    [v10 removeItemWithMediaIdentifier:v12 completion:v11];

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);
}

void __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke_cold_1();
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke_25;
  block[3] = &unk_264800010;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v10);
}

void __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke_25(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained refresh];
}

- (void)_remotePlayItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TVRUIUpNextController *)self activeDevice];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(TVRUIUpNextController *)self activeDevice];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke;
    v11[3] = &unk_264800088;
    id v12 = v6;
    id v13 = v7;
    [v10 playItem:v12 completion:v11];
  }
}

void __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TVRUINowPlayingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke_cold_1();
    }
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke_28;
  v7[3] = &unk_264800060;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_prewarmImagesAsNeeded
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(TVRUIUpNextController *)self infos];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(TVRUIUpNextController *)self fetchImageForUpNextInfo:*(void *)(*((void *)&v8 + 1) + 8 * v7++) completion:&__block_literal_global];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (TVRUIDevice)activeDevice
{
  return self->_activeDevice;
}

- (NSArray)infos
{
  return self->_infos;
}

- (BOOL)hasFetchedInfos
{
  return self->_hasFetchedInfos;
}

- (void)setHasFetchedInfos:(BOOL)a3
{
  self->_hasFetchedInfos = a3;
}

- (void)setUpNextController:(id)a3
{
}

- (TVRUIImageFetcher)imageFetcher
{
  return self->_imageFetcher;
}

- (void)setImageFetcher:(id)a3
{
}

- (BOOL)refreshNeeded
{
  return self->_refreshNeeded;
}

- (void)setRefreshNeeded:(BOOL)a3
{
  self->_refreshNeeded = a3;
}

- (BOOL)isFetchingUpNextInfos
{
  return self->_isFetchingUpNextInfos;
}

- (void)setIsFetchingUpNextInfos:(BOOL)a3
{
  self->_isFetchingUpNextInfos = a3;
}

- (NSDate)lastRefreshTimestamp
{
  return self->_lastRefreshTimestamp;
}

- (void)setLastRefreshTimestamp:(id)a3
{
}

- (NSString)paginationToken
{
  return self->_paginationToken;
}

- (void)setPaginationToken:(id)a3
{
}

- (BOOL)shouldPrewarmData
{
  return self->_shouldPrewarmData;
}

- (BOOL)shouldPrewarmImages
{
  return self->_shouldPrewarmImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paginationToken, 0);
  objc_storeStrong((id *)&self->_lastRefreshTimestamp, 0);
  objc_storeStrong((id *)&self->_imageFetcher, 0);
  objc_storeStrong((id *)&self->_upNextController, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_infoIdentifiers, 0);
}

void __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_227326000, a2, OS_LOG_TYPE_ERROR, "Error fetching watch list: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __70__TVRUIUpNextController__remoteAddItemWithMediaIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227326000, v0, v1, "Error adding item %{public}@: %@");
}

void __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227326000, v0, v1, "Error marking %{public}@ as watched: %@");
}

void __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227326000, v0, v1, "Error removing %{public}@ from watch list: %@");
}

void __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227326000, v0, v1, "Error playing %{public}@: %@");
}

@end