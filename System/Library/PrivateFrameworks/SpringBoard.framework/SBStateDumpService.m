@interface SBStateDumpService
- (BOOL)_authenticateClient:(id)a3;
- (SBStateDumpService)init;
- (void)systemServiceServer:(id)a3 client:(id)a4 disableRemoteStateDumpWithCompletion:(id)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 enableRemoteStateDumpWithTimeout:(int64_t)a5 completion:(id)a6;
- (void)systemServiceServer:(id)a3 client:(id)a4 requestStateDump:(unint64_t)a5 toTextFileAtPath:(id)a6;
- (void)systemServiceServer:(id)a3 client:(id)a4 requestStateDump:(unint64_t)a5 withCompletion:(id)a6;
@end

@implementation SBStateDumpService

- (SBStateDumpService)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBStateDumpService;
  v2 = [(SBStateDumpService *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.statedump"];
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    v5 = +[SBSystemServiceServer sharedInstance];
    [v5 setStateDumpDelegate:v2];
  }
  return v2;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 requestStateDump:(unint64_t)a5 withCompletion:(id)a6
{
  id v9 = a6;
  if ([(SBStateDumpService *)self _authenticateClient:a4])
  {
    if (a5 == 1) {
      [(id)SBApp _dumpLoggingStateCaptureWithCompletion:v9];
    }
    else {
      (*((void (**)(id, void, void, __CFString *))v9 + 2))(v9, 0, 0, @"Unrecognized state dump type.");
    }
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 requestStateDump:(unint64_t)a5 toTextFileAtPath:(id)a6
{
  id v10 = a6;
  BOOL v9 = [(SBStateDumpService *)self _authenticateClient:a4];
  if (a5 == 1 && v9) {
    [(id)SBApp _dumpLoggingStateCaptureToTextFileAtPath:v10];
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 enableRemoteStateDumpWithTimeout:(int64_t)a5 completion:(id)a6
{
  id v9 = a6;
  if ([(SBStateDumpService *)self _authenticateClient:a4]) {
    [(id)SBApp _enableRemoteStateDumpWithTimeout:a5 withCompletion:v9];
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 disableRemoteStateDumpWithCompletion:(id)a5
{
  id v7 = a5;
  if ([(SBStateDumpService *)self _authenticateClient:a4]) {
    [(id)SBApp _disableRemoteStateDumpWithCompletion:v7];
  }
}

- (BOOL)_authenticateClient:(id)a3
{
  id v4 = a3;
  char v5 = [(FBServiceClientAuthenticator *)self->_clientAuthenticator authenticateClient:v4];
  if ((v5 & 1) == 0)
  {
    v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBStateDumpService _authenticateClient:](v4, v6);
    }
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)_authenticateClient:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  char v5 = v3;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[SBStateDumpService] Rejecting request because client '%@' does not have the required entitlement.", (uint8_t *)&v4, 0xCu);
}

@end