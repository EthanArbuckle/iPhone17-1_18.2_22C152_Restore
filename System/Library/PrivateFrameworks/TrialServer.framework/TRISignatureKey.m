@interface TRISignatureKey
+ (__SecKey)_keyFromCertificateChain:(id)a3;
+ (id)keyFromData:(id)a3;
- (BOOL)_validateBase64Signature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5;
- (BOOL)_validateSignature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5;
- (BOOL)validateBase64Signature:(id)a3 data:(id)a4;
- (BOOL)validateBase64Signature:(id)a3 forFile:(id)a4;
- (TRISignatureKey)initWithKey:(__SecKey *)a3;
- (void)dealloc;
@end

@implementation TRISignatureKey

+ (id)keyFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[TRISignatureKey _keyFromCertificateChain:v3];
    if (v4) {
      v4 = [[TRISignatureKey alloc] initWithKey:v4];
    }
  }
  else
  {
    v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "TRISignatureKey: no certificate data.", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

+ (__SecKey)_keyFromCertificateChain:(id)a3
{
  v44[3] = *MEMORY[0x1E4F143B8];
  CFDataRef v3 = (const __CFData *)a3;
  if (!os_variant_allows_internal_security_policies()
    || !os_variant_has_internal_diagnostics())
  {
LABEL_7:
    CFDataRef v36 = v3;
    v11 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    v5 = objc_opt_new();
    if ([v11 length])
    {
      while (1)
      {
        v12 = (void *)MEMORY[0x1E016E7F0]();
        v13 = [MEMORY[0x1E4F28FE8] scannerWithString:v11];
        v14 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\n"];
        [v13 setCharactersToBeSkipped:v14];

        [v13 scanUpToString:@"-----BEGIN CERTIFICATE-----" intoString:0];
        [v13 scanString:@"-----BEGIN CERTIFICATE-----" intoString:0];
        id v40 = 0;
        [v13 scanUpToString:@"-----END CERTIFICATE-----" intoString:&v40];
        id v15 = v40;
        if (!v15)
        {

          goto LABEL_13;
        }
        v16 = v15;
        CFDataRef v17 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v15 options:1];
        SecCertificateRef v18 = SecCertificateCreateWithData(0, v17);
        if (!v18) {
          break;
        }
        SecCertificateRef v19 = v18;
        [v5 addObject:v18];

        [v13 scanString:@"-----END CERTIFICATE-----" intoString:0];
        v20 = [v13 string];
        v4 = objc_msgSend(v20, "substringFromIndex:", objc_msgSend(v13, "scanLocation"));

        v11 = v4;
        if (![v4 length]) {
          goto LABEL_14;
        }
      }
      v25 = TRILogCategory_Server();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "TRISignatureKey: invalid certificate data in certificate chain.", buf, 2u);
      }

      v10 = 0;
      v4 = v11;
      goto LABEL_26;
    }
LABEL_13:
    v4 = v11;
LABEL_14:
    if (![v5 count])
    {
      v24 = TRILogCategory_Server();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "TRISignatureKey: No certificates in cert chain.", buf, 2u);
      }

      v10 = 0;
LABEL_26:
      CFDataRef v3 = v36;
      goto LABEL_27;
    }
    CFStringRef commonName = 0;
    v21 = [v5 objectAtIndexedSubscript:0];
    OSStatus v22 = SecCertificateCopyCommonName(v21, &commonName);

    if (v22)
    {
      v23 = TRILogCategory_Server();
      CFDataRef v3 = v36;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "TRISignatureKey: failed to get leaf common name.", buf, 2u);
      }
      v10 = 0;
LABEL_19:

      goto LABEL_27;
    }
    v23 = commonName;
    [(__CFString *)(id)commonName isEqualToString:@"Trial"];
    ApplePinned = (const void *)SecPolicyCreateApplePinned();
    if (!ApplePinned)
    {
      v32 = TRILogCategory_Server();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "TRISignatureKey: failed to create security policy.", buf, 2u);
      }

      v10 = 0;
      CFDataRef v3 = v36;
      goto LABEL_19;
    }
    SecTrustRef trust = 0;
    OSStatus v28 = SecTrustCreateWithCertificates(v5, ApplePinned, &trust);
    if (v28)
    {
      OSStatus v29 = v28;
      v30 = TRILogCategory_Server();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (__CFString *)SecCopyErrorMessageString(v29, 0);
        *(_DWORD *)buf = 138543362;
        v42 = v31;
        _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "TRISignatureKey: trust creation for the certificate chain failed with error: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      CFErrorRef error = 0;
      if (SecTrustEvaluateWithError(trust, &error))
      {
        v33 = [v5 objectAtIndexedSubscript:0];
        v10 = SecCertificateCopyKey(v33);

        if (v10)
        {
LABEL_43:
          if (trust) {
            CFRelease(trust);
          }
          CFRelease(ApplePinned);
          CFDataRef v3 = v36;
          if (v10)
          {
            v35 = TRILogCategory_Server();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1DA291000, v35, OS_LOG_TYPE_DEBUG, "TRISignatureKey: successfully created public key from the certificate chain.", buf, 2u);
            }
          }
          goto LABEL_19;
        }
        v30 = TRILogCategory_Server();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "TRISignatureKey: failed to create public key from the certificate chain.", buf, 2u);
        }
      }
      else
      {
        v30 = error;
        v34 = TRILogCategory_Server();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v42 = v30;
          _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "TRISignatureKey: certificate chain validation failed with error: %{public}@.", buf, 0xCu);
        }
      }
    }

    v10 = 0;
    goto LABEL_43;
  }
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v4 valueForKey:*MEMORY[0x1E4FB04D0]];
  if ([v5 unsignedIntValue] != 4
    && [v5 unsignedIntValue] != 5)
  {
    goto LABEL_6;
  }
  uint64_t v6 = *MEMORY[0x1E4F3B740];
  uint64_t v7 = *MEMORY[0x1E4F3B6D8];
  v43[0] = *MEMORY[0x1E4F3B718];
  v43[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3B6F0];
  v44[0] = v6;
  v44[1] = v8;
  v43[2] = *MEMORY[0x1E4F3B708];
  v44[2] = &unk_1F347B9D8;
  CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
  v10 = SecKeyCreateWithData(v3, v9, 0);

  if (!v10)
  {
LABEL_6:

    goto LABEL_7;
  }
LABEL_27:

  return v10;
}

- (TRISignatureKey)initWithKey:(__SecKey *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TRISignatureKey;
  result = [(TRISignatureKey *)&v5 init];
  if (result) {
    result->_key = a3;
  }
  return result;
}

- (void)dealloc
{
  key = self->_key;
  if (key) {
    CFRelease(key);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRISignatureKey;
  [(TRISignatureKey *)&v4 dealloc];
}

- (BOOL)validateBase64Signature:(id)a3 forFile:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F3BA38];
  id v7 = a3;
  uint64_t v8 = +[TRIMemoryEfficientFileDigest sha256DigestForFile:a4];
  LOBYTE(self) = [(TRISignatureKey *)self _validateBase64Signature:v7 data:v8 algorithm:v6];

  return (char)self;
}

- (BOOL)validateBase64Signature:(id)a3 data:(id)a4
{
  return [(TRISignatureKey *)self _validateBase64Signature:a3 data:a4 algorithm:*MEMORY[0x1E4F3BA70]];
}

- (BOOL)_validateBase64Signature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5
{
  id v8 = a4;
  if (a3)
  {
    CFDictionaryRef v9 = (objc_class *)MEMORY[0x1E4F1C9B8];
    id v10 = a3;
    a3 = (id)[[v9 alloc] initWithBase64EncodedString:v10 options:1];
  }
  BOOL v11 = [(TRISignatureKey *)self _validateSignature:a3 data:v8 algorithm:a5];

  return v11;
}

- (BOOL)_validateSignature:(id)a3 data:(id)a4 algorithm:(__CFString *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CFDataRef v9 = (const __CFData *)a3;
  CFDataRef v10 = (const __CFData *)a4;
  CFDataRef v11 = v10;
  BOOL v12 = 0;
  if (v9 && v10)
  {
    key = self->_key;
    if (!key)
    {
      SecCertificateRef v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"TRISignatureKey.m", 235, @"Invalid parameter not satisfying: %@", @"_key" object file lineNumber description];

      key = self->_key;
    }
    if (SecKeyIsAlgorithmSupported(key, kSecKeyOperationTypeVerify, a5))
    {
      CFErrorRef error = 0;
      int v14 = SecKeyVerifySignature(self->_key, a5, v11, v9, &error);
      BOOL v12 = v14 != 0;
      if (!v14)
      {
        CFErrorRef v15 = error;
        v16 = TRILogCategory_Server();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          CFErrorRef v22 = v15;
          _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "TRISignatureKey: signature validation failed -- %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      CFDataRef v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "TRISignatureKey: key/algorithm mismatch.", buf, 2u);
      }

      BOOL v12 = 0;
    }
  }

  return v12;
}

@end