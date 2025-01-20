@interface PLFirstUnlockProtection
+ (void)waitUntilFirstUnlock;
@end

@implementation PLFirstUnlockProtection

+ (void)waitUntilFirstUnlock
{
  if (MKBDeviceUnlockedSinceBoot() != 1)
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    int out_token = -1;
    v3 = +[PLConcurrencyLimiter sharedLimiter];
    v4 = [v3 sharedUtilityQueue];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __47__PLFirstUnlockProtection_waitUntilFirstUnlock__block_invoke;
    handler[3] = &unk_1E5869078;
    v5 = v2;
    v11 = v5;
    uint32_t v6 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v4, handler);

    v7 = PLBackendGetLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Failed to register for first unlock notification.", v9, 2u);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Will wait for first unlock...", v9, 2u);
      }

      while (MKBDeviceUnlockedSinceBoot() != 1)
        dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      notify_cancel(out_token);
    }
  }
}

intptr_t __47__PLFirstUnlockProtection_waitUntilFirstUnlock__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Received first unlock notification.", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end