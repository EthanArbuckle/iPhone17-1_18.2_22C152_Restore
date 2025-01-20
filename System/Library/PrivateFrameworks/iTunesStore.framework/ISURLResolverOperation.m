@interface ISURLResolverOperation
- (ISURLResolverOperation)initWithURL:(id)a3;
- (NSArray)resolvedAddressStrings;
- (NSArray)resolvedAddresses;
- (NSURL)URL;
- (id)url;
- (void)_resolutionCompletedWithError:(id)a3;
- (void)_runLookupForHostname:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setURL:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation ISURLResolverOperation

- (ISURLResolverOperation)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISURLResolverOperation;
  v5 = [(ISOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }
  return v5;
}

- (void)dealloc
{
  host = self->_host;
  if (host) {
    CFRelease(host);
  }
  v4.receiver = self;
  v4.super_class = (Class)ISURLResolverOperation;
  [(ISURLResolverOperation *)&v4 dealloc];
}

- (NSArray)resolvedAddresses
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  Boolean hasBeenResolved = 0;
  v2 = CFHostGetAddressing(self->_host, &hasBeenResolved);
  if (hasBeenResolved)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_super v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "copy", (void)v11);
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSArray)resolvedAddressStrings
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(ISURLResolverOperation *)self resolvedAddresses];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(id *)(*((void *)&v12 + 1) + 8 * i);
          if (getnameinfo((const sockaddr *)objc_msgSend(v9, "bytes", (void)v12), objc_msgSend(v9, "length"), v16, 0x401u, 0, 0, 2))
          {

            id v3 = 0;
            goto LABEL_12;
          }
          v10 = [NSString stringWithUTF8String:v16];
          [v3 addObject:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setUrl:(id)a3
{
  id v4 = a3;
  [(ISOperation *)self lock];
  uint64_t v5 = (NSURL *)[v4 copy];

  url = self->_url;
  self->_url = v5;

  [(ISOperation *)self unlock];
}

- (id)url
{
  [(ISOperation *)self lock];
  id v3 = (void *)[(NSURL *)self->_url copy];
  [(ISOperation *)self unlock];

  return v3;
}

- (void)run
{
  id v5 = +[ISNetworkObserver sharedInstance];
  [v5 beginUsingNetwork];
  id v3 = [(ISURLResolverOperation *)self url];
  id v4 = [v3 host];

  if (v4) {
    [(ISURLResolverOperation *)self _runLookupForHostname:v4];
  }

  [v5 endUsingNetwork];
}

- (void)_resolutionCompletedWithError:(id)a3
{
  id v4 = a3;
  [(ISOperation *)self stopRunLoop];
  id v5 = [(ISOperation *)self operationRunLoop];
  uint64_t v6 = (__CFRunLoop *)[v5 getCFRunLoop];

  CFHostSetClient(self->_host, 0, 0);
  CFHostUnscheduleFromRunLoop(self->_host, v6, (CFStringRef)*MEMORY[0x263EFFE88]);
  CFHostCancelInfoResolution(self->_host, kCFHostAddresses);
  [(ISOperation *)self setError:v4];

  [(ISOperation *)self setSuccess:v4 == 0];
}

- (void)_runLookupForHostname:(id)a3
{
  clientContext.version = 0;
  memset(&clientContext.retain, 0, 24);
  clientContext.info = self;
  error.domain = 0;
  *(void *)&error.CFStreamError error = 0;
  id v4 = CFHostCreateWithName((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)a3);
  self->_host = v4;
  if (!CFHostSetClient(v4, (CFHostClientCallBack)_HostResolutionCallback, &clientContext))
  {
    int v13 = 3;
LABEL_18:
    uint64_t v14 = ISError(v13, 0, 0);
    goto LABEL_20;
  }
  id v5 = [(ISOperation *)self operationRunLoop];
  uint64_t v6 = (__CFRunLoop *)[v5 getCFRunLoop];

  CFHostScheduleWithRunLoop(self->_host, v6, (CFStringRef)*MEMORY[0x263EFFE88]);
  if (CFHostStartInfoResolution(self->_host, kCFHostAddresses, &error))
  {
    uint64_t v7 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v7)
    {
      uint64_t v7 = [MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      v17[0] = 0;
      LODWORD(v16) = 2;
      long long v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        [(ISOperation *)self runRunLoopUntilStopped];
        if (![(ISURLResolverOperation *)self isCancelled]) {
          return;
        }
        int v13 = 16;
        goto LABEL_18;
      }
      v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v17, v16);
      free(v12);
      SSFileLog();
    }

    goto LABEL_15;
  }
  uint64_t v14 = _errorForStreamError(&error);
LABEL_20:
  long long v15 = (void *)v14;
  if (v14)
  {
    [(ISURLResolverOperation *)self _resolutionCompletedWithError:v14];
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end