@interface NSURLSessionDelegate
- (BOOL)enableExtendedValidation;
- (BOOL)ignoreInvalidCerts;
- (BOOL)revocationFailClosed;
- (NSString)leafOID;
- (NSString)validationHostname;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)setEnableExtendedValidation:(BOOL)a3;
- (void)setIgnoreInvalidCerts:(BOOL)a3;
- (void)setLeafOID:(id)a3;
- (void)setRevocationFailClosed:(BOOL)a3;
- (void)setValidationHostname:(id)a3;
@end

@implementation NSURLSessionDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v44 = [v8 sessionDescription];
    v45 = [v9 protectionSpace];
    *(_DWORD *)buf = 138412546;
    v57 = v44;
    __int16 v58 = 2048;
    uint64_t v59 = [v45 serverTrust];
    _os_log_debug_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEBUG, "Received an authentication challenge for %@, serverTrust = %p", buf, 0x16u);
  }
  v12 = [v9 protectionSpace];
  uint64_t v13 = [v12 serverTrust];

  if (!v13)
  {
    v10[2](v10, 1, 0);
    goto LABEL_41;
  }
  v14 = [v9 protectionSpace];
  v15 = (__SecTrust *)[v14 serverTrust];

  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, MEMORY[0x1E4F1D510]);
  if (Mutable)
  {
    v17 = Mutable;
    v18 = [(NSURLSessionDelegate *)self leafOID];

    if (v18)
    {
      v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v47 = [v8 sessionDescription];
        v48 = [(NSURLSessionDelegate *)self validationHostname];
        v49 = [(NSURLSessionDelegate *)self leafOID];
        *(_DWORD *)buf = 138412802;
        v57 = v47;
        __int16 v58 = 2112;
        uint64_t v59 = (uint64_t)v48;
        __int16 v60 = 2112;
        v61 = v49;
        _os_log_debug_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_DEBUG, "Creating a pinning policy with name %@, hostname %@, and leaf OID %@", buf, 0x20u);
      }
      v20 = [v8 sessionDescription];
      v21 = [(NSURLSessionDelegate *)self validationHostname];
      v22 = [(NSURLSessionDelegate *)self leafOID];
      AppleSSLPinned = (const void *)SecPolicyCreateAppleSSLPinned();

      if (!AppleSSLPinned)
      {
        v40 = nplog_obj();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v50 = [v8 sessionDescription];
          v51 = [(NSURLSessionDelegate *)self validationHostname];
          v52 = [(NSURLSessionDelegate *)self leafOID];
          *(_DWORD *)buf = 138412802;
          v57 = v50;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v51;
          __int16 v60 = 2112;
          v61 = v52;
          _os_log_error_impl(&dword_1A0FEE000, v40, OS_LOG_TYPE_ERROR, "Failed to create a pinning policy from name %@, hostname %@, and OID %@", buf, 0x20u);
        }
        goto LABEL_40;
      }
      CFArrayAppendValue(v17, AppleSSLPinned);
      CFRelease(AppleSSLPinned);
    }
    else
    {
      v25 = [(NSURLSessionDelegate *)self validationHostname];

      if (v25)
      {
        v26 = [(NSURLSessionDelegate *)self validationHostname];
        v27 = [v9 protectionSpace];
        v28 = [v27 host];
        int v29 = [v28 isEqualToString:@"gateway.icloud.com"];

        if (v29)
        {

          v26 = @"gateway.icloud.com";
        }
        v30 = nplog_obj();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v26;
          _os_log_debug_impl(&dword_1A0FEE000, v30, OS_LOG_TYPE_DEBUG, "Creating a server trust policy with hostname %@", buf, 0xCu);
        }

        SecPolicyRef SSL = SecPolicyCreateSSL(1u, v26);
        if (!SSL)
        {
          v46 = nplog_obj();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v26;
            _os_log_error_impl(&dword_1A0FEE000, v46, OS_LOG_TYPE_ERROR, "Failed to create a SSL policy from hostname %@", buf, 0xCu);
          }

          v10[2](v10, 3, 0);
          CFRelease(v17);

          goto LABEL_41;
        }
        SecPolicyRef v32 = SSL;
        CFArrayAppendValue(v17, SSL);
        CFRelease(v32);
      }
    }
    if ([(NSURLSessionDelegate *)self revocationFailClosed])
    {
      v33 = nplog_obj();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1A0FEE000, v33, OS_LOG_TYPE_DEBUG, "Creating a policy to require revocation check success", buf, 2u);
      }

      SecPolicyRef Revocation = SecPolicyCreateRevocation(0x18uLL);
      if (!Revocation)
      {
        v38 = nplog_obj();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A0FEE000, v38, OS_LOG_TYPE_ERROR, "Failed to create a revocation policy", buf, 2u);
        }
        goto LABEL_39;
      }
      SecPolicyRef v35 = Revocation;
      CFArrayAppendValue(v17, Revocation);
      CFRelease(v35);
    }
    OSStatus v36 = SecTrustSetPolicies(v15, v17);
    if (v36)
    {
      OSStatus v37 = v36;
      v38 = nplog_obj();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = [v8 sessionDescription];
        *(_DWORD *)buf = 138412546;
        v57 = v39;
        __int16 v58 = 1024;
        LODWORD(v59) = v37;
        _os_log_error_impl(&dword_1A0FEE000, v38, OS_LOG_TYPE_ERROR, "Failed to set the trust policies for %@: %d", buf, 0x12u);
      }
LABEL_39:

LABEL_40:
      v10[2](v10, 3, 0);
      CFRelease(v17);
      goto LABEL_41;
    }
    result[0] = MEMORY[0x1E4F143A8];
    result[1] = 3221225472;
    result[2] = __73__NSURLSessionDelegate_URLSession_didReceiveChallenge_completionHandler___block_invoke;
    result[3] = &unk_1E5A3BF80;
    result[4] = self;
    id v54 = v8;
    v41 = v10;
    id v55 = v41;
    OSStatus v42 = SecTrustEvaluateAsyncWithError(v15, MEMORY[0x1E4F14428], result);
    CFRelease(v17);
    if (v42)
    {
      v43 = nplog_obj();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v42;
        _os_log_error_impl(&dword_1A0FEE000, v43, OS_LOG_TYPE_ERROR, "SecTrustEvaluateAsync returned an error: %d", buf, 8u);
      }

      v41[2](v41, 1, 0);
    }
  }
  else
  {
    v24 = nplog_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v24, OS_LOG_TYPE_ERROR, "Failed to create an array to hold policies", buf, 2u);
    }

    v10[2](v10, 3, 0);
  }
LABEL_41:
}

void __73__NSURLSessionDelegate_URLSession_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1, __SecTrust *a2, int a3, NSObject *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = nplog_obj();
  id v9 = v8;
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_INFO, "SecTrustEvaluateAsyncWithError success", buf, 2u);
    }

    SecTrustResultType result = kSecTrustResultInvalid;
    if (SecTrustGetTrustResult(a2, &result) || result != kSecTrustResultUnspecified && result != kSecTrustResultProceed)
    {
      id v9 = nplog_obj();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      v10 = [*(id *)(a1 + 40) sessionDescription];
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      __int16 v23 = 1024;
      LODWORD(v24) = result;
      _os_log_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEFAULT, "%@ TLS certificate failed validation with result %d", buf, 0x12u);
      goto LABEL_7;
    }
    if (![*(id *)(a1 + 32) enableExtendedValidation])
    {
      id v9 = nplog_obj();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_14;
      }
      v11 = [*(id *)(a1 + 40) sessionDescription];
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_debug_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEBUG, "Extended validation for %@ is not enabled", buf, 0xCu);
      goto LABEL_13;
    }
    id v9 = SecTrustCopyResult(a2);
    v14 = nplog_obj();
    v10 = v14;
    if (v9)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v19 = [*(id *)(a1 + 40) sessionDescription];
        *(_DWORD *)buf = 138412546;
        v22 = v19;
        __int16 v23 = 2112;
        v24 = v9;
        _os_log_debug_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_DEBUG, "Got trust result info for %@: %@", buf, 0x16u);
      }
      v15 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F3BCA0]];

      if (v15)
      {
        CFTypeID v16 = CFGetTypeID(v15);
        if (v16 == CFBooleanGetTypeID())
        {
          if (CFBooleanGetValue((CFBooleanRef)v15)) {
            goto LABEL_14;
          }
        }
      }
      v10 = nplog_obj();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      v17 = [*(id *)(a1 + 40) sessionDescription];
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      v18 = "%@ TLS certificate failed extended validation";
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_7:

        goto LABEL_10;
      }
      v17 = [*(id *)(a1 + 40) sessionDescription];
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      v18 = "Failed to get validation results for %@ TLS certificate";
    }
    _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);

    goto LABEL_7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = a4;
    _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "SecTrustEvaluateAsyncWithError failed with %@", buf, 0xCu);
  }
LABEL_10:

  if ([*(id *)(a1 + 32) ignoreInvalidCerts])
  {
    id v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = [MEMORY[0x1E4F29098] credentialForTrust:a2];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);

      return;
    }
    v11 = [*(id *)(a1 + 40) sessionDescription];
    *(_DWORD *)buf = 138412290;
    v22 = v11;
    _os_log_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring invalid %@ TLS cert", buf, 0xCu);
LABEL_13:

    goto LABEL_14;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSString)validationHostname
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setValidationHostname:(id)a3
{
}

- (BOOL)enableExtendedValidation
{
  return self->_enableExtendedValidation;
}

- (void)setEnableExtendedValidation:(BOOL)a3
{
  self->_enableExtendedValidation = a3;
}

- (BOOL)ignoreInvalidCerts
{
  return self->_ignoreInvalidCerts;
}

- (void)setIgnoreInvalidCerts:(BOOL)a3
{
  self->_ignoreInvalidCerts = a3;
}

- (NSString)leafOID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLeafOID:(id)a3
{
}

- (BOOL)revocationFailClosed
{
  return self->_revocationFailClosed;
}

- (void)setRevocationFailClosed:(BOOL)a3
{
  self->_revocationFailClosed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafOID, 0);
  objc_storeStrong((id *)&self->_validationHostname, 0);
}

@end