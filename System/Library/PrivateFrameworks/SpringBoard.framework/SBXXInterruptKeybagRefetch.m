@interface SBXXInterruptKeybagRefetch
@end

@implementation SBXXInterruptKeybagRefetch

void ___SBXXInterruptKeybagRefetch_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(id)SBApp isKeybagRefetchTransactionActive])
  {
    v2 = [NSString stringWithFormat:@"interruptKeybagRefetch from %@", *(void *)(a1 + 32)];
    char v3 = SBWorkspaceInterruptBusynessIfPossible(v2);

    if (v3) {
      return;
    }
    v4 = SBLogWorkspace();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = BSPrettyFunctionName();
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      v7 = "%{public}@ - failed to interrupt keybag refetch (requested from %{public}@)";
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, v7, buf, 0x16u);
    }
  }
  else
  {
    v4 = SBLogWorkspace();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = BSPrettyFunctionName();
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      v7 = "%{public}@ - no keybag refetch active (requested from %{public}@)";
      goto LABEL_7;
    }
  }
}

@end