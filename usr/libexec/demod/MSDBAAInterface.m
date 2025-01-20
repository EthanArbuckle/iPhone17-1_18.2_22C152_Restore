@interface MSDBAAInterface
+ (id)sharedInstance;
- (BOOL)addBAAAuthenticationHeadersToRequest:(id)a3 withBody:(id)a4 error:(id *)a5;
- (BOOL)generateBAACertficate:(id)a3;
- (NSMutableArray)clientCertArray;
- (__SecKey)lockcrypto_extract_public:(id)a3;
- (__SecKey)privateKey;
- (id)certificatesEncodeToBase64:(id)a3 status:(id *)a4;
- (id)serializeCertificateChain:(id)a3;
- (id)signDataAndEncodeToBase64:(id)a3 withPrivateKey:(__SecKey *)a4 status:(id *)a5;
- (void)printAllKeys:(id)a3;
- (void)setClientCertArray:(id)a3;
- (void)setPrivateKey:(__SecKey *)a3;
- (void)writeCertsToDevice:(id)a3;
@end

@implementation MSDBAAInterface

+ (id)sharedInstance
{
  if (qword_100189B58 != -1) {
    dispatch_once(&qword_100189B58, &stru_1001533D0);
  }
  v2 = (void *)qword_100189B50;

  return v2;
}

- (BOOL)generateBAACertficate:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  int IsSupported = DeviceIdentityIsSupported();
  v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v23 = IsSupported;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device identity supported on this device: %d", buf, 8u);
  }

  id v7 = objc_alloc((Class)NSMutableArray);
  v21[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  v21[1] = kMAOptionsBAAOIDDeviceIdentifiers;
  v21[2] = kMAOptionsBAAOIDHardwareProperties;
  v21[3] = kMAOptionsBAAOIDDeviceOSInformation;
  v8 = +[NSArray arrayWithObjects:v21 count:4];
  id v9 = [v7 initWithArray:v8];

  if (IsSupported)
  {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    [v10 setObject:&off_1001621F8 forKey:kMAOptionsBAACACert];
    [v10 setObject:&off_100162210 forKey:kMAOptionsBAANetworkTimeoutInterval];
    [v10 setObject:&off_100162228 forKey:kMAOptionsBAAValidity];
    [v10 setObject:v9 forKey:kMAOptionsBAAOIDSToInclude];
    [v10 setObject:@"DeKOTA-BAA-Cert" forKey:kMAOptionsBAAKeychainLabel];
    id v16 = v3;
    v15 = v4;
    DeviceIdentityIssueClientCertificateWithCompletion();
    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v15, v11))
    {
      v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000D3984(v12);
      }
    }
  }
  BOOL v13 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v13;
}

- (BOOL)addBAAAuthenticationHeadersToRequest:(id)a3 withBody:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MSDBAAInterface *)self signDataAndEncodeToBase64:v9 withPrivateKey:[(MSDBAAInterface *)self privateKey] status:a5];

  dispatch_time_t v11 = [(MSDBAAInterface *)self clientCertArray];
  v12 = [(MSDBAAInterface *)self certificatesEncodeToBase64:v11 status:a5];

  if (v10) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = !v13;
  if (v13)
  {
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000D3A18(v15);
    }
  }
  else
  {
    [v8 setValue:v10 forHTTPHeaderField:@"X-Apple-RM-Signature-Data"];
    [v8 setValue:v12 forHTTPHeaderField:@"X-Apple-RM-Signature-Certificates"];
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v8 allHTTPHeaderFields];
      int v18 = 138543362;
      uint64_t v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Request header with BAA certificate: %{public}@", (uint8_t *)&v18, 0xCu);
    }
  }

  return v14;
}

- (id)signDataAndEncodeToBase64:(id)a3 withPrivateKey:(__SecKey *)a4 status:(id *)a5
{
  CFErrorRef error = 0;
  CFDataRef v5 = SecKeyCreateSignature(a4, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, (CFDataRef)a3, &error);
  CFDataRef v6 = v5;
  if (v5)
  {
    id v7 = [(__CFData *)v5 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)certificatesEncodeToBase64:(id)a3 status:(id *)a4
{
  dispatch_semaphore_t v4 = -[MSDBAAInterface serializeCertificateChain:](self, "serializeCertificateChain:", a3, a4);
  uint64_t v9 = 0;
  CFDataRef v5 = +[NSJSONSerialization dataWithJSONObject:v4 options:0 error:&v9];
  CFDataRef v6 = v5;
  if (v5)
  {
    id v7 = [v5 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)serializeCertificateChain:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        CFDataRef v10 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v14 + 1) + 8 * i));
        dispatch_time_t v11 = -[__CFData base64EncodedStringWithOptions:](v10, "base64EncodedStringWithOptions:", 0, (void)v14);
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];

  return v12;
}

- (void)writeCertsToDevice:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = (__SecCertificate *)[v3 objectAtIndex:0];
  id v5 = (__SecCertificate *)[v3 objectAtIndex:1];

  CFDataRef v7 = SecCertificateCopyData(v4);
  CFDataRef v6 = SecCertificateCopyData(v5);
  [(__CFData *)v7 writeToFile:@"/tmp/leafCertificate" atomically:1];
  [(__CFData *)v6 writeToFile:@"/tmp/intermediateCertificate" atomically:1];
}

- (__SecKey)lockcrypto_extract_public:(id)a3
{
  id v3 = a3;
  SecTrustRef trust = 0;
  if (v3
    && (SecPolicyRef BasicX509 = SecPolicyCreateBasicX509()) != 0
    && !SecTrustCreateWithCertificates(v3, BasicX509, &trust)
    && (SecKeyRef v8 = SecTrustCopyPublicKey(trust)) != 0)
  {
    CFDataRef v6 = v8;
    uint64_t v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000D3B28((uint64_t)v6, v9);
    }

    CFErrorRef v13 = 0;
    CFDataRef v10 = SecKeyCopyExternalRepresentation(v6, &v13);
    id v11 = [objc_alloc((Class)NSString) initWithData:v10 encoding:4];
    id v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000D3AA0((uint64_t)v10, (uint64_t)v11, v12);
    }
  }
  else
  {
    id v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000D3A5C(v5);
    }

    CFDataRef v6 = 0;
  }

  return v6;
}

- (void)printAllKeys:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = v4;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v29;
      uint64_t v9 = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
      uint64_t v10 = kMAOptionsBAAOIDDeviceIdentifiers;
      uint64_t v23 = kMAOptionsBAAOIDHardwareProperties;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          id v12 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v11);
          if (([v12 isEqualToString:v9] & 1) == 0
            && ([v12 isEqualToString:v10] & 1) == 0)
          {
            [v12 isEqualToString:v23];
          }
          CFErrorRef v13 = [v5 objectForKey:v12];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            [(MSDBAAInterface *)self printAllKeys:v13];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = [objc_alloc((Class)NSString) initWithData:v13 encoding:4];
              NSLog(@"Key:%@ val:%@", v12, v14);
            }
            else
            {
              NSLog(@"Key:%@ val:%@", v12, v13);
            }
          }

          id v11 = (char *)v11 + 1;
        }
        while (v7 != v11);
        id v15 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
        id v7 = v15;
      }
      while (v15);
    }

    id v4 = v22;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v16 = v4;
      id v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
            }
            [(MSDBAAInterface *)self printAllKeys:v21];
          }
          id v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v18);
      }
    }
    else
    {
      NSLog(@"object:%@", v4);
    }
  }
}

- (NSMutableArray)clientCertArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClientCertArray:(id)a3
{
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (void).cxx_destruct
{
}

@end