@interface FCRecordFieldURLProtocol
+ (BOOL)canHandleURL:(id)a3;
+ (BOOL)canHandleURLWithComponents:(id)a3;
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)URLForRecordID:(id)a3 fieldName:(id)a4;
+ (id)canonicalRequestForRequest:(id)a3;
+ (void)setupWithArticleDatabase:(id)a3;
+ (void)unregister;
- (FCCKContentFetchOperation)fetchOperation;
- (void)setFetchOperation:(id)a3;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation FCRecordFieldURLProtocol

+ (id)URLForRecordID:(id)a3 fieldName:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(&s_database);
  if (WeakRetained)
  {
  }
  else if (!NSClassFromString(&cfstr_Xctest.isa) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"can't construct a URL without a database"];
    int v14 = 136315906;
    v15 = "+[FCRecordFieldURLProtocol URLForRecordID:fieldName:]";
    __int16 v16 = 2080;
    v17 = "FCRecordFieldURLProtocol.m";
    __int16 v18 = 1024;
    int v19 = 56;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);
  }
  v8 = objc_loadWeakRetained(&s_database);

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v9 setScheme:@"https"];
    [v9 setHost:@"news-record"];
    v10 = [@"/" stringByAppendingString:v5];
    v11 = [v10 stringByAppendingPathComponent:v6];
    [v9 setPath:v11];

    v8 = [v9 URL];
  }
  return v8;
}

+ (BOOL)canHandleURLWithComponents:(id)a3
{
  v3 = [a3 host];
  char v4 = [v3 isEqualToString:@"news-record"];

  return v4;
}

+ (void)setupWithArticleDatabase:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)[[NSString alloc] initWithFormat:@"record field URL protocol requires a non-nil database"];
    int v10 = 136315906;
    v11 = "+[FCRecordFieldURLProtocol setupWithArticleDatabase:]";
    __int16 v12 = 2080;
    v13 = "FCRecordFieldURLProtocol.m";
    __int16 v14 = 1024;
    int v15 = 36;
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
  }
  id WeakRetained = objc_loadWeakRetained(&s_database);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    Class v7 = NSClassFromString(&cfstr_Xctest.isa);

    if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)[[NSString alloc] initWithFormat:@"record field URL protocol has already been setup"];
      int v10 = 136315906;
      v11 = "+[FCRecordFieldURLProtocol setupWithArticleDatabase:]";
      __int16 v12 = 2080;
      v13 = "FCRecordFieldURLProtocol.m";
      __int16 v14 = 1024;
      int v15 = 37;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
    }
  }
  objc_storeWeak(&s_database, v4);
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
  v3 = [a3 host];
  char v4 = [v3 isEqualToString:@"news-record"];

  return v4;
}

+ (void)unregister
{
  id WeakRetained = objc_loadWeakRetained(&s_database);

  if (WeakRetained)
  {
    objc_storeWeak(&s_database, 0);
    char v4 = (void *)MEMORY[0x1E4F18DA0];
    [v4 unregisterClass:a1];
  }
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
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [(FCRecordFieldURLProtocol *)self fetchOperation];

  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v20 = (void *)[[NSString alloc] initWithFormat:@"shouldn't have a fetch operation yet"];
    *(_DWORD *)location = 136315906;
    *(void *)&location[4] = "-[FCRecordFieldURLProtocol startLoading]";
    __int16 v32 = 2080;
    v33 = "FCRecordFieldURLProtocol.m";
    __int16 v34 = 1024;
    int v35 = 99;
    __int16 v36 = 2114;
    v37 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", location, 0x26u);
  }
  char v4 = [(NSURLProtocol *)self request];
  id v5 = [v4 URL];

  id v6 = [v5 pathComponents];
  if ((unint64_t)[v6 count] <= 2)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke;
    v28[3] = &unk_1E5B4C018;
    v28[4] = self;
    __40__FCRecordFieldURLProtocol_startLoading__block_invoke((uint64_t)v28);
  }
  else
  {
    Class v7 = [v5 pathComponents];
    v8 = [v7 objectAtIndexedSubscript:1];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v8];
    int v10 = [v5 pathComponents];
    v11 = [v10 objectAtIndexedSubscript:2];

    __int16 v12 = objc_alloc_init(FCCKContentFetchOperation);
    id WeakRetained = objc_loadWeakRetained(&s_database);
    -[FCCKContentFetchOperation setDatabase:]((uint64_t)v12, WeakRetained);

    v30 = v9;
    int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    if (v12) {
      objc_setProperty_nonatomic_copy(v12, v14, v15, 384);
    }

    v29 = v11;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    if (v12) {
      objc_setProperty_nonatomic_copy(v12, v16, v17, 400);
    }

    objc_initWeak((id *)location, self);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_2;
    v24 = &unk_1E5B54538;
    objc_copyWeak(&v27, (id *)location);
    id v18 = v11;
    id v25 = v18;
    id v26 = v5;
    if (v12) {
      objc_setProperty_nonatomic_copy(v12, v19, &v21, 416);
    }
    -[FCRecordFieldURLProtocol setFetchOperation:](self, "setFetchOperation:", v12, v21, v22, v23, v24);
    [(FCOperation *)v12 start];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)location);
  }
}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Record field URL protocol has invalid path.");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [*(id *)(a1 + 32) client];
  [v2 URLProtocol:*(void *)(a1 + 32) didFailWithError:v3];
}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    int v10 = [v9 fetchOperation];
    char v11 = [v10 isCancelled];

    if ((v11 & 1) == 0)
    {
      if (v6)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_5;
        v39[3] = &unk_1E5B4BE70;
        id v40 = v9;
        id v41 = v6;
        __40__FCRecordFieldURLProtocol_startLoading__block_invoke_5((uint64_t)v39);

        __int16 v12 = v40;
      }
      else
      {
        v13 = [v5 allValues];
        __int16 v12 = [v13 firstObject];

        if (v12)
        {
          __int16 v14 = [v12 objectForKeyedSubscript:*(void *)(a1 + 32)];
          if (v14)
          {
            id v15 = v14;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              __int16 v16 = [MEMORY[0x1E4F29088] componentsWithString:v15];
              if (v16)
              {
                id v17 = objc_loadWeakRetained(&s_database);
                int v18 = [v17 shouldUseSecureConnectionForCKAssetURLs];

                if (v18) {
                  [v16 setScheme:@"https"];
                }
                id v19 = objc_loadWeakRetained(&s_database);
                [v19 updateAssetURLHostIfNeededWithComponents:v16];

                __int16 v20 = [v16 URL];
                if (v20)
                {
                  v30 = v16;
                  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:v20];
                  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F18DB0]) initWithURL:v20 MIMEType:0 expectedContentLength:0 textEncodingName:0];
                  v23 = [v9 client];
                  [v23 URLProtocol:v9 wasRedirectedToRequest:v21 redirectResponse:v22];

                  __int16 v16 = v30;
                }
                else
                {
                  v31[0] = MEMORY[0x1E4F143A8];
                  v31[1] = 3221225472;
                  v31[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_9;
                  v31[3] = &unk_1E5B4C018;
                  id v32 = v9;
                  __40__FCRecordFieldURLProtocol_startLoading__block_invoke_9((uint64_t)v31);
                }
              }
              else
              {
                v33[0] = MEMORY[0x1E4F143A8];
                v33[1] = 3221225472;
                v33[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_8;
                v33[3] = &unk_1E5B4C018;
                id v34 = v9;
                __40__FCRecordFieldURLProtocol_startLoading__block_invoke_8((uint64_t)v33);
                __int16 v20 = v34;
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v24 = v15;
                if (objc_msgSend(v24, "fc_isGzipped"))
                {
                  uint64_t v25 = objc_msgSend(v24, "fc_gzipInflate");

                  id v24 = (id)v25;
                }
                id v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F18DB0]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", *(void *)(a1 + 40), @"application/octet-stream", objc_msgSend(v24, "length"), 0);
                id v27 = [v9 client];
                [v27 URLProtocol:v9 didReceiveResponse:v26 cacheStoragePolicy:2];

                v28 = [v9 client];
                [v28 URLProtocol:v9 didLoadData:v24];

                v29 = [v9 client];
                [v29 URLProtocolDidFinishLoading:v9];
              }
            }
          }
          else
          {
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_7;
            v35[3] = &unk_1E5B4C018;
            id v36 = v9;
            __40__FCRecordFieldURLProtocol_startLoading__block_invoke_7((uint64_t)v35);

            id v15 = 0;
          }
        }
        else
        {
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __40__FCRecordFieldURLProtocol_startLoading__block_invoke_6;
          v37[3] = &unk_1E5B4C018;
          id v38 = v9;
          __40__FCRecordFieldURLProtocol_startLoading__block_invoke_6((uint64_t)v37);
          id v15 = v38;
        }
      }
    }
  }
}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  [v2 URLProtocol:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_6(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Record field URL protocol is missing requested record.");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) client];
  [v2 URLProtocol:*(void *)(a1 + 32) didFailWithError:v3];
}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_7(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Record field URL protocol is missing requested field.");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) client];
  [v2 URLProtocol:*(void *)(a1 + 32) didFailWithError:v3];
}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_8(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Record field URL protocol is missing valid URL components.");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) client];
  [v2 URLProtocol:*(void *)(a1 + 32) didFailWithError:v3];
}

void __40__FCRecordFieldURLProtocol_startLoading__block_invoke_9(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Record field URL protocol is missing valid URL.");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) client];
  [v2 URLProtocol:*(void *)(a1 + 32) didFailWithError:v3];
}

- (void)stopLoading
{
  id v3 = [(FCRecordFieldURLProtocol *)self fetchOperation];
  char v4 = [v3 isFinished];

  if ((v4 & 1) == 0)
  {
    id v5 = [(FCRecordFieldURLProtocol *)self fetchOperation];
    [v5 cancel];
  }
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