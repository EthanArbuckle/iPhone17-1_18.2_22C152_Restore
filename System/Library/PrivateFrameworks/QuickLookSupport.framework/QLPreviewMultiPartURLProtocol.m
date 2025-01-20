@interface QLPreviewMultiPartURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
+ (id)protocolScheme;
+ (void)initialize;
- (void)startLoading;
@end

@implementation QLPreviewMultiPartURLProtocol

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)MEMORY[0x263F08BC8];
    [v3 registerClass:a1];
  }
}

+ (id)protocolScheme
{
  return @"cid";
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 URL];
  v6 = [v5 scheme];

  if (v6)
  {
    v7 = [v4 mainDocumentURL];
    if (+[QLPreviewURLProtocol isSafeURL:v7])
    {
      v8 = [a1 protocolScheme];
      BOOL v9 = [v8 caseInsensitiveCompare:v6] == 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)startLoading
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(NSURLProtocol *)self request];
  id v4 = [v3 mainDocumentURL];
  v5 = +[QLPreviewParts registeredPreviewForURL:v4];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = [v3 URL];
    v7 = [v6 resourceSpecifier];

    uint64_t v8 = [v5 URLRequestForContentID:v7];
    if (v8)
    {
      BOOL v9 = (void *)v8;
      v10 = [(NSURLProtocol *)self client];
      [v10 URLProtocol:self wasRedirectedToRequest:v9 redirectResponse:0];

      goto LABEL_11;
    }
  }
  uint64_t v11 = MEMORY[0x263F16100];
  v12 = *(NSObject **)(MEMORY[0x263F16100] + 160);
  if (!v12)
  {
    QLTInitLogging();
    v12 = *(NSObject **)(v11 + 160);
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = [v3 URL];
    int v15 = 138412290;
    v16 = v14;
    _os_log_impl(&dword_217F31000, v13, OS_LOG_TYPE_INFO, "Could not find resource for %@", (uint8_t *)&v15, 0xCu);
  }
  v7 = [(NSURLProtocol *)self client];
  BOOL v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1008 userInfo:0];
  [v7 URLProtocol:self didFailWithError:v9];
LABEL_11:
}

@end