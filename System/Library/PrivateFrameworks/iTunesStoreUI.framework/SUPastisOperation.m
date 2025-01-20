@interface SUPastisOperation
- (AVAssetResourceLoadingRequest)loadingRequest;
- (NSURL)certificateURL;
- (NSURL)keyURL;
- (id)_getAppCertWithError:(id *)a3;
- (id)_getCKCForSPC:(id)a3 URI:(id)a4 error:(id *)a5;
- (id)_getURIWithError:(id *)a3;
- (void)dealloc;
- (void)run;
- (void)setCertificateURL:(id)a3;
- (void)setKeyURL:(id)a3;
- (void)setLoadingRequest:(id)a3;
@end

@implementation SUPastisOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUPastisOperation;
  [(SUPastisOperation *)&v3 dealloc];
}

- (void)run
{
  id v3 = [(SUPastisOperation *)self _getURIWithError:0];
  if (v3
    && (v4 = v3, (id v5 = [(SUPastisOperation *)self _getAppCertWithError:0]) != 0)
    && (v6 = -[AVAssetResourceLoadingRequest streamingContentKeyRequestDataForApp:contentIdentifier:options:error:](self->_loadingRequest, "streamingContentKeyRequestDataForApp:contentIdentifier:options:error:", v5, [v4 dataUsingEncoding:4], 0, 0)) != 0&& (id v7 = -[SUPastisOperation _getCKCForSPC:URI:error:](self, "_getCKCForSPC:URI:error:", v6, v4, 0)) != 0)
  {
    [(AVAssetResourceLoadingDataRequest *)[(AVAssetResourceLoadingRequest *)self->_loadingRequest dataRequest] respondWithData:v7];
    loadingRequest = self->_loadingRequest;
    [(AVAssetResourceLoadingRequest *)loadingRequest finishLoading];
  }
  else
  {
    v9 = self->_loadingRequest;
    [(AVAssetResourceLoadingRequest *)v9 finishLoadingWithError:0];
  }
}

- (id)_getAppCertWithError:(id *)a3
{
  if (self->_certificateUrl)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:self->_certificateUrl];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263F7B290]);
    [v4 setURLBagKey:@"skd-setup-cert"];
  }
  [v4 setCachePolicy:1];
  id v5 = objc_alloc_init(MEMORY[0x263F89528]);
  [v5 setRequestProperties:v4];
  objc_msgSend(v5, "setDataProvider:", objc_msgSend(MEMORY[0x263F89470], "provider"));

  int v6 = [(SUPastisOperation *)self runSubOperation:v5 returningError:0];
  id v7 = 0;
  if (v6) {
    id v7 = objc_msgSend((id)objc_msgSend(v5, "dataProvider"), "output");
  }

  return v7;
}

- (id)_getURIWithError:(id *)a3
{
  id v3 = [(NSURLRequest *)[(AVAssetResourceLoadingRequest *)self->_loadingRequest request] URL];

  return [(NSURL *)v3 absoluteString];
}

- (id)_getCKCForSPC:(id)a3 URI:(id)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  v27 = @"fairplay-streaming-request";
  v25[0] = @"version";
  v25[1] = @"streaming-keys";
  v26[0] = &unk_26DBD7B50;
  v22[0] = @"id";
  v22[1] = @"spc";
  v23[0] = &unk_26DBD7B50;
  v23[1] = a3;
  v22[2] = @"uri";
  v23[2] = a4;
  uint64_t v24 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  v26[1] = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v28[0] = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
  uint64_t v7 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:0 error:0];
  if (self->_keyUrl)
  {
    id v8 = (id)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:self->_keyUrl];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F7B290]);
    [v8 setURLBagKey:@"skd-get-keys"];
  }
  [v8 setCachePolicy:1];
  [v8 setHTTPBody:v7];
  [v8 setHTTPMethod:@"POST"];
  id v9 = objc_alloc_init(MEMORY[0x263F89528]);
  [v9 setRequestProperties:v8];
  objc_msgSend(v9, "setDataProvider:", objc_msgSend(MEMORY[0x263F89470], "provider"));

  int v10 = [(SUPastisOperation *)self runSubOperation:v9 returningError:0];
  v11 = 0;
  if (v10)
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v9, "dataProvider"), "output");
    if (!v12) {
      goto LABEL_20;
    }
    v13 = (void *)[MEMORY[0x263F08900] JSONObjectWithData:v12 options:0 error:0];
    objc_opt_class();
    v11 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    v14 = (void *)[v13 objectForKey:@"fairplay-streaming-response"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v15 = (void *)[v14 objectForKey:@"streaming-keys"],
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) == 0)
      || ![v15 count])
    {
LABEL_20:
      v11 = 0;
      goto LABEL_21;
    }
    unint64_t v16 = 0;
    v11 = 0;
    do
    {
      v17 = (void *)[v15 objectAtIndex:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 objectForKey:@"id"];
        v19 = (void *)[v17 objectForKey:@"status"];
        uint64_t v20 = [v17 objectForKey:@"ckc"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && [v18 integerValue] == 1
          && ![v19 integerValue])
        {
          v11 = (void *)v20;
        }
      }
      ++v16;
    }
    while (v16 < [v15 count]);
  }
LABEL_21:

  return v11;
}

- (NSURL)certificateURL
{
  return self->_certificateUrl;
}

- (void)setCertificateURL:(id)a3
{
}

- (NSURL)keyURL
{
  return self->_keyUrl;
}

- (void)setKeyURL:(id)a3
{
}

- (AVAssetResourceLoadingRequest)loadingRequest
{
  return self->_loadingRequest;
}

- (void)setLoadingRequest:(id)a3
{
}

@end