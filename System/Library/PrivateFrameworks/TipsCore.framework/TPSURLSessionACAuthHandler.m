@interface TPSURLSessionACAuthHandler
+ (BOOL)canAuthenticateWithURLResponse:(id)a3;
- (OS_dispatch_queue)syncQueue;
- (PPCExtensibleSSOAuthenticator)ssoAuthenticator;
- (TPSURLSessionACAuthContext)authContext;
- (TPSURLSessionACAuthContext)authenticationContext;
- (TPSURLSessionACAuthHandler)initWithAuthenticationContext:(id)a3;
- (id)_authenticationTokenForHost:(id)a3 error:(id *)a4;
- (id)customHeaderFields;
- (void)_authenticateWithAppleConnect:(id)a3;
- (void)authenticateForURLResponse:(id)a3 completion:(id)a4;
- (void)setAuthContext:(id)a3;
- (void)setSsoAuthenticator:(id)a3;
- (void)setSyncQueue:(id)a3;
@end

@implementation TPSURLSessionACAuthHandler

- (TPSURLSessionACAuthHandler)initWithAuthenticationContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSURLSessionACAuthHandler;
  v6 = [(TPSURLSessionACAuthHandler *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authContext, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.tips.ACAuthHandler.syncQueue", v8);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_ssoAuthenticator, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

+ (BOOL)canAuthenticateWithURLResponse:(id)a3
{
  id v3 = a3;
  if (+[TPSCommonDefines isInternalDevice])
  {
    id v4 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = +[TPSContentURLController defaultHost];
      v6 = [v5 host];

      v7 = [v4 URL];
      v8 = [v7 host];
      char v9 = [v8 isEqualToString:v6];

      if (v9)
      {
        char v10 = 0;
      }
      else
      {
        if (canAuthenticateWithURLResponse__onceToken != -1) {
          dispatch_once(&canAuthenticateWithURLResponse__onceToken, &__block_literal_global_19);
        }
        uint64_t v11 = [v4 statusCode];
        objc_super v12 = (void *)canAuthenticateWithURLResponse__supportedStatusCodes;
        v13 = [NSNumber numberWithInteger:v11];
        char v10 = [v12 containsObject:v13];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

uint64_t __61__TPSURLSessionACAuthHandler_canAuthenticateWithURLResponse___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EED9B090];
  uint64_t v1 = canAuthenticateWithURLResponse__supportedStatusCodes;
  canAuthenticateWithURLResponse__supportedStatusCodes = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)authenticateForURLResponse:(id)a3 completion:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a3 URL];
  v8 = [v7 host];

  if (![v8 length]) {
    goto LABEL_5;
  }
  id v14 = 0;
  char v9 = [(TPSURLSessionACAuthHandler *)self _authenticationTokenForHost:v8 error:&v14];
  id v10 = v14;
  uint64_t v11 = v10;
  if (!v9)
  {

LABEL_5:
    [(TPSURLSessionACAuthHandler *)self _authenticateWithAppleConnect:v6];
    goto LABEL_6;
  }
  objc_super v12 = [NSString stringWithFormat:@"Bearer %@", v9];
  v15 = @"Authorization";
  v16[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  (*((void (**)(id, void, void, void *, void))v6 + 2))(v6, 0, 0, v13, 0);

LABEL_6:
}

- (id)customHeaderFields
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(TPSURLSessionACAuthHandler *)self authContext];
  id v3 = [v2 clientIdentifier];

  if ([v3 length])
  {
    id v6 = @"X-Client-Id";
    v7[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_authenticateWithAppleConnect:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSURLSessionACAuthHandler *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__TPSURLSessionACAuthHandler__authenticateWithAppleConnect___block_invoke;
  block[3] = &unk_1E5906740;
  block[4] = self;
  dispatch_sync(v5, block);

  id v6 = [(TPSURLSessionACAuthHandler *)self ssoAuthenticator];

  if (v6)
  {
    v7 = [(TPSURLSessionACAuthHandler *)self ssoAuthenticator];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__TPSURLSessionACAuthHandler__authenticateWithAppleConnect___block_invoke_2;
    v9[3] = &unk_1E5907F38;
    v9[4] = self;
    id v10 = v4;
    [v7 authenticateWithCompletion:v9];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:13 userInfo:0];
    (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0, 0, 0, v8);
  }
}

void __60__TPSURLSessionACAuthHandler__authenticateWithAppleConnect___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ssoAuthenticator];
  if (v2)
  {
  }
  else if (PingPongClientLibraryCore())
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    id v3 = (void *)getPPCExtensibleSSOAuthenticatorClass_softClass;
    uint64_t v19 = getPPCExtensibleSSOAuthenticatorClass_softClass;
    if (!getPPCExtensibleSSOAuthenticatorClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getPPCExtensibleSSOAuthenticatorClass_block_invoke;
      v15[3] = &unk_1E5907C70;
      v15[4] = &v16;
      __getPPCExtensibleSSOAuthenticatorClass_block_invoke((uint64_t)v15);
      id v3 = (void *)v17[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v16, 8);
    id v5 = objc_alloc_init(v4);
    [*(id *)(a1 + 32) setSsoAuthenticator:v5];
  }
  id v6 = [*(id *)(a1 + 32) authContext];
  v7 = [v6 appIdentifier];
  v8 = [*(id *)(a1 + 32) ssoAuthenticator];
  [v8 setAppIdentifier:v7];

  char v9 = [*(id *)(a1 + 32) authContext];
  id v10 = [v9 enviromentIdentifier];
  uint64_t v11 = [*(id *)(a1 + 32) ssoAuthenticator];
  [v11 setEnvIdentifier:v10];

  objc_super v12 = [*(id *)(a1 + 32) authContext];
  v13 = [v12 interactivityMode];
  id v14 = [*(id *)(a1 + 32) ssoAuthenticator];
  [v14 setInteractivity:v13];
}

void __60__TPSURLSessionACAuthHandler__authenticateWithAppleConnect___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  v7 = (id *)getkExtensibleSSOUsernameKeySymbolLoc_ptr;
  uint64_t v21 = getkExtensibleSSOUsernameKeySymbolLoc_ptr;
  if (!getkExtensibleSSOUsernameKeySymbolLoc_ptr)
  {
    v8 = (void *)PingPongClientLibrary();
    v19[3] = (uint64_t)dlsym(v8, "kExtensibleSSOUsernameKey");
    getkExtensibleSSOUsernameKeySymbolLoc_ptr = v19[3];
    v7 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v7) {
    goto LABEL_15;
  }
  id v9 = *v7;
  id v10 = [v5 objectForKeyedSubscript:v9];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v11 = (id *)getkExtensibleSSOTokenKeySymbolLoc_ptr;
  uint64_t v21 = getkExtensibleSSOTokenKeySymbolLoc_ptr;
  if (!getkExtensibleSSOTokenKeySymbolLoc_ptr)
  {
    objc_super v12 = (void *)PingPongClientLibrary();
    v19[3] = (uint64_t)dlsym(v12, "kExtensibleSSOTokenKey");
    getkExtensibleSSOTokenKeySymbolLoc_ptr = v19[3];
    uint64_t v11 = (id *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v11)
  {
LABEL_15:
    +[TPSUserTypeChecker _previousBuildVersion]();
    __break(1u);
  }
  id v13 = *v11;
  id v14 = [v5 objectForKeyedSubscript:v13];

  v15 = [*(id *)(a1 + 32) authContext];
  uint64_t v16 = [v15 clientIdentifier];

  if ([v10 length] && objc_msgSend(v14, "length"))
  {
    if ([v16 length])
    {
      v24[0] = @"X-AppleConnect-User";
      v24[1] = @"X-AppleConnect-Token";
      v25[0] = v10;
      v25[1] = v14;
      v24[2] = @"X-Client-Id";
      v25[2] = v16;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
    }
    else
    {
      v22[0] = @"X-AppleConnect-User";
      v22[1] = @"X-AppleConnect-Token";
      v23[0] = v10;
      v23[1] = v14;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    v17 = };
  }
  else
  {
    v17 = 0;
  }
  (*(void (**)(void, void *, void *, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10, v14, v17);
}

- (id)_authenticationTokenForHost:(id)a3 error:(id *)a4
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F3B988];
  uint64_t v7 = *MEMORY[0x1E4F3B850];
  v16[0] = *MEMORY[0x1E4F3B978];
  v16[1] = v7;
  v17[0] = v6;
  v17[1] = @"ipcdn";
  uint64_t v8 = *MEMORY[0x1E4F3BC70];
  void v16[2] = *MEMORY[0x1E4F3B5C0];
  v16[3] = v8;
  v17[2] = v5;
  v17[3] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  CFTypeRef cf = 0;
  OSStatus v10 = SecItemCopyMatching(v9, &cf);
  if (v10)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
      uint64_t v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else
  {
    if (cf)
    {
      id v12 = [NSString alloc];
      uint64_t v11 = (void *)[v12 initWithData:cf encoding:4];
      CFRelease(cf);
      goto LABEL_10;
    }
    id v13 = +[TPSLogger default];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[TPSURLSessionACAuthHandler _authenticationTokenForHost:error:](v13);
    }
  }
  uint64_t v11 = 0;
LABEL_10:

  return v11;
}

- (TPSURLSessionACAuthContext)authenticationContext
{
  return self->_authenticationContext;
}

- (TPSURLSessionACAuthContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (PPCExtensibleSSOAuthenticator)ssoAuthenticator
{
  return self->_ssoAuthenticator;
}

- (void)setSsoAuthenticator:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (void)_authenticationTokenForHost:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_19C8DC000, log, OS_LOG_TYPE_DEBUG, "Keychain item was found but had no data!", v1, 2u);
}

@end