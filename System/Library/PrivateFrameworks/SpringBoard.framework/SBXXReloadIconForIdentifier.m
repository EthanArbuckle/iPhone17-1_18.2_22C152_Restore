@interface SBXXReloadIconForIdentifier
@end

@implementation SBXXReloadIconForIdentifier

void ___SBXXReloadIconForIdentifier_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Reloading icon image for iconID %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v4 = +[SBIconController sharedInstance];
  v5 = [v4 model];
  v6 = [v5 leafIconForIdentifier:*(void *)(a1 + 32)];

  [v6 reloadIconImage];
}

@end