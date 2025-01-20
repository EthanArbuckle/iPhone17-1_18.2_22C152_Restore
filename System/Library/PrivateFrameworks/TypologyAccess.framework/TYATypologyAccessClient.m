@interface TYATypologyAccessClient
- (BOOL)removeAllTypologyFilesWithError:(id *)a3;
- (BOOL)removeTypologyFileWithURLHandle:(id)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 toTypologyFileWithName:(id)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (TYATypologyAccessClient)init;
- (TYATypologyAccessClient)initWithAccessMode:(unint64_t)a3;
- (void)_disconnect;
- (void)_initializeConnection;
- (void)_setTypologyAccessMode:(unint64_t)a3;
- (void)dealloc;
- (void)enumerateTypologyLogs:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation TYATypologyAccessClient

- (TYATypologyAccessClient)init
{
  return [(TYATypologyAccessClient *)self initWithAccessMode:0];
}

- (TYATypologyAccessClient)initWithAccessMode:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TYATypologyAccessClient;
  v4 = [(TYATypologyAccessClient *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(TYATypologyAccessClient *)v4 _initializeConnection];
    [(TYATypologyAccessClient *)v5 _setTypologyAccessMode:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(TYATypologyAccessClient *)self _disconnect];
  v3.receiver = self;
  v3.super_class = (Class)TYATypologyAccessClient;
  [(TYATypologyAccessClient *)&v3 dealloc];
}

- (void)_initializeConnection
{
  objc_super v3 = TYALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23546D000, v3, OS_LOG_TYPE_INFO, "Client is establishing connection to server.", v8, 2u);
  }

  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.TextInput.typologyAccess" options:0];
  connection = self->_connection;
  self->_connection = v4;

  v6 = self->_connection;
  objc_super v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E89AA30];
  [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

  [(NSXPCConnection *)self->_connection resume];
}

- (void)_disconnect
{
  if (self->_connection)
  {
    objc_super v3 = TYALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23546D000, v3, OS_LOG_TYPE_INFO, "Client is disconnecting from server.", v5, 2u);
    }

    [(NSXPCConnection *)self->_connection invalidate];
    connection = self->_connection;
    self->_connection = 0;
  }
}

- (void)enumerateTypologyLogs:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(TYATypologyAccessClient *)self connection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke;
  v11[3] = &unk_264C55018;
  v11[4] = &v12;
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];

  [v6 startEnumeration];
  if (v6 && !*((unsigned char *)v13 + 24))
  {
    uint64_t v7 = MEMORY[0x263EF8330];
    do
    {
      v8[0] = v7;
      v8[1] = 3221225472;
      v8[2] = __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_17;
      v8[3] = &unk_264C55040;
      v10 = &v12;
      id v9 = v4;
      [v6 nextTypologyURL:v8];
    }
    while (!*((unsigned char *)v13 + 24));
  }

  _Block_object_dispose(&v12, 8);
}

void __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TYALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_cold_1(v3);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    id v5 = a3;
    id v6 = a2;
    uint64_t v7 = [[TYATypologyURLHandle alloc] initWithURL:v6 sandboxExtensionToken:v5];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)removeTypologyFileWithURLHandle:(id)a3 error:(id *)a4
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v6 = a3;
  uint64_t v7 = [(TYATypologyAccessClient *)self connection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__TYATypologyAccessClient_removeTypologyFileWithURLHandle_error___block_invoke;
  v14[3] = &unk_264C55018;
  v14[4] = &v19;
  v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];

  id v9 = [v6 filename];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__TYATypologyAccessClient_removeTypologyFileWithURLHandle_error___block_invoke_20;
  v13[3] = &unk_264C55068;
  v13[4] = &v15;
  v13[5] = &v19;
  [v8 removeTypologyFileWithName:v9 completion:v13];

  if (a4)
  {
    v10 = (void *)v20[5];
    if (v10) {
      *a4 = v10;
    }
  }
  char v11 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __65__TYATypologyAccessClient_removeTypologyFileWithURLHandle_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = TYALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_cold_1(v4);
  }

  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __65__TYATypologyAccessClient_removeTypologyFileWithURLHandle_error___block_invoke_20(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (void)_setTypologyAccessMode:(unint64_t)a3
{
  id v4 = [(TYATypologyAccessClient *)self connection];
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_0];

  [v5 setTypologyAccessMode:a3];
}

void __50__TYATypologyAccessClient__setTypologyAccessMode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TYALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_cold_1(v2);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)removeAllTypologyFilesWithError:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__TYATypologyAccessClient_TestSupport__removeAllTypologyFilesWithError___block_invoke;
  v7[3] = &unk_264C550B0;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  [(TYATypologyAccessClient *)self enumerateTypologyLogs:v7];
  if (a3)
  {
    id v4 = (void *)v9[5];
    if (v4) {
      *a3 = v4;
    }
  }
  char v5 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __72__TYATypologyAccessClient_TestSupport__removeAllTypologyFilesWithError___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1[5] + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    id v4 = (void *)a1[4];
    uint64_t v5 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v5 + 40);
    char v6 = [v4 removeTypologyFileWithURLHandle:a2 error:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    uint64_t v2 = *(void *)(a1[5] + 8);
  }
  else
  {
    char v6 = 0;
  }
  *(unsigned char *)(v2 + 24) = v6;
}

- (BOOL)writeData:(id)a3 toTypologyFileWithName:(id)a4 error:(id *)a5
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(TYATypologyAccessClient *)self connection];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __79__TYATypologyAccessClient_TestSupport__writeData_toTypologyFileWithName_error___block_invoke;
  v20[3] = &unk_264C55018;
  v20[4] = &v21;
  char v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v20];

  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__TYATypologyAccessClient_TestSupport__writeData_toTypologyFileWithName_error___block_invoke_42;
  v15[3] = &unk_264C55068;
  v15[4] = &v21;
  v15[5] = &v16;
  [v11 writeData:v9 toTypologyFileWithName:v8 completion:v15];

  if (a5)
  {
    uint64_t v12 = (void *)v22[5];
    if (v12) {
      *a5 = v12;
    }
  }
  char v13 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __79__TYATypologyAccessClient_TestSupport__writeData_toTypologyFileWithName_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TYALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  char v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __79__TYATypologyAccessClient_TestSupport__writeData_toTypologyFileWithName_error___block_invoke_42(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __49__TYATypologyAccessClient_enumerateTypologyLogs___block_invoke_cold_1(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23546D000, v2, v3, "Remote object proxy error: %{private}s", v4, v5, v6, v7, v8);
}

@end