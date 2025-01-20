@interface PPSClientRegistrationHelper
- (BOOL)permissionsForSubsystem:(id)a3 category:(id)a4;
- (NSXPCConnection)connectionToServer;
- (id)createXPCConnection;
- (void)closeXPCConnection;
- (void)setConnectionToServer:(id)a3;
@end

@implementation PPSClientRegistrationHelper

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = logHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_9_cold_1(v2, v3);
  }
}

- (BOOL)permissionsForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_is_darwinos())
  {
    BOOL v8 = 0;
  }
  else
  {
    v9 = [(PPSClientRegistrationHelper *)self createXPCConnection];
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__PPSClientRegistrationHelper_permissionsForSubsystem_category___block_invoke;
    v11[3] = &unk_1E5A45F58;
    v11[4] = &v12;
    [v9 checkPermissionForSubsystem:v6 category:v7 withReply:v11];
    [(PPSClientRegistrationHelper *)self closeXPCConnection];
    BOOL v8 = *((unsigned char *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }
  return v8;
}

- (void)closeXPCConnection
{
}

- (id)createXPCConnection
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.PerfPowerTelemetryClientRegistrationService"];
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v3;

  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF455430];
  [(NSXPCConnection *)self->_connectionToServer setRemoteObjectInterface:v5];

  [(NSXPCConnection *)self->_connectionToServer setInterruptionHandler:&__block_literal_global_1];
  [(NSXPCConnection *)self->_connectionToServer setInvalidationHandler:&__block_literal_global_8];
  [(NSXPCConnection *)self->_connectionToServer resume];
  id v6 = logHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A11A5000, v6, OS_LOG_TYPE_INFO, "Spinning up XPC service", v9, 2u);
  }

  id v7 = [(NSXPCConnection *)self->_connectionToServer synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_12];
  return v7;
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_6()
{
  v0 = logHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A11A5000, v0, OS_LOG_TYPE_INFO, "Client Permission check completed. Invalidating XPC Connection.", v1, 2u);
  }
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_9_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 description];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A11A5000, a2, OS_LOG_TYPE_ERROR, "Connection error: %@", (uint8_t *)&v4, 0xCu);
}

- (void).cxx_destruct
{
}

uint64_t __64__PPSClientRegistrationHelper_permissionsForSubsystem_category___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke()
{
  v0 = logHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_cold_1(v0);
  }
}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A11A5000, log, OS_LOG_TYPE_ERROR, "Connection was interrupted.", v1, 2u);
}

@end