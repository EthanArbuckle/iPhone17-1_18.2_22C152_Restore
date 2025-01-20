@interface QLPreviewParts
+ (Class)urlProtocolClass;
+ (id)registeredPreviewForURL:(id)a3;
+ (id)relativeStringForSafeURL:(id)a3;
+ (void)registerPreview:(id)a3;
+ (void)unregisterPreview:(id)a3;
- (BOOL)isRegisteredURL:(id)a3;
- (NSMutableDictionary)encodingsForURLs;
- (NSMutableSet)outstandingURLs;
- (NSMutableSet)registeredURLs;
- (NSURL)previewURL;
- (NSURLRequest)previewRequest;
- (id)newAttachmentURLWithID:(id)a3 mimeType:(id)a4 textEncoding:(id)a5;
- (id)newSafeAttachmentURLWithID:(id)a3 mimeType:(id)a4 textEncoding:(id)a5;
- (id)requestForURL:(id)a3;
- (id)voidRequest;
- (unsigned)cfEncodingForAttachmentURL:(id)a3;
- (void)appendData:(id)a3 forURL:(id)a4 lastChunk:(BOOL)a5;
- (void)computePreviewInThread;
- (void)dealloc;
- (void)registerURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5;
- (void)setEncodingsForURLs:(id)a3;
- (void)setOutstandingURLs:(id)a3;
- (void)setPreviewURL:(id)a3;
- (void)setRegisteredURLs:(id)a3;
- (void)startAttachmentWithURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5;
- (void)startComputingPreview;
- (void)startDataRepresentationWithMimeType:(id)a3 textEncoding:(id)a4;
@end

@implementation QLPreviewParts

+ (Class)urlProtocolClass
{
  return (Class)objc_opt_class();
}

+ (void)registerPreview:(id)a3
{
  id v4 = a3;
  objc_sync_enter(v4);
  v5 = _log_2();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[QLPreviewParts registerPreview:]();
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v4 setRegisteredURLs:v6];

  v7 = objc_msgSend((id)objc_msgSend(a1, "urlProtocolClass"), "newUniqueURLWithName:", 0);
  [v4 setPreviewURL:v7];

  v8 = (void *)[a1 urlProtocolClass];
  v9 = [v4 previewURL];
  [v8 registerPreview:v4 forPreviewURL:v9];

  objc_sync_exit(v4);
}

+ (void)unregisterPreview:(id)a3
{
  id v4 = a3;
  objc_sync_enter(v4);
  v5 = _log_2();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[QLPreviewParts unregisterPreview:]();
  }

  id v6 = (void *)[a1 urlProtocolClass];
  v7 = [v4 registeredURLs];
  v8 = [v4 previewURL];
  [v6 unregisterURLs:v7 andPreviewURL:v8];

  [v4 setRegisteredURLs:0];
  [v4 setPreviewURL:0];
  [v4 setOutstandingURLs:0];
  [v4 setEncodingsForURLs:0];
  objc_sync_exit(v4);
}

+ (id)registeredPreviewForURL:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  id v4 = protocolQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__QLPreviewParts_registeredPreviewForURL___block_invoke;
  v8[3] = &unk_2642F2498;
  id v9 = v3;
  v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __42__QLPreviewParts_registeredPreviewForURL___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)urlToPreviews objectForKey:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

+ (id)relativeStringForSafeURL:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = [v4 scheme];
  id v6 = [v4 host];
  v7 = [v3 stringWithFormat:@"%@://%@", v5, v6];

  v8 = [NSString stringWithFormat:@"%@/%@/", v7, @"x-apple-ql-magic"];
  id v9 = [NSString stringWithFormat:@"%@/%@/", v7, @"x-apple-ql-attachment"];
  v10 = [v4 absoluteString];

  char v11 = [v10 hasPrefix:v8];
  v12 = v8;
  if ((v11 & 1) != 0
    || ([v10 hasPrefix:v9] & 1) == 0 && (int v13 = objc_msgSend(v10, "hasPrefix:", v7), v12 = v7, v13))
  {
    v14 = objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v12, "length"));
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)QLPreviewParts;
  [(QLPreviewParts *)&v2 dealloc];
}

- (void)startComputingPreview
{
  id v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__QLPreviewParts_startComputingPreview__block_invoke;
  block[3] = &unk_2642F2228;
  block[4] = self;
  dispatch_async(v3, block);
}

void __39__QLPreviewParts_startComputingPreview__block_invoke(uint64_t a1)
{
  objc_super v2 = (void *)MEMORY[0x21D45D430]();
  [*(id *)(a1 + 32) computePreviewInThread];
}

- (void)computePreviewInThread
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_217F31000, v1, OS_LOG_TYPE_ERROR, "Exception during preview computation of %@: %@", v2, 0x16u);
}

void __40__QLPreviewParts_computePreviewInThread__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v2 = [WeakRetained outstandingURLs];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v5 = (void *)[v4 initWithDomain:*MEMORY[0x263F08570] code:-1005 userInfo:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [WeakRetained outstandingURLs];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v16;
      *(void *)&long long v8 = 138412290;
      long long v14 = v8;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
          int v13 = _log_2();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v14;
            uint64_t v20 = v12;
            _os_log_impl(&dword_217F31000, v13, OS_LOG_TYPE_INFO, "Discarding loading of %@", buf, 0xCu);
          }

          objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "setError:forURL:", v5, v12);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v9);
    }
  }
  objc_msgSend(WeakRetained, "setOutstandingURLs:", 0, v14);
  [WeakRetained setEncodingsForURLs:0];
}

- (void)registerURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  registeredURLs = self->_registeredURLs;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(NSMutableSet *)registeredURLs addObject:v10];
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "registerURL:mimeType:textEncoding:", v10, v9, v8);
}

- (void)startDataRepresentationWithMimeType:(id)a3 textEncoding:(id)a4
{
  id v14 = a3;
  id v6 = (__CFString *)a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = [(QLPreviewParts *)v7 previewURL];

  if (v8)
  {
    uint64_t v9 = 134217984;
    if (v6)
    {
      CFStringEncoding v10 = CFStringConvertIANACharSetNameToEncoding(v6);
      if (v10 == -1) {
        uint64_t v9 = 134217984;
      }
      else {
        uint64_t v9 = v10;
      }
    }
    encodingsForURLs = v7->_encodingsForURLs;
    uint64_t v12 = [NSNumber numberWithUnsignedInt:v9];
    [(NSMutableDictionary *)encodingsForURLs setObject:v12 forKey:v7->_previewURL];

    int v13 = [(QLPreviewParts *)v7 previewURL];
    [(QLPreviewParts *)v7 registerURL:v13 mimeType:v14 textEncoding:v6];
  }
  objc_sync_exit(v7);
}

- (void)startAttachmentWithURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  uint64_t v9 = (__CFString *)a5;
  CFStringEncoding v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(QLPreviewParts *)v10 previewURL];

  if (v11)
  {
    uint64_t v12 = 134217984;
    if (v9)
    {
      CFStringEncoding v13 = CFStringConvertIANACharSetNameToEncoding(v9);
      if (v13 == -1) {
        uint64_t v12 = 134217984;
      }
      else {
        uint64_t v12 = v13;
      }
    }
    encodingsForURLs = v10->_encodingsForURLs;
    long long v15 = [NSNumber numberWithUnsignedInt:v12];
    [(NSMutableDictionary *)encodingsForURLs setObject:v15 forKey:v16];

    [(NSMutableSet *)v10->_outstandingURLs addObject:v16];
    [(QLPreviewParts *)v10 registerURL:v16 mimeType:v8 textEncoding:v9];
  }
  objc_sync_exit(v10);
}

- (BOOL)isRegisteredURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  char v6 = [(NSMutableSet *)v5->_registeredURLs containsObject:v4];
  objc_sync_exit(v5);

  return v6;
}

- (id)newAttachmentURLWithID:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  CFStringEncoding v10 = (__CFString *)a5;
  uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "newUniqueURLWithName:", v8);
  uint64_t v12 = self;
  objc_sync_enter(v12);
  CFStringEncoding v13 = [(QLPreviewParts *)v12 previewURL];

  if (v13)
  {
    uint64_t v14 = 134217984;
    if (v10)
    {
      CFStringEncoding v15 = CFStringConvertIANACharSetNameToEncoding(v10);
      if (v15 == -1) {
        uint64_t v14 = 134217984;
      }
      else {
        uint64_t v14 = v15;
      }
    }
    encodingsForURLs = v12->_encodingsForURLs;
    long long v17 = [NSNumber numberWithUnsignedInt:v14];
    [(NSMutableDictionary *)encodingsForURLs setObject:v17 forKey:v11];

    [(NSMutableSet *)v12->_outstandingURLs addObject:v11];
    [(QLPreviewParts *)v12 registerURL:v11 mimeType:v9 textEncoding:v10];
  }
  objc_sync_exit(v12);

  return v11;
}

- (id)newSafeAttachmentURLWithID:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  CFStringEncoding v10 = (__CFString *)a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  uint64_t v12 = [(QLPreviewParts *)v11 previewURL];

  if (v12)
  {
    CFStringEncoding v13 = (void *)[(id)objc_opt_class() urlProtocolClass];
    uint64_t v14 = [(QLPreviewParts *)v11 previewURL];
    CFStringEncoding v15 = (void *)[v13 newURLWithContentID:v8 baseURL:v14];
    uint64_t v16 = 134217984;

    if (v10)
    {
      CFStringEncoding v17 = CFStringConvertIANACharSetNameToEncoding(v10);
      if (v17 == -1) {
        uint64_t v16 = 134217984;
      }
      else {
        uint64_t v16 = v17;
      }
    }
    encodingsForURLs = v11->_encodingsForURLs;
    v19 = [NSNumber numberWithUnsignedInt:v16];
    [(NSMutableDictionary *)encodingsForURLs setObject:v19 forKey:v15];

    [(NSMutableSet *)v11->_outstandingURLs addObject:v15];
    [(QLPreviewParts *)v11 registerURL:v15 mimeType:v9 textEncoding:v10];
    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    CFStringEncoding v15 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "newUniqueURLWithName:", v8);
  }

  return v15;
}

- (void)appendData:(id)a3 forURL:(id)a4 lastChunk:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  id v9 = self;
  objc_sync_enter(v9);
  CFStringEncoding v10 = [(QLPreviewParts *)v9 previewURL];

  if (v10)
  {
    if (!v8)
    {
      id v8 = [(QLPreviewParts *)v9 previewURL];
    }
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "appendData:forURL:lastChunk:", v11, v8, v5);
    if (v5) {
      [(NSMutableSet *)v9->_outstandingURLs removeObject:v8];
    }
  }
  objc_sync_exit(v9);
}

- (NSURLRequest)previewRequest
{
  id v3 = objc_alloc(MEMORY[0x263F08BD8]);
  id v4 = [(QLPreviewParts *)self previewURL];
  BOOL v5 = (void *)[v3 initWithURL:v4 cachePolicy:1 timeoutInterval:20.0];

  return (NSURLRequest *)v5;
}

- (id)voidRequest
{
  id v2 = objc_alloc(MEMORY[0x263F08BD8]);
  id v3 = [NSURL URLWithString:@"about:"];
  id v4 = (void *)[v2 initWithURL:v3];

  return v4;
}

- (id)requestForURL:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    char v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = [(QLPreviewParts *)v6 previewURL];
    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v5];
      [v8 setHTTPShouldHandleCookies:0];
      [v8 setMainDocumentURL:v7];
    }
    else
    {
      id v3 = [(QLPreviewParts *)v6 voidRequest];
      id v8 = 0;
    }

    objc_sync_exit(v6);
    if (v7) {
      id v3 = v8;
    }
  }
  else
  {
    id v3 = [(QLPreviewParts *)self voidRequest];
  }

  return v3;
}

- (unsigned)cfEncodingForAttachmentURL:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  char v6 = [(QLPreviewParts *)v5 previewURL];

  if (v6)
  {
    if (!v4)
    {
      id v4 = [(QLPreviewParts *)v5 previewURL];
    }
    uint64_t v7 = [(NSMutableDictionary *)v5->_encodingsForURLs objectForKey:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_sync_exit(v5);

  unsigned int v8 = 134217984;
  if (v6 && v7) {
    unsigned int v8 = [v7 unsignedIntValue];
  }

  return v8;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
}

- (NSMutableSet)outstandingURLs
{
  return self->_outstandingURLs;
}

- (void)setOutstandingURLs:(id)a3
{
}

- (NSMutableDictionary)encodingsForURLs
{
  return self->_encodingsForURLs;
}

- (void)setEncodingsForURLs:(id)a3
{
}

- (NSMutableSet)registeredURLs
{
  return self->_registeredURLs;
}

- (void)setRegisteredURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredURLs, 0);
  objc_storeStrong((id *)&self->_encodingsForURLs, 0);
  objc_storeStrong((id *)&self->_outstandingURLs, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
}

+ (void)registerPreview:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_217F31000, v0, v1, "Registering preview parts %@", v2, v3, v4, v5, v6);
}

+ (void)unregisterPreview:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_217F31000, v0, v1, "Unregistering preview parts %@", v2, v3, v4, v5, v6);
}

@end