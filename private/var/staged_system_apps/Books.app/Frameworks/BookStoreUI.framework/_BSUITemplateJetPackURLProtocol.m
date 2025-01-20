@interface _BSUITemplateJetPackURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
- (void)startLoading;
@end

@implementation _BSUITemplateJetPackURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  v3 = [a3 URL];
  v4 = [v3 scheme];
  unsigned __int8 v5 = [v4 isEqualToString:@"jetpack"];

  return v5;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)startLoading
{
  id v3 = [(_BSUITemplateJetPackURLProtocol *)self request];
  v4 = [v3 URL];

  unsigned __int8 v5 = +[JSABridge sharedInstance];
  v6 = [v5 currentPackage];

  v7 = [(_BSUITemplateJetPackURLProtocol *)self request];
  v8 = [v7 URL];
  v9 = [v8 path];
  v10 = [v6 dataAtPath:v9];

  v11 = [(_BSUITemplateJetPackURLProtocol *)self client];
  if (v10)
  {
    v12 = [objc_alloc((Class)NSURLResponse) initWithURL:v4 MIMEType:@"application/octet-stream" expectedContentLength:[v10 length] textEncodingName:0];
    [v11 URLProtocol:self didReceiveResponse:v12 cacheStoragePolicy:1];
    [v11 URLProtocol:self didLoadData:v10];
    [v11 URLProtocolDidFinishLoading:self];
    v13 = BSUITemplateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 134218242;
      id v16 = [v10 length];
      __int16 v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Success JetPack resource (%lu bytes): %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    v14 = +[NSError errorWithDomain:@"kBSUIJetPackURLProtocolErrorDomain" code:0 userInfo:0];
    [v11 URLProtocol:self didFailWithError:v14];

    v12 = BSUITemplateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_2DD268();
    }
  }
}

@end