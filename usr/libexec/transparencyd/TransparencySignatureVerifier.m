@interface TransparencySignatureVerifier
+ (BOOL)verifyMessage:(id)a3 signature:(id)a4 spkiHash:(id)a5 trustedKeys:(id)a6 algorithm:(__CFString *)a7 error:(id *)a8;
+ (__CFString)secKeyAlgorithmForProtoAlgorithm:(int)a3;
+ (int)protoAlgorithmForSecKeyAlgorithm:(__CFString *)a3;
- (BOOL)needsRefresh;
- (BOOL)verifyMessage:(id)a3 signature:(id)a4 spkiHash:(id)a5 algorithm:(__CFString *)a6 error:(id *)a7;
- (NSDictionary)trustedKeys;
- (TransparencySignatureVerifier)initWithTrustedKeys:(id)a3;
- (void)setNeedsRefresh:(BOOL)a3;
- (void)setTrustedKeys:(id)a3;
@end

@implementation TransparencySignatureVerifier

+ (__CFString)secKeyAlgorithmForProtoAlgorithm:(int)a3
{
  if (a3 == 1) {
    return (__CFString *)kSecKeyAlgorithmECDSASignatureMessageX962SHA256;
  }
  if (qword_10032F288 != -1) {
    dispatch_once(&qword_10032F288, &stru_1002C8DB8);
  }
  v5 = qword_10032F290;
  if (os_log_type_enabled((os_log_t)qword_10032F290, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unknown signature algorithm: %d", (uint8_t *)v6, 8u);
  }
  return 0;
}

+ (int)protoAlgorithmForSecKeyAlgorithm:(__CFString *)a3
{
  v3 = a3;
  if ([(__CFString *)v3 isEqualToString:kSecKeyAlgorithmECDSASignatureMessageX962SHA256])
  {
    int v4 = 1;
  }
  else
  {
    if (qword_10032F288 != -1) {
      dispatch_once(&qword_10032F288, &stru_1002C8DD8);
    }
    v5 = qword_10032F290;
    if (os_log_type_enabled((os_log_t)qword_10032F290, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unknown signature algorithm: %@", (uint8_t *)&v7, 0xCu);
    }
    int v4 = 0;
  }

  return v4;
}

- (TransparencySignatureVerifier)initWithTrustedKeys:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransparencySignatureVerifier;
  v6 = [(TransparencySignatureVerifier *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_trustedKeys, a3);
  }

  return v7;
}

- (BOOL)verifyMessage:(id)a3 signature:(id)a4 spkiHash:(id)a5 algorithm:(__CFString *)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [(TransparencySignatureVerifier *)self trustedKeys];
  id v19 = 0;
  BOOL v16 = +[TransparencySignatureVerifier verifyMessage:v14 signature:v13 spkiHash:v12 trustedKeys:v15 algorithm:a6 error:&v19];

  id v17 = v19;
  if (!v16
    && +[TransparencyError hasUnknownSPKIHashError:v17])
  {
    [(TransparencySignatureVerifier *)self setNeedsRefresh:1];
  }
  if (a7 && v17) {
    *a7 = v17;
  }

  return v16;
}

+ (BOOL)verifyMessage:(id)a3 signature:(id)a4 spkiHash:(id)a5 trustedKeys:(id)a6 algorithm:(__CFString *)a7 error:(id *)a8
{
  CFDataRef v13 = (const __CFData *)a3;
  CFDataRef v14 = (const __CFData *)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v16;
  if (a7)
  {
    v18 = (__SecKey *)[v16 objectForKey:v15];
    if (v18)
    {
      CFErrorRef error = 0;
      BOOL v19 = SecKeyVerifySignature(v18, a7, v13, v14, &error) == 1;
      v20 = error;
      if (error)
      {
        if (qword_10032F288 != -1) {
          dispatch_once(&qword_10032F288, &stru_1002C8E18);
        }
        v21 = qword_10032F290;
        if (os_log_type_enabled((os_log_t)qword_10032F290, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Signature verification failed: %@", buf, 0xCu);
        }
        if (a8)
        {
          id v22 = v20;
LABEL_13:
          *a8 = v22;
        }
      }
    }
    else
    {
      v24 = [v15 base64EncodedStringWithOptions:0];
      v20 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify", -9, @"Unable to find trusted key for SPKI hash: %@", v24 code description];

      if (a8 && v20) {
        *a8 = v20;
      }
      if (qword_10032F288 != -1) {
        dispatch_once(&qword_10032F288, &stru_1002C8DF8);
      }
      v25 = (void *)qword_10032F290;
      if (os_log_type_enabled((os_log_t)qword_10032F290, OS_LOG_TYPE_ERROR))
      {
        v26 = v25;
        v27 = [v15 base64EncodedStringWithOptions:0];
        *(_DWORD *)buf = 138543362;
        v31 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Unable to find trusted key for SPKI hash: %{public}@", buf, 0xCu);
      }
      BOOL v19 = 0;
    }
  }
  else
  {
    v23 = +[TransparencyError errorWithDomain:@"TransparencyErrorVerify" code:-136 description:@"Unknown signature algorithm"];
    v20 = v23;
    BOOL v19 = 0;
    if (a8 && v23)
    {
      id v22 = v23;
      v20 = v22;
      BOOL v19 = 0;
      goto LABEL_13;
    }
  }

  return v19;
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (NSDictionary)trustedKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrustedKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end