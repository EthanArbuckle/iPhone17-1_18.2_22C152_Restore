@interface NSFileManager
@end

@implementation NSFileManager

uint64_t __53__NSFileManager_MobileBackup___removeAllPaths_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  uint64_t v6 = [v4 removeItemAtPath:v5 error:a3];

  return v6;
}

uint64_t __54__NSFileManager_MobileBackup___migratePaths_to_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  v8 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
  uint64_t v9 = [v6 moveItemAtPath:v7 toPath:v8 error:a3];

  return v9;
}

@end