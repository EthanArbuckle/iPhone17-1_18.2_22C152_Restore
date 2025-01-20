@interface QLPreviewURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)isSafeRequest:(id)a3;
+ (BOOL)isSafeURL:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)_errorForAbort;
+ (id)_errorForCancel;
+ (id)canonicalRequestForRequest:(id)a3;
+ (id)errorForURL:(id)a3;
+ (id)mimeTypeForAttachmentURL:(id)a3;
+ (id)newURLWithContentID:(id)a3 baseURL:(id)a4;
+ (id)newUniqueURLWithName:(id)a3;
+ (id)protocolScheme;
+ (void)_dumpPendingProtocols;
+ (void)_unregisterURL:(id)a3;
+ (void)appendData:(id)a3 forURL:(id)a4 lastChunk:(BOOL)a5;
+ (void)cancelLoadingProtocol:(id)a3;
+ (void)initialize;
+ (void)registerPreview:(id)a3 forPreviewURL:(id)a4;
+ (void)registerURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5;
+ (void)setError:(id)a3 forURL:(id)a4;
+ (void)startLoadingProtocol:(id)a3;
+ (void)stopLoadingProtocol:(id)a3;
+ (void)stopLoadingProtocol:(id)a3 isCancel:(BOOL)a4;
+ (void)unregisterURLs:(id)a3 andPreviewURL:(id)a4;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation QLPreviewURLProtocol

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4 = (void *)urlToPreviews;
    urlToPreviews = (uint64_t)v3;

    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6 = (void *)urlToAttachmentData;
    urlToAttachmentData = (uint64_t)v5;

    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = (void *)urlToProtocols;
    urlToProtocols = (uint64_t)v7;

    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v10 = (void *)urlToAttachmentDescriptions;
    urlToAttachmentDescriptions = (uint64_t)v9;

    [MEMORY[0x263F08BC8] registerClass:a1];
    protocolQueue = (uint64_t)dispatch_queue_create("quicklook.urlloading", 0);
    MEMORY[0x270F9A758]();
  }
}

+ (id)newUniqueURLWithName:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [v5 UUIDString];
  if (v4)
  {
    id v7 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    v8 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v7];

    id v9 = NSString;
    v10 = [a1 protocolScheme];
    v11 = [v9 stringWithFormat:@"%@://%@/%@/%@", v10, v6, @"x-apple-ql-magic", v8];
  }
  else
  {
    v12 = NSString;
    v8 = [a1 protocolScheme];
    v11 = [v12 stringWithFormat:@"%@://%@/%@/", v8, v6, @"x-apple-ql-magic"];
  }

  v13 = [NSURL URLWithString:v11];

  return v13;
}

+ (id)newURLWithContentID:(id)a3 baseURL:(id)a4
{
  v6 = (void *)MEMORY[0x263F08708];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 URLPathAllowedCharacterSet];
  v10 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v9];

  v11 = [v7 host];

  v12 = [a1 protocolScheme];
  CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"%@://%@/%@/%@", v12, v11, @"x-apple-ql-attachment", v10);

  CFURLRef v14 = CFURLCreateWithString(0, v13, 0);
  CFRelease(v13);

  return v14;
}

+ (void)registerPreview:(id)a3 forPreviewURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 hash];
  id v7 = protocolQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__QLPreviewURLProtocol_registerPreview_forPreviewURL___block_invoke;
  v10[3] = &unk_2642F2250;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

uint64_t __54__QLPreviewURLProtocol_registerPreview_forPreviewURL___block_invoke(uint64_t a1)
{
  v2 = _log_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __54__QLPreviewURLProtocol_registerPreview_forPreviewURL___block_invoke_cold_1();
  }

  return [(id)urlToPreviews setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

+ (void)registerURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = protocolQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__QLPreviewURLProtocol_registerURL_mimeType_textEncoding___block_invoke;
  block[3] = &unk_2642F2578;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_sync(v10, block);
}

void __58__QLPreviewURLProtocol_registerURL_mimeType_textEncoding___block_invoke(void *a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = _log_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__QLPreviewURLProtocol_registerURL_mimeType_textEncoding___block_invoke_cold_1();
  }

  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = v3;
  uint64_t v5 = a1[5];
  if (v5) {
    [v3 setObject:v5 forKey:@"mimeType"];
  }
  uint64_t v6 = a1[6];
  if (v6) {
    [v4 setObject:v6 forKey:@"textEncoding"];
  }
  v21 = v4;
  [(id)urlToAttachmentDescriptions setObject:v4 forKey:a1[4]];
  id v7 = [(id)urlToProtocols objectForKey:a1[4]];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        id v13 = [v12 client];
        CFURLRef v14 = _log_2();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = a1[4];
          id v17 = (__CFString *)a1[5];
          if (!v17) {
            id v17 = @"unknown";
          }
          v18 = (__CFString *)a1[6];
          if (!v18) {
            v18 = @"unknown";
          }
          *(_DWORD *)buf = 138412802;
          uint64_t v27 = v16;
          __int16 v28 = 2112;
          v29 = v17;
          __int16 v30 = 2112;
          v31 = v18;
          _os_log_debug_impl(&dword_217F31000, v14, OS_LOG_TYPE_DEBUG, "Will send response for %@ of type %@ - %@", buf, 0x20u);
        }

        id v15 = (void *)[objc_allocWithZone(MEMORY[0x263F08BE8]) initWithURL:a1[4] MIMEType:a1[5] expectedContentLength:-1 textEncodingName:a1[6]];
        [v13 URLProtocol:v12 didReceiveResponse:v15 cacheStoragePolicy:2];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v19 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
      uint64_t v9 = v19;
    }
    while (v19);
  }
  id v20 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(id)urlToAttachmentData setObject:v20 forKey:a1[4]];
}

+ (id)_errorForAbort
{
  v2 = (void *)_errorForAbort_result;
  if (!_errorForAbort_result)
  {
    id v3 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v4 = [v3 initWithDomain:*MEMORY[0x263F08570] code:-1008 userInfo:0];
    uint64_t v5 = (void *)_errorForAbort_result;
    _errorForAbort_result = v4;

    v2 = (void *)_errorForAbort_result;
  }
  return v2;
}

+ (id)_errorForCancel
{
  v2 = (void *)_errorForCancel_result;
  if (!_errorForCancel_result)
  {
    id v3 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v4 = [v3 initWithDomain:*MEMORY[0x263F08570] code:-999 userInfo:0];
    uint64_t v5 = (void *)_errorForCancel_result;
    _errorForCancel_result = v4;

    v2 = (void *)_errorForCancel_result;
  }
  return v2;
}

+ (void)_unregisterURL:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _log_2();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[QLPreviewURLProtocol _unregisterURL:]();
  }

  uint64_t v6 = [(id)urlToProtocols objectForKey:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&long long v8 = 138412546;
    long long v16 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "client", v16);
        CFURLRef v14 = _log_2();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v16;
          long long v22 = v12;
          __int16 v23 = 2112;
          id v24 = v4;
          _os_log_debug_impl(&dword_217F31000, v14, OS_LOG_TYPE_DEBUG, "Aborting %@ loading %@", buf, 0x16u);
        }

        id v15 = [a1 _errorForAbort];
        [v13 URLProtocol:v12 didFailWithError:v15];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v9);
  }
  [(id)urlToProtocols removeObjectForKey:v4];
  [(id)urlToAttachmentData removeObjectForKey:v4];
  [(id)urlToAttachmentDescriptions removeObjectForKey:v4];
}

+ (void)unregisterURLs:(id)a3 andPreviewURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = protocolQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__QLPreviewURLProtocol_unregisterURLs_andPreviewURL___block_invoke;
  block[3] = &unk_2642F25A0;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

uint64_t __53__QLPreviewURLProtocol_unregisterURLs_andPreviewURL___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 48), "_unregisterURL:", *(void *)(*((void *)&v9 + 1) + 8 * v6++), (void)v9);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id v7 = _log_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __53__QLPreviewURLProtocol_unregisterURLs_andPreviewURL___block_invoke_cold_1();
  }

  return [(id)urlToPreviews removeObjectForKey:*(void *)(a1 + 40)];
}

+ (void)appendData:(id)a3 forURL:(id)a4 lastChunk:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  [v8 hash];
  long long v9 = protocolQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__QLPreviewURLProtocol_appendData_forURL_lastChunk___block_invoke;
  block[3] = &unk_2642F25C8;
  id v13 = v8;
  id v14 = v7;
  BOOL v15 = a5;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __52__QLPreviewURLProtocol_appendData_forURL_lastChunk___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = [(id)urlToProtocols objectForKey:*(void *)(a1 + 32)];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v22;
    *(void *)&long long v4 = 134218498;
    long long v20 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        long long v9 = objc_msgSend(v8, "client", v20);
        id v10 = *(void **)(a1 + 40);
        if (v10 && [v10 length])
        {
          id v11 = _log_2();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v14 = [*(id *)(a1 + 40) length];
            uint64_t v15 = *(void *)(a1 + 32);
            long long v16 = "(last chunk)";
            if (!*(unsigned char *)(a1 + 48)) {
              long long v16 = "";
            }
            *(_DWORD *)buf = v20;
            uint64_t v26 = v14;
            __int16 v27 = 2112;
            uint64_t v28 = v15;
            __int16 v29 = 2080;
            __int16 v30 = v16;
            _os_log_debug_impl(&dword_217F31000, v11, OS_LOG_TYPE_DEBUG, "Appending %lu bytes for %@%s", buf, 0x20u);
          }

          [v9 URLProtocol:v8 didLoadData:*(void *)(a1 + 40)];
        }
        if (*(unsigned char *)(a1 + 48))
        {
          long long v12 = _log_2();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v13 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v26 = v13;
            _os_log_debug_impl(&dword_217F31000, v12, OS_LOG_TYPE_DEBUG, "Finishing load of %@", buf, 0xCu);
          }

          [v9 URLProtocolDidFinishLoading:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v17 = [v2 countByEnumeratingWithState:&v21 objects:v31 count:16];
      uint64_t v5 = v17;
    }
    while (v17);
  }
  if (*(unsigned char *)(a1 + 48)) {
    [(id)urlToProtocols removeObjectForKey:*(void *)(a1 + 32)];
  }
  if (*(void *)(a1 + 40))
  {
    long long v18 = [(id)urlToAttachmentData objectForKey:*(void *)(a1 + 32)];
    [v18 appendData:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    long long v19 = [(id)urlToAttachmentDescriptions objectForKey:*(void *)(a1 + 32)];
    [v19 setObject:*MEMORY[0x263EFFB40] forKey:@"complete"];
  }
}

+ (void)setError:(id)a3 forURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 hash];
  uint64_t v7 = protocolQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__QLPreviewURLProtocol_setError_forURL___block_invoke;
  v10[3] = &unk_2642F2250;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void __40__QLPreviewURLProtocol_setError_forURL___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [(id)urlToProtocols objectForKey:*(void *)(a1 + 32)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 138412802;
    long long v14 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "client", v14);
        id v10 = _log_2();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          uint64_t v11 = *(void *)(a1 + 40);
          *(_DWORD *)buf = v14;
          uint64_t v20 = v11;
          __int16 v21 = 2112;
          long long v22 = v8;
          __int16 v23 = 2112;
          uint64_t v24 = v12;
          _os_log_debug_impl(&dword_217F31000, v10, OS_LOG_TYPE_DEBUG, "Notifying %@ for %@ loading %@", buf, 0x20u);
        }

        [v9 URLProtocol:v8 didFailWithError:*(void *)(a1 + 40)];
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v5);
  }
  [(id)urlToProtocols removeObjectForKey:*(void *)(a1 + 32)];
  uint64_t v13 = [(id)urlToAttachmentDescriptions objectForKey:*(void *)(a1 + 32)];
  [v13 setObject:*MEMORY[0x263EFFB40] forKey:@"complete"];
  [v13 setObject:*(void *)(a1 + 40) forKey:@"error"];
}

+ (id)errorForURL:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__2;
  long long v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  long long v4 = protocolQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__QLPreviewURLProtocol_errorForURL___block_invoke;
  v8[3] = &unk_2642F25F0;
  id v9 = v3;
  id v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __36__QLPreviewURLProtocol_errorForURL___block_invoke(uint64_t a1)
{
  id v6 = [(id)urlToAttachmentDescriptions objectForKey:*(void *)(a1 + 32)];
  id v2 = [v6 objectForKey:@"error"];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)startLoadingProtocol:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 request];
  id v5 = [v4 URL];
  [v5 hash];
  id v6 = protocolQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke;
  v9[3] = &unk_2642F2250;
  id v10 = v3;
  id v11 = v5;
  id v7 = v5;
  id v8 = v3;
  dispatch_async(v6, v9);
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke(uint64_t a1)
{
  id v2 = _log_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_8();
  }

  id v3 = (void *)(a1 + 40);
  uint64_t v4 = [(id)urlToAttachmentDescriptions objectForKey:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) client];
  if (v4)
  {
    id v6 = [v4 objectForKey:@"error"];
    id v7 = [(id)urlToAttachmentData objectForKey:*v3];
    id v8 = v7;
    if (v6 && (!v7 || ![v7 length])) {
      goto LABEL_15;
    }
    id v9 = _log_2();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_7(a1 + 40, v4);
    }

    id v10 = objc_allocWithZone(MEMORY[0x263F08BE8]);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [v4 objectForKey:@"mimeType"];
    uint64_t v13 = [v4 objectForKey:@"textEncoding"];
    long long v14 = (void *)[v10 initWithURL:v11 MIMEType:v12 expectedContentLength:-1 textEncodingName:v13];

    [v5 URLProtocol:*(void *)(a1 + 32) didReceiveResponse:v14 cacheStoragePolicy:2];
    if (v8 && [v8 length])
    {
      long long v15 = _log_2();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_6(v8);
      }

      [v5 URLProtocol:*(void *)(a1 + 32) didLoadData:v8];
    }

    if (v6)
    {
LABEL_15:
      id v16 = _log_2();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_5();
      }

      [v5 URLProtocol:*(void *)(a1 + 32) didFailWithError:v6];
    }
    long long v17 = [v4 objectForKey:@"complete"];
    long long v18 = (void *)*MEMORY[0x263EFFB40];

    long long v19 = _log_2();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    if (v17 != v18)
    {
      if (v20) {
        __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_4();
      }

LABEL_26:
      id v6 = [(id)urlToProtocols objectForKey:*v3];
      if (!v6)
      {
        id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        [(id)urlToProtocols setObject:v6 forKey:*v3];
      }
      [v6 addObject:*(void *)(a1 + 32)];
      goto LABEL_35;
    }
    if (v20) {
      __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_3();
    }

    [v5 URLProtocolDidFinishLoading:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = [(id)urlToPreviews objectForKey:*v3];
    __int16 v21 = _log_2();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v22) {
        __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_2();
      }

      [v6 startComputingPreview];
      goto LABEL_26;
    }
    if (v22) {
      __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_1();
    }

    __int16 v23 = NSDictionary;
    uint64_t v24 = [*(id *)(a1 + 40) absoluteString];
    objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, *MEMORY[0x263F08588], 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    long long v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1008 userInfo:v6];
    [v5 URLProtocol:*(void *)(a1 + 32) didFailWithError:v25];
  }
LABEL_35:
}

+ (void)stopLoadingProtocol:(id)a3 isCancel:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 request];
  id v8 = [v7 URL];
  [v8 hash];
  id v9 = protocolQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__QLPreviewURLProtocol_stopLoadingProtocol_isCancel___block_invoke;
  v12[3] = &unk_2642F2618;
  BOOL v16 = a4;
  id v13 = v8;
  id v14 = v6;
  id v15 = a1;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(v9, v12);
}

void __53__QLPreviewURLProtocol_stopLoadingProtocol_isCancel___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = [(id)urlToPreviews objectForKey:*(void *)(a1 + 32)];
    if (v2)
    {
      id v3 = [(id)urlToAttachmentDescriptions objectForKey:*(void *)(a1 + 32)];
      uint64_t v4 = [v3 objectForKey:@"complete"];
      id v5 = (void *)*MEMORY[0x263EFFB38];

      if (v4 == v5) {
        [v2 cancel];
      }
    }
  }
  id v6 = (void *)(a1 + 32);
  id v7 = [(id)urlToProtocols objectForKey:*(void *)(a1 + 32)];
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)(a1 + 40);
    if ([v7 containsObject:*(void *)(a1 + 40)])
    {
      id v10 = [*(id *)(a1 + 40) client];
      uint64_t v12 = *(void *)(a1 + 40);
      id v11 = *(void **)(a1 + 48);
      if (*(unsigned char *)(a1 + 56)) {
        [v11 _errorForCancel];
      }
      else {
      id v13 = [v11 _errorForAbort];
      }
      [v10 URLProtocol:v12 didFailWithError:v13];

      [v8 removeObject:*v9];
      if (![v8 count]) {
        [(id)urlToProtocols removeObjectForKey:*v6];
      }
      id v14 = _log_2();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __53__QLPreviewURLProtocol_stopLoadingProtocol_isCancel___block_invoke_cold_1();
      }
    }
  }
}

+ (void)stopLoadingProtocol:(id)a3
{
}

+ (void)cancelLoadingProtocol:(id)a3
{
}

+ (void)_dumpPendingProtocols
{
}

void __45__QLPreviewURLProtocol__dumpPendingProtocols__block_invoke()
{
  v0 = _log_2();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __45__QLPreviewURLProtocol__dumpPendingProtocols__block_invoke_cold_1();
  }
}

+ (id)protocolScheme
{
  return @"x-apple-ql-id2";
}

+ (BOOL)isSafeURL:(id)a3
{
  uint64_t v4 = [a3 scheme];
  if (v4)
  {
    id v5 = [a1 protocolScheme];
    BOOL v6 = [v5 caseInsensitiveCompare:v4] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isSafeRequest:(id)a3
{
  uint64_t v4 = [a3 URL];
  LOBYTE(a1) = [a1 isSafeURL:v4];

  return (char)a1;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v4 = a3;
  char v5 = [a1 isSafeRequest:v4];
  BOOL v6 = _log_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[QLPreviewURLProtocol canInitWithRequest:](v4);
  }

  return v5;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  id v4 = _log_2();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[QLPreviewURLProtocol canonicalRequestForRequest:](v3, v4);
  }

  return v3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 URL];
  id v8 = [v6 URL];
  int v9 = [v7 isEqual:v8];

  id v10 = _log_2();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v5 URL];
    uint64_t v13 = [v6 URL];
    id v14 = (void *)v13;
    id v15 = "NO";
    int v16 = 138412802;
    long long v17 = v12;
    if (v9) {
      id v15 = "YES";
    }
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2080;
    __int16 v21 = v15;
    _os_log_debug_impl(&dword_217F31000, v10, OS_LOG_TYPE_DEBUG, "Testing cache equivalent %@ vs. %@: %s", (uint8_t *)&v16, 0x20u);
  }
  return v9;
}

+ (id)mimeTypeForAttachmentURL:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  id v4 = protocolQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__QLPreviewURLProtocol_mimeTypeForAttachmentURL___block_invoke;
  v8[3] = &unk_2642F25F0;
  id v9 = v3;
  id v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __49__QLPreviewURLProtocol_mimeTypeForAttachmentURL___block_invoke(uint64_t a1)
{
  id v5 = [(id)urlToAttachmentDescriptions objectForKey:*(void *)(a1 + 32)];
  uint64_t v2 = [v5 objectForKey:@"mimeType"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)startLoading
{
  uint64_t v3 = objc_opt_class();
  [v3 startLoadingProtocol:self];
}

- (void)stopLoading
{
  uint64_t v3 = objc_opt_class();
  [v3 stopLoadingProtocol:self];
}

void __54__QLPreviewURLProtocol_registerPreview_forPreviewURL___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_217F31000, v0, OS_LOG_TYPE_DEBUG, "Registering %@ at url %@", v1, 0x16u);
}

void __58__QLPreviewURLProtocol_registerURL_mimeType_textEncoding___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_217F31000, v0, v1, "Registering %@", v2, v3, v4, v5, v6);
}

+ (void)_unregisterURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_217F31000, v0, v1, "Unregistering %@", v2, v3, v4, v5, v6);
}

void __53__QLPreviewURLProtocol_unregisterURLs_andPreviewURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_217F31000, v0, v1, "Unregistering preview url %@ and URLs %@");
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_217F31000, v0, v1, "  No resource available at %@", v2, v3, v4, v5, v6);
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_217F31000, v0, v1, "  Starting computing %@ (url: %@)");
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_217F31000, v0, v1, "  Resource at %@ is already complete", v2, v3, v4, v5, v6);
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_217F31000, v0, v1, "  Resource at %@ is not yet complete", v2, v3, v4, v5, v6);
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = v0;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = v1;
  OUTLINED_FUNCTION_3(&dword_217F31000, v1, v2, "  Found resource at %@ with error %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_6(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_217F31000, v1, v2, "  Already have %lu bytes for %@", v3, v4, v5, v6, v7);
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_7(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKey:@"mimeType"];
  uint64_t v4 = [a2 objectForKey:@"textEncoding"];
  OUTLINED_FUNCTION_1_1(&dword_217F31000, v5, v6, "  Found resource at %@ of type %@ - %@", v7, v8, v9, v10, 2u);
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_8()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_2(v0);
  OUTLINED_FUNCTION_1_1(&dword_217F31000, v2, v3, "Starting load of <%@ %p> for %@", v4, v5, v6, v7, v8);
}

void __53__QLPreviewURLProtocol_stopLoadingProtocol_isCancel___block_invoke_cold_1()
{
  uint64_t v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_2(v0);
  OUTLINED_FUNCTION_1_1(&dword_217F31000, v2, v3, "Stopping load of <%@ %p> for %@", v4, v5, v6, v7, v8);
}

void __45__QLPreviewURLProtocol__dumpPendingProtocols__block_invoke_cold_1()
{
  [(id)urlToProtocols count];
  uint64_t v0 = [(id)urlToProtocols allKeys];
  uint64_t v7 = [v0 description];
  OUTLINED_FUNCTION_7(&dword_217F31000, v1, v2, "%ld URLs for protocols remaining:\n%@", v3, v4, v5, v6, 2u);
}

+ (void)canInitWithRequest:(void *)a1 .cold.1(void *a1)
{
  uint64_t v2 = [a1 URL];
  uint64_t v3 = [a1 mainDocumentURL];
  OUTLINED_FUNCTION_1_1(&dword_217F31000, v4, v5, "Will support request %@ (%@): %s", v6, v7, v8, v9, 2u);
}

+ (void)canonicalRequestForRequest:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 URL];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_217F31000, a2, OS_LOG_TYPE_DEBUG, "Asked for canonical request for %@", v4, 0xCu);
}

@end