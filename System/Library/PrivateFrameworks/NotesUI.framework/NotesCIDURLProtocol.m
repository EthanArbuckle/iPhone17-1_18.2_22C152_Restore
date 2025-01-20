@interface NotesCIDURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
+ (void)registerDataProvider:(id)a3 forCIDURL:(id)a4;
+ (void)unregisterDataProviderForCIDURL:(id)a3;
- (void)startLoading;
@end

@implementation NotesCIDURLProtocol

+ (void)registerDataProvider:(id)a3 forCIDURL:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NotesCIDURLProtocol_registerDataProvider_forCIDURL___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v5 = registerDataProvider_forCIDURL__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&registerDataProvider_forCIDURL__onceToken, block);
  }
  [(id)s_providersByCID setObject:v7 forKeyedSubscript:v6];
}

uint64_t __54__NotesCIDURLProtocol_registerDataProvider_forCIDURL___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F290C0] registerClass:*(void *)(a1 + 32)];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  s_providersByCID = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1);
}

+ (void)unregisterDataProviderForCIDURL:(id)a3
{
}

+ (BOOL)canInitWithRequest:(id)a3
{
  v3 = [a3 URL];
  v4 = [v3 scheme];
  char v5 = [v4 isEqualToString:@"cid"];

  return v5;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)startLoading
{
  id v3 = [(NSURLProtocol *)self request];
  v4 = [v3 URL];

  char v5 = [(NSURLProtocol *)self client];
  id v6 = [(id)s_providersByCID objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6)
  {
    id v17 = 0;
    id v18 = 0;
    id v16 = 0;
    char v8 = [v6 getData:&v18 mimeType:&v17 error:&v16];
    id v9 = v18;
    id v10 = v17;
    id v11 = v16;
    if (v9 && (v8 & 1) != 0)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F290D8]);
      v13 = [(NSURLProtocol *)self request];
      v14 = [v13 URL];
      v15 = objc_msgSend(v12, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v14, v10, objc_msgSend(v9, "length"), 0);

      [v5 URLProtocol:self didReceiveResponse:v15 cacheStoragePolicy:2];
      [v5 URLProtocol:self didLoadData:v9];
      [v5 URLProtocolDidFinishLoading:self];

      goto LABEL_9;
    }
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NotesCIDURLProtocolErrorDomain" code:100 userInfo:0];
    id v9 = 0;
    id v10 = 0;
  }
  if (!v11)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NotesCIDURLProtocolErrorDomain" code:100 userInfo:0];
  }
  [v5 URLProtocol:self didFailWithError:v11];
LABEL_9:
}

@end