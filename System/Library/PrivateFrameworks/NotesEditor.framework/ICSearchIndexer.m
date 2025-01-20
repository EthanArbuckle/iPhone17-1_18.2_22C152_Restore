@interface ICSearchIndexer
@end

@implementation ICSearchIndexer

void __62__ICSearchIndexer_App__mainContextObjectForObjectIDURIString___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  v3 = objc_msgSend(v2, "ic_managedObjectIDForURIString:", *(void *)(a1 + 40));

  if (v3)
  {
    v4 = *(void **)(a1 + 48);
    id v11 = 0;
    uint64_t v5 = [v4 existingObjectWithID:v3 error:&v11];
    v6 = v11;
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;

    if (v6)
    {
      v9 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v3;
        __int16 v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_20BE60000, v9, OS_LOG_TYPE_INFO, "Error fetching object with ID %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_20BE60000, v6, OS_LOG_TYPE_INFO, "No objectID corresponding to objectIDURI: %@", buf, 0xCu);
    }
  }
}

void __42__ICSearchIndexer_App__reindexIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = os_log_create("com.apple.notes", "SearchIndexer");
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__ICSearchIndexer_App__reindexIfNecessary__block_invoke_cold_1(v4);
    }

    [MEMORY[0x263F5AEB0] setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5AF20]];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_20BE60000, v4, OS_LOG_TYPE_INFO, "App completed reindexing", v5, 2u);
    }
  }
}

void __42__ICSearchIndexer_App__reindexIfNecessary__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "App failed to clean up the search index. Will try again on next open", v1, 2u);
}

@end