@interface NSFileManager
@end

@implementation NSFileManager

void __66__NSFileManager_TRIServer__triRemoveNestedEmptyDirectoriesAtPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (rmdir((const char *)[v3 fileSystemRepresentation]) && *__error() != 66)
  {
    v4 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = __error();
      v6 = strerror(*v5);
      int v7 = *__error();
      int v8 = 138543874;
      id v9 = v3;
      __int16 v10 = 2080;
      v11 = v6;
      __int16 v12 = 1024;
      int v13 = v7;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Failed remove directory %{public}@: %s (%d)", (uint8_t *)&v8, 0x1Cu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

uint64_t __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke_24(uint64_t a1, void *a2)
{
}

void __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t __53__NSFileManager_TRIServer__triDiskUsageForDirectory___block_invoke(uint64_t a1, int a2, id obj)
{
  return 0;
}

@end