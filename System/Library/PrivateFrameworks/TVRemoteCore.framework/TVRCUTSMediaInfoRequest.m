@interface TVRCUTSMediaInfoRequest
- (TVRCUTSMediaInfoRequest)selfRetained;
- (id)_requestPropertiesForEndPoint:(id)a3 apiVersion:(id)a4 headersDict:(id)a5 queryParamsDict:(id)a6;
- (void)requestForCanonicalID:(id)a3 completion:(id)a4;
- (void)requestForCanonicalID:(id)a3 includeRoles:(BOOL)a4 completion:(id)a5;
- (void)setSelfRetained:(id)a3;
@end

@implementation TVRCUTSMediaInfoRequest

- (void)requestForCanonicalID:(id)a3 completion:(id)a4
{
}

- (void)requestForCanonicalID:(id)a3 includeRoles:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v45[7] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ([v8 length])
  {
    v36 = self;
    v10 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
    v11 = objc_msgSend(v10, "ams_activeiTunesAccount");
    v12 = objc_msgSend(v11, "ams_storefront");
    v13 = [v12 componentsSeparatedByString:@"-"];
    uint64_t v14 = [v13 firstObject];
    v15 = (void *)v14;
    v16 = @"143441";
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v37 = v16;

    v17 = &unk_26DA62D60;
    if (v6) {
      v17 = &unk_26DA62D48;
    }
    id v18 = v17;
    if (v6)
    {
      v19 = [NSString stringWithFormat:@"view/product/%@", v8];
      v20 = &unk_26DA62F10;
    }
    else
    {
      v20 = (void *)MEMORY[0x263EFFA78];
      v19 = @"contents";
    }
    v22 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v23 = [v22 firstObject];
    v24 = (void *)v23;
    v25 = @"en-US";
    if (v23) {
      v25 = (__CFString *)v23;
    }
    v26 = v25;

    v27 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v28 = [v27 countryCode];
    v29 = (void *)v28;
    v30 = @"US";
    if (v28) {
      v30 = (__CFString *)v28;
    }
    v31 = v30;

    if (v6)
    {
      v32 = &unk_26DA62F38;
    }
    else
    {
      v44[0] = @"ids";
      v44[1] = @"profile";
      v45[0] = v8;
      v45[1] = @"Full";
      v44[2] = @"caller";
      v44[3] = @"locale";
      v45[2] = @"tv-remote";
      v45[3] = v26;
      v44[4] = @"country";
      v44[5] = @"sf";
      v45[4] = v31;
      v45[5] = v37;
      v44[6] = @"pfm";
      v45[6] = @"AppleTV";
      v32 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:7];
    }
    v33 = [(TVRCUTSMediaInfoRequest *)v36 _requestPropertiesForEndPoint:v19 apiVersion:v18 headersDict:v20 queryParamsDict:v32];

    v34 = (void *)[objc_alloc(MEMORY[0x263F85B68]) initWithRequestProperties:v33];
    objc_initWeak(&location, v34);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __73__TVRCUTSMediaInfoRequest_requestForCanonicalID_includeRoles_completion___block_invoke;
    v38[3] = &unk_2647AE740;
    objc_copyWeak(&v41, &location);
    BOOL v42 = v6;
    id v39 = v8;
    id v40 = v9;
    [v34 setCompletionBlock:v38];
    v35 = [MEMORY[0x263F08A48] wlkDefaultConcurrentQueue];
    [v35 addOperation:v34];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = +[TVRCMediaInfo mediaInfoWithDictionary:MEMORY[0x263EFFA78]];
    (*((void (**)(id, void *, void))v9 + 2))(v9, v21, 0);
  }
}

void __73__TVRCUTSMediaInfoRequest_requestForCanonicalID_includeRoles_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained error];

  id v5 = objc_loadWeakRetained(v2);
  BOOL v6 = [v5 responseDictionary];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__TVRCUTSMediaInfoRequest_requestForCanonicalID_includeRoles_completion___block_invoke_2;
  block[3] = &unk_2647AE718;
  id v11 = v6;
  char v15 = *(unsigned char *)(a1 + 56);
  id v12 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v13 = v4;
  id v14 = v7;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __73__TVRCUTSMediaInfoRequest_requestForCanonicalID_includeRoles_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = v2;
  if (!*(unsigned char *)(a1 + 64))
  {
    id v8 = v2;
    v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"content"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

      id v8 = (id)v5;
    }

    id v3 = v8;
  }
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v3;
  id v7 = +[TVRCMediaInfo mediaInfoWithDictionary:v3];
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, *(void *)(a1 + 48));
}

- (id)_requestPropertiesForEndPoint:(id)a3 apiVersion:(id)a4 headersDict:(id)a5 queryParamsDict:(id)a6
{
  return (id)[MEMORY[0x263F85B60] requestPropertiesWithEndpoint:a3 queryParameters:a6 httpMethod:@"GET" httpBody:0 headers:a5 caller:0 timeout:0 apiVersion:a4 options:1];
}

- (TVRCUTSMediaInfoRequest)selfRetained
{
  return self->_selfRetained;
}

- (void)setSelfRetained:(id)a3
{
}

- (void).cxx_destruct
{
}

@end