@interface ACFHTTPMethodInvocation
+ (id)invocation;
+ (id)invocationWithMethod:(id)a3 url:(id)a4 timeout:(double)a5 delegate:(id)a6 invokeImmediately:(BOOL)a7;
+ (id)invokeHTTPMethodSynchronously:(id)a3 withURL:(id)a4 timeout:(double)a5 result:(id *)a6;
- (ACFHTTPMethod)method;
- (ACFHTTPMethodInvocation)init;
- (ACFHTTPMethodInvocation)initWithMethod:(id)a3 url:(id)a4 timeout:(double)a5 delegate:(id)a6 invokeImmediately:(BOOL)a7;
- (ACFHTTPMethodInvocationDelegate)delegate;
- (ACFHTTPMethodInvocationInternal)internal;
- (BOOL)isWaitingForResponse;
- (NSURL)url;
- (double)timeout;
- (id)connection:(id)a3 willCacheResponse:(id)a4;
- (void)cancel;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)invoke;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIsWaitingForResponse:(BOOL)a3;
- (void)unscheduleFromRunLoop:(id)a3 forMode:(id)a4;
@end

@implementation ACFHTTPMethodInvocation

+ (id)invocation
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)invocationWithMethod:(id)a3 url:(id)a4 timeout:(double)a5 delegate:(id)a6 invokeImmediately:(BOOL)a7
{
  v7 = (void *)[objc_alloc((Class)a1) initWithMethod:a3 url:a4 timeout:a6 delegate:a7 invokeImmediately:a5];

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ACFHTTPMethodInvocation;
  [(ACFHTTPMethodInvocation *)&v3 dealloc];
}

- (ACFHTTPMethodInvocation)init
{
  v4.receiver = self;
  v4.super_class = (Class)ACFHTTPMethodInvocation;
  id v2 = [(ACFHTTPMethodInvocation *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(ACFHTTPMethodInvocationInternal);
  }
  return v2;
}

- (ACFHTTPMethodInvocation)initWithMethod:(id)a3 url:(id)a4 timeout:(double)a5 delegate:(id)a6 invokeImmediately:(BOOL)a7
{
  BOOL v7 = a7;
  v15.receiver = self;
  v15.super_class = (Class)ACFHTTPMethodInvocation;
  v12 = [(ACFHTTPMethodInvocation *)&v15 init];
  if (v12)
  {
    v12->_method = (ACFHTTPMethod *)a3;
    v12->_url = (NSURL *)a4;
    v12->_timeout = a5;
    v12->_delegate = a6;
    v12->_internal = objc_alloc_init(ACFHTTPMethodInvocationInternal);
    if (v7)
    {
      uint64_t v13 = [MEMORY[0x263EFF9F0] currentRunLoop];
      [(ACFHTTPMethodInvocation *)v12 scheduleInRunLoop:v13 forMode:*MEMORY[0x263EFF478]];
      [(ACFHTTPMethodInvocation *)v12 invoke];
    }
  }
  return v12;
}

- (void)invoke
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)[(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] invocationGuard] lock];
  if (![(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] connection])
  {
    id v3 = objc_alloc(MEMORY[0x263F089E0]);
    objc_super v4 = [(ACFHTTPMethodInvocation *)self url];
    [(ACFHTTPMethodInvocation *)self timeout];
    id v5 = (id)[v3 initWithURL:v4 cachePolicy:1];
    [v5 setHTTPMethod:-[ACFHTTPMethod name](-[ACFHTTPMethodInvocation method](self, "method"), "name")];
    [v5 setAllHTTPHeaderFields:[[-[ACFHTTPMethod headerFields](-[ACFHTTPMethodInvocation method](self, "method")) allValues] componentsJoinedByString:@"\n"]];
    [v5 setHTTPBody:-[ACFHTTPMethod body](-[ACFHTTPMethodInvocation method](self, "method"), "body")];
    id v6 = (id)[objc_alloc(MEMORY[0x263F08BA8]) initWithRequest:v5 delegate:self startImmediately:0];
    if (v6)
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
        ACFLog(6, (uint64_t)"-[ACFHTTPMethodInvocation invoke]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 157, 0, "Begins to load the data for the URL request %@", v5);
      }
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      BOOL v7 = [(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] runLoops];
      uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            uint64_t v12 = [(NSMutableDictionary *)[(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] runLoops] objectForKey:v11];
            if (v12) {
              [v6 scheduleInRunLoop:v12 forMode:v11];
            }
          }
          uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }
      [(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] setConnection:v6];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation", 65540, [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Failed to create NSURLConnection instance with request %@", v5] forKey:@"NSDebugDescription" code userInfo];
      if (v13) {
        goto LABEL_20;
      }
    }
  }
  [(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] setIsFinished:0];
  [(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] setReceivedDataAccumulator:0];
  [(ACFHTTPMethodInvocation *)self setIsWaitingForResponse:1];
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACFHTTPMethodInvocation invoke]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 177, 0, "Method invocation is waiting for respone");
  }
  [(NSURLConnection *)[(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] connection] start];
  uint64_t v13 = 0;
LABEL_20:
  [(NSRecursiveLock *)[(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] invocationGuard] unlock];
  if (v13) {
    [(ACFHTTPMethodInvocation *)self connection:0 didFailWithError:v13];
  }
}

- (void)cancel
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACFHTTPMethodInvocation cancel]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 196, 0, "Method invoсation canceled. It is not waiting for response now");
  }
  [(ACFHTTPMethodInvocation *)self setIsWaitingForResponse:0];
  [(NSRecursiveLock *)[(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] invocationGuard] lock];
  [(NSURLConnection *)[(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] connection] cancel];
  [(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] setReceivedDataAccumulator:0];
  [(NSRecursiveLock *)[(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] invocationGuard] unlock];
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
}

- (void)unscheduleFromRunLoop:(id)a3 forMode:(id)a4
{
}

- (ACFHTTPMethod)method
{
  return (ACFHTTPMethod *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)isWaitingForResponse
{
  return self->_isWaitingForResponse;
}

- (void)setIsWaitingForResponse:(BOOL)a3
{
  self->_isWaitingForResponse = a3;
}

- (ACFHTTPMethodInvocationDelegate)delegate
{
  return (ACFHTTPMethodInvocationDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (ACFHTTPMethodInvocationInternal)internal
{
  return (ACFHTTPMethodInvocationInternal *)objc_getProperty(self, a2, 40, 1);
}

+ (id)invokeHTTPMethodSynchronously:(id)a3 withURL:(id)a4 timeout:(double)a5 result:(id *)a6
{
  v21 = objc_opt_new();
  CFStringRef v11 = (const __CFString *)[NSString stringWithFormat:@"com.apple.ist.ds.appleconnect.HTTPMethodSynchronousInvocationRunLoopMode.%p", pthread_self()];
  uint64_t v12 = objc_alloc_init(ACFHTTPMethodSynchronousInvocationHelper);
  uint64_t v13 = (void *)[objc_alloc((Class)a1) initWithMethod:a3 url:a4 timeout:v12 delegate:0 invokeImmediately:a5];
  if (!v13)
  {
    uint64_t v19 = (NSError *)(id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation", 65540, [NSString stringWithFormat:@"Failed to create ACFHTTPMethodInvocation instance." code userInfo];
    uint64_t v13 = 0;
    goto LABEL_22;
  }
  [v13 scheduleInRunLoop:[MEMORY[0x263EFF9F0] currentRunLoop] forMode:v11];
  [v13 invoke];
  long long v14 = (void *)[MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a5 + 3.0];
  while ((objc_msgSend((id)objc_msgSend(v13, "internal"), "isFinished") & 1) == 0)
  {
    long long v15 = objc_opt_new();
    [v14 timeIntervalSinceNow];
    CFRunLoopRunResult v17 = CFRunLoopRunInMode(v11, v16, 1u);
    switch(v17)
    {
      case kCFRunLoopRunFinished:
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
          ACFLog(7, (uint64_t)"+[ACFHTTPMethodInvocation(ACFHTTPMethodSynchronousInvocation) invokeHTTPMethodSynchronously:withURL:timeout:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 284, 0, "The running run loop was finished (the running run loop mode has no sources or timers to process).");
        }
        break;
      case kCFRunLoopRunStopped:
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
          ACFLog(7, (uint64_t)"+[ACFHTTPMethodInvocation(ACFHTTPMethodSynchronousInvocation) invokeHTTPMethodSynchronously:withURL:timeout:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 288, 0, "The running run loop was finished (CFRunLoopStop was called on the run loop).");
        }
        break;
      case kCFRunLoopRunTimedOut:
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
          ACFLog(7, (uint64_t)"+[ACFHTTPMethodInvocation(ACFHTTPMethodSynchronousInvocation) invokeHTTPMethodSynchronously:withURL:timeout:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 292, 0, "The running run loop was finished (the specified time interval for running the run loop has passed).");
        }
        break;
      default:
        char v18 = 0;
        goto LABEL_18;
    }
    char v18 = 1;
LABEL_18:
    [v15 drain];
    if (v18) {
      break;
    }
  }
  [v13 unscheduleFromRunLoop:[MEMORY[0x263EFF9F0] currentRunLoop] forMode:v11];
  uint64_t v19 = [(ACFHTTPMethodSynchronousInvocationHelper *)v12 error];
  if (a6) {
    *a6 = [(ACFHTTPMethodSynchronousInvocationHelper *)v12 result];
  }
LABEL_22:
  [v13 setDelegate:0];

  [v21 drain];
  if (a6) {
    *a6 = *a6;
  }

  return v19;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connection:didReceiveResponse:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 346, 0, "Connection did receive response: %@", a4);
  }
  [(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] setReceivedDataAccumulator:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [a4 statusCode];
    if (v7 != 200)
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = NSDictionary;
      uint64_t v10 = [MEMORY[0x263F088A0] localizedStringForStatusCode:v7];
      uint64_t v11 = [v8 errorWithDomain:@"com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation" code:65540 userInfo:[v9 dictionaryWithObject:v10 forKey:@"com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation"]];
      [(ACFHTTPMethodInvocation *)self connection:a3 didFailWithError:v11];
    }
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connection:didReceiveData:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 368, 0, "Connection did receive data.");
  }
  if ([(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] receivedDataAccumulator])
  {
    id v6 = [(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] receivedDataAccumulator];
    [(NSMutableData *)v6 appendData:a4];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFF990] dataWithData:a4];
    uint64_t v8 = [(ACFHTTPMethodInvocation *)self internal];
    [(ACFHTTPMethodInvocationInternal *)v8 setReceivedDataAccumulator:v7];
  }
}

- (void)connectionDidFinishLoading:(id)a3
{
  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connectionDidFinishLoading:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 381, 0, "Connection did finish loading.");
    }
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connectionDidFinishLoading:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 382, 0, "Connection did finish loading. Method invoсation is not waiting for response now");
    }
  }
  [(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] setIsFinished:1];
  [(ACFHTTPMethodInvocation *)self setIsWaitingForResponse:0];
  objc_super v4 = [(ACFHTTPMethodInvocation *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(ACFHTTPMethodInvocationDelegate *)v4 httpMethodInvocation:self didFinishWithResult:[(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] receivedDataAccumulator]];
  }
  id v5 = [(ACFHTTPMethodInvocation *)self internal];

  [(ACFHTTPMethodInvocationInternal *)v5 setReceivedDataAccumulator:0];
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connection:didFailWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 396, 0, "Connection did fail. Method invoсation is not waiting for response now");
  }
  [(ACFHTTPMethodInvocationInternal *)[(ACFHTTPMethodInvocation *)self internal] setIsFinished:1];
  [(ACFHTTPMethodInvocation *)self setIsWaitingForResponse:0];
  id v6 = (void *)[a4 domain];
  if ([v6 isEqualToString:*MEMORY[0x263F08438]] && objc_msgSend(a4, "code") == 22) {
    a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation" code:65539 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:a4, *MEMORY[0x263F08608], 0]];
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
    ACFLog(3, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connection:didFailWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 403, 0, "Connection did fail with error: %@", a4);
  }
  uint64_t v7 = [(ACFHTTPMethodInvocation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = self;
    [(ACFHTTPMethodInvocationDelegate *)v7 httpMethodInvocation:v8 didFailWithError:a4];
  }
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  return 0;
}

@end