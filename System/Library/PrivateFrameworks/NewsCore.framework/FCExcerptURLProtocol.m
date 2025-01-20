@interface FCExcerptURLProtocol
+ (BOOL)canHandleURL:(id)a3;
+ (BOOL)canHandleURLWithComponents:(id)a3;
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)canonicalRequestForRequest:(id)a3;
+ (id)excerptURLForArticleID:(id)a3 changeTag:(id)a4;
+ (void)initialize;
+ (void)setupWithArticleDatabase:(id)a3;
+ (void)unregister;
- (FCCKContentFetchOperation)fetchOperation;
- (void)setFetchOperation:(id)a3;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation FCExcerptURLProtocol

+ (BOOL)canHandleURLWithComponents:(id)a3
{
  v3 = [a3 scheme];
  char v4 = [v3 isEqualToString:@"news-excerpt"];

  return v4;
}

+ (void)setupWithArticleDatabase:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"excerpt URL protocol requires a non-nil database"];
    int v10 = 136315906;
    v11 = "+[FCExcerptURLProtocol setupWithArticleDatabase:]";
    __int16 v12 = 2080;
    v13 = "FCExcerptURLProtocol.m";
    __int16 v14 = 1024;
    int v15 = 41;
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
  }
  id WeakRetained = objc_loadWeakRetained(&s_database_0);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    Class v7 = NSClassFromString(&cfstr_Xctest.isa);

    if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)[[NSString alloc] initWithFormat:@"excerpt URL protocol has already been setup"];
      int v10 = 136315906;
      v11 = "+[FCExcerptURLProtocol setupWithArticleDatabase:]";
      __int16 v12 = 2080;
      v13 = "FCExcerptURLProtocol.m";
      __int16 v14 = 1024;
      int v15 = 42;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
    }
  }
  objc_storeWeak(&s_database_0, v4);
  [MEMORY[0x1E4F18DA0] registerClass:a1];
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v4 = [a3 URL];
  LOBYTE(a1) = [a1 canHandleURL:v4];

  return (char)a1;
}

+ (BOOL)canHandleURL:(id)a3
{
  v3 = [a3 scheme];
  char v4 = [v3 isEqualToString:@"news-excerpt"];

  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)MEMORY[0x1E4F18DA0];
    [v3 registerClass:a1];
  }
}

+ (void)unregister
{
  id WeakRetained = objc_loadWeakRetained(&s_database_0);

  if (WeakRetained)
  {
    objc_storeWeak(&s_database_0, 0);
    char v4 = (void *)MEMORY[0x1E4F18DA0];
    [v4 unregisterClass:a1];
  }
}

+ (id)excerptURLForArticleID:(id)a3 changeTag:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(&s_database_0);

  if (!WeakRetained && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v16 = (void *)[[NSString alloc] initWithFormat:@"can't construct a URL without a database"];
    *(_DWORD *)buf = 136315906;
    v19 = "+[FCExcerptURLProtocol excerptURLForArticleID:changeTag:]";
    __int16 v20 = 2080;
    v21 = "FCExcerptURLProtocol.m";
    __int16 v22 = 1024;
    int v23 = 61;
    __int16 v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v8 setScheme:@"news-excerpt"];
  id v9 = objc_loadWeakRetained(&s_database_0);
  int v10 = [v9 containerIdentifier];
  [v8 setHost:v10];

  v11 = [@"/" stringByAppendingString:v6];

  [v8 setPath:v11];
  __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"changetag" value:v5];

  v17 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [v8 setQueryItems:v13];

  __int16 v14 = [v8 URL];

  return v14;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  id v5 = a4;
  id v6 = [a3 URL];
  Class v7 = [v5 URL];

  LOBYTE(v5) = [v6 isEqual:v7];
  return (char)v5;
}

- (void)startLoading
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [(FCExcerptURLProtocol *)self fetchOperation];

  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)[[NSString alloc] initWithFormat:@"shouldn't have a fetch operation yet"];
    *(_DWORD *)location = 136315906;
    *(void *)&location[4] = "-[FCExcerptURLProtocol startLoading]";
    __int16 v27 = 2080;
    v28 = "FCExcerptURLProtocol.m";
    __int16 v29 = 1024;
    int v30 = 102;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);
  }
  char v4 = [(NSURLProtocol *)self request];
  id v5 = [v4 URL];

  id v6 = [v5 lastPathComponent];
  Class v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v6];
  id v8 = objc_alloc_init(FCCKContentFetchOperation);
  id WeakRetained = objc_loadWeakRetained(&s_database_0);
  -[FCCKContentFetchOperation setDatabase:]((uint64_t)v8, WeakRetained);

  v25 = v7;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  if (v8) {
    objc_setProperty_nonatomic_copy(v8, v10, v11, 384);
  }

  __int16 v24 = @"excerpt";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  if (v8) {
    objc_setProperty_nonatomic_copy(v8, v12, v13, 400);
  }

  objc_initWeak((id *)location, self);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  __int16 v20 = __36__FCExcerptURLProtocol_startLoading__block_invoke;
  v21 = &unk_1E5B58E50;
  objc_copyWeak(&v23, (id *)location);
  id v15 = v5;
  id v22 = v15;
  if (v8) {
    objc_setProperty_nonatomic_copy(v8, v14, &v18, 416);
  }
  -[FCExcerptURLProtocol setFetchOperation:](self, "setFetchOperation:", v8, v18, v19, v20, v21);
  __int16 v16 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  [v16 addOperation:v8];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)location);
}

void __36__FCExcerptURLProtocol_startLoading__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__FCExcerptURLProtocol_startLoading__block_invoke_2;
  v10[3] = &unk_1E5B58E28;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  FCPerformIfNonNil(WeakRetained, v10);
}

void __36__FCExcerptURLProtocol_startLoading__block_invoke_2(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 fetchOperation];
  char v4 = [v3 isCancelled];

  if ((v4 & 1) == 0)
  {
    if ([*(id *)(a1 + 32) count] == 1)
    {
      id v5 = [*(id *)(a1 + 32) allValues];
      id v6 = [v5 firstObject];

      Class v7 = [v6 objectForKeyedSubscript:@"excerpt"];
      id v8 = [v7 dataUsingEncoding:4];
      id v9 = objc_msgSend(v8, "fc_gzipDeflate");

      int v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F18DB0]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", *(void *)(a1 + 40), @"application/gzip", objc_msgSend(v9, "length"), 0);
      id v11 = [v14 client];
      [v11 URLProtocol:v14 didReceiveResponse:v10 cacheStoragePolicy:2];

      id v12 = [v14 client];
      [v12 URLProtocol:v14 didLoadData:v9];

      id v13 = [v14 client];
      [v13 URLProtocolDidFinishLoading:v14];
    }
    else
    {
      id v6 = [v14 client];
      [v6 URLProtocol:v14 didFailWithError:*(void *)(a1 + 48)];
    }
  }
}

- (void)stopLoading
{
  id v2 = [(FCExcerptURLProtocol *)self fetchOperation];
  [v2 cancel];
}

- (FCCKContentFetchOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end