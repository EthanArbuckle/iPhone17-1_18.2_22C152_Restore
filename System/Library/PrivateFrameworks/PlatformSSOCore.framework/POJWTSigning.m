@interface POJWTSigning
+ (BOOL)verifyJWTSignature:(id)a3 algorithm:(id)a4 key:(__SecKey *)a5;
+ (BOOL)verifyJWTSignature:(id)a3 signingAlgorithm:(id)a4 key:(__SecKey *)a5;
+ (id)algorithmWithIdentifier:(id)a3;
+ (id)algorithmWithSigningAlgorithm:(id)a3;
+ (id)encodeAndSignJWT:(id)a3 algorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6;
+ (id)encodeAndSignJWT:(id)a3 algorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6 error:(id *)a7;
+ (id)encodeAndSignJWT:(id)a3 signingAlgorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6;
+ (id)encodeAndSignJWT:(id)a3 signingAlgorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6 error:(id *)a7;
- (BOOL)verifyJWTSignature:(id)a3 key:(__SecKey *)a4;
- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingCertificateString:(id)a5;
- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingKey:(__SecKey *)a5;
- (NSString)alg;
- (NSString)algorithmName;
- (POJWTSigning)initWithSecKeyAlgorithm:(__CFString *)a3 algorithmName:(id)a4 alg:(id)a5;
- (__CFString)algorithm;
- (id)encodeAndSignJWT:(id)a3 key:(__SecKey *)a4 certificate:(__SecCertificate *)a5 error:(id *)a6;
- (id)signData:(id)a3 usingKey:(__SecKey *)a4 error:(id *)a5;
@end

@implementation POJWTSigning

- (POJWTSigning)initWithSecKeyAlgorithm:(__CFString *)a3 algorithmName:(id)a4 alg:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)POJWTSigning;
  v11 = [(POJWTSigning *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_algorithm = a3;
    objc_storeStrong((id *)&v11->_algorithmName, a4);
    objc_storeStrong((id *)&v12->_alg, a5);
  }

  return v12;
}

+ (id)algorithmWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ES256"])
  {
    v4 = [POJWTSigning alloc];
    uint64_t v5 = *MEMORY[0x263F172C0];
    v6 = @"kSecKeyAlgorithmECDSASignatureMessageRFC4754SHA256";
    v7 = @"ES256";
LABEL_13:
    v8 = [(POJWTSigning *)v4 initWithSecKeyAlgorithm:v5 algorithmName:v6 alg:v7];
LABEL_14:
    id v9 = v8;
    goto LABEL_15;
  }
  if ([v3 isEqualToString:@"ES384"])
  {
    v4 = [POJWTSigning alloc];
    uint64_t v5 = *MEMORY[0x263F172C8];
    v6 = @"kSecKeyAlgorithmECDSASignatureMessageRFC4754SHA384";
    v7 = @"ES384";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"ES512"])
  {
    v4 = [POJWTSigning alloc];
    uint64_t v5 = *MEMORY[0x263F172D0];
    v6 = @"kSecKeyAlgorithmECDSASignatureMessageRFC4754SHA512";
    v7 = @"ES512";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"RS256"])
  {
    v4 = [POJWTSigning alloc];
    uint64_t v5 = *MEMORY[0x263F173A0];
    v6 = @"kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA256";
    v7 = @"RS256";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"RS384"])
  {
    v4 = [POJWTSigning alloc];
    uint64_t v5 = *MEMORY[0x263F173A8];
    v6 = @"kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA384";
    v7 = @"RS384";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"RS512"])
  {
    v4 = [POJWTSigning alloc];
    uint64_t v5 = *MEMORY[0x263F173B0];
    v6 = @"kSecKeyAlgorithmRSASignatureMessagePKCS1v15SHA512";
    v7 = @"RS512";
    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"EdDSA"])
  {
    v8 = objc_alloc_init(_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519);
    goto LABEL_14;
  }
  id v9 = 0;
LABEL_15:

  return v9;
}

+ (id)algorithmWithSigningAlgorithm:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToNumber:0x2707DBB50])
  {
    v4 = [POJWTSigning alloc];
    uint64_t v5 = *MEMORY[0x263F172C0];
    v6 = @"kSecKeyAlgorithmECDSASignatureMessageRFC4754SHA256";
    v7 = @"ES256";
LABEL_5:
    v8 = [(POJWTSigning *)v4 initWithSecKeyAlgorithm:v5 algorithmName:v6 alg:v7];
LABEL_6:
    id v9 = v8;
    goto LABEL_7;
  }
  if ([v3 isEqualToNumber:0x2707DBB68])
  {
    v4 = [POJWTSigning alloc];
    uint64_t v5 = *MEMORY[0x263F172C8];
    v6 = @"kSecKeyAlgorithmECDSASignatureMessageRFC4754SHA384";
    v7 = @"ES384";
    goto LABEL_5;
  }
  if ([v3 isEqualToNumber:0x2707DBB80])
  {
    v8 = objc_alloc_init(_TtC15PlatformSSOCore30POCryptoKitAlgorithmCurve25519);
    goto LABEL_6;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

+ (BOOL)verifyJWTSignature:(id)a3 algorithm:(id)a4 key:(__SecKey *)a5
{
  id v7 = a3;
  v8 = +[POJWTSigning algorithmWithIdentifier:a4];
  id v9 = v8;
  if (v8)
  {
    char v10 = [v8 verifyJWTSignature:v7 key:a5];
  }
  else
  {
    id v11 = __49__POJWTSigning_verifyJWTSignature_algorithm_key___block_invoke();
    char v10 = 0;
  }

  return v10;
}

id __49__POJWTSigning_verifyJWTSignature_algorithm_key___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Algorithm not found when verifying JWT."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

+ (BOOL)verifyJWTSignature:(id)a3 signingAlgorithm:(id)a4 key:(__SecKey *)a5
{
  id v7 = a3;
  v8 = +[POJWTSigning algorithmWithSigningAlgorithm:a4];
  id v9 = v8;
  if (v8)
  {
    char v10 = [v8 verifyJWTSignature:v7 key:a5];
  }
  else
  {
    id v11 = __49__POJWTSigning_verifyJWTSignature_algorithm_key___block_invoke();
    char v10 = 0;
  }

  return v10;
}

- (BOOL)verifyJWTSignature:(id)a3 key:(__SecKey *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
  v8 = [v6 rawSignature];
  id v9 = objc_msgSend(v7, "psso_initWithBase64URLEncodedString:", v8);

  if (v9)
  {
    char v10 = NSString;
    id v11 = [v6 rawHeader];
    v12 = [v6 rawBody];
    v13 = [v10 stringWithFormat:@"%@.%@", v11, v12];
    objc_super v14 = [v13 dataUsingEncoding:1];

    BOOL v15 = [(POJWTSigning *)self verifySignature:v9 onData:v14 usingKey:a4];
  }
  else
  {
    id v16 = __39__POJWTSigning_verifyJWTSignature_key___block_invoke();
    BOOL v15 = 0;
  }

  return v15;
}

id __39__POJWTSigning_verifyJWTSignature_key___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to decode signature."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

+ (id)encodeAndSignJWT:(id)a3 algorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6
{
  return (id)[a1 encodeAndSignJWT:a3 algorithm:a4 key:a5 certificate:a6 error:0];
}

+ (id)encodeAndSignJWT:(id)a3 algorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6 error:(id *)a7
{
  id v11 = a3;
  v12 = +[POJWTSigning algorithmWithIdentifier:a4];
  v13 = v12;
  if (v12)
  {
    objc_super v14 = [v12 encodeAndSignJWT:v11 key:a5 certificate:a6 error:a7];
  }
  else
  {
    id v15 = __65__POJWTSigning_encodeAndSignJWT_algorithm_key_certificate_error___block_invoke();
    objc_super v14 = 0;
  }

  return v14;
}

id __65__POJWTSigning_encodeAndSignJWT_algorithm_key_certificate_error___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Algorithm not found when signing JWT."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

+ (id)encodeAndSignJWT:(id)a3 signingAlgorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6
{
  return (id)[a1 encodeAndSignJWT:a3 signingAlgorithm:a4 key:a5 certificate:a6 error:0];
}

+ (id)encodeAndSignJWT:(id)a3 signingAlgorithm:(id)a4 key:(__SecKey *)a5 certificate:(__SecCertificate *)a6 error:(id *)a7
{
  id v11 = a3;
  v12 = +[POJWTSigning algorithmWithSigningAlgorithm:a4];
  v13 = v12;
  if (v12)
  {
    objc_super v14 = [v12 encodeAndSignJWT:v11 key:a5 certificate:a6 error:a7];
  }
  else
  {
    id v15 = __65__POJWTSigning_encodeAndSignJWT_algorithm_key_certificate_error___block_invoke();
    objc_super v14 = 0;
  }

  return v14;
}

- (id)encodeAndSignJWT:(id)a3 key:(__SecKey *)a4 certificate:(__SecCertificate *)a5 error:(id *)a6
{
  v51[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = [v10 header];

  if (!v11)
  {
    v12 = objc_alloc_init(POMutableJWTHeader);
    [v10 setHeader:v12];
  }
  v13 = [(POJWTSigning *)self alg];
  objc_super v14 = [v10 header];
  [v14 setAlg:v13];

  id v15 = [v10 header];
  id v16 = [v15 typ];

  if (!v16)
  {
    v17 = [v10 header];
    [v17 setTyp:@"JWT"];
  }
  SecKeyRef v18 = SecKeyCopyPublicKey(a4);
  if (v18)
  {
    v19 = v18;
    v20 = [v10 header];
    v21 = [v20 kid];
    uint64_t v22 = [v21 length];

    if (v22)
    {
      if (!a5) {
        goto LABEL_15;
      }
    }
    else
    {
      CFDataRef v24 = SecKeyCopyExternalRepresentation(v19, 0);
      v25 = [(__CFData *)v24 psso_sha256Hash];
      v26 = [v25 base64EncodedStringWithOptions:0];
      v27 = [v10 header];
      [v27 setKid:v26];

      if (!a5)
      {
LABEL_15:
        CFRelease(v19);
        v35 = [v10 header];
        v36 = [v35 dataRepresentation];

        v37 = objc_msgSend(v36, "psso_base64URLEncodedString");
        v38 = [v10 body];
        v39 = [v38 dataRepresentation];

        v40 = objc_msgSend(v39, "psso_base64URLEncodedString");
        CFAllocatorRef v41 = (const __CFAllocator *)SecCFAllocatorZeroize();
        CFStringRef v42 = CFStringCreateWithFormat(v41, 0, @"%@.%@", v37, v40);
        CFAllocatorRef v43 = (const __CFAllocator *)SecCFAllocatorZeroize();
        CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v43, v42, 0x8000100u, 0);
        if (v42) {
          CFRelease(v42);
        }
        v45 = [(POJWTSigning *)self signData:ExternalRepresentation usingKey:a4 error:a6];

        if ([v45 length])
        {
          v46 = objc_msgSend(v45, "psso_base64URLEncodedString");
          CFAllocatorRef v47 = (const __CFAllocator *)SecCFAllocatorZeroize();
          v48 = (__CFString *)CFStringCreateWithFormat(v47, 0, @"%@.%@.%@", v37, v40, v46);
        }
        else
        {
          v48 = 0;
        }

        goto LABEL_25;
      }
    }
    CFDataRef v28 = SecCertificateCopyData(a5);
    if (v28)
    {
      CFDataRef v29 = v28;
      uint64_t v30 = [(__CFData *)v28 base64EncodedStringWithOptions:0];
      v31 = (void *)v30;
      v32 = &stru_2707C1488;
      if (v30) {
        v32 = (__CFString *)v30;
      }
      v51[0] = v32;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];
      v34 = [v10 header];
      [v34 setX5c:v33];

      goto LABEL_15;
    }
    v23 = __55__POJWTSigning_encodeAndSignJWT_key_certificate_error___block_invoke_71();
  }
  else
  {
    v23 = __55__POJWTSigning_encodeAndSignJWT_key_certificate_error___block_invoke();
  }
  v49 = v23;
  if (a6) {
    *a6 = v23;
  }

  v48 = 0;
LABEL_25:

  return v48;
}

id __55__POJWTSigning_encodeAndSignJWT_key_certificate_error___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to copy public key when signing JWT."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __55__POJWTSigning_encodeAndSignJWT_key_certificate_error___block_invoke_71()
{
  v0 = +[POError errorWithCode:-1004 description:@"Failed to extract certificate data when signing JWT."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)signData:(id)a3 usingKey:(__SecKey *)a4 error:(id *)a5
{
  CFDataRef v8 = (const __CFData *)a3;
  if (SecKeyIsAlgorithmSupported(a4, kSecKeyOperationTypeSign, [(POJWTSigning *)self algorithm]))
  {
    if ([(__CFData *)v8 length])
    {
      error[0] = 0;
      CFDataRef Signature = SecKeyCreateSignature(a4, [(POJWTSigning *)self algorithm], v8, error);
      if (error[0])
      {
        if (CFErrorGetCode(error[0]) == -3)
        {
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __40__POJWTSigning_signData_usingKey_error___block_invoke_91;
          v17[3] = &unk_265463CD8;
          v17[4] = self;
          v17[5] = error[0];
          id v10 = __40__POJWTSigning_signData_usingKey_error___block_invoke_91((uint64_t)v17);
        }
        else
        {
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __40__POJWTSigning_signData_usingKey_error___block_invoke_95;
          v16[3] = &unk_265463CD8;
          v16[4] = self;
          v16[5] = error[0];
          id v10 = __40__POJWTSigning_signData_usingKey_error___block_invoke_95((uint64_t)v16);
        }
        objc_super v14 = v10;
        if (a5) {
          *a5 = v10;
        }

        CFDataRef v13 = 0;
      }
      else
      {
        CFDataRef v13 = Signature;
      }

      goto LABEL_17;
    }
    error[1] = (CFErrorRef)MEMORY[0x263EF8330];
    error[2] = (CFErrorRef)3221225472;
    error[3] = (CFErrorRef)__40__POJWTSigning_signData_usingKey_error___block_invoke_87;
    error[4] = (CFErrorRef)&unk_265463860;
    error[5] = (CFErrorRef)self;
    id v11 = __40__POJWTSigning_signData_usingKey_error___block_invoke_87();
  }
  else
  {
    error[6] = (CFErrorRef)MEMORY[0x263EF8330];
    error[7] = (CFErrorRef)3221225472;
    error[8] = (CFErrorRef)__40__POJWTSigning_signData_usingKey_error___block_invoke;
    error[9] = (CFErrorRef)&unk_265463860;
    error[10] = (CFErrorRef)self;
    id v11 = __40__POJWTSigning_signData_usingKey_error___block_invoke();
  }
  v12 = v11;
  if (a5) {
    *a5 = v11;
  }

  CFDataRef v13 = 0;
LABEL_17:

  return v13;
}

id __40__POJWTSigning_signData_usingKey_error___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Signing algorithm not supported"];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v0;
}

id __40__POJWTSigning_signData_usingKey_error___block_invoke_87()
{
  v0 = +[POError errorWithCode:-1005 description:@"No data to sign."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v0;
}

id __40__POJWTSigning_signData_usingKey_error___block_invoke_91(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  v2 = +[POError errorWithCode:-1010 underlyingError:v1 description:@"Key error creating signature"];

  id v3 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v2;
}

id __40__POJWTSigning_signData_usingKey_error___block_invoke_95(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Error creating signature"];

  id v3 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v2;
}

- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingCertificateString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 length])
  {
    CFDataRef v11 = (const __CFData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v10 options:0];
    if ([(__CFData *)v11 length])
    {
      v12 = SecCertificateCreateWithData(0, v11);
      if (v12)
      {
        CFDataRef v13 = v12;
        SecKeyRef v14 = SecCertificateCopyKey(v12);
        CFRelease(v13);
        if (v14)
        {
          BOOL v15 = [(POJWTSigning *)self verifySignature:v8 onData:v9 usingKey:v14];
          CFRelease(v14);
LABEL_11:

          goto LABEL_12;
        }
        id v19 = __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_110();
      }
      else
      {
        id v18 = __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_106();
      }
    }
    else
    {
      id v17 = __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_102();
    }
    BOOL v15 = 0;
    goto LABEL_11;
  }
  id v16 = __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke();
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

id __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"No certificate string."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v0;
}

id __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_102()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to base64 decode."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v0;
}

id __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_106()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to create certificate."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v0;
}

id __62__POJWTSigning_verifySignature_onData_usingCertificateString___block_invoke_110()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to get public key."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)verifySignature:(id)a3 onData:(id)a4 usingKey:(__SecKey *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!SecKeyIsAlgorithmSupported(a5, kSecKeyOperationTypeVerify, [(POJWTSigning *)self algorithm]))
  {
    CFErrorRef error[11] = (CFErrorRef)MEMORY[0x263EF8330];
    error[12] = (CFErrorRef)3221225472;
    error[13] = (CFErrorRef)__48__POJWTSigning_verifySignature_onData_usingKey___block_invoke;
    error[14] = (CFErrorRef)&unk_265463860;
    error[15] = (CFErrorRef)self;
    id v13 = __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke();
LABEL_9:
    BOOL v11 = 0;
    goto LABEL_10;
  }
  if (![v8 length])
  {
    error[6] = (CFErrorRef)MEMORY[0x263EF8330];
    error[7] = (CFErrorRef)3221225472;
    error[8] = (CFErrorRef)__48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_117;
    error[9] = (CFErrorRef)&unk_265463860;
    error[10] = (CFErrorRef)self;
    id v14 = __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_117();
    goto LABEL_9;
  }
  if (![v9 length])
  {
    error[1] = (CFErrorRef)MEMORY[0x263EF8330];
    error[2] = (CFErrorRef)3221225472;
    error[3] = (CFErrorRef)__48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_121;
    error[4] = (CFErrorRef)&unk_265463860;
    error[5] = (CFErrorRef)self;
    id v15 = __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_121();
    goto LABEL_9;
  }
  error[0] = 0;
  int v10 = SecKeyVerifySignature(a5, [(POJWTSigning *)self algorithm], (CFDataRef)v9, (CFDataRef)v8, error);
  BOOL v11 = v10 != 0;
  if (!v10)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_125;
    v17[3] = &unk_265463CD8;
    v17[4] = self;
    v17[5] = error[0];
    id v12 = __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_125((uint64_t)v17);
  }
LABEL_10:

  return v11;
}

id __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Signing algorithm not supported for verification."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_117()
{
  v0 = +[POError errorWithCode:-1008 description:@"No signature to verify for verification."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_121()
{
  v0 = +[POError errorWithCode:-1008 description:@"No data to verify."];
  v1 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v0;
}

id __48__POJWTSigning_verifySignature_onData_usingKey___block_invoke_125(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  v2 = +[POError errorWithCode:-1008 underlyingError:v1 description:@"Error verifying signature."];

  id v3 = PO_LOG_POJWTSigning();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1();
  }

  return v2;
}

- (NSString)alg
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (__CFString)algorithm
{
  return self->_algorithm;
}

- (NSString)algorithmName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmName, 0);
  objc_storeStrong((id *)&self->_alg, 0);
}

void __40__POJWTSigning_signData_usingKey_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_3_4(v0, v1), "algorithmName");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);
}

@end