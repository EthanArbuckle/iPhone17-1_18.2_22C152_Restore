@interface VUIMediaAPIClient
+ (VUIMediaAPIClient)sharedInstance;
+ (id)getPlatformClientIdentifier;
+ (void)initializeWithAppleTVClientIdentifier;
- (AMSMediaTokenService)tokenService;
- (AMSURLSession)session;
- (NSString)clientIdentifier;
- (VUIMediaAPIClient)initWithClientIdentifier:(id)a3;
- (id)_createSession;
- (id)_createTokenServiceWithSession:(id)a3;
- (void)fetchContentForUrl:(id)a3 completion:(id)a4;
- (void)setClientIdentifier:(id)a3;
- (void)setSession:(id)a3;
- (void)setTokenService:(id)a3;
@end

@implementation VUIMediaAPIClient

+ (VUIMediaAPIClient)sharedInstance
{
  v2 = (void *)sharedInstance;
  if (!sharedInstance)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"You must create with whitelisted clientID."];
    v2 = (void *)sharedInstance;
  }
  return (VUIMediaAPIClient *)v2;
}

- (void)fetchContentForUrl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__20;
  v24 = __Block_byref_object_dispose__20;
  id v9 = objc_alloc(MEMORY[0x1E4F4DD30]);
  v10 = [(VUIMediaAPIClient *)self tokenService];
  id v25 = (id)[v9 initWithTokenService:v10 bag:v8];

  v11 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v12 = objc_msgSend(v11, "ams_activeiTunesAccount");

  [(id)v21[5] setAccount:v12];
  v13 = [v6 URL];
  v14 = [v13 absoluteString];
  NSLog(&cfstr_CreatingPromis.isa, v14);

  v15 = [(id)v21[5] requestByEncodingRequest:v6 parameters:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__VUIMediaAPIClient_fetchContentForUrl_completion___block_invoke;
  v17[3] = &unk_1E6DF9D40;
  id v16 = v7;
  v17[4] = self;
  id v18 = v16;
  v19 = &v20;
  [v15 addFinishBlock:v17];

  _Block_object_dispose(&v20, 8);
}

- (AMSMediaTokenService)tokenService
{
  return self->_tokenService;
}

void __58__VUIMediaAPIClient_initializeWithAppleTVClientIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 40)) initWithClientIdentifier:*(void *)(a1 + 32)];
  v2 = (void *)sharedInstance;
  sharedInstance = v1;
}

- (VUIMediaAPIClient)initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaAPIClient;
  v5 = [(VUIMediaAPIClient *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    [(VUIMediaAPIClient *)v5 setClientIdentifier:v4];
    id v7 = [(VUIMediaAPIClient *)v6 _createSession];
  }

  return v6;
}

- (void)setClientIdentifier:(id)a3
{
}

void __51__VUIMediaAPIClient_fetchContentForUrl_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) session];
    id v7 = [v6 dataTaskPromiseWithRequest:v5];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__VUIMediaAPIClient_fetchContentForUrl_completion___block_invoke_2;
    v10[3] = &unk_1E6DF9D18;
    id v11 = *(id *)(a1 + 40);
    [v7 addFinishBlock:v10];
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  objc_super v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (id)_createSession
{
  v3 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F4DE88]) initWithConfiguration:v3];
  id v5 = [(VUIMediaAPIClient *)self _createTokenServiceWithSession:v4];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F4DD28]) initWithTokenService:v5];
  [v4 setProtocolHandler:v6];
  [(VUIMediaAPIClient *)self setSession:v4];
  [(VUIMediaAPIClient *)self setTokenService:v5];
  id v7 = [(VUIMediaAPIClient *)self session];

  return v7;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setTokenService:(id)a3
{
}

- (void)setSession:(id)a3
{
}

- (id)_createTokenServiceWithSession:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4DBD8];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "vui_defaultBag");
  id v7 = objc_alloc(MEMORY[0x1E4F4DD48]);
  uint64_t v8 = [(VUIMediaAPIClient *)self clientIdentifier];
  objc_super v9 = (void *)[v7 initWithClientIdentifier:v8 bag:v6];

  [v9 setSession:v5];
  return v9;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

+ (void)initializeWithAppleTVClientIdentifier
{
  if (!sharedInstance)
  {
    v3 = [a1 getPlatformClientIdentifier];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__VUIMediaAPIClient_initializeWithAppleTVClientIdentifier__block_invoke;
    v6[3] = &unk_1E6DF6270;
    id v7 = v3;
    id v8 = a1;
    uint64_t v4 = initializeWithAppleTVClientIdentifier_once;
    id v5 = v3;
    if (v4 != -1) {
      dispatch_once(&initializeWithAppleTVClientIdentifier_once, v6);
    }
  }
}

+ (id)getPlatformClientIdentifier
{
  return @"com.apple.ios.tv";
}

uint64_t __51__VUIMediaAPIClient_fetchContentForUrl_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_tokenService, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end