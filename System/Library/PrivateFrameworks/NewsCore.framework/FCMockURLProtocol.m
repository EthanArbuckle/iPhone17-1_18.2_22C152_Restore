@interface FCMockURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)URLForData:(id)a3 mimeType:(id)a4;
+ (id)URLForData:(id)a3 mimeType:(id)a4 statusCode:(unint64_t)a5;
+ (id)URLForError:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
- (void)startLoading;
@end

@implementation FCMockURLProtocol

+ (id)URLForData:(id)a3 mimeType:(id)a4 statusCode:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = NSTemporaryDirectory();
  v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];
  v12 = [v9 stringByAppendingPathComponent:v11];

  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v13 createFileAtPath:v12 contents:v8 attributes:0];

  if (qword_1EB5D1268 == -1)
  {
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_1EB5D1268, &__block_literal_global_48);
  if (v7) {
LABEL_3:
  }
    [(id)_MergedGlobals_160 setObject:v7 forKey:v12];
LABEL_4:
  if (qword_1EB5D1270 == -1)
  {
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  dispatch_once(&qword_1EB5D1270, &__block_literal_global_8_0);
  if (a5)
  {
LABEL_6:
    v14 = (void *)qword_1EB5D1258;
    v15 = [NSNumber numberWithUnsignedInteger:a5];
    [v14 setObject:v15 forKey:v12];
  }
LABEL_7:
  id v16 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v16 setScheme:@"https"];
  [v16 setHost:@"news-mock-file.local"];
  [v16 setPath:v12];
  v17 = [v16 URL];

  return v17;
}

uint64_t __52__FCMockURLProtocol_URLForData_mimeType_statusCode___block_invoke()
{
  v0 = objc_alloc_init(FCThreadSafeMutableDictionary);
  uint64_t v1 = _MergedGlobals_160;
  _MergedGlobals_160 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __52__FCMockURLProtocol_URLForData_mimeType_statusCode___block_invoke_2()
{
  v0 = objc_alloc_init(FCThreadSafeMutableDictionary);
  uint64_t v1 = qword_1EB5D1258;
  qword_1EB5D1258 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)URLForData:(id)a3 mimeType:(id)a4
{
  return (id)[a1 URLForData:a3 mimeType:a4 statusCode:0];
}

+ (id)URLForError:(id)a3
{
  uint64_t v3 = ++qword_1EB5D1278;
  v4 = NSString;
  id v5 = a3;
  v6 = objc_msgSend(v4, "stringWithFormat:", @"/%lu", v3);
  if (qword_1EB5D1280 != -1) {
    dispatch_once(&qword_1EB5D1280, &__block_literal_global_19);
  }
  [(id)qword_1EB5D1260 setObject:v5 forKey:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v7 setScheme:@"https"];
  [v7 setHost:@"news-mock-error.local"];
  [v7 setPath:v6];
  id v8 = [v7 URL];

  return v8;
}

uint64_t __33__FCMockURLProtocol_URLForError___block_invoke()
{
  v0 = objc_alloc_init(FCThreadSafeMutableDictionary);
  uint64_t v1 = qword_1EB5D1260;
  qword_1EB5D1260 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3 = a3;
  if (NSClassFromString(&cfstr_Xctest.isa))
  {
    v4 = [v3 URL];
    id v5 = [v4 host];
    if ([v5 isEqualToString:@"news-mock-file.local"])
    {
      char v6 = 1;
    }
    else
    {
      id v7 = [v3 URL];
      id v8 = [v7 host];
      char v6 = [v8 isEqualToString:@"news-mock-error.local"];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  id v5 = a4;
  char v6 = [a3 URL];
  id v7 = [v6 path];
  id v8 = [v5 URL];

  v9 = [v8 path];
  char v10 = [v7 isEqualToString:v9];

  return v10;
}

- (void)startLoading
{
  id v3 = [(NSURLProtocol *)self request];
  v4 = [v3 URL];
  id v5 = [v4 host];
  int v6 = [v5 isEqualToString:@"news-mock-file.local"];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CB10];
    id v8 = [(NSURLProtocol *)self request];
    v9 = [v8 URL];
    char v10 = [v9 path];
    v11 = [v7 fileURLWithPath:v10];

    id v43 = 0;
    [v11 getResourceValue:&v43 forKey:*MEMORY[0x1E4F1C5F8] error:0];
    v12 = (void *)qword_1EB5D1258;
    id v13 = v43;
    v14 = [(NSURLProtocol *)self request];
    v15 = [v14 URL];
    id v16 = [v15 path];
    v17 = [v12 objectForKey:v16];

    v18 = (void *)_MergedGlobals_160;
    v19 = [v11 path];
    v20 = [v18 objectForKey:v19];

    v21 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v21, "fc_safelySetObjectAllowingNil:forKey:", v20, @"Content-Type");
    id v22 = objc_alloc(MEMORY[0x1E4F18D40]);
    v23 = [(NSURLProtocol *)self request];
    v24 = [v23 URL];
    if (v17) {
      uint64_t v25 = [v17 unsignedIntegerValue];
    }
    else {
      uint64_t v25 = 200;
    }
    v35 = (void *)[v22 initWithURL:v24 statusCode:v25 HTTPVersion:0 headerFields:v21];

    v36 = [(NSURLProtocol *)self client];
    [v36 URLProtocol:self didReceiveResponse:v35 cacheStoragePolicy:0];

    v37 = [(NSURLProtocol *)self client];
    v38 = (void *)MEMORY[0x1E4F1C9B8];
    v39 = [v11 path];
    v40 = [v38 dataWithContentsOfFile:v39];
    [v37 URLProtocol:self didLoadData:v40];

    v41 = [(NSURLProtocol *)self client];
    [v41 URLProtocolDidFinishLoading:self];
  }
  else
  {
    v26 = [(NSURLProtocol *)self request];
    v27 = [v26 URL];
    v28 = [v27 host];
    int v29 = [v28 isEqualToString:@"news-mock-error.local"];

    if (v29)
    {
      v30 = (void *)qword_1EB5D1260;
      v31 = [(NSURLProtocol *)self request];
      v32 = [v31 URL];
      v33 = [v32 path];
      id v42 = [v30 objectForKey:v33];

      v34 = [(NSURLProtocol *)self client];
      [v34 URLProtocol:self didFailWithError:v42];
    }
  }
}

@end