@interface ML3MultiUserDaemonMusicLibraryResourcesManager
@end

@implementation ML3MultiUserDaemonMusicLibraryResourcesManager

void __66___ML3MultiUserDaemonMusicLibraryResourcesManager__notifyClients___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ - Posting notification %{public}@", (uint8_t *)&v6, 0x16u);
  }

  v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 postNotificationName:*(void *)(a1 + 40) object:0 userInfo:0 deliverImmediately:1];
}

uint64_t __79___ML3MultiUserDaemonMusicLibraryResourcesManager_setCurrentActiveAccountDSID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __75___ML3MultiUserDaemonMusicLibraryResourcesManager_currentActiveAccountDSID__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];

  return MEMORY[0x1F41817F8]();
}

void __84___ML3MultiUserDaemonMusicLibraryResourcesManager__blockingCurrentActiveAccountDSID__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) currentActiveAccountDSID];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end