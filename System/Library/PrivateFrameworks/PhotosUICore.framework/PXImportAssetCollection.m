@interface PXImportAssetCollection
+ (id)dayFormatter;
- (BOOL)alreadyImportedGroup;
- (BOOL)isEqual:(id)a3;
- (BOOL)px_isImportAssetCollection;
- (NSString)identifier;
- (PXImportAssetCollection)init;
- (id)arrangedObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)itemAtIndex:(unint64_t)a3;
- (id)localizedTitle;
- (id)unsortedObjects;
- (int64_t)indexOfItem:(id)a3;
- (int64_t)numberOfItems;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)arrangedObjects:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)setAlreadyImportedGroup:(BOOL)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation PXImportAssetCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_arrangedAssetList, 0);
  objc_storeStrong((id *)&self->_assetList, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
}

- (void)setAlreadyImportedGroup:(BOOL)a3
{
  self->_alreadyImportedGroup = a3;
}

- (BOOL)alreadyImportedGroup
{
  return self->_alreadyImportedGroup;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)px_isImportAssetCollection
{
  return 1;
}

- (id)localizedTitle
{
  if ([(PXImportAssetCollection *)self alreadyImportedGroup])
  {
    v3 = PLLocalizedFrameworkString();
  }
  else
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__173174;
    v12 = __Block_byref_object_dispose__173175;
    id v13 = 0;
    assetQueue = self->_assetQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__PXImportAssetCollection_localizedTitle__block_invoke;
    v7[3] = &unk_1E5DD0588;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(assetQueue, v7);
    if (v9[5])
    {
      v5 = [(id)objc_opt_class() dayFormatter];
      v3 = [v5 stringFromDate:v9[5]];
    }
    else
    {
      v3 = 0;
    }
    _Block_object_dispose(&v8, 8);
  }
  return v3;
}

void __41__PXImportAssetCollection_localizedTitle__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) arrangedObjects];
  id v7 = [v2 firstObject];

  v3 = v7;
  if (v7)
  {
    uint64_t v4 = [v7 fileCreationDate];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    v3 = v7;
  }
}

- (int64_t)indexOfItem:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  assetQueue = self->_assetQueue;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PXImportAssetCollection_indexOfItem___block_invoke;
  block[3] = &unk_1E5DCCA20;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(assetQueue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __39__PXImportAssetCollection_indexOfItem___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) arrangedObjects];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 indexOfObject:*(void *)(a1 + 40)];
}

- (id)itemAtIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__173174;
  assetQueue = self->_assetQueue;
  id v13 = __Block_byref_object_dispose__173175;
  id v14 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PXImportAssetCollection_itemAtIndex___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  void block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(assetQueue, block);
  id v4 = _importDataLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v10[5];
    *(_DWORD *)buf = 136315394;
    v16 = "-[PXImportAssetCollection itemAtIndex:]";
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_debug_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __39__PXImportAssetCollection_itemAtIndex___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  v3 = [*(id *)(a1 + 32) arrangedObjects];
  unint64_t v4 = [v3 count];

  if (v2 < v4)
  {
    id v5 = [*(id *)(a1 + 32) arrangedObjects];
    uint64_t v6 = [v5 objectAtIndex:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v12 = [*(id *)(a1 + 32) arrangedObjects];
    uint64_t v9 = [v12 firstObject];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (id)unsortedObjects
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__173174;
  uint64_t v10 = __Block_byref_object_dispose__173175;
  id v11 = 0;
  assetQueue = self->_assetQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PXImportAssetCollection_unsortedObjects__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(assetQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__PXImportAssetCollection_unsortedObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)arrangedObjects:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    assetQueue = self->_assetQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__PXImportAssetCollection_arrangedObjects___block_invoke;
    v7[3] = &unk_1E5DD3280;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(assetQueue, v7);
  }
}

void __43__PXImportAssetCollection_arrangedObjects___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) arrangedObjects];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)arrangedObjects
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assetQueue);
  if (self->_needsSorting)
  {
    self->_needsSorting = 0;
    uint64_t v3 = (void *)[(NSMutableArray *)self->_assetList mutableCopy];
    [v3 sortUsingComparator:&__block_literal_global_14_173181];
    id v4 = +[PXImportExpansionPlaceholderViewModel sharedInstance];
    id v5 = [v3 firstObject];

    if (v5 == v4)
    {
      [v3 removeObject:v4];
      uint64_t v6 = [v3 count];
      if (v6 >= 0) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = v6 + 1;
      }
      [v3 insertObject:v4 atIndex:v7 >> 1];
    }
    objc_storeStrong((id *)&self->_arrangedAssetList, v3);
  }
  else
  {
    uint64_t v3 = (void *)[(NSArray *)self->_arrangedAssetList copy];
  }
  return v3;
}

uint64_t __42__PXImportAssetCollection_arrangedObjects__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 fileCreationDate];
  uint64_t v7 = [v5 fileCreationDate];
  if ([v6 isEqual:v7])
  {
    id v8 = [v4 fileName];
    uint64_t v9 = [v5 fileName];
    uint64_t v10 = [v8 compare:v9];
  }
  else
  {
    uint64_t v10 = [v6 compare:v7];
  }

  return v10;
}

- (int64_t)numberOfItems
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  assetQueue = self->_assetQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PXImportAssetCollection_numberOfItems__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(assetQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__PXImportAssetCollection_numberOfItems__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _importDataLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v15.NSUInteger location = location;
    v15.NSUInteger length = length;
    uint64_t v8 = NSStringFromRange(v15);
    *(_DWORD *)buf = 136315394;
    id v11 = "-[PXImportAssetCollection removeObjectsInRange:]";
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_debug_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }
  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PXImportAssetCollection_removeObjectsInRange___block_invoke;
  block[3] = &unk_1E5DD35E0;
  void block[5] = location;
  block[6] = length;
  block[4] = self;
  dispatch_sync(assetQueue, block);
}

void __48__PXImportAssetCollection_removeObjectsInRange___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  int64_t v3 = [*(id *)(a1 + 32) arrangedObjects];
  id v4 = [v3 objectsAtIndexes:v2];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 32);
        id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "uuid", (void)v12);
        [v10 removeObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectsInArray:v5];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
}

- (void)removeAllObjects
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int64_t v3 = _importDataLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[PXImportAssetCollection removeAllObjects]";
    _os_log_debug_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  assetQueue = self->_assetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PXImportAssetCollection_removeAllObjects__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_sync(assetQueue, block);
}

uint64_t __43__PXImportAssetCollection_removeAllObjects__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  }
  return result;
}

- (void)removeObject:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _importDataLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[PXImportAssetCollection removeObject:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }

  assetQueue = self->_assetQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PXImportAssetCollection_removeObject___block_invoke;
  v8[3] = &unk_1E5DD32A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(assetQueue, v8);
}

void __40__PXImportAssetCollection_removeObject___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  int64_t v3 = [*(id *)(a1 + 40) uuid];
  LODWORD(v2) = [v2 containsObject:v3];

  if (v2)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 32);
    id v5 = [*(id *)(a1 + 40) uuid];
    [v4 removeObject:v5];

    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  }
  else
  {
    uint64_t v6 = _importDataLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 136315394;
      id v9 = "-[PXImportAssetCollection removeObject:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "%s: Attempted to remove %@ from PXImportAssetCollection but it doesn't contain it.", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _importDataLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[PXImportAssetCollection addObjectsFromArray:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_debug_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }

  assetQueue = self->_assetQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PXImportAssetCollection_addObjectsFromArray___block_invoke;
  v8[3] = &unk_1E5DD32A8;
  id v9 = v4;
  __int16 v10 = self;
  id v7 = v4;
  dispatch_sync(assetQueue, v8);
}

void __47__PXImportAssetCollection_addObjectsFromArray___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&long long v5 = 136315394;
    long long v13 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        __int16 v10 = *(void **)(*(void *)(a1 + 40) + 32);
        uint64_t v11 = objc_msgSend(v9, "uuid", v13, (void)v14);
        LOBYTE(v10) = [v10 containsObject:v11];

        if (v10)
        {
          uint64_t v12 = _importDataLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = "-[PXImportAssetCollection addObjectsFromArray:]_block_invoke";
            __int16 v20 = 2112;
            v21 = v9;
            _os_log_error_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "%s: Attempted to add %@ to PXImportAssetCollection but it already contains it.", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v12 = [v9 uuid];
          [v2 addObject:v12];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(a1 + 40) + 16) addObjectsFromArray:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 32) addObjectsFromArray:v2];
  *(unsigned char *)(*(void *)(a1 + 40) + 40) = 1;
}

- (void)addObject:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = _importDataLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[PXImportAssetCollection addObject:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }

  assetQueue = self->_assetQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__PXImportAssetCollection_addObject___block_invoke;
  v8[3] = &unk_1E5DD32A8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(assetQueue, v8);
}

void __37__PXImportAssetCollection_addObject___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [*(id *)(a1 + 40) uuid];
  LOBYTE(v2) = [v2 containsObject:v3];

  if (v2)
  {
    id v4 = _importDataLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 136315394;
      id v9 = "-[PXImportAssetCollection addObject:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "%s: Attempted to add %@ to PXImportAssetCollection but it already contains it.", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
    long long v5 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v6 = [*(id *)(a1 + 40) uuid];
    [v5 addObject:v6];

    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
  }
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v5 = [(PXImportAssetCollection *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"%@ <%p> \"%@\" (%ld items)", v4, self, v5, -[PXImportAssetCollection numberOfItems](self, "numberOfItems")];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(PXImportAssetCollection *)self identifier];
    uint64_t v7 = [v5 identifier];

    unsigned __int8 v8 = [v6 isEqualToString:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXImportAssetCollection;
    unsigned __int8 v8 = [(PXImportAssetCollection *)&v10 isEqual:v4];
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableArray *)self->_assetList mutableCopy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSArray *)self->_arrangedAssetList mutableCopy];
  unsigned __int8 v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSMutableSet *)self->_assetUUIDs mutableCopy];
  objc_super v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_identifier copy];
  uint64_t v12 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v11;

  *(unsigned char *)(v4 + 41) = self->_alreadyImportedGroup;
  *(unsigned char *)(v4 + 40) = 1;
  return (id)v4;
}

- (PXImportAssetCollection)init
{
  v15.receiver = self;
  v15.super_class = (Class)PXImportAssetCollection;
  id v2 = [(PXImportAssetCollection *)&v15 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    uint64_t v4 = NSString;
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    id v7 = [v4 stringWithFormat:@"%@-assetQueue", v6];
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], v3);
    assetQueue = v2->_assetQueue;
    v2->_assetQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    assetList = v2->_assetList;
    v2->_assetList = (NSMutableArray *)v10;

    uint64_t v12 = objc_opt_new();
    assetUUIDs = v2->_assetUUIDs;
    v2->_assetUUIDs = (NSMutableSet *)v12;
  }
  return v2;
}

+ (id)dayFormatter
{
  if (dayFormatter_onceToken != -1) {
    dispatch_once(&dayFormatter_onceToken, &__block_literal_global_173209);
  }
  id v2 = (void *)dayFormatter__dayFormatter;
  return v2;
}

void __39__PXImportAssetCollection_dayFormatter__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F8A798] autoupdatingFormatterWithPreset:2];
  v1 = (void *)dayFormatter__dayFormatter;
  dayFormatter__dayFormatter = v0;
}

@end