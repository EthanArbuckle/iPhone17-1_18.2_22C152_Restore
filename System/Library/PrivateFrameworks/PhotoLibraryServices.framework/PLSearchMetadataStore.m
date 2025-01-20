@interface PLSearchMetadataStore
- (PLSearchMetadataStore)initWithPath:(id)a3;
- (id)currentSearchMetadata;
- (void)deleteStore;
- (void)updateSearchMetadataTo:(id)a3;
@end

@implementation PLSearchMetadataStore

- (PLSearchMetadataStore)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSearchMetadataStore;
  v6 = [(PLSearchMetadataStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storePath, a3);
  }

  return v7;
}

- (id)currentSearchMetadata
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:self->_storePath];
}

- (void).cxx_destruct
{
}

- (void)updateSearchMetadataTo:(id)a3
{
  id v4 = a3;
  id v5 = [(PLSearchMetadataStore *)self currentSearchMetadata];
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __48__PLSearchMetadataStore_updateSearchMetadataTo___block_invoke;
  v16 = &unk_1E5873FF0;
  id v7 = v5;
  id v17 = v7;
  id v8 = v6;
  id v18 = v8;
  [v4 enumerateKeysAndObjectsUsingBlock:&v13];

  if (objc_msgSend(v8, "count", v13, v14, v15, v16))
  {
    objc_super v9 = (void *)[v7 mutableCopy];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v12 = v11;

    [v12 addEntriesFromDictionary:v8];
    [v12 writeToFile:self->_storePath atomically:1];
  }
}

void __48__PLSearchMetadataStore_updateSearchMetadataTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (([v6 isEqual:v5] & 1) == 0) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v7];
  }
}

- (void)deleteStore
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v3 fileExistsAtPath:self->_storePath])
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    storePath = self->_storePath;
    id v8 = 0;
    char v6 = [v4 removeItemAtPath:storePath error:&v8];
    id v7 = v8;

    if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v7;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error deleting search metadata store: %@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = 0;
  }
}

@end