@interface ICSearchIndexer(App)
- (id)mainContextObjectForObjectIDURIString:()App;
- (void)reindexIfNecessary;
@end

@implementation ICSearchIndexer(App)

- (id)mainContextObjectForObjectIDURIString:()App
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  id v32 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [a1 dataSources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v10 = v9;
          v11 = [v10 mainThreadContext];
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __62__ICSearchIndexer_App__mainContextObjectForObjectIDURIString___block_invoke;
          v18[3] = &unk_2640B88B8;
          id v12 = v10;
          id v19 = v12;
          id v20 = v4;
          v22 = &v27;
          id v13 = v11;
          id v21 = v13;
          [v13 performBlockAndWait:v18];
          BOOL v14 = v28[5] == 0;

          if (!v14) {
            goto LABEL_14;
          }
        }
        else
        {
          v15 = os_log_create("com.apple.notes", "SearchIndexer");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v9;
            _os_log_impl(&dword_20BE60000, v15, OS_LOG_TYPE_INFO, "Indexer data source does not vend main thread context: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v6);
  }
LABEL_14:

  id v16 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v16;
}

- (void)reindexIfNecessary
{
  v0 = [MEMORY[0x263F5AEB0] objectForKey:*MEMORY[0x263F5AF20]];
  int v1 = [v0 BOOLValue];

  if (v1)
  {
    v2 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_20BE60000, v2, OS_LOG_TYPE_INFO, "App needs to clean up the search index", v4, 2u);
    }

    v3 = [MEMORY[0x263F5ACD0] reindexer];
    [v3 reindexAllSearchableItemsWithCompletionHandler:&__block_literal_global_11];
  }
}

@end