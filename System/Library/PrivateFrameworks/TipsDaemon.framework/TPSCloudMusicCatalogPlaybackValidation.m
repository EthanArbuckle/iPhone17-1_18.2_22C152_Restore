@interface TPSCloudMusicCatalogPlaybackValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSCloudMusicCatalogPlaybackValidation

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  id v5 = objc_alloc(MEMORY[0x1E4FB8758]);
  v6 = [MEMORY[0x1E4FB87B8] activeAccount];
  v7 = (void *)[v5 initWithIdentity:v6];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB86B0]) initWithStoreRequestContext:v7];
  [v8 setShouldReturnLastKnownStatusOnly:1];
  v9 = [MEMORY[0x1E4FB86A0] sharedStatusController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__TPSCloudMusicCatalogPlaybackValidation_validateWithCompletion___block_invoke;
  v11[3] = &unk_1E6E6C9C0;
  v13 = v14;
  v11[4] = self;
  id v10 = v4;
  id v12 = v10;
  [v9 performSubscriptionStatusRequest:v8 withCompletionHandler:v11];

  _Block_object_dispose(v14, 8);
}

void __65__TPSCloudMusicCatalogPlaybackValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    v7 = [v5 subscriptionStatus];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 statusType] == 1;
  }
  int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  int v9 = [*(id *)(a1 + 32) BOOLValue];
  id v10 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v8 == v9, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end