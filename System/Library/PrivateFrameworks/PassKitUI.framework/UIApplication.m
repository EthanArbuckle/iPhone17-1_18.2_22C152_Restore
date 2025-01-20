@interface UIApplication
@end

@implementation UIApplication

void __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke_2(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke_3;
  v1[3] = &unk_1E59CEDA0;
  long long v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v1);
}

uint64_t __73__UIApplication_PKUIUtilities__pkui_resetSharedRootAuthenticationContext__block_invoke_3(uint64_t result)
{
  uint64_t v1 = *MEMORY[0x1E4FB2748];
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) != *MEMORY[0x1E4FB2748])
  {
    uint64_t v2 = result;
    result = objc_msgSend(*(id *)(result + 32), "endBackgroundTask:");
    *(void *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = v1;
  }
  return result;
}

@end