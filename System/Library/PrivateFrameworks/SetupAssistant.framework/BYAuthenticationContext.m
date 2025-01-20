@interface BYAuthenticationContext
+ (void)createContextWithSecret:(id)a3 policy:(int64_t)a4 options:(id)a5 completion:(id)a6;
- (BYAuthenticationContext)initWithSecret:(id)a3;
- (LAContext)underlyingContext;
- (NSString)secret;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)setSecret:(id)a3;
- (void)setUnderlyingContext:(id)a3;
@end

@implementation BYAuthenticationContext

- (BYAuthenticationContext)initWithSecret:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYAuthenticationContext;
  v6 = [(BYAuthenticationContext *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_secret, a3);
    v8 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
    underlyingContext = v7->_underlyingContext;
    v7->_underlyingContext = v8;

    [(LAContext *)v7->_underlyingContext setUiDelegate:v7];
  }

  return v7;
}

+ (void)createContextWithSecret:(id)a3 policy:(int64_t)a4 options:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [[BYAuthenticationContext alloc] initWithSecret:v11];

  v13 = [(BYAuthenticationContext *)v12 underlyingContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__BYAuthenticationContext_createContextWithSecret_policy_options_completion___block_invoke;
  v16[3] = &unk_1E5D2BBE8;
  v17 = v12;
  id v18 = v9;
  v14 = v12;
  id v15 = v9;
  [v13 evaluatePolicy:a4 options:v10 reply:v16];
}

void __77__BYAuthenticationContext_createContextWithSecret_policy_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a3;
  id v6 = [v4 underlyingContext];
  (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  v7 = [a4 objectForKeyedSubscript:&unk_1EFE4E298];
  v8 = v7;
  if (a3 == 2 && [v7 BOOLValue])
  {
    id v9 = _BYLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BYAuthenticationContext event:params:reply:](v9);
    }

    id v10 = [(BYAuthenticationContext *)self secret];
    id v11 = [v10 dataUsingEncoding:4];

    [(BYAuthenticationContext *)self setSecret:0];
    v12 = [(BYAuthenticationContext *)self underlyingContext];
    [v12 setCredential:v11 forProcessedEvent:2 credentialType:-1 reply:&__block_literal_global_2];
  }
}

void __46__BYAuthenticationContext_event_params_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _BYLoggingFacility();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __46__BYAuthenticationContext_event_params_reply___block_invoke_cold_1(v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v7 = 0;
      v8 = v4;
    }
    else if (v4)
    {
      id v9 = NSString;
      a2 = [v4 domain];
      v8 = [v9 stringWithFormat:@"<Error domain: %@, code %ld>", a2, objc_msgSend(v4, "code")];
      int v7 = 1;
    }
    else
    {
      int v7 = 0;
      v8 = 0;
    }
    *(_DWORD *)buf = 138543362;
    id v11 = v8;
    _os_log_error_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_ERROR, "Failed to set credentials for context: %{public}@", buf, 0xCu);
    if (v7)
    {
    }
  }
}

- (NSString)secret
{
  return self->_secret;
}

- (void)setSecret:(id)a3
{
}

- (LAContext)underlyingContext
{
  return self->_underlyingContext;
}

- (void)setUnderlyingContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingContext, 0);
  objc_storeStrong((id *)&self->_secret, 0);
}

- (void)event:(os_log_t)log params:reply:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A7DED000, log, OS_LOG_TYPE_DEBUG, "Setting credentials on context", v1, 2u);
}

void __46__BYAuthenticationContext_event_params_reply___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A7DED000, log, OS_LOG_TYPE_DEBUG, "Credentials set successful on context", v1, 2u);
}

@end