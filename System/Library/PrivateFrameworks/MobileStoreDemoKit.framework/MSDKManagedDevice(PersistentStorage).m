@interface MSDKManagedDevice(PersistentStorage)
@end

@implementation MSDKManagedDevice(PersistentStorage)

- (void)getAppDataFolderPathWithReturnError:()PersistentStorage .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 localizedDescription];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "Failed to get document folder URL - Error:  %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)preserveAppDataToPersistentStorageWithReturnError:()PersistentStorage .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[MSDKManagedDevice(PersistentStorage) preserveAppDataToPersistentStorageWithReturnError:]";
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s - Failed to setup XPC connection.", (uint8_t *)&v1, 0xCu);
}

- (void)preserveAppDataToPersistentStorageWithReturnError:()PersistentStorage .cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = [*a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_21EF08000, a3, OS_LOG_TYPE_ERROR, "Failed to preserve app data from %{public}@ to persistent storage - Error:  %{public}@", (uint8_t *)&v6, 0x16u);
}

@end