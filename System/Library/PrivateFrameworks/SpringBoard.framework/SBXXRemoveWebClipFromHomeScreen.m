@interface SBXXRemoveWebClipFromHomeScreen
@end

@implementation SBXXRemoveWebClipFromHomeScreen

void ___SBXXRemoveWebClipFromHomeScreen_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[SBIconController sharedInstance];
  v3 = [v2 model];
  v4 = [v3 bookmarkIconForWebClipIdentifier:*(void *)(a1 + 32)];

  if (v4)
  {
    v5 = [v2 iconManager];
    [v5 uninstallIcon:v4 animate:1];
  }
  else
  {
    v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Unable to find icon with webclip identifier [%{public}@] for removal.", (uint8_t *)&v8, 0xCu);
    }
  }
  [(id)SBApp noteInstalledWebClipsDidChange];
}

@end