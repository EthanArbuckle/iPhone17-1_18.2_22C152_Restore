@interface SDHTTPClient
+ (SDHTTPClient)sharedInstance;
+ (id)_seedingSessionConfiguration;
- (NSURL)baseURL;
- (NSURLSession)urlSession;
- (OS_os_log)log;
- (SDHTTPClient)init;
- (id)overrideServerURL;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)baseURL;
- (void)setLog:(id)a3;
@end

@implementation SDHTTPClient

+ (SDHTTPClient)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_client;
  return (SDHTTPClient *)v2;
}

uint64_t __30__SDHTTPClient_sharedInstance__block_invoke()
{
  sharedInstance_client = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (SDHTTPClient)init
{
  v10.receiver = self;
  v10.super_class = (Class)SDHTTPClient;
  v2 = [(SDHTTPClient *)&v10 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F290E0];
    v4 = [(id)objc_opt_class() _seedingSessionConfiguration];
    uint64_t v5 = [v3 sessionWithConfiguration:v4 delegate:v2 delegateQueue:0];
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v5;

    uint64_t v7 = +[SDSeedingLogging httpHandle];
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;
  }
  return v2;
}

+ (id)_seedingSessionConfiguration
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  v3 = NSString;
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v5 = [v4 processName];
  v6 = +[SDDevice deviceProductType];
  uint64_t v7 = +[SDDevice marketingProductName];
  v8 = +[SDDevice productVersion];
  v9 = +[SDDevice osBuild];
  objc_super v10 = [v3 stringWithFormat:@"%@ (Seeding) (Model %@) (%@ %@) Version/%@", v5, v6, v7, v8, v9];

  v15[0] = @"Seeding-Device-Id";
  v11 = +[SDAnalytics deviceIdentifier];
  v12 = [v11 UUIDString];
  v15[1] = @"User-Agent";
  v16[0] = v12;
  v16[1] = v10;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v2 setHTTPAdditionalHeaders:v13];

  return v2;
}

- (NSURL)baseURL
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [(SDHTTPClient *)self overrideServerURL];
  if (!v2)
  {
LABEL_8:
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://bpapi.apple.com"];
    goto LABEL_9;
  }
  v3 = +[SDSeedingLogging fwHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    v8 = v2;
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_INFO, "Attempting to use custom ServerURL: %@", (uint8_t *)&v7, 0xCu);
  }

  v4 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  if (!v4)
  {
    uint64_t v5 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(SDHTTPClient *)(uint64_t)v2 baseURL];
    }

    goto LABEL_8;
  }
LABEL_9:

  return (NSURL *)v4;
}

- (id)overrideServerURL
{
  v2 = (void *)CFPreferencesCopyValue(@"ServerURL", @"com.apple.seeding", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return v2;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, uint64_t, void))a5;
  uint64_t v9 = [(SDHTTPClient *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SDHTTPClient URLSession:didReceiveChallenge:completionHandler:](v9);
  }

  if (SDIsInternalInstall())
  {
    objc_super v10 = [(SDHTTPClient *)self overrideServerURL];

    if (v10)
    {
      v11 = [(SDHTTPClient *)self log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v33 = 0;
        v12 = "Running with custom server URL; skipping pinning check.";
        v13 = (uint8_t *)&v33;
LABEL_15:
        _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  v14 = [v7 protectionSpace];
  v15 = [v14 host];
  v16 = [(SDHTTPClient *)self baseURL];
  v17 = [v16 host];
  char v18 = [v15 isEqualToString:v17];

  if ((v18 & 1) == 0)
  {
    v11 = [(SDHTTPClient *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Connecting to other server; skipping pinning check.";
      v13 = buf;
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_17;
  }
  v19 = [v7 protectionSpace];
  v20 = [v19 authenticationMethod];
  int v21 = [v20 isEqualToString:*MEMORY[0x1E4F28988]];

  if (!v21)
  {
LABEL_17:
    v8[2](v8, 1, 0);
    goto LABEL_18;
  }
  v22 = [(SDHTTPClient *)self baseURL];
  v23 = [v22 host];

  uint64_t AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
  if (AppleSSLPinned)
  {
    v25 = (const void *)AppleSSLPinned;
    v26 = [v7 protectionSpace];
    v27 = (__SecTrust *)[v26 serverTrust];

    LODWORD(v26) = SecTrustSetPolicies(v27, v25);
    CFRelease(v25);
    if (!v26)
    {
      CFErrorRef error = 0;
      if (SecTrustEvaluateWithError(v27, &error))
      {
        v28 = [MEMORY[0x1E4F29098] credentialForTrust:v27];
        ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v28);

        goto LABEL_12;
      }
      if (error)
      {
        v29 = error;
        v30 = [(SDHTTPClient *)self log];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[SDHTTPClient URLSession:didReceiveChallenge:completionHandler:](v29, v30);
        }

        CFRelease(error);
      }
    }
  }
  v8[2](v8, 2, 0);
LABEL_12:

LABEL_18:
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

- (void)baseURL
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DD702000, a2, OS_LOG_TYPE_ERROR, "Invalid custom ServerURL: %@", (uint8_t *)&v2, 0xCu);
}

- (void)URLSession:(void *)a1 didReceiveChallenge:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1DD702000, a2, OS_LOG_TYPE_ERROR, "Certificate failure. Error: %{public}@", (uint8_t *)&v4, 0xCu);
}

- (void)URLSession:(os_log_t)log didReceiveChallenge:completionHandler:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD702000, log, OS_LOG_TYPE_DEBUG, "URL Session did receive challenge", v1, 2u);
}

@end