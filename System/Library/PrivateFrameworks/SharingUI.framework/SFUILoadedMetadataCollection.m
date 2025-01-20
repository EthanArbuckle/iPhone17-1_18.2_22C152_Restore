@interface SFUILoadedMetadataCollection
- (NSArray)loadedMetadatas;
- (NSArray)loadedSerializedMetadatas;
- (NSArray)metadatas;
- (NSMutableArray)headerMetadataObservers;
- (SFUILoadedMetadataCollection)initWithMetadatas:(id)a3;
- (SFUILoadedMetadataCollectionDelegate)delegate;
- (void)_didFinishLoading;
- (void)_listenForMetadataChanges;
- (void)_load;
- (void)_metadataDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderMetadataObservers:(id)a3;
- (void)setLoadedMetadatas:(id)a3;
- (void)setLoadedSerializedMetadatas:(id)a3;
@end

@implementation SFUILoadedMetadataCollection

- (SFUILoadedMetadataCollection)initWithMetadatas:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFUILoadedMetadataCollection;
  v5 = [(SFUILoadedMetadataCollection *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    metadatas = v5->_metadatas;
    v5->_metadatas = (NSArray *)v6;

    v8 = SFUILinkMetadataSerializationForLocalLowFidelityUseOnly(v4);
    [(SFUILoadedMetadataCollection *)v5 setLoadedSerializedMetadatas:v8];

    [(SFUILoadedMetadataCollection *)v5 _listenForMetadataChanges];
    [(SFUILoadedMetadataCollection *)v5 _load];
  }

  return v5;
}

- (void)_listenForMetadataChanges
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  headerMetadataObservers = self->_headerMetadataObservers;
  self->_headerMetadataObservers = v3;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [(SFUILoadedMetadataCollection *)self metadatas];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v8 _populateMetadataForBackwardCompatibility];
        id location = 0;
        objc_initWeak(&location, self);
        id v9 = objc_alloc((Class)getLPLinkMetadataObserverClass());
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __57__SFUILoadedMetadataCollection__listenForMetadataChanges__block_invoke;
        v12[3] = &unk_264472418;
        objc_copyWeak(&v13, &location);
        v12[4] = v8;
        objc_super v10 = (void *)[v9 initWithMetadata:v8 callback:v12];
        [(NSMutableArray *)self->_headerMetadataObservers addObject:v10];

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

void __57__SFUILoadedMetadataCollection__listenForMetadataChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _metadataDidChange:*(void *)(a1 + 32)];
}

- (void)_metadataDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_21DB23000, v5, OS_LOG_TYPE_DEFAULT, "did update metadata:%@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(SFUILoadedMetadataCollection *)self delegate];
  [v6 metadataCollection:self didChangeMetadata:v4];
}

- (void)_load
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v3 = dispatch_group_create();
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  val = self;
  uint64_t v5 = [(SFUILoadedMetadataCollection *)self metadatas];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
        dispatch_group_enter(v3);
        [v4 addObject:v10];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __37__SFUILoadedMetadataCollection__load__block_invoke;
        v16[3] = &unk_264472510;
        id v17 = v4;
        long long v18 = v10;
        v19 = v3;
        [v10 _loadAsynchronousFieldsWithUpdateHandler:v16];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    id location = 0;
    objc_initWeak(&location, val);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__SFUILoadedMetadataCollection__load__block_invoke_2;
    block[3] = &unk_264471E48;
    objc_copyWeak(&v14, &location);
    v11 = (void *)MEMORY[0x263EF83A0];
    dispatch_group_notify(v3, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SFUILoadedMetadataCollection *)val _didFinishLoading];
  }
}

void __37__SFUILoadedMetadataCollection__load__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
    v3 = *(NSObject **)(a1 + 48);
    dispatch_group_leave(v3);
  }
}

void __37__SFUILoadedMetadataCollection__load__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didFinishLoading];
}

- (void)_didFinishLoading
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v3 = [(SFUILoadedMetadataCollection *)self metadatas];
  [(SFUILoadedMetadataCollection *)self setLoadedMetadatas:v3];

  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(SFUILoadedMetadataCollection *)self loadedMetadatas];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_21DB23000, v4, OS_LOG_TYPE_DEFAULT, "did finish loading metadata:%@", buf, 0xCu);
  }
  uint64_t v6 = [(SFUILoadedMetadataCollection *)self loadedMetadatas];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SFUILoadedMetadataCollection__didFinishLoading__block_invoke;
  v7[3] = &unk_264472538;
  v7[4] = self;
  SFUILinkMetadataSerializationForLocalUseOnly(v6, v7);
}

void __49__SFUILoadedMetadataCollection__didFinishLoading__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  sf_dispatch_on_main_queue();
}

void __49__SFUILoadedMetadataCollection__didFinishLoading__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setLoadedSerializedMetadatas:*(void *)(a1 + 40)];
  id v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) loadedSerializedMetadatas];
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21DB23000, v2, OS_LOG_TYPE_DEFAULT, "did finish serializing loaded metadata:%@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 metadataCollectionDidFinishLoading:*(void *)(a1 + 32)];
}

- (NSArray)metadatas
{
  return self->_metadatas;
}

- (SFUILoadedMetadataCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFUILoadedMetadataCollectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)loadedMetadatas
{
  return self->_loadedMetadatas;
}

- (void)setLoadedMetadatas:(id)a3
{
}

- (NSArray)loadedSerializedMetadatas
{
  return self->_loadedSerializedMetadatas;
}

- (void)setLoadedSerializedMetadatas:(id)a3
{
}

- (NSMutableArray)headerMetadataObservers
{
  return self->_headerMetadataObservers;
}

- (void)setHeaderMetadataObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerMetadataObservers, 0);
  objc_storeStrong((id *)&self->_loadedSerializedMetadatas, 0);
  objc_storeStrong((id *)&self->_loadedMetadatas, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metadatas, 0);
}

@end