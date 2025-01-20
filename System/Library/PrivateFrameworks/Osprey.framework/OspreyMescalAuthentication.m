@interface OspreyMescalAuthentication
- (BOOL)isSessionExpired;
- (OspreyMescalAuthentication)initWithChannel:(id)a3 connectionPreferences:(id)a4;
- (id)mescalSession;
- (unint64_t)authenticationStrategyVersion;
- (unint64_t)state;
- (void)_continuePreparationWithCompletion:(id)a3;
- (void)moveToState:(unint64_t)a3;
- (void)signData:(id)a3 success:(id)a4 failure:(id)a5;
@end

@implementation OspreyMescalAuthentication

- (OspreyMescalAuthentication)initWithChannel:(id)a3 connectionPreferences:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OspreyMescalAuthentication;
  v9 = [(OspreyMescalAuthentication *)&v13 init];
  if (v9)
  {
    v10 = [[OspreyAuthService alloc] initWithChannel:v7 authStrategyVersion:[(OspreyMescalAuthentication *)v9 authenticationStrategyVersion]];
    authService = v9->_authService;
    v9->_authService = v10;

    objc_storeStrong((id *)&v9->_connectionPreferences, a4);
    objc_storeStrong((id *)&v9->_grpcChannel, a3);
  }

  return v9;
}

- (unint64_t)authenticationStrategyVersion
{
  return 1;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)mescalSession
{
  mescalSession = self->_mescalSession;
  if (!mescalSession)
  {
    v4 = objc_alloc_init(OspreyMescalSession);
    v5 = self->_mescalSession;
    self->_mescalSession = v4;

    mescalSession = self->_mescalSession;
  }

  return mescalSession;
}

- (void)moveToState:(unint64_t)a3
{
  OspreyLoggingInit();
  v5 = OspreyLogContextDeviceAuth;
  if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_DEBUG)) {
    [(OspreyMescalAuthentication *)(uint64_t)self moveToState:v5];
  }
  if (self->_state > a3)
  {
    if (a3 != 1)
    {
      if (a3) {
        goto LABEL_12;
      }
      OspreyLoggingInit();
      v6 = OspreyLogContextDeviceAuth;
      if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_DEBUG)) {
        -[OspreyMescalAuthentication moveToState:](v6);
      }
      [(OspreyConnectionPreferences *)self->_connectionPreferences deleteCertificateData];
      certificateData = self->_certificateData;
      self->_certificateData = 0;
    }
    OspreyLoggingInit();
    id v8 = OspreyLogContextDeviceAuth;
    if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_DEBUG)) {
      -[OspreyMescalAuthentication moveToState:](v8);
    }
    mescalSession = self->_mescalSession;
    self->_mescalSession = 0;

    sessionExpiration = self->_sessionExpiration;
    self->_sessionExpiration = 0;
  }
LABEL_12:
  self->_state = a3;
}

- (BOOL)isSessionExpired
{
  sessionExpiration = self->_sessionExpiration;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(sessionExpiration) = [(NSDate *)sessionExpiration compare:v3] == NSOrderedAscending;

  return (char)sessionExpiration;
}

- (void)signData:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(OspreyMescalAuthentication *)self mescalSession];
  v12 = v11;
  if (v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__OspreyMescalAuthentication_signData_success_failure___block_invoke;
    v14[3] = &unk_1E63CC050;
    id v15 = v11;
    id v16 = v8;
    id v18 = v10;
    id v19 = v9;
    v17 = self;
    [(OspreyMescalAuthentication *)self _continuePreparationWithCompletion:v14];
  }
  else
  {
    objc_super v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OspreyMescalAuthentication" code:1 userInfo:&unk_1F1A036B8];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }
}

void __55__OspreyMescalAuthentication_signData_success_failure___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    id v10 = 0;
    id v7 = [v5 signData:v6 error:&v10];
    id v8 = v10;
    v4 = v8;
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9) {
      (*(void (**)(void))(a1[8] + 16))();
    }
    else {
      (*(void (**)(void))(a1[7] + 16))();
    }
  }
}

- (void)_continuePreparationWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  unint64_t v5 = [(OspreyMescalAuthentication *)self state];
  switch(v5)
  {
    case 2uLL:
      if (![(OspreyMescalAuthentication *)self isSessionExpired])
      {
        v4[2](v4, 0);
        break;
      }
      goto LABEL_7;
    case 1uLL:
      BOOL v9 = [(OspreyConnectionPreferences *)self->_connectionPreferences certificateData];
      id v10 = [(OspreyMescalAuthentication *)self mescalSession];
      id v18 = 0;
      v11 = [v10 handshakeRequestWithCertificateData:v9 error:&v18];
      id v12 = v18;

      if (v11)
      {
        authService = self->_authService;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_3;
        v16[3] = &unk_1E63CC078;
        v16[4] = self;
        v17 = v4;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_4;
        v14[3] = &unk_1E63CBB20;
        void v14[4] = self;
        id v15 = v17;
        [(OspreyAuthService *)authService createClientSessionWithData:v11 success:v16 failure:v14];
      }
      else
      {
        ((void (**)(id, id))v4)[2](v4, v12);
      }

      break;
    case 0uLL:
      uint64_t v6 = [(OspreyConnectionPreferences *)self->_connectionPreferences certificateData];
      certificateData = self->_certificateData;
      self->_certificateData = v6;

      if (!self->_certificateData)
      {
        id v8 = self->_authService;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke;
        v21[3] = &unk_1E63CBAF8;
        v21[4] = self;
        v22 = v4;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_2;
        v19[3] = &unk_1E63CBB20;
        v19[4] = self;
        v20 = v22;
        [(OspreyAuthService *)v8 certificateDataWithSuccess:v21 failure:v19];

        break;
      }
LABEL_7:
      [(OspreyMescalAuthentication *)self moveToState:1];
      [(OspreyMescalAuthentication *)self _continuePreparationWithCompletion:v4];
      break;
  }
}

void __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 24) setCertificateData:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v3;
  id v6 = v3;

  [*(id *)(a1 + 32) moveToState:1];
  [*(id *)(a1 + 32) _continuePreparationWithCompletion:*(void *)(a1 + 40)];
}

void __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 moveToState:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_3(uint64_t a1, void *a2, double a3)
{
  unint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a2;
  uint64_t v7 = [v5 dateWithTimeIntervalSinceNow:a3];
  uint64_t v8 = *(void *)(a1 + 32);
  BOOL v9 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = v7;

  id v10 = [*(id *)(a1 + 32) mescalSession];
  id v15 = 0;
  int v11 = [v10 completeWithHandshakeResponse:v6 error:&v15];

  id v12 = v15;
  objc_super v13 = *(void **)(a1 + 32);
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    [v13 moveToState:2];
    [*(id *)(a1 + 32) _continuePreparationWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    [v13 moveToState:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __65__OspreyMescalAuthentication__continuePreparationWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 moveToState:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_sessionExpiration, 0);
  objc_storeStrong((id *)&self->_grpcChannel, 0);
  objc_storeStrong((id *)&self->_connectionPreferences, 0);
  objc_storeStrong((id *)&self->_authService, 0);

  objc_storeStrong((id *)&self->_mescalSession, 0);
}

- (void)moveToState:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[OspreyMescalAuthentication moveToState:]";
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s Clearing session info", (uint8_t *)&v1, 0xCu);
}

- (void)moveToState:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[OspreyMescalAuthentication moveToState:]";
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s Removing cached certificate data", (uint8_t *)&v1, 0xCu);
}

- (void)moveToState:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 136315650;
  unint64_t v5 = "-[OspreyMescalAuthentication moveToState:]";
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s Moving from state %ld to %ld", (uint8_t *)&v4, 0x20u);
}

@end