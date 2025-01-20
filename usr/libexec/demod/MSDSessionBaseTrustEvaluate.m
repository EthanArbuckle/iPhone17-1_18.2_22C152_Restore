@interface MSDSessionBaseTrustEvaluate
- (BOOL)applePKI;
- (BOOL)isDone;
- (BOOL)saveHubCertificateIdentifer:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4;
- (BOOL)trustServer:(__SecTrust *)a3 withRootCA:(__SecCertificate *)a4 withHostName:(id)a5;
- (BOOL)trustServerWithApplePKI:(__SecTrust *)a3;
- (BOOL)trustServerWithAxinoePKI:(__SecTrust *)a3;
- (__SecCertificate)leafCertificate;
- (id)hashForCertificate:(__SecCertificate *)a3;
- (id)identifierFor:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (void)setApplePKI:(BOOL)a3;
- (void)setIsDone:(BOOL)a3;
- (void)setLeafCertificate:(__SecCertificate *)a3;
@end

@implementation MSDSessionBaseTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[MSDTargetDevice sharedInstance];
  [(MSDSessionBaseTrustEvaluate *)self setApplePKI:1];
  if (v4)
  {
    int v21 = 0;
    BOOL v8 = 0;
    if (!SecTrustEvaluate(a3, (SecTrustResultType *)&v21)) {
      BOOL v8 = v21 == 4 || v21 == 1;
    }
    v10 = 0;
    goto LABEL_20;
  }
  if (![(MSDSessionBaseTrustEvaluate *)self trustServerWithApplePKI:a3])
  {
    [(MSDSessionBaseTrustEvaluate *)self setApplePKI:0];
    if (![(MSDSessionBaseTrustEvaluate *)self trustServerWithAxinoePKI:a3])
    {
      v17 = sub_100068600();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_1000D95C4();
      }
      goto LABEL_27;
    }
  }
  [(MSDSessionBaseTrustEvaluate *)self setLeafCertificate:SecTrustGetCertificateAtIndex(a3, 0)];
  if (![(MSDSessionBaseTrustEvaluate *)self leafCertificate])
  {
    v17 = sub_100068600();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000D4660();
    }
LABEL_27:

    v10 = 0;
LABEL_33:
    BOOL v8 = 0;
    goto LABEL_20;
  }
  uint64_t v11 = [v7 certificateHash];
  v10 = (void *)v11;
  if (self->_applePKI || !v11)
  {
    [(MSDSessionBaseTrustEvaluate *)self setIsDone:0];
    BOOL v8 = 0;
    goto LABEL_22;
  }
  v12 = [(MSDSessionBaseTrustEvaluate *)self hashForCertificate:self->_leafCertificate];
  unsigned __int8 v13 = [v10 isEqualToData:v12];

  v14 = sub_100068600();
  v15 = v14;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = [v10 hexStringRepresentation];
      v19 = [(MSDSessionBaseTrustEvaluate *)self hashForCertificate:self->_leafCertificate];
      v20 = [v19 hexStringRepresentation];
      int v21 = 138543618;
      v22 = v18;
      __int16 v23 = 2114;
      v24 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Certificate hash does not match the saved one - Saved:  %{public}@ - Current:  %{public}@", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_32;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Migrating certificate pinning.", (uint8_t *)&v21, 2u);
  }

  if (![(MSDSessionBaseTrustEvaluate *)self saveHubCertificateIdentifer:[(MSDSessionBaseTrustEvaluate *)self leafCertificate] applePKI:[(MSDSessionBaseTrustEvaluate *)self applePKI]])
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000D46C8();
    }
LABEL_32:

    goto LABEL_33;
  }
  BOOL v8 = 1;
LABEL_20:
  [(MSDSessionBaseTrustEvaluate *)self setIsDone:1];
LABEL_22:

  return v8;
}

- (BOOL)trustServerWithApplePKI:(__SecTrust *)a3
{
  CFStringRef commonName = 0;
  CFDataRef v5 = CFDataCreate(kCFAllocatorDefault, byte_100188FC0, dword_100189348);
  if (!v5)
  {
    unsigned __int8 v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000D9604(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    return 0;
  }
  CFDataRef v6 = v5;
  SecCertificateRef v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    int v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000D967C(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    CFRelease(v6);
    return 0;
  }
  SecCertificateRef v8 = v7;
  if (![(MSDSessionBaseTrustEvaluate *)self trustServer:a3 withRootCA:v7 withHostName:0])
  {
    v10 = 0;
LABEL_26:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0);
  if (!CertificateAtIndex)
  {
    v29 = sub_100068600();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000D4660();
    }
    goto LABEL_22;
  }
  if (SecCertificateCopyCommonName(CertificateAtIndex, &commonName))
  {
    v29 = sub_100068600();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000D49C0();
    }
LABEL_22:
    v10 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v10 = (__CFString *)commonName;
  if (([(__CFString *)(id)commonName hasSuffix:@".hubs.iosdm.demounit.net"] & 1) == 0)
  {
    v29 = sub_100068600();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000D4954((uint64_t)v10, v29, v30, v31, v32, v33, v34, v35);
    }
    goto LABEL_25;
  }
  BOOL v11 = 1;
LABEL_8:
  CFRelease(v6);
  CFRelease(v8);

  return v11;
}

- (BOOL)trustServerWithAxinoePKI:(__SecTrust *)a3
{
  CFDataRef v5 = CFDataCreate(kCFAllocatorDefault, byte_100188BB0, dword_100188FBC);
  if (!v5)
  {
    BOOL v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000D96F4(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    return 0;
  }
  CFDataRef v6 = v5;
  SecCertificateRef v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    uint64_t v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000D976C(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    CFRelease(v6);
    return 0;
  }
  SecCertificateRef v8 = v7;
  if ([(MSDSessionBaseTrustEvaluate *)self trustServer:a3 withRootCA:v7 withHostName:@"hub.iosdm.local"])
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = [(MSDSessionBaseTrustEvaluate *)self trustServer:a3 withRootCA:v8 withHostName:@"hub.iosdm.net"];
  }
  CFRelease(v6);
  CFRelease(v8);
  return v9;
}

- (BOOL)trustServer:(__SecTrust *)a3 withRootCA:(__SecCertificate *)a4 withHostName:(id)a5
{
  SecTrustRef trust = 0;
  SecPolicyRef SSL = SecPolicyCreateSSL(1u, (CFStringRef)a5);
  if (SSL)
  {
    SecPolicyRef v8 = SSL;
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFIndex CertificateCount = SecTrustGetCertificateCount(a3);
    if (CertificateCount >= 1)
    {
      CFIndex v11 = CertificateCount;
      for (CFIndex i = 0; i != v11; ++i)
      {
        SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, i);
        CFArrayAppendValue(Mutable, CertificateAtIndex);
      }
    }
    if (SecTrustCreateWithCertificates(Mutable, v8, &trust))
    {
      uint64_t v26 = sub_100068600();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1000D985C(v26, v27, v28, v29, v30, v31, v32, v33);
      }

      BOOL v17 = 0;
      CFArrayRef v14 = 0;
      goto LABEL_24;
    }
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a4, 0);
    CFArrayRef v14 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    OSStatus v15 = SecTrustSetAnchorCertificates(trust, v14);
    if (v15)
    {
      OSStatus v34 = v15;
      uint64_t v35 = sub_100068600();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[MSDSessionBaseTrustEvaluate trustServer:withRootCA:withHostName:]";
        __int16 v43 = 2048;
        uint64_t v44 = v34;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s: Cannot set anchor certificates: %ld", buf, 0x16u);
      }
    }
    else
    {
      SecTrustResultType result = kSecTrustResultInvalid;
      OSStatus v16 = SecTrustEvaluate(trust, &result);
      if (v16)
      {
        int v36 = v16;
        v37 = sub_100068600();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_1000D47EC(v36, v37);
        }
      }
      else if (result == kSecTrustResultUnspecified || result == kSecTrustResultProceed)
      {
        BOOL v17 = 1;
        goto LABEL_24;
      }
    }
    BOOL v17 = 0;
LABEL_24:
    CFRelease(v8);
    if (Mutable) {
      CFRelease(Mutable);
    }
    goto LABEL_26;
  }
  uint64_t v18 = sub_100068600();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1000D97E4(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  BOOL v17 = 0;
  CFArrayRef v14 = 0;
LABEL_26:
  if (trust) {
    CFRelease(trust);
  }

  return v17;
}

- (id)hashForCertificate:(__SecCertificate *)a3
{
  CFDataRef v3 = SecCertificateCopyData(a3);
  if (v3)
  {
    BOOL v4 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x3345E798uLL);
    CFDataRef v5 = v3;
    CC_SHA1([(__CFData *)v5 bytes], (CC_LONG)[(__CFData *)v5 length], v4);
    CFDataRef v6 = +[NSData dataWithBytes:v4 length:20];
    free(v4);
  }
  else
  {
    SecPolicyRef v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D98D4(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    CFDataRef v6 = 0;
  }

  return v6;
}

- (id)identifierFor:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  CFStringRef commonName = 0;
  if (!a4)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v7 = (id)SecCertificateCopyProperties();
    id v25 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v25)
    {
      uint64_t v8 = *(void *)v31;
      uint64_t v23 = *(void *)v31;
      uint64_t v24 = v7;
      do
      {
        for (CFIndex i = 0; i != v25; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v11 = [v10 objectForKey:@"label"];
          unsigned int v12 = [v11 isEqualToString:@"Subject Name"];

          if (v12)
          {
            uint64_t v13 = [v10 objectForKey:@"value"];
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v14 = v13;
            id v15 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v27;
              while (2)
              {
                for (j = 0; j != v16; j = (char *)j + 1)
                {
                  if (*(void *)v27 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
                  uint64_t v20 = [v19 objectForKey:@"label"];
                  unsigned __int8 v21 = [v20 isEqualToString:@"2.5.4.45"];

                  if (v21)
                  {
                    CFDataRef v6 = [v19 objectForKey:@"value"];

                    BOOL v4 = 0;
                    goto LABEL_26;
                  }
                }
                id v16 = [v14 countByEnumeratingWithState:&v26 objects:v35 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }

            uint64_t v8 = v23;
            id v7 = v24;
          }
        }
        id v25 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v25);
    }

    goto LABEL_23;
  }
  if (SecCertificateCopyCommonName(a3, &commonName))
  {
LABEL_23:
    BOOL v4 = 0;
    goto LABEL_24;
  }
  BOOL v4 = (__CFString *)commonName;
  id v5 = [(__CFString *)(id)commonName rangeOfString:@".hubs.iosdm.demounit.net"];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFDataRef v6 = -[__CFString substringWithRange:](v4, "substringWithRange:", 0, v5);
    goto LABEL_26;
  }
LABEL_24:
  CFDataRef v6 = 0;
LABEL_26:

  return v6;
}

- (BOOL)saveHubCertificateIdentifer:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  BOOL v4 = [(MSDSessionBaseTrustEvaluate *)self identifierFor:a3 applePKI:a4];
  BOOL v7 = 0;
  if (v4)
  {
    id v5 = +[MSDTargetDevice sharedInstance];
    unsigned __int8 v6 = [v5 saveHubCertificateIdentifer:v4];

    if (v6) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (BOOL)applePKI
{
  return self->_applePKI;
}

- (void)setApplePKI:(BOOL)a3
{
  self->_applePKI = a3;
}

- (__SecCertificate)leafCertificate
{
  return self->_leafCertificate;
}

- (void)setLeafCertificate:(__SecCertificate *)a3
{
  self->_leafCertificate = a3;
}

@end