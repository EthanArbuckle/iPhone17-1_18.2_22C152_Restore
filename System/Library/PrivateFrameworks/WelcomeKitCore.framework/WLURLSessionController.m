@interface WLURLSessionController
- (BOOL)isValid;
- (NSURLSession)urlSession;
- (WLURLSessionController)initWithAuthentication:(id)a3;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)invalidate;
@end

@implementation WLURLSessionController

- (WLURLSessionController)initWithAuthentication:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WLURLSessionController;
  v6 = [(WLURLSessionController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_auth, a3);
    v8 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v8 setTLSMinimumSupportedProtocolVersion:771];
    [v8 setTLSMaximumSupportedProtocolVersion:772];
    [v8 setHTTPMaximumConnectionsPerHost:1];
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    delegateOperationQueue = v7->_delegateOperationQueue;
    v7->_delegateOperationQueue = v9;

    uint64_t v11 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v8 delegate:v7 delegateQueue:v7->_delegateOperationQueue];
    urlSession = v7->_urlSession;
    v7->_urlSession = (NSURLSession *)v11;

    _WLLog();
  }

  return v7;
}

- (void)dealloc
{
  _WLLog();
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  urlSession = self->_urlSession;
  self->_urlSession = 0;

  v5.receiver = self;
  v5.super_class = (Class)WLURLSessionController;
  [(WLURLSessionController *)&v5 dealloc];
}

- (void)invalidate
{
  urlSession = self->_urlSession;
  _WLLog();
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  v3 = self->_urlSession;
  self->_urlSession = 0;
}

- (BOOL)isValid
{
  return self->_urlSession != 0;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  v35[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = [v9 protectionSpace];
  v34 = [v11 authenticationMethod];
  _WLLog();

  if (objc_msgSend(v9, "previousFailureCount", self, v8, v9, v34))
  {
    v33 = [v9 failureResponse];
    _WLLog();

LABEL_3:
    v10[2](v10, 1, 0);
    goto LABEL_14;
  }
  v12 = [v9 protectionSpace];
  v13 = [v12 authenticationMethod];
  int v14 = [v13 isEqualToString:*MEMORY[0x263F08528]];

  if (v14)
  {
    v15 = +[WLCredentialStore sharedInstance];
    v16 = [v15 credentialsForAuthentication:self->_auth];

    [v16 localCertificate];
    [v16 privateKey];
    uint64_t v17 = SecIdentityCreate();
    v18 = (void *)MEMORY[0x263F08BB8];
    v35[0] = [v16 localCertificate];
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
    v20 = [v18 credentialWithIdentity:v17 certificates:v19 persistence:2];

    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v20);
    goto LABEL_14;
  }
  v21 = [v9 protectionSpace];
  v22 = [v21 authenticationMethod];
  int v23 = [v22 isEqualToString:*MEMORY[0x263F08560]];

  if (!v23) {
    goto LABEL_3;
  }
  v24 = +[WLCredentialStore sharedInstance];
  v25 = [v24 credentialsForAuthentication:self->_auth];

  [v25 remoteCertificate];
  v26 = SecCertificateCopySHA256Digest();
  v27 = [v9 protectionSpace];
  CFArrayRef v28 = SecTrustCopyCertificateChain((SecTrustRef)[v27 serverTrust]);

  if (CFArrayGetCount(v28))
  {
    CFArrayGetValueAtIndex(v28, 0);
    v29 = SecCertificateCopySHA256Digest();
    if ([v26 isEqualToData:v29])
    {
      v30 = (void *)MEMORY[0x263F08BB8];
      v31 = [v9 protectionSpace];
      v32 = objc_msgSend(v30, "credentialForTrust:", objc_msgSend(v31, "serverTrust"));
      ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v32);
    }
    else
    {
      _WLLog();
      v10[2](v10, 3, 0);
    }
  }
  else
  {
    _WLLog();
    v10[2](v10, 3, 0);
  }

LABEL_14:
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_delegateOperationQueue, 0);
  objc_storeStrong((id *)&self->_auth, 0);
}

@end