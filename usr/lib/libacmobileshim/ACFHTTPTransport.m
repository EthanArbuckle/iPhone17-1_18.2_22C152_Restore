@interface ACFHTTPTransport
- (BOOL)hasFinishedServerInvocations;
- (BOOL)isCanceled;
- (NSArray)serverAttemptsDelays;
- (NSArray)serverHosts;
- (NSData)httpPOSTBody;
- (NSDictionary)httpGETParameters;
- (NSDictionary)httpHeader;
- (NSMutableArray)inProgressServerInvocations;
- (NSMutableArray)queuedServerInvocations;
- (NSString)httpMethod;
- (NSString)requestURLTemplate;
- (NSTimer)failoverTimer;
- (double)timeout;
- (id)completionBlock;
- (id)requestString:(id)a3;
- (id)retryCheckBlock;
- (id)urlWithRequest:(id)a3 address:(id)a4;
- (unint64_t)tryCounter;
- (void)addToQueuedServerInvocations:(id)a3;
- (void)cancelAllInvocations;
- (void)cancelRequest;
- (void)dealloc;
- (void)httpMethodInvocation:(id)a3 didFailWithError:(id)a4;
- (void)httpMethodInvocation:(id)a3 didFinishWithResult:(id)a4;
- (void)invocation:(id)a3 didFinishWithError:(id)a4 response:(id)a5;
- (void)performRequest;
- (void)performRequestWithCompletionBlock:(id)a3;
- (void)removeFromQueuedServerInvocations:(id)a3;
- (void)scheduleInvocation:(id)a3;
- (void)scheduleNextQueuedRequest;
- (void)scheduleTimerForNextAttempt;
- (void)setCompletionBlock:(id)a3;
- (void)setFailoverTimer:(id)a3;
- (void)setHttpGETParameters:(id)a3;
- (void)setHttpHeader:(id)a3;
- (void)setHttpMethod:(id)a3;
- (void)setHttpPOSTBody:(id)a3;
- (void)setInProgressServerInvocations:(id)a3;
- (void)setIsCanceled:(BOOL)a3;
- (void)setQueuedServerInvocations:(id)a3;
- (void)setRequestURLTemplate:(id)a3;
- (void)setRetryCheckBlock:(id)a3;
- (void)setServerAttemptsDelays:(id)a3;
- (void)setServerHosts:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTryCounter:(unint64_t)a3;
- (void)unscheduleInvocation:(id)a3;
@end

@implementation ACFHTTPTransport

- (void)dealloc
{
  [(ACFHTTPTransport *)self cancelAllInvocations];
  [(ACFHTTPTransport *)self setCompletionBlock:0];
  [(ACFHTTPTransport *)self setRetryCheckBlock:0];
  [(ACFHTTPTransport *)self setRequestURLTemplate:0];
  [(ACFHTTPTransport *)self setHttpMethod:0];
  [(ACFHTTPTransport *)self setHttpHeader:0];
  [(ACFHTTPTransport *)self setHttpGETParameters:0];
  [(ACFHTTPTransport *)self setHttpPOSTBody:0];
  [(ACFHTTPTransport *)self setServerHosts:0];
  [(ACFHTTPTransport *)self setServerAttemptsDelays:0];
  v3.receiver = self;
  v3.super_class = (Class)ACFHTTPTransport;
  [(ACFHTTPTransport *)&v3 dealloc];
}

- (NSMutableArray)queuedServerInvocations
{
  result = self->_queuedServerInvocations;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->_queuedServerInvocations) {
      self->_queuedServerInvocations = (NSMutableArray *)objc_opt_new();
    }
    objc_sync_exit(self);
    return self->_queuedServerInvocations;
  }
  return result;
}

- (void)addToQueuedServerInvocations:(id)a3
{
  objc_sync_enter(self);
  [(NSMutableArray *)[(ACFHTTPTransport *)self queuedServerInvocations] addObject:a3];

  objc_sync_exit(self);
}

- (void)removeFromQueuedServerInvocations:(id)a3
{
  objc_sync_enter(self);
  [(NSMutableArray *)[(ACFHTTPTransport *)self queuedServerInvocations] removeObject:a3];

  objc_sync_exit(self);
}

- (NSMutableArray)inProgressServerInvocations
{
  result = self->_inProgressServerInvocations;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->_inProgressServerInvocations) {
      self->_inProgressServerInvocations = (NSMutableArray *)objc_opt_new();
    }
    objc_sync_exit(self);
    return self->_inProgressServerInvocations;
  }
  return result;
}

- (void)scheduleInvocation:(id)a3
{
  objc_sync_enter(self);
  if ([(NSMutableArray *)[(ACFHTTPTransport *)self inProgressServerInvocations] containsObject:a3])
  {
    objc_sync_exit(self);
  }
  else
  {
    [(NSMutableArray *)[(ACFHTTPTransport *)self inProgressServerInvocations] addObject:a3];
    objc_sync_exit(self);
    [(ACFHTTPTransport *)self setTryCounter:[(ACFHTTPTransport *)self tryCounter] + 1];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __39__ACFHTTPTransport_scheduleInvocation___block_invoke;
    v5[3] = &unk_265043B90;
    v5[4] = a3;
    dispatch_async_on_main_thread((uint64_t)v5);
  }
}

uint64_t __39__ACFHTTPTransport_scheduleInvocation___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v2 scheduleInRunLoop:v3 forMode:*MEMORY[0x263EFF478]];
  v4 = *(void **)(a1 + 32);

  return [v4 invoke];
}

- (void)unscheduleInvocation:(id)a3
{
  objc_sync_enter(self);
  if ([(NSMutableArray *)[(ACFHTTPTransport *)self inProgressServerInvocations] containsObject:a3])
  {
    [(NSMutableArray *)[(ACFHTTPTransport *)self inProgressServerInvocations] removeObject:a3];
    objc_sync_exit(self);
    uint64_t v5 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [a3 unscheduleFromRunLoop:v5 forMode:*MEMORY[0x263EFF478]];
    [a3 setDelegate:0];
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (BOOL)hasFinishedServerInvocations
{
  return ![(NSMutableArray *)[(ACFHTTPTransport *)self inProgressServerInvocations] count]&& [(NSMutableArray *)[(ACFHTTPTransport *)self queuedServerInvocations] count] == 0;
}

- (void)invocation:(id)a3 didFinishWithError:(id)a4 response:(id)a5
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 165, 0, "Received response from url %@", [a3 url]);
  }
  [(ACFHTTPTransport *)self unscheduleInvocation:a3];
  if ([(ACFHTTPTransport *)self hasFinishedServerInvocations])
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 201, 0, "Tried all servers. Return response or error");
    }
LABEL_21:
    [(ACFHTTPTransport *)self didEnd];
    v10 = [(ACFHTTPTransport *)self completionBlock];
    if (v10[2](v10, a5, a4))
    {
      [(ACFHTTPTransport *)self setCompletionBlock:0];
    }
    else
    {
      [(ACFHTTPTransport *)self performRequest];
    }
    return;
  }
  v9 = [(ACFHTTPTransport *)self retryCheckBlock];
  if ((v9[2](v9, a5, a4) & 1) == 0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 176, 0, "Response is valid. Cancel requests to other servers");
    }
    [(ACFHTTPTransport *)self cancelAllInvocations];
    goto LABEL_21;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 181, 0, "Connection error or bad server response. Wait for response from other servers");
  }
  if ([(NSMutableArray *)[(ACFHTTPTransport *)self inProgressServerInvocations] count]|| ![(NSMutableArray *)[(ACFHTTPTransport *)self queuedServerInvocations] count])
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 195, 0, "Invocations already scheduled. Wait for response");
    }
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 189, 0, "No running invocations. Schedule the first one from invocation queue");
    }
    [(ACFHTTPTransport *)self scheduleNextQueuedRequest];
  }
}

- (void)cancelAllInvocations
{
  [(NSTimer *)[(ACFHTTPTransport *)self failoverTimer] invalidate];
  [(ACFHTTPTransport *)self setFailoverTimer:0];
  uint64_t v3 = [(NSMutableArray *)[(ACFHTTPTransport *)self inProgressServerInvocations] firstObject];
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      [v4 cancel];
      [(ACFHTTPTransport *)self unscheduleInvocation:v4];
      v4 = (void *)[(NSMutableArray *)[(ACFHTTPTransport *)self inProgressServerInvocations] firstObject];
    }
    while (v4);
  }
  [(ACFHTTPTransport *)self setInProgressServerInvocations:0];
  uint64_t v5 = [(NSMutableArray *)[(ACFHTTPTransport *)self queuedServerInvocations] firstObject];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      [(ACFHTTPTransport *)self removeFromQueuedServerInvocations:v6];
      uint64_t v6 = [(NSMutableArray *)[(ACFHTTPTransport *)self queuedServerInvocations] firstObject];
    }
    while (v6);
  }

  [(ACFHTTPTransport *)self setQueuedServerInvocations:0];
}

- (id)requestString:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = (void *)[MEMORY[0x263F089D8] string];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = -v7;
      uint64_t v15 = v7 + v6;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        if (v11 != v10) {
          [v4 appendString:@"&"];
        }
        CFStringRef v13 = objc_autorelease((id)CFURLCreateStringByAddingPercentEscapes(v9, (CFStringRef)[a3 valueForKey:v12], 0, @":/?!$&'()*+,;=#[] ",
                                     1u));
        if (!v13) {
          return 0;
        }
        [v4 appendFormat:@"%@=%@", v12, v13];
        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v7 = v15;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (id)urlWithRequest:(id)a3 address:(id)a4
{
  id v6 = -[ACFHTTPTransport requestString:](self, "requestString:");
  uint64_t v7 = [v6 length];
  id v8 = a4;
  if (v7) {
    id v8 = (id)[NSString stringWithFormat:@"%@?%@", a4, v6];
  }
  CFAllocatorRef v9 = (void *)[NSURL URLWithString:v8];
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = ACFLog == 0;
  }
  if (!v10 && (ACFLogSettingsGetLevelMask() & 8) != 0) {
    ACFLog(3, (uint64_t)"-[ACFHTTPTransport urlWithRequest:address:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 285, 0, "Failed to create url with address: %@, parameters: %@", a4, a3);
  }
  return v9;
}

- (void)performRequestWithCompletionBlock:(id)a3
{
  if ([(NSArray *)[(ACFHTTPTransport *)self serverHosts] count])
  {
    [(ACFHTTPTransport *)self setCompletionBlock:a3];
    [(ACFHTTPTransport *)self performRequest];
  }
  else if (a3)
  {
    uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation" code:65537 userInfo:0];
    id v6 = (void (*)(id, void, uint64_t))*((void *)a3 + 2);
    v6(a3, 0, v5);
  }
}

- (void)performRequest
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(ACFHTTPTransport *)self timeout];
  if (v3 >= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 60.0;
  }
  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACFHTTPTransport performRequest]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 314, 0, "method = %@", [(ACFHTTPTransport *)self httpMethod]);
    }
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0) {
        ACFLog(7, (uint64_t)"-[ACFHTTPTransport performRequest]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 315, 0, "header = %@", [(ACFHTTPTransport *)self httpHeader]);
      }
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
        ACFLog(7, (uint64_t)"-[ACFHTTPTransport performRequest]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 316, 0, "body = %@", [(ACFHTTPTransport *)self httpPOSTBody]);
      }
    }
  }
  [(ACFHTTPTransport *)self setTryCounter:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(ACFHTTPTransport *)self serverHosts];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
LABEL_15:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = [[-[ACFHTTPTransport urlWithRequest:address:](self, "urlWithRequest:address:", -[ACFHTTPTransport httpGETParameters](self, "httpGETParameters"), objc_msgSend(NSString, "stringWithFormat:", -[ACFHTTPTransport requestURLTemplate](self, "requestURLTemplate"), *(void *)(*((void *)&v15 + 1) + 8 * v10)));
      [[-[NSArray objectAtIndex:](-[ACFHTTPTransport serverAttemptsDelays](self, "serverAttemptsDelays"), "objectAtIndex:", v8 + v10) floatValue];
      float v13 = v12;
      double v4 = v4 - v12;
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
        ACFLog(7, (uint64_t)"-[ACFHTTPTransport performRequest]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 332, 0, "Timeout attempt %d after %f", v8 + v10, v4);
      }
      if (v4 <= 0.0) {
        break;
      }
      v14 = +[ACFHTTPMethodInvocation invocationWithMethod:url:timeout:delegate:invokeImmediately:](ACFHTTPMethodInvocation, "invocationWithMethod:url:timeout:delegate:invokeImmediately:", +[ACFHTTPMethod methodWithName:[(ACFHTTPTransport *)self httpMethod] headerFields:[(ACFHTTPTransport *)self httpHeader] body:[(ACFHTTPTransport *)self httpPOSTBody]], v11, self, 0, v4);
      if (v13 == 0.0) {
        [(ACFHTTPTransport *)self scheduleInvocation:v14];
      }
      else {
        [(ACFHTTPTransport *)self addToQueuedServerInvocations:v14];
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v8 += v10;
        if (v7) {
          goto LABEL_15;
        }
        break;
      }
    }
  }
  [(ACFHTTPTransport *)self scheduleTimerForNextAttempt];
  [(ACFHTTPTransport *)self didStart];
}

- (void)scheduleTimerForNextAttempt
{
  [(NSTimer *)[(ACFHTTPTransport *)self failoverTimer] invalidate];
  if (![(NSMutableArray *)[(ACFHTTPTransport *)self queuedServerInvocations] count])
  {
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  [[-[NSArray objectAtIndex:](-[ACFHTTPTransport serverAttemptsDelays](self, "serverAttemptsDelays"), "objectAtIndex:", -[ACFHTTPTransport tryCounter](self, "tryCounter")) floatValue];
  float v4 = v3;
  double v5 = v3;
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACFHTTPTransport scheduleTimerForNextAttempt]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 369, 0, "Schedule next timer to fire after %f", v5);
  }
  if (v4 > 0.0)
  {
    uint64_t v6 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_scheduleNextQueuedRequest selector:0 userInfo:0 repeats:v5];
LABEL_8:
    [(ACFHTTPTransport *)self setFailoverTimer:v6];
  }
}

- (void)scheduleNextQueuedRequest
{
  [(NSTimer *)[(ACFHTTPTransport *)self failoverTimer] invalidate];
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACFHTTPTransport scheduleNextQueuedRequest]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 388, 0, "Schedule next invocation from queue");
  }
  uint64_t v3 = [(NSMutableArray *)[(ACFHTTPTransport *)self queuedServerInvocations] firstObject];
  if (v3)
  {
    uint64_t v4 = v3;
    [(ACFHTTPTransport *)self scheduleInvocation:v3];
    [(ACFHTTPTransport *)self removeFromQueuedServerInvocations:v4];
  }

  [(ACFHTTPTransport *)self scheduleTimerForNextAttempt];
}

- (void)cancelRequest
{
  [(ACFHTTPTransport *)self setIsCanceled:1];
  [(ACFHTTPTransport *)self cancelAllInvocations];
  [(ACFHTTPTransport *)self didEnd];
  id v3 = [(ACFHTTPTransport *)self completionBlock];

  [(ACFHTTPTransport *)self setCompletionBlock:0];
}

- (void)httpMethodInvocation:(id)a3 didFinishWithResult:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACFHTTPTransport httpMethodInvocation:didFinishWithResult:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 415, 0, "method invocation did finish with result = %@", a4);
  }

  [(ACFHTTPTransport *)self invocation:a3 didFinishWithError:0 response:a4];
}

- (void)httpMethodInvocation:(id)a3 didFailWithError:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
    ACFLog(3, (uint64_t)"-[ACFHTTPTransport httpMethodInvocation:didFailWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 422, 0, "HTTP transport did fail with error = %@", a4);
  }

  [(ACFHTTPTransport *)self invocation:a3 didFinishWithError:a4 response:0];
}

- (NSString)requestURLTemplate
{
  return self->_requestURLTemplate;
}

- (void)setRequestURLTemplate:(id)a3
{
}

- (NSString)httpMethod
{
  return self->_httpMethod;
}

- (void)setHttpMethod:(id)a3
{
}

- (NSDictionary)httpHeader
{
  return self->_httpHeader;
}

- (void)setHttpHeader:(id)a3
{
}

- (NSDictionary)httpGETParameters
{
  return self->_httpGETParameters;
}

- (void)setHttpGETParameters:(id)a3
{
}

- (NSData)httpPOSTBody
{
  return self->_httpPOSTBody;
}

- (void)setHttpPOSTBody:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void)setInProgressServerInvocations:(id)a3
{
}

- (void)setQueuedServerInvocations:(id)a3
{
}

- (NSArray)serverHosts
{
  return self->_serverHosts;
}

- (void)setServerHosts:(id)a3
{
}

- (NSArray)serverAttemptsDelays
{
  return self->_serverAttemptsDelays;
}

- (void)setServerAttemptsDelays:(id)a3
{
}

- (id)retryCheckBlock
{
  return self->_retryCheckBlock;
}

- (void)setRetryCheckBlock:(id)a3
{
}

- (NSTimer)failoverTimer
{
  return self->_failoverTimer;
}

- (void)setFailoverTimer:(id)a3
{
}

- (unint64_t)tryCounter
{
  return self->_tryCounter;
}

- (void)setTryCounter:(unint64_t)a3
{
  self->_tryCounter = a3;
}

@end