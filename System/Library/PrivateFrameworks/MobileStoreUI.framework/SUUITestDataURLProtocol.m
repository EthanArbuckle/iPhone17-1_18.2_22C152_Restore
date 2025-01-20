@interface SUUITestDataURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)canonicalRequestForRequest:(id)a3;
- (void)startLoading;
@end

@implementation SUUITestDataURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x25A2A9B80]();
  v5 = [v3 URL];
  v6 = [v5 scheme];

  LOBYTE(v5) = [v6 isEqualToString:@"x-apple-storeui-test-data"];

  return (char)v5;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (void)startLoading
{
  id v3 = (void *)MEMORY[0x25A2A9B80](self, a2);
  v4 = [(NSURLProtocol *)self request];
  v5 = [v4 URL];

  v6 = [v5 resourceSpecifier];
  v7 = [MEMORY[0x263F086E0] mainBundle];
  v8 = [v7 resourcePath];
  v9 = [v8 stringByAppendingPathComponent:v6];

  uint64_t v10 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v9];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = v9;
    goto LABEL_5;
  }
  v13 = SUUIBundle();
  v14 = [v13 resourcePath];
  v12 = [v14 stringByAppendingPathComponent:v6];

  uint64_t v15 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v12];
  if (v15)
  {
    v11 = (void *)v15;
LABEL_5:
    uint64_t v16 = [v6 pathExtension];
    if (v16)
    {
      v17 = (const void *)v16;
      v18 = (void *)SUUIMobileCoreServicesFramework();
      uint64_t v19 = *(void *)SUUIWeakLinkedSymbolForString("kUTTagClassFilenameExtension", v18);
      v20 = (void *)SUUIMobileCoreServicesFramework();
      v21 = (uint64_t (*)(uint64_t, const void *, void))SUUIWeakLinkedSymbolForString("UTTypeCreatePreferredIdentifierForTag", v20);
      if (v21 && (uint64_t v22 = v21(v19, v17, 0)) != 0)
      {
        v23 = (const void *)v22;
        v24 = (void *)SUUIMobileCoreServicesFramework();
        uint64_t v25 = *(void *)SUUIWeakLinkedSymbolForString("kUTTagClassMIMEType", v24);
        v26 = (void *)SUUIMobileCoreServicesFramework();
        v27 = (uint64_t (*)(const void *, uint64_t))SUUIWeakLinkedSymbolForString("UTTypeCopyPreferredTagWithClass", v26);
        if (v27) {
          v28 = (__CFString *)v27(v23, v25);
        }
        else {
          v28 = 0;
        }
        CFRelease(v23);
        CFRelease(v17);
        if (v28) {
          goto LABEL_12;
        }
      }
      else
      {
        CFRelease(v17);
      }
    }
    v28 = @"text/xml+itml";
LABEL_12:
    v29 = [(NSURLProtocol *)self client];
    v30 = objc_msgSend(objc_alloc(MEMORY[0x263EFC638]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v5, v28, objc_msgSend(v11, "length"), 0);
    [v29 URLProtocol:self didReceiveResponse:v30 cacheStoragePolicy:2];
    [v29 URLProtocol:self didLoadData:v11];
    [v29 URLProtocolDidFinishLoading:self];

    goto LABEL_13;
  }
  v11 = [(NSURLProtocol *)self client];
  v28 = [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:0 userInfo:0];
  [v11 URLProtocol:self didFailWithError:v28];
LABEL_13:
}

@end