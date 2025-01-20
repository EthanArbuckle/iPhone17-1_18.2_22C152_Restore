@interface SLGoogleAuthController
+ (id)_identityFromUsername:(id)a3 displayName:(id)a4 token:(id)a5 refreshToken:(id)a6 idToken:(id)a7 grantedDataclasses:(id)a8;
+ (id)googleAuthControllerWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5 completion:(id)a6;
+ (id)googleAuthControllerWithPresentationBlock:(id)a3 completion:(id)a4;
+ (id)googleAuthControllerWithYouTubeUsername:(id)a3 presentationBlock:(id)a4 completion:(id)a5;
+ (void)_presentInternetOfflineError;
+ (void)_presentUsernameMismatchAlert;
- (SLGoogleAuthController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5;
- (SLGoogleAuthController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4;
- (SLGoogleAuthController)initWithClientID:(id)a3 emailOnlyScope:(BOOL)a4 presentationBlock:(id)a5;
- (SLGoogleAuthController)initWithEmailOnlyScope:(BOOL)a3 presentationBlock:(id)a4;
- (id)_initWithAccount:(id)a3 accountStore:(id)a4 username:(id)a5 youTube:(BOOL)a6 emailOnly:(BOOL)a7 clientID:(id)a8 presentationBlock:(id)a9 completion:(id)a10;
- (id)_redirectPathForURI:(id)a3;
- (id)_webClient;
- (void)_completeWithIdentity:(id)a3 error:(id)a4;
- (void)_didRedirectToURL:(id)a3 codeVerifier:(id)a4;
- (void)_dismissAndCompleteWithIdentity:(id)a3 error:(id)a4;
- (void)cancelAuthorization;
- (void)dealloc;
@end

@implementation SLGoogleAuthController

- (id)_webClient
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F17860]) initWithClientID:self->_clientID];

  return v2;
}

- (SLGoogleAuthController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4
{
  return (SLGoogleAuthController *)[(SLGoogleAuthController *)self _initWithAccount:0 accountStore:0 username:0 youTube:0 emailOnly:0 clientID:0 presentationBlock:a4 completion:0];
}

- (SLGoogleAuthController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5
{
  return (SLGoogleAuthController *)[(SLGoogleAuthController *)self _initWithAccount:a3 accountStore:a4 username:0 youTube:0 emailOnly:0 clientID:0 presentationBlock:a5 completion:0];
}

- (SLGoogleAuthController)initWithEmailOnlyScope:(BOOL)a3 presentationBlock:(id)a4
{
  return (SLGoogleAuthController *)[(SLGoogleAuthController *)self _initWithAccount:0 accountStore:0 username:0 youTube:0 emailOnly:a3 clientID:0 presentationBlock:a4 completion:0];
}

- (SLGoogleAuthController)initWithClientID:(id)a3 emailOnlyScope:(BOOL)a4 presentationBlock:(id)a5
{
  return (SLGoogleAuthController *)[(SLGoogleAuthController *)self _initWithAccount:0 accountStore:0 username:0 youTube:0 emailOnly:a4 clientID:a3 presentationBlock:a5 completion:0];
}

+ (id)googleAuthControllerWithPresentationBlock:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithAccount:0 accountStore:0 username:0 youTube:0 emailOnly:0 clientID:0 presentationBlock:v7 completion:v6];

  return v8;
}

+ (id)googleAuthControllerWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) _initWithAccount:v13 accountStore:v12 username:0 youTube:0 emailOnly:0 clientID:0 presentationBlock:v11 completion:v10];

  return v14;
}

+ (id)googleAuthControllerWithYouTubeUsername:(id)a3 presentationBlock:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) _initWithAccount:0 accountStore:0 username:v10 youTube:1 emailOnly:0 clientID:0 presentationBlock:v9 completion:v8];

  return v11;
}

- (id)_initWithAccount:(id)a3 accountStore:(id)a4 username:(id)a5 youTube:(BOOL)a6 emailOnly:(BOOL)a7 clientID:(id)a8 presentationBlock:(id)a9 completion:(id)a10
{
  BOOL v11 = a7;
  BOOL v53 = a6;
  id v16 = a3;
  id v55 = a4;
  id v17 = a5;
  id v54 = a8;
  id v18 = a9;
  id v19 = a10;
  v61.receiver = self;
  v61.super_class = (Class)SLGoogleAuthController;
  v20 = [(SLWebAuthController *)&v61 _init];
  if (!v20) {
    goto LABEL_14;
  }
  BOOL v49 = v11;
  id v56 = v17;
  _SLLog();
  objc_storeStrong(v20 + 132, a3);
  objc_storeStrong(v20 + 133, a4);
  uint64_t v21 = MEMORY[0x23EC954E0](v18);
  id v22 = v20[134];
  v20[134] = (id)v21;

  objc_storeStrong(v20 + 136, a8);
  objc_msgSend(v20, "setCompletion:", v19, v20);
  v23 = [v20 _webClient];
  char v24 = objc_opt_respondsToSelector();

  id v52 = v16;
  if (v24)
  {
    v25 = NSString;
    v26 = [v20 _webClient];
    v27 = [v26 clientRedirectForAppOpenURL];
    v28 = [v25 stringWithFormat:@"%@:/", v27];

    id v16 = v52;
    if (!v52) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v28 = 0;
  if (v16)
  {
LABEL_6:
    uint64_t v29 = [v16 username];

    id v56 = (id)v29;
  }
LABEL_7:
  v30 = [MEMORY[0x263F08C38] UUID];
  v31 = [v30 UUIDString];

  v32 = [v20 _webClient];
  v33 = v32;
  id v50 = v19;
  id v51 = v18;
  if (v53)
  {
    uint64_t v34 = [v32 youTubeScope];
  }
  else
  {
    if (v49) {
      [v32 emailScope];
    }
    else {
    uint64_t v34 = [v32 defaultScope];
    }
  }
  v35 = (void *)v34;

  v36 = objc_msgSend(v31, "sl_urlEncodedSHA256");
  v37 = (void *)MEMORY[0x263F17858];
  v38 = [v20 _webClient];
  v39 = [v38 clientID];
  v40 = [v20 _webClient];
  v41 = [v40 authRequestURL];
  v42 = [v37 urlForClientID:v39 redirectURI:v28 scope:v35 username:v56 authRequestURL:v41 codeChallenge:v36];

  _SLLog();
  id v43 = objc_alloc(MEMORY[0x263F17828]);
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke;
  v57[3] = &unk_264D501B0;
  id v58 = 0;
  v44 = v20;
  v59 = v44;
  id v60 = v31;
  id v45 = v31;
  v46 = objc_msgSend(v43, "initForPermissionToAccessURL:fromURLString:completion:", v42, @"https://gil.apple.com/", v57, v42);
  v47 = v44;

  id v17 = v56;
  id v18 = v51;
  id v16 = v52;
  id v19 = v50;
LABEL_14:

  return v20;
}

void __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [NSNumber numberWithInt:v5 != 0];
  _SLLog();

  _SLLog();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_2;
  block[3] = &unk_264D50188;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 1080);
    _SLLog();
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    id v21 = *(id *)(a1 + 40);
    id v2 = objc_alloc(MEMORY[0x263EFC480]);
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = objc_msgSend((id)v17[5], "_webClient", v11);
    id v5 = [v4 clientRedirectForAppOpenURL];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_27;
    v12[3] = &unk_264D50160;
    v15 = &v16;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 40);
    uint64_t v6 = [v2 initWithURL:v3 callbackURLScheme:v5 usingEphemeralSession:1 completionHandler:v12];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 1080);
    *(void *)(v7 + 1080) = v6;

    [*(id *)(*(void *)(a1 + 40) + 1080) start];
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    [v9 _completeWithIdentity:0 error:v10];
  }
}

void __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_27(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _SLLog();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_2_31;
    block[3] = &unk_264D50138;
    id v6 = v5;
    uint64_t v7 = a1[6];
    id v13 = v6;
    uint64_t v14 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) _didRedirectToURL:a2 codeVerifier:a1[4]];
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
  uint64_t v10 = a1[5];
  uint64_t v11 = *(void **)(v10 + 1080);
  *(void *)(v10 + 1080) = 0;
}

void __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_2_31(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) domain];
  if (![v2 isEqualToString:*MEMORY[0x263EFC360]])
  {

    goto LABEL_5;
  }
  uint64_t v3 = [*(id *)(a1 + 32) code];

  if (v3 != 1)
  {
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  _SLLog();
  uint64_t v4 = -1;
LABEL_6:
  id v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F178B8];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v12 = *MEMORY[0x263F08608];
  v13[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v9 = [v5 errorWithDomain:v6 code:v4 userInfo:v8];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _dismissAndCompleteWithIdentity:0 error:v9];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

- (void)cancelAuthorization
{
}

- (void)dealloc
{
  [(ASWebAuthenticationSession *)self->_authenticationSession cancel];
  v3.receiver = self;
  v3.super_class = (Class)SLGoogleAuthController;
  [(SLGoogleAuthController *)&v3 dealloc];
}

- (id)_redirectPathForURI:(id)a3
{
  if (a3)
  {
    objc_super v3 = objc_msgSend(NSURL, "URLWithString:");
    uint64_t v4 = [v3 host];
    if (!v4)
    {
      id v5 = [v3 path];
      int v6 = [v5 hasPrefix:@"/"];

      uint64_t v7 = [v3 path];
      uint64_t v4 = v7;
      if (v6)
      {
        uint64_t v8 = [v7 substringFromIndex:1];

        uint64_t v4 = (void *)v8;
      }
    }
    id v9 = NSString;
    uint64_t v10 = [v3 scheme];
    uint64_t v11 = [v9 stringWithFormat:@"%@://%@", v10, v4];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)_identityFromUsername:(id)a3 displayName:(id)a4 token:(id)a5 refreshToken:(id)a6 idToken:(id)a7 grantedDataclasses:(id)a8
{
  id v8 = a3;
  if (a3)
  {
    id v13 = (objc_class *)MEMORY[0x263F17868];
    id v14 = a8;
    id v15 = a7;
    id v16 = a6;
    id v17 = a5;
    id v18 = a4;
    id v19 = v8;
    id v8 = (id)[[v13 alloc] initWithUsername:v19 token:v17 displayName:v18 refreshToken:v16 youTubeUsername:0 idToken:v15 grantedDataclasses:v14];
  }

  return v8;
}

- (void)_didRedirectToURL:(id)a3 codeVerifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  _SLLog();
  id v8 = objc_msgSend(MEMORY[0x263F17858], "authCodeFromRedirectURL:", v7, v7);

  if (v6 && v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F17870]);
    uint64_t v10 = [(SLGoogleAuthController *)self _webClient];
    uint64_t v11 = (void *)[v9 initWithWebClient:v10];

    uint64_t v12 = [(SLGoogleAuthController *)self _webClient];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = NSString;
      id v15 = [(SLGoogleAuthController *)self _webClient];
      id v16 = [v15 clientRedirectForAppOpenURL];
      id v17 = [v14 stringWithFormat:@"%@:/", v16];
    }
    else
    {
      id v17 = 0;
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke;
    v19[3] = &unk_264D50250;
    v19[4] = self;
    [v11 exchangeAuthCode:v8 usingRedirect:v17 codeVerifier:v6 forAccountResponse:v19];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_5;
    block[3] = &unk_264D50278;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  _SLLog();
  if (*(void *)(*(void *)(a1 + 32) + 1056))
  {
    uint64_t v7 = objc_msgSend(v5, "token", v6);
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = [v5 refreshToken];
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        uint64_t v11 = [v5 usernames];
        uint64_t v12 = [v11 firstObject];

        if (v12)
        {
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          char v13 = [v5 usernames];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v57 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v54;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v54 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v53 + 1) + 8 * i);
                id v19 = [*(id *)(*(void *)(a1 + 32) + 1056) username];
                uint64_t v20 = [v19 compare:v18 options:1];

                if (!v20)
                {

                  goto LABEL_16;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v57 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          id v21 = [*(id *)(*(void *)(a1 + 32) + 1056) username];
          id v22 = [v5 usernames];
          id v45 = [v22 firstObject];
          _SLLog();

          +[SLGoogleAuthController _presentUsernameMismatchAlert];
          [v5 setToken:0];
        }
      }
      else
      {
      }
    }
  }
LABEL_16:
  if (!*(void *)(*(void *)(a1 + 32) + 1056)) {
    goto LABEL_22;
  }
  uint64_t v23 = [v5 token];
  if (!v23) {
    goto LABEL_22;
  }
  char v24 = (void *)v23;
  uint64_t v25 = [v5 refreshToken];
  if (!v25)
  {

    goto LABEL_22;
  }
  v26 = (void *)v25;
  v27 = [v5 usernames];
  v28 = [v27 firstObject];

  if (!v28)
  {
LABEL_22:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_4;
    block[3] = &unk_264D50228;
    uint64_t v44 = *(void *)(a1 + 32);
    id v47 = v5;
    uint64_t v48 = v44;
    id v49 = v6;
    id v33 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v43 = v47;
    goto LABEL_23;
  }
  id v29 = objc_alloc(MEMORY[0x263EFB200]);
  v30 = [v5 token];
  v31 = [v5 refreshToken];
  v32 = [v5 expiryDate];
  id v33 = (id)[v29 initWithOAuth2Token:v30 refreshToken:v31 expiryDate:v32];

  [*(id *)(*(void *)(a1 + 32) + 1056) setCredential:v33];
  uint64_t v34 = [v5 usernames];
  v35 = [v34 firstObject];
  [*(id *)(*(void *)(a1 + 32) + 1056) setUsername:v35];

  v36 = *(void **)(*(void *)(a1 + 32) + 1056);
  v37 = [v5 grantedDataclasses];
  [v36 setAccountProperty:v37 forKey:*MEMORY[0x263EFAD88]];

  v38 = *(void **)(*(void *)(a1 + 32) + 1056);
  v39 = [v5 displayName];
  [v38 setAccountProperty:v39 forKey:*MEMORY[0x263EFAD80]];

  _SLLog();
  uint64_t v40 = *(void *)(a1 + 32);
  v41 = *(void **)(v40 + 1064);
  uint64_t v42 = *(void *)(v40 + 1056);
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_2;
  v50[3] = &unk_264D50200;
  id v51 = v5;
  uint64_t v52 = v40;
  id v43 = v5;
  [v41 saveAccount:v42 withCompletionHandler:v50];

LABEL_23:
}

void __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_3;
  v9[3] = &unk_264D501D8;
  char v13 = a2;
  id v10 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v10 = *(void *)(a1 + 32);
  _SLLog();

  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = objc_msgSend(*(id *)(a1 + 40), "usernames", v9, v10);
    objc_super v3 = [v2 firstObject];
    uint64_t v4 = [*(id *)(a1 + 40) displayName];
    id v5 = [*(id *)(a1 + 40) token];
    id v6 = [*(id *)(a1 + 40) refreshToken];
    uint64_t v7 = [*(id *)(a1 + 40) idToken];
    id v8 = [*(id *)(a1 + 40) grantedDataclasses];
    id v11 = +[SLGoogleAuthController _identityFromUsername:v3 displayName:v4 token:v5 refreshToken:v6 idToken:v7 grantedDataclasses:v8];
  }
  else
  {
    id v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "_dismissAndCompleteWithIdentity:error:", v11, *(void *)(a1 + 32), v9, v10);
}

void __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) usernames];
  objc_super v3 = [v2 firstObject];
  uint64_t v4 = [*(id *)(a1 + 32) displayName];
  id v5 = [*(id *)(a1 + 32) token];
  id v6 = [*(id *)(a1 + 32) refreshToken];
  uint64_t v7 = [*(id *)(a1 + 32) idToken];
  id v8 = [*(id *)(a1 + 32) grantedDataclasses];
  id v9 = +[SLGoogleAuthController _identityFromUsername:v3 displayName:v4 token:v5 refreshToken:v6 idToken:v7 grantedDataclasses:v8];

  [*(id *)(a1 + 40) _dismissAndCompleteWithIdentity:v9 error:*(void *)(a1 + 48)];
}

uint64_t __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissAndCompleteWithIdentity:0 error:0];
}

- (void)_dismissAndCompleteWithIdentity:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  _SLLog();
  [(ASWebAuthenticationSession *)self->_authenticationSession cancel];
  _SLLog();
  [(SLGoogleAuthController *)self _completeWithIdentity:v7 error:v6];
}

- (void)_completeWithIdentity:(id)a3 error:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v12 = v6;
  id v11 = v13;
  _SLLog();
  if (!v6) {
    goto LABEL_6;
  }
  id v7 = objc_msgSend(v6, "domain", v13, v6);
  if ([v7 isEqualToString:*MEMORY[0x263F08570]])
  {
    uint64_t v8 = [v6 code];

    if (v8 != -1009) {
      goto LABEL_6;
    }
    +[SLGoogleAuthController _presentInternetOfflineError];
    id v7 = v6;
    id v6 = 0;
  }

LABEL_6:
  id v9 = [(SLWebAuthController *)self completion];

  if (v9)
  {
    uint64_t v10 = [(SLWebAuthController *)self completion];
    ((void (**)(void, id, id))v10)[2](v10, v13, v6);

    [(SLWebAuthController *)self setCompletion:0];
  }
  else
  {
    _SLLog();
  }
}

+ (void)_presentUsernameMismatchAlert
{
  uint64_t v14 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v15 = SLSocialFrameworkBundle();
  id v2 = [v15 localizedStringForKey:@"GOOGLE_EMAIL_MISMATCH_TITLE" value:&stru_26EB99880 table:@"Localizable"];
  uint64_t v3 = *MEMORY[0x263EFFFC8];
  uint64_t v4 = SLSocialFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"GOOGLE_EMAIL_MISMATCH_MESSAGE" value:&stru_26EB99880 table:@"Localizable"];
  uint64_t v6 = *MEMORY[0x263EFFFD8];
  id v7 = SLSocialFrameworkBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"GOOGLE_EMAIL_MISMATCH_OK" value:&stru_26EB99880 table:@"Localizable"];
  uint64_t v9 = *MEMORY[0x263F00000];
  uint64_t v10 = SLSocialFrameworkBundle();
  id v11 = [v10 resourceURL];
  objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v2, v3, v5, v6, v8, v9, v11, *MEMORY[0x263F00018], 0);
  CFDictionaryRef v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  CFUserNotificationRef v20 = 0;
  CFUserNotificationRef v20 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, v12);
  if (v18[3])
  {
    id v13 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__SLGoogleAuthController__presentUsernameMismatchAlert__block_invoke;
    block[3] = &unk_264D502A0;
    void block[4] = &v17;
    dispatch_async(v13, block);
  }
  _Block_object_dispose(&v17, 8);
}

void __55__SLGoogleAuthController__presentUsernameMismatchAlert__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

+ (void)_presentInternetOfflineError
{
  v18[4] = *MEMORY[0x263EF8340];
  v17[0] = *MEMORY[0x263EFFFC8];
  id v2 = SLSocialFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"SIGN_IN_ERROR_TITLE" value:&stru_26EB99880 table:@"Localizable"];
  v18[0] = v3;
  v17[1] = *MEMORY[0x263EFFFD8];
  uint64_t v4 = SLSocialFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"SIGN_IN_ERROR_MESSAGE_NO_CONNECTION" value:&stru_26EB99880 table:@"Localizable"];
  v18[1] = v5;
  v17[2] = *MEMORY[0x263F00000];
  uint64_t v6 = SLSocialFrameworkBundle();
  id v7 = [v6 localizedStringForKey:@"SIGN_IN_ERROR_OK" value:&stru_26EB99880 table:@"Localizable"];
  v18[2] = v7;
  v17[3] = *MEMORY[0x263F00018];
  uint64_t v8 = SLSocialFrameworkBundle();
  uint64_t v9 = [v8 resourceURL];
  v18[3] = v9;
  CFDictionaryRef v10 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  CFUserNotificationRef v16 = 0;
  CFUserNotificationRef v16 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, v10);
  if (v14[3])
  {
    id v11 = dispatch_get_global_queue(25, 0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__SLGoogleAuthController__presentInternetOfflineError__block_invoke;
    v12[3] = &unk_264D502A0;
    void v12[4] = &v13;
    dispatch_async(v11, v12);
  }
  _Block_object_dispose(&v13, 8);
}

void __54__SLGoogleAuthController__presentInternetOfflineError__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_authenticationSession, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end