@interface SBXXSetAllApplicationsShowSyncIndicator
@end

@implementation SBXXSetAllApplicationsShowSyncIndicator

void ___SBXXSetAllApplicationsShowSyncIndicator_block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 48))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = ___SBXXSetAllApplicationsShowSyncIndicator_block_invoke_2;
    v15[3] = &unk_1E6AF5290;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = ___SBXXSetAllApplicationsShowSyncIndicator_block_invoke_98;
    v12 = &unk_1E6AF5290;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    v2 = +[SBDaemonRequest requestWithEnabler:v15 disabler:&v9];
    v3 = SBLogStatusBarish();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v4;
      __int16 v20 = 2114;
      uint64_t v21 = v5;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "SBDaemonRequest: adding %{public}@ for %{public}@", buf, 0x16u);
    }

    +[SBDaemonHandler addRequest:forKey:forDaemonPid:](SBDaemonHandler, "addRequest:forKey:forDaemonPid:", v2, *(void *)(a1 + 32), *(unsigned int *)(a1 + 52), v9, v10, v11, v12);
  }
  else
  {
    v6 = SBLogStatusBarish();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "SBDaemonRequest: removing %{public}@ for %{public}@", buf, 0x16u);
    }

    +[SBDaemonHandler removeRequestForKey:*(void *)(a1 + 32) forDaemonPid:*(unsigned int *)(a1 + 52)];
  }
}

void ___SBXXSetAllApplicationsShowSyncIndicator_block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = SBLogStatusBarish();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "SBDaemonRequest: enabling %{public}@ for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = [(id)SBApp statusBarStateAggregator];
  [v5 setShowsSyncActivityIndicator:1];
}

void ___SBXXSetAllApplicationsShowSyncIndicator_block_invoke_98(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = SBLogStatusBarish();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "SBDaemonRequest: disabling %{public}@ for %{public}@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = [(id)SBApp statusBarStateAggregator];
  [v5 setShowsSyncActivityIndicator:0];
}

@end