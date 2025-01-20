@interface SASProximitySessionSharingTransport
- (CUMessageSession)actionMessageSession;
- (CUMessageSession)messageSession;
- (SASProximitySessionSharingTransport)initWithMessageSession:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)sendData:(id)a3 response:(id)a4;
- (void)setActionMessageSession:(id)a3;
- (void)setMessageSession:(id)a3;
@end

@implementation SASProximitySessionSharingTransport

- (SASProximitySessionSharingTransport)initWithMessageSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASProximitySessionSharingTransport;
  v5 = [(SASProximitySessionSharingTransport *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SASProximitySessionSharingTransport *)v5 setMessageSession:v4];
  }

  return v6;
}

- (void)activate
{
  id v3 = objc_alloc(MEMORY[0x1E4F5E138]);
  id v4 = [(SASProximitySessionSharingTransport *)self messageSession];
  v5 = (void *)[v3 initWithTemplate:v4];
  [(SASProximitySessionSharingTransport *)self setActionMessageSession:v5];

  v6 = [(SASProximitySessionSharingTransport *)self actionMessageSession];
  [v6 setLabel:@"Proximity Setup Sesssion"];

  v7 = [(SASProximitySessionSharingTransport *)self actionMessageSession];
  [v7 setInvalidationHandler:&__block_literal_global_0];

  objc_super v8 = [(SASProximitySessionSharingTransport *)self actionMessageSession];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__SASProximitySessionSharingTransport_activate__block_invoke_6;
  v10[3] = &unk_1E6CAB938;
  v10[4] = self;
  [v8 registerRequestID:@"Action" options:0 handler:v10];

  v9 = [(SASProximitySessionSharingTransport *)self actionMessageSession];
  [v9 activate];
}

void __47__SASProximitySessionSharingTransport_activate__block_invoke()
{
  v0 = +[SASLogging facility];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DCC71000, v0, OS_LOG_TYPE_DEFAULT, "Proximity message session invalidated!", v1, 2u);
  }
}

void __47__SASProximitySessionSharingTransport_activate__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [*(id *)(a1 + 32) receivedDataBlock];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) receivedDataBlock];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__SASProximitySessionSharingTransport_activate__block_invoke_2;
    v10[3] = &unk_1E6CAB910;
    id v11 = v7;
    ((void (**)(void, id, void *))v9)[2](v9, v6, v10);
  }
}

uint64_t __47__SASProximitySessionSharingTransport_activate__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  id v2 = [(SASProximitySessionSharingTransport *)self actionMessageSession];
  [v2 invalidate];
}

- (void)sendData:(id)a3 response:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(SASProximitySessionSharingTransport *)self actionMessageSession];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SASProximitySessionSharingTransport_sendData_response___block_invoke;
  v10[3] = &unk_1E6CAB960;
  id v11 = v6;
  id v9 = v6;
  [v8 sendRequestID:@"Action" options:0 request:v7 responseHandler:v10];
}

void __57__SASProximitySessionSharingTransport_sendData_response___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    if (a2)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      v14 = @"status";
      id v11 = [NSNumber numberWithInt:a2];
      v15[0] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v13 = [v10 errorWithDomain:@"SASProximityErrorDomain" code:-2 userInfo:v12];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v8);
    }
  }
}

- (CUMessageSession)messageSession
{
  return (CUMessageSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessageSession:(id)a3
{
}

- (CUMessageSession)actionMessageSession
{
  return (CUMessageSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActionMessageSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMessageSession, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
}

@end