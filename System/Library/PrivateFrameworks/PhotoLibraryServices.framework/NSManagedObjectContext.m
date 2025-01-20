@interface NSManagedObjectContext
@end

@implementation NSManagedObjectContext

void __75__NSManagedObjectContext_PLManagedObjectContext__pl_resultWithError_block___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __83__NSManagedObjectContext_PLManagedObjectContext__deleteObjectsWithIncrementalSave___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

void __124__NSManagedObjectContext_PLManagedObjectContext__enumerateWithIncrementalSaveUsingObjects_shouldRefreshAfterSave_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v10 = 0;
  char v3 = [v2 save:&v10];
  id v4 = v10;
  id v5 = v10;
  if ((v3 & 1) == 0)
  {
    v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to save incrementally: %@", buf, 0xCu);
    }

    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (!v9) {
      objc_storeStrong(v8, v4);
    }
  }
}

uint64_t __110__NSManagedObjectContext_PLManagedObjectContext__enumerateObjectsFromFetchRequest_count_batchSize_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__NSManagedObjectContext_PLManagedObjectContext__pl_graphCache__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userInfo];
  uint64_t v2 = [v5 objectForKeyedSubscript:@"com.apple.photos.PLMigrationGraphCacheKey"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __61__NSManagedObjectContext_PLManagedObjectContext__pathManager__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userInfo];
  uint64_t v2 = [v5 objectForKeyedSubscript:@"com.apple.photos.PLModelMigratorPathManagerKey"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end