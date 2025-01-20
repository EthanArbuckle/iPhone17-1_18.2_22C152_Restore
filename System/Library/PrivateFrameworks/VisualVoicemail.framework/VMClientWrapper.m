@interface VMClientWrapper
+ (BOOL)isVMXPCAvailable;
+ (id)voicemailClientXPCInterface;
+ (id)voicemailServerXPCInterface;
- (BOOL)pingRetry;
- (NSXPCConnection)clientConnection;
- (VMClientWrapper)init;
- (VMClientXPCProtocol)manager;
- (id)asynchronousServerConnectionWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)setClientConnection:(id)a3;
- (void)setManager:(id)a3;
- (void)setPingRetry:(BOOL)a3;
@end

@implementation VMClientWrapper

- (VMClientWrapper)init
{
  if ([(id)objc_opt_class() isVMXPCAvailable])
  {
    v6.receiver = self;
    v6.super_class = (Class)VMClientWrapper;
    self = [(VMClientWrapper *)&v6 init];
    v3 = self;
  }
  else
  {
    v4 = vm_framework_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C797000, v4, OS_LOG_TYPE_DEFAULT, "VMD is not available", buf, 2u);
    }

    v3 = 0;
  }

  return v3;
}

+ (BOOL)isVMXPCAvailable
{
  if (isVMXPCAvailable_onceToken != -1) {
    dispatch_once(&isVMXPCAvailable_onceToken, &__block_literal_global_163);
  }
  return isVMXPCAvailable_isVMXPCAvailable;
}

- (NSXPCConnection)clientConnection
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  clientConnection = v2->_clientConnection;
  if (!clientConnection)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.voicemail.vmd" options:4096];
    v5 = v2->_clientConnection;
    v2->_clientConnection = (NSXPCConnection *)v4;

    objc_super v6 = [(id)objc_opt_class() voicemailClientXPCInterface];
    [(NSXPCConnection *)v2->_clientConnection setExportedInterface:v6];

    v7 = [(id)objc_opt_class() voicemailServerXPCInterface];
    [(NSXPCConnection *)v2->_clientConnection setRemoteObjectInterface:v7];

    v8 = [(VMClientWrapper *)v2 manager];
    [(NSXPCConnection *)v2->_clientConnection setExportedObject:v8];

    v2->_pingRetry = 0;
    v9 = vm_framework_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v2->_clientConnection;
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_impl(&dword_21C797000, v9, OS_LOG_TYPE_DEFAULT, "XPC connection created %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v2);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __35__VMClientWrapper_clientConnection__block_invoke;
    v18[3] = &unk_26441FC30;
    objc_copyWeak(&v19, (id *)buf);
    [(NSXPCConnection *)v2->_clientConnection setInvalidationHandler:v18];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __35__VMClientWrapper_clientConnection__block_invoke_178;
    v16 = &unk_26441FC30;
    objc_copyWeak(&v17, (id *)buf);
    [(NSXPCConnection *)v2->_clientConnection setInterruptionHandler:&v13];
    [(NSXPCConnection *)v2->_clientConnection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
    clientConnection = v2->_clientConnection;
  }
  v11 = clientConnection;
  objc_sync_exit(v2);

  return v11;
}

+ (id)voicemailServerXPCInterface
{
  if (voicemailServerXPCInterface_onceToken != -1) {
    dispatch_once(&voicemailServerXPCInterface_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)voicemailServerXPCInterface_xpcInterface;
  return v2;
}

+ (id)voicemailClientXPCInterface
{
  if (voicemailClientXPCInterface_onceToken != -1) {
    dispatch_once(&voicemailClientXPCInterface_onceToken, &__block_literal_global_141);
  }
  v2 = (void *)voicemailClientXPCInterface_xpcInterface;
  return v2;
}

- (void)setManager:(id)a3
{
}

- (VMClientXPCProtocol)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (VMClientXPCProtocol *)WeakRetained;
}

void __46__VMClientWrapper_voicemailClientXPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD1B4C8];
  v1 = (void *)voicemailClientXPCInterface_xpcInterface;
  voicemailClientXPCInterface_xpcInterface = v0;

  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(id)voicemailClientXPCInterface_xpcInterface setClasses:v8 forSelector:sel_voicemailsUpdated_ argumentIndex:0 ofReply:0];
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  [(id)voicemailClientXPCInterface_xpcInterface setClasses:v7 forSelector:sel_updateAccounts_ argumentIndex:0 ofReply:0];
}

void __46__VMClientWrapper_voicemailServerXPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD1E950];
  v1 = (void *)voicemailServerXPCInterface_xpcInterface;
  voicemailServerXPCInterface_xpcInterface = v0;

  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  id v53 = (id)objc_claimAutoreleasedReturnValue();
  [(id)voicemailServerXPCInterface_xpcInterface setClasses:v53 forSelector:sel_requestInitialState_ argumentIndex:1 ofReply:1];
  [(id)voicemailServerXPCInterface_xpcInterface setClasses:v53 forSelector:sel_allVoicemails_ argumentIndex:0 ofReply:1];
  [(id)voicemailServerXPCInterface_xpcInterface setClasses:v53 forSelector:sel_requestTranscriptionProgress_ argumentIndex:0 ofReply:0];
  [(id)voicemailServerXPCInterface_xpcInterface setClasses:v53 forSelector:sel_insertVoicemail_ argumentIndex:0 ofReply:0];
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [(id)voicemailServerXPCInterface_xpcInterface setClasses:v12 forSelector:sel_accounts_ argumentIndex:0 ofReply:1];
  uint64_t v13 = (void *)voicemailServerXPCInterface_xpcInterface;
  uint64_t v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v13 setClasses:v14 forSelector:sel_isAccountSubscribed_reply_ argumentIndex:0 ofReply:0];

  v15 = (void *)voicemailServerXPCInterface_xpcInterface;
  v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v15 setClasses:v16 forSelector:sel_isAccountOnline_reply_ argumentIndex:0 ofReply:0];

  id v17 = (void *)voicemailServerXPCInterface_xpcInterface;
  v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v17 setClasses:v18 forSelector:sel_isPasscodeChangeSupportedForAccountUUID_reply_ argumentIndex:0 ofReply:0];

  id v19 = (void *)voicemailServerXPCInterface_xpcInterface;
  v20 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v19 setClasses:v20 forSelector:sel_minimumPasscodeLengthForAccountUUID_reply_ argumentIndex:0 ofReply:0];

  v21 = (void *)voicemailServerXPCInterface_xpcInterface;
  uint64_t v22 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v21 setClasses:v22 forSelector:sel_maximumPasscodeLengthForAccountUUID_reply_ argumentIndex:0 ofReply:0];

  v23 = (void *)voicemailServerXPCInterface_xpcInterface;
  v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v23 setClasses:v24 forSelector:sel_setPasscode_forAccountUUID_reply_ argumentIndex:0 ofReply:1];

  v25 = (void *)voicemailServerXPCInterface_xpcInterface;
  v26 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v25 setClasses:v26 forSelector:sel_setPasscode_forAccountUUID_reply_ argumentIndex:0 ofReply:0];

  v27 = (void *)voicemailServerXPCInterface_xpcInterface;
  v28 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v27 setClasses:v28 forSelector:sel_setPasscode_forAccountUUID_reply_ argumentIndex:1 ofReply:0];

  v29 = (void *)voicemailServerXPCInterface_xpcInterface;
  v30 = (void *)MEMORY[0x263EFFA08];
  uint64_t v31 = objc_opt_class();
  v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  [v29 setClasses:v32 forSelector:sel_greetingForAccountUUID_reply_ argumentIndex:0 ofReply:1];

  v33 = (void *)voicemailServerXPCInterface_xpcInterface;
  v34 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v33 setClasses:v34 forSelector:sel_greetingForAccountUUID_reply_ argumentIndex:0 ofReply:0];

  v35 = (void *)voicemailServerXPCInterface_xpcInterface;
  v36 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v35 setClasses:v36 forSelector:sel_isGreetingChangeSupportedForAccountUUID_reply_ argumentIndex:0 ofReply:0];

  v37 = (void *)voicemailServerXPCInterface_xpcInterface;
  v38 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v37 setClasses:v38 forSelector:sel_maximumGreetingDurationForAccountUUID_reply_ argumentIndex:0 ofReply:0];

  v39 = (void *)voicemailServerXPCInterface_xpcInterface;
  v40 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v39 setClasses:v40 forSelector:sel_setGreeting_forAccountUUID_reply_ argumentIndex:0 ofReply:1];

  v41 = (void *)voicemailServerXPCInterface_xpcInterface;
  v42 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v41 setClasses:v42 forSelector:sel_setGreeting_forAccountUUID_reply_ argumentIndex:0 ofReply:0];

  v43 = (void *)voicemailServerXPCInterface_xpcInterface;
  v44 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v43 setClasses:v44 forSelector:sel_setGreeting_forAccountUUID_reply_ argumentIndex:1 ofReply:0];

  v45 = (void *)voicemailServerXPCInterface_xpcInterface;
  v46 = (void *)MEMORY[0x263EFFA08];
  uint64_t v47 = objc_opt_class();
  v48 = objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
  [v45 setClasses:v48 forSelector:sel_messagesForMailboxType_limit_offset_reply_ argumentIndex:0 ofReply:1];

  v49 = (void *)voicemailServerXPCInterface_xpcInterface;
  v50 = (void *)MEMORY[0x263EFFA08];
  uint64_t v51 = objc_opt_class();
  v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
  [v49 setClasses:v52 forSelector:sel_messagesForMailboxType_read_limit_offset_reply_ argumentIndex:0 ofReply:1];
}

uint64_t __35__VMClientWrapper_isVMXPCAvailable__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isVMXPCAvailable_isVMXPCAvailable = result;
  return result;
}

- (id)asynchronousServerConnectionWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMClientWrapper *)self clientConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__VMClientWrapper_asynchronousServerConnectionWithErrorHandler___block_invoke;
  v9[3] = &unk_26441FBC8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __64__VMClientWrapper_asynchronousServerConnectionWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = vm_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__VMClientWrapper_asynchronousServerConnectionWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __35__VMClientWrapper_clientConnection__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = vm_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_21C797000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated.", (uint8_t *)&v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    [v5 setClientConnection:0];
    if ([v5 pingRetry])
    {
      [v5 setPingRetry:0];
      id v6 = vm_framework_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [v5 clientConnection];
        int v9 = 138412290;
        id v10 = v7;
        _os_log_impl(&dword_21C797000, v6, OS_LOG_TYPE_DEFAULT, "XPC attempting to ping connection %@", (uint8_t *)&v9, 0xCu);
      }
      uint64_t v8 = [v5 asynchronousServerConnectionWithErrorHandler:&__block_literal_global_171];
      [v8 ping:&__block_literal_global_175];
    }
    else
    {
      uint64_t v8 = vm_framework_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_21C797000, v8, OS_LOG_TYPE_DEFAULT, "XPC connection deallocated", (uint8_t *)&v9, 2u);
      }
    }

    objc_sync_exit(v5);
  }
}

void __35__VMClientWrapper_clientConnection__block_invoke_169(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __35__VMClientWrapper_clientConnection__block_invoke_169_cold_1((uint64_t)v2, v3);
  }
}

void __35__VMClientWrapper_clientConnection__block_invoke_172(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = vm_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "NO";
    if (a2) {
      id v4 = "YES";
    }
    int v5 = 136315138;
    id v6 = v4;
    _os_log_impl(&dword_21C797000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection reestablished with ping response %s", (uint8_t *)&v5, 0xCu);
  }
}

void __35__VMClientWrapper_clientConnection__block_invoke_178(uint64_t a1)
{
  id v2 = vm_framework_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C797000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted.", v4, 2u);
  }

  id v3 = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_sync_enter(v3);
  if (v3)
  {
    [v3[2] invalidate];
    [v3 setClientConnection:0];
  }
  objc_sync_exit(v3);
}

- (void)setClientConnection:(id)a3
{
  id v6 = (NSXPCConnection *)a3;
  int v5 = self;
  objc_sync_enter(v5);
  if (v5->_clientConnection != v6) {
    objc_storeStrong((id *)&v5->_clientConnection, a3);
  }
  objc_sync_exit(v5);
}

- (void)setPingRetry:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_pingRetry != v3) {
    obj->_pingRetry = v3;
  }
  objc_sync_exit(obj);
}

- (void)dealloc
{
  self->_pingRetry = 0;
  [(NSXPCConnection *)self->_clientConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VMClientWrapper;
  [(VMClientWrapper *)&v3 dealloc];
}

- (BOOL)pingRetry
{
  return self->_pingRetry;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_clientConnection, 0);
}

void __64__VMClientWrapper_asynchronousServerConnectionWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C797000, a2, OS_LOG_TYPE_ERROR, "Failed to create remote object proxy: %@", (uint8_t *)&v2, 0xCu);
}

void __35__VMClientWrapper_clientConnection__block_invoke_169_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C797000, a2, OS_LOG_TYPE_ERROR, "XPC connection failed to ping after interruption %@", (uint8_t *)&v2, 0xCu);
}

@end