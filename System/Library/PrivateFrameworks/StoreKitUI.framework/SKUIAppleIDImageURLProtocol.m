@interface SKUIAppleIDImageURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
- (void)_startLoading;
- (void)startLoading;
@end

@implementation SKUIAppleIDImageURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIAppleIDImageURLProtocol canInitWithRequest:]();
  }
  v4 = [v3 URL];
  v5 = [v4 scheme];

  LOBYTE(v4) = [v5 isEqualToString:@"x-apple-identity-image"];
  return (char)v4;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)startLoading
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIAppleIDImageURLProtocol startLoading]";
}

void __43__SKUIAppleIDImageURLProtocol_startLoading__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startLoading];
}

- (void)_startLoading
{
  id v3 = [(NSURLProtocol *)self request];
  v4 = [v3 URL];
  id v21 = [v4 query];

  v5 = (void *)[MEMORY[0x1E4F1CB10] copyDictionaryForQueryString:v21 unescapedValues:1];
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

  SKUIGetFamilyMemberImage(v6, v7, v8, v10);
  v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v12 = [(NSURLProtocol *)self client];
  if (v11)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F18DB0]);
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
    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKUIErrorDomain" code:0 userInfo:0];
    [v12 URLProtocol:self didFailWithError:v18];
  }
}

+ (void)canInitWithRequest:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIAppleIDImageURLProtocol canInitWithRequest:]";
}

@end