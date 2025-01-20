@interface MANetworkServiceClientVersion
- (BOOL)allowInvalidCert;
- (NSError)lastNetworkError;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)setAllowInvalidCert:(BOOL)a3;
- (void)setLastNetworkError:(id)a3;
@end

@implementation MANetworkServiceClientVersion

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, uint64_t, void))a5;
  if ((uint64_t)[v7 previousFailureCount] < 1)
  {
    id v11 = [v7 protectionSpace];
    id v12 = [v11 authenticationMethod];
    unsigned __int8 v13 = [v12 isEqualToString:NSURLAuthenticationMethodServerTrust];

    if ((v13 & 1) == 0)
    {
      v8[2](v8, 1, 0);
      goto LABEL_5;
    }
    SecTrustResultType result = kSecTrustResultInvalid;
    id v14 = [v7 protectionSpace];
    SecTrustEvaluate((SecTrustRef)[v14 serverTrust], &result);

    if ([(MANetworkServiceClientVersion *)self allowInvalidCert]
      || (uint64_t v15 = result, result == kSecTrustResultProceed)
      || result == kSecTrustResultUnspecified)
    {
      id v16 = [v7 protectionSpace];
      v17 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v16 serverTrust]);

      ((void (**)(id, uint64_t, NSURLCredential *))v8)[2](v8, 0, v17);
      v10 = v17;
      goto LABEL_4;
    }
    id v18 = [v7 protectionSpace];
    [v18 serverTrust];
    v19 = (void *)SecTrustCopyFailureDescription();
    v9 = createMobileActivationError((uint64_t)"-[MANetworkServiceClientVersion URLSession:didReceiveChallenge:completionHandler:]", 131, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Failed to evaluate trust: %d (%@)", v15, v19);
  }
  else
  {
    v9 = createMobileActivationError((uint64_t)"-[MANetworkServiceClientVersion URLSession:didReceiveChallenge:completionHandler:]", 60, @"com.apple.MobileActivation.ErrorDomain", -1, 0, @"Previous challenge failures.");
  }
  [(MANetworkServiceClientVersion *)self setLastNetworkError:v9];
  v8[2](v8, 2, 0);
  v10 = v9;
LABEL_4:

LABEL_5:
}

- (BOOL)allowInvalidCert
{
  return self->_allowInvalidCert;
}

- (void)setAllowInvalidCert:(BOOL)a3
{
  self->_allowInvalidCert = a3;
}

- (NSError)lastNetworkError
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastNetworkError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end