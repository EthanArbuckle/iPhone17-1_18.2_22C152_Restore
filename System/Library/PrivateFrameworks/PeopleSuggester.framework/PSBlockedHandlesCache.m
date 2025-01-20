@interface PSBlockedHandlesCache
@end

@implementation PSBlockedHandlesCache

uint64_t __51___PSBlockedHandlesCache_sharedBlockedHandlesCache__block_invoke()
{
  v0 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEFAULT, "_PSBlockedHandlesCache beginning shared instance bringup", v4, 2u);
  }

  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedBlockedHandlesCache_cache;
  sharedBlockedHandlesCache_cache = v1;

  return [(id)sharedBlockedHandlesCache_cache beginSyncingWithTU];
}

void __65___PSBlockedHandlesCache_handlePrivacyManagerChangeNotification___block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"handlePrivacyManagerChangeNotification:" qosClass:17];
  v2 = (void *)handlePrivacyManagerChangeNotification___pasExprOnceResult;
  handlePrivacyManagerChangeNotification___pasExprOnceResult = v1;
}

uint64_t __65___PSBlockedHandlesCache_handlePrivacyManagerChangeNotification___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) rebuildCacheFromPrivacyManager];
}

id __56___PSBlockedHandlesCache_rebuildCacheFromPrivacyManager__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 type];
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = [v2 email];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v5 = [v2 phoneNumber];
    v4 = [v5 digits];
  }

  return v4;
}

uint64_t __57___PSBlockedHandlesCache_rebuildCacheWithBlockedHandles___block_invoke()
{
  return 0;
}

uint64_t __57___PSBlockedHandlesCache_rebuildCacheWithBlockedHandles___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __57___PSBlockedHandlesCache_rebuildCacheWithBlockedHandles___block_invoke_3(uint64_t a1, uint64_t a2)
{
  int v3 = [*(id *)(a1 + 32) computeHashesForString:a2 reuse:0];
  uint64_t v4 = [*(id *)(a1 + 32) getWithHashes:v3];

  return v4;
}

@end