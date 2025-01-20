@interface NSError
@end

@implementation NSError

BOOL __47__NSError_FCCKAdditions__fc_isCKErrorWithCode___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

BOOL __60__NSError_FCCKAdditions__fc_isTemporaryNetworkOrServerError__block_invoke(uint64_t a1, unint64_t a2)
{
  BOOL result = 1;
  if (a2 > 0x17 || ((1 << a2) & 0x8000D8) == 0) {
    return a2 == 111;
  }
  return result;
}

BOOL __57__NSError_FCCKAdditions__fc_hasIdentityStillSyncingError__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 111;
}

BOOL __49__NSError_FCCKAdditions__fc_hasIdentityLostError__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 == 112;
}

BOOL __60__NSError_FCCKAdditions__fc_hasXPCInterruptedOrInvalidError__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 domain];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v4) {
    BOOL v5 = (([v2 code] - 4097) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

id __66__NSError_FCErrorAdditions__fc_missingAssetErrorWithAssetHandles___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 remoteURL];
  v3 = [v2 absoluteString];

  return v3;
}

uint64_t __66__NSError_FCErrorAdditions__fc_missingAssetErrorWithAssetHandles___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 downloadError];
}

uint64_t __46__NSError_FCAdditions__fc_isCancellationError__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_isCancellationError");
}

uint64_t __55__NSError_FCAdditions__fc_isOfflineErrorOfflineReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_isOfflineErrorOfflineReason:", *(void *)(*(void *)(a1 + 32) + 8) + 24);
}

id __54__NSError_FCAdditions__fc_errorWithMaximumRetryAfter___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

__CFString *__54__NSError_FCAdditions__fc_errorWithMaximumRetryAfter___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  v3 = @"FCErrorRetryAfter";
  int v4 = [v2 objectForKeyedSubscript:@"FCErrorRetryAfter"];

  if (v4
    || ([*(id *)(a1 + 32) userInfo],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v3 = (__CFString *)*MEMORY[0x1E4F19C60],
        [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = v3;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

id __54__NSError_FCAdditions__fc_errorWithMaximumRetryAfter___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __54__NSError_FCAdditions__fc_errorWithMaximumRetryAfter___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __53__NSError_FCAdditions__fc_failedDueToTaskConstraints__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fc_failedDueToTaskConstraints");
}

@end