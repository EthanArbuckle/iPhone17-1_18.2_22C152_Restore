@interface SKUIIndexBarControlController
- (SKUIIndexBarControl)indexBarControl;
- (SKUIIndexBarControlController)init;
- (SKUIIndexBarControlController)initWithIndexBarControl:(id)a3;
- (SKUIIndexBarControlControllerDataSource)dataSource;
- (SKUIIndexBarControlControllerDelegate)delegate;
- (SKUIResourceLoader)resourceLoader;
- (id)_URLForEntryDescriptor:(id)a3;
- (id)_cachedEntryForEntryDescriptor:(id)a3;
- (id)_combinedEntryDescriptor;
- (id)_entryDescriptorAtIndexPath:(id)a3;
- (id)_entryForEntryDescriptor:(id)a3 loadingIfNeeded:(BOOL)a4;
- (id)_placeholderEntryForEntryDescriptor:(id)a3;
- (id)combinedEntryForIndexBarControl:(id)a3;
- (id)indexBarControl:(id)a3 entryAtIndexPath:(id)a4;
- (int64_t)indexBarControl:(id)a3 numberOfEntriesInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInIndexBarControl:(id)a3;
- (void)_artworkRequestDidLoadImageNotification:(id)a3;
- (void)_cancelLoadForEntryDescriptors:(id)a3;
- (void)_configureEntry:(id)a3 withEntryDescriptor:(id)a4;
- (void)_finishLoadForRequestID:(id)a3 withResultingImage:(id)a4;
- (void)_loadEntryForEntryDescriptor:(id)a3;
- (void)_updateCachedEntry:(id)a3 forEntryDescriptor:(id)a4;
- (void)dealloc;
- (void)indexBarControl:(id)a3 didSelectEntryAtIndexPath:(id)a4;
- (void)indexBarControlDidSelectBeyondBottom:(id)a3;
- (void)indexBarControlDidSelectBeyondTop:(id)a3;
- (void)init;
- (void)reloadCombinedEntryDescriptor;
- (void)reloadData;
- (void)reloadEntryDescriptorAtIndexPath:(id)a3;
- (void)reloadSections:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setResourceLoader:(id)a3;
@end

@implementation SKUIIndexBarControlController

- (SKUIIndexBarControlController)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIndexBarControlController init]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIIndexBarControlController;
  v3 = [(SKUIIndexBarControlController *)&v8 init];
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:1];
    entryDescriptorToCachedEntry = v3->_entryDescriptorToCachedEntry;
    v3->_entryDescriptorToCachedEntry = (NSMapTable *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__artworkRequestDidLoadImageNotification_ name:@"SKUIArtworkRequestDidLoadImageNotification" object:0];
  }
  return v3;
}

- (SKUIIndexBarControlController)initWithIndexBarControl:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIndexBarControlController initWithIndexBarControl:]();
  }
  v6 = [(SKUIIndexBarControlController *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_indexBarControl, a3);
    [(SKUIIndexBarControl *)v7->_indexBarControl setDataSource:v7];
    [(SKUIIndexBarControl *)v7->_indexBarControl setDelegate:v7];
    indexBarControl = v7->_indexBarControl;
    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIIndexBarControl *)indexBarControl setBackgroundColor:v9];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SKUIArtworkRequestDidLoadImageNotification" object:0];
  [(SKUIIndexBarControl *)self->_indexBarControl setDataSource:0];
  [(SKUIIndexBarControl *)self->_indexBarControl setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIIndexBarControlController;
  [(SKUIIndexBarControlController *)&v4 dealloc];
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_dataSource, obj);
    *(unsigned char *)&self->_dataSourceDelegateFlags = *(unsigned char *)&self->_dataSourceDelegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;

    id v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    if (objc_opt_respondsToSelector()) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_dataSourceDelegateFlags = *(unsigned char *)&self->_dataSourceDelegateFlags & 0xFD | v7;

    [(SKUIIndexBarControlController *)self reloadData];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_dataSourceDelegateFlags = *(unsigned char *)&self->_dataSourceDelegateFlags & 0xFB | v6;

    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_dataSourceDelegateFlags = *(unsigned char *)&self->_dataSourceDelegateFlags & 0xF7 | v8;

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      char v10 = 16;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_dataSourceDelegateFlags = *(unsigned char *)&self->_dataSourceDelegateFlags & 0xEF | v10;
  }
}

- (void)reloadCombinedEntryDescriptor
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_combinedEntryDescriptor)
  {
    v4[0] = self->_combinedEntryDescriptor;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
    [(SKUIIndexBarControlController *)self _cancelLoadForEntryDescriptors:v3];
  }
  self->_hasValidCombinedEntryDescriptor = 0;
  [(SKUIIndexBarControl *)self->_indexBarControl reloadCombinedEntry];
}

- (void)reloadEntryDescriptorAtIndexPath:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_indexPathToEntryDescriptor objectForKey:v4];
  char v6 = (void *)v5;
  if (v5)
  {
    v11[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(SKUIIndexBarControlController *)self _cancelLoadForEntryDescriptors:v7];

    [(NSMapTable *)self->_indexPathToEntryDescriptor removeObjectForKey:v4];
    char v8 = [(NSMapTable *)self->_indexPathToEntryDescriptor objectEnumerator];
    id v9 = [v8 allObjects];
    char v10 = [v9 containsObject:v6];

    if ((v10 & 1) == 0) {
      [(NSMapTable *)self->_entryDescriptorToCachedEntry removeObjectForKey:v6];
    }
  }
}

- (void)reloadSections:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48__SKUIIndexBarControlController_reloadSections___block_invoke;
  v21[3] = &unk_1E6424780;
  v21[4] = self;
  id v6 = v5;
  id v22 = v6;
  [v4 enumerateIndexesUsingBlock:v21];
  if ([v6 count])
  {
    id v16 = v4;
    [(SKUIIndexBarControlController *)self _cancelLoadForEntryDescriptors:v6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          v13 = [(NSMapTable *)self->_indexPathToEntryDescriptor objectEnumerator];
          v14 = [v13 allObjects];
          char v15 = [v14 containsObject:v12];

          if ((v15 & 1) == 0) {
            [(NSMapTable *)self->_entryDescriptorToCachedEntry removeObjectForKey:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v9);
    }

    id v4 = v16;
  }
  [(SKUIIndexBarControl *)self->_indexBarControl reloadSections:v4];
}

void __48__SKUIIndexBarControlController_reloadSections___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "copy", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 section] == a2)
        {
          uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v9];
          if (v10) {
            [*(id *)(a1 + 40) addObject:v10];
          }
          [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)reloadData
{
  self->_hasValidCombinedEntryDescriptor = 0;
  v3 = [(NSMapTable *)self->_indexPathToEntryDescriptor objectEnumerator];
  id v4 = [v3 allObjects];
  [(SKUIIndexBarControlController *)self _cancelLoadForEntryDescriptors:v4];

  indexPathToEntryDescriptor = self->_indexPathToEntryDescriptor;
  self->_indexPathToEntryDescriptor = 0;

  indexBarControl = self->_indexBarControl;

  [(SKUIIndexBarControl *)indexBarControl reloadData];
}

- (id)combinedEntryForIndexBarControl:(id)a3
{
  if (*(unsigned char *)&self->_dataSourceDelegateFlags)
  {
    uint64_t v5 = [(SKUIIndexBarControlController *)self _combinedEntryDescriptor];
    if (v5)
    {
      v3 = [(SKUIIndexBarControlController *)self _entryForEntryDescriptor:v5 loadingIfNeeded:1];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = +[SKUIIndexBarEntry systemCombinedEntry];
  }

  return v3;
}

- (id)indexBarControl:(id)a3 entryAtIndexPath:(id)a4
{
  uint64_t v5 = [(SKUIIndexBarControlController *)self _entryDescriptorAtIndexPath:a4];
  uint64_t v6 = [(SKUIIndexBarControlController *)self _entryForEntryDescriptor:v5 loadingIfNeeded:1];

  return v6;
}

- (int64_t)numberOfSectionsInIndexBarControl:(id)a3
{
  id v4 = (SKUIIndexBarControl *)a3;
  if (self->_indexBarControl == v4)
  {
    if ((*(unsigned char *)&self->_dataSourceDelegateFlags & 2) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      int64_t v5 = [WeakRetained numberOfSectionsInIndexBarControlController:self];
    }
    else
    {
      int64_t v5 = 1;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)indexBarControl:(id)a3 numberOfEntriesInSection:(int64_t)a4
{
  if (self->_indexBarControl != a3) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int64_t v8 = [WeakRetained indexBarControlController:self numberOfEntryDescriptorsInSection:a4];

  return v8;
}

- (void)indexBarControl:(id)a3 didSelectEntryAtIndexPath:(id)a4
{
  if ((*(unsigned char *)&self->_dataSourceDelegateFlags & 4) != 0)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained indexBarControlController:self didSelectEntryDescriptorAtIndexPath:v6];
  }
}

- (void)indexBarControlDidSelectBeyondBottom:(id)a3
{
  if ((*(unsigned char *)&self->_dataSourceDelegateFlags & 8) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained indexBarControlControllerDidSelectBeyondBottom:self];
  }
}

- (void)indexBarControlDidSelectBeyondTop:(id)a3
{
  if ((*(unsigned char *)&self->_dataSourceDelegateFlags & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained indexBarControlControllerDidSelectBeyondTop:self];
  }
}

- (void)_artworkRequestDidLoadImageNotification:(id)a3
{
  id v4 = a3;
  id v8 = [v4 object];
  int64_t v5 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v8, "requestIdentifier"));
  id v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKey:@"SKUIArtworkRequestImageKey"];

  [(SKUIIndexBarControlController *)self _finishLoadForRequestID:v5 withResultingImage:v7];
}

- (void)_cancelLoadForEntryDescriptors:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [(SKUIIndexBarControlController *)self _URLForEntryDescriptor:v9];
        if (v10)
        {
          long long v11 = [(SKUIResourceLoader *)self->_resourceLoader requestIdentifierForCacheKey:v10];
          if (v11)
          {
            long long v12 = [(NSMapTable *)self->_requestIDToDescriptors objectForKey:v11];
            if ([v12 count])
            {
              [v12 removeObject:v9];
              if (![v12 count])
              {
                [(NSMapTable *)self->_requestIDToDescriptors removeObjectForKey:v11];
                if (![(NSMapTable *)self->_requestIDToDescriptors count])
                {
                  requestIDToDescriptors = self->_requestIDToDescriptors;
                  self->_requestIDToDescriptors = 0;
                }
                -[SKUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_resourceLoader, "trySetReason:forRequestWithIdentifier:", 0, [v11 unsignedIntegerValue]);
              }
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (id)_cachedEntryForEntryDescriptor:(id)a3
{
  id v4 = a3;
  entryDescriptorToCachedEntry = self->_entryDescriptorToCachedEntry;
  if (!entryDescriptorToCachedEntry
    || (uint64_t v6 = NSMapGet(entryDescriptorToCachedEntry, v4)) == 0)
  {
    uint64_t v7 = [v4 entryDescriptorType];
    if (v7)
    {
      if (v7 == 3)
      {
        id v8 = [v4 image];
        uint64_t v9 = +[SKUIIndexBarEntry entryWithImage:v8];
LABEL_10:
        uint64_t v6 = (void *)v9;

        if (!v6) {
          goto LABEL_13;
        }
        goto LABEL_11;
      }
      if (v7 == 1)
      {
        id v8 = [v4 attributedString];
        uint64_t v9 = +[SKUIIndexBarEntry entryWithAttributedString:v8];
        goto LABEL_10;
      }
      uint64_t v6 = 0;
    }
    else
    {
      [v4 size];
      uint64_t v6 = +[SKUIIndexBarEntry placeholderEntryWithSize:](SKUIIndexBarEntry, "placeholderEntryWithSize:");
      if (v6)
      {
LABEL_11:
        [(SKUIIndexBarControlController *)self _configureEntry:v6 withEntryDescriptor:v4];
        [(NSMapTable *)self->_entryDescriptorToCachedEntry setObject:v6 forKey:v4];
      }
    }
  }
LABEL_13:

  return v6;
}

- (id)_combinedEntryDescriptor
{
  if (!self->_hasValidCombinedEntryDescriptor)
  {
    if (*(unsigned char *)&self->_dataSourceDelegateFlags)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      id v4 = [WeakRetained combinedEntryDescriptorForIndexBarControlController:self];
      combinedEntryDescriptor = self->_combinedEntryDescriptor;
      self->_combinedEntryDescriptor = v4;
    }
    self->_hasValidCombinedEntryDescriptor = 1;
  }
  uint64_t v6 = self->_combinedEntryDescriptor;

  return v6;
}

- (void)_configureEntry:(id)a3 withEntryDescriptor:(id)a4
{
  id v5 = a4;
  id v7 = a3;
  [v5 contentEdgeInsets];
  objc_msgSend(v7, "setContentEdgeInsets:");
  uint64_t v6 = [v5 visibilityPriority];

  [v7 setVisibilityPriority:v6];
}

- (id)_entryDescriptorAtIndexPath:(id)a3
{
  id v4 = a3;
  indexPathToEntryDescriptor = self->_indexPathToEntryDescriptor;
  if (!indexPathToEntryDescriptor
    || (uint64_t v6 = NSMapGet(indexPathToEntryDescriptor, v4)) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v6 = [WeakRetained indexBarControlController:self entryDescriptorAtIndexPath:v4];

    id v8 = self->_indexPathToEntryDescriptor;
    if (!v8)
    {
      uint64_t v9 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:1];
      uint64_t v10 = self->_indexPathToEntryDescriptor;
      self->_indexPathToEntryDescriptor = v9;

      id v8 = self->_indexPathToEntryDescriptor;
    }
    [(NSMapTable *)v8 setObject:v6 forKey:v4];
  }

  return v6;
}

- (id)_entryForEntryDescriptor:(id)a3 loadingIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SKUIIndexBarControlController *)self _cachedEntryForEntryDescriptor:v6];
  if (!v7)
  {
    id v7 = [(SKUIIndexBarControlController *)self _placeholderEntryForEntryDescriptor:v6];
    if (v4) {
      [(SKUIIndexBarControlController *)self _loadEntryForEntryDescriptor:v6];
    }
  }

  return v7;
}

- (void)_finishLoadForRequestID:(id)a3 withResultingImage:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(NSMapTable *)self->_requestIDToDescriptors objectForKey:v6];
    if (v8)
    {
      [(NSMapTable *)self->_requestIDToDescriptors removeObjectForKey:v6];
      if (![(NSMapTable *)self->_requestIDToDescriptors count])
      {
        requestIDToDescriptors = self->_requestIDToDescriptors;
        self->_requestIDToDescriptors = 0;
      }
      if (v7)
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v17 = v8;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
              long long v16 = +[SKUIIndexBarEntry entryWithImage:v7];
              [(SKUIIndexBarControlController *)self _configureEntry:v16 withEntryDescriptor:v15];
              [(SKUIIndexBarControlController *)self _updateCachedEntry:v16 forEntryDescriptor:v15];

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v12);
        }

        id v8 = v17;
      }
    }
  }
}

- (void)_loadEntryForEntryDescriptor:(id)a3
{
  id v13 = a3;
  BOOL v4 = -[SKUIIndexBarControlController _URLForEntryDescriptor:](self, "_URLForEntryDescriptor:");
  if (v4)
  {
    id v5 = [(SKUIResourceLoader *)self->_resourceLoader requestIdentifierForCacheKey:v4];
    if (v5
      && ([(NSMapTable *)self->_requestIDToDescriptors objectForKey:v5],
          (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = v6;
      [v6 addObject:v13];
    }
    else
    {
      if (!self->_requestIDToDescriptors)
      {
        id v8 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:1];
        requestIDToDescriptors = self->_requestIDToDescriptors;
        self->_requestIDToDescriptors = v8;
      }
      id v10 = objc_alloc_init(SKUIArtworkRequest);
      [(SKUIResourceRequest *)v10 setCacheKey:v4];
      uint64_t v11 = +[SSVURLDataConsumer consumer];
      [(SKUIArtworkRequest *)v10 setDataConsumer:v11];

      [(SKUIArtworkRequest *)v10 setURL:v4];
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v10, "requestIdentifier"));

      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      [(NSMapTable *)self->_requestIDToDescriptors setObject:v7 forKey:v12];
      [v7 addObject:v13];
      if (v10)
      {
        [(SKUIResourceLoader *)self->_resourceLoader loadResourceWithRequest:v10 reason:1];
      }
      id v5 = (void *)v12;
    }
  }
}

- (id)_placeholderEntryForEntryDescriptor:(id)a3
{
  [a3 size];

  return +[SKUIIndexBarEntry placeholderEntryWithSize:](SKUIIndexBarEntry, "placeholderEntryWithSize:");
}

- (void)_updateCachedEntry:(id)a3 forEntryDescriptor:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_indexPathToEntryDescriptor;
  uint64_t v9 = [(NSMapTable *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v14 = -[NSMapTable objectForKey:](self->_indexPathToEntryDescriptor, "objectForKey:", v13, (void)v15);
        if ([v14 isEqual:v7])
        {
          [(NSMapTable *)self->_entryDescriptorToCachedEntry setObject:v6 forKey:v7];
          [(SKUIIndexBarControl *)self->_indexBarControl reloadEntryAtIndexPath:v13];
        }
      }
      uint64_t v10 = [(NSMapTable *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ([(SKUIIndexBarEntryDescriptor *)self->_combinedEntryDescriptor isEqual:v7])
  {
    [(NSMapTable *)self->_entryDescriptorToCachedEntry setObject:v6 forKey:v7];
    [(SKUIIndexBarControl *)self->_indexBarControl reloadCombinedEntry];
  }
}

- (id)_URLForEntryDescriptor:(id)a3
{
  v3 = [a3 artwork];
  BOOL v4 = [v3 URL];

  return v4;
}

- (SKUIIndexBarControlControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SKUIIndexBarControlControllerDataSource *)WeakRetained;
}

- (SKUIIndexBarControlControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIIndexBarControlControllerDelegate *)WeakRetained;
}

- (SKUIIndexBarControl)indexBarControl
{
  return self->_indexBarControl;
}

- (SKUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_indexBarControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_requestIDToDescriptors, 0);
  objc_storeStrong((id *)&self->_indexPathToEntryDescriptor, 0);
  objc_storeStrong((id *)&self->_entryDescriptorToCachedEntry, 0);

  objc_storeStrong((id *)&self->_combinedEntryDescriptor, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIndexBarControlController init]";
}

- (void)initWithIndexBarControl:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIndexBarControlController initWithIndexBarControl:]";
}

@end