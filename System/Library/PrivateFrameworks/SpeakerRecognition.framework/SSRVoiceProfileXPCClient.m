@interface SSRVoiceProfileXPCClient
- (OS_xpc_object)xpcConnection;
- (SSRVoiceProfileXPCClient)init;
- (SSRVoiceProfileXPCClientDelegate)delegate;
- (void)_handleListenerDisconnectedError:(id)a3;
- (void)_handleListenerError:(id)a3;
- (void)_handleListenerEvent:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)fetchEnrollmentStatusForSiriProfileId:(id)a3 forLanguageCode:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SSRVoiceProfileXPCClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setDelegate:(id)a3
{
}

- (SSRVoiceProfileXPCClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSRVoiceProfileXPCClientDelegate *)WeakRetained;
}

- (void)fetchEnrollmentStatusForSiriProfileId:(id)a3 forLanguageCode:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  *(_OWORD *)keys = xmmword_264429878;
  v30 = "siriProfileId";
  values[0] = xpc_int64_create(1);
  if (v9) {
    xpc_object_t v11 = xpc_string_create((const char *)[v9 UTF8String]);
  }
  else {
    xpc_object_t v11 = xpc_null_create();
  }
  id v12 = v11;
  values[1] = v12;
  if (v8) {
    xpc_object_t v13 = xpc_string_create((const char *)[v8 UTF8String]);
  }
  else {
    xpc_object_t v13 = xpc_null_create();
  }
  values[2] = v13;

  xpc_object_t v14 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  *(_OWORD *)v27 = xmmword_264429890;
  v26[0] = xpc_int64_create(2);
  id v15 = v14;
  v26[1] = v15;
  xpc_object_t v16 = xpc_dictionary_create((const char *const *)v27, v26, 2uLL);
  v17 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SSRVoiceProfileXPCClient fetchEnrollmentStatusForSiriProfileId:forLanguageCode:completion:]";
    _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Sending xpc message", buf, 0xCu);
  }
  xpcConnection = self->_xpcConnection;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __93__SSRVoiceProfileXPCClient_fetchEnrollmentStatusForSiriProfileId_forLanguageCode_completion___block_invoke;
  handler[3] = &unk_2644298A8;
  id v19 = v10;
  id v23 = v19;
  xpc_connection_send_message_with_reply(xpcConnection, v16, 0, handler);

  for (uint64_t i = 1; i != -1; --i)
  for (uint64_t j = 2; j != -1; --j)
}

void __93__SSRVoiceProfileXPCClient_fetchEnrollmentStatusForSiriProfileId_forLanguageCode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    BOOL v4 = xpc_dictionary_get_BOOL(v3, "result");
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, BOOL, void))(v5 + 16))(v5, v4, 0);
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1101 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    BOOL v4 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[SSRVoiceProfileXPCClient dealloc]";
      _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s disconnect VoiceProfileXPCClient", buf, 0xCu);
      xpcConnection = self->_xpcConnection;
    }
    xpc_connection_cancel(xpcConnection);
    uint64_t v5 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SSRVoiceProfileXPCClient;
  [(SSRVoiceProfileXPCClient *)&v6 dealloc];
}

- (void)_handleListenerDisconnectedError:(id)a3
{
  BOOL v4 = [(SSRVoiceProfileXPCClient *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained ssrVoiceProfileXPCClient:self didDisconnect:1];
  }
}

- (void)_handleListenerError:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = v4;
  if (!v4)
  {
    id v10 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v12 = 136315394;
    xpc_object_t v13 = "-[SSRVoiceProfileXPCClient _handleListenerError:]";
    __int16 v14 = 2050;
    id v15 = 0;
    id v8 = "%s cannot handle error : error = %{public}p";
    goto LABEL_15;
  }
  if (v4 != (id)MEMORY[0x263EF86A8] && v4 != (id)MEMORY[0x263EF86A0])
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF86B0]);
    id v10 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v12 = 136315394;
    xpc_object_t v13 = "-[SSRVoiceProfileXPCClient _handleListenerError:]";
    __int16 v14 = 2082;
    id v15 = string;
    id v8 = "%s connection error: %{public}s";
LABEL_15:
    _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, 0x16u);
    goto LABEL_13;
  }
  v7 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    xpc_object_t v13 = "-[SSRVoiceProfileXPCClient _handleListenerError:]";
    _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Listener connection disconnected", (uint8_t *)&v12, 0xCu);
  }
  [(SSRVoiceProfileXPCClient *)self _handleListenerDisconnectedError:v5];
LABEL_13:
}

- (void)_handleListenerEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    if (MEMORY[0x21D4B2B70](v4) == MEMORY[0x263EF8720])
    {
      [(SSRVoiceProfileXPCClient *)self _handleListenerError:v5];
      goto LABEL_9;
    }
    objc_super v6 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      int v12 = "-[SSRVoiceProfileXPCClient _handleListenerEvent:]";
      v7 = "%s ignore unknown types of message ";
      id v8 = v6;
      uint32_t v9 = 12;
LABEL_7:
      _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    id v10 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      int v12 = "-[SSRVoiceProfileXPCClient _handleListenerEvent:]";
      __int16 v13 = 2050;
      uint64_t v14 = 0;
      v7 = "%s cannot handle event : event = %{public}p";
      id v8 = v10;
      uint32_t v9 = 22;
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (void)connect
{
  mach_service = xpc_connection_create_mach_service("com.apple.private.ssr.voiceprofileservice", 0, 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = mach_service;

  objc_initWeak(&location, self);
  char v5 = self->_xpcConnection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__SSRVoiceProfileXPCClient_connect__block_invoke;
  v6[3] = &unk_264429858;
  objc_copyWeak(&v7, &location);
  xpc_connection_set_event_handler(v5, v6);
  xpc_connection_activate(self->_xpcConnection);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __35__SSRVoiceProfileXPCClient_connect__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleListenerEvent:v3];
}

- (SSRVoiceProfileXPCClient)init
{
  v4.receiver = self;
  v4.super_class = (Class)SSRVoiceProfileXPCClient;
  v2 = [(SSRVoiceProfileXPCClient *)&v4 init];
  if (v2) {
    SSRLogInitIfNeeded();
  }
  return v2;
}

@end