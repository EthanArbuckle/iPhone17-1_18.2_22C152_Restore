@interface UAPasteboardGeneration
- (BOOL)addItem:(id)a3;
- (BOOL)addType:(id)a3 toItemAtIndex:(unint64_t)a4;
- (NSArray)items;
- (NSMutableDictionary)typePaths;
- (NSSet)allTypes;
- (UAPasteboardGeneration)initWithGeneration:(unint64_t)a3;
- (id)getTypePaths;
- (unint64_t)generation;
- (void)fetchTypeURL:(id)a3;
- (void)setAllTypes:(id)a3;
- (void)setItems:(id)a3;
- (void)setTypePaths:(id)a3;
@end

@implementation UAPasteboardGeneration

- (UAPasteboardGeneration)initWithGeneration:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UAPasteboardGeneration;
  v4 = [(UAPasteboardGeneration *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_generation = a3;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    [(UAPasteboardGeneration *)v5 setItems:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    [(UAPasteboardGeneration *)v5 setAllTypes:v7];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(UAPasteboardGeneration *)v5 setTypePaths:v8];
  }
  return v5;
}

- (id)getTypePaths
{
  v2 = [(UAPasteboardGeneration *)self typePaths];
  v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)addItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UAPasteboardGeneration *)self items];
  id v6 = [v5 arrayByAddingObject:v4];
  [(UAPasteboardGeneration *)self setItems:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = objc_msgSend(v4, "types", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v12) type];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v14 = [(UAPasteboardGeneration *)self allTypes];
  v15 = [v14 setByAddingObjectsFromSet:v7];
  [(UAPasteboardGeneration *)self setAllTypes:v15];

  return 1;
}

- (BOOL)addType:(id)a3 toItemAtIndex:(unint64_t)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(UAPasteboardGeneration *)self items];
  unint64_t v8 = [v7 count];

  if (v8 <= a4)
  {
    long long v18 = [(UAPasteboardGeneration *)self items];
    uint64_t v19 = [v18 count];

    long long v20 = _uaGetLogForCategory(@"pasteboard-client");
    v13 = (UAPasteboardItem *)v20;
    if (v19 == a4)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v21 = [(UAPasteboardGeneration *)self generation];
        uint64_t v22 = [v6 type];
        int v37 = 134218498;
        unint64_t v38 = a4;
        __int16 v39 = 2048;
        unint64_t v40 = v21;
        __int16 v41 = 2112;
        v42 = v22;
        _os_log_impl(&dword_1B3DF6000, &v13->super, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Adding type to index %lu for generation %lu: %@", (uint8_t *)&v37, 0x20u);
      }
      v13 = objc_alloc_init(UAPasteboardItem);
      [(UAPasteboardItem *)v13 addType:v6];
      v23 = [(UAPasteboardGeneration *)self allTypes];
      v24 = [v6 type];
      v25 = [v23 setByAddingObject:v24];
      [(UAPasteboardGeneration *)self setAllTypes:v25];

      BOOL v17 = [(UAPasteboardGeneration *)self addItem:v13];
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v26 = [NSNumber numberWithUnsignedInteger:a4];
        v27 = NSNumber;
        v28 = [(UAPasteboardGeneration *)self items];
        v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
        int v37 = 138412546;
        unint64_t v38 = (unint64_t)v26;
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v29;
        _os_log_impl(&dword_1B3DF6000, &v13->super, OS_LOG_TYPE_ERROR, "[Local Pasteboard] Error adding type to item %@, cur count: %@", (uint8_t *)&v37, 0x16u);
      }
      BOOL v17 = 0;
    }
  }
  else
  {
    uint64_t v9 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v10 = [(UAPasteboardGeneration *)self generation];
      uint64_t v11 = [v6 type];
      int v37 = 134218498;
      unint64_t v38 = a4;
      __int16 v39 = 2048;
      unint64_t v40 = v10;
      __int16 v41 = 2112;
      v42 = v11;
      _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Adding type to index %lu for generation %lu: %@", (uint8_t *)&v37, 0x20u);
    }
    uint64_t v12 = [(UAPasteboardGeneration *)self items];
    v13 = [v12 objectAtIndex:a4];

    [(UAPasteboardItem *)v13 addType:v6];
    v14 = [(UAPasteboardGeneration *)self allTypes];
    v15 = [v6 type];
    v16 = [v14 setByAddingObject:v15];
    [(UAPasteboardGeneration *)self setAllTypes:v16];

    BOOL v17 = 1;
  }

  id v30 = v6;
  if ([v30 conformsToProtocol:&unk_1F0CC4200]
    && [v30 preferFileRep])
  {
    if (objc_opt_respondsToSelector())
    {
      v31 = [v30 getFileName];
      if (v31)
      {
        v32 = [(UAPasteboardGeneration *)self typePaths];
        v33 = [v30 uuid];
        [v32 setObject:v31 forKey:v33];
      }
    }
  }
  else
  {
    v34 = [v30 type];
    int v35 = [v34 isEqualToString:@"public.file-url"];

    if (v35) {
      [(UAPasteboardGeneration *)self fetchTypeURL:v30];
    }
  }

  return v17;
}

- (void)fetchTypeURL:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 getFileName];
    if (v5)
    {
      id v6 = [(UAPasteboardGeneration *)self typePaths];
      id v7 = [v4 uuid];
      [v6 setObject:v5 forKey:v7];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__UAPasteboardGeneration_fetchTypeURL___block_invoke;
    v8[3] = &unk_1E60839B0;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v9 getDataWithCompletionBlock:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __39__UAPasteboardGeneration_fetchTypeURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 open];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v5 = [v3 read:v13 maxLength:1024];
  if (v5 >= 1)
  {
    for (uint64_t i = v5; i > 0; uint64_t i = [v3 read:v13 maxLength:1024])
      [v4 appendBytes:v13 length:i];
  }
  id v7 = [MEMORY[0x1E4F1CB10] URLWithDataRepresentation:v4 relativeToURL:0];
  unint64_t v8 = [v7 lastPathComponent];
  if (v8)
  {
    id v9 = _uaGetLogForCategory(@"pasteboard-client");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_DEBUG, "[Local Pasteboard] Saving file name: %@", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v11 = [WeakRetained typePaths];
    uint64_t v12 = [*(id *)(a1 + 32) uuid];
    [v11 setObject:v8 forKey:v12];
  }
}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSSet)allTypes
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAllTypes:(id)a3
{
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setItems:(id)a3
{
}

- (NSMutableDictionary)typePaths
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTypePaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typePaths, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_allTypes, 0);
}

@end