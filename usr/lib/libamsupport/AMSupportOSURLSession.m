@interface AMSupportOSURLSession
- (AMSupportOSURLSession)initWithOptions:(id)a3;
- (BOOL)sslEvalFailed;
- (NSDictionary)options;
- (NSURLSession)session;
- (OS_dispatch_queue)queue;
- (double)timeout;
- (float)priority;
- (id)_defaultSessionConfigurationWithIdentifier:(id)a3;
- (id)_newSession;
- (id)_urlRequestForHTTPMessage:(__CFHTTPMessage *)a3;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)invalidateAndCancel;
- (void)sendRequest:(__CFHTTPMessage *)a3 completion:(id)a4;
- (void)setOptions:(id)a3;
- (void)setPriority:(float)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation AMSupportOSURLSession

- (id)_defaultSessionConfigurationWithIdentifier:(id)a3
{
  v4 = [MEMORY[0x263EFC648] ephemeralSessionConfiguration:a3];
  id v5 = [(NSDictionary *)self->_options objectForKey:@"SocksProxySettings"];
  if (v5)
  {
    v6 = v5;
    id v7 = v5;
LABEL_3:
    [v4 setConnectionProxyDictionary:v6];

    goto LABEL_4;
  }
  if (objc_msgSend(-[NSDictionary objectForKey:](self->_options, "objectForKey:", @"UsePurpleReverseProxy"), "BOOLValue"))
  {
    v6 = (void *)AMSupportHttpCopyProxySettings(0, 0);
    if (v6) {
      goto LABEL_3;
    }
  }
LABEL_4:
  [v4 setTimeoutIntervalForRequest:self->_timeout];
  [v4 setAllowsCellularAccess:1];
  [v4 set_shouldSkipPreferredClientCertificateLookup:1];
  return v4;
}

- (id)_newSession
{
  v2 = [-[AMSupportOSURLSession _defaultSessionConfigurationWithIdentifier:](self, "_defaultSessionConfigurationWithIdentifier:", @"com.apple.libamsupport.http-traffic") sessionWithConfiguration:self delegate:self delegateQueue:0];

  return v2;
}

- (AMSupportOSURLSession)initWithOptions:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)AMSupportOSURLSession;
  v4 = [(AMSupportOSURLSession *)&v10 init];
  if (v4)
  {
    id v5 = (void *)[a3 objectForKey:@"Timeout"];
    if (v5) {
      [v5 doubleValue];
    }
    else {
      uint64_t v6 = 0x4072C00000000000;
    }
    *(void *)&v4->_timeout = v6;
    id v7 = (void *)[a3 objectForKey:@"Priority"];
    if (v7) {
      [v7 floatValue];
    }
    else {
      float v8 = 0.5;
    }
    v4->_priority = v8;
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.libamsupport.http-session", 0);
    v4->_options = (NSDictionary *)a3;
    v4->_session = (NSURLSession *)[(AMSupportOSURLSession *)v4 _newSession];
    v4->_sslEvalFailed = 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)AMSupportOSURLSession;
  [(AMSupportOSURLSession *)&v4 dealloc];
}

- (void)invalidateAndCancel
{
}

- (id)_urlRequestForHTTPMessage:(__CFHTTPMessage *)a3
{
  if (!a3) {
    return 0;
  }
  CFURLRef v5 = CFHTTPMessageCopyRequestURL(a3);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (void *)[MEMORY[0x263EFC5E8] requestWithURL:v5 cachePolicy:1 timeoutInterval:self->_timeout];
  if (!v6) {
    return v6;
  }
  CFStringRef v7 = (id)CFHTTPMessageCopyRequestMethod(a3);
  if (!v7) {
    return 0;
  }
  [v6 setHTTPMethod:v7];
  CFDictionaryRef v8 = CFHTTPMessageCopyAllHeaderFields(a3);
  if (v8) {
    [v6 setAllHTTPHeaderFields:v8];
  }
  CFDataRef v9 = CFHTTPMessageCopyBody(a3);
  if (v9) {
    [v6 setHTTPBody:v9];
  }
  return v6;
}

- (void)sendRequest:(__CFHTTPMessage *)a3 completion:(id)a4
{
  v5[7] = *MEMORY[0x263EF8340];
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__AMSupportOSURLSession_sendRequest_completion___block_invoke;
  v5[3] = &unk_264241F90;
  v5[5] = a4;
  v5[6] = a3;
  v5[4] = self;
  dispatch_sync(queue, v5);
}

void __48__AMSupportOSURLSession_sendRequest_completion___block_invoke(uint64_t a1)
{
  block[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _urlRequestForHTTPMessage:*(void *)(a1 + 48)];
  if (v2)
  {
    CFDictionaryRef v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) dataTaskWithRequest:v2 completionHandler:*(void *)(a1 + 40)];
    LODWORD(v9) = *(_DWORD *)(*(void *)(a1 + 32) + 24);
    [v8 setPriority:v9];
    [v8 resume];
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLSession sendRequest:completion:]_block_invoke", (uint64_t)"Could not construct NSURLRequest from message %@", v3, v4, v5, v6, v7, *(void *)(a1 + 48));
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__AMSupportOSURLSession_sendRequest_completion___block_invoke_2;
    block[3] = &unk_264241F68;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(global_queue, block);
  }
}

uint64_t __48__AMSupportOSURLSession_sendRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x263F087E8] errorWithDomain:@"AMSupportError" code:3 userInfo:0];
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v1 + 16);

  return v3(v1, 0, 0, v2);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  if (a4) {
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLSession URLSession:didBecomeInvalidWithError:]", (uint64_t)"Session %@ became invalid: %@", (uint64_t)a4, v4, v5, v6, v7, (char)a3);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  CFDictionaryRef v8 = [objc_msgSend(a4, "protectionSpace", a3) authenticationMethod];
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"Authentication challenge received.  Method: %@", v9, v10, v11, v12, v13, (char)v8);
  if ([a4 previousFailureCount] < 1)
  {
    if ([v8 isEqual:*MEMORY[0x263EFC568]]
      && [(NSDictionary *)self->_options objectForKey:@"ClientIdentity"])
    {
      AMSupportLogInternal(6, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"Received client certificate challenge. Client SSL authentication failed.", v23, v24, v25, v26, v27, v70);
    }
    else
    {
      if (([v8 isEqual:*MEMORY[0x263EFC5A0]] & 1) == 0)
      {
        v19 = (void (*)(id, uint64_t, uint64_t))*((void *)a5 + 2);
        id v20 = a5;
        uint64_t v21 = 1;
        goto LABEL_3;
      }
      id v28 = [(NSDictionary *)self->_options objectForKey:@"DisableSSLValidation"];
      if (objc_msgSend(v28, "isEqual:", objc_msgSend(NSNumber, "numberWithBool:", 1)))
      {
        AMSupportLogInternal(6, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"SSL validation disabled.  Attempting to continue without authentication.", v29, v30, v31, v32, v33, v70);
        uint64_t v34 = [MEMORY[0x263EFC610] credentialForTrust:[objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")];
        v19 = (void (*)(id, uint64_t, uint64_t))*((void *)a5 + 2);
        uint64_t v22 = v34;
        id v20 = a5;
        uint64_t v21 = 0;
        goto LABEL_4;
      }
      [(NSDictionary *)self->_options objectForKey:@"TrustedServerCAs"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [(NSDictionary *)self->_options objectForKey:@"TrustedServerCAs"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v37 = [MEMORY[0x263EFC610] credentialForTrust:[objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")]];
          v19 = (void (*)(id, uint64_t, uint64_t))*((void *)a5 + 2);
          uint64_t v22 = v37;
          id v20 = a5;
          uint64_t v21 = 1;
          goto LABEL_4;
        }
      }
      [(NSDictionary *)self->_options objectForKey:@"TrustedServerCAs"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v36 = [(NSDictionary *)self->_options objectForKey:@"TrustedServerCAs"];
      v72 = self;
      id v73 = a5;
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v36 = [(id)[MEMORY[0x263EFF8C0] arrayWithObject:][-[NSDictionary objectForKey:](self->_options, "objectForKey:", @"TrustedServerCAs")];
        }
        else {
          id v36 = 0;
        }
      }
      v38 = [MEMORY[0x263EFF980] arrayWithCapacity:[v36 count]];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      uint64_t v39 = [v36 countByEnumeratingWithState:&v76 objects:v75 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v77;
        CFAllocatorRef v42 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v77 != v41) {
              objc_enumerationMutation(v36);
            }
            CFDataRef v44 = *(const __CFData **)(*((void *)&v76 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              SecCertificateRef v45 = SecCertificateCreateWithData(v42, v44);
              if (v45)
              {
                SecCertificateRef v51 = v45;
                [v38 addObject:v45];
                CFRelease(v51);
              }
              else
              {
                AMSupportLogInternal(4, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"trusted certificate could not be loaded %@", v46, v47, v48, v49, v50, (char)v44);
              }
            }
          }
          uint64_t v40 = [v36 countByEnumeratingWithState:&v76 objects:v75 count:16];
        }
        while (v40);
      }
      v52 = (__SecTrust *)[a4 protectionSpace].serverTrust;
      int v74 = 0;
      AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"Attempting trust evaluate", v53, v54, v55, v56, v57, v70);
      int v63 = AMSupportX509ChainEvaluateTrust(v52, (CFArrayRef)v38, &v74, v58, v59, v60, v61, v62);
      if (v63)
      {
        AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"trust evaluation failed (OSStatus=%d)", v64, v65, v66, v67, v68, v63);
        v69 = v72;
        a5 = v73;
      }
      else
      {
        v69 = v72;
        a5 = v73;
        if (v74 == 4 || v74 == 1)
        {
          AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"Trust evaluation succeeded, proceeding..", v64, v65, v66, v67, v68, v71);
          (*((void (**)(id, void, uint64_t))v73 + 2))(v73, 0, [MEMORY[0x263EFC610] credentialForTrust:v52]);
          return;
        }
        AMSupportLogInternal(4, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"trust evaluation did not result in okay to proceed (result=%d)", v64, v65, v66, v67, v68, v74);
      }
      v69->_sslEvalFailed = 1;
    }
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 2, 0);
    return;
  }
  AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]", (uint64_t)"Multiple challenge failures. Request failed.", v14, v15, v16, v17, v18, v70);
  v19 = (void (*)(id, uint64_t, uint64_t))*((void *)a5 + 2);
  id v20 = a5;
  uint64_t v21 = 2;
LABEL_3:
  uint64_t v22 = 0;
LABEL_4:

  v19(v20, v21, v22);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
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

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)sslEvalFailed
{
  return self->_sslEvalFailed;
}

@end