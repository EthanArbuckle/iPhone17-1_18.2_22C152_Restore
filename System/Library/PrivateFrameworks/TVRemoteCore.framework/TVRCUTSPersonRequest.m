@interface TVRCUTSPersonRequest
- (TVRCUTSPersonRequest)selfRetained;
- (id)_requestPropertiesForEndPoint:(id)a3 apiVersion:(id)a4 headersDict:(id)a5 queryParamsDict:(id)a6;
- (void)requestForPersonID:(id)a3 completion:(id)a4;
- (void)setSelfRetained:(id)a3;
@end

@implementation TVRCUTSPersonRequest

- (void)requestForPersonID:(id)a3 completion:(id)a4
{
  v36[6] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v8 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
    v9 = objc_msgSend(v8, "ams_activeiTunesAccount");
    v10 = objc_msgSend(v9, "ams_storefront");
    v11 = [v10 componentsSeparatedByString:@"-"];
    uint64_t v12 = [v11 firstObject];
    v13 = (void *)v12;
    v14 = @"143441";
    if (v12) {
      v14 = (__CFString *)v12;
    }
    v15 = v14;

    v16 = [NSString stringWithFormat:@"canvases/Persons/%@", v6];
    v17 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v18 = [v17 firstObject];
    v19 = (void *)v18;
    v20 = @"en-US";
    if (v18) {
      v20 = (__CFString *)v18;
    }
    v21 = v20;

    v22 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v23 = [v22 countryCode];
    v24 = (void *)v23;
    v25 = @"US";
    if (v23) {
      v25 = (__CFString *)v23;
    }
    v26 = v25;

    v35[0] = @"profile";
    v35[1] = @"caller";
    v36[0] = @"Full";
    v36[1] = @"tv-remote";
    v35[2] = @"locale";
    v35[3] = @"country";
    v36[2] = v21;
    v36[3] = v26;
    v35[4] = @"sf";
    v35[5] = @"pfm";
    v36[4] = v15;
    v36[5] = @"AppleTV";
    v27 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:6];

    v28 = [(TVRCUTSPersonRequest *)self _requestPropertiesForEndPoint:v16 apiVersion:&unk_26DA62EC8 headersDict:MEMORY[0x263EFFA78] queryParamsDict:v27];

    v29 = (void *)[objc_alloc(MEMORY[0x263F85B68]) initWithRequestProperties:v28];
    objc_initWeak(&location, v29);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __54__TVRCUTSPersonRequest_requestForPersonID_completion___block_invoke;
    v31[3] = &unk_2647AFC68;
    objc_copyWeak(&v33, &location);
    id v32 = v7;
    [v29 setCompletionBlock:v31];
    v30 = [MEMORY[0x263F08A48] wlkDefaultConcurrentQueue];
    [v30 addOperation:v29];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
}

void __54__TVRCUTSPersonRequest_requestForPersonID_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained error];

  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 responseDictionary];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__TVRCUTSPersonRequest_requestForPersonID_completion___block_invoke_2;
  block[3] = &unk_2647AFC40;
  id v11 = v6;
  id v7 = *(id *)(a1 + 32);
  id v12 = v4;
  id v13 = v7;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__TVRCUTSPersonRequest_requestForPersonID_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"person"];
  id v6 = +[TVRCPerson personWithDictionary:v2];

  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"canvas"];
  v4 = [v3 objectForKeyedSubscript:@"shelves"];

  id v5 = +[TVRCFilmography filmographyWithDictionaries:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_requestPropertiesForEndPoint:(id)a3 apiVersion:(id)a4 headersDict:(id)a5 queryParamsDict:(id)a6
{
  return (id)[MEMORY[0x263F85B60] requestPropertiesWithEndpoint:a3 queryParameters:a6 httpMethod:@"GET" httpBody:0 headers:a5 caller:0 timeout:0 apiVersion:a4 options:1];
}

- (TVRCUTSPersonRequest)selfRetained
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