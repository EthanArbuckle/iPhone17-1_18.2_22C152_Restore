@interface SXProxyAuthenticationHandler
- (SXProxyAuthenticationCredentialFactory)credentialFactory;
- (SXProxyAuthenticationHandler)initWithCredentialFactory:(id)a3 proxyConfiguration:(id)a4 retryCount:(unint64_t)a5;
- (SXProxyConfiguration)proxyConfiguration;
- (unint64_t)retryCount;
- (void)handleAuthenticationChallenge:(id)a3 completion:(id)a4;
@end

@implementation SXProxyAuthenticationHandler

- (SXProxyAuthenticationHandler)initWithCredentialFactory:(id)a3 proxyConfiguration:(id)a4 retryCount:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SXProxyAuthenticationHandler;
  v11 = [(SXProxyAuthenticationHandler *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_credentialFactory, a3);
    objc_storeStrong((id *)&v12->_proxyConfiguration, a4);
    unint64_t v13 = SXProxyAuthenticationHandlerDefaultRetryCount;
    if (SXProxyAuthenticationHandlerDefaultRetryCount <= a5) {
      unint64_t v13 = a5;
    }
    v12->_retryCount = v13;
  }

  return v12;
}

- (void)handleAuthenticationChallenge:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 protectionSpace];
  id v9 = [v6 failureResponse];
  if ([v6 previousFailureCount] <= self->_retryCount)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 statusCode] == 407)
      {
        if ([v8 isProxy])
        {
          v12 = [(SXProxyConfiguration *)self->_proxyConfiguration proxyHost];

          if (v12)
          {
            unint64_t v13 = [v8 host];
            v14 = [(SXProxyConfiguration *)self->_proxyConfiguration proxyHost];
            char v15 = [v13 isEqualToString:v14];

            if (v15)
            {
              v16 = [v8 proxyType];
              char v17 = [v16 isEqualToString:*MEMORY[0x263EFC5C0]];

              if (v17)
              {
                v18 = [v8 authenticationMethod];
                char v19 = [v18 isEqualToString:*MEMORY[0x263EFC580]];

                if (v19)
                {
                  v20 = [(SXProxyAuthenticationHandler *)self credentialFactory];
                  v21 = [MEMORY[0x263EFF910] date];
                  v25[0] = MEMORY[0x263EF8330];
                  v25[1] = 3221225472;
                  v25[2] = __73__SXProxyAuthenticationHandler_handleAuthenticationChallenge_completion___block_invoke;
                  v25[3] = &unk_264652840;
                  id v26 = v7;
                  [v20 createCredentialForResponse:v9 date:v21 completion:v25];

                  goto LABEL_27;
                }
                if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR)) {
                  -[SXProxyAuthenticationHandler handleAuthenticationChallenge:completion:]();
                }
              }
              else if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR))
              {
                -[SXProxyAuthenticationHandler handleAuthenticationChallenge:completion:]();
              }
            }
            else
            {
              v24 = (void *)SXProxyLog;
              if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR)) {
                -[SXProxyAuthenticationHandler handleAuthenticationChallenge:completion:].cold.4(v24, v8);
              }
            }
          }
          else if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR))
          {
            -[SXProxyAuthenticationHandler handleAuthenticationChallenge:completion:]();
          }
        }
        else
        {
          v23 = SXProxyLog;
          if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_222AC5000, v23, OS_LOG_TYPE_DEFAULT, "Rejecting authentication challenge; protection space is not a proxy",
              buf,
              2u);
          }
        }
        (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 3, 0);
        goto LABEL_27;
      }
      v22 = SXProxyLog;
      if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222AC5000, v22, OS_LOG_TYPE_DEFAULT, "Performing default handling due to non-407 authentication challenge", buf, 2u);
      }
    }
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    goto LABEL_27;
  }
  id v10 = (void *)SXProxyLog;
  if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = [v6 previousFailureCount];
    _os_log_impl(&dword_222AC5000, v11, OS_LOG_TYPE_DEFAULT, "Cancelling authentication challenge due to failure count: %li", buf, 0xCu);
  }
  (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 2, 0);
LABEL_27:
}

void __73__SXProxyAuthenticationHandler_handleAuthenticationChallenge_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = SXProxyLog;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_222AC5000, v4, OS_LOG_TYPE_DEFAULT, "Using generated credentials for authentication handling", v6, 2u);
    }
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)SXProxyLog, OS_LOG_TYPE_ERROR)) {
      __73__SXProxyAuthenticationHandler_handleAuthenticationChallenge_completion___block_invoke_cold_1();
    }
    v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

- (SXProxyAuthenticationCredentialFactory)credentialFactory
{
  return self->_credentialFactory;
}

- (SXProxyConfiguration)proxyConfiguration
{
  return self->_proxyConfiguration;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyConfiguration, 0);
  objc_storeStrong((id *)&self->_credentialFactory, 0);
}

- (void)handleAuthenticationChallenge:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222AC5000, v0, v1, "Rejecting authentication challenge; missing proxy host configuration",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)handleAuthenticationChallenge:completion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222AC5000, v0, v1, "Rejecting authentication challenge; only basic proxies are supported",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)handleAuthenticationChallenge:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222AC5000, v0, v1, "Rejecting authentication challenge; only HTTPS proxies are supported",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)handleAuthenticationChallenge:(void *)a1 completion:(void *)a2 .cold.4(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 host];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_222AC5000, v3, OS_LOG_TYPE_ERROR, "Rejecting authentication challenge; unexpected proxy host %@",
    (uint8_t *)&v5,
    0xCu);
}

void __73__SXProxyAuthenticationHandler_handleAuthenticationChallenge_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_222AC5000, v0, v1, "Cancelling authentication challenge due to missing credentials", v2, v3, v4, v5, v6);
}

@end