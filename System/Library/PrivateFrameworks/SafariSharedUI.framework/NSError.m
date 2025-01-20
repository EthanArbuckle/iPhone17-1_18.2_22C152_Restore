@interface NSError
@end

@implementation NSError

void __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v7 = [a2 SSID];
  id v8 = [v3 _errorMessageForFailureReason:v4 failingURLString:v5 providerName:v6 networkName:v7 isUsingEthernetNetwork:*(unsigned __int8 *)(a1 + 72)];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    v9 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v9();
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E5E45E88;
    id v6 = *(id *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v14 = v6;
    v10[4] = v7;
    id v11 = v8;
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 64);
    char v15 = *(unsigned char *)(a1 + 80);
    [v5 getSubscriptionUserFacingName:a2 completion:v10];
  }
}

void __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v4();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) _errorMessageForFailureReason:*(void *)(a1 + 40) failingURLString:*(void *)(a1 + 48) providerName:*(void *)(a1 + 56) networkName:a2 isUsingEthernetNetwork:*(unsigned __int8 *)(a1 + 72)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

@end