@interface NDOBAAManager
- (BOOL)addBAAAuthenticationHeadersToRequest:(id)a3 withBody:(id)a4 error:(id *)a5;
- (BOOL)generateBAACertficate:(id)a3;
- (NSArray)clientCertArray;
- (__SecKey)privateKey;
- (id)_compressCertificates:(id)a3;
- (id)_zlibCompressionForData:(id)a3;
- (id)certificatesEncodeToBase64:(id)a3 status:(id *)a4;
- (id)serializeCertificateChain:(id)a3;
- (id)signDataAndEncodeToBase64:(id)a3 withPrivateKey:(__SecKey *)a4 status:(id *)a5;
- (void)dealloc;
- (void)setClientCertArray:(id)a3;
- (void)setPrivateKey:(__SecKey *)a3;
- (void)writeCertsToDevice:(id)a3;
@end

@implementation NDOBAAManager

- (BOOL)generateBAACertficate:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  int IsSupported = DeviceIdentityIsSupported();
  v6 = _NDOLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "-[NDOBAAManager generateBAACertficate:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = IsSupported;
    _os_log_impl(&dword_23C013000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: deviceIdentitySupported on this device:%d", buf, 0x12u);
  }

  if (IsSupported)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v31 = 0;
    CFErrorRef error = 0;
    SecAccessControlRef v7 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x263F16EA0], 0x40000000uLL, &error);
    if (v7)
    {
      id v8 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v9 = *MEMORY[0x263F39968];
      v29[0] = *MEMORY[0x263F399B8];
      v29[1] = v9;
      uint64_t v10 = *MEMORY[0x263F39958];
      v29[2] = *MEMORY[0x263F39980];
      v29[3] = v10;
      v29[4] = *MEMORY[0x263F39970];
      v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:5];
      v12 = [v8 initWithArray:v11];

      id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v13 setObject:@"com.apple.ndoagent.baaCertificates" forKeyedSubscript:*MEMORY[0x263F39930]];
      [v13 setObject:@"com.apple.ndoagent" forKeyedSubscript:*MEMORY[0x263F39928]];
      [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F39908]];
      [v13 setObject:&unk_26EFA4F48 forKeyedSubscript:*MEMORY[0x263F39940]];
      v14 = [NSNumber numberWithBool:0];
      [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x263F399D0]];

      [v13 setObject:&unk_26EFA4F60 forKeyedSubscript:*MEMORY[0x263F399E0]];
      [v13 setObject:v7 forKeyedSubscript:*MEMORY[0x263F398F8]];
      [v13 setObject:v12 forKeyedSubscript:*MEMORY[0x263F399B0]];
      id v15 = v13;
      id v23 = v3;
      v22 = v4;
      DeviceIdentityIssueClientCertificateWithCompletion();
      dispatch_time_t v16 = dispatch_time(0, 60000000000);
      if (dispatch_semaphore_wait(v22, v16))
      {
        v17 = _NDOLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v25 = 136446466;
          v26 = "-[NDOBAAManager generateBAACertficate:]";
          __int16 v27 = 1024;
          int v28 = 60;
          _os_log_impl(&dword_23C013000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: Installation timed out after %d seconds", v25, 0x12u);
        }
      }
      CFRelease(v7);
      BOOL v18 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    }
    else
    {
      v12 = _NDOLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v20 = [(__CFError *)error description];
        uint64_t v21 = [v20 UTF8String];
        *(_DWORD *)v25 = 136315138;
        v26 = (const char *)v21;
        _os_log_error_impl(&dword_23C013000, v12, OS_LOG_TYPE_ERROR, "Failed to create access control: %s", v25, 0xCu);
      }
      BOOL v18 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

void __39__NDOBAAManager_generateBAACertficate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    if (a2 && v7)
    {
      [*(id *)(a1 + 40) setPrivateKey:a2];
      [*(id *)(a1 + 40) setClientCertArray:v7];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    else if (!a2 || ![v7 count])
    {
      v11 = _NDOLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __39__NDOBAAManager_generateBAACertficate___block_invoke_cold_1(v11, v12, v13);
      }
    }
    uint64_t v14 = *(void *)(a1 + 56);
    if (v14)
    {
      id v15 = [*(id *)(a1 + 40) clientCertArray];
      (*(void (**)(uint64_t, void *, uint64_t, void))(v14 + 16))(v14, v15, [*(id *)(a1 + 40) privateKey], 0);
    }
    goto LABEL_19;
  }
  if ((mobileactivationErrorHasDomainAndErrorCode() & 1) == 0
    && !mobileactivationErrorHasDomainAndErrorCode())
  {
    uint64_t v16 = *(void *)(a1 + 56);
    if (v16) {
      (*(void (**)(uint64_t, void, void, id))(v16 + 16))(v16, 0, 0, v8);
    }
LABEL_19:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    goto LABEL_20;
  }
  uint64_t v9 = _NDOLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    __39__NDOBAAManager_generateBAACertficate___block_invoke_cold_2((uint64_t)v8, v9);
  }

  [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F399D0]];
  long long v17 = *(_OWORD *)(a1 + 56);
  id v10 = (id)v17;
  id v18 = *(id *)(a1 + 48);
  DeviceIdentityIssueClientCertificateWithCompletion();

LABEL_20:
}

void __39__NDOBAAManager_generateBAACertficate___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  if (a2 && v10)
  {
    [*(id *)(a1 + 32) setPrivateKey:a2];
    [*(id *)(a1 + 32) setClientCertArray:v10];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) clientCertArray];
    (*(void (**)(uint64_t, void *, uint64_t, id))(v8 + 16))(v8, v9, [*(id *)(a1 + 32) privateKey], v7);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)addBAAAuthenticationHeadersToRequest:(id)a3 withBody:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NDOBAAManager *)self signDataAndEncodeToBase64:v8 withPrivateKey:[(NDOBAAManager *)self privateKey] status:a5];

  v11 = [(NDOBAAManager *)self clientCertArray];
  uint64_t v12 = [(NDOBAAManager *)self certificatesEncodeToBase64:v11 status:a5];

  [v9 setValue:v10 forHTTPHeaderField:@"X-Apple-Baa-S"];
  [v9 setValue:v12 forHTTPHeaderField:@"X-Apple-Baa"];

  if (v10) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = !v13;
  id v15 = _NDOLogSystem();
  uint64_t v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136446722;
      v19 = "-[NDOBAAManager addBAAAuthenticationHeadersToRequest:withBody:error:]";
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_23C013000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: signatureDataString: %@\n certificateString: %@", (uint8_t *)&v18, 0x20u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[NDOBAAManager addBAAAuthenticationHeadersToRequest:withBody:error:]((uint64_t *)a5, v16);
  }

  return v14;
}

- (id)signDataAndEncodeToBase64:(id)a3 withPrivateKey:(__SecKey *)a4 status:(id *)a5
{
  CFErrorRef error = 0;
  CFDataRef v5 = SecKeyCreateSignature(a4, (SecKeyAlgorithm)*MEMORY[0x263F172E8], (CFDataRef)a3, &error);
  CFDataRef v6 = v5;
  if (v5)
  {
    id v7 = [(__CFData *)v5 base64EncodedStringWithOptions:0];
  }
  else
  {
    if (error)
    {
      id v8 = _NDOLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[NDOBAAManager signDataAndEncodeToBase64:withPrivateKey:status:]((uint64_t *)&error, v8, v9);
      }

      CFRelease(error);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)certificatesEncodeToBase64:(id)a3 status:(id *)a4
{
  CFDataRef v5 = -[NDOBAAManager serializeCertificateChain:](self, "serializeCertificateChain:", a3, a4);
  CFDataRef v6 = [(NDOBAAManager *)self _compressCertificates:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 base64EncodedStringWithOptions:0];
  }
  else
  {
    uint64_t v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NDOBAAManager certificatesEncodeToBase64:status:](v9);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)serializeCertificateChain:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  dispatch_semaphore_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        CFDataRef v10 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v14 + 1) + 8 * v9));
        if ([(__CFData *)v10 length])
        {
          v11 = [(__CFData *)v10 base64EncodedStringWithOptions:0];
          [v4 addObject:v11];
        }
        else
        {
          v11 = _NDOLogSystem();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            [(NDOBAAManager *)v18 serializeCertificateChain:v11];
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[v4 copy];
  return v12;
}

- (void)writeCertsToDevice:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = v3;
  if (v3 && (unint64_t)[v3 count] > 1)
  {
    uint64_t v6 = (__SecCertificate *)[v4 objectAtIndex:0];
    uint64_t v7 = (__SecCertificate *)[v4 objectAtIndex:1];
    id v5 = SecCertificateCopyData(v6);
    CFDataRef v8 = SecCertificateCopyData(v7);
    [v5 writeToFile:@"/tmp/leafCertificate" atomically:1];
    [(__CFData *)v8 writeToFile:@"/tmp/intermediateCertificate" atomically:1];
  }
  else
  {
    id v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[NDOBAAManager writeCertsToDevice:](v5);
    }
  }
}

- (id)_compressCertificates:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = @"certs";
  v13[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v11 = 0;
  uint64_t v6 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:0 error:&v11];
  id v7 = v11;
  if ([v6 length])
  {
    CFDataRef v8 = [(NDOBAAManager *)self _zlibCompressionForData:v6];
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = _NDOLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NDOBAAManager _compressCertificates:](v7, v9);
      }
    }
    CFDataRef v8 = 0;
  }

  return v8;
}

- (id)_zlibCompressionForData:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF990];
  id v4 = a3;
  objc_msgSend(v3, "dataWithLength:", objc_msgSend(v4, "length"));
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (uint8_t *)[v5 bytes];
  size_t v7 = [v4 length];
  id v8 = v4;
  uint64_t v9 = (const uint8_t *)[v8 bytes];
  size_t v10 = [v8 length];

  id v11 = (void *)compression_encode_buffer(v6, v7, v9, v10, 0, COMPRESSION_ZLIB);
  if (v11)
  {
    id v11 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v5, "bytes"), v11, 0);
  }

  return v11;
}

- (void)dealloc
{
  if ([(NDOBAAManager *)self privateKey]) {
    CFRelease([(NDOBAAManager *)self privateKey]);
  }
  v3.receiver = self;
  v3.super_class = (Class)NDOBAAManager;
  [(NDOBAAManager *)&v3 dealloc];
}

- (NSArray)clientCertArray
{
  return self->_clientCertArray;
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

void __39__NDOBAAManager_generateBAACertficate___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136446210;
  id v4 = "-[NDOBAAManager generateBAACertficate:]_block_invoke_2";
  OUTLINED_FUNCTION_0_0(&dword_23C013000, a1, a3, "%{public}s: Failed to get reference key or cert!", (uint8_t *)&v3);
}

void __39__NDOBAAManager_generateBAACertficate___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  int v3 = "-[NDOBAAManager generateBAACertficate:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23C013000, a2, OS_LOG_TYPE_ERROR, "%{public}s: BAA (UCRT) failed due to missing UCRT with error: %@, falling back to BAA (SCRT)", (uint8_t *)&v2, 0x16u);
}

- (void)addBAAAuthenticationHeadersToRequest:(uint64_t *)a1 withBody:(NSObject *)a2 error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136446466;
  __int16 v4 = "-[NDOBAAManager addBAAAuthenticationHeadersToRequest:withBody:error:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_23C013000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to add Baa Headers with error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)signDataAndEncodeToBase64:(uint64_t *)a1 withPrivateKey:(NSObject *)a2 status:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_23C013000, a2, a3, "Unable to sign data and encode with error: %@", (uint8_t *)&v4);
}

- (void)certificatesEncodeToBase64:(os_log_t)log status:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23C013000, log, OS_LOG_TYPE_ERROR, "Unable to sign request", v1, 2u);
}

- (void)serializeCertificateChain:(NSObject *)a3 .cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "-[NDOBAAManager serializeCertificateChain:]";
  OUTLINED_FUNCTION_0_0(&dword_23C013000, a3, (uint64_t)a3, "%{public}s: Found NULL attestation data!!", a1);
}

- (void)writeCertsToDevice:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23C013000, log, OS_LOG_TYPE_DEBUG, "NDOBAAManager: Certificates not present!", v1, 2u);
}

- (void)_compressCertificates:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  int v5 = 138412290;
  uint64_t v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_23C013000, a2, v4, "Unable to create attestation data with error: %@", (uint8_t *)&v5);
}

@end