@interface MSDHubTrustEvaluate
+ (id)getTrustObject;
- (BOOL)isHubCertificatePinnedTo:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (BOOL)saveHubCertificateIdentifer:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (BOOL)trustDAServer:(__SecTrust *)a3;
- (BOOL)trustServer:(__SecTrust *)a3 forRequestType:(BOOL)a4 typeOfCommand:(unint64_t)a5;
- (BOOL)trustServer:(__SecTrust *)a3 withRootCA:(__SecCertificate *)a4 withHostName:(id)a5;
- (BOOL)trustServerWithApplePKI:(__SecTrust *)a3;
- (BOOL)trustServerWithAxinoePKI:(__SecTrust *)a3;
- (NSString)hubCertificateIdentifier;
- (id)hashForCertificate:(__SecCertificate *)a3;
- (id)identifierFor:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (void)setHubCertificateIdentifier:(id)a3;
@end

@implementation MSDHubTrustEvaluate

+ (id)getTrustObject
{
  v2 = objc_alloc_init(MSDHubTrustEvaluate);

  return v2;
}

- (BOOL)trustServer:(__SecTrust *)a3 forRequestType:(BOOL)a4 typeOfCommand:(unint64_t)a5
{
  BOOL v6 = a4;
  v9 = +[MSDTargetDevice sharedInstance];
  if (!a5)
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000D4620();
    }

    unsigned __int8 v10 = [(MSDHubTrustEvaluate *)self trustDAServer:a3];
    goto LABEL_13;
  }
  if (!v6)
  {
    BOOL v14 = [(MSDHubTrustEvaluate *)self trustServerWithApplePKI:a3];
    if (v14 || [(MSDHubTrustEvaluate *)self trustServerWithAxinoePKI:a3])
    {
      SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0);
      if (CertificateAtIndex)
      {
        SecCertificateRef v16 = CertificateAtIndex;
        v13 = [v9 certificateHash];
        if (v13) {
          char v17 = v14;
        }
        else {
          char v17 = 1;
        }
        if (v17)
        {
          if (a5 != 3)
          {
            if (a5 == 1
              && ![(MSDHubTrustEvaluate *)self saveHubCertificateIdentifer:v16 applePKI:v14])
            {
              goto LABEL_43;
            }
LABEL_32:
            unsigned __int8 v10 = 1;
            goto LABEL_33;
          }
          if ([(MSDHubTrustEvaluate *)self isHubCertificatePinnedTo:v16 applePKI:v14])
          {
            goto LABEL_32;
          }
          v20 = sub_100068600();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_1000D4694();
          }
        }
        else
        {
          v18 = [(MSDHubTrustEvaluate *)self hashForCertificate:v16];
          unsigned __int8 v19 = [v13 isEqualToData:v18];

          v20 = sub_100068600();
          BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          if (v19)
          {
            if (v21)
            {
              LOWORD(v26) = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Migrating certificate pinning.", (uint8_t *)&v26, 2u);
            }

            if ([(MSDHubTrustEvaluate *)self saveHubCertificateIdentifer:v16 applePKI:0])
            {
              goto LABEL_32;
            }
            v20 = sub_100068600();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_1000D46C8();
            }
          }
          else if (v21)
          {
            v23 = [v13 hexStringRepresentation];
            v24 = [(MSDHubTrustEvaluate *)self hashForCertificate:v16];
            v25 = [v24 hexStringRepresentation];
            int v26 = 138543618;
            v27 = v23;
            __int16 v28 = 2114;
            v29 = v25;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Certificate hash does not match the saved one - Saved:  %{public}@ - Current:  %{public}@", (uint8_t *)&v26, 0x16u);
          }
        }
      }
      else
      {
        v20 = sub_100068600();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_1000D4660();
        }
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
LABEL_43:
    unsigned __int8 v10 = 0;
    goto LABEL_33;
  }
  int v26 = 0;
  unsigned __int8 v10 = 0;
  if (!SecTrustEvaluate(a3, (SecTrustResultType *)&v26)) {
    unsigned __int8 v10 = v26 == 4 || v26 == 1;
  }
LABEL_13:
  v13 = 0;
LABEL_33:

  return v10;
}

- (BOOL)trustDAServer:(__SecTrust *)a3
{
  CFDataRef v4 = CFDataCreate(kCFAllocatorDefault, byte_100188FC0, dword_100189348);
  if (!v4)
  {
    BOOL v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000D46FC(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    return 0;
  }
  CFDataRef v5 = v4;
  SecCertificateRef v6 = SecCertificateCreateWithData(kCFAllocatorDefault, v4);
  if (!v6)
  {
    v22 = sub_100068600();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000D4774(v22, v23, v24, v25, v26, v27, v28, v29);
    }

    CFRelease(v5);
    return 0;
  }
  SecCertificateRef v7 = v6;
  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, 0);
  CFArrayRef v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  OSStatus v9 = SecTrustSetAnchorCertificates(a3, v8);
  if (v9)
  {
    OSStatus v30 = v9;
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[MSDHubTrustEvaluate trustDAServer:]";
      __int16 v35 = 2048;
      uint64_t v36 = v30;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Cannot set demounit anchor certificates: %ld", buf, 0x16u);
    }
    goto LABEL_25;
  }
  SecTrustResultType result = kSecTrustResultInvalid;
  OSStatus v10 = SecTrustEvaluate(a3, &result);
  if (v10)
  {
    int v31 = v10;
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000D47EC(v31, v11);
    }
LABEL_25:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  if (result != kSecTrustResultUnspecified && result != kSecTrustResultProceed)
  {
    BOOL v12 = 0;
    goto LABEL_12;
  }
  v11 = sub_100068600();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Demounit server certificate is valid.", buf, 2u);
  }
  BOOL v12 = 1;
LABEL_10:

LABEL_12:
  CFRelease(v5);
  CFRelease(v7);

  return v12;
}

- (BOOL)trustServerWithApplePKI:(__SecTrust *)a3
{
  CFStringRef commonName = 0;
  CFDataRef v5 = CFDataCreate(kCFAllocatorDefault, byte_100188FC0, dword_100189348);
  if (!v5)
  {
    v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000D4864(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    return 0;
  }
  CFDataRef v6 = v5;
  SecCertificateRef v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    uint64_t v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000D48DC(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    CFRelease(v6);
    return 0;
  }
  SecCertificateRef v8 = v7;
  if (![(MSDHubTrustEvaluate *)self trustServer:a3 withRootCA:v7 withHostName:0])
  {
    OSStatus v10 = 0;
LABEL_26:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0);
  if (!CertificateAtIndex)
  {
    uint64_t v29 = sub_100068600();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000D4660();
    }
    goto LABEL_22;
  }
  if (SecCertificateCopyCommonName(CertificateAtIndex, &commonName))
  {
    uint64_t v29 = sub_100068600();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000D49C0();
    }
LABEL_22:
    OSStatus v10 = 0;
LABEL_25:

    goto LABEL_26;
  }
  OSStatus v10 = (__CFString *)commonName;
  if (([(__CFString *)(id)commonName hasSuffix:@".hubs.iosdm.demounit.net"] & 1) == 0)
  {
    uint64_t v29 = sub_100068600();
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
      sub_1000D49F4(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    return 0;
  }
  CFDataRef v6 = v5;
  SecCertificateRef v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    uint64_t v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000D4A6C(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    CFRelease(v6);
    return 0;
  }
  SecCertificateRef v8 = v7;
  if ([(MSDHubTrustEvaluate *)self trustServer:a3 withRootCA:v7 withHostName:@"hub.iosdm.local"])
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = [(MSDHubTrustEvaluate *)self trustServer:a3 withRootCA:v8 withHostName:@"hub.iosdm.net"];
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
        sub_1000D4B5C(v26, v27, v28, v29, v30, v31, v32, v33);
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
        v42 = "-[MSDHubTrustEvaluate trustServer:withRootCA:withHostName:]";
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
    sub_1000D4AE4(v18, v19, v20, v21, v22, v23, v24, v25);
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
    CFDataRef v4 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xEBA24A03uLL);
    CFDataRef v5 = v3;
    CC_SHA1([(__CFData *)v5 bytes], (CC_LONG)[(__CFData *)v5 length], v4);
    CFDataRef v6 = +[NSData dataWithBytes:v4 length:20];
    free(v4);
  }
  else
  {
    SecPolicyRef v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D4BD4(v8, v9, v10, v11, v12, v13, v14, v15);
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

                    CFDataRef v4 = 0;
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
    CFDataRef v4 = 0;
    goto LABEL_24;
  }
  CFDataRef v4 = (__CFString *)commonName;
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
  id v5 = [(MSDHubTrustEvaluate *)self identifierFor:a3 applePKI:a4];
  if (v5
    && (+[MSDTargetDevice sharedInstance],
        CFDataRef v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 saveHubCertificateIdentifer:v5],
        v6,
        v7))
  {
    [(MSDHubTrustEvaluate *)self setHubCertificateIdentifier:v5];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isHubCertificatePinnedTo:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  id v5 = [(MSDHubTrustEvaluate *)self identifierFor:a3 applePKI:a4];
  if (v5)
  {
    CFDataRef v6 = [(MSDHubTrustEvaluate *)self hubCertificateIdentifier];
    unsigned __int8 v7 = [v6 isEqualToString:v5];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSString)hubCertificateIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHubCertificateIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end