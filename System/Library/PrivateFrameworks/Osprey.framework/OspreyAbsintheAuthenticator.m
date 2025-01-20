@interface OspreyAbsintheAuthenticator
- (BOOL)_readyToSignClientData;
- (BOOL)isSessionInfoExpired;
- (NSData)sessionInfo;
- (OspreyAbsintheAuthenticator)initWithChannel:(id)a3 connectionPreferences:(id)a4;
- (id)_signData:(id)a3;
- (int64_t)state;
- (unint64_t)authenticationStrategyVersion;
- (void)_ensureAuthenticatedWithCompletion:(id)a3 failure:(id)a4;
- (void)_initializeAbsintheClientWithCertificateData:(id)a3 success:(id)a4 fail:(id)a5;
- (void)dealloc;
- (void)isSessionInfoExpired;
- (void)setSessionInfo:(id)a3;
- (void)setState:(int64_t)a3;
- (void)signData:(id)a3 success:(id)a4 failure:(id)a5;
- (void)willMoveToState:(int64_t)a3;
@end

@implementation OspreyAbsintheAuthenticator

- (OspreyAbsintheAuthenticator)initWithChannel:(id)a3 connectionPreferences:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OspreyAbsintheAuthenticator;
  v9 = [(OspreyAbsintheAuthenticator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_state = 0;
    objc_storeStrong((id *)&v9->_connectionPreferences, a4);
    objc_storeStrong((id *)&v10->_channel, a3);
    v11 = [[OspreyAuthService alloc] initWithChannel:v10->_channel authStrategyVersion:[(OspreyAbsintheAuthenticator *)v10 authenticationStrategyVersion]];
    authService = v10->_authService;
    v10->_authService = v11;
  }
  return v10;
}

- (unint64_t)authenticationStrategyVersion
{
  return 0;
}

- (void)dealloc
{
  nacContext = self->_nacContext;
  if (nacContext) {
    IW1PcFszqNK((uint64_t)nacContext);
  }
  v4.receiver = self;
  v4.super_class = (Class)OspreyAbsintheAuthenticator;
  [(OspreyAbsintheAuthenticator *)&v4 dealloc];
}

- (void)setState:(int64_t)a3
{
  -[OspreyAbsintheAuthenticator willMoveToState:](self, "willMoveToState:");
  self->_state = a3;

  [(OspreyAbsintheAuthenticator *)self didMoveToState:a3];
}

- (BOOL)_readyToSignClientData
{
  return self->_state == 6;
}

- (void)willMoveToState:(int64_t)a3
{
  OspreyLoggingInit();
  v5 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG)) {
    [(OspreyAbsintheAuthenticator *)(uint64_t)self willMoveToState:v5];
  }
  if (self->_state > a3)
  {
    if (a3 > 1)
    {
      if ((unint64_t)a3 > 3)
      {
        if (a3 != 4) {
          return;
        }
        goto LABEL_14;
      }
    }
    else
    {
      OspreyLoggingInit();
      v6 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG)) {
        -[OspreyAbsintheAuthenticator willMoveToState:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
      [(OspreyConnectionPreferences *)self->_connectionPreferences deleteCertificateData];
    }
    OspreyLoggingInit();
    objc_super v14 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG)) {
      -[OspreyAbsintheAuthenticator willMoveToState:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    nacContext = self->_nacContext;
    if (nacContext) {
      IW1PcFszqNK((uint64_t)nacContext);
    }
    self->_nacContext = 0;
LABEL_14:
    OspreyLoggingInit();
    v23 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG)) {
      -[OspreyAbsintheAuthenticator willMoveToState:](v23, v24, v25, v26, v27, v28, v29, v30);
    }
    sessionInfo = self->_sessionInfo;
    self->_sessionInfo = 0;

    sessionExpireOn = self->_sessionExpireOn;
    self->_sessionExpireOn = 0;
  }
}

- (void)signData:(id)a3 success:(id)a4 failure:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  OspreyLoggingInit();
  uint64_t v11 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[OspreyAbsintheAuthenticator signData:success:failure:]";
    _os_log_impl(&dword_1BEDB4000, v11, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__OspreyAbsintheAuthenticator_signData_success_failure___block_invoke;
  v15[3] = &unk_1E63CBAA8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(OspreyAbsintheAuthenticator *)self _ensureAuthenticatedWithCompletion:v15 failure:v12];
}

void __56__OspreyAbsintheAuthenticator_signData_success_failure___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _readyToSignClientData]
    && ([*(id *)(a1 + 32) _signData:*(void *)(a1 + 40)],
        (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = (id)v2;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(*(void *)(a1 + 32) + 8) setAbsintheTimestampForKey:@"FinalSignedData"];
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OspreyAbsintheAuthenticationErrorDomain" code:1 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (id)_signData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v12 = 0;
  nacContext = self->_nacContext;
  if (!nacContext)
  {
    OspreyLoggingInit();
    id v9 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
      -[OspreyAbsintheAuthenticator _signData:](v9);
    }
    goto LABEL_7;
  }
  id v7 = v4;
  t1BoNctgaUu66((uint64_t)nacContext, [v7 bytes], objc_msgSend(v7, "length"), (uint64_t)&v12);
  if (v8)
  {
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
      -[OspreyAbsintheAuthenticator _signData:]();
    }
LABEL_7:
    id v10 = 0;
    goto LABEL_8;
  }
  id v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:0];
  if (Be81a395Bf0(v12))
  {
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
      -[OspreyAbsintheAuthenticator _signData:]();
    }
  }
LABEL_8:

  return v10;
}

- (BOOL)isSessionInfoExpired
{
  if (self->_state < 5) {
    return 1;
  }
  p_sessionExpireOn = (uint64_t *)&self->_sessionExpireOn;
  if (!self->_sessionExpireOn) {
    return 1;
  }
  OspreyLoggingInit();
  id v3 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG)) {
    [(OspreyAbsintheAuthenticator *)p_sessionExpireOn isSessionInfoExpired];
  }
  id v4 = (void *)*p_sessionExpireOn;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v6 = [v4 compare:v5] == -1;

  return v6;
}

- (void)_ensureAuthenticatedWithCompletion:(id)a3 failure:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void (**)(void))a3;
  id v7 = a4;
  int64_t state = self->_state;
  if (state != 5)
  {
    if (state == 2)
    {
      OspreyLoggingInit();
      id v16 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
        _os_log_impl(&dword_1BEDB4000, v16, OS_LOG_TYPE_INFO, "%s [Absinthe state] Certificate fetched state", buf, 0xCu);
      }
      [(OspreyGRPCChannel *)self->_channel setAbsintheTimestampForKey:@"CreateSessionStart"];
      id v17 = [(OspreyConnectionPreferences *)self->_connectionPreferences certificateData];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_13;
      v28[3] = &unk_1E63CBB98;
      v28[4] = self;
      uint64_t v29 = v6;
      id v30 = v7;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_4;
      v26[3] = &unk_1E63CBB70;
      id v27 = v30;
      [(OspreyAbsintheAuthenticator *)self _initializeAbsintheClientWithCertificateData:v17 success:v28 fail:v26];

      id v18 = v29;
      goto LABEL_27;
    }
    if (!state)
    {
      OspreyLoggingInit();
      id v9 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
        _os_log_impl(&dword_1BEDB4000, v9, OS_LOG_TYPE_INFO, "%s [Absinthe state] Initial state", buf, 0xCu);
      }
      [(OspreyGRPCChannel *)self->_channel setAbsintheTimestampForKey:@"GetCertificateStart"];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke;
      v35[3] = &unk_1E63CBAD0;
      v35[4] = self;
      v36 = v6;
      id v10 = v7;
      id v37 = v10;
      uint64_t v11 = (void (**)(void))MEMORY[0x1C189D2A0](v35);
      [(OspreyAbsintheAuthenticator *)self setState:1];
      uint64_t v12 = [(OspreyConnectionPreferences *)self->_connectionPreferences certificateData];
      if (v12)
      {
        OspreyLoggingInit();
        id v13 = OspreyLogContextAbsinthe;
        if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v39 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
          _os_log_impl(&dword_1BEDB4000, v13, OS_LOG_TYPE_INFO, "%s Certificate found in cache!", buf, 0xCu);
        }
        v11[2](v11);
      }
      else
      {
        authService = self->_authService;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_10;
        v33[3] = &unk_1E63CBAF8;
        v33[4] = self;
        v34 = v11;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_2;
        v31[3] = &unk_1E63CBB20;
        v31[4] = self;
        id v32 = v10;
        [(OspreyAuthService *)authService certificateDataWithSuccess:v33 failure:v31];
      }
      id v18 = v36;
LABEL_27:

      goto LABEL_28;
    }
    if (![(OspreyAbsintheAuthenticator *)self isSessionInfoExpired])
    {
      uint64_t v19 = self;
      uint64_t v20 = 5;
      goto LABEL_24;
    }
LABEL_19:
    uint64_t v19 = self;
    uint64_t v20 = 2;
LABEL_24:
    [(OspreyAbsintheAuthenticator *)v19 setState:v20];
    [(OspreyAbsintheAuthenticator *)self _ensureAuthenticatedWithCompletion:v6 failure:v7];
    goto LABEL_28;
  }
  OspreyLoggingInit();
  id v14 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
    _os_log_impl(&dword_1BEDB4000, v14, OS_LOG_TYPE_INFO, "%s [Absinthe state] Session Initialized state", buf, 0xCu);
  }
  [(OspreyGRPCChannel *)self->_channel setAbsintheTimestampForKey:@"SessionEstablishedStart"];
  if ([(OspreyAbsintheAuthenticator *)self isSessionInfoExpired])
  {
    OspreyLoggingInit();
    uint64_t v15 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
      _os_log_impl(&dword_1BEDB4000, v15, OS_LOG_TYPE_INFO, "%s Session info expired!", buf, 0xCu);
    }
    goto LABEL_19;
  }
  nDYmeMqvWb((uint64_t)self->_nacContext, (uint64_t)[(NSData *)self->_sessionInfo bytes], [(NSData *)self->_sessionInfo length]);
  if (v21)
  {
    if (v7)
    {
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"OspreyAbsintheAuthenticationNACClientErrorDomain" code:v21 userInfo:0];
      v23 = AbsintheErrorForState(3, v22);
      (*((void (**)(id, void *))v7 + 2))(v7, v23);
    }
  }
  else
  {
    OspreyLoggingInit();
    uint64_t v25 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[OspreyAbsintheAuthenticator _ensureAuthenticatedWithCompletion:failure:]";
      _os_log_impl(&dword_1BEDB4000, v25, OS_LOG_TYPE_INFO, "%s Session key established!", buf, 0xCu);
    }
    [(OspreyAbsintheAuthenticator *)self setState:6];
    [(OspreyGRPCChannel *)self->_channel setAbsintheTimestampForKey:@"SessionEstablishedEnd"];
    v6[2](v6);
  }
LABEL_28:
}

uint64_t __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setAbsintheTimestampForKey:@"GetCertificateEnd"];
  [*(id *)(a1 + 32) setState:2];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 _ensureAuthenticatedWithCompletion:v3 failure:v4];
}

uint64_t __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_10(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setCertificateData:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) setState:0];
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = AbsintheErrorForState(0, v4);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_13(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_2_14;
  v8[3] = &unk_1E63CBB48;
  v8[4] = v4;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_3;
  v6[3] = &unk_1E63CBB70;
  id v7 = *(id *)(a1 + 48);
  [v5 createClientSessionWithData:a2 success:v8 failure:v6];
}

void __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_2_14(uint64_t a1, void *a2, double a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a2;
  [v5 setAbsintheTimestampForKey:@"CreateSessionEnd"];
  [*(id *)(a1 + 32) setSessionInfo:v6];

  id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 56);
  *(void *)(v8 + 56) = v7;
  id v10 = v7;

  [*(id *)(a1 + 32) setState:5];
  [*(id *)(a1 + 32) _ensureAuthenticatedWithCompletion:*(void *)(a1 + 40) failure:*(void *)(a1 + 48)];
}

void __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_3(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    AbsintheErrorForState(2, a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __74__OspreyAbsintheAuthenticator__ensureAuthenticatedWithCompletion_failure___block_invoke_4(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    AbsintheErrorForState(1, a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_initializeAbsintheClientWithCertificateData:(id)a3 success:(id)a4 fail:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = a3;
  [(OspreyAbsintheAuthenticator *)self setState:3];
  id v11 = v10;
  uint64_t v12 = [v11 bytes];
  int v13 = [v11 length];

  KxmB0CKvgWt(v12, v13);
  int v15 = v14;
  if (v14 <= -44023)
  {
    if (v14 == -44302)
    {
      OspreyLoggingInit();
      id v18 = OspreyLogContextAbsinthe;
      if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
        -[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:](v18, v19, v20, v21, v22, v23, v24, v25);
      }
      goto LABEL_6;
    }
    if (v14 == -44204) {
      goto LABEL_4;
    }
    goto LABEL_17;
  }
  if ((v14 + 44022) <= 0x11 && ((1 << (v14 - 10)) & 0x30003) != 0)
  {
LABEL_4:
    [(OspreyConnectionPreferences *)self->_connectionPreferences deleteCertificateData];
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
      -[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:].cold.4();
    }
LABEL_6:
    [(OspreyAbsintheAuthenticator *)self setState:0];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"OspreyAbsintheAuthenticationNACClientErrorDomain" code:v15 userInfo:0];
    v9[2](v9, v16);
    goto LABEL_7;
  }
  if (v14)
  {
LABEL_17:
    OspreyLoggingInit();
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
      -[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:]();
    }
    goto LABEL_6;
  }
  [(OspreyAbsintheAuthenticator *)self setState:4];
  OspreyLoggingInit();
  id v17 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG)) {
    -[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:](v17);
  }
  self->_nacContext = 0;
  id v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:0];
  Be81a395Bf0(0);
  v8[2](v8, v16);
LABEL_7:
}

- (int64_t)state
{
  return self->_state;
}

- (NSData)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionExpireOn, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_connectionPreferences, 0);
  objc_storeStrong((id *)&self->_authService, 0);

  objc_storeStrong((id *)&self->_channel, 0);
}

- (void)willMoveToState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)willMoveToState:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)willMoveToState:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)willMoveToState:(os_log_t)log .cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  v5 = "-[OspreyAbsintheAuthenticator willMoveToState:]";
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s Moving from state %ld to %ld", (uint8_t *)&v4, 0x20u);
}

- (void)_signData:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[OspreyAbsintheAuthenticator _signData:]";
  _os_log_error_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_ERROR, "%s NacContext is null!", (uint8_t *)&v1, 0xCu);
}

- (void)_signData:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1BEDB4000, v0, v1, "%s Error disposing validation data %d", v2, v3, v4, v5, 2u);
}

- (void)_signData:.cold.3()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1BEDB4000, v0, v1, "%s Error signing data with NACSign: %d", v2, v3, v4, v5, 2u);
}

- (void)isSessionInfoExpired
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[OspreyAbsintheAuthenticator isSessionInfoExpired]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_1BEDB4000, a2, OS_LOG_TYPE_DEBUG, "%s SessionExpireOn: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_initializeAbsintheClientWithCertificateData:success:fail:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1BEDB4000, v0, v1, "%s NAC status: %d -- Error!", v2, v3, v4, v5, 2u);
}

- (void)_initializeAbsintheClientWithCertificateData:(os_log_t)log success:fail:.cold.2(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  uint64_t v2 = "-[OspreyAbsintheAuthenticator _initializeAbsintheClientWithCertificateData:success:fail:]";
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s NAC status: %d -- successful!", (uint8_t *)&v1, 0x12u);
}

- (void)_initializeAbsintheClientWithCertificateData:(uint64_t)a3 success:(uint64_t)a4 fail:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initializeAbsintheClientWithCertificateData:success:fail:.cold.4()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1BEDB4000, v0, v1, "%s NAC status: %d -- Error: certificate data outdated.", v2, v3, v4, v5, 2u);
}

@end