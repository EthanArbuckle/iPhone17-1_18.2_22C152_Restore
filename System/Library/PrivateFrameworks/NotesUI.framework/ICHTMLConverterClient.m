@interface ICHTMLConverterClient
+ (id)sharedClient;
- (ICHTMLConverterClient)init;
- (OS_dispatch_queue)requestCountQueue;
- (id)attributedStringFromHTMLString:(id)a3;
- (unint64_t)requestCount;
- (void)attributedStringFromHTMLString:(id)a3 baseURL:(id)a4 timeoutDate:(id)a5 completionBlock:(id)a6;
- (void)dealloc;
- (void)resumeConnectionIfNeeded;
- (void)setRequestCount:(unint64_t)a3;
- (void)setRequestCountQueue:(id)a3;
- (void)suspendConnectionIfNeeded;
@end

@implementation ICHTMLConverterClient

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)sharedClient_sharedClient;
  return v2;
}

uint64_t __37__ICHTMLConverterClient_sharedClient__block_invoke()
{
  sharedClient_sharedClient = objc_alloc_init(ICHTMLConverterClient);
  return MEMORY[0x1F41817F8]();
}

- (ICHTMLConverterClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICHTMLConverterClient;
  v2 = [(ICHTMLConverterClient *)&v6 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.notes.htmlconverter", v3);
    [(ICHTMLConverterClient *)v2 setRequestCountQueue:v4];

    [(ICHTMLConverterClient *)v2 setRequestCount:0];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connectionToService invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ICHTMLConverterClient;
  [(ICHTMLConverterClient *)&v3 dealloc];
}

- (void)attributedStringFromHTMLString:(id)a3 baseURL:(id)a4 timeoutDate:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v12 timeIntervalSinceNow];
  if (v14 > 0.0)
  {
    v15 = (void *)[v13 copy];
    [(ICHTMLConverterClient *)self resumeConnectionIfNeeded];
    connectionToService = self->_connectionToService;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke;
    v24[3] = &unk_1E5FDB560;
    v24[4] = self;
    id v17 = v10;
    id v25 = v17;
    id v18 = v11;
    id v26 = v18;
    id v27 = v12;
    id v19 = v15;
    id v28 = v19;
    v20 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_2;
    v22[3] = &unk_1E5FDB588;
    v22[4] = self;
    id v23 = v19;
    id v21 = v19;
    [v20 attributedStringFromHTMLString:v17 baseURL:v18 completionBlock:v22];
  }
}

void __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_cold_1((uint64_t)v3, v4);
  }

  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_10;
  block[3] = &unk_1E5FDB538;
  objc_super v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

uint64_t __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) attributedStringFromHTMLString:*(void *)(a1 + 40) baseURL:*(void *)(a1 + 48) timeoutDate:*(void *)(a1 + 56) completionBlock:*(void *)(a1 + 64)];
}

void __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  if (v6)
  {
    v7 = os_log_create("com.apple.notes", "HTML");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ICNote(HTML) mutableAttributedStringFromHTMLString:readerDelegate:]((uint64_t)v6, v7);
    }
  }
  if (*(void *)(a1 + 40))
  {
    id v23 = v6;
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v23];
    id v21 = v23;

    v20 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v22 = v5;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    id v17 = objc_msgSend(v20, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    id v18 = [v8 decodeObjectOfClasses:v17 forKey:*MEMORY[0x1E4F284E8]];
    objc_opt_class();
    id v19 = ICDynamicCast();
    [v8 finishDecoding];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    id v5 = v22;
    id v6 = v21;
  }
}

- (id)attributedStringFromHTMLString:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "HTML");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICHTMLConverterClient attributedStringFromHTMLString:](v4, v5);
  }

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__31;
  v20 = __Block_byref_object_dispose__31;
  id v21 = 0;
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10.0];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__ICHTMLConverterClient_attributedStringFromHTMLString___block_invoke;
  v12[3] = &unk_1E5FDB5B0;
  id v8 = v4;
  id v13 = v8;
  uint64_t v15 = &v16;
  uint64_t v9 = v7;
  uint64_t v14 = v9;
  [(ICHTMLConverterClient *)self attributedStringFromHTMLString:v8 baseURL:0 timeoutDate:v6 completionBlock:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __56__ICHTMLConverterClient_attributedStringFromHTMLString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "HTML");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __56__ICHTMLConverterClient_attributedStringFromHTMLString___block_invoke_cold_1(a1, v3, v5);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = v3;
    id v5 = *(NSObject **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(a1 + 32) length];
      int v9 = 134217984;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1B08EB000, v5, OS_LOG_TYPE_INFO, "Could not convert HTML string (length=%ld) to attributed string", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)resumeConnectionIfNeeded
{
  id v3 = [(ICHTMLConverterClient *)self requestCountQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ICHTMLConverterClient_resumeConnectionIfNeeded__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __49__ICHTMLConverterClient_resumeConnectionIfNeeded__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    if ([v2 requestCount]) {
      goto LABEL_6;
    }
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    id v4 = ICNoteHTMLConverterBundleIdentifier();
    uint64_t v5 = [v3 initWithServiceName:v4];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;

    uint64_t v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0A65998];
    [*(id *)(*(void *)(a1 + 32) + 8) setRemoteObjectInterface:v8];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) resume];
LABEL_6:
  int v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v9 requestCount] + 1;
  return [v9 setRequestCount:v10];
}

- (void)suspendConnectionIfNeeded
{
  id v3 = [(ICHTMLConverterClient *)self requestCountQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ICHTMLConverterClient_suspendConnectionIfNeeded__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __50__ICHTMLConverterClient_suspendConnectionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) requestCount];
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRequestCount:", objc_msgSend(*(id *)(a1 + 32), "requestCount") - 1);
    uint64_t result = [*(id *)(a1 + 32) requestCount];
    if (!result)
    {
      id v3 = *(void **)(*(void *)(a1 + 32) + 8);
      return [v3 suspend];
    }
  }
  return result;
}

- (OS_dispatch_queue)requestCountQueue
{
  return self->_requestCountQueue;
}

- (void)setRequestCountQueue:(id)a3
{
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCountQueue, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

void __92__ICHTMLConverterClient_attributedStringFromHTMLString_baseURL_timeoutDate_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error reaching HTML converter service: %@", (uint8_t *)&v2, 0xCu);
}

- (void)attributedStringFromHTMLString:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 length];
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "Synchronously converting HTML to attributed string (HTML length=%ld)", (uint8_t *)&v3, 0xCu);
}

void __56__ICHTMLConverterClient_attributedStringFromHTMLString___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) length];
  int v6 = 134218240;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 length];
  _os_log_debug_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_DEBUG, "Converted HTML string (length=%ld) to attributed string (length=%ld)", (uint8_t *)&v6, 0x16u);
}

@end