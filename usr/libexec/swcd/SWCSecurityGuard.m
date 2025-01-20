@interface SWCSecurityGuard
+ (SWCSecurityGuard)new;
+ (SWCSecurityGuard)sharedSecurityGuard;
- (BOOL)_isSystemTrusted:(__SecTrust *)a3;
- (BOOL)_verifyExtendedValidationOfTrust:(__SecTrust *)a3 error:(id *)a4;
- (BOOL)verifyTrust:(__SecTrust *)a3 allowInstalledRootCertificates:(BOOL)a4 error:(id *)a5;
- (BOOL)verifyTrust:(__SecTrust *)a3 error:(id *)a4;
- (SWCSecurityGuard)init;
- (id)JSONObjectWithSignedJSONData:(id)a3 error:(id *)a4;
- (id)_errorForUntrustedRootCertificateOfTrust:(__SecTrust *)a3;
- (id)_init;
- (optional<SecTrustResultType>)_evaluateTrust:(__SecTrust *)a3 allowingKeychains:(BOOL)a4 error:(id *)a5;
- (optional<SecTrustResultType>)_evaluateTrust:(__SecTrust *)a3 error:(id *)a4;
@end

@implementation SWCSecurityGuard

+ (SWCSecurityGuard)sharedSecurityGuard
{
  if (qword_10003B2A0 != -1) {
    dispatch_once(&qword_10003B2A0, &stru_1000351E0);
  }
  v2 = (void *)qword_10003B298;

  return (SWCSecurityGuard *)v2;
}

+ (SWCSecurityGuard)new
{
}

- (SWCSecurityGuard)init
{
}

- (id)JSONObjectWithSignedJSONData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v23 = 0;
  uint64_t v7 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v23];
  id v8 = v23;
  if (v7)
  {
    v9 = (void *)v7;
  }
  else
  {
    id v22 = 0;
    int v10 = SecCMSVerifyCopyDataAndAttributes();
    int v11 = v10;
    if (v10 == -26275)
    {
      v9 = 0;
    }
    else
    {
      if (v10)
      {
        id v19 = objc_alloc((Class)NSError);
        v27[0] = &off_100036B28;
        v26[0] = @"Line";
        v26[1] = @"Function";
        uint64_t v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard JSONObjectWithSignedJSONData:error:]");
        v27[1] = v20;
        v27[2] = @"Failed to extract JSON object when assuming signed";
        v26[2] = NSDebugDescriptionErrorKey;
        v26[3] = NSUnderlyingErrorKey;
        id v13 = objc_alloc((Class)NSError);
        v24[1] = @"Function";
        v25[0] = &off_100036B28;
        v24[0] = @"Line";
        v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard JSONObjectWithSignedJSONData:error:]");
        v25[1] = v14;
        v15 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
        id v16 = [v13 initWithDomain:NSOSStatusErrorDomain code:v11 userInfo:v15];
        v27[3] = v16;
        v17 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
        id v12 = [v19 initWithDomain:_SWCErrorDomain code:104 userInfo:v17];

        v9 = 0;
        id v8 = (id)v20;
      }
      else
      {
        id v21 = v8;
        v9 = +[NSJSONSerialization JSONObjectWithData:v22 options:0 error:&v21];
        id v12 = v21;
      }

      id v8 = v12;
    }
  }
  if (a4 && !v9) {
    *a4 = v8;
  }

  return v9;
}

- (BOOL)verifyTrust:(__SecTrust *)a3 error:(id *)a4
{
  return [(SWCSecurityGuard *)self verifyTrust:a3 allowInstalledRootCertificates:0 error:a4];
}

- (BOOL)verifyTrust:(__SecTrust *)a3 allowInstalledRootCertificates:(BOOL)a4 error:(id *)a5
{
  optional<SecTrustResultType> v9 = -[SWCSecurityGuard _evaluateTrust:allowingKeychains:error:](self, "_evaluateTrust:allowingKeychains:error:", a3, 0);
  if ((*(void *)&v9 & 0xFF00000000) == 0
    || (optional<SecTrustResultType> v10 = v9, v9.var0.var1 == 5)
    && (optional<SecTrustResultType> v10 = [(SWCSecurityGuard *)self _evaluateTrust:a3 allowingKeychains:1 error:a5], (*(void *)&v10 & 0xFF00000000) == 0))
  {
    id v12 = 0;
    goto LABEL_14;
  }
  if (v10.var0.var1 == 1)
  {
    if (a4 || [(SWCSecurityGuard *)self _isSystemTrusted:a3])
    {
      id v12 = 0;
      BOOL v11 = 1;
      goto LABEL_17;
    }
    id v12 = [(SWCSecurityGuard *)self _errorForUntrustedRootCertificateOfTrust:a3];
    goto LABEL_14;
  }
  if (v10.var0.var1 != 4)
  {
    id v13 = objc_alloc((Class)NSError);
    v19[0] = &off_100036B40;
    v18[0] = @"Line";
    v18[1] = @"Function";
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard verifyTrust:allowInstalledRootCertificates:error:]");
    v19[1] = v14;
    v19[2] = @"Disallowed trust result type.";
    v18[2] = NSDebugDescriptionErrorKey;
    v18[3] = @"TrustResultType";
    v15 = +[NSNumber numberWithUnsignedInt:v10];
    v19[3] = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    id v12 = [v13 initWithDomain:_SWCErrorDomain code:100 userInfo:v16];

LABEL_14:
    BOOL v11 = 0;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  BOOL v11 = [(SWCSecurityGuard *)self _verifyExtendedValidationOfTrust:a3 error:a5];
  id v12 = 0;
  if (!a5) {
    goto LABEL_17;
  }
LABEL_15:
  if (!v11)
  {
    id v12 = v12;
    BOOL v11 = 0;
    *a5 = v12;
  }
LABEL_17:

  return v11;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SWCSecurityGuard;
  return [(SWCSecurityGuard *)&v3 init];
}

- (optional<SecTrustResultType>)_evaluateTrust:(__SecTrust *)a3 error:(id *)a4
{
  CFErrorRef error = 0;
  BOOL v7 = SecTrustEvaluateWithError(a3, &error);
  SecTrustResultType result = kSecTrustResultInvalid;
  OSStatus TrustResult = SecTrustGetTrustResult(a3, &result);
  if (!TrustResult)
  {
    unsigned __int32 v26 = result & 0xFFFFFF00;
    int v27 = result;
    v28 = &_mh_execute_header;
    goto LABEL_18;
  }
  if (v7)
  {
    id v9 = objc_alloc((Class)NSError);
    v40[0] = &off_100036B58;
    v39[0] = @"Line";
    v39[1] = @"Function";
    v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _evaluateTrust:error:]");
    v40[1] = v30;
    v40[2] = @"Failed to get trust result type.";
    v39[2] = NSDebugDescriptionErrorKey;
    v39[3] = NSUnderlyingErrorKey;
    id v10 = objc_alloc((Class)NSError);
    v37[1] = @"Function";
    v38[0] = &off_100036B58;
    v37[0] = @"Line";
    BOOL v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _evaluateTrust:error:]");
    v38[1] = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    id v13 = [v10 initWithDomain:NSOSStatusErrorDomain code:TrustResult userInfo:v12];
    v40[3] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
    v15 = (__CFError *)[v9 initWithDomain:_SWCErrorDomain code:100 userInfo:v14];
    CFErrorRef v16 = error;
    CFErrorRef error = v15;
  }
  v17 = [(__CFError *)error userInfo];
  id v18 = [v17 mutableCopy];

  if (v18)
  {
    CFDictionaryRef v19 = SecTrustCopyResult(a3);
    if (v19) {
      [v18 setObject:v19 forKeyedSubscript:@"TrustResult"];
    }

    uint64_t v20 = (void *)SecTrustCopyFailureDescription();
    if (v20) {
      [v18 setObject:v20 forKeyedSubscript:@"TrustFailureReason"];
    }

    id v21 = objc_alloc((Class)NSError);
    id v22 = [(__CFError *)error domain];
    id v23 = (__CFError *)[v21 initWithDomain:v22 code:-[__CFError code](error, "code") userInfo:v18];
    CFErrorRef v24 = error;
    CFErrorRef error = v23;
  }
  if (qword_10003B2B0 != -1) {
    dispatch_once(&qword_10003B2B0, &stru_100035200);
  }
  v25 = qword_10003B2A8;
  if (os_log_type_enabled((os_log_t)qword_10003B2A8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v34 = a3;
    __int16 v35 = 2112;
    CFErrorRef v36 = error;
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error evaluating trust %@: %@", buf, 0x16u);
    if (a4) {
      goto LABEL_14;
    }
LABEL_17:
    unsigned __int32 v26 = 0;
    int v27 = 0;
    v28 = 0;
    goto LABEL_18;
  }
  if (!a4) {
    goto LABEL_17;
  }
LABEL_14:
  unsigned __int32 v26 = 0;
  int v27 = 0;
  v28 = 0;
  *a4 = error;
LABEL_18:

  return (optional<SecTrustResultType>)((unint64_t)v28 | v27 | v26);
}

- (optional<SecTrustResultType>)_evaluateTrust:(__SecTrust *)a3 allowingKeychains:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  char v23 = 0;
  int KeychainsAllowed = SecTrustGetKeychainsAllowed();
  if (KeychainsAllowed)
  {
    id v10 = objc_alloc((Class)NSError);
    v33[0] = &off_100036B70;
    v32[0] = @"Line";
    v32[1] = @"Function";
    uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _evaluateTrust:allowingKeychains:error:]");
    v33[1] = v17;
    v33[2] = @"Failed to get whether keychains are allowed as a source of trust.";
    v32[2] = NSDebugDescriptionErrorKey;
    v32[3] = NSUnderlyingErrorKey;
    id v11 = objc_alloc((Class)NSError);
    v30[1] = @"Function";
    v31[0] = &off_100036B70;
    v30[0] = @"Line";
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _evaluateTrust:allowingKeychains:error:]");
    v31[1] = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    id v14 = [v11 initWithDomain:NSOSStatusErrorDomain code:KeychainsAllowed userInfo:v13];
    v33[3] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];
    id v16 = [v10 initWithDomain:_SWCErrorDomain code:-1 userInfo:v15];

    LOBYTE(v17) = 0;
    goto LABEL_3;
  }
  SecTrustSetKeychainsAllowed();
  id v22 = 0;
  uint64_t v17 = [(SWCSecurityGuard *)self _evaluateTrust:a3 error:&v22];
  id v16 = v22;
  SecTrustSetKeychainsAllowed();
  LODWORD(v13) = v17 >> 8;
  uint64_t v18 = v17 & 0xFF00000000;
  if ((v17 & 0xFF00000000) == 0)
  {
LABEL_3:
    if (a5)
    {
      id v16 = v16;
      uint64_t v18 = 0;
      *a5 = v16;
    }
    else
    {
      uint64_t v18 = 0;
    }
    goto LABEL_13;
  }
  if (qword_10003B2B0 != -1) {
    dispatch_once(&qword_10003B2B0, &stru_100035200);
  }
  CFDictionaryRef v19 = qword_10003B2A8;
  if (os_log_type_enabled((os_log_t)qword_10003B2A8, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v20 = @"NOT ";
    *(_DWORD *)buf = 138412802;
    v25 = a3;
    if (v6) {
      CFStringRef v20 = &stru_100035ED8;
    }
    __int16 v26 = 2114;
    CFStringRef v27 = v20;
    __int16 v28 = 2048;
    uint64_t v29 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Trust result for %@ (keychains %{public}@allowed): %llu", buf, 0x20u);
  }
LABEL_13:

  return (optional<SecTrustResultType>)(v17 | ((v13 & 0xFFFFFF) << 8) | v18);
}

- (id)_errorForUntrustedRootCertificateOfTrust:(__SecTrust *)a3
{
  CFIndex CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount < 1)
  {
    CertificateAtIndex = 0;
LABEL_9:
    CFStringRef v8 = @"Certificate is not rooted in the system trust store.";
    goto LABEL_10;
  }
  CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, CertificateCount - 1);
  if (!CertificateAtIndex) {
    goto LABEL_9;
  }
  BOOL v6 = +[_SWCPrefs sharedPrefs];
  unsigned int v7 = [v6 isAppleInternal];

  if (!v7) {
    goto LABEL_9;
  }
  uint64_t v17 = 0;
  CFStringRef v8 = @"Certificate is not rooted in the system trust store.";
  if (!SecCertificateCopyCommonName(CertificateAtIndex, (CFStringRef *)&v17)
    && [(__CFString *)v17 hasPrefix:@"Apple Corporate"])
  {
    CFStringRef v8 = @"Root certificate appears to be issued by an internal Apple authority. Such certificates cannot be used with the public associated domains API. Internal Apple applications should use the internal associated domains API instead.";
  }

LABEL_10:
  id v9 = objc_alloc((Class)NSError);
  v19[0] = &off_100036B88;
  v18[0] = @"Line";
  v18[1] = @"Function";
  id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _errorForUntrustedRootCertificateOfTrust:]");
  v19[1] = v10;
  v18[2] = @"RootCertificate";
  uint64_t v11 = [(__SecCertificate *)CertificateAtIndex description];
  id v12 = (void *)v11;
  CFStringRef v13 = @"<none>";
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  v18[3] = NSDebugDescriptionErrorKey;
  v19[2] = v13;
  v19[3] = v8;
  id v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  id v15 = [v9 initWithDomain:_SWCErrorDomain code:103 userInfo:v14];

  return v15;
}

- (BOOL)_verifyExtendedValidationOfTrust:(__SecTrust *)a3 error:(id *)a4
{
  BOOL v6 = +[_SWCPrefs sharedPrefs];
  unsigned int v7 = [v6 verifyExtendedValidation];

  if (!v7) {
    return 1;
  }
  CFDictionaryRef v8 = SecTrustCopyResult(a3);
  CFDictionaryRef v9 = v8;
  if (v8)
  {
    id v10 = [(__CFDictionary *)v8 objectForKeyedSubscript:kSecTrustExtendedValidation];
    uint64_t v11 = v10;
    if (v10) {
      unsigned __int8 v12 = [v10 isEqual:&__kCFBooleanTrue];
    }
    else {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  if (a4 && (v12 & 1) == 0)
  {
    id v13 = objc_alloc((Class)NSError);
    v18[0] = &off_100036BA0;
    v17[0] = @"Line";
    v17[1] = @"Function";
    id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCSecurityGuard(Private) _verifyExtendedValidationOfTrust:error:]");
    v18[1] = v14;
    v17[2] = NSDebugDescriptionErrorKey;
    v18[2] = @"Extended validation failed.";
    id v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    *a4 = [v13 initWithDomain:_SWCErrorDomain code:102 userInfo:v15];

    return 0;
  }
  return v12;
}

- (BOOL)_isSystemTrusted:(__SecTrust *)a3
{
  CFIndex CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount < 1)
  {
    LOBYTE(CertificateAtIndex) = 0;
  }
  else
  {
    SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, CertificateCount - 1);
    if (CertificateAtIndex)
    {
      SecTrustStoreForDomain();
      LOBYTE(CertificateAtIndex) = SecTrustStoreContains() != 0;
    }
  }
  return (char)CertificateAtIndex;
}

@end