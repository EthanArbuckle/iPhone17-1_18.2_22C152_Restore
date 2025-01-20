@interface FCVanityURLRedirectService
- (BOOL)hasRedirectForURL:(id)a3;
- (FCContentContext)contentContext;
- (FCFetchedValueManager)vanityURLMappingManager;
- (FCVanityURLRedirectService)init;
- (FCVanityURLRedirectService)initWithContentContext:(id)a3;
- (id)_destinationURLForURL:(id)a3;
- (void)acquireHoldTokenOnUnderlyingAssets;
- (void)resolveURL:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5;
- (void)updateUnderlyingMappingWithQualityOfService:(int64_t)a3 completion:(id)a4;
@end

@implementation FCVanityURLRedirectService

- (FCFetchedValueManager)vanityURLMappingManager
{
  [MEMORY[0x1E4F29060] isMainThread];
  vanityURLMappingManager = self->_vanityURLMappingManager;
  if (!vanityURLMappingManager)
  {
    v4 = [FCCoreConfigurationFetchedValueDescriptor alloc];
    v5 = [(FCVanityURLRedirectService *)self contentContext];
    v6 = [v5 configurationManager];
    v7 = [(FCCoreConfigurationFetchedValueDescriptor *)v4 initWithConfigurationManager:v6];

    v8 = [[FCFetchedValueManager alloc] initWithDescriptor:v7];
    v9 = [[FCVanityURLConfigurationFetchedValueDescriptor alloc] initWithConfigurationManager:v8];
    v10 = [[FCFetchedValueManager alloc] initWithDescriptor:v9];
    v11 = [FCHeldPBCodableFetchedValueDescriptor alloc];
    uint64_t v12 = objc_opt_class();
    v13 = [(FCVanityURLRedirectService *)self contentContext];
    v14 = [(FCHeldPBCodableFetchedValueDescriptor *)v11 initWithCodableClass:v12 contentContext:v13 resourceConfigurationManager:v10];

    v15 = [[FCFetchedValueManager alloc] initWithDescriptor:v14];
    v16 = self->_vanityURLMappingManager;
    self->_vanityURLMappingManager = v15;

    vanityURLMappingManager = self->_vanityURLMappingManager;
  }
  return vanityURLMappingManager;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

uint64_t __85__FCVanityURLRedirectService_updateUnderlyingMappingWithQualityOfService_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateUnderlyingMappingWithQualityOfService:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(FCVanityURLRedirectService *)self vanityURLMappingManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__FCVanityURLRedirectService_updateUnderlyingMappingWithQualityOfService_completion___block_invoke;
  v9[3] = &unk_1E5B58F40;
  id v10 = v6;
  id v8 = v6;
  [v7 fetchValueWithQualityOfService:a3 completion:v9];
}

- (FCVanityURLRedirectService)initWithContentContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentContext");
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = "-[FCVanityURLRedirectService initWithContentContext:]";
    __int16 v13 = 2080;
    v14 = "FCVanityURLRedirectService.m";
    __int16 v15 = 1024;
    int v16 = 42;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCVanityURLRedirectService;
  id v6 = [(FCVanityURLRedirectService *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contentContext, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_vanityURLMappingManager, 0);
}

- (FCVanityURLRedirectService)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCVanityURLRedirectService init]";
    __int16 v9 = 2080;
    objc_super v10 = "FCVanityURLRedirectService.m";
    __int16 v11 = 1024;
    int v12 = 37;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCVanityURLRedirectService init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)hasRedirectForURL:(id)a3
{
  v3 = [(FCVanityURLRedirectService *)self destinationURLForURL:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)resolveURL:(id)a3 withQualityOfService:(int64_t)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "URL");
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "-[FCVanityURLRedirectService resolveURL:withQualityOfService:completion:]";
    __int16 v20 = 2080;
    v21 = "FCVanityURLRedirectService.m";
    __int16 v22 = 1024;
    int v23 = 85;
    __int16 v24 = 2114;
    v25 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion");
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "-[FCVanityURLRedirectService resolveURL:withQualityOfService:completion:]";
    __int16 v20 = 2080;
    v21 = "FCVanityURLRedirectService.m";
    __int16 v22 = 1024;
    int v23 = 86;
    __int16 v24 = 2114;
    v25 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  objc_super v10 = [(FCVanityURLRedirectService *)self vanityURLMappingManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__FCVanityURLRedirectService_resolveURL_withQualityOfService_completion___block_invoke;
  v15[3] = &unk_1E5B58F18;
  id v16 = v8;
  id v17 = v9;
  v15[4] = self;
  id v11 = v8;
  id v12 = v9;
  [v10 fetchValueWithCachePolicy:1 qualityOfService:a4 completion:v15];
}

void __73__FCVanityURLRedirectService_resolveURL_withQualityOfService_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)FCVanityURLLog;
  if (os_log_type_enabled((os_log_t)FCVanityURLLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    id v8 = [a2 first];
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v8;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "fetched vanity URL mapping %{public}@", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__FCVanityURLRedirectService_resolveURL_withQualityOfService_completion___block_invoke_18;
  v13[3] = &unk_1E5B58EF0;
  id v14 = v5;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v17 = v9;
  uint64_t v15 = v10;
  id v16 = v11;
  id v12 = v5;
  FCPerformBlockOnMainThread(v13);
}

void __73__FCVanityURLRedirectService_resolveURL_withQualityOfService_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 56);
    v2(v3, 0);
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) _destinationURLForURL:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v4, 0);
  }
}

- (void)acquireHoldTokenOnUnderlyingAssets
{
  v2 = [(FCVanityURLRedirectService *)self vanityURLMappingManager];
}

- (id)_destinationURLForURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "URL");
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCVanityURLRedirectService _destinationURLForURL:]";
    __int16 v14 = 2080;
    uint64_t v15 = "FCVanityURLRedirectService.m";
    __int16 v16 = 1024;
    int v17 = 127;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [(FCVanityURLRedirectService *)self vanityURLMappingManager];
  id v6 = [v5 value];

  v7 = [v6 first];
  if (v7)
  {
    id v8 = [[FCVanityURLMapper alloc] initWithVanityURLMapping:v7];
    id v9 = [(FCVanityURLMapper *)v8 URLForVanityURL:v4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end