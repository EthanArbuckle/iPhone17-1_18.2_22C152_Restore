@interface POAuthenticationProcess
- (BOOL)validateIdToken:(id)a3 context:(id)a4 key:(__SecKey *)a5;
- (BOOL)validatePartyUInfo:(id)a3 context:(id)a4;
- (BOOL)validatePartyVInfo:(id)a3 context:(id)a4 publicKey:(__SecKey *)a5;
- (BOOL)validateWSTrustMexResponseWithContext:(id)a3 response:(id)a4;
- (BOOL)waitForConnectivity;
- (NSArray)kSupportedLoginResponseAlgorithms;
- (NSOperationQueue)completionQueue;
- (POAuthenticationProcess)init;
- (POWSTrustProcess)wstrustProcess;
- (__SecKey)findKey:(id)a3 inJWKSData:(id)a4 rootCertificates:(id)a5;
- (double)timeoutIntervalForResource;
- (id)createAuthenticationContextUsingLoginConfiguration:(id)a3 deviceConfiguration:(id)a4 userName:(id)a5;
- (id)createEmbeddedAssertionWithContext:(id)a3;
- (id)createEmbeddedPasswordAssertionWithContext:(id)a3;
- (id)createKeyExchangeRequestJWTWithContext:(id)a3 otherPartyPublicKey:(id)a4;
- (id)createKeyExchangeRequestWithContext:(id)a3 jwt:(id)a4;
- (id)createKeyRequestJWTWithContext:(id)a3;
- (id)createKeyRequestWithContext:(id)a3 jwt:(id)a4;
- (id)createLoginJWTWithContext:(id)a3 embeddedAssertion:(id)a4;
- (id)createLoginRequestWithContext:(id)a3 jwt:(id)a4;
- (id)createNonceRequestWithContext:(id)a3;
- (id)createPartyVInfoWithNonce:(id)a3 apvKey:(__SecKey *)a4;
- (id)createPartyVInfoWithNonce:(id)a3 prefixData:(id)a4 apvPublicKey:(__SecKey *)a5;
- (id)createPreAuthenticationRequestWithContext:(id)a3;
- (id)createRefreshJWTWithContext:(id)a3;
- (id)createTestMessagesForLoginConfiguration:(id)a3 certificate:(__SecCertificate *)a4;
- (id)createWSTrust13RequestWithContext:(id)a3;
- (id)createWSTrust2005RequestWithContext:(id)a3;
- (id)createWSTrustMexRequestWithContext:(id)a3;
- (id)findAlgorithmForKey:(__SecKey *)a3;
- (unint64_t)validateWSTrustAuthenticationResponseWithContext:(id)a3 response:(id)a4 returningAssertion:(id *)a5;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
- (void)_performDynamicWSTrustPasswordLoginWithContext:(id)a3 completion:(id)a4;
- (void)_performEmbeddedAssertionLoginUsingContext:(id)a3 completion:(id)a4;
- (void)_performEncryptedPasswordLoginUsingContext:(id)a3 completion:(id)a4;
- (void)_performNonceRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5;
- (void)_performPasswordLoginUsingContext:(id)a3 completion:(id)a4;
- (void)_performWSTrustPasswordLoginWithContext:(id)a3 completion:(id)a4;
- (void)addCryptoHeadersToJWTBody:(id)a3 context:(id)a4;
- (void)extractGroupsAndSubUsingAuthorizationWithContext:(id)a3 tokens:(id)a4 returningGroups:(id *)a5 identifier:(id *)a6 refreshToken:(id *)a7;
- (void)performKeyExchangeRequestUsingContext:(id)a3 otherPartyPublicKeyData:(id)a4 completion:(id)a5;
- (void)performKeyExchangeRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5;
- (void)performKeyRequestUsingContext:(id)a3 completion:(id)a4;
- (void)performKeyRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5;
- (void)performLoginRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5;
- (void)performLoginWithContext:(id)a3 loginJWT:(id)a4 completion:(id)a5;
- (void)performNonceRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5;
- (void)performPasswordLoginUsingContext:(id)a3 completion:(id)a4;
- (void)performPreAuthenticationRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5;
- (void)performSEPKeyLoginUsingContext:(id)a3 completion:(id)a4;
- (void)performSmartCardLoginUsingContext:(id)a3 completion:(id)a4;
- (void)performTokenRefreshUsingContext:(id)a3 completion:(id)a4;
- (void)performWSTrustAuthenticationRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5;
- (void)performWSTrustMexRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5;
- (void)retrieveSigningKeyWithContext:(id)a3 keyId:(id)a4 completion:(id)a5;
- (void)setTimeoutIntervalForResource:(double)a3;
- (void)setWaitForConnectivity:(BOOL)a3;
- (void)setWstrustProcess:(id)a3;
@end

@implementation POAuthenticationProcess

- (POAuthenticationProcess)init
{
  v15[4] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)POAuthenticationProcess;
  v2 = [(POAuthenticationProcess *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_waitForConnectivity = 0;
    v4 = objc_alloc_init(POWSTrustProcess);
    wstrustProcess = v3->_wstrustProcess;
    v3->_wstrustProcess = v4;

    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    completionQueue = v3->_completionQueue;
    v3->_completionQueue = v6;

    [(NSOperationQueue *)v3->_completionQueue setName:@"com.apple.platformSSO.auth"];
    v15[0] = @"ECDH-ES,A256GCM";
    v8 = [NSString stringWithFormat:@"%@,dir", @"HPKE-P256-SHA256-A256GCM"];
    v15[1] = v8;
    v9 = [NSString stringWithFormat:@"%@,dir", @"HPKE-P384-SHA384-A256GCM"];
    v15[2] = v9;
    v10 = [NSString stringWithFormat:@"%@,dir", @"HPKE-X25519-SHA256-ChaCha20Poly1305"];
    v15[3] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];
    kSupportedLoginResponseAlgorithms = v3->_kSupportedLoginResponseAlgorithms;
    v3->_kSupportedLoginResponseAlgorithms = (NSArray *)v11;
  }
  return v3;
}

- (void)performPasswordLoginUsingContext:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = PO_LOG_PODiagnostics();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_INFO, "Starting password authentication", buf, 2u);
  }

  v9 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v6);
  }

  v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v6);
  }

  [v6 setLoginType:1];
  uint64_t v11 = [(POAuthenticationProcess *)self createNonceRequestWithContext:v6];
  if (v11)
  {
    v12 = PO_LOG_PODiagnostics();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v6 requestIdentifier];
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_impl(&dword_259DFE000, v12, OS_LOG_TYPE_DEFAULT, "Sending nonce request: %{public}@", buf, 0xCu);
    }
    objc_super v14 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v6);

    v16 = PO_LOG_POAuthenticationProcess();
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PlatformSSO_NonceRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_27;
    v19[3] = &unk_265463AD0;
    os_signpost_id_t v23 = v15;
    id v20 = v6;
    v21 = self;
    id v22 = v7;
    [(POAuthenticationProcess *)self performNonceRequestWithContext:v20 request:v11 completion:v19];
  }
  else
  {
    id v18 = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, void))v7 + 2))(v7, 2, v6, 0);
  }
}

id __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create nonce request"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_27(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    id v14 = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_2();
    os_signpost_id_t v15 = PO_LOG_POAuthenticationProcess();
    v16 = v15;
    os_signpost_id_t v17 = *(void *)(a1 + 56);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PlatformSSO_NonceRequest", "Failed", buf, 2u);
    }

    id v18 = [*(id *)(a1 + 32) password];
    v19 = (void *)[v18 mutableBytes];
    id v20 = [*(id *)(a1 + 32) password];
    rsize_t v21 = [v20 length];
    id v22 = [*(id *)(a1 + 32) password];
    memset_s(v19, v21, 0, [v22 length]);

    os_signpost_id_t v23 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v23();
  }
  v3 = PO_LOG_POAuthenticationProcess();
  v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_259DFE000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_NonceRequest", "Success", v31, 2u);
  }

  id v6 = [*(id *)(a1 + 32) loginConfiguration];
  uint64_t v7 = [v6 federationType];

  if (v7 == 2) {
    return [*(id *)(a1 + 40) _performDynamicWSTrustPasswordLoginWithContext:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
  }
  if (v7 == 1)
  {
    [*(id *)(a1 + 32) setFederated:1];
    v24 = [*(id *)(a1 + 32) loginConfiguration];
    v25 = [v24 federationMexURL];
    [*(id *)(a1 + 32) setWsTrustFederationMexURL:v25];

    return [*(id *)(a1 + 40) _performWSTrustPasswordLoginWithContext:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
  }
  if (v7)
  {
    id v26 = [*(id *)(a1 + 32) password];
    v27 = (void *)[v26 mutableBytes];
    v28 = [*(id *)(a1 + 32) password];
    rsize_t v29 = [v28 length];
    v30 = [*(id *)(a1 + 32) password];
    memset_s(v27, v29, 0, [v30 length]);

    os_signpost_id_t v23 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v23();
  }
  v8 = [*(id *)(a1 + 32) loginConfiguration];
  uint64_t v9 = [v8 loginRequestEncryptionPublicKey];

  uint64_t v11 = *(void *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  if (v9) {
    return [v10 _performEncryptedPasswordLoginUsingContext:v11 completion:v12];
  }
  else {
    return [v10 _performPasswordLoginUsingContext:v11 completion:v12];
  }
}

id __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to retrieve nonce."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)performSmartCardLoginUsingContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setLoginType:3];
  [(POAuthenticationProcess *)self _performEmbeddedAssertionLoginUsingContext:v7 completion:v6];
}

- (void)performSEPKeyLoginUsingContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setLoginType:2];
  [(POAuthenticationProcess *)self _performEmbeddedAssertionLoginUsingContext:v7 completion:v6];
}

- (void)_performEmbeddedAssertionLoginUsingContext:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = PO_LOG_PODiagnostics();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_INFO, "Starting embedded assertion authentication", buf, 2u);
  }

  uint64_t v9 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v6);
  }

  v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v6);
  }

  uint64_t v11 = [(POAuthenticationProcess *)self createNonceRequestWithContext:v6];
  if (v11)
  {
    uint64_t v12 = PO_LOG_PODiagnostics();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v6 requestIdentifier];
      *(_DWORD *)buf = 138543362;
      v25 = v13;
      _os_log_impl(&dword_259DFE000, v12, OS_LOG_TYPE_DEFAULT, "Sending nonce request: %{public}@", buf, 0xCu);
    }
    id v14 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v6);

    v16 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PlatformSSO_NonceRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_39;
    v19[3] = &unk_265463AF8;
    os_signpost_id_t v23 = v15;
    id v22 = v7;
    id v20 = v6;
    rsize_t v21 = self;
    [(POAuthenticationProcess *)self performNonceRequestWithContext:v20 request:v11 completion:v19];
  }
  else
  {
    id v18 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, void))v7 + 2))(v7, 2, v6, 0);
  }
}

id __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create nonce request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

void __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_39(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = PO_LOG_POAuthenticationProcess();
    v4 = v3;
    os_signpost_id_t v5 = *(void *)(a1 + 56);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_NonceRequest", "Success", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 40) createEmbeddedAssertionWithContext:*(void *)(a1 + 32)];
    if (!v6)
    {
      id v18 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_42();
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_28:

      return;
    }
    uint64_t v7 = [*(id *)(a1 + 32) loginType];
    v8 = *(void **)(a1 + 32);
    if (v7 == 3)
    {
      uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "findAlgorithmForKey:", objc_msgSend(v8, "embeddedAssertionSigningKey"));
      uint64_t v10 = [*(id *)(a1 + 32) embeddedAssertionSigningKey];
      uint64_t v11 = [*(id *)(a1 + 32) embeddedAssertionCertificate];
      id v30 = 0;
      uint64_t v12 = +[POJWTSigning encodeAndSignJWT:v6 algorithm:v9 key:v10 certificate:v11 error:&v30];
      id v13 = v30;
      if (v12)
      {

LABEL_15:
        id v22 = [*(id *)(a1 + 40) createLoginJWTWithContext:*(void *)(a1 + 32) embeddedAssertion:v12];
        if (v22)
        {
          [*(id *)(a1 + 40) performLoginWithContext:*(void *)(a1 + 32) loginJWT:v22 completion:*(void *)(a1 + 48)];
        }
        else
        {
          id v23 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_61();
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }

        goto LABEL_27;
      }
      id v24 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_49();
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_27:
      goto LABEL_28;
    }
    v19 = [v8 userSepSigningAlgorithm];
    uint64_t v20 = [*(id *)(a1 + 32) embeddedAssertionSigningKey];
    uint64_t v21 = [*(id *)(a1 + 32) embeddedAssertionCertificate];
    id v29 = 0;
    uint64_t v12 = +[POJWTSigning encodeAndSignJWT:v6 signingAlgorithm:v19 key:v20 certificate:v21 error:&v29];
    id v13 = v29;

    if (v12) {
      goto LABEL_15;
    }
    id v25 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_55();
    if ([*(id *)(a1 + 32) loginType] == 2)
    {
      uint64_t v26 = [*(id *)(a1 + 32) deviceConfiguration];
      if ([v26 sharedDeviceKeys])
      {
        uint64_t v27 = [v13 code];

        if (v27 == -1010)
        {
          v28 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_26:
          v28();
          goto LABEL_27;
        }
      }
      else
      {
      }
    }
    v28 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_26;
  }
  id v14 = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_2();
  os_signpost_id_t v15 = PO_LOG_POAuthenticationProcess();
  v16 = v15;
  os_signpost_id_t v17 = *(void *)(a1 + 56);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_259DFE000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PlatformSSO_NonceRequest", "Failed", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_42()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create embedded assertion JWT."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_49()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to sign embedded SmartCard assertion."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_55()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to sign embedded assertion."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_61()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create login JWT."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)findAlgorithmForKey:(__SecKey *)a3
{
  CFDictionaryRef v4 = SecKeyCopyAttributes(a3);
  os_signpost_id_t v5 = [(__CFDictionary *)v4 objectForKeyedSubscript:*MEMORY[0x263F16F68]];
  if (![v5 isEqualToString:*MEMORY[0x263F16F80]])
  {
    v8 = [(__CFDictionary *)v4 objectForKeyedSubscript:*MEMORY[0x263F16FA8]];
    uint64_t v9 = [(__CFDictionary *)v4 objectForKeyedSubscript:*MEMORY[0x263F16F98]];
    if ([v8 isEqualToString:*MEMORY[0x263F16FB0]]) {
      int v10 = 1;
    }
    else {
      int v10 = [v8 isEqualToString:*MEMORY[0x263F16FB8]];
    }
    int v11 = [v8 isEqualToString:*MEMORY[0x263F16FE0]];
    char v12 = [v8 isEqualToString:*MEMORY[0x263F16FD0]];
    if (v10)
    {
      int v13 = [v9 intValue];
      switch(v13)
      {
        case 521:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x263F172D0]))
          {
            uint64_t v7 = @"ES512";
            goto LABEL_22;
          }
          id v17 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_90();
          goto LABEL_21;
        case 384:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x263F172C8]))
          {
            uint64_t v7 = @"ES384";
            goto LABEL_22;
          }
          id v18 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_81();
          goto LABEL_21;
        case 256:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x263F172C0]))
          {
            uint64_t v7 = @"ES256";
LABEL_22:

            goto LABEL_23;
          }
          id v19 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_72();
          goto LABEL_21;
      }
    }
    else if (v11)
    {
      int v14 = [v9 intValue];
      switch(v14)
      {
        case 4096:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x263F17380]))
          {
            uint64_t v7 = @"RS512";
            goto LABEL_22;
          }
          id v21 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_114();
          goto LABEL_21;
        case 3072:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x263F17378]))
          {
            uint64_t v7 = @"RS384";
            goto LABEL_22;
          }
          id v22 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_105();
          goto LABEL_21;
        case 2048:
          if (SecKeyIsAlgorithmSupported(a3, kSecKeyOperationTypeSign, (SecKeyAlgorithm)*MEMORY[0x263F17370]))
          {
            uint64_t v7 = @"RS256";
            goto LABEL_22;
          }
          id v20 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_96();
LABEL_21:
          uint64_t v7 = 0;
          goto LABEL_22;
      }
    }
    else if (v12)
    {
      uint64_t v7 = @"EdDSA";
      goto LABEL_22;
    }
    id v15 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_123();
    goto LABEL_21;
  }
  id v6 = __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke();
  uint64_t v7 = 0;
LABEL_23:

  return v7;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Invalid key for signing."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_72()
{
  v0 = +[POError errorWithCode:-1001 description:@"256 bit key does not support signing."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_81()
{
  v0 = +[POError errorWithCode:-1001 description:@"384 bit key does not support signing."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_90()
{
  v0 = +[POError errorWithCode:-1001 description:@"521 bit key does not support signing."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_96()
{
  v0 = +[POError errorWithCode:-1001 description:@"Key does not support SHA256 signing."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_105()
{
  v0 = +[POError errorWithCode:-1001 description:@"Key does not support SHA384 signing."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_114()
{
  v0 = +[POError errorWithCode:-1001 description:@"Key does not support SHA512 signing."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __47__POAuthenticationProcess_findAlgorithmForKey___block_invoke_123()
{
  v0 = +[POError errorWithCode:-1001 description:@"No supported algorithms for key"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)performTokenRefreshUsingContext:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = PO_LOG_PODiagnostics();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_INFO, "Starting refresh", buf, 2u);
  }

  uint64_t v9 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v6);
  }

  int v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v6);
  }

  [v6 setLoginType:100];
  int v11 = [(POAuthenticationProcess *)self createNonceRequestWithContext:v6];
  if (v11)
  {
    char v12 = PO_LOG_PODiagnostics();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v6 requestIdentifier];
      *(_DWORD *)buf = 138543362;
      id v25 = v13;
      _os_log_impl(&dword_259DFE000, v12, OS_LOG_TYPE_DEFAULT, "Sending nonce request: %{public}@", buf, 0xCu);
    }
    int v14 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v6);

    v16 = PO_LOG_POAuthenticationProcess();
    id v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PlatformSSO_NonceRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_131;
    v19[3] = &unk_265463AD0;
    os_signpost_id_t v23 = v15;
    id v20 = v6;
    id v21 = self;
    id v22 = v7;
    [(POAuthenticationProcess *)self performNonceRequestWithContext:v20 request:v11 completion:v19];
  }
  else
  {
    id v18 = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, void))v7 + 2))(v7, 2, v6, 0);
  }
}

void __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_131(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = PO_LOG_POAuthenticationProcess();
    CFDictionaryRef v4 = v3;
    os_signpost_id_t v5 = *(void *)(a1 + 56);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)id v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_NonceRequest", "Success", v17, 2u);
    }

    id v6 = [*(id *)(a1 + 40) createRefreshJWTWithContext:*(void *)(a1 + 32)];
    if (v6)
    {
      [*(id *)(a1 + 40) performLoginWithContext:*(void *)(a1 + 32) loginJWT:v6 completion:*(void *)(a1 + 48)];
    }
    else
    {
      id v16 = __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_137();
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    id v7 = __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_2();
    v8 = PO_LOG_POAuthenticationProcess();
    uint64_t v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 56);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PlatformSSO_NonceRequest", "Failed", buf, 2u);
    }

    id v11 = [*(id *)(a1 + 32) password];
    char v12 = (void *)[v11 mutableBytes];
    int v13 = [*(id *)(a1 + 32) password];
    rsize_t v14 = [v13 length];
    os_signpost_id_t v15 = [*(id *)(a1 + 32) password];
    memset_s(v12, v14, 0, [v15 length]);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to retrieve nonce"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __70__POAuthenticationProcess_performTokenRefreshUsingContext_completion___block_invoke_137()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create refresh JWT."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)_performDynamicWSTrustPasswordLoginWithContext:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(POAuthenticationProcess *)self createPreAuthenticationRequestWithContext:v6];
  if (v8)
  {
    uint64_t v9 = PO_LOG_PODiagnostics();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v10 = [v6 requestIdentifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v10;
      _os_log_impl(&dword_259DFE000, v9, OS_LOG_TYPE_DEFAULT, "Sending preauthentication request: %{public}@", buf, 0xCu);
    }
    id v11 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v6);

    int v13 = PO_LOG_POAuthenticationProcess();
    rsize_t v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PlatformSSO_PreauthenticationRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke_148;
    v21[3] = &unk_265463AD0;
    os_signpost_id_t v25 = v12;
    id v22 = v6;
    os_signpost_id_t v23 = self;
    id v24 = v7;
    [(POAuthenticationProcess *)self performPreAuthenticationRequestWithContext:v22 request:v8 completion:v21];
  }
  else
  {
    id v15 = __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke();
    id v16 = [v6 password];
    id v17 = (void *)[v16 mutableBytes];
    id v18 = [v6 password];
    rsize_t v19 = [v18 length];
    id v20 = [v6 password];
    memset_s(v17, v19, 0, [v20 length]);

    (*((void (**)(id, uint64_t, id, void))v7 + 2))(v7, 2, v6, 0);
  }
}

id __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create preauthentication request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke_148(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = PO_LOG_POAuthenticationProcess();
    CFDictionaryRef v4 = v3;
    os_signpost_id_t v5 = *(void *)(a1 + 56);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_PreauthenticationRequest", "Success", buf, 2u);
    }

    int v6 = [*(id *)(a1 + 32) federated];
    id v7 = PO_LOG_PODiagnostics();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl(&dword_259DFE000, v7, OS_LOG_TYPE_INFO, "User is federated", v20, 2u);
      }

      return [*(id *)(a1 + 40) _performWSTrustPasswordLoginWithContext:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
    else
    {
      if (v8)
      {
        *(_WORD *)rsize_t v19 = 0;
        _os_log_impl(&dword_259DFE000, v7, OS_LOG_TYPE_INFO, "User is NOT federated", v19, 2u);
      }

      return [*(id *)(a1 + 40) _performPasswordLoginUsingContext:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
  }
  else
  {
    id v10 = __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke_2();
    id v11 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v12 = v11;
    os_signpost_id_t v13 = *(void *)(a1 + 56);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)id v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PlatformSSO_PreauthenticationRequest", "Failed", v22, 2u);
    }

    id v14 = [*(id *)(a1 + 32) password];
    id v15 = (void *)[v14 mutableBytes];
    id v16 = [*(id *)(a1 + 32) password];
    rsize_t v17 = [v16 length];
    id v18 = [*(id *)(a1 + 32) password];
    memset_s(v15, v17, 0, [v18 length]);

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __85__POAuthenticationProcess__performDynamicWSTrustPasswordLoginWithContext_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to retrieve preauthentication data."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)_performWSTrustPasswordLoginWithContext:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(POAuthenticationProcess *)self createWSTrustMexRequestWithContext:v6];
  if (v8)
  {
    uint64_t v9 = PO_LOG_PODiagnostics();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 requestIdentifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v10;
      _os_log_impl(&dword_259DFE000, v9, OS_LOG_TYPE_DEFAULT, "Sending mex request: %{public}@", buf, 0xCu);
    }
    id v11 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v6);

    os_signpost_id_t v13 = PO_LOG_POAuthenticationProcess();
    id v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PlatformSSO_WSTrustMexRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_159;
    v21[3] = &unk_265463AD0;
    os_signpost_id_t v25 = v12;
    id v22 = v6;
    os_signpost_id_t v23 = self;
    id v24 = v7;
    [(POAuthenticationProcess *)self performWSTrustMexRequestWithContext:v22 request:v8 completion:v21];
  }
  else
  {
    id v15 = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke();
    id v16 = [v6 password];
    rsize_t v17 = (void *)[v16 mutableBytes];
    id v18 = [v6 password];
    rsize_t v19 = [v18 length];
    id v20 = [v6 password];
    memset_s(v17, v19, 0, [v20 length]);

    (*((void (**)(id, uint64_t, id, void))v7 + 2))(v7, 2, v6, 0);
  }
}

id __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create mex request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

void __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_159(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (a2 != 1)
  {
    id v8 = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_2();
    uint64_t v9 = PO_LOG_POAuthenticationProcess();
    id v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 56);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_WSTrustMexRequest", "Failed", buf, 2u);
    }

    id v12 = [*(id *)(a1 + 32) password];
    os_signpost_id_t v13 = (void *)[v12 mutableBytes];
    id v14 = [*(id *)(a1 + 32) password];
    rsize_t v15 = [v14 length];
    id v16 = [*(id *)(a1 + 32) password];
    memset_s(v13, v15, 0, [v16 length]);

    rsize_t v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_25;
  }
  v3 = PO_LOG_POAuthenticationProcess();
  CFDictionaryRef v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_259DFE000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_WSTrustMexRequest", "Success", buf, 2u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) wsTrustVersion];
  switch(v6)
  {
    case 0:
      id v18 = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_165();
      id v19 = [*(id *)(a1 + 32) password];
      id v20 = (void *)[v19 mutableBytes];
      id v21 = [*(id *)(a1 + 32) password];
      rsize_t v22 = [v21 length];
      os_signpost_id_t v23 = [*(id *)(a1 + 32) password];
      memset_s(v20, v22, 0, [v23 length]);

      rsize_t v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_25:
      v17();
      return;
    case 2:
      uint64_t v7 = [*(id *)(a1 + 40) createWSTrust2005RequestWithContext:*(void *)(a1 + 32)];
      goto LABEL_15;
    case 1:
      uint64_t v7 = [*(id *)(a1 + 40) createWSTrust13RequestWithContext:*(void *)(a1 + 32)];
LABEL_15:
      id v24 = (void *)v7;
      goto LABEL_17;
  }
  id v24 = 0;
LABEL_17:
  id v25 = [*(id *)(a1 + 32) password];
  uint64_t v26 = (void *)[v25 mutableBytes];
  uint64_t v27 = [*(id *)(a1 + 32) password];
  rsize_t v28 = [v27 length];
  id v29 = [*(id *)(a1 + 32) password];
  memset_s(v26, v28, 0, [v29 length]);

  [*(id *)(a1 + 32) setPassword:0];
  if (!v24)
  {
    id v39 = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_171();
    rsize_t v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_25;
  }
  id v30 = PO_LOG_PODiagnostics();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [*(id *)(a1 + 32) requestIdentifier];
    *(_DWORD *)buf = 138543362;
    v44 = v31;
    _os_log_impl(&dword_259DFE000, v30, OS_LOG_TYPE_DEFAULT, "Sending WSTrust request: %{public}@", buf, 0xCu);
  }
  v32 = PO_LOG_POAuthenticationProcess();
  os_signpost_id_t v33 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));

  v34 = PO_LOG_POAuthenticationProcess();
  v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_259DFE000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "PlatformSSO_WSTrustRequest", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v37 = *(void *)(a1 + 32);
  v36 = *(void **)(a1 + 40);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_177;
  v40[3] = &unk_265463B20;
  os_signpost_id_t v42 = v33;
  id v38 = *(id *)(a1 + 48);
  v40[4] = *(void *)(a1 + 40);
  id v41 = v38;
  [v36 performWSTrustAuthenticationRequestWithContext:v37 request:v24 completion:v40];
}

id __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to retrieve mex data"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_165()
{
  v0 = +[POError errorWithCode:-1001 description:@"federated idp does not support WSTrust 1.3 or 2005."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_171()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create WSTrust request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

void __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_177(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a2 == 1 && [v8 length])
  {
    id v10 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v11 = v10;
    os_signpost_id_t v12 = *(void *)(a1 + 48);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)id v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PlatformSSO_WSTrustRequest", "Success", v20, 2u);
    }

    os_signpost_id_t v13 = [v9 base64EncodedStringWithOptions:0];
    id v14 = [*(id *)(a1 + 32) createLoginJWTWithContext:v7 embeddedAssertion:v13];
    if (v14)
    {
      [*(id *)(a1 + 32) performLoginWithContext:v7 loginJWT:v14 completion:*(void *)(a1 + 40)];
    }
    else
    {
      id v19 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_61();
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v15 = __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_2_178();
    id v16 = PO_LOG_POAuthenticationProcess();
    rsize_t v17 = v16;
    os_signpost_id_t v18 = *(void *)(a1 + 48);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PlatformSSO_WSTrustRequest", "Failed", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __78__POAuthenticationProcess__performWSTrustPasswordLoginWithContext_completion___block_invoke_2_178()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to retrieve WSTrust response."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)_performEncryptedPasswordLoginUsingContext:(id)a3 completion:(id)a4
{
  v70[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id, void))a4;
  id v8 = [v6 loginConfiguration];
  uint64_t v9 = [v8 loginRequestEncryptionPublicKey];

  if (v9)
  {
    id v10 = [(POAuthenticationProcess *)self createEmbeddedPasswordAssertionWithContext:v6];
    if (v10)
    {
      id v11 = [v6 password];
      os_signpost_id_t v12 = (void *)[v11 mutableBytes];
      os_signpost_id_t v13 = [v6 password];
      rsize_t v14 = [v13 length];
      id v15 = [v6 password];
      memset_s(v12, v14, 0, [v15 length]);

      [v6 setPassword:0];
      id v16 = [v6 loginConfiguration];
      rsize_t v17 = [v16 loginRequestEncryptionAlgorithm];
      LODWORD(v13) = [v17 isEqualToNumber:0x2707DBB50];

      v62 = v7;
      v58 = self;
      if (v13)
      {
        os_signpost_id_t v18 = [v6 serverNonce];
        id v19 = [v18 dataUsingEncoding:4];
        id v20 = [v6 loginConfiguration];
        id v21 = [v20 loginRequestEncryptionAPVPrefix];
        rsize_t v22 = [v6 loginConfiguration];
        uint64_t v23 = -[POAuthenticationProcess createPartyVInfoWithNonce:prefixData:apvPublicKey:](self, "createPartyVInfoWithNonce:prefixData:apvPublicKey:", v19, v21, [v22 loginRequestEncryptionPublicKey]);

        id v24 = [v10 header];
        v63 = (void *)v23;
        [v24 setApv:v23];
      }
      else
      {
        uint64_t v27 = [v6 loginConfiguration];
        rsize_t v28 = [v27 serverNonceClaimName];
        uint64_t v29 = [v28 length];

        id v30 = [v10 header];
        if (v29)
        {
          v31 = [v6 loginConfiguration];
          v32 = [v31 serverNonceClaimName];
          v69 = v32;
          os_signpost_id_t v33 = [v6 serverNonce];
          v70[0] = v33;
          v34 = [NSDictionary dictionaryWithObjects:v70 forKeys:&v69 count:1];
          [v30 addCustomClaims:v34];
        }
        else
        {
          v67 = @"request_nonce";
          v31 = [v6 serverNonce];
          v68 = v31;
          v32 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
          [v30 addCustomClaims:v32];
        }

        v63 = [v6 serverNonce];
      }
      v35 = v10;
      v60 = [v6 loginConfiguration];
      v36 = [v60 loginRequestEncryptionAlgorithm];
      uint64_t v37 = [v6 loginConfiguration];
      uint64_t v38 = [v37 loginRequestEncryptionPublicKey];
      id v39 = [v6 loginConfiguration];
      v40 = [v39 loginRequestHpkePsk];
      id v41 = [v6 loginConfiguration];
      os_signpost_id_t v42 = objc_msgSend(v41, "loginRequestHpkePsk_id");
      id v66 = 0;
      uint64_t v43 = +[POJWTEncryption encodeAndEncryptJWT:v35 encryptionAlgorithm:v36 publicKey:v38 otherInfo:v63 psk:v40 psk_id:v42 authPrivateKey:0 auth_kid:0 error:&v66];
      id v59 = v66;

      v44 = [v35 body];
      id v45 = [v44 password];
      v46 = (void *)[v45 mutableBytes];
      v47 = [v35 body];
      v48 = [v47 password];
      rsize_t v49 = [v48 length];
      v61 = v35;
      v50 = v35;
      v51 = (void *)v43;
      v52 = [v50 body];
      v53 = [v52 password];
      memset_s(v46, v49, 0, [v53 length]);

      if (v51)
      {
        v54 = v59;
        v55 = [(POAuthenticationProcess *)v58 createLoginJWTWithContext:v6 embeddedAssertion:v51];
        id v7 = v62;
        if (v55)
        {
          [(POAuthenticationProcess *)v58 performLoginWithContext:v6 loginJWT:v55 completion:v62];
        }
        else
        {
          id v57 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_61();
          v62[2](v62, 2, v6, 0);
        }
      }
      else
      {
        v64[0] = MEMORY[0x263EF8330];
        v64[1] = 3221225472;
        v64[2] = __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke_204;
        v64[3] = &unk_265463860;
        v54 = v59;
        id v65 = v59;
        id v56 = __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke_204((uint64_t)v64);
        id v7 = v62;
        v62[2](v62, 2, v6, 0);
        v55 = v65;
      }
      id v10 = v61;
    }
    else
    {
      id v26 = __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke_193();
      v7[2](v7, 2, v6, 0);
    }
  }
  else
  {
    id v25 = __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke();
    v7[2](v7, 2, v6, 0);
  }
}

id __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Missing encryption public key."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke_193()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create embedded password assertion JWT."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __81__POAuthenticationProcess__performEncryptedPasswordLoginUsingContext_completion___block_invoke_204(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to encrypt embedded assertion."];
  v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (void)_performPasswordLoginUsingContext:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = (void (**)(id, uint64_t, id, void))a4;
  id v7 = [(POAuthenticationProcess *)self createLoginJWTWithContext:v14 embeddedAssertion:0];
  id v8 = [v14 password];
  uint64_t v9 = (void *)[v8 mutableBytes];
  id v10 = [v14 password];
  rsize_t v11 = [v10 length];
  os_signpost_id_t v12 = [v14 password];
  memset_s(v9, v11, 0, [v12 length]);

  [v14 setPassword:0];
  if (v7)
  {
    [(POAuthenticationProcess *)self performLoginWithContext:v14 loginJWT:v7 completion:v6];
  }
  else
  {
    id v13 = __81__POAuthenticationProcess__performEmbeddedAssertionLoginUsingContext_completion___block_invoke_61();
    v6[2](v6, 2, v14, 0);
  }
}

- (id)createPreAuthenticationRequestWithContext:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F08BA0]);
  os_signpost_id_t v5 = [v3 loginConfiguration];
  id v6 = [v5 federationUserPreauthenticationURL];
  id v7 = (void *)[v4 initWithURL:v6 resolvingAgainstBaseURL:0];

  id v8 = (void *)MEMORY[0x263F08BD0];
  uint64_t v9 = [v3 userName];
  id v10 = [v8 queryItemWithName:@"user" value:v9];
  v30[0] = v10;
  rsize_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];

  os_signpost_id_t v12 = [v3 loginConfiguration];
  id v13 = [v12 customFederationUserPreauthenticationRequestValues];

  if (v13)
  {
    id v14 = [v3 loginConfiguration];
    id v15 = [v14 customFederationUserPreauthenticationRequestValues];
    uint64_t v16 = [v11 arrayByAddingObjectsFromArray:v15];

    rsize_t v11 = (void *)v16;
  }
  rsize_t v17 = [v7 queryItems];

  if (v17)
  {
    os_signpost_id_t v18 = [v7 queryItems];
    id v19 = [v18 arrayByAddingObjectsFromArray:v11];
    [v7 setQueryItems:v19];
  }
  else
  {
    [v7 setQueryItems:v11];
  }
  id v20 = objc_alloc(MEMORY[0x263F089E0]);
  id v21 = [v7 URL];
  rsize_t v22 = (void *)[v20 initWithURL:v21 cachePolicy:4 timeoutInterval:30.0];

  [v22 setHTTPMethod:@"GET"];
  [v22 addValue:@"application/json" forHTTPHeaderField:@"Accept"];
  uint64_t v23 = [v3 requestIdentifier];
  [v22 addValue:v23 forHTTPHeaderField:@"client-request-id"];

  id v24 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess createPreAuthenticationRequestWithContext:]();
  }

  id v25 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = [v3 requestIdentifier];
    int v28 = 138543362;
    uint64_t v29 = v26;
    _os_log_impl(&dword_259DFE000, v25, OS_LOG_TYPE_INFO, "Preauthentication request: %{public}@", (uint8_t *)&v28, 0xCu);
  }
  return v22;
}

- (void)performPreAuthenticationRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  rsize_t v11 = [v8 urlSession];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke;
  id v21 = &unk_265463B70;
  id v23 = v8;
  id v24 = v9;
  rsize_t v22 = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = [v11 dataTaskWithRequest:v10 completionHandler:&v18];

  id v15 = NSString;
  uint64_t v16 = [v12 requestIdentifier];
  rsize_t v17 = [v15 stringWithFormat:@"Preauthentication Request: %@", v16, v18, v19, v20, v21, v22];
  [v14 setTaskDescription:v17];

  [v14 resume];
}

void __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_INFO, "Preauthentication response received", buf, 2u);
  }

  if (v9)
  {
    if (v7) {
      rsize_t v11 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    }
    else {
      rsize_t v11 = 0;
    }
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231;
    v66[3] = &unk_265463A00;
    id v67 = v9;
    id v68 = v11;
    id v12 = v11;
    id v16 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231((uint64_t)v66);
    rsize_t v17 = [a1[4] completionQueue];
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_235;
    v64[3] = &unk_265463B48;
    id v65 = a1[6];
    [v17 addOperationWithBlock:v64];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v8;
      if ([v12 statusCode] >= 200 && objc_msgSend(v12, "statusCode") < 300)
      {
        id v20 = PO_LOG_POAuthenticationProcess();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_cold_1();
        }

        id v54 = 0;
        id v21 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:16 error:&v54];
        id v22 = v54;
        id v15 = v22;
        if (!v21 || v22)
        {
          v52[0] = MEMORY[0x263EF8330];
          v52[1] = 3221225472;
          v52[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_251;
          v52[3] = &unk_265463860;
          v36 = &v53;
          id v53 = v22;
          id v38 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_251((uint64_t)v52);
          id v39 = [a1[4] completionQueue];
          v50[0] = MEMORY[0x263EF8330];
          v50[1] = 3221225472;
          v50[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_255;
          v50[3] = &unk_265463B48;
          id v51 = a1[6];
          [v39 addOperationWithBlock:v50];

          v35 = v51;
        }
        else
        {
          id v23 = (void *)MEMORY[0x263F08A98];
          id v24 = [a1[5] loginConfiguration];
          id v25 = [v24 federationPredicate];
          id v26 = [v23 predicateWithFormat:v25];

          uint64_t v27 = [v26 evaluateWithObject:v21];
          [a1[5] setFederated:v27];
          [a1[5] setWsTrustFederationMexURL:0];
          if ([a1[5] federated])
          {
            int v28 = [a1[5] loginConfiguration];
            uint64_t v29 = [v28 federationMexURLKeypath];

            if (!v29) {
              goto LABEL_20;
            }
            id v30 = [a1[5] loginConfiguration];
            v31 = [v30 federationMexURLKeypath];
            v32 = [v21 valueForKeyPath:v31];

            if (!v32)
            {
LABEL_20:
              v32 = [v21 objectForKeyedSubscript:@"federation_metadata_url"];
            }
            if ([v32 length])
            {
              os_signpost_id_t v33 = [NSURL URLWithString:v32];
              [a1[5] setWsTrustFederationMexURL:v33];
            }
          }
          if (![a1[5] federated]
            || [a1[5] federated]
            && ([a1[5] wsTrustFederationMexURL],
                v34 = objc_claimAutoreleasedReturnValue(),
                v34,
                v34))
          {
            v35 = [a1[4] completionQueue];
            uint64_t v45 = MEMORY[0x263EF8330];
            uint64_t v46 = 3221225472;
            v47 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_265;
            v48 = &unk_265463B48;
            v36 = &v49;
            id v49 = a1[6];
            uint64_t v37 = &v45;
          }
          else
          {
            v35 = [a1[4] completionQueue];
            uint64_t v40 = MEMORY[0x263EF8330];
            uint64_t v41 = 3221225472;
            os_signpost_id_t v42 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_266;
            uint64_t v43 = &unk_265463B48;
            v36 = &v44;
            id v44 = a1[6];
            uint64_t v37 = &v40;
          }
          objc_msgSend(v35, "addOperationWithBlock:", v37, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49);
        }
      }
      else
      {
        uint64_t v57 = MEMORY[0x263EF8330];
        uint64_t v58 = 3221225472;
        id v59 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244;
        v60 = &unk_265463860;
        id v61 = v12;
        id v13 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244();
        id v14 = [a1[4] completionQueue];
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_249;
        v55[3] = &unk_265463B48;
        id v56 = a1[6];
        [v14 addOperationWithBlock:v55];

        id v15 = v61;
      }
    }
    else
    {
      id v18 = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2();
      uint64_t v19 = [a1[4] completionQueue];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_243;
      v62[3] = &unk_265463B48;
      id v63 = a1[6];
      [v19 addOperationWithBlock:v62];

      id v12 = v63;
    }
  }
}

id __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1009 underlyingError:*(void *)(a1 + 32) description:@"Failed to retrieve Preauthentication response."];
  v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231_cold_1();
  }

  return v1;
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_235(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1009 description:@"Not HTTP response for Preauthentication."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_243(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244()
{
  v0 = +[POError errorWithCode:-1009 description:@"Preauthentication request failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244_cold_1();
  }

  return v0;
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_249(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_251(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1008 underlyingError:*(void *)(a1 + 32) description:@"Failed to parse Preauthentication response."];
  v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_255(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257()
{
  v0 = +[POError errorWithCode:-1008 description:@"Exception when evaluating federationPredicate"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_265(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_266(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)createWSTrustMexRequestWithContext:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F089E0];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 wsTrustFederationMexURL];

  id v7 = (void *)[v5 initWithURL:v6 cachePolicy:4 timeoutInterval:30.0];
  [v7 setHTTPMethod:@"GET"];
  id v8 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess createWSTrustMexRequestWithContext:]();
  }

  return v7;
}

- (void)performWSTrustMexRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  rsize_t v11 = [v8 urlSession];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke;
  id v21 = &unk_265463B70;
  id v23 = v8;
  id v24 = v9;
  id v22 = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = [v11 dataTaskWithRequest:v10 completionHandler:&v18];

  id v15 = NSString;
  id v16 = [v12 requestIdentifier];
  rsize_t v17 = [v15 stringWithFormat:@"WSTrust Mex Request: %@", v16, v18, v19, v20, v21, v22];
  [v14 setTaskDescription:v17];

  [v14 resume];
}

void __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_INFO, "WSTrust Mex response received", buf, 2u);
  }

  if (v9)
  {
    if (v7) {
      rsize_t v11 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    }
    else {
      rsize_t v11 = 0;
    }
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_271;
    v36[3] = &unk_265463A00;
    id v37 = v9;
    id v38 = v11;
    id v12 = v11;
    id v16 = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_271((uint64_t)v36);
    rsize_t v17 = [a1[4] completionQueue];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_275;
    v34[3] = &unk_265463B48;
    id v35 = a1[6];
    [v17 addOperationWithBlock:v34];

    id v15 = v37;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v18 = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_2();
      uint64_t v19 = [a1[4] completionQueue];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_281;
      v32[3] = &unk_265463B48;
      id v33 = a1[6];
      [v19 addOperationWithBlock:v32];

      id v12 = v33;
      goto LABEL_13;
    }
    id v12 = v8;
    if ([v12 statusCode] >= 200 && objc_msgSend(v12, "statusCode") < 300)
    {
      id v20 = PO_LOG_POAuthenticationProcess();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_cold_1();
      }

      [a1[5] setWsTrustVersion:0];
      if (![a1[4] validateWSTrustMexResponseWithContext:a1[5] response:v7]
        || ![a1[5] wsTrustVersion]
        || ([a1[5] wsTrustFederationURL],
            id v21 = objc_claimAutoreleasedReturnValue(),
            v21,
            !v21))
      {
        (*((void (**)(void))a1[6] + 2))();
        goto LABEL_13;
      }
      id v22 = [a1[4] completionQueue];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_287;
      v23[3] = &unk_265463B48;
      id v24 = a1[6];
      [v22 addOperationWithBlock:v23];

      id v15 = v24;
    }
    else
    {
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      uint64_t v29 = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_2_282;
      id v30 = &unk_265463860;
      id v12 = v12;
      id v31 = v12;
      id v13 = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_2_282();
      id v14 = [a1[4] completionQueue];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_286;
      v25[3] = &unk_265463B48;
      id v26 = a1[6];
      [v14 addOperationWithBlock:v25];

      id v15 = v31;
    }
  }

LABEL_13:
}

id __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_271(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1009 underlyingError:*(void *)(a1 + 32) description:@"Failed to retrieve WSTrust Mex response."];
  v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231_cold_1();
  }

  return v1;
}

uint64_t __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_275(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1009 description:@"Not HTTP response for WSTrust Mex response."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_281(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_2_282()
{
  v0 = +[POError errorWithCode:-1009 description:@"WSTrust Mex request failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244_cold_1();
  }

  return v0;
}

uint64_t __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_286(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_287(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)validateWSTrustMexResponseWithContext:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(POAuthenticationProcess *)self wstrustProcess];
  id v9 = [v8 parseWSTrustMexResponse:v7 version:1];

  if (v9
    || ([(POAuthenticationProcess *)self wstrustProcess],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 parseWSTrustMexResponse:v7 version:2],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9))
  {
    objc_msgSend(v6, "setWsTrustVersion:", objc_msgSend(v9, "version"));
    rsize_t v11 = NSURL;
    id v12 = [v9 endpointURLString];
    id v13 = [v11 URLWithString:v12];
    [v6 setWsTrustFederationURL:v13];

    LOBYTE(v9) = 1;
  }
  else
  {
    id v15 = __74__POAuthenticationProcess_validateWSTrustMexResponseWithContext_response___block_invoke();
  }

  return (char)v9;
}

id __74__POAuthenticationProcess_validateWSTrustMexResponseWithContext_response___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to find valid WSTrust values in mex response."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)createWSTrust13RequestWithContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(POWSTrustRequest);
  id v6 = [v4 loginConfiguration];
  id v7 = [v6 federationRequestURN];
  [(POWSTrustRequest *)v5 setEndpointURN:v7];

  id v8 = [v4 wsTrustFederationNonce];
  [(POWSTrustRequest *)v5 setNonce:v8];

  id v9 = [v4 wsTrustFederationURL];
  id v10 = [v9 absoluteString];
  [(POWSTrustRequest *)v5 setTo:v10];

  rsize_t v11 = [v4 userName];
  [(POWSTrustRequest *)v5 setUserName:v11];

  id v12 = [v4 password];
  [(POWSTrustRequest *)v5 setPassword:v12];

  id v13 = [(POAuthenticationProcess *)self wstrustProcess];
  id v14 = [v13 createWSTrust13Request:v5];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x263F089E0]);
    id v16 = [v4 wsTrustFederationURL];
    rsize_t v17 = (void *)[v15 initWithURL:v16 cachePolicy:4 timeoutInterval:30.0];

    [v17 setHTTPMethod:@"POST"];
    objc_msgSend(v17, "addValue:forHTTPHeaderField:", @"application/soap+xml; charset=utf-8",
      @"Content-type");
    [v17 addValue:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue" forHTTPHeaderField:@"SOAPAction"];
    [v17 setHTTPBody:v14];
  }
  else
  {
    id v18 = __61__POAuthenticationProcess_createWSTrust13RequestWithContext___block_invoke();
    rsize_t v17 = 0;
  }

  return v17;
}

id __61__POAuthenticationProcess_createWSTrust13RequestWithContext___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to created WSTrust login request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)createWSTrust2005RequestWithContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(POWSTrustRequest);
  id v6 = [v4 loginConfiguration];
  id v7 = [v6 federationRequestURN];
  [(POWSTrustRequest *)v5 setEndpointURN:v7];

  id v8 = [v4 wsTrustFederationNonce];
  [(POWSTrustRequest *)v5 setNonce:v8];

  id v9 = [v4 wsTrustFederationURL];
  id v10 = [v9 absoluteString];
  [(POWSTrustRequest *)v5 setTo:v10];

  rsize_t v11 = [v4 userName];
  [(POWSTrustRequest *)v5 setUserName:v11];

  id v12 = [v4 password];
  [(POWSTrustRequest *)v5 setPassword:v12];

  id v13 = [(POAuthenticationProcess *)self wstrustProcess];
  id v14 = [v13 createWSTrust2005Request:v5];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x263F089E0]);
    id v16 = [v4 wsTrustFederationURL];
    rsize_t v17 = (void *)[v15 initWithURL:v16 cachePolicy:4 timeoutInterval:30.0];

    [v17 setHTTPMethod:@"POST"];
    objc_msgSend(v17, "addValue:forHTTPHeaderField:", @"application/soap+xml; charset=utf-8",
      @"Content-type");
    [v17 addValue:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue" forHTTPHeaderField:@"SOAPAction"];
    [v17 setHTTPBody:v14];
  }
  else
  {
    id v18 = __61__POAuthenticationProcess_createWSTrust13RequestWithContext___block_invoke();
    rsize_t v17 = 0;
  }

  return v17;
}

- (void)performWSTrustAuthenticationRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  rsize_t v11 = [v8 urlSession];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke;
  id v21 = &unk_265463B70;
  id v23 = v8;
  id v24 = v9;
  id v22 = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = [v11 dataTaskWithRequest:v10 completionHandler:&v18];

  id v15 = NSString;
  id v16 = [v12 requestIdentifier];
  rsize_t v17 = [v15 stringWithFormat:@"WSTrust Login Request: %@", v16, v18, v19, v20, v21, v22];
  [v14 setTaskDescription:v17];

  [v14 resume];
}

void __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_INFO, "WSTrust login response received", buf, 2u);
  }

  if (v9)
  {
    if (v7) {
      rsize_t v11 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    }
    else {
      rsize_t v11 = 0;
    }
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_316;
    v48[3] = &unk_265463A00;
    id v49 = v9;
    id v50 = v11;
    id v12 = v11;
    id v16 = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_316((uint64_t)v48);
    rsize_t v17 = [a1[4] completionQueue];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_320;
    v45[3] = &unk_265463B98;
    id v47 = a1[6];
    id v46 = a1[5];
    [v17 addOperationWithBlock:v45];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v8;
      if ([v12 statusCode] == 200 || objc_msgSend(v12, "statusCode") == 500)
      {
        BOOL v13 = +[POCoreConfigurationUtil platformSSODevModeEnabled];
        id v14 = PO_LOG_POAuthenticationProcess();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
        if (v13)
        {
          if (v15) {
            __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_cold_1();
          }
        }
        else if (v15)
        {
          __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_cold_2();
        }

        id v20 = a1[4];
        id v21 = a1[5];
        id v33 = 0;
        uint64_t v22 = [v20 validateWSTrustAuthenticationResponseWithContext:v21 response:v7 returningAssertion:&v33];
        id v23 = v33;
        id v24 = [a1[4] completionQueue];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_333;
        v28[3] = &unk_265463BC0;
        id v31 = a1[6];
        uint64_t v32 = v22;
        id v29 = a1[5];
        id v30 = v23;
        id v25 = v23;
        [v24 addOperationWithBlock:v28];
      }
      else
      {
        uint64_t v37 = MEMORY[0x263EF8330];
        uint64_t v38 = 3221225472;
        id v39 = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_2_327;
        uint64_t v40 = &unk_265463860;
        id v41 = v12;
        id v26 = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_2_327();
        uint64_t v27 = [a1[4] completionQueue];
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_331;
        v34[3] = &unk_265463B98;
        id v36 = a1[6];
        id v35 = a1[5];
        [v27 addOperationWithBlock:v34];

        id v25 = v41;
      }
    }
    else
    {
      id v18 = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_2();
      uint64_t v19 = [a1[4] completionQueue];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_326;
      v42[3] = &unk_265463B98;
      id v44 = a1[6];
      id v43 = a1[5];
      [v19 addOperationWithBlock:v42];

      id v12 = v44;
    }
  }
}

id __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_316(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1009 underlyingError:*(void *)(a1 + 32) description:@"Failed to retrieve WSTrust login response."];
  v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231_cold_1();
  }

  return v1;
}

uint64_t __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_320(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 5, *(void *)(a1 + 32), 0);
}

id __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1009 description:@"Not HTTP response for WSTrust login response."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_326(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 3, *(void *)(a1 + 32), 0);
}

id __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_2_327()
{
  v0 = +[POError errorWithCode:-1009 description:@"WSTrust login request failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244_cold_1();
  }

  return v0;
}

uint64_t __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_331(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 3, *(void *)(a1 + 32), 0);
}

uint64_t __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_333(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[7], a1[4], a1[5]);
}

- (unint64_t)validateWSTrustAuthenticationResponseWithContext:(id)a3 response:(id)a4 returningAssertion:(id *)a5
{
  id v8 = a3;
  *a5 = 0;
  id v9 = a4;
  id v10 = [(POAuthenticationProcess *)self wstrustProcess];
  rsize_t v11 = objc_msgSend(v10, "parseWSTrustResponse:version:", v9, objc_msgSend(v8, "wsTrustVersion"));

  if (!v11)
  {
    id v22 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke();
LABEL_15:
    unint64_t v21 = 3;
    goto LABEL_16;
  }
  id v12 = [v11 nonce];
  BOOL v13 = [v8 wsTrustFederationNonce];
  char v14 = [v12 isEqualToString:v13];

  if ((v14 & 1) == 0)
  {
    id v23 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_342();
    goto LABEL_15;
  }
  if (![v11 isFault])
  {
    uint64_t v24 = [v11 nonce];
    if (v24
      && (id v25 = (void *)v24,
          [v11 created],
          id v26 = objc_claimAutoreleasedReturnValue(),
          v26,
          v25,
          v26))
    {
      uint64_t v27 = [v11 created];
      [v27 timeIntervalSinceNow];
      double v29 = v28;

      if (v29 <= 120.0)
      {
        id v33 = [v11 expires];

        if (v33
          && ([v11 expires],
              v34 = objc_claimAutoreleasedReturnValue(),
              [v34 timeIntervalSinceNow],
              double v36 = v35,
              v34,
              v36 < -120.0))
        {
          id v42 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_365();
        }
        else
        {
          uint64_t v37 = [v11 tokenType];
          uint64_t v38 = [v37 length];

          if (v38)
          {
            id v39 = [v11 tokenType];
            [v8 setTokenTypeNamespace:v39];

            uint64_t v40 = [v11 assertion];

            if (v40)
            {
              id v41 = [v11 assertion];
              *a5 = [v41 dataUsingEncoding:4];

              unint64_t v21 = 1;
              goto LABEL_16;
            }
            id v44 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_375();
          }
          else
          {
            id v43 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_369();
          }
        }
      }
      else
      {
        id v30 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_361();
      }
    }
    else
    {
      id v31 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_355();
    }
    goto LABEL_15;
  }
  BOOL v15 = NSString;
  id v16 = [v11 faultSubCodeValue];
  rsize_t v17 = [v11 faultReason];
  id v18 = [v15 stringWithFormat:@"faultSubCode = %@, faultReason = %@", v16, v17];

  uint64_t v45 = v18;
  id v19 = v18;
  id v20 = __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_351();
  if ([v11 isCredentialFault]) {
    unint64_t v21 = 4;
  }
  else {
    unint64_t v21 = 3;
  }

LABEL_16:
  return v21;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to parse WSTrust login response."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_342()
{
  v0 = +[POError errorWithCode:-1001 description:@"WSTrust login response validation failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_351()
{
  v0 = +[POError errorWithCode:-1008 description:@"WSTrust login failed"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_355()
{
  v0 = +[POError errorWithCode:-1008 description:@"WSTrust login response validation missing required values."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_361()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to verify created."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_361_cold_1();
  }

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_365()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to verify expires."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_361_cold_1();
  }

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_369()
{
  v0 = +[POError errorWithCode:-1008 description:@"WSTrust login response missing TokenType."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_375()
{
  v0 = +[POError errorWithCode:-1008 description:@"WSTrust login response validation missing assertion."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)performLoginWithContext:(id)a3 loginJWT:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  rsize_t v11 = [v8 deviceConfiguration];
  id v12 = [v11 signingAlgorithm];
  BOOL v13 = [v8 deviceConfiguration];
  uint64_t v14 = [v13 deviceSigningKey];
  BOOL v15 = [v8 deviceConfiguration];
  id v16 = +[POJWTSigning encodeAndSignJWT:signingAlgorithm:key:certificate:error:](POJWTSigning, "encodeAndSignJWT:signingAlgorithm:key:certificate:error:", v9, v12, v14, [v15 deviceSigningCertificate], 0);

  if (v16)
  {
    rsize_t v17 = [v9 body];
    [v17 zeroPassword];

    id v18 = [(POAuthenticationProcess *)self createLoginRequestWithContext:v8 jwt:v16];
    if (v18)
    {

      id v19 = PO_LOG_PODiagnostics();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v8 requestIdentifier];
        *(_DWORD *)buf = 138543362;
        id v31 = v20;
        _os_log_impl(&dword_259DFE000, v19, OS_LOG_TYPE_DEFAULT, "Sending login request: %{public}@", buf, 0xCu);
      }
      unint64_t v21 = PO_LOG_POAuthenticationProcess();
      os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, v8);

      id v23 = PO_LOG_POAuthenticationProcess();
      uint64_t v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_259DFE000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PlatformSSO_LoginRequest", " enableTelemetry=YES ", buf, 2u);
      }

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_392;
      v27[3] = &unk_265463B20;
      os_signpost_id_t v29 = v22;
      v27[4] = self;
      id v28 = v10;
      [(POAuthenticationProcess *)self performLoginRequestWithContext:v8 request:v18 completion:v27];

      id v9 = 0;
    }
    else
    {
      id v26 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_386();
      (*((void (**)(id, uint64_t, id, void))v10 + 2))(v10, 2, v8, 0);
    }
  }
  else
  {
    id v25 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, void))v10 + 2))(v10, 2, v8, 0);
  }
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to sign login request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_386()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create login request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

void __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_392(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v9, OS_LOG_TYPE_INFO, "Login response received", buf, 2u);
  }

  id v10 = PO_LOG_POAuthenticationProcess();
  rsize_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v97 = a2;
    _os_signpost_emit_with_name_impl(&dword_259DFE000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PlatformSSO_LoginRequest", "result=%lu", buf, 0xCu);
  }

  if (a2 == 1)
  {
    BOOL v13 = [POLoginResponseTokenJWT alloc];
    uint64_t v14 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    BOOL v15 = [(POLoginResponseTokenJWT *)v13 initWithString:v14];

    if (v15)
    {
      id v82 = v8;
      id v16 = *(void **)(a1[4] + 40);
      rsize_t v17 = [(POJWT *)v15 decodedHeader];
      id v18 = [v17 enc];
      v83 = a1;
      if ([v16 containsObject:v18])
      {

        goto LABEL_13;
      }
      unint64_t v21 = *(void **)(a1[4] + 40);
      os_signpost_id_t v22 = NSString;
      id v23 = [(POJWT *)v15 decodedHeader];
      [v23 alg];
      v25 = uint64_t v24 = v15;
      id v26 = [(POJWT *)v24 decodedHeader];
      uint64_t v27 = [v26 enc];
      id v28 = [v22 stringWithFormat:@"%@,%@", v25, v27];
      LOBYTE(v21) = [v21 containsObject:v28];

      BOOL v15 = v24;
      if (v21)
      {
LABEL_13:
        os_signpost_id_t v29 = [v7 deviceConfiguration];
        id v30 = [v29 encryptionAlgorithm];
        v84 = v15;
        if (objc_msgSend(v30, "isEqualToNumber:")) {
          [v7 apv];
        }
        else {
        uint64_t v81 = [v7 nonce];
        }

        v79 = [v7 deviceConfiguration];
        id v31 = [v79 encryptionAlgorithm];
        uint64_t v32 = [v7 deviceConfiguration];
        uint64_t v33 = [v32 deviceEncryptionKey];
        v34 = [v7 loginConfiguration];
        double v35 = [v34 hpkePsk];
        double v36 = [v7 loginConfiguration];
        uint64_t v37 = objc_msgSend(v36, "hpkePsk_id");
        uint64_t v38 = v7;
        id v39 = (void *)v37;
        v78 = v38;
        uint64_t v40 = [v38 loginConfiguration];
        uint64_t v41 = [v40 hpkeAuthPublicKey];
        v94[0] = 0;
        BOOL v42 = +[POJWTEncryption decodeAndDecryptJWT:v84 encryptionAlgorithm:v31 privateKey:v33 otherInfo:v81 psk:v35 psk_id:v39 authPublicKey:v41 error:v94];
        id v43 = v94[0];

        if (v42)
        {
          id v80 = v43;
          id v7 = v78;
          id v44 = [v78 deviceConfiguration];
          uint64_t v45 = [v44 encryptionAlgorithm];
          int v46 = [v45 isEqualToNumber:0x2707DBB50];

          id v8 = v82;
          BOOL v15 = v84;
          if (!v46)
          {
LABEL_22:
            v52 = (void *)v81;
            if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
            {
              id v53 = PO_LOG_POAuthenticationProcess();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
                __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_392_cold_1();
              }
            }
            id v54 = [(POLoginResponseTokenJWT *)v84 decodedBody];
            v55 = [POIDTokenJWT alloc];
            id v56 = objc_msgSend(v54, "id_token");
            uint64_t v57 = [(POIDTokenJWT *)v55 initWithString:v56];

            if (v57)
            {
              uint64_t v58 = [(POJWT *)v57 decodedHeader];
              id v59 = [v58 kid];

              v60 = v80;
              if ([v59 length])
              {
                id v61 = (void *)v83[4];
                v85[0] = MEMORY[0x263EF8330];
                v85[1] = 3221225472;
                v85[2] = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_445;
                v85[3] = &unk_265463BE8;
                id v86 = v59;
                id v91 = (id)v83[5];
                id v62 = v78;
                uint64_t v63 = v83[4];
                id v87 = v62;
                uint64_t v88 = v63;
                v89 = v57;
                v90 = v84;
                id v64 = v62;
                v52 = (void *)v81;
                [v61 retrieveSigningKeyWithContext:v64 keyId:v86 completion:v85];
              }
              else
              {
                id v76 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_439();
                (*(void (**)(void))(v83[5] + 16))();
              }
            }
            else
            {
              id v75 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_433();
              (*(void (**)(void))(v83[5] + 16))();
              v60 = v80;
            }

            id v8 = v82;
            goto LABEL_38;
          }
          if ([(id)v83[4] validatePartyUInfo:v84 context:v78])
          {
            id v47 = [v78 deviceConfiguration];
            SecKeyRef v48 = SecKeyCopyPublicKey((SecKeyRef)[v47 deviceEncryptionKey]);

            id v49 = (void *)v83[4];
            id v50 = [v78 apv];
            char v51 = [v49 validatePartyVInfo:v50 context:v78 publicKey:v48];

            if (v48) {
              CFRelease(v48);
            }
            if (v51) {
              goto LABEL_22;
            }
            id v77 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_426();
          }
          else
          {
            id v74 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_420();
          }
          (*(void (**)(void))(v83[5] + 16))();
          v60 = v43;
          v52 = (void *)v81;
        }
        else
        {
          v52 = (void *)v81;
          v92[0] = MEMORY[0x263EF8330];
          v92[1] = 3221225472;
          v92[2] = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_416;
          v92[3] = &unk_265463860;
          id v93 = v43;
          id v65 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_416((uint64_t)v92);
          id v7 = v78;
          (*(void (**)(void))(v83[5] + 16))();

          id v8 = v82;
          BOOL v15 = v84;
          v60 = v43;
        }
LABEL_38:

        goto LABEL_39;
      }
      id v66 = NSString;
      id v67 = [(POJWT *)v24 decodedHeader];
      id v68 = [v67 alg];
      v69 = [(POJWT *)v24 decodedHeader];
      v70 = [v69 enc];
      v71 = [v66 stringWithFormat:@"alg = %@, enc = %@", v68, v70];

      v94[1] = (id)MEMORY[0x263EF8330];
      v94[2] = (id)3221225472;
      v94[3] = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_412;
      v94[4] = &unk_265463860;
      id v95 = v71;
      id v72 = v71;
      id v73 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_412();
      (*(void (**)(void))(v83[5] + 16))();

      id v8 = v82;
    }
    else
    {
      id v20 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_400();
      (*(void (**)(void))(a1[5] + 16))();
    }
LABEL_39:

    goto LABEL_40;
  }
  id v19 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_393();
  (*(void (**)(void))(a1[5] + 16))();
LABEL_40:
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_393()
{
  v0 = +[POError errorWithCode:-1001 description:@"login request failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_400()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to parse login response."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_412()
{
  v0 = +[POError errorWithCode:-1008 description:@"unsupported login response algorithm and encryption."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_416(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1008 underlyingError:*(void *)(a1 + 32) description:@"Failed to decrypt login response."];
  v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_420()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to validate apu."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_426()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to validate apv."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_433()
{
  v0 = +[POError errorWithCode:-1008 description:@"No id_token in login response."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_439()
{
  v0 = +[POError errorWithCode:-1008 description:@"No kid in login response id_token."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

void __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_445(uint64_t a1, const void *a2)
{
  id v4 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v4, OS_LOG_TYPE_INFO, "JWKS response received", buf, 2u);
  }

  if (a2)
  {
    if ([*(id *)(a1 + 48) validateIdToken:*(void *)(a1 + 56) context:*(void *)(a1 + 40) key:a2])
    {
      uint64_t v5 = *(void *)(a1 + 72);
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = objc_alloc(MEMORY[0x263EFF8F8]);
      id v8 = [*(id *)(a1 + 64) rawBody];
      id v9 = objc_msgSend(v7, "psso_initWithBase64URLEncodedString:", v8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v5 + 16))(v5, 1, v6, v9);
    }
    else
    {
      id v11 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_451();
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
    CFRelease(a2);
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_446;
    v12[3] = &unk_265463860;
    id v13 = *(id *)(a1 + 32);
    id v10 = (id)((uint64_t (*)(void *))__71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_446)(v12);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_446()
{
  v0 = +[POError errorWithCode:-1008 description:@"No key available with identifier."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_451()
{
  v0 = +[POError errorWithCode:-1008 description:@"id_token signature check failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)createAuthenticationContextUsingLoginConfiguration:(id)a3 deviceConfiguration:(id)a4 userName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(POAuthenticationContext);
  [(POAuthenticationContext *)v11 setLoginConfiguration:v8];
  [(POAuthenticationContext *)v11 setDeviceConfiguration:v9];
  [(POAuthenticationContext *)v11 setUserName:v10];

  os_signpost_id_t v12 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  objc_msgSend(v12, "set_preventsAppSSO:", 1);
  if ([(POAuthenticationProcess *)self waitForConnectivity])
  {
    [v12 setWaitsForConnectivity:1];
    [(POAuthenticationProcess *)self timeoutIntervalForResource];
    if (v13 == 0.0) {
      double v13 = 180.0;
    }
    [v12 setTimeoutIntervalForResource:v13];
  }
  uint64_t v14 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v12 delegate:self delegateQueue:0];
  [(POAuthenticationContext *)v11 setUrlSession:v14];

  [(POAuthenticationContext *)v11 setScope:@"openid offline_access"];
  BOOL v15 = [v8 additionalScopes];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    rsize_t v17 = [v8 additionalScopes];
    id v18 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v19 = [v17 stringByTrimmingCharactersInSet:v18];

    id v20 = NSString;
    unint64_t v21 = [(POAuthenticationContext *)v11 scope];
    os_signpost_id_t v22 = [v20 stringWithFormat:@"%@ %@", v21, v19];
    [(POAuthenticationContext *)v11 setScope:v22];
  }
  if (!v9) {
    goto LABEL_11;
  }
  if ([v9 deviceEncryptionKey])
  {
    id v23 = [v9 encryptionAlgorithm];
    int v24 = [v23 isEqualToNumber:0x2707DBB50];

    if (v24)
    {
      id v25 = [(POAuthenticationContext *)v11 nonce];
      id v26 = -[POAuthenticationProcess createPartyVInfoWithNonce:apvKey:](self, "createPartyVInfoWithNonce:apvKey:", v25, [v9 deviceEncryptionKey]);
      [(POAuthenticationContext *)v11 setApv:v26];
    }
LABEL_11:
    uint64_t v27 = v11;
    goto LABEL_13;
  }
  uint64_t v27 = 0;
LABEL_13:

  return v27;
}

- (id)createPartyVInfoWithNonce:(id)a3 apvKey:(__SecKey *)a4
{
  uint64_t v6 = [a3 dataUsingEncoding:1];
  id v7 = [@"Apple" dataUsingEncoding:4];
  SecKeyRef v8 = SecKeyCopyPublicKey(a4);
  id v9 = [(POAuthenticationProcess *)self createPartyVInfoWithNonce:v6 prefixData:v7 apvPublicKey:v8];
  if (v8) {
    CFRelease(v8);
  }

  return v9;
}

- (id)createPartyVInfoWithNonce:(id)a3 prefixData:(id)a4 apvPublicKey:(__SecKey *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5 && [v7 length])
  {
    CFDataRef v9 = SecKeyCopyExternalRepresentation(a5, 0);
    id v10 = objc_alloc_init(MEMORY[0x263EFF990]);
    unsigned int v15 = bswap32([v8 length]);
    [v10 appendBytes:&v15 length:4];
    [v10 appendData:v8];
    unsigned int v14 = bswap32([(__CFData *)v9 length]);
    [v10 appendBytes:&v14 length:4];
    [v10 appendData:v9];
    unsigned int v13 = bswap32([v7 length]);
    [v10 appendBytes:&v13 length:4];
    [v10 appendData:v7];
    id v11 = objc_msgSend(v10, "psso_base64URLEncodedString");
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)createNonceRequestWithContext:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F089E0]);
  uint64_t v5 = [v3 loginConfiguration];
  uint64_t v6 = [v5 nonceEndpointURL];
  id v7 = (void *)[v4 initWithURL:v6 cachePolicy:4 timeoutInterval:30.0];

  [v7 setHTTPMethod:@"POST"];
  [v7 addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
  [v7 addValue:@"application/json" forHTTPHeaderField:@"Accept"];
  id v8 = [v3 requestIdentifier];
  [v7 addValue:v8 forHTTPHeaderField:@"client-request-id"];

  id v9 = objc_alloc_init(MEMORY[0x263F08BA0]);
  id v10 = [MEMORY[0x263F08BD0] queryItemWithName:@"grant_type" value:@"srv_challenge"];
  v25[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];

  os_signpost_id_t v12 = [v3 loginConfiguration];
  unsigned int v13 = [v12 customNonceRequestValues];

  if (v13)
  {
    unsigned int v14 = [v3 loginConfiguration];
    unsigned int v15 = [v14 customNonceRequestValues];
    uint64_t v16 = [v11 arrayByAddingObjectsFromArray:v15];

    id v11 = (void *)v16;
  }
  [v9 setQueryItems:v11];
  rsize_t v17 = [v9 percentEncodedQuery];
  id v18 = [v17 dataUsingEncoding:4];
  [v7 setHTTPBody:v18];

  id v19 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess createNonceRequestWithContext:]();
  }

  id v20 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    unint64_t v21 = [v3 requestIdentifier];
    int v23 = 138543362;
    int v24 = v21;
    _os_log_impl(&dword_259DFE000, v20, OS_LOG_TYPE_INFO, "server nonce request: %{public}@", (uint8_t *)&v23, 0xCu);
  }
  return v7;
}

- (void)performNonceRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  rsize_t v17 = __77__POAuthenticationProcess_performNonceRequestWithContext_request_completion___block_invoke;
  id v18 = &unk_265463C38;
  id v19 = v8;
  id v20 = self;
  id v21 = v9;
  id v22 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  unsigned int v14 = (void *)MEMORY[0x25A2EDBB0](&v15);
  -[POAuthenticationProcess _performNonceRequestWithContext:request:completion:](self, "_performNonceRequestWithContext:request:completion:", v13, v12, v14, v15, v16, v17, v18);
}

void __77__POAuthenticationProcess_performNonceRequestWithContext_request_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2 == 5 && [*(id *)(a1 + 32) retriesRemaining] >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRetriesRemaining:", objc_msgSend(*(id *)(a1 + 32), "retriesRemaining") - 1);
    id v4 = PO_LOG_POAuthenticationProcess();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [*(id *)(a1 + 32) requestIdentifier];
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_259DFE000, v4, OS_LOG_TYPE_INFO, "retrying server nonce request: %{public}@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x263F08B88], "sleepForTimeInterval:", (double)objc_msgSend(*(id *)(a1 + 32), "retryDelay"));
    [*(id *)(a1 + 40) performNonceRequestWithContext:*(void *)(a1 + 32) request:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 40) completionQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __77__POAuthenticationProcess_performNonceRequestWithContext_request_completion___block_invoke_482;
    v7[3] = &unk_265463C10;
    id v8 = *(id *)(a1 + 56);
    uint64_t v9 = a2;
    [v6 addOperationWithBlock:v7];
  }
}

uint64_t __77__POAuthenticationProcess_performNonceRequestWithContext_request_completion___block_invoke_482(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_performNonceRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 urlSession];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke;
  id v21 = &unk_265463B70;
  id v23 = v8;
  id v24 = v9;
  id v22 = self;
  id v12 = v8;
  id v13 = v9;
  unsigned int v14 = [v11 dataTaskWithRequest:v10 completionHandler:&v18];

  uint64_t v15 = NSString;
  uint64_t v16 = [v12 requestIdentifier];
  rsize_t v17 = [v15 stringWithFormat:@"Server Nonce Request: %@", v16, v18, v19, v20, v21, v22];
  [v14 setTaskDescription:v17];

  [v14 resume];
}

void __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_INFO, "Nonce response received", buf, 2u);
  }

  if (v9)
  {
    if (v7) {
      id v11 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    }
    else {
      id v11 = 0;
    }
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_483;
    v57[3] = &unk_265463A00;
    id v58 = v9;
    id v59 = v11;
    id v12 = v11;
    id v16 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_483((uint64_t)v57);
    rsize_t v17 = [a1[4] completionQueue];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_487;
    v55[3] = &unk_265463B48;
    id v56 = a1[6];
    [v17 addOperationWithBlock:v55];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v8;
      if ([v12 statusCode] >= 200 && objc_msgSend(v12, "statusCode") < 300)
      {
        BOOL v20 = +[POCoreConfigurationUtil platformSSODevModeEnabled];
        id v21 = PO_LOG_POAuthenticationProcess();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20)
        {
          if (v22) {
            __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_cold_1();
          }
        }
        else if (v22)
        {
          __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_cold_2();
        }

        id v45 = 0;
        id v23 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:16 error:&v45];
        id v24 = v45;
        uint64_t v15 = v24;
        if (!v23 || v24)
        {
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_499;
          v43[3] = &unk_265463860;
          id v30 = &v44;
          id v44 = v24;
          id v31 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_499((uint64_t)v43);
          uint64_t v32 = [a1[4] completionQueue];
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_503;
          v41[3] = &unk_265463B48;
          id v42 = a1[6];
          [v32 addOperationWithBlock:v41];

          uint64_t v33 = v42;
        }
        else
        {
          id v25 = [a1[5] loginConfiguration];
          id v26 = [v25 nonceResponseKeypath];

          if (v26)
          {
            uint64_t v27 = [a1[5] loginConfiguration];
            id v28 = [v27 nonceResponseKeypath];
            os_signpost_id_t v29 = [v23 valueForKeyPath:v28];
            if (v29)
            {
              [a1[5] setServerNonce:v29];
            }
            else
            {
              double v36 = [v23 objectForKeyedSubscript:@"Nonce"];
              [a1[5] setServerNonce:v36];
            }
          }
          else
          {
            uint64_t v27 = [v23 objectForKeyedSubscript:@"Nonce"];
            [a1[5] setServerNonce:v27];
          }

          v34 = [a1[5] serverNonce];

          uint64_t v33 = [a1[4] completionQueue];
          if (v34)
          {
            v39[0] = MEMORY[0x263EF8330];
            v39[1] = 3221225472;
            v39[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2_507;
            v39[3] = &unk_265463B48;
            id v30 = &v40;
            id v40 = a1[6];
            double v35 = v39;
          }
          else
          {
            v37[0] = MEMORY[0x263EF8330];
            v37[1] = 3221225472;
            v37[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_3;
            v37[3] = &unk_265463B48;
            id v30 = &v38;
            id v38 = a1[6];
            double v35 = v37;
          }
          [v33 addOperationWithBlock:v35];
        }
      }
      else
      {
        uint64_t v48 = MEMORY[0x263EF8330];
        uint64_t v49 = 3221225472;
        id v50 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2_494;
        char v51 = &unk_265463860;
        id v52 = v12;
        id v13 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2_494();
        unsigned int v14 = [a1[4] completionQueue];
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_498;
        v46[3] = &unk_265463B48;
        id v47 = a1[6];
        [v14 addOperationWithBlock:v46];

        uint64_t v15 = v52;
      }
    }
    else
    {
      id v18 = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2();
      uint64_t v19 = [a1[4] completionQueue];
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_493;
      v53[3] = &unk_265463B48;
      id v54 = a1[6];
      [v19 addOperationWithBlock:v53];

      id v12 = v54;
    }
  }
}

id __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_483(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1009 underlyingError:*(void *)(a1 + 32) description:@"Failed to retrieve server nonce."];
  v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231_cold_1();
  }

  return v1;
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_487(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1009 description:@"Not HTTP response for server nonce."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_493(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2_494()
{
  v0 = +[POError errorWithCode:-1009 description:@"server nonce request failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244_cold_1();
  }

  return v0;
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_498(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_499(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1008 underlyingError:*(void *)(a1 + 32) description:@"Failed to parse server nonce response."];
  v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_503(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_2_507(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)createEmbeddedAssertionWithContext:(id)a3
{
  v35[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 loginConfiguration];
  uint64_t v5 = [v4 audience];

  if (v5)
  {
    uint64_t v6 = objc_alloc_init(POMutableAssertionJWTBody);
    id v7 = [v3 loginConfiguration];
    id v8 = [v7 customAssertionRequestBodyClaims];
    [(POMutableAssertionJWTBody *)v6 addCustomClaims:v8];

    id v9 = [v3 loginConfiguration];
    id v10 = [v9 audience];
    [(POMutableAssertionJWTBody *)v6 setAud:v10];

    id v11 = [MEMORY[0x263EFF910] date];
    [(POMutableAssertionJWTBody *)v6 setIat:v11];

    id v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:300.0];
    [(POMutableAssertionJWTBody *)v6 setExp:v12];

    id v13 = [v3 userName];
    [(POMutableAssertionJWTBody *)v6 setIss:v13];

    unsigned int v14 = [v3 userName];
    [(POMutableAssertionJWTBody *)v6 setSub:v14];

    uint64_t v15 = [v3 nonce];
    [(POMutableAssertionJWTBody *)v6 setNonce:v15];

    id v16 = [v3 loginConfiguration];
    rsize_t v17 = [v16 serverNonceClaimName];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      uint64_t v19 = [v3 loginConfiguration];
      BOOL v20 = [v19 serverNonceClaimName];
      v34 = v20;
      id v21 = [v3 serverNonce];
      v35[0] = v21;
      BOOL v22 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
      [(POMutableAssertionJWTBody *)v6 addCustomClaims:v22];
    }
    else
    {
      uint64_t v19 = [v3 serverNonce];
      [(POMutableAssertionJWTBody *)v6 setRequest_nonce:v19];
    }

    id v25 = [v3 scope];
    [(POMutableAssertionJWTBody *)v6 setScope:v25];

    id v26 = objc_alloc_init(POMutableJWTHeader);
    uint64_t v27 = [v3 deviceConfiguration];
    id v28 = [v27 sdkVersionString];
    uint64_t v29 = [v28 compare:&unk_2707DBCD0];

    if (v29 == -1) {
      id v30 = @"JWT";
    }
    else {
      id v30 = @"platformsso-login-assertion+jwt";
    }
    [(POMutableJWTHeader *)v26 setTyp:v30];
    id v31 = [v3 loginConfiguration];
    uint64_t v32 = [v31 customAssertionRequestHeaderClaims];
    [(POMutableJWTHeader *)v26 addCustomClaims:v32];

    id v24 = objc_alloc_init(POMutableAssertionTokenJWT);
    [(POMutableAssertionTokenJWT *)v24 setBody:v6];
    [(POMutableJWT *)v24 setHeader:v26];
  }
  else
  {
    id v23 = __62__POAuthenticationProcess_createEmbeddedAssertionWithContext___block_invoke();
    id v24 = 0;
  }

  return v24;
}

id __62__POAuthenticationProcess_createEmbeddedAssertionWithContext___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"audience missing from configuration."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)createEmbeddedPasswordAssertionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 password];

  if (v5)
  {
    uint64_t v6 = [(POAuthenticationProcess *)self createEmbeddedAssertionWithContext:v4];
    id v7 = [v4 password];
    id v8 = (void *)[v7 mutableCopy];
    id v9 = [v6 body];
    [v9 setPassword:v8];

    id v10 = [v6 header];
    [v10 setTyp:@"platformsso-encrypted-login-assertion+jwt"];
  }
  else
  {
    id v11 = __70__POAuthenticationProcess_createEmbeddedPasswordAssertionWithContext___block_invoke();
    uint64_t v6 = 0;
  }

  return v6;
}

id __70__POAuthenticationProcess_createEmbeddedPasswordAssertionWithContext___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Missing password."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)createLoginJWTWithContext:(id)a3 embeddedAssertion:(id)a4
{
  v119[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  uint64_t v8 = [v6 password];
  unint64_t v9 = v7 | v8;

  if (!v9)
  {
    id v12 = __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke();
    goto LABEL_16;
  }
  id v10 = [v6 password];

  if (!v7 || !v10)
  {
    id v13 = [v6 loginConfiguration];
    uint64_t v14 = [v13 clientID];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      uint64_t v16 = [v6 scope];
      if (v16)
      {
        rsize_t v17 = (void *)v16;
        uint64_t v18 = [v6 nonce];
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          BOOL v20 = [v6 serverNonce];

          if (v20)
          {
            id v21 = objc_alloc_init(POMutableLoginJWTBody);
            BOOL v22 = [v6 loginConfiguration];
            id v23 = [v22 customLoginRequestBodyClaims];
            [(POMutableLoginJWTBody *)v21 addCustomClaims:v23];

            id v24 = [v6 loginConfiguration];
            id v25 = [v24 clientID];
            [(POMutableLoginJWTBody *)v21 setClient_id:v25];

            id v26 = [v6 loginConfiguration];
            uint64_t v27 = [v26 clientID];
            [(POMutableLoginJWTBody *)v21 setIss:v27];

            id v28 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:300.0];
            [(POMutableLoginJWTBody *)v21 setExp:v28];

            uint64_t v29 = [v6 scope];
            [(POMutableLoginJWTBody *)v21 setScope:v29];

            id v30 = [v6 nonce];
            [(POMutableLoginJWTBody *)v21 setNonce:v30];

            id v31 = (void *)MEMORY[0x263F08BA0];
            uint64_t v32 = [v6 loginConfiguration];
            uint64_t v33 = [v32 tokenEndpointURL];
            v34 = [v33 absoluteString];
            double v35 = [v31 componentsWithString:v34];

            [v35 setQuery:0];
            [v35 setQueryItems:0];
            [v35 setFragment:0];
            v105 = v35;
            double v36 = [v35 URL];
            uint64_t v37 = [v36 absoluteString];
            [(POMutableLoginJWTBody *)v21 setAud:v37];

            id v38 = [v6 loginConfiguration];
            id v39 = [v38 serverNonceClaimName];
            uint64_t v40 = [v39 length];

            if (v40)
            {
              uint64_t v41 = [v6 loginConfiguration];
              id v42 = [v41 serverNonceClaimName];
              v118 = v42;
              uint64_t v40 = [v6 serverNonce];
              v119[0] = v40;
              id v43 = [NSDictionary dictionaryWithObjects:v119 forKeys:&v118 count:1];
              [(POMutableLoginJWTBody *)v21 addCustomClaims:v43];
            }
            else
            {
              uint64_t v41 = [v6 serverNonce];
              [(POMutableLoginJWTBody *)v21 setRequest_nonce:v41];
            }

            id v47 = [v6 userName];
            [(POMutableLoginJWTBody *)v21 setUsername:v47];

            uint64_t v48 = [v6 userName];
            [(POMutableLoginJWTBody *)v21 setSub:v48];

            uint64_t v49 = [v6 password];

            if (v49)
            {
              id v50 = [v6 password];
              char v51 = (void *)[v50 mutableCopy];
              [(POMutableLoginJWTBody *)v21 setPassword:v51];

              [(POMutableLoginJWTBody *)v21 setGrant_type:@"password"];
            }
            if (v7)
            {
              if ([v6 loginType] == 2 || objc_msgSend(v6, "loginType") == 3)
              {
                [(POMutableLoginJWTBody *)v21 setAssertion:v7];
                goto LABEL_27;
              }
              if ([v6 loginType] == 1)
              {
                [(POMutableLoginJWTBody *)v21 setAssertion:v7];
                if ([v6 federated])
                {
                  v94 = [v6 tokenTypeNamespace];
                  if ([v94 isEqualToString:@"urn:oasis:names:tc:SAML:1.0:assertion"])
                  {
                  }
                  else
                  {
                    id v95 = [v6 tokenTypeNamespace];
                    uint64_t v40 = [v95 isEqualToString:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"];

                    if ((v40 & 1) == 0)
                    {
                      v96 = [v6 tokenTypeNamespace];
                      if (![v96 isEqualToString:@"urn:oasis:names:tc:SAML:2.0:assertion"])
                      {
                        uint64_t v97 = [v6 tokenTypeNamespace];
                        [v97 isEqualToString:@"http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV2.0"];
                      }
                      id v52 = @"urn:ietf:params:oauth:grant-type:saml2-bearer";
                      goto LABEL_28;
                    }
                  }
                  id v52 = @"urn:ietf:params:oauth:grant-type:saml1_1-bearer";
LABEL_28:
                  [(POMutableLoginJWTBody *)v21 setGrant_type:v52];
                  goto LABEL_29;
                }
LABEL_27:
                id v52 = @"urn:ietf:params:oauth:grant-type:jwt-bearer";
                goto LABEL_28;
              }
            }
LABEL_29:
            uint64_t v53 = [v6 loginType];
            if (v53 == 1)
            {
              id v54 = &unk_2707DBC70;
            }
            else if (v53 == 3)
            {
              id v54 = &unk_2707DBCA0;
            }
            else
            {
              if (v53 != 2
                || !+[POSecKeyHelper checkIfBiometricConstraintsForSigningForKey:](POSecKeyHelper, "checkIfBiometricConstraintsForSigningForKey:", [v6 embeddedAssertionSigningKey]))
              {
LABEL_37:
                v55 = [v6 deviceConfiguration];
                uint64_t v56 = [v55 userAuthorizationMode];
                if (v56 == 3)
                {
                  int v104 = 0;
                }
                else
                {
                  uint64_t v40 = [v6 deviceConfiguration];
                  if ([(id)v40 newUserAuthorizationMode] == 3)
                  {
                    int v104 = 0;
                  }
                  else
                  {
                    id v76 = [v6 deviceConfiguration];
                    if (![v76 supportsAuthorization]) {
                      goto LABEL_56;
                    }
                    v101 = v76;
                    int v104 = 1;
                  }
                }
                uint64_t v57 = [v6 deviceConfiguration];
                id v58 = [v57 administratorGroups];
                if ([v58 count])
                {

                  BOOL v59 = 1;
                  if (!v104)
                  {
LABEL_44:
                    if (v56 == 3)
                    {

                      if (!v59)
                      {
LABEL_57:
                        v78 = [MEMORY[0x263EFF910] date];
                        [(POMutableLoginJWTBody *)v21 setIat:v78];

                        [(POAuthenticationProcess *)self addCryptoHeadersToJWTBody:v21 context:v6];
                        v79 = [v6 loginConfiguration];
                        if ([v79 includePreviousRefreshTokenInLoginRequest])
                        {
                          id v80 = [v6 loginConfiguration];
                          uint64_t v81 = [v80 previousRefreshTokenClaimName];
                          uint64_t v82 = [v81 length];

                          if (!v82
                            || ([v6 refreshToken],
                                v83 = objc_claimAutoreleasedReturnValue(),
                                v83,
                                !v83))
                          {
LABEL_62:
                            id v87 = objc_alloc_init(POMutableJWTHeader);
                            uint64_t v88 = [v6 deviceConfiguration];
                            v89 = [v88 sdkVersionString];
                            uint64_t v90 = [v89 compare:&unk_2707DBCD0];

                            if (v90 == -1) {
                              id v91 = @"JWT";
                            }
                            else {
                              id v91 = @"platformsso-login-request+jwt";
                            }
                            [(POMutableJWTHeader *)v87 setTyp:v91];
                            v92 = [v6 loginConfiguration];
                            id v93 = [v92 customLoginRequestHeaderClaims];
                            [(POMutableJWTHeader *)v87 addCustomClaims:v93];

                            id v45 = objc_alloc_init(POMutableLoginTokenJWT);
                            [(POMutableLoginTokenJWT *)v45 setBody:v21];
                            [(POMutableJWT *)v45 setHeader:v87];

                            goto LABEL_17;
                          }
                          v79 = [v6 loginConfiguration];
                          v84 = [v79 previousRefreshTokenClaimName];
                          v106 = v84;
                          v85 = [v6 refreshToken];
                          v107 = v85;
                          id v86 = [NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
                          [(POMutableLoginJWTBody *)v21 addCustomClaims:v86];
                        }
                        goto LABEL_62;
                      }
                    }
                    else
                    {

                      if (!v59) {
                        goto LABEL_57;
                      }
                    }
                    id v60 = objc_alloc_init(MEMORY[0x263EFF980]);
                    id v61 = [v6 deviceConfiguration];
                    id v62 = [v61 administratorGroups];
                    [v60 addObjectsFromArray:v62];

                    uint64_t v63 = [v6 deviceConfiguration];
                    id v64 = [v63 authorizationGroups];
                    id v65 = [v64 allValues];
                    [v60 addObjectsFromArray:v65];

                    v55 = v60;
                    id v66 = [v6 deviceConfiguration];
                    id v67 = [v66 otherGroups];
                    [v60 addObjectsFromArray:v67];

                    v102 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v60];
                    uint64_t v68 = [v102 array];
                    v69 = [v6 loginConfiguration];
                    v70 = [v69 groupRequestClaimName];

                    if (v70)
                    {
                      v71 = [v6 loginConfiguration];
                      id v72 = [v71 groupRequestClaimName];
                      v116 = v72;
                      uint64_t v117 = v68;
                      id v73 = [NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
                      [(POMutableLoginJWTBody *)v21 addCustomClaims:v73];
                    }
                    else
                    {
                      v114 = @"claims";
                      v112 = @"id_token";
                      uint64_t v109 = v68;
                      v110 = @"groups";
                      v108 = @"values";
                      v71 = [NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
                      v111 = v71;
                      id v72 = [NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
                      v113 = v72;
                      id v73 = [NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
                      v115 = v73;
                      id v77 = [NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
                      [(POMutableLoginJWTBody *)v21 addCustomClaims:v77];
                    }
                    id v76 = (void *)v68;
                    uint64_t v40 = (uint64_t)v102;
LABEL_56:

                    goto LABEL_57;
                  }
                }
                else
                {
                  uint64_t v103 = v40;
                  v100 = v55;
                  id v74 = [v6 deviceConfiguration];
                  id v75 = [v74 authorizationGroups];
                  if ([v75 count])
                  {
                    BOOL v59 = 1;
                  }
                  else
                  {
                    v99 = [v6 deviceConfiguration];
                    uint64_t v98 = [v99 otherGroups];
                    BOOL v59 = [v98 count] != 0;
                  }
                  v55 = v100;
                  uint64_t v40 = v103;
                  if ((v104 & 1) == 0) {
                    goto LABEL_44;
                  }
                }

                goto LABEL_44;
              }
              id v54 = &unk_2707DBC88;
            }
            [(POMutableLoginJWTBody *)v21 setAmr:v54];
            goto LABEL_37;
          }
LABEL_15:
          id v44 = __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke_545();
          goto LABEL_16;
        }
      }
    }

    goto LABEL_15;
  }
  id v11 = __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke_539();
LABEL_16:
  id v45 = 0;
LABEL_17:

  return v45;
}

id __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Missing password or assertion."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke_539()
{
  v0 = +[POError errorWithCode:-1001 description:@"unable to use both password and assertion."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke_545()
{
  v0 = +[POError errorWithCode:-1001 description:@"Missing required values."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)addCryptoHeadersToJWTBody:(id)a3 context:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [v5 deviceConfiguration];
  uint64_t v8 = [v7 encryptionAlgorithm];
  int v9 = [v8 isEqualToNumber:0x2707DBB50];

  if (v9)
  {
    id v26 = @"jwe_crypto";
    v24[0] = @"alg";
    v24[1] = @"enc";
    v25[0] = @"ECDH-ES";
    v25[1] = @"A256GCM";
    v24[2] = @"apv";
    id v10 = [v5 apv];
    void v25[2] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
    v27[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    [v6 addCustomClaims:v12];
  }
  else
  {
    id v13 = [v5 deviceConfiguration];
    uint64_t v14 = [v13 encryptionAlgorithm];
    id v10 = +[POJWTEncryption algorithmWithEncryptionAlgorithm:v14];

    uint64_t v15 = [v5 deviceConfiguration];
    id v11 = SecKeyCopyExternalRepresentation((SecKeyRef)[v15 deviceEncryptionPublicKey], 0);

    id v12 = objc_msgSend(v11, "psso_sha256Hash");
    uint64_t v16 = [v12 base64EncodedStringWithOptions:0];
    rsize_t v17 = [v10 algValue];
    v21[2] = v16;
    BOOL v22 = @"jwe_crypto";
    v20[0] = @"alg";
    v20[1] = @"enc";
    v21[0] = v17;
    v21[1] = @"dir";
    v20[2] = @"kid";
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    id v23 = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v6 addCustomClaims:v19];

    id v6 = (id)v16;
  }
}

- (id)createLoginRequestWithContext:(id)a3 jwt:(id)a4
{
  v48[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x263F089E0];
  id v7 = a4;
  id v8 = [v6 alloc];
  int v9 = [v5 loginConfiguration];
  id v10 = [v9 tokenEndpointURL];
  id v11 = (void *)[v8 initWithURL:v10 cachePolicy:4 timeoutInterval:30.0];

  [v11 setHTTPMethod:@"POST"];
  [v11 addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
  id v12 = [v5 deviceConfiguration];
  id v13 = [v12 sdkVersionString];
  uint64_t v14 = [v13 compare:&unk_2707DBCD0];

  if (v14 == -1) {
    uint64_t v15 = @"application/json";
  }
  else {
    uint64_t v15 = @"application/platformsso-login-response+jwt";
  }
  [v11 addValue:v15 forHTTPHeaderField:@"Accept"];
  uint64_t v16 = [v5 requestIdentifier];
  [v11 addValue:v16 forHTTPHeaderField:@"client-request-id"];

  id v17 = objc_alloc_init(MEMORY[0x263F08BA0]);
  uint64_t v18 = [MEMORY[0x263F08BD0] queryItemWithName:@"platform_sso_version" value:@"1.0"];
  v48[0] = v18;
  uint64_t v19 = [MEMORY[0x263F08BD0] queryItemWithName:@"grant_type" value:@"urn:ietf:params:oauth:grant-type:jwt-bearer"];
  v48[1] = v19;
  BOOL v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];

  if ([v5 loginType] == 100
    && ([v5 loginConfiguration],
        id v21 = objc_claimAutoreleasedReturnValue(),
        [v21 customRefreshRequestValues],
        BOOL v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        v21,
        v22))
  {
    id v23 = [v5 loginConfiguration];
    uint64_t v24 = [v23 customRefreshRequestValues];
  }
  else
  {
    id v25 = [v5 loginConfiguration];
    id v26 = [v25 customLoginRequestValues];

    if (!v26) {
      goto LABEL_10;
    }
    id v23 = [v5 loginConfiguration];
    uint64_t v24 = [v23 customLoginRequestValues];
  }
  uint64_t v27 = (void *)v24;
  uint64_t v28 = [v20 arrayByAddingObjectsFromArray:v24];

  BOOL v20 = (void *)v28;
LABEL_10:
  [v17 setQueryItems:v20];
  uint64_t v29 = [v17 percentEncodedQuery];
  id v30 = [v29 dataUsingEncoding:4];
  id v31 = (void *)[v30 mutableCopy];

  uint64_t v32 = [v5 deviceConfiguration];
  uint64_t v33 = [v32 sdkVersionString];
  uint64_t v34 = [v33 compare:&unk_2707DBCD0];

  if (v34 == -1) {
    double v35 = @"request";
  }
  else {
    double v35 = @"assertion";
  }
  double v36 = [v5 loginConfiguration];
  uint64_t v37 = [v36 customRequestJWTParameterName];
  uint64_t v38 = [v37 length];

  if (v38)
  {
    id v39 = [v5 loginConfiguration];
    double v35 = [v39 customRequestJWTParameterName];
  }
  CFAllocatorRef v40 = (const __CFAllocator *)SecCFAllocatorZeroize();
  uint64_t v41 = (__CFString *)CFStringCreateWithFormat(v40, 0, @"&%@=%@", v35, v7);

  if (v41)
  {
    CFAllocatorRef v42 = (const __CFAllocator *)SecCFAllocatorZeroize();
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v42, v41, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      [v31 appendData:ExternalRepresentation];
      [v11 setHTTPBody:v31];
      id v44 = v11;
    }
    else
    {
      id v46 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
      id v44 = 0;
    }
  }
  else
  {
    id v45 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
    id v44 = 0;
  }

  return v44;
}

id __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)performLoginRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v8 requestIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v28 = v12;
    _os_log_impl(&dword_259DFE000, v11, OS_LOG_TYPE_INFO, "Sending login request: %{public}@", buf, 0xCu);
  }
  id v13 = [v8 urlSession];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  BOOL v22 = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke;
  id v23 = &unk_265463B70;
  id v25 = v8;
  id v26 = v9;
  uint64_t v24 = self;
  id v14 = v8;
  id v15 = v9;
  uint64_t v16 = [v13 dataTaskWithRequest:v10 completionHandler:&v20];

  id v17 = NSString;
  uint64_t v18 = [v14 requestIdentifier];
  uint64_t v19 = [v17 stringWithFormat:@"Login Request: %@", v18, v20, v21, v22, v23, v24];
  [v16 setTaskDescription:v19];

  [v16 resume];
}

void __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_INFO, "Login response received", buf, 2u);
  }

  if (v9)
  {
    if (v7) {
      id v11 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    }
    else {
      id v11 = 0;
    }
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_645;
    void v70[3] = &unk_265463A00;
    id v71 = v9;
    id v72 = v11;
    id v15 = v11;
    id v16 = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_645((uint64_t)v70);
    id v17 = [a1[4] completionQueue];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_649;
    v67[3] = &unk_265463B98;
    id v69 = a1[6];
    id v68 = a1[5];
    [v17 addOperationWithBlock:v67];

    uint64_t v18 = v71;
    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v12 = +[POCoreConfigurationUtil platformSSODevModeEnabled];
    id v13 = PO_LOG_POAuthenticationProcess();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v14) {
        __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_cold_1();
      }
    }
    else if (v14)
    {
      __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_cold_2();
    }

    id v15 = v8;
    if ([v15 statusCode] >= 200 && objc_msgSend(v15, "statusCode") < 300)
    {
      id v39 = [a1[4] completionQueue];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_4;
      v42[3] = &unk_265463C60;
      uint64_t v21 = &v45;
      id v45 = a1[6];
      id v43 = a1[5];
      id v44 = v7;
      [v39 addOperationWithBlock:v42];

      id v29 = v43;
    }
    else
    {
      uint64_t v59 = MEMORY[0x263EF8330];
      uint64_t v60 = 3221225472;
      id v61 = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_656;
      id v62 = &unk_265463860;
      uint64_t v21 = &v63;
      id v22 = v15;
      id v63 = v22;
      id v23 = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_656();
      if ([v22 statusCode] == 401
        && ([a1[5] loginConfiguration],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            [v24 invalidCredentialPredicate],
            id v25 = objc_claimAutoreleasedReturnValue(),
            v25,
            v24,
            !v25))
      {
        CFAllocatorRef v40 = [a1[4] completionQueue];
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_660;
        v56[3] = &unk_265463B98;
        id v58 = a1[6];
        id v57 = a1[5];
        [v40 addOperationWithBlock:v56];

        id v29 = v58;
      }
      else
      {
        if ([v22 statusCode] == 400 || objc_msgSend(v22, "statusCode") == 401)
        {
          id v26 = [a1[5] loginConfiguration];
          uint64_t v27 = [v26 invalidCredentialPredicate];

          if (v7)
          {
            if (v27)
            {
              id v55 = 0;
              uint64_t v28 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:16 error:&v55];
              id v29 = v55;
              id v30 = (void *)MEMORY[0x263F08A98];
              id v31 = [a1[5] loginConfiguration];
              uint64_t v32 = [v31 invalidCredentialPredicate];
              uint64_t v33 = [v30 predicateWithFormat:v32];

              LODWORD(v31) = [v33 evaluateWithObject:v28];
              if (v31)
              {
                uint64_t v34 = PO_LOG_POAuthenticationProcess();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_259DFE000, v34, OS_LOG_TYPE_INFO, "Credentials are not correct", buf, 2u);
                }

                if ([a1[5] loginType] == 2 || objc_msgSend(a1[5], "loginType") == 3)
                {
                  double v35 = [a1[4] completionQueue];
                  v52[0] = MEMORY[0x263EF8330];
                  v52[1] = 3221225472;
                  v52[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_665;
                  v52[3] = &unk_265463B98;
                  double v36 = &v54;
                  id v54 = a1[6];
                  uint64_t v37 = &v53;
                  id v53 = a1[5];
                  uint64_t v38 = v52;
                }
                else
                {
                  double v35 = [a1[4] completionQueue];
                  v49[0] = MEMORY[0x263EF8330];
                  v49[1] = 3221225472;
                  v49[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_2_666;
                  v49[3] = &unk_265463B98;
                  double v36 = &v51;
                  id v51 = a1[6];
                  uint64_t v37 = &v50;
                  id v50 = a1[5];
                  uint64_t v38 = v49;
                }
                [v35 addOperationWithBlock:v38];

                uint64_t v21 = &v63;
                goto LABEL_35;
              }

              uint64_t v21 = &v63;
            }
          }
        }
        uint64_t v41 = [a1[4] completionQueue];
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_3;
        v46[3] = &unk_265463B98;
        id v48 = a1[6];
        id v47 = a1[5];
        [v41 addOperationWithBlock:v46];

        id v29 = v48;
      }
    }
LABEL_35:

    uint64_t v18 = *v21;
LABEL_36:

    goto LABEL_37;
  }
  id v19 = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_2();
  uint64_t v20 = [a1[4] completionQueue];
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_655;
  v64[3] = &unk_265463B98;
  id v66 = a1[6];
  id v65 = a1[5];
  [v20 addOperationWithBlock:v64];

  id v15 = v66;
LABEL_37:
}

id __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_645(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1009 underlyingError:*(void *)(a1 + 32) description:@"Failed to login."];
  v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231_cold_1();
  }

  return v1;
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_649(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 5, *(void *)(a1 + 32), 0);
}

id __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1009 description:@"Not HTTP response for login."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_655(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 3, *(void *)(a1 + 32), 0);
}

id __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_656()
{
  v0 = +[POError errorWithCode:-1009 description:@"Login request failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244_cold_1();
  }

  return v0;
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_660(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 4, *(void *)(a1 + 32), 0);
}

id __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_2_661()
{
  v0 = +[POError errorWithCode:-1001 description:@"Exception when evaluating invalidCredentialPredicate: %{public}@"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_665(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 2, *(void *)(a1 + 32), 0);
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_2_666(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 4, *(void *)(a1 + 32), 0);
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 3, *(void *)(a1 + 32), 0);
}

uint64_t __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

- (void)retrieveSigningKeyWithContext:(id)a3 keyId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 jwksStorageProvider];
  BOOL v12 = [v8 deviceConfiguration];
  id v13 = [v12 extensionIdentifier];
  BOOL v14 = [v11 jwksCacheForExtensionIdentifier:v13];

  if (v14
    && ([v8 loginConfiguration],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v15 jwksTrustedRootCertificates],
        id v16 = objc_claimAutoreleasedReturnValue(),
        id v17 = [(POAuthenticationProcess *)self findKey:v9 inJWKSData:v14 rootCertificates:v16], v16, v15, v17))
  {
    uint64_t v18 = PO_LOG_POAuthenticationProcess();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[POAuthenticationProcess retrieveSigningKeyWithContext:keyId:completion:]();
    }

    id v19 = [(POAuthenticationProcess *)self completionQueue];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke;
    v45[3] = &unk_265463C10;
    id v46 = v10;
    id v47 = v17;
    id v20 = v10;
    [v19 addOperationWithBlock:v45];

    uint64_t v21 = v46;
  }
  else
  {
    id v22 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, v8);

    uint64_t v24 = PO_LOG_POAuthenticationProcess();
    id v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PlatformSSO_JWKSRequest", " enableTelemetry=YES ", buf, 2u);
    }

    id v26 = [v8 urlSession];
    uint64_t v27 = [v8 loginConfiguration];
    uint64_t v28 = [v27 jwksEndpointURL];
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    uint64_t v37 = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_670;
    uint64_t v38 = &unk_265463CB0;
    id v42 = v10;
    os_signpost_id_t v43 = v23;
    id v39 = self;
    id v29 = v8;
    id v40 = v29;
    id v41 = v9;
    id v30 = v10;
    id v31 = [v26 dataTaskWithURL:v28 completionHandler:&v35];

    uint64_t v32 = NSString;
    uint64_t v33 = [v29 requestIdentifier];
    uint64_t v34 = [v32 stringWithFormat:@"JWKS Request: %@", v33, v35, v36, v37, v38, v39];
    [v31 setTaskDescription:v34];

    [v31 resume];
    uint64_t v21 = v42;
  }
}

uint64_t __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_670(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_INFO, "JWKS network response received", buf, 2u);
  }

  if (v9)
  {
    if (v7) {
      id v11 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    }
    else {
      id v11 = 0;
    }
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_671;
    v57[3] = &unk_265463A00;
    id v58 = v9;
    id v59 = v11;
    id v12 = v11;
    id v20 = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_671((uint64_t)v57);
    uint64_t v21 = PO_LOG_POAuthenticationProcess();
    id v22 = v21;
    os_signpost_id_t v23 = *(void *)(a1 + 64);
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PlatformSSO_JWKSRequest", "error", buf, 2u);
    }

    uint64_t v24 = [*(id *)(a1 + 32) completionQueue];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_675;
    v55[3] = &unk_265463B48;
    id v56 = *(id *)(a1 + 56);
    [v24 addOperationWithBlock:v55];

    id v25 = v58;
LABEL_29:

    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    if ([v12 statusCode] >= 200 && objc_msgSend(v12, "statusCode") < 300)
    {
      id v31 = PO_LOG_POAuthenticationProcess();
      uint64_t v32 = v31;
      os_signpost_id_t v33 = *(void *)(a1 + 64);
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_259DFE000, v32, OS_SIGNPOST_INTERVAL_END, v33, "PlatformSSO_JWKSRequest", "success", buf, 2u);
      }

      uint64_t v34 = PO_LOG_POAuthenticationProcess();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_670_cold_1();
      }

      uint64_t v35 = [*(id *)(a1 + 40) jwksStorageProvider];
      uint64_t v36 = [*(id *)(a1 + 40) deviceConfiguration];
      uint64_t v37 = [v36 extensionIdentifier];
      [v35 setJwksCache:v7 forExtensionIdentifier:v37];

      uint64_t v38 = [*(id *)(a1 + 32) completionQueue];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_687;
      v41[3] = &unk_265463C88;
      id v13 = &v45;
      id v39 = *(id *)(a1 + 56);
      uint64_t v40 = *(void *)(a1 + 32);
      id v45 = v39;
      void v41[4] = v40;
      id v42 = *(id *)(a1 + 48);
      id v43 = v7;
      id v44 = *(id *)(a1 + 40);
      [v38 addOperationWithBlock:v41];

      id v19 = v42;
    }
    else
    {
      uint64_t v48 = MEMORY[0x263EF8330];
      uint64_t v49 = 3221225472;
      id v50 = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_2_682;
      id v51 = &unk_265463860;
      id v13 = &v52;
      id v52 = v12;
      id v14 = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_2_682();
      id v15 = PO_LOG_POAuthenticationProcess();
      id v16 = v15;
      os_signpost_id_t v17 = *(void *)(a1 + 64);
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_259DFE000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PlatformSSO_JWKSRequest", "Failed", buf, 2u);
      }

      uint64_t v18 = [*(id *)(a1 + 32) completionQueue];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_686;
      v46[3] = &unk_265463B48;
      id v47 = *(id *)(a1 + 56);
      [v18 addOperationWithBlock:v46];

      id v19 = v47;
    }

    id v25 = *v13;
    goto LABEL_29;
  }
  id v26 = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_2();
  uint64_t v27 = PO_LOG_POAuthenticationProcess();
  uint64_t v28 = v27;
  os_signpost_id_t v29 = *(void *)(a1 + 64);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_259DFE000, v28, OS_SIGNPOST_INTERVAL_END, v29, "PlatformSSO_JWKSRequest", "Failed", buf, 2u);
  }

  id v30 = [*(id *)(a1 + 32) completionQueue];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_681;
  v53[3] = &unk_265463B48;
  id v54 = *(id *)(a1 + 56);
  [v30 addOperationWithBlock:v53];

  id v12 = v54;
LABEL_30:
}

id __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_671(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1009 underlyingError:*(void *)(a1 + 32) description:@"Failed to retrieve JWKS."];
  v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231_cold_1();
  }

  return v1;
}

uint64_t __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_675(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1009 description:@"Not HTTP response for JWKS."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_681(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_2_682()
{
  v0 = +[POError errorWithCode:-1009 description:@"JWKS request failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244_cold_1();
  }

  return v0;
}

uint64_t __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_686(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_687(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  id v6 = [*(id *)(a1 + 56) loginConfiguration];
  id v5 = [v6 jwksTrustedRootCertificates];
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, [v1 findKey:v2 inJWKSData:v3 rootCertificates:v5]);
}

- (__SecKey)findKey:(id)a3 inJWKSData:(id)a4 rootCertificates:(id)a5
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v129 = 0;
  id v9 = [MEMORY[0x263F08900] JSONObjectWithData:a4 options:16 error:&v129];
  id v10 = v129;
  id v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    v127[0] = MEMORY[0x263EF8330];
    v127[1] = 3221225472;
    v127[2] = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke;
    v127[3] = &unk_265463860;
    id v128 = v10;
    id v13 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke((uint64_t)v127);
    RSAPublicKey = 0;
    id v15 = v128;
    goto LABEL_62;
  }
  id v81 = v10;
  v79 = v9;
  [v9 objectForKeyedSubscript:@"keys"];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v123 objects:v133 count:16];
  id v80 = v16;
  if (!v17) {
    goto LABEL_14;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v124;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v124 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v21 = *(void **)(*((void *)&v123 + 1) + 8 * i);
      id v22 = [v21 objectForKeyedSubscript:@"kid"];
      if ([v22 isEqualToString:v7])
      {
        id v23 = v21;

        if (!v23) {
          goto LABEL_36;
        }
        uint64_t v24 = [v23 objectForKeyedSubscript:@"kty"];
        id v25 = [v23 objectForKeyedSubscript:@"x5c"];
        objc_opt_class();
        id v11 = v81;
        v78 = v7;
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v25 count])
        {
          if (![v8 count])
          {
LABEL_33:
            uint64_t v36 = [v23 objectForKeyedSubscript:@"x5c"];
            uint64_t v37 = [v36 firstObject];

            id v77 = (void *)v37;
            CFDataRef v38 = (const __CFData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v37 options:1];
            if (v38)
            {
              id v39 = SecCertificateCreateWithData(0, v38);
              id v9 = v79;
              if (v39)
              {
                uint64_t v40 = v39;
                RSAPublicKey = SecCertificateCopyKey(v39);
                CFRelease(v40);
              }
              else
              {
                RSAPublicKey = 0;
              }
            }
            else
            {
              uint64_t v104 = MEMORY[0x263EF8330];
              uint64_t v105 = 3221225472;
              v106 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_711;
              v107 = &unk_265463860;
              id v108 = v78;
              id v66 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_711();

              RSAPublicKey = 0;
              id v9 = v79;
            }

            goto LABEL_59;
          }
          id v71 = v24;
          id v76 = v8;
          id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v114 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          id v74 = v25;
          id v27 = v25;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v114 objects:v132 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v115;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v115 != v30) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v32 = *(void *)(*((void *)&v114 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  os_signpost_id_t v33 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v32 options:1];
                  if (v33)
                  {
                    uint64_t v34 = +[POSecKeyHelper certificateForData:v33];
                    if (v34)
                    {
                      uint64_t v35 = v34;
                      [v26 addObject:v34];
                    }
                  }
                }
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v114 objects:v132 count:16];
            }
            while (v29);
          }

          id v8 = v76;
          if (+[POSecKeyHelper evaluateTrustForCertificates:v26 rootCertificates:v76])
          {

            id v11 = v81;
            uint64_t v24 = v71;
            id v25 = v74;
            goto LABEL_33;
          }
          uint64_t v109 = MEMORY[0x263EF8330];
          uint64_t v110 = 3221225472;
          v111 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_707;
          v112 = &unk_265463860;
          id v113 = v78;
          id v65 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_707();

          RSAPublicKey = 0;
          id v9 = v79;
          id v11 = v81;
          uint64_t v24 = v71;
          id v25 = v74;
LABEL_60:

          id v7 = v78;
          goto LABEL_61;
        }
        if ([v8 count])
        {
          uint64_t v99 = MEMORY[0x263EF8330];
          uint64_t v100 = 3221225472;
          v101 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_715;
          v102 = &unk_265463860;
          id v103 = v7;
          id v42 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_715();
          RSAPublicKey = 0;
          id v26 = v103;
          id v9 = v79;
          goto LABEL_60;
        }
        if ([v24 isEqualToString:@"EC"])
        {
          id v72 = v24;
          id v75 = v25;
          id v43 = objc_alloc(MEMORY[0x263EFF8F8]);
          id v44 = [v23 objectForKeyedSubscript:@"x"];
          uint64_t v45 = objc_msgSend(v43, "psso_initWithBase64URLEncodedString:", v44);

          id v46 = objc_alloc(MEMORY[0x263EFF8F8]);
          id v47 = [v23 objectForKeyedSubscript:@"y"];
          uint64_t v48 = objc_msgSend(v46, "psso_initWithBase64URLEncodedString:", v47);

          id v49 = objc_alloc_init(MEMORY[0x263EFF990]);
          int v98 = 4;
          [v49 appendBytes:&v98 length:1];
          id v77 = (void *)v45;
          [v49 appendData:v45];
          [v49 appendData:v48];
          uint64_t v50 = *MEMORY[0x263F16FB8];
          uint64_t v51 = *MEMORY[0x263F16F68];
          v130[0] = *MEMORY[0x263F16FA8];
          v130[1] = v51;
          uint64_t v52 = *MEMORY[0x263F16F80];
          v131[0] = v50;
          v131[1] = v52;
          CFDictionaryRef v53 = [NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:2];
          error[0] = 0;
          RSAPublicKey = SecKeyCreateWithData((CFDataRef)v49, v53, error);
          id v9 = v79;
          if (!RSAPublicKey)
          {
            v93[0] = MEMORY[0x263EF8330];
            v93[1] = 3221225472;
            v94 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_728;
            id v95 = &unk_265463CD8;
            CFErrorRef v97 = error[0];
            id v96 = v78;
            id v54 = v94((uint64_t)v93);
          }
          uint64_t v24 = v72;
          id v25 = v75;
          goto LABEL_59;
        }
        id v9 = v79;
        if (![v24 isEqualToString:@"RSA"])
        {
          id v82 = v7;
          id v67 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_753();
          RSAPublicKey = 0;
          id v26 = v82;
          goto LABEL_60;
        }
        uint64_t v55 = [v23 objectForKeyedSubscript:@"n"];
        uint64_t v56 = [v23 objectForKeyedSubscript:@"e"];
        id v77 = (void *)v55;
        id v73 = (void *)v56;
        if (v55 && (uint64_t v57 = v56) != 0)
        {
          id v58 = objc_alloc(MEMORY[0x263EFF8F8]);
          id v59 = objc_msgSend(v58, "psso_initWithBase64URLEncodedString:", v55);

          id v60 = objc_alloc(MEMORY[0x263EFF8F8]);
          id v61 = objc_msgSend(v60, "psso_initWithBase64URLEncodedString:", v57);

          if (v59 && v61)
          {
            id v62 = v59;
            error[0] = (CFErrorRef)[v62 bytes];
            error[1] = (CFErrorRef)[v62 length];
            id v63 = v61;
            error[2] = (CFErrorRef)[v63 bytes];
            error[3] = (CFErrorRef)[v63 length];
            RSAPublicKey = (__SecKey *)SecKeyCreateRSAPublicKey();

            if (RSAPublicKey)
            {
LABEL_58:

LABEL_59:
              id v26 = v77;
              goto LABEL_60;
            }
            v83[0] = MEMORY[0x263EF8330];
            v83[1] = 3221225472;
            v83[2] = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_749;
            v83[3] = &unk_265463CD8;
            uint64_t v85 = 0;
            id v84 = v78;
            id v64 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_749((uint64_t)v83);
            id v59 = v84;
          }
          else
          {
            error[4] = (CFErrorRef)MEMORY[0x263EF8330];
            error[5] = (CFErrorRef)3221225472;
            error[6] = (CFErrorRef)__63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_741;
            error[7] = (CFErrorRef)&unk_265463860;
            id v92 = v78;
            id v69 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_741();
          }
        }
        else
        {
          uint64_t v86 = MEMORY[0x263EF8330];
          uint64_t v87 = 3221225472;
          uint64_t v88 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_745;
          v89 = &unk_265463860;
          id v90 = v78;
          id v68 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_745();
          id v59 = v90;
        }

        RSAPublicKey = 0;
        goto LABEL_58;
      }
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v123 objects:v133 count:16];
    if (v18) {
      continue;
    }
    break;
  }
LABEL_14:

LABEL_36:
  uint64_t v118 = MEMORY[0x263EF8330];
  uint64_t v119 = 3221225472;
  v120 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_697;
  v121 = &unk_265463860;
  id v122 = v7;
  id v41 = __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_697();
  RSAPublicKey = 0;
  id v23 = v122;
  id v9 = v79;
  id v11 = v81;
LABEL_61:

  id v15 = v80;
LABEL_62:

  return RSAPublicKey;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1008 underlyingError:*(void *)(a1 + 32) description:@"Failed to parse jwks response."];
  uint64_t v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_697()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to find key"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_707()
{
  v0 = +[POError errorWithCode:-1001 description:@"Trust evaluation failed for kid."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_711()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create key."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_715()
{
  v0 = +[POError errorWithCode:-1001 description:@"required certificates missing from jwks for kid."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_728(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  uint64_t v2 = +[POError errorWithCode:-1008 underlyingError:v1 description:@"Failed to create EC key."];

  uint64_t v3 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v2;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_741()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to create RSA key."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_745()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create RSA key, Modulus or exponent missing."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_749(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  uint64_t v2 = +[POError errorWithCode:-1001 underlyingError:v1 description:@"Failed to create key"];

  uint64_t v3 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v2;
}

id __63__POAuthenticationProcess_findKey_inJWKSData_rootCertificates___block_invoke_753()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to load key."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

- (BOOL)validateIdToken:(id)a3 context:(id)a4 key:(__SecKey *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = PO_LOG_PODiagnostics();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v9, OS_LOG_TYPE_INFO, "Verifying id_token", buf, 2u);
  }

  id v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess validateIdToken:context:key:]();
  }

  id v11 = [v7 decodedHeader];
  BOOL v12 = [v11 alg];
  char v13 = [&unk_2707DBCB8 containsObject:v12];

  if ((v13 & 1) == 0)
  {
    id v78 = v7;
    id v24 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke();

    goto LABEL_11;
  }
  id v14 = [v7 decodedHeader];
  id v15 = [v14 alg];
  LODWORD(a5) = +[POJWTSigning verifyJWTSignature:v7 algorithm:v15 key:a5];

  if (a5)
  {
    id v16 = [v7 decodedBody];
    uint64_t v17 = [v16 nonce];
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      uint64_t v19 = [v7 decodedBody];
      id v20 = [v19 nonce];
      uint64_t v21 = [v8 nonce];
      char v22 = [v20 isEqualToString:v21];

      if ((v22 & 1) == 0)
      {
        id v23 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_763();
LABEL_11:
        LOBYTE(a5) = 0;
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v26 = [v7 decodedBody];
    id v27 = [v26 iss];
    uint64_t v28 = [v8 loginConfiguration];
    uint64_t v29 = [v28 issuer];
    char v30 = [v27 isEqualToString:v29];

    if ((v30 & 1) == 0)
    {
      id v42 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_769();
      goto LABEL_11;
    }
    id v31 = [v7 decodedBody];
    uint64_t v32 = [v31 audArray];

    os_signpost_id_t v33 = [v7 decodedBody];
    uint64_t v34 = v33;
    if (v32)
    {
      uint64_t v35 = [v33 audArray];
      uint64_t v36 = [v8 loginConfiguration];
      uint64_t v37 = [v36 clientID];
      char v38 = [v35 containsObject:v37];

      if ((v38 & 1) == 0)
      {
        id v56 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_775();
        goto LABEL_11;
      }
      id v39 = [v7 decodedBody];
      uint64_t v40 = [v39 azp];

      if (!v40)
      {
        id v41 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_781();
        goto LABEL_11;
      }
    }
    else
    {
      id v43 = [v33 aud];
      id v44 = [v8 loginConfiguration];
      uint64_t v45 = [v44 clientID];
      char v46 = [v43 isEqualToString:v45];

      if ((v46 & 1) == 0)
      {
        id v57 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_787();
        goto LABEL_11;
      }
    }
    id v47 = [v7 decodedBody];
    uint64_t v48 = [v47 azp];
    if (v48)
    {
      id v49 = (void *)v48;
      uint64_t v50 = [v7 decodedBody];
      uint64_t v51 = [v50 azp];
      uint64_t v52 = [v8 loginConfiguration];
      CFDictionaryRef v53 = [v52 clientID];
      char v54 = [v51 isEqualToString:v53];

      if ((v54 & 1) == 0)
      {
        id v55 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_793();
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v58 = [v7 decodedBody];
    id v59 = [v58 iat];
    [v59 timeIntervalSinceNow];
    double v61 = v60;

    id v62 = [v7 decodedBody];
    id v63 = [v62 iat];

    if (!v63 || v61 > 120.0)
    {
      id v76 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_799();
      goto LABEL_11;
    }
    id v64 = [v7 decodedBody];
    id v65 = [v64 exp];
    [v65 timeIntervalSinceNow];
    double v67 = v66;

    id v68 = [v7 decodedBody];
    id v69 = [v68 exp];

    if (!v69 || v67 < -120.0)
    {
      id v77 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_803();
      goto LABEL_11;
    }
    v70 = [v7 decodedBody];
    id v71 = [v70 nbf];
    [v71 timeIntervalSinceNow];
    double v73 = v72;

    a5 = [v7 decodedBody];
    id v74 = [(__SecKey *)a5 nbf];

    LOBYTE(a5) = 1;
    if (v74 && v73 > 120.0)
    {
      id v75 = __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_807();
      goto LABEL_11;
    }
  }
LABEL_12:

  return (char)a5;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"unsupported id_token algorithm."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_cold_1();
  }

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_763()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to match nonce."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_769()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to match issuer."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_775()
{
  v0 = +[POError errorWithCode:-1008 description:@"audience does not contain client id."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_781()
{
  v0 = +[POError errorWithCode:-1008 description:@"azp claim missing."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_787()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to match audience."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_793()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to match azp."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_799()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to verify iat."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_361_cold_1();
  }

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_803()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to verify exp."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_361_cold_1();
  }

  return v0;
}

id __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_807()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to verify nbf."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_361_cold_1();
  }

  return v0;
}

- (BOOL)validatePartyUInfo:(id)a3 context:(id)a4
{
  id v4 = a3;
  id v5 = [v4 decodedHeader];
  id v6 = [v5 apu];

  if (v6)
  {
    id v7 = (__SecKey *)[v4 decodeEphemeralPublicKey];
    if (v7)
    {
      CFErrorRef error = 0;
      CFDataRef v8 = SecKeyCopyExternalRepresentation(v7, &error);
      if (!v8)
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        void v30[2] = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_822;
        v30[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v30[4] = error;
        id v17 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_822((uint64_t)v30);
        char v16 = 0;
LABEL_19:

        goto LABEL_20;
      }
      id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
      id v10 = [v4 decodedHeader];
      id v11 = [v10 apu];
      BOOL v12 = objc_msgSend(v9, "psso_initWithBase64URLEncodedString:", v11);

      if (v12)
      {
        unsigned int v29 = 0;
        if ((unint64_t)[v12 length] > 3)
        {
          objc_msgSend(v12, "getBytes:range:", &v29, 0, 4);
          uint64_t v19 = bswap32(v29);
          unsigned int v28 = 0;
          unsigned int v29 = v19;
          uint64_t v20 = v19 + 8;
          if ([v12 length] >= (unint64_t)(v19 + 8))
          {
            objc_msgSend(v12, "getBytes:range:", &v28, v19 + 4, 4);
            uint64_t v22 = bswap32(v28);
            unsigned int v28 = v22;
            if ([(__CFData *)v8 length] == v22)
            {
              unint64_t v23 = [v12 length];
              if (v23 >= v20 + (unint64_t)v28)
              {
                id v26 = [v12 subdataWithRange:v20];
                char v16 = [(__CFData *)v8 isEqualToData:v26];
                if ((v16 & 1) == 0) {
                  id v27 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_850();
                }

                goto LABEL_18;
              }
            }
            id v24 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_844();
          }
          else
          {
            id v21 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_838();
          }
        }
        else
        {
          id v13 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_832();
        }
      }
      else
      {
        id v18 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_826();
      }
      char v16 = 0;
LABEL_18:

      goto LABEL_19;
    }
    id v15 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_816();
  }
  else
  {
    id v14 = __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke();
  }
  char v16 = 0;
LABEL_20:

  return v16;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"response missing apu."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_816()
{
  v0 = +[POError errorWithCode:-1008 description:@"response missing epk."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_822(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = +[POError errorWithCode:-1008 underlyingError:v1 description:@"error with SecKeyCopyExternalRepresentation for epk."];

  uint64_t v3 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_826()
{
  v0 = +[POError errorWithCode:-1008 description:@"error decoding apu."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_832()
{
  v0 = +[POError errorWithCode:-1008 description:@"failed to validate apu length."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_838()
{
  v0 = +[POError errorWithCode:-1008 description:@"failed to validate apu size."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_844()
{
  v0 = +[POError errorWithCode:-1008 description:@"failed to validate apu epk size."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __54__POAuthenticationProcess_validatePartyUInfo_context___block_invoke_850()
{
  v0 = +[POError errorWithCode:-1008 description:@"failed to validate apu epk."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (BOOL)validatePartyVInfo:(id)a3 context:(id)a4 publicKey:(__SecKey *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    unsigned int v32 = 0;
    id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
    id v10 = objc_msgSend(v9, "psso_initWithBase64URLEncodedString:", v7);

    if (!v10)
    {
      id v17 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_861();
      char v16 = 0;
LABEL_20:

      goto LABEL_21;
    }
    CFErrorRef error = 0;
    CFDataRef v11 = SecKeyCopyExternalRepresentation(a5, &error);
    if (!v11)
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      void v30[2] = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_867;
      v30[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v30[4] = error;
      id v18 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_867((uint64_t)v30);
      char v16 = 0;
LABEL_19:

      goto LABEL_20;
    }
    BOOL v12 = [v8 nonce];
    id v13 = [v12 dataUsingEncoding:1];

    if (v13)
    {
      unsigned int v32 = 0;
      if ((unint64_t)[v10 length] > 3)
      {
        objc_msgSend(v10, "getBytes:range:", &v32, 0, 4);
        uint64_t v20 = bswap32(v32);
        unsigned int v32 = v20;
        uint64_t v21 = v20 + 4;
        id v22 = objc_alloc_init(MEMORY[0x263EFF990]);
        unsigned int v29 = bswap32([(__CFData *)v11 length]);
        [v22 appendBytes:&v29 length:4];
        [v22 appendData:v11];
        unsigned int v28 = bswap32([v13 length]);
        [v22 appendBytes:&v28 length:4];
        [v22 appendData:v13];
        unint64_t v23 = [v10 length];
        if (v23 >= [v22 length] + v21)
        {
          id v25 = objc_msgSend(v10, "subdataWithRange:", v21, objc_msgSend(v22, "length"));
          char v16 = [v22 isEqualToData:v25];
          if ((v16 & 1) == 0) {
            id v26 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_889();
          }
        }
        else
        {
          id v24 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_883();
          char v16 = 0;
        }

        goto LABEL_18;
      }
      id v14 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_877();
    }
    else
    {
      id v19 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_871();
    }
    char v16 = 0;
LABEL_18:

    goto LABEL_19;
  }
  id v15 = __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke();
  char v16 = 0;
LABEL_21:

  return v16;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke()
{
  v0 = +[POError errorWithCode:-1008 description:@"Missing apv."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_861()
{
  v0 = +[POError errorWithCode:-1008 description:@"error decoding apv."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_867(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = +[POError errorWithCode:-1008 underlyingError:v1 description:@"error with SecKeyCopyExternalRepresentation."];

  uint64_t v3 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_871()
{
  v0 = +[POError errorWithCode:-1008 description:@"error with nonce data"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_877()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to validate apv size"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_883()
{
  v0 = +[POError errorWithCode:-1008 description:@"failed to validate apv data size"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __64__POAuthenticationProcess_validatePartyVInfo_context_publicKey___block_invoke_889()
{
  v0 = +[POError errorWithCode:-1008 description:@"failed to validate apv data"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)createRefreshJWTWithContext:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 refreshToken];

  if (v5)
  {
    id v6 = objc_alloc_init(POMutableLoginJWTBody);
    id v7 = [v4 loginConfiguration];
    id v8 = [v7 customRefreshRequestBodyClaims];
    [(POMutableLoginJWTBody *)v6 addCustomClaims:v8];

    id v9 = [v4 loginConfiguration];
    id v10 = [v9 clientID];
    [(POMutableLoginJWTBody *)v6 setClient_id:v10];

    CFDataRef v11 = [v4 scope];
    [(POMutableLoginJWTBody *)v6 setScope:v11];

    BOOL v12 = [v4 nonce];
    [(POMutableLoginJWTBody *)v6 setNonce:v12];

    id v13 = [v4 loginConfiguration];
    id v14 = [v13 clientID];
    [(POMutableLoginJWTBody *)v6 setIss:v14];

    id v15 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:300.0];
    [(POMutableLoginJWTBody *)v6 setExp:v15];

    char v16 = (void *)MEMORY[0x263F08BA0];
    id v17 = [v4 loginConfiguration];
    id v18 = [v17 refreshEndpointURL];
    id v19 = [v18 absoluteString];
    uint64_t v20 = [v16 componentsWithString:v19];

    [v20 setQuery:0];
    [v20 setQueryItems:0];
    [v20 setFragment:0];
    uint64_t v21 = [v20 URL];
    id v22 = [v21 absoluteString];
    [(POMutableLoginJWTBody *)v6 setAud:v22];

    unint64_t v23 = [v4 loginConfiguration];
    id v24 = [v23 serverNonceClaimName];
    uint64_t v25 = [v24 length];

    if (v25)
    {
      id v26 = [v4 loginConfiguration];
      id v27 = [v26 serverNonceClaimName];
      char v38 = v27;
      unsigned int v28 = [v4 serverNonce];
      v39[0] = v28;
      unsigned int v29 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
      [(POMutableLoginJWTBody *)v6 addCustomClaims:v29];
    }
    else
    {
      id v26 = [v4 serverNonce];
      [(POMutableLoginJWTBody *)v6 setRequest_nonce:v26];
    }

    unsigned int v32 = [v4 refreshToken];
    [(POMutableLoginJWTBody *)v6 setRefresh_token:v32];

    [(POMutableLoginJWTBody *)v6 setGrant_type:@"refresh_token"];
    os_signpost_id_t v33 = [MEMORY[0x263EFF910] date];
    [(POMutableLoginJWTBody *)v6 setIat:v33];

    [(POAuthenticationProcess *)self addCryptoHeadersToJWTBody:v6 context:v4];
    uint64_t v34 = objc_alloc_init(POMutableJWTHeader);
    [(POMutableJWTHeader *)v34 setTyp:@"platformsso-refresh-request+jwt"];
    uint64_t v35 = [v4 loginConfiguration];
    uint64_t v36 = [v35 customRefreshRequestHeaderClaims];
    [(POMutableJWTHeader *)v34 addCustomClaims:v36];

    id v31 = objc_alloc_init(POMutableLoginTokenJWT);
    [(POMutableLoginTokenJWT *)v31 setBody:v6];
    [(POMutableJWT *)v31 setHeader:v34];
  }
  else
  {
    id v30 = __55__POAuthenticationProcess_createRefreshJWTWithContext___block_invoke();
    id v31 = 0;
  }

  return v31;
}

id __55__POAuthenticationProcess_createRefreshJWTWithContext___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Missing refresh token"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)performKeyRequestUsingContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PO_LOG_PODiagnostics();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_INFO, "Starting key request", buf, 2u);
  }

  id v9 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v6);
  }

  id v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v6);
  }

  CFDataRef v11 = [(POAuthenticationProcess *)self createNonceRequestWithContext:v6];
  if (v11)
  {
    BOOL v12 = PO_LOG_POAuthenticationProcess();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259DFE000, v12, OS_LOG_TYPE_INFO, "Sending nonce request", buf, 2u);
    }

    id v13 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, v6);

    id v15 = PO_LOG_POAuthenticationProcess();
    char v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PlatformSSO_NonceRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_908;
    v18[3] = &unk_265463AF8;
    os_signpost_id_t v22 = v14;
    id v21 = v7;
    id v19 = v6;
    uint64_t v20 = self;
    [(POAuthenticationProcess *)self performNonceRequestWithContext:v19 request:v11 completion:v18];
  }
  else
  {
    id v17 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, void, void, void))v7 + 2))(v7, 2, v6, 0, 0, 0);
  }
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create nonce request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

void __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_908(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a2 == 1)
  {
    uint64_t v3 = PO_LOG_POAuthenticationProcess();
    id v4 = v3;
    os_signpost_id_t v5 = *(void *)(a1 + 56);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_NonceRequest", "Success", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 40) createKeyRequestJWTWithContext:*(void *)(a1 + 32)];
    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) deviceConfiguration];
      id v8 = [v7 signingAlgorithm];
      id v9 = [*(id *)(a1 + 32) deviceConfiguration];
      uint64_t v10 = [v9 deviceSigningKey];
      CFDataRef v11 = [*(id *)(a1 + 32) deviceConfiguration];
      BOOL v12 = +[POJWTSigning encodeAndSignJWT:signingAlgorithm:key:certificate:error:](POJWTSigning, "encodeAndSignJWT:signingAlgorithm:key:certificate:error:", v6, v8, v10, [v11 deviceSigningCertificate], 0);

      if (v12)
      {
        id v13 = [*(id *)(a1 + 40) createKeyRequestWithContext:*(void *)(a1 + 32) jwt:v12];
        if (v13)
        {
          os_signpost_id_t v14 = PO_LOG_PODiagnostics();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            id v15 = [*(id *)(a1 + 32) requestIdentifier];
            *(_DWORD *)buf = 138543362;
            uint64_t v34 = v15;
            _os_log_impl(&dword_259DFE000, v14, OS_LOG_TYPE_INFO, "Sending key request: %{public}@", buf, 0xCu);
          }
          char v16 = PO_LOG_POAuthenticationProcess();
          os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, *(const void **)(a1 + 32));

          id v18 = PO_LOG_POAuthenticationProcess();
          id v19 = v18;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_259DFE000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PlatformSSO_KeyRequest", " enableTelemetry=YES ", buf, 2u);
          }

          uint64_t v21 = *(void *)(a1 + 32);
          uint64_t v20 = *(void **)(a1 + 40);
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          void v30[2] = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_929;
          v30[3] = &unk_265463B20;
          os_signpost_id_t v32 = v17;
          id v22 = *(id *)(a1 + 48);
          v30[4] = *(void *)(a1 + 40);
          id v31 = v22;
          [v20 performKeyRequestWithContext:v21 request:v13 completion:v30];
        }
        else
        {
          id v29 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_923();
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
      else
      {
        id v28 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_917();
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      id v27 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_911();
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    id v23 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_2();
    id v24 = PO_LOG_POAuthenticationProcess();
    uint64_t v25 = v24;
    os_signpost_id_t v26 = *(void *)(a1 + 56);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PlatformSSO_NonceRequest", "Failed", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to retrieve nonce"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_911()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create key JWT"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_917()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to sign key request"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_923()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create key request"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

void __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_929(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v102 = a3;
  id v7 = a4;
  id v8 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_INFO, "Key response received", buf, 2u);
  }

  id v9 = PO_LOG_POAuthenticationProcess();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v108 = a2;
    _os_signpost_emit_with_name_impl(&dword_259DFE000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_KeyRequest", "result=%lu", buf, 0xCu);
  }

  if (a2 == 1)
  {
    BOOL v12 = [POKeyResponseJWT alloc];
    id v13 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    os_signpost_id_t v14 = [(POKeyResponseJWT *)v12 initWithString:v13];

    if (v14)
    {
      id v100 = v7;
      id v15 = *(void **)(a1[4] + 40);
      char v16 = [(POJWT *)v14 decodedHeader];
      os_signpost_id_t v17 = [v16 alg];
      if ([v15 containsObject:v17])
      {

        goto LABEL_13;
      }
      uint64_t v20 = *(void **)(a1[4] + 40);
      uint64_t v21 = NSString;
      [(POJWT *)v14 decodedHeader];
      v23 = id v22 = v14;
      id v24 = [v23 alg];
      uint64_t v25 = [(POJWT *)v22 decodedHeader];
      os_signpost_id_t v26 = [v25 enc];
      id v27 = [v21 stringWithFormat:@"%@,%@", v24, v26];
      LOBYTE(v20) = [v20 containsObject:v27];

      os_signpost_id_t v14 = v22;
      if (v20)
      {
LABEL_13:
        id v28 = [v102 deviceConfiguration];
        id v29 = [v28 encryptionAlgorithm];
        v101 = v14;
        uint64_t v99 = a1;
        if (objc_msgSend(v29, "isEqualToNumber:")) {
          [v102 apv];
        }
        else {
        uint64_t v98 = [v102 nonce];
        }

        id v30 = [v102 deviceConfiguration];
        id v31 = [v30 encryptionAlgorithm];
        os_signpost_id_t v32 = [v102 deviceConfiguration];
        uint64_t v33 = [v32 deviceEncryptionKey];
        uint64_t v34 = [v102 loginConfiguration];
        uint64_t v35 = [v34 hpkePsk];
        uint64_t v36 = [v102 loginConfiguration];
        uint64_t v37 = objc_msgSend(v36, "hpkePsk_id");
        char v38 = [v102 loginConfiguration];
        uint64_t v39 = [v38 hpkeAuthPublicKey];
        v105[0] = 0;
        uint64_t v40 = v33;
        id v41 = (void *)v98;
        BOOL v42 = +[POJWTEncryption decodeAndDecryptJWT:v101 encryptionAlgorithm:v31 privateKey:v40 otherInfo:v98 psk:v35 psk_id:v37 authPublicKey:v39 error:v105];
        id v97 = v105[0];

        if (v42)
        {
          os_signpost_id_t v14 = v101;
          if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
          {
            id v43 = PO_LOG_POAuthenticationProcess();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
              __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_929_cold_1();
            }
          }
          id v44 = [v102 deviceConfiguration];
          uint64_t v45 = [v44 encryptionAlgorithm];
          int v46 = [v45 isEqualToNumber:0x2707DBB50];

          if (!v46)
          {
LABEL_26:
            uint64_t v52 = [(POKeyResponseJWT *)v101 decodedBody];
            CFDictionaryRef v53 = [v52 certificate];

            if (v53)
            {
              id v54 = objc_alloc(MEMORY[0x263EFF8F8]);
              id v55 = [(POKeyResponseJWT *)v101 decodedBody];
              id v56 = [v55 certificate];
              id v57 = objc_msgSend(v54, "psso_initWithBase64URLEncodedString:", v56);

              id v58 = +[POSecKeyHelper certificateForData:v57];
              if (v58)
              {
                id v59 = SecCertificateCopyKey(v58);
                id v7 = v100;
                if (v59)
                {
                  double v60 = v59;
                  CFDictionaryRef v61 = SecKeyCopyAttributes(v59);
                  CFRelease(v60);
                  id v62 = (void *)SecCertificateCopyPublicKeySHA1Digest();
                  id v63 = [(__CFDictionary *)v61 objectForKeyedSubscript:*MEMORY[0x263F16FA8]];
                  id v64 = [(__CFDictionary *)v61 objectForKeyedSubscript:*MEMORY[0x263F16F98]];
                  if ((([v63 isEqualToString:*MEMORY[0x263F16FB0]] & 1) != 0
                     || [v63 isEqualToString:*MEMORY[0x263F16FB8]])
                    && [v64 intValue] == 256)
                  {

                    os_signpost_id_t v14 = v101;
                    id v65 = [(POKeyResponseJWT *)v101 decodedBody];
                    double v66 = [v65 iat];
                    [v66 timeIntervalSinceNow];
                    double v68 = v67;

                    id v69 = [(POKeyResponseJWT *)v101 decodedBody];
                    v70 = [v69 iat];

                    if (v70 && v68 <= 120.0)
                    {
                      id v71 = [(POKeyResponseJWT *)v101 decodedBody];
                      double v72 = [v71 exp];
                      [v72 timeIntervalSinceNow];
                      double v74 = v73;

                      id v75 = [(POKeyResponseJWT *)v101 decodedBody];
                      id v76 = [v75 exp];

                      if (v76 && v74 >= -120.0)
                      {
                        uint64_t v77 = v99[5];
                        id v78 = [(POKeyResponseJWT *)v101 decodedBody];
                        v79 = objc_msgSend(v78, "key_context");
                        (*(void (**)(uint64_t, uint64_t, id, void *, void *, void *))(v77 + 16))(v77, 1, v102, v62, v57, v79);

LABEL_49:
                        id v7 = v100;
                        goto LABEL_50;
                      }
                      id v96 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_976();
                    }
                    else
                    {
                      id v95 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_975();
                    }
                    (*(void (**)(void))(v99[5] + 16))();
                    goto LABEL_49;
                  }
                  id v93 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_963();
                  (*(void (**)(void))(v99[5] + 16))();

                  os_signpost_id_t v14 = v101;
                }
                else
                {
                  id v94 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_969();
                  (*(void (**)(void))(v99[5] + 16))();
                }
LABEL_50:
                id v41 = (void *)v98;
                id v80 = v97;
                goto LABEL_51;
              }
            }
            else
            {
              id v57 = 0;
            }
            id v7 = v100;
            id v41 = (void *)v98;
            id v80 = v97;
            id v91 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_957();
            (*(void (**)(void))(v99[5] + 16))();
LABEL_51:

            goto LABEL_52;
          }
          if ([(id)v99[4] validatePartyUInfo:v101 context:v102])
          {
            id v47 = [v102 deviceConfiguration];
            SecKeyRef v48 = SecKeyCopyPublicKey((SecKeyRef)[v47 deviceEncryptionKey]);

            id v49 = (void *)v99[4];
            uint64_t v50 = [v102 apv];
            char v51 = [v49 validatePartyVInfo:v50 context:v102 publicKey:v48];

            if (v48) {
              CFRelease(v48);
            }
            if (v51) {
              goto LABEL_26;
            }
            id v92 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_426();
          }
          else
          {
            id v90 = __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_420();
          }
          (*(void (**)(void))(v99[5] + 16))();
          id v7 = v100;
          id v41 = (void *)v98;
          id v80 = v97;
        }
        else
        {
          v103[0] = MEMORY[0x263EF8330];
          v103[1] = 3221225472;
          v103[2] = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_947;
          v103[3] = &unk_265463860;
          id v80 = v97;
          id v104 = v97;
          id v81 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_947((uint64_t)v103);
          (*(void (**)(void))(v99[5] + 16))();

          id v7 = v100;
          os_signpost_id_t v14 = v101;
        }
LABEL_52:

        goto LABEL_53;
      }
      id v82 = NSString;
      v83 = [(POJWT *)v22 decodedHeader];
      id v84 = [v83 alg];
      uint64_t v85 = [(POJWT *)v22 decodedHeader];
      uint64_t v86 = [v85 enc];
      uint64_t v87 = [v82 stringWithFormat:@"alg = %@, enc = %@", v84, v86];

      v105[1] = (id)MEMORY[0x263EF8330];
      v105[2] = (id)3221225472;
      v105[3] = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_943;
      v105[4] = &unk_265463860;
      id v106 = v87;
      id v88 = v87;
      id v89 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_943();
      (*(void (**)(void))(a1[5] + 16))();

      id v7 = v100;
    }
    else
    {
      id v19 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_937();
      (*(void (**)(void))(a1[5] + 16))();
    }
LABEL_53:

    goto LABEL_54;
  }
  id v18 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_930();
  (*(void (**)(void))(a1[5] + 16))();
LABEL_54:
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_930()
{
  v0 = +[POError errorWithCode:-1001 description:@"Key request failed"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_937()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to parse key response."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_943()
{
  v0 = +[POError errorWithCode:-1008 description:@"unsupported key response algorithm and encryption."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_947(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1008 underlyingError:*(void *)(a1 + 32) description:@"Failed to decrypt key response."];
  uint64_t v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_957()
{
  v0 = +[POError errorWithCode:-1008 description:@"Missing or invalid certificate."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_963()
{
  v0 = +[POError errorWithCode:-1008 description:@"Certificate contains incorrect key size."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_969()
{
  v0 = +[POError errorWithCode:-1008 description:@"Certificate is missing key."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_975()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to verify iat."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_361_cold_1();
  }

  return v0;
}

id __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_976()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to verify exp."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_361_cold_1();
  }

  return v0;
}

- (void)performKeyExchangeRequestUsingContext:(id)a3 otherPartyPublicKeyData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_signpost_id_t v11 = PO_LOG_PODiagnostics();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v11, OS_LOG_TYPE_INFO, "Starting Key Exchange request", buf, 2u);
  }

  BOOL v12 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v8);
  }

  id v13 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v8);
  }

  os_signpost_id_t v14 = [(POAuthenticationProcess *)self createNonceRequestWithContext:v8];
  if (v14)
  {
    id v15 = PO_LOG_POAuthenticationProcess();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259DFE000, v15, OS_LOG_TYPE_INFO, "Sending nonce request", buf, 2u);
    }

    char v16 = PO_LOG_POAuthenticationProcess();
    os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, v8);

    id v18 = PO_LOG_POAuthenticationProcess();
    id v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PlatformSSO_NonceRequest", " enableTelemetry=YES ", buf, 2u);
    }

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_979;
    void v21[3] = &unk_265463D00;
    os_signpost_id_t v26 = v17;
    id v25 = v10;
    id v22 = v8;
    id v23 = self;
    id v24 = v9;
    [(POAuthenticationProcess *)self performNonceRequestWithContext:v22 request:v14 completion:v21];
  }
  else
  {
    id v20 = __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke();
    (*((void (**)(id, uint64_t, id, void, void))v10 + 2))(v10, 2, v8, 0, 0);
  }
}

void __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_979(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a2 == 1)
  {
    uint64_t v3 = PO_LOG_POAuthenticationProcess();
    id v4 = v3;
    os_signpost_id_t v5 = *(void *)(a1 + 64);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlatformSSO_NonceRequest", "Success", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 40) createKeyExchangeRequestJWTWithContext:*(void *)(a1 + 32) otherPartyPublicKey:*(void *)(a1 + 48)];
    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) deviceConfiguration];
      id v8 = [v7 signingAlgorithm];
      id v9 = [*(id *)(a1 + 32) deviceConfiguration];
      uint64_t v10 = [v9 deviceSigningKey];
      os_signpost_id_t v11 = [*(id *)(a1 + 32) deviceConfiguration];
      BOOL v12 = +[POJWTSigning encodeAndSignJWT:signingAlgorithm:key:certificate:error:](POJWTSigning, "encodeAndSignJWT:signingAlgorithm:key:certificate:error:", v6, v8, v10, [v11 deviceSigningCertificate], 0);

      if (v12)
      {
        id v13 = [*(id *)(a1 + 40) createKeyExchangeRequestWithContext:*(void *)(a1 + 32) jwt:v12];
        if (v13)
        {
          os_signpost_id_t v14 = PO_LOG_PODiagnostics();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            id v15 = [*(id *)(a1 + 32) requestIdentifier];
            *(_DWORD *)buf = 138543362;
            uint64_t v34 = v15;
            _os_log_impl(&dword_259DFE000, v14, OS_LOG_TYPE_INFO, "Sending Key Exchange request: %{public}@", buf, 0xCu);
          }
          char v16 = PO_LOG_POAuthenticationProcess();
          os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, *(const void **)(a1 + 32));

          id v18 = PO_LOG_POAuthenticationProcess();
          id v19 = v18;
          if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_259DFE000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PlatformSSO_KeyExchangeRequest", " enableTelemetry=YES ", buf, 2u);
          }

          uint64_t v21 = *(void *)(a1 + 32);
          id v20 = *(void **)(a1 + 40);
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          void v30[2] = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1000;
          v30[3] = &unk_265463B20;
          os_signpost_id_t v32 = v17;
          id v22 = *(id *)(a1 + 56);
          v30[4] = *(void *)(a1 + 40);
          id v31 = v22;
          [v20 performKeyExchangeRequestWithContext:v21 request:v13 completion:v30];
        }
        else
        {
          id v29 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_994();
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
      }
      else
      {
        id v28 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_988();
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    else
    {
      id v27 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_982();
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v23 = __71__POAuthenticationProcess_performPasswordLoginUsingContext_completion___block_invoke_2();
    id v24 = PO_LOG_POAuthenticationProcess();
    id v25 = v24;
    os_signpost_id_t v26 = *(void *)(a1 + 64);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_259DFE000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PlatformSSO_NonceRequest", "Failed", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_982()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create Key Exchange JWT."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_988()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to sign Key Exchange request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_994()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to create Key Exchange request."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

void __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1000(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v9, OS_LOG_TYPE_INFO, "Key Exchange response received", buf, 2u);
  }

  uint64_t v10 = PO_LOG_POAuthenticationProcess();
  os_signpost_id_t v11 = v10;
  os_signpost_id_t v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v88 = a2;
    _os_signpost_emit_with_name_impl(&dword_259DFE000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PlatformSSO_KeyExchangeRequest", "result=%lu", buf, 0xCu);
  }

  if (a2 == 1)
  {
    id v13 = [POKeyExchangeResponseJWT alloc];
    os_signpost_id_t v14 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    id v15 = [(POKeyExchangeResponseJWT *)v13 initWithString:v14];

    if (!v15)
    {
      id v20 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1008();
      (*(void (**)(void))(a1[5] + 16))();
LABEL_38:

      goto LABEL_39;
    }
    id v80 = v8;
    char v16 = *(void **)(a1[4] + 40);
    os_signpost_id_t v17 = [(POJWT *)v15 decodedHeader];
    id v18 = [v17 alg];
    id v81 = a1;
    if ([v16 containsObject:v18])
    {
    }
    else
    {
      uint64_t v21 = *(void **)(a1[4] + 40);
      id v22 = NSString;
      [(POJWT *)v15 decodedHeader];
      v24 = id v23 = v15;
      id v25 = [v24 alg];
      os_signpost_id_t v26 = [(POJWT *)v23 decodedHeader];
      id v27 = [v26 enc];
      id v28 = [v22 stringWithFormat:@"%@,%@", v25, v27];
      LOBYTE(v21) = [v21 containsObject:v28];

      id v15 = v23;
      if ((v21 & 1) == 0)
      {
        double v66 = NSString;
        double v67 = [(POJWT *)v23 decodedHeader];
        double v68 = [v67 alg];
        id v69 = [(POJWT *)v23 decodedHeader];
        v70 = [v69 enc];
        id v71 = [v66 stringWithFormat:@"alg = %@, enc = %@", v68, v70];

        v85[1] = (id)MEMORY[0x263EF8330];
        v85[2] = (id)3221225472;
        v85[3] = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1014;
        void v85[4] = &unk_265463860;
        id v86 = v71;
        id v72 = v71;
        id v73 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1014();
        (*(void (**)(void))(v81[5] + 16))();

LABEL_37:
        id v8 = v80;
        goto LABEL_38;
      }
    }
    id v29 = [v7 deviceConfiguration];
    id v30 = [v29 encryptionAlgorithm];
    id v82 = v15;
    if (objc_msgSend(v30, "isEqualToNumber:")) {
      [v7 apv];
    }
    else {
    uint64_t v79 = [v7 nonce];
    }

    id v78 = [v7 deviceConfiguration];
    id v31 = [v78 encryptionAlgorithm];
    os_signpost_id_t v32 = [v7 deviceConfiguration];
    uint64_t v33 = [v32 deviceEncryptionKey];
    uint64_t v34 = [v7 loginConfiguration];
    uint64_t v35 = [v34 hpkePsk];
    uint64_t v36 = [v7 loginConfiguration];
    objc_msgSend(v36, "hpkePsk_id");
    v38 = uint64_t v37 = v7;
    uint64_t v39 = [v37 loginConfiguration];
    uint64_t v40 = [v39 hpkeAuthPublicKey];
    v85[0] = 0;
    uint64_t v41 = v33;
    BOOL v42 = (void *)v79;
    BOOL v43 = +[POJWTEncryption decodeAndDecryptJWT:v82 encryptionAlgorithm:v31 privateKey:v41 otherInfo:v79 psk:v35 psk_id:v38 authPublicKey:v40 error:v85];
    id v77 = v85[0];

    if (!v43)
    {
      v83[0] = MEMORY[0x263EF8330];
      v83[1] = 3221225472;
      v83[2] = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1018;
      v83[3] = &unk_265463860;
      id v44 = v77;
      id v84 = v77;
      id v65 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1018((uint64_t)v83);
      (*(void (**)(void))(v81[5] + 16))();

      id v7 = v37;
      id v15 = v82;
LABEL_36:

      goto LABEL_37;
    }
    id v7 = v37;
    id v15 = v82;
    id v44 = v77;
    if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
    {
      uint64_t v45 = PO_LOG_POAuthenticationProcess();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1000_cold_1();
      }
    }
    int v46 = [v37 deviceConfiguration];
    id v47 = [v46 encryptionAlgorithm];
    int v48 = [v47 isEqualToNumber:0x2707DBB50];

    if (v48)
    {
      if (([(id)v81[4] validatePartyUInfo:v82 context:v37] & 1) == 0)
      {
        id v75 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1022();
        goto LABEL_34;
      }
      id v49 = [v37 deviceConfiguration];
      SecKeyRef v50 = SecKeyCopyPublicKey((SecKeyRef)[v49 deviceEncryptionKey]);

      char v51 = (void *)v81[4];
      uint64_t v52 = [v37 apv];
      char v53 = [v51 validatePartyVInfo:v52 context:v37 publicKey:v50];

      if (v50) {
        CFRelease(v50);
      }
      if ((v53 & 1) == 0)
      {
        id v76 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1025();
        goto LABEL_34;
      }
    }
    id v54 = [(POKeyExchangeResponseJWT *)v82 decodedBody];
    id v55 = [v54 key];

    if (v55)
    {
      CFAllocatorRef Default = CFAllocatorGetDefault();
      CFAllocatorRef v57 = (const __CFAllocator *)SecCFAllocatorZeroize();
      CFAllocatorSetDefault(v57);
      id v58 = objc_alloc(MEMORY[0x263EFF990]);
      id v59 = [(POKeyExchangeResponseJWT *)v82 decodedBody];
      double v60 = [v59 key];
      CFDictionaryRef v61 = (void *)[v58 initWithBase64EncodedString:v60 options:0];

      id v7 = v37;
      CFAllocatorSetDefault(Default);
      if (v61)
      {
        uint64_t v62 = v81[5];
        id v63 = [(POKeyExchangeResponseJWT *)v82 decodedBody];
        id v64 = objc_msgSend(v63, "key_context");
        (*(void (**)(uint64_t, uint64_t, void *, void *, void *))(v62 + 16))(v62, 1, v37, v61, v64);

LABEL_35:
        BOOL v42 = (void *)v79;
        goto LABEL_36;
      }
    }
    id v74 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1028();
LABEL_34:
    (*(void (**)(void))(v81[5] + 16))();
    goto LABEL_35;
  }
  id v19 = __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1001();
  (*(void (**)(void))(a1[5] + 16))();
LABEL_39:
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1001()
{
  v0 = +[POError errorWithCode:-1001 description:@"Key Exchange request failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1008()
{
  v0 = +[POError errorWithCode:-1008 description:@"Failed to parse Key Exchange response."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1014()
{
  v0 = +[POError errorWithCode:-1008 description:@"Unsupported Key Exchange response algorithm and encryption."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1();
  }

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1018(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to decrypt Key Exchange response."];
  uint64_t v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1022()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to validate apu."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1025()
{
  v0 = +[POError errorWithCode:-1001 description:@"Failed to validate apv."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1028()
{
  v0 = +[POError errorWithCode:-1001 description:@"Missing or malformed exchanged key."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)createKeyRequestJWTWithContext:(id)a3
{
  v35[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_signpost_id_t v5 = [v4 refreshToken];

  if (v5)
  {
    uint64_t v6 = [v4 nonce];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [v4 serverNonce];

      if (v8)
      {
        id v9 = objc_alloc_init(POMutableKeyRequestJWTBody);
        uint64_t v10 = [v4 loginConfiguration];
        os_signpost_id_t v11 = [v10 customKeyRequestBodyClaims];
        [(POMutableKeyRequestJWTBody *)v9 addCustomClaims:v11];

        [(POMutableKeyRequestJWTBody *)v9 setRequest_type:@"key_request"];
        [(POMutableKeyRequestJWTBody *)v9 setVersion:@"1.0"];
        os_signpost_id_t v12 = [MEMORY[0x263EFF910] date];
        [(POMutableKeyRequestJWTBody *)v9 setIat:v12];

        id v13 = [v4 loginConfiguration];
        os_signpost_id_t v14 = [v13 clientID];
        [(POMutableKeyRequestJWTBody *)v9 setIss:v14];

        id v15 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:300.0];
        [(POMutableKeyRequestJWTBody *)v9 setExp:v15];

        char v16 = [v4 nonce];
        [(POMutableKeyRequestJWTBody *)v9 setNonce:v16];

        os_signpost_id_t v17 = [v4 refreshToken];
        [(POMutableKeyRequestJWTBody *)v9 setRefresh_token:v17];

        id v18 = [v4 userName];
        [(POMutableKeyRequestJWTBody *)v9 setUsername:v18];

        id v19 = [v4 userName];
        [(POMutableKeyRequestJWTBody *)v9 setSub:v19];

        [(POMutableKeyRequestJWTBody *)v9 setKey_purpose:@"user_unlock"];
        id v20 = [v4 loginConfiguration];
        uint64_t v21 = [v20 serverNonceClaimName];
        uint64_t v22 = [v21 length];

        if (v22)
        {
          id v23 = [v4 loginConfiguration];
          id v24 = [v23 serverNonceClaimName];
          uint64_t v34 = v24;
          id v25 = [v4 serverNonce];
          v35[0] = v25;
          os_signpost_id_t v26 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
          [(POMutableKeyRequestJWTBody *)v9 addCustomClaims:v26];
        }
        else
        {
          id v23 = [v4 serverNonce];
          [(POMutableKeyRequestJWTBody *)v9 setRequest_nonce:v23];
        }

        [(POAuthenticationProcess *)self addCryptoHeadersToJWTBody:v9 context:v4];
        id v30 = objc_alloc_init(POMutableJWTHeader);
        [(POMutableJWTHeader *)v30 setTyp:@"platformsso-key-request+jwt"];
        id v31 = [v4 loginConfiguration];
        os_signpost_id_t v32 = [v31 customKeyRequestHeaderClaims];
        [(POMutableJWTHeader *)v30 addCustomClaims:v32];

        id v29 = objc_alloc_init(POMutableKeyRequestJWT);
        [(POMutableKeyRequestJWT *)v29 setBody:v9];
        [(POMutableJWT *)v29 setHeader:v30];

        goto LABEL_11;
      }
    }
    id v27 = __71__POAuthenticationProcess_createLoginJWTWithContext_embeddedAssertion___block_invoke_545();
  }
  else
  {
    id v28 = __58__POAuthenticationProcess_createKeyRequestJWTWithContext___block_invoke();
  }
  id v29 = 0;
LABEL_11:

  return v29;
}

id __58__POAuthenticationProcess_createKeyRequestJWTWithContext___block_invoke()
{
  v0 = +[POError errorWithCode:-1001 description:@"Missing refresh token."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)createKeyRequestWithContext:(id)a3 jwt:(id)a4
{
  v38[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (objc_class *)MEMORY[0x263F089E0];
  id v7 = a4;
  id v8 = [v6 alloc];
  id v9 = [v5 loginConfiguration];
  uint64_t v10 = [v9 keyEndpointURL];
  os_signpost_id_t v11 = (void *)[v8 initWithURL:v10 cachePolicy:4 timeoutInterval:30.0];

  [v11 setHTTPMethod:@"POST"];
  [v11 addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
  [v11 addValue:@"application/platformsso-key-response+jwt" forHTTPHeaderField:@"Accept"];
  os_signpost_id_t v12 = [v5 requestIdentifier];
  [v11 addValue:v12 forHTTPHeaderField:@"client-request-id"];

  id v13 = objc_alloc_init(MEMORY[0x263F08BA0]);
  os_signpost_id_t v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"platform_sso_version" value:@"2.0"];
  v38[0] = v14;
  id v15 = [MEMORY[0x263F08BD0] queryItemWithName:@"grant_type" value:@"urn:ietf:params:oauth:grant-type:jwt-bearer"];
  v38[1] = v15;
  char v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];

  os_signpost_id_t v17 = [v5 loginConfiguration];
  id v18 = [v17 customKeyRequestValues];

  if (v18)
  {
    id v19 = [v5 loginConfiguration];
    id v20 = [v19 customKeyRequestValues];
    uint64_t v21 = [v16 arrayByAddingObjectsFromArray:v20];

    char v16 = (void *)v21;
  }
  [v13 setQueryItems:v16];
  uint64_t v22 = [v13 percentEncodedQuery];
  id v23 = [v22 dataUsingEncoding:4];
  id v24 = (void *)[v23 mutableCopy];

  id v25 = [v5 loginConfiguration];
  os_signpost_id_t v26 = [v25 customRequestJWTParameterName];
  uint64_t v27 = [v26 length];

  if (v27)
  {
    id v28 = [v5 loginConfiguration];
    id v29 = [v28 customRequestJWTParameterName];
  }
  else
  {
    id v29 = @"assertion";
  }
  CFAllocatorRef v30 = (const __CFAllocator *)SecCFAllocatorZeroize();
  id v31 = (__CFString *)CFStringCreateWithFormat(v30, 0, @"&%@=%@", v29, v7);

  if (v31)
  {
    CFAllocatorRef v32 = (const __CFAllocator *)SecCFAllocatorZeroize();
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v32, v31, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      [v24 appendData:ExternalRepresentation];
      [v11 setHTTPBody:v24];
      id v34 = v11;
    }
    else
    {
      id v36 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
      id v34 = 0;
    }
  }
  else
  {
    id v35 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
    id v34 = 0;
  }

  return v34;
}

- (void)performKeyRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  os_signpost_id_t v11 = [v8 urlSession];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke;
  uint64_t v21 = &unk_265463B70;
  id v23 = v8;
  id v24 = v9;
  uint64_t v22 = self;
  id v12 = v8;
  id v13 = v9;
  os_signpost_id_t v14 = [v11 dataTaskWithRequest:v10 completionHandler:&v18];

  id v15 = NSString;
  char v16 = [v12 requestIdentifier];
  os_signpost_id_t v17 = [v15 stringWithFormat:@"Key Request: %@", v16, v18, v19, v20, v21, v22];
  [v14 setTaskDescription:v17];

  [v14 resume];
}

void __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_INFO, "Key response received", buf, 2u);
  }

  if (v9)
  {
    if (v7) {
      os_signpost_id_t v11 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    }
    else {
      os_signpost_id_t v11 = 0;
    }
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1061;
    v44[3] = &unk_265463A00;
    id v45 = v9;
    id v46 = v11;
    id v12 = v11;
    id v19 = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1061((uint64_t)v44);
    id v20 = [a1[4] completionQueue];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1065;
    v41[3] = &unk_265463B98;
    id v43 = a1[6];
    id v42 = a1[5];
    [v20 addOperationWithBlock:v41];

    uint64_t v21 = v45;
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    if ([v12 statusCode] >= 200 && objc_msgSend(v12, "statusCode") < 300)
    {
      BOOL v24 = +[POCoreConfigurationUtil platformSSODevModeEnabled];
      id v25 = PO_LOG_POAuthenticationProcess();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
      if (v24)
      {
        if (v26) {
          __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_cold_1();
        }
      }
      else if (v26)
      {
        __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_cold_2();
      }

      id v15 = [a1[4] completionQueue];
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      id v29 = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1077;
      CFAllocatorRef v30 = &unk_265463C60;
      id v13 = &v33;
      id v33 = a1[6];
      char v16 = &v31;
      id v31 = a1[5];
      os_signpost_id_t v17 = &v32;
      id v32 = v7;
      uint64_t v18 = &v27;
    }
    else
    {
      v36[1] = MEMORY[0x263EF8330];
      v36[2] = 3221225472;
      v36[3] = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_2_1072;
      void v36[4] = &unk_265463860;
      id v13 = &v37;
      id v37 = v12;
      id v14 = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_2_1072();
      id v15 = [a1[4] completionQueue];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1076;
      v34[3] = &unk_265463B98;
      char v16 = (id *)v36;
      v36[0] = a1[6];
      os_signpost_id_t v17 = &v35;
      id v35 = a1[5];
      uint64_t v18 = v34;
    }
    objc_msgSend(v15, "addOperationWithBlock:", v18, v27, v28, v29, v30);

    uint64_t v21 = *v13;
    goto LABEL_20;
  }
  id v22 = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_2();
  id v23 = [a1[4] completionQueue];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1071;
  void v38[3] = &unk_265463B98;
  id v40 = a1[6];
  id v39 = a1[5];
  [v23 addOperationWithBlock:v38];

  id v12 = v40;
LABEL_21:
}

id __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1061(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1009 underlyingError:*(void *)(a1 + 32) description:@"Failed to retrieve key."];
  uint64_t v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231_cold_1();
  }

  return v1;
}

uint64_t __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1065(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 5, *(void *)(a1 + 32), 0);
}

id __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1009 description:@"Not HTTP response for key."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1071(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 3, *(void *)(a1 + 32), 0);
}

id __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_2_1072()
{
  v0 = +[POError errorWithCode:-1009 description:@"Key request failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244_cold_1();
  }

  return v0;
}

uint64_t __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1076(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 3, *(void *)(a1 + 32), 0);
}

uint64_t __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_1077(void *a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

- (id)createKeyExchangeRequestJWTWithContext:(id)a3 otherPartyPublicKey:(id)a4
{
  v40[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 refreshToken];

  if (v8)
  {
    uint64_t v9 = [v6 nonce];
    if (v9)
    {
      id v10 = (void *)v9;
      os_signpost_id_t v11 = [v6 serverNonce];

      if (v7)
      {
        if (v11)
        {
          id v12 = objc_alloc_init(POMutableKeyExchangeRequestJWTBody);
          id v13 = [v6 loginConfiguration];
          id v14 = [v13 customKeyExchangeRequestBodyClaims];
          [(POMutableKeyExchangeRequestJWTBody *)v12 addCustomClaims:v14];

          [(POMutableKeyExchangeRequestJWTBody *)v12 setRequest_type:@"key_exchange"];
          [(POMutableKeyExchangeRequestJWTBody *)v12 setVersion:@"1.0"];
          id v15 = [MEMORY[0x263EFF910] date];
          [(POMutableKeyExchangeRequestJWTBody *)v12 setIat:v15];

          char v16 = [v6 loginConfiguration];
          os_signpost_id_t v17 = [v16 clientID];
          [(POMutableKeyExchangeRequestJWTBody *)v12 setIss:v17];

          uint64_t v18 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:300.0];
          [(POMutableKeyExchangeRequestJWTBody *)v12 setExp:v18];

          id v19 = [v6 nonce];
          [(POMutableKeyExchangeRequestJWTBody *)v12 setNonce:v19];

          id v20 = [v6 refreshToken];
          [(POMutableKeyExchangeRequestJWTBody *)v12 setRefresh_token:v20];

          uint64_t v21 = [v6 userName];
          [(POMutableKeyExchangeRequestJWTBody *)v12 setUsername:v21];

          id v22 = [v6 userName];
          [(POMutableKeyExchangeRequestJWTBody *)v12 setSub:v22];

          [(POMutableKeyExchangeRequestJWTBody *)v12 setKey_purpose:@"user_unlock"];
          id v23 = [v6 loginConfiguration];
          BOOL v24 = [v23 serverNonceClaimName];
          uint64_t v25 = [v24 length];

          if (v25)
          {
            BOOL v26 = [v6 loginConfiguration];
            uint64_t v27 = [v26 serverNonceClaimName];
            id v39 = v27;
            uint64_t v28 = [v6 serverNonce];
            v40[0] = v28;
            id v29 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
            [(POMutableKeyExchangeRequestJWTBody *)v12 addCustomClaims:v29];
          }
          else
          {
            BOOL v26 = [v6 serverNonce];
            [(POMutableKeyExchangeRequestJWTBody *)v12 setRequest_nonce:v26];
          }

          id v34 = [v7 base64EncodedStringWithOptions:0];
          [(POMutableKeyExchangeRequestJWTBody *)v12 setOther_publickey:v34];

          id v35 = [v6 encryptionContext];
          [(POMutableKeyExchangeRequestJWTBody *)v12 setKey_context:v35];

          [(POAuthenticationProcess *)self addCryptoHeadersToJWTBody:v12 context:v6];
          id v36 = objc_alloc_init(POMutableJWTHeader);
          [(POMutableJWTHeader *)v36 setTyp:@"platformsso-key-request+jwt"];
          id v37 = [v6 loginConfiguration];
          char v38 = [v37 customKeyExchangeRequestHeaderClaims];
          [(POMutableJWTHeader *)v36 addCustomClaims:v38];

          id v32 = objc_alloc_init(POMutableKeyExchangeRequestJWT);
          [(POMutableKeyExchangeRequestJWT *)v32 setBody:v12];
          [(POMutableJWT *)v32 setHeader:v36];

          goto LABEL_10;
        }
      }
    }
    id v30 = __86__POAuthenticationProcess_createKeyExchangeRequestJWTWithContext_otherPartyPublicKey___block_invoke_1083();
  }
  else
  {
    id v31 = __58__POAuthenticationProcess_createKeyRequestJWTWithContext___block_invoke();
  }
  id v32 = 0;
LABEL_10:

  return v32;
}

id __86__POAuthenticationProcess_createKeyExchangeRequestJWTWithContext_otherPartyPublicKey___block_invoke_1083()
{
  v0 = +[POError errorWithCode:-1008 description:@"Missing required values."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)createKeyExchangeRequestWithContext:(id)a3 jwt:(id)a4
{
  v38[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x263F089E0];
  id v7 = a4;
  id v8 = [v6 alloc];
  uint64_t v9 = [v5 loginConfiguration];
  id v10 = [v9 keyEndpointURL];
  os_signpost_id_t v11 = (void *)[v8 initWithURL:v10 cachePolicy:4 timeoutInterval:30.0];

  [v11 setHTTPMethod:@"POST"];
  [v11 addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
  [v11 addValue:@"application/platformsso-key-response+jwt" forHTTPHeaderField:@"Accept"];
  id v12 = [v5 requestIdentifier];
  [v11 addValue:v12 forHTTPHeaderField:@"client-request-id"];

  id v13 = objc_alloc_init(MEMORY[0x263F08BA0]);
  id v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"platform_sso_version" value:@"2.0"];
  v38[0] = v14;
  id v15 = [MEMORY[0x263F08BD0] queryItemWithName:@"grant_type" value:@"urn:ietf:params:oauth:grant-type:jwt-bearer"];
  v38[1] = v15;
  char v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];

  os_signpost_id_t v17 = [v5 loginConfiguration];
  uint64_t v18 = [v17 customKeyExchangeRequestValues];

  if (v18)
  {
    id v19 = [v5 loginConfiguration];
    id v20 = [v19 customKeyExchangeRequestValues];
    uint64_t v21 = [v16 arrayByAddingObjectsFromArray:v20];

    char v16 = (void *)v21;
  }
  [v13 setQueryItems:v16];
  id v22 = [v13 percentEncodedQuery];
  id v23 = [v22 dataUsingEncoding:4];
  BOOL v24 = (void *)[v23 mutableCopy];

  uint64_t v25 = [v5 loginConfiguration];
  BOOL v26 = [v25 customRequestJWTParameterName];
  uint64_t v27 = [v26 length];

  if (v27)
  {
    uint64_t v28 = [v5 loginConfiguration];
    id v29 = [v28 customRequestJWTParameterName];
  }
  else
  {
    id v29 = @"assertion";
  }
  CFAllocatorRef v30 = (const __CFAllocator *)SecCFAllocatorZeroize();
  id v31 = (__CFString *)CFStringCreateWithFormat(v30, 0, @"&%@=%@", v29, v7);

  if (v31)
  {
    CFAllocatorRef v32 = (const __CFAllocator *)SecCFAllocatorZeroize();
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v32, v31, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      [v24 appendData:ExternalRepresentation];
      [v11 setHTTPBody:v24];
      id v34 = v11;
    }
    else
    {
      id v36 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
      id v34 = 0;
    }
  }
  else
  {
    id v35 = __61__POAuthenticationProcess_createLoginRequestWithContext_jwt___block_invoke();
    id v34 = 0;
  }

  return v34;
}

- (void)performKeyExchangeRequestWithContext:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  os_signpost_id_t v11 = [v8 urlSession];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke;
  uint64_t v21 = &unk_265463B70;
  id v23 = v8;
  id v24 = v9;
  id v22 = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = [v11 dataTaskWithRequest:v10 completionHandler:&v18];

  id v15 = NSString;
  char v16 = [v12 requestIdentifier];
  os_signpost_id_t v17 = [v15 stringWithFormat:@"Key Exchange Request: %@", v16, v18, v19, v20, v21, v22];
  [v14 setTaskDescription:v17];

  [v14 resume];
}

void __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_INFO, "Key Exchange response received", buf, 2u);
  }

  if (v9)
  {
    if (v7) {
      os_signpost_id_t v11 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    }
    else {
      os_signpost_id_t v11 = 0;
    }
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1096;
    v44[3] = &unk_265463A00;
    id v45 = v9;
    id v46 = v11;
    id v12 = v11;
    id v19 = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1096((uint64_t)v44);
    id v20 = [a1[4] completionQueue];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1100;
    v41[3] = &unk_265463B98;
    id v43 = a1[6];
    id v42 = a1[5];
    [v20 addOperationWithBlock:v41];

    uint64_t v21 = v45;
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    if ([v12 statusCode] >= 200 && objc_msgSend(v12, "statusCode") < 300)
    {
      BOOL v24 = +[POCoreConfigurationUtil platformSSODevModeEnabled];
      uint64_t v25 = PO_LOG_POAuthenticationProcess();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
      if (v24)
      {
        if (v26) {
          __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_cold_1();
        }
      }
      else if (v26)
      {
        __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_cold_2();
      }

      id v15 = [a1[4] completionQueue];
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      id v29 = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1112;
      CFAllocatorRef v30 = &unk_265463C60;
      id v13 = &v33;
      id v33 = a1[6];
      char v16 = &v31;
      id v31 = a1[5];
      os_signpost_id_t v17 = &v32;
      id v32 = v7;
      uint64_t v18 = &v27;
    }
    else
    {
      v36[1] = MEMORY[0x263EF8330];
      v36[2] = 3221225472;
      v36[3] = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_2_1107;
      void v36[4] = &unk_265463860;
      id v13 = &v37;
      id v37 = v12;
      id v14 = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_2_1107();
      id v15 = [a1[4] completionQueue];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1111;
      v34[3] = &unk_265463B98;
      char v16 = (id *)v36;
      v36[0] = a1[6];
      os_signpost_id_t v17 = &v35;
      id v35 = a1[5];
      uint64_t v18 = v34;
    }
    objc_msgSend(v15, "addOperationWithBlock:", v18, v27, v28, v29, v30);

    uint64_t v21 = *v13;
    goto LABEL_20;
  }
  id v22 = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_2();
  id v23 = [a1[4] completionQueue];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1106;
  void v38[3] = &unk_265463B98;
  id v40 = a1[6];
  id v39 = a1[5];
  [v23 addOperationWithBlock:v38];

  id v12 = v40;
LABEL_21:
}

id __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1096(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1009 underlyingError:*(void *)(a1 + 32) description:@"Failed to exchange."];
  uint64_t v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231_cold_1();
  }

  return v1;
}

uint64_t __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1100(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 5, *(void *)(a1 + 32), 0);
}

id __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_2()
{
  v0 = +[POError errorWithCode:-1009 description:@"Not HTTP response for exchange."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1106(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 3, *(void *)(a1 + 32), 0);
}

id __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_2_1107()
{
  v0 = +[POError errorWithCode:-1009 description:@"Exchange request failed."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244_cold_1();
  }

  return v0;
}

uint64_t __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1111(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 3, *(void *)(a1 + 32), 0);
}

uint64_t __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_1112(void *a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1[6] + 16))(a1[6], 1, a1[4], a1[5]);
}

- (void)extractGroupsAndSubUsingAuthorizationWithContext:(id)a3 tokens:(id)a4 returningGroups:(id *)a5 identifier:(id *)a6 refreshToken:(id *)a7
{
  id v11 = a3;
  *a5 = 0;
  *a6 = 0;
  id v41 = 0;
  id v12 = [MEMORY[0x263F08900] JSONObjectWithData:a4 options:16 error:&v41];
  id v13 = v41;
  id v14 = v13;
  if (v13)
  {
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    void v39[2] = __123__POAuthenticationProcess_extractGroupsAndSubUsingAuthorizationWithContext_tokens_returningGroups_identifier_refreshToken___block_invoke;
    v39[3] = &unk_265463860;
    id v40 = (POIDTokenJWT *)v13;
    id v15 = __123__POAuthenticationProcess_extractGroupsAndSubUsingAuthorizationWithContext_tokens_returningGroups_identifier_refreshToken___block_invoke((uint64_t)v39);
    char v16 = v40;
  }
  else
  {
    uint64_t v17 = [v12 objectForKeyedSubscript:@"id_token"];
    if (!v17
      || (uint64_t v18 = (void *)v17,
          [v12 objectForKeyedSubscript:@"id_token"],
          id v19 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v19,
          v18,
          (isKindOfClass & 1) == 0))
    {
      id v31 = __123__POAuthenticationProcess_extractGroupsAndSubUsingAuthorizationWithContext_tokens_returningGroups_identifier_refreshToken___block_invoke_1119();
      goto LABEL_9;
    }
    uint64_t v21 = [POIDTokenJWT alloc];
    id v22 = [v12 objectForKeyedSubscript:@"id_token"];
    id v23 = [(POIDTokenJWT *)v21 initWithString:v22];

    BOOL v24 = [v11 loginConfiguration];
    uint64_t v25 = [v24 groupResponseClaimName];

    char v38 = v23;
    BOOL v26 = [(POIDTokenJWT *)v23 decodedBody];
    uint64_t v27 = v26;
    if (v25)
    {
      uint64_t v28 = [v26 allData];
      id v29 = [v11 loginConfiguration];
      CFAllocatorRef v30 = [v29 groupResponseClaimName];
      *a5 = [v28 objectForKeyedSubscript:v30];
    }
    else
    {
      *a5 = [v26 groups];
    }

    id v32 = [(POIDTokenJWT *)v38 decodedBody];
    id v33 = [v32 allData];
    id v34 = [v11 loginConfiguration];
    id v35 = [v34 uniqueIdentifierClaimName];
    *a6 = [v33 objectForKeyedSubscript:v35];

    if (a7)
    {
      id v36 = [v12 objectForKeyedSubscript:@"refresh_token"];
      objc_opt_class();
      char v37 = objc_opt_isKindOfClass();

      if (v37)
      {
        *a7 = [v12 objectForKeyedSubscript:@"refresh_token"];
      }
    }
    char v16 = v38;
  }

LABEL_9:
}

id __123__POAuthenticationProcess_extractGroupsAndSubUsingAuthorizationWithContext_tokens_returningGroups_identifier_refreshToken___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1008 underlyingError:*(void *)(a1 + 32) description:@"Error deserializing tokens for groups."];
  uint64_t v2 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __123__POAuthenticationProcess_extractGroupsAndSubUsingAuthorizationWithContext_tokens_returningGroups_identifier_refreshToken___block_invoke_1119()
{
  v0 = +[POError errorWithCode:-1008 description:@"Invalid or missing id_token."];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  id v8 = [v6 protectionSpace];
  id v9 = [v8 authenticationMethod];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F08560]];

  if (v10)
  {
    id v11 = PO_LOG_PODiagnostics();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[POAuthenticationProcess URLSession:didReceiveChallenge:completionHandler:].cold.6();
    }

    id v12 = [v6 protectionSpace];
    id v13 = (__SecTrust *)[v12 serverTrust];

    if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled")|| !+[POPreferences requireRootCAInSystemTrustStore])
    {
      char v16 = PO_LOG_POAuthenticationProcess();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[POAuthenticationProcess URLSession:didReceiveChallenge:completionHandler:]();
      }
    }
    else
    {
      CFErrorRef error = 0;
      if (!SecTrustEvaluateWithError(v13, &error))
      {
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke;
        v19[3] = &__block_descriptor_40_e14___NSError_8__0l;
        void v19[4] = error;
        id v14 = __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke((uint64_t)v19);
        uint64_t v17 = PO_LOG_PODiagnostics();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __24__POJWT_initWithString___block_invoke_cold_1();
        }

        v7[2](v7, 2, 0);
        goto LABEL_16;
      }
      if (!+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled")&& +[POPreferences requireRootCAInSystemTrustStore])
      {
        id v14 = SecTrustCopyCertificateChain(v13);
        if ([v14 lastObject])
        {
          SecTrustStoreForDomain();
          if (SecTrustStoreContains())
          {
            id v15 = (void *)[objc_alloc(MEMORY[0x263F08BB8]) initWithTrust:v13];
            ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v15);
LABEL_28:

            goto LABEL_16;
          }
          id v15 = __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke_1136();
          uint64_t v18 = PO_LOG_PODiagnostics();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            goto LABEL_26;
          }
        }
        else
        {
          id v15 = __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke_1130();
          uint64_t v18 = PO_LOG_PODiagnostics();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
LABEL_26:
          }
            __24__POJWT_initWithString___block_invoke_cold_1();
        }

        v7[2](v7, 2, 0);
        goto LABEL_28;
      }
      char v16 = PO_LOG_POAuthenticationProcess();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[POAuthenticationProcess URLSession:didReceiveChallenge:completionHandler:]();
      }
    }

    id v14 = (void *)[objc_alloc(MEMORY[0x263F08BB8]) initWithTrust:v13];
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v14);
LABEL_16:

    goto LABEL_17;
  }
  v7[2](v7, 1, 0);
LABEL_17:
}

id __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = +[POError errorWithCode:-1008 underlyingError:v1 description:@"trustEvaluation failed"];

  uint64_t v3 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v2;
}

id __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke_1130()
{
  v0 = +[POError errorWithCode:-1008 description:@"No root certificate"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

id __76__POAuthenticationProcess_URLSession_didReceiveChallenge_completionHandler___block_invoke_1136()
{
  v0 = +[POError errorWithCode:-1008 description:@"Root certificate is not in the system trust"];
  v1 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v8 = a6;
  id v9 = (void (**)(id, void))a7;
  int v10 = PO_LOG_PODiagnostics();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:](v8);
  }

  v9[2](v9, 0);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v4 = a4;
  id v5 = PO_LOG_PODiagnostics();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[POAuthenticationProcess URLSession:taskIsWaitingForConnectivity:](v4);
  }
}

- (id)createTestMessagesForLoginConfiguration:(id)a3 certificate:(__SecCertificate *)a4
{
  v78[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = PO_LOG_POAuthenticationProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_259DFE000, v7, OS_LOG_TYPE_INFO, "Creating sample messages", buf, 2u);
  }

  if (v6)
  {
    *(void *)buf = 0;
    uint64_t v8 = *MEMORY[0x263F16FB8];
    uint64_t v9 = *MEMORY[0x263F16F98];
    v77[0] = *MEMORY[0x263F16FA8];
    v77[1] = v9;
    v78[0] = v8;
    v78[1] = &unk_2707DBB20;
    CFDictionaryRef v67 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:2];
    SecKeyRef RandomKey = SecKeyCreateRandomKey(v67, (CFErrorRef *)buf);
    id v11 = objc_alloc_init(PODeviceConfiguration);
    [(PODeviceConfiguration *)v11 setDeviceEncryptionKey:RandomKey];
    [(PODeviceConfiguration *)v11 setExtensionIdentifier:@"com.apple.testMessages"];
    id v12 = [(POAuthenticationProcess *)self createAuthenticationContextUsingLoginConfiguration:v6 deviceConfiguration:v11 userName:@"foo@example.com"];
    [v12 setLoginType:1];
    [v12 setRefreshToken:@"This is the previous refresh token"];
    double v66 = v11;
    [v12 setDeviceConfiguration:v11];
    id v68 = v6;
    [v12 setLoginConfiguration:v6];
    [v12 setEmbeddedAssertionSigningKey:CFRetain(RandomKey)];
    id v65 = [(POAuthenticationProcess *)self createNonceRequestWithContext:v12];
    id v75 = objc_msgSend(v65, "psso_DisplayRequest");
    [v12 setServerNonce:@"This is a fake server nonce"];
    id v13 = objc_alloc_init(POUserConfiguration);
    id v14 = [MEMORY[0x263F08C38] UUID];
    id v15 = [v14 UUIDString];
    id v64 = v13;
    [(POUserConfiguration *)v13 setUniqueIdentifier:v15];

    char v16 = [@"password" dataUsingEncoding:4];
    uint64_t v17 = [v16 mutableCopy];

    id v63 = (void *)v17;
    [v12 setPassword:v17];
    uint64_t v18 = [(POAuthenticationProcess *)self createLoginJWTWithContext:v12 embeddedAssertion:0];
    id v19 = [v12 deviceConfiguration];
    id v20 = [v19 signingAlgorithm];
    uint64_t v62 = (void *)v18;
    uint64_t v21 = +[POJWTSigning encodeAndSignJWT:v18 signingAlgorithm:v20 key:RandomKey certificate:a4];

    id v74 = [(POAuthenticationProcess *)self createLoginRequestWithContext:v12 jwt:v21];
    [v12 setLoginType:2];
    double v60 = [(POAuthenticationProcess *)self createEmbeddedAssertionWithContext:v12];
    id v73 = +[POJWTSigning encodeAndSignJWT:algorithm:key:certificate:](POJWTSigning, "encodeAndSignJWT:algorithm:key:certificate:");
    id v59 = [(POAuthenticationProcess *)self createLoginJWTWithContext:v12 embeddedAssertion:v73];
    id v71 = +[POJWTSigning encodeAndSignJWT:algorithm:key:certificate:](POJWTSigning, "encodeAndSignJWT:algorithm:key:certificate:");
    id v72 = [(POAuthenticationProcess *)self createLoginRequestWithContext:v12 jwt:v71];
    uint64_t v22 = [(POAuthenticationProcess *)self createKeyRequestJWTWithContext:v12];
    id v23 = [v12 deviceConfiguration];
    BOOL v24 = [v23 signingAlgorithm];
    id v58 = (void *)v22;
    v70 = +[POJWTSigning encodeAndSignJWT:v22 signingAlgorithm:v24 key:RandomKey certificate:a4];

    id v69 = [(POAuthenticationProcess *)self createKeyRequestWithContext:v12 jwt:v70];
    uint64_t v25 = [@"This is an encrypted context" dataUsingEncoding:4];
    BOOL v26 = [v25 base64EncodedStringWithOptions:0];
    [v12 setEncryptionContext:v26];

    uint64_t v27 = [@"secret tokens" dataUsingEncoding:4];
    uint64_t v28 = [(POAuthenticationProcess *)self createKeyExchangeRequestJWTWithContext:v12 otherPartyPublicKey:v27];

    id v29 = [v12 deviceConfiguration];
    CFAllocatorRef v30 = [v29 signingAlgorithm];
    CFAllocatorRef v57 = (void *)v28;
    uint64_t v31 = +[POJWTSigning encodeAndSignJWT:v28 signingAlgorithm:v30 key:RandomKey certificate:a4];

    id v56 = [(POAuthenticationProcess *)self createKeyExchangeRequestWithContext:v12 jwt:v31];
    id v32 = [NSString stringWithFormat:@"Platform SSO Test Messages\n\n"];
    id v33 = +[POSecKeyHelper printKey:RandomKey];
    id v34 = [v32 stringByAppendingFormat:@"----------\nKey Generated for Signing All Test Messages: \n%@\n\n", v33];

    id v35 = [v34 stringByAppendingFormat:@"----------\nNonce Request: \n%@\n\n", v75];

    CFDictionaryRef v61 = (void *)v21;
    id v55 = [[POLoginTokenJWT alloc] initWithString:v21];
    id v36 = [v35 stringByAppendingFormat:@"----------\nPassword Login JWT: \n%@\n\n", v55];

    char v37 = objc_msgSend(v74, "psso_DisplayRequest");
    char v38 = [v36 stringByAppendingFormat:@"----------\nPassword Login Request: \n%@\n\n", v37];

    id v54 = [[POAssertionTokenJWT alloc] initWithString:v73];
    id v39 = [v38 stringByAppendingFormat:@"----------\nEmbedded Assertion: \n%@\n\n", v54];

    id v40 = [[POLoginTokenJWT alloc] initWithString:v71];
    id v41 = [v39 stringByAppendingFormat:@"----------\nEmbedded Login JWT: \n%@\n\n", v40];

    id v42 = objc_msgSend(v72, "psso_DisplayRequest");
    id v43 = [v41 stringByAppendingFormat:@"----------\nEmbedded Login Request: \n%@\n\n", v42];

    id v44 = [[POKeyRequestJWT alloc] initWithString:v70];
    id v45 = [v43 stringByAppendingFormat:@"----------\nKey Request JWT: \n%@\n\n", v44];

    id v46 = objc_msgSend(v69, "psso_DisplayRequest");
    id v47 = [v45 stringByAppendingFormat:@"----------\nKey Request: \n%@\n\n", v46];

    int v48 = (void *)v31;
    id v49 = [[POKeyExchangeRequestJWT alloc] initWithString:v31];
    SecKeyRef v50 = [v47 stringByAppendingFormat:@"----------\nKey Exchange Request JWT: \n%@\n\n", v49];

    char v51 = objc_msgSend(v56, "psso_DisplayRequest");
    uint64_t v52 = [v50 stringByAppendingFormat:@"----------\nKey Exchange Request: \n%@\n\n", v51];

    if (RandomKey) {
      CFRelease(RandomKey);
    }

    id v6 = v68;
  }
  else
  {
    uint64_t v52 = @"No login configuration";
  }

  return v52;
}

- (BOOL)waitForConnectivity
{
  return self->_waitForConnectivity;
}

- (void)setWaitForConnectivity:(BOOL)a3
{
  self->_waitForConnectivity = a3;
}

- (double)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (void)setTimeoutIntervalForResource:(double)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (POWSTrustProcess)wstrustProcess
{
  return self->_wstrustProcess;
}

- (void)setWstrustProcess:(id)a3
{
}

- (NSOperationQueue)completionQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)kSupportedLoginResponseAlgorithms
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kSupportedLoginResponseAlgorithms, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_wstrustProcess, 0);
}

- (void)performPasswordLoginUsingContext:(void *)a1 completion:.cold.1(void *a1)
{
  v1 = [a1 deviceConfiguration];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v2, v3, "Device Configuration: %{public}@", v4, v5, v6, v7, v8);
}

- (void)performPasswordLoginUsingContext:(void *)a1 completion:.cold.2(void *a1)
{
  v1 = [a1 loginConfiguration];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v2, v3, "Login Configuration: %{public}@", v4, v5, v6, v7, v8);
}

- (void)createPreAuthenticationRequestWithContext:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_259DFE000, v0, v1, "Preauthentication request: %{private}@", v2);
}

void __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  id v0 = [NSString alloc];
  uint64_t v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v3, v4, "Preauthentication response received: %{public}@", v5, v6, v7, v8, v9);
}

void __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_231_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_3(&dword_259DFE000, v0, v1, "%{public}@, %{public}@");
}

void __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_244_cold_1()
{
  OUTLINED_FUNCTION_4();
  [*(id *)(v0 + 32) statusCode];
  os_log_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_12(), "numberWithInteger:");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v2, v3, "%{public}@, %{public}@", v4, v5, v6, v7, v8);
}

void __89__POAuthenticationProcess_performPreAuthenticationRequestWithContext_request_completion___block_invoke_2_257_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_3(&dword_259DFE000, v0, v1, "%{public}@, %{public}@");
}

- (void)createWSTrustMexRequestWithContext:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_259DFE000, v0, v1, "WSTrust Mex Request request: %{public}@", v2);
}

void __82__POAuthenticationProcess_performWSTrustMexRequestWithContext_request_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  id v0 = [NSString alloc];
  uint64_t v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v3, v4, "WSTrust Mex response received: %{public}@", v5, v6, v7, v8, v9);
}

void __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  id v0 = [NSString alloc];
  uint64_t v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v3, v4, "WSTrust login response received: %{private}@", v5, v6, v7, v8, v9);
}

void __93__POAuthenticationProcess_performWSTrustAuthenticationRequestWithContext_request_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "WSTrust login response received", v2, v3, v4, v5, v6);
}

void __104__POAuthenticationProcess_validateWSTrustAuthenticationResponseWithContext_response_returningAssertion___block_invoke_361_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [NSNumber numberWithDouble:*(double *)(v0 + 32)];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v2, v3, "%{public}@, %{public}@", v4, v5, v6, v7, v8);
}

void __71__POAuthenticationProcess_performLoginWithContext_loginJWT_completion___block_invoke_392_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_259DFE000, v0, v1, "login response received: %{public}@", v2);
}

- (void)createNonceRequestWithContext:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_259DFE000, v0, v1, "server nonce request: %{private}@", v2);
}

void __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  id v0 = [NSString alloc];
  uint64_t v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v3, v4, "server nonce response received: %{public}@", v5, v6, v7, v8, v9);
}

void __78__POAuthenticationProcess__performNonceRequestWithContext_request_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "server nonce response received", v2, v3, v4, v5, v6);
}

void __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  id v0 = [NSString alloc];
  uint64_t v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v3, v4, "login response received: %{public}@", v5, v6, v7, v8, v9);
}

void __77__POAuthenticationProcess_performLoginRequestWithContext_request_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "login response received", v2, v3, v4, v5, v6);
}

- (void)retrieveSigningKeyWithContext:keyId:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_259DFE000, v0, v1, "using cached jwks: %{public}@", v2);
}

void __74__POAuthenticationProcess_retrieveSigningKeyWithContext_keyId_completion___block_invoke_670_cold_1()
{
  OUTLINED_FUNCTION_15();
  id v0 = [NSString alloc];
  uint64_t v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v3, v4, "jwks response received: %{public}@", v5, v6, v7, v8, v9);
}

- (void)validateIdToken:context:key:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_259DFE000, v0, v1, "validating id_token: %{private}@", v2);
}

void __55__POAuthenticationProcess_validateIdToken_context_key___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [*(id *)(v0 + 32) decodedHeader];
  uint64_t v2 = [v1 alg];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_259DFE000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);
}

void __68__POAuthenticationProcess_performKeyRequestUsingContext_completion___block_invoke_929_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_259DFE000, v0, v1, "Key response received: %{public}@", v2);
}

void __100__POAuthenticationProcess_performKeyExchangeRequestUsingContext_otherPartyPublicKeyData_completion___block_invoke_1000_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_259DFE000, v0, v1, "Key exchange response received: %{public}@", v2);
}

void __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  id v0 = [NSString alloc];
  uint64_t v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v3, v4, "Key response received: %{public}@", v5, v6, v7, v8, v9);
}

void __75__POAuthenticationProcess_performKeyRequestWithContext_request_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "Key response received", v2, v3, v4, v5, v6);
}

void __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15();
  id v0 = [NSString alloc];
  uint64_t v2 = (void *)OUTLINED_FUNCTION_13(v0, v1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v3, v4, "Key Exchange response received: %{public}@", v5, v6, v7, v8, v9);
}

void __83__POAuthenticationProcess_performKeyExchangeRequestWithContext_request_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "Key Exchange response received", v2, v3, v4, v5, v6);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "Platform SSO test mode enabled", v2, v3, v4, v5, v6);
}

- (void)URLSession:didReceiveChallenge:completionHandler:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "Evaluating server trust", v2, v3, v4, v5, v6);
}

- (void)URLSession:(void *)a1 task:willPerformHTTPRedirection:newRequest:completionHandler:.cold.1(void *a1)
{
  uint64_t v1 = [a1 URL];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v2, v3, "HTTP Redirect received to %{public}@, canceling", v4, v5, v6, v7, v8);
}

- (void)URLSession:(void *)a1 taskIsWaitingForConnectivity:.cold.1(void *a1)
{
  uint64_t v1 = [a1 taskDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_259DFE000, v2, v3, "%{public}@, is waiting for connectivity", v4, v5, v6, v7, v8);
}

@end