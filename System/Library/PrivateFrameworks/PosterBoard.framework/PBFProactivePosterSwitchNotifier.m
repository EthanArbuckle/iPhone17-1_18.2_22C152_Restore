@interface PBFProactivePosterSwitchNotifier
- (void)posterExtensionDataStore:(id)a3 didUpdateActiveConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6;
@end

@implementation PBFProactivePosterSwitchNotifier

- (void)posterExtensionDataStore:(id)a3 didUpdateActiveConfiguration:(id)a4 associatedConfiguration:(id)a5 reason:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a6;
  id v8 = a4;
  v9 = [v8 role];
  v10 = PBFLogDataStore();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, "Preparing to update proactive poster switch for role %{public}@", buf, 0xCu);
  }

  v11 = [v8 _path];

  v12 = [v11 serverIdentity];
  v13 = [v12 posterUUID];
  v14 = [v13 UUIDString];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F4B280]) initWithLockscreenId:v14 switchMechanism:v7 outcome:&stru_1F2A71F00 duration:0];
  v16 = [MEMORY[0x1E4F4B040] sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __121__PBFProactivePosterSwitchNotifier_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke;
  v18[3] = &unk_1E6980A00;
  id v19 = v9;
  id v17 = v9;
  [v16 logPosterSwitch:v15 completion:v18];
}

void __121__PBFProactivePosterSwitchNotifier_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PBFLogDataStore();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __121__PBFProactivePosterSwitchNotifier_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "Success logging poster switch to proactive for role %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

void __121__PBFProactivePosterSwitchNotifier_posterExtensionDataStore_didUpdateActiveConfiguration_associatedConfiguration_reason___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "Error logging poster switch to proactive for role %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end