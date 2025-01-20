@interface SUUIAppleIDImageURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
- (void)_startLoading;
- (void)startLoading;
@end

@implementation SUUIAppleIDImageURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  v3 = [a3 URL];
  v4 = [v3 scheme];

  LOBYTE(v3) = [v4 isEqualToString:@"x-apple-identity-image"];
  return (char)v3;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)startLoading
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(0, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__SUUIAppleIDImageURLProtocol_startLoading__block_invoke;
  v3[3] = &unk_265401538;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __43__SUUIAppleIDImageURLProtocol_startLoading__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startLoading];
}

- (void)_startLoading
{
  id v3 = [(NSURLProtocol *)self request];
  id v4 = [v3 URL];
  id v21 = [v4 query];

  v5 = (void *)[NSURL copyDictionaryForQueryString:v21 unescapedValues:1];
  v6 = [v5 objectForKey:@"firstName"];
  v7 = [v5 objectForKey:@"lastName"];
  v8 = [v5 objectForKey:@"email"];
  v9 = [v5 objectForKey:@"dsid"];
  if (objc_opt_respondsToSelector())
  {
    v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
  }
  else
  {
    v10 = 0;
  }

  SUUIGetFamilyMemberImage(v6, v7, v8, v10);
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v12 = [(NSURLProtocol *)self client];
  if (v11)
  {
    id v13 = objc_alloc(MEMORY[0x263EFC638]);
    v14 = [(NSURLProtocol *)self request];
    [v14 URL];
    v20 = v8;
    v15 = v7;
    v17 = v16 = v6;
    v18 = (void *)[v13 initWithURL:v17 MIMEType:@"image/png" expectedContentLength:-1 textEncodingName:0];

    [v12 URLProtocol:self didReceiveResponse:v18 cacheStoragePolicy:1];
    v19 = UIImagePNGRepresentation(v11);
    [v12 URLProtocol:self didLoadData:v19];

    v6 = v16;
    v7 = v15;
    v8 = v20;
    [v12 URLProtocolDidFinishLoading:self];
  }
  else
  {
    v18 = [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:0 userInfo:0];
    [v12 URLProtocol:self didFailWithError:v18];
  }
}

@end