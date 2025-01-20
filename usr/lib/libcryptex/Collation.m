@interface Collation
- (Collation)init;
- (CollationCore)ccore;
- (NSString)coll_description;
- (OS_dispatch_queue)dq;
- (OS_os_log)log;
- (OS_xpc_object)client_con;
- (OS_xpc_object)endpoint;
- (__CFDictionary)package;
- (id)getValidPaths:(id)a3 forLabels:(id)a4;
- (id)initForUser:(unsigned int)a3;
- (id)mountPointOfBundleID:(id)a3;
- (void)package;
- (void)setCcore:(id)a3;
- (void)setClient_con:(id)a3;
- (void)setColl_description:(id)a3;
- (void)setDq:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation Collation

- (Collation)init
{
  uint64_t v3 = getuid();

  return (Collation *)[(Collation *)self initForUser:v3];
}

- (id)initForUser:(unsigned int)a3
{
  v25.receiver = self;
  v25.super_class = (Class)Collation;
  v4 = [(Collation *)&v25 init];
  if (!v4)
  {
LABEL_6:
    v21 = v4;
    goto LABEL_10;
  }
  os_log_t v5 = os_log_create("com.apple.libcryptex", "collations");
  [(Collation *)v4 setLog:v5];

  dispatch_queue_t v6 = dispatch_queue_create("com.apple.security.libcryptex.collations", 0);
  [(Collation *)v4 setDq:v6];

  v7 = collation_interface_request_endpoint_for_user();
  [(Collation *)v4 setEndpoint:v7];

  v8 = [(Collation *)v4 endpoint];

  if (v8)
  {
    v9 = [(Collation *)v4 endpoint];
    xpc_connection_t v10 = xpc_connection_create_from_endpoint(v9);
    [(Collation *)v4 setClient_con:v10];

    v11 = [(Collation *)v4 client_con];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __25__Collation_initForUser___block_invoke;
    handler[3] = &unk_264470DA8;
    v12 = v4;
    v24 = v12;
    xpc_connection_set_event_handler(v11, handler);

    v13 = [(Collation *)v12 client_con];
    v14 = [(Collation *)v12 dq];
    xpc_connection_set_target_queue(v13, v14);

    v15 = [(Collation *)v12 client_con];
    xpc_connection_activate(v15);

    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_string(empty, "command", "package");
    v17 = [(Collation *)v12 client_con];
    xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(v17, empty);

    if (v18)
    {
      v19 = xpc_dictionary_get_value(v18, "package");
      v20 = (void *)[objc_alloc(MEMORY[0x263F8C3C8]) initWithXPC:v19];
      [(Collation *)v12 setCcore:v20];
    }
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    -[Collation initForUser:](a3);
  }
  v21 = 0;
LABEL_10:

  return v21;
}

void __25__Collation_initForUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x223C12420]();
  if (v4 == MEMORY[0x263EF8708])
  {
    os_log_t v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21DAF1000, v5, OS_LOG_TYPE_DEFAULT, "Received message %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v4 == MEMORY[0x263EF8720])
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
    os_log_t v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __25__Collation_initForUser___block_invoke_cold_1((uint64_t)string, v5);
    }
  }
  else
  {
    os_log_t v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __25__Collation_initForUser___block_invoke_cold_2(v5);
    }
  }
}

- (__CFDictionary)package
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = [(Collation *)self ccore];
  id v3 = [v2 packToXPC];
  uint64_t v4 = (__CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();

  if (!v4) {
    [(Collation *)&v6 package];
  }
  return v4;
}

- (id)mountPointOfBundleID:(id)a3
{
  id v4 = a3;
  os_log_t v5 = [(Collation *)self ccore];
  uint64_t v6 = [v5 mountPointOfBundleID:v4];

  return v6;
}

- (id)getValidPaths:(id)a3 forLabels:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(Collation *)self ccore];
  uint64_t v9 = [v8 getValidPaths:v7 forBundleID:v6];

  return v9;
}

- (CollationCore)ccore
{
  return self->_ccore;
}

- (void)setCcore:(id)a3
{
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (OS_xpc_object)client_con
{
  return self->_client_con;
}

- (void)setClient_con:(id)a3
{
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSString)coll_description
{
  return self->_coll_description;
}

- (void)setColl_description:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coll_description, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_client_con, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_ccore, 0);
}

- (void)initForUser:(int)a1 .cold.1(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21DAF1000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "No endpoint for user %d", (uint8_t *)v1, 8u);
}

void __25__Collation_initForUser___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21DAF1000, a2, OS_LOG_TYPE_ERROR, "Client message returned error %s", (uint8_t *)&v2, 0xCu);
}

void __25__Collation_initForUser___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21DAF1000, log, OS_LOG_TYPE_ERROR, "Unknown XPC type", v1, 2u);
}

- (void)package
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

@end