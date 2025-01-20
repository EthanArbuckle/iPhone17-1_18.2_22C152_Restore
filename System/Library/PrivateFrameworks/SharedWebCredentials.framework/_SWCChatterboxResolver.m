@interface _SWCChatterboxResolver
+ (BOOL)_looksLikeAppleErrorPageURLResponse:(id)a3;
+ (BOOL)_looksLikeChatterboxURLComponents:(id)a3;
+ (id)_queue;
+ (id)_resolverForTask:(id)a3;
+ (id)_session;
+ (id)new;
+ (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
+ (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
+ (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
+ (void)_invokeCompletionHandlerForTask:(id)a3 result:(id)a4 error:(id)a5;
+ (void)_setResolver:(id)a3 forTask:(id)a4;
- (NSURL)originalURL;
- (_SWCChatterboxResolver)init;
- (_SWCChatterboxResolver)initWithURL:(id)a3;
- (void)dealloc;
- (void)resolveWithCompletionHandler:(id)a3;
@end

@implementation _SWCChatterboxResolver

+ (id)new
{
}

- (_SWCChatterboxResolver)init
{
}

- (_SWCChatterboxResolver)initWithURL:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SWCChatterboxResolver;
  v6 = [(_SWCChatterboxResolver *)&v12 init];
  v7 = v6;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, v7, @"SWCChatterboxResolver.mm", 58, @"Invalid parameter not satisfying: %@", @"aURL != nil" object file lineNumber description];

    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v5 resolvingAgainstBaseURL:1];
    URLComponents = v7->_URLComponents;
    v7->_URLComponents = (NSURLComponents *)v8;
  }
LABEL_4:

  return v7;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1EB67B0B8 != -1) {
    dispatch_once(&qword_1EB67B0B8, &__block_literal_global_98);
  }
  v3 = qword_1EB67B0B0;
  if (os_log_type_enabled((os_log_t)qword_1EB67B0B0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_debug_impl(&dword_1ABCD7000, v3, OS_LOG_TYPE_DEBUG, "Deallocating %p", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)_SWCChatterboxResolver;
  [(_SWCChatterboxResolver *)&v4 dealloc];
}

- (NSURL)originalURL
{
  return [(NSURLComponents *)self->_URLComponents URL];
}

- (void)resolveWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self->_URLComponents;
  uint64_t v7 = objc_opt_class();
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SWCChatterboxResolver.mm", 82, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  if ([v7 _looksLikeChatterboxURLComponents:v6])
  {
    uint64_t v8 = [(NSURLComponents *)v6 URL];
    os_unfair_recursive_lock_lock_with_options();
    if (self->_task)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SWCChatterboxResolver.mm", 87, @"Already attempting to resolve this Chatterbox URL.", v8);
    }
    if (qword_1EB67B0B8 != -1) {
      dispatch_once(&qword_1EB67B0B8, &__block_literal_global_98);
    }
    v9 = qword_1EB67B0B0;
    if (os_log_type_enabled((os_log_t)qword_1EB67B0B0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138739971;
      v19 = v8;
      _os_log_impl(&dword_1ABCD7000, v9, OS_LOG_TYPE_INFO, "Resolving Chatterbox URL %{sensitive}@", buf, 0xCu);
    }
    v10 = [v7 _session];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v8];
    objc_super v12 = [v10 dataTaskWithRequest:v11];
    [v12 resume];
    objc_storeStrong((id *)&self->_task, v12);
    objc_storeStrong((id *)&self->_session, v10);
    v13 = (void *)[v5 copy];
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v13;

    [v7 _setResolver:self forTask:v12];
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    uint64_t v8 = [(NSURLComponents *)v6 URL];
    if (qword_1EB67B0B8 != -1) {
      dispatch_once(&qword_1EB67B0B8, &__block_literal_global_98);
    }
    v15 = qword_1EB67B0B0;
    if (os_log_type_enabled((os_log_t)qword_1EB67B0B0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138739971;
      v19 = v8;
      _os_log_impl(&dword_1ABCD7000, v15, OS_LOG_TYPE_INFO, "URL %{sensitive}@ is not from Chatterbox, returning verbatim.", buf, 0xCu);
    }
    (*((void (**)(id, void *, void))v5 + 2))(v5, v8, 0);
  }
}

+ (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v12 = [v10 statusCode];
  if (qword_1EB67B0B8 != -1) {
    dispatch_once(&qword_1EB67B0B8, &__block_literal_global_98);
  }
  v13 = (id)qword_1EB67B0B0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [v9 originalRequest];
    v15 = [v14 URL];
    *(_DWORD *)buf = 134218499;
    uint64_t v24 = v12;
    __int16 v25 = 2117;
    v26 = v15;
    __int16 v27 = 2117;
    id v28 = v10;
    _os_log_impl(&dword_1ABCD7000, v13, OS_LOG_TYPE_INFO, "Got HTTP response %li for Chatterbox URL %{sensitive}@: %{sensitive}@", buf, 0x20u);
  }
  if ((unint64_t)(v12 - 200) > 0x63)
  {
    if ((unint64_t)(v12 - 400) <= 0xC7)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      v16 = objc_msgSend(NSString, "stringWithUTF8String:", "+[_SWCChatterboxResolver URLSession:dataTask:didReceiveResponse:completionHandler:]", @"Line", @"Function", &unk_1F0345908);
      v22[1] = v16;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:2];
      v19 = (void *)[v17 initWithDomain:@"HTTP" code:v12 userInfo:v18];
      [a1 _invokeCompletionHandlerForTask:v9 result:0 error:v19];

      goto LABEL_10;
    }
LABEL_11:
    uint64_t v20 = 1;
    goto LABEL_12;
  }
  v16 = [v10 URL];
  [a1 _invokeCompletionHandlerForTask:v9 result:v16 error:0];
LABEL_10:

  uint64_t v20 = 0;
LABEL_12:
  v11[2](v11, v20);
}

+ (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v12 = a4;
  id v30 = a5;
  id v13 = a6;
  v14 = (void (**)(id, id))a7;
  if (qword_1EB67B0B8 != -1) {
    dispatch_once(&qword_1EB67B0B8, &__block_literal_global_98);
  }
  v15 = (id)qword_1EB67B0B0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(v12, "originalRequest", v29);
    id v17 = [v16 URL];
    v18 = [v13 URL];
    *(_DWORD *)buf = 138740227;
    v34 = v17;
    __int16 v35 = 2117;
    v36 = v18;
    _os_log_impl(&dword_1ABCD7000, v15, OS_LOG_TYPE_INFO, "Redirecting Chatterbox URL %{sensitive}@ => %{sensitive}@", buf, 0x16u);
  }
  if ([a1 _looksLikeAppleErrorPageURLResponse:v30])
  {
    if (qword_1EB67B0B8 != -1) {
      dispatch_once(&qword_1EB67B0B8, &__block_literal_global_98);
    }
    v19 = (id)qword_1EB67B0B0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = [v12 originalRequest];
      id v28 = [v27 URL];
      *(_DWORD *)buf = 138739971;
      v34 = v28;
      _os_log_error_impl(&dword_1ABCD7000, v19, OS_LOG_TYPE_ERROR, "Chatterbox URL %{sensitive}@: resolution failed server-side and redirected to a generic error page.", buf, 0xCu);
    }
    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    v32[0] = &unk_1F0345920;
    v31[0] = @"Line";
    v31[1] = @"Function";
    uint64_t v21 = [NSString stringWithUTF8String:"+[_SWCChatterboxResolver URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:]"];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v32[1] = v21;
    v32[2] = @"The specified Chatterbox URL redirected to an error page.";
    uint64_t v23 = *MEMORY[0x1E4F289D0];
    v31[2] = v22;
    v31[3] = v23;
    uint64_t v24 = [v13 URL];
    v32[3] = v24;
    __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
    v26 = (void *)[v20 initWithDomain:@"SWCErrorDomain" code:9 userInfo:v25];
    [a1 _invokeCompletionHandlerForTask:v12 result:0 error:v26];

    [v12 cancel];
  }
  v14[2](v14, v13);
}

+ (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (qword_1EB67B0B8 != -1) {
      dispatch_once(&qword_1EB67B0B8, &__block_literal_global_98);
    }
    v11 = (id)qword_1EB67B0B0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = [v9 originalRequest];
      id v17 = [v16 URL];
      int v18 = 138740227;
      v19 = v17;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_error_impl(&dword_1ABCD7000, v11, OS_LOG_TYPE_ERROR, "Error handling Chatterbox URL %{sensitive}@: %@", (uint8_t *)&v18, 0x16u);
    }
    id v12 = 0;
  }
  else
  {
    if (qword_1EB67B0B8 != -1) {
      dispatch_once(&qword_1EB67B0B8, &__block_literal_global_98);
    }
    id v13 = (id)qword_1EB67B0B0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = [v9 originalRequest];
      v15 = [v14 URL];
      int v18 = 138739971;
      v19 = v15;
      _os_log_impl(&dword_1ABCD7000, v13, OS_LOG_TYPE_INFO, "Finished handling Chatterbox URL %{sensitive}@", (uint8_t *)&v18, 0xCu);
    }
    v11 = [v9 currentRequest];
    id v12 = [v11 URL];
  }
  [a1 _invokeCompletionHandlerForTask:v9 result:v12 error:v10];
  if (!v10)
  {
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_URLComponents, 0);
}

+ (id)_queue
{
  if (qword_1EB67B098 != -1) {
    dispatch_once(&qword_1EB67B098, &__block_literal_global_1);
  }
  v2 = (void *)_MergedGlobals_1;
  return v2;
}

+ (id)_session
{
  os_unfair_recursive_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained(&qword_1EB67B0A0);
  if (!WeakRetained)
  {
    objc_super v4 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    id v5 = (void *)MEMORY[0x1E4F290E0];
    v6 = [a1 _queue];
    WeakRetained = [v5 sessionWithConfiguration:v4 delegate:a1 delegateQueue:v6];
  }
  os_unfair_recursive_lock_unlock();
  return WeakRetained;
}

+ (id)_resolverForTask:(id)a3
{
  id v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_super v4 = [(id)qword_1EB67B0A8 objectForKeyedSubscript:v3];
  os_unfair_recursive_lock_unlock();

  return v4;
}

+ (void)_setResolver:(id)a3 forTask:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  os_unfair_recursive_lock_lock_with_options();
  v6 = (void *)qword_1EB67B0A8;
  if (v9 && !qword_1EB67B0A8)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = (void *)qword_1EB67B0A8;
    qword_1EB67B0A8 = (uint64_t)v7;

    v6 = (void *)qword_1EB67B0A8;
  }
  [v6 setObject:v9 forKeyedSubscript:v5];
  os_unfair_recursive_lock_unlock();
}

+ (void)_invokeCompletionHandlerForTask:(id)a3 result:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v11 = [a1 _resolverForTask:v8];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = *(void **)(v11 + 16);
    *(void *)(v11 + 16) = 0;

    v14 = (void (**)(void, void, void))MEMORY[0x1AD1159D0](*(void *)(v12 + 32));
    v15 = *(void **)(v12 + 32);
    *(void *)(v12 + 32) = 0;

    id v16 = 0;
    if (!v9) {
      id v16 = *(id *)(v12 + 8);
    }
    [a1 _setResolver:0 forTask:v8];
    id v17 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = 0;
  }
  else
  {
    v14 = 0;
    id v16 = 0;
  }

  os_unfair_recursive_lock_unlock();
  if (v14)
  {
    if (qword_1EB67B0B8 != -1) {
      dispatch_once(&qword_1EB67B0B8, &__block_literal_global_98);
    }
    int v18 = (id)qword_1EB67B0B0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = (void *)MEMORY[0x1AD1159D0](v14);
      __int16 v20 = [v8 originalRequest];
      id v21 = [v20 URL];
      int v22 = 138412547;
      uint64_t v23 = v19;
      __int16 v24 = 2117;
      __int16 v25 = v21;
      _os_log_debug_impl(&dword_1ABCD7000, v18, OS_LOG_TYPE_DEBUG, "Invoking completion handler %@ for Chatterbox URL %{sensitive}@", (uint8_t *)&v22, 0x16u);
    }
    ((void (**)(void, id, id))v14)[2](v14, v9, v10);
  }
}

+ (BOOL)_looksLikeChatterboxURLComponents:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"SWCChatterboxResolver.mm", 272, @"Invalid parameter not satisfying: %@", @"urlComponents != nil" object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x1AD1157F0]();
  id v7 = [v5 scheme];
  id v8 = [v5 host];
  if (!v7) {
    goto LABEL_13;
  }
  if (![v7 caseInsensitiveCompare:@"http"])
  {
    if (v8) {
      goto LABEL_9;
    }
LABEL_13:
    BOOL v9 = 0;
    goto LABEL_14;
  }
  BOOL v9 = 0;
  if ([v7 caseInsensitiveCompare:@"https"] || !v8) {
    goto LABEL_14;
  }
LABEL_9:
  if (![v8 caseInsensitiveCompare:@"c.apple.com"])
  {
    BOOL v9 = 1;
    goto LABEL_14;
  }
  if (!qword_1EB67B210) {
    goto LABEL_13;
  }
  id v10 = +[_SWCPrefs sharedPrefs];
  if ([v10 isAppleInternal]) {
    BOOL v9 = [v8 caseInsensitiveCompare:qword_1EB67B210] == 0;
  }
  else {
    BOOL v9 = 0;
  }

LABEL_14:

  return v9;
}

+ (BOOL)_looksLikeAppleErrorPageURLResponse:(id)a3
{
  id v3 = [a3 valueForHTTPHeaderField:@"Location"];
  if (v3)
  {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v3];
    id v5 = [v4 host];
    v6 = v5;
    if (v5 && ![v5 caseInsensitiveCompare:@"www.apple.com"])
    {
      id v8 = [v4 path];
      if ([v8 isEqual:@"/error"]) {
        char v7 = 1;
      }
      else {
        char v7 = [v8 hasSuffix:@"/error.html"];
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

@end