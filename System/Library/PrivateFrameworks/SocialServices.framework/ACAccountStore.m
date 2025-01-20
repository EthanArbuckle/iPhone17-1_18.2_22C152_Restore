@interface ACAccountStore
@end

@implementation ACAccountStore

void __94__ACAccountStore_SLGoogle__sl_openGoogleAuthenticationSheetWithAccountDescription_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v11 = [v8 objectForKeyedSubscript:@"token"];
  v9 = [v8 objectForKeyedSubscript:@"refreshToken"];
  v10 = [v8 objectForKeyedSubscript:@"username"];

  (*(void (**)(uint64_t, uint64_t, id, void *, void *, id))(v6 + 16))(v6, a2, v11, v9, v10, v7);
}

void __95__ACAccountStore_SLGoogle__sl_openYouTubeAuthenticationSheetWithAccountDescription_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v12 = [v8 objectForKeyedSubscript:@"token"];
  v9 = [v8 objectForKeyedSubscript:@"refreshToken"];
  v10 = [v8 objectForKeyedSubscript:@"username"];
  id v11 = [v8 objectForKeyedSubscript:@"youTubeUsername"];

  (*(void (**)(uint64_t, uint64_t, id, void *, void *, void *, id))(v6 + 16))(v6, a2, v12, v9, v10, v11, v7);
}

void __104__ACAccountStore_SLGoogle__sl_openYouTubeAuthenticationSheetWithUsername_accountDescription_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v12 = [v8 objectForKeyedSubscript:@"token"];
  v9 = [v8 objectForKeyedSubscript:@"refreshToken"];
  v10 = [v8 objectForKeyedSubscript:@"username"];
  id v11 = [v8 objectForKeyedSubscript:@"youTubeUsername"];

  (*(void (**)(uint64_t, uint64_t, id, void *, void *, void *, id))(v6 + 16))(v6, a2, v12, v9, v10, v11, v7);
}

uint64_t __114__ACAccountStore_SLGoogle__sl_openGoogleAuthenticationSheetForAccount_shouldConfirm_delegateClassName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end